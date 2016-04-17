#!/bin/sh -eu
#
# Copyright (c) 2016 Miroslav Rudisin
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

H=root@botic
DTB=am335x-boneblack-botic.dtb
CMDLINE='`cat /proc/cmdline | sed s/clk=3/clk=3/`'

do_rsync()
{
    rsync -e "ssh -ax" -avzOm --no-motd "$@"
}

V=`cat ./kernel_version`
do_rsync --rsync-path="mkdir -p /lib/modules/$V/kernel && rsync" --include="*/" --include="**.ko" --exclude="*" KERNEL/./ "$H:/lib/modules/$V/kernel"
do_rsync KERNEL/./modules.builtin KERNEL/./modules.order $H:/lib/modules/$V/
do_rsync KERNEL/arch/arm/boot/dts/$DTB KERNEL/arch/arm/boot/zImage $H:/dev/shm/
ssh $H "depmod -A $V; kexec -l --command-line=\"$CMDLINE\" --dtb='/dev/shm/$DTB' /dev/shm/zImage; exec >/dev/null 2>&1; sleep .5 && kexec -e -x &"
echo "Reboot!"
sleep 5
echo "Connecting to $H"
ssh -o ConnectTimeout=1 -o ConnectionAttempts=100 $H "$@"
