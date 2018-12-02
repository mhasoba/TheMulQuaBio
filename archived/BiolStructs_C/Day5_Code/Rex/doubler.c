#include <R.h>
#include <Rdefines.h>

SEXP double_me(SEXP x)
{
	SEXP result;

	PROTECT(result = NEW_INTEGER(1));

	int y = (INTEGER(x)[0]);
	y = y * 2;

	(INTEGER(result)[0]) = y;

	UNPROTECT(1); // The number here needs to balance the number of calls to PROTECT
	return result;
}
