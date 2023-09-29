# Terraform Kubernetes Redis

This terraform module deploys a Redis statefulset into a kubernetes cluster.

## Usage

```
module "redis" {
  source              = "ballj/redis/kubernetes"
  version             = "~> 1.0"
  namespace           = "production"
  object_prefix       = "myapp-db"
  labels              = {
    "app.kubernetes.io/part-of" = "myapp"
  }
}
```

## Variables

### Deployment Variables

| Variable                          | Required | Default                     | Description                                        |
| --------------------------------- | -------- | --------------------------- | -------------------------------------------------- |
| `namespace`                       | Yes      | N/A                         | Kubernetes namespace to deploy into                |
| `object_prefix`                   | Yes      | N/A                         | Unique name to prefix all objects with             |
| `labels`                          | No       | N/A                         | Common labels to add to all objects - See example  |
| `image_name`                      | No       | `bitnami/redis`             | Image to deploy as part of deployment              |
| `image_tag`                       | No       | `6.0.10-debian-10-r4`       | Image tag to deploy                                |
| `service_account_name`            | No       | `""`                        | Service account to attach to the pod               |
| `timeout_create`                  | No       | `3m`                        | Timeout for creating the statefulset               |
| `timeout_update`                  | No       | `3m`                        | Timeout for updating the statefulset               |
| `timeout_delete`                  | No       | `10m`                       | Timeout for deleting the statefulset               |
| `annotations`                     | No       | `{}`                        | Annotations to add to the statefulset              |
| `template_annotations`            | No       | `{}`                        | Annotations to add to the template (recreate pods) |
| `resources_requests_cpu`          | No       | `null`                      | The minimum amount of compute resources required   |
| `resources_requests_memory`       | No       | `null`                      | The minimum amount of compute resources required   |
| `resources_limits_cpu`            | No       | `null`                      | The maximum amount of compute resources allowed    |
| `resources_limits_memory`         | No       | `null`                      | The maximum amount of compute resources allowed    |
| `password_secret`                 | No       | `""`                        | Database user to add                               |
| `password_key`                    | No       | `redis-password`            | Database user to add                               |
| `password_required`               | No       | `true`                      | Requires that Redis use a password                 |
| `instance`                        | No       | `master`                    | Instance name, used for selectors                  |
| `replicas`                        | No       | `1`                         | Amount of pods to deploy as part of deployment     |
| `wait_for_rollout`                | No       | `true`                      | Wait for the StatefulSet to finish rolling out     |
| `pod_management_policy`           | No       | `OrderedReady`              | Controls how pods are created during scaling       |
| `update_strategy`                 | No       | `RollingUpdate`             | Strategy to use, `OnDelete` or `RollingUpdate`     |
| `update_partition`                | No       | `"0"`                       | Ordinal at which the set should be partitioned     |
| `min_ready_seconds`               | No       | `1`                         | Minimum time to consider pods ready                |
| `max_ready_seconds`               | No       | `600`                       | Maximum time for pod to be ready before failure    |
| `revision_history`                | No       | `4`                         | Number of ReplicaSets to retain                    |
| `pvc_name`                        | No       | `""`                        | Name of the PVC to mount for persistent storage    |
| `volume_data_medium`              | No       | `""`                        | Medium of empty_dir if no PVC is specified         |
| `volume_data_size`                | No       | `0`                         | Medium of empty_dir if no PVC is specified         |
| `volume_tmp_medium`               | No       | `""`                        | Medium of the empty_dir created for tmp            |
| `volume_tmp_size`                 | No       | `0`                         | Size of the empty_dir created for tmp              |
| `volume_logs_medium`              | No       | `""`                        | Medium of the empty_dir created for logs           |
| `volume_logs_size`                | No       | `0`                         | Size of the empty_dir created for logs             |
| `volume_etc_medium`               | No       | `""`                        | Medium of the empty_dir created for etc            |
| `volume_etc_size`                 | No       | `0`                         | Size of the empty_dir created for etc              |
| `security_context_enabled`        | No       | `true`                      | Prevents deployment from running as root           |
| `security_context_uid`            | No       | `1001`                      | User to run deployment as                          |
| `security_context_uid`            | No       | `1001`                      | Group to run deployment as                         |
| `env`                             | No       | `{}`                        | Environment variables to add                       |
| `env_secret`                      | No       | `[]`                        | Environment variables to add from secrets          |
| `readiness_probe_enabled`         | No       | `true`                      | Enable the readyness probe                         |
| `readiness_probe_initial_delay`   | No       | `30`                        | Initial delay of the probe in seconds              |
| `readiness_probe_period`          | No       | `10`                        | Period of the probe in seconds                     |
| `readiness_probe_timeout`         | No       | `1`                         | Timeout of the probe in seconds                    |
| `readiness_probe_success`         | No       | `1`                         | Minimum consecutive successes for the probe        |
| `readiness_probe_failure`         | No       | `3`                         | Minimum consecutive failures for the probe         |
| `liveness_probe_enabled`          | No       | `true`                      | Enable the readyness probe                         |
| `liveness_probe_initial_delay`    | No       | `30`                        | Initial delay of the probe in seconds              |
| `liveness_probe_period`           | No       | `10`                        | Period of the probe in seconds                     |
| `liveness_probe_timeout`          | No       | `1`                         | Timeout of the probe in seconds                    |
| `liveness_probe_success`          | No       | `1`                         | Minimum consecutive successes for the probe        |
| `liveness_probe_failure`          | No       | `3`                         | Minimum consecutive failures for the probe         |
| `startup_probe_enabled`           | No       | `true`                      | Enable the readyness probe                         |
| `startup_probe_initial_delay`     | No       | `30`                        | Initial delay of the probe in seconds              |
| `startup_probe_period`            | No       | `10`                        | Period of the probe in seconds                     |
| `startup_probe_timeout`           | No       | `1`                         | Timeout of the probe in seconds                    |
| `startup_probe_success`           | No       | `1`                         | Minimum consecutive successes for the probe        |
| `startup_probe_failure`           | No       | `3`                         | Minimum consecutive failures for the probe         |
| `priority_class_name`             | No       | `null`                      | Sets a priority class to the pods                  |

### Service Variables

| Variable                          | Required | Default                     | Description                                        |
| --------------------------------- | -------- | --------------------------- | -------------------------------------------------- |
| `service_type`                    | No       | `ClusterIP`                 | Service type to deploy                             |
| `service_port`                    | No       | `3306`                      | External port for service                          |
| `service_annotations`             | No       | `{}`                        | Annotations to add to service                      |
| `service_session_affinity`        | No       | `None`                      | Session persistence setting                        |
| `service_traffic_policy`          | No       | `Local`                     | External traffic policy - `Local` or `External`    |
| `labels`                          | No       | N/A                         | Common labels to add to all objects - See example  |

## Persistence

Persistance is achieved by mounting PVCs into the container. This is achieve by
providing a PVC name in the `pvc_name` variable.

## Environment Variables

Environment variables can be set by providing a map to the `env` variable:

```
module "redis" {
  source              = "ballj/redis/kubernetes"
  version             = "~> 1.0"
  namespace           = "production"
  object_prefix       = "myapp-db"
  env = {
    ENV_A = "ENVVAR"
    ENV_B = "1"
  }
}
```

### Secrets

Secrets can be added by using the `env_secret` variable:

```
module "redis" {
  source              = "ballj/redis/kubernetes"
  version             = "~> 1.0"
  namespace           = "production"
  object_prefix       = "myapp-db"
  env_secret = [
    {
      name   = "ENV_VAR"
      secret = "app-secret"
      key    = "username"
    }
  ]
}
```

#### Redis Password File

The password can be passed by using the variable `REDIS_PASSWORD_FILE` rather
than using Kubernetes secrets.
