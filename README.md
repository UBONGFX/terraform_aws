# Terraform_ansible_aws

This simple project is a `Terraform` module for provisioning infrastructure in combination with `ansible` on `AWS`. It is provisioning a `dev` and a `prod` enviroment. 

## Features
- Creates a security group.
- Creates an EC2 instance.
- Configures the EC2 instance with ansible.
- Includes a sample application.

## Installation
In order to use the terraform_aws repository, you will need the following:
- [Terraform](https://www.terraform.io/downloads.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- AWS account

Then 1. Clone the repository:
```bash
git clone https://github.com/UBONGFX/terraform_aws.git
```

## Usage
1. cd in the dev or prod directory
```bash
cd dev
```
2. Initialize Terraform:
```bash
terraform init
```
3. Apply the Terraform configuration:
```bash
terraform apply
```

## Inputs
| Name | Description | Type | Default |
|------|-------------|------|---------|
| EC2 Name | The Name for the EC2 instance. | string | - |
| ami | The ID of the AMI to use for the EC2 instance. | string | - |
| instance_type | The type of EC2 instance to launch. | string | `t2.micro` |
| security_group_name | The name of the security group. | string | - |
| ssh_user | The user of the EC2 instance used for the instance ssh. | string | `ubuntu` |
| key_name | The name of the EC2 Key Pair to use for the instance. | string | - |
| private_key_path | The local filepath to connect to the EC2 instance. | string | - |

## Outputs
| Name | Description |
|------|-------------|
| ec2_public_ip | The public IP address of the EC2 instance. |

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
- This project is licensed under the [MIT License](https://choosealicense.com/licenses/mit/)

## Authors
- The creator of this project is [ubonGFX](https://github.com/UBONGFX)