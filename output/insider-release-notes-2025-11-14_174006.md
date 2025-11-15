# What's New in Buses & Sensors - 2510

## Overview

This release includes 32 improvements to Windows connectivity and sensor capabilities, focusing on enhanced reliability, performance, and user experience.

## New Features

No new features with PRs in this release.

## Improvements

- !analyze - Bugcheck 0x15F - CONNECTED_STANDBY_WATCHDOG_TIMEOUT_LIVEDUMP - Blames USB4/Tunnel in Nickel and GE+CD branches
- [USB][Camera] Productize eUSB2 Double-Isoch changes
- [1] [Recovery] Invoke PLDR / FLDR on device crash
- [1] [UMDF DMA] Require ProcessSharingDisabled
- [I3C] HostController must remain in D0 while Target has non-IBI transfers pending
- [I3C][WinI3C] Reset API
- [USB][Test] Add USB Wake Test for testing controller sleep/wake scenarios
- [I3C] Enable on Intel NVL
- [SuperMITT] Add HIDI3C Mouse and Keyboard Support
- [WDF][HLK] Update WdfFuncTableChecks for v35 release

## Bug Fixes

### [Huaqin][Lenovo][GHD][Altai][8340]The brightness can't be control by hotkey and OSD,but can change in OS setting. FR:1/200 UUts

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Partners are reporting that brightness change hotkeys/OSD are not being recognized (repro 1/200). Though settings...

### [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pullrequestloop.c

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Ena...
- ## Why is this change being made? New security practices for accessing usermode data ## What changed? - Utilizing new pattern for user-mode access ...

### [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\readreportloop.c

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? New security practices for accessing usermode data ## What changed? - Utilizing new pattern for user-mode access ...
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Ena...

### [I3C] Get status IOCTL does not fail when target returns incomplete payload

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? After implementing short read error behavior, we needed to update the ReadOverrideStopDuringEnumeration test to m...

### [PTL][PPV] Innodisk USB thumb drive prevent system to enter pkg c-states (implement a SW workaround for Intel Pantherlake systems to enter package C-State when a USB SS device is attached)

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Intel reported that on Panther Lake XHCI controllers, on idle of all SuperSpeed devices, an additional Stop Endpo...

### UcmCx to skip USB host stack loading when port partner claims not usb communication capable

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Code review and telemetry analysis found two issues in UcmCx!UpdateUrsState. 1. Though no real A/Vs have been fou...
- ## Why is this change being made? Most USB-C PD chargers are SRC/DFP only. Qualcomm 8480 system comes with a charger that supports DRD but doesn't ...
- ## Why is this change being made? The following two changes in UcmCx have been monitored via CFRs for over two months without getting regression re...
- Cherry picked from !13414499 ## Why is this change being made? Code review and telemetry analysis found two issues in UcmCx!UpdateUrsState. 1. Thou...

### [I3C] MmTransportPioTx can be torn down before SM processes deinitialize event

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Currently, both `MmTransportPioTx`/`MmTransportPioRx` can be destroyed before the DeInitialize event is processed...

### [I3C] IBI DPC not guaranteed to have completed before StopHostControllerInstance() returns

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? `StopHostControllerInstance()` must ensure that the IBI DPC has completed before it returns; otherwise IBI DPC th...

### [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pdo.c

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Ena...

### USB WMI event telemetry such as overcurrent is no longer available  

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? The existing USBUI telemetry, for example, for overcurrent, is via SQM, which API appears to be deprecated and no...
- ## Why is this change being made? The following change has been monitored via CFRs for months and generating new telemetry events but without repor...

### [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_hidi3ctest.dll!unknown_error_in_taef

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? I3C is not enabled-by-default on Bromine/BR, so all tests are failing. ## What changed? Disabling all I3C tests #...

### [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\control.cpp

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Ena...

### [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\fdoio.cpp

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Ena...

### [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\probe.c

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Ena...

### [UMA] Usermode accesses found in onecore\drivers\input\hid\hidcore\hidclass\util.c

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Ena...

### [I3C] WDFDEVICE & Queue handles in Target context are overwritten before ReleaseHardware of old PDO on re-enumeration

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? When a Target-driver requests re-enumeration of an I3C Target, there is no guarantee that ReleaseHardware for the...

### [wdf] usbiotargettest.testmd: SharingMechanism StartupStatus not ready 2

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Seen failures in recent test runs when qarootbus devices weren't previously enumerated be preceeding tests. So, w...

### [GE LT] Feature_SoftwareOffloadWithClientBuffers | 39615196: Ensure LT And GE branches are identical

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Ensuring both LT and GE release branches are identical at AlwaysDisabled ## What changed? Removed the alwaysDisab...
- Cherry picked from !13784581 Cherry-picked from commit `df3746e5`. ## Why is this change being made? Ensuring both LT and GE release branches are i...
- ## Why is this change being made? ## What changed? ## How was the change tested? _For more information on the code review process, see the [Code Re...

### [wini3c][test] Timeout during ResetOverlapped::ResetWithCccDefiningByte

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Recent lab test run failed due to timeout. This is likely due to the short timeout (and long time running on the ...

### [RI-TP] Failed SpbTarget::Sequence: SUCCEEDED(VirtualHostControllerDevice::CreateAndInitializeAcpi(hcis, acpiAsl, hcd)) - Value (0x80070102)

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? From recent test failure, it looks like ACPISim is the culprit, but need to add more logging to understand where ...

### [USB4] InterdomainRxRing Consumer Index is incorrectly initialized leading to blocked P2P file transfers

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? The InterdomainRxRing programs the correct starting configuration index into hardware (m_size-1 => 4095) but then...


## For Developers

### API Changes

Please review the work items and pull requests for detailed information about any API changes or new capabilities.

### Work Items Included

- Work Item 48522963: !analyze - Bugcheck 0x15F - CONNECTED_STANDBY_WATCHDOG_TIMEOUT_LIVEDUMP - Blames USB4/Tunnel in Nickel and GE+CD branches
- Work Item 54529555: [Huaqin][Lenovo][GHD][Altai][8340]The brightness can't be control by hotkey and OSD,but can change in OS setting. FR:1/200 UUts
- Work Item 56414704: [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pullrequestloop.c
- Work Item 56414705: [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\readreportloop.c
- Work Item 56985893: [USB][Camera] Productize eUSB2 Double-Isoch changes
- Work Item 57292515: [I3C] Get status IOCTL does not fail when target returns incomplete payload
- Work Item 57344706: [1] [Recovery] Invoke PLDR / FLDR on device crash
- Work Item 57420817: [PTL][PPV] Innodisk USB thumb drive prevent system to enter pkg c-states (implement a SW workaround for Intel Pantherlake systems to enter package C-State when a USB SS device is attached)
- Work Item 57421651: [1] [UMDF DMA] Require ProcessSharingDisabled
- Work Item 57544549: UcmCx to skip USB host stack loading when port partner claims not usb communication capable
- Work Item 57909081: [I3C] MmTransportPioTx can be torn down before SM processes deinitialize event
- Work Item 58050338: [I3C] IBI DPC not guaranteed to have completed before StopHostControllerInstance() returns
- Work Item 58207911: [I3C] HostController must remain in D0 while Target has non-IBI transfers pending
- Work Item 58547489: [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pdo.c
- Work Item 58638331: TVS: Multiple 28750 Warnings in file: shell\osshell\cpls\ports\ports.c
- Work Item 58791383: USB WMI event telemetry such as overcurrent is no longer available  
- Work Item 59120105: [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_hidi3ctest.dll!unknown_error_in_taef
- Work Item 59124058: [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\control.cpp
- Work Item 59124059: [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\fdoio.cpp
- Work Item 59124060: [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\probe.c
- Work Item 59124062: [UMA] Usermode accesses found in onecore\drivers\input\hid\hidcore\hidclass\util.c
- Work Item 59142958: [I3C] WDFDEVICE & Queue handles in Target context are overwritten before ReleaseHardware of old PDO on re-enumeration
- Work Item 59176904: [I3C][WinI3C] Reset API
- Work Item 59209656: [wdf] usbiotargettest.testmd: SharingMechanism StartupStatus not ready 2
- Work Item 59368848: [GE LT] Feature_SoftwareOffloadWithClientBuffers | 39615196: Ensure LT And GE branches are identical
- Work Item 59388824: [USB][Test] Add USB Wake Test for testing controller sleep/wake scenarios
- Work Item 59689131: [wini3c][test] Timeout during ResetOverlapped::ResetWithCccDefiningByte
- Work Item 59692400: [I3C] Enable on Intel NVL
- Work Item 59816561: [RI-TP] Failed SpbTarget::Sequence: SUCCEEDED(VirtualHostControllerDevice::CreateAndInitializeAcpi(hcis, acpiAsl, hcd)) - Value (0x80070102)
- Work Item 59832815: [USB4] InterdomainRxRing Consumer Index is incorrectly initialized leading to blocked P2P file transfers
- Work Item 59907326: [SuperMITT] Add HIDI3C Mouse and Keyboard Support
- Work Item 59963386: [WDF][HLK] Update WdfFuncTableChecks for v35 release

---

**Note:** These features are available to Windows Insiders in the latest builds.

For more information about the Windows Insider Program, visit [https://insider.windows.com](https://insider.windows.com)

---
*Generated on 2025-11-14 17:40:25*
