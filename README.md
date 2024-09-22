![image](https://github.com/user-attachments/assets/6d910afc-10fe-429b-a663-cd538a7e0fbc)

# Goal

Goal of this repo is to share the project of 3D Chameleon adaptation to Snapmaker 2.0. The code posted here as of repo creation date - is a working code. But it is advanced and requires PrusaSlicer to be used.
I've made a few successful prints with 3D Chameleon on Snapmake2.0 and attempting to share this project wih community to keep the progress going. As I no longer have have enough free time to make this into a easy to use solution.

This is MK3 3Dchameleon version. I plan to upgrade to MK4 and will bring the repo up to speed unless community steps in and does it faster then me.

# Discussion
Please join the topic at the Snapmaker Forum - [3d Chameleon - up to 4 color/material printing with Single Extruder](https://forum.snapmaker.com/t/3d-chameleon-up-to-4-color-material-printing-with-single-extruder/37069)

# Project Structure

Project consists of several files

- [The Flowchart](./Flowchart.vsdx) - this is the main document that describes how G-Code works. I would first make changes in this document and then brush up the g-code to match the logic described in this document.
- [3D_Chameleon_PrusaSlicer_START.gcode](./3D_Chameleon_PrusaSlicer_Start.gcode) - Reponsible for homing and loading first 3D Chameleon tool T0.
 - [3D_Chameleon_PrusaSlicer_TOOL_CHANGE.gcode](./3D_Chameleon_PrusaSlicer_Tool_Change.gcode) - Responsible for changing the filament during print process.
 - [3D_Chameleon_PrusaSlicer_END.gcode](./3D_Chameleon_PrusaSlicer_End.gcode) - Responsible for final procedures after the print is finished.

# What do you need to start

- Snapmaker 2.0 with Single Extruder.
- Knowledge of G-Code - [Snapmaker G-Code Reference](https://wiki.snapmaker.com/en/Snapmaker_Luban/manual/2_supported_gcode_references)
- Patience
- [3D Chameleon](https://www.3dchameleon.com/)
- Strong desire to print multicolor/multimaterial
- Copy of PrusaSlicer working with Snapmaker 2.0 and familiarity with "Custom G-Code" tab.
- Files from this Printables page - [3D Chameleon Adoptation for Snapmaker 2.0 Single Extruder](https://www.printables.com/model/1015615-3d-chameleon-adoptation-for-snapmaker-20-single-ex) - you might need all or some of them. I designed these for my setup, in order to make things as compact as possible and minimize potential problems with components from 3D Chameleon.

# Mounting the 3D Chameleon

I am not going to explain in details how I did it, because every setup will be different. Check the discussion topic ^^ where I posted a few pictures of my setup.
Important to know that I minimized the friction of the filament inside the PTFE tubes as much as possible. Even replaced the PTFE tubes with extra slippery brand (blue color).

# Project notes

Tow most important things to consider when you applying this to your setup
- FRICTION - your filament path should be perfect with minimal friction. From spool to extruder.
- TIP SHAPING - when filament is being loaded - if it doesn't have a sharp point - it will catch and stuck in the filament path, inside extruder. Tip shaping sequence is in the G-Code and is for PETG filament. Adjust to your needs.

# The Logic

Described in this flow chart. Also attached here as [Visio file](Flowchart.vsdx)

![3DChameleon_Flowchart](Flowchart.png)

P.S. - I am leaving the repo readmi file, printables page and forum thread with minimal description. Will observe the interest and questions and expand the readme to add more details as needed.