import 'package:flutter_aws_s3_client/flutter_aws_s3_client.dart';
import 'package:flutter/material.dart';

void main() async {
  final region = "eu-central-1";
  final AwsS3Client s3client = AwsS3Client(
      region: "eu-central-1",
      bucket: "bucketid.$region.amazonaws.com",
      accessKey: "<your access key>",
      secretKey: "<your secret key>");

  var listBucketResult =
      await s3client.listObjects(prefix: "dir/dir2/", delimiter: "/");
  print(listBucketResult.toString());

  final response = await s3client.getObject("at/3/drugs_at.sqlite");
  print(response.body.toString());

  runApp(Text(response.body));
}
