/*
 * RPC server code for the remote add function
 */

#include "add.h"

int *
add_1_svc(intpair *argp, struct svc_req *rqstp)
{
	static int  result;

	result = argp->a + argp->b;
	printf("add(%d, %d) = %d\n", argp->a, argp->b, result);
	return &result;
}

