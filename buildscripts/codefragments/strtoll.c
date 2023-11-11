long long strtoll(const char *s, char **endptr, int base) {
  long long sum = 0LL;
  /* ignore leading space/tab only */
  while (' ' == *s || '\t' == *s)
  	++s;
  int neg = 0; /* false */
  if ('+' == *s) {
        ++s;
  } else if ('-' == *s) {
        ++s;
        neg = 1; /* true */
  }
  if (base == 0) {
        if ('0' == *s) {
                ++s;
                if ('x' == *s || 'X' == *s) {
                        ++s;
                        base = 16;
                } else {
                        base = 8;
                }
        } else {
                base = 10;
        }
  }
  while (*s) {
    int dig;
    if (*s >= '0' && *s <= '9') {
        dig = *s++ - '0';
    } else if (*s >= 'a' && *s <= 'z') {
        dig = *s++ - 'a' + 10;
    } else if (*s >= 'A' && *s <= 'Z') {
        dig = *s++ - 'A' + 10;
    } else {
        if (endptr) {
          *endptr = s;
        }
        return sum;
    }

    if (dig >= base) {
      if (endptr) {
        *endptr = s-1;
      }
      return sum;
    }
    if (neg)
      sum = sum*base - dig;
    else
      sum = sum*base + dig;
  }
  if (endptr) {
    *endptr = s;
  }
  return sum;
}
