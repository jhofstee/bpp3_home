#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <linux/input.h>

/* Small program to check the buttons on the BPP3 */
int main(int argc, char *argv[])
{
	fd_set set;
	struct input_event ev;
	int fd, rd, ret;
	char *device;
	struct timeval timeout;

	device = (argc == 1 ? "/dev/input/event0" : argv[1]);

	if ((fd = open(device, O_RDONLY)) == -1) {
		fprintf(stderr, "ERROR: open %s failed\n", device);
		exit(1);
	}

	FD_ZERO(&set);
	FD_SET(fd, &set);

	/* Note: it is a Linux hack to adjust the timeout, lets abuse that.. */
	timeout.tv_sec = 60;
	timeout.tv_usec = 0;

	for(;;) {
		ret = select(fd + 1, &set, NULL, NULL, &timeout);
		if (ret == -1) {
			perror("ERROR: select");
			exit(1);
		} else if (ret == 0) {
			printf("ERROR: timeout\n");
			exit(1);
		}

		if ((rd = read(fd, &ev, sizeof(ev))) < 0) {
			fprintf(stderr, "ERROR: read()");
			exit(1);
		}

		/* Look for key up events */
		if (ev.type == EV_KEY && ev.value == 0)
		{
			/* printf("ev %x %x %x\n", ev.type, ev.code, ev.value); */

			switch(ev.code)
			{
			case KEY_U:
			case KEY_UP:
				printf("u\n");
				exit(0);

			case KEY_R:
			case KEY_RIGHT:
				printf("r\n");
				exit(0);

			case KEY_D:
			case KEY_DOWN:
				printf("d\n");
				exit(0);

			case KEY_L:
			case KEY_LEFT:
				printf("l\n");
				exit(0);

			case KEY_M:
			case KEY_SPACE:
				printf("m\n");
				exit(0);

			case KEY_A:
			case KEY_ESC:
				printf("a\n");
				exit(0);

			case KEY_B:
			case KEY_ENTER:
				printf("b\n");
				exit(0);

			default:
				fprintf(stderr, "ERROR: unknown key %x\n", ev.code);
				exit(1);
			}
		}
	}

	return 0;
}
