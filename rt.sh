###########################################################
# DELTA against a known Linus release
###########################################################

############################################################
# UPSTREAM changes queued
############################################################

############################################################
# UPSTREAM FIXES, patches pending
############################################################
${git} "${DIR}/patches/rt/timer-make-the-base-lock-raw.patch"

############################################################
# Stuff broken upstream, patches submitted
############################################################
${git} "${DIR}/patches/rt/sc16is7xx_Drop_bogus_use_of_IRQF_ONESHOT.patch"

# Those two should vanish soon (not use PIT during bootup)
${git} "${DIR}/patches/rt/at91_dont_enable_disable_clock.patch"

############################################################
# Stuff which needs addressing upstream, but requires more
# information
############################################################
${git} "${DIR}/patches/rt/rfc-arm-smp-__cpu_disable-fix-sleeping-function-called-from-invalid-context.patch"

############################################################
# Stuff broken upstream, need to be sent
############################################################
${git} "${DIR}/patches/rt/rtmutex--Handle-non-enqueued-waiters-gracefully.patch"
${git} "${DIR}/patches/rt/fs-dcache-include-wait.h.patch"
${git} "${DIR}/patches/rt/rbtree-include-rcu.h-because-we-use-it.patch"
${git} "${DIR}/patches/rt/fs-dcache-init-in_lookup_hashtable.patch"
${git} "${DIR}/patches/rt/iommu-iova-don-t-disable-preempt-around-this_cpu_ptr.patch"
${git} "${DIR}/patches/rt/iommu-vt-d-don-t-disable-preemption-while-accessing-.patch"
${git} "${DIR}/patches/rt/lockdep-Quiet-gcc-about-dangerous-__builtin_return_a.patch"
${git} "${DIR}/patches/rt/x86-apic-get-rid-of-warning-acpi_ioapic_lock-defined.patch"
${git} "${DIR}/patches/rt/rxrpc-remove-unused-static-variables.patch"
${git} "${DIR}/patches/rt/rcu-update-make-RCU_EXPEDITE_BOOT-default.patch"

# Wants a different fix for upstream
${git} "${DIR}/patches/rt/NFSv4-replace-seqcount_t-with-a-seqlock_t.patch"

############################################################
# Submitted on LKML
############################################################

# SPARC part of erly printk consolidation
${git} "${DIR}/patches/rt/sparc64-use-generic-rwsem-spinlocks-rt.patch"

# SRCU
${git} "${DIR}/patches/rt/kernel-SRCU-provide-a-static-initializer.patch"

############################################################
# Submitted to mips ML
############################################################

############################################################
# Submitted to ARM ML
############################################################

############################################################
# Submitted to PPC ML
############################################################

############################################################
# Submitted on LKML
############################################################

############################################################
# Submitted to net-dev
############################################################

############################################################
# Pending in tip
############################################################

############################################################
# Stuff which should go upstream ASAP
############################################################

# SCHED BLOCK/WQ
${git} "${DIR}/patches/rt/block-shorten-interrupt-disabled-regions.patch"

# Timekeeping split jiffies lock. Needs a good argument :)
${git} "${DIR}/patches/rt/timekeeping-split-jiffies-lock.patch"

# Tracing
${git} "${DIR}/patches/rt/tracing-account-for-preempt-off-in-preempt_schedule.patch"

# PTRACE/SIGNAL crap
${git} "${DIR}/patches/rt/signal-revert-ptrace-preempt-magic.patch"

# ARM lock annotation
${git} "${DIR}/patches/rt/arm-convert-boot-lock-to-raw.patch"
${git} "${DIR}/patches/rt/arm-kprobe-replace-patch_lock-to-raw-lock.patch"

# PREEMPT_ENABLE_NO_RESCHED

# SIGNALS / POSIXTIMERS
${git} "${DIR}/patches/rt/posix-timers-no-broadcast.patch"
${git} "${DIR}/patches/rt/signals-allow-rt-tasks-to-cache-one-sigqueue-struct.patch"

# SCHED

# GENERIC CMPXCHG

# SHORTEN PREEMPT DISABLED
${git} "${DIR}/patches/rt/drivers-random-reduce-preempt-disabled-region.patch"

# CLOCKSOURCE
${git} "${DIR}/patches/rt/arm-at91-pit-remove-irq-handler-when-clock-is-unused.patch"
${git} "${DIR}/patches/rt/clockevents-drivers-timer-atmel-pit-fix-double-free_.patch"
${git} "${DIR}/patches/rt/clocksource-tclib-allow-higher-clockrates.patch"

# DRIVERS NET
${git} "${DIR}/patches/rt/drivers-net-8139-disable-irq-nosync.patch"

# PREEMPT

# PM
${git} "${DIR}/patches/rt/suspend-prevernt-might-sleep-splats.patch"

# NETWORKING
${git} "${DIR}/patches/rt/net-prevent-abba-deadlock.patch"
${git} "${DIR}/patches/rt/net-sched-dev_deactivate_many-use-msleep-1-instead-o.patch"

# X86
${git} "${DIR}/patches/rt/x86-io-apic-migra-no-unmask.patch"

# RCU

# LOCKING INIT FIXES

# PCI
${git} "${DIR}/patches/rt/pci-access-use-__wake_up_all_locked.patch"

# WORKQUEUE


#####################################################
# Stuff which should go mainline, but wants some care
#####################################################

# SEQLOCK

# ANON RW SEMAPHORES

# TRACING
${git} "${DIR}/patches/rt/latencyhist-disable-jump-labels.patch"
${git} "${DIR}/patches/rt/latency-hist.patch"
${git} "${DIR}/patches/rt/latency_hist-update-sched_wakeup-probe.patch"
${git} "${DIR}/patches/rt/trace-latency-hist-Consider-new-argument-when-probin.patch"
${git} "${DIR}/patches/rt/trace_Use_rcuidle_version_for_preemptoff_hist_trace_point.patch"

# HW LATENCY DETECTOR - this really wants a rewrite
${git} "${DIR}/patches/rt/hwlatdetect.patch"
${git} "${DIR}/patches/rt/hwlat-detector-Update-hwlat_detector-to-add-outer-lo.patch"
${git} "${DIR}/patches/rt/hwlat-detector-Use-trace_clock_local-if-available.patch"
${git} "${DIR}/patches/rt/hwlat-detector-Use-thread-instead-of-stop-machine.patch"
${git} "${DIR}/patches/rt/hwlat-detector-Don-t-ignore-threshold-module-paramet.patch"

##################################################
# REAL RT STUFF starts here
##################################################

# PRINTK
${git} "${DIR}/patches/rt/printk-kill.patch"
${git} "${DIR}/patches/rt/printk-27force_early_printk-27-boot-param-to-help-with-debugging.patch"

# Enable RT CONFIG
${git} "${DIR}/patches/rt/rt-preempt-base-config.patch"
${git} "${DIR}/patches/rt/kconfig-disable-a-few-options-rt.patch"
${git} "${DIR}/patches/rt/kconfig-preempt-rt-full.patch"

# WARN/BUG_ON_RT
${git} "${DIR}/patches/rt/bug-rt-dependend-variants.patch"
${git} "${DIR}/patches/rt/iommu-amd--Use-WARN_ON_NORT.patch"

# LOCAL_IRQ_RT/NON_RT
${git} "${DIR}/patches/rt/local-irq-rt-depending-variants.patch"

# PREEMPT NORT
${git} "${DIR}/patches/rt/preempt-nort-rt-variants.patch"

# local locks & migrate disable
${git} "${DIR}/patches/rt/introduce_migrate_disable_cpu_light.patch"
${git} "${DIR}/patches/rt/rt-local-irq-lock.patch"
${git} "${DIR}/patches/rt/locallock-add-local_lock_on.patch"

# ANNOTATE local_irq_disable sites
${git} "${DIR}/patches/rt/ata-disable-interrupts-if-non-rt.patch"
${git} "${DIR}/patches/rt/ide-use-nort-local-irq-variants.patch"
${git} "${DIR}/patches/rt/infiniband-mellanox-ib-use-nort-irq.patch"
${git} "${DIR}/patches/rt/inpt-gameport-use-local-irq-nort.patch"
${git} "${DIR}/patches/rt/user-use-local-irq-nort.patch"
${git} "${DIR}/patches/rt/usb-use-_nort-in-giveback.patch"
${git} "${DIR}/patches/rt/mm-scatterlist-dont-disable-irqs-on-RT.patch"
${git} "${DIR}/patches/rt/mm-workingset-do-not-protect-workingset_shadow_nodes.patch"

# Sigh
${git} "${DIR}/patches/rt/signal-fix-up-rcu-wreckage.patch"
${git} "${DIR}/patches/rt/oleg-signal-rt-fix.patch"
${git} "${DIR}/patches/rt/x86-signal-delay-calling-signals-on-32bit.patch"

# ANNOTATE BUG/WARNON
${git} "${DIR}/patches/rt/net-wireless-warn-nort.patch"

# BIT SPINLOCKS - SIGH
${git} "${DIR}/patches/rt/fs-replace-bh_uptodate_lock-for-rt.patch"
${git} "${DIR}/patches/rt/fs-jbd-replace-bh_state-lock.patch"

# GENIRQ
${git} "${DIR}/patches/rt/list_bl.h-make-list-head-locking-RT-safe.patch"
${git} "${DIR}/patches/rt/list_bl-fixup-bogus-lockdep-warning.patch"
${git} "${DIR}/patches/rt/genirq-disable-irqpoll-on-rt.patch"
${git} "${DIR}/patches/rt/genirq-force-threading.patch"

# DRIVERS NET
${git} "${DIR}/patches/rt/drivers-net-vortex-fix-locking-issues.patch"

# MM PAGE_ALLOC
${git} "${DIR}/patches/rt/mm-page_alloc-rt-friendly-per-cpu-pages.patch"
${git} "${DIR}/patches/rt/mm-page_alloc-reduce-lock-sections-further.patch"

# MM SWAP
${git} "${DIR}/patches/rt/mm-convert-swap-to-percpu-locked.patch"
${git} "${DIR}/patches/rt/mm-perform-lru_add_drain_all-remotely.patch"

# MM vmstat
${git} "${DIR}/patches/rt/mm-make-vmstat-rt-aware.patch"

# MM memory
${git} "${DIR}/patches/rt/re-preempt_rt_full-arm-coredump-fails-for-cpu-3e-3d-4.patch"

# MM bounce
${git} "${DIR}/patches/rt/mm-bounce-local-irq-save-nort.patch"

# MM SLxB
${git} "${DIR}/patches/rt/mm-disable-sloub-rt.patch"
${git} "${DIR}/patches/rt/mm-enable-slub.patch"
${git} "${DIR}/patches/rt/slub-enable-irqs-for-no-wait.patch"
${git} "${DIR}/patches/rt/slub-disable-SLUB_CPU_PARTIAL.patch"

# MM
${git} "${DIR}/patches/rt/mm-page-alloc-use-local-lock-on-target-cpu.patch"
${git} "${DIR}/patches/rt/mm-memcontrol-Don-t-call-schedule_work_on-in-preempt.patch"
${git} "${DIR}/patches/rt/mm-memcontrol-do_not_disable_irq.patch"
${git} "${DIR}/patches/rt/mm-memcontrol-mem_cgroup_migrate-replace-another-loc.patch"
${git} "${DIR}/patches/rt/mm-backing-dev-don-t-disable-IRQs-in-wb_congested_pu.patch"
${git} "${DIR}/patches/rt/mm_zsmalloc_copy_with_get_cpu_var_and_locking.patch"

# RADIX TREE
${git} "${DIR}/patches/rt/radix-tree-rt-aware.patch"

# PANIC
${git} "${DIR}/patches/rt/panic-disable-random-on-rt.patch"

# IPC
${git} "${DIR}/patches/rt/ipc-msg-Implement-lockless-pipelined-wakeups.patch"

# RELAY
${git} "${DIR}/patches/rt/relay-fix-timer-madness.patch"

# TIMERS
${git} "${DIR}/patches/rt/timers-prepare-for-full-preemption.patch"
${git} "${DIR}/patches/rt/timer-delay-waking-softirqs-from-the-jiffy-tick.patch"

# HRTIMERS
${git} "${DIR}/patches/rt/hrtimers-prepare-full-preemption.patch"
${git} "${DIR}/patches/rt/hrtimer-enfore-64byte-alignment.patch"
${git} "${DIR}/patches/rt/hrtimer-fixup-hrtimer-callback-changes-for-preempt-r.patch"
${git} "${DIR}/patches/rt/sched-deadline-dl_task_timer-has-to-be-irqsafe.patch"
${git} "${DIR}/patches/rt/timer-fd-avoid-live-lock.patch"
${git} "${DIR}/patches/rt/tick-broadcast--Make-hrtimer-irqsafe.patch"

# POSIX-CPU-TIMERS
${git} "${DIR}/patches/rt/posix-timers-thread-posix-cpu-timers-on-rt.patch"

# SCHEDULER
${git} "${DIR}/patches/rt/sched-delay-put-task.patch"
${git} "${DIR}/patches/rt/sched-limit-nr-migrate.patch"
${git} "${DIR}/patches/rt/sched-mmdrop-delayed.patch"
${git} "${DIR}/patches/rt/sched-rt-mutex-wakeup.patch"
${git} "${DIR}/patches/rt/sched-might-sleep-do-not-account-rcu-depth.patch"
${git} "${DIR}/patches/rt/cond-resched-softirq-rt.patch"
${git} "${DIR}/patches/rt/cond-resched-lock-rt-tweak.patch"
${git} "${DIR}/patches/rt/sched-disable-ttwu-queue.patch"
${git} "${DIR}/patches/rt/sched-disable-rt-group-sched-on-rt.patch"
${git} "${DIR}/patches/rt/sched-ttwu-ensure-success-return-is-correct.patch"
${git} "${DIR}/patches/rt/sched-workqueue-Only-wake-up-idle-workers-if-not-blo.patch"

# STOP MACHINE
${git} "${DIR}/patches/rt/stop_machine-convert-stop_machine_run-to-PREEMPT_RT.patch"
${git} "${DIR}/patches/rt/stop-machine-raw-lock.patch"

# MIGRATE DISABLE AND PER CPU
${git} "${DIR}/patches/rt/hotplug-light-get-online-cpus.patch"
${git} "${DIR}/patches/rt/hotplug-sync_unplug-no-27-5cn-27-in-task-name.patch"
${git} "${DIR}/patches/rt/re-migrate_disable-race-with-cpu-hotplug-3f.patch"
${git} "${DIR}/patches/rt/ftrace-migrate-disable-tracing.patch"
${git} "${DIR}/patches/rt/hotplug-use-migrate-disable.patch"

# NOHZ

# LOCKDEP
${git} "${DIR}/patches/rt/lockdep-no-softirq-accounting-on-rt.patch"

# SOFTIRQ
${git} "${DIR}/patches/rt/mutex-no-spin-on-rt.patch"
${git} "${DIR}/patches/rt/tasklet-rt-prevent-tasklets-from-going-into-infinite-spin-in-rt.patch"
${git} "${DIR}/patches/rt/softirq-preempt-fix-3-re.patch"
${git} "${DIR}/patches/rt/softirq-disable-softirq-stacks-for-rt.patch"
${git} "${DIR}/patches/rt/softirq-split-locks.patch"
${git} "${DIR}/patches/rt/kernel-softirq-unlock-with-irqs-on.patch"
${git} "${DIR}/patches/rt/kernel-migrate_disable-do-fastpath-in-atomic-irqs-of.patch"
${git} "${DIR}/patches/rt/irq-allow-disabling-of-softirq-processing-in-irq-thread-context.patch"
${git} "${DIR}/patches/rt/softirq-split-timer-softirqs-out-of-ksoftirqd.patch"
${git} "${DIR}/patches/rt/rtmutex-trylock-is-okay-on-RT.patch"

# compile fix due to rtmutex locks
${git} "${DIR}/patches/rt/gpu_don_t_check_for_the_lock_owner.patch"
${git} "${DIR}/patches/rt/fs-nfs-turn-rmdir_sem-into-a-semaphore.patch"

# FUTEX/RTMUTEX
${git} "${DIR}/patches/rt/rtmutex-futex-prepare-rt.patch"
${git} "${DIR}/patches/rt/futex-requeue-pi-fix.patch"
${git} "${DIR}/patches/rt/futex-Ensure-lock-unlock-symetry-versus-pi_lock-and-.patch"

# RTMUTEX
${git} "${DIR}/patches/rt/pid.h-include-atomic.h.patch"
${git} "${DIR}/patches/rt/locking-locktorture-Do-NOT-include-rwlock.h-directly.patch"
${git} "${DIR}/patches/rt/rtmutex-lock-killable.patch"
${git} "${DIR}/patches/rt/spinlock-types-separate-raw.patch"
${git} "${DIR}/patches/rt/rtmutex-avoid-include-hell.patch"
${git} "${DIR}/patches/rt/rtmutex_dont_include_rcu.patch"
${git} "${DIR}/patches/rt/rt-add-rt-locks.patch"
${git} "${DIR}/patches/rt/kernel-futex-don-t-deboost-too-early.patch"
${git} "${DIR}/patches/rt/rtmutex-add-a-first-shot-of-ww_mutex.patch"
${git} "${DIR}/patches/rt/ptrace-fix-ptrace-vs-tasklist_lock-race.patch"

# RCU
${git} "${DIR}/patches/rt/peter_zijlstra-frob-rcu.patch"
${git} "${DIR}/patches/rt/rcu-merge-rcu-bh-into-rcu-preempt-for-rt.patch"
${git} "${DIR}/patches/rt/patch-to-introduce-rcu-bh-qs-where-safe-from-softirq.patch"
${git} "${DIR}/patches/rt/rcutree-rcu_bh_qs-disable-irq-while-calling-rcu_pree.patch"

# LGLOCKS - lovely
${git} "${DIR}/patches/rt/lglocks-rt.patch"
${git} "${DIR}/patches/rt/lockinglglocks_Use_preempt_enabledisable_nort.patch"

# STOP machine (depend on lglock & rtmutex)
${git} "${DIR}/patches/rt/stomp-machine-create-lg_global_trylock_relax-primiti.patch"
${git} "${DIR}/patches/rt/stomp-machine-use-lg_global_trylock_relax-to-dead-wi.patch"

# DRIVERS SERIAL
${git} "${DIR}/patches/rt/drivers-tty-fix-omap-lock-crap.patch"
${git} "${DIR}/patches/rt/drivers-tty-pl011-irq-disable-madness.patch"
${git} "${DIR}/patches/rt/rt-serial-warn-fix.patch"
${git} "${DIR}/patches/rt/tty-serial-8250-don-t-take-the-trylock-during-oops.patch"

# SIMPLE WAITQUEUE
${git} "${DIR}/patches/rt/wait.h-include-atomic.h.patch"
${git} "${DIR}/patches/rt/work-simple-Simple-work-queue-implemenation.patch"
${git} "${DIR}/patches/rt/completion-use-simple-wait-queues.patch"
${git} "${DIR}/patches/rt/fs-aio-simple-simple-work.patch"
${git} "${DIR}/patches/rt/genirq-do-not-invoke-the-affinity-callback-via-a-wor.patch"
${git} "${DIR}/patches/rt/hrtimer-Move-schedule_work-call-to-helper-thread.patch"

# FS
${git} "${DIR}/patches/rt/fs-namespace-preemption-fix.patch"
${git} "${DIR}/patches/rt/mm-protect-activate-switch-mm.patch"
${git} "${DIR}/patches/rt/fs-block-rt-support.patch"
${git} "${DIR}/patches/rt/fs-ntfs-disable-interrupt-non-rt.patch"
${git} "${DIR}/patches/rt/fs-jbd2-pull-your-plug-when-waiting-for-space.patch"

# X86
${git} "${DIR}/patches/rt/x86-mce-timer-hrtimer.patch"
${git} "${DIR}/patches/rt/x86-mce-use-swait-queue-for-mce-wakeups.patch"
${git} "${DIR}/patches/rt/x86-stackprot-no-random-on-rt.patch"
${git} "${DIR}/patches/rt/x86-use-gen-rwsem-spinlocks-rt.patch"
${git} "${DIR}/patches/rt/x86-UV-raw_spinlock-conversion.patch"
${git} "${DIR}/patches/rt/thermal-Defer-thermal-wakups-to-threads.patch"

# CPU get light
${git} "${DIR}/patches/rt/epoll-use-get-cpu-light.patch"
${git} "${DIR}/patches/rt/mm-vmalloc-use-get-cpu-light.patch"
${git} "${DIR}/patches/rt/block-mq-use-cpu_light.patch"
${git} "${DIR}/patches/rt/block-mq-drop-preempt-disable.patch"
${git} "${DIR}/patches/rt/block-mq-don-t-complete-requests-via-IPI.patch"
${git} "${DIR}/patches/rt/dump-stack-don-t-disable-preemption-during-trace.patch"
${git} "${DIR}/patches/rt/md-raid5-percpu-handling-rt-aware.patch"

# CPU CHILL
${git} "${DIR}/patches/rt/rt-introduce-cpu-chill.patch"
${git} "${DIR}/patches/rt/cpu_chill-Add-a-UNINTERRUPTIBLE-hrtimer_nanosleep.patch"

# block
${git} "${DIR}/patches/rt/blk-mq-revert-raw-locks-post-pone-notifier-to-POST_D.patchto-POST_D.patch"
${git} "${DIR}/patches/rt/block-blk-mq-use-swait.patch"

# BLOCK LIVELOCK PREVENTION
${git} "${DIR}/patches/rt/block-use-cpu-chill.patch"

# FS LIVELOCK PREVENTION
${git} "${DIR}/patches/rt/fs-dcache-use-cpu-chill-in-trylock-loops.patch"
${git} "${DIR}/patches/rt/net-use-cpu-chill.patch"
${git} "${DIR}/patches/rt/fs-dcache-use-swait_queue-instead-of-waitqueue.patch"

# WORKQUEUE more fixes
${git} "${DIR}/patches/rt/workqueue-use-rcu.patch"
${git} "${DIR}/patches/rt/workqueue-use-locallock.patch"
${git} "${DIR}/patches/rt/workqueue-use-rcu_readlock-in-put_pwq_unlocked.patch"
${git} "${DIR}/patches/rt/work-queue-work-around-irqsafe-timer-optimization.patch"
${git} "${DIR}/patches/rt/workqueue-distangle-from-rq-lock.patch"

# IDR
${git} "${DIR}/patches/rt/idr-use-local-lock-for-protection.patch"
${git} "${DIR}/patches/rt/percpu_ida-use-locklocks.patch"

# DEBUGOBJECTS
${git} "${DIR}/patches/rt/debugobjects-rt.patch"

# JUMPLABEL
${git} "${DIR}/patches/rt/jump-label-rt.patch"

# SEQLOCKS
${git} "${DIR}/patches/rt/seqlock-prevent-rt-starvation.patch"

# NETWORKING
${git} "${DIR}/patches/rt/sunrpc-make-svc_xprt_do_enqueue-use-get_cpu_light.patch"
${git} "${DIR}/patches/rt/skbufhead-raw-lock.patch"
${git} "${DIR}/patches/rt/skbufhead-raw-lock-free-skbs.patch"
${git} "${DIR}/patches/rt/net-core-cpuhotplug-drain-input_pkt_queue-lockless.patch"
${git} "${DIR}/patches/rt/net-move-xmit_recursion-to-per-task-variable-on-RT.patch"
${git} "${DIR}/patches/rt/net-provide-a-way-to-delegate-processing-a-softirq-t.patch"
${git} "${DIR}/patches/rt/net-dev-always-take-qdisc-s-busylock-in-__dev_xmit_s.patch"
${git} "${DIR}/patches/rt/net-Qdisc-use-a-seqlock-instead-seqcount.patch"
${git} "${DIR}/patches/rt/net-add-back-the-missing-serialization-in-ip_send_un.patch"
${git} "${DIR}/patches/rt/net-add-a-lock-around-icmp_sk.patch"
${git} "${DIR}/patches/rt/net-Have-__napi_schedule_irqoff-disable-interrupts-o.patch"

# NETWORK DEBUGGING AID
${git} "${DIR}/patches/rt/ping-sysrq.patch"

# irqwork
${git} "${DIR}/patches/rt/irqwork-push_most_work_into_softirq_context.patch"
${git} "${DIR}/patches/rt/irqwork-Move-irq-safe-work-to-irq-context.patch"

# Sound
${git} "${DIR}/patches/rt/snd-pcm-fix-snd_pcm_stream_lock-irqs_disabled-splats.patch"

# CONSOLE. NEEDS more thought !!!
${git} "${DIR}/patches/rt/printk-rt-aware.patch"
${git} "${DIR}/patches/rt/kernel-printk-Don-t-try-to-print-from-IRQ-NMI-region.patch"
${git} "${DIR}/patches/rt/HACK-printk-drop-the-logbuf_lock-more-often.patch"

# POWERC
${git} "${DIR}/patches/rt/power-use-generic-rwsem-on-rt.patch"
${git} "${DIR}/patches/rt/powerpc-kvm-Disable-in-kernel-MPIC-emulation-for-PRE.patch"
${git} "${DIR}/patches/rt/powerpc-ps3-device-init.c-adapt-to-completions-using.patch"

# ARM
${git} "${DIR}/patches/rt/arm-at91-tclib-default-to-tclib-timer-for-rt.patch"
${git} "${DIR}/patches/rt/arm-unwind-use_raw_lock.patch"
${git} "${DIR}/patches/rt/ARM-enable-irq-in-translation-section-permission-fau.patch"
${git} "${DIR}/patches/rt/genirq-update-irq_set_irqchip_state-documentation.patch"
${git} "${DIR}/patches/rt/KVM-arm-arm64-downgrade-preempt_disable-d-region-to-.patch"

# ARM64
${git} "${DIR}/patches/rt/arm64-xen--Make-XEN-depend-on-non-rt.patch"

# KGDB
${git} "${DIR}/patches/rt/kgb-serial-hackaround.patch"

# SYSFS - RT indicator
${git} "${DIR}/patches/rt/sysfs-realtime-entry.patch"

# KMAP/HIGHMEM
${git} "${DIR}/patches/rt/power-disable-highmem-on-rt.patch"
${git} "${DIR}/patches/rt/mips-disable-highmem-on-rt.patch"
${git} "${DIR}/patches/rt/mm-rt-kmap-atomic-scheduling.patch"
${git} "${DIR}/patches/rt/mm--rt--Fix-generic-kmap_atomic-for-RT.patch"
${git} "${DIR}/patches/rt/x86-highmem-add-a-already-used-pte-check.patch"
${git} "${DIR}/patches/rt/arm-highmem-flush-tlb-on-unmap.patch"
${git} "${DIR}/patches/rt/arm-enable-highmem-for-rt.patch"

# IPC
${git} "${DIR}/patches/rt/ipc-sem-rework-semaphore-wakeups.patch"

# SYSRQ

# KVM require constant freq TSC (smp function call -> cpufreq)
${git} "${DIR}/patches/rt/x86-kvm-require-const-tsc-for-rt.patch"
${git} "${DIR}/patches/rt/KVM-lapic-mark-LAPIC-timer-handler-as-irqsafe.patch"

# SCSI/FCOE
${git} "${DIR}/patches/rt/scsi-fcoe-rt-aware.patch"
${git} "${DIR}/patches/rt/sas-ata-isci-dont-t-disable-interrupts-in-qc_issue-h.patch"

# X86 crypto
${git} "${DIR}/patches/rt/x86-crypto-reduce-preempt-disabled-regions.patch"
${git} "${DIR}/patches/rt/crypto-Reduce-preempt-disabled-regions-more-algos.patch"

# Device mapper
${git} "${DIR}/patches/rt/dm-make-rt-aware.patch"

# ACPI
${git} "${DIR}/patches/rt/acpi-rt-Convert-acpi_gbl_hardware-lock-back-to-a-raw.patch"

# CPUMASK OFFSTACK
${git} "${DIR}/patches/rt/cpumask-disable-offstack-on-rt.patch"

# RANDOM
${git} "${DIR}/patches/rt/random-make-it-work-on-rt.patch"

# HOTPLUG
${git} "${DIR}/patches/rt/cpu-rt-make-hotplug-lock-a-sleeping-spinlock-on-rt.patch"
${git} "${DIR}/patches/rt/cpu-rt-rework-cpu-down.patch"
${git} "${DIR}/patches/rt/cpu-hotplug-Document-why-PREEMPT_RT-uses-a-spinlock.patch"
${git} "${DIR}/patches/rt/kernel-cpu-fix-cpu-down-problem-if-kthread-s-cpu-is-.patch"
${git} "${DIR}/patches/rt/kernel-hotplug-restore-original-cpu-mask-oncpu-down.patch"
${git} "${DIR}/patches/rt/cpu_down_move_migrate_enable_back.patch"
${git} "${DIR}/patches/rt/hotplug-Use-set_cpus_allowed_ptr-in-sync_unplug_thre.patch"

${git} "${DIR}/patches/rt/rt-locking-Reenable-migration-accross-schedule.patch"

# SCSCI QLA2xxx
${git} "${DIR}/patches/rt/scsi-qla2xxx-fix-bug-sleeping-function-called-from-invalid-context.patch"

# NET
${git} "${DIR}/patches/rt/upstream-net-rt-remove-preemption-disabling-in-netif_rx.patch"
${git} "${DIR}/patches/rt/net-another-local-irq-disable-alloc-atomic-headache.patch"
${git} "${DIR}/patches/rt/net-core-protect-users-of-napi_alloc_cache-against-r.patch"
${git} "${DIR}/patches/rt/net-fix-iptable-xt-write-recseq-begin-rt-fallout.patch"
${git} "${DIR}/patches/rt/net-make-devnet_rename_seq-a-mutex.patch"

# CRYPTO
${git} "${DIR}/patches/rt/peterz-srcu-crypto-chain.patch"

# LOCKDEP
${git} "${DIR}/patches/rt/lockdep-selftest-only-do-hardirq-context-test-for-raw-spinlock.patch"
${git} "${DIR}/patches/rt/lockdep-selftest-fix-warnings-due-to-missing-PREEMPT.patch"

# PERF
${git} "${DIR}/patches/rt/perf-make-swevent-hrtimer-irqsafe.patch"
${git} "${DIR}/patches/rt/kernel-perf-mark-perf_cpu_context-s-timer-as-irqsafe.patch"

# RCU
${git} "${DIR}/patches/rt/rcu-disable-rcu-fast-no-hz-on-rt.patch"
${git} "${DIR}/patches/rt/rcu-Eliminate-softirq-processing-from-rcutree.patch"
${git} "${DIR}/patches/rt/rcu-make-RCU_BOOST-default-on-RT.patch"
${git} "${DIR}/patches/rt/rcu-enable-rcu_normal_after_boot-by-default-for-RT.patch"

# PREEMPT LAZY
${git} "${DIR}/patches/rt/preempt-lazy-support.patch"
${git} "${DIR}/patches/rt/ftrace-Fix-trace-header-alignment.patch"
${git} "${DIR}/patches/rt/x86-preempt-lazy.patch"
${git} "${DIR}/patches/rt/arm-preempt-lazy-support.patch"
${git} "${DIR}/patches/rt/powerpc-preempt-lazy-support.patch"
${git} "${DIR}/patches/rt/arch-arm64-Add-lazy-preempt-support.patch"

# LEDS
${git} "${DIR}/patches/rt/leds-trigger-disable-CPU-trigger-on-RT.patch"

# DRIVERS
${git} "${DIR}/patches/rt/mmci-remove-bogus-irq-save.patch"
${git} "${DIR}/patches/rt/cpufreq-drop-K8-s-driver-from-beeing-selected.patch"
${git} "${DIR}/patches/rt/connector-cn_proc-Protect-send_msg-with-a-local-lock.patch"
${git} "${DIR}/patches/rt/drivers-block-zram-Replace-bit-spinlocks-with-rtmute.patch"
${git} "${DIR}/patches/rt/drivers-zram-Don-t-disable-preemption-in-zcomp_strea.patch"

# I915
${git} "${DIR}/patches/rt/drm-i915-drop-trace_i915_gem_ring_dispatch-onrt.patch"
${git} "${DIR}/patches/rt/i915-bogus-warning-from-i915-when-running-on-PREEMPT.patch"
${git} "${DIR}/patches/rt/drmradeoni915_Use_preempt_disableenable_rt()_where_recommended.patch"
${git} "${DIR}/patches/rt/drmi915_Use_local_lockunlock_irq()_in_intel_pipe_update_startend().patch"

# CGROUPS
${git} "${DIR}/patches/rt/cgroups-use-simple-wait-in-css_release.patch"
${git} "${DIR}/patches/rt/cgroups-scheduling-while-atomic-in-cgroup-code.patch"

# New stuff
# Revisit: We need this in other places as well
${git} "${DIR}/patches/rt/move_sched_delayed_work_to_helper.patch"

# MD
${git} "${DIR}/patches/rt/md-disable-bcache.patch"

# WORKQUEUE SIGH
${git} "${DIR}/patches/rt/workqueue-prevent-deadlock-stall.patch"

# Add RT to version
${git} "${DIR}/patches/rt/localversion.patch"
