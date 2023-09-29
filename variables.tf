variable "object_prefix" {
  type        = string
  description = "Unique name to prefix all objects with"
}

variable "namespace" {
  type        = string
  description = "Kubernetes namespace for deployment"
}

variable "labels" {
  type        = map(string)
  description = "Labels to add"
  default     = {}
}

variable "timeout_create" {
  type        = string
  description = "Timeout for creating the statefulset"
  default     = "3m"
}

variable "timeout_update" {
  type        = string
  description = "Timeout for creating the statefulset"
  default     = "2m"
}

variable "timeout_delete" {
  type        = string
  description = "Timeout for creating the statefulset"
  default     = "10m"
}

variable "instance" {
  type        = string
  description = "Instance name, used for selectors"
  default     = "master"
}

variable "image_name" {
  type        = string
  description = "Docker image to use"
  default     = "bitnami/redis"
}

variable "image_tag" {
  type        = string
  description = "Docker image tag to use"
  default     = "6.2.5-debian-10-r70"
}

variable "service_account_name" {
  type        = string
  description = "Service account name to add to the pod"
  default     = ""
}

variable "password_required" {
  description = "Force the use of a password"
  default     = true
}

variable "password_secret" {
  type        = string
  description = "Secret containing redis password"
  default     = ""
}

variable "password_key" {
  type        = string
  description = "Secret key containing redis password"
  default     = "redis-password"
}

variable "wait_for_rollout" {
  description = "Wait for the pod rollout to complete"
  default     = true
}

variable "annotations" {
  type        = map(string)
  description = "Annotations to add to the deployment"
  default     = {}
}

variable "template_annotations" {
  type        = map(string)
  description = "Annotations to add to the template"
  default     = {}
}

variable "pod_management_policy" {
  type        = string
  description = "Controls how pods are created during scale up or down"
  default     = "OrderedReady"
}

variable "replicas" {
  type        = number
  description = "Amount of pods to create"
  default     = 1
}

variable "revision_history" {
  type        = number
  description = "The number of old ReplicaSets to retain"
  default     = 4
}

variable "update_strategy" {
  type        = string
  description = "The number of old ReplicaSets to retain"
  default     = "RollingUpdate"
}

variable "update_partition" {
  type        = string
  description = "Indicates the ordinal at which the StatefulSet should be partitioned"
  default     = "0"
}

variable "pvc_name" {
  type        = string
  description = "Name of the pvc to mount"
  default     = ""
}

variable "volume_data_medium" {
  type        = string
  description = "Medium of the empty_dir if no PVC is specified"
  default     = ""
}

variable "volume_data_size" {
  type        = number
  description = "Size of the empty_dir created if no pvc is specified"
  default     = 0
}

variable "volume_tmp_medium" {
  type        = string
  description = "Medium of the empty_dir created for tmp"
  default     = "Memory"
}

variable "volume_tmp_size" {
  type        = string
  description = "Size of the empty_dir created for tmp"
  default     = "5Mi"
}

variable "volume_logs_medium" {
  type        = string
  description = "Medium of the empty_dir created for logs"
  default     = ""
}

variable "volume_logs_size" {
  type        = number
  description = "Size of the empty_dir created for logs"
  default     = 0
}

variable "volume_etc_medium" {
  type        = string
  description = "Medium of the empty_dir created for etc"
  default     = ""
}

variable "volume_etc_size" {
  type        = string
  description = "Size of the empty_dir created for etc"
  default     = "5Mi"
}

variable "security_context_enabled" {
  type        = bool
  description = "Enable the security context"
  default     = true
}

variable "security_context_uid" {
  type        = number
  description = "Group to run container as"
  default     = 1001
}

variable "security_context_gid" {
  type        = number
  description = "User to run container as"
  default     = 1001
}

variable "resources_requests_cpu" {
  type        = string
  description = "The maximum amount of compute resources allowed"
  default     = ""
}

variable "resources_requests_memory" {
  type        = string
  description = "The minimum amount of compute resources required"
  default     = ""
}

variable "resources_limits_cpu" {
  type        = string
  description = "The maximum amount of compute resources allowed"
  default     = ""
}

variable "resources_limits_memory" {
  type        = string
  description = "The minimum amount of compute resources required"
  default     = ""
}

variable "env" {
  type        = map(string)
  description = "Environment variables"
  default     = {}
}

variable "env_secret" {
  type = list(object({
    name   = string
    secret = string
    key    = string
  }))
  description = "Environment variables to pull from secrets"
  default     = []
}

variable "service_session_affinity" {
  type        = string
  description = "Used to maintain session affinity"
  default     = "None"
}

variable "service_type" {
  type        = string
  description = "Service type"
  default     = "ClusterIP"
}

variable "service_port" {
  type        = number
  description = "External port for service"
  default     = 6379
}

variable "service_annotations" {
  type        = map(string)
  description = "Annotations to add to the service"
  default     = {}
}

variable "service_traffic_policy" {
  type        = string
  description = "Service external traffic policy"
  default     = "Local"
}

variable "readiness_probe_enabled" {
  type        = bool
  description = "Enable the readyness probe"
  default     = true
}

variable "readiness_probe_initial_delay" {
  type        = number
  description = "Initial delay of the probe in seconds"
  default     = 10
}

variable "readiness_probe_period" {
  type        = number
  description = "Period of the probe in seconds"
  default     = 10
}

variable "readiness_probe_timeout" {
  type        = number
  description = "Timeout of the probe in seconds"
  default     = 1
}

variable "readiness_probe_success" {
  type        = number
  description = "Minimum consecutive successes for the probe to be considered successful after having failed"
  default     = 1
}

variable "readiness_probe_failure" {
  type        = number
  description = "Minimum consecutive failures for the probe to be considered failed after having succeeded"
  default     = 3
}

variable "liveness_probe_enabled" {
  type        = bool
  description = "Enable the readyness probe"
  default     = true
}

variable "liveness_probe_initial_delay" {
  type        = number
  description = "Initial delay of the probe in seconds"
  default     = 10
}

variable "liveness_probe_period" {
  type        = number
  description = "Period of the probe in seconds"
  default     = 10
}

variable "liveness_probe_timeout" {
  type        = number
  description = "Timeout of the probe in seconds"
  default     = 1
}

variable "liveness_probe_success" {
  type        = number
  description = "Minimum consecutive successes for the probe to be considered successful after having failed"
  default     = 1
}

variable "liveness_probe_failure" {
  type        = number
  description = "Minimum consecutive failures for the probe to be considered failed after having succeeded"
  default     = 3
}

variable "startup_probe_enabled" {
  type        = bool
  description = "Enable the startup probe"
  default     = true
}

variable "startup_probe_initial_delay" {
  type        = number
  description = "Initial delay of the probe in seconds"
  default     = 4
}

variable "startup_probe_period" {
  type        = number
  description = "Period of the probe in seconds"
  default     = 1
}

variable "startup_probe_timeout" {
  type        = number
  description = "Timeout of the probe in seconds"
  default     = 1
}

variable "startup_probe_success" {
  type        = number
  description = "Minimum consecutive successes for the probe to be considered successful after having failed"
  default     = 1
}

variable "startup_probe_failure" {
  type        = number
  description = "Minimum consecutive failures for the probe to be considered failed after having succeeded"
  default     = 30
}

variable "priority_class_name" {
  type        = string
  description = "The priority class name for the statefulset"
  default     = null
}
