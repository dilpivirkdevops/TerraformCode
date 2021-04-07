resource"aws_cloudwatch_metric_alarm""memory"{
  alarm_name = "memory-utilization-alarm21q"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name = "mem_used_percent"
  namespace = "CWAgent"
  period = "300"
  statistic = "Average"
  threshold = "80"
  alarm_description = "This metric monitors ec2 memory utilization"
  alarm_actions =  [aws_sns_topic.this.arn]

  dimensions = {
    InstanceId = "aws_instance.my_test_instancee.instance_id"
    ImageId = "aws_instance.my_test_instance.ami_id"
    InstanceType = "aws_instance.my_test_instance.instance_type"
  }
  
    }
    
   