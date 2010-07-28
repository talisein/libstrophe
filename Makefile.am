AUTOMAKE_OPTIONS = subdir-objects

lib_LTLIBRARIES = libstrophe.la

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libstrophe.pc

## Main build targets

SOURCES = src/auth.c src/conn.c src/ctx.c \
	src/event.c src/handler.c src/hash.c \
	src/jid.c src/md5.c src/sasl.c src/sha1.c \
	src/snprintf.c src/sock.c src/stanza.c src/thread.c \
	src/tls_openssl.c src/util.c src/parser_libxml2.c

libstrophe_la_CFLAGS = -fPIC @libxml_CFLAGS@
libstrophe_la_LIBADD = @libxml_LIBS@
libstrophe_la_include_HEADERS = strophe.h strophepp.h
libstrophe_la_includedir = $(includedir)
libstrophe_la_SOURCES = $(SOURCES)

EXAMPLES_LIBS = ./libstrophe.la @libxml_LIBS@ -lssl -lresolv
## Examples
noinst_PROGRAMS = examples/active examples/roster examples/basic examples/bot
examples_active_SOURCES = examples/active.c
examples_active_LDADD = $(EXAMPLES_LIBS)

examples_roster_SOURCES = examples/roster.c
examples_roster_LDADD =  $(EXAMPLES_LIBS)

examples_basic_SOURCES = examples/basic.c
examples_basic_LDADD =  $(EXAMPLES_LIBS)

examples_bot_SOURCES = examples/bot.c
examples_bot_LDADD =  $(EXAMPLES_LIBS)


## Tests
TESTS = tests/check_parser
check_PROGRAMS = tests/check_parser
tests_check_parser_SOURCES = tests/check_parser.c
tests_check_parser_CFLAGS = -I$(top_srcdir)/src
tests_check_parser_LDADD = $(TESTS_LIBS)

