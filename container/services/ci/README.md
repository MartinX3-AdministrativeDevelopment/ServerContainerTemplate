# Description

Drone.io

Drone is a continuous delivery system built on container technology.
Drone uses a simple YAML build file to define and execute build pipelines inside Docker containers.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [HTTPS](../../../container/services/dynds-https-ip/README.md)

### Installation instructions

1. Follow the [docs](https://docs.drone.io/server/provider/github/)
2. Config file [drone.subdomain.conf](../dynds-https-ip/dyndns-https-ip-pod.yaml)
3. Start the pod
   ```bash
   podman kube play ci-drone.io-pvc.yaml
   podman kube play ci-drone.io-secret.yaml
   cp ci-drone.io-pod.kube ~/.config/containers/systemd/
   systemctl --user daemon-reload
   systemctl --user start ci-drone.io-pod.service
   ```
4. [Add the persistent volumes to the borg backup client](../../../container/services/borg-backup/client/README.md)
