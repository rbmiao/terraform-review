variable "region" {
	default = "us-east-1"
}

variable "web_server_port" {
	description = "Port the server will use for HTTP requests server"
	default = "80"
}

## ssh port 
variable "ssh_port" {
	description = "Port the server will use for SSH login"
	default = "22"
}