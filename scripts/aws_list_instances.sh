
aws ec2 describe-instances --query "Reservations[*].Instances[*].{InstanceId:InstanceId,State:State.Name,Name:Tags[?Key=='Name'].Value|[0],LaunchTime:LaunchTime,mchost:Tags[?Key=='mchost'].Value|[0]}" --output table --color off

