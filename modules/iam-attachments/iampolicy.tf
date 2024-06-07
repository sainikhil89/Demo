resource "aws_iam_policy" "policy-permissions" {
    name = "${var.policyname}"
    #path = "/"


policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement":  [
{
   "Action": [
      "ec2:Describe*",
      "S3:*"
   ],
       "Effect": "Allow",
       "Resource": "*"

  }
]
}
EOF
}

#policy attached to ec2

resource "aws_iam_policy_attachment" "test-attach" {
    name = "test-attachment"
    roles = ["${var.attachroles}"]
    policy_arn =  aws_iam_policy.policy-permissions.arn
}
  
