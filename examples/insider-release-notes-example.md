# What's New in Buses & Sensors - September 2025

## Overview

This month we've focused on making your Windows device more reliable and power-efficient. We've improved how your computer manages power for USB4 devices, fixed a crash affecting multi-monitor setups, and made touchpads and touchscreens more resilient.

---

## New Features

### 🔋 Better Battery Life with USB4 Power Management

Your USB4 devices (like external SSDs, docks, and monitors) now enter deeper power-saving states when not in use, helping your laptop battery last longer.

**What this means for you:**
- Longer battery life when using USB4 accessories
- Faster wake-up times when you need your devices again
- Seamless transitions that you won't even notice

**How to try it:**
- Connect any USB4 device to your laptop
- Leave it idle for a few minutes
- Your device will automatically enter power-saving mode

---

## Improvements

### 🖱️ Touchpad and Touchscreen Reliability

We've added automatic recovery for touchpads and touchscreens that occasionally become unresponsive. If your touch device stops responding, Windows will now automatically detect and fix the issue in the background.

**What improved:**
- Touchpads that freeze will now recover automatically
- No more need to restart your device when touch stops working
- Works for both built-in and external touch devices

---

## Bug Fixes

### 🖥️ Multi-Monitor Crash Fix

**What was broken:**  
Some users experienced system crashes when switching between monitors with different orientations (landscape vs. portrait), especially when using devices with rotation sensors like tablets or convertibles.

**What's fixed:**  
Windows now correctly handles orientation changes across multiple monitors without crashing.

**Who benefits:**  
- Users with multi-monitor setups
- Tablet and convertible PC users
- Anyone who uses portrait-oriented monitors

---

## Known Issues

None at this time! 🎉

---

## For Developers

### API Changes

**USB4 Power Management:**
- New power state notifications for USB4 router transitions
- ETW events available for monitoring D3cold entry/exit

**Sensor Fusion:**
- Improved thread safety in sensor data aggregation APIs
- Better error handling in multi-threaded scenarios

### Breaking Changes
None in this release.

### New Capabilities
- USB4 devices can now participate in advanced power management schemes
- I2C HID devices have automatic error recovery

---

## What's Next

We're continuing to invest in connectivity reliability and power efficiency. In upcoming releases, you can expect:

- Enhanced Bluetooth power management
- Improved USB device enumeration speed
- More sensor fusion improvements for mixed-reality scenarios

---

**Note:** These features are available to Windows Insiders in the Dev and Canary channels. They will roll out to stable releases in upcoming Windows updates.

## Thank You!

Thanks for being a Windows Insider! Your feedback helps us build a better Windows. If you experience any issues with these changes, please report them through the Feedback Hub under **Hardware, Devices and Drivers** > **USB** or **Sensors**.

---

**Feedback Hub Categories:**
- USB issues: Hardware, Devices and Drivers > USB
- Touch device issues: Hardware, Devices and Drivers > Touch
- Sensor issues: Hardware, Devices and Drivers > Sensors
