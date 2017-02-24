# apache_bench_thread
Multithread/core ApacheBench Packages extracted from mTCP with SSL test addition

Ubuntu build note

1 install libnuma-dev libssl-dev (maybe libpcre as well)

Note when build your own OpenSSL library, add "shared" to build both static and shared library:

tested openssl-1.0.2g with below
#./config shared
#make depend
#make
#make install

add /usr/local/ssl/lib to be included in /etc/ld.so.conf
for example:
#cat /etc/ld.so.conf
include /etc/openssl.so.conf
include /etc/ld.so.conf.d/*.conf
# cat /etc/openssl.so.conf
/usr/local/ssl/lib
then 

#ldconfig

this will make ab linked with the new build OpenSSL library.

2 compile libapr first
#cd srclib/apr; make clean; ./configure --prefix=/usr/local;  make ; make install

3 compile apr-util
#cd srclib/apr-util; make clean; ./configure --prefix=/usr/local --with-apr="../apr"; make ; make install

4 now compile ab (install libssl or if you have custom built ssl use --with-ssl to point to custom built ssl directory)

./configure --prefix=/usr/local --enable-ssl --with-ssl="/usr/local/ssl"  --with-apr="./srclib/apr" --with-apr-util="./srclib/apr-util"

5 run ab  with 8 thread/cores

ab -N 8 -c 20 -n 1600000 -f TSL1.2 -Z DHE-RSA-AES128-GCM-SHA256  https://10.6.6.8/
