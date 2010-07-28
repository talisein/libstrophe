AC_INIT([libstrophe], [trunk], [jack@metajack.im])
AM_INIT_AUTOMAKE
AC_CONFIG_MACRO_DIR([m4])

AC_PROG_CC
AM_PROG_CC_C_O
LT_INIT

# http://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html
# TODO: FIXME!!!

AC_SUBST(STROPHE_SO_VERSION, [1:2:0])
AC_SUBST(STROPHE_API_VERSION, [1.0])

AC_CHECK_HEADER(openssl/ssl.h, [], [AC_MSG_ERROR(["couldn't find openssl headers, openssl required"])])
PKG_CHECK_MODULES([check], [check >= 0.9.4])
PKG_CHECK_MODULES([libxml], [libxml-2.0])

AC_SEARCH_LIBS([socket], [socket])

AC_SUBST([libxml_LIBS])
AC_SUBST([libxml_CFLAGS])
AC_CONFIG_FILES([Makefile libstrophe.pc])
AC_OUTPUT
