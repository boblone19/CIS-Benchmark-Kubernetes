info "4.1 - Node Configuration Files"

check_4_1_1="4.1.1  - Ensure that the kubelet service file permissions are set to 644 or more restrictive"
if [ -f "/etc/kubernetes/config" ]; then
    file="/etc/kubernetes/config"
elif [ -f "/var/lib/kubelet/kubeconfig" ]; then
    # kops
    file="/var/lib/kubelet/kubeconfig"
else
    file="/etc/kubernetes/kubelet.conf"
fi

if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check_4_1_1"
  else
    warn "$check_4_1_1"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_4_1_1"
  info "     * File not found"
fi

check_4_1_2="4.1.2  - Ensure that the kubelet service file ownership is set to root:root"
if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_4_1_2"
  else
    warn "$check_4_1_2"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_4_1_2"
fi

check_4_1_3="4.1.3  - Ensure that the proxy kubeconfig file permissions are set to 644 or more restrictive"
if [ -f "/etc/kubernetes/kubelet" ]; then
    file="/etc/kubernetes/kubelet"
elif [ -f "/etc/sysconfig/kubelet" ]; then
    # kops
    file="/etc/sysconfig/kubelet"
else
    file="/etc/kubernetes/kubelet.conf"
fi

if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check_4_1_3"
  else
    warn "$check_4_1_3"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_4_1_3"
  info "     * File not found"
fi

check_4_1_4="4.1.4  - Ensure that the proxy kubeconfig file ownership is set to root:root"
if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_4_1_4"
  else
    warn "$check_4_1_4"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_4_1_4"
fi

check_4_1_5="4.1.5  - Ensure that the kubelet.conf file permissions are set to 644 or more restrictive"
if [ -f "/var/lib/kube-proxy/kubeconfig" ]; then
    # kops
    file="/var/lib/kube-proxy/kubeconfig"
else
    file="/etc/kubernetes/proxy"
fi

if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check_4_1_5"
  else
    warn "$check_4_1_5"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_4_1_5"
  info "     * File not found"
fi

check_4_1_6="4.1.6  - Ensure that the kubelet.conf file ownership is set to root:root"
if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_4_1_6"
  else
    warn "$check_4_1_6"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_4_1_6"
fi

check_4_1_7="4.1.7  - Ensure that the certificate authorities file permissions are set to 644 or more restrictive"
if check_argument "$CIS_KUBELET_CMD" '--client-ca-file' >/dev/null 2>&1; then
  file=$(get_argument_value "$CIS_KUBELET_CMD" '--client-ca-file')
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check_4_1_7"
    pass "       * client-ca-file: $file"
  else
    warn "$check_4_1_7"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_4_1_7"
  info "     * --client-ca-file not set"
fi

check_4_1_8="4.1.8  - Ensure that the client certificate authorities file ownership is set to root:root"
if check_argument "$CIS_KUBELET_CMD" '--client-ca-file' >/dev/null 2>&1; then
  file=$(get_argument_value "$CIS_KUBELET_CMD" '--client-ca-file')
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_4_1_8"
    pass "       * client-ca-file: $file"
  else
    warn "$check_4_1_8"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_4_1_8"
  info "     * --client-ca-file not set"
fi


check_4_1_9="4.1.9  - Ensure that the kubelet configuration file has permissions set to 644 or more restrictive"
if [ -f "/var/lib/kubelet/config.yaml" ]; then
    # kops
    file="/var/lib/kubelet/config.yaml"
else
    file="/var/lib/kubelet"
fi

if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check_4_1_9"
  else
    warn "$check_4_1_9"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_4_1_9"
  info "     * File not found"
fi

check_4_1_10="4.1.10  - Ensure that the kubelet configuration file ownership is set to root:root"
if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_4_1_10"
  else
    warn "$check_4_1_10"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_4_1_10"
fi