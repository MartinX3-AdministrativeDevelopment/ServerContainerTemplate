# Description

Prometheus to Warp10 metrics forwarder According to the OVH docs needed for the Real Time Monitoring (RTM)

## Table of contents

1. [Service requirements](#service-requirements)
1. [Installation instructions](#installation-instructions)

### Service requirements

- [Server](../../../../base/operating-system)

### Installation instructions

1. Edit the [beamium-pod.yaml](beamium-pod.yaml)
    1. Replace `$(pwd)/beamium.d/` with the terminal output of `echo $(pwd)/beamium.d/`

[//]: # (TODO: Workaround, until config maps are supported. See https://github.com/containers/podman/issues/9181)

2. Create the volume if it does not exist.
    1. `podman play kube ./beamium-pod-pvc.yaml`
3. `podman play kube ./beamium-pod.yaml`
4. Follow https://docs.ovh.com/gb/en/dedicated/install-rtm/
