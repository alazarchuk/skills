---
title: "$99 DIY Filament Making Machine - Make Your own Filament at Home"
source: "https://www.youtube.com/watch?v=3bPYWHblGPg"
author:
  - "Creative3DP"
published: 2023-03-18
created: 2026-04-10
description: "A comprehensive guide on building a budget-friendly DIY filament making machine for under $100."
tags:
  - "diy"
  - "3d-printing"
  - "filament"
  - "extruder"
---

# How to Build a DIY Filament Extruder for ~$100

This guide provides a breakdown of a cost-effective and compact filament extrusion system, capable of producing quality 3D printing filament for approximately $100.

## Overview
The project focuses on building one of the simplest and cheapest filament systems possible without sacrificing output quality. It uses standard components and a few 3D-printed parts to extrude raw pellets into 1.75mm or 2.85mm filament.

## Requirements

### Electrical Components
*   **Main Drive Motor:** 10 RPM DC Motor (8.3 Newton-meter torque) - ~$18
*   **Speed Controller:** 12V-24V PWM speed controller (for extrusion speed) - ~$4
*   **Temperature Controller:** REX-C100 PID controller with Relay and K-type thermocouple - ~$20
*   **Power Supply:** 12V 15A DC power supply - ~$10
*   **Puller Motor:** 60 RPM Geared DC Motor - ~$8
*   **Puller Speed Controller:** PWM speed controller - ~$4
*   **Cooling Fans:** Two 12V computer fans (high RPM, e.g., 6000 RPM) - ~$2
*   **Heater:** 100mm long, 16mm diameter cartridge/band heater (capable of 300°C) - ~$18

### Mechanical & Structural Parts
*   **Auger:** 420mm long auger bit - ~$6 (combined with barrel)
*   **Barrel:** 400mm long metal pipe (cut in middle for hopper/inlet)
*   **Nozzle:** 2mm diameter nozzle (standard size, can be swapped for 3mm/4mm)
*   **Coupling/Connector:** 19mm tubular box wrench (used as a heavy-duty coupler between motor and auger) - ~$1
*   **Frame:** Wooden board for mounting, 90-degree metal angles for barrel support.
*   **3D Printed Parts:** Puller assembly, gears, barrel end holder, and safety covers for electronics.

---

## Assembly Steps

### 1. Extruder Drive Assembly
Connect the **10 RPM DC Motor** to the **Auger** using the **19mm tubular box wrench**.
*   **Tip:** Standard couplings often fail under the high torque required for extrusion. A modified tubular wrench is significantly more durable and easier to secure with a nut.

### 2. Barrel and Heater Setup
Slide the **Auger** into the **400mm Barrel**. Mount the **Heater** onto the end of the barrel.
*   **Structural Note:** Use a welded metal 90-degree angle to hold the barrel near the heater. Do NOT use 3D-printed parts near the heater as they will melt.

### 3. Electronics Wiring
*   Connect the **Power Supply** to both speed controllers and the **REX-C100**.
*   Wire the **K-type thermocouple** and the **Heater** to the **REX-C100** to monitor and maintain temperature (set to ~170°C for initial testing).
*   Install **safety covers** over the relay and PID controller to prevent accidental electric shocks.

### 4. Cooling and Pulling System
*   Mount the **two 12V fans** immediately after the nozzle to rapidly cool the extruded plastic.
*   Assemble the **Puller** (using 3D-printed gears and the 60 RPM motor). This component is responsible for drawing the filament at a consistent rate to achieve the desired diameter.

### 5. Final Calibration
*   **Nozzle Size:** A 2mm nozzle is used to achieve 1.75mm filament by adjusting the puller speed.
*   **Tensioning:** Adjust the **Puller Speed** relative to the **Extrusion Speed**. Increasing puller speed decreases filament diameter; decreasing it increases diameter.

---

## Tips for Success
*   **Filler Removal:** Ensure your plastic pellets are clean. The creator recommends adding a filter to the nozzle if you notice dust or impurities in the final filament.
*   **Practice:** It takes about 30 minutes of practice to get a consistent 1.75mm diameter.
*   **Safety First:** Use a metal workshop or hardware store to get your barrel supports welded if you don't have a welding machine. The heat near the nozzle is too intense for plastic or wood.

## Conclusion
While the resulting filament may not reach industrial-grade tolerances immediately, it is capable of 90-95% the quality of commercial filament, making it a highly successful project for DIY 3D printing enthusiasts.
