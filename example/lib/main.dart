import 'package:flutter_aws_s3_client/flutter_aws_s3_client.dart';

void main() async {
  const region = "eu-central-1";
  const bucketId = "yourBucketId";
  final AwsS3Client s3client = AwsS3Client(
      region: region,
      host: "s3.$region.amazonaws.com",
      bucketId: bucketId,
      accessKey: "<your access key>",
      secretKey: "<your secret key>");

  final listBucketResult =
      await s3client.listObjects(prefix: "dir/dir2/", delimiter: "/");
  print(listBucketResult.toString());

  final response = await s3client.getObject("yourObjectId");
  print(response.body.toString());
}
