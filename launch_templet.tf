 resource "aws_launch_template" "demo_TL" {
    
   image_id = data.aws_ami.ami.id
   instance_type = "t3.micro"
   vpc_security_group_ids = [ aws_security_group.templet_sg.id ]
   user_data = base64encode(<<-EOF
   #!/bin/bash

   sudo apt update

   sudo systemctl start nginx

   aws s3 sync s3://${aws_s3_bucket.s3.bucket} /var/www/html

   EOF
    )

   iam_instance_profile  {
    name = aws_iam_instance_profile.instance_profile.name
   }
   
 }
 

  
