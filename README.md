# Introduction To Terraform
This repository includes Terraform Configuration Files used for labs and demo

- lab01 - How to create a text file in a local machine.

In this lab the only Terraform Configuration File available is local.tf, for the demo, you can change the parameters _filename_ and _content_ and then run the ```terraform init```, ```terraform plan```, and ```terraform apply``` commands to create the file in the local directory. Then you can change the _content_ again, run the ```terraform plan``` to show how terraform identifies that the file must be replaced.

- lab02 - How to create a text file in a local machine using variables.

In this lab there are 3 files, the main.tf very similar to the local.tf file in the lab01, and 2 more files: variables.tf that contains defitions of 2 or the 3 variables used in the main.tf file and variables.tfvars that includes the values for 2 of the 3 variables used in the main.tf file. For the demo after explain how variables work run the ```terraform init```, ```terraform plan -var-file variables.tfvars``` command, and optionally the ```terraform apply -var-file variables.tfvars``` command.

- lab03 - How to use more than one provider. One to create a local file, another to create a random password.

In this lab the main.tf file has 2 resources block, one for the random provider and one for the local provider. For demo porpuses you can run the ```terraform init```, ```terraform plan```, and ```terraform apply``` commands without any change, and then change the _content_ for something like: 

```content  ="Password: ${random_password.user_password.result} length: ${random_password.user_password.length}"```

- lab04 - How to use the ```Terraform console``` command fetching information from the variables file.

In this demo the main idea is to show how some of the terraform functions work, for that you need to use first the ```terraform console``` command, and the based on the information in the variables.tf file you can run this commands:

```lookup(var.regions_in_AWS,"USA")```
```title(lookup(var.regions_in_AWS,"USA"))```
```length(tolist(var.roles))```
```substr(lookup(var.regions_in_AWS,"USA"),3,2)```
```file("variables.tf")```

- lab05 - How to create resources on AWS.

In this demo the idea is explain the teraform resources block in the file main.tf for AWS, and then run the ```terraform init```, ```terraform plan```, and ```terraform apply``` commands, show the resources created in AWS and finally run the ```terraform destroy``` command.

**Note** You need to have the AWS CLI install and configured, see this [tutorial](https://www.youtube.com/watch?v=Rp-A84oh4G8) if you need it.

- lab06 - How to create resources in Azure.

In this demo the idea is explain the teraform resources block in the file main.tf for AZURE, and then run the ```terraform init```, ```terraform plan```, and ```terraform apply``` commands, show the resources created in AWS and finally run the ```terraform destroy``` command.

**Note** You need to have the Azure CLI install and configured, see this [tutorial](https://www.youtube.com/watch?v=tD-ixw8szIQ) if you need it. There are several ways to interact with the Azure CLI, for demostration porpuses run the ```az login``` command to authenticate with Azure is fine, but it does not work if you try to implement this solution in a pipeline, there are several ways to solve this, for example [Authenticating using a Service Principal](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)
