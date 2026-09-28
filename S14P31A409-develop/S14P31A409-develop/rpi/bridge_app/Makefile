CC ?= cc
CFLAGS ?= -O2 -Wall -Wextra -std=gnu11
LDLIBS += -pthread -lrt -lm
SOURCES = bridge_main.c bridge_api.c cmd_dispatch.c jetson_rx.c jetson_tx.c \
          pc_link.c protocol_timer.c reassembly_shm.c rx_packet_pool.c shm_cmd_queue.c
HEADERS = $(wildcard *.h)

.PHONY: all clean
all: bridge_daemon jetson_cmd_echo

bridge_daemon: $(SOURCES) $(HEADERS)
	$(CC) $(CPPFLAGS) $(CFLAGS) -pthread $(LDFLAGS) -o $@ $(SOURCES) $(LDLIBS)

jetson_cmd_echo: jetson_cmd_echo.c proto.h
	$(CC) $(CPPFLAGS) $(CFLAGS) -pthread $(LDFLAGS) -o $@ $< $(LDLIBS)

clean:
	$(RM) bridge_daemon jetson_cmd_echo
