CC ?= cc
CFLAGS ?= -O2 -Wall -Wextra

ROOT := ../..
INCLUDE_DIR := $(ROOT)/include
LIB_COMMON := $(ROOT)/build/lib/libcommon.a

BIN := loadgen
SRCS := main.c stats.c
OBJS := $(SRCS:.c=.o)

all: $(BIN)

$(BIN): $(OBJS) $(LIB_COMMON)
	$(CC) -o $@ $(OBJS) $(LIB_COMMON)

%.o: %.c $(LIB_COMMON)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

clean:
	rm -f $(OBJS) $(BIN)

.PHONY: all clean
