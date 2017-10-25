
/*Region that ll be use to provide the application */
variable "region"                 { default = "us-east-1"}
/*Bucket Name that was create on cloud formation template*/
variable "bucket_name"            { default = "joujou" }

/*Instance ans autoscaling settings*/
variable "tag_name"               { default = "myinstance" }
/*Intance sizeo*/
variable "instance_type"          { default = "t2.micro" }
/* Port that will be used by the application. It is used to create the security group rules*/
variable "app_listen_port"        { default = "8080" }
/*Provisioned instance disk size, default port 8GB*/
variable "root_volume_size"       { default = 8 }

/*Autoscaling size*/
variable "asg_min_size"           { default = 1 }
variable "asg_max_size"           { default = 3 }
variable "asg_des_size"           { default = 1 }

/*ALB Settings*/

#Port used by ALB. variable used to define security group rules
variable "alb_listen_port"        { default = 80 }
/*ALB Healthcheck configuration*/
variable "hc_interval"            { default = "15" }
variable "hc_path"                { default = "/en" }
variable "hc_port"                { default = "traffic-port" }
variable "hc_protocol"            { default = "HTTP" }
variable "hc_timeout"             { default = "3" }
variable "hc_unhealthy_threshold" { default = "2" }
variable "hc_matcher"             { default = "200" }
