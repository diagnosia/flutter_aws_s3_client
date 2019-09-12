[![Pub Package](https://img.shields.io/pub/v/flutter_aws_s3_client.svg)](https://pub.dartlang.org/packages/flutter_aws_s3_client)

# flutter_aws_s3_client

Supports downloading objects and listing objects in a bucket.

The heavy lifting was done by [Amazon Cognito Identity SDK for Dart](https://github.com/jonsaw/amazon-cognito-identity-dart),
this project contains just convenience methods for common use cases.

if you need more requests, you can use this instead to build what you need.
If you implement more methods, feel free to open a pull request.

## Usage

### Build the client

```dart
    final AwsS3Client s3client = AwsS3Client(
       region: region,
       bucket: bucket,
       accessKey: accessKey,
       secretKey: secretKey,
       sessionToken: sessionToken //optional
     );
```

### Get an object


    final response = await s3client.getObject("your/object/key"); 


### List objects of the bucket


    ListBucketResult listBucketResult =
      await s3client.listObjects(prefix: "dir1/dir2/", delimiter: "/");
    print(listBucketResult.toString());

If you want to use a custom http client, use the method `buildSignedGetParams`.
This method returns an object containing the URL and the Authorization headers, which can be 
used to build the request with your preferred http client.


### Download a large object to a file without keeping everything in-memory (streaming)

Use the `buildSignedGetParams` method.

Example code (with ETag support):

```dart

Future download(String key, File file, [String etag = null]) async {

  final signedParams = awsS3Client.buildSignedGetParams(key: key);

  final request = await HttpClient().getUrl(signedParams.uri);

  for (final header in (signedParams.headers ?? const {}).entries) {
    request.headers.add(header.key, header.value);
  }
  if(eTag != null){
    request.headers.add(HttpHeaders.ifNoneMatchHeader, eTag);
  }
  final response = response = await request.close();
  if(response.statusCode != HttpStatus.ok){
     //handle error  
  }else{
     return response.pipe(file.openWrite());
  }
}
```