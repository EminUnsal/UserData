#! /bin/bash 
# Bunlari acmayi unutma-->Securtiy Group: "Port 22, 3000, 9090, 9100"  
wget https://github.com/prometheus/prometheus/releases/download/v2.41.0/prometheus-2.41.0.linux-amd64.tar.gz
tar xvfz prometheus-*.tar.gz

# Install Grafana
wget https://dl.grafana.com/enterprise/release/grafana-enterprise-9.3.2-1.x86_64.rpm
yum install grafana-enterprise-9.3.2-1.x86_64.rpm -y
systemctl start grafana-server.service

cd prometheus-*
./prometheus --config.file=prometheus.yml