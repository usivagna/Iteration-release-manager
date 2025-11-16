# Iteration Summary: 2510

**Period:** September 29, 2025 - November 2, 2025 (5 weeks)  
**Team:** ft_buses  
**Areas:** Buses & Sensors  
**Report Generated:** November 14, 2025

---

## Executive Summary

### Delivery Metrics
- **Total work items completed:** 19 (out of 177 in iteration)
- **Work items with code contributions:** 11 (58%)
- **Work items without PRs:** 8 (42%)
- **Pull requests merged:** 19
- **Pull requests abandoned:** 3 draft PRs

### Breakdown by Type
- **Tasks:** 13 (68%)
- **Deliverables:** 4 (21%)
- **Bugs:** 2 (11%)

### Breakdown by Area
- **Buses Component:** 17 work items (89%)
- **Sensors Component:** 2 work items (11%)

### Key Themes and Focus Areas

**1. USB Connectivity & Power Management**
- USB4 bugcheck 0x15F remediation (watchdog timeout fixes)
- eUSB2v1 camera support with double isoch bandwidth feature
- USB3 sleep/wake scenario testing infrastructure

**2. I3C Protocol Enhancements**
- Power management improvements (D0 state handling)
- WinI3C Reset API implementation
- Intel NVL platform enablement
- HIDI3C input device support (keyboard/mouse)

**3. UMDF Driver Framework Hardening**
- Device recovery mechanisms (PLDR/FLDR support)
- Security compliance requirements (ProcessSharingDisabled)
- Improved system reliability and performance

**4. Testing & Tooling Infrastructure**
- WDF v35 HLK certification support
- SuperMITT test hardware enhancements
- Feature enablement tooling fixes

**5. Security & Compliance**
- TVS security warnings remediation (banned API replacement)
- Secure coding standards enforcement

---

## Completed Work Items

### Buses Component (17 items)

#### **WI #48522963: USB4 Bugcheck 0x15F Remediation** | Task | Completed
**Description:** Addressed critical system crash (Bugcheck 0x15F - CONNECTED_STANDBY_WATCHDOG_TIMEOUT_LIVEDUMP) occurring in USB4/Tunnel driver stack across Nickel and GE+CD branches.

**Key Changes:**
- Fixed watchdog timeout for ports connected under USB4 (PR #10667522)
- Implemented multiple branch backports to ensure fix propagation:
  - Main development branch (rs_cplat_scon_dev)
  - Base1_bpt3 branch (PR #10946526)
  - BCOB branch (PR #10139943)
- Explored USB4_FIRMWARE_PREFIX path handling (abandoned in favor of primary fix)

**Technical Impact:** Eliminated critical crash scenario affecting USB4 connected standby transitions, improving system stability for Thunderbolt/USB4 devices.

---

#### **WI #50979834: UMDF Device Driver Reliability Initiative** | Deliverable | Completed
**Description:** Ongoing effort to reduce UMDF device driver failures to improve overall system reliability and performance.

**Status:** Deliverable completed without direct code contributions in this iteration. Progress tracked through related work items (PLDR/FLDR support, ProcessSharingDisabled enforcement).

---

#### **WI #56985893: eUSB2 Double-Isoch Camera Support** | Task | Completed
**Description:** Productization of eUSB2v1 Double-Isoch changes to enable enhanced camera bandwidth support for USB-C camera devices.

**Key Changes:**
- Bumped UCX (USB Controller Extension) to version 1.7 (PR #12940218)
- Implemented Double Isoch Bandwidth Support in USB stack (PR #13020442)
  - Enables dual isochronous transfer streams for camera devices
  - Supports higher bandwidth requirements for 4K/high-framerate video
- Fixed BusesCdFeatureEnablementTool to enable Feature_Standalone_Future (PR #14006614)
  - Tool was enabling Feature_Bundle_Future but missing dependent Feature_Standalone_Future
  - Caused eUSB2v1 velocity features to fail on release branches
  - Critical for enabling feature on production builds

**Technical Challenges:**
- Initial eUSB2v1 interface PRs (#12944571, #12944631) were abandoned as drafts, requiring redesign
- Feature dependency chain (Feature_Foo → Feature_Bundle_Future → Feature_Standalone_Future) caused activation issues on release branches
- Long merge cycle (May to October) due to validation requirements

**Technical Impact:** Major feature enabling high-bandwidth camera support on eUSB2v1 protocol, critical for next-gen webcam and imaging devices.

---

#### **WI #57002423: State Machine Resizing Support** | Task | Completed
**Description:** Support for resizing states in state machine framework (likely VisioPluginForSmfx related).

**Status:** Completed without direct code contributions in this iteration.

---

#### **WI #57010852: WDF VBscript Migration** | Deliverable | Completed
**Description:** Migration away from VBscript dependencies in WDF (Windows Driver Framework) build system. Target completion: August 2025.

**Status:** Deliverable completed without direct code contributions in this iteration.

---

#### **WI #57344706: UMDF Device Recovery - PLDR/FLDR** | Task | Completed
**Description:** Enhanced UMDF framework to invoke Platform Level Device Reset (PLDR) and Function Level Device Reset (FLDR) when UMDF drivers crash or hang.

**Key Changes:** (PR #12830581)
- Implemented Design Spec 10.2 for handling abnormal UMDF host process termination
- WudfRd (UMDF Reflector Driver) now verifies device supports DEVICE_RESET_INTERFACE_STANDARD on startup
- Invokes DeviceReset method when UM driver crashes/hangs to restore device to known uninitialized state
- Added Control.cpp DeviceReset method with PLDR/FLDR support checks and error handling
- Integrated reset invocation in Dma.cpp's BlockUnfinishedDma for DMA-enabled drivers
- Required for UMDF drivers performing DMA operations

**Testing:** Validated with WiFi adapter (PCI 8086:06F0) supporting PLDR using umdf_dma test driver. Verified PLDR invocation on wudfhost kill.

**Technical Impact:** Significantly improves UMDF driver reliability by providing hardware-level recovery mechanism for driver failures, reducing need for full device removal/re-enumeration.

---

#### **WI #57421651: UMDF DMA Security Hardening** | Task | Completed
**Description:** Enforced security requirement that UMDF drivers using DMA must specify ProcessSharingDisabled or DeviceGroupId in INF file.

**Key Changes:** (PR #12868419)
- Implemented Design Spec 8.1 requirement for DMA opt-in via INF
- WudfRd queries UmdfHostProcessSharing and DeviceGroupId early in driver load
- Validates configuration when driver calls WdfDmaEnablerCreate
- Logs error and fails driver load if requirements not met
- Ensures UMDF drivers using DMA cannot share process space (security isolation)

**Testing:** Verified positive and negative test cases with umdf_dma test driver.

**Technical Impact:** Hardens security posture for UMDF DMA drivers by enforcing process isolation, preventing potential cross-driver attacks through shared process space.

---

#### **WI #57990286: VisioPluginForSmfx UI Enhancement** | Task | Completed
**Description:** Updated VisioPluginForSmfx color scheme and fonts to match MagicDraw for improved readability and ease of transition.

**Status:** Completed without direct code contributions in this iteration.

---

#### **WI #58132333: USB4 Bugfixes for 2510** | Task | Completed
**Description:** Consolidated USB4 bugfixes targeted for iteration 2510.

**Status:** Completed without direct code contributions in this iteration. Likely tracked through parent WI #48522963.

---

#### **WI #58207911: I3C Power Management Fix** | Task | Completed
**Description:** Fixed critical issue where I3C HostController did not return to D0 (full power) when Target device updated the Dynamic Address Table (DAT), causing IBI (In-Band Interrupt) drops.

**Key Changes:** (PR #13864945)
- Updated HostControllerDat to always acquire/remove power reference when updating DAT from Target
- Fixed scenario where client disables IBIs but DAT update (to enable IBI rejections) wasn't persisted
- Without fix, future IBIs sent by Target were silently dropped by Transport Coordinator
- Added new test to validate HostController power transitions

**Testing:** Ran tests locally to verify HostController D0 state handling.

**Technical Impact:** Prevents silent IBI loss, ensuring reliable I3C interrupt delivery. Critical for I3C sensor and device communication reliability.

---

#### **WI #58638331: Security Compliance - Banned API Remediation** | Deliverable | Completed
**Description:** Addressed TVS (Trust and Value of Security) static analysis warnings for banned API usage in ports control panel code.

**Key Changes:** (PR #13311236)
- Replaced all instances of banned API `lstrlen` with `_tcsnlen` (TCHAR-family function)
  - `_tcsnlen` maps to `strnlen` (ANSI) or `wcsnlen` (Unicode) based on build configuration
  - Provides bounds checking and safer error handling
- Added explicit DWORD casts for type compatibility (_tcsnlen returns size_t vs lstrlen's int)
- Added manual null-termination safeguards in select locations to defend against existing vulnerabilities
- Fixed C28750 PREfast violation in InstallPnPParallelPort function (ports.c)

**Testing:** Extensive manual testing on Raider GE66 with USB-to-serial device:
- Feature tested enabled/disabled states
- Device uninstall/removal scenarios
- WinDbg debugger attached with breakpoints to verify nominal functionality
- Confirmed no yellow-bang or bugchecks

**Technical Impact:** Ensures secure coding standards compliance, eliminates banned API usage, improves string handling safety with bounded operations.

---

#### **WI #58949309: Arm64 Keyboard Compatibility Bug** | Bug | Closed
**Description:** Inconsistent keyboard functionality in Arm64 devices running under compatibility/emulation layer (CRD - presumably Cloud Remote Desktop or Compatibility).

**Status:** Closed without direct code contributions in this iteration. Resolution approach not documented in PR data.

---

#### **WI #59176904: I3C WinI3C Reset API** | Task | Completed
**Description:** Implemented Target Reset capability via WinI3C user-mode API for I3C devices.

**Key Changes:** (PR #13852038)
- Added overlapped and non-overlapped APIs to reset I3C Target devices (IOCTL_I3C_TARGET_RESET)
- Provides user-mode applications ability to programmatically reset I3C devices
- Includes comprehensive test collateral

**Testing:** Ran wini3ctargettest.dll locally with new tests.

**Technical Impact:** Enables application-level I3C device recovery without driver/hardware intervention, improving device management capabilities.

---

#### **WI #59388824: USB3 Sleep/Wake Testing** | Task | Completed
**Description:** Implemented stress test infrastructure to exercise XHCI (USB3) controller sleep/wake path, monitoring for controller removals, resets, or device re-enumeration failures.

**Key Changes:** (PR #12899153)
- Test setup: XHCI → Hub → SuperMUTT device
- Test algorithm for search range [StartIdleTimeInMs, StartIdleTimeInMs + RangeInMs]:
  1. Wait 20 seconds for XHCI to idle
  2. Send SuperMUTT command to reconnect after X ms
  3. Wait X ms + 20 seconds for reconnection
  4. Send control transfer to confirm SuperMUTT availability
- Increments search time by random value for comprehensive coverage
- Monitors for XHCI hardware failures and device re-enumeration issues

**Testing:** 
- Tested with appverifier enabled on te.processhost.exe
- Validated WinUSB MUTT tests locally with no regressions
- Verified GetParentXhciControllerDeviceId calls during TestClassSetup

**Technical Impact:** Provides critical test coverage for USB3 power management scenarios, catches controller sleep/wake bugs early in development cycle.

---

#### **WI #59692400: I3C Intel NVL Platform Support** | Task | Completed
**Description:** Enabled I3C support on Intel NVL (Nova Lake) platform.

**Key Changes:** (PR #13923614)
- Added same hack flags for NVL as PTL (Panther Lake)
- Intel confirmed I3C IP is identical between platforms
- Non-functional change (configuration only)

**Testing:** Non-functional change, validated through existing I3C test suite.

**Technical Impact:** Extends I3C support to Intel's next-generation NVL platform, ensuring forward compatibility.

---

#### **WI #59907326: SuperMITT HIDI3C Input Support** | Task | Completed
**Description:** Added HIDI3C keyboard and mouse support to SuperMITT test hardware for demo and partner validation scenarios.

**Key Changes:** (PR #14042644)
- Added HIDI3C descriptors for mouse and keyboard devices
- Implemented finite input notification support from SuperMITT
- Updated SuperMITT FPGA firmware to add support and fix bugs
- Enables SuperMITT to emulate HIDI3C input devices over I3C bus

**Testing:** Ran all tests on Intel RVP (Reference Validation Platform) and passed.

**Technical Impact:** Critical tooling for I3C ecosystem development, enables hardware partners to validate HIDI3C input device implementations.

---

#### **WI #59963386: WDF HLK Certification Update** | Task | Completed
**Description:** Updated WdfFuncTableChecks HLK (Hardware Lab Kit) test to support WDF v35 release, enabling driver certification for v35 drivers.

**Key Changes:** (PR #14085958)
- Updated function table count checks for WDF v35:
  - KMDF v35: 458 functions (unchanged from v33)
  - UMDF v35: 287 functions (increased from v33)
- Implemented exception for WudfRd.sys to unblock customer HLK system submissions
- Test continues to fail for other v35 drivers until formal release approval
- Recurring maintenance task for each new WDF version

**Testing:**
- Build clean locally
- Verified inbox v35 driver (WudfRd.sys) passes: "Version 1.35 TableCount 458 - Valid KMDF driver"
- Verified other v35 drivers fail as expected: "Version 1.35 TableCount 458 - Invalid KMDF driver"
- Verified UMDF v35 drivers fail: "Version 2.35 TableCount 287 - Invalid UMDF driver"

**Technical Impact:** Unblocks WDF v35 driver certification path while maintaining gating control for pre-release drivers. Critical for WudfRd.sys customer submissions.

---

### Sensors Component (2 items)

#### **WI #58145457: Sensors Bugfixes for 2510** | Deliverable | Completed
**Description:** Consolidated sensors bugfixes targeted for iteration 2510.

**Status:** Completed without direct code contributions in this iteration.

---

#### **WI #59693022: Adaptive Color Settings Bug** | Bug | Closed
**Description:** After system update, adaptive color option disappeared from Settings app.

**Status:** Closed without direct code contributions in this iteration. Resolution approach not documented in PR data.

---

## Technical Highlights

### Major Features Implemented

**1. eUSB2v1 Double Isoch Bandwidth Support**
- Significant camera connectivity enhancement enabling 4K/high-framerate video
- UCX framework version bump to 1.7
- Feature enablement tooling fix critical for production deployment
- 5-month development and validation cycle (May-October)

**2. UMDF Driver Framework Hardening**
- PLDR/FLDR device reset capability for crash recovery
- ProcessSharingDisabled security enforcement for DMA drivers
- Improves overall UMDF driver ecosystem reliability

**3. I3C Protocol Enhancements**
- WinI3C Reset API for user-mode device management
- Power management fix preventing IBI loss
- Intel NVL platform enablement
- HIDI3C input device support (keyboard/mouse emulation)

**4. USB3 Sleep/Wake Test Infrastructure**
- Comprehensive stress testing for XHCI power management
- Automated detection of controller failures and re-enumeration issues
- Critical for catching power management regressions

### Critical Bugs Fixed

**1. USB4 Bugcheck 0x15F (CONNECTED_STANDBY_WATCHDOG_TIMEOUT_LIVEDUMP)**
- Severity: Critical system crash
- Impact: All USB4/Thunderbolt devices during connected standby
- Fix propagated across 3 branches (dev, base1_bpt3, bcob)
- Timeline: February 2024 - June 2024

**2. I3C IBI Silent Drop Issue**
- Severity: Data loss / device communication failure
- Impact: I3C sensors and devices losing interrupt notifications
- Root cause: HostController not returning to D0 on DAT updates
- Fix included new power management test coverage

**3. eUSB2v1 Feature Enablement Failure**
- Severity: Feature activation blocker
- Impact: eUSB2v1 features non-functional on release branches
- Root cause: Feature dependency chain incomplete (missing Feature_Standalone_Future)
- Fix: Updated feature enablement tool

### Infrastructure/Tooling Improvements

**1. SuperMITT Test Hardware Enhancements**
- HIDI3C keyboard/mouse emulation
- FPGA firmware updates with bug fixes
- Enables partner validation and demo scenarios

**2. USB3 Power Management Test Suite**
- Automated XHCI sleep/wake stress testing
- SuperMUTT-based test infrastructure
- AppVerifier integration for enhanced validation

**3. WDF HLK Certification Support**
- WDF v35 function table validation
- Enables driver certification path for new WDF version
- Customer unblocking for WudfRd.sys submissions

### Technical Debt Addressed

**1. Security Compliance**
- Eliminated banned API usage (lstrlen → _tcsnlen)
- TVS static analysis warnings resolved
- Improved string handling safety with bounded operations

**2. Process Migrations**
- VBscript dependency migration (WDF build system)
- State machine framework enhancements (VisioPluginForSmfx)

---

## Pull Request Summary

### Metrics
- **Total PRs merged:** 19
- **PRs abandoned (drafts):** 3
- **PRs with extended review cycles (>3 months):** 2
  - PR #13311236 (TVS security fix): 12 weeks (July-October)
  - PR #12899153 (USB3 wake test): 22 weeks (May-October)
  - PR #13020442 (eUSB2v1 double isoch): 20 weeks (May-October)

### Repository Activity
- **Primary repository:** os.2020 (100% of PRs)

### Branch Targets
- **official/ge_current_directcplat_scon_dev:** 15 PRs (79%)
- **official/rs_cplat_scon_dev:** 2 PRs (11%)
- **official/rs_base1_bpt3:** 1 PR (5%)
- **official/rs_cplat_scon_bcob:** 1 PR (5%)

### Merge Strategies
- **Squash merge:** 18 PRs (95%)
- **NoFastForward merge:** 1 PR (5%)

### Top Contributors (by merged PRs)
1. **Wei Mao:** 4 PRs (eUSB2, UMDF DMA, WDF HLK)
2. **Matthew Williams:** 2 PRs (I3C power mgmt, WinI3C Reset API)
3. **Murphy Ryan:** 2 PRs (USB4 backports, security compliance, feature enablement)
4. **Samuel Gazala:** 2 PRs (USB4 bugfixes)
5. **Andrew Yang:** 1 PR (UCX version bump)
6. **Phan Trinh Ha:** 1 PR (USB3 wake test)
7. **Alex Scarpantoni:** 1 PR (I3C NVL support)
8. **Joe Spall:** 1 PR (SuperMITT HIDI3C)

### Code Review Observations
- All completed PRs received required reviewer approvals (Serviceability Champs + ft_buses team)
- 3 draft PRs abandoned during eUSB2v1 interface design iteration
- Average review cycle: 2-4 weeks (excluding long-tail validation PRs)
- Most PRs included comprehensive testing documentation

---

## Risks and Dependencies

### Technical Risks

**1. eUSB2v1 Feature Activation Complexity**
- **Status:** Mitigated (PR #14006614 merged)
- **Risk:** Feature dependency chain (Feature_Bundle_Future → Feature_Standalone_Future) caused activation failures on release branches
- **Impact:** eUSB2v1 velocity features non-functional until tool fix deployed
- **Mitigation:** BusesCdFeatureEnablementTool updated to enable complete dependency chain

**2. WDF v35 Certification Gating**
- **Status:** Active management
- **Risk:** Test intentionally fails for non-exempted v35 drivers until formal release
- **Impact:** Partners/vendors cannot certify v35 drivers yet
- **Mitigation:** Exception process in place for critical inbox drivers (WudfRd.sys)
- **Timeline:** Awaiting WDF v35 formal release approval

**3. Long Validation Cycles for Power Management Features**
- **Status:** Ongoing concern
- **Risk:** USB3 wake test and eUSB2v1 features required 20-22 week validation cycles
- **Impact:** Delays feature availability, increases risk of merge conflicts
- **Mitigation:** Need earlier integration testing and phased validation approach

### Cross-Team Dependencies

**1. I3C Ecosystem Validation**
- **Dependencies:** Hardware partners for HIDI3C device validation
- **Status:** Demo/validation tooling complete (SuperMITT updates)
- **Blocker:** None identified

**2. UMDF Driver Partner Coordination**
- **Dependencies:** 3rd party UMDF driver vendors must update INFs for ProcessSharingDisabled
- **Status:** Security requirement documented and communicated
- **Risk:** Legacy driver breakage if vendors don't update INFs
- **Mitigation:** Clear documentation, graceful failure with logging

**3. USB4/Thunderbolt Partner Testing**
- **Dependencies:** OEM validation of bugcheck 0x15F fixes across device portfolio
- **Status:** Fixes deployed to multiple branches for broad testing
- **Blocker:** None identified

### Blocking Issues

**1. VBscript Migration Completion**
- **Status:** Deliverable marked complete but implementation details unclear
- **Risk:** Potential build system issues if migration incomplete
- **Recommendation:** Verify build system stability across dev branches

**2. Sensors Component Work Items**
- **Status:** 2 work items completed without PR data
- **Risk:** Lack of visibility into actual changes and testing
- **Recommendation:** Improve work item documentation for non-code deliverables

**3. Arm64 Keyboard Bug Resolution Visibility**
- **Status:** Bug closed without documented fix
- **Risk:** Incomplete resolution may cause regression
- **Recommendation:** Verify resolution approach and test coverage

---

## Recommendations

### For Engineering Managers

1. **Accelerate Validation Cycles:** Investigate root causes of 20-22 week validation cycles for power management features. Consider parallel validation tracks and earlier integration testing.

2. **Improve Work Item Documentation:** Require PR associations or detailed closure notes for deliverables and bugs to maintain audit trail and knowledge transfer.

3. **Feature Dependency Tooling:** Invest in automated feature dependency validation to catch issues like Feature_Standalone_Future earlier in development cycle.

4. **Partner Readiness:** Proactively engage UMDF driver partners on ProcessSharingDisabled requirement to minimize ecosystem disruption.

5. **Test Infrastructure Investment:** USB3 wake test and SuperMITT enhancements demonstrate value of specialized test hardware. Continue investment in test tooling for emerging protocols (I3C, eUSB2v1).

### For Technical Leads

1. **Code Review Efficiency:** While quality is high, explore opportunities to reduce review cycles for well-tested changes without compromising quality gates.

2. **Security Compliance Pipeline:** TVS security fix took 12 weeks - evaluate opportunities for earlier security analysis in development cycle.

3. **Cross-Branch Synchronization:** USB4 bugcheck fix required 3 separate PRs across branches. Evaluate automated cherry-pick or unified branching strategy.

4. **I3C Ecosystem Development:** Strong momentum on I3C (5 work items, 4 PRs). Ensure cross-team visibility and coordination as ecosystem matures.

---

## Appendix: Iteration Metrics Dashboard

| Metric | Value |
|--------|-------|
| Total Work Items (Iteration) | 177 |
| Completed Work Items | 19 |
| Completion Rate | 11% |
| Work Items with PRs | 11 (58%) |
| Work Items without PRs | 8 (42%) |
| Total PRs Merged | 19 |
| PRs Abandoned | 3 |
| Average PR Cycle Time | 2-4 weeks (median) |
| Long-tail PRs (>3 months) | 2 |
| Primary Repository | os.2020 (100%) |
| Primary Branch | ge_current_directcplat_scon_dev (79%) |
| Top PR Author | Wei Mao (4 PRs) |

---

**Document Prepared By:** Iteration Release Manager  
**Data Source:** work-items-with-prs.json (Azure DevOps iteration 2510)  
**Report Date:** November 14, 2025
