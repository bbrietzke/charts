.PHONY: work home docs test image

DOC := $(shell which mkdocs)
HELM := $(shell which helm)

publish: $(DOC)
	$(DOC) gh-deploy

volumes: $(HELM)
	$(HELM) package volumes
	mv volumes*.tgz docs/charts

index: $(HELM)
	$(HELM) repo index docs/