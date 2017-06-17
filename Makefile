DEVICE=fr935_sim
SDK=2.3.1
OUTPUT=bin/KISSFace.prg
MONKEY_SDK=~/Work/connectiq-sdk-mac-$(SDK)
CONNIQ=$(MONKEY_SDK)/bin/connectiq
MONKEYC=$(MONKEY_SDK)/bin/monkeyc
MONKEYDO=$(MONKEY_SDK)/bin/monkeydo
PRIVATE_KEY=~/Work/garmin/developer_key.der
MANIFEST=manifest.xml
RESOURCES := $(shell find resources/ -name "*.xml" -exec echo -n {}\  \; | tr " " ":")
MDO := $(shell ps | grep -v grep | grep MonkeyDoDeux | awk '{print $1}')

all: build run
	
build:
	$(MONKEYC) \
	-o $(OUTPUT) \
	-w \
	-y $(PRIVATE_KEY) \
	-z $(RESOURCES) \
	-m $(MANIFEST) \
	source/*.mc \
	-d $(DEVICE) \
	-s $(SDK) 
	
run:
	#[ ! -z "$(MOD)" ] && kill -9 $(MOD)
	$(CONNIQ)
	$(MONKEYDO) $(OUTPUT) $(DEVICE) &
	
dev:
	notifyloop . make build run
	