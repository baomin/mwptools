XOS := $(shell uname)

DOTPS=
ifeq ($(XOS),Linux)
 DOPTS += -D HAVE_FIONREAD
endif

VAPI := $(shell valac --api-version)
ifeq ($(VAPI),0.30)
 DOPTS += -D LSRVAL
endif
ifeq ($(VAPI),0.32)
 DOPTS += -D LSRVAL
endif
ifeq ($(VAPI),0.34)
 DOPTS += -D LSRVAL
endif

GTKOK := $(shell pkg-config --atleast-version=3.22 gtk+-3.0; echo $$?)

ifneq ($(GTKOK), 0)
 DOPTS += -D OLDGTK
endif

TARGET=2.46
VTEVERS=2.91

OPTS += -X -O2 -X -s --thread --target-glib=$(TARGET)

prefix?=$(DESTDIR)/usr
datadir?=$(DESTDIR)/usr
