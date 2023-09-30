#ifndef __STDINT_H__
#define __STDINT_H__

typedef unsigned long long uint64_t;
typedef unsigned long uint32_t;
typedef unsigned short uint16_t;
typedef unsigned char uint8_t;

typedef long long int64_t;
typedef long int32_t;
typedef short int16_t;
typedef char int8_t;

#ifndef uintmax_t
typedef uint64_t uintmax_t;
#endif
typedef int64_t intmax_t;

#define HAVE_INT64_T 1

typedef int32_t intptr_t;
typedef uint32_t uintptr_t;

#define HAVE_INTXX_T 1
#define HAVE_UINTXX_T 1

#define INT64_MAX (9223372036854775807LL)
#define INT64_MIN (-9223372036854775807LL-1)

#define UINT64_MAX (18446744073709551615ULL)

#define INTMAX_MAX INT64_MAX
#define INTMAX_MIN INT64_MIN

#define UINTMAX_MAX UINT64_MAX

#endif

