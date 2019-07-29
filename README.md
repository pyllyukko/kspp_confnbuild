KSPP kernel build and packaging scripts for Slackware Linux
===========================================================

See:

* [Kernel Self Protection Project](https://kernsec.org/wiki/index.php/Kernel_Self_Protection_Project)
* [Kernel Self-Protection](https://www.kernel.org/doc/html/latest/security/self-protection.html)

How to use?
-----------

(In a nutshell)

1. Get the latest ```kernel-source``` package
2. Get the appropriate config from the configs dir and ```cat``` that to ```.config``` in your kernel sources dir
3. Compile the kernel
4. Run the appropriate packaging script(s)
5. Install the new KSPP kernel package
6. Configure LILO and [make the initrd image](http://ftp.slackware.com/pub/slackware/slackware64-14.2/README.initrd)) if necessary
7. Profit

### Modules

The packaging script for the kernel modules requires that you first run ```make modules_install``` and then run the packaging script itself. After that, you can remove the installed modules and install the package.

Notes
-----

* There are different branches for different kernel versions, so check the branches for the latest version, as the most recent is not necessarily merged into master.
* You can check that the configurations are correct with [kconfig-hardened-check](https://github.com/a13xp0p0v/kconfig-hardened-check)

### Verify

* Linux kernel can be verified with Greg Kroah-Hartman's PGP key [0x38DBBDC86092693E](https://www.kernel.org/signature.html)
