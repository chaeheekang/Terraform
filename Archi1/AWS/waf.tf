# IP set Creation for WAF
resource "aws_wafv2_ip_set" "seoul_waf_ip_set" {
  name               = "seoul_waf_ip_set"
  description        = "Block Bad Bot IPV4 addresses"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = []
}
# WebACL (AWS WAF)
resource "aws_wafv2_web_acl" "seoul_wafacl" {
  count       = length(var.vpc_ids)
  name        = "waf-acl-seoul${count.index + 1}"
  description = "AWS WAF WebACL for seoul1_alb"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "rule-1"
    priority = 1

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"

        rule_action_override {
          action_to_use {
            count {}
          }

          name = "SizeRestrictions_QUERYSTRING"
        }

        rule_action_override {
          action_to_use {
            count {}
          }

          name = "NoUserAgent_HEADER"
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "friendly-rule-metric-name"
      sampled_requests_enabled   = false
    }
  }


  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "friendly-metric-name"
    sampled_requests_enabled   = false
  }
}
# resource "aws_wafv2_web_acl_association" "waf_acl_association" {
#   count            = length(var.vpc_ids)
#   web_acl_arn      = aws_wafv2_web_acl.seoul_wafacl[count.index].arn
#   resource_arn     = aws_ec2_transit_gateway.transit_gateway.arn
# }

