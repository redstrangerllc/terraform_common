resource "aws_amplify_app" "example" {
  name = "app"

  # Setup redirect from https://example.com to https://www.example.com
  custom_rule {
    source = "https://example.com"
    status = "302"
    target = "https://www.example.com"
  }
}

resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.example.id
  branch_name = "master"
}

resource "aws_amplify_domain_association" "example" {
  app_id      = aws_amplify_app.example.id
  domain_name = "example.com"

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