MCU = IMXRT1062
MCU_DEF = ARDUINO_TEENSY40

OPTIONS = -DF_CPU=600000000 -DUSB_SERIAL -DLAYOUT_US_ENGLISH
OPTIONS += -D__$(MCU)__ -DARDUINO=10813 -DTEENSYDUINO=154 -D$(MCU_DEF)

CPU_OPTIONS = -mcpu=cortex-m7 -mfloat-abi=hard -mfpu=fpv5-d16 -mthumb

CPPFLAGS = $(NIX_CFLAGS_COMPILE) -Wall -g -O2 $(CPU_OPTIONS) -MMD $(OPTIONS) -I. -ffunction-sections -fdata-sections
CXXFLAGS = -std=gnu++20 -felide-constructors -fno-exceptions -fpermissive -fno-rtti -Wno-error=narrowing

LDFLAGS += -Os -Wl,--gc-sections,--relax $(CPU_OPTIONS)

LIBS = -lm -lstdc++ -lteensy-core

CPP_FILES := $(wildcard *.cpp)
TARGETS := $(CPP_FILES:.cpp=.hex)

%.elf: %.o
	$(CC) $(LDFLAGS) -o $@ $< $(LIBS)

%.hex: %.elf
	$(SIZE) $<
	$(OBJCOPY) -O ihex -R .eeprom $< $@

all: $(TARGETS)
