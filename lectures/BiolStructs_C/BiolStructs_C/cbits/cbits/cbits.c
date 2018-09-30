#include "cbits.h"
#include "cbintern.h"
//#include <stdio.h>

cbitp CBit2cbitp(CBit cb)
{
	return (cbitp)cb;
}

CBit cbitp2CBit(cbitp handl)
{
	return (CBit)handl;
}

int cb_minfields(int minbits)
{
	int fields = 0;
	
	fields = minbits / FIELDWIDTH;
	if (minbits % FIELDWIDTH) {
		++fields;
	}
	//printf("Need %i fields\n", fields);
	return fields;
}

CBit newCBit(int minbits)
{
	cbitp newbts = (cbitp)calloc(1, sizeof(cbit_t));
	
	if (!newbts) {
		return NULL;
	}

	// Calculate min fields required	
	int numfields;
	numfields = cb_minfields(minbits);

	newbts->bits = (cbit64t*)calloc(numfields, sizeof(cbit64t));

	if (!newbts->bits) {
		free(newbts);
		return NULL;
	}
	
	newbts->nelems = numfields;
	newbts->maxbit = minbits;

	return(cbitp2CBit(newbts));
}

int deleteCBit(CBit cb)
{
	//cbitp cb = CBit2cbitp(oldcb);
	if (cb) {
		if (cb->bits) {
			free(cb->bits);
		}
		else {
			return 2;
		}
		free(cb);
		return 0;
	}
	else {
		return 1;
	}
}


int CBitSet(int position, CBit cb)
{
	if (!cb) return 1;
	
	cbit64t set = 1;
	//cbitp cbp = CBit2cbitp(cb);

	cb->bits[position/(FIELDWIDTH)] |= (set << (position % FIELDWIDTH));

	return 0;
}


int CBitClear(int position, CBit cb)
{
	if (!cb) return 1;
	
	cbit64t set = 1;
	//cbitp cbp = CBit2cbitp(cb);

	cb->bits[position/(FIELDWIDTH)] &= ~(set << (position % FIELDWIDTH));

	return 0;
}


int CBitZero(CBit cb)
{
	if (!cb) return 1;
	//cbitp cbp = (cbitp)cb;
	
	memset(cb->bits, 0, cb->nelems * sizeof(cbit64t));
	return 0;
}

int CBitAND(CBit dest, const CBit cb1, const CBit cb2)
{
	int ret = 0;

	if (cb1 && cb2) {
//		cbitp cbp1 = CBit2cbitp(cb1);
//		cbitp cbp2 = CBit2cbitp(cb2);
		int i = 0;
		int fields; 
		(cb1->nelems < cb2->nelems) ?
			(fields = cb1->nelems) : (fields = cb2->nelems);
		if (dest) {
			// cbpR = CBit2cbitp(dest);
			for (i = 0; i < fields; ++i) {
				if((dest->bits[i] = (cb1->bits[i] & cb2->bits[i]))) {
					ret = 1;
				}
			}
//			dest = cbitp2CBit(cbpR);
		}
		else {
			for (i = 0; i < fields; ++i) {
				if(cb1->bits[i] & cb2->bits[i]) {
					return 1;
				}
			}
		}
	}
	
	return ret;
}

int CBitOR(CBit dest, const CBit cb1, const CBit cb2)
{
	int ret = 0;

	if (cb1 && cb2) {
		//cbitp cbp1 = CBit2cbitp(cb1);
		//cbitp cbp2 = CBit2cbitp(cb2);
		int i = 0;
		int fields;
		(cb1->nelems < cb2->nelems) ?
			(fields = cb1->nelems) : (fields = cb2->nelems);
		if (dest) {
			//cbitp cbpR = CBit2cbitp(dest);
			for (i = 0; i < fields; ++i) {
				if((dest->bits[i] = (cb1->bits[i] | cb2->bits[i]))) {
					ret = 1;
				}
			}
//			dest = cbitp2CBit(cbpR);
		}
		else {
			for (i = 0; i < fields; ++i) {
				if(cb1->bits[i] | cb2->bits[i]) {
					return 1;
				}
			}
		}
	}
	
	return ret;
}

int CBitXOR(CBit dest, const CBit cb1, const CBit cb2)
{
	int ret = 0;

	if (cb1 && cb2) {
//		cbitp cbp1 = CBit2cbitp(cb1);
//		cbitp cbp2 = CBit2cbitp(cb2);
		int i = 0;
		int fields = cb1->nelems;
		(cb1->nelems < cb2->nelems) ?
			(fields = cb1->nelems) : (fields = cb2->nelems);
		if (dest) {
			//cbitp cbpR = CBit2cbitp(dest);
			for (i = 0; i < fields; ++i) {
				if((dest->bits[i] = (cb1->bits[i] ^ cb2->bits[i]))) {
					ret = 1;
				}
			}
//			dest = cbitp2CBit(cbpR);
		}
		else {
			for (i = 0; i < fields; ++i) {
				if(cb1->bits[i] ^ cb2->bits[i]) {
					return 1;
				}
			}
		}
	}
	return ret;
}

int CBitCmp(const CBit cb1, const CBit cb2)
{
	assert(cb1 && cb2);
//	cbitp cbp1 = CBit2cbitp(cb1);
//	cbitp cbp2 = CBit2cbitp(cb2);
	int i = 0;
	int fields = cb1->nelems;

	if (cb1->nelems != cb2->nelems) {
		return cb1->nelems - cb2->nelems;
	}

	for (i = fields-1; i;i--) {
		if (cb1->bits[i] != cb2->bits[i]) {
			return cb1->bits[i] - cb2->bits[i];
		}
	}
	return 0;
}

int CBitInv(CBit dest, const CBit cb)
{

//	cbitp destp = CBit2cbitp(dest);
//	cbitp cbp = CBit2cbitp(cb);
	int i = 0;
	int fields = cb->nelems;
	int ret = 0;

	for (i = 0; i < fields; ++i) {
		if ((dest->bits[i] = ~(cb->bits[i]))) {
			ret = 1;
		}
	}
	return ret;
}
