# Charts
There is a _Makefile_ included that will help automate a number of the steps to publish the charts.

The typical workflow includes:

```
make index publish
```

Commands include:

* __publish__: use MkDocs to publish to `gh-pages` branch
* __volumes__: package the volumes chart and move it to the correct location
* __index__: create or update the index.yaml file
