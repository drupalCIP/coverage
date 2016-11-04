echo "Downgrading Docker to make it compatible with DrupalCI"
sudo mkdir -p /var/www/html/checkout
sudo chmod 777 /var/www/html/checkout
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-precise main" > /etc/apt/sources.list.d/docker.list'
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-get update
sudo apt-key update
sudo apt-get -qqy -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install docker-engine=1.11.1-0~precise --force-yes
sudo rm /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > docker-compose
chmod +x docker-compose
sudo mv docker-compose /usr/local/bin
docker-compose -v
docker -v