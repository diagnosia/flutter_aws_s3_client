import 'package:amazon_cognito_identity_dart/sig_v4.dart';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

import '../model/list_bucket_result.dart';
import '../model/list_bucket_result_parker.dart';

class AwsS3Client {
  final String _secretKey;
  final String _accessKey;
  final String _bucketUrl;
  final String _region;
  final String _sessionToken;

  static const _service = "s3";

  AwsS3Client(
      {String secretKey,
      String accessKey,
      String bucket,
      String region,
      String sessionToken})
      : _accessKey = accessKey,
        _secretKey = secretKey,
        _bucketUrl = bucket,
        _region = region,
        _sessionToken = sessionToken;

  Future<ListBucketResult> listObjects(
      {String prefix, String delimiter, int maxKeys}) async {
    final response = await _doSignedGetRequest(path: "/", queryParams: {
      "list-type": "2",
      if (prefix != null) "prefix": prefix,
      if (delimiter != null) "delimiter": delimiter,
      if (maxKeys != null) "maxKeys": maxKeys.toString(),
    });

    return _parseListObjectResponse(response.body);
  }

  Future<Response> getObject(String key) {
    return _doSignedGetRequest(
        path: "${'/$key'.split('/').map(Uri.encodeComponent).join('/')}");
  }

  ///Returns a [SignedRequestParams] object containing the uri and the HTTP headers
  ///needed to do a signed GET request to AWS S3. Does not actually execute a request.
  ///You can use this method to integrate this client with an HTTP client of your choice.
  SignedRequestParams buildSignedGetParams(
      {String path, Map<String, String> queryParams}) {
    final uri = Uri.https(_bucketUrl, path, queryParams);
    final payload = SigV4.hashCanonicalRequest('');
    final datetime = SigV4.generateDatetime();
    final credentialScope =
        SigV4.buildCredentialScope(datetime, _region, _service);

    final canonicalQuery = SigV4.buildCanonicalQueryString(queryParams);
    final canonicalRequest = '''GET
${uri.path}
$canonicalQuery
host:$_bucketUrl
x-amz-content-sha256:$payload
x-amz-date:$datetime
x-amz-security-token:${_sessionToken ?? ""}

host;x-amz-content-sha256;x-amz-date;x-amz-security-token
$payload''';

    final stringToSign = SigV4.buildStringToSign(datetime, credentialScope,
        SigV4.hashCanonicalRequest(canonicalRequest));
    final signingKey =
        SigV4.calculateSigningKey(_secretKey, datetime, _region, _service);
    final signature = SigV4.calculateSignature(signingKey, stringToSign);

    final authorization = [
      'AWS4-HMAC-SHA256 Credential=$_accessKey/$credentialScope',
      'SignedHeaders=host;x-amz-content-sha256;x-amz-date;x-amz-security-token',
      'Signature=$signature',
    ].join(',');

    return SignedRequestParams(uri, {
      'Authorization': authorization,
      'x-amz-content-sha256': payload,
      'x-amz-date': datetime,
    });
  }

  Future<Response> _doSignedGetRequest({
    String path,
    Map<String, String> queryParams,
  }) async {
    final SignedRequestParams params =
        buildSignedGetParams(path: path, queryParams: queryParams);
    return get(params.uri, headers: params.headers);
  }
}

class SignedRequestParams {
  final Uri uri;
  final Map<String, String> headers;

  const SignedRequestParams(this.uri, this.headers);
}

/// aws s3 list bucket response string -> [ListBucketResult] object,
/// this function should be called via [compute]
ListBucketResult _parseListObjectResponse(String responseXml) {
  //parse xml
  final Xml2Json myTransformer = Xml2Json();
  myTransformer.parse(responseXml);
  //convert xml to json
  String json = myTransformer.toParker();
  //parse json to src.model objects
  ListBucketResult parsedObj = ListBucketResultParker.fromJson(json).result;

  return parsedObj;
}
