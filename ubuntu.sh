# make sure that there tools are installed
# python3, git, build-essentials
apt update -y && apt upgrade -y

apt install build-essential

# install ranger
mkdir temp && cd temp
git clone https://github.com/ranger/ranger
cd ranger
sudo make install
cd ..
