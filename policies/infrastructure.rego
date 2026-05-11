package kubernetes.deployment

# Default deny
default allow = false

# Allow if no violations exist
allow {
    not has_violations
}

has_violations {
    violations[_]
}
# Rule 1: Prevent running containers as root (security enforcement)
violations[msg] {
    container := input.spec.template.spec.containers[_]
    not container.securityContext.runAsNonRoot
    msg := sprintf("Container '%v' does not specify runAsNonRoot: true", [container.name])
}

# Rule 2: Ensure CPU and Memory limits are set (configuration compliance)
violations[msg] {
    container := input.spec.template.spec.containers[_]
    not container.resources.limits.cpu
    msg := sprintf("Container '%v' does not have a CPU limit set", [container.name])
}

violations[msg] {
    container := input.spec.template.spec.containers[_]
    not container.resources.limits.memory
    msg := sprintf("Container '%v' does not have a Memory limit set", [container.name])
}

# Output the reasons for denial
deny[msg] {
    msg := violations[_]
}
