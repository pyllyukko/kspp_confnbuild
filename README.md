grsecurity kernel build and packaging scripts for Slackware Linux
=================================================================

Original kernel sources for Slackware available here:
  * ftp://ftp.slackware.com/pub/slackware/slackware-current/source/k/
  * ftp://ftp.slackware.com/pub/slackware/slackware64-current/source/k/ (for x86_64)

How to use?
-----------

(In a nutshell)

1. Patch your kernel sources with [grsecurity](https://grsecurity.net/download.php)
2. Get the appropriate config from the configs dir and *cat* that to *.config* in your kernel sources dir
3. Compile the kernel
4. Run the appropriate packaging script(s)
5. Install the new grsecurity kernel package
6. Configure LILO and [make the initrd image](http://ftp.slackware.com/pub/slackware/slackware-14.1/README.initrd) ([for x86_64](http://ftp.slackware.com/pub/slackware/slackware64-14.1/README.initrd)) if necessary
7. Profit

### Modules

The packaging script for the kernel modules requires that you first run *make modules_install* and then run the packaging script itself. After that, you can remove the installed modules and install the package.

Notes
-----

If you're running X11, you need to disable the [CONFIG\_GRKERNSEC\_IO](https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Disable_privileged_I.2FO).

If you're running a desktop in general, you might want to change the [Usage Type](https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Usage_Type) from [Server](https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Server) to [Desktop](https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Desktop).

You can get the *paxctl* and *gradm* tools from [SBo](http://slackbuilds.org/):
  * http://slackbuilds.org/repository/14.1/system/paxctl/
  * http://slackbuilds.org/repository/14.1/system/gradm/

### Other options to consider

<table>
  <tr>
    <th>Option</th><th>Note</th>
  </tr>
  <tr>
    <td><a href="https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Reject_all_USB_devices_not_connected_at_boot">CONFIG_GRKERNSEC_DENYUSB_FORCE</a></td><td>This option might be good for servers</td>
  </tr>
</table>
