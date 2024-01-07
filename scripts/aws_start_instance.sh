INSTANCE_ID=i-0647434567926d093
INSTANCE_ID=$(aws ec2 describe-instances --query "Reservations[?Instances[?Tags[?Key=='mchost'].Value|[0]=='true']].Instances[0].InstanceId|[0]" --output text)
aws ec2 start-instances --instance-ids $INSTANCE_ID

