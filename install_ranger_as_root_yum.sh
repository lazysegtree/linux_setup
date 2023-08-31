yum -y install git which python3

git clone https://github.com/ranger/ranger
cd ranger
make install
cd ..
rm -Rf ranger
