# What's New in Buses & Sensors - 2510

## Overview

This release includes 876 improvements to Windows connectivity and sensor capabilities, focusing on enhanced reliability, performance, and user experience.

## New Features

No new features in this release.

## Improvements

- !analyze - Bugcheck 0x15F - CONNECTED_STANDBY_WATCHDOG_TIMEOUT_LIVEDUMP - Blames USB4/Tunnel in Nickel and GE+CD branches
- [USB][Camera] Productize eUSB2 Double-Isoch changes
- Support resizing states
- [1] [Recovery] Invoke PLDR / FLDR on device crash
- [1] [UMDF DMA] Require ProcessSharingDisabled
- [VisioPluginForSmfx] Match colors/fonts closer to MagicDraw (for readability and transition ease)
- USB4 Bugfixes for 2510
- [I3C] HostController must remain in D0 while Target has non-IBI transfers pending
- [I3C][WinI3C] Reset API
- [USB][Test] Add USB Wake Test for testing controller sleep/wake scenarios
- [I3C] Enable on Intel NVL
- [SuperMITT] Add HIDI3C Mouse and Keyboard Support
- [Windows Desktop Readiness] meeting 10/23 AI :  investigation of new measures for USB
- [WDF][HLK] Update WdfFuncTableChecks for v35 release

## Bug Fixes

### [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0304_REV_0000_FW_300A

Resolved an issue affecting system reliability.

### [USB4] [AMD] Lockheed System hangs for ~10 seconds when unplugging a USB4 hub

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_15db_REV_0002

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ee_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a0ed_REV_0020

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43d5_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ee_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_51ed_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e5_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43d5_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e0_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13400

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1033_DEV_0194_REV_0004_FW_3034

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ee_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ec_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_149c_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_190826703940

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43bc_REV_0002

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43d1_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e0_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13400

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15d7_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15d7_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1912_DEV_0015_REV_0002

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_RESET_RECOVERY_STOP_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ec_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a2af_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1912_DEV_0014_REV_0003

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1042_REV_0000_FW_110930000253

Resolved an issue affecting system reliability.

### [Watson Failure] caused by HEAP_CORRUPTION_c0000005_WUDFHost.exe!heap_corruption

Resolved an issue affecting system reliability.

### [Watson Failure] caused by HEAP_CORRUPTION_c0000374_WUDFHost.exe!unknown_error_in_process

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x10D_4_ucx01000!Urb_LegacyTransferUrbCompletion

Resolved an issue affecting system reliability.

### HP AMD USB4 High Priority bug - USB4 Domain does not power down due to PCIe root port's power dependency on USB4 

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f7_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_7a60_REV_0011

Resolved an issue affecting system reliability.

### VIA: Custom CL2 Validation Binaries

Resolved an issue affecting system reliability.

### [usbxhci] Device disable taking longer than 10mins, causing driver-verifier violation

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1912_DEV_0014_REV_0003

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15c0_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15c1_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b6f_DEV_7023_REV_0001_FW_206004F3

Resolved an issue affecting system reliability.

### Request for Razer team to provide USB4 HLK logs on SV2 HLK

Resolved an issue affecting system reliability.

### [SC8380 WD 1.0]: (LoadLibrary fails) YB is observed in device manager for Secure ISP driver with Camitto reboot scenario.

Resolved an issue affecting system reliability.

### [Watson Failure] caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_SensorsApi.dll!Windows::Internal::GitPtrImpl_Windows::Internal::GitPtr_::Initialize_ISensorEvents_

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1b6f_DEV_7023_REV_0001_FW_206004F3

Resolved an issue affecting system reliability.

### [Samsung][24H2][Sensor] Rotation lock button is disappeared and SensorPresent registry value is changed to '0'

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!unknown_function_VEN_1022_DEV_1639_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0D09_REV_0000_FW_330A

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_0C27_PID_CCDA_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_R_(null)_USBXHCI!Control_WdfEvtIoDefault

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0xCE_IMAGE_ufx01000.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!unknown_function_VEN_1022_DEV_149C_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure] caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_I3cEndToEndTest.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_R_(null)_ucx01000!Urb_ValidatePipeHandle

Resolved an issue affecting system reliability.

### [Watson Failure] caused by WRONG_SYMBOLS_ARM64_10.0.25131.1000.arm64fre.rs_prerelease.220527-1351_TIMESTAMP_590920-184823_A8C259F7_nt_wrong_symbols!A8C259F7103F000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_HOST_SYSTEM_ERROR_USBXHCI!unknown_function_VEN_1022_DEV_43F7_REV_01

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!unknown_function_VEN_1022_DEV_43EE_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!unknown_function_VEN_1022_DEV_1639_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_UsbHub3!unknown_function

Resolved an issue affecting system reliability.

### [I3C] Performance timing throughput lower than expected on AMD Read

Resolved an issue affecting system reliability.

### [Huaqin][Lenovo][GHD][Altai][8340]The brightness can't be control by hotkey and OSD,but can change in OS setting. FR:1/200 UUts

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Partners are reporting that brightness change hotkeys/OSD are not being recognized (repro 1/200). Though settings...

### [Watson Failure] caused by CORRUPT_MODULELIST_INVALID_HANDLE_c0000008_WUDFHost.exe!unknown_error_in_process

Resolved an issue affecting system reliability.

### [Watson Failure] caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!wil::details_abi::RawUsageIndex::RecordUsageInternal

Resolved an issue affecting system reliability.

### [Watson Failure] caused by ACCESS_VIOLATION_1007_Windows.Devices.Sensors.dll!ViewPositionTracker::UnregisterFromDisplayRegionChanges

Resolved an issue affecting system reliability.

### [Watson Failure] caused by INVALID_EXCEPTION_HANDLER_c00001a5_SensorsNativeApi.V2.dll!Unloaded

Resolved an issue affecting system reliability.

### LENOVO:24H2:PUSH BUTTON RESET: "Turn off my screen when I leave" turned OFF after OS Refresh

Resolved an issue affecting system reliability.

### [Lenovo][Aladdin][24H2][HPD][dimming]Adaptive dimming lose function after resume from S4/S5 if set timeout value is “never“ in  system power setting.(FR:3/3units;6/6cycles)

Resolved an issue affecting system reliability.

### [Watson Failure] caused by ACCESS_VIOLATION_c0000005_WUDFx02000.dll!FxObjectHandleGetPtr

Resolved an issue affecting system reliability.

### [Watson Failure] caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_SensorService.HumanPresenceExtensionManager.FuncTests.dll!Unknown

Resolved an issue affecting system reliability.

### Stuck in portrait mode. Sensor not respoding and rotation lock is greyed out in Quick Settings

Resolved an issue affecting system reliability.

### [HP][Win11 24H2]:HPD sensor items in "screen ,sleep&hibernate timeouts" automatically became off after did Reset(keep my file).(ARM)

Resolved an issue affecting system reliability.

### [Lenovo][24H2][Sensors][LCFC][T14/P14S AMD]The screen will turn off directly without dimming process when "Turn off my screen when I leave" is set to 2 minutes and move away from the unit for 140cm(HPD vendor debug it is OS issue).(FR:2/2 units,3/8 trials

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_W_(null)_ucx01000!UrbHandler_USBPORTStyle_Legacy_IsochTransfer

Resolved an issue affecting system reliability.

### [Hardware Confirmator]The brightness should not increase or decrease accordingly, while trying to change the brightness the slider is at the initial point

Resolved an issue affecting system reliability.

### [Dell][Renegade_ARL][Win11_24H2] WD19TBS update NVM FW fail (error code 0x229).

Resolved an issue affecting system reliability.

### [I3C] Targets that hot-join should recycle dynamic addresses

Resolved an issue affecting system reliability.

### USB ports have incorrect configuration in ACPI

Resolved an issue affecting system reliability.

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

### [Watson Failure] caused by HEAP_CORRUPTION_ACTIONABLE_Generic_c0000374_WUDFHost.exe!unknown_error_in_process

Resolved an issue affecting system reliability.

### [Lenovo Y5x0][LCFC][ARL-HX][RVP][B0] [24H2] XHCI PME_sts bit not be cleared after plug in/out USB keyboard several times in windows and lead system will be auto waked when enter into S3.

Resolved an issue affecting system reliability.

### [UMDF-WIFICX][FeatureGap][Intel][WIN11][NetAdapter] Secondary bus reset

Resolved an issue affecting system reliability.

### [WIN11][NetAdapter][UMDF] Process dump - No driver logs

Resolved an issue affecting system reliability.

### [HLK][Feedback] Questions on Device.DevFund.DriverFramework.UMDF.DMA

Resolved an issue affecting system reliability.

### [WinVOS][WinVOSFull]Failed LightSensorTests::ThresholdProperties: AreEqual(sensor->ReportThreshold->Chromaticity.X, chromaticityThreshold.X) - Values (0.000000l, 1.234500l)

Resolved an issue affecting system reliability.

### Glymur BU | CRD | Device fails to wake up from sleep mode when using the built-in keyboard or trackpad

Resolved an issue affecting system reliability.

### [Diomedes] USB3/USB4 controllers (and a total of 27 devices) are being marked as non cache coherent leading to correctness/functionality/performance issues on N1X

Resolved an issue affecting system reliability.

### [Watson Failure] caused by DELPHI_EXCEPTION_eedfade_Toast.exe!unknown_error_in_process

Resolved an issue affecting system reliability.

### 8480_0x0_SNPE - QC controller timed out responding to stop endpoint command

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_NULL_IP_Wdf01000!FxPkgPnp::m_WdfPowerStates

Resolved an issue affecting system reliability.

### [Glymur][SS IOP] [Intermittent] 0x133_SINGLE_DPC_WATCHDOG_TIMEOUT 

Resolved an issue affecting system reliability.

### [Watson Failure] caused by APPLICATION_HANG_c0000194_sensrsvc.dll!unknown_error_in_service

Resolved an issue affecting system reliability.

### [Dell][Wistron][DiabloARL] BSOD WDF_VIOLATION (10d) occur while run S4 stress (IMAGE_NAME:  USBXHCI.SYS)

Resolved an issue affecting system reliability.

### [MSFT I3C HCI Driver][STRIX1 I3C][v5] Observed error for GetStatus and ReducedTransferSpeed SuperMITT tests while running all test in sequence  and error is pointing to frequency is greater than expected frequency (SWDEV-526100)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsApi.dll!CSensorV2::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Dell][Wistron][DiabloARL] BSOD SYSTEM_THREAD_EXCEPTION_NOT_HANDLED (7e) occur when system run S4 sresss with connecting dock SD25TB4 (IMAGE_NAME:  USBXHCI.SYS)

Resolved an issue affecting system reliability.

### [Lenovo][LCFC][Alloy_Intel_LNL][ThinkPad X9-14]The system display will appear the process of dimming after set to '30s' in Then, turn off my screen after this amount of time option

Resolved an issue affecting system reliability.

### [AMD][SHP_SP6][HLK][WIN10]System HLK test "USB Type-C UCM Disable Enable Test" failed due to parameters setting screen not displayed.

Resolved an issue affecting system reliability.

### [I3C] Get status IOCTL does not fail when target returns incomplete payload

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? After implementing short read error behavior, we needed to update the ReadOverrideStopDuringEnumeration test to m...

### [PTL][PPV] Innodisk USB thumb drive prevent system to enter pkg c-states (implement a SW workaround for Intel Pantherlake systems to enter package C-State when a USB SS device is attached)

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Intel reported that on Panther Lake XHCI controllers, on idle of all SuperSpeed devices, an additional Stop Endpo...

### [Compat][Se][BT Speaker]: When connected to Bluetooth device and switching between audio outputs, Audio freezes for a while and resumes after some time

Resolved an issue affecting system reliability.

### [KRK2][GNB][Security] Dual camera can't be supported during enrolling facial recognition (Windows Hello) . (SWDEV-531244)

Resolved an issue affecting system reliability.

### UcmCx to skip USB host stack loading when port partner claims not usb communication capable

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Code review and telemetry analysis found two issues in UcmCx!UpdateUrsState. 1. Though no real A/Vs have been fou...
- ## Why is this change being made? Most USB-C PD chargers are SRC/DFP only. Qualcomm 8480 system comes with a charger that supports DRD but doesn't ...
- ## Why is this change being made? The following two changes in UcmCx have been monitored via CFRs for over two months without getting regression re...
- Cherry picked from !13414499 ## Why is this change being made? Code review and telemetry analysis found two issues in UcmCx!UpdateUrsState. 1. Thou...

### [Glymur][USB4 IOP][Cert][Topology-54][P1, P2, P3] Observed ping communication failure while transferring files from DUT to MAC

Resolved an issue affecting system reliability.

### [Diomedes] DPC Timeout (0x133) bugcheck from nvasd.sys driver

Resolved an issue affecting system reliability.

### [Diomedes] 0x7e bugcheck in XHCI filter driver during boot with DP Alt-Mode and USB3 connected to system

Resolved an issue affecting system reliability.

### [Watson Failure] caused by SVCHOSTGROUP_Camera_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsNativeApi.V2.dll!_dynamic_initializer_for__g_HistorySubscriberList__

Resolved an issue affecting system reliability.

### [I3C] MmTransportPioTx can be torn down before SM processes deinitialize event

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Currently, both `MmTransportPioTx`/`MmTransportPioRx` can be destroyed before the DeInitialize event is processed...

### [Watson Failure] caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_IMAGE_serenum.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.H_EC._Q79_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_USBXHCI!UsbDevice_UcxEvtReset

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_R_iaLPSS2i_I2C!ControllerDoRead

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x9F_3_epbmtusb_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_R_USBXHCI!RootHub_DetectPortInComplianceMode

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_0483_PID_A0CB_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_R_(null)_ucx01000!McGenControlCallbackV2

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x9F_3_athurx_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_8d31_REV_0005

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1033_DEV_0194_REV_0003

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_R_(null)_Wdf01000!FxEventQueue::EventQueueWorker

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_RESET_RECOVERY_RESTART_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_NVDA_DEV_8000_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!unknown_function_VEN_1912_DEV_0014_REV_03

Resolved an issue affecting system reliability.

### [Watson Failure] caused by ACCESS_VIOLATION_c0000005_SensorsNativeApi.V2.dll!Sensors::SimpleDeviceOrientationRpcClient::MemberThreadCallback

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_R_(null)_usbccgp.sys!Unloaded

Resolved an issue affecting system reliability.

### [I3C] IBI DPC not guaranteed to have completed before StopHostControllerInstance() returns

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? `StopHostControllerInstance()` must ensure that the IBI DPC has completed before it returns; otherwise IBI DPC th...

### [Watson Failure] caused by 0xE6_26_i8042prt!I8xReadPortUchar

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.EC0._Q0B_ACPI_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0xFC_HIDCLASS!WPP_1f4ed73904893c554f67e96aacd5f52a_Traceguids

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x9F_3_POWER_DOWN_WDF_WAIT_TIMEOUT_BatteryLow_IMAGE_HID_PCI

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.ECDV.TMEM._TMP_ACPI_BatteryCritical_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x9F_3_AML!_SB.AWAC._STA_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x133_ISR_HIDPARSE!HidP_GetCollectionDescription

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_150707300222

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x133_ISR_USBXHCI!Controller_UpdateIdleTimeoutOnControllerFDOD0Entry

Resolved an issue affecting system reliability.

### [Watson Failure] caused by BREAKPOINT_AVRF_80000003_SensorsNativeApi.V2.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure] caused by BREAKPOINT_AVRF_80000003_SensorsV2Clx.E2E.Tests.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x3B_C000001D_WUDFRd!RdFdoDevice::RdIoReply

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_SynTP_Wdf01000!FxRequestBase::_FxRequestBase

Resolved an issue affecting system reliability.

### [Watson Failure] caused by AV_BTHport!SmFx::StateMachineEngine::StateMachineEngineImpl::Deinitialize

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_046A_PID_0704_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x133_DPC_USBXHCI_Wdf01000!FxObject::ClearEvtCallbacks

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x139_0_LEGACY_GS_VIOLATION_mouhid!MouHid_ReadComplete

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_05C8_PID_0831_IMAGE_usbccgp.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x133_ISR_UsbHub3!wil_details_EvaluateFeatureDependencies

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x133_DPC_usbehci!EHCI_InterruptService

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x133_ISR_UcmUcsiAcpiClient!UcmUcsiAcpiClient::Ppm::QueryConnectorsAndInitCollection

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x133_DPC_USBXHCI!RootHub_UcxEvtGetPortStatus

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_0990_IMAGE_usbccgp.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x7E_C000001D_BAD_IP_hidusb!HumPnP

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x9F_4_USB_rtux64w7_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by LKD_0x144_BOOT_DEVICE_FAILED_UsbHub3!HUBMISC_BugcheckSystemOnBootDeviceEnumerationFailure_VID_AA55_PID_0610_REV_6052

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0xFE_BAD_SIGNATURE_USBPORT!USBPORT_TxCsqAcquireLock

Resolved an issue affecting system reliability.

### [Diomedes] CAS leading to xHCI YB error

Resolved an issue affecting system reliability.

### [Watson Failure] caused by INVALID_PARAMETER_c000000d_SensorsNativeApi.V2.dll!PnpManagerBase::Teardown

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.EC0.SEN2._TMP_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x133_DPC_1394ohci!IoWorkers::RemoveIoWorkerFromTransmitList

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_W_(null)_USBXHCI!Controller_RaiseAndTrackIrql

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_WUDFRd!WdfLpc::ValidateReplyMessage

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0xE6_26_VenId0x8086_DevId0x15EC_USBXHCI!Interrupter_WdfEvtInterruptIsr

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0x9F_3_Nau88L24Rvp_Wdf01000!FxWakeInterruptMachine::Dx

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_ISH!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure] caused by 0xFC_usbccgp!_string_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_RtkBtfilter_BatteryLow_ExcessiveThreadsWaitingForPageIn_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_151b_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_9ded_REV_0011

Resolved an issue affecting system reliability.

### [HP][CashmereI][Win11][25H2] The HPD default settings are different between 24H2 and 25H2.

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_Wdf01000!FxIoQueue::ProcessPowerEvents

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_IDLE_THREAD_ucx01000!UCX_LockBufferPagesInUrbForDMA

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_15D2_SUBSYS_8438103C_REV_02_IMAGE_WUDFRd.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_LKD_Bluetooth_rtkfilter.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_mouclass!MouseClassCreateWaitWakeIrpWorker

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_WDF_WAIT_TIMEOUT_BatteryCritical_IMAGE_SurfacePowerMeterDriver.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_ControlLib.dll!destroy_ptd_array

Resolved an issue affecting system reliability.

### [Diomedes][From Jade][N1X][Camera] Calling the WinRT sensor API during ADK testing takes a long time.

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_41E4_PID_2101_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000

Resolved an issue affecting system reliability.

### [I3C] Pended Async reads to HID target can be completed before a read transfer occurs

Resolved an issue affecting system reliability.

### [Diomedes][DIS][MTK 5386532] No USB4 and USB3 enumeration on system boot with USB4 dock connected

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_HIDCLASS!HidpFdoSendIdleIrpWorker

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_04D9_PID_A01C_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [HP][HDE][CashmereQ][8480] The HPD function cannot be modify via Windows settings.

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_USB3_WER_BUGCODE_USBXHCI_BAD_SLOTID_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_150319300201

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_Orphaned_CriticalSection_c0000194_SensorsNativeApi.V2.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_ExcessiveThreadsWaitingForPageIn_UsbHub3!HUBMISC_WaitForSignal

Resolved an issue affecting system reliability.

### [Thinkpad][Lenovo][Curie-2][Win11_24H2]:SUT show BSOD when plug AC into TBT5 port with external monitor connected via HDMI directly/type-c to DP dongle.(FR:4/5 units, 4/25 cycles)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!unknown_function_VEN_1022_DEV_15B6_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_BTHUSB_Wdf01000!FxPowerIdleMachine::ProcessEventLocked

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxIoQueue::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_ab8902b4-09ca-4bb6-b78d-a8f59079a8d5_c0000005_IntelControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x3D_C0000005_i8042prt!I8xGetBytePolled

Resolved an issue affecting system reliability.

### [HP][HDE][CashmereQ][QC 8480][27871 build][25H2]How to implement with "System do not rotate but keep Accel is reporting to OS on clamshell form factor unit"

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_UcmUcsiCx!SmFx::StateMachineEngine::StateMachineEngineImpl::EnqueueEventWithDisposition

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_241022B80001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_LEqdUsb!DjChildIdleRequestCancel

Resolved an issue affecting system reliability.

### [Acer][OEMQ] Multi-person detection: DUT misidentifies onlooker as main user after main user leaves, leading to privacy concern

Resolved an issue affecting system reliability.

### [Acer][OEMQ] Multi-person detection: Privacy concern due to lack of dimming/notification for sideways peeking (as per current design) 

Resolved an issue affecting system reliability.

### [Acer][OEMQ] Multi-person detection: The Dismiss button is ineffective

Resolved an issue affecting system reliability.

### [Acer][OEMQ] Multi-person detection: No notification triggered when a third person peeks

Resolved an issue affecting system reliability.

### [HP][Machu16W][Win11][24H2] Hot-plugging the dock does not display the Slow Charger icon.

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_19041.1.amd64fre.vb_release.191206-1406_TIMESTAMP_760316-225129_C7C5BBF1_nt_wrong_symbols!C7C5BBF11046000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_BatteryLow_IMAGE_ISH.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_AML!_SB.PCI0.LPCB.H_EC.BAT0._BST_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_80000003_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::Transition::TransitionTableImpl::TransitionTableImpl

Resolved an issue affecting system reliability.

### [Diomedes] [MTK 5426316]USB3: Halted bit is not set when resuming from low power state leading to yellow bang error/bugcheck on DIS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFPlatform.dll!WdfObjectList_WudfLpcMessage,WudfLpcMessageParameters_::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_i8042prt!I8xReadPortUchar

Resolved an issue affecting system reliability.

### [WPG][Desktop][TestReady] - BootMemBrowserLaunch (Improvement) | -176 KB in Metric: ReferenceSet | ge_current_directwinpd_flt.26459.1000.20250725-1800

Resolved an issue affecting system reliability.

### [Dell] [Cinnamon Bay MLK 16] Prec. 7680 + WD19DC(S) - dock USB LAN not detected in OS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_WUDFRd!WdfLpcCorePortInterface::DeletePort

Resolved an issue affecting system reliability.

### [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pdo.c

Resolved an issue affecting system reliability.

**Fix details:** 
- After Internal+External experiments, no additional Watson failures have been reported related to this issue. Additional metrics also look good. Ena...

### [Watson Failure]: Crash caused by STACK_OVERFLOW_800700a4_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcClient::DeManagementRpcClientImpl::GetIsBrightnessCapable

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!unknown_function_VEN_8086_DEV_A71E_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xFC_Wdf01000!__ImageBase

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsApi.dll!Microsoft::WRL::ComPtr_IUnknown_::InternalRelease

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_8086_DEV_7A60_REV_11

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_BatteryLow_ExcessiveReadyThreads_ProcessorThrottled_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!TelemetryData_CreateReport_VEN_15ad_DEV_0779_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalService_ACCESS_VIOLATION_c0000005_WppRecorderUM.dll!WppAutoLogTrace

Resolved an issue affecting system reliability.

### [Diomedes][NPF][EEAP | General | Feedback] [WHCP] System.Fundamentals.SystemUSB.USB4.AllTypeCPortsSupportUSB4

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_10DE_DEV_1ADA_REV_A1

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3042_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_161f_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_HOST_SYSTEM_ERROR_USBXHCI!unknown_function_VEN_8086_DEV_1E31_REV_04

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_IMAGE_qcspi8280.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.LPCB.EC0.BAT0._BST_ACPI_ExcessiveReadyThreads_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [RI-TP] Failed NotificationSettingsTests::CheckRegisteredSystemProviders: IsTrue(IsInList( k_RegisteredSystemApplications, ARRAYSIZE(k_RegisteredSystemApplications), subKeyName)): Windows.SystemToast.PresenceSensing.OnlookerDetection

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b6f_DEV_7023_REV_0001_FW_1000020

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x13a_11_UsbC_usbccgp!DispatchPdoUrb

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_HIDCLASS!HidpFdoAllocCollectionResources

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_IntelControlLib.dll!CTL_API::_dynamic_initializer_for__WhitelistedApps__

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_19D1_PID_0001_MI_02_IMAGE_usbser.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x35_HIDCLASS!HidpFdoSendDxIrp

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!ViewPositionChangeNotificationInternal::_ViewPositionChangeNotificationInternal

Resolved an issue affecting system reliability.

### [Lenovo][Think][25H2][Onlooker Detection][Presence Sensing] There is no option available for the "Onlooker Detection" feature under Presence Sensing settings page

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3142_REV_0000_FW_230426702040

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_W_(null)_ucx01000!RootHub_Pdo_EvtInternalDeviceControlIrpPreprocessCallback

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1E_C000001D_BAD_IP_USBXHCI!Bulk_MapTransfers

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_5781_SUBSYS_00008086_REV_84_USB4_MS_CM_IMAGE_Usb4HostRouter.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PC00.RP05.PCRP._OFF_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_5782_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_pmdrvs!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_UcmUcsiCx!UcmUcsiCx::CommandHandler::PpmNotificationReceived

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xFC_UsbHub3!Feature_BPT_CD_BugFixes_2507__private_featureState__PERF__

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.26445.1001.amd64fre.ge_current_directmb2_ens.250704-1100_TIMESTAMP_930605-024533_E8291C4D_nt_wrong_symbols!E8291C4D1451000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by IN_PAGE_ERROR_c0000185_c0000006_WudfPlatform.dll!_string_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_sixaxis_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_IMAGE_WUDFRd.sys_USB_VID_17E9_PID_6006_MI_00

Resolved an issue affecting system reliability.

### USB WMI event telemetry such as overcurrent is no longer available  

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? The existing USBUI telemetry, for example, for overcurrent, is via SQM, which API appears to be deprecated and no...
- ## Why is this change being made? The following change has been monitored via CFRs for months and generating new telemetry events but without repor...

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_367B_PID_1919_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxUsbInterface::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_FAULT_c0000194_WinRTSensors.FuncTests.CppCx.dll!unknown_error_in_taef

Resolved an issue affecting system reliability.

### [Eco_SR][HLK][CG25][Framework][Lotus+GN22][Win11][24H2_26100] HLK Test failed on USB Secure Camera Controller Dual BDF Test - Compat

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_QueryRemoveRelatedDevice_LKD_System_gscheci.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait

Resolved an issue affecting system reliability.

### [N1x][Yukon][USB-IF Cert] "Generic USB Hub" of "Satechi Thunderbolt 4 Slim Hub" fails enumeration with Code 43 "Unknown USB Device (Device Descriptor Request Failed)" when TBT3 monitor is connected do

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_HPCustomCapDriver_Wdf01000!FxIFR

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3537_PID_1053_IG_01_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CLR_EXCEPTION_System.ComponentModel.Win32Exception_80004005_Compass.exe!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_ACCESS_VIOLATION_c0000005_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_usbehci!EHCI_WriteErrorLogEntry

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BufferOverrun_c0000374_supermittcmd.exe!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_msisadrv_Wdf01000!FxSystemThread::Thread

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!unknown_function_VEN_QCOM_DEV_0D08

Resolved an issue affecting system reliability.

### [Lenovo][LCFC][Sydney2]BSOD 0x133(i8042prt.sys) during s0i3 stress test - excessive keyboard interrupts and polling time for the status byte

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x10D_4_UcmCx!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_W_(null)_ucx01000!UrbHandler_USBPORTStyle_Legacy_BulkOrInterruptTransfer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_R_(null)_UsbHub3!McGenControlCallbackV2

Resolved an issue affecting system reliability.

### Lenovo:LCFC:25H2_Upgrade:"Turn off my screen when I leave" and "Wake my device when I approach" are OFF even if Turn on in OOBE Privacy setting page.(FR:2/2 units,2/2 cycles)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_LKD_Keyboard_keyboard.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait

Resolved an issue affecting system reliability.

### [Dynabook]The USB xHCI driver will shows YB after add the hash code into sdev table, and camera device disappear.

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_22621.1.amd64fre.ni_release.220506-1250_TIMESTAMP_320527-161724_7560F114_nt_wrong_symbols!7560F1141047000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xCE_IMAGE_i8042prt.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_HIDCLASS!HidpCallDriverSynchronous

Resolved an issue affecting system reliability.

### [Arm64][Compat][CRD][Device][keyboard][Inconsistent]: Keyboard not working inconsistently in Device.

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::LightSensorFactory::GetDefault

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_190502701041

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_150707301100

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_USBXHCI!Control_WdfEvtIoDefault

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_DPC_USBXHCI!Bulk_EvtDmaCallback

Resolved an issue affecting system reliability.

### [Lenovo][LCFC][24H2][USB]:Question:system showing USB 3.2 on spec sheet but USB 3.10 found in Device Manager

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e47d_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1343_REV_0000_FW_151015300401

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_W_(null)_ucx01000!UrbHandler_Legacy_ControlTransfer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_UsbHub3!TlgRegisterAggregateProvider

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_241022B80001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease

Resolved an issue affecting system reliability.

### [ASUS][PC] Regkey of "IsAdaptiveColorOnByDefault" doesn't work

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BufferOverrun_c0000374_i3cendtoendtest.dll!Unknown

Resolved an issue affecting system reliability.

### [ASUS][PC][OEMQ] How to enable "Sensors: Adaptive Brightness is on by default" to meet requirment of CER Premium Display

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0489_PID_E10A_IMAGE_btfilter.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_kbdclass!KeyboardClassCreateWaitWakeIrpWorker

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_USBXHCI!Register_ControllerStop

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by VERIFIER_STOP_00000900_LEAK_AVRF_80000003_SmFxEngineUmTests.dll!Unloaded

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_19F7_PID_0054_MI_02_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_Wdf01000!FxUsbDeviceControlContext::ReleaseAndRestore

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxNonPagedObject::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_USB_rtump62x64_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0F8B_REV_0000_FW_3130

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_cfffffff_Windows.Graphics.Display.BrightnessOverride.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_181004700240

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_USBXHCI!Control_EP_StopMapping

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by BREAKPOINT_80000003_WUDFx02000.dll!guard_dispatch_icall$thunk$10345483385596137414

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xE6_27_SpbCx!CFxObject_WDFREQUEST___*,CScxRequest,_GetRequestFromFxRequest,1_::_OnCleanup

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_IntelControlLib.dll!CTL_API::OSDisplayOutput::create

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_IMAGE_serenum.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ActivitySensorServer::get_ActiveInLowPowerMode

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::GfxHandler::getDisplayOutputProperties

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_usbccgp_ExcessiveThreadsWaitingForPageIn_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalService_ACCESS_VIOLATION_c0000005_Microsoft.Bluetooth.Service.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::_StateMachineEngineImpl

Resolved an issue affecting system reliability.

### [Diomedes][N1x][Yukon][USB-IF Cert][JEDI Action] There is a15 Second Refresh Delay for USB4 Hub to disappear from Device Manager after Hot Plugging from N1x Yukon System USB-C ports.

Resolved an issue affecting system reliability.

### [N1x][Yukon][USB-IF Cert][JEDIAction] There is a15 Second Refresh Delay for USB-C Monitor Connected to USB4 Hub to disappear from Device Manager after Hot Plugging from N1x Yukon System [Intermittent]

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFHost.exe!wil::details_abi::SubscriptionList::OnSignaled

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_HIDCLASS!HidpCollectionFreeUnreadReports

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_W_(null)_USBXHCI!McTemplateK0pquuqqqqqqsssxqqqttqqqqtxxqqqqqqqqqqnn_EtwWriteTransfer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0D28_PID_0204_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xC7_Wdf01000!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e431_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xFC_WDFLDR!__guard_fids_table

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x10D_4_ucx01000!RootHub_Pdo_EvtInternalDeviceControlIrpPreprocessCallback

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3142_REV_0000_FW_17072470F220

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_51ED_SUBSYS_0BBA1028_REV_01_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e431_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e431_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_USBMidi2_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7f_8_UsbHub3!HUBHTX_Get20PortChangeEvent

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xE6_27_SpbCx!CScxRequest::BuildMdlForBufferEntry

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_SETPOWER_rtwlanu7_BatteryCritical_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e47d_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xF7_THREE_BIT_MATCHED_FRAME_COOKIE_Wdf01000!imp_WdfIoTargetSendInternalIoctlOthersSynchronously

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!unknown_function_VEN_8086_DEV_A12F_REV_31

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7E_C000001D_BAD_IP_USBXHCI!TelemetryData_CreateReport

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_INVALID_NEXT_THREAD_c0000409_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xE6_27_SpbCx!CScxRequest::CaptureFxRequest

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFx.dll!__native_dllmain_reason

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::ExtractAccelerometerVector

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_PCQ_ERROR_IMAGE_usbhub.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.27911.1000.amd64fre.rs_wsd_cfe.250724-1702_TIMESTAMP_341009-072012_79D4D4AC_nt_wrong_symbols!79D4D4AC1459000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcClient::DeManagementRpcClientAdapterImpl::OpenFromMonitorId

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_USBXHCI!Control_Transfer_CompleteCancelable

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_UNHANDLED_TRANSFER_EVENT_TRB_COMPLETION_CODE_USBXHCI!unknown_function_VEN_8086_DEV_22B5_REV_36

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_ETWCALLBACK_c0000005_hidserv.dll!unknown_error_in_service

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CLR_EXCEPTION_System.Xaml.XamlObjectWriterException_80131500_Compass.exe!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_RESET_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a12f_REV_0031

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_WUDFx02000.dll!FxIoTarget::_RequestCompletionRoutine

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x0_ucx01000!Urb_USBPORTStyle_ProcessURB

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_HOST_SYSTEM_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a71e_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xc2_99_WDFLDR!DereferenceVersion

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx.dll!FxCmResList::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!CTL_API::WDDMInterface::GetDeviceAdapters

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_IMAGE_usbehci.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_hidi2c!wil_details_EvaluateFeatureDependencies

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xc2_d_USBXHCI!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0CA1_REV_0000_FW_3130

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_hidi2c!OnInternalDeviceIoControl

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FATAL_USER_CALLBACK_EXCEPTION_c000041d_WUDFx02000.dll!FxObjectHandleAlloc2

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_USB_Wdf01000!FxIoQueue::StartPowerTransitionOff

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_ucx01000.sys!Unloaded

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_HIDCLASS!Feature_SPR_HardenInClient__private_IsEnabledDeviceUsageNoInline

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by BREAKPOINT_80000003_Windows.Devices.Sensors.dll!__scrt_initialize_crt

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_netsvcs_BREAKPOINT_80000003_Windows.Devices.Sensors.dll!__scrt_initialize_crt

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_0849_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GP17.ACP._PS0_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_MEIx64_Wdf01000!FxPkgGeneral::OnCleanup

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_5782_SUBSYS_00000000_REV_00_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xFC_USBXHCI_Wdf01000!FxRequest::Release

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.29439.1000.amd64fre.rs_es_lego.250830-1500_TIMESTAMP_950712-152247_3003E8C7_nt_wrong_symbols!3003E8C71459000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1AA_HIDPARSE!HidP_TranslateUsageAndPagesToI8042ScanCodes

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0482_PID_5752_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsApi.dll!wil::details::functor_wrapper_void__lambda_65197f76560d04008ad318197229ec2e___::Run

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xc2_99_usbccgp!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_Wdf01000_fffff800798b0000!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0451_PID_8442_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_145F_PID_02FC_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_CODE_AV_BAD_IP_Wdf01000!FxTimer::TimerHandler

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_CameraMonitor_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_IntelControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_W_(null)_Wdf01000!FxWorkItem::WorkItemThunk

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_sensrsvc.dll!CSensorEnsemble::SetISensor

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_IntelControlLib.dll!CTL_API::GfxHandler::_GfxHandler

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!unknown_function_VEN_1B21_DEV_3241_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!unknown_function_VEN_1B21_DEV_3241_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7E_C000001D_BthLEEnum_BAD_IP_Wdf01000!FxIoQueue::QueuePurge

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f9_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f9_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CORRUPT_MODULELIST_ACCESS_VIOLATION_c0000005_IntelControlLib.dll!Unloaded

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!CTL_API::KmdSysManager::requestSingle

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3151_PID_3022_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!CTL_API::DisplayOutputImp::_vector_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_usbview.exe!DisplayHidDescriptor

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_wdfkd.dll!DumpFxUsbPipe

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_hidi2c!HidSetReport

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_1D57_PID_FA65_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!__acrt_LCMapStringA_stat

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2972_PID_0088_REV_0132_MI_03_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1CA_USBXHCI!Isoch_Stage_CompleteTD

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_Windows.Devices.Sensors.dll!wil::details::ResultFromCaughtExceptionInternal

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1a_4477_ucx01000!UcxEndpointStateEntryFunc_DeletingStale

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_EntryCorruption_c0000374_WUDFx02000.dll!FxSystemWorkItem::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x3D_C0000005_USBXHCI!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_W_(null)_mouhid!MouHid_ReadComplete

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x3B_80000003_VRF_i3chost!Target::EvtIoDefault

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_BatteryLow_IMAGE_usbser.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1C8_PNP_ActivePnpThread_Blocked_On_nvasd_Wdf01000!FxIoQueue::StartPowerTransitionOff

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f9_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BlockNotBusy_DOUBLE_FREE_c0000374_MuttUtil.dll!CWinUsbDevice::_CWinUsbDevice

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7f_8_asmthub3!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by INVALID_EXCEPTION_HANDLER_c00001a5_hid.dll!HidD_GetPreparsedData

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_INVALID_EXCEPTION_CHAIN_c0000409_hid.dll!HidD_GetPreparsedData

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_240321B80001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_WUDFRd!RdUsbPkg::UsbControlTransferASync

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::CustomPropertiesMapServer::_CustomPropertiesMapServer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_cfffffff_IntelControlLib.dll!create_environment_char_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_UsbHub3!HUBHTX_GetHubStatusUsingControlTransfer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_serial!SerialIoCallDriver

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_c0000005_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcServer::DeManagementRpcServerImpl::Remove

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xFC_kbdhid!wil_details_PopulateInitialConfiguredFeatureStates

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_1022_DEV_15B8_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CLR_EXCEPTION_System.Runtime.InteropServices.ExternalException_800401d0_USB.exe!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxUsbPipe::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e37d_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_IntelControlLib.dll!CTL_API::OverclockManager::InitOcManager

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_248B_PID_8100_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_POINTER_AUTH_INVALID_RETURN_ADDRESS_c0000409_winusb.dll!WinUsb_AbortPipeAsync

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xE6_26_USBXHCI!Isoch_Stage_CompleteTD

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_rcusbwdm_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7EC0_SUBSYS_00000000_REV_10_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_318C_SUBSYS_87F9103C_REV_06

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_8086_DEV_51ED_REV_01

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_W_usbccgp!CheckParentIdleDpc

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_DPC_HIDCLASS!GetCollectionDesc

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_DPC_usbehci!EHCI_RH_PortResumeComplete

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_VRF_DPC_USBXHCI!Isoch_RetrieveNextStage

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_FFCA_PID_0125_MI_00_IMAGE_usbser.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_VRFK_4_HID_WUDFRd_IMAGE_mshidkmdf.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_19D2_PID_1403_IMAGE_usbccgp.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_hidi3ctest.dll!unknown_error_in_taef

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? I3C is not enabled-by-default on Bromine/BR, so all tests are failing. ## What changed? Disabling all I3C tests #...

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsApi.dll!SensorCloseCOM

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x13a_8_XHCW_Wdf01000!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000096_IntelControlLib.dll!CTL_API::_dynamic_atexit_destructor_for__OSDllsobj__

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CLR_EXCEPTION_80070005_sensordiagnostictool.exe!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_NULL_IP_USBXHCI!Controller_WdfEvtPreprocessSetPowerIrp

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_ControlLib.dll!GetRuntimeLib

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_046A_PID_01DE_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_DPC_WUDFRd!WudfPeriodicTimer::TimerDpc

Resolved an issue affecting system reliability.

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

### [Watson Failure]: Crash caused by 0x133_DPC_kbdhid!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_SurfaceSerialHubDriver_Wdf01000!FxSystemWorkItem::WaitForExit

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_7D03_SUBSYS_207A1EE7_REV_05

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!unknown_function_VEN_1022_DEV_15C1_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ILLEGAL_INSTRUCTION_c000001d_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Bluetooth::Foundation::TokenWithStatusControl_Microsoft::Windows::DisplayEnhanceme

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x18_WinUSB!WinUSB_ReadPipeCompletion

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1E_C000001D_BAD_IP_usbccgp!CheckParentIdleWorker

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_39_USBXHCI!WPP_0e51d3b82fdb347dedaae242937bad3f_Traceguids

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_cfffffff_SensorsApi.dll!SimpleDeviceOrientationSensor::SetEventSink

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_INTERRUPTS_DISABLED_i8042prt!I8xReadPortUchar

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_VERIFIER_STOP_AVRF_c0000421_sensorservice.dll!ExternalDisplayConnectedNotifications::OnDisplayAdded

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_BTHUSB_Wdf01000!FxPkgIo::StopProcessingForPower

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_WUDFx02000.dll!FxMemoryObject::Release

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xE6_27_VenId0x1B21_DevId0x2142_IMAGE_USBXHCI.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_BTHUSB_Wdf01000!FxPowerDeviceDisarmWakeFromS0::InvokeClient

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_DPC_ucx01000!McGenEventWrite_EtwWriteTransfer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!unknown_function_VEN_8086_DEV_15E9_REV_06

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0B05_PID_1898_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0B05_PID_1956_IMAGE_usbccgp.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7EC0_SUBSYS_72708086_REV_10_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_rtu56cx21x64_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2D99_PID_A047_MI_02_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!wil::details::FeatureImpl___WilFeatureTraits_Feature_TestConfNum_::GetCachedFeatureEnabledState

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_XPROC_BusyHang_cfffffff_Windows.Graphics.Display.BrightnessOverride.dll!GetForWindowCommon

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_R_(null)_ucx01000!UrbHandler_USBPORTStyle_Legacy_IsochTransfer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15c3_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x10D_7_USBXHCI_Wdf01000!FxVerifierBugCheckWorker

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_PRERESET_IDLE_THREAD_INTERRUPTS_DISABLED_USBXHCI!Bulk_ProcessTransferEventWithED1

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_Windows.Devices.Sensors.dll!_dynamic_atexit_destructor_for___AtlModule__

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_CODE_AV_BAD_IP_Wdf01000!FxFreeToNPagedLookasideList

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_WpdUpFltr_Wdf01000!FxIoTarget::Dispose

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_UsbHub3!WMI_RegisterHub

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1E_C000001D_BAD_IP_WinUSB!WinUSB_ReadPipeCompletion

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_0b27_REV_0003

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_serial!SerialStartDevice

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_170214500200

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_STOP_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_170214500200

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_AcerAirplaneModeController!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HUP_BUGCHECK_DISPLAY_INVALID_GAIN_MAP_BLOB_HL_2_FormFactor_HPUv2_F154002D_WUDFHost.exe!unknown_error_in_process

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_CameraMonitor_ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::TransformSensorReading_enum_Windows::Devices::Sensors::SimpleOrientation_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_W_(null)_WUDFRd!WdfLpcCorePortInterface::CreateResourceReserve

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by IN_PAGE_ERROR_services.exe_BUGCHECK_CRITICAL_PROCESS_IOERR_WudfPlatform!McGenControlCallbackV2

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by IN_PAGE_ERROR_c0000242_ETWCALLBACK_UNLOADED_c0000006_WudfPlatform.dll!McGenControlCallbackV2_{2e35aaeb-857f-4beb-a418-2e6c0e54d988}

Resolved an issue affecting system reliability.

### [I3C] WDFDEVICE & Queue handles in Target context are overwritten before ReleaseHardware of old PDO on re-enumeration

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? When a Target-driver requests re-enumeration of an I3C Target, there is no guarantee that ReleaseHardware for the...

### [Watson Failure]: Crash caused by STACK_BUFFER_OVERRUN_MATCHED_FRAME_COOKIE_GeneStor_Wdf01000!FxPkgPnp::PowerPolicyProcessEventInner

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_USB_IMAGE_WUDFRd.sys_USB_VID_05E3_PID_0758_MI_01

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFHost.exe!CWudfModuleInfo::Release

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_usbccgp!UsbcCompleteIrp

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalService_ACCESS_VIOLATION_c0000005_Microsoft.Bluetooth.Service.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::ProcessEventQueue

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xa0_614_hidi2c!OnInterruptDpc

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!unknown_function_VEN_1022_DEV_145F_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_HDAudBus!FxStubDriverUnloadCommon

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xFC_UsbHub3!DsmStateEntryUnConfiguredInD0

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_ctpdusbx_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_ENDTASK_HungThreadIsIdle_cfffffff_pc.exe!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xE6_26_USBXHCI!Interrupter_DeferredWorkProcessor

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_Wdf01000!WPP_FxIoQueue_cpp_Traceguids

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Graphics.Display.DisplayEnhancementOverride.dll!Microsoft::WRL::Details::DelegateArgTraits_long_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_usbser!UsbSerEvtDeviceSelfManagedIoFlush

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ILLEGAL_INSTRUCTION_c000001d_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::Coordinator::DeRequestCoordinatorImpl::SelectHighestT

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by DISABLED_INTERRUPT_FAULT_SpbCx!McTemplateK0zq_EtwWriteTransfer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xc2_e_WinUsb!WinUSB_ControlTransfer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_MATCHED_FRAME_COOKIE_UsbHub3!HUBREG_QueryUxdDeviceKey

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by INVALID_HANDLE_AVRF_c0000008_WUDFx02000.dll!FxWorkItem::_FxWorkItem

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by STACK_BUFFER_OVERRUN_MISMATCH_GSCOOKIE_GeneStor_Wdf01000!FxPkgPnp::PowerPolicyProcessEventInner

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_RESET_USBXHCI!unknown_function_VEN_1022_DEV_43BC_REV_02

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_CODE_AV_PAGED_IP_amdppm!ProcessSystemSleepStateNotify

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_171102701500

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_Camera_ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::GetDataOrientation

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_ENDTASK_BlockedOn_DeviceIO_cfffffff_winusb.dll!WinUsb_ReadPipe

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_rtwlanu_BatteryLow_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!ctlInit

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.27943.1000.amd64fre.br_release_sigma_dev.250907-1700_TIMESTAMP_550225-121710_A02AF846_nt_wrong_symbols!A02AF8461459000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_USBXHCI!Controller_WdfEvtDeviceFilterRemoveResourceRequirements

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_16c3_DEV_abcf_REV_000b

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_RESET_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_16c3_DEV_abcf_REV_000b

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1D5_udecx!Controller_WdfDeviceRetrieveAcpiDataSynchronously

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by BREAKPOINT_80000003_echoapp.exe!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_1022_DEV_1639_SUBSYS_1319152D_REV_00_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_CvfUsbBridge_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1E_C0000096_USBXHCI!Controller_LowerAndTrackIrql

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1E_C0000096_USBXHCI!Isoch_PrepareStage

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::CreateActivationFactory_Windows::Devices::Sensors::HingeAngleSensorFactory_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_HIDCLASS!HidpFdoSendDxIrp

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::GyrometerServer::QueryInterface

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!unknown_function_VEN_8086_DEV_15B6_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_IMAGE_WUDFRd.sys_ACPI_ACPI0008

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_05C6_PID_90DB_MI_05_IMAGE_WinUSB.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_ENDTASK_XPROC_HungThreadIsIdle_cfffffff_hid.dll!DeviceIoControlHelper

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_btfilter!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::ComPtr_Windows::Devices::Sensors::AccelerometerServer_::Attach

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by DISABLED_INTERRUPT_FAULT_USBXHCI!__guard_fids_table__PERF__

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!unknown_function_VEN_1002_DEV_73A6_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0E8D_PID_8C38_IMAGE_usbccgp.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_22E3_PID_003C_IMAGE_WinUsb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3241_REV_0000_FW_200311830202

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_Wdf01000!FxInterrupt::_InterruptThunk

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_WDFLDR!FindModuleByServiceNameLocked

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_DPC_SpbCx!CScxTarget::ForwardIrpToTargetQueue

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1_SysCallNum_0_UsbHub3!HUBPDO_EvtCompleteIrpWorkItem

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xc4_122_LEqdUsb!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_QcXhciFilter8380!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.LPCB.ECDV.TSKN._TMP_ACPI_BatteryCritical_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_MultipleEntriesCorruption_c0000374_IntelControlLib.dll!_dcrt_get_narrow_environment_from_os

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll![thunk]:Microsoft::WRL::ActivationFactory_Microsoft::WRL::Implements_Microsoft::WRL::FtmBase,Windows::Devices::Sensors::Internal::ISensorStatics_,Microsoft::WRL::Detai

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15bb_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_22621.2771.amd64fre.ni_release.220506-1250_TIMESTAMP_2042B9C5_nt_wrong_symbols!2042B9C51047000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!o___std_type_info_destroy_list

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_UcmCx!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_07BF_IMAGE_usbccgp.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_AML!_SB.PCI0.LPC0.BAT1._STA_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1D5_IMAGE_WUDFRd.sys_USB_VID_05E3_PID_0758_MI_01

Resolved an issue affecting system reliability.

### Caught Platform::Exception^: Access is denied.  onecoreuap\drivers\mobilepc\displayenhancement\test\dessimulator\softwaredessimulator.cpp(22)\Microsoft.Graphics.DisplayEnhancements.BrightnessHotkeys.Functi:  Exception(1)  80070005 Access is denied.  

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_INVALID_ARG_c0000409_usbceip.dll!CDevNode::QueryDeviceProperty

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_4E03_SUBSYS_8996103C_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!unknown_function_VEN_1B21_DEV_1242_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!unknown_function_VEN_1B21_DEV_1242_REV_00

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x35_WUDFRd!RdPnpTracker::RdPnpProcessor

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_22621.1926.amd64fre.ni_release_svc_prod3.230616-1746_TIMESTAMP_191BB7C9_nt_wrong_symbols!191BB7C91048000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_CODE_AV_PAGED_IP_kbdclass!KbdConfiguration

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by INVALID_PARAMETER_c000000d_IntelControlLib.dll!free_base

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_CORRUPT_LIST_ENTRY_c0000409_WUDFx02000.dll!MxWorkItem::Allocate

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::InclinometerFactory::GetDefault

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_1507073011FF

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by MOAPPLICATION_HANG_cfffffff_Windows.Devices.Sensors.dll![thunk]:Microsoft::WRL::Details::RuntimeClassImpl_Microsoft::WRL::RuntimeClassFlags_1_,1,1,0,Microsoft::WRL::FtmBase,Windows::Devices::Sensors::IPedometer,Windows::D

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by BREAKPOINT_AVRF_80000003_SensorsNativeApi.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_UcmCx!UpmConnectorIndicateStateChange

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_services.exe!DrvMgrLpcNotification::MessageOpenProcess

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xFC_UsbHub3!Psm30StateEntryCheckingIfPersistentOvercurrent

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x3D_C0000005_BAD_IP_USBXHCI!Interrupter_WdfEvtInterruptIsr

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFHost.exe!CWudfDeviceStack::Create

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x3B_C000001D_vhf!PDO_PullRequestComplete

Resolved an issue affecting system reliability.

### [wdf] usbiotargettest.testmd: SharingMechanism StartupStatus not ready 2

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Seen failures in recent test runs when qarootbus devices weren't previously enumerated be preceeding tests. So, w...

### [Watson Failure]: Crash caused by LKD_0x144_USBDEVICE_RESET_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e5_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x13a_11_Mdl__ucx01000!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll![thunk]:Windows::Devices::Sensors::PedometerDataThresholdServer::Release_adjustor{48}_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_Wdf01000_fffff8001af30000!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_RESTART_FAILED_USBXHCI!unknown_function

Resolved an issue affecting system reliability.

### WHCP_Driver : Debug breaks Blocking WHCP execution on QCIPCC Driver

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_LKD_USB_vboxusb.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_HEAP_CORRUPTION_ACTIONABLE_BlockNotBusy_DOUBLE_FREE_c0000374_SensorsApi.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_Wdf01000_fffff80468410000!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_3_CORRUPT_LIST_ENTRY_Wdf01000!FxObject::Commit

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_Wdf01000!WPP_IFR_SF_sq

Resolved an issue affecting system reliability.

### [RI-TP] Failed AltimeterTests::ReadingChanged#metadataSet0: IsLessThanOrEqual(diffInMsec, tolerableDelay) - Values (141623, 5000)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_Wdf01000!FxWakeInterruptMachine::ProcessEvent

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7E7D_SUBSYS_143A1462_REV_20_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0835_PID_2A05_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_FLS_c0000005_hid.dll!_NULL_IMPORT_DESCRIPTOR__PERF__

Resolved an issue affecting system reliability.

### USB4: DP Operation Timeouts overwritten by NVM and TBT operation timeouts.

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_sermouse!SerialMouseCompletionRoutine

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_WUDFRd!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x10D_5_WUDFRd!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_UNHANDLED_TRANSFER_EVENT_TRB_COMPLETION_CODE_USBXHCI!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_WUDFx.dll!CWdfIoRequest::SetFileObjectForNextLocation

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by BREAKPOINT_80000003_ControlLib.dll!_acrt_LCMapStringA

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_1903_SUBSYS_383517AA_REV_0C

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1CA_Wdf01000!WPP_FxRequest_cpp_Traceguids

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_10de_DEV_1ad8_REV_00a1

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_DISABLE_SLOT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_10de_DEV_1ad8_REV_00a1

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_IMAGE_usbccgp.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_BatteryCritical_IMAGE_usbser.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x10D_5_USBXHCI!Interrupter_ReleaseEventRingLock

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_046A_PID_01D7_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8._STA_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFHost.exe!CWudfIrpT_CWudfPnpIrp,IWudfPnpIrp,_WUDFMESSAGE_IRP_*,_WUDFMESSAGE_PNP_REPLY_ALL_*_::Release

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x1F5_STREAM!SCSubmitRequest

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_241022B80001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_190826703140

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by IN_PAGE_ERROR_c0000102_c0000006_Windows.Devices.Sensors.dll!_string_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_DISABLE_SLOT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_7814_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2F24_PID_0060_IG_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_STOP_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1343_REV_0000_FW_151015300401

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2708_PID_000D_REV_0100_MI_03_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BufferOverrun_c0000374_SensorsUtilsV2.dll!CollectionsListDeserializeFromBuffer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_Wdf01000_fffff80356090000!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!HUBHTX_SendInterruptTransferComplete

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_10de_DEV_1ad6_REV_00a1

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!_acrt_initialize_new_handler

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x44_amdhub31!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_8007023e_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_43ED_SUBSYS_0A811028_REV_11_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!CTL_API::OverclockManager::PowerTelemetryGet

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_0PNP_DEV_0D10_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_qcspi8280!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7E_80000003_HIDCLASS!HidpQueryCollectionCapabilities

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_USBPORT!USBPORT_RootHub_Endpoint0

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_monitor_Wdf01000!FxObject::DeleteObject

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_IntelControlLib.dll!CTL_API::KmdSysManager::parseBufferOut

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_1532_PID_0203_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_ACCESS_VIOLATION_c0000005_SensorsApi.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1E_C000001D_USBXHCI!Bulk_ProcessTransferEventWithED1

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_WUDFx02000.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3434_PID_02A3_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43fb_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xFC_SpbCx!__guard_fids_table__PERF__

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xE6_27_HidSpiCx!HidClassMinidriver_HidSpiRequestManager,HidSpiRequest_::EvtDeviceIoControl

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BlockNotBusy_DOUBLE_FREE_c0000374_WUDFx02000.dll!FxLibraryCommonUnregisterClient

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_BcastDVRUserService_FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_ControlLib.dll!internal_get_ptd_head_slow

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!TlgRegisterAggregateProviderEx

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WppRecorderUM.dll!wil::details::_dynamic_initializer_for__g_featureStateManager____PERF__

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_DPC_USBXHCI!Control_WdfEvtIoDefault

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!try_get_function_slow

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xFC_urssynopsys!__guard_fids_table

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x10D_7_qcadcm_Wdf01000!FxNonPagedObject::_FxNonPagedObject

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_CORRUPT_LIST_ENTRY_c0000409_WUDFHost.exe!CWudfDevice::_GetDeviceItf

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_WinUSB!WinUSB_SubmitRead

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_OOM_HighPagedPool_c00000fd_microsoft.graphics.display.displayenhancementservice.dll!out_of_memory

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_PCI_rrwd0002_IMAGE_1394ohci.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorFactory::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_MVXBL64_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_FATAL_USER_CALLBACK_EXCEPTION_c000041d_microsoft.graphics.display.displayenhancementservice.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::ExecuteCurrentState

Resolved an issue affecting system reliability.

### [RI-TP] Failed SensorServiceFuncTests::PnpStateTransitions: IsTrue((!isAccelerometerPresent && !isSdoPresent) ? (availableDeviceInterfaces.size() == 0) : (isSdoPresent ? (availableDeviceInterfaces.size() == 2) : (availableDeviceInterfaces.size() == 1)))

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_HDAudBus_Wdf01000!FxWaitLockInternal::ReleaseLock

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3285_PID_0C18_IG_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x10D_5_UsbHub3!HUBPDO_EvtDevicePrepareHardware

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x3B_C000001D_ucx01000!UrbHandler_USBPORTStyle_Legacy_SCT_VendorClassCommand

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_usbccgp!USBD_SyncCompletionRoutine

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_54ED_SUBSYS_8BB8103C_REV_00_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by IN_PAGE_ERROR_c000009c_c0000006_Windows.Devices.Sensors.dll!_NULL_IMPORT_DESCRIPTOR

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!TUNNEL_EvtIrpPreprocessQueryDevRelations

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_Wdf01000!FxMemoryBufferFromPool::_FxMemoryBufferFromPool

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by STACK_OVERFLOW_80070490_Windows.Devices.Sensors.dll!SimpleOrientation::InitializeDefaultByType

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFHost.exe!CWudfIoStackLocation::_CWudfIoStackLocation

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250320B80001

Resolved an issue affecting system reliability.

### [RI-TP] AreEqual(expectedIsValidState ? HumanPresence::Present : HumanPresence::Unknown, reading->Presence) - Values (1, 0)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_UmPass_Wdf01000!FxTransactionedList::LockForEnum

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1F0_VRF_Usb4DeviceRouter!Usb4Drd::HostRouterInterface::CancelNotification

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1142_REV_0000_FW_140328101800

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_ControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7E_C000001D_Wdf01000!FxPkgPnp::SaveState

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_ControlLib.dll!_acrt_initialize_stdio

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1DB_USBPORT!MPf_PollController

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::GfxHandler::_GfxHandler

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_Wdf01000!FxUsbDevice::GetString

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_USBXHCI!DynamicLock_Release

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_usbccgp!QueryParentDeviceRelations

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by MANUALLY_INITIATED_CRASH_ExcessiveWaitTimeOnERESOURCE_Blocked_On_kbdhid!KbdHidProcessCrashDump

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_WDFLDR!ReferenceClassVersion

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xB8_sshid_Wdf01000!FxIoTarget::SubmitSync

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x1E_C0000420_qcspi8180!spi_cancel_transfer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_UNHANDLED_TRANSFER_EVENT_TRB_COMPLETION_CODE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250811B80001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250811B80001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Internal::GitEventSource_Windows::Foundation::ITypedEventHandler_Windows::Devices::Sensors::LightSensor_*,Windows::Devices::Sensors::LightS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_nWifiPAUSE_wg111v2_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_ExcessiveThreadsWaitingForPageIn_IMAGE_Usb4HostRouter.sys

Resolved an issue affecting system reliability.

### [RI-TP] AreEqual(static_cast<boolean>(expectedIsValidState), value) - Values (1, 0)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_hid.dll!HidP_GetUsages

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_DISABLE_SLOT_FAILED_USBXHCI!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::InitiateFirstRun

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_serenum!Serenum_DispatchPassThrough

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!wil_details_FeatureReporting_RecordUsageInCache

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_38ed_REV_0010

Resolved an issue affecting system reliability.

### Failed Microsoft::Windows::DisplayEnhancement::FuncTests::AutobrightnessTests::BatterySaverBrightnessMultiplierTest: AreEqual(GetBrightnessPowerGuidValue(), targetBrightness) - Values (80, 100)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_UmPass_Wdf01000!FxObject::PerformDisposingDisposeChildrenLocked

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7E_C0000006_C0000428_HIDCLASS!HidpGetComboHardwareIdV2Enabled

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x13a_11_Mdl__IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7f_8_USBXHCI!StageQueue_ForwardScanGetNextStage

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_ExcessiveReadyThreads_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_9A03_SUBSYS_380A17AA_REV_01

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_WDFLDR!DereferenceClassVersion

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_EVENT_RING_FULL_ERROR_USBXHCI!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_msquic!FxDriverEntry

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_c0000005_sensorservice.dll!History::RetrieveHistoryFromSensor

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_MISSING_GSFRAME_ISH!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by BREAKPOINT_80000003_hid.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_PCI_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_9A03_SUBSYS_87FE103C_REV_02

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_DPC_USBXHCI!Control_ProcessTransferEventWithED0

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_BthHFEnum_Wdf01000!FxWmiIrpHandler::_RegInfo

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_wna3100m_ExcessiveReadyThreads_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::QueryInterface

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by IN_PAGE_ERROR_c000009c_c0000006_Windows.Devices.Sensors.dll!_imp_BiRtDeleteEventForApp

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!HUBREG_DeleteUxdSettings

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by MOAPPLICATION_HANG_cfffffff_Windows.Graphics.Display.DisplayEnhancementOverride.dll!guard_dispatch_icall$thunk$10345483385596137414

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xE4_2_ApHidfiltrService_Wdf01000!MxWorkItem::Free

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_ssps2!MSIECRestore

Resolved an issue affecting system reliability.

### [RI-TP] Failed \WinRTSensors.FuncTests.CppCx.dll/SimpleOrientationSensorTests/SimpleOrientationSensorTests::ClassSetup: Setup fixture 'SimpleOrientationSensorTests::ClassSetup' for the scope 'SimpleOrientationSensorTests' returned 'false'.

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8._REG_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [RI-TP] Failed HumanPresenceExtensionManagerTests::SensorAdapterProcessReadingFails: AreEqual(detectionDistanceInMillimeters, expectedDistanceInMillimeters) - Values (0, 4000)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_WpdUpFltr!FxDriverEntry

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_1022_DEV_15D7_SUBSYS_21371D72_REV_00_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorFactory::GetDefault

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PC00.LPCB.EC0.SEN1.PAT0_ACPI_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorReadingChangedEventArgsServer::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_FAULT_c00000aa_SensorsApi.dll!Windows::Internal::GitPtrImpl_Windows::Internal::GitPtr_::Initialize_ISensorEvents_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ExcessiveThreadsWaitingForPageIn_IMAGE_qci2c7180.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HUP_BUGCHECK_POR_PIN_CANT_FIND_RESOURCE_HL_2_FormFactor_HPUv2_F4000001_WUDFHost.exe!unknown_error_in_process

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_ControlLib.dll!ctlInit2

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x13a_11_Wait_WUDFRd!operator_delete

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x13a_11_Wait_WUDFRd!_MODULE_INFO::__MODULE_INFO

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_ucx01000!USBPORTStyle_UserGetRootHubName

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250811B80001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8.U4UP.U4P2._PS3_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [RI-TP] Failed HumanPresenceExtensionManagerTests::SensorAdapterProcessReadingTimeoutExpiredFails: AreEqual(sharedMemoryBlock->CallsCount_ProcessReadingTimeoutExpired, 1u) - Values (0, 1)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_USB_nationalinstrumentsblan_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8.U4UP.U4P3.UHI0._REG_ACPI_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_iaLPSS2_GPIO2_Wdf01000!FxPkgPnp::_PowerProcessEventInner

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_4_USB_WacHIDRouterISDU_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_SpbCx!CScxTarget::_OnTargetIoDefault

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_RESET_FAILED_USBXHCI!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_SensorsApi.dll!Microsoft::WRL::ComPtr_IUnknown_::InternalRelease

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by IN_PAGE_ERROR_services.exe_BUGCHECK_CRITICAL_PROCESS_c0000005_services!WdfProcess::TerminateProcess

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_RtkBtfilter_ExcessiveReadyThreads_ProcessorThrottled_PerfPolicy_IMAGE_amdhub31.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CLR_EXCEPTION_80132006_dc.exe!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_SpbCx!CScxController::_OnDxIrpComplete

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Bluetooth::Foundation::TokenWithStatusControl_Microsoft::Windows::

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_0C9E_IMAGE_btfilter.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!HUBREG_OpenQueryAttemptRecoveryFromUsbPowerDrainValue

Resolved an issue affecting system reliability.

### [RI-TP] Failed \USBTCDtaef.dll/UsbTcdTests::WinUsbIoTests/UsbTcdTests::WinUsbIoTests::WinUSBBulkAndIsochIOCancellations/UsbTcdTests::WinUsbIoTests::MethodCleanup: Encountered failure for USBXHCI host controller while running test. Please visit aka.ms/xhci

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xc2_d_BTHUSB_Wdf01000!FxPoolFree

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_SerCx2!Timer_EvtTimerFired

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_23E5_PID_A2F0_REV_0500_MI_03_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::MakeAndInitialize_Windows::Devices::Sensors::GyrometerServer,Windows::Devices::Sensors::GyrometerServer_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_Unowned_CriticalSection_c0000194_SensorsUtilsV2.dll!SerializationBufferFree

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_4E53_PID_5407_MI_01_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [RI-TP] AreEqual(static_cast<HRESULT>(RPC_S_CALLPENDING), CoWaitForMultipleHandles( COWAIT_DISPATCH_CALLS | COWAIT_DISPATCH_WINDOW_MESSAGES, s_readingChangeWaitTimeInMilliSeconds, 1, readingChangedEvent.addressof(), &indexUsed)) - Values (0x80010115, 0x0)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_EVENT_RING_FULL_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a87d_REV_0001

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FATAL_USER_CALLBACK_EXCEPTION_c000041d_WUDFHost.exe!unknown_error_in_process

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_ucx01000!UrbHandler_USBPORTStyle_Legacy_SCT_VendorClassCommand

Resolved an issue affecting system reliability.

### [WinVOS][WinVOSFull]Failed AccelerometerTests::ReadingChanged#metadataSet3: SUCCEEDED(CoWaitForMultipleHandles( COWAIT_DISPATCH_CALLS | COWAIT_DISPATCH_WINDOW_MESSAGES, timeoutMs, 1, &(rawCompletedEvent), &eventIndexUnused)): Failed to get a ReadingChange

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxMemoryBufferFromLookaside::SelfDestruct

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsUtilsV2.dll!MIDL_user_allocate

Resolved an issue affecting system reliability.

### [GE LT] Feature_SoftwareOffloadWithClientBuffers | 39615196: Ensure LT And GE branches are identical

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Ensuring both LT and GE release branches are identical at AlwaysDisabled ## What changed? Removed the alwaysDisab...
- Cherry picked from !13784581 Cherry-picked from commit `df3746e5`. ## Why is this change being made? Ensuring both LT and GE release branches are i...
- ## Why is this change being made? ## What changed? ## How was the change tested? _For more information on the code review process, see the [Code Re...

### [Watson Failure]: Crash caused by 0x133_ISR_USBXHCI!ESM_ExecuteEntryFunctionsAndPushPopStateMachinesForCurrentState

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::remove_ReadingChanged

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_INTERRUPTS_DISABLED_USBXHCI!Control_Transfer_Map

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xE6_28_nvxhcifilter!unknown_function

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by MANUALLY_INITIATED_CRASH_ExcessiveWaitTimeOnERESOURCE_Blocked_On_i8042prt!I8xProcessCrashDump

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7749_SUBSYS_380517AA_REV_00_IMAGE_mshidkmdf.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x13a_8_9____USBXHCI_Wdf01000!FxPoolFree

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Compass.exe!unknown_error_in_process

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_AVRF_c0000409_SensorService.HumanPresenceMonitor.UnitTests.dll!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_ExcessiveThreadsWaitingForPageIn_IMAGE_WUDFRd.sys_ROOT_LENOVOVHID

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::MakeAndInitialize_Windows::Devices::Sensors::InclinometerFactory,Windows::Devices::Sensors::InclinometerFactory_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by SVCHOSTGROUP_WbioSvcGroup_ASSERTION_FAILURE_c0000420_SensorsApi.dll!_CClassExtensionProxy::EnQueue_::_1_::catch$9

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_amdfendrsr.exe!Unknown

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7E_C0000006_C0000428_WinUsb!WinUSB_GetDeviceDescriptor

Resolved an issue affecting system reliability.

### Failed Microsoft.Graphics.DisplayEnhancements.AdaptiveColor.FunctionalTests.testmd [Double Nits Monitor]: Error trace not within a test case. - (Error=0x800705b4) Failed to enable provider

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!internal_get_ptd_head_slow

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_agrsm64_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_IntelControlLib.dll!CTL_API::_dynamic_atexit_destructor_for__OSDllsobj__

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::AccelerometerServer::ProcessReadings

Resolved an issue affecting system reliability.

### [RI-TP] AreEqual(expectedPersonIdVector[i], UINT32_MAX) - Values (1, 4294967295)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_DeviceInstallTimeout_LKD_00000000-0000-0000-0000-000000000000_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::WRL::ActivationFactory_Microsoft::WRL::Implements_Microsoft::WRL::FtmBase,Windows::Internal::Graphics::Display::Displ

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_ACPI_NVDA8000_IMAGE_USBXHCI.SYS

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_PerfPolicy_IMAGE_hidi2c.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1343_REV_0000_FW_151015300402

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x3B_80000004_ucx01000!McTemplateK0ppppphnNR5_EtwWriteTransfer

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_ACPI_CIRQ1080_IMAGE_mshidkmdf.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_Windows.Devices.Sensors.dll!ViewPositionTracker::RegisterForDisplayRegionChanges

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_ISR_amdi2c_Wdf01000!FxPkgPnp::PowerPolicyEnterNewState

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::AccelerometerReadingServer::_scalar_deleting_destructor_

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_CONTROL_INVALID_RETURN_ADDRESS_c0000409_amdfendrsr.exe!unknown_error_in_process

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x133_DPC_Wdf01000!FxEventQueue::EventQueueWorker

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x7f_8_kbdclass!KeyboardStart

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xE6_26_USBXHCI!Isoch_RetrieveNextStage

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x13a_8__g___USBHUB3_Wdf01000!FxPoolFree

Resolved an issue affecting system reliability.

### IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_80070490_Windows.Devices.Sensors.dll!wil::details::WilFailureNotifyWatchers

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!free_base

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_1A86_PID_E310_MI_00_IMAGE_hidusb.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_PTPFilter_Wdf01000!FxIoQueue::DispatchRequestToDriver

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::CreateActivationFactory_Windows::Devices::Sensors::OrientationSensorFactory_

Resolved an issue affecting system reliability.

### [RI-TP] Failed HumanPresenceMonitorFactoryTests::SensorSelectionTest: IsGreaterThanOrEqual(availableSensors.size(), static_cast<size_t>(3)) - Values (0, 3)

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::GetNativeOrientationFromVideoOutput

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_USBHUB3_Wdf01000!FxPkgFdo::HandleQueryCapabilitiesCompletion

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0FEE_REV_0000_FW_3130

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x139_MISMATCH_GSCOOKIE_usbcir!UsbIrParse

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by AV_USBXHCI!Isoch_MappingLoop

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0xC1_23_VRF_WinUSB!WinUSB_ReadPipeCompletion

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_madiface_usb_amd_IMAGE_UsbHub3.sys

Resolved an issue affecting system reliability.

### [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SettingsHandlers_HumanPresence.dll!wil::details::functor_wrapper_void__lambda_260b81f2231255642d6c288569aacead___::Run

Resolved an issue affecting system reliability.

### [RI-TP] Failed VhfTaefTest.testmd: Waiting for the device interface arrival failed. WaitResult:258

Resolved an issue affecting system reliability.

### [RI-TP] AreEqual(true, dataExpected) - Values (1, 0)

Resolved an issue affecting system reliability.

### [RI-TP] Failed HumanPresenceSensorTests::GetCurrentReadingValidation: AreEqual(reading2->Presence, detectionState ? HumanPresence::Present : HumanPresence::NotPresent) - Values (1, 2)

Resolved an issue affecting system reliability.

### Failed Microsoft::Windows::DisplayEnhancement::DeoRpcServer::UnitTests::DeoRpcServerUnittests::SimpleStartStopOverrideTest: IsTrue(verifier.verify_success_and_count<BrightnessOverrideTest>(1))

Resolved an issue affecting system reliability.

### IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)

Resolved an issue affecting system reliability.

### [Diomedes][N1x][MTK 5558567] CLOCK_WATCHDOG_TIMEOUT on boot blamed on mtkwecxa.sys

Resolved an issue affecting system reliability.

### Hardware | Wistron Corporation | Gradual Rollout failed

Resolved an issue affecting system reliability.

### Failed Windows.Graphics.Display.BrightnessOverride.ApiTests.testmd [Single Nits Monitor - No ALS]: Error trace not within a test case. - (Error=0x800705b4) Failed to enable provider

Resolved an issue affecting system reliability.

### [Diomedes][MINOS EV1.5 Selfhost] Consistent IOMMU fault bugcheck on LKG 1001 (BSP 4.14.2) when connecting Lenovo Ideapad TBT3 dock

Resolved an issue affecting system reliability.

### [RI-TP] AreEqual(expectedIsValidState ? HumanPresence::Present : HumanPresence::Unknown, reading->Presence) - Values (1, 0)

Resolved an issue affecting system reliability.

### [wini3c][test] Timeout during ResetOverlapped::ResetWithCccDefiningByte

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? Recent lab test run failed due to timeout. This is likely due to the short timeout (and long time running on the ...

### After the update, the adaptive color option is removed from Settings app.

Resolved an issue affecting system reliability.

### [Lenovo][HDE][Avon][Think][OEMQ] How to customize Microsoft Adaptive Brightness curve for BC2

Resolved an issue affecting system reliability.

### [RI-TP] Calling handle succesfully despite access revocation, failing test

Resolved an issue affecting system reliability.

### [RI-TP] Failed SpbTarget::Sequence: SUCCEEDED(VirtualHostControllerDevice::CreateAndInitializeAcpi(hcis, acpiAsl, hcd)) - Value (0x80070102)

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? From recent test failure, it looks like ACPISim is the culprit, but need to add more logging to understand where ...

### [Lenovo][FCCL][Win11][25H2/24H2]USB keyboard and mouse unresponsive in WinRE after Windows 11 24H2/25H2 update (26100.6899 / 26200.6899, KB5066835) (Repro Rate 100%)

Resolved an issue affecting system reliability.

### [USB4] InterdomainRxRing Consumer Index is incorrectly initialized leading to blocked P2P file transfers

Resolved an issue affecting system reliability.

**Fix details:** 
- ## Why is this change being made? The InterdomainRxRing programs the correct starting configuration index into hardware (m_size-1 => 4095) but then...

### [MSFT I3C HCI Driver][STRIX1 I3C][v7] Observed error for HostCancelRead SuperMITT tests error pointing to HostCancelRead transfer completion and improper cancellation handling in driver (SWDEV-559140)

Resolved an issue affecting system reliability.

### Failed ManualBrightnessTests::AutobrightnessEnableDisableTest: IsFalse(display->IsMonitorBrightnessCloseToExpectedLevel(static_cast<BrightnessPercentage>(manualBrightnessSliderStrength)))

Resolved an issue affecting system reliability.

### IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)

Resolved an issue affecting system reliability.

### USB C stopped working after update to Windows 11 25H2

Resolved an issue affecting system reliability.


## For Developers

### API Changes

Please review the work items and pull requests for detailed information about any API changes or new capabilities.

### Work Items Included

- Work Item 18885708: [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0304_REV_0000_FW_300A
- Work Item 38311952: [USB4] [AMD] Lockheed System hangs for ~10 seconds when unplugging a USB4 hub
- Work Item 38541882: [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_15db_REV_0002
- Work Item 38542052: [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ee_REV_0000
- Work Item 38542772: [Watson Failure] caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000
- Work Item 38543421: [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a0ed_REV_0020
- Work Item 38543476: [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43d5_REV_0001
- Work Item 38543735: [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ee_REV_0000
- Work Item 38543947: [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000
- Work Item 38544403: [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_51ed_REV_0001
- Work Item 38544511: [Watson Failure] caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e5_REV_0000
- Work Item 38544534: [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43d5_REV_0001
- Work Item 38544986: [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000
- Work Item 38545118: [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e0_REV_0000
- Work Item 38545492: [Watson Failure] caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13400
- Work Item 38545847: [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1033_DEV_0194_REV_0004_FW_3034
- Work Item 38573466: [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ee_REV_0000
- Work Item 38574581: [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ec_REV_0000
- Work Item 38575295: [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_149c_REV_0000
- Work Item 38576207: [Watson Failure] caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_190826703940
- Work Item 38576442: [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43bc_REV_0002
- Work Item 38577190: [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43d1_REV_0001
- Work Item 38577582: [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e0_REV_0000
- Work Item 38577967: [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13400
- Work Item 38578106: [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15d7_REV_0000
- Work Item 38578205: [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15d7_REV_0000
- Work Item 38581074: [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1912_DEV_0015_REV_0002
- Work Item 38584496: [Watson Failure] caused by LKD_0x144_RESET_RECOVERY_STOP_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600
- Work Item 38584499: [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600
- Work Item 38584505: [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600
- Work Item 38586993: [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ec_REV_0000
- Work Item 38590533: [Watson Failure] caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000
- Work Item 38591458: [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a2af_REV_0000
- Work Item 38592238: [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600
- Work Item 38595306: [Watson Failure] caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000
- Work Item 38598753: [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1912_DEV_0014_REV_0003
- Work Item 38641585: [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000
- Work Item 38695031: [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1042_REV_0000_FW_110930000253
- Work Item 38835374: [Watson Failure] caused by HEAP_CORRUPTION_c0000005_WUDFHost.exe!heap_corruption
- Work Item 38865368: [Watson Failure] caused by HEAP_CORRUPTION_c0000374_WUDFHost.exe!unknown_error_in_process
- Work Item 39093269: [Watson Failure] caused by 0x10D_4_ucx01000!Urb_LegacyTransferUrbCompletion
- Work Item 39159979: HP AMD USB4 High Priority bug - USB4 Domain does not power down due to PCIe root port's power dependency on USB4 
- Work Item 40018120: [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f7_REV_0001
- Work Item 40290466: [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_7a60_REV_0011
- Work Item 43965240: VIA: Custom CL2 Validation Binaries
- Work Item 44043691: [usbxhci] Device disable taking longer than 10mins, causing driver-verifier violation
- Work Item 44301138: [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1912_DEV_0014_REV_0003
- Work Item 46073780: [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15c0_REV_0000
- Work Item 46237325: [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15c1_REV_0000
- Work Item 47145073: [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b6f_DEV_7023_REV_0001_FW_206004F3
- Work Item 47252267: Request for Razer team to provide USB4 HLK logs on SV2 HLK
- Work Item 48522963: !analyze - Bugcheck 0x15F - CONNECTED_STANDBY_WATCHDOG_TIMEOUT_LIVEDUMP - Blames USB4/Tunnel in Nickel and GE+CD branches
- Work Item 49613338: [SC8380 WD 1.0]: (LoadLibrary fails) YB is observed in device manager for Secure ISP driver with Camitto reboot scenario.
- Work Item 50034245: [Watson Failure] caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_SensorsApi.dll!Windows::Internal::GitPtrImpl_Windows::Internal::GitPtr_::Initialize_ISensorEvents_
- Work Item 50929990: [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1b6f_DEV_7023_REV_0001_FW_206004F3
- Work Item 50979834: Continue to drive down the volume of UMDF device driver failures to improve system reliability and performance
- Work Item 51711341: [Samsung][24H2][Sensor] Rotation lock button is disappeared and SensorPresent registry value is changed to '0'
- Work Item 51869293: [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!unknown_function_VEN_1022_DEV_1639_REV_00
- Work Item 51884377: [Watson Failure] caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0D09_REV_0000_FW_330A
- Work Item 52051071: [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_0C27_PID_CCDA_MI_00_IMAGE_hidusb.sys
- Work Item 52268988: [Watson Failure] caused by AV_R_(null)_USBXHCI!Control_WdfEvtIoDefault
- Work Item 52302676: [Watson Failure] caused by 0xCE_IMAGE_ufx01000.sys
- Work Item 53434937: [Watson Failure] caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!unknown_function_VEN_1022_DEV_149C_REV_00
- Work Item 53723445: [Watson Failure] caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_I3cEndToEndTest.dll!Unknown
- Work Item 53948634: [Watson Failure] caused by AV_R_(null)_ucx01000!Urb_ValidatePipeHandle
- Work Item 53953254: [Watson Failure] caused by WRONG_SYMBOLS_ARM64_10.0.25131.1000.arm64fre.rs_prerelease.220527-1351_TIMESTAMP_590920-184823_A8C259F7_nt_wrong_symbols!A8C259F7103F000
- Work Item 54024821: [Watson Failure] caused by LKD_0x144_HOST_SYSTEM_ERROR_USBXHCI!unknown_function_VEN_1022_DEV_43F7_REV_01
- Work Item 54034835: [Buses, Input, & WDF] Bromine Semester Work (2025.04 - 2025.09)
- Work Item 54035434: ------------------------------------------------------ [Buses] Bromine Cutline ------------------------------------------------------
- Work Item 54068565: [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!unknown_function_VEN_1022_DEV_43EE_REV_00
- Work Item 54085600: [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!unknown_function_VEN_1022_DEV_1639_REV_00
- Work Item 54091771: [Watson Failure] caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_UsbHub3!unknown_function
- Work Item 54489919: [I3C] Performance timing throughput lower than expected on AMD Read
- Work Item 54529555: [Huaqin][Lenovo][GHD][Altai][8340]The brightness can't be control by hotkey and OSD,but can change in OS setting. FR:1/200 UUts
- Work Item 54672828: [Watson Failure] caused by CORRUPT_MODULELIST_INVALID_HANDLE_c0000008_WUDFHost.exe!unknown_error_in_process
- Work Item 54956383: [Watson Failure] caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!wil::details_abi::RawUsageIndex::RecordUsageInternal
- Work Item 54975795: [Watson Failure] caused by ACCESS_VIOLATION_1007_Windows.Devices.Sensors.dll!ViewPositionTracker::UnregisterFromDisplayRegionChanges
- Work Item 55188405: [Watson Failure] caused by INVALID_EXCEPTION_HANDLER_c00001a5_SensorsNativeApi.V2.dll!Unloaded
- Work Item 55223326: LENOVO:24H2:PUSH BUTTON RESET: "Turn off my screen when I leave" turned OFF after OS Refresh
- Work Item 55354476: [Lenovo][Aladdin][24H2][HPD][dimming]Adaptive dimming lose function after resume from S4/S5 if set timeout value is “never“ in  system power setting.(FR:3/3units;6/6cycles)
- Work Item 55411096: [Watson Failure] caused by ACCESS_VIOLATION_c0000005_WUDFx02000.dll!FxObjectHandleGetPtr
- Work Item 55450504: [Watson Failure] caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_SensorService.HumanPresenceExtensionManager.FuncTests.dll!Unknown
- Work Item 55581370: Stuck in portrait mode. Sensor not respoding and rotation lock is greyed out in Quick Settings
- Work Item 55603917: [HP][Win11 24H2]:HPD sensor items in "screen ,sleep&hibernate timeouts" automatically became off after did Reset(keep my file).(ARM)
- Work Item 55794227: [Lenovo][24H2][Sensors][LCFC][T14/P14S AMD]The screen will turn off directly without dimming process when "Turn off my screen when I leave" is set to 2 minutes and move away from the unit for 140cm(HPD vendor debug it is OS issue).(FR:2/2 units,3/8 trials
- Work Item 55913260: [Watson Failure] caused by AV_W_(null)_ucx01000!UrbHandler_USBPORTStyle_Legacy_IsochTransfer
- Work Item 56000112: [Hardware Confirmator]The brightness should not increase or decrease accordingly, while trying to change the brightness the slider is at the initial point
- Work Item 56071437: [Dell][Renegade_ARL][Win11_24H2] WD19TBS update NVM FW fail (error code 0x229).
- Work Item 56241741: [I3C] Targets that hot-join should recycle dynamic addresses
- Work Item 56381862: USB ports have incorrect configuration in ACPI
- Work Item 56414704: [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pullrequestloop.c
- Work Item 56414705: [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\readreportloop.c
- Work Item 56495092: [Watson Failure] caused by HEAP_CORRUPTION_ACTIONABLE_Generic_c0000374_WUDFHost.exe!unknown_error_in_process
- Work Item 56626507: [Lenovo Y5x0][LCFC][ARL-HX][RVP][B0] [24H2] XHCI PME_sts bit not be cleared after plug in/out USB keyboard several times in windows and lead system will be auto waked when enter into S3.
- Work Item 56684719: [UMDF-WIFICX][FeatureGap][Intel][WIN11][NetAdapter] Secondary bus reset
- Work Item 56684720: [WIN11][NetAdapter][UMDF] Process dump - No driver logs
- Work Item 56850757: [HLK][Feedback] Questions on Device.DevFund.DriverFramework.UMDF.DMA
- Work Item 56863270: [WinVOS][WinVOSFull]Failed LightSensorTests::ThresholdProperties: AreEqual(sensor->ReportThreshold->Chromaticity.X, chromaticityThreshold.X) - Values (0.000000l, 1.234500l)
- Work Item 56871449: Glymur BU | CRD | Device fails to wake up from sleep mode when using the built-in keyboard or trackpad
- Work Item 56917409: [Diomedes] USB3/USB4 controllers (and a total of 27 devices) are being marked as non cache coherent leading to correctness/functionality/performance issues on N1X
- Work Item 56926164: [Watson Failure] caused by DELPHI_EXCEPTION_eedfade_Toast.exe!unknown_error_in_process
- Work Item 56985893: [USB][Camera] Productize eUSB2 Double-Isoch changes
- Work Item 56997778: 8480_0x0_SNPE - QC controller timed out responding to stop endpoint command
- Work Item 57002423: Support resizing states
- Work Item 57010852: WDF - Migrate the VBscript dependency By Aug 2025
- Work Item 57020598: [Watson Failure] caused by AV_NULL_IP_Wdf01000!FxPkgPnp::m_WdfPowerStates
- Work Item 57044588: [Glymur][SS IOP] [Intermittent] 0x133_SINGLE_DPC_WATCHDOG_TIMEOUT 
- Work Item 57131368: [Watson Failure] caused by APPLICATION_HANG_c0000194_sensrsvc.dll!unknown_error_in_service
- Work Item 57159592: [Dell][Wistron][DiabloARL] BSOD WDF_VIOLATION (10d) occur while run S4 stress (IMAGE_NAME:  USBXHCI.SYS)
- Work Item 57169645: [MSFT I3C HCI Driver][STRIX1 I3C][v5] Observed error for GetStatus and ReducedTransferSpeed SuperMITT tests while running all test in sequence  and error is pointing to frequency is greater than expected frequency (SWDEV-526100)
- Work Item 57175934: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsApi.dll!CSensorV2::_scalar_deleting_destructor_
- Work Item 57211939: [Dell][Wistron][DiabloARL] BSOD SYSTEM_THREAD_EXCEPTION_NOT_HANDLED (7e) occur when system run S4 sresss with connecting dock SD25TB4 (IMAGE_NAME:  USBXHCI.SYS)
- Work Item 57248509: [Lenovo][LCFC][Alloy_Intel_LNL][ThinkPad X9-14]The system display will appear the process of dimming after set to '30s' in Then, turn off my screen after this amount of time option
- Work Item 57289323: [AMD][SHP_SP6][HLK][WIN10]System HLK test "USB Type-C UCM Disable Enable Test" failed due to parameters setting screen not displayed.
- Work Item 57292515: [I3C] Get status IOCTL does not fail when target returns incomplete payload
- Work Item 57344706: [1] [Recovery] Invoke PLDR / FLDR on device crash
- Work Item 57420817: [PTL][PPV] Innodisk USB thumb drive prevent system to enter pkg c-states (implement a SW workaround for Intel Pantherlake systems to enter package C-State when a USB SS device is attached)
- Work Item 57421651: [1] [UMDF DMA] Require ProcessSharingDisabled
- Work Item 57439125: [Compat][Se][BT Speaker]: When connected to Bluetooth device and switching between audio outputs, Audio freezes for a while and resumes after some time
- Work Item 57465349: [KRK2][GNB][Security] Dual camera can't be supported during enrolling facial recognition (Windows Hello) . (SWDEV-531244)
- Work Item 57544549: UcmCx to skip USB host stack loading when port partner claims not usb communication capable
- Work Item 57553891: [Glymur][USB4 IOP][Cert][Topology-54][P1, P2, P3] Observed ping communication failure while transferring files from DUT to MAC
- Work Item 57734810: [Diomedes] DPC Timeout (0x133) bugcheck from nvasd.sys driver
- Work Item 57778671: [Diomedes] 0x7e bugcheck in XHCI filter driver during boot with DP Alt-Mode and USB3 connected to system
- Work Item 57849257: [Watson Failure] caused by SVCHOSTGROUP_Camera_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsNativeApi.V2.dll!_dynamic_initializer_for__g_HistorySubscriberList__
- Work Item 57909081: [I3C] MmTransportPioTx can be torn down before SM processes deinitialize event
- Work Item 57971338: [Watson Failure] caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_IMAGE_serenum.sys
- Work Item 57976511: [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.H_EC._Q79_ACPI_IMAGE_UsbHub3.sys
- Work Item 57988302: [Watson Failure] caused by AV_USBXHCI!UsbDevice_UcxEvtReset
- Work Item 57990286: [VisioPluginForSmfx] Match colors/fonts closer to MagicDraw (for readability and transition ease)
- Work Item 57993572: [Watson Failure] caused by AV_R_iaLPSS2i_I2C!ControllerDoRead
- Work Item 57996291: [Watson Failure] caused by 0x9F_3_epbmtusb_IMAGE_UsbHub3.sys
- Work Item 58002269: [Bug-fix bundle 2025.10] [Input/HID, Low Power Buses and USB] CD bug fix bundle - Reliability and power efficiency improvements that improve product quality and keep rhythm of business costs under check
- Work Item 58007296: [Watson Failure] caused by AV_R_USBXHCI!RootHub_DetectPortInComplianceMode
- Work Item 58016644: [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_0483_PID_A0CB_IMAGE_hidusb.sys
- Work Item 58019358: [Watson Failure] caused by AV_R_(null)_ucx01000!McGenControlCallbackV2
- Work Item 58020449: [Watson Failure] caused by 0x9F_3_athurx_IMAGE_UsbHub3.sys
- Work Item 58021649: [Watson Failure] caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_8d31_REV_0005
- Work Item 58034500: [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1033_DEV_0194_REV_0003
- Work Item 58036210: [Watson Failure] caused by AV_R_(null)_Wdf01000!FxEventQueue::EventQueueWorker
- Work Item 58037044: [Watson Failure] caused by LKD_0x144_RESET_RECOVERY_RESTART_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_NVDA_DEV_8000_REV_0000
- Work Item 58046890: [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!unknown_function_VEN_1912_DEV_0014_REV_03
- Work Item 58048673: [Watson Failure] caused by ACCESS_VIOLATION_c0000005_SensorsNativeApi.V2.dll!Sensors::SimpleDeviceOrientationRpcClient::MemberThreadCallback
- Work Item 58048994: [Watson Failure] caused by AV_R_(null)_usbccgp.sys!Unloaded
- Work Item 58050338: [I3C] IBI DPC not guaranteed to have completed before StopHostControllerInstance() returns
- Work Item 58051034: [Watson Failure] caused by 0xE6_26_i8042prt!I8xReadPortUchar
- Work Item 58052163: [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.EC0._Q0B_ACPI_IMAGE_USBXHCI.SYS
- Work Item 58052835: [Watson Failure] caused by 0xFC_HIDCLASS!WPP_1f4ed73904893c554f67e96aacd5f52a_Traceguids
- Work Item 58053718: [Watson Failure] caused by 0x9F_3_POWER_DOWN_WDF_WAIT_TIMEOUT_BatteryLow_IMAGE_HID_PCI
- Work Item 58058720: [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.ECDV.TMEM._TMP_ACPI_BatteryCritical_IMAGE_UsbHub3.sys
- Work Item 58060161: [Watson Failure] caused by 0x9F_3_AML!_SB.AWAC._STA_ACPI_IMAGE_UsbHub3.sys
- Work Item 58061644: [Watson Failure] caused by 0x133_ISR_HIDPARSE!HidP_GetCollectionDescription
- Work Item 58061755: [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_150707300222
- Work Item 58062697: [Watson Failure] caused by 0x133_ISR_USBXHCI!Controller_UpdateIdleTimeoutOnControllerFDOD0Entry
- Work Item 58064112: [Watson Failure] caused by BREAKPOINT_AVRF_80000003_SensorsNativeApi.V2.dll!Unknown
- Work Item 58064193: [Watson Failure] caused by BREAKPOINT_AVRF_80000003_SensorsV2Clx.E2E.Tests.dll!Unknown
- Work Item 58064997: [Watson Failure] caused by 0x3B_C000001D_WUDFRd!RdFdoDevice::RdIoReply
- Work Item 58065479: [Watson Failure] caused by AV_SynTP_Wdf01000!FxRequestBase::_FxRequestBase
- Work Item 58065786: [Watson Failure] caused by AV_BTHport!SmFx::StateMachineEngine::StateMachineEngineImpl::Deinitialize
- Work Item 58066798: [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_046A_PID_0704_IMAGE_hidusb.sys
- Work Item 58069088: [Watson Failure] caused by 0x133_DPC_USBXHCI_Wdf01000!FxObject::ClearEvtCallbacks
- Work Item 58071255: [Watson Failure] caused by 0x139_0_LEGACY_GS_VIOLATION_mouhid!MouHid_ReadComplete
- Work Item 58071371: [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_05C8_PID_0831_IMAGE_usbccgp.sys
- Work Item 58071375: [Watson Failure] caused by 0x133_ISR_UsbHub3!wil_details_EvaluateFeatureDependencies
- Work Item 58076792: [Watson Failure] caused by 0x133_DPC_usbehci!EHCI_InterruptService
- Work Item 58082995: [Watson Failure] caused by 0x133_ISR_UcmUcsiAcpiClient!UcmUcsiAcpiClient::Ppm::QueryConnectorsAndInitCollection
- Work Item 58084516: [Watson Failure] caused by 0x133_DPC_USBXHCI!RootHub_UcxEvtGetPortStatus
- Work Item 58085955: [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_0990_IMAGE_usbccgp.sys
- Work Item 58089769: [Watson Failure] caused by 0x7E_C000001D_BAD_IP_hidusb!HumPnP
- Work Item 58090796: [Watson Failure] caused by 0x9F_4_USB_rtux64w7_IMAGE_UsbHub3.sys
- Work Item 58103251: [Watson Failure] caused by LKD_0x144_BOOT_DEVICE_FAILED_UsbHub3!HUBMISC_BugcheckSystemOnBootDeviceEnumerationFailure_VID_AA55_PID_0610_REV_6052
- Work Item 58109095: [Watson Failure] caused by 0xFE_BAD_SIGNATURE_USBPORT!USBPORT_TxCsqAcquireLock
- Work Item 58115014: [Diomedes] CAS leading to xHCI YB error
- Work Item 58117716: [Watson Failure] caused by INVALID_PARAMETER_c000000d_SensorsNativeApi.V2.dll!PnpManagerBase::Teardown
- Work Item 58132333: USB4 Bugfixes for 2510
- Work Item 58134113: [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.EC0.SEN2._TMP_ACPI_IMAGE_UsbHub3.sys
- Work Item 58145457: Sensors Bugfixes for 2510
- Work Item 58150716: [Watson Failure] caused by 0x133_DPC_1394ohci!IoWorkers::RemoveIoWorkerFromTransmitList
- Work Item 58156245: [Watson Failure]: Crash caused by AV_W_(null)_USBXHCI!Controller_RaiseAndTrackIrql
- Work Item 58156598: [Watson Failure]: Crash caused by AV_WUDFRd!WdfLpc::ValidateReplyMessage
- Work Item 58159917: [Watson Failure] caused by 0xE6_26_VenId0x8086_DevId0x15EC_USBXHCI!Interrupter_WdfEvtInterruptIsr
- Work Item 58160173: [Watson Failure] caused by 0x9F_3_Nau88L24Rvp_Wdf01000!FxWakeInterruptMachine::Dx
- Work Item 58160310: [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_ISH!unknown_function
- Work Item 58176919: [Watson Failure] caused by 0xFC_usbccgp!_string_
- Work Item 58179052: [Watson Failure]: Crash caused by 0x9F_3_RtkBtfilter_BatteryLow_ExcessiveThreadsWaitingForPageIn_IMAGE_UsbHub3.sys
- Work Item 58182137: [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_151b_REV_0000
- Work Item 58194799: [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_9ded_REV_0011
- Work Item 58194974: [HP][CashmereI][Win11][25H2] The HPD default settings are different between 24H2 and 25H2.
- Work Item 58197475: [Watson Failure]: Crash caused by AV_Wdf01000!FxIoQueue::ProcessPowerEvents
- Work Item 58207911: [I3C] HostController must remain in D0 while Target has non-IBI transfers pending
- Work Item 58213400: [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_IDLE_THREAD_ucx01000!UCX_LockBufferPagesInUrbForDMA
- Work Item 58222676: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_15D2_SUBSYS_8438103C_REV_02_IMAGE_WUDFRd.sys
- Work Item 58251052: [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_LKD_Bluetooth_rtkfilter.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait
- Work Item 58268503: [Watson Failure]: Crash caused by 0x133_ISR_mouclass!MouseClassCreateWaitWakeIrpWorker
- Work Item 58277021: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_WDF_WAIT_TIMEOUT_BatteryCritical_IMAGE_SurfacePowerMeterDriver.sys
- Work Item 58277489: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_ControlLib.dll!destroy_ptd_array
- Work Item 58277626: [Diomedes][From Jade][N1X][Camera] Calling the WinRT sensor API during ADK testing takes a long time.
- Work Item 58280976: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_41E4_PID_2101_MI_00_IMAGE_hidusb.sys
- Work Item 58283088: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000
- Work Item 58290962: [I3C] Pended Async reads to HID target can be completed before a read transfer occurs
- Work Item 58293392: [Diomedes][DIS][MTK 5386532] No USB4 and USB3 enumeration on system boot with USB4 dock connected
- Work Item 58301753: [Watson Failure]: Crash caused by AV_HIDCLASS!HidpFdoSendIdleIrpWorker
- Work Item 58307289: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_04D9_PID_A01C_MI_00_IMAGE_hidusb.sys
- Work Item 58311830: [HP][HDE][CashmereQ][8480] The HPD function cannot be modify via Windows settings.
- Work Item 58344301: [Watson Failure]: Crash caused by LKD_0x144_USB3_WER_BUGCODE_USBXHCI_BAD_SLOTID_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_150319300201
- Work Item 58349496: [Watson Failure]: Crash caused by APPLICATION_HANG_Orphaned_CriticalSection_c0000194_SensorsNativeApi.V2.dll!Unknown
- Work Item 58349579: [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_ExcessiveThreadsWaitingForPageIn_UsbHub3!HUBMISC_WaitForSignal
- Work Item 58355980: [Thinkpad][Lenovo][Curie-2][Win11_24H2]:SUT show BSOD when plug AC into TBT5 port with external monitor connected via HDMI directly/type-c to DP dongle.(FR:4/5 units, 4/25 cycles)
- Work Item 58358956: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!unknown_function_VEN_1022_DEV_15B6_REV_00
- Work Item 58363685: [Watson Failure]: Crash caused by AV_BTHUSB_Wdf01000!FxPowerIdleMachine::ProcessEventLocked
- Work Item 58364479: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxIoQueue::_scalar_deleting_destructor_
- Work Item 58368135: [Watson Failure]: Crash caused by ACCESS_VIOLATION_ab8902b4-09ca-4bb6-b78d-a8f59079a8d5_c0000005_IntelControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape
- Work Item 58390337: [Watson Failure]: Crash caused by 0x3D_C0000005_i8042prt!I8xGetBytePolled
- Work Item 58400097: [HP][HDE][CashmereQ][QC 8480][27871 build][25H2]How to implement with "System do not rotate but keep Accel is reporting to OS on clamshell form factor unit"
- Work Item 58434743: [Watson Failure]: Crash caused by AV_UcmUcsiCx!SmFx::StateMachineEngine::StateMachineEngineImpl::EnqueueEventWithDisposition
- Work Item 58444442: [Watson Failure]: Crash caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_241022B80001
- Work Item 58444832: [Watson Failure]: Crash caused by 0x133_ISR_LEqdUsb!DjChildIdleRequestCancel
- Work Item 58466494: [Acer][OEMQ] Multi-person detection: DUT misidentifies onlooker as main user after main user leaves, leading to privacy concern
- Work Item 58466642: [Acer][OEMQ] Multi-person detection: Privacy concern due to lack of dimming/notification for sideways peeking (as per current design) 
- Work Item 58466643: [Acer][OEMQ] Multi-person detection: The Dismiss button is ineffective
- Work Item 58466644: [Acer][OEMQ] Multi-person detection: No notification triggered when a third person peeks
- Work Item 58466918: [HP][Machu16W][Win11][24H2] Hot-plugging the dock does not display the Slow Charger icon.
- Work Item 58470137: [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_19041.1.amd64fre.vb_release.191206-1406_TIMESTAMP_760316-225129_C7C5BBF1_nt_wrong_symbols!C7C5BBF11046000
- Work Item 58478251: [Watson Failure]: Crash caused by 0x9F_3_BatteryLow_IMAGE_ISH.sys
- Work Item 58483203: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_AML!_SB.PCI0.LPCB.H_EC.BAT0._BST_ACPI_IMAGE_UsbHub3.sys
- Work Item 58483439: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_80000003_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::Transition::TransitionTableImpl::TransitionTableImpl
- Work Item 58490178: [Diomedes] [MTK 5426316]USB3: Halted bit is not set when resuming from low power state leading to yellow bang error/bugcheck on DIS
- Work Item 58492226: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFPlatform.dll!WdfObjectList_WudfLpcMessage,WudfLpcMessageParameters_::_scalar_deleting_destructor_
- Work Item 58498564: [Watson Failure]: Crash caused by AV_i8042prt!I8xReadPortUchar
- Work Item 58513715: [WPG][Desktop][TestReady] - BootMemBrowserLaunch (Improvement) | -176 KB in Metric: ReferenceSet | ge_current_directwinpd_flt.26459.1000.20250725-1800
- Work Item 58526911: [Dell] [Cinnamon Bay MLK 16] Prec. 7680 + WD19DC(S) - dock USB LAN not detected in OS
- Work Item 58544072: [Watson Failure]: Crash caused by AV_WUDFRd!WdfLpcCorePortInterface::DeletePort
- Work Item 58547489: [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pdo.c
- Work Item 58548079: [Watson Failure]: Crash caused by STACK_OVERFLOW_800700a4_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcClient::DeManagementRpcClientImpl::GetIsBrightnessCapable
- Work Item 58590797: [Watson Failure]: Crash caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!unknown_function_VEN_8086_DEV_A71E_REV_00
- Work Item 58638331: TVS: Multiple 28750 Warnings in file: shell\osshell\cpls\ports\ports.c
- Work Item 58639285: [Watson Failure]: Crash caused by 0xFC_Wdf01000!__ImageBase
- Work Item 58639769: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsApi.dll!Microsoft::WRL::ComPtr_IUnknown_::InternalRelease
- Work Item 58640760: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_8086_DEV_7A60_REV_11
- Work Item 58642520: [Watson Failure]: Crash caused by 0x9F_3_BatteryLow_ExcessiveReadyThreads_ProcessorThrottled_IMAGE_USBXHCI.SYS
- Work Item 58648306: [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!TelemetryData_CreateReport_VEN_15ad_DEV_0779_REV_0000
- Work Item 58659380: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalService_ACCESS_VIOLATION_c0000005_WppRecorderUM.dll!WppAutoLogTrace
- Work Item 58662197: [Diomedes][NPF][EEAP | General | Feedback] [WHCP] System.Fundamentals.SystemUSB.USB4.AllTypeCPortsSupportUSB4
- Work Item 58666024: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_10DE_DEV_1ADA_REV_A1
- Work Item 58677409: [Watson Failure]: Crash caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3042_REV_0000
- Work Item 58678952: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_161f_REV_0000
- Work Item 58690834: [Watson Failure]: Crash caused by LKD_0x144_HOST_SYSTEM_ERROR_USBXHCI!unknown_function_VEN_8086_DEV_1E31_REV_04
- Work Item 58695370: [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_IMAGE_qcspi8280.sys
- Work Item 58700111: [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.LPCB.EC0.BAT0._BST_ACPI_ExcessiveReadyThreads_IMAGE_UsbHub3.sys
- Work Item 58704603: [RI-TP] Failed NotificationSettingsTests::CheckRegisteredSystemProviders: IsTrue(IsInList( k_RegisteredSystemApplications, ARRAYSIZE(k_RegisteredSystemApplications), subKeyName)): Windows.SystemToast.PresenceSensing.OnlookerDetection
- Work Item 58709356: [Watson Failure]: Crash caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b6f_DEV_7023_REV_0001_FW_1000020
- Work Item 58709841: [Watson Failure]: Crash caused by 0x13a_11_UsbC_usbccgp!DispatchPdoUrb
- Work Item 58715792: [Watson Failure]: Crash caused by 0x133_ISR_HIDCLASS!HidpFdoAllocCollectionResources
- Work Item 58732184: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_IntelControlLib.dll!CTL_API::_dynamic_initializer_for__WhitelistedApps__
- Work Item 58737845: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_19D1_PID_0001_MI_02_IMAGE_usbser.sys
- Work Item 58742696: [Watson Failure]: Crash caused by 0x35_HIDCLASS!HidpFdoSendDxIrp
- Work Item 58750897: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!ViewPositionChangeNotificationInternal::_ViewPositionChangeNotificationInternal
- Work Item 58752061: [Lenovo][Think][25H2][Onlooker Detection][Presence Sensing] There is no option available for the "Onlooker Detection" feature under Presence Sensing settings page
- Work Item 58762149: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3142_REV_0000_FW_230426702040
- Work Item 58768412: [Watson Failure]: Crash caused by AV_W_(null)_ucx01000!RootHub_Pdo_EvtInternalDeviceControlIrpPreprocessCallback
- Work Item 58768892: [Watson Failure]: Crash caused by 0x1E_C000001D_BAD_IP_USBXHCI!Bulk_MapTransfers
- Work Item 58772218: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_5781_SUBSYS_00008086_REV_84_USB4_MS_CM_IMAGE_Usb4HostRouter.sys
- Work Item 58779050: [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PC00.RP05.PCRP._OFF_ACPI_IMAGE_UsbHub3.sys
- Work Item 58779474: [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_5782_REV_0000
- Work Item 58779862: [Watson Failure]: Crash caused by AV_pmdrvs!unknown_function
- Work Item 58783088: [Watson Failure]: Crash caused by AV_UcmUcsiCx!UcmUcsiCx::CommandHandler::PpmNotificationReceived
- Work Item 58783381: [Watson Failure]: Crash caused by 0xFC_UsbHub3!Feature_BPT_CD_BugFixes_2507__private_featureState__PERF__
- Work Item 58786511: [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.26445.1001.amd64fre.ge_current_directmb2_ens.250704-1100_TIMESTAMP_930605-024533_E8291C4D_nt_wrong_symbols!E8291C4D1451000
- Work Item 58787906: [Watson Failure]: Crash caused by IN_PAGE_ERROR_c0000185_c0000006_WudfPlatform.dll!_string_
- Work Item 58789505: [Watson Failure]: Crash caused by 0x9F_4_sixaxis_IMAGE_UsbHub3.sys
- Work Item 58790067: [Watson Failure]: Crash caused by 0x9F_4_IMAGE_WUDFRd.sys_USB_VID_17E9_PID_6006_MI_00
- Work Item 58791383: USB WMI event telemetry such as overcurrent is no longer available  
- Work Item 58791499: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_367B_PID_1919_IMAGE_hidusb.sys
- Work Item 58807261: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxUsbInterface::_scalar_deleting_destructor_
- Work Item 58808457: [Watson Failure]: Crash caused by APPLICATION_FAULT_c0000194_WinRTSensors.FuncTests.CppCx.dll!unknown_error_in_taef
- Work Item 58810025: [Eco_SR][HLK][CG25][Framework][Lotus+GN22][Win11][24H2_26100] HLK Test failed on USB Secure Camera Controller Dual BDF Test - Compat
- Work Item 58818073: [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_QueryRemoveRelatedDevice_LKD_System_gscheci.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait
- Work Item 58821750: [N1x][Yukon][USB-IF Cert] "Generic USB Hub" of "Satechi Thunderbolt 4 Slim Hub" fails enumeration with Code 43 "Unknown USB Device (Device Descriptor Request Failed)" when TBT3 monitor is connected do
- Work Item 58822618: [Watson Failure]: Crash caused by AV_HPCustomCapDriver_Wdf01000!FxIFR
- Work Item 58824024: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3537_PID_1053_IG_01_IMAGE_hidusb.sys
- Work Item 58825823: [Watson Failure]: Crash caused by CLR_EXCEPTION_System.ComponentModel.Win32Exception_80004005_Compass.exe!Unknown
- Work Item 58840007: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_ACCESS_VIOLATION_c0000005_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease
- Work Item 58841435: [Watson Failure]: Crash caused by 0x133_ISR_usbehci!EHCI_WriteErrorLogEntry
- Work Item 58843430: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BufferOverrun_c0000374_supermittcmd.exe!Unknown
- Work Item 58846454: [Watson Failure]: Crash caused by AV_msisadrv_Wdf01000!FxSystemThread::Thread
- Work Item 58852502: [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!unknown_function_VEN_QCOM_DEV_0D08
- Work Item 58865748: [Lenovo][LCFC][Sydney2]BSOD 0x133(i8042prt.sys) during s0i3 stress test - excessive keyboard interrupts and polling time for the status byte
- Work Item 58918306: [Watson Failure]: Crash caused by 0x10D_4_UcmCx!unknown_function
- Work Item 58926430: [Watson Failure]: Crash caused by AV_W_(null)_ucx01000!UrbHandler_USBPORTStyle_Legacy_BulkOrInterruptTransfer
- Work Item 58927141: [Watson Failure]: Crash caused by AV_R_(null)_UsbHub3!McGenControlCallbackV2
- Work Item 58928578: Lenovo:LCFC:25H2_Upgrade:"Turn off my screen when I leave" and "Wake my device when I approach" are OFF even if Turn on in OOBE Privacy setting page.(FR:2/2 units,2/2 cycles)
- Work Item 58941465: [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_LKD_Keyboard_keyboard.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait
- Work Item 58943336: [Dynabook]The USB xHCI driver will shows YB after add the hash code into sdev table, and camera device disappear.
- Work Item 58944764: [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_22621.1.amd64fre.ni_release.220506-1250_TIMESTAMP_320527-161724_7560F114_nt_wrong_symbols!7560F1141047000
- Work Item 58945884: [Watson Failure]: Crash caused by 0xCE_IMAGE_i8042prt.sys
- Work Item 58946043: [Watson Failure]: Crash caused by 0x9F_4_HIDCLASS!HidpCallDriverSynchronous
- Work Item 58949309: [Arm64][Compat][CRD][Device][keyboard][Inconsistent]: Keyboard not working inconsistently in Device.
- Work Item 58951279: [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::LightSensorFactory::GetDefault
- Work Item 58954870: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_190502701041
- Work Item 58955508: [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_150707301100
- Work Item 58966054: [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_USBXHCI!Control_WdfEvtIoDefault
- Work Item 58967417: [Watson Failure]: Crash caused by 0x133_DPC_USBXHCI!Bulk_EvtDmaCallback
- Work Item 58968834: [Lenovo][LCFC][24H2][USB]:Question:system showing USB 3.2 on spec sheet but USB 3.10 found in Device Manager
- Work Item 58970168: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e47d_REV_0000
- Work Item 58971768: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1343_REV_0000_FW_151015300401
- Work Item 58972481: [Watson Failure]: Crash caused by AV_W_(null)_ucx01000!UrbHandler_Legacy_ControlTransfer
- Work Item 58980242: [Watson Failure]: Crash caused by 0x133_ISR_UsbHub3!TlgRegisterAggregateProvider
- Work Item 58981543: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_241022B80001
- Work Item 58981887: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease
- Work Item 58982737: [ASUS][PC] Regkey of "IsAdaptiveColorOnByDefault" doesn't work
- Work Item 58983438: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BufferOverrun_c0000374_i3cendtoendtest.dll!Unknown
- Work Item 58984910: [ASUS][PC][OEMQ] How to enable "Sensors: Adaptive Brightness is on by default" to meet requirment of CER Premium Display
- Work Item 58987739: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0489_PID_E10A_IMAGE_btfilter.sys
- Work Item 58991080: [Watson Failure]: Crash caused by 0x133_ISR_kbdclass!KeyboardClassCreateWaitWakeIrpWorker
- Work Item 58991557: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_USBXHCI!Register_ControllerStop
- Work Item 58994893: [Watson Failure]: Crash caused by VERIFIER_STOP_00000900_LEAK_AVRF_80000003_SmFxEngineUmTests.dll!Unloaded
- Work Item 58997584: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_19F7_PID_0054_MI_02_IMAGE_hidusb.sys
- Work Item 58997638: [Watson Failure]: Crash caused by AV_Wdf01000!FxUsbDeviceControlContext::ReleaseAndRestore
- Work Item 58998000: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxNonPagedObject::_scalar_deleting_destructor_
- Work Item 58998048: [Watson Failure]: Crash caused by 0x9F_4_USB_rtump62x64_IMAGE_UsbHub3.sys
- Work Item 58998295: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0F8B_REV_0000_FW_3130
- Work Item 58999573: [Watson Failure]: Crash caused by APPLICATION_HANG_cfffffff_Windows.Graphics.Display.BrightnessOverride.dll!Unknown
- Work Item 59000530: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_181004700240
- Work Item 59001651: [Watson Failure]: Crash caused by AV_USBXHCI!Control_EP_StopMapping
- Work Item 59003488: [Watson Failure]: Crash caused by BREAKPOINT_80000003_WUDFx02000.dll!guard_dispatch_icall$thunk$10345483385596137414
- Work Item 59004915: [Watson Failure]: Crash caused by 0xE6_27_SpbCx!CFxObject_WDFREQUEST___*,CScxRequest,_GetRequestFromFxRequest,1_::_OnCleanup
- Work Item 59005071: [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_IntelControlLib.dll!CTL_API::OSDisplayOutput::create
- Work Item 59007144: [Watson Failure]: Crash caused by 0x9F_4_IMAGE_serenum.sys
- Work Item 59008053: [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ActivitySensorServer::get_ActiveInLowPowerMode
- Work Item 59008115: [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::GfxHandler::getDisplayOutputProperties
- Work Item 59009815: [Watson Failure]: Crash caused by 0x9F_3_usbccgp_ExcessiveThreadsWaitingForPageIn_IMAGE_UsbHub3.sys
- Work Item 59011029: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalService_ACCESS_VIOLATION_c0000005_Microsoft.Bluetooth.Service.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::_StateMachineEngineImpl
- Work Item 59011230: [Diomedes][N1x][Yukon][USB-IF Cert][JEDI Action] There is a15 Second Refresh Delay for USB4 Hub to disappear from Device Manager after Hot Plugging from N1x Yukon System USB-C ports.
- Work Item 59011231: [N1x][Yukon][USB-IF Cert][JEDIAction] There is a15 Second Refresh Delay for USB-C Monitor Connected to USB4 Hub to disappear from Device Manager after Hot Plugging from N1x Yukon System [Intermittent]
- Work Item 59015301: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFHost.exe!wil::details_abi::SubscriptionList::OnSignaled
- Work Item 59015457: [Watson Failure]: Crash caused by AV_HIDCLASS!HidpCollectionFreeUnreadReports
- Work Item 59016101: [Watson Failure]: Crash caused by AV_W_(null)_USBXHCI!McTemplateK0pquuqqqqqqsssxqqqttqqqqtxxqqqqqqqqqqnn_EtwWriteTransfer
- Work Item 59017246: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0D28_PID_0204_MI_00_IMAGE_hidusb.sys
- Work Item 59022098: [Watson Failure]: Crash caused by 0xC7_Wdf01000!unknown_function
- Work Item 59022943: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e431_REV_0000
- Work Item 59022948: [Watson Failure]: Crash caused by 0xFC_WDFLDR!__guard_fids_table
- Work Item 59023667: [Watson Failure]: Crash caused by 0x10D_4_ucx01000!RootHub_Pdo_EvtInternalDeviceControlIrpPreprocessCallback
- Work Item 59024761: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3142_REV_0000_FW_17072470F220
- Work Item 59026300: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_51ED_SUBSYS_0BBA1028_REV_01_IMAGE_USBXHCI.SYS
- Work Item 59026925: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e431_REV_0000
- Work Item 59026926: [Watson Failure]: Crash caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e431_REV_0000
- Work Item 59027681: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_USBMidi2_IMAGE_UsbHub3.sys
- Work Item 59028543: [Watson Failure]: Crash caused by 0x7f_8_UsbHub3!HUBHTX_Get20PortChangeEvent
- Work Item 59030669: [Watson Failure]: Crash caused by 0xE6_27_SpbCx!CScxRequest::BuildMdlForBufferEntry
- Work Item 59032279: [Watson Failure]: Crash caused by 0x9F_3_SETPOWER_rtwlanu7_BatteryCritical_IMAGE_UsbHub3.sys
- Work Item 59033931: [Watson Failure]: Crash caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e47d_REV_0000
- Work Item 59035384: [Watson Failure]: Crash caused by 0xF7_THREE_BIT_MATCHED_FRAME_COOKIE_Wdf01000!imp_WdfIoTargetSendInternalIoctlOthersSynchronously
- Work Item 59036210: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!unknown_function_VEN_8086_DEV_A12F_REV_31
- Work Item 59037101: [Watson Failure]: Crash caused by 0x7E_C000001D_BAD_IP_USBXHCI!TelemetryData_CreateReport
- Work Item 59037750: [Watson Failure]: Crash caused by FAIL_FAST_INVALID_NEXT_THREAD_c0000409_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs
- Work Item 59037937: [Watson Failure]: Crash caused by 0xE6_27_SpbCx!CScxRequest::CaptureFxRequest
- Work Item 59039398: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFx.dll!__native_dllmain_reason
- Work Item 59040796: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::ExtractAccelerometerVector
- Work Item 59040814: [Watson Failure]: Crash caused by 0x9F_4_PCQ_ERROR_IMAGE_usbhub.sys
- Work Item 59041258: [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.27911.1000.amd64fre.rs_wsd_cfe.250724-1702_TIMESTAMP_341009-072012_79D4D4AC_nt_wrong_symbols!79D4D4AC1459000
- Work Item 59042444: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcClient::DeManagementRpcClientAdapterImpl::OpenFromMonitorId
- Work Item 59042993: [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_USBXHCI!Control_Transfer_CompleteCancelable
- Work Item 59044638: [Watson Failure]: Crash caused by LKD_0x144_UNHANDLED_TRANSFER_EVENT_TRB_COMPLETION_CODE_USBXHCI!unknown_function_VEN_8086_DEV_22B5_REV_36
- Work Item 59044828: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_ETWCALLBACK_c0000005_hidserv.dll!unknown_error_in_service
- Work Item 59046046: [Watson Failure]: Crash caused by CLR_EXCEPTION_System.Xaml.XamlObjectWriterException_80131500_Compass.exe!unknown_function
- Work Item 59047173: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_RESET_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a12f_REV_0031
- Work Item 59047271: [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_WUDFx02000.dll!FxIoTarget::_RequestCompletionRoutine
- Work Item 59047313: [Watson Failure]: Crash caused by 0x0_ucx01000!Urb_USBPORTStyle_ProcessURB
- Work Item 59048213: [Watson Failure]: Crash caused by LKD_0x144_HOST_SYSTEM_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a71e_REV_0000
- Work Item 59048300: [Watson Failure]: Crash caused by 0xc2_99_WDFLDR!DereferenceVersion
- Work Item 59048329: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx.dll!FxCmResList::_scalar_deleting_destructor_
- Work Item 59048362: [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!CTL_API::WDDMInterface::GetDeviceAdapters
- Work Item 59048421: [Watson Failure]: Crash caused by 0x133_ISR_IMAGE_usbehci.sys
- Work Item 59049488: [Watson Failure]: Crash caused by 0x133_ISR_hidi2c!wil_details_EvaluateFeatureDependencies
- Work Item 59051767: [Watson Failure]: Crash caused by 0xc2_d_USBXHCI!unknown_function
- Work Item 59052344: [Watson Failure]: Crash caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0CA1_REV_0000_FW_3130
- Work Item 59052575: [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_hidi2c!OnInternalDeviceIoControl
- Work Item 59052801: [Watson Failure]: Crash caused by FATAL_USER_CALLBACK_EXCEPTION_c000041d_WUDFx02000.dll!FxObjectHandleAlloc2
- Work Item 59052879: [Watson Failure]: Crash caused by 0x9F_4_USB_Wdf01000!FxIoQueue::StartPowerTransitionOff
- Work Item 59053603: [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_ucx01000.sys!Unloaded
- Work Item 59053801: [Watson Failure]: Crash caused by AV_HIDCLASS!Feature_SPR_HardenInClient__private_IsEnabledDeviceUsageNoInline
- Work Item 59053956: [Watson Failure]: Crash caused by BREAKPOINT_80000003_Windows.Devices.Sensors.dll!__scrt_initialize_crt
- Work Item 59053991: [Watson Failure]: Crash caused by SVCHOSTGROUP_netsvcs_BREAKPOINT_80000003_Windows.Devices.Sensors.dll!__scrt_initialize_crt
- Work Item 59054363: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_0849_IMAGE_UsbHub3.sys
- Work Item 59055079: [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GP17.ACP._PS0_ACPI_IMAGE_UsbHub3.sys
- Work Item 59055377: [Watson Failure]: Crash caused by AV_MEIx64_Wdf01000!FxPkgGeneral::OnCleanup
- Work Item 59055771: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_5782_SUBSYS_00000000_REV_00_IMAGE_USBXHCI.SYS
- Work Item 59056336: [Watson Failure]: Crash caused by 0xFC_USBXHCI_Wdf01000!FxRequest::Release
- Work Item 59056897: [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.29439.1000.amd64fre.rs_es_lego.250830-1500_TIMESTAMP_950712-152247_3003E8C7_nt_wrong_symbols!3003E8C71459000
- Work Item 59059458: [Watson Failure]: Crash caused by 0x1AA_HIDPARSE!HidP_TranslateUsageAndPagesToI8042ScanCodes
- Work Item 59059708: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0482_PID_5752_IMAGE_hidusb.sys
- Work Item 59059758: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsApi.dll!wil::details::functor_wrapper_void__lambda_65197f76560d04008ad318197229ec2e___::Run
- Work Item 59060418: [Watson Failure]: Crash caused by 0xc2_99_usbccgp!unknown_function
- Work Item 59060551: [Watson Failure]: Crash caused by AV_Wdf01000_fffff800798b0000!unknown_function
- Work Item 59060557: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0451_PID_8442_IMAGE_UsbHub3.sys
- Work Item 59061191: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_145F_PID_02FC_MI_00_IMAGE_hidusb.sys
- Work Item 59061794: [Watson Failure]: Crash caused by AV_CODE_AV_BAD_IP_Wdf01000!FxTimer::TimerHandler
- Work Item 59062563: [Watson Failure]: Crash caused by SVCHOSTGROUP_CameraMonitor_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_IntelControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape
- Work Item 59063429: [Watson Failure]: Crash caused by AV_W_(null)_Wdf01000!FxWorkItem::WorkItemThunk
- Work Item 59066512: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_sensrsvc.dll!CSensorEnsemble::SetISensor
- Work Item 59066790: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000
- Work Item 59067386: [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_IntelControlLib.dll!CTL_API::GfxHandler::_GfxHandler
- Work Item 59067750: [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!unknown_function_VEN_1B21_DEV_3241_REV_00
- Work Item 59067751: [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!unknown_function_VEN_1B21_DEV_3241_REV_00
- Work Item 59067987: [Watson Failure]: Crash caused by 0x7E_C000001D_BthLEEnum_BAD_IP_Wdf01000!FxIoQueue::QueuePurge
- Work Item 59068564: [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs
- Work Item 59068724: [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f9_REV_0001
- Work Item 59068739: [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f9_REV_0001
- Work Item 59068985: [Watson Failure]: Crash caused by CORRUPT_MODULELIST_ACCESS_VIOLATION_c0000005_IntelControlLib.dll!Unloaded
- Work Item 59069327: [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!CTL_API::KmdSysManager::requestSingle
- Work Item 59070975: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3151_PID_3022_MI_00_IMAGE_hidusb.sys
- Work Item 59071355: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!CTL_API::DisplayOutputImp::_vector_deleting_destructor_
- Work Item 59071396: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_usbview.exe!DisplayHidDescriptor
- Work Item 59071537: [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_wdfkd.dll!DumpFxUsbPipe
- Work Item 59074409: [Watson Failure]: Crash caused by AV_hidi2c!HidSetReport
- Work Item 59074877: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_1D57_PID_FA65_MI_00_IMAGE_hidusb.sys
- Work Item 59075347: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!__acrt_LCMapStringA_stat
- Work Item 59075352: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2972_PID_0088_REV_0132_MI_03_IMAGE_hidusb.sys
- Work Item 59075584: [Watson Failure]: Crash caused by 0x1CA_USBXHCI!Isoch_Stage_CompleteTD
- Work Item 59077568: [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_Windows.Devices.Sensors.dll!wil::details::ResultFromCaughtExceptionInternal
- Work Item 59077612: [Watson Failure]: Crash caused by 0x1a_4477_ucx01000!UcxEndpointStateEntryFunc_DeletingStale
- Work Item 59077656: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_EntryCorruption_c0000374_WUDFx02000.dll!FxSystemWorkItem::_scalar_deleting_destructor_
- Work Item 59078260: [Watson Failure]: Crash caused by 0x3D_C0000005_USBXHCI!unknown_function
- Work Item 59078390: [Watson Failure]: Crash caused by AV_W_(null)_mouhid!MouHid_ReadComplete
- Work Item 59079388: [Watson Failure]: Crash caused by 0x3B_80000003_VRF_i3chost!Target::EvtIoDefault
- Work Item 59082306: [Watson Failure]: Crash caused by 0x9F_3_BatteryLow_IMAGE_usbser.sys
- Work Item 59084509: [Watson Failure]: Crash caused by 0x1C8_PNP_ActivePnpThread_Blocked_On_nvasd_Wdf01000!FxIoQueue::StartPowerTransitionOff
- Work Item 59086243: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f9_REV_0001
- Work Item 59086325: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BlockNotBusy_DOUBLE_FREE_c0000374_MuttUtil.dll!CWinUsbDevice::_CWinUsbDevice
- Work Item 59086352: [Watson Failure]: Crash caused by 0x7f_8_asmthub3!unknown_function
- Work Item 59087382: [Watson Failure]: Crash caused by INVALID_EXCEPTION_HANDLER_c00001a5_hid.dll!HidD_GetPreparsedData
- Work Item 59087383: [Watson Failure]: Crash caused by FAIL_FAST_INVALID_EXCEPTION_CHAIN_c0000409_hid.dll!HidD_GetPreparsedData
- Work Item 59087393: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_240321B80001
- Work Item 59087627: [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_WUDFRd!RdUsbPkg::UsbControlTransferASync
- Work Item 59087804: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::CustomPropertiesMapServer::_CustomPropertiesMapServer
- Work Item 59087848: [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_cfffffff_IntelControlLib.dll!create_environment_char_
- Work Item 59088252: [Watson Failure]: Crash caused by AV_UsbHub3!HUBHTX_GetHubStatusUsingControlTransfer
- Work Item 59088527: [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_serial!SerialIoCallDriver
- Work Item 59089167: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_c0000005_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcServer::DeManagementRpcServerImpl::Remove
- Work Item 59089792: [Watson Failure]: Crash caused by 0xFC_kbdhid!wil_details_PopulateInitialConfiguredFeatureStates
- Work Item 59090404: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_1022_DEV_15B8_REV_00
- Work Item 59090848: [Watson Failure]: Crash caused by CLR_EXCEPTION_System.Runtime.InteropServices.ExternalException_800401d0_USB.exe!Unknown
- Work Item 59090892: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxUsbPipe::_scalar_deleting_destructor_
- Work Item 59092470: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e37d_REV_0000
- Work Item 59094766: [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_IntelControlLib.dll!CTL_API::OverclockManager::InitOcManager
- Work Item 59099218: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_248B_PID_8100_MI_00_IMAGE_hidusb.sys
- Work Item 59099754: [Watson Failure]: Crash caused by FAIL_FAST_POINTER_AUTH_INVALID_RETURN_ADDRESS_c0000409_winusb.dll!WinUsb_AbortPipeAsync
- Work Item 59100482: [Watson Failure]: Crash caused by 0xE6_26_USBXHCI!Isoch_Stage_CompleteTD
- Work Item 59103920: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_rcusbwdm_IMAGE_UsbHub3.sys
- Work Item 59104056: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7EC0_SUBSYS_00000000_REV_10_IMAGE_USBXHCI.SYS
- Work Item 59104065: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_318C_SUBSYS_87F9103C_REV_06
- Work Item 59110096: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_8086_DEV_51ED_REV_01
- Work Item 59111944: [Watson Failure]: Crash caused by AV_W_usbccgp!CheckParentIdleDpc
- Work Item 59113281: [Watson Failure]: Crash caused by 0x133_DPC_HIDCLASS!GetCollectionDesc
- Work Item 59117203: [Watson Failure]: Crash caused by 0x133_DPC_usbehci!EHCI_RH_PortResumeComplete
- Work Item 59117235: [Watson Failure]: Crash caused by 0x133_VRF_DPC_USBXHCI!Isoch_RetrieveNextStage
- Work Item 59118945: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_FFCA_PID_0125_MI_00_IMAGE_usbser.sys
- Work Item 59118970: [Watson Failure]: Crash caused by 0x9F_VRFK_4_HID_WUDFRd_IMAGE_mshidkmdf.sys
- Work Item 59119435: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_19D2_PID_1403_IMAGE_usbccgp.sys
- Work Item 59120105: [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_hidi3ctest.dll!unknown_error_in_taef
- Work Item 59120177: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsApi.dll!SensorCloseCOM
- Work Item 59120189: [Watson Failure]: Crash caused by 0x13a_8_XHCW_Wdf01000!unknown_function
- Work Item 59120348: [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000096_IntelControlLib.dll!CTL_API::_dynamic_atexit_destructor_for__OSDllsobj__
- Work Item 59121591: [Watson Failure]: Crash caused by CLR_EXCEPTION_80070005_sensordiagnostictool.exe!unknown_function
- Work Item 59122071: [Watson Failure]: Crash caused by AV_NULL_IP_USBXHCI!Controller_WdfEvtPreprocessSetPowerIrp
- Work Item 59122716: [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_ControlLib.dll!GetRuntimeLib
- Work Item 59122721: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_046A_PID_01DE_MI_00_IMAGE_hidusb.sys
- Work Item 59122894: [Watson Failure]: Crash caused by 0x133_DPC_WUDFRd!WudfPeriodicTimer::TimerDpc
- Work Item 59124058: [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\control.cpp
- Work Item 59124059: [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\fdoio.cpp
- Work Item 59124060: [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\probe.c
- Work Item 59124062: [UMA] Usermode accesses found in onecore\drivers\input\hid\hidcore\hidclass\util.c
- Work Item 59124489: [Watson Failure]: Crash caused by 0x133_DPC_kbdhid!unknown_function
- Work Item 59125368: [Watson Failure]: Crash caused by 0x9F_3_SurfaceSerialHubDriver_Wdf01000!FxSystemWorkItem::WaitForExit
- Work Item 59125557: [Watson Failure]: Crash caused by 0x9F_4_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_7D03_SUBSYS_207A1EE7_REV_05
- Work Item 59126154: [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!unknown_function_VEN_1022_DEV_15C1_REV_00
- Work Item 59127558: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ILLEGAL_INSTRUCTION_c000001d_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Bluetooth::Foundation::TokenWithStatusControl_Microsoft::Windows::DisplayEnhanceme
- Work Item 59129002: [Watson Failure]: Crash caused by 0x18_WinUSB!WinUSB_ReadPipeCompletion
- Work Item 59129643: [Watson Failure]: Crash caused by 0x1E_C000001D_BAD_IP_usbccgp!CheckParentIdleWorker
- Work Item 59131942: [Watson Failure]: Crash caused by 0x139_39_USBXHCI!WPP_0e51d3b82fdb347dedaae242937bad3f_Traceguids
- Work Item 59132320: [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_cfffffff_SensorsApi.dll!SimpleDeviceOrientationSensor::SetEventSink
- Work Item 59132445: [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_INTERRUPTS_DISABLED_i8042prt!I8xReadPortUchar
- Work Item 59134047: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_VERIFIER_STOP_AVRF_c0000421_sensorservice.dll!ExternalDisplayConnectedNotifications::OnDisplayAdded
- Work Item 59134115: [Watson Failure]: Crash caused by AV_BTHUSB_Wdf01000!FxPkgIo::StopProcessingForPower
- Work Item 59134352: [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_WUDFx02000.dll!FxMemoryObject::Release
- Work Item 59134822: [Watson Failure]: Crash caused by 0xE6_27_VenId0x1B21_DevId0x2142_IMAGE_USBXHCI.sys
- Work Item 59135006: [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_BTHUSB_Wdf01000!FxPowerDeviceDisarmWakeFromS0::InvokeClient
- Work Item 59135086: [Watson Failure]: Crash caused by 0x133_DPC_ucx01000!McGenEventWrite_EtwWriteTransfer
- Work Item 59135635: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!unknown_function_VEN_8086_DEV_15E9_REV_06
- Work Item 59135751: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0B05_PID_1898_MI_00_IMAGE_hidusb.sys
- Work Item 59136122: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0B05_PID_1956_IMAGE_usbccgp.sys
- Work Item 59136165: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7EC0_SUBSYS_72708086_REV_10_IMAGE_USBXHCI.SYS
- Work Item 59136238: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_rtu56cx21x64_IMAGE_UsbHub3.sys
- Work Item 59136303: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2D99_PID_A047_MI_02_IMAGE_hidusb.sys
- Work Item 59136307: [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!wil::details::FeatureImpl___WilFeatureTraits_Feature_TestConfNum_::GetCachedFeatureEnabledState
- Work Item 59136498: [Watson Failure]: Crash caused by APPLICATION_HANG_XPROC_BusyHang_cfffffff_Windows.Graphics.Display.BrightnessOverride.dll!GetForWindowCommon
- Work Item 59136802: [Watson Failure]: Crash caused by AV_R_(null)_ucx01000!UrbHandler_USBPORTStyle_Legacy_IsochTransfer
- Work Item 59136936: [Watson Failure]: Crash caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15c3_REV_0000
- Work Item 59137206: [Watson Failure]: Crash caused by 0x10D_7_USBXHCI_Wdf01000!FxVerifierBugCheckWorker
- Work Item 59137267: [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_PRERESET_IDLE_THREAD_INTERRUPTS_DISABLED_USBXHCI!Bulk_ProcessTransferEventWithED1
- Work Item 59137924: [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_Windows.Devices.Sensors.dll!_dynamic_atexit_destructor_for___AtlModule__
- Work Item 59138194: [Watson Failure]: Crash caused by AV_CODE_AV_BAD_IP_Wdf01000!FxFreeToNPagedLookasideList
- Work Item 59138315: [Watson Failure]: Crash caused by AV_WpdUpFltr_Wdf01000!FxIoTarget::Dispose
- Work Item 59138725: [Watson Failure]: Crash caused by 0x133_ISR_UsbHub3!WMI_RegisterHub
- Work Item 59139341: [Watson Failure]: Crash caused by 0x1E_C000001D_BAD_IP_WinUSB!WinUSB_ReadPipeCompletion
- Work Item 59139614: [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_0b27_REV_0003
- Work Item 59139656: [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_serial!SerialStartDevice
- Work Item 59140524: [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_170214500200
- Work Item 59140525: [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_STOP_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_170214500200
- Work Item 59140585: [Watson Failure]: Crash caused by AV_AcerAirplaneModeController!unknown_function
- Work Item 59141775: [Watson Failure]: Crash caused by HUP_BUGCHECK_DISPLAY_INVALID_GAIN_MAP_BLOB_HL_2_FormFactor_HPUv2_F154002D_WUDFHost.exe!unknown_error_in_process
- Work Item 59141801: [Watson Failure]: Crash caused by SVCHOSTGROUP_CameraMonitor_ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::TransformSensorReading_enum_Windows::Devices::Sensors::SimpleOrientation_
- Work Item 59142620: [Watson Failure]: Crash caused by AV_W_(null)_WUDFRd!WdfLpcCorePortInterface::CreateResourceReserve
- Work Item 59142741: [Watson Failure]: Crash caused by IN_PAGE_ERROR_services.exe_BUGCHECK_CRITICAL_PROCESS_IOERR_WudfPlatform!McGenControlCallbackV2
- Work Item 59142760: [Watson Failure]: Crash caused by IN_PAGE_ERROR_c0000242_ETWCALLBACK_UNLOADED_c0000006_WudfPlatform.dll!McGenControlCallbackV2_{2e35aaeb-857f-4beb-a418-2e6c0e54d988}
- Work Item 59142958: [I3C] WDFDEVICE & Queue handles in Target context are overwritten before ReleaseHardware of old PDO on re-enumeration
- Work Item 59143490: [Watson Failure]: Crash caused by STACK_BUFFER_OVERRUN_MATCHED_FRAME_COOKIE_GeneStor_Wdf01000!FxPkgPnp::PowerPolicyProcessEventInner
- Work Item 59143535: [Watson Failure]: Crash caused by 0x9F_4_USB_IMAGE_WUDFRd.sys_USB_VID_05E3_PID_0758_MI_01
- Work Item 59143604: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFHost.exe!CWudfModuleInfo::Release
- Work Item 59144274: [Watson Failure]: Crash caused by 0x133_ISR_usbccgp!UsbcCompleteIrp
- Work Item 59144287: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalService_ACCESS_VIOLATION_c0000005_Microsoft.Bluetooth.Service.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::ProcessEventQueue
- Work Item 59144483: [Watson Failure]: Crash caused by 0xa0_614_hidi2c!OnInterruptDpc
- Work Item 59144651: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!unknown_function_VEN_1022_DEV_145F_REV_00
- Work Item 59144774: [Watson Failure]: Crash caused by AV_HDAudBus!FxStubDriverUnloadCommon
- Work Item 59144999: [Watson Failure]: Crash caused by 0xFC_UsbHub3!DsmStateEntryUnConfiguredInD0
- Work Item 59145833: [Watson Failure]: Crash caused by 0x9F_4_ctpdusbx_IMAGE_UsbHub3.sys
- Work Item 59146574: [Watson Failure]: Crash caused by APPLICATION_HANG_ENDTASK_HungThreadIsIdle_cfffffff_pc.exe!Unknown
- Work Item 59146931: [Watson Failure]: Crash caused by 0xE6_26_USBXHCI!Interrupter_DeferredWorkProcessor
- Work Item 59146935: [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_Wdf01000!WPP_FxIoQueue_cpp_Traceguids
- Work Item 59148316: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Graphics.Display.DisplayEnhancementOverride.dll!Microsoft::WRL::Details::DelegateArgTraits_long_
- Work Item 59148554: [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_usbser!UsbSerEvtDeviceSelfManagedIoFlush
- Work Item 59148806: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ILLEGAL_INSTRUCTION_c000001d_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::Coordinator::DeRequestCoordinatorImpl::SelectHighestT
- Work Item 59149102: [Watson Failure]: Crash caused by DISABLED_INTERRUPT_FAULT_SpbCx!McTemplateK0zq_EtwWriteTransfer
- Work Item 59149818: [Watson Failure]: Crash caused by 0xc2_e_WinUsb!WinUSB_ControlTransfer
- Work Item 59150698: [Watson Failure]: Crash caused by 0x139_MATCHED_FRAME_COOKIE_UsbHub3!HUBREG_QueryUxdDeviceKey
- Work Item 59151961: [Watson Failure]: Crash caused by INVALID_HANDLE_AVRF_c0000008_WUDFx02000.dll!FxWorkItem::_FxWorkItem
- Work Item 59152820: [Watson Failure]: Crash caused by STACK_BUFFER_OVERRUN_MISMATCH_GSCOOKIE_GeneStor_Wdf01000!FxPkgPnp::PowerPolicyProcessEventInner
- Work Item 59153141: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_RESET_USBXHCI!unknown_function_VEN_1022_DEV_43BC_REV_02
- Work Item 59153504: [Watson Failure]: Crash caused by AV_CODE_AV_PAGED_IP_amdppm!ProcessSystemSleepStateNotify
- Work Item 59153767: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_171102701500
- Work Item 59155561: [Watson Failure]: Crash caused by SVCHOSTGROUP_Camera_ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::GetDataOrientation
- Work Item 59155601: [Watson Failure]: Crash caused by APPLICATION_HANG_ENDTASK_BlockedOn_DeviceIO_cfffffff_winusb.dll!WinUsb_ReadPipe
- Work Item 59155634: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_rtwlanu_BatteryLow_IMAGE_UsbHub3.sys
- Work Item 59156862: [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!ctlInit
- Work Item 59156902: [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.27943.1000.amd64fre.br_release_sigma_dev.250907-1700_TIMESTAMP_550225-121710_A02AF846_nt_wrong_symbols!A02AF8461459000
- Work Item 59158138: [Watson Failure]: Crash caused by AV_USBXHCI!Controller_WdfEvtDeviceFilterRemoveResourceRequirements
- Work Item 59158769: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_16c3_DEV_abcf_REV_000b
- Work Item 59158864: [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_RESET_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_16c3_DEV_abcf_REV_000b
- Work Item 59161933: [Watson Failure]: Crash caused by 0x1D5_udecx!Controller_WdfDeviceRetrieveAcpiDataSynchronously
- Work Item 59162549: [Watson Failure]: Crash caused by BREAKPOINT_80000003_echoapp.exe!Unknown
- Work Item 59163534: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_1022_DEV_1639_SUBSYS_1319152D_REV_00_IMAGE_USBXHCI.SYS
- Work Item 59164503: [Watson Failure]: Crash caused by 0x9F_3_CvfUsbBridge_IMAGE_UsbHub3.sys
- Work Item 59164759: [Watson Failure]: Crash caused by 0x1E_C0000096_USBXHCI!Controller_LowerAndTrackIrql
- Work Item 59165469: [Watson Failure]: Crash caused by 0x1E_C0000096_USBXHCI!Isoch_PrepareStage
- Work Item 59165909: [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::CreateActivationFactory_Windows::Devices::Sensors::HingeAngleSensorFactory_
- Work Item 59166022: [Watson Failure]: Crash caused by 0x133_ISR_HIDCLASS!HidpFdoSendDxIrp
- Work Item 59166347: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::GyrometerServer::QueryInterface
- Work Item 59166614: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!unknown_function_VEN_8086_DEV_15B6_REV_00
- Work Item 59167980: [Watson Failure]: Crash caused by 0x9F_4_IMAGE_WUDFRd.sys_ACPI_ACPI0008
- Work Item 59170530: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_05C6_PID_90DB_MI_05_IMAGE_WinUSB.SYS
- Work Item 59171195: [Watson Failure]: Crash caused by APPLICATION_HANG_ENDTASK_XPROC_HungThreadIsIdle_cfffffff_hid.dll!DeviceIoControlHelper
- Work Item 59171489: [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_btfilter!unknown_function
- Work Item 59171514: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::ComPtr_Windows::Devices::Sensors::AccelerometerServer_::Attach
- Work Item 59171776: [Watson Failure]: Crash caused by DISABLED_INTERRUPT_FAULT_USBXHCI!__guard_fids_table__PERF__
- Work Item 59172184: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!unknown_function_VEN_1002_DEV_73A6_REV_00
- Work Item 59172267: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0E8D_PID_8C38_IMAGE_usbccgp.sys
- Work Item 59175910: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_22E3_PID_003C_IMAGE_WinUsb.sys
- Work Item 59176313: [Watson Failure]: Crash caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3241_REV_0000_FW_200311830202
- Work Item 59176904: [I3C][WinI3C] Reset API
- Work Item 59180188: [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_Wdf01000!FxInterrupt::_InterruptThunk
- Work Item 59181780: [Watson Failure]: Crash caused by AV_WDFLDR!FindModuleByServiceNameLocked
- Work Item 59183349: [Watson Failure]: Crash caused by 0x133_DPC_SpbCx!CScxTarget::ForwardIrpToTargetQueue
- Work Item 59183469: [Watson Failure]: Crash caused by 0x1_SysCallNum_0_UsbHub3!HUBPDO_EvtCompleteIrpWorkItem
- Work Item 59185339: [Watson Failure]: Crash caused by 0xc4_122_LEqdUsb!unknown_function
- Work Item 59187972: [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_QcXhciFilter8380!unknown_function
- Work Item 59189658: [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.LPCB.ECDV.TSKN._TMP_ACPI_BatteryCritical_IMAGE_UsbHub3.sys
- Work Item 59190002: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_MultipleEntriesCorruption_c0000374_IntelControlLib.dll!_dcrt_get_narrow_environment_from_os
- Work Item 59191121: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll![thunk]:Microsoft::WRL::ActivationFactory_Microsoft::WRL::Implements_Microsoft::WRL::FtmBase,Windows::Devices::Sensors::Internal::ISensorStatics_,Microsoft::WRL::Detai
- Work Item 59191210: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15bb_REV_0000
- Work Item 59191459: [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_22621.2771.amd64fre.ni_release.220506-1250_TIMESTAMP_2042B9C5_nt_wrong_symbols!2042B9C51047000
- Work Item 59193082: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!o___std_type_info_destroy_list
- Work Item 59194841: [Watson Failure]: Crash caused by 0x133_ISR_UcmCx!unknown_function
- Work Item 59194997: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_07BF_IMAGE_usbccgp.sys
- Work Item 59195165: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_AML!_SB.PCI0.LPC0.BAT1._STA_ACPI_IMAGE_UsbHub3.sys
- Work Item 59195178: [Watson Failure]: Crash caused by 0x1D5_IMAGE_WUDFRd.sys_USB_VID_05E3_PID_0758_MI_01
- Work Item 59197497: Caught Platform::Exception^: Access is denied.  onecoreuap\drivers\mobilepc\displayenhancement\test\dessimulator\softwaredessimulator.cpp(22)\Microsoft.Graphics.DisplayEnhancements.BrightnessHotkeys.Functi:  Exception(1)  80070005 Access is denied.  
- Work Item 59197566: [Watson Failure]: Crash caused by FAIL_FAST_INVALID_ARG_c0000409_usbceip.dll!CDevNode::QueryDeviceProperty
- Work Item 59197792: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_4E03_SUBSYS_8996103C_REV_00
- Work Item 59198009: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!unknown_function_VEN_1B21_DEV_1242_REV_00
- Work Item 59198010: [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!unknown_function_VEN_1B21_DEV_1242_REV_00
- Work Item 59198043: [Watson Failure]: Crash caused by 0x35_WUDFRd!RdPnpTracker::RdPnpProcessor
- Work Item 59198547: [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_22621.1926.amd64fre.ni_release_svc_prod3.230616-1746_TIMESTAMP_191BB7C9_nt_wrong_symbols!191BB7C91048000
- Work Item 59198921: [Watson Failure]: Crash caused by AV_CODE_AV_PAGED_IP_kbdclass!KbdConfiguration
- Work Item 59200040: [Watson Failure]: Crash caused by INVALID_PARAMETER_c000000d_IntelControlLib.dll!free_base
- Work Item 59200174: [Watson Failure]: Crash caused by FAIL_FAST_CORRUPT_LIST_ENTRY_c0000409_WUDFx02000.dll!MxWorkItem::Allocate
- Work Item 59200337: [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::InclinometerFactory::GetDefault
- Work Item 59203249: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_1507073011FF
- Work Item 59203376: [Watson Failure]: Crash caused by MOAPPLICATION_HANG_cfffffff_Windows.Devices.Sensors.dll![thunk]:Microsoft::WRL::Details::RuntimeClassImpl_Microsoft::WRL::RuntimeClassFlags_1_,1,1,0,Microsoft::WRL::FtmBase,Windows::Devices::Sensors::IPedometer,Windows::D
- Work Item 59203550: [Watson Failure]: Crash caused by BREAKPOINT_AVRF_80000003_SensorsNativeApi.dll!Unknown
- Work Item 59203679: [Watson Failure]: Crash caused by AV_UcmCx!UpmConnectorIndicateStateChange
- Work Item 59205076: [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_services.exe!DrvMgrLpcNotification::MessageOpenProcess
- Work Item 59205137: [Watson Failure]: Crash caused by 0xFC_UsbHub3!Psm30StateEntryCheckingIfPersistentOvercurrent
- Work Item 59205256: [Watson Failure]: Crash caused by 0x3D_C0000005_BAD_IP_USBXHCI!Interrupter_WdfEvtInterruptIsr
- Work Item 59205357: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFHost.exe!CWudfDeviceStack::Create
- Work Item 59205402: [Watson Failure]: Crash caused by 0x3B_C000001D_vhf!PDO_PullRequestComplete
- Work Item 59209656: [wdf] usbiotargettest.testmd: SharingMechanism StartupStatus not ready 2
- Work Item 59212099: [Watson Failure]: Crash caused by LKD_0x144_USBDEVICE_RESET_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e5_REV_0000
- Work Item 59212421: [Watson Failure]: Crash caused by 0x13a_11_Mdl__ucx01000!unknown_function
- Work Item 59213661: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll![thunk]:Windows::Devices::Sensors::PedometerDataThresholdServer::Release_adjustor{48}_
- Work Item 59215160: [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs
- Work Item 59216657: [Watson Failure]: Crash caused by AV_Wdf01000_fffff8001af30000!unknown_function
- Work Item 59217416: [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_RESTART_FAILED_USBXHCI!unknown_function
- Work Item 59218553: WHCP_Driver : Debug breaks Blocking WHCP execution on QCIPCC Driver
- Work Item 59218657: [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_LKD_USB_vboxusb.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait
- Work Item 59218870: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_HEAP_CORRUPTION_ACTIONABLE_BlockNotBusy_DOUBLE_FREE_c0000374_SensorsApi.dll!Unknown
- Work Item 59218892: [Watson Failure]: Crash caused by AV_Wdf01000_fffff80468410000!unknown_function
- Work Item 59219191: [Watson Failure]: Crash caused by 0x139_3_CORRUPT_LIST_ENTRY_Wdf01000!FxObject::Commit
- Work Item 59219460: [Watson Failure]: Crash caused by AV_Wdf01000!WPP_IFR_SF_sq
- Work Item 59219732: [RI-TP] Failed AltimeterTests::ReadingChanged#metadataSet0: IsLessThanOrEqual(diffInMsec, tolerableDelay) - Values (141623, 5000)
- Work Item 59221338: [Watson Failure]: Crash caused by AV_Wdf01000!FxWakeInterruptMachine::ProcessEvent
- Work Item 59221843: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7E7D_SUBSYS_143A1462_REV_20_IMAGE_USBXHCI.SYS
- Work Item 59222532: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000
- Work Item 59223865: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0835_PID_2A05_IMAGE_hidusb.sys
- Work Item 59225575: [Watson Failure]: Crash caused by ACCESS_VIOLATION_FLS_c0000005_hid.dll!_NULL_IMPORT_DESCRIPTOR__PERF__
- Work Item 59226071: USB4: DP Operation Timeouts overwritten by NVM and TBT operation timeouts.
- Work Item 59227753: [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_sermouse!SerialMouseCompletionRoutine
- Work Item 59227873: [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_WUDFRd!unknown_function
- Work Item 59227939: [Watson Failure]: Crash caused by 0x10D_5_WUDFRd!unknown_function
- Work Item 59230590: [Watson Failure]: Crash caused by LKD_0x144_UNHANDLED_TRANSFER_EVENT_TRB_COMPLETION_CODE_USBXHCI!unknown_function
- Work Item 59230734: [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_WUDFx.dll!CWdfIoRequest::SetFileObjectForNextLocation
- Work Item 59232343: [Watson Failure]: Crash caused by BREAKPOINT_80000003_ControlLib.dll!_acrt_LCMapStringA
- Work Item 59233511: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_1903_SUBSYS_383517AA_REV_0C
- Work Item 59234157: [Watson Failure]: Crash caused by 0x1CA_Wdf01000!WPP_FxRequest_cpp_Traceguids
- Work Item 59234276: [Watson Failure]: Crash caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_10de_DEV_1ad8_REV_00a1
- Work Item 59234277: [Watson Failure]: Crash caused by LKD_0x144_DISABLE_SLOT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_10de_DEV_1ad8_REV_00a1
- Work Item 59234908: [Watson Failure]: Crash caused by AV_IMAGE_usbccgp.sys
- Work Item 59235273: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_BatteryCritical_IMAGE_usbser.sys
- Work Item 59235344: [Watson Failure]: Crash caused by 0x10D_5_USBXHCI!Interrupter_ReleaseEventRingLock
- Work Item 59235375: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_046A_PID_01D7_MI_00_IMAGE_hidusb.sys
- Work Item 59235507: [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8._STA_ACPI_IMAGE_UsbHub3.sys
- Work Item 59235802: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFHost.exe!CWudfIrpT_CWudfPnpIrp,IWudfPnpIrp,_WUDFMESSAGE_IRP_*,_WUDFMESSAGE_PNP_REPLY_ALL_*_::Release
- Work Item 59238116: [Watson Failure]: Crash caused by LKD_0x1F5_STREAM!SCSubmitRequest
- Work Item 59238235: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_241022B80001
- Work Item 59238992: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_190826703140
- Work Item 59239072: [Watson Failure]: Crash caused by IN_PAGE_ERROR_c0000102_c0000006_Windows.Devices.Sensors.dll!_string_
- Work Item 59239596: [Watson Failure]: Crash caused by LKD_0x144_DISABLE_SLOT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_7814_REV_0001
- Work Item 59239672: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2F24_PID_0060_IG_00_IMAGE_hidusb.sys
- Work Item 59240526: [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_STOP_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1343_REV_0000_FW_151015300401
- Work Item 59241091: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2708_PID_000D_REV_0100_MI_03_IMAGE_hidusb.sys
- Work Item 59241158: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BufferOverrun_c0000374_SensorsUtilsV2.dll!CollectionsListDeserializeFromBuffer
- Work Item 59241851: [Watson Failure]: Crash caused by AV_Wdf01000_fffff80356090000!unknown_function
- Work Item 59242053: [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!HUBHTX_SendInterruptTransferComplete
- Work Item 59242423: [Watson Failure]: Crash caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_10de_DEV_1ad6_REV_00a1
- Work Item 59242651: [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!_acrt_initialize_new_handler
- Work Item 59243664: [Watson Failure]: Crash caused by 0x44_amdhub31!unknown_function
- Work Item 59245073: [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_8007023e_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease
- Work Item 59245372: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_43ED_SUBSYS_0A811028_REV_11_IMAGE_USBXHCI.SYS
- Work Item 59245487: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!CTL_API::OverclockManager::PowerTelemetryGet
- Work Item 59245643: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_0PNP_DEV_0D10_REV_0000
- Work Item 59246596: [Watson Failure]: Crash caused by AV_qcspi8280!unknown_function
- Work Item 59246609: [Watson Failure]: Crash caused by 0x7E_80000003_HIDCLASS!HidpQueryCollectionCapabilities
- Work Item 59248565: [Watson Failure]: Crash caused by AV_USBPORT!USBPORT_RootHub_Endpoint0
- Work Item 59248925: [Watson Failure]: Crash caused by AV_monitor_Wdf01000!FxObject::DeleteObject
- Work Item 59249162: [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_IntelControlLib.dll!CTL_API::KmdSysManager::parseBufferOut
- Work Item 59249739: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_1532_PID_0203_MI_00_IMAGE_hidusb.sys
- Work Item 59250992: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_ACCESS_VIOLATION_c0000005_SensorsApi.dll!Unknown
- Work Item 59251854: [Watson Failure]: Crash caused by 0x1E_C000001D_USBXHCI!Bulk_ProcessTransferEventWithED1
- Work Item 59252495: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function
- Work Item 59252656: [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_WUDFx02000.dll!Unknown
- Work Item 59254389: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3434_PID_02A3_MI_00_IMAGE_hidusb.sys
- Work Item 59257133: [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43fb_REV_0001
- Work Item 59257577: [Watson Failure]: Crash caused by 0xFC_SpbCx!__guard_fids_table__PERF__
- Work Item 59258573: [Watson Failure]: Crash caused by 0xE6_27_HidSpiCx!HidClassMinidriver_HidSpiRequestManager,HidSpiRequest_::EvtDeviceIoControl
- Work Item 59261969: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BlockNotBusy_DOUBLE_FREE_c0000374_WUDFx02000.dll!FxLibraryCommonUnregisterClient
- Work Item 59262566: [Watson Failure]: Crash caused by SVCHOSTGROUP_BcastDVRUserService_FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_ControlLib.dll!internal_get_ptd_head_slow
- Work Item 59264469: [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!TlgRegisterAggregateProviderEx
- Work Item 59264964: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WppRecorderUM.dll!wil::details::_dynamic_initializer_for__g_featureStateManager____PERF__
- Work Item 59265888: [Watson Failure]: Crash caused by 0x133_DPC_USBXHCI!Control_WdfEvtIoDefault
- Work Item 59265910: [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!try_get_function_slow
- Work Item 59265987: [Watson Failure]: Crash caused by 0xFC_urssynopsys!__guard_fids_table
- Work Item 59266222: [Watson Failure]: Crash caused by 0x10D_7_qcadcm_Wdf01000!FxNonPagedObject::_FxNonPagedObject
- Work Item 59267395: [Watson Failure]: Crash caused by FAIL_FAST_CORRUPT_LIST_ENTRY_c0000409_WUDFHost.exe!CWudfDevice::_GetDeviceItf
- Work Item 59269157: [Watson Failure]: Crash caused by 0x9F_3_WinUSB!WinUSB_SubmitRead
- Work Item 59271238: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_OOM_HighPagedPool_c00000fd_microsoft.graphics.display.displayenhancementservice.dll!out_of_memory
- Work Item 59272847: [Watson Failure]: Crash caused by 0x9F_4_PCI_rrwd0002_IMAGE_1394ohci.sys
- Work Item 59275762: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorFactory::_scalar_deleting_destructor_
- Work Item 59276135: [Watson Failure]: Crash caused by 0x9F_4_MVXBL64_IMAGE_UsbHub3.sys
- Work Item 59277116: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_FATAL_USER_CALLBACK_EXCEPTION_c000041d_microsoft.graphics.display.displayenhancementservice.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::ExecuteCurrentState
- Work Item 59279277: [RI-TP] Failed SensorServiceFuncTests::PnpStateTransitions: IsTrue((!isAccelerometerPresent && !isSdoPresent) ? (availableDeviceInterfaces.size() == 0) : (isSdoPresent ? (availableDeviceInterfaces.size() == 2) : (availableDeviceInterfaces.size() == 1)))
- Work Item 59279978: [Watson Failure]: Crash caused by AV_HDAudBus_Wdf01000!FxWaitLockInternal::ReleaseLock
- Work Item 59280050: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3285_PID_0C18_IG_00_IMAGE_hidusb.sys
- Work Item 59280351: [Watson Failure]: Crash caused by 0x10D_5_UsbHub3!HUBPDO_EvtDevicePrepareHardware
- Work Item 59282426: [Watson Failure]: Crash caused by 0x3B_C000001D_ucx01000!UrbHandler_USBPORTStyle_Legacy_SCT_VendorClassCommand
- Work Item 59283296: [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_usbccgp!USBD_SyncCompletionRoutine
- Work Item 59290133: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_54ED_SUBSYS_8BB8103C_REV_00_IMAGE_USBXHCI.SYS
- Work Item 59291042: [Watson Failure]: Crash caused by IN_PAGE_ERROR_c000009c_c0000006_Windows.Devices.Sensors.dll!_NULL_IMPORT_DESCRIPTOR
- Work Item 59291378: [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!TUNNEL_EvtIrpPreprocessQueryDevRelations
- Work Item 59292560: [Watson Failure]: Crash caused by AV_Wdf01000!FxMemoryBufferFromPool::_FxMemoryBufferFromPool
- Work Item 59292695: [Watson Failure]: Crash caused by STACK_OVERFLOW_80070490_Windows.Devices.Sensors.dll!SimpleOrientation::InitializeDefaultByType
- Work Item 59293157: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFHost.exe!CWudfIoStackLocation::_CWudfIoStackLocation
- Work Item 59293213: [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250320B80001
- Work Item 59294415: [RI-TP] AreEqual(expectedIsValidState ? HumanPresence::Present : HumanPresence::Unknown, reading->Presence) - Values (1, 0)
- Work Item 59295496: [Watson Failure]: Crash caused by AV_UmPass_Wdf01000!FxTransactionedList::LockForEnum
- Work Item 59296442: [Watson Failure]: Crash caused by 0x1F0_VRF_Usb4DeviceRouter!Usb4Drd::HostRouterInterface::CancelNotification
- Work Item 59296649: [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1142_REV_0000_FW_140328101800
- Work Item 59296798: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_ControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape
- Work Item 59297086: [Watson Failure]: Crash caused by 0x7E_C000001D_Wdf01000!FxPkgPnp::SaveState
- Work Item 59297701: [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_ControlLib.dll!_acrt_initialize_stdio
- Work Item 59297729: [Watson Failure]: Crash caused by 0x1DB_USBPORT!MPf_PollController
- Work Item 59297758: [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::GfxHandler::_GfxHandler
- Work Item 59298653: [Watson Failure]: Crash caused by AV_Wdf01000!FxUsbDevice::GetString
- Work Item 59302657: [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_USBXHCI!DynamicLock_Release
- Work Item 59302942: [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_usbccgp!QueryParentDeviceRelations
- Work Item 59304311: [Watson Failure]: Crash caused by MANUALLY_INITIATED_CRASH_ExcessiveWaitTimeOnERESOURCE_Blocked_On_kbdhid!KbdHidProcessCrashDump
- Work Item 59306618: [Watson Failure]: Crash caused by 0x133_ISR_WDFLDR!ReferenceClassVersion
- Work Item 59307044: [Watson Failure]: Crash caused by 0xB8_sshid_Wdf01000!FxIoTarget::SubmitSync
- Work Item 59307079: [Watson Failure]: Crash caused by 0x1E_C0000420_qcspi8180!spi_cancel_transfer
- Work Item 59307415: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000
- Work Item 59308583: [Watson Failure]: Crash caused by LKD_0x144_UNHANDLED_TRANSFER_EVENT_TRB_COMPLETION_CODE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250811B80001
- Work Item 59308584: [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250811B80001
- Work Item 59308856: [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Internal::GitEventSource_Windows::Foundation::ITypedEventHandler_Windows::Devices::Sensors::LightSensor_*,Windows::Devices::Sensors::LightS
- Work Item 59308925: [Watson Failure]: Crash caused by 0x9F_3_nWifiPAUSE_wg111v2_IMAGE_UsbHub3.sys
- Work Item 59309521: [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_ExcessiveThreadsWaitingForPageIn_IMAGE_Usb4HostRouter.sys
- Work Item 59309704: [RI-TP] AreEqual(static_cast<boolean>(expectedIsValidState), value) - Values (1, 0)
- Work Item 59309764: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_hid.dll!HidP_GetUsages
- Work Item 59310629: [Watson Failure]: Crash caused by LKD_0x144_DISABLE_SLOT_FAILED_USBXHCI!unknown_function
- Work Item 59311538: [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::InitiateFirstRun
- Work Item 59311784: [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_serenum!Serenum_DispatchPassThrough
- Work Item 59312420: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!wil_details_FeatureReporting_RecordUsageInCache
- Work Item 59315281: [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_38ed_REV_0010
- Work Item 59315631: Failed Microsoft::Windows::DisplayEnhancement::FuncTests::AutobrightnessTests::BatterySaverBrightnessMultiplierTest: AreEqual(GetBrightnessPowerGuidValue(), targetBrightness) - Values (80, 100)
- Work Item 59316026: [Watson Failure]: Crash caused by AV_UmPass_Wdf01000!FxObject::PerformDisposingDisposeChildrenLocked
- Work Item 59316535: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!unknown_function
- Work Item 59317519: [Watson Failure]: Crash caused by 0x7E_C0000006_C0000428_HIDCLASS!HidpGetComboHardwareIdV2Enabled
- Work Item 59319530: [Watson Failure]: Crash caused by 0x13a_11_Mdl__IMAGE_hidusb.sys
- Work Item 59320086: [Watson Failure]: Crash caused by 0x7f_8_USBXHCI!StageQueue_ForwardScanGetNextStage
- Work Item 59320315: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_ExcessiveReadyThreads_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_9A03_SUBSYS_380A17AA_REV_01
- Work Item 59320710: [Watson Failure]: Crash caused by AV_WDFLDR!DereferenceClassVersion
- Work Item 59320801: [Watson Failure]: Crash caused by LKD_0x144_EVENT_RING_FULL_ERROR_USBXHCI!unknown_function
- Work Item 59321409: [Watson Failure]: Crash caused by AV_msquic!FxDriverEntry
- Work Item 59322185: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_c0000005_sensorservice.dll!History::RetrieveHistoryFromSensor
- Work Item 59322295: [Watson Failure]: Crash caused by 0x139_MISSING_GSFRAME_ISH!unknown_function
- Work Item 59322306: [Watson Failure]: Crash caused by BREAKPOINT_80000003_hid.dll!Unknown
- Work Item 59322362: [Watson Failure]: Crash caused by 0x9F_4_PCI_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_9A03_SUBSYS_87FE103C_REV_02
- Work Item 59323183: [Watson Failure]: Crash caused by 0x133_DPC_USBXHCI!Control_ProcessTransferEventWithED0
- Work Item 59323297: [Watson Failure]: Crash caused by AV_BthHFEnum_Wdf01000!FxWmiIrpHandler::_RegInfo
- Work Item 59323531: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_wna3100m_ExcessiveReadyThreads_IMAGE_UsbHub3.sys
- Work Item 59323709: [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::QueryInterface
- Work Item 59324179: [Watson Failure]: Crash caused by IN_PAGE_ERROR_c000009c_c0000006_Windows.Devices.Sensors.dll!_imp_BiRtDeleteEventForApp
- Work Item 59324328: [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!HUBREG_DeleteUxdSettings
- Work Item 59325364: [Watson Failure]: Crash caused by MOAPPLICATION_HANG_cfffffff_Windows.Graphics.Display.DisplayEnhancementOverride.dll!guard_dispatch_icall$thunk$10345483385596137414
- Work Item 59325866: [Watson Failure]: Crash caused by 0xE4_2_ApHidfiltrService_Wdf01000!MxWorkItem::Free
- Work Item 59326374: [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_ssps2!MSIECRestore
- Work Item 59327467: [RI-TP] Failed \WinRTSensors.FuncTests.CppCx.dll/SimpleOrientationSensorTests/SimpleOrientationSensorTests::ClassSetup: Setup fixture 'SimpleOrientationSensorTests::ClassSetup' for the scope 'SimpleOrientationSensorTests' returned 'false'.
- Work Item 59327468: [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8._REG_ACPI_IMAGE_UsbHub3.sys
- Work Item 59327699: [RI-TP] Failed HumanPresenceExtensionManagerTests::SensorAdapterProcessReadingFails: AreEqual(detectionDistanceInMillimeters, expectedDistanceInMillimeters) - Values (0, 4000)
- Work Item 59328063: [Watson Failure]: Crash caused by AV_WpdUpFltr!FxDriverEntry
- Work Item 59328515: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_1022_DEV_15D7_SUBSYS_21371D72_REV_00_IMAGE_USBXHCI.SYS
- Work Item 59329695: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorFactory::GetDefault
- Work Item 59329928: [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PC00.LPCB.EC0.SEN1.PAT0_ACPI_IMAGE_USBXHCI.SYS
- Work Item 59330419: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorReadingChangedEventArgsServer::_scalar_deleting_destructor_
- Work Item 59331183: [Watson Failure]: Crash caused by APPLICATION_FAULT_c00000aa_SensorsApi.dll!Windows::Internal::GitPtrImpl_Windows::Internal::GitPtr_::Initialize_ISensorEvents_
- Work Item 59331323: [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ExcessiveThreadsWaitingForPageIn_IMAGE_qci2c7180.sys
- Work Item 59331352: [Watson Failure]: Crash caused by HUP_BUGCHECK_POR_PIN_CANT_FIND_RESOURCE_HL_2_FormFactor_HPUv2_F4000001_WUDFHost.exe!unknown_error_in_process
- Work Item 59332194: [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_ControlLib.dll!ctlInit2
- Work Item 59332752: [Watson Failure]: Crash caused by 0x13a_11_Wait_WUDFRd!operator_delete
- Work Item 59332889: [Watson Failure]: Crash caused by 0x13a_11_Wait_WUDFRd!_MODULE_INFO::__MODULE_INFO
- Work Item 59333427: [Watson Failure]: Crash caused by AV_ucx01000!USBPORTStyle_UserGetRootHubName
- Work Item 59333510: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250811B80001
- Work Item 59333826: [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8.U4UP.U4P2._PS3_ACPI_IMAGE_UsbHub3.sys
- Work Item 59333995: [RI-TP] Failed HumanPresenceExtensionManagerTests::SensorAdapterProcessReadingTimeoutExpiredFails: AreEqual(sharedMemoryBlock->CallsCount_ProcessReadingTimeoutExpired, 1u) - Values (0, 1)
- Work Item 59334169: [Watson Failure]: Crash caused by 0x9F_4_USB_nationalinstrumentsblan_IMAGE_UsbHub3.sys
- Work Item 59335286: [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8.U4UP.U4P3.UHI0._REG_ACPI_IMAGE_UsbHub3.sys
- Work Item 59337509: [Watson Failure]: Crash caused by AV_iaLPSS2_GPIO2_Wdf01000!FxPkgPnp::_PowerProcessEventInner
- Work Item 59337989: [Watson Failure]: Crash caused by 0x9F_4_USB_WacHIDRouterISDU_IMAGE_UsbHub3.sys
- Work Item 59339883: [Watson Failure]: Crash caused by AV_SpbCx!CScxTarget::_OnTargetIoDefault
- Work Item 59341548: [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_RESET_FAILED_USBXHCI!unknown_function
- Work Item 59342675: [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_SensorsApi.dll!Microsoft::WRL::ComPtr_IUnknown_::InternalRelease
- Work Item 59344453: [Watson Failure]: Crash caused by IN_PAGE_ERROR_services.exe_BUGCHECK_CRITICAL_PROCESS_c0000005_services!WdfProcess::TerminateProcess
- Work Item 59344894: [Watson Failure]: Crash caused by 0x9F_3_RtkBtfilter_ExcessiveReadyThreads_ProcessorThrottled_PerfPolicy_IMAGE_amdhub31.sys
- Work Item 59345129: [Watson Failure]: Crash caused by CLR_EXCEPTION_80132006_dc.exe!unknown_function
- Work Item 59348230: [Watson Failure]: Crash caused by AV_SpbCx!CScxController::_OnDxIrpComplete
- Work Item 59348646: [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Bluetooth::Foundation::TokenWithStatusControl_Microsoft::Windows::
- Work Item 59350819: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_0C9E_IMAGE_btfilter.sys
- Work Item 59352553: [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!HUBREG_OpenQueryAttemptRecoveryFromUsbPowerDrainValue
- Work Item 59353175: [RI-TP] Failed \USBTCDtaef.dll/UsbTcdTests::WinUsbIoTests/UsbTcdTests::WinUsbIoTests::WinUSBBulkAndIsochIOCancellations/UsbTcdTests::WinUsbIoTests::MethodCleanup: Encountered failure for USBXHCI host controller while running test. Please visit aka.ms/xhci
- Work Item 59355064: [Watson Failure]: Crash caused by 0xc2_d_BTHUSB_Wdf01000!FxPoolFree
- Work Item 59355701: [Watson Failure]: Crash caused by AV_SerCx2!Timer_EvtTimerFired
- Work Item 59358275: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_23E5_PID_A2F0_REV_0500_MI_03_IMAGE_hidusb.sys
- Work Item 59359255: [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::MakeAndInitialize_Windows::Devices::Sensors::GyrometerServer,Windows::Devices::Sensors::GyrometerServer_
- Work Item 59361366: [Watson Failure]: Crash caused by APPLICATION_HANG_Unowned_CriticalSection_c0000194_SensorsUtilsV2.dll!SerializationBufferFree
- Work Item 59361640: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_4E53_PID_5407_MI_01_IMAGE_hidusb.sys
- Work Item 59361939: [RI-TP] AreEqual(static_cast<HRESULT>(RPC_S_CALLPENDING), CoWaitForMultipleHandles( COWAIT_DISPATCH_CALLS | COWAIT_DISPATCH_WINDOW_MESSAGES, s_readingChangeWaitTimeInMilliSeconds, 1, readingChangedEvent.addressof(), &indexUsed)) - Values (0x80010115, 0x0)
- Work Item 59363193: [Watson Failure]: Crash caused by LKD_0x144_EVENT_RING_FULL_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a87d_REV_0001
- Work Item 59364370: [Watson Failure]: Crash caused by FATAL_USER_CALLBACK_EXCEPTION_c000041d_WUDFHost.exe!unknown_error_in_process
- Work Item 59365080: [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_ucx01000!UrbHandler_USBPORTStyle_Legacy_SCT_VendorClassCommand
- Work Item 59366134: [WinVOS][WinVOSFull]Failed AccelerometerTests::ReadingChanged#metadataSet3: SUCCEEDED(CoWaitForMultipleHandles( COWAIT_DISPATCH_CALLS | COWAIT_DISPATCH_WINDOW_MESSAGES, timeoutMs, 1, &(rawCompletedEvent), &eventIndexUnused)): Failed to get a ReadingChange
- Work Item 59366198: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxMemoryBufferFromLookaside::SelfDestruct
- Work Item 59367395: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsUtilsV2.dll!MIDL_user_allocate
- Work Item 59368848: [GE LT] Feature_SoftwareOffloadWithClientBuffers | 39615196: Ensure LT And GE branches are identical
- Work Item 59374451: [Watson Failure]: Crash caused by 0x133_ISR_USBXHCI!ESM_ExecuteEntryFunctionsAndPushPopStateMachinesForCurrentState
- Work Item 59374463: [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::remove_ReadingChanged
- Work Item 59374710: [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_INTERRUPTS_DISABLED_USBXHCI!Control_Transfer_Map
- Work Item 59374857: [Watson Failure]: Crash caused by 0xE6_28_nvxhcifilter!unknown_function
- Work Item 59375481: [Watson Failure]: Crash caused by MANUALLY_INITIATED_CRASH_ExcessiveWaitTimeOnERESOURCE_Blocked_On_i8042prt!I8xProcessCrashDump
- Work Item 59375758: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7749_SUBSYS_380517AA_REV_00_IMAGE_mshidkmdf.sys
- Work Item 59376067: [Watson Failure]: Crash caused by 0x13a_8_9____USBXHCI_Wdf01000!FxPoolFree
- Work Item 59376729: [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Compass.exe!unknown_error_in_process
- Work Item 59377415: [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_AVRF_c0000409_SensorService.HumanPresenceMonitor.UnitTests.dll!Unknown
- Work Item 59377589: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_ExcessiveThreadsWaitingForPageIn_IMAGE_WUDFRd.sys_ROOT_LENOVOVHID
- Work Item 59378696: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::MakeAndInitialize_Windows::Devices::Sensors::InclinometerFactory,Windows::Devices::Sensors::InclinometerFactory_
- Work Item 59379366: [Watson Failure]: Crash caused by SVCHOSTGROUP_WbioSvcGroup_ASSERTION_FAILURE_c0000420_SensorsApi.dll!_CClassExtensionProxy::EnQueue_::_1_::catch$9
- Work Item 59379519: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_amdfendrsr.exe!Unknown
- Work Item 59381427: [Watson Failure]: Crash caused by 0x7E_C0000006_C0000428_WinUsb!WinUSB_GetDeviceDescriptor
- Work Item 59382125: Failed Microsoft.Graphics.DisplayEnhancements.AdaptiveColor.FunctionalTests.testmd [Double Nits Monitor]: Error trace not within a test case. - (Error=0x800705b4) Failed to enable provider
- Work Item 59388177: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!internal_get_ptd_head_slow
- Work Item 59388824: [USB][Test] Add USB Wake Test for testing controller sleep/wake scenarios
- Work Item 59390666: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_agrsm64_IMAGE_UsbHub3.sys
- Work Item 59390770: [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_IntelControlLib.dll!CTL_API::_dynamic_atexit_destructor_for__OSDllsobj__
- Work Item 59392055: [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::AccelerometerServer::ProcessReadings
- Work Item 59394281: [RI-TP] AreEqual(expectedPersonIdVector[i], UINT32_MAX) - Values (1, 4294967295)
- Work Item 59395048: [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_DeviceInstallTimeout_LKD_00000000-0000-0000-0000-000000000000_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait
- Work Item 59403376: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::WRL::ActivationFactory_Microsoft::WRL::Implements_Microsoft::WRL::FtmBase,Windows::Internal::Graphics::Display::Displ
- Work Item 59403680: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_ACPI_NVDA8000_IMAGE_USBXHCI.SYS
- Work Item 59405071: [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_PerfPolicy_IMAGE_hidi2c.sys
- Work Item 59405852: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1343_REV_0000_FW_151015300402
- Work Item 59408877: [Watson Failure]: Crash caused by 0x3B_80000004_ucx01000!McTemplateK0ppppphnNR5_EtwWriteTransfer
- Work Item 59409382: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_ACPI_CIRQ1080_IMAGE_mshidkmdf.sys
- Work Item 59410594: [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_Windows.Devices.Sensors.dll!ViewPositionTracker::RegisterForDisplayRegionChanges
- Work Item 59410891: [Watson Failure]: Crash caused by 0x133_ISR_amdi2c_Wdf01000!FxPkgPnp::PowerPolicyEnterNewState
- Work Item 59410966: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::AccelerometerReadingServer::_scalar_deleting_destructor_
- Work Item 59411370: [Watson Failure]: Crash caused by FAIL_FAST_CONTROL_INVALID_RETURN_ADDRESS_c0000409_amdfendrsr.exe!unknown_error_in_process
- Work Item 59411727: [Watson Failure]: Crash caused by 0x133_DPC_Wdf01000!FxEventQueue::EventQueueWorker
- Work Item 59412494: [Watson Failure]: Crash caused by 0x7f_8_kbdclass!KeyboardStart
- Work Item 59412945: [Watson Failure]: Crash caused by 0xE6_26_USBXHCI!Isoch_RetrieveNextStage
- Work Item 59413180: [Watson Failure]: Crash caused by 0x13a_8__g___USBHUB3_Wdf01000!FxPoolFree
- Work Item 59413586: IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)
- Work Item 59414558: [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_80070490_Windows.Devices.Sensors.dll!wil::details::WilFailureNotifyWatchers
- Work Item 59415097: [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!free_base
- Work Item 59415693: [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_1A86_PID_E310_MI_00_IMAGE_hidusb.sys
- Work Item 59416289: [Watson Failure]: Crash caused by AV_PTPFilter_Wdf01000!FxIoQueue::DispatchRequestToDriver
- Work Item 59416556: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::CreateActivationFactory_Windows::Devices::Sensors::OrientationSensorFactory_
- Work Item 59416853: [RI-TP] Failed HumanPresenceMonitorFactoryTests::SensorSelectionTest: IsGreaterThanOrEqual(availableSensors.size(), static_cast<size_t>(3)) - Values (0, 3)
- Work Item 59419515: [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::GetNativeOrientationFromVideoOutput
- Work Item 59419696: [Watson Failure]: Crash caused by AV_USBHUB3_Wdf01000!FxPkgFdo::HandleQueryCapabilitiesCompletion
- Work Item 59419751: [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0FEE_REV_0000_FW_3130
- Work Item 59421866: [Watson Failure]: Crash caused by 0x139_MISMATCH_GSCOOKIE_usbcir!UsbIrParse
- Work Item 59422253: [Watson Failure]: Crash caused by AV_USBXHCI!Isoch_MappingLoop
- Work Item 59422395: [Watson Failure]: Crash caused by 0xC1_23_VRF_WinUSB!WinUSB_ReadPipeCompletion
- Work Item 59423032: [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_madiface_usb_amd_IMAGE_UsbHub3.sys
- Work Item 59427333: [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SettingsHandlers_HumanPresence.dll!wil::details::functor_wrapper_void__lambda_260b81f2231255642d6c288569aacead___::Run
- Work Item 59440459: [RI-TP] Failed VhfTaefTest.testmd: Waiting for the device interface arrival failed. WaitResult:258
- Work Item 59447935: [RI-TP] AreEqual(true, dataExpected) - Values (1, 0)
- Work Item 59450916: [RI-TP] Failed HumanPresenceSensorTests::GetCurrentReadingValidation: AreEqual(reading2->Presence, detectionState ? HumanPresence::Present : HumanPresence::NotPresent) - Values (1, 2)
- Work Item 59458630: Failed Microsoft::Windows::DisplayEnhancement::DeoRpcServer::UnitTests::DeoRpcServerUnittests::SimpleStartStopOverrideTest: IsTrue(verifier.verify_success_and_count<BrightnessOverrideTest>(1))
- Work Item 59468868: IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)
- Work Item 59469591: [Diomedes][N1x][MTK 5558567] CLOCK_WATCHDOG_TIMEOUT on boot blamed on mtkwecxa.sys
- Work Item 59645373: Hardware | Wistron Corporation | Gradual Rollout failed
- Work Item 59656544: Failed Windows.Graphics.Display.BrightnessOverride.ApiTests.testmd [Single Nits Monitor - No ALS]: Error trace not within a test case. - (Error=0x800705b4) Failed to enable provider
- Work Item 59656794: [Diomedes][MINOS EV1.5 Selfhost] Consistent IOMMU fault bugcheck on LKG 1001 (BSP 4.14.2) when connecting Lenovo Ideapad TBT3 dock
- Work Item 59659748: [RI-TP] AreEqual(expectedIsValidState ? HumanPresence::Present : HumanPresence::Unknown, reading->Presence) - Values (1, 0)
- Work Item 59689131: [wini3c][test] Timeout during ResetOverlapped::ResetWithCccDefiningByte
- Work Item 59692400: [I3C] Enable on Intel NVL
- Work Item 59693022: After the update, the adaptive color option is removed from Settings app.
- Work Item 59696259: [Lenovo][HDE][Avon][Think][OEMQ] How to customize Microsoft Adaptive Brightness curve for BC2
- Work Item 59793191: [RI-TP] Calling handle succesfully despite access revocation, failing test
- Work Item 59816561: [RI-TP] Failed SpbTarget::Sequence: SUCCEEDED(VirtualHostControllerDevice::CreateAndInitializeAcpi(hcis, acpiAsl, hcd)) - Value (0x80070102)
- Work Item 59826192: [Lenovo][FCCL][Win11][25H2/24H2]USB keyboard and mouse unresponsive in WinRE after Windows 11 24H2/25H2 update (26100.6899 / 26200.6899, KB5066835) (Repro Rate 100%)
- Work Item 59832815: [USB4] InterdomainRxRing Consumer Index is incorrectly initialized leading to blocked P2P file transfers
- Work Item 59835975: [MSFT I3C HCI Driver][STRIX1 I3C][v7] Observed error for HostCancelRead SuperMITT tests error pointing to HostCancelRead transfer completion and improper cancellation handling in driver (SWDEV-559140)
- Work Item 59852467: Failed ManualBrightnessTests::AutobrightnessEnableDisableTest: IsFalse(display->IsMonitorBrightnessCloseToExpectedLevel(static_cast<BrightnessPercentage>(manualBrightnessSliderStrength)))
- Work Item 59880170: IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)
- Work Item 59884289: USB C stopped working after update to Windows 11 25H2
- Work Item 59907326: [SuperMITT] Add HIDI3C Mouse and Keyboard Support
- Work Item 59915042: [Windows Desktop Readiness] meeting 10/23 AI :  investigation of new measures for USB
- Work Item 59963386: [WDF][HLK] Update WdfFuncTableChecks for v35 release

---

**Note:** These features are available to Windows Insiders in the latest builds.

For more information about the Windows Insider Program, visit [https://insider.windows.com](https://insider.windows.com)

---
*Generated on 2025-11-14 17:36:41*
