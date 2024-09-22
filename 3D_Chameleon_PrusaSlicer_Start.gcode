;=========================
; START Start G-Code for PrusaSlicer 2.6.0
; >>>Filament runout switch turned off by G-Code
; 3DChameleon Mk3 Installed in Mode #2
; By nweolu
;=========================
; Variables list
{global var_skip_tool_change = 0}	; var_skip_tool_change - variable to determine if tool change is needed. 
                                    ; 0 = skip toolchange. 
                                    ; 1 = tool change requiered.
{global var_first_tool_changed = 0} ; var_first_tool_changed - variable to determine if first tool change G-code was executed. 
                                    ; 0 = G-Code wasn't executed. 
                                    ; 1 = G-Code wasn't executed at least 1 time.
{global previous_extruder = -1}	    ; Initiating built-in variable "previous_extruder" ahead of time to be able to perform the check. 
;=========================
M140 S[first_layer_bed_temperature]	; Start warming Bed
M104 S[first_layer_temperature]		; Start warming Nozzle
M82									; Absolute extrusion mode
G28									; Home all axis
G90									; Absolute positioning
;=========================
; START Home 3DChameleon and load T0
;=========================
G1 Z50 F1800						; Move down to keep PTFE extended most of the time
G0 X330 Y-10 F3000					; Go to trigger zone
G1 Z0 F1800							; Move down to "print start zone" for wipe
M109 S[first_layer_temperature]		; Wait for Hotend Temperature
G0 X335 F3000						; Engage the 3DChameleon trigger
G4 P2300							; 5th Pulse homing & Load T0
G0 X330 F3000						; Disnegage the trigger
G4 P1000							; Wait for 3DChameleon to replace the filament
G1 E60 F300							; Accept new filament by Snapmaker drive and load into the hot zone
M190 S[first_layer_bed_temperature]	; Wait For Bed Temperature
;=========================
; END Home 3DChameleon and load T0
;=========================
;Check if initial extruder is T0 and previous extruder is T-1 then it is already loaded and no tool change needed at first layer.
{if initial_extruder == 0}
	{if previous_extruder == -1}
		{var_skip_tool_change = 1}
		;"First filament matching just loaded filament, purging and wiping to start the print."
		G1 X330 Y-10 F3000					; Move to print start zone for wipe
		G92 E0								; Reset extruder
		G1 E20 F200							; Prime extrude for wipe
		G92 E0								; Reset extruder
	{endif}
{endif}
;=========================
; END Start G-Code for PrusaSlicer 2.6.0
;=========================