aws s3 cp mct.html  s3://devlinker.com/mct.html
aws s3api put-object-acl --bucket devlinker.com --key mct.html --acl public-read
