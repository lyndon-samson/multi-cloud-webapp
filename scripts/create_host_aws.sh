AMI=$1

echo "Creating an AWS EC2"


aws ec2 create-key-pair --key-name "project1" > key.json


aws ec2 run-instances --image-id $AMI --subnet-id subnet-c6a1d0a2 --instance-type t2.micro  --associate-public-ip-address  --key-name "project1"


