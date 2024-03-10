include .env

dc:
	docker-compose up

gh:
	alias docker='sudo docker $@'
	git pull && make dc


docker:
	docker buildx build -t picassolano:${tag} --build-arg HUGGINGFACE_TOKEN=${HUGGINGFACE_TOKEN} .

docker-p:
	docker buildx build --platform linux/amd64 -t picassolano:${tag} --build-arg HUGGINGFACE_TOKEN=${HUGGINGFACE_TOKEN} .


dockerv1:
		docker buildx build -f Dockerfile.v1 -t picassolano:${tag} --build-arg HUGGINGFACE_TOKEN=${HUGGINGFACE_TOKEN} .

tag:
	docker tag picassolano:${tag} hrenovo/picassolano:${tag}
	docker push hrenovo/picassolano:${tag}


jobFile="./module.json"
outDir="./output"
b: 
	bacalhau create --wait  --download --wait-timeout-secs 600 --output-dir ${outDir} ${jobFile}

.PHONY: docker gh dc tag b dockerv1 tag