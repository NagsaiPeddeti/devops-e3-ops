export PROMETHEUS_CONFIG_NAME=prometheus.yml
cat configs/prometheus.yml | docker config create ${PROMETHEUS_CONFIG_NAME} -