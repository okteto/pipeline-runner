# Pipeline Runner

This is the default implementation of the okteto pipeline runner image. It contains the absolute minimum dependencies needed to run pipelines in okteto as described in the [docs](https://www.okteto.com/docs/cloud/okteto-cli/#built-in-tools-when-deploying-to-okteto-cloud).

You can also create your own pipeline runner. To do that, we recommend extending our pipeline runner image:

```
FROM okteto/pipeline-runner:1.0.7

# install your own tools
```

Note: ensure `/okteto` directory and its subdirectories are readable, writable and executable by the user running the pipeline runner.

and configure your custom image in the okteto chart values file like this:

```
installer:
  runner: okteto/pipeline-runner:1.0.7
```

replacing `okteto/pipeline-runner:1.0.7` by your own pipeline runner image.
