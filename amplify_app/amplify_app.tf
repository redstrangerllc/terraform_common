variable "domain"   {}
variable "app_repo" {}

resource "aws_amplify_app" "amplify_app" {
  name = "app"
  repository = var.app_repo

  # Setup redirect from https://example.com to https://www.example.com
  custom_rule {
    source = "https://${var.domain}"
    status = "302"
    target = "https://www.${var.domain}"
  }
}

resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.aplify_app.id
  branch_name = "master"
}

resource "aws_amplify_domain_association" "amp_domain_assoc" {
  app_id      = aws_amplify_app.amplify_app.id
  domain_name = var.domain

  # https://example.com
  sub_domain {
    branch_name = aws_amplify_branch.master.branch_name
    prefix      = ""
  }

  # https://www.example.com
  sub_domain {
    branch_name = aws_amplify_branch.master.branch_name
    prefix      = "www"
  }
}