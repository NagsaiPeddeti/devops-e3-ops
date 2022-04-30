export PROMETHEUS_CONFIG_NAME=prometheus.yml2
cat configs/prometheus.yml | docker config create ${PROMETHEUS_CONFIG_NAME} -

docker stack deploy -c docker-compose.yml cluster_monitor



docker service create --name cadvisor -l prometheus-job=cadvisor \
    --mode=global --publish target=8080,mode=host \
     --network cluster_monitor_monitoring \
    --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock,ro \
    --mount type=bind,src=/,dst=/rootfs,ro \
    --mount type=bind,src=/var/run,dst=/var/run \
    --mount type=bind,src=/sys,dst=/sys,ro \
    --mount type=bind,src=/var/lib/docker,dst=/var/lib/docker,ro \
    gcr.io/cadvisor/cadvisor:latest 