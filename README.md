# Three-tier-architecture-in-azure-using-Terraform

# Three-Tier Architecture Overview
Three-tier architecture is a widely recognized software application structure that categorizes applications into three logical and physical tiers: the presentation tier (user interface), the application tier (data processing), and the data tier (data storage and management).

# What is Terraform ?
Terraform is an open-source infrastructure-as-code tool developed by HashiCorp. It enables users to define and provision data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL) or optionally JSON.

# Problem Statement
Make a single virtual network that has three subnets. One virtual machine will be hosted by each subnet. The first virtual computer simply allows internet traffic to enter. The first virtual computer can send traffic to the second virtual machine, which can respond to it. The database is unable to connect to the web, yet the application and database can connect to one other.

# Solution
The Terraform resources are structured as follows:

- main.tf: Primary entry point for Terraform resources.
- vars.tf: Declarations for variables.
- output.tf: Declarations for outputs.
- terraform.tfvars: File to pass Terraform variable values.


Note (Modular approach will be used)

# Follow these steps for deployment:

1. terraform init (Initializes a working directory containing Terraform configuration files.)
2. terraform plan  (Creates an execution plan.)
3. terraform validate (Validates the configuration files, referring only to the configuration without accessing remote services)
4. terraform apply (Applies the changes required to reach the desired state of the configuration.)


