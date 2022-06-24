.PHONY: work home docs test image

DOC := $(shell which mkdocs)
HELM := $(shell which helm)

VOLUMES_TGZ := docs/charts/volumes*.tgz

publish: $(DOC)
	$(DOC) gh-deploy

volumes: $(HELM) $(VOLUMES_TGZ)
	$(HELM) package volumes
	mv volumes*.tgz docs/charts

index: $(HELM) volumes
	$(HELM) repo index docs/