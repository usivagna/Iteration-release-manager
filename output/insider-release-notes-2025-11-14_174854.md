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
- ## Why is this change being made? Partners are reporting that brightness change hotkeys/OSD are not being recognized (repro 1/200). Though settings page can change the brightness. From the logs: DES is receiving notifications about brightness level change through DePowerGuidShim. DePowerGuidShim does not have a settingsGroup added to its interface to affect the brightness change. SettingsGroup object should be registered in the DePowerGuidShim upon devicearrival for all internal monitors whic...

### [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pullrequestloop.c

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature
- ## Why is this change being made? New security practices for accessing usermode data ## What changed? - Utilizing new pattern for user-mode access across identified locations - CD boilerplate ## How was the change tested? Ran all `VhfTaefTest.dll` with/without CD feature enabled.

### [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\readreportloop.c

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? New security practices for accessing usermode data ## What changed? - Utilizing new pattern for user-mode access across identified locations - CD boilerplate ## How was the change tested? Ran all `VhfTaefTest.dll` with/without CD feature enabled.
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

### [I3C] Get status IOCTL does not fail when target returns incomplete payload

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? After implementing short read error behavior, we needed to update the ReadOverrideStopDuringEnumeration test to match the new expected behavior. ## What changed? Changed the ReadOverrideStopDuringEnumeration test to error out short reads and removed incorrect log checks that were causing failures. ## How was the change tested? Tested on Intel and AMD with both now passing.

### [PTL][PPV] Innodisk USB thumb drive prevent system to enter pkg c-states (implement a SW workaround for Intel Pantherlake systems to enter package C-State when a USB SS device is attached)

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Intel reported that on Panther Lake XHCI controllers, on idle of all SuperSpeed devices, an additional Stop Endpoint command is expected for SuperSpeed endpoints to power down their memory path. Currently, USBXHCI does not need to send this command on XHCI 1.1+ controllers. If the controller is in D0 due to only USB 2.0 devices, the SuperSpeed endpoint memory path is not powered down and system cannot enter a deeper package C-state. ## What changed? To work a...

### UcmCx to skip USB host stack loading when port partner claims not usb communication capable

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Code review and telemetry analysis found two issues in UcmCx!UpdateUrsState. 1. Though no real A/Vs have been found so far, it looks the newly added code that accesses "*ursHardwareEvent" could potentially hit A/V immediately after URS request is sent if the URS request is completed quickly. !13008036 2. The existing telemetry event "UrsUpdate" is missing Connector ID, which makes the event correlation difficult. ## What changed? 1. Accessing "*ursHardwareEve...
- ## Why is this change being made? Most USB-C PD chargers are SRC/DFP only. Qualcomm 8480 system comes with a charger that supports DRD but doesn't support USB data. (Its UFP role is for the DFP partner to discover its modes.) Due to its initial DFP role, UcmUcsiCx attempts a (data) role correction by initiating a data-role swap. (For regular chargers, this data-role swap will fail because they are not DRD.) After the data-role swap, the Qualcomm system attempts to load USB host, which however...
- ## Why is this change being made? The following two changes in UcmCx have been monitored via CFRs for over two months without getting regression reports. The same changes have been marked for AlwaysEnabled in BR/RS since the end of Aug and the beginning of Sep. !13008036 !13414499 ## What changed? Changing to EnabledByDefault for 2601. Since this feature's velocity entry is diverged between GE and BR/RS, this change is kept in GE and made in the GE backport branch. ## How was the change teste...
- Cherry picked from !13414499 ## Why is this change being made? Code review and telemetry analysis found two issues in UcmCx!UpdateUrsState. 1. Though no real A/Vs have been found so far, it looks the newly added code that accesses "*ursHardwareEvent" could potentially hit A/V immediately after URS request is sent if the URS request is completed quickly. !13008036 2. The existing telemetry event "UrsUpdate" is missing Connector ID, which makes the event correlation difficult. ## What changed? ...

### [I3C] MmTransportPioTx can be torn down before SM processes deinitialize event

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Currently, both `MmTransportPioTx`/`MmTransportPioRx` can be destroyed before the DeInitialize event is processed (as EnqueueEvent occurs in destructor) ## What changed? Explicit `DeInitialize` method that returns when SM is destroyed ## How was the change tested? Ran `i3cendtoendtest.dll`

### [I3C] IBI DPC not guaranteed to have completed before StopHostControllerInstance() returns

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? `StopHostControllerInstance()` must ensure that the IBI DPC has completed before it returns; otherwise IBI DPC thread can still be running after Stop* returns, breaking the contract. e.g. race in ResetTransport() when after StopHostControllerInstance() invoked, can't be sure that IBI thread isn't running and modifying members; preventing requeuing of any pended IBI. ## What changed? Flushing DPCs before `StopHostControllerInstance()` returns ## How was the ch...

### [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pdo.c

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

### USB WMI event telemetry such as overcurrent is no longer available  

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? The existing USBUI telemetry, for example, for overcurrent, is via SQM, which API appears to be deprecated and no-op. Also, these WMI events may not be even fired by the hub driver when the user has not logged in, which means the old SQM telemetry had already missed some potential reports. Furthermore, USBUI has very limited info such as the root hub name, which is not very useful in telemetry-based analysis. This PR adds new telemetry events to the USBHUB3 d...
- ## Why is this change being made? The following change has been monitored via CFRs for months and generating new telemetry events but without reporting regressions. It's time to make it EnabledByDefault. !13535989 [Sample Kusto Query](https://dataexplorer.azure.com/clusters/wdgeventstore/databases/Webster?query=H4sIAAAAAAAAA2VOPQvCMBDd%2FRVHJgsli7NLRXBQF1s6iJSYXOsNzUlyba3446120%2BHBg%2FdZknc8xA0H3PboJcLiBcMNA0LlTYsQxQSJA8kN1IFs4Mi16HKO6eKUfbArspXOg7G456Yh3%2BiypW%2BfmurwIegdHFmoJmuE2OfjHWENwu...

### [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_hidi3ctest.dll!unknown_error_in_taef

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? I3C is not enabled-by-default on Bromine/BR, so all tests are failing. ## What changed? Disabling all I3C tests ## How was the change tested? Ran `buildtestpasses -q` locally 

### [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\control.cpp

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

### [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\fdoio.cpp

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

### [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\probe.c

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

### [UMA] Usermode accesses found in onecore\drivers\input\hid\hidcore\hidclass\util.c

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

### [I3C] WDFDEVICE & Queue handles in Target context are overwritten before ReleaseHardware of old PDO on re-enumeration

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? When a Target-driver requests re-enumeration of an I3C Target, there is no guarantee that ReleaseHardware for the existing PDO will be called before CreateAndInitializePdo is called for the new PDO, which will attempt to overwrite WDF handles in context that may be still in use by the existing WDFDEVICE. ## What changed? This change: - Updates the Target class to maintain two WDFDEVICEs while re-enumeration is occurring; the primary one and the new one. - Rem...

### [wdf] usbiotargettest.testmd: SharingMechanism StartupStatus not ready 2

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Seen failures in recent test runs when qarootbus devices weren't previously enumerated be preceeding tests. So, when the SanAndreas service is queried by usbiotarget test it fails, as the device isn't created until after the constructor. ## What changed? Explicitly creating the `SharedStreamProvider` after qarootbus device is created; ensuring the sanandreas service is up ## How was the change tested? Ran locally with sanandreas service previously delete to e...

### [GE LT] Feature_SoftwareOffloadWithClientBuffers | 39615196: Ensure LT And GE branches are identical

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Ensuring both LT and GE release branches are identical at AlwaysDisabled ## What changed? Removed the alwaysDisabled branch token and replace with alwaysDisabledReleaseTokens ## How was the change tested? Built locally usbxhci, featurestaging-usb.xml and featureEnablement tool without issues.
- Cherry picked from !13784581 Cherry-picked from commit `df3746e5`. ## Why is this change being made? Ensuring both LT and GE release branches are identical at AlwaysDisabled ## What changed? Removed the alwaysDisabled branch token and replace with alwaysDisabledReleaseTokens ## How was the change tested? Built locally usbxhci, featurestaging-usb.xml and featureEnablement tool without issues.
- ## Why is this change being made? ## What changed? ## How was the change tested? _For more information on the code review process, see the [Code Review Guidelines & Etiquette](https://aka.ms/codereviewguidelines)._ Cherry picked from !13784581 Cherry-picked from commit `df3746e5`. ## Why is this change being made? Ensuring both LT and GE release branches are identical at AlwaysDisabled. The change is already in GE_CURRENT which will flow to the LT_RELEASE_SVC_*, but there is a request to brin...

### [wini3c][test] Timeout during ResetOverlapped::ResetWithCccDefiningByte

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Recent lab test run failed due to timeout. This is likely due to the short timeout (and long time running on the VM), rather than a regression (particularly since we've never seen this before) ## What changed? Increasing timeout from 1sec to 5sec. 

### [RI-TP] Failed SpbTarget::Sequence: SUCCEEDED(VirtualHostControllerDevice::CreateAndInitializeAcpi(hcis, acpiAsl, hcd)) - Value (0x80070102)

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? From recent test failure, it looks like ACPISim is the culprit, but need to add more logging to understand where it's failing. If/when this fails again, we'll have more traces to start narrowing down the problem. ## What changed? Increase diagnostics to level-5 and added missing TraceLogging enablement. ## How was the change tested? Ran test (instrumented with error in winsim) and validated lines are in output trace

### [USB4] InterdomainRxRing Consumer Index is incorrectly initialized leading to blocked P2P file transfers

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? The InterdomainRxRing programs the correct starting configuration index into hardware (m_size-1 => 4095) but then operates on a local copy of the index that is initialized to 0. This means that it starts evaluating the ring at index 1 instead of index 0 -- it evaluates ((index+1)%m_size). If the descriptor at index 1 is not done yet, then the local index is re-synchronized with hardware and back to the correct starting index (4095). However if the descriptor ...


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
*Generated on 2025-11-14 17:49:14*
