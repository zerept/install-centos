#!/bin/bash

echo "atualizando sistema" && sleep 1
#atualizando repositorio
sudo yum update -y
#atualizando sistema
sudo yum upgrade -y 
#limpando arquivos temporarios e obsoletos 
sudo yum clean -y

#instalando docker
echo "instalando utilitarios" && sleep 1
sudo yum install -y yum-utils

echo "adicionando repositorio docker" && sleep 1
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "instalando docker" && sleep 1
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "ligando e ativando docker" && sleep 1
sudo systemctl start docker && sudo systemctl enable docker

echo "adicionando privilegios de usuário" && sleep 1
sudo usermod -aG docker $USER

echo "Reiniciando" && sleep 1
sudo reboot
