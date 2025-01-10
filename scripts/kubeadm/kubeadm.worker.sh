# SOURCE 1: https://github.com/zealvora/certified-kubernetes-administrator/blob/master/Domain%206%20-%20Cluster%20Architecture%2C%20Installation%20%26%20Configuration/install-kubeadm-master.md
# SOURCE 2: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl

###
## Update/Upgrade machine
###
sudo apt update
sudo apt upgrade

###
## 1. SETUP CONTAINERD
###
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sysctl --system

apt-get install -y containerd
mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml

nano /etc/containerd/config.toml
---> change this value: SystemdCgroup = true 

systemctl restart containerd


###
## 2. KERNEL CONFIGURATIONS
###

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system

###
## 3. KUBEADM
###

# PREPARATIONS
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
apt-cache madison kubeadm
apt-get install -y kubelet=1.32.0-1.1 kubeadm=1.32.0-1.1 kubectl=1.32.0-1.1 cri-tools=1.32.0-1.1
sudo apt-mark hold kubelet kubeadm kubectl
systemctl enable --now kubelet

###
## 4. JOIN
###
kubeadm join XXXX:6443 --token XXXX --discovery-token-ca-cert-hash XXXX