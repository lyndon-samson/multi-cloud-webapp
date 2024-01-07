AMI=$1

echo "Creating an AWS EC2"

#aws ec2 create-key-pair --key-name "project1" > key.json

TAGS='ResourceType=instance,Tags=[{Key=mchost,Value=true}]' 

aws ec2 run-instances --iam-instance-profile Arn=arn:aws:iam::509143085503:instance-profile/SuperUser --tag-specification "$TAGS" --image-id $AMI --subnet-id subnet-c6a1d0a2 --instance-type t2.micro  --associate-public-ip-address  --key-name "project1"


