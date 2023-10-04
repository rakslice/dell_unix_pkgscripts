unsigned long long strtoull(const char *s, char **endptr, int base) {
  unsigned long long sum = 0;
  if ('+' == *s) {
        ++s;
  } else if ('-' == *s) {
        ++s;
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
        return 0ULL;
    }

    if (dig >= base) {
      if (endptr) {
        *endptr = s;
      }
      return 0ULL;
    }

    sum = sum*base + dig;
  }
  if (endptr) {
    *endptr = s;
  }
  return sum;
}
