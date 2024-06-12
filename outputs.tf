output ami_id {
  description = "The EC2 AMD ID retrieved on data source type"
  value       = data.aws_ami.ubuntu.id
  sensitive   = false
}
