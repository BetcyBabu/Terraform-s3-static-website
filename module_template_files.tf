module "template_files" {
  source = "hashicorp/dir/template"

  base_dir = "${var.websiteFiles}"
  
}