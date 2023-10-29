# where my VPC flow logs are being stored 
resource "aws_cloudwatch_log_group" "cloudwatch" {
  name = "/flow-logs" # The name of your log group
}

resource "aws_cloudwatch_log_metric_filter" "unauthorized_actions_filter" {
  name           = "UnauthorizedActionsFilter"
  pattern        = "{ ($.errorCode = 'AccessDenied') || ($.errorCode = 'UnauthorizedOperation') || ($.errorCode = 'AuthFailure') }"
  log_group_name = aws_cloudwatch_log_group.cloudwatch.name
}

