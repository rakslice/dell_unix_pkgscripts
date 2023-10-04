#include <time.h>

/** dumb time impls that depend on the single threadedness of everything */

struct tm * localtime_r (const time_t *timer, struct tm *buf) {
	struct tm * shared;

	shared = localtime(timer);
	if (shared != NULL) {
		memcpy(buf, shared, sizeof(struct tm));
		return buf;
	} else {
		return NULL;
	}
}

struct tm * gmtime_r (const time_t *timer, struct tm *buf) {
	struct tm * shared;

	shared = gmtime(timer);
	if (shared != NULL) {
		memcpy(buf, shared, sizeof(struct tm));
		return buf;
	} else {
		return NULL;
	}
}
