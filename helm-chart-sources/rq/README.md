# RQ Helm Chart

This chart deploys Python RQ and RQ Dashboard on your K8s cluster

## Requirements

* [Kubernetes](https://kubernetes.io/) >= 1.19.0-00
* [Helm](https://helm.sh/) >= 3

## How to install

### Add helm repo

```bash
helm repo add somerepo https://gishyanart.github.io/helm-chart/
```

```bash
helm upgrade -i rq rq/rq
```

## Sources

* [rq](https://github.com/rq/rq)

* [rq-dashboard](https://github.com/Parallels/rq-dashboard)

## Parameters

### Global parameters

| Name                       | Description                                                                                                         | Value |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------- | ----- |
| `global.namespaceOverride` | Override release namespace and deploy resources on that namespace                                                   | `""`  |
| `global.nodeSelector`      | node selector for pods, will be applied to any pod created by this chart                                            | `{}`  |
| `global.affinity`          | affinity for pods, will be applied to any pod created by this chart                                                 | `{}`  |
| `global.tolerations`       | tolerations for pods, will be applied to any pod created by this chart                                              | `[]`  |
| `global.existingRedisHost` | Parameters of the existing redis host to use for rq, if not specified single pod redis statefulset will be deployed | `{}`  |

### RQ Dashboard parameters

| Name                                 | Description                                                                                                       | Value                   |
| ------------------------------------ | ----------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `rqDashboard.enabled`                | enable/disable RQ dashboard                                                                                       | `true`                  |
| `rqDashboard.image`                  | Docker image of the rq dashboard                                                                                  | `eoranged/rq-dashboard` |
| `rqDashboard.deployment.resources`   | Kubernetes resources definition for rq dashboard container                                                        | `{}`                    |
| `rqDashboard.deployment.addArgs`     | Additional arguments to pass to the pod command, by default only `--redis-url` is genereated for Redis connection | `[]`                    |
| `rqDashboard.service.type`           | Service type of the rq dashboard                                                                                  | `ClusterIP`             |
| `rqDashboard.service.port`           | On which port rq dashboard service must serve                                                                     | `80`                    |
| `rqDashboard.ingress.enabled`        | Whether to create ingress resource for rq dashboard or not                                                        | `false`                 |
| `rqDashboard.ingress.ingressClass`   | IngressClass name of the ingress resource                                                                         | `""`                    |
| `rqDashboard.ingress.host`           | On which host to serve, required if ingress is enabled                                                            | `""`                    |
| `rqDashboard.ingress.tls.enabled`    | Whether to enable TLS support for ingress or not                                                                  | `false`                 |
| `rqDashboard.ingress.tls.secretName` | TLS secret name of the ingress resource                                                                           | `""`                    |
| `rq.image`                           | Docker image for rq workers                                                                                       | `gnuni/rq:1.12.0`       |
| `rq.serviceAccountName`              | ServiceAccount name for rq workers, if not specified `default` will be used                                       | `nil`                   |
| `rq.deployment.replicas`             | Pod replica count of rq workers                                                                                   | `2`                     |
| `rq.deployment.resources`            | Kubernetes resources definition for rq worker containers                                                          | `{}`                    |
| `rq.deployment.addArgs`              | Additional arguments to pass to the pod command, by default only `--url` is genereated for Redis connection       | `[]`                    |
