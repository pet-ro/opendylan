AC_INIT([Functional Developer], [2.1 alpha 4])
AC_PREREQ(2.50)

AC_DEFUN(FD_PLATFORM,[
case $1 in
i*86-pc-linux-gnu*) $2=x86-linux ;;
i*86-*-freebsd*) $2=x86-bsd ;;
powerpc-*-linux-gnu*) $2=ppc-linux ;;
powerpc-apple-darwin*) $2=ppc-darwin ;;
*) AC_MSG_ERROR([The $1 platform is not supported.]) ;;
esac])

AC_CANONICAL_BUILD
FD_PLATFORM($build,fd_build)
AC_SUBST(fd_build)

AC_CANONICAL_HOST
FD_PLATFORM($host,fd_host)
AC_SUBST(fd_host)

AC_CANONICAL_TARGET
FD_PLATFORM($target,fd_target)
AC_SUBST(fd_target)

AC_PROG_INSTALL
AC_PROG_LN_S

AC_PATH_PROG(PERL, perl, no)
test "$PERL" = no && AC_MSG_ERROR([
perl is required to build Functional Developer])
AC_SUBST(PERL)

PERL_MODULES="File::Spec Getopt::Long XML::Parser"
for module in $PERL_MODULES; do
  AC_MSG_CHECKING(for Perl module $module)
  $PERL -M$module -e 'exit 0' || AC_MSG_ERROR([
$module is required to build Functional Developer])
  AC_MSG_RESULT(yes)
done

AC_PATH_PROG(FDCOMPILE, fdcompile, no)
test "$FDCOMPILE" = no && AC_MSG_ERROR([
fdcompile is required to bootstrap Functional Devleloper])
AC_SUBST(FDCOMPILE)

# TODO: figure out the bootstrap type given the fdcompile version
bootstrap_target=3-stage-bootstrap
AC_SUBST(bootstrap_target)

AC_MSG_CHECKING(for Library Packs to include)
LIBRARY_PACKS=Core
AC_ARG_ENABLE(network,
	      AC_HELP_STRING([--disable-network],
	                     [Do not build the basic networking library]),
	      ,LIBRARY_PACKS="$LIBRARY_PACKS Network")
AC_ARG_ENABLE(testworks,
	      AC_HELP_STRING([--enable-testworks],
	                     [Build the unit test framework library]),
	      LIBRARY_PACKS="$LIBRARY_PACKS TestWorks")
AC_ARG_ENABLE(dood,
	      AC_HELP_STRING([--enable-dood],
	                     [Build the DOOD persistent storage library]),
	      LIBRARY_PACKS="$LIBRARY_PACKS DOOD")
AC_MSG_RESULT($LIBRARY_PACKS)
AC_SUBST(LIBRARY_PACKS)

AC_CONFIG_FILES([Makefile])

AC_OUTPUT