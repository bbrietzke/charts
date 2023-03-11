.PHONY: work home docs test image

DOC := $(shell which mkdocs)
HELM := $(shell which helm)
EPOCH :=$(shell date +%s )

VOLUMES_TGZ := docs/charts/volumes*.tgz
MINIO_TGZ := docs/charts/minio*.tgz
NAMES_TGZ := docs/charts/namespaces*.tgz
MASTODON_TGZ := docs/charts/mastodon*.tgz

$(MASTODON_TGZ): $(HELM)
	$(HELM) package -u mastodon-chart
	mv mastodon*.tgz docs/charts

$(NAMES_TGZ): $(HELM)
	$(HELM) package namespaces
	mv namespaces*.tgz docs/charts

$(MINIO_TGZ): $(HELM)
	$(HELM) package minio
	mv minio*.tgz docs/charts

$(VOLUMES_TGZ): $(HELM)
	$(HELM) package volumes
	mv volumes*.tgz docs/charts

publish: $(DOC)
	$(DOC) gh-deploy

index: $(HELM) $(VOLUMES_TGZ) $(MINIO_TGZ) $(NAMES_TGZ) $(MASTODON_TGZ)
	$(HELM) repo index docs/

buildx: index
	mkdocs build 
	docker buildx build --platform linux/amd64,linux/arm64/v8,linux/386 --push -t bbrietzke/helm-repo:latest .
	docker buildx build --platform linux/amd64,linux/arm64/v8,linux/386 --push -t bbrietzke/helm-repo:$(EPOCH) .
	rm -rf site
