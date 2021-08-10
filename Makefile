
#SUBDIRS:= admin_scripts/openssl pageServer apiServer uploadServer lib
SUBDIRS:= admin_scripts/openssl pageServer apiServer
# pageServer/lib/client

all:	$(SUBDIRS)

versions: page_server_version api_server_version

page_server_version:
	$(MAKE) -C pageServer version

api_server_version:
	$(MAKE) -C apiServer version

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY:	all $(SUBDIRS) versions

