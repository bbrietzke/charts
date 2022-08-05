.PHONY: work home docs test image

DOC := $(shell which mkdocs)
HELM := $(shell which helm)
EPOCH :=$(shell date +%s )

VOLUMES_TGZ := docs/charts/volumes*.tgz
MINIO_TGZ := docs/charts/minio*.tgz
HELM_TGZ := docs/charts/helmrepo*.tgz

publish: $(DOC)
	$(DOC) gh-deploy

volumes: $(HELM) $(VOLUMES_TGZ)
	$(HELM) package volumes
	mv volumes*.tgz docs/charts

minio: $(HELM) $(MINIO_TGZ)
	$(HELM) package minio
	mv minio*.tgz docs/charts

index: $(HELM) volumes minio
	$(HELM) repo index docs/

buildx: index
	mkdocs build 
	docker buildx build --platform linux/amd64,linux/arm64/v8,linux/386 --push -t bbrietzke/helm-repo:latest .
	docker buildx build --platform linux/amd64,linux/arm64/v8,linux/386 --push -t bbrietzke/helm-repo:$(EPOCH) .
	rm -rf site
