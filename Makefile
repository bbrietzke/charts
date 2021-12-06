
DOC := $(shell which mkdocs)
HELM := $(shell which helm)

docs: $(DOC)
	$(DOC) gh-deploy