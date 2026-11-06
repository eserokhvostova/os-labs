CC ?= cc
CFLAGS ?= -O2 -Wall -Wextra

ROOT := ..
INCLUDE_DIR := $(ROOT)/include
LIB_DIR := $(ROOT)/build/lib

LIB := $(LIB_DIR)/libcommon.a
OBJS := net.o http.o utils.o

all: $(LIB)

$(LIB): $(OBJS)
	$(shell mkdir -p $(LIB_DIR))
	ar rcs $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

clean:
	rm -f $(OBJS) $(LIB)

.PHONY: all clean
