output "subnet_0_id" {
  description = "ID das Subnets criadas na AWS"
  value       = aws_subnet.subnet[*].id
}