#!/bin/bash
func=$1
serviceName=$2
cmd=$3

# 执行容器内命令
RunCmd() {
    echo "docker exec -it ${serviceName} ${cmd}"
    docker exec -it ${serviceName} ${cmd}
}

case "${func}" in
    "RunCmd")
        RunCmd
    ;;
esac