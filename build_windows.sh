#p=~/keymaker-coin
#git clone https://github.com/oneitguy/keymaker.git
#cd $p
#../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$BDB_PREFIX
#$p/autogen.sh
#$p/configure
#$p/make
#$p/make install # optional

sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 -y

wget http://download.oracle.com/berkeley-db/db-4.8.30.zip
unzip db-4.8.30.zip
cd db-4.8.30
cd build_unix/
../dist/configure --prefix=/usr/local --enable-cxx

sudo apt-get install libminiupnpc-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt install g++-mingw-w64-x86-64 -y
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y
#$p/contrib/install_db4.sh `pwd`

PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g')
sudo bash -c "echo 0 > /proc/sys/fs/binfmt_misc/status"
#$p/configure --enable-hardening

chmod +x *.*
cd depends
chmod +x *.*
make HOST=x86_64-w64-mingw32

cd ..
./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/
make