# Pipeline Installer Base

## Upgrading Installer in Deployed Clusters

Once your changes are merged in master, you have to publish a new version of the image in [Docker Hub](https://hub.docker.com/orgs/okteto/repositories). To do so, you just need to create a [new release on GitHub](https://github.com/okteto/pipeline-installer-image/releases). This will trigger a circle ci job which will publish a new version of the installer image. The image tag will be the tag specified on the GitHub release and it should be the version in semver format.

Note that you are making a publicly available image so be careful not to override existing tags we could be using in prod and be careful.

Once the new image is available, you just need to update the Okteto chart value to use the new tag and follow the cloud release process.

---

## Development

Make your code changes and then build and push an image to our private google cloud registry.
See [gcloud docs](https://cloud.google.com/container-registry/docs/pushing-and-pulling) if you've not done so before.

```console
$ okteto build -t gcr.io/development-300207/installer-base:USERNAME .
```

Then, upgrade your dev environment to use the new image.

```console
make upgrade-dev UPGRADE_DEV_ARGS="--set backend.installer.image=gcr.io/development-300207/installer-base:USERNAME"
```

Or else, update the [chart value](https://github.com/okteto/app/blob/628591c36644bdf99c2478aadb43969bbe9cea68/chart/okteto-enterprise/values.yaml#L160) to the newly pushed image instead of the production default. After the chart values.yaml is updated, upgrade your dev cluster...

```
$ make upgrade-dev
```
