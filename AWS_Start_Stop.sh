#!/bin/bash

echo -----------------------------------------

echo Checking the Instances on AWS EC2

aws iam list-account-aliases --output table --color off

region=$(aws configure get region)

echo Your current region is: $region
echo

# List EC2 Instances
instance=$(aws ec2 describe-instances --query "Reservations[*].Instances[*].{InstanceID:InstanceId,Type:InstanceType,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" --output table --color off)

# Check Instances
if [ -z "$instance" ]; then
  echo "No Instance found"
  exit 1
fi

while true; do
  # Print EC2 Instances
  echo "List of EC2 instances:"
  instance=$(aws ec2 describe-instances --query "Reservations[*].Instances[*].{InstanceID:InstanceId,Type:InstanceType,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" --output table --color off)
  echo "$instance"

  # Ask user to choose an Instance
  read -p "Select an Instance from the list, copy and paste the InstanceID: " select
  if echo "$instance" | grep -q "$select"; then
    echo "You select $select"

    # Ask user what he want to do
    read -p "Do you need to [ start / stop / check / change ] $select: " action
    case $action in
      "start")
        echo "Starting Instance $select"
        aws ec2 start-instances --instance-ids "$select"
        sleep 5
        ;;
      "stop")
        echo "Stopping Instance $select"
        aws ec2 stop-instances --instance-ids "$select"
        sleep 5
        ;;
      "check")
        echo "Checking Instance $select"
        aws ec2 describe-instances --instance-id "$select" --query "Reservations[*].Instances[*].{Instance:InstanceId,PublicIP:PublicIpAddress,Type:InstanceType,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" --output table --color off
        sleep 5
        ;;
      "change")
         # Ask user what he want to do
         read -p "Set instance $select type to [ t3.small / t3.medium / t3.large / t3.xlarge / t3.2xlarge] size: " size
         case $size in
         "$size")
           echo "Changing Instance $select to $size"
           aws ec2 modify-instance-attribute --instance-id "$select" --instance-type "$size"
           sleep 5
           ;;
    esac
        ;;
       *)
        echo "Answer not valid"
        ;;
    esac
  else
    echo "Answer not valid"
  fi

  read -p "Do you need to do somethinbg else? [ y / n ] " continue
  if [ "$continue" != "y" ]; then
    echo "Bye"
    exit 0
  fi
done
