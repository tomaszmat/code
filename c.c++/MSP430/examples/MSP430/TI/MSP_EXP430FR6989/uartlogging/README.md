## Example Summary

Application that uses the UART driver and LoggerIdle to send Log data to the
UART.

## Peripherals Exercised

* `Board_LED0` - Indicates that the board was initialized within `main()`
* `Board_UART0` - Used to send data to the System Analyzer

## Resources & Jumper Settings

> Please refer to the development board's specific __Settings and Resources__
section in the Getting Started Guide. For convenience, a short summary is also
shown below.

| Development board | Notes                                                  |
| ----------------- | ------                                                 |
| CC2650DK          |                                                        |
| CC2650STE-BLE     |                                                        |
| CC3200            |                                                        |
| DK-TM4C129X       |                                                        |
| EK-TM4C123GXL     |                                                        |
| EK-TM4C1294XL     |                                                        |
| EK-TM4C129EXL     |                                                        |
| MSP-EXP430F5529LP |                                                        |
| MSP-EXP430FR5969  |                                                        |
| MSP-EXP430FR6989  |                                                        |
| MSP-EXP430FR5994  |                                                        |
| MSP-EXP432P401R   |                                                        |
| TMDXDOCK28M36     |                                                        |
| TMDXDOCKH52C1     |                                                        |

> Fields left blank have no specific settings for this example.

## Example Usage

* Run the example. `Board_LED0` turns ON to indicate TI-RTOS driver
initialization is complete.

* This example also demonstrates System Analyzer in CCS. This is accomplished
via sending log records via UART from the target to the host. Please refer to
TI-RTOS User Guide's for more details.

* The UART uses the default 9600 baud rate.

## Application Design Details

* This example demonstrates how to use an application to send Log data through a
UART. Log data will go through `Board_UART0` which is connected to your PC
through the same USB as the JTAG.

* Log events will be sent during idle through `Board_UART0` and can be analyzed
by System Analyzer, or the data can be captured by a program running on the
host. Your host program for collecting the Log data will need to use the serial
COM port that is connected to `Board_UART0`.

## References

* For GNU and IAR users, please read the following website for details
  about enabling [semi-hosting](http://processors.wiki.ti.com/index.php/TI-RTOS_Examples_SemiHosting)
  in order to view console output.
