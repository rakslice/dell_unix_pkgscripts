long long strtoll(const char *s, char **endptr, int base) {
  long long sum = 0;
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
        return 0LL;
    }

    if (dig >= base) {
      if (endptr) {
        *endptr = s;
      }
      return 0LL;
    }

    sum = sum*base + dig;
  }
  if (neg)
        sum = -sum;
  if (endptr) {
    *endptr = s;
  }
  return sum;
}