Cloudsploit AWS security scanner
================================

Overview
--------

> CloudSploit scans is an open-source project designed to
> allow detection of security risks in an AWS account.
> These scripts are designed to run against an AWS account and
> return a series of potential misconfigurations and security risks.

This project builds and runs the scanner from a Docker container
but is **not associated with Cloudsploit** in any way.

[![Image Size](https://img.shields.io/imagelayers/image-size/jumanjiman/cloudsploit/latest.svg)](https://imagelayers.io/?images=jumanjiman/cloudsploit:latest 'View image size and layers')&nbsp;
[![Image Layers](https://img.shields.io/imagelayers/layers/jumanjiman/cloudsploit/latest.svg)](https://imagelayers.io/?images=jumanjiman/cloudsploit:latest 'View image size and layers')&nbsp;
[![Docker Registry](https://img.shields.io/docker/pulls/jumanjiman/cloudsploit.svg)](https://registry.hub.docker.com/u/jumanjiman/cloudsploit)&nbsp;

Project URL: [https://github.com/jumanjihouse/docker-cloudsploit](https://github.com/jumanjihouse/docker-cloudsploit)
<br />
Docker hub: [https://registry.hub.docker.com/u/jumanjiman/cloudsploit/](https://registry.hub.docker.com/u/jumanjiman/cloudsploit/)
<br />
Upstream source: [https://github.com/cloudsploit/scans](https://github.com/cloudsploit/scans)


### Build integrity

An unattended test harness runs the build script and runs simple tests.
If all tests pass on master branch in the unattended test harness,
it pushes the built images to the Docker hub.

![workflow](assets/docker_hub_workflow.png)


How-to
------

### Pull an already-built image

These images are built as part of the test harness on CircleCI.
If all tests pass on master branch, then the image is pushed
into the docker hub.

    docker pull jumanjiman/cloudsploit:latest

We push the tags automatically from the test harness, and
we occasionally delete old tags from the Docker hub by hand.


### Configure credentials and run scanner

Create a file `credentials.env` which contains read-only credentials:

    AWS_ACCESS_KEY_ID=yourkeyid
    AWS_SECRET_ACCESS_KEY=youraccesskey
    AWS_SESSION_TOKEN=
    AWS_DEFAULT_REGION=us-west-2

See [the upstream README.md](https://github.com/cloudsploit/scans#permissions)
for details about the required read-only permissions.

Then run a container like this:

    docker run --rm --read-only --env-file credentials.env cloudsploit


### Build the Docker image

Build an image locally on a host with Docker:

    script/build


Licenses
--------

Both the upstream source and this project are licensed under the
[GNU General Public License v3](LICENSE).
