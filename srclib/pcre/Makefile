top_srcdir   = /home/vincent/apache_benchmark_thread
top_builddir = /home/vincent/apache_benchmark_thread
srcdir       = /home/vincent/apache_benchmark_thread/srclib/pcre
builddir     = /home/vincent/apache_benchmark_thread/srclib/pcre
VPATH        = /home/vincent/apache_benchmark_thread/srclib/pcre
LTLIBRARY_NAME = libpcre.la
LTLIBRARY_SOURCES = maketables.c get.c study.c pcre.c

CLEAN_TARGETS = dftables chartables.c
DISTCLEAN_TARGETS = pcre.h pcre-config config.h config.log config.status $(CLEAN_TARGETS)

include $(top_srcdir)/build/ltlib.mk

config.h:
	touch $@

$(LTLIBRARY_OBJECTS) dftables.lo: config.h

dftables: dftables.lo
	$(LINK) $(EXTRA_LDFLAGS) dftables.lo $(EXTRA_LIBS)

$(srcdir)/chartables.c: dftables
	./dftables $@

pcre.lo: $(srcdir)/chartables.c
