# AWS Bash Console Script

This repository contains a Bash script called **AWS_Start_Stop.sh** that simplifies managing your AWS EC2 instances. Based on the original **AWS-DOS-CONSOLE** script, this updated version allows you to easily **run**, **stop**, and **change** the state of your AWS EC2 instances directly from the command line.

With this script, you can manage your EC2 instances without navigating through the AWS Management Console, by simply providing the **Instance ID** of the EC2 instance and specifying the desired action (start, stop, reboot, etc.). The script is designed to streamline EC2 management, making it easier and faster to control your cloud infrastructure.

## Features

- **Start/Stop Instances**: Easily start or stop any EC2 instance using its Instance ID.
- **Reboot Instances**: Quickly reboot an instance with a single command.
- **Check Instance Status**: View the current status of your EC2 instances.
- **Simplified Commands**: No need to manually input complex AWS CLI commands – this script handles everything for you.

## Prerequisites

Before using the script, ensure you have the following:

- **AWS CLI**: The AWS Command Line Interface (CLI) must be installed and configured with proper credentials.
- **Bash**: A Unix-based system with Bash shell support.

### Install AWS CLI

You can install the AWS CLI with the following commands:

```bash
# On Linux / macOS
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# On Windows
Follow the instructions on [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
```

### AWS Credentials

Make sure that you have AWS credentials set up either via `~/.aws/credentials` or using environment variables.

```bash
aws configure
```

## How to Use

1. Clone this repository:
    ```bash
    git clone https://github.com/CarloSacchi/aws-bash-console.git
    cd aws-bash-console
    ```

2. Make the script executable:
    ```bash
    chmod +x AWS_Start_Stop.sh
    ```

3. Run the script, providing the instance ID and the action you want to perform:
    ```bash
    ./AWS_Start_Stop.sh
    ```

4. Follow the prompts to choose your desired action (start, stop, reboot) and specify the EC2 Instance ID.

## License

This project is licensed under the MIT License
