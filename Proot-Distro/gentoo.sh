# Do not modify this file. All changes will be discarded on the next
# package update.

# Default value is set by proot-distro script and is equal to the CPU
# architecture of your device. You can set this to a custom value to
# force use emulation mode (QEMU user).
# Valid values are: aarch64, arm, i686, x86_64.
#DISTRO_ARCH=aarch64

# Name of distribution.
DISTRO_NAME="Gentoo arm"

# How much path components should be stripped when extracting rootfs tarball.
# The default is "1" which means to omit the root component.
TARBALL_STRIP_OPT=1

# TARBALL_URL is a Bash associative array containing rootfs URLs for specified
# CPU architectures. You must specify at least one.
TARBALL_URL['arm']="https://distfiles.gentoo.org/releases/arm/autobuilds/20230828T171640Z/stage3-armv7a-systemd-mergedusr-20230828T171640Z.tar.xz"

# SHA-256 checksum for the given tarball. You must specify checksum for each
# defined tarball.
TARBALL_SHA256['arm']="3375db3f84700f7a6d851232f420f9415752c56733d564c6b1f2b402081b462a"
# This function defines any additional steps that should be execut
# installation. You can use "run_proot_cmd" to execute a given command in
# proot environment.
distro_setup() {
	run_proot_cmd touch /etc/hello-world
}
