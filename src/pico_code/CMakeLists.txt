cmake_minimum_required(VERSION 3.13)
include(pico_sdk_import.cmake)
project(pico_code C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
pico_sdk_init()
add_executable(pico_code
pico_code.c
)

# 
pico_enable_stdio_usb(pico_code 1)
pico_enable_stdio_uart(pico_code 1)
pico_add_extra_outputs(pico_code)
target_link_libraries(pico_code pico_stdlib)
