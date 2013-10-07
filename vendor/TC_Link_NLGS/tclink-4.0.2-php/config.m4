dnl $Id: config.m4,v 2.00 2001/07/26
AC_DEFUN(SSL_LIB_CHK,[if ((test -r $i$1/libssl.so) || (test -r $i$1/libssl.dylib) || test -n "`ls $i$1/libssl.so* 2>/dev/null`"); then SSL_DIR=$i;])

PHP_ARG_WITH(tclink,for TCLink support,
[  --with-tclink[=DIR]    Include TCLink support.  DIR is the TCLink
                          base install directory, defaults to ../C.
                          Set DIR to "shared" to build as a dl, or "shared,DIR" 
                          to build as a dl and still specify DIR.])

PHP_ARG_WITH(ssl,for TCLink SSL  support,
[  --with-ssl[=DIR]       Include TCLink SSL support.  DIR is the SSL
                          library directory, which defaults to /usr/lib.])


if test "$PHP_TCLINK" != "no"; then
  AC_DEFINE(HAVE_TCLINK,1,[ ])
  PHP_EXTENSION(tclink,$ext_shared)
fi

dnl Need to have a way to sepcify the include dir as well
if test "$PHP_SSL" != "no"; then
  for i in /lib /usr/local/lib /usr/lib $PHP_SSL; do
      SSL_LIB_CHK(/)
    fi
  done
  if test -z "$SSL_DIR"; then
    AC_MSG_ERROR(Cannot find libssl.so. Please specify the installation path for SSL)
  fi

  AC_DEFINE(HAVE_SSL,1,[ ])

fi

TCLINK_SHARED_LIBADD="-lssl -lcrypto -L$SSL_DIR";
CFLAGS="-I$SSL_DIR/../include"
TCLINK_VERSION="4.0.2-PHP-`uname -sm | tr ' ' -`"
AC_DEFINE_UNQUOTED([TCLINK_VERSION], "$TCLINK_VERSION", [TCLink version string.])

PHP_SUBST(TCLINK_INCLUDE)
PHP_SUBST(TCLINK_SHARED_LIBADD)

