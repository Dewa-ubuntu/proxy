# Install apt-cacher
export DEBIAN_FRONTEND=noninteractive
apt-get update && sudo apt-get install apt-cacher-ng -y

# Setup our repo's
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:ubuntu-cloud-archive/grizzly-staging
sudo apt-get update
sudo apt-get install iftop iptraf vim curl wget lighttpd -y

echo 'Acquire::http { Proxy "http://172.16.172.110:3142"; };' | sudo tee /etc/apt/apt.conf.d/01apt-cacher-ng-proxy

wget --quiet wget https://launchpad.net/cirros/trunk/0.3.0/+download/cirros-0.3.0-x86_64-disk.img -O /var/www/cirros-0.3.0-x86_64-disk.img
