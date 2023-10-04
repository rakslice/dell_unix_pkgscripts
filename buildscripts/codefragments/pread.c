ssize_t pread(int fd, void *buf, size_t len, off_t offset) {
	ssize_t out;
	ssize_t cur_offset;
	ssize_t read_errno;

	cur_offset = lseek(fd, 0,  SEEK_CUR);
	if (-1 == cur_offset)
		return -1;

	if (-1 == lseek(fd, offset, SEEK_SET))
		return -1;
	
	out = read(fd, buf, len);
	read_errno = errno;

	if (-1 == lseek(fd, cur_offset, SEEK_SET)) {
	  if (-1 == lseek(fd, cur_offset, SEEK_SET)) {
	    if (-1 == lseek(fd, cur_offset, SEEK_SET)) {
		if (out == -1) { // read failed
			errno = read_errno; // use the errno from the read
		} else {
			// use the errno from the failed last seek
		}
		return -1;
	    }
	  }
	}

	errno = read_errno;
	return out;
}

