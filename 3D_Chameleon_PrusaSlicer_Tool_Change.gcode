;=========================
; START Tool change G-code for PrusaSlicer 2.6.0
; 3DChameleon Mk3 Installed in Mode #2 
; Mode #2
; By nweolu
;=========================
; "Switching from T{previous_extruder} to extruder T{next_extruder} with {filament_preset[next_extruder]}""
;=========================
M412 S0								;Turn OFF filament runout sensor for toolchange process
; Start safety check - if var_skip_tool_change = 1 then skip filament removal by Snapmaker drive (do nothing and just print)
;
{
if var_skip_tool_change == 1
}
;
; "Skipping tool change at the beginning if no tool change is neccesary, printing with {filament_preset[current_extruder]}"
;
{
else
}
;
; "Start tool change to extruder T{next_extruder} with {filament_preset[next_extruder]}"
;
;=========================
; START Lift and retract to keep the print safe
;=========================
G92 E0								; Reset extruder
G1 E-3 F200							; Retract a bit to keep stringing to minimum
G91									; Relative Positioning to lift up relative to the print
G0 Z25								; Lift up 2mm from the print
G90									; Absolute positioning
;=========================
; END Lift and retract to keep the print safe
;=========================
G0 X330 F2000						; Move away from the print to filament change zone
;=========================
; START Filament Tip Shaping change sequence
;=========================
G92 E0								; Reset extruder
G1 E13 F200							; Slowly push filament into hot zone
{if filament_type[current_extruder]=="PLA"}
	G1 E-5 F400						; quickly move filament up for PLA
	G1 E-55 F100					; Slowly move filament up for PLA
{else}
	G1 E-5 F2500					; Jerk out to break solid filament away from the melted mass
	G1 E-55 F200					; Slowly move filament up to give it time to cool down before going through gears
{endif}
G92 E0								; Reset extruder.

; Filament ready to be handled by 3DChameleon.
;=========================
; END Filament Tip Shaping change sequence
; "Unloading extruder T{current_extruder} with {filament_preset[next_extruder]}"
;=========================
; 3DChameleon Filament repalcement sequence 
;=========================
G0 X335 F3000						; Engage the trigger
{if next_extruder==0}
G4 P500								; Dwell for .5 seconds to select extruder T{next_extruder}
{endif}
{if next_extruder==1}
G4 P1000							; Dwell for 1 seconds to select extruder T{next_extruder}
{endif}
{if next_extruder==2}
G4 P1300							; Dwell for 1.3 seconds to select extruder T{next_extruder}
{endif}
{if next_extruder==3}
G4 P1800							; Dwell for 1.8 seconds to select extruder T{next_extruder}
{endif}
G0 X330 F3000						; Disenegage the trigger
G4 P8500							; Wait for 3DChameleon to replace the filament
G1 E70 F300							; Accept new filament by direct drive and load into the hot zone
G90									; Absolute positioning
;=========================
; START Reverse Lift 
;=========================
G91									; Relative Positioning to lift up relative to the print
G0 Z-25								; Lift up 2mm from the print
G90									; Absolute positioning
;=========================
; END Reverse Lift 
;=========================
{
endif
}
{global var_first_tool_changed = 1;}
{
if var_first_tool_changed == 1 then
	var_skip_tool_change = 0;
	; ";First toolchange G-code is executed, changing var_first_tool_changed = 1"
endif
}
M412 S1								;Turn ON filament runout sensor after toolchange process
;=========================
; END Tool change G-code for PrusaSlicer 2.6.0
;=========================