output "vpc_id" {
  value = aws_vpc.main.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "s3_bucket_name" {
  value = aws_s3_bucket.project_fly_bucket.bucket
}

output "ecr_repository_url" {
  value = aws_ecr_repository.project_fly_repository.repository_url
}
