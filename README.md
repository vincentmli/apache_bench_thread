# apache_bench_thread
Multithread/core ApacheBench Packages extracted from mTCP with SSL test addition

Ubuntu build note

1 install libnuma-dev libssl-dev (maybe libpcre as well)

2 compile libapr first
#cd srclib/apr; ./configure --prefix=/usr/local;  make ; make install

3 compile apr-util
#cd srclib/apr-util; ./configure --prefix=/usr/local --with-apr="../apr"; make ; make install

4 now compile ab (install libssl or if you have custom built ssl use --with-ssl to point to custom built ssl directory)

./configure --prefix=/usr/local --enable-ssl --with-ssl="/usr/local/ssl"  --with-apr="./srclib/apr" --with-apr-util="./srclib/apr-util"

5 run ab  with 4 thread/cores

ab -N 4 -n 32 -c 4 https://url/

