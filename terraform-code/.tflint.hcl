plugin "aws" {
    enabled = true
    #deep_check = true
    version = "0.17.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}


plugin "terraform" {
  enabled = true
  preset  = "recommended"
}
