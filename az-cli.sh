#!/bin/bash
# Step 1;
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
# Step 2;
echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
# Step 3;
sudo yum install azure-cli
If you face with a Python issue use the below code only
curl -sL https://azurecliprod.blob.core.windows.net/rhel7_6_install.sh | sudo bash
# Step 4:
az login --use-device-code


# If Step 3 gives you error about Python, use the code below.
# curl -sL https://azurecliprod.blob.core.windows.net/rhel7_6_install.sh | sudo bash

login to your cluster
az  aks get-credentials --resource-group devopsteam-resource-group  --name devops-cluster-aks