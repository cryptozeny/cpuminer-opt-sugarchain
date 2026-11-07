/* arm64 shim: maps the x86 intrinsic header onto sse2neon. _mm_malloc and _mm_free come from clang's mm_malloc.h,
 * which works on any target, so sse2neon's own definitions are switched off. */
#include <mm_malloc.h>
#define SSE2NEON_ALLOC_DEFINED 1
#include "sse2neon.h"
