# kube-scheduler-healthcheck [![docker-build status](https://img.shields.io/docker/build/ocadotechnology/kube-scheduler-healthcheck.svg)](https://hub.docker.com/r/ocadotechnology/kube-scheduler-healthcheck/builds/)
A docker container intended to be a healthcheck for the kubernetes scheduler. All the container will do is create a pod, wait for it to be scheduled (i.e leave `Pending` state), then delete the pod.
`kube-scheduler-healthcheck` uses [exec healthz server](https://github.com/kubernetes/contrib/tree/master/exec-healthz) as a base container

# Config
The following environment variables can be set:

| Name                        | description                                                                                         | default       | example                         |
|-----------------------------|-----------------------------------------------------------------------------------------------------|---------------|---------------------------------|
| `TEST_POD_NAMESPACE` |  The namespace in which to create the pod  | kube-system | kube-system |
| `TEST_POD_IMAGE`        | The image to use when creating the test pod | gcr.io/google_containers/pause:3.1 | gcr.io/google_containers/pause:3.1   |
| `TEST_POD_NAME_POSTFIX`        | Optional postfix to add to the name of the test pod. Pod name will be `scheduler-healthcheck-<postfix>`  | pod | mysuperpostfix  |
| `TEST_POD_IMAGE_PULL_SECRET`   | Optional secret name to an imagePullSecret (type kubernetes.io/dockerconfigjson) |  | my-secret |
