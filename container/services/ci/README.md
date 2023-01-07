# Description

Drone.io

Drone is a continuous delivery system built on container technology.
Drone uses a simple YAML build file, to define and execute build pipelines inside Docker containers.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [HTTPS](../../../container/services/dynds-https-ip/README.md)

### Installation instructions

1. Follow the [docs](https://docs.drone.io/server/provider/github/)
2. Install files
    1. https container -> [drone.subdomain.conf](drone.subdomain.conf)
3. Start the pod
   ```bash
   podman kube play ci-pvc.yaml
   # podman kube play ci-secret.yaml # TODO WORKAROUND FOR https://github.com/containers/podman/issues/16269
   podman secret create ci-secret ci-secret.json
   systemctl --user enable --now podman-kube@$(systemd-escape $(pwd)/ci-pod.yaml).service
   ```
4. [Add the persistent volumes to the borg backup client](../../../container/services/borg-backup/client/README.md)