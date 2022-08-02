.PHONY: work home docs test image

DOC := $(shell which mkdocs)
HELM := $(shell which helm)

VOLUMES_TGZ := docs/charts/volumes*.tgz
MINIO_TGZ := docs/charts/minio*.tgz

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