resource "aws_cloudtrail" "example" {
  name                         = "example-cloudtrail"
  s3_bucket_name               = "your-s3-bucket-name"
  include_global_service_events = true  # Set to true to include global services

  event_selector {
    read_write_type = "All"  # Options: All, Read-only, Write-only
  }

  # Add other event selectors as needed

  # Optionally, define tags for your CloudTrail
  tags = {
    Environment = "Production"
    Application = "MyApp"
  }
}
