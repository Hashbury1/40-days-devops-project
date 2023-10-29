# where my VPC flow logs are being stored 
resource "aws_cloudwatch_log_group" "cloudwatch" {
  name = "/flow-logs" # The name of your log group
}


# cloudwatch metric fliter
resource "aws_cloudwatch_log_metric_filter" "unauthorized_actions_filter" {
  name           = "UnauthorizedActionsFilter"
  pattern        = "\"Exception:\""
  log_group_name = aws_cloudwatch_log_group.cloudwatch.name



  metric_transformation {
    name      = "UnauthorizedActionsMetric"
    namespace = "Yourspace"
    value     = 1
    unit      = "Count"
  }
}


# create config for cloudwatch metric
resource "aws_cloudwatch_metric_alarm" "unauthorized_actions_alarm" {
  alarm_name          = "UnauthorizedActionsAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "UnathorizedActions"
  namespace           = "AWS/CloudTrail"
  period              = 300
  statistic           = "SampleCount"
  threshold           = 1
  alarm_description   = "Alarm for Unauthorized Actions in CloudTrail Logs"

  dimensions = {
    MetricName = "EventName"
  }
}


# create SNS topic for alarm
resource "aws_sns_topic" "unauthorized_actions_topic" {
  name = "Unauthorized"
}

# SNS topic subscription
resource "aws_sns_topic_subscription" "cloudwatch_alarm_subscription" {
  topic_arn = aws_sns_topic.unauthorized_actions_topic.arn
  protocol  = "email" # You can choose other protocols like SMS, etc.
  endpoint  = "efefiomarchibong@gmail.com"
}
