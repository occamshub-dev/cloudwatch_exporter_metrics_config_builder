python3 -V
mkdir -p cloudwatch_config_builder/files/cloudwatch_metrics
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/AutoScaling > cloudwatch_config_builder/files/cloudwatch_metrics/auto_scaling.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/Billing > cloudwatch_config_builder/files/cloudwatch_metrics/billing.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/DynamoDB > cloudwatch_config_builder/files/cloudwatch_metrics/dynamo_db.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/EBS > cloudwatch_config_builder/files/cloudwatch_metrics/ebs.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/EC2 > cloudwatch_config_builder/files/cloudwatch_metrics/ec2.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/ElastiCache > cloudwatch_config_builder/files/cloudwatch_metrics/elasti_cache.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/Events > cloudwatch_config_builder/files/cloudwatch_metrics/events.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/Lambda > cloudwatch_config_builder/files/cloudwatch_metrics/lambda.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/Logs > cloudwatch_config_builder/files/cloudwatch_metrics/logs.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/NetworkELB > cloudwatch_config_builder/files/cloudwatch_metrics/network_elb.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/RDS > cloudwatch_config_builder/files/cloudwatch_metrics/rds.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/S3 > cloudwatch_config_builder/files/cloudwatch_metrics/s3.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/TransitGateway > cloudwatch_config_builder/files/cloudwatch_metrics/transit_gateway.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/TrustedAdvisor > cloudwatch_config_builder/files/cloudwatch_metrics/trusted_advisor.json
aws --region="$1" cloudwatch list-metrics --include-linked-accounts --namespace=AWS/Usage > cloudwatch_config_builder/files/cloudwatch_metrics/usage.json
./custom_gather.sh $1 $2 # $1: REGION. $2: CUSTOM
python3 main.py
cd cloudwatch_config_builder
ansible-playbook main.yml --extra-vars "region=$1"
