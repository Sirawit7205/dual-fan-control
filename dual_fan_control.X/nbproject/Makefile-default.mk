#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/dual_fan_control.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/dual_fan_control.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/adc/src/adc1.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/timer/src/tcb1.c mcc_generated_files/timer/src/tcb0.c mcc_generated_files/timer/src/tca0.c mcc_generated_files/timer/src/rtc.c mcc_generated_files/vref/src/vref.c main.c millis.c trimpot.c speed_controller.c display.c speed_measurement.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o ${OBJECTDIR}/main.o ${OBJECTDIR}/millis.o ${OBJECTDIR}/trimpot.o ${OBJECTDIR}/speed_controller.o ${OBJECTDIR}/display.o ${OBJECTDIR}/speed_measurement.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o.d ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/millis.o.d ${OBJECTDIR}/trimpot.o.d ${OBJECTDIR}/speed_controller.o.d ${OBJECTDIR}/display.o.d ${OBJECTDIR}/speed_measurement.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o ${OBJECTDIR}/main.o ${OBJECTDIR}/millis.o ${OBJECTDIR}/trimpot.o ${OBJECTDIR}/speed_controller.o ${OBJECTDIR}/display.o ${OBJECTDIR}/speed_measurement.o

# Source Files
SOURCEFILES=mcc_generated_files/adc/src/adc1.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/timer/src/tcb1.c mcc_generated_files/timer/src/tcb0.c mcc_generated_files/timer/src/tca0.c mcc_generated_files/timer/src/rtc.c mcc_generated_files/vref/src/vref.c main.c millis.c trimpot.c speed_controller.c display.c speed_measurement.c

# Pack Options 
PACK_COMPILER_OPTIONS=-I "${DFP_DIR}/include"
PACK_COMMON_OPTIONS=-B "${DFP_DIR}/gcc/dev/attiny1616"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/dual_fan_control.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATtiny1616
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/default/a84b68887f31ac31229f594fae9195d3eb6d510c .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.ok ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.err 
	 ${MP_CC} $(MP_EXTRA_AS_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -DDEBUG  -x assembler-with-cpp -c -D__$(MP_PROCESSOR_OPTION)__  -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o mcc_generated_files/system/src/protected_io.S  -DXPRJ_default=$(CND_CONF)  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1
	
else
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/default/2e31ec095368f29d934388f5375a2f0705b493fd .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.ok ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.err 
	 ${MP_CC} $(MP_EXTRA_AS_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x assembler-with-cpp -c -D__$(MP_PROCESSOR_OPTION)__  -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o mcc_generated_files/system/src/protected_io.S  -DXPRJ_default=$(CND_CONF)  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.asm.d"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o: mcc_generated_files/adc/src/adc1.c  .generated_files/flags/default/3e808de2559e631c9f8a5c123b80332dcefd46b7 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/adc/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o  -o ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o mcc_generated_files/adc/src/adc1.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/8cf417f1c540ce2cd24191fb24298be823fde366 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/f55198806c09604dc5efce4eb09a57fe9b4d7703 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/97b76bd251530328910c318c47bf9bf9ed5adb5d .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o mcc_generated_files/system/src/clock.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/7038c1f77f4002aaa3f2d21bb8fdd9019716709b .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/e8af4c9d11a374d2bee58f40cb8a69c91d743912 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o mcc_generated_files/system/src/interrupt.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o: mcc_generated_files/timer/src/tcb1.c  .generated_files/flags/default/7135905bdd689ddd08d86531e4bf6103a64b177d .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o mcc_generated_files/timer/src/tcb1.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o: mcc_generated_files/timer/src/tcb0.c  .generated_files/flags/default/58b907d7a15f3369ab291c3acdbefe87ba94d2dc .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o mcc_generated_files/timer/src/tcb0.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o: mcc_generated_files/timer/src/tca0.c  .generated_files/flags/default/3f685bb7637c311dd4aba6a95dc4e1d6bdecc31 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o mcc_generated_files/timer/src/tca0.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o: mcc_generated_files/timer/src/rtc.c  .generated_files/flags/default/1098741ea6a441ffcb746bcb626fcb3b9f40654 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o  -o ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o mcc_generated_files/timer/src/rtc.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/vref/src/vref.o: mcc_generated_files/vref/src/vref.c  .generated_files/flags/default/75018582702ade25ae567838f73314be3acac5a2 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/vref/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/vref/src/vref.o.d" -MT "${OBJECTDIR}/mcc_generated_files/vref/src/vref.o.d" -MT ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o  -o ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o mcc_generated_files/vref/src/vref.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/c31c042f4bd1e025b31955ca7d69575a46f67080 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/millis.o: millis.c  .generated_files/flags/default/832b61c5fe721afd14bee1dce9be3c0f4ef4cf44 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/millis.o.d 
	@${RM} ${OBJECTDIR}/millis.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/millis.o.d" -MT "${OBJECTDIR}/millis.o.d" -MT ${OBJECTDIR}/millis.o  -o ${OBJECTDIR}/millis.o millis.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/trimpot.o: trimpot.c  .generated_files/flags/default/9c357b1647aa86dd34df7c87d7e5254ede83eba .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/trimpot.o.d 
	@${RM} ${OBJECTDIR}/trimpot.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/trimpot.o.d" -MT "${OBJECTDIR}/trimpot.o.d" -MT ${OBJECTDIR}/trimpot.o  -o ${OBJECTDIR}/trimpot.o trimpot.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/speed_controller.o: speed_controller.c  .generated_files/flags/default/10a6349e8a7cc69d3d1416c39a33f87916cb9832 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/speed_controller.o.d 
	@${RM} ${OBJECTDIR}/speed_controller.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/speed_controller.o.d" -MT "${OBJECTDIR}/speed_controller.o.d" -MT ${OBJECTDIR}/speed_controller.o  -o ${OBJECTDIR}/speed_controller.o speed_controller.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/display.o: display.c  .generated_files/flags/default/a513fbf674769c4ecdb5d9fbd6a8f803f5bd6564 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/display.o.d 
	@${RM} ${OBJECTDIR}/display.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/display.o.d" -MT "${OBJECTDIR}/display.o.d" -MT ${OBJECTDIR}/display.o  -o ${OBJECTDIR}/display.o display.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/speed_measurement.o: speed_measurement.c  .generated_files/flags/default/ec56d0247b9fa4ea27f6b74aedc05c942ffceb13 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/speed_measurement.o.d 
	@${RM} ${OBJECTDIR}/speed_measurement.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/speed_measurement.o.d" -MT "${OBJECTDIR}/speed_measurement.o.d" -MT ${OBJECTDIR}/speed_measurement.o  -o ${OBJECTDIR}/speed_measurement.o speed_measurement.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o: mcc_generated_files/adc/src/adc1.c  .generated_files/flags/default/67e0e717cc33dcf8a1a725649e0b8fa411805c39 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/adc/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o  -o ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o mcc_generated_files/adc/src/adc1.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/7b27071af3cc42f4bd4f093b2fa03712d5190101 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/6ff4b8906ca3d24aa7de591295b2c647ad6e8a23 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/52ec79907b66f5f085cda2a37c1790761e00abcc .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o mcc_generated_files/system/src/clock.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/74d37e1dd8c202b4f906a985d6b0b8c6cf3056e1 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/e719ff0d69f5ac26f7ce44d91150a011993a84a0 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o mcc_generated_files/system/src/interrupt.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o: mcc_generated_files/timer/src/tcb1.c  .generated_files/flags/default/6b1803b40b2e171461dae274061d2e83b32ffb58 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tcb1.o mcc_generated_files/timer/src/tcb1.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o: mcc_generated_files/timer/src/tcb0.c  .generated_files/flags/default/7787129dd09ff72616aca228b7ea982c99c20a58 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tcb0.o mcc_generated_files/timer/src/tcb0.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o: mcc_generated_files/timer/src/tca0.c  .generated_files/flags/default/bd9a786082e03558fd532c532934fb5f88d5aecb .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o mcc_generated_files/timer/src/tca0.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o: mcc_generated_files/timer/src/rtc.c  .generated_files/flags/default/7a4195262993f16d326d271b4ecde781fb57408 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o  -o ${OBJECTDIR}/mcc_generated_files/timer/src/rtc.o mcc_generated_files/timer/src/rtc.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/vref/src/vref.o: mcc_generated_files/vref/src/vref.c  .generated_files/flags/default/bf3adc77f59ecf2ca41a811b7bb073041a01cc05 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/vref/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/vref/src/vref.o.d" -MT "${OBJECTDIR}/mcc_generated_files/vref/src/vref.o.d" -MT ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o  -o ${OBJECTDIR}/mcc_generated_files/vref/src/vref.o mcc_generated_files/vref/src/vref.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/261f70954a2e70eb11e271421bd0079ffa0865d2 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/millis.o: millis.c  .generated_files/flags/default/b7f0f49e36d7ca4dd0b1536bc2ba27a00e4a9308 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/millis.o.d 
	@${RM} ${OBJECTDIR}/millis.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/millis.o.d" -MT "${OBJECTDIR}/millis.o.d" -MT ${OBJECTDIR}/millis.o  -o ${OBJECTDIR}/millis.o millis.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/trimpot.o: trimpot.c  .generated_files/flags/default/82d59645120cc872c374ef5705d735b1c143bc83 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/trimpot.o.d 
	@${RM} ${OBJECTDIR}/trimpot.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/trimpot.o.d" -MT "${OBJECTDIR}/trimpot.o.d" -MT ${OBJECTDIR}/trimpot.o  -o ${OBJECTDIR}/trimpot.o trimpot.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/speed_controller.o: speed_controller.c  .generated_files/flags/default/7612d1083996e38a3596fd4483297d0f3511efac .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/speed_controller.o.d 
	@${RM} ${OBJECTDIR}/speed_controller.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/speed_controller.o.d" -MT "${OBJECTDIR}/speed_controller.o.d" -MT ${OBJECTDIR}/speed_controller.o  -o ${OBJECTDIR}/speed_controller.o speed_controller.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/display.o: display.c  .generated_files/flags/default/302395226d2b81298e25303d22740709b142f2a4 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/display.o.d 
	@${RM} ${OBJECTDIR}/display.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/display.o.d" -MT "${OBJECTDIR}/display.o.d" -MT ${OBJECTDIR}/display.o  -o ${OBJECTDIR}/display.o display.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/speed_measurement.o: speed_measurement.c  .generated_files/flags/default/5626660b5e250ec33bcea580219a192c6c9cc915 .generated_files/flags/default/3b4533a90d1df7fc7befce2423d400076e91f5c7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/speed_measurement.o.d 
	@${RM} ${OBJECTDIR}/speed_measurement.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=attiny1616 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -DF_CPU=16000000UL -Wall -MD -MP -MF "${OBJECTDIR}/speed_measurement.o.d" -MT "${OBJECTDIR}/speed_measurement.o.d" -MT ${OBJECTDIR}/speed_measurement.o  -o ${OBJECTDIR}/speed_measurement.o speed_measurement.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/dual_fan_control.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=attiny1616 ${PACK_COMMON_OPTIONS}   -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="${DISTDIR}\dual_fan_control.X.${IMAGE_TYPE}.map"    -o ${DISTDIR}/dual_fan_control.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1 -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
${DISTDIR}/dual_fan_control.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=attiny1616 ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="${DISTDIR}\dual_fan_control.X.${IMAGE_TYPE}.map"    -o ${DISTDIR}/dual_fan_control.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "${DISTDIR}/dual_fan_control.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/dual_fan_control.X.${IMAGE_TYPE}.hex"
	
	
	
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
