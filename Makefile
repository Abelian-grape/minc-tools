# --------------------------------------------------------------------
#
# MINC Makefile
#

ROOT = .
include $(ROOT)/Makefile_machine_specific
include $(ROOT)/Makefile_configuration

BUILD_SUBDIRS = src $(FORTRAN_SUBDIR) test doc progs

TEST_SUBDIRS = test $(FORTRAN_SUBDIR)

# --------------------------------------------------------------------

.PRECIOUS : $(SUBDIRS)

default : build runtest

all build clean:
	$(MAKE) 'TARGET=$@' 'SUBDIRS=$(BUILD_SUBDIRS)' subdirs

runtest :
	$(MAKE) 'TARGET=test' 'SUBDIRS=$(TEST_SUBDIRS)' subdirs

subdirs :
	@for dir in $(SUBDIRS); \
	   do if [ -d $$dir ]; \
	   then \
	      cd $$dir; \
	      echo Making $(TARGET) in $$dir; \
	      $(MAKE) $(TARGET); \
	      cd ..; \
	   fi; \
	 done
