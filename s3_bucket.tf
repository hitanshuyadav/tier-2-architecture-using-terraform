resource "aws_s3_bucket" "s3" {
    bucket = "hitanshu-hit-bucket${random_id.rand_id.hex}"
  
}
resource "random_id" "rand_id" {
    byte_length = 5
}

resource "aws_s3_bucket_website_configuration" "web_conf" {
    bucket = aws_s3_bucket.s3.id
    index_document {
      suffix = "index.html"
    }
  
}
 
resource "aws_s3_object" "object" {
    bucket = aws_s3_bucket.s3.id
    source = "./index.html"
    key = "index.html"
    content_type = "text/html"
  
}
resource "aws_s3_object" "object1" {
    bucket = aws_s3_bucket.s3.id
    source = "./style.css"
    key = "style.css"
    content_type = "text/css"
  
}
resource "aws_s3_object" "object2" {
    bucket = aws_s3_bucket.s3.id
    source = "./app.js"
    key = "app.js"
    content_type = "text/js"
  
}