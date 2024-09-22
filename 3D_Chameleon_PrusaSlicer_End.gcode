;=========================
; START PRINT END G-code for PrusaSlicer 2.6.0
; >>>Filament runout switch turned off by G-Code
; 3DChameleon MK3 Installed in Mode #2
; By nweolu
;=========================
M412 S0								;Turn OFF filament runout sensor for final filament unload
;=========================
; Filament Tip Shaping sequence and unload {filament_preset[current_extruder]}
;=========================
G90									; Absolute positioning
G0 X330 Y354 F2000					; Move away from the print to filament change zone
G92 E0								; Reset extruder
G1 E10 F200							; Slowly push filament into hot zone
G1 E-5 F2500						; Jurk out to break solid filament away from the melted mass
G1 E-55 F200						; Slowly move filament up to give it time to cool down before going through gears
G92 E0								; Reset extruder. Filament ready to be handled by 3DChameleon.
G0 X335 F2000						; Engage the trigger
G4 P500								; Unload {filament_preset[current_extruder]} and Load T0
G0 X330 F2000						; Disenegage the trigger
;
; Filament {filament_preset[current_extruder]} unloaded from the extruder. T0 Filament is loaded up to runout switch.
; Ready to cool down at home.
; Turn everything off.
;
M104 S0								; Extruder heater off
M140 S0								; Heated bed heater off
M107								; Print cooling fan off
G90									; Absolute positioning
G92 E0								; Reset extruder
G28									; Home
;=========================
;END PRINT END G-code for PrusaSlicer 2.6.0
;=========================