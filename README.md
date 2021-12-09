# Hosting a Secure Static Website on AWS S3 using Terraform

Terraform is a tool for building infrastructure with a variety of technologies, including Amazon AWS, Microsoft Azure, Google Cloud and vSphere. Here is a simple document on how to use Teraform to make s3-static-website.


## Prerequisites

- [AWS Access Key and Secret Key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)
- [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)
- [Install Git](https://github.com/git-guides/install-git)

## Usage

- Clone the repo

```
git clone https://github.com/BetcyBabu/Terraform-s3-static-website.git
cd Terraform-s3-static-website
terraform init
terraform apply
```


> Update the region, AWS access key, secret key in the provider.tf file, project name, s3 bucket name, and the location of the website files in the variables.tf file.

Here I'm using [Terraform Template Directory Module](https://registry.terraform.io/modules/hashicorp/dir/template/latest) to gathers all of the files under a particular base directory and [for_each](https://www.terraform.io/docs/language/meta-arguments/for_each.html)to uploading files to Amazon S3.

Alternatively, you can use the awscli commands with null_resource provisioner.

```
resource "null_resource" "upload_to_s3" {
  provisioner "local-exec" {
    command = "aws s3 sync ${var.websiteFiles} s3://${aws_s3_bucket.bucket.id}"
  }
}
```





