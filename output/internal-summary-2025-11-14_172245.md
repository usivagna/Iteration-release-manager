# Iteration Summary: 2510

**Period:** 2025-09-29T00:00:00Z to 2025-11-02T00:00:00Z
**Team:** ft_buses
**Areas:** Buses & Sensors

## Executive Summary

- Total work items completed: 876
- Breakdown by type:
  - : 876
- Breakdown by area:
  - USB: 360
  - WDF-Windows Driver Frameworks: 154
  - USB4: 12
  - Sensors: 142
  - Input Drivers: 73
  - USB Fn Device Mode: 2
  - I3C: 18
  - Buses: 54
  - Display Enhancement Service: 2
  - Tools: 2
  - Samples: 5
  - USB-C: 10
  - Legacy: 15
  - SPB-Simple Peripheral Buses: 18
  - 3rdPartyDriverPromotion: 4
  - USBSer: 5

## Completed Work Items

### Buses Component

#### [54034835] [Buses, Input, & WDF] Bromine Semester Work (2025.04 - 2025.09)

**Type:** Epic | **State:** Completed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [54035434] ------------------------------------------------------ [Buses] Bromine Cutline ------------------------------------------------------

**Type:** Scenario | **State:** Completed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [57002423] Support resizing states

**Type:** Task | **State:** Completed

**Description:**
<div><p style="margin:0in;font-size:12pt;font-family:Aptos, sans-serif;">4.&nbsp; <b>Resizing</b> states themselves.&nbsp; Some state
machines have Async states with a lot of ingress and egress transitions; a
convenient way to diagram this legibly is to make the state very large so that
it has a lot of edge real estate to connect to.&nbsp; USB4 uses this technique
in a few places, and I recall UCSI using it extensively as well.&nbsp; We
discovered yesterday that it was not straightforward to resize the states
themselves (and their dimensions weren’t preserved in the conversion) so this
technique now results in many transitions converging onto a small area which is
harder to read. </p><br> </div>

**Pull Requests:**
No linked pull requests

---

#### [57990286] [VisioPluginForSmfx] Match colors/fonts closer to MagicDraw (for readability and transition ease)

**Type:** Task | **State:** Completed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58002269] [Bug-fix bundle 2025.10] [Input/HID, Low Power Buses and USB] CD bug fix bundle - Reliability and power efficiency improvements that improve product quality and keep rhythm of business costs under check

**Type:** Scenario | **State:** Completed

**Description:**
<table style="background-color:rgb(248, 249, 250);color:rgb(118, 62, 155);border:1px solid rgb(243, 230, 250);border-top-left-radius:15px;border-bottom-right-radius:15px;border-top-right-radius:15px;border-bottom-left-radius:15px;font-family:&quot;Segoe UI&quot;;">
    
    <tbody>
        <tr>
            </tr></tbody></table><table style="background-color:rgb(248, 249, 250);color:rgb(118, 62, 155);border:1px solid rgb(243, 230, 250);border-top-left-radius:15px;border-bottom-right-radius:15px;border-top-right-radius:15px;border-bottom-left-radius:15px;font-family:&quot;Segoe UI&quot;;"><tbody><tr><th style="border:1px solid rgb(243, 230, 250);background-color:rgb(243, 230, 250);border-top-left-radius:15px;text-align:center;vertical-align:bottom;width:50%;font-size:large;">
                
                Customer + Situation
            </th>
            <th style="border:1px solid rgb(243, 230, 250);background-color:rgb(243, 230, 250);text-align:center;vertical-align:bottom;min-width:110px;width:110px;font-size:large;">
                
                Product Magic
            </th>
            <th style="border:1px solid rgb(243, 230, 250);background-color:rgb(243, 230, 250);border-top-right-radius:15px;text-align:center;vertical-align:bottom;width:50%;font-size:large;">
                
                Outcomes
            </th>
        </tr>
        <tr>
            <th style="border:1px solid rgb(243, 230, 250);padding:0.2em 0.4em;background-color:rgb(243, 230, 250);">
                 <small style="font-weight:normal;"><i>Who is the customer? What motivates him or her? What is
                        the specific real-world situation where there is a need or an opportunity? What specific
                        problem does the customer have?</i></small> </th>
            <th style="border:1px solid rgb(243, 230, 250);padding:0.2em 0.4em;background-color:rgb(243, 230, 250);text-align:center;vertical-align:middle;font-size:large;">
                
                &#129668;&#129668;&#129668;
            </th>
            <th style="border:1px solid rgb(243, 230, 250);padding:0.2em 0.4em;background-color:rgb(243, 230, 250);text-align:center;">
                 <small style="font-weight:normal;"><i>What specific outcomes has the customer now been able to
                        accomplish? What are the key metrics to measure the success of these
                        outcomes?</i></small> </th>
        </tr>
        <tr>
            <td style="border:1px solid rgb(243, 230, 250);padding:0.2em 0.4em;border-bottom-left-radius:15px;">
                <span style="font-family:&quot;Segoe UI&quot;;background-color:rgb(248, 249, 250);display:inline !important;">Bug fixes for Input/HID/Sensors, USB, Low Power Buses and WDF</span> </td>
            <td style="text-align:center;font-size:xx-large;">
                ➡️
            </td>
            <td style="border:1px solid rgb(243, 230, 250);padding:0.2em 0.4em;border-bottom-right-radius:15px;">
                 The customer will achieve a 50% reduction in UCSI LKDs indicating USB-C PPM firmware failures and a significant reduction in USB XHCI controller resets. Key metrics include the number of reported failures and the effectiveness of WHCP tests </td>
        </tr>
    </tbody></table><div style="font-weight:400;box-sizing:border-box;font-size:14px;"><span style="box-sizing:border-box;">
        <h2 style="box-sizing:border-box;font-weight:600;"><span style="box-sizing:border-box;color:rgb(118, 62, 155);">Key Work to be Done</span> </h2>
        <ul>
            <li>Bug fixes for Input/HID/Sensors, USB, Low Power Buses and WDF<br> </li><li>Enhance WHCP tests to detect hardware issues upstream.&nbsp; </li><li>Implement automated UCSI tests through a software UCSI client&nbsp; </li><li>Improve diagnostics and leverage IFR more effectively&nbsp; </li><li>Reduce Watson failures indicating USB XHCI controller resets </li>
        </ul>
    </span> </div><h2 style="box-sizing:border-box;font-weight:600;"><span style="box-sizing:border-box;color:rgb(118, 62, 155);">Voice
        of the Customer and Business Justification&nbsp;</span> </h2><div style="box-sizing:border-box;">
    <ul>
        <li>Improving the reliability of USB controllers and USB-C PPM firmware will enhance user experience, reduce support costs, and maintain the competitiveness of the Windows platform. These improvements are critical for both inbox drivers and third-party device drivers.&nbsp; </li><li>&nbsp;1: Reduction in the number of USB XHCI controller resets. There are about 7 million reports in 30 days. Considering the 1 billion+ systems with USB controllers that are heavily exercised each day, this is a relatively small number but in absolute terms it still represents failures that cause user dissatisfaction with the product. These are indicative of hardware issues, but we will continue to enhance WHCP tests to detect these are drive quality upstream to reduce the number.&nbsp; </li><li>&nbsp;2: 50% reduction in the number of UCSI LKDs that indicate a failure of the USB-C PPM firmware. Today that number is at ~13 million in 30 days.&nbsp; </li><li>&nbsp;3: Automated UCSI tests through a software UCSI client. Associated HLK test improvements that will drive quality upstream to prevent faulty PPMs from entering the market and contributing to the UCSI failures.&nbsp; </li><li>&nbsp;4: Engineering efficiency improvements that reduce triage and support cost. Improved diagnostics and leverage IFR more effectively.&nbsp; </li><li>&nbsp;5: Reduce Watson failures that indicate USB XHCI controller resets. The USB XHCI stack automatically recovers from a variety of USB host controller failures. While there is a level of self-healing it is not entirely transparent to the user. When the controller needs to reset, every USB device on the controller will observe a re-enumeration. This includes audio devices, input devices, cameras, biometric devices, mobile broadband devices, Bluetooth radios and network adapters. Integrated and external peripheral devices would be impacted. In the best case, the user will experience a transient glitch if the recovery is successful, and applications deal with the re-enumeration robustly. In the worst case, the device could become non-functional and require a reboot to recover. </li>
    </ul> 
</div><h2 style="font-weight:600;box-sizing:border-box;"><span style="box-sizing:border-box;color:rgb(118, 62, 155);">What
        is a Scenario?</span> </h2><span style="color:rgb(32, 33, 34);font-family:&quot;Segoe UI&quot;;">
    <div>A&nbsp;<i>scenario</i>&nbsp;is a specific and tangible experience that we expect to complete and ship in a
        given release. </div></span> More Details at:&nbsp;<a href="https://www.osgwiki.com/wiki/Scenario">https://www.osgwiki.com/wiki/Scenario</a><p> </p><p style="margin:0.5em 0px;color:rgb(32, 33, 34);font-family:&quot;Segoe UI&quot;;"> </p><br><div><strong>Feature Submitted. To See FA Details <a href="https://missioncontrol.windows.net/FeatureAcceptance/56352438">Click Here</a></strong> </div>

<br><div><strong>Feature Submitted. To See FA Details <a href="https://missioncontrol.windows.net/FeatureAcceptance/58002269">Click Here</a></strong> </div>

**Pull Requests:**
No linked pull requests

---

#### [58145457] Sensors Bugfixes for 2510

**Type:** Deliverable | **State:** Completed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58277489] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_ControlLib.dll!destroy_ptd_array

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58368135] [Watson Failure]: Crash caused by ACCESS_VIOLATION_ab8902b4-09ca-4bb6-b78d-a8f59079a8d5_c0000005_IntelControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58444832] [Watson Failure]: Crash caused by 0x133_ISR_LEqdUsb!DjChildIdleRequestCancel

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58732184] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_IntelControlLib.dll!CTL_API::_dynamic_initializer_for__WhitelistedApps__

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58779862] [Watson Failure]: Crash caused by AV_pmdrvs!unknown_function

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58987739] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0489_PID_E10A_IMAGE_btfilter.sys

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59005071] [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_IntelControlLib.dll!CTL_API::OSDisplayOutput::create

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59008115] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::GfxHandler::getDisplayOutputProperties

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59037750] [Watson Failure]: Crash caused by FAIL_FAST_INVALID_NEXT_THREAD_c0000409_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59048362] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!CTL_API::WDDMInterface::GetDeviceAdapters

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59062563] [Watson Failure]: Crash caused by SVCHOSTGROUP_CameraMonitor_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_IntelControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59067386] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_IntelControlLib.dll!CTL_API::GfxHandler::_GfxHandler

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59068564] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59068985] [Watson Failure]: Crash caused by CORRUPT_MODULELIST_ACCESS_VIOLATION_c0000005_IntelControlLib.dll!Unloaded

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59069327] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!CTL_API::KmdSysManager::requestSingle

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59071355] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!CTL_API::DisplayOutputImp::_vector_deleting_destructor_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59075347] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!__acrt_LCMapStringA_stat

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59087848] [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_cfffffff_IntelControlLib.dll!create_environment_char_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59094766] [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_IntelControlLib.dll!CTL_API::OverclockManager::InitOcManager

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59120348] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000096_IntelControlLib.dll!CTL_API::_dynamic_atexit_destructor_for__OSDllsobj__

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59122716] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_ControlLib.dll!GetRuntimeLib

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59140585] [Watson Failure]: Crash caused by AV_AcerAirplaneModeController!unknown_function

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59156862] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!ctlInit

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59171489] [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_btfilter!unknown_function

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59185339] [Watson Failure]: Crash caused by 0xc4_122_LEqdUsb!unknown_function

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59190002] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_MultipleEntriesCorruption_c0000374_IntelControlLib.dll!_dcrt_get_narrow_environment_from_os

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59200040] [Watson Failure]: Crash caused by INVALID_PARAMETER_c000000d_IntelControlLib.dll!free_base

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59215160] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59232343] [Watson Failure]: Crash caused by BREAKPOINT_80000003_ControlLib.dll!_acrt_LCMapStringA

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59242651] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!_acrt_initialize_new_handler

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59245487] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!CTL_API::OverclockManager::PowerTelemetryGet

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59249162] [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_IntelControlLib.dll!CTL_API::KmdSysManager::parseBufferOut

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59262566] [Watson Failure]: Crash caused by SVCHOSTGROUP_BcastDVRUserService_FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_ControlLib.dll!internal_get_ptd_head_slow

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59265910] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!try_get_function_slow

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59296798] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_ControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59297701] [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_ControlLib.dll!_acrt_initialize_stdio

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59297758] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::GfxHandler::_GfxHandler

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59326374] [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_ssps2!MSIECRestore

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59331323] [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ExcessiveThreadsWaitingForPageIn_IMAGE_qci2c7180.sys

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59332194] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_ControlLib.dll!ctlInit2

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59350819] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_0C9E_IMAGE_btfilter.sys

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59368848] [GE LT] Feature_SoftwareOffloadWithClientBuffers | 39615196: Ensure LT And GE branches are identical

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59379519] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_amdfendrsr.exe!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59388177] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!internal_get_ptd_head_slow

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59390770] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_IntelControlLib.dll!CTL_API::_dynamic_atexit_destructor_for__OSDllsobj__

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59411370] [Watson Failure]: Crash caused by FAIL_FAST_CONTROL_INVALID_RETURN_ADDRESS_c0000409_amdfendrsr.exe!unknown_error_in_process

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59415097] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!free_base

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59884289] USB C stopped working after update to Windows 11 25H2

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

### Sensors Component

#### [50034245] [Watson Failure] caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_SensorsApi.dll!Windows::Internal::GitPtrImpl_Windows::Internal::GitPtr_::Initialize_ISensorEvents_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [51711341] [Samsung][24H2][Sensor] Rotation lock button is disappeared and SensorPresent registry value is changed to '0'

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [54956383] [Watson Failure] caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!wil::details_abi::RawUsageIndex::RecordUsageInternal

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [54975795] [Watson Failure] caused by ACCESS_VIOLATION_1007_Windows.Devices.Sensors.dll!ViewPositionTracker::UnregisterFromDisplayRegionChanges

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [55188405] [Watson Failure] caused by INVALID_EXCEPTION_HANDLER_c00001a5_SensorsNativeApi.V2.dll!Unloaded

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [55223326] LENOVO:24H2:PUSH BUTTON RESET: "Turn off my screen when I leave" turned OFF after OS Refresh

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [55354476] [Lenovo][Aladdin][24H2][HPD][dimming]Adaptive dimming lose function after resume from S4/S5 if set timeout value is “never“ in  system power setting.(FR:3/3units;6/6cycles)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [55450504] [Watson Failure] caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_SensorService.HumanPresenceExtensionManager.FuncTests.dll!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [55581370] Stuck in portrait mode. Sensor not respoding and rotation lock is greyed out in Quick Settings

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [55603917] [HP][Win11 24H2]:HPD sensor items in "screen ,sleep&hibernate timeouts" automatically became off after did Reset(keep my file).(ARM)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [55794227] [Lenovo][24H2][Sensors][LCFC][T14/P14S AMD]The screen will turn off directly without dimming process when "Turn off my screen when I leave" is set to 2 minutes and move away from the unit for 140cm(HPD vendor debug it is OS issue).(FR:2/2 units,3/8 trials

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [56000112] [Hardware Confirmator]The brightness should not increase or decrease accordingly, while trying to change the brightness the slider is at the initial point

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [56863270] [WinVOS][WinVOSFull]Failed LightSensorTests::ThresholdProperties: AreEqual(sensor->ReportThreshold->Chromaticity.X, chromaticityThreshold.X) - Values (0.000000l, 1.234500l)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [57131368] [Watson Failure] caused by APPLICATION_HANG_c0000194_sensrsvc.dll!unknown_error_in_service

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [57175934] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsApi.dll!CSensorV2::_scalar_deleting_destructor_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [57248509] [Lenovo][LCFC][Alloy_Intel_LNL][ThinkPad X9-14]The system display will appear the process of dimming after set to '30s' in Then, turn off my screen after this amount of time option

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [57849257] [Watson Failure] caused by SVCHOSTGROUP_Camera_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsNativeApi.V2.dll!_dynamic_initializer_for__g_HistorySubscriberList__

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58048673] [Watson Failure] caused by ACCESS_VIOLATION_c0000005_SensorsNativeApi.V2.dll!Sensors::SimpleDeviceOrientationRpcClient::MemberThreadCallback

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58064112] [Watson Failure] caused by BREAKPOINT_AVRF_80000003_SensorsNativeApi.V2.dll!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58064193] [Watson Failure] caused by BREAKPOINT_AVRF_80000003_SensorsV2Clx.E2E.Tests.dll!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58117716] [Watson Failure] caused by INVALID_PARAMETER_c000000d_SensorsNativeApi.V2.dll!PnpManagerBase::Teardown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58194974] [HP][CashmereI][Win11][25H2] The HPD default settings are different between 24H2 and 25H2.

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58277021] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_WDF_WAIT_TIMEOUT_BatteryCritical_IMAGE_SurfacePowerMeterDriver.sys

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58277626] [Diomedes][From Jade][N1X][Camera] Calling the WinRT sensor API during ADK testing takes a long time.

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58311830] [HP][HDE][CashmereQ][8480] The HPD function cannot be modify via Windows settings.

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58349496] [Watson Failure]: Crash caused by APPLICATION_HANG_Orphaned_CriticalSection_c0000194_SensorsNativeApi.V2.dll!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58400097] [HP][HDE][CashmereQ][QC 8480][27871 build][25H2]How to implement with "System do not rotate but keep Accel is reporting to OS on clamshell form factor unit"

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58466494] [Acer][OEMQ] Multi-person detection: DUT misidentifies onlooker as main user after main user leaves, leading to privacy concern

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58466642] [Acer][OEMQ] Multi-person detection: Privacy concern due to lack of dimming/notification for sideways peeking (as per current design) 

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58466643] [Acer][OEMQ] Multi-person detection: The Dismiss button is ineffective

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58466644] [Acer][OEMQ] Multi-person detection: No notification triggered when a third person peeks

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58483439] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_80000003_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::Transition::TransitionTableImpl::TransitionTableImpl

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58548079] [Watson Failure]: Crash caused by STACK_OVERFLOW_800700a4_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcClient::DeManagementRpcClientImpl::GetIsBrightnessCapable

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58639769] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsApi.dll!Microsoft::WRL::ComPtr_IUnknown_::InternalRelease

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58704603] [RI-TP] Failed NotificationSettingsTests::CheckRegisteredSystemProviders: IsTrue(IsInList( k_RegisteredSystemApplications, ARRAYSIZE(k_RegisteredSystemApplications), subKeyName)): Windows.SystemToast.PresenceSensing.OnlookerDetection

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58750897] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!ViewPositionChangeNotificationInternal::_ViewPositionChangeNotificationInternal

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58752061] [Lenovo][Think][25H2][Onlooker Detection][Presence Sensing] There is no option available for the "Onlooker Detection" feature under Presence Sensing settings page

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58808457] [Watson Failure]: Crash caused by APPLICATION_FAULT_c0000194_WinRTSensors.FuncTests.CppCx.dll!unknown_error_in_taef

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58825823] [Watson Failure]: Crash caused by CLR_EXCEPTION_System.ComponentModel.Win32Exception_80004005_Compass.exe!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58840007] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_ACCESS_VIOLATION_c0000005_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58928578] Lenovo:LCFC:25H2_Upgrade:"Turn off my screen when I leave" and "Wake my device when I approach" are OFF even if Turn on in OOBE Privacy setting page.(FR:2/2 units,2/2 cycles)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58951279] [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::LightSensorFactory::GetDefault

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58981887] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58982737] [ASUS][PC] Regkey of "IsAdaptiveColorOnByDefault" doesn't work

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [58999573] [Watson Failure]: Crash caused by APPLICATION_HANG_cfffffff_Windows.Graphics.Display.BrightnessOverride.dll!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59008053] [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ActivitySensorServer::get_ActiveInLowPowerMode

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59040796] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::ExtractAccelerometerVector

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59042444] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcClient::DeManagementRpcClientAdapterImpl::OpenFromMonitorId

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59046046] [Watson Failure]: Crash caused by CLR_EXCEPTION_System.Xaml.XamlObjectWriterException_80131500_Compass.exe!unknown_function

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59053956] [Watson Failure]: Crash caused by BREAKPOINT_80000003_Windows.Devices.Sensors.dll!__scrt_initialize_crt

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59053991] [Watson Failure]: Crash caused by SVCHOSTGROUP_netsvcs_BREAKPOINT_80000003_Windows.Devices.Sensors.dll!__scrt_initialize_crt

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59059758] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsApi.dll!wil::details::functor_wrapper_void__lambda_65197f76560d04008ad318197229ec2e___::Run

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59066512] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_sensrsvc.dll!CSensorEnsemble::SetISensor

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59077568] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_Windows.Devices.Sensors.dll!wil::details::ResultFromCaughtExceptionInternal

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59087804] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::CustomPropertiesMapServer::_CustomPropertiesMapServer

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59089167] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_c0000005_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcServer::DeManagementRpcServerImpl::Remove

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59120177] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsApi.dll!SensorCloseCOM

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59121591] [Watson Failure]: Crash caused by CLR_EXCEPTION_80070005_sensordiagnostictool.exe!unknown_function

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59127558] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ILLEGAL_INSTRUCTION_c000001d_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Bluetooth::Foundation::TokenWithStatusControl_Microsoft::Windows::DisplayEnhanceme

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59132320] [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_cfffffff_SensorsApi.dll!SimpleDeviceOrientationSensor::SetEventSink

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59134047] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_VERIFIER_STOP_AVRF_c0000421_sensorservice.dll!ExternalDisplayConnectedNotifications::OnDisplayAdded

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59136307] [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!wil::details::FeatureImpl___WilFeatureTraits_Feature_TestConfNum_::GetCachedFeatureEnabledState

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59136498] [Watson Failure]: Crash caused by APPLICATION_HANG_XPROC_BusyHang_cfffffff_Windows.Graphics.Display.BrightnessOverride.dll!GetForWindowCommon

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59137924] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_Windows.Devices.Sensors.dll!_dynamic_atexit_destructor_for___AtlModule__

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59141801] [Watson Failure]: Crash caused by SVCHOSTGROUP_CameraMonitor_ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::TransformSensorReading_enum_Windows::Devices::Sensors::SimpleOrientation_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59148316] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Graphics.Display.DisplayEnhancementOverride.dll!Microsoft::WRL::Details::DelegateArgTraits_long_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59148806] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ILLEGAL_INSTRUCTION_c000001d_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::Coordinator::DeRequestCoordinatorImpl::SelectHighestT

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59155561] [Watson Failure]: Crash caused by SVCHOSTGROUP_Camera_ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::GetDataOrientation

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59165909] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::CreateActivationFactory_Windows::Devices::Sensors::HingeAngleSensorFactory_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59166347] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::GyrometerServer::QueryInterface

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59171514] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::ComPtr_Windows::Devices::Sensors::AccelerometerServer_::Attach

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59191121] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll![thunk]:Microsoft::WRL::ActivationFactory_Microsoft::WRL::Implements_Microsoft::WRL::FtmBase,Windows::Devices::Sensors::Internal::ISensorStatics_,Microsoft::WRL::Detai

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59193082] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!o___std_type_info_destroy_list

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59197497] Caught Platform::Exception^: Access is denied.  onecoreuap\drivers\mobilepc\displayenhancement\test\dessimulator\softwaredessimulator.cpp(22)\Microsoft.Graphics.DisplayEnhancements.BrightnessHotkeys.Functi:  Exception(1)  80070005 Access is denied.  

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59200337] [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::InclinometerFactory::GetDefault

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59203376] [Watson Failure]: Crash caused by MOAPPLICATION_HANG_cfffffff_Windows.Devices.Sensors.dll![thunk]:Microsoft::WRL::Details::RuntimeClassImpl_Microsoft::WRL::RuntimeClassFlags_1_,1,1,0,Microsoft::WRL::FtmBase,Windows::Devices::Sensors::IPedometer,Windows::D

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59203550] [Watson Failure]: Crash caused by BREAKPOINT_AVRF_80000003_SensorsNativeApi.dll!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59213661] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll![thunk]:Windows::Devices::Sensors::PedometerDataThresholdServer::Release_adjustor{48}_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59218870] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_HEAP_CORRUPTION_ACTIONABLE_BlockNotBusy_DOUBLE_FREE_c0000374_SensorsApi.dll!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59219732] [RI-TP] Failed AltimeterTests::ReadingChanged#metadataSet0: IsLessThanOrEqual(diffInMsec, tolerableDelay) - Values (141623, 5000)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59239072] [Watson Failure]: Crash caused by IN_PAGE_ERROR_c0000102_c0000006_Windows.Devices.Sensors.dll!_string_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59241158] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BufferOverrun_c0000374_SensorsUtilsV2.dll!CollectionsListDeserializeFromBuffer

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59245073] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_8007023e_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59250992] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_ACCESS_VIOLATION_c0000005_SensorsApi.dll!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59264469] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!TlgRegisterAggregateProviderEx

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59271238] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_OOM_HighPagedPool_c00000fd_microsoft.graphics.display.displayenhancementservice.dll!out_of_memory

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59275762] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorFactory::_scalar_deleting_destructor_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59279277] [RI-TP] Failed SensorServiceFuncTests::PnpStateTransitions: IsTrue((!isAccelerometerPresent && !isSdoPresent) ? (availableDeviceInterfaces.size() == 0) : (isSdoPresent ? (availableDeviceInterfaces.size() == 2) : (availableDeviceInterfaces.size() == 1)))

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59291042] [Watson Failure]: Crash caused by IN_PAGE_ERROR_c000009c_c0000006_Windows.Devices.Sensors.dll!_NULL_IMPORT_DESCRIPTOR

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59292695] [Watson Failure]: Crash caused by STACK_OVERFLOW_80070490_Windows.Devices.Sensors.dll!SimpleOrientation::InitializeDefaultByType

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59294415] [RI-TP] AreEqual(expectedIsValidState ? HumanPresence::Present : HumanPresence::Unknown, reading->Presence) - Values (1, 0)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59308856] [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Internal::GitEventSource_Windows::Foundation::ITypedEventHandler_Windows::Devices::Sensors::LightSensor_*,Windows::Devices::Sensors::LightS

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59309704] [RI-TP] AreEqual(static_cast<boolean>(expectedIsValidState), value) - Values (1, 0)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59312420] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!wil_details_FeatureReporting_RecordUsageInCache

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59315631] Failed Microsoft::Windows::DisplayEnhancement::FuncTests::AutobrightnessTests::BatterySaverBrightnessMultiplierTest: AreEqual(GetBrightnessPowerGuidValue(), targetBrightness) - Values (80, 100)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59322185] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_c0000005_sensorservice.dll!History::RetrieveHistoryFromSensor

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59323709] [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::QueryInterface

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59324179] [Watson Failure]: Crash caused by IN_PAGE_ERROR_c000009c_c0000006_Windows.Devices.Sensors.dll!_imp_BiRtDeleteEventForApp

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59325364] [Watson Failure]: Crash caused by MOAPPLICATION_HANG_cfffffff_Windows.Graphics.Display.DisplayEnhancementOverride.dll!guard_dispatch_icall$thunk$10345483385596137414

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59327467] [RI-TP] Failed \WinRTSensors.FuncTests.CppCx.dll/SimpleOrientationSensorTests/SimpleOrientationSensorTests::ClassSetup: Setup fixture 'SimpleOrientationSensorTests::ClassSetup' for the scope 'SimpleOrientationSensorTests' returned 'false'.

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59327699] [RI-TP] Failed HumanPresenceExtensionManagerTests::SensorAdapterProcessReadingFails: AreEqual(detectionDistanceInMillimeters, expectedDistanceInMillimeters) - Values (0, 4000)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59329695] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorFactory::GetDefault

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59330419] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorReadingChangedEventArgsServer::_scalar_deleting_destructor_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59331183] [Watson Failure]: Crash caused by APPLICATION_FAULT_c00000aa_SensorsApi.dll!Windows::Internal::GitPtrImpl_Windows::Internal::GitPtr_::Initialize_ISensorEvents_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59333995] [RI-TP] Failed HumanPresenceExtensionManagerTests::SensorAdapterProcessReadingTimeoutExpiredFails: AreEqual(sharedMemoryBlock->CallsCount_ProcessReadingTimeoutExpired, 1u) - Values (0, 1)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59342675] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_SensorsApi.dll!Microsoft::WRL::ComPtr_IUnknown_::InternalRelease

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59345129] [Watson Failure]: Crash caused by CLR_EXCEPTION_80132006_dc.exe!unknown_function

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59348646] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Bluetooth::Foundation::TokenWithStatusControl_Microsoft::Windows::

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59359255] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::MakeAndInitialize_Windows::Devices::Sensors::GyrometerServer,Windows::Devices::Sensors::GyrometerServer_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59361366] [Watson Failure]: Crash caused by APPLICATION_HANG_Unowned_CriticalSection_c0000194_SensorsUtilsV2.dll!SerializationBufferFree

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59361939] [RI-TP] AreEqual(static_cast<HRESULT>(RPC_S_CALLPENDING), CoWaitForMultipleHandles( COWAIT_DISPATCH_CALLS | COWAIT_DISPATCH_WINDOW_MESSAGES, s_readingChangeWaitTimeInMilliSeconds, 1, readingChangedEvent.addressof(), &indexUsed)) - Values (0x80010115, 0x0)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59366134] [WinVOS][WinVOSFull]Failed AccelerometerTests::ReadingChanged#metadataSet3: SUCCEEDED(CoWaitForMultipleHandles( COWAIT_DISPATCH_CALLS | COWAIT_DISPATCH_WINDOW_MESSAGES, timeoutMs, 1, &(rawCompletedEvent), &eventIndexUnused)): Failed to get a ReadingChange

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59367395] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsUtilsV2.dll!MIDL_user_allocate

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59374463] [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::remove_ReadingChanged

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59376729] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Compass.exe!unknown_error_in_process

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59377415] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_AVRF_c0000409_SensorService.HumanPresenceMonitor.UnitTests.dll!Unknown

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59378696] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::MakeAndInitialize_Windows::Devices::Sensors::InclinometerFactory,Windows::Devices::Sensors::InclinometerFactory_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59379366] [Watson Failure]: Crash caused by SVCHOSTGROUP_WbioSvcGroup_ASSERTION_FAILURE_c0000420_SensorsApi.dll!_CClassExtensionProxy::EnQueue_::_1_::catch$9

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59382125] Failed Microsoft.Graphics.DisplayEnhancements.AdaptiveColor.FunctionalTests.testmd [Double Nits Monitor]: Error trace not within a test case. - (Error=0x800705b4) Failed to enable provider

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59392055] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::AccelerometerServer::ProcessReadings

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59394281] [RI-TP] AreEqual(expectedPersonIdVector[i], UINT32_MAX) - Values (1, 4294967295)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59403376] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::WRL::ActivationFactory_Microsoft::WRL::Implements_Microsoft::WRL::FtmBase,Windows::Internal::Graphics::Display::Displ

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59410594] [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_Windows.Devices.Sensors.dll!ViewPositionTracker::RegisterForDisplayRegionChanges

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59410966] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::AccelerometerReadingServer::_scalar_deleting_destructor_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59413586] IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59414558] [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_80070490_Windows.Devices.Sensors.dll!wil::details::WilFailureNotifyWatchers

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59416556] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::CreateActivationFactory_Windows::Devices::Sensors::OrientationSensorFactory_

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59416853] [RI-TP] Failed HumanPresenceMonitorFactoryTests::SensorSelectionTest: IsGreaterThanOrEqual(availableSensors.size(), static_cast<size_t>(3)) - Values (0, 3)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59419515] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::GetNativeOrientationFromVideoOutput

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59427333] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SettingsHandlers_HumanPresence.dll!wil::details::functor_wrapper_void__lambda_260b81f2231255642d6c288569aacead___::Run

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59447935] [RI-TP] AreEqual(true, dataExpected) - Values (1, 0)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59450916] [RI-TP] Failed HumanPresenceSensorTests::GetCurrentReadingValidation: AreEqual(reading2->Presence, detectionState ? HumanPresence::Present : HumanPresence::NotPresent) - Values (1, 2)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59458630] Failed Microsoft::Windows::DisplayEnhancement::DeoRpcServer::UnitTests::DeoRpcServerUnittests::SimpleStartStopOverrideTest: IsTrue(verifier.verify_success_and_count<BrightnessOverrideTest>(1))

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59468868] IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59645373] Hardware | Wistron Corporation | Gradual Rollout failed

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59656544] Failed Windows.Graphics.Display.BrightnessOverride.ApiTests.testmd [Single Nits Monitor - No ALS]: Error trace not within a test case. - (Error=0x800705b4) Failed to enable provider

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59659748] [RI-TP] AreEqual(expectedIsValidState ? HumanPresence::Present : HumanPresence::Unknown, reading->Presence) - Values (1, 0)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59693022] After the update, the adaptive color option is removed from Settings app.

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59696259] [Lenovo][HDE][Avon][Think][OEMQ] How to customize Microsoft Adaptive Brightness curve for BC2

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59793191] [RI-TP] Calling handle succesfully despite access revocation, failing test

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59852467] Failed ManualBrightnessTests::AutobrightnessEnableDisableTest: IsFalse(display->IsMonitorBrightnessCloseToExpectedLevel(static_cast<BrightnessPercentage>(manualBrightnessSliderStrength)))

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

#### [59880170] IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)

**Type:** Bug | **State:** Closed

**Description:**


**Pull Requests:**
No linked pull requests

---

## Technical Highlights

### Major Features Implemented
- No major features in this iteration

### Critical Bugs Fixed
- [18885708] [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0304_REV_0000_FW_300A
- [38311952] [USB4] [AMD] Lockheed System hangs for ~10 seconds when unplugging a USB4 hub
- [38541882] [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_15db_REV_0002
- [38542052] [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ee_REV_0000
- [38542772] [Watson Failure] caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000
- [38543421] [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a0ed_REV_0020
- [38543476] [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43d5_REV_0001
- [38543735] [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ee_REV_0000
- [38543947] [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000
- [38544403] [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_51ed_REV_0001
- [38544511] [Watson Failure] caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e5_REV_0000
- [38544534] [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43d5_REV_0001
- [38544986] [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000
- [38545118] [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e0_REV_0000
- [38545492] [Watson Failure] caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13400
- [38545847] [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1033_DEV_0194_REV_0004_FW_3034
- [38573466] [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ee_REV_0000
- [38574581] [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ec_REV_0000
- [38575295] [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_149c_REV_0000
- [38576207] [Watson Failure] caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_190826703940
- [38576442] [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43bc_REV_0002
- [38577190] [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43d1_REV_0001
- [38577582] [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e0_REV_0000
- [38577967] [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13400
- [38578106] [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15d7_REV_0000
- [38578205] [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15d7_REV_0000
- [38581074] [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1912_DEV_0015_REV_0002
- [38584496] [Watson Failure] caused by LKD_0x144_RESET_RECOVERY_STOP_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600
- [38584499] [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600
- [38584505] [Watson Failure] caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600
- [38586993] [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43ec_REV_0000
- [38590533] [Watson Failure] caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000
- [38591458] [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a2af_REV_0000
- [38592238] [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1106_DEV_3483_REV_0001_FW_13600
- [38595306] [Watson Failure] caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_1639_REV_0000
- [38598753] [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1912_DEV_0014_REV_0003
- [38641585] [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000
- [38695031] [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1042_REV_0000_FW_110930000253
- [38835374] [Watson Failure] caused by HEAP_CORRUPTION_c0000005_WUDFHost.exe!heap_corruption
- [38865368] [Watson Failure] caused by HEAP_CORRUPTION_c0000374_WUDFHost.exe!unknown_error_in_process
- [39093269] [Watson Failure] caused by 0x10D_4_ucx01000!Urb_LegacyTransferUrbCompletion
- [39159979] HP AMD USB4 High Priority bug - USB4 Domain does not power down due to PCIe root port's power dependency on USB4 
- [40018120] [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f7_REV_0001
- [40290466] [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_7a60_REV_0011
- [43965240] VIA: Custom CL2 Validation Binaries
- [44043691] [usbxhci] Device disable taking longer than 10mins, causing driver-verifier violation
- [44301138] [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1912_DEV_0014_REV_0003
- [46073780] [Watson Failure] caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15c0_REV_0000
- [46237325] [Watson Failure] caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15c1_REV_0000
- [47145073] [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b6f_DEV_7023_REV_0001_FW_206004F3
- [47252267] Request for Razer team to provide USB4 HLK logs on SV2 HLK
- [49613338] [SC8380 WD 1.0]: (LoadLibrary fails) YB is observed in device manager for Secure ISP driver with Camitto reboot scenario.
- [50034245] [Watson Failure] caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_SensorsApi.dll!Windows::Internal::GitPtrImpl_Windows::Internal::GitPtr_::Initialize_ISensorEvents_
- [50929990] [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1b6f_DEV_7023_REV_0001_FW_206004F3
- [51711341] [Samsung][24H2][Sensor] Rotation lock button is disappeared and SensorPresent registry value is changed to '0'
- [51869293] [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!unknown_function_VEN_1022_DEV_1639_REV_00
- [51884377] [Watson Failure] caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0D09_REV_0000_FW_330A
- [52051071] [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_0C27_PID_CCDA_MI_00_IMAGE_hidusb.sys
- [52268988] [Watson Failure] caused by AV_R_(null)_USBXHCI!Control_WdfEvtIoDefault
- [52302676] [Watson Failure] caused by 0xCE_IMAGE_ufx01000.sys
- [53434937] [Watson Failure] caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!unknown_function_VEN_1022_DEV_149C_REV_00
- [53723445] [Watson Failure] caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_I3cEndToEndTest.dll!Unknown
- [53948634] [Watson Failure] caused by AV_R_(null)_ucx01000!Urb_ValidatePipeHandle
- [53953254] [Watson Failure] caused by WRONG_SYMBOLS_ARM64_10.0.25131.1000.arm64fre.rs_prerelease.220527-1351_TIMESTAMP_590920-184823_A8C259F7_nt_wrong_symbols!A8C259F7103F000
- [54024821] [Watson Failure] caused by LKD_0x144_HOST_SYSTEM_ERROR_USBXHCI!unknown_function_VEN_1022_DEV_43F7_REV_01
- [54068565] [Watson Failure] caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!unknown_function_VEN_1022_DEV_43EE_REV_00
- [54085600] [Watson Failure] caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!unknown_function_VEN_1022_DEV_1639_REV_00
- [54091771] [Watson Failure] caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_UsbHub3!unknown_function
- [54489919] [I3C] Performance timing throughput lower than expected on AMD Read
- [54529555] [Huaqin][Lenovo][GHD][Altai][8340]The brightness can't be control by hotkey and OSD,but can change in OS setting. FR:1/200 UUts
- [54672828] [Watson Failure] caused by CORRUPT_MODULELIST_INVALID_HANDLE_c0000008_WUDFHost.exe!unknown_error_in_process
- [54956383] [Watson Failure] caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!wil::details_abi::RawUsageIndex::RecordUsageInternal
- [54975795] [Watson Failure] caused by ACCESS_VIOLATION_1007_Windows.Devices.Sensors.dll!ViewPositionTracker::UnregisterFromDisplayRegionChanges
- [55188405] [Watson Failure] caused by INVALID_EXCEPTION_HANDLER_c00001a5_SensorsNativeApi.V2.dll!Unloaded
- [55223326] LENOVO:24H2:PUSH BUTTON RESET: "Turn off my screen when I leave" turned OFF after OS Refresh
- [55354476] [Lenovo][Aladdin][24H2][HPD][dimming]Adaptive dimming lose function after resume from S4/S5 if set timeout value is “never“ in  system power setting.(FR:3/3units;6/6cycles)
- [55411096] [Watson Failure] caused by ACCESS_VIOLATION_c0000005_WUDFx02000.dll!FxObjectHandleGetPtr
- [55450504] [Watson Failure] caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_SensorService.HumanPresenceExtensionManager.FuncTests.dll!Unknown
- [55581370] Stuck in portrait mode. Sensor not respoding and rotation lock is greyed out in Quick Settings
- [55603917] [HP][Win11 24H2]:HPD sensor items in "screen ,sleep&hibernate timeouts" automatically became off after did Reset(keep my file).(ARM)
- [55794227] [Lenovo][24H2][Sensors][LCFC][T14/P14S AMD]The screen will turn off directly without dimming process when "Turn off my screen when I leave" is set to 2 minutes and move away from the unit for 140cm(HPD vendor debug it is OS issue).(FR:2/2 units,3/8 trials
- [55913260] [Watson Failure] caused by AV_W_(null)_ucx01000!UrbHandler_USBPORTStyle_Legacy_IsochTransfer
- [56000112] [Hardware Confirmator]The brightness should not increase or decrease accordingly, while trying to change the brightness the slider is at the initial point
- [56071437] [Dell][Renegade_ARL][Win11_24H2] WD19TBS update NVM FW fail (error code 0x229).
- [56241741] [I3C] Targets that hot-join should recycle dynamic addresses
- [56381862] USB ports have incorrect configuration in ACPI
- [56414704] [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pullrequestloop.c
- [56414705] [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\readreportloop.c
- [56495092] [Watson Failure] caused by HEAP_CORRUPTION_ACTIONABLE_Generic_c0000374_WUDFHost.exe!unknown_error_in_process
- [56626507] [Lenovo Y5x0][LCFC][ARL-HX][RVP][B0] [24H2] XHCI PME_sts bit not be cleared after plug in/out USB keyboard several times in windows and lead system will be auto waked when enter into S3.
- [56684719] [UMDF-WIFICX][FeatureGap][Intel][WIN11][NetAdapter] Secondary bus reset
- [56684720] [WIN11][NetAdapter][UMDF] Process dump - No driver logs
- [56850757] [HLK][Feedback] Questions on Device.DevFund.DriverFramework.UMDF.DMA
- [56863270] [WinVOS][WinVOSFull]Failed LightSensorTests::ThresholdProperties: AreEqual(sensor->ReportThreshold->Chromaticity.X, chromaticityThreshold.X) - Values (0.000000l, 1.234500l)
- [56871449] Glymur BU | CRD | Device fails to wake up from sleep mode when using the built-in keyboard or trackpad
- [56917409] [Diomedes] USB3/USB4 controllers (and a total of 27 devices) are being marked as non cache coherent leading to correctness/functionality/performance issues on N1X
- [56926164] [Watson Failure] caused by DELPHI_EXCEPTION_eedfade_Toast.exe!unknown_error_in_process
- [56997778] 8480_0x0_SNPE - QC controller timed out responding to stop endpoint command
- [57020598] [Watson Failure] caused by AV_NULL_IP_Wdf01000!FxPkgPnp::m_WdfPowerStates
- [57044588] [Glymur][SS IOP] [Intermittent] 0x133_SINGLE_DPC_WATCHDOG_TIMEOUT 
- [57131368] [Watson Failure] caused by APPLICATION_HANG_c0000194_sensrsvc.dll!unknown_error_in_service
- [57159592] [Dell][Wistron][DiabloARL] BSOD WDF_VIOLATION (10d) occur while run S4 stress (IMAGE_NAME:  USBXHCI.SYS)
- [57169645] [MSFT I3C HCI Driver][STRIX1 I3C][v5] Observed error for GetStatus and ReducedTransferSpeed SuperMITT tests while running all test in sequence  and error is pointing to frequency is greater than expected frequency (SWDEV-526100)
- [57175934] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsApi.dll!CSensorV2::_scalar_deleting_destructor_
- [57211939] [Dell][Wistron][DiabloARL] BSOD SYSTEM_THREAD_EXCEPTION_NOT_HANDLED (7e) occur when system run S4 sresss with connecting dock SD25TB4 (IMAGE_NAME:  USBXHCI.SYS)
- [57248509] [Lenovo][LCFC][Alloy_Intel_LNL][ThinkPad X9-14]The system display will appear the process of dimming after set to '30s' in Then, turn off my screen after this amount of time option
- [57289323] [AMD][SHP_SP6][HLK][WIN10]System HLK test "USB Type-C UCM Disable Enable Test" failed due to parameters setting screen not displayed.
- [57292515] [I3C] Get status IOCTL does not fail when target returns incomplete payload
- [57420817] [PTL][PPV] Innodisk USB thumb drive prevent system to enter pkg c-states (implement a SW workaround for Intel Pantherlake systems to enter package C-State when a USB SS device is attached)
- [57439125] [Compat][Se][BT Speaker]: When connected to Bluetooth device and switching between audio outputs, Audio freezes for a while and resumes after some time
- [57465349] [KRK2][GNB][Security] Dual camera can't be supported during enrolling facial recognition (Windows Hello) . (SWDEV-531244)
- [57544549] UcmCx to skip USB host stack loading when port partner claims not usb communication capable
- [57553891] [Glymur][USB4 IOP][Cert][Topology-54][P1, P2, P3] Observed ping communication failure while transferring files from DUT to MAC
- [57734810] [Diomedes] DPC Timeout (0x133) bugcheck from nvasd.sys driver
- [57778671] [Diomedes] 0x7e bugcheck in XHCI filter driver during boot with DP Alt-Mode and USB3 connected to system
- [57849257] [Watson Failure] caused by SVCHOSTGROUP_Camera_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsNativeApi.V2.dll!_dynamic_initializer_for__g_HistorySubscriberList__
- [57909081] [I3C] MmTransportPioTx can be torn down before SM processes deinitialize event
- [57971338] [Watson Failure] caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_IMAGE_serenum.sys
- [57976511] [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.H_EC._Q79_ACPI_IMAGE_UsbHub3.sys
- [57988302] [Watson Failure] caused by AV_USBXHCI!UsbDevice_UcxEvtReset
- [57993572] [Watson Failure] caused by AV_R_iaLPSS2i_I2C!ControllerDoRead
- [57996291] [Watson Failure] caused by 0x9F_3_epbmtusb_IMAGE_UsbHub3.sys
- [58007296] [Watson Failure] caused by AV_R_USBXHCI!RootHub_DetectPortInComplianceMode
- [58016644] [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_0483_PID_A0CB_IMAGE_hidusb.sys
- [58019358] [Watson Failure] caused by AV_R_(null)_ucx01000!McGenControlCallbackV2
- [58020449] [Watson Failure] caused by 0x9F_3_athurx_IMAGE_UsbHub3.sys
- [58021649] [Watson Failure] caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_8d31_REV_0005
- [58034500] [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1033_DEV_0194_REV_0003
- [58036210] [Watson Failure] caused by AV_R_(null)_Wdf01000!FxEventQueue::EventQueueWorker
- [58037044] [Watson Failure] caused by LKD_0x144_RESET_RECOVERY_RESTART_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_NVDA_DEV_8000_REV_0000
- [58046890] [Watson Failure] caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!unknown_function_VEN_1912_DEV_0014_REV_03
- [58048673] [Watson Failure] caused by ACCESS_VIOLATION_c0000005_SensorsNativeApi.V2.dll!Sensors::SimpleDeviceOrientationRpcClient::MemberThreadCallback
- [58048994] [Watson Failure] caused by AV_R_(null)_usbccgp.sys!Unloaded
- [58050338] [I3C] IBI DPC not guaranteed to have completed before StopHostControllerInstance() returns
- [58051034] [Watson Failure] caused by 0xE6_26_i8042prt!I8xReadPortUchar
- [58052163] [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.EC0._Q0B_ACPI_IMAGE_USBXHCI.SYS
- [58052835] [Watson Failure] caused by 0xFC_HIDCLASS!WPP_1f4ed73904893c554f67e96aacd5f52a_Traceguids
- [58053718] [Watson Failure] caused by 0x9F_3_POWER_DOWN_WDF_WAIT_TIMEOUT_BatteryLow_IMAGE_HID_PCI
- [58058720] [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.ECDV.TMEM._TMP_ACPI_BatteryCritical_IMAGE_UsbHub3.sys
- [58060161] [Watson Failure] caused by 0x9F_3_AML!_SB.AWAC._STA_ACPI_IMAGE_UsbHub3.sys
- [58061644] [Watson Failure] caused by 0x133_ISR_HIDPARSE!HidP_GetCollectionDescription
- [58061755] [Watson Failure] caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_150707300222
- [58062697] [Watson Failure] caused by 0x133_ISR_USBXHCI!Controller_UpdateIdleTimeoutOnControllerFDOD0Entry
- [58064112] [Watson Failure] caused by BREAKPOINT_AVRF_80000003_SensorsNativeApi.V2.dll!Unknown
- [58064193] [Watson Failure] caused by BREAKPOINT_AVRF_80000003_SensorsV2Clx.E2E.Tests.dll!Unknown
- [58064997] [Watson Failure] caused by 0x3B_C000001D_WUDFRd!RdFdoDevice::RdIoReply
- [58065479] [Watson Failure] caused by AV_SynTP_Wdf01000!FxRequestBase::_FxRequestBase
- [58065786] [Watson Failure] caused by AV_BTHport!SmFx::StateMachineEngine::StateMachineEngineImpl::Deinitialize
- [58066798] [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_046A_PID_0704_IMAGE_hidusb.sys
- [58069088] [Watson Failure] caused by 0x133_DPC_USBXHCI_Wdf01000!FxObject::ClearEvtCallbacks
- [58071255] [Watson Failure] caused by 0x139_0_LEGACY_GS_VIOLATION_mouhid!MouHid_ReadComplete
- [58071371] [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_05C8_PID_0831_IMAGE_usbccgp.sys
- [58071375] [Watson Failure] caused by 0x133_ISR_UsbHub3!wil_details_EvaluateFeatureDependencies
- [58076792] [Watson Failure] caused by 0x133_DPC_usbehci!EHCI_InterruptService
- [58082995] [Watson Failure] caused by 0x133_ISR_UcmUcsiAcpiClient!UcmUcsiAcpiClient::Ppm::QueryConnectorsAndInitCollection
- [58084516] [Watson Failure] caused by 0x133_DPC_USBXHCI!RootHub_UcxEvtGetPortStatus
- [58085955] [Watson Failure] caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_0990_IMAGE_usbccgp.sys
- [58089769] [Watson Failure] caused by 0x7E_C000001D_BAD_IP_hidusb!HumPnP
- [58090796] [Watson Failure] caused by 0x9F_4_USB_rtux64w7_IMAGE_UsbHub3.sys
- [58103251] [Watson Failure] caused by LKD_0x144_BOOT_DEVICE_FAILED_UsbHub3!HUBMISC_BugcheckSystemOnBootDeviceEnumerationFailure_VID_AA55_PID_0610_REV_6052
- [58109095] [Watson Failure] caused by 0xFE_BAD_SIGNATURE_USBPORT!USBPORT_TxCsqAcquireLock
- [58115014] [Diomedes] CAS leading to xHCI YB error
- [58117716] [Watson Failure] caused by INVALID_PARAMETER_c000000d_SensorsNativeApi.V2.dll!PnpManagerBase::Teardown
- [58134113] [Watson Failure] caused by 0x9F_3_AML!_SB.PCI0.LPCB.EC0.SEN2._TMP_ACPI_IMAGE_UsbHub3.sys
- [58150716] [Watson Failure] caused by 0x133_DPC_1394ohci!IoWorkers::RemoveIoWorkerFromTransmitList
- [58156245] [Watson Failure]: Crash caused by AV_W_(null)_USBXHCI!Controller_RaiseAndTrackIrql
- [58156598] [Watson Failure]: Crash caused by AV_WUDFRd!WdfLpc::ValidateReplyMessage
- [58159917] [Watson Failure] caused by 0xE6_26_VenId0x8086_DevId0x15EC_USBXHCI!Interrupter_WdfEvtInterruptIsr
- [58160173] [Watson Failure] caused by 0x9F_3_Nau88L24Rvp_Wdf01000!FxWakeInterruptMachine::Dx
- [58160310] [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_ISH!unknown_function
- [58176919] [Watson Failure] caused by 0xFC_usbccgp!_string_
- [58179052] [Watson Failure]: Crash caused by 0x9F_3_RtkBtfilter_BatteryLow_ExcessiveThreadsWaitingForPageIn_IMAGE_UsbHub3.sys
- [58182137] [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_151b_REV_0000
- [58194799] [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_9ded_REV_0011
- [58194974] [HP][CashmereI][Win11][25H2] The HPD default settings are different between 24H2 and 25H2.
- [58197475] [Watson Failure]: Crash caused by AV_Wdf01000!FxIoQueue::ProcessPowerEvents
- [58213400] [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_IDLE_THREAD_ucx01000!UCX_LockBufferPagesInUrbForDMA
- [58222676] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_15D2_SUBSYS_8438103C_REV_02_IMAGE_WUDFRd.sys
- [58251052] [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_LKD_Bluetooth_rtkfilter.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait
- [58268503] [Watson Failure]: Crash caused by 0x133_ISR_mouclass!MouseClassCreateWaitWakeIrpWorker
- [58277021] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_WDF_WAIT_TIMEOUT_BatteryCritical_IMAGE_SurfacePowerMeterDriver.sys
- [58277489] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_ControlLib.dll!destroy_ptd_array
- [58277626] [Diomedes][From Jade][N1X][Camera] Calling the WinRT sensor API during ADK testing takes a long time.
- [58280976] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_41E4_PID_2101_MI_00_IMAGE_hidusb.sys
- [58283088] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000
- [58290962] [I3C] Pended Async reads to HID target can be completed before a read transfer occurs
- [58293392] [Diomedes][DIS][MTK 5386532] No USB4 and USB3 enumeration on system boot with USB4 dock connected
- [58301753] [Watson Failure]: Crash caused by AV_HIDCLASS!HidpFdoSendIdleIrpWorker
- [58307289] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_04D9_PID_A01C_MI_00_IMAGE_hidusb.sys
- [58311830] [HP][HDE][CashmereQ][8480] The HPD function cannot be modify via Windows settings.
- [58344301] [Watson Failure]: Crash caused by LKD_0x144_USB3_WER_BUGCODE_USBXHCI_BAD_SLOTID_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_150319300201
- [58349496] [Watson Failure]: Crash caused by APPLICATION_HANG_Orphaned_CriticalSection_c0000194_SensorsNativeApi.V2.dll!Unknown
- [58349579] [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_ExcessiveThreadsWaitingForPageIn_UsbHub3!HUBMISC_WaitForSignal
- [58355980] [Thinkpad][Lenovo][Curie-2][Win11_24H2]:SUT show BSOD when plug AC into TBT5 port with external monitor connected via HDMI directly/type-c to DP dongle.(FR:4/5 units, 4/25 cycles)
- [58358956] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!unknown_function_VEN_1022_DEV_15B6_REV_00
- [58363685] [Watson Failure]: Crash caused by AV_BTHUSB_Wdf01000!FxPowerIdleMachine::ProcessEventLocked
- [58364479] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxIoQueue::_scalar_deleting_destructor_
- [58368135] [Watson Failure]: Crash caused by ACCESS_VIOLATION_ab8902b4-09ca-4bb6-b78d-a8f59079a8d5_c0000005_IntelControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape
- [58390337] [Watson Failure]: Crash caused by 0x3D_C0000005_i8042prt!I8xGetBytePolled
- [58400097] [HP][HDE][CashmereQ][QC 8480][27871 build][25H2]How to implement with "System do not rotate but keep Accel is reporting to OS on clamshell form factor unit"
- [58434743] [Watson Failure]: Crash caused by AV_UcmUcsiCx!SmFx::StateMachineEngine::StateMachineEngineImpl::EnqueueEventWithDisposition
- [58444442] [Watson Failure]: Crash caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_241022B80001
- [58444832] [Watson Failure]: Crash caused by 0x133_ISR_LEqdUsb!DjChildIdleRequestCancel
- [58466494] [Acer][OEMQ] Multi-person detection: DUT misidentifies onlooker as main user after main user leaves, leading to privacy concern
- [58466642] [Acer][OEMQ] Multi-person detection: Privacy concern due to lack of dimming/notification for sideways peeking (as per current design) 
- [58466643] [Acer][OEMQ] Multi-person detection: The Dismiss button is ineffective
- [58466644] [Acer][OEMQ] Multi-person detection: No notification triggered when a third person peeks
- [58466918] [HP][Machu16W][Win11][24H2] Hot-plugging the dock does not display the Slow Charger icon.
- [58470137] [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_19041.1.amd64fre.vb_release.191206-1406_TIMESTAMP_760316-225129_C7C5BBF1_nt_wrong_symbols!C7C5BBF11046000
- [58478251] [Watson Failure]: Crash caused by 0x9F_3_BatteryLow_IMAGE_ISH.sys
- [58483203] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_AML!_SB.PCI0.LPCB.H_EC.BAT0._BST_ACPI_IMAGE_UsbHub3.sys
- [58483439] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_80000003_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::Transition::TransitionTableImpl::TransitionTableImpl
- [58490178] [Diomedes] [MTK 5426316]USB3: Halted bit is not set when resuming from low power state leading to yellow bang error/bugcheck on DIS
- [58492226] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFPlatform.dll!WdfObjectList_WudfLpcMessage,WudfLpcMessageParameters_::_scalar_deleting_destructor_
- [58498564] [Watson Failure]: Crash caused by AV_i8042prt!I8xReadPortUchar
- [58513715] [WPG][Desktop][TestReady] - BootMemBrowserLaunch (Improvement) | -176 KB in Metric: ReferenceSet | ge_current_directwinpd_flt.26459.1000.20250725-1800
- [58526911] [Dell] [Cinnamon Bay MLK 16] Prec. 7680 + WD19DC(S) - dock USB LAN not detected in OS
- [58544072] [Watson Failure]: Crash caused by AV_WUDFRd!WdfLpcCorePortInterface::DeletePort
- [58547489] [UMA] Usermode accesses found in onecore\drivers\input\hid\miniports\vhf\src\driver\pdo.c
- [58548079] [Watson Failure]: Crash caused by STACK_OVERFLOW_800700a4_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcClient::DeManagementRpcClientImpl::GetIsBrightnessCapable
- [58590797] [Watson Failure]: Crash caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!unknown_function_VEN_8086_DEV_A71E_REV_00
- [58639285] [Watson Failure]: Crash caused by 0xFC_Wdf01000!__ImageBase
- [58639769] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsApi.dll!Microsoft::WRL::ComPtr_IUnknown_::InternalRelease
- [58640760] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_8086_DEV_7A60_REV_11
- [58642520] [Watson Failure]: Crash caused by 0x9F_3_BatteryLow_ExcessiveReadyThreads_ProcessorThrottled_IMAGE_USBXHCI.SYS
- [58648306] [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!TelemetryData_CreateReport_VEN_15ad_DEV_0779_REV_0000
- [58659380] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalService_ACCESS_VIOLATION_c0000005_WppRecorderUM.dll!WppAutoLogTrace
- [58662197] [Diomedes][NPF][EEAP | General | Feedback] [WHCP] System.Fundamentals.SystemUSB.USB4.AllTypeCPortsSupportUSB4
- [58666024] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_10DE_DEV_1ADA_REV_A1
- [58677409] [Watson Failure]: Crash caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3042_REV_0000
- [58678952] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_161f_REV_0000
- [58690834] [Watson Failure]: Crash caused by LKD_0x144_HOST_SYSTEM_ERROR_USBXHCI!unknown_function_VEN_8086_DEV_1E31_REV_04
- [58695370] [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_IMAGE_qcspi8280.sys
- [58700111] [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.LPCB.EC0.BAT0._BST_ACPI_ExcessiveReadyThreads_IMAGE_UsbHub3.sys
- [58704603] [RI-TP] Failed NotificationSettingsTests::CheckRegisteredSystemProviders: IsTrue(IsInList( k_RegisteredSystemApplications, ARRAYSIZE(k_RegisteredSystemApplications), subKeyName)): Windows.SystemToast.PresenceSensing.OnlookerDetection
- [58709356] [Watson Failure]: Crash caused by LKD_0x144_PREPARE_HARDWARE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b6f_DEV_7023_REV_0001_FW_1000020
- [58709841] [Watson Failure]: Crash caused by 0x13a_11_UsbC_usbccgp!DispatchPdoUrb
- [58715792] [Watson Failure]: Crash caused by 0x133_ISR_HIDCLASS!HidpFdoAllocCollectionResources
- [58732184] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_IntelControlLib.dll!CTL_API::_dynamic_initializer_for__WhitelistedApps__
- [58737845] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_19D1_PID_0001_MI_02_IMAGE_usbser.sys
- [58742696] [Watson Failure]: Crash caused by 0x35_HIDCLASS!HidpFdoSendDxIrp
- [58750897] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!ViewPositionChangeNotificationInternal::_ViewPositionChangeNotificationInternal
- [58752061] [Lenovo][Think][25H2][Onlooker Detection][Presence Sensing] There is no option available for the "Onlooker Detection" feature under Presence Sensing settings page
- [58762149] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3142_REV_0000_FW_230426702040
- [58768412] [Watson Failure]: Crash caused by AV_W_(null)_ucx01000!RootHub_Pdo_EvtInternalDeviceControlIrpPreprocessCallback
- [58768892] [Watson Failure]: Crash caused by 0x1E_C000001D_BAD_IP_USBXHCI!Bulk_MapTransfers
- [58772218] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_5781_SUBSYS_00008086_REV_84_USB4_MS_CM_IMAGE_Usb4HostRouter.sys
- [58779050] [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PC00.RP05.PCRP._OFF_ACPI_IMAGE_UsbHub3.sys
- [58779474] [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_5782_REV_0000
- [58779862] [Watson Failure]: Crash caused by AV_pmdrvs!unknown_function
- [58783088] [Watson Failure]: Crash caused by AV_UcmUcsiCx!UcmUcsiCx::CommandHandler::PpmNotificationReceived
- [58783381] [Watson Failure]: Crash caused by 0xFC_UsbHub3!Feature_BPT_CD_BugFixes_2507__private_featureState__PERF__
- [58786511] [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.26445.1001.amd64fre.ge_current_directmb2_ens.250704-1100_TIMESTAMP_930605-024533_E8291C4D_nt_wrong_symbols!E8291C4D1451000
- [58787906] [Watson Failure]: Crash caused by IN_PAGE_ERROR_c0000185_c0000006_WudfPlatform.dll!_string_
- [58789505] [Watson Failure]: Crash caused by 0x9F_4_sixaxis_IMAGE_UsbHub3.sys
- [58790067] [Watson Failure]: Crash caused by 0x9F_4_IMAGE_WUDFRd.sys_USB_VID_17E9_PID_6006_MI_00
- [58791383] USB WMI event telemetry such as overcurrent is no longer available  
- [58791499] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_367B_PID_1919_IMAGE_hidusb.sys
- [58807261] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxUsbInterface::_scalar_deleting_destructor_
- [58808457] [Watson Failure]: Crash caused by APPLICATION_FAULT_c0000194_WinRTSensors.FuncTests.CppCx.dll!unknown_error_in_taef
- [58810025] [Eco_SR][HLK][CG25][Framework][Lotus+GN22][Win11][24H2_26100] HLK Test failed on USB Secure Camera Controller Dual BDF Test - Compat
- [58818073] [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_QueryRemoveRelatedDevice_LKD_System_gscheci.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait
- [58821750] [N1x][Yukon][USB-IF Cert] "Generic USB Hub" of "Satechi Thunderbolt 4 Slim Hub" fails enumeration with Code 43 "Unknown USB Device (Device Descriptor Request Failed)" when TBT3 monitor is connected do
- [58822618] [Watson Failure]: Crash caused by AV_HPCustomCapDriver_Wdf01000!FxIFR
- [58824024] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3537_PID_1053_IG_01_IMAGE_hidusb.sys
- [58825823] [Watson Failure]: Crash caused by CLR_EXCEPTION_System.ComponentModel.Win32Exception_80004005_Compass.exe!Unknown
- [58840007] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_ACCESS_VIOLATION_c0000005_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease
- [58841435] [Watson Failure]: Crash caused by 0x133_ISR_usbehci!EHCI_WriteErrorLogEntry
- [58843430] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BufferOverrun_c0000374_supermittcmd.exe!Unknown
- [58846454] [Watson Failure]: Crash caused by AV_msisadrv_Wdf01000!FxSystemThread::Thread
- [58852502] [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!unknown_function_VEN_QCOM_DEV_0D08
- [58865748] [Lenovo][LCFC][Sydney2]BSOD 0x133(i8042prt.sys) during s0i3 stress test - excessive keyboard interrupts and polling time for the status byte
- [58918306] [Watson Failure]: Crash caused by 0x10D_4_UcmCx!unknown_function
- [58926430] [Watson Failure]: Crash caused by AV_W_(null)_ucx01000!UrbHandler_USBPORTStyle_Legacy_BulkOrInterruptTransfer
- [58927141] [Watson Failure]: Crash caused by AV_R_(null)_UsbHub3!McGenControlCallbackV2
- [58928578] Lenovo:LCFC:25H2_Upgrade:"Turn off my screen when I leave" and "Wake my device when I approach" are OFF even if Turn on in OOBE Privacy setting page.(FR:2/2 units,2/2 cycles)
- [58941465] [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_LKD_Keyboard_keyboard.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait
- [58943336] [Dynabook]The USB xHCI driver will shows YB after add the hash code into sdev table, and camera device disappear.
- [58944764] [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_22621.1.amd64fre.ni_release.220506-1250_TIMESTAMP_320527-161724_7560F114_nt_wrong_symbols!7560F1141047000
- [58945884] [Watson Failure]: Crash caused by 0xCE_IMAGE_i8042prt.sys
- [58946043] [Watson Failure]: Crash caused by 0x9F_4_HIDCLASS!HidpCallDriverSynchronous
- [58949309] [Arm64][Compat][CRD][Device][keyboard][Inconsistent]: Keyboard not working inconsistently in Device.
- [58951279] [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::LightSensorFactory::GetDefault
- [58954870] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_190502701041
- [58955508] [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_150707301100
- [58966054] [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_USBXHCI!Control_WdfEvtIoDefault
- [58967417] [Watson Failure]: Crash caused by 0x133_DPC_USBXHCI!Bulk_EvtDmaCallback
- [58968834] [Lenovo][LCFC][24H2][USB]:Question:system showing USB 3.2 on spec sheet but USB 3.10 found in Device Manager
- [58970168] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e47d_REV_0000
- [58971768] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1343_REV_0000_FW_151015300401
- [58972481] [Watson Failure]: Crash caused by AV_W_(null)_ucx01000!UrbHandler_Legacy_ControlTransfer
- [58980242] [Watson Failure]: Crash caused by 0x133_ISR_UsbHub3!TlgRegisterAggregateProvider
- [58981543] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_241022B80001
- [58981887] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease
- [58982737] [ASUS][PC] Regkey of "IsAdaptiveColorOnByDefault" doesn't work
- [58983438] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BufferOverrun_c0000374_i3cendtoendtest.dll!Unknown
- [58984910] [ASUS][PC][OEMQ] How to enable "Sensors: Adaptive Brightness is on by default" to meet requirment of CER Premium Display
- [58987739] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0489_PID_E10A_IMAGE_btfilter.sys
- [58991080] [Watson Failure]: Crash caused by 0x133_ISR_kbdclass!KeyboardClassCreateWaitWakeIrpWorker
- [58991557] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_USBXHCI!Register_ControllerStop
- [58994893] [Watson Failure]: Crash caused by VERIFIER_STOP_00000900_LEAK_AVRF_80000003_SmFxEngineUmTests.dll!Unloaded
- [58997584] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_19F7_PID_0054_MI_02_IMAGE_hidusb.sys
- [58997638] [Watson Failure]: Crash caused by AV_Wdf01000!FxUsbDeviceControlContext::ReleaseAndRestore
- [58998000] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxNonPagedObject::_scalar_deleting_destructor_
- [58998048] [Watson Failure]: Crash caused by 0x9F_4_USB_rtump62x64_IMAGE_UsbHub3.sys
- [58998295] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0F8B_REV_0000_FW_3130
- [58999573] [Watson Failure]: Crash caused by APPLICATION_HANG_cfffffff_Windows.Graphics.Display.BrightnessOverride.dll!Unknown
- [59000530] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_181004700240
- [59001651] [Watson Failure]: Crash caused by AV_USBXHCI!Control_EP_StopMapping
- [59003488] [Watson Failure]: Crash caused by BREAKPOINT_80000003_WUDFx02000.dll!guard_dispatch_icall$thunk$10345483385596137414
- [59004915] [Watson Failure]: Crash caused by 0xE6_27_SpbCx!CFxObject_WDFREQUEST___*,CScxRequest,_GetRequestFromFxRequest,1_::_OnCleanup
- [59005071] [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_IntelControlLib.dll!CTL_API::OSDisplayOutput::create
- [59007144] [Watson Failure]: Crash caused by 0x9F_4_IMAGE_serenum.sys
- [59008053] [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ActivitySensorServer::get_ActiveInLowPowerMode
- [59008115] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::GfxHandler::getDisplayOutputProperties
- [59009815] [Watson Failure]: Crash caused by 0x9F_3_usbccgp_ExcessiveThreadsWaitingForPageIn_IMAGE_UsbHub3.sys
- [59011029] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalService_ACCESS_VIOLATION_c0000005_Microsoft.Bluetooth.Service.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::_StateMachineEngineImpl
- [59011230] [Diomedes][N1x][Yukon][USB-IF Cert][JEDI Action] There is a15 Second Refresh Delay for USB4 Hub to disappear from Device Manager after Hot Plugging from N1x Yukon System USB-C ports.
- [59011231] [N1x][Yukon][USB-IF Cert][JEDIAction] There is a15 Second Refresh Delay for USB-C Monitor Connected to USB4 Hub to disappear from Device Manager after Hot Plugging from N1x Yukon System [Intermittent]
- [59015301] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFHost.exe!wil::details_abi::SubscriptionList::OnSignaled
- [59015457] [Watson Failure]: Crash caused by AV_HIDCLASS!HidpCollectionFreeUnreadReports
- [59016101] [Watson Failure]: Crash caused by AV_W_(null)_USBXHCI!McTemplateK0pquuqqqqqqsssxqqqttqqqqtxxqqqqqqqqqqnn_EtwWriteTransfer
- [59017246] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0D28_PID_0204_MI_00_IMAGE_hidusb.sys
- [59022098] [Watson Failure]: Crash caused by 0xC7_Wdf01000!unknown_function
- [59022943] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e431_REV_0000
- [59022948] [Watson Failure]: Crash caused by 0xFC_WDFLDR!__guard_fids_table
- [59023667] [Watson Failure]: Crash caused by 0x10D_4_ucx01000!RootHub_Pdo_EvtInternalDeviceControlIrpPreprocessCallback
- [59024761] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3142_REV_0000_FW_17072470F220
- [59026300] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_51ED_SUBSYS_0BBA1028_REV_01_IMAGE_USBXHCI.SYS
- [59026925] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e431_REV_0000
- [59026926] [Watson Failure]: Crash caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e431_REV_0000
- [59027681] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_USBMidi2_IMAGE_UsbHub3.sys
- [59028543] [Watson Failure]: Crash caused by 0x7f_8_UsbHub3!HUBHTX_Get20PortChangeEvent
- [59030669] [Watson Failure]: Crash caused by 0xE6_27_SpbCx!CScxRequest::BuildMdlForBufferEntry
- [59032279] [Watson Failure]: Crash caused by 0x9F_3_SETPOWER_rtwlanu7_BatteryCritical_IMAGE_UsbHub3.sys
- [59033931] [Watson Failure]: Crash caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e47d_REV_0000
- [59035384] [Watson Failure]: Crash caused by 0xF7_THREE_BIT_MATCHED_FRAME_COOKIE_Wdf01000!imp_WdfIoTargetSendInternalIoctlOthersSynchronously
- [59036210] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!unknown_function_VEN_8086_DEV_A12F_REV_31
- [59037101] [Watson Failure]: Crash caused by 0x7E_C000001D_BAD_IP_USBXHCI!TelemetryData_CreateReport
- [59037750] [Watson Failure]: Crash caused by FAIL_FAST_INVALID_NEXT_THREAD_c0000409_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs
- [59037937] [Watson Failure]: Crash caused by 0xE6_27_SpbCx!CScxRequest::CaptureFxRequest
- [59039398] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFx.dll!__native_dllmain_reason
- [59040796] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::ExtractAccelerometerVector
- [59040814] [Watson Failure]: Crash caused by 0x9F_4_PCQ_ERROR_IMAGE_usbhub.sys
- [59041258] [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.27911.1000.amd64fre.rs_wsd_cfe.250724-1702_TIMESTAMP_341009-072012_79D4D4AC_nt_wrong_symbols!79D4D4AC1459000
- [59042444] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcClient::DeManagementRpcClientAdapterImpl::OpenFromMonitorId
- [59042993] [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_USBXHCI!Control_Transfer_CompleteCancelable
- [59044638] [Watson Failure]: Crash caused by LKD_0x144_UNHANDLED_TRANSFER_EVENT_TRB_COMPLETION_CODE_USBXHCI!unknown_function_VEN_8086_DEV_22B5_REV_36
- [59044828] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_ETWCALLBACK_c0000005_hidserv.dll!unknown_error_in_service
- [59046046] [Watson Failure]: Crash caused by CLR_EXCEPTION_System.Xaml.XamlObjectWriterException_80131500_Compass.exe!unknown_function
- [59047173] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_RESET_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a12f_REV_0031
- [59047271] [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_WUDFx02000.dll!FxIoTarget::_RequestCompletionRoutine
- [59047313] [Watson Failure]: Crash caused by 0x0_ucx01000!Urb_USBPORTStyle_ProcessURB
- [59048213] [Watson Failure]: Crash caused by LKD_0x144_HOST_SYSTEM_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a71e_REV_0000
- [59048300] [Watson Failure]: Crash caused by 0xc2_99_WDFLDR!DereferenceVersion
- [59048329] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx.dll!FxCmResList::_scalar_deleting_destructor_
- [59048362] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!CTL_API::WDDMInterface::GetDeviceAdapters
- [59048421] [Watson Failure]: Crash caused by 0x133_ISR_IMAGE_usbehci.sys
- [59049488] [Watson Failure]: Crash caused by 0x133_ISR_hidi2c!wil_details_EvaluateFeatureDependencies
- [59051767] [Watson Failure]: Crash caused by 0xc2_d_USBXHCI!unknown_function
- [59052344] [Watson Failure]: Crash caused by LKD_0x144_COMMAND_ABORT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0CA1_REV_0000_FW_3130
- [59052575] [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_hidi2c!OnInternalDeviceIoControl
- [59052801] [Watson Failure]: Crash caused by FATAL_USER_CALLBACK_EXCEPTION_c000041d_WUDFx02000.dll!FxObjectHandleAlloc2
- [59052879] [Watson Failure]: Crash caused by 0x9F_4_USB_Wdf01000!FxIoQueue::StartPowerTransitionOff
- [59053603] [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_ucx01000.sys!Unloaded
- [59053801] [Watson Failure]: Crash caused by AV_HIDCLASS!Feature_SPR_HardenInClient__private_IsEnabledDeviceUsageNoInline
- [59053956] [Watson Failure]: Crash caused by BREAKPOINT_80000003_Windows.Devices.Sensors.dll!__scrt_initialize_crt
- [59053991] [Watson Failure]: Crash caused by SVCHOSTGROUP_netsvcs_BREAKPOINT_80000003_Windows.Devices.Sensors.dll!__scrt_initialize_crt
- [59054363] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_0849_IMAGE_UsbHub3.sys
- [59055079] [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GP17.ACP._PS0_ACPI_IMAGE_UsbHub3.sys
- [59055377] [Watson Failure]: Crash caused by AV_MEIx64_Wdf01000!FxPkgGeneral::OnCleanup
- [59055771] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_5782_SUBSYS_00000000_REV_00_IMAGE_USBXHCI.SYS
- [59056336] [Watson Failure]: Crash caused by 0xFC_USBXHCI_Wdf01000!FxRequest::Release
- [59056897] [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.29439.1000.amd64fre.rs_es_lego.250830-1500_TIMESTAMP_950712-152247_3003E8C7_nt_wrong_symbols!3003E8C71459000
- [59059458] [Watson Failure]: Crash caused by 0x1AA_HIDPARSE!HidP_TranslateUsageAndPagesToI8042ScanCodes
- [59059708] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0482_PID_5752_IMAGE_hidusb.sys
- [59059758] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsApi.dll!wil::details::functor_wrapper_void__lambda_65197f76560d04008ad318197229ec2e___::Run
- [59060418] [Watson Failure]: Crash caused by 0xc2_99_usbccgp!unknown_function
- [59060551] [Watson Failure]: Crash caused by AV_Wdf01000_fffff800798b0000!unknown_function
- [59060557] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0451_PID_8442_IMAGE_UsbHub3.sys
- [59061191] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_145F_PID_02FC_MI_00_IMAGE_hidusb.sys
- [59061794] [Watson Failure]: Crash caused by AV_CODE_AV_BAD_IP_Wdf01000!FxTimer::TimerHandler
- [59062563] [Watson Failure]: Crash caused by SVCHOSTGROUP_CameraMonitor_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_IntelControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape
- [59063429] [Watson Failure]: Crash caused by AV_W_(null)_Wdf01000!FxWorkItem::WorkItemThunk
- [59066512] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_sensrsvc.dll!CSensorEnsemble::SetISensor
- [59066790] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000
- [59067386] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_IntelControlLib.dll!CTL_API::GfxHandler::_GfxHandler
- [59067750] [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!unknown_function_VEN_1B21_DEV_3241_REV_00
- [59067751] [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!unknown_function_VEN_1B21_DEV_3241_REV_00
- [59067987] [Watson Failure]: Crash caused by 0x7E_C000001D_BthLEEnum_BAD_IP_Wdf01000!FxIoQueue::QueuePurge
- [59068564] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs
- [59068724] [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f9_REV_0001
- [59068739] [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f9_REV_0001
- [59068985] [Watson Failure]: Crash caused by CORRUPT_MODULELIST_ACCESS_VIOLATION_c0000005_IntelControlLib.dll!Unloaded
- [59069327] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!CTL_API::KmdSysManager::requestSingle
- [59070975] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3151_PID_3022_MI_00_IMAGE_hidusb.sys
- [59071355] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!CTL_API::DisplayOutputImp::_vector_deleting_destructor_
- [59071396] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_usbview.exe!DisplayHidDescriptor
- [59071537] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_wdfkd.dll!DumpFxUsbPipe
- [59074409] [Watson Failure]: Crash caused by AV_hidi2c!HidSetReport
- [59074877] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_1D57_PID_FA65_MI_00_IMAGE_hidusb.sys
- [59075347] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!__acrt_LCMapStringA_stat
- [59075352] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2972_PID_0088_REV_0132_MI_03_IMAGE_hidusb.sys
- [59075584] [Watson Failure]: Crash caused by 0x1CA_USBXHCI!Isoch_Stage_CompleteTD
- [59077568] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_Windows.Devices.Sensors.dll!wil::details::ResultFromCaughtExceptionInternal
- [59077612] [Watson Failure]: Crash caused by 0x1a_4477_ucx01000!UcxEndpointStateEntryFunc_DeletingStale
- [59077656] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_EntryCorruption_c0000374_WUDFx02000.dll!FxSystemWorkItem::_scalar_deleting_destructor_
- [59078260] [Watson Failure]: Crash caused by 0x3D_C0000005_USBXHCI!unknown_function
- [59078390] [Watson Failure]: Crash caused by AV_W_(null)_mouhid!MouHid_ReadComplete
- [59079388] [Watson Failure]: Crash caused by 0x3B_80000003_VRF_i3chost!Target::EvtIoDefault
- [59082306] [Watson Failure]: Crash caused by 0x9F_3_BatteryLow_IMAGE_usbser.sys
- [59084509] [Watson Failure]: Crash caused by 0x1C8_PNP_ActivePnpThread_Blocked_On_nvasd_Wdf01000!FxIoQueue::StartPowerTransitionOff
- [59086243] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43f9_REV_0001
- [59086325] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BlockNotBusy_DOUBLE_FREE_c0000374_MuttUtil.dll!CWinUsbDevice::_CWinUsbDevice
- [59086352] [Watson Failure]: Crash caused by 0x7f_8_asmthub3!unknown_function
- [59087382] [Watson Failure]: Crash caused by INVALID_EXCEPTION_HANDLER_c00001a5_hid.dll!HidD_GetPreparsedData
- [59087383] [Watson Failure]: Crash caused by FAIL_FAST_INVALID_EXCEPTION_CHAIN_c0000409_hid.dll!HidD_GetPreparsedData
- [59087393] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_240321B80001
- [59087627] [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_WUDFRd!RdUsbPkg::UsbControlTransferASync
- [59087804] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::CustomPropertiesMapServer::_CustomPropertiesMapServer
- [59087848] [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_cfffffff_IntelControlLib.dll!create_environment_char_
- [59088252] [Watson Failure]: Crash caused by AV_UsbHub3!HUBHTX_GetHubStatusUsingControlTransfer
- [59088527] [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_serial!SerialIoCallDriver
- [59089167] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_c0000005_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::DeManagementRpcServer::DeManagementRpcServerImpl::Remove
- [59089792] [Watson Failure]: Crash caused by 0xFC_kbdhid!wil_details_PopulateInitialConfiguredFeatureStates
- [59090404] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_1022_DEV_15B8_REV_00
- [59090848] [Watson Failure]: Crash caused by CLR_EXCEPTION_System.Runtime.InteropServices.ExternalException_800401d0_USB.exe!Unknown
- [59090892] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxUsbPipe::_scalar_deleting_destructor_
- [59092470] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_e37d_REV_0000
- [59094766] [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_IntelControlLib.dll!CTL_API::OverclockManager::InitOcManager
- [59099218] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_248B_PID_8100_MI_00_IMAGE_hidusb.sys
- [59099754] [Watson Failure]: Crash caused by FAIL_FAST_POINTER_AUTH_INVALID_RETURN_ADDRESS_c0000409_winusb.dll!WinUsb_AbortPipeAsync
- [59100482] [Watson Failure]: Crash caused by 0xE6_26_USBXHCI!Isoch_Stage_CompleteTD
- [59103920] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_rcusbwdm_IMAGE_UsbHub3.sys
- [59104056] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7EC0_SUBSYS_00000000_REV_10_IMAGE_USBXHCI.SYS
- [59104065] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_318C_SUBSYS_87F9103C_REV_06
- [59110096] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function_VEN_8086_DEV_51ED_REV_01
- [59111944] [Watson Failure]: Crash caused by AV_W_usbccgp!CheckParentIdleDpc
- [59113281] [Watson Failure]: Crash caused by 0x133_DPC_HIDCLASS!GetCollectionDesc
- [59117203] [Watson Failure]: Crash caused by 0x133_DPC_usbehci!EHCI_RH_PortResumeComplete
- [59117235] [Watson Failure]: Crash caused by 0x133_VRF_DPC_USBXHCI!Isoch_RetrieveNextStage
- [59118945] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_FFCA_PID_0125_MI_00_IMAGE_usbser.sys
- [59118970] [Watson Failure]: Crash caused by 0x9F_VRFK_4_HID_WUDFRd_IMAGE_mshidkmdf.sys
- [59119435] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_19D2_PID_1403_IMAGE_usbccgp.sys
- [59120105] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_hidi3ctest.dll!unknown_error_in_taef
- [59120177] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_HEAP_CORRUPTION_ACTIONABLE_Internal_c0000374_SensorsApi.dll!SensorCloseCOM
- [59120189] [Watson Failure]: Crash caused by 0x13a_8_XHCW_Wdf01000!unknown_function
- [59120348] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000096_IntelControlLib.dll!CTL_API::_dynamic_atexit_destructor_for__OSDllsobj__
- [59121591] [Watson Failure]: Crash caused by CLR_EXCEPTION_80070005_sensordiagnostictool.exe!unknown_function
- [59122071] [Watson Failure]: Crash caused by AV_NULL_IP_USBXHCI!Controller_WdfEvtPreprocessSetPowerIrp
- [59122716] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_ControlLib.dll!GetRuntimeLib
- [59122721] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_046A_PID_01DE_MI_00_IMAGE_hidusb.sys
- [59122894] [Watson Failure]: Crash caused by 0x133_DPC_WUDFRd!WudfPeriodicTimer::TimerDpc
- [59124058] [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\control.cpp
- [59124059] [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\fdoio.cpp
- [59124060] [UMA] Usermode accesses found in minkernel\wdf\framework\umdf\redirector\driver\probe.c
- [59124062] [UMA] Usermode accesses found in onecore\drivers\input\hid\hidcore\hidclass\util.c
- [59124489] [Watson Failure]: Crash caused by 0x133_DPC_kbdhid!unknown_function
- [59125368] [Watson Failure]: Crash caused by 0x9F_3_SurfaceSerialHubDriver_Wdf01000!FxSystemWorkItem::WaitForExit
- [59125557] [Watson Failure]: Crash caused by 0x9F_4_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_7D03_SUBSYS_207A1EE7_REV_05
- [59126154] [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!unknown_function_VEN_1022_DEV_15C1_REV_00
- [59127558] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ILLEGAL_INSTRUCTION_c000001d_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Bluetooth::Foundation::TokenWithStatusControl_Microsoft::Windows::DisplayEnhanceme
- [59129002] [Watson Failure]: Crash caused by 0x18_WinUSB!WinUSB_ReadPipeCompletion
- [59129643] [Watson Failure]: Crash caused by 0x1E_C000001D_BAD_IP_usbccgp!CheckParentIdleWorker
- [59131942] [Watson Failure]: Crash caused by 0x139_39_USBXHCI!WPP_0e51d3b82fdb347dedaae242937bad3f_Traceguids
- [59132320] [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_cfffffff_SensorsApi.dll!SimpleDeviceOrientationSensor::SetEventSink
- [59132445] [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_INTERRUPTS_DISABLED_i8042prt!I8xReadPortUchar
- [59134047] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_VERIFIER_STOP_AVRF_c0000421_sensorservice.dll!ExternalDisplayConnectedNotifications::OnDisplayAdded
- [59134115] [Watson Failure]: Crash caused by AV_BTHUSB_Wdf01000!FxPkgIo::StopProcessingForPower
- [59134352] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_WUDFx02000.dll!FxMemoryObject::Release
- [59134822] [Watson Failure]: Crash caused by 0xE6_27_VenId0x1B21_DevId0x2142_IMAGE_USBXHCI.sys
- [59135006] [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_BTHUSB_Wdf01000!FxPowerDeviceDisarmWakeFromS0::InvokeClient
- [59135086] [Watson Failure]: Crash caused by 0x133_DPC_ucx01000!McGenEventWrite_EtwWriteTransfer
- [59135635] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!unknown_function_VEN_8086_DEV_15E9_REV_06
- [59135751] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0B05_PID_1898_MI_00_IMAGE_hidusb.sys
- [59136122] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0B05_PID_1956_IMAGE_usbccgp.sys
- [59136165] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7EC0_SUBSYS_72708086_REV_10_IMAGE_USBXHCI.SYS
- [59136238] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_rtu56cx21x64_IMAGE_UsbHub3.sys
- [59136303] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2D99_PID_A047_MI_02_IMAGE_hidusb.sys
- [59136307] [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!wil::details::FeatureImpl___WilFeatureTraits_Feature_TestConfNum_::GetCachedFeatureEnabledState
- [59136498] [Watson Failure]: Crash caused by APPLICATION_HANG_XPROC_BusyHang_cfffffff_Windows.Graphics.Display.BrightnessOverride.dll!GetForWindowCommon
- [59136802] [Watson Failure]: Crash caused by AV_R_(null)_ucx01000!UrbHandler_USBPORTStyle_Legacy_IsochTransfer
- [59136936] [Watson Failure]: Crash caused by LKD_0x144_HOST_CONTROLLER_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15c3_REV_0000
- [59137206] [Watson Failure]: Crash caused by 0x10D_7_USBXHCI_Wdf01000!FxVerifierBugCheckWorker
- [59137267] [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_PRERESET_IDLE_THREAD_INTERRUPTS_DISABLED_USBXHCI!Bulk_ProcessTransferEventWithED1
- [59137924] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_Windows.Devices.Sensors.dll!_dynamic_atexit_destructor_for___AtlModule__
- [59138194] [Watson Failure]: Crash caused by AV_CODE_AV_BAD_IP_Wdf01000!FxFreeToNPagedLookasideList
- [59138315] [Watson Failure]: Crash caused by AV_WpdUpFltr_Wdf01000!FxIoTarget::Dispose
- [59138725] [Watson Failure]: Crash caused by 0x133_ISR_UsbHub3!WMI_RegisterHub
- [59139341] [Watson Failure]: Crash caused by 0x1E_C000001D_BAD_IP_WinUSB!WinUSB_ReadPipeCompletion
- [59139614] [Watson Failure]: Crash caused by LKD_0x144_RH_PORT_STUCK_IN_RESUME_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_0b27_REV_0003
- [59139656] [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_serial!SerialStartDevice
- [59140524] [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_170214500200
- [59140525] [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_STOP_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_170214500200
- [59140585] [Watson Failure]: Crash caused by AV_AcerAirplaneModeController!unknown_function
- [59141775] [Watson Failure]: Crash caused by HUP_BUGCHECK_DISPLAY_INVALID_GAIN_MAP_BLOB_HL_2_FormFactor_HPUv2_F154002D_WUDFHost.exe!unknown_error_in_process
- [59141801] [Watson Failure]: Crash caused by SVCHOSTGROUP_CameraMonitor_ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::TransformSensorReading_enum_Windows::Devices::Sensors::SimpleOrientation_
- [59142620] [Watson Failure]: Crash caused by AV_W_(null)_WUDFRd!WdfLpcCorePortInterface::CreateResourceReserve
- [59142741] [Watson Failure]: Crash caused by IN_PAGE_ERROR_services.exe_BUGCHECK_CRITICAL_PROCESS_IOERR_WudfPlatform!McGenControlCallbackV2
- [59142760] [Watson Failure]: Crash caused by IN_PAGE_ERROR_c0000242_ETWCALLBACK_UNLOADED_c0000006_WudfPlatform.dll!McGenControlCallbackV2_{2e35aaeb-857f-4beb-a418-2e6c0e54d988}
- [59142958] [I3C] WDFDEVICE & Queue handles in Target context are overwritten before ReleaseHardware of old PDO on re-enumeration
- [59143490] [Watson Failure]: Crash caused by STACK_BUFFER_OVERRUN_MATCHED_FRAME_COOKIE_GeneStor_Wdf01000!FxPkgPnp::PowerPolicyProcessEventInner
- [59143535] [Watson Failure]: Crash caused by 0x9F_4_USB_IMAGE_WUDFRd.sys_USB_VID_05E3_PID_0758_MI_01
- [59143604] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFHost.exe!CWudfModuleInfo::Release
- [59144274] [Watson Failure]: Crash caused by 0x133_ISR_usbccgp!UsbcCompleteIrp
- [59144287] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalService_ACCESS_VIOLATION_c0000005_Microsoft.Bluetooth.Service.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::ProcessEventQueue
- [59144483] [Watson Failure]: Crash caused by 0xa0_614_hidi2c!OnInterruptDpc
- [59144651] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!unknown_function_VEN_1022_DEV_145F_REV_00
- [59144774] [Watson Failure]: Crash caused by AV_HDAudBus!FxStubDriverUnloadCommon
- [59144999] [Watson Failure]: Crash caused by 0xFC_UsbHub3!DsmStateEntryUnConfiguredInD0
- [59145833] [Watson Failure]: Crash caused by 0x9F_4_ctpdusbx_IMAGE_UsbHub3.sys
- [59146574] [Watson Failure]: Crash caused by APPLICATION_HANG_ENDTASK_HungThreadIsIdle_cfffffff_pc.exe!Unknown
- [59146931] [Watson Failure]: Crash caused by 0xE6_26_USBXHCI!Interrupter_DeferredWorkProcessor
- [59146935] [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_Wdf01000!WPP_FxIoQueue_cpp_Traceguids
- [59148316] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Graphics.Display.DisplayEnhancementOverride.dll!Microsoft::WRL::Details::DelegateArgTraits_long_
- [59148554] [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_usbser!UsbSerEvtDeviceSelfManagedIoFlush
- [59148806] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ILLEGAL_INSTRUCTION_c000001d_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Windows::DisplayEnhancement::Coordinator::DeRequestCoordinatorImpl::SelectHighestT
- [59149102] [Watson Failure]: Crash caused by DISABLED_INTERRUPT_FAULT_SpbCx!McTemplateK0zq_EtwWriteTransfer
- [59149818] [Watson Failure]: Crash caused by 0xc2_e_WinUsb!WinUSB_ControlTransfer
- [59150698] [Watson Failure]: Crash caused by 0x139_MATCHED_FRAME_COOKIE_UsbHub3!HUBREG_QueryUxdDeviceKey
- [59151961] [Watson Failure]: Crash caused by INVALID_HANDLE_AVRF_c0000008_WUDFx02000.dll!FxWorkItem::_FxWorkItem
- [59152820] [Watson Failure]: Crash caused by STACK_BUFFER_OVERRUN_MISMATCH_GSCOOKIE_GeneStor_Wdf01000!FxPkgPnp::PowerPolicyProcessEventInner
- [59153141] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_RESET_USBXHCI!unknown_function_VEN_1022_DEV_43BC_REV_02
- [59153504] [Watson Failure]: Crash caused by AV_CODE_AV_PAGED_IP_amdppm!ProcessSystemSleepStateNotify
- [59153767] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_0_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_171102701500
- [59155561] [Watson Failure]: Crash caused by SVCHOSTGROUP_Camera_ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::GetDataOrientation
- [59155601] [Watson Failure]: Crash caused by APPLICATION_HANG_ENDTASK_BlockedOn_DeviceIO_cfffffff_winusb.dll!WinUsb_ReadPipe
- [59155634] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_rtwlanu_BatteryLow_IMAGE_UsbHub3.sys
- [59156862] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!ctlInit
- [59156902] [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_10.0.27943.1000.amd64fre.br_release_sigma_dev.250907-1700_TIMESTAMP_550225-121710_A02AF846_nt_wrong_symbols!A02AF8461459000
- [59158138] [Watson Failure]: Crash caused by AV_USBXHCI!Controller_WdfEvtDeviceFilterRemoveResourceRequirements
- [59158769] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_16c3_DEV_abcf_REV_000b
- [59158864] [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_RESET_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_16c3_DEV_abcf_REV_000b
- [59161933] [Watson Failure]: Crash caused by 0x1D5_udecx!Controller_WdfDeviceRetrieveAcpiDataSynchronously
- [59162549] [Watson Failure]: Crash caused by BREAKPOINT_80000003_echoapp.exe!Unknown
- [59163534] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_1022_DEV_1639_SUBSYS_1319152D_REV_00_IMAGE_USBXHCI.SYS
- [59164503] [Watson Failure]: Crash caused by 0x9F_3_CvfUsbBridge_IMAGE_UsbHub3.sys
- [59164759] [Watson Failure]: Crash caused by 0x1E_C0000096_USBXHCI!Controller_LowerAndTrackIrql
- [59165469] [Watson Failure]: Crash caused by 0x1E_C0000096_USBXHCI!Isoch_PrepareStage
- [59165909] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::CreateActivationFactory_Windows::Devices::Sensors::HingeAngleSensorFactory_
- [59166022] [Watson Failure]: Crash caused by 0x133_ISR_HIDCLASS!HidpFdoSendDxIrp
- [59166347] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::GyrometerServer::QueryInterface
- [59166614] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!unknown_function_VEN_8086_DEV_15B6_REV_00
- [59167980] [Watson Failure]: Crash caused by 0x9F_4_IMAGE_WUDFRd.sys_ACPI_ACPI0008
- [59170530] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_05C6_PID_90DB_MI_05_IMAGE_WinUSB.SYS
- [59171195] [Watson Failure]: Crash caused by APPLICATION_HANG_ENDTASK_XPROC_HungThreadIsIdle_cfffffff_hid.dll!DeviceIoControlHelper
- [59171489] [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_btfilter!unknown_function
- [59171514] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::ComPtr_Windows::Devices::Sensors::AccelerometerServer_::Attach
- [59171776] [Watson Failure]: Crash caused by DISABLED_INTERRUPT_FAULT_USBXHCI!__guard_fids_table__PERF__
- [59172184] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!unknown_function_VEN_1002_DEV_73A6_REV_00
- [59172267] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0E8D_PID_8C38_IMAGE_usbccgp.sys
- [59175910] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_22E3_PID_003C_IMAGE_WinUsb.sys
- [59176313] [Watson Failure]: Crash caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_3241_REV_0000_FW_200311830202
- [59180188] [Watson Failure]: Crash caused by AV_X_(null)_BAD_IP_Wdf01000!FxInterrupt::_InterruptThunk
- [59181780] [Watson Failure]: Crash caused by AV_WDFLDR!FindModuleByServiceNameLocked
- [59183349] [Watson Failure]: Crash caused by 0x133_DPC_SpbCx!CScxTarget::ForwardIrpToTargetQueue
- [59183469] [Watson Failure]: Crash caused by 0x1_SysCallNum_0_UsbHub3!HUBPDO_EvtCompleteIrpWorkItem
- [59185339] [Watson Failure]: Crash caused by 0xc4_122_LEqdUsb!unknown_function
- [59187972] [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_QcXhciFilter8380!unknown_function
- [59189658] [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.LPCB.ECDV.TSKN._TMP_ACPI_BatteryCritical_IMAGE_UsbHub3.sys
- [59190002] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_MultipleEntriesCorruption_c0000374_IntelControlLib.dll!_dcrt_get_narrow_environment_from_os
- [59191121] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll![thunk]:Microsoft::WRL::ActivationFactory_Microsoft::WRL::Implements_Microsoft::WRL::FtmBase,Windows::Devices::Sensors::Internal::ISensorStatics_,Microsoft::WRL::Detai
- [59191210] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15bb_REV_0000
- [59191459] [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_22621.2771.amd64fre.ni_release.220506-1250_TIMESTAMP_2042B9C5_nt_wrong_symbols!2042B9C51047000
- [59193082] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!o___std_type_info_destroy_list
- [59194841] [Watson Failure]: Crash caused by 0x133_ISR_UcmCx!unknown_function
- [59194997] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_07BF_IMAGE_usbccgp.sys
- [59195165] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_AML!_SB.PCI0.LPC0.BAT1._STA_ACPI_IMAGE_UsbHub3.sys
- [59195178] [Watson Failure]: Crash caused by 0x1D5_IMAGE_WUDFRd.sys_USB_VID_05E3_PID_0758_MI_01
- [59197497] Caught Platform::Exception^: Access is denied.  onecoreuap\drivers\mobilepc\displayenhancement\test\dessimulator\softwaredessimulator.cpp(22)\Microsoft.Graphics.DisplayEnhancements.BrightnessHotkeys.Functi:  Exception(1)  80070005 Access is denied.  
- [59197566] [Watson Failure]: Crash caused by FAIL_FAST_INVALID_ARG_c0000409_usbceip.dll!CDevNode::QueryDeviceProperty
- [59197792] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_4E03_SUBSYS_8996103C_REV_00
- [59198009] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!unknown_function_VEN_1B21_DEV_1242_REV_00
- [59198010] [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!unknown_function_VEN_1B21_DEV_1242_REV_00
- [59198043] [Watson Failure]: Crash caused by 0x35_WUDFRd!RdPnpTracker::RdPnpProcessor
- [59198547] [Watson Failure]: Crash caused by WRONG_SYMBOLS_X64_22621.1926.amd64fre.ni_release_svc_prod3.230616-1746_TIMESTAMP_191BB7C9_nt_wrong_symbols!191BB7C91048000
- [59198921] [Watson Failure]: Crash caused by AV_CODE_AV_PAGED_IP_kbdclass!KbdConfiguration
- [59200040] [Watson Failure]: Crash caused by INVALID_PARAMETER_c000000d_IntelControlLib.dll!free_base
- [59200174] [Watson Failure]: Crash caused by FAIL_FAST_CORRUPT_LIST_ENTRY_c0000409_WUDFx02000.dll!MxWorkItem::Allocate
- [59200337] [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::InclinometerFactory::GetDefault
- [59203249] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_RESET_EP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1242_REV_0000_FW_1507073011FF
- [59203376] [Watson Failure]: Crash caused by MOAPPLICATION_HANG_cfffffff_Windows.Devices.Sensors.dll![thunk]:Microsoft::WRL::Details::RuntimeClassImpl_Microsoft::WRL::RuntimeClassFlags_1_,1,1,0,Microsoft::WRL::FtmBase,Windows::Devices::Sensors::IPedometer,Windows::D
- [59203550] [Watson Failure]: Crash caused by BREAKPOINT_AVRF_80000003_SensorsNativeApi.dll!Unknown
- [59203679] [Watson Failure]: Crash caused by AV_UcmCx!UpmConnectorIndicateStateChange
- [59205076] [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_services.exe!DrvMgrLpcNotification::MessageOpenProcess
- [59205137] [Watson Failure]: Crash caused by 0xFC_UsbHub3!Psm30StateEntryCheckingIfPersistentOvercurrent
- [59205256] [Watson Failure]: Crash caused by 0x3D_C0000005_BAD_IP_USBXHCI!Interrupter_WdfEvtInterruptIsr
- [59205357] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFHost.exe!CWudfDeviceStack::Create
- [59205402] [Watson Failure]: Crash caused by 0x3B_C000001D_vhf!PDO_PullRequestComplete
- [59209656] [wdf] usbiotargettest.testmd: SharingMechanism StartupStatus not ready 2
- [59212099] [Watson Failure]: Crash caused by LKD_0x144_USBDEVICE_RESET_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_15e5_REV_0000
- [59212421] [Watson Failure]: Crash caused by 0x13a_11_Mdl__ucx01000!unknown_function
- [59213661] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll![thunk]:Windows::Devices::Sensors::PedometerDataThresholdServer::Release_adjustor{48}_
- [59215160] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_IntelControlLib.dll!CTL_API::ControlDeviceAdapterImp::enumDisplayOutputs
- [59216657] [Watson Failure]: Crash caused by AV_Wdf01000_fffff8001af30000!unknown_function
- [59217416] [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_RESTART_FAILED_USBXHCI!unknown_function
- [59218553] WHCP_Driver : Debug breaks Blocking WHCP execution on QCIPCC Driver
- [59218657] [Watson Failure]: Crash caused by APPLICATION_HANG_DeviceInstallTimeout_LKD_USB_vboxusb.inf_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait
- [59218870] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_HEAP_CORRUPTION_ACTIONABLE_BlockNotBusy_DOUBLE_FREE_c0000374_SensorsApi.dll!Unknown
- [59218892] [Watson Failure]: Crash caused by AV_Wdf01000_fffff80468410000!unknown_function
- [59219191] [Watson Failure]: Crash caused by 0x139_3_CORRUPT_LIST_ENTRY_Wdf01000!FxObject::Commit
- [59219460] [Watson Failure]: Crash caused by AV_Wdf01000!WPP_IFR_SF_sq
- [59219732] [RI-TP] Failed AltimeterTests::ReadingChanged#metadataSet0: IsLessThanOrEqual(diffInMsec, tolerableDelay) - Values (141623, 5000)
- [59221338] [Watson Failure]: Crash caused by AV_Wdf01000!FxWakeInterruptMachine::ProcessEvent
- [59221843] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7E7D_SUBSYS_143A1462_REV_20_IMAGE_USBXHCI.SYS
- [59222532] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000
- [59223865] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_0835_PID_2A05_IMAGE_hidusb.sys
- [59225575] [Watson Failure]: Crash caused by ACCESS_VIOLATION_FLS_c0000005_hid.dll!_NULL_IMPORT_DESCRIPTOR__PERF__
- [59226071] USB4: DP Operation Timeouts overwritten by NVM and TBT operation timeouts.
- [59227753] [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_sermouse!SerialMouseCompletionRoutine
- [59227873] [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_WUDFRd!unknown_function
- [59227939] [Watson Failure]: Crash caused by 0x10D_5_WUDFRd!unknown_function
- [59230590] [Watson Failure]: Crash caused by LKD_0x144_UNHANDLED_TRANSFER_EVENT_TRB_COMPLETION_CODE_USBXHCI!unknown_function
- [59230734] [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_WUDFx.dll!CWdfIoRequest::SetFileObjectForNextLocation
- [59232343] [Watson Failure]: Crash caused by BREAKPOINT_80000003_ControlLib.dll!_acrt_LCMapStringA
- [59233511] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_1903_SUBSYS_383517AA_REV_0C
- [59234157] [Watson Failure]: Crash caused by 0x1CA_Wdf01000!WPP_FxRequest_cpp_Traceguids
- [59234276] [Watson Failure]: Crash caused by LKD_0x144_DEQUEUEPOINTER_MISMATCH_AFTER_COMMAND_ABORT_USBXHCI!TelemetryData_CreateReport_VEN_10de_DEV_1ad8_REV_00a1
- [59234277] [Watson Failure]: Crash caused by LKD_0x144_DISABLE_SLOT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_10de_DEV_1ad8_REV_00a1
- [59234908] [Watson Failure]: Crash caused by AV_IMAGE_usbccgp.sys
- [59235273] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_BatteryCritical_IMAGE_usbser.sys
- [59235344] [Watson Failure]: Crash caused by 0x10D_5_USBXHCI!Interrupter_ReleaseEventRingLock
- [59235375] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_046A_PID_01D7_MI_00_IMAGE_hidusb.sys
- [59235507] [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8._STA_ACPI_IMAGE_UsbHub3.sys
- [59235802] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFHost.exe!CWudfIrpT_CWudfPnpIrp,IWudfPnpIrp,_WUDFMESSAGE_IRP_*,_WUDFMESSAGE_PNP_REPLY_ALL_*_::Release
- [59238116] [Watson Failure]: Crash caused by LKD_0x1F5_STREAM!SCSubmitRequest
- [59238235] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_241022B80001
- [59238992] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2142_REV_0000_FW_190826703140
- [59239072] [Watson Failure]: Crash caused by IN_PAGE_ERROR_c0000102_c0000006_Windows.Devices.Sensors.dll!_string_
- [59239596] [Watson Failure]: Crash caused by LKD_0x144_DISABLE_SLOT_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_7814_REV_0001
- [59239672] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2F24_PID_0060_IG_00_IMAGE_hidusb.sys
- [59240526] [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_STOP_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1343_REV_0000_FW_151015300401
- [59241091] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_2708_PID_000D_REV_0100_MI_03_IMAGE_hidusb.sys
- [59241158] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BufferOverrun_c0000374_SensorsUtilsV2.dll!CollectionsListDeserializeFromBuffer
- [59241851] [Watson Failure]: Crash caused by AV_Wdf01000_fffff80356090000!unknown_function
- [59242053] [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!HUBHTX_SendInterruptTransferComplete
- [59242423] [Watson Failure]: Crash caused by LKD_0x144_OUT_OF_ORDER_COMMAND_COMPLETION_USBXHCI!TelemetryData_CreateReport_VEN_10de_DEV_1ad6_REV_00a1
- [59242651] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!_acrt_initialize_new_handler
- [59243664] [Watson Failure]: Crash caused by 0x44_amdhub31!unknown_function
- [59245073] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_8007023e_SensorsApi.dll!Microsoft::WRL::ComPtr_Windows::Internal::CapabilityAccess::ICapabilityAccessStatics_::InternalRelease
- [59245372] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_43ED_SUBSYS_0A811028_REV_11_IMAGE_USBXHCI.SYS
- [59245487] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!CTL_API::OverclockManager::PowerTelemetryGet
- [59245643] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_0PNP_DEV_0D10_REV_0000
- [59246596] [Watson Failure]: Crash caused by AV_qcspi8280!unknown_function
- [59246609] [Watson Failure]: Crash caused by 0x7E_80000003_HIDCLASS!HidpQueryCollectionCapabilities
- [59248565] [Watson Failure]: Crash caused by AV_USBPORT!USBPORT_RootHub_Endpoint0
- [59248925] [Watson Failure]: Crash caused by AV_monitor_Wdf01000!FxObject::DeleteObject
- [59249162] [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_IntelControlLib.dll!CTL_API::KmdSysManager::parseBufferOut
- [59249739] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_1532_PID_0203_MI_00_IMAGE_hidusb.sys
- [59250992] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalServiceAndNoImpersonation_ACCESS_VIOLATION_c0000005_SensorsApi.dll!Unknown
- [59251854] [Watson Failure]: Crash caused by 0x1E_C000001D_USBXHCI!Bulk_ProcessTransferEventWithED1
- [59252495] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_STALL_SET_DEQUEUE_USBXHCI!unknown_function
- [59252656] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_WUDFx02000.dll!Unknown
- [59254389] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3434_PID_02A3_MI_00_IMAGE_hidusb.sys
- [59257133] [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1022_DEV_43fb_REV_0001
- [59257577] [Watson Failure]: Crash caused by 0xFC_SpbCx!__guard_fids_table__PERF__
- [59258573] [Watson Failure]: Crash caused by 0xE6_27_HidSpiCx!HidClassMinidriver_HidSpiRequestManager,HidSpiRequest_::EvtDeviceIoControl
- [59261969] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_BlockNotBusy_DOUBLE_FREE_c0000374_WUDFx02000.dll!FxLibraryCommonUnregisterClient
- [59262566] [Watson Failure]: Crash caused by SVCHOSTGROUP_BcastDVRUserService_FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_ControlLib.dll!internal_get_ptd_head_slow
- [59264469] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!TlgRegisterAggregateProviderEx
- [59264964] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WppRecorderUM.dll!wil::details::_dynamic_initializer_for__g_featureStateManager____PERF__
- [59265888] [Watson Failure]: Crash caused by 0x133_DPC_USBXHCI!Control_WdfEvtIoDefault
- [59265910] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_ControlLib.dll!try_get_function_slow
- [59265987] [Watson Failure]: Crash caused by 0xFC_urssynopsys!__guard_fids_table
- [59266222] [Watson Failure]: Crash caused by 0x10D_7_qcadcm_Wdf01000!FxNonPagedObject::_FxNonPagedObject
- [59267395] [Watson Failure]: Crash caused by FAIL_FAST_CORRUPT_LIST_ENTRY_c0000409_WUDFHost.exe!CWudfDevice::_GetDeviceItf
- [59269157] [Watson Failure]: Crash caused by 0x9F_3_WinUSB!WinUSB_SubmitRead
- [59271238] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_OOM_HighPagedPool_c00000fd_microsoft.graphics.display.displayenhancementservice.dll!out_of_memory
- [59272847] [Watson Failure]: Crash caused by 0x9F_4_PCI_rrwd0002_IMAGE_1394ohci.sys
- [59275762] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorFactory::_scalar_deleting_destructor_
- [59276135] [Watson Failure]: Crash caused by 0x9F_4_MVXBL64_IMAGE_UsbHub3.sys
- [59277116] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_FATAL_USER_CALLBACK_EXCEPTION_c000041d_microsoft.graphics.display.displayenhancementservice.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::ExecuteCurrentState
- [59279277] [RI-TP] Failed SensorServiceFuncTests::PnpStateTransitions: IsTrue((!isAccelerometerPresent && !isSdoPresent) ? (availableDeviceInterfaces.size() == 0) : (isSdoPresent ? (availableDeviceInterfaces.size() == 2) : (availableDeviceInterfaces.size() == 1)))
- [59279978] [Watson Failure]: Crash caused by AV_HDAudBus_Wdf01000!FxWaitLockInternal::ReleaseLock
- [59280050] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_3285_PID_0C18_IG_00_IMAGE_hidusb.sys
- [59280351] [Watson Failure]: Crash caused by 0x10D_5_UsbHub3!HUBPDO_EvtDevicePrepareHardware
- [59282426] [Watson Failure]: Crash caused by 0x3B_C000001D_ucx01000!UrbHandler_USBPORTStyle_Legacy_SCT_VendorClassCommand
- [59283296] [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_usbccgp!USBD_SyncCompletionRoutine
- [59290133] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_54ED_SUBSYS_8BB8103C_REV_00_IMAGE_USBXHCI.SYS
- [59291042] [Watson Failure]: Crash caused by IN_PAGE_ERROR_c000009c_c0000006_Windows.Devices.Sensors.dll!_NULL_IMPORT_DESCRIPTOR
- [59291378] [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!TUNNEL_EvtIrpPreprocessQueryDevRelations
- [59292560] [Watson Failure]: Crash caused by AV_Wdf01000!FxMemoryBufferFromPool::_FxMemoryBufferFromPool
- [59292695] [Watson Failure]: Crash caused by STACK_OVERFLOW_80070490_Windows.Devices.Sensors.dll!SimpleOrientation::InitializeDefaultByType
- [59293157] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_WUDFHost.exe!CWudfIoStackLocation::_CWudfIoStackLocation
- [59293213] [Watson Failure]: Crash caused by LKD_0x144_CONTROLLER_GONE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250320B80001
- [59294415] [RI-TP] AreEqual(expectedIsValidState ? HumanPresence::Present : HumanPresence::Unknown, reading->Presence) - Values (1, 0)
- [59295496] [Watson Failure]: Crash caused by AV_UmPass_Wdf01000!FxTransactionedList::LockForEnum
- [59296442] [Watson Failure]: Crash caused by 0x1F0_VRF_Usb4DeviceRouter!Usb4Drd::HostRouterInterface::CancelNotification
- [59296649] [Watson Failure]: Crash caused by LKD_0x144_D0ENTRY_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1142_REV_0000_FW_140328101800
- [59296798] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_ControlLib.dll!CTL_API::WDDMInterface::InvokeDriverEscape
- [59297086] [Watson Failure]: Crash caused by 0x7E_C000001D_Wdf01000!FxPkgPnp::SaveState
- [59297701] [Watson Failure]: Crash caused by FAIL_FAST_UNEXPECTED_HEAP_EXCEPTION_c0000409_ControlLib.dll!_acrt_initialize_stdio
- [59297729] [Watson Failure]: Crash caused by 0x1DB_USBPORT!MPf_PollController
- [59297758] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_IntelControlLib.dll!CTL_API::GfxHandler::_GfxHandler
- [59298653] [Watson Failure]: Crash caused by AV_Wdf01000!FxUsbDevice::GetString
- [59302657] [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_USBXHCI!DynamicLock_Release
- [59302942] [Watson Failure]: Crash caused by 0x133_OUT_OF_SYNC_PROCESSOR_usbccgp!QueryParentDeviceRelations
- [59304311] [Watson Failure]: Crash caused by MANUALLY_INITIATED_CRASH_ExcessiveWaitTimeOnERESOURCE_Blocked_On_kbdhid!KbdHidProcessCrashDump
- [59306618] [Watson Failure]: Crash caused by 0x133_ISR_WDFLDR!ReferenceClassVersion
- [59307044] [Watson Failure]: Crash caused by 0xB8_sshid_Wdf01000!FxIoTarget::SubmitSync
- [59307079] [Watson Failure]: Crash caused by 0x1E_C0000420_qcspi8180!spi_cancel_transfer
- [59307415] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_777d_REV_0000
- [59308583] [Watson Failure]: Crash caused by LKD_0x144_UNHANDLED_TRANSFER_EVENT_TRB_COMPLETION_CODE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250811B80001
- [59308584] [Watson Failure]: Crash caused by LKD_0x144_CONTEXT_ERROR_AFTER_SET_DEQUEUE_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250811B80001
- [59308856] [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Internal::GitEventSource_Windows::Foundation::ITypedEventHandler_Windows::Devices::Sensors::LightSensor_*,Windows::Devices::Sensors::LightS
- [59308925] [Watson Failure]: Crash caused by 0x9F_3_nWifiPAUSE_wg111v2_IMAGE_UsbHub3.sys
- [59309521] [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_ExcessiveThreadsWaitingForPageIn_IMAGE_Usb4HostRouter.sys
- [59309704] [RI-TP] AreEqual(static_cast<boolean>(expectedIsValidState), value) - Values (1, 0)
- [59309764] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_hid.dll!HidP_GetUsages
- [59310629] [Watson Failure]: Crash caused by LKD_0x144_DISABLE_SLOT_FAILED_USBXHCI!unknown_function
- [59311538] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!SmFx::StateMachineEngine::StateMachineEngineImpl::InitiateFirstRun
- [59311784] [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_serenum!Serenum_DispatchPassThrough
- [59312420] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!wil_details_FeatureReporting_RecordUsageInCache
- [59315281] [Watson Failure]: Crash caused by LKD_0x144_INVALID_TRANSFER_EVENT_PTR_ED_1_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_38ed_REV_0010
- [59315631] Failed Microsoft::Windows::DisplayEnhancement::FuncTests::AutobrightnessTests::BatterySaverBrightnessMultiplierTest: AreEqual(GetBrightnessPowerGuidValue(), targetBrightness) - Values (80, 100)
- [59316026] [Watson Failure]: Crash caused by AV_UmPass_Wdf01000!FxObject::PerformDisposingDisposeChildrenLocked
- [59316535] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!unknown_function
- [59317519] [Watson Failure]: Crash caused by 0x7E_C0000006_C0000428_HIDCLASS!HidpGetComboHardwareIdV2Enabled
- [59319530] [Watson Failure]: Crash caused by 0x13a_11_Mdl__IMAGE_hidusb.sys
- [59320086] [Watson Failure]: Crash caused by 0x7f_8_USBXHCI!StageQueue_ForwardScanGetNextStage
- [59320315] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_ExcessiveReadyThreads_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_9A03_SUBSYS_380A17AA_REV_01
- [59320710] [Watson Failure]: Crash caused by AV_WDFLDR!DereferenceClassVersion
- [59320801] [Watson Failure]: Crash caused by LKD_0x144_EVENT_RING_FULL_ERROR_USBXHCI!unknown_function
- [59321409] [Watson Failure]: Crash caused by AV_msquic!FxDriverEntry
- [59322185] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_ACCESS_VIOLATION_c0000005_sensorservice.dll!History::RetrieveHistoryFromSensor
- [59322295] [Watson Failure]: Crash caused by 0x139_MISSING_GSFRAME_ISH!unknown_function
- [59322306] [Watson Failure]: Crash caused by BREAKPOINT_80000003_hid.dll!Unknown
- [59322362] [Watson Failure]: Crash caused by 0x9F_4_PCI_IMAGE_WUDFRd.sys_PCI_VEN_8086_DEV_9A03_SUBSYS_87FE103C_REV_02
- [59323183] [Watson Failure]: Crash caused by 0x133_DPC_USBXHCI!Control_ProcessTransferEventWithED0
- [59323297] [Watson Failure]: Crash caused by AV_BthHFEnum_Wdf01000!FxWmiIrpHandler::_RegInfo
- [59323531] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_wna3100m_ExcessiveReadyThreads_IMAGE_UsbHub3.sys
- [59323709] [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::QueryInterface
- [59324179] [Watson Failure]: Crash caused by IN_PAGE_ERROR_c000009c_c0000006_Windows.Devices.Sensors.dll!_imp_BiRtDeleteEventForApp
- [59324328] [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!HUBREG_DeleteUxdSettings
- [59325364] [Watson Failure]: Crash caused by MOAPPLICATION_HANG_cfffffff_Windows.Graphics.Display.DisplayEnhancementOverride.dll!guard_dispatch_icall$thunk$10345483385596137414
- [59325866] [Watson Failure]: Crash caused by 0xE4_2_ApHidfiltrService_Wdf01000!MxWorkItem::Free
- [59326374] [Watson Failure]: Crash caused by LKD_0x1cc_EXRESOURCE_TIMEOUT_OWNERTHREAD_ssps2!MSIECRestore
- [59327467] [RI-TP] Failed \WinRTSensors.FuncTests.CppCx.dll/SimpleOrientationSensorTests/SimpleOrientationSensorTests::ClassSetup: Setup fixture 'SimpleOrientationSensorTests::ClassSetup' for the scope 'SimpleOrientationSensorTests' returned 'false'.
- [59327468] [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8._REG_ACPI_IMAGE_UsbHub3.sys
- [59327699] [RI-TP] Failed HumanPresenceExtensionManagerTests::SensorAdapterProcessReadingFails: AreEqual(detectionDistanceInMillimeters, expectedDistanceInMillimeters) - Values (0, 4000)
- [59328063] [Watson Failure]: Crash caused by AV_WpdUpFltr!FxDriverEntry
- [59328515] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_1022_DEV_15D7_SUBSYS_21371D72_REV_00_IMAGE_USBXHCI.SYS
- [59329695] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorFactory::GetDefault
- [59329928] [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PC00.LPCB.EC0.SEN1.PAT0_ACPI_IMAGE_USBXHCI.SYS
- [59330419] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorReadingChangedEventArgsServer::_scalar_deleting_destructor_
- [59331183] [Watson Failure]: Crash caused by APPLICATION_FAULT_c00000aa_SensorsApi.dll!Windows::Internal::GitPtrImpl_Windows::Internal::GitPtr_::Initialize_ISensorEvents_
- [59331323] [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ExcessiveThreadsWaitingForPageIn_IMAGE_qci2c7180.sys
- [59331352] [Watson Failure]: Crash caused by HUP_BUGCHECK_POR_PIN_CANT_FIND_RESOURCE_HL_2_FormFactor_HPUv2_F4000001_WUDFHost.exe!unknown_error_in_process
- [59332194] [Watson Failure]: Crash caused by STACK_OVERFLOW_c0000005_ControlLib.dll!ctlInit2
- [59332752] [Watson Failure]: Crash caused by 0x13a_11_Wait_WUDFRd!operator_delete
- [59332889] [Watson Failure]: Crash caused by 0x13a_11_Wait_WUDFRd!_MODULE_INFO::__MODULE_INFO
- [59333427] [Watson Failure]: Crash caused by AV_ucx01000!USBPORTStyle_UserGetRootHubName
- [59333510] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_ERROR_AFTER_STOP_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_2426_REV_0001_FW_250811B80001
- [59333826] [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8.U4UP.U4P2._PS3_ACPI_IMAGE_UsbHub3.sys
- [59333995] [RI-TP] Failed HumanPresenceExtensionManagerTests::SensorAdapterProcessReadingTimeoutExpiredFails: AreEqual(sharedMemoryBlock->CallsCount_ProcessReadingTimeoutExpired, 1u) - Values (0, 1)
- [59334169] [Watson Failure]: Crash caused by 0x9F_4_USB_nationalinstrumentsblan_IMAGE_UsbHub3.sys
- [59335286] [Watson Failure]: Crash caused by 0x9F_3_AML!_SB.PCI0.GPP8.U4UP.U4P3.UHI0._REG_ACPI_IMAGE_UsbHub3.sys
- [59337509] [Watson Failure]: Crash caused by AV_iaLPSS2_GPIO2_Wdf01000!FxPkgPnp::_PowerProcessEventInner
- [59337989] [Watson Failure]: Crash caused by 0x9F_4_USB_WacHIDRouterISDU_IMAGE_UsbHub3.sys
- [59339883] [Watson Failure]: Crash caused by AV_SpbCx!CScxTarget::_OnTargetIoDefault
- [59341548] [Watson Failure]: Crash caused by LKD_0x144_RESET_RECOVERY_RESET_FAILED_USBXHCI!unknown_function
- [59342675] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_c0000409_SensorsApi.dll!Microsoft::WRL::ComPtr_IUnknown_::InternalRelease
- [59344453] [Watson Failure]: Crash caused by IN_PAGE_ERROR_services.exe_BUGCHECK_CRITICAL_PROCESS_c0000005_services!WdfProcess::TerminateProcess
- [59344894] [Watson Failure]: Crash caused by 0x9F_3_RtkBtfilter_ExcessiveReadyThreads_ProcessorThrottled_PerfPolicy_IMAGE_amdhub31.sys
- [59345129] [Watson Failure]: Crash caused by CLR_EXCEPTION_80132006_dc.exe!unknown_function
- [59348230] [Watson Failure]: Crash caused by AV_SpbCx!CScxController::_OnDxIrpComplete
- [59348646] [Watson Failure]: Crash caused by SVCHOSTGROUP_LocalSystemNetworkRestricted_FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_c0000409_microsoft.graphics.display.displayenhancementservice.dll!Microsoft::Bluetooth::Foundation::TokenWithStatusControl_Microsoft::Windows::
- [59350819] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_045E_PID_0C9E_IMAGE_btfilter.sys
- [59352553] [Watson Failure]: Crash caused by 0x7E_C000001D_UsbHub3!HUBREG_OpenQueryAttemptRecoveryFromUsbPowerDrainValue
- [59353175] [RI-TP] Failed \USBTCDtaef.dll/UsbTcdTests::WinUsbIoTests/UsbTcdTests::WinUsbIoTests::WinUSBBulkAndIsochIOCancellations/UsbTcdTests::WinUsbIoTests::MethodCleanup: Encountered failure for USBXHCI host controller while running test. Please visit aka.ms/xhci
- [59355064] [Watson Failure]: Crash caused by 0xc2_d_BTHUSB_Wdf01000!FxPoolFree
- [59355701] [Watson Failure]: Crash caused by AV_SerCx2!Timer_EvtTimerFired
- [59358275] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_23E5_PID_A2F0_REV_0500_MI_03_IMAGE_hidusb.sys
- [59359255] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::MakeAndInitialize_Windows::Devices::Sensors::GyrometerServer,Windows::Devices::Sensors::GyrometerServer_
- [59361366] [Watson Failure]: Crash caused by APPLICATION_HANG_Unowned_CriticalSection_c0000194_SensorsUtilsV2.dll!SerializationBufferFree
- [59361640] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_4E53_PID_5407_MI_01_IMAGE_hidusb.sys
- [59361939] [RI-TP] AreEqual(static_cast<HRESULT>(RPC_S_CALLPENDING), CoWaitForMultipleHandles( COWAIT_DISPATCH_CALLS | COWAIT_DISPATCH_WINDOW_MESSAGES, s_readingChangeWaitTimeInMilliSeconds, 1, readingChangedEvent.addressof(), &indexUsed)) - Values (0x80010115, 0x0)
- [59363193] [Watson Failure]: Crash caused by LKD_0x144_EVENT_RING_FULL_ERROR_USBXHCI!TelemetryData_CreateReport_VEN_8086_DEV_a87d_REV_0001
- [59364370] [Watson Failure]: Crash caused by FATAL_USER_CALLBACK_EXCEPTION_c000041d_WUDFHost.exe!unknown_error_in_process
- [59365080] [Watson Failure]: Crash caused by 0x139_a_GUARD_ICALL_CHECK_FAILURE_ucx01000!UrbHandler_USBPORTStyle_Legacy_SCT_VendorClassCommand
- [59366134] [WinVOS][WinVOSFull]Failed AccelerometerTests::ReadingChanged#metadataSet3: SUCCEEDED(CoWaitForMultipleHandles( COWAIT_DISPATCH_CALLS | COWAIT_DISPATCH_WINDOW_MESSAGES, timeoutMs, 1, &(rawCompletedEvent), &eventIndexUnused)): Failed to get a ReadingChange
- [59366198] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_ListEntryCorruption_c0000374_WUDFx02000.dll!FxMemoryBufferFromLookaside::SelfDestruct
- [59367395] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SensorsUtilsV2.dll!MIDL_user_allocate
- [59368848] [GE LT] Feature_SoftwareOffloadWithClientBuffers | 39615196: Ensure LT And GE branches are identical
- [59374451] [Watson Failure]: Crash caused by 0x133_ISR_USBXHCI!ESM_ExecuteEntryFunctionsAndPushPopStateMachinesForCurrentState
- [59374463] [Watson Failure]: Crash caused by APPLICATION_HANG_c0000194_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::Internal::SensorServer::remove_ReadingChanged
- [59374710] [Watson Failure]: Crash caused by CLOCK_WATCHDOG_TIMEOUT_INTERRUPTS_DISABLED_USBXHCI!Control_Transfer_Map
- [59374857] [Watson Failure]: Crash caused by 0xE6_28_nvxhcifilter!unknown_function
- [59375481] [Watson Failure]: Crash caused by MANUALLY_INITIATED_CRASH_ExcessiveWaitTimeOnERESOURCE_Blocked_On_i8042prt!I8xProcessCrashDump
- [59375758] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_PCI_VEN_8086_DEV_7749_SUBSYS_380517AA_REV_00_IMAGE_mshidkmdf.sys
- [59376067] [Watson Failure]: Crash caused by 0x13a_8_9____USBXHCI_Wdf01000!FxPoolFree
- [59376729] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Compass.exe!unknown_error_in_process
- [59377415] [Watson Failure]: Crash caused by FAIL_FAST_FATAL_APP_EXIT_AVRF_c0000409_SensorService.HumanPresenceMonitor.UnitTests.dll!Unknown
- [59377589] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_ExcessiveThreadsWaitingForPageIn_IMAGE_WUDFRd.sys_ROOT_LENOVOVHID
- [59378696] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::MakeAndInitialize_Windows::Devices::Sensors::InclinometerFactory,Windows::Devices::Sensors::InclinometerFactory_
- [59379366] [Watson Failure]: Crash caused by SVCHOSTGROUP_WbioSvcGroup_ASSERTION_FAILURE_c0000420_SensorsApi.dll!_CClassExtensionProxy::EnQueue_::_1_::catch$9
- [59379519] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_amdfendrsr.exe!Unknown
- [59381427] [Watson Failure]: Crash caused by 0x7E_C0000006_C0000428_WinUsb!WinUSB_GetDeviceDescriptor
- [59382125] Failed Microsoft.Graphics.DisplayEnhancements.AdaptiveColor.FunctionalTests.testmd [Double Nits Monitor]: Error trace not within a test case. - (Error=0x800705b4) Failed to enable provider
- [59388177] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_IntelControlLib.dll!internal_get_ptd_head_slow
- [59390666] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_agrsm64_IMAGE_UsbHub3.sys
- [59390770] [Watson Failure]: Crash caused by ILLEGAL_INSTRUCTION_c000001d_IntelControlLib.dll!CTL_API::_dynamic_atexit_destructor_for__OSDllsobj__
- [59392055] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::AccelerometerServer::ProcessReadings
- [59394281] [RI-TP] AreEqual(expectedPersonIdVector[i], UINT32_MAX) - Values (1, 4294967295)
- [59395048] [Watson Failure]: Crash caused by APPLICATION_HANG_BusyHang_DeviceInstallTimeout_LKD_00000000-0000-0000-0000-000000000000_cfffffff_Wdf01000.sys!FxCREvent::EnterCRAndWait
- [59403376] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Internal.Graphics.Display.DisplayEnhancementManagement.dll!Microsoft::WRL::ActivationFactory_Microsoft::WRL::Implements_Microsoft::WRL::FtmBase,Windows::Internal::Graphics::Display::Displ
- [59403680] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_ACPI_NVDA8000_IMAGE_USBXHCI.SYS
- [59405071] [Watson Failure]: Crash caused by 0x9F_3_ExcessiveReadyThreads_ProcessorThrottled_PerfPolicy_IMAGE_hidi2c.sys
- [59405852] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINTS_DECONFIGURE_FAILED_USBXHCI!TelemetryData_CreateReport_VEN_1b21_DEV_1343_REV_0000_FW_151015300402
- [59408877] [Watson Failure]: Crash caused by 0x3B_80000004_ucx01000!McTemplateK0ppppphnNR5_EtwWriteTransfer
- [59409382] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_ACPI_CIRQ1080_IMAGE_mshidkmdf.sys
- [59410594] [Watson Failure]: Crash caused by HEAP_CORRUPTION_c0000374_Windows.Devices.Sensors.dll!ViewPositionTracker::RegisterForDisplayRegionChanges
- [59410891] [Watson Failure]: Crash caused by 0x133_ISR_amdi2c_Wdf01000!FxPkgPnp::PowerPolicyEnterNewState
- [59410966] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::AccelerometerReadingServer::_scalar_deleting_destructor_
- [59411370] [Watson Failure]: Crash caused by FAIL_FAST_CONTROL_INVALID_RETURN_ADDRESS_c0000409_amdfendrsr.exe!unknown_error_in_process
- [59411727] [Watson Failure]: Crash caused by 0x133_DPC_Wdf01000!FxEventQueue::EventQueueWorker
- [59412494] [Watson Failure]: Crash caused by 0x7f_8_kbdclass!KeyboardStart
- [59412945] [Watson Failure]: Crash caused by 0xE6_26_USBXHCI!Isoch_RetrieveNextStage
- [59413180] [Watson Failure]: Crash caused by 0x13a_8__g___USBHUB3_Wdf01000!FxPoolFree
- [59413586] IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)
- [59414558] [Watson Failure]: Crash caused by FAIL_FAST_GUARD_ICALL_CHECK_FAILURE_80070490_Windows.Devices.Sensors.dll!wil::details::WilFailureNotifyWatchers
- [59415097] [Watson Failure]: Crash caused by FAIL_FAST_STACK_COOKIE_CHECK_FAILURE_c0000409_IntelControlLib.dll!free_base
- [59415693] [Watson Failure]: Crash caused by LKD_0x15F_DEVICE_USB_VID_1A86_PID_E310_MI_00_IMAGE_hidusb.sys
- [59416289] [Watson Failure]: Crash caused by AV_PTPFilter_Wdf01000!FxIoQueue::DispatchRequestToDriver
- [59416556] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_Windows.Devices.Sensors.dll!Microsoft::WRL::Details::CreateActivationFactory_Windows::Devices::Sensors::OrientationSensorFactory_
- [59416853] [RI-TP] Failed HumanPresenceMonitorFactoryTests::SensorSelectionTest: IsGreaterThanOrEqual(availableSensors.size(), static_cast<size_t>(3)) - Values (0, 3)
- [59419515] [Watson Failure]: Crash caused by HEAP_CORRUPTION_ACTIONABLE_LFHBitmapSegmentCorruption_c0000374_Windows.Devices.Sensors.dll!Windows::Devices::Sensors::ReadingFilter::GetNativeOrientationFromVideoOutput
- [59419696] [Watson Failure]: Crash caused by AV_USBHUB3_Wdf01000!FxPkgFdo::HandleQueryCapabilitiesCompletion
- [59419751] [Watson Failure]: Crash caused by LKD_0x144_ENDPOINT_NOT_STOPPED_AFTER_STOP_ENDPOINT_SUCCESS_USBXHCI!TelemetryData_CreateReport_VEN_QCOM_DEV_0FEE_REV_0000_FW_3130
- [59421866] [Watson Failure]: Crash caused by 0x139_MISMATCH_GSCOOKIE_usbcir!UsbIrParse
- [59422253] [Watson Failure]: Crash caused by AV_USBXHCI!Isoch_MappingLoop
- [59422395] [Watson Failure]: Crash caused by 0xC1_23_VRF_WinUSB!WinUSB_ReadPipeCompletion
- [59423032] [Watson Failure]: Crash caused by 0x9F_3_POWER_DOWN_madiface_usb_amd_IMAGE_UsbHub3.sys
- [59427333] [Watson Failure]: Crash caused by ACCESS_VIOLATION_c0000005_SettingsHandlers_HumanPresence.dll!wil::details::functor_wrapper_void__lambda_260b81f2231255642d6c288569aacead___::Run
- [59440459] [RI-TP] Failed VhfTaefTest.testmd: Waiting for the device interface arrival failed. WaitResult:258
- [59447935] [RI-TP] AreEqual(true, dataExpected) - Values (1, 0)
- [59450916] [RI-TP] Failed HumanPresenceSensorTests::GetCurrentReadingValidation: AreEqual(reading2->Presence, detectionState ? HumanPresence::Present : HumanPresence::NotPresent) - Values (1, 2)
- [59458630] Failed Microsoft::Windows::DisplayEnhancement::DeoRpcServer::UnitTests::DeoRpcServerUnittests::SimpleStartStopOverrideTest: IsTrue(verifier.verify_success_and_count<BrightnessOverrideTest>(1))
- [59468868] IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)
- [59469591] [Diomedes][N1x][MTK 5558567] CLOCK_WATCHDOG_TIMEOUT on boot blamed on mtkwecxa.sys
- [59645373] Hardware | Wistron Corporation | Gradual Rollout failed
- [59656544] Failed Windows.Graphics.Display.BrightnessOverride.ApiTests.testmd [Single Nits Monitor - No ALS]: Error trace not within a test case. - (Error=0x800705b4) Failed to enable provider
- [59656794] [Diomedes][MINOS EV1.5 Selfhost] Consistent IOMMU fault bugcheck on LKG 1001 (BSP 4.14.2) when connecting Lenovo Ideapad TBT3 dock
- [59659748] [RI-TP] AreEqual(expectedIsValidState ? HumanPresence::Present : HumanPresence::Unknown, reading->Presence) - Values (1, 0)
- [59689131] [wini3c][test] Timeout during ResetOverlapped::ResetWithCccDefiningByte
- [59693022] After the update, the adaptive color option is removed from Settings app.
- [59696259] [Lenovo][HDE][Avon][Think][OEMQ] How to customize Microsoft Adaptive Brightness curve for BC2
- [59793191] [RI-TP] Calling handle succesfully despite access revocation, failing test
- [59816561] [RI-TP] Failed SpbTarget::Sequence: SUCCEEDED(VirtualHostControllerDevice::CreateAndInitializeAcpi(hcis, acpiAsl, hcd)) - Value (0x80070102)
- [59826192] [Lenovo][FCCL][Win11][25H2/24H2]USB keyboard and mouse unresponsive in WinRE after Windows 11 24H2/25H2 update (26100.6899 / 26200.6899, KB5066835) (Repro Rate 100%)
- [59832815] [USB4] InterdomainRxRing Consumer Index is incorrectly initialized leading to blocked P2P file transfers
- [59835975] [MSFT I3C HCI Driver][STRIX1 I3C][v7] Observed error for HostCancelRead SuperMITT tests error pointing to HostCancelRead transfer completion and improper cancellation handling in driver (SWDEV-559140)
- [59852467] Failed ManualBrightnessTests::AutobrightnessEnableDisableTest: IsFalse(display->IsMonitorBrightnessCloseToExpectedLevel(static_cast<BrightnessPercentage>(manualBrightnessSliderStrength)))
- [59880170] IsLessThan(secondScreenBrightnessPercent, firstScreenBrightnessPercent) - Values (50, 50)
- [59884289] USB C stopped working after update to Windows 11 25H2

## Pull Request Summary

- Total PRs merged: 0
- Most active repositories:
  - No PR data available

## Notes

This summary was automatically generated from Azure DevOps work item data.
Please review and enhance with additional context as needed.

---
*Generated on 2025-11-14 17:22:54*
