# Adjust the list og the HAL souce filed builed
set(SOURCES
	Src/stm32f4xx_hal_adc.c
	Src/stm32f4xx_hal_adc_ex.c
	Src/stm32f4xx_hal.c
#	Src/stm32f4xx_hal_can.c
#	Src/stm32f4xx_hal_cec.c
	Src/stm32f4xx_hal_cortex.c
	Src/stm32f4xx_hal_crc.c
#	Src/stm32f4xx_hal_cryp.c
#	Src/stm32f4xx_hal_cryp_ex.c
	Src/stm32f4xx_hal_dac.c
	Src/stm32f4xx_hal_dac_ex.c
#	Src/stm32f4xx_hal_dcmi.c
#	Src/stm32f4xx_hal_dcmi_ex.c
#	Src/stm32f4xx_hal_dfsdm.c
	Src/stm32f4xx_hal_dma2d.c
	Src/stm32f4xx_hal_dma.c
	Src/stm32f4xx_hal_dma_ex.c
#	Src/stm32f4xx_hal_dsi.c
#	Src/stm32f4xx_hal_eth.c
	Src/stm32f4xx_hal_exti.c
#	Src/stm32f4xx_hal_flash.c
#	Src/stm32f4xx_hal_flash_ex.c
#	Src/stm32f4xx_hal_flash_ramfunc.c
#	Src/stm32f4xx_hal_fmpi2c.c
#	Src/stm32f4xx_hal_fmpi2c_ex.c
	Src/stm32f4xx_hal_gpio.c
#	Src/stm32f4xx_hal_hash.c
#	Src/stm32f4xx_hal_hash_ex.c
#	Src/stm32f4xx_hal_hcd.c
	Src/stm32f4xx_hal_i2c.c
	Src/stm32f4xx_hal_i2c_ex.c
#	Src/stm32f4xx_hal_i2s.c
#	Src/stm32f4xx_hal_i2s_ex.c
#	Src/stm32f4xx_hal_irda.c
#	Src/stm32f4xx_hal_iwdg.c
#	Src/stm32f4xx_hal_lptim.c
#	Src/stm32f4xx_hal_ltdc.c
#	Src/stm32f4xx_hal_ltdc_ex.c
#	Src/stm32f4xx_hal_mmc.c
#	Src/stm32f4xx_hal_msp.c
#	Src/stm32f4xx_hal_nand.c
#	Src/stm32f4xx_hal_nor.c
#	Src/stm32f4xx_hal_pccard.c
#	Src/stm32f4xx_hal_pcd.c
#	Src/stm32f4xx_hal_pcd_ex.c
	Src/stm32f4xx_hal_pwr.c
	Src/stm32f4xx_hal_pwr_ex.c
#	Src/stm32f4xx_hal_qspi.c
	Src/stm32f4xx_hal_rcc.c
	Src/stm32f4xx_hal_rcc_ex.c
	Src/stm32f4xx_hal_rng.c
	Src/stm32f4xx_hal_rtc.c
	Src/stm32f4xx_hal_rtc_ex.c
#	Src/stm32f4xx_hal_sai.c
#	Src/stm32f4xx_hal_sai_ex.c
	Src/stm32f4xx_hal_sd.c
#	Src/stm32f4xx_hal_sdram.c
#	Src/stm32f4xx_hal_smartcard.c
#	Src/stm32f4xx_hal_smbus.c
#	Src/stm32f4xx_hal_spdifrx.c
	Src/stm32f4xx_hal_spi.c
#	Src/stm32f4xx_hal_sram.c
	Src/stm32f4xx_hal_tim.c
	Src/stm32f4xx_hal_tim_ex.c
	Src/stm32f4xx_hal_uart.c
	Src/stm32f4xx_hal_usart.c
	Src/stm32f4xx_hal_wwdg.c
#	Src/stm32f4xx_ll_adc.c
#	Src/stm32f4xx_ll_crc.c
#	Src/stm32f4xx_ll_dac.c
#	Src/stm32f4xx_ll_dma2d.c
#	Src/stm32f4xx_ll_dma.c
#	Src/stm32f4xx_ll_exti.c
#	Src/stm32f4xx_ll_fmc.c
#	Src/stm32f4xx_ll_fsmc.c
#	Src/stm32f4xx_ll_gpio.c
#	Src/stm32f4xx_ll_i2c.c
#	Src/stm32f4xx_ll_lptim.c
#	Src/stm32f4xx_ll_pwr.c
#	Src/stm32f4xx_ll_rcc.c
#	Src/stm32f4xx_ll_rng.c
#	Src/stm32f4xx_ll_rtc.c
#	Src/stm32f4xx_ll_sdmmc.c
#	Src/stm32f4xx_ll_spi.c
#	Src/stm32f4xx_ll_tim.c
#	Src/stm32f4xx_ll_usart.c
# 	Src/stm32f4xx_ll_usb.c
#	Src/stm32f4xx_ll_utils.c
)

# Add this lib to rest of the build
add_library(libhal ${SOURCES})

# HAL specific header files
target_include_directories(libhal PUBLIC Inc)

# CMSIS header files
target_include_directories(libhal PUBLIC ../cmsis)

# Needed to enable the HAL library
target_compile_definitions(libhal PUBLIC USE_HAL_DRIVER)

# Specyfy the device type and the HSE_VALUE 
# in the CMakeLists.txt in the root of the project
target_compile_definitions(libhal PUBLIC ${DEVICE})
target_compile_definitions(libhal PUBLIC HSE_VALUE=${HSE_VALUE})

# Add more flags as needed
set(COMPILER_FLAGS 
	-Os 
)

target_compile_options(libhal PRIVATE ${COMPILER_FLAGS})
