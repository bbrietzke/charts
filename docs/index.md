# Welcome to Charts

This is a collection of helm charts that I've worked on for my Kubernetes cluster at home.

## Using the Charts
```
helm repo add bbrietzke http://bbrietzke.github.io/charts
```

## Chart Layout
* __volumes__: creates 3 10Gi volumes, 4 100Gi volumes and 3 20Gi volumes.  Also can create local volumes.
* __namespaces__: creates three namespaces, prod, dev and infra
* __jenkins__: sets up a good ol' fashioned jenkins server
* __mastodon__: fork of the mastodon social networking application

## Finding values
You can always execute something like the below to find out what values you can apply:

```
helm show values bbrietzke/jenkins 
```

Redirect the above to a file and then edit to your own delight.

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
* __namespaces__: adds a _dev_, _infra_, and _prod_ namespace to the cluster


