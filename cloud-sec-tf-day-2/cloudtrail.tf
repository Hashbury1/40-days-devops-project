resource "aws_cloudtrail" "terra" {
  name                          = "terra-cloudtrail"
  s3_bucket_name                = "backend-terra-hash"
  s3_key_prefix                 = "cloudtrail"
  include_global_service_events = true # Set to true to include global services

  event_selector {
    read_write_type = "All" # Options: All, Read-only, Write-only
  }

  # Add other event selectors as needed

  # Optionally, define tags for your CloudTrail
  tags = {
    Environment = "Production"
    Application = "MyApp"
  }
}
