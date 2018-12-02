#include <stdlib.h>
#include <limits.h>
#include <assert.h>
#include <string.h>

typedef uint64_t cbit64t;
#define FIELDWIDTH (sizeof(cbit64t) * CHAR_BIT)

typedef struct {
	int			nelems;
	int			maxbit;
	cbit64t	*bits;
} cbit_t, *cbitp, *CBit;

//typedef void *CBit;


/*!
  @brief	Creates a new instance of a CBit object
  @param	minbit The minimum number of bits required
  @return	If success, a pointer to an instance of CBit's internal 
			structure, otherwise, a NULL value if allocation failed.
  */
CBit newCBit(int minbit);


/*!
  @brief	Destroys a CBit, returning all memory to the system
  @param	cb The CBit to be destroyed.
  @return	0 if success, 1 if failure.
  */
int	deleteCBit(CBit cb);


/*!
  @brief	Sets the bit at the position indicated; 0-based indexing.
  @param	position The bit position to be set.
  @param	cb The CBit instance where the bit will be set.
  @return	0 if success; 1 if failed.
  */
int CBitSet(int position, CBit cb);


/*!
  @brief	Clears the bit at the position indicated; 0-based indexing.
  @param	position The bit position to be cleared.
  @param	cb The CBit instance where the bit will be cleared.
  @return	0 if success; 1 if failed.
  */
int CBitClear(int position, CBit cb);


/*!
  @brief	Clears all bits in in a CBit.	
  @param	cb The CBit to be set to all-0.
  @return	0 if success; 1 if failed.
  */
int CBitZero(CBit cb);


/*!
  @brief	Simulates bitwise AND using two CBits.
  @param	dest Optional destination CBit if caller needs to store the 
			result. Otherwise, this param can be NULL.
  @param   cb1 A CBit instance.
  @param	cb2 A Cbit instance.
  @return	1 if sets intersect; 0 if intersection is empty.
 */
int CBitAND(CBit dest, const CBit cb1, const CBit cb2);


/*!
  @brief	Simulates bitwise OR using two CBits.
  @param	dest Optional destination CBit if caller needs to store the 
			result. Otherwise, this param can be NULL.
  @param   cb1 A CBit instance.
  @param	cb2 A Cbit instance.
  @return	1 if set union exists; 0 if union is empty.
 */
int CBitOR (CBit dest, const CBit cb1, const CBit cb2);


/*!
  @brief	Simulates bitwise XOR using two CBits.
  @param	dest Optional destination CBit if caller needs to store the 
			result. Otherwise, this param can be NULL.
  @param   cb1 A CBit instance.
  @param	cb2 A Cbit instance.
  @return	1 if set exclusive OR exists; otherwise, 0.
 */
int CBitXOR(CBit dest, const CBit cb1, const CBit cb2);


/*!
  @brief	Compares two CBits for implicit integral size.
  @discussion This function can be passed to qsort and bsearch in stdlib.h
  @param	cb1 A CBit instance.
  @param	cb2 A CBit instance.
  @return	0 if implied integral values are equal.
			Positive value if cb1 is larger than cb2.
			Negative value if cb2 is larger than cb1.
  */
int CBitCmp(const CBit cb1, const CBit cb2);


/*!
  @brief	Performs bitwise twos-complement on the CBit set.
  @param	dest The CBit instance for storing the result.
  @param	cb A CBit instance to perform the operation on.
  @return	0 if complement is empty, 1 if any bits are set.
  */
int CBitInv(CBit dest, const CBit cb);

int CBitTest(int position, const CBit cb);
