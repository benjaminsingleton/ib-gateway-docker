build:
	docker buildx build --push --builder cloud-benjaminsingleton-bsingleton-cloud-builder --platform linux/x86_64 -t 962960450717.dkr.ecr.us-east-1.amazonaws.com/ib-gateway:stable .