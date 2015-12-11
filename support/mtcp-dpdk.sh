#!/bin/sh
LD_LIBRARY_PATH=.:/usr/src/mtcp/dpdk/lib:/usr/local/lib LD_PRELOAD=$* 
