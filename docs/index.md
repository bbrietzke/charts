# Welcome to Charts

This is a collection of helm charts that I've worked on for my Kubernetes cluster at home.

## Using the Charts

```
helm repo add bbrietzke https://bbrietzke.github.io/charts/
```

## Chart Layout
* __volumes__: creates 3 10Gi volumes, 4 100Gi volumes and 3 20Gi volumes.  Also can create local volumes.

## Automation
There is a _Makefile_ included that will help automate a number of the steps to publish the charts.

The typical workflow includes:

```
make index publish
```

Commands include:

* __publish__: use MkDocs to publish to `gh-pages` branch
* __volumes__: package the volumes chart and move it to the correct location
* __index__: create or update the index.yaml file


