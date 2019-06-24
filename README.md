[![Pub Package](https://img.shields.io/pub/v/flutter_aws_s3_client.svg)](https://pub.dartlang.org/packages/flutter_aws_s3_client)

# flutter_aws_s3_client

Supports downloading objects and listing objects in a bucket.

The heavy lifting was done by [Amazon Cognito Identity SDK for Dart](https://github.com/jonsaw/amazon-cognito-identity-dart),
this project contains just convenience methods for common use cases.

if you need more requests, you can use this instead to build what you need.
If you implement more methods, feel free to open a pull request.

## Usage

### Build the client


    final AwsS3Client s3client = AwsS3Client(
       region: <Region>,
       bucket: <Bucket>,
       accessKey: <AccessKey>,
       secretKey: <SecretKey>,
       sessionToken: <Optional: Session Token (if required)>
     );


### Get an object


    final response = await s3client.getObject("your/object/key"); 


### List objects of the bucket


    ListBucketResult listBucketResult =
      await s3client.listObjects(prefix: "dir1/dir2/", delimiter: "/");
    print(listBucketResult.toString());

If you want to use a custom http client, use the method `buildSignedGetParams`.
This method returns an object containing the URL and the Authorization headers, which can be 
used to build the request with your preferred http client.
