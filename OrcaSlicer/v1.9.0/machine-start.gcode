M220 S100 ;Reset Feedrate 
M221 S100 ;Reset Flowrate 
 
M140 S[bed_temperature_initial_layer_single] ;Set final bed temp  
G28 ;Home 
 
G92 E0 ;Reset Extruder 
G1 Z2.0 F3000 ;Move Z Axis up 
M104 S[nozzle_temperature_initial_layer] ;Set final nozzle temp  
G1 X-2.0 Y20 Z0.28 F5000.0 ;Move to start position 
M190 S[bed_temperature_initial_layer_single] ;Wait for bed temp to stabilize  
M109 S[nozzle_temperature_initial_layer] ;Wait for nozzle temp to stabilize  
G1 X-2.0 Y145.0 Z0.28 F1500.0 E15 ;Draw the first line 
G1 X-1.7 Y145.0 Z0.28 F5000.0 ;Move to side a little 
G1 X-1.7 Y20 Z0.28 F1500.0 E30 ;Draw the second line 
G92 E0 ;Reset Extruder 
G1 E-1.0000 F1800 ;Retract a bit 
G1 Z2.0 F3000 ;Move Z Axis up 
G1 E0.0000 F1800