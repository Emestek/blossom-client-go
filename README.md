# build-scripts-client-go
This repository contains a **sample Go application** that demonstrates how to integrate and use the [build-scripts-bash](https://github.com/Emestek/build-scripts-bash) project.

The Go client pulls the build scripts directly from GitHub and uses them like a shared library, allowing us to:

- Validate that the build system works seamlessly when consumed by a real project.
- Test both **containerized** (e.g., Docker) and **non-containerized** (local) builds.
- Showcase how host projects can adopt the build tooling with minimal setup.
- Provide a reference integration pattern for future client projects.

This repo primarily serves as a **testing ground** and **example implementation**, ensuring that the build scripts function correctly across different environments and configurations.
