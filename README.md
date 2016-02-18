# Docker Oracle Java Image

This is a simple image that grabs a copy of the Oracle JDK and installs it
in /opt/jdk and sets up the links and JAVA_HOME. This image was created because
there wasn't a good image on the docker hub that had new versions and included
tags so that we could lock down to a specific version.

This repository should be automatically built by the docker hub once a tag is
pushed to github. To generate the tag run the `./tag.sh` script. This will
check your working copy is clean and the use the version information from the
Dockerfile to tag it.

If the tag looks good you should push the tag to github and have the docker hub
rebuild the image. Then update any downstream projects to use the newer tag.

The `build.sh` script builds a local copy but should just be used for testing as
it's better to have the clean environment of the docker hub make the public builds.
