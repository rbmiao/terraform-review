provider "aws" {
	region = "${var.region}"
}

terraform {
	backend "s3" {
		bucket 			= "miao-testing-terraform-123"
		key				= "s3-object-key"
		region			= "us-east-1"
		dynamodb_table 	= "test"
	}
}

resource "aws_sqs_queue" "dan_queue" {
	name 	= "s3-backend-usecase-example-1"
}

output "QueueName" {
	value	= "${aws_sqs_queue.dan_queue.name}"
}