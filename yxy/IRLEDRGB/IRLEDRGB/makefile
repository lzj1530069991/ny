ICBODY       := NY8A051D
CLIENT_NAME  := hmm
CB_FILE      := IRLEDRGB.cb
HOST_TOOL    := NYIDE 3.92
USER_C       := main.c 
LIBS         :=  
USER_ASM     := 
OUT_NAME     := IRLEDRGB
CC_PATH      := C:\Nyquest\NYC_NY8
TEMP_FOLDER  := 

#  - small: disable bank ram
#  - small_8b: disable bank ram (NY8B series)
#  - bank2: 2 bank ram
#  - bank2_8b: 2 bank ram (NY8B series)
#  - bank4: 4 bank ram
MODEL := small

ENABLE_INIT_BSS := 1

CC := sdcc
AS := nyas
LD := nylinker
AR := nyar

LDFLAGS     := -p $(ICBODY) --client "$(CLIENT_NAME)" -L "$(CC_PATH)/lib"      \
               -g -M --riffbin --elf --disasm          \
               --host "$(HOST_TOOL)" --cinit --no-programchecksum             \
               --codechecksum --opt-banksel  --w-no 32797 --lang en-us

CFLAGS      := -mny8 --errfmt-ny -p$(ICBODY) -D__CPU_$(ICBODY) --debug \
               -I"$(CC_PATH)/include" -I"C:\Nyquest\NYIDE\\include\NY8 C"  -MD --stack-size 16  \
                --backup-stk 2 

ASFLAGS     := -p $(ICBODY) -g -l --w-no 32797 --lang en-us  \
               -I "$(CC_PATH)/inc"

DEPS        := $(patsubst %.c,%.d, $(USER_C))
ASM_SRC     := $(USER_ASM) $(patsubst %.c,%.s, $(USER_C))
OBJS        := $(patsubst %.s,%.o, $(ASM_SRC))
OBJS        := $(patsubst %.asm,%.o, $(OBJS))
OBJS        := $(sort $(OBJS))

LIBS        += $(ICBODY).a
BIN_FILE    := $(strip $(OUT_NAME)).bin

ifneq (,$(findstring small,$(MODEL)))
  LIBS      += libsdcc_small.a
  CFG_FILE  := $(CC_PATH)/cfg/small/$(ICBODY).cfg
else
  LIBS      += libsdcc_bankram.a
  CFG_FILE  := $(CC_PATH)/cfg/bankram/$(ICBODY).cfg
  ASFLAGS   += -D ENABLE_RAM_BANK=1
endif

ifeq ($(ENABLE_INIT_BSS),1)
  LIBS      += startup/$(strip $(MODEL)).a
else
  LIBS      += startup/no-bss/$(strip $(MODEL)).a
endif

.SUFFIXES:
.SECONDARY:
.PHONY: all clean

all: $(BIN_FILE)

$(BIN_FILE): $(OBJS)
	$(LD) $(OBJS) $(LIBS) "$(CB_FILE)" -s "$(CFG_FILE)" -o "$(TEMP_FOLDER)$(OUT_NAME)" $(LDFLAGS)

%.s: %.c
	$(CC) -S $< -o $@ $(CFLAGS)

%.o: %.s
	$(AS) $< $(ASFLAGS)

%.o: %.asm
	$(AS) $< $(ASFLAGS)

-include $(DEPS)

rebuild: clean all

clean:
	-@1>nul 2>nul del "$(OUT_NAME).bin" "$(OUT_NAME).fpga" "$(OUT_NAME).elf" "$(OUT_NAME).link.lst" "$(OUT_NAME).map" "$(OUT_NAME).htm"
	-@1>nul 2>nul del $(patsubst %.c, %.adb, $(USER_C))
	-@1>nul 2>nul del $(patsubst %.c, %.p, $(USER_C))
	-@1>nul 2>nul del $(patsubst %.c, %.d, $(USER_C))
	-@1>nul 2>nul del $(patsubst %.c, %.s, $(USER_C))
	-@1>nul 2>nul del $(addsuffix .o, $(basename $(ASM_SRC)))
	-@1>nul 2>nul del $(addsuffix .lst, $(basename $(ASM_SRC)))

