KSPP kernel build and packaging scripts for Slackware Linux
===========================================================

See:

* [Kernel Self Protection Project](https://kspp.github.io/)
* [Kernel Self-Protection](https://www.kernel.org/doc/html/latest/security/self-protection.html)

How to use?
-----------

(In a nutshell)

1. Get the latest `kernel-source` package
2. Get the appropriate config from the configs dir and `cat` that to `.config` in your kernel sources dir
3. Compile the kernel
4. Run the appropriate packaging script(s)
5. Install the new KSPP kernel package
6. Configure LILO and [make the initrd image](http://ftp.slackware.com/pub/slackware/slackware64-14.2/README.initrd)) if necessary
7. Profit

### Modules

The packaging script for the kernel modules requires that you first run `make modules_install` and then run the packaging script itself. After that, you can remove the installed modules and install the package.

Notes
-----

* There are different branches for different kernel versions, so check the branches for the latest version, as the most recent is not necessarily merged into master.
* You can check that the configurations are correct with [kconfig-hardened-check](https://github.com/a13xp0p0v/kconfig-hardened-check)

### Exceptions

The following settings are not set:

```
# This needs userspace support, and will break "regular" distros. See: https://github.com/tych0/huldufolk
CONFIG_STATIC_USERMODEHELPER=y
```

```
# Randomize the layout of system structures. This may have dramatic performance impact, so
# use with caution or also use CONFIG_GCC_PLUGIN_RANDSTRUCT_PERFORMANCE=y
CONFIG_GCC_PLUGIN_RANDSTRUCT=y
# CONFIG_GCC_PLUGIN_RANDSTRUCT_PERFORMANCE is not set
```

```
# Keep root from altering kernel memory via loadable modules.
# CONFIG_MODULES is not set
```

And also the [32-bit stuff](http://www.kernsec.org/wiki/index.php/Kernel_Self_Protection_Project/Recommended_Settings#x86_64):

* `CONFIG_COMPAT`
* `CONFIG_IA32_EMULATION`
* `CONFIG_X86_X32`

### Verify

* Linux kernel can be verified with Greg Kroah-Hartman's PGP key [0x38DBBDC86092693E](https://www.kernel.org/signature.html)
