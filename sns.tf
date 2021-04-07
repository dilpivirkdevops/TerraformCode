resource "aws_sns_topic" "this" {
  name = "aws-console-logins"

  provisioner "local-exec" {
        command = "aws --no-verify-ssl sns subscribe --topic-arn ${self.arn} --protocol ${var.protocol} --notification-endpoint ${var.notification_endpoint}"
    }
}

resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.this.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}
data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.this.arn]
  }
}


