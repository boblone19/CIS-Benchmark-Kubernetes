info "4.2 - Kubelet"

Testing_4_2_1="4.2.1  - Ensure that the --anonymous-auth argument is set to false"
if check_argument "$CIS_KUBELET_CMD" '--anonymous-auth=false' >/dev/null 2>&1; then
    pass "$check_4_2_1"
else
    warn "$check_4_2_1"
fi


check_4_2_2="4.2.2  - Ensure that the --authorization-mode argument is not set to AlwaysAllow"
if check_argument "$CIS_KUBELET_CMD" '--authorization-mode=AlwaysAllow' >/dev/null 2>&1; then
    warn "$check_4_2_2"
else
    pass "$check_4_2_2"
fi

check_4_2_3="4.2.3  - Ensure that the --client-ca-file argument is set as appropriate"
if check_argument "$CIS_KUBELET_CMD" '--client-ca-file' >/dev/null 2>&1; then
    cafile=$(get_argument_value "$CIS_KUBELET_CMD" '--client-ca-file')
    pass "$check_4_2_3"
    pass "       * client-ca-file: $cafile"
else
    warn "$check_4_2_3"
fi

check_4_2_4="4.2.4  - Ensure that the --read-only-port argument is set to 0"
if check_argument "$CIS_KUBELET_CMD" '--read-only-port' >/dev/null 2>&1; then
    port=$(get_argument_value "$CIS_KUBELET_CMD" '--read-only-port' | awk '{print $1}')
    if [ $port = "0" ]; then
        pass "$check_4_2_4"
    else
        warn "$check_4_2_4"
        warn "       * read-only-port: $port"
    fi
else
    warn "$check_4_2_4"
fi

check_4_2_5="4.2.5  - Ensure that the --streaming-connection-idle-timeout argument is not set to 0"
if check_argument "$CIS_KUBELET_CMD" '--streaming-connection-idle-timeout=0' >/dev/null 2>&1; then
    timeout=$(get_argument_value "$CIS_KUBELET_CMD" '--streaming-connection-idle-timeout')
    warn "$check_4_2_5"
    warn "       * streaming-connection-idle-timeout: $timeout"
else
    pass "$check_4_2_5"
fi

check_4_2_6="4.2.6  - Ensure that the --protect-kernel-defaults argument is set to true"
if check_argument "$CIS_KUBELET_CMD" '--protect-kernel-defaults=true' >/dev/null 2>&1; then
    pass "$check_4_2_6"
else
    warn "$check_4_2_6"
fi

check_4_2_7="4.2.7  - Ensure that the --make-iptables-util-chains argument is set to true"
if check_argument "$CIS_KUBELET_CMD" '--make-iptables-util-chains=true' >/dev/null 2>&1; then
    pass "$check_4_2_7"
else
    warn "$check_4_2_7"
fi

check_4_2_8="4.2.8  - Ensure that the --hostname-override argument is not set"
if check_argument "$CIS_KUBELET_CMD" '--hostname-override' >/dev/null 2>&1; then
    warn "$check_4_2_8"
else
    pass "$check_4_2_8"
fi

check_4_2_9="4.2.9  - Ensure that the --event-qps argument is set to 0"
if check_argument "$CIS_KUBELET_CMD" '--event-qps' >/dev/null 2>&1; then
    event=$(get_argument_value "$CIS_KUBELET_CMD" '--event-qps' | awk '{print $1}')
    if [ $event = "0" ]; then
        pass "$check_4_2_9"
    else
        warn "$check_4_2_9"
        warn "        * event-qps: $event"
    fi
else
    warn "$check_4_2_9"
fi

check_4_2_10="4.2.10  - Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate"
if check_argument "$CIS_KUBELET_CMD" '--tls-cert-file' >/dev/null 2>&1; then
    if check_argument "$CIS_KUBELET_CMD" '--tls-private-key-file' >/dev/null 2>&1; then
        cfile=$(get_argument_value "$CIS_KUBELET_CMD" '--tls-cert-file')
        kfile=$(get_argument_value "$CIS_KUBELET_CMD" '--tls-private-key-file')
        pass "$check_2_1_12"
        pass "        * tls-cert-file: $cfile"
        pass "        * tls-private-key-file: $kfile"
    else
      warn "$check_4_2_10"
    fi
else
    warn "$check_4_2_10"
fi

check_4_2_11="4.2.11  - Ensure that the --rotate-certificates argument is not set to false"
if check_argument "$CIS_KUBELET_CMD" '--rotate-certificates=true' >/dev/null 2>&1; then
    pass "$check_4_2_11"
else
    warn "$check_4_2_11"
fi

check_4_2_12="4.2.12  - Ensure that the RotateKuberletServerCertificate argument is set to true"
if check_argument "$CIS_KUBELET_CMD" '--feature-gates=RotateKubeletServerCertificate=true' >/dev/null 2>&1; then
    pass "$check_4_2_12"
else
    warn "$check_4_2_12"
fi
