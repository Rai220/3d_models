; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 37m 2s; total estimated time: 43m 22s
; total layer number: 60
; total filament length [mm] : 8126.17
; total filament volume [cm^3] : 19545.73
; total filament weight [g] : 24.24
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 12.00
; filament: 1
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; additional_fan_full_speed_layer = 0
; alternate_extra_wall = 0
; ams_filament_load_time_ams = 0
; ams_filament_load_time_ams_lite = 0
; ams_filament_load_time_n3f_s = 0
; ams_filament_unload_time_ams = 0
; ams_filament_unload_time_ams_lite = 0
; ams_filament_unload_time_n3f_s = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_heat_soak_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 5
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = no_brim
; brim_width = 0
; chamber_temperatures = 0
; change_filament_gcode = ;=P1S 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == \"PETG\"}\nM109 S260\n{elsif filament_type[next_extruder] == \"PVA\"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 1
; close_fan_the_first_x_layers = 1
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; counterbore_hole_bridging = none
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_ams_type = -1
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = ;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = 
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 100
; fan_direction = left
; fan_max_speed = 100
; fan_min_speed = 100
; farthest_point_timelapse = 1
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_bridge_speed = 25
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #468D9A
; filament_cooling_before_tower = 0
; filament_cost = 20
; filament_density = 1.24
; filament_dev_ams_drying_ams_limitations = 1
; filament_dev_ams_drying_heat_distortion_temperature = 45
; filament_dev_ams_drying_temperature = 45
; filament_dev_ams_drying_time = 12
; filament_dev_chamber_drying_bed_temperature = 70
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 45
; filament_dev_drying_softening_temperature = 50
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFL99
; filament_is_mixed = 0
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12
; filament_metal_stickiness = None
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_notes = 
; filament_nozzle_map = 0
; filament_overhang_1_4_speed = 0
; filament_overhang_2_4_speed = 50
; filament_overhang_3_4_speed = 30
; filament_overhang_4_4_speed = 10
; filament_overhang_totally_speed = 10
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_preheat_temperature_delta = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_scarf_gap = 15%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PLA"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = Generic
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; hot_plate_temp = 55
; hot_plate_temp_initial_layer = 55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 60
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 30
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 180
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of \"timelapse_record_flag\"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,500
; machine_max_force_Y = 0
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,500
; machine_max_speed_y = 500,500
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S-0.4 ========================\n;===== date: 20251031 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]==\"PLA\"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]==\"PLA\"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type==\"Textured PEI Plate\"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 100
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = 0.20mm Lamp paper box @P1S
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = back
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 8
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 55
; textured_plate_temp_initial_layer = 55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 4
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 220
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R43
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S-0.4 ========================
;===== date: 20251031 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action:54
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F299.339 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P1 R42
G1 E50 F200
M400
M104 S220
G92 E0
M73 P11 R38
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P12 R37
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X77.7 Y57.7 I100.6 J140.6
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
M73 P13 R37
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F3016.64
G0 Y11 E0.700 F754.159
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F3016.64
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/60
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
; OBJECT_ID: 8
G1 X161.007 Y194.014 F30000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M204 S500
G1 X94.979 Y194.014 E2.45931
G3 X92.686 Y191.743 I.027 J-2.32 E.13292
G1 X92.686 Y159.657 E1.1951
G3 X94.957 Y157.386 I2.328 J.057 E.132
G1 X161.043 Y157.386 E2.46144
G3 X163.314 Y159.657 I-.049 J2.321 E.13211
G1 X163.314 Y191.721 E1.19428
G3 X161.067 Y194.013 I-2.32 J-.027 E.13202
M204 S6000
G1 X161.007 Y193.557 F30000
G1 F1800
M204 S500
G1 X94.986 Y193.557 E2.45903
G3 X93.143 Y191.728 I.019 J-1.863 E.10701
G1 X93.143 Y159.671 E1.19399
G3 X94.972 Y157.843 I1.868 J.039 E.1064
G1 X161.028 Y157.843 E2.46033
G3 X162.857 Y159.672 I-.034 J1.863 E.10648
G1 X162.857 Y191.714 E1.19345
G3 X161.067 Y193.556 I-1.863 J-.019 E.10555
M204 S6000
G1 X161.029 Y193.098 F30000
; FEATURE: Outer wall
G1 F1800
M204 S500
G1 X161.013 Y193.1 E.00061
G1 X94.993 Y193.1 E2.45898
G3 X93.6 Y191.713 I.012 J-1.405 E.08109
G1 X93.6 Y159.686 E1.19288
M73 P14 R37
G3 X94.987 Y158.3 I1.408 J.021 E.0808
G1 X161.013 Y158.3 E2.45922
G3 X162.4 Y159.687 I-.018 J1.405 E.08085
G1 X162.4 Y191.706 E1.19261
G3 X161.362 Y193.051 I-1.405 J-.012 E.06793
G1 X161.089 Y193.089 E.01028
; WIPE_START
G1 X161.013 Y193.1 E-.02902
G1 X159.09 Y193.1 E-.73098
; WIPE_END
G1 E-.04
M204 S6000
G1 X152.403 Y189.42 Z.6 F30000
G1 X93.831 Y157.189 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
M204 S500
G1 X93.695 Y157.001 E.00864
G1 X93.986 Y156.707 E.01542
G1 X93.387 Y155.271 E.05793
G1 X162.613 Y155.271 E2.57839
G1 X162.014 Y156.707 E.05794
G1 X162.308 Y157.005 E.01561
G1 X162.178 Y157.192 E.0085
G2 X161.058 Y156.929 I-1.136 J2.322 E.04322
G1 X94.942 Y156.929 E2.46255
G2 X93.886 Y157.164 I.063 J2.772 E.04058
; WIPE_START
G1 X93.695 Y157.001 E-.09531
G1 X93.986 Y156.707 E-.15728
G1 X93.472 Y155.474 E-.50741
; WIPE_END
G1 E-.04
M204 S6000
G1 X93.77 Y163.101 Z.6 F30000
G1 X95.014 Y194.986 Z.6
M73 P14 R36
G1 Z.2
G1 E.8 F1800
M204 S500
G3 X91.716 Y191.779 I.005 J-3.305 E.18951
G1 X91.714 Y159.714 E1.1943
G3 X92.583 Y157.476 I3.392 J.029 E.09138
G1 X93.447 Y156.602 E.0458
G1 X92.701 Y154.814 E.07214
G1 X163.299 Y154.814 E2.6295
G1 X162.553 Y156.602 E.07215
G1 X163.417 Y157.476 E.0458
M73 P15 R36
G3 X164.284 Y159.626 I-2.462 J2.242 E.08818
G1 X164.284 Y191.78 E1.19761
G3 X161.079 Y194.984 I-3.289 J-.084 E.18621
G1 X95.074 Y194.986 E2.45843
; WIPE_START
G1 X94.488 Y194.945 E-.22314
G1 X94.277 Y194.904 E-.08179
G1 X93.865 Y194.782 E-.16326
G1 X93.666 Y194.702 E-.08169
G1 X93.285 Y194.502 E-.16325
G1 X93.185 Y194.431 E-.04687
; WIPE_END
G1 E-.04
M204 S6000
G1 X91.245 Y187.049 Z.6 F30000
G1 X82.654 Y154.355 Z.6
G1 Z.2
G1 E.8 F1800
M204 S500
G1 X82.301 Y154.329 E.01319
G3 X79.643 Y151.314 I.414 J-3.044 E.16321
G1 X79.643 Y60.686 E3.37556
G3 X82.686 Y57.643 I3.072 J.029 E.17757
G1 X173.314 Y57.643 E3.37555
G3 X176.357 Y60.686 I-.029 J3.072 E.17758
G1 X176.357 Y151.314 E3.37555
G3 X173.314 Y154.357 I-3.072 J-.029 E.17758
G1 X82.714 Y154.357 E3.37449
M204 S6000
G1 X82.679 Y153.899 F30000
; FEATURE: Outer wall
G1 F1800
M204 S500
G1 X82.193 Y153.848 E.01821
G3 X80.1 Y151.307 I.52 J-2.561 E.13265
G1 X80.1 Y60.693 E3.37501
G3 X82.693 Y58.1 I2.613 J.02 E.1514
G1 X173.307 Y58.1 E3.375
G3 X175.9 Y60.693 I-.02 J2.613 E.15142
G1 X175.9 Y151.307 E3.375
G3 X173.307 Y153.9 I-2.613 J-.02 E.15141
G1 X82.739 Y153.9 E3.37329
; WIPE_START
G1 X82.193 Y153.848 E-.20854
G1 X81.705 Y153.702 E-.1935
G1 X81.255 Y153.462 E-.1938
G1 X80.921 Y153.188 E-.16416
; WIPE_END
G1 E-.04
M204 S6000
G1 X83.335 Y160.429 Z.6 F30000
G1 X95.009 Y195.443 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
M204 S500
G3 X91.259 Y191.792 I.012 J-3.764 E.21555
G1 X91.257 Y159.709 E1.19498
G3 X92.248 Y157.164 I3.861 J.038 E.10396
G1 X92.908 Y156.497 E.03497
G1 X92.468 Y155.443 E.04253
G1 X82.714 Y155.443 E.36331
G3 X78.557 Y151.286 I.009 J-4.165 E.24307
G1 X78.557 Y60.714 E3.37346
G3 X82.714 Y56.557 I4.166 J.009 E.24307
G1 X173.568 Y56.566 E3.38398
G3 X177.443 Y60.714 I-.275 J4.14 E.2328
G1 X177.443 Y151.286 E3.37346
G3 X173.286 Y155.443 I-4.166 J-.009 E.24307
G1 X163.532 Y155.443 E.36331
G1 X163.092 Y156.497 E.04253
G3 X163.874 Y157.303 I-6.33 J6.921 E.04187
G3 X164.741 Y159.611 I-3.052 J2.463 E.09339
G1 X164.741 Y191.793 E1.19867
G3 X161.092 Y195.441 I-3.746 J-.098 E.21196
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.069 Y195.443 E2.45911
M204 S6000
G1 X95.004 Y195.9 F30000
; FEATURE: Outer wall
G1 F1800
M204 S500
G3 X90.802 Y191.806 I.019 J-4.223 E.24158
G1 X90.8 Y159.704 E1.19566
M73 P16 R36
G3 X91.913 Y156.853 I4.33 J.048 E.11653
G1 X92.369 Y156.392 E.02414
G1 X92.164 Y155.9 E.01985
G1 X82.707 Y155.9 E.35225
G3 X78.1 Y151.293 I.018 J-4.624 E.26923
G1 X78.1 Y60.707 E3.37401
G3 X82.707 Y56.1 I4.624 J.018 E.26923
G1 X173.598 Y56.11 E3.38537
G3 X177.9 Y60.707 I-.305 J4.597 E.25816
G1 X177.9 Y151.293 E3.37401
G3 X173.293 Y155.9 I-4.624 J-.018 E.26923
G1 X163.836 Y155.9 E.35224
G1 X163.631 Y156.392 E.01985
G3 X164.812 Y157.937 I-3.516 J3.909 E.07286
G3 X165.198 Y159.596 I-4.283 J1.873 E.06378
G1 X165.198 Y191.806 E1.19972
G3 X161.106 Y195.898 I-4.204 J-.112 E.23771
G1 X95.064 Y195.9 E2.45979
; WIPE_START
G1 X94.619 Y195.882 E-.16924
G1 X94.345 Y195.848 E-.10483
G1 X94.076 Y195.796 E-.10442
G1 X93.549 Y195.641 E-.20873
G1 X93.294 Y195.537 E-.10441
G1 X93.135 Y195.454 E-.06836
; WIPE_END
G1 E-.04
M204 S6000
G1 X93.222 Y187.822 Z.6 F30000
G1 X93.572 Y157.221 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.556461
M204 S500
G2 X92.61 Y158.245 I2.518 J3.331 E.05908
G2 X92.2 Y159.719 I2.434 J1.471 E.06484
G1 X92.201 Y191.767 E1.34112
G2 X95.02 Y194.5 I2.8 J-.068 E.18203
G1 X161.067 Y194.499 E2.76391
M73 P17 R35
G2 X163.799 Y191.725 I-.069 J-2.799 E.18012
G1 X163.798 Y159.632 E1.34299
G2 X162.836 Y157.581 I-2.842 J.082 E.09753
G1 X162.433 Y157.225 E.02248
; WIPE_START
G1 X162.836 Y157.581 E-.20414
G1 X163.077 Y157.823 E-.12978
G1 X163.246 Y158.029 E-.10146
G1 X163.417 Y158.285 E-.11691
G1 X163.536 Y158.516 E-.0985
G1 X163.634 Y158.786 E-.10921
; WIPE_END
G1 E-.04
M204 S6000
G1 X161.42 Y155.454 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50276
G1 F3600
M204 S500
G1 X161.911 Y155.945 E.026
G1 X161.719 Y156.404 E.01863
G1 X160.975 Y155.66 E.03942
G1 X160.325 Y155.66 E.02437
G1 X161.215 Y156.55 E.04716
G2 X160.555 Y156.54 I-.402 J5.038 E.02474
G1 X159.675 Y155.66 E.04666
G1 X159.024 Y155.66 E.02437
G1 X159.905 Y156.54 E.04666
G1 X159.255 Y156.54 E.02437
G1 X158.374 Y155.66 E.04666
G1 X157.724 Y155.66 E.02437
G1 X158.604 Y156.54 E.04666
G1 X157.954 Y156.54 E.02437
G1 X157.073 Y155.66 E.04666
G1 X156.423 Y155.66 E.02437
G1 X157.304 Y156.54 E.04666
M73 P18 R35
G1 X156.653 Y156.54 E.02437
G1 X155.773 Y155.66 E.04666
G1 X155.123 Y155.66 E.02437
G1 X156.003 Y156.54 E.04666
G1 X155.353 Y156.54 E.02437
G1 X154.472 Y155.66 E.04666
G1 X153.822 Y155.66 E.02437
G1 X154.702 Y156.54 E.04666
G1 X154.052 Y156.54 E.02437
G1 X153.172 Y155.66 E.04666
G1 X152.521 Y155.66 E.02437
G1 X153.402 Y156.54 E.04666
G1 X152.752 Y156.54 E.02437
G1 X151.871 Y155.66 E.04666
G1 X151.221 Y155.66 E.02437
G1 X152.101 Y156.54 E.04666
G1 X151.451 Y156.54 E.02437
G1 X150.57 Y155.66 E.04666
G1 X149.92 Y155.66 E.02437
G1 X150.801 Y156.54 E.04666
G1 X150.15 Y156.54 E.02437
G1 X149.27 Y155.66 E.04666
G1 X148.619 Y155.66 E.02437
G1 X149.5 Y156.54 E.04666
G1 X148.85 Y156.54 E.02437
G1 X147.969 Y155.66 E.04666
G1 X147.319 Y155.66 E.02437
G1 X148.199 Y156.54 E.04666
G1 X147.549 Y156.54 E.02437
G1 X146.668 Y155.66 E.04666
G1 X146.018 Y155.66 E.02437
G1 X146.899 Y156.54 E.04666
G1 X146.248 Y156.54 E.02437
G1 X145.368 Y155.66 E.04666
G1 X144.718 Y155.66 E.02437
G1 X145.598 Y156.54 E.04666
G1 X144.948 Y156.54 E.02437
G1 X144.067 Y155.66 E.04666
G1 X143.417 Y155.66 E.02437
G1 X144.297 Y156.54 E.04666
G1 X143.647 Y156.54 E.02437
G1 X142.767 Y155.66 E.04666
G1 X142.116 Y155.66 E.02437
G1 X142.997 Y156.54 E.04666
G1 X142.347 Y156.54 E.02437
G1 X141.466 Y155.66 E.04666
G1 X140.816 Y155.66 E.02437
G1 X141.696 Y156.54 E.04666
G1 X141.046 Y156.54 E.02437
G1 X140.165 Y155.66 E.04666
G1 X139.515 Y155.66 E.02437
G1 X140.396 Y156.54 E.04666
G1 X139.745 Y156.54 E.02437
G1 X138.865 Y155.66 E.04666
G1 X138.214 Y155.66 E.02437
G1 X139.095 Y156.54 E.04666
G1 X138.445 Y156.54 E.02437
G1 X137.564 Y155.66 E.04666
G1 X136.914 Y155.66 E.02437
G1 X137.794 Y156.54 E.04666
G1 X137.144 Y156.54 E.02437
G1 X136.263 Y155.66 E.04666
G1 X135.613 Y155.66 E.02437
G1 X136.494 Y156.54 E.04666
G1 X135.843 Y156.54 E.02437
G1 X134.963 Y155.66 E.04666
G1 X134.313 Y155.66 E.02437
G1 X135.193 Y156.54 E.04666
G1 X134.543 Y156.54 E.02437
G1 X133.662 Y155.66 E.04666
G1 X133.012 Y155.66 E.02437
G1 X133.892 Y156.54 E.04666
G1 X133.242 Y156.54 E.02437
G1 X132.362 Y155.66 E.04666
G1 X131.711 Y155.66 E.02437
G1 X132.592 Y156.54 E.04666
G1 X131.942 Y156.54 E.02437
G1 X131.061 Y155.66 E.04666
G1 X130.411 Y155.66 E.02437
G1 X131.291 Y156.54 E.04666
G1 X130.641 Y156.54 E.02437
G1 X129.76 Y155.66 E.04666
G1 X129.11 Y155.66 E.02437
G1 X129.991 Y156.54 E.04666
G1 X129.34 Y156.54 E.02437
G1 X128.46 Y155.66 E.04666
G1 X127.809 Y155.66 E.02437
G1 X128.69 Y156.54 E.04666
G1 X128.04 Y156.54 E.02437
G1 X127.159 Y155.66 E.04666
G1 X126.509 Y155.66 E.02437
G1 X127.389 Y156.54 E.04666
G1 X126.739 Y156.54 E.02437
G1 X125.858 Y155.66 E.04666
G1 X125.208 Y155.66 E.02437
G1 X126.089 Y156.54 E.04666
G1 X125.438 Y156.54 E.02437
G1 X124.558 Y155.66 E.04666
G1 X123.908 Y155.66 E.02437
G1 X124.788 Y156.54 E.04666
G1 X124.138 Y156.54 E.02437
G1 X123.257 Y155.66 E.04666
G1 X122.607 Y155.66 E.02437
G1 X123.487 Y156.54 E.04666
G1 X122.837 Y156.54 E.02437
G1 X121.957 Y155.66 E.04666
G1 X121.306 Y155.66 E.02437
G1 X122.187 Y156.54 E.04666
G1 X121.537 Y156.54 E.02437
G1 X120.656 Y155.66 E.04666
G1 X120.006 Y155.66 E.02437
G1 X120.886 Y156.54 E.04666
G1 X120.236 Y156.54 E.02437
G1 X119.355 Y155.66 E.04666
G1 X118.705 Y155.66 E.02437
G1 X119.586 Y156.54 E.04666
G1 X118.935 Y156.54 E.02437
G1 X118.055 Y155.66 E.04666
G1 X117.404 Y155.66 E.02437
G1 X118.285 Y156.54 E.04666
G1 X117.635 Y156.54 E.02437
G1 X116.754 Y155.66 E.04666
G1 X116.104 Y155.66 E.02437
G1 X116.984 Y156.54 E.04666
G1 X116.334 Y156.54 E.02437
G1 X115.453 Y155.66 E.04666
G1 X114.803 Y155.66 E.02437
G1 X115.684 Y156.54 E.04666
G1 X115.033 Y156.54 E.02437
G1 X114.153 Y155.66 E.04666
G1 X113.503 Y155.66 E.02437
G1 X114.383 Y156.54 E.04666
G1 X113.733 Y156.54 E.02437
G1 X112.852 Y155.66 E.04666
G1 X112.202 Y155.66 E.02437
G1 X113.082 Y156.54 E.04666
G1 X112.432 Y156.54 E.02437
G1 X111.552 Y155.66 E.04666
G1 X110.901 Y155.66 E.02437
G1 X111.782 Y156.54 E.04666
G1 X111.132 Y156.54 E.02437
G1 X110.251 Y155.66 E.04666
G1 X109.601 Y155.66 E.02437
G1 X110.481 Y156.54 E.04666
G1 X109.831 Y156.54 E.02437
G1 X108.95 Y155.66 E.04666
G1 X108.3 Y155.66 E.02437
G1 X109.181 Y156.54 E.04666
G1 X108.53 Y156.54 E.02437
G1 X107.65 Y155.66 E.04666
G1 X106.999 Y155.66 E.02437
G1 X107.88 Y156.54 E.04666
G1 X107.23 Y156.54 E.02437
G1 X106.349 Y155.66 E.04666
G1 X105.699 Y155.66 E.02437
G1 X106.579 Y156.54 E.04666
G1 X105.929 Y156.54 E.02437
G1 X105.048 Y155.66 E.04666
G1 X104.398 Y155.66 E.02437
G1 X105.279 Y156.54 E.04666
G1 X104.628 Y156.54 E.02437
G1 X103.748 Y155.66 E.04666
G1 X103.098 Y155.66 E.02437
G1 X103.978 Y156.54 E.04666
G1 X103.328 Y156.54 E.02437
G1 X102.447 Y155.66 E.04666
G1 X101.797 Y155.66 E.02437
G1 X102.677 Y156.54 E.04666
G1 X102.027 Y156.54 E.02437
G1 X101.147 Y155.66 E.04666
G1 X100.496 Y155.66 E.02437
G1 X101.377 Y156.54 E.04666
G1 X100.727 Y156.54 E.02437
G1 X99.846 Y155.66 E.04666
G1 X99.196 Y155.66 E.02437
G1 X100.076 Y156.54 E.04666
G1 X99.426 Y156.54 E.02437
G1 X98.545 Y155.66 E.04666
G1 X97.895 Y155.66 E.02437
G1 X98.776 Y156.54 E.04666
G1 X98.125 Y156.54 E.02437
G1 X97.245 Y155.66 E.04666
G1 X96.594 Y155.66 E.02437
G1 X97.475 Y156.54 E.04666
G1 X96.825 Y156.54 E.02437
G1 X95.944 Y155.66 E.04666
G1 X95.294 Y155.66 E.02437
G1 X96.174 Y156.54 E.04666
G1 X95.524 Y156.54 E.02437
G1 X94.643 Y155.66 E.04666
G1 X93.993 Y155.66 E.02437
G1 X95.079 Y156.746 E.05756
; WIPE_START
G1 X93.993 Y155.66 E-.58374
G1 X94.457 Y155.66 E-.17626
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X92.489 Y154.9 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.671611
M204 S500
G1 X82.723 Y154.9 E.50033
G1 X82.23 Y154.869 E.02528
G1 X81.778 Y154.78 E.0236
G1 X81.322 Y154.626 E.02467
G1 X80.891 Y154.412 E.02464
G1 X80.517 Y154.162 E.02305
G1 X80.334 Y154.013 E.01207
G1 X79.993 Y153.673 E.02467
G1 X79.701 Y153.291 E.02463
G1 X79.476 Y152.901 E.02308
G1 X79.378 Y152.687 E.01207
G1 X79.223 Y152.231 E.02466
G1 X79.13 Y151.759 E.02464
G1 X79.1 Y151.277 E.02476
G1 X79.107 Y60.475 E4.65185
G1 X79.172 Y59.987 E.02518
G1 X79.288 Y59.553 E.02306
G1 X79.378 Y59.313 E.01311
G1 X79.577 Y58.909 E.02308
G1 X79.707 Y58.7 E.0126
G1 X79.85 Y58.501 E.01259
G1 X80.147 Y58.162 E.02308
G1 X80.517 Y57.838 E.02517
G1 X80.891 Y57.588 E.02306
G1 X81.108 Y57.471 E.0126
G1 X81.332 Y57.37 E.0126
G1 X81.758 Y57.226 E.02306
G1 X82.241 Y57.13 E.02519
G1 X82.723 Y57.1 E.02475
G1 X173.277 Y57.1 E4.63913
G1 X173.546 Y57.109 E.01377
G1 X174.002 Y57.169 E.02359
G1 X174.447 Y57.288 E.0236
G1 X174.687 Y57.378 E.01312
G1 X175.1 Y57.582 E.0236
G1 X175.483 Y57.838 E.0236
G1 X175.838 Y58.147 E.02413
G1 X176.013 Y58.334 E.01312
G1 X176.287 Y58.692 E.02307
G1 X176.418 Y58.9 E.0126
G1 X176.533 Y59.117 E.01258
G1 X176.705 Y59.533 E.02307
G1 X176.78 Y59.778 E.01312
G1 X176.868 Y60.22 E.02308
G1 X176.9 Y60.723 E.02582
G1 X176.9 Y151.277 E4.63912
G1 X176.869 Y151.77 E.02529
G1 X176.774 Y152.241 E.02465
G1 X176.705 Y152.467 E.01206
G1 X176.533 Y152.883 E.02307
G1 X176.293 Y153.3 E.02466
G1 X176.006 Y153.674 E.02413
G1 X175.666 Y154.013 E.02464
G1 X175.308 Y154.287 E.02307
G1 X175.109 Y154.412 E.01206
G1 X174.678 Y154.626 E.02465
G1 X174.222 Y154.78 E.02466
G1 X173.77 Y154.869 E.02361
G1 X173.277 Y154.9 E.02527
G1 X163.511 Y154.9 E.50033
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1800
G1 X165.511 Y154.9 E-.76
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 2/60
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
; OBJECT_ID: 8
M204 S10000
G17
G3 Z.6 I-1.209 J-.139 P1  F30000
G1 X161.007 Y194.116 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.678 E1.06378
G3 X94.954 Y157.284 I2.443 J.048 E.12329
G1 X161.046 Y157.284 E2.1924
G3 X163.416 Y159.654 I-.052 J2.423 E.12277
G1 X163.416 Y191.746 E1.06457
G3 X161.067 Y194.116 I-2.419 J-.049 E.12213
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
M73 P19 R35
G1 X92.991 Y159.684 E1.06312
G3 X94.967 Y157.691 I2.031 J.037 E.10278
G1 X161.033 Y157.691 E2.19152
G3 X163.009 Y159.667 I-.039 J2.015 E.10244
G1 X163.009 Y191.733 E1.06369
G3 X161.067 Y193.708 I-2.011 J-.035 E.10136
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.72 I.025 J-1.608 E.0821
G1 X93.398 Y159.691 E1.06246
G3 X94.98 Y158.098 I1.62 J.027 E.08228
G1 X161.019 Y158.098 E2.19064
G3 X162.602 Y159.68 I-.025 J1.608 E.08211
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.604 J-.021 E.08058
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.697 E.98358
G3 X94.993 Y158.49 I1.224 J.017 E.05792
G1 X161.006 Y158.49 E2.02841
G3 X162.21 Y159.693 I-.012 J1.215 E.05792
G1 X162.21 Y191.707 E.98369
G3 X161.067 Y192.908 I-1.211 J-.008 E.05612
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z.8 F30000
G1 X95.016 Y194.884 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.16362
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.027 E.07906
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17223
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.629 I-2.386 J2.172 E.0761
G1 X164.182 Y191.777 E1.0664
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18934
; WIPE_START
G1 X94.504 Y194.844 E-.21791
G1 X94.299 Y194.805 E-.07908
G1 X93.9 Y194.687 E-.15817
G1 X93.519 Y194.517 E-.15833
G1 X93.338 Y194.414 E-.07911
G1 X93.194 Y194.312 E-.06741
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z.8 F30000
G1 X82.644 Y154.507 Z.8
G1 Z.4
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01206
G3 X79.491 Y151.317 I.434 J-3.196 E.15251
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16587
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
M73 P19 R34
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.704 Y154.509 E3.00579
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01686
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.817 J.025 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.719 Y154.102 E3.00507
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.697 E2.7841
G3 X82.696 Y58.29 I2.423 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20088
G1 X81.778 Y153.527 E-.17958
G1 X81.361 Y153.304 E-.17955
G1 X80.996 Y153.004 E-.17944
G1 X80.962 Y152.963 E-.02055
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z.8 F30000
G1 X95.011 Y195.291 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18426
G1 X91.409 Y159.711 E1.06406
G3 X92.362 Y157.265 I3.705 J.035 E.08898
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.554 Y56.718 E3.01323
G3 X177.291 Y60.717 I-.259 J3.988 E.19998
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.616 I-2.687 J2.451 E.08578
G1 X164.589 Y191.789 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.094 E.18115
G1 X95.071 Y195.291 E2.18989
G1 X95.007 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.2049
G1 X91.002 Y159.706 E1.0646
G3 X92.063 Y156.989 I4.123 J.044 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.58 Y56.312 E3.01433
G3 X177.698 Y60.71 I-.286 J4.395 E.2201
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.729 E.09547
G1 X164.996 Y191.8 E1.06807
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.067 Y195.698 E2.19044
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.602 Y196.07 E.0123
G3 X90.612 Y191.811 I.423 J-4.394 E.1959
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78367
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.605 Y55.92 E2.79316
G3 X178.09 Y60.703 I-.312 J4.786 E.22183
G1 X178.09 Y151.297 E2.78367
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.278 J6.836 E.03423
G3 X165.388 Y159.59 I-3.578 J2.886 E.09012
G1 X165.388 Y191.812 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.602 Y196.07 E-.17491
G1 X94.316 Y196.036 E-.10944
G1 X94.034 Y195.982 E-.10906
G1 X93.483 Y195.819 E-.21825
G1 X93.126 Y195.66 E-.14834
; WIPE_END
G1 E-.04 F1800
G1 X93.049 Y188.028 Z.8 F30000
G1 X92.744 Y158.043 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402157
G1 F10021.26
G1 X92.652 Y158.177 E.00475
M73 P20 R34
G2 X92.2 Y159.719 I2.367 J1.531 E.04771
G1 X92.201 Y191.765 E.93808
G2 X95.02 Y194.5 I2.8 J-.066 E.12742
G1 X161.065 Y194.499 E1.93335
G2 X163.799 Y191.753 I-.068 J-2.801 E.12525
G1 X163.799 Y159.635 E.94019
G2 X162.84 Y157.584 I-2.843 J.079 E.06817
; LINE_WIDTH: 0.428515
G1 F9336.218
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.477422
G1 F8285.351
G2 X162.251 Y157.1 I-4.079 J4.921 E.01482
; WIPE_START
G1 X162.582 Y157.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.417473
G1 F9611.476
G1 X173.277 Y154.9 E.37433
G1 X173.541 Y154.892 E.00807
G1 X174.002 Y154.831 E.01419
G1 X174.238 Y154.776 E.00738
G1 X174.672 Y154.628 E.014
G1 X175.1 Y154.418 E.01456
G1 X175.496 Y154.152 E.01456
G1 X175.678 Y154.002 E.00719
G1 X176.002 Y153.678 E.014
G1 X176.293 Y153.3 E.01457
G1 X176.531 Y152.887 E.01456
G1 X176.628 Y152.671 E.00721
G1 X176.774 Y152.242 E.01384
G1 X176.869 Y151.77 E.01469
G1 X176.9 Y151.277 E.01507
G1 X176.899 Y60.673 E2.76533
G1 X176.87 Y60.236 E.01337
G1 X176.831 Y59.998 E.00739
G1 X176.775 Y59.762 E.00738
G1 X176.628 Y59.328 E.014
G1 X176.415 Y58.895 E.01473
G1 X176.16 Y58.513 E.014
G1 X176.007 Y58.326 E.00738
G1 X175.841 Y58.15 E.00738
G1 X175.496 Y57.848 E.01399
G1 X175.094 Y57.579 E.01478
G1 X174.683 Y57.377 E.01396
G1 X174.457 Y57.291 E.00738
G1 X174.009 Y57.171 E.01415
G1 X173.771 Y57.131 E.00738
G1 X173.277 Y57.1 E.0151
G1 X82.723 Y57.1 E2.76383
G1 X82.459 Y57.108 E.00807
G1 X81.993 Y57.17 E.01435
G1 X81.543 Y57.291 E.01421
G1 X81.108 Y57.471 E.01437
G1 X80.7 Y57.707 E.01437
G1 X80.335 Y57.986 E.01404
G1 X80.151 Y58.158 E.00768
G1 X79.844 Y58.509 E.01421
G1 X79.703 Y58.705 E.00738
G1 X79.474 Y59.102 E.01399
G1 X79.291 Y59.543 E.01455
G1 X79.221 Y59.774 E.00739
G1 X79.132 Y60.224 E.014
G1 X79.1 Y60.723 E.01526
G1 X79.1 Y151.277 E2.76382
G1 X79.131 Y151.77 E.01507
G1 X79.224 Y152.238 E.01456
G1 X79.372 Y152.672 E.01401
G1 X79.469 Y152.887 E.00719
G1 X79.706 Y153.299 E.01452
G1 X79.998 Y153.678 E.0146
G1 X80.159 Y153.85 E.0072
G1 X80.504 Y154.152 E.01399
G1 X80.9 Y154.418 E.01456
G1 X81.328 Y154.628 E.01456
G1 X81.762 Y154.776 E.014
G1 X81.998 Y154.831 E.00738
G1 X82.459 Y154.892 E.01419
G1 X82.723 Y154.9 E.00807
G1 X94.988 Y154.9 E.37433
; WIPE_START
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.752 Y156.1 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49517
G1 F7960.199
G1 X160.188 Y156.1 E2.37463
G1 X160.421 Y155.685 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X95.579 Y155.685 E1.99236
G1 X94.74 Y156.533 E.03664
G1 X95.752 Y156.515 E.03109
G1 X161.057 Y156.515 E2.00659
G1 X161.26 Y156.534 E.00626
G1 X160.463 Y155.728 E.03482
G1 X160.578 Y155.308 F30000
G1 F9547.299
G1 X95.422 Y155.308 E2.00203
G1 X94.016 Y156.73 E.06142
G1 X94.31 Y156.849 E.00974
G1 X94.355 Y156.972 E.00404
G1 X94.923 Y156.893 E.01761
G1 X95.752 Y156.892 E.02549
G1 X161.057 Y156.892 E2.00659
G1 X161.585 Y156.952 E.01631
G1 X161.819 Y157.019 E.00748
G1 X162.017 Y156.762 E.00995
G1 X160.62 Y155.351 E.061
; WIPE_START
G1 X162.017 Y156.762 E-.7544
G1 X162.008 Y156.774 E-.0056
; WIPE_END
G1 E-.04 F1800
G1 X154.375 Y156.836 Z.8 F30000
G1 X93.878 Y157.324 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.404122
G1 F9966.743
G1 X93.613 Y157.256 E.00807
; LINE_WIDTH: 0.439722
G1 F9072.536
G1 X93.587 Y157.25 E.00086
; LINE_WIDTH: 0.472426
G1 F8381.733
G1 X93.561 Y157.244 E.00093
G1 X93.398 Y157.374 E.0073
; LINE_WIDTH: 0.410377
G1 F9797.076
G2 X92.744 Y158.043 I2.38 J2.983 E.02809
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9797.076
G1 X92.994 Y157.748 E-.31365
G1 X93.398 Y157.374 E-.44635
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/60
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z.8 I-.581 J1.069 P1  F30000
G1 X161.007 Y194.116 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19112
G3 X92.584 Y191.746 I.053 J-2.423 E.12275
G1 X92.584 Y159.677 E1.06379
G3 X94.954 Y157.284 I2.442 J.048 E.12329
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.723 E1.0638
G3 X161.067 Y194.116 I-2.423 J-.029 E.12284
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19068
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.684 E1.06313
G3 X94.967 Y157.691 I2.031 J.037 E.10278
G1 X161.033 Y157.691 E2.19153
G3 X163.009 Y159.667 I-.039 J2.015 E.10242
G1 X163.009 Y191.717 E1.06315
G3 X161.067 Y193.708 I-2.015 J-.022 E.10184
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.69 E1.06247
G3 X94.98 Y158.098 I1.62 J.027 E.08227
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.71 E1.06248
G3 X161.067 Y193.301 I-1.608 J-.015 E.08086
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.012 J-1.215 E.0579
G1 X93.79 Y159.697 E.98359
G3 X94.993 Y158.49 I1.224 J.017 E.05791
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.704 E.98359
G3 X161.067 Y192.908 I-1.215 J-.009 E.05617
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z1 F30000
G1 X95.016 Y194.884 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.009 J-3.189 E.16379
G1 X91.816 Y159.715 E1.06351
G3 X92.657 Y157.545 I3.289 J.027 E.07891
G1 X95.258 Y154.916 E.12267
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.629 I-2.387 J2.172 E.0761
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18935
; WIPE_START
G1 X94.504 Y194.844 E-.21792
G1 X94.3 Y194.805 E-.07899
G1 X93.9 Y194.687 E-.1583
G1 X93.52 Y194.517 E-.15821
G1 X93.338 Y194.415 E-.07916
G1 X93.194 Y194.312 E-.06742
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z1 F30000
G1 X82.644 Y154.507 Z1
G1 Z.6
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.48 E.01206
G3 X79.491 Y151.317 I.435 J-3.196 E.1525
G1 X79.491 Y60.682 E3.00652
G3 X82.683 Y57.491 I3.226 J.034 E.16584
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.704 Y154.509 E3.0058
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01686
G3 X79.898 Y151.31 I.561 J-2.761 E.12722
G1 X79.898 Y60.689 E3.00605
G3 X82.69 Y57.898 I2.817 J.025 E.14512
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.719 Y154.102 E3.00507
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.017 J-2.423 E.11593
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.423 J.017 E.11593
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20096
G1 X81.778 Y153.527 E-.17952
G1 X81.361 Y153.304 E-.17959
G1 X80.996 Y153.004 E-.1795
G1 X80.962 Y152.963 E-.02043
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z1 F30000
G1 X95.011 Y195.291 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.597 E.18445
G1 X91.409 Y159.711 E1.06406
G3 X92.359 Y157.268 I3.707 J.036 E.08888
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.716 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.549 Y56.718 E3.01307
G3 X177.291 Y60.717 I-.254 J3.988 E.20014
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.616 I-2.687 J2.451 E.08578
G1 X164.589 Y191.788 E1.06722
G3 X161.088 Y195.289 I-3.594 J-.094 E.18115
G1 X95.071 Y195.291 E2.1899
G1 X95.007 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20512
G1 X91.002 Y159.706 E1.0646
G3 X92.062 Y156.99 I4.124 J.044 E.09885
M73 P21 R34
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.575 Y56.311 E3.01416
G3 X177.698 Y60.71 I-.281 J4.395 E.22026
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.729 E.09547
G1 X164.996 Y191.8 E1.06806
G3 X161.1 Y195.696 I-4.002 J-.106 E.20158
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.067 Y195.698 E2.19044
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.602 Y196.071 E.01231
G3 X90.612 Y191.811 I.405 J-4.378 E.19611
G1 X90.61 Y159.702 E.98663
G3 X91.774 Y156.723 I4.526 J.052 E.10046
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78367
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.6 Y55.92 E2.79299
G3 X178.09 Y60.703 I-.306 J4.787 E.22199
G1 X178.09 Y151.297 E2.78367
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.288 J6.846 E.03423
G3 X165.388 Y159.589 I-3.579 J2.887 E.09012
G1 X165.388 Y191.811 E.99009
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.602 Y196.071 E-.17496
G1 X94.316 Y196.036 E-.10943
G1 X94.034 Y195.982 E-.10909
G1 X93.483 Y195.819 E-.21822
G1 X93.217 Y195.711 E-.10925
G1 X93.126 Y195.663 E-.03905
; WIPE_END
G1 E-.04 F1800
G1 X93.048 Y188.031 Z1 F30000
G1 X92.741 Y158.048 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402161
G1 F10021.148
G1 X92.653 Y158.175 E.00452
G2 X92.2 Y159.719 I2.365 J1.532 E.04778
G1 X92.201 Y191.765 E.93808
G2 X95.02 Y194.5 I2.8 J-.066 E.12742
G1 X161.065 Y194.499 E1.93337
G2 X163.799 Y191.727 I-.066 J-2.8 E.12603
G1 X163.799 Y159.635 E.93943
G2 X162.84 Y157.584 I-2.818 J.068 E.06821
; LINE_WIDTH: 0.428532
G1 F9335.808
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.477427
G1 F8285.267
G2 X162.251 Y157.1 I-4.122 J4.977 E.01482
; WIPE_START
G1 X162.582 Y157.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z1 F30000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.417472
G1 F9611.485
G1 X173.277 Y154.9 E.37433
G1 X173.542 Y154.892 E.00808
G1 X174.002 Y154.831 E.01419
G1 X174.237 Y154.776 E.00737
G1 X174.672 Y154.628 E.01399
G1 X175.1 Y154.418 E.01457
G1 X175.496 Y154.152 E.01456
G1 X175.841 Y153.85 E.01399
G1 X176.002 Y153.678 E.0072
G1 X176.296 Y153.296 E.01469
G1 X176.42 Y153.095 E.00723
G1 X176.623 Y152.685 E.01395
G1 X176.777 Y152.232 E.01462
G1 X176.869 Y151.77 E.01438
G1 X176.9 Y151.277 E.01507
M73 P21 R33
G1 X176.899 Y60.673 E2.76533
G1 X176.87 Y60.236 E.01338
G1 X176.831 Y59.998 E.00738
G1 X176.776 Y59.762 E.00737
G1 X176.628 Y59.328 E.014
G1 X176.415 Y58.895 E.01474
G1 X176.16 Y58.513 E.01401
G1 X176.007 Y58.326 E.00737
G1 X175.841 Y58.15 E.00738
G1 X175.502 Y57.853 E.01377
G1 X175.09 Y57.577 E.01515
G1 X174.683 Y57.377 E.01382
G1 X174.446 Y57.288 E.00774
G1 X174.009 Y57.171 E.01381
G1 X173.772 Y57.131 E.00733
G1 X173.277 Y57.1 E.01513
G1 X82.723 Y57.1 E2.76381
G1 X82.459 Y57.108 E.00807
G1 X81.993 Y57.17 E.01433
G1 X81.543 Y57.291 E.01423
G1 X81.108 Y57.471 E.01437
G1 X80.7 Y57.707 E.01438
G1 X80.337 Y57.985 E.01396
G1 X80.151 Y58.158 E.00773
G1 X79.844 Y58.508 E.01424
G1 X79.703 Y58.705 E.00738
G1 X79.478 Y59.095 E.01375
G1 X79.291 Y59.543 E.0148
G1 X79.221 Y59.774 E.00736
G1 X79.132 Y60.224 E.01401
G1 X79.1 Y60.723 E.01526
G1 X79.1 Y151.277 E2.76382
G1 X79.131 Y151.77 E.01507
G1 X79.224 Y152.237 E.01455
G1 X79.372 Y152.672 E.014
G1 X79.471 Y152.892 E.00737
G1 X79.71 Y153.305 E.01457
G1 X79.851 Y153.501 E.00736
G1 X80.149 Y153.84 E.01377
G1 X80.509 Y154.156 E.01462
G1 X80.704 Y154.296 E.00732
G1 X81.103 Y154.526 E.01405
G1 X81.543 Y154.709 E.01455
G1 X82.009 Y154.833 E.01473
G1 X82.459 Y154.892 E.01383
G1 X82.723 Y154.9 E.00807
G1 X94.988 Y154.9 E.37433
; WIPE_START
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.752 Y156.1 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49517
G1 F7960.199
G1 X160.188 Y156.1 E2.37463
G1 X160.421 Y155.685 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X95.579 Y155.685 E1.99236
G1 X94.74 Y156.533 E.03664
G1 X95.752 Y156.515 E.03109
G1 X161.058 Y156.515 E2.00661
G1 X161.26 Y156.534 E.00624
G1 X160.463 Y155.728 E.03482
G1 X160.578 Y155.308 F30000
G1 F9547.299
G1 X95.422 Y155.308 E2.00203
G1 X94.016 Y156.73 E.06142
G1 X94.31 Y156.849 E.00975
G1 X94.355 Y156.972 E.00404
G1 X94.923 Y156.893 E.01761
G1 X95.752 Y156.892 E.02548
G1 X161.058 Y156.892 E2.00661
G1 X161.584 Y156.951 E.01629
G1 X161.819 Y157.019 E.00749
G1 X162.017 Y156.762 E.00995
G1 X160.62 Y155.351 E.061
; WIPE_START
G1 X162.017 Y156.762 E-.75442
G1 X162.008 Y156.774 E-.00558
; WIPE_END
G1 E-.04 F1800
G1 X154.375 Y156.836 Z1 F30000
G1 X93.878 Y157.324 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.404336
G1 F9960.84
G1 X93.612 Y157.256 E.00809
; LINE_WIDTH: 0.439922
G1 F9067.982
G1 X93.587 Y157.25 E.00086
; LINE_WIDTH: 0.472448
G1 F8381.305
G1 X93.561 Y157.244 E.00093
G1 X93.398 Y157.374 E.00729
; LINE_WIDTH: 0.410351
G1 F9797.773
G2 X92.741 Y158.048 I2.358 J2.959 E.02827
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9797.773
G1 X92.994 Y157.747 E-.31685
G1 X93.398 Y157.374 E-.44315
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/60
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z1 I-.581 J1.069 P1  F30000
G1 X161.007 Y194.116 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.678 E1.06378
G3 X94.954 Y157.284 I2.413 J.019 E.1237
G1 X161.046 Y157.284 E2.19238
G3 X163.416 Y159.654 I-.052 J2.423 E.12277
G1 X163.416 Y191.726 E1.06389
G3 X161.067 Y194.116 I-2.423 J-.032 E.12276
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.684 E1.06313
G3 X94.967 Y157.691 I2.032 J.039 E.10279
G1 X161.033 Y157.691 E2.1915
G3 X163.009 Y159.667 I-.039 J2.015 E.10244
G1 X163.009 Y191.718 E1.0632
G3 X161.067 Y193.708 I-2.015 J-.024 E.10179
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.72 I.025 J-1.608 E.0821
G1 X93.398 Y159.691 E1.06247
G3 X94.981 Y158.098 I1.621 J.028 E.08227
G1 X161.019 Y158.098 E2.19063
G3 X162.602 Y159.68 I-.025 J1.608 E.08211
G1 X162.602 Y191.711 E1.06252
G3 X161.067 Y193.301 I-1.608 J-.016 E.08082
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.697 E.98358
G3 X94.993 Y158.49 I1.225 J.018 E.05791
G1 X161.007 Y158.49 E2.02841
G3 X162.21 Y159.693 I-.012 J1.215 E.05792
G1 X162.21 Y191.704 E.9836
G3 X161.067 Y192.908 I-1.215 J-.009 E.05616
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z1.2 F30000
G1 X95.016 Y194.884 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.009 J-3.189 E.16378
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.288 J.027 E.07906
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17222
G1 X163.342 Y157.545 E.12267
G3 X164.182 Y159.629 I-2.386 J2.172 E.07611
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16073
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21771
G1 X94.299 Y194.805 E-.07923
G1 X93.9 Y194.687 E-.1581
G1 X93.707 Y194.608 E-.07918
G1 X93.339 Y194.415 E-.15816
G1 X93.19 Y194.317 E-.06762
; WIPE_END
M73 P22 R33
G1 E-.04 F1800
G1 X91.236 Y186.939 Z1.2 F30000
G1 X82.644 Y154.507 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.48 E.01206
G3 X79.491 Y151.317 I.434 J-3.196 E.15251
G1 X79.491 Y60.682 E3.00654
G3 X82.683 Y57.491 I3.225 J.034 E.16583
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.226 J-.034 E.16586
G1 X82.704 Y154.509 E3.0058
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.153 Y154.046 E.01689
G3 X79.898 Y151.31 I.561 J-2.76 E.1272
G1 X79.898 Y60.689 E3.00607
G3 X82.69 Y57.898 I2.816 J.025 E.14511
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.817 J-.025 E.14513
G1 X82.719 Y154.102 E3.00507
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.78412
G3 X82.696 Y58.29 I2.422 J.016 E.11593
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.423 J-.017 E.11593
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.229 Y153.664 E-.20106
G1 X81.778 Y153.527 E-.1794
G1 X81.361 Y153.304 E-.17955
G1 X80.996 Y153.004 E-.17949
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z1.2 F30000
G1 X95.011 Y195.291 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.597 E.18445
G1 X91.409 Y159.711 E1.06406
G3 X92.362 Y157.265 I3.706 J.036 E.08898
G1 X94.315 Y155.291 E.09213
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.544 Y56.718 E3.0129
G3 X177.291 Y60.716 I-.249 J3.988 E.20031
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.268 E.09224
G3 X164.589 Y159.616 I-2.687 J2.451 E.0858
G1 X164.589 Y191.788 E1.06722
G3 X161.088 Y195.289 I-3.594 J-.094 E.18115
G1 X95.071 Y195.291 E2.1899
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20511
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.124 J.044 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.569 Y56.311 E3.01399
G3 X177.698 Y60.71 I-.275 J4.395 E.22044
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06029
G3 X164.996 Y159.602 I-2.988 J2.73 E.09548
G1 X164.996 Y191.8 E1.06806
G3 X161.1 Y195.696 I-4.002 J-.106 E.20158
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.602 Y196.071 E.01231
G3 X90.612 Y191.811 I.405 J-4.378 E.19611
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.527 J.052 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.594 Y55.92 E2.79283
G3 X178.09 Y60.703 I-.3 J4.787 E.22216
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.285 J6.843 E.03423
G3 X165.388 Y159.589 I-3.576 J2.886 E.09012
G1 X165.388 Y191.811 E.99009
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.602 Y196.071 E-.17496
G1 X94.316 Y196.036 E-.10931
G1 X94.034 Y195.982 E-.10928
G1 X93.483 Y195.819 E-.2181
G1 X93.217 Y195.711 E-.10921
G1 X93.126 Y195.663 E-.03914
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.031 Z1.2 F30000
G1 X93.173 Y157.573 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.40216
G1 F10021.156
G2 X92.2 Y159.719 I1.858 J2.136 E.07115
G1 X92.201 Y191.765 E.93809
G2 X95.02 Y194.5 I2.8 J-.066 E.12741
G1 X161.053 Y194.499 E1.93303
G2 X163.799 Y191.729 I-.061 J-2.807 E.12621
G1 X163.799 Y159.635 E.93951
G2 X162.84 Y157.584 I-2.843 J.079 E.06816
; LINE_WIDTH: 0.428516
G1 F9336.214
G1 X162.582 Y157.356 E.01082
; LINE_WIDTH: 0.477445
G1 F8284.906
G2 X162.251 Y157.1 I-4.113 J4.966 E.01481
; WIPE_START
G1 X162.582 Y157.356 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.41747
G1 F9611.539
G1 X173.277 Y154.9 E.37434
G1 X173.541 Y154.892 E.00807
G1 X174.003 Y154.831 E.0142
G1 X174.238 Y154.775 E.00737
G1 X174.672 Y154.628 E.014
G1 X175.1 Y154.417 E.01455
G1 X175.496 Y154.152 E.01456
G1 X175.839 Y153.852 E.01391
G1 X176.002 Y153.678 E.00727
G1 X176.293 Y153.3 E.01456
G1 X176.531 Y152.887 E.01456
G1 X176.628 Y152.672 E.00719
G1 X176.776 Y152.238 E.014
G1 X176.869 Y151.77 E.01456
G1 X176.9 Y151.277 E.01507
G1 X176.899 Y60.673 E2.76532
M73 P23 R33
G1 X176.869 Y60.236 E.01338
G1 X176.831 Y59.997 E.00738
G1 X176.776 Y59.762 E.00737
G1 X176.628 Y59.328 E.014
G1 X176.414 Y58.895 E.01473
G1 X176.29 Y58.695 E.00719
G1 X176.007 Y58.326 E.01419
G1 X175.841 Y58.15 E.00738
G1 X175.504 Y57.855 E.01368
G1 X175.095 Y57.579 E.01507
G1 X174.683 Y57.376 E.014
G1 X174.451 Y57.29 E.00755
G1 X174.226 Y57.221 E.0072
G1 X173.772 Y57.131 E.01411
G1 X173.277 Y57.1 E.01515
G1 X82.723 Y57.1 E2.76381
G1 X82.459 Y57.108 E.00807
G1 X81.994 Y57.17 E.0143
G1 X81.543 Y57.291 E.01426
G1 X81.108 Y57.471 E.01436
G1 X80.705 Y57.703 E.01419
G1 X80.504 Y57.848 E.00756
G1 X80.154 Y58.155 E.01419
G1 X79.855 Y58.495 E.01385
G1 X79.579 Y58.905 E.01507
G1 X79.377 Y59.317 E.01399
G1 X79.291 Y59.543 E.00739
G1 X79.171 Y59.989 E.01409
G1 X79.132 Y60.224 E.00728
G1 X79.1 Y60.723 E.01526
G1 X79.1 Y151.277 E2.7638
G1 X79.131 Y151.77 E.01507
G1 X79.171 Y152.008 E.00737
G1 X79.289 Y152.451 E.014
G1 X79.471 Y152.892 E.01457
G1 X79.71 Y153.305 E.01455
G1 X79.854 Y153.504 E.00751
G1 X80.15 Y153.841 E.01369
G1 X80.508 Y154.156 E.01456
G1 X80.905 Y154.421 E.01456
G1 X81.317 Y154.624 E.014
G1 X81.537 Y154.707 E.00719
G1 X82.002 Y154.831 E.01468
G1 X82.459 Y154.892 E.01407
G1 X82.723 Y154.9 E.00807
G1 X94.988 Y154.9 E.37433
; WIPE_START
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.752 Y156.1 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49517
G1 F7960.199
G1 X160.188 Y156.1 E2.37463
G1 X160.421 Y155.685 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X95.579 Y155.685 E1.99236
G1 X94.74 Y156.533 E.03664
G1 X95.752 Y156.515 E.03109
G1 X161.057 Y156.515 E2.0066
G1 X161.26 Y156.534 E.00626
G1 X160.463 Y155.728 E.03483
G1 X160.578 Y155.308 F30000
G1 F9547.299
G1 X95.422 Y155.308 E2.00203
G1 X94.016 Y156.729 E.06141
G1 X94.31 Y156.848 E.00974
G1 X94.355 Y156.972 E.00406
G1 X94.924 Y156.893 E.01765
G1 X95.752 Y156.892 E.02545
G1 X161.057 Y156.892 E2.0066
G1 X161.56 Y156.947 E.01554
G1 X161.819 Y157.019 E.00825
G1 X162.017 Y156.762 E.00995
G1 X160.62 Y155.351 E.061
; WIPE_START
G1 X162.017 Y156.762 E-.75441
G1 X162.008 Y156.774 E-.00559
; WIPE_END
G1 E-.04 F1800
G1 X154.375 Y156.836 Z1.2 F30000
G1 X93.878 Y157.324 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.404868
G1 F9946.18
G1 X93.612 Y157.256 E.00811
; LINE_WIDTH: 0.440337
G1 F9058.507
G1 X93.586 Y157.25 E.00085
; LINE_WIDTH: 0.472535
G1 F8379.602
G1 X93.561 Y157.244 E.00092
G1 X93.399 Y157.374 E.00727
; LINE_WIDTH: 0.427865
G1 F9351.998
G2 X93.173 Y157.573 I4.027 J4.785 E.00945
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9351.998
G1 X93.399 Y157.374 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/60
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z1.2 I-.581 J1.069 P1  F30000
G1 X161.007 Y194.116 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.955 Y157.284 I2.414 J.044 E.1229
G1 X161.046 Y157.284 E2.19239
G3 X163.416 Y159.654 I-.049 J2.419 E.1228
G1 X163.416 Y191.726 E1.0639
G3 X161.067 Y194.116 I-2.423 J-.032 E.12275
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.06369
G3 X94.968 Y157.691 I2.032 J.055 E.10223
G1 X161.033 Y157.691 E2.19152
G3 X163.009 Y159.667 I-.036 J2.012 E.10247
G1 X163.009 Y191.719 E1.06321
G3 X161.067 Y193.708 I-2.015 J-.024 E.10178
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.72 I.025 J-1.608 E.0821
G1 X93.398 Y159.68 E1.06281
G3 X94.981 Y158.098 I1.62 J.038 E.08194
G1 X161.02 Y158.098 E2.19064
G3 X162.602 Y159.68 I-.022 J1.604 E.08214
G1 X162.602 Y191.711 E1.06252
G3 X161.067 Y193.301 I-1.608 J-.017 E.08081
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.009 J1.212 E.05795
G1 X162.21 Y191.704 E.98361
G3 X161.067 Y192.908 I-1.215 J-.009 E.05616
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z1.4 F30000
G1 X95.016 Y194.884 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.009 J-3.189 E.16378
G1 X91.816 Y159.715 E1.06352
G3 X92.658 Y157.545 I3.316 J.037 E.0789
G1 X95.258 Y154.916 E.12265
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.545 E.12268
G3 X164.182 Y159.629 I-2.387 J2.172 E.07611
G1 X164.182 Y191.776 E1.06638
G3 X161.076 Y194.882 I-3.187 J-.081 E.16073
G1 X95.076 Y194.884 E2.18935
; WIPE_START
G1 X94.504 Y194.844 E-.21789
G1 X94.299 Y194.805 E-.07902
G1 X93.9 Y194.687 E-.15821
G1 X93.707 Y194.608 E-.0792
G1 X93.339 Y194.414 E-.15822
G1 X93.193 Y194.312 E-.06747
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z1.4 F30000
G1 X82.644 Y154.507 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.48 E.01206
G3 X79.491 Y151.317 I.434 J-3.196 E.15251
G1 X79.491 Y60.681 E3.00655
G3 X82.683 Y57.491 I3.225 J.035 E.16582
G1 X173.319 Y57.491 E3.00655
G3 X176.509 Y60.683 I-.034 J3.225 E.16582
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.704 Y154.509 E3.0058
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01686
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.689 E3.00608
G3 X82.69 Y57.898 I2.816 J.025 E.1451
G1 X173.311 Y57.898 E3.00608
G3 X176.102 Y60.69 I-.025 J2.816 E.14511
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.719 Y154.102 E3.00507
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.78412
G3 X82.696 Y58.29 I2.422 J.016 E.11593
G1 X173.304 Y58.29 E2.78412
G3 X175.71 Y60.696 I-.016 J2.422 E.11593
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20094
G1 X81.778 Y153.527 E-.17948
G1 X81.361 Y153.304 E-.17956
G1 X80.996 Y153.004 E-.17952
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z1.4 F30000
G1 X95.011 Y195.291 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.597 E.18445
G1 X91.409 Y159.711 E1.06406
G3 X92.36 Y157.268 I3.735 J.046 E.08886
G1 X94.315 Y155.291 E.09223
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.539 Y56.717 E3.01274
G3 X177.291 Y60.717 I-.244 J3.988 E.20048
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.616 I-2.687 J2.451 E.08579
G1 X164.589 Y191.788 E1.06722
G3 X161.088 Y195.289 I-3.594 J-.093 E.18115
G1 X95.071 Y195.291 E2.1899
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20511
G1 X91.002 Y159.706 E1.06461
G3 X92.062 Y156.99 I4.154 J.056 E.09882
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.564 Y56.311 E3.01381
G3 X177.698 Y60.71 I-.27 J4.395 E.22061
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.73 E.09548
G1 X164.996 Y191.8 E1.06805
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P23 R32
G1 F6000
M204 S5000
G1 X94.601 Y196.071 E.01231
G3 X90.612 Y191.811 I.405 J-4.378 E.19611
G1 X90.61 Y159.702 E.98663
G3 X91.774 Y156.723 I4.557 J.064 E.10042
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.589 Y55.92 E2.79267
G3 X178.09 Y60.703 I-.295 J4.787 E.22232
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.288 J6.845 E.03423
G3 X165.388 Y159.59 I-3.578 J2.886 E.09012
G1 X165.388 Y191.811 E.99009
M73 P24 R32
G3 X161.111 Y196.088 I-4.394 J-.118 E.20495
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.601 Y196.071 E-.17501
G1 X94.315 Y196.036 E-.1095
G1 X94.034 Y195.982 E-.10902
G1 X93.483 Y195.819 E-.2182
G1 X93.217 Y195.711 E-.10922
G1 X93.126 Y195.663 E-.03906
; WIPE_END
G1 E-.04 F1800
G1 X93.134 Y188.031 Z1.4 F30000
G1 X93.167 Y157.578 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42919
G1 F9319.909
G3 X93.419 Y157.356 I4.639 J4.995 E.01056
; LINE_WIDTH: 0.476393
G1 F8305.027
G3 X93.742 Y157.106 I4.016 J4.847 E.01445
G1 X93.167 Y157.578 F30000
; LINE_WIDTH: 0.402163
G1 F10021.073
G1 X92.994 Y157.748 E.00709
G2 X92.2 Y159.719 I2.022 J1.96 E.0638
G1 X92.201 Y191.765 E.9381
G2 X95.02 Y194.5 I2.8 J-.066 E.12741
G1 X161.065 Y194.499 E1.93339
G2 X163.799 Y191.73 I-.066 J-2.8 E.12594
G1 X163.799 Y159.635 E.93953
G2 X162.823 Y157.569 I-2.848 J.082 E.06883
; LINE_WIDTH: 0.431983
G1 F9253.011
G2 X162.561 Y157.339 I-3.622 J3.865 E.01103
; LINE_WIDTH: 0.477862
G1 F8276.977
G1 X162.258 Y157.106 E.01356
G1 X95.752 Y156.1 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49516
G1 F7960.375
G1 X160.188 Y156.1 E2.37457
G1 X160.421 Y155.685 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X95.579 Y155.685 E1.99236
G1 X94.741 Y156.533 E.03664
G1 X95.752 Y156.515 E.03109
G1 X161.253 Y156.527 E2.01261
G1 X160.463 Y155.728 E.03451
G1 X160.578 Y155.308 F30000
G1 F9547.299
G1 X95.422 Y155.308 E2.00203
G1 X93.977 Y156.769 E.06312
G1 X94.175 Y157.025 E.00995
G1 X94.472 Y156.941 E.00949
G1 X94.944 Y156.892 E.01458
G1 X161.053 Y156.892 E2.0313
G3 X161.819 Y157.033 I.014 J2.08 E.02408
G1 X162.023 Y156.769 E.01024
G1 X160.62 Y155.351 E.06128
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417471
G1 F9611.528
G1 X173.277 Y154.9 E.37433
G1 X173.541 Y154.892 E.00807
G1 X174.003 Y154.831 E.0142
G1 X174.237 Y154.776 E.00737
G1 X174.672 Y154.628 E.01401
G1 X175.1 Y154.418 E.01455
G1 X175.496 Y154.152 E.01457
G1 X175.678 Y154.002 E.00719
G1 X176.002 Y153.678 E.01399
G1 X176.293 Y153.3 E.01456
G1 X176.531 Y152.887 E.01455
G1 X176.628 Y152.672 E.0072
G1 X176.776 Y152.238 E.014
G1 X176.869 Y151.77 E.01456
G1 X176.9 Y151.277 E.01507
G1 X176.892 Y60.471 E2.77151
G1 X176.866 Y60.209 E.00803
G1 X176.779 Y59.774 E.01354
G1 X176.617 Y59.303 E.01521
G1 X176.421 Y58.905 E.01353
G1 X176.295 Y58.703 E.00728
G1 X176.143 Y58.492 E.00793
G1 X175.846 Y58.155 E.01372
G1 X175.669 Y57.99 E.00738
G1 X175.305 Y57.71 E.014
G1 X174.886 Y57.469 E.01475
G1 X174.672 Y57.372 E.00719
G1 X174.232 Y57.223 E.01418
G1 X173.776 Y57.132 E.01419
G1 X173.544 Y57.109 E.00711
G2 X173.277 Y57.1 I-.487 J10.075 E.00815
G1 X82.723 Y57.1 E2.76381
G1 X82.459 Y57.108 E.00807
G1 X81.992 Y57.171 E.01438
G1 X81.543 Y57.291 E.01418
G1 X81.108 Y57.471 E.01436
G1 X80.705 Y57.704 E.0142
G1 X80.504 Y57.848 E.00755
G1 X80.155 Y58.154 E.01419
G1 X79.844 Y58.508 E.01437
G1 X79.704 Y58.705 E.00737
G1 X79.474 Y59.102 E.01401
G1 X79.291 Y59.543 E.01457
G1 X79.221 Y59.774 E.00737
G1 X79.132 Y60.224 E.01401
G1 X79.1 Y60.723 E.01526
G1 X79.1 Y151.277 E2.76381
G1 X79.132 Y151.776 E.01526
G1 X79.171 Y152.008 E.0072
G1 X79.289 Y152.451 E.01399
G1 X79.475 Y152.898 E.01475
G1 X79.71 Y153.305 E.01437
G1 X79.99 Y153.669 E.01399
G1 X80.15 Y153.841 E.0072
G1 X80.509 Y154.156 E.01455
G1 X80.906 Y154.421 E.01456
G1 X81.317 Y154.623 E.014
G1 X81.537 Y154.707 E.00718
G1 X81.998 Y154.831 E.01456
G1 X82.459 Y154.892 E.01419
G1 X82.723 Y154.9 E.00807
G1 X94.988 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.528
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/60
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z1.4 I-.608 J1.054 P1  F30000
G1 X161.007 Y194.116 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.673 E1.06393
G3 X94.954 Y157.284 I2.414 J.024 E.12352
G1 X161.046 Y157.284 E2.19241
G3 X163.416 Y159.654 I-.053 J2.424 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12207
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.681 E1.06323
G3 X94.967 Y157.691 I2.033 J.042 E.10266
G1 X161.033 Y157.691 E2.19153
G3 X163.009 Y159.667 I-.04 J2.016 E.10243
G1 X163.009 Y191.733 E1.06369
G3 X161.067 Y193.708 I-2.015 J-.039 E.1013
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.689 E1.06253
G3 X94.98 Y158.098 I1.621 J.03 E.08219
G1 X161.019 Y158.098 E2.19064
G3 X162.602 Y159.68 I-.026 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08053
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.696 E.9836
G3 X94.993 Y158.49 I1.225 J.019 E.05788
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.013 J1.216 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z1.6 F30000
G1 X95.015 Y194.884 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.009 J-3.189 E.16377
G1 X91.816 Y159.715 E1.06353
G3 X92.658 Y157.545 I3.288 J.027 E.07892
G1 X95.258 Y154.916 E.12266
G1 X160.742 Y154.916 E2.17222
G1 X163.342 Y157.545 E.12267
G3 X164.182 Y159.629 I-2.386 J2.172 E.07611
G1 X164.182 Y191.776 E1.06639
G3 X161.071 Y194.882 I-3.187 J-.081 E.16089
G1 X95.075 Y194.884 E2.1892
; WIPE_START
G1 X94.504 Y194.844 E-.21771
G1 X94.299 Y194.804 E-.07924
G1 X93.9 Y194.687 E-.15804
G1 X93.707 Y194.608 E-.07921
G1 X93.339 Y194.415 E-.15815
G1 X93.193 Y194.312 E-.06765
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z1.6 F30000
G1 X82.644 Y154.507 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01205
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.319 Y57.491 E3.00657
G3 X176.509 Y60.683 I-.035 J3.225 E.16579
G1 X176.509 Y151.319 E3.00657
G3 X173.317 Y154.509 I-3.225 J-.035 E.1658
G1 X82.704 Y154.509 E3.0058
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.152 Y154.046 E.0169
G3 X79.898 Y151.31 I.562 J-2.76 E.12718
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.312 Y57.898 E3.00609
G3 X176.102 Y60.69 I-.026 J2.816 E.14509
G1 X176.102 Y151.312 E3.00609
G3 X173.31 Y154.102 I-2.816 J-.026 E.14509
G1 X82.719 Y154.102 E3.00508
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.78412
G3 X175.71 Y60.696 I-.016 J2.422 E.11592
G1 X175.71 Y151.304 E2.78412
G3 X173.304 Y153.71 I-2.422 J-.016 E.11593
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.229 Y153.664 E-.20111
G1 X81.778 Y153.527 E-.17929
G1 X81.361 Y153.304 E-.17955
G1 X80.996 Y153.004 E-.17954
G1 X80.962 Y152.962 E-.02051
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z1.6 F30000
G1 X95.011 Y195.291 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.596 E.18444
G1 X91.409 Y159.711 E1.06407
G3 X92.36 Y157.268 I3.706 J.035 E.08888
G1 X94.315 Y155.291 E.09223
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.534 Y56.717 E3.01258
G3 X177.291 Y60.716 I-.239 J3.988 E.20063
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09224
M73 P25 R32
G3 X164.589 Y159.616 I-2.687 J2.451 E.08579
G1 X164.589 Y191.788 E1.06723
G3 X161.084 Y195.289 I-3.594 J-.093 E.18127
G1 X95.071 Y195.291 E2.18979
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20511
G1 X91.002 Y159.706 E1.06462
G3 X92.062 Y156.99 I4.123 J.044 E.09885
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.559 Y56.311 E3.01365
G3 X177.698 Y60.71 I-.264 J4.395 E.22077
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.996 Y191.8 E1.06806
G3 X161.098 Y195.696 I-4.002 J-.106 E.20164
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19038
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.602 Y196.071 E.01231
G3 X90.612 Y191.812 I.405 J-4.378 E.19611
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.723 I4.525 J.052 E.10046
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.584 Y55.919 E2.7925
G3 X178.09 Y60.703 I-.289 J4.787 E.22248
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.278 J6.836 E.03423
G3 X165.388 Y159.589 I-3.575 J2.885 E.09012
G1 X165.388 Y191.811 E.99009
G3 X161.111 Y196.088 I-4.394 J-.118 E.20497
G1 X95.062 Y196.09 E2.0295
; WIPE_START
M204 S10000
G1 X94.602 Y196.071 E-.17499
G1 X94.316 Y196.036 E-.10939
G1 X94.034 Y195.982 E-.1092
G1 X93.483 Y195.819 E-.21815
G1 X93.217 Y195.711 E-.10922
G1 X93.126 Y195.663 E-.03905
; WIPE_END
G1 E-.04 F1800
G1 X93.136 Y188.031 Z1.6 F30000
G1 X93.176 Y157.57 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428457
G1 F9337.643
G3 X93.403 Y157.37 I4.393 J4.747 E.00949
; LINE_WIDTH: 0.473771
G1 F8355.563
G3 X93.74 Y157.102 I5.445 J6.498 E.01512
G1 X93.176 Y157.57 F30000
; LINE_WIDTH: 0.402162
G1 F10021.109
G2 X92.2 Y159.719 I1.855 J2.139 E.07127
G1 X92.201 Y191.765 E.9381
G2 X95.02 Y194.5 I2.8 J-.066 E.12741
G1 X161.065 Y194.499 E1.93338
G2 X163.799 Y191.753 I-.065 J-2.798 E.12528
G1 X163.799 Y159.635 E.94021
G2 X162.842 Y157.586 I-2.848 J.082 E.06806
; LINE_WIDTH: 0.428276
G1 F9342.009
G1 X162.582 Y157.357 E.01091
; LINE_WIDTH: 0.477427
G1 F8285.268
G2 X162.251 Y157.1 I-4.1 J4.948 E.01482
G1 X95.406 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X94.163 Y157.075 I-.225 J3.604 E.04172
G1 X93.933 Y156.786 E.01225
G2 X94.805 Y156.329 I-.05 J-1.157 E.03373
G1 X95.703 Y155.264 E.0462
G1 X98.46 Y155.264 E.09148
G1 X99.173 Y156.119 E.0369
G2 X101.357 Y156.68 I1.603 J-1.709 E.07804
G1 X101.794 Y156.329 E.01858
G1 X102.691 Y155.264 E.0462
G1 X105.449 Y155.264 E.09148
G1 X106.162 Y156.119 E.0369
G2 X108.345 Y156.68 I1.603 J-1.709 E.07804
G1 X108.782 Y156.329 E.01858
G1 X109.68 Y155.264 E.0462
G1 X112.437 Y155.264 E.09148
G1 X113.15 Y156.119 E.0369
G2 X115.334 Y156.68 I1.603 J-1.709 E.07804
G1 X115.771 Y156.329 E.01858
G1 X116.668 Y155.264 E.0462
G1 X119.426 Y155.264 E.09148
G1 X120.138 Y156.119 E.0369
G2 X122.322 Y156.68 I1.603 J-1.709 E.07804
G1 X122.759 Y156.329 E.01858
G1 X123.656 Y155.264 E.0462
G1 X126.414 Y155.264 E.09148
G1 X127.127 Y156.119 E.0369
G2 X129.311 Y156.68 I1.603 J-1.709 E.07804
G1 X129.747 Y156.329 E.01858
G1 X130.645 Y155.264 E.0462
G1 X133.403 Y155.264 E.09148
G1 X134.115 Y156.119 E.0369
G2 X136.299 Y156.68 I1.603 J-1.709 E.07804
G1 X136.736 Y156.329 E.01858
G1 X137.633 Y155.264 E.0462
G1 X140.391 Y155.264 E.09148
G1 X141.104 Y156.119 E.0369
G2 X143.287 Y156.68 I1.603 J-1.709 E.07804
G1 X143.724 Y156.329 E.01858
G1 X144.622 Y155.264 E.0462
G1 X147.379 Y155.264 E.09148
G1 X148.092 Y156.119 E.0369
G2 X150.276 Y156.68 I1.603 J-1.709 E.07804
G1 X150.713 Y156.329 E.01858
G1 X151.61 Y155.264 E.0462
G1 X154.368 Y155.264 E.09148
G1 X155.08 Y156.119 E.0369
G2 X157.264 Y156.68 I1.603 J-1.709 E.07804
G1 X157.701 Y156.329 E.01858
G1 X158.598 Y155.264 E.0462
G1 X160.227 Y155.264 E.05401
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417474
G1 F9611.436
G1 X173.277 Y154.9 E.37433
G1 X173.541 Y154.892 E.00808
G1 X174.008 Y154.829 E.01438
G2 X176.9 Y151.277 I-.713 J-3.534 E.15147
G1 X176.9 Y60.723 E2.76383
G1 X176.868 Y60.224 E.01526
G1 X176.779 Y59.774 E.014
G1 X176.709 Y59.543 E.00738
G1 X176.623 Y59.317 E.00738
G1 X176.421 Y58.905 E.014
G1 X176.152 Y58.504 E.01475
G2 X173.277 Y57.1 I-2.853 J2.197 E.10117
G1 X82.723 Y57.1 E2.76384
G1 X82.459 Y57.108 E.00807
G1 X81.997 Y57.169 E.0142
G1 X81.564 Y57.285 E.01368
G1 X81.322 Y57.374 E.00788
G1 X80.905 Y57.579 E.01418
G1 X80.7 Y57.707 E.00737
G1 X80.504 Y57.848 E.00738
G1 X80.154 Y58.154 E.01419
G1 X79.989 Y58.331 E.00738
G1 X79.707 Y58.7 E.01418
G1 X79.482 Y59.088 E.01369
G1 X79.374 Y59.322 E.00787
G1 X79.224 Y59.763 E.01419
G1 X79.169 Y59.998 E.00737
G1 X79.108 Y60.459 E.0142
G1 X79.1 Y60.723 E.00807
G1 X79.1 Y151.277 E2.76383
G1 X79.132 Y151.776 E.01526
G1 X79.221 Y152.226 E.01401
G1 X79.291 Y152.457 E.00737
G1 X79.377 Y152.683 E.00738
G1 X79.579 Y153.095 E.01399
G1 X79.848 Y153.496 E.01474
G2 X82.723 Y154.9 I2.852 J-2.193 E.10119
G1 X94.988 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.436
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/60
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z1.6 I-.607 J1.055 P1  F30000
G1 X161.122 Y194.107 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.024 Y194.116 E.00326
G1 X94.954 Y194.116 E2.19167
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.414 J.045 E.12287
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.653 I-.053 J2.423 E.12275
G1 X163.416 Y191.746 E1.06458
G3 X161.471 Y194.069 I-2.422 J-.053 E.10856
G1 X161.181 Y194.1 E.00967
G1 X161.083 Y193.703 F30000
G1 F8843.478
G1 X161.017 Y193.709 E.00219
G1 X94.967 Y193.709 E2.191
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.032 J.056 E.1022
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10242
G1 X163.009 Y191.733 E1.0637
G3 X161.392 Y193.67 I-2.015 J-.039 E.09044
G1 X161.142 Y193.696 E.00832
G1 X161.043 Y193.299 F30000
G1 F8843.478
G1 X161.01 Y193.302 E.00111
G1 X94.98 Y193.302 E2.19033
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.621 J.039 E.08192
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.312 Y193.27 I-1.607 J-.025 E.07232
G1 X161.103 Y193.293 E.00698
M204 S250
G1 X161.005 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.004 Y192.91 E.00006
G1 X94.993 Y192.91 E2.02832
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.224 J.022 E.05779
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.012 J1.215 E.0579
G1 X162.21 Y191.707 E.9837
G3 X161.236 Y192.886 I-1.215 J-.012 E.05083
G1 X161.065 Y192.904 E.00527
; WIPE_START
M204 S10000
G1 X161.004 Y192.91 E-.02352
G1 X159.065 Y192.91 E-.73648
; WIPE_END
G1 E-.04 F1800
G1 X151.437 Y193.145 Z1.8 F30000
G1 X95.016 Y194.884 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.009 J-3.189 E.16378
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.29 J.028 E.07907
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17223
G1 X163.339 Y157.542 E.12252
G3 X164.182 Y159.629 I-2.382 J2.175 E.07626
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
M73 P26 R32
G1 X94.504 Y194.844 E-.21784
G1 X94.299 Y194.805 E-.07906
G1 X93.9 Y194.686 E-.15826
G1 X93.707 Y194.608 E-.0791
G1 X93.339 Y194.415 E-.1582
G1 X93.193 Y194.312 E-.06755
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z1.8 F30000
G1 X82.644 Y154.507 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01205
G3 X79.491 Y151.317 I.436 J-3.198 E.15249
G1 X79.491 Y60.68 E3.00658
G3 X82.683 Y57.491 I3.227 J.038 E.16576
G1 X173.32 Y57.491 E3.00658
G3 X176.509 Y60.683 I-.035 J3.225 E.16579
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.704 Y154.509 E3.0058
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.152 Y154.045 E.01691
G3 X79.898 Y151.31 I.564 J-2.761 E.12714
G1 X79.898 Y60.688 E3.00609
G3 X82.69 Y57.898 I2.818 J.028 E.14506
G1 X173.312 Y57.898 E3.0061
G3 X176.102 Y60.69 I-.026 J2.816 E.14508
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.719 Y154.102 E3.00508
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.018 J-2.424 E.11592
G1 X80.29 Y60.696 E2.78412
G3 X82.696 Y58.29 I2.424 J.018 E.1159
G1 X173.304 Y58.29 E2.78412
G3 X175.71 Y60.696 I-.017 J2.422 E.11592
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.229 Y153.664 E-.20118
G1 X81.777 Y153.526 E-.1795
G1 X81.36 Y153.304 E-.17956
G1 X80.995 Y153.004 E-.17951
G1 X80.962 Y152.963 E-.02025
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z1.8 F30000
G1 X95.011 Y195.291 Z1.8
M73 P26 R31
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.596 E.18445
G1 X91.409 Y159.711 E1.06406
G3 X92.362 Y157.265 I3.708 J.036 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.529 Y56.717 E3.01241
G3 X177.291 Y60.716 I-.233 J3.989 E.2008
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.638 Y157.265 E.09213
G3 X164.589 Y159.616 I-2.684 J2.453 E.0859
G1 X164.589 Y191.788 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.093 E.18115
G1 X95.071 Y195.291 E2.1899
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20512
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.126 J.045 E.09891
G1 X93.34 Y155.698 E.06022
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.554 Y56.311 E3.01347
G3 X177.698 Y60.71 I-.259 J4.395 E.22095
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.937 Y156.989 E.06023
G3 X164.996 Y159.602 I-2.986 J2.731 E.09554
G1 X164.996 Y191.8 E1.06806
G3 X161.1 Y195.696 I-4.002 J-.106 E.20158
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.602 Y196.071 E.01231
G3 X90.612 Y191.811 I.405 J-4.377 E.19611
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.529 J.053 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.578 Y55.919 E2.79234
G3 X178.09 Y60.703 I-.284 J4.787 E.22264
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.409 Y156.935 I-5.944 J6.505 E.03597
G3 X165.388 Y159.589 I-3.623 J2.844 E.08837
G1 X165.388 Y191.811 E.99009
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.602 Y196.071 E-.17499
G1 X94.316 Y196.036 E-.10947
G1 X94.034 Y195.982 E-.10908
G1 X93.483 Y195.819 E-.21819
G1 X93.217 Y195.711 E-.10923
G1 X93.126 Y195.663 E-.03904
; WIPE_END
G1 E-.04 F1800
G1 X93.136 Y188.031 Z1.8 F30000
G1 X93.178 Y157.569 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428744
G1 F9330.678
G3 X93.404 Y157.37 I4.351 J4.702 E.00946
; LINE_WIDTH: 0.474432
G1 F8342.768
G3 X93.743 Y157.1 I5.462 J6.523 E.01524
G1 X93.178 Y157.569 F30000
; LINE_WIDTH: 0.402162
G1 F10021.102
G2 X92.2 Y159.719 I1.852 J2.14 E.07134
G1 X92.201 Y191.765 E.9381
G2 X95.02 Y194.5 I2.8 J-.066 E.12741
G1 X161.033 Y194.499 E1.93245
G2 X163.799 Y191.753 I-.042 J-2.808 E.1261
G1 X163.799 Y159.635 E.94021
G2 X162.84 Y157.584 I-2.828 J.073 E.06819
; LINE_WIDTH: 0.428528
G1 F9335.919
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.476348
G1 F8305.889
G2 X162.258 Y157.106 I-3.984 J4.805 E.01447
G1 X95.045 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X94.167 Y157.074 I.07 J3.287 E.02958
G1 X93.921 Y156.764 E.01316
G3 X94.805 Y156.066 I9.739 J11.442 E.03739
G1 X95.609 Y155.264 E.03764
G1 X98.216 Y155.264 E.0865
G3 X99.173 Y156.206 I-5.452 J6.493 E.04458
G2 X101.357 Y156.437 I1.283 J-1.695 E.07655
G2 X102.597 Y155.264 I-6.764 J-8.394 E.05668
G1 X105.205 Y155.264 E.0865
G3 X106.162 Y156.206 I-5.452 J6.493 E.04458
G2 X108.345 Y156.437 I1.283 J-1.695 E.07655
G2 X109.586 Y155.264 I-6.763 J-8.393 E.05668
G1 X112.193 Y155.264 E.0865
M73 P27 R31
G3 X113.15 Y156.206 I-5.452 J6.493 E.04458
G2 X115.334 Y156.437 I1.283 J-1.695 E.07655
G2 X116.574 Y155.264 I-6.764 J-8.394 E.05668
G1 X119.182 Y155.264 E.0865
G3 X120.138 Y156.206 I-5.452 J6.493 E.04458
G2 X122.322 Y156.437 I1.283 J-1.695 E.07655
G2 X123.562 Y155.264 I-6.763 J-8.393 E.05668
G1 X126.17 Y155.264 E.0865
G3 X127.127 Y156.206 I-5.452 J6.493 E.04458
G2 X129.311 Y156.437 I1.283 J-1.695 E.07655
G2 X130.551 Y155.264 I-6.763 J-8.393 E.05668
G1 X133.159 Y155.264 E.0865
G3 X134.115 Y156.206 I-5.452 J6.493 E.04458
G2 X136.299 Y156.437 I1.283 J-1.695 E.07655
G2 X137.539 Y155.264 I-6.764 J-8.394 E.05668
G1 X140.147 Y155.264 E.0865
G3 X141.104 Y156.206 I-5.452 J6.493 E.04458
G2 X143.287 Y156.437 I1.283 J-1.695 E.07655
G2 X144.528 Y155.264 I-6.763 J-8.393 E.05668
G1 X147.135 Y155.264 E.0865
G3 X148.092 Y156.206 I-5.452 J6.493 E.04458
G2 X150.276 Y156.437 I1.283 J-1.695 E.07655
G2 X151.516 Y155.264 I-6.764 J-8.394 E.05668
G1 X154.124 Y155.264 E.0865
G3 X155.08 Y156.206 I-5.452 J6.493 E.04458
G2 X157.264 Y156.437 I1.283 J-1.695 E.07655
G2 X158.504 Y155.264 I-6.763 J-8.393 E.05668
G1 X160.133 Y155.264 E.05401
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417474
G1 F9611.452
G1 X173.541 Y154.892 E.3824
G1 X173.996 Y154.832 E.01401
G1 X174.232 Y154.777 E.00737
G1 X174.672 Y154.628 E.01419
G1 X174.898 Y154.526 E.00757
G1 X175.295 Y154.296 E.01401
G1 X175.496 Y154.152 E.00756
G1 X175.846 Y153.846 E.01419
G1 X176.147 Y153.503 E.01393
G2 X176.9 Y151.277 I-2.844 J-2.203 E.07306
G1 X176.9 Y60.723 E2.76383
G1 X176.892 Y60.459 E.00808
G1 X176.831 Y59.997 E.0142
G1 X176.716 Y59.567 E.01359
G1 X176.624 Y59.321 E.00803
G2 X173.277 Y57.1 I-3.324 J1.377 E.13007
G1 X82.723 Y57.1 E2.76383
G1 X82.23 Y57.131 E.01507
G1 X81.768 Y57.223 E.01437
G1 X81.322 Y57.374 E.01438
G1 X80.913 Y57.576 E.01392
G2 X79.1 Y60.723 I1.786 J3.125 E.11621
G1 X79.1 Y151.277 E2.76383
G1 X79.132 Y151.776 E.01525
G1 X79.171 Y152.009 E.00721
G1 X79.287 Y152.443 E.01373
G2 X82.723 Y154.9 I3.42 J-1.151 E.13773
G1 X94.987 Y154.9 E.37432
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.452
G1 X92.987 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/60
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z1.8 I-.608 J1.054 P1  F30000
G1 X161.007 Y194.116 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.724 I.043 J-2.412 E.12364
G1 X92.584 Y159.672 E1.06322
G3 X94.954 Y157.284 I2.432 J.044 E.12323
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.653 I-.071 J2.441 E.12252
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.415 J-.045 E.12218
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.717 I.031 J-2.006 E.10307
G1 X92.991 Y159.68 E1.06272
G3 X94.967 Y157.691 I2.022 J.033 E.10276
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.054 J2.03 E.10223
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.031 J-.055 E.10109
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.71 I.018 J-1.6 E.08251
G1 X93.398 Y159.688 E1.06223
G3 X94.98 Y158.098 I1.612 J.022 E.0823
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.037 J1.619 E.08194
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.3 I-1.62 J-.038 E.08036
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.704 I.032 J-1.235 E.05777
G1 X93.79 Y159.696 E.9835
G3 X94.993 Y158.49 I1.217 J.011 E.05797
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.907 I-1.224 J-.021 E.05596
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z2 F30000
G1 X95.015 Y194.884 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.009 J-3.189 E.16377
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.289 J.028 E.07908
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.545 E.12267
G3 X164.182 Y159.629 I-2.386 J2.172 E.0761
G1 X164.182 Y191.776 E1.06638
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.075 Y194.884 E2.18937
; WIPE_START
G1 X94.504 Y194.844 E-.21761
G1 X94.299 Y194.804 E-.07932
G1 X93.9 Y194.686 E-.15819
G1 X93.707 Y194.608 E-.07908
G1 X93.338 Y194.414 E-.15825
G1 X93.193 Y194.312 E-.06756
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z2 F30000
G1 X82.644 Y154.507 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01205
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.68 E3.00661
G3 X82.683 Y57.491 I3.227 J.039 E.16573
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.32 E3.00661
G3 X173.317 Y154.509 I-3.225 J-.036 E.16576
G1 X82.704 Y154.509 E3.0058
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.152 Y154.045 E.01692
G3 X79.898 Y151.31 I.562 J-2.759 E.12716
G1 X79.898 Y60.688 E3.00611
G3 X82.69 Y57.898 I2.818 J.029 E.14504
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.312 E3.00611
G3 X173.31 Y154.102 I-2.816 J-.026 E.14507
G1 X82.719 Y154.102 E3.00509
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.78413
G3 X82.696 Y58.29 I2.425 J.019 E.11589
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.78413
G3 X173.304 Y153.71 I-2.422 J-.017 E.11592
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.229 Y153.664 E-.20124
G1 X81.778 Y153.527 E-.1792
G1 X81.361 Y153.304 E-.17957
G1 X80.996 Y153.004 E-.1795
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z2 F30000
G1 X95.011 Y195.291 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.596 E.18444
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.708 J.036 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.524 Y56.717 E3.01224
G3 X177.291 Y60.716 I-.228 J3.989 E.20097
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.616 I-2.687 J2.451 E.08579
G1 X164.589 Y191.788 E1.06722
G3 X161.088 Y195.289 I-3.594 J-.093 E.18114
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20511
G1 X91.002 Y159.706 E1.06462
G3 X92.063 Y156.989 I4.126 J.045 E.09891
G1 X93.34 Y155.698 E.06022
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.549 Y56.311 E3.0133
G3 X177.698 Y60.71 I-.253 J4.395 E.22112
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.996 Y191.8 E1.06806
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.602 Y196.071 E.01231
G3 X90.612 Y191.812 I.405 J-4.377 E.19611
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.529 J.053 E.10048
G1 X92.4 Y156.09 E.02732
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.573 Y55.919 E2.79217
G3 X178.09 Y60.703 I-.278 J4.787 E.22281
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.278 J6.836 E.03423
G3 X165.388 Y159.589 I-3.578 J2.886 E.09011
G1 X165.388 Y191.811 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.602 Y196.071 E-.17501
G1 X94.316 Y196.036 E-.10932
M73 P28 R31
G1 X94.034 Y195.982 E-.10927
G1 X93.483 Y195.819 E-.2182
G1 X93.217 Y195.711 E-.10907
G1 X93.126 Y195.663 E-.03912
; WIPE_END
G1 E-.04 F1800
G1 X93.137 Y188.031 Z2 F30000
G1 X93.18 Y157.567 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428885
G1 F9327.276
G3 X93.404 Y157.369 I4.456 J4.824 E.00942
; LINE_WIDTH: 0.474362
G1 F8344.121
G3 X93.742 Y157.101 I5.417 J6.474 E.01517
G1 X93.18 Y157.567 F30000
; LINE_WIDTH: 0.40218
G1 F10020.613
G1 X93.021 Y157.721 E.00646
G2 X92.2 Y159.72 I1.992 J1.986 E.06493
G1 X92.201 Y191.733 E.9372
G2 X95.02 Y194.5 I2.805 J-.038 E.12829
G1 X161.065 Y194.499 E1.93348
G2 X163.799 Y191.753 I-.07 J-2.804 E.12522
G1 X163.799 Y159.635 E.94026
G2 X162.711 Y157.469 I-2.864 J.082 E.07326
; LINE_WIDTH: 0.444557
G1 F8963.337
G2 X162.54 Y157.323 I-3.063 J3.433 E.00736
; LINE_WIDTH: 0.481435
G1 F8209.541
G1 X162.258 Y157.106 E.01272
G1 X96.348 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X97.977 Y155.264 E.05401
G2 X99.173 Y156.304 I8.983 J-9.126 E.05262
G2 X101.794 Y155.849 I1.038 J-1.797 E.09577
G3 X102.44 Y155.264 I2.355 J1.953 E.02899
G1 X104.965 Y155.264 E.08378
G2 X106.162 Y156.304 I8.983 J-9.126 E.05262
G2 X108.782 Y155.849 I1.037 J-1.797 E.09577
G3 X109.428 Y155.264 I2.355 J1.953 E.02899
G1 X111.954 Y155.264 E.08378
G2 X113.15 Y156.304 I8.981 J-9.124 E.05262
G2 X115.771 Y155.849 I1.038 J-1.797 E.09577
G3 X116.416 Y155.264 I2.355 J1.953 E.02899
G1 X118.942 Y155.264 E.08378
G2 X120.138 Y156.304 I8.983 J-9.126 E.05262
G2 X122.759 Y155.849 I1.038 J-1.797 E.09577
G3 X123.405 Y155.264 I2.355 J1.953 E.02899
G1 X125.93 Y155.264 E.08378
G2 X127.127 Y156.304 I8.981 J-9.124 E.05262
G2 X129.747 Y155.849 I1.037 J-1.797 E.09577
G3 X130.393 Y155.264 I2.355 J1.953 E.02899
G1 X132.919 Y155.264 E.08378
G2 X134.115 Y156.304 I8.98 J-9.123 E.05262
G2 X136.736 Y155.849 I1.037 J-1.797 E.09577
G3 X137.382 Y155.264 I2.355 J1.953 E.02899
G1 X139.907 Y155.264 E.08378
G2 X141.104 Y156.304 I8.981 J-9.124 E.05262
G2 X143.724 Y155.849 I1.038 J-1.797 E.09577
G3 X144.37 Y155.264 I2.355 J1.953 E.02899
G1 X146.896 Y155.264 E.08378
G2 X148.092 Y156.304 I8.98 J-9.123 E.05262
G2 X150.713 Y155.849 I1.037 J-1.797 E.09577
G3 X151.358 Y155.264 I2.355 J1.953 E.02899
G1 X153.884 Y155.264 E.08378
G2 X155.08 Y156.304 I8.98 J-9.123 E.05262
G2 X157.701 Y155.849 I1.037 J-1.797 E.09577
G3 X158.347 Y155.264 I2.355 J1.953 E.02899
G1 X159.975 Y155.264 E.05401
; WIPE_START
G1 X158.347 Y155.264 E-.61876
G1 X158.071 Y155.514 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417468
G1 F9611.585
G1 X173.277 Y154.9 E.37433
G1 X173.776 Y154.867 E.01525
G2 X176.9 Y151.277 I-.474 J-3.567 E.15872
G1 X176.9 Y60.723 E2.76379
G1 X176.892 Y60.459 E.00808
G1 X176.831 Y59.997 E.0142
G1 X176.711 Y59.549 E.01418
G1 X176.623 Y59.317 E.00756
G2 X173.277 Y57.1 I-3.322 J1.38 E.12995
G1 X82.723 Y57.1 E2.76379
G1 X82.224 Y57.132 E.01525
G1 X81.774 Y57.221 E.01401
G1 X81.537 Y57.293 E.00757
G1 X81.113 Y57.469 E.014
G1 X80.9 Y57.582 E.00737
G1 X80.695 Y57.71 E.00738
G1 X80.34 Y57.982 E.01365
G2 X79.1 Y60.723 I2.379 J2.728 E.09469
G1 X79.1 Y151.277 E2.76379
G1 X79.132 Y151.776 E.01526
G1 X79.221 Y152.226 E.01401
G1 X79.291 Y152.457 E.00737
G1 X79.376 Y152.683 E.00737
G1 X79.579 Y153.095 E.01401
G1 X79.849 Y153.496 E.01474
G2 X82.723 Y154.9 I2.851 J-2.192 E.10119
G1 X94.988 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.585
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/60
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z2 I-.608 J1.054 P1  F30000
G1 X161.007 Y194.116 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.045 J-2.415 E.12286
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.433 J.063 E.12263
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.045 J2.415 E.12286
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12208
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.055 J-2.031 E.10221
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.023 J.046 E.10233
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.055 J2.031 E.10221
G1 X163.009 Y191.733 E1.06369
G3 X161.067 Y193.708 I-2.015 J-.039 E.1013
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.72 I.038 J-1.62 E.08193
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.612 J.03 E.08203
G1 X161.02 Y158.098 E2.19066
G3 X162.602 Y159.68 I-.038 J1.62 E.08193
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08053
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.021 J-1.224 E.0578
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.218 J.015 E.05788
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z2.2 F30000
G1 X95.016 Y194.884 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.01 J-3.189 E.16379
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.29 J.028 E.07906
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17224
G1 X163.342 Y157.545 E.12266
G3 X164.182 Y159.629 I-2.386 J2.172 E.07611
G1 X164.182 Y191.776 E1.06638
M73 P28 R30
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21774
G1 X94.299 Y194.804 E-.07929
G1 X93.9 Y194.686 E-.15815
G1 X93.707 Y194.608 E-.07908
G1 X93.339 Y194.415 E-.15819
G1 X93.193 Y194.312 E-.06754
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z2.2 F30000
G1 X82.644 Y154.506 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01205
G3 X79.491 Y151.317 I.437 J-3.198 E.15248
G1 X79.491 Y60.679 E3.00661
G3 X82.683 Y57.491 I3.225 J.036 E.16576
G1 X173.321 Y57.491 E3.00661
G3 X176.509 Y60.683 I-.036 J3.225 E.16576
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.704 Y154.509 E3.00581
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.151 Y154.045 E.01692
G3 X79.898 Y151.31 I.565 J-2.762 E.12712
G1 X79.898 Y60.688 E3.00611
G3 X82.69 Y57.898 I2.816 J.026 E.14507
G1 X173.312 Y57.898 E3.00611
G3 X176.102 Y60.69 I-.026 J2.816 E.14507
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.719 Y154.102 E3.00509
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.018 J-2.425 E.11591
G1 X80.29 Y60.696 E2.78413
G3 X82.696 Y58.29 I2.422 J.017 E.11592
G1 X173.304 Y58.29 E2.78413
G3 X175.71 Y60.696 I-.017 J2.422 E.11592
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.229 Y153.664 E-.20123
G1 X81.777 Y153.526 E-.17949
G1 X81.361 Y153.304 E-.17922
G1 X80.995 Y153.004 E-.17988
G1 X80.962 Y152.963 E-.02017
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z2.2 F30000
G1 X95.011 Y195.291 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.596 E.18445
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.708 J.036 E.08898
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.548 Y56.718 E3.01304
G3 X177.291 Y60.716 I-.27 J4.005 E.19997
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.268 E.09223
G3 X164.589 Y159.616 I-2.687 J2.451 E.08579
G1 X164.589 Y191.788 E1.06722
G3 X161.088 Y195.289 I-3.594 J-.093 E.18115
G1 X95.071 Y195.291 E2.1899
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20511
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.127 J.045 E.0989
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
M73 P29 R30
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.561 Y56.311 E3.0137
G3 X177.698 Y60.71 I-.285 J4.413 E.22049
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35261
G1 X163.939 Y156.99 E.06029
G3 X164.996 Y159.602 I-2.988 J2.73 E.09548
G1 X164.996 Y191.8 E1.06806
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.601 Y196.071 E.01231
G3 X90.612 Y191.811 I.405 J-4.377 E.19611
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.529 J.053 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.574 Y55.919 E2.79219
G3 X178.09 Y60.703 I-.299 J4.806 E.22255
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.29 J6.848 E.03422
G3 X165.388 Y159.589 I-3.578 J2.887 E.09012
G1 X165.388 Y191.811 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.601 Y196.071 E-.17507
G1 X94.316 Y196.036 E-.10928
G1 X94.034 Y195.982 E-.10926
G1 X93.483 Y195.819 E-.21813
G1 X93.217 Y195.711 E-.10923
G1 X93.126 Y195.663 E-.03901
; WIPE_END
G1 E-.04 F1800
G1 X93.137 Y188.031 Z2.2 F30000
G1 X93.181 Y157.566 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430539
G1 F9287.481
G3 X93.42 Y157.355 I4.7 J5.09 E.01007
; LINE_WIDTH: 0.477229
G1 F8289.037
G3 X93.745 Y157.103 I4.117 J4.977 E.01454
G1 X93.181 Y157.566 F30000
; LINE_WIDTH: 0.402163
G1 F10021.092
G1 X93.021 Y157.72 E.00651
G2 X92.2 Y159.719 I1.992 J1.987 E.06493
G1 X92.201 Y191.765 E.9381
G2 X95.02 Y194.5 I2.807 J-.073 E.12733
G1 X161.065 Y194.499 E1.93338
G2 X163.799 Y191.753 I-.065 J-2.799 E.12528
G1 X163.799 Y159.635 E.94021
G2 X162.84 Y157.584 I-2.823 J.07 E.0682
; LINE_WIDTH: 0.428549
G1 F9335.408
G1 X162.582 Y157.356 E.01081
; LINE_WIDTH: 0.476384
G1 F8305.196
G2 X162.258 Y157.106 I-4.008 J4.837 E.01446
; WIPE_START
G1 X162.582 Y157.356 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.013 Y154.9 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.417478
G1 F9611.337
G1 X173.541 Y154.892 E.3824
G1 X173.996 Y154.832 E.01401
G1 X174.232 Y154.777 E.00737
G1 X174.672 Y154.628 E.01419
G1 X174.898 Y154.526 E.00757
G1 X175.295 Y154.297 E.01399
G1 X175.496 Y154.152 E.00756
G1 X175.845 Y153.846 E.01418
G1 X176.143 Y153.507 E.01375
G2 X176.9 Y151.277 I-2.839 J-2.207 E.07324
G1 X176.9 Y60.723 E2.76386
G1 X176.892 Y60.459 E.00808
G1 X176.829 Y59.992 E.01438
G1 X176.709 Y59.543 E.01418
G1 X176.529 Y59.108 E.01437
G1 X176.297 Y58.705 E.01418
G1 X176.152 Y58.504 E.00758
G1 X175.846 Y58.154 E.01418
G1 X175.507 Y57.857 E.01374
G2 X173.277 Y57.1 I-2.208 J2.839 E.07324
G1 X82.723 Y57.1 E2.76386
G1 X82.224 Y57.132 E.01525
G1 X81.992 Y57.171 E.0072
G1 X81.562 Y57.285 E.01356
G2 X79.1 Y60.723 I1.145 J3.421 E.1379
G1 X79.1 Y151.277 E2.76386
G1 X79.132 Y151.776 E.01525
G1 X79.171 Y152.008 E.0072
G1 X79.285 Y152.437 E.01355
G2 X82.723 Y154.9 I3.42 J-1.144 E.13792
G1 X94.987 Y154.9 E.37433
; WIPE_START
G1 X92.987 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.123 Y155.264 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X97.751 Y155.264 E.05401
G3 X98.736 Y156.153 I-10.681 J12.828 E.04401
G2 X101.794 Y155.648 I1.274 J-1.792 E.11408
G1 X102.212 Y155.264 E.01882
G1 X104.74 Y155.264 E.08384
G3 X105.725 Y156.153 I-10.681 J12.828 E.04401
G2 X108.782 Y155.648 I1.274 J-1.792 E.11408
G1 X109.201 Y155.264 E.01882
G1 X111.728 Y155.264 E.08384
G3 X112.713 Y156.153 I-10.681 J12.828 E.04401
G2 X115.771 Y155.648 I1.274 J-1.792 E.11408
G1 X116.189 Y155.264 E.01882
G1 X118.717 Y155.264 E.08384
G3 X119.702 Y156.153 I-10.681 J12.828 E.04401
G2 X122.759 Y155.648 I1.274 J-1.792 E.11408
G1 X123.178 Y155.264 E.01882
G1 X125.705 Y155.264 E.08384
G3 X126.69 Y156.153 I-10.681 J12.828 E.04401
G2 X129.747 Y155.648 I1.274 J-1.792 E.11408
G1 X130.166 Y155.264 E.01882
G1 X132.693 Y155.264 E.08384
G3 X133.678 Y156.153 I-10.681 J12.828 E.04401
G2 X136.736 Y155.648 I1.274 J-1.792 E.11408
G1 X137.154 Y155.264 E.01882
G1 X139.682 Y155.264 E.08384
G3 X140.667 Y156.153 I-10.687 J12.835 E.04401
G2 X143.724 Y155.648 I1.274 J-1.792 E.11408
G1 X144.143 Y155.264 E.01882
G1 X146.67 Y155.264 E.08384
G3 X147.655 Y156.153 I-10.681 J12.828 E.04401
G2 X150.713 Y155.648 I1.274 J-1.792 E.11408
G1 X151.131 Y155.264 E.01882
G1 X153.659 Y155.264 E.08384
G3 X154.644 Y156.153 I-10.681 J12.828 E.04401
G2 X157.701 Y155.648 I1.274 J-1.792 E.11408
G1 X158.12 Y155.264 E.01882
G1 X159.748 Y155.264 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X158.12 Y155.264 E-.61876
G1 X157.845 Y155.515 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/60
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z2.2 I-1.213 J.099 P1  F30000
G1 X161.007 Y194.116 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.724 I.043 J-2.412 E.12364
G1 X92.584 Y159.654 E1.06381
G3 X94.954 Y157.284 I2.415 J.045 E.12287
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.063 J2.433 E.12262
G1 X163.416 Y191.724 E1.06383
G3 X161.067 Y194.116 I-2.415 J-.022 E.12293
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.717 I.031 J-2.006 E.10308
G1 X92.991 Y159.667 E1.06315
G3 X94.967 Y157.691 I2.034 J.058 E.10219
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.047 J2.023 E.10233
G1 X163.009 Y191.717 E1.06316
G3 X161.067 Y193.708 I-2.031 J-.039 E.10162
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.71 I.018 J-1.6 E.08251
G1 X93.398 Y159.681 E1.06248
G3 X94.98 Y158.098 I1.622 J.04 E.08191
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.03 J1.613 E.08203
G1 X162.602 Y191.71 E1.06249
G3 X161.067 Y193.3 I-1.62 J-.028 E.08068
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.704 I.032 J-1.235 E.05777
G1 X93.79 Y159.693 E.98359
G3 X94.993 Y158.49 I1.226 J.022 E.05778
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.015 J1.218 E.05787
G1 X162.21 Y191.704 E.98359
G3 X161.067 Y192.907 I-1.224 J-.017 E.05606
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z2.4 F30000
G1 X95.015 Y194.884 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.009 J-3.189 E.16378
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.291 J.028 E.07906
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17223
G1 X163.342 Y157.545 E.12267
G3 X164.182 Y159.629 I-2.386 J2.172 E.07611
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.075 Y194.884 E2.18937
; WIPE_START
G1 X94.504 Y194.844 E-.2178
G1 X94.3 Y194.805 E-.07896
G1 X93.9 Y194.686 E-.15834
G1 X93.52 Y194.517 E-.1581
G1 X93.339 Y194.415 E-.07922
G1 X93.193 Y194.312 E-.06758
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z2.4 F30000
G1 X82.644 Y154.506 Z2.4
G1 Z2
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01205
G3 X79.491 Y151.317 I.437 J-3.199 E.15247
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.228 J.036 E.16583
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.321 E3.00664
G3 X173.317 Y154.509 I-3.225 J-.037 E.16573
G1 X82.704 Y154.509 E3.00581
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.151 Y154.045 E.01693
G3 X79.898 Y151.31 I.566 J-2.762 E.1271
G1 X79.898 Y60.69 E3.00604
M73 P30 R30
G3 X82.69 Y57.898 I2.819 J.027 E.1451
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.313 E3.00613
G3 X173.31 Y154.102 I-2.816 J-.027 E.14505
G1 X82.718 Y154.102 E3.00509
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.019 J-2.425 E.11591
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.425 J.019 E.11591
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.78413
G3 X173.304 Y153.71 I-2.422 J-.017 E.11591
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.229 Y153.664 E-.20129
G1 X81.778 Y153.527 E-.17913
G1 X81.36 Y153.303 E-.17991
G1 X80.995 Y153.004 E-.17951
G1 X80.961 Y152.963 E-.02015
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z2.4 F30000
G1 X95.011 Y195.291 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.596 E.18445
G1 X91.409 Y159.711 E1.06406
G3 X92.362 Y157.265 I3.709 J.037 E.08898
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.542 Y56.718 E3.01286
G3 X177.291 Y60.717 I-.264 J4.004 E.20015
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.268 E.09223
G3 X164.589 Y159.616 I-2.687 J2.451 E.0858
G1 X164.589 Y191.788 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.094 E.18114
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20512
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.128 J.046 E.0989
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.556 Y56.311 E3.01352
G3 X177.698 Y60.71 I-.278 J4.412 E.22068
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06029
G3 X164.996 Y159.602 I-2.988 J2.73 E.09548
G1 X164.996 Y191.8 E1.06806
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.602 Y196.071 E.01231
G3 X90.612 Y191.811 I.405 J-4.377 E.19611
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.53 J.054 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.568 Y55.919 E2.79203
G3 X178.09 Y60.703 I-.292 J4.804 E.22274
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.288 J6.845 E.03423
G3 X165.388 Y159.589 I-3.579 J2.887 E.09011
G1 X165.388 Y191.811 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.602 Y196.071 E-.17503
G1 X94.316 Y196.036 E-.10949
G1 X93.756 Y195.909 E-.21809
G1 X93.483 Y195.819 E-.10918
G1 X93.217 Y195.711 E-.10914
G1 X93.126 Y195.663 E-.03907
; WIPE_END
G1 E-.04 F1800
G1 X93.137 Y188.031 Z2.4 F30000
G1 X93.183 Y157.564 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402163
G1 F10021.082
G2 X92.2 Y159.72 I1.844 J2.142 E.07154
G1 X92.201 Y191.733 E.93715
G2 X95.02 Y194.5 I2.805 J-.038 E.12828
G1 X161.065 Y194.499 E1.93339
G2 X163.799 Y191.727 I-.07 J-2.803 E.12596
G1 X163.799 Y159.635 E.93946
G2 X162.82 Y157.567 I-2.837 J.077 E.06895
; LINE_WIDTH: 0.432226
G1 F9247.221
G2 X162.561 Y157.339 I-3.58 J3.82 E.01093
; LINE_WIDTH: 0.477866
G1 F8276.901
G1 X162.258 Y157.106 E.01355
G1 X161.184 Y156.944 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X161.843 Y157.074 I-.15 J2.499 E.02235
G1 X162.081 Y156.765 E.01292
G3 X160.462 Y155.264 I167.087 J-181.905 E.07324
G1 X157.904 Y155.264 E.08485
G2 X157.264 Y155.894 I3.22 J3.912 E.02981
G3 X154.644 Y156.34 I-1.596 J-1.46 E.09496
G2 X153.473 Y155.264 I-71.029 J76.138 E.05271
G1 X150.916 Y155.264 E.08485
G2 X150.276 Y155.894 I3.22 J3.912 E.02981
G3 X147.655 Y156.34 I-1.596 J-1.46 E.09496
G2 X146.485 Y155.264 I-71.029 J76.138 E.05271
G1 X143.927 Y155.264 E.08485
G2 X143.287 Y155.894 I3.22 J3.912 E.02981
G3 X140.667 Y156.34 I-1.596 J-1.46 E.09496
G2 X139.497 Y155.264 I-71.189 J76.312 E.05271
G1 X136.939 Y155.264 E.08485
G2 X136.299 Y155.894 I3.22 J3.912 E.02981
G3 X133.678 Y156.34 I-1.596 J-1.46 E.09496
M73 P30 R29
G2 X132.508 Y155.264 I-71.029 J76.138 E.05271
G1 X129.95 Y155.264 E.08485
G2 X129.311 Y155.894 I3.22 J3.912 E.02981
G3 X126.69 Y156.34 I-1.596 J-1.46 E.09496
G2 X125.52 Y155.264 I-71.029 J76.138 E.05271
G1 X122.962 Y155.264 E.08485
G2 X122.322 Y155.894 I3.22 J3.912 E.02981
G3 X119.702 Y156.34 I-1.596 J-1.46 E.09496
G2 X118.531 Y155.264 I-71.029 J76.138 E.05271
G1 X115.974 Y155.264 E.08485
G2 X115.334 Y155.894 I3.22 J3.912 E.02981
G3 X112.713 Y156.34 I-1.596 J-1.46 E.09496
G2 X111.543 Y155.264 I-71.029 J76.138 E.05271
G1 X108.985 Y155.264 E.08485
G2 X108.345 Y155.894 I3.22 J3.912 E.02981
G3 X105.725 Y156.34 I-1.596 J-1.46 E.09496
G2 X104.555 Y155.264 I-71.029 J76.138 E.05271
G1 X101.997 Y155.264 E.08485
G2 X101.357 Y155.894 I3.22 J3.912 E.02981
G3 X98.736 Y156.34 I-1.596 J-1.46 E.09496
G2 X97.566 Y155.264 I-71.029 J76.138 E.05271
G1 X95.938 Y155.264 E.05401
; WIPE_START
G1 X97.566 Y155.264 E-.61876
G1 X97.84 Y155.516 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X94.987 Y154.9 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417476
G1 F9611.387
G1 X82.723 Y154.9 E.37433
G3 X79.284 Y152.434 I-.016 J-3.608 E.138
G1 X79.171 Y152.009 E.01345
G1 X79.132 Y151.776 E.0072
G1 X79.1 Y151.277 E.01526
G1 X79.1 Y60.723 E2.76385
G3 X80.345 Y57.978 I3.615 J-.015 E.09488
G1 X80.695 Y57.71 E.01346
G1 X80.9 Y57.582 E.00737
G1 X81.113 Y57.469 E.00738
G1 X81.537 Y57.293 E.014
G1 X81.774 Y57.221 E.00756
G1 X82.224 Y57.132 E.01401
G1 X82.723 Y57.1 E.01525
G1 X173.277 Y57.1 E2.76385
G1 X173.541 Y57.109 E.00807
G1 X174.003 Y57.169 E.0142
G1 X174.237 Y57.224 E.00736
G1 X174.678 Y57.374 E.01419
G1 X174.897 Y57.474 E.00737
G1 X175.3 Y57.707 E.01419
G1 X175.496 Y57.848 E.00738
G1 X175.845 Y58.154 E.01418
G1 X176.152 Y58.504 E.01419
G1 X176.293 Y58.7 E.00737
G1 X176.421 Y58.905 E.00738
G1 X176.623 Y59.317 E.014
G1 X176.711 Y59.549 E.00757
G1 X176.831 Y59.997 E.01418
G1 X176.892 Y60.459 E.0142
G1 X176.9 Y60.723 E.00808
G1 X176.9 Y151.277 E2.76384
M73 P31 R29
G3 X176.517 Y152.913 I-3.656 J.008 E.05174
G1 X176.293 Y153.3 E.01365
G1 X176.007 Y153.674 E.01438
G1 X175.674 Y154.006 E.01437
G1 X175.305 Y154.29 E.01419
G1 X175.095 Y154.421 E.00756
G1 X174.672 Y154.628 E.01436
G1 X174.232 Y154.777 E.01419
G1 X173.77 Y154.869 E.01438
G1 X173.277 Y154.9 E.01506
G1 X161.012 Y154.9 E.37434
; WIPE_START
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.385 Y155.167 Z2.4 F30000
G1 X93.878 Y157.324 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.403773
G1 F9976.372
G1 X93.613 Y157.256 E.00806
; LINE_WIDTH: 0.439472
G1 F9078.266
G1 X93.587 Y157.25 E.00086
; LINE_WIDTH: 0.472742
G1 F8375.566
G1 X93.561 Y157.244 E.00094
G1 X93.4 Y157.372 E.0072
; LINE_WIDTH: 0.428805
G1 F9329.208
G2 X93.183 Y157.564 I4.104 J4.874 E.00913
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9329.208
G1 X93.4 Y157.372 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/60
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z2.4 I-.581 J1.069 P1  F30000
G1 X161.007 Y194.116 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.045 J-2.415 E.12286
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.43 J.061 E.12266
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.063 J2.433 E.12262
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12208
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.056 J-2.032 E.10221
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.021 J.045 E.10235
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.047 J2.023 E.10232
G1 X163.009 Y191.733 E1.06369
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.72 I.038 J-1.62 E.08193
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.611 J.029 E.08205
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.031 J1.613 E.08202
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08053
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.021 J-1.224 E.0578
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.216 J.013 E.05789
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.015 J1.218 E.05787
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z2.6 F30000
G1 X95.016 Y194.884 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.01 J-3.189 E.16378
G1 X91.816 Y159.715 E1.06352
G3 X92.658 Y157.545 I3.288 J.027 E.07895
G1 X95.258 Y154.916 E.12263
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.629 I-2.387 J2.172 E.0761
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21784
G1 X94.3 Y194.805 E-.07902
G1 X93.9 Y194.687 E-.15828
G1 X93.52 Y194.517 E-.15822
G1 X93.338 Y194.414 E-.07917
G1 X93.193 Y194.312 E-.06747
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z2.6 F30000
G1 X82.644 Y154.506 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01205
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.322 Y57.491 E3.00664
G3 X176.509 Y60.683 I-.037 J3.225 E.16573
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.704 Y154.509 E3.00581
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01684
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.313 Y57.898 E3.00613
G3 X176.102 Y60.69 I-.027 J2.816 E.14505
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00509
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.305 Y58.29 E2.78414
G3 X175.71 Y60.696 I-.017 J2.422 E.11591
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.778 Y153.527 E-.17949
G1 X81.361 Y153.304 E-.17955
G1 X80.996 Y153.004 E-.17955
G1 X80.962 Y152.962 E-.02051
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z2.6 F30000
G1 X95.011 Y195.291 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.596 E.18445
G1 X91.409 Y159.711 E1.06407
G3 X92.36 Y157.267 I3.706 J.035 E.0889
G1 X94.315 Y155.291 E.09221
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.537 Y56.717 E3.01267
G3 X177.291 Y60.716 I-.259 J4.005 E.20033
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.616 I-2.687 J2.451 E.08578
G1 X164.589 Y191.788 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.094 E.18114
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20511
G1 X91.002 Y159.706 E1.06461
G3 X92.062 Y156.99 I4.123 J.044 E.09886
G1 X93.34 Y155.698 E.06028
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.55 Y56.311 E3.01334
G3 X177.698 Y60.71 I-.274 J4.413 E.22085
G1 X177.698 Y151.29 E3.00472
G3 X177.376 Y152.948 I-4.934 J-.098 E.05628
G3 X173.29 Y155.698 I-4.107 J-1.691 E.17317
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.996 Y191.8 E1.06806
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.002 Y196.09 E0
G3 X90.612 Y191.811 I.004 J-4.396 E.20844
G1 X90.61 Y159.702 E.98663
G3 X91.774 Y156.723 I4.525 J.052 E.10046
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.563 Y55.919 E2.79186
G3 X178.09 Y60.703 I-.288 J4.806 E.22289
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.288 J6.845 E.03423
G3 X165.388 Y159.589 I-3.578 J2.886 E.09011
G1 X165.388 Y191.812 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.0295
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02285
G1 X94.602 Y196.071 E-.15244
G1 X94.316 Y196.036 E-.10948
G1 X93.756 Y195.909 E-.21818
G1 X93.483 Y195.819 E-.1091
G1 X93.127 Y195.661 E-.14795
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.028 Z2.6 F30000
G1 X93.167 Y157.579 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42913
G1 F9321.362
G3 X93.418 Y157.357 I4.641 J4.996 E.01056
; LINE_WIDTH: 0.476334
G1 F8306.145
G3 X93.742 Y157.106 I3.997 J4.824 E.01446
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402162
G1 F10021.1
G1 X93.017 Y157.725 E.00614
G2 X92.2 Y159.719 I1.996 J1.982 E.06473
G1 X92.201 Y191.765 E.9381
G2 X95.02 Y194.5 I2.807 J-.073 E.12732
M73 P32 R29
G1 X161.065 Y194.499 E1.93339
G2 X163.799 Y191.753 I-.067 J-2.8 E.12526
G1 X163.799 Y159.635 E.94021
G2 X162.82 Y157.567 I-2.827 J.072 E.06897
; LINE_WIDTH: 0.432235
G1 F9247.026
G2 X162.561 Y157.339 I-3.62 J3.866 E.01093
; LINE_WIDTH: 0.477893
G1 F8276.379
G1 X162.258 Y157.106 E.01355
G1 X160.744 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X161.843 Y157.074 I.02 J4.282 E.03684
G1 X162.081 Y156.765 E.01292
G2 X161.632 Y156.559 I-.426 J.334 E.01703
G3 X160.342 Y155.264 I4.035 J-5.312 E.0608
G1 X157.646 Y155.264 E.08943
G1 X156.827 Y156.159 E.04022
G3 X155.954 Y156.621 I-1.545 J-1.861 E.03302
G1 X155.08 Y156.702 E.0291
G1 X154.644 Y156.559 E.01525
G3 X153.354 Y155.264 I4.036 J-5.312 E.0608
G1 X150.658 Y155.264 E.08943
G1 X149.839 Y156.159 E.04022
G3 X148.965 Y156.621 I-1.545 J-1.861 E.03302
G1 X148.092 Y156.702 E.0291
G1 X147.655 Y156.559 E.01525
G3 X146.365 Y155.264 I4.036 J-5.312 E.0608
G1 X143.669 Y155.264 E.08943
G1 X142.851 Y156.159 E.04022
G3 X141.977 Y156.621 I-1.545 J-1.861 E.03302
G1 X141.104 Y156.702 E.0291
G1 X140.667 Y156.559 E.01525
G3 X139.377 Y155.264 I4.035 J-5.312 E.0608
G1 X136.681 Y155.264 E.08943
G1 X135.862 Y156.159 E.04022
G3 X134.989 Y156.621 I-1.545 J-1.861 E.03302
G1 X134.115 Y156.702 E.0291
G1 X133.678 Y156.559 E.01525
G3 X132.389 Y155.264 I4.036 J-5.312 E.0608
G1 X129.692 Y155.264 E.08943
G1 X128.874 Y156.159 E.04022
G3 X128 Y156.621 I-1.545 J-1.861 E.03302
G1 X127.127 Y156.702 E.0291
G1 X126.69 Y156.559 E.01525
G3 X125.4 Y155.264 I4.035 J-5.312 E.0608
G1 X122.704 Y155.264 E.08943
G1 X121.885 Y156.159 E.04022
G3 X121.012 Y156.621 I-1.545 J-1.861 E.03302
G1 X120.138 Y156.702 E.0291
G1 X119.702 Y156.559 E.01525
G3 X118.412 Y155.264 I4.036 J-5.312 E.0608
G1 X115.716 Y155.264 E.08943
G1 X114.897 Y156.159 E.04022
G3 X114.023 Y156.621 I-1.545 J-1.861 E.03302
G1 X113.15 Y156.702 E.0291
G1 X112.713 Y156.559 E.01525
G3 X111.423 Y155.264 I4.035 J-5.312 E.0608
G1 X108.727 Y155.264 E.08943
G1 X107.909 Y156.159 E.04022
G3 X107.035 Y156.621 I-1.545 J-1.861 E.03302
G1 X106.162 Y156.702 E.0291
G1 X105.725 Y156.559 E.01525
G3 X104.435 Y155.264 I4.036 J-5.312 E.0608
G1 X101.739 Y155.264 E.08943
G1 X100.92 Y156.159 E.04022
G3 X100.047 Y156.621 I-1.545 J-1.861 E.03302
G1 X99.173 Y156.702 E.0291
G1 X98.736 Y156.559 E.01525
G3 X97.447 Y155.264 I4.036 J-5.312 E.0608
G1 X95.818 Y155.264 E.05401
G1 X94.988 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417478
G1 F9611.34
G1 X82.723 Y154.9 E.37434
G3 X79.283 Y152.431 I-.018 J-3.606 E.13811
G1 X79.171 Y152.008 E.01336
G1 X79.132 Y151.776 E.0072
G1 X79.1 Y151.277 E.01525
G1 X79.1 Y60.723 E2.76386
G3 X81.568 Y57.283 I3.608 J-.016 E.13809
G1 X81.992 Y57.171 E.01337
G1 X82.224 Y57.132 E.0072
G1 X82.723 Y57.1 E.01525
G1 X173.277 Y57.1 E2.76386
G3 X174.916 Y57.484 I.008 J3.654 E.05183
G1 X175.295 Y57.703 E.01338
G1 X175.487 Y57.84 E.00719
G1 X175.841 Y58.15 E.01437
G1 X176.156 Y58.508 E.01456
G1 X176.415 Y58.895 E.01419
G1 X176.626 Y59.322 E.01455
G1 X176.777 Y59.768 E.01438
G1 X176.869 Y60.23 E.01437
G1 X176.899 Y60.68 E.01374
G1 X176.9 Y151.277 E2.76519
G3 X175.076 Y154.43 I-3.598 J.023 E.11658
G1 X174.678 Y154.626 E.01355
G1 X174.237 Y154.776 E.01419
G1 X173.776 Y154.868 E.01437
G1 X173.529 Y154.892 E.00756
G1 X161.012 Y154.9 E.38204
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.34
G1 X163.012 Y154.899 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/60
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z2.6 I-1.216 J-.058 P1  F30000
G1 X161.138 Y194.106 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00305
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.678 E1.06378
G3 X94.954 Y157.284 I2.44 J.046 E.12331
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.045 J2.415 E.12286
G1 X163.416 Y191.746 E1.06458
G3 X161.494 Y194.065 I-2.423 J-.053 E.1078
G1 X161.197 Y194.099 E.0099
G1 X161.092 Y193.703 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00196
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.684 E1.06313
G3 X94.967 Y157.691 I2.029 J.036 E.1028
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.055 J2.032 E.10221
G1 X163.009 Y191.733 E1.0637
G3 X161.408 Y193.667 I-2.015 J-.039 E.08989
G1 X161.152 Y193.696 E.00856
G1 X161.047 Y193.299 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00091
G1 X94.98 Y193.302 E2.19066
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.691 E1.06247
G3 X94.98 Y158.098 I1.618 J.026 E.08229
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.038 J1.62 E.08193
G1 X162.602 Y191.72 E1.06281
G3 X161.322 Y193.269 I-1.608 J-.025 E.07199
G1 X161.107 Y193.293 E.00718
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.697 E.98359
G3 X94.993 Y158.49 I1.223 J.016 E.05793
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05606
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z2.8 F30000
G1 X95.016 Y194.884 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.292 J.028 E.07907
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17223
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.629 I-2.386 J2.172 E.07609
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21772
G1 X94.299 Y194.805 E-.07921
G1 X93.9 Y194.687 E-.15815
G1 X93.707 Y194.608 E-.07924
G1 X93.339 Y194.415 E-.15816
G1 X93.193 Y194.312 E-.06752
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z2.8 F30000
G1 X82.644 Y154.506 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.479 E.01204
G3 X79.491 Y151.317 I.438 J-3.199 E.15246
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.229 J.037 E.16583
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.704 Y154.509 E3.00581
G1 X82.659 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.045 E.01683
G3 X79.898 Y151.31 I.564 J-2.763 E.12719
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.82 J.028 E.14509
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00509
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.019 J-2.426 E.1159
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.426 J.019 E.1159
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.778 Y153.527 E-.17951
G1 X81.361 Y153.304 E-.17957
G1 X80.995 Y153.003 E-.17991
G1 X80.961 Y152.963 E-.02009
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z2.8 F30000
G1 X95.011 Y195.291 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06406
G3 X92.362 Y157.265 I3.71 J.037 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.716 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.531 Y56.717 E3.01249
G3 X177.291 Y60.716 I-.253 J4.005 E.20051
G1 X177.291 Y151.283 E3.00427
G3 X176.997 Y152.799 I-4.48 J-.082 E.05147
G3 X173.284 Y155.291 I-3.704 J-1.508 E.15741
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.616 I-2.687 J2.451 E.08578
G1 X164.589 Y191.788 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.094 E.18114
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.128 J.046 E.0989
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.545 Y56.31 E3.01316
G3 X177.698 Y60.71 I-.268 J4.413 E.22103
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
M73 P33 R29
G3 X164.996 Y159.602 I-2.988 J2.73 E.09546
G1 X164.996 Y191.8 E1.06807
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.002 Y196.09 E0
G3 X90.612 Y191.811 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.531 J.054 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.557 Y55.919 E2.79169
G3 X178.09 Y60.703 I-.282 J4.806 E.22305
G1 X178.09 Y151.297 E2.78368
G3 X177.745 Y153.081 I-5.369 J-.113 E.05611
G3 X173.297 Y156.09 I-4.452 J-1.789 E.17514
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.284 J6.842 E.03422
G3 X165.388 Y159.589 I-3.579 J2.887 E.09011
G1 X165.388 Y191.811 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
M73 P33 R28
G1 X95.002 Y196.09 E-.02285
G1 X94.602 Y196.071 E-.15237
G1 X94.316 Y196.036 E-.10941
G1 X94.034 Y195.982 E-.10924
G1 X93.483 Y195.819 E-.21815
G1 X93.217 Y195.711 E-.10922
G1 X93.126 Y195.663 E-.03876
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.031 Z2.8 F30000
G1 X93.167 Y157.579 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.427909
G1 F9350.918
G3 X93.404 Y157.369 I4.422 J4.76 E.00995
; LINE_WIDTH: 0.474651
G1 F8338.541
G3 X93.743 Y157.1 I5.1 J6.091 E.01521
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.40216
G1 F10021.17
G1 X92.996 Y157.745 E.00698
G2 X92.2 Y159.719 I2.019 J1.962 E.06389
G1 X92.201 Y191.765 E.93809
G2 X95.02 Y194.5 I2.8 J-.066 E.1274
G1 X161.065 Y194.499 E1.93338
G2 X163.799 Y191.753 I-.067 J-2.8 E.12525
G1 X163.799 Y159.635 E.9402
G2 X162.84 Y157.584 I-2.822 J.07 E.0682
; LINE_WIDTH: 0.4285
G1 F9336.595
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.47634
G1 F8306.03
G2 X162.258 Y157.106 I-3.978 J4.798 E.01447
G1 X95.725 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X97.353 Y155.264 E.05401
G1 X98.3 Y156.51 E.05189
G1 X98.736 Y156.839 E.01813
G1 X99.173 Y156.891 E.01459
G2 X100.92 Y156.076 I-.284 J-2.887 E.0652
G1 X101.518 Y155.264 E.03344
G1 X104.342 Y155.264 E.09366
G1 X105.288 Y156.51 E.05189
G1 X105.725 Y156.839 E.01813
G1 X106.162 Y156.891 E.01459
G2 X107.909 Y156.076 I-.284 J-2.887 E.0652
G1 X108.507 Y155.264 E.03344
G1 X111.33 Y155.264 E.09366
G1 X112.276 Y156.51 E.05189
G1 X112.713 Y156.839 E.01813
G1 X113.15 Y156.891 E.01459
G2 X114.897 Y156.076 I-.284 J-2.887 E.0652
G1 X115.495 Y155.264 E.03344
G1 X118.319 Y155.264 E.09366
G1 X119.265 Y156.51 E.05189
G1 X119.702 Y156.839 E.01813
G1 X120.138 Y156.891 E.01459
G2 X121.885 Y156.076 I-.284 J-2.887 E.0652
G1 X122.484 Y155.264 E.03344
G1 X125.307 Y155.264 E.09366
G1 X126.253 Y156.51 E.05189
G1 X126.69 Y156.839 E.01813
G1 X127.127 Y156.891 E.01459
G2 X128.874 Y156.076 I-.284 J-2.887 E.0652
G1 X129.472 Y155.264 E.03344
G1 X132.295 Y155.264 E.09366
G1 X133.242 Y156.51 E.05189
G1 X133.678 Y156.839 E.01813
G1 X134.115 Y156.891 E.01459
G2 X135.862 Y156.076 I-.284 J-2.887 E.0652
G1 X136.46 Y155.264 E.03344
G1 X139.284 Y155.264 E.09366
G1 X140.23 Y156.51 E.05189
G1 X140.667 Y156.839 E.01813
G1 X141.104 Y156.891 E.01459
G2 X142.851 Y156.076 I-.284 J-2.887 E.0652
G1 X143.449 Y155.264 E.03344
G1 X146.272 Y155.264 E.09366
G1 X147.218 Y156.51 E.05189
G1 X147.655 Y156.839 E.01813
G1 X148.092 Y156.891 E.01459
G2 X149.839 Y156.076 I-.284 J-2.887 E.0652
G1 X150.437 Y155.264 E.03344
G1 X153.261 Y155.264 E.09366
G1 X154.207 Y156.51 E.05189
G1 X154.644 Y156.839 E.01813
G1 X155.08 Y156.891 E.01459
G2 X156.827 Y156.076 I-.284 J-2.887 E.0652
G1 X157.426 Y155.264 E.03344
G1 X160.249 Y155.264 E.09366
G1 X161.195 Y156.51 E.05189
G1 X161.632 Y156.839 E.01813
G1 X161.991 Y156.882 E.01199
G1 X162.081 Y156.765 E.0049
G1 X161.04 Y155.712 E.04912
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417477
G1 F9611.352
G1 X173.277 Y154.9 E.37434
G1 X173.541 Y154.892 E.00807
G1 X174.003 Y154.831 E.0142
G1 X174.463 Y154.707 E.01455
G1 X174.683 Y154.623 E.0072
G1 X175.094 Y154.421 E.01399
G1 X175.491 Y154.156 E.01455
G1 X175.85 Y153.841 E.01457
G1 X176.152 Y153.496 E.014
G1 X176.29 Y153.305 E.00719
G1 X176.529 Y152.892 E.01456
G1 X176.711 Y152.451 E.01456
G1 X176.829 Y152.008 E.01399
G1 X176.868 Y151.776 E.0072
G1 X176.9 Y151.277 E.01526
G1 X176.9 Y60.723 E2.76386
G1 X176.868 Y60.224 E.01525
G1 X176.829 Y59.992 E.0072
G1 X176.717 Y59.571 E.01327
G2 X173.277 Y57.1 I-3.423 J1.134 E.13819
G1 X82.723 Y57.1 E2.76386
G1 X82.224 Y57.132 E.01525
G1 X81.992 Y57.171 E.0072
G1 X81.571 Y57.283 E.01328
G2 X79.1 Y60.723 I1.134 J3.423 E.13819
G1 X79.1 Y151.277 E2.76386
G1 X79.132 Y151.776 E.01525
G1 X79.171 Y152.008 E.0072
G1 X79.283 Y152.429 E.01327
G2 X82.723 Y154.9 I3.423 J-1.134 E.13819
G1 X94.987 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.352
G1 X92.987 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/60
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z2.8 I-.608 J1.054 P1  F30000
G1 X161.007 Y194.116 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.044 J-2.414 E.12287
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.415 J.045 E.12287
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.415 J-.045 E.12218
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.032 J-2.008 E.10253
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.033 J.057 E.1022
G1 X161.033 Y157.691 E2.19153
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.032 J-.056 E.10109
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.72 I.019 J-1.602 E.08218
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.621 J.039 E.08192
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.3 I-1.62 J-.038 E.08037
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.032 J-1.235 E.05766
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.225 J.022 E.05779
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.224 J-.021 E.05596
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z3 F30000
G1 X95.016 Y194.884 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.292 J.028 E.07906
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.545 E.12268
G3 X164.182 Y159.629 I-2.439 J2.193 E.07605
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21778
G1 X94.3 Y194.805 E-.07911
G1 X93.9 Y194.687 E-.15826
G1 X93.707 Y194.608 E-.07912
G1 X93.339 Y194.415 E-.15816
G1 X93.193 Y194.312 E-.06756
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z3 F30000
G1 X82.644 Y154.506 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.479 E.01204
G3 X79.491 Y151.317 I.438 J-3.199 E.15246
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.229 J.037 E.16582
G1 X173.322 Y57.491 E3.00667
G3 X176.509 Y60.683 I-.038 J3.225 E.1657
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.704 Y154.509 E3.00581
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.045 E.01683
G3 X79.898 Y151.31 I.564 J-2.763 E.12718
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.82 J.028 E.14509
G1 X173.313 Y57.898 E3.00615
G3 X176.102 Y60.69 I-.027 J2.816 E.14503
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.0051
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.02 J-2.426 E.1159
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.426 J.02 E.1159
G1 X173.305 Y58.29 E2.78414
G3 X175.71 Y60.696 I-.017 J2.422 E.11591
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.2009
G1 X81.778 Y153.527 E-.17953
G1 X81.361 Y153.304 E-.17956
G1 X80.995 Y153.003 E-.17996
G1 X80.961 Y152.963 E-.02006
; WIPE_END
G1 E-.04 F1800
M73 P34 R28
G1 X83.366 Y160.206 Z3 F30000
G1 X95.011 Y195.291 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.71 J.037 E.08898
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.526 Y56.717 E3.01231
G3 X177.291 Y60.716 I-.247 J4.005 E.20068
G1 X177.291 Y151.283 E3.00427
G3 X174.859 Y154.972 I-4 J.009 E.15526
G3 X173.284 Y155.291 I-1.581 J-3.761 E.05367
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.616 I-2.747 J2.475 E.08572
G1 X164.589 Y191.788 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.094 E.18115
G1 X95.071 Y195.291 E2.1899
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.129 J.046 E.0989
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.539 Y56.31 E3.01298
G3 X177.698 Y60.71 I-.262 J4.413 E.2212
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.06031
G3 X164.996 Y159.602 I-3.055 J2.757 E.0954
G1 X164.996 Y191.8 E1.06807
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.002 Y196.09 E0
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.532 J.054 E.10046
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.552 Y55.918 E2.79152
G3 X178.09 Y60.703 I-.276 J4.806 E.22322
G1 X178.09 Y151.297 E2.78368
G3 X177.747 Y153.076 I-5.369 J-.113 E.05594
G3 X173.297 Y156.09 I-4.479 J-1.821 E.17512
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.288 J6.846 E.03423
G3 X165.388 Y159.589 I-3.41 J2.823 E.09024
G1 X165.388 Y191.812 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02284
G1 X94.601 Y196.071 E-.15248
G1 X94.316 Y196.036 E-.10928
G1 X94.034 Y195.982 E-.10925
G1 X93.483 Y195.819 E-.21819
G1 X93.127 Y195.661 E-.14796
; WIPE_END
G1 E-.04 F1800
G1 X93.139 Y188.028 Z3 F30000
G1 X93.188 Y157.56 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431094
G1 F9274.211
G3 X93.421 Y157.354 I4.563 J4.945 E.00985
; LINE_WIDTH: 0.476823
G1 F8296.79
G3 X93.742 Y157.106 I4.086 J4.941 E.01434
G1 X93.188 Y157.56 F30000
; LINE_WIDTH: 0.402164
G1 F10021.046
G2 X92.2 Y159.719 I1.846 J2.15 E.07172
G1 X92.201 Y191.765 E.93811
G2 X95.02 Y194.5 I2.806 J-.072 E.12733
G1 X161.065 Y194.499 E1.93339
G2 X163.799 Y191.753 I-.07 J-2.804 E.12522
G1 X163.799 Y159.635 E.94022
G2 X162.84 Y157.584 I-2.842 J.079 E.06816
; LINE_WIDTH: 0.428511
G1 F9336.329
G1 X162.582 Y157.357 E.01082
; LINE_WIDTH: 0.476351
G1 F8305.823
G2 X162.258 Y157.106 I-4.018 J4.849 E.01446
; WIPE_START
G1 X162.582 Y157.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.417477
G1 F9611.37
G1 X173.277 Y154.9 E.37434
G1 X173.776 Y154.868 E.01525
G1 X174.008 Y154.829 E.00719
G1 X174.426 Y154.718 E.0132
G2 X176.9 Y151.277 I-1.132 J-3.424 E.13828
G1 X176.9 Y60.723 E2.76385
G1 X176.892 Y60.459 E.00808
G1 X176.831 Y59.997 E.0142
G1 X176.711 Y59.549 E.01417
G1 X176.623 Y59.317 E.00757
G1 X176.418 Y58.9 E.01418
G1 X176.16 Y58.513 E.0142
G1 X175.85 Y58.159 E.01437
G1 X175.669 Y57.99 E.00756
G2 X173.277 Y57.1 I-2.378 J2.733 E.07959
G1 X82.723 Y57.1 E2.76386
G1 X82.224 Y57.132 E.01525
G1 X81.774 Y57.221 E.014
G1 X81.537 Y57.293 E.00758
G1 X81.113 Y57.469 E.01399
G1 X80.9 Y57.582 E.00737
G1 X80.695 Y57.71 E.00738
G1 X80.352 Y57.973 E.01319
G2 X79.1 Y60.723 I2.367 J2.737 E.09514
G1 X79.1 Y151.277 E2.76385
G1 X79.132 Y151.776 E.01526
G1 X79.171 Y152.008 E.0072
G1 X79.282 Y152.426 E.01318
G2 X82.723 Y154.9 I3.424 J-1.131 E.13828
G1 X94.988 Y154.9 E.37433
G1 X95.667 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X97.295 Y155.264 E.05401
G1 X97.426 Y155.402 E.00629
G3 X98.206 Y156.936 I-7.05 J4.55 E.05718
G1 X99.623 Y156.936 E.047
G2 X101.342 Y155.264 I-.987 J-2.735 E.08197
G1 X104.283 Y155.264 E.09758
G1 X104.414 Y155.402 E.00629
G3 X105.194 Y156.936 I-7.049 J4.55 E.05718
G1 X106.611 Y156.936 E.047
G2 X108.33 Y155.264 I-.987 J-2.735 E.08197
G1 X111.272 Y155.264 E.09758
G1 X111.403 Y155.402 E.00629
G3 X112.183 Y156.936 I-7.049 J4.55 E.05718
G1 X113.599 Y156.936 E.047
G2 X115.318 Y155.264 I-.987 J-2.735 E.08197
G1 X118.26 Y155.264 E.09758
G1 X118.391 Y155.402 E.00629
G3 X119.171 Y156.936 I-7.05 J4.55 E.05718
G1 X120.588 Y156.936 E.047
G2 X122.307 Y155.264 I-.987 J-2.735 E.08197
G1 X125.249 Y155.264 E.09758
G1 X125.38 Y155.402 E.00629
G3 X126.16 Y156.936 I-7.049 J4.55 E.05718
G1 X127.576 Y156.936 E.047
G2 X129.295 Y155.264 I-.987 J-2.735 E.08197
G1 X132.237 Y155.264 E.09758
G1 X132.368 Y155.402 E.00629
G3 X133.148 Y156.936 I-7.05 J4.55 E.05718
G1 X134.565 Y156.936 E.047
G2 X136.284 Y155.264 I-.987 J-2.735 E.08197
G1 X139.225 Y155.264 E.09758
G1 X139.356 Y155.402 E.00629
G3 X140.136 Y156.936 I-7.049 J4.55 E.05718
G1 X141.553 Y156.936 E.047
G2 X143.272 Y155.264 I-.987 J-2.735 E.08197
G1 X146.214 Y155.264 E.09758
G1 X146.345 Y155.402 E.00629
G3 X147.125 Y156.936 I-7.05 J4.55 E.05718
G1 X148.541 Y156.936 E.047
G2 X150.261 Y155.264 I-.987 J-2.735 E.08197
G1 X153.202 Y155.264 E.09758
G1 X153.333 Y155.402 E.00629
G3 X154.113 Y156.936 I-7.049 J4.55 E.05718
G1 X155.53 Y156.936 E.047
G2 X157.249 Y155.264 I-.987 J-2.735 E.08197
G1 X160.191 Y155.264 E.09758
G1 X160.322 Y155.402 E.00629
G3 X161.103 Y156.938 I-7.062 J4.557 E.05729
G2 X159.475 Y156.936 I-.837 J12.417 E.05405
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X161.103 Y156.938 E-.61873
G1 X160.952 Y156.599 E-.14127
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/60
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z3 I-1.217 J.006 P1  F30000
G1 X161.138 Y194.106 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X161.046 Y194.116 E.00306
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.044 J-2.414 E.12287
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.415 J.045 E.12287
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.045 J2.415 E.12286
G1 X163.416 Y191.746 E1.06458
G3 X161.494 Y194.065 I-2.423 J-.053 E.1078
G1 X161.198 Y194.099 E.00989
G1 X161.092 Y193.703 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00197
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.032 J-2.008 E.10253
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.035 J.059 E.10217
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.056 J2.032 E.10221
G1 X163.009 Y191.733 E1.06369
G3 X161.408 Y193.667 I-2.015 J-.039 E.0899
G1 X161.152 Y193.696 E.00855
G1 X161.047 Y193.299 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00092
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.019 J-1.602 E.08218
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.623 J.041 E.08189
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.038 J1.62 E.08193
G1 X162.602 Y191.72 E1.06281
G3 X161.322 Y193.269 I-1.608 J-.025 E.072
G1 X161.107 Y193.293 E.00718
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.032 J-1.235 E.05766
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.227 J.024 E.05777
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z3.2 F30000
G1 X95.016 Y194.884 Z3.2
M73 P35 R28
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06353
G3 X92.661 Y157.542 I3.287 J.027 E.07907
G1 X95.257 Y154.916 E.12249
G1 X160.742 Y154.916 E2.17224
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.624 I-2.388 J2.173 E.07593
G1 X164.182 Y191.776 E1.06656
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21786
G1 X94.299 Y194.805 E-.07906
G1 X93.9 Y194.686 E-.15828
G1 X93.707 Y194.608 E-.07907
G1 X93.339 Y194.415 E-.15825
G1 X93.193 Y194.312 E-.06748
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z3.2 F30000
G1 X82.644 Y154.506 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.48 E.01204
G3 X79.491 Y151.317 I.434 J-3.196 E.15251
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01683
G3 X79.898 Y151.31 I.56 J-2.76 E.12724
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.0051
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.2009
G1 X81.778 Y153.527 E-.17955
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.004 E-.17951
G1 X80.962 Y152.963 E-.02051
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z3.2 F30000
G1 X95.011 Y195.291 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.08899
G1 X94.314 Y155.291 E.09211
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.52 Y56.717 E3.01213
G3 X177.291 Y60.716 I-.242 J4.005 E.20086
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.612 I-2.688 J2.451 E.08566
G1 X164.589 Y191.788 E1.06735
G3 X161.088 Y195.289 I-3.594 J-.094 E.18114
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.09891
G1 X93.339 Y155.698 E.06022
G1 X82.71 Y155.698 E.35261
M73 P35 R27
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.534 Y56.31 E3.0128
G3 X177.698 Y60.71 I-.256 J4.413 E.22139
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.6 I-2.988 J2.73 E.0954
G1 X164.996 Y191.8 E1.06813
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.602 Y196.07 E.01231
G3 X90.612 Y191.811 I.423 J-4.394 E.19589
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.525 J.052 E.10048
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.547 Y55.918 E2.79136
G3 X178.09 Y60.703 I-.271 J4.807 E.22338
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.288 J6.846 E.03423
G3 X165.388 Y159.589 I-3.57 J2.883 E.0901
G1 X165.388 Y191.812 E.99012
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.602 Y196.07 E-.17505
G1 X94.316 Y196.036 E-.10948
G1 X93.756 Y195.909 E-.21814
G1 X93.483 Y195.819 E-.10914
G1 X93.217 Y195.711 E-.10913
G1 X93.126 Y195.663 E-.03906
; WIPE_END
G1 E-.04 F1800
G1 X93.139 Y188.031 Z3.2 F30000
G1 X93.189 Y157.559 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.430136
G1 F9297.138
G3 X93.409 Y157.365 I4.464 J4.848 E.00925
; LINE_WIDTH: 0.475329
G1 F8325.455
G3 X93.743 Y157.101 I5.184 J6.214 E.01502
G1 X93.189 Y157.559 F30000
; LINE_WIDTH: 0.402163
G1 F10021.077
G2 X92.2 Y159.719 I1.843 J2.15 E.07178
G1 X92.201 Y191.765 E.93811
G2 X95.02 Y194.5 I2.806 J-.072 E.12733
G1 X161.065 Y194.499 E1.93339
G2 X163.799 Y191.753 I-.067 J-2.8 E.12526
G1 X163.799 Y159.635 E.94022
G2 X162.84 Y157.584 I-2.825 J.071 E.06819
; LINE_WIDTH: 0.428536
G1 F9335.729
G1 X162.582 Y157.356 E.01082
; LINE_WIDTH: 0.476371
G1 F8305.453
G2 X162.258 Y157.106 I-4.001 J4.827 E.01446
; WIPE_START
G1 X162.582 Y157.356 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.417475
G1 F9611.412
G1 X173.277 Y154.9 E.37434
G1 X173.77 Y154.869 E.01507
G1 X174.232 Y154.777 E.01437
G1 X174.672 Y154.628 E.0142
G1 X175.095 Y154.421 E.01436
G1 X175.305 Y154.29 E.00757
G1 X175.674 Y154.007 E.01418
M73 P36 R27
G1 X176.007 Y153.673 E.01438
G1 X176.293 Y153.3 E.01436
G1 X176.512 Y152.924 E.01328
G2 X176.9 Y151.277 I-3.262 J-1.638 E.05212
G1 X176.9 Y60.723 E2.76384
G1 X176.892 Y60.459 E.00808
G1 X176.831 Y59.997 E.0142
G1 X176.711 Y59.549 E.01418
G1 X176.623 Y59.317 E.00757
G1 X176.418 Y58.9 E.01418
G1 X176.159 Y58.513 E.0142
G1 X175.85 Y58.159 E.01436
G1 X175.669 Y57.99 E.00755
G2 X173.277 Y57.1 I-2.378 J2.731 E.0796
G1 X82.723 Y57.1 E2.76384
G1 X82.224 Y57.132 E.01525
G1 X81.992 Y57.171 E.0072
G1 X81.577 Y57.281 E.01309
G2 X79.1 Y60.723 I1.131 J3.426 E.13836
G1 X79.1 Y151.277 E2.76384
G1 X79.108 Y151.541 E.00807
G1 X79.168 Y151.996 E.014
G1 X79.291 Y152.457 E.01456
G1 X79.474 Y152.898 E.01455
G1 X79.703 Y153.295 E.014
G1 X79.84 Y153.487 E.00719
G1 X80.154 Y153.845 E.01456
G1 X80.509 Y154.156 E.01438
G1 X80.905 Y154.421 E.01456
G1 X81.317 Y154.623 E.014
G1 X81.537 Y154.707 E.00719
G1 X81.998 Y154.831 E.01456
G1 X82.459 Y154.892 E.01419
G1 X82.723 Y154.9 E.00807
G1 X94.987 Y154.9 E.37432
G1 X95.667 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X97.295 Y155.264 E.05401
G3 X97.767 Y156.936 I-2.174 J1.516 E.05868
G1 X99.931 Y156.936 E.07179
G2 X101.159 Y155.264 I-1.424 J-2.333 E.07055
G1 X104.283 Y155.264 E.10365
G3 X104.755 Y156.936 I-2.174 J1.516 E.05868
G1 X106.919 Y156.936 E.07179
G2 X108.147 Y155.264 I-1.424 J-2.333 E.07055
G1 X111.272 Y155.264 E.10365
G3 X111.744 Y156.936 I-2.174 J1.516 E.05868
G1 X113.908 Y156.936 E.07179
G2 X115.135 Y155.264 I-1.424 J-2.333 E.07055
G1 X118.26 Y155.264 E.10365
G3 X118.732 Y156.936 I-2.174 J1.516 E.05868
G1 X120.896 Y156.936 E.07179
G2 X122.124 Y155.264 I-1.424 J-2.333 E.07055
G1 X125.249 Y155.264 E.10365
G3 X125.72 Y156.936 I-2.174 J1.516 E.05868
G1 X127.885 Y156.936 E.07179
G2 X129.112 Y155.264 I-1.424 J-2.333 E.07055
G1 X132.237 Y155.264 E.10365
G3 X132.709 Y156.936 I-2.174 J1.516 E.05868
G1 X134.873 Y156.936 E.07179
G2 X136.101 Y155.264 I-1.424 J-2.333 E.07055
G1 X139.225 Y155.264 E.10365
G3 X139.697 Y156.936 I-2.174 J1.516 E.05868
G1 X141.861 Y156.936 E.07179
G2 X143.089 Y155.264 I-1.424 J-2.333 E.07055
G1 X146.214 Y155.264 E.10365
G3 X146.686 Y156.936 I-2.174 J1.516 E.05868
G1 X148.85 Y156.936 E.07179
G2 X150.077 Y155.264 I-1.424 J-2.333 E.07055
G1 X153.202 Y155.264 E.10365
G3 X153.674 Y156.936 I-2.174 J1.516 E.05868
G1 X155.838 Y156.936 E.07179
G2 X157.066 Y155.264 I-1.424 J-2.333 E.07055
G1 X160.191 Y155.264 E.10365
G3 X160.662 Y156.936 I-2.174 J1.516 E.05868
G1 X159.034 Y156.936 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X160.662 Y156.936 E-.61876
G1 X160.672 Y156.564 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/60
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z3.2 I-1.217 J.011 P1  F30000
G1 X161.007 Y194.116 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.415 J.046 E.12286
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.05 J2.42 E.12279
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12208
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.032 J.056 E.10221
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.036 J2.012 E.10246
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.015 J-.039 E.1013
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19023
G3 X93.398 Y191.72 I.026 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.62 J.038 E.08193
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.023 J1.605 E.08213
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08053
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.0579
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.01 J1.213 E.05794
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05606
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z3.4 F30000
G1 X95.016 Y194.884 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.01 J-3.189 E.16378
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.027 E.07907
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17223
G1 X163.343 Y157.545 E.12267
G3 X164.182 Y159.629 I-2.386 J2.172 E.0761
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.2178
G1 X94.3 Y194.805 E-.07904
G1 X93.9 Y194.686 E-.15832
G1 X93.52 Y194.517 E-.15814
G1 X93.339 Y194.415 E-.0791
G1 X93.193 Y194.312 E-.06759
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z3.4 F30000
G1 X82.644 Y154.506 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01204
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00581
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01683
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.0051
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.2009
G1 X81.776 Y153.526 E-.18003
G1 X81.36 Y153.303 E-.17949
G1 X80.996 Y153.004 E-.17908
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z3.4 F30000
G1 X95.011 Y195.291 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.596 E.18445
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.515 Y56.717 E3.01195
G3 X177.291 Y60.716 I-.219 J3.989 E.20126
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.616 I-2.687 J2.451 E.08579
G1 X164.589 Y191.788 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.094 E.18114
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.003 E.20511
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.528 Y56.31 E3.01262
G3 X177.698 Y60.71 I-.232 J4.396 E.2218
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.06029
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.996 Y191.8 E1.06807
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.602 Y196.071 E.01231
G3 X90.612 Y191.812 I.404 J-4.377 E.19612
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X78.305 Y153.199 I.004 J-4.798 E.17121
G3 X77.91 Y151.297 I4.472 J-1.92 E.0601
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.541 Y55.918 E2.79119
G3 X178.09 Y60.703 I-.245 J4.787 E.22379
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.287 J6.845 E.03423
G3 X165.388 Y159.589 I-3.578 J2.886 E.09011
M73 P37 R27
G1 X165.388 Y191.811 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.602 Y196.071 E-.17504
G1 X94.316 Y196.036 E-.10953
G1 X94.034 Y195.982 E-.10907
G1 X93.483 Y195.819 E-.21823
G1 X93.127 Y195.661 E-.14813
; WIPE_END
G1 E-.04 F1800
G1 X93.153 Y188.028 Z3.4 F30000
G1 X93.259 Y157.495 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402174
G1 F10020.782
G2 X92.2 Y159.719 I1.796 J2.219 E.07457
G1 X92.201 Y191.765 E.93813
G2 X95.02 Y194.5 I2.8 J-.066 E.12741
G1 X161.065 Y194.499 E1.93345
G2 X163.799 Y191.753 I-.067 J-2.8 E.12526
G1 X163.799 Y159.635 E.94024
G2 X162.828 Y157.573 I-2.844 J.08 E.06865
; LINE_WIDTH: 0.429666
G1 F9308.437
G1 X162.582 Y157.356 E.01033
; LINE_WIDTH: 0.476387
G1 F8305.139
G2 X162.258 Y157.106 I-3.993 J4.818 E.01445
G1 X161.936 Y156.953 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.843 Y157.074 E.00506
G2 X160.384 Y156.936 I-1.171 J4.599 E.04882
G2 X160.193 Y155.264 I-2.082 J-.608 E.05729
G1 X156.938 Y155.264 E.10798
G3 X156.023 Y156.936 I-2.436 J-.248 E.06491
G1 X153.395 Y156.936 E.08715
G2 X153.204 Y155.264 I-2.082 J-.608 E.05729
G1 X149.949 Y155.264 E.10798
G3 X149.034 Y156.936 I-2.435 J-.247 E.06491
G1 X146.407 Y156.936 E.08715
G2 X146.216 Y155.264 I-2.082 J-.608 E.05729
G1 X142.961 Y155.264 E.10798
G3 X142.046 Y156.936 I-2.436 J-.248 E.06491
G1 X139.419 Y156.936 E.08715
G2 X139.228 Y155.264 I-2.082 J-.608 E.05729
G1 X135.972 Y155.264 E.10798
G3 X135.057 Y156.936 I-2.435 J-.247 E.06491
G1 X132.43 Y156.936 E.08715
G2 X132.239 Y155.264 I-2.082 J-.608 E.05729
G1 X128.984 Y155.264 E.10798
G3 X128.069 Y156.936 I-2.435 J-.247 E.06491
G1 X125.442 Y156.936 E.08715
G2 X125.251 Y155.264 I-2.082 J-.608 E.05729
G1 X121.996 Y155.264 E.10798
G3 X121.08 Y156.936 I-2.436 J-.248 E.06491
G1 X118.453 Y156.936 E.08715
G2 X118.262 Y155.264 I-2.082 J-.608 E.05729
G1 X115.007 Y155.264 E.10798
G3 X114.092 Y156.936 I-2.435 J-.247 E.06491
G1 X111.465 Y156.936 E.08715
G2 X111.274 Y155.264 I-2.082 J-.608 E.05729
G1 X108.019 Y155.264 E.10798
G3 X107.104 Y156.936 I-2.436 J-.248 E.06491
G1 X104.477 Y156.936 E.08715
G2 X104.285 Y155.264 I-2.082 J-.608 E.05729
G1 X101.03 Y155.264 E.10798
G3 X100.115 Y156.936 I-2.435 J-.247 E.06491
G1 X97.488 Y156.936 E.08715
G2 X97.297 Y155.264 I-2.082 J-.608 E.05729
G1 X95.669 Y155.264 E.05401
G1 X94.987 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417477
G1 F9611.376
G1 X82.723 Y154.9 E.37433
G3 X79.28 Y152.42 I-.016 J-3.608 E.13845
G1 X79.171 Y152.009 E.013
G1 X79.132 Y151.776 E.0072
G1 X79.1 Y151.277 E.01525
G1 X79.1 Y60.723 E2.76385
G3 X81.58 Y57.28 I3.608 J-.016 E.13846
G1 X81.991 Y57.171 E.01299
G1 X82.224 Y57.132 E.00721
G1 X82.723 Y57.1 E.01525
G1 X173.277 Y57.1 E2.76385
G3 X175.521 Y57.869 I.023 J3.593 E.07379
G1 X175.845 Y58.154 E.01319
G1 X176.152 Y58.504 E.01419
G1 X176.297 Y58.705 E.00756
G1 X176.529 Y59.108 E.01419
G1 X176.709 Y59.543 E.01437
G1 X176.829 Y59.992 E.01418
G1 X176.892 Y60.459 E.01438
G1 X176.9 Y60.723 E.00808
G1 X176.9 Y151.277 E2.76385
G3 X173.776 Y154.867 I-3.598 J.023 E.15873
G1 X173.277 Y154.9 E.01525
G1 X161.012 Y154.9 E.37433
; WIPE_START
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.385 Y155.167 Z3.4 F30000
G1 X93.878 Y157.324 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.404115
G1 F9966.919
G1 X93.613 Y157.256 E.00808
; LINE_WIDTH: 0.439742
G1 F9072.083
G1 X93.587 Y157.25 E.00086
; LINE_WIDTH: 0.475889
G1 F8314.687
G1 X93.561 Y157.244 E.00094
G1 X93.424 Y157.353 E.00618
; LINE_WIDTH: 0.43725
G1 F9129.421
G1 X93.259 Y157.495 E.00699
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9129.421
G1 X93.424 Y157.353 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/60
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z3.4 I-.581 J1.07 P1  F30000
G1 X161.122 Y194.107 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.024 Y194.116 E.00328
G1 X94.976 Y194.116 E2.19092
G3 X92.584 Y191.746 I.03 J-2.422 E.12351
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.443 J.073 E.1225
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.071 J2.44 E.12253
G1 X163.416 Y191.724 E1.06383
G3 X161.471 Y194.069 I-2.422 J-.029 E.10931
G1 X161.182 Y194.1 E.00965
G1 X161.083 Y193.703 F30000
G1 F8843.478
G1 X161.017 Y193.709 E.00221
G1 X94.983 Y193.709 E2.19046
G3 X92.991 Y191.733 I.023 J-2.015 E.10296
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.032 J.055 E.10221
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.054 J2.03 E.10223
G1 X163.009 Y191.717 E1.06316
G3 X161.392 Y193.67 I-2.015 J-.022 E.09097
G1 X161.143 Y193.696 E.0083
G1 X161.044 Y193.299 F30000
G1 F8843.478
G1 X161.01 Y193.302 E.00113
G1 X94.99 Y193.302 E2.19001
G3 X93.398 Y191.72 I.016 J-1.608 E.08241
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.62 J.038 E.08193
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.037 J1.619 E.08194
G1 X162.602 Y191.71 E1.06249
G3 X161.312 Y193.27 I-1.607 J-.015 E.07264
G1 X161.104 Y193.292 E.00696
M204 S250
G1 X161.006 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.004 Y192.91 E.00008
G1 X94.996 Y192.91 E2.02821
G3 X93.79 Y191.707 I.009 J-1.215 E.05801
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.704 E.98359
G3 X161.236 Y192.886 I-1.215 J-.009 E.05093
G1 X161.066 Y192.904 E.00525
; WIPE_START
M204 S10000
G1 X161.004 Y192.91 E-.0238
G1 X159.066 Y192.91 E-.7362
; WIPE_END
G1 E-.04 F1800
G1 X151.437 Y193.145 Z3.6 F30000
G1 X95.016 Y194.884 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.009 J-3.189 E.16377
G1 X91.816 Y159.715 E1.06352
G3 X92.659 Y157.544 I3.295 J.029 E.07896
G1 X95.258 Y154.916 E.12261
G1 X160.742 Y154.916 E2.17223
G1 X163.34 Y157.543 E.12254
G3 X164.182 Y159.629 I-2.382 J2.175 E.07624
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21782
G1 X94.299 Y194.805 E-.07907
G1 X93.9 Y194.686 E-.15827
G1 X93.52 Y194.517 E-.15812
G1 X93.338 Y194.415 E-.07924
G1 X93.193 Y194.312 E-.06748
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z3.6 F30000
G1 X82.643 Y154.506 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.48 E.01204
G3 X79.491 Y151.317 I.434 J-3.196 E.15251
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.23 J.038 E.16581
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
M73 P37 R26
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.15 Y154.045 E.01695
G3 X79.898 Y151.31 I.564 J-2.759 E.1271
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.821 J.029 E.14507
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00511
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.427 J.02 E.11589
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.228 Y153.664 E-.20145
G1 X81.776 Y153.526 E-.17954
G1 X81.361 Y153.304 E-.17898
G1 X80.996 Y153.004 E-.17953
G1 X80.962 Y152.963 E-.02049
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z3.6 F30000
G1 X95.011 Y195.291 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.597 E.18444
G1 X91.409 Y159.711 E1.06407
G3 X92.36 Y157.267 I3.713 J.038 E.08891
G1 X94.315 Y155.291 E.0922
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.51 Y56.717 E3.01177
G3 X177.291 Y60.717 I-.213 J3.989 E.20143
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.006 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.639 Y157.266 E.09214
G3 X164.589 Y159.615 I-2.684 J2.453 E.08588
G1 X164.589 Y191.788 E1.06723
M73 P38 R26
G3 X161.088 Y195.289 I-3.594 J-.094 E.18115
G1 X95.071 Y195.291 E2.1899
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20511
G1 X91.002 Y159.706 E1.06461
G3 X92.062 Y156.99 I4.131 J.047 E.09886
G1 X93.34 Y155.698 E.06027
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.523 Y56.31 E3.01244
G3 X177.698 Y60.71 I-.226 J4.396 E.22198
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.937 Y156.989 E.06024
G3 X164.996 Y159.602 I-2.986 J2.731 E.09553
G1 X164.996 Y191.8 E1.06807
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.601 Y196.071 E.01232
G3 X90.612 Y191.812 I.405 J-4.378 E.1961
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.723 I4.533 J.055 E.10045
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.536 Y55.918 E2.79102
G3 X178.09 Y60.703 I-.239 J4.787 E.22395
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.403 Y156.927 I-5.976 J6.537 E.03568
G3 X165.388 Y159.589 I-3.615 J2.851 E.08866
G1 X165.388 Y191.812 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.601 Y196.071 E-.17517
G1 X94.316 Y196.036 E-.10942
G1 X94.034 Y195.982 E-.10907
G1 X93.483 Y195.819 E-.21822
G1 X93.217 Y195.711 E-.10921
G1 X93.126 Y195.663 E-.03892
; WIPE_END
G1 E-.04 F1800
G1 X93.048 Y188.031 Z3.6 F30000
G1 X92.741 Y158.047 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402176
G1 F10020.721
G1 X92.652 Y158.177 E.00461
G2 X92.2 Y159.719 I2.377 J1.534 E.04772
G1 X92.201 Y191.765 E.93813
G2 X95.02 Y194.5 I2.8 J-.066 E.12741
G1 X161.033 Y194.499 E1.93253
G2 X163.799 Y191.727 I-.041 J-2.807 E.12686
G1 X163.799 Y159.635 E.93949
G2 X162.715 Y157.472 I-2.872 J.086 E.0731
; LINE_WIDTH: 0.444131
G1 F8972.843
G2 X162.54 Y157.323 I-3.154 J3.536 E.00752
; LINE_WIDTH: 0.482564
G1 F8188.446
G1 X162.251 Y157.1 E.01307
G1 X161.783 Y157.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X160.167 Y156.936 I-1.208 J5.413 E.05392
G2 X160.214 Y155.264 I-1.83 J-.887 E.05715
G1 X156.886 Y155.264 E.11039
G1 X156.847 Y155.7 E.01452
G1 X156.536 Y156.495 E.02831
G1 X156.138 Y156.936 E.0197
G1 X153.179 Y156.936 E.09815
G2 X153.226 Y155.264 I-1.83 J-.887 E.05715
G1 X149.898 Y155.264 E.11039
G1 X149.859 Y155.7 E.01452
G1 X149.548 Y156.495 E.02831
G1 X149.149 Y156.936 E.0197
G1 X146.191 Y156.936 E.09815
G2 X146.237 Y155.264 I-1.83 J-.887 E.05715
G1 X142.91 Y155.264 E.11039
G1 X142.87 Y155.7 E.01452
G1 X142.56 Y156.495 E.02831
G1 X142.161 Y156.936 E.0197
G1 X139.202 Y156.936 E.09815
G2 X139.249 Y155.264 I-1.83 J-.887 E.05715
G1 X135.921 Y155.264 E.11039
G1 X135.882 Y155.7 E.01452
G1 X135.571 Y156.495 E.02831
G1 X135.173 Y156.936 E.0197
G1 X132.214 Y156.936 E.09815
G2 X132.261 Y155.264 I-1.83 J-.887 E.05715
G1 X128.933 Y155.264 E.11039
G1 X128.894 Y155.7 E.01452
G1 X128.583 Y156.495 E.02831
G1 X128.184 Y156.936 E.0197
G1 X125.225 Y156.936 E.09815
G2 X125.272 Y155.264 I-1.83 J-.887 E.05715
G1 X121.944 Y155.264 E.11039
G1 X121.905 Y155.7 E.01452
G1 X121.594 Y156.495 E.02831
G1 X121.196 Y156.936 E.0197
G1 X118.237 Y156.936 E.09815
G2 X118.284 Y155.264 I-1.83 J-.887 E.05715
G1 X114.956 Y155.264 E.11039
G1 X114.917 Y155.7 E.01452
G1 X114.606 Y156.495 E.02831
G1 X114.207 Y156.936 E.0197
G1 X111.249 Y156.936 E.09815
G2 X111.295 Y155.264 I-1.83 J-.887 E.05715
G1 X107.968 Y155.264 E.11039
G1 X107.928 Y155.7 E.01452
G1 X107.618 Y156.495 E.02831
G1 X107.219 Y156.936 E.0197
G1 X104.26 Y156.936 E.09815
G2 X104.307 Y155.264 I-1.83 J-.887 E.05715
G1 X100.979 Y155.264 E.11039
G1 X100.94 Y155.7 E.01452
G1 X100.629 Y156.495 E.02831
G1 X100.231 Y156.936 E.0197
G1 X97.272 Y156.936 E.09815
G2 X97.319 Y155.264 I-1.83 J-.887 E.05715
G1 X95.69 Y155.264 E.05401
G1 X94.988 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.41748
G1 F9611.295
G1 X82.723 Y154.9 E.37434
G3 X81.071 Y154.509 I-.004 J-3.667 E.05229
G1 X80.705 Y154.297 E.01291
G1 X80.513 Y154.16 E.0072
G1 X80.159 Y153.85 E.01437
G1 X79.844 Y153.491 E.01456
G1 X79.586 Y153.105 E.01418
G1 X79.374 Y152.678 E.01455
G1 X79.223 Y152.232 E.01438
G1 X79.131 Y151.77 E.01437
G1 X79.101 Y151.32 E.01375
G1 X79.1 Y60.723 E2.7652
G3 X81.583 Y57.279 I3.607 J-.016 E.13854
G1 X81.991 Y57.171 E.01291
G1 X82.23 Y57.131 E.00738
G1 X82.723 Y57.1 E.01508
G1 X173.277 Y57.1 E2.76387
G3 X175.524 Y57.87 I.013 J3.624 E.07386
G1 X175.845 Y58.154 E.0131
G1 X176.152 Y58.504 E.01419
G1 X176.297 Y58.705 E.00757
G1 X176.529 Y59.108 E.01419
G1 X176.709 Y59.543 E.01436
G1 X176.829 Y59.992 E.01419
G1 X176.892 Y60.459 E.01437
G1 X176.9 Y60.723 E.00808
G1 X176.9 Y151.277 E2.76387
G3 X175.063 Y154.437 I-3.597 J.024 E.11703
G1 X174.678 Y154.626 E.01309
G1 X174.237 Y154.776 E.0142
G1 X173.808 Y154.863 E.01338
G1 X173.529 Y154.892 E.00856
G1 X161.012 Y154.9 E.38204
; WIPE_START
G1 X163.012 Y154.899 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.385 Y155.166 Z3.6 F30000
G1 X93.878 Y157.324 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.404335
G1 F9960.849
G1 X93.613 Y157.256 E.00808
; LINE_WIDTH: 0.439903
G1 F9068.407
G1 X93.587 Y157.25 E.00086
; LINE_WIDTH: 0.472429
G1 F8381.681
G1 X93.561 Y157.244 E.00093
G1 X93.398 Y157.374 E.00729
; LINE_WIDTH: 0.410347
G1 F9797.881
G2 X92.741 Y158.047 I2.365 J2.967 E.02824
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9797.881
G1 X92.994 Y157.748 E-.31584
G1 X93.398 Y157.374 E-.44416
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/60
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z3.6 I-.581 J1.069 P1  F30000
G1 X161.007 Y194.116 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.44 J.07 E.12253
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.071 J2.44 E.12253
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12208
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.029 J.053 E.10225
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.054 J2.03 E.10224
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.618 J.036 E.08196
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.037 J1.619 E.08194
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08053
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.222 J.019 E.05782
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z3.8 F30000
G1 X95.016 Y194.884 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.16361
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.295 J.029 E.07907
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17222
G1 X163.339 Y157.542 E.12251
G3 X164.182 Y159.629 I-2.381 J2.175 E.07626
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21773
G1 X94.299 Y194.805 E-.07926
G1 X93.9 Y194.686 E-.15819
G1 X93.707 Y194.608 E-.07911
G1 X93.338 Y194.414 E-.15826
G1 X93.193 Y194.312 E-.06744
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z3.8 F30000
G1 X82.643 Y154.506 Z3.8
G1 Z3.4
M73 P39 R26
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01204
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01682
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00511
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20092
G1 X81.778 Y153.527 E-.17951
G1 X81.361 Y153.304 E-.17952
G1 X80.996 Y153.004 E-.17955
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z3.8 F30000
G1 X95.011 Y195.291 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.713 J.038 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X80.317 Y154.499 I.038 J-4.145 E.08517
G3 X78.709 Y151.283 I2.396 J-3.208 E.12368
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.504 Y56.716 E3.01159
G3 X177.291 Y60.717 I-.207 J3.989 E.20162
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.006 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.638 Y157.265 E.09212
G3 X164.589 Y159.615 I-2.683 J2.453 E.0859
G1 X164.589 Y191.788 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.094 E.18114
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.131 J.047 E.0989
G1 X93.34 Y155.698 E.06022
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.517 Y56.309 E3.01226
G3 X177.698 Y60.71 I-.221 J4.396 E.22216
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.937 Y156.989 E.06023
G3 X164.996 Y159.602 I-2.986 J2.731 E.09553
G1 X164.996 Y191.8 E1.06807
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.811 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.534 J.055 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.53 Y55.918 E2.79085
G3 X178.09 Y60.703 I-.233 J4.787 E.22412
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.413 Y156.94 I-5.917 J6.479 E.03619
G3 X165.388 Y159.589 I-3.629 J2.839 E.08815
G1 X165.388 Y191.811 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02282
G1 X94.601 Y196.071 E-.15253
G1 X94.316 Y196.036 E-.10926
G1 X94.034 Y195.982 E-.10923
G1 X93.483 Y195.819 E-.2182
G1 X93.127 Y195.661 E-.14795
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.028 Z3.8 F30000
G1 X93.167 Y157.579 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428124
G1 F9345.716
G3 X93.407 Y157.367 I4.375 J4.707 E.01005
; LINE_WIDTH: 0.474546
G1 F8340.566
G3 X93.74 Y157.103 I4.872 J5.83 E.01494
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402177
G1 F10020.694
G1 X92.998 Y157.744 E.00693
G2 X92.2 Y159.719 I2.017 J1.963 E.06396
G1 X92.201 Y191.765 E.93813
G2 X95.02 Y194.5 I2.8 J-.066 E.12741
G1 X161.065 Y194.499 E1.93347
G2 X163.799 Y191.753 I-.067 J-2.8 E.12526
G1 X163.799 Y159.635 E.94025
G2 X162.716 Y157.472 I-2.872 J.086 E.07308
; LINE_WIDTH: 0.444092
G1 F8973.716
G2 X162.54 Y157.323 I-3.119 J3.494 E.00754
; LINE_WIDTH: 0.482592
G1 F8187.93
G1 X162.251 Y157.1 E.01307
G1 X161.609 Y157.002 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X159.986 Y156.936 I-1.151 J8.183 E.05398
G2 X160.253 Y155.264 I-1.703 J-1.129 E.05788
G1 X156.812 Y155.264 E.11415
G3 X156.338 Y156.936 I-2.115 J.303 E.05933
G1 X152.998 Y156.936 E.11082
G2 X153.265 Y155.264 I-1.703 J-1.129 E.05788
G1 X149.824 Y155.264 E.11415
G3 X149.35 Y156.936 I-2.115 J.303 E.05933
G1 X146.009 Y156.936 E.11082
G2 X146.276 Y155.264 I-1.703 J-1.129 E.05788
G1 X142.835 Y155.264 E.11415
G3 X142.361 Y156.936 I-2.115 J.303 E.05933
G1 X139.021 Y156.936 E.11082
G2 X139.288 Y155.264 I-1.703 J-1.129 E.05788
G1 X135.847 Y155.264 E.11415
G3 X135.373 Y156.936 I-2.115 J.303 E.05933
G1 X132.032 Y156.936 E.11082
M73 P40 R26
G2 X132.3 Y155.264 I-1.703 J-1.129 E.05788
G1 X128.858 Y155.264 E.11415
G3 X128.385 Y156.936 I-2.115 J.303 E.05933
G1 X125.044 Y156.936 E.11082
G2 X125.311 Y155.264 I-1.703 J-1.129 E.05788
G1 X121.87 Y155.264 E.11415
G3 X121.396 Y156.936 I-2.115 J.303 E.05933
G1 X118.056 Y156.936 E.11082
G2 X118.323 Y155.264 I-1.703 J-1.129 E.05788
G1 X114.882 Y155.264 E.11415
G3 X114.408 Y156.936 I-2.115 J.303 E.05933
G1 X111.067 Y156.936 E.11082
G2 X111.334 Y155.264 I-1.703 J-1.129 E.05788
G1 X107.893 Y155.264 E.11415
G3 X107.419 Y156.936 I-2.115 J.303 E.05933
G1 X104.079 Y156.936 E.11082
G2 X104.346 Y155.264 I-1.703 J-1.129 E.05788
G1 X100.905 Y155.264 E.11415
G3 X100.431 Y156.936 I-2.115 J.303 E.05933
G1 X97.09 Y156.936 E.11082
G2 X97.358 Y155.264 I-1.703 J-1.129 E.05788
G1 X95.729 Y155.264 E.05401
G1 X94.988 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417475
G1 F9611.414
G1 X82.723 Y154.9 E.37433
G1 X82.459 Y154.892 E.00807
M73 P40 R25
G1 X81.997 Y154.831 E.0142
G1 X81.537 Y154.707 E.01455
G1 X81.317 Y154.623 E.00719
G1 X80.905 Y154.42 E.014
G1 X80.508 Y154.156 E.01455
G1 X80.154 Y153.845 E.01437
G1 X79.84 Y153.487 E.01455
G1 X79.703 Y153.295 E.0072
G1 X79.474 Y152.898 E.01399
G1 X79.291 Y152.457 E.01456
G1 X79.168 Y151.997 E.01454
G1 X79.108 Y151.541 E.01401
G1 X79.1 Y151.277 E.00807
G1 X79.1 Y60.723 E2.76384
G3 X79.872 Y58.474 I3.591 J-.024 E.07398
G1 X80.155 Y58.154 E.01301
G1 X80.504 Y57.848 E.01418
G1 X80.705 Y57.704 E.00756
G1 X81.108 Y57.471 E.01419
G1 X81.543 Y57.291 E.01437
G1 X81.991 Y57.171 E.01418
G1 X82.459 Y57.108 E.01439
G1 X82.723 Y57.1 E.00807
G1 X173.277 Y57.1 E2.76384
G3 X175.526 Y57.872 I.013 J3.624 E.07394
G1 X175.846 Y58.155 E.01302
G1 X176.152 Y58.504 E.01418
G1 X176.297 Y58.705 E.00757
G1 X176.529 Y59.108 E.01419
G1 X176.709 Y59.543 E.01436
G1 X176.829 Y59.992 E.01419
G1 X176.892 Y60.459 E.01438
G1 X176.9 Y60.723 E.00808
G1 X176.9 Y151.277 E2.76384
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.237 E.01456
G1 X176.628 Y152.672 E.014
G1 X176.531 Y152.887 E.00719
G1 X176.293 Y153.3 E.01456
G1 X176.003 Y153.678 E.01455
G1 X175.841 Y153.85 E.0072
G1 X175.496 Y154.152 E.01399
G1 X175.1 Y154.418 E.01457
G1 X174.672 Y154.628 E.01455
G1 X174.237 Y154.776 E.01401
G1 X174.002 Y154.831 E.00737
G1 X173.541 Y154.892 E.0142
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37434
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.414
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/60
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z3.8 I-1.215 J-.062 P1  F30000
G1 X161.007 Y194.116 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.44 J.07 E.12254
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.07 J2.44 E.12253
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12208
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.029 J.053 E.10225
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.054 J2.03 E.10224
G1 X163.009 Y191.733 E1.06369
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.618 J.036 E.08196
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.037 J1.619 E.08194
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08053
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.222 J.019 E.05782
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z4 F30000
G1 X95.016 Y194.884 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.009 J-3.189 E.16377
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.545 I3.288 J.027 E.07891
G1 X95.258 Y154.916 E.12267
G1 X160.742 Y154.916 E2.17223
G1 X163.34 Y157.543 E.12255
G3 X164.182 Y159.629 I-2.382 J2.174 E.07623
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.504 Y194.844 E-.21775
G1 X94.299 Y194.805 E-.07916
G1 X93.9 Y194.687 E-.15818
G1 X93.52 Y194.517 E-.15823
G1 X93.338 Y194.414 E-.07917
G1 X93.193 Y194.312 E-.06751
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z4 F30000
G1 X82.643 Y154.506 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.479 E.01203
G3 X79.491 Y151.317 I.44 J-3.201 E.15244
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.045 E.01682
G3 X79.898 Y151.31 I.565 J-2.764 E.12716
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00511
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.021 J-2.427 E.11588
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20093
G1 X81.778 Y153.527 E-.17949
G1 X81.361 Y153.304 E-.17957
G1 X80.995 Y153.003 E-.1801
G1 X80.961 Y152.963 E-.01991
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z4 F30000
G1 X95.011 Y195.291 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.004 J-3.597 E.18444
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.706 J.035 E.08888
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.499 Y56.716 E3.01141
G3 X177.291 Y60.716 I-.219 J4.005 E.20158
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.639 Y157.266 E.09215
G3 X164.589 Y159.616 I-2.684 J2.453 E.08588
G1 X164.589 Y191.788 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.094 E.18114
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.2051
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.044 E.09884
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.512 Y56.309 E3.01208
G3 X177.698 Y60.71 I-.234 J4.413 E.2221
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.937 Y156.989 E.06024
G3 X164.996 Y159.602 I-2.986 J2.731 E.09553
G1 X164.996 Y191.8 E1.06807
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.005 J-4.396 E.20843
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10045
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.525 Y55.917 E2.79069
G3 X178.09 Y60.703 I-.248 J4.807 E.22405
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.401 Y156.926 I-5.987 J6.547 E.03561
G3 X165.388 Y159.589 I-3.613 J2.853 E.08873
G1 X165.388 Y191.812 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02282
G1 X94.602 Y196.071 E-.15237
G1 X94.316 Y196.036 E-.10941
G1 X94.034 Y195.982 E-.10925
G1 X93.483 Y195.819 E-.21817
G1 X93.217 Y195.711 E-.10913
G1 X93.126 Y195.663 E-.03885
; WIPE_END
G1 E-.04 F1800
M73 P41 R25
G1 X93.135 Y188.031 Z4 F30000
G1 X93.167 Y157.579 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42815
G1 F9345.071
G3 X93.407 Y157.366 I4.469 J4.812 E.01006
; LINE_WIDTH: 0.474597
G1 F8339.585
G3 X93.74 Y157.104 I4.792 J5.734 E.01493
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402178
G1 F10020.665
G1 X92.998 Y157.744 E.00692
G2 X92.2 Y159.719 I2.017 J1.963 E.06396
G1 X92.201 Y191.765 E.93814
G2 X95.02 Y194.5 I2.8 J-.066 E.12741
G1 X161.065 Y194.499 E1.93348
G2 X163.799 Y191.753 I-.067 J-2.8 E.12526
G1 X163.799 Y159.635 E.94025
G2 X162.716 Y157.473 I-2.872 J.085 E.07307
; LINE_WIDTH: 0.444033
G1 F8975.045
G2 X162.54 Y157.323 I-3.151 J3.53 E.00756
; LINE_WIDTH: 0.481424
G1 F8209.745
G1 X162.258 Y157.106 E.01271
G1 X161.54 Y156.218 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.597 Y155.264 E.0445
G1 X160.31 Y155.264 E.00951
G3 X159.823 Y156.936 I-2.125 J.287 E.05945
G1 X156.502 Y156.936 E.11019
G2 X156.756 Y155.264 I-1.708 J-1.115 E.05781
G1 X153.322 Y155.264 E.11394
G3 X152.835 Y156.936 I-2.125 J.287 E.05945
G1 X149.513 Y156.936 E.11019
G2 X149.768 Y155.264 I-1.708 J-1.115 E.05781
G1 X146.333 Y155.264 E.11394
G3 X145.847 Y156.936 I-2.125 J.287 E.05945
G1 X142.525 Y156.936 E.11019
G2 X142.78 Y155.264 I-1.708 J-1.115 E.05781
G1 X139.345 Y155.264 E.11394
G3 X138.858 Y156.936 I-2.125 J.287 E.05945
G1 X135.536 Y156.936 E.11019
G2 X135.791 Y155.264 I-1.708 J-1.115 E.05781
G1 X132.356 Y155.264 E.11394
G3 X131.87 Y156.936 I-2.125 J.288 E.05945
G1 X128.548 Y156.936 E.11019
G2 X128.803 Y155.264 I-1.708 J-1.115 E.05781
G1 X125.368 Y155.264 E.11394
G3 X124.881 Y156.936 I-2.125 J.287 E.05945
G1 X121.56 Y156.936 E.11019
G2 X121.814 Y155.264 I-1.708 J-1.115 E.05781
G1 X118.38 Y155.264 E.11394
G3 X117.893 Y156.936 I-2.125 J.287 E.05945
G1 X114.571 Y156.936 E.11019
G2 X114.826 Y155.264 I-1.708 J-1.115 E.05781
G1 X111.391 Y155.264 E.11394
G3 X110.905 Y156.936 I-2.125 J.287 E.05945
G1 X107.583 Y156.936 E.11019
G2 X107.837 Y155.264 I-1.708 J-1.115 E.05781
G1 X104.403 Y155.264 E.11394
G3 X103.916 Y156.936 I-2.125 J.287 E.05945
G1 X100.594 Y156.936 E.11019
G2 X100.849 Y155.264 I-1.708 J-1.115 E.05781
G1 X97.414 Y155.264 E.11394
G3 X96.928 Y156.936 I-2.125 J.287 E.05945
G1 X95.299 Y156.936 E.05401
; WIPE_START
G1 X96.928 Y156.936 E-.61876
G1 X97.133 Y156.626 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X94.987 Y154.9 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417479
G1 F9611.315
G1 X82.723 Y154.9 E.37433
G3 X79.277 Y152.412 I-.018 J-3.605 E.13873
G1 X79.171 Y152.009 E.01273
G1 X79.131 Y151.77 E.00739
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.76387
G3 X81.588 Y57.277 I3.607 J-.016 E.13872
G1 X81.991 Y57.171 E.01272
G1 X82.23 Y57.131 E.00739
G1 X82.723 Y57.1 E.01507
G1 X173.277 Y57.1 E2.76387
G3 X176.44 Y58.942 I.017 J3.608 E.11717
G1 X176.626 Y59.322 E.0129
G1 X176.777 Y59.768 E.01439
G1 X176.869 Y60.23 E.01438
G1 X176.9 Y60.723 E.01507
G1 X176.9 Y151.277 E2.76387
G3 X176.763 Y152.277 I-3.549 J.025 E.03092
G1 X176.628 Y152.672 E.01273
G1 X176.531 Y152.887 E.00719
G1 X176.296 Y153.295 E.01437
G1 X176.006 Y153.674 E.01456
G1 X175.678 Y154.003 E.01419
G1 X175.3 Y154.293 E.01455
G1 X174.892 Y154.529 E.01437
G1 X174.457 Y154.709 E.01438
G1 X173.997 Y154.832 E.01455
G1 X173.541 Y154.892 E.01401
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37434
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.315
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/60
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z4 I-1.215 J-.062 P1  F30000
G1 X161.007 Y194.116 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.443 J.073 E.1225
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.07 J2.44 E.12253
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12208
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.032 J.056 E.10221
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.054 J2.03 E.10224
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.62 J.038 E.08193
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.037 J1.619 E.08194
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08054
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.0579
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z4.2 F30000
G1 X95.016 Y194.884 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.01 J-3.188 E.16379
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.295 J.03 E.07906
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17223
G1 X163.342 Y157.545 E.12266
G3 X164.182 Y159.629 I-2.431 J2.191 E.07607
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21783
G1 X94.3 Y194.805 E-.07902
G1 X93.9 Y194.687 E-.15831
G1 X93.52 Y194.517 E-.15822
G1 X93.339 Y194.415 E-.07905
G1 X93.193 Y194.312 E-.06758
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z4.2 F30000
G1 X82.643 Y154.506 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01682
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00511
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.776 Y153.526 E-.18011
G1 X81.361 Y153.304 E-.1789
G1 X80.996 Y153.004 E-.17958
G1 X80.962 Y152.962 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z4.2 F30000
G1 X95.011 Y195.291 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.596 E.18445
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.713 J.038 E.08898
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.493 Y56.716 E3.01123
G3 X177.291 Y60.716 I-.213 J4.005 E.20176
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.268 E.09223
G3 X164.589 Y159.615 I-2.739 J2.472 E.08575
G1 X164.589 Y191.788 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.094 E.18115
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I-.001 J-4.003 E.20512
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.132 J.047 E.0989
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
M73 P42 R25
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.506 Y56.309 E3.0119
G3 X177.698 Y60.71 I-.228 J4.414 E.22228
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06029
G3 X164.996 Y159.602 I-3.047 J2.754 E.09542
G1 X164.996 Y191.8 E1.06807
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.811 I.004 J-4.395 E.20845
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.535 J.055 E.10046
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.519 Y55.917 E2.79052
G3 X178.09 Y60.703 I-.242 J4.807 E.22422
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.288 J6.845 E.03423
G3 X165.388 Y159.589 I-3.407 J2.822 E.09024
G1 X165.388 Y191.812 E.9901
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02282
G1 X94.601 Y196.071 E-.15248
G1 X94.316 Y196.036 E-.10942
G1 X93.756 Y195.909 E-.21819
G1 X93.483 Y195.819 E-.1091
G1 X93.217 Y195.711 E-.10913
G1 X93.126 Y195.663 E-.03886
; WIPE_END
G1 E-.04 F1800
G1 X93.049 Y188.031 Z4.2 F30000
G1 X92.744 Y158.043 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.40218
G1 F10020.602
G1 X92.652 Y158.177 E.00475
G2 X92.2 Y159.719 I2.364 J1.53 E.04772
G1 X92.201 Y191.765 E.93815
G2 X95.02 Y194.5 I2.8 J-.066 E.12741
G1 X161.065 Y194.499 E1.93348
G2 X163.799 Y191.753 I-.065 J-2.799 E.12528
G1 X163.799 Y159.635 E.94026
G2 X162.716 Y157.473 I-2.869 J.084 E.07306
; LINE_WIDTH: 0.444049
M73 P42 R24
G1 F8974.683
G2 X162.54 Y157.323 I-3.176 J3.561 E.00757
; LINE_WIDTH: 0.482615
G1 F8187.493
G1 X162.251 Y157.1 E.01307
G1 X161.593 Y156.272 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.597 Y155.264 E.04702
G1 X160.386 Y155.264 E.007
G1 X160.343 Y155.7 E.01453
G1 X160.026 Y156.495 E.02838
G1 X159.623 Y156.936 E.01979
G1 X156.685 Y156.936 E.09747
G2 X156.718 Y155.264 I-1.84 J-.873 E.05713
G1 X153.397 Y155.264 E.11017
G1 X153.355 Y155.7 E.01453
G1 X153.037 Y156.495 E.02839
G1 X152.635 Y156.936 E.01979
G1 X149.696 Y156.936 E.09747
G2 X149.73 Y155.264 I-1.84 J-.873 E.05713
G1 X146.409 Y155.264 E.11017
G1 X146.366 Y155.7 E.01453
G1 X146.049 Y156.495 E.02838
G1 X145.646 Y156.936 E.01979
G1 X142.708 Y156.936 E.09747
G2 X142.741 Y155.264 I-1.84 J-.873 E.05713
G1 X139.42 Y155.264 E.11017
G1 X139.378 Y155.7 E.01453
G1 X139.061 Y156.495 E.02839
G1 X138.658 Y156.936 E.01979
G1 X135.719 Y156.936 E.09747
G2 X135.753 Y155.264 I-1.84 J-.873 E.05713
G1 X132.432 Y155.264 E.11017
G1 X132.389 Y155.7 E.01453
G1 X132.072 Y156.495 E.02839
G1 X131.669 Y156.936 E.01979
G1 X128.731 Y156.936 E.09747
G2 X128.765 Y155.264 I-1.84 J-.873 E.05713
G1 X125.444 Y155.264 E.11017
G1 X125.401 Y155.7 E.01453
G1 X125.084 Y156.495 E.02839
G1 X124.681 Y156.936 E.01979
G1 X121.743 Y156.936 E.09747
G2 X121.776 Y155.264 I-1.84 J-.873 E.05713
G1 X118.455 Y155.264 E.11017
G1 X118.412 Y155.7 E.01453
G1 X118.095 Y156.495 E.02839
G1 X117.693 Y156.936 E.01979
G1 X114.754 Y156.936 E.09747
G2 X114.788 Y155.264 I-1.84 J-.873 E.05713
G1 X111.467 Y155.264 E.11017
G1 X111.424 Y155.7 E.01453
G1 X111.107 Y156.495 E.02838
G1 X110.704 Y156.936 E.01979
G1 X107.766 Y156.936 E.09747
G2 X107.799 Y155.264 I-1.84 J-.873 E.05713
G1 X104.478 Y155.264 E.11017
G1 X104.436 Y155.7 E.01453
G1 X104.119 Y156.495 E.02839
G1 X103.716 Y156.936 E.01979
G1 X100.777 Y156.936 E.09747
G2 X100.811 Y155.264 I-1.84 J-.873 E.05713
G1 X97.49 Y155.264 E.11017
G1 X97.447 Y155.7 E.01453
G1 X97.13 Y156.495 E.02839
G1 X96.727 Y156.936 E.01979
G1 X95.099 Y156.936 E.05401
G1 X93.882 Y157.322 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.4085
G1 F9847.365
G1 X93.611 Y157.254 E.00831
; LINE_WIDTH: 0.443171
G1 F8994.368
G1 X93.587 Y157.248 E.00082
; LINE_WIDTH: 0.472692
G1 F8376.541
G1 X93.562 Y157.243 E.00089
G1 X93.398 Y157.374 E.00736
; LINE_WIDTH: 0.41037
G1 F9797.264
G2 X92.744 Y158.043 I2.381 J2.984 E.02808
; WIPE_START
G1 X92.994 Y157.748 E-.31372
G1 X93.398 Y157.374 E-.44628
; WIPE_END
G1 E-.04 F1800
G1 X94.987 Y154.9 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.417477
G1 F9611.357
G1 X82.723 Y154.9 E.37433
G3 X81.063 Y154.505 I-.009 J-3.644 E.05256
G1 X80.705 Y154.297 E.01264
G1 X80.513 Y154.16 E.00719
G1 X80.159 Y153.85 E.01438
G1 X79.844 Y153.492 E.01455
G1 X79.586 Y153.105 E.01419
G1 X79.374 Y152.678 E.01455
G1 X79.223 Y152.232 E.01438
G1 X79.131 Y151.77 E.01437
G1 X79.101 Y151.32 E.01375
G1 X79.1 Y60.723 E2.76518
G3 X80.945 Y57.559 I3.596 J-.024 E.1173
G1 X81.322 Y57.374 E.01283
G1 X81.768 Y57.223 E.01437
G1 X82.23 Y57.131 E.01438
G1 X82.723 Y57.1 E.01507
G1 X173.277 Y57.1 E2.76386
G1 X173.541 Y57.108 E.00807
G1 X174.003 Y57.169 E.0142
G1 X174.237 Y57.224 E.00736
G1 X174.678 Y57.374 E.0142
G1 X175.095 Y57.579 E.01417
G1 X175.3 Y57.707 E.00738
G1 X175.496 Y57.848 E.00738
G1 X175.846 Y58.155 E.01419
G1 X176.011 Y58.331 E.00737
G1 X176.293 Y58.7 E.01419
G1 X176.421 Y58.905 E.00737
G1 X176.626 Y59.322 E.01418
G1 X176.776 Y59.763 E.0142
G1 X176.831 Y59.997 E.00736
G1 X176.892 Y60.459 E.0142
G1 X176.9 Y60.723 E.00808
G1 X176.9 Y151.277 E2.76386
G3 X174.409 Y154.724 I-3.605 J.018 E.13883
G1 X174.008 Y154.829 E.01264
G1 X173.77 Y154.869 E.00739
G1 X173.277 Y154.9 E.01507
G1 X161.012 Y154.9 E.37434
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.357
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/60
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z4.2 I-1.216 J-.059 P1  F30000
G1 X161.113 Y194.108 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.024 Y194.116 E.00297
G1 X94.954 Y194.116 E2.19167
G3 X92.584 Y191.746 I.044 J-2.414 E.12287
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.439 J.07 E.12254
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.412 Y194.082 I-2.411 J-.042 E.1107
G1 X161.173 Y194.103 E.00798
G1 X161.077 Y193.704 F30000
G1 F8843.478
G1 X161.017 Y193.709 E.00201
G1 X94.967 Y193.709 E2.191
G3 X92.991 Y191.733 I.032 J-2.008 E.10252
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.028 J.052 E.10225
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.06369
G3 X161.344 Y193.68 I-2.006 J-.03 E.09218
G1 X161.137 Y193.698 E.00689
G1 X161.041 Y193.299 F30000
G1 F8843.478
G1 X161.01 Y193.302 E.00104
G1 X94.98 Y193.302 E2.19033
G3 X93.398 Y191.72 I.02 J-1.602 E.08217
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.617 J.035 E.08196
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.0821
G1 X162.602 Y191.72 E1.06281
G3 X161.275 Y193.278 I-1.602 J-.019 E.07365
G1 X161.101 Y193.294 E.0058
M204 S250
G1 X161.006 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.004 Y192.91 E.00009
G1 X94.993 Y192.91 E2.02832
G3 X93.79 Y191.707 I.032 J-1.235 E.05766
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.222 J.019 E.05782
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.209 Y192.888 I-1.235 J-.032 E.05142
G1 X161.066 Y192.903 E.00441
; WIPE_START
M204 S10000
G1 X161.004 Y192.91 E-.0239
G1 X159.066 Y192.91 E-.7361
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z4.4 F30000
G1 X95.016 Y194.884 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.01 J-3.188 E.16379
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.286 J.026 E.07908
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17222
G1 X163.342 Y157.545 E.12267
G3 X164.182 Y159.624 I-2.477 J2.209 E.07585
G1 X164.182 Y191.776 E1.06656
G3 X161.076 Y194.882 I-3.187 J-.081 E.16072
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21786
G1 X94.299 Y194.805 E-.07907
G1 X93.9 Y194.687 E-.15827
G1 X93.707 Y194.608 E-.07912
G1 X93.339 Y194.415 E-.15816
G1 X93.193 Y194.312 E-.06753
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z4.4 F30000
G1 X82.643 Y154.506 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.479 E.01203
G3 X79.491 Y151.317 I.44 J-3.201 E.15243
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.231 J.039 E.16579
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.045 E.01681
M73 P43 R24
G3 X79.898 Y151.31 I.566 J-2.765 E.12715
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.822 J.03 E.14506
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.021 J-2.428 E.11587
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.428 J.021 E.11587
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.778 Y153.527 E-.17951
G1 X81.361 Y153.304 E-.17949
G1 X80.995 Y153.003 E-.18022
G1 X80.961 Y152.963 E-.01987
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z4.4 F30000
G1 X95.011 Y195.291 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.006 J-3.596 E.18446
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.704 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.488 Y56.716 E3.01105
G3 X177.291 Y60.716 I-.207 J4.005 E.20194
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38475
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.612 I-2.789 J2.492 E.08557
G1 X164.589 Y191.788 E1.06735
G3 X161.088 Y195.289 I-3.594 J-.094 E.18114
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I-.001 J-4.003 E.20512
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.122 J.043 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.501 Y56.309 E3.01171
G3 X177.698 Y60.71 I-.222 J4.414 E.22246
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.6 I-3.101 J2.776 E.09529
G1 X164.996 Y191.8 E1.06814
G3 X161.1 Y195.696 I-4.002 J-.106 E.20157
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.004 J-4.395 E.20845
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.051 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.514 Y55.917 E2.79035
G3 X178.09 Y60.703 I-.237 J4.807 E.22439
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.276 J6.835 E.03423
G3 X165.388 Y159.589 I-3.414 J2.825 E.09021
G1 X165.388 Y191.811 E.99012
G3 X161.111 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02282
G1 X94.601 Y196.071 E-.15253
G1 X94.316 Y196.036 E-.10938
G1 X94.034 Y195.982 E-.10908
G1 X93.483 Y195.819 E-.21822
G1 X93.217 Y195.711 E-.10913
G1 X93.126 Y195.663 E-.03886
; WIPE_END
G1 E-.04 F1800
G1 X93.134 Y188.031 Z4.4 F30000
G1 X93.167 Y157.579 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428241
G1 F9342.872
G3 X93.408 Y157.365 I4.459 J4.8 E.01012
; LINE_WIDTH: 0.474974
G1 F8332.293
G3 X93.742 Y157.103 I4.766 J5.709 E.01495
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402163
G1 F10021.091
G1 X92.998 Y157.744 E.0069
G2 X92.2 Y159.719 I2.018 J1.964 E.06398
G1 X92.201 Y191.765 E.93809
G2 X95.02 Y194.5 I2.808 J-.074 E.12732
G1 X161.033 Y194.499 E1.93245
G2 X163.799 Y191.753 I-.039 J-2.806 E.12612
G1 X163.799 Y159.635 E.94022
G2 X162.84 Y157.584 I-2.849 J.082 E.06816
; LINE_WIDTH: 0.428518
G1 F9336.165
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.476351
G1 F8305.825
G2 X162.258 Y157.106 I-4.029 J4.864 E.01447
G1 X161.63 Y156.31 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.596 Y155.264 E.04877
G1 X160.438 Y155.264 E.00524
G3 X159.507 Y156.936 I-2.453 J-.272 E.06517
G1 X156.904 Y156.936 E.08636
G2 X156.698 Y155.264 I-2.103 J-.589 E.05733
G1 X153.45 Y155.264 E.10774
G3 X152.519 Y156.936 I-2.453 J-.272 E.06517
G1 X149.915 Y156.936 E.08636
G2 X149.709 Y155.264 I-2.103 J-.589 E.05733
G1 X146.462 Y155.264 E.10774
G3 X145.53 Y156.936 I-2.453 J-.272 E.06517
G1 X142.927 Y156.936 E.08636
G2 X142.721 Y155.264 I-2.103 J-.589 E.05733
G1 X139.473 Y155.264 E.10774
G3 X138.542 Y156.936 I-2.453 J-.272 E.06517
G1 X135.938 Y156.936 E.08636
G2 X135.733 Y155.264 I-2.103 J-.589 E.05733
G1 X132.485 Y155.264 E.10774
G3 X131.553 Y156.936 I-2.453 J-.272 E.06517
G1 X128.95 Y156.936 E.08636
G2 X128.744 Y155.264 I-2.103 J-.589 E.05733
G1 X125.496 Y155.264 E.10774
G3 X124.565 Y156.936 I-2.453 J-.272 E.06517
G1 X121.962 Y156.936 E.08636
G2 X121.756 Y155.264 I-2.103 J-.589 E.05733
G1 X118.508 Y155.264 E.10774
G3 X117.577 Y156.936 I-2.453 J-.272 E.06517
G1 X114.973 Y156.936 E.08636
G2 X114.767 Y155.264 I-2.103 J-.589 E.05733
G1 X111.52 Y155.264 E.10774
G3 X110.588 Y156.936 I-2.453 J-.272 E.06517
G1 X107.985 Y156.936 E.08636
G2 X107.779 Y155.264 I-2.103 J-.589 E.05733
G1 X104.531 Y155.264 E.10774
G3 X103.6 Y156.936 I-2.453 J-.272 E.06517
G1 X100.996 Y156.936 E.08636
G2 X100.791 Y155.264 I-2.103 J-.589 E.05733
G1 X97.543 Y155.264 E.10774
G3 X96.611 Y156.936 I-2.453 J-.272 E.06517
G1 X94.983 Y156.936 E.05401
; WIPE_START
G1 X96.611 Y156.936 E-.61876
G1 X96.875 Y156.674 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X94.987 Y154.9 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.41748
G1 F9611.295
G1 X82.723 Y154.9 E.37433
G3 X79.276 Y152.406 I-.023 J-3.597 E.13895
G1 X79.171 Y152.009 E.01255
G1 X79.131 Y151.77 E.00739
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.76387
G3 X81.594 Y57.276 I3.607 J-.016 E.1389
G1 X81.992 Y57.171 E.01255
G1 X82.23 Y57.131 E.00738
G1 X82.723 Y57.1 E.01507
G1 X173.277 Y57.1 E2.76388
G3 X175.533 Y57.878 I.013 J3.622 E.07422
G1 X175.845 Y58.154 E.01274
G1 X176.152 Y58.504 E.01419
G1 X176.297 Y58.705 E.00757
G1 X176.529 Y59.108 E.01419
G1 X176.709 Y59.543 E.01437
G1 X176.829 Y59.991 E.01418
G1 X176.892 Y60.459 E.01438
G1 X176.9 Y60.723 E.00808
G1 X176.9 Y151.277 E2.76387
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.237 E.01456
G1 X176.628 Y152.672 E.01401
G1 X176.531 Y152.887 E.00719
G1 X176.293 Y153.3 E.01456
G1 X176.003 Y153.678 E.01455
M73 P44 R24
G1 X175.841 Y153.85 E.0072
G1 X175.496 Y154.152 E.01399
G1 X175.1 Y154.418 E.01456
G1 X174.672 Y154.628 E.01456
G1 X174.237 Y154.776 E.01401
G1 X174.003 Y154.831 E.00736
G1 X173.541 Y154.892 E.0142
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37435
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.295
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/60
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z4.4 I-1.215 J-.062 P1  F30000
G1 X161.007 Y194.116 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.19111
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.439 J.069 E.12254
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12208
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.028 J.052 E.10225
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.617 J.035 E.08197
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08054
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.222 J.019 E.05783
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z4.6 F30000
G1 X95.016 Y194.884 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I-.009 J-3.189 E.16378
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.296 J.03 E.07906
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17224
G1 X163.343 Y157.545 E.12267
G3 X164.182 Y159.629 I-2.386 J2.172 E.07611
G1 X164.182 Y191.776 E1.06639
G3 X161.076 Y194.882 I-3.187 J-.081 E.16071
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.504 Y194.844 E-.21782
G1 X94.299 Y194.805 E-.07911
G1 X93.9 Y194.687 E-.15821
G1 X93.707 Y194.608 E-.07918
G1 X93.338 Y194.414 E-.15828
G1 X93.193 Y194.312 E-.06741
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.934 Z4.6 F30000
G1 X82.643 Y154.506 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.232 J.039 E.16579
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01681
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.822 J.03 E.14506
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.428 J.022 E.11587
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.776 Y153.526 E-.18016
G1 X81.361 Y153.304 E-.1789
G1 X80.996 Y153.004 E-.17953
G1 X80.962 Y152.962 E-.02051
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z4.6 F30000
G1 X95.011 Y195.291 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I-.005 J-3.597 E.18444
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.715 J.039 E.08897
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.482 Y56.716 E3.01087
G3 X177.291 Y60.716 I-.202 J4.005 E.20212
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.616 I-2.687 J2.451 E.08579
G1 X164.589 Y191.788 E1.06723
G3 X161.088 Y195.289 I-3.594 J-.094 E.18114
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I0 J-4.004 E.20511
G1 X91.002 Y159.706 E1.06462
G3 X92.063 Y156.989 I4.133 J.048 E.09889
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.496 Y56.309 E3.01153
G3 X177.698 Y60.71 I-.217 J4.414 E.22265
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.06029
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
M73 P44 R23
G1 X164.996 Y191.8 E1.06807
G3 X161.1 Y195.696 I-4.002 J-.106 E.20156
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.005 J-4.396 E.20844
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.536 J.056 E.10046
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.508 Y55.917 E2.79019
G3 X178.09 Y60.703 I-.231 J4.807 E.22455
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.286 J6.843 E.03422
G3 X165.388 Y159.589 I-3.578 J2.887 E.09012
G1 X165.388 Y191.812 E.9901
G3 X161.112 Y196.088 I-4.394 J-.118 E.20494
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.0228
G1 X94.601 Y196.071 E-.15253
G1 X94.316 Y196.036 E-.1094
G1 X94.034 Y195.982 E-.10906
G1 X93.483 Y195.819 E-.21822
G1 X93.217 Y195.711 E-.10913
G1 X93.126 Y195.663 E-.03887
; WIPE_END
G1 E-.04 F1800
G1 X93.049 Y188.031 Z4.6 F30000
G1 X92.744 Y158.043 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402161
G1 F10021.148
G1 X92.659 Y158.165 E.00436
G2 X92.2 Y159.719 I2.359 J1.542 E.04811
G1 X92.201 Y191.765 E.9381
G2 X95.02 Y194.5 I2.8 J-.066 E.12741
G1 X161.065 Y194.499 E1.93338
G2 X163.799 Y191.753 I-.067 J-2.8 E.12525
G1 X163.799 Y159.635 E.94021
G2 X162.84 Y157.584 I-2.848 J.082 E.06816
; LINE_WIDTH: 0.428516
G1 F9336.204
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.47637
M73 P45 R23
G1 F8305.473
G2 X162.258 Y157.106 I-4.015 J4.846 E.01446
G1 X161.722 Y156.402 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.597 Y155.264 E.05308
G3 X159.32 Y156.936 I-2.755 J-.782 E.07142
G1 X157.187 Y156.936 E.07075
G2 X156.697 Y155.264 I-2.699 J-.115 E.05882
G1 X153.58 Y155.264 E.10339
G3 X152.332 Y156.936 I-2.662 J-.687 E.07097
G1 X150.199 Y156.936 E.07075
G2 X149.709 Y155.264 I-2.698 J-.116 E.05882
G1 X146.592 Y155.264 E.10339
G3 X145.343 Y156.936 I-2.662 J-.687 E.07097
G1 X143.211 Y156.936 E.07075
G2 X142.72 Y155.264 I-2.699 J-.115 E.05882
G1 X139.603 Y155.264 E.10339
G3 X138.355 Y156.936 I-2.662 J-.687 E.07097
G1 X136.222 Y156.936 E.07075
G2 X135.732 Y155.264 I-2.698 J-.116 E.05882
G1 X132.615 Y155.264 E.10339
G3 X131.367 Y156.936 I-2.662 J-.687 E.07097
G1 X129.234 Y156.936 E.07075
G2 X128.743 Y155.264 I-2.699 J-.115 E.05882
G1 X125.627 Y155.264 E.10339
G3 X124.378 Y156.936 I-2.662 J-.687 E.07097
G1 X122.245 Y156.936 E.07075
G2 X121.755 Y155.264 I-2.699 J-.115 E.05882
G1 X118.638 Y155.264 E.10339
G3 X117.39 Y156.936 I-2.662 J-.687 E.07097
G1 X115.257 Y156.936 E.07075
G2 X114.767 Y155.264 I-2.698 J-.115 E.05882
G1 X111.65 Y155.264 E.10339
G3 X110.401 Y156.936 I-2.662 J-.687 E.07097
G1 X108.269 Y156.936 E.07075
G2 X107.778 Y155.264 I-2.699 J-.115 E.05882
G1 X104.661 Y155.264 E.10339
G3 X103.413 Y156.936 I-2.662 J-.687 E.07097
G1 X101.28 Y156.936 E.07075
G2 X100.79 Y155.264 I-2.698 J-.116 E.05882
G1 X97.673 Y155.264 E.10339
G3 X96.425 Y156.936 I-2.662 J-.687 E.07097
G1 X94.935 Y156.936 E.04941
G2 X94.313 Y157.03 I-.054 J1.731 E.02097
G1 X94.353 Y156.878 E.00522
G1 X94.309 Y156.867 E.00149
G2 X94.27 Y156.41 I-.863 J-.156 E.01537
G1 X95.42 Y155.264 E.05385
G1 X94.987 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.41748
G1 F9611.283
G1 X82.723 Y154.9 E.37433
G3 X79.275 Y152.404 I-.018 J-3.605 E.13899
G1 X79.171 Y152.008 E.01247
G1 X79.131 Y151.77 E.00738
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.76388
G3 X80.37 Y57.958 I3.618 J-.013 E.09586
G1 X80.695 Y57.71 E.01247
G1 X80.9 Y57.582 E.00738
G1 X81.317 Y57.377 E.01417
G1 X81.543 Y57.291 E.00738
G1 X81.774 Y57.221 E.00737
G1 X82.224 Y57.132 E.01402
G1 X82.723 Y57.1 E.01525
G1 X173.277 Y57.1 E2.76388
G3 X175.535 Y57.88 I.013 J3.622 E.0743
G1 X175.845 Y58.154 E.01265
G1 X176.152 Y58.504 E.01419
G1 X176.296 Y58.705 E.00756
G1 X176.529 Y59.108 E.0142
G1 X176.709 Y59.543 E.01437
G1 X176.829 Y59.991 E.01418
G1 X176.892 Y60.459 E.01438
G1 X176.9 Y60.723 E.00808
G1 X176.9 Y151.277 E2.76388
G3 X176.12 Y153.535 I-3.59 J.024 E.07433
G1 X175.845 Y153.846 E.01266
G1 X175.496 Y154.152 E.01418
G1 X175.295 Y154.297 E.00757
G1 X174.898 Y154.526 E.014
G1 X174.672 Y154.628 E.00755
G1 X174.231 Y154.777 E.0142
G1 X173.997 Y154.832 E.00736
G1 X173.541 Y154.892 E.01401
G1 X161.012 Y154.9 E.38241
; WIPE_START
G1 X163.012 Y154.899 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.385 Y155.166 Z4.6 F30000
G1 X93.878 Y157.324 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.404117
G1 F9966.87
G1 X93.612 Y157.256 E.00807
; LINE_WIDTH: 0.439745
G1 F9072.024
G1 X93.587 Y157.25 E.00086
; LINE_WIDTH: 0.472469
G1 F8380.888
G1 X93.561 Y157.244 E.00093
G1 X93.398 Y157.374 E.00729
; LINE_WIDTH: 0.410485
G1 F9794.195
G2 X92.744 Y158.043 I2.37 J2.97 E.02809
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9794.195
G1 X92.998 Y157.743 E-.31897
G1 X93.398 Y157.374 E-.44103
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/60
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z4.6 I-.581 J1.069 P1  F30000
G1 X161.007 Y194.116 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.1911
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.43 J.061 E.12266
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12208
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.021 J.045 E.10235
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.611 J.029 E.08205
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08054
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.216 J.013 E.05789
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z4.8 F30000
G1 X95.015 Y194.884 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.286 J.026 E.07907
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17222
G1 X163.342 Y157.545 E.12267
G3 X164.182 Y159.629 I-2.427 J2.189 E.07606
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.075 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23487
G1 X94.054 Y194.739 E-.15827
G1 X93.858 Y194.671 E-.079
G1 X93.48 Y194.496 E-.15824
G1 X93.3 Y194.391 E-.07922
G1 X93.193 Y194.313 E-.0504
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z4.8 F30000
G1 X82.643 Y154.506 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.232 J.04 E.16578
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01681
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.823 J.031 E.14505
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.428 J.022 E.11587
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.778 Y153.527 E-.17951
G1 X81.359 Y153.303 E-.18022
G1 X80.996 Y153.004 E-.17886
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z4.8 F30000
G1 X95.011 Y195.291 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.704 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.477 Y56.715 E3.01069
G3 X177.291 Y60.717 I-.196 J4.005 E.2023
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38475
G1 X163.64 Y157.268 E.09224
G3 X164.589 Y159.615 I-2.735 J2.47 E.08574
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.122 J.043 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.49 Y56.309 E3.01135
G3 X177.698 Y60.71 I-.211 J4.414 E.22282
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.0603
G3 X164.996 Y159.602 I-3.043 J2.752 E.09541
M73 P46 R23
G1 X164.998 Y191.694 E1.06455
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20821
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.051 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.503 Y55.917 E2.79002
G3 X178.09 Y60.703 I-.226 J4.807 E.22472
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.283 J6.841 E.03423
G3 X165.388 Y159.589 I-3.405 J2.821 E.09024
G1 X165.39 Y191.698 E.98662
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19909
G1 X94.254 Y196.026 E-.10916
G1 X93.973 Y195.968 E-.10923
G1 X93.425 Y195.797 E-.21816
G1 X93.128 Y195.66 E-.12436
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z4.8 F30000
G1 X93.167 Y157.579 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428304
G1 F9341.352
G3 X93.409 Y157.365 I4.419 J4.753 E.01014
; LINE_WIDTH: 0.475046
G1 F8330.913
G3 X93.741 Y157.103 I4.687 J5.615 E.01491
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402375
G1 F10015.172
G1 X93.017 Y157.725 E.00615
G2 X92.2 Y159.719 I1.996 J1.982 E.06477
G1 X92.201 Y191.765 E.93865
G2 X95.02 Y194.5 I2.802 J-.068 E.12746
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.681 I-.067 J-2.802 E.12745
G1 X163.799 Y159.635 E.93864
G2 X162.84 Y157.584 I-2.823 J.07 E.06824
; LINE_WIDTH: 0.428529
G1 F9335.899
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.477437
G1 F8285.059
G2 X162.251 Y157.1 I-4.062 J4.899 E.01482
G1 X161.841 Y156.523 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.696 Y155.365 E.05401
G3 X159 Y156.936 I-2.578 J-1.083 E.07905
G1 X157.637 Y156.936 E.04521
G2 X156.827 Y155.397 I-8.768 J3.632 E.05773
G1 X156.699 Y155.264 E.00614
G1 X153.767 Y155.264 E.09726
G3 X152.011 Y156.936 I-2.718 J-1.098 E.08288
G1 X150.648 Y156.936 E.04521
G2 X149.839 Y155.397 I-8.766 J3.631 E.05773
G1 X149.71 Y155.264 E.00614
G1 X146.778 Y155.264 E.09726
G3 X145.023 Y156.936 I-2.718 J-1.098 E.08288
G1 X143.66 Y156.936 E.04521
G2 X142.851 Y155.397 I-8.768 J3.632 E.05773
G1 X142.722 Y155.264 E.00614
G1 X139.79 Y155.264 E.09726
G3 X138.035 Y156.936 I-2.718 J-1.098 E.08288
G1 X136.672 Y156.936 E.04521
G2 X135.862 Y155.397 I-8.766 J3.631 E.05773
G1 X135.734 Y155.264 E.00614
G1 X132.802 Y155.264 E.09726
G3 X131.046 Y156.936 I-2.718 J-1.098 E.08288
G1 X129.683 Y156.936 E.04521
G2 X128.874 Y155.397 I-8.767 J3.631 E.05773
G1 X128.745 Y155.264 E.00614
G1 X125.813 Y155.264 E.09726
G3 X124.058 Y156.936 I-2.718 J-1.098 E.08288
G1 X122.695 Y156.936 E.04521
G2 X121.885 Y155.397 I-8.768 J3.632 E.05773
G1 X121.757 Y155.264 E.00614
G1 X118.825 Y155.264 E.09726
G3 X117.069 Y156.936 I-2.718 J-1.098 E.08288
G1 X115.706 Y156.936 E.04521
G2 X114.897 Y155.397 I-8.766 J3.631 E.05773
G1 X114.768 Y155.264 E.00614
G1 X111.836 Y155.264 E.09726
G3 X110.081 Y156.936 I-2.718 J-1.098 E.08288
G1 X108.718 Y156.936 E.04521
G2 X107.909 Y155.397 I-8.768 J3.632 E.05773
G1 X107.78 Y155.264 E.00614
G1 X104.848 Y155.264 E.09726
G3 X103.093 Y156.936 I-2.718 J-1.098 E.08288
G1 X101.73 Y156.936 E.04521
G2 X100.92 Y155.397 I-8.766 J3.631 E.05773
G1 X100.792 Y155.264 E.00614
G1 X97.86 Y155.264 E.09726
G3 X96.104 Y156.936 I-2.718 J-1.098 E.08288
G2 X94.751 Y156.956 I-.585 J6.173 E.04499
G1 X94.422 Y156.256 E.02563
G1 X95.403 Y155.264 E.04627
G1 X95.637 Y155.264 E.00774
G1 X94.987 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417479
G1 F9611.304
G1 X82.723 Y154.9 E.37433
G3 X80.463 Y154.119 I-.013 J-3.621 E.07439
G1 X80.154 Y153.845 E.01258
G1 X79.848 Y153.496 E.01418
G1 X79.703 Y153.295 E.00757
G1 X79.471 Y152.892 E.01418
G1 X79.291 Y152.457 E.01437
G1 X79.171 Y152.008 E.01418
G1 X79.108 Y151.541 E.01438
G1 X79.1 Y151.277 E.00808
G1 X79.1 Y60.723 E2.76387
G3 X81.6 Y57.274 I3.607 J-.016 E.13908
G1 X81.992 Y57.171 E.01237
G1 X82.23 Y57.131 E.00738
G1 X82.723 Y57.1 E.01508
G1 X173.277 Y57.1 E2.76387
G3 X175.537 Y57.881 I.013 J3.621 E.07439
G1 X175.846 Y58.154 E.01257
G1 X176.152 Y58.504 E.01418
G1 X176.296 Y58.705 E.00756
G1 X176.529 Y59.108 E.01419
G1 X176.709 Y59.543 E.01436
G1 X176.829 Y59.991 E.01418
G1 X176.892 Y60.459 E.01438
G1 X176.9 Y60.723 E.00808
G1 X176.9 Y151.277 E2.76387
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.237 E.01456
G1 X176.707 Y152.463 E.00719
G1 X176.531 Y152.887 E.014
G1 X176.293 Y153.3 E.01456
G1 X176.003 Y153.678 E.01456
G1 X175.841 Y153.85 E.0072
G1 X175.496 Y154.152 E.01399
G1 X175.1 Y154.418 E.01456
G1 X174.672 Y154.628 E.01456
G1 X174.237 Y154.776 E.01401
G1 X174.002 Y154.831 E.00736
G1 X173.541 Y154.892 E.0142
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37435
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.304
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/60
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z4.8 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.414 E.12287
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.415 J.045 E.12286
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.096 I-2.415 J-.045 E.1139
G1 X161.146 Y194.109 E.00565
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.032 J-2.008 E.10252
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.033 J.057 E.10219
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10242
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.032 J-.056 E.10109
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.02 J-1.602 E.08217
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.622 J.039 E.08191
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.3 I-1.62 J-.038 E.08037
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.032 J-1.235 E.05766
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.225 J.022 E.05778
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.012 J1.215 E.0579
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.907 I-1.224 J-.021 E.05596
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z5 F30000
G1 X95.016 Y194.884 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.026 E.07908
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17223
G1 X163.343 Y157.545 E.12268
G3 X164.182 Y159.629 I-2.386 J2.172 E.0761
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23501
G1 X94.055 Y194.739 E-.15807
G1 X93.858 Y194.671 E-.07913
G1 X93.48 Y194.496 E-.15827
G1 X93.3 Y194.391 E-.0791
G1 X93.19 Y194.316 E-.05042
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z5 F30000
G1 X82.643 Y154.506 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.212 J.02 E.16605
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.218 J-.026 E.16597
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01681
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.805 J.013 E.14529
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.81 J-.018 E.14522
G1 X82.718 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.413 J.006 E.11607
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.417 J-.011 E.11601
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20092
G1 X81.778 Y153.527 E-.1795
G1 X81.361 Y153.304 E-.17951
M73 P46 R22
G1 X80.996 Y153.004 E-.17959
M73 P47 R22
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z5 F30000
G1 X95.011 Y195.291 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.471 Y56.715 E3.01051
G3 X177.291 Y60.717 I-.174 J3.99 E.2027
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.615 I-2.687 J2.451 E.08578
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.122 J.043 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.485 Y56.308 E3.01117
G3 X177.698 Y60.71 I-.187 J4.397 E.22324
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.73 E.09546
G1 X164.998 Y191.694 E1.06455
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.498 Y55.917 E2.78985
G3 X178.09 Y60.703 I-.2 J4.788 E.22512
G1 X178.09 Y151.297 E2.78368
G3 X177.766 Y153.025 I-5.38 J-.114 E.05427
G3 X173.297 Y156.09 I-4.498 J-1.767 E.17679
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.286 J6.844 E.03422
G3 X165.388 Y159.589 I-3.578 J2.887 E.09011
G1 X165.39 Y191.698 E.98662
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19918
G1 X94.254 Y196.026 E-.10915
G1 X93.696 Y195.891 E-.21812
G1 X93.425 Y195.797 E-.10923
G1 X93.128 Y195.66 E-.12433
; WIPE_END
G1 E-.04 F1800
G1 X93.143 Y188.027 Z5 F30000
G1 X93.203 Y157.546 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.432675
G1 F9236.59
G3 X93.424 Y157.352 I4.498 J4.904 E.00936
; LINE_WIDTH: 0.477468
G1 F8284.48
G3 X93.743 Y157.105 I4.162 J5.042 E.01427
G1 X93.203 Y157.546 F30000
; LINE_WIDTH: 0.402394
G1 F10014.643
G2 X92.2 Y159.719 I1.831 J2.163 E.07238
G1 X92.201 Y191.765 E.93871
G2 X95.02 Y194.5 I2.808 J-.074 E.12739
G1 X161.065 Y194.499 E1.93464
G2 X163.8 Y191.681 I-.074 J-2.808 E.12738
G1 X163.799 Y159.635 E.93869
G2 X162.727 Y157.482 I-2.875 J.088 E.07267
; LINE_WIDTH: 0.442815
G1 F9002.36
G2 X162.54 Y157.323 I-3.324 J3.723 E.00802
; LINE_WIDTH: 0.482575
G1 F8188.248
G1 X162.251 Y157.1 E.01306
G1 X161.933 Y156.615 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.788 Y155.458 E.05401
G3 X158.575 Y156.879 I-2.409 J-1.317 E.09099
G3 X157.701 Y156.488 I-.091 J-.968 E.0332
G1 X156.759 Y155.264 E.05121
G1 X153.944 Y155.264 E.0934
G1 X153.333 Y156.08 E.0338
G3 X151.586 Y156.879 I-2 J-2.064 E.06498
G3 X150.713 Y156.488 I-.091 J-.968 E.0332
G1 X149.771 Y155.264 E.05121
G1 X146.955 Y155.264 E.0934
G1 X146.345 Y156.08 E.0338
G3 X144.598 Y156.879 I-2 J-2.064 E.06498
G3 X143.724 Y156.488 I-.091 J-.968 E.0332
G1 X142.783 Y155.264 E.05121
G1 X139.967 Y155.264 E.0934
G1 X139.356 Y156.08 E.0338
G3 X137.609 Y156.879 I-2 J-2.064 E.06498
G3 X136.736 Y156.488 I-.091 J-.968 E.0332
G1 X135.794 Y155.264 E.05121
G1 X132.979 Y155.264 E.0934
G1 X132.368 Y156.08 E.0338
G3 X130.621 Y156.879 I-2 J-2.064 E.06498
G3 X129.747 Y156.488 I-.091 J-.968 E.0332
G1 X128.806 Y155.264 E.05121
G1 X125.99 Y155.264 E.0934
G1 X125.38 Y156.08 E.0338
G3 X123.633 Y156.879 I-2 J-2.064 E.06498
G3 X122.759 Y156.488 I-.091 J-.968 E.0332
G1 X121.817 Y155.264 E.05121
G1 X119.002 Y155.264 E.0934
G1 X118.391 Y156.08 E.0338
G3 X116.644 Y156.879 I-2 J-2.064 E.06498
G3 X115.771 Y156.488 I-.091 J-.968 E.0332
G1 X114.829 Y155.264 E.05121
G1 X112.013 Y155.264 E.0934
G1 X111.403 Y156.08 E.0338
G3 X109.656 Y156.879 I-2 J-2.064 E.06498
G3 X108.782 Y156.488 I-.091 J-.968 E.0332
G1 X107.841 Y155.264 E.05121
G1 X105.025 Y155.264 E.0934
G1 X104.414 Y156.08 E.0338
G3 X102.667 Y156.879 I-2 J-2.064 E.06498
G3 X101.794 Y156.488 I-.091 J-.968 E.0332
G1 X100.852 Y155.264 E.05121
G1 X98.037 Y155.264 E.0934
G1 X97.426 Y156.08 E.0338
G3 X95.679 Y156.879 I-2 J-2.064 E.06498
G1 X95.242 Y156.82 E.01462
G3 X94.542 Y156.136 I.847 J-1.568 E.03291
G1 X95.403 Y155.264 E.04064
G1 X95.806 Y155.264 E.01338
G1 X94.987 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417473
G1 F9611.459
G1 X82.723 Y154.9 E.37433
G1 X82.459 Y154.892 E.00807
G1 X81.998 Y154.831 E.01419
G1 X81.537 Y154.707 E.01456
G1 X81.317 Y154.623 E.00719
G1 X80.905 Y154.421 E.014
G1 X80.509 Y154.156 E.01455
G1 X80.15 Y153.841 E.01456
G1 X79.848 Y153.496 E.01399
G1 X79.71 Y153.305 E.00721
G1 X79.471 Y152.892 E.01455
G1 X79.262 Y152.362 E.0174
G1 X79.169 Y152.002 E.01133
G1 X79.131 Y151.77 E.0072
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.76383
G1 X79.132 Y60.224 E.01525
G1 X79.221 Y59.774 E.01401
G1 X79.291 Y59.543 E.00737
G1 X79.377 Y59.317 E.00738
G1 X79.579 Y58.905 E.014
G1 X79.848 Y58.504 E.01475
G1 X80.155 Y58.154 E.01419
G1 X80.504 Y57.848 E.01419
G1 X80.705 Y57.703 E.00756
G1 X81.108 Y57.471 E.01419
G1 X81.543 Y57.291 E.01437
G1 X81.992 Y57.171 E.01418
G1 X82.459 Y57.108 E.01438
G1 X82.723 Y57.1 E.00807
G1 X173.277 Y57.1 E2.76383
G1 X173.77 Y57.131 E.01507
G1 X174.226 Y57.221 E.01418
G1 X174.457 Y57.291 E.00738
G1 X174.683 Y57.377 E.00738
G1 X175.094 Y57.579 E.014
G1 X175.496 Y57.848 E.01475
G1 X175.841 Y58.15 E.01399
G1 X176.007 Y58.326 E.00739
G1 X176.16 Y58.513 E.00737
G1 X176.415 Y58.895 E.01401
G1 X176.628 Y59.328 E.01473
G1 X176.776 Y59.763 E.01401
G1 X176.831 Y59.997 E.00736
G1 X176.87 Y60.237 E.00739
G1 X176.899 Y60.673 E.01337
G1 X176.9 Y151.277 E2.76534
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.238 E.01456
G1 X176.707 Y152.463 E.00719
G1 X176.531 Y152.886 E.01399
G1 X176.293 Y153.3 E.01457
G1 X176.002 Y153.678 E.01457
G1 X175.678 Y154.002 E.01399
G1 X175.496 Y154.152 E.00719
G1 X175.1 Y154.418 E.01456
G1 X174.672 Y154.628 E.01455
G1 X174.238 Y154.776 E.01401
G1 X174.002 Y154.831 E.00737
G1 X173.541 Y154.892 E.01419
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.459
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/60
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z5 I-1.215 J-.062 P1  F30000
G1 X161.007 Y194.116 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.1911
G3 X92.584 Y191.746 I.049 J-2.419 E.12281
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.415 J.045 E.12286
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.07 J2.44 E.12253
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12208
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.035 J-2.011 E.10248
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.033 J.057 E.10219
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.053 J2.029 E.10224
G1 X163.009 Y191.733 E1.06369
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.021 J-1.604 E.08215
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.622 J.039 E.08191
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.037 J1.619 E.08195
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08054
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.008 J-1.211 E.05796
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.225 J.022 E.05778
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.02 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z5.2 F30000
G1 X95.015 Y194.884 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.004 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.546 I3.299 J.031 E.07889
G1 X95.258 Y154.916 E.12268
G1 X160.742 Y154.916 E2.17223
G1 X163.339 Y157.542 E.1225
M73 P48 R22
G3 X164.182 Y159.624 I-2.473 J2.213 E.07601
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.075 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23482
G1 X94.054 Y194.739 E-.15832
G1 X93.858 Y194.671 E-.0791
G1 X93.48 Y194.496 E-.15809
G1 X93.3 Y194.391 E-.07909
G1 X93.193 Y194.313 E-.05058
; WIPE_END
G1 E-.04 F1800
G1 X91.237 Y186.935 Z5.2 F30000
G1 X82.643 Y154.506 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.212 J.02 E.16605
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.212 J-.02 E.16605
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.153 Y154.048 E.01681
G3 X79.898 Y151.31 I.55 J-2.751 E.12738
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.805 J-.013 E.14529
G1 X82.717 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.413 J.006 E.11607
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.413 J-.006 E.11607
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20093
G1 X81.778 Y153.527 E-.1795
G1 X81.361 Y153.304 E-.17952
G1 X80.996 Y153.004 E-.17955
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z5.2 F30000
G1 X95.011 Y195.291 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.717 J.04 E.08886
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.716 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.466 Y56.715 E3.01033
G3 X177.291 Y60.716 I-.168 J3.99 E.20288
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.638 Y157.265 E.09212
G3 X164.589 Y159.612 I-2.786 J2.495 E.08568
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06462
G3 X92.061 Y156.99 I4.135 J.048 E.09883
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.479 Y56.308 E3.01099
G3 X177.698 Y60.71 I-.181 J4.396 E.22342
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.937 Y156.989 E.06022
G3 X164.996 Y159.6 I-3.099 J2.777 E.09536
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20821
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.538 J.057 E.10044
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.492 Y55.916 E2.78968
G3 X178.09 Y60.703 I-.194 J4.788 E.22529
G1 X178.09 Y151.297 E2.78368
G3 X177.768 Y153.02 I-5.383 J-.114 E.0541
G3 X173.297 Y156.09 I-4.474 J-1.725 E.17715
G1 X163.6 Y156.09 E.29796
G3 X164.413 Y156.94 I-5.923 J6.484 E.03619
G3 X165.388 Y159.589 I-3.456 J2.776 E.08825
G1 X165.39 Y191.698 E.98664
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19918
G1 X94.254 Y196.026 E-.10911
G1 X93.973 Y195.968 E-.10914
G1 X93.425 Y195.797 E-.21823
G1 X93.128 Y195.66 E-.12433
; WIPE_END
G1 E-.04 F1800
G1 X93.143 Y188.027 Z5.2 F30000
G1 X93.204 Y157.545 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402397
G1 F10014.561
G2 X92.2 Y159.72 I1.833 J2.165 E.07244
G1 X92.201 Y191.765 E.9387
G2 X95.02 Y194.5 I2.803 J-.069 E.12745
G1 X161.065 Y194.499 E1.93466
G2 X163.8 Y191.681 I-.068 J-2.802 E.12746
G1 X163.799 Y159.635 E.9387
G2 X162.719 Y157.475 I-2.869 J.085 E.07302
; LINE_WIDTH: 0.443815
G1 F8979.92
G2 X162.54 Y157.323 I-3.195 J3.58 E.00767
; LINE_WIDTH: 0.481457
G1 F8209.116
G1 X162.258 Y157.106 E.0127
G1 X162.03 Y156.713 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.885 Y155.556 E.05401
G3 X159.448 Y156.619 I-2.321 J-1.633 E.06031
G1 X158.575 Y156.692 E.02908
G1 X158.138 Y156.545 E.01529
G3 X156.853 Y155.264 I4.231 J-5.532 E.06034
G1 X154.165 Y155.264 E.08915
G1 X153.333 Y156.164 E.04065
G3 X152.46 Y156.619 I-1.525 J-1.863 E.0329
G1 X151.586 Y156.692 E.02908
G1 X151.149 Y156.545 E.01529
G3 X149.864 Y155.264 I4.231 J-5.532 E.06034
G1 X147.177 Y155.264 E.08915
G1 X146.345 Y156.164 E.04065
G3 X145.471 Y156.619 I-1.525 J-1.863 E.0329
G1 X144.598 Y156.692 E.02908
G1 X144.161 Y156.545 E.01529
M73 P49 R22
G3 X142.876 Y155.264 I4.231 J-5.532 E.06034
G1 X140.188 Y155.264 E.08915
G1 X139.356 Y156.164 E.04065
G3 X138.483 Y156.619 I-1.525 J-1.863 E.0329
G1 X137.609 Y156.692 E.02908
G1 X137.173 Y156.545 E.01529
G3 X135.888 Y155.264 I4.231 J-5.532 E.06034
G1 X133.2 Y155.264 E.08915
G1 X132.368 Y156.164 E.04065
G3 X131.494 Y156.619 I-1.525 J-1.863 E.0329
G1 X130.621 Y156.692 E.02908
G1 X130.184 Y156.545 E.01529
G3 X128.899 Y155.264 I4.232 J-5.532 E.06034
G1 X126.212 Y155.264 E.08915
G1 X125.38 Y156.164 E.04065
G3 X124.506 Y156.619 I-1.525 J-1.863 E.0329
G1 X123.633 Y156.692 E.02908
G1 X123.196 Y156.545 E.01529
G3 X121.911 Y155.264 I4.231 J-5.532 E.06034
G1 X119.223 Y155.264 E.08915
G1 X118.391 Y156.164 E.04065
G3 X117.518 Y156.619 I-1.525 J-1.863 E.0329
G1 X116.644 Y156.692 E.02908
G1 X116.207 Y156.545 E.01529
G3 X114.922 Y155.264 I4.231 J-5.532 E.06034
G1 X112.235 Y155.264 E.08915
G1 X111.403 Y156.164 E.04065
G3 X110.529 Y156.619 I-1.525 J-1.863 E.0329
G1 X109.656 Y156.692 E.02908
G1 X109.219 Y156.545 E.01529
G3 X107.934 Y155.264 I4.231 J-5.532 E.06034
G1 X105.246 Y155.264 E.08915
G1 X104.414 Y156.164 E.04065
G3 X103.541 Y156.619 I-1.525 J-1.863 E.0329
G1 X102.667 Y156.692 E.02908
G1 X102.231 Y156.545 E.01529
G3 X100.946 Y155.264 I4.231 J-5.532 E.06034
G1 X98.258 Y155.264 E.08915
G1 X97.426 Y156.164 E.04065
G3 X96.552 Y156.619 I-1.525 J-1.863 E.0329
G1 X95.679 Y156.692 E.02908
G3 X94.656 Y156.02 I.634 J-2.08 E.04115
G1 X95.403 Y155.264 E.03525
G1 X95.969 Y155.264 E.01877
; WIPE_START
G1 X95.403 Y155.264 E-.21497
G1 X94.656 Y156.02 E-.40379
G1 X94.933 Y156.268 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X94.988 Y154.9 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417473
G1 F9611.459
G1 X82.723 Y154.9 E.37433
G1 X82.459 Y154.892 E.00807
G1 X81.997 Y154.831 E.0142
G1 X81.537 Y154.707 E.01455
G1 X81.317 Y154.623 E.00719
G1 X80.905 Y154.421 E.01399
G1 X80.508 Y154.156 E.01457
G1 X80.15 Y153.841 E.01455
G1 X79.989 Y153.669 E.00719
G1 X79.71 Y153.305 E.014
G1 X79.471 Y152.892 E.01455
G1 X79.289 Y152.451 E.01456
G1 X79.221 Y152.226 E.0072
G1 X79.132 Y151.776 E.014
G1 X79.1 Y151.277 E.01525
G1 X79.1 Y60.723 E2.76383
G1 X79.132 Y60.224 E.01525
G1 X79.221 Y59.774 E.014
G1 X79.291 Y59.543 E.00738
G1 X79.474 Y59.102 E.01457
G1 X79.703 Y58.705 E.01399
G1 X79.844 Y58.508 E.00738
G1 X80.15 Y58.159 E.01418
G1 X80.331 Y57.989 E.00757
G1 X80.7 Y57.707 E.01419
G1 X81.108 Y57.471 E.01437
G1 X81.543 Y57.291 E.01437
G1 X81.992 Y57.171 E.01418
G1 X82.459 Y57.108 E.01438
G1 X82.723 Y57.1 E.00807
G1 X173.277 Y57.1 E2.76383
G1 X173.77 Y57.131 E.01507
G1 X174.009 Y57.171 E.00739
G1 X174.452 Y57.289 E.014
G1 X174.897 Y57.474 E.01473
G1 X175.295 Y57.704 E.01401
G1 X175.491 Y57.844 E.00737
G1 X175.678 Y57.998 E.00738
G1 X176.006 Y58.326 E.01418
G1 X176.16 Y58.513 E.00738
G1 X176.414 Y58.895 E.014
G1 X176.628 Y59.328 E.01474
G1 X176.776 Y59.762 E.01401
G1 X176.831 Y59.997 E.00737
G1 X176.87 Y60.236 E.00739
G1 X176.899 Y60.673 E.01337
G1 X176.9 Y151.277 E2.76534
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.238 E.01456
G1 X176.628 Y152.672 E.014
G1 X176.531 Y152.887 E.00719
G1 X176.293 Y153.3 E.01456
G1 X176.002 Y153.678 E.01455
G1 X175.841 Y153.85 E.00719
G1 X175.496 Y154.152 E.014
G1 X175.1 Y154.418 E.01455
G1 X174.672 Y154.628 E.01456
G1 X174.237 Y154.776 E.01401
G1 X174.003 Y154.831 E.00736
G1 X173.541 Y154.892 E.0142
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37433
; WIPE_START
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.385 Y155.167 Z5.2 F30000
G1 X93.878 Y157.324 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.404683
G1 F9951.285
G1 X93.612 Y157.256 E.0081
; LINE_WIDTH: 0.440203
G1 F9061.556
G1 X93.587 Y157.25 E.00085
; LINE_WIDTH: 0.473287
G1 F8364.955
G1 X93.561 Y157.244 E.00093
G1 X93.404 Y157.369 E.00703
; LINE_WIDTH: 0.430875
G1 F9279.447
G1 X93.204 Y157.545 E.00842
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9279.447
G1 X93.404 Y157.369 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/60
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z5.2 I-.581 J1.069 P1  F30000
G1 X161.007 Y194.116 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.1911
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.438 J.069 E.12255
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.069 J2.439 E.12255
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.415 J-.045 E.12218
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.028 J.052 E.10226
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.052 J2.028 E.10226
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.032 J-.056 E.10109
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.617 J.035 E.08197
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.035 J1.617 E.08197
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.3 I-1.62 J-.038 E.08037
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.221 J.018 E.05783
G1 X161.007 Y158.49 E2.02842
M73 P49 R21
G3 X162.21 Y159.693 I-.018 J1.221 E.05783
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.907 I-1.224 J-.021 E.05596
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z5.4 F30000
G1 X95.016 Y194.884 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.545 I3.288 J.027 E.07891
G1 X95.258 Y154.916 E.12267
G1 X160.742 Y154.916 E2.17223
G1 X163.34 Y157.543 E.12257
G3 X164.182 Y159.629 I-2.383 J2.174 E.07621
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23496
G1 X94.054 Y194.739 E-.15816
G1 X93.858 Y194.671 E-.07914
G1 X93.48 Y194.496 E-.15807
G1 X93.3 Y194.391 E-.07938
G1 X93.193 Y194.313 E-.05029
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z5.4 F30000
G1 X82.643 Y154.506 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.219 J.027 E.16596
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.02 J3.212 E.16605
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.212 J-.02 E.16605
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01681
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.811 J.019 E.14522
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.013 J2.805 E.14529
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.805 J-.013 E.14529
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.418 J.011 E.116
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.006 J2.413 E.11606
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.413 J-.006 E.11607
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20092
G1 X81.778 Y153.527 E-.1795
G1 X81.361 Y153.304 E-.17954
G1 X80.996 Y153.004 E-.17956
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z5.4 F30000
G1 X95.011 Y195.291 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.706 J.035 E.08887
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.46 Y56.715 E3.01015
G3 X177.291 Y60.716 I-.179 J4.006 E.20284
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.639 Y157.266 E.09217
G3 X164.589 Y159.616 I-2.685 J2.452 E.08586
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.044 E.09884
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.474 Y56.308 E3.01081
G3 X177.698 Y60.71 I-.194 J4.414 E.22336
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.989 E.06025
G3 X164.996 Y159.602 I-2.986 J2.73 E.09552
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10045
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.487 Y55.916 E2.78952
G3 X178.09 Y60.703 I-.209 J4.808 E.22522
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.796 J-.003 E.23132
M73 P50 R21
G1 X163.6 Y156.09 E.29796
G3 X164.397 Y156.92 I-6.019 J6.58 E.03539
G3 X165.388 Y159.589 I-3.608 J2.859 E.08895
G1 X165.39 Y191.698 E.98661
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19909
G1 X94.254 Y196.026 E-.1093
G1 X93.696 Y195.891 E-.2181
G1 X93.425 Y195.797 E-.10916
G1 X93.128 Y195.66 E-.12435
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z5.4 F30000
G1 X93.167 Y157.579 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428392
G1 F9339.213
G3 X93.41 Y157.364 I4.441 J4.777 E.01018
; LINE_WIDTH: 0.475047
G1 F8330.894
G3 X93.741 Y157.104 I4.647 J5.576 E.01482
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402419
G1 F10013.96
G1 X93 Y157.742 E.00684
G2 X92.2 Y159.719 I2.015 J1.965 E.06408
G1 X92.201 Y191.765 E.93877
G2 X95.02 Y194.5 I2.802 J-.068 E.12748
G1 X161.065 Y194.499 E1.93477
G2 X163.8 Y191.681 I-.074 J-2.808 E.12738
G1 X163.799 Y159.635 E.93877
G2 X162.627 Y157.396 I-2.942 J.113 E.07653
; LINE_WIDTH: 0.455605
G1 F8723.376
G1 X162.536 Y157.322 E.00392
; LINE_WIDTH: 0.484717
G1 F8148.551
G1 X162.439 Y157.243 E.00452
G1 X162.122 Y157.324 E.01178
G1 X161.928 Y156.763 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X162.049 Y156.733 E.00413
G1 X160.991 Y155.664 E.04988
G3 X158.138 Y156.328 I-1.812 J-1.322 E.10591
G2 X156.976 Y155.264 I-49.643 J53.05 E.05224
G1 X154.424 Y155.264 E.08467
G2 X153.77 Y155.904 I3.456 J4.188 E.03036
G3 X151.149 Y156.328 I-1.582 J-1.465 E.09486
G2 X149.988 Y155.264 I-49.677 J53.088 E.05224
G1 X147.435 Y155.264 E.08467
G2 X146.782 Y155.904 I3.456 J4.188 E.03036
G3 X144.161 Y156.328 I-1.582 J-1.465 E.09486
G2 X142.999 Y155.264 I-49.643 J53.05 E.05224
G1 X140.447 Y155.264 E.08467
G2 X139.793 Y155.904 I3.456 J4.187 E.03036
G3 X137.173 Y156.328 I-1.582 J-1.465 E.09486
G2 X136.011 Y155.264 I-49.677 J53.088 E.05224
G1 X133.458 Y155.264 E.08467
G2 X132.805 Y155.904 I3.456 J4.188 E.03036
G3 X130.184 Y156.328 I-1.582 J-1.465 E.09486
G2 X129.023 Y155.264 I-49.598 J53.002 E.05224
G1 X126.47 Y155.264 E.08467
G2 X125.816 Y155.904 I3.456 J4.187 E.03036
G3 X123.196 Y156.328 I-1.582 J-1.465 E.09487
G2 X122.034 Y155.264 I-49.643 J53.05 E.05224
G1 X119.482 Y155.264 E.08467
G2 X118.828 Y155.904 I3.456 J4.188 E.03036
G3 X116.207 Y156.328 I-1.582 J-1.465 E.09486
G2 X115.046 Y155.264 I-49.598 J53.002 E.05224
G1 X112.493 Y155.264 E.08467
G2 X111.84 Y155.904 I3.456 J4.187 E.03036
G3 X109.219 Y156.328 I-1.582 J-1.465 E.09487
G2 X108.057 Y155.264 I-49.643 J53.05 E.05224
G1 X105.505 Y155.264 E.08467
G2 X104.851 Y155.904 I3.456 J4.188 E.03036
G3 X102.231 Y156.328 I-1.582 J-1.465 E.09486
G2 X101.069 Y155.264 I-49.598 J53.002 E.05224
G1 X98.516 Y155.264 E.08467
G2 X97.863 Y155.904 I3.456 J4.188 E.03036
G3 X94.767 Y155.908 I-1.55 J-1.373 E.116
G1 X95.403 Y155.264 E.03002
G1 X96.126 Y155.264 E.024
; WIPE_START
G1 X95.403 Y155.264 E-.27488
G1 X94.767 Y155.908 E-.34389
G1 X95.045 Y156.154 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X94.987 Y154.9 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417473
G1 F9611.473
G1 X82.723 Y154.9 E.37433
G1 X82.459 Y154.892 E.00807
G1 X81.998 Y154.831 E.01419
G1 X81.537 Y154.707 E.01456
G1 X81.114 Y154.531 E.01399
G1 X80.9 Y154.418 E.00738
G1 X80.504 Y154.152 E.01457
G1 X80.159 Y153.85 E.014
G1 X79.998 Y153.678 E.00718
G1 X79.707 Y153.3 E.01456
G1 X79.469 Y152.887 E.01456
G1 X79.372 Y152.672 E.00718
G1 X79.225 Y152.238 E.014
G1 X79.131 Y151.77 E.01457
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.76382
G1 X79.132 Y60.224 E.01525
G1 X79.221 Y59.774 E.014
G1 X79.291 Y59.543 E.00738
G1 X79.474 Y59.102 E.01456
G1 X79.703 Y58.705 E.014
G1 X79.844 Y58.508 E.00738
G1 X80.15 Y58.159 E.01417
G1 X80.331 Y57.989 E.00758
G1 X80.7 Y57.707 E.01418
G1 X81.108 Y57.471 E.01437
G1 X81.543 Y57.291 E.01436
G1 X81.992 Y57.171 E.01419
G1 X82.459 Y57.108 E.01438
G1 X82.723 Y57.1 E.00807
G1 X173.277 Y57.1 E2.76383
G1 X173.77 Y57.131 E.01507
G1 X174.225 Y57.221 E.01418
G1 X174.457 Y57.291 E.00739
G1 X174.683 Y57.377 E.00737
G1 X175.095 Y57.579 E.014
G1 X175.496 Y57.848 E.01474
G1 X175.841 Y58.15 E.014
G1 X176.007 Y58.326 E.00737
G1 X176.16 Y58.513 E.00738
G1 X176.414 Y58.895 E.014
G1 X176.628 Y59.328 E.01475
G1 X176.776 Y59.763 E.014
G1 X176.831 Y59.997 E.00736
G1 X176.87 Y60.236 E.00739
G1 X176.899 Y60.673 E.01337
G1 X176.9 Y151.277 E2.76534
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.237 E.01456
G1 X176.628 Y152.672 E.01401
G1 X176.531 Y152.887 E.00718
G1 X176.293 Y153.3 E.01456
G1 X176.002 Y153.678 E.01456
G1 X175.841 Y153.85 E.0072
G1 X175.496 Y154.152 E.01399
G1 X175.1 Y154.418 E.01455
G1 X174.672 Y154.628 E.01457
G1 X174.237 Y154.776 E.01399
G1 X174.003 Y154.831 E.00737
G1 X173.541 Y154.892 E.0142
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37434
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.473
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/60
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z5.4 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.415 E.12286
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.431 J.061 E.12266
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.07 J2.44 E.12253
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.094 I-2.436 J-.067 E.11364
G1 X161.146 Y194.108 E.00564
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.056 J-2.032 E.10221
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.021 J.045 E.10235
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.053 J2.029 E.10224
G1 X163.009 Y191.733 E1.06369
G3 X161.067 Y193.708 I-2.026 J-.05 E.10117
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.038 J-1.62 E.08193
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.611 J.029 E.08205
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.037 J1.619 E.08195
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.3 I-1.615 J-.033 E.08044
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.021 J-1.224 E.0578
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.216 J.013 E.05789
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.02 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.22 J-.017 E.05602
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z5.6 F30000
G1 X95.016 Y194.884 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.658 Y157.545 I3.288 J.027 E.07892
G1 X95.258 Y154.916 E.12266
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.629 I-2.369 J2.165 E.07611
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23494
G1 X94.255 Y194.794 E-.07909
G1 X93.858 Y194.671 E-.1582
G1 X93.48 Y194.496 E-.15829
G1 X93.3 Y194.391 E-.07913
G1 X93.193 Y194.313 E-.05035
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z5.6 F30000
G1 X82.643 Y154.506 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.212 J.02 E.16605
G1 X173.317 Y57.491 E3.00649
G3 X175.327 Y58.213 I-.022 J3.218 E.07222
G3 X176.509 Y60.683 I-2.063 J2.506 E.09376
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.805 J.013 E.14529
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.0144
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.413 J.006 E.11607
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.006 J2.413 E.11606
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20077
G1 X81.778 Y153.527 E-.17943
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.004 E-.17955
G1 X80.961 Y152.962 E-.02073
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z5.6 F30000
G1 X95.011 Y195.291 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.36 Y157.268 I3.706 J.035 E.08889
G1 X94.315 Y155.291 E.09223
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.455 Y56.715 E3.00996
G3 X177.291 Y60.716 I-.157 J3.99 E.20324
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.615 I-2.67 J2.444 E.0858
M73 P51 R21
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.062 Y156.99 I4.123 J.044 E.09885
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.468 Y56.308 E3.01063
G3 X177.698 Y60.71 I-.17 J4.397 E.22378
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.97 J2.723 E.09548
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.811 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.723 I4.525 J.052 E.10046
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.481 Y55.916 E2.78935
G3 X178.09 Y60.703 I-.183 J4.789 E.22563
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.281 J6.839 E.03423
G3 X165.388 Y159.589 I-3.538 J2.871 E.09014
G1 X165.39 Y191.698 E.98662
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19919
G1 X94.254 Y196.026 E-.10913
G1 X93.973 Y195.968 E-.10911
G1 X93.425 Y195.797 E-.21825
G1 X93.128 Y195.66 E-.12433
; WIPE_END
G1 E-.04 F1800
G1 X93.049 Y188.028 Z5.6 F30000
G1 X92.741 Y158.048 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402394
G1 F10014.644
G1 X92.671 Y158.147 E.00354
G2 X92.2 Y159.719 I2.369 J1.566 E.04877
G1 X92.201 Y191.765 E.9387
G2 X95.02 Y194.5 I2.808 J-.074 E.12739
G1 X161.065 Y194.499 E1.93464
G2 X163.8 Y191.68 I-.071 J-2.805 E.12742
G1 X163.799 Y159.635 E.93869
G2 X162.719 Y157.476 I-2.868 J.084 E.07299
; LINE_WIDTH: 0.443695
G1 F8982.594
G2 X162.54 Y157.323 I-3.197 J3.581 E.0077
; LINE_WIDTH: 0.48144
G1 F8209.443
G1 X162.258 Y157.106 E.0127
G1 X161.949 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X162.081 Y156.765 E.00715
G1 X161.088 Y155.761 E.04686
G3 X158.138 Y156.143 I-1.675 J-1.35 E.10894
G2 X157.166 Y155.264 I-11.847 J12.123 E.04345
G1 X154.637 Y155.264 E.08392
G1 X154.207 Y155.659 E.01936
G3 X151.149 Y156.143 I-1.771 J-1.291 E.11401
G2 X150.178 Y155.264 I-11.849 J12.126 E.04345
G1 X147.648 Y155.264 E.08392
G1 X147.218 Y155.659 E.01936
G3 X144.161 Y156.143 I-1.771 J-1.291 E.11401
G2 X143.19 Y155.264 I-11.847 J12.123 E.04345
G1 X140.66 Y155.264 E.08392
G1 X140.23 Y155.659 E.01936
G3 X137.173 Y156.143 I-1.771 J-1.291 E.11401
G2 X136.201 Y155.264 I-11.849 J12.126 E.04345
M73 P51 R20
G1 X133.671 Y155.264 E.08392
G1 X133.242 Y155.659 E.01936
G3 X130.184 Y156.143 I-1.771 J-1.291 E.11401
G2 X129.213 Y155.264 I-11.842 J12.118 E.04345
G1 X126.683 Y155.264 E.08392
G1 X126.253 Y155.659 E.01936
G3 X123.196 Y156.143 I-1.771 J-1.291 E.11401
G2 X122.224 Y155.264 I-11.847 J12.123 E.04345
G1 X119.695 Y155.264 E.08392
G1 X119.265 Y155.659 E.01936
G3 X116.207 Y156.143 I-1.771 J-1.291 E.11401
G2 X115.236 Y155.264 I-11.842 J12.118 E.04345
G1 X112.706 Y155.264 E.08392
G1 X112.276 Y155.659 E.01936
G3 X109.219 Y156.143 I-1.771 J-1.291 E.11401
G2 X108.248 Y155.264 I-11.847 J12.123 E.04345
G1 X105.718 Y155.264 E.08392
G1 X105.288 Y155.659 E.01936
G3 X102.231 Y156.143 I-1.771 J-1.291 E.11401
G2 X101.259 Y155.264 I-11.842 J12.118 E.04345
G1 X98.729 Y155.264 E.08392
G1 X98.3 Y155.659 E.01936
G3 X94.871 Y155.802 I-1.771 J-1.289 E.13076
G1 X93.95 Y156.734 E.04346
G1 X94.209 Y156.841 E.00928
G1 X93.878 Y157.324 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.404444
G1 F9957.847
G1 X93.612 Y157.256 E.00809
; LINE_WIDTH: 0.44001
G1 F9065.96
G1 X93.587 Y157.25 E.00086
; LINE_WIDTH: 0.472465
G1 F8380.964
G1 X93.561 Y157.244 E.00093
G1 X93.398 Y157.374 E.0073
; LINE_WIDTH: 0.410422
G1 F9795.877
G2 X92.741 Y158.048 I2.383 J2.981 E.02828
; WIPE_START
G1 X93.017 Y157.725 E-.34257
G1 X93.398 Y157.374 E-.41743
; WIPE_END
G1 E-.04 F1800
G1 X94.988 Y154.9 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.417474
G1 F9611.448
G1 X82.723 Y154.9 E.37434
G1 X82.459 Y154.892 E.00807
G1 X81.997 Y154.831 E.0142
G1 X81.762 Y154.776 E.00737
G1 X81.328 Y154.628 E.014
G1 X80.9 Y154.418 E.01455
G1 X80.504 Y154.152 E.01456
G1 X80.322 Y154.002 E.0072
G1 X79.998 Y153.678 E.014
G1 X79.707 Y153.3 E.01456
G1 X79.469 Y152.887 E.01456
G1 X79.372 Y152.672 E.00719
G1 X79.224 Y152.237 E.01401
G1 X79.131 Y151.77 E.01455
G1 X79.1 Y151.277 E.01507
G1 X79.101 Y60.673 E2.76534
G1 X79.13 Y60.236 E.01337
G1 X79.169 Y59.997 E.00739
G1 X79.224 Y59.762 E.00737
G1 X79.372 Y59.328 E.014
G1 X79.585 Y58.895 E.01474
G1 X79.84 Y58.513 E.014
G1 X79.993 Y58.326 E.00738
G1 X80.159 Y58.15 E.00737
G1 X80.504 Y57.848 E.01401
G1 X80.905 Y57.579 E.01474
G1 X81.317 Y57.377 E.014
G1 X81.543 Y57.291 E.00738
G1 X81.774 Y57.221 E.00738
G1 X82.23 Y57.131 E.01419
G1 X82.723 Y57.1 E.01507
G1 X173.277 Y57.1 E2.76383
G1 X173.541 Y57.108 E.00807
G1 X174.008 Y57.171 E.01438
G1 X174.457 Y57.291 E.01418
G1 X174.892 Y57.471 E.01437
G1 X175.295 Y57.703 E.01419
G1 X175.496 Y57.848 E.00756
G1 X175.846 Y58.154 E.01419
G1 X176.152 Y58.504 E.01419
G1 X176.421 Y58.905 E.01474
G1 X176.624 Y59.317 E.01401
G1 X176.709 Y59.543 E.00738
G1 X176.779 Y59.774 E.00737
G1 X176.868 Y60.224 E.01401
G1 X176.9 Y60.723 E.01525
G1 X176.9 Y151.277 E2.76383
G1 X176.868 Y151.776 E.01525
G1 X176.779 Y152.226 E.014
G1 X176.711 Y152.451 E.00719
G1 X176.529 Y152.892 E.01456
G1 X176.29 Y153.305 E.01456
G1 X176.011 Y153.669 E.01399
G1 X175.85 Y153.841 E.0072
G1 X175.492 Y154.156 E.01455
G1 X175.095 Y154.42 E.01455
G1 X174.683 Y154.624 E.01401
G1 X174.463 Y154.707 E.00718
G1 X174.002 Y154.831 E.01456
G1 X173.541 Y154.892 E.01419
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.448
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/60
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z5.6 I-1.215 J-.062 P1  F30000
G1 X161.007 Y194.116 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.1911
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.438 J.068 E.12256
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.07 J2.44 E.12253
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.421 J-.051 E.1221
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.027 J.051 E.10227
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.053 J2.029 E.10224
G1 X163.009 Y191.733 E1.06369
G3 X161.067 Y193.708 I-2.014 J-.038 E.10133
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.616 J.034 E.08198
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.037 J1.619 E.08195
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.606 J-.024 E.08056
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.0579
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.221 J.018 E.05783
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.02 J1.223 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.214 J-.011 E.05609
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z5.8 F30000
G1 X95.015 Y194.884 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.004 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.286 J.026 E.07908
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17223
G1 X163.342 Y157.545 E.12267
G3 X164.182 Y159.629 I-2.386 J2.172 E.07611
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.075 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23488
G1 X94.255 Y194.794 E-.07905
G1 X93.858 Y194.671 E-.15818
G1 X93.48 Y194.496 E-.15831
G1 X93.3 Y194.391 E-.07907
G1 X93.19 Y194.316 E-.05051
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z5.8 F30000
G1 X82.643 Y154.506 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8843.478
M73 P52 R20
G1 X82.281 Y154.481 E.01203
G3 X79.491 Y151.317 I.422 J-3.184 E.15269
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.212 J.02 E.16605
G1 X173.317 Y57.491 E3.00649
G3 X175.329 Y58.215 I-.022 J3.219 E.0723
G3 X176.509 Y60.683 I-2.084 J2.513 E.09365
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.212 J-.02 E.16605
G1 X82.703 Y154.509 E3.00583
G1 X82.67 Y154.101 F30000
G1 F8843.478
G1 X82.334 Y154.078 E.01117
G3 X80.54 Y153.083 I.369 J-2.782 E.06966
G3 X80.022 Y152.121 I2.161 J-1.784 E.03648
G3 X79.898 Y151.31 I2.731 J-.833 E.02731
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.805 J.013 E.14529
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.013 J2.805 E.14529
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.805 J-.013 E.14529
G1 X82.73 Y154.102 E3.0047
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.0144
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.413 J.006 E.11607
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.006 J2.413 E.11607
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.413 J-.006 E.11607
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20074
G1 X81.778 Y153.527 E-.17941
G1 X81.361 Y153.304 E-.17958
G1 X80.996 Y153.004 E-.17951
G1 X80.961 Y152.962 E-.02075
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z5.8 F30000
G1 X95.011 Y195.291 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.704 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.45 Y56.715 E3.00978
G3 X177.291 Y60.716 I-.152 J3.99 E.20342
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.268 E.09224
G3 X164.589 Y159.616 I-2.687 J2.451 E.08579
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.122 J.043 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.463 Y56.308 E3.01045
G3 X177.698 Y60.71 I-.165 J4.397 E.22396
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.06029
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20821
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.051 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.476 Y55.916 E2.78918
G3 X178.09 Y60.703 I-.178 J4.789 E.22579
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.285 J6.843 E.03422
G3 X165.388 Y159.589 I-3.578 J2.887 E.09012
G1 X165.39 Y191.698 E.98661
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19917
G1 X94.254 Y196.026 E-.10914
G1 X93.696 Y195.891 E-.21823
G1 X93.425 Y195.797 E-.10905
G1 X93.16 Y195.685 E-.10919
G1 X93.125 Y195.666 E-.01523
; WIPE_END
G1 E-.04 F1800
G1 X93.048 Y188.034 Z5.8 F30000
G1 X92.744 Y158.043 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402393
G1 F10014.678
G1 X92.66 Y158.163 E.00428
G2 X92.2 Y159.719 I2.361 J1.545 E.04823
G1 X92.201 Y191.765 E.9387
G2 X95.02 Y194.5 I2.802 J-.067 E.12746
G1 X161.065 Y194.499 E1.93463
G2 X163.8 Y191.681 I-.071 J-2.805 E.12742
G1 X163.799 Y159.635 E.93869
G2 X162.719 Y157.476 I-2.862 J.081 E.073
; LINE_WIDTH: 0.44368
G1 F8982.941
G2 X162.54 Y157.323 I-3.2 J3.586 E.00769
; LINE_WIDTH: 0.481446
G1 F8209.324
G1 X162.258 Y157.106 E.01272
G1 X161.86 Y157.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X162.081 Y156.765 E.01201
G1 X161.191 Y155.865 E.04201
G3 X158.575 Y156.298 I-1.565 J-1.333 E.0956
G3 X157.391 Y155.264 I8.255 J-10.648 E.05217
G1 X154.863 Y155.264 E.08384
G2 X154.207 Y155.861 I1.788 J2.627 E.02951
G3 X151.586 Y156.298 I-1.569 J-1.331 E.09581
G3 X150.402 Y155.264 I8.258 J-10.651 E.05217
G1 X147.875 Y155.264 E.08384
G2 X147.218 Y155.861 I1.788 J2.627 E.02951
G3 X144.598 Y156.298 I-1.569 J-1.331 E.09581
G3 X143.414 Y155.264 I8.255 J-10.648 E.05217
G1 X140.886 Y155.264 E.08384
G2 X140.23 Y155.861 I1.788 J2.627 E.02952
G3 X137.609 Y156.298 I-1.569 J-1.331 E.09581
G3 X136.425 Y155.264 I8.258 J-10.651 E.05217
G1 X133.898 Y155.264 E.08384
G2 X133.242 Y155.861 I1.788 J2.627 E.02951
G3 X130.621 Y156.298 I-1.569 J-1.331 E.09581
G3 X129.437 Y155.264 I8.255 J-10.648 E.05217
G1 X126.91 Y155.264 E.08384
G2 X126.253 Y155.861 I1.788 J2.627 E.02952
G3 X123.633 Y156.298 I-1.569 J-1.331 E.09581
G3 X122.449 Y155.264 I8.258 J-10.651 E.05217
M73 P53 R20
G1 X119.921 Y155.264 E.08384
G2 X119.265 Y155.861 I1.788 J2.627 E.02951
G3 X116.644 Y156.298 I-1.569 J-1.331 E.09581
G3 X115.46 Y155.264 I8.258 J-10.651 E.05217
G1 X112.933 Y155.264 E.08384
G2 X112.276 Y155.861 I1.788 J2.627 E.02952
G3 X109.656 Y156.298 I-1.569 J-1.331 E.09581
G3 X108.472 Y155.264 I8.258 J-10.651 E.05217
G1 X105.944 Y155.264 E.08384
G2 X105.288 Y155.861 I1.788 J2.627 E.02951
G3 X102.667 Y156.298 I-1.569 J-1.331 E.09581
G3 X101.483 Y155.264 I8.258 J-10.651 E.05217
G1 X98.956 Y155.264 E.08384
G2 X98.3 Y155.861 I1.788 J2.627 E.02951
G3 X94.97 Y155.703 I-1.6 J-1.446 E.12639
G1 X93.95 Y156.734 E.04811
G1 X94.074 Y156.805 E.00475
G1 X93.878 Y157.324 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.404507
G1 F9956.132
G1 X93.612 Y157.256 E.00809
; LINE_WIDTH: 0.440074
G1 F9064.505
G1 X93.586 Y157.25 E.00086
; LINE_WIDTH: 0.472457
G1 F8381.115
G1 X93.561 Y157.244 E.00093
G1 X93.398 Y157.374 E.0073
; LINE_WIDTH: 0.410489
G1 F9794.099
G2 X92.744 Y158.043 I2.372 J2.971 E.02809
; WIPE_START
G1 X93 Y157.741 E-.32105
G1 X93.398 Y157.374 E-.43895
; WIPE_END
G1 E-.04 F1800
G1 X94.987 Y154.9 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.417473
G1 F9611.46
G1 X82.723 Y154.9 E.37432
G1 X82.459 Y154.892 E.00807
G1 X81.998 Y154.831 E.01419
G1 X81.537 Y154.707 E.01455
G1 X81.317 Y154.623 E.00719
G1 X80.905 Y154.42 E.01401
G1 X80.509 Y154.156 E.01455
G1 X80.15 Y153.841 E.01455
G1 X79.99 Y153.669 E.0072
G1 X79.71 Y153.305 E.014
G1 X79.471 Y152.892 E.01457
G1 X79.374 Y152.678 E.00718
G1 X79.259 Y152.352 E.01053
G1 X79.169 Y152.002 E.01103
G1 X79.131 Y151.77 E.00719
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.76382
G1 X79.132 Y60.224 E.01525
G1 X79.221 Y59.775 E.014
G1 X79.291 Y59.543 E.00739
G1 X79.474 Y59.102 E.01456
G1 X79.703 Y58.705 E.014
G1 X79.844 Y58.508 E.00739
G1 X80.154 Y58.155 E.01436
G1 X80.411 Y57.924 E.01053
G1 X80.7 Y57.707 E.01104
G1 X81.108 Y57.471 E.01437
G1 X81.543 Y57.291 E.01437
G1 X81.991 Y57.171 E.01417
G1 X82.459 Y57.108 E.01439
G1 X82.723 Y57.1 E.00807
G1 X173.277 Y57.1 E2.76383
G1 X173.77 Y57.131 E.01507
G1 X174.226 Y57.221 E.01418
G1 X174.457 Y57.291 E.00738
G1 X174.683 Y57.377 E.00737
G1 X175.095 Y57.579 E.014
G1 X175.496 Y57.848 E.01475
G1 X175.841 Y58.15 E.01399
G1 X176.007 Y58.326 E.00738
G1 X176.16 Y58.514 E.00738
G1 X176.414 Y58.895 E.01399
G1 X176.628 Y59.328 E.01474
G1 X176.776 Y59.763 E.014
G1 X176.831 Y59.997 E.00736
G1 X176.87 Y60.236 E.00739
G1 X176.899 Y60.673 E.01337
G1 X176.9 Y151.277 E2.76534
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.238 E.01456
G1 X176.628 Y152.672 E.01399
G1 X176.529 Y152.892 E.00738
G1 X176.29 Y153.305 E.01456
G1 X176.152 Y153.496 E.00719
G1 X175.85 Y153.841 E.014
G1 X175.491 Y154.156 E.01456
G1 X175.095 Y154.421 E.01456
G1 X174.683 Y154.623 E.014
G1 X174.463 Y154.707 E.0072
G1 X174.002 Y154.831 E.01455
G1 X173.541 Y154.892 E.01419
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.46
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/60
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z5.8 I-1.216 J-.058 P1  F30000
G1 X161.139 Y194.106 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00309
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.43 J.061 E.12265
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.494 Y194.065 I-2.423 J-.053 E.10779
G1 X161.199 Y194.099 E.00986
G1 X161.093 Y193.703 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.002
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.021 J.045 E.10235
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10242
G1 X163.009 Y191.733 E1.0637
G3 X161.408 Y193.667 I-2.015 J-.039 E.08989
G1 X161.153 Y193.696 E.00852
G1 X161.048 Y193.299 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00095
G1 X94.98 Y193.302 E2.19066
G3 X93.398 Y191.72 I.026 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.611 J.029 E.08205
G1 X161.02 Y158.098 E2.19066
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.322 Y193.269 I-1.608 J-.025 E.07199
G1 X161.108 Y193.292 E.00715
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.0579
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.216 J.013 E.05789
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.012 J1.215 E.0579
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z6 F30000
G1 X95.016 Y194.884 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.546 I3.288 J.027 E.0789
G1 X95.258 Y154.916 E.12268
G1 X160.742 Y154.916 E2.17223
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.629 I-2.387 J2.172 E.0761
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23489
G1 X94.055 Y194.739 E-.15818
G1 X93.858 Y194.671 E-.07906
G1 X93.48 Y194.496 E-.15829
G1 X93.3 Y194.391 E-.07912
G1 X93.193 Y194.313 E-.05045
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z6 F30000
G1 X82.643 Y154.506 Z6
G1 Z5.6
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.0144
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20073
G1 X81.778 Y153.527 E-.17942
G1 X81.361 Y153.304 E-.17952
G1 X80.996 Y153.004 E-.17955
G1 X80.961 Y152.962 E-.02077
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z6 F30000
G1 X95.011 Y195.291 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.706 J.035 E.08888
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.444 Y56.714 E3.0096
G3 X177.291 Y60.716 I-.146 J3.99 E.2036
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.616 I-2.687 J2.451 E.08578
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.044 E.09884
G1 X93.34 Y155.698 E.0603
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.457 Y56.308 E3.01027
G3 X177.698 Y60.71 I-.16 J4.397 E.22414
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10045
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.47 Y55.916 E2.78901
G3 X178.09 Y60.703 I-.172 J4.789 E.22596
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.285 J6.843 E.03423
G3 X165.388 Y159.589 I-3.579 J2.887 E.09011
G1 X165.39 Y191.698 E.98661
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1991
M73 P53 R19
G1 X94.254 Y196.026 E-.10923
G1 X93.696 Y195.891 E-.21812
G1 X93.425 Y195.797 E-.10915
G1 X93.128 Y195.66 E-.1244
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z6 F30000
G1 X93.167 Y157.579 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42844
G1 F9338.045
G3 X93.411 Y157.363 I4.502 J4.846 E.01022
; LINE_WIDTH: 0.475181
G1 F8328.315
G3 X93.741 Y157.104 I4.524 J5.427 E.01479
G1 X93.932 Y156.752 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X95.077 Y155.595 E.05401
M73 P54 R19
G2 X97.426 Y156.625 I2.009 J-1.386 E.0896
G2 X98.3 Y156.079 I-.38 J-1.58 E.03476
G1 X99.109 Y155.264 E.0381
G1 X101.726 Y155.264 E.08683
G3 X102.667 Y156.201 I-5.008 J5.972 E.04409
G2 X104.851 Y156.45 I1.299 J-1.69 E.07661
G2 X106.097 Y155.264 I-6.311 J-7.882 E.05713
G1 X108.715 Y155.264 E.08683
G3 X109.656 Y156.201 I-5.008 J5.972 E.04409
G2 X111.84 Y156.45 I1.299 J-1.69 E.07661
G2 X113.086 Y155.264 I-6.312 J-7.883 E.05713
G1 X115.703 Y155.264 E.08683
G3 X116.644 Y156.201 I-5.008 J5.972 E.04409
G2 X118.828 Y156.45 I1.299 J-1.69 E.07661
G2 X120.074 Y155.264 I-6.311 J-7.882 E.05713
G1 X122.692 Y155.264 E.08683
G3 X123.633 Y156.201 I-5.008 J5.972 E.04409
G2 X125.816 Y156.45 I1.299 J-1.69 E.07661
G2 X127.063 Y155.264 I-6.312 J-7.883 E.05713
G1 X129.68 Y155.264 E.08683
G3 X130.621 Y156.201 I-5.008 J5.972 E.04409
G2 X132.805 Y156.45 I1.299 J-1.69 E.07661
G2 X134.051 Y155.264 I-6.311 J-7.882 E.05713
G1 X136.669 Y155.264 E.08683
G3 X137.609 Y156.201 I-5.008 J5.972 E.04409
G2 X139.793 Y156.45 I1.299 J-1.69 E.07661
G2 X141.039 Y155.264 I-6.312 J-7.883 E.05713
G1 X143.657 Y155.264 E.08683
G3 X144.598 Y156.201 I-5.008 J5.972 E.04409
G2 X146.782 Y156.45 I1.299 J-1.69 E.07661
G2 X148.028 Y155.264 I-6.311 J-7.882 E.05713
G1 X150.645 Y155.264 E.08683
G3 X151.586 Y156.201 I-5.008 J5.972 E.04409
G2 X153.77 Y156.45 I1.299 J-1.69 E.07661
G2 X155.016 Y155.264 I-6.311 J-7.882 E.05713
G1 X157.634 Y155.264 E.08683
G3 X158.575 Y156.201 I-5.008 J5.972 E.04409
G2 X160.758 Y156.45 I1.299 J-1.69 E.07661
G2 X161.299 Y155.975 I-2.508 J-3.399 E.02391
G1 X160.597 Y155.264 E.03314
G1 X159.967 Y155.264 E.02087
; WIPE_START
G1 X160.597 Y155.264 E-.23912
G1 X161.299 Y155.975 E-.37964
G1 X161.02 Y156.22 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417473
G1 F9611.456
G1 X173.277 Y154.9 E.37433
G1 X173.541 Y154.892 E.00807
G1 X174.003 Y154.831 E.0142
G1 X174.237 Y154.776 E.00736
G1 X174.672 Y154.628 E.014
G1 X175.1 Y154.418 E.01457
G1 X175.496 Y154.152 E.01455
G1 X175.678 Y154.002 E.00719
G1 X176.002 Y153.678 E.014
G1 X176.293 Y153.3 E.01456
G1 X176.531 Y152.887 E.01456
G1 X176.707 Y152.463 E.014
G1 X176.776 Y152.237 E.0072
G1 X176.869 Y151.77 E.01456
G1 X176.9 Y151.277 E.01507
G1 X176.899 Y60.673 E2.76534
G1 X176.87 Y60.236 E.01337
G1 X176.831 Y59.997 E.00739
G1 X176.776 Y59.763 E.00736
G1 X176.628 Y59.328 E.014
G1 X176.414 Y58.895 E.01475
G1 X176.16 Y58.513 E.014
G1 X176.007 Y58.326 E.00737
G1 X175.841 Y58.15 E.00737
G1 X175.492 Y57.844 E.01419
G1 X175.295 Y57.703 E.00738
G1 X174.898 Y57.474 E.014
G1 X174.452 Y57.289 E.01474
G1 X174.008 Y57.171 E.014
G1 X173.77 Y57.131 E.00738
G1 X173.277 Y57.1 E.01508
G1 X82.723 Y57.1 E2.76382
G1 X82.459 Y57.108 E.00807
G1 X81.992 Y57.171 E.01438
G1 X81.543 Y57.291 E.01418
G1 X81.108 Y57.471 E.01437
G1 X80.7 Y57.707 E.01437
G1 X80.331 Y57.989 E.01419
G1 X80.15 Y58.159 E.00757
G1 X79.844 Y58.509 E.01419
G1 X79.703 Y58.705 E.00738
G1 X79.474 Y59.103 E.014
G1 X79.291 Y59.543 E.01455
G1 X79.221 Y59.774 E.00738
G1 X79.132 Y60.224 E.01401
G1 X79.1 Y60.723 E.01525
G1 X79.1 Y151.277 E2.76383
G1 X79.132 Y151.776 E.01525
G1 X79.171 Y152.009 E.0072
G1 X79.289 Y152.451 E.014
G1 X79.471 Y152.892 E.01455
G1 X79.71 Y153.305 E.01456
G1 X79.989 Y153.669 E.014
G1 X80.15 Y153.841 E.00719
G1 X80.509 Y154.156 E.01456
G1 X80.905 Y154.421 E.01456
G1 X81.317 Y154.623 E.014
G1 X81.537 Y154.707 E.00719
G1 X81.998 Y154.831 E.01456
G1 X82.459 Y154.892 E.01419
G1 X82.723 Y154.9 E.00807
G1 X94.988 Y154.9 E.37433
; WIPE_START
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.167 Y157.579 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.402388
G1 F10014.796
G1 X93.017 Y157.725 E.00614
G2 X92.2 Y159.719 I1.996 J1.982 E.06478
G1 X92.201 Y191.765 E.93868
G2 X95.02 Y194.5 I2.802 J-.067 E.12746
G1 X161.065 Y194.499 E1.93461
G2 X163.8 Y191.681 I-.068 J-2.802 E.12746
G1 X163.799 Y159.635 E.93868
G2 X162.727 Y157.482 I-2.875 J.088 E.07267
; LINE_WIDTH: 0.442767
G1 F9003.461
G2 X162.54 Y157.323 I-3.321 J3.719 E.00801
; LINE_WIDTH: 0.481402
G1 F8210.149
G1 X162.258 Y157.106 E.01272
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8210.149
G1 X162.54 Y157.323 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/60
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z6 I-1.216 J-.051 P1  F30000
G1 X161.007 Y194.116 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.1911
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.443 J.073 E.12249
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.067 J2.437 E.12257
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12209
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.032 J.056 E.10221
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.05 J2.026 E.10228
G1 X163.009 Y191.733 E1.06369
G3 X161.262 Y193.692 I-2.015 J-.039 E.0948
G1 X161.119 Y193.703 E.00477
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.62 J.038 E.08193
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.033 J1.616 E.08199
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08054
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.017 J1.22 E.05784
G1 X162.21 Y191.707 E.9837
G3 X161.313 Y192.868 I-1.215 J-.012 E.0484
G1 X161.067 Y192.902 E.00764
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02286
G1 X159.067 Y192.91 E-.73714
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z6.2 F30000
G1 X95.015 Y194.884 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.004 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.545 I3.287 J.026 E.07891
G1 X95.258 Y154.916 E.12267
G1 X160.742 Y154.916 E2.17223
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.624 I-2.387 J2.173 E.07593
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.075 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23491
G1 X94.054 Y194.739 E-.15823
G1 X93.858 Y194.671 E-.07907
G1 X93.48 Y194.496 E-.15816
G1 X93.3 Y194.391 E-.07923
G1 X93.193 Y194.313 E-.0504
; WIPE_END
G1 E-.04 F1800
G1 X91.237 Y186.935 Z6.2 F30000
G1 X82.643 Y154.506 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.212 J.02 E.16605
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.02 J3.212 E.16605
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.153 Y154.048 E.0168
G3 X79.898 Y151.31 I.55 J-2.751 E.12738
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.805 J.013 E.14529
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.013 J2.805 E.14529
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.413 J.006 E.11607
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.006 J2.413 E.11607
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20071
G1 X81.778 Y153.527 E-.17944
G1 X81.361 Y153.304 E-.17952
G1 X80.996 Y153.004 E-.17955
G1 X80.961 Y152.962 E-.02078
; WIPE_END
G1 E-.04 F1800
G1 X83.365 Y160.206 Z6.2 F30000
G1 X95.011 Y195.291 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.705 J.035 E.08887
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.439 Y56.714 E3.00942
G3 X177.291 Y60.717 I-.157 J4.006 E.20357
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.612 I-2.688 J2.451 E.08566
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.043 E.09884
G1 X93.34 Y155.698 E.0603
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
M73 P55 R19
G1 X173.452 Y56.307 E3.01009
G3 X177.698 Y60.71 I-.172 J4.415 E.22409
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.6 I-2.988 J2.73 E.0954
G1 X164.998 Y191.694 E1.06461
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20821
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10045
G1 X92.4 Y156.09 E.02736
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.465 Y55.915 E2.78885
G3 X178.09 Y60.703 I-.187 J4.808 E.22589
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.287 J6.845 E.03423
G3 X165.388 Y159.589 I-3.579 J2.887 E.09009
G1 X165.39 Y191.698 E.98664
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19917
G1 X94.254 Y196.026 E-.10921
G1 X93.696 Y195.891 E-.21817
G1 X93.425 Y195.797 E-.10911
G1 X93.128 Y195.66 E-.12434
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z6.2 F30000
G1 X93.167 Y157.579 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428525
G1 F9335.983
G3 X93.411 Y157.363 I4.528 J4.875 E.01023
; LINE_WIDTH: 0.475371
G1 F8324.641
G3 X93.741 Y157.104 I4.55 J5.464 E.0148
G1 X94.027 Y156.656 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X95.172 Y155.498 E.05401
G2 X97.426 Y156.797 I2.291 J-1.371 E.09014
G2 X98.3 Y156.347 I-.032 J-1.134 E.03371
G1 X99.203 Y155.264 E.04678
G1 X101.967 Y155.264 E.0917
G1 X102.667 Y156.114 E.03651
G2 X104.851 Y156.696 I1.626 J-1.711 E.07818
G1 X105.288 Y156.347 E.01855
G1 X106.192 Y155.264 E.04678
G1 X108.956 Y155.264 E.0917
G1 X109.656 Y156.114 E.03651
G2 X111.84 Y156.696 I1.626 J-1.711 E.07818
G1 X112.276 Y156.347 E.01855
G1 X113.18 Y155.264 E.04678
G1 X115.944 Y155.264 E.0917
G1 X116.644 Y156.114 E.03651
G2 X118.828 Y156.696 I1.626 J-1.711 E.07818
G1 X119.265 Y156.347 E.01855
G1 X120.168 Y155.264 E.04678
G1 X122.933 Y155.264 E.0917
G1 X123.633 Y156.114 E.03651
G2 X125.816 Y156.696 I1.626 J-1.711 E.07818
G1 X126.253 Y156.347 E.01855
G1 X127.157 Y155.264 E.04678
G1 X129.921 Y155.264 E.0917
G1 X130.621 Y156.114 E.03651
G2 X132.805 Y156.696 I1.626 J-1.711 E.07818
G1 X133.242 Y156.347 E.01855
G1 X134.145 Y155.264 E.04678
G1 X136.909 Y155.264 E.0917
G1 X137.609 Y156.114 E.03651
G2 X139.793 Y156.696 I1.626 J-1.711 E.07818
G1 X140.23 Y156.347 E.01855
G1 X141.134 Y155.264 E.04678
G1 X143.898 Y155.264 E.0917
G1 X144.598 Y156.114 E.03651
G2 X146.782 Y156.696 I1.626 J-1.711 E.07818
G1 X147.218 Y156.347 E.01855
G1 X148.122 Y155.264 E.04678
G1 X150.886 Y155.264 E.0917
G1 X151.586 Y156.114 E.03651
G2 X153.77 Y156.696 I1.626 J-1.711 E.07818
G1 X154.207 Y156.347 E.01855
G1 X155.11 Y155.264 E.04678
G1 X157.875 Y155.264 E.0917
G1 X158.575 Y156.114 E.03651
G2 X160.758 Y156.696 I1.626 J-1.711 E.07818
G2 X161.41 Y156.087 I-1.123 J-1.853 E.02981
G1 X160.597 Y155.264 E.03836
G1 X160.125 Y155.264 E.01565
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417474
G1 F9611.453
G1 X173.277 Y154.9 E.37433
G1 X173.541 Y154.892 E.00807
G1 X174.002 Y154.831 E.0142
G1 X174.237 Y154.776 E.00737
G1 X174.672 Y154.628 E.01401
G1 X175.1 Y154.418 E.01455
G1 X175.496 Y154.152 E.01456
G1 X175.841 Y153.85 E.01399
G1 X176.003 Y153.678 E.00721
G1 X176.293 Y153.3 E.01456
G1 X176.531 Y152.887 E.01456
G1 X176.628 Y152.672 E.00719
G1 X176.776 Y152.237 E.01401
G1 X176.869 Y151.77 E.01456
G1 X176.9 Y151.277 E.01507
G1 X176.899 Y60.673 E2.76534
G1 X176.87 Y60.236 E.01337
G1 X176.831 Y59.997 E.00739
G1 X176.776 Y59.763 E.00736
G1 X176.628 Y59.328 E.01401
G1 X176.415 Y58.895 E.01473
G1 X176.16 Y58.513 E.01401
G1 X176.007 Y58.326 E.00737
G1 X175.841 Y58.15 E.00737
G1 X175.491 Y57.844 E.01419
G1 X175.3 Y57.707 E.00719
G1 X174.993 Y57.525 E.01089
G1 X174.678 Y57.374 E.01066
G1 X174.457 Y57.291 E.0072
G1 X174.226 Y57.221 E.00738
G1 X173.77 Y57.131 E.01419
G1 X173.277 Y57.1 E.01507
G1 X82.723 Y57.1 E2.76383
G1 X82.459 Y57.108 E.00807
G1 X81.991 Y57.171 E.01438
G1 X81.543 Y57.291 E.01418
G1 X81.108 Y57.471 E.01437
G1 X80.705 Y57.704 E.01419
G1 X80.504 Y57.848 E.00756
G1 X80.155 Y58.154 E.01418
G1 X79.844 Y58.508 E.01437
G1 X79.579 Y58.906 E.01457
G1 X79.377 Y59.317 E.01399
G1 X79.291 Y59.543 E.00738
G1 X79.221 Y59.774 E.00738
G1 X79.132 Y60.224 E.014
G1 X79.1 Y60.723 E.01525
G1 X79.1 Y151.277 E2.76383
G1 X79.132 Y151.776 E.01525
G1 X79.171 Y152.008 E.0072
G1 X79.289 Y152.451 E.01399
G1 X79.471 Y152.892 E.01456
G1 X79.71 Y153.305 E.01456
G1 X79.99 Y153.669 E.014
G1 X80.15 Y153.841 E.00719
G1 X80.508 Y154.156 E.01455
G1 X80.905 Y154.421 E.01456
G1 X81.317 Y154.623 E.014
G1 X81.537 Y154.707 E.00718
G1 X81.997 Y154.831 E.01455
G1 X82.459 Y154.892 E.0142
G1 X82.723 Y154.9 E.00807
G1 X94.987 Y154.9 E.37433
; WIPE_START
G1 X92.987 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.167 Y157.579 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.402376
G1 F10015.152
G1 X92.994 Y157.748 E.0071
G2 X92.2 Y159.719 I2.022 J1.96 E.06383
G1 X92.201 Y191.765 E.93865
G2 X95.02 Y194.5 I2.802 J-.067 E.12746
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.681 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.82 Y157.567 I-2.828 J.073 E.069
; LINE_WIDTH: 0.432208
G1 F9247.666
G2 X162.561 Y157.339 I-3.58 J3.819 E.01093
; LINE_WIDTH: 0.47785
G1 F8277.206
G1 X162.258 Y157.106 E.01356
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8277.206
G1 X162.561 Y157.339 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/60
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z6.2 I-1.216 J-.051 P1  F30000
G1 X161.007 Y194.116 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.1911
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.415 J.045 E.12286
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.068 J2.438 E.12256
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12208
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.009 J.033 E.10251
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.051 J2.027 E.10227
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.627 J.044 E.08185
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.034 J1.616 E.08198
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08054
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.229 J.026 E.05773
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.018 J1.221 E.05784
G1 X162.21 Y191.707 E.9837
G3 X161.066 Y192.908 I-1.215 J-.012 E.05608
; WIPE_START
M204 S10000
G1 X159.066 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z6.4 F30000
G1 X95.016 Y194.884 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.546 I3.288 J.027 E.07891
G1 X95.258 Y154.916 E.12268
G1 X160.742 Y154.916 E2.17223
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.629 I-2.386 J2.172 E.07609
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23501
G1 X94.054 Y194.739 E-.15814
G1 X93.858 Y194.671 E-.07912
G1 X93.48 Y194.496 E-.15825
G1 X93.3 Y194.391 E-.0791
G1 X93.193 Y194.313 E-.05038
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z6.4 F30000
G1 X82.643 Y154.506 Z6.4
G1 Z6
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.482 E.01202
G3 X79.491 Y151.317 I.421 J-3.184 E.1527
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.212 J.02 E.16605
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.153 Y154.048 E.0168
G3 X79.898 Y151.31 I.549 J-2.75 E.12739
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.805 J.013 E.14529
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
M73 P56 R19
G3 X173.31 Y154.102 I-2.805 J-.013 E.14529
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.478 J-2.371 E.10157
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.413 J.006 E.11607
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20071
G1 X81.778 Y153.527 E-.17947
G1 X81.361 Y153.304 E-.17956
G1 X80.996 Y153.004 E-.17951
G1 X80.961 Y152.962 E-.02075
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z6.4 F30000
G1 X95.011 Y195.291 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06406
G3 X92.359 Y157.268 I3.706 J.035 E.08887
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.433 Y56.714 E3.00924
G3 X177.291 Y60.716 I-.135 J3.991 E.20396
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.615 I-2.687 J2.451 E.08578
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
M73 P56 R18
G3 X92.061 Y156.99 I4.123 J.044 E.09884
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.447 Y56.307 E3.00991
G3 X177.698 Y60.71 I-.149 J4.398 E.2245
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06029
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.998 Y191.694 E1.06455
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10046
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.459 Y55.915 E2.78868
G3 X178.09 Y60.703 I-.162 J4.789 E.22629
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.291 J6.848 E.03422
G3 X165.388 Y159.589 I-3.579 J2.887 E.09011
G1 X165.39 Y191.698 E.98662
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19918
G1 X94.254 Y196.026 E-.10921
G1 X93.696 Y195.891 E-.21817
G1 X93.425 Y195.797 E-.10911
G1 X93.16 Y195.685 E-.10907
G1 X93.125 Y195.666 E-.01526
; WIPE_END
G1 E-.04 F1800
G1 X93.143 Y188.034 Z6.4 F30000
G1 X93.213 Y157.537 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.40242
G1 F10013.928
G2 X92.2 Y159.719 I1.826 J2.174 E.0728
G1 X92.201 Y191.765 E.93876
G2 X95.02 Y194.5 I2.802 J-.067 E.12748
G1 X161.065 Y194.499 E1.93478
G2 X163.8 Y191.681 I-.068 J-2.802 E.12747
G1 X163.799 Y159.635 E.93876
G2 X162.635 Y157.402 I-2.911 J.098 E.07627
; LINE_WIDTH: 0.454042
G1 F8756.532
G1 X162.542 Y157.326 E.00403
; LINE_WIDTH: 0.484078
G1 F8160.349
G1 X162.439 Y157.243 E.00475
G1 X162.121 Y157.326 E.01183
; WIPE_START
G1 X162.439 Y157.243 E-.54232
G1 X162.542 Y157.326 E-.21768
; WIPE_END
G1 E-.04 F1800
G1 X154.914 Y157.052 Z6.4 F30000
G1 X94.988 Y154.9 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.417474
G1 F9611.448
G1 X82.723 Y154.9 E.37433
G1 X82.459 Y154.892 E.00807
G1 X81.997 Y154.831 E.0142
G1 X81.762 Y154.776 E.00737
G1 X81.328 Y154.628 E.01399
G1 X80.9 Y154.418 E.01456
G1 X80.504 Y154.152 E.01456
G1 X80.159 Y153.85 E.014
G1 X79.998 Y153.678 E.00719
G1 X79.707 Y153.3 E.01457
G1 X79.469 Y152.887 E.01455
G1 X79.372 Y152.672 E.00719
G1 X79.224 Y152.238 E.014
G1 X79.131 Y151.77 E.01456
G1 X79.1 Y151.277 E.01507
G1 X79.101 Y60.673 E2.76534
G1 X79.13 Y60.236 E.01337
G1 X79.169 Y59.997 E.00739
G1 X79.224 Y59.763 E.00736
G1 X79.372 Y59.328 E.01401
G1 X79.585 Y58.895 E.01474
G1 X79.84 Y58.513 E.01401
G1 X79.993 Y58.327 E.00736
G1 X80.159 Y58.15 E.00738
G1 X80.504 Y57.848 E.014
G1 X80.906 Y57.579 E.01475
G1 X81.317 Y57.377 E.01399
G1 X81.543 Y57.291 E.00738
G1 X81.774 Y57.221 E.00738
G1 X82.23 Y57.131 E.01418
G1 X82.723 Y57.1 E.01508
G1 X173.277 Y57.1 E2.76383
G1 X173.541 Y57.108 E.00807
G1 X174.008 Y57.171 E.01438
G1 X174.457 Y57.291 E.01419
G1 X174.892 Y57.471 E.01437
G1 X175.295 Y57.704 E.01419
G1 X175.496 Y57.848 E.00756
G1 X175.846 Y58.154 E.01419
G1 X176.156 Y58.508 E.01437
G1 X176.421 Y58.906 E.01457
G1 X176.623 Y59.317 E.01399
G1 X176.709 Y59.543 E.00738
G1 X176.779 Y59.774 E.00738
G1 X176.868 Y60.224 E.01401
G1 X176.9 Y60.723 E.01525
G1 X176.9 Y151.277 E2.76383
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.238 E.01456
G1 X176.628 Y152.672 E.014
G1 X176.529 Y152.892 E.00737
G1 X176.29 Y153.305 E.01456
G1 X176.152 Y153.496 E.00719
G1 X175.85 Y153.841 E.01401
G1 X175.491 Y154.156 E.01456
G1 X175.095 Y154.421 E.01456
G1 X174.683 Y154.623 E.014
G1 X174.463 Y154.707 E.00719
G1 X174.003 Y154.831 E.01455
G1 X173.541 Y154.892 E.0142
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37433
G1 X160.284 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.597 Y155.264 E.01038
G1 X161.522 Y156.2 E.04363
G1 X161.195 Y156.755 E.02136
G1 X160.91 Y156.936 E.01121
G1 X160.102 Y156.936 E.02677
G3 X158.065 Y155.264 I.747 J-2.99 E.09033
G1 X155.188 Y155.264 E.09541
G2 X154.207 Y156.755 I6.654 J5.451 E.0593
G1 X153.921 Y156.936 E.01121
G1 X153.114 Y156.936 E.02677
G3 X151.076 Y155.264 I.748 J-2.99 E.09033
G1 X148.2 Y155.264 E.09541
G2 X147.218 Y156.755 I6.654 J5.451 E.0593
G1 X146.933 Y156.936 E.01121
G1 X146.126 Y156.936 E.02677
G3 X144.088 Y155.264 I.747 J-2.99 E.09033
G1 X141.212 Y155.264 E.09541
G2 X140.23 Y156.755 I6.654 J5.451 E.0593
G1 X139.944 Y156.936 E.01121
G1 X139.137 Y156.936 E.02677
G3 X137.099 Y155.264 I.748 J-2.99 E.09033
G1 X134.223 Y155.264 E.09541
G2 X133.242 Y156.755 I6.654 J5.451 E.0593
G1 X132.956 Y156.936 E.01121
G1 X132.149 Y156.936 E.02677
G3 X130.111 Y155.264 I.747 J-2.99 E.09033
G1 X127.235 Y155.264 E.09541
G2 X126.253 Y156.755 I6.655 J5.452 E.0593
G1 X125.967 Y156.936 E.01121
G1 X125.16 Y156.936 E.02677
G3 X123.123 Y155.264 I.748 J-2.99 E.09033
G1 X120.246 Y155.264 E.09541
G2 X119.265 Y156.755 I6.654 J5.451 E.0593
M73 P57 R18
G1 X118.979 Y156.936 E.01121
G1 X118.172 Y156.936 E.02677
G3 X116.134 Y155.264 I.747 J-2.99 E.09033
G1 X113.258 Y155.264 E.09541
G2 X112.276 Y156.755 I6.655 J5.452 E.0593
G1 X111.991 Y156.936 E.01121
G1 X111.184 Y156.936 E.02677
G3 X109.146 Y155.264 I.748 J-2.99 E.09033
G1 X106.27 Y155.264 E.09541
G2 X105.288 Y156.755 I6.654 J5.451 E.0593
G1 X105.002 Y156.936 E.01121
G1 X104.195 Y156.936 E.02677
G3 X102.157 Y155.264 I.748 J-2.99 E.09033
G1 X99.281 Y155.264 E.09541
G2 X98.3 Y156.755 I6.654 J5.451 E.0593
G1 X98.014 Y156.936 E.01121
G3 X95.258 Y155.412 I-.306 J-2.702 E.11142
G1 X94.113 Y156.569 E.05401
G1 X93.88 Y157.323 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.40729
G1 F9880.087
G1 X93.611 Y157.255 E.00824
; LINE_WIDTH: 0.442216
G1 F9015.886
G1 X93.586 Y157.249 E.00083
; LINE_WIDTH: 0.47376
G1 F8355.767
G1 X93.561 Y157.243 E.0009
G1 X93.407 Y157.367 E.00697
; LINE_WIDTH: 0.431804
G1 F9257.263
G1 X93.213 Y157.537 E.00815
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9257.263
G1 X93.407 Y157.367 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/60
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z6.4 I-.581 J1.069 P1  F30000
G1 X161.007 Y194.116 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.954 Y194.116 E2.1911
G3 X92.584 Y191.746 I.045 J-2.415 E.12286
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.43 J.061 E.12266
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.045 J2.415 E.12286
G1 X163.416 Y191.746 E1.06458
G3 X161.067 Y194.116 I-2.423 J-.053 E.12209
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.056 J-2.032 E.10221
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.021 J.045 E.10235
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.056 J2.032 E.10221
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.038 J-1.62 E.08193
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.611 J.029 E.08205
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.038 J1.62 E.08193
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08054
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.021 J-1.224 E.0578
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.216 J.013 E.05789
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.313 Y192.868 I-1.215 J-.012 E.04839
G1 X161.067 Y192.902 E.00764
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.0229
G1 X159.067 Y192.91 E-.73711
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z6.6 F30000
G1 X95.016 Y194.884 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.545 I3.288 J.027 E.07892
G1 X95.258 Y154.916 E.12267
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.629 I-2.415 J2.183 E.07607
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23482
G1 X94.055 Y194.739 E-.15821
G1 X93.858 Y194.671 E-.07917
G1 X93.48 Y194.496 E-.15816
G1 X93.3 Y194.391 E-.07931
G1 X93.193 Y194.313 E-.05033
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z6.6 F30000
G1 X82.643 Y154.506 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20068
G1 X81.778 Y153.527 E-.17944
G1 X81.361 Y153.304 E-.17956
G1 X80.996 Y153.004 E-.17947
G1 X80.961 Y152.962 E-.02085
; WIPE_END
G1 E-.04 F1800
G1 X83.365 Y160.206 Z6.6 F30000
G1 X95.011 Y195.291 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.36 Y157.268 I3.705 J.035 E.08888
G1 X94.315 Y155.291 E.09223
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.428 Y56.714 E3.00906
G3 X177.291 Y60.716 I-.139 J4 E.20402
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.616 I-2.722 J2.465 E.08574
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.043 E.09885
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.441 Y56.307 E3.00973
G3 X177.698 Y60.71 I-.154 J4.408 E.22455
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-3.029 J2.746 E.09542
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20821
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10045
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.454 Y55.915 E2.78851
G3 X178.09 Y60.703 I-.167 J4.801 E.22632
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.286 J6.844 E.03422
G3 X165.388 Y159.589 I-3.399 J2.819 E.09025
G1 X165.39 Y191.698 E.98661
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19909
G1 X94.254 Y196.026 E-.10916
G1 X93.696 Y195.891 E-.21819
G1 X93.424 Y195.797 E-.10926
G1 X93.128 Y195.66 E-.1243
; WIPE_END
G1 E-.04 F1800
G1 X93.049 Y188.028 Z6.6 F30000
G1 X92.741 Y158.048 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402378
G1 F10015.096
G1 X92.666 Y158.154 E.00379
G2 X92.2 Y159.719 I2.358 J1.554 E.04853
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93455
G2 X163.8 Y191.681 I-.067 J-2.802 E.12744
G1 X163.799 Y159.635 E.93866
G2 X162.84 Y157.584 I-2.826 J.072 E.06823
; LINE_WIDTH: 0.428512
G1 F9336.303
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.476344
G1 F8305.967
G2 X162.258 Y157.106 I-4.002 J4.829 E.01447
; WIPE_START
G1 X162.582 Y157.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.954 Y157.079 Z6.6 F30000
G1 X94.988 Y154.9 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.417474
G1 F9611.452
M73 P58 R18
G1 X82.723 Y154.9 E.37433
G1 X82.459 Y154.892 E.00807
G1 X81.997 Y154.831 E.0142
G1 X81.763 Y154.776 E.00736
G1 X81.328 Y154.628 E.014
G1 X80.9 Y154.418 E.01455
G1 X80.504 Y154.152 E.01456
G1 X80.322 Y154.002 E.00719
G1 X79.998 Y153.678 E.01399
G1 X79.707 Y153.3 E.01456
G1 X79.469 Y152.887 E.01456
G1 X79.372 Y152.672 E.00719
G1 X79.224 Y152.238 E.014
G1 X79.131 Y151.77 E.01455
G1 X79.1 Y151.277 E.01508
G1 X79.1 Y60.723 E2.76383
G1 X79.132 Y60.224 E.01525
G1 X79.221 Y59.774 E.014
G1 X79.291 Y59.543 E.00738
G1 X79.377 Y59.317 E.00738
G1 X79.579 Y58.905 E.014
G1 X79.844 Y58.508 E.01456
G1 X80.15 Y58.159 E.01418
G1 X80.331 Y57.99 E.00757
G1 X80.7 Y57.707 E.01419
G1 X81.108 Y57.471 E.01437
G1 X81.543 Y57.291 E.01437
G1 X81.992 Y57.171 E.01419
G1 X82.459 Y57.108 E.01437
G1 X82.723 Y57.1 E.00807
G1 X173.277 Y57.1 E2.76383
G1 X173.77 Y57.131 E.01507
G1 X174.226 Y57.221 E.01418
G1 X174.457 Y57.291 E.00739
G1 X174.683 Y57.377 E.00737
G1 X175.095 Y57.579 E.014
G1 X175.496 Y57.848 E.01474
G1 X175.841 Y58.15 E.01401
G1 X176.006 Y58.326 E.00737
G1 X176.16 Y58.513 E.00738
G1 X176.415 Y58.895 E.014
G1 X176.628 Y59.328 E.01474
G1 X176.776 Y59.763 E.014
G1 X176.831 Y59.997 E.00736
G1 X176.87 Y60.236 E.00739
G1 X176.899 Y60.673 E.01337
G1 X176.9 Y151.277 E2.76534
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.238 E.01456
G1 X176.707 Y152.463 E.0072
G1 X176.531 Y152.886 E.01399
G1 X176.293 Y153.3 E.01456
G1 X176.002 Y153.678 E.01456
G1 X175.678 Y154.002 E.014
G1 X175.496 Y154.152 E.00719
G1 X175.1 Y154.418 E.01456
G1 X174.672 Y154.628 E.01456
G1 X174.237 Y154.776 E.014
G1 X174.003 Y154.831 E.00736
G1 X173.541 Y154.892 E.0142
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37433
G1 X160.496 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.597 Y155.264 E.00334
G1 X161.671 Y156.35 E.05067
G2 X161.573 Y156.997 I1.394 J.542 E.02188
G2 X159.672 Y156.936 I-1.177 J6.931 E.06328
G3 X158.263 Y155.264 I1.322 J-2.543 E.07438
G1 X155.205 Y155.264 E.10145
G2 X154.57 Y156.936 I2.576 J1.935 E.06008
G1 X152.683 Y156.936 E.06259
G3 X151.275 Y155.264 I1.322 J-2.543 E.07438
G1 X148.216 Y155.264 E.10145
G2 X147.582 Y156.936 I2.576 J1.935 E.06008
G1 X145.695 Y156.936 E.06259
G3 X144.286 Y155.264 I1.322 J-2.543 E.07438
G1 X141.228 Y155.264 E.10145
G2 X140.593 Y156.936 I2.576 J1.935 E.06008
G1 X138.706 Y156.936 E.06259
G3 X137.298 Y155.264 I1.322 J-2.543 E.07438
G1 X134.24 Y155.264 E.10145
G2 X133.605 Y156.936 I2.576 J1.935 E.06008
G1 X131.718 Y156.936 E.06259
G3 X130.31 Y155.264 I1.322 J-2.543 E.07438
G1 X127.251 Y155.264 E.10145
G2 X126.616 Y156.936 I2.576 J1.935 E.06008
G1 X124.73 Y156.936 E.06259
G3 X123.321 Y155.264 I1.322 J-2.543 E.07438
G1 X120.263 Y155.264 E.10145
G2 X119.628 Y156.936 I2.576 J1.935 E.06008
G1 X117.741 Y156.936 E.06259
G3 X116.333 Y155.264 I1.322 J-2.543 E.07438
G1 X113.274 Y155.264 E.10145
G2 X112.64 Y156.936 I2.576 J1.935 E.06008
G1 X110.753 Y156.936 E.06259
G3 X109.344 Y155.264 I1.322 J-2.543 E.07438
G1 X106.286 Y155.264 E.10145
G2 X105.651 Y156.936 I2.576 J1.935 E.06008
G1 X103.764 Y156.936 E.06259
G3 X102.356 Y155.264 I1.322 J-2.543 E.07438
G1 X99.297 Y155.264 E.10145
G2 X98.663 Y156.936 I2.576 J1.935 E.06008
G1 X96.776 Y156.936 E.06259
G3 X95.377 Y155.291 I1.318 J-2.538 E.07344
G1 X94.232 Y156.449 E.05401
G1 X93.88 Y157.323 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.406989
G1 F9888.247
G1 X93.612 Y157.255 E.00822
; LINE_WIDTH: 0.441995
G1 F9020.867
G1 X93.587 Y157.249 E.00084
; LINE_WIDTH: 0.472568
G1 F8378.963
G1 X93.561 Y157.243 E.0009
G1 X93.398 Y157.374 E.00734
; LINE_WIDTH: 0.410394
G1 F9796.611
G2 X92.741 Y158.048 I2.382 J2.98 E.02826
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9796.611
G1 X93.017 Y157.725 E-.34258
G1 X93.398 Y157.374 E-.41742
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/60
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z6.6 I-.581 J1.07 P1  F30000
G1 X161.086 Y194.114 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.43 J.061 E.12266
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00564
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.021 J.045 E.10235
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.06369
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.611 J.029 E.08205
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.0821
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.216 J.013 E.05789
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.313 Y192.868 I-1.215 J-.012 E.04839
G1 X161.067 Y192.902 E.00763
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02291
G1 X159.067 Y192.91 E-.73709
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z6.8 F30000
G1 X95.016 Y194.884 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.286 J.026 E.07908
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17224
G1 X163.339 Y157.542 E.1225
G3 X164.182 Y159.629 I-2.381 J2.175 E.07627
G1 X164.184 Y191.685 E1.06335
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23495
G1 X94.054 Y194.739 E-.15816
G1 X93.858 Y194.671 E-.07913
G1 X93.48 Y194.496 E-.15816
G1 X93.3 Y194.391 E-.07913
G1 X93.193 Y194.313 E-.05046
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z6.8 F30000
G1 X82.643 Y154.506 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.481 E.01202
G3 X81.765 Y154.369 I.431 J-3.235 E.01753
M73 P58 R17
G3 X79.491 Y151.317 I.958 J-3.088 E.135
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.219 J-.027 E.16595
G1 X82.703 Y154.509 E3.00584
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01679
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.811 J-.019 E.14521
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.413 J-.006 E.11607
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20067
G1 X81.778 Y153.527 E-.17944
G1 X81.361 Y153.304 E-.17956
G1 X80.996 Y153.004 E-.17948
G1 X80.961 Y152.962 E-.02085
; WIPE_END
G1 E-.04 F1800
G1 X83.365 Y160.206 Z6.8 F30000
G1 X95.011 Y195.291 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.704 J.035 E.089
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.422 Y56.714 E3.00888
G3 X177.291 Y60.716 I-.141 J4.007 E.20411
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.638 Y157.265 E.09212
G3 X164.589 Y159.615 I-2.683 J2.453 E.0859
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.122 J.043 E.09891
G1 X93.34 Y155.698 E.06022
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.436 Y56.307 E3.00955
G3 X177.698 Y60.71 I-.156 J4.415 E.22463
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35261
G1 X163.937 Y156.989 E.06023
G3 X164.996 Y159.602 I-2.985 J2.731 E.09554
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
M73 P59 R17
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.051 E.10048
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.797 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.448 Y55.915 E2.78834
G3 X178.09 Y60.703 I-.17 J4.809 E.22639
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.413 Y156.94 I-5.932 J6.492 E.03619
G3 X165.388 Y159.589 I-3.629 J2.839 E.08815
G1 X165.39 Y191.698 E.98662
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1991
G1 X94.254 Y196.026 E-.10925
G1 X93.973 Y195.968 E-.10909
G1 X93.425 Y195.797 E-.21819
G1 X93.128 Y195.66 E-.12438
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z6.8 F30000
G1 X93.167 Y157.579 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429136
G1 F9321.226
G3 X93.418 Y157.357 I4.621 J4.972 E.01056
; LINE_WIDTH: 0.47645
G1 F8303.929
G3 X93.742 Y157.105 I4.008 J4.835 E.0145
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402374
G1 F10015.197
G1 X93.017 Y157.725 E.00613
G2 X92.2 Y159.719 I1.996 J1.982 E.06478
G1 X92.201 Y191.765 E.93865
G2 X95.02 Y194.5 I2.802 J-.068 E.12746
G1 X161.065 Y194.499 E1.93453
G2 X163.8 Y191.681 I-.068 J-2.802 E.12744
G1 X163.799 Y159.635 E.93865
G2 X162.84 Y157.584 I-2.842 J.079 E.06821
; LINE_WIDTH: 0.428521
G1 F9336.085
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.476343
G1 F8305.984
G2 X162.258 Y157.106 I-4.001 J4.826 E.01447
; WIPE_START
G1 X162.582 Y157.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.955 Y157.08 Z6.8 F30000
G1 X94.987 Y154.9 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.417473
G1 F9611.455
G1 X82.723 Y154.9 E.37433
G1 X82.459 Y154.892 E.00807
G1 X81.998 Y154.831 E.01419
G1 X81.763 Y154.776 E.00737
G1 X81.328 Y154.628 E.01401
G1 X80.9 Y154.418 E.01455
G1 X80.504 Y154.152 E.01457
G1 X80.322 Y154.002 E.00719
G1 X79.997 Y153.678 E.014
G1 X79.707 Y153.3 E.01455
G1 X79.469 Y152.887 E.01456
G1 X79.372 Y152.672 E.00719
G1 X79.224 Y152.238 E.014
G1 X79.131 Y151.77 E.01455
G1 X79.1 Y151.277 E.01508
G1 X79.101 Y60.673 E2.76534
G1 X79.13 Y60.236 E.01337
G1 X79.169 Y59.997 E.0074
G1 X79.224 Y59.762 E.00737
G1 X79.372 Y59.328 E.01399
G1 X79.586 Y58.895 E.01475
G1 X79.841 Y58.513 E.01401
G1 X79.993 Y58.326 E.00736
G1 X80.159 Y58.15 E.00738
G1 X80.503 Y57.848 E.01399
G1 X80.905 Y57.579 E.01476
G1 X81.317 Y57.377 E.014
G1 X81.543 Y57.291 E.00737
G1 X81.774 Y57.221 E.00738
G1 X82.23 Y57.131 E.01418
G1 X82.723 Y57.1 E.01507
G1 X173.277 Y57.1 E2.76383
G1 X173.541 Y57.108 E.00807
G1 X174.008 Y57.171 E.01438
G1 X174.457 Y57.291 E.01418
G1 X174.892 Y57.471 E.01437
G1 X175.3 Y57.707 E.01437
G1 X175.669 Y57.99 E.0142
G1 X175.85 Y58.159 E.00756
G1 X176.156 Y58.509 E.01419
G1 X176.421 Y58.906 E.01456
G1 X176.623 Y59.317 E.014
G1 X176.709 Y59.543 E.00737
G1 X176.779 Y59.774 E.00739
G1 X176.868 Y60.224 E.014
G1 X176.9 Y60.723 E.01525
G1 X176.9 Y151.277 E2.76383
G1 X176.868 Y151.776 E.01525
G1 X176.779 Y152.226 E.01401
G1 X176.711 Y152.451 E.00719
G1 X176.529 Y152.892 E.01456
G1 X176.29 Y153.305 E.01456
G1 X176.011 Y153.669 E.01399
G1 X175.849 Y153.841 E.00721
G1 X175.491 Y154.156 E.01455
G1 X175.095 Y154.421 E.01456
G1 X174.683 Y154.623 E.014
G1 X174.463 Y154.707 E.00719
G1 X174.002 Y154.831 E.01456
G1 X173.541 Y154.892 E.01419
G1 X173.277 Y154.9 E.00807
G1 X161.013 Y154.9 E.37433
G1 X160.673 Y155.341 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.818 Y156.499 E.05401
G2 X161.913 Y156.984 I.614 J.131 E.01683
G1 X161.843 Y157.074 E.00377
G1 X161.723 Y157.027 E.00426
G2 X159.461 Y156.936 I-1.464 J8.144 E.07533
G3 X158.974 Y156.495 I1.691 J-2.363 E.02184
G1 X158.493 Y155.7 E.03081
G1 X158.408 Y155.264 E.01474
G1 X155.213 Y155.264 E.10599
G2 X154.829 Y156.495 I2.262 J1.38 E.0432
G2 X154.897 Y156.936 I.549 J.14 E.01519
G1 X152.473 Y156.936 E.08042
G3 X151.986 Y156.495 I1.691 J-2.363 E.02184
G1 X151.505 Y155.7 E.03081
G1 X151.42 Y155.264 E.01474
G1 X148.224 Y155.264 E.10599
G2 X147.841 Y156.495 I2.262 J1.381 E.0432
G2 X147.909 Y156.936 I.549 J.14 E.01519
G1 X145.485 Y156.936 E.08042
G3 X144.997 Y156.495 I1.691 J-2.363 E.02184
G1 X144.516 Y155.7 E.03081
G1 X144.431 Y155.264 E.01474
G1 X141.236 Y155.264 E.10599
G2 X140.852 Y156.495 I2.262 J1.38 E.0432
G2 X140.92 Y156.936 I.549 J.14 E.01519
G1 X138.496 Y156.936 E.08042
G3 X138.009 Y156.495 I1.691 J-2.363 E.02184
G1 X137.528 Y155.7 E.03081
G1 X137.443 Y155.264 E.01474
G1 X134.248 Y155.264 E.10599
G2 X133.864 Y156.495 I2.262 J1.38 E.0432
G2 X133.932 Y156.936 I.549 J.14 E.01519
G1 X131.508 Y156.936 E.08042
G3 X131.02 Y156.495 I1.691 J-2.363 E.02184
G1 X130.539 Y155.7 E.03081
G1 X130.454 Y155.264 E.01474
G1 X127.259 Y155.264 E.10599
G2 X126.875 Y156.495 I2.262 J1.381 E.0432
G2 X126.944 Y156.936 I.549 J.14 E.01519
G1 X124.519 Y156.936 E.08042
G3 X124.032 Y156.495 I1.691 J-2.363 E.02184
G1 X123.551 Y155.7 E.03081
G1 X123.466 Y155.264 E.01474
G1 X120.271 Y155.264 E.10599
G2 X119.887 Y156.495 I2.262 J1.38 E.0432
G2 X119.955 Y156.936 I.549 J.14 E.01519
G1 X117.531 Y156.936 E.08042
G3 X117.043 Y156.495 I1.691 J-2.363 E.02184
G1 X116.563 Y155.7 E.03081
G1 X116.478 Y155.264 E.01474
G1 X113.282 Y155.264 E.10599
G2 X112.899 Y156.495 I2.262 J1.381 E.0432
G2 X112.967 Y156.936 I.549 J.14 E.01519
G1 X110.543 Y156.936 E.08042
G3 X110.055 Y156.495 I1.691 J-2.363 E.02184
G1 X109.574 Y155.7 E.03081
G1 X109.489 Y155.264 E.01474
G1 X106.294 Y155.264 E.10599
G2 X105.91 Y156.495 I2.262 J1.38 E.0432
G2 X105.978 Y156.936 I.549 J.14 E.01519
G1 X103.554 Y156.936 E.08042
G3 X103.067 Y156.495 I1.691 J-2.363 E.02184
G1 X102.586 Y155.7 E.03081
G1 X102.501 Y155.264 E.01474
G1 X99.306 Y155.264 E.10599
G2 X98.922 Y156.495 I2.262 J1.381 E.0432
G2 X98.99 Y156.936 I.549 J.14 E.01519
G1 X96.566 Y156.936 E.08042
G3 X96.078 Y156.495 I1.691 J-2.363 E.02184
G1 X95.597 Y155.7 E.03081
G1 X95.512 Y155.264 E.01474
G1 X95.403 Y155.264 E.00362
G1 X94.335 Y156.345 E.05039
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X95.403 Y155.264 E-.57728
G1 X95.512 Y155.264 E-.04148
G1 X95.584 Y155.629 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/60
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z6.8 I-.616 J1.049 P1  F30000
G1 X161.086 Y194.114 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X161.046 Y194.116 E.00132
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.415 E.12286
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.43 J.061 E.12266
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.316 Y194.096 I-2.415 J-.045 E.1139
G1 X161.146 Y194.109 E.00565
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.056 J-2.032 E.1022
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.021 J.045 E.10235
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.0637
G3 X161.262 Y193.69 I-2.032 J-.056 E.09458
G1 X161.119 Y193.702 E.00476
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.038 J-1.62 E.08193
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.611 J.029 E.08205
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.3 I-1.62 J-.038 E.08037
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.021 J-1.224 E.0578
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.216 J.013 E.05789
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.312 Y192.866 I-1.224 J-.021 E.04829
G1 X161.067 Y192.901 E.00763
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02291
G1 X159.067 Y192.91 E-.73709
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z7 F30000
G1 X95.016 Y194.884 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.545 I3.288 J.027 E.07891
G1 X95.258 Y154.916 E.12267
G1 X160.742 Y154.916 E2.17223
G1 X163.339 Y157.542 E.1225
G3 X164.182 Y159.624 I-2.382 J2.176 E.0761
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23496
G1 X94.054 Y194.739 E-.15815
G1 X93.858 Y194.671 E-.07917
G1 X93.479 Y194.496 E-.15834
G1 X93.3 Y194.391 E-.07885
G1 X93.19 Y194.316 E-.05054
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z7 F30000
G1 X82.643 Y154.506 Z7
G1 Z6.6
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.02 J3.212 E.16605
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.212 J-.02 E.16605
G1 X82.703 Y154.509 E3.00584
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.013 J2.805 E.14529
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.805 J-.013 E.14529
G1 X82.717 Y154.102 E3.00514
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.006 J2.413 E.11607
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.413 J-.006 E.11607
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20068
G1 X81.778 Y153.527 E-.17944
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.004 E-.17954
G1 X80.961 Y152.962 E-.02082
; WIPE_END
G1 E-.04 F1800
M73 P60 R17
G1 X83.365 Y160.206 Z7 F30000
G1 X95.011 Y195.291 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.705 J.035 E.08888
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.417 Y56.714 E3.0087
G3 X177.291 Y60.716 I-.119 J3.991 E.20451
G1 X177.291 Y151.283 E3.00427
G3 X177.037 Y152.692 I-4.522 J-.087 E.04768
G3 X173.284 Y155.291 I-3.764 J-1.427 E.16103
G1 X161.685 Y155.291 E.38474
G1 X163.638 Y157.265 E.09212
G3 X164.589 Y159.612 I-2.684 J2.454 E.08579
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.043 E.09885
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.43 Y56.307 E3.00937
G3 X177.698 Y60.71 I-.132 J4.398 E.22505
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35261
G1 X163.937 Y156.989 E.06022
G3 X164.996 Y159.6 I-2.986 J2.731 E.09547
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10046
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.443 Y55.915 E2.78818
G3 X178.09 Y60.703 I-.145 J4.79 E.2268
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.413 Y156.94 I-5.927 J6.488 E.03619
G3 X165.388 Y159.588 I-3.63 J2.839 E.08813
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1992
G1 X94.254 Y196.026 E-.10914
G1 X93.696 Y195.891 E-.21814
G1 X93.425 Y195.797 E-.10913
G1 X93.16 Y195.685 E-.10918
G1 X93.125 Y195.666 E-.0152
; WIPE_END
G1 E-.04 F1800
G1 X93.047 Y188.034 Z7 F30000
G1 X92.741 Y158.048 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402377
G1 F10015.127
G1 X92.666 Y158.154 E.0038
G2 X92.2 Y159.719 I2.359 J1.554 E.04853
G1 X92.201 Y191.765 E.93865
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.681 I-.074 J-2.808 E.12736
G1 X163.799 Y159.635 E.93867
G2 X162.84 Y157.584 I-2.849 J.083 E.0682
; LINE_WIDTH: 0.428545
G1 F9335.511
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.476358
G1 F8305.693
G2 X162.258 Y157.106 I-3.999 J4.824 E.01446
G1 X160.966 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X159.338 Y156.936 E.05401
G1 X158.903 Y156.495 E.02052
G1 X158.54 Y155.7 E.02899
G1 X158.473 Y155.264 E.01463
G1 X155.2 Y155.264 E.10858
G2 X155.138 Y156.936 I1.865 J.906 E.0571
G1 X152.349 Y156.936 E.09251
G1 X151.915 Y156.495 E.02052
G1 X151.552 Y155.7 E.02899
G1 X151.485 Y155.264 E.01463
G1 X148.212 Y155.264 E.10858
G2 X148.15 Y156.936 I1.865 J.906 E.0571
G1 X145.361 Y156.936 E.09251
G1 X144.926 Y156.495 E.02052
G1 X144.563 Y155.7 E.02899
G1 X144.497 Y155.264 E.01463
G1 X141.223 Y155.264 E.10858
G2 X141.161 Y156.936 I1.865 J.906 E.0571
G1 X138.372 Y156.936 E.09251
G1 X137.938 Y156.495 E.02052
G1 X137.575 Y155.7 E.02899
G1 X137.508 Y155.264 E.01463
G1 X134.235 Y155.264 E.10858
G2 X134.173 Y156.936 I1.865 J.906 E.0571
G1 X131.384 Y156.936 E.09251
G1 X130.949 Y156.495 E.02052
G1 X130.586 Y155.7 E.02899
G1 X130.52 Y155.264 E.01463
G1 X127.247 Y155.264 E.10858
G2 X127.185 Y156.936 I1.865 J.906 E.0571
G1 X124.396 Y156.936 E.09251
G1 X123.961 Y156.495 E.02052
G1 X123.598 Y155.7 E.02899
M73 P60 R16
G1 X123.531 Y155.264 E.01463
G1 X120.258 Y155.264 E.10858
G2 X120.196 Y156.936 I1.865 J.906 E.0571
G1 X117.407 Y156.936 E.09251
G1 X116.973 Y156.495 E.02052
G1 X116.61 Y155.7 E.02899
G1 X116.543 Y155.264 E.01463
G1 X113.27 Y155.264 E.10858
G2 X113.208 Y156.936 I1.865 J.906 E.0571
G1 X110.419 Y156.936 E.09251
G1 X109.984 Y156.495 E.02052
G1 X109.621 Y155.7 E.02899
G1 X109.555 Y155.264 E.01463
G1 X106.281 Y155.264 E.10858
G2 X106.219 Y156.936 I1.865 J.906 E.0571
G1 X103.43 Y156.936 E.09251
G1 X102.996 Y156.495 E.02052
G1 X102.633 Y155.7 E.02899
G1 X102.566 Y155.264 E.01463
G1 X99.293 Y155.264 E.10858
G2 X99.231 Y156.936 I1.865 J.906 E.0571
G1 X96.442 Y156.936 E.09251
G1 X96.007 Y156.495 E.02052
G1 X95.644 Y155.7 E.02899
G1 X95.578 Y155.264 E.01463
G1 X95.403 Y155.264 E.00579
G1 X94.381 Y156.298 E.04823
G1 X93.878 Y157.324 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.404192
G1 F9964.788
G1 X93.613 Y157.256 E.00808
; LINE_WIDTH: 0.439808
G1 F9070.567
G1 X93.587 Y157.25 E.00086
; LINE_WIDTH: 0.472431
G1 F8381.629
G1 X93.561 Y157.244 E.00093
G1 X93.398 Y157.374 E.0073
; LINE_WIDTH: 0.410386
G1 F9796.824
G2 X92.741 Y158.048 I2.383 J2.981 E.02827
; WIPE_START
G1 X93.017 Y157.725 E-.34251
G1 X93.398 Y157.374 E-.41749
; WIPE_END
G1 E-.04 F1800
G1 X94.988 Y154.9 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.417473
G1 F9611.467
G1 X82.723 Y154.9 E.37433
G1 X82.459 Y154.892 E.00807
G1 X81.998 Y154.831 E.0142
G1 X81.763 Y154.776 E.00737
G1 X81.328 Y154.628 E.014
G1 X80.9 Y154.418 E.01456
G1 X80.504 Y154.152 E.01456
G1 X80.322 Y154.002 E.00719
G1 X79.998 Y153.678 E.014
G1 X79.707 Y153.3 E.01456
G1 X79.469 Y152.886 E.01457
G1 X79.372 Y152.672 E.00718
G1 X79.224 Y152.237 E.01401
G1 X79.131 Y151.77 E.01456
G1 X79.1 Y151.277 E.01507
G1 X79.101 Y60.673 E2.76534
G1 X79.13 Y60.236 E.01337
G1 X79.169 Y59.998 E.00739
G1 X79.224 Y59.763 E.00736
G1 X79.372 Y59.328 E.01401
G1 X79.586 Y58.895 E.01474
G1 X79.84 Y58.513 E.014
G1 X79.993 Y58.326 E.00737
G1 X80.159 Y58.15 E.00738
G1 X80.504 Y57.848 E.014
G1 X80.906 Y57.579 E.01475
G1 X81.317 Y57.376 E.014
G1 X81.543 Y57.291 E.00737
G1 X81.774 Y57.221 E.00738
G1 X82.23 Y57.131 E.01418
G1 X82.723 Y57.1 E.01508
G1 X173.277 Y57.1 E2.76382
G1 X173.541 Y57.108 E.00808
G1 X174.009 Y57.171 E.01438
G1 X174.457 Y57.291 E.01417
G1 X174.892 Y57.471 E.01438
G1 X175.295 Y57.704 E.0142
G1 X175.496 Y57.848 E.00755
G1 X175.846 Y58.155 E.01419
G1 X176.156 Y58.508 E.01437
G1 X176.297 Y58.705 E.00738
G1 X176.526 Y59.103 E.01401
G1 X176.709 Y59.543 E.01454
G1 X176.779 Y59.774 E.00738
G1 X176.868 Y60.224 E.01401
G1 X176.9 Y60.723 E.01525
G1 X176.9 Y151.277 E2.76382
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.237 E.01456
G1 X176.628 Y152.672 E.01401
G1 X176.529 Y152.892 E.00738
G1 X176.29 Y153.305 E.01455
G1 X176.01 Y153.669 E.014
G1 X175.85 Y153.841 E.00719
G1 X175.491 Y154.156 E.01456
G1 X175.095 Y154.42 E.01455
G1 X174.683 Y154.623 E.014
G1 X174.463 Y154.707 E.0072
G1 X174.002 Y154.831 E.01455
G1 X173.541 Y154.892 E.01419
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.467
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/60
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z7 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00132
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.437 J.067 E.12258
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.1138
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.026 J.05 E.10228
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.06369
G3 X161.262 Y193.692 I-2.015 J-.039 E.0948
G1 X161.119 Y193.703 E.00476
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.615 J.033 E.08199
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.0821
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08054
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.22 J.017 E.05785
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.313 Y192.868 I-1.215 J-.012 E.04839
G1 X161.067 Y192.902 E.00764
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02293
G1 X159.067 Y192.91 E-.73707
; WIPE_END
M73 P61 R16
G1 E-.04 F1800
G1 X151.438 Y193.145 Z7.2 F30000
G1 X95.016 Y194.884 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.004 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.546 I3.288 J.027 E.0789
G1 X95.258 Y154.916 E.12267
G1 X160.742 Y154.916 E2.17224
G1 X163.339 Y157.542 E.12251
G3 X164.182 Y159.624 I-2.382 J2.176 E.07609
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.2348
G1 X94.054 Y194.739 E-.15832
G1 X93.858 Y194.671 E-.07907
G1 X93.48 Y194.496 E-.15815
G1 X93.3 Y194.391 E-.0792
G1 X93.19 Y194.316 E-.05045
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z7.2 F30000
G1 X82.643 Y154.506 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.219 J.027 E.16596
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.02 J3.212 E.16605
G1 X176.509 Y151.317 E3.00649
G3 X175.329 Y153.785 I-3.264 J-.045 E.09365
G3 X173.317 Y154.509 I-2.034 J-2.494 E.0723
G1 X82.703 Y154.509 E3.00584
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.811 J.019 E.14521
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.013 J2.805 E.14529
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.805 J-.013 E.14529
G1 X82.717 Y154.102 E3.00514
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.418 J.011 E.116
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.006 J2.413 E.11606
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.413 J-.006 E.11607
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20067
G1 X81.778 Y153.527 E-.17946
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.004 E-.17951
G1 X80.961 Y152.962 E-.02082
; WIPE_END
G1 E-.04 F1800
G1 X83.365 Y160.206 Z7.2 F30000
G1 X95.011 Y195.291 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.706 J.035 E.08887
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.411 Y56.713 E3.00852
G3 X177.291 Y60.717 I-.13 J4.007 E.20447
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.638 Y157.265 E.09213
G3 X164.589 Y159.612 I-2.684 J2.454 E.08578
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.044 E.09884
G1 X93.339 Y155.698 E.0603
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.425 Y56.306 E3.00919
G3 X177.698 Y60.71 I-.145 J4.416 E.22499
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.937 Y156.989 E.06023
G3 X164.996 Y159.6 I-2.987 J2.731 E.09546
G1 X164.998 Y191.694 E1.06461
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10045
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.438 Y55.915 E2.78801
G3 X178.09 Y60.703 I-.159 J4.809 E.22673
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.413 Y156.94 I-5.924 J6.485 E.03619
G3 X165.388 Y159.589 I-3.63 J2.84 E.08813
G1 X165.39 Y191.698 E.98663
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1992
G1 X94.254 Y196.026 E-.10905
G1 X93.973 Y195.968 E-.10921
G1 X93.425 Y195.797 E-.21814
G1 X93.128 Y195.66 E-.1244
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z7.2 F30000
G1 X93.167 Y157.579 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428641
G1 F9333.187
G3 X93.412 Y157.362 I4.56 J4.909 E.01029
; LINE_WIDTH: 0.47548
G1 F8322.556
G3 X93.741 Y157.105 I4.414 J5.305 E.0147
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402375
G1 F10015.158
G1 X93.003 Y157.739 E.00673
G2 X92.2 Y159.719 I2.011 J1.968 E.0642
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.802 J-.068 E.12746
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.681 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.84 Y157.584 I-2.849 J.082 E.0682
; LINE_WIDTH: 0.428503
G1 F9336.515
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.476343
G1 F8305.979
G2 X162.258 Y157.106 I-4.014 J4.844 E.01447
G1 X160.766 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X159.137 Y156.936 E.05401
G3 X158.557 Y155.264 I1.622 J-1.499 E.06037
G1 X155.169 Y155.264 E.11239
G2 X155.334 Y156.936 I1.917 J.655 E.05743
G1 X152.149 Y156.936 E.10565
G3 X151.569 Y155.264 I1.622 J-1.499 E.06037
G1 X148.181 Y155.264 E.11239
G2 X148.345 Y156.936 I1.917 J.655 E.05743
G1 X145.16 Y156.936 E.10565
G3 X144.581 Y155.264 I1.622 J-1.499 E.06037
M73 P62 R16
G1 X141.192 Y155.264 E.11239
G2 X141.357 Y156.936 I1.917 J.655 E.05743
G1 X138.172 Y156.936 E.10565
G3 X137.592 Y155.264 I1.622 J-1.499 E.06037
G1 X134.204 Y155.264 E.11239
G2 X134.368 Y156.936 I1.917 J.655 E.05743
G1 X131.184 Y156.936 E.10565
G3 X130.604 Y155.264 I1.622 J-1.499 E.06037
G1 X127.216 Y155.264 E.11239
G2 X127.38 Y156.936 I1.917 J.655 E.05743
G1 X124.195 Y156.936 E.10565
G3 X123.615 Y155.264 I1.622 J-1.499 E.06037
G1 X120.227 Y155.264 E.11239
G2 X120.392 Y156.936 I1.917 J.655 E.05743
G1 X117.207 Y156.936 E.10565
G3 X116.627 Y155.264 I1.622 J-1.499 E.06037
G1 X113.239 Y155.264 E.11239
G2 X113.403 Y156.936 I1.917 J.655 E.05743
G1 X110.218 Y156.936 E.10565
G3 X109.639 Y155.264 I1.622 J-1.499 E.06037
G1 X106.25 Y155.264 E.11239
G2 X106.415 Y156.936 I1.917 J.655 E.05743
G1 X103.23 Y156.936 E.10565
G3 X102.65 Y155.264 I1.622 J-1.499 E.06037
G1 X99.262 Y155.264 E.11239
G2 X99.426 Y156.936 I1.917 J.655 E.05743
G1 X96.242 Y156.936 E.10565
G3 X95.662 Y155.264 I1.622 J-1.499 E.06037
G1 X95.403 Y155.264 E.00858
G1 X94.44 Y156.238 E.04543
; WIPE_START
G1 X95.403 Y155.264 E-.52044
G1 X95.662 Y155.264 E-.09833
G1 X95.67 Y155.636 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X94.987 Y154.9 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417474
G1 F9611.444
G1 X82.723 Y154.9 E.37432
G1 X82.459 Y154.892 E.00807
G1 X81.998 Y154.831 E.01419
G1 X81.537 Y154.707 E.01455
G1 X81.316 Y154.623 E.00721
G1 X80.905 Y154.421 E.01399
G1 X80.508 Y154.156 E.01457
G1 X80.15 Y153.841 E.01455
G1 X79.99 Y153.669 E.00718
G1 X79.71 Y153.305 E.01401
G1 X79.471 Y152.892 E.01456
G1 X79.289 Y152.451 E.01455
G1 X79.171 Y152.008 E.014
G1 X79.132 Y151.776 E.0072
G1 X79.1 Y151.277 E.01525
G1 X79.1 Y60.723 E2.76383
G1 X79.132 Y60.224 E.01525
G1 X79.221 Y59.774 E.01401
G1 X79.291 Y59.543 E.00738
G1 X79.377 Y59.317 E.00738
G1 X79.579 Y58.905 E.01399
G1 X79.844 Y58.508 E.01457
G1 X80.154 Y58.155 E.01436
G1 X80.504 Y57.848 E.01419
G1 X80.705 Y57.704 E.00756
G1 X81.108 Y57.471 E.01419
G1 X81.543 Y57.291 E.01437
G1 X81.992 Y57.171 E.01418
G1 X82.459 Y57.108 E.01438
G1 X82.723 Y57.1 E.00807
G1 X173.277 Y57.1 E2.76383
G1 X173.77 Y57.131 E.01508
G1 X174.009 Y57.171 E.00739
G1 X174.457 Y57.291 E.01417
G1 X174.683 Y57.377 E.00739
G1 X175.094 Y57.579 E.01399
G1 X175.496 Y57.848 E.01474
G1 X175.841 Y58.15 E.01401
G1 X176.007 Y58.326 E.00737
G1 X176.16 Y58.513 E.00738
G1 X176.415 Y58.895 E.014
G1 X176.628 Y59.328 E.01474
G1 X176.776 Y59.762 E.014
G1 X176.831 Y59.997 E.00737
G1 X176.87 Y60.236 E.00739
G1 X176.899 Y60.673 E.01337
G1 X176.9 Y151.277 E2.76534
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.238 E.01456
G1 X176.628 Y152.672 E.01401
G1 X176.531 Y152.887 E.00718
G1 X176.293 Y153.3 E.01457
G1 X176.003 Y153.678 E.01455
G1 X175.841 Y153.85 E.0072
G1 X175.496 Y154.152 E.01399
G1 X175.1 Y154.418 E.01455
G1 X174.672 Y154.628 E.01457
G1 X174.237 Y154.776 E.014
G1 X174.002 Y154.831 E.00737
G1 X173.541 Y154.892 E.01419
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.444
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/60
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z7.2 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.436 J.067 E.12258
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.045 J2.415 E.12286
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00563
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.026 J.05 E.10229
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.056 J2.032 E.10221
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19066
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.615 J.033 E.08199
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.038 J1.62 E.08193
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.012 J-1.215 E.0579
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.22 J.017 E.05785
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.311 Y192.868 I-1.215 J-.012 E.04844
G1 X161.067 Y192.902 E.00759
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02292
G1 X159.067 Y192.91 E-.73708
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z7.4 F30000
G1 X95.015 Y194.884 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.004 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.545 I3.288 J.027 E.07891
G1 X95.258 Y154.916 E.12267
G1 X160.742 Y154.916 E2.17223
G1 X163.341 Y157.544 E.12259
G3 X164.182 Y159.629 I-2.407 J2.183 E.07616
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.075 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23483
G1 X94.055 Y194.739 E-.1581
G1 X93.858 Y194.671 E-.07927
G1 X93.48 Y194.496 E-.15828
G1 X93.3 Y194.391 E-.07893
G1 X93.19 Y194.316 E-.05059
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z7.4 F30000
G1 X82.643 Y154.506 Z7.4
G1 Z7
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.481 E.01202
G3 X79.491 Y151.317 I.422 J-3.184 E.15269
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.212 J.02 E.16605
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00584
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.047 E.0168
G3 X79.898 Y151.31 I.556 J-2.757 E.12728
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.805 J.013 E.14529
G1 X173.31 Y57.898 E3.00604
G3 X175.472 Y58.931 I-.014 J2.807 E.08212
G3 X176.102 Y60.69 I-2.181 J1.774 E.06316
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00514
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.663 E.0144
G3 X80.29 Y151.304 I.473 J-2.366 E.10164
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.413 J.006 E.11607
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.663 E-.20074
G1 X81.778 Y153.527 E-.17949
G1 X81.361 Y153.304 E-.17957
G1 X80.996 Y153.004 E-.17951
G1 X80.961 Y152.962 E-.0207
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z7.4 F30000
G1 X95.011 Y195.291 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.706 J.035 E.08888
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.406 Y56.713 E3.00834
G3 X177.291 Y60.716 I-.108 J3.992 E.20486
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.639 Y157.267 E.09218
G3 X164.589 Y159.615 I-2.715 J2.464 E.08581
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18992
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.044 E.09884
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.419 Y56.306 E3.009
G3 X177.698 Y60.71 I-.122 J4.399 E.22541
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.989 E.06026
G3 X164.996 Y159.602 I-3.023 J2.745 E.09546
G1 X164.998 Y191.694 E1.06455
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10045
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.432 Y55.914 E2.78784
G3 X178.09 Y60.703 I-.134 J4.79 E.22713
G1 X178.09 Y151.297 E2.78368
G3 X177.789 Y152.963 I-5.429 J-.12 E.05226
M73 P63 R16
G3 X173.297 Y156.09 I-4.521 J-1.706 E.17879
G1 X163.6 Y156.09 E.29796
G3 X164.39 Y156.912 I-6.074 J6.634 E.03505
G3 X165.388 Y159.589 I-3.413 J2.797 E.08941
G1 X165.39 Y191.698 E.98662
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19909
G1 X94.254 Y196.026 E-.10917
G1 X93.696 Y195.891 E-.21814
G1 X93.425 Y195.797 E-.10923
G1 X93.128 Y195.66 E-.12438
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z7.4 F30000
G1 X93.167 Y157.579 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428686
G1 F9332.085
G3 X93.413 Y157.361 I4.585 J4.937 E.01031
; LINE_WIDTH: 0.475619
G1 F8319.874
G3 X93.741 Y157.104 I4.367 J5.249 E.01471
G1 X94.458 Y156.988 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X96.083 Y156.936 I1.051 J7.411 E.05405
M73 P63 R15
G3 X95.726 Y155.264 I1.671 J-1.231 E.05842
G1 X99.214 Y155.264 E.11569
G2 X99.596 Y156.936 I2.047 J.411 E.0586
G1 X103.072 Y156.936 E.11528
G3 X102.714 Y155.264 I1.671 J-1.231 E.05842
G1 X106.202 Y155.264 E.11569
G2 X106.585 Y156.936 I2.047 J.411 E.0586
G1 X110.06 Y156.936 E.11528
G3 X109.703 Y155.264 I1.671 J-1.231 E.05842
G1 X113.191 Y155.264 E.11569
G2 X113.573 Y156.936 I2.046 J.411 E.0586
G1 X117.049 Y156.936 E.11528
G3 X116.691 Y155.264 I1.671 J-1.231 E.05842
G1 X120.179 Y155.264 E.11569
G2 X120.562 Y156.936 I2.047 J.411 E.0586
G1 X124.037 Y156.936 E.11528
G3 X123.68 Y155.264 I1.671 J-1.231 E.05842
G1 X127.167 Y155.264 E.11569
G2 X127.55 Y156.936 I2.046 J.411 E.0586
G1 X131.025 Y156.936 E.11528
G3 X130.668 Y155.264 I1.671 J-1.231 E.05842
G1 X134.156 Y155.264 E.11569
G2 X134.538 Y156.936 I2.047 J.411 E.0586
G1 X138.014 Y156.936 E.11528
G3 X137.656 Y155.264 I1.671 J-1.231 E.05842
G1 X141.144 Y155.264 E.11569
G2 X141.527 Y156.936 I2.046 J.411 E.0586
G1 X145.002 Y156.936 E.11528
G3 X144.645 Y155.264 I1.671 J-1.231 E.05842
G1 X148.133 Y155.264 E.11569
G2 X148.515 Y156.936 I2.046 J.411 E.0586
G1 X151.991 Y156.936 E.11528
G3 X151.633 Y155.264 I1.671 J-1.231 E.05842
G1 X155.121 Y155.264 E.11569
G2 X155.504 Y156.936 I2.047 J.411 E.0586
G1 X158.979 Y156.936 E.11528
G3 X158.622 Y155.264 I1.671 J-1.231 E.05842
G1 X160.25 Y155.264 E.05401
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417474
G1 F9611.451
G1 X173.277 Y154.9 E.37433
G1 X173.541 Y154.892 E.00807
G1 X174.002 Y154.831 E.01419
G1 X174.237 Y154.776 E.00737
G1 X174.672 Y154.628 E.01401
G1 X175.1 Y154.418 E.01456
G1 X175.496 Y154.152 E.01455
G1 X175.841 Y153.85 E.01399
G1 X176.002 Y153.678 E.0072
G1 X176.293 Y153.3 E.01455
G1 X176.531 Y152.887 E.01457
G1 X176.628 Y152.672 E.00718
G1 X176.776 Y152.237 E.01401
G1 X176.869 Y151.77 E.01456
G1 X176.9 Y151.277 E.01507
G1 X176.899 Y60.673 E2.76534
G1 X176.87 Y60.236 E.01337
G1 X176.831 Y59.997 E.00739
G1 X176.776 Y59.763 E.00736
G1 X176.628 Y59.328 E.014
G1 X176.414 Y58.895 E.01475
G1 X176.16 Y58.513 E.014
G1 X176.007 Y58.327 E.00736
G1 X175.841 Y58.15 E.00738
G1 X175.496 Y57.848 E.014
G1 X175.094 Y57.579 E.01475
G1 X174.683 Y57.377 E.01399
G1 X174.457 Y57.291 E.00738
G1 X174.226 Y57.221 E.00738
G1 X173.77 Y57.131 E.01418
G1 X173.277 Y57.1 E.01508
G1 X82.723 Y57.1 E2.76382
G1 X82.459 Y57.108 E.00807
G1 X81.992 Y57.171 E.01438
G1 X81.543 Y57.291 E.01418
G1 X81.108 Y57.471 E.01437
G1 X80.7 Y57.707 E.01438
G1 X80.331 Y57.99 E.0142
G1 X80.15 Y58.159 E.00754
G1 X79.844 Y58.508 E.01419
G1 X79.703 Y58.705 E.00738
G1 X79.474 Y59.102 E.01399
G1 X79.291 Y59.543 E.01457
G1 X79.221 Y59.774 E.00738
G1 X79.132 Y60.224 E.014
G1 X79.1 Y60.723 E.01525
G1 X79.1 Y151.277 E2.76383
G1 X79.132 Y151.776 E.01525
G1 X79.221 Y152.226 E.014
G1 X79.289 Y152.451 E.0072
G1 X79.471 Y152.892 E.01455
G1 X79.71 Y153.305 E.01456
G1 X79.989 Y153.669 E.01399
G1 X80.15 Y153.841 E.0072
G1 X80.508 Y154.156 E.01455
G1 X80.905 Y154.421 E.01456
G1 X81.317 Y154.623 E.014
G1 X81.537 Y154.707 E.00719
G1 X81.997 Y154.831 E.01455
G1 X82.459 Y154.892 E.0142
G1 X82.723 Y154.9 E.00807
G1 X94.987 Y154.9 E.37433
; WIPE_START
G1 X92.987 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.167 Y157.579 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.402378
G1 F10015.093
G1 X93.003 Y157.739 E.00671
G2 X92.2 Y159.719 I2.011 J1.969 E.06422
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.802 J-.068 E.12746
G1 X161.065 Y194.499 E1.93456
G2 X163.8 Y191.68 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.84 Y157.584 I-2.827 J.072 E.06823
; LINE_WIDTH: 0.42854
G1 F9335.623
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.476348
G1 F8305.885
G2 X162.258 Y157.106 I-4.05 J4.89 E.01446
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8305.885
G1 X162.582 Y157.357 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/60
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z7.4 I-1.216 J-.049 P1  F30000
G1 X161.086 Y194.114 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.415 J.045 E.12286
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.051 J2.421 E.12279
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00563
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.033 J.057 E.10219
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.037 J2.013 E.10246
G1 X163.009 Y191.733 E1.06369
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.622 J.039 E.08191
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.023 J1.606 E.08212
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.225 J.022 E.05778
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.01 J1.213 E.05793
G1 X162.21 Y191.707 E.9837
G3 X161.309 Y192.869 I-1.215 J-.012 E.0485
G1 X161.067 Y192.902 E.00753
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02293
G1 X159.067 Y192.91 E-.73707
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z7.6 F30000
G1 X95.016 Y194.884 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.658 Y157.545 I3.288 J.027 E.07892
G1 X95.258 Y154.916 E.12266
G1 X160.742 Y154.916 E2.17224
G1 X163.341 Y157.544 E.12259
G3 X164.182 Y159.629 I-2.405 J2.182 E.07616
G1 X164.184 Y191.685 E1.06335
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23504
G1 X94.054 Y194.739 E-.15812
G1 X93.858 Y194.671 E-.07904
G1 X93.48 Y194.496 E-.15833
G1 X93.3 Y194.391 E-.07902
G1 X93.19 Y194.316 E-.05045
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z7.6 F30000
G1 X82.643 Y154.506 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.481 E.01202
G3 X79.491 Y151.317 I.428 J-3.19 E.1526
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.212 J.02 E.16605
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.02 J3.212 E.16605
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.212 J-.02 E.16605
G1 X82.703 Y154.509 E3.00584
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.047 E.0168
G3 X79.898 Y151.31 I.555 J-2.755 E.1273
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.805 J.013 E.14529
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.013 J2.805 E.14529
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.805 J-.013 E.14529
G1 X82.717 Y154.102 E3.00514
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.478 J-2.37 E.10158
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.413 J.006 E.11607
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.006 J2.413 E.11607
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.413 J-.006 E.11607
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.2007
G1 X81.778 Y153.527 E-.17949
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.004 E-.17952
G1 X80.961 Y152.962 E-.02076
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z7.6 F30000
G1 X95.011 Y195.291 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.705 J.035 E.08888
G1 X94.315 Y155.291 E.09223
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.401 Y56.713 E3.00816
G3 X177.291 Y60.716 I-.119 J4.008 E.20483
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.639 Y157.267 E.09218
G3 X164.589 Y159.616 I-2.713 J2.463 E.08581
M73 P64 R15
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.043 E.09884
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.414 Y56.306 E3.00882
G3 X177.698 Y60.71 I-.134 J4.416 E.22535
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35261
G1 X163.938 Y156.99 E.06026
G3 X164.996 Y159.602 I-3.021 J2.744 E.09547
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10045
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.427 Y55.914 E2.78767
G3 X178.09 Y60.703 I-.148 J4.809 E.22706
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.389 Y156.911 I-6.086 J6.646 E.03503
G3 X165.388 Y159.589 I-3.412 J2.798 E.08945
G1 X165.39 Y191.698 E.98661
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1992
G1 X94.254 Y196.026 E-.10919
G1 X93.973 Y195.968 E-.10904
G1 X93.425 Y195.797 E-.21817
G1 X93.16 Y195.685 E-.1092
G1 X93.125 Y195.666 E-.01521
; WIPE_END
G1 E-.04 F1800
G1 X93.144 Y188.034 Z7.6 F30000
G1 X93.222 Y157.529 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.434199
G1 F9200.604
G1 X93.424 Y157.353 E.00855
; LINE_WIDTH: 0.477191
G1 F8289.761
G3 X93.741 Y157.105 I4.733 J5.734 E.01425
G1 X94.293 Y157.036 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X95.911 Y156.936 I1.116 J4.882 E.05403
G3 X95.772 Y155.264 I1.767 J-.988 E.05735
G1 X99.147 Y155.264 E.11195
G2 X99.754 Y156.936 I2.224 J.138 E.06066
G1 X102.9 Y156.936 E.10435
G3 X102.761 Y155.264 I1.767 J-.988 E.05735
G1 X106.136 Y155.264 E.11195
G2 X106.742 Y156.936 I2.224 J.138 E.06066
G1 X109.888 Y156.936 E.10435
G3 X109.749 Y155.264 I1.767 J-.988 E.05735
G1 X113.124 Y155.264 E.11195
G2 X113.731 Y156.936 I2.224 J.138 E.06066
G1 X116.876 Y156.936 E.10435
G3 X116.738 Y155.264 I1.767 J-.988 E.05735
G1 X120.113 Y155.264 E.11195
G2 X120.719 Y156.936 I2.224 J.138 E.06066
G1 X123.865 Y156.936 E.10435
G3 X123.726 Y155.264 I1.767 J-.988 E.05735
G1 X127.101 Y155.264 E.11195
G2 X127.707 Y156.936 I2.224 J.138 E.06066
G1 X130.853 Y156.936 E.10435
G3 X130.714 Y155.264 I1.767 J-.988 E.05735
G1 X134.089 Y155.264 E.11195
G2 X134.696 Y156.936 I2.224 J.138 E.06066
G1 X137.842 Y156.936 E.10435
G3 X137.703 Y155.264 I1.767 J-.988 E.05735
G1 X141.078 Y155.264 E.11195
G2 X141.684 Y156.936 I2.224 J.138 E.06066
G1 X144.83 Y156.936 E.10435
G3 X144.691 Y155.264 I1.767 J-.988 E.05735
G1 X148.066 Y155.264 E.11195
G2 X148.673 Y156.936 I2.224 J.138 E.06066
G1 X151.818 Y156.936 E.10435
G3 X151.68 Y155.264 I1.767 J-.988 E.05735
G1 X155.055 Y155.264 E.11195
G2 X155.661 Y156.936 I2.224 J.138 E.06066
G1 X158.807 Y156.936 E.10435
G3 X158.668 Y155.264 I1.767 J-.988 E.05735
G1 X160.296 Y155.264 E.05401
G1 X161.013 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417473
G1 F9611.463
G1 X173.277 Y154.9 E.37433
G1 X173.541 Y154.892 E.00807
G1 X174.003 Y154.831 E.0142
G1 X174.463 Y154.707 E.01454
G1 X174.683 Y154.623 E.0072
G1 X175.094 Y154.421 E.01399
G1 X175.491 Y154.156 E.01455
G1 X175.85 Y153.841 E.01457
G1 X176.152 Y153.496 E.01399
G1 X176.29 Y153.305 E.00719
G1 X176.529 Y152.892 E.01457
G1 X176.628 Y152.672 E.00738
G1 X176.776 Y152.238 E.01399
G1 X176.869 Y151.77 E.01456
G1 X176.9 Y151.277 E.01507
G1 X176.899 Y60.673 E2.76534
G1 X176.87 Y60.236 E.01337
G1 X176.831 Y59.997 E.00739
G1 X176.776 Y59.763 E.00736
G1 X176.628 Y59.328 E.014
G1 X176.414 Y58.895 E.01475
G1 X176.16 Y58.513 E.014
G1 X176.007 Y58.326 E.00737
G1 X175.841 Y58.15 E.00738
G1 X175.496 Y57.848 E.014
G1 X175.095 Y57.579 E.01475
G1 X174.683 Y57.377 E.01399
G1 X174.457 Y57.291 E.00738
G1 X174.226 Y57.221 E.00738
G1 X173.77 Y57.131 E.01418
G1 X173.277 Y57.1 E.01507
G1 X82.723 Y57.1 E2.76383
G1 X82.459 Y57.108 E.00807
G1 X81.991 Y57.171 E.01438
G1 X81.543 Y57.291 E.01418
G1 X81.108 Y57.471 E.01437
G1 X80.7 Y57.707 E.01438
G1 X80.331 Y57.989 E.01418
G1 X80.15 Y58.159 E.00757
G1 X79.844 Y58.508 E.01418
G1 X79.704 Y58.705 E.00737
G1 X79.474 Y59.102 E.01401
G1 X79.291 Y59.543 E.01455
G1 X79.221 Y59.774 E.00739
G1 X79.132 Y60.224 E.014
G1 X79.1 Y60.723 E.01525
G1 X79.1 Y151.277 E2.76382
G1 X79.132 Y151.776 E.01525
G1 X79.221 Y152.226 E.014
G1 X79.289 Y152.451 E.00719
G1 X79.471 Y152.892 E.01456
G1 X79.71 Y153.305 E.01456
G1 X79.848 Y153.496 E.0072
G1 X80.15 Y153.841 E.014
G1 X80.509 Y154.156 E.01456
G1 X80.906 Y154.421 E.01456
G1 X81.317 Y154.623 E.01399
G1 X81.537 Y154.707 E.00718
G1 X81.997 Y154.831 E.01456
G1 X82.459 Y154.892 E.0142
G1 X82.723 Y154.9 E.00807
G1 X94.987 Y154.9 E.37433
; WIPE_START
G1 X92.987 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.222 Y157.529 Z7.6 F30000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.402387
G1 F10014.844
G2 X92.2 Y159.719 I1.82 J2.182 E.07313
G1 X92.201 Y191.765 E.93868
G2 X95.02 Y194.5 I2.802 J-.067 E.12747
G1 X161.065 Y194.499 E1.9346
G2 X163.8 Y191.68 I-.068 J-2.802 E.12746
G1 X163.799 Y159.635 E.93867
G2 X162.782 Y157.532 I-2.857 J.084 E.07047
; LINE_WIDTH: 0.436013
G1 F9158.144
G2 X162.556 Y157.335 I-3.353 J3.626 E.00963
; LINE_WIDTH: 0.478802
G1 F8259.12
G1 X162.258 Y157.106 E.01334
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8259.12
G1 X162.556 Y157.335 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/60
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z7.6 I-1.216 J-.049 P1  F30000
G1 X161.086 Y194.114 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00132
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.415 E.12286
G1 X92.584 Y159.659 E1.06439
G3 X94.954 Y157.284 I2.415 J.039 E.12305
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.069 J2.439 E.12255
G1 X163.416 Y191.746 E1.06458
G3 X161.316 Y194.095 I-2.423 J-.053 E.1138
G1 X161.146 Y194.109 E.00565
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.056 J-2.032 E.1022
G1 X92.991 Y159.671 E1.06356
G3 X94.967 Y157.691 I2.033 J.053 E.10232
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.052 J2.028 E.10226
G1 X163.009 Y191.733 E1.0637
G3 X161.262 Y193.692 I-2.015 J-.039 E.0948
G1 X161.119 Y193.703 E.00476
G1 X161.007 Y193.302 F30000
G1 F8843.478
G1 X94.98 Y193.302 E2.19022
G3 X93.398 Y191.72 I.038 J-1.62 E.08192
G1 X93.398 Y159.683 E1.06273
G3 X94.98 Y158.098 I1.622 J.037 E.08199
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.035 J1.617 E.08197
G1 X162.602 Y191.72 E1.06281
G3 X161.067 Y193.301 I-1.608 J-.025 E.08054
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.021 J-1.224 E.0578
G1 X93.79 Y159.694 E.98367
G3 X94.993 Y158.49 I1.225 J.021 E.05781
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.018 J1.221 E.05783
G1 X162.21 Y191.707 E.9837
G3 X161.313 Y192.868 I-1.215 J-.012 E.04839
G1 X161.067 Y192.902 E.00763
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02293
G1 X159.067 Y192.91 E-.73707
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z7.8 F30000
G1 X95.016 Y194.884 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.004 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.545 I3.288 J.027 E.07891
G1 X95.258 Y154.916 E.12267
G1 X160.742 Y154.916 E2.17223
G1 X163.341 Y157.544 E.1226
G3 X164.182 Y159.624 I-2.385 J2.174 E.076
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23487
G1 X94.054 Y194.739 E-.15823
G1 X93.858 Y194.671 E-.07916
G1 X93.48 Y194.496 E-.15822
G1 X93.3 Y194.391 E-.07904
G1 X93.19 Y194.316 E-.05048
; WIPE_END
M73 P65 R15
G1 E-.04 F1800
G1 X91.236 Y186.938 Z7.8 F30000
G1 X82.643 Y154.506 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.481 E.01202
G3 X79.491 Y151.317 I.422 J-3.184 E.15269
G1 X79.491 Y60.683 E3.00649
G3 X80.23 Y58.653 I3.218 J.022 E.07309
G3 X82.683 Y57.491 I2.471 J2.047 E.09296
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.02 J3.212 E.16605
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.212 J-.02 E.16605
G1 X82.703 Y154.509 E3.00584
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.013 J2.805 E.14529
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.805 J-.013 E.14529
G1 X82.717 Y154.102 E3.00514
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.006 J2.413 E.11606
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.413 J-.006 E.11607
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20067
G1 X81.778 Y153.527 E-.17944
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.004 E-.17955
G1 X80.961 Y152.962 E-.02082
; WIPE_END
G1 E-.04 F1800
G1 X83.365 Y160.206 Z7.8 F30000
G1 X95.011 Y195.291 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.706 J.035 E.08888
G1 X94.315 Y155.291 E.09224
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.395 Y56.713 E3.00797
G3 X177.291 Y60.716 I-.097 J3.992 E.20523
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.267 E.09219
G3 X164.589 Y159.612 I-2.686 J2.452 E.08571
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.044 E.09884
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.408 Y56.306 E3.00864
M73 P65 R14
G3 X177.698 Y60.71 I-.111 J4.399 E.22577
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06027
G3 X164.996 Y159.6 I-2.987 J2.73 E.09543
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10045
G1 X92.4 Y156.09 E.02736
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.421 Y55.914 E2.78751
G3 X178.09 Y60.703 I-.124 J4.791 E.22747
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.389 Y156.91 I-6.087 J6.647 E.03499
G3 X165.388 Y159.589 I-3.597 J2.868 E.08932
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19909
G1 X94.254 Y196.026 E-.10929
G1 X93.696 Y195.891 E-.21816
G1 X93.425 Y195.797 E-.10907
G1 X93.16 Y195.685 E-.10917
G1 X93.125 Y195.666 E-.01521
; WIPE_END
G1 E-.04 F1800
G1 X93.145 Y188.034 Z7.8 F30000
G1 X93.223 Y157.528 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402384
G1 F10014.926
G2 X92.2 Y159.719 I1.819 J2.184 E.07318
G1 X92.201 Y191.765 E.93868
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93459
G2 X163.8 Y191.68 I-.068 J-2.802 E.12746
G1 X163.799 Y159.635 E.93867
G2 X162.82 Y157.567 I-2.838 J.077 E.06899
; LINE_WIDTH: 0.432218
G1 F9247.417
G2 X162.561 Y157.34 I-3.592 J3.832 E.01092
; LINE_WIDTH: 0.477858
G1 F8277.042
G1 X162.258 Y157.106 E.01356
; WIPE_START
G1 X162.561 Y157.34 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.934 Y157.064 Z7.8 F30000
G1 X94.987 Y154.9 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.417474
G1 F9611.447
G1 X82.723 Y154.9 E.37433
G1 X82.459 Y154.892 E.00807
G1 X81.998 Y154.831 E.01419
G1 X81.537 Y154.707 E.01455
G1 X81.316 Y154.623 E.0072
G1 X80.905 Y154.42 E.014
G1 X80.508 Y154.156 E.01455
G1 X80.15 Y153.841 E.01454
G1 X79.848 Y153.496 E.014
G1 X79.71 Y153.305 E.00721
G1 X79.471 Y152.892 E.01455
G1 X79.289 Y152.451 E.01456
G1 X79.221 Y152.226 E.00719
G1 X79.132 Y151.776 E.014
G1 X79.1 Y151.277 E.01525
G1 X79.1 Y60.723 E2.76383
G1 X79.132 Y60.224 E.01525
G1 X79.221 Y59.775 E.014
G1 X79.291 Y59.543 E.00739
M73 P66 R14
G1 X79.474 Y59.102 E.01456
G1 X79.703 Y58.705 E.014
G1 X79.844 Y58.508 E.00738
G1 X80.15 Y58.159 E.01419
G1 X80.331 Y57.99 E.00755
G1 X80.7 Y57.707 E.0142
G1 X81.108 Y57.471 E.01437
G1 X81.543 Y57.291 E.01437
G1 X81.991 Y57.171 E.01418
G1 X82.459 Y57.108 E.01438
G1 X82.723 Y57.1 E.00807
G1 X173.277 Y57.1 E2.76383
G1 X173.77 Y57.131 E.01507
G1 X174.009 Y57.171 E.00739
G1 X174.457 Y57.291 E.01417
G1 X174.678 Y57.374 E.0072
G1 X175.01 Y57.534 E.01125
G1 X175.491 Y57.844 E.01748
G1 X175.678 Y57.998 E.00739
G1 X176.007 Y58.326 E.01418
G1 X176.16 Y58.514 E.00738
G1 X176.415 Y58.895 E.014
G1 X176.628 Y59.328 E.01474
G1 X176.776 Y59.763 E.01401
G1 X176.831 Y59.997 E.00736
G1 X176.87 Y60.236 E.0074
G1 X176.899 Y60.673 E.01337
G1 X176.9 Y151.277 E2.76534
G1 X176.869 Y151.77 E.01507
G1 X176.776 Y152.237 E.01456
G1 X176.628 Y152.672 E.01402
G1 X176.531 Y152.886 E.00717
G1 X176.293 Y153.3 E.01456
G1 X176.002 Y153.678 E.01456
G1 X175.841 Y153.85 E.00719
G1 X175.496 Y154.152 E.014
G1 X175.1 Y154.418 E.01456
G1 X174.887 Y154.531 E.00737
G1 X174.463 Y154.707 E.014
G1 X174.002 Y154.831 E.01456
G1 X173.541 Y154.892 E.01419
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37433
G1 X160.325 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X158.697 Y155.264 E.05401
G2 X158.607 Y156.936 I1.866 J.938 E.05711
G1 X155.862 Y156.936 E.09106
G1 X155.418 Y156.495 E.02075
G1 X155.041 Y155.7 E.02917
G1 X154.968 Y155.264 E.01467
G1 X151.708 Y155.264 E.10813
G2 X151.619 Y156.936 I1.866 J.938 E.05711
G1 X148.874 Y156.936 E.09106
G1 X148.429 Y156.495 E.02075
G1 X148.053 Y155.7 E.02917
G1 X147.98 Y155.264 E.01467
G1 X144.72 Y155.264 E.10813
G2 X144.63 Y156.936 I1.866 J.938 E.05711
G1 X141.885 Y156.936 E.09106
G1 X141.441 Y156.495 E.02075
G1 X141.065 Y155.7 E.02917
G1 X140.991 Y155.264 E.01467
G1 X137.732 Y155.264 E.10813
G2 X137.642 Y156.936 I1.866 J.938 E.05711
G1 X134.897 Y156.936 E.09106
G1 X134.452 Y156.495 E.02075
G1 X134.076 Y155.7 E.02917
G1 X134.003 Y155.264 E.01467
G1 X130.743 Y155.264 E.10813
G2 X130.654 Y156.936 I1.866 J.938 E.05711
G1 X127.908 Y156.936 E.09106
G1 X127.464 Y156.495 E.02075
G1 X127.088 Y155.7 E.02917
G1 X127.014 Y155.264 E.01467
G1 X123.755 Y155.264 E.10813
G2 X123.665 Y156.936 I1.866 J.938 E.05711
G1 X120.92 Y156.936 E.09106
G1 X120.476 Y156.495 E.02075
G1 X120.099 Y155.7 E.02917
G1 X120.026 Y155.264 E.01467
G1 X116.766 Y155.264 E.10813
G2 X116.677 Y156.936 I1.866 J.938 E.05711
G1 X113.932 Y156.936 E.09106
G1 X113.487 Y156.495 E.02075
G1 X113.111 Y155.7 E.02917
G1 X113.038 Y155.264 E.01467
G1 X109.778 Y155.264 E.10813
G2 X109.688 Y156.936 I1.866 J.938 E.05711
G1 X106.943 Y156.936 E.09106
G1 X106.499 Y156.495 E.02075
G1 X106.123 Y155.7 E.02917
G1 X106.049 Y155.264 E.01467
G1 X102.79 Y155.264 E.10813
G2 X102.7 Y156.936 I1.866 J.938 E.05711
G1 X99.955 Y156.936 E.09106
G1 X99.51 Y156.495 E.02075
G1 X99.134 Y155.7 E.02917
G1 X99.061 Y155.264 E.01467
G1 X95.801 Y155.264 E.10813
G2 X95.712 Y156.936 I1.866 J.938 E.05711
G2 X94.313 Y157.03 I-.392 J4.58 E.04667
G1 X94.353 Y156.877 E.00523
G1 X94.291 Y156.862 E.0021
G1 X93.878 Y157.324 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.404764
G1 F9949.043
G1 X93.612 Y157.256 E.0081
; LINE_WIDTH: 0.440286
G1 F9059.664
G1 X93.586 Y157.25 E.00085
; LINE_WIDTH: 0.473998
G1 F8351.159
G1 X93.561 Y157.244 E.00093
G1 X93.41 Y157.365 E.0068
; LINE_WIDTH: 0.43293
G1 F9230.542
G1 X93.223 Y157.528 E.00787
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9230.542
G1 X93.41 Y157.365 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/60
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z7.8 I-.581 J1.069 P1  F30000
G1 X161.086 Y194.114 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.415 E.12286
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.436 J.066 E.12259
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.069 J2.439 E.12255
G1 X163.416 Y191.724 E1.06383
G3 X161.315 Y194.095 I-2.423 J-.03 E.11455
G1 X161.146 Y194.109 E.00564
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.056 J-2.032 E.1022
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.025 J.049 E.10229
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.052 J2.028 E.10226
G1 X163.009 Y191.717 E1.06316
G3 X161.067 Y193.708 I-2.015 J-.023 E.10184
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.038 J-1.62 E.08192
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.615 J.033 E.082
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.035 J1.617 E.08197
G1 X162.602 Y191.71 E1.06249
G3 X161.209 Y193.288 I-1.608 J-.016 E.07612
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.021 J-1.224 E.05779
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.22 J.017 E.05785
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.018 J1.221 E.05783
G1 X162.21 Y191.704 E.98359
G3 X161.311 Y192.868 I-1.215 J-.009 E.04855
G1 X161.067 Y192.902 E.00758
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02293
G1 X159.067 Y192.91 E-.73707
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z8 F30000
G1 X95.016 Y194.884 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.286 J.026 E.07907
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17224
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.629 I-2.386 J2.172 E.07609
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23496
G1 X94.255 Y194.794 E-.07904
G1 X93.858 Y194.671 E-.15817
G1 X93.48 Y194.496 E-.15806
G1 X93.3 Y194.39 E-.07952
G1 X93.193 Y194.313 E-.05023
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z8 F30000
G1 X82.643 Y154.506 Z8
G1 Z7.6
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.482 E.01202
G3 X79.491 Y151.317 I.42 J-3.183 E.15271
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.212 J.02 E.16605
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.212 J-.02 E.16605
G1 X82.703 Y154.509 E3.00584
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.153 Y154.048 E.0168
G3 X79.898 Y151.31 I.55 J-2.751 E.12738
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.805 J.013 E.14529
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.805 J-.013 E.14529
G1 X82.717 Y154.102 E3.00514
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.663 E.0144
G3 X80.29 Y151.304 I.472 J-2.365 E.10165
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.413 J.006 E.11607
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.413 J-.006 E.11607
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.663 E-.20076
G1 X81.778 Y153.527 E-.17952
G1 X81.361 Y153.304 E-.17954
G1 X80.996 Y153.004 E-.17951
G1 X80.961 Y152.962 E-.02067
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z8 F30000
G1 X95.011 Y195.291 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.704 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.39 Y56.713 E3.00779
G3 X177.291 Y60.717 I-.108 J4.008 E.20519
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.615 I-2.687 J2.451 E.08578
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.122 J.043 E.09891
G1 X93.34 Y155.698 E.06022
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.403 Y56.306 E3.00846
G3 X177.698 Y60.71 I-.123 J4.416 E.22571
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.06029
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.051 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.416 Y55.914 E2.78734
G3 X176.975 Y57.631 I-.117 J4.788 E.12516
G3 X178.09 Y60.703 I-3.695 J3.08 E.10246
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.285 J6.843 E.03422
G3 X165.388 Y159.589 I-3.578 J2.887 E.09012
G1 X165.39 Y191.698 E.98661
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19909
G1 X94.254 Y196.026 E-.1093
G1 X93.696 Y195.891 E-.21812
G1 X93.425 Y195.797 E-.10911
M73 P67 R14
G1 X93.128 Y195.66 E-.12437
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z8 F30000
G1 X93.167 Y157.578 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42918
G1 F9320.145
G3 X93.418 Y157.357 I4.654 J5.011 E.01055
; LINE_WIDTH: 0.476441
G1 F8304.11
G3 X93.742 Y157.105 I4.011 J4.84 E.01448
G1 X93.167 Y157.578 F30000
; LINE_WIDTH: 0.402376
G1 F10015.136
G1 X93.004 Y157.737 E.00667
G2 X92.2 Y159.719 I2.01 J1.97 E.06426
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.681 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.82 Y157.567 I-2.837 J.076 E.06899
; LINE_WIDTH: 0.432231
G1 F9247.113
G2 X162.561 Y157.339 I-3.55 J3.786 E.01093
; LINE_WIDTH: 0.477856
G1 F8277.078
G1 X162.258 Y157.106 E.01356
G1 X97.092 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X95.464 Y156.936 E.05401
G3 X95.406 Y156.495 I.474 J-.285 E.01515
G3 X95.812 Y155.264 I2.702 J.207 E.0434
G1 X98.992 Y155.264 E.10549
G2 X100.081 Y156.936 I2.566 J-.482 E.0679
G1 X102.452 Y156.936 E.07864
G3 X102.395 Y156.495 I.474 J-.285 E.01515
G3 X102.8 Y155.264 I2.702 J.207 E.0434
G1 X105.98 Y155.264 E.10549
G2 X107.07 Y156.936 I2.566 J-.482 E.0679
G1 X109.44 Y156.936 E.07864
G3 X109.383 Y156.495 I.474 J-.285 E.01515
G3 X109.788 Y155.264 I2.702 J.207 E.0434
G1 X112.968 Y155.264 E.10549
G2 X114.058 Y156.936 I2.566 J-.482 E.0679
G1 X116.429 Y156.936 E.07864
G3 X116.372 Y156.495 I.474 J-.285 E.01515
G3 X116.777 Y155.264 I2.702 J.207 E.0434
G1 X119.957 Y155.264 E.10549
G2 X121.046 Y156.936 I2.566 J-.482 E.0679
G1 X123.417 Y156.936 E.07864
G3 X123.36 Y156.495 I.474 J-.285 E.01515
G3 X123.765 Y155.264 I2.702 J.207 E.0434
G1 X126.945 Y155.264 E.10549
G2 X128.035 Y156.936 I2.566 J-.482 E.0679
G1 X130.406 Y156.936 E.07864
G3 X130.348 Y156.495 I.474 J-.285 E.01515
G3 X130.754 Y155.264 I2.702 J.207 E.0434
G1 X133.934 Y155.264 E.10549
G2 X135.023 Y156.936 I2.566 J-.482 E.0679
G1 X137.394 Y156.936 E.07864
G3 X137.337 Y156.495 I.474 J-.285 E.01515
G3 X137.742 Y155.264 I2.702 J.207 E.0434
G1 X140.922 Y155.264 E.10549
G2 X142.012 Y156.936 I2.566 J-.482 E.0679
G1 X144.382 Y156.936 E.07864
G3 X144.325 Y156.495 I.474 J-.285 E.01515
G3 X144.73 Y155.264 I2.702 J.207 E.0434
G1 X147.911 Y155.264 E.10549
G2 X149 Y156.936 I2.566 J-.482 E.0679
G1 X151.371 Y156.936 E.07864
G3 X151.314 Y156.495 I.474 J-.285 E.01515
G3 X151.719 Y155.264 I2.702 J.207 E.0434
G1 X154.899 Y155.264 E.10549
G2 X155.989 Y156.936 I2.566 J-.482 E.0679
G1 X158.359 Y156.936 E.07864
G3 X158.302 Y156.495 I.474 J-.285 E.01515
G3 X158.707 Y155.264 I2.702 J.207 E.0434
G1 X160.336 Y155.264 E.05401
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417474
G1 F9611.447
G1 X173.277 Y154.9 E.37433
G1 X173.541 Y154.892 E.00807
G1 X174.002 Y154.831 E.01418
G1 X174.463 Y154.707 E.01456
G1 X174.683 Y154.623 E.0072
G1 X175.094 Y154.421 E.01399
G1 X175.492 Y154.156 E.01457
G1 X175.85 Y153.841 E.01455
G1 X176.07 Y153.597 E.01005
G1 X176.29 Y153.305 E.01114
G1 X176.529 Y152.892 E.01457
G1 X176.628 Y152.672 E.00737
G1 X176.776 Y152.237 E.014
G1 X176.869 Y151.77 E.01456
G1 X176.9 Y151.277 E.01507
G1 X176.899 Y60.673 E2.76534
G1 X176.87 Y60.236 E.01337
G1 X176.831 Y59.997 E.00739
G1 X176.776 Y59.763 E.00736
G1 X176.628 Y59.328 E.014
G1 X176.414 Y58.895 E.01475
G1 X176.16 Y58.513 E.014
G1 X176.007 Y58.326 E.00738
G1 X175.678 Y57.998 E.01418
G1 X175.492 Y57.844 E.00738
G1 X175.295 Y57.703 E.00738
G1 X174.898 Y57.474 E.014
G1 X174.452 Y57.289 E.01473
G1 X174.009 Y57.171 E.014
G1 X173.77 Y57.131 E.00739
G1 X173.277 Y57.1 E.01507
G1 X82.723 Y57.1 E2.76383
G1 X82.459 Y57.108 E.00807
G1 X81.991 Y57.171 E.01438
G1 X81.543 Y57.291 E.01418
G1 X81.108 Y57.471 E.01437
G1 X80.705 Y57.703 E.01419
G1 X80.504 Y57.848 E.00757
G1 X80.154 Y58.154 E.01418
G1 X79.844 Y58.508 E.01437
G1 X79.703 Y58.705 E.00738
G1 X79.474 Y59.102 E.014
G1 X79.291 Y59.543 E.01455
G1 X79.221 Y59.774 E.00738
G1 X79.132 Y60.224 E.01401
G1 X79.1 Y60.723 E.01525
G1 X79.1 Y151.277 E2.76383
G1 X79.132 Y151.776 E.01525
G1 X79.221 Y152.226 E.014
G1 X79.289 Y152.451 E.0072
G1 X79.471 Y152.892 E.01456
G1 X79.71 Y153.305 E.01455
G1 X79.989 Y153.669 E.01399
G1 X80.15 Y153.841 E.00721
G1 X80.508 Y154.156 E.01455
G1 X80.905 Y154.421 E.01456
G1 X81.317 Y154.623 E.014
G1 X81.537 Y154.707 E.00719
G1 X81.997 Y154.831 E.01455
G1 X82.459 Y154.892 E.0142
G1 X82.723 Y154.9 E.00807
G1 X94.987 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.447
G1 X92.987 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/60
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z8 I-.607 J1.055 P1  F30000
G1 X161.086 Y194.114 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00132
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.443 J.073 E.1225
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00563
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.032 J.056 E.10221
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.0637
G3 X161.262 Y193.692 I-2.015 J-.039 E.09481
G1 X161.119 Y193.703 E.00475
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.62 J.038 E.08193
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.158 Y192.899 I-1.215 J-.012 E.05326
G1 X161.067 Y192.906 E.0028
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02282
G1 X159.067 Y192.91 E-.73718
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z8.2 F30000
G1 X95.016 Y194.884 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.66 Y157.543 I3.287 J.027 E.07903
G1 X95.258 Y154.916 E.12254
G1 X160.742 Y154.916 E2.17224
G1 X163.341 Y157.544 E.1226
G3 X164.182 Y159.624 I-2.385 J2.174 E.076
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23491
G1 X94.055 Y194.739 E-.15811
G1 X93.858 Y194.671 E-.07918
G1 X93.666 Y194.59 E-.07919
G1 X93.3 Y194.391 E-.1581
G1 X93.19 Y194.316 E-.05051
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z8.2 F30000
G1 X82.643 Y154.506 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.479 E.01202
G3 X79.491 Y151.317 I.441 J-3.202 E.15242
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.232 J.04 E.16578
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.04 J3.232 E.16578
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00584
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.045 E.01679
G3 X79.898 Y151.31 I.567 J-2.765 E.12714
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.823 J.031 E.14505
G1 X173.31 Y57.898 E3.00604
M73 P67 R13
G3 X176.102 Y60.69 I-.031 J2.823 E.14505
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00514
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.661 E.01439
G3 X80.29 Y151.304 I.488 J-2.379 E.10144
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.428 J.022 E.11587
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.022 J2.428 E.11586
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.661 E-.20064
G1 X81.778 Y153.527 E-.1794
G1 X81.362 Y153.305 E-.17887
G1 X80.997 Y153.006 E-.17948
G1 X80.961 Y152.962 E-.02161
; WIPE_END
G1 E-.04 F1800
G1 X83.365 Y160.206 Z8.2 F30000
G1 X95.011 Y195.291 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.361 Y157.266 I3.705 J.035 E.08896
G1 X94.315 Y155.291 E.09215
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.384 Y56.712 E3.00761
G3 X177.291 Y60.716 I-.103 J4.008 E.20537
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.639 Y157.267 E.09219
G3 X164.589 Y159.612 I-2.686 J2.452 E.08572
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.0989
G1 X93.34 Y155.698 E.06024
M73 P68 R13
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.397 Y56.306 E3.00828
G3 X177.698 Y60.71 I-.118 J4.417 E.2259
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35261
G1 X163.938 Y156.99 E.06026
G3 X164.996 Y159.6 I-2.987 J2.731 E.09543
G1 X164.998 Y191.694 E1.06461
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.051 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.41 Y55.914 E2.78717
G3 X178.09 Y60.703 I-.132 J4.81 E.22756
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.387 Y156.908 I-6.103 J6.663 E.03493
G3 X165.388 Y159.589 I-3.596 J2.87 E.08939
G1 X165.39 Y191.698 E.98663
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1992
G1 X94.254 Y196.026 E-.10909
G1 X93.696 Y195.891 E-.21811
G1 X93.425 Y195.797 E-.10919
G1 X93.128 Y195.66 E-.1244
; WIPE_END
G1 E-.04 F1800
G1 X93.049 Y188.028 Z8.2 F30000
G1 X92.742 Y158.045 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402376
G1 F10015.151
G1 X92.652 Y158.177 E.00469
G2 X92.2 Y159.719 I2.366 J1.531 E.04774
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.802 J-.068 E.12746
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.68 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.84 Y157.584 I-2.849 J.083 E.06819
; LINE_WIDTH: 0.428539
G1 F9335.637
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.47746
G1 F8284.628
G2 X162.251 Y157.1 I-4.125 J4.98 E.01482
G1 X96.749 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X95.121 Y156.936 E.05401
G3 X95.801 Y155.264 I3.422 J.419 E.06055
G1 X98.842 Y155.264 E.10089
G2 X100.301 Y156.936 I2.745 J-.924 E.0755
G1 X102.109 Y156.936 E.05998
G3 X102.789 Y155.264 I3.422 J.419 E.06055
G1 X105.831 Y155.264 E.10089
G2 X107.289 Y156.936 I2.745 J-.924 E.0755
G1 X109.098 Y156.936 E.05998
G3 X109.778 Y155.264 I3.422 J.419 E.06055
G1 X112.819 Y155.264 E.10089
G2 X114.278 Y156.936 I2.745 J-.924 E.0755
G1 X116.086 Y156.936 E.05998
G3 X116.766 Y155.264 I3.422 J.419 E.06055
G1 X119.808 Y155.264 E.10089
G2 X121.266 Y156.936 I2.745 J-.924 E.0755
G1 X123.074 Y156.936 E.05998
G3 X123.754 Y155.264 I3.422 J.419 E.06055
G1 X126.796 Y155.264 E.10089
G2 X128.255 Y156.936 I2.745 J-.924 E.0755
G1 X130.063 Y156.936 E.05998
G3 X130.743 Y155.264 I3.422 J.419 E.06055
G1 X133.784 Y155.264 E.10089
G2 X135.243 Y156.936 I2.745 J-.924 E.0755
G1 X137.051 Y156.936 E.05998
G3 X137.731 Y155.264 I3.422 J.419 E.06055
G1 X140.773 Y155.264 E.10089
G2 X142.231 Y156.936 I2.745 J-.924 E.0755
G1 X144.04 Y156.936 E.05998
G3 X144.72 Y155.264 I3.422 J.419 E.06055
G1 X147.761 Y155.264 E.10089
G2 X149.22 Y156.936 I2.745 J-.924 E.0755
G1 X151.028 Y156.936 E.05998
G3 X151.708 Y155.264 I3.422 J.419 E.06055
G1 X154.75 Y155.264 E.10089
G2 X156.208 Y156.936 I2.745 J-.924 E.0755
G1 X158.016 Y156.936 E.05998
G3 X158.696 Y155.264 I3.422 J.419 E.06055
G1 X160.325 Y155.264 E.05401
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417484
G1 F9611.18
G1 X173.535 Y154.892 E.38222
G1 X174.002 Y154.831 E.01438
G1 X174.457 Y154.709 E.01437
G1 X174.892 Y154.529 E.01438
G1 X175.316 Y154.282 E.01498
G2 X176.9 Y151.277 I-2.017 J-2.982 E.10796
G1 X176.9 Y60.723 E2.76391
G1 X176.892 Y60.459 E.00808
G1 X176.831 Y59.997 E.0142
G1 X176.711 Y59.548 E.01419
G1 X176.618 Y59.304 E.00797
G2 X173.277 Y57.1 I-3.324 J1.404 E.12951
G1 X82.723 Y57.1 E2.7639
G1 X82.459 Y57.108 E.00807
G1 X81.998 Y57.169 E.01419
G1 X81.549 Y57.289 E.01419
G1 X81.304 Y57.382 E.00798
G2 X79.1 Y60.723 I1.405 J3.324 E.1295
G1 X79.1 Y151.277 E2.7639
G1 X79.131 Y151.77 E.01508
G1 X79.224 Y152.238 E.01455
G1 X79.372 Y152.672 E.01401
G1 X79.469 Y152.887 E.00719
G1 X79.718 Y153.316 E.01515
G2 X82.723 Y154.9 I2.983 J-2.016 E.10798
G1 X94.987 Y154.9 E.37433
; WIPE_START
G1 X92.987 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.886 Y157.32 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.413951
G1 F9702.716
G1 X93.61 Y157.252 E.00859
; LINE_WIDTH: 0.447489
G1 F8898.369
G1 X93.587 Y157.246 E.00078
; LINE_WIDTH: 0.473105
G1 F8368.5
G1 X93.564 Y157.241 E.00083
G1 X93.398 Y157.374 E.00745
; LINE_WIDTH: 0.410344
G1 F9797.962
G2 X92.742 Y158.045 I2.373 J2.975 E.02815
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9797.962
G1 X92.994 Y157.748 E-.31481
G1 X93.398 Y157.374 E-.44519
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/60
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z8.2 I-.581 J1.07 P1  F30000
G1 X161.086 Y194.114 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.415 E.12286
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.435 J.066 E.12259
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.069 J2.439 E.12254
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00563
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19066
G3 X92.991 Y191.733 I.032 J-2.008 E.10252
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.025 J.049 E.1023
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.052 J2.028 E.10226
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19066
G3 X93.398 Y191.72 I.02 J-1.602 E.08217
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.614 J.032 E.082
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.035 J1.617 E.08197
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.032 J-1.235 E.05766
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.219 J.016 E.05785
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.019 J1.222 E.05783
G1 X162.21 Y191.707 E.9837
G3 X161.158 Y192.899 I-1.215 J-.012 E.05326
G1 X161.067 Y192.906 E.0028
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02281
G1 X159.067 Y192.91 E-.73719
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z8.4 F30000
G1 X95.016 Y194.884 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.027 E.07907
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17223
G1 X163.343 Y157.545 E.12267
G3 X164.182 Y159.629 I-2.386 J2.172 E.0761
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23486
G1 X94.055 Y194.739 E-.15821
G1 X93.858 Y194.671 E-.0791
G1 X93.48 Y194.496 E-.15817
G1 X93.3 Y194.391 E-.07919
G1 X93.19 Y194.316 E-.05047
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z8.4 F30000
G1 X82.643 Y154.506 Z8.4
G1 Z8
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00584
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
M73 P69 R13
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20069
G1 X81.778 Y153.527 E-.17947
G1 X81.362 Y153.305 E-.17884
G1 X80.996 Y153.004 E-.18022
G1 X80.961 Y152.962 E-.02079
; WIPE_END
G1 E-.04 F1800
G1 X83.365 Y160.206 Z8.4 F30000
G1 X95.011 Y195.291 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.379 Y56.712 E3.00743
G3 X177.291 Y60.717 I-.081 J3.993 E.20577
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.006 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.616 I-2.687 J2.451 E.08578
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.392 Y56.305 E3.0081
G3 X177.698 Y60.71 I-.094 J4.399 E.22632
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.723 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.405 Y55.914 E2.787
G3 X178.09 Y60.703 I-.107 J4.791 E.22797
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.285 J6.842 E.03422
G3 X165.388 Y159.589 I-3.578 J2.887 E.09012
G1 X165.39 Y191.698 E.98661
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19919
G1 X94.254 Y196.026 E-.10919
G1 X93.696 Y195.891 E-.21807
G1 X93.425 Y195.797 E-.10917
G1 X93.128 Y195.66 E-.12438
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z8.4 F30000
G1 X93.167 Y157.579 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428795
G1 F9329.452
G3 X93.414 Y157.36 I4.555 J4.903 E.01038
; LINE_WIDTH: 0.475767
G1 F8317.035
G3 X93.741 Y157.105 I4.315 J5.193 E.01463
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402377
G1 F10015.109
G1 X93.005 Y157.737 E.00662
G2 X92.2 Y159.719 I2.011 J1.971 E.06429
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93455
G2 X163.8 Y191.68 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.82 Y157.567 I-2.837 J.076 E.06899
; LINE_WIDTH: 0.432215
G1 F9247.494
G2 X162.561 Y157.339 I-3.579 J3.818 E.01093
; LINE_WIDTH: 0.477859
G1 F8277.023
G1 X162.258 Y157.106 E.01356
; WIPE_START
G1 X162.561 Y157.339 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.934 Y157.064 Z8.4 F30000
G1 X94.987 Y154.9 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.417479
G1 F9611.316
G1 X82.723 Y154.9 E.37433
G3 X79.173 Y152.021 I-.023 J-3.6 E.15112
G1 X79.13 Y151.764 E.00798
G1 X79.1 Y151.277 E.01488
G1 X79.1 Y60.723 E2.76387
G3 X79.367 Y59.34 I3.701 J-.003 E.04325
G1 X79.582 Y58.9 E.01496
G1 X79.848 Y58.504 E.01456
G1 X79.998 Y58.322 E.00719
G1 X80.322 Y57.998 E.014
G1 X80.7 Y57.707 E.01456
G1 X81.108 Y57.471 E.01438
G1 X81.549 Y57.289 E.01455
G1 X82.004 Y57.168 E.01437
G1 X82.236 Y57.13 E.0072
G1 X82.68 Y57.101 E.01356
G1 X173.277 Y57.1 E2.76519
G3 X176.618 Y59.305 I.017 J3.609 E.12952
G1 X176.711 Y59.548 E.00796
G1 X176.831 Y59.998 E.01419
G1 X176.892 Y60.459 E.01419
G1 X176.9 Y60.723 E.00808
G1 X176.9 Y151.277 E2.76387
G1 X176.868 Y151.776 E.01525
G1 X176.829 Y152.008 E.0072
G1 X176.711 Y152.451 E.01399
G1 X176.529 Y152.892 E.01456
G1 X176.29 Y153.305 E.01457
G1 X176.011 Y153.669 E.01399
G1 X175.85 Y153.841 E.0072
G1 X175.492 Y154.156 E.01455
G1 X175.094 Y154.421 E.01457
G1 X174.683 Y154.623 E.01399
G1 X174.463 Y154.707 E.0072
G1 X174.002 Y154.831 E.01455
G1 X173.541 Y154.892 E.01419
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37434
G1 X160.304 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X158.676 Y155.264 E.05401
G1 X157.701 Y156.692 E.05735
G1 X157.338 Y156.936 E.01449
G3 X154.571 Y155.264 I-.201 J-2.794 E.11432
G1 X151.687 Y155.264 E.09564
G1 X150.713 Y156.692 E.05735
G1 X150.35 Y156.936 E.01449
M73 P70 R13
G3 X147.582 Y155.264 I-.201 J-2.794 E.11432
G1 X144.699 Y155.264 E.09564
G1 X143.724 Y156.692 E.05735
G1 X143.361 Y156.936 E.01449
G3 X140.594 Y155.264 I-.201 J-2.794 E.11432
G1 X137.711 Y155.264 E.09564
G1 X136.736 Y156.692 E.05735
G1 X136.373 Y156.936 E.01449
G3 X133.605 Y155.264 I-.201 J-2.794 E.11432
G1 X130.722 Y155.264 E.09564
G1 X129.747 Y156.692 E.05735
G1 X129.385 Y156.936 E.01449
G3 X126.617 Y155.264 I-.201 J-2.794 E.11432
G1 X123.734 Y155.264 E.09564
G1 X122.759 Y156.692 E.05735
G1 X122.396 Y156.936 E.01449
G3 X119.629 Y155.264 I-.201 J-2.794 E.11432
G1 X116.745 Y155.264 E.09564
G1 X115.771 Y156.692 E.05735
G1 X115.408 Y156.936 E.01449
M73 P70 R12
G3 X112.64 Y155.264 I-.201 J-2.794 E.11432
G1 X109.757 Y155.264 E.09564
G1 X108.782 Y156.692 E.05735
G1 X108.419 Y156.936 E.01449
G3 X105.652 Y155.264 I-.201 J-2.794 E.11432
G1 X102.769 Y155.264 E.09564
G1 X101.794 Y156.692 E.05735
G1 X101.431 Y156.936 E.01449
G3 X98.663 Y155.264 I-.201 J-2.794 E.11432
G1 X95.78 Y155.264 E.09564
G1 X94.805 Y156.692 E.05735
G1 X94.369 Y156.985 E.01744
G3 X93.918 Y156.766 I-.139 J-.287 E.01912
G1 X94.869 Y155.804 E.04486
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X93.918 Y156.766 E-.51389
G1 X94.088 Y156.984 E-.10487
G1 X94.369 Y156.985 E-.1067
G1 X94.444 Y156.935 E-.03454
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/60
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z8.4 I-.592 J1.063 P1  F30000
G1 X161.139 Y194.106 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X161.046 Y194.116 E.0031
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12276
G1 X92.584 Y159.658 E1.06442
G3 X94.954 Y157.284 I2.435 J.061 E.12275
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.07 J2.439 E.12254
G1 X163.416 Y191.746 E1.06458
G3 X161.494 Y194.065 I-2.423 J-.053 E.10779
G1 X161.199 Y194.099 E.00985
G1 X161.093 Y193.703 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00201
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.67 E1.06359
G3 X94.967 Y157.691 I2.025 J.045 E.10241
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.052 J2.028 E.10225
G1 X163.009 Y191.733 E1.0637
G3 X161.408 Y193.667 I-2.015 J-.039 E.08989
G1 X161.153 Y193.696 E.00852
G1 X161.048 Y193.299 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00096
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.682 E1.06275
G3 X94.98 Y158.098 I1.614 J.03 E.08207
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.035 J1.618 E.08196
G1 X162.602 Y191.72 E1.06281
G3 X161.322 Y193.269 I-1.608 J-.025 E.07199
G1 X161.108 Y193.292 E.00714
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.694 E.98368
G3 X94.993 Y158.49 I1.219 J.015 E.05788
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.019 J1.222 E.05782
G1 X162.21 Y191.707 E.9837
G3 X161.239 Y192.885 I-1.215 J-.012 E.05072
G1 X161.067 Y192.904 E.00533
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02287
G1 X159.067 Y192.91 E-.73713
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z8.6 F30000
G1 X95.016 Y194.884 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.657 Y157.545 I3.288 J.026 E.07891
G1 X95.258 Y154.916 E.12266
G1 X160.742 Y154.916 E2.17224
G1 X163.341 Y157.544 E.1226
G3 X164.182 Y159.624 I-2.385 J2.174 E.076
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.235
G1 X94.054 Y194.739 E-.15809
G1 X93.858 Y194.671 E-.07919
G1 X93.48 Y194.496 E-.1581
G1 X93.3 Y194.391 E-.07916
G1 X93.19 Y194.316 E-.05047
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z8.6 F30000
G1 X82.643 Y154.506 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.231 J.039 E.16579
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.039 J3.231 E.16579
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.231 J-.039 E.16579
G1 X82.703 Y154.509 E3.00584
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.822 J.03 E.14506
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.03 J2.822 E.14506
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.822 J-.03 E.14506
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.428 J.021 E.11587
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.021 J2.428 E.11587
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.428 J-.021 E.11587
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20069
G1 X81.778 Y153.527 E-.17944
G1 X81.361 Y153.304 E-.17956
G1 X80.996 Y153.004 E-.17947
G1 X80.961 Y152.962 E-.02083
; WIPE_END
G1 E-.04 F1800
G1 X83.365 Y160.206 Z8.6 F30000
G1 X95.011 Y195.291 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.359 Y157.268 I3.705 J.035 E.08888
G1 X94.315 Y155.291 E.09223
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.373 Y56.712 E3.00725
G3 X175.13 Y57.156 I-.142 J4.26 E.06055
G3 X177.291 Y60.716 I-1.876 J3.575 E.14518
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.006 E.20873
G1 X161.685 Y155.291 E.38473
G1 X163.64 Y157.267 E.0922
G3 X164.589 Y159.612 I-2.686 J2.452 E.08571
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.061 Y156.99 I4.123 J.043 E.09884
G1 X93.34 Y155.698 E.06029
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.387 Y56.305 E3.00792
G3 X177.698 Y60.71 I-.089 J4.4 E.2265
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35261
G1 X163.938 Y156.99 E.06027
G3 X164.996 Y159.6 I-2.988 J2.73 E.09542
G1 X164.998 Y191.694 E1.06461
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.774 Y156.723 I4.525 J.052 E.10045
G1 X92.4 Y156.09 E.02735
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.399 Y55.913 E2.78684
G3 X178.09 Y60.703 I-.102 J4.791 E.22814
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.386 Y156.907 I-6.12 J6.678 E.03485
G3 X165.388 Y159.589 I-3.594 J2.871 E.08946
G1 X165.39 Y191.698 E.98664
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19909
G1 X94.254 Y196.026 E-.10927
G1 X93.696 Y195.891 E-.21809
G1 X93.424 Y195.797 E-.10926
G1 X93.128 Y195.66 E-.12429
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z8.6 F30000
G1 X93.167 Y157.579 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42879
G1 F9329.58
G3 X93.414 Y157.36 I4.529 J4.874 E.01038
; LINE_WIDTH: 0.475834
G1 F8315.749
G3 X93.741 Y157.105 I4.289 J5.16 E.01465
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402377
G1 F10015.119
G1 X93.005 Y157.736 E.00661
G2 X92.2 Y159.719 I2.008 J1.971 E.06431
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.802 J-.067 E.12746
G1 X161.065 Y194.499 E1.93455
M73 P71 R12
G2 X163.8 Y191.681 I-.067 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.82 Y157.567 I-2.838 J.077 E.06899
; LINE_WIDTH: 0.432268
G1 F9246.227
G2 X162.561 Y157.339 I-3.575 J3.814 E.01093
; LINE_WIDTH: 0.477901
G1 F8276.234
G1 X162.258 Y157.106 E.01355
G1 X95.391 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X94.16 Y157.076 I-.214 J3.605 E.04131
G1 X93.932 Y156.775 E.0125
G2 X94.805 Y156.312 I-.068 J-1.183 E.03384
G1 X95.697 Y155.264 E.04562
G1 X98.448 Y155.264 E.09126
G1 X99.173 Y156.124 E.0373
G2 X101.357 Y156.664 I1.582 J-1.707 E.0779
G1 X101.794 Y156.312 E.01862
G1 X102.685 Y155.264 E.04562
G1 X105.436 Y155.264 E.09126
G1 X106.162 Y156.124 E.0373
G2 X108.345 Y156.664 I1.582 J-1.707 E.0779
G1 X108.782 Y156.312 E.01862
G1 X109.673 Y155.264 E.04562
G1 X112.424 Y155.264 E.09126
G1 X113.15 Y156.124 E.0373
G2 X115.334 Y156.664 I1.582 J-1.707 E.0779
G1 X115.771 Y156.312 E.01862
G1 X116.662 Y155.264 E.04562
G1 X119.413 Y155.264 E.09126
G1 X120.138 Y156.124 E.0373
G2 X122.322 Y156.664 I1.582 J-1.707 E.0779
G1 X122.759 Y156.312 E.01862
G1 X123.65 Y155.264 E.04562
G1 X126.401 Y155.264 E.09126
G1 X127.127 Y156.124 E.0373
G2 X129.311 Y156.664 I1.582 J-1.707 E.0779
G1 X129.747 Y156.312 E.01862
G1 X130.639 Y155.264 E.04562
G1 X133.39 Y155.264 E.09126
G1 X134.115 Y156.124 E.0373
G2 X136.299 Y156.664 I1.582 J-1.707 E.0779
G1 X136.736 Y156.312 E.01862
G1 X137.627 Y155.264 E.04562
G1 X140.378 Y155.264 E.09126
G1 X141.104 Y156.124 E.0373
G2 X143.287 Y156.664 I1.582 J-1.707 E.0779
G1 X143.724 Y156.312 E.01862
G1 X144.615 Y155.264 E.04562
G1 X147.367 Y155.264 E.09126
G1 X148.092 Y156.124 E.0373
G2 X150.276 Y156.664 I1.582 J-1.707 E.0779
G1 X150.713 Y156.312 E.01862
G1 X151.604 Y155.264 E.04562
G1 X154.355 Y155.264 E.09126
G1 X155.08 Y156.124 E.0373
G2 X157.264 Y156.664 I1.582 J-1.707 E.0779
G1 X157.701 Y156.312 E.01862
G1 X158.592 Y155.264 E.04562
G1 X160.221 Y155.264 E.05401
G1 X161.013 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417478
G1 F9611.332
G1 X173.535 Y154.892 E.38222
G1 X173.996 Y154.832 E.01419
G1 X174.232 Y154.777 E.00738
G1 X174.463 Y154.707 E.00737
G1 X174.887 Y154.531 E.014
G1 X175.105 Y154.414 E.00756
G1 X175.487 Y154.16 E.014
G1 X175.859 Y153.832 E.01513
G2 X176.9 Y151.277 I-2.582 J-2.542 E.08639
G1 X176.9 Y60.723 E2.76386
G1 X176.892 Y60.459 E.00808
G1 X176.831 Y59.998 E.01419
G1 X176.776 Y59.763 E.00737
G1 X176.626 Y59.322 E.01419
G1 X176.421 Y58.905 E.01418
G1 X176.293 Y58.7 E.00738
G1 X176.01 Y58.331 E.01419
G1 X175.832 Y58.141 E.00794
G2 X173.277 Y57.1 I-2.542 J2.581 E.0864
G1 X82.723 Y57.1 E2.76386
G1 X82.459 Y57.108 E.00807
G1 X81.998 Y57.169 E.01419
G1 X81.763 Y57.224 E.00737
G1 X81.322 Y57.374 E.01419
G1 X80.905 Y57.579 E.01418
G1 X80.7 Y57.707 E.00738
G1 X80.331 Y57.99 E.01419
G1 X80.141 Y58.168 E.00794
G2 X79.1 Y60.723 I2.581 J2.542 E.0864
G1 X79.1 Y151.277 E2.76386
G1 X79.131 Y151.77 E.01507
G1 X79.224 Y152.238 E.01456
G1 X79.372 Y152.672 E.01401
G1 X79.469 Y152.887 E.00719
G1 X79.717 Y153.315 E.01513
G2 X82.723 Y154.9 I2.983 J-2.016 E.108
G1 X94.987 Y154.9 E.37433
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.332
G1 X92.987 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/60
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z8.6 I-.607 J1.055 P1  F30000
G1 X161.086 Y194.114 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.415 E.12286
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.443 J.073 E.12249
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.1138
G1 X161.146 Y194.109 E.00565
G1 X161.007 Y193.709 F30000
G1 F8843.478
G1 X94.967 Y193.709 E2.19067
G3 X92.991 Y191.733 I.032 J-2.008 E.10252
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.032 J.056 E.10221
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10242
G1 X163.009 Y191.733 E1.0637
G3 X161.067 Y193.708 I-2.015 J-.039 E.10131
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19066
G3 X93.398 Y191.72 I.02 J-1.602 E.08217
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.62 J.038 E.08193
G1 X161.02 Y158.098 E2.19066
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.07579
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.032 J-1.235 E.05766
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.012 J1.215 E.0579
G1 X162.21 Y191.707 E.9837
G3 X161.311 Y192.868 I-1.215 J-.012 E.04845
G1 X161.067 Y192.902 E.00758
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02289
G1 X159.067 Y192.91 E-.73711
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z8.8 F30000
G1 X95.016 Y194.884 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.66 Y157.543 I3.287 J.027 E.07903
G1 X95.258 Y154.916 E.12255
G1 X160.742 Y154.916 E2.17223
G1 X163.341 Y157.544 E.12261
G3 X164.182 Y159.624 I-2.386 J2.174 E.07599
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23487
G1 X94.054 Y194.739 E-.15827
G1 X93.858 Y194.671 E-.07913
G1 X93.666 Y194.589 E-.07914
G1 X93.3 Y194.391 E-.15814
G1 X93.193 Y194.313 E-.05045
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z8.8 F30000
G1 X82.643 Y154.506 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.231 J.039 E.1658
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.039 J3.231 E.1658
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.822 J.03 E.14506
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.03 J2.822 E.14506
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.428 J.021 E.11588
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.021 J2.428 E.11588
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20071
G1 X81.778 Y153.527 E-.17947
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.004 E-.17951
G1 X80.961 Y152.962 E-.02078
; WIPE_END
G1 E-.04 F1800
G1 X83.365 Y160.206 Z8.8 F30000
G1 X95.011 Y195.291 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.361 Y157.266 I3.705 J.035 E.08896
G1 X94.315 Y155.291 E.09215
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.716 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.368 Y56.712 E3.00707
G3 X177.291 Y60.716 I-.071 J3.993 E.20613
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.267 E.0922
G3 X164.589 Y159.612 I-2.687 J2.452 E.0857
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.09889
G1 X93.34 Y155.698 E.06025
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.381 Y56.305 E3.00774
G3 X177.698 Y60.71 I-.084 J4.4 E.22668
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35261
G1 X163.938 Y156.99 E.06027
G3 X164.996 Y159.6 I-2.988 J2.73 E.09542
M73 P72 R12
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.723 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.394 Y55.913 E2.78667
G3 X178.09 Y60.703 I-.097 J4.792 E.22831
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.797 J-.003 E.23132
G1 X163.6 Y156.09 E.29796
G3 X164.385 Y156.906 I-6.127 J6.686 E.03482
G3 X165.388 Y159.588 I-3.593 J2.872 E.08949
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19919
G1 X94.254 Y196.026 E-.10916
G1 X93.696 Y195.891 E-.21816
G1 X93.425 Y195.797 E-.10916
G1 X93.16 Y195.685 E-.10912
G1 X93.125 Y195.666 E-.01521
; WIPE_END
G1 E-.04 F1800
G1 X93.152 Y188.034 Z8.8 F30000
G1 X93.259 Y157.495 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43952
G1 F9077.173
G3 X93.444 Y157.336 I3.27 J3.631 E.00789
; LINE_WIDTH: 0.480431
G1 F8228.375
G3 X93.742 Y157.106 I4.882 J6 E.01341
G1 X93.259 Y157.495 F30000
; LINE_WIDTH: 0.402388
G1 F10014.822
G2 X92.2 Y159.719 I1.791 J2.217 E.07463
G1 X92.201 Y191.765 E.93869
G2 X95.02 Y194.5 I2.808 J-.074 E.12739
G1 X161.065 Y194.499 E1.9346
G2 X163.8 Y191.68 I-.068 J-2.802 E.12746
G1 X163.799 Y159.635 E.93868
G2 X162.84 Y157.584 I-2.849 J.083 E.06819
; LINE_WIDTH: 0.428542
G1 F9335.567
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.476359
G1 F8305.68
G2 X162.258 Y157.106 I-3.991 J4.813 E.01446
G1 X95.013 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M73 P72 R11
G2 X94.159 Y157.076 I.113 J3.361 E.02881
G1 X93.919 Y156.765 E.01301
G2 X95.603 Y155.264 I-20.842 J-25.079 E.07484
G1 X98.201 Y155.264 E.08619
G3 X99.173 Y156.212 I-5.962 J7.091 E.04507
G2 X101.357 Y156.425 I1.268 J-1.7 E.0765
G2 X102.591 Y155.264 I-7.28 J-8.979 E.05624
G1 X105.189 Y155.264 E.08619
G3 X106.162 Y156.212 I-5.962 J7.091 E.04507
G2 X108.345 Y156.425 I1.268 J-1.7 E.0765
G2 X109.58 Y155.264 I-7.279 J-8.978 E.05624
G1 X112.178 Y155.264 E.08619
G3 X113.15 Y156.212 I-5.962 J7.091 E.04507
G2 X115.334 Y156.425 I1.268 J-1.7 E.0765
G2 X116.568 Y155.264 I-7.28 J-8.979 E.05624
G1 X119.166 Y155.264 E.08619
G3 X120.138 Y156.212 I-5.962 J7.091 E.04507
G2 X122.322 Y156.425 I1.268 J-1.7 E.0765
G2 X123.556 Y155.264 I-7.279 J-8.978 E.05624
G1 X126.155 Y155.264 E.08619
G3 X127.127 Y156.212 I-5.962 J7.091 E.04507
G2 X129.311 Y156.425 I1.268 J-1.7 E.0765
G2 X130.545 Y155.264 I-7.279 J-8.978 E.05624
G1 X133.143 Y155.264 E.08619
G3 X134.115 Y156.212 I-5.962 J7.091 E.04507
G2 X136.299 Y156.425 I1.268 J-1.7 E.0765
G2 X137.533 Y155.264 I-7.28 J-8.979 E.05624
G1 X140.131 Y155.264 E.08619
G3 X141.104 Y156.212 I-5.962 J7.091 E.04507
G2 X143.287 Y156.425 I1.268 J-1.7 E.0765
G2 X144.522 Y155.264 I-7.279 J-8.978 E.05624
G1 X147.12 Y155.264 E.08619
G3 X148.092 Y156.212 I-5.962 J7.091 E.04507
G2 X150.276 Y156.425 I1.268 J-1.7 E.0765
G2 X151.51 Y155.264 I-7.28 J-8.979 E.05624
G1 X154.108 Y155.264 E.08619
G3 X155.08 Y156.212 I-5.962 J7.091 E.04507
G2 X157.264 Y156.425 I1.268 J-1.7 E.0765
G2 X158.498 Y155.264 I-7.279 J-8.978 E.05624
G1 X160.127 Y155.264 E.05401
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417478
G1 F9611.349
G1 X173.535 Y154.892 E.38222
G1 X174.002 Y154.831 E.01438
G1 X174.457 Y154.709 E.01437
G1 X174.892 Y154.529 E.01437
G1 X175.315 Y154.283 E.01494
G2 X176.9 Y151.277 I-2.015 J-2.983 E.108
G1 X176.9 Y60.723 E2.76386
G1 X176.892 Y60.459 E.00808
G1 X176.831 Y59.997 E.0142
G1 X176.711 Y59.548 E.01419
G1 X176.619 Y59.306 E.00793
G2 X173.277 Y57.1 I-3.325 J1.404 E.12955
G1 X82.723 Y57.1 E2.76386
G1 X82.459 Y57.108 E.00807
G1 X81.998 Y57.169 E.01419
G1 X81.762 Y57.224 E.00738
G1 X81.322 Y57.374 E.01418
G1 X80.905 Y57.579 E.01418
G1 X80.7 Y57.707 E.00737
G1 X80.331 Y57.99 E.01419
G1 X80.142 Y58.168 E.00793
G2 X79.1 Y60.723 I2.581 J2.542 E.08641
G1 X79.1 Y151.277 E2.76386
G1 X79.108 Y151.541 E.00807
G1 X79.173 Y152.02 E.01475
G2 X82.723 Y154.9 I3.527 J-.72 E.15116
G1 X94.988 Y154.9 E.37434
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9611.349
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/60
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z8.8 I-.607 J1.055 P1  F30000
G1 X161.086 Y194.114 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00132
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.414 E.12287
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.435 J.065 E.1226
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00563
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.032 J-2.008 E.10252
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.024 J.048 E.1023
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.06369
G3 X161.262 Y193.692 I-2.015 J-.039 E.09481
G1 X161.119 Y193.703 E.00475
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.02 J-1.602 E.08217
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.614 J.032 E.08201
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.0821
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.032 J-1.235 E.05767
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.219 J.016 E.05786
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.313 Y192.868 I-1.215 J-.012 E.04839
G1 X161.067 Y192.902 E.00764
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.0229
G1 X159.067 Y192.91 E-.7371
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z9 F30000
G1 X95.016 Y194.884 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.026 E.07908
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.624 I-2.388 J2.173 E.07592
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23504
G1 X94.054 Y194.739 E-.15816
G1 X93.858 Y194.671 E-.07897
G1 X93.48 Y194.496 E-.15828
G1 X93.3 Y194.391 E-.07916
G1 X93.193 Y194.313 E-.05038
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z9 F30000
G1 X82.643 Y154.506 Z9
G1 Z8.6
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.676 Y57.491 I3.231 J.038 E.16556
G1 X173.317 Y57.491 E3.00673
G3 X176.509 Y60.683 I-.038 J3.231 E.1658
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.231 J-.038 E.1658
G1 X82.703 Y154.509 E3.00583
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.686 Y57.898 I2.821 J.029 E.14492
G1 X173.31 Y57.898 E3.00618
G3 X176.102 Y60.69 I-.029 J2.821 E.14507
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.821 J-.029 E.14507
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.01439
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.695 Y58.29 I2.427 J.021 E.11583
G1 X173.304 Y58.29 E2.78415
G3 X175.71 Y60.696 I-.021 J2.427 E.11588
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.427 J-.021 E.11588
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20071
G1 X81.778 Y153.527 E-.17944
M73 P73 R11
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.004 E-.17955
G1 X80.961 Y152.962 E-.02077
; WIPE_END
G1 E-.04 F1800
G1 X83.365 Y160.206 Z9 F30000
G1 X95.011 Y195.291 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.089
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.362 Y56.712 E3.00689
G3 X177.291 Y60.717 I-.066 J3.994 E.20632
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.612 I-2.688 J2.451 E.08566
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.376 Y56.305 E3.00756
G3 X177.698 Y60.71 I-.079 J4.4 E.22686
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.6 I-2.988 J2.73 E.09539
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.052 E.10048
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.389 Y55.913 E2.7865
G3 X178.09 Y60.703 I-.091 J4.792 E.22848
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.285 J6.843 E.03423
G3 X165.388 Y159.588 I-3.579 J2.887 E.09009
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19919
G1 X94.254 Y196.026 E-.10921
G1 X93.696 Y195.891 E-.21813
G1 X93.425 Y195.797 E-.10907
G1 X93.16 Y195.685 E-.10917
G1 X93.125 Y195.666 E-.01523
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z9 F30000
G1 X93.167 Y157.579 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428844
G1 F9328.271
G3 X93.415 Y157.36 I4.605 J4.959 E.0104
; LINE_WIDTH: 0.475885
G1 F8314.767
G3 X93.742 Y157.105 I4.247 J5.112 E.01463
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402376
G1 F10015.157
G1 X93.007 Y157.735 E.00657
G2 X92.2 Y159.719 I2.007 J1.972 E.06436
G1 X92.201 Y191.765 E.93865
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.681 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.84 Y157.584 I-2.844 J.08 E.06821
; LINE_WIDTH: 0.428513
G1 F9336.283
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.476339
G1 F8306.066
G2 X162.258 Y157.106 I-4.013 J4.843 E.01447
G1 X96.336 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X97.964 Y155.264 E.05401
G2 X99.173 Y156.31 I8.562 J-8.672 E.05306
G2 X101.794 Y155.837 I1.026 J-1.809 E.09587
G3 X102.429 Y155.264 I2.269 J1.877 E.02846
G1 X104.953 Y155.264 E.08373
G2 X106.162 Y156.31 I8.562 J-8.672 E.05306
G2 X108.782 Y155.837 I1.026 J-1.809 E.09587
G3 X109.417 Y155.264 I2.268 J1.877 E.02846
G1 X111.941 Y155.264 E.08373
G2 X113.15 Y156.31 I8.56 J-8.67 E.05306
G2 X115.771 Y155.837 I1.026 J-1.809 E.09587
G3 X116.405 Y155.264 I2.269 J1.877 E.02846
G1 X118.93 Y155.264 E.08373
G2 X120.138 Y156.31 I8.562 J-8.672 E.05306
G2 X122.759 Y155.837 I1.026 J-1.809 E.09587
G3 X123.394 Y155.264 I2.268 J1.877 E.02846
G1 X125.918 Y155.264 E.08373
G2 X127.127 Y156.31 I8.56 J-8.67 E.05306
G2 X129.747 Y155.837 I1.026 J-1.809 E.09587
G3 X130.382 Y155.264 I2.268 J1.877 E.02846
G1 X132.906 Y155.264 E.08373
G2 X134.115 Y156.31 I8.56 J-8.669 E.05306
G2 X136.736 Y155.837 I1.026 J-1.809 E.09587
G3 X137.371 Y155.264 I2.269 J1.877 E.02846
G1 X139.895 Y155.264 E.08373
G2 X141.104 Y156.31 I8.56 J-8.67 E.05306
G2 X143.724 Y155.837 I1.026 J-1.809 E.09587
G3 X144.359 Y155.264 I2.268 J1.877 E.02846
G1 X146.883 Y155.264 E.08373
G2 X148.092 Y156.31 I8.56 J-8.669 E.05306
G2 X150.713 Y155.837 I1.026 J-1.809 E.09587
G3 X151.347 Y155.264 I2.269 J1.877 E.02846
G1 X153.872 Y155.264 E.08373
G2 X155.08 Y156.31 I8.56 J-8.669 E.05306
G2 X157.701 Y155.837 I1.026 J-1.809 E.09587
G3 X158.336 Y155.264 I2.268 J1.877 E.02846
G1 X159.964 Y155.264 E.05401
; WIPE_START
G1 X158.336 Y155.264 E-.61876
G1 X158.06 Y155.513 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z9 F30000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.41748
G1 F9611.279
G1 X173.32 Y154.899 E.37566
G1 X173.764 Y154.87 E.01356
G1 X174.002 Y154.831 E.00738
G1 X174.451 Y154.711 E.01418
G1 X174.694 Y154.619 E.00792
G2 X176.9 Y151.277 I-1.403 J-3.325 E.12957
G1 X176.9 Y60.723 E2.76388
G1 X176.892 Y60.459 E.00808
G1 X176.831 Y59.997 E.0142
G1 X176.776 Y59.763 E.00736
G1 X176.626 Y59.322 E.0142
G1 X176.421 Y58.905 E.01418
G1 X176.293 Y58.7 E.00737
G1 X176.01 Y58.331 E.01419
G1 X175.833 Y58.142 E.00792
G2 X173.277 Y57.1 I-2.543 J2.581 E.08642
G1 X82.662 Y57.101 E2.76574
G2 X79.1 Y60.723 I.043 J3.605 E.17206
G1 X79.1 Y151.277 E2.76388
G1 X79.108 Y151.541 E.00807
G1 X79.173 Y152.02 E.01474
G2 X82.723 Y154.9 I3.527 J-.72 E.15117
G1 X94.988 Y154.9 E.37434
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.279
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/60
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z9 I-.607 J1.055 P1  F30000
G1 X161.086 Y194.114 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.415 E.12286
G1 X92.584 Y159.657 E1.06446
G3 X94.954 Y157.284 I2.434 J.061 E.12273
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.724 E1.06383
G3 X161.315 Y194.095 I-2.422 J-.03 E.11456
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.056 J-2.032 E.1022
G1 X92.991 Y159.67 E1.06361
G3 X94.967 Y157.691 I2.024 J.045 E.1024
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.717 E1.06316
G3 X161.262 Y193.692 I-2.015 J-.023 E.09534
G1 X161.119 Y193.703 E.00475
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19066
G3 X93.398 Y191.72 I.038 J-1.621 E.08192
G1 X93.398 Y159.682 E1.06276
G3 X94.98 Y158.098 I1.614 J.03 E.08206
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.71 E1.06249
G3 X161.209 Y193.288 I-1.608 J-.016 E.07612
G1 X161.092 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.021 J-1.224 E.05779
G1 X93.79 Y159.694 E.98368
G3 X94.993 Y158.49 I1.219 J.015 E.05788
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.704 E.98359
M73 P74 R11
G3 X161.311 Y192.868 I-1.215 J-.009 E.04856
G1 X161.067 Y192.902 E.00758
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02288
G1 X159.067 Y192.91 E-.73712
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z9.2 F30000
G1 X95.016 Y194.884 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.026 E.07907
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17222
G1 X163.342 Y157.545 E.12266
G3 X164.182 Y159.629 I-2.395 J2.176 E.0761
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23498
G1 X94.054 Y194.739 E-.15816
G1 X93.858 Y194.671 E-.07894
G1 X93.48 Y194.496 E-.15824
G1 X93.3 Y194.391 E-.07921
G1 X93.19 Y194.316 E-.05047
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z9.2 F30000
G1 X82.643 Y154.506 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.23 J.038 E.1658
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.821 J.029 E.14507
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.662 E.0144
G3 X80.29 Y151.304 I.482 J-2.374 E.10152
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.427 J.021 E.11588
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.662 E-.20074
G1 X81.778 Y153.527 E-.17946
G1 X81.362 Y153.305 E-.17897
G1 X80.996 Y153.004 E-.18008
G1 X80.961 Y152.962 E-.02075
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z9.2 F30000
G1 X95.011 Y195.291 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06406
G3 X92.362 Y157.265 I3.704 J.035 E.08899
G1 X94.315 Y155.291 E.09213
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.357 Y56.712 E3.00671
G3 X177.291 Y60.717 I-.076 J4.009 E.20628
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.268 E.09223
G3 X164.589 Y159.615 I-2.702 J2.457 E.08578
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.37 Y56.305 E3.00738
G3 X177.698 Y60.71 I-.091 J4.418 E.2268
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06029
G3 X164.996 Y159.602 I-3.009 J2.738 E.09545
G1 X164.998 Y191.694 E1.06455
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P74 R10
G1 F6000
M204 S5000
G3 X90.612 Y191.811 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.525 J.052 E.10048
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.383 Y55.913 E2.78633
G3 X178.09 Y60.703 I-.105 J4.811 E.2284
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.283 J6.84 E.03423
G3 X165.388 Y159.589 I-3.39 J2.815 E.09025
G1 X165.39 Y191.698 E.98662
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1991
G1 X94.254 Y196.026 E-.10928
G1 X93.696 Y195.891 E-.21813
G1 X93.425 Y195.797 E-.10909
G1 X93.16 Y195.685 E-.10923
G1 X93.125 Y195.666 E-.01519
; WIPE_END
G1 E-.04 F1800
G1 X93.048 Y188.034 Z9.2 F30000
G1 X92.744 Y158.043 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402377
G1 F10015.124
G1 X92.663 Y158.158 E.00411
G2 X92.2 Y159.719 I2.36 J1.55 E.04839
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.681 I-.067 J-2.802 E.12744
G1 X163.799 Y159.635 E.93866
G2 X162.84 Y157.584 I-2.848 J.082 E.06821
; LINE_WIDTH: 0.428579
G1 F9334.68
G1 X162.582 Y157.356 E.01081
; LINE_WIDTH: 0.477489
G1 F8284.077
G2 X162.251 Y157.1 I-4.121 J4.975 E.01481
; WIPE_START
G1 X162.582 Y157.356 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z9.2 F30000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.41715
G1 F9619.756
G1 X173.535 Y154.892 E.38189
G1 X174.002 Y154.831 E.01437
G1 X174.457 Y154.709 E.01435
G1 X174.892 Y154.529 E.01436
G1 X175.314 Y154.283 E.01489
G2 X176.9 Y151.277 I-2.015 J-2.984 E.10794
G1 X176.9 Y60.723 E2.76144
G1 X176.892 Y60.459 E.00807
G1 X176.831 Y59.997 E.01418
M73 P75 R10
G1 X176.776 Y59.763 E.00735
G1 X176.626 Y59.322 E.01418
G1 X176.526 Y59.103 E.00736
G1 X176.293 Y58.7 E.01417
G1 X176.152 Y58.504 E.00738
G1 X175.845 Y58.154 E.01418
G1 X175.526 Y57.872 E.01301
G1 X175.3 Y57.707 E.00853
G1 X175.095 Y57.579 E.00737
G1 X174.678 Y57.374 E.01416
G1 X174.237 Y57.224 E.01419
G1 X174.003 Y57.169 E.00736
G1 X173.764 Y57.13 E.00738
G1 X173.327 Y57.101 E.01336
G1 X82.723 Y57.1 E2.76295
G1 X82.459 Y57.108 E.00807
G1 X81.998 Y57.169 E.01418
G1 X81.762 Y57.224 E.00738
G1 X81.322 Y57.374 E.01417
G1 X81.102 Y57.474 E.00737
G1 X80.7 Y57.707 E.01417
G1 X80.331 Y57.99 E.01418
G1 X80.142 Y58.167 E.0079
G2 X79.1 Y60.723 I2.58 J2.543 E.08636
G1 X79.1 Y151.277 E2.76144
G1 X79.131 Y151.77 E.01506
G1 X79.224 Y152.238 E.01454
G1 X79.372 Y152.672 E.01399
G1 X79.469 Y152.887 E.00719
G1 X79.717 Y153.314 E.01507
G2 X82.723 Y154.9 I2.984 J-2.014 E.10795
G1 X94.988 Y154.9 E.37401
; WIPE_START
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.11 Y155.264 Z9.2 F30000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X97.738 Y155.264 E.05401
G3 X98.736 Y156.163 I-10.667 J12.847 E.04457
G2 X101.794 Y155.636 I1.262 J-1.809 E.11415
G1 X102.201 Y155.264 E.01829
G1 X104.727 Y155.264 E.08378
G3 X105.725 Y156.163 I-10.663 J12.843 E.04457
G2 X108.782 Y155.636 I1.262 J-1.809 E.11415
G1 X109.189 Y155.264 E.01829
G1 X111.715 Y155.264 E.08378
G3 X112.713 Y156.163 I-10.663 J12.843 E.04457
G2 X115.771 Y155.636 I1.262 J-1.809 E.11414
G1 X116.178 Y155.264 E.01829
G1 X118.703 Y155.264 E.08378
G3 X119.702 Y156.163 I-10.667 J12.847 E.04457
G2 X122.759 Y155.636 I1.262 J-1.809 E.11415
G1 X123.166 Y155.264 E.01829
G1 X125.692 Y155.264 E.08378
G3 X126.69 Y156.163 I-10.663 J12.843 E.04457
G2 X129.747 Y155.636 I1.262 J-1.809 E.11415
G1 X130.155 Y155.264 E.01829
G1 X132.68 Y155.264 E.08378
G3 X133.678 Y156.163 I-10.667 J12.847 E.04457
G2 X136.736 Y155.636 I1.262 J-1.809 E.11415
G1 X137.143 Y155.264 E.01829
G1 X139.669 Y155.264 E.08378
G3 X140.667 Y156.163 I-10.669 J12.849 E.04457
G2 X143.724 Y155.636 I1.262 J-1.809 E.11415
G1 X144.132 Y155.264 E.01829
G1 X146.657 Y155.264 E.08378
G3 X147.655 Y156.163 I-10.667 J12.847 E.04457
G2 X150.713 Y155.636 I1.262 J-1.809 E.11415
G1 X151.12 Y155.264 E.01829
G1 X153.645 Y155.264 E.08378
G3 X154.644 Y156.163 I-10.663 J12.843 E.04457
G2 X157.701 Y155.636 I1.262 J-1.809 E.11415
G1 X158.108 Y155.264 E.01829
G1 X159.737 Y155.264 E.05401
; WIPE_START
G1 X158.108 Y155.264 E-.61876
G1 X157.834 Y155.515 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X150.204 Y155.731 Z9.2 F30000
G1 X93.879 Y157.324 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405815
G1 F9920.246
G1 X93.612 Y157.255 E.00816
; LINE_WIDTH: 0.441084
G1 F9041.505
G1 X93.587 Y157.249 E.00085
; LINE_WIDTH: 0.472488
G1 F8380.51
G1 X93.561 Y157.244 E.00091
G1 X93.398 Y157.374 E.00732
; LINE_WIDTH: 0.410454
G1 F9795.029
G2 X92.744 Y158.043 I2.384 J2.983 E.02808
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9795.029
G1 X93.007 Y157.735 E-.32856
G1 X93.398 Y157.374 E-.43144
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/60
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z9.2 I-.581 J1.07 P1  F30000
G1 X161.086 Y194.114 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00132
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.414 E.12287
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.434 J.065 E.12261
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.052 J2.422 E.12277
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.1138
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.032 J-2.008 E.10252
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.024 J.048 E.10231
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.038 J2.014 E.10244
G1 X163.009 Y191.733 E1.0637
G3 X161.262 Y193.692 I-2.015 J-.039 E.0948
G1 X161.119 Y193.703 E.00475
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.02 J-1.602 E.08217
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.614 J.031 E.08201
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.607 E.0821
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.093 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E.00001
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.032 J-1.235 E.05766
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.219 J.016 E.05786
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.012 J1.215 E.05792
G1 X162.21 Y191.707 E.9837
G3 X161.313 Y192.868 I-1.215 J-.012 E.04839
G1 X161.067 Y192.902 E.00764
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02287
G1 X159.067 Y192.91 E-.73714
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z9.4 F30000
G1 X95.016 Y194.884 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.026 E.07907
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17223
G1 X163.342 Y157.545 E.12266
G3 X164.182 Y159.624 I-2.387 J2.173 E.07594
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23501
G1 X94.054 Y194.739 E-.15813
G1 X93.858 Y194.671 E-.07906
G1 X93.48 Y194.496 E-.15821
G1 X93.3 Y194.391 E-.07924
G1 X93.193 Y194.313 E-.05036
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z9.4 F30000
G1 X82.643 Y154.506 Z9.4
G1 Z9
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.479 E.01202
G3 X79.491 Y151.317 I.439 J-3.2 E.15245
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.23 J.038 E.16581
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.23 J-.038 E.16581
G1 X82.703 Y154.509 E3.00583
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.045 E.0168
G3 X79.898 Y151.31 I.565 J-2.764 E.12717
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.821 J.029 E.14508
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.821 J-.029 E.14507
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.661 E.01439
G3 X80.29 Y151.304 I.486 J-2.378 E.10146
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.427 J.02 E.11589
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.427 J-.02 E.11589
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.661 E-.20071
G1 X81.778 Y153.527 E-.17942
G1 X81.362 Y153.305 E-.17902
G1 X80.997 Y153.005 E-.17952
G1 X80.961 Y152.962 E-.02133
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z9.4 F30000
G1 X95.011 Y195.291 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.351 Y56.711 E3.00653
G3 X177.291 Y60.717 I-.055 J3.994 E.20668
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.268 E.09223
G3 X164.589 Y159.612 I-2.688 J2.452 E.08567
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.122 J.044 E.09891
G1 X93.34 Y155.698 E.06022
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.365 Y56.305 E3.0072
G3 X177.698 Y60.71 I-.068 J4.401 E.22722
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06028
G3 X164.996 Y159.6 I-2.988 J2.73 E.09541
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.052 E.10048
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.378 Y55.913 E2.78617
G3 X178.09 Y60.703 I-.081 J4.793 E.22881
G1 X178.09 Y151.297 E2.78368
M73 P76 R10
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.289 J6.847 E.03422
G3 X165.388 Y159.588 I-3.579 J2.887 E.09009
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1992
G1 X94.254 Y196.026 E-.10921
G1 X93.696 Y195.891 E-.21813
G1 X93.425 Y195.797 E-.1091
G1 X93.128 Y195.66 E-.12437
; WIPE_END
G1 E-.04 F1800
G1 X93.135 Y188.027 Z9.4 F30000
G1 X93.167 Y157.579 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42914
G1 F9321.131
G3 X93.418 Y157.357 I4.676 J5.035 E.01055
; LINE_WIDTH: 0.476335
G1 F8306.126
G3 X93.742 Y157.106 I3.981 J4.801 E.01447
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402377
G1 F10015.127
G1 X93.007 Y157.734 E.00653
G2 X92.2 Y159.72 I2.006 J1.973 E.0644
G1 X92.201 Y191.765 E.93864
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.68 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.837 Y157.581 I-2.844 J.08 E.06832
; LINE_WIDTH: 0.428798
G1 F9329.377
G1 X162.582 Y157.357 E.01068
; LINE_WIDTH: 0.476347
G1 F8305.897
G2 X162.258 Y157.106 I-4.024 J4.857 E.01447
G1 X161.155 Y156.942 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X161.843 Y157.074 I-.125 J2.517 E.02333
G1 X162.081 Y156.765 E.01292
G3 X160.453 Y155.264 I43.934 J-49.283 E.07345
G1 X157.89 Y155.264 E.08503
G2 X157.264 Y155.884 I3.006 J3.661 E.02926
G3 X154.644 Y156.351 I-1.611 J-1.455 E.09505
G2 X153.465 Y155.264 I-125.782 J135.237 E.05318
G1 X150.902 Y155.264 E.08503
G2 X150.276 Y155.884 I3.005 J3.659 E.02926
G3 X147.655 Y156.351 I-1.611 J-1.455 E.09505
G2 X146.477 Y155.264 I-125.782 J135.237 E.05318
G1 X143.913 Y155.264 E.08503
G2 X143.287 Y155.884 I3.006 J3.661 E.02926
G3 X140.667 Y156.351 I-1.611 J-1.455 E.09505
G2 X139.488 Y155.264 I-126.278 J135.774 E.05318
G1 X136.925 Y155.264 E.08503
G2 X136.299 Y155.884 I3.005 J3.659 E.02926
G3 X133.678 Y156.351 I-1.611 J-1.455 E.09505
G2 X132.5 Y155.264 I-125.782 J135.237 E.05318
G1 X129.936 Y155.264 E.08503
G2 X129.311 Y155.884 I3.006 J3.661 E.02926
G3 X126.69 Y156.351 I-1.611 J-1.455 E.09505
G2 X125.511 Y155.264 I-125.782 J135.237 E.05318
G1 X122.948 Y155.264 E.08503
G2 X122.322 Y155.884 I3.006 J3.661 E.02926
G3 X119.702 Y156.351 I-1.611 J-1.455 E.09505
G2 X118.523 Y155.264 I-125.782 J135.237 E.05318
G1 X115.96 Y155.264 E.08503
G2 X115.334 Y155.884 I3.005 J3.659 E.02926
G3 X112.713 Y156.351 I-1.611 J-1.455 E.09505
G2 X111.535 Y155.264 I-125.782 J135.237 E.05318
G1 X108.971 Y155.264 E.08503
G2 X108.345 Y155.884 I3.006 J3.661 E.02926
G3 X105.725 Y156.351 I-1.611 J-1.455 E.09505
G2 X104.546 Y155.264 I-125.782 J135.237 E.05318
G1 X101.983 Y155.264 E.08503
G2 X101.357 Y155.884 I3.005 J3.659 E.02926
G3 X98.736 Y156.351 I-1.611 J-1.455 E.09505
G2 X97.558 Y155.264 I-125.782 J135.237 E.05318
G1 X95.929 Y155.264 E.05401
; WIPE_START
G1 X97.558 Y155.264 E-.61876
G1 X97.831 Y155.516 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X94.988 Y154.9 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417175
G1 F9619.116
G1 X82.723 Y154.9 E.37403
G3 X79.716 Y153.314 I-.022 J-3.6 E.10797
G1 X79.469 Y152.887 E.01506
G1 X79.372 Y152.672 E.00718
G1 X79.224 Y152.237 E.01399
G1 X79.131 Y151.77 E.01454
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.76162
G3 X80.143 Y58.167 I3.623 J-.013 E.08639
G1 X80.331 Y57.99 E.00788
G1 X80.7 Y57.707 E.01418
G1 X80.905 Y57.579 E.00737
G1 X81.322 Y57.374 E.01417
G1 X81.763 Y57.224 E.01419
G1 X81.998 Y57.169 E.00736
G1 X82.459 Y57.108 E.01418
G1 X82.723 Y57.1 E.00807
G1 X173.32 Y57.101 E2.76295
G3 X176.827 Y59.981 I-.018 J3.598 E.14975
G1 X176.892 Y60.459 E.01469
G1 X176.9 Y60.723 E.00807
G1 X176.9 Y151.277 E2.76162
G3 X175.857 Y153.834 I-3.623 J.013 E.08639
G1 X175.486 Y154.16 E.01506
G1 X175.105 Y154.414 E.01397
G1 X174.886 Y154.531 E.00758
G1 X174.463 Y154.707 E.01398
G1 X174.232 Y154.777 E.00736
G1 X173.964 Y154.837 E.00837
G1 X173.535 Y154.892 E.01318
G1 X161.012 Y154.9 E.38191
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9619.116
G1 X163.012 Y154.899 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/60
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z9.4 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00132
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.044 J-2.414 E.12288
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.434 J.064 E.12261
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.071 J2.44 E.12253
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.1138
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.032 J-2.008 E.10253
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.024 J.048 E.10231
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.054 J2.03 E.10224
G1 X163.009 Y191.733 E1.0637
G3 X161.262 Y193.692 I-2.015 J-.039 E.0948
G1 X161.119 Y193.703 E.00476
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.019 J-1.602 E.08217
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.613 J.031 E.08202
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.037 J1.619 E.08194
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.093 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X161.007 Y192.91 E0
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.032 J-1.235 E.05766
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.218 J.015 E.05787
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.313 Y192.868 I-1.215 J-.012 E.04839
G1 X161.067 Y192.902 E.00764
; WIPE_START
M204 S10000
G1 X161.007 Y192.91 E-.02285
G1 X159.067 Y192.91 E-.73715
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.145 Z9.6 F30000
G1 X95.016 Y194.884 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.026 E.07907
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.545 E.12267
G3 X164.182 Y159.624 I-2.387 J2.173 E.07593
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23501
G1 X94.055 Y194.739 E-.15805
G1 X93.858 Y194.671 E-.07918
G1 X93.479 Y194.496 E-.15834
G1 X93.3 Y194.391 E-.07887
G1 X93.19 Y194.316 E-.05054
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z9.6 F30000
G1 X82.643 Y154.506 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.479 E.01202
G3 X79.491 Y151.317 I.439 J-3.2 E.15245
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.23 J.037 E.16581
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.657 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.045 E.0168
G3 X79.898 Y151.31 I.565 J-2.764 E.12717
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.821 J.029 E.14508
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X82.23 Y153.661 E.0144
G3 X80.29 Y151.304 I.486 J-2.377 E.10147
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.426 J.02 E.11589
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.661 E-.20073
G1 X81.778 Y153.527 E-.17944
G1 X81.362 Y153.305 E-.17903
G1 X80.997 Y153.005 E-.17952
G1 X80.961 Y152.962 E-.02128
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z9.6 F30000
G1 X95.011 Y195.291 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.346 Y56.711 E3.00635
G3 X177.291 Y60.717 I-.063 J4.008 E.20667
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
M73 P76 R9
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.612 I-2.688 J2.451 E.08566
M73 P77 R9
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.122 J.043 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.359 Y56.304 E3.00702
G3 X177.698 Y60.71 I-.078 J4.415 E.2272
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.6 I-2.988 J2.73 E.0954
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.051 E.10048
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.372 Y55.912 E2.786
G3 X178.09 Y60.703 I-.075 J4.792 E.22899
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.284 J6.841 E.03422
G3 X165.388 Y159.589 I-3.579 J2.887 E.09009
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1992
G1 X94.254 Y196.026 E-.10917
G1 X93.696 Y195.891 E-.21812
G1 X93.425 Y195.797 E-.10911
G1 X93.16 Y195.685 E-.10917
G1 X93.125 Y195.666 E-.01523
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z9.6 F30000
G1 X93.167 Y157.579 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429102
G1 F9322.037
G3 X93.418 Y157.357 I4.545 J4.887 E.01056
; LINE_WIDTH: 0.47638
G1 F8305.278
G3 X93.742 Y157.106 I4.028 J4.862 E.01448
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.40239
G1 F10014.741
G1 X93.008 Y157.734 E.00651
G2 X92.2 Y159.719 I2.005 J1.973 E.06441
G1 X92.201 Y191.765 E.93869
G2 X95.02 Y194.5 I2.808 J-.074 E.12739
G1 X161.065 Y194.499 E1.93462
G2 X163.8 Y191.68 I-.068 J-2.802 E.12746
G1 X163.799 Y159.635 E.93869
G2 X162.725 Y157.48 I-2.864 J.083 E.07279
; LINE_WIDTH: 0.44309
G1 F8996.184
G2 X162.54 Y157.323 I-3.283 J3.677 E.0079
; LINE_WIDTH: 0.481565
G1 F8207.094
G1 X162.257 Y157.105 E.01276
G1 X160.721 Y156.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X161.842 Y157.073 I.044 J4.275 E.03759
G1 X162.08 Y156.764 E.01294
G2 X161.632 Y156.573 I-.407 J.332 E.01682
G3 X160.337 Y155.264 I3.854 J-5.108 E.06127
G1 X157.633 Y155.264 E.08972
G1 X156.827 Y156.154 E.0398
G3 X155.954 Y156.624 I-1.564 J-1.86 E.03314
G1 X155.08 Y156.712 E.02912
G1 X154.644 Y156.573 E.0152
G3 X153.349 Y155.264 I3.854 J-5.108 E.06127
G1 X150.644 Y155.264 E.08972
G1 X149.839 Y156.154 E.0398
G3 X148.965 Y156.624 I-1.564 J-1.86 E.03314
G1 X148.092 Y156.712 E.02912
G1 X147.655 Y156.573 E.0152
G3 X146.361 Y155.264 I3.854 J-5.108 E.06127
G1 X143.656 Y155.264 E.08972
G1 X142.851 Y156.154 E.0398
G3 X141.977 Y156.624 I-1.564 J-1.86 E.03314
G1 X141.104 Y156.712 E.02912
G1 X140.667 Y156.573 E.0152
G3 X139.372 Y155.264 I3.854 J-5.108 E.06127
G1 X136.668 Y155.264 E.08972
G1 X135.862 Y156.154 E.0398
G3 X134.989 Y156.624 I-1.564 J-1.86 E.03314
G1 X134.115 Y156.712 E.02912
G1 X133.678 Y156.573 E.0152
G3 X132.384 Y155.264 I3.854 J-5.108 E.06127
G1 X129.679 Y155.264 E.08972
G1 X128.874 Y156.154 E.0398
G3 X128 Y156.624 I-1.564 J-1.86 E.03314
G1 X127.127 Y156.712 E.02912
G1 X126.69 Y156.573 E.0152
G3 X125.395 Y155.264 I3.854 J-5.108 E.06127
G1 X122.691 Y155.264 E.08972
G1 X121.885 Y156.154 E.0398
G3 X121.012 Y156.624 I-1.564 J-1.86 E.03314
G1 X120.138 Y156.712 E.02912
G1 X119.702 Y156.573 E.0152
G3 X118.407 Y155.264 I3.854 J-5.108 E.06127
G1 X115.702 Y155.264 E.08972
G1 X114.897 Y156.154 E.0398
G3 X114.023 Y156.624 I-1.564 J-1.86 E.03314
G1 X113.15 Y156.712 E.02912
G1 X112.713 Y156.573 E.0152
G3 X111.419 Y155.264 I3.854 J-5.108 E.06127
G1 X108.714 Y155.264 E.08972
G1 X107.909 Y156.154 E.0398
G3 X107.035 Y156.624 I-1.564 J-1.86 E.03314
G1 X106.162 Y156.712 E.02912
G1 X105.725 Y156.573 E.0152
G3 X104.43 Y155.264 I3.854 J-5.108 E.06127
G1 X101.726 Y155.264 E.08972
G1 X100.92 Y156.154 E.0398
G3 X100.047 Y156.624 I-1.564 J-1.86 E.03314
G1 X99.173 Y156.712 E.02912
G1 X98.736 Y156.573 E.0152
G3 X97.442 Y155.264 I3.854 J-5.108 E.06127
G1 X95.813 Y155.264 E.05401
G1 X94.988 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.4172
G1 F9618.478
G1 X82.723 Y154.9 E.37406
G3 X79.38 Y152.692 I-.015 J-3.612 E.1295
G1 X79.289 Y152.451 E.00786
G1 X79.169 Y152.002 E.01418
G1 X79.108 Y151.541 E.01418
G1 X79.1 Y151.277 E.00807
G1 X79.1 Y60.723 E2.76181
G3 X80.686 Y57.716 I3.6 J-.023 E.10799
G1 X81.113 Y57.469 E.01505
G1 X81.537 Y57.293 E.01398
G1 X81.763 Y57.224 E.0072
G1 X82.23 Y57.131 E.01454
G1 X82.723 Y57.1 E.01506
G1 X173.32 Y57.101 E2.76314
G3 X175.094 Y57.579 I-.03 J3.64 E.05665
G1 X175.492 Y57.844 E.01456
G1 X175.846 Y58.154 E.01436
G1 X176.156 Y58.509 E.01436
G1 X176.418 Y58.9 E.01437
G1 X176.626 Y59.322 E.01435
G1 X176.777 Y59.769 E.01438
G1 X176.869 Y60.23 E.01436
G1 X176.899 Y60.68 E.01374
G1 X176.9 Y151.277 E2.76313
G1 X176.869 Y151.77 E.01506
G1 X176.776 Y152.237 E.01455
G1 X176.628 Y152.672 E.01399
G1 X176.531 Y152.887 E.00719
G1 X176.293 Y153.3 E.01455
G1 X176.003 Y153.678 E.01454
G1 X175.841 Y153.85 E.0072
G1 X175.496 Y154.152 E.01399
G1 X175.1 Y154.418 E.01454
G1 X174.672 Y154.628 E.01454
G1 X174.237 Y154.776 E.014
G1 X174.002 Y154.831 E.00737
G1 X173.541 Y154.892 E.01418
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37406
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9618.478
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/60
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z9.6 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.044 J-2.414 E.12287
G1 X92.584 Y159.656 E1.06448
G3 X94.954 Y157.284 I2.434 J.061 E.12271
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.045 J2.415 E.12287
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.1138
G1 X161.146 Y194.109 E.00565
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.032 J-2.008 E.10252
G1 X92.991 Y159.669 E1.06363
G3 X94.967 Y157.691 I2.024 J.045 E.10238
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.056 J2.032 E.10221
G1 X163.009 Y191.733 E1.06369
G3 X161.262 Y193.692 I-2.015 J-.039 E.0948
G1 X161.119 Y193.703 E.00476
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.019 J-1.602 E.08217
G1 X93.398 Y159.681 E1.06277
G3 X94.98 Y158.098 I1.613 J.03 E.08206
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.038 J1.62 E.08193
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.07579
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.032 J-1.235 E.05766
G1 X93.79 Y159.693 E.98369
G3 X94.993 Y158.49 I1.218 J.015 E.05788
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z9.8 F30000
G1 X95.016 Y194.884 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.66 Y157.543 I3.287 J.027 E.07904
G1 X95.258 Y154.916 E.12254
G1 X160.742 Y154.916 E2.17223
G1 X163.341 Y157.544 E.12261
G3 X164.182 Y159.624 I-2.386 J2.174 E.07598
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.2349
G1 X94.255 Y194.794 E-.0791
G1 X93.858 Y194.671 E-.15824
G1 X93.48 Y194.496 E-.15824
G1 X93.3 Y194.391 E-.0791
G1 X93.193 Y194.313 E-.05042
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z9.8 F30000
G1 X82.643 Y154.506 Z9.8
M73 P78 R9
G1 Z9.4
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.48 E.01202
G3 X79.491 Y151.317 I.434 J-3.196 E.15251
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.229 J.037 E.16582
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12724
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.82 J.028 E.14508
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.426 J.02 E.11589
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20086
G1 X81.778 Y153.527 E-.1796
G1 X81.362 Y153.305 E-.17903
G1 X80.996 Y153.004 E-.17997
G1 X80.962 Y152.962 E-.02054
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z9.8 F30000
G1 X95.011 Y195.291 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.361 Y157.266 I3.705 J.035 E.08897
G1 X94.315 Y155.291 E.09215
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.357 Y56.712 E3.00671
G3 X177.291 Y60.716 I-.076 J4.009 E.20628
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38473
G1 X163.64 Y157.267 E.0922
G3 X164.589 Y159.612 I-2.687 J2.452 E.0857
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.043 E.0989
G1 X93.34 Y155.698 E.06024
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.364 Y56.304 E3.00716
G3 X177.698 Y60.71 I-.085 J4.418 E.22702
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35261
G1 X163.938 Y156.99 E.06027
G3 X164.996 Y159.6 I-2.988 J2.73 E.09542
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.723 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.37 Y55.912 E2.78593
G3 X178.09 Y60.703 I-.073 J4.793 E.22905
G1 X178.09 Y151.297 E2.78368
G3 X177.812 Y152.902 I-5.535 J-.131 E.05025
G3 X173.297 Y156.09 I-4.544 J-1.644 E.18081
G1 X163.6 Y156.09 E.29796
G3 X164.382 Y156.902 I-6.169 J6.727 E.03466
G3 X165.388 Y159.589 I-3.59 J2.876 E.08965
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19909
G1 X94.254 Y196.026 E-.1093
G1 X93.696 Y195.891 E-.21805
G1 X93.425 Y195.797 E-.1092
G1 X93.16 Y195.685 E-.10922
G1 X93.125 Y195.666 E-.01514
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z9.8 F30000
G1 X93.167 Y157.579 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429154
G1 F9320.776
G3 X93.418 Y157.357 I4.625 J4.979 E.01055
; LINE_WIDTH: 0.476408
G1 F8304.741
G3 X93.742 Y157.106 I4.036 J4.872 E.01447
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402377
G1 F10015.123
G1 X93.008 Y157.733 E.00649
G2 X92.2 Y159.719 I2.008 J1.975 E.06443
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93455
G2 X163.8 Y191.681 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.84 Y157.584 I-2.832 J.074 E.06822
; LINE_WIDTH: 0.428561
G1 F9335.104
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.476502
G1 F8302.927
G2 X162.258 Y157.105 I-4.012 J4.84 E.0145
G1 X161.051 Y155.723 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X162.081 Y156.765 E.04857
G1 X161.98 Y156.894 E.00544
G1 X161.632 Y156.858 E.01162
G1 X161.195 Y156.533 E.01806
G1 X160.245 Y155.264 E.05258
G1 X157.413 Y155.264 E.09392
G1 X156.827 Y156.071 E.03307
G3 X155.08 Y156.904 I-2.063 J-2.079 E.06543
G1 X154.644 Y156.858 E.01457
G1 X154.207 Y156.533 E.01806
G1 X153.256 Y155.264 E.05258
G1 X150.425 Y155.264 E.09392
G1 X149.839 Y156.071 E.03307
G3 X148.092 Y156.904 I-2.063 J-2.079 E.06543
G1 X147.655 Y156.858 E.01457
G1 X147.218 Y156.533 E.01806
G1 X146.268 Y155.264 E.05258
G1 X143.436 Y155.264 E.09392
G1 X142.851 Y156.071 E.03307
M73 P79 R9
G3 X141.104 Y156.904 I-2.063 J-2.079 E.06543
G1 X140.667 Y156.858 E.01457
G1 X140.23 Y156.533 E.01806
G1 X139.279 Y155.264 E.05258
G1 X136.448 Y155.264 E.09392
G1 X135.862 Y156.071 E.03307
G3 X134.115 Y156.904 I-2.063 J-2.079 E.06543
G1 X133.678 Y156.858 E.01457
G1 X133.242 Y156.533 E.01806
G1 X132.291 Y155.264 E.05258
G1 X129.46 Y155.264 E.09392
G1 X128.874 Y156.071 E.03307
G3 X127.127 Y156.904 I-2.063 J-2.079 E.06543
G1 X126.69 Y156.858 E.01457
G1 X126.253 Y156.533 E.01806
G1 X125.303 Y155.264 E.05258
G1 X122.471 Y155.264 E.09392
G1 X121.885 Y156.071 E.03307
G3 X120.138 Y156.904 I-2.063 J-2.079 E.06543
G1 X119.702 Y156.858 E.01457
G1 X119.265 Y156.533 E.01806
G1 X118.314 Y155.264 E.05258
G1 X115.483 Y155.264 E.09392
G1 X114.897 Y156.071 E.03307
G3 X113.15 Y156.904 I-2.063 J-2.079 E.06543
G1 X112.713 Y156.858 E.01457
G1 X112.276 Y156.533 E.01806
G1 X111.326 Y155.264 E.05258
G1 X108.494 Y155.264 E.09392
G1 X107.909 Y156.071 E.03307
G3 X106.162 Y156.904 I-2.063 J-2.079 E.06543
G1 X105.725 Y156.858 E.01457
G1 X105.288 Y156.533 E.01806
G1 X104.337 Y155.264 E.05258
G1 X101.506 Y155.264 E.09392
G1 X100.92 Y156.071 E.03307
G3 X99.173 Y156.904 I-2.063 J-2.079 E.06543
G1 X98.736 Y156.858 E.01457
G1 X98.3 Y156.533 E.01806
G1 X97.349 Y155.264 E.05258
G1 X95.721 Y155.264 E.05401
G1 X94.988 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417136
G1 F9620.12
G1 X82.723 Y154.9 E.37399
G3 X79.38 Y152.692 I-.015 J-3.612 E.12949
G1 X79.289 Y152.451 E.00784
G1 X79.169 Y152.002 E.01418
G1 X79.108 Y151.541 E.01418
G1 X79.1 Y151.277 E.00807
G1 X79.1 Y60.723 E2.76134
G3 X81.308 Y57.38 I3.612 J-.015 E.1295
G1 X81.548 Y57.289 E.00783
G1 X81.998 Y57.169 E.01418
G1 X82.459 Y57.108 E.01418
G1 X82.723 Y57.1 E.00807
G1 X173.32 Y57.101 E2.76266
G3 X176.152 Y58.504 I-.025 J3.611 E.09973
G1 X176.421 Y58.906 E.01474
G1 X176.623 Y59.317 E.01398
G1 X176.709 Y59.543 E.00737
G1 X176.779 Y59.774 E.00737
G1 X176.868 Y60.224 E.01399
G1 X176.9 Y60.723 E.01524
G1 X176.9 Y151.277 E2.76134
G3 X173.776 Y154.868 I-3.606 J.018 E.15853
G1 X173.277 Y154.9 E.01524
G1 X161.013 Y154.9 E.37399
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9620.12
G1 X163.013 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/60
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z9.8 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.414 E.12287
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.415 J.045 E.12286
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.056 J-2.032 E.1022
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.032 J.056 E.10221
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.0637
G3 X161.262 Y193.692 I-2.015 J-.039 E.09481
G1 X161.119 Y193.703 E.00475
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.038 J-1.621 E.08192
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.62 J.038 E.08193
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.0821
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.021 J-1.224 E.05779
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z10 F30000
G1 X95.016 Y194.884 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06353
G3 X92.66 Y157.543 I3.287 J.027 E.07904
G1 X95.258 Y154.916 E.12254
G1 X160.742 Y154.916 E2.17224
G1 X163.343 Y157.546 E.12267
G3 X164.182 Y159.629 I-2.386 J2.172 E.0761
G1 X164.184 Y191.685 E1.06335
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23487
G1 X94.054 Y194.739 E-.15829
G1 X93.858 Y194.671 E-.07905
G1 X93.48 Y194.496 E-.15821
G1 X93.3 Y194.391 E-.07914
G1 X93.19 Y194.316 E-.05044
; WIPE_END
G1 E-.04 F1800
M73 P79 R8
G1 X91.236 Y186.938 Z10 F30000
G1 X82.643 Y154.506 Z10
G1 Z9.6
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.0168
G3 X79.898 Y151.31 I.56 J-2.76 E.12724
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20086
G1 X81.779 Y153.527 E-.17914
G1 X81.361 Y153.304 E-.17998
G1 X80.996 Y153.004 E-.17948
G1 X80.962 Y152.963 E-.02054
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z10 F30000
G1 X95.011 Y195.291 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.361 Y157.266 I3.705 J.035 E.08897
G1 X94.315 Y155.291 E.09215
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.352 Y56.711 E3.00653
G3 X177.291 Y60.717 I-.055 J3.994 E.20668
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38473
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.616 I-2.687 J2.451 E.08578
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.09889
G1 X93.34 Y155.698 E.06024
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.358 Y56.304 E3.00698
G3 X177.698 Y60.71 I-.062 J4.401 E.22744
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35261
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.723 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.365 Y55.912 E2.78577
G3 X178.09 Y60.703 I-.087 J4.812 E.22897
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.89 I-6.292 J6.849 E.03421
G3 X165.388 Y159.589 I-3.579 J2.887 E.09012
G1 X165.39 Y191.698 E.98661
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1992
G1 X94.254 Y196.026 E-.10904
G1 X93.696 Y195.891 E-.21826
G1 X93.425 Y195.797 E-.10912
G1 X93.16 Y195.685 E-.10916
G1 X93.125 Y195.666 E-.01521
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z10 F30000
G1 X93.167 Y157.579 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428919
G1 F9326.465
G3 X93.416 Y157.359 I4.67 J5.032 E.01045
; LINE_WIDTH: 0.476023
G1 F8312.12
M73 P80 R8
G3 X93.742 Y157.105 I4.189 J5.047 E.01458
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402376
G1 F10015.154
G1 X92.994 Y157.748 E.0071
G2 X92.2 Y159.719 I2.026 J1.961 E.06382
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.68 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93864
G2 X162.84 Y157.584 I-2.842 J.079 E.06821
; LINE_WIDTH: 0.42854
G1 F9335.623
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.477442
G1 F8284.97
G2 X162.251 Y157.1 I-4.072 J4.912 E.01481
; WIPE_START
G1 X162.582 Y157.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.013 Y154.9 Z10 F30000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.417164
G1 F9619.413
G1 X173.535 Y154.892 E.38189
G1 X174.002 Y154.831 E.01436
G1 X174.457 Y154.709 E.01436
G1 X174.892 Y154.529 E.01436
G1 X175.313 Y154.285 E.01482
G2 X176.9 Y151.277 I-2.013 J-2.985 E.10802
G1 X176.9 Y60.723 E2.76154
G1 X176.892 Y60.459 E.00807
G1 X176.828 Y59.983 E.01464
G2 X173.32 Y57.101 I-3.526 J.716 E.14979
G1 X82.723 Y57.1 E2.76287
G1 X82.459 Y57.108 E.00806
G1 X81.998 Y57.169 E.01419
G1 X81.548 Y57.289 E.01418
G1 X81.309 Y57.38 E.00782
G2 X79.1 Y60.723 I1.401 J3.326 E.12954
G1 X79.1 Y151.277 E2.76154
G1 X79.108 Y151.541 E.00807
G1 X79.169 Y152.002 E.01418
G1 X79.289 Y152.451 E.01417
G1 X79.38 Y152.691 E.00783
G2 X82.723 Y154.9 I3.326 J-1.401 E.12954
G1 X94.988 Y154.9 E.37402
G1 X95.664 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X97.293 Y155.264 E.05401
G1 X97.426 Y155.406 E.00645
G3 X98.171 Y156.936 I-5.942 J3.841 E.05658
G1 X99.646 Y156.936 E.04892
G2 X101.33 Y155.264 I-1.008 J-2.7 E.0811
G1 X104.281 Y155.264 E.09791
G1 X104.414 Y155.406 E.00645
G3 X105.16 Y156.936 I-5.941 J3.841 E.05658
G1 X106.634 Y156.936 E.04892
G2 X108.318 Y155.264 I-1.008 J-2.699 E.0811
G1 X111.269 Y155.264 E.09791
G1 X111.403 Y155.406 E.00645
G3 X112.148 Y156.936 I-5.94 J3.841 E.05658
G1 X113.623 Y156.936 E.04892
G2 X115.306 Y155.264 I-1.008 J-2.7 E.0811
G1 X118.258 Y155.264 E.09791
G1 X118.391 Y155.406 E.00645
G3 X119.136 Y156.936 I-5.942 J3.841 E.05658
G1 X120.611 Y156.936 E.04892
G2 X122.295 Y155.264 I-1.008 J-2.699 E.0811
G1 X125.246 Y155.264 E.09791
G1 X125.38 Y155.406 E.00645
G3 X126.125 Y156.936 I-5.94 J3.841 E.05658
G1 X127.6 Y156.936 E.04892
G2 X129.283 Y155.264 I-1.008 J-2.7 E.0811
G1 X132.235 Y155.264 E.09791
G1 X132.368 Y155.406 E.00645
G3 X133.113 Y156.936 I-5.942 J3.841 E.05658
G1 X134.588 Y156.936 E.04892
G2 X136.272 Y155.264 I-1.008 J-2.7 E.0811
G1 X139.223 Y155.264 E.09791
G1 X139.356 Y155.406 E.00645
G3 X140.102 Y156.936 I-5.94 J3.841 E.05658
G1 X141.576 Y156.936 E.04892
G2 X143.26 Y155.264 I-1.008 J-2.699 E.0811
G1 X146.211 Y155.264 E.09791
G1 X146.345 Y155.406 E.00645
G3 X147.09 Y156.936 I-5.942 J3.841 E.05658
G1 X148.565 Y156.936 E.04892
G2 X150.248 Y155.264 I-1.008 J-2.7 E.0811
G1 X153.2 Y155.264 E.09791
G1 X153.333 Y155.406 E.00645
G3 X154.079 Y156.936 I-5.941 J3.841 E.05658
G1 X155.553 Y156.936 E.04892
G2 X157.237 Y155.264 I-1.008 J-2.699 E.0811
G1 X160.188 Y155.264 E.09791
G1 X160.322 Y155.406 E.00645
G3 X161.067 Y156.936 I-5.943 J3.842 E.0566
G2 X159.439 Y156.936 I-.819 J12.37 E.05405
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X161.067 Y156.936 E-.61875
G1 X160.926 Y156.592 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/60
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z10 I-1.217 J.005 P1  F30000
G1 X161.086 Y194.114 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X161.046 Y194.116 E.00132
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12277
G1 X92.584 Y159.654 E1.06457
G3 X94.954 Y157.284 I2.415 J.045 E.12286
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.045 J2.415 E.12287
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10244
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.032 J.056 E.10221
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.056 J2.032 E.1022
G1 X163.009 Y191.733 E1.0637
G3 X161.262 Y193.692 I-2.015 J-.039 E.0948
G1 X161.119 Y193.703 E.00476
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19066
G3 X93.398 Y191.719 I.025 J-1.608 E.0821
G1 X93.398 Y159.68 E1.0628
G3 X94.98 Y158.098 I1.62 J.038 E.08193
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.038 J1.621 E.08192
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.98369
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z10.2 F30000
G1 X95.016 Y194.884 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.026 E.07907
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17223
G1 X163.342 Y157.545 E.12264
G3 X164.182 Y159.624 I-2.477 J2.21 E.07587
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.2349
G1 X94.055 Y194.739 E-.15815
G1 X93.858 Y194.67 E-.07931
G1 X93.48 Y194.496 E-.15817
G1 X93.3 Y194.391 E-.07908
G1 X93.193 Y194.313 E-.0504
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z10.2 F30000
G1 X82.643 Y154.506 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01202
G3 X79.491 Y151.317 I.438 J-3.199 E.15246
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.045 E.0168
G3 X79.898 Y151.31 I.564 J-2.763 E.12718
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.019 J-2.426 E.1159
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.778 Y153.527 E-.17952
G1 X81.361 Y153.304 E-.17956
G1 X80.997 Y153.005 E-.1791
G1 X80.962 Y152.962 E-.02092
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z10.2 F30000
G1 X95.011 Y195.291 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I-.01 J-3.997 E.20895
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.346 Y56.711 E3.00635
G3 X177.291 Y60.716 I-.05 J3.994 E.20686
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.267 E.09222
G3 X164.589 Y159.612 I-2.789 J2.493 E.08558
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.09891
G1 X93.339 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.353 Y56.304 E3.0068
M73 P81 R8
G3 X177.698 Y60.71 I-.056 J4.401 E.22762
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06029
G3 X164.996 Y159.6 I-3.101 J2.776 E.09529
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.359 Y55.912 E2.7856
G3 X178.09 Y60.703 I-.063 J4.793 E.22938
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.38 Y156.9 I-6.175 J6.734 E.0346
G3 X165.388 Y159.589 I-3.422 J2.815 E.08984
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.1992
G1 X94.254 Y196.026 E-.10908
G1 X93.696 Y195.891 E-.21818
G1 X93.425 Y195.797 E-.10921
G1 X93.16 Y195.685 E-.10908
G1 X93.125 Y195.666 E-.01525
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z10.2 F30000
G1 X93.167 Y157.579 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429145
G1 F9321.008
G3 X93.418 Y157.357 I4.591 J4.939 E.01055
; LINE_WIDTH: 0.476376
G1 F8305.353
G3 X93.742 Y157.106 I3.993 J4.816 E.01447
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402376
G1 F10015.131
G1 X92.994 Y157.748 E.00709
G2 X92.2 Y159.719 I2.025 J1.961 E.06382
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.802 J-.067 E.12746
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.68 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.84 Y157.584 I-2.831 J.074 E.06821
; LINE_WIDTH: 0.428495
G1 F9336.717
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.476348
G1 F8305.88
G2 X162.258 Y157.106 I-4.027 J4.86 E.01447
; WIPE_START
G1 X162.582 Y157.357 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z10.2 F30000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.417187
G1 F9618.804
G1 X173.277 Y154.9 E.37405
G1 X173.541 Y154.892 E.00807
G1 X174.017 Y154.828 E.01462
G2 X176.9 Y151.277 I-.717 J-3.528 E.15116
G1 X176.9 Y60.723 E2.76171
G1 X176.892 Y60.459 E.00807
G1 X176.831 Y59.998 E.01418
G1 X176.711 Y59.549 E.01417
G1 X176.62 Y59.309 E.00782
G2 X173.32 Y57.101 I-3.326 J1.401 E.12821
G1 X82.723 Y57.1 E2.76304
G1 X82.459 Y57.108 E.00807
G1 X81.998 Y57.169 E.01418
G1 X81.549 Y57.289 E.01418
G1 X81.309 Y57.38 E.0078
M73 P81 R7
G2 X79.1 Y60.723 I1.4 J3.327 E.12957
G1 X79.1 Y151.277 E2.76171
G1 X79.131 Y151.77 E.01507
G1 X79.224 Y152.238 E.01454
G1 X79.293 Y152.463 E.00719
G1 X79.469 Y152.887 E.01399
G1 X79.715 Y153.312 E.01498
G2 X82.723 Y154.9 I2.986 J-2.012 E.10805
G1 X94.987 Y154.9 E.37404
G1 X95.666 Y155.264 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X97.294 Y155.264 E.05401
G3 X97.748 Y156.936 I-2.143 J1.479 E.05855
G1 X99.943 Y156.936 E.0728
G2 X101.15 Y155.264 I-1.433 J-2.307 E.07015
G1 X104.283 Y155.264 E.10392
G3 X104.737 Y156.936 I-2.143 J1.479 E.05855
G1 X106.931 Y156.936 E.0728
G2 X108.139 Y155.264 I-1.433 J-2.307 E.07015
G1 X111.271 Y155.264 E.10392
G3 X111.725 Y156.936 I-2.143 J1.479 E.05855
G1 X113.92 Y156.936 E.0728
G2 X115.127 Y155.264 I-1.433 J-2.307 E.07015
G1 X118.26 Y155.264 E.10391
G3 X118.713 Y156.936 I-2.143 J1.479 E.05855
G1 X120.908 Y156.936 E.0728
G2 X122.115 Y155.264 I-1.433 J-2.307 E.07015
G1 X125.248 Y155.264 E.10392
G3 X125.702 Y156.936 I-2.143 J1.479 E.05855
G1 X127.897 Y156.936 E.0728
G2 X129.104 Y155.264 I-1.433 J-2.307 E.07015
G1 X132.237 Y155.264 E.10392
G3 X132.69 Y156.936 I-2.143 J1.479 E.05855
G1 X134.885 Y156.936 E.0728
G2 X136.092 Y155.264 I-1.433 J-2.307 E.07015
G1 X139.225 Y155.264 E.10392
G3 X139.679 Y156.936 I-2.143 J1.479 E.05855
G1 X141.873 Y156.936 E.0728
G2 X143.081 Y155.264 I-1.433 J-2.307 E.07015
G1 X146.213 Y155.264 E.10392
G3 X146.667 Y156.936 I-2.143 J1.479 E.05855
G1 X148.862 Y156.936 E.0728
G2 X150.069 Y155.264 I-1.433 J-2.307 E.07015
G1 X153.202 Y155.264 E.10392
G3 X153.655 Y156.936 I-2.143 J1.479 E.05855
G1 X155.85 Y156.936 E.0728
G2 X157.058 Y155.264 I-1.433 J-2.307 E.07015
G1 X160.19 Y155.264 E.10392
G3 X160.644 Y156.936 I-2.143 J1.479 E.05855
G1 X159.015 Y156.936 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X160.644 Y156.936 E-.61876
G1 X160.66 Y156.564 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/60
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z10.2 I-1.217 J.014 P1  F30000
G1 X161.086 Y194.114 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12275
G1 X92.584 Y159.656 E1.06451
G3 X94.954 Y157.284 I2.43 J.059 E.12272
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.045 J2.415 E.12287
G1 X163.416 Y191.724 E1.06383
G3 X161.315 Y194.095 I-2.422 J-.03 E.11455
G1 X161.146 Y194.109 E.00565
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.668 E1.06365
G3 X94.967 Y157.691 I2.021 J.043 E.1024
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.056 J2.032 E.1022
G1 X163.009 Y191.717 E1.06316
G3 X161.262 Y193.692 I-2.015 J-.023 E.09533
G1 X161.119 Y193.703 E.00476
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.681 E1.06278
G3 X94.98 Y158.098 I1.611 J.028 E.08208
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.038 J1.621 E.08193
G1 X162.602 Y191.71 E1.06249
G3 X161.209 Y193.288 I-1.608 J-.016 E.07612
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.0579
G1 X93.79 Y159.693 E.98369
G3 X94.993 Y158.49 I1.216 J.013 E.0579
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.704 E.98359
G3 X161.067 Y192.908 I-1.215 J-.009 E.05617
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z10.4 F30000
G1 X95.016 Y194.884 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.027 E.07907
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17221
G1 X163.343 Y157.545 E.12268
G3 X164.182 Y159.629 I-2.386 J2.172 E.0761
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23494
G1 X94.054 Y194.739 E-.15823
G1 X93.858 Y194.671 E-.07895
G1 X93.48 Y194.496 E-.15831
G1 X93.3 Y194.391 E-.07909
G1 X93.19 Y194.316 E-.05048
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z10.4 F30000
G1 X82.643 Y154.506 Z10.4
G1 Z10
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.036 J3.228 E.16583
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01681
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.027 J2.819 E.1451
G1 X176.102 Y151.31 E3.00604
M73 P82 R7
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.717 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.019 J2.425 E.1159
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.778 Y153.527 E-.17954
G1 X81.362 Y153.304 E-.17914
G1 X80.996 Y153.004 E-.17986
G1 X80.962 Y152.963 E-.02054
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z10.4 F30000
G1 X95.011 Y195.291 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.08899
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.341 Y56.711 E3.00617
G3 X177.291 Y60.716 I-.044 J3.994 E.20704
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-3.997 J.01 E.20895
G1 X161.685 Y155.291 E.38475
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.615 I-2.687 J2.451 E.08578
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.347 Y56.304 E3.00662
G3 X177.698 Y60.71 I-.051 J4.401 E.2278
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.404 J.003 E.22971
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23107
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.354 Y55.912 E2.78543
G3 X178.09 Y60.703 I-.058 J4.793 E.22955
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.275 J6.834 E.03423
G3 X165.388 Y159.589 I-3.579 J2.887 E.09011
G1 X165.39 Y191.698 E.98661
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19909
G1 X94.254 Y196.026 E-.1093
G1 X93.696 Y195.891 E-.21811
G1 X93.425 Y195.797 E-.1091
G1 X93.16 Y195.685 E-.10917
G1 X93.125 Y195.666 E-.01523
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z10.4 F30000
G1 X93.167 Y157.579 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428966
G1 F9325.327
G3 X93.416 Y157.358 I4.589 J4.94 E.01047
; LINE_WIDTH: 0.476091
G1 F8310.821
G3 X93.742 Y157.105 I4.146 J4.997 E.01454
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402374
G1 F10015.2
G1 X93.017 Y157.725 E.00614
G2 X92.2 Y159.719 I1.996 J1.982 E.06478
G1 X92.201 Y191.765 E.93865
G2 X95.02 Y194.5 I2.802 J-.067 E.12746
G1 X161.065 Y194.499 E1.93453
G2 X163.8 Y191.68 I-.067 J-2.802 E.12745
G1 X163.799 Y159.635 E.93864
G2 X162.84 Y157.584 I-2.825 J.071 E.06824
; LINE_WIDTH: 0.428552
G1 F9335.339
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.476459
G1 F8303.762
G2 X162.258 Y157.105 I-4.025 J4.858 E.0145
G1 X161.928 Y156.963 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.842 Y157.073 E.00463
G2 X160.37 Y156.936 I-1.175 J4.622 E.04925
G2 X160.193 Y155.264 I-2.062 J-.627 E.05726
G1 X156.931 Y155.264 E.10822
G3 X156.032 Y156.936 I-2.417 J-.223 E.06467
G1 X153.382 Y156.936 E.08793
G2 X153.205 Y155.264 I-2.062 J-.627 E.05726
G1 X149.943 Y155.264 E.10822
G3 X149.044 Y156.936 I-2.417 J-.223 E.06467
G1 X146.393 Y156.936 E.08793
G2 X146.217 Y155.264 I-2.062 J-.627 E.05726
G1 X142.954 Y155.264 E.10822
G3 X142.055 Y156.936 I-2.417 J-.223 E.06467
G1 X139.405 Y156.936 E.08793
G2 X139.228 Y155.264 I-2.062 J-.627 E.05726
G1 X135.966 Y155.264 E.10822
G3 X135.067 Y156.936 I-2.417 J-.223 E.06467
G1 X132.416 Y156.936 E.08793
G2 X132.24 Y155.264 I-2.062 J-.627 E.05726
G1 X128.977 Y155.264 E.10822
G3 X128.079 Y156.936 I-2.417 J-.223 E.06467
G1 X125.428 Y156.936 E.08793
G2 X125.251 Y155.264 I-2.062 J-.627 E.05726
G1 X121.989 Y155.264 E.10822
G3 X121.09 Y156.936 I-2.417 J-.223 E.06467
G1 X118.439 Y156.936 E.08793
G2 X118.263 Y155.264 I-2.062 J-.627 E.05726
G1 X115.001 Y155.264 E.10822
G3 X114.102 Y156.936 I-2.417 J-.223 E.06467
G1 X111.451 Y156.936 E.08793
G2 X111.275 Y155.264 I-2.062 J-.627 E.05726
G1 X108.012 Y155.264 E.10822
G3 X107.113 Y156.936 I-2.417 J-.223 E.06467
G1 X104.463 Y156.936 E.08793
G2 X104.286 Y155.264 I-2.062 J-.627 E.05726
G1 X101.024 Y155.264 E.10822
G3 X100.125 Y156.936 I-2.417 J-.223 E.06467
G1 X97.474 Y156.936 E.08793
G2 X97.298 Y155.264 I-2.062 J-.627 E.05726
G1 X95.67 Y155.264 E.05401
G1 X94.988 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417212
G1 F9618.178
G1 X82.723 Y154.9 E.37407
G3 X79.715 Y153.311 I-.023 J-3.6 E.10807
G1 X79.469 Y152.887 E.01498
G1 X79.372 Y152.672 E.00718
G1 X79.224 Y152.237 E.01399
G1 X79.131 Y151.77 E.01454
G1 X79.1 Y151.277 E.01506
G1 X79.1 Y60.723 E2.76189
G3 X80.689 Y57.715 I3.6 J-.023 E.10807
G1 X81.113 Y57.469 E.01498
G1 X81.328 Y57.372 E.00718
G1 X81.763 Y57.224 E.014
G1 X82.23 Y57.131 E.01454
G1 X82.723 Y57.1 E.01506
G1 X173.32 Y57.101 E2.76322
G3 X175.835 Y58.145 I-.027 J3.617 E.08515
G1 X176.01 Y58.331 E.00779
G1 X176.293 Y58.7 E.01418
G1 X176.421 Y58.906 E.00738
G1 X176.626 Y59.322 E.01417
G1 X176.776 Y59.762 E.01418
G1 X176.831 Y59.998 E.00737
G1 X176.892 Y60.459 E.01418
G1 X176.9 Y60.723 E.00807
G1 X176.9 Y151.277 E2.7619
G1 X176.869 Y151.77 E.01506
G1 X176.776 Y152.237 E.01455
G1 X176.628 Y152.672 E.014
G1 X176.529 Y152.892 E.00736
G1 X176.29 Y153.305 E.01455
G1 X176.152 Y153.496 E.00719
G1 X175.85 Y153.841 E.01399
G1 X175.487 Y154.16 E.01473
G1 X175.105 Y154.415 E.01399
G1 X174.897 Y154.526 E.00719
G1 X174.457 Y154.709 E.01454
G1 X173.996 Y154.831 E.01454
G1 X173.541 Y154.892 E.014
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37408
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9618.178
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/60
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z10.4 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00132
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12277
G1 X92.584 Y159.655 E1.0645
G3 X94.954 Y157.284 I2.433 J.061 E.12269
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.1138
G1 X161.146 Y194.109 E.00564
M73 P83 R7
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.668 E1.06364
G3 X94.967 Y157.691 I2.023 J.045 E.10237
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10242
G1 X163.009 Y191.733 E1.0637
G3 X161.262 Y193.692 I-2.015 J-.039 E.0948
G1 X161.119 Y193.703 E.00476
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19066
G3 X93.398 Y191.719 I.025 J-1.608 E.0821
G1 X93.398 Y159.681 E1.06278
G3 X94.98 Y158.098 I1.613 J.03 E.08205
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.08209
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.07579
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.98368
G3 X94.993 Y158.49 I1.218 J.015 E.05788
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z10.6 F30000
G1 X95.016 Y194.884 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.311 J.036 E.07905
G1 X95.258 Y154.916 E.1225
G1 X160.742 Y154.916 E2.17222
G1 X163.342 Y157.545 E.12265
G3 X164.182 Y159.624 I-2.387 J2.173 E.07595
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23498
G1 X94.055 Y194.739 E-.15809
G1 X93.858 Y194.671 E-.07921
G1 X93.48 Y194.496 E-.15815
G1 X93.3 Y194.391 E-.07906
G1 X93.19 Y194.316 E-.05052
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z10.6 F30000
G1 X82.643 Y154.506 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01681
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.778 Y153.527 E-.17957
G1 X81.361 Y153.304 E-.1795
G1 X80.996 Y153.004 E-.17952
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z10.6 F30000
G1 X95.011 Y195.291 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.73 J.045 E.08897
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I-.008 J-3.999 E.20893
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.335 Y56.711 E3.00599
G3 X176.312 Y58.084 I-.041 J4.004 E.11203
G3 X177.291 Y60.717 I-3.136 J2.664 E.09509
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38475
G1 X163.64 Y157.267 E.09223
G3 X164.589 Y159.612 I-2.688 J2.452 E.08568
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.149 J.054 E.09888
G1 X93.34 Y155.698 E.06022
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I-.003 J-4.404 E.22971
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.342 Y56.304 E3.00644
G3 X177.698 Y60.71 I-.046 J4.402 E.22798
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06029
G3 X164.996 Y159.6 I-2.988 J2.73 E.09541
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.552 J.062 E.10045
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X79.07 Y154.423 I.043 J-4.888 E.12653
G3 X77.91 Y151.297 I3.659 J-3.137 E.10464
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.348 Y55.912 E2.78526
G3 X178.09 Y60.703 I-.052 J4.794 E.22972
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.379 Y156.898 I-6.191 J6.75 E.03453
G3 X165.388 Y159.588 I-3.587 J2.88 E.08978
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19909
G1 X94.254 Y196.026 E-.10933
G1 X93.696 Y195.891 E-.21802
G1 X93.425 Y195.797 E-.10919
G1 X93.16 Y195.685 E-.10919
G1 X93.125 Y195.666 E-.01518
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z10.6 F30000
G1 X93.167 Y157.579 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429104
G1 F9322
G3 X93.418 Y157.357 I4.696 J5.059 E.01056
; LINE_WIDTH: 0.47636
M73 P83 R6
G1 F8305.651
G3 X93.742 Y157.106 I4.037 J4.874 E.01447
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402375
G1 F10015.175
G1 X93.01 Y157.731 E.0064
G2 X92.2 Y159.719 I2.001 J1.975 E.06452
G1 X92.201 Y191.765 E.93865
G2 X95.02 Y194.5 I2.802 J-.068 E.12746
G1 X161.065 Y194.499 E1.93453
G2 X163.8 Y191.68 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.84 Y157.584 I-2.843 J.08 E.0682
; LINE_WIDTH: 0.428507
G1 F9336.413
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.477421
G1 F8285.374
G2 X162.251 Y157.1 I-4.067 J4.906 E.01483
G1 X161.774 Y157.047 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X160.156 Y156.936 I-1.209 J5.755 E.05395
M73 P84 R6
G2 X160.216 Y155.264 I-1.82 J-.902 E.05717
G1 X156.882 Y155.264 E.11061
G1 X156.846 Y155.7 E.01451
G3 X156.192 Y156.936 I-2.724 J-.652 E.04685
G1 X153.168 Y156.936 E.10031
G2 X153.228 Y155.264 I-1.82 J-.902 E.05717
G1 X149.893 Y155.264 E.11061
G1 X149.857 Y155.7 E.01451
G3 X149.203 Y156.936 I-2.724 J-.651 E.04685
G1 X146.179 Y156.936 E.10031
G2 X146.239 Y155.264 I-1.82 J-.902 E.05717
G1 X142.905 Y155.264 E.11061
G1 X142.869 Y155.7 E.01451
G3 X142.215 Y156.936 I-2.724 J-.652 E.04685
G1 X139.191 Y156.936 E.10031
G2 X139.251 Y155.264 I-1.82 J-.902 E.05717
G1 X135.916 Y155.264 E.11061
G1 X135.88 Y155.7 E.01451
G3 X135.226 Y156.936 I-2.724 J-.652 E.04685
G1 X132.203 Y156.936 E.10031
G2 X132.262 Y155.264 I-1.82 J-.902 E.05717
G1 X128.928 Y155.264 E.11061
G1 X128.892 Y155.7 E.01451
G3 X128.238 Y156.936 I-2.724 J-.652 E.04685
G1 X125.214 Y156.936 E.10031
G2 X125.274 Y155.264 I-1.82 J-.902 E.05717
G1 X121.94 Y155.264 E.11061
G1 X121.904 Y155.7 E.01451
G3 X121.25 Y156.936 I-2.724 J-.651 E.04685
G1 X118.226 Y156.936 E.10031
G2 X118.286 Y155.264 I-1.82 J-.902 E.05717
G1 X114.951 Y155.264 E.11061
G1 X114.915 Y155.7 E.01451
G3 X114.261 Y156.936 I-2.724 J-.651 E.04685
G1 X111.237 Y156.936 E.10031
G2 X111.297 Y155.264 I-1.82 J-.902 E.05717
G1 X107.963 Y155.264 E.11061
G1 X107.927 Y155.7 E.01451
G3 X107.273 Y156.936 I-2.724 J-.651 E.04685
G1 X104.249 Y156.936 E.10031
G2 X104.309 Y155.264 I-1.82 J-.902 E.05717
G1 X100.974 Y155.264 E.11061
G1 X100.938 Y155.7 E.01451
G3 X100.284 Y156.936 I-2.724 J-.651 E.04685
G1 X97.261 Y156.936 E.10031
G2 X97.32 Y155.264 I-1.82 J-.902 E.05717
G1 X95.692 Y155.264 E.05401
G1 X94.988 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417238
G1 F9617.512
G1 X82.723 Y154.9 E.3741
G3 X79.714 Y153.311 I-.023 J-3.6 E.1081
G1 X79.469 Y152.887 E.01495
G1 X79.372 Y152.672 E.00718
G1 X79.224 Y152.238 E.014
G1 X79.131 Y151.77 E.01454
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.76209
G3 X81.31 Y57.379 I3.609 J-.017 E.12962
G1 X81.548 Y57.289 E.00776
G1 X81.998 Y57.169 E.01418
G1 X82.459 Y57.108 E.01418
G1 X82.723 Y57.1 E.00807
G1 X173.32 Y57.101 E2.76341
G3 X175.289 Y57.7 I-.017 J3.59 E.06365
G1 X175.496 Y57.848 E.00777
G1 X175.85 Y58.159 E.01436
G1 X176.156 Y58.508 E.01417
G1 X176.421 Y58.905 E.01456
G1 X176.626 Y59.322 E.01417
G1 X176.777 Y59.768 E.01437
G1 X176.869 Y60.23 E.01436
G1 X176.899 Y60.68 E.01374
G1 X176.9 Y151.277 E2.76341
G3 X175.311 Y154.286 I-3.6 J.023 E.10809
G1 X174.892 Y154.529 E.01477
G1 X174.457 Y154.709 E.01437
G1 X173.996 Y154.832 E.01454
G1 X173.535 Y154.892 E.01418
G1 X161.012 Y154.9 E.38199
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9617.512
G1 X163.012 Y154.899 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/60
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z10.6 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.043 J-2.413 E.12288
G1 X92.584 Y159.654 E1.06458
G3 X94.954 Y157.284 I2.415 J.046 E.12285
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.045 J2.415 E.12286
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.031 J-2.007 E.10254
G1 X92.991 Y159.667 E1.0637
G3 X94.967 Y157.691 I2.032 J.056 E.10221
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.056 J2.032 E.1022
G1 X163.009 Y191.733 E1.06369
G3 X161.262 Y193.692 I-2.015 J-.039 E.09481
G1 X161.119 Y193.703 E.00476
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.019 J-1.601 E.08219
G1 X93.398 Y159.68 E1.06281
G3 X94.98 Y158.098 I1.62 J.038 E.08193
G1 X161.02 Y158.098 E2.19066
G3 X162.602 Y159.68 I-.038 J1.621 E.08192
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.032 J-1.235 E.05766
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z10.8 F30000
G1 X95.016 Y194.884 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06353
G3 X92.661 Y157.542 I3.286 J.026 E.07906
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17224
G1 X163.342 Y157.545 E.12265
G3 X164.182 Y159.629 I-2.383 J2.171 E.07612
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23488
G1 X94.055 Y194.739 E-.15817
G1 X93.858 Y194.671 E-.07929
G1 X93.48 Y194.496 E-.15812
G1 X93.3 Y194.39 E-.07928
G1 X93.193 Y194.313 E-.05025
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z10.8 F30000
G1 X82.643 Y154.506 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.437 J-3.198 E.15248
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.045 E.01681
G3 X79.898 Y151.31 I.563 J-2.762 E.1272
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.018 J-2.425 E.11591
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20092
G1 X81.778 Y153.527 E-.17951
G1 X81.361 Y153.304 E-.17956
G1 X80.996 Y153.005 E-.17921
G1 X80.962 Y152.962 E-.02081
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z10.8 F30000
G1 X95.011 Y195.291 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.266 I3.704 J.035 E.08898
G1 X94.315 Y155.291 E.09213
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.33 Y56.711 E3.00581
G3 X177.291 Y60.716 I-.034 J3.995 E.20741
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.268 E.09223
G3 X164.589 Y159.615 I-2.689 J2.452 E.08579
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.122 J.043 E.0989
G1 X93.339 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.337 Y56.304 E3.00626
G3 X177.698 Y60.71 I-.041 J4.402 E.22817
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06029
G3 X164.996 Y159.602 I-2.995 J2.733 E.09547
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P85 R6
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.003 J-4.796 E.23132
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.343 Y55.911 E2.7851
G3 X178.09 Y60.703 I-.047 J4.794 E.22989
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.378 Y156.898 I-6.205 J6.764 E.0345
G3 X165.388 Y159.589 I-3.387 J2.806 E.08999
G1 X165.39 Y191.698 E.98661
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.065 E-.19912
G1 X94.254 Y196.026 E-.10917
G1 X93.696 Y195.891 E-.21817
G1 X93.425 Y195.797 E-.10916
G1 X93.128 Y195.66 E-.12437
; WIPE_END
G1 E-.04 F1800
G1 X93.154 Y188.027 Z10.8 F30000
G1 X93.259 Y157.495 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402389
G1 F10014.779
G2 X92.2 Y159.719 I1.795 J2.219 E.07462
G1 X92.201 Y191.765 E.93869
G2 X95.02 Y194.5 I2.808 J-.074 E.12739
G1 X161.065 Y194.499 E1.93461
G2 X163.8 Y191.681 I-.068 J-2.802 E.12746
G1 X163.799 Y159.635 E.93868
G2 X162.84 Y157.584 I-2.825 J.071 E.06823
; LINE_WIDTH: 0.428516
G1 F9336.206
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.477447
G1 F8284.881
G2 X162.251 Y157.1 I-4.097 J4.943 E.01483
G1 X161.599 Y157.002 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X159.976 Y156.936 I-1.054 J5.859 E.05405
G2 X160.256 Y155.264 I-1.698 J-1.143 E.05795
G1 X156.808 Y155.264 E.11437
G3 X156.347 Y156.936 I-2.105 J.319 E.05922
G1 X152.988 Y156.936 E.11145
G2 X153.268 Y155.264 I-1.698 J-1.143 E.05795
G1 X149.82 Y155.264 E.11437
G3 X149.359 Y156.936 I-2.105 J.319 E.05922
G1 X145.999 Y156.936 E.11145
G2 X146.279 Y155.264 I-1.698 J-1.143 E.05795
G1 X142.831 Y155.264 E.11437
G3 X142.371 Y156.936 I-2.105 J.319 E.05922
G1 X139.011 Y156.936 E.11145
G2 X139.291 Y155.264 I-1.698 J-1.143 E.05795
G1 X135.843 Y155.264 E.11437
G3 X135.382 Y156.936 I-2.105 J.319 E.05922
G1 X132.022 Y156.936 E.11145
G2 X132.302 Y155.264 I-1.698 J-1.143 E.05795
G1 X128.855 Y155.264 E.11437
G3 X128.394 Y156.936 I-2.105 J.319 E.05922
G1 X125.034 Y156.936 E.11145
G2 X125.314 Y155.264 I-1.698 J-1.143 E.05795
G1 X121.866 Y155.264 E.11437
G3 X121.405 Y156.936 I-2.105 J.319 E.05922
G1 X118.046 Y156.936 E.11145
G2 X118.326 Y155.264 I-1.698 J-1.143 E.05795
G1 X114.878 Y155.264 E.11437
G3 X114.417 Y156.936 I-2.105 J.319 E.05922
G1 X111.057 Y156.936 E.11145
G2 X111.337 Y155.264 I-1.698 J-1.143 E.05795
G1 X107.889 Y155.264 E.11437
G3 X107.429 Y156.936 I-2.105 J.319 E.05922
G1 X104.069 Y156.936 E.11145
G2 X104.349 Y155.264 I-1.698 J-1.143 E.05795
G1 X100.901 Y155.264 E.11437
G3 X100.44 Y156.936 I-2.105 J.319 E.05922
G1 X97.08 Y156.936 E.11145
G2 X97.36 Y155.264 I-1.698 J-1.143 E.05795
G1 X95.732 Y155.264 E.05401
G1 X94.987 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417263
G1 F9616.861
G1 X82.723 Y154.9 E.37411
G3 X79.172 Y152.015 I-.023 J-3.6 E.15124
G1 X79.108 Y151.541 E.01458
G1 X79.1 Y151.277 E.00807
G1 X79.1 Y60.723 E2.76227
G1 X79.108 Y60.459 E.00807
G1 X79.169 Y59.998 E.01419
G1 X79.289 Y59.549 E.01418
G1 X79.374 Y59.322 E.00738
G1 X79.579 Y58.905 E.01416
G1 X79.707 Y58.7 E.00738
G1 X79.99 Y58.331 E.01418
G1 X80.154 Y58.154 E.00737
G1 X80.331 Y57.99 E.00737
G1 X80.7 Y57.707 E.01417
G1 X80.906 Y57.579 E.00738
G1 X81.322 Y57.374 E.01417
G1 X81.763 Y57.224 E.01418
G1 X81.998 Y57.169 E.00737
G1 X82.459 Y57.108 E.01419
G1 X82.723 Y57.1 E.00806
G1 X173.32 Y57.101 E2.7636
G3 X176.621 Y59.311 I-.025 J3.607 E.12831
G1 X176.711 Y59.549 E.00777
G1 X176.831 Y59.998 E.01417
G1 X176.892 Y60.459 E.01418
G1 X176.9 Y60.723 E.00807
G1 X176.9 Y151.277 E2.76227
G3 X174.015 Y154.828 I-3.6 J.023 E.15125
G1 X173.541 Y154.892 E.01457
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37412
; WIPE_START
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.385 Y155.167 Z10.8 F30000
G1 X93.878 Y157.324 Z10.8
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.404341
G1 F9960.694
G1 X93.612 Y157.256 E.00808
; LINE_WIDTH: 0.439916
G1 F9068.111
G1 X93.586 Y157.25 E.00086
; LINE_WIDTH: 0.475925
G1 F8314.007
G1 X93.561 Y157.244 E.00094
G1 X93.424 Y157.353 E.00617
; LINE_WIDTH: 0.437322
G1 F9127.741
G1 X93.259 Y157.495 E.00699
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9127.741
G1 X93.424 Y157.353 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/60
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z10.8 I-.581 J1.069 P1  F30000
G1 X161.086 Y194.114 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.045 J-2.415 E.12287
G1 X92.584 Y159.676 E1.06381
G3 X94.954 Y157.284 I2.414 J.021 E.12362
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.045 J2.415 E.12286
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.096 I-2.415 J-.045 E.11391
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.056 J-2.032 E.10221
G1 X92.991 Y159.683 E1.06315
G3 X94.967 Y157.691 I2.031 J.039 E.10275
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.056 J2.032 E.1022
G1 X163.009 Y191.733 E1.0637
G3 X161.262 Y193.69 I-2.032 J-.056 E.09458
G1 X161.119 Y193.702 E.00475
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00042
G1 X94.98 Y193.302 E2.19066
G3 X93.398 Y191.719 I.038 J-1.621 E.08193
G1 X93.398 Y159.69 E1.06248
G3 X94.98 Y158.098 I1.62 J.028 E.08225
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.038 J1.621 E.08192
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.287 I-1.621 J-.038 E.07563
G1 X161.092 Y193.296 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.021 J-1.224 E.0578
G1 X93.79 Y159.696 E.98359
G3 X94.993 Y158.49 I1.224 J.017 E.0579
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.021 J1.224 E.0578
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.907 I-1.224 J-.021 E.05596
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z11 F30000
G1 X95.016 Y194.884 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.66 Y157.542 I3.287 J.027 E.07905
G1 X95.258 Y154.916 E.12252
G1 X160.742 Y154.916 E2.17223
G1 X163.342 Y157.545 E.12265
G3 X164.182 Y159.624 I-2.477 J2.21 E.07587
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23482
G1 X94.055 Y194.739 E-.15818
G1 X93.858 Y194.671 E-.07921
G1 X93.48 Y194.496 E-.15802
G1 X93.3 Y194.391 E-.07938
G1 X93.193 Y194.313 E-.05038
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z11 F30000
G1 X82.643 Y154.506 Z11
G1 Z10.6
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.48 E.01203
G3 X79.491 Y151.317 I.437 J-3.198 E.15247
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.045 E.01681
G3 X79.898 Y151.31 I.563 J-2.762 E.1272
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.018 J-2.425 E.11591
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20092
G1 X81.778 Y153.527 E-.17953
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.005 E-.17924
G1 X80.962 Y152.962 E-.02078
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z11 F30000
G1 X95.011 Y195.291 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.266 I3.705 J.035 E.08898
G1 X94.315 Y155.291 E.09213
G1 X82.716 Y155.291 E.38473
G3 X78.709 Y151.283 I.006 J-4.013 E.20873
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.324 Y56.71 E3.00563
G3 X177.291 Y60.717 I-.044 J4.011 E.20737
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
M73 P86 R6
G1 X161.685 Y155.291 E.38475
G1 X163.64 Y157.267 E.09222
G3 X164.589 Y159.612 I-2.789 J2.493 E.08558
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.0989
G1 X93.339 Y155.698 E.06023
G1 X82.71 Y155.698 E.35261
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.421 J.014 E.22947
G1 X173.331 Y56.303 E3.00608
M73 P86 R5
G3 X177.698 Y60.71 I-.053 J4.419 E.22811
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06028
G3 X164.996 Y159.6 I-3.101 J2.776 E.0953
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.811 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.723 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.337 Y55.911 E2.78493
G3 X178.09 Y60.703 I-.061 J4.813 E.22981
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.378 Y156.897 I-6.206 J6.765 E.03447
G3 X165.388 Y159.588 I-3.419 J2.819 E.08997
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02282
G1 X94.539 Y196.065 E-.17633
G1 X94.254 Y196.026 E-.10919
G1 X93.696 Y195.891 E-.21811
G1 X93.425 Y195.797 E-.10923
G1 X93.16 Y195.685 E-.10928
G1 X93.125 Y195.666 E-.01504
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z11 F30000
G1 X93.167 Y157.579 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429055
G1 F9323.162
G3 X93.417 Y157.358 I4.643 J4.999 E.0105
; LINE_WIDTH: 0.47618
G1 F8309.115
G3 X93.741 Y157.106 I4.08 J4.917 E.01451
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402377
G1 F10015.102
G1 X92.994 Y157.748 E.00709
G2 X92.2 Y159.719 I2.025 J1.961 E.06383
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.808 J-.074 E.12738
G1 X161.065 Y194.499 E1.93455
G2 X163.8 Y191.681 I-.074 J-2.808 E.12737
G1 X163.799 Y159.635 E.93865
G2 X162.84 Y157.584 I-2.832 J.074 E.06822
; LINE_WIDTH: 0.428465
G1 F9337.445
G1 X162.582 Y157.357 E.01081
; LINE_WIDTH: 0.476376
G1 F8305.34
G2 X162.258 Y157.105 I-4.035 J4.87 E.0145
G1 X161.543 Y156.221 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.596 Y155.264 E.04464
G1 X160.314 Y155.264 E.00937
G3 X159.814 Y156.936 I-2.136 J.272 E.05957
G1 X156.512 Y156.936 E.10956
G2 X156.754 Y155.264 I-1.714 J-1.101 E.05775
G1 X153.325 Y155.264 E.11372
G3 X152.826 Y156.936 I-2.136 J.272 E.05957
G1 X149.523 Y156.936 E.10956
G2 X149.765 Y155.264 I-1.714 J-1.101 E.05775
G1 X146.337 Y155.264 E.11372
G3 X145.837 Y156.936 I-2.136 J.272 E.05957
G1 X142.535 Y156.936 E.10956
G2 X142.777 Y155.264 I-1.714 J-1.101 E.05775
G1 X139.349 Y155.264 E.11372
G3 X138.849 Y156.936 I-2.136 J.272 E.05957
G1 X135.546 Y156.936 E.10956
G2 X135.788 Y155.264 I-1.714 J-1.101 E.05775
G1 X132.36 Y155.264 E.11372
G3 X131.861 Y156.936 I-2.136 J.272 E.05957
G1 X128.558 Y156.936 E.10956
G2 X128.8 Y155.264 I-1.714 J-1.101 E.05775
G1 X125.372 Y155.264 E.11372
G3 X124.872 Y156.936 I-2.136 J.272 E.05957
G1 X121.57 Y156.936 E.10956
G2 X121.812 Y155.264 I-1.714 J-1.101 E.05775
G1 X118.383 Y155.264 E.11372
G3 X117.884 Y156.936 I-2.136 J.272 E.05957
G1 X114.581 Y156.936 E.10956
G2 X114.823 Y155.264 I-1.714 J-1.101 E.05775
G1 X111.395 Y155.264 E.11372
G3 X110.895 Y156.936 I-2.136 J.272 E.05957
G1 X107.593 Y156.936 E.10956
G2 X107.835 Y155.264 I-1.714 J-1.101 E.05775
G1 X104.407 Y155.264 E.11372
G3 X103.907 Y156.936 I-2.136 J.272 E.05957
G1 X100.604 Y156.936 E.10956
G2 X100.846 Y155.264 I-1.714 J-1.101 E.05775
G1 X97.418 Y155.264 E.11372
G3 X96.919 Y156.936 I-2.136 J.272 E.05957
G1 X95.29 Y156.936 E.05401
; WIPE_START
G1 X96.919 Y156.936 E-.61876
G1 X97.125 Y156.627 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X94.987 Y154.9 Z11 F30000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417287
G1 F9616.249
G1 X82.723 Y154.9 E.37414
G3 X79.224 Y152.237 I-.017 J-3.607 E.14422
G1 X79.131 Y151.77 E.01455
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.76245
G3 X81.986 Y57.172 I3.6 J-.023 E.15128
G1 X82.459 Y57.108 E.01455
G1 X82.723 Y57.1 E.00806
G1 X173.318 Y57.101 E2.76369
G3 X176.286 Y58.69 I-.016 J3.597 E.10691
G1 X176.531 Y59.113 E.01492
G1 X176.628 Y59.328 E.00718
G1 X176.776 Y59.762 E.014
G1 X176.869 Y60.23 E.01455
G1 X176.9 Y60.723 E.01506
G1 X176.9 Y151.277 E2.76245
G3 X174.014 Y154.828 I-3.6 J.023 E.15128
G1 X173.541 Y154.892 E.01455
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37415
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9616.249
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/60
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z11 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12275
G1 X92.584 Y159.655 E1.06454
G3 X94.954 Y157.284 I2.432 J.061 E.12267
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.422 E.12276
G1 X163.416 Y191.724 E1.06383
G3 X161.315 Y194.095 I-2.422 J-.03 E.11456
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.668 E1.06367
G3 X94.967 Y157.691 I2.022 J.045 E.10236
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.717 E1.06316
G3 X161.262 Y193.692 I-2.015 J-.023 E.09534
G1 X161.119 Y193.703 E.00476
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.026 J-1.608 E.08209
G1 X93.398 Y159.681 E1.0628
G3 X94.98 Y158.098 I1.612 J.029 E.08205
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.607 E.0821
G1 X162.602 Y191.71 E1.06249
G3 X161.209 Y193.288 I-1.608 J-.016 E.07612
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.0579
G1 X93.79 Y159.693 E.98369
G3 X94.993 Y158.49 I1.217 J.014 E.05788
G1 X161.007 Y158.49 E2.02843
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.704 E.98359
G3 X161.067 Y192.908 I-1.215 J-.009 E.05617
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z11.2 F30000
G1 X95.016 Y194.884 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.027 E.07906
G1 X95.258 Y154.916 E.12252
G1 X160.742 Y154.916 E2.17222
M73 P87 R5
G1 X163.342 Y157.545 E.12266
G3 X164.182 Y159.629 I-2.38 J2.17 E.07613
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23496
G1 X94.054 Y194.739 E-.15827
G1 X93.858 Y194.671 E-.07893
G1 X93.666 Y194.589 E-.07926
G1 X93.3 Y194.391 E-.15825
G1 X93.193 Y194.313 E-.05033
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z11.2 F30000
G1 X82.643 Y154.506 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.436 J-3.198 E.15248
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.227 J.035 E.16585
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01681
G3 X79.898 Y151.31 I.562 J-2.762 E.1272
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.818 J.026 E.14511
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.018 J-2.424 E.11592
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.424 J.018 E.11592
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.778 Y153.527 E-.17949
G1 X81.361 Y153.304 E-.1796
G1 X80.996 Y153.005 E-.17925
G1 X80.962 Y152.962 E-.02075
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z11.2 F30000
G1 X95.011 Y195.291 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.08898
G1 X94.315 Y155.291 E.09213
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.716 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.319 Y56.71 E3.00545
G3 X177.291 Y60.716 I-.043 J4.015 E.2075
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.268 E.09223
G3 X164.589 Y159.616 I-2.686 J2.451 E.0858
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.007 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.422 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.326 Y56.303 E3.0059
G3 X177.698 Y60.71 I-.052 J4.424 E.22823
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.421 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06029
G3 X164.996 Y159.602 I-2.992 J2.732 E.09547
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.067 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.332 Y55.911 E2.78476
G3 X178.09 Y60.703 I-.06 J4.818 E.22993
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.377 Y156.896 I-6.22 J6.779 E.03443
G3 X165.388 Y159.589 I-3.384 J2.807 E.09006
G1 X165.39 Y191.698 E.98661
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02282
G1 X94.539 Y196.065 E-.17634
G1 X94.254 Y196.026 E-.10922
G1 X93.696 Y195.891 E-.21828
G1 X93.425 Y195.797 E-.10908
G1 X93.16 Y195.685 E-.10911
G1 X93.125 Y195.666 E-.01515
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z11.2 F30000
G1 X93.167 Y157.579 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429141
G1 F9321.097
G3 X93.418 Y157.357 I4.617 J4.968 E.01054
; LINE_WIDTH: 0.476331
G1 F8306.206
G3 X93.742 Y157.106 I4.02 J4.851 E.01447
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.40239
G1 F10014.752
G1 X93.012 Y157.73 E.00633
G2 X92.2 Y159.719 I2.004 J1.979 E.06459
G1 X92.201 Y191.765 E.93869
G2 X95.02 Y194.5 I2.802 J-.068 E.12747
G1 X161.065 Y194.499 E1.93462
G2 X163.8 Y191.681 I-.068 J-2.802 E.12746
G1 X163.799 Y159.635 E.93868
G2 X162.726 Y157.481 I-2.873 J.086 E.07271
; LINE_WIDTH: 0.4429
G1 F9000.456
G2 X162.54 Y157.323 I-3.344 J3.746 E.00797
; LINE_WIDTH: 0.481421
G1 F8209.793
G1 X162.258 Y157.106 E.01271
G1 X161.597 Y156.276 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.596 Y155.264 E.04718
G1 X160.391 Y155.264 E.00683
G1 X160.345 Y155.7 E.01454
G1 X160.021 Y156.495 E.02846
G1 X159.614 Y156.936 E.01989
G1 X156.696 Y156.936 E.09679
G2 X156.717 Y155.264 I-1.851 J-.858 E.05712
G1 X153.402 Y155.264 E.10995
G1 X153.356 Y155.7 E.01454
G1 X153.033 Y156.495 E.02846
G1 X152.626 Y156.936 E.01989
M73 P88 R5
G1 X149.708 Y156.936 E.09679
G2 X149.728 Y155.264 I-1.851 J-.858 E.05712
G1 X146.414 Y155.264 E.10995
G1 X146.368 Y155.7 E.01454
G1 X146.044 Y156.495 E.02846
G1 X145.637 Y156.936 E.01989
G1 X142.719 Y156.936 E.09679
G2 X142.74 Y155.264 I-1.851 J-.858 E.05712
G1 X139.425 Y155.264 E.10995
G1 X139.379 Y155.7 E.01454
G1 X139.056 Y156.495 E.02846
G1 X138.649 Y156.936 E.01989
G1 X135.731 Y156.936 E.09679
G2 X135.751 Y155.264 I-1.851 J-.858 E.05712
G1 X132.437 Y155.264 E.10995
G1 X132.391 Y155.7 E.01454
G1 X132.068 Y156.495 E.02846
G1 X131.661 Y156.936 E.01989
G1 X128.743 Y156.936 E.09679
G2 X128.763 Y155.264 I-1.851 J-.858 E.05712
G1 X125.449 Y155.264 E.10995
G1 X125.403 Y155.7 E.01454
G1 X125.079 Y156.495 E.02846
G1 X124.672 Y156.936 E.01989
G1 X121.754 Y156.936 E.09679
G2 X121.775 Y155.264 I-1.851 J-.858 E.05712
G1 X118.46 Y155.264 E.10995
G1 X118.414 Y155.7 E.01454
G1 X118.091 Y156.495 E.02846
G1 X117.684 Y156.936 E.01989
G1 X114.766 Y156.936 E.09679
G2 X114.786 Y155.264 I-1.851 J-.858 E.05712
G1 X111.472 Y155.264 E.10995
G1 X111.426 Y155.7 E.01454
G1 X111.102 Y156.495 E.02846
G1 X110.695 Y156.936 E.01989
G1 X107.777 Y156.936 E.09679
G2 X107.798 Y155.264 I-1.851 J-.858 E.05712
G1 X104.483 Y155.264 E.10995
G1 X104.437 Y155.7 E.01454
G1 X104.114 Y156.495 E.02846
G1 X103.707 Y156.936 E.01989
G1 X100.789 Y156.936 E.09679
G2 X100.809 Y155.264 I-1.851 J-.858 E.05712
G1 X97.495 Y155.264 E.10995
G1 X97.449 Y155.7 E.01454
G1 X97.126 Y156.495 E.02846
G1 X96.719 Y156.936 E.01989
G1 X95.09 Y156.936 E.05401
; WIPE_START
G1 X96.719 Y156.936 E-.61876
G1 X96.971 Y156.663 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X94.988 Y154.9 Z11.2 F30000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417311
G1 F9615.614
G1 X82.723 Y154.9 E.37417
G3 X79.293 Y152.463 I-.023 J-3.6 E.13709
G1 X79.221 Y152.226 E.00756
G1 X79.132 Y151.776 E.014
G1 X79.1 Y151.277 E.01524
G1 X79.1 Y60.723 E2.76263
G3 X81.987 Y57.172 I3.6 J-.023 E.1513
G1 X82.459 Y57.108 E.01453
G1 X82.723 Y57.1 E.00807
G1 X173.312 Y57.101 E2.76371
G3 X176.828 Y59.987 I-.011 J3.599 E.15023
G1 X176.892 Y60.459 E.01453
G1 X176.9 Y60.723 E.00807
G1 X176.9 Y151.277 E2.76263
G3 X174.688 Y154.621 I-3.609 J.017 E.1297
G1 X174.451 Y154.711 E.00772
G1 X174.002 Y154.831 E.01417
G1 X173.764 Y154.87 E.00739
G1 X173.32 Y154.899 E.01355
G1 X161.012 Y154.9 E.3755
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9615.614
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/60
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z11.2 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12277
G1 X92.584 Y159.676 E1.06382
G3 X94.954 Y157.284 I2.432 J.039 E.1234
G1 X161.046 Y157.284 E2.19241
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.724 E1.06383
G3 X161.315 Y194.095 I-2.422 J-.03 E.11455
G1 X161.146 Y194.109 E.00565
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.683 E1.06315
G3 X94.967 Y157.691 I2.022 J.029 E.10288
G1 X161.033 Y157.691 E2.19153
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.717 E1.06316
G3 X161.262 Y193.692 I-2.015 J-.023 E.09533
G1 X161.119 Y193.703 E.00477
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.025 J-1.608 E.0821
G1 X93.398 Y159.69 E1.06248
G3 X94.98 Y158.098 I1.612 J.02 E.08237
G1 X161.02 Y158.098 E2.19064
G3 X162.602 Y159.68 I-.025 J1.608 E.0821
G1 X162.602 Y191.71 E1.06249
G3 X161.209 Y193.288 I-1.608 J-.016 E.07611
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.696 E.98359
G3 X94.993 Y158.49 I1.217 J.011 E.05799
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.704 E.98359
G3 X161.067 Y192.908 I-1.215 J-.009 E.05617
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z11.4 F30000
G1 X95.016 Y194.884 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.315 J.038 E.07903
G1 X95.258 Y154.916 E.12252
G1 X160.742 Y154.916 E2.17222
G1 X163.342 Y157.545 E.12265
G3 X164.182 Y159.624 I-2.386 J2.173 E.07596
G1 X164.184 Y191.685 E1.06353
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18937
; WIPE_START
G1 X94.459 Y194.836 E-.23495
G1 X94.055 Y194.739 E-.1581
G1 X93.858 Y194.671 E-.07923
G1 X93.666 Y194.589 E-.07915
G1 X93.3 Y194.391 E-.1582
G1 X93.19 Y194.316 E-.05038
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z11.4 F30000
G1 X82.643 Y154.506 Z11.4
G1 Z11
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.48 E.01204
G3 X79.491 Y151.317 I.434 J-3.196 E.15251
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00583
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01682
G3 X79.898 Y151.31 I.56 J-2.76 E.12723
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
M73 P88 R4
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00512
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20091
G1 X81.778 Y153.527 E-.17929
G1 X81.361 Y153.304 E-.17977
G1 X80.996 Y153.004 E-.17952
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z11.4 F30000
G1 X95.011 Y195.291 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.266 I3.734 J.047 E.08895
G1 X94.315 Y155.291 E.09213
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.284 I.005 J-4.013 E.20873
G1 X78.709 Y60.716 E3.00428
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.313 Y56.71 E3.00527
G3 X177.291 Y60.716 I-.034 J4.011 E.20773
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.64 Y157.267 E.09222
G3 X164.589 Y159.612 I-2.687 J2.452 E.08568
G1 X164.591 Y191.689 E1.06407
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.154 J.056 E.09887
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00473
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.32 Y56.303 E3.00572
G3 X177.698 Y60.71 I-.042 J4.42 E.22847
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.938 Y156.99 E.06028
G3 X164.996 Y159.6 I-2.988 J2.73 E.09541
G1 X164.998 Y191.694 E1.06462
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.558 J.064 E.10044
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.326 Y55.911 E2.78459
G3 X178.09 Y60.703 I-.05 J4.814 E.23015
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.376 Y156.895 I-6.232 J6.79 E.0344
G3 X165.388 Y159.589 I-3.583 J2.882 E.08991
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02283
M73 P89 R4
G1 X94.539 Y196.065 E-.17641
G1 X94.254 Y196.026 E-.10921
G1 X93.696 Y195.891 E-.21813
G1 X93.425 Y195.797 E-.10914
G1 X93.16 Y195.685 E-.1092
G1 X93.125 Y195.666 E-.01508
; WIPE_END
G1 E-.04 F1800
G1 X93.048 Y188.034 Z11.4 F30000
G1 X92.744 Y158.044 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.402374
G1 F10015.19
G1 X92.665 Y158.156 E.004
G2 X92.2 Y159.719 I2.395 J1.563 E.04846
G1 X92.201 Y191.765 E.93865
G2 X95.02 Y194.5 I2.802 J-.068 E.12746
G1 X161.065 Y194.499 E1.93453
G2 X163.8 Y191.68 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93865
G2 X162.84 Y157.584 I-2.851 J.084 E.06819
; LINE_WIDTH: 0.428498
G1 F9336.644
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.476336
G1 F8306.12
G2 X162.258 Y157.106 I-4 J4.825 E.01447
G1 X161.635 Y156.314 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X160.596 Y155.264 E.04899
G1 X160.445 Y155.264 E.00502
G3 X159.497 Y156.936 I-2.471 J-.297 E.06543
G1 X156.918 Y156.936 E.08556
G2 X156.697 Y155.264 I-2.126 J-.569 E.05738
G1 X153.457 Y155.264 E.1075
G3 X152.509 Y156.936 I-2.471 J-.297 E.06543
G1 X149.93 Y156.936 E.08556
G2 X149.709 Y155.264 I-2.126 J-.569 E.05738
G1 X146.468 Y155.264 E.1075
G3 X145.52 Y156.936 I-2.471 J-.297 E.06543
G1 X142.941 Y156.936 E.08556
G2 X142.72 Y155.264 I-2.126 J-.569 E.05738
G1 X139.48 Y155.264 E.1075
G3 X138.532 Y156.936 I-2.471 J-.297 E.06543
G1 X135.953 Y156.936 E.08556
G2 X135.732 Y155.264 I-2.126 J-.569 E.05738
G1 X132.491 Y155.264 E.1075
G3 X131.544 Y156.936 I-2.471 J-.297 E.06543
G1 X128.964 Y156.936 E.08556
G2 X128.744 Y155.264 I-2.126 J-.569 E.05738
G1 X125.503 Y155.264 E.1075
G3 X124.555 Y156.936 I-2.471 J-.297 E.06543
G1 X121.976 Y156.936 E.08556
G2 X121.755 Y155.264 I-2.126 J-.569 E.05738
G1 X118.515 Y155.264 E.1075
G3 X117.567 Y156.936 I-2.471 J-.297 E.06543
G1 X114.988 Y156.936 E.08556
G2 X114.767 Y155.264 I-2.126 J-.569 E.05738
G1 X111.526 Y155.264 E.1075
G3 X110.578 Y156.936 I-2.471 J-.297 E.06543
G1 X107.999 Y156.936 E.08556
G2 X107.778 Y155.264 I-2.126 J-.569 E.05738
G1 X104.538 Y155.264 E.1075
G3 X103.59 Y156.936 I-2.471 J-.297 E.06543
G1 X101.011 Y156.936 E.08556
G2 X100.79 Y155.264 I-2.126 J-.569 E.05738
G1 X97.549 Y155.264 E.1075
G3 X96.601 Y156.936 I-2.471 J-.297 E.06543
G1 X94.973 Y156.936 E.05401
G1 X93.878 Y157.324 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.404722
G1 F9950.204
G1 X93.612 Y157.256 E.0081
; LINE_WIDTH: 0.440229
G1 F9060.958
G1 X93.586 Y157.25 E.00085
; LINE_WIDTH: 0.472425
G1 F8381.739
G1 X93.561 Y157.244 E.00092
G1 X93.398 Y157.374 E.0073
; LINE_WIDTH: 0.410473
G1 F9794.508
G2 X92.744 Y158.044 I2.394 J2.993 E.02812
; WIPE_START
G1 X93.013 Y157.729 E-.33588
G1 X93.398 Y157.374 E-.42412
; WIPE_END
G1 E-.04 F1800
G1 X94.988 Y154.9 Z11.4 F30000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.417334
G1 F9615.028
G1 X82.723 Y154.9 E.37419
G3 X79.224 Y152.237 I-.017 J-3.607 E.14424
G1 X79.131 Y151.77 E.01455
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.7628
G1 X79.108 Y60.459 E.00807
G1 X79.169 Y59.997 E.0142
G1 X79.285 Y59.564 E.01367
G1 X79.374 Y59.322 E.00788
G1 X79.474 Y59.102 E.00737
G1 X79.707 Y58.7 E.01418
G1 X79.989 Y58.331 E.01418
G1 X80.154 Y58.154 E.00737
G1 X80.331 Y57.99 E.00737
G1 X80.7 Y57.707 E.01418
G1 X80.905 Y57.579 E.00738
G1 X81.322 Y57.374 E.01417
G1 X81.763 Y57.224 E.01419
G1 X81.998 Y57.169 E.00737
G1 X82.459 Y57.108 E.01419
G1 X82.723 Y57.1 E.00807
G1 X173.307 Y57.1 E2.76371
G3 X175.08 Y57.572 I-.018 J3.642 E.05659
G1 X175.492 Y57.844 E.01506
G1 X175.846 Y58.155 E.01436
G1 X176.156 Y58.508 E.01436
G1 X176.418 Y58.9 E.01437
G1 X176.626 Y59.322 E.01436
G1 X176.777 Y59.768 E.01438
G1 X176.869 Y60.23 E.01437
G1 X176.899 Y60.68 E.01374
G1 X176.9 Y151.277 E2.76412
G3 X176.628 Y152.672 I-3.701 J.003 E.04364
G1 X176.417 Y153.1 E.01454
G1 X176.156 Y153.492 E.01438
G1 X175.846 Y153.845 E.01436
G1 X175.491 Y154.156 E.01436
G1 X175.1 Y154.418 E.01437
G1 X174.678 Y154.626 E.01436
G1 X174.232 Y154.777 E.01438
G1 X173.77 Y154.869 E.01437
G1 X173.277 Y154.9 E.01507
G1 X161.012 Y154.9 E.3742
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9615.028
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/60
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z11.4 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12275
G1 X92.584 Y159.654 E1.06455
G3 X94.954 Y157.284 I2.432 J.061 E.12267
G1 X161.045 Y157.284 E2.19239
G3 X163.416 Y159.654 I-.052 J2.423 E.12279
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10242
G1 X92.991 Y159.668 E1.06367
G3 X94.967 Y157.691 I2.022 J.045 E.10236
G1 X161.032 Y157.691 E2.19151
G3 X163.009 Y159.667 I-.038 J2.015 E.10245
G1 X163.009 Y191.733 E1.06369
G3 X161.262 Y193.692 I-2.015 J-.039 E.0948
G1 X161.119 Y193.703 E.00476
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.025 J-1.608 E.08209
G1 X93.398 Y159.681 E1.0628
G3 X94.98 Y158.098 I1.612 J.029 E.08205
G1 X161.019 Y158.098 E2.19064
G3 X162.602 Y159.68 I-.025 J1.608 E.08211
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.0579
G1 X93.79 Y159.693 E.9837
G3 X94.993 Y158.49 I1.217 J.014 E.05789
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z11.6 F30000
G1 X95.016 Y194.884 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.287 J.027 E.07907
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.546 E.12269
G3 X164.182 Y159.629 I-2.386 J2.172 E.07609
G1 X164.184 Y191.685 E1.06336
G3 X161.076 Y194.882 I-3.202 J-.004 E.16358
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23491
G1 X94.054 Y194.739 E-.15819
G1 X93.858 Y194.671 E-.0791
G1 X93.48 Y194.496 E-.15814
G1 X93.3 Y194.391 E-.07924
G1 X93.193 Y194.313 E-.05041
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z11.6 F30000
G1 X82.643 Y154.506 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.225 J.033 E.16588
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.034 J3.226 E.16586
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.226 J-.034 E.16586
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01681
G3 X79.898 Y151.31 I.56 J-2.76 E.12724
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.816 J.024 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.026 J2.817 E.14512
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.817 J-.025 E.14512
G1 X82.718 Y154.102 E3.00511
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.017 J2.424 E.11593
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.424 J-.017 E.11593
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20086
G1 X81.778 Y153.527 E-.17958
G1 X81.361 Y153.304 E-.17934
G1 X80.996 Y153.004 E-.17968
G1 X80.962 Y152.962 E-.02055
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z11.6 F30000
G1 X95.011 Y195.291 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18424
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.705 J.035 E.08899
G1 X94.315 Y155.291 E.09213
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.008 J-4.015 E.20869
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.308 Y56.71 E3.00509
G3 X177.291 Y60.717 I-.029 J4.012 E.20791
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.616 I-2.687 J2.451 E.08578
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.123 J.044 E.0989
M73 P90 R4
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.017 J-4.424 E.22943
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.315 Y56.303 E3.00554
G3 X177.698 Y60.71 I-.037 J4.42 E.22865
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.06031
G3 X164.996 Y159.602 I-2.988 J2.729 E.09546
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19046
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.723 I4.525 J.052 E.10047
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.025 J-4.818 E.23104
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.321 Y55.911 E2.78443
G3 X178.09 Y60.703 I-.045 J4.814 E.23032
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23107
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.89 I-6.282 J6.84 E.03421
G3 X165.388 Y159.589 I-3.578 J2.887 E.09012
G1 X165.39 Y191.698 E.98661
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02283
G1 X94.539 Y196.065 E-.17632
G1 X94.254 Y196.026 E-.10925
G1 X93.696 Y195.891 E-.21812
G1 X93.425 Y195.797 E-.10918
G1 X93.16 Y195.685 E-.10927
G1 X93.125 Y195.666 E-.01503
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z11.6 F30000
G1 X93.167 Y157.579 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429066
G1 F9322.911
G3 X93.417 Y157.357 I4.662 J5.02 E.01051
; LINE_WIDTH: 0.476216
G1 F8308.424
G3 X93.742 Y157.106 I4.028 J4.855 E.0145
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402376
G1 F10015.144
G1 X93.013 Y157.728 E.00628
G2 X92.2 Y159.719 I2.003 J1.98 E.06463
G1 X92.201 Y191.765 E.93866
G2 X95.02 Y194.5 I2.802 J-.068 E.12746
G1 X161.065 Y194.499 E1.93454
G2 X163.8 Y191.681 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93864
G2 X162.84 Y157.584 I-2.842 J.079 E.06822
; LINE_WIDTH: 0.428519
G1 F9336.143
G1 X162.582 Y157.357 E.0108
; LINE_WIDTH: 0.477444
G1 F8284.931
G2 X162.251 Y157.1 I-4.118 J4.971 E.01482
G1 X162.017 Y156.762 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X160.578 Y155.308 E.06284
G1 X95.422 Y155.308 E2.00203
G1 X93.977 Y156.769 E.06312
G1 X94.175 Y157.025 E.00995
G1 X94.465 Y156.942 E.00926
G1 X94.943 Y156.892 E.01477
G1 X161.057 Y156.892 E2.03144
G1 X161.581 Y156.951 E.01621
G1 X161.819 Y157.019 E.0076
G1 X161.98 Y156.81 E.00811
G1 X161.26 Y156.533 F30000
G1 F9547.299
G1 X160.421 Y155.685 E.03665
G1 X95.579 Y155.685 E1.99236
G1 X94.74 Y156.533 E.03664
G1 X95.752 Y156.515 E.03109
G1 X161.057 Y156.515 E2.00657
G1 X161.2 Y156.528 E.00443
G1 X160.248 Y156.1 F30000
; Slow Down Start
; LINE_WIDTH: 0.49516
G1 F3000;_EXTRUDE_SET_SPEED
G1 X95.812 Y156.1 E2.37457
; Slow Down End
; WIPE_START
G1 X97.812 Y156.1 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.988 Y154.9 Z11.6 F30000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.417358
G1 F9614.408
G1 X82.723 Y154.9 E.37422
G1 X82.459 Y154.892 E.00807
G1 X81.998 Y154.831 E.01419
G1 X81.537 Y154.707 E.01455
G1 X81.317 Y154.623 E.0072
G1 X80.917 Y154.427 E.01358
G1 X80.508 Y154.156 E.01497
G1 X80.15 Y153.841 E.01454
G1 X79.98 Y153.657 E.00766
G1 X79.71 Y153.305 E.01353
G1 X79.472 Y152.892 E.01455
G1 X79.289 Y152.451 E.01455
G1 X79.171 Y152.009 E.01398
G1 X79.131 Y151.77 E.00738
G1 X79.1 Y151.277 E.01507
G1 X79.1 Y60.723 E2.76298
G1 X79.132 Y60.224 E.01525
G1 X79.171 Y59.991 E.0072
G1 X79.289 Y59.551 E.01392
G1 X79.474 Y59.102 E.01481
G1 X79.704 Y58.705 E.014
G1 X79.844 Y58.508 E.00737
G1 X80.154 Y58.154 E.01437
G1 X80.504 Y57.848 E.01418
G1 X80.705 Y57.704 E.00756
G1 X81.108 Y57.472 E.01419
G1 X81.543 Y57.291 E.01436
G1 X81.991 Y57.171 E.01417
G1 X82.459 Y57.108 E.01438
G1 X82.723 Y57.1 E.00807
G1 X173.301 Y57.1 E2.76373
G1 X173.77 Y57.131 E.01432
G1 X174.009 Y57.171 E.00739
G1 X174.457 Y57.291 E.01417
G1 X174.683 Y57.377 E.00737
G1 X175.095 Y57.579 E.014
G1 X175.496 Y57.848 E.01474
G1 X175.839 Y58.148 E.01388
G1 X176.007 Y58.327 E.00749
G1 X176.16 Y58.513 E.00737
M73 P90 R3
G1 X176.415 Y58.895 E.01401
G1 X176.628 Y59.328 E.01473
G1 X176.776 Y59.762 E.01399
G1 X176.831 Y59.998 E.00737
G1 X176.87 Y60.236 E.00737
G1 X176.899 Y60.673 E.01337
G1 X176.9 Y151.277 E2.76449
G1 X176.869 Y151.77 E.01507
G1 X176.775 Y152.237 E.01455
G1 X176.628 Y152.672 E.014
G1 X176.529 Y152.892 E.00738
G1 X176.29 Y153.305 E.01455
G1 X176.152 Y153.496 E.00719
G1 X175.852 Y153.839 E.01389
G1 X175.491 Y154.156 E.01467
G1 X175.095 Y154.42 E.01454
G1 X174.873 Y154.537 E.00765
G1 X174.463 Y154.707 E.01353
G1 X174.002 Y154.831 E.01455
G1 X173.541 Y154.892 E.01419
G1 X173.277 Y154.9 E.00807
G1 X161.012 Y154.9 E.37422
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9614.408
G1 X163.012 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/60
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z11.6 I-1.215 J-.06 P1  F30000
G1 X161.086 Y194.114 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.053 J-2.423 E.12277
G1 X92.584 Y159.676 E1.06381
G3 X94.954 Y157.284 I2.414 J.022 E.12362
G1 X161.046 Y157.284 E2.19241
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06458
G3 X161.315 Y194.095 I-2.423 J-.053 E.11381
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.683 E1.06315
G3 X94.967 Y157.691 I2.031 J.039 E.10276
G1 X161.033 Y157.691 E2.19153
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.06369
G3 X161.262 Y193.692 I-2.015 J-.039 E.0948
G1 X161.119 Y193.703 E.00476
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00042
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.025 J-1.608 E.0821
G1 X93.398 Y159.69 E1.06248
G3 X94.98 Y158.098 I1.62 J.028 E.08226
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.0821
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.696 E.98359
G3 X94.993 Y158.49 I1.224 J.017 E.05791
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z11.8 F30000
G1 X95.016 Y194.884 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.314 J.037 E.07904
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.545 E.12268
G3 X164.182 Y159.629 I-2.376 J2.168 E.07611
G1 X164.184 Y191.685 E1.06335
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18936
; WIPE_START
M73 P91 R3
G1 X94.459 Y194.836 E-.23493
G1 X94.055 Y194.739 E-.15808
G1 X93.858 Y194.671 E-.07929
G1 X93.48 Y194.496 E-.15808
G1 X93.3 Y194.391 E-.07926
G1 X93.193 Y194.313 E-.05035
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z11.8 F30000
G1 X82.643 Y154.506 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.48 E.01204
G3 X79.491 Y151.317 I.434 J-3.196 E.15251
G1 X79.491 Y60.683 E3.00649
G3 X82.683 Y57.491 I3.226 J.034 E.16586
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16588
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01681
G3 X79.898 Y151.31 I.56 J-2.76 E.12724
G1 X79.898 Y60.69 E3.00604
G3 X82.69 Y57.898 I2.817 J.025 E.14512
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.024 J2.816 E.14514
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00511
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.423 J.017 E.11593
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20086
G1 X81.778 Y153.527 E-.17962
G1 X81.361 Y153.304 E-.17935
G1 X80.996 Y153.004 E-.17966
G1 X80.962 Y152.963 E-.02051
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z11.8 F30000
G1 X95.011 Y195.291 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.733 J.046 E.08896
G1 X94.315 Y155.291 E.09212
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.005 J-4.013 E.20873
G1 X78.709 Y60.716 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.302 Y56.71 E3.00491
G3 X177.291 Y60.717 I-.026 J4.014 E.20807
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
G3 X164.589 Y159.616 I-2.682 J2.448 E.08579
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.006 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.152 J.055 E.09888
G1 X93.34 Y155.698 E.06022
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.014 J-4.421 E.22947
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.309 Y56.303 E3.00536
G3 X177.698 Y60.71 I-.034 J4.423 E.2288
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.987 J2.729 E.09547
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.066 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X90.612 Y191.812 I.022 J-4.414 E.20822
G1 X90.61 Y159.702 E.98664
G3 X91.775 Y156.722 I4.556 J.064 E.10045
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78368
G3 X82.703 Y55.91 I4.815 J.022 E.23107
G1 X173.316 Y55.911 E2.78426
G3 X178.09 Y60.703 I-.042 J4.816 E.23046
G1 X178.09 Y151.297 E2.78368
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.28 J6.838 E.03422
G3 X165.388 Y159.589 I-3.377 J2.811 E.09027
G1 X165.39 Y191.698 E.98661
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X95.002 Y196.09 E-.02282
G1 X94.539 Y196.065 E-.17635
G1 X94.254 Y196.026 E-.10921
G1 X93.696 Y195.891 E-.21814
G1 X93.425 Y195.797 E-.10921
G1 X93.128 Y195.66 E-.12426
; WIPE_END
G1 E-.04 F1800
G1 X93.136 Y188.027 Z11.8 F30000
G1 X93.167 Y157.579 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429127
G1 F9321.444
G3 X93.418 Y157.357 I4.651 J5.008 E.01056
; LINE_WIDTH: 0.476361
G1 F8305.639
G3 X93.742 Y157.106 I4.015 J4.845 E.01446
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.40239
G1 F10014.747
G1 X92.993 Y157.748 E.00709
G2 X92.2 Y159.719 I2.026 J1.961 E.06382
G1 X92.201 Y191.765 E.93869
G2 X95.02 Y194.5 I2.802 J-.067 E.12747
G1 X161.065 Y194.499 E1.93461
G2 X163.8 Y191.68 I-.067 J-2.802 E.12746
G1 X163.799 Y159.635 E.93868
G2 X162.727 Y157.482 I-2.873 J.087 E.0727
; LINE_WIDTH: 0.44286
G1 F9001.366
G2 X162.54 Y157.323 I-3.304 J3.699 E.00799
; LINE_WIDTH: 0.482571
G1 F8188.321
G1 X162.251 Y157.1 E.01307
G1 X95.752 Y156.1 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49517
G1 F7960.199
G1 X160.188 Y156.1 E2.37462
G1 X160.421 Y155.685 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X95.579 Y155.685 E1.99236
G1 X94.74 Y156.533 E.03664
G1 X95.752 Y156.515 E.03109
G1 X161.253 Y156.527 E2.01261
G1 X160.463 Y155.728 E.03451
G1 X160.578 Y155.308 F30000
G1 F9547.299
G1 X95.422 Y155.308 E2.00203
G1 X93.977 Y156.769 E.06312
M73 P92 R3
G1 X94.175 Y157.025 E.00995
G1 X94.469 Y156.942 E.00939
G1 X94.943 Y156.892 E.01466
G1 X161.053 Y156.892 E2.03133
G3 X161.817 Y157.021 I-.003 J2.343 E.02392
G1 X162.017 Y156.762 E.01003
G1 X160.62 Y155.351 E.061
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417385
G1 F9613.727
G1 X173.277 Y154.9 E.37425
G1 X173.541 Y154.892 E.00807
G1 X173.996 Y154.831 E.014
G1 X174.457 Y154.709 E.01455
G1 X174.898 Y154.526 E.01456
G1 X175.105 Y154.414 E.00719
G1 X175.487 Y154.16 E.01399
G1 X175.85 Y153.841 E.01474
G1 X176.01 Y153.669 E.00719
G1 X176.29 Y153.305 E.014
G1 X176.529 Y152.892 E.01456
G1 X176.711 Y152.451 E.01455
G1 X176.829 Y152.008 E.01399
G1 X176.868 Y151.776 E.00719
G1 X176.9 Y151.277 E.01526
G1 X176.9 Y60.723 E2.76317
G1 X176.868 Y60.224 E.01525
G1 X176.779 Y59.774 E.014
G1 X176.71 Y59.549 E.00718
G1 X176.622 Y59.314 E.00765
G1 X176.421 Y58.906 E.0139
G1 X176.145 Y58.495 E.01508
G1 X175.844 Y58.153 E.01393
G1 X175.504 Y57.854 E.01379
G1 X175.293 Y57.702 E.00796
G1 X174.897 Y57.474 E.01392
G1 X174.669 Y57.371 E.00763
G1 X174.226 Y57.221 E.01429
G1 X173.77 Y57.131 E.01418
G1 X173.296 Y57.1 E.01449
G1 X82.723 Y57.1 E2.76375
G1 X82.23 Y57.131 E.01506
G1 X81.989 Y57.171 E.00747
G1 X81.543 Y57.291 E.01409
G1 X81.314 Y57.378 E.00745
G1 X80.905 Y57.58 E.01392
G1 X80.504 Y57.848 E.01473
G1 X80.157 Y58.152 E.01407
G1 X79.993 Y58.327 E.00731
G1 X79.84 Y58.514 E.00737
G1 X79.585 Y58.895 E.014
G1 X79.371 Y59.331 E.01482
G1 X79.224 Y59.763 E.01392
G1 X79.169 Y59.998 E.00737
G1 X79.129 Y60.247 E.0077
G1 X79.101 Y60.673 E.01305
G1 X79.1 Y151.277 E2.76469
G1 X79.131 Y151.77 E.01507
G1 X79.224 Y152.237 E.01455
G1 X79.372 Y152.672 E.014
G1 X79.469 Y152.887 E.00719
G1 X79.707 Y153.3 E.01456
G1 X79.998 Y153.678 E.01455
G1 X80.322 Y154.002 E.01399
G1 X80.504 Y154.152 E.00719
G1 X80.9 Y154.417 E.01455
G1 X81.328 Y154.628 E.01454
G1 X81.762 Y154.776 E.01401
G1 X81.997 Y154.831 E.00736
G1 X82.459 Y154.892 E.01419
G1 X82.723 Y154.9 E.00807
G1 X94.988 Y154.9 E.37424
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9613.727
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/60
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z11.8 I-.607 J1.055 P1  F30000
G1 X161.086 Y194.114 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19242
G3 X92.584 Y191.746 I.049 J-2.419 E.12282
G1 X92.584 Y159.654 E1.06456
G3 X94.954 Y157.284 I2.431 J.061 E.12266
G1 X161.046 Y157.284 E2.19242
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.724 E1.06383
G3 X161.315 Y194.095 I-2.422 J-.03 E.11455
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19154
G3 X92.991 Y191.733 I.035 J-2.011 E.10248
G1 X92.991 Y159.667 E1.06368
G3 X94.967 Y157.691 I2.021 J.045 E.10236
G1 X161.033 Y157.691 E2.19154
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.717 E1.06316
G3 X161.262 Y193.692 I-2.015 J-.023 E.09534
G1 X161.119 Y193.703 E.00476
G1 X161.033 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00042
G1 X94.98 Y193.302 E2.19066
G3 X93.398 Y191.72 I.022 J-1.604 E.08215
G1 X93.398 Y159.68 E1.0628
G3 X94.98 Y158.098 I1.611 J.029 E.08205
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.0821
G1 X162.602 Y191.71 E1.06249
G3 X161.209 Y193.288 I-1.608 J-.016 E.07612
G1 X161.092 Y193.297 E.00388
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02843
G3 X93.79 Y191.707 I.008 J-1.211 E.05796
G1 X93.79 Y159.693 E.98369
G3 X94.993 Y158.49 I1.216 J.013 E.05789
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.704 E.9836
G3 X161.067 Y192.908 I-1.215 J-.009 E.05617
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z12 F30000
G1 X95.016 Y194.884 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.715 E1.06352
G3 X92.661 Y157.542 I3.286 J.026 E.07907
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17223
G1 X163.343 Y157.545 E.12267
G3 X164.182 Y159.629 I-2.368 J2.165 E.07612
G1 X164.184 Y191.685 E1.06335
G3 X161.076 Y194.882 I-3.202 J-.004 E.16359
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23491
G1 X94.055 Y194.739 E-.15815
G1 X93.858 Y194.671 E-.07923
G1 X93.48 Y194.496 E-.15816
G1 X93.3 Y194.391 E-.07909
G1 X93.19 Y194.316 E-.05045
; WIPE_END
G1 E-.04 F1800
G1 X91.236 Y186.938 Z12 F30000
G1 X82.643 Y154.506 Z12
G1 Z11.6
G1 E.8 F1800
G1 F8843.478
G1 X82.282 Y154.48 E.01203
G3 X79.491 Y151.318 I.435 J-3.196 E.15247
G1 X79.491 Y60.683 E3.00652
G3 X82.683 Y57.491 I3.226 J.033 E.16587
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.034 J3.226 E.16587
G1 X176.509 Y151.317 E3.00649
G3 X173.318 Y154.509 I-3.225 J-.033 E.16584
G1 X82.703 Y154.509 E3.00586
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01681
G3 X79.898 Y151.311 I.561 J-2.761 E.12721
G1 X79.898 Y60.69 E3.00605
G3 X82.69 Y57.898 I2.817 J.025 E.14513
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.025 J2.817 E.14513
G1 X176.102 Y151.31 E3.00604
G3 X173.311 Y154.102 I-2.816 J-.024 E.14512
G1 X82.718 Y154.102 E3.00513
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.017 J-2.423 E.11593
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.423 J.017 E.11593
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.017 J2.423 E.11593
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78227
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20088
G1 X81.778 Y153.527 E-.17944
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.004 E-.1796
G1 X80.962 Y152.963 E-.02056
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z12 F30000
G1 X95.011 Y195.291 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06407
G3 X92.362 Y157.265 I3.704 J.035 E.08899
G1 X94.315 Y155.291 E.09213
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.284 I.007 J-4.014 E.20871
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.297 Y56.71 E3.00473
G3 X177.291 Y60.717 I-.02 J4.014 E.20826
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09224
G3 X164.589 Y159.616 I-2.669 J2.444 E.08581
G1 X164.591 Y191.689 E1.06395
G3 X161.088 Y195.289 I-3.611 J-.01 E.18423
G1 X95.071 Y195.291 E2.18991
G1 X95.007 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.122 J.044 E.09891
G1 X93.34 Y155.698 E.06023
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.015 J-4.423 E.22945
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.304 Y56.302 E3.00517
G3 X177.698 Y60.71 I-.028 J4.422 E.229
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.97 J2.722 E.09549
G1 X164.998 Y191.694 E1.06454
G3 X161.1 Y195.696 I-4.02 J-.016 E.20488
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.067 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.539 Y196.063 E.01425
G3 X90.612 Y191.811 I.485 J-4.388 E.19396
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.722 I4.525 J.052 E.10048
G1 X92.4 Y156.09 E.02733
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.023 J-4.817 E.23106
G1 X77.91 Y60.703 E2.78367
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.31 Y55.91 E2.78409
G3 X178.09 Y60.703 I-.036 J4.816 E.23064
G1 X178.09 Y151.297 E2.78367
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.286 J6.844 E.03423
G3 X165.388 Y159.589 I-3.537 J2.871 E.09014
G1 X165.39 Y191.698 E.98661
M73 P93 R3
G3 X161.111 Y196.088 I-4.414 J-.022 E.20821
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.063 E-.199
G1 X94.254 Y196.026 E-.10917
G1 X93.973 Y195.968 E-.10921
G1 X93.425 Y195.797 E-.21818
G1 X93.16 Y195.685 E-.10916
G1 X93.125 Y195.666 E-.01528
; WIPE_END
G1 E-.04 F1800
G1 X93.133 Y188.034 Z12 F30000
G1 X93.167 Y157.579 Z12
G1 Z11.6
M73 P93 R2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429114
G1 F9321.742
G3 X93.418 Y157.357 I4.674 J5.034 E.01053
; LINE_WIDTH: 0.47628
G1 F8307.182
G3 X93.742 Y157.106 I4.023 J4.853 E.01448
G1 X93.167 Y157.579 F30000
; LINE_WIDTH: 0.402373
G1 F10015.214
G1 X93.017 Y157.725 E.00616
G2 X92.2 Y159.719 I1.996 J1.981 E.06477
G1 X92.201 Y191.765 E.93865
G2 X95.02 Y194.5 I2.803 J-.069 E.12745
G1 X161.065 Y194.499 E1.93453
G2 X163.8 Y191.68 I-.068 J-2.802 E.12745
G1 X163.799 Y159.635 E.93864
G2 X162.839 Y157.584 I-2.842 J.079 E.06823
; LINE_WIDTH: 0.428583
G1 F9334.574
G1 X162.582 Y157.357 E.01079
; LINE_WIDTH: 0.476362
G1 F8305.609
G2 X162.258 Y157.106 I-4.014 J4.844 E.01446
G1 X95.752 Y156.1 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49516
G1 F7960.375
G1 X160.188 Y156.1 E2.37458
G1 X160.421 Y155.685 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X95.579 Y155.685 E1.99236
G1 X94.74 Y156.533 E.03664
G1 X95.752 Y156.515 E.03109
G1 X161.253 Y156.527 E2.01261
G1 X160.463 Y155.728 E.03451
G1 X160.578 Y155.308 F30000
G1 F9547.299
G1 X95.422 Y155.308 E2.00203
G1 X93.977 Y156.769 E.06312
G1 X94.175 Y157.025 E.00995
G1 X94.468 Y156.942 E.00937
G1 X94.943 Y156.892 E.01466
G1 X161.053 Y156.892 E2.03133
G3 X161.819 Y157.033 I.014 J2.079 E.02409
G1 X162.023 Y156.769 E.01024
G1 X160.621 Y155.351 E.06128
G1 X161.012 Y154.9 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.417411
G1 F9613.061
G1 X173.277 Y154.9 E.37427
G1 X173.549 Y154.891 E.0083
G1 X173.991 Y154.833 E.01359
G1 X174.457 Y154.709 E.01473
G1 X174.898 Y154.526 E.01455
G1 X175.296 Y154.296 E.01405
G1 X175.491 Y154.156 E.00733
G1 X175.85 Y153.841 E.01454
G1 X176.152 Y153.496 E.01401
G1 X176.29 Y153.305 E.00718
G1 X176.529 Y152.892 E.01456
G1 X176.713 Y152.444 E.01478
G1 X176.829 Y152.008 E.01377
G1 X176.868 Y151.776 E.00719
G1 X176.9 Y151.277 E.01526
G1 X176.9 Y60.723 E2.76336
G1 X176.868 Y60.224 E.01525
G1 X176.779 Y59.774 E.01401
G1 X176.709 Y59.543 E.00737
G1 X176.623 Y59.317 E.00737
G1 X176.421 Y58.906 E.01399
G1 X176.147 Y58.498 E.01498
G1 X175.844 Y58.153 E.01401
G1 X175.496 Y57.848 E.01413
G1 X175.295 Y57.704 E.00755
G1 X174.898 Y57.474 E.014
G1 X174.457 Y57.291 E.01455
G1 X174.007 Y57.17 E.01423
G1 X173.541 Y57.108 E.01433
G1 X173.291 Y57.1 E.00766
G1 X82.723 Y57.1 E2.76378
G1 X82.23 Y57.131 E.01507
G1 X81.99 Y57.171 E.00744
G1 X81.548 Y57.289 E.01394
G1 X81.096 Y57.478 E.01496
G1 X80.705 Y57.704 E.01377
G1 X80.508 Y57.844 E.00737
G1 X80.158 Y58.151 E.01424
G1 X79.994 Y58.327 E.00732
G1 X79.84 Y58.513 E.00737
G1 X79.586 Y58.895 E.014
G1 X79.371 Y59.33 E.01481
G1 X79.224 Y59.763 E.01394
G1 X79.169 Y59.998 E.00736
G1 X79.129 Y60.244 E.00762
G1 X79.101 Y60.673 E.01314
G1 X79.1 Y151.277 E2.76488
G1 X79.131 Y151.77 E.01507
G1 X79.171 Y152.009 E.00739
G1 X79.289 Y152.451 E.01399
G1 X79.471 Y152.892 E.01455
G1 X79.711 Y153.307 E.01461
G1 X79.986 Y153.664 E.01377
G1 X80.151 Y153.842 E.00741
G1 X80.508 Y154.156 E.0145
G1 X80.912 Y154.424 E.0148
G1 X81.318 Y154.624 E.01381
G1 X81.543 Y154.709 E.00732
G1 X81.998 Y154.831 E.01437
G1 X82.458 Y154.892 E.01418
G1 X82.723 Y154.9 E.00808
G1 X94.988 Y154.9 E.37427
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9613.061
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/60
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z12 I-.607 J1.055 P1  F30000
G1 X161.086 Y194.114 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X161.046 Y194.116 E.00131
G1 X94.954 Y194.116 E2.19241
G3 X92.584 Y191.746 I.053 J-2.423 E.12277
G1 X92.584 Y159.654 E1.06457
G3 X94.954 Y157.284 I2.443 J.073 E.1225
G1 X161.046 Y157.284 E2.19241
G3 X163.416 Y159.654 I-.053 J2.423 E.12276
G1 X163.416 Y191.746 E1.06457
G3 X161.315 Y194.095 I-2.423 J-.053 E.11382
G1 X161.146 Y194.109 E.00564
G1 X161.059 Y193.707 F30000
G1 F8843.478
G1 X161.033 Y193.709 E.00087
G1 X94.967 Y193.709 E2.19153
G3 X92.991 Y191.733 I.039 J-2.015 E.10243
G1 X92.991 Y159.667 E1.06369
G3 X94.967 Y157.691 I2.032 J.056 E.10222
G1 X161.033 Y157.691 E2.19153
G3 X163.009 Y159.667 I-.039 J2.015 E.10243
G1 X163.009 Y191.733 E1.06369
G3 X161.262 Y193.692 I-2.015 J-.039 E.09481
G1 X161.119 Y193.703 E.00476
G1 X161.032 Y193.301 F30000
G1 F8843.478
G1 X161.02 Y193.302 E.00043
G1 X94.98 Y193.302 E2.19065
G3 X93.398 Y191.72 I.025 J-1.608 E.0821
G1 X93.398 Y159.68 E1.0628
G3 X94.98 Y158.098 I1.62 J.038 E.08194
G1 X161.02 Y158.098 E2.19065
G3 X162.602 Y159.68 I-.025 J1.608 E.0821
G1 X162.602 Y191.72 E1.06281
G3 X161.209 Y193.288 I-1.608 J-.025 E.0758
G1 X161.092 Y193.297 E.00387
M204 S250
G1 X161.007 Y192.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.05791
G1 X93.79 Y159.693 E.98369
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.98369
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.438 Y193.143 Z12.2 F30000
G1 X95.016 Y194.884 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.818 Y191.776 I.003 J-3.202 E.1636
G1 X91.816 Y159.716 E1.06351
G3 X92.661 Y157.542 I3.314 J.037 E.07904
G1 X95.258 Y154.916 E.12251
G1 X160.742 Y154.916 E2.17222
G1 X163.343 Y157.546 E.12268
G3 X164.182 Y159.629 I-2.387 J2.172 E.07609
G1 X164.182 Y191.776 E1.06637
G3 X161.076 Y194.882 I-3.187 J-.081 E.16074
G1 X95.076 Y194.884 E2.18936
; WIPE_START
G1 X94.459 Y194.836 E-.23505
G1 X94.055 Y194.739 E-.15805
G1 X93.858 Y194.671 E-.07918
G1 X93.48 Y194.496 E-.15828
G1 X93.3 Y194.391 E-.07897
G1 X93.193 Y194.313 E-.05047
; WIPE_END
G1 E-.04 F1800
G1 X91.238 Y186.935 Z12.2 F30000
G1 X82.643 Y154.506 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F8843.478
G1 X82.281 Y154.48 E.01204
G3 X79.491 Y151.317 I.434 J-3.196 E.15252
G1 X79.491 Y60.683 E3.00648
G3 X82.683 Y57.491 I3.225 J.033 E.16587
G1 X173.317 Y57.491 E3.00649
G3 X176.509 Y60.683 I-.033 J3.225 E.16587
G1 X176.509 Y151.317 E3.00649
G3 X173.317 Y154.509 I-3.225 J-.033 E.16588
G1 X82.703 Y154.509 E3.00582
G1 X82.658 Y154.099 F30000
G1 F8843.478
G1 X82.154 Y154.046 E.01682
G3 X79.898 Y151.31 I.56 J-2.76 E.12724
G1 X79.898 Y60.69 E3.00603
G3 X82.69 Y57.898 I2.817 J.025 E.14514
G1 X173.31 Y57.898 E3.00604
G3 X176.102 Y60.69 I-.025 J2.817 E.14513
G1 X176.102 Y151.31 E3.00604
G3 X173.31 Y154.102 I-2.816 J-.024 E.14514
G1 X82.718 Y154.102 E3.00511
M204 S250
G1 X82.696 Y153.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G3 X80.29 Y151.303 I.016 J-2.422 E.11595
G1 X80.29 Y60.696 E2.7841
G3 X82.696 Y58.29 I2.423 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.423 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20087
G1 X81.778 Y153.527 E-.17961
G1 X81.361 Y153.304 E-.17944
G1 X80.996 Y153.004 E-.17957
G1 X80.962 Y152.963 E-.0205
; WIPE_END
G1 E-.04 F1800
G1 X83.366 Y160.206 Z12.2 F30000
G1 X95.011 Y195.291 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G3 X91.411 Y191.788 I.01 J-3.611 E.18425
G1 X91.409 Y159.711 E1.06406
G3 X92.362 Y157.266 I3.734 J.046 E.08896
G1 X94.315 Y155.291 E.09213
G1 X82.716 Y155.291 E.38474
G3 X78.709 Y151.283 I.006 J-4.014 E.20872
G1 X78.709 Y60.717 E3.00427
G3 X82.716 Y56.709 I4.013 J.005 E.20873
G1 X173.292 Y56.709 E3.00454
G3 X177.291 Y60.717 I-.014 J4.013 E.20845
G1 X177.291 Y151.283 E3.00427
G3 X173.284 Y155.291 I-4.013 J-.005 E.20873
G1 X161.685 Y155.291 E.38474
G1 X163.641 Y157.268 E.09225
M73 P94 R2
G3 X164.589 Y159.615 I-2.687 J2.451 E.08578
G1 X164.589 Y191.788 E1.06721
G3 X161.088 Y195.289 I-3.594 J-.093 E.18116
G1 X95.071 Y195.291 E2.18991
G1 X95.007 Y195.698 F30000
G1 F8843.478
G3 X91.004 Y191.8 I.016 J-4.02 E.20489
G1 X91.002 Y159.706 E1.06461
G3 X92.063 Y156.989 I4.153 J.055 E.09888
G1 X93.34 Y155.698 E.06024
G1 X82.71 Y155.698 E.35262
G3 X78.302 Y151.29 I.015 J-4.422 E.22946
G1 X78.302 Y60.71 E3.00472
G3 X82.71 Y56.302 I4.422 J.014 E.22947
G1 X173.298 Y56.302 E3.00499
G3 X177.698 Y60.71 I-.022 J4.422 E.22919
G1 X177.698 Y151.29 E3.00472
G3 X173.29 Y155.698 I-4.422 J-.014 E.22947
G1 X162.66 Y155.698 E.35262
G1 X163.939 Y156.99 E.0603
G3 X164.996 Y159.602 I-2.988 J2.73 E.09547
G1 X164.996 Y191.799 E1.06805
G3 X161.1 Y195.696 I-4.002 J-.105 E.20159
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.067 Y195.698 E2.19045
M204 S250
G1 X95.002 Y196.09 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.539 Y196.063 E.01425
G3 X90.612 Y191.812 I.485 J-4.388 E.19395
G1 X90.61 Y159.702 E.98663
G3 X91.775 Y156.723 I4.556 J.064 E.10045
G1 X92.4 Y156.09 E.02734
G1 X82.703 Y156.09 E.29796
G3 X77.91 Y151.297 I.023 J-4.816 E.23106
G1 X77.91 Y60.703 E2.78367
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.305 Y55.91 E2.78392
G3 X178.09 Y60.703 I-.03 J4.816 E.23081
G1 X178.09 Y151.297 E2.78367
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.284 J6.842 E.03423
G3 X165.388 Y159.589 I-3.578 J2.886 E.09011
G1 X165.388 Y191.811 E.99008
G3 X161.111 Y196.088 I-4.394 J-.117 E.20496
G1 X95.062 Y196.09 E2.02951
; WIPE_START
M204 S10000
G1 X94.539 Y196.063 E-.19904
G1 X94.254 Y196.026 E-.10925
G1 X93.696 Y195.891 E-.21804
G1 X93.425 Y195.797 E-.10923
G1 X93.16 Y195.685 E-.10913
G1 X93.125 Y195.666 E-.01531
; WIPE_END
G1 E-.04 F1800
G1 X93.047 Y188.034 Z12.2 F30000
G1 X92.744 Y158.043 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.40218
G1 F10020.61
G1 X92.652 Y158.177 E.00474
G2 X92.2 Y159.72 I2.402 J1.541 E.04771
G1 X92.201 Y191.765 E.93814
G2 X95.02 Y194.5 I2.802 J-.068 E.12739
G1 X161.065 Y194.499 E1.93348
G2 X163.799 Y191.753 I-.067 J-2.8 E.12526
G1 X163.799 Y159.635 E.94025
G2 X162.703 Y157.46 I-2.885 J.089 E.07361
; LINE_WIDTH: 0.441048
G1 F9042.325
G1 X162.58 Y157.359 E.00516
; LINE_WIDTH: 0.486264
G1 F8120.113
G1 X162.458 Y157.257 E.00575
G2 X162.257 Y157.107 I-3.143 J3.988 E.00905
; WIPE_START
G1 X162.458 Y157.257 E-.4648
G1 X162.58 Y157.359 E-.2952
; WIPE_END
G1 E-.04 F1800
G1 X161.012 Y154.9 Z12.2 F30000
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.417436
G1 F9612.427
G1 X173.277 Y154.9 E.3743
G1 X173.541 Y154.892 E.00807
G1 X174.002 Y154.831 E.01419
G1 X174.463 Y154.707 E.01455
G1 X174.886 Y154.532 E.01398
G1 X175.095 Y154.42 E.00722
G1 X175.492 Y154.156 E.01455
G1 X175.85 Y153.841 E.01455
G1 X176.01 Y153.669 E.00719
G1 X176.29 Y153.305 E.014
G1 X176.529 Y152.892 E.01457
G1 X176.628 Y152.672 E.00736
G1 X176.776 Y152.237 E.014
G1 X176.868 Y151.776 E.01437
G1 X176.9 Y151.277 E.01525
G1 X176.9 Y60.723 E2.76355
G1 X176.868 Y60.224 E.01525
G1 X176.829 Y59.991 E.00723
G1 X176.709 Y59.543 E.01415
G1 X176.623 Y59.317 E.00738
G1 X176.421 Y58.905 E.01399
G1 X176.156 Y58.508 E.01456
G1 X175.845 Y58.154 E.0144
G1 X175.497 Y57.848 E.01413
G1 X175.294 Y57.703 E.00762
G1 X174.892 Y57.471 E.01415
G1 X174.457 Y57.291 E.01437
G1 X174.008 Y57.171 E.01418
G1 X173.541 Y57.108 E.01437
G1 X173.285 Y57.1 E.00783
G1 X82.723 Y57.1 E2.7638
G1 X82.23 Y57.131 E.01507
G1 X81.991 Y57.171 E.00741
G1 X81.543 Y57.291 E.01415
G1 X81.317 Y57.377 E.00737
G1 X80.906 Y57.579 E.01399
G1 X80.504 Y57.848 E.01476
G1 X80.158 Y58.151 E.01402
G1 X79.993 Y58.327 E.00735
G1 X79.84 Y58.513 E.00737
G1 X79.586 Y58.895 E.014
G1 X79.372 Y59.328 E.01474
G1 X79.224 Y59.762 E.014
G1 X79.169 Y59.998 E.00738
G1 X79.13 Y60.236 E.00739
G1 X79.101 Y60.673 E.01337
G1 X79.1 Y151.277 E2.76506
G1 X79.131 Y151.77 E.01507
G1 X79.224 Y152.237 E.01455
G1 X79.293 Y152.463 E.0072
G1 X79.469 Y152.887 E.01399
G1 X79.707 Y153.3 E.01456
G1 X79.998 Y153.678 E.01456
G1 X80.159 Y153.85 E.0072
G1 X80.504 Y154.152 E.01399
G1 X80.9 Y154.418 E.01456
G1 X81.328 Y154.628 E.01454
G1 X81.763 Y154.776 E.01401
G1 X81.992 Y154.829 E.00718
G1 X82.459 Y154.892 E.01437
G1 X82.723 Y154.9 E.00808
G1 X94.988 Y154.9 E.37429
; WIPE_START
G1 X92.988 Y154.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.752 Y156.1 Z12.2 F30000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49517
G1 F7960.199
G1 X160.188 Y156.1 E2.37463
G1 X160.421 Y155.685 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X95.579 Y155.685 E1.99236
G1 X94.74 Y156.533 E.03664
G1 X95.752 Y156.515 E.03109
G1 X161.253 Y156.527 E2.01261
G1 X160.463 Y155.728 E.03451
G1 X160.578 Y155.308 F30000
G1 F9547.299
G1 X95.422 Y155.308 E2.00203
G1 X94.016 Y156.729 E.06141
G1 X94.31 Y156.848 E.00974
G1 X94.355 Y156.972 E.00405
G1 X94.923 Y156.893 E.01762
G1 X95.752 Y156.892 E.02548
G1 X161.053 Y156.892 E2.00646
G3 X161.823 Y157.034 I.013 J2.091 E.0242
G1 X162.022 Y156.767 E.0102
G1 X160.62 Y155.351 E.06122
; WIPE_START
G1 X162.022 Y156.767 E-.75709
G1 X162.017 Y156.774 E-.00291
; WIPE_END
G1 E-.04 F1800
G1 X154.385 Y156.835 Z12.2 F30000
G1 X93.878 Y157.324 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405005
G1 F9942.42
G1 X93.612 Y157.256 E.00811
; LINE_WIDTH: 0.440472
G1 F9055.421
G1 X93.586 Y157.25 E.00085
; LINE_WIDTH: 0.472415
G1 F8381.938
G1 X93.561 Y157.244 E.00092
G1 X93.398 Y157.374 E.0073
; LINE_WIDTH: 0.410364
G1 F9797.421
G2 X92.744 Y158.043 I2.377 J2.979 E.02809
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9797.421
G1 X92.994 Y157.748 E-.31365
G1 X93.398 Y157.374 E-.44635
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/60
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 8
G17
G3 Z12.2 I-.566 J1.077 P1  F30000
G1 X161.007 Y192.91 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X94.993 Y192.91 E2.02842
G3 X93.79 Y191.707 I.012 J-1.215 E.0579
G1 X93.79 Y159.693 E.98371
G3 X94.993 Y158.49 I1.224 J.021 E.0578
G1 X161.007 Y158.49 E2.02842
G3 X162.21 Y159.693 I-.012 J1.215 E.05791
G1 X162.21 Y191.707 E.9837
G3 X161.067 Y192.908 I-1.215 J-.012 E.05607
; WIPE_START
M204 S10000
G1 X159.067 Y192.908 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.276 Y189.423 Z12.4 F30000
G1 X82.696 Y153.71 Z12.4
G1 Z12
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X80.29 Y151.304 I.016 J-2.422 E.11594
G1 X80.29 Y60.696 E2.78411
G3 X82.696 Y58.29 I2.422 J.016 E.11594
G1 X173.304 Y58.29 E2.7841
G3 X175.71 Y60.696 I-.016 J2.422 E.11594
G1 X175.71 Y151.304 E2.7841
G3 X173.304 Y153.71 I-2.422 J-.016 E.11594
G1 X82.756 Y153.71 E2.78226
; WIPE_START
M204 S10000
G1 X82.23 Y153.664 E-.20088
G1 X81.778 Y153.527 E-.17955
G1 X81.361 Y153.304 E-.17953
G1 X80.996 Y153.004 E-.17957
G1 X80.962 Y152.962 E-.02047
; WIPE_END
G1 E-.04 F1800
G1 X83.324 Y160.22 Z12.4 F30000
G1 X95.002 Y196.09 Z12.4
G1 Z12
M73 P95 R2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X94.539 Y196.063 E.01425
G3 X90.612 Y191.811 I.485 J-4.388 E.19395
G1 X90.61 Y159.703 E.98662
G3 X91.775 Y156.722 I4.557 J.064 E.10046
G1 X92.4 Y156.09 E.02733
G1 X82.704 Y156.09 E.29795
G3 X77.91 Y151.297 I.022 J-4.815 E.23108
G1 X77.91 Y60.703 E2.78367
G3 X82.703 Y55.91 I4.815 J.022 E.23108
G1 X173.299 Y55.91 E2.78376
G3 X178.09 Y60.703 I-.025 J4.815 E.23099
G1 X178.09 Y151.297 E2.78367
G3 X173.297 Y156.09 I-4.815 J-.022 E.23108
G1 X163.6 Y156.09 E.29796
G3 X164.373 Y156.891 I-6.268 J6.827 E.03423
G3 X165.388 Y159.588 I-3.579 J2.887 E.09007
G1 X165.39 Y191.698 E.98664
G3 X161.112 Y196.088 I-4.414 J-.022 E.20821
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X95.062 Y196.09 E2.02952
; WIPE_START
M204 S10000
G1 X94.539 Y196.063 E-.19903
G1 X94.254 Y196.026 E-.10929
G1 X93.696 Y195.891 E-.21809
G1 X93.425 Y195.797 E-.10913
G1 X93.127 Y195.66 E-.12446
; WIPE_END
G1 E-.04 F1800
G1 X100.76 Y195.641 Z12.4 F30000
G1 X162.766 Y195.486 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X164.776 Y193.476 E.08735
G1 X165.071 Y192.648
G1 X161.957 Y195.762 E.13532
G1 X161.325 Y195.86
G1 X165.165 Y192.02 E.16687
G1 X165.183 Y191.469
G1 X160.771 Y195.881 E.19169
G1 X160.238 Y195.881
G1 X165.183 Y190.936 E.21486
G1 X165.183 Y190.403
G1 X159.705 Y195.881 E.23804
G1 X159.171 Y195.881
G1 X165.183 Y189.87 E.26121
G1 X165.182 Y189.336
G1 X162.321 Y192.198 E.12435
G1 X162.417 Y191.568
G1 X165.182 Y188.803 E.12016
G1 X165.182 Y188.27
G1 X162.417 Y191.035 E.12015
G1 X162.417 Y190.502
G1 X165.182 Y187.737 E.12015
G1 X165.182 Y187.204
G1 X162.417 Y189.969 E.12015
G1 X162.417 Y189.435
G1 X165.182 Y186.67 E.12015
G1 X165.182 Y186.137
G1 X162.417 Y188.902 E.12015
G1 X162.417 Y188.369
G1 X165.182 Y185.604 E.12015
G1 X165.182 Y185.071
G1 X162.417 Y187.836 E.12015
G1 X162.417 Y187.302
G1 X165.182 Y184.537 E.12014
G1 X165.182 Y184.004
G1 X162.417 Y186.769 E.12014
G1 X162.417 Y186.236
G1 X165.182 Y183.471 E.12014
M73 P95 R1
G1 X165.182 Y182.938
G1 X162.417 Y185.702 E.12014
G1 X162.417 Y185.169
G1 X165.182 Y182.405 E.12014
G1 X165.182 Y181.871
G1 X162.417 Y184.636 E.12014
G1 X162.417 Y184.103
G1 X165.182 Y181.338 E.12014
G1 X165.182 Y180.805
G1 X162.417 Y183.569 E.12013
G1 X162.417 Y183.036
G1 X165.182 Y180.272 E.12013
G1 X165.182 Y179.738
G1 X162.417 Y182.503 E.12013
G1 X162.417 Y181.97
G1 X165.182 Y179.205 E.12013
G1 X165.182 Y178.672
G1 X162.417 Y181.436 E.12013
G1 X162.417 Y180.903
G1 X165.182 Y178.139 E.12013
G1 X165.182 Y177.606
G1 X162.417 Y180.37 E.12013
G1 X162.417 Y179.837
G1 X165.182 Y177.072 E.12012
G1 X165.182 Y176.539
G1 X162.417 Y179.303 E.12012
G1 X162.417 Y178.77
G1 X165.182 Y176.006 E.12012
G1 X165.182 Y175.473
G1 X162.417 Y178.237 E.12012
G1 X162.417 Y177.704
G1 X165.182 Y174.939 E.12012
G1 X165.182 Y174.406
G1 X162.417 Y177.17 E.12012
G1 X162.417 Y176.637
G1 X165.182 Y173.873 E.12012
G1 X165.182 Y173.34
G1 X162.417 Y176.104 E.12012
G1 X162.417 Y175.571
G1 X165.181 Y172.807 E.12011
G1 X165.181 Y172.273
G1 X162.417 Y175.037 E.12011
G1 X162.417 Y174.504
G1 X165.181 Y171.74 E.12011
G1 X165.181 Y171.207
G1 X162.417 Y173.971 E.12011
G1 X162.417 Y173.438
G1 X165.181 Y170.674 E.12011
G1 X165.181 Y170.14
G1 X162.417 Y172.904 E.12011
G1 X162.417 Y172.371
G1 X165.181 Y169.607 E.12011
G1 X165.181 Y169.074
G1 X162.417 Y171.838 E.1201
G1 X162.417 Y171.305
G1 X165.181 Y168.541 E.1201
G1 X165.181 Y168.007
G1 X162.417 Y170.771 E.1201
G1 X162.417 Y170.238
G1 X165.181 Y167.474 E.1201
G1 X165.181 Y166.941
G1 X162.417 Y169.705 E.1201
G1 X162.417 Y169.172
G1 X165.181 Y166.408 E.1201
G1 X165.181 Y165.875
G1 X162.417 Y168.638 E.1201
G1 X162.417 Y168.105
G1 X165.181 Y165.341 E.12009
G1 X165.181 Y164.808
G1 X162.417 Y167.572 E.12009
G1 X162.417 Y167.038
G1 X165.181 Y164.275 E.12009
G1 X165.181 Y163.742
G1 X162.417 Y166.505 E.12009
G1 X162.417 Y165.972
G1 X165.181 Y163.208 E.12009
G1 X165.181 Y162.675
G1 X162.417 Y165.439 E.12009
G1 X162.417 Y164.905
G1 X165.181 Y162.142 E.12009
G1 X165.181 Y161.609
G1 X162.417 Y164.372 E.12008
G1 X162.417 Y163.839
G1 X165.181 Y161.076 E.12008
G1 X165.181 Y160.542
G1 X162.417 Y163.306 E.12008
G1 X162.417 Y162.772
G1 X165.181 Y160.009 E.12008
G1 X165.171 Y159.486
G1 X162.417 Y162.239 E.11964
G1 X162.417 Y161.706
G1 X165.12 Y159.003 E.11745
G1 X165.022 Y158.568
G1 X162.417 Y161.173 E.11319
G1 X162.417 Y160.639
G1 X164.882 Y158.175 E.1071
G1 X164.723 Y157.8
G1 X162.417 Y160.106 E.1002
G1 X162.405 Y159.585
G1 X164.524 Y157.466 E.0921
G1 X164.31 Y157.147
G1 X162.299 Y159.158 E.08738
G1 X162.105 Y158.819
G1 X164.059 Y156.865 E.08492
G1 X163.797 Y156.593
G1 X161.829 Y158.561 E.08552
G1 X161.481 Y158.377
G1 X163.535 Y156.322 E.08929
G1 X163.273 Y156.051
G1 X161.039 Y158.285 E.09708
; WIPE_START
M204 S10000
G1 X162.453 Y156.871 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X170.044 Y156.076 Z12.4 F30000
G1 X174.962 Y155.561 Z12.4
G1 Z12
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X177.566 Y152.956 E.11318
G1 X177.794 Y152.195
G1 X174.208 Y155.781 E.15582
G1 X173.593 Y155.863
G1 X177.872 Y151.584 E.18595
G1 X177.872 Y151.05
G1 X173.04 Y155.883 E.20998
G1 X172.507 Y155.883
G1 X177.872 Y150.517 E.23316
G1 X177.872 Y149.984
G1 X175.791 Y152.065 E.09044
G1 X175.907 Y151.416
G1 X177.872 Y149.451 E.08539
G1 X177.872 Y148.917
G1 X175.917 Y150.872 E.08495
G1 X175.917 Y150.339
G1 X177.872 Y148.384 E.08495
G1 X177.872 Y147.851
G1 X175.917 Y149.806 E.08495
G1 X175.917 Y149.272
G1 X177.872 Y147.318 E.08495
G1 X177.872 Y146.784
G1 X175.917 Y148.739 E.08495
G1 X175.917 Y148.206
G1 X177.872 Y146.251 E.08495
G1 X177.872 Y145.718
G1 X175.917 Y147.673 E.08495
G1 X175.917 Y147.139
G1 X177.872 Y145.185 E.08495
G1 X177.872 Y144.651
G1 X175.917 Y146.606 E.08495
G1 X175.917 Y146.073
G1 X177.872 Y144.118 E.08495
G1 X177.872 Y143.585
G1 X175.917 Y145.54 E.08495
G1 X175.917 Y145.006
G1 X177.872 Y143.052 E.08495
G1 X177.872 Y142.518
G1 X175.917 Y144.473 E.08495
G1 X175.917 Y143.94
G1 X177.872 Y141.985 E.08495
G1 X177.872 Y141.452
G1 X175.917 Y143.407 E.08495
G1 X175.917 Y142.873
G1 X177.872 Y140.918 E.08495
G1 X177.872 Y140.385
G1 X175.917 Y142.34 E.08495
G1 X175.917 Y141.807
G1 X177.872 Y139.852 E.08495
G1 X177.872 Y139.319
G1 X175.917 Y141.274 E.08495
G1 X175.917 Y140.74
G1 X177.872 Y138.785 E.08495
G1 X177.872 Y138.252
G1 X175.917 Y140.207 E.08495
G1 X175.917 Y139.674
G1 X177.872 Y137.719 E.08495
G1 X177.872 Y137.186
G1 X175.917 Y139.141 E.08495
G1 X175.917 Y138.607
G1 X177.872 Y136.652 E.08495
G1 X177.872 Y136.119
G1 X175.917 Y138.074 E.08495
G1 X175.917 Y137.541
G1 X177.872 Y135.586 E.08495
G1 X177.872 Y135.053
G1 X175.917 Y137.008 E.08495
G1 X175.917 Y136.474
G1 X177.872 Y134.519 E.08495
G1 X177.872 Y133.986
G1 X175.917 Y135.941 E.08495
G1 X175.917 Y135.408
G1 X177.872 Y133.453 E.08495
G1 X177.872 Y132.92
G1 X175.917 Y134.874 E.08495
G1 X175.917 Y134.341
G1 X177.872 Y132.386 E.08495
G1 X177.872 Y131.853
G1 X175.917 Y133.808 E.08495
G1 X175.917 Y133.275
G1 X177.872 Y131.32 E.08495
G1 X177.872 Y130.787
G1 X175.917 Y132.741 E.08495
G1 X175.917 Y132.208
G1 X177.872 Y130.253 E.08495
G1 X177.872 Y129.72
G1 X175.917 Y131.675 E.08495
G1 X175.917 Y131.142
G1 X177.872 Y129.187 E.08495
G1 X177.872 Y128.654
G1 X175.917 Y130.608 E.08495
G1 X175.917 Y130.075
G1 X177.872 Y128.12 E.08495
G1 X177.872 Y127.587
G1 X175.917 Y129.542 E.08495
G1 X175.917 Y129.009
G1 X177.872 Y127.054 E.08495
G1 X177.872 Y126.521
G1 X175.917 Y128.475 E.08495
G1 X175.917 Y127.942
G1 X177.872 Y125.987 E.08495
G1 X177.872 Y125.454
G1 X175.917 Y127.409 E.08495
G1 X175.917 Y126.876
G1 X177.872 Y124.921 E.08495
G1 X177.872 Y124.387
G1 X175.917 Y126.342 E.08495
G1 X175.917 Y125.809
G1 X177.872 Y123.854 E.08495
G1 X177.872 Y123.321
G1 X175.917 Y125.276 E.08495
G1 X175.917 Y124.743
G1 X177.872 Y122.788 E.08495
G1 X177.872 Y122.254
G1 X175.917 Y124.209 E.08495
G1 X175.917 Y123.676
G1 X177.872 Y121.721 E.08495
G1 X177.872 Y121.188
G1 X175.917 Y123.143 E.08495
G1 X175.917 Y122.61
G1 X177.872 Y120.655 E.08495
G1 X177.872 Y120.121
G1 X175.917 Y122.076 E.08495
G1 X175.917 Y121.543
G1 X177.872 Y119.588 E.08495
G1 X177.872 Y119.055
G1 X175.917 Y121.01 E.08495
G1 X175.917 Y120.477
G1 X177.872 Y118.522 E.08495
G1 X177.872 Y117.988
G1 X175.917 Y119.943 E.08495
G1 X175.917 Y119.41
G1 X177.872 Y117.455 E.08495
G1 X177.872 Y116.922
G1 X175.917 Y118.877 E.08495
G1 X175.917 Y118.344
G1 X177.872 Y116.389 E.08495
G1 X177.872 Y115.855
G1 X175.917 Y117.81 E.08495
G1 X175.917 Y117.277
G1 X177.872 Y115.322 E.08495
G1 X177.872 Y114.789
G1 X175.917 Y116.744 E.08495
G1 X175.917 Y116.21
G1 X177.872 Y114.256 E.08495
G1 X177.872 Y113.722
G1 X175.917 Y115.677 E.08495
G1 X175.917 Y115.144
G1 X177.872 Y113.189 E.08495
G1 X177.872 Y112.656
G1 X175.917 Y114.611 E.08495
G1 X175.917 Y114.077
G1 X177.872 Y112.123 E.08495
G1 X177.872 Y111.589
G1 X175.917 Y113.544 E.08495
G1 X175.917 Y113.011
G1 X177.872 Y111.056 E.08495
G1 X177.872 Y110.523
G1 X175.917 Y112.478 E.08495
G1 X175.917 Y111.944
G1 X177.872 Y109.99 E.08495
G1 X177.872 Y109.456
G1 X175.917 Y111.411 E.08495
G1 X175.917 Y110.878
G1 X177.872 Y108.923 E.08495
G1 X177.872 Y108.39
G1 X175.917 Y110.345 E.08495
G1 X175.917 Y109.811
G1 X177.872 Y107.857 E.08495
G1 X177.872 Y107.323
G1 X175.917 Y109.278 E.08495
G1 X175.917 Y108.745
G1 X177.872 Y106.79 E.08495
G1 X177.872 Y106.257
G1 X175.917 Y108.212 E.08495
G1 X175.917 Y107.678
G1 X177.872 Y105.723 E.08495
G1 X177.872 Y105.19
G1 X175.917 Y107.145 E.08495
G1 X175.917 Y106.612
G1 X177.872 Y104.657 E.08495
G1 X177.872 Y104.124
G1 X175.917 Y106.079 E.08495
G1 X175.917 Y105.545
G1 X177.872 Y103.59 E.08495
G1 X177.872 Y103.057
G1 X175.917 Y105.012 E.08495
G1 X175.917 Y104.479
G1 X177.872 Y102.524 E.08495
G1 X177.872 Y101.991
G1 X175.917 Y103.946 E.08495
M73 P96 R1
G1 X175.917 Y103.412
G1 X177.872 Y101.457 E.08495
G1 X177.872 Y100.924
G1 X175.917 Y102.879 E.08495
G1 X175.917 Y102.346
G1 X177.872 Y100.391 E.08495
G1 X177.872 Y99.858
G1 X175.917 Y101.813 E.08495
G1 X175.917 Y101.279
G1 X177.872 Y99.324 E.08495
G1 X177.872 Y98.791
G1 X175.917 Y100.746 E.08495
G1 X175.917 Y100.213
G1 X177.872 Y98.258 E.08495
G1 X177.872 Y97.725
G1 X175.917 Y99.679 E.08495
G1 X175.917 Y99.146
G1 X177.872 Y97.191 E.08495
G1 X177.872 Y96.658
G1 X175.917 Y98.613 E.08495
G1 X175.917 Y98.08
G1 X177.872 Y96.125 E.08495
G1 X177.872 Y95.592
G1 X175.917 Y97.546 E.08495
G1 X175.917 Y97.013
G1 X177.872 Y95.058 E.08495
G1 X177.872 Y94.525
G1 X175.917 Y96.48 E.08495
G1 X175.917 Y95.947
G1 X177.872 Y93.992 E.08495
G1 X177.872 Y93.459
G1 X175.917 Y95.413 E.08495
G1 X175.917 Y94.88
G1 X177.872 Y92.925 E.08495
G1 X177.872 Y92.392
G1 X175.917 Y94.347 E.08495
G1 X175.917 Y93.814
G1 X177.872 Y91.859 E.08495
G1 X177.872 Y91.326
G1 X175.917 Y93.28 E.08495
G1 X175.917 Y92.747
G1 X177.872 Y90.792 E.08495
G1 X177.872 Y90.259
G1 X175.917 Y92.214 E.08495
G1 X175.917 Y91.681
G1 X177.872 Y89.726 E.08495
G1 X177.872 Y89.193
G1 X175.917 Y91.147 E.08495
G1 X175.917 Y90.614
G1 X177.872 Y88.659 E.08495
G1 X177.872 Y88.126
G1 X175.917 Y90.081 E.08495
G1 X175.917 Y89.548
G1 X177.872 Y87.593 E.08495
G1 X177.872 Y87.059
G1 X175.917 Y89.014 E.08495
G1 X175.917 Y88.481
G1 X177.872 Y86.526 E.08495
G1 X177.872 Y85.993
G1 X175.917 Y87.948 E.08495
G1 X175.917 Y87.415
G1 X177.872 Y85.46 E.08495
G1 X177.872 Y84.926
G1 X175.917 Y86.881 E.08495
G1 X175.917 Y86.348
G1 X177.872 Y84.393 E.08495
G1 X177.872 Y83.86
G1 X175.917 Y85.815 E.08495
G1 X175.917 Y85.282
G1 X177.872 Y83.327 E.08495
G1 X177.872 Y82.793
G1 X175.917 Y84.748 E.08495
G1 X175.917 Y84.215
G1 X177.872 Y82.26 E.08495
G1 X177.872 Y81.727
G1 X175.917 Y83.682 E.08495
G1 X175.917 Y83.149
G1 X177.872 Y81.194 E.08495
G1 X177.872 Y80.66
G1 X175.917 Y82.615 E.08495
G1 X175.917 Y82.082
G1 X177.872 Y80.127 E.08495
G1 X177.872 Y79.594
G1 X175.917 Y81.549 E.08495
G1 X175.917 Y81.015
G1 X177.872 Y79.061 E.08495
G1 X177.872 Y78.527
G1 X175.917 Y80.482 E.08495
G1 X175.917 Y79.949
G1 X177.872 Y77.994 E.08495
G1 X177.872 Y77.461
G1 X175.917 Y79.416 E.08495
G1 X175.917 Y78.882
G1 X177.872 Y76.928 E.08495
G1 X177.872 Y76.394
G1 X175.917 Y78.349 E.08495
G1 X175.917 Y77.816
G1 X177.872 Y75.861 E.08495
G1 X177.872 Y75.328
G1 X175.917 Y77.283 E.08495
G1 X175.917 Y76.749
G1 X177.872 Y74.795 E.08495
G1 X177.872 Y74.261
G1 X175.917 Y76.216 E.08495
G1 X175.917 Y75.683
G1 X177.872 Y73.728 E.08495
G1 X177.872 Y73.195
G1 X175.917 Y75.15 E.08495
G1 X175.917 Y74.616
G1 X177.872 Y72.662 E.08495
G1 X177.872 Y72.128
G1 X175.917 Y74.083 E.08495
G1 X175.917 Y73.55
G1 X177.872 Y71.595 E.08495
G1 X177.872 Y71.062
G1 X175.917 Y73.017 E.08495
G1 X175.917 Y72.483
G1 X177.872 Y70.529 E.08495
G1 X177.872 Y69.995
G1 X175.917 Y71.95 E.08495
G1 X175.917 Y71.417
G1 X177.872 Y69.462 E.08495
G1 X177.872 Y68.929
G1 X175.917 Y70.884 E.08495
G1 X175.917 Y70.35
G1 X177.872 Y68.395 E.08495
G1 X177.872 Y67.862
G1 X175.917 Y69.817 E.08495
G1 X175.917 Y69.284
G1 X177.872 Y67.329 E.08495
G1 X177.872 Y66.796
G1 X175.917 Y68.751 E.08495
G1 X175.917 Y68.217
G1 X177.872 Y66.262 E.08495
G1 X177.872 Y65.729
G1 X175.917 Y67.684 E.08495
G1 X175.917 Y67.151
G1 X177.872 Y65.196 E.08495
G1 X177.872 Y64.663
G1 X175.917 Y66.618 E.08495
G1 X175.917 Y66.084
G1 X177.872 Y64.129 E.08495
G1 X177.872 Y63.596
G1 X175.917 Y65.551 E.08495
G1 X175.917 Y65.018
G1 X177.872 Y63.063 E.08495
G1 X177.872 Y62.53
G1 X175.917 Y64.485 E.08495
G1 X175.917 Y63.951
G1 X177.872 Y61.996 E.08495
G1 X177.872 Y61.463
G1 X175.917 Y63.418 E.08495
G1 X175.917 Y62.885
G1 X177.872 Y60.93 E.08495
G1 X177.872 Y60.397
G1 X175.917 Y62.351 E.08495
G1 X175.917 Y61.818
G1 X177.808 Y59.927 E.08216
G1 X177.717 Y59.485
G1 X175.917 Y61.285 E.07822
G1 X175.917 Y60.752
G1 X177.581 Y59.088 E.0723
G1 X177.425 Y58.711
G1 X175.875 Y60.261 E.06735
G1 X175.762 Y59.84
G1 X177.238 Y58.364 E.06414
G1 X177.025 Y58.045
G1 X175.598 Y59.471 E.062
G1 X175.393 Y59.143
G1 X176.79 Y57.746 E.06072
G1 X176.541 Y57.461
G1 X175.153 Y58.85 E.06034
G1 X174.86 Y58.609
G1 X176.261 Y57.209 E.06086
G1 X175.959 Y56.977
G1 X174.532 Y58.404 E.062
G1 X174.164 Y58.239
G1 X175.641 Y56.762 E.06417
G1 X175.288 Y56.582
G1 X173.745 Y58.125 E.06705
G1 X173.254 Y58.083
G1 X174.92 Y56.416 E.07241
G1 X174.512 Y56.291
G1 X172.721 Y58.083 E.07785
G1 X172.187 Y58.083
G1 X174.083 Y56.187 E.08236
G1 X173.599 Y56.138
G1 X171.654 Y58.083 E.08452
G1 X171.121 Y58.083
G1 X173.086 Y56.117 E.0854
G1 X172.553 Y56.117
G1 X170.588 Y58.083 E.0854
G1 X170.054 Y58.083
G1 X172.02 Y56.117 E.0854
G1 X171.486 Y56.117
G1 X169.521 Y58.083 E.0854
G1 X168.988 Y58.083
G1 X170.953 Y56.117 E.0854
G1 X170.42 Y56.117
G1 X168.455 Y58.083 E.0854
G1 X167.921 Y58.083
G1 X169.886 Y56.117 E.0854
G1 X169.353 Y56.117
G1 X167.388 Y58.083 E.0854
G1 X166.855 Y58.083
G1 X168.82 Y56.117 E.0854
G1 X168.287 Y56.117
G1 X166.322 Y58.083 E.0854
G1 X165.788 Y58.083
G1 X167.753 Y56.117 E.0854
G1 X167.22 Y56.117
G1 X165.255 Y58.083 E.0854
G1 X164.722 Y58.083
G1 X166.687 Y56.117 E.0854
G1 X166.154 Y56.117
G1 X164.189 Y58.083 E.0854
G1 X163.655 Y58.083
G1 X165.62 Y56.117 E.0854
G1 X165.087 Y56.117
G1 X163.122 Y58.083 E.0854
G1 X162.589 Y58.083
G1 X164.554 Y56.117 E.0854
G1 X164.021 Y56.117
G1 X162.055 Y58.083 E.0854
G1 X161.522 Y58.083
G1 X163.487 Y56.117 E.0854
G1 X162.954 Y56.117
G1 X160.989 Y58.083 E.0854
G1 X160.456 Y58.083
G1 X162.421 Y56.117 E.0854
G1 X161.888 Y56.117
G1 X159.922 Y58.083 E.0854
G1 X159.389 Y58.083
G1 X161.354 Y56.117 E.0854
G1 X160.821 Y56.117
G1 X158.856 Y58.083 E.0854
G1 X158.323 Y58.083
G1 X160.288 Y56.117 E.0854
G1 X159.755 Y56.117
G1 X157.789 Y58.083 E.0854
G1 X157.256 Y58.083
G1 X159.221 Y56.117 E.0854
G1 X158.688 Y56.117
G1 X156.723 Y58.083 E.0854
G1 X156.19 Y58.083
G1 X158.155 Y56.117 E.0854
G1 X157.622 Y56.117
G1 X155.656 Y58.083 E.0854
G1 X155.123 Y58.083
G1 X157.088 Y56.117 E.0854
G1 X156.555 Y56.117
G1 X154.59 Y58.083 E.0854
G1 X154.057 Y58.083
G1 X156.022 Y56.117 E.0854
G1 X155.489 Y56.117
G1 X153.523 Y58.083 E.0854
G1 X152.99 Y58.083
G1 X154.955 Y56.117 E.0854
G1 X154.422 Y56.117
G1 X152.457 Y58.083 E.0854
G1 X151.924 Y58.083
G1 X153.889 Y56.117 E.0854
G1 X153.356 Y56.117
G1 X151.39 Y58.083 E.0854
G1 X150.857 Y58.083
G1 X152.822 Y56.117 E.0854
G1 X152.289 Y56.117
G1 X150.324 Y58.083 E.0854
G1 X149.791 Y58.083
G1 X151.756 Y56.117 E.0854
G1 X151.222 Y56.117
G1 X149.257 Y58.083 E.0854
G1 X148.724 Y58.083
G1 X150.689 Y56.117 E.0854
G1 X150.156 Y56.117
G1 X148.191 Y58.083 E.0854
G1 X147.658 Y58.083
G1 X149.623 Y56.117 E.0854
G1 X149.089 Y56.117
G1 X147.124 Y58.083 E.0854
G1 X146.591 Y58.083
G1 X148.556 Y56.117 E.0854
G1 X148.023 Y56.117
G1 X146.058 Y58.083 E.0854
G1 X145.524 Y58.083
G1 X147.49 Y56.117 E.0854
G1 X146.956 Y56.117
G1 X144.991 Y58.083 E.0854
G1 X144.458 Y58.083
G1 X146.423 Y56.117 E.0854
G1 X145.89 Y56.117
G1 X143.925 Y58.083 E.0854
G1 X143.391 Y58.083
G1 X145.357 Y56.117 E.0854
G1 X144.823 Y56.117
G1 X142.858 Y58.083 E.0854
G1 X142.325 Y58.083
G1 X144.29 Y56.117 E.0854
G1 X143.757 Y56.117
G1 X141.792 Y58.083 E.0854
G1 X141.258 Y58.083
G1 X143.224 Y56.117 E.0854
G1 X142.69 Y56.117
G1 X140.725 Y58.083 E.0854
G1 X140.192 Y58.083
G1 X142.157 Y56.117 E.0854
G1 X141.624 Y56.117
G1 X139.659 Y58.083 E.0854
G1 X139.125 Y58.083
G1 X141.091 Y56.117 E.0854
G1 X140.557 Y56.117
G1 X138.592 Y58.083 E.0854
G1 X138.059 Y58.083
G1 X140.024 Y56.117 E.0854
G1 X139.491 Y56.117
G1 X137.526 Y58.083 E.0854
G1 X136.992 Y58.083
G1 X138.958 Y56.117 E.0854
G1 X138.424 Y56.117
G1 X136.459 Y58.083 E.0854
G1 X135.926 Y58.083
G1 X137.891 Y56.117 E.0854
G1 X137.358 Y56.117
G1 X135.393 Y58.083 E.0854
G1 X134.859 Y58.083
G1 X136.825 Y56.117 E.0854
G1 X136.291 Y56.117
G1 X134.326 Y58.083 E.0854
G1 X133.793 Y58.083
G1 X135.758 Y56.117 E.0854
G1 X135.225 Y56.117
G1 X133.26 Y58.083 E.0854
G1 X132.726 Y58.083
G1 X134.692 Y56.117 E.0854
G1 X134.158 Y56.117
G1 X132.193 Y58.083 E.0854
G1 X131.66 Y58.083
G1 X133.625 Y56.117 E.0854
G1 X133.092 Y56.117
G1 X131.127 Y58.083 E.0854
G1 X130.593 Y58.083
G1 X132.558 Y56.117 E.0854
G1 X132.025 Y56.117
G1 X130.06 Y58.083 E.0854
G1 X129.527 Y58.083
G1 X131.492 Y56.117 E.0854
G1 X130.959 Y56.117
G1 X128.994 Y58.083 E.0854
G1 X128.46 Y58.083
G1 X130.425 Y56.117 E.0854
G1 X129.892 Y56.117
G1 X127.927 Y58.083 E.0854
G1 X127.394 Y58.083
G1 X129.359 Y56.117 E.0854
G1 X128.826 Y56.117
G1 X126.86 Y58.083 E.0854
G1 X126.327 Y58.083
G1 X128.292 Y56.117 E.0854
G1 X127.759 Y56.117
G1 X125.794 Y58.083 E.0854
G1 X125.261 Y58.083
G1 X127.226 Y56.117 E.0854
G1 X126.693 Y56.117
G1 X124.727 Y58.083 E.0854
G1 X124.194 Y58.083
G1 X126.159 Y56.117 E.0854
G1 X125.626 Y56.117
G1 X123.661 Y58.083 E.0854
G1 X123.128 Y58.083
G1 X125.093 Y56.117 E.0854
G1 X124.56 Y56.117
G1 X122.594 Y58.083 E.0854
G1 X122.061 Y58.083
G1 X124.026 Y56.117 E.0854
G1 X123.493 Y56.117
G1 X121.528 Y58.083 E.0854
G1 X120.995 Y58.083
G1 X122.96 Y56.117 E.0854
G1 X122.427 Y56.117
G1 X120.461 Y58.083 E.0854
G1 X119.928 Y58.083
G1 X121.893 Y56.117 E.0854
G1 X121.36 Y56.117
G1 X119.395 Y58.083 E.0854
G1 X118.862 Y58.083
G1 X120.827 Y56.117 E.0854
G1 X120.294 Y56.117
G1 X118.328 Y58.083 E.0854
G1 X117.795 Y58.083
G1 X119.76 Y56.117 E.0854
G1 X119.227 Y56.117
G1 X117.262 Y58.083 E.0854
G1 X116.729 Y58.083
G1 X118.694 Y56.117 E.0854
G1 X118.161 Y56.117
G1 X116.195 Y58.083 E.0854
G1 X115.662 Y58.083
G1 X117.627 Y56.117 E.0854
G1 X117.094 Y56.117
G1 X115.129 Y58.083 E.0854
G1 X114.596 Y58.083
G1 X116.561 Y56.117 E.0854
G1 X116.028 Y56.117
G1 X114.062 Y58.083 E.0854
G1 X113.529 Y58.083
G1 X115.494 Y56.117 E.0854
G1 X114.961 Y56.117
G1 X112.996 Y58.083 E.0854
G1 X112.463 Y58.083
G1 X114.428 Y56.117 E.0854
G1 X113.894 Y56.117
G1 X111.929 Y58.083 E.0854
G1 X111.396 Y58.083
G1 X113.361 Y56.117 E.0854
G1 X112.828 Y56.117
G1 X110.863 Y58.083 E.0854
G1 X110.329 Y58.083
G1 X112.295 Y56.117 E.0854
G1 X111.761 Y56.117
G1 X109.796 Y58.083 E.0854
G1 X109.263 Y58.083
G1 X111.228 Y56.117 E.0854
G1 X110.695 Y56.117
G1 X108.73 Y58.083 E.0854
G1 X108.196 Y58.083
G1 X110.162 Y56.117 E.0854
G1 X109.628 Y56.117
G1 X107.663 Y58.083 E.0854
G1 X107.13 Y58.083
G1 X109.095 Y56.117 E.0854
G1 X108.562 Y56.117
G1 X106.597 Y58.083 E.0854
G1 X106.063 Y58.083
G1 X108.029 Y56.117 E.0854
G1 X107.495 Y56.117
G1 X105.53 Y58.083 E.0854
G1 X104.997 Y58.083
G1 X106.962 Y56.117 E.0854
G1 X106.429 Y56.117
G1 X104.464 Y58.083 E.0854
G1 X103.93 Y58.083
G1 X105.896 Y56.117 E.0854
G1 X105.362 Y56.117
G1 X103.397 Y58.083 E.0854
G1 X102.864 Y58.083
G1 X104.829 Y56.117 E.0854
G1 X104.296 Y56.117
G1 X102.331 Y58.083 E.0854
G1 X101.797 Y58.083
G1 X103.763 Y56.117 E.0854
G1 X103.229 Y56.117
G1 X101.264 Y58.083 E.0854
G1 X100.731 Y58.083
G1 X102.696 Y56.117 E.0854
G1 X102.163 Y56.117
G1 X100.198 Y58.083 E.0854
G1 X99.664 Y58.083
G1 X101.63 Y56.117 E.0854
G1 X101.096 Y56.117
G1 X99.131 Y58.083 E.0854
G1 X98.598 Y58.083
G1 X100.563 Y56.117 E.0854
G1 X100.03 Y56.117
G1 X98.065 Y58.083 E.0854
G1 X97.531 Y58.083
G1 X99.497 Y56.117 E.0854
G1 X98.963 Y56.117
G1 X96.998 Y58.083 E.0854
G1 X96.465 Y58.083
G1 X98.43 Y56.117 E.0854
G1 X97.897 Y56.117
G1 X95.932 Y58.083 E.0854
G1 X95.398 Y58.083
G1 X97.364 Y56.117 E.0854
G1 X96.83 Y56.117
G1 X94.865 Y58.083 E.0854
G1 X94.332 Y58.083
G1 X96.297 Y56.117 E.0854
G1 X95.764 Y56.117
G1 X93.799 Y58.083 E.0854
G1 X93.265 Y58.083
G1 X95.23 Y56.117 E.0854
G1 X94.697 Y56.117
G1 X92.732 Y58.083 E.0854
G1 X92.199 Y58.083
G1 X94.164 Y56.117 E.0854
G1 X93.631 Y56.117
G1 X91.665 Y58.083 E.0854
G1 X91.132 Y58.083
G1 X93.097 Y56.117 E.0854
G1 X92.564 Y56.117
G1 X90.599 Y58.083 E.0854
G1 X90.066 Y58.083
G1 X92.031 Y56.117 E.0854
G1 X91.498 Y56.117
G1 X89.532 Y58.083 E.0854
G1 X88.999 Y58.083
G1 X90.964 Y56.117 E.0854
G1 X90.431 Y56.117
G1 X88.466 Y58.083 E.0854
G1 X87.933 Y58.083
G1 X89.898 Y56.117 E.0854
G1 X89.365 Y56.117
G1 X87.399 Y58.083 E.0854
G1 X86.866 Y58.083
G1 X88.831 Y56.117 E.0854
G1 X88.298 Y56.117
G1 X86.333 Y58.083 E.0854
G1 X85.8 Y58.083
G1 X87.765 Y56.117 E.0854
G1 X87.232 Y56.117
G1 X85.266 Y58.083 E.0854
G1 X84.733 Y58.083
G1 X86.698 Y56.117 E.0854
G1 X86.165 Y56.117
G1 X84.2 Y58.083 E.0854
G1 X83.667 Y58.083
G1 X85.632 Y56.117 E.0854
G1 X85.099 Y56.117
G1 X83.133 Y58.083 E.0854
G1 X82.591 Y58.092
G1 X84.565 Y56.117 E.08581
G1 X84.032 Y56.117
G1 X81.943 Y58.206 E.09078
; WIPE_START
M204 S10000
G1 X83.357 Y56.792 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.445 Y62.482 Z12.4 F30000
G1 X171.973 Y155.883 Z12.4
G1 Z12
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X174.065 Y153.791 E.09089
G1 X173.416 Y153.907
G1 X171.44 Y155.883 E.08584
G1 X170.907 Y155.883
G1 X172.872 Y153.917 E.0854
G1 X172.339 Y153.917
G1 X170.374 Y155.883 E.0854
G1 X169.84 Y155.883
G1 X171.806 Y153.917 E.0854
G1 X171.272 Y153.917
G1 X169.307 Y155.883 E.0854
G1 X168.774 Y155.883
G1 X170.739 Y153.917 E.0854
G1 X170.206 Y153.917
G1 X168.241 Y155.883 E.0854
G1 X167.707 Y155.883
G1 X169.673 Y153.917 E.0854
G1 X169.139 Y153.917
G1 X167.174 Y155.883 E.0854
G1 X166.641 Y155.883
G1 X168.606 Y153.917 E.0854
G1 X168.073 Y153.917
G1 X166.108 Y155.883 E.0854
G1 X165.574 Y155.883
G1 X167.54 Y153.917 E.0854
G1 X167.006 Y153.917
G1 X165.041 Y155.883 E.0854
G1 X164.508 Y155.883
G1 X166.473 Y153.917 E.0854
G1 X165.94 Y153.917
G1 X163.975 Y155.883 E.0854
G1 X163.441 Y155.883
G1 X165.407 Y153.917 E.0854
G1 X164.873 Y153.917
G1 X160.508 Y158.283 E.18969
G1 X159.975 Y158.283
G1 X164.34 Y153.917 E.18969
G1 X163.807 Y153.917
G1 X159.442 Y158.283 E.18969
G1 X158.908 Y158.283
G1 X163.274 Y153.917 E.18969
G1 X162.74 Y153.917
G1 X158.375 Y158.283 E.18969
G1 X157.842 Y158.283
G1 X162.207 Y153.917 E.18969
G1 X161.674 Y153.917
G1 X157.309 Y158.283 E.18969
G1 X156.775 Y158.283
G1 X161.141 Y153.917 E.18969
G1 X160.607 Y153.917
G1 X156.242 Y158.283 E.18969
G1 X155.709 Y158.283
G1 X160.074 Y153.917 E.18969
G1 X159.541 Y153.917
G1 X155.176 Y158.283 E.18969
G1 X154.642 Y158.283
G1 X159.008 Y153.917 E.18969
G1 X158.474 Y153.917
G1 X154.109 Y158.283 E.18969
M73 P97 R1
G1 X153.576 Y158.283
G1 X157.941 Y153.917 E.18969
G1 X157.408 Y153.917
G1 X153.042 Y158.283 E.18969
G1 X152.509 Y158.283
G1 X156.874 Y153.917 E.18969
G1 X156.341 Y153.917
G1 X151.976 Y158.283 E.18969
G1 X151.443 Y158.283
G1 X155.808 Y153.917 E.18969
G1 X155.275 Y153.917
G1 X150.909 Y158.283 E.18969
G1 X150.376 Y158.283
G1 X154.741 Y153.917 E.18969
G1 X154.208 Y153.917
G1 X149.843 Y158.283 E.18969
G1 X149.31 Y158.283
G1 X153.675 Y153.917 E.18969
G1 X153.142 Y153.917
G1 X148.776 Y158.283 E.18969
G1 X148.243 Y158.283
G1 X152.608 Y153.917 E.18969
G1 X152.075 Y153.917
G1 X147.71 Y158.283 E.18969
G1 X147.177 Y158.283
G1 X151.542 Y153.917 E.18969
G1 X151.009 Y153.917
G1 X146.643 Y158.283 E.18969
G1 X146.11 Y158.283
G1 X150.475 Y153.917 E.18969
G1 X149.942 Y153.917
G1 X145.577 Y158.283 E.18969
G1 X145.044 Y158.283
G1 X149.409 Y153.917 E.18969
G1 X148.876 Y153.917
G1 X144.51 Y158.283 E.18969
G1 X143.977 Y158.283
G1 X148.342 Y153.917 E.18969
G1 X147.809 Y153.917
G1 X143.444 Y158.283 E.18969
G1 X142.911 Y158.283
G1 X147.276 Y153.917 E.18969
G1 X146.743 Y153.917
G1 X142.377 Y158.283 E.18969
G1 X141.844 Y158.283
G1 X146.209 Y153.917 E.18969
G1 X145.676 Y153.917
G1 X141.311 Y158.283 E.18969
G1 X140.778 Y158.283
G1 X145.143 Y153.917 E.18969
G1 X144.61 Y153.917
G1 X140.244 Y158.283 E.18969
G1 X139.711 Y158.283
G1 X144.076 Y153.917 E.18969
G1 X143.543 Y153.917
G1 X139.178 Y158.283 E.18969
G1 X138.645 Y158.283
G1 X143.01 Y153.917 E.18969
G1 X142.477 Y153.917
G1 X138.111 Y158.283 E.18969
G1 X137.578 Y158.283
G1 X141.943 Y153.917 E.18969
G1 X141.41 Y153.917
G1 X137.045 Y158.283 E.18969
G1 X136.511 Y158.283
G1 X140.877 Y153.917 E.18969
G1 X140.343 Y153.917
G1 X135.978 Y158.283 E.18969
G1 X135.445 Y158.283
G1 X139.81 Y153.917 E.18969
G1 X139.277 Y153.917
G1 X134.912 Y158.283 E.18969
G1 X134.378 Y158.283
G1 X138.744 Y153.917 E.18969
G1 X138.21 Y153.917
G1 X133.845 Y158.283 E.18969
G1 X133.312 Y158.283
G1 X137.677 Y153.917 E.18969
G1 X137.144 Y153.917
G1 X132.779 Y158.283 E.18969
G1 X132.245 Y158.283
G1 X136.611 Y153.917 E.18969
G1 X136.077 Y153.917
G1 X131.712 Y158.283 E.18969
G1 X131.179 Y158.283
G1 X135.544 Y153.917 E.18969
G1 X135.011 Y153.917
G1 X130.646 Y158.283 E.18969
G1 X130.112 Y158.283
G1 X134.478 Y153.917 E.18969
G1 X133.944 Y153.917
G1 X129.579 Y158.283 E.18969
G1 X129.046 Y158.283
G1 X133.411 Y153.917 E.18969
G1 X132.878 Y153.917
G1 X128.513 Y158.283 E.18969
G1 X127.979 Y158.283
G1 X132.345 Y153.917 E.18969
G1 X131.811 Y153.917
G1 X127.446 Y158.283 E.18969
G1 X126.913 Y158.283
G1 X131.278 Y153.917 E.18969
G1 X130.745 Y153.917
G1 X126.38 Y158.283 E.18969
G1 X125.846 Y158.283
G1 X130.212 Y153.917 E.18969
G1 X129.678 Y153.917
G1 X125.313 Y158.283 E.18969
G1 X124.78 Y158.283
G1 X129.145 Y153.917 E.18969
G1 X128.612 Y153.917
G1 X124.247 Y158.283 E.18969
G1 X123.713 Y158.283
G1 X128.079 Y153.917 E.18969
G1 X127.545 Y153.917
G1 X123.18 Y158.283 E.18969
G1 X122.647 Y158.283
G1 X127.012 Y153.917 E.18969
G1 X126.479 Y153.917
G1 X122.114 Y158.283 E.18969
G1 X121.58 Y158.283
G1 X125.946 Y153.917 E.18969
G1 X125.412 Y153.917
G1 X121.047 Y158.283 E.18969
G1 X120.514 Y158.283
G1 X124.879 Y153.917 E.18969
G1 X124.346 Y153.917
G1 X119.981 Y158.283 E.18969
G1 X119.447 Y158.283
G1 X123.813 Y153.917 E.18969
G1 X123.279 Y153.917
G1 X118.914 Y158.283 E.18969
G1 X118.381 Y158.283
G1 X122.746 Y153.917 E.18969
G1 X122.213 Y153.917
G1 X117.847 Y158.283 E.18969
G1 X117.314 Y158.283
G1 X121.679 Y153.917 E.18969
G1 X121.146 Y153.917
G1 X116.781 Y158.283 E.18969
G1 X116.248 Y158.283
G1 X120.613 Y153.917 E.18969
G1 X120.08 Y153.917
G1 X115.714 Y158.283 E.18969
G1 X115.181 Y158.283
G1 X119.546 Y153.917 E.18969
G1 X119.013 Y153.917
G1 X114.648 Y158.283 E.18969
G1 X114.115 Y158.283
G1 X118.48 Y153.917 E.18969
G1 X117.947 Y153.917
G1 X113.581 Y158.283 E.18969
G1 X113.048 Y158.283
G1 X117.413 Y153.917 E.18969
G1 X116.88 Y153.917
G1 X112.515 Y158.283 E.18969
G1 X111.982 Y158.283
G1 X116.347 Y153.917 E.18969
G1 X115.814 Y153.917
G1 X111.448 Y158.283 E.18969
G1 X110.915 Y158.283
G1 X115.28 Y153.917 E.18969
G1 X114.747 Y153.917
G1 X110.382 Y158.283 E.18969
G1 X109.849 Y158.283
G1 X114.214 Y153.917 E.18969
G1 X113.681 Y153.917
G1 X109.315 Y158.283 E.18969
G1 X108.782 Y158.283
G1 X113.147 Y153.917 E.18969
G1 X112.614 Y153.917
G1 X108.249 Y158.283 E.18969
G1 X107.716 Y158.283
G1 X112.081 Y153.917 E.18969
G1 X111.548 Y153.917
G1 X107.182 Y158.283 E.18969
G1 X106.649 Y158.283
G1 X111.014 Y153.917 E.18969
G1 X110.481 Y153.917
G1 X106.116 Y158.283 E.18969
G1 X105.583 Y158.283
G1 X109.948 Y153.917 E.18969
G1 X109.415 Y153.917
G1 X105.049 Y158.283 E.18969
G1 X104.516 Y158.283
G1 X108.881 Y153.917 E.18969
G1 X108.348 Y153.917
G1 X103.983 Y158.283 E.18969
G1 X103.45 Y158.283
G1 X107.815 Y153.917 E.18969
G1 X107.282 Y153.917
G1 X102.916 Y158.283 E.18969
G1 X102.383 Y158.283
G1 X106.748 Y153.917 E.18969
G1 X106.215 Y153.917
G1 X101.85 Y158.283 E.18969
G1 X101.316 Y158.283
G1 X105.682 Y153.917 E.18969
G1 X105.148 Y153.917
G1 X100.783 Y158.283 E.18969
G1 X100.25 Y158.283
G1 X104.615 Y153.917 E.18969
G1 X104.082 Y153.917
G1 X99.717 Y158.283 E.18969
G1 X99.183 Y158.283
G1 X103.549 Y153.917 E.18969
G1 X103.015 Y153.917
G1 X98.65 Y158.283 E.18969
G1 X98.117 Y158.283
G1 X102.482 Y153.917 E.18969
G1 X101.949 Y153.917
G1 X97.584 Y158.283 E.18969
G1 X97.05 Y158.283
G1 X101.416 Y153.917 E.18969
G1 X100.882 Y153.917
G1 X96.517 Y158.283 E.18969
G1 X95.984 Y158.283
G1 X100.349 Y153.917 E.18969
G1 X99.816 Y153.917
G1 X95.451 Y158.283 E.18969
G1 X94.91 Y158.29
G1 X99.283 Y153.917 E.19001
; WIPE_START
M204 S10000
G1 X97.868 Y155.332 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.436 Y159.221 Z12.4 F30000
G1 X161.505 Y193.014 Z12.4
G1 Z12
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X158.638 Y195.881 E.12455
G1 X158.105 Y195.881
G1 X160.868 Y193.117 E.12008
G1 X160.335 Y193.117
G1 X157.572 Y195.881 E.12008
G1 X157.038 Y195.881
G1 X159.802 Y193.117 E.12008
G1 X159.269 Y193.117
G1 X156.505 Y195.881 E.12008
G1 X155.972 Y195.881
G1 X158.735 Y193.117 E.12009
G1 X158.202 Y193.117
G1 X155.439 Y195.881 E.12009
G1 X154.905 Y195.881
G1 X157.669 Y193.117 E.12009
G1 X157.136 Y193.117
G1 X154.372 Y195.881 E.12009
G1 X153.839 Y195.881
G1 X156.602 Y193.117 E.12009
G1 X156.069 Y193.117
G1 X153.305 Y195.881 E.12009
G1 X152.772 Y195.881
G1 X155.536 Y193.117 E.12009
G1 X155.002 Y193.117
G1 X152.239 Y195.881 E.12009
G1 X151.706 Y195.881
G1 X154.469 Y193.117 E.12009
G1 X153.936 Y193.117
G1 X151.172 Y195.881 E.12009
G1 X150.639 Y195.881
G1 X153.403 Y193.117 E.12009
G1 X152.869 Y193.117
G1 X150.106 Y195.881 E.12009
G1 X149.573 Y195.881
G1 X152.336 Y193.117 E.12009
G1 X151.803 Y193.117
G1 X149.039 Y195.881 E.12009
G1 X148.506 Y195.881
G1 X151.27 Y193.117 E.1201
G1 X150.736 Y193.117
G1 X147.973 Y195.881 E.1201
G1 X147.439 Y195.881
G1 X150.203 Y193.117 E.1201
G1 X149.67 Y193.117
G1 X146.906 Y195.881 E.1201
G1 X146.373 Y195.881
G1 X149.137 Y193.117 E.1201
G1 X148.603 Y193.117
G1 X145.84 Y195.881 E.1201
G1 X145.306 Y195.881
G1 X148.07 Y193.117 E.1201
G1 X147.537 Y193.117
G1 X144.773 Y195.881 E.1201
G1 X144.24 Y195.881
G1 X147.004 Y193.117 E.1201
G1 X146.47 Y193.117
G1 X143.707 Y195.881 E.1201
G1 X143.173 Y195.881
G1 X145.937 Y193.117 E.1201
G1 X145.404 Y193.117
G1 X142.64 Y195.881 E.1201
G1 X142.107 Y195.881
G1 X144.871 Y193.117 E.1201
G1 X144.337 Y193.117
G1 X141.573 Y195.881 E.1201
G1 X141.04 Y195.881
G1 X143.804 Y193.117 E.1201
G1 X143.271 Y193.117
G1 X140.507 Y195.881 E.12011
G1 X139.974 Y195.881
G1 X142.738 Y193.117 E.12011
G1 X142.204 Y193.117
G1 X139.44 Y195.881 E.12011
G1 X138.907 Y195.881
G1 X141.671 Y193.117 E.12011
G1 X141.138 Y193.117
G1 X138.374 Y195.881 E.12011
G1 X137.841 Y195.881
G1 X140.605 Y193.117 E.12011
G1 X140.071 Y193.117
G1 X137.307 Y195.881 E.12011
G1 X136.774 Y195.881
G1 X139.538 Y193.117 E.12011
G1 X139.005 Y193.117
G1 X136.241 Y195.881 E.12011
M73 P97 R0
G1 X135.707 Y195.881
G1 X138.472 Y193.117 E.12011
G1 X137.938 Y193.117
G1 X135.174 Y195.881 E.12011
G1 X134.641 Y195.881
G1 X137.405 Y193.117 E.12011
G1 X136.872 Y193.117
G1 X134.108 Y195.881 E.12011
G1 X133.574 Y195.881
G1 X136.338 Y193.117 E.12011
G1 X135.805 Y193.117
G1 X133.041 Y195.882 E.12012
G1 X132.508 Y195.882
G1 X135.272 Y193.117 E.12012
G1 X134.739 Y193.117
G1 X131.975 Y195.882 E.12012
G1 X131.441 Y195.882
G1 X134.205 Y193.117 E.12012
G1 X133.672 Y193.117
G1 X130.908 Y195.882 E.12012
G1 X130.375 Y195.882
G1 X133.139 Y193.117 E.12012
G1 X132.606 Y193.117
G1 X129.841 Y195.882 E.12012
G1 X129.308 Y195.882
G1 X132.072 Y193.117 E.12012
G1 X131.539 Y193.117
G1 X128.775 Y195.882 E.12012
G1 X128.242 Y195.882
G1 X131.006 Y193.117 E.12012
G1 X130.473 Y193.117
G1 X127.708 Y195.882 E.12012
G1 X127.175 Y195.882
G1 X129.939 Y193.117 E.12012
G1 X129.406 Y193.117
G1 X126.642 Y195.882 E.12012
G1 X126.109 Y195.882
G1 X128.873 Y193.117 E.12012
G1 X128.34 Y193.117
G1 X125.575 Y195.882 E.12012
G1 X125.042 Y195.882
G1 X127.806 Y193.117 E.12013
G1 X127.273 Y193.117
G1 X124.509 Y195.882 E.12013
G1 X123.975 Y195.882
G1 X126.74 Y193.117 E.12013
G1 X126.207 Y193.117
G1 X123.442 Y195.882 E.12013
G1 X122.909 Y195.882
G1 X125.673 Y193.117 E.12013
G1 X125.14 Y193.117
G1 X122.376 Y195.882 E.12013
G1 X121.842 Y195.882
G1 X124.607 Y193.117 E.12013
G1 X124.074 Y193.117
G1 X121.309 Y195.882 E.12013
G1 X120.776 Y195.882
G1 X123.54 Y193.117 E.12013
G1 X123.007 Y193.117
G1 X120.243 Y195.882 E.12013
G1 X119.709 Y195.882
G1 X122.474 Y193.117 E.12013
G1 X121.941 Y193.117
G1 X119.176 Y195.882 E.12013
G1 X118.643 Y195.882
G1 X121.407 Y193.117 E.12013
G1 X120.874 Y193.117
G1 X118.109 Y195.882 E.12013
G1 X117.576 Y195.882
G1 X120.341 Y193.117 E.12013
G1 X119.807 Y193.117
G1 X117.043 Y195.882 E.12014
G1 X116.51 Y195.882
G1 X119.274 Y193.117 E.12014
G1 X118.741 Y193.117
G1 X115.976 Y195.882 E.12014
G1 X115.443 Y195.882
G1 X118.208 Y193.117 E.12014
G1 X117.674 Y193.117
G1 X114.91 Y195.882 E.12014
G1 X114.377 Y195.882
G1 X117.141 Y193.117 E.12014
G1 X116.608 Y193.117
G1 X113.843 Y195.882 E.12014
G1 X113.31 Y195.882
G1 X116.075 Y193.117 E.12014
G1 X115.541 Y193.117
G1 X112.777 Y195.882 E.12014
G1 X112.243 Y195.882
G1 X115.008 Y193.117 E.12014
G1 X114.475 Y193.117
G1 X111.71 Y195.882 E.12014
G1 X111.177 Y195.882
G1 X113.942 Y193.117 E.12014
G1 X113.408 Y193.117
G1 X110.644 Y195.882 E.12014
G1 X110.11 Y195.882
G1 X112.875 Y193.117 E.12014
G1 X112.342 Y193.117
G1 X109.577 Y195.882 E.12015
G1 X109.044 Y195.882
G1 X111.809 Y193.117 E.12015
G1 X111.275 Y193.117
G1 X108.511 Y195.882 E.12015
G1 X107.977 Y195.882
G1 X110.742 Y193.117 E.12015
G1 X110.209 Y193.117
G1 X107.444 Y195.882 E.12015
G1 X106.911 Y195.882
G1 X109.676 Y193.117 E.12015
G1 X109.142 Y193.117
G1 X106.377 Y195.882 E.12015
G1 X105.844 Y195.882
G1 X108.609 Y193.117 E.12015
G1 X108.076 Y193.117
G1 X105.311 Y195.882 E.12015
G1 X104.778 Y195.882
G1 X107.543 Y193.117 E.12015
G1 X107.009 Y193.117
G1 X104.244 Y195.882 E.12015
G1 X103.711 Y195.882
G1 X106.476 Y193.117 E.12015
G1 X105.943 Y193.117
G1 X103.178 Y195.882 E.12015
G1 X102.645 Y195.882
G1 X105.41 Y193.117 E.12015
G1 X104.876 Y193.117
G1 X102.111 Y195.882 E.12015
G1 X101.578 Y195.882
G1 X104.343 Y193.117 E.12016
G1 X103.81 Y193.117
G1 X101.045 Y195.882 E.12016
G1 X100.511 Y195.882
G1 X103.277 Y193.117 E.12016
G1 X102.743 Y193.117
G1 X99.978 Y195.882 E.12016
G1 X99.445 Y195.882
G1 X102.21 Y193.117 E.12016
G1 X101.677 Y193.117
G1 X98.912 Y195.883 E.12016
G1 X98.378 Y195.883
G1 X101.143 Y193.117 E.12016
G1 X100.61 Y193.117
G1 X97.845 Y195.883 E.12016
G1 X97.312 Y195.883
G1 X100.077 Y193.117 E.12016
M73 P98 R0
G1 X99.544 Y193.117
G1 X96.778 Y195.883 E.12016
G1 X96.245 Y195.883
G1 X99.01 Y193.117 E.12016
G1 X98.477 Y193.117
G1 X95.712 Y195.883 E.12016
G1 X95.179 Y195.883
G1 X97.944 Y193.117 E.12016
G1 X97.411 Y193.117
G1 X94.664 Y195.864 E.11936
G1 X94.199 Y195.796
G1 X96.877 Y193.117 E.1164
G1 X96.344 Y193.117
G1 X93.773 Y195.688 E.11172
G1 X93.38 Y195.548
G1 X95.811 Y193.117 E.10563
G1 X95.278 Y193.117
G1 X93.015 Y195.38 E.09831
G1 X92.687 Y195.175
G1 X94.772 Y193.09 E.09059
G1 X94.362 Y192.966
G1 X92.38 Y194.948 E.08612
G1 X92.093 Y194.702
G1 X94.047 Y192.748 E.08492
G1 X93.804 Y192.458
G1 X91.837 Y194.425 E.0855
G1 X91.604 Y194.125
G1 X93.641 Y192.088 E.08852
G1 X93.583 Y191.613
G1 X91.392 Y193.804 E.0952
G1 X91.208 Y193.454
G1 X93.583 Y191.08 E.10319
G1 X93.583 Y190.546
G1 X91.058 Y193.071 E.1097
G1 X90.938 Y192.657
G1 X93.583 Y190.013 E.1149
G1 X93.583 Y189.48
G1 X90.856 Y192.206 E.11848
G1 X90.819 Y191.71
G1 X93.583 Y188.947 E.12008
G1 X93.583 Y188.413
G1 X90.819 Y191.177 E.12008
G1 X90.819 Y190.643
G1 X93.583 Y187.88 E.12008
G1 X93.583 Y187.347
G1 X90.819 Y190.11 E.12008
G1 X90.819 Y189.577
G1 X93.583 Y186.814 E.12007
G1 X93.583 Y186.28
G1 X90.819 Y189.043 E.12007
G1 X90.819 Y188.51
G1 X93.583 Y185.747 E.12007
G1 X93.583 Y185.214
G1 X90.82 Y187.977 E.12007
G1 X90.82 Y187.444
G1 X93.583 Y184.681 E.12007
G1 X93.583 Y184.147
G1 X90.82 Y186.91 E.12007
G1 X90.82 Y186.377
G1 X93.583 Y183.614 E.12007
G1 X93.583 Y183.081
G1 X90.82 Y185.844 E.12006
G1 X90.82 Y185.31
G1 X93.583 Y182.547 E.12006
G1 X93.583 Y182.014
G1 X90.82 Y184.777 E.12006
G1 X90.82 Y184.244
G1 X93.583 Y181.481 E.12006
G1 X93.583 Y180.948
G1 X90.82 Y183.711 E.12006
G1 X90.82 Y183.177
G1 X93.583 Y180.414 E.12006
G1 X93.583 Y179.881
G1 X90.82 Y182.644 E.12006
G1 X90.82 Y182.111
G1 X93.583 Y179.348 E.12005
G1 X93.583 Y178.815
G1 X90.82 Y181.577 E.12005
G1 X90.82 Y181.044
G1 X93.583 Y178.281 E.12005
G1 X93.583 Y177.748
G1 X90.82 Y180.511 E.12005
G1 X90.82 Y179.978
G1 X93.583 Y177.215 E.12005
G1 X93.583 Y176.682
G1 X90.82 Y179.444 E.12005
G1 X90.82 Y178.911
G1 X93.583 Y176.148 E.12005
G1 X93.583 Y175.615
G1 X90.82 Y178.378 E.12004
G1 X90.82 Y177.844
G1 X93.583 Y175.082 E.12004
G1 X93.583 Y174.549
G1 X90.82 Y177.311 E.12004
G1 X90.82 Y176.778
G1 X93.583 Y174.015 E.12004
G1 X93.583 Y173.482
G1 X90.82 Y176.244 E.12004
G1 X90.82 Y175.711
G1 X93.583 Y172.949 E.12004
G1 X93.583 Y172.416
G1 X90.82 Y175.178 E.12004
G1 X90.82 Y174.645
G1 X93.583 Y171.882 E.12003
G1 X93.583 Y171.349
G1 X90.82 Y174.111 E.12003
G1 X90.82 Y173.578
G1 X93.583 Y170.816 E.12003
G1 X93.583 Y170.283
G1 X90.82 Y173.045 E.12003
G1 X90.82 Y172.511
G1 X93.583 Y169.749 E.12003
G1 X93.583 Y169.216
G1 X90.821 Y171.978 E.12003
G1 X90.821 Y171.445
G1 X93.583 Y168.683 E.12003
G1 X93.583 Y168.15
G1 X90.821 Y170.912 E.12002
G1 X90.821 Y170.378
G1 X93.583 Y167.616 E.12002
G1 X93.583 Y167.083
G1 X90.821 Y169.845 E.12002
G1 X90.821 Y169.312
G1 X93.583 Y166.55 E.12002
G1 X93.583 Y166.017
G1 X90.821 Y168.778 E.12002
G1 X90.821 Y168.245
G1 X93.583 Y165.483 E.12002
G1 X93.583 Y164.95
G1 X90.821 Y167.712 E.12002
G1 X90.821 Y167.179
G1 X93.583 Y164.417 E.12001
G1 X93.583 Y163.883
G1 X90.821 Y166.645 E.12001
G1 X90.821 Y166.112
G1 X93.583 Y163.35 E.12001
G1 X93.583 Y162.817
G1 X90.821 Y165.579 E.12001
G1 X90.821 Y165.045
G1 X93.583 Y162.284 E.12001
G1 X93.583 Y161.75
G1 X90.821 Y164.512 E.12001
G1 X90.821 Y163.979
G1 X93.583 Y161.217 E.12001
G1 X93.583 Y160.684
G1 X90.821 Y163.446 E.12
G1 X90.821 Y162.912
G1 X93.583 Y160.151 E.12
G1 X93.59 Y159.61
G1 X90.821 Y162.379 E.12032
G1 X90.821 Y161.846
G1 X98.749 Y153.917 E.34452
G1 X98.216 Y153.917
G1 X90.821 Y161.312 E.32135
G1 X90.821 Y160.779
G1 X97.683 Y153.917 E.29817
G1 X97.15 Y153.917
G1 X90.821 Y160.246 E.275
G1 X90.821 Y159.712
G1 X96.616 Y153.917 E.25183
G1 X96.083 Y153.917
G1 X90.86 Y159.14 E.22696
G1 X91.016 Y158.451
G1 X95.55 Y153.917 E.197
G1 X95.017 Y153.917
G1 X91.473 Y157.461 E.15398
; WIPE_START
M204 S10000
G1 X92.887 Y156.047 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.518 Y155.883 Z12.4 F30000
G1 Z12
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X94.483 Y153.917 E.0854
G1 X93.95 Y153.917
G1 X91.985 Y155.883 E.0854
G1 X91.452 Y155.883
G1 X93.417 Y153.917 E.0854
G1 X92.884 Y153.917
G1 X90.918 Y155.883 E.0854
G1 X90.385 Y155.883
G1 X92.35 Y153.917 E.0854
G1 X91.817 Y153.917
G1 X89.852 Y155.883 E.0854
G1 X89.319 Y155.883
G1 X91.284 Y153.917 E.0854
G1 X90.751 Y153.917
G1 X88.785 Y155.883 E.0854
G1 X88.252 Y155.883
G1 X90.217 Y153.917 E.0854
G1 X89.684 Y153.917
G1 X87.719 Y155.883 E.0854
G1 X87.186 Y155.883
G1 X89.151 Y153.917 E.0854
G1 X88.618 Y153.917
G1 X86.652 Y155.883 E.0854
G1 X86.119 Y155.883
G1 X88.084 Y153.917 E.0854
G1 X87.551 Y153.917
G1 X85.586 Y155.883 E.0854
G1 X85.052 Y155.883
G1 X87.018 Y153.917 E.0854
G1 X86.484 Y153.917
G1 X84.519 Y155.883 E.0854
G1 X83.986 Y155.883
G1 X85.951 Y153.917 E.0854
G1 X85.418 Y153.917
G1 X83.453 Y155.883 E.0854
G1 X82.919 Y155.883
G1 X84.885 Y153.917 E.0854
G1 X84.351 Y153.917
G1 X82.406 Y155.863 E.08454
G1 X81.927 Y155.808
G1 X83.818 Y153.917 E.08216
G1 X83.285 Y153.917
G1 X81.485 Y155.717 E.07822
G1 X81.088 Y155.581
G1 X82.752 Y153.917 E.0723
G1 X82.261 Y153.875
G1 X80.711 Y155.425 E.06735
G1 X80.369 Y155.234
G1 X81.84 Y153.762 E.06394
G1 X81.471 Y153.598
G1 X80.044 Y155.025 E.06202
G1 X79.742 Y154.794
G1 X81.143 Y153.393 E.06086
G1 X80.85 Y153.153
G1 X79.468 Y154.534 E.06004
G1 X79.209 Y154.261
G1 X80.609 Y152.86 E.06087
G1 X80.404 Y152.532
G1 X78.977 Y153.959 E.062
G1 X78.762 Y153.641
G1 X80.239 Y152.164 E.06417
G1 X80.125 Y151.744
G1 X78.582 Y153.288 E.06705
G1 X78.42 Y152.916
G1 X80.083 Y151.254 E.07224
G1 X80.083 Y150.721
G1 X78.285 Y152.518 E.07811
G1 X78.193 Y152.077
G1 X80.083 Y150.187 E.08212
G1 X80.083 Y149.654
G1 X78.138 Y151.599 E.08452
G1 X78.117 Y151.086
G1 X80.083 Y149.121 E.0854
G1 X80.083 Y148.588
G1 X78.117 Y150.553 E.0854
G1 X78.117 Y150.02
G1 X80.083 Y148.054 E.0854
G1 X80.083 Y147.521
G1 X78.117 Y149.486 E.0854
G1 X78.117 Y148.953
G1 X80.083 Y146.988 E.0854
G1 X80.083 Y146.455
G1 X78.117 Y148.42 E.0854
G1 X78.117 Y147.887
G1 X80.083 Y145.921 E.0854
G1 X80.083 Y145.388
G1 X78.117 Y147.353 E.0854
G1 X78.117 Y146.82
G1 X80.083 Y144.855 E.0854
G1 X80.083 Y144.322
G1 X78.117 Y146.287 E.0854
G1 X78.117 Y145.754
G1 X80.083 Y143.788 E.0854
G1 X80.083 Y143.255
G1 X78.117 Y145.22 E.0854
G1 X78.117 Y144.687
G1 X80.083 Y142.722 E.0854
G1 X80.083 Y142.188
G1 X78.117 Y144.154 E.0854
G1 X78.117 Y143.62
G1 X80.083 Y141.655 E.0854
G1 X80.083 Y141.122
G1 X78.117 Y143.087 E.0854
G1 X78.117 Y142.554
G1 X80.083 Y140.589 E.0854
G1 X80.083 Y140.055
G1 X78.117 Y142.021 E.0854
G1 X78.117 Y141.487
G1 X80.083 Y139.522 E.0854
G1 X80.083 Y138.989
G1 X78.117 Y140.954 E.0854
G1 X78.117 Y140.421
G1 X80.083 Y138.456 E.0854
G1 X80.083 Y137.922
G1 X78.117 Y139.888 E.0854
G1 X78.117 Y139.354
G1 X80.083 Y137.389 E.0854
G1 X80.083 Y136.856
G1 X78.117 Y138.821 E.0854
G1 X78.117 Y138.288
G1 X80.083 Y136.323 E.0854
G1 X80.083 Y135.789
G1 X78.117 Y137.755 E.0854
G1 X78.117 Y137.221
G1 X80.083 Y135.256 E.0854
G1 X80.083 Y134.723
G1 X78.117 Y136.688 E.0854
G1 X78.117 Y136.155
G1 X80.083 Y134.19 E.0854
G1 X80.083 Y133.656
G1 X78.117 Y135.622 E.0854
G1 X78.117 Y135.088
G1 X80.083 Y133.123 E.0854
G1 X80.083 Y132.59
G1 X78.117 Y134.555 E.0854
G1 X78.117 Y134.022
G1 X80.083 Y132.057 E.0854
G1 X80.083 Y131.523
G1 X78.117 Y133.489 E.0854
G1 X78.117 Y132.955
G1 X80.083 Y130.99 E.0854
G1 X80.083 Y130.457
G1 X78.117 Y132.422 E.0854
G1 X78.117 Y131.889
G1 X80.083 Y129.924 E.0854
G1 X80.083 Y129.39
G1 X78.117 Y131.356 E.0854
G1 X78.117 Y130.822
G1 X80.083 Y128.857 E.0854
G1 X80.083 Y128.324
G1 X78.117 Y130.289 E.0854
G1 X78.117 Y129.756
G1 X80.083 Y127.791 E.0854
G1 X80.083 Y127.257
G1 X78.117 Y129.223 E.0854
G1 X78.117 Y128.689
G1 X80.083 Y126.724 E.0854
G1 X80.083 Y126.191
G1 X78.117 Y128.156 E.0854
G1 X78.117 Y127.623
G1 X80.083 Y125.658 E.0854
G1 X80.083 Y125.124
G1 X78.117 Y127.089 E.0854
G1 X78.117 Y126.556
G1 X80.083 Y124.591 E.0854
G1 X80.083 Y124.058
G1 X78.117 Y126.023 E.0854
G1 X78.117 Y125.49
G1 X80.083 Y123.524 E.0854
G1 X80.083 Y122.991
G1 X78.117 Y124.956 E.0854
G1 X78.117 Y124.423
G1 X80.083 Y122.458 E.0854
G1 X80.083 Y121.925
G1 X78.117 Y123.89 E.0854
G1 X78.117 Y123.357
G1 X80.083 Y121.391 E.0854
G1 X80.083 Y120.858
G1 X78.117 Y122.823 E.0854
G1 X78.117 Y122.29
G1 X80.083 Y120.325 E.0854
G1 X80.083 Y119.792
G1 X78.117 Y121.757 E.0854
G1 X78.117 Y121.224
G1 X80.083 Y119.258 E.0854
G1 X80.083 Y118.725
G1 X78.117 Y120.69 E.0854
G1 X78.117 Y120.157
G1 X80.083 Y118.192 E.0854
G1 X80.083 Y117.659
G1 X78.117 Y119.624 E.0854
G1 X78.117 Y119.091
G1 X80.083 Y117.125 E.0854
G1 X80.083 Y116.592
G1 X78.117 Y118.557 E.0854
G1 X78.117 Y118.024
G1 X80.083 Y116.059 E.0854
G1 X80.083 Y115.526
G1 X78.117 Y117.491 E.0854
G1 X78.117 Y116.958
G1 X80.083 Y114.992 E.0854
G1 X80.083 Y114.459
G1 X78.117 Y116.424 E.0854
G1 X78.117 Y115.891
G1 X80.083 Y113.926 E.0854
G1 X80.083 Y113.393
G1 X78.117 Y115.358 E.0854
G1 X78.117 Y114.825
G1 X80.083 Y112.859 E.0854
G1 X80.083 Y112.326
G1 X78.117 Y114.291 E.0854
G1 X78.117 Y113.758
G1 X80.083 Y111.793 E.0854
G1 X80.083 Y111.26
G1 X78.117 Y113.225 E.0854
G1 X78.117 Y112.692
G1 X80.083 Y110.726 E.0854
G1 X80.083 Y110.193
G1 X78.117 Y112.158 E.0854
G1 X78.117 Y111.625
G1 X80.083 Y109.66 E.0854
G1 X80.083 Y109.127
G1 X78.117 Y111.092 E.0854
G1 X78.117 Y110.559
G1 X80.083 Y108.593 E.0854
G1 X80.083 Y108.06
G1 X78.117 Y110.025 E.0854
G1 X78.117 Y109.492
G1 X80.083 Y107.527 E.0854
G1 X80.083 Y106.993
G1 X78.117 Y108.959 E.0854
G1 X78.117 Y108.425
G1 X80.083 Y106.46 E.0854
G1 X80.083 Y105.927
G1 X78.117 Y107.892 E.0854
G1 X78.117 Y107.359
G1 X80.083 Y105.394 E.0854
G1 X80.083 Y104.86
G1 X78.117 Y106.826 E.0854
G1 X78.117 Y106.292
G1 X80.083 Y104.327 E.0854
G1 X80.083 Y103.794
G1 X78.117 Y105.759 E.0854
G1 X78.117 Y105.226
G1 X80.083 Y103.261 E.0854
G1 X80.083 Y102.727
G1 X78.117 Y104.693 E.0854
G1 X78.117 Y104.159
G1 X80.083 Y102.194 E.0854
G1 X80.083 Y101.661
G1 X78.117 Y103.626 E.0854
G1 X78.117 Y103.093
G1 X80.083 Y101.128 E.0854
G1 X80.083 Y100.594
G1 X78.117 Y102.56 E.0854
G1 X78.117 Y102.026
G1 X80.083 Y100.061 E.0854
G1 X80.083 Y99.528
G1 X78.117 Y101.493 E.0854
G1 X78.117 Y100.96
G1 X80.083 Y98.995 E.0854
G1 X80.083 Y98.461
G1 X78.117 Y100.427 E.0854
G1 X78.117 Y99.893
G1 X80.083 Y97.928 E.0854
G1 X80.083 Y97.395
G1 X78.117 Y99.36 E.0854
G1 X78.117 Y98.827
G1 X80.083 Y96.862 E.0854
G1 X80.083 Y96.328
G1 X78.117 Y98.294 E.0854
G1 X78.117 Y97.76
G1 X80.083 Y95.795 E.0854
G1 X80.083 Y95.262
G1 X78.117 Y97.227 E.0854
G1 X78.117 Y96.694
G1 X80.083 Y94.729 E.0854
G1 X80.083 Y94.195
G1 X78.117 Y96.161 E.0854
G1 X78.117 Y95.627
G1 X80.083 Y93.662 E.0854
G1 X80.083 Y93.129
G1 X78.117 Y95.094 E.0854
G1 X78.117 Y94.561
G1 X80.083 Y92.596 E.0854
G1 X80.083 Y92.062
G1 X78.117 Y94.028 E.0854
G1 X78.117 Y93.494
G1 X80.083 Y91.529 E.0854
G1 X80.083 Y90.996
G1 X78.117 Y92.961 E.0854
G1 X78.117 Y92.428
G1 X80.083 Y90.463 E.0854
G1 X80.083 Y89.929
G1 X78.117 Y91.895 E.0854
G1 X78.117 Y91.361
G1 X80.083 Y89.396 E.0854
G1 X80.083 Y88.863
G1 X78.117 Y90.828 E.0854
G1 X78.117 Y90.295
G1 X80.083 Y88.329 E.0854
G1 X80.083 Y87.796
G1 X78.117 Y89.761 E.0854
G1 X78.117 Y89.228
G1 X80.083 Y87.263 E.0854
G1 X80.083 Y86.73
G1 X78.117 Y88.695 E.0854
G1 X78.117 Y88.162
G1 X80.083 Y86.196 E.0854
G1 X80.083 Y85.663
G1 X78.117 Y87.628 E.0854
G1 X78.117 Y87.095
G1 X80.083 Y85.13 E.0854
G1 X80.083 Y84.597
G1 X78.117 Y86.562 E.0854
G1 X78.117 Y86.029
G1 X80.083 Y84.063 E.0854
G1 X80.083 Y83.53
G1 X78.117 Y85.495 E.0854
G1 X78.117 Y84.962
G1 X80.083 Y82.997 E.0854
G1 X80.083 Y82.464
G1 X78.117 Y84.429 E.0854
G1 X78.117 Y83.896
G1 X80.083 Y81.93 E.0854
G1 X80.083 Y81.397
G1 X78.117 Y83.362 E.0854
G1 X78.117 Y82.829
G1 X80.083 Y80.864 E.0854
G1 X80.083 Y80.331
G1 X78.117 Y82.296 E.0854
G1 X78.117 Y81.763
G1 X80.083 Y79.797 E.0854
G1 X80.083 Y79.264
G1 X78.117 Y81.229 E.0854
G1 X78.117 Y80.696
G1 X80.083 Y78.731 E.0854
G1 X80.083 Y78.198
G1 X78.117 Y80.163 E.0854
G1 X78.117 Y79.63
G1 X80.083 Y77.664 E.0854
G1 X80.083 Y77.131
G1 X78.117 Y79.096 E.0854
G1 X78.117 Y78.563
G1 X80.083 Y76.598 E.0854
G1 X80.083 Y76.065
G1 X78.117 Y78.03 E.0854
G1 X78.117 Y77.497
G1 X80.083 Y75.531 E.0854
G1 X80.083 Y74.998
G1 X78.117 Y76.963 E.0854
G1 X78.117 Y76.43
G1 X80.083 Y74.465 E.0854
G1 X80.083 Y73.932
G1 X78.117 Y75.897 E.0854
G1 X78.117 Y75.364
G1 X80.083 Y73.398 E.0854
G1 X80.083 Y72.865
G1 X78.117 Y74.83 E.0854
G1 X78.117 Y74.297
G1 X80.083 Y72.332 E.0854
G1 X80.083 Y71.799
G1 X78.117 Y73.764 E.0854
G1 X78.117 Y73.23
G1 X80.083 Y71.265 E.0854
G1 X80.083 Y70.732
G1 X78.117 Y72.697 E.0854
G1 X78.117 Y72.164
G1 X80.083 Y70.199 E.0854
G1 X80.083 Y69.665
G1 X78.117 Y71.631 E.0854
G1 X78.117 Y71.097
G1 X80.083 Y69.132 E.0854
G1 X80.083 Y68.599
G1 X78.117 Y70.564 E.0854
G1 X78.117 Y70.031
G1 X80.083 Y68.066 E.0854
G1 X80.083 Y67.532
G1 X78.117 Y69.498 E.0854
G1 X78.117 Y68.964
G1 X80.083 Y66.999 E.0854
G1 X80.083 Y66.466
G1 X78.117 Y68.431 E.0854
G1 X78.117 Y67.898
G1 X80.083 Y65.933 E.0854
M73 P99 R0
G1 X80.083 Y65.399
G1 X78.117 Y67.365 E.0854
G1 X78.117 Y66.831
G1 X80.083 Y64.866 E.0854
G1 X80.083 Y64.333
G1 X78.117 Y66.298 E.0854
G1 X78.117 Y65.765
G1 X80.083 Y63.8 E.0854
G1 X80.083 Y63.266
G1 X78.117 Y65.232 E.0854
G1 X78.117 Y64.698
G1 X80.083 Y62.733 E.0854
G1 X80.083 Y62.2
G1 X78.117 Y64.165 E.0854
G1 X78.117 Y63.632
G1 X80.083 Y61.667 E.0854
G1 X80.083 Y61.133
G1 X78.117 Y63.099 E.0854
G1 X78.117 Y62.565
G1 X80.092 Y60.591 E.08581
G1 X80.206 Y59.943
G1 X78.117 Y62.032 E.09078
G1 X78.117 Y61.499
G1 X83.499 Y56.117 E.23385
G1 X82.966 Y56.117
G1 X78.117 Y60.966 E.21068
G1 X78.137 Y60.413
G1 X82.413 Y56.137 E.18582
G1 X81.799 Y56.217
G1 X78.217 Y59.799 E.15564
G1 X78.431 Y59.052
G1 X81.052 Y56.431 E.11392
M204 S10000
G1 X80.505 Y56.684 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.101976
G1 F15000
G1 X80.418 Y56.747 E.00052
; LINE_WIDTH: 0.135269
G1 X80.264 Y56.873 E.0015
; LINE_WIDTH: 0.174218
G1 X80.111 Y56.999 E.00213
; LINE_WIDTH: 0.213166
G1 X79.957 Y57.125 E.00276
; LINE_WIDTH: 0.251912
G2 X79.125 Y57.957 I5.93 J6.762 E.02005
; LINE_WIDTH: 0.213176
G1 X78.999 Y58.111 E.00276
; LINE_WIDTH: 0.174218
G1 X78.873 Y58.264 E.00213
; LINE_WIDTH: 0.13526
G1 X78.747 Y58.418 E.0015
; LINE_WIDTH: 0.101982
G1 X78.684 Y58.505 E.00052
; WIPE_START
G1 X78.747 Y58.418 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X86.379 Y58.437 Z12.4 F30000
G1 X177.403 Y58.661 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.10011
G1 F15000
G1 X177.32 Y58.549 E.00065
; WIPE_START
G1 X177.403 Y58.661 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.395 Y66.293 Z12.4 F30000
G1 X177.31 Y153.506 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.0999886
G1 F15000
G1 X177.255 Y153.583 E.00044
; LINE_WIDTH: 0.131303
G1 X177.129 Y153.737 E.00143
; LINE_WIDTH: 0.170267
G1 X177.002 Y153.891 E.00206
; LINE_WIDTH: 0.209231
G1 X176.876 Y154.044 E.00269
; LINE_WIDTH: 0.24787
G3 X176.042 Y154.878 I-6.76 J-5.928 E.01971
; LINE_WIDTH: 0.208762
G1 X175.888 Y155.004 E.00269
; LINE_WIDTH: 0.169674
G1 X175.734 Y155.131 E.00206
; LINE_WIDTH: 0.130586
G1 X175.58 Y155.257 E.00142
; LINE_WIDTH: 0.0996074
G1 X175.499 Y155.317 E.00046
; WIPE_START
G1 X175.58 Y155.257 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X175.862 Y152.136 Z12.4 F30000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.124671
G1 F15000
G3 X175.635 Y152.46 I-3.417 J-2.154 E.00264
; WIPE_START
G1 X175.862 Y152.136 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X170.466 Y146.739 Z12.4 F30000
G1 X81.872 Y58.135 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.122146
G1 F15000
G2 X81.552 Y58.358 I2.072 J3.309 E.00252
; WIPE_START
G1 X81.872 Y58.135 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X80.358 Y59.552 Z12.4 F30000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.122143
G1 F15000
G2 X80.135 Y59.872 I3.129 J2.424 E.00252
; WIPE_START
G1 X80.358 Y59.552 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.223 Y67.135 Z12.4 F30000
G1 X91.532 Y157.519 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.214191
G1 F15000
G1 X91.435 Y157.646 E.00222
; LINE_WIDTH: 0.1842
G1 X91.339 Y157.772 E.00183
; LINE_WIDTH: 0.148948
G1 X91.27 Y157.873 E.00106
; LINE_WIDTH: 0.108425
G1 X91.201 Y157.974 E.00065
; WIPE_START
G1 X91.27 Y157.873 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.319 Y165.505 Z12.4 F30000
G1 X91.503 Y193.959 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.0934948
G1 F15000
G3 X91.423 Y193.862 I.664 J-.626 E.00052
; WIPE_START
G1 X91.503 Y193.959 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.135 Y193.987 Z12.4 F30000
G1 X164.322 Y194.227 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.110994
G1 F15000
G3 X163.525 Y195.023 I-6.83 J-6.043 E.00626
; WIPE_START
G1 X164.015 Y194.564 E-.45246
G1 X164.322 Y194.227 E-.30754
; WIPE_END
G1 E-.04 F1800
G1 X164.492 Y186.596 Z12.4 F30000
G1 X165.097 Y159.413 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.0889853
G1 F15000
G1 X165.166 Y159.224 E.00075
; WIPE_START
G1 X165.097 Y159.413 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X164.696 Y157.746 Z12.4 F30000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.098162
G1 F15000
G2 X164.615 Y157.642 I-1.1 J.766 E.00059
; WIPE_START
G1 X164.696 Y157.746 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.73 Y154.784 Z12.4 F30000
G1 X174.46 Y153.635 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.124701
G1 F15000
G3 X174.136 Y153.862 I-2.448 J-3.15 E.00264
; WIPE_START
G1 X174.46 Y153.635 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X166.846 Y154.17 Z12.4 F30000
G1 X93.639 Y159.311 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.136464
G1 F15000
G1 X93.518 Y159.538 E.00196
; WIPE_START
G1 X93.639 Y159.311 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.521 Y162.61 Z12.4 F30000
G1 X162.384 Y192.261 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.201165
G1 F15000
G3 X162.317 Y192.363 I-.925 J-.533 E.00158
; LINE_WIDTH: 0.174674
G1 X162.203 Y192.502 E.00192
; LINE_WIDTH: 0.143445
G1 X161.946 Y192.784 E.00313
G3 X161.574 Y193.084 I-2.764 J-3.034 E.00392
; WIPE_START
G1 X161.946 Y192.784 E-.42263
G1 X162.203 Y192.502 E-.33737
; WIPE_END
G1 E-.04 F1800
G1 X155.401 Y189.04 Z12.4 F30000
G1 X94.838 Y158.218 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.136395
G1 F15000
G1 X94.611 Y158.339 E.00196
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X94.838 Y158.218 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.217 J0 P1  F30000
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z12.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z112 F600
    G1 Z110

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

