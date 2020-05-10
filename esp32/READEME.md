# ESP32

## ESP32 info

[www.espressif.com](https://www.espressif.com/en/products/socs/esp32/overview)

[Getting Started](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html)

[Pinout Reference](https://randomnerdtutorials.com/esp32-pinout-reference-gpios/)

![esp32-pinout](docs/images/ESP32-DOIT-DEVKIT-V1-Board-Pinout-36-GPIOs-updated.jpg)

### Projects

[Courses](https://www.espressif.com/en/ecosystem/iot-college/courses)

[Books](https://www.espressif.com/en/ecosystem/iot-college/books?field_type_tid=13&field_book_language_tid=147)

[Projects](https://www.espressif.com/en/ecosystem/iot-college/projects)

## Setup for Windows machine

### Setup Windows Toolchain from Scratch

[Setup Windows Toolchain from Scratch](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/windows-setup-scratch.html)

[Updating ESP-IDF tools on Windows](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/windows-setup-update.html)

## Standard Setup of Toolchain for Linux machine

[Setup Linux Toolchain from Scratch](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-setup-scratch.html)

## Espressif Eclipse Plugins

[Espressif Eclipse Plugins](https://github.com/espressif/idf-eclipse-plugin)

## Arduino core for the ESP32

[Arduino core for the ESP32](https://github.com/espressif/arduino-esp32)

## Set ENV

```sh
. $HOME/esp/esp-idf/export.sh
```

## Serial

Add user to serial group

```sh
sudo usermod -a -G dialout $USER

# May need the following also
sudo chmod 666 /dev/ttyUSB0
```

### Flash

```sh
# idf.py -p PORT [-b BAUD] flash
# PORT = /dev/ttyUSB0
# BAUD = 9600

# flash using default baud rate
idf.py -p /dev/ttyUSB0 flash

# flash using 9600 baud rate
idf.py -p /dev/ttyUSB0 -b 9600 flash
```

### Monitor

```sh
idf.py -p /dev/ttyUSB0 monitor
```
