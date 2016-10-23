grsecurity kernel build and packaging scripts for Slackware Linux
=================================================================

**WARNING**: This project is stalled as of grsecurity's [announcement](https://grsecurity.net/announce.php)

Original kernel sources for Slackware available here:
  * ftp://ftp.slackware.com/pub/slackware/slackware-current/source/k/
  * ftp://ftp.slackware.com/pub/slackware/slackware64-current/source/k/ (for x86\_64)

How to use?
-----------

(In a nutshell)

1. Patch your kernel sources with [grsecurity](https://grsecurity.net/download.php)
2. Get the appropriate config from the configs dir and ```cat``` that to ```.config``` in your kernel sources dir
3. Compile the kernel
4. Run the appropriate packaging script(s)
5. Install the new grsecurity kernel package
6. Configure LILO and [make the initrd image](http://ftp.slackware.com/pub/slackware/slackware-14.2/README.initrd) ([for x86\_64](http://ftp.slackware.com/pub/slackware/slackware64-14.2/README.initrd)) if necessary
7. Profit

### Modules

The packaging script for the kernel modules requires that you first run ```make modules_install``` and then run the packaging script itself. After that, you can remove the installed modules and install the package.

Notes
-----

It's quite hard to try to keep up with grsecurity (and with that, the Linux kernel) versions and make separate configs for x86/x86\_64 and generic/huge kernels. That's why this repository might be a mess from time to time :) The safest bet is, that the most recent grsec is available at least for the x86\_64 generic kernel. There are different branches for different kernel versions, so check the branches for the latest version, as the most recent is not necessarily merged into master.

If you're running X11, you need to disable the [CONFIG\_GRKERNSEC\_IO](https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Disable_privileged_I.2FO).

If you're running a desktop in general, you might want to change the [Usage Type](https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Usage_Type) from [Server](https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Server) to [Desktop](https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Desktop).

You can get the ```paxctl``` and ```gradm``` tools from [SBo](http://slackbuilds.org/):
  * <http://slackbuilds.org/repository/14.2/system/paxctl/>
  * <http://slackbuilds.org/repository/14.2/system/gradm/>

### Verify

* grsecurity can be verified with Bradley Spengler's PGP key 0x44D1C0F82525FE49
* Linux kernel can be verified with Greg Kroah-Hartman's PGP key [0x38DBBDC86092693E](https://www.kernel.org/signature.html)

### Other options to consider

| Option                                                                                                                                                                    | Note                                  |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------- |
| [CONFIG_GRKERNSEC_DENYUSB_FORCE](https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Reject_all_USB_devices_not_connected_at_boot) | This option might be good for servers |

TODO
----
* Get grsecurity version from **include/linux/gracl.h**
