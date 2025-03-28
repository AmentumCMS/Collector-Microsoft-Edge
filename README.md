# What is this?

[![Release](https://github.com/amentumcms/Collector-Microsoft-Edge/actions/workflows/collect.yml/badge.svg?branch=main)](https://github.com/amentumcms/Collector-Microsoft-Edge/actions/workflows/collect.yml)

This is a project that automatically collects artifacts to ease in air-gapped transfer from the internet.

It runs actions manually or on Push and creates a release.

In this case, it collects the source code repositories and the associated container images via skopeo & gh for:

- IronBank GIT CLI Container image
- Docker Hub GIT CLI Container image
- Git Hub GIT CLI latest release artifacts 
