;[BEGIN Printer START G-Code]

; Reset Feed Rates
M220 S100
M221 S100

;Set home for all axes (X, Y and Z)
G28

; If you want to perform a bed leveling sequence run the G29 command
;G29

;Reset Extruder
G92 E0

;Move Z Axis up and set 
G1 Z2.0 F3000

;Move to start position and set acceleration to 5000 mm
G1 X-2.0 Y20 Z0.28 F5000.0

;Display message (If supported, the message will be seen on the 3D printer contoller screen)
M117 Heating Bed

;Set the bed temperature and hold until it is reached (60c)
M190 S60.0

;Display message (If supported, the message will be seen on the 3D printer contoller screen)
M117 Heating Nozzle

;Set the nozzle temperature and hold until reached (210c)
M109 S210.0

; Use the restriced [non-printable] area of the of the print bed to lay down a couple
; single layer lines.  The effect of which is to purge and properly presurize the nozzle.
; Which, if not done, will result in the printer not printing for a brief period when it
; moves to the print start position which can lead to discontinuity of the critical first
; layer being put down on the bed surface
G1 X-2.0 Y145.0 Z0.28 F1500.0 E15
G1 X-1.7 Y145.0 Z0.28 F5000.0 ;Move to side a little
G1 X-1.7 Y20 Z0.28 F1500.0 E30

; Reset the extruder
G92 E30

; Retract the extruder a small distance to prevent ozing
G1 E-1.0000 F1800

;Move Z axis up
G1 Z2.0 F3000
G1 E0.0000 F1800
;[END Printer START G-Code]






;[BEGIN Printer END G-Code]
; Start end of printing reset

; Set positioning to relative
G91

; Retract the extruder a bit to prevent ozing
G1 E2 F2700

; Retract some more and raise the Z axis
G1 E2 Z0.2 F2400

; Perform a wipe out
G1 X5 Y5 F3000

; Raise the Z axis more
G1 Z5

; Reset positioning to absolute
G90

; Move the print head out of the way so that the final product can be
; removed
G1 X75 Y218 F3000

; Turn off the fan
M106 S0

; Turn off the hotend heater
M104 S0

; Turn off the bed heater
M140 S0

; Disable all stepper motors with the exception of the Z axis
M84 X Y E