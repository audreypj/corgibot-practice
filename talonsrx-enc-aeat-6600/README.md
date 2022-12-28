talonsrx-enc-aeat-6600
======================

A TalonSRX-compatible magnetic encoder with quadrature/incremental (A/B/I) and analog/absolute (PWM + cap) position output. This design implements the [AEAT-6600 sensor](https://github.com/ihartwig/frc-on-ftc-hw/blob/main/datasheets/AV02-2792EN-Data-Sheet-AEAT-6600-T16-2022-02-23.pdf) to use these outputs while also making the SSI/OTP pins available on a removable 6-pin programming header.

Accessing desired modes may (TBD?) [require OTP programming](https://github.com/ihartwig/frc-on-ftc-hw/blob/main/datasheets/av02-2791en_an_5501_aeat-6600_2014-04-21.pdf). It looks like the defaults are 8 CPR ABI incremental and no PWM absolute output.

The PCB is designed with 2 use cases in mind, though others may be possible
* (default) 3.3V operation from the [Data Port](https://store.ctr-electronics.com/content/user-manual/Talon%20SRX%20User's%20Guide.pdf) 0.05" pin header for incremental seeded by absolute position - HW default
    * Note that the Analog Input and Quadrature Index pins (3 & 9) differ between the TalonSRX and [Mag Encoder docs](https://store.ctr-electronics.com/content/user-manual/Magnetic%20Encoder%20User%27s%20Guide.pdf), so this design implements the pins described in the Mag Encoder docs to attempt compatibility.
* 5V operation from the 0.1" pin header for absolute position only - modify solder jumpers for 5V usage

<img alt="README-talonsrx-enc-aeat-6600-Front.png" src="https://raw.githubusercontent.com/ihartwig/frc-on-ftc-hw/main/talonsrx-enc-aeat-6600/README-talonsrx-enc-aeat-6600-Front.png" height="300px" /> <img alt="README-talonsrx-enc-aeat-6600-Back.png" src="https://raw.githubusercontent.com/ihartwig/frc-on-ftc-hw/main/talonsrx-enc-aeat-6600/README-talonsrx-enc-aeat-6600-Back.png" height="300px" />
