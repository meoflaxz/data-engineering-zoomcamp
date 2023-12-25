#### - **Terraform** is a **Infrastructure as Code (IAC)** that helps provision infra. Let's say them as way of codfying infra so you can reproduce them again. [Official Site](https://developer.hashicorp.com/terraform)

#### - To install Terraform, head over to their download [site](https://developer.hashicorp.com/terraform/install?product_intent=terraform) and pick your platform.

#### - After extracting the zip, make sure to set the Terraform **PATH** correctly in your environment variables. 

#### - Initiate your terraform project with <code>terraform init</code>. This will create several files and config in where your initialized your terraform. [Docs](https://developer.hashicorp.com/terraform/cli/commands/init)

#### - The primary config file of Terraform is labelled as <code>main.tf</code>. This file consists of blocks that acts as way to define and configure diff aspects of your infra.

#### - <code>main.tf</code> will be assisted with <code>variables.tf</code> that passes the required variable. You can see in the code itself.

#### - <code>terraform plan</code> is used to provision and see changes between your code and the infra itself. This will be useful if there are unknowingly changes in the infra that you don't provision in the code. Primarily this will used to preview changes in the code before applying to your infra. [Docs](https://developer.hashicorp.com/terraform/cli/commands/plan)    

#### - <code>terraform apply</code> is used when you want to actually apply proposed actions or just simply build the infra. This is the main magic of Terraform. It helps build effortlessly and repeatedly. [Docs](https://developer.hashicorp.com/terraform/cli/commands/apply)

#### - <code>terraform destroy</code> is reverse from <code>terraform apply</code>. Used when you want to destory all objects that Terraform builds. [Docs](https://developer.hashicorp.com/terraform/cli/commands/destroy)




