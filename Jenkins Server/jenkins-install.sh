#!/bin/bash
set -euxo pipefail

# Update system
yum update -y

# Install base tools
yum install -y wget git unzip tar yum-utils fontconfig

# Install Java (recommended on AWS)
yum install -y java-21-amazon-corretto

# Verify Java
java -version

# Add Jenkins repo
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/rpm-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
yum install -y jenkins

# Ensure JAVA_HOME for Jenkins
mkdir -p /etc/systemd/system/jenkins.service.d

cat > /etc/systemd/system/jenkins.service.d/override.conf <<EOF
[Service]
Environment="JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto"
EOF

# Reload systemd and start Jenkins
systemctl daemon-reload
systemctl enable jenkins
systemctl restart jenkins

# Install Git
sudo yum install git -y

# Install Terraform
yum install -y yum-utils
yum-config-manager --add-repo \
https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

yum install -y terraform

# Install kubectl
curl -LO https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/

# Verify installs
terraform version
kubectl version --client
systemctl status jenkins --no-pager





