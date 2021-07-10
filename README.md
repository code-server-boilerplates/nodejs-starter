# Boilerplate for Node.js-based projects

This deploy-code-server template uses the `starter-pack` GHCR image as its base image in developing this starter. Includes Prettier, Typescript support and even CLIs by Vercel.

## Tools Included

* Everything in `starter-pack`, plus:
  * Node.js 14.x LTS, through Node Version Manager
  * Latest versions of Yarn and npmjs
  * Railway CLI, Heroku CLI, Vercel CLI, you name it.
  * Eslint and Prettier for linting and formatting
  * Commitlint and Commitizen for commit message format enforcement
  * Miscellaneous stuff like `@vercel/ncc`, `@vercel/pkg` and `npkill`

## Checklist for new template maintainers

_This checklist is based on [our Kubernetes/Cloud-Native starter](https://github.com/code-server-boilerplates/starter-pack-as-base-image), so this might be not accurate if you use this repo for your next template._

<!-- these links will work soon -->
[base-images-list]: https://csb-docs.community-lores.gq/starter-pack/making-templates-using-base-images#picking-different-image

* [X] Duplicate this repo or [generate as new repo](https://github.com/code-server-boilerplates/starter-pack-as-base-image) to get started.
Don't forget to complete [the post-repo creation/generation checklist](https://cdrs-docs.rtapp.tk/checklists-prc) to setup GH Actions, Docker Hub/RHQCR/GHCR logins and Mergify.
* [X] Change any references to this template with your own.
* [ ] Customize the Dockerfile to include the tools needed. Feel free to switch between base images if needed (or even build your own).
* [ ] In `charts/Chart.yml`, reset the version to `0.1.0` and change the chart name into your repo name (the one after `owner-username-here/` part).
* [ ] Tag your changes as v0.1.0 (with `git tag -a -m "v0.1.0 - Initial version" -s`, which requires to setup GPG signing) and publish new release using that tag (don't set it as an prerelease, or things might go brr).
* [ ] Cheers! Now, [register to the template registry](https://csb-deploy.repohubdev.tk/register) and we'll add your chart into our charts repo + activate your quick deploy links soon.

## Deploy

Deployment docs are avaiable at [this document](/DEPLOY.md), including Deploy to Railway/Okteto Cloud badges and stuff.

## License and Contributing

This repository's contents is licensed under the MIT License. By contributing to this repository, you agree to
[Developer's Certificate of Origin][dco] and [The Pins Team Community Code of conduct](CODE_OF_CONDUCT.md).

[dco]: https://developercertificate.org

To learn more how to contribute, please see [this page](CONTRIBUTING.md).
