# Iteration Summary: 2510

**Period:** 2025-09-29T00:00:00Z to 2025-11-02T00:00:00Z
**Team:** ft_buses
**Areas:** Buses & Sensors

## Executive Summary

- Total work items completed: 876
- Work items with PRs: 32
- Breakdown by type (with PRs):
  - : 32
- Breakdown by area (with PRs):
  - USB4: 1
  - Display Enhancement Service: 1
  - Input Drivers: 4
  - USB: 6
  - I3C: 11
  - WDF-Windows Driver Frameworks: 7
  - Legacy: 1
  - Buses: 1

## Buses Component

**[48522963] !analyze - Bugcheck 0x15F - CONNECTED_STANDBY_WATCHDOG_TIMEOUT_LIVEDUMP - Blames USB4/Tunnel in Nickel and GE+CD branches**

- **Type:** Task
- **State:** Completed
- **Description:** 
- **Pull Requests:**
  - **PR #10667522:** [usb4] 15fs should VPP or power-dependency not Usb4HostRouter.sys
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Examining classifications from previous change, most/all are resolving to BucketId `LKD_0x15F_USB4_HRD_D0_IMAGE_Usb4HostRouter.sys`. This erroneously includes failures on Nickel being misclassified as HRD issues, whereas it should be unknown. !analyze just doesn't have enough data to work with from Nickel builds, so get's it wrong. Additionally, since this change needs to ported to ge* (to be delivered to CD), it's important that !analyze works as expected with the feature Contained (and when it's on/off). ## What changed - Always includes secondary-data (for Tunnels) when USB4 is blamed. If no Tunnel is to blame, then all fields will be zero. This gives !analyze something to distinguish between builds which 'have' the data necessary to classify DRIPS and those that don't (including when contained feature is turned-off) - An additional change will also be made to !analyze to take advantage of this new data. ## How was the change tested Triggered DRIPS for below scenarios (with !analyze change), and validated BucketId is expected. - USB3 device (plugged into external DeviceRouter) with OS power-management disabled - HostRouter device with OS power-management disabled.

  - **PR #10922059:** [usb4][gebackport] 15fs should blame VPP or power-dependency not Usb4HostRouter.sys
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Examining recent USB4 15F LKDs (DRIPS watchdog violations), Watson BucketIds and data within minidump don't accurately blame misbehaving-component (HostRouter, VPP, Tunnel...) ## What changed Capturing 'secondary-data' when USB4 is blamed, detailing which (if any Tunnels) are in D0 and preventing USB4 stack from powering-down. (*Note: GUID and struct for secondary should eventually be moved to a public header to be consumed directly from !analyze*) An additional change has been drafted in !analyze to utilize this new secondary-data and create more useful BucketIds. *Note: Since this is a backport, containment was added. For simplicity, the [contract](https://www.osgwiki.com/wiki/Containment_101#Contract) style was chosen.* ## How was the change tested - Configured USB3.0 device (connected to external USB4 HostRouter) to never power-down and induced 15F - Verified USB3 tunnel is blamed in mini-dump and LKD - FailureBucketId == `LKD_0x15F_USB4_TunnelsD0_USB3_IMAGE_Usb4HostRouter.sys` - Configured HostRouter device to never power-down and induced 15F - Verified HRD is blamed in mini-dump and LKD - FailureBucketId == `LKD_0x15F_USB4_HRD_D0_IMAGE_Usb4HostRouter.sys` - Validated with contained feature on/off - behaviour as expected (when off, 'Unknown' source is blamed) - FailureBucketId == `LKD_0x15F_USB4_UnknownCause_IMAGE_Usb4HostRouter.sys` Contents copied from !10139943 Contents copied from !10667522

  - **PR #10662061:** [usb4] Prefix should be for instance-path not service-name
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made From recent validation, the classification of blocking-tunnel is NOT correct, as it compares prefixes of service-names, not instance-paths. Likely this was missed during iteration, where it was correct, and subsequent iteration was not deployed to machine-under-test :(. ## What changed Corrected prefixes to be that of the instance-paths. ## How was the change tested Induced 15F on USB4 with USB3 DRIPS-blocking device. Generated 15F LKD/mini-dump now correctly indicates USB3 is culprit

  - **PR #10946526:** [usb4] 15fs should blame VPP or power-dependency not Usb4HostRouter.sys
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Examining classifications from previous change, most/all are resolving to BucketId `LKD_0x15F_USB4_HRD_D0_IMAGE_Usb4HostRouter.sys`. This erroneously includes failures on Nickel being misclassified as HRD issues, whereas it should be unknown. !analyze just doesn't have enough data to work with from Nickel builds, so get's it wrong. Additionally, since this change needs to ported to ge* (to be delivered to CD), it's important that !analyze works as expected with the feature Contained (and when it's on/off). ## What changed - Always includes secondary-data (for Tunnels) when USB4 is blamed. If no Tunnel is to blame, then all fields will be zero. This gives !analyze something to distinguish between builds which 'have' the data necessary to classify DRIPS and those that don't (including when contained feature is turned-off) - An additional change will also be made to !analyze to take advantage of this new data. ## How was the change tested Triggered DRIPS for below scenarios (with !analyze change), and validated BucketId is expected. - USB3 device (plugged into external DeviceRouter) with OS power-management disabled - HostRouter device with OS power-management disabled. Cherry picked from !10667522 Cherry-picked from commit `7783d064`.

  - **PR #10139943:** [usb4] 15fs should VPP or power-dependency not Usb4HostRouter.sys
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Examining recent USB4 15F LKDs (DRIPS watchdog violations), Watson BucketIds and data within minidump don't accurately blame misbehaving-component (HostRouter, VPP, Tunnel...) ## What changed Capturing 'secondary-data' when USB4 is blamed, detailing which (if any Tunnels) are in D0 and preventing USB4 stack from powering-down. (Note: GUID and struct for secondary will eventually be moved to a public header to be consumed directly from `!analyze`) An additional change has been drafted in `!analyze` to utilize this new secondary-data and create more useful BucketIds. ## How was the change tested Instrumented USB4-stack+PoFx locally to trigger 15F and exercise relevant paths.

---

**[56414704] [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pullrequestloop.c**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13473715:** [VHF] EnabledByDefault - Align usermode-access (UMA) pattern with latest security practices
    **Repository:** os.2020

    **Description:**

    After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

  - **PR #12903533:** [VHF] Align usermode-access (UMA) pattern with latest security practices
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made New security practices for accessing usermode data ## What changed - Utilizing new pattern for user-mode access across identified locations - CD boilerplate ## How was the change tested Ran all `VhfTaefTest.dll` with/without CD feature enabled.

---

**[56414705] [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\readreportloop.c**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #12903533:** [VHF] Align usermode-access (UMA) pattern with latest security practices
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made New security practices for accessing usermode data ## What changed - Utilizing new pattern for user-mode access across identified locations - CD boilerplate ## How was the change tested Ran all `VhfTaefTest.dll` with/without CD feature enabled.

  - **PR #13473715:** [VHF] EnabledByDefault - Align usermode-access (UMA) pattern with latest security practices
    **Repository:** os.2020

    **Description:**

    After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

---

**[56985893] [USB][Camera] Productize eUSB2 Double-Isoch changes**

- **Type:** Task
- **State:** Completed
- **Description:** Validation of the POC across Intel and AMD hosts is complete. Track getting that POC code into a productizable state and checked into EEAP builds to enable the next phase of silicon validation.
- **Pull Requests:**
  - **PR #12940218:** Bumping the UCX version from 1.6 to 1.7
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made This change is being made to take a snapshot of the UCX public interface from 1.6 to 1.7 so that further changes can be made. ## What changed The UCX public interface changed from 1.6 to 1.7. To accomplish this, the current header files for the UCX public interface were generated and archived. ## How was the change tested This change was tested by compiling the UCX directory to ensure that no build errors occurred. *For more information on the code review process, see the [Code Review Guidelines & Etiquette](https://aka.ms/codereviewguidelines).*

  - **PR #12944571:** UCX eUSB2v1 Double Isochronous Bandwidth Support
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made This change is being made to allow the usb stack to make use of the eUSB2v1 Double Isochronous Bandwidth to support high bandwidth eUSB2v1 cameras. ## What changed New versions of the Endpoint_Create() UCX public interface function was created to add the optional eUSB2v1 Double Isochronous Bandwidth endpoint companion descriptor input parameter while preserving the interface of the original function. The Endpoint_CalculateMaximumTransferSize() function was also updated to set the wMaxPacketSize appropriately in the presence of the newly introduced eUSB2v1 companion descriptor. ## How was the change tested The business logic for this feature was tested by our partners at AMD. Further testing for descriptor validation will be conducted with the use of a MUTT once the USB3 Hub and xHCI changes are merged. Until then, the code in this PR should be unreachable. *For more information on the code review process, see the [Code Review Guidelines & Etiquette](https://aka.ms/codereviewguidelines).*

  - **PR #13020442:** EUSB2v1 Double Isochronous Bandwidth Support
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made This change introduces support for eUSB2v1 double isochronous bandwidth IN endpoints, which is required to enable internal eUSB2v1 cameras to operate with higher-bandwidth video formats. ## What changed Modifications were made across all three layers of the USB stack—USB3Hub, UCX, and xHCI—to support a new eUSB2 isochronous companion descriptor that describes the configuration of double isochronous endpoints. - USB3Hub: Updated to recognize and validate the new eUSB2 isochronous companion descriptor. - UCX: Public interface functions that required changes were duplicated to preserve compatibility with third-party drivers. - xHCI: Enhanced to support host controller changes defined in the xHCI_Rev1_2c specification, including new register values and logic for handling double isochronous endpoints. ## How was the change tested **Testing Summary** - Testing was performed by Intel on an FPGA-based setup. - Verified that the 6K endpoint was selected correctly based on app format choices. - Confirmed hotplug enumeration and device re-enumeration after reboot. - Descriptor parsing was validated for the positive test case (well-formed descriptors). - Streaming tests were not performed because the current setup uses an FPGA, not a real camera. - Plan: Once the Realtek camera arrives (expected in a few weeks), Intel will run full validation, including streaming, across different camera devices, speeds, and velocity dispositions. - Manual Regression testing was performed by Microsoft using a USB 2.0 High-Speed mode (480 Mbps) webcam (Logitech Logi V-U0018 860-000592 HD 720p Webcam) and a USB 3.0 webcam (Logitech Brio 4K webcam with Windows Hello support). The enumeration and functionality of the webcam were tested with the feature in both the enabled and disabled states. - Back compat testing was performed by updating the xhci driver but not the ucx nor usbhub3 drivers. Another test was performed by also updating the usbhub3 and ucx drivers ...

  - **PR #12944631:** UCX Public Interface eUSB2v1 Double Isochronous Bandwidth Support
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made This change is being made to allow the usb stack to make use of the eUSB2v1 Double Isochronous Bandwidth to support high bandwidth eUSB2v1 cameras. ## What changed New versions of the Endpoint_Create() UCX public interface function was created to add the optional eUSB2v1 Double Isochronous Bandwidth endpoint companion descriptor input parameter while preserving the interface of the original function. The Endpoint_CalculateMaximumTransferSize() function was also updated to set the wMaxPacketSize appropriately in the presence of the newly introduced eUSB2v1 companion descriptor. ## How was the change tested The business logic for this feature was tested by our partners at AMD. Further testing for descriptor validation will be conducted with the use of a MUTT once the USB3 Hub and xHCI changes are merged. Until then, the code in this PR should be unreachable. *For more information on the code review process, see the [Code Review Guidelines & Etiquette](https://aka.ms/codereviewguidelines).*

  - **PR #14006614:** BusesCdFeatureEnablementTool - Enable Feature_Standalone_Future
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Recent tests on release branches (e.g. `ge_release_*`) shows that our `BusesCdFeatureEnablementTool` fails to enable our velocity features effectively. This may have been day-1 issue of our tool. Investigation found the cause that the tool enables `Feature_Bundle_Future` but does not touch its dependent `Feature_Standalone_Future`. A typical feature dependency graph looks like this: `Feature_Foo` -> 48433719: `Feature_Bundle_Future`, which is `DisabledByDefault` --> 49453572: `Feature_Standalone_Future`, which is `AlwaysEnabled` on dev branches, with branch exception to `DisabledByDefault` for release branches ## What changed Our tool was originally created using the sample codes for custom feature enablement tools, which appear to have diverged from the official StagingTool, which proves to be working. While it's technically possible to keep syncing our tool codes with StagingTool, we decided to minimize the cost and just add the `Feature_Standalone_Future` ID to our tool instead. ## How was the change tested Test the tool on a `ge_release_*` clean install machine and verify `Feature_eUSB2v1_Double_Isoch_BW` works by stepping through `usbhub3.sys`.

---

**[57292515] [I3C] Get status IOCTL does not fail when target returns incomplete payload**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13755710:** [SuperMITT] Fix ReadOverrideStopDuringEnumeration
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made After implementing short read error behavior, we needed to update the ReadOverrideStopDuringEnumeration test to match the new expected behavior. ## What changed Changed the ReadOverrideStopDuringEnumeration test to error out short reads and removed incorrect log checks that were causing failures. ## How was the change tested Tested on Intel and AMD with both now passing.

---

**[57344706] [1] [Recovery] Invoke PLDR / FLDR on device crash**

- **Type:** Task
- **State:** Completed
- **Description:** 
- **Pull Requests:**
  - **PR #12830581:** [UMDF DMA] Query and Invoke Platform/Function Level Device Reset
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Design Spec 10.2 Handling Abnormal UMDF Host Process Termination This pull-request introduces the ability to query and invoke Platform Level Device Reset (PLDR) and Function Level Device Reset (FLDR) in the UMDF framework. This enhancement is aimed at improving device recovery mechanisms. For a UMDF driver doing DMA, it is required to support `DEVICE_RESET_INTERFACE_STANDARD`, or else WDF will fail the device start. When UM driver crashes or hangs, KM WudfRd calls the said interface to put the device back to a known uninitialized state. ## What changed WudfRd verifies the device supports `DEVICE_RESET_INTERFACE_STANDARD` on starting up and invokes the `DeviceReset` method on failure. - Control.cpp: Added DeviceReset method to handle PLDR and FLDR, including support checks and error handling. - Dma.cpp: Integrated checks for device support of PLDR/FLDR and implemented reset invocation in `BlockUnfinishedDma`. ## How was the change tested - Use WiFi adapter (PCI 8086:06F0) that supports PLDR. - Install the `umdf_dma` test driver, kill wudfhost, verify PLDR is invoked.

---

**[57420817] [PTL][PPV] Innodisk USB thumb drive prevent system to enter pkg c-states (implement a SW workaround for Intel Pantherlake systems to enter package C-State when a USB SS device is attached)**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13200526:** [USBXHCI] Tracking superspeed transfers and implement idle hint workaround
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Intel reported that on Panther Lake XHCI controllers, on idle of all SuperSpeed devices, an additional Stop Endpoint command is expected for SuperSpeed endpoints to power down their memory path. Currently, USBXHCI does not need to send this command on XHCI 1.1+ controllers. If the controller is in D0 due to only USB 2.0 devices, the SuperSpeed endpoint memory path is not powered down and system cannot enter a deeper package C-state. ## What changed To work around this, Intel provided a proprietary MMIO register to set/clear if all USB3 ports are in low power. Specifically for Panther Lake XHCI controllers, track the number of outstanding SuperSpeed transfers (control, bulk, isoch, stream and interrupt), and engage when there are no more outstanding transfers, disengage otherwise. Use the number of transfer WDFREQUESTs that has been retrieved **once** by USBXHCI as a proxy to the outstanding SuperSpeed transfers count. ## How was the change tested - [X] Tested CHK build on PTL system with USBStress - [X] USBTCD single threaded Isoch and Bulk testing to repeatedly toggle the register - [ ] Test for performance degradation with workaround - [ ] Test for any accounting overflow/underflow in cancel paths

---

**[57421651] [1] [UMDF DMA] Require ProcessSharingDisabled**

- **Type:** Task
- **State:** Completed
- **Description:** Design Spec 8.1.1 UmdfHostProcessSharing [DDInstall.NT.Wdf] UmdfDirectHardwareAccess = AllowDirectHardwareAccessAndDma **UmdfHostProcessSharing = ProcessSharingDisabled** Note that we also support the unpublic registry entry DeviceGroupId. [DDInstall.NT.HW] AddReg = DeviceGroupId_AddReg [DeviceGroupId_AddReg] HKR,"WUDF","DeviceGroupId",0x00000000,"<group-id>"
- **Pull Requests:**
  - **PR #12868419:** [UMDF DMA] Require ProcessSharingDisabled
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Design Spec 8.1 Opt-in to enable DMA in the INF For a UMDF driver to use DMA, its INF file must specify either `ProcessSharingDisabled`: ``` [DDInstall.NT.Wdf] UmdfHostProcessSharing = ProcessSharingDisabled ``` or `DeviceGroupId` which is internal-only: ``` [DDInstall.NT.HW] AddReg = DeviceGroupId_AddReg [DeviceGroupId_AddReg] HKR,"WUDF","DeviceGroupId",0x00000000,"<group-id>" ``` ## What changed Query `UmdfHostProcessSharing` and `DeviceGroupId` early in WudfRd. When driver calls `WdfDmaEnablerCreate` verify the expected value, otherwise log an error and return failure. ## How was the change tested Verify the positive and negative case with `umdf_dma` test driver.

---

**[57544549] UcmCx to skip USB host stack loading when port partner claims not usb communication capable**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13414499:** Fixing potential A/V in Ucmcx!UpdateUrsState and also updating telemetry event UrsUpdate
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Code review and telemetry analysis found two issues in UcmCx!UpdateUrsState. 1. Though no real A/Vs have been found so far, it looks the newly added code that accesses "*ursHardwareEvent" could potentially hit A/V immediately after URS request is sent if the URS request is completed quickly. !13008036 2. The existing telemetry event "UrsUpdate" is missing Connector ID, which makes the event correlation difficult. ## What changed 1. Accessing "*ursHardwareEvent" before sending the URS request. The URS request failure is very rare and will be still logged in WPP. 2. Replacing the telemetry event of URS completion with the one of sending a URS request, and then including the Connector ID. Why changing the timing of telemetry event? The current context of the request only has the URS request state (UrsHardwareEventPortTypeDfp), but not the Connector ID, therefore, reporting the Connector ID from the completion routine would need a bit more changes. However, it's very rare for the URS request to fail, therefore, the value from the telemetry event in the request completion is low but not necessarily better. Also, the request completion failure is logged by WPP anyway. ## How was the change tested Tried Type-C connections with various devices (chargers, docks and USB drives) and confirmed that the new telemetry event is logged as expected.

  - **PR #13008036:** UcmCx to skip USB host stack loading when port partner claims not usb communication capable
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Most USB-C PD chargers are SRC/DFP only. Qualcomm 8480 system comes with a charger that supports DRD but doesn't support USB data. (Its UFP role is for the DFP partner to discover its modes.) Due to its initial DFP role, UcmUcsiCx attempts a (data) role correction by initiating a data-role swap. (For regular chargers, this data-role swap will fail because they are not DRD.) After the data-role swap, the Qualcomm system attempts to load USB host, which however may run into device YB or block DRIPS. On 8380, the UcmUcsiCx-initiated data-role swap will be denied by Qualcomm's UCSI PPM in PMIC. PMIC on 8480 no longer denies it. ## What changed UcmCx is updated to request URS to behave as "Type-C detach" (not loading anything) instead of loading USB host when the port partner is UFP but its Source Capabilities say that it doesn't support USB data. Here are more details of the change. 1. Since the URS request details are implemented in UcmCx, the fix is proposed in UcmCx instead of UcmUcsiCx, although the affected Qualcomm system is a UCSI system. But to limit scope the fix and avoid potential regression in any other case, the UcmCx change is proposed to be only applied to the scenario where the client driver is UcmUcsiCx. (The function GetImageName is copied from UcmUcsiCx.sys, and it has been running these codes for a couple of years, thus is proved to be working well.) Once we have more understanding from non-UCSI Qualcomm systems in the future, the fix scope could be extended. 2. Depending on the scenario details, the UcMCx client (UcmUcsiCx in this case) may report port partner's Source Capabilities and the port partner's UFP role (Port Partner Type) in different orders. 1). When such a charger is connected after UCM device is started, the initial Port Partner Type report from the client (UcmUcsiCx) is UFP. Port partner's source caps are queried and reported via DDI UcmConnectorPdPartnerSourceCaps. Later, the data-role swap will oc...

  - **PR #14128119:** Change the UcmCx fix for the UFP port partner without data to EbD for 2601
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made The following two changes in UcmCx have been monitored via CFRs for over two months without getting regression reports. The same changes have been marked for AlwaysEnabled in BR/RS since the end of Aug and the beginning of Sep. !13008036 !13414499 ## What changed Changing to EnabledByDefault for 2601. Since this feature's velocity entry is diverged between GE and BR/RS, this change is kept in GE and made in the GE backport branch. ## How was the change tested bcz

  - **PR #13518680:** [BR Cherry-pick] Fixing potential A/V in Ucmcx!UpdateUrsState and also updating telemetry event UrsUpdate
    **Repository:** os.2020

    **Description:**

    Cherry picked from !13414499 ## Why is this change being made Code review and telemetry analysis found two issues in UcmCx!UpdateUrsState. 1. Though no real A/Vs have been found so far, it looks the newly added code that accesses "*ursHardwareEvent" could potentially hit A/V immediately after URS request is sent if the URS request is completed quickly. !13008036 2. The existing telemetry event "UrsUpdate" is missing Connector ID, which makes the event correlation difficult. ## What changed 1. Accessing "*ursHardwareEvent" before sending the URS request. The URS request failure is very rare and will be still logged in WPP. 2. Replacing the telemetry event of URS completion with the one of sending a URS request, and then including the Connector ID. Why changing the timing of telemetry event? The current context of the request only has the URS request state (UrsHardwareEventPortTypeDfp), but not the Connector ID, therefore, reporting the Connector ID from the completion routine would need a bit more changes. However, it's very rare for the URS request to fail, therefore, the value from the telemetry event in the request completion is low but not necessarily better. Also, the request completion failure is logged by WPP anyway. ## How was the change tested Tried Type-C connections with various devices (chargers, docks and USB drives) and confirmed that the new telemetry event is logged as expected.

---

**[57909081] [I3C] MmTransportPioTx can be torn down before SM processes deinitialize event**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13518060:** [I3C] MmTransportPioTx can be torn down before SM processes deinitialize event
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Currently, both `MmTransportPioTx`/`MmTransportPioRx` can be destroyed before the DeInitialize event is processed (as EnqueueEvent occurs in destructor) ## What changed Explicit `DeInitialize` method that returns when SM is destroyed ## How was the change tested Ran `i3cendtoendtest.dll`

---

**[58050338] [I3C] IBI DPC not guaranteed to have completed before StopHostControllerInstance() returns**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13516898:** [I3C] IBI DPC not guaranteed to have completed before StopHostControllerInstance() returns
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made `StopHostControllerInstance()` must ensure that the IBI DPC has completed before it returns; otherwise IBI DPC thread can still be running after Stop* returns, breaking the contract. e.g. race in ResetTransport() when after StopHostControllerInstance() invoked, can't be sure that IBI thread isn't running and modifying members; preventing requeuing of any pended IBI. ## What changed Flushing DPCs before `StopHostControllerInstance()` returns ## How was the change tested Ran `i3cendtoendtest.dll`

---

**[58207911] [I3C] HostController must remain in D0 while Target has non-IBI transfers pending**

- **Type:** Task
- **State:** Completed
- **Description:** 
- **Pull Requests:**
  - **PR #13864945:** [I3C] Return HostController-Instance to D0 when Target updates DAT
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Currently, when Target updates the DAT, there's nothing to ensure the HostController-Instance returns to D0 to persist the updated DAT. (This is not a problem with (internal) DAT updates of HostController-Instances, as the SM handles these scenarios.) So a client could disable IBIs, and the DAT update (to enable IBI rejections) will not be set. This causes future IBIs that are sent by Target are silently dropped by Transport Coordinator (with the Target thinking they were successfully received) ## What changed - Update `HostControllerDat` to always acquire/remove a power-ref when updating the DAT from a Target. - Added new test to validate the HostController power-transition. ## How was the change tested Ran tests locally

---

**[58547489] [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pdo.c**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13473715:** [VHF] EnabledByDefault - Align usermode-access (UMA) pattern with latest security practices
    **Repository:** os.2020

    **Description:**

    After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

---

**[58638331] TVS: Multiple 28750 Warnings in file: shell\osshell\cpls\ports\ports.c**

- **Type:** Deliverable
- **State:** Completed
- **Description:** Static Analysis has detected multiple instances of banned API usage in the following file: `shell\osshell\cpls\ports\ports.c` More details regarding this TVS warning are as follows: `Warning C28750` - Banned usage of `lstrlen` and its variants: `lstrlenW` is a banned API for improved error handling purposes.
- **Pull Requests:**
  - **PR #13311236:** Addressing TVS Warning regarding the use of non-permitted lstrlen function
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Static Analysis (PREfast) flagged a violation of rule C28750 in the InstallPnPParallelPort function within ports.c. The issue stems from the use of the banned API lstrlen, which is disallowed due to its lack of robust error handling. This change ensures compliance with secure coding standards and improves the maintainability and safety of the code. ## What changed Replaced all instances of lstrlen with _tcsnlen, a safer and more flexible alternative that adapts to the project's character encoding (ANSI or Unicode). Added explicit casts to DWORD where appropriate to maintain type compatibility, since _tcsnlen returns a size_t, which is wider than the int returned by lstrlen. Added manual null-termination in a select few number of places where a string could potentially be non-null-terminated. These null-termination changes are unrelated to the TVS warning but are in close proximity to the other changes introduced in this PR, and so these null-termination changes were made to defend against existing vulnerabilities/shortcomings of how the current string parsing code was originally written in the ports code. **Why _tcsnlen?** _tcsnlen is part of the TCHAR family of functions and automatically maps to strnlen in ANSI builds and wcsnlen in Unicode builds. This makes the code portable and encoding-agnostic, reducing the risk of bugs when switching between character sets. It also avoids deprecated or banned APIs like lstrlen and lstrnlen, aligning with modern Windows development practices. **Why the DWORD cast is safe** In cases where a DWORD cast is used, all strings passed to _tcsnlen (e.g., szPortName, charBuffer, lptPortName) are short and bounded—typically device names or friendly names like "LPT1" or "ECP Printer Port (LPT1)". These strings are either constructed locally or retrieved from registry values with known size limits. The cast to DWORD is safe and intentional, and comments have been added in the code to document this reas...

---

**[58791383] USB WMI event telemetry such as overcurrent is no longer available**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13535989:** Adding telemetry for usbhub3 wmi events
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made The existing USBUI telemetry, for example, for overcurrent, is via SQM, which API appears to be deprecated and no-op. Also, these WMI events may not be even fired by the hub driver when the user has not logged in, which means the old SQM telemetry had already missed some potential reports. Furthermore, USBUI has very limited info such as the root hub name, which is not very useful in telemetry-based analysis. This PR adds new telemetry events to the USBHUB3 driver as the replacement and to log more details info to help us get more ideas about the USBUI scenarios and its potential usage. ## What changed Adding two telemetry events, one for root or internal hubs, and the other for external hubs. They include the hub vid/pid/rev (for non-root hubs), and/or the controller info (for root hubs). Both events can be filed with the field "IsWmiProviderEnabled" set to false to include potential reports when the user has not logged in. To avoid excessive telemetry reporting from the same port, the AggregateTlg API is used. ## How was the change tested Verified that the telemetry in KD.

  - **PR #14127637:** Change the USBHUB3 WMI telemetry to EbD for 2601
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made The following change has been monitored via CFRs for months and generating new telemetry events but without reporting regressions. It's time to make it EnabledByDefault. !13535989 [Sample Kusto Query](https://dataexplorer.azure.com/clusters/wdgeventstore/databases/Webster?query=H4sIAAAAAAAAA2VOPQvCMBDd%2FRVHJgsli7NLRXBQF1s6iJSYXOsNzUlyba3446120%2BHBg%2FdZknc8xA0H3PboJcLiBcMNA0LlTYsQxQSJA8kN1IFs4Mi16HKO6eKUfbArspXOg7G456Yh3%2BiypW%2BfmurwIegdHFmoJmuE2OfjHWENwuRlWTkj5qx%2BdXVJpnDs2tYEeiJY7iZzkoKbWeWwJ4sVuQSu43w3%2FVt5A0A6ZaThAAAA) ## What changed Changing to EnabledByDefault for 2601. ## How was the change tested bcz

---

**[59120105] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_hidi3ctest.dll!unknown_error_in_taef**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13763817:** [I3C] Remove I3C tests from bromine
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made I3C is not enabled-by-default on Bromine/BR, so all tests are failing. ## What changed Disabling all I3C tests ## How was the change tested Ran `buildtestpasses -q` locally

---

**[59124058] [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\control.cpp**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13479396:** [UMDF] EnabledByDefault - Align usermode-access (UMA) pattern with latest security practices
    **Repository:** os.2020

    **Description:**

    After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

---

**[59124059] [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\fdoio.cpp**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13479396:** [UMDF] EnabledByDefault - Align usermode-access (UMA) pattern with latest security practices
    **Repository:** os.2020

    **Description:**

    After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

---

**[59124060] [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\probe.c**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13479396:** [UMDF] EnabledByDefault - Align usermode-access (UMA) pattern with latest security practices
    **Repository:** os.2020

    **Description:**

    After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

---

**[59124062] [UMA] Usermode accesses found in onecore\drivers\input\hid\hidcore\hidclass\util.c**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13482278:** [UMDF] EnabledByDefault - Align usermode-access (UMA) pattern with latest security practices
    **Repository:** os.2020

    **Description:**

    After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Enabling by default for the upcoming 2510 feature

---

**[59142958] [I3C] WDFDEVICE & Queue handles in Target context are overwritten before ReleaseHardware of old PDO on re-enumeration**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13797910:** [I3C] Fix re-enumeration sequence
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made When a Target-driver requests re-enumeration of an I3C Target, there is no guarantee that ReleaseHardware for the existing PDO will be called before CreateAndInitializePdo is called for the new PDO, which will attempt to overwrite WDF handles in context that may be still in use by the existing WDFDEVICE. ## What changed This change: - Updates the Target class to maintain two WDFDEVICEs while re-enumeration is occurring; the primary one and the new one. - Removes PdoInitialized event from the state machine; release and prepare hardware are sufficient. ## How was the change tested - Added re-enumeration test case to HIDI3C and validated under verifier. - Validated non-reenumeration release/prepare disable/enable hardware case via device manager. - Ran i3chosttest. *For more information on the code review process, see the [Code Review Guidelines & Etiquette](https://aka.ms/codereviewguidelines).*

---

**[59176904] [I3C][WinI3C] Reset API**

- **Type:** Task
- **State:** Completed
- **Description:** 
- **Pull Requests:**
  - **PR #13852038:** [I3C][WinI3C] Reset API
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Supporting Target Reset via WinI3C ## What changed - Overlapped/Non-Overlapped APIs to Reset Target (`IOCTL_I3C_TARGET_RESET`) - Test collateral ## How was the change tested Ran `wini3ctargettest.dll` locally (with new tests)

---

**[59209656] [wdf] usbiotargettest.testmd: SharingMechanism StartupStatus not ready 2**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13808224:** [wdf] usbiotargettest.testmd: SharingMechanism StartupStatus not ready 2
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Seen failures in recent test runs when qarootbus devices weren't previously enumerated be preceeding tests. So, when the SanAndreas service is queried by usbiotarget test it fails, as the device isn't created until after the constructor. ## What changed Explicitly creating the `SharedStreamProvider` after qarootbus device is created; ensuring the sanandreas service is up ## How was the change tested Ran locally with sanandreas service previously delete to ensure repro condition.

---

**[59368848] [GE LT] Feature_SoftwareOffloadWithClientBuffers | 39615196: Ensure LT And GE branches are identical**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13784581:** [USBXHCI] Feature_SoftwareOffloadWithClientBuffers: Ensure LT And GE branches are identical
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Ensuring both LT and GE release branches are identical at AlwaysDisabled ## What changed Removed the alwaysDisabled branch token and replace with alwaysDisabledReleaseTokens ## How was the change tested Built locally usbxhci, featurestaging-usb.xml and featureEnablement tool without issues.

  - **PR #13797209:** [USBXHCI] Feature_SoftwareOffloadWithClientBuffers: Ensure LT And GE branches are identical
    **Repository:** os.2020

    **Description:**

    Cherry picked from !13784581 Cherry-picked from commit `df3746e5`. ## Why is this change being made Ensuring both LT and GE release branches are identical at AlwaysDisabled ## What changed Removed the alwaysDisabled branch token and replace with alwaysDisabledReleaseTokens ## How was the change tested Built locally usbxhci, featurestaging-usb.xml and featureEnablement tool without issues.

  - **PR #13847894:** [USBXHCI] Feature_SoftwareOffloadWithClientBuffers: Ensure LT And GE branches are identical
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made ## What changed ## How was the change tested *For more information on the code review process, see the [Code Review Guidelines & Etiquette](https://aka.ms/codereviewguidelines).* Cherry picked from !13784581 Cherry-picked from commit `df3746e5`. ## Why is this change being made Ensuring both LT and GE release branches are identical at AlwaysDisabled. The change is already in GE_CURRENT which will flow to the LT_RELEASE_SVC_*, but there is a request to bring this into this 10B branch specifically. ## What changed Removed the alwaysDisabled branch token and replace with alwaysDisabledReleaseTokens ## How was the change tested Built locally usbxhci, featurestaging-usb.xml and featureEnablement tool without issues. Cherry picked from !13797209 Cherry-picked from commit `93294703`.

---

**[59388824] [USB][Test] Add USB Wake Test for testing controller sleep/wake scenarios**

- **Type:** Task
- **State:** Completed
- **Description:** 
- **Pull Requests:**
  - **PR #12899153:** [USB3][Test] USB3 Wake Test
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Adding stress test to exercise sleep/wake path of XHCI hardware, monitoring XHCI removals, resets or failure to re-enumerate devices. ## What changed Setup: XHCI -> Hub -> SuperMUTT Testing steps for a search range of `[StartIdleTimeInMs, StartIdleTimeInMs + RangeInMs]`, incrementing each search by a random value. 1. Wait for 20 seconds for XHCI to idle 2. Send SuperMUTT to reconnect after X ms 3. Wait for X ms + 20 seconds for SuperMUTT to reconnect 4. Send control transfer to SuperMUTT to confirm SuperMUTT is available ## How was the change tested Tested with appverifier enabled on te.processhost.exe Validated WinUSB MUTT tests locally, no regressions during TestClassSetup using calls to `GetParentXhciControllerDeviceId`

---

**[59689131] [wini3c][test] Timeout during ResetOverlapped::ResetWithCccDefiningByte**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13956186:** [wini3c][test] Timeout during ResetOverlapped::ResetWithCccDefiningByte
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Recent lab test run failed due to timeout. This is likely due to the short timeout (and long time running on the VM), rather than a regression (particularly since we've never seen this before) ## What changed Increasing timeout from 1sec to 5sec.

---

**[59692400] [I3C] Enable on Intel NVL**

- **Type:** Task
- **State:** Completed
- **Description:** 
- **Pull Requests:**
  - **PR #13923614:** [I3C] Add Intel NVL support
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Opts Intel NVL I3C HC into I3C. ## What changed Adds same hack flags for NVL as PTL - Intel has confirmed that the I3C IP is expected to be identical. ## How was the change tested Non-functional change.

---

**[59816561] [RI-TP] Failed SpbTarget::Sequence: SUCCEEDED(VirtualHostControllerDevice::CreateAndInitializeAcpi(hcis, acpiAsl, hcd)) - Value (0x80070102)**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #14007667:** [I3C][Test] Enable logging in winsim for Spb ACPI test
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made From recent test failure, it looks like ACPISim is the culprit, but need to add more logging to understand where it's failing. If/when this fails again, we'll have more traces to start narrowing down the problem. ## What changed Increase diagnostics to level-5 and added missing TraceLogging enablement. ## How was the change tested Ran test (instrumented with error in winsim) and validated lines are in output trace

---

**[59832815] [USB4] InterdomainRxRing Consumer Index is incorrectly initialized leading to blocked P2P file transfers**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #13994558:** USB4 P2P RxRing Consumer Index fix.
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made The InterdomainRxRing programs the correct starting configuration index into hardware (m_size-1 => 4095) but then operates on a local copy of the index that is initialized to 0. This means that it starts evaluating the ring at index 1 instead of index 0 -- it evaluates ((index+1)%m_size). If the descriptor at index 1 is not done yet, then the local index is re-synchronized with hardware and back to the correct starting index (4095). However if the descriptor at index 1 is already done (DD=1) it will overwrite the hardware index and leave an unconsumed descriptor on the ring at index 0. This wedges the ring when it eventually rolls over in the case of a large file transfer. ## What changed Store the correct starting index in the InterdomainRxRing cache before starting the ring. ## How was the change tested [x] Sent to QC for verification on the impacted Mac<-->8480/8380 configs. - 8480-Mac - 8380-Mac - 8480-8380 - 8480-Intel [x] Sent to Intel for evaluation on their perf-sensitive P2P scenarios (the bug came through a P2P perf improvement change they proposed to us). Signed off on technical evaluation of the fix, as well as compat/perf validation. [x] Local file transfer on non-QC hosts: Enabled and Disabled dispositions with large bi-directional file transfers.

---

**[59907326] [SuperMITT] Add HIDI3C Mouse and Keyboard Support**

- **Type:** Task
- **State:** Completed
- **Description:** 
- **Pull Requests:**
  - **PR #14042644:** [SuperMITT] Add HIDI3C Keyboard and Mouse tests
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made For the demo and partner validation, we needed an example of using the SuperMITT as a HIDI3C mouse and keyboard. ## What changed - Added descriptors for HIDI3C mouse and keyboard - Added the ability to send a finite number of input notifications from the SuperMITT - Updated the SuperMITT FPGA to add support + fix bugs ## How was the change tested Ran all tests on Intel RVP and passed *For more information on the code review process, see the [Code Review Guidelines & Etiquette](https://aka.ms/codereviewguidelines).*

---

**[59963386] [WDF][HLK] Update WdfFuncTableChecks for v35 release**

- **Type:** Task
- **State:** Completed
- **Description:** 
- **Pull Requests:**
  - **PR #14085958:** [WDF][HLK] Update WdfFuncTableChecks for v35 release
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made This is a recurring task that need be done for each new version of WDF. Withthout the change, a WDF driver targeting v35 will fail HLK test `WdfFuncTableChecks`. ## What changed Update WdfFuncTableChecks tool to check for version 35 of WDF - KMDF v35 remains the same as v33 for function table count: 458 - UMDF v35 adds several more functions than v33, and the count is: 287 However, until we're ready to allow V35 drivers to ship and certify, this test should continue to fail. With one exception: WudfRd.sys which is reported by customer as blocking their HLK system submission, and that should be allowed to pass. ## How was the change tested - Build clean locally - Test inbox v35 driver successfully > te CheckWdfFunctionTable.dll /name:*WdfFuncTableCheckSizeWithFilePath /p:QueryDriverFilePath=C:\Windows\System32\drivers\WUDFRd.sys > C:\Windows\System32\drivers\\**WUDFRd.sys** : Version 1.35 TableCount 458 - **Valid** KMDF driver > (copy WUDFRd.sys to test.sys, run the test again) > Error: .\\**test.sys** : Version 1.35 TableCount 458 - **Invalid** KMDF driver > Error: C:\Windows\System32\drivers\UMDF\\**netadaptercxum.dll** : Version 2.35 TableCount 287 - **Invalid** UMDF driver


## Sensors Component

**[54529555] [Huaqin][Lenovo][GHD][Altai][8340]The brightness can't be control by hotkey and OSD,but can change in OS setting. FR:1/200 UUts**

- **Type:** Bug
- **State:** Closed
- **Description:** 
- **Pull Requests:**
  - **PR #12177944:** [Sensors][DES] Add function to update settings group when brightness capabilities are updated.
    **Repository:** os.2020

    **Description:**

    ## Why is this change being made Partners are reporting that brightness change hotkeys/OSD are not being recognized (repro 1/200). Though settings page can change the brightness. From the logs: DES is receiving notifications about brightness level change through DePowerGuidShim. DePowerGuidShim does not have a settingsGroup added to its interface to affect the brightness change. SettingsGroup object should be registered in the DePowerGuidShim upon devicearrival for all internal monitors which support brightness through NITs or Percentage. (this monitor is reported to be). Additionally, this settingsGroup is only removed upon monitor removal. From discussion with Display team. We believe this is a race condition between the monitor device arrival and the brightness interface device arrival. DES can enumerate a monitor device that hasn't received its brightness capabilities. For internal monitors there is no registration for this arrival. Furthermore in the dump we saw that the brightness caps were populated. This is because the device can be re-enumerated through a disable/enable or hibernate. Renumeration will cause the monitoradapter to refresh its caps. It will not refresh the monitoradapterinterface_Id nor notify the DeManagerObjectLifetimeManager.cpp which could trigger hotkey registration. ## What changed - Added function to update settings group if the monitor group has detected a refresh of brightness caps - Added unit tests to test functionality. Unit test logic: Enumerate monitor with `ConnectioKind::Internal` and `BrightSupportType::None` Verify 1: that settingsGroup is not added upon device arrival Verify 2: SettingsGroup is added when brightness change WNF is injected, and `BrightSupportType::None` --> `BrightSupportType::NITs` Verify 3: SettingsGroup is not added when further brightness change WNF is injected, and `BrightSupportType::NITS` --> `BrightSupportType::NONE` ## How was the change tested - [X] DeManagerUnit Tests Passing `Microsoft.Windows....


## Technical Highlights

**Major Features Implemented:**
- No major features with PRs in this iteration

**Critical Bugs Fixed:**
- [54529555] [Huaqin][Lenovo][GHD][Altai][8340]The brightness can't be control by hotkey and OSD,but can change in OS setting. FR:1/200 UUts
- [56414704] [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pullrequestloop.c
- [56414705] [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\readreportloop.c
- [57292515] [I3C] Get status IOCTL does not fail when target returns incomplete payload
- [57420817] [PTL][PPV] Innodisk USB thumb drive prevent system to enter pkg c-states (implement a SW workaround for Intel Pantherlake systems to enter package C-State when a USB SS device is attached)
- [57544549] UcmCx to skip USB host stack loading when port partner claims not usb communication capable
- [57909081] [I3C] MmTransportPioTx can be torn down before SM processes deinitialize event
- [58050338] [I3C] IBI DPC not guaranteed to have completed before StopHostControllerInstance() returns
- [58547489] [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pdo.c
- [58791383] USB WMI event telemetry such as overcurrent is no longer available  
- [59120105] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_hidi3ctest.dll!unknown_error_in_taef
- [59124058] [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\control.cpp
- [59124059] [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\fdoio.cpp
- [59124060] [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\probe.c
- [59124062] [UMA] Usermode accesses found in onecore\drivers\input\hid\hidcore\hidclass\util.c
- [59142958] [I3C] WDFDEVICE & Queue handles in Target context are overwritten before ReleaseHardware of old PDO on re-enumeration
- [59209656] [wdf] usbiotargettest.testmd: SharingMechanism StartupStatus not ready 2
- [59368848] [GE LT] Feature_SoftwareOffloadWithClientBuffers | 39615196: Ensure LT And GE branches are identical
- [59689131] [wini3c][test] Timeout during ResetOverlapped::ResetWithCccDefiningByte
- [59816561] [RI-TP] Failed SpbTarget::Sequence: SUCCEEDED(VirtualHostControllerDevice::CreateAndInitializeAcpi(hcis, acpiAsl, hcd)) - Value (0x80070102)
- [59832815] [USB4] InterdomainRxRing Consumer Index is incorrectly initialized leading to blocked P2P file transfers

## Pull Request Summary

- Total PRs merged: 48
- Most active repositories:
  - : 48 PRs

## Notes

This summary was automatically generated from Azure DevOps work item data.
Please review and enhance with additional context as needed.

---
*Generated on 2025-11-14 19:47:00*