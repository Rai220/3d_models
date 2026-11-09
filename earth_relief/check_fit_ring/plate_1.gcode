; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 7m 40s; total estimated time: 14m 11s
; total layer number: 31
; total filament length [mm] : 983.51
; total filament volume [cm^3] : 2365.62
; total filament weight [g] : 2.93
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 5.00
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
; bottom_color_penetration_layers = 4
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
; filament_colour = #FFFFFF
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
; gap_infill_speed = 300
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
; inner_wall_speed = 150
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
; internal_solid_infill_speed = 300
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
; layer_height = 0.16
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
; outer_wall_speed = 60
; overhang_1_4_speed = 60
; overhang_2_4_speed = 30
; overhang_3_4_speed = 10
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
; print_settings_id = 0.16mm Tactile Earth @P1S
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
; sparse_infill_density = 100%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = zig-zag
; sparse_infill_speed = 330
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
; support_bottom_z_distance = 0.16
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
; support_on_build_plate_only = 1
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
; top_color_penetration_layers = 6
; top_one_wall_type = all top
; top_shell_layers = 6
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
; wall_loops = 3
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
M73 P0 R14
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
M73 P4 R13
G1 E50 F200
M400
M104 S220
G92 E0
M73 P34 R9
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P36 R9
G1 E-0.5 F300

M73 P38 R8
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
M73 P39 R8
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
    G29 A X95.6024 Y95.6024 I64.7951 J64.7951
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
G1 F30000
M73 P40 R8
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
G0 X240 E15 F1480.95
G0 Y11 E0.700 F370.237
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F1480.95
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
; layer num/total_layer_count: 1/31
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
; OBJECT_ID: 15
G1 X127.624 Y156.398 F30000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
M204 S500
G1 X126.137 Y156.342 E.05542
G3 X101.361 Y111.353 I1.861 J-30.341 E2.27837
G3 X100.27 Y110.402 I2.188 J-3.612 E.05419
M73 P41 R8
G1 X102.502 Y106.971 E.15243
G3 X103.814 Y107.583 I-1.103 J4.076 E.05418
G3 X127.992 Y95.602 I24.218 J18.486 E1.0412
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
G3 X127.683 Y156.397 I.006 J30.398 E3.5689
; WIPE_START
G1 X126.137 Y156.342 E-.58818
G1 X125.686 Y156.303 E-.17182
; WIPE_END
G1 E-.04
M204 S6000
G1 X127.614 Y157.531 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
M204 S500
G1 X126.84 Y157.52 E.02883
G3 X99.831 Y111.808 I1.159 J-31.52 E2.35046
G2 X100.188 Y110.982 I-7.228 J-3.618 E.03356
M73 P42 R8
G2 X100.764 Y111.5 I2.263 J-1.936 E.02894
G2 X104.883 Y105.56 I27.241 J14.492 E6.95121
G2 X103.706 Y106.978 I24.928 J21.894 E.06863
G2 X102.999 Y106.661 I-1.561 J2.539 E.02894
G2 X104.37 Y105.106 I-24.37 J-22.856 E.07721
G3 X128.765 Y94.469 I23.663 J20.977 E1.02314
G3 X128.387 Y157.539 I-.767 J31.532 E3.64762
G1 X127.674 Y157.532 E.02659
M204 S6000
G1 X127.608 Y157.988 F30000
; FEATURE: Outer wall
G1 F1800
M204 S500
G1 X126.823 Y157.977 E.02924
G3 X99.419 Y111.61 I1.175 J-31.976 E2.38423
G2 X99.854 Y110.476 I-5.12 J-2.617 E.04532
G3 X102.401 Y106.561 I28.987 J16.072 E.17411
G2 X103.261 Y105.703 I-3.606 J-4.476 E.04532
M73 P43 R8
G3 X128.777 Y94.012 I24.77 J20.37 E1.08198
G3 X128.393 Y157.996 I-.778 J31.989 E3.70048
G1 X127.668 Y157.989 E.027
; WIPE_START
G1 X126.823 Y157.977 E-.32117
G1 X126.039 Y157.94 E-.29843
G1 X125.67 Y157.908 E-.1404
; WIPE_END
G1 E-.04
M204 S6000
G1 X122.013 Y151.209 Z.6 F30000
G1 X100.273 Y111.393 Z.6
M73 P44 R7
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.271522
M204 S500
G1 X100.313 Y111.556 E.00313
G3 X100.299 Y111.63 I-.089 J.022 E.00143
G1 X99.634 Y113.007 E.02848
M73 P45 R7
G1 X99.323 Y113.709 E.01431
G1 X98.755 Y115.128 E.02848
G1 X98.496 Y115.853 E.01433
G2 X103.871 Y106.223 I29.501 J10.15 E3.44507
G1 X103.635 Y106.502 E.00681
G3 X103.575 Y106.542 I-.054 J-.017 E.00145
G1 X103.41 Y106.572 E.00313
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
M73 P46 R7
G1 F1800
G1 X103.575 Y106.542 E-.06386
G1 X103.607 Y106.536 E-.01252
G1 X103.635 Y106.502 E-.01649
G1 X103.871 Y106.223 E-.139
G1 X104.626 Y105.333 E-.44332
G1 X104.778 Y105.17 E-.08482
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 2/31
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I-1.111 J.497 P1  F30000
G1 X127.63 Y156.198 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.369 J-30.203 E1.56967
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
M73 P47 R7
G1 X103.861 Y107.839 E.03952
G3 X127.629 Y95.792 I24.177 J18.231 E.69369
G3 X127.69 Y156.199 I.37 J30.203 E2.40281
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.5862
G1 X125.692 Y156.114 E-.1738
; WIPE_END
M73 P48 R7
G1 E-.04 F1800
G1 X127.616 Y157.368 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X100.245 Y111.376 I.384 J-31.37 E1.7371
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X129.11 Y94.647 I24.624 J19.456 E.79704
M73 P49 R7
G3 X127.676 Y157.369 I-1.109 J31.352 E2.64936
G1 X127.611 Y157.784 F30000
G1 F9000
G3 X100.092 Y110.78 I.389 J-31.785 E1.77249
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X129.125 Y94.231 I25.231 J19.357 E.81996
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
G3 X127.671 Y157.785 I-1.125 J31.768 E2.68445
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.128 E.0397
G3 X127.605 Y93.812 I1.962 J-32.129 E2.48336
G3 X129.14 Y93.831 I.395 J31.306 E.0386
G3 X127.664 Y158.186 I-1.15 J32.168 E2.52166
; WIPE_START
M204 S10000
G1 X126.027 Y158.128 E-.62228
G1 X125.666 Y158.097 E-.13772
; WIPE_END
G1 E-.04 F1800
G1 X122.155 Y151.32 Z.76 F30000
G1 X100.555 Y109.622 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104207
G1 F18000
G3 X101.904 Y107.547 I77.534 J48.964 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47056
G1 X100.81 Y109.221 E-.28944
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/31
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.76 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.198 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.369 J-30.203 E1.56967
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
M73 P50 R7
G3 X127.629 Y95.792 I24.176 J18.229 E.69369
G3 X127.69 Y156.199 I.37 J30.203 E2.40281
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.5862
G1 X125.692 Y156.114 E-.1738
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z.92 F30000
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.35 E.02088
G3 X100.245 Y111.376 I1.155 J-31.351 E1.71621
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X129.085 Y94.646 I24.623 J19.455 E.79637
G3 X128.385 Y157.368 I-1.085 J31.353 E2.63081
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.784 F30000
G1 F9000
M73 P50 R6
G3 X100.092 Y110.78 I.389 J-31.785 E1.7725
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X129.1 Y94.231 I25.23 J19.356 E.81929
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
G3 X127.671 Y157.785 I-1.1 J31.769 E2.68511
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P51 R6
G1 F3600
M204 S5000
G1 X126.816 Y158.167 E.01987
G3 X126.026 Y93.871 I1.176 J-32.168 E2.46337
G3 X129.115 Y93.83 I2.108 J42.918 E.07768
G3 X128.395 Y158.186 I-1.123 J32.169 E2.50405
G1 X127.666 Y158.178 E.01834
; WIPE_START
M204 S10000
G1 X126.816 Y158.167 E-.32312
G1 X126.027 Y158.129 E-.29996
G1 X125.668 Y158.099 E-.13692
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z.92 F30000
G1 X100.555 Y109.622 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104207
G1 F18000
G3 X101.904 Y107.547 I77.534 J48.964 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47056
G1 X100.81 Y109.221 E-.28944
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/31
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.92 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.198 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.369 J-30.203 E1.56967
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.629 Y95.792 I24.175 J18.228 E.69369
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
G3 X127.69 Y156.199 I.37 J30.203 E2.40281
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.5862
G1 X125.692 Y156.114 E-.1738
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.35 E.02088
G3 X100.245 Y111.376 I1.155 J-31.35 E1.71622
M73 P52 R6
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X129.06 Y94.645 I24.622 J19.454 E.79569
G3 X128.385 Y157.369 I-1.06 J31.354 E2.63148
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.765 E.02115
G3 X100.092 Y110.78 I1.17 J-31.766 E1.75134
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X129.075 Y94.23 I25.229 J19.355 E.81859
G3 X128.39 Y157.784 I-1.075 J31.769 E2.66631
G1 X127.671 Y157.778 E.01949
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.815 Y158.167 E.01987
G3 X126.026 Y93.871 I1.174 J-32.167 E2.46349
G3 X129.089 Y93.829 I2.109 J42.954 E.07703
G3 X128.395 Y158.186 I-1.1 J32.17 E2.50454
G1 X127.666 Y158.178 E.01834
; WIPE_START
M204 S10000
G1 X126.815 Y158.167 E-.32313
G1 X125.668 Y158.097 E-.43687
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.32 Z1.08 F30000
G1 X100.555 Y109.622 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104212
G1 F18000
G3 X101.904 Y107.547 I77.488 J48.934 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47058
G1 X100.81 Y109.221 E-.28942
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/31
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.08 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.198 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P53 R6
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.369 J-30.203 E1.56967
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.629 Y95.792 I24.174 J18.227 E.6937
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
G3 X127.69 Y156.199 I.37 J30.203 E2.40281
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.5862
G1 X125.692 Y156.114 E-.1738
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z1.24 F30000
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.343 E.02088
G3 X100.245 Y111.376 I1.153 J-31.347 E1.71604
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X129.046 Y94.645 I24.622 J19.453 E.79531
G3 X128.385 Y157.362 I-1.048 J31.351 E2.63148
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.168 J-31.763 E1.75116
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X129.056 Y94.229 I25.229 J19.354 E.81809
M73 P54 R6
G3 X128.39 Y157.778 I-1.058 J31.767 E2.66642
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.129 E.0397
G3 X125.237 Y93.929 I1.963 J-32.129 E2.42376
G3 X129.066 Y93.829 I2.78 J33.119 E.09635
G3 X127.665 Y158.187 I-1.076 J32.171 E2.52352
; WIPE_START
M204 S10000
G1 X126.027 Y158.129 E-.62273
G1 X125.667 Y158.098 E-.13727
; WIPE_END
G1 E-.04 F1800
G1 X122.156 Y151.321 Z1.24 F30000
G1 X100.555 Y109.622 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104212
G1 F18000
G3 X101.904 Y107.547 I77.488 J48.934 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47058
G1 X100.81 Y109.221 E-.28942
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/31
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.24 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.199 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.368 J-30.203 E1.56971
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X128.232 Y95.792 I24.172 J18.226 E.70884
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
G3 X127.69 Y156.2 I-.234 J30.204 E2.38757
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.5862
G1 X125.692 Y156.114 E-.1738
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.343 E.02088
G3 X100.245 Y111.376 I1.153 J-31.347 E1.71605
M73 P55 R6
G1 X100.537 Y111.566 E.00944
G2 X97.781 Y118.976 I27.561 J14.471 E.21483
G2 X103.674 Y106.744 I30.216 J7.022 E4.91057
G1 X103.382 Y106.554 E.00944
G3 X129.02 Y94.644 I24.621 J19.453 E.79461
G3 X128.385 Y157.362 I-1.022 J31.352 E2.63215
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75116
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X129.031 Y94.229 I25.228 J19.354 E.8174
G3 X128.39 Y157.778 I-1.033 J31.767 E2.6671
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.128 E.0397
G3 X124.452 Y94.006 I1.963 J-32.129 E2.40386
G3 X129.041 Y93.828 I3.691 J35.939 E.11553
G3 X127.664 Y158.186 I-1.051 J32.171 E2.52415
; WIPE_START
M204 S10000
G1 X126.027 Y158.128 E-.62238
G1 X125.666 Y158.097 E-.13762
; WIPE_END
G1 E-.04 F1800
G1 X122.156 Y151.32 Z1.4 F30000
G1 X100.555 Y109.622 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104212
G1 F18000
G3 X101.904 Y107.547 I77.488 J48.934 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47058
G1 X100.81 Y109.221 E-.28942
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/31
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.4 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.206 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
M73 P56 R6
G3 X101.614 Y111.292 I.37 J-30.206 E1.56988
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X128.209 Y95.792 I24.171 J18.225 E.70825
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
G3 X127.69 Y156.206 I-.209 J30.207 E2.3885
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58625
G1 X125.693 Y156.114 E-.17375
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.343 E.02088
G3 X100.245 Y111.376 I1.153 J-31.347 E1.71606
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.462 J14.434 E5.12599
G1 X103.382 Y106.554 E.00944
G3 X128.995 Y94.644 I24.621 J19.452 E.79392
G3 X128.385 Y157.362 I-.997 J31.353 E2.63283
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75117
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.916 J14.575 E5.0778
G1 X102.776 Y106.655 E.03205
G3 X129.005 Y94.228 I25.228 J19.353 E.81671
G3 X128.39 Y157.778 I-1.008 J31.768 E2.66777
M73 P57 R6
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.815 Y158.168 E.01987
G3 X123.667 Y94.103 I1.175 J-32.168 E2.40386
G3 X129.015 Y93.828 I4.347 J32.362 E.13479
G3 X128.395 Y158.187 I-1.025 J32.173 E2.50646
G1 X127.666 Y158.179 E.01834
; WIPE_START
M204 S10000
G1 X126.815 Y158.168 E-.32314
G1 X126.027 Y158.129 E-.29996
G1 X125.668 Y158.099 E-.1369
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z1.56 F30000
G1 X100.555 Y109.622 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/31
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.56 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.206 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.37 J-30.206 E1.56988
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X128.185 Y95.792 I24.171 J18.225 E.70765
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
G3 X127.69 Y156.206 I-.185 J30.208 E2.38908
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58625
G1 X125.693 Y156.114 E-.17375
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z1.72 F30000
M73 P57 R5
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.343 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71606
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.462 J14.434 E5.12599
G1 X103.382 Y106.554 E.00944
M73 P58 R5
G3 X128.97 Y94.643 I24.62 J19.451 E.79323
G3 X128.385 Y157.362 I-.972 J31.353 E2.63351
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75118
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.916 J14.575 E5.0778
G1 X102.776 Y106.655 E.03205
G3 X128.98 Y94.228 I25.227 J19.352 E.81602
G3 X128.39 Y157.778 I-.982 J31.769 E2.66845
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.816 Y158.167 E.01987
G3 X122.886 Y94.219 I1.175 J-32.167 E2.38393
G3 X128.99 Y93.827 I5.237 J33.843 E.15398
G3 X128.395 Y158.186 I-.999 J32.173 E2.50706
G1 X127.666 Y158.178 E.01834
; WIPE_START
M204 S10000
G1 X126.816 Y158.167 E-.32312
G1 X126.027 Y158.129 E-.29996
G1 X125.668 Y158.099 E-.13692
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.321 Z1.72 F30000
G1 X100.555 Y109.622 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/31
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.72 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.199 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P59 R5
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.368 J-30.203 E1.56972
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X128.161 Y95.792 I24.17 J18.225 E.70706
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
G3 X127.69 Y156.2 I-.164 J30.204 E2.38932
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.5862
G1 X125.692 Y156.114 E-.1738
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71607
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.944 Y94.642 I24.62 J19.451 E.79254
G3 X128.385 Y157.362 I-.946 J31.354 E2.63419
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75118
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.954 Y94.227 I25.227 J19.352 E.81533
G3 X128.39 Y157.778 I-.957 J31.77 E2.66913
M73 P60 R5
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.815 Y158.167 E.01987
G3 X122.886 Y94.219 I1.174 J-32.167 E2.38397
G3 X128.964 Y93.826 I5.237 J33.843 E.15334
G3 X128.395 Y158.186 I-.975 J32.174 E2.50766
G1 X127.666 Y158.178 E.01834
; WIPE_START
M204 S10000
G1 X126.815 Y158.167 E-.32312
G1 X126.027 Y158.129 E-.29996
G1 X125.668 Y158.099 E-.13692
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.321 Z1.88 F30000
G1 X100.555 Y109.622 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/31
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.88 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.206 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.37 J-30.206 E1.56989
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X128.138 Y95.792 I24.141 J18.166 E.70658
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
G3 X127.69 Y156.206 I-.138 J30.208 E2.39025
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58625
G1 X125.693 Y156.114 E-.17375
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71607
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
M73 P61 R5
G3 X128.919 Y94.642 I24.619 J19.45 E.79185
G3 X128.385 Y157.362 I-.921 J31.355 E2.63487
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75118
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.929 Y94.226 I25.226 J19.351 E.81464
G3 X128.39 Y157.778 I-.932 J31.77 E2.66982
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.13 E.0397
G3 X122.107 Y94.354 I1.963 J-32.129 E2.34428
G3 X128.939 Y93.826 I5.901 J31.888 E.17258
G3 X127.665 Y158.188 I-.949 J32.175 E2.52673
; WIPE_START
M204 S10000
G1 X126.027 Y158.13 E-.62289
G1 X125.668 Y158.099 E-.13711
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z2.04 F30000
G1 X100.555 Y109.622 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/31
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.04 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.206 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.369 J-30.206 E1.56989
M73 P62 R5
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X128.114 Y95.792 I24.141 J18.166 E.70598
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
G3 X127.69 Y156.206 I-.115 J30.208 E2.39084
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58625
G1 X125.693 Y156.114 E-.17375
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71607
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.893 Y94.641 I24.619 J19.45 E.79117
G3 X128.385 Y157.362 I-.896 J31.355 E2.63555
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.904 Y94.226 I25.226 J19.351 E.81395
G3 X128.39 Y157.778 I-.906 J31.771 E2.6705
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P63 R5
G1 F3600
M204 S5000
G1 X126.027 Y158.13 E.03971
G3 X122.107 Y94.354 I1.963 J-32.129 E2.3443
G3 X128.913 Y93.825 I5.9 J31.878 E.17194
G3 X127.665 Y158.188 I-.924 J32.176 E2.52734
; WIPE_START
M204 S10000
G1 X126.027 Y158.13 E-.6229
G1 X125.668 Y158.099 E-.1371
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z2.2 F30000
G1 X100.555 Y109.622 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/31
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.2 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.199 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.367 J-30.203 E1.56973
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X128.091 Y95.792 I24.17 J18.224 E.70528
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
G3 X127.69 Y156.2 I-.093 J30.205 E2.39108
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.5862
G1 X125.692 Y156.114 E-.1738
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71607
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.868 Y94.641 I24.619 J19.45 E.79047
G3 X128.385 Y157.362 I-.87 J31.356 E2.63624
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
M73 P64 R5
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.878 Y94.225 I25.226 J19.351 E.81326
G3 X128.39 Y157.778 I-.881 J31.772 E2.67118
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.13 E.03971
G3 X122.107 Y94.354 I1.962 J-32.129 E2.34432
G3 X128.888 Y93.825 I5.899 J31.872 E.1713
G3 X127.665 Y158.188 I-.899 J32.176 E2.52795
; WIPE_START
M204 S10000
G1 X126.027 Y158.13 E-.62291
G1 X125.668 Y158.099 E-.13709
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z2.36 F30000
G1 X100.555 Y109.622 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/31
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.36 I-1.057 J.603 P1  F30000
M73 P64 R4
G1 X127.63 Y156.199 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.367 J-30.203 E1.56973
M73 P65 R4
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X128.067 Y95.792 I24.17 J18.224 E.70469
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
G3 X127.69 Y156.2 I-.07 J30.205 E2.39167
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58621
G1 X125.692 Y156.114 E-.17379
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71608
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.842 Y94.64 I24.619 J19.449 E.78979
G3 X128.385 Y157.363 I-.845 J31.357 E2.63692
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.853 Y94.224 I25.225 J19.351 E.81257
G3 X128.39 Y157.778 I-.856 J31.772 E2.67187
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P66 R4
G1 F3600
M204 S5000
G1 X126.027 Y158.129 E.03971
G3 X121.333 Y94.508 I1.963 J-32.128 E2.32438
G3 X128.863 Y93.824 I6.773 J32.765 E.1905
G3 X127.664 Y158.187 I-.873 J32.176 E2.5286
; WIPE_START
M204 S10000
G1 X126.027 Y158.129 E-.62259
G1 X125.667 Y158.098 E-.13741
; WIPE_END
G1 E-.04 F1800
G1 X122.156 Y151.321 Z2.52 F30000
G1 X100.555 Y109.622 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/31
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.52 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.206 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.369 J-30.206 E1.5699
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X128.044 Y95.792 I24.17 J18.224 E.7041
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
G3 X127.69 Y156.206 I-.044 J30.208 E2.3926
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58625
G1 X125.693 Y156.114 E-.17375
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z2.68 F30000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71608
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.462 J14.434 E5.12599
G1 X103.382 Y106.554 E.00944
G3 X128.817 Y94.639 I24.618 J19.449 E.7891
G3 X128.385 Y157.363 I-.819 J31.357 E2.63761
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
M73 P67 R4
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.762 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.916 J14.575 E5.0778
G1 X102.776 Y106.655 E.03205
G3 X128.827 Y94.224 I25.225 J19.35 E.81188
G3 X128.39 Y157.778 I-.83 J31.773 E2.67255
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.129 E.03971
G3 X121.333 Y94.508 I1.963 J-32.128 E2.32439
G3 X128.837 Y93.823 I6.774 J32.77 E.18986
G3 X127.664 Y158.187 I-.847 J32.177 E2.52923
; WIPE_START
M204 S10000
G1 X126.027 Y158.129 E-.6226
G1 X125.667 Y158.098 E-.1374
; WIPE_END
G1 E-.04 F1800
G1 X122.156 Y151.321 Z2.68 F30000
G1 X100.555 Y109.622 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/31
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.68 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.206 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.369 J-30.206 E1.5699
M73 P68 R4
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X128.02 Y95.792 I24.14 J18.165 E.70361
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
G3 X127.69 Y156.207 I-.021 J30.208 E2.39319
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58625
G1 X125.693 Y156.114 E-.17375
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71608
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.792 Y94.639 I24.618 J19.449 E.78841
G3 X128.385 Y157.363 I-.794 J31.358 E2.6383
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.762 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.802 Y94.223 I25.225 J19.35 E.81119
G3 X128.39 Y157.778 I-.805 J31.774 E2.67324
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P69 R4
G1 F3600
M204 S5000
G1 X126.027 Y158.13 E.03971
G3 X121.333 Y94.508 I1.963 J-32.129 E2.32445
G3 X128.812 Y93.823 I6.775 J32.776 E.18922
G3 X127.665 Y158.188 I-.822 J32.178 E2.5299
; WIPE_START
M204 S10000
G1 X126.027 Y158.13 E-.62294
G1 X125.668 Y158.099 E-.13706
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z2.84 F30000
G1 X100.555 Y109.622 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104215
G1 F18000
G3 X101.904 Y107.547 I77.464 J48.918 E.01128
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47052
G1 X100.81 Y109.221 E-.28948
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/31
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.84 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.2 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.367 J-30.203 E1.56973
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.997 Y95.792 I24.14 J18.165 E.70302
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
G3 X127.69 Y156.2 I.001 J30.205 E2.39344
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58621
G1 X125.692 Y156.114 E-.17379
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71608
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.462 J14.434 E5.12599
G1 X103.382 Y106.554 E.00944
G3 X128.766 Y94.638 I24.618 J19.449 E.78772
G3 X128.385 Y157.363 I-.769 J31.359 E2.63899
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
M73 P70 R4
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.762 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.916 J14.575 E5.0778
G1 X102.776 Y106.655 E.03205
G3 X128.776 Y94.223 I25.225 J19.35 E.8105
G3 X128.39 Y157.778 I-.779 J31.774 E2.67393
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.13 E.03971
G3 X121.333 Y94.508 I1.963 J-32.129 E2.32443
G3 X128.786 Y93.822 I6.776 J32.784 E.18858
G3 X127.665 Y158.188 I-.797 J32.179 E2.53051
; WIPE_START
M204 S10000
G1 X126.027 Y158.13 E-.62294
G1 X125.668 Y158.099 E-.13706
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z3 F30000
G1 X100.555 Y109.622 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/31
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.2 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.367 J-30.203 E1.56973
M73 P71 R4
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.973 Y95.792 I24.14 J18.165 E.70243
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
G3 X127.69 Y156.2 I.024 J30.205 E2.39403
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.5862
G1 X125.692 Y156.114 E-.1738
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z3.16 F30000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71608
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.462 J14.434 E5.12599
G1 X103.382 Y106.554 E.00944
G3 X128.741 Y94.637 I24.618 J19.449 E.78703
G3 X128.385 Y157.363 I-.743 J31.359 E2.63968
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.762 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.916 J14.575 E5.0778
G1 X102.776 Y106.655 E.03205
G3 X128.751 Y94.222 I25.225 J19.35 E.80981
G3 X128.39 Y157.778 I-.754 J31.775 E2.67462
M73 P71 R3
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P72 R3
G1 F3600
M204 S5000
G1 X126.027 Y158.13 E.03971
G3 X121.333 Y94.508 I1.963 J-32.129 E2.32445
G3 X128.761 Y93.821 I6.777 J32.795 E.18794
G3 X127.665 Y158.188 I-.771 J32.18 E2.53118
; WIPE_START
M204 S10000
G1 X126.027 Y158.13 E-.62296
G1 X125.668 Y158.099 E-.13704
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z3.16 F30000
G1 X100.555 Y109.622 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/31
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.16 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.2 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.367 J-30.203 E1.56973
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.949 Y95.792 I24.17 J18.224 E.70173
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
G3 X127.69 Y156.2 I.048 J30.205 E2.39463
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58621
G1 X125.692 Y156.114 E-.17379
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71608
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.715 Y94.637 I24.618 J19.449 E.78634
G3 X128.385 Y157.363 I-.718 J31.36 E2.64037
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
M73 P73 R3
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.762 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.725 Y94.221 I25.225 J19.35 E.80912
G3 X128.39 Y157.778 I-.728 J31.776 E2.67531
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.13 E.03971
G3 X121.333 Y94.508 I1.963 J-32.129 E2.32443
G3 X128.735 Y93.821 I6.779 J32.806 E.1873
G3 X127.665 Y158.188 I-.746 J32.18 E2.5318
; WIPE_START
M204 S10000
G1 X126.027 Y158.13 E-.62296
G1 X125.668 Y158.099 E-.13704
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z3.32 F30000
G1 X100.555 Y109.622 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.523 J48.957 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47055
G1 X100.81 Y109.221 E-.28945
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/31
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.32 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.199 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.367 J-30.203 E1.56973
M73 P74 R3
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.926 Y95.792 I24.141 J18.165 E.70124
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
G3 X127.69 Y156.2 I.072 J30.205 E2.39522
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58621
G1 X125.692 Y156.114 E-.17379
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z3.48 F30000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71608
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.462 J14.434 E5.12599
G1 X103.382 Y106.554 E.00944
G3 X128.69 Y94.636 I24.619 J19.449 E.78565
G3 X128.385 Y157.363 I-.692 J31.361 E2.64106
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.916 J14.575 E5.0778
G1 X102.776 Y106.655 E.03205
G3 X128.7 Y94.221 I25.225 J19.351 E.80843
G3 X128.39 Y157.778 I-.703 J31.776 E2.676
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P75 R3
G1 F3600
M204 S5000
G1 X126.027 Y158.129 E.03971
G3 X121.333 Y94.508 I1.963 J-32.128 E2.32438
G3 X128.71 Y93.82 I6.781 J32.82 E.18666
G3 X127.664 Y158.187 I-.72 J32.18 E2.53243
; WIPE_START
M204 S10000
G1 X126.027 Y158.129 E-.62262
G1 X125.667 Y158.098 E-.13738
; WIPE_END
G1 E-.04 F1800
G1 X122.156 Y151.321 Z3.48 F30000
G1 X100.555 Y109.622 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10421
G1 F18000
G3 X101.904 Y107.547 I77.497 J48.939 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47056
G1 X100.81 Y109.221 E-.28944
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/31
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.48 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.206 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.369 J-30.206 E1.56989
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.902 Y95.792 I24.137 J18.158 E.70067
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
G3 X127.69 Y156.206 I.097 J30.208 E2.39616
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58625
G1 X125.693 Y156.114 E-.17375
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z3.64 F30000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71607
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.664 Y94.636 I24.619 J19.45 E.78496
G3 X128.385 Y157.362 I-.667 J31.361 E2.64175
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
M73 P76 R3
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.675 Y94.22 I25.226 J19.351 E.80774
G3 X128.39 Y157.778 I-.678 J31.777 E2.6767
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.605 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.129 E.03971
G3 X121.333 Y94.508 I1.963 J-32.128 E2.32437
G3 X128.684 Y93.82 I6.784 J32.836 E.18602
G3 X127.664 Y158.187 I-.694 J32.181 E2.53308
; WIPE_START
M204 S10000
G1 X126.027 Y158.129 E-.62261
G1 X125.667 Y158.098 E-.13739
; WIPE_END
G1 E-.04 F1800
G1 X122.156 Y151.321 Z3.64 F30000
G1 X100.555 Y109.622 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.485 J48.932 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47045
G1 X100.81 Y109.221 E-.28955
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/31
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.64 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.206 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.369 J-30.206 E1.56989
G1 X100.296 Y110.435 E.03952
M73 P77 R3
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.879 Y95.792 I24.171 J18.224 E.69995
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
G3 X127.69 Y156.206 I.121 J30.208 E2.39676
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.58625
G1 X125.693 Y156.114 E-.17375
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71607
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.462 J14.434 E5.12599
G1 X103.382 Y106.554 E.00944
G3 X128.639 Y94.635 I24.619 J19.45 E.78427
G3 X128.385 Y157.362 I-.641 J31.362 E2.64245
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75119
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.916 J14.575 E5.0778
G1 X102.776 Y106.655 E.03205
G3 X128.649 Y94.219 I25.226 J19.351 E.80705
G3 X128.39 Y157.778 I-.652 J31.777 E2.67739
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P78 R3
G1 F3600
M204 S5000
G1 X126.027 Y158.13 E.03971
G3 X122.107 Y94.354 I1.962 J-32.129 E2.34432
G3 X128.659 Y93.819 I5.902 J31.893 E.16555
G3 X127.665 Y158.188 I-.67 J32.182 E2.53371
; WIPE_START
M204 S10000
G1 X126.027 Y158.13 E-.62299
G1 X125.668 Y158.099 E-.13701
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z3.8 F30000
G1 X100.555 Y109.622 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104213
G1 F18000
G3 X101.904 Y107.547 I77.433 J48.898 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47046
G1 X100.81 Y109.221 E-.28954
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/31
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.8 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.199 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X101.614 Y111.292 I.368 J-30.203 E1.56973
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.855 Y95.792 I24.141 J18.166 E.69947
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
G3 X127.69 Y156.2 I.142 J30.205 E2.39701
; WIPE_START
M204 S10000
G1 X126.148 Y156.153 E-.5862
G1 X125.692 Y156.114 E-.1738
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z3.96 F30000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71607
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.462 J14.434 E5.12599
G1 X103.382 Y106.554 E.00944
G3 X128.614 Y94.634 I24.619 J19.451 E.78358
G3 X128.385 Y157.362 I-.616 J31.362 E2.64315
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
M73 P79 R2
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75118
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.916 J14.575 E5.0778
G1 X102.776 Y106.655 E.03205
G3 X128.624 Y94.219 I25.226 J19.352 E.80636
G3 X128.39 Y157.778 I-.627 J31.778 E2.67809
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.13 E.03971
G3 X122.107 Y94.354 I1.963 J-32.129 E2.34429
G3 X128.634 Y93.818 I5.904 J31.906 E.16491
G3 X127.665 Y158.188 I-.644 J32.182 E2.53438
; WIPE_START
M204 S10000
G1 X126.027 Y158.13 E-.623
G1 X125.668 Y158.099 E-.137
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z3.96 F30000
G1 X100.555 Y109.622 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104208
G1 F18000
G3 X101.904 Y107.547 I77.485 J48.932 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47045
G1 X100.81 Y109.221 E-.28955
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/31
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.96 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.208 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.63 Y156.199 E.00021
G3 X101.614 Y111.292 I.368 J-30.203 E1.56972
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.832 Y95.792 I24.171 J18.225 E.69877
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
G3 X128.371 Y156.199 I.166 J30.204 E2.3805
G1 X127.69 Y156.207 E.01712
; WIPE_START
M204 S10000
G1 X127.63 Y156.199 E-.02296
G1 X126.148 Y156.153 E-.56341
M73 P80 R2
G1 X125.693 Y156.114 E-.17363
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z4.12 F30000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.344 E.02088
G3 X100.245 Y111.376 I1.152 J-31.347 E1.71606
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.588 Y94.634 I24.62 J19.451 E.78289
G3 X128.385 Y157.362 I-.59 J31.363 E2.64384
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75118
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.598 Y94.218 I25.227 J19.352 E.80567
M73 P81 R2
G3 X128.39 Y157.778 I-.601 J31.778 E2.67879
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.815 Y158.168 E.01987
G3 X122.886 Y94.219 I1.174 J-32.167 E2.38403
G3 X128.608 Y93.818 I5.268 J34.133 E.14439
G3 X128.395 Y158.187 I-.619 J32.183 E2.51663
G1 X127.666 Y158.179 E.01834
; WIPE_START
M204 S10000
G1 X126.815 Y158.168 E-.32312
G1 X125.668 Y158.098 E-.43688
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.321 Z4.12 F30000
G1 X100.555 Y109.622 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104214
G1 F18000
G3 X101.904 Y107.547 I77.47 J48.921 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47054
G1 X100.81 Y109.221 E-.28947
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/31
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.12 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.208 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.63 Y156.206 E.00005
G3 X101.614 Y111.292 I.37 J-30.206 E1.56988
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.808 Y95.792 I24.172 J18.226 E.69818
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
G3 X128.371 Y156.206 I.192 J30.207 E2.38144
G1 X127.69 Y156.208 E.01712
; WIPE_START
M204 S10000
G1 X127.63 Y156.206 E-.02282
G1 X126.148 Y156.153 E-.56346
G1 X125.693 Y156.114 E-.17372
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z4.28 F30000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.343 E.02088
G3 X100.245 Y111.376 I1.153 J-31.347 E1.71606
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.462 J14.434 E5.12599
G1 X103.382 Y106.554 E.00944
G3 X128.563 Y94.633 I24.62 J19.452 E.7822
G3 X128.385 Y157.362 I-.565 J31.363 E2.64454
M73 P82 R2
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75117
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.916 J14.574 E5.0778
G1 X102.776 Y106.655 E.03205
G3 X128.573 Y94.218 I25.227 J19.353 E.80499
G3 X128.39 Y157.778 I-.575 J31.779 E2.67949
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.815 Y158.167 E.01987
G3 X122.886 Y94.219 I1.175 J-32.167 E2.38396
G3 X128.583 Y93.817 I5.273 J34.181 E.14375
G3 X128.395 Y158.186 I-.593 J32.183 E2.51727
G1 X127.666 Y158.178 E.01834
; WIPE_START
M204 S10000
G1 X126.815 Y158.167 E-.32311
G1 X125.668 Y158.097 E-.43689
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.32 Z4.28 F30000
G1 X100.555 Y109.621 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104211
G1 F18000
G3 X101.904 Y107.547 I77.37 J48.857 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.577 E-.47031
G1 X100.81 Y109.221 E-.28969
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/31
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.28 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.208 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.63 Y156.199 E.00021
G3 X101.614 Y111.292 I.368 J-30.203 E1.56971
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.784 Y95.792 I24.143 J18.168 E.69769
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
G3 X128.371 Y156.199 I.213 J30.204 E2.3817
G1 X127.69 Y156.207 E.01712
; WIPE_START
M204 S10000
G1 X127.63 Y156.199 E-.02298
M73 P83 R2
G1 X126.148 Y156.153 E-.5634
G1 X125.693 Y156.114 E-.17362
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z4.44 F30000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.343 E.02088
G3 X100.245 Y111.376 I1.153 J-31.347 E1.71606
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.462 J14.434 E5.12599
G1 X103.382 Y106.554 E.00944
G3 X128.537 Y94.632 I24.621 J19.452 E.78151
G3 X128.385 Y157.362 I-.539 J31.364 E2.64524
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75117
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.916 J14.575 E5.0778
G1 X102.776 Y106.655 E.03205
G3 X128.547 Y94.217 I25.228 J19.353 E.8043
G3 X128.39 Y157.778 I-.55 J31.779 E2.68019
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.815 Y158.168 E.01987
M73 P84 R2
G3 X123.667 Y94.103 I1.174 J-32.168 E2.40388
G3 X128.557 Y93.816 I4.354 J32.443 E.12327
G3 X128.395 Y158.187 I-.568 J32.184 E2.51794
G1 X127.666 Y158.179 E.01834
; WIPE_START
M204 S10000
G1 X126.815 Y158.168 E-.32313
G1 X126.027 Y158.129 E-.29996
G1 X125.668 Y158.099 E-.13691
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z4.44 F30000
G1 X100.555 Y109.622 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104207
G1 F18000
G3 X101.904 Y107.547 I77.416 J48.888 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.577 E-.47026
G1 X100.809 Y109.221 E-.28974
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/31
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.44 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.208 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.63 Y156.199 E.00022
G3 X101.614 Y111.292 I.368 J-30.203 E1.56971
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.761 Y95.792 I24.15 J18.182 E.69708
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
G3 X128.371 Y156.199 I.237 J30.204 E2.3823
G1 X127.69 Y156.207 E.01712
; WIPE_START
M204 S10000
G1 X127.63 Y156.199 E-.02299
G1 X126.148 Y156.153 E-.56341
G1 X125.693 Y156.114 E-.17361
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.846 Y157.343 E.02088
G3 X100.245 Y111.376 I1.153 J-31.347 E1.71605
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.512 Y94.632 I24.622 J19.453 E.78083
G3 X128.385 Y157.362 I-.514 J31.364 E2.64594
M73 P85 R2
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75116
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.522 Y94.216 I25.228 J19.354 E.80361
G3 X128.39 Y157.778 I-.524 J31.78 E2.68089
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.815 Y158.168 E.01987
G3 X123.667 Y94.103 I1.175 J-32.167 E2.40382
G3 X128.532 Y93.816 I4.358 J32.487 E.12263
G3 X128.395 Y158.186 I-.541 J32.184 E2.51863
G1 X127.666 Y158.179 E.01834
; WIPE_START
M204 S10000
G1 X126.815 Y158.168 E-.32311
G1 X125.668 Y158.097 E-.43689
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.32 Z4.6 F30000
G1 X100.555 Y109.622 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104206
G1 F18000
G3 X101.904 Y107.547 I77.477 J48.927 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47047
G1 X100.809 Y109.221 E-.28953
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/31
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.6 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.208 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.63 Y156.199 E.00022
G3 X101.614 Y111.292 I.368 J-30.203 E1.5697
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.735 Y95.792 I24.174 J18.228 E.69635
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
G3 X128.371 Y156.199 I.263 J30.204 E2.38296
G1 X127.69 Y156.207 E.01712
; WIPE_START
M204 S10000
G1 X127.63 Y156.199 E-.02299
M73 P85 R1
G1 X126.148 Y156.153 E-.56341
G1 X125.693 Y156.114 E-.1736
; WIPE_END
M73 P86 R1
G1 E-.04 F1800
G1 X127.616 Y157.362 Z4.76 F30000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.846 Y157.343 E.02088
G3 X100.245 Y111.376 I1.153 J-31.347 E1.71605
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.497 Y94.632 I24.651 J19.516 E.78031
G3 X128.385 Y157.362 I-.499 J31.364 E2.64635
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.167 J-31.763 E1.75116
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.503 Y94.216 I25.258 J19.415 E.80297
G3 X128.39 Y157.778 I-.505 J31.78 E2.68142
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.027 Y158.128 E.03972
G3 X124.452 Y94.006 I1.963 J-32.129 E2.40383
G3 X128.509 Y93.815 I3.583 J32.943 E.10217
G3 X127.664 Y158.186 I-.518 J32.184 E2.53756
; WIPE_START
M204 S10000
G1 X126.027 Y158.128 E-.62242
G1 X125.666 Y158.097 E-.13758
; WIPE_END
G1 E-.04 F1800
G1 X122.156 Y151.32 Z4.76 F30000
G1 X100.555 Y109.622 Z4.76
G1 Z4.36
M73 P87 R1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104211
G1 F18000
G3 X101.904 Y107.547 I77.53 J48.96 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.4704
G1 X100.81 Y109.221 E-.2896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/31
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.76 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.208 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.63 Y156.199 E.00022
G3 X101.614 Y111.292 I.368 J-30.203 E1.5697
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.711 Y95.792 I24.175 J18.229 E.69576
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
G3 X128.371 Y156.199 I.287 J30.204 E2.38357
G1 X127.69 Y156.207 E.01712
; WIPE_START
M204 S10000
G1 X127.63 Y156.199 E-.023
G1 X126.148 Y156.153 E-.56339
G1 X125.693 Y156.114 E-.17361
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z4.92 F30000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.845 Y157.343 E.02088
G3 X100.245 Y111.376 I1.153 J-31.347 E1.71604
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.472 Y94.631 I24.652 J19.517 E.77963
G3 X128.385 Y157.362 I-.473 J31.365 E2.64705
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
M73 P88 R1
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.168 J-31.763 E1.75115
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.477 Y94.215 I25.259 J19.416 E.80228
G3 X128.39 Y157.778 I-.479 J31.781 E2.68212
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.186 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X125.237 Y93.929 I.385 J-32.187 E2.46343
G3 X128.483 Y93.815 I3.083 J41.425 E.08168
G3 X127.666 Y158.187 I-.493 J32.185 E2.53819
; WIPE_START
M204 S10000
G1 X126.027 Y158.129 E-.62313
G1 X125.668 Y158.099 E-.13687
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z4.92 F30000
G1 X100.555 Y109.622 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104213
G1 F18000
G3 X101.904 Y107.547 I77.497 J48.939 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.577 E-.47028
G1 X100.809 Y109.221 E-.28972
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/31
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.92 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.208 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.63 Y156.199 E.00022
G3 X101.614 Y111.292 I.368 J-30.203 E1.56969
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.688 Y95.792 I24.175 J18.23 E.69516
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
G3 X128.371 Y156.199 I.311 J30.204 E2.38418
G1 X127.69 Y156.207 E.01712
; WIPE_START
M204 S10000
G1 X127.63 Y156.199 E-.02302
G1 X126.148 Y156.153 E-.56341
G1 X125.693 Y156.114 E-.17358
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z5.08 F30000
M73 P89 R1
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.846 Y157.343 E.02088
G3 X100.245 Y111.376 I1.153 J-31.347 E1.71603
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.447 Y94.63 I24.653 J19.518 E.77895
G3 X128.385 Y157.362 I-.448 J31.365 E2.64774
G1 X127.676 Y157.362 E.01921
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.759 E.02115
G3 X100.092 Y110.78 I1.168 J-31.763 E1.75114
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.452 Y94.215 I25.26 J19.417 E.8016
G3 X128.39 Y157.778 I-.454 J31.781 E2.68282
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.816 Y158.166 E.01987
G3 X126.026 Y93.871 I1.175 J-32.167 E2.46342
G3 X128.458 Y93.814 I2.039 J35.329 E.06117
G3 X128.395 Y158.185 I-.467 J32.185 E2.52045
G1 X127.666 Y158.178 E.01834
; WIPE_START
M204 S10000
G1 X126.816 Y158.166 E-.32311
G1 X125.668 Y158.097 E-.43689
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.32 Z5.08 F30000
G1 X100.555 Y109.622 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104211
G1 F18000
G3 X101.904 Y107.547 I77.396 J48.874 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.4704
M73 P90 R1
G1 X100.809 Y109.221 E-.2896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/31
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.08 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.208 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.63 Y156.199 E.00023
G3 X101.614 Y111.292 I.369 J-30.203 E1.56968
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.664 Y95.792 I24.176 J18.231 E.69457
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
G3 X129.112 Y156.18 I.335 J30.203 E2.36614
G1 X127.69 Y156.207 E.03576
; WIPE_START
M204 S10000
G1 X127.63 Y156.199 E-.02303
G1 X126.148 Y156.153 E-.56341
G1 X125.693 Y156.114 E-.17356
; WIPE_END
G1 E-.04 F1800
G1 X127.616 Y157.362 Z5.24 F30000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.846 Y157.343 E.02088
G3 X100.245 Y111.376 I1.153 J-31.347 E1.71602
G1 X100.537 Y111.566 E.00944
G2 X103.674 Y106.744 I27.459 J14.432 E5.12539
G1 X103.382 Y106.554 E.00944
G3 X128.422 Y94.63 I24.654 J19.519 E.77827
G3 X128.385 Y157.362 I-.423 J31.366 E2.64844
G1 X127.676 Y157.362 E.01921
M73 P91 R1
G1 X127.611 Y157.777 F30000
G1 F9000
G1 X126.83 Y157.758 E.02115
G3 X100.092 Y110.78 I1.168 J-31.763 E1.75114
G1 X101.084 Y111.425 E.03205
G2 X103.767 Y107.3 I26.913 J14.573 E5.07721
G1 X102.776 Y106.655 E.03205
G3 X128.427 Y94.214 I25.261 J19.419 E.80092
G3 X128.39 Y157.778 I-.429 J31.782 E2.68352
G1 X127.671 Y157.777 E.01949
M204 S250
G1 X127.606 Y158.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X126.815 Y158.167 E.01987
G3 X126.815 Y93.832 I1.175 J-32.168 E2.48329
G3 X128.432 Y93.813 I1.168 J31.493 E.04068
G3 X128.395 Y158.186 I-.442 J32.186 E2.52115
G1 X127.666 Y158.178 E.01834
; WIPE_START
M204 S10000
G1 X126.815 Y158.167 E-.32311
G1 X125.668 Y158.097 E-.43689
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.32 Z5.24 F30000
G1 X100.555 Y109.622 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104209
G1 F18000
G3 X101.904 Y107.547 I77.423 J48.892 E.01127
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.218 Y108.578 E-.47027
G1 X100.809 Y109.221 E-.28973
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/31
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.24 I-1.057 J.603 P1  F30000
G1 X127.63 Y156.208 Z5.24
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.63 Y156.199 E.00023
G3 X101.614 Y111.292 I.369 J-30.203 E1.56968
G1 X100.296 Y110.435 E.03952
G1 X102.543 Y106.981 E.10358
G1 X103.861 Y107.839 E.03952
G3 X127.641 Y95.792 I24.177 J18.233 E.69398
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
G3 X128.371 Y156.199 I.358 J30.203 E2.38539
G1 X127.69 Y156.207 E.01712
; WIPE_START
M204 S10000
G1 X127.63 Y156.199 E-.02303
G1 X126.148 Y156.153 E-.56339
G1 X125.693 Y156.114 E-.17358
; WIPE_END
M73 P92 R1
G1 E-.04 F1800
G1 X127.606 Y158.185 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F3600
M204 S5000
G3 X127.605 Y93.812 I.388 J-32.186 E2.52285
G1 X128.407 Y93.813 E.02017
G3 X127.666 Y158.186 I-.413 J32.186 E2.54025
; WIPE_START
M204 S10000
G1 X126.027 Y158.129 E-.62314
G1 X125.668 Y158.099 E-.13686
; WIPE_END
G1 E-.04 F1800
G1 X122.157 Y151.322 Z5.4 F30000
G1 X100.555 Y109.622 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104209
G1 F18000
G3 X101.904 Y107.547 I77.439 J48.902 E.01127
; WIPE_START
G1 X101.218 Y108.577 E-.47024
G1 X100.809 Y109.221 E-.28976
; WIPE_END
G1 E-.04 F1800
G1 X108.439 Y109.033 Z5.4 F30000
G1 X154.351 Y107.9 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X146.065 Y99.615 E.2946
; WIPE_START
M204 S10000
G1 X147.479 Y101.029 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.548 Y98.643 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X155.347 Y109.442 E.38395
; WIPE_START
M204 S10000
G1 X153.933 Y108.028 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.081 Y110.722 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X143.265 Y97.905 E.4557
; WIPE_START
M204 S10000
G1 X144.679 Y99.319 E-.76
; WIPE_END
M73 P93 R0
G1 E-.04 F1800
G1 X142.131 Y97.317 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X147.344 Y102.529 E.18533
; WIPE_START
M204 S10000
G1 X145.929 Y101.115 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X145.158 Y100.889 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X141.113 Y96.844 E.14381
G1 X140.154 Y96.431
G1 X143.633 Y99.91 E.1237
; WIPE_START
M204 S10000
G1 X142.219 Y98.496 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.374 Y99.196 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X139.246 Y96.068 E.11124
G1 X138.405 Y95.773
G1 X141.265 Y98.632 E.10166
G1 X140.248 Y98.161
G1 X137.58 Y95.493 E.09486
G1 X136.812 Y95.27
G1 X139.294 Y97.752 E.08824
G1 X138.426 Y97.429
G1 X136.051 Y95.055 E.08442
G1 X135.336 Y94.885
G1 X137.585 Y97.134 E.07996
G1 X136.786 Y96.881
G1 X134.621 Y94.715 E.077
G1 X133.951 Y94.59
G1 X136.023 Y96.663 E.07369
G1 X135.283 Y96.468
G1 X133.28 Y94.466 E.07119
G1 X132.638 Y94.368
G1 X134.574 Y96.305 E.06885
G1 X133.882 Y96.158
G1 X132.006 Y94.282 E.06669
G1 X131.383 Y94.205
G1 X133.213 Y96.035 E.06506
G1 X132.563 Y95.93
G1 X130.787 Y94.153 E.06317
G1 X130.19 Y94.102
G1 X131.923 Y95.836 E.06164
G1 X131.31 Y95.768
G1 X129.612 Y94.069 E.06038
G1 X129.046 Y94.049
G1 X130.697 Y95.7 E.0587
G1 X130.111 Y95.659
G1 X128.479 Y94.028 E.05801
G1 X127.937 Y94.031
G1 X129.53 Y95.624 E.05664
G1 X128.957 Y95.596
G1 X127.398 Y94.037 E.05545
G1 X126.859 Y94.043
G1 X128.405 Y95.59 E.05497
G1 X127.853 Y95.583
G1 X126.343 Y94.073 E.05367
G1 X125.829 Y94.105
G1 X127.316 Y95.592 E.05287
G1 X126.79 Y95.611
M73 P94 R0
G1 X125.316 Y94.136 E.05243
G1 X124.822 Y94.188
G1 X126.264 Y95.63 E.05127
G1 X125.756 Y95.668
G1 X124.331 Y94.243 E.05066
G1 X123.84 Y94.297
G1 X125.254 Y95.711 E.05027
G1 X124.752 Y95.754
G1 X123.364 Y94.367 E.04934
G1 X122.894 Y94.442
G1 X124.267 Y95.815 E.0488
G1 X123.787 Y95.88
G1 X122.424 Y94.518 E.04843
G1 X121.963 Y94.601
G1 X123.306 Y95.945 E.04778
G1 X122.841 Y96.025
G1 X121.513 Y94.697 E.04722
G1 X121.062 Y94.792
G1 X122.381 Y96.111 E.04688
G1 X121.921 Y96.196
G1 X120.612 Y94.887 E.04654
G1 X120.181 Y95.001
G1 X121.471 Y96.292 E.04589
G1 X121.03 Y96.396
G1 X119.749 Y95.115 E.04556
G1 X119.317 Y95.229
G1 X120.59 Y96.501 E.04524
G1 X120.152 Y96.609
G1 X118.894 Y95.351 E.04473
G1 X118.48 Y95.482
G1 X119.725 Y96.727 E.04426
G1 X119.305 Y96.852
G1 X118.066 Y95.613 E.04405
G1 X117.652 Y95.744
G1 X118.89 Y96.983 E.04405
G1 X118.476 Y97.114
G1 X117.252 Y95.89 E.04354
G1 X116.854 Y96.038
G1 X118.064 Y97.247 E.043
G1 X117.666 Y97.395
G1 X116.457 Y96.186 E.043
G1 X116.062 Y96.336
G1 X117.268 Y97.543 E.04291
G1 X116.871 Y97.691
G1 X115.68 Y96.5 E.04235
G1 X115.298 Y96.663
G1 X116.482 Y97.848 E.04211
G1 X116.101 Y98.011
G1 X114.916 Y96.827 E.04211
G1 X114.541 Y96.997
G1 X115.719 Y98.175 E.0419
G1 X115.337 Y98.339
G1 X114.174 Y97.175 E.04136
G1 X113.807 Y97.354
G1 X114.97 Y98.517 E.04135
G1 X114.604 Y98.696
G1 X113.441 Y97.533 E.04135
G1 X113.082 Y97.72
G1 X114.237 Y98.875 E.04106
G1 X113.876 Y99.059
G1 X112.731 Y97.914 E.04071
G1 X112.379 Y98.107
G1 X113.524 Y99.252 E.04071
G1 X113.172 Y99.446
G1 X112.027 Y98.301 E.04071
G1 X111.684 Y98.504
G1 X112.82 Y99.639 E.04038
G1 X112.475 Y99.84
G1 X111.347 Y98.712 E.04012
G1 X111.009 Y98.92
G1 X112.134 Y100.044 E.03999
G1 X111.801 Y100.256
G1 X110.672 Y99.127 E.04013
G1 X110.344 Y99.345
G1 X111.47 Y100.471 E.04005
G1 X111.14 Y100.686
G1 X110.02 Y99.567 E.0398
G1 X109.697 Y99.789
G1 X110.809 Y100.901 E.03955
G1 X110.489 Y101.126
G1 X109.374 Y100.011 E.03965
G1 X109.059 Y100.242
G1 X110.169 Y101.352 E.03946
G1 X109.859 Y101.587
G1 X108.75 Y100.477 E.03946
G1 X108.44 Y100.713
G1 X109.55 Y101.823 E.03946
G1 X109.24 Y102.059
G1 X108.13 Y100.949 E.03946
G1 X107.829 Y101.193
G1 X108.932 Y102.296 E.03922
G1 X108.633 Y102.542
G1 X107.533 Y101.442 E.0391
G1 X107.237 Y101.692
G1 X108.336 Y102.791 E.03908
G1 X108.046 Y103.046
G1 X106.94 Y101.941 E.03931
G1 X106.652 Y102.198
G1 X107.757 Y103.302 E.03927
G1 X107.467 Y103.558
G1 X106.369 Y102.46 E.03903
G1 X106.087 Y102.723
G1 X107.183 Y103.82 E.039
G1 X106.907 Y104.089
G1 X105.804 Y102.986 E.03924
G1 X105.528 Y103.255
G1 X106.631 Y104.359 E.03923
G1 X106.355 Y104.628
G1 X105.259 Y103.531 E.03898
G1 X104.989 Y103.807
G1 X106.084 Y104.903 E.03894
G1 X105.818 Y105.182
G1 X104.72 Y104.084 E.03905
G1 X104.457 Y104.366
G1 X105.558 Y105.467 E.03917
G1 X105.302 Y105.757
G1 X104.201 Y104.655 E.03917
G1 X103.945 Y104.945
G1 X105.046 Y106.046 E.03917
G1 X104.79 Y106.336
G1 X103.689 Y105.234 E.03917
G1 X103.438 Y105.529
G1 X104.545 Y106.636 E.03936
G1 X104.304 Y106.94
G1 X103.196 Y105.832 E.0394
G1 X102.953 Y106.135
G1 X104.062 Y107.244 E.03944
G1 X103.821 Y107.548
G1 X102.711 Y106.437 E.03947
; WIPE_START
M204 S10000
G1 X103.821 Y107.548 E-.5966
G1 X104.062 Y107.244 E-.14751
G1 X104.033 Y107.214 E-.01589
; WIPE_END
G1 E-.04 F1800
G1 X101.065 Y111.883 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X99.91 Y110.727 E.0411
G1 X99.723 Y111.086
G1 X100.878 Y112.241 E.04106
G1 X100.691 Y112.599
G1 X99.537 Y111.445 E.04102
G1 X99.351 Y111.804
G1 X100.514 Y112.967 E.04135
G1 X100.339 Y113.337
G1 X99.172 Y112.171 E.04147
G1 X99.001 Y112.545
G1 X100.175 Y113.719 E.04174
G1 X100.011 Y114.101
G1 X98.829 Y112.919 E.04202
G1 X98.658 Y113.293
G1 X99.848 Y114.483 E.04229
G1 X99.691 Y114.871
G1 X98.498 Y113.678 E.04241
G1 X98.342 Y114.068
G1 X99.543 Y115.269 E.04269
G1 X99.395 Y115.666
G1 X98.186 Y114.457 E.04298
G1 X98.03 Y114.847
G1 X99.247 Y116.064 E.04326
G1 X99.114 Y116.476
G1 X97.89 Y115.252 E.04352
G1 X97.751 Y115.658
G1 X98.983 Y116.89 E.04382
G1 X98.852 Y117.305
G1 X97.611 Y116.064 E.04411
G1 X97.477 Y116.475
G1 X98.727 Y117.725 E.04445
G1 X98.609 Y118.152
G1 X97.354 Y116.898 E.0446
G1 X97.232 Y117.321
G1 X98.497 Y118.586 E.045
G1 X98.39 Y119.024
G1 X97.109 Y117.743 E.04553
G1 X97 Y118.18
G1 X98.294 Y119.474 E.04603
G1 X98.199 Y119.924
G1 X96.895 Y118.62 E.04636
G1 X96.791 Y119.061
G1 X98.104 Y120.374 E.0467
G1 X98.026 Y120.842
G1 X96.691 Y119.507 E.04745
G1 X96.606 Y119.967
G1 X97.95 Y121.312 E.0478
G1 X97.875 Y121.781
G1 X96.52 Y120.427 E.04816
G1 X96.434 Y120.887
G1 X97.814 Y122.267 E.04907
G1 X97.76 Y122.758
G1 X96.368 Y121.365 E.0495
G1 X96.303 Y121.846
G1 X97.706 Y123.249 E.04988
G1 X97.663 Y123.752
G1 X96.237 Y122.326 E.05071
G1 X96.187 Y122.821
G1 X97.63 Y124.264 E.05131
G1 X97.611 Y124.79
G1 X96.144 Y123.323 E.05215
G1 X96.101 Y123.825
G1 X97.591 Y125.316 E.053
G1 X97.58 Y125.85
G1 X96.071 Y124.341 E.05366
G1 X96.052 Y124.867
G1 X97.581 Y126.396 E.05437
G1 X97.602 Y126.963
G1 X96.033 Y125.393 E.0558
G1 X96.029 Y125.935
G1 X97.623 Y127.529 E.05668
G1 X97.656 Y128.108
G1 X96.035 Y126.487 E.05762
G1 X96.042 Y127.039
G1 X97.707 Y128.704 E.0592
G1 X97.759 Y129.301
G1 X96.071 Y127.613 E.06002
G1 X96.106 Y128.194
G1 X97.841 Y129.929 E.06169
G1 X97.927 Y130.56
G1 X96.144 Y128.777 E.06341
G1 X96.212 Y129.391
G1 X98.035 Y131.214 E.06482
G1 X98.16 Y131.884
G1 X96.28 Y130.004 E.06684
G1 X96.367 Y130.636
G1 X98.302 Y132.571 E.0688
G1 X98.472 Y133.286
G1 X96.471 Y131.286 E.07112
G1 X96.581 Y131.941
G1 X98.66 Y134.02 E.07391
G1 X98.883 Y134.788
G1 X96.728 Y132.633 E.07662
G1 X96.874 Y133.325
G1 X99.136 Y135.587 E.08041
G1 X99.422 Y136.418
G1 X97.065 Y134.061 E.0838
M73 P95 R0
G1 X97.26 Y134.802
G1 X99.768 Y137.31 E.08918
G1 X100.157 Y138.244
G1 X97.505 Y135.592 E.09429
G1 X97.758 Y136.39
G1 X100.618 Y139.25 E.10169
; WIPE_START
M204 S10000
G1 X99.203 Y137.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.194 Y140.372 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X98.079 Y137.257 E.11075
G1 X98.427 Y138.151
G1 X101.91 Y141.634 E.12385
; WIPE_START
M204 S10000
G1 X100.496 Y140.22 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.863 Y143.132 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X98.836 Y139.105 E.14317
G1 X99.332 Y140.146
G1 X104.52 Y145.334 E.18447
; WIPE_START
M204 S10000
G1 X103.106 Y143.92 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.153 Y139.263 Z5.4 F30000
G1 X151.481 Y106.666 Z5.4
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X156.668 Y111.854 E.18445
G1 X157.164 Y112.895
G1 X153.137 Y108.869 E.14316
; WIPE_START
M204 S10000
G1 X154.552 Y110.283 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.09 Y110.366 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X157.573 Y113.85 E.12385
G1 X157.921 Y114.743
G1 X154.806 Y111.628 E.11074
; WIPE_START
M204 S10000
G1 X156.22 Y113.042 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.382 Y112.75 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X158.242 Y115.61 E.10169
G1 X158.495 Y116.408
G1 X155.843 Y113.756 E.09429
G1 X156.232 Y114.69
G1 X158.74 Y117.198 E.08918
G1 X158.935 Y117.939
G1 X156.578 Y115.582 E.0838
G1 X156.864 Y116.413
G1 X159.126 Y118.675 E.08041
G1 X159.272 Y119.367
G1 X157.118 Y117.212 E.07662
G1 X157.34 Y117.98
G1 X159.419 Y120.059 E.07391
G1 X159.529 Y120.714
G1 X157.529 Y118.714 E.07112
G1 X157.698 Y119.429
G1 X159.633 Y121.364 E.0688
G1 X159.72 Y121.996
G1 X157.84 Y120.116 E.06684
G1 X157.965 Y120.786
G1 X159.788 Y122.61 E.06482
G1 X159.856 Y123.223
G1 X158.073 Y121.44 E.06341
G1 X158.159 Y122.071
G1 X159.894 Y123.806 E.06169
G1 X159.929 Y124.387
G1 X158.241 Y122.699 E.06002
G1 X158.293 Y123.296
G1 X159.958 Y124.961 E.0592
G1 X159.965 Y125.513
G1 X158.344 Y123.893 E.05762
G1 X158.377 Y124.471
G1 X159.971 Y126.065 E.05668
G1 X159.967 Y126.607
G1 X158.398 Y125.037 E.0558
G1 X158.419 Y125.604
G1 X159.948 Y127.133 E.05437
G1 X159.929 Y127.659
G1 X158.414 Y126.144 E.05387
G1 X158.407 Y126.682
G1 X159.899 Y128.175 E.05306
G1 X159.856 Y128.677
G1 X158.396 Y127.216 E.05192
G1 X158.364 Y127.73
G1 X159.813 Y129.179 E.05151
G1 X159.763 Y129.674
G1 X158.332 Y128.244 E.05085
G1 X158.294 Y128.751
G1 X159.697 Y130.155 E.04989
G1 X159.632 Y130.635
G1 X158.24 Y129.242 E.0495
G1 X158.185 Y129.733
G1 X159.565 Y131.113 E.04907
G1 X159.48 Y131.573
G1 X158.125 Y130.219 E.04816
G1 X158.05 Y130.689
G1 X159.394 Y132.033 E.0478
G1 X159.309 Y132.493
G1 X157.974 Y131.158 E.04745
G1 X157.896 Y131.626
G1 X159.209 Y132.939 E.0467
G1 X159.105 Y133.38
G1 X157.801 Y132.076 E.04636
G1 X157.706 Y132.526
G1 X159 Y133.82 E.04603
G1 X158.891 Y134.257
G1 X157.61 Y132.976 E.04553
G1 X157.499 Y133.41
G1 X158.768 Y134.679 E.04514
G1 X158.646 Y135.102
G1 X157.385 Y133.841 E.04483
G1 X157.271 Y134.273
G1 X158.523 Y135.525 E.04451
G1 X158.389 Y135.936
G1 X157.148 Y134.695 E.04412
G1 X157.017 Y135.11
G1 X158.249 Y136.342 E.04382
G1 X158.11 Y136.748
G1 X156.886 Y135.524 E.04352
G1 X156.753 Y135.936
G1 X157.969 Y137.153 E.04326
G1 X157.814 Y137.543
G1 X156.605 Y136.334 E.04298
G1 X156.457 Y136.732
G1 X157.658 Y137.932 E.04269
G1 X157.502 Y138.322
G1 X156.309 Y137.129 E.04241
G1 X156.152 Y137.518
G1 X157.342 Y138.707 E.04229
G1 X157.17 Y139.081
G1 X155.989 Y137.899 E.04202
G1 X155.825 Y138.281
G1 X156.999 Y139.455 E.04174
G1 X156.828 Y139.829
G1 X155.661 Y138.663 E.04147
G1 X155.483 Y139.03
G1 X156.649 Y140.196 E.04148
G1 X156.463 Y140.555
G1 X155.304 Y139.396 E.04121
G1 X155.125 Y139.763
G1 X156.277 Y140.914 E.04095
G1 X156.09 Y141.273
G1 X154.941 Y140.124 E.04086
G1 X154.748 Y140.476
G1 X155.895 Y141.624 E.04081
G1 X155.695 Y141.969
G1 X154.554 Y140.828 E.04055
G1 X154.36 Y141.18
G1 X155.494 Y142.313 E.0403
G1 X155.293 Y142.658
G1 X154.158 Y141.523 E.04035
G1 X153.95 Y141.86
G1 X155.083 Y142.993 E.04027
G1 X154.868 Y143.323
G1 X153.742 Y142.198 E.04002
G1 X153.534 Y142.535
G1 X154.653 Y143.654 E.03977
G1 X154.438 Y143.984
G1 X153.315 Y142.861 E.03994
G1 X153.093 Y143.184
G1 X154.214 Y144.305 E.03985
G1 X153.985 Y144.622
G1 X152.871 Y143.508 E.03961
G1 X152.648 Y143.831
G1 X153.756 Y144.938 E.03938
G1 X153.527 Y145.255
G1 X152.413 Y144.141 E.03962
G1 X152.177 Y144.45
G1 X153.289 Y145.563 E.03954
G1 X153.047 Y145.866
G1 X151.941 Y144.76 E.0393
G1 X151.703 Y145.067
G1 X152.804 Y146.169 E.03915
G1 X152.562 Y146.471
G1 X151.454 Y145.363 E.03939
G1 X151.205 Y145.66
G1 X152.311 Y146.766 E.03934
G1 X152.055 Y147.056
G1 X150.955 Y145.956 E.0391
G1 X150.702 Y146.247
G1 X151.799 Y147.345 E.03902
G1 X151.543 Y147.634
G1 X150.439 Y146.53 E.03926
G1 X150.176 Y146.813
G1 X151.28 Y147.917 E.03924
G1 X151.011 Y148.193
G1 X149.914 Y147.096 E.039
G1 X149.645 Y147.372
G1 X150.741 Y148.469 E.03898
G1 X150.472 Y148.745
G1 X149.369 Y147.642 E.03922
G1 X149.093 Y147.911
G1 X150.196 Y149.014 E.03923
G1 X149.913 Y149.277
G1 X148.817 Y148.18 E.03899
G1 X148.533 Y148.442
G1 X149.631 Y149.54 E.03904
G1 X149.348 Y149.802
G1 X148.243 Y148.698 E.03928
G1 X147.954 Y148.954
G1 X149.059 Y150.059 E.03932
G1 X148.763 Y150.309
M73 P96 R0
G1 X147.664 Y149.209 E.03908
G1 X147.365 Y149.456
G1 X148.467 Y150.558 E.03919
G1 X148.171 Y150.807
G1 X147.062 Y149.698 E.03943
G1 X146.759 Y149.94
G1 X147.87 Y151.051 E.0395
G1 X147.56 Y151.287
G1 X146.456 Y150.183 E.03925
G1 X146.141 Y150.413
G1 X147.25 Y151.523 E.03944
G1 X146.941 Y151.758
G1 X145.825 Y150.642 E.03968
G1 X145.508 Y150.871
G1 X146.626 Y151.989 E.03977
G1 X146.303 Y152.211
G1 X145.191 Y151.099 E.03955
G1 X144.86 Y151.314
G1 X145.979 Y152.433 E.0398
G1 X145.656 Y152.655
G1 X144.53 Y151.529 E.04005
G1 X144.199 Y151.744
G1 X145.328 Y152.873 E.04013
G1 X144.99 Y153.081
G1 X143.865 Y151.955 E.04002
G1 X143.52 Y152.156
G1 X144.653 Y153.288 E.04027
G1 X144.316 Y153.496
G1 X143.176 Y152.357 E.04052
G1 X142.831 Y152.557
G1 X143.973 Y153.699 E.04059
G1 X143.621 Y153.893
G1 X142.479 Y152.751 E.04061
G1 X142.12 Y152.937
G1 X143.269 Y154.086 E.04087
G1 X142.917 Y154.28
G1 X141.761 Y153.123 E.04113
G1 X141.402 Y153.31
G1 X142.559 Y154.467 E.04115
G1 X142.192 Y154.646
G1 X141.03 Y153.483 E.04133
G1 X140.656 Y153.655
G1 X141.826 Y154.825 E.0416
G1 X141.459 Y155.003
G1 X140.282 Y153.826 E.04187
G1 X139.905 Y153.994
G1 X141.084 Y155.173 E.04192
G1 X140.702 Y155.337
G1 X139.515 Y154.15 E.0422
G1 X139.125 Y154.306
G1 X140.32 Y155.5 E.04248
G1 X139.938 Y155.664
G1 X138.736 Y154.461 E.04276
G1 X138.336 Y154.607
G1 X139.543 Y155.814 E.04294
G1 X139.146 Y155.962
G1 X137.93 Y154.746 E.04323
G1 X137.524 Y154.886
G1 X138.748 Y156.11 E.04352
G1 X138.348 Y156.256
G1 X137.115 Y155.023 E.04384
G1 X136.692 Y155.145
G1 X137.934 Y156.387 E.04415
G1 X137.52 Y156.518
G1 X136.27 Y155.268 E.04445
G1 X135.847 Y155.39
G1 X137.106 Y156.649 E.04476
G1 X136.682 Y156.771
G1 X135.41 Y155.499 E.04524
G1 X134.969 Y155.604
G1 X136.251 Y156.885 E.04556
G1 X135.819 Y156.999
G1 X134.529 Y155.708 E.04589
G1 X134.079 Y155.804
G1 X135.387 Y157.113 E.04654
G1 X134.937 Y157.208
G1 X133.619 Y155.89 E.04688
G1 X133.159 Y155.975
G1 X134.487 Y157.303 E.04722
G1 X134.037 Y157.399
G1 X132.693 Y156.055 E.04778
G1 X132.213 Y156.12
G1 X133.575 Y157.482 E.04843
G1 X133.106 Y157.558
G1 X131.733 Y156.185 E.0488
G1 X131.248 Y156.246
G1 X132.636 Y157.633 E.04934
G1 X132.16 Y157.703
G1 X130.746 Y156.289 E.05027
G1 X130.244 Y156.332
G1 X131.669 Y157.757 E.05066
G1 X131.178 Y157.812
G1 X129.736 Y156.37 E.05127
G1 X129.21 Y156.389
G1 X130.684 Y157.864 E.05242
G1 X130.17 Y157.895
G1 X128.684 Y156.408 E.05286
G1 X128.147 Y156.417
G1 X129.657 Y157.927 E.05367
G1 X129.141 Y157.957
G1 X127.595 Y156.41 E.05498
G1 X127.043 Y156.404
G1 X128.602 Y157.963 E.05545
G1 X128.063 Y157.97
G1 X126.47 Y156.376 E.05665
G1 X125.889 Y156.341
G1 X127.52 Y157.972 E.05801
G1 X126.954 Y157.951
G1 X125.303 Y156.3 E.0587
G1 X124.69 Y156.232
G1 X126.388 Y157.93 E.06038
G1 X125.81 Y157.898
G1 X124.076 Y156.164 E.06164
G1 X123.437 Y156.07
G1 X125.213 Y157.847 E.06317
G1 X124.616 Y157.795
G1 X122.787 Y155.965 E.06506
G1 X122.118 Y155.842
G1 X123.993 Y157.718 E.06669
G1 X123.362 Y157.632
G1 X121.426 Y155.695 E.06885
G1 X120.717 Y155.532
G1 X122.719 Y157.534 E.07119
G1 X122.049 Y157.41
G1 X119.977 Y155.337 E.07369
G1 X119.213 Y155.119
G1 X121.379 Y157.285 E.077
G1 X120.664 Y157.115
G1 X118.415 Y154.866 E.07996
G1 X117.574 Y154.571
G1 X119.949 Y156.945 E.08443
G1 X119.188 Y156.73
G1 X116.706 Y154.248 E.08824
G1 X115.752 Y153.839
G1 X118.42 Y156.507 E.09486
G1 X117.595 Y156.227
G1 X114.735 Y153.368 E.10167
G1 X113.625 Y152.804
G1 X116.754 Y155.932 E.11125
G1 X115.845 Y155.569
G1 X112.366 Y152.09 E.1237
; WIPE_START
M204 S10000
G1 X113.78 Y153.504 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.842 Y151.111 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X114.887 Y155.156 E.14382
G1 X113.868 Y154.683
G1 X108.656 Y149.47 E.18534
; WIPE_START
M204 S10000
G1 X110.07 Y150.884 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X112.735 Y154.095 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X99.919 Y141.279 E.45568
; WIPE_START
M204 S10000
G1 X101.333 Y142.693 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.653 Y142.559 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X111.451 Y153.357 E.38393
; WIPE_START
M204 S10000
G1 X110.037 Y151.942 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.934 Y152.385 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X101.649 Y144.1 E.29457
; WIPE_START
M204 S10000
G1 X103.064 Y145.514 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.048 Y137.882 Z5.4 F30000
G1 X102.986 Y107.015 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0978225
G1 F18000
G1 X102.851 Y106.906 E.00072
; LINE_WIDTH: 0.132238
G1 X102.717 Y106.797 E.0011
; LINE_WIDTH: 0.166459
G1 X102.583 Y106.688 E.00149
G1 X102.574 Y106.578 E.00095
; WIPE_START
G1 X102.583 Y106.688 E-.2964
G1 X102.717 Y106.797 E-.4636
; WIPE_END
G1 E-.04 F1800
G1 X101.069 Y114.249 Z5.4 F30000
G1 X97.695 Y129.511 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0990989
G1 F18000
G1 X97.775 Y129.285 E.00101
; WIPE_START
G1 X97.695 Y129.511 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.184 Y122.025 Z5.4 F30000
G1 X101.27 Y111.534 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.368325
G1 F13473.529
G1 X101.07 Y111.372 E.00559
; LINE_WIDTH: 0.321166
G1 F15688.764
G1 X100.87 Y111.211 E.0048
; LINE_WIDTH: 0.274007
G1 F18000
G1 X100.671 Y111.049 E.00401
; LINE_WIDTH: 0.226848
G1 X100.471 Y110.887 E.00322
; LINE_WIDTH: 0.17969
G1 X100.272 Y110.726 E.00243
; LINE_WIDTH: 0.129386
G1 X100.072 Y110.564 E.00159
G1 X100.034 Y110.547 E.00026
G1 X100.018 Y110.563 E.00013
; LINE_WIDTH: 0.0960846
G1 X99.94 Y110.668 E.00053
; WIPE_START
G1 X100.018 Y110.563 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.888 Y118.194 Z5.4 F30000
G1 X99.568 Y136.815 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.166468
G1 F18000
G1 X99.356 Y136.484 E.00339
; WIPE_START
G1 X99.568 Y136.815 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.9 Y139.042 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.185707
G1 F18000
G1 X98.817 Y138.919 E.00146
; LINE_WIDTH: 0.143668
M73 P97 R0
G1 X98.734 Y138.796 E.00106
; LINE_WIDTH: 0.101629
G1 X98.651 Y138.674 E.00065
; WIPE_START
G1 X98.734 Y138.796 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.365 Y138.698 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102057
G1 F18000
G1 X100.274 Y138.568 E.0007
; LINE_WIDTH: 0.144953
G1 X100.184 Y138.438 E.00114
; LINE_WIDTH: 0.187848
G1 X100.093 Y138.307 E.00159
; WIPE_START
G1 X100.184 Y138.438 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.869 Y139.747 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102168
G1 F18000
G1 X100.781 Y139.627 E.00066
; LINE_WIDTH: 0.145258
G1 X100.693 Y139.507 E.00108
; LINE_WIDTH: 0.189468
G1 X100.606 Y139.387 E.0015
G1 X100.631 Y139.238 E.00153
; WIPE_START
G1 X100.606 Y139.387 E-.38318
G1 X100.693 Y139.507 E-.37682
; WIPE_END
G1 E-.04 F1800
G1 X101.487 Y140.909 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0970005
G1 F18000
G1 X101.402 Y140.799 E.00057
; LINE_WIDTH: 0.13011
G1 X101.315 Y140.686 E.00089
; LINE_WIDTH: 0.163752
G1 X101.25 Y140.598 E.00093
; LINE_WIDTH: 0.197445
G1 X101.131 Y140.435 E.00215
; WIPE_START
G1 X101.25 Y140.598 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.981 Y141.216 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.194194
G1 F18000
G1 X99.861 Y141.056 E.00208
; LINE_WIDTH: 0.14876
G1 X99.741 Y140.896 E.00149
; LINE_WIDTH: 0.103326
G1 X99.621 Y140.736 E.0009
; WIPE_START
G1 X99.741 Y140.896 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.715 Y142.496 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.197367
G1 F18000
G1 X100.555 Y142.293 E.00275
; LINE_WIDTH: 0.148086
G1 X100.394 Y142.09 E.00192
; LINE_WIDTH: 0.10203
G1 X100.289 Y141.95 E.00077
; WIPE_START
G1 X100.394 Y142.09 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.295 Y142.262 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0982382
G1 F18000
G1 X102.181 Y142.122 E.00075
; LINE_WIDTH: 0.133778
G1 X102.066 Y141.979 E.00119
; LINE_WIDTH: 0.165216
G1 X102.002 Y141.896 E.00089
; LINE_WIDTH: 0.204005
G1 X101.848 Y141.696 E.00279
; WIPE_START
G1 X102.002 Y141.896 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.465 Y143.977 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.104737
G1 F18000
G1 X103.264 Y143.741 E.00142
; LINE_WIDTH: 0.152963
G1 X103.063 Y143.504 E.0024
; LINE_WIDTH: 0.200519
G1 X102.862 Y143.268 E.00336
G1 X102.875 Y143.12 E.00162
; WIPE_START
G1 X102.862 Y143.268 E-.2467
G1 X103.063 Y143.504 E-.5133
; WIPE_END
G1 E-.04 F1800
G1 X101.711 Y144.038 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.205877
G1 F18000
G1 X101.543 Y143.836 E.00294
; LINE_WIDTH: 0.163475
G1 X101.375 Y143.634 E.00221
; LINE_WIDTH: 0.121072
G1 X101.207 Y143.431 E.00149
; LINE_WIDTH: 0.090234
G1 X101.141 Y143.348 E.00039
; WIPE_START
G1 X101.207 Y143.431 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.092 Y148.291 Z5.4 F30000
G1 X108.594 Y149.531 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.216963
G1 F18000
G1 X108.208 Y149.177 E.00624
; LINE_WIDTH: 0.176194
G1 X107.82 Y148.821 E.00487
; LINE_WIDTH: 0.142065
G1 X107.282 Y148.303 E.00524
; LINE_WIDTH: 0.111505
G1 X106.744 Y147.784 E.00376
G1 X105.694 Y146.721 E.00752
; LINE_WIDTH: 0.142076
G1 X105.182 Y146.177 E.00524
; LINE_WIDTH: 0.188012
G1 X104.668 Y145.63 E.00752
; LINE_WIDTH: 0.22294
G1 X104.458 Y145.396 E.00386
; WIPE_START
G1 X104.668 Y145.63 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.322 Y150.757 Z5.4 F30000
G1 X110.78 Y151.173 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.205822
G1 F18000
G1 X110.577 Y151.004 E.00295
; LINE_WIDTH: 0.163306
G1 X110.374 Y150.836 E.00222
; LINE_WIDTH: 0.120659
G1 X110.171 Y150.666 E.00149
; LINE_WIDTH: 0.0899373
G1 X110.049 Y150.56 E.00059
; WIPE_START
G1 X110.171 Y150.666 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.839 Y151.593 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0984751
G1 F18000
G1 X108.651 Y151.432 E.00103
; LINE_WIDTH: 0.137988
G1 X108.359 Y151.171 E.00265
; LINE_WIDTH: 0.181298
G1 X108.066 Y150.909 E.00376
; LINE_WIDTH: 0.224608
G1 X107.774 Y150.647 E.00487
; LINE_WIDTH: 0.267919
G1 X107.482 Y150.386 E.00597
; LINE_WIDTH: 0.313571
G1 F16115.49
G1 X106.912 Y149.85 E.01424
; LINE_WIDTH: 0.361561
G1 F13752.016
G1 X106.342 Y149.314 E.01668
; LINE_WIDTH: 0.385563
G1 F12812.231
G3 X104.147 Y147.092 I44.173 J-45.829 E.07152
; LINE_WIDTH: 0.324815
G1 F15491.65
G1 X103.794 Y146.707 E.00989
; LINE_WIDTH: 0.279957
G1 F18000
G1 X103.441 Y146.322 E.00836
; LINE_WIDTH: 0.235098
G1 X103.088 Y145.938 E.00684
; LINE_WIDTH: 0.190663
G1 X102.868 Y145.686 E.0034
; LINE_WIDTH: 0.146647
G1 X102.649 Y145.434 E.00245
; LINE_WIDTH: 0.102631
G1 X102.429 Y145.183 E.00149
; WIPE_START
G1 X102.649 Y145.434 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.245 Y150.625 Z5.4 F30000
G1 X110.625 Y152.833 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.1046
G1 F18000
G1 X110.416 Y152.663 E.00124
; LINE_WIDTH: 0.152568
G1 X110.206 Y152.493 E.00208
; LINE_WIDTH: 0.200537
G1 X109.996 Y152.323 E.00292
; WIPE_START
G1 X110.206 Y152.493 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X112.034 Y153.695 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.10375
G1 F18000
G1 X111.86 Y153.561 E.00099
; LINE_WIDTH: 0.150027
G1 X111.687 Y153.428 E.00165
; LINE_WIDTH: 0.196304
G1 X111.514 Y153.294 E.00231
; WIPE_START
G1 X111.687 Y153.428 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.243 Y154.358 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102913
G1 F18000
G1 X113.095 Y154.249 E.00082
; LINE_WIDTH: 0.147489
G1 X112.946 Y154.141 E.00136
; LINE_WIDTH: 0.192066
G1 X112.798 Y154.032 E.00189
; WIPE_START
G1 X112.946 Y154.141 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.563 Y152.866 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.194196
G1 F18000
G1 X113.403 Y152.746 E.00208
; LINE_WIDTH: 0.148766
G1 X113.243 Y152.626 E.00149
; LINE_WIDTH: 0.103335
G1 X113.083 Y152.506 E.0009
G1 X112.304 Y152.152 F30000
; LINE_WIDTH: 0.198436
G1 F18000
G1 X112.114 Y152.002 E.00259
; LINE_WIDTH: 0.151308
G1 X111.925 Y151.852 E.00184
; LINE_WIDTH: 0.10418
G1 X111.735 Y151.702 E.0011
; WIPE_START
G1 X111.925 Y151.852 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.34 Y155.364 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102061
G1 F18000
G1 X115.21 Y155.273 E.0007
; LINE_WIDTH: 0.144942
G1 X115.08 Y155.183 E.00114
; LINE_WIDTH: 0.187823
G1 X114.95 Y155.092 E.00159
; WIPE_START
G1 X115.08 Y155.183 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.688 Y153.903 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.18571
G1 F18000
G1 X115.565 Y153.82 E.00146
; LINE_WIDTH: 0.143673
G1 X115.443 Y153.737 E.00106
; LINE_WIDTH: 0.101636
G1 X115.32 Y153.654 E.00065
; WIPE_START
G1 X115.443 Y153.737 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.05 Y154.357 Z5.4 F30000
G1 X135.815 Y155.398 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0981462
G1 F18000
G3 X135.667 Y155.483 I-2.685 J-4.476 E.00071
; WIPE_START
G1 X135.815 Y155.398 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.083 Y151.043 Z5.4 F30000
G1 X156.06 Y141.332 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0952923
G1 F18000
G1 X156.003 Y141.41 E.00038
G1 X156.011 Y141.464 E.00022
; WIPE_START
G1 X156.003 Y141.41 E-.27492
G1 X156.06 Y141.332 E-.48508
; WIPE_END
G1 E-.04 F1800
G1 X156.963 Y133.753 Z5.4 F30000
G1 X158.304 Y122.489 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0992223
G1 F18000
G1 X158.225 Y122.715 E.00101
; WIPE_START
G1 X158.304 Y122.489 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.644 Y115.516 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.166335
G1 F18000
G1 X156.432 Y115.185 E.00338
; WIPE_START
G1 X156.644 Y115.516 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.349 Y113.327 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.101628
G1 F18000
G1 X157.266 Y113.204 E.00065
; LINE_WIDTH: 0.143665
G1 X157.183 Y113.081 E.00106
; LINE_WIDTH: 0.185702
G1 X157.1 Y112.959 E.00146
; WIPE_START
G1 X157.183 Y113.081 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.907 Y113.693 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.18785
G1 F18000
G1 X155.816 Y113.563 E.00159
; LINE_WIDTH: 0.144954
G1 X155.726 Y113.433 E.00114
; LINE_WIDTH: 0.102058
G1 X155.635 Y113.302 E.0007
G1 X155.37 Y112.762 F30000
; LINE_WIDTH: 0.190937
G1 F18000
G1 X155.395 Y112.614 E.00154
; LINE_WIDTH: 0.18834
G1 X155.307 Y112.494 E.00149
; LINE_WIDTH: 0.145253
G1 X155.219 Y112.374 E.00108
; LINE_WIDTH: 0.102166
G1 X155.131 Y112.254 E.00066
G1 X154.869 Y111.565 F30000
; LINE_WIDTH: 0.19749
G1 F18000
G1 X154.777 Y111.439 E.00166
; LINE_WIDTH: 0.163429
G1 X154.683 Y111.311 E.00134
; LINE_WIDTH: 0.129707
G1 X154.598 Y111.201 E.00086
; LINE_WIDTH: 0.0969753
G1 X154.513 Y111.091 E.00057
G1 X154.152 Y110.304 F30000
; LINE_WIDTH: 0.202499
G1 F18000
G1 X154.043 Y110.162 E.00196
; LINE_WIDTH: 0.168312
G1 X153.932 Y110.019 E.00159
; LINE_WIDTH: 0.133375
G1 X153.819 Y109.879 E.00117
; LINE_WIDTH: 0.098198
G1 X153.705 Y109.738 E.00075
; WIPE_START
G1 X153.819 Y109.879 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.711 Y110.051 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102066
G1 F18000
G1 X155.606 Y109.91 E.00078
; LINE_WIDTH: 0.148134
G1 X155.445 Y109.707 E.00192
; LINE_WIDTH: 0.197376
G1 X155.285 Y109.504 E.00275
; WIPE_START
G1 X155.445 Y109.707 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.379 Y111.264 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.103327
G1 F18000
G1 X156.259 Y111.104 E.0009
; LINE_WIDTH: 0.148763
G1 X156.139 Y110.944 E.00149
; LINE_WIDTH: 0.194199
G1 X156.019 Y110.784 E.00208
; WIPE_START
G1 X156.139 Y110.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.859 Y108.652 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.090299
G1 F18000
G1 X154.793 Y108.569 E.00039
; LINE_WIDTH: 0.121152
G1 X154.625 Y108.367 E.00149
; LINE_WIDTH: 0.163523
G1 X154.457 Y108.164 E.00221
; LINE_WIDTH: 0.205894
G1 X154.289 Y107.962 E.00294
; WIPE_START
G1 X154.457 Y108.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.125 Y108.881 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.199821
G1 F18000
G1 X153.139 Y108.732 E.00161
; LINE_WIDTH: 0.201162
G1 X152.937 Y108.496 E.00337
; LINE_WIDTH: 0.152947
G1 X152.736 Y108.26 E.0024
; LINE_WIDTH: 0.104731
G1 X152.535 Y108.024 E.00142
; WIPE_START
G1 X152.736 Y108.26 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.542 Y106.605 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.222736
G1 F18000
G1 X151.329 Y106.367 E.00392
; LINE_WIDTH: 0.187791
G1 X150.818 Y105.823 E.00747
; LINE_WIDTH: 0.141917
G1 X150.305 Y105.278 E.00525
; LINE_WIDTH: 0.109856
G1 X149.255 Y104.215 E.00736
; LINE_WIDTH: 0.114489
G1 X148.718 Y103.697 E.0039
; LINE_WIDTH: 0.142021
G1 X148.178 Y103.178 E.00526
; LINE_WIDTH: 0.176235
G1 X147.792 Y102.823 E.00485
; LINE_WIDTH: 0.216938
G1 X147.405 Y102.468 E.00625
; WIPE_START
G1 X147.792 Y102.823 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X145.95 Y101.44 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0899941
G1 F18000
G1 X145.828 Y101.333 E.00059
; LINE_WIDTH: 0.120715
G1 X145.625 Y101.164 E.00148
; LINE_WIDTH: 0.163261
G1 X145.422 Y100.996 E.00222
; LINE_WIDTH: 0.205808
G1 X145.22 Y100.827 E.00295
; WIPE_START
G1 X145.422 Y100.996 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.633 Y105.433 Z5.4 F30000
G1 X153.572 Y106.818 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.10265
G1 F18000
G1 X153.352 Y106.566 E.00149
; LINE_WIDTH: 0.146703
G1 X153.132 Y106.314 E.00245
; LINE_WIDTH: 0.190756
G1 X152.912 Y106.062 E.00341
; LINE_WIDTH: 0.235198
G1 X152.559 Y105.678 E.00684
; LINE_WIDTH: 0.280057
G1 X152.206 Y105.293 E.00837
; LINE_WIDTH: 0.324915
G1 F15486.321
G1 X151.852 Y104.908 E.00989
; LINE_WIDTH: 0.361719
G1 F13745.361
G1 X151.31 Y104.346 E.01667
; LINE_WIDTH: 0.393649
G1 F12523.922
G2 X149.658 Y102.686 I-34.638 J32.843 E.05487
; LINE_WIDTH: 0.361685
G1 F13746.827
G1 X149.088 Y102.15 E.01669
; LINE_WIDTH: 0.313697
G1 F16108.197
G1 X148.518 Y101.614 E.01424
; LINE_WIDTH: 0.26804
G1 F18000
G1 X148.226 Y101.353 E.00598
; LINE_WIDTH: 0.224724
G1 X147.934 Y101.091 E.00487
; LINE_WIDTH: 0.181408
G1 X147.641 Y100.829 E.00376
; LINE_WIDTH: 0.138091
G1 X147.349 Y100.568 E.00265
; LINE_WIDTH: 0.0985315
G1 X147.16 Y100.407 E.00104
; WIPE_START
G1 X147.349 Y100.568 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.003 Y99.677 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.200547
G1 F18000
G1 X145.794 Y99.507 E.00292
; LINE_WIDTH: 0.152574
G1 X145.584 Y99.337 E.00208
; LINE_WIDTH: 0.104601
G1 X145.374 Y99.167 E.00124
; WIPE_START
G1 X145.584 Y99.337 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.486 Y98.706 Z5.4 F30000
M73 P98 R0
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.196304
G1 F18000
G1 X144.313 Y98.572 E.00231
; LINE_WIDTH: 0.150027
G1 X144.139 Y98.438 E.00165
; LINE_WIDTH: 0.10375
G1 X143.966 Y98.305 E.00099
G1 X143.202 Y97.968 F30000
; LINE_WIDTH: 0.192078
G1 F18000
G1 X143.053 Y97.859 E.00189
; LINE_WIDTH: 0.147497
G1 X142.905 Y97.75 E.00136
; LINE_WIDTH: 0.102916
G1 X142.757 Y97.642 E.00082
G1 X142.067 Y97.381 F30000
; LINE_WIDTH: 0.214327
G1 F18000
G1 X141.995 Y97.326 E.00107
; LINE_WIDTH: 0.192028
G1 X141.885 Y97.25 E.00137
; LINE_WIDTH: 0.147465
G1 X141.775 Y97.173 E.00099
; LINE_WIDTH: 0.102902
G1 X141.666 Y97.097 E.0006
; WIPE_START
G1 X141.775 Y97.173 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.744 Y98.866 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102482
G1 F18000
G1 X141.605 Y98.767 E.00076
; LINE_WIDTH: 0.146213
G1 X141.466 Y98.668 E.00124
; LINE_WIDTH: 0.189943
G1 X141.328 Y98.569 E.00173
; WIPE_START
G1 X141.466 Y98.668 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.916 Y99.494 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.103335
G1 F18000
G1 X142.757 Y99.374 E.0009
; LINE_WIDTH: 0.148766
G1 X142.597 Y99.254 E.00149
; LINE_WIDTH: 0.194196
G1 X142.437 Y99.134 E.00208
; WIPE_START
G1 X142.597 Y99.254 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.265 Y100.298 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.104182
G1 F18000
G1 X144.075 Y100.148 E.0011
; LINE_WIDTH: 0.151315
G1 X143.885 Y99.998 E.00184
; LINE_WIDTH: 0.198448
G1 X143.696 Y99.848 E.00259
; WIPE_START
G1 X143.885 Y99.998 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.725 Y97.937 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.101618
G1 F18000
G1 X139.602 Y97.854 E.00065
; LINE_WIDTH: 0.143617
G1 X139.48 Y97.771 E.00105
; LINE_WIDTH: 0.185616
G1 X139.357 Y97.688 E.00146
; WIPE_START
G1 X139.48 Y97.771 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.952 Y97.254 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0955973
G1 F18000
G2 X137.652 Y97.067 I-5.903 J9.136 E.00141
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X137.952 Y97.254 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.217 J0 P1  F30000
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
G1 Z5.5 F900 ; lower z a little
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

    G1 Z105 F600
    G1 Z103

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

