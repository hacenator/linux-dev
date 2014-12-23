#!/bin/sh
#
# Copyright (c) 2009-2014 Robert Nelson <robertcnelson@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Split out, so build_kernel.sh and build_deb.sh can share..

. ${DIR}/version.sh
if [ -f ${DIR}/system.sh ] ; then
	. ${DIR}/system.sh
fi

git="git am"
#git_patchset=""
#git_opts

if [ "${RUN_BISECT}" ] ; then
	git="git apply"
fi

echo "Starting patch.sh"

git_add () {
	git add .
	git commit -a -m 'testing patchset'
}

start_cleanup () {
	git="git am --whitespace=fix"
}

cleanup () {
	if [ "${number}" ] ; then
		git format-patch -${number} -o ${DIR}/patches/
	fi
	exit
}

external_git () {
	git_tag=""
	echo "pulling: ${git_tag}"
	git pull ${git_opts} ${git_patchset} ${git_tag}
}

local_patch () {
	echo "dir: dir"
	${git} "${DIR}/patches/dir/0001-patch.patch"
}

#external_git
#local_patch

need_to_push_mainline () {
	echo "dir: need_to_push_mainline"
	${git} "${DIR}/patches/need_to_push_mainline/0001-ARM-dts-restructure-imx6q-udoo.dts-to-support-udoo-d.patch"
}

dts () {
	echo "dir: dts"
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		start_cleanup
	fi
	${git} "${DIR}/patches/dts/0001-ARM-dts-omap3-beagle-add-i2c2.patch"
	${git} "${DIR}/patches/dts/0002-ARM-dts-omap3-beagle-xm-spidev.patch"
	${git} "${DIR}/patches/dts/0003-ARM-dts-beagle-xm-make-sure-dvi-is-enabled.patch"
	${git} "${DIR}/patches/dts/0004-ARM-DTS-omap3-beagle-xm-disable-powerdown-gpios.patch"
	${git} "${DIR}/patches/dts/0005-ARM-DTS-omap3-beagle.dts-enable-twl4030-power-reset.patch"
	${git} "${DIR}/patches/dts/0006-arm-dts-omap4-move-emif-so-panda-es-b3-now-boots.patch"
	${git} "${DIR}/patches/dts/0007-omap3-beagle-xm-ehci-works-again.patch"
	${git} "${DIR}/patches/dts/0008-ARM-dts-omap3-beagle-ddc-i2c-bus-is-not-responding-d.patch"

	if [ "x${regenerate}" = "xenable" ] ; then
		number=8
		cleanup
	fi
}

wand () {
	echo "dir: wand"
	${git} "${DIR}/patches/wand/0001-ARM-i.MX6-Wandboard-add-wifi-bt-rfkill-driver.patch"
	${git} "${DIR}/patches/wand/0002-ARM-dts-wandboard-add-binding-for-wand-rfkill-driver.patch"
#	${git} "${DIR}/patches/wand/0003-Vivante-v4-driver.patch"
}

errata () {
	echo "dir: errata"
	${git} "${DIR}/patches/errata/0001-hack-omap-clockk-dpll5-apply-sprz319e-2.1-erratum-co.patch"
}

fixes () {
	echo "dir: fixes"
	${git} "${DIR}/patches/fixes/0001-trusty-gcc-4.8-4.8.2-19ubuntu1-has-fix.patch"
}

dtb_makefile_append () {
	sed -i -e 's:am335x-boneblack.dtb \\:am335x-boneblack.dtb \\\n\t'$device' \\:g' arch/arm/boot/dts/Makefile
}

dtsi_append () {
	wfile="arch/arm/boot/dts/${base_dts}-${cape}.dts"
	cp arch/arm/boot/dts/${base_dts}-base.dts ${wfile}
	echo "" >> ${wfile}
	echo "#include \"am335x-bone-${cape}.dtsi\"" >> ${wfile}
	git add ${wfile}
}

dtsi_append_custom () {
	wfile="arch/arm/boot/dts/${dtb_name}.dts"
	cp arch/arm/boot/dts/${base_dts}-base.dts ${wfile}
	echo "" >> ${wfile}
	echo "#include \"am335x-bone-${cape}.dtsi\"" >> ${wfile}
	git add ${wfile}
}

dtsi_append_hdmi_no_audio () {
	dtsi_append
	echo "#include \"am335x-boneblack-nxp-hdmi-no-audio.dtsi\"" >> ${wfile}
	git add ${wfile}
}

dtsi_drop_nxp_hdmi_audio () {
	sed -i -e 's:#include "am335x-boneblack-nxp-hdmi-no-audio.dtsi":/* #include "am335x-boneblack-nxp-hdmi-no-audio.dtsi" */:g' ${wfile}
	git add ${wfile}
}

dtsi_drop_emmc () {
	sed -i -e 's:#include "am335x-boneblack-emmc.dtsi":/* #include "am335x-boneblack-emmc.dtsi" */:g' ${wfile}
	git add ${wfile}
}

dts_drop_clkout2_pin () {
	sed -i -e 's:pinctrl-0 = <\&clkout2_pin>;:/* pinctrl-0 = <\&clkout2_pin>; */:g' ${wfile}
	git add ${wfile}
}

beaglebone () {
	echo "dir: beaglebone/dtbs"
	${git} "${DIR}/patches/beaglebone/dtbs/0001-sync-am335x-peripheral-pinmux.patch"

	echo "dir: beaglebone/dts"
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		start_cleanup
	fi

#	${git} "${DIR}/patches/beaglebone/dts/0001-am335x-boneblack-add-cpu0-opp-points.patch"
#	${git} "${DIR}/patches/beaglebone/dts/0002-dts-am335x-bone-common-fixup-leds-to-match-3.8.patch"
#	${git} "${DIR}/patches/beaglebone/dts/0003-ARM-dts-am335x-boneblack-enable-power-off-and-rtc-wa.patch"
#	${git} "${DIR}/patches/beaglebone/dts/0004-bbb-force-usb0-to-perhiperal-mode-fixes-http-bugs.el.patch"

	if [ "x${regenerate}" = "xenable" ] ; then
		number=4
		cleanup
	fi

	echo "dir: beaglebone/capes"
	#${git} "${DIR}/patches/beaglebone/capes/0001-cape-Argus-UPS-cape-support.patch"

	####
	#dtb makefile
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		device="am335x-bone-can0.dtb"
		dtb_makefile_append

		device="am335x-bone-can1.dtb"
		dtb_makefile_append

		device="am335x-bone-ttyO1.dtb"
		dtb_makefile_append

		device="am335x-bone-ttyO2.dtb"
		dtb_makefile_append

		device="am335x-bone-ttyO4.dtb"
		dtb_makefile_append

		device="am335x-bone-ttyO5.dtb"
		dtb_makefile_append

		device="am335x-boneblack-can0.dtb"
		dtb_makefile_append

		device="am335x-boneblack-can1.dtb"
		dtb_makefile_append

		device="am335x-boneblack-ttyO1.dtb"
		dtb_makefile_append

		device="am335x-boneblack-ttyO2.dtb"
		dtb_makefile_append

		device="am335x-boneblack-ttyO4.dtb"
		dtb_makefile_append

		device="am335x-boneblack-ttyO5.dtb"
		dtb_makefile_append

		git commit -a -m 'auto generated: capes: add dtbs to makefile' -s
		git format-patch -1 -o ../patches/beaglebone/generated/
		exit
	else
		${git} "${DIR}/patches/beaglebone/generated/0001-auto-generated-capes-add-dtbs-to-makefile.patch"
	fi

#	echo "dir: beaglebone/power"
#	${git} "${DIR}/patches/beaglebone/power/0001-tps65217-Enable-KEY_POWER-press-on-AC-loss-PWR_BUT.patch"
#	${git} "${DIR}/patches/beaglebone/power/0002-am335x-bone-common-enable-ti-pmic-shutdown-controlle.patch"
#	${git} "${DIR}/patches/beaglebone/power/0003-dt-bone-common-Add-interrupt-for-PMIC.patch"

#	echo "dir: beaglebone/phy"
#	${git} "${DIR}/patches/beaglebone/phy/0001-cpsw-Add-support-for-byte-queue-limits.patch"
#	${git} "${DIR}/patches/beaglebone/phy/0002-cpsw-napi-polling-of-64-is-good-for-gigE-less-good-f.patch"
#	${git} "${DIR}/patches/beaglebone/phy/0003-cpsw-search-for-phy.patch"
}

need_to_push_mainline

dts
wand
errata
fixes

beaglebone

packaging_setup () {
	cp -v "${DIR}/3rdparty/packaging/builddeb" "${DIR}/KERNEL/scripts/package"
	git commit -a -m 'packaging: sync with mainline' -s

	git format-patch -1 -o "${DIR}/patches/packaging"
}

packaging () {
	echo "dir: packaging"
	#regenerate="enable"
	if [ "x${regenerate}" = "xenable" ] ; then
		start_cleanup
	fi
	#${git} "${DIR}/patches/packaging/0001-packaging-sync-with-mainline.patch"
	${git} "${DIR}/patches/packaging/0002-deb-pkg-install-dtbs-in-linux-image-package.patch"
	#${git} "${DIR}/patches/packaging/0003-deb-pkg-no-dtbs_install.patch"

	if [ "x${regenerate}" = "xenable" ] ; then
		number=3
		cleanup
	fi
}

#packaging_setup
packaging
echo "patch.sh ran successfully"
