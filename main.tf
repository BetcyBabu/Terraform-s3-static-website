#Creating s3 bucket

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  acl    = "public-read"
  #Granting read-only permission to an anonymous user
  policy = templatefile("policy.json", {bucketName=var.bucket})
  website {

    index_document = "index.html"
  }

  tags = {
    Name        = "${var.project}-bucket"
    Project     = "var.project"
  }
}

#Uploading files to a bucket

resource "aws_s3_bucket_object" "static_files" {
  for_each = module.template_files.files

  bucket       = aws_s3_bucket.bucket.id
  key          = each.key
  content_type = each.value.content_type
  source  = each.value.source_path
  content = each.value.content
  etag = each.value.digests.md5
}
output website {

    value = aws_s3_bucket.bucket.website_endpoint
}
