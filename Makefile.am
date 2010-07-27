AUTOMAKE_OPTIONS = subdir-objects

AM_CFLAGS = -Wall -fPIC
ACLOCAL_AMFLAGS = -I$(top_srcdir) -I m4

STROPHE_CFLAGS =  @STROPHE_CFLAGS@
STROPHE_LIBS = @STROPHE_LIBS@

TESTS_LIBS = $(STROPHE_LIBS) -lstrophe
EXAMPLES_LIBS = $(STROPHE_LIBS) -lstrophe

lib_LTLIBRARIES = libstrophe.la
lib_LIBRARIES = libstrophe.a

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libstrophe.pc

## Main build targets

SOURCES = src/auth.c src/conn.c src/ctx.c \
	src/event.c src/handler.c src/hash.c \
	src/jid.c src/md5.c src/sasl.c src/sha1.c \
	src/snprintf.c src/sock.c src/stanza.c src/thread.c \
	src/tls_openssl.c src/util.c

libstrophe_la_CFLAGS = $(STROPHE_CFLAGS) $(PARSER_CFLAGS)
libstrophe_la_include_HEADERS = strophe.h strophepp.h
libstrophe_la_includedir = $(includedir)
libstrophe_la_SOURCES = $(SOURCES)
libstrophe_a_CFLAGS = $(STROPHE_CFLAGS) $(PARSER_CFLAGS)
libstrophe_a_include_HEADERS = strophe.h strophepp.h
libstrophe_a_includedir = $(includedir)
libstrophe_a_SOURCES = $(SOURCES)

if PARSER_EXPAT
libstrophe_la_SOURCES += src/parser_expat.c
libstrophe_la_SOURCES += expat/lib/xmlparse.c expat/lib/xmltok.c expat/lib/xmlrole.c
libstrophe_la_CFLAGS += -DXML_DTD -DXML_NS -DXML_CONTEXT_BYTES=1024 -DXML_STATIC \
	-I$(top_srcdir)/expat/lib
else
libstrophe_la_SOURCES += src/parser_libxml2.c
libstrophe_la_CFLAGS += -lxml2
endif


## Examples
noinst_PROGRAMS = examples/active examples/roster examples/basic examples/bot
examples_active_SOURCES = examples/active.c
examples_active_CFLAGS = $(EXAMPLES_FLAGS)
examples_active_LDADD = $(EXAMPLES_LIBS)
examples_roster_SOURCES = examples/roster.c
examples_roster_CFLAGS = $(EXAMPLES_FLAGS)
examples_roster_LDADD = $(EXAMPLES_LIBS)
examples_basic_SOURCES = examples/basic.c
examples_basic_CFLAGS = $(EXAMPLES_FLAGS)
examples_basic_LDADD = $(EXAMPLES_LIBS)
examples_bot_SOURCES = examples/bot.c
examples_bot_CFLAGS = $(EXAMPLES_FLAGS)
examples_bot_LDADD = $(EXAMPLES_LIBS)


## Tests
TESTS = tests/check_parser
check_PROGRAMS = tests/check_parser
tests_check_parser_SOURCES = tests/check_parser.c
tests_check_parser_CFLAGS = @check_CFLAGS@ $(TESTS_CFLAGS) \
	-I$(top_srcdir)/src
tests_check_parser_LDADD = @check_LIBS@ $(TESTS_LIBS)

