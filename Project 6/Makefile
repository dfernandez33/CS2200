# Authored by Christopher Tam for Georgia Tech's CS 2200
TARGET = prj5-client

CC     = gcc
CFLAGS = -Wall -Wextra -Wsign-conversion -Wpointer-arith -Wcast-qual -Wwrite-strings -Wshadow -Wmissing-prototypes -Wpedantic -Wwrite-strings -g -std=gnu99

LFLAGS =

SRCDIR = .
INCDIR = $(SRCDIR)
BINDIR = .

SUBMIT_SUFFIX = -networking
SUBMIT_FILES  = $(SRC) $(INC) Makefile prj5-server.py answers.txt

SRC := $(wildcard $(SRCDIR)/*.c)
INC := $(wildcard $(INCDIR)/*.h)

INCFLAGS := $(patsubst %/,-I%,$(dir $(wildcard $(INCDIR)/.)))

.PHONY: all
all:
	@$(MAKE) release && \
	echo "$$(tput setaf 3)$$(tput bold)Note:$$(tput sgr0) this project compiled with release flags by default. To compile for debugging, please use $$(tput setaf 6)$$(tput bold)make debug$$(tput sgr0)."

.PHONY: debug
debug: CFLAGS += -ggdb -g3 -DDEBUG
debug: $(BINDIR)/$(TARGET)

.PHONY: release
release: CFLAGS += -mtune=native -O2
release: $(BINDIR)/$(TARGET)

.PHONY: clean
clean:
	@rm -f $(BINDIR)/$(TARGET)
	@rm -rf $(BINDIR)/$(TARGET).dSYM

.PHONY: submit
submit: clean
	@read -p "Enter your T-Square ID (e.g.: gburdell3): " name; \
	(tar zcfh $$name$(SUBMIT_SUFFIX).tar.gz $(SUBMIT_FILES) && \
	echo "Created submission archive $$(tput bold)$$name$(SUBMIT_SUFFIX).tar.gz$$(tput sgr0).") || \
	(echo "$$(tput bold)$$(tput setaf 1)Error:$$(tput sgr0) Failed to create submission archive." && \
	rm -f $$name$(SUBMIT_SUFFIX).tar.gz)


$(BINDIR)/$(TARGET): $(SRC) $(INC)
	@mkdir -p $(BINDIR)
	@$(CC) $(CFLAGS) $(INCFLAGS) $(SRC) -o $@ $(LFLAGS)
