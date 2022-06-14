# Pipeline Runner

This is the default implementation of the okteto pipeline runner image. It contains the absolute minimum dependencies needed to run pipelines in okteto as described in the [docs](https://www.okteto.com/docs/cloud/okteto-cli/#built-in-tools-when-deploying-to-okteto-cloud).

You can also create your own pipeline runner. To do that, we recommend extending our pipeline runner image:

```
FROM okteto/pipeline-runner:1.0.0

# install your own tools
```

and configure your custom image in the okteto chart values file like this:

```
backend:
  installer:
    image: okteto/pipeline-runner:1.0.0
```

replacing `okteto/pipeline-runner:1.0.0` by your own pipeline runner image.