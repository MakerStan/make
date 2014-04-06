---
title: "Programming with AVR"
author: "MakerStan"
created: "Match 31, 2014"
edited: "March 31, 2014"
layout: "default"
isPage: true
preview: "The chip used on an Arduino Uno is ATMega328p. This is the AVR family of micro-controllers made by Atmel. You purchase the chip by itself for the fraction of the cost of an Arduino and directly program on it."
---
If you are interested in [Arduino](http://arduino.cc/) programming, its likely that you will do more than one project. If you would like to leave a project as-is and work on another one, you could either buy a new Arduino or just buy the chip (ATMega328p) that is on the [Arduino Uno R3](http://arduino.cc/en/Main/ArduinoBoardUno). You can buy the chips from:

$5.95 from Adadruit at [Arduino bootloader-programmed chip (Atmega328P)](http://www.adafruit.com/products/123) <br />
$5.90 from Amazon at [ATMEGA328P-PU with Arduino Bootloader - Uno](http://www.amazon.com/dp/B007SH0D0A)

If you buy the chip, you will need an AVR Programmer. This is something that will write your code to the chip. This process is called flashing. This [tutorial](http://arduino.cc/en/Tutorial/ArduinoToBreadboard) describes how you can also use your Arduino to flash a chip. If your do not have an Arduino, here are a few programmers that you can consider.

$14.95 from Sparkfun at [Pocket AVR Programmer](https://www.sparkfun.com/products/9825). Designed in collaboration with [Ladyada](https://github.com/ladyada).<br />
$11.95 from Amazon at [SainSmart USB ISP Programmer for ATMEL AVR ATMega ATTiny 51 Board](http://www.amazon.com/dp/B0051SRZWC/) <br />
$22.00 from Adafruit at [USBtinyISP AVR Programmer Kit (USB SpokePOV Dongle) - v2.0](http://www.adafruit.com/products/46) <br />
$19.95 from Pololu at [Pololu USB AVR Programmer](http://www.pololu.com/product/1300/) <br />
$34.00 from Atmel at [Atmel AVRISP mkII In-System Programmer (ATAVRISP2)](http://store.atmel.com/PartDetail.aspx?q=p:10500054#tc:description) <br />
$37.50 from Digi-Key at [ATAVRISP](http://www.digikey.com/product-detail/en/ATAVRISP2/ATAVRISP2-ND/898891) <br />

Typically you would write the code in C. See [blinkLED.c](https://github.com/hexagon5un/AVR-Programming/blob/master/Chapter02_Programming-AVRs/blinkLED/blinkLED.c) from the book [AVR-Programming](http://littlehacks.org/AVR-Programming) by Elliot Williams.

**References**
1. AVR-Programming by Elliot Williams is a good book. You can find more about it on [his website](http://littlehacks.org/AVR-Programming).
2. Code examples from the AVR-Programming book by Elliot Williams can be found on GitHub [here](https://github.com/hexagon5un/AVR-Programming)
