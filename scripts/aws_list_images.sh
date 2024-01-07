
aws ec2 describe-images  --query "sort_by(Images[?starts_with(Name,'debian-12-amd64')],&CreationDate)[*].{CreationDate:CreationDate,ImageId:ImageId,Name:Name}" --output table --color off
