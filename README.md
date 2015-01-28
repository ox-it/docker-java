# Docker Oracle Java Image

This is a simple image that grabs a copy of the Oracle JDK and installs it
in /opt/jdk and sets up the links and JAVA_HOME. This image was created because
there wasn't a good image on the docker hub that had new versions and included
tags so that we could lock down to a specific version.

At the moment this git repository is built by the docker hub. There isn't any
way to have it automatically build all tags so after making a tag for the specific
Java version you have to manually go and add it.

https://registry.hub.docker.com/builds/github/37554/ox-it/docker-java/edit


