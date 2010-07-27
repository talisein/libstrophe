AC_INIT([libstrophe], [trunk], [jack@metajack.im])
AM_INIT_AUTOMAKE
AC_CONFIG_MACRO_DIR([m4])

AC_PROG_CC
AM_PROG_CC_C_O
LT_INIT

#http://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html
AC_SUBST(STROPHE_SO_VERSION, [1:2:0])
AC_SUBST(STROPHE_API_VERSION, [1.0])

AC_CHECK_HEADER(openssl/ssl.h, [], [AC_MSG_ERROR(["couldn't find openssl headers, openssl required"])])
PKG_CHECK_MODULES([check], [check >= 0.9.4])

AC_MSG_CHECKING([whether to build with debug information])
AC_ARG_ENABLE([debug],
			  [AS_HELP_STRING([--enable-debug],
							  [enable debug data generation (def=no)])],
							  [debugit="$enableval"],
							  [debugit=no])
AC_MSG_RESULT([$debugit])


AC_ARG_WITH([libxml2], 
            [AS_HELP_STRING([--with-libxml2], [use libxml2 for XML parsing])],
            [],
            [with_libxml2=check])

if test "x$with_libxml2" != xno; then
  PKG_CHECK_MODULES([libxml2], [libxml-2.0 >= 2.7],
                    [with_libxml2=yes],
                    [AC_MSG_ERROR(["couldn't find libxml2"])])
else
  AC_CHECK_FUNCS(memmove)
  AC_C_BIGENDIAN([byteorder=1234], [byteorder=4321], [], [])
fi

if test "x$with_libxml2" = xyes; then
  with_parser=libxml2
  STROPHE_CFLAGS=$libxml2_CFLAGS
  STROPHE_LIBS=$libxml2_LIBS
else
  with_parser=builtin
  STROPHE_CFLAGS=
  STROPHE_LIBS=
fi

if test x"$debugit" = x"yes"; then
	AC_DEFINE([DEBUG],[],[Debug Mode])
	AM_CFLAGS="$AM_CFLAGS -g -Wall -Werror -Wno-uninitialized -O0"
else
	AC_DEFINE([NDEBUG],[],[No-debug Mode])
	AM_CFLAGS="$AM_CFLAGS -O3"
fi

STROPHE_CFLAGS=$STROPHE_CFLAGS
STROPHE_LIBS="$STROPHE_LIBS -lssl -lresolv"

AC_MSG_NOTICE([libstrophe will use the $with_parser XML parser])
AC_SEARCH_LIBS([socket], [socket])

AM_CONDITIONAL([BUILD_EXPAT], [test x$with_parser = xbuiltin])
AM_CONDITIONAL([PARSER_EXPAT], [test x$with_parser != xlibxml2])
AC_DEFINE_UNQUOTED([BYTEORDER], [$byteorder])
AC_SUBST(STROPHE_CFLAGS)
AC_SUBST(STROPHE_LIBS)

AC_CONFIG_FILES([Makefile libstrophe.pc])
AC_OUTPUT
