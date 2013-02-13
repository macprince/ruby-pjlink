ruby-pjlink
===========

What Is It?
-----------
A Ruby library for controlling and monitoring data projectors via the PJLink protocol.

What is PJLink?
---------------
PJLink is a standard protocol implemented by many (mostly Japanese) data projector manufacturers for sending control commands to projectors and polling them for status information across an IP network.

To Do
-----
* Implement the password protection part of the standard (connections to password-protected projectors will just fail right now)

Notes
-----
* I wrote this based on testing with Epson and NEC projectors at work. There may be weirdness due to different manufacturers' implementations of the PJLink protocol.
* I make no warranties and take no responsibilities for what you do with this library. In other words, if you somehow overheat your projector and burn the building down, I'M NOT RESPONSIBLE!
* This was written based upon Ruby 1.8.7. It may work in Ruby 1.9, I don't know. I'll support 1.9 when Apple ships it.

More Info
---------
* [The PJLink specifications document](http://pjlink.jbmia.or.jp/english/data/PJLink%20Specifications100.pdf)
* [The PJLink standard committee](http://pjlink.jbmia.or.jp/english/)
