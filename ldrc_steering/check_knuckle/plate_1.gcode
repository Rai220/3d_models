; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 14m 42s; total estimated time: 21m 47s
; total layer number: 145
; total filament length [mm] : 540.30
; total filament volume [cm^3] : 1299.58
; total filament weight [g] : 1.61
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 12.56
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
; bottom_color_penetration_layers = 5
; bottom_shell_layers = 6
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 20
; brim_object_gap = 0.1
; brim_type = outer_only
; brim_width = 3
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
; enable_support = 1
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
; filament_colour = #F0A040
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
; gap_infill_speed = 350
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
; initial_layer_infill_speed = 30
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.32
; initial_layer_speed = 20
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 60
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
; internal_solid_infill_speed = 350
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
; layer_height = 0.12
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
; outer_wall_speed = 30
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
; print_settings_id = 0.12mm LDRC steering @P1S
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
; seam_position = aligned
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
; sparse_infill_density = 30%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 430
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
; support_interface_top_layers = 3
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
; support_type = normal(auto)
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
; top_shell_layers = 6
; top_shell_thickness = 0.6
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 30
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
; wall_generator = arachne
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
M73 P0 R21
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
M73 P2 R21
G1 E50 F200
M400
M104 S220
G92 E0
M73 P22 R16
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P23 R16
G1 E-0.5 F300

M73 P24 R16
G1 X70 F9000
M73 P25 R16
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
    G29 A X114.226 Y114.226 I27.5481 J25.8556
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
M73 P26 R16
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
G0 X240 E15 F567.717
G0 Y11 E0.700 F141.929
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F567.717
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
; Z_HEIGHT: 0.32
; LAYER_HEIGHT: 0.32
G1 E-.8 F1800
; layer num/total_layer_count: 1/145
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
; OBJECT_ID: 15
G1 X128.052 Y116.453 F30000
M204 S6000
G1 Z.4
G1 Z.32
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F1200
M204 S500
G3 X127.871 Y116.45 I-.177 J5.797 E2.03906
M73 P26 R15
G1 X127.988 Y116.452 E.00654
M204 S6000
G1 X133.272 Y123.764 F30000
G1 F1200
M204 S500
G2 X133.272 Y121.845 I-15.996 J-.958 E.10801
G2 X132.792 Y119.991 I-5.542 J.443 E.10823
G1 X132.785 Y124.525 E.25498
G3 X132.313 Y125.346 I-5.471 J-2.6 E.0533
G1 X132.302 Y119.137 E.34915
M73 P27 R15
G2 X131.834 Y118.561 I-4.507 J3.183 E.04177
G1 X131.834 Y125.938 E.41488
G3 X131.355 Y126.394 I-3.989 J-3.72 E.03719
G1 X131.355 Y118.106 E.46608
G2 X130.875 Y117.747 I-3.503 J4.174 E.0337
G1 X130.875 Y126.753 E.50647
G3 X130.396 Y127.038 I-4.087 J-6.326 E.03136
G1 X130.396 Y117.462 E.53853
G2 X129.917 Y117.238 I-2.656 J5.071 E.02975
G1 X129.917 Y127.261 E.56366
G3 X129.438 Y127.43 I-3.126 J-8.088 E.02859
G1 X129.438 Y117.069 E.58269
G2 X128.958 Y116.948 I-2.312 J8.153 E.0278
G1 X128.958 Y127.551 E.59629
G3 X128.479 Y127.627 I-1.567 J-8.359 E.02729
G1 X128.479 Y116.872 E.60481
G2 X128 Y116.84 I-.811 J8.459 E.02702
G1 X128 Y127.66 E.60845
G3 X127.521 Y127.649 I-.05 J-8.994 E.02696
G1 X127.521 Y116.85 E.60732
G2 X127.041 Y116.903 I.749 J8.977 E.02712
M73 P28 R15
G1 X127.041 Y127.596 E.60137
G3 X126.562 Y127.499 I1.513 J-8.7 E.0275
G1 X126.562 Y117 E.59045
G2 X126.083 Y117.144 I2.206 J8.221 E.02814
G1 X126.083 Y127.356 E.57427
G3 X125.604 Y127.161 I2.681 J-7.293 E.02909
G1 X125.604 Y117.338 E.55239
G2 X125.124 Y117.589 I3.256 J6.798 E.03043
G1 X125.124 Y126.91 E.52415
M73 P30 R15
G3 X124.645 Y126.591 I2.838 J-4.788 E.03238
G1 X124.645 Y117.908 E.48831
G2 X124.166 Y118.309 I3.277 J4.4 E.03517
G1 X124.166 Y126.19 E.44317
G3 X123.687 Y125.676 I3.74 J-3.968 E.03955
M73 P32 R14
G1 X123.687 Y118.823 E.38536
G2 X123.207 Y119.512 I4.789 J3.846 E.0472
G1 X123.207 Y124.988 E.30794
G3 X122.728 Y123.922 I5.036 J-2.906 E.0658
G1 X122.728 Y120.029 E.21897
; WIPE_START
G1 X122.728 Y122.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X130.06 Y119.907 Z.72 F30000
G1 X135.736 Y118.264 Z.72
G1 Z.32
G1 E.8 F1800
G1 F1200
M204 S500
G1 X141.524 Y118.264 E.32552
G1 X141.524 Y125.053 E.38175
G1 X138.63 Y125.053 E.16276
G1 X138.63 Y127.947 E.16276
G1 X135.736 Y127.947 E.16276
G1 X135.736 Y130.841 E.16276
G1 X130.325 Y130.841 E.30427
G1 X130.325 Y130.144 E.0392
G1 X132.049 Y128.42 E.13715
G1 X132.695 Y127.93 E.04555
G1 X133.332 Y127.322 E.04955
G1 X133.9 Y126.631 E.05029
G1 X134.38 Y125.881 E.05009
G1 X134.77 Y125.071 E.05053
G1 X135.112 Y124.019 E.06224
G1 X135.272 Y123.136 E.05048
G1 X135.322 Y122.025 E.06252
G1 X135.205 Y120.916 E.0627
G1 X134.851 Y119.635 E.07473
M73 P33 R14
G1 X134.383 Y118.624 E.06264
G1 X133.766 Y117.69 E.06298
G1 X133.021 Y116.863 E.06262
G1 X131.982 Y116.034 E.07475
G1 X131.004 Y115.488 E.06298
G1 X129.753 Y115.04 E.07473
G1 X128.428 Y114.82 E.07551
G1 X127.544 Y114.807 E.04973
G1 X126.878 Y114.867 E.03759
G1 X125.57 Y115.165 E.07547
G1 X124.944 Y115.401 E.0376
G1 X124.155 Y115.795 E.04957
G1 X123.055 Y116.569 E.07565
G1 X122.416 Y117.18 E.04972
G1 X121.983 Y117.69 E.03761
G1 X121.595 Y118.242 E.03798
G1 X121.164 Y119.014 E.0497
G1 X120.692 Y120.271 E.07553
G1 X120.455 Y121.586 E.07513
G1 X120.454 Y122.91 E.07444
G1 X120.638 Y124.019 E.06324
G1 X121.07 Y125.283 E.07512
G1 X121.599 Y126.263 E.06264
G1 X122.267 Y127.154 E.06262
G1 X122.893 Y127.788 E.0501
G1 X123.701 Y128.42 E.05766
G1 X125.425 Y130.144 E.13715
G1 X125.425 Y130.841 E.0392
G1 X120.264 Y130.841 E.29021
G1 X120.264 Y127.947 E.16276
G1 X117.37 Y127.947 E.16276
G1 X117.37 Y125.053 E.16276
G1 X114.476 Y125.053 E.16276
G1 X114.476 Y118.264 E.38175
G1 X117.37 Y118.264 E.16276
G1 X117.37 Y115.37 E.16276
G1 X120.264 Y115.37 E.16276
G1 X120.264 Y112.476 E.16276
G1 X135.736 Y112.476 E.87004
G1 X135.736 Y118.2 E.32189
M204 S6000
G1 X140.94 Y124.859 F30000
G1 F1200
M204 S500
G1 X140.94 Y118.653 E.34901
G1 X140.46 Y118.653 E.02695
G1 X140.46 Y124.665 E.33809
G1 X139.981 Y124.665 E.02695
G1 X139.981 Y118.653 E.33809
G1 X139.502 Y118.653 E.02695
G1 X139.502 Y124.665 E.33809
G1 X139.023 Y124.665 E.02695
G1 X139.023 Y118.653 E.33809
G1 X138.543 Y118.653 E.02695
G1 X138.543 Y124.665 E.33809
G1 X138.242 Y124.665 E.01697
G1 X138.242 Y127.559 E.16276
G1 X138.064 Y127.559 E.00998
G1 X138.064 Y118.653 E.50086
G1 X137.585 Y118.653 E.02695
G1 X137.585 Y127.559 E.50086
G1 X137.106 Y127.559 E.02695
G1 X137.106 Y118.653 E.50086
G1 X136.626 Y118.653 E.02695
G1 X136.626 Y127.559 E.50086
G1 X136.147 Y127.559 E.02695
G1 X136.147 Y118.653 E.50086
G1 X135.668 Y118.653 E.02695
G1 X135.668 Y127.559 E.50086
G1 X135.347 Y127.559 E.01803
G1 X135.347 Y130.453 E.16276
G1 X135.189 Y130.453 E.00892
G1 X135.189 Y125.067 E.30291
G1 X134.709 Y126.087 E.06338
G1 X134.709 Y130.453 E.24555
G1 X134.23 Y130.453 E.02695
G1 X134.23 Y126.837 E.20336
G1 X133.751 Y127.437 E.04316
G1 X133.751 Y130.453 E.16965
G1 X133.272 Y130.453 E.02695
G1 X133.272 Y127.934 E.14169
G1 X132.792 Y128.353 E.03581
G1 X132.792 Y130.453 E.11811
G1 X132.313 Y130.453 E.02695
G1 X132.313 Y128.71 E.09805
G2 X131.834 Y129.184 I1.033 J1.522 E.03815
G1 X131.834 Y130.453 E.07136
G1 X131.355 Y130.453 E.02695
G1 X131.355 Y129.664 E.04441
G1 X130.875 Y130.143 E.03811
G1 X130.875 Y130.647 E.02837
; WIPE_START
G1 X130.875 Y130.143 E-.19171
M73 P34 R14
G1 X131.355 Y129.664 E-.25755
G1 X131.355 Y130.453 E-.30007
G1 X131.383 Y130.453 E-.01067
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134 Y123.284 Z.72 F30000
G1 X135.189 Y120.028 Z.72
G1 Z.32
G1 E.8 F1800
G1 F1200
M204 S500
G1 X135.189 Y112.864 E.40287
G1 X134.709 Y112.864 E.02695
G1 X134.709 Y118.413 E.31202
G1 X134.23 Y117.662 E.05007
G1 X134.23 Y112.864 E.26983
G1 X133.751 Y112.864 E.02695
G1 X133.751 Y117.063 E.23612
G1 X133.272 Y116.566 E.03883
G1 X133.272 Y112.864 E.20816
G1 X132.792 Y112.864 E.02695
G1 X132.792 Y116.147 E.18459
G1 X132.313 Y115.79 E.03359
G1 X132.313 Y112.864 E.16454
G1 X131.834 Y112.864 E.02695
G1 X131.834 Y115.485 E.14741
G1 X131.355 Y115.227 E.03063
G1 X131.355 Y112.864 E.13285
G1 X130.875 Y112.864 E.02695
G1 X130.875 Y115.009 E.12064
G1 X130.396 Y114.829 E.0288
G1 X130.396 Y112.864 E.11049
G1 X129.917 Y112.864 E.02695
G1 X129.917 Y114.683 E.10228
G1 X129.438 Y114.569 E.0277
G1 X129.438 Y112.864 E.0959
G1 X128.958 Y112.864 E.02695
G1 X128.958 Y114.487 E.09127
G1 X128.479 Y114.435 E.02711
G1 X128.479 Y112.864 E.08834
G1 X128 Y112.864 E.02695
G1 X128 Y114.413 E.08708
G1 X127.521 Y114.42 E.02695
G1 X127.521 Y112.864 E.08747
G1 X127.041 Y112.864 E.02695
G1 X127.041 Y114.456 E.08953
G1 X126.562 Y114.523 E.02721
G1 X126.562 Y112.864 E.09326
G1 X126.083 Y112.864 E.02695
G1 X126.083 Y114.62 E.09872
G1 X125.604 Y114.749 E.02791
G1 X125.604 Y112.864 E.10597
G1 X125.124 Y112.864 E.02695
G1 X125.124 Y114.911 E.1151
G1 X124.645 Y115.109 E.02915
G1 X124.645 Y112.864 E.12622
G1 X124.166 Y112.864 E.02695
G1 X124.166 Y115.345 E.13949
G1 X123.687 Y115.625 E.03123
G1 X123.687 Y112.864 E.15527
G1 X123.207 Y112.864 E.02695
G1 X123.207 Y115.953 E.17372
G1 X122.728 Y116.339 E.0346
G1 X122.728 Y112.864 E.19541
G1 X122.249 Y112.864 E.02695
G1 X122.249 Y116.793 E.22094
G1 X121.77 Y117.335 E.0407
G1 X121.77 Y112.864 E.25144
G1 X121.29 Y112.864 E.02695
G1 X121.29 Y117.998 E.28872
G1 X120.811 Y118.853 E.05509
G1 X120.811 Y112.864 E.33677
G1 X120.653 Y112.864 E.00892
G1 X120.653 Y115.758 E.16276
G1 X120.332 Y115.758 E.01803
G1 X120.332 Y120.121 E.24531
G1 X120.126 Y121.072 E.05474
G1 X120.04 Y122.024 E.05377
G1 X120.094 Y123.195 E.06593
G1 X120.332 Y124.379 E.06788
G1 X120.332 Y127.559 E.17884
G1 X119.853 Y127.559 E.02695
G1 X119.853 Y115.758 E.66362
G1 X119.373 Y115.758 E.02695
G1 X119.373 Y127.559 E.66362
G1 X118.894 Y127.559 E.02695
G1 X118.894 Y115.758 E.66362
G1 X118.415 Y115.758 E.02695
G1 X118.415 Y127.559 E.66362
G1 X117.936 Y127.559 E.02695
G1 X117.936 Y115.758 E.66362
G1 X117.758 Y115.758 E.00997
G1 X117.758 Y118.653 E.16276
G1 X117.456 Y118.653 E.01698
G1 X117.456 Y124.665 E.33809
G1 X116.977 Y124.665 E.02695
G1 X116.977 Y118.653 E.33809
G1 X116.498 Y118.653 E.02695
G1 X116.498 Y124.665 E.33809
G1 X116.019 Y124.665 E.02695
G1 X116.019 Y118.653 E.33809
G1 X115.539 Y118.653 E.02695
G1 X115.539 Y124.665 E.33809
G1 X115.06 Y124.665 E.02695
G1 X115.06 Y118.459 E.34901
M204 S6000
G1 X124.645 Y130.647 F30000
G1 F1200
M204 S500
G1 X124.645 Y129.914 E.04126
G1 X124.166 Y129.434 E.03812
G1 X124.166 Y130.453 E.0573
G1 X123.687 Y130.453 E.02695
G1 X123.687 Y128.955 E.08425
G2 X123.207 Y128.546 I-1.728 J1.54 E.03554
G1 X123.207 Y130.453 E.10725
G1 X122.728 Y130.453 E.02695
G1 X122.728 Y128.16 E.12894
G1 X122.249 Y127.706 E.03712
G1 X122.249 Y130.453 E.15447
M73 P35 R14
G1 X121.77 Y130.453 E.02695
G1 X121.77 Y127.164 E.18497
G1 X121.29 Y126.501 E.046
G1 X121.29 Y130.453 E.22224
G1 X120.811 Y130.453 E.02695
G1 X120.811 Y125.171 E.29707
; WIPE_START
G1 X120.811 Y127.171 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X119.799 Y131.012 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; FEATURE: Brim
G1 F1200
M204 S500
G1 X119.799 Y131.091 E.00446
G1 X119.847 Y131.228 E.00814
G1 X120.014 Y131.307 E.0104
G1 X120.914 Y131.307 E.05061
G1 X121.256 Y131.533 E.02301
G1 X121.71 Y131.998 E.03658
G1 X121.882 Y132.211 E.01541
G1 X122.047 Y132.357 E.01238
G1 X122.226 Y132.47 E.01189
G1 X122.398 Y132.547 E.01062
G1 X122.644 Y132.613 E.01432
G1 X122.83 Y132.632 E.01051
G1 X123.187 Y132.632 E.02005
G1 X123.323 Y132.584 E.00814
G1 X123.403 Y132.417 E.01041
G1 X123.403 Y131.307 E.06241
G1 X125.559 Y131.307 E.12128
G1 X125.559 Y134.79 E.19587
G1 X122.789 Y134.789 E.15577
G1 X122.385 Y134.756 E.02284
G1 X122.08 Y134.699 E.01741
G1 X121.78 Y134.616 E.01752
G1 X121.488 Y134.507 E.01756
G1 X121.207 Y134.372 E.01751
G1 X120.939 Y134.214 E.01749
G1 X120.686 Y134.032 E.01751
G1 X120.451 Y133.83 E.01743
G1 X120.161 Y133.523 E.02379
G1 X119.922 Y133.232 E.02115
G1 X119.733 Y133.155 E.0115
G1 X119.636 Y133.165 E.00545
G1 X119.535 Y133.203 E.00606
G1 X119.299 Y133.368 E.01619
G1 X119.219 Y133.455 E.00664
G1 X119.174 Y133.615 E.00936
G1 X119.185 Y133.711 E.00544
G1 X119.225 Y133.811 E.00607
G1 X119.625 Y134.302 E.03561
G1 X119.808 Y134.486 E.01461
G1 X120.209 Y134.824 E.02947
G1 X120.627 Y135.1 E.02818
G1 X121.115 Y135.347 E.03074
G1 X121.636 Y135.533 E.03114
G1 X122.148 Y135.649 E.02954
G1 X122.77 Y135.708 E.03512
G1 X129.875 Y135.709 E.39954
G1 X129.988 Y135.686 E.00648
G1 X130.117 Y135.583 E.00928
G1 X130.164 Y135.498 E.00544
G1 X130.191 Y135.394 E.00606
G1 X130.191 Y131.307 E.22982
G1 X132.347 Y131.307 E.12128
G1 X132.347 Y135.383 E.22922
G1 X132.301 Y135.857 E.02678
G1 X132.164 Y136.305 E.02636
G1 X132.006 Y136.621 E.01986
G1 X131.739 Y137.01 E.02652
G1 X131.405 Y137.334 E.02618
G1 X131.014 Y137.587 E.02618
G1 X130.587 Y137.756 E.02584
G1 X129.858 Y137.866 E.04141
G1 X122.775 Y137.865 E.39837
G1 X122.422 Y137.85 E.01985
G1 X121.847 Y137.785 E.03256
G1 X121.323 Y137.68 E.03003
G1 X120.785 Y137.526 E.03147
G1 X120.143 Y137.275 E.03874
G1 X119.502 Y136.94 E.04071
G1 X118.882 Y136.524 E.04201
G1 X118.61 Y136.307 E.01952
G1 X118.273 Y136.002 E.02561
G1 X117.746 Y135.427 E.04383
G1 X117.482 Y135.082 E.02443
G1 X117.244 Y134.673 E.02662
G1 X117.091 Y134.228 E.02643
G1 X117.045 Y133.972 E.01464
G1 X117.024 Y133.406 E.03186
G1 X117.105 Y132.949 E.02608
G1 X117.273 Y132.517 E.0261
G1 X117.565 Y132.072 E.02991
G1 X118.075 Y131.593 E.03938
G1 X118.29 Y131.442 E.01472
G1 X118.705 Y131.209 E.02678
G1 X119.15 Y131.063 E.02635
G1 X119.498 Y131.011 E.01981
G1 X119.739 Y131.012 E.01352
M204 S6000
G1 X119.508 Y131.508 F30000
G1 F1200
M204 S500
G1 X119.518 Y131.512 E.00058
G1 X119.673 Y131.622 E.0107
G1 X119.816 Y131.69 E.00893
G1 X120.029 Y131.738 E.01224
G1 X120.746 Y131.738 E.04032
M73 P35 R13
G1 X120.817 Y131.76 E.00419
G1 X120.989 Y131.877 E.01168
G1 X121.383 Y132.281 E.03175
G1 X121.602 Y132.539 E.01905
G1 X121.823 Y132.726 E.01626
G1 X122.056 Y132.867 E.01528
G1 X122.295 Y132.966 E.01455
G1 X122.61 Y133.043 E.01822
G1 X122.835 Y133.063 E.01272
G1 X123.175 Y133.064 E.01911
G1 X123.342 Y133.035 E.00955
G1 X123.455 Y132.995 E.00674
G1 X123.622 Y132.892 E.01102
G1 X123.718 Y132.758 E.00926
G1 X123.786 Y132.615 E.00893
G1 X123.834 Y132.402 E.01225
G1 X123.834 Y131.868 E.03006
G1 X123.882 Y131.767 E.00624
G1 X123.963 Y131.738 E.00488
G1 X124.999 Y131.738 E.05821
G1 X125.099 Y131.786 E.00624
G1 X125.128 Y131.868 E.00488
G1 X125.128 Y134.229 E.13279
G1 X125.08 Y134.329 E.00624
G1 X124.999 Y134.358 E.00489
G1 X122.802 Y134.357 E.12353
G1 X122.43 Y134.325 E.02101
G1 X121.925 Y134.209 E.02915
G1 X121.421 Y133.996 E.03074
G1 X120.963 Y133.699 E.0307
G1 X120.745 Y133.513 E.01612
G1 X120.265 Y132.971 E.04072
G1 X120.07 Y132.827 E.01361
G1 X119.911 Y132.762 E.00969
G1 X119.676 Y132.728 E.01333
G1 X119.474 Y132.765 E.01154
G1 X119.283 Y132.853 E.01184
G1 X118.975 Y133.083 E.02162
G1 X118.913 Y133.15 E.00512
G1 X118.8 Y133.352 E.013
G1 X118.762 Y133.485 E.00778
G1 X118.756 Y133.751 E.01497
G1 X118.822 Y133.963 E.01251
G1 X118.896 Y134.091 E.00834
G1 X119.323 Y134.611 E.03783
G1 X119.534 Y134.819 E.01664
G1 X119.977 Y135.187 E.03238
G1 X120.439 Y135.489 E.03103
G1 X120.914 Y135.728 E.02991
G1 X121.484 Y135.937 E.03415
G1 X122.116 Y136.079 E.03643
G1 X122.776 Y136.139 E.03728
G1 X129.865 Y136.141 E.39865
G1 X130.065 Y136.109 E.01137
G1 X130.268 Y136.014 E.01266
G1 X130.376 Y135.928 E.00772
G1 X130.497 Y135.784 E.01059
G1 X130.582 Y135.599 E.01146
G1 X130.622 Y135.382 E.01241
G1 X130.622 Y131.868 E.19763
G1 X130.67 Y131.767 E.00624
G1 X130.751 Y131.738 E.00488
G1 X131.787 Y131.738 E.05821
G1 X131.887 Y131.786 E.00624
G1 X131.916 Y131.868 E.00488
G1 X131.916 Y135.355 E.19614
G1 X131.877 Y135.76 E.02283
G1 X131.765 Y136.135 E.02201
G1 X131.629 Y136.409 E.01721
G1 X131.415 Y136.719 E.0212
G1 X131.124 Y137.002 E.02281
G1 X130.826 Y137.194 E.01997
G1 X130.487 Y137.331 E.02055
G1 X129.836 Y137.433 E.03708
G1 X122.781 Y137.433 E.39673
G1 X122.451 Y137.419 E.01857
G1 X121.908 Y137.357 E.03075
G1 X121.419 Y137.259 E.028
G1 X120.917 Y137.115 E.02937
G1 X120.316 Y136.879 E.03633
G1 X119.729 Y136.572 E.03727
G1 X119.141 Y136.178 E.03978
G1 X118.886 Y135.976 E.01829
G1 X118.573 Y135.691 E.02382
G1 X118.081 Y135.154 E.04096
G1 X117.846 Y134.848 E.0217
M73 P36 R13
G1 X117.644 Y134.503 E.02246
G1 X117.508 Y134.11 E.02342
G1 X117.475 Y133.917 E.011
G1 X117.457 Y133.45 E.0263
G1 X117.52 Y133.079 E.02115
G1 X117.666 Y132.704 E.02261
G1 X117.889 Y132.364 E.02287
G1 X118.356 Y131.923 E.03611
G1 X118.525 Y131.805 E.01162
G1 X118.868 Y131.612 E.02212
G1 X119.26 Y131.483 E.02322
G1 X119.407 Y131.461 E.00836
G1 X119.454 Y131.483 E.0029
M204 S6000
G1 X119.384 Y131.949 F30000
G1 F1200
M204 S500
G1 X119.389 Y131.95 E.0003
G1 X119.605 Y132.068 E.01382
G1 X119.672 Y132.156 E.00624
G1 X119.645 Y132.264 E.00624
G1 X119.575 Y132.308 E.00466
G1 X119.285 Y132.378 E.01681
G1 X119.017 Y132.514 E.01689
G1 X118.655 Y132.795 E.02576
G1 X118.532 Y132.948 E.01106
G1 X118.43 Y133.13 E.01174
G1 X118.351 Y133.358 E.01355
G1 X118.325 Y133.733 E.02111
G1 X118.347 Y133.886 E.00874
G1 X118.455 Y134.189 E.01809
G1 X118.568 Y134.371 E.01207
G1 X119.025 Y134.922 E.04022
G1 X119.262 Y135.154 E.01867
G1 X119.695 Y135.514 E.03166
G1 X120.251 Y135.877 E.03731
G1 X120.772 Y136.136 E.03275
G1 X121.328 Y136.339 E.0333
G1 X122.013 Y136.498 E.03955
G1 X122.782 Y136.571 E.04341
G1 X129.856 Y136.572 E.39783
G1 X130.124 Y136.537 E.01516
G1 X130.254 Y136.497 E.00767
G1 X130.544 Y136.345 E.01842
G1 X130.708 Y136.202 E.01225
G1 X130.893 Y135.954 E.01735
G1 X131.008 Y135.666 E.01748
G1 X131.053 Y135.372 E.0167
G1 X131.053 Y132.299 E.17282
G1 X131.101 Y132.199 E.00624
G1 X131.183 Y132.17 E.00488
G1 X131.355 Y132.17 E.0097
G1 X131.455 Y132.217 E.00624
G1 X131.485 Y132.299 E.00488
G1 X131.485 Y135.328 E.17036
G1 X131.453 Y135.664 E.01897
G1 X131.366 Y135.965 E.01763
G1 X131.251 Y136.197 E.01451
G1 X131.091 Y136.429 E.01585
G1 X130.843 Y136.669 E.01943
G1 X130.615 Y136.815 E.01523
G1 X130.385 Y136.907 E.01392
G1 X129.792 Y137.002 E.03377
G1 X122.787 Y137.002 E.39392
G1 X122.48 Y136.988 E.0173
G1 X121.969 Y136.929 E.02893
G1 X121.516 Y136.838 E.02597
G1 X121.062 Y136.708 E.02658
G1 X120.502 Y136.488 E.03383
G1 X119.955 Y136.204 E.03465
G1 X119.388 Y135.823 E.03843
G1 X118.874 Y135.381 E.03815
G1 X118.415 Y134.881 E.03813
G1 X118.201 Y134.6 E.01989
G1 X118.034 Y134.31 E.01884
G1 X117.924 Y133.978 E.01964
G1 X117.89 Y133.495 E.02725
G1 X117.942 Y133.182 E.01784
G1 X118.059 Y132.892 E.01757
G1 X118.233 Y132.633 E.01757
G1 X118.644 Y132.248 E.03163
G1 X119.055 Y132.004 E.02687
G1 X119.274 Y131.932 E.01297
G1 X119.324 Y131.94 E.00288
M204 S6000
G1 X120.161 Y132.216 F30000
G1 F1200
M204 S500
G1 X120.264 Y132.17 E.00634
G1 X120.63 Y132.179 E.02059
G1 X120.721 Y132.22 E.00563
G1 X121.33 Y132.874 E.05023
G1 X121.538 Y133.05 E.01532
G1 X121.827 Y133.232 E.01918
G1 X122.122 Y133.361 E.01813
G1 X122.5 Y133.46 E.022
G1 X122.793 Y133.492 E.01653
G1 X123.165 Y133.495 E.02093
G1 X123.408 Y133.461 E.01382
G1 X123.591 Y133.404 E.01078
G1 X123.839 Y133.264 E.01603
G1 X123.979 Y133.134 E.01072
G1 X124.062 Y133.018 E.00801
G1 X124.171 Y132.808 E.01331
G1 X124.253 Y132.505 E.01767
G1 X124.266 Y132.291 E.01203
G1 X124.319 Y132.194 E.00624
G1 X124.395 Y132.17 E.00447
G1 X124.567 Y132.17 E.0097
G1 X124.668 Y132.217 E.00624
G1 X124.697 Y132.299 E.00488
G1 X124.697 Y133.797 E.08426
G1 X124.649 Y133.898 E.00624
G1 X124.567 Y133.927 E.00489
G1 X122.815 Y133.925 E.09854
G1 X122.488 Y133.896 E.01846
G1 X122.048 Y133.792 E.02544
G1 X121.614 Y133.607 E.02652
G1 X121.215 Y133.348 E.02677
G1 X121.042 Y133.198 E.01284
G1 X120.596 Y132.693 E.03791
G1 X120.332 Y132.484 E.01893
G1 X120.199 Y132.413 E.00845
G1 X120.134 Y132.324 E.00624
G1 X120.146 Y132.274 E.00287
; WIPE_START
G1 X120.264 Y132.17 E-.0598
G1 X120.63 Y132.179 E-.13911
G1 X120.721 Y132.22 E-.03807
G1 X121.33 Y132.874 E-.33939
G1 X121.538 Y133.05 E-.10351
G1 X121.716 Y133.162 E-.08012
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.136 Y130.229 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.590563
G1 F1200
M204 S500
G1 X128.136 Y133.655 E.23316
G1 X127.614 Y133.674 E.03554
G1 X127.614 Y130.229 E.23444
G1 X128.076 Y130.229 E.03143
M204 S6000
G1 X128.634 Y129.722 F30000
; LINE_WIDTH: 0.499993
G1 F1200
M204 S500
G1 X128.613 Y129.881 E.00907
G1 X128.612 Y134.132 E.23901
G2 X127.113 Y134.181 I-.305 J13.509 E.08439
G1 X127.137 Y133.702 E.02698
G1 X127.137 Y130.42 E.18455
G1 X127.116 Y129.722 E.03931
G2 X128.574 Y129.726 I.759 J-9.122 E.08208
; WIPE_START
G1 X128.613 Y129.881 E-.06071
G1 X128.612 Y131.722 E-.69929
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.548 Y129.121 Z.72 F30000
G1 Z.32
G1 E.8 F1800
G1 F1200
M204 S500
G1 X129.219 Y129.439 E.02572
G1 X129.044 Y129.881 E.02677
G1 X129.044 Y134.563 E.26325
G2 X126.658 Y134.677 I-.494 J14.644 E.13448
G3 X126.706 Y133.702 I95.04 J4.193 E.0549
G1 X126.706 Y129.861 E.21601
G1 X126.527 Y129.434 E.02601
G1 X126.213 Y129.124 E.02481
G2 X128.539 Y129.299 I1.672 J-6.664 E.1318
G1 X129.489 Y129.131 E.05424
; WIPE_START
G1 X129.219 Y129.439 E-.15541
G1 X129.044 Y129.881 E-.18092
G1 X129.044 Y130.996 E-.42367
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.713 Y133.122 Z.72 F30000
G1 X119.706 Y133.703 Z.72
G1 Z.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.408673
G1 F1200
M204 S500
G1 X120.118 Y134.147 E.02683
G1 X120.683 Y134.589 E.03182
G2 X122.777 Y135.248 I2.233 J-3.438 E.09851
G1 X125.922 Y135.249 E.1394
; WIPE_START
G1 X123.922 Y135.248 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X129.366 Y129.899 Z.72 F30000
G1 X129.567 Y129.702 Z.72
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.499993
G1 F1200
M204 S500
G1 X129.475 Y129.882 E.01136
G1 X129.475 Y134.994 E.28749
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
G2 X127.967 Y134.995 I-.732 J25.71 E.08479
G1 X127.016 Y135.051 E.05362
G1 X126.213 Y135.196 E.04583
; LINE_WIDTH: 0.454333
G1 X125.922 Y135.249 E.01491
; LINE_WIDTH: 0.448113
G1 X126.055 Y135.173 E.00759
; LINE_WIDTH: 0.474053
G1 X126.129 Y134.971 E.01136
; LINE_WIDTH: 0.499993
G1 X126.203 Y134.769 E.01209
G2 X126.274 Y133.702 I-16.195 J-1.624 E.06015
G1 X126.275 Y129.882 E.21484
G1 X126.173 Y129.691 E.01217
G1 X125.712 Y129.248 E.03593
; LINE_WIDTH: 0.535263
G2 X124.782 Y128.458 I-4.928 J4.852 E.07436
; LINE_WIDTH: 0.496573
G1 X124.55 Y128.279 E.01635
; LINE_WIDTH: 0.471193
G1 X124.318 Y128.099 E.01538
; LINE_WIDTH: 0.445813
G1 X123.866 Y127.732 E.02862
; LINE_WIDTH: 0.407263
G3 X127.281 Y115.484 I4.019 J-5.48 E.7259
; LINE_WIDTH: 0.417933
G3 X128.39 Y115.475 I.613 J7.592 E.05054
; LINE_WIDTH: 0.410913
G3 X134.658 Y121.857 I-.516 J6.775 E.43566
; LINE_WIDTH: 0.410833
G3 X132.022 Y127.629 I-6.83 J.369 E.29435
; LINE_WIDTH: 0.419973
G1 X131.557 Y127.976 E.02657
; LINE_WIDTH: 0.464663
G1 X131.249 Y128.237 E.02082
; LINE_WIDTH: 0.509353
G1 X130.942 Y128.497 E.02317
; LINE_WIDTH: 0.535193
G2 X130.05 Y129.236 I3.099 J4.646 E.07054
; LINE_WIDTH: 0.499993
G1 X129.61 Y129.66 E.03437
; WIPE_START
G1 X129.475 Y129.882 E-.09858
G1 X129.475 Y131.622 E-.66142
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X133.351 Y125.047 Z.72 F30000
G1 X134.166 Y123.664 Z.72
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.407243
G1 F1200
M204 S500
G1 X134.072 Y124.052 E.0176
G3 X131.829 Y127.35 I-6.197 J-1.802 E.17901
; LINE_WIDTH: 0.413233
G1 X131.402 Y127.655 E.02354
; LINE_WIDTH: 0.459203
G1 X131.065 Y127.883 E.02072
; LINE_WIDTH: 0.505173
G1 X130.728 Y128.111 E.02316
; LINE_WIDTH: 0.538073
G1 X130.247 Y128.428 E.03524
G1 X129.668 Y128.647 E.03792
; LINE_WIDTH: 0.499993
G3 X126.181 Y128.673 I-1.79 J-6.234 E.19853
; LINE_WIDTH: 0.528933
G1 X125.54 Y128.442 E.04089
G1 X125.03 Y128.11 E.03647
; LINE_WIDTH: 0.496573
G1 X124.557 Y127.809 E.03132
; LINE_WIDTH: 0.447833
G1 X124.087 Y127.475 E.02847
; LINE_WIDTH: 0.407713
G3 X125.068 Y116.438 I3.801 J-5.224 E.58854
G3 X127.289 Y115.823 I2.809 J5.818 E.10242
G1 X128.248 Y115.807 E.04241
; LINE_WIDTH: 0.407393
G1 X128.826 Y115.867 E.02565
; LINE_WIDTH: 0.407243
G3 X134.208 Y123.49 I-.951 J6.383 E.46042
G1 X134.18 Y123.606 E.00529
; CHANGE_LAYER
; Z_HEIGHT: 0.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1200
G1 X134.072 Y124.052 E-.17432
G1 X133.885 Y124.601 E-.22032
G1 X133.65 Y125.13 E-.21993
G1 X133.464 Y125.464 E-.14544
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/145
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
G3 Z.72 I-1.008 J-.681 P1  F30000
G1 X127.308 Y134.575 Z.72
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F2214
G1 X127.343 Y134.469 E.0023
G1 X127.342 Y129.945 E.09385
G1 X127.35 Y129.945 E.00016
G2 X128.407 Y129.953 I.58 J-7.538 E.02194
G1 X128.407 Y134.575 E.09588
G1 X127.368 Y134.575 E.02156
G1 X126.845 Y134.688 F30000
G1 F2214
G1 X126.918 Y134.469 E.00479
G1 X126.918 Y130.469 E.08297
G2 X126.916 Y129.878 I-58.715 J-.028 E.01226
G1 X126.753 Y129.451 E.00948
G2 X128.994 Y129.452 I1.123 J-7.095 E.04668
G1 X128.845 Y129.786 E.0076
G1 X128.832 Y129.953 E.00346
G1 X128.832 Y134.999 E.10468
G1 X126.742 Y134.999 E.04334
G1 X126.826 Y134.745 E.00554
; WIPE_START
G1 F3600
G1 X126.918 Y134.469 E-.11052
G1 X126.918 Y132.76 E-.64948
; WIPE_END
G1 E-.04 F1800
G1 X130.256 Y128.696 Z.84 F30000
G1 Z.44
G1 E.8 F1800
G1 F2214
G3 X129.433 Y129.524 I-66.149 J-64.933 E.02421
G1 X129.264 Y129.855 E.00771
G1 X129.256 Y129.953 E.00204
G1 X129.256 Y134.065 E.08529
G1 X129.256 Y134.177 E.00232
G1 X129.256 Y134.289 E.00232
G1 X129.256 Y134.401 E.00232
G1 X129.256 Y134.513 E.00232
G1 X129.256 Y134.625 E.00232
G1 X129.256 Y134.737 E.00232
G1 X129.256 Y134.849 E.00232
G1 X129.256 Y134.961 E.00232
M73 P37 R13
G1 X129.256 Y135.073 E.00232
G1 F2093.163
G1 X129.256 Y135.185 E.00232
G1 F1233.625
G1 X129.256 Y135.297 E.00232
G1 F600
G1 X129.256 Y135.409 E.00232
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
G1 X129.256 Y135.423 E.0003
G1 X127.256 Y135.423 E.04148
G2 X125.922 Y135.441 I-.3 J26.981 E.02767
; LINE_WIDTH: 0.413072
G1 F682.305
G1 X125.888 Y135.442 E.00065
; LINE_WIDTH: 0.411492
G1 F600
G1 X122.772 Y135.44 E.05876
; LINE_WIDTH: 0.411162
G1 F979.375
G1 X122.701 Y135.434 E.00135
; LINE_WIDTH: 0.417162
G1 F2214
G1 X122.19 Y135.381 E.00982
G3 X121.856 Y135.306 I.633 J-3.61 E.00656
; LINE_WIDTH: 0.411002
G1 X121.139 Y135.064 E.01425
; LINE_WIDTH: 0.411112
G1 X121.121 Y135.057 E.00038
; LINE_WIDTH: 0.411492
G1 X121.089 Y135.04 E.00069
; LINE_WIDTH: 0.416432
G1 X120.681 Y134.818 E.00887
; LINE_WIDTH: 0.416952
G3 X119.825 Y134.117 I2.163 J-3.519 E.02122
; LINE_WIDTH: 0.410432
G1 X120.128 Y133.905 E.00698
G1 X120.215 Y133.973 E.00207
G3 X120.745 Y134.401 I-14.649 J18.688 E.01282
; LINE_WIDTH: 0.410612
G1 X121.236 Y134.683 E.01066
; LINE_WIDTH: 0.419252
G2 X122.234 Y134.992 I1.877 J-4.295 E.02013
; LINE_WIDTH: 0.417162
G1 X122.793 Y135.056 E.01077
; LINE_WIDTH: 0.411552
G1 X124.793 Y135.056 E.03773
; LINE_WIDTH: 0.411432
G1 X124.803 Y135.056 E.00018
G1 X125.043 Y135.056 E.00453
; LINE_WIDTH: 0.411422
G1 X125.283 Y135.056 E.00453
; LINE_WIDTH: 0.411412
G1 X125.523 Y135.056 E.00453
; LINE_WIDTH: 0.411392
G1 X125.763 Y135.056 E.00453
; LINE_WIDTH: 0.411382
G1 X125.888 Y135.056 E.00235
; LINE_WIDTH: 0.411962
G1 X125.898 Y135.056 E.00019
; LINE_WIDTH: 0.413192
G1 X125.919 Y135.055 E.0004
; LINE_WIDTH: 0.414432
G1 X125.941 Y135.053 E.00041
; LINE_WIDTH: 0.415662
G1 X125.962 Y135.052 E.00041
; LINE_WIDTH: 0.416892
G1 X125.983 Y135.051 E.00041
; LINE_WIDTH: 0.417282
G1 X125.99 Y135.051 E.00013
; LINE_WIDTH: 0.422102
G1 X126.046 Y135.019 E.00126
; LINE_WIDTH: 0.429072
G1 X126.128 Y134.972 E.00185
; LINE_WIDTH: 0.436042
G1 X126.21 Y134.926 E.00188
; LINE_WIDTH: 0.443012
G1 X126.291 Y134.88 E.00192
; LINE_WIDTH: 0.449992
G1 X126.373 Y134.833 E.00195
G1 X126.494 Y134.469 E.00796
G1 X126.494 Y130.469 E.08297
G2 X126.486 Y129.854 I-21.412 J-.028 E.01276
G1 X126.32 Y129.527 E.00761
G3 X125.486 Y128.691 I158.25 J-158.669 E.02449
G2 X130.2 Y128.716 I2.392 J-6.571 E.09972
; WIPE_START
G1 F3600
G1 X129.433 Y129.524 E-.42307
G1 X129.264 Y129.855 E-.1413
G1 X129.256 Y129.953 E-.03732
G1 X129.256 Y130.369 E-.15831
; WIPE_END
G1 E-.04 F1800
G1 X126.085 Y134.469 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X126.085 Y129.953 E.08706
G1 X126.028 Y129.814 E.00288
G2 X124.304 Y128.096 I-108.563 J107.27 E.04692
; LINE_WIDTH: 0.410332
G1 X123.857 Y127.737 E.01078
; LINE_WIDTH: 0.384952
G1 X123.388 Y127.36 E.01057
; LINE_WIDTH: 0.384482
G3 X121.08 Y122.538 I4.564 J-5.148 E.09629
; LINE_WIDTH: 0.384642
G3 X121.138 Y121.32 I6.756 J-.291 E.02143
; LINE_WIDTH: 0.384532
G3 X127.885 Y115.453 I6.734 J.93 E.17117
; LINE_WIDTH: 0.385862
G3 X131.891 Y116.759 I-.028 J6.88 E.0754
; LINE_WIDTH: 0.385732
G3 X134.618 Y121.358 I-4.088 J5.533 E.09665
; LINE_WIDTH: 0.389082
G1 X134.669 Y121.865 E.00905
G1 X134.672 Y121.966 E.0018
; LINE_WIDTH: 0.385982
G1 X134.67 Y122.576 E.01075
; LINE_WIDTH: 0.385792
G3 X132.334 Y127.387 I-6.872 J-.364 E.09667
; LINE_WIDTH: 0.386892
G1 X131.859 Y127.765 E.01073
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I128.531 J130.622 E.0462
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y134.035 E.07868
G1 F2214
G1 X129.665 Y134.117 E.00158
G1 X129.665 Y134.199 E.00158
G1 X129.665 Y134.281 E.00158
G1 F1800
G1 X129.665 Y134.363 E.00158
G1 X129.665 Y134.445 E.00158
G1 X129.665 Y134.527 E.00158
G1 X129.665 Y134.609 E.00158
G1 X129.665 Y134.691 E.00158
G1 X129.665 Y134.773 E.00158
G1 X129.665 Y134.855 E.00158
G1 X129.665 Y134.937 E.00158
G1 X129.665 Y135.019 E.00158
G1 X129.665 Y135.101 E.00158
G1 X129.665 Y135.183 E.00158
G1 X129.665 Y135.265 E.00158
G1 X129.665 Y135.347 E.00158
G1 X129.665 Y135.43 E.00158
G1 F1605.103
G1 X129.665 Y135.512 E.00158
G1 F1041.985
G1 X129.665 Y135.594 E.00158
; FEATURE: Overhang wall
G1 F600
G1 X129.665 Y135.833 E.00461
G1 X122.764 Y135.831 E.13301
G1 X122.11 Y135.768 E.01267
G1 X121.456 Y135.607 E.01298
G3 X119.249 Y134.045 I1.541 J-4.516 E.05284
G1 X119.442 Y133.91 E.00455
; FEATURE: Outer wall
G1 X120.006 Y133.515 E.01326
; FEATURE: Overhang wall

G1 X120.211 Y133.372 E.00482
G1 X120.495 Y133.697 E.00833
G1 X120.938 Y134.064 E.01109
G1 X121.43 Y134.345 E.01092
G2 X122.794 Y134.666 I1.791 J-4.562 E.0271
G1 X125.675 Y134.666 E.05554
; FEATURE: Outer wall
G1 F721.713
G1 X125.7 Y134.666 E.00048
G1 F854.657
G1 X125.725 Y134.666 E.00048
G1 F998.834
G1 X125.75 Y134.666 E.00048
G1 F1154.242
G1 X125.775 Y134.667 E.00048
G1 F1320.883
G1 X125.8 Y134.667 E.00048
G1 F1498.682
G1 X125.825 Y134.667 E.00048
G1 F1687.782
G1 X125.85 Y134.667 E.00048
G1 F1800
G1 X125.875 Y134.667 E.00048
G1 X125.896 Y134.662 E.00042
G1 X125.914 Y134.653 E.00039
G1 X125.932 Y134.644 E.00039
G1 X125.95 Y134.635 E.00039
G1 X125.968 Y134.626 E.00039
G1 X125.986 Y134.617 E.00039
G1 X126.004 Y134.608 E.00039
G1 X126.022 Y134.599 E.00039
G1 F1965.194
G1 X126.04 Y134.59 E.00039
G1 F2214
G1 X126.056 Y134.557 E.00071
G1 X126.066 Y134.526 E.00063
; WIPE_START
G1 F2250
M204 S10000
G1 X126.074 Y132.526 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.208 Y126.878 Z.84 F30000
G1 X134.167 Y123.622 Z.84
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.389442
M204 S5000
G1 X134.028 Y124.153 E.00976
G3 X131.732 Y127.409 I-6.155 J-1.904 E.07203
; LINE_WIDTH: 0.410332
G1 X131.193 Y127.787 E.01237
; LINE_WIDTH: 0.419992
G3 X124.571 Y127.797 I-3.319 J-5.507 E.13408
; LINE_WIDTH: 0.412712
G1 X124.088 Y127.461 E.01113
; LINE_WIDTH: 0.384982
G1 X123.642 Y127.106 E.01001
; LINE_WIDTH: 0.384542
G3 X121.44 Y122.547 I4.306 J-4.892 E.09122
; LINE_WIDTH: 0.384642
G3 X122.198 Y119.204 I6.439 J-.296 E.06088
; LINE_WIDTH: 0.384532
G3 X124.564 Y116.724 I5.679 J3.048 E.06086
; LINE_WIDTH: 0.390862
G1 X124.823 Y116.58 E.0053
G3 X127.584 Y115.817 I3.126 J5.939 E.05151
; LINE_WIDTH: 0.390722
G1 X128.365 Y115.827 E.01394
; LINE_WIDTH: 0.389342
G3 X133.972 Y120.173 I-.514 J6.454 E.13347
; LINE_WIDTH: 0.389562
G3 X134.244 Y121.285 I-6.151 J2.089 E.02038
; LINE_WIDTH: 0.389442
G3 X134.181 Y123.564 I-6.371 J.965 E.04076
; WIPE_START
M204 S10000
G1 X134.028 Y124.153 E-.23143
G1 X133.833 Y124.697 E-.21947
G1 X133.59 Y125.222 E-.21995
G1 X133.472 Y125.425 E-.08915
; WIPE_END
G1 E-.04
G17
G3 Z.84 I-.815 J-.904 P1  F30000
G1 X128.035 Y130.327 Z.84
G1 Z.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345922
G1 F2214
G1 X127.715 Y130.327 E.00501
G1 X127.715 Y134.202 E.06067
G1 X128.035 Y134.203 E.00501
G1 X128.035 Y130.387 E.05973
; CHANGE_LAYER
; Z_HEIGHT: 0.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18740.045
G1 X128.035 Y132.387 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/145
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.84 I-1.146 J-.409 P1  F30000
G1 X127.233 Y134.632 Z.84
G1 Z.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1534
G1 X127.343 Y134.303 E.0072
G1 X127.342 Y129.945 E.0904
G1 X127.35 Y129.945 E.00016
G2 X128.407 Y129.953 I.58 J-7.538 E.02194
G1 X128.407 Y134.741 E.09932
G1 X127.197 Y134.741 E.02511
G1 X127.214 Y134.689 E.00113
G1 X126.846 Y134.521 F30000
G1 F1534
G1 X126.918 Y134.303 E.00477
G1 X126.918 Y132.303 E.04148
G2 X126.916 Y129.878 I-240.824 J-.945 E.0503
G1 X126.753 Y129.451 E.00949
G2 X128.994 Y129.452 I1.124 J-7.087 E.04669
G1 X128.845 Y129.786 E.0076
G1 X128.832 Y129.953 E.00346
G1 X128.832 Y135.165 E.10812
G1 X126.316 Y135.165 E.05218
G1 X126.712 Y134.922 E.00964
G1 X126.827 Y134.578 E.00751
; WIPE_START
G1 F3600
G1 X126.918 Y134.303 E-.11015
G1 X126.918 Y132.593 E-.64985
; WIPE_END
G1 E-.04 F1800
G1 X130.254 Y128.698 Z.96 F30000
G1 Z.56
G1 E.8 F1800
G1 F1534
G3 X129.433 Y129.524 I-55.437 J-54.224 E.02415
G1 X129.264 Y129.855 E.00771
G1 X129.256 Y129.953 E.00204
G1 X129.256 Y135.59 E.11693
G1 X126.834 Y135.589 E.05024
; LINE_WIDTH: 0.492516
G1 X126.518 Y135.568 E.00721
; LINE_WIDTH: 0.535039
G1 X126.203 Y135.546 E.00787
; LINE_WIDTH: 0.577562
G1 X125.888 Y135.525 E.00853
G1 X123.888 Y135.525 E.05396
; LINE_WIDTH: 0.577712
G1 X122.653 Y135.513 E.03332
; LINE_WIDTH: 0.582732
G1 X122.143 Y135.457 E.01397
; LINE_WIDTH: 0.584532
G3 X120.956 Y135.067 I.783 J-4.38 E.03425
; LINE_WIDTH: 0.579182
G1 X120.355 Y134.698 E.01908
; LINE_WIDTH: 0.581692
G1 X119.819 Y134.226 E.01942
G1 X120.288 Y133.928 E.01512
G1 X120.799 Y134.337 E.01779
; LINE_WIDTH: 0.579182
G1 X121.235 Y134.589 E.01361
; LINE_WIDTH: 0.584532
G2 X122.244 Y134.91 I1.825 J-3.98 E.02903
; LINE_WIDTH: 0.582732
G1 X122.797 Y134.972 E.01513
; LINE_WIDTH: 0.577692
G1 X125.888 Y134.973 E.08341
; LINE_WIDTH: 0.584732
G1 X126.004 Y134.967 E.00319
G1 X126.127 Y134.867 E.00433
; LINE_WIDTH: 0.539819
G1 X126.25 Y134.767 E.00398
; LINE_WIDTH: 0.494906
G1 X126.373 Y134.667 E.00363
; LINE_WIDTH: 0.449992
G1 X126.494 Y134.303 E.00796
G1 X126.494 Y132.303 E.04148
G2 X126.486 Y129.854 I-84.836 J-.945 E.0508
G1 X126.319 Y129.526 E.00765
G3 X125.486 Y128.691 I154.486 J-154.915 E.02445
G2 X130.197 Y128.718 I2.393 J-6.595 E.09965
; WIPE_START
G1 F3600
G1 X129.433 Y129.524 E-.42198
G1 X129.264 Y129.855 E-.14133
G1 X129.256 Y129.953 E-.03728
G1 X129.256 Y130.372 E-.15941
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.96 I.985 J.715 P1  F30000
G1 X134.172 Y123.605 Z.96
G1 Z.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389362
G1 F1534
M204 S5000
G1 X134.023 Y124.152 E.01007
G3 X131.732 Y127.409 I-6.198 J-1.925 E.07196
; LINE_WIDTH: 0.410332
G1 X131.193 Y127.787 E.01237
; LINE_WIDTH: 0.419992
G3 X124.571 Y127.797 I-3.319 J-5.507 E.13408
; LINE_WIDTH: 0.412702
G1 X124.095 Y127.467 E.01096
; LINE_WIDTH: 0.384932
G1 X123.642 Y127.106 E.01016
; LINE_WIDTH: 0.384532
G3 X121.596 Y123.691 I4.345 J-4.924 E.07096
; LINE_WIDTH: 0.384652
G3 X121.439 Y121.969 I7.071 J-1.514 E.03042
; LINE_WIDTH: 0.384532
G1 X121.439 Y121.961 E.00014
; LINE_WIDTH: 0.384542
G3 X123.213 Y117.804 I6.439 J.291 E.081
; LINE_WIDTH: 0.384672
G3 X124.082 Y117.043 I4.671 J4.457 E.0203
; LINE_WIDTH: 0.384542
G3 X127.856 Y115.809 I3.83 J5.325 E.07076
; LINE_WIDTH: 0.389292
G3 X130.588 Y116.407 I-.038 J6.712 E.05007
; LINE_WIDTH: 0.389402
G1 X131.1 Y116.674 E.01028
; LINE_WIDTH: 0.389622
G3 X132.051 Y117.345 I-3.296 J5.678 E.02074
; LINE_WIDTH: 0.389342
G3 X133.972 Y120.173 I-4.184 J4.909 E.0615
; LINE_WIDTH: 0.389642
G3 X134.243 Y121.282 I-6.169 J2.093 E.02033
; LINE_WIDTH: 0.389482
G1 X134.305 Y121.868 E.01049
; LINE_WIDTH: 0.389362
G3 X134.179 Y123.546 I-6.48 J.358 E.03
; WIPE_START
G1 F1800
M204 S10000
G1 X134.023 Y124.152 E-.23748
G1 X133.833 Y124.697 E-.21955
G1 X133.59 Y125.221 E-.2195
G1 X133.48 Y125.411 E-.08347
; WIPE_END
G1 E-.04
G17
G3 Z.96 I-.936 J-.778 P1  F30000
G1 X126.085 Y134.303 Z.96
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1534
M204 S5000
G1 X126.085 Y129.953 E.08386
G1 X126.028 Y129.814 E.00289
G2 X124.304 Y128.097 I-108.815 J107.524 E.0469
; LINE_WIDTH: 0.410322
G1 X123.864 Y127.742 E.01062
; LINE_WIDTH: 0.384892
G1 X123.388 Y127.36 E.01071
; LINE_WIDTH: 0.384522
G3 X121.615 Y124.907 I4.717 J-5.277 E.05351
; LINE_WIDTH: 0.384622
G3 X127.882 Y115.453 I6.259 J-2.656 E.2354
; LINE_WIDTH: 0.385782
G3 X130.285 Y115.889 I.027 J6.694 E.04323
; LINE_WIDTH: 0.386002
G3 X131.383 Y116.421 I-2.39 J6.32 E.02152
; LINE_WIDTH: 0.385772
G1 X131.9 Y116.766 E.01094
; LINE_WIDTH: 0.385882
G3 X132.807 Y117.565 I-3.969 J5.423 E.02131
; LINE_WIDTH: 0.385752
G3 X134.514 Y120.768 I-4.931 J4.684 E.06468
; LINE_WIDTH: 0.385952
G1 X134.615 Y121.326 E.00998
; LINE_WIDTH: 0.389362
G1 X134.668 Y121.849 E.00936
G1 X134.671 Y121.966 E.00208
; LINE_WIDTH: 0.385852
G3 X132.335 Y127.387 I-6.797 J.284 E.1075
; LINE_WIDTH: 0.386882
G1 X131.859 Y127.765 E.01073
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I129.117 J131.209 E.0462
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y134.192 E.08172
G1 X129.665 Y134.432 E.00462
G1 X129.665 Y134.672 E.00462
G1 X129.665 Y134.912 E.00462
G1 X129.665 Y135.152 E.00462
G1 X129.665 Y135.392 E.00462
G1 X129.665 Y135.632 E.00462
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
G1 X129.665 Y135.872 E.00462
G1 X129.665 Y135.969 E.00188
G1 F1500
G1 X129.665 Y135.994 E.00047
G1 F1200
G1 X122.649 Y135.986 E.13523
G1 F1500
G3 X121.513 Y135.786 I.428 J-5.76 E.02228
G1 F1200
M73 P38 R13
G1 X121.355 Y135.745 E.00316
G1 X120.715 Y135.475 E.01339
G1 X120.085 Y135.087 E.01426
G1 X119.695 Y134.774 E.00964
G1 X119.223 Y134.257 E.01349
G1 F1500
G1 X119.115 Y134.139 E.00308
G1 X119.174 Y134.098 E.00138
G1 F1200
G1 X120.347 Y133.276 E.0276
G1 X120.593 Y133.563 E.00728
G1 X121.033 Y133.927 E.01102
G1 X121.533 Y134.21 E.01107
G1 X122.165 Y134.421 E.01283
G1 X122.797 Y134.499 E.01229
G1 X124.859 Y134.5 E.03974
G1 F1500
G1 X125.138 Y134.5 E.00536
G1 F1534
G1 X125.416 Y134.5 E.00536
G1 X125.694 Y134.5 E.00536
G1 X125.895 Y134.497 E.00389
G1 X125.92 Y134.484 E.00054
G1 X125.945 Y134.472 E.00054
G1 X125.97 Y134.459 E.00054
G1 X125.995 Y134.447 E.00054
G1 X126.021 Y134.434 E.00054
G1 X126.046 Y134.422 E.00054
G1 X126.066 Y134.36 E.00125
; WIPE_START
G1 F1800
M204 S10000
G1 X126.075 Y132.36 E-.76
; WIPE_END
G1 E-.04
G1 X128.035 Y130.327 Z.96 F30000
G1 Z.56
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345922
G1 F1534
G1 X127.715 Y130.327 E.00501
G1 X127.717 Y134.369 E.06327
G1 X128.035 Y134.369 E.00497
G1 X128.035 Y130.387 E.06233
; CHANGE_LAYER
; Z_HEIGHT: 0.588
; LAYER_HEIGHT: 0.028
; WIPE_START
G1 F18740.045
G1 X128.035 Y132.387 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/145
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.96 I.626 J-1.044 P1  F30000
G1 X122.211 Y128.894 Z.96
G1 Z.588
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.268
G1 F3707
G1 X124.038 Y128.894 E.07228
G2 X123.533 Y128.423 I-1.516 J1.117 E.02749
G1 X122.828 Y127.861 E.03568
G1 X122.211 Y127.238 E.0347
G1 X122.211 Y128.697 E.05777
; WIPE_START
G1 F7411.492
G1 X122.211 Y127.238 E-.55463
G1 X122.591 Y127.622 E-.20537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.988 I.54 J-1.091 P1  F30000
G1 X119.317 Y126 Z.988
G1 Z.588
G1 E.8 F1800
G1 F3707
G1 X121.326 Y126 E.07953
G1 X120.732 Y124.685 E.05712
G1 X120.492 Y123.814 E.03575
G1 X120.377 Y123.106 E.0284
G1 X116.423 Y123.106 E.15651
G1 X116.423 Y120.212 E.11456
G1 X120.609 Y120.212 E.16567
G1 X120.89 Y119.391 E.03432
G1 X121.178 Y118.77 E.02712
G1 X121.637 Y118.002 E.03542
G1 X122.163 Y117.317 E.03417
G1 X119.317 Y117.317 E.11265
; WIPE_START
G1 F7411.492
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.988 I1.163 J.359 P1  F30000
G1 X122.211 Y114.423 Z.988
G1 Z.588
G1 E.8 F1800
G1 F3707
G1 X133.789 Y114.423 E.45823
G1 X133.789 Y117.317 E.11456
G1 X133.587 Y117.317 E.00799
G1 X133.789 Y117.562 E.01255
G1 X133.789 Y117.514 E.00187
; WIPE_START
G1 F7411.492
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12047
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.883 E-.54484
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.988 I-1.162 J.363 P1  F30000
G1 X135.141 Y120.212 Z.988
G1 Z.588
G1 E.8 F1800
G1 F3707
G1 X139.577 Y120.212 E.17557
G1 X139.577 Y123.106 E.11456
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
G1 X135.373 Y123.106 E.1664
G1 X135.256 Y123.825 E.02886
G1 X135.018 Y124.685 E.0353
G1 X134.424 Y126 E.05713
G1 X136.683 Y126 E.08943
; WIPE_START
G1 F7411.492
G1 X134.683 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.988 I-.067 J-1.215 P1  F30000
G1 X132.038 Y126.146 Z.988
G1 Z.588
G1 E.8 F1800
G1 F3707
G3 X130.848 Y127.116 I-4.182 J-3.919 E.06094
G3 X123.645 Y126.075 I-2.972 J-4.875 E.31231
G1 X123.58 Y126 E.00394
G1 X132.17 Y126 E.34003
G2 X133.511 Y123.115 I-4.296 J-3.75 E.12761
G1 X122.237 Y123.106 E.44622
G3 X122.434 Y120.543 I5.714 J-.85 E.10258
G3 X122.549 Y120.212 I5.65 J1.778 E.01391
G1 X133.201 Y120.212 E.42159
G2 X133.067 Y119.891 I-5.636 J2.167 E.01374
G2 X132.946 Y119.643 I-5.324 J2.429 E.01092
G2 X130.736 Y117.317 I-5.071 J2.606 E.12873
G1 X125.014 Y117.317 E.22648
G3 X125.374 Y117.125 I3.003 J5.187 E.01614
G1 X125.486 Y117.072 E.00491
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.092
; WIPE_START
G1 F7411.492
G1 X125.374 Y117.125 E-.04717
G1 X125.014 Y117.317 E-.15491
G1 X126.482 Y117.317 E-.55792
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/145
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.988 I-1.216 J.052 P1  F30000
G1 X127.224 Y134.566 Z.988
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X127.338 Y134.291 E.00618
G1 X127.342 Y129.945 E.09015
G1 X127.35 Y129.945 E.00016
G2 X128.407 Y129.953 I.58 J-7.54 E.02194
G1 X128.407 Y134.869 E.10198
G1 X127.099 Y134.869 E.02715
G1 X127.201 Y134.622 E.00555
G1 X126.842 Y134.435 F30000
G1 F3600
G1 X126.915 Y134.257 E.00399
G1 X126.918 Y132.175 E.04319
G2 X126.916 Y129.878 I-228.953 J-.881 E.04764
G1 X126.752 Y129.451 E.0095
G2 X128.991 Y129.453 I1.125 J-7.087 E.04664
G1 X128.845 Y129.787 E.00757
G1 X128.832 Y129.953 E.00345
G1 X128.832 Y135.294 E.11078
G1 X126.88 Y135.293 E.04049
; LINE_WIDTH: 0.484512
G1 X126.611 Y135.276 E.00603
; LINE_WIDTH: 0.519032
G1 X126.343 Y135.258 E.00648
; LINE_WIDTH: 0.553552
G1 X126.075 Y135.241 E.00694
G1 X126.274 Y135.109 E.00617
; LINE_WIDTH: 0.519032
G1 X126.473 Y134.976 E.00577
; LINE_WIDTH: 0.484512
G1 X126.672 Y134.844 E.00537
; LINE_WIDTH: 0.449992
G1 X126.819 Y134.49 E.00793
; WIPE_START
G1 X126.915 Y134.257 E-.09586
G1 X126.918 Y132.509 E-.66414
; WIPE_END
G1 E-.04 F1800
G1 X130.251 Y128.699 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
G1 F3600
G3 X129.384 Y129.579 I-1278.083 J-1258.181 E.02563
G1 X129.256 Y129.953 E.00819
G1 X129.256 Y135.718 E.11958
G1 X123.256 Y135.717 E.12445
G3 X121.101 Y135.348 I-.226 J-5.159 E.04569
G1 X120.633 Y135.112 E.01087
G1 X120.054 Y134.704 E.01468
G1 X119.612 Y134.29 E.01256
G1 X120.384 Y133.75 E.01954
G1 X120.92 Y134.187 E.01435
G1 X121.437 Y134.472 E.01225
G2 X122.8 Y134.78 I1.63 J-4.042 E.02912
G1 X125.888 Y134.781 E.06404
G1 X125.993 Y134.772 E.00218
G1 X126.349 Y134.568 E.00852
G1 X126.494 Y134.175 E.0087
G1 X126.494 Y132.175 E.04148
G2 X126.486 Y129.854 I-80.326 J-.881 E.04815
G1 X126.317 Y129.525 E.00767
G3 X125.486 Y128.691 I150.891 J-151.325 E.02441
G2 X130.195 Y128.719 I2.393 J-6.617 E.09959
; WIPE_START
G1 X129.384 Y129.579 E-.44916
G1 X129.256 Y129.953 E-.15
G1 X129.256 Y130.376 E-.16084
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.08 I.985 J.715 P1  F30000
G1 X134.174 Y123.596 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389362
M204 S5000
G3 X131.732 Y127.409 I-6.301 J-1.347 E.08225
; LINE_WIDTH: 0.410332
G1 X131.193 Y127.787 E.01238
; LINE_WIDTH: 0.419992
G3 X124.571 Y127.797 I-3.319 J-5.513 E.13407
; LINE_WIDTH: 0.412672
G1 X124.094 Y127.466 E.01097
; LINE_WIDTH: 0.384932
G1 X123.643 Y127.106 E.01014
; LINE_WIDTH: 0.384532
G3 X122.503 Y125.805 I4.839 J-5.388 E.03041
; LINE_WIDTH: 0.384642
G3 X121.492 Y123.122 I5.622 J-3.65 E.0507
; LINE_WIDTH: 0.384502
G1 X121.44 Y122.547 E.01013
; LINE_WIDTH: 0.384712
G3 X121.49 Y121.393 I6.418 J-.298 E.02029
; LINE_WIDTH: 0.384582
G3 X127.853 Y115.809 I6.386 J.859 E.16205
; LINE_WIDTH: 0.389312
G3 X133.504 Y119.118 I.02 J6.446 E.12209
; LINE_WIDTH: 0.389422
G3 X133.973 Y120.173 I-5.684 J3.155 E.02056
; LINE_WIDTH: 0.389692
G3 X134.245 Y121.291 I-6.224 J2.107 E.02051
; LINE_WIDTH: 0.389362
G3 X134.186 Y123.537 I-6.372 J.957 E.04014
; WIPE_START
M204 S10000
G1 X134.029 Y124.153 E-.24172
G1 X133.833 Y124.697 E-.2195
G1 X133.59 Y125.221 E-.21963
G1 X133.486 Y125.402 E-.07914
; WIPE_END
G1 E-.04
G1 X128.894 Y131.498 Z1.08 F30000
G1 X126.075 Y135.241 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.553552
G1 F3600
G1 X125.888 Y135.249 E.00483
; LINE_WIDTH: 0.537422
G1 X122.667 Y135.238 E.08058
; LINE_WIDTH: 0.533592
G1 X121.886 Y135.12 E.01959
; LINE_WIDTH: 0.534432
G1 X121.368 Y134.951 E.01356
; LINE_WIDTH: 0.550772
G1 X120.892 Y134.714 E.01364
G1 X120.355 Y134.343 E.01675
; WIPE_START
G1 X120.892 Y134.714 E-.24799
G1 X121.368 Y134.951 E-.20187
G1 X121.886 Y135.12 E-.20724
G1 X122.154 Y135.161 E-.10291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.08 I.296 J1.18 P1  F30000
G1 X126.085 Y134.175 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X126.085 Y129.953 E.08139
G1 X126.028 Y129.813 E.0029
G2 X124.304 Y128.097 I-106.583 J105.284 E.04689
; LINE_WIDTH: 0.410322
G1 X123.864 Y127.742 E.01063
; LINE_WIDTH: 0.384892
G1 X123.388 Y127.36 E.0107
; LINE_WIDTH: 0.384532
G3 X121.081 Y122.538 I4.568 J-5.149 E.09631
; LINE_WIDTH: 0.384692
G3 X121.412 Y120.133 I6.795 J-.289 E.04284
; LINE_WIDTH: 0.384532
G3 X122.568 Y117.997 I6.482 J2.127 E.04284
; LINE_WIDTH: 0.384652
G3 X123.412 Y117.118 I5.304 J4.25 E.02141
; LINE_WIDTH: 0.384542
G3 X125.501 Y115.877 I4.462 J5.131 E.04285
; LINE_WIDTH: 0.384652
G3 X126.677 Y115.555 I2.374 J6.372 E.02142
; LINE_WIDTH: 0.384532
G3 X127.88 Y115.453 I1.141 J6.262 E.02121
; LINE_WIDTH: 0.385782
G3 X131.891 Y116.76 I-.022 J6.879 E.07549
; LINE_WIDTH: 0.385892
G3 X132.807 Y117.564 I-3.974 J5.443 E.0215
; LINE_WIDTH: 0.385762
G3 X133.564 Y118.52 I-4.932 J4.686 E.02149
; LINE_WIDTH: 0.386082
G3 X134.139 Y119.596 I-5.634 J3.7 E.02152
; LINE_WIDTH: 0.385772
G3 X134.619 Y121.358 I-7.135 J2.891 E.03222
; LINE_WIDTH: 0.389242
G1 X134.669 Y121.858 E.00892
G1 X134.672 Y121.966 E.00193
; LINE_WIDTH: 0.385882
G3 X134.338 Y124.372 I-6.806 J.282 E.043
; LINE_WIDTH: 0.385772
G3 X132.334 Y127.387 I-6.464 J-2.123 E.06449
; LINE_WIDTH: 0.386872
G1 X131.859 Y127.765 E.01073
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I129.675 J131.767 E.0462
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y135.973 E.11604
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
G1 F2250
G1 X129.665 Y135.993 E.00039
G1 F2700
G1 X129.665 Y136.013 E.00039
G1 F3150
G1 X129.665 Y136.033 E.00039
G1 F2506.05
G1 X129.665 Y136.053 E.00039
G1 F2318.587
G1 X129.665 Y136.073 E.00039
G1 F2138.411
G1 X129.665 Y136.093 E.00039
G1 F1965.522
G1 X129.665 Y136.114 E.00039
G1 F1800
G1 X129.665 Y136.127 E.00026
G1 X122.801 Y136.126 E.13231
G3 X122.004 Y136.045 I.859 J-12.513 E.01544
G3 X119.508 Y134.775 I.961 J-4.976 E.05469
G1 X119.008 Y134.214 E.01449
G1 X119.9 Y133.589 E.02099
G1 X120.227 Y133.36 E.00771
G1 F1500
G1 X120.452 Y133.203 E.00528
G1 X120.502 Y133.261 E.00149
G1 F1800
G1 X120.684 Y133.473 E.00537
G1 X121.117 Y133.829 E.01081
G1 X121.668 Y134.129 E.0121
G1 X122.193 Y134.296 E.01062
G1 X122.801 Y134.371 E.0118
G1 X124.97 Y134.372 E.04181
G1 F2250
G1 X125.218 Y134.372 E.00479
G1 F2700
G1 X125.467 Y134.372 E.00479
G1 F3150
G1 X125.716 Y134.372 E.00479
G1 F3600
G1 X125.898 Y134.367 E.00353
G1 F3150
G1 X125.933 Y134.351 E.00074
G1 F2700
G1 X125.968 Y134.335 E.00074
G1 F2250
G1 X126.003 Y134.319 E.00074
G1 F1800
G1 X126.038 Y134.303 E.00074
G1 X126.064 Y134.231 E.00147
; WIPE_START
M204 S10000
G1 X126.074 Y132.231 E-.76
; WIPE_END
G1 E-.04
G1 X128.035 Y130.327 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.346225
G1 F3707
G1 X127.715 Y130.327 E.00502
G1 X127.715 Y134.181 E.06039
G3 X127.647 Y134.495 I-.527 J.05 E.00511
G1 X128.033 Y134.495 E.00606
G2 X128.035 Y130.387 I-414.02 J-2.214 E.06437
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18722.319
G1 X128.034 Y132.387 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/145
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.08 I-1.128 J-.457 P1  F30000
G1 X126.988 Y134.971 Z1.08
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1615
G1 X127.32 Y134.328 E.01503
G1 X127.343 Y134.073 E.00531
G1 X127.342 Y129.945 E.08562
G1 X127.35 Y129.945 E.00016
G2 X128.407 Y129.953 I.58 J-7.538 E.02194
G1 X128.407 Y134.972 E.10411
G1 X127.048 Y134.971 E.0282
G1 X126.536 Y134.836 F30000
G1 F1615
G1 X126.622 Y134.796 E.00199
G1 X126.903 Y134.253 E.01266
G1 X126.918 Y134.073 E.00376
G1 X126.918 Y132.073 E.04148
G2 X126.916 Y129.878 I-218.74 J-.83 E.04552
G1 X126.751 Y129.45 E.00951
G2 X128.994 Y129.452 I1.126 J-7.073 E.04672
G1 X128.845 Y129.786 E.0076
G1 X128.832 Y129.953 E.00346
G1 X128.832 Y135.396 E.11291
G1 X126.873 Y135.396 E.04062
G1 X126.38 Y135.412 E.01023
; LINE_WIDTH: 0.416952
G1 X125.887 Y135.428 E.00943
; LINE_WIDTH: 0.383972
G1 X123.887 Y135.428 E.03503
G3 X122.784 Y135.427 I-.539 J-12.837 E.01932
; LINE_WIDTH: 0.388352
G1 X122.184 Y135.366 E.0107
; LINE_WIDTH: 0.388832
G1 X121.691 Y135.253 E.00898
G1 X121.031 Y134.992 E.01259
; LINE_WIDTH: 0.381512
G1 X120.582 Y134.735 E.00899
; LINE_WIDTH: 0.384192
G1 X120.144 Y134.395 E.00971
G1 X120.446 Y134.184 E.00645
G1 X120.768 Y134.432 E.00712
; LINE_WIDTH: 0.381512
G1 X121.25 Y134.705 E.00965
; LINE_WIDTH: 0.388832
G2 X122.224 Y135.006 I1.706 J-3.796 E.01813
; LINE_WIDTH: 0.388352
G1 X122.802 Y135.069 E.01031
; LINE_WIDTH: 0.384002
G1 X125.888 Y135.07 E.05405
; LINE_WIDTH: 0.392832
M73 P39 R13
G1 X126.061 Y135.06 E.00311
; LINE_WIDTH: 0.421412
G1 X126.342 Y134.928 E.006
; LINE_WIDTH: 0.449992
G1 X126.481 Y134.862 E.0032
; WIPE_START
G1 F3600
G1 X126.622 Y134.796 E-.05921
G1 X126.903 Y134.253 E-.23199
G1 X126.918 Y134.073 E-.06893
G1 X126.918 Y133.02 E-.39987
; WIPE_END
G1 E-.04 F1800
G1 X130.264 Y128.691 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
G1 F1615
G3 X129.433 Y129.524 I-167.866 J-166.644 E.0244
G1 X129.264 Y129.855 E.00772
G1 X129.256 Y129.953 E.00203
G1 X129.256 Y135.82 E.12171
G1 X123.256 Y135.819 E.12445
G3 X121.055 Y135.439 I-.225 J-5.265 E.04667
G3 X119.53 Y134.348 I2.142 J-4.604 E.03913
G1 X120.438 Y133.712 E.02299
G1 X120.493 Y133.714 E.00115
G1 X120.962 Y134.093 E.0125
G1 X121.424 Y134.357 E.01103
G2 X122.803 Y134.678 I1.637 J-3.902 E.02951
G1 X125.888 Y134.679 E.06399
G1 X125.992 Y134.67 E.00218
G1 X126.32 Y134.498 E.00767
G1 X126.485 Y134.179 E.00745
G1 X126.494 Y134.073 E.00221
G1 X126.494 Y132.073 E.04148
G2 X126.486 Y129.854 I-76.524 J-.83 E.04603
G1 X126.317 Y129.524 E.00769
G3 X125.486 Y128.691 I155.001 J-155.435 E.02439
G2 X130.208 Y128.711 I2.389 J-6.524 E.09993
; WIPE_START
G1 F3600
G1 X129.433 Y129.524 E-.42658
G1 X129.264 Y129.855 E-.14136
G1 X129.256 Y129.953 E-.03726
G1 X129.256 Y130.36 E-.1548
; WIPE_END
G1 E-.04 F1800
G1 X126.028 Y134.211 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1615
M204 S5000
G1 X126.085 Y134.073 E.00288
G1 X126.085 Y130.073 E.0771
G2 X126.027 Y129.813 I-.342 J-.06 E.00526
G2 X124.304 Y128.096 I-106.426 J105.126 E.04689
; LINE_WIDTH: 0.410302
G1 X123.864 Y127.742 E.01062
; LINE_WIDTH: 0.384892
G1 X123.388 Y127.36 E.01071
; LINE_WIDTH: 0.384532
G3 X121.241 Y123.747 I4.607 J-5.181 E.07491
; LINE_WIDTH: 0.384702
G3 X121.08 Y122.539 I6.527 J-1.485 E.02142
; LINE_WIDTH: 0.384552
G3 X123.891 Y116.738 I6.847 J-.263 E.11772
; LINE_WIDTH: 0.384672
G3 X124.939 Y116.116 I3.984 J5.512 E.02141
; LINE_WIDTH: 0.384552
G3 X127.877 Y115.453 I2.975 J6.343 E.05325
; LINE_WIDTH: 0.385782
G3 X134.62 Y121.375 I.008 J6.79 E.17258
; LINE_WIDTH: 0.388812
G1 X134.67 Y121.878 E.00897
G1 X134.672 Y121.966 E.00157
; LINE_WIDTH: 0.386182
G1 X134.67 Y122.576 E.01075
; LINE_WIDTH: 0.385812
G3 X134.121 Y124.943 I-6.786 J-.325 E.043
; LINE_WIDTH: 0.385952
G3 X133.54 Y126.015 I-6.177 J-2.655 E.0215
; LINE_WIDTH: 0.385792
G3 X132.335 Y127.386 I-6.307 J-4.329 E.03222
; LINE_WIDTH: 0.386882
G1 X131.859 Y127.765 E.01073
; LINE_WIDTH: 0.412662
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I128.106 J130.197 E.04621
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y135.99 E.11637
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
G1 X129.665 Y136.028 E.00072
G1 X129.665 Y136.065 E.00072
G1 X129.665 Y136.103 E.00072
G1 X129.665 Y136.14 E.00072
G1 X129.665 Y136.178 E.00072
G1 X129.665 Y136.215 E.00072
G1 X129.665 Y136.23 E.00028
G1 X122.754 Y136.228 E.13321
G1 X122.043 Y136.159 E.01378
G3 X118.924 Y134.273 I.826 J-4.888 E.07195
G1 X120.479 Y133.184 E.0366
G1 X120.536 Y133.144 E.00134
G1 X120.546 Y133.156 E.00031
G1 X120.756 Y133.4 E.0062
G2 X122.216 Y134.196 I2.282 J-2.451 E.0324
G1 X122.804 Y134.269 E.0114
G1 X124.887 Y134.269 E.04016
G1 X125.102 Y134.269 E.00414
G1 X125.317 Y134.27 E.00414
G1 X125.531 Y134.27 E.00414
G1 X125.746 Y134.27 E.00414
G1 X125.908 Y134.261 E.00313
G1 X125.968 Y134.236 E.00126
G1 X125.973 Y134.234 E.0001
; WIPE_START
G1 F1800
M204 S10000
G1 X126.085 Y134.073 E-.07467
G1 X126.085 Y132.269 E-.68533
; WIPE_END
G1 E-.04
G1 X131.289 Y126.686 Z1.2 F30000
G1 X134.169 Y123.595 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.389362
G1 F1615
M204 S5000
G3 X131.732 Y127.409 I-6.348 J-1.371 E.08219
; LINE_WIDTH: 0.410312
G1 X131.193 Y127.786 E.01237
; LINE_WIDTH: 0.419992
G3 X124.571 Y127.796 I-3.319 J-5.507 E.13409
; LINE_WIDTH: 0.412652
G1 X124.095 Y127.466 E.01096
; LINE_WIDTH: 0.384942
G1 X123.642 Y127.106 E.01015
; LINE_WIDTH: 0.384532
G3 X121.596 Y123.691 I4.348 J-4.926 E.07096
; LINE_WIDTH: 0.384722
G3 X121.44 Y122.547 I6.243 J-1.437 E.02029
; LINE_WIDTH: 0.384552
G3 X124.578 Y116.715 I6.435 J-.297 E.12202
; LINE_WIDTH: 0.390722
G1 X124.824 Y116.579 E.005
; LINE_WIDTH: 0.390852
G3 X127.584 Y115.817 I3.129 J5.952 E.05151
; LINE_WIDTH: 0.390662
G1 X128.365 Y115.827 E.01394
; LINE_WIDTH: 0.389352
G3 X134.134 Y120.727 I-.49 J6.423 E.14383
; LINE_WIDTH: 0.389962
G3 X134.307 Y121.896 I-6.598 J1.576 E.02107
; LINE_WIDTH: 0.389362
G3 X134.182 Y123.536 I-6.487 J.327 E.02932
; WIPE_START
G1 F1800
M204 S10000
G1 X134.029 Y124.154 E-.2416
G1 X133.833 Y124.697 E-.21934
G1 X133.584 Y125.234 E-.22518
G1 X133.486 Y125.402 E-.07388
; WIPE_END
G1 E-.04
G17
G3 Z1.2 I-.816 J-.903 P1  F30000
G1 X128.035 Y130.327 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.347667
G1 F1615
G1 X127.715 Y130.327 E.00504
G1 X127.715 Y134.073 E.05895
G1 X127.678 Y134.442 E.00584
G1 X127.601 Y134.591 E.00265
G1 X128.027 Y134.592 E.00671
G2 X128.035 Y130.387 I-627.108 J-3.258 E.06618
; CHANGE_LAYER
; Z_HEIGHT: 0.856
; LAYER_HEIGHT: 0.056
; WIPE_START
G1 F18638.453
G1 X128.031 Y132.387 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/145
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.2 I.626 J-1.043 P1  F30000
G1 X122.211 Y128.894 Z1.2
G1 Z.856
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.268
G1 F3511
G1 X124.038 Y128.894 E.07228
G2 X123.533 Y128.423 I-1.516 J1.116 E.02749
G1 X122.828 Y127.861 E.03568
G1 X122.211 Y127.238 E.03471
G1 X122.211 Y128.697 E.05777
; WIPE_START
G1 F7411.492
G1 X122.211 Y127.238 E-.55463
G1 X122.591 Y127.622 E-.20537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.256 I.54 J-1.091 P1  F30000
G1 X119.317 Y126 Z1.256
G1 Z.856
G1 E.8 F1800
G1 F3511
G1 X121.326 Y126 E.07953
G1 X120.732 Y124.685 E.05713
G1 X120.491 Y123.808 E.03599
G1 X120.377 Y123.106 E.02817
G1 X116.423 Y123.106 E.15651
G1 X116.423 Y120.212 E.11456
G1 X120.609 Y120.212 E.16567
G1 X120.89 Y119.392 E.03431
G1 X121.178 Y118.77 E.02713
G1 X121.637 Y118.002 E.03541
G1 X122.163 Y117.317 E.03417
G1 X119.317 Y117.317 E.11265
; WIPE_START
G1 F7411.492
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.256 I1.163 J.359 P1  F30000
G1 X122.211 Y114.423 Z1.256
G1 Z.856
G1 E.8 F1800
G1 F3511
G1 X133.789 Y114.423 E.45823
G1 X133.789 Y117.317 E.11456
G1 X133.587 Y117.317 E.00799
G1 X133.789 Y117.562 E.01255
G1 X133.789 Y117.514 E.00187
; WIPE_START
G1 F7411.492
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12047
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.883 E-.54484
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.256 I-1.162 J.363 P1  F30000
G1 X135.141 Y120.212 Z1.256
G1 Z.856
G1 E.8 F1800
G1 F3511
G1 X139.577 Y120.212 E.17557
G1 X139.577 Y123.106 E.11456
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
G1 X135.373 Y123.106 E.1664
G1 X135.256 Y123.825 E.02883
G1 X135.014 Y124.697 E.03584
G1 X134.424 Y126 E.05661
G1 X136.683 Y126 E.08943
; WIPE_START
G1 F7411.492
G1 X134.683 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.256 I-.067 J-1.215 P1  F30000
G1 X132.038 Y126.146 Z1.256
G1 Z.856
G1 E.8 F1800
G1 F3511
G3 X124.599 Y126.917 I-4.164 J-3.906 E.32278
G3 X123.58 Y126 I3.276 J-4.667 E.05439
G1 X132.17 Y126 E.34003
G2 X133.513 Y123.106 I-4.295 J-3.75 E.12798
G1 X122.238 Y123.106 E.44627
G3 X122.421 Y120.587 I5.632 J-.857 E.10081
G3 X122.549 Y120.212 I5.58 J1.705 E.0157
G1 X133.201 Y120.212 E.42158
G2 X133.064 Y119.885 I-5.648 J2.171 E.01402
G2 X130.736 Y117.317 I-5.221 J2.395 E.13935
G1 X125.014 Y117.317 E.22648
G3 X125.486 Y117.072 I3.893 J6.916 E.02105
; CHANGE_LAYER
; Z_HEIGHT: 0.92
; LAYER_HEIGHT: 0.064
; WIPE_START
G1 F7411.492
G1 X125.014 Y117.317 E-.20205
G1 X126.482 Y117.317 E-.55795
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/145
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.256 I-1.217 J.031 P1  F30000
G1 X126.937 Y134.951 Z1.256
G1 Z.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3511
G1 X127.297 Y134.351 E.01452
G1 X127.343 Y133.989 E.00755
G1 X127.342 Y129.945 E.08389
G1 X127.35 Y129.945 E.00016
G2 X128.407 Y129.953 I.58 J-7.538 E.02194
G1 X128.407 Y135.055 E.10583
G1 X126.874 Y135.054 E.03179
G1 X126.906 Y135.002 E.00127
G1 X126.628 Y134.676 F30000
G1 F3511
G1 X126.886 Y134.245 E.01041
G1 X126.918 Y133.989 E.00535
G1 X126.918 Y131.989 E.04148
G2 X126.916 Y129.878 I-209.659 J-.788 E.04379
G1 X126.75 Y129.45 E.00951
G2 X128.994 Y129.452 I1.127 J-7.065 E.04674
G1 X128.845 Y129.786 E.0076
G1 X128.832 Y129.953 E.00346
G1 X128.832 Y135.479 E.11463
G1 X126.865 Y135.479 E.04078
; LINE_WIDTH: 0.467122
G2 X122.782 Y135.468 I-3.972 J744.177 E.08812
; LINE_WIDTH: 0.471272
G3 X121.692 Y135.297 I.142 J-4.461 E.0241
; LINE_WIDTH: 0.470692
G1 X121.085 Y135.064 E.01415
; LINE_WIDTH: 0.465842
G1 X120.58 Y134.783 E.01243
; LINE_WIDTH: 0.468002
G1 X120.138 Y134.451 E.01195
G1 X120.514 Y134.188 E.00992
G1 X120.807 Y134.407 E.00791
; LINE_WIDTH: 0.465252
G1 X121.331 Y134.696 E.01287
; LINE_WIDTH: 0.470692
G1 X121.836 Y134.876 E.01165
; LINE_WIDTH: 0.471272
G2 X122.804 Y135.028 I1.143 J-4.126 E.02139
; LINE_WIDTH: 0.467192
G1 X125.888 Y135.029 E.06656
; LINE_WIDTH: 0.476662
G1 X126.068 Y135.018 E.00398
G1 X126.583 Y134.75 E.01279
; LINE_WIDTH: 0.449992
G1 X126.597 Y134.727 E.00057
; WIPE_START
G1 F3600
G1 X126.886 Y134.245 E-.21346
G1 X126.918 Y133.989 E-.09804
G1 X126.918 Y132.809 E-.4485
; WIPE_END
G1 E-.04 F1800
G1 X130.264 Y128.691 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
G1 F3511
G3 X129.433 Y129.524 I-154.387 J-153.158 E.02439
G1 X129.264 Y129.855 E.00771
G1 X129.256 Y129.953 E.00204
G1 X129.256 Y135.904 E.12344
G1 X123.256 Y135.902 E.12445
G3 X120.564 Y135.288 I-.276 J-4.997 E.05802
G3 X119.463 Y134.395 I2.393 J-4.073 E.02952
G3 X120.552 Y133.655 I10.337 J14.056 E.02731
G1 X121.016 Y134.029 E.01236
G1 X121.604 Y134.343 E.01383
G1 X122.282 Y134.533 E.01461
G1 X122.805 Y134.595 E.01091
G1 X125.992 Y134.587 E.06612
G1 X126.297 Y134.437 E.00703
G1 X126.475 Y134.14 E.00719
G1 X126.494 Y133.989 E.00315
G1 X126.494 Y131.989 E.04148
G2 X126.486 Y129.854 I-73.407 J-.788 E.0443
G1 X126.317 Y129.524 E.00769
G3 X125.486 Y128.691 I151.499 J-151.937 E.02439
G2 X130.207 Y128.712 I2.389 J-6.525 E.09991
; WIPE_START
G1 F3600
G1 X129.433 Y129.524 E-.42632
G1 X129.264 Y129.855 E-.14132
G1 X129.256 Y129.953 E-.03729
G1 X129.256 Y130.361 E-.15506
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.32 I.985 J.715 P1  F30000
G1 X134.173 Y123.593 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389362
M204 S5000
G3 X131.732 Y127.409 I-6.304 J-1.344 E.08228
; LINE_WIDTH: 0.410332
G1 X131.193 Y127.787 E.01238
; LINE_WIDTH: 0.419992
G3 X124.571 Y127.797 I-3.319 J-5.507 E.13408
; LINE_WIDTH: 0.412682
G1 X124.095 Y127.466 E.01097
; LINE_WIDTH: 0.384942
G1 X123.643 Y127.106 E.01015
; LINE_WIDTH: 0.384542
G1 X123.224 Y126.707 E.01014
; LINE_WIDTH: 0.384662
G3 X121.955 Y124.789 I4.664 J-4.467 E.04058
; LINE_WIDTH: 0.384562
G3 X121.596 Y123.691 I5.905 J-2.534 E.0203
; LINE_WIDTH: 0.384952
G3 X121.44 Y122.547 I6.271 J-1.44 E.02031
; LINE_WIDTH: 0.384522
G3 X121.956 Y119.707 I6.688 J-.25 E.05102
; LINE_WIDTH: 0.384662
G3 X122.494 Y118.707 I5.866 J2.512 E.01995
; LINE_WIDTH: 0.384532
G3 X126.153 Y116.042 I5.38 J3.542 E.08114
; LINE_WIDTH: 0.384662
G3 X127.289 Y115.834 I1.717 J6.178 E.02029
; LINE_WIDTH: 0.384532
G1 X127.848 Y115.809 E.00981
; LINE_WIDTH: 0.389332
G3 X130.588 Y116.407 I-.03 J6.713 E.05023
; LINE_WIDTH: 0.389432
G1 X131.101 Y116.674 E.01028
; LINE_WIDTH: 0.389802
G3 X132.057 Y117.35 I-3.345 J5.749 E.02086
; LINE_WIDTH: 0.389362
G3 X134.185 Y123.535 I-4.188 J4.9 E.12196
; WIPE_START
M204 S10000
G1 X134.029 Y124.153 E-.24236
G1 X133.834 Y124.697 E-.21944
G1 X133.583 Y125.236 E-.22614
G1 X133.487 Y125.4 E-.07206
; WIPE_END
G1 E-.04
G17
G3 Z1.32 I-.924 J-.792 P1  F30000
G1 X126.014 Y134.128 Z1.32
M73 P40 R13
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.419992
M204 S5000
G2 X126.085 Y133.989 I-.154 J-.166 E.00306
G1 X126.085 Y129.953 E.07781
G1 X126.027 Y129.813 E.00291
G2 X124.304 Y128.097 I-106.769 J105.471 E.04688
; LINE_WIDTH: 0.410332
G1 X123.864 Y127.742 E.01063
; LINE_WIDTH: 0.384892
G1 X123.388 Y127.36 E.0107
; LINE_WIDTH: 0.384542
G1 X122.948 Y126.937 E.01072
; LINE_WIDTH: 0.384682
G3 X121.615 Y124.908 I4.934 J-4.692 E.04283
; LINE_WIDTH: 0.384532
G3 X121.241 Y123.746 I6.212 J-2.64 E.02144
; LINE_WIDTH: 0.384952
G3 X121.081 Y122.539 I6.474 J-1.477 E.02142
; LINE_WIDTH: 0.384512
G3 X121.636 Y119.544 I7.058 J-.239 E.05385
; LINE_WIDTH: 0.384662
G3 X122.208 Y118.49 I6.153 J2.657 E.02108
; LINE_WIDTH: 0.384542
G3 X126.082 Y115.69 I5.665 J3.759 E.08567
; LINE_WIDTH: 0.384652
G3 X127.281 Y115.475 I1.779 J6.469 E.02141
; LINE_WIDTH: 0.384532
G1 X127.874 Y115.453 E.01041
; LINE_WIDTH: 0.385782
G3 X130.285 Y115.888 I.035 J6.696 E.04337
; LINE_WIDTH: 0.386192
G3 X131.383 Y116.422 I-2.373 J6.284 E.02154
; LINE_WIDTH: 0.385772
G1 X131.906 Y116.771 E.01108
; LINE_WIDTH: 0.385972
G3 X132.807 Y117.564 I-3.926 J5.364 E.02116
; LINE_WIDTH: 0.385752
G3 X133.564 Y118.52 I-4.932 J4.686 E.02149
; LINE_WIDTH: 0.386202
G3 X134.139 Y119.596 I-5.614 J3.69 E.02152
; LINE_WIDTH: 0.385782
G3 X134.619 Y121.358 I-7.09 J2.879 E.03222
; LINE_WIDTH: 0.389222
G1 X134.669 Y121.86 E.00896
G1 X134.672 Y121.966 E.00189
; LINE_WIDTH: 0.385922
G1 X134.67 Y122.576 E.01075
; LINE_WIDTH: 0.385792
G3 X134.121 Y124.943 I-6.798 J-.328 E.04299
; LINE_WIDTH: 0.385972
G3 X133.54 Y126.015 I-6.167 J-2.649 E.02151
; LINE_WIDTH: 0.385782
G1 X133.18 Y126.508 E.01074
; LINE_WIDTH: 0.385962
G3 X132.335 Y127.386 I-5.239 J-4.193 E.0215
; LINE_WIDTH: 0.386882
G1 X131.859 Y127.765 E.01073
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I129.136 J131.228 E.0462
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.012 E.11679
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
G1 F2250
G1 X129.665 Y136.071 E.00114
G1 F2700
G1 X129.665 Y136.13 E.00114
G1 F3150
G1 X129.665 Y136.189 E.00114
G1 F3511
G1 X129.665 Y136.248 E.00114
G1 F3150
G1 X129.665 Y136.307 E.00114
G1 F2700
G1 X122.769 Y136.308 E.13292
G1 F3150
G3 X121.962 Y136.226 I.784 J-11.656 E.01564
G1 X121.409 Y136.092 E.01097
G3 X119.298 Y134.817 I1.552 J-4.956 E.048
G1 F2700
G1 X118.862 Y134.316 E.0128
G1 F3150
G1 X119.134 Y134.126 E.00639
G1 F3511
G1 X119.406 Y133.935 E.00639
G1 F3150
G1 X119.677 Y133.745 E.00639
G1 F2700
G1 X119.949 Y133.555 E.00639
G1 F2250
G1 X120.22 Y133.365 E.00639
G1 F1800
G1 X120.509 Y133.163 E.00679
G1 F2250
G1 X120.525 Y133.151 E.0004
G1 F2700
G1 X120.542 Y133.139 E.0004
G1 F3150
G1 X120.559 Y133.128 E.0004
G1 F3511
G1 X120.576 Y133.116 E.0004
G1 F3150
G1 X120.593 Y133.104 E.0004
G1 F2700
G1 X120.604 Y133.096 E.00026
G1 X120.814 Y133.341 E.00623
G1 X121.215 Y133.671 E.01
G1 X121.651 Y133.91 E.00959
G1 F3150
G2 X121.809 Y133.979 I.256 J-.372 E.00333
G1 F2700
G1 X122.235 Y134.115 E.00863
G1 X122.806 Y134.186 E.01108
G1 X124.824 Y134.186 E.0389
G1 F3150
G1 X125.026 Y134.186 E.00388
G1 F3511
G1 X125.227 Y134.186 E.00388
G1 F3150
G1 X125.429 Y134.186 E.00388
G1 F2700
G1 X125.63 Y134.186 E.00388
G1 F2250
G1 X125.832 Y134.186 E.00388
G1 F1800
G2 X125.965 Y134.163 I.028 J-.225 E.00265
; WIPE_START
M204 S10000
G1 X126.085 Y133.989 E-.08013
G1 X126.085 Y132.2 E-.67987
; WIPE_END
G1 E-.04
G1 X128.035 Y130.327 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.350134
G1 F3511
G1 X127.715 Y130.327 E.00508
G1 X127.715 Y133.989 E.05809
G1 X127.653 Y134.494 E.00806
G1 X127.55 Y134.667 E.00319
G1 X128.019 Y134.667 E.00745
G2 X128.035 Y133.989 I-41.397 J-1.306 E.01075
G1 X128.035 Y130.387 E.05713
; CHANGE_LAYER
; Z_HEIGHT: 1.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18496.729
G1 X128.035 Y132.387 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/145
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.32 I-1.111 J-.497 P1  F30000
G1 X126.903 Y134.918 Z1.32
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1633
G1 X127.274 Y134.365 E.01381
G1 X127.343 Y133.922 E.00929
G1 X127.342 Y129.945 E.08249
G1 X127.35 Y129.945 E.00016
G2 X128.407 Y129.953 I.58 J-7.538 E.02194
G1 X128.407 Y135.122 E.10723
G1 X126.639 Y135.122 E.03669
G1 X126.825 Y135.035 E.00427
G1 X126.87 Y134.968 E.00167
G1 X126.604 Y134.633 F30000
G1 F1633
G1 X126.87 Y134.236 E.00992
G1 X126.918 Y133.922 E.00658
G1 X126.918 Y131.922 E.04148
G2 X126.916 Y129.878 I-202.97 J-.755 E.04239
G1 X126.75 Y129.45 E.00952
G2 X128.995 Y129.452 I1.128 J-7.057 E.04675
G1 X128.845 Y129.786 E.0076
G1 X128.832 Y129.953 E.00346
G1 X128.832 Y135.547 E.11603
G1 X126.857 Y135.546 E.04096
; LINE_WIDTH: 0.492227
G1 X126.372 Y135.525 E.01107
; LINE_WIDTH: 0.534462
G1 X125.887 Y135.504 E.01207
G1 X123.888 Y135.503 E.04974
G3 X122.781 Y135.502 I-.537 J-12.505 E.02754
; LINE_WIDTH: 0.538372
G3 X121.665 Y135.324 I.121 J-4.354 E.02839
; LINE_WIDTH: 0.538102
G1 X121.088 Y135.101 E.0155
; LINE_WIDTH: 0.535112
G1 X120.635 Y134.863 E.01276
G1 X120.134 Y134.494 E.01549
; LINE_WIDTH: 0.533322
G1 X120.573 Y134.186 E.0133
; LINE_WIDTH: 0.535072
G1 X120.904 Y134.431 E.01026
G1 X121.497 Y134.728 E.0165
; LINE_WIDTH: 0.538372
G1 X122.232 Y134.932 E.01913
G1 X122.806 Y134.994 E.01445
; LINE_WIDTH: 0.534522
G1 X125.888 Y134.995 E.07667
; LINE_WIDTH: 0.544512
G1 X126.074 Y134.984 E.00473
G1 X126.313 Y134.847 E.00698
; LINE_WIDTH: 0.497252
G1 X126.552 Y134.71 E.00635
; LINE_WIDTH: 0.449992
G1 X126.57 Y134.683 E.00068
; WIPE_START
G1 F3600
G1 X126.87 Y134.236 E-.20445
G1 X126.918 Y133.922 E-.12063
G1 X126.918 Y132.777 E-.43493
; WIPE_END
G1 E-.04 F1800
G1 X130.27 Y128.687 Z1.44 F30000
G1 Z1.04
M73 P40 R12
G1 E.8 F1800
G1 F1633
G1 X129.433 Y129.524 E.02455
G1 X129.264 Y129.855 E.00771
G1 X129.256 Y135.971 E.12686
G1 X123.256 Y135.969 E.12445
G3 X121.508 Y135.765 I-.223 J-5.674 E.03666
G3 X119.931 Y134.937 I1.779 J-5.3 E.03709
G1 X119.406 Y134.435 E.01508
G3 X120.609 Y133.616 I12.09 J16.475 E.03019
G1 X121.125 Y134.02 E.01358
G1 X121.641 Y134.285 E.01204
G1 X122.291 Y134.467 E.01401
G1 X122.806 Y134.528 E.01076
G1 X125.992 Y134.519 E.06609
G1 X126.279 Y134.386 E.00655
G1 X126.465 Y134.107 E.00697
G1 X126.494 Y133.922 E.00387
G1 X126.494 Y131.922 E.04148
G2 X126.486 Y129.853 I-70.857 J-.755 E.04291
G1 X126.317 Y129.524 E.00769
G3 X125.486 Y128.691 I154.848 J-155.275 E.02439
G2 X130.214 Y128.707 I2.386 J-6.512 E.10007
; WIPE_START
G1 F3600
G1 X129.433 Y129.524 E-.42926
G1 X129.264 Y129.855 E-.14133
G1 X129.263 Y130.353 E-.18942
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.44 I.985 J.715 P1  F30000
G1 X134.176 Y123.583 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389342
G1 F1633
M204 S5000
G1 X134.174 Y123.595 E.00023
G3 X133.834 Y124.697 I-6.301 J-1.345 E.02053
; LINE_WIDTH: 0.389472
G3 X133.3 Y125.722 I-6.065 J-2.502 E.02058
; LINE_WIDTH: 0.389352
G3 X131.732 Y127.409 I-5.431 J-3.478 E.04117
; LINE_WIDTH: 0.411942
G1 X131.174 Y127.798 E.01284
; LINE_WIDTH: 0.419992
G3 X124.571 Y127.797 I-3.3 J-5.521 E.13365
; LINE_WIDTH: 0.412692
G1 X124.095 Y127.466 E.01097
; LINE_WIDTH: 0.384942
G1 X123.642 Y127.106 E.01016
; LINE_WIDTH: 0.384542
G1 X123.224 Y126.707 E.01013
; LINE_WIDTH: 0.384682
G3 X121.954 Y124.789 I4.666 J-4.468 E.04059
; LINE_WIDTH: 0.384542
G3 X121.596 Y123.691 I5.908 J-2.534 E.02029
; LINE_WIDTH: 0.384732
G3 X121.44 Y122.547 I6.239 J-1.436 E.02029
; LINE_WIDTH: 0.384562
G3 X121.593 Y120.824 I7.236 J-.226 E.03041
; LINE_WIDTH: 0.384672
G3 X122.494 Y118.708 I6.299 J1.433 E.04059
; LINE_WIDTH: 0.384522
G3 X126.153 Y116.042 I5.38 J3.542 E.08114
; LINE_WIDTH: 0.384692
G3 X127.29 Y115.834 I1.716 J6.172 E.0203
; LINE_WIDTH: 0.384532
G1 X127.845 Y115.809 E.00976
; LINE_WIDTH: 0.389332
G3 X132.044 Y117.339 I.032 J6.438 E.08112
; LINE_WIDTH: 0.389872
G3 X132.854 Y118.163 I-4.321 J5.061 E.02059
; LINE_WIDTH: 0.389342
G3 X134.27 Y123.022 I-4.98 J4.087 E.09247
G1 X134.186 Y123.523 E.00904
; WIPE_START
G1 F1800
M204 S10000
G1 X134.174 Y123.595 E-.02761
G1 X134.029 Y124.153 E-.21925
G1 X133.834 Y124.697 E-.21937
G1 X133.581 Y125.238 E-.22706
G1 X133.493 Y125.39 E-.06672
; WIPE_END
G1 E-.04
G17
G3 Z1.44 I-.922 J-.794 P1  F30000
G1 X126.015 Y134.073 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1633
M204 S5000
G1 X126.085 Y133.922 E.0032
G1 X126.085 Y129.953 E.07651
G1 X126.027 Y129.813 E.00291
G2 X124.304 Y128.097 I-106.648 J105.348 E.04688
; LINE_WIDTH: 0.410342
G1 X123.864 Y127.742 E.01063
; LINE_WIDTH: 0.384892
G1 X123.388 Y127.36 E.01071
; LINE_WIDTH: 0.384552
G1 X122.948 Y126.937 E.01071
; LINE_WIDTH: 0.384712
G3 X121.615 Y124.908 I4.928 J-4.688 E.04284
; LINE_WIDTH: 0.384532
G3 X121.241 Y123.747 I6.219 J-2.642 E.02142
; LINE_WIDTH: 0.384712
G3 X121.08 Y122.539 I6.522 J-1.484 E.02142
; LINE_WIDTH: 0.384552
G3 X121.249 Y120.72 I7.633 J-.211 E.03211
; LINE_WIDTH: 0.384732
G3 X122.208 Y118.49 I6.625 J1.529 E.04284
; LINE_WIDTH: 0.384532
G3 X126.081 Y115.69 I5.665 J3.758 E.08567
; LINE_WIDTH: 0.384672
G3 X127.281 Y115.475 I1.777 J6.454 E.02142
; LINE_WIDTH: 0.384532
G1 X127.871 Y115.453 E.01036
; LINE_WIDTH: 0.385782
G3 X134.512 Y120.757 I-.005 J6.815 E.16153
; LINE_WIDTH: 0.386332
G1 X134.615 Y121.326 E.01019
; LINE_WIDTH: 0.389402
G1 X134.668 Y121.848 E.00933
G1 X134.671 Y121.966 E.00211
; LINE_WIDTH: 0.385792
G3 X132.335 Y127.386 I-6.798 J.283 E.10748
; LINE_WIDTH: 0.386892
G1 X131.859 Y127.766 E.01074
; LINE_WIDTH: 0.414262
G1 X131.404 Y128.136 E.01114
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I156.782 J158.842 E.04577
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.038 E.11729
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
G1 X129.665 Y136.123 E.00164
G1 X129.665 Y136.208 E.00164
G1 X129.665 Y136.293 E.00164
G1 X129.665 Y136.379 E.00164
G1 X122.75 Y136.379 E.13328
G1 X122.178 Y136.323 E.01109
G3 X121.934 Y136.288 I.011 J-.952 E.00477
G3 X120.988 Y136.014 I.695 J-4.163 E.01902
G1 X120.874 Y135.973 E.00233
G1 X120.196 Y135.625 E.0147
G1 X119.692 Y135.272 E.01187
G1 X119.249 Y134.878 E.01142
G1 X119.087 Y134.691 E.00477
G1 X118.8 Y134.359 E.00845
G1 X119.062 Y134.176 E.00617
G1 X119.406 Y133.935 E.0081
G1 X119.75 Y133.694 E.0081
G1 X120.094 Y133.453 E.0081
G1 X120.478 Y133.185 E.00903
G1 X120.517 Y133.157 E.00093
G1 X120.557 Y133.129 E.00093
G1 X120.596 Y133.101 E.00093
G1 X120.636 Y133.074 E.00093
G1 X120.659 Y133.058 E.00055
G2 X120.969 Y133.38 I1.023 J-.673 E.00867
G2 X121.64 Y133.829 I1.504 J-1.522 E.01566
G1 X121.767 Y133.896 E.00277
G1 X122.25 Y134.049 E.00976
G1 X122.807 Y134.118 E.01082
G1 X124.811 Y134.119 E.03863
G1 X125.026 Y134.119 E.00415
G1 X125.242 Y134.119 E.00415
G1 X125.457 Y134.119 E.00415
G1 X125.672 Y134.119 E.00415
G2 X125.96 Y134.098 I.108 J-.492 E.00564
; WIPE_START
G1 F1800
M204 S10000
G1 X126.085 Y133.922 E-.08185
G1 X126.085 Y132.137 E-.67815
; WIPE_END
G1 E-.04
G1 X128.035 Y130.327 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.353084
G1 F1633
G1 X127.715 Y130.327 E.00512
G1 X127.715 Y133.922 E.05754
G1 X127.655 Y134.457 E.00862
G1 X127.499 Y134.726 E.00496
G1 X128.011 Y134.726 E.00819
G2 X128.035 Y133.922 I-35.307 J-1.463 E.01287
G1 X128.035 Y130.387 E.05658
; CHANGE_LAYER
; Z_HEIGHT: 1.124
; LAYER_HEIGHT: 0.084
; WIPE_START
G1 F18330.011
G1 X128.035 Y132.387 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/145
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.44 I.626 J-1.044 P1  F30000
G1 X122.211 Y128.894 Z1.44
G1 Z1.124
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.268
G1 F3502
G1 X124.038 Y128.894 E.07228
G2 X123.605 Y128.472 I-1.348 J.949 E.02406
G1 X122.828 Y127.861 E.03912
G1 X122.211 Y127.238 E.03471
G1 X122.211 Y128.697 E.05777
; WIPE_START
G1 F7411.492
G1 X122.211 Y127.238 E-.55464
G1 X122.591 Y127.622 E-.20536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.524 I.54 J-1.091 P1  F30000
G1 X119.317 Y126 Z1.524
G1 Z1.124
G1 E.8 F1800
G1 F3502
G1 X121.326 Y126 E.07953
G1 X120.732 Y124.685 E.05712
G1 X120.489 Y123.803 E.03622
G1 X120.377 Y123.106 E.02794
G1 X116.423 Y123.106 E.15651
G1 X116.423 Y120.212 E.11456
G1 X120.609 Y120.212 E.16567
G1 X120.89 Y119.392 E.03431
G1 X121.178 Y118.77 E.02713
G1 X121.637 Y118.002 E.0354
G1 X122.163 Y117.317 E.03418
G1 X119.317 Y117.317 E.11265
; WIPE_START
G1 F7411.492
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.524 I1.163 J.359 P1  F30000
G1 X122.211 Y114.423 Z1.524
G1 Z1.124
G1 E.8 F1800
G1 F3502
G1 X133.789 Y114.423 E.45823
G1 X133.789 Y117.317 E.11456
G1 X133.587 Y117.317 E.00799
G1 X133.789 Y117.562 E.01255
G1 X133.789 Y117.514 E.00187
; WIPE_START
G1 F7411.492
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12046
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.883 E-.54485
; WIPE_END
M73 P41 R12
G1 E-.04 F1800
G17
G3 Z1.524 I-1.162 J.363 P1  F30000
G1 X135.141 Y120.212 Z1.524
G1 Z1.124
G1 E.8 F1800
G1 F3502
G1 X139.577 Y120.212 E.17557
G1 X139.577 Y123.106 E.11456
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
G1 X135.373 Y123.106 E.1664
G1 X135.256 Y123.824 E.0288
G1 X135.018 Y124.685 E.03535
G1 X134.424 Y126 E.05714
G1 X136.683 Y126 E.08943
; WIPE_START
G1 F7411.492
G1 X134.683 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.524 I-.067 J-1.215 P1  F30000
G1 X132.038 Y126.146 Z1.524
G1 Z1.124
G1 E.8 F1800
G1 F3502
G3 X127.053 Y127.893 I-4.165 J-3.901 E.21739
G3 X123.58 Y126 I.823 J-5.643 E.15985
G1 X132.17 Y126 E.34001
G2 X133.355 Y123.827 I-4.374 J-3.794 E.09874
G2 X133.512 Y123.106 I-5.549 J-1.587 E.02922
G1 X122.238 Y123.106 E.44626
G3 X122.549 Y120.212 I5.644 J-.856 E.11651
G1 X133.201 Y120.212 E.42159
G2 X130.736 Y117.317 I-5.326 J2.039 E.15339
G1 X125.014 Y117.317 E.2265
G3 X125.485 Y117.072 I4.044 J7.211 E.02103
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.036
; WIPE_START
G1 F7411.492
G1 X125.014 Y117.317 E-.20185
G1 X126.483 Y117.317 E-.55816
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/145
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.524 I-1.217 J.027 P1  F30000
G1 X126.879 Y134.888 Z1.524
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3502
G1 X127.252 Y134.373 E.0132
G1 X127.343 Y133.868 E.01064
G1 X127.343 Y131.868 E.04148
G2 X127.342 Y129.945 I-1975.82 J-.684 E.03989
G1 X127.35 Y129.945 E.00016
G2 X128.407 Y129.953 I.58 J-7.537 E.02194
G1 X128.407 Y135.176 E.10834
G1 X126.419 Y135.175 E.04123
G1 X126.791 Y135.009 E.00845
G1 X126.843 Y134.937 E.00184
G1 X126.586 Y134.596 F30000
G1 F3502
G1 X126.854 Y134.226 E.00949
G1 X126.918 Y133.868 E.00753
G1 X126.918 Y131.868 E.04148
G2 X126.916 Y129.878 I-197.646 J-.728 E.04128
G1 X126.749 Y129.45 E.00953
G2 X128.989 Y129.453 I1.13 J-7.063 E.04664
G1 X128.845 Y129.788 E.00755
G1 X128.832 Y129.953 E.00343
G1 X128.832 Y135.6 E.11714
G1 X126.849 Y135.6 E.04112
; LINE_WIDTH: 0.496066
G1 X126.529 Y135.577 E.00739
; LINE_WIDTH: 0.542139
G1 X126.208 Y135.554 E.00812
; LINE_WIDTH: 0.588212
G1 X125.887 Y135.53 E.00884
G1 X122.709 Y135.523 E.0874
; LINE_WIDTH: 0.595472
G3 X121.656 Y135.351 I.194 J-4.497 E.02981
; LINE_WIDTH: 0.595572
G1 X121.186 Y135.177 E.01395
G1 X120.601 Y134.87 E.01842
; LINE_WIDTH: 0.589752
G1 X120.135 Y134.527 E.01593
G1 X120.622 Y134.186 E.01638
G1 X121.048 Y134.483 E.01431
; LINE_WIDTH: 0.588862
G1 X121.695 Y134.774 E.01954
; LINE_WIDTH: 0.595472
G2 X122.807 Y134.967 I1.421 J-4.876 E.03149
; LINE_WIDTH: 0.588252
G1 X125.888 Y134.968 E.08472
; LINE_WIDTH: 0.598672
G1 X126.079 Y134.957 E.00536
G1 X126.228 Y134.863 E.00495
; LINE_WIDTH: 0.549112
G1 X126.378 Y134.77 E.00452
; LINE_WIDTH: 0.499552
G1 X126.528 Y134.676 E.00409
; LINE_WIDTH: 0.449992
G1 X126.551 Y134.645 E.0008
; WIPE_START
G1 F3600
G1 X126.854 Y134.226 E-.19668
G1 X126.918 Y133.868 E-.13803
G1 X126.918 Y132.749 E-.42529
; WIPE_END
G1 E-.04 F1800
G1 X130.263 Y128.691 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
G1 F3502
G2 X129.38 Y129.585 I71.405 J71.492 E.02607
G1 X129.256 Y129.953 E.00805
G1 X129.256 Y136.025 E.12595
G1 X123.256 Y136.023 E.12445
G3 X120.964 Y135.622 I-.222 J-5.471 E.04863
G3 X120.005 Y135.062 I1.922 J-4.395 E.02309
G1 X119.359 Y134.468 E.01821
G3 X120.651 Y133.581 I18.074 J24.952 E.03252
G1 X121.255 Y134.034 E.01566
G1 X121.947 Y134.335 E.01565
G1 X122.808 Y134.474 E.01809
G1 X125.992 Y134.466 E.06606
G1 X126.264 Y134.344 E.00618
G1 X126.457 Y134.079 E.00679
G1 X126.494 Y133.868 E.00443
G1 X126.494 Y131.868 E.04148
G2 X126.486 Y129.853 I-68.875 J-.728 E.0418
G1 X126.317 Y129.524 E.00768
G3 X125.486 Y128.691 I154.123 J-154.55 E.02439
G2 X130.207 Y128.712 I2.389 J-6.526 E.09991
; WIPE_START
G1 F3600
G1 X129.38 Y129.585 E-.45707
G1 X129.256 Y129.953 E-.14741
G1 X129.256 Y130.362 E-.15551
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.56 I.986 J.714 P1  F30000
G1 X134.18 Y123.563 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389392
M204 S5000
G1 X134.175 Y123.592 E.00051
G3 X131.732 Y127.409 I-6.307 J-1.346 E.08234
; LINE_WIDTH: 0.412152
G1 X131.172 Y127.8 E.01289
; LINE_WIDTH: 0.419992
G3 X124.571 Y127.796 I-3.298 J-5.534 E.13358
; LINE_WIDTH: 0.412662
G1 X124.095 Y127.466 E.01096
; LINE_WIDTH: 0.384942
G1 X123.642 Y127.106 E.01016
; LINE_WIDTH: 0.384542
G3 X121.596 Y123.691 I4.348 J-4.925 E.07095
; LINE_WIDTH: 0.384862
G3 X121.44 Y122.547 I6.217 J-1.433 E.0203
; LINE_WIDTH: 0.384512
G3 X121.958 Y119.703 I6.686 J-.251 E.05111
; LINE_WIDTH: 0.384842
G3 X122.494 Y118.707 I5.907 J2.539 E.01988
; LINE_WIDTH: 0.384532
G3 X126.153 Y116.042 I5.381 J3.543 E.08113
; LINE_WIDTH: 0.384702
G3 X127.29 Y115.834 I1.733 J6.269 E.0203
; LINE_WIDTH: 0.384522
G1 X127.843 Y115.809 E.00971
; LINE_WIDTH: 0.389352
G3 X130.588 Y116.407 I-.025 J6.715 E.05032
; LINE_WIDTH: 0.389462
G3 X131.587 Y116.986 I-2.765 J5.928 E.02056
; LINE_WIDTH: 0.389342
G3 X132.468 Y117.733 I-3.643 J5.183 E.02056
; LINE_WIDTH: 0.389932
G3 X133.2 Y118.625 I-4.784 J4.675 E.02058
; LINE_WIDTH: 0.389292
G1 X133.504 Y119.118 E.01029
; LINE_WIDTH: 0.389452
G3 X133.972 Y120.173 I-5.715 J3.167 E.02055
; LINE_WIDTH: 0.389352
G1 X134.134 Y120.728 E.01027
; LINE_WIDTH: 0.389662
G3 X134.308 Y121.909 I-6.527 J1.567 E.02127
; LINE_WIDTH: 0.389212
G1 X134.313 Y122.457 E.00975
; LINE_WIDTH: 0.389392
G3 X134.27 Y123.022 I-6.445 J-.211 E.01007
G1 X134.19 Y123.504 E.00869
; WIPE_START
M204 S10000
G1 X134.175 Y123.592 E-.03379
G1 X134.029 Y124.153 E-.22052
G1 X133.834 Y124.697 E-.21933
G1 X133.58 Y125.241 E-.22817
G1 X133.503 Y125.373 E-.0582
; WIPE_END
G1 E-.04
G17
G3 Z1.56 I-.92 J-.797 P1  F30000
G1 X126.01 Y134.023 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.419992
M204 S5000
G1 X126.085 Y133.868 E.00331
G1 X126.085 Y129.953 E.07548
G1 X126.027 Y129.813 E.00291
G2 X124.304 Y128.097 I-106.577 J105.278 E.04689
; LINE_WIDTH: 0.410312
G1 X123.864 Y127.742 E.01062
; LINE_WIDTH: 0.384892
G1 X123.388 Y127.36 E.01071
; LINE_WIDTH: 0.384532
G3 X121.242 Y123.747 I4.607 J-5.181 E.0749
; LINE_WIDTH: 0.384842
G3 X121.081 Y122.539 I6.453 J-1.474 E.02142
; LINE_WIDTH: 0.384502
G3 X121.639 Y119.539 I7.054 J-.24 E.05396
; LINE_WIDTH: 0.384872
G3 X122.208 Y118.49 I6.126 J2.648 E.02099
; LINE_WIDTH: 0.384542
G3 X126.082 Y115.69 I5.667 J3.76 E.08567
; LINE_WIDTH: 0.384742
G3 X127.281 Y115.475 I1.793 J6.557 E.02141
; LINE_WIDTH: 0.384522
G1 X127.869 Y115.453 E.01032
; LINE_WIDTH: 0.385782
G3 X130.285 Y115.888 I.04 J6.697 E.04347
; LINE_WIDTH: 0.386292
G3 X131.382 Y116.421 I-2.363 J6.263 E.02153
; LINE_WIDTH: 0.385772
G1 X131.891 Y116.759 E.01075
; LINE_WIDTH: 0.386022
G3 X132.807 Y117.565 I-3.935 J5.4 E.02152
; LINE_WIDTH: 0.385772
G3 X133.564 Y118.52 I-5.04 J4.77 E.02146
; LINE_WIDTH: 0.386302
G3 X134.139 Y119.596 I-5.597 J3.681 E.02154
; LINE_WIDTH: 0.385772
G1 X134.351 Y120.168 E.01074
; LINE_WIDTH: 0.385872
G3 X134.618 Y121.358 I-6.285 J2.031 E.0215
; LINE_WIDTH: 0.388592
G1 X134.67 Y121.891 E.00949
G1 X134.672 Y121.967 E.00135
; LINE_WIDTH: 0.386352
G1 X134.67 Y122.577 E.01075
; LINE_WIDTH: 0.385952
G1 X134.613 Y123.184 E.01075
; LINE_WIDTH: 0.385742
G3 X134.121 Y124.943 I-7.544 J-1.16 E.03222
; LINE_WIDTH: 0.386042
G3 X133.54 Y126.015 I-6.14 J-2.634 E.02151
; LINE_WIDTH: 0.385762
G3 X132.335 Y127.386 I-6.307 J-4.33 E.03221
; LINE_WIDTH: 0.386902
G1 X131.859 Y127.766 E.01075
; LINE_WIDTH: 0.414462
G1 X131.402 Y128.138 E.0112
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I161.75 J163.806 E.04572
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.07 E.11792
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
G1 F2250
G1 X129.665 Y136.187 E.00226
G1 F2700
G1 X129.665 Y136.305 E.00226
G1 F3150
G1 X129.665 Y136.422 E.00226
G1 F3502
G1 X122.781 Y136.43 E.13268
G1 F3150
G1 X122.504 Y136.408 E.00536
G1 F2700
G1 X122.432 Y136.401 E.0014
G1 F3150
G3 X119.745 Y135.373 I.371 J-5 E.05625
G1 X119.438 Y135.117 E.0077
G1 F1800
G3 X119.152 Y134.834 I.862 J-1.159 E.00779
G1 F3150
G1 X118.756 Y134.39 E.01146
G1 X119.095 Y134.153 E.00796
G1 F2700
G1 X119.528 Y133.85 E.0102
G1 F2250
G1 X119.961 Y133.546 E.0102
G1 F1800
G1 X120.461 Y133.196 E.01175
G1 F2250
G1 X120.527 Y133.15 E.00156
G1 F2700
G1 X120.593 Y133.104 E.00156
G1 F3150
G1 X120.66 Y133.057 E.00156
G1 F3502
G1 X120.703 Y133.027 E.00103
G1 X120.904 Y133.259 E.00592
G1 X121.426 Y133.663 E.01271
G1 X122.027 Y133.933 E.0127
G1 X122.809 Y134.065 E.01528
G1 X124.834 Y134.065 E.03905
G1 F3150
G1 X125.098 Y134.065 E.00508
G1 F2700
G1 X125.361 Y134.065 E.00508
G1 F2250
G1 X125.624 Y134.065 E.00508
G1 F1800
G1 X125.888 Y134.065 E.00508
G1 X125.954 Y134.043 E.00134
; WIPE_START
M204 S10000
G1 X126.085 Y133.868 E-.08292
G1 X126.085 Y132.086 E-.67708
; WIPE_END
G1 E-.04
G1 X128.035 Y130.327 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345922
G1 F3502
G1 X127.715 Y130.327 E.00501
G1 X127.715 Y133.868 E.05544
; LINE_WIDTH: 0.360502
G1 X127.674 Y134.182 E.00518
; LINE_WIDTH: 0.398503
G1 X127.634 Y134.496 E.00577
G1 X127.453 Y134.772 E.00601
G1 X128.003 Y134.772 E.01004
G1 X128.026 Y134.245 E.00961
; LINE_WIDTH: 0.34682
G1 X128.035 Y130.387 E.06056
; CHANGE_LAYER
; Z_HEIGHT: 1.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18687.665
G1 X128.03 Y132.387 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/145
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.56 I-1.1 J-.52 P1  F30000
G1 X126.862 Y134.862 Z1.56
G1 Z1.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1713
G1 X127.234 Y134.378 E.01267
G2 X127.343 Y133.827 I-1.346 J-.551 E.01172
G1 X127.343 Y131.827 E.04148
G2 X127.341 Y129.943 I-415.61 J-.666 E.03907
G2 X128.407 Y129.953 I.677 J-14.468 E.02211
G1 X128.407 Y135.218 E.10919
G2 X126.135 Y135.239 I-.791 J37.549 E.04714
G1 X126.765 Y134.987 E.01408
G1 X126.825 Y134.909 E.00203
G1 X126.573 Y134.566 F30000
G1 F1713
G1 X126.842 Y134.217 E.00913
G1 X126.918 Y133.827 E.00825
G1 X126.918 Y130.337 E.07239
G1 X126.885 Y129.693 E.01337
G1 X126.761 Y129.452 E.00563
G2 X128.957 Y129.461 I1.129 J-7.047 E.04574
G1 X128.832 Y129.953 E.01052
G1 X128.832 Y135.642 E.11801
G1 X122.788 Y135.641 E.12535
G3 X121.131 Y135.278 I.208 J-4.917 E.03537
G1 X120.437 Y134.892 E.01647
G1 X119.985 Y134.547 E.01179
G1 X120.659 Y134.075 E.01705
G1 X121.191 Y134.434 E.01333
G1 X121.747 Y134.671 E.01251
G2 X122.808 Y134.856 I1.248 J-4.01 E.02241
G1 X125.888 Y134.857 E.06387
G1 X126.066 Y134.842 E.00371
G1 X126.51 Y134.649 E.01004
G1 X126.537 Y134.613 E.00092
; WIPE_START
G1 F3600
G1 X126.842 Y134.217 E-.19002
G1 X126.918 Y133.827 E-.15118
G1 X126.918 Y132.724 E-.41881
; WIPE_END
G1 E-.04 F1800
G1 X130.278 Y128.68 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
G1 F1713
G2 X129.344 Y129.637 I14.786 J15.345 E.02775
G1 X129.256 Y129.953 E.00679
G1 X129.256 Y136.066 E.12681
G1 X123.256 Y136.065 E.12445
G3 X120.483 Y135.429 I-.279 J-5.148 E.05978
G3 X119.324 Y134.492 I2.642 J-4.45 E.03103
G1 X120.675 Y133.546 E.0342
G1 X121.358 Y134.044 E.01753
G1 X121.913 Y134.28 E.01251
G2 X122.809 Y134.432 I1.104 J-3.801 E.01889
G1 X125.888 Y134.433 E.06386
G1 X126.254 Y134.31 E.00801
G1 X126.449 Y134.056 E.00665
G1 X126.494 Y133.827 E.00486
G1 X126.494 Y131.827 E.04148
G2 X126.475 Y129.8 I-27.829 J-.745 E.04205
G1 X126.317 Y129.524 E.0066
G1 X125.472 Y128.679 E.02479
G2 X130.221 Y128.701 I2.404 J-6.352 E.10065
; WIPE_START
G1 F3600
G1 X129.344 Y129.637 E-.48772
G1 X129.256 Y129.953 E-.12441
G1 X129.256 Y130.342 E-.14787
; WIPE_END
G1 E-.04 F1800
G1 X122.403 Y133.703 Z1.68 F30000
G1 X120.652 Y134.562 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.391032
G1 F1713
G1 X121.038 Y134.795 E.00805
; LINE_WIDTH: 0.384132
G1 X121.594 Y135.03 E.01057
; LINE_WIDTH: 0.392332
G1 X122.197 Y135.186 E.01117
G1 X122.715 Y135.242 E.00934
; LINE_WIDTH: 0.385662
G1 X125.888 Y135.249 E.05583
; LINE_WIDTH: 0.407192
G1 X126.135 Y135.239 E.00462
; WIPE_START
G1 F3600
G1 X125.888 Y135.249 E-.09421
G1 X124.135 Y135.245 E-.66579
; WIPE_END
G1 E-.04 F1800
G1 X126.007 Y133.984 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1713
M204 S5000
G1 X126.085 Y133.827 E.00338
G1 X126.085 Y129.953 E.07467
G1 X126.027 Y129.813 E.00291
G1 X124.613 Y128.399 E.03855
G2 X124.105 Y127.915 I-9.716 J9.696 E.01353
; LINE_WIDTH: 0.389972
G1 X123.626 Y127.565 E.01056
; LINE_WIDTH: 0.389362
G3 X122.365 Y126.243 I4.863 J-5.901 E.03257
; LINE_WIDTH: 0.389542
G3 X121.501 Y124.633 I6.232 J-4.381 E.03257
; LINE_WIDTH: 0.389352
G1 X121.313 Y124.052 E.01085
; LINE_WIDTH: 0.389462
G1 X121.177 Y123.448 E.01101
; LINE_WIDTH: 0.389752
G3 X121.07 Y122.25 I6.779 J-1.207 E.02145
; LINE_WIDTH: 0.389402
G3 X123.639 Y116.924 I6.807 J.001 E.10874
; LINE_WIDTH: 0.390002
G3 X124.657 Y116.254 I4.284 J5.398 E.02175
; LINE_WIDTH: 0.389472
G3 X125.78 Y115.775 I3.232 J6.028 E.02173
; LINE_WIDTH: 0.389352
G3 X127.578 Y115.452 I2.244 J7.311 E.03255
; LINE_WIDTH: 0.390782
G1 X128.395 Y115.466 E.01458
G3 X132.28 Y117.064 I-.574 J6.917 E.07619
; LINE_WIDTH: 0.391212
G3 X133.136 Y117.934 I-4.447 J5.226 E.02183
; LINE_WIDTH: 0.390832
G3 X134.668 Y121.863 I-5.393 J4.367 E.07649
; LINE_WIDTH: 0.390822
G1 X134.675 Y122.164 E.00537
; LINE_WIDTH: 0.384642
G3 X134.453 Y123.976 I-7.575 J-.011 E.03211
; LINE_WIDTH: 0.384512
G3 X134.038 Y125.123 I-6.516 J-1.707 E.02142
; LINE_WIDTH: 0.384702
G3 X133.427 Y126.177 I-6.054 J-2.806 E.02142
; LINE_WIDTH: 0.384542
G3 X132.182 Y127.513 I-6.176 J-4.51 E.03211
; LINE_WIDTH: 0.387372
G1 X131.697 Y127.88 E.01074
; LINE_WIDTH: 0.419992
G1 X131.303 Y128.233 E.01021
G1 X129.723 Y129.813 E.04307
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.131 E.11909
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
G1 X129.665 Y136.31 E.00344
G1 X129.665 Y136.476 E.0032
G1 X123.665 Y136.474 E.11565
G3 X121.925 Y136.385 I-.411 J-8.944 E.03363
G3 X119.267 Y135.027 I1.035 J-5.307 E.05829
G1 X118.722 Y134.414 E.01581
G1 X119.096 Y134.152 E.00881
G1 X119.728 Y133.709 E.01487
G1 X120.455 Y133.201 E.01709
G1 X120.549 Y133.134 E.00222
G1 X120.644 Y133.068 E.00222
G1 X120.738 Y133.002 E.00222
G1 X120.742 Y133.004 E.00008
G1 X120.952 Y133.24 E.00608
G1 X121.518 Y133.668 E.01368
G1 X122.112 Y133.916 E.0124
G1 X122.81 Y134.023 E.01361
G1 X125.152 Y134.023 E.04514
G1 X125.52 Y134.024 E.0071
G1 X125.888 Y134.024 E.0071
G1 X125.95 Y134.003 E.00126
; WIPE_START
G1 F1800
M204 S10000
G1 X126.085 Y133.827 E-.0844
M73 P42 R12
G1 X126.085 Y132.049 E-.6756
; WIPE_END
G1 E-.04
G1 X131.341 Y126.514 Z1.68 F30000
G1 X134.183 Y123.521 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.384662
G1 F1713
M204 S5000
G1 X134.112 Y123.862 E.00611
; LINE_WIDTH: 0.384532
G3 X133.724 Y124.95 I-6.216 J-1.606 E.02029
; LINE_WIDTH: 0.384712
G3 X133.148 Y125.951 I-5.806 J-2.675 E.0203
; LINE_WIDTH: 0.384542
G3 X131.973 Y127.221 I-5.864 J-4.249 E.03041
; LINE_WIDTH: 0.387102
G1 X131.511 Y127.569 E.01022
; LINE_WIDTH: 0.419992
G3 X124.41 Y127.689 I-3.64 J-5.231 E.14519
; LINE_WIDTH: 0.398352
G1 X123.94 Y127.351 E.01054
; LINE_WIDTH: 0.385942
G1 X123.499 Y126.978 E.01018
; LINE_WIDTH: 0.385772
G3 X122.116 Y125.139 I4.396 J-4.744 E.04071
; LINE_WIDTH: 0.386372
G3 X121.693 Y124.064 I5.777 J-2.897 E.0204
; LINE_WIDTH: 0.385762
G1 X121.555 Y123.503 E.01017
; LINE_WIDTH: 0.385622
G1 X121.469 Y122.931 E.01017
; LINE_WIDTH: 0.386052
G3 X121.45 Y121.776 I6.33 J-.682 E.02038
; LINE_WIDTH: 0.385762
G3 X124.73 Y116.627 I6.471 J.503 E.11187
; LINE_WIDTH: 0.386252
G1 X124.744 Y116.619 E.00029
G1 X125.247 Y116.367 E.00991
; LINE_WIDTH: 0.386362
G3 X126.34 Y115.992 I2.633 J5.897 E.0204
; LINE_WIDTH: 0.385792
G3 X128.06 Y115.811 I1.599 J6.935 E.03051
; LINE_WIDTH: 0.384542
G3 X131.809 Y117.149 I-.224 J6.554 E.07096
; LINE_WIDTH: 0.384732
G3 X132.657 Y117.933 I-3.971 J5.141 E.02029
; LINE_WIDTH: 0.384542
G3 X134.281 Y121.568 I-4.905 J4.372 E.07097
; LINE_WIDTH: 0.384662
G3 X134.236 Y123.27 I-6.421 J.68 E.02997
G1 X134.195 Y123.463 E.00345
; WIPE_START
G1 F1800
M204 S10000
G1 X134.112 Y123.862 E-.15509
G1 X133.942 Y124.415 E-.21975
G1 X133.724 Y124.95 E-.21964
G1 X133.524 Y125.337 E-.16553
; WIPE_END
G1 E-.04
G17
G3 Z1.68 I-.819 J-.9 P1  F30000
G1 X128.035 Y130.33 Z1.68
G1 Z1.28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.346698
G1 F1713
G1 X127.715 Y130.331 E.00502
G1 X127.715 Y133.827 E.05485
G1 X127.693 Y134.162 E.00527
; LINE_WIDTH: 0.379537
G1 X127.64 Y134.37 E.00372
; LINE_WIDTH: 0.419955
G1 X127.588 Y134.579 E.00415
G1 X127.413 Y134.807 E.00554
G1 X127.997 Y134.807 E.01125
; LINE_WIDTH: 0.408387
G1 X128.011 Y134.508 E.0056
; LINE_WIDTH: 0.349257
G2 X128.035 Y133.827 I-14.737 J-.861 E.01078
G1 X128.035 Y130.39 E.05436
; CHANGE_LAYER
; Z_HEIGHT: 1.392
; LAYER_HEIGHT: 0.112
; WIPE_START
G1 F18546.867
G1 X128.035 Y132.39 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/145
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.68 I.626 J-1.043 P1  F30000
G1 X122.211 Y128.894 Z1.68
G1 Z1.392
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.268
G1 F4187
G1 X124.038 Y128.894 E.07228
G2 X123.555 Y128.438 I-1.464 J1.065 E.02643
G1 X122.828 Y127.861 E.03673
G1 X122.211 Y127.238 E.03471
G1 X122.211 Y128.697 E.05777
; WIPE_START
G1 F7411.492
G1 X122.211 Y127.238 E-.55463
G1 X122.591 Y127.622 E-.20537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.792 I.54 J-1.091 P1  F30000
G1 X119.317 Y126 Z1.792
G1 Z1.392
G1 E.8 F1800
G1 F4187
G1 X121.326 Y126 E.07953
G1 X120.732 Y124.685 E.05712
G1 X120.488 Y123.797 E.03647
G1 X120.377 Y123.106 E.02769
G1 X116.423 Y123.106 E.15651
G1 X116.423 Y120.212 E.11456
G1 X120.609 Y120.212 E.16567
G1 X120.89 Y119.391 E.03432
G1 X121.178 Y118.77 E.02712
G1 X121.637 Y118.002 E.0354
G1 X122.163 Y117.317 E.03418
G1 X119.317 Y117.317 E.11265
; WIPE_START
G1 F7411.492
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.792 I1.163 J.359 P1  F30000
G1 X122.211 Y114.423 Z1.792
G1 Z1.392
G1 E.8 F1800
G1 F4187
G1 X133.789 Y114.423 E.45823
G1 X133.789 Y117.317 E.11456
G1 X133.587 Y117.317 E.00799
G1 X133.789 Y117.562 E.01255
G1 X133.789 Y117.514 E.00187
; WIPE_START
G1 F7411.492
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12046
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.883 E-.54485
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.792 I-1.162 J.363 P1  F30000
G1 X135.141 Y120.212 Z1.792
G1 Z1.392
G1 E.8 F1800
G1 F4187
G1 X139.577 Y120.212 E.17557
G1 X139.577 Y123.106 E.11456
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
G1 X135.373 Y123.106 E.1664
G1 X135.257 Y123.821 E.02866
G1 X135.018 Y124.685 E.0355
G1 X134.424 Y126 E.05712
G1 X136.683 Y126 E.08943
; WIPE_START
G1 F7411.492
G1 X134.683 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.792 I-.067 J-1.215 P1  F30000
G1 X132.038 Y126.146 Z1.792
G1 Z1.392
G1 E.8 F1800
G1 F4187
G3 X127.169 Y127.908 I-4.17 J-3.915 E.21271
G1 X127.012 Y127.887 E.00624
G3 X123.58 Y126 I.865 J-5.64 E.15826
G1 X132.17 Y126 E.34003
G2 X132.859 Y125.021 I-4.294 J-3.75 E.04746
G2 X133.512 Y123.106 I-5.037 J-2.788 E.08051
G1 X122.237 Y123.106 E.44627
G3 X122.549 Y120.212 I5.639 J-.856 E.11651
G1 X133.201 Y120.212 E.42158
G2 X132.853 Y119.468 I-5.312 J2.033 E.03253
G1 X132.771 Y119.326 E.00647
G2 X130.907 Y117.42 I-4.894 J2.921 E.10651
G1 X130.736 Y117.317 E.00788
G1 X125.014 Y117.317 E.2265
G3 X125.485 Y117.072 I4.049 J7.219 E.02103
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.00800002
; WIPE_START
G1 F7411.492
G1 X125.014 Y117.317 E-.20186
G1 X126.483 Y117.317 E-.55814
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/145
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.792 I-1.217 J.025 P1  F30000
G1 X126.847 Y134.844 Z1.792
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X127.22 Y134.38 E.01235
G2 X127.343 Y133.796 I-1.332 J-.584 E.01247
G1 X127.343 Y131.796 E.04148
G3 X127.347 Y129.953 I112.451 J-.651 E.03823
G1 X127.348 Y129.948 E.00009
G2 X128.407 Y129.953 I.578 J-12.01 E.02197
G1 X128.407 Y135.248 E.10985
G1 X126.838 Y135.248 E.03256
; LINE_WIDTH: 0.469252
G1 X126.141 Y135.238 E.01511
G1 X126.747 Y134.97 E.01437
; LINE_WIDTH: 0.449992
G1 X126.81 Y134.891 E.00209
; WIPE_START
G1 X127.22 Y134.38 E-.24914
G1 X127.321 Y134.047 E-.13212
G1 X127.343 Y133.796 E-.09588
G1 X127.343 Y133.051 E-.28286
; WIPE_END
G1 E-.04 F1800
G1 X128.984 Y129.453 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X128.902 Y129.578 E.00309
G1 X128.832 Y129.953 E.00791
G1 X128.832 Y135.673 E.11865
G1 X122.832 Y135.671 E.12445
G3 X122.104 Y135.602 I.532 J-9.379 E.01517
G1 X121.449 Y135.429 E.01403
G1 X120.859 Y135.178 E.01332
G3 X119.959 Y134.565 I2.346 J-4.413 E.02262
G1 X120.685 Y134.057 E.01838
G1 X121.206 Y134.408 E.01303
G1 X121.755 Y134.641 E.01237
G2 X122.809 Y134.826 I1.236 J-3.962 E.02225
G1 X125.888 Y134.826 E.06386
G1 X126.066 Y134.811 E.00371
G1 X126.496 Y134.628 E.00971
G1 X126.832 Y134.21 E.01112
G1 X126.918 Y133.796 E.00877
G1 X126.918 Y129.953 E.07972
G1 X126.793 Y129.461 E.01052
G2 X128.924 Y129.462 I1.067 J-7.522 E.04436
; WIPE_START
G1 X128.902 Y129.578 E-.04492
G1 X128.832 Y129.953 E-.14486
G1 X128.832 Y131.453 E-.57022
; WIPE_END
G1 E-.04 F1800
G1 X130.278 Y128.679 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
G1 F3600
G1 X129.572 Y129.385 E.02072
G1 X129.297 Y129.732 E.00918
G1 X129.256 Y129.953 E.00465
G1 X129.256 Y136.097 E.12745
G1 X123.256 Y136.096 E.12445
G3 X120.535 Y135.493 I-.273 J-5.213 E.05852
G3 X119.299 Y134.51 I2.543 J-4.465 E.03289
G1 X120.701 Y133.528 E.0355
G1 X121.373 Y134.017 E.01724
G1 X122.04 Y134.288 E.01494
G1 X122.81 Y134.401 E.01613
G1 X125.888 Y134.402 E.06385
G1 X126.246 Y134.285 E.00781
G1 X126.443 Y134.039 E.00654
G1 X126.494 Y133.796 E.00516
G1 X126.494 Y130.09 E.07686
G1 X126.432 Y129.685 E.0085
G1 X126.317 Y129.524 E.00411
G1 X125.472 Y128.679 E.02478
G2 X129.33 Y128.963 I2.42 J-6.536 E.08131
G1 X130.221 Y128.696 E.01929
; WIPE_START
G1 X129.572 Y129.385 E-.35975
G1 X129.297 Y129.732 E-.16818
G1 X129.256 Y129.953 E-.08523
G1 X129.256 Y130.339 E-.14684
; WIPE_END
G1 E-.04 F1800
G1 X122.413 Y133.721 Z1.8 F30000
G1 X120.678 Y134.578 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.447972
G1 F3600
G1 X121.041 Y134.796 E.00873
; LINE_WIDTH: 0.447352
G1 X121.589 Y135.03 E.01229
; LINE_WIDTH: 0.453532
G1 X122.199 Y135.186 E.01317
G1 X122.714 Y135.242 E.01082
; LINE_WIDTH: 0.447262
G1 X125.888 Y135.249 E.06541
; LINE_WIDTH: 0.469252
G1 X126.141 Y135.238 E.00549
; WIPE_START
G1 X125.888 Y135.249 E-.09625
G1 X124.141 Y135.245 E-.66375
; WIPE_END
G1 E-.04 F1800
G1 X126.004 Y133.955 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X126.085 Y133.796 E.00344
G1 X126.085 Y129.953 E.07406
G1 X126.027 Y129.813 E.00292
G1 X124.613 Y128.399 E.03855
G2 X124.024 Y127.859 I-4.767 J4.602 E.01541
; LINE_WIDTH: 0.386402
G1 X123.538 Y127.49 E.01075
; LINE_WIDTH: 0.385772
G3 X121.971 Y125.627 I4.331 J-5.235 E.0431
; LINE_WIDTH: 0.392542
G1 X121.731 Y125.17 E.00926
; LINE_WIDTH: 0.392942
G3 X121.313 Y124.052 I6.34 J-3.005 E.02145
; LINE_WIDTH: 0.389732
G3 X121.097 Y122.852 I6.641 J-1.817 E.02173
; LINE_WIDTH: 0.389382
G1 X121.07 Y122.277 E.01023
; LINE_WIDTH: 0.390662
G1 X121.117 Y121.463 E.01454
G1 X121.215 Y120.858 E.01093
; LINE_WIDTH: 0.390832
G3 X121.839 Y119.109 I7.426 J1.664 E.03324
; LINE_WIDTH: 0.391252
G3 X122.497 Y118.081 I6.091 J3.175 E.02184
; LINE_WIDTH: 0.390832
G3 X123.8 Y116.801 I5.989 J4.79 E.03268
; LINE_WIDTH: 0.391272
G3 X124.839 Y116.161 I4.106 J5.501 E.02184
; LINE_WIDTH: 0.390842
G3 X132.3 Y117.082 I3.031 J6.13 E.14208
; LINE_WIDTH: 0.391252
G3 X133.136 Y117.935 I-4.454 J5.197 E.02136
; LINE_WIDTH: 0.392912
G3 X133.822 Y118.943 I-5.565 J4.527 E.02192
; LINE_WIDTH: 0.389362
G3 X134.606 Y121.249 I-5.946 J3.306 E.04354
; LINE_WIDTH: 0.389552
G1 X134.669 Y121.864 E.011
G1 X134.676 Y122.463 E.01064
; LINE_WIDTH: 0.389442
G3 X134.168 Y124.838 I-6.804 J-.214 E.04342
; LINE_WIDTH: 0.389552
G3 X133.605 Y125.92 I-6.386 J-2.636 E.02173
; LINE_WIDTH: 0.389372
G3 X132.028 Y127.638 I-5.703 J-3.652 E.04167
; LINE_WIDTH: 0.398352
G1 X131.567 Y127.985 E.01051
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I130.86 J133.797 E.05006
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.257 E.12151
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
G1 F2250
G1 X129.665 Y136.506 E.00481
G1 X123.665 Y136.505 E.11565
G3 X121.917 Y136.414 I-.411 J-8.927 E.0338
G3 X120.339 Y135.831 I.955 J-5.015 E.03257
G1 F1800
G3 X120.039 Y135.659 I.668 J-1.508 E.00667
G1 F2250
G3 X119.246 Y135.049 I2.167 J-3.64 E.01934
G1 X118.697 Y134.432 E.01592
G1 X119.254 Y134.041 E.01311
G1 F1800
G1 X120.482 Y133.182 E.02889
G1 F2250
G1 X120.628 Y133.079 E.00345
G1 F2700
G1 X120.765 Y132.984 E.00321
G1 X120.983 Y133.229 E.00633
G1 F2250
G1 X121.533 Y133.641 E.01324
G1 X122.12 Y133.886 E.01227
G1 X122.81 Y133.992 E.01346
G1 X125.296 Y133.993 E.04791
G1 F1800
G1 X125.888 Y133.993 E.01141
G1 X125.947 Y133.973 E.0012
; WIPE_START
M204 S10000
G1 X126.085 Y133.796 E-.08545
G1 X126.085 Y132.021 E-.67455
; WIPE_END
G1 E-.04
G1 X131.342 Y126.487 Z1.8 F30000
G1 X134.193 Y123.486 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.385802
M204 S5000
G3 X131.823 Y127.341 I-6.369 J-1.259 E.08138
; LINE_WIDTH: 0.392632
G1 X131.387 Y127.653 E.0096
; LINE_WIDTH: 0.419992
G3 X128.685 Y128.658 I-3.528 J-5.348 E.05607
G3 X124.308 Y127.614 I-.83 J-6.216 E.08872
; LINE_WIDTH: 0.389472
G1 X123.855 Y127.283 E.00997
; LINE_WIDTH: 0.389372
G3 X122.343 Y125.549 I4.021 J-5.033 E.04112
; LINE_WIDTH: 0.392542
G1 X122.064 Y125.016 E.01079
; LINE_WIDTH: 0.392942
G3 X121.667 Y123.969 I6.574 J-3.087 E.02012
; LINE_WIDTH: 0.389732
G3 X121.46 Y122.832 I6.391 J-1.752 E.02059
; LINE_WIDTH: 0.389382
G1 X121.433 Y122.292 E.00961
; LINE_WIDTH: 0.388652
G1 X121.451 Y121.776 E.00916
; LINE_WIDTH: 0.384402
G3 X121.638 Y120.637 I6.28 J.445 E.02027
; LINE_WIDTH: 0.384522
G3 X122.292 Y119.035 I6.971 J1.912 E.03042
; LINE_WIDTH: 0.384742
G3 X122.956 Y118.09 I5.644 J3.258 E.0203
; LINE_WIDTH: 0.384522
G3 X123.777 Y117.279 I4.92 J4.161 E.02028
; LINE_WIDTH: 0.384762
G3 X124.73 Y116.627 I4.129 J5.017 E.02029
; LINE_WIDTH: 0.384562
G1 X124.745 Y116.619 E.00029
; LINE_WIDTH: 0.384542
G1 X125.248 Y116.368 E.00986
; LINE_WIDTH: 0.384742
G3 X126.34 Y115.993 I2.613 J5.836 E.0203
; LINE_WIDTH: 0.384542
G3 X131.809 Y117.149 I1.535 J6.256 E.10143
; LINE_WIDTH: 0.384992
G3 X132.657 Y117.933 I-3.936 J5.104 E.0203
; LINE_WIDTH: 0.384542
G1 X133.025 Y118.379 E.01015
; LINE_WIDTH: 0.385822
G3 X134.229 Y121.186 I-5.356 J3.96 E.05426
; LINE_WIDTH: 0.385662
G1 X134.299 Y121.76 E.01017
; LINE_WIDTH: 0.385802
G3 X134.204 Y123.427 I-6.475 J.467 E.02947
; WIPE_START
M204 S10000
G1 X134.061 Y124.049 E-.24236
G1 X133.875 Y124.596 E-.21973
G1 X133.64 Y125.124 E-.21968
G1 X133.541 Y125.304 E-.07823
; WIPE_END
G1 E-.04
G17
G3 Z1.8 I-.896 J-.824 P1  F30000
G1 X127.874 Y131.463 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.663682
G1 F4187
G1 X127.874 Y130.551 E.02845
G1 X127.874 Y131.463 F30000
; LINE_WIDTH: 0.641187
G1 F4187
G1 X127.851 Y131.52 E.00185
; LINE_WIDTH: 0.595615
G1 X127.828 Y131.577 E.00171
; LINE_WIDTH: 0.550044
G1 X127.806 Y131.634 E.00158
; LINE_WIDTH: 0.504472
G1 X127.783 Y131.691 E.00144
; LINE_WIDTH: 0.458901
G1 X127.76 Y131.748 E.0013
; LINE_WIDTH: 0.413329
G1 X127.737 Y131.806 E.00117
; LINE_WIDTH: 0.347334
G1 X127.714 Y131.863 E.00097
G1 X127.715 Y133.796 E.03039
G1 X127.692 Y134.133 E.00531
; LINE_WIDTH: 0.382362
G1 X127.633 Y134.363 E.00414
; LINE_WIDTH: 0.429617
G1 X127.573 Y134.593 E.00469
G1 X127.381 Y134.832 E.00607
G1 X127.991 Y134.833 E.01205
; LINE_WIDTH: 0.416182
G1 X128.008 Y134.507 E.00622
; LINE_WIDTH: 0.382362
G1 X128.025 Y134.182 E.00568
; LINE_WIDTH: 0.346963
G2 X128.034 Y131.863 I-45.219 J-1.332 E.03643
; LINE_WIDTH: 0.367758
G1 X128.014 Y131.814 E.00089
; LINE_WIDTH: 0.413329
G1 X127.994 Y131.764 E.001
; LINE_WIDTH: 0.458901
G1 X127.975 Y131.715 E.00112
; LINE_WIDTH: 0.504472
G1 X127.955 Y131.666 E.00124
; LINE_WIDTH: 0.550044
G1 X127.935 Y131.617 E.00136
; LINE_WIDTH: 0.595615
G1 X127.916 Y131.568 E.00148
; LINE_WIDTH: 0.641187
G1 X127.896 Y131.518 E.00159
; CHANGE_LAYER
; Z_HEIGHT: 1.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F9749.213
G1 X127.916 Y131.568 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/145
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.8 I-1.156 J-.382 P1  F30000
M73 P43 R12
G1 X126.837 Y134.834 Z1.8
G1 Z1.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1719
G1 X127.211 Y134.381 E.01218
G2 X127.343 Y133.775 I-1.322 J-.606 E.01296
G1 X127.343 Y131.775 E.04148
G2 X127.341 Y129.943 I-407.526 J-.64 E.03801
G2 X128.407 Y129.953 I.677 J-14.452 E.02211
G1 X128.407 Y135.269 E.11026
G1 X126.834 Y135.269 E.03264
; LINE_WIDTH: 0.480402
G1 X126.489 Y135.253 E.00767
; LINE_WIDTH: 0.510812
G1 X126.144 Y135.238 E.00819
G1 X126.439 Y135.098 E.00775
; LINE_WIDTH: 0.480402
G1 X126.734 Y134.958 E.00726
; LINE_WIDTH: 0.449992
G1 X126.799 Y134.88 E.0021
G1 X126.556 Y134.531 F30000
G1 F1719
G1 X126.825 Y134.204 E.00878
G1 X126.918 Y133.775 E.00911
G1 X126.918 Y130.337 E.07132
G1 X126.885 Y129.693 E.01337
G1 X126.761 Y129.452 E.00563
G2 X128.957 Y129.461 I1.129 J-7.047 E.04574
G1 X128.832 Y129.953 E.01052
G1 X128.832 Y135.693 E.11908
G1 X122.832 Y135.692 E.12445
G3 X121.466 Y135.46 I.082 J-4.628 E.02883
G3 X119.943 Y134.577 I1.728 J-4.733 E.03672
G1 X120.697 Y134.049 E.0191
G1 X120.928 Y134.225 E.00604
G2 X122.266 Y134.751 I2.183 J-3.597 E.02997
G1 X122.809 Y134.805 E.01132
G1 X125.888 Y134.806 E.06385
G1 X126.066 Y134.79 E.00371
G1 X126.488 Y134.613 E.00949
G1 X126.517 Y134.577 E.00097
; WIPE_START
G1 F3600
G1 X126.825 Y134.204 E-.18362
G1 X126.918 Y133.775 E-.16693
G1 X126.918 Y132.698 E-.40945
; WIPE_END
G1 E-.04 F1800
G1 X130.279 Y128.678 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
G1 F1719
G2 X129.344 Y129.637 I14.823 J15.382 E.02779
G1 X129.256 Y129.953 E.00679
G1 X129.256 Y136.118 E.12788
G1 X123.256 Y136.116 E.12445
G3 X121.824 Y135.989 I-.178 J-6.134 E.02988
G3 X119.283 Y134.521 I1.048 J-4.746 E.06184
G1 X120.718 Y133.516 E.03633
G1 X121.209 Y133.899 E.01291
G1 X121.707 Y134.153 E.0116
G1 X122.31 Y134.329 E.01303
G1 X122.81 Y134.381 E.01043
G1 X125.888 Y134.381 E.06383
G1 X126.241 Y134.268 E.00769
G1 X126.439 Y134.028 E.00647
G1 X126.494 Y133.775 E.00536
G1 X126.494 Y131.775 E.04148
G2 X126.475 Y129.8 I-27.123 J-.719 E.04098
G1 X126.317 Y129.524 E.0066
G1 X125.462 Y128.669 E.02507
G2 X130.223 Y128.699 I2.42 J-6.3 E.10092
; WIPE_START
G1 F3600
G1 X129.344 Y129.637 E-.48845
G1 X129.256 Y129.953 E-.12441
G1 X129.256 Y130.34 E-.14715
; WIPE_END
G1 E-.04 F1800
G1 X122.419 Y133.733 Z1.92 F30000
G1 X120.686 Y134.593 Z1.92
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.489752
G1 F1719
G1 X121.191 Y134.874 E.01311
G1 X121.947 Y135.13 E.0181
; LINE_WIDTH: 0.482092
G1 X122.648 Y135.236 E.01583
; LINE_WIDTH: 0.488492
G1 X125.888 Y135.249 E.07329
; LINE_WIDTH: 0.510812
G1 X126.144 Y135.238 E.00609
; WIPE_START
G1 F3600
G1 X125.888 Y135.249 E-.09761
G1 X124.144 Y135.242 E-.66239
; WIPE_END
G1 E-.04 F1800
G1 X129.102 Y129.439 Z1.92 F30000
G1 X134.193 Y123.481 Z1.92
G1 Z1.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384632
G1 F1719
M204 S5000
G1 X134.112 Y123.863 E.00684
G3 X133.942 Y124.415 I-6.222 J-1.611 E.01014
; LINE_WIDTH: 0.384792
G3 X133.458 Y125.464 I-6.019 J-2.142 E.02031
; LINE_WIDTH: 0.384542
G3 X132.794 Y126.409 I-5.584 J-3.215 E.02029
; LINE_WIDTH: 0.384762
G3 X131.973 Y127.22 I-4.96 J-4.201 E.02029
; LINE_WIDTH: 0.387092
G1 X131.511 Y127.569 E.01022
; LINE_WIDTH: 0.419992
G3 X124.252 Y127.578 I-3.636 J-5.225 E.1489
; LINE_WIDTH: 0.386892
G1 X123.789 Y127.231 E.0102
; LINE_WIDTH: 0.386272
G3 X122.593 Y125.938 I4.625 J-5.477 E.03114
; LINE_WIDTH: 0.386622
G1 X122.299 Y125.478 E.00962
; LINE_WIDTH: 0.387022
G1 X122.046 Y124.995 E.00964
; LINE_WIDTH: 0.389492
G3 X121.664 Y123.958 I6.089 J-2.831 E.01967
; LINE_WIDTH: 0.392642
G3 X121.462 Y122.826 I7.335 J-1.897 E.02065
; LINE_WIDTH: 0.390852
G1 X121.436 Y122.29 E.00958
; LINE_WIDTH: 0.390682
G1 X121.477 Y121.515 E.01385
; LINE_WIDTH: 0.389642
G1 X121.593 Y120.824 E.01246
; LINE_WIDTH: 0.385122
G1 X121.745 Y120.267 E.01016
; LINE_WIDTH: 0.385852
G3 X124.082 Y117.042 I6.237 J2.06 E.07123
; LINE_WIDTH: 0.389952
G3 X125.197 Y116.391 I3.975 J5.526 E.02304
; LINE_WIDTH: 0.388722
G1 X125.734 Y116.174 E.01027
; LINE_WIDTH: 0.389372
G3 X128.06 Y115.813 I2.135 J6.081 E.04208
; LINE_WIDTH: 0.384542
G3 X131.809 Y117.149 I-.217 J6.541 E.07095
; LINE_WIDTH: 0.384722
G3 X132.657 Y117.933 I-3.901 J5.063 E.0203
; LINE_WIDTH: 0.384542
G3 X134.056 Y120.435 I-5.013 J4.446 E.05068
; LINE_WIDTH: 0.384902
G3 X134.281 Y121.568 I-6.109 J1.799 E.0203
; LINE_WIDTH: 0.384302
G1 X134.316 Y122.145 E.01014
; LINE_WIDTH: 0.384632
G3 X134.231 Y123.297 I-6.426 J.106 E.02029
G1 X134.205 Y123.422 E.00225
; WIPE_START
G1 F1800
M204 S10000
G1 X134.112 Y123.863 E-.17098
G1 X133.942 Y124.415 E-.21954
G1 X133.724 Y124.95 E-.21964
G1 X133.543 Y125.3 E-.14984
; WIPE_END
G1 E-.04
G17
G3 Z1.92 I-.917 J-.8 P1  F30000
G1 X126.003 Y133.935 Z1.92
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1719
M204 S5000
G1 X126.085 Y133.775 E.00347
G1 X126.085 Y129.953 E.07368
G1 X126.027 Y129.813 E.00291
G1 X124.613 Y128.399 E.03855
G2 X124.024 Y127.858 I-4.506 J4.317 E.01541
; LINE_WIDTH: 0.386392
G1 X123.538 Y127.49 E.01076
; LINE_WIDTH: 0.385782
G3 X122.282 Y126.12 I4.897 J-5.749 E.03281
; LINE_WIDTH: 0.386142
G1 X121.973 Y125.633 E.01016
; LINE_WIDTH: 0.386492
G3 X121.464 Y124.524 I5.832 J-3.348 E.02155
; LINE_WIDTH: 0.385782
G3 X121.133 Y123.146 I6.376 J-2.259 E.02499
; LINE_WIDTH: 0.384972
G3 X121.086 Y121.927 I6.18 J-.85 E.02146
; LINE_WIDTH: 0.383652
G1 X121.14 Y121.314 E.01078
; LINE_WIDTH: 0.389322
G1 X121.267 Y120.625 E.01244
; LINE_WIDTH: 0.389572
G3 X121.662 Y119.474 I6.694 J1.653 E.02168
; LINE_WIDTH: 0.389372
G3 X123.481 Y117.053 I6.441 J2.947 E.05425
; LINE_WIDTH: 0.389962
G3 X124.582 Y116.298 I4.284 J5.059 E.02381
; LINE_WIDTH: 0.385992
G1 X125.128 Y116.026 E.01076
; LINE_WIDTH: 0.386152
G3 X126.283 Y115.636 I2.715 J6.135 E.0215
; LINE_WIDTH: 0.385792
G3 X127.495 Y115.461 I1.519 J6.239 E.02159
; LINE_WIDTH: 0.390712
G1 X128.397 Y115.466 E.0161
; LINE_WIDTH: 0.390842
G3 X134.667 Y121.847 I-.523 J6.785 E.17424
; LINE_WIDTH: 0.390812
G1 X134.675 Y122.164 E.00567
; LINE_WIDTH: 0.384612
G3 X134.271 Y124.559 I-6.755 J.092 E.04284
; LINE_WIDTH: 0.384772
G3 X133.756 Y125.664 I-6.249 J-2.237 E.02143
; LINE_WIDTH: 0.384532
G3 X133.053 Y126.659 I-5.878 J-3.412 E.02141
; LINE_WIDTH: 0.384722
G3 X132.182 Y127.513 I-5.197 J-4.429 E.02144
; LINE_WIDTH: 0.387372
G1 X131.697 Y127.88 E.01074
; LINE_WIDTH: 0.419992
G1 X131.302 Y128.233 E.01022
G1 X129.723 Y129.813 E.04306
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.527 E.12673
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
G1 X122.747 Y136.525 E.13335
G3 X118.677 Y134.445 I.193 J-5.399 E.09096
G1 X120.563 Y133.125 E.04438
G1 X120.782 Y132.972 E.00514
G1 X120.959 Y133.176 E.00522
G1 X121.372 Y133.519 E.01035
G1 X121.828 Y133.762 E.00995
G1 X122.322 Y133.915 E.00998
G1 X122.811 Y133.971 E.00948
G1 X125.888 Y133.972 E.05931
G1 X125.945 Y133.954 E.00117
; WIPE_START
G1 F1800
M204 S10000
G1 X126.085 Y133.775 E-.08614
G1 X126.085 Y132.002 E-.67386
; WIPE_END
G1 E-.04
G1 X128.035 Y130.33 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.346758
G1 F1719
G1 X127.715 Y130.331 E.00503
G1 X127.715 Y133.775 E.05405
G1 X127.692 Y134.114 E.00533
; LINE_WIDTH: 0.384717
G1 X127.628 Y134.358 E.00443
; LINE_WIDTH: 0.436575
G1 X127.563 Y134.601 E.00507
G1 X127.359 Y134.849 E.00646
G1 X127.988 Y134.85 E.01263
; LINE_WIDTH: 0.421887
G1 X128.006 Y134.507 E.00665
; LINE_WIDTH: 0.384717
G1 X128.025 Y134.164 E.00602
; LINE_WIDTH: 0.346964
G1 X128.035 Y130.39 E.05928
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18679.243
G1 X128.03 Y132.39 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/145
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.92 I-1.092 J-.537 P1  F30000
G1 X126.833 Y134.827 Z1.92
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1740
G1 X127.205 Y134.381 E.01205
G1 X127.321 Y134.016 E.00795
G1 X127.343 Y133.764 E.00523
G1 X127.343 Y131.764 E.04148
G3 X127.347 Y129.953 I110.288 J-.635 E.03758
G1 X127.348 Y129.948 E.00009
G2 X128.407 Y129.953 I.579 J-12.006 E.02197
G1 X128.407 Y135.28 E.1105
G1 X126.832 Y135.279 E.03268
; LINE_WIDTH: 0.491192
G1 X126.489 Y135.259 E.00782
; LINE_WIDTH: 0.532392
G1 X126.146 Y135.238 E.00851
G1 X126.437 Y135.095 E.00803
; LINE_WIDTH: 0.491192
G1 X126.728 Y134.952 E.00738
; LINE_WIDTH: 0.449992
G1 X126.794 Y134.873 E.00214
; WIPE_START
G1 F3600
G1 X127.205 Y134.381 E-.24353
G1 X127.321 Y134.016 E-.1457
G1 X127.343 Y133.764 E-.09588
G1 X127.343 Y133.041 E-.27489
; WIPE_END
G1 E-.04 F1800
G1 X128.989 Y129.452 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
G1 F1740
G1 X128.892 Y129.605 E.00376
G1 X128.832 Y129.953 E.00732
G1 X128.832 Y135.704 E.1193
G1 X122.832 Y135.703 E.12445
G3 X122.097 Y135.632 I.556 J-9.639 E.01532
G1 X121.455 Y135.463 E.01377
G3 X119.938 Y134.58 I1.62 J-4.525 E.0366
G1 X120.709 Y134.04 E.01951
G1 X121.3 Y134.422 E.0146
G2 X122.81 Y134.794 I1.742 J-3.817 E.03243
G1 X125.888 Y134.795 E.06384
G1 X126.066 Y134.78 E.00371
G1 X126.483 Y134.606 E.00938
G1 X126.821 Y134.202 E.01093
G1 X126.918 Y133.764 E.00929
G1 X126.918 Y129.953 E.07907
G1 X126.793 Y129.461 E.01052
G2 X128.93 Y129.461 I1.065 J-7.388 E.04448
; WIPE_START
G1 F3600
G1 X128.892 Y129.605 E-.0567
G1 X128.832 Y129.953 E-.13411
G1 X128.832 Y131.45 E-.56919
; WIPE_END
G1 E-.04 F1800
G1 X130.286 Y128.671 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
G1 F1740
G1 X129.572 Y129.385 E.02096
G1 X129.291 Y129.748 E.00951
G1 X129.256 Y129.953 E.00431
G1 X129.256 Y136.128 E.1281
G1 X123.256 Y136.127 E.12445
G3 X120.936 Y135.722 I-.221 J-5.583 E.04921
G3 X119.941 Y135.142 I2.084 J-4.718 E.02394
G1 X119.274 Y134.527 E.01883
G1 X120.73 Y133.508 E.03688
G1 X120.861 Y133.629 E.00371
G1 X121.461 Y134.029 E.01496
G1 X122.049 Y134.258 E.01308
G1 X122.81 Y134.37 E.01597
G1 X125.888 Y134.371 E.06383
G1 X126.238 Y134.259 E.00762
G1 X126.437 Y134.022 E.00643
G1 X126.494 Y133.764 E.00546
G1 X126.494 Y130.09 E.07621
G1 X126.432 Y129.685 E.0085
G1 X126.317 Y129.524 E.00411
G1 X125.472 Y128.679 E.02478
G2 X129.33 Y128.963 I2.419 J-6.536 E.0813
G1 X130.229 Y128.688 E.0195
; WIPE_START
G1 F3600
G1 X129.572 Y129.385 E-.36408
G1 X129.291 Y129.748 E-.17424
G1 X129.256 Y129.953 E-.07891
G1 X129.256 Y130.328 E-.14277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.04 I.987 J.712 P1  F30000
G1 X134.191 Y123.482 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.390842
G1 F1740
M204 S5000
G1 X134.166 Y123.592 E.00202
G3 X131.735 Y127.404 I-6.328 J-1.356 E.08243
; LINE_WIDTH: 0.419992
G1 X131.029 Y127.887 E.0165
G3 X125.239 Y128.147 I-3.157 J-5.7 E.11576
G3 X124.308 Y127.614 I1.785 J-4.198 E.02075
; LINE_WIDTH: 0.389462
G3 X123.419 Y126.902 I3.623 J-5.428 E.02027
; LINE_WIDTH: 0.389352
G1 X123.021 Y126.484 E.01026
; LINE_WIDTH: 0.390212
G1 X122.662 Y126.032 E.01029
; LINE_WIDTH: 0.392612
G3 X122.073 Y125.043 I5.989 J-4.238 E.02066
; LINE_WIDTH: 0.392942
G3 X121.667 Y123.969 I6.999 J-3.26 E.02063
; LINE_WIDTH: 0.389782
G3 X121.46 Y122.832 I6.412 J-1.756 E.0206
; LINE_WIDTH: 0.389392
G1 X121.433 Y122.294 E.00957
; LINE_WIDTH: 0.388702
G1 X121.449 Y121.776 E.0092
; LINE_WIDTH: 0.387002
G1 X121.518 Y121.202 E.0102
; LINE_WIDTH: 0.386252
G3 X124.73 Y116.627 I6.36 J1.049 E.10192
; LINE_WIDTH: 0.388662
G3 X125.736 Y116.173 I3.19 J5.734 E.01959
; LINE_WIDTH: 0.389372
G3 X127.393 Y115.826 I2.317 J6.943 E.03018
G1 X128.249 Y115.819 E.01522
; LINE_WIDTH: 0.385792
G3 X131.468 Y116.903 I-.366 J6.409 E.06051
; LINE_WIDTH: 0.385512
G1 X131.96 Y117.268 E.01077
; LINE_WIDTH: 0.385842
G1 X132.391 Y117.654 E.01019
; LINE_WIDTH: 0.389962
G3 X133.2 Y118.626 I-4.759 J4.79 E.02255
; LINE_WIDTH: 0.389352
G3 X133.762 Y119.635 I-5.326 J3.624 E.02056
; LINE_WIDTH: 0.392912
G3 X134.131 Y120.723 I-7.101 J3.013 E.02065
; LINE_WIDTH: 0.390842
G3 X134.262 Y123.024 I-6.293 J1.513 E.04136
G1 X134.2 Y123.423 E.00719
; WIPE_START
G1 F1800
M204 S10000
G1 X134.166 Y123.592 E-.06578
G1 X134.028 Y124.147 E-.21733
G1 X133.834 Y124.691 E-.21922
G1 X133.576 Y125.243 E-.23145
G1 X133.542 Y125.302 E-.02623
; WIPE_END
G1 E-.04
G17
G3 Z2.04 I-.714 J-.986 P1  F30000
G1 X120.709 Y134.598 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.516432
G1 F1740
G1 X121.129 Y134.84 E.01163
; LINE_WIDTH: 0.507532
G1 X121.607 Y135.036 E.01215
; LINE_WIDTH: 0.516012
G2 X122.712 Y135.242 I1.283 J-3.821 E.02705
; LINE_WIDTH: 0.509922
G1 X125.888 Y135.249 E.07516
; LINE_WIDTH: 0.532392
G1 X126.146 Y135.238 E.00641
; WIPE_START
G1 F3600
G1 X125.888 Y135.249 E-.09832
G1 X124.146 Y135.245 E-.66168
; WIPE_END
G1 E-.04 F1800
G1 X126.002 Y133.925 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1740
M204 S5000
G1 X126.085 Y133.764 E.00349
G1 X126.085 Y129.953 E.07346
M73 P44 R12
G1 X126.027 Y129.813 E.00292
G1 X124.613 Y128.399 E.03855
G2 X124.025 Y127.859 I-4.765 J4.6 E.01541
; LINE_WIDTH: 0.386402
G1 X123.538 Y127.49 E.01076
; LINE_WIDTH: 0.385782
G3 X122.675 Y126.636 I4.344 J-5.249 E.0214
; LINE_WIDTH: 0.390212
G1 X122.366 Y126.243 E.00892
; LINE_WIDTH: 0.392612
G3 X121.741 Y125.194 I5.745 J-4.131 E.02192
; LINE_WIDTH: 0.392942
G3 X121.313 Y124.052 I6.475 J-3.076 E.02192
; LINE_WIDTH: 0.389782
G3 X121.097 Y122.851 I6.645 J-1.818 E.02174
; LINE_WIDTH: 0.389392
G1 X121.07 Y122.283 E.01011
; LINE_WIDTH: 0.388702
G1 X121.092 Y121.719 E.01002
; LINE_WIDTH: 0.386492
G1 X121.168 Y121.114 E.01075
; LINE_WIDTH: 0.385782
G3 X124.581 Y116.298 I6.715 J1.141 E.10747
; LINE_WIDTH: 0.386032
G1 X125.128 Y116.026 E.01076
; LINE_WIDTH: 0.386162
G3 X126.284 Y115.636 I2.713 J6.129 E.02152
; LINE_WIDTH: 0.385782
G3 X127.501 Y115.461 I1.513 J6.21 E.02167
; LINE_WIDTH: 0.389312
G1 X128.397 Y115.465 E.01594
G3 X131.284 Y116.361 I-.606 J7.055 E.05415
; LINE_WIDTH: 0.390162
G3 X132.304 Y117.084 I-3.444 J5.933 E.02231
; LINE_WIDTH: 0.389962
G3 X133.207 Y118.026 I-4.284 J5.013 E.02326
; LINE_WIDTH: 0.385772
G3 X134.137 Y119.591 I-6.078 J4.668 E.03212
; LINE_WIDTH: 0.392912
G3 X134.487 Y120.644 I-6.35 J2.697 E.01995
; LINE_WIDTH: 0.390842
G3 X134.667 Y121.847 I-6.64 J1.609 E.02173
; LINE_WIDTH: 0.390812
G1 X134.675 Y122.164 E.00567
; LINE_WIDTH: 0.384612
G3 X134.038 Y125.123 I-7.053 J.03 E.05351
; LINE_WIDTH: 0.384752
G3 X133.427 Y126.178 I-6.021 J-2.786 E.02143
; LINE_WIDTH: 0.384532
G3 X132.182 Y127.513 I-6.177 J-4.511 E.0321
; LINE_WIDTH: 0.387372
G1 X131.698 Y127.88 E.01074
; LINE_WIDTH: 0.419992
G1 X131.303 Y128.233 E.01022
G1 X129.723 Y129.813 E.04307
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.538 E.12693
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
G1 X123.665 Y136.536 E.11565
G3 X121.91 Y136.444 I-.41 J-8.967 E.03394
G3 X118.669 Y134.451 I1 J-5.258 E.07497
G1 X120.726 Y133.01 E.04842
G1 X120.793 Y132.964 E.00156
G1 X120.834 Y133.009 E.00117
G1 X121.094 Y133.293 E.00744
G1 X121.616 Y133.65 E.01218
G1 X122.129 Y133.856 E.01066
G1 X122.811 Y133.961 E.0133
G1 X125.888 Y133.962 E.0593
G1 X125.945 Y133.944 E.00115
; WIPE_START
G1 F1800
M204 S10000
G1 X126.085 Y133.764 E-.08649
G1 X126.085 Y131.992 E-.67351
; WIPE_END
G1 E-.04
G1 X128.035 Y130.331 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.346771
G1 F1740
G1 X127.715 Y130.33 E.00503
G1 X127.715 Y133.764 E.05391
G1 X127.692 Y134.104 E.00534
; LINE_WIDTH: 0.38585
G1 X127.625 Y134.355 E.00457
; LINE_WIDTH: 0.440217
G1 X127.558 Y134.606 E.00526
G1 X127.347 Y134.858 E.00667
G1 X127.986 Y134.858 E.01295
; LINE_WIDTH: 0.424845
G1 X128.005 Y134.507 E.00687
; LINE_WIDTH: 0.38585
G1 X128.025 Y134.155 E.0062
; LINE_WIDTH: 0.346983
G1 X128.035 Y130.391 E.05912
; CHANGE_LAYER
; Z_HEIGHT: 1.66
; LAYER_HEIGHT: 0.02
; WIPE_START
G1 F18678.187
G1 X128.03 Y132.391 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/145
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.04 I.627 J-1.043 P1  F30000
G1 X122.212 Y128.894 Z2.04
G1 Z1.66
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.268
G1 F4533
G1 X124.038 Y128.894 E.07228
G2 X123.533 Y128.423 I-1.516 J1.117 E.0275
G1 X122.828 Y127.861 E.03567
G1 X122.212 Y127.238 E.03468
G1 X122.212 Y128.697 E.05776
; WIPE_START
G1 F7411.492
G1 X122.212 Y127.238 E-.5545
G1 X122.592 Y127.622 E-.2055
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.06 I.54 J-1.09 P1  F30000
G1 X119.317 Y126 Z2.06
G1 Z1.66
G1 E.8 F1800
G1 F4533
G1 X121.326 Y126 E.07953
G1 X120.732 Y124.685 E.05712
G1 X120.487 Y123.791 E.03667
G1 X120.378 Y123.106 E.02748
G1 X116.423 Y123.106 E.15653
G1 X116.423 Y120.212 E.11456
G1 X120.609 Y120.212 E.16567
G1 X120.89 Y119.391 E.03432
G1 X121.178 Y118.769 E.02714
G1 X121.637 Y118.002 E.0354
G1 X122.163 Y117.317 E.03417
G1 X119.317 Y117.317 E.11265
; WIPE_START
G1 F7411.492
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.06 I1.163 J.359 P1  F30000
G1 X122.211 Y114.423 Z2.06
G1 Z1.66
G1 E.8 F1800
G1 F4533
G1 X133.789 Y114.423 E.45823
G1 X133.789 Y117.317 E.11456
G1 X133.587 Y117.317 E.00799
G1 X133.789 Y117.562 E.01255
G1 X133.789 Y117.514 E.00187
; WIPE_START
G1 F7411.492
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12047
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.883 E-.54484
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.06 I-1.162 J.363 P1  F30000
G1 X135.141 Y120.212 Z2.06
G1 Z1.66
G1 E.8 F1800
G1 F4533
G1 X139.577 Y120.212 E.17557
G1 X139.577 Y123.106 E.11456
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
G1 X135.373 Y123.106 E.1664
G1 X135.255 Y123.829 E.02899
G1 X135.018 Y124.685 E.03516
G1 X134.424 Y126 E.05713
G1 X136.683 Y126 E.08943
; WIPE_START
G1 F7411.492
G1 X134.683 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.06 I-.067 J-1.215 P1  F30000
G1 X132.038 Y126.146 Z2.06
G1 Z1.66
G1 E.8 F1800
G1 F4533
G3 X127.481 Y127.938 I-4.181 J-3.941 E.20022
G1 X127.177 Y127.909 E.0121
G3 X125.935 Y127.612 I.741 J-5.831 E.05066
G3 X123.58 Y126 I1.936 J-5.354 E.11415
G1 X132.17 Y126 E.34
G2 X133.507 Y123.142 I-4.298 J-3.752 E.12655
G1 X122.238 Y123.106 E.44605
G3 X122.486 Y120.385 I5.63 J-.858 E.1092
G3 X122.549 Y120.212 I2.946 J.974 E.00732
G1 X133.2 Y120.212 E.42157
G2 X130.736 Y117.317 I-5.322 J2.035 E.15339
G1 X125.014 Y117.317 E.22649
G3 X125.485 Y117.072 I4.052 J7.225 E.02103
; CHANGE_LAYER
; Z_HEIGHT: 1.76
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F7411.492
G1 X125.014 Y117.317 E-.20186
G1 X126.483 Y117.317 E-.55814
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/145
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.06 I-1.217 J.024 P1  F30000
G1 X126.832 Y134.826 Z2.06
G1 Z1.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X127.205 Y134.381 E.01204
G1 X127.321 Y134.015 E.00798
G1 X127.343 Y133.763 E.00523
G1 X127.343 Y131.763 E.04148
G3 X127.347 Y129.953 I110.23 J-.635 E.03756
G1 X127.348 Y129.948 E.00009
G2 X128.407 Y129.953 I.578 J-12.01 E.02197
G1 X128.407 Y135.281 E.11052
G1 X126.832 Y135.28 E.03268
; LINE_WIDTH: 0.492152
G1 X126.489 Y135.259 E.00783
; LINE_WIDTH: 0.534312
G1 X126.146 Y135.238 E.00854
G1 X126.437 Y135.095 E.00806
; LINE_WIDTH: 0.492152
G1 X126.727 Y134.952 E.00739
; LINE_WIDTH: 0.449992
G1 X126.794 Y134.872 E.00214
; WIPE_START
G1 X127.205 Y134.381 E-.24332
G1 X127.321 Y134.015 E-.14611
G1 X127.343 Y133.763 E-.09588
G1 X127.343 Y133.041 E-.27469
; WIPE_END
G1 E-.04 F1800
G1 X128.989 Y129.452 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
G1 F3600
G1 X128.892 Y129.605 E.00376
G1 X128.832 Y129.953 E.00732
G1 X128.832 Y135.705 E.11932
G1 X122.832 Y135.704 E.12445
G3 X121.462 Y135.471 I.084 J-4.646 E.02892
G3 X119.936 Y134.582 I1.644 J-4.575 E.03685
G1 X120.709 Y134.04 E.0196
G1 X121.315 Y134.427 E.01491
G2 X122.81 Y134.793 I1.807 J-4.139 E.03207
G1 X125.888 Y134.794 E.06384
G1 X126.066 Y134.779 E.00371
G1 X126.483 Y134.605 E.00937
G1 X126.821 Y134.201 E.01093
G1 X126.918 Y133.763 E.0093
G1 X126.918 Y129.953 E.07905
G1 X126.793 Y129.461 E.01052
G2 X128.93 Y129.461 I1.065 J-7.388 E.04448
; WIPE_START
G1 X128.892 Y129.605 E-.05673
G1 X128.832 Y129.953 E-.13408
G1 X128.832 Y131.45 E-.56919
; WIPE_END
G1 E-.04 F1800
G1 X130.286 Y128.671 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
G1 F3600
G1 X129.572 Y129.385 E.02096
G1 X129.291 Y129.748 E.00951
G1 X129.256 Y129.953 E.00431
G1 X129.256 Y136.129 E.12812
G1 X123.256 Y136.128 E.12445
G3 X121.822 Y136.001 I-.168 J-6.258 E.02991
G3 X119.832 Y135.06 I.983 J-4.655 E.04609
G1 X119.271 Y134.529 E.01602
G1 X120.731 Y133.507 E.03697
G1 X120.862 Y133.629 E.00371
G1 X121.526 Y134.054 E.01636
G1 X122.154 Y134.282 E.01387
G1 X122.81 Y134.369 E.01373
G1 X125.888 Y134.37 E.06383
G1 X126.238 Y134.259 E.00762
G1 X126.437 Y134.021 E.00643
G1 X126.494 Y133.763 E.00547
G1 X126.494 Y130.09 E.07619
G1 X126.432 Y129.685 E.0085
G1 X126.317 Y129.524 E.00411
G1 X125.472 Y128.679 E.02478
G2 X129.33 Y128.963 I2.42 J-6.536 E.08131
G1 X130.229 Y128.688 E.0195
; WIPE_START
G1 X129.572 Y129.385 E-.36402
G1 X129.291 Y129.748 E-.17428
G1 X129.256 Y129.953 E-.07888
G1 X129.256 Y130.328 E-.14282
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I.988 J.711 P1  F30000
G1 X134.197 Y123.462 Z2.16
G1 Z1.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389342
M204 S5000
G1 X134.174 Y123.598 E.00245
G3 X134.029 Y124.153 I-6.321 J-1.352 E.0102
; LINE_WIDTH: 0.390252
G3 X133.589 Y125.22 I-6.34 J-1.987 E.02059
; LINE_WIDTH: 0.390112
G1 X133.301 Y125.722 E.01031
; LINE_WIDTH: 0.389352
G3 X132.594 Y126.635 I-5.436 J-3.481 E.02055
; LINE_WIDTH: 0.390232
G1 X132.181 Y127.039 E.0103
; LINE_WIDTH: 0.392632
G1 X131.731 Y127.403 E.01037
; LINE_WIDTH: 0.419992
G3 X128.655 Y128.662 I-3.804 J-4.907 E.06487
G3 X124.335 Y127.632 I-.801 J-6.213 E.0875
; LINE_WIDTH: 0.391742
G1 X123.855 Y127.283 E.01063
; LINE_WIDTH: 0.389382
G1 X123.42 Y126.902 E.01028
; LINE_WIDTH: 0.390252
G1 X123.022 Y126.483 E.01029
; LINE_WIDTH: 0.392612
G3 X122.347 Y125.552 I5.567 J-4.744 E.02065
; LINE_WIDTH: 0.390852
G3 X121.846 Y124.512 I5.527 J-3.302 E.02064
; LINE_WIDTH: 0.391352
G1 X121.669 Y123.964 E.0103
; LINE_WIDTH: 0.392572
G3 X121.46 Y122.832 I7.236 J-1.922 E.02067
; LINE_WIDTH: 0.389392
G1 X121.433 Y122.302 E.00944
; LINE_WIDTH: 0.388472
G1 X121.451 Y121.776 E.00932
; LINE_WIDTH: 0.382362
G1 X121.527 Y121.165 E.01074
; LINE_WIDTH: 0.384642
G3 X121.875 Y119.904 I6.192 J1.031 E.023
; LINE_WIDTH: 0.384542
G1 X122.11 Y119.375 E.01014
; LINE_WIDTH: 0.384772
G1 X122.411 Y118.838 E.01082
; LINE_WIDTH: 0.385822
G1 X122.832 Y118.241 E.01286
; LINE_WIDTH: 0.386192
G1 X123.213 Y117.803 E.01022
; LINE_WIDTH: 0.386452
G3 X124.082 Y117.042 I4.697 J4.488 E.0204
; LINE_WIDTH: 0.385772
G3 X125.072 Y116.449 I3.769 J5.172 E.02035
; LINE_WIDTH: 0.385892
G3 X126.153 Y116.041 I2.782 J5.741 E.02036
; LINE_WIDTH: 0.385782
G3 X127.289 Y115.834 I1.722 J6.205 E.02036
G1 X128.247 Y115.819 E.01685
G3 X132.784 Y118.078 I-.403 J6.497 E.09164
; LINE_WIDTH: 0.386592
G1 X133.16 Y118.566 E.01087
; LINE_WIDTH: 0.389862
G3 X133.762 Y119.635 I-5.542 J3.821 E.02187
; LINE_WIDTH: 0.389342
G1 X133.973 Y120.173 E.01027
; LINE_WIDTH: 0.390242
G3 X134.247 Y121.302 I-6.479 J2.171 E.02072
; LINE_WIDTH: 0.389152
G1 X134.307 Y121.887 E.01045
; LINE_WIDTH: 0.389342
G3 X134.27 Y123.021 I-6.455 J.359 E.0202
G1 X134.206 Y123.403 E.00688
; WIPE_START
M204 S10000
G1 X134.174 Y123.598 E-.07527
G1 X134.029 Y124.153 E-.21806
G1 X133.832 Y124.696 E-.21931
G1 X133.589 Y125.22 E-.21954
G1 X133.553 Y125.283 E-.02782
; WIPE_END
G1 E-.04
G17
G3 Z2.16 I-.715 J-.985 P1  F30000
G1 X120.71 Y134.6 Z2.16
G1 Z1.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.520632
G1 F3600
G2 X121.629 Y135.043 I2.03 J-3.035 E.02477
; LINE_WIDTH: 0.524072
G2 X122.809 Y135.248 I1.364 J-4.351 E.02925
; LINE_WIDTH: 0.511812
G1 X125.888 Y135.249 E.07316
; LINE_WIDTH: 0.534312
G1 X126.146 Y135.238 E.00644
; WIPE_START
G1 X125.888 Y135.249 E-.09838
G1 X124.146 Y135.249 E-.66162
; WIPE_END
G1 E-.04 F1800
G1 X126.002 Y133.924 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X126.085 Y133.763 E.00349
G1 X126.085 Y129.953 E.07344
G1 X126.027 Y129.813 E.00292
G1 X124.613 Y128.399 E.03855
G2 X124.024 Y127.858 I-5.075 J4.938 E.01541
; LINE_WIDTH: 0.386382
G1 X123.538 Y127.49 E.01075
; LINE_WIDTH: 0.385772
G1 X123.089 Y127.084 E.01065
; LINE_WIDTH: 0.390252
G1 X122.746 Y126.72 E.00892
; LINE_WIDTH: 0.392612
G3 X122.03 Y125.732 I5.341 J-4.622 E.02191
; LINE_WIDTH: 0.390852
G3 X121.502 Y124.633 I5.843 J-3.482 E.02181
; LINE_WIDTH: 0.391352
G1 X121.314 Y124.052 E.01091
; LINE_WIDTH: 0.392572
G3 X121.097 Y122.851 I6.888 J-1.868 E.02191
; LINE_WIDTH: 0.389392
G1 X121.07 Y122.287 E.01005
; LINE_WIDTH: 0.390942
G1 X121.116 Y121.474 E.01453
; LINE_WIDTH: 0.392512
G1 X121.269 Y120.626 E.01545
G1 X121.439 Y120.043 E.01089
; LINE_WIDTH: 0.390842
G1 X121.663 Y119.475 E.0109
; LINE_WIDTH: 0.391372
G1 X121.936 Y118.929 E.01091
; LINE_WIDTH: 0.392362
G3 X122.624 Y117.922 I6.157 J3.463 E.0219
; LINE_WIDTH: 0.389352
G1 X123.01 Y117.492 E.01027
; LINE_WIDTH: 0.388832
G1 X123.482 Y117.053 E.01144
; LINE_WIDTH: 0.389342
G3 X124.48 Y116.353 I4.407 J5.219 E.0217
; LINE_WIDTH: 0.389612
G3 X125.587 Y115.841 I3.45 J6.013 E.02172
; LINE_WIDTH: 0.389392
G3 X126.768 Y115.535 I2.289 J6.412 E.02173
; LINE_WIDTH: 0.390232
G1 X127.374 Y115.464 E.01087
G1 X128.397 Y115.465 E.01823
; LINE_WIDTH: 0.389352
G3 X132.728 Y117.479 I-.522 J6.784 E.08675
; LINE_WIDTH: 0.389512
G3 X133.502 Y118.423 I-4.877 J4.791 E.02174
; LINE_WIDTH: 0.389152
G1 X133.875 Y119.045 E.01289
; LINE_WIDTH: 0.385772
G3 X134.619 Y121.358 I-6.076 J3.229 E.04299
; LINE_WIDTH: 0.389092
G1 X134.669 Y121.868 E.0091
G1 X134.672 Y121.966 E.00175
; LINE_WIDTH: 0.386062
G1 X134.67 Y122.576 E.01075
; LINE_WIDTH: 0.385832
G3 X134.105 Y124.979 I-6.793 J-.329 E.04369
; LINE_WIDTH: 0.385512
G1 X133.836 Y125.525 E.01071
; LINE_WIDTH: 0.385792
G3 X132.301 Y127.415 I-5.91 J-3.234 E.04309
; LINE_WIDTH: 0.387362
G1 X131.698 Y127.88 E.01346
; LINE_WIDTH: 0.419992
G1 X131.302 Y128.233 E.01023
G1 X129.723 Y129.813 E.04306
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.539 E.12695
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
G1 X122.747 Y136.537 E.13336
G3 X118.668 Y134.452 I.189 J-5.401 E.09118
G1 X120.793 Y132.964 E.05001
G1 X121.095 Y133.293 E.00861
G1 X121.675 Y133.673 E.01336
G1 X122.212 Y133.877 E.01107
G1 X122.811 Y133.96 E.01167
G1 X125.888 Y133.961 E.0593
G1 X125.944 Y133.943 E.00115
; WIPE_START
M204 S10000
G1 X126.085 Y133.763 E-.08652
G1 X126.085 Y131.991 E-.67348
; WIPE_END
G1 E-.04
G1 X128.035 Y130.331 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.346772
G1 F4533
G1 X127.715 Y130.33 E.00503
G1 X127.715 Y133.763 E.05389
G1 X127.692 Y134.103 E.00534
; LINE_WIDTH: 0.38596
G1 X127.625 Y134.354 E.00459
; LINE_WIDTH: 0.440547
G1 X127.558 Y134.606 E.00528
G1 X127.346 Y134.859 E.00669
G1 X127.986 Y134.859 E.01298
; LINE_WIDTH: 0.425115
G1 X128.005 Y134.507 E.00689
; LINE_WIDTH: 0.38596
G1 X128.025 Y134.154 E.00622
; LINE_WIDTH: 0.346985
G1 X128.035 Y130.391 E.0591
; CHANGE_LAYER
; Z_HEIGHT: 1.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18678.044
G1 X128.03 Y132.391 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/145
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.16 I-1.093 J-.535 P1  F30000
G1 X126.836 Y134.832 Z2.16
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1738
G1 X127.209 Y134.381 E.01214
G1 X127.321 Y134.023 E.00777
M73 P44 R11
G1 X127.343 Y133.772 E.00523
G1 X127.343 Y131.772 E.04148
G3 X127.347 Y129.953 I111.002 J-.639 E.03774
G1 X127.348 Y129.948 E.00009
G2 X128.407 Y129.953 I.578 J-12.01 E.02197
G1 X128.407 Y135.272 E.11034
G1 X126.833 Y135.272 E.03265
; LINE_WIDTH: 0.483542
G1 X126.489 Y135.255 E.00772
; LINE_WIDTH: 0.517092
G1 X126.145 Y135.238 E.00828
G1 X126.439 Y135.097 E.00783
; LINE_WIDTH: 0.483542
G1 X126.732 Y134.957 E.00729
; LINE_WIDTH: 0.449992
G1 X126.798 Y134.878 E.00211
; WIPE_START
G1 F3600
G1 X127.209 Y134.381 E-.24518
M73 P45 R11
G1 X127.321 Y134.023 E-.14243
G1 X127.343 Y133.772 E-.09588
G1 X127.343 Y133.044 E-.27651
; WIPE_END
G1 E-.04 F1800
G1 X128.981 Y129.454 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
G1 F1738
G1 X128.906 Y129.568 E.00284
G1 X128.832 Y129.953 E.00812
G1 X128.832 Y135.697 E.11914
G1 X122.832 Y135.695 E.12445
G3 X122.098 Y135.625 I.552 J-9.594 E.01528
G3 X120.442 Y134.963 I.904 J-4.666 E.03721
G1 X119.94 Y134.578 E.01312
G1 X120.706 Y134.043 E.01938
G1 X121.218 Y134.387 E.01281
G1 X121.762 Y134.619 E.01225
G2 X122.809 Y134.802 I1.227 J-3.928 E.02212
G1 X125.888 Y134.803 E.06385
G1 X126.066 Y134.787 E.00371
G1 X126.486 Y134.611 E.00946
G1 X126.824 Y134.204 E.01098
G1 X126.918 Y133.772 E.00916
G1 X126.918 Y129.953 E.07922
G1 X126.793 Y129.461 E.01052
G2 X128.922 Y129.462 I1.068 J-7.572 E.04431
; WIPE_START
G1 F3600
G1 X128.906 Y129.568 E-.04065
G1 X128.832 Y129.953 E-.1488
G1 X128.832 Y131.454 E-.57054
; WIPE_END
G1 E-.04 F1800
G1 X130.278 Y128.679 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
G1 F1738
G1 X129.572 Y129.385 E.02072
G1 X129.3 Y129.726 E.00906
G1 X129.256 Y129.953 E.00478
G1 X129.256 Y136.121 E.12794
G1 X123.256 Y136.119 E.12445
G3 X120.92 Y135.706 I-.221 J-5.551 E.04958
G1 X120.28 Y135.367 E.01501
G1 X119.837 Y135.054 E.01126
G1 X119.283 Y134.521 E.01595
G1 X120.721 Y133.514 E.0364
G1 X121.385 Y133.997 E.01702
G1 X122.047 Y134.265 E.01482
G1 X122.81 Y134.378 E.016
G1 X125.888 Y134.378 E.06384
G1 X126.24 Y134.266 E.00767
G1 X126.439 Y134.026 E.00646
G1 X126.494 Y133.772 E.00539
G1 X126.494 Y130.09 E.07637
G1 X126.432 Y129.685 E.0085
G1 X126.317 Y129.524 E.00411
G1 X125.472 Y128.679 E.02478
G2 X129.33 Y128.962 I2.42 J-6.536 E.08131
G1 X130.221 Y128.696 E.01929
; WIPE_START
G1 F3600
G1 X129.572 Y129.385 E-.35971
G1 X129.3 Y129.726 E-.16595
G1 X129.256 Y129.953 E-.08755
G1 X129.256 Y130.339 E-.14679
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.28 I.989 J.709 P1  F30000
G1 X134.198 Y123.44 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.390822
G1 F1738
M204 S5000
G1 X134.165 Y123.596 E.00283
G3 X132.595 Y126.63 I-6.333 J-1.353 E.0617
; LINE_WIDTH: 0.391392
G3 X131.734 Y127.404 I-4.908 J-4.592 E.02073
; LINE_WIDTH: 0.419992
G3 X126.921 Y128.639 I-3.848 J-5.001 E.09845
G3 X124.337 Y127.633 I.909 J-6.159 E.0539
; LINE_WIDTH: 0.391672
G1 X123.855 Y127.283 E.01066
; LINE_WIDTH: 0.389382
G3 X123.021 Y126.484 I4.018 J-5.031 E.02057
; LINE_WIDTH: 0.390312
G1 X122.663 Y126.032 E.01028
; LINE_WIDTH: 0.392082
G3 X122.074 Y125.043 I5.857 J-4.161 E.02063
; LINE_WIDTH: 0.390842
G3 X121.436 Y122.295 I6.109 J-2.865 E.05074
G1 X121.489 Y121.393 E.01613
; LINE_WIDTH: 0.386112
G1 X121.592 Y120.824 E.01018
; LINE_WIDTH: 0.385732
G1 X121.745 Y120.267 E.01017
; LINE_WIDTH: 0.385122
G1 X121.948 Y119.725 E.01016
; LINE_WIDTH: 0.385902
G1 X122.218 Y119.168 E.0109
; LINE_WIDTH: 0.389882
G1 X122.557 Y118.616 E.01155
; LINE_WIDTH: 0.392912
G3 X123.264 Y117.756 I6.262 J4.422 E.01999
; LINE_WIDTH: 0.390822
G1 X123.712 Y117.337 E.01094
; LINE_WIDTH: 0.392932
G3 X124.65 Y116.674 I4.914 J5.952 E.02064
; LINE_WIDTH: 0.389362
G1 X125.13 Y116.422 E.00964
; LINE_WIDTH: 0.388582
G1 X125.606 Y116.22 E.00917
; LINE_WIDTH: 0.385762
G3 X127.827 Y115.811 I2.242 J5.946 E.03996
; LINE_WIDTH: 0.389292
G3 X131.587 Y116.986 I.02 J6.543 E.07113
; LINE_WIDTH: 0.392902
G3 X132.462 Y117.731 I-4.548 J6.226 E.02065
; LINE_WIDTH: 0.390822
G3 X133.195 Y118.623 I-4.585 J4.517 E.02063
; LINE_WIDTH: 0.391392
G3 X133.758 Y119.63 I-5.567 J3.768 E.02066
; LINE_WIDTH: 0.390822
G3 X134.262 Y123.014 I-5.926 J2.612 E.0618
G1 X134.207 Y123.381 E.00662
; WIPE_START
G1 F1800
M204 S10000
G1 X134.165 Y123.596 E-.08312
G1 X134.028 Y124.147 E-.21601
G1 X133.834 Y124.69 E-.21917
G1 X133.574 Y125.247 E-.23348
G1 X133.563 Y125.266 E-.00822
; WIPE_END
G1 E-.04
G17
G3 Z2.28 I-.714 J-.985 P1  F30000
G1 X120.698 Y134.595 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.509792
G1 F1738
G1 X121.322 Y134.925 E.01671
G1 X121.835 Y135.108 E.01287
; LINE_WIDTH: 0.490552
G1 X122.459 Y135.221 E.01442
; LINE_WIDTH: 0.494732
G1 X122.811 Y135.248 E.00808
G1 X125.888 Y135.249 E.07055
; LINE_WIDTH: 0.517092
G1 X126.145 Y135.238 E.00618
; WIPE_START
G1 F3600
G1 X125.888 Y135.249 E-.09781
G1 X124.145 Y135.249 E-.66219
; WIPE_END
G1 E-.04 F1800
G1 X126.002 Y133.933 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1738
M204 S5000
G1 X126.085 Y133.772 E.00348
G1 X126.085 Y129.953 E.0736
G1 X126.027 Y129.813 E.00292
G1 X124.613 Y128.399 E.03855
G2 X124.025 Y127.859 I-4.766 J4.6 E.01541
; LINE_WIDTH: 0.386382
G1 X123.538 Y127.49 E.01076
; LINE_WIDTH: 0.385772
G3 X122.295 Y126.139 I4.928 J-5.781 E.0324
; LINE_WIDTH: 0.392082
G3 X121.741 Y125.194 I5.545 J-3.885 E.01963
; LINE_WIDTH: 0.390842
G3 X121.086 Y121.79 I6.143 J-2.947 E.06257
; LINE_WIDTH: 0.389932
G1 X121.146 Y121.236 E.00992
; LINE_WIDTH: 0.389352
G1 X121.266 Y120.628 E.01102
; LINE_WIDTH: 0.389602
G1 X121.45 Y120.009 E.01149
; LINE_WIDTH: 0.389842
G3 X121.953 Y118.899 I6.45 J2.252 E.02173
; LINE_WIDTH: 0.389672
G1 X122.322 Y118.321 E.0122
; LINE_WIDTH: 0.392912
G3 X123.009 Y117.494 I5.591 J3.952 E.01931
; LINE_WIDTH: 0.390822
G1 X123.482 Y117.054 E.01154
; LINE_WIDTH: 0.392932
G3 X124.479 Y116.353 I4.61 J5.498 E.02191
; LINE_WIDTH: 0.389362
G3 X127.275 Y115.473 I3.473 J6.154 E.05248
; LINE_WIDTH: 0.386242
G1 X127.849 Y115.459 E.01012
; LINE_WIDTH: 0.385782
G3 X131.887 Y116.756 I.035 J6.823 E.07591
; LINE_WIDTH: 0.392902
G3 X132.728 Y117.481 I-4.063 J5.565 E.01995
; LINE_WIDTH: 0.390822
G3 X133.501 Y118.424 I-4.852 J4.768 E.0218
; LINE_WIDTH: 0.391392
G3 X134.094 Y119.49 I-5.707 J3.872 E.02184
; LINE_WIDTH: 0.390822
G3 X134.668 Y121.869 I-6.23 J2.762 E.04392
; LINE_WIDTH: 0.390832
G1 X134.675 Y122.164 E.00527
; LINE_WIDTH: 0.384702
G1 X134.656 Y122.774 E.01071
; LINE_WIDTH: 0.384592
G3 X134.038 Y125.123 I-6.787 J-.529 E.04284
; LINE_WIDTH: 0.384792
G3 X133.427 Y126.177 I-5.994 J-2.77 E.02142
; LINE_WIDTH: 0.384542
G1 X133.053 Y126.658 E.01069
; LINE_WIDTH: 0.384782
G3 X132.182 Y127.513 I-5.196 J-4.428 E.02145
; LINE_WIDTH: 0.389372
G1 X131.647 Y127.914 E.01188
; LINE_WIDTH: 0.419992
G1 X131.273 Y128.263 E.00987
G1 X129.859 Y129.677 E.03855
G2 X129.665 Y129.953 I.236 J.372 E.00666
G1 X129.665 Y136.53 E.12679
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
G1 X122.747 Y136.529 E.13335
G1 X121.993 Y136.456 E.01461
G3 X120.118 Y135.753 I1.076 J-5.722 E.03879
G3 X118.677 Y134.446 I3.073 J-4.835 E.03768
G1 X120.784 Y132.97 E.04959
G1 X121.03 Y133.246 E.00712
G1 X121.545 Y133.62 E.01227
G1 X122.127 Y133.864 E.01216
G1 X122.811 Y133.968 E.01333
G1 X125.888 Y133.969 E.05931
G1 X125.945 Y133.951 E.00116
; WIPE_START
G1 F1800
M204 S10000
G1 X126.085 Y133.772 E-.08625
G1 X126.085 Y131.999 E-.67376
; WIPE_END
G1 E-.04
G1 X128.034 Y130.332 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.346341
G1 F1738
G1 X127.715 Y130.33 E.00501
G1 X127.715 Y133.772 E.05395
G1 X127.692 Y134.111 E.00532
; LINE_WIDTH: 0.384942
G1 X127.627 Y134.357 E.00447
; LINE_WIDTH: 0.437586
G1 X127.562 Y134.603 E.00512
G1 X127.355 Y134.852 E.00652
G1 X127.987 Y134.852 E.01272
; LINE_WIDTH: 0.422682
G1 X128.006 Y134.507 E.00671
; LINE_WIDTH: 0.384942
G1 X128.025 Y134.161 E.00607
; LINE_WIDTH: 0.346576
G1 X128.034 Y130.392 E.05913
; CHANGE_LAYER
; Z_HEIGHT: 1.928
; LAYER_HEIGHT: 0.048
; WIPE_START
G1 F18701.856
G1 X128.029 Y132.392 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/145
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.28 I.627 J-1.043 P1  F30000
G1 X122.211 Y128.894 Z2.28
G1 Z1.928
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.268
G1 F4343
G1 X124.038 Y128.894 E.07228
G2 X123.533 Y128.423 I-1.516 J1.117 E.02749
G1 X122.828 Y127.861 E.03568
G1 X122.211 Y127.238 E.03471
G1 X122.211 Y128.697 E.05777
; WIPE_START
G1 F7411.492
G1 X122.211 Y127.238 E-.55463
G1 X122.591 Y127.622 E-.20537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.328 I.54 J-1.091 P1  F30000
G1 X119.317 Y126 Z2.328
G1 Z1.928
G1 E.8 F1800
G1 F4343
G1 X121.326 Y126 E.07953
G1 X120.732 Y124.685 E.05712
G1 X120.485 Y123.783 E.03702
G1 X120.378 Y123.106 E.02714
G1 X116.423 Y123.106 E.15653
G1 X116.423 Y120.212 E.11456
G1 X120.609 Y120.212 E.16567
G1 X120.89 Y119.391 E.03434
G1 X121.178 Y118.769 E.02712
G1 X121.637 Y118.002 E.0354
G1 X122.163 Y117.317 E.03417
G1 X119.317 Y117.317 E.11265
; WIPE_START
G1 F7411.492
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.328 I1.163 J.359 P1  F30000
G1 X122.211 Y114.423 Z2.328
G1 Z1.928
G1 E.8 F1800
G1 F4343
G1 X133.789 Y114.423 E.45823
G1 X133.789 Y117.317 E.11456
G1 X133.587 Y117.317 E.00799
G1 X133.789 Y117.562 E.01255
G1 X133.789 Y117.514 E.00187
; WIPE_START
G1 F7411.492
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12047
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.884 E-.54484
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.328 I-1.162 J.363 P1  F30000
G1 X135.141 Y120.212 Z2.328
G1 Z1.928
G1 E.8 F1800
G1 F4343
G1 X139.577 Y120.212 E.17557
G1 X139.577 Y123.106 E.11456
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
G1 X135.373 Y123.106 E.1664
G1 X135.254 Y123.832 E.02913
G1 X135.018 Y124.685 E.03502
G1 X134.424 Y126 E.05713
G1 X136.683 Y126 E.08943
; WIPE_START
G1 F7411.492
G1 X134.683 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.328 I-.067 J-1.215 P1  F30000
G1 X132.037 Y126.145 Z2.328
G1 Z1.928
G1 E.8 F1800
G1 F4343
G3 X123.58 Y126 I-4.163 J-3.892 E.37723
G1 X132.17 Y126 E.34
G2 X133.512 Y123.106 I-4.291 J-3.747 E.12798
G1 X122.237 Y123.106 E.44626
G3 X122.549 Y120.212 I5.705 J-.849 E.11648
G1 X133.2 Y120.212 E.42157
G2 X130.897 Y117.414 I-5.324 J2.036 E.14596
G1 X130.736 Y117.317 E.00743
G1 X125.014 Y117.317 E.2265
G3 X125.351 Y117.137 I2.895 J4.993 E.01513
G1 X125.485 Y117.072 E.00591
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.072
; WIPE_START
G1 F7411.492
G1 X125.351 Y117.137 E-.05671
G1 X125.014 Y117.317 E-.1452
G1 X126.483 Y117.317 E-.55809
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/145
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.328 I-1.217 J.025 P1  F30000
G1 X126.843 Y134.844 Z2.328
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X127.218 Y134.38 E.01236
G2 X127.343 Y133.79 I-1.329 J-.59 E.0126
G1 X127.343 Y131.79 E.04148
G2 X127.341 Y129.942 I-315.282 J-.648 E.03834
G2 X128.403 Y129.953 I.668 J-13.458 E.02203
G1 X128.407 Y135.254 E.10996
G1 X126.837 Y135.253 E.03258
; LINE_WIDTH: 0.480192
G1 X126.141 Y135.238 E.01545
G1 X126.743 Y134.967 E.01467
; LINE_WIDTH: 0.449992
G1 X126.805 Y134.89 E.00205
G1 X126.56 Y134.542 F30000
G1 F3600
G1 X126.83 Y134.208 E.0089
G1 X126.918 Y133.79 E.00886
G1 X126.918 Y130.173 E.07504
G1 X126.873 Y129.651 E.01085
G1 X126.769 Y129.454 E.00463
G1 X127.003 Y129.489 E.00491
G2 X129.004 Y129.449 I.845 J-7.652 E.04162
G1 X128.832 Y129.938 E.01076
G1 X128.832 Y135.678 E.11907
G1 X122.832 Y135.677 E.12445
G3 X122.107 Y135.606 I.515 J-9.071 E.01511
G1 X121.447 Y135.437 E.01414
G3 X119.954 Y134.569 I1.808 J-4.831 E.03599
G1 X120.686 Y134.056 E.01855
G1 X121.288 Y134.445 E.01486
G2 X122.809 Y134.82 I1.744 J-3.797 E.03269
G1 X125.888 Y134.821 E.06386
G1 X126.066 Y134.805 E.00371
G1 X126.494 Y134.624 E.00965
G1 X126.522 Y134.589 E.00094
; WIPE_START
G1 X126.83 Y134.208 E-.18593
G1 X126.918 Y133.79 E-.16233
G1 X126.918 Y132.707 E-.41174
; WIPE_END
G1 E-.04 F1800
G1 X130.264 Y128.691 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F3600
G3 X129.433 Y129.524 I-157.991 J-156.758 E.02439
G1 X129.256 Y129.944 E.00946
G1 X129.256 Y136.103 E.12774
G1 X123.256 Y136.101 E.12445
G3 X120.724 Y135.592 I-.221 J-5.449 E.05407
G3 X119.292 Y134.515 I2.51 J-4.828 E.03735
G1 X120.709 Y133.523 E.03588
G1 X120.844 Y133.649 E.00384
G1 X121.449 Y134.052 E.01507
G2 X122.81 Y134.396 I1.574 J-3.367 E.0293
G1 X125.888 Y134.397 E.06384
G1 X126.244 Y134.281 E.00778
G1 X126.442 Y134.036 E.00652
G1 X126.494 Y133.79 E.00521
G1 X126.494 Y130.337 E.07164
G1 X126.468 Y129.775 E.01166
G1 X126.317 Y129.524 E.00608
G1 X125.472 Y128.679 E.02479
G2 X128.322 Y129.103 I2.437 J-6.576 E.0602
G1 X129.144 Y129 E.01718
G2 X130.207 Y128.712 I-1.292 J-6.882 E.02288
; WIPE_START
G1 X129.433 Y129.524 E-.42636
G1 X129.256 Y129.944 E-.1733
G1 X129.256 Y130.366 E-.16034
; WIPE_END
G1 E-.04 F1800
G1 X122.407 Y133.735 Z2.4 F30000
G1 X120.687 Y134.582 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.463832
M73 P46 R11
G1 F3600
G1 X121.126 Y134.841 E.01091
; LINE_WIDTH: 0.459292
G1 X121.603 Y135.037 E.01094
; LINE_WIDTH: 0.463392
G2 X122.713 Y135.242 I1.303 J-3.948 E.02424
; LINE_WIDTH: 0.458122
G1 X125.888 Y135.249 E.0671
; LINE_WIDTH: 0.480192
G1 X126.141 Y135.238 E.00565
; WIPE_START
G1 X125.888 Y135.249 E-.09661
G1 X124.142 Y135.245 E-.66339
; WIPE_END
G1 E-.04 F1800
G1 X129.086 Y129.431 Z2.4 F30000
G1 X134.2 Y123.418 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392312
M204 S5000
G1 X134.171 Y123.589 E.00312
G3 X134.032 Y124.143 I-7.111 J-1.492 E.01023
; LINE_WIDTH: 0.389352
G3 X132.189 Y127.033 I-6.156 J-1.893 E.06168
; LINE_WIDTH: 0.389472
G1 X131.74 Y127.402 E.01033
; LINE_WIDTH: 0.419992
G1 X130.858 Y127.979 E.02032
G3 X128.273 Y128.697 I-2.991 J-5.761 E.05209
G3 X124.375 Y127.663 I-.379 J-6.438 E.07906
; LINE_WIDTH: 0.394242
G1 X123.853 Y127.281 E.01165
; LINE_WIDTH: 0.389882
G1 X123.42 Y126.902 E.01026
; LINE_WIDTH: 0.389352
G1 X123.021 Y126.484 E.01027
; LINE_WIDTH: 0.390372
G3 X122.342 Y125.549 I5.202 J-4.487 E.02061
; LINE_WIDTH: 0.389372
G3 X121.459 Y122.821 I5.792 J-3.383 E.05138
; LINE_WIDTH: 0.389982
G3 X121.467 Y121.584 I6.742 J-.574 E.02205
; LINE_WIDTH: 0.385022
G1 X121.553 Y121.013 E.01015
; LINE_WIDTH: 0.384532
G3 X123.082 Y117.945 I6.323 J1.237 E.06086
; LINE_WIDTH: 0.384872
G3 X123.928 Y117.159 I4.842 J4.358 E.0203
; LINE_WIDTH: 0.385842
G3 X127.824 Y115.811 I3.968 J5.166 E.07385
; LINE_WIDTH: 0.389292
G1 X128.368 Y115.827 E.00968
; LINE_WIDTH: 0.392912
G3 X129.495 Y116.018 I-.718 J7.681 E.02052
; LINE_WIDTH: 0.390842
G3 X133.195 Y118.623 I-1.62 J6.232 E.08255
; LINE_WIDTH: 0.391422
G3 X133.758 Y119.63 I-5.58 J3.775 E.02066
; LINE_WIDTH: 0.390822
G3 X134.311 Y122.46 I-6.179 J2.676 E.05187
; LINE_WIDTH: 0.391432
G1 X134.266 Y123.027 E.01016
; LINE_WIDTH: 0.392312
G1 X134.21 Y123.358 E.00603
; WIPE_START
M204 S10000
G1 X134.171 Y123.589 E-.08893
G1 X134.032 Y124.143 E-.2169
G1 X133.838 Y124.687 E-.21959
G1 X133.595 Y125.212 E-.21963
G1 X133.575 Y125.246 E-.01496
; WIPE_END
G1 E-.04
G17
G3 Z2.4 I-.918 J-.799 P1  F30000
G1 X126.004 Y133.95 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.419992
M204 S5000
G1 X126.085 Y133.79 E.00345
G1 X126.085 Y129.953 E.07397
G1 X126.027 Y129.813 E.00291
G1 X124.613 Y128.399 E.03855
G2 X124.105 Y127.915 I-9.64 J9.618 E.01353
; LINE_WIDTH: 0.389792
G1 X123.538 Y127.49 E.01261
; LINE_WIDTH: 0.385782
G3 X121.286 Y123.939 I4.446 J-5.309 E.0752
; LINE_WIDTH: 0.386912
G1 X121.164 Y123.374 E.01021
; LINE_WIDTH: 0.389372
G1 X121.097 Y122.851 E.00938
; LINE_WIDTH: 0.389982
G1 X121.071 Y122.307 E.00971
; LINE_WIDTH: 0.390812
G3 X123.034 Y117.469 I6.892 J-.021 E.09557
; LINE_WIDTH: 0.391442
G1 X123.482 Y117.054 E.01092
; LINE_WIDTH: 0.392922
G3 X124.48 Y116.353 I4.586 J5.46 E.02192
; LINE_WIDTH: 0.389382
G3 X127.275 Y115.473 I3.473 J6.154 E.05248
; LINE_WIDTH: 0.386242
G1 X127.847 Y115.459 E.01008
; LINE_WIDTH: 0.385752
G1 X128.501 Y115.476 E.01152
; LINE_WIDTH: 0.392912
G3 X129.594 Y115.666 I-.634 J6.867 E.01995
; LINE_WIDTH: 0.390842
G3 X133.501 Y118.424 I-1.722 J6.587 E.08722
; LINE_WIDTH: 0.391422
G3 X134.094 Y119.49 I-5.71 J3.874 E.02184
; LINE_WIDTH: 0.390822
G3 X134.668 Y121.87 I-6.231 J2.762 E.04394
G1 X134.675 Y122.48 E.01088
; LINE_WIDTH: 0.391432
G1 X134.628 Y123.079 E.01075
; LINE_WIDTH: 0.392312
G3 X134.375 Y124.263 I-6.999 J-.876 E.02172
; LINE_WIDTH: 0.389352
G3 X132.028 Y127.638 I-6.607 J-2.091 E.0742
; LINE_WIDTH: 0.398372
G1 X131.567 Y127.985 E.01051
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I130.921 J133.858 E.05005
G1 X129.665 Y129.95 E.00286
G1 X129.665 Y136.512 E.12649
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
G1 X122.747 Y136.51 E.13334
G1 X121.997 Y136.438 E.01453
G1 X121.246 Y136.253 E.0149
G3 X119.501 Y135.287 I1.896 J-5.485 E.03864
G3 X118.691 Y134.436 I3.227 J-3.882 E.0227
G1 X120.771 Y132.979 E.04896
G1 X121.078 Y133.313 E.00873
G1 X121.604 Y133.673 E.01229
G1 X122.117 Y133.88 E.01067
G1 X122.811 Y133.987 E.01352
G1 X125.888 Y133.987 E.05932
G1 X125.947 Y133.968 E.00119
; WIPE_START
M204 S10000
G1 X126.085 Y133.79 E-.08564
G1 X126.085 Y132.016 E-.67437
; WIPE_END
G1 E-.04
G1 X128.035 Y130.33 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.346502
G1 F4343
G1 X127.716 Y130.332 E.00501
G1 X127.715 Y133.79 E.05424
G1 X127.692 Y134.128 E.0053
; LINE_WIDTH: 0.383142
G1 X127.632 Y134.361 E.00422
; LINE_WIDTH: 0.431523
G1 X127.571 Y134.595 E.00479
G1 X127.375 Y134.837 E.00617
G1 X127.99 Y134.837 E.01221
; LINE_WIDTH: 0.417782
G1 X128.008 Y134.507 E.00633
; LINE_WIDTH: 0.383142
G1 X128.025 Y134.177 E.00577
; LINE_WIDTH: 0.346727
G1 X128.035 Y130.39 E.05944
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18693.082
G1 X128.03 Y132.39 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/145
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.4 I-1.099 J-.522 P1  F30000
G1 X126.855 Y134.862 Z2.4
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1733
G1 X127.231 Y134.378 E.0127
G2 X127.343 Y133.819 I-1.343 J-.559 E.01191
G1 X127.343 Y131.819 E.04148
G3 X127.347 Y129.953 I113.869 J-.662 E.03871
G1 X127.348 Y129.948 E.00009
G2 X128.407 Y129.953 I.579 J-12.007 E.02197
G1 X128.407 Y135.225 E.10937
G2 X126.137 Y135.238 I-.797 J58.003 E.0471
G1 X126.761 Y134.983 E.01399
G1 X126.818 Y134.909 E.00194
; WIPE_START
G1 F3600
G1 X127.231 Y134.378 E-.25552
G1 X127.321 Y134.07 E-.12188
G1 X127.343 Y133.819 E-.09588
G1 X127.343 Y133.064 E-.28671
; WIPE_END
G1 E-.04 F1800
G1 X128.989 Y129.452 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
G1 F1733
G1 X128.892 Y129.605 E.00376
G1 X128.832 Y129.953 E.00732
G1 X128.832 Y135.65 E.11817
G1 X122.832 Y135.648 E.12445
G3 X121.483 Y135.42 I.081 J-4.576 E.02848
G1 X121.014 Y135.233 E.01047
G1 X120.422 Y134.892 E.01418
G1 X119.98 Y134.551 E.01157
G1 X120.66 Y134.075 E.01722
G1 X120.882 Y134.247 E.00583
G2 X122.808 Y134.849 I2.062 J-3.218 E.04237
G1 X125.888 Y134.85 E.06387
G1 X126.066 Y134.834 E.00371
G1 X126.506 Y134.643 E.00996
G1 X126.839 Y134.215 E.01125
G1 X126.918 Y133.819 E.00838
G1 X126.918 Y129.953 E.0802
G1 X126.793 Y129.461 E.01052
G2 X128.93 Y129.461 I1.065 J-7.388 E.04448
; WIPE_START
G1 F3600
G1 X128.892 Y129.605 E-.0567
G1 X128.832 Y129.953 E-.13411
G1 X128.832 Y131.45 E-.56919
; WIPE_END
G1 E-.04 F1800
G1 X130.278 Y128.679 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
G1 F1733
G1 X129.572 Y129.385 E.02072
G1 X129.291 Y129.748 E.00952
G1 X129.256 Y129.953 E.00431
G1 X129.256 Y136.074 E.12697
G1 X123.256 Y136.072 E.12445
G3 X121.836 Y135.947 I-.18 J-6.071 E.02963
G3 X119.318 Y134.496 I1.039 J-4.713 E.06123
G1 X120.681 Y133.542 E.0345
G1 X121.19 Y133.939 E.01339
G1 X121.743 Y134.214 E.01281
G1 X122.305 Y134.372 E.01209
G1 X122.809 Y134.425 E.01052
G1 X125.888 Y134.425 E.06386
G1 X126.252 Y134.304 E.00796
G1 X126.448 Y134.052 E.00662
G1 X126.494 Y133.819 E.00493
G1 X126.494 Y130.09 E.07735
G1 X126.432 Y129.685 E.0085
G1 X126.317 Y129.524 E.00411
G1 X125.472 Y128.679 E.02478
G2 X129.33 Y128.963 I2.42 J-6.536 E.08131
G1 X130.221 Y128.696 E.01929
; WIPE_START
G1 F3600
G1 X129.572 Y129.385 E-.35975
G1 X129.291 Y129.748 E-.17432
G1 X129.256 Y129.953 E-.0789
G1 X129.256 Y130.339 E-.14703
; WIPE_END
G1 E-.04 F1800
G1 X122.405 Y133.704 Z2.52 F30000
G1 X120.648 Y134.567 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.407072
G1 F1733
G1 X121.203 Y134.878 E.01188
; LINE_WIDTH: 0.408292
G2 X122.209 Y135.19 I1.75 J-3.858 E.01975
; LINE_WIDTH: 0.401112
G1 X122.808 Y135.248 E.01103
; LINE_WIDTH: 0.400782
G1 X125.888 Y135.249 E.05647
; LINE_WIDTH: 0.422432
G1 X126.137 Y135.238 E.00483
; WIPE_START
G1 F3600
G1 X125.888 Y135.249 E-.09471
G1 X124.137 Y135.249 E-.66529
; WIPE_END
G1 E-.04 F1800
G1 X126.006 Y133.977 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1733
M204 S5000
G1 X126.085 Y133.819 E.0034
G1 X126.085 Y129.953 E.07451
G1 X126.027 Y129.813 E.00292
G1 X124.613 Y128.399 E.03855
G2 X123.987 Y127.831 I-4.478 J4.311 E.01631
; LINE_WIDTH: 0.385992
G1 X123.538 Y127.49 E.00993
; LINE_WIDTH: 0.385782
G3 X121.286 Y123.94 I4.446 J-5.31 E.0752
; LINE_WIDTH: 0.385892
G1 X121.161 Y123.342 E.01076
; LINE_WIDTH: 0.386342
G1 X121.089 Y122.734 E.01078
; LINE_WIDTH: 0.388192
G1 X121.072 Y122.099 E.01125
; LINE_WIDTH: 0.388602
G3 X121.211 Y120.872 I6.801 J.151 E.02195
; LINE_WIDTH: 0.389352
G3 X122.892 Y117.615 I6.672 J1.382 E.06596
; LINE_WIDTH: 0.390442
G3 X123.767 Y116.825 I5.062 J4.724 E.02105
; LINE_WIDTH: 0.388752
G1 X124.404 Y116.399 E.0136
; LINE_WIDTH: 0.385802
G3 X127.286 Y115.473 I3.558 J6.122 E.05369
; LINE_WIDTH: 0.386792
G3 X128.506 Y115.477 I.59 J6.564 E.02158
; LINE_WIDTH: 0.385782
G3 X130.846 Y116.131 I-.63 J6.766 E.043
; LINE_WIDTH: 0.386812
G1 X131.356 Y116.404 E.0102
; LINE_WIDTH: 0.392912
G3 X132.28 Y117.064 I-3.675 J6.12 E.02042
; LINE_WIDTH: 0.391452
G3 X133.136 Y117.935 I-4.48 J5.258 E.02185
; LINE_WIDTH: 0.390832
G3 X133.822 Y118.944 I-5.26 J4.315 E.02181
; LINE_WIDTH: 0.391472
G1 X134.094 Y119.49 E.01091
; LINE_WIDTH: 0.392222
G3 X134.488 Y120.644 I-6.448 J2.845 E.02188
; LINE_WIDTH: 0.389382
G1 X134.596 Y121.187 E.00983
; LINE_WIDTH: 0.389902
G1 X134.67 Y121.898 E.01273
G1 X134.676 Y122.481 E.01039
; LINE_WIDTH: 0.389632
G1 X134.629 Y123.079 E.01067
; LINE_WIDTH: 0.389482
G3 X134.375 Y124.263 I-6.758 J-.83 E.02155
; LINE_WIDTH: 0.389352
G3 X132.028 Y127.638 I-6.607 J-2.09 E.0742
; LINE_WIDTH: 0.398352
G1 X131.567 Y127.985 E.01051
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I131.074 J134.014 E.05006
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.483 E.12588
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
G1 X122.748 Y136.482 E.13333
G3 X118.713 Y134.42 I.187 J-5.345 E.09018
G1 X120.746 Y132.997 E.04782
G1 X120.966 Y133.251 E.00649
G1 X121.376 Y133.574 E.01006
G2 X122.81 Y134.015 I1.611 J-2.687 E.02919
G1 X125.888 Y134.016 E.05933
G1 X125.949 Y133.996 E.00125
; WIPE_START
G1 F1800
M204 S10000
G1 X126.085 Y133.819 E-.08466
G1 X126.085 Y132.042 E-.67534
; WIPE_END
G1 E-.04
G1 X131.315 Y126.483 Z2.52 F30000
G1 X134.21 Y123.406 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.385632
G1 F1733
M204 S5000
G1 X134.198 Y123.487 E.00144
; LINE_WIDTH: 0.385812
G3 X131.823 Y127.341 I-6.323 J-1.237 E.08144
; LINE_WIDTH: 0.392632
G1 X131.387 Y127.653 E.0096
; LINE_WIDTH: 0.419992
G3 X126.921 Y128.639 I-3.517 J-5.323 E.09018
G3 X124.309 Y127.613 I.817 J-5.918 E.05459
; LINE_WIDTH: 0.390592
G1 X123.855 Y127.283 E.01001
; LINE_WIDTH: 0.389352
G3 X123.021 Y126.484 I4.028 J-5.041 E.02057
; LINE_WIDTH: 0.390442
G3 X122.343 Y125.549 I5.218 J-4.5 E.02062
; LINE_WIDTH: 0.389372
G3 X121.532 Y123.375 I5.561 J-3.311 E.04148
; LINE_WIDTH: 0.389032
G1 X121.453 Y122.767 E.0109
; LINE_WIDTH: 0.388292
G1 X121.433 Y122.162 E.01074
; LINE_WIDTH: 0.386432
G3 X121.689 Y120.451 I7.216 J.206 E.03058
; LINE_WIDTH: 0.385762
G3 X123.454 Y117.564 I6.178 J1.795 E.06027
; LINE_WIDTH: 0.386312
G1 X123.927 Y117.158 E.01098
; LINE_WIDTH: 0.389922
G3 X124.999 Y116.486 I4.111 J5.366 E.02256
; LINE_WIDTH: 0.389352
G1 X125.072 Y116.448 E.00147
; LINE_WIDTH: 0.386262
G3 X127.289 Y115.833 I2.803 J5.802 E.04077
; LINE_WIDTH: 0.387312
G1 X127.821 Y115.807 E.00941
; LINE_WIDTH: 0.389522
G3 X128.935 Y115.896 I.022 J6.727 E.01991
; LINE_WIDTH: 0.389362
G3 X131.136 Y116.693 I-1.076 J6.404 E.04183
; LINE_WIDTH: 0.392912
G3 X132.039 Y117.337 I-4.266 J6.941 E.01993
; LINE_WIDTH: 0.391452
G3 X132.849 Y118.16 I-4.391 J5.132 E.02067
; LINE_WIDTH: 0.390832
G3 X133.499 Y119.114 I-4.975 J4.091 E.02064
; LINE_WIDTH: 0.391472
G1 X133.756 Y119.63 E.01031
; LINE_WIDTH: 0.392222
G3 X134.132 Y120.718 I-6.603 J2.888 E.02064
; LINE_WIDTH: 0.389382
G1 X134.236 Y121.227 E.00924
; LINE_WIDTH: 0.388272
G1 X134.299 Y121.763 E.00955
; LINE_WIDTH: 0.385632
G3 X134.278 Y122.915 I-7.197 J.444 E.02029
G1 X134.218 Y123.347 E.00768
; WIPE_START
G1 F1800
M204 S10000
G1 X134.198 Y123.487 E-.05386
G1 X134.061 Y124.049 E-.21967
G1 X133.875 Y124.596 E-.21963
G1 X133.641 Y125.124 E-.21964
G1 X133.581 Y125.233 E-.04721
; WIPE_END
G1 E-.04
G17
G3 Z2.52 I-.824 J-.896 P1  F30000
G1 X128.035 Y130.331 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.346706
G1 F1733
G1 X127.715 Y130.33 E.00502
G1 X127.715 Y133.819 E.05475
G1 X127.693 Y134.155 E.00528
; LINE_WIDTH: 0.380267
G1 X127.639 Y134.369 E.00382
; LINE_WIDTH: 0.422309
G1 X127.584 Y134.582 E.00428
G1 X127.405 Y134.813 E.00566
G1 X127.995 Y134.813 E.01144
; LINE_WIDTH: 0.410297
G1 X128.01 Y134.508 E.00575
; LINE_WIDTH: 0.349374
G2 X128.035 Y133.819 I-14.395 J-.861 E.0109
G1 X128.035 Y130.391 E.05424
; CHANGE_LAYER
; Z_HEIGHT: 2.196
; LAYER_HEIGHT: 0.0760002
; WIPE_START
G1 F18540.188
G1 X128.035 Y132.391 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/145
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.52 I.626 J-1.043 P1  F30000
G1 X122.211 Y128.894 Z2.52
G1 Z2.196
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.268
G1 F7411.492
M73 P47 R11
G1 X124.038 Y128.894 E.07228
G2 X123.62 Y128.483 I-1.311 J.912 E.02333
G1 X122.828 Y127.861 E.03987
G1 X122.211 Y127.238 E.0347
G1 X122.211 Y128.697 E.05777
; WIPE_START
G1 X122.211 Y127.238 E-.55463
G1 X122.591 Y127.622 E-.20537
; WIPE_END
G1 E-.04 F1800
G1 X119.317 Y126 Z2.596 F30000
G1 Z2.196
G1 E.8 F1800
G1 F7411.492
G1 X121.326 Y126 E.07953
G1 X120.732 Y124.685 E.05712
G1 X120.542 Y124.033 E.02687
G1 X120.377 Y123.106 E.03729
G1 X116.423 Y123.106 E.15652
G1 X116.423 Y120.212 E.11456
G1 X120.609 Y120.212 E.16567
G1 X120.89 Y119.392 E.03431
G1 X121.179 Y118.768 E.02722
G1 X121.637 Y118.002 E.03532
G1 X122.163 Y117.317 E.03417
G1 X119.317 Y117.317 E.11265
; WIPE_START
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.211 Y114.423 Z2.596 F30000
G1 Z2.196
G1 E.8 F1800
G1 F7411.492
G1 X133.789 Y114.423 E.45823
G1 X133.789 Y117.317 E.11456
G1 X133.587 Y117.317 E.00799
G1 X133.789 Y117.562 E.01255
G1 X133.789 Y117.514 E.00187
; WIPE_START
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12047
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.883 E-.54484
; WIPE_END
G1 E-.04 F1800
G1 X138.214 Y122.102 Z2.596 F30000
G1 X138.928 Y123.106 Z2.596
G1 Z2.196
G1 E.8 F1800
; FEATURE: Support transition
G1 F1200
G1 X139.577 Y123.106 E.0257
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
G1 X139.577 Y120.211 E.11457
G1 X138.731 Y120.211 E.0335
G1 X138.731 Y123.106 E.11457
G1 X137.837 Y123.106 E.03539
G1 X137.837 Y120.211 E.11457
G1 X136.942 Y120.211 E.03539
G1 X136.942 Y123.106 E.11457
G1 X136.048 Y123.106 E.03539
G1 X136.048 Y120.211 E.11457
G1 X135.154 Y120.211 E.03539
G2 X135.206 Y120.456 I.497 J.023 E.01001
G1 X135.409 Y121.815 E.05437
G1 X135.373 Y123.106 E.05114
G1 X134.519 Y125.828 F30000
; FEATURE: Support
G1 F7411.492
G1 X135.016 Y124.693 E.04903
G1 X135.317 Y123.5 E.04869
G1 X136.683 Y123.5 E.05406
G1 X136.683 Y126 E.09895
G1 X134.424 Y126 E.08943
; WIPE_START
G1 X136.424 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.596 I-.04 J-1.216 P1  F30000
G1 X132.037 Y126.145 Z2.596
G1 Z2.196
G1 E.8 F1800
G1 F7411.492
G3 X123.58 Y126 I-4.163 J-3.894 E.37722
G1 X132.17 Y126 E.34003
G2 X133.512 Y123.106 I-4.411 J-3.803 E.1279
G1 X122.237 Y123.106 E.44626
G3 X122.55 Y120.212 I5.669 J-.851 E.1165
G1 X133.2 Y120.212 E.42154
G2 X130.736 Y117.317 I-5.325 J2.037 E.15339
G1 X125.014 Y117.317 E.2265
G3 X125.351 Y117.137 I2.9 J5.003 E.01513
G1 X125.485 Y117.072 E.0059
; CHANGE_LAYER
; Z_HEIGHT: 2.24
; LAYER_HEIGHT: 0.0439999
; WIPE_START
G1 X125.351 Y117.137 E-.05669
G1 X125.014 Y117.317 E-.1452
G1 X126.483 Y117.317 E-.55812
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/145
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.596 I-1.217 J.027 P1  F30000
G1 X126.872 Y134.886 Z2.596
G1 Z2.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X127.248 Y134.374 E.01318
G1 X127.343 Y133.858 E.01088
G1 X127.343 Y131.858 E.04148
G2 X127.342 Y129.945 I-1965.604 J-.679 E.03969
G1 X127.35 Y129.945 E.00016
G2 X128.407 Y129.953 I.58 J-7.54 E.02194
G1 X128.407 Y135.186 E.10855
G1 X126.377 Y135.185 E.04211
G1 X126.785 Y135.004 E.00927
G1 X126.836 Y134.934 E.00178
G1 X126.581 Y134.592 F30000
G1 F3600
G1 X126.852 Y134.224 E.00947
G1 X126.918 Y133.858 E.00771
G1 X126.918 Y131.858 E.04148
G2 X126.916 Y129.878 I-197.354 J-.723 E.04107
G1 X126.756 Y129.452 E.00945
G2 X128.983 Y129.455 I1.122 J-7.145 E.04639
G1 X128.845 Y129.789 E.00751
G1 X128.832 Y129.953 E.0034
G1 X128.832 Y135.61 E.11735
G1 X126.848 Y135.61 E.04115
; LINE_WIDTH: 0.499366
G1 X126.528 Y135.585 E.00743
; LINE_WIDTH: 0.548739
G1 X126.208 Y135.56 E.00821
; LINE_WIDTH: 0.598112
G1 X125.887 Y135.535 E.00898
G1 X122.709 Y135.528 E.08894
; LINE_WIDTH: 0.605332
G3 X121.654 Y135.355 I.193 J-4.499 E.03037
; LINE_WIDTH: 0.605662
G3 X120.631 Y134.896 I1.325 J-4.315 E.03187
; LINE_WIDTH: 0.601382
G1 X120.135 Y134.534 E.01728
G1 X120.63 Y134.188 E.01701
G1 X121.062 Y134.485 E.01474
; LINE_WIDTH: 0.601002
G1 X121.696 Y134.769 E.01956
; LINE_WIDTH: 0.605332
G2 X122.807 Y134.962 I1.419 J-4.862 E.03202
; LINE_WIDTH: 0.598142
G1 X125.888 Y134.963 E.08621
; LINE_WIDTH: 0.608652
G1 X126.079 Y134.952 E.00548
G1 X126.19 Y134.881 E.00375
; LINE_WIDTH: 0.568987
G1 X126.301 Y134.811 E.00349
; LINE_WIDTH: 0.529322
G1 X126.412 Y134.74 E.00324
; LINE_WIDTH: 0.489657
G1 X126.523 Y134.67 E.00298
; LINE_WIDTH: 0.449992
G1 X126.545 Y134.64 E.00076
; WIPE_START
G1 X126.852 Y134.224 E-.19636
G1 X126.918 Y133.858 E-.14118
G1 X126.918 Y132.747 E-.42246
; WIPE_END
G1 E-.04 F1800
G1 X130.264 Y128.691 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
G1 F3600
G2 X129.37 Y129.598 I45.571 J45.806 E.0264
G1 X129.256 Y129.953 E.00773
G1 X129.256 Y136.035 E.12615
G1 X123.256 Y136.033 E.12445
G3 X121.222 Y135.731 I-.222 J-5.492 E.04289
G1 X120.596 Y135.453 E.01422
G3 X119.354 Y134.471 I2.372 J-4.277 E.03298
G3 X120.658 Y133.574 I20.992 J29.112 E.03285
G1 X121.271 Y134.031 E.01586
G1 X121.949 Y134.325 E.01534
G1 X122.808 Y134.464 E.01804
G1 X125.992 Y134.456 E.06605
G1 X126.262 Y134.336 E.00612
G1 X126.455 Y134.073 E.00675
G1 X126.494 Y133.858 E.00453
G1 X126.494 Y131.858 E.04148
G2 X126.486 Y129.855 I-70.542 J-.723 E.04156
G1 X126.324 Y129.531 E.00751
G3 X125.486 Y128.691 I158.989 J-159.38 E.02461
G2 X130.207 Y128.711 I2.388 J-6.547 E.0999
; WIPE_START
G1 X129.37 Y129.598 E-.46329
G1 X129.256 Y129.953 E-.14167
G1 X129.256 Y130.361 E-.15504
; WIPE_END
G1 E-.04 F1800
G1 X126.009 Y134.014 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X126.085 Y133.858 E.00333
G1 X126.085 Y129.953 E.07529
G1 X126.03 Y129.816 E.00285
G2 X124.105 Y127.915 I-53.446 J52.179 E.05214
; LINE_WIDTH: 0.391202
G1 X123.627 Y127.565 E.01059
; LINE_WIDTH: 0.390852
G1 X123.167 Y127.162 E.01091
; LINE_WIDTH: 0.391492
G1 X122.746 Y126.72 E.01091
; LINE_WIDTH: 0.392172
G3 X122.008 Y125.695 I5.202 J-4.523 E.02266
; LINE_WIDTH: 0.390612
G1 X121.694 Y125.089 E.01218
; LINE_WIDTH: 0.385782
G3 X121.286 Y123.94 I6.148 J-2.826 E.0215
; LINE_WIDTH: 0.385992
G1 X121.16 Y123.34 E.01079
; LINE_WIDTH: 0.388132
G1 X121.086 Y122.713 E.01119
; LINE_WIDTH: 0.388832
G1 X121.072 Y122.069 E.01144
; LINE_WIDTH: 0.389062
G3 X121.211 Y120.874 I6.817 J.182 E.0214
; LINE_WIDTH: 0.389362
G3 X122.892 Y117.615 I6.673 J1.381 E.066
; LINE_WIDTH: 0.390502
G3 X123.8 Y116.8 I5.057 J4.719 E.02179
; LINE_WIDTH: 0.389972
G1 X124.405 Y116.399 E.01292
; LINE_WIDTH: 0.385792
G3 X127.281 Y115.473 I3.559 J6.125 E.05361
; LINE_WIDTH: 0.396432
G3 X128.392 Y115.465 I.613 J7.598 E.02015
; LINE_WIDTH: 0.390482
G3 X129.595 Y115.666 I-.542 J6.934 E.02178
; LINE_WIDTH: 0.389362
G3 X131.285 Y116.361 I-2.045 J7.375 E.03256
; LINE_WIDTH: 0.390452
G3 X132.313 Y117.092 I-3.46 J5.954 E.02253
; LINE_WIDTH: 0.389652
G3 X133.502 Y118.423 I-5.088 J5.743 E.03183
; LINE_WIDTH: 0.388922
G1 X133.876 Y119.045 E.01288
; LINE_WIDTH: 0.385782
G3 X134.512 Y120.759 I-6.779 J3.492 E.03226
; LINE_WIDTH: 0.390072
G3 X134.669 Y121.872 I-6.393 J1.473 E.02005
; LINE_WIDTH: 0.388942
G1 X134.672 Y121.967 E.00168
; LINE_WIDTH: 0.386092
G3 X134.613 Y123.184 I-6.764 J.284 E.02151
; LINE_WIDTH: 0.385942
G1 X134.502 Y123.784 E.01074
; LINE_WIDTH: 0.385812
G3 X132.297 Y127.418 I-6.721 J-1.593 E.07607
; LINE_WIDTH: 0.386882
G1 X131.86 Y127.765 E.00985
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.0107
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I129.066 J131.157 E.0462
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.444 E.12512
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
G1 X122.809 Y136.442 E.13216
G3 X121.348 Y136.21 I.367 J-7.029 E.02856
G3 X119.393 Y135.099 I1.518 J-4.944 E.04369
G1 X118.748 Y134.396 E.0184
G1 X120.711 Y133.021 E.04619
G1 X120.911 Y133.252 E.00589
G1 X121.442 Y133.659 E.0129
G1 X122.03 Y133.924 E.01242
G1 X122.809 Y134.055 E.01523
G1 X125.888 Y134.056 E.05934
G1 X125.953 Y134.033 E.00132
; WIPE_START
M204 S10000
G1 X126.085 Y133.858 E-.08328
G1 X126.085 Y132.078 E-.67672
; WIPE_END
G1 E-.04
G1 X131.294 Y126.499 Z2.64 F30000
G1 X134.211 Y123.375 Z2.64
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.389312
M204 S5000
G1 X134.169 Y123.595 E.00398
G3 X133.834 Y124.697 I-7.088 J-1.554 E.02049
; LINE_WIDTH: 0.389632
G3 X133.301 Y125.722 I-6.185 J-2.563 E.02058
; LINE_WIDTH: 0.389352
G3 X132.593 Y126.635 I-5.441 J-3.485 E.02056
; LINE_WIDTH: 0.390482
G3 X131.733 Y127.409 I-5.049 J-4.751 E.02066
; LINE_WIDTH: 0.410332
G1 X131.193 Y127.787 E.01239
; LINE_WIDTH: 0.419992
G3 X124.572 Y127.797 I-3.319 J-5.528 E.13402
; LINE_WIDTH: 0.412802
G1 X124.095 Y127.466 E.01098
; LINE_WIDTH: 0.384942
G1 X123.643 Y127.106 E.01015
; LINE_WIDTH: 0.384532
G1 X123.224 Y126.707 E.01014
; LINE_WIDTH: 0.384852
G3 X122.4 Y125.645 I4.714 J-4.507 E.02365
; LINE_WIDTH: 0.389982
G3 X121.842 Y124.508 I5.699 J-3.501 E.02258
; LINE_WIDTH: 0.389382
G3 X121.528 Y123.356 I6.134 J-2.291 E.02125
; LINE_WIDTH: 0.388642
G1 X121.451 Y122.739 E.01103
; LINE_WIDTH: 0.386472
G1 X121.433 Y122.162 E.0102
; LINE_WIDTH: 0.386082
G1 X121.467 Y121.584 E.01019
; LINE_WIDTH: 0.386482
G3 X121.689 Y120.451 I6.318 J.649 E.0204
; LINE_WIDTH: 0.385772
G3 X123.927 Y117.159 I6.297 J1.874 E.07119
; LINE_WIDTH: 0.389952
G3 X124.999 Y116.486 I4.101 J5.346 E.02257
; LINE_WIDTH: 0.389342
G1 X125.084 Y116.443 E.00171
; LINE_WIDTH: 0.386272
G3 X127.289 Y115.833 I2.79 J5.804 E.04054
G1 X128.247 Y115.818 E.01688
; LINE_WIDTH: 0.385932
G1 X128.779 Y115.871 E.00942
; LINE_WIDTH: 0.385792
G3 X131.457 Y116.895 I-.99 J6.603 E.05087
; LINE_WIDTH: 0.385412
G1 X131.96 Y117.268 E.011
; LINE_WIDTH: 0.385912
G3 X132.784 Y118.078 I-4.027 J4.927 E.02038
; LINE_WIDTH: 0.386822
G1 X133.167 Y118.575 E.01107
; LINE_WIDTH: 0.389832
G3 X133.762 Y119.635 I-5.552 J3.813 E.02168
; LINE_WIDTH: 0.389342
G3 X134.134 Y120.728 I-5.887 J2.614 E.02055
; LINE_WIDTH: 0.390072
G3 X134.307 Y121.89 I-6.623 J1.58 E.02096
; LINE_WIDTH: 0.389032
G1 X134.313 Y122.468 E.01026
; LINE_WIDTH: 0.389202
G1 X134.269 Y123.034 E.01009
; LINE_WIDTH: 0.389312
G1 X134.221 Y123.316 E.00508
; WIPE_START
M204 S10000
G1 X134.169 Y123.595 E-.10787
G1 X134.029 Y124.153 E-.21849
G1 X133.834 Y124.697 E-.21956
G1 X133.594 Y125.207 E-.21408
; WIPE_END
G1 E-.04
G17
G3 Z2.64 I-.824 J-.895 P1  F30000
G1 X128.035 Y130.327 Z2.64
G1 Z2.24
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345922
G1 F18740.045
G1 X127.715 Y130.327 E.00501
G1 X127.715 Y133.858 E.05528
; LINE_WIDTH: 0.361165
G1 F17888.421
G1 X127.673 Y134.179 E.00531
; LINE_WIDTH: 0.400811
G1 F15997.506
G1 X127.63 Y134.5 E.00593
G1 X127.443 Y134.78 E.00617
G1 X128.002 Y134.78 E.01024
G1 X128.026 Y134.236 E.00999
; LINE_WIDTH: 0.346834
G1 F18686.826
G1 X128.035 Y130.387 E.06043
; CHANGE_LAYER
; Z_HEIGHT: 2.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18686.826
G1 X128.03 Y132.387 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/145
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.64 I-1.11 J-.499 P1  F30000
G1 X126.894 Y134.916 Z2.64
G1 Z2.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1629
G1 X127.269 Y134.367 E.0138
G1 X127.343 Y133.909 E.00961
G1 X127.343 Y131.909 E.04148
G2 X127.341 Y129.942 I-319.952 J-.708 E.04082
G2 X128.407 Y129.953 I.686 J-13.767 E.02212
G1 X128.407 Y135.135 E.10747
G1 X126.589 Y135.134 E.03771
G1 X126.817 Y135.029 E.00521
G1 X126.86 Y134.966 E.00158
G1 X126.597 Y134.628 F30000
G1 F1629
G1 X126.866 Y134.234 E.0099
G1 X126.918 Y133.909 E.00681
G1 X126.918 Y130.171 E.07754
G1 X126.871 Y129.643 E.01099
G1 X126.772 Y129.453 E.00446
G2 X128.957 Y129.461 I1.121 J-7.026 E.04551
G1 X128.832 Y129.953 E.01052
G1 X128.832 Y135.559 E.11629
G1 X126.855 Y135.559 E.04099
; LINE_WIDTH: 0.498507
G1 X126.371 Y135.534 E.0112
; LINE_WIDTH: 0.547022
G1 X125.887 Y135.51 E.01235
G1 X122.808 Y135.509 E.07849
G1 X122.615 Y135.493 E.00492
; LINE_WIDTH: 0.544892
G1 X122.048 Y135.421 E.01452
; LINE_WIDTH: 0.550802
G3 X120.543 Y134.806 I.999 J-4.596 E.04193
; LINE_WIDTH: 0.545622
G1 X120.132 Y134.503 E.013
G1 X120.579 Y134.189 E.01388
; LINE_WIDTH: 0.546052
G1 X120.734 Y134.314 E.00505
; LINE_WIDTH: 0.550762
G2 X122.806 Y134.988 I2.218 J-3.298 E.05666
; LINE_WIDTH: 0.547072
G1 X125.888 Y134.989 E.07855
; LINE_WIDTH: 0.557162
G2 X126.232 Y134.886 I.071 J-.392 E.00969
; LINE_WIDTH: 0.521439
G1 X126.389 Y134.794 E.00441
; LINE_WIDTH: 0.485716
G1 X126.546 Y134.702 E.00409
; LINE_WIDTH: 0.449992
G1 X126.563 Y134.677 E.00063
; WIPE_START
G1 F3600
G1 X126.866 Y134.234 E-.20422
G1 X126.918 Y133.909 E-.12474
G1 X126.918 Y132.775 E-.43104
; WIPE_END
G1 E-.04 F1800
G1 X130.264 Y128.691 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
G1 F1629
G2 X129.344 Y129.637 I31.345 J31.381 E.02738
G1 X129.256 Y129.953 E.00679
G1 X129.256 Y135.983 E.12509
G1 X123.256 Y135.982 E.12445
G3 X120.769 Y135.488 I-.242 J-5.285 E.0531
G1 X120.169 Y135.132 E.01447
G3 X119.389 Y134.446 I2.656 J-3.803 E.02158
G3 X120.608 Y133.599 I49.49 J69.869 E.03079
G1 X121.063 Y133.964 E.01209
G1 X121.646 Y134.274 E.0137
G1 X122.302 Y134.456 E.01413
G1 X122.807 Y134.515 E.01054
G1 X125.888 Y134.516 E.0639
G1 X125.992 Y134.507 E.00218
G1 X126.275 Y134.376 E.00646
G1 X126.463 Y134.1 E.00693
G1 X126.494 Y133.909 E.00401
G1 X126.494 Y130.337 E.07411
G1 X126.466 Y129.771 E.01175
G1 X126.317 Y129.524 E.00599
G1 X125.472 Y128.679 E.02478
G2 X130.208 Y128.711 I2.412 J-6.444 E.10028
; WIPE_START
G1 F3600
G1 X129.344 Y129.637 E-.48124
G1 X129.256 Y129.953 E-.12441
G1 X129.256 Y130.359 E-.15435
; WIPE_END
G1 E-.04 F1800
G1 X126.014 Y134.061 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1629
M204 S5000
G1 X126.085 Y133.909 E.00323
G1 X126.085 Y129.953 E.07627
G1 X126.027 Y129.813 E.00291
G1 X124.613 Y128.399 E.03855
G2 X124.024 Y127.858 I-4.767 J4.602 E.01541
; LINE_WIDTH: 0.386392
G1 X123.538 Y127.49 E.01075
; LINE_WIDTH: 0.385772
G3 X122.268 Y126.1 I4.881 J-5.731 E.03323
; LINE_WIDTH: 0.385472
G1 X121.879 Y125.458 E.01321
; LINE_WIDTH: 0.384542
G3 X121.135 Y123.144 I5.962 J-3.192 E.04287
; LINE_WIDTH: 0.384682
G1 X121.08 Y122.535 E.01074
; LINE_WIDTH: 0.385272
G1 X121.081 Y121.924 E.01074
; LINE_WIDTH: 0.385652
G3 X121.41 Y120.132 I7.711 J.491 E.03213
; LINE_WIDTH: 0.390532
G3 X121.839 Y119.108 I6.258 J2.02 E.01982
; LINE_WIDTH: 0.392472
G1 X122.146 Y118.58 E.01096
; LINE_WIDTH: 0.392902
G3 X122.892 Y117.616 I5.939 J3.821 E.02192
; LINE_WIDTH: 0.389352
G1 X123.328 Y117.187 E.01086
; LINE_WIDTH: 0.389922
G3 X124.404 Y116.398 I4.505 J5.017 E.0238
; LINE_WIDTH: 0.386372
G1 X124.943 Y116.112 E.01076
; LINE_WIDTH: 0.385792
G3 X127.281 Y115.473 I2.935 J6.148 E.0429
; LINE_WIDTH: 0.396432
G3 X128.392 Y115.465 I.613 J7.597 E.02015
; LINE_WIDTH: 0.390532
G3 X129.595 Y115.666 I-.543 J6.94 E.02178
; LINE_WIDTH: 0.389362
G3 X130.743 Y116.079 I-1.72 J6.586 E.02172
; LINE_WIDTH: 0.389552
M73 P48 R11
G3 X131.799 Y116.69 I-2.901 J6.232 E.02173
; LINE_WIDTH: 0.389352
G3 X132.728 Y117.48 I-3.953 J5.591 E.0217
; LINE_WIDTH: 0.389552
G3 X133.502 Y118.423 I-4.907 J4.817 E.02174
; LINE_WIDTH: 0.389362
G3 X134.594 Y121.167 I-5.926 J3.946 E.05288
; LINE_WIDTH: 0.389042
G1 X134.655 Y121.67 E.00899
G1 X134.66 Y121.764 E.00167
; LINE_WIDTH: 0.386452
G3 X134.638 Y122.983 I-6.644 J.49 E.02153
; LINE_WIDTH: 0.386122
G1 X134.545 Y123.586 E.01075
; LINE_WIDTH: 0.385982
G1 X134.398 Y124.178 E.01075
; LINE_WIDTH: 0.385772
G3 X133.65 Y125.844 I-7.273 J-2.267 E.03223
; LINE_WIDTH: 0.386172
G1 X133.305 Y126.349 E.01076
; LINE_WIDTH: 0.386392
G1 X132.912 Y126.822 E.01084
G1 X132.337 Y127.382 E.01415
; LINE_WIDTH: 0.384932
G1 X131.86 Y127.761 E.01071
; LINE_WIDTH: 0.412662
G1 X131.42 Y128.121 E.01075
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I128.679 J130.771 E.04621
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.393 E.12414
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
G1 X122.75 Y136.391 E.13328
G1 X122.017 Y136.32 E.01421
G1 X121.285 Y136.14 E.01453
G1 X120.587 Y135.855 E.01453
G1 X119.937 Y135.47 E.01455
G3 X118.793 Y134.365 I3.236 J-4.494 E.03078
G1 X120.669 Y133.05 E.04416
G1 X120.871 Y133.285 E.00595
G1 X121.261 Y133.606 E.00974
G1 X121.772 Y133.885 E.01123
G1 X122.253 Y134.037 E.00972
G1 X122.808 Y134.106 E.01078
G1 X125.888 Y134.107 E.05937
G1 X125.957 Y134.081 E.00143
; WIPE_START
G1 F1800
M204 S10000
G1 X126.085 Y133.909 E-.08139
G1 X126.085 Y132.124 E-.67861
; WIPE_END
G1 E-.04
G1 X131.279 Y126.531 Z2.76 F30000
G1 X134.217 Y123.367 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.389182
G1 F1629
M204 S5000
G1 X134.21 Y123.417 E.0009
; LINE_WIDTH: 0.389362
G3 X133.058 Y126.076 I-6.602 J-1.281 E.05194
; LINE_WIDTH: 0.388372
G1 X132.694 Y126.525 E.01025
; LINE_WIDTH: 0.392922
G3 X131.889 Y127.284 I-5.934 J-5.486 E.01988
; LINE_WIDTH: 0.391182
G1 X131.436 Y127.615 E.01001
; LINE_WIDTH: 0.419992
G3 X127.69 Y128.707 I-3.552 J-5.212 E.07646
G3 X124.308 Y127.614 I.161 J-6.28 E.06948
; LINE_WIDTH: 0.389472
G3 X123.419 Y126.902 I3.624 J-5.429 E.02027
; LINE_WIDTH: 0.389352
G1 X123.021 Y126.484 E.01026
; LINE_WIDTH: 0.390552
G1 X122.663 Y126.031 E.0103
; LINE_WIDTH: 0.392472
G3 X122.073 Y125.043 I5.861 J-4.165 E.02065
; LINE_WIDTH: 0.390852
G1 X121.847 Y124.512 E.0103
; LINE_WIDTH: 0.391512
G3 X121.533 Y123.369 I6.343 J-2.352 E.02123
; LINE_WIDTH: 0.390362
G1 X121.45 Y122.696 E.01209
; LINE_WIDTH: 0.390052
G1 X121.436 Y122.084 E.01091
; LINE_WIDTH: 0.389762
G1 X121.478 Y121.494 E.01051
; LINE_WIDTH: 0.389912
G3 X121.722 Y120.345 I6.603 J.797 E.02094
; LINE_WIDTH: 0.390532
G3 X122.161 Y119.28 I6.4 J2.016 E.02057
; LINE_WIDTH: 0.392472
G1 X122.452 Y118.783 E.01034
; LINE_WIDTH: 0.392902
G3 X123.149 Y117.873 I6.124 J3.97 E.0206
; LINE_WIDTH: 0.389352
G1 X123.561 Y117.466 E.01029
; LINE_WIDTH: 0.389922
G3 X124.534 Y116.742 I4.476 J4.994 E.02162
; LINE_WIDTH: 0.389372
G3 X125.527 Y116.252 I3.387 J5.611 E.01971
; LINE_WIDTH: 0.389362
G3 X127.207 Y115.843 I2.539 J6.782 E.03082
; LINE_WIDTH: 0.396432
G3 X128.352 Y115.826 I.74 J11.141 E.02075
; LINE_WIDTH: 0.390532
G3 X129.49 Y116.014 I-.56 J6.92 E.0206
; LINE_WIDTH: 0.389362
G3 X130.578 Y116.403 I-1.617 J6.241 E.02056
; LINE_WIDTH: 0.389552
G3 X131.542 Y116.952 I-2.833 J6.091 E.01975
; LINE_WIDTH: 0.386882
G1 X131.961 Y117.268 E.00928
; LINE_WIDTH: 0.385782
G3 X132.784 Y118.077 I-4.089 J4.984 E.02034
; LINE_WIDTH: 0.386882
G3 X133.451 Y119.021 I-4.914 J4.176 E.02043
; LINE_WIDTH: 0.385802
G3 X134.108 Y120.621 I-6.323 J3.535 E.03052
; LINE_WIDTH: 0.386832
G1 X134.23 Y121.186 E.0102
; LINE_WIDTH: 0.389042
G3 X134.289 Y122.854 I-7.366 J1.094 E.02971
; LINE_WIDTH: 0.389182
G1 X134.225 Y123.307 E.00812
; WIPE_START
G1 F1800
M204 S10000
G1 X134.21 Y123.417 E-.04198
G1 X134.083 Y123.968 E-.2151
G1 X133.904 Y124.518 E-.21983
G1 X133.676 Y125.049 E-.21945
G1 X133.597 Y125.196 E-.06364
; WIPE_END
G1 E-.04
G17
G3 Z2.76 I-.825 J-.894 P1  F30000
G1 X128.035 Y130.33 Z2.76
G1 Z2.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.34871
G1 F1629
G1 X127.715 Y130.331 E.00506
G1 X127.715 Y133.909 E.0565
G1 X127.65 Y134.463 E.00879
; LINE_WIDTH: 0.384991
G1 X127.489 Y134.736 E.00558
G1 X128.009 Y134.737 E.00914
G1 X128.034 Y133.961 E.01363
; LINE_WIDTH: 0.345937
G1 X128.035 Y130.39 E.0559
; CHANGE_LAYER
; Z_HEIGHT: 2.464
; LAYER_HEIGHT: 0.104
; WIPE_START
G1 F18739.179
G1 X128.035 Y132.39 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/145
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.76 I.626 J-1.043 P1  F30000
G1 X122.211 Y128.894 Z2.76
G1 Z2.464
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.268
G1 F7411.492
G1 X124.038 Y128.894 E.07228
G2 X123.587 Y128.46 I-1.39 J.99 E.02493
G1 X122.828 Y127.861 E.03826
G1 X122.211 Y127.238 E.0347
G1 X122.211 Y128.697 E.05777
; WIPE_START
G1 X122.211 Y127.238 E-.55464
G1 X122.591 Y127.622 E-.20536
; WIPE_END
G1 E-.04 F1800
G1 X119.317 Y126 Z2.864 F30000
G1 Z2.464
G1 E.8 F1800
G1 F7411.492
G1 X121.326 Y126 E.07953
G1 X120.734 Y124.693 E.0568
G1 X120.433 Y123.5 E.0487
G1 X119.317 Y123.5 E.04415
G1 X119.317 Y125.803 E.09114
G1 X120.149 Y123.106 F30000
; FEATURE: Support transition
G1 F1200
G1 X120.378 Y123.106 E.00905
G1 X120.329 Y122.111 E.03944
G1 X120.392 Y121.27 E.03337
G3 X120.609 Y120.211 I7.736 J1.033 E.04281
G1 X119.952 Y120.211 E.026
G1 X119.952 Y123.106 E.11457
G1 X119.058 Y123.106 E.03539
G1 X119.058 Y120.211 E.11457
G1 X118.163 Y120.211 E.03539
G1 X118.163 Y123.106 E.11457
G1 X117.269 Y123.106 E.03539
G1 X117.269 Y120.211 E.11457
G1 X116.423 Y120.211 E.03349
G1 X116.423 Y123.106 E.11457
G1 X117.072 Y123.106 E.02569
; WIPE_START
G1 X116.423 Y123.106 E-.24666
G1 X116.423 Y121.755 E-.51334
; WIPE_END
G1 E-.04 F1800
G1 X119.317 Y117.514 Z2.864 F30000
G1 Z2.464
G1 E.8 F1800
; FEATURE: Support
G1 F7411.492
G1 X119.317 Y119.817 E.09114
G1 X120.731 Y119.817 E.05595
G1 X121.286 Y118.569 E.05407
G1 X121.642 Y117.995 E.02673
G1 X122.163 Y117.317 E.03385
G1 X119.317 Y117.317 E.11265
; WIPE_START
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.211 Y114.423 Z2.864 F30000
G1 Z2.464
G1 E.8 F1800
G1 F7411.492
G1 X133.789 Y114.423 E.45823
G1 X133.789 Y117.317 E.11456
G1 X133.587 Y117.317 E.00799
G1 X133.789 Y117.562 E.01255
G1 X133.789 Y117.514 E.00187
; WIPE_START
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12046
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.883 E-.54485
; WIPE_END
G1 E-.04 F1800
G1 X135.154 Y120.034 Z2.864 F30000
G1 Z2.464
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G2 X135.206 Y120.457 I.839 J.111 E.01704
G1 X135.41 Y121.821 E.05459
G1 X135.373 Y123.106 E.0509
G1 X136.048 Y123.106 E.02673
G1 X136.048 Y120.211 E.11457
G1 X136.942 Y120.211 E.03539
G1 X136.942 Y123.106 E.11457
G1 X137.837 Y123.106 E.03539
G1 X137.837 Y120.211 E.11457
G1 X138.731 Y120.211 E.03539
G1 X138.731 Y123.283 E.12159
; WIPE_START
G1 X138.731 Y121.283 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.519 Y125.828 Z2.864 F30000
G1 Z2.464
G1 E.8 F1800
; FEATURE: Support
G1 F7411.492
G1 X135.016 Y124.693 E.04903
G1 X135.317 Y123.5 E.04869
G1 X136.683 Y123.5 E.05406
G1 X136.683 Y126 E.09895
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
G1 X134.424 Y126 E.08943
; WIPE_START
G1 X136.424 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.864 I-.04 J-1.216 P1  F30000
G1 X132.037 Y126.145 Z2.864
G1 Z2.464
G1 E.8 F1800
G1 F7411.492
G3 X123.641 Y126.07 I-4.163 J-3.895 E.37354
G1 X123.58 Y126 E.0037
G1 X132.17 Y126 E.34003
G2 X133.169 Y124.368 I-4.3 J-3.754 E.07608
G1 X133.179 Y124.344 E.00105
G2 X133.512 Y123.113 I-5.413 J-2.121 E.05058
G1 X122.237 Y123.106 E.44624
G3 X122.549 Y120.212 I5.683 J-.851 E.11649
G1 X133.2 Y120.212 E.42158
G1 X133.127 Y120.029 E.00779
G2 X130.821 Y117.368 I-5.26 J2.228 E.14169
G1 X130.736 Y117.317 E.0039
G1 X125.014 Y117.317 E.2265
G3 X125.485 Y117.072 I2.766 J4.75 E.02103
; CHANGE_LAYER
; Z_HEIGHT: 2.48
; LAYER_HEIGHT: 0.016
; WIPE_START
G1 X125.014 Y117.317 E-.20185
G1 X126.483 Y117.317 E-.55816
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/145
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.864 I-1.217 J.03 P1  F30000
G1 X126.923 Y134.953 Z2.864
G1 Z2.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X127.292 Y134.354 E.01458
G1 X127.343 Y133.974 E.00797
G1 X127.343 Y131.974 E.04148
G2 X127.341 Y129.941 I-328.492 J-.74 E.04215
G2 X128.403 Y129.953 I.67 J-13.348 E.02203
G1 X128.407 Y135.071 E.10616
G1 X126.832 Y135.07 E.03267
G1 X126.859 Y135.057 E.00061
G1 X126.892 Y135.004 E.0013
G1 X126.618 Y134.672 F30000
G1 F3600
G1 X126.883 Y134.243 E.01044
G1 X126.918 Y133.974 E.00564
G1 X126.918 Y130.171 E.07888
G1 X126.87 Y129.641 E.01104
G1 X126.771 Y129.455 E.00438
G1 X126.992 Y129.488 E.00463
G2 X129.004 Y129.449 I.858 J-7.638 E.04187
G1 X128.832 Y129.938 E.01076
G1 X128.832 Y135.495 E.11527
G1 X126.863 Y135.494 E.04082
; LINE_WIDTH: 0.482792
G2 X122.717 Y135.471 I-6.364 J755.436 E.09265
; LINE_WIDTH: 0.490062
G3 X121.575 Y135.271 I.223 J-4.639 E.02641
; LINE_WIDTH: 0.491382
G3 X120.588 Y134.803 I1.536 J-4.512 E.02492
; LINE_WIDTH: 0.487802
G1 X120.142 Y134.46 E.0127
G1 X120.534 Y134.186 E.01082
G1 X121.015 Y134.523 E.01328
; LINE_WIDTH: 0.481882
G1 X121.701 Y134.833 E.01679
; LINE_WIDTH: 0.490062
G2 X122.804 Y135.02 I1.457 J-5.247 E.02544
; LINE_WIDTH: 0.482862
G1 X125.888 Y135.021 E.06891
; LINE_WIDTH: 0.492452
G1 X126.069 Y135.01 E.00416
G1 X126.576 Y134.741 E.01307
; LINE_WIDTH: 0.449992
G1 X126.587 Y134.723 E.00044
; WIPE_START
G1 X126.883 Y134.243 E-.21415
G1 X126.918 Y133.974 E-.10337
G1 X126.918 Y132.809 E-.44248
; WIPE_END
G1 E-.04 F1800
G1 X130.264 Y128.691 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
G1 F3600
G3 X129.433 Y129.524 I-157.224 J-155.995 E.02439
G1 X129.256 Y129.944 E.00946
G1 X129.256 Y135.919 E.12394
G1 X123.256 Y135.918 E.12445
G3 X120.923 Y135.491 I-.241 J-5.266 E.04961
G3 X119.444 Y134.408 I2.151 J-4.49 E.03824
G1 X120.521 Y133.654 E.02727
G1 X120.577 Y133.655 E.00115
G1 X121.199 Y134.124 E.01616
G1 X121.914 Y134.435 E.01616
G1 X122.805 Y134.579 E.01873
G1 X125.888 Y134.58 E.06394
G1 X125.992 Y134.571 E.00218
G1 X126.292 Y134.425 E.00692
G1 X126.473 Y134.132 E.00714
G1 X126.494 Y133.974 E.00332
G1 X126.494 Y130.337 E.07544
G1 X126.466 Y129.769 E.01178
G1 X126.317 Y129.524 E.00596
G1 X125.472 Y128.679 E.02479
G2 X128.322 Y129.103 I2.435 J-6.567 E.0602
G1 X129.144 Y129 E.01718
G2 X130.207 Y128.712 I-1.291 J-6.879 E.02288
; WIPE_START
G1 X129.433 Y129.524 E-.42637
G1 X129.256 Y129.944 E-.17329
G1 X129.256 Y130.366 E-.16033
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.88 I.994 J.702 P1  F30000
G1 X134.218 Y123.332 Z2.88
G1 Z2.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389502
M204 S5000
G1 X134.176 Y123.586 E.00457
; LINE_WIDTH: 0.389392
G3 X133.838 Y124.687 I-6.293 J-1.333 E.02051
; LINE_WIDTH: 0.389692
G3 X133.307 Y125.712 I-6.219 J-2.57 E.02057
; LINE_WIDTH: 0.389362
G1 X132.975 Y126.185 E.01027
; LINE_WIDTH: 0.390652
G3 X132.179 Y127.041 I-5.487 J-4.301 E.02088
; LINE_WIDTH: 0.389972
G1 X131.732 Y127.409 E.01031
; LINE_WIDTH: 0.410332
G1 X131.193 Y127.787 E.01237
; LINE_WIDTH: 0.419992
G3 X128.273 Y128.697 I-3.369 J-5.667 E.0595
G3 X124.41 Y127.689 I-.376 J-6.463 E.07822
; LINE_WIDTH: 0.398362
G1 X123.94 Y127.351 E.01054
; LINE_WIDTH: 0.385942
G1 X123.499 Y126.978 E.01019
; LINE_WIDTH: 0.385772
G3 X122.399 Y125.643 I4.971 J-5.215 E.03052
; LINE_WIDTH: 0.385932
G1 X122.116 Y125.139 E.01017
; LINE_WIDTH: 0.386952
G1 X121.861 Y124.56 E.01117
; LINE_WIDTH: 0.389812
G3 X121.528 Y123.352 I6.404 J-2.417 E.02234
; LINE_WIDTH: 0.388562
G1 X121.52 Y123.313 E.00071
; LINE_WIDTH: 0.386812
G1 X121.45 Y122.739 E.0102
; LINE_WIDTH: 0.386672
G1 X121.433 Y122.162 E.0102
; LINE_WIDTH: 0.386122
G1 X121.467 Y121.584 E.01019
; LINE_WIDTH: 0.386602
G3 X121.689 Y120.451 I6.308 J.647 E.02041
; LINE_WIDTH: 0.385792
G3 X123.928 Y117.158 I6.297 J1.874 E.07122
; LINE_WIDTH: 0.389952
G3 X124.999 Y116.486 I4.102 J5.352 E.02254
; LINE_WIDTH: 0.389362
G3 X127.207 Y115.843 I2.877 J5.764 E.04111
; LINE_WIDTH: 0.396432
G3 X128.352 Y115.826 I.74 J11.145 E.02076
; LINE_WIDTH: 0.390592
G3 X129.49 Y116.014 I-.564 J6.947 E.02061
; LINE_WIDTH: 0.389362
G3 X131.091 Y116.669 I-1.924 J6.993 E.03082
; LINE_WIDTH: 0.390582
G3 X132.032 Y117.331 I-3.445 J5.894 E.02054
; LINE_WIDTH: 0.391622
G1 X132.466 Y117.737 E.01063
; LINE_WIDTH: 0.392442
G3 X133.195 Y118.623 I-4.984 J4.844 E.0206
; LINE_WIDTH: 0.391562
G3 X133.757 Y119.629 I-5.541 J3.749 E.02064
; LINE_WIDTH: 0.392092
G3 X134.131 Y120.717 I-6.652 J2.901 E.02062
; LINE_WIDTH: 0.389752
G3 X134.314 Y122.44 I-7.111 J1.623 E.03091
; LINE_WIDTH: 0.389502
G3 X134.269 Y123.024 I-6.487 J-.196 E.01043
G1 X134.228 Y123.273 E.00449
; WIPE_START
M204 S10000
G1 X134.176 Y123.586 E-.12049
G1 X134.032 Y124.143 E-.21858
G1 X133.838 Y124.687 E-.21967
G1 X133.613 Y125.167 E-.20126
; WIPE_END
G1 E-.04
G17
G3 Z2.88 I-.928 J-.787 P1  F30000
G1 X126.019 Y134.121 Z2.88
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.419992
M204 S5000
G1 X126.085 Y133.974 E.0031
G1 X126.085 Y129.953 E.07751
G1 X126.027 Y129.813 E.00291
G1 X124.613 Y128.399 E.03855
G2 X124.105 Y127.915 I-9.708 J9.687 E.01353
; LINE_WIDTH: 0.389972
G1 X123.626 Y127.565 E.01056
; LINE_WIDTH: 0.389362
G3 X122.365 Y126.243 I4.862 J-5.901 E.03257
; LINE_WIDTH: 0.389702
G3 X121.741 Y125.195 I5.641 J-4.071 E.02174
; LINE_WIDTH: 0.389592
G1 X121.501 Y124.633 E.01087
; LINE_WIDTH: 0.388812
G1 X121.286 Y123.94 E.01288
; LINE_WIDTH: 0.386102
G1 X121.16 Y123.341 E.01079
; LINE_WIDTH: 0.387992
G1 X121.086 Y122.721 E.01106
; LINE_WIDTH: 0.388772
G1 X121.072 Y122.072 E.01151
; LINE_WIDTH: 0.389032
G3 X121.209 Y120.88 I6.82 J.179 E.02135
; LINE_WIDTH: 0.389352
G3 X123.328 Y117.187 I6.789 J1.441 E.07692
; LINE_WIDTH: 0.389942
G3 X124.405 Y116.399 I4.449 J4.947 E.0238
; LINE_WIDTH: 0.385802
G3 X127.281 Y115.473 I3.559 J6.126 E.05361
; LINE_WIDTH: 0.396432
G3 X128.392 Y115.465 I.613 J7.598 E.02015
; LINE_WIDTH: 0.390592
G3 X129.595 Y115.666 I-.545 J6.948 E.02179
; LINE_WIDTH: 0.389362
G3 X131.284 Y116.361 I-2.045 J7.375 E.03255
; LINE_WIDTH: 0.390582
G3 X132.28 Y117.064 I-3.479 J5.983 E.02178
; LINE_WIDTH: 0.391622
G1 X132.727 Y117.481 E.01093
; LINE_WIDTH: 0.392442
G3 X133.501 Y118.424 I-4.97 J4.869 E.0219
; LINE_WIDTH: 0.391562
G3 X134.094 Y119.49 I-5.699 J3.866 E.02184
; LINE_WIDTH: 0.392092
G3 X134.488 Y120.644 I-6.452 J2.844 E.02187
; LINE_WIDTH: 0.389752
G3 X134.669 Y121.875 I-6.648 J1.61 E.02216
; LINE_WIDTH: 0.389692
G1 X134.676 Y122.464 E.01049
; LINE_WIDTH: 0.389502
G3 X134.529 Y123.675 I-6.819 J-.217 E.02171
; LINE_WIDTH: 0.389392
G3 X134.168 Y124.838 I-6.644 J-1.422 E.02168
; LINE_WIDTH: 0.389692
G3 X133.605 Y125.919 I-6.443 J-2.666 E.02172
; LINE_WIDTH: 0.389362
G1 X133.253 Y126.418 E.01086
; LINE_WIDTH: 0.390652
G3 X132.335 Y127.386 I-5.373 J-4.18 E.02385
; LINE_WIDTH: 0.386882
G1 X131.859 Y127.765 E.01073
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
M73 P49 R11
G2 X129.723 Y129.813 I129.024 J131.114 E.0462
G1 X129.665 Y129.95 E.00286
G1 X129.665 Y136.329 E.12295
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
G1 X122.806 Y136.327 E.13222
G3 X121.951 Y136.238 I.766 J-11.515 E.01657
G1 X121.176 Y136.029 E.01548
G3 X118.84 Y134.331 I1.783 J-4.908 E.05639
G1 X120.617 Y133.087 E.04181
G1 X120.83 Y133.334 E.00628
G1 X121.371 Y133.752 E.01318
G1 X121.994 Y134.033 E.01318
G1 X122.806 Y134.17 E.01587
G1 X125.888 Y134.171 E.05941
G1 X125.963 Y134.142 E.00156
; WIPE_START
M204 S10000
G1 X126.085 Y133.974 E-.07889
G1 X126.085 Y132.181 E-.68112
; WIPE_END
G1 E-.04
G1 X128.035 Y130.33 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.350758
G1 F18461.228
G1 X127.715 Y130.331 E.00509
G1 X127.715 Y133.974 E.05788
G1 X127.648 Y134.503 E.00848
G1 X127.539 Y134.68 E.00331
G1 X128.017 Y134.681 E.00761
G2 X128.035 Y133.974 I-40.52 J-1.364 E.01124
G1 X128.035 Y130.39 E.05695
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18461.228
G1 X128.035 Y132.39 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/145
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.88 I-1.125 J-.464 P1  F30000
G1 X126.963 Y134.991 Z2.88
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1618
G1 X127.315 Y134.334 E.01547
G1 X127.343 Y134.053 E.00584
G1 X127.342 Y129.945 E.08521
G1 X127.35 Y129.945 E.00016
G2 X128.407 Y129.953 I.58 J-7.538 E.02194
G1 X128.407 Y134.991 E.10451
G1 X127.023 Y134.991 E.02871
G1 X126.544 Y134.819 F30000
G1 F1618
G1 X126.613 Y134.786 E.0016
G1 X126.899 Y134.252 E.01256
G1 X126.918 Y134.053 E.00414
G1 X126.918 Y132.053 E.04148
G2 X126.916 Y129.878 I-216.005 J-.82 E.04511
G1 X126.756 Y129.452 E.00945
G2 X128.994 Y129.452 I1.119 J-7.119 E.04663
G1 X128.845 Y129.786 E.0076
G1 X128.832 Y129.953 E.00346
G1 X128.832 Y135.415 E.11331
G2 X125.887 Y135.438 I-.994 J62.137 E.06107
; LINE_WIDTH: 0.403422
G1 X123.887 Y135.438 E.03693
G3 X122.784 Y135.436 I-.539 J-12.93 E.02039
; LINE_WIDTH: 0.407622
G3 X121.832 Y135.295 I.093 J-3.906 E.018
; LINE_WIDTH: 0.400472
G1 X121.138 Y135.052 E.01348
G1 X120.616 Y134.767 E.01089
; LINE_WIDTH: 0.405652
G1 X120.136 Y134.415 E.01107
G1 X120.464 Y134.185 E.00745
G1 X120.699 Y134.376 E.00562
; LINE_WIDTH: 0.407122
G1 X121.189 Y134.658 E.01055
; LINE_WIDTH: 0.407622
G2 X122.802 Y135.06 I1.876 J-4.098 E.03122
; LINE_WIDTH: 0.403452
G1 X125.888 Y135.06 E.05698
; LINE_WIDTH: 0.412422
G1 X126.062 Y135.05 E.00331
; LINE_WIDTH: 0.449992
G1 X126.49 Y134.845 E.00983
; WIPE_START
G1 F3600
G1 X126.613 Y134.786 E-.05203
G1 X126.899 Y134.252 E-.23013
G1 X126.918 Y134.053 E-.07586
G1 X126.918 Y132.995 E-.40198
; WIPE_END
G1 E-.04 F1800
G1 X130.264 Y128.691 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F1618
G3 X129.433 Y129.524 I-156.575 J-155.346 E.02439
G1 X129.264 Y129.855 E.00771
G1 X129.256 Y129.953 E.00204
G1 X129.256 Y135.84 E.12211
G1 X123.256 Y135.838 E.12445
G3 X120.833 Y135.359 I-.24 J-5.148 E.05172
G3 X119.507 Y134.364 I2.348 J-4.508 E.03454
G1 X120.452 Y133.702 E.02392
G1 X120.512 Y133.704 E.00123
G1 X121.03 Y134.114 E.0137
G1 X121.589 Y134.406 E.01309
G1 X122.284 Y134.598 E.01495
G1 X122.803 Y134.659 E.01083
G1 X125.992 Y134.65 E.06615
G1 X126.314 Y134.484 E.00752
G1 X126.483 Y134.17 E.00739
G1 X126.494 Y132.053 E.04391
G2 X126.486 Y129.855 I-77.308 J-.82 E.0456
G1 X126.324 Y129.531 E.0075
G3 X125.486 Y128.691 I159.677 J-160.065 E.02461
G2 X130.207 Y128.712 I2.388 J-6.526 E.09991
; WIPE_START
G1 F3600
G1 X129.433 Y129.524 E-.42637
G1 X129.264 Y129.855 E-.14133
G1 X129.256 Y129.953 E-.03729
G1 X129.256 Y130.36 E-.15501
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.995 J.7 P1  F30000
G1 X134.219 Y123.308 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392072
G1 F1618
M204 S5000
G1 X134.172 Y123.587 E.00507
G3 X134.032 Y124.142 I-6.968 J-1.458 E.01025
; LINE_WIDTH: 0.389732
G3 X133.595 Y125.211 I-6.444 J-2.01 E.02058
; LINE_WIDTH: 0.389372
G3 X132.974 Y126.185 I-5.727 J-2.966 E.02057
; LINE_WIDTH: 0.389932
G3 X131.732 Y127.409 I-5.776 J-4.622 E.03112
; LINE_WIDTH: 0.410332
G1 X131.193 Y127.787 E.01237
; LINE_WIDTH: 0.419992
G3 X124.571 Y127.797 I-3.319 J-5.507 E.13408
; LINE_WIDTH: 0.412682
G1 X124.095 Y127.466 E.01096
; LINE_WIDTH: 0.384942
G1 X123.642 Y127.106 E.01015
; LINE_WIDTH: 0.384542
G1 X123.224 Y126.707 E.01014
; LINE_WIDTH: 0.384922
G3 X121.955 Y124.79 I4.678 J-4.475 E.04059
; LINE_WIDTH: 0.384582
G3 X121.584 Y123.635 I5.843 J-2.511 E.02131
; LINE_WIDTH: 0.392322
G1 X121.534 Y123.358 E.00505
G1 X121.452 Y122.709 E.01172
; LINE_WIDTH: 0.390762
G1 X121.438 Y122.092 E.01101
; LINE_WIDTH: 0.391512
G3 X121.566 Y120.969 I6.59 J.18 E.02025
; LINE_WIDTH: 0.391332
G1 X121.688 Y120.453 E.00948
; LINE_WIDTH: 0.385772
G3 X122.109 Y119.375 I6.166 J1.788 E.0204
; LINE_WIDTH: 0.387002
G3 X122.716 Y118.391 I5.768 J2.876 E.02044
; LINE_WIDTH: 0.385792
G3 X123.927 Y117.159 I5.654 J4.345 E.03049
; LINE_WIDTH: 0.389952
G3 X124.999 Y116.486 I4.099 J5.343 E.02257
; LINE_WIDTH: 0.389352
G3 X127.785 Y115.808 I2.949 J6.051 E.05137
; LINE_WIDTH: 0.389562
G1 X128.363 Y115.827 E.01029
; LINE_WIDTH: 0.392912
G3 X129.495 Y116.018 I-.704 J7.639 E.02062
; LINE_WIDTH: 0.390842
G3 X134.311 Y122.466 I-1.644 J6.25 E.15508
; LINE_WIDTH: 0.391612
G1 X134.266 Y123.029 E.0101
; LINE_WIDTH: 0.392072
G1 X134.229 Y123.249 E.004
; WIPE_START
G1 F1800
M204 S10000
G1 X134.172 Y123.587 E-.13032
G1 X134.032 Y124.142 E-.21743
G1 X133.817 Y124.733 E-.23879
G1 X133.625 Y125.147 E-.17347
; WIPE_END
G1 E-.04
G17
G3 Z3 I-.932 J-.783 P1  F30000
G1 X126.027 Y134.193 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1618
M204 S5000
G1 X126.085 Y134.053 E.00293
G1 X126.085 Y130.053 E.0771
G2 X126.03 Y129.816 I-.322 J-.05 E.00482
G2 X124.105 Y127.915 I-50.567 J49.265 E.05214
; LINE_WIDTH: 0.391202
G1 X123.627 Y127.565 E.01059
; LINE_WIDTH: 0.390852
G1 X123.167 Y127.162 E.01091
; LINE_WIDTH: 0.391592
G3 X122.365 Y126.243 I4.803 J-4.997 E.02184
; LINE_WIDTH: 0.390382
G1 X122.03 Y125.733 E.01088
; LINE_WIDTH: 0.391592
G3 X121.314 Y124.052 I6.64 J-3.818 E.03275
; LINE_WIDTH: 0.392322
G3 X121.088 Y122.724 I6.704 J-1.828 E.02418
; LINE_WIDTH: 0.390762
G1 X121.073 Y122.074 E.0116
; LINE_WIDTH: 0.391512
G3 X121.21 Y120.882 I6.817 J.18 E.02148
; LINE_WIDTH: 0.391332
G1 X121.375 Y120.236 E.01192
; LINE_WIDTH: 0.389382
G1 X121.582 Y119.661 E.01086
; LINE_WIDTH: 0.389572
G3 X122.145 Y118.579 I6.363 J2.622 E.02173
; LINE_WIDTH: 0.389372
G3 X122.892 Y117.615 I5.775 J3.708 E.02171
; LINE_WIDTH: 0.390652
G3 X123.8 Y116.8 I5.073 J4.738 E.0218
; LINE_WIDTH: 0.389962
G1 X124.405 Y116.399 E.01292
; LINE_WIDTH: 0.385802
G3 X127.285 Y115.473 I3.558 J6.123 E.05368
; LINE_WIDTH: 0.387022
G3 X128.501 Y115.476 I.591 J6.517 E.0215
; LINE_WIDTH: 0.392912
G3 X129.595 Y115.667 I-.634 J6.868 E.01995
; LINE_WIDTH: 0.390842
M73 P49 R10
G3 X134.669 Y121.876 I-1.72 J6.584 E.15307
; LINE_WIDTH: 0.390822
G1 X134.675 Y122.485 E.01088
; LINE_WIDTH: 0.391612
G1 X134.628 Y123.082 E.0107
; LINE_WIDTH: 0.392072
G3 X134.375 Y124.263 I-6.951 J-.869 E.02166
; LINE_WIDTH: 0.389732
G3 X133.912 Y125.391 I-6.663 J-2.08 E.02172
; LINE_WIDTH: 0.389372
G3 X133.253 Y126.418 I-6.037 J-3.142 E.02173
; LINE_WIDTH: 0.389932
G3 X132.334 Y127.387 I-5.264 J-4.076 E.02381
; LINE_WIDTH: 0.386882
G1 X131.859 Y127.765 E.01073
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I128.846 J130.938 E.0462
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y136.249 E.12137
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
G1 X122.753 Y136.247 E.13322
G1 X122.041 Y136.179 E.0138
G1 X121.329 Y136.003 E.01414
G1 X120.651 Y135.726 E.01412
G1 X120.018 Y135.352 E.01416
G3 X118.911 Y134.281 I3.153 J-4.367 E.02979
G1 X120.552 Y133.133 E.0386
G1 X120.771 Y133.388 E.00648
G1 X121.225 Y133.754 E.01125
G1 X121.716 Y134.017 E.01074
G1 X122.221 Y134.177 E.01021
G1 X122.804 Y134.249 E.01133
G1 X125.888 Y134.25 E.05944
G1 X125.971 Y134.216 E.00174
; WIPE_START
G1 F1800
M204 S10000
G1 X126.085 Y134.053 E-.07553
G1 X126.085 Y132.252 E-.68447
; WIPE_END
G1 E-.04
G1 X128.035 Y130.327 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.348124
G1 F1618
G1 X127.715 Y130.327 E.00505
G1 X127.715 Y134.053 E.05873
G1 X127.673 Y134.455 E.00636
G1 X127.59 Y134.609 E.00277
G1 X128.026 Y134.609 E.00687
G1 X128.035 Y134.084 E.00828
G2 X128.035 Y130.387 I-151.204 J-1.864 E.05828
; CHANGE_LAYER
; Z_HEIGHT: 2.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18612.063
G1 X128.035 Y132.387 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/145
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3 I-1.14 J-.426 P1  F30000
G1 X127.227 Y134.546 Z3
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1577
G1 X127.335 Y134.3 E.00556
G1 X127.343 Y132.151 E.04458
G2 X127.341 Y129.943 I-487.178 J-.828 E.0458
G2 X128.403 Y129.953 I.66 J-14.011 E.02202
G1 X128.407 Y134.893 E.10248
G1 X127.075 Y134.893 E.02763
G1 X127.203 Y134.601 E.00662
G1 X126.844 Y134.413 F30000
G1 F1577
G1 X126.913 Y134.257 E.00355
G1 X126.918 Y134.151 E.0022
G1 X126.918 Y130.337 E.07912
G1 X126.885 Y129.693 E.01336
G1 X126.761 Y129.452 E.00564
G1 X127.05 Y129.496 E.00607
G2 X129.004 Y129.449 I.792 J-7.718 E.04064
G1 X128.832 Y129.938 E.01076
G1 X128.832 Y135.318 E.11159
G1 X126.879 Y135.317 E.04051
; LINE_WIDTH: 0.487997
G1 X126.679 Y135.298 E.00454
; LINE_WIDTH: 0.526002
G1 X126.479 Y135.279 E.00491
; LINE_WIDTH: 0.564007
G1 X126.279 Y135.26 E.00529
; LINE_WIDTH: 0.602012
G1 X126.079 Y135.241 E.00566
G1 X126.224 Y135.139 E.005
; LINE_WIDTH: 0.564007
G1 X126.37 Y135.037 E.00467
; LINE_WIDTH: 0.526002
G1 X126.515 Y134.935 E.00434
; LINE_WIDTH: 0.487997
G1 X126.66 Y134.833 E.00401
; LINE_WIDTH: 0.449992
G1 X126.82 Y134.468 E.00826
; WIPE_START
G1 F3600
G1 X126.913 Y134.257 E-.0878
G1 X126.918 Y134.151 E-.04028
G1 X126.918 Y132.488 E-.63192
; WIPE_END
G1 E-.04 F1800
G1 X130.264 Y128.691 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
G1 F1577
G3 X129.433 Y129.524 I-156.575 J-155.346 E.02439
G1 X129.256 Y129.944 E.00946
G1 X129.256 Y135.742 E.12026
G1 X123.256 Y135.741 E.12445
G3 X121.584 Y135.55 I-.226 J-5.441 E.03504
G3 X119.592 Y134.304 I1.35 J-4.374 E.04928
G1 X120.406 Y133.734 E.02061
G1 X120.513 Y133.84 E.00312
G1 X121.003 Y134.214 E.01279
G1 X121.551 Y134.496 E.01278
G1 X122.264 Y134.693 E.01534
G1 X122.801 Y134.756 E.01122
G1 X125.888 Y134.757 E.06403
G1 X125.992 Y134.748 E.00218
G1 X126.342 Y134.552 E.00832
G1 X126.494 Y134.151 E.0089
G1 X126.494 Y130.337 E.07912
G1 X126.475 Y129.8 E.01114
G1 X126.317 Y129.524 E.0066
G1 X125.472 Y128.679 E.02479
G2 X128.322 Y129.103 I2.442 J-6.611 E.0602
G1 X129.144 Y129 E.01718
G2 X130.207 Y128.712 I-1.292 J-6.882 E.02288
; WIPE_START
G1 F3600
G1 X129.433 Y129.524 E-.42636
G1 X129.256 Y129.944 E-.17329
G1 X129.256 Y130.366 E-.16034
; WIPE_END
G1 E-.04 F1800
G1 X122.295 Y133.496 Z3.12 F30000
G1 X120.374 Y134.359 Z3.12
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.593832
G1 F1577
G1 X120.891 Y134.716 E.01744
G1 X121.369 Y134.952 E.0148
; LINE_WIDTH: 0.582472
G1 X121.885 Y135.12 E.01477
; LINE_WIDTH: 0.581712
G1 X122.665 Y135.238 E.02144
; LINE_WIDTH: 0.585512
G1 X125.888 Y135.249 E.0882
; LINE_WIDTH: 0.602012
G1 X126.079 Y135.241 E.00539
; WIPE_START
G1 F3600
G1 X125.888 Y135.249 E-.07275
G1 X124.079 Y135.243 E-.68725
; WIPE_END
G1 E-.04 F1800
G1 X126.085 Y134.151 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1577
M204 S5000
G1 X126.085 Y130.151 E.0771
G2 X126.027 Y129.813 I-.437 J-.099 E.00678
G1 X124.613 Y128.399 E.03855
G2 X124.024 Y127.859 I-4.768 J4.602 E.01541
; LINE_WIDTH: 0.386382
G1 X123.538 Y127.49 E.01076
; LINE_WIDTH: 0.385772
G3 X122.676 Y126.636 I4.349 J-5.254 E.02139
; LINE_WIDTH: 0.390722
M73 P50 R10
G1 X122.366 Y126.242 E.00894
; LINE_WIDTH: 0.392392
G3 X121.741 Y125.194 I5.69 J-4.1 E.0219
; LINE_WIDTH: 0.390852
G1 X121.502 Y124.633 E.01089
; LINE_WIDTH: 0.391612
G1 X121.314 Y124.052 E.01092
; LINE_WIDTH: 0.392302
G3 X121.088 Y122.728 I6.698 J-1.827 E.02411
; LINE_WIDTH: 0.390752
G1 X121.073 Y122.076 E.01163
; LINE_WIDTH: 0.391532
G3 X121.21 Y120.885 I6.826 J.179 E.02146
; LINE_WIDTH: 0.391242
G1 X121.375 Y120.236 E.01198
; LINE_WIDTH: 0.389362
G3 X122.497 Y118.081 I6.504 J2.016 E.04342
; LINE_WIDTH: 0.390432
G1 X122.893 Y117.616 E.01089
; LINE_WIDTH: 0.390712
G3 X123.8 Y116.8 I5.027 J4.682 E.0218
; LINE_WIDTH: 0.389962
G1 X124.404 Y116.399 E.01292
; LINE_WIDTH: 0.385802
G3 X127.285 Y115.473 I3.558 J6.123 E.05369
; LINE_WIDTH: 0.387072
G3 X128.501 Y115.476 I.591 J6.501 E.0215
; LINE_WIDTH: 0.392922
G3 X129.594 Y115.666 I-.634 J6.866 E.01995
; LINE_WIDTH: 0.390832
G3 X134.317 Y120.059 I-1.759 J6.626 E.11985
; LINE_WIDTH: 0.391612
G3 X134.61 Y121.278 I-6.565 J2.222 E.02247
; LINE_WIDTH: 0.390822
G1 X134.669 Y121.877 E.01074
G1 X134.675 Y122.487 E.0109
; LINE_WIDTH: 0.391652
G1 X134.628 Y123.082 E.01067
; LINE_WIDTH: 0.392032
G3 X134.375 Y124.263 I-6.95 J-.868 E.02165
; LINE_WIDTH: 0.389352
G1 X134.168 Y124.838 E.01086
; LINE_WIDTH: 0.389732
G3 X133.605 Y125.92 I-6.456 J-2.672 E.02173
; LINE_WIDTH: 0.389362
G1 X133.253 Y126.418 E.01085
; LINE_WIDTH: 0.390702
G3 X132.334 Y127.387 I-5.38 J-4.186 E.02386
; LINE_WIDTH: 0.386882
G1 X131.859 Y127.765 E.01072
; LINE_WIDTH: 0.412662
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I128.357 J130.448 E.04621
G1 X129.665 Y129.95 E.00286
G1 X129.665 Y136.151 E.11954
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
G1 X122.802 Y136.15 E.1323
G3 X121.998 Y136.069 I.846 J-12.409 E.01556
G3 X119.491 Y134.793 I.967 J-5.001 E.05493
G1 X118.988 Y134.228 E.01459
G1 X120.474 Y133.187 E.03496
G1 X120.766 Y133.518 E.00851
G1 X121.196 Y133.853 E.0105
G1 X121.678 Y134.107 E.01049
G1 X122.199 Y134.273 E.01055
G1 X122.802 Y134.347 E.0117
G1 X125.888 Y134.348 E.05949
G1 X126.036 Y134.281 E.00312
G1 X126.064 Y134.207 E.00153
; WIPE_START
G1 F1800
M204 S10000
G1 X126.074 Y132.207 E-.76
; WIPE_END
G1 E-.04
G1 X131.221 Y126.571 Z3.12 F30000
G1 X134.222 Y123.286 Z3.12
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.392032
G1 F1577
M204 S5000
G1 X134.172 Y123.587 E.00547
G3 X134.032 Y124.143 I-6.936 J-1.451 E.01027
; LINE_WIDTH: 0.389352
G1 X133.838 Y124.687 E.01027
; LINE_WIDTH: 0.389732
G3 X133.306 Y125.713 I-6.241 J-2.581 E.02058
; LINE_WIDTH: 0.389362
G1 X132.975 Y126.185 E.01026
; LINE_WIDTH: 0.390702
G3 X132.179 Y127.041 I-5.511 J-4.323 E.02089
; LINE_WIDTH: 0.389962
G1 X131.732 Y127.409 E.0103
; LINE_WIDTH: 0.410312
G1 X131.193 Y127.786 E.01237
; LINE_WIDTH: 0.419992
G3 X124.739 Y127.897 I-3.323 J-5.568 E.13023
G1 X124.308 Y127.614 E.00996
; LINE_WIDTH: 0.389462
G3 X123.021 Y126.484 I4.143 J-6.017 E.03052
; LINE_WIDTH: 0.390722
G1 X122.663 Y126.031 E.0103
; LINE_WIDTH: 0.392392
G3 X122.073 Y125.043 I5.795 J-4.127 E.02065
; LINE_WIDTH: 0.390852
G1 X121.846 Y124.512 E.01031
; LINE_WIDTH: 0.391612
G1 X121.669 Y123.964 E.01031
; LINE_WIDTH: 0.392302
G3 X121.452 Y122.712 I6.606 J-1.791 E.0228
; LINE_WIDTH: 0.390752
G1 X121.438 Y122.094 E.01104
; LINE_WIDTH: 0.391532
G3 X121.565 Y120.972 I6.622 J.181 E.02023
; LINE_WIDTH: 0.391242
G1 X121.688 Y120.453 E.00953
; LINE_WIDTH: 0.385772
G3 X123.043 Y117.989 I6.412 J1.922 E.04985
; LINE_WIDTH: 0.385352
G1 X123.444 Y117.574 E.01015
; LINE_WIDTH: 0.385802
G1 X123.927 Y117.159 E.01122
; LINE_WIDTH: 0.389942
G3 X124.999 Y116.486 I4.098 J5.342 E.02257
; LINE_WIDTH: 0.389362
G1 X125.072 Y116.448 E.00147
; LINE_WIDTH: 0.386272
G3 X127.289 Y115.833 I2.803 J5.801 E.04078
; LINE_WIDTH: 0.387622
G1 X127.808 Y115.807 E.00918
; LINE_WIDTH: 0.389572
G1 X128.363 Y115.827 E.00989
; LINE_WIDTH: 0.392922
G3 X129.495 Y116.018 I-.704 J7.64 E.02062
; LINE_WIDTH: 0.390832
G3 X133.969 Y120.169 I-1.657 J6.272 E.11342
; LINE_WIDTH: 0.391612
G3 X134.248 Y121.323 I-6.461 J2.174 E.02127
; LINE_WIDTH: 0.390822
G3 X134.31 Y122.468 I-6.46 J.928 E.02049
; LINE_WIDTH: 0.391652
G1 X134.266 Y123.029 E.01007
; LINE_WIDTH: 0.392032
G1 X134.232 Y123.227 E.00359
; WIPE_START
G1 F1800
M204 S10000
G1 X134.172 Y123.587 E-.13897
G1 X134.032 Y124.143 E-.21776
G1 X133.838 Y124.687 E-.21952
G1 X133.632 Y125.125 E-.18375
; WIPE_END
G1 E-.04
G17
G3 Z3.12 I-.829 J-.891 P1  F30000
G1 X128.035 Y130.33 Z3.12
G1 Z2.72
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.346456
G1 F1577
G1 X127.715 Y130.331 E.00502
G1 X127.715 Y134.159 E.06003
G3 X127.638 Y134.518 I-.568 J.066 E.00586
G1 X128.032 Y134.518 E.00619
G2 X128.035 Y130.39 I-1718.281 J-3.163 E.06473
; CHANGE_LAYER
; Z_HEIGHT: 2.732
; LAYER_HEIGHT: 0.0120001
; WIPE_START
G1 F18708.833
G1 X128.034 Y132.39 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/145
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.12 I.626 J-1.043 P1  F30000
G1 X122.211 Y128.894 Z3.12
G1 Z2.732
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.268
G1 F4180
G1 X124.038 Y128.894 E.07228
G2 X123.628 Y128.488 I-1.29 J.89 E.02296
G1 X122.828 Y127.861 E.04024
G1 X122.211 Y127.238 E.0347
G1 X122.211 Y128.697 E.05777
; WIPE_START
G1 F7411.492
G1 X122.211 Y127.238 E-.55464
G1 X122.591 Y127.622 E-.20536
; WIPE_END
G1 E-.04 F1800
G1 X119.317 Y126 Z3.132 F30000
G1 Z2.732
G1 E.8 F1800
G1 F4180
G1 X121.326 Y126 E.07953
G1 X120.734 Y124.693 E.05679
G1 X120.433 Y123.5 E.0487
G1 X119.317 Y123.5 E.04415
G1 X119.317 Y125.803 E.09114
; WIPE_START
G1 F7411.492
G1 X119.317 Y123.803 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.952 Y123.283 Z3.132 F30000
G1 Z2.732
G1 E.8 F1800
; FEATURE: Support interface
G1 F4180
G1 X119.952 Y120.211 E.1216
G1 X119.058 Y120.211 E.03539
G1 X119.058 Y123.106 E.11457
G1 X118.163 Y123.106 E.03539
G1 X118.163 Y120.211 E.11457
G1 X117.269 Y120.211 E.03539
G1 X117.269 Y123.283 E.12159
; WIPE_START
G1 F4800
G1 X117.269 Y121.283 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.317 Y117.514 Z3.132 F30000
G1 Z2.732
G1 E.8 F1800
; FEATURE: Support
G1 F4180
G1 X119.317 Y119.817 E.09114
G1 X120.731 Y119.817 E.05595
G1 X121.287 Y118.568 E.05413
G1 X121.641 Y117.995 E.02666
G1 X122.163 Y117.317 E.03386
G1 X119.317 Y117.317 E.11265
; WIPE_START
G1 F7411.492
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.211 Y114.423 Z3.132 F30000
G1 Z2.732
G1 E.8 F1800
G1 F4180
G1 X133.789 Y114.423 E.45823
G1 X133.789 Y117.317 E.11456
G1 X133.587 Y117.317 E.00799
G1 X133.789 Y117.562 E.01255
G1 X133.789 Y117.514 E.00187
; WIPE_START
G1 F7411.492
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12047
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.884 E-.54484
; WIPE_END
G1 E-.04 F1800
G1 X135.154 Y120.034 Z3.132 F30000
G1 Z2.732
G1 E.8 F1800
; FEATURE: Support interface
G1 F4180
G2 X135.206 Y120.456 I.838 J.111 E.01701
G1 X135.41 Y121.82 E.05459
G1 X135.373 Y123.106 E.05093
G1 X136.048 Y123.106 E.02674
G1 X136.048 Y120.211 E.11457
G1 X136.942 Y120.211 E.03539
G1 X136.942 Y123.106 E.11457
G1 X137.837 Y123.106 E.03539
G1 X137.837 Y120.211 E.11457
G1 X138.731 Y120.211 E.03539
G1 X138.731 Y123.283 E.12159
; WIPE_START
G1 F4800
G1 X138.731 Y121.283 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.519 Y125.828 Z3.132 F30000
G1 Z2.732
G1 E.8 F1800
; FEATURE: Support
G1 F4180
G1 X135.016 Y124.693 E.04904
G1 X135.317 Y123.5 E.04868
G1 X136.683 Y123.5 E.05406
G1 X136.683 Y126 E.09895
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
G1 X134.424 Y126 E.08943
; WIPE_START
G1 F7411.492
G1 X136.424 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.132 I-.04 J-1.216 P1  F30000
G1 X132.037 Y126.145 Z3.132
G1 Z2.732
G1 E.8 F1800
G1 F4180
G3 X123.581 Y126 I-4.163 J-3.895 E.37717
G1 X132.17 Y126 E.33999
G2 X133.512 Y123.106 I-4.323 J-3.762 E.12795
G1 X122.237 Y123.106 E.44625
G3 X122.549 Y120.212 I5.667 J-.853 E.1165
G1 X133.2 Y120.212 E.42158
G2 X130.736 Y117.317 I-5.347 J2.056 E.15336
G1 X125.014 Y117.317 E.2265
G3 X125.485 Y117.072 I4.051 J7.224 E.02103
; CHANGE_LAYER
; Z_HEIGHT: 2.84
; LAYER_HEIGHT: 0.108
; WIPE_START
G1 F7411.492
G1 X125.014 Y117.317 E-.20184
G1 X126.483 Y117.317 E-.55816
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/145
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.132 I-1.216 J.053 P1  F30000
G1 X127.236 Y134.594 Z3.132
G1 Z2.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X127.343 Y134.273 E.00702
G1 X127.343 Y132.273 E.04148
G2 X127.341 Y129.941 I-362.15 J-.889 E.04836
G2 X128.403 Y129.953 I.671 J-13.275 E.02203
G1 X128.407 Y134.771 E.09995
G1 X127.177 Y134.771 E.02553
G1 X127.217 Y134.651 E.00264
G1 X126.848 Y134.485 F30000
G1 F3600
G1 X126.918 Y134.273 E.00465
G1 X126.918 Y130.273 E.08297
G2 X126.868 Y129.633 I-3.408 J-.052 E.01332
G1 X126.773 Y129.455 E.00419
G1 X126.984 Y129.487 E.00442
G2 X129.004 Y129.449 I.867 J-7.629 E.04204
G1 X128.832 Y129.938 E.01076
G1 X128.832 Y135.196 E.10906
G1 X126.217 Y135.195 E.05423
G1 X126.712 Y134.891 E.01206
G1 X126.829 Y134.542 E.00763
; WIPE_START
G1 X126.918 Y134.273 E-.10798
G1 X126.918 Y132.557 E-.65203
; WIPE_END
G1 E-.04 F1800
G1 X130.264 Y128.691 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
G1 F3600
G3 X129.433 Y129.524 I-153.635 J-152.406 E.02439
G1 X129.256 Y129.944 E.00946
G1 X129.256 Y135.62 E.11774
G1 X126.864 Y135.62 E.04961
; LINE_WIDTH: 0.489485
G1 X126.62 Y135.6 E.00555
; LINE_WIDTH: 0.528977
G1 X126.376 Y135.58 E.00603
; LINE_WIDTH: 0.56847
G1 X126.132 Y135.56 E.0065
; LINE_WIDTH: 0.607962
G1 X125.888 Y135.54 E.00697
G1 X123.888 Y135.54 E.05693
; LINE_WIDTH: 0.608092
G1 X122.72 Y135.534 E.03324
; LINE_WIDTH: 0.613152
G3 X121.529 Y135.319 I.182 J-4.407 E.03488
; LINE_WIDTH: 0.611892
G1 X120.945 Y135.079 E.01808
; LINE_WIDTH: 0.609932
G1 X120.359 Y134.717 E.01968
; LINE_WIDTH: 0.612082
G1 X119.814 Y134.248 E.02062
G1 X120.301 Y133.919 E.01684
G1 X120.834 Y134.343 E.01953
; LINE_WIDTH: 0.609692
G1 X121.27 Y134.59 E.01431
; LINE_WIDTH: 0.611892
G1 X121.739 Y134.772 E.01441
; LINE_WIDTH: 0.613152
G2 X122.798 Y134.957 I1.269 J-4.133 E.03096
; LINE_WIDTH: 0.608092
G1 X125.888 Y134.958 E.08798
; LINE_WIDTH: 0.615362
G2 X126.098 Y134.873 I.05 J-.18 E.00704
; LINE_WIDTH: 0.57402
G1 X126.19 Y134.794 E.00324
; LINE_WIDTH: 0.532677
G1 X126.281 Y134.715 E.00299
; LINE_WIDTH: 0.491335
G1 X126.373 Y134.637 E.00275
; LINE_WIDTH: 0.449992
G1 X126.494 Y134.273 E.00796
G1 X126.494 Y130.337 E.08165
G1 X126.464 Y129.765 E.01188
G1 X126.317 Y129.524 E.00586
G1 X125.471 Y128.679 E.02479
G2 X128.322 Y129.103 I2.434 J-6.561 E.06021
G1 X129.144 Y129 E.01718
G2 X130.207 Y128.712 I-1.293 J-6.886 E.02288
; WIPE_START
G1 X129.433 Y129.524 E-.42632
G1 X129.256 Y129.944 E-.17329
G1 X129.256 Y130.366 E-.16039
; WIPE_END
G1 E-.04 F1800
G1 X126.085 Y134.273 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X126.085 Y129.953 E.08327
G1 X126.027 Y129.813 E.00291
G1 X124.613 Y128.399 E.03855
G2 X124.105 Y127.915 I-9.511 J9.488 E.01353
; LINE_WIDTH: 0.389372
G1 X123.538 Y127.49 E.01259
; LINE_WIDTH: 0.385792
G3 X122.629 Y126.579 I4.254 J-5.149 E.02269
; LINE_WIDTH: 0.385372
G1 X122.19 Y125.983 E.01302
; LINE_WIDTH: 0.384552
G3 X121.242 Y123.746 I5.673 J-3.726 E.04284
; LINE_WIDTH: 0.384032
G1 X121.135 Y123.145 E.01071
; LINE_WIDTH: 0.384522
G1 X121.08 Y122.535 E.01073
; LINE_WIDTH: 0.385302
G3 X121.249 Y120.716 I7.483 J-.222 E.03219
; LINE_WIDTH: 0.385782
G3 X121.626 Y119.561 I6.442 J1.462 E.02142
; LINE_WIDTH: 0.390782
G1 X121.839 Y119.108 E.00893
; LINE_WIDTH: 0.392382
G1 X122.146 Y118.58 E.01095
; LINE_WIDTH: 0.392912
G3 X122.892 Y117.615 I5.954 J3.833 E.02192
; LINE_WIDTH: 0.390782
G3 X123.756 Y116.833 I5.105 J4.771 E.02083
; LINE_WIDTH: 0.388362
G1 X124.405 Y116.399 E.01383
; LINE_WIDTH: 0.385802
G3 X127.285 Y115.473 I3.558 J6.123 E.05368
; LINE_WIDTH: 0.387132
G3 X128.506 Y115.477 I.59 J6.472 E.0216
; LINE_WIDTH: 0.385782
G3 X130.846 Y116.131 I-.63 J6.763 E.04301
; LINE_WIDTH: 0.386492
G3 X131.891 Y116.759 I-2.807 J5.851 E.02152
; LINE_WIDTH: 0.385772
G3 X132.803 Y117.56 I-4.03 J5.507 E.0214
; LINE_WIDTH: 0.390742
G1 X133.136 Y117.935 E.00894
; LINE_WIDTH: 0.392352
G3 X133.822 Y118.944 I-5.428 J4.429 E.0219
; LINE_WIDTH: 0.391652
G3 X134.317 Y120.059 I-6.072 J3.363 E.02185
; LINE_WIDTH: 0.390822
G3 X134.669 Y121.878 I-7.387 J2.373 E.03315
G1 X134.675 Y122.489 E.0109
; LINE_WIDTH: 0.391702
G3 X134.529 Y123.671 I-6.942 J-.255 E.02134
; LINE_WIDTH: 0.390822
G3 X133.911 Y125.39 I-7.678 J-1.791 E.03269
; LINE_WIDTH: 0.391652
G1 X133.604 Y125.92 E.01095
; LINE_WIDTH: 0.391952
G3 X132.858 Y126.884 I-5.848 J-3.756 E.02186
; LINE_WIDTH: 0.389942
G1 X132.334 Y127.387 E.01292
; LINE_WIDTH: 0.386882
G1 X131.859 Y127.765 E.01073
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I129.605 J131.697 E.0462
G1 X129.665 Y129.95 E.00286
G1 X129.665 Y136.029 E.11719
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
G1 X122.759 Y136.028 E.13311
G1 X122.077 Y135.962 E.01321
G1 X121.397 Y135.795 E.01351
G1 X120.747 Y135.529 E.01352
G3 X119.093 Y134.154 I2.058 J-4.159 E.04184
G1 X120.372 Y133.259 E.03009
G1 X120.614 Y133.542 E.00719
G1 X121.077 Y133.918 E.01148
G1 X121.543 Y134.181 E.01032
G1 X122.07 Y134.367 E.01077
G1 X122.799 Y134.469 E.01418
G1 X125.888 Y134.47 E.05955
G1 X126.046 Y134.391 E.0034
G1 X126.066 Y134.33 E.00125
; WIPE_START
M204 S10000
G1 X126.075 Y132.33 E-.76
; WIPE_END
G1 E-.04
G1 X131.178 Y126.655 Z3.24 F30000
G1 X134.227 Y123.265 Z3.24
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.391702
M204 S5000
G1 X134.175 Y123.587 E.00583
; LINE_WIDTH: 0.390822
G3 X133.591 Y125.215 I-7.285 J-1.694 E.03095
; LINE_WIDTH: 0.391652
G1 X133.301 Y125.715 E.01034
; LINE_WIDTH: 0.391952
G3 X132.602 Y126.624 I-5.823 J-3.751 E.02056
; LINE_WIDTH: 0.389942
G3 X131.732 Y127.409 I-4.804 J-4.452 E.02089
; LINE_WIDTH: 0.410332
G1 X131.193 Y127.787 E.01237
; LINE_WIDTH: 0.419992
G3 X128.273 Y128.697 I-3.369 J-5.668 E.0595
G3 X124.36 Y127.652 I-.38 J-6.429 E.07942
; LINE_WIDTH: 0.392632
G1 X123.854 Y127.281 E.01125
; LINE_WIDTH: 0.389832
G1 X123.42 Y126.902 E.01027
; LINE_WIDTH: 0.390762
G1 X123.023 Y126.483 E.01028
; LINE_WIDTH: 0.392372
G3 X122.348 Y125.553 I5.38 J-4.616 E.02064
; LINE_WIDTH: 0.390842
G3 X121.533 Y123.362 I5.531 J-3.304 E.04195
; LINE_WIDTH: 0.390712
G1 X121.452 Y122.71 E.01172
; LINE_WIDTH: 0.390232
G1 X121.436 Y122.09 E.01105
; LINE_WIDTH: 0.389892
G1 X121.476 Y121.516 E.01025
; LINE_WIDTH: 0.390022
G3 X121.722 Y120.345 I6.587 J.769 E.02134
; LINE_WIDTH: 0.389362
M73 P51 R10
G1 X121.917 Y119.802 E.01026
; LINE_WIDTH: 0.390782
G1 X122.161 Y119.28 E.01028
; LINE_WIDTH: 0.392382
G1 X122.452 Y118.783 E.01032
; LINE_WIDTH: 0.392912
G3 X123.15 Y117.872 I6.171 J4.006 E.02062
; LINE_WIDTH: 0.390782
G3 X123.961 Y117.132 I5.326 J5.029 E.01962
; LINE_WIDTH: 0.389912
G3 X124.999 Y116.486 I4.067 J5.374 E.02179
; LINE_WIDTH: 0.389352
G1 X125.084 Y116.443 E.00171
; LINE_WIDTH: 0.386282
G3 X127.289 Y115.833 I2.79 J5.804 E.04054
; LINE_WIDTH: 0.387682
G1 X127.805 Y115.807 E.00914
; LINE_WIDTH: 0.389582
G3 X128.935 Y115.896 I.036 J6.755 E.02019
; LINE_WIDTH: 0.389362
G3 X132.467 Y117.733 I-1.129 J6.486 E.07189
; LINE_WIDTH: 0.390742
G1 X132.852 Y118.164 E.01031
; LINE_WIDTH: 0.392352
G3 X133.499 Y119.114 I-5.517 J4.453 E.02064
; LINE_WIDTH: 0.391652
G3 X133.969 Y120.168 I-6.014 J3.314 E.02066
; LINE_WIDTH: 0.390822
G3 X134.31 Y122.469 I-6.144 J2.087 E.04175
; LINE_WIDTH: 0.391702
G3 X134.265 Y123.03 I-6.906 J-.272 E.01008
G1 X134.237 Y123.206 E.00318
; WIPE_START
M204 S10000
G1 X134.175 Y123.587 E-.14663
G1 X134.028 Y124.147 E-.21987
G1 X133.812 Y124.742 E-.24068
G1 X133.642 Y125.106 E-.15282
; WIPE_END
G1 E-.04
G17
G3 Z3.24 I-.83 J-.89 P1  F30000
G1 X128.035 Y130.33 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345922
G1 F4180
G1 X127.715 Y130.331 E.00501
G1 X127.715 Y134.273 E.06171
G1 X127.681 Y134.399 E.00204
G1 X128.035 Y134.399 E.00554
G1 X128.035 Y130.39 E.06276
; CHANGE_LAYER
; Z_HEIGHT: 2.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18740.045
G1 X128.035 Y132.39 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/145
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.24 I-1.153 J-.391 P1  F30000
G1 X127.281 Y134.615 Z3.24
G1 Z2.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1480
G1 X127.343 Y134.429 E.00406
G1 X127.343 Y132.429 E.04148
G2 X127.341 Y129.943 I-548.571 J-.967 E.05157
G2 X128.407 Y129.953 I.677 J-14.453 E.02211
G1 X128.407 Y134.615 E.09669
G1 X127.341 Y134.615 E.02212
G1 X126.848 Y134.642 F30000
G1 F1480
G1 X126.918 Y134.429 E.00465
G1 X126.918 Y130.429 E.08297
G2 X126.885 Y129.693 I-7.157 J-.046 E.01529
G1 X126.761 Y129.452 E.00564
G2 X128.957 Y129.461 I1.129 J-7.046 E.04574
G1 X128.832 Y129.953 E.01052
G1 X128.832 Y135.039 E.10551
G1 X126.715 Y135.039 E.0439
G1 X126.829 Y134.699 E.00744
; WIPE_START
G1 F3600
G1 X126.918 Y134.429 E-.10798
G1 X126.918 Y132.713 E-.65202
; WIPE_END
G1 E-.04 F1800
G1 X130.283 Y128.675 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
G1 F1480
G2 X129.344 Y129.637 I14.877 J15.44 E.02789
G1 X129.256 Y129.953 E.00679
G1 X129.256 Y135.464 E.11431
G1 X126.708 Y135.463 E.05285
; LINE_WIDTH: 0.451562
G1 X125.888 Y135.462 E.01708
; LINE_WIDTH: 0.451672
G1 X122.672 Y135.451 E.06696
; LINE_WIDTH: 0.457222
G1 X122.158 Y135.396 E.01091
; LINE_WIDTH: 0.459282
G3 X121.102 Y135.07 I.765 J-4.35 E.02348
; LINE_WIDTH: 0.455672
G1 X120.645 Y134.82 E.01096
; LINE_WIDTH: 0.456872
G3 X119.822 Y134.144 I2.214 J-3.532 E.02249
; LINE_WIDTH: 0.452022
G1 X120.172 Y133.899 E.0089
G2 X120.758 Y134.386 I3.765 J-3.938 E.01588
; LINE_WIDTH: 0.450422
G1 X121.243 Y134.664 E.01162
; LINE_WIDTH: 0.459282
G2 X122.236 Y134.972 I1.862 J-4.242 E.02208
; LINE_WIDTH: 0.457222
G1 X122.794 Y135.035 E.01184
; LINE_WIDTH: 0.451732
G1 X124.794 Y135.036 E.04165
; LINE_WIDTH: 0.451622
G1 X125.888 Y135.036 E.02277
; LINE_WIDTH: 0.457772
G1 X125.993 Y135.03 E.00223
G1 X126.373 Y134.793 E.00946
; LINE_WIDTH: 0.449992
G1 X126.494 Y134.429 E.00796
G1 X126.494 Y130.429 E.08297
G2 X126.475 Y129.8 I-8.665 J-.046 E.01306
G1 X126.317 Y129.524 E.0066
G1 X125.472 Y128.679 E.02479
G2 X130.226 Y128.696 I2.4 J-6.326 E.10078
; WIPE_START
G1 F3600
G1 X129.344 Y129.637 E-.49035
G1 X129.256 Y129.953 E-.12441
G1 X129.256 Y130.335 E-.14524
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.36 I.996 J.699 P1  F30000
G1 X134.233 Y123.241 Z3.36
G1 Z2.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389552
G1 F1480
M204 S5000
G1 X134.176 Y123.586 E.00622
; LINE_WIDTH: 0.389392
G3 X133.838 Y124.687 I-6.296 J-1.334 E.0205
; LINE_WIDTH: 0.389772
G3 X133.306 Y125.713 I-6.261 J-2.592 E.02059
; LINE_WIDTH: 0.389372
G1 X132.975 Y126.185 E.01025
; LINE_WIDTH: 0.389772
G1 X132.561 Y126.667 E.01131
; LINE_WIDTH: 0.389952
G3 X131.729 Y127.41 I-4.654 J-4.376 E.01989
; LINE_WIDTH: 0.410332
G1 X131.193 Y127.787 E.01232
; LINE_WIDTH: 0.419992
G3 X124.739 Y127.897 I-3.323 J-5.567 E.13023
G1 X124.308 Y127.614 E.00995
; LINE_WIDTH: 0.389472
G3 X123.42 Y126.902 I3.621 J-5.426 E.02027
; LINE_WIDTH: 0.389362
G1 X123.021 Y126.484 E.01027
; LINE_WIDTH: 0.392932
G3 X122.347 Y125.552 I5.898 J-4.973 E.02067
; LINE_WIDTH: 0.390842
G1 X122.073 Y125.043 E.01031
; LINE_WIDTH: 0.392912
G3 X121.667 Y123.969 I7.001 J-3.261 E.02063
; LINE_WIDTH: 0.389832
G3 X121.469 Y122.926 I6.576 J-1.793 E.01892
; LINE_WIDTH: 0.384042
G1 X121.434 Y122.354 E.01004
; LINE_WIDTH: 0.384342
G1 X121.45 Y121.776 E.01013
; LINE_WIDTH: 0.384922
G3 X121.639 Y120.637 I6.317 J.458 E.02031
; LINE_WIDTH: 0.384542
G3 X122.292 Y119.035 I6.957 J1.905 E.03041
; LINE_WIDTH: 0.385842
G1 X122.714 Y118.394 E.01352
; LINE_WIDTH: 0.386512
G3 X123.487 Y117.532 I5.11 J3.807 E.02044
; LINE_WIDTH: 0.386302
G1 X123.927 Y117.158 E.01019
; LINE_WIDTH: 0.385782
G3 X127.098 Y115.854 I3.947 J5.09 E.06108
; LINE_WIDTH: 0.388552
G1 X127.787 Y115.808 E.01226
; LINE_WIDTH: 0.389592
G3 X128.935 Y115.896 I.06 J6.701 E.02051
; LINE_WIDTH: 0.389362
G3 X131.587 Y116.985 I-1.163 J6.602 E.05135
; LINE_WIDTH: 0.390952
G1 X132.083 Y117.377 E.01129
; LINE_WIDTH: 0.391692
G3 X132.849 Y118.16 I-4.389 J5.055 E.01961
; LINE_WIDTH: 0.390832
G3 X133.499 Y119.114 I-4.973 J4.089 E.02065
; LINE_WIDTH: 0.391692
G1 X133.756 Y119.63 E.0103
; LINE_WIDTH: 0.391912
G3 X134.131 Y120.717 I-6.418 J2.827 E.02061
; LINE_WIDTH: 0.389822
G3 X134.269 Y123.026 I-6.314 J1.536 E.0414
; LINE_WIDTH: 0.389552
G1 X134.243 Y123.182 E.00281
; WIPE_START
G1 F1800
M204 S10000
G1 X134.176 Y123.586 E-.15564
G1 X134.032 Y124.143 E-.21867
G1 X133.838 Y124.687 E-.21942
G1 X133.651 Y125.083 E-.16627
; WIPE_END
G1 E-.04
G17
G3 Z3.36 I-.946 J-.766 P1  F30000
G1 X126.085 Y134.429 Z3.36
G1 Z2.96
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1480
M204 S5000
G1 X126.085 Y129.953 E.08629
G1 X126.027 Y129.813 E.00291
G1 X124.613 Y128.399 E.03855
G2 X124.024 Y127.858 I-4.763 J4.597 E.01541
; LINE_WIDTH: 0.386382
G1 X123.538 Y127.49 E.01076
; LINE_WIDTH: 0.385772
G3 X122.675 Y126.636 I4.348 J-5.253 E.0214
; LINE_WIDTH: 0.392932
G3 X122.03 Y125.732 I5.266 J-4.444 E.01997
; LINE_WIDTH: 0.390842
G1 X121.741 Y125.194 E.0109
; LINE_WIDTH: 0.392912
G3 X121.313 Y124.052 I6.475 J-3.076 E.02191
; LINE_WIDTH: 0.389832
G1 X121.171 Y123.415 E.01162
; LINE_WIDTH: 0.390482
G1 X121.088 Y122.735 E.01223
; LINE_WIDTH: 0.390752
G3 X121.376 Y120.236 I6.792 J-.484 E.04515
; LINE_WIDTH: 0.390852
G3 X121.839 Y119.108 I6.494 J2.012 E.02178
; LINE_WIDTH: 0.392942
G3 X122.497 Y118.081 I6.351 J3.338 E.02192
; LINE_WIDTH: 0.389382
G1 X122.854 Y117.657 E.00985
; LINE_WIDTH: 0.388122
G1 X123.286 Y117.225 E.01084
; LINE_WIDTH: 0.389372
G3 X126.568 Y115.572 I4.588 J5.024 E.06615
; LINE_WIDTH: 0.389792
G3 X127.831 Y115.446 I1.297 J6.629 E.02261
; LINE_WIDTH: 0.387192
G1 X128.506 Y115.477 E.01195
; LINE_WIDTH: 0.385772
G3 X131.894 Y116.762 I-.63 J6.768 E.06457
; LINE_WIDTH: 0.390952
G1 X132.323 Y117.102 E.00977
; LINE_WIDTH: 0.391692
G3 X133.136 Y117.935 I-4.463 J5.167 E.02084
; LINE_WIDTH: 0.390832
G3 X133.822 Y118.944 I-5.26 J4.315 E.02182
; LINE_WIDTH: 0.391692
G1 X134.094 Y119.49 E.01091
; LINE_WIDTH: 0.391912
G3 X134.488 Y120.644 I-6.382 J2.823 E.02187
; LINE_WIDTH: 0.389822
G3 X134.669 Y121.879 I-6.652 J1.611 E.02225
; LINE_WIDTH: 0.389752
G3 X134.628 Y123.083 I-6.808 J.371 E.02147
; LINE_WIDTH: 0.389552
G1 X134.529 Y123.675 E.01068
; LINE_WIDTH: 0.389392
G3 X134.168 Y124.838 I-6.646 J-1.423 E.02168
; LINE_WIDTH: 0.389772
G3 X133.605 Y125.92 I-6.464 J-2.677 E.02173
; LINE_WIDTH: 0.389372
G1 X133.253 Y126.418 E.01085
; LINE_WIDTH: 0.389772
G1 X132.818 Y126.925 E.01189
; LINE_WIDTH: 0.389952
G3 X131.859 Y127.765 I-4.887 J-4.609 E.02273
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I128.919 J131.011 E.0462
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y135.873 E.11412
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
G1 X122.763 Y135.872 E.13303
G1 X122.103 Y135.808 E.01278
G1 X121.444 Y135.645 E.0131
G3 X119.213 Y134.07 I1.538 J-4.543 E.05337
G1 X120.244 Y133.349 E.02424
G2 X122.288 Y134.563 I2.638 J-2.113 E.04684
G1 X122.795 Y134.625 E.00984
G1 X125.888 Y134.626 E.05962
G1 X126.046 Y134.548 E.0034
G1 X126.066 Y134.486 E.00125
; WIPE_START
G1 F1800
M204 S10000
G1 X126.074 Y132.486 E-.76
; WIPE_END
G1 E-.04
G1 X128.035 Y130.33 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345922
G1 F1480
G1 X127.715 Y130.331 E.00501
G1 X127.715 Y134.243 E.06123
G1 X128.035 Y134.243 E.00501
G1 X128.035 Y130.39 E.06031
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F18740.045
G1 X128.035 Y132.39 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/145
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.36 I.626 J-1.043 P1  F30000
G1 X122.211 Y128.894 Z3.36
G1 Z3
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.268
G1 F3862
G1 X124.038 Y128.894 E.07228
G2 X123.533 Y128.423 I-1.516 J1.117 E.02749
G1 X122.828 Y127.861 E.03567
G1 X122.211 Y127.238 E.03471
G1 X122.211 Y128.697 E.05777
; WIPE_START
G1 F7411.492
G1 X122.211 Y127.238 E-.55464
G1 X122.591 Y127.622 E-.20536
; WIPE_END
G1 E-.04 F1800
G1 X119.317 Y126 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F3862
G1 X121.326 Y126 E.07953
G1 X120.807 Y124.896 E.0483
G1 X120.433 Y123.5 E.05719
G1 X119.317 Y123.5 E.04415
G1 X119.317 Y125.803 E.09114
; WIPE_START
G1 F7411.492
G1 X119.317 Y123.803 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.952 Y123.284 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Support interface
G1 F3862
G1 X119.952 Y120.211 E.1216
G1 X119.058 Y120.211 E.03539
G1 X119.058 Y123.106 E.11458
G1 X118.163 Y123.106 E.03539
G1 X118.163 Y120.211 E.11458
G1 X117.269 Y120.211 E.03539
G1 X117.269 Y123.283 E.1216
; WIPE_START
G1 F4800
G1 X117.269 Y121.283 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.317 Y117.514 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Support
G1 F3862
G1 X119.317 Y119.817 E.09114
G1 X120.731 Y119.817 E.05595
G1 X121.285 Y118.571 E.054
G1 X121.641 Y117.995 E.0268
G1 X122.163 Y117.317 E.03386
G1 X119.317 Y117.317 E.11265
; WIPE_START
G1 F7411.492
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.211 Y114.423 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F3862
G1 X133.789 Y114.423 E.45823
G1 X133.789 Y117.317 E.11456
G1 X133.587 Y117.317 E.00799
G1 X133.789 Y117.562 E.01255
G1 X133.789 Y117.514 E.00187
; WIPE_START
G1 F7411.492
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12046
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.883 E-.54485
; WIPE_END
G1 E-.04 F1800
G1 X135.154 Y120.034 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Support interface
G1 F3862
G2 X135.206 Y120.456 I.838 J.112 E.01702
G1 X135.41 Y121.823 E.05473
G1 X135.373 Y123.106 E.05079
G1 X136.048 Y123.106 E.02674
G1 X136.048 Y120.211 E.11458
G1 X136.942 Y120.211 E.03539
G1 X136.942 Y123.106 E.11458
G1 X137.837 Y123.106 E.03539
G1 X137.837 Y120.211 E.11458
G1 X138.731 Y120.211 E.03539
G1 X138.731 Y123.283 E.1216
; WIPE_START
G1 F4800
G1 X138.731 Y121.283 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.519 Y125.828 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Support
G1 F3862
G1 X135.016 Y124.693 E.04904
G1 X135.317 Y123.5 E.04868
G1 X136.683 Y123.5 E.05406
G1 X136.683 Y126 E.09895
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
G1 X134.424 Y126 E.08943
; WIPE_START
G1 F7411.492
G1 X136.424 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.04 J-1.216 P1  F30000
G1 X132.037 Y126.145 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3862
G3 X123.659 Y126.089 I-4.163 J-3.894 E.37251
G1 X123.581 Y126 E.0047
G1 X132.17 Y126 E.33999
G2 X133.512 Y123.106 I-4.322 J-3.761 E.12795
G1 X122.237 Y123.106 E.44625
M73 P52 R10
G3 X122.549 Y120.212 I5.688 J-.851 E.11649
G1 X133.2 Y120.212 E.42157
G2 X130.736 Y117.317 I-5.319 J2.033 E.1534
G1 X125.014 Y117.317 E.2265
G3 X125.485 Y117.072 I2.821 J4.856 E.02103
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F7411.492
G1 X125.014 Y117.317 E-.20186
G1 X126.483 Y117.317 E-.55814
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/145
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.4 I-1.215 J.061 P1  F30000
G1 X127.343 Y134.399 Z3.4
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X127.343 Y132.399 E.04148
G2 X127.341 Y129.941 I-371.37 J-.952 E.05097
G2 X128.403 Y129.953 I.672 J-13.215 E.02203
G1 X128.407 Y134.399 E.09223
G1 X127.403 Y134.399 E.02084
G1 X126.859 Y134.823 F30000
G1 F3600
G1 X126.918 Y134.645 E.00388
G1 X126.918 Y130.645 E.08297
G2 X126.866 Y129.628 I-5.277 J-.238 E.02116
G1 X126.775 Y129.454 E.00407
G2 X128.982 Y129.454 I1.104 J-6.8 E.04597
G1 X128.832 Y129.942 E.0106
G1 X128.832 Y134.823 E.10124
G1 X126.919 Y134.823 E.03966
G1 X126.459 Y134.75 F30000
G1 F3600
G1 X126.494 Y134.645 E.00228
G1 X126.494 Y130.645 E.08297
G2 X126.463 Y129.762 I-8.259 J-.154 E.01835
G1 X126.317 Y129.524 E.0058
G1 X125.469 Y128.676 E.02487
G2 X128.319 Y129.104 I2.469 J-6.739 E.06019
G2 X130.279 Y128.678 I-.587 J-7.431 E.04172
G2 X129.395 Y129.566 I99.123 J99.587 E.02598
G1 X129.256 Y129.947 E.00841
G1 X129.256 Y135.248 E.10995
G1 X127.096 Y135.247 E.0448
; LINE_WIDTH: 0.454232
G1 X125.993 Y135.245 E.02311
G1 X126.373 Y135.009 E.00937
; LINE_WIDTH: 0.449992
G1 X126.44 Y134.807 E.00443
; WIPE_START
G1 X126.494 Y134.645 E-.06462
G1 X126.494 Y132.815 E-.69538
; WIPE_END
G1 E-.04 F1800
G1 X131.289 Y126.877 Z3.48 F30000
G1 X134.234 Y123.228 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.390812
M204 S5000
G1 X134.205 Y123.402 E.00314
G3 X134.082 Y123.963 I-7.116 J-1.263 E.01025
; LINE_WIDTH: 0.391712
G3 X133.677 Y125.041 I-6.509 J-1.827 E.02064
; LINE_WIDTH: 0.391852
G3 X133.053 Y126.078 I-6.202 J-3.025 E.02169
; LINE_WIDTH: 0.389792
G1 X132.73 Y126.482 E.00921
; LINE_WIDTH: 0.389602
G1 X132.353 Y126.882 E.00978
; LINE_WIDTH: 0.389772
G1 X131.885 Y127.29 E.01105
; LINE_WIDTH: 0.389962
G1 X131.433 Y127.619 E.00995
; LINE_WIDTH: 0.419992
G1 X130.858 Y127.979 E.01307
G3 X124.572 Y127.797 I-2.979 J-5.761 E.12655
; LINE_WIDTH: 0.412822
G1 X124.095 Y127.467 E.01098
; LINE_WIDTH: 0.385362
G1 X123.551 Y127.025 E.01232
; LINE_WIDTH: 0.385792
G3 X122.725 Y126.121 I4.256 J-4.719 E.02159
; LINE_WIDTH: 0.388202
G1 X122.31 Y125.497 E.01327
; LINE_WIDTH: 0.389382
G3 X121.842 Y124.508 I5.747 J-3.325 E.01947
; LINE_WIDTH: 0.392922
G3 X121.534 Y123.37 I7.217 J-2.567 E.02118
; LINE_WIDTH: 0.390752
G1 X121.455 Y122.745 E.01125
; LINE_WIDTH: 0.390512
G1 X121.436 Y122.117 E.0112
; LINE_WIDTH: 0.390142
G3 X121.722 Y120.345 I7.168 J.245 E.03206
; LINE_WIDTH: 0.390882
G3 X122.161 Y119.281 I6.486 J2.053 E.02059
; LINE_WIDTH: 0.392322
G1 X122.452 Y118.783 E.01033
; LINE_WIDTH: 0.392912
G3 X123.149 Y117.872 I6.155 J3.996 E.02061
; LINE_WIDTH: 0.389352
G3 X126.625 Y115.931 I4.791 J4.495 E.07191
; LINE_WIDTH: 0.389782
G3 X127.787 Y115.807 I1.292 J6.64 E.02083
; LINE_WIDTH: 0.389602
G3 X128.935 Y115.896 I.058 J6.716 E.02051
; LINE_WIDTH: 0.389362
G3 X131.588 Y116.986 I-1.163 J6.603 E.05137
; LINE_WIDTH: 0.391872
G3 X132.461 Y117.732 I-4.084 J5.668 E.02059
; LINE_WIDTH: 0.391712
G1 X132.849 Y118.16 E.01033
; LINE_WIDTH: 0.390842
G1 X133.195 Y118.623 E.01032
; LINE_WIDTH: 0.391712
G1 X133.497 Y119.114 E.01031
; LINE_WIDTH: 0.391882
G3 X133.969 Y120.163 I-6.113 J3.379 E.02061
; LINE_WIDTH: 0.389412
G3 X134.233 Y121.205 I-6.378 J2.17 E.01914
; LINE_WIDTH: 0.392282
G3 X134.314 Y122.306 I-7.792 J1.128 E.01979
; LINE_WIDTH: 0.390812
G3 X134.28 Y122.855 I-7.225 J-.166 E.00983
G1 X134.242 Y123.169 E.00564
; WIPE_START
M204 S10000
G1 X134.205 Y123.402 E-.08966
G1 X134.082 Y123.963 E-.21807
G1 X133.903 Y124.51 E-.21904
G1 X133.677 Y125.041 E-.21918
G1 X133.66 Y125.074 E-.01404
; WIPE_END
G1 E-.04
G17
G3 Z3.48 I-.954 J-.755 P1  F30000
G1 X126.085 Y134.645 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.419992
M204 S5000
G1 X126.085 Y129.953 E.09046
G1 X126.027 Y129.813 E.00291
G2 X124.105 Y127.915 I-54.494 J53.245 E.05208
; LINE_WIDTH: 0.392332
G3 X123.167 Y127.162 I3.939 J-5.871 E.02158
; LINE_WIDTH: 0.390872
G1 X122.745 Y126.721 E.01089
; LINE_WIDTH: 0.389932
G3 X121.972 Y125.633 I5.109 J-4.45 E.02381
; LINE_WIDTH: 0.386552
G1 X121.694 Y125.09 E.01076
; LINE_WIDTH: 0.385822
G1 X121.462 Y124.519 E.01084
G1 X121.242 Y123.746 E.01414
; LINE_WIDTH: 0.384142
G3 X121.081 Y122.536 I6.731 J-1.51 E.02143
; LINE_WIDTH: 0.384852
G1 X121.082 Y121.925 E.01073
; LINE_WIDTH: 0.385332
G3 X121.249 Y120.717 I6.554 J.295 E.02147
; LINE_WIDTH: 0.385752
G1 X121.41 Y120.132 E.01067
; LINE_WIDTH: 0.390882
G3 X121.839 Y119.108 I6.284 J2.032 E.01984
; LINE_WIDTH: 0.392322
G1 X122.146 Y118.58 E.01095
; LINE_WIDTH: 0.392912
G3 X122.892 Y117.615 I5.947 J3.828 E.02192
; LINE_WIDTH: 0.389352
G3 X126.568 Y115.572 I5.052 J4.759 E.07596
; LINE_WIDTH: 0.389782
G3 X127.828 Y115.446 I1.298 J6.634 E.02256
; LINE_WIDTH: 0.387252
G1 X128.506 Y115.477 E.012
; LINE_WIDTH: 0.385772
G3 X131.887 Y116.756 I-.634 J6.78 E.06439
; LINE_WIDTH: 0.391872
G3 X132.727 Y117.48 I-3.925 J5.403 E.01989
; LINE_WIDTH: 0.391712
G1 X133.136 Y117.935 E.01094
; LINE_WIDTH: 0.390842
G1 X133.502 Y118.424 E.0109
; LINE_WIDTH: 0.391712
G1 X133.821 Y118.944 E.01092
; LINE_WIDTH: 0.391882
G3 X134.317 Y120.058 I-6.097 J3.38 E.02186
; LINE_WIDTH: 0.389412
G3 X134.592 Y121.164 I-6.32 J2.157 E.02028
; LINE_WIDTH: 0.392282
G1 X134.657 Y121.713 E.00992
G1 X134.679 Y122.315 E.01079
; LINE_WIDTH: 0.390812
G3 X134.432 Y124.068 I-7.626 J-.181 E.03166
; LINE_WIDTH: 0.391712
G3 X134.002 Y125.209 I-6.654 J-1.855 E.02185
; LINE_WIDTH: 0.391852
G3 X133.339 Y126.304 I-6.231 J-3.022 E.02294
; LINE_WIDTH: 0.389792
G1 X132.994 Y126.733 E.0098
; LINE_WIDTH: 0.389602
G1 X132.572 Y127.174 E.01086
; LINE_WIDTH: 0.388472
G1 X132.02 Y127.644 E.01286
; LINE_WIDTH: 0.398372
G1 X131.567 Y127.985 E.01033
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I131.348 J134.288 E.05005
G1 X129.665 Y129.951 E.00287
G1 X129.665 Y135.657 E.10999
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
G1 X122.769 Y135.655 E.13293
G3 X119.395 Y133.943 I.106 J-4.388 E.0754
G1 X120.066 Y133.473 E.01579
G1 X120.351 Y133.806 E.00845
G1 X120.838 Y134.208 E.01216
G1 X121.388 Y134.519 E.01218
G2 X122.789 Y134.841 I1.686 J-4.127 E.02784
G1 X125.888 Y134.842 E.05973
G1 X126.046 Y134.764 E.0034
G1 X126.066 Y134.702 E.00125
; WIPE_START
M204 S10000
G1 X126.074 Y132.702 E-.76
; WIPE_END
G1 E-.04
G1 X119.996 Y134.016 Z3.48 F30000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.440452
G1 F3600
G1 X120.552 Y134.497 E.01491
; LINE_WIDTH: 0.437352
G1 X121.156 Y134.855 E.01414
; LINE_WIDTH: 0.451112
G1 X121.751 Y135.085 E.01326
G1 X122.504 Y135.226 E.01594
; LINE_WIDTH: 0.445552
G1 X122.789 Y135.248 E.00587
G1 X123.888 Y135.249 E.02254
; LINE_WIDTH: 0.445382
G1 X125.888 Y135.249 E.04103
; LINE_WIDTH: 0.454232
G1 X125.993 Y135.245 E.00221
; WIPE_START
G1 X125.888 Y135.249 E-.04002
G1 X123.993 Y135.249 E-.71998
; WIPE_END
G1 E-.04 F1800
G1 X128.035 Y130.33 Z3.48 F30000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345922
G1 F3862
G1 X127.715 Y130.331 E.00501
G1 X127.715 Y134.027 E.05785
G1 X128.035 Y134.027 E.00501
G1 X128.035 Y130.39 E.05693
; CHANGE_LAYER
; Z_HEIGHT: 3.12
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F18740.045
G1 X128.035 Y132.39 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/145
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.48 I.94 J.773 P1  F30000
G1 X136.048 Y122.641 Z3.48
G1 Z3.12
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.12
G1 F1543
G1 X136.048 Y123.106 E.00895
G1 X136.942 Y123.106 E.01724
G1 X136.942 Y122.819 E.00554
G1 X137.837 Y122.818 E.01724
G1 X137.837 Y123.283 E.00896
G1 X138.731 Y123.283 F30000
G1 F1543
G1 X138.731 Y120.211 E.05921
G1 X137.837 Y120.211 E.01724
G1 X137.837 Y121.681 E.02833
G1 X136.942 Y121.681 E.01724
G1 X136.942 Y120.211 E.02832
G1 X136.048 Y120.211 E.01724
G1 X136.048 Y121.68 E.02832
G1 X135.4 Y121.68 E.01249
G1 X135.206 Y120.456 E.02389
G3 X135.154 Y120.034 I.786 J-.311 E.00829
; WIPE_START
G1 F4800
G1 X135.206 Y120.456 E-.16166
G1 X135.4 Y121.68 E-.47092
G1 X135.735 Y121.68 E-.12743
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.52 I1.217 J0 P1  F30000
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
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 36/145
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
G1 X130.295 Y128.671
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.436732
; LAYER_HEIGHT: 0.12
G1 F1543
G1 X129.668 Y129.298 E.01781
G1 X129.18 Y129.379 E.00994
; LINE_WIDTH: 0.420592
G1 X128.525 Y129.462 E.01275
; LINE_WIDTH: 0.415922
G3 X127.227 Y129.462 I-.651 J-7.823 E.02479
; LINE_WIDTH: 0.419952
G1 X126.588 Y129.382 E.01241
; LINE_WIDTH: 0.436412
G1 X126.081 Y129.298 E.01032
G3 X125.489 Y128.683 I11.34 J-11.518 E.01714
G2 X126.678 Y128.998 I2.108 J-5.566 E.02474
; LINE_WIDTH: 0.419442
G1 X127.288 Y129.076 E.01183
; LINE_WIDTH: 0.416052
G2 X128.517 Y129.071 I.586 J-7.018 E.02348
; LINE_WIDTH: 0.421212
G1 X129.141 Y128.985 E.01218
; LINE_WIDTH: 0.436732
G2 X130.239 Y128.692 I-.977 J-5.863 E.02287
; WIPE_START
G1 F3600
G1 X129.668 Y129.298 E-.31619
G1 X129.18 Y129.379 E-.18792
G1 X128.525 Y129.462 E-.25092
G1 X128.512 Y129.463 E-.00496
; WIPE_END
G1 E-.04 F1800
G1 X126.084 Y134.674 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1543
M204 S5000
G1 X126.085 Y129.953 E.09101
G1 X126.03 Y129.816 E.00285
G2 X124.105 Y127.915 I-50.523 J49.22 E.05214
; LINE_WIDTH: 0.392922
G3 X123.167 Y127.163 I4.054 J-6.021 E.02162
; LINE_WIDTH: 0.389352
G3 X122.061 Y125.786 I5.427 J-5.49 E.03146
; LINE_WIDTH: 0.389642
G3 X121.501 Y124.633 I5.903 J-3.582 E.02283
; LINE_WIDTH: 0.388422
G1 X121.286 Y123.94 E.01288
; LINE_WIDTH: 0.386212
G1 X121.16 Y123.341 E.01078
; LINE_WIDTH: 0.387612
G1 X121.087 Y122.734 E.01082
; LINE_WIDTH: 0.388132
G1 X121.071 Y122.108 E.01109
; LINE_WIDTH: 0.388592
G3 X121.206 Y120.896 I6.833 J.146 E.02167
; LINE_WIDTH: 0.389332
G3 X126.568 Y115.572 I6.699 J1.384 E.14231
; LINE_WIDTH: 0.389782
G3 X127.825 Y115.446 I1.299 J6.641 E.02252
; LINE_WIDTH: 0.387312
G1 X128.506 Y115.477 E.01205
; LINE_WIDTH: 0.385772
G3 X131.887 Y116.756 I-.633 J6.78 E.06439
; LINE_WIDTH: 0.391822
G3 X133.136 Y117.935 I-4.657 J6.185 E.03081
; LINE_WIDTH: 0.390832
G3 X133.822 Y118.944 I-5.262 J4.316 E.0218
; LINE_WIDTH: 0.391762
G3 X134.488 Y120.644 I-6.86 J3.667 E.03276
; LINE_WIDTH: 0.389392
G1 X134.591 Y121.158 E.00933
; LINE_WIDTH: 0.388182
G1 X134.659 Y121.715 E.00994
G1 X134.662 Y121.764 E.00087
; LINE_WIDTH: 0.386852
G3 X134.639 Y122.983 I-6.713 J.482 E.02155
; LINE_WIDTH: 0.386272
G1 X134.545 Y123.586 E.01075
; LINE_WIDTH: 0.386052
G1 X134.397 Y124.183 E.01084
; LINE_WIDTH: 0.385822
G1 X134.122 Y124.937 E.01413
; LINE_WIDTH: 0.384542
G3 X132.337 Y127.382 I-6.477 J-2.855 E.05351
; LINE_WIDTH: 0.384922
G1 X131.86 Y127.761 E.01071
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.01075
; LINE_WIDTH: 0.419992
G2 X129.723 Y129.813 I129.139 J131.231 E.0462
G1 X129.665 Y129.953 E.00291
G1 X129.665 Y135.235 E.10183
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
G1 X126.253 Y135.235 E.06578
; LINE_WIDTH: 0.418582
G1 X125.92 Y135.248 E.0064
G1 X126.084 Y135.067 E.0047
; LINE_WIDTH: 0.419992
G1 X126.084 Y134.734 E.00642
; WIPE_START
G1 F1800
M204 S10000
G1 X126.085 Y132.734 E-.76
; WIPE_END
G1 E-.04
G1 X131.047 Y126.935 Z3.6 F30000
G1 X134.24 Y123.204 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.389102
G1 F1543
M204 S5000
G1 X134.209 Y123.421 E.00388
; LINE_WIDTH: 0.389362
G1 X134.083 Y123.968 E.00999
; LINE_WIDTH: 0.392912
G3 X133.677 Y125.043 I-7.396 J-2.181 E.02064
; LINE_WIDTH: 0.390852
G3 X131.89 Y127.284 I-6.012 J-2.961 E.05157
; LINE_WIDTH: 0.391192
G1 X131.436 Y127.615 E.01002
; LINE_WIDTH: 0.419992
G1 X130.686 Y128.066 E.01688
G3 X124.571 Y127.797 I-2.805 J-5.855 E.12285
; LINE_WIDTH: 0.412672
G1 X124.095 Y127.466 E.01097
; LINE_WIDTH: 0.385832
G3 X122.725 Y126.121 I4.226 J-5.672 E.03391
; LINE_WIDTH: 0.386582
G3 X122.117 Y125.139 I5.044 J-3.804 E.0204
; LINE_WIDTH: 0.387322
G1 X121.855 Y124.545 E.01147
; LINE_WIDTH: 0.389782
G3 X121.528 Y123.352 I6.422 J-2.404 E.02205
; LINE_WIDTH: 0.388592
G1 X121.45 Y122.739 E.01095
; LINE_WIDTH: 0.387612
G1 X121.449 Y122.723 E.00029
G1 X121.432 Y122.161 E.00995
; LINE_WIDTH: 0.386812
G3 X121.689 Y120.451 I7.208 J.206 E.0306
; LINE_WIDTH: 0.385762
G3 X127.098 Y115.854 I6.212 J1.829 E.13224
; LINE_WIDTH: 0.388422
G1 X127.787 Y115.807 E.01225
; LINE_WIDTH: 0.389612
G3 X128.935 Y115.896 I.056 J6.733 E.02051
; LINE_WIDTH: 0.389362
G3 X131.588 Y116.986 I-1.163 J6.603 E.05137
; LINE_WIDTH: 0.391822
G3 X132.849 Y118.16 I-4.528 J6.127 E.03091
; LINE_WIDTH: 0.390832
G3 X133.499 Y119.114 I-4.976 J4.091 E.02063
; LINE_WIDTH: 0.391762
G3 X134.132 Y120.719 I-6.722 J3.578 E.03093
; LINE_WIDTH: 0.389392
G1 X134.298 Y121.744 E.01846
; LINE_WIDTH: 0.388352
G1 X134.318 Y122.313 E.0101
; LINE_WIDTH: 0.388882
G1 X134.288 Y122.862 E.00976
; LINE_WIDTH: 0.389102
G1 X134.248 Y123.145 E.00506
; WIPE_START
G1 F1800
M204 S10000
G1 X134.209 Y123.421 E-.10589
G1 X134.083 Y123.968 E-.21363
G1 X133.9 Y124.514 E-.21872
G1 X133.677 Y125.043 E-.21817
G1 X133.672 Y125.051 E-.00359
; WIPE_END
G1 E-.04
G17
G3 Z3.6 I-.641 J-1.034 P1  F30000
G1 X119.723 Y133.699 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.396672
G1 F1543
M204 S5000
G1 X120.05 Y134.081 E.00912
; LINE_WIDTH: 0.390552
G1 X120.488 Y134.453 E.01025
; LINE_WIDTH: 0.383692
G2 X122.08 Y135.166 I2.583 J-3.633 E.03072
; LINE_WIDTH: 0.390212
G1 X122.758 Y135.247 E.01218
; LINE_WIDTH: 0.391052
G1 X123.888 Y135.249 E.02017
; LINE_WIDTH: 0.390822
G1 X125.888 Y135.249 E.0357
; LINE_WIDTH: 0.393192
G1 X125.92 Y135.248 E.00057
; WIPE_START
G1 F1800
M204 S10000
G1 X125.888 Y135.249 E-.01207
G1 X123.92 Y135.249 E-.74793
; WIPE_END
G1 E-.04
G1 X129.434 Y129.972 Z3.6 F30000
G1 X129.449 Y129.958 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1543
M204 S2000
G1 X129.101 Y129.61 E.00948
G1 X128.604 Y129.671
G1 X129.449 Y130.516 E.02303
G1 X129.449 Y131.073
G1 X128.079 Y129.703 E.03734
G1 X127.521 Y129.703
G1 X129.449 Y131.63 E.05254
G1 X129.449 Y132.188
G1 X126.91 Y129.649 E.0692
G1 X126.255 Y129.552
G1 X129.449 Y132.745 E.08706
G1 X129.449 Y133.303
G1 X126.301 Y130.155 E.08581
M73 P53 R10
G1 X126.301 Y130.713
G1 X129.448 Y133.86 E.0858
G1 X129.448 Y134.418
G1 X126.301 Y131.27 E.08579
G1 X126.301 Y131.828
G1 X129.448 Y134.975 E.08579
G1 X128.934 Y135.018
G1 X126.301 Y132.386 E.07176
G1 X126.301 Y132.943
G1 X128.376 Y135.018 E.05656
G1 X127.819 Y135.018
G1 X126.301 Y133.501 E.04136
G1 X126.302 Y134.059
G1 X127.261 Y135.018 E.02615
G1 X126.703 Y135.018
G1 X126.302 Y134.616 E.01095
; WIPE_START
G1 F1800
M204 S10000
G1 X126.703 Y135.018 E-.2158
G1 X127.261 Y135.018 E-.21191
G1 X126.643 Y134.4 E-.33229
; WIPE_END
G1 E-.04
G1 X126.386 Y130.07 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0779228
G1 F1543
G2 X126.288 Y129.89 I-1.009 J.433 E.00052
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F21000
G1 X126.386 Y130.07 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/145
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.6 I.33 J-1.171 P1  F30000
G1 X122.211 Y128.894 Z3.6
G1 Z3.24
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.24
G1 F2155
G1 X124.038 Y128.894 E.0658
G2 X123.533 Y128.423 I-1.516 J1.117 E.02503
G1 X122.828 Y127.861 E.03248
G1 X122.211 Y127.238 E.03159
G1 X122.211 Y128.697 E.05259
; WIPE_START
G1 F8141.211
G1 X122.211 Y127.238 E-.55464
G1 X122.591 Y127.622 E-.20536
; WIPE_END
G1 E-.04 F1800
G1 X119.317 Y126 Z3.64 F30000
G1 Z3.24
G1 E.8 F1800
G1 F2155
G1 X121.326 Y126 E.0724
G1 X120.807 Y124.895 E.044
G1 X120.433 Y123.5 E.05204
G1 X119.317 Y123.5 E.04021
G1 X119.317 Y125.803 E.08297
; WIPE_START
G1 F8141.211
G1 X119.317 Y123.803 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.952 Y123.283 Z3.64 F30000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Support interface
G1 F2155
G1 X119.952 Y120.211 E.11069
G1 X119.058 Y120.211 E.03222
G1 X119.058 Y123.106 E.1043
G1 X118.163 Y123.106 E.03222
G1 X118.163 Y120.211 E.1043
G1 X117.269 Y120.211 E.03222
G1 X117.269 Y123.283 E.11069
; WIPE_START
G1 F4800
G1 X117.269 Y121.283 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.317 Y117.514 Z3.64 F30000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Support
G1 F2155
G1 X119.317 Y119.817 E.08297
G1 X120.731 Y119.817 E.05093
G1 X121.285 Y118.571 E.04916
G1 X121.642 Y117.995 E.0244
G1 X122.163 Y117.317 E.03081
G1 X119.317 Y117.317 E.10255
; WIPE_START
G1 F8141.211
G1 X121.317 Y117.317 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.211 Y114.423 Z3.64 F30000
G1 Z3.24
G1 E.8 F1800
G1 F2155
G1 X133.789 Y114.423 E.41716
G1 X133.789 Y117.317 E.10429
G1 X133.587 Y117.317 E.00728
G1 X133.789 Y117.562 E.01142
G1 X133.789 Y117.514 E.0017
; WIPE_START
G1 F8141.211
G1 X133.789 Y117.562 E-.01797
G1 X133.587 Y117.317 E-.12047
G1 X133.789 Y117.317 E-.07672
G1 X133.789 Y115.884 E-.54484
; WIPE_END
G1 E-.04 F1800
G1 X135.141 Y120.212 Z3.64 F30000
G1 Z3.24
G1 E.8 F1800
; LAYER_HEIGHT: 0.12
G1 F2155
G1 X139.577 Y120.212 E.0855
G1 X139.577 Y123.106 E.05579
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
G1 X138.191 Y123.106 E.02672
; WIPE_START
G1 F9000
G1 X139.577 Y123.106 E-.52673
G1 X139.577 Y122.492 E-.23327
; WIPE_END
G1 E-.04 F1800
G1 X134.519 Y125.828 Z3.64 F30000
G1 Z3.24
G1 E.8 F1800
; LAYER_HEIGHT: 0.24
G1 F2155
G1 X135.016 Y124.693 E.04464
G1 X135.315 Y123.513 E.04385
; LAYER_HEIGHT: 0.12
G1 X135.354 Y123.258 E.00498
G1 X136.683 Y123.257 E.02562
G1 X136.683 Y123.513 E.00493
; LAYER_HEIGHT: 0.24
G1 X136.683 Y126 E.08962
G1 X134.424 Y126 E.08141
; WIPE_START
G1 F8141.211
G1 X136.424 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.64 I-.04 J-1.216 P1  F30000
G1 X132.037 Y126.145 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F2155
G3 X123.58 Y126 I-4.163 J-3.899 E.34335
G1 X132.17 Y126 E.30955
G2 X133.407 Y123.632 I-4.358 J-3.783 E.09713
G1 X133.437 Y123.51 E.00454
G2 X133.513 Y123.106 I-5.916 J-1.319 E.01482
G1 X122.237 Y123.106 E.40628
G3 X122.549 Y120.212 I5.639 J-.856 E.10607
G1 X133.2 Y120.212 E.38378
G2 X130.736 Y117.317 I-5.395 J2.097 E.13955
G1 X125.014 Y117.317 E.20619
G3 X125.442 Y117.092 I4.591 J8.224 E.01743
G1 X125.485 Y117.072 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 3.32
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F8141.211
G1 X125.442 Y117.092 E-.01805
G1 X125.014 Y117.317 E-.18384
G1 X126.483 Y117.317 E-.55812
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/145
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.64 I-1.154 J.387 P1  F30000
G1 X130.291 Y128.674 Z3.64
G1 Z3.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.439382
; LAYER_HEIGHT: 0.12
G1 F2155
G1 X129.666 Y129.299 E.01788
G1 X129.129 Y129.415 E.0111
; LINE_WIDTH: 0.439002
G3 X127.833 Y129.525 I-1.23 J-6.802 E.02633
; LINE_WIDTH: 0.438312
G1 X127.169 Y129.488 E.0134
; LINE_WIDTH: 0.444572
G3 X126.082 Y129.297 I.558 J-6.377 E.02264
; LINE_WIDTH: 0.438412
G1 X125.449 Y128.665 E.01804
G1 X126.237 Y128.909 E.01664
; LINE_WIDTH: 0.444572
G2 X127.397 Y129.094 I1.786 J-7.47 E.02408
; LINE_WIDTH: 0.441732
G1 X127.938 Y129.112 E.011
; LINE_WIDTH: 0.440702
G1 X128.517 Y129.082 E.01177
; LINE_WIDTH: 0.440432
G2 X129.727 Y128.858 I-.65 J-6.897 E.02498
; LINE_WIDTH: 0.439382
G1 X130.234 Y128.692 E.01079
; WIPE_START
G1 F3600
G1 X129.666 Y129.299 E-.31578
G1 X129.129 Y129.415 E-.20855
G1 X128.515 Y129.496 E-.23567
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.72 I.922 J.795 P1  F30000
G1 X134.764 Y122.249 Z3.72
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.399392
M204 S5000
G1 X134.769 Y122.249 E.00009
; LINE_WIDTH: 0.397742
G1 X134.79 Y122.249 E.00038
; LINE_WIDTH: 0.390402
G1 X134.811 Y122.249 E.00038
; LINE_WIDTH: 0.383062
G1 X134.832 Y122.249 E.00037
; LINE_WIDTH: 0.375732
G1 X134.853 Y122.249 E.00036
; LINE_WIDTH: 0.368392
G1 X134.861 Y122.249 E.00013
; LINE_WIDTH: 0.365752
G1 X134.877 Y122.25 E.00026
G1 X134.901 Y122.25 E.00041
G1 X134.926 Y122.25 E.00041
G1 X134.951 Y122.25 E.00041
G1 X134.976 Y122.25 E.00041
G1 X135 Y122.25 E.00041
G1 X135.025 Y122.25 E.00041
G1 X135.05 Y122.25 E.00041
G1 X135.074 Y122.25 E.00041
; FEATURE: Overhang wall
G1 F1200
G1 X137.703 Y122.25 E.0437
; WIPE_START
M204 S10000
G1 X135.703 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.72 I-.809 J-.909 P1  F30000
G1 X134.602 Y123.23 Z3.72
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.390822
M204 S5000
G1 X134.525 Y123.66 E.00779
G3 X134.168 Y124.837 I-7.485 J-1.626 E.02199
; LINE_WIDTH: 0.391792
G3 X133.253 Y126.418 I-7.138 J-3.073 E.03276
; LINE_WIDTH: 0.389932
G3 X132.334 Y127.387 I-5.262 J-4.074 E.02381
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
; LINE_WIDTH: 0.386892
G1 X131.86 Y127.765 E.01072
; LINE_WIDTH: 0.412662
G1 X131.42 Y128.121 E.01069
; LINE_WIDTH: 0.419992
G2 X129.87 Y129.666 I117.328 J119.271 E.04219
G3 X125.879 Y129.665 I-1.994 J-7.367 E.07783
G2 X124.105 Y127.915 I-34.793 J33.501 E.04804
; LINE_WIDTH: 0.389972
G1 X123.626 Y127.565 E.01056
; LINE_WIDTH: 0.389352
G3 X122.029 Y125.733 I4.249 J-5.316 E.04345
; LINE_WIDTH: 0.389642
G3 X121.501 Y124.633 I5.935 J-3.529 E.02173
; LINE_WIDTH: 0.388352
G1 X121.286 Y123.94 E.01288
; LINE_WIDTH: 0.386312
G1 X121.16 Y123.341 E.01078
; LINE_WIDTH: 0.387212
G1 X121.088 Y122.734 E.0108
; LINE_WIDTH: 0.388122
G3 X121.111 Y121.513 I6.547 J-.487 E.02166
; LINE_WIDTH: 0.390782
G1 X121.185 Y121.008 E.00911
; LINE_WIDTH: 0.392272
G3 X121.508 Y119.852 I6.868 J1.292 E.02155
; LINE_WIDTH: 0.391542
G1 X121.777 Y119.233 E.01207
; LINE_WIDTH: 0.391802
G3 X122.375 Y118.243 I6.152 J3.039 E.02072
; LINE_WIDTH: 0.389782
G1 X122.782 Y117.737 E.01155
; LINE_WIDTH: 0.387392
G3 X123.731 Y116.855 I4.985 J4.409 E.02294
; LINE_WIDTH: 0.385782
G3 X128.501 Y115.476 I4.188 J5.545 E.08938
; LINE_WIDTH: 0.392912
G3 X129.595 Y115.667 I-.632 J6.857 E.01995
; LINE_WIDTH: 0.390812
G1 X130.238 Y115.87 E.01205
; LINE_WIDTH: 0.390382
G1 X130.799 Y116.106 E.01086
; LINE_WIDTH: 0.392262
G3 X131.798 Y116.691 I-2.992 J6.261 E.02077
; LINE_WIDTH: 0.390972
G1 X132.281 Y117.064 E.01089
; LINE_WIDTH: 0.389342
G1 X132.729 Y117.48 E.01087
; LINE_WIDTH: 0.389622
G3 X133.503 Y118.423 I-4.927 J4.833 E.02173
; LINE_WIDTH: 0.388352
G1 X133.878 Y119.05 E.01295
; LINE_WIDTH: 0.385832
G1 X134.211 Y119.78 E.01412
; LINE_WIDTH: 0.384532
G1 X134.407 Y120.358 E.01071
; LINE_WIDTH: 0.385292
G3 X134.641 Y121.553 I-6.359 J1.863 E.02143
; LINE_WIDTH: 0.388972
G1 X134.679 Y122.09 E.00957
; LINE_WIDTH: 0.429362
G1 X134.665 Y122.118 E.00061
; LINE_WIDTH: 0.469752
G1 X134.651 Y122.145 E.00067
; LINE_WIDTH: 0.510142
G1 X134.637 Y122.172 E.00073
; LINE_WIDTH: 0.550532
G1 X134.627 Y122.201 E.00078
; LINE_WIDTH: 0.546232
G1 F2155
G1 X134.65 Y122.21 E.00064
; LINE_WIDTH: 0.520802
G1 X134.674 Y122.218 E.00061
; LINE_WIDTH: 0.495382
G1 F2008.36
G1 X134.698 Y122.226 E.00058
; LINE_WIDTH: 0.469962
G1 F1800
G1 X134.722 Y122.235 E.00055
; LINE_WIDTH: 0.444542
G1 X134.745 Y122.243 E.00052
; LINE_WIDTH: 0.419112
G1 X134.764 Y122.249 E.00038
; LINE_WIDTH: 0.418972
G1 X134.746 Y122.256 E.00037
; LINE_WIDTH: 0.444222
G1 X134.722 Y122.264 E.00051
; LINE_WIDTH: 0.469472
G1 X134.698 Y122.272 E.00054
; LINE_WIDTH: 0.494722
G1 F2006.907
G1 X134.675 Y122.281 E.00057
; LINE_WIDTH: 0.519982
G1 F2155
G1 X134.651 Y122.289 E.0006
; LINE_WIDTH: 0.545232
G1 X134.628 Y122.297 E.00064
; LINE_WIDTH: 0.550532
G1 F1800
G1 X134.636 Y122.327 E.0008
; LINE_WIDTH: 0.51065
G1 X134.65 Y122.356 E.00075
; LINE_WIDTH: 0.470767
G1 X134.664 Y122.384 E.00068
; LINE_WIDTH: 0.430885
G1 X134.677 Y122.412 E.00062
; LINE_WIDTH: 0.391002
G1 X134.632 Y123.044 E.01132
; LINE_WIDTH: 0.390822
G1 X134.612 Y123.171 E.00229
; WIPE_START
M204 S10000
G1 X134.525 Y123.66 E-.18857
G1 X134.374 Y124.263 E-.23636
G1 X134.168 Y124.837 E-.23194
G1 X134.053 Y125.084 E-.10313
; WIPE_END
G1 E-.04
G17
G3 Z3.72 I1.065 J-.588 P1  F30000
G1 X128.989 Y115.913 Z3.72
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.392912
M204 S5000
G1 X129.494 Y116.017 E.00925
; LINE_WIDTH: 0.390812
G1 X130.106 Y116.209 E.01145
; LINE_WIDTH: 0.390382
G1 X130.638 Y116.433 E.01029
; LINE_WIDTH: 0.392262
G3 X131.578 Y116.982 I-3.088 J6.37 E.01953
; LINE_WIDTH: 0.390972
G1 X132.035 Y117.332 E.01028
; LINE_WIDTH: 0.389342
G1 X132.46 Y117.726 E.01029
; LINE_WIDTH: 0.389622
G3 X133.181 Y118.596 I-4.812 J4.723 E.02013
; LINE_WIDTH: 0.389762
G1 X133.504 Y119.12 E.01096
; LINE_WIDTH: 0.392892
G3 X133.969 Y120.169 I-6.709 J3.597 E.02061
; LINE_WIDTH: 0.390852
G3 X134.233 Y121.227 I-6.129 J2.091 E.01949
; LINE_WIDTH: 0.390672
G1 X134.298 Y121.782 E.00998
; LINE_WIDTH: 0.415962
G1 X134.321 Y121.969 E.00358
; LINE_WIDTH: 0.441252
G1 X134.345 Y122.155 E.00382
; LINE_WIDTH: 0.477679
G1 X134.362 Y122.185 E.00077
; LINE_WIDTH: 0.514106
G1 X134.38 Y122.216 E.00083
; LINE_WIDTH: 0.550532
G3 X134.376 Y122.283 I-.022 J.033 E.00208
; LINE_WIDTH: 0.51065
G1 X134.355 Y122.32 E.00101
; LINE_WIDTH: 0.470767
G1 X134.334 Y122.357 E.00093
; LINE_WIDTH: 0.430885
G1 X134.313 Y122.394 E.00084
; LINE_WIDTH: 0.391002
G1 X134.271 Y122.993 E.01072
; LINE_WIDTH: 0.390822
G3 X133.833 Y124.692 I-7.187 J-.948 E.03138
; LINE_WIDTH: 0.391792
G3 X132.974 Y126.185 I-6.99 J-3.025 E.0309
; LINE_WIDTH: 0.389932
G3 X131.732 Y127.409 I-5.778 J-4.624 E.03112
; LINE_WIDTH: 0.410312
G1 X131.193 Y127.786 E.01236
; LINE_WIDTH: 0.419992
G3 X127.919 Y128.708 I-3.312 J-5.492 E.06635
G3 X125.979 Y128.425 I.167 J-7.941 E.03789
G3 X124.41 Y127.689 I1.986 J-6.273 E.0335
; LINE_WIDTH: 0.398372
G1 X123.94 Y127.351 E.01054
; LINE_WIDTH: 0.385942
G1 X123.499 Y126.978 E.01018
; LINE_WIDTH: 0.385772
G3 X122.116 Y125.139 I4.377 J-4.729 E.04072
; LINE_WIDTH: 0.387362
G1 X121.854 Y124.543 E.01151
; LINE_WIDTH: 0.389772
G3 X121.527 Y123.35 I6.431 J-2.404 E.02204
; LINE_WIDTH: 0.388572
G1 X121.45 Y122.739 E.01092
; LINE_WIDTH: 0.387672
G1 X121.432 Y122.162 E.01023
; LINE_WIDTH: 0.388132
G1 X121.465 Y121.596 E.01003
; LINE_WIDTH: 0.390782
G1 X121.543 Y121.078 E.00936
; LINE_WIDTH: 0.392272
G3 X121.846 Y119.988 I6.937 J1.342 E.02028
; LINE_WIDTH: 0.391542
G1 X122.102 Y119.401 E.01147
; LINE_WIDTH: 0.391802
G3 X122.66 Y118.469 I6.117 J3.032 E.01945
; LINE_WIDTH: 0.389782
G1 X123.031 Y118.001 E.01064
; LINE_WIDTH: 0.388352
G1 X123.427 Y117.588 E.01014
; LINE_WIDTH: 0.389632
G3 X124.331 Y116.871 I4.627 J4.903 E.02055
; LINE_WIDTH: 0.389362
G3 X125.984 Y116.091 I3.826 J5.966 E.03258
; LINE_WIDTH: 0.386262
G3 X127.792 Y115.809 I1.975 J6.74 E.03234
; LINE_WIDTH: 0.389512
G1 X128.366 Y115.827 E.01022
; LINE_WIDTH: 0.392912
G3 X128.93 Y115.901 I-.708 J7.644 E.01022
; CHANGE_LAYER
; Z_HEIGHT: 3.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X129.494 Y116.017 E-.21869
G1 X130.106 Y116.209 E-.24379
G1 X130.638 Y116.433 E-.21938
G1 X130.82 Y116.53 E-.07813
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 39/145
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.72 I-1.216 J-.039 P1  F30000
G1 X130.429 Y128.577 Z3.72
G1 Z3.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.380702
G1 F1200
G1 X129.882 Y129.124 E.01342
G1 X129.521 Y129.246 E.00662
; LINE_WIDTH: 0.382302
G3 X128.261 Y129.427 I-1.689 J-7.296 E.02221
; LINE_WIDTH: 0.382152
G3 X126.974 Y129.38 I-.378 J-7.294 E.02247
; LINE_WIDTH: 0.379512
G1 X126.411 Y129.281 E.00989
; LINE_WIDTH: 0.380432
G1 X125.901 Y129.158 E.00909
G1 X125.337 Y128.594 E.01383
G2 X126.479 Y128.937 I2.41 J-5.94 E.02071
; LINE_WIDTH: 0.379272
G2 X127.696 Y129.079 I1.35 J-6.296 E.02121
; LINE_WIDTH: 0.379062
G2 X128.918 Y129.001 I.204 J-6.432 E.02119
; LINE_WIDTH: 0.380702
G1 X129.707 Y128.828 E.01401
G1 X130.372 Y128.597 E.01223
; WIPE_START
G1 F3600
G1 X129.882 Y129.124 E-.27359
G1 X129.521 Y129.246 E-.145
G1 X128.759 Y129.382 E-.29406
G1 X128.635 Y129.393 E-.04735
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.84 I1.217 J.031 P1  F30000
G1 X128.978 Y115.905 Z3.84
G1 Z3.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389362
G1 F1200
M204 S5000
G1 X129.5 Y116.021 E.0095
G3 X131.642 Y117.022 I-1.733 J6.499 E.04226
; LINE_WIDTH: 0.391762
G3 X132.415 Y117.686 I-4.36 J5.863 E.01826
; LINE_WIDTH: 0.391552
G1 X132.849 Y118.161 E.0115
; LINE_WIDTH: 0.390832
G3 X133.499 Y119.114 I-4.974 J4.089 E.02063
; LINE_WIDTH: 0.391812
G3 X133.966 Y120.164 I-5.819 J3.214 E.02058
; LINE_WIDTH: 0.391682
G1 X134.156 Y120.828 E.01236
; LINE_WIDTH: 0.390662
G1 X134.258 Y121.402 E.01039
; LINE_WIDTH: 0.419992
G1 X134.332 Y122.262 E.01665
G1 X134.293 Y122.791 E.01023
; LINE_WIDTH: 0.390602
G3 X134.061 Y124.048 I-6.817 J-.609 E.02283
; LINE_WIDTH: 0.384522
G3 X132.262 Y126.967 I-6.187 J-1.799 E.06086
; LINE_WIDTH: 0.385832
G1 X131.671 Y127.456 E.01351
; LINE_WIDTH: 0.410332
G1 X131.193 Y127.787 E.01093
; LINE_WIDTH: 0.419992
G3 X124.349 Y127.645 I-3.31 J-5.477 E.13921
; LINE_WIDTH: 0.391652
G1 X123.854 Y127.281 E.01099
; LINE_WIDTH: 0.389792
G1 X123.42 Y126.902 E.01027
; LINE_WIDTH: 0.389362
G3 X122.661 Y126.032 I4.456 J-4.653 E.02055
; LINE_WIDTH: 0.391752
G3 X121.846 Y124.512 I6.259 J-4.332 E.03092
; LINE_WIDTH: 0.390842
G3 X121.456 Y122.766 I6.864 J-2.45 E.03201
; LINE_WIDTH: 0.390672
G1 X121.436 Y122.153 E.01095
; LINE_WIDTH: 0.390472
G1 X121.474 Y121.544 E.01087
; LINE_WIDTH: 0.390202
G3 X121.722 Y120.345 I6.566 J.732 E.02186
; LINE_WIDTH: 0.389352
G1 X121.917 Y119.802 E.01026
; LINE_WIDTH: 0.391042
G1 X122.162 Y119.28 E.01029
; LINE_WIDTH: 0.392242
G3 X123.564 Y117.467 I5.838 J3.066 E.04128
; LINE_WIDTH: 0.391052
G1 X123.954 Y117.137 E.00912
; LINE_WIDTH: 0.387892
G1 X124.401 Y116.824 E.00967
; LINE_WIDTH: 0.385772
G3 X127.098 Y115.854 I3.564 J5.677 E.05083
; LINE_WIDTH: 0.388292
G1 X127.788 Y115.807 E.01225
; LINE_WIDTH: 0.389632
G3 X128.919 Y115.893 I.053 J6.767 E.02021
; WIPE_START
G1 F1800
M204 S10000
G1 X129.5 Y116.021 E-.22591
G1 X130.053 Y116.188 E-.21966
G1 X130.588 Y116.407 E-.21957
M73 P54 R10
G1 X130.809 Y116.522 E-.09487
; WIPE_END
G1 E-.04
G17
G3 Z3.84 I-1.039 J.634 P1  F30000
G1 X134.656 Y122.825 Z3.84
G1 Z3.44
G1 E.8 F1800
; LINE_WIDTH: 0.390602
G1 F1200
M204 S5000
G1 X134.589 Y123.354 E.00951
; LINE_WIDTH: 0.390862
G3 X132.716 Y127.03 I-6.848 J-1.173 E.07478
; LINE_WIDTH: 0.392912
G3 X131.865 Y127.76 I-4.96 J-4.926 E.02015
; LINE_WIDTH: 0.412682
G1 X131.42 Y128.121 E.01084
; LINE_WIDTH: 0.419992
G2 X130.043 Y129.493 I104.221 J105.992 E.03747
G3 X125.707 Y129.493 I-2.168 J-7.47 E.0847
G2 X124.105 Y127.915 I-30.444 J29.323 E.04334
; LINE_WIDTH: 0.389062
G1 X123.538 Y127.49 E.01258
; LINE_WIDTH: 0.385772
G3 X121.915 Y125.526 I4.314 J-5.215 E.04512
; LINE_WIDTH: 0.385022
G1 X121.615 Y124.908 E.01207
; LINE_WIDTH: 0.384532
G3 X121.242 Y123.746 I6.189 J-2.632 E.02143
; LINE_WIDTH: 0.384212
G3 X121.081 Y122.537 I6.617 J-1.496 E.02142
; LINE_WIDTH: 0.384502
G1 X121.082 Y121.925 E.01072
; LINE_WIDTH: 0.384982
G3 X121.25 Y120.717 I6.594 J.298 E.02147
; LINE_WIDTH: 0.385772
G3 X121.626 Y119.561 I6.409 J1.449 E.02142
; LINE_WIDTH: 0.391042
G1 X121.84 Y119.109 E.00894
; LINE_WIDTH: 0.392242
G3 X123.328 Y117.188 I6.078 J3.174 E.04378
; LINE_WIDTH: 0.391052
G1 X123.747 Y116.84 E.00972
; LINE_WIDTH: 0.389352
G3 X126.568 Y115.572 I4.24 J5.659 E.05544
; LINE_WIDTH: 0.389762
G3 X127.82 Y115.446 I1.301 J6.655 E.02242
; LINE_WIDTH: 0.387422
G1 X128.506 Y115.477 E.01215
; LINE_WIDTH: 0.385772
G3 X131.383 Y116.422 I-.718 J7.031 E.05372
; LINE_WIDTH: 0.387202
G1 X131.867 Y116.739 E.01021
; LINE_WIDTH: 0.391762
G3 X132.68 Y117.434 I-4.035 J5.546 E.01916
; LINE_WIDTH: 0.391552
G1 X133.136 Y117.935 E.01213
; LINE_WIDTH: 0.390832
G3 X133.822 Y118.944 I-5.257 J4.312 E.0218
; LINE_WIDTH: 0.391812
G3 X134.316 Y120.059 I-5.992 J3.322 E.02185
; LINE_WIDTH: 0.391682
M73 P54 R9
G1 X134.459 Y120.551 E.00917
; LINE_WIDTH: 0.384812
G1 X134.586 Y121.149 E.01074
; LINE_WIDTH: 0.391222
G1 X134.661 Y121.7 E.00993
; LINE_WIDTH: 0.393832
G1 X134.677 Y121.714 E.00038
; LINE_WIDTH: 0.396452
G1 X134.693 Y121.727 E.00038
; LINE_WIDTH: 0.399072
G1 X134.709 Y121.741 E.00038
; LINE_WIDTH: 0.401692
G1 X134.725 Y121.754 E.00039
; LINE_WIDTH: 0.404312
G1 X134.741 Y121.768 E.00039
; LINE_WIDTH: 0.406932
G1 X134.757 Y121.782 E.00039
; LINE_WIDTH: 0.409542
G1 X134.773 Y121.795 E.00039
; LINE_WIDTH: 0.412162
G1 X134.789 Y121.809 E.0004
; LINE_WIDTH: 0.414782
G1 X134.805 Y121.822 E.0004
; LINE_WIDTH: 0.417402
G1 X134.821 Y121.836 E.0004
; LINE_WIDTH: 0.419992
G1 X134.837 Y121.849 E.0004
G1 X134.862 Y121.849 E.00048
G1 X134.887 Y121.849 E.00048
G1 X134.912 Y121.849 E.00048
G1 X134.937 Y121.849 E.00048
G1 X134.962 Y121.849 E.00048
G1 F1154.5
G1 X134.987 Y121.849 E.00048
G1 F999.014
G1 X135.012 Y121.849 E.00048
G1 F854.768
G1 X135.037 Y121.849 E.00048
G1 F721.764
G1 X135.062 Y121.849 E.00048
; FEATURE: Overhang wall
G1 F600
G1 X137.665 Y121.849 E.05017
G1 X137.665 Y121.878 E.00055
; FEATURE: Outer wall
G1 F703.278
G1 X137.665 Y121.899 E.00041
G1 F814.807
G1 X137.665 Y121.921 E.00041
G1 F934.541
G1 X137.665 Y121.942 E.00041
G1 F1062.418
G1 X137.665 Y121.963 E.00041
G1 F1198.558
G1 X137.665 Y121.985 E.00041
G1 F1200
G1 X137.665 Y122.006 E.00041
G1 X137.665 Y122.027 E.00041
G1 X137.665 Y122.049 E.00041
G1 X137.665 Y122.07 E.00041
G1 X137.665 Y122.091 E.00041
G1 X137.665 Y122.113 E.00041
G1 X137.665 Y122.134 E.00041
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
G1 X137.665 Y122.156 E.00041
G1 X137.665 Y122.177 E.00041
G1 X137.665 Y122.198 E.00041
G1 X137.665 Y122.22 E.00041
G1 X137.665 Y122.241 E.00041
G1 X137.665 Y122.25 E.00017
G1 X137.665 Y122.259 E.00017
G1 X137.665 Y122.28 E.00041
G1 X137.665 Y122.301 E.00041
G1 X137.665 Y122.323 E.00041
G1 X137.665 Y122.344 E.00041
G1 X137.665 Y122.365 E.00041
G1 X137.665 Y122.387 E.00041
G1 X137.665 Y122.408 E.00041
G1 X137.665 Y122.429 E.00041
G1 X137.665 Y122.451 E.00041
G1 X137.665 Y122.472 E.00041
G1 X137.665 Y122.493 E.00041
G1 X137.665 Y122.515 E.00041
G1 F1198.426
G1 X137.665 Y122.536 E.00041
G1 F1062.356
G1 X137.665 Y122.557 E.00041
G1 F934.483
G1 X137.665 Y122.579 E.00041
G1 F814.807
G1 X137.665 Y122.6 E.00041
G1 F703.328
G1 X137.665 Y122.621 E.00041
; FEATURE: Overhang wall
G1 F600
G1 X137.665 Y122.65 E.00055
G1 X135.062 Y122.65 E.05017
; FEATURE: Outer wall
G1 F721.713
G1 X135.037 Y122.65 E.00048
G1 F854.713
G1 X135.012 Y122.65 E.00048
G1 F998.954
G1 X134.987 Y122.65 E.00048
G1 F1154.436
G1 X134.962 Y122.65 E.00048
G1 F1200
G1 X134.938 Y122.65 E.00048
G1 X134.913 Y122.65 E.00048
G1 X134.888 Y122.65 E.00048
G1 X134.863 Y122.65 E.00048
G1 X134.838 Y122.65 E.00048
G1 X134.813 Y122.652 E.00048
G1 X134.795 Y122.665 E.00043
; LINE_WIDTH: 0.417862
G1 X134.779 Y122.683 E.00045
; LINE_WIDTH: 0.414812
G1 X134.764 Y122.701 E.00045
; LINE_WIDTH: 0.411762
G1 X134.748 Y122.719 E.00044
; LINE_WIDTH: 0.408712
G1 X134.733 Y122.736 E.00044
; LINE_WIDTH: 0.405652
G1 X134.718 Y122.754 E.00044
; LINE_WIDTH: 0.402602
G1 X134.702 Y122.772 E.00043
; LINE_WIDTH: 0.399552
G1 X134.695 Y122.78 E.00019
M204 S10000
G1 X134.74 Y122.25 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.448292
G1 F1200
G1 X134.837 Y122.25 E.002
; LINE_WIDTH: 0.432752
G1 X134.976 Y122.25 E.00276
; LINE_WIDTH: 0.432732
G1 X135.114 Y122.25 E.00276
; LINE_WIDTH: 0.432712
G1 X135.253 Y122.25 E.00276
; LINE_WIDTH: 0.432692
G1 X137.265 Y122.25 E.04002
; CHANGE_LAYER
; Z_HEIGHT: 3.51158
; LAYER_HEIGHT: 0.071579
; WIPE_START
G1 F3600
G1 X135.265 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/145
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.84 I-.937 J-.776 P1  F30000
G1 X132.037 Y126.145 Z3.84
G1 Z3.512
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1381
G3 X123.58 Y126 I-4.163 J-3.894 E.38147
G1 X132.17 Y126 E.34384
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
G2 X133.512 Y123.106 I-4.287 J-3.745 E.12941
G1 X122.237 Y123.106 E.45125
G3 X122.549 Y120.212 I5.634 J-.857 E.11782
G1 X133.2 Y120.212 E.42629
G2 X131.908 Y118.219 I-5.31 J2.026 E.09575
G2 X130.813 Y117.362 I-4.21 J4.257 E.05579
G1 X130.736 Y117.317 E.00356
G1 X125.014 Y117.317 E.22903
G3 X125.485 Y117.072 I2.864 J4.939 E.02127
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.0484209
; WIPE_START
G1 F7329.351
G1 X125.014 Y117.317 E-.20184
G1 X126.483 Y117.317 E-.55816
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/145
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.912 I-.646 J1.031 P1  F30000
G1 X134.733 Y122.489 Z3.912
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.447712
; LAYER_HEIGHT: 0.12
G1 F1381
G1 X134.733 Y121.984 E.01043
G1 X134.815 Y122.039 E.00203
G1 X137.257 Y122.039 E.05038
G1 X137.257 Y122.25 E.00435
G1 X137.257 Y122.461 E.00435
G1 X135.257 Y122.461 E.04126
G2 X134.792 Y122.479 I-.153 J2.015 E.00962
M204 S250
G1 X134.634 Y123.038 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.392192
G1 F1381
M204 S5000
G1 X134.555 Y123.544 E.00919
; LINE_WIDTH: 0.389852
G1 X134.398 Y124.178 E.01162
; LINE_WIDTH: 0.385772
G3 X132.486 Y127.251 I-6.523 J-1.928 E.06449
; LINE_WIDTH: 0.385932
G1 X132.02 Y127.644 E.01074
; LINE_WIDTH: 0.398352
G1 X131.567 Y127.985 E.01032
; LINE_WIDTH: 0.419992
G2 X130.227 Y129.309 I33.763 J35.492 E.0363
G1 X129.612 Y129.487 E.01235
G1 X128.749 Y129.641 E.01691
G1 X127.875 Y129.692 E.01687
G1 X127.001 Y129.641 E.01687
G1 X126.138 Y129.487 E.01691
G1 X125.523 Y129.309 E.01235
G1 X124.447 Y128.233 E.02931
G1 X124.025 Y127.859 E.01088
; LINE_WIDTH: 0.386392
G1 X123.538 Y127.49 E.01076
; LINE_WIDTH: 0.385772
G1 X123.085 Y127.078 E.01078
; LINE_WIDTH: 0.389642
G3 X122.247 Y126.075 I4.571 J-4.675 E.0233
; LINE_WIDTH: 0.388232
G1 X121.875 Y125.453 E.01285
; LINE_WIDTH: 0.386692
G3 X121.398 Y124.329 I5.633 J-3.051 E.02158
; LINE_WIDTH: 0.385802
G1 X121.223 Y123.658 E.0122
; LINE_WIDTH: 0.391132
G1 X121.087 Y122.727 E.01681
; LINE_WIDTH: 0.410372
G1 X121.076 Y122.7 E.00055
; LINE_WIDTH: 0.429612
G1 X121.066 Y122.673 E.00057
; LINE_WIDTH: 0.448862
G1 X121.055 Y122.646 E.0006
; LINE_WIDTH: 0.468102
G1 X121.044 Y122.619 E.00063
; LINE_WIDTH: 0.487352
G1 X121.033 Y122.592 E.00066
; LINE_WIDTH: 0.506592
G1 X121.023 Y122.565 E.00068
; LINE_WIDTH: 0.525842
G1 X121.012 Y122.538 E.00071
; LINE_WIDTH: 0.545082
G1 X121.001 Y122.511 E.00074
; LINE_WIDTH: 0.554652
G1 X120.979 Y122.498 E.00067
; LINE_WIDTH: 0.548662
G1 X120.945 Y122.498 E.00086
; LINE_WIDTH: 0.536732
G1 X120.911 Y122.498 E.00084
; LINE_WIDTH: 0.524812
G1 X120.905 Y122.498 E.00015
; LINE_WIDTH: 0.522612
G1 X120.88 Y122.498 E.00062
G1 X120.849 Y122.498 E.00076
G1 X120.818 Y122.498 E.00076
G1 X120.787 Y122.498 E.00076
; LINE_WIDTH: 0.522602
G1 X120.756 Y122.498 E.00076
G1 X120.724 Y122.498 E.00076
G1 X120.693 Y122.498 E.00076
G1 X120.68 Y122.498 E.00033
; FEATURE: Overhang wall
; LINE_WIDTH: 0.522592
G1 F1200
G1 X118.635 Y122.498 E.04968
; LINE_WIDTH: 0.522442

G1 X118.386 Y122.498 E.00603
G1 X118.386 Y122.001 E.01206
G1 X118.635 Y122.001 E.00603
; LINE_WIDTH: 0.522592
G1 F600
G1 X120.681 Y122.001 E.04972
; FEATURE: Outer wall
G1 F665.312
G1 X120.695 Y122.001 E.00033
G1 F826.111
G1 X120.726 Y122.001 E.00075
G1 F1004.238
G1 X120.757 Y122.001 E.00075
G1 F1199.806
G1 X120.788 Y122.001 E.00075
; LINE_WIDTH: 0.522602
G1 F1381
G1 X120.819 Y122.001 E.00075
G1 X120.85 Y122.001 E.00076
G1 X120.881 Y122.001 E.00076
; LINE_WIDTH: 0.522612
G1 X120.905 Y122.001 E.00058
; LINE_WIDTH: 0.525372
G1 X120.913 Y122.001 E.00019
; LINE_WIDTH: 0.537272
G1 X120.947 Y122.001 E.00084
; LINE_WIDTH: 0.549172
G1 X120.98 Y122.001 E.00086
; LINE_WIDTH: 0.554652
G1 X121.002 Y121.983 E.00073
; LINE_WIDTH: 0.544072
G1 X121.013 Y121.95 E.00089
; LINE_WIDTH: 0.524452
G1 X121.024 Y121.916 E.00086
; LINE_WIDTH: 0.504822
G1 X121.036 Y121.883 E.00082
; LINE_WIDTH: 0.485202
G1 X121.047 Y121.85 E.00079
; LINE_WIDTH: 0.465582
G1 X121.058 Y121.816 E.00076
; LINE_WIDTH: 0.445952
G1 X121.069 Y121.783 E.00072
; LINE_WIDTH: 0.426332
G1 X121.08 Y121.75 E.00069
; LINE_WIDTH: 0.406712
G1 X121.092 Y121.716 E.00066
; LINE_WIDTH: 0.388422
G1 X121.171 Y121.079 E.01138
; LINE_WIDTH: 0.389352
G3 X121.747 Y119.29 I7.484 J1.423 E.0335
; LINE_WIDTH: 0.389982
G3 X122.445 Y118.152 I5.994 J2.891 E.02382
; LINE_WIDTH: 0.385802
G3 X125.892 Y115.743 I5.507 J4.21 E.07521
; LINE_WIDTH: 0.386702
G3 X127.088 Y115.493 I1.902 J6.105 E.0216
; LINE_WIDTH: 0.385812
G1 X127.814 Y115.452 E.0128
; LINE_WIDTH: 0.386092
G1 X128.511 Y115.477 E.01229
G1 X129.304 Y115.602 E.01414
; LINE_WIDTH: 0.384532
G3 X131.013 Y116.22 I-1.616 J7.14 E.03197
; LINE_WIDTH: 0.391602
G1 X131.461 Y116.468 E.00916
; LINE_WIDTH: 0.391832
G3 X132.434 Y117.199 I-3.622 J5.835 E.0218
; LINE_WIDTH: 0.390832
G1 X132.868 Y117.628 E.0109
; LINE_WIDTH: 0.391832
G3 X133.613 Y118.593 I-5.055 J4.666 E.02185
; LINE_WIDTH: 0.391692
G1 X133.919 Y119.122 E.01094
; LINE_WIDTH: 0.389352
G1 X134.175 Y119.677 E.01086
; LINE_WIDTH: 0.389652
G3 X134.635 Y121.463 I-7.117 J2.787 E.0329
; LINE_WIDTH: 0.393192
G1 X134.656 Y121.483 E.00052
; LINE_WIDTH: 0.396762
G1 X134.677 Y121.503 E.00052
; LINE_WIDTH: 0.400332
G1 X134.699 Y121.522 E.00053
; LINE_WIDTH: 0.403912
G1 X134.72 Y121.542 E.00053
; LINE_WIDTH: 0.407482
G1 X134.741 Y121.562 E.00054
; LINE_WIDTH: 0.411052
G1 X134.762 Y121.581 E.00054
; LINE_WIDTH: 0.414622
G1 X134.783 Y121.601 E.00055
; LINE_WIDTH: 0.418202
G1 X134.804 Y121.621 E.00055
; LINE_WIDTH: 0.419992
G1 X135.074 Y121.631 E.00521
G1 X135.594 Y121.631 E.01001
G1 F1200
G1 X136.113 Y121.631 E.01001
G1 F900
G1 X136.633 Y121.631 E.01001
G1 F600
G1 X137.665 Y121.631 E.0199
G1 X137.665 Y121.648 E.00034
G1 F855.545
G1 X137.665 Y121.698 E.00097
G1 F1156.37
G1 X137.665 Y121.748 E.00097
G1 F1381
G1 X137.665 Y121.799 E.00097
G1 X137.665 Y121.849 E.00097
G1 X137.665 Y121.899 E.00097
G1 X137.665 Y121.949 E.00097
G1 X137.665 Y121.999 E.00097
G1 X137.665 Y122.049 E.00097
G1 X137.665 Y122.099 E.00097
G1 X137.665 Y122.149 E.00097
G1 X137.665 Y122.2 E.00097
G1 X137.665 Y122.25 E.00097
G1 X137.665 Y122.3 E.00097
G1 X137.665 Y122.35 E.00097
G1 X137.665 Y122.4 E.00097
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
G1 X137.665 Y122.45 E.00097
G1 X137.665 Y122.5 E.00097
G1 X137.665 Y122.55 E.00097
G1 X137.665 Y122.601 E.00097
G1 X137.665 Y122.651 E.00097
G1 X137.665 Y122.701 E.00097
G1 X137.665 Y122.751 E.00097
G1 F1156.306
G1 X137.665 Y122.801 E.00097
G1 F855.545
G1 X137.665 Y122.851 E.00097
G1 F600
G1 X137.665 Y122.869 E.00034
G1 X135.264 Y122.869 E.04628
G1 F1381
G1 X134.929 Y122.873 E.00645
; LINE_WIDTH: 0.419382
G1 X134.9 Y122.878 E.00057
; LINE_WIDTH: 0.418552
G1 X134.871 Y122.883 E.00057
; LINE_WIDTH: 0.417722
G1 X134.841 Y122.888 E.00057
; LINE_WIDTH: 0.416882
G1 X134.812 Y122.894 E.00057
; LINE_WIDTH: 0.416052
G1 X134.782 Y122.899 E.00057
; LINE_WIDTH: 0.415212
G1 X134.753 Y122.904 E.00057
; LINE_WIDTH: 0.414382
G1 X134.723 Y122.909 E.00057
; LINE_WIDTH: 0.413542
G1 X134.694 Y122.914 E.00056
; LINE_WIDTH: 0.412712
G1 X134.694 Y122.915 E.00001
; LINE_WIDTH: 0.412672
G1 X134.674 Y122.956 E.00086
; LINE_WIDTH: 0.405842
G1 X134.66 Y122.984 E.00058
; WIPE_START
G1 F2250
M204 S10000
G1 X134.555 Y123.544 E-.21668
G1 X134.398 Y124.178 E-.24806
G1 X134.199 Y124.755 E-.23197
G1 X134.131 Y124.907 E-.0633
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.96 I1.056 J-.605 P1  F30000
G1 X128.975 Y115.913 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.392912
G1 F1381
M204 S5000
G1 X129.496 Y116.018 E.00954
; LINE_WIDTH: 0.390822
G3 X130.579 Y116.406 I-1.619 J6.227 E.02057
; LINE_WIDTH: 0.391602
G1 X131.265 Y116.777 E.01395
; LINE_WIDTH: 0.391832
G3 X132.183 Y117.464 I-3.524 J5.663 E.02056
; LINE_WIDTH: 0.390832
G1 X132.595 Y117.87 E.01032
; LINE_WIDTH: 0.391832
G3 X133.298 Y118.78 I-4.907 J4.515 E.02061
; LINE_WIDTH: 0.391692
G1 X133.59 Y119.278 E.01032
; LINE_WIDTH: 0.389352
G1 X133.833 Y119.802 E.01028
; LINE_WIDTH: 0.389652
G3 X134.276 Y121.522 I-6.632 J2.624 E.03167
; LINE_WIDTH: 0.419992
G3 X134.314 Y122.724 I-4.679 J.748 E.02324
; LINE_WIDTH: 0.412712
G1 X134.219 Y123.375 E.01244
; LINE_WIDTH: 0.389792
G3 X133.904 Y124.518 I-6.597 J-1.2 E.02114
; LINE_WIDTH: 0.389372
G3 X131.886 Y127.29 I-6.03 J-2.269 E.06168
; LINE_WIDTH: 0.389962
G1 X131.433 Y127.619 E.00998
; LINE_WIDTH: 0.419992
G3 X128.655 Y128.662 I-3.523 J-5.163 E.05775
G3 X124.308 Y127.614 I-.8 J-6.22 E.08814
; LINE_WIDTH: 0.389462
G3 X123.779 Y127.223 I5.223 J-7.615 E.0117
; LINE_WIDTH: 0.385752
G1 X123.36 Y126.845 E.00993
; LINE_WIDTH: 0.385512
G1 X122.966 Y126.421 E.01018
; LINE_WIDTH: 0.387492
G1 X122.566 Y125.9 E.01161
; LINE_WIDTH: 0.389752
G3 X121.96 Y124.803 I5.728 J-3.884 E.02234
; LINE_WIDTH: 0.389382
G1 X121.778 Y124.327 E.00907
; LINE_WIDTH: 0.391062
G1 X121.619 Y123.773 E.0103
; LINE_WIDTH: 0.391532
G1 X121.496 Y123.124 E.01182
; LINE_WIDTH: 0.435622
G1 X121.441 Y122.74 E.00776
; LINE_WIDTH: 0.479712
G1 X121.386 Y122.357 E.0086
; LINE_WIDTH: 0.517182
G1 X121.369 Y122.307 E.00127
; LINE_WIDTH: 0.554652
G1 X121.351 Y122.257 E.00136
G1 X121.376 Y122.133 E.00328
; LINE_WIDTH: 0.51276
G1 X121.401 Y122.009 E.00302
; LINE_WIDTH: 0.470867
G1 X121.425 Y121.884 E.00276
; LINE_WIDTH: 0.428975
G1 X121.45 Y121.76 E.0025
; LINE_WIDTH: 0.387082
G1 X121.518 Y121.202 E.00993
; LINE_WIDTH: 0.386412
G1 X121.638 Y120.637 E.01019
; LINE_WIDTH: 0.385782
G3 X122.292 Y119.035 I6.976 J1.914 E.03053
; LINE_WIDTH: 0.389962
G3 X123.028 Y118.007 I5.824 J3.395 E.02255
; LINE_WIDTH: 0.389362
G3 X127.015 Y115.866 I4.847 J4.243 E.08221
; LINE_WIDTH: 0.391662
G3 X128.367 Y115.827 I.879 J7.099 E.02423
; LINE_WIDTH: 0.392912
G3 X128.865 Y115.891 I-.763 J7.964 E.00901
G1 X128.916 Y115.901 E.00094
; WIPE_START
G1 F1800
M204 S10000
G1 X129.496 Y116.018 E-.22476
G1 X130.047 Y116.188 E-.2193
G1 X130.579 Y116.406 E-.21837
G1 X130.805 Y116.528 E-.09757
; WIPE_END
G1 E-.04
G17
G3 Z3.96 I-1.127 J-.459 P1  F30000
G1 X125.78 Y128.872 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.613672
G1 F1381
G2 X126.87 Y129.123 I1.842 J-5.519 E.03219
; LINE_WIDTH: 0.605272
G1 X127.49 Y129.184 E.01766
; LINE_WIDTH: 0.603972
G1 X128.114 Y129.191 E.01762
; LINE_WIDTH: 0.611392
G2 X129.35 Y129.038 I-.148 J-6.269 E.03573
; LINE_WIDTH: 0.609592
G1 X129.97 Y128.874 E.01833
; CHANGE_LAYER
; Z_HEIGHT: 3.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X129.35 Y129.038 E-.244
G1 X128.735 Y129.146 E-.23709
G1 X128.114 Y129.191 E-.23684
G1 X128.003 Y129.19 E-.04207
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/145
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.96 I.851 J.87 P1  F30000
G1 X134.815 Y122.531 Z3.96
G1 Z3.68
G1 E.8 F1800
; LINE_WIDTH: 0.605072
G1 F1200
G1 X134.815 Y121.96 E.01617
G1 X136.815 Y121.96 E.05665
; LINE_WIDTH: 0.604932
G1 X137.178 Y121.96 E.01028
G1 X137.178 Y122.25 E.0082
G1 X137.178 Y122.539 E.0082
G1 X136.889 Y122.539 E.0082
; LINE_WIDTH: 0.605072
G3 X134.875 Y122.533 I-.893 J-34.773 E.05703
M204 S250
G1 X134.616 Y123.193 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.388462
G1 F1200
M204 S5000
G1 X134.453 Y123.977 E.0142
; LINE_WIDTH: 0.384882
G1 X134.272 Y124.559 E.01071
; LINE_WIDTH: 0.384532
G3 X133.371 Y126.248 I-6.858 J-2.572 E.03367
; LINE_WIDTH: 0.382202
G1 X132.914 Y126.812 E.01266
; LINE_WIDTH: 0.385762
G1 X132.487 Y127.25 E.01078
; LINE_WIDTH: 0.385932
G1 X132.02 Y127.644 E.01075
; LINE_WIDTH: 0.398362
G1 X131.567 Y127.985 E.01033
; LINE_WIDTH: 0.419992
M73 P55 R9
G2 X130.424 Y129.112 I28.69 J30.222 E.03093
G1 X129.583 Y129.37 E.01698
G1 X128.735 Y129.522 E.0166
G1 X127.874 Y129.572 E.01661
G3 X126.117 Y129.345 I.065 J-7.415 E.03424
G1 X125.328 Y129.114 E.01585
G1 X124.448 Y128.233 E.024
G1 X124.025 Y127.859 E.01089
; LINE_WIDTH: 0.386382
G1 X123.538 Y127.49 E.01076
; LINE_WIDTH: 0.385772
G1 X123.085 Y127.078 E.01078
; LINE_WIDTH: 0.389672
G3 X122.245 Y126.073 I4.569 J-4.672 E.02334
; LINE_WIDTH: 0.388192
G1 X121.875 Y125.454 E.01278
; LINE_WIDTH: 0.385792
G3 X121.238 Y123.741 I6.769 J-3.488 E.03225
; LINE_WIDTH: 0.390822
G1 X121.107 Y122.953 E.01427
; LINE_WIDTH: 0.396912
G1 X121.088 Y122.92 E.00068
; LINE_WIDTH: 0.403002
G1 X121.07 Y122.888 E.00069
; LINE_WIDTH: 0.409092
G1 X121.052 Y122.856 E.0007
; LINE_WIDTH: 0.415182
G1 X121.033 Y122.823 E.00071
; LINE_WIDTH: 0.418652
G1 X121.023 Y122.805 E.00041
; LINE_WIDTH: 0.418782
G1 X121.013 Y122.802 E.0002
; LINE_WIDTH: 0.419112
G1 X120.989 Y122.796 E.00047
; LINE_WIDTH: 0.419432
G1 X120.966 Y122.789 E.00047
; LINE_WIDTH: 0.419762
G1 X120.942 Y122.783 E.00047
; LINE_WIDTH: 0.419992
G2 X120.78 Y122.778 I-.089 J.295 E.00317
G1 X120.288 Y122.778 E.00948
G1 X119.796 Y122.778 E.00948
G1 F900
G1 X119.304 Y122.778 E.00948
G1 F600
G1 X118.335 Y122.778 E.01868
G1 X118.335 Y121.721 E.02037
G1 X120.475 Y121.721 E.04124
G1 F1200
G1 X120.659 Y121.721 E.00354
G1 X120.843 Y121.721 E.00354
G2 X120.912 Y121.718 I.025 J-.216 E.00134
; LINE_WIDTH: 0.419782
G1 X120.938 Y121.714 E.00051
; LINE_WIDTH: 0.419502
G1 X120.964 Y121.71 E.00051
; LINE_WIDTH: 0.419212
G1 X120.991 Y121.705 E.00051
; LINE_WIDTH: 0.418922
G1 X121.007 Y121.703 E.00032
; LINE_WIDTH: 0.418732
G1 X121.014 Y121.694 E.00021
; LINE_WIDTH: 0.417002
G1 X121.032 Y121.669 E.00058
; LINE_WIDTH: 0.412342
G1 X121.049 Y121.645 E.00057
; LINE_WIDTH: 0.407672
G1 X121.067 Y121.621 E.00056
; LINE_WIDTH: 0.403012
G1 X121.085 Y121.596 E.00056
; LINE_WIDTH: 0.398342
G1 X121.103 Y121.572 E.00055
; LINE_WIDTH: 0.393672
G1 X121.138 Y121.318 E.00462
; LINE_WIDTH: 0.384652
G1 X121.25 Y120.717 E.01073
; LINE_WIDTH: 0.385762
G1 X121.41 Y120.132 E.01067
; LINE_WIDTH: 0.391132
G3 X121.84 Y119.108 I6.317 J2.046 E.01986
; LINE_WIDTH: 0.392202
G3 X123.329 Y117.188 I6.08 J3.177 E.04377
; LINE_WIDTH: 0.391142
G1 X123.8 Y116.8 E.01091
; LINE_WIDTH: 0.389892
G3 X124.838 Y116.16 I4.196 J5.644 E.02174
; LINE_WIDTH: 0.389372
G1 X125.397 Y115.912 E.01087
; LINE_WIDTH: 0.389262
G1 X125.884 Y115.75 E.00913
; LINE_WIDTH: 0.384542
G1 X126.476 Y115.594 E.01074
; LINE_WIDTH: 0.384642
G3 X127.809 Y115.459 I1.272 J5.884 E.02354
; LINE_WIDTH: 0.385852
G1 X128.512 Y115.477 E.01238
G1 X129.305 Y115.601 E.01414
; LINE_WIDTH: 0.384552
G1 X129.896 Y115.76 E.01074
; LINE_WIDTH: 0.385772
G3 X131.023 Y116.219 I-1.763 J5.941 E.02145
; LINE_WIDTH: 0.391652
G1 X131.458 Y116.466 E.00896
; LINE_WIDTH: 0.391862
G3 X132.434 Y117.199 I-3.633 J5.853 E.02187
; LINE_WIDTH: 0.390832
G1 X132.868 Y117.628 E.01089
; LINE_WIDTH: 0.391872
G3 X133.613 Y118.594 I-5.058 J4.669 E.02186
; LINE_WIDTH: 0.391642
G1 X133.918 Y119.122 E.01092
; LINE_WIDTH: 0.389352
G3 X134.525 Y120.803 I-6.93 J3.45 E.03184
; LINE_WIDTH: 0.388872
G1 X134.616 Y121.308 E.00911
; LINE_WIDTH: 0.393572
G1 X134.645 Y121.335 E.00071
; LINE_WIDTH: 0.398652
G1 X134.673 Y121.361 E.00072
; LINE_WIDTH: 0.403732
G1 X134.702 Y121.388 E.00072
; LINE_WIDTH: 0.408812
G1 X134.731 Y121.415 E.00073
; LINE_WIDTH: 0.413902
G1 X134.76 Y121.441 E.00074
; LINE_WIDTH: 0.418982
G1 X134.789 Y121.468 E.00075
; LINE_WIDTH: 0.419992
G1 X135.232 Y121.473 E.00855
G1 X135.779 Y121.473 E.01053
G1 X136.325 Y121.473 E.01053
G1 X137.665 Y121.473 E.02583
G1 X137.665 Y121.541 E.0013
G1 X137.665 Y121.62 E.00152
G1 X137.665 Y121.698 E.00152
G1 X137.665 Y121.777 E.00152
G1 X137.665 Y121.856 E.00152
G1 X137.665 Y121.935 E.00152
G1 X137.665 Y122.013 E.00152
G1 X137.665 Y122.092 E.00152
G1 X137.665 Y122.171 E.00152
G1 X137.665 Y122.25 E.00152
G1 X137.665 Y122.328 E.00152
G1 X137.665 Y122.407 E.00152
G1 X137.665 Y122.486 E.00152
G1 X137.665 Y122.565 E.00152
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
G1 X137.665 Y122.644 E.00152
G1 X137.665 Y122.722 E.00152
G1 X137.665 Y122.801 E.00152
G1 X137.665 Y122.88 E.00152
G1 X137.665 Y122.959 E.00152
G1 X137.665 Y123.026 E.0013
G1 X135.463 Y123.026 E.04244
G1 X135.229 Y123.026 E.00453
G1 X134.994 Y123.026 E.00453
G1 X134.79 Y123.03 E.00393
; LINE_WIDTH: 0.419222
G1 X134.761 Y123.057 E.00076
; LINE_WIDTH: 0.414102
G1 X134.732 Y123.084 E.00075
; LINE_WIDTH: 0.408972
G1 X134.703 Y123.111 E.00074
; LINE_WIDTH: 0.403842
G1 X134.674 Y123.138 E.00073
; LINE_WIDTH: 0.398722
G1 X134.659 Y123.152 E.00035
; WIPE_START
G1 F2250
M204 S10000
G1 X134.453 Y123.977 E-.32317
G1 X134.272 Y124.559 E-.23172
G1 X134.066 Y125.058 E-.20511
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.08 I1.063 J-.593 P1  F30000
G1 X128.963 Y115.908 Z4.08
G1 Z3.68
G1 E.8 F1800
; LINE_WIDTH: 0.392912
G1 F1200
M204 S5000
G1 X129.492 Y116.017 E.0097
; LINE_WIDTH: 0.390772
G1 X130.236 Y116.256 E.01394
; LINE_WIDTH: 0.389342
G1 X130.762 Y116.491 E.01024
; LINE_WIDTH: 0.391652
G1 X131.262 Y116.775 E.0103
; LINE_WIDTH: 0.391862
G3 X132.184 Y117.465 I-3.534 J5.682 E.02063
; LINE_WIDTH: 0.390832
G1 X132.595 Y117.87 E.0103
; LINE_WIDTH: 0.391872
G3 X133.298 Y118.78 I-4.922 J4.527 E.02062
; LINE_WIDTH: 0.391642
G1 X133.59 Y119.277 E.0103
; LINE_WIDTH: 0.389352
G3 X134.169 Y120.875 I-6.564 J3.284 E.03028
; LINE_WIDTH: 0.390112
G1 X134.263 Y121.393 E.00938
; LINE_WIDTH: 0.419992
G3 X134.263 Y123.107 I-5.56 J.857 E.03317
; LINE_WIDTH: 0.392682
G3 X134.028 Y124.147 I-8.517 J-1.372 E.01915
; LINE_WIDTH: 0.390852
G3 X133.59 Y125.216 I-6.151 J-1.897 E.02064
; LINE_WIDTH: 0.391802
G1 X133.302 Y125.712 E.01027
; LINE_WIDTH: 0.392022
G3 X132.321 Y126.911 I-5.716 J-3.678 E.02779
; LINE_WIDTH: 0.389352
G1 X131.886 Y127.29 E.01025
; LINE_WIDTH: 0.389962
G1 X131.433 Y127.619 E.00998
; LINE_WIDTH: 0.419992
G1 X130.858 Y127.979 E.01307
G3 X125.787 Y128.363 I-2.99 J-5.816 E.10068
G3 X124.308 Y127.614 I2.016 J-5.816 E.03207
; LINE_WIDTH: 0.389452
G3 X123.422 Y126.904 I3.615 J-5.418 E.02022
; LINE_WIDTH: 0.389342
G1 X122.966 Y126.422 E.01179
; LINE_WIDTH: 0.387552
G1 X122.565 Y125.898 E.01167
; LINE_WIDTH: 0.389752
G3 X121.988 Y124.865 I5.578 J-3.789 E.02108
; LINE_WIDTH: 0.389372
G3 X121.493 Y123.139 I6.707 J-2.858 E.03201
; LINE_WIDTH: 0.418652
G3 X121.49 Y121.393 I5.463 J-.883 E.03368
; LINE_WIDTH: 0.384922
G1 X121.593 Y120.824 E.01015
; LINE_WIDTH: 0.386262
G3 X121.981 Y119.651 I6.094 J1.365 E.02182
; LINE_WIDTH: 0.385542
G3 X122.602 Y118.549 I5.908 J2.606 E.02228
; LINE_WIDTH: 0.384632
G1 X122.956 Y118.09 E.01017
; LINE_WIDTH: 0.385252
G1 X123.427 Y117.59 E.01207
; LINE_WIDTH: 0.385802
G3 X124.4 Y116.825 I4.341 J4.521 E.02183
; LINE_WIDTH: 0.386032
G3 X125.425 Y116.291 I3.421 J5.312 E.02038
; LINE_WIDTH: 0.385772
G1 X125.969 Y116.097 E.01017
; LINE_WIDTH: 0.384532
G3 X127.784 Y115.812 I1.967 J6.589 E.03232
; LINE_WIDTH: 0.389422
G1 X128.369 Y115.828 E.01041
; LINE_WIDTH: 0.392912
G3 X128.904 Y115.896 I-.714 J7.656 E.00969
; WIPE_START
G1 F1800
M204 S10000
G1 X129.492 Y116.017 E-.22805
G1 X130.236 Y116.256 E-.29686
G1 X130.762 Y116.491 E-.21882
G1 X130.799 Y116.512 E-.01627
; WIPE_END
G1 E-.04
G17
G3 Z4.08 I-1.215 J-.06 P1  F30000
G1 X130.196 Y128.733 Z4.08
G1 Z3.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.490032
G1 F1200
G1 X129.68 Y128.895 E.01228
; LINE_WIDTH: 0.483932
G1 X129.132 Y129.019 E.01259
; LINE_WIDTH: 0.482612
G1 X128.324 Y129.12 E.01819
; LINE_WIDTH: 0.487292
G1 X127.697 Y129.135 E.01415
; LINE_WIDTH: 0.487972
G3 X126.276 Y128.946 I.171 J-6.732 E.03245
; LINE_WIDTH: 0.490812
G1 X125.675 Y128.778 E.01418
; LINE_WIDTH: 0.493832
G1 X125.562 Y128.738 E.00276
; WIPE_START
G1 F3600
G1 X125.675 Y128.778 E-.04576
G1 X126.276 Y128.946 E-.23705
G1 X126.997 Y129.08 E-.27863
G1 X127.518 Y129.121 E-.19857
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.08 I.876 J-.845 P1  F30000
G1 X120.893 Y122.25 Z4.08
G1 Z3.68
G1 E.8 F1800
; LINE_WIDTH: 0.688552
G1 F1200
G1 X118.863 Y122.25 E.06576
; CHANGE_LAYER
; Z_HEIGHT: 3.78316
; LAYER_HEIGHT: 0.103158
; WIPE_START
G1 F3600
G1 X120.863 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/145
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.08 I.908 J.81 P1  F30000
G1 X125.485 Y117.072 Z4.08
G1 Z3.783
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1456
G2 X125.014 Y117.317 I3.575 J7.459 E.02127
G1 X130.736 Y117.317 E.22903
G3 X133.2 Y120.212 I-2.911 J4.974 E.15503
G1 X122.549 Y120.212 E.42628
G2 X122.237 Y123.106 I5.328 J2.038 E.11781
G1 X133.512 Y123.106 E.45124
G3 X132.17 Y126 I-5.639 J-.855 E.1294
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
G1 X123.58 Y126 E.34384
G2 X132.037 Y126.145 I4.295 J-3.752 E.38142
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0168421
; WIPE_START
G1 F7329.351
G1 X131.088 Y126.962 E-.47582
G1 X130.429 Y127.316 E-.28418
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/145
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.183 I.887 J.833 P1  F30000
G1 X134.731 Y122.736 Z4.183
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F1456
G1 X134.72 Y121.747 E.02052
G1 X134.776 Y121.76 E.00119
G1 X137.256 Y121.76 E.05143
G1 X137.256 Y122.25 E.01016
G1 X137.256 Y122.739 E.01015
G1 X134.791 Y122.736 E.05112
; WIPE_START
G1 F3600
G1 X134.72 Y121.747 E-.37699
G1 X134.776 Y121.76 E-.02187
G1 X135.726 Y121.76 E-.36114
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.518 J1.101 P1  F30000
G1 X136.766 Y122.25 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.580772
G1 F1456
G1 X135.231 Y122.25 E.04166
; WIPE_START
G1 F3600
G1 X136.766 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.021 J-1.217 P1  F30000
G1 X120.983 Y122.516 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.514342
G1 F1456
G1 X120.944 Y122.494 E.00109
G1 X118.776 Y122.494 E.05177
G1 X118.776 Y122.005 E.01167
G1 X120.984 Y121.995 E.05275
G1 X120.984 Y122.456 E.01102
; WIPE_START
G1 F3600
G1 X120.944 Y122.494 E-.02101
G1 X118.999 Y122.494 E-.73899
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.67 J1.016 P1  F30000
G1 X128.977 Y115.909 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384552
G1 F1456
M204 S5000
G1 X129.206 Y115.952 E.00408
G3 X129.766 Y116.093 I-1.413 J6.836 E.01013
; LINE_WIDTH: 0.386252
G3 X131.426 Y116.875 I-2.109 J6.627 E.03244
; LINE_WIDTH: 0.385342
G1 X131.959 Y117.268 E.01165
; LINE_WIDTH: 0.384582
G1 X132.39 Y117.656 E.01016
; LINE_WIDTH: 0.386242
G3 X133.543 Y119.188 I-4.9 J4.889 E.03391
; LINE_WIDTH: 0.384652
G1 X133.795 Y119.71 E.01019
; LINE_WIDTH: 0.384532
G3 X134.171 Y120.89 I-5.786 J2.489 E.02176
; LINE_WIDTH: 0.412302
G1 X134.294 Y121.564 E.01295
; LINE_WIDTH: 0.419992
G3 X134.236 Y123.25 I-5.823 J.644 E.03263
; LINE_WIDTH: 0.392172
G3 X133.969 Y124.331 I-6.997 J-1.161 E.01996
; LINE_WIDTH: 0.390842
G3 X132.803 Y126.395 I-6.101 J-2.084 E.04256
; LINE_WIDTH: 0.392922
G3 X132.044 Y127.16 I-5.994 J-5.184 E.01936
; LINE_WIDTH: 0.389562
G1 X131.583 Y127.517 E.01038
; LINE_WIDTH: 0.412932
G1 X131.177 Y127.797 E.00933
; LINE_WIDTH: 0.419992
G3 X127.69 Y128.707 I-3.328 J-5.622 E.07037
G3 X124.308 Y127.614 I.161 J-6.28 E.06947
; LINE_WIDTH: 0.389472
G3 X123.422 Y126.904 I3.614 J-5.417 E.02021
; LINE_WIDTH: 0.389342
G1 X122.966 Y126.421 E.0118
; LINE_WIDTH: 0.389942
G3 X122.246 Y125.382 I5.112 J-4.308 E.02255
; LINE_WIDTH: 0.389372
G3 X121.777 Y124.326 I5.626 J-3.131 E.02056
; LINE_WIDTH: 0.391192
G1 X121.619 Y123.772 E.01031
; LINE_WIDTH: 0.392422
G1 X121.516 Y123.246 E.00959
; LINE_WIDTH: 0.419992
G1 X121.42 Y122.429 E.01586
G1 X121.435 Y121.776 E.0126
; LINE_WIDTH: 0.414902
G1 X121.534 Y121.12 E.01262
; LINE_WIDTH: 0.384612
G3 X122.11 Y119.375 I6.941 J1.322 E.03233
; LINE_WIDTH: 0.385092
G1 X122.435 Y118.799 E.01162
; LINE_WIDTH: 0.385792
G3 X123.63 Y117.403 I5.94 J3.874 E.03243
G1 X123.632 Y117.402 E.00005
; LINE_WIDTH: 0.388112
G1 X124.168 Y116.98 E.01209
; LINE_WIDTH: 0.389652
G3 X125.172 Y116.403 I3.861 J5.557 E.02063
; LINE_WIDTH: 0.391172
G1 X125.707 Y116.187 E.0103
; LINE_WIDTH: 0.392152
G3 X126.82 Y115.898 I2.286 J6.506 E.02064
; LINE_WIDTH: 0.394742
G3 X128.054 Y115.813 I1.171 J8.033 E.02234
; LINE_WIDTH: 0.384552
G3 X128.635 Y115.859 I-.261 J6.976 E.01023
G1 X128.918 Y115.9 E.00501
; WIPE_START
G1 F1800
M204 S10000
G1 X129.206 Y115.952 E-.11118
G1 X129.766 Y116.093 E-.21941
G1 X130.311 Y116.285 E-.21952
G1 X130.812 Y116.516 E-.2099
; WIPE_END
G1 E-.04
G17
G3 Z4.2 I-1.063 J.592 P1  F30000
G1 X134.597 Y123.31 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.392172
G1 F1456
M204 S5000
G3 X134.311 Y124.456 I-7.009 J-1.137 E.02119
; LINE_WIDTH: 0.390842
G3 X133.078 Y126.633 I-6.429 J-2.204 E.04491
; LINE_WIDTH: 0.392922
G3 X132.269 Y127.446 I-5.451 J-4.621 E.02062
; LINE_WIDTH: 0.389352
G1 X131.865 Y127.76 E.00909
; LINE_WIDTH: 0.412932
G1 X131.417 Y128.124 E.01092
; LINE_WIDTH: 0.419992
G1 X130.635 Y128.901 E.02125
G1 X129.964 Y129.143 E.01375
G1 X129.14 Y129.34 E.01635
G3 X125.115 Y128.901 I-1.253 J-7.171 E.07909
G2 X124.025 Y127.859 I-9.172 J8.505 E.02909
; LINE_WIDTH: 0.386402
G1 X123.538 Y127.49 E.01076
; LINE_WIDTH: 0.385772
G1 X123.085 Y127.078 E.01078
; LINE_WIDTH: 0.389962
G3 X122.186 Y125.979 I4.435 J-4.547 E.02534
; LINE_WIDTH: 0.385782
G3 X121.22 Y123.655 I5.673 J-3.72 E.04456
; LINE_WIDTH: 0.399732
G1 X121.11 Y123.048 E.01128
; LINE_WIDTH: 0.403032
G1 X121.083 Y123.03 E.00061
; LINE_WIDTH: 0.406332
G1 X121.056 Y123.011 E.00061
; LINE_WIDTH: 0.409642
G1 X121.029 Y122.993 E.00062
; LINE_WIDTH: 0.412942
G1 X121.002 Y122.975 E.00062
; LINE_WIDTH: 0.416242
G1 X120.974 Y122.956 E.00063
; LINE_WIDTH: 0.419552
G1 X120.947 Y122.938 E.00063
; LINE_WIDTH: 0.419992
G1 X120.477 Y122.935 E.00906
G1 X119.94 Y122.935 E.01035
G1 X119.403 Y122.935 E.01035
G1 X118.335 Y122.935 E.02059
G1 X118.335 Y121.564 E.02643
G1 X120.335 Y121.564 E.03855
G2 X120.765 Y121.561 I.199 J-2.394 E.00831
; LINE_WIDTH: 0.419452
G1 X120.804 Y121.558 E.00075
; LINE_WIDTH: 0.418812
G1 X120.843 Y121.554 E.00075
; LINE_WIDTH: 0.418162
G1 X120.881 Y121.551 E.00075
; LINE_WIDTH: 0.417522
G1 X120.92 Y121.547 E.00074
; LINE_WIDTH: 0.416882
G1 X120.959 Y121.544 E.00074
; LINE_WIDTH: 0.416242
G1 X120.997 Y121.54 E.00074
; LINE_WIDTH: 0.415602
G1 X121.036 Y121.537 E.00074
; LINE_WIDTH: 0.414962
G1 X121.08 Y121.471 E.0015
; LINE_WIDTH: 0.404232
G1 X121.124 Y121.4 E.00154
; LINE_WIDTH: 0.392642
G1 X121.268 Y120.627 E.01411
; LINE_WIDTH: 0.392102
M73 P56 R9
G1 X121.439 Y120.043 E.01089
; LINE_WIDTH: 0.390842
G1 X121.663 Y119.475 E.0109
; LINE_WIDTH: 0.391912
G3 X122.258 Y118.41 I6.288 J2.82 E.02187
; LINE_WIDTH: 0.391602
G1 X122.624 Y117.921 E.01092
; LINE_WIDTH: 0.389372
G1 X123.033 Y117.468 E.01085
; LINE_WIDTH: 0.389752
G3 X123.99 Y116.664 I4.842 J4.784 E.02228
; LINE_WIDTH: 0.387612
G1 X124.581 Y116.298 E.0123
; LINE_WIDTH: 0.385792
G1 X125.123 Y116.029 E.01066
; LINE_WIDTH: 0.391172
G1 X125.587 Y115.842 E.00894
; LINE_WIDTH: 0.392152
G3 X126.769 Y115.536 I2.324 J6.544 E.02189
; LINE_WIDTH: 0.394742
G3 X128.089 Y115.459 I1.029 J6.285 E.0239
; LINE_WIDTH: 0.384542
G3 X129.896 Y115.76 I-.231 J6.963 E.03224
; LINE_WIDTH: 0.385772
G3 X131.649 Y116.592 I-2.152 J6.797 E.03425
; LINE_WIDTH: 0.385082
G1 X132.207 Y117.007 E.01222
; LINE_WIDTH: 0.384522
G1 X132.658 Y117.421 E.01074
; LINE_WIDTH: 0.385762
G3 X133.447 Y118.347 I-4.297 J4.457 E.02145
; LINE_WIDTH: 0.392922
G3 X134.009 Y119.306 I-5.647 J3.956 E.01997
; LINE_WIDTH: 0.390832
G1 X134.248 Y119.866 E.01088
; LINE_WIDTH: 0.391842
G1 X134.435 Y120.448 E.01093
; LINE_WIDTH: 0.392982
G1 X134.597 Y121.193 E.01369
; LINE_WIDTH: 0.412302
G1 X134.672 Y121.317 E.00274
; LINE_WIDTH: 0.414002
G1 X134.695 Y121.324 E.00046
; LINE_WIDTH: 0.415702
G1 X134.718 Y121.332 E.00046
; LINE_WIDTH: 0.417402
G1 X134.741 Y121.339 E.00046
; LINE_WIDTH: 0.419102
G1 X134.764 Y121.347 E.00047
; LINE_WIDTH: 0.419992
G1 X135.02 Y121.351 E.00493
G1 X135.529 Y121.351 E.00981
G1 X136.038 Y121.351 E.00982
G1 X136.547 Y121.351 E.00981
G1 X137.665 Y121.351 E.02154
G1 X137.665 Y121.399 E.00093
G1 X137.665 Y121.505 E.00205
G1 X137.665 Y121.612 E.00205
G1 X137.665 Y121.718 E.00205
G1 X137.665 Y121.824 E.00205
G1 X137.665 Y121.931 E.00205
G1 X137.665 Y122.037 E.00205
G1 X137.665 Y122.143 E.00205
G1 X137.665 Y122.25 E.00205
G1 X137.665 Y122.356 E.00205
G1 X137.665 Y122.462 E.00205
G1 X137.665 Y122.569 E.00205
G1 X137.665 Y122.675 E.00205
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
G1 X137.665 Y122.781 E.00205
G1 X137.665 Y122.888 E.00205
G1 X137.665 Y122.994 E.00205
G1 X137.665 Y123.1 E.00205
G1 X137.665 Y123.149 E.00093
G1 X135.563 Y123.149 E.04052
G1 X135.336 Y123.149 E.00436
G1 X135.11 Y123.149 E.00436
G1 X134.884 Y123.149 E.00436
G1 X134.776 Y123.149 E.00207
G1 X134.755 Y123.167 E.00054
; LINE_WIDTH: 0.416662
G1 X134.716 Y123.203 E.00102
; LINE_WIDTH: 0.410322
G1 X134.676 Y123.238 E.001
; LINE_WIDTH: 0.403972
G1 X134.641 Y123.27 E.00086
; WIPE_START
G1 F2250
M204 S10000
G1 X134.483 Y123.87 E-.23607
G1 X134.311 Y124.456 E-.23207
G1 X134.087 Y125.025 E-.2322
G1 X134.017 Y125.165 E-.05965
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.445 J-1.133 P1  F30000
G1 X125.319 Y128.579 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.375292
G1 F1456
G1 X125.693 Y128.718 E.00681
; LINE_WIDTH: 0.366512
G1 X126.287 Y128.887 E.01029
; LINE_WIDTH: 0.364912
G1 X126.999 Y129.019 E.01201
; LINE_WIDTH: 0.369512
G1 X127.696 Y129.076 E.01175
; LINE_WIDTH: 0.374432
G1 X128.371 Y129.06 E.01151
; LINE_WIDTH: 0.378712
G1 X129.073 Y128.972 E.01222
; LINE_WIDTH: 0.379532
G1 X129.857 Y128.784 E.01394
G1 X130.43 Y128.578 E.01054
; CHANGE_LAYER
; Z_HEIGHT: 3.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X129.857 Y128.784 E-.23145
G1 X129.073 Y128.972 E-.3063
G1 X128.493 Y129.045 E-.22225
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/145
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.2 I.844 J-.876 P1  F30000
G1 X121.021 Y121.846 Z4.2
G1 Z3.92
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F1200
G2 X121.025 Y122.669 I10.885 J.361 E.01707
G1 X120.96 Y122.645 E.00144
G1 X118.744 Y122.645 E.04595
G1 X118.744 Y121.854 E.01642
G2 X120.961 Y121.847 I.936 J-59.106 E.04599
G1 X120.613 Y122.25 F30000
; LINE_WIDTH: 0.393072
G1 F1200
G1 X119.14 Y122.25 E.02646
; WIPE_START
G1 F3600
G1 X120.613 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.32 I-.016 J1.217 P1  F30000
G1 X135.14 Y122.438 Z4.32
G1 Z3.92
G1 E.8 F1800
; LINE_WIDTH: 0.401722
G1 F1200
G1 X135.136 Y122.062 E.00691
G1 X136.856 Y122.062 E.03162
G1 X136.856 Y122.25 E.00346
G1 X136.856 Y122.438 E.00346
G1 X135.2 Y122.438 E.03044
G1 X134.715 Y122.844 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X134.713 Y121.629 I-9.146 J-.593 E.02521
G1 X134.76 Y121.662 E.00118
G1 X137.256 Y121.662 E.05178
G1 X137.256 Y122.25 E.0122
G1 X137.256 Y122.838 E.0122
G2 X134.775 Y122.843 I-.986 J123.834 E.05146
M204 S250
G1 X134.606 Y123.376 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X134.581 Y123.404 E.00073
; LINE_WIDTH: 0.390782
G1 X134.544 Y123.585 E.00329
; LINE_WIDTH: 0.385772
G3 X133.304 Y126.348 I-6.892 J-1.434 E.05373
; LINE_WIDTH: 0.386782
G3 X132.482 Y127.254 I-5.1 J-3.797 E.02163
; LINE_WIDTH: 0.385812
G1 X131.86 Y127.761 E.01412
; LINE_WIDTH: 0.423582
G1 X131.416 Y128.117 E.01107
; LINE_WIDTH: 0.460432
G1 X131.208 Y128.29 E.00575
; LINE_WIDTH: 0.497282
G1 X131 Y128.463 E.00624
; LINE_WIDTH: 0.534132
G1 X130.792 Y128.636 E.00673
; LINE_WIDTH: 0.534802
G3 X129.725 Y129.019 I-2.49 J-5.266 E.02824
; LINE_WIDTH: 0.529162
G1 X129.104 Y129.158 E.01566
; LINE_WIDTH: 0.529582
G1 X128.474 Y129.242 E.01567
; LINE_WIDTH: 0.533512
G1 X127.837 Y129.273 E.01582
; LINE_WIDTH: 0.537802
G3 X126.246 Y129.082 I.052 J-7.132 E.0402
; LINE_WIDTH: 0.536982
G1 X125.454 Y128.843 E.02067
G1 X124.967 Y128.643 E.01316
G1 X124.788 Y128.499 E.00575
; LINE_WIDTH: 0.505482
G1 X124.608 Y128.355 E.0054
; LINE_WIDTH: 0.474052
G1 X124.356 Y128.135 E.00733
; LINE_WIDTH: 0.432012
G1 X124.105 Y127.915 E.00664
; LINE_WIDTH: 0.389972
G1 X123.626 Y127.565 E.01056
; LINE_WIDTH: 0.390262
G3 X122.323 Y126.182 I4.881 J-5.908 E.03396
; LINE_WIDTH: 0.389942
G1 X122.03 Y125.734 E.00954
; LINE_WIDTH: 0.389362
G1 X121.74 Y125.194 E.01089
; LINE_WIDTH: 0.389932
G3 X121.313 Y124.053 I6.358 J-3.029 E.02172
; LINE_WIDTH: 0.408322
G1 X121.095 Y123.116 E.01799
; LINE_WIDTH: 0.411032
G1 X121.063 Y123.102 E.00065
; LINE_WIDTH: 0.413742
G1 X121.032 Y123.088 E.00065
; LINE_WIDTH: 0.416452
G1 X121.001 Y123.073 E.00066
; LINE_WIDTH: 0.419162
G1 X120.969 Y123.059 E.00066
; LINE_WIDTH: 0.419992
G1 X120.613 Y123.055 E.00687
G1 X120.115 Y123.055 E.00959
G1 X119.618 Y123.055 E.00959
G1 X119.12 Y123.055 E.00959
G1 X118.335 Y123.055 E.01513
G1 X118.335 Y121.445 E.03103
G1 X120.633 Y121.444 E.04429
G1 X120.694 Y121.443 E.00118
G1 X120.755 Y121.442 E.00118
G1 X120.816 Y121.441 E.00118
G1 X120.878 Y121.44 E.00118
G1 X120.939 Y121.439 E.00118
G1 X121 Y121.438 E.00118
G1 X121.067 Y121.375 E.00178
; LINE_WIDTH: 0.407572
G1 X121.135 Y121.301 E.00188
; LINE_WIDTH: 0.392952
G1 X121.169 Y121.115 E.00339
; LINE_WIDTH: 0.385782
G3 X122.772 Y117.754 I6.676 J1.122 E.0664
; LINE_WIDTH: 0.385102
G3 X123.728 Y116.86 I5.102 J4.495 E.02303
; LINE_WIDTH: 0.384542
G3 X127.803 Y115.459 I4.148 J5.437 E.07691
; LINE_WIDTH: 0.386062
G3 X129.109 Y115.563 I.214 J5.577 E.02313
; LINE_WIDTH: 0.384772
G1 X129.708 Y115.7 E.01078
; LINE_WIDTH: 0.389322
G3 X131.459 Y116.465 I-2.034 J7.043 E.03407
; LINE_WIDTH: 0.390762
G1 X132.126 Y116.937 E.01457
; LINE_WIDTH: 0.391922
G3 X133.004 Y117.779 I-4.31 J5.372 E.02182
; LINE_WIDTH: 0.391552
G1 X133.384 Y118.256 E.01091
; LINE_WIDTH: 0.389942
G1 X133.777 Y118.867 E.01293
; LINE_WIDTH: 0.386052
G3 X134.283 Y119.975 I-5.557 J3.21 E.02149
; LINE_WIDTH: 0.385522
G1 X134.463 Y120.556 E.0107
; LINE_WIDTH: 0.388682
G1 X134.582 Y121.095 E.0098
; LINE_WIDTH: 0.398922
G1 X134.64 Y121.147 E.00141
; LINE_WIDTH: 0.409172
G1 X134.698 Y121.198 E.00145
; LINE_WIDTH: 0.419422
G1 X134.756 Y121.25 E.00149
; LINE_WIDTH: 0.419992
G1 X135.224 Y121.252 E.00901
G1 X135.716 Y121.252 E.00948
G1 X136.207 Y121.252 E.00948
G1 X136.699 Y121.252 E.00948
G1 X137.665 Y121.252 E.01862
G1 X137.665 Y121.27 E.00033
G1 X137.665 Y121.41 E.0027
G1 X137.665 Y121.55 E.0027
G1 X137.665 Y121.69 E.0027
G1 X137.665 Y121.83 E.0027
G1 X137.665 Y121.97 E.0027
G1 X137.665 Y122.11 E.0027
G1 X137.665 Y122.25 E.0027
G1 X137.665 Y122.39 E.0027
G1 X137.665 Y122.53 E.0027
G1 X137.665 Y122.67 E.0027
G1 X137.665 Y122.81 E.0027
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
G1 X137.665 Y122.95 E.0027
G1 X137.665 Y123.09 E.0027
G1 X137.665 Y123.23 E.0027
G1 X137.665 Y123.247 E.00033
G1 X135.261 Y123.247 E.04634
G1 X135.174 Y123.248 E.00168
G1 X135.086 Y123.249 E.00168
G1 X134.999 Y123.25 E.00168
G1 X134.912 Y123.251 E.00168
G1 X134.825 Y123.252 E.00168
G1 X134.738 Y123.253 E.00168
G1 X134.71 Y123.253 E.00053
G1 X134.645 Y123.33 E.00194
; WIPE_START
G1 F1800
M204 S10000
G1 X134.581 Y123.404 E-.03714
G1 X134.544 Y123.585 E-.07002
G1 X134.398 Y124.178 E-.23215
G1 X134.199 Y124.755 E-.23205
G1 X133.996 Y125.208 E-.18865
; WIPE_END
G1 E-.04
G17
G3 Z4.32 I1.071 J-.577 P1  F30000
G1 X128.986 Y115.906 Z4.32
G1 Z3.92
G1 E.8 F1800
; LINE_WIDTH: 0.389452
G1 F1200
M204 S5000
G1 X129.017 Y115.91 E.00056
; LINE_WIDTH: 0.385492
G3 X130.131 Y116.216 I-1.114 J6.24 E.02035
; LINE_WIDTH: 0.385792
G3 X131.654 Y117.034 I-2.567 J6.6 E.03051
; LINE_WIDTH: 0.384512
G1 X132.107 Y117.393 E.01014
; LINE_WIDTH: 0.385102
G1 X132.585 Y117.855 E.01167
; LINE_WIDTH: 0.385812
G1 X133.024 Y118.377 E.01201
; LINE_WIDTH: 0.389952
G3 X134.086 Y120.542 I-5.277 J3.931 E.04317
; LINE_WIDTH: 0.389302
G1 X134.228 Y121.172 E.01149
; LINE_WIDTH: 0.419992
G3 X134.332 Y122.28 I-4.639 J.997 E.02148
G3 X134.198 Y123.487 I-4.77 J.078 E.02348
; LINE_WIDTH: 0.386262
G3 X133.035 Y126.108 I-6.557 J-1.341 E.05093
; LINE_WIDTH: 0.387682
G1 X132.675 Y126.549 E.01007
; LINE_WIDTH: 0.389382
G1 X132.323 Y126.909 E.00894
; LINE_WIDTH: 0.392902
G3 X131.436 Y127.615 I-5.275 J-5.717 E.02037
; LINE_WIDTH: 0.429512
G1 X131.193 Y127.778 E.00579
; LINE_WIDTH: 0.467832
G1 X130.949 Y127.941 E.00633
; LINE_WIDTH: 0.506152
G1 X130.706 Y128.104 E.00688
; LINE_WIDTH: 0.532412
G3 X129.619 Y128.526 I-2.365 J-4.48 E.02895
; LINE_WIDTH: 0.528682
G1 X129.049 Y128.657 E.01438
; LINE_WIDTH: 0.530282
G1 X128.47 Y128.737 E.01441
; LINE_WIDTH: 0.533492
G3 X127.302 Y128.739 I-.593 J-6.072 E.02904
; LINE_WIDTH: 0.530262
G3 X125.966 Y128.477 I.557 J-6.391 E.03366
; LINE_WIDTH: 0.531552
G1 X125.415 Y128.283 E.01445
G1 X125.155 Y128.149 E.00723
; LINE_WIDTH: 0.505937
G1 X124.895 Y128.015 E.00687
; LINE_WIDTH: 0.480322
G1 X124.652 Y127.852 E.00649
; LINE_WIDTH: 0.440162
G1 X124.41 Y127.69 E.00592
; LINE_WIDTH: 0.400002
G1 X123.94 Y127.351 E.01059
; LINE_WIDTH: 0.385922
G1 X123.499 Y126.977 E.01019
; LINE_WIDTH: 0.384282
G1 X123.093 Y126.566 E.01013
; LINE_WIDTH: 0.385022
G1 X122.725 Y126.12 E.01015
; LINE_WIDTH: 0.386042
G3 X122.117 Y125.139 I5.082 J-3.831 E.02037
; LINE_WIDTH: 0.385752
G1 X121.881 Y124.611 E.01018
; LINE_WIDTH: 0.386052
G1 X121.693 Y124.064 E.01018
; LINE_WIDTH: 0.386912
G1 X121.555 Y123.503 E.01021
; LINE_WIDTH: 0.408322
G1 X121.457 Y122.933 E.01082
; LINE_WIDTH: 0.419992
G3 X121.518 Y121.202 I5.909 J-.659 E.0335
; LINE_WIDTH: 0.386262
G3 X123.024 Y118.012 I6.34 J1.041 E.06299
; LINE_WIDTH: 0.385362
G3 X123.927 Y117.159 I4.87 J4.255 E.02187
; LINE_WIDTH: 0.384612
G3 X124.908 Y116.532 I5.637 J7.727 E.02045
; LINE_WIDTH: 0.384532
G3 X127.778 Y115.812 I3.005 J5.902 E.05236
; LINE_WIDTH: 0.389452
G3 X128.37 Y115.828 I.129 J6.258 E.01052
G1 X128.927 Y115.898 E.00998
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X129.017 Y115.91 E-.03467
G1 X129.581 Y116.037 E-.21973
G1 X130.131 Y116.216 E-.2198
G1 X130.663 Y116.442 E-.21954
G1 X130.817 Y116.524 E-.06626
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 46/145
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.32 I-.653 J-1.027 P1  F30000
G1 X121.03 Y122.753 Z4.32
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X120.974 Y122.739 E.00119
G1 X118.744 Y122.739 E.04625
G1 X118.744 Y121.76 E.02031
G3 X121.019 Y121.763 I.894 J182.882 E.04718
G1 X121.029 Y122.693 E.01928
G1 X120.519 Y122.25 F30000
; LINE_WIDTH: 0.580632
G1 F1200
G1 X119.234 Y122.25 E.03487
; WIPE_START
G1 F3600
G1 X120.519 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.44 I-.019 J1.217 P1  F30000
G1 X135.177 Y122.478 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.481632
G1 F1200
G1 X135.174 Y122.022 E.01016
G1 X136.816 Y122.022 E.03658
G1 X136.816 Y122.25 E.00508
G1 X136.816 Y122.478 E.00508
G1 X135.237 Y122.478 E.03518
G1 X134.71 Y122.919 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X134.704 Y121.559 I-9.533 J-.64 E.02823
G1 X134.745 Y121.582 E.00097
G1 X137.256 Y121.582 E.05207
G1 X137.256 Y122.25 E.01386
G1 X137.256 Y122.918 E.01386
G1 X134.77 Y122.919 E.05156
M204 S250
G1 X134.674 Y123.39 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.407822
G1 F1200
M204 S5000
G1 X134.568 Y123.483 E.00264
; LINE_WIDTH: 0.389712
G1 X134.546 Y123.586 E.00187
; LINE_WIDTH: 0.386372
G1 X134.398 Y124.178 E.01076
; LINE_WIDTH: 0.385762
G3 X133.649 Y125.844 I-7.255 J-2.26 E.03224
; LINE_WIDTH: 0.386642
G1 X133.305 Y126.35 E.01079
; LINE_WIDTH: 0.386822
G3 X132.486 Y127.251 I-5.255 J-3.951 E.02153
; LINE_WIDTH: 0.385922
G1 X132.02 Y127.644 E.01074
; LINE_WIDTH: 0.400002
G1 X131.566 Y127.984 E.01037
; LINE_WIDTH: 0.435862
G1 X131.304 Y128.199 E.0068
; LINE_WIDTH: 0.471722
G1 X131.042 Y128.415 E.00739
; LINE_WIDTH: 0.473672
G1 X130.476 Y128.678 E.01367
; LINE_WIDTH: 0.474492
G1 X129.876 Y128.889 E.01396
; LINE_WIDTH: 0.476672
G1 X129.08 Y129.078 E.01803
; LINE_WIDTH: 0.476952
G3 X127.772 Y129.183 I-1.198 J-6.71 E.02899
; LINE_WIDTH: 0.477362
G3 X125.764 Y128.855 I.281 J-8.024 E.04505
; LINE_WIDTH: 0.475922
G3 X124.602 Y128.351 I1.702 J-5.513 E.02792
; LINE_WIDTH: 0.473122
G1 X124.354 Y128.133 E.00723
; LINE_WIDTH: 0.431897
G1 X124.105 Y127.915 E.00657
; LINE_WIDTH: 0.390672
G1 X123.537 Y127.488 E.01267
; LINE_WIDTH: 0.387662
G3 X122.186 Y125.979 I4.613 J-5.491 E.03597
; LINE_WIDTH: 0.385772
G3 X121.613 Y124.908 I5.705 J-3.739 E.0214
; LINE_WIDTH: 0.392912
G3 X121.263 Y123.855 I6.354 J-2.698 E.01995
; LINE_WIDTH: 0.391282
G1 X121.153 Y123.309 E.00995
; LINE_WIDTH: 0.414762
G1 X121.077 Y123.181 E.00284
; LINE_WIDTH: 0.416732
G1 X121.038 Y123.169 E.00078
; LINE_WIDTH: 0.418712
G1 X120.999 Y123.156 E.00078
; LINE_WIDTH: 0.419992
G2 X120.803 Y123.148 I-.111 J.31 E.00384
G1 X120.322 Y123.148 E.00927
G1 X119.841 Y123.148 E.00927
G1 X119.36 Y123.148 E.00927
G1 X118.335 Y123.148 E.01976
G1 X118.335 Y121.351 E.03465
G1 X120.459 Y121.351 E.04094
G1 X120.612 Y121.351 E.00296
G1 X120.766 Y121.351 E.00296
G1 X120.919 Y121.351 E.00296
G2 X121.017 Y121.316 I.027 J-.077 E.00216
; LINE_WIDTH: 0.413052
G1 X121.083 Y121.261 E.00163
; LINE_WIDTH: 0.402232
G1 X121.149 Y121.207 E.00158
; LINE_WIDTH: 0.391412
G1 X121.166 Y121.113 E.0017
; LINE_WIDTH: 0.386882
G1 X121.297 Y120.517 E.01077
; LINE_WIDTH: 0.385782
G3 X122.322 Y118.321 I6.588 J1.737 E.0429
; LINE_WIDTH: 0.392912
G3 X123.034 Y117.469 I5.627 J3.98 E.01996
; LINE_WIDTH: 0.390852
G3 X126.768 Y115.536 I4.907 J4.908 E.07626
; LINE_WIDTH: 0.394742
G1 X127.375 Y115.467 E.01101
G1 X128.397 Y115.467 E.01845
; LINE_WIDTH: 0.392002
G1 X128.998 Y115.539 E.01082
; LINE_WIDTH: 0.391272
G1 X129.595 Y115.666 E.01091
; LINE_WIDTH: 0.389252
G1 X130.084 Y115.821 E.00913
; LINE_WIDTH: 0.384532
G3 X131.719 Y116.644 I-2.382 J6.768 E.03219
; LINE_WIDTH: 0.385112
G1 X132.217 Y117.015 E.01089
G1 X132.799 Y117.559 E.014
; LINE_WIDTH: 0.391232
G3 X133.501 Y118.423 I-4.522 J4.394 E.01993
; LINE_WIDTH: 0.392062
G3 X134.125 Y119.562 I-5.677 J3.847 E.02329
; LINE_WIDTH: 0.391692
G1 X134.316 Y120.058 E.00951
; LINE_WIDTH: 0.391462
G1 X134.459 Y120.551 E.00918
; LINE_WIDTH: 0.392792
G1 X134.575 Y121.044 E.00909
; LINE_WIDTH: 0.409352
G1 X134.679 Y121.122 E.00244
; LINE_WIDTH: 0.419992
G1 X134.745 Y121.173 E.00161
G1 X134.915 Y121.173 E.00327
G1 X135.388 Y121.173 E.00912
G1 X135.861 Y121.173 E.00912
G1 X136.335 Y121.173 E.00912
G1 X137.665 Y121.172 E.02564
G1 X137.665 Y121.332 E.00308
G1 X137.665 Y121.516 E.00354
G1 X137.665 Y121.699 E.00354
G1 X137.665 Y121.883 E.00354
G1 X137.665 Y122.066 E.00354
G1 X137.665 Y122.25 E.00354
G1 X137.665 Y122.433 E.00354
G1 X137.665 Y122.617 E.00354
G1 X137.665 Y122.8 E.00354
G1 X137.665 Y122.984 E.00354
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
G1 X137.665 Y123.167 E.00354
G1 X137.665 Y123.327 E.00308
G1 X135.475 Y123.327 E.04221
G1 X135.256 Y123.327 E.00423
G1 X135.036 Y123.327 E.00423
G1 X134.817 Y123.327 E.00423
G2 X134.714 Y123.343 I-.036 J.113 E.00209
; WIPE_START
G1 F2250
M204 S10000
G1 X134.568 Y123.483 E-.07696
G1 X134.546 Y123.586 E-.03998
G1 X134.398 Y124.178 E-.23186
G1 X134.199 Y124.755 E-.23208
G1 X134.006 Y125.185 E-.17912
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.44 I1.068 J-.583 P1  F30000
G1 X128.944 Y115.905 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.385802
G1 F1200
M204 S5000
G1 X129.393 Y115.988 E.00804
G3 X129.949 Y116.152 I-1.455 J5.976 E.01021
; LINE_WIDTH: 0.384532
G3 X131.497 Y116.923 I-2.362 J6.676 E.03041
; LINE_WIDTH: 0.385722
G1 X131.961 Y117.268 E.01017
; LINE_WIDTH: 0.390992
G1 X132.415 Y117.685 E.01101
; LINE_WIDTH: 0.391232
G3 X133.197 Y118.625 I-4.578 J4.604 E.02188
; LINE_WIDTH: 0.392062
G3 X133.786 Y119.701 I-5.533 J3.728 E.02202
; LINE_WIDTH: 0.391692
G1 X134.107 Y120.62 E.0174
; LINE_WIDTH: 0.392792
G1 X134.225 Y121.151 E.00977
; LINE_WIDTH: 0.419992
M73 P57 R9
G3 X134.211 Y123.415 I-5.389 J1.097 E.04396
; LINE_WIDTH: 0.389712
G1 X134.083 Y123.968 E.0101
; LINE_WIDTH: 0.389372
G3 X133.04 Y126.102 I-6.305 J-1.76 E.04247
; LINE_WIDTH: 0.387662
G1 X132.673 Y126.55 E.01023
; LINE_WIDTH: 0.389382
G3 X131.886 Y127.29 I-5.006 J-4.538 E.01923
; LINE_WIDTH: 0.389952
G1 X131.433 Y127.619 E.00998
; LINE_WIDTH: 0.431402
G1 X131.156 Y127.808 E.00665
; LINE_WIDTH: 0.472852
G1 X130.879 Y127.998 E.00733
; LINE_WIDTH: 0.473712
G3 X129.796 Y128.445 I-2.956 J-5.625 E.0257
; LINE_WIDTH: 0.473122
G1 X129.145 Y128.609 E.01469
; LINE_WIDTH: 0.471002
G1 X128.468 Y128.707 E.01489
; LINE_WIDTH: 0.472562
G3 X127.304 Y128.709 I-.596 J-6.135 E.02548
; LINE_WIDTH: 0.470592
G1 X126.639 Y128.615 E.0146
; LINE_WIDTH: 0.472532
G3 X125.425 Y128.255 I1.174 J-6.177 E.02771
; LINE_WIDTH: 0.472272
G1 X124.897 Y128.011 E.0127
G1 X124.653 Y127.85 E.00637
; LINE_WIDTH: 0.436137
G1 X124.41 Y127.69 E.00585
; LINE_WIDTH: 0.400002
G1 X123.855 Y127.282 E.0126
; LINE_WIDTH: 0.389982
G1 X123.36 Y126.846 E.01176
; LINE_WIDTH: 0.386652
G1 X122.965 Y126.422 E.01021
; LINE_WIDTH: 0.389892
G3 X122.246 Y125.382 I5.195 J-4.359 E.02255
; LINE_WIDTH: 0.389372
G1 X121.988 Y124.865 E.01027
; LINE_WIDTH: 0.392912
G3 X121.619 Y123.776 I7.099 J-3.012 E.02066
; LINE_WIDTH: 0.391282
G1 X121.513 Y123.246 E.00965
; LINE_WIDTH: 0.419992
G1 X121.434 Y122.66 E.0114
G1 X121.431 Y121.822 E.01615
G1 X121.506 Y121.281 E.01052
; LINE_WIDTH: 0.391412
G1 X121.618 Y120.718 E.01028
; LINE_WIDTH: 0.389382
G3 X122.298 Y119.023 I6.94 J1.801 E.03255
; LINE_WIDTH: 0.386262
G3 X123.08 Y117.947 I5.503 J3.178 E.02349
; LINE_WIDTH: 0.384672
G1 X123.488 Y117.533 E.0102
; LINE_WIDTH: 0.384532
G3 X127.098 Y115.855 I4.445 J4.84 E.07095
G1 X128.054 Y115.813 E.01679
; LINE_WIDTH: 0.385222
G1 X128.736 Y115.866 E.01202
; LINE_WIDTH: 0.385802
G1 X128.885 Y115.894 E.00266
; CHANGE_LAYER
; Z_HEIGHT: 4.05474
; LAYER_HEIGHT: 0.0147367
; WIPE_START
G1 F1800
M204 S10000
G1 X129.393 Y115.988 E-.19629
G1 X129.949 Y116.152 E-.22021
G1 X130.488 Y116.361 E-.21982
G1 X130.779 Y116.507 E-.12367
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 47/145
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.44 I-.129 J-1.21 P1  F30000
G1 X125.485 Y117.072 Z4.44
G1 Z4.055
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1438
G2 X125.014 Y117.317 I3.576 J7.461 E.02126
G1 X130.736 Y117.317 E.22903
G3 X133.2 Y120.212 I-2.873 J4.942 E.15508
G1 X122.549 Y120.212 E.42628
G1 X122.524 Y120.278 E.00285
G2 X122.238 Y123.106 I5.4 J1.974 E.11494
G1 X133.512 Y123.106 E.45121
G1 X133.5 Y123.176 E.00286
G3 X132.17 Y126 I-5.604 J-.915 E.12655
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
G1 X123.581 Y126 E.34379
G2 X125.597 Y127.477 I4.319 J-3.78 E.10086
G2 X132.037 Y126.145 I2.276 J-5.231 E.28053
; CHANGE_LAYER
; Z_HEIGHT: 4.16
; LAYER_HEIGHT: 0.105263
; WIPE_START
G1 F7329.351
G1 X131.362 Y126.763 E-.34778
G1 X130.652 Y127.231 E-.32303
G1 X130.438 Y127.328 E-.08919
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/145
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.455 I.865 J.856 P1  F30000
G1 X135.208 Y122.51 Z4.455
G1 Z4.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.546192
; LAYER_HEIGHT: 0.12
G1 F1438
G1 X135.206 Y121.99 E.01324
G1 X136.783 Y121.989 E.04014
G1 X136.783 Y122.25 E.00662
G1 X136.783 Y122.51 E.00662
G1 X135.268 Y122.51 E.03857
G1 X134.733 Y122.982 F30000
; LINE_WIDTH: 0.449992
G1 F1438
G1 X134.709 Y122.941 E.001
G2 X134.697 Y121.502 I-6.743 J-.666 E.0299
G1 X134.733 Y121.517 E.0008
G1 X137.256 Y121.517 E.05233
G1 X137.256 Y122.25 E.0152
G1 X137.256 Y122.982 E.0152
G1 X134.793 Y122.982 E.05108
; WIPE_START
G1 F3600
G1 X134.709 Y122.941 E-.0357
G1 X134.742 Y122.272 E-.25448
G1 X134.697 Y121.502 E-.29309
G1 X134.733 Y121.517 E-.01475
G1 X135.159 Y121.517 E-.16198
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.56 I-.047 J-1.216 P1  F30000
G1 X120.622 Y122.074 Z4.56
G1 Z4.16
G1 E.8 F1800
; LINE_WIDTH: 0.377522
G1 F1438
G1 X120.626 Y122.426 E.00605
G1 X119.132 Y122.426 E.02569
G1 X119.132 Y122.074 E.00605
G1 X120.562 Y122.074 E.02458
G1 X121.034 Y121.678 F30000
; LINE_WIDTH: 0.449992
G1 F1438
G2 X121.033 Y122.835 I9.178 J.586 E.024
G1 X120.987 Y122.814 E.00105
G1 X118.744 Y122.814 E.04652
G1 X118.744 Y121.686 E.02339
G2 X120.974 Y121.679 I.877 J-83.055 E.04625
; WIPE_START
G1 F3600
G1 X121.008 Y122.233 E-.21068
G1 X121.033 Y122.835 E-.22895
G1 X120.987 Y122.814 E-.01925
G1 X120.195 Y122.814 E-.30112
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.56 I.755 J.954 P1  F30000
G1 X128.935 Y115.896 Z4.56
G1 Z4.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389352
G1 F1438
M204 S5000
G3 X130.131 Y116.216 I-1.083 J6.454 E.02204
; LINE_WIDTH: 0.385782
G3 X131.654 Y117.034 I-2.566 J6.6 E.03051
; LINE_WIDTH: 0.382272
G1 X132.107 Y117.394 E.01008
; LINE_WIDTH: 0.384002
G1 X132.588 Y117.859 E.01173
; LINE_WIDTH: 0.387492
G1 X132.965 Y118.299 E.01024
; LINE_WIDTH: 0.389712
G1 X133.307 Y118.788 E.01061
; LINE_WIDTH: 0.392942
G1 X133.589 Y119.289 E.01032
G1 X133.938 Y120.069 E.01534
; LINE_WIDTH: 0.386062
G1 X134.108 Y120.621 E.01018
; LINE_WIDTH: 0.400242
G1 X134.236 Y121.185 E.01059
; LINE_WIDTH: 0.419992
G3 X134.201 Y123.478 I-5.529 J1.06 E.04452
; LINE_WIDTH: 0.389412
G3 X132.722 Y126.492 I-6.428 J-1.284 E.06036
; LINE_WIDTH: 0.392902
G3 X131.889 Y127.284 I-5.718 J-5.176 E.02065
; LINE_WIDTH: 0.391182
G1 X131.436 Y127.615 E.01002
; LINE_WIDTH: 0.412822
G1 X130.684 Y128.063 E.01656
; LINE_WIDTH: 0.415562
G1 X130.1 Y128.309 E.01209
; LINE_WIDTH: 0.416632
G1 X129.526 Y128.488 E.01147
; LINE_WIDTH: 0.419752
G3 X128.48 Y128.674 I-1.937 J-7.84 E.02049
; LINE_WIDTH: 0.416912
G3 X126.745 Y128.603 I-.566 J-7.363 E.03329
; LINE_WIDTH: 0.416782
G1 X126.222 Y128.488 E.01024
; LINE_WIDTH: 0.416592
G3 X125.132 Y128.091 I1.684 J-6.322 E.0222
; LINE_WIDTH: 0.416342
G1 X124.637 Y127.832 E.01066
; LINE_WIDTH: 0.416182
G1 X124.176 Y127.527 E.01056
; LINE_WIDTH: 0.390872
G1 X123.644 Y127.107 E.0121
; LINE_WIDTH: 0.384602
G1 X123.636 Y127.101 E.00017
; LINE_WIDTH: 0.384342
G1 X123.158 Y126.634 E.01172
; LINE_WIDTH: 0.384612
G3 X122.117 Y125.139 I5.22 J-4.743 E.03206
; LINE_WIDTH: 0.385152
G1 X121.849 Y124.525 E.01178
; LINE_WIDTH: 0.385802
G1 X121.642 Y123.88 E.01192
; LINE_WIDTH: 0.387882
G1 X121.52 Y123.313 E.01026
; LINE_WIDTH: 0.419992
G3 X121.418 Y122.221 I4.587 J-.98 E.0212
G3 X121.553 Y121.013 I4.754 J-.08 E.02349
; LINE_WIDTH: 0.386252
G3 X122.775 Y118.314 I6.518 J1.327 E.05266
; LINE_WIDTH: 0.385432
G1 X123.212 Y117.805 E.01179
; LINE_WIDTH: 0.384602
G1 X123.631 Y117.403 E.01017
; LINE_WIDTH: 0.385192
G1 X124.162 Y116.986 E.01189
; LINE_WIDTH: 0.385792
G3 X125.247 Y116.367 I3.674 J5.185 E.02201
; LINE_WIDTH: 0.387792
G1 X125.872 Y116.126 E.01187
; LINE_WIDTH: 0.389702
G3 X127.016 Y115.866 I2.064 J6.43 E.02089
; LINE_WIDTH: 0.391422
G3 X128.366 Y115.827 I.876 J7.014 E.0242
; LINE_WIDTH: 0.389562
G1 X128.876 Y115.889 E.00913
; WIPE_START
G1 F1800
M204 S10000
G1 X129.498 Y116.016 E-.24132
G1 X130.131 Y116.216 E-.2523
G1 X130.663 Y116.442 E-.21958
G1 X130.772 Y116.5 E-.0468
; WIPE_END
G1 E-.04
G17
G3 Z4.56 I-1.056 J.605 P1  F30000
G1 X134.72 Y123.392 Z4.56
G1 Z4.16
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1438
M204 S5000
G1 X134.547 Y123.587 E.00503
; LINE_WIDTH: 0.387592
G1 X134.398 Y124.178 E.01078
; LINE_WIDTH: 0.385762
G3 X132.338 Y127.381 I-6.511 J-1.924 E.06796
; LINE_WIDTH: 0.384922
G1 X131.86 Y127.761 E.01071
; LINE_WIDTH: 0.415112
G1 X131.303 Y128.173 E.01319
; LINE_WIDTH: 0.415342
G3 X130.161 Y128.699 I-3.293 J-5.647 E.02399
; LINE_WIDTH: 0.416632
G1 X129.625 Y128.866 E.01072
; LINE_WIDTH: 0.419752
G3 X128.504 Y129.064 I-1.812 J-6.962 E.02197
; LINE_WIDTH: 0.416912
G3 X126.664 Y128.986 I-.589 J-7.764 E.03529
; LINE_WIDTH: 0.416782
G1 X126.108 Y128.862 E.0109
; LINE_WIDTH: 0.416592
G3 X124.953 Y128.439 I1.762 J-6.603 E.02353
; LINE_WIDTH: 0.416342
G1 X124.414 Y128.152 E.01166
; LINE_WIDTH: 0.416182
G1 X123.631 Y127.567 E.01868
; LINE_WIDTH: 0.392202
G1 X123.168 Y127.161 E.01103
; LINE_WIDTH: 0.391992
G1 X122.613 Y126.562 E.01462
G1 X122.249 Y126.076 E.01088
; LINE_WIDTH: 0.390832
G1 X121.928 Y125.556 E.0109
; LINE_WIDTH: 0.392002
G3 X121.434 Y124.441 I6.044 J-3.347 E.02187
; LINE_WIDTH: 0.391462
G1 X121.288 Y123.951 E.00914
; LINE_WIDTH: 0.387882
G1 X121.165 Y123.387 E.01021
; LINE_WIDTH: 0.419992
G1 X120.993 Y123.223 E.00459
G1 X120.911 Y123.223 E.00159
G1 X120.484 Y123.223 E.00823
G1 X120.057 Y123.223 E.00823
G1 X119.63 Y123.223 E.00823
G1 X119.204 Y123.223 E.00823
G1 X118.335 Y123.223 E.01674
G1 X118.335 Y121.277 E.03751
G1 X120.335 Y121.277 E.03855
G2 X120.552 Y121.276 I.084 J-6.532 E.00418
G1 X120.651 Y121.274 E.0019
G1 X120.749 Y121.272 E.0019
G1 X120.848 Y121.271 E.0019
G1 X120.947 Y121.269 E.0019
G1 X121.045 Y121.267 E.0019
G1 X121.161 Y121.138 E.00334
; LINE_WIDTH: 0.393332
G1 X121.207 Y120.915 E.00408
; LINE_WIDTH: 0.385782
G3 X122.096 Y118.66 I6.645 J1.319 E.04291
; LINE_WIDTH: 0.391462
G1 X122.376 Y118.243 E.00897
; LINE_WIDTH: 0.391992
G3 X124.134 Y116.567 I5.52 J4.028 E.04373
; LINE_WIDTH: 0.391332
G1 X124.658 Y116.254 E.01091
; LINE_WIDTH: 0.389702
G3 X125.795 Y115.771 I3.237 J6.041 E.02201
; LINE_WIDTH: 0.387922
G1 X126.481 Y115.591 E.01257
; LINE_WIDTH: 0.385802
G3 X129.708 Y115.7 I1.377 J7.048 E.05732
; LINE_WIDTH: 0.389332
G3 X131.881 Y116.758 I-1.689 J6.232 E.04323
; LINE_WIDTH: 0.382292
G1 X132.363 Y117.145 E.01078
; LINE_WIDTH: 0.383432
G1 X132.871 Y117.639 E.01238
; LINE_WIDTH: 0.387952
G3 X133.655 Y118.662 I-4.325 J4.129 E.02287
; LINE_WIDTH: 0.392942
G3 X134.125 Y119.561 I-5.953 J3.683 E.01824
; LINE_WIDTH: 0.389982
G1 X134.312 Y120.043 E.0092
; LINE_WIDTH: 0.389342
G1 X134.455 Y120.523 E.0089
; LINE_WIDTH: 0.400242
G1 X134.584 Y121.025 E.0095
; LINE_WIDTH: 0.419992
G1 X134.733 Y121.108 E.00328
G1 X134.965 Y121.108 E.00447
G1 X135.426 Y121.108 E.0089
G1 X135.888 Y121.108 E.0089
G1 X136.35 Y121.108 E.0089
G1 X137.665 Y121.108 E.02535
G1 X137.665 Y121.304 E.00378
G1 X137.665 Y121.54 E.00456
G1 X137.665 Y121.777 E.00456
G1 X137.665 Y122.013 E.00456
G1 X137.665 Y122.25 E.00456
G1 X137.665 Y122.486 E.00456
G1 X137.665 Y122.723 E.00456
G1 X137.665 Y122.959 E.00456
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
G1 X137.665 Y123.195 E.00456
G1 X137.665 Y123.392 E.00378
G1 X135.209 Y123.392 E.04735
G1 X135.087 Y123.392 E.00236
G1 X134.964 Y123.392 E.00236
G1 X134.842 Y123.392 E.00236
G1 X134.78 Y123.392 E.0012
; CHANGE_LAYER
; Z_HEIGHT: 4.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X134.547 Y123.587 E-.11547
G1 X134.398 Y124.178 E-.23146
G1 X134.199 Y124.755 E-.23197
G1 X134.004 Y125.19 E-.1811
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 49/145
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.56 I1.105 J.511 P1  F30000
G1 X135.231 Y122.536 Z4.56
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.597582
G1 F1200
G1 X135.232 Y121.964 E.01599
G1 X136.758 Y121.964 E.04266
G1 X136.758 Y122.25 E.00799
G1 X136.758 Y122.536 E.00799
G1 X135.291 Y122.536 E.04102
G1 X134.689 Y123.051 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X134.694 Y121.446 I-7.007 J-.827 E.03336
G1 X134.723 Y121.466 E.00072
G1 X137.256 Y121.466 E.05254
G1 X137.256 Y122.25 E.01626
G1 X137.256 Y123.034 E.01626
G2 X134.749 Y123.049 I-.865 J62.138 E.05201
; WIPE_START
G1 F3600
G1 X134.726 Y122.736 E-.11936
G1 X134.742 Y122.12 E-.23423
G1 X134.694 Y121.446 E-.25672
G1 X134.723 Y121.466 E-.01318
G1 X135.082 Y121.466 E-.13651
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.68 I-.049 J-1.216 P1  F30000
G1 X120.598 Y122.045 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.435922
G1 F1200
G1 X120.594 Y122.455 E.00823
G1 X119.161 Y122.455 E.02873
G1 X119.161 Y122.045 E.00822
G1 X120.538 Y122.045 E.0276
G1 X121.041 Y121.599 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X121.037 Y122.876 I7.558 J.659 E.0265
G1 X118.744 Y122.872 E.04756
G1 X118.744 Y121.627 E.02581
G1 X120.744 Y121.627 E.04148
G2 X120.983 Y121.614 I.074 J-.806 E.00497
; WIPE_START
G1 F3600
G1 X121.007 Y122.325 E-.27045
G1 X121.037 Y122.876 E-.20956
G1 X120.3 Y122.875 E-.27999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.68 I.764 J.948 P1  F30000
G1 X128.937 Y115.916 Z4.68
G1 Z4.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392032
G1 F1200
M204 S5000
G1 X129.313 Y115.971 E.0068
; LINE_WIDTH: 0.389742
G1 X129.949 Y116.149 E.01175
; LINE_WIDTH: 0.387512
G3 X131.497 Y116.921 I-2.44 J6.831 E.03068
; LINE_WIDTH: 0.386252
G1 X131.961 Y117.268 E.0102
; LINE_WIDTH: 0.386472
G3 X132.784 Y118.078 I-4.046 J4.939 E.02039
; LINE_WIDTH: 0.385722
G3 X133.544 Y119.188 I-5.069 J4.281 E.02372
; LINE_WIDTH: 0.387622
G3 X134.056 Y120.433 I-5.485 J2.983 E.02385
; LINE_WIDTH: 0.388532
G1 X134.193 Y120.982 E.01004
; LINE_WIDTH: 0.419992
G3 X134.223 Y123.391 I-5.571 J1.275 E.04679
; LINE_WIDTH: 0.401052
G1 X134.062 Y124.047 E.01239
; LINE_WIDTH: 0.385772
G3 X131.823 Y127.341 I-6.297 J-1.872 E.07123
; LINE_WIDTH: 0.386432
G3 X130.85 Y127.965 I-3.93 J-5.06 E.0204
; LINE_WIDTH: 0.386692
G1 X130.326 Y128.209 E.0102
; LINE_WIDTH: 0.386872
G1 X129.782 Y128.404 E.0102
; LINE_WIDTH: 0.389492
G1 X129.184 Y128.557 E.01097
; LINE_WIDTH: 0.391072
G3 X128.06 Y128.687 I-1.354 J-6.771 E.02024
; LINE_WIDTH: 0.390502
G1 X127.493 Y128.678 E.01012
; LINE_WIDTH: 0.392112
G3 X126.374 Y128.51 I.448 J-6.779 E.02029
; LINE_WIDTH: 0.391982
G1 X125.831 Y128.357 E.01011
; LINE_WIDTH: 0.390142
G1 X125.3 Y128.153 E.01012
; LINE_WIDTH: 0.390862
G3 X124.294 Y127.604 I2.802 J-6.337 E.02049
; LINE_WIDTH: 0.389192
G1 X123.79 Y127.231 E.01115
; LINE_WIDTH: 0.385752
G3 X122.611 Y125.965 I4.655 J-5.513 E.03051
; LINE_WIDTH: 0.387872
G1 X122.252 Y125.395 E.01193
; LINE_WIDTH: 0.389712
G1 X121.988 Y124.863 E.01056
; LINE_WIDTH: 0.392912
G3 X121.619 Y123.774 I7.025 J-2.989 E.02067
; LINE_WIDTH: 0.419992
G1 X121.451 Y122.934 E.01651
G3 X121.514 Y121.202 I6.41 J-.635 E.03351
; LINE_WIDTH: 0.393552
G1 X121.638 Y120.637 E.0104
; LINE_WIDTH: 0.385762
G3 X122.955 Y118.09 I6.477 J1.737 E.05086
; LINE_WIDTH: 0.387882
G3 X123.864 Y117.208 I6.684 J5.974 E.02244
; LINE_WIDTH: 0.389722
G3 X124.827 Y116.575 I4.192 J5.333 E.02055
; LINE_WIDTH: 0.389352
G3 X127.016 Y115.866 I3.048 J5.675 E.04111
; LINE_WIDTH: 0.396372
G3 X128.358 Y115.831 I.899 J8.665 E.02436
; LINE_WIDTH: 0.392032
G1 X128.878 Y115.907 E.0094
; WIPE_START
G1 F1800
M204 S10000
G1 X129.313 Y115.971 E-.16709
G1 X129.949 Y116.149 E-.25098
G1 X130.488 Y116.361 E-.22012
G1 X130.775 Y116.503 E-.12181
; WIPE_END
G1 E-.04
G17
G3 Z4.68 I-1.058 J.602 P1  F30000
G1 X134.723 Y123.443 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
M73 P58 R9
G1 X134.571 Y123.53 E.00337
; LINE_WIDTH: 0.401052
G1 X134.546 Y123.595 E.00128
; LINE_WIDTH: 0.390942
G1 X134.375 Y124.264 E.01233
; LINE_WIDTH: 0.389352
G3 X131.478 Y128.023 I-6.507 J-2.019 E.08618
; LINE_WIDTH: 0.388772
G1 X130.954 Y128.319 E.01068
; LINE_WIDTH: 0.388572
G1 X130.407 Y128.567 E.01066
; LINE_WIDTH: 0.388422
G1 X129.841 Y128.765 E.01063
; LINE_WIDTH: 0.388262
G1 X129.166 Y128.929 E.01231
; LINE_WIDTH: 0.391072
G3 X128.066 Y129.051 I-1.285 J-6.546 E.0198
; LINE_WIDTH: 0.390502
G1 X127.466 Y129.042 E.0107
; LINE_WIDTH: 0.392112
G3 X126.279 Y128.863 I.43 J-6.904 E.02153
; LINE_WIDTH: 0.391982
G1 X125.704 Y128.698 E.01072
; LINE_WIDTH: 0.390142
G1 X125.144 Y128.482 E.0107
; LINE_WIDTH: 0.390862
G3 X124.023 Y127.856 I2.673 J-6.103 E.02295
; LINE_WIDTH: 0.389342
G3 X122.614 Y126.565 I4.266 J-6.072 E.03407
; LINE_WIDTH: 0.389722
G3 X121.918 Y125.54 I5.294 J-4.338 E.02208
; LINE_WIDTH: 0.387862
G1 X121.61 Y124.898 E.0126
; LINE_WIDTH: 0.385832
G1 X121.343 Y124.141 E.01413
; LINE_WIDTH: 0.390302
G1 X121.175 Y123.441 E.01285
; LINE_WIDTH: 0.419992
G1 X121.05 Y123.289 E.00379
G1 X120.543 Y123.281 E.00977
G1 X120.09 Y123.281 E.00874
G1 X119.636 Y123.281 E.00874
G1 X119.183 Y123.281 E.00874
G1 X118.335 Y123.281 E.01634
G1 X118.335 Y123.095 E.00358
G1 X118.335 Y122.642 E.00874
G1 X118.335 Y122.188 E.00874
G1 X118.335 Y121.735 E.00874
G1 X118.335 Y121.267 E.00902
G1 X118.335 Y121.253 E.00028
G1 X118.335 Y121.238 E.00028
G1 X118.335 Y121.224 E.00028
G1 X120.396 Y121.218 E.03973
G1 X120.546 Y121.218 E.00289
G1 X120.696 Y121.218 E.00289
G1 X120.847 Y121.218 E.00289
G1 X120.997 Y121.218 E.00289
G1 X121.174 Y121.061 E.00456
; LINE_WIDTH: 0.389352
G3 X122.375 Y118.243 I6.974 J1.307 E.0549
; LINE_WIDTH: 0.389712
G3 X123.191 Y117.314 I5.536 J4.038 E.02203
; LINE_WIDTH: 0.387872
G3 X124.231 Y116.505 I4.545 J4.776 E.02337
; LINE_WIDTH: 0.385772
G3 X127.079 Y115.494 I3.741 J6.017 E.05361
; LINE_WIDTH: 0.396372
G3 X128.395 Y115.466 I.81 J7.23 E.02388
; LINE_WIDTH: 0.392032
G1 X128.915 Y115.526 E.00938
; LINE_WIDTH: 0.389982
G1 X129.51 Y115.647 E.0108
; LINE_WIDTH: 0.386912
G3 X131.724 Y116.641 I-1.571 J6.465 E.04311
; LINE_WIDTH: 0.385772
G1 X132.208 Y117.006 E.01066
; LINE_WIDTH: 0.389352
G1 X132.583 Y117.337 E.0089
; LINE_WIDTH: 0.389982
G1 X132.94 Y117.707 E.00916
; LINE_WIDTH: 0.392032
G3 X133.613 Y118.594 I-5.148 J4.604 E.01996
; LINE_WIDTH: 0.391402
G1 X133.919 Y119.123 E.01092
; LINE_WIDTH: 0.389402
G1 X134.142 Y119.601 E.00939
; LINE_WIDTH: 0.386972
G1 X134.407 Y120.358 E.01416
; LINE_WIDTH: 0.388532
G1 X134.546 Y120.899 E.00991
; LINE_WIDTH: 0.419992
G1 X134.723 Y121.057 E.00456
G1 X135.235 Y121.057 E.00987
G1 X135.747 Y121.057 E.00987
G1 X136.259 Y121.057 E.00987
G1 X137.665 Y121.056 E.02711
G1 X137.665 Y121.333 E.00534
G1 X137.665 Y121.639 E.00589
G1 X137.665 Y121.944 E.00589
G1 X137.665 Y122.25 E.00589
G1 X137.665 Y122.555 E.00589
G1 X137.665 Y122.861 E.00589
G1 X137.665 Y123.166 E.00589
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
G1 X137.665 Y123.443 E.00533
G1 X135.446 Y123.443 E.04277
G1 X135.205 Y123.443 E.00465
G1 X134.964 Y123.443 E.00465
G1 X134.783 Y123.443 E.00349
; CHANGE_LAYER
; Z_HEIGHT: 4.32632
; LAYER_HEIGHT: 0.0463157
; WIPE_START
G1 F1800
M204 S10000
G1 X134.571 Y123.53 E-.08697
G1 X134.546 Y123.595 E-.02653
G1 X134.375 Y124.264 E-.2624
G1 X134.168 Y124.838 E-.23173
G1 X133.999 Y125.201 E-.15238
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 50/145
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.68 I-.528 J-1.097 P1  F30000
G1 X132.037 Y126.145 Z4.68
G1 Z4.326
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1473
G3 X123.581 Y126 I-4.163 J-3.892 E.38143
G1 X132.17 Y126 E.34379
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
G2 X133.512 Y123.106 I-4.305 J-3.753 E.12939
G1 X122.238 Y123.106 E.4512
G3 X122.223 Y121.493 I5.832 J-.863 E.06475
G3 X122.549 Y120.212 I5.943 J.832 E.05305
G1 X133.2 Y120.212 E.42627
G2 X130.736 Y117.317 I-5.338 J2.048 E.15507
G1 X125.014 Y117.317 E.22903
G3 X125.485 Y117.072 I4.042 J7.206 E.02126
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0736842
; WIPE_START
G1 F7329.351
G1 X125.014 Y117.317 E-.20184
G1 X126.483 Y117.317 E-.55817
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/145
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.726 I-.636 J1.038 P1  F30000
G1 X135.182 Y122.649 Z4.726
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F1473
G1 X135.162 Y122.531 E.00249
G1 X135.156 Y121.85 E.01411
G1 X136.832 Y121.85 E.03476
G1 X136.832 Y122.25 E.00828
G1 X136.832 Y122.649 E.00828
G1 X135.242 Y122.649 E.03298
G1 X134.694 Y123.05 F30000
G1 F1473
G2 X134.715 Y121.426 I-9.691 J-.938 E.03373
G1 X137.256 Y121.426 E.05271
G1 X137.256 Y122.25 E.01708
G1 X137.256 Y123.073 E.01708
G1 X135.28 Y123.073 E.04097
G1 X134.754 Y123.053 E.01094
; WIPE_START
G1 F3600
G1 X134.738 Y122.531 E-.19843
G1 X134.715 Y121.426 E-.4198
G1 X135.088 Y121.426 E-.14178
; WIPE_END
G1 E-.04 F1800
G1 X136.432 Y122.25 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.400092
G1 F1473
G1 X135.561 Y122.25 E.01594
; WIPE_START
G1 F3600
G1 X136.432 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.017 J-1.217 P1  F30000
G1 X120.576 Y122.022 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.480552
G1 F1473
G1 X120.573 Y122.477 E.01011
G1 X119.184 Y122.477 E.03089
G1 X119.184 Y122.022 E.01011
G1 X120.516 Y122.022 E.02963
G1 X121.048 Y121.551 F30000
; LINE_WIDTH: 0.449992
G1 F1473
G2 X121.04 Y122.918 I7.492 J.729 E.02841
G1 X118.744 Y122.917 E.04761
G1 X118.744 Y121.583 E.02766
G1 X120.744 Y121.583 E.04148
G2 X120.99 Y121.564 I.052 J-.96 E.00513
; WIPE_START
G1 F3600
G1 X121.024 Y121.763 E-.07667
G1 X121.008 Y122.38 E-.23423
G1 X121.04 Y122.918 E-.2051
G1 X120.398 Y122.918 E-.24401
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.773 J.94 P1  F30000
G1 X128.935 Y115.896 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389362
G1 F1473
M204 S5000
G3 X131.173 Y116.714 I-1.096 J6.467 E.04259
; LINE_WIDTH: 0.387452
G1 X131.655 Y117.032 E.01022
; LINE_WIDTH: 0.386262
G1 X132.177 Y117.455 E.01183
; LINE_WIDTH: 0.385962
G3 X133.024 Y118.378 I-4.331 J4.825 E.02209
; LINE_WIDTH: 0.385822
G3 X133.633 Y119.36 I-5.138 J3.866 E.02038
; LINE_WIDTH: 0.387882
G1 X133.905 Y119.979 E.01196
; LINE_WIDTH: 0.389692
G1 X134.087 Y120.545 E.01059
; LINE_WIDTH: 0.419992
G3 X134.158 Y123.675 I-5.853 J1.7 E.06103
; LINE_WIDTH: 0.386252
G3 X133.505 Y125.38 I-6.88 J-1.658 E.03227
; LINE_WIDTH: 0.385412
G1 X133.148 Y125.95 E.01182
; LINE_WIDTH: 0.384602
G1 X132.794 Y126.409 E.01016
; LINE_WIDTH: 0.385722
G3 X131.824 Y127.34 I-4.944 J-4.178 E.02372
; LINE_WIDTH: 0.386422
G3 X130.85 Y127.965 I-3.927 J-5.053 E.02043
; LINE_WIDTH: 0.389132
G3 X129.736 Y128.417 I-3.018 J-5.838 E.02139
; LINE_WIDTH: 0.390932
G3 X128.626 Y128.646 I-1.952 J-6.666 E.02026
; LINE_WIDTH: 0.390412
G3 X127.491 Y128.678 I-.749 J-6.398 E.02027
; LINE_WIDTH: 0.390542
G3 X126.367 Y128.51 I.385 J-6.427 E.02029
; LINE_WIDTH: 0.390722
G3 X125.619 Y128.284 I2.013 J-8.01 E.01396
; LINE_WIDTH: 0.385082
G1 X125 Y128.014 E.01186
; LINE_WIDTH: 0.385472
G1 X124.415 Y127.684 E.01181
; LINE_WIDTH: 0.385942
G1 X123.94 Y127.351 E.01021
; LINE_WIDTH: 0.387902
G3 X122.966 Y126.423 I3.921 J-5.089 E.02387
; LINE_WIDTH: 0.386592
G1 X122.611 Y125.965 E.01022
; LINE_WIDTH: 0.386262
G1 X122.254 Y125.397 E.01184
; LINE_WIDTH: 0.385452
G1 X121.955 Y124.79 E.01188
; LINE_WIDTH: 0.384622
G1 X121.751 Y124.248 E.01017
; LINE_WIDTH: 0.385752
G1 X121.575 Y123.596 E.01189
; LINE_WIDTH: 0.419992
G3 X121.533 Y121.108 I5.356 J-1.336 E.04838
; LINE_WIDTH: 0.390102
G1 X121.668 Y120.53 E.01057
; LINE_WIDTH: 0.389742
G1 X121.846 Y119.982 E.01027
; LINE_WIDTH: 0.389392
G3 X127.016 Y115.866 I6.029 J2.268 E.12336
; LINE_WIDTH: 0.391322
G3 X128.366 Y115.827 I.874 J6.979 E.02419
; LINE_WIDTH: 0.389582
G1 X128.876 Y115.889 E.00913
; WIPE_START
G1 F1800
M204 S10000
G1 X129.501 Y116.017 E-.24236
G1 X130.053 Y116.188 E-.21983
G1 X130.586 Y116.407 E-.21888
G1 X130.77 Y116.503 E-.07892
; WIPE_END
G1 E-.04
G17
G3 Z4.8 I-1.062 J.595 P1  F30000
G1 X134.683 Y123.485 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1473
M204 S5000
G1 X134.538 Y123.634 E.004
; LINE_WIDTH: 0.390482
G1 X134.502 Y123.784 E.00275
; LINE_WIDTH: 0.385772
G3 X134.124 Y124.938 I-6.6 J-1.522 E.0214
; LINE_WIDTH: 0.391432
G1 X133.91 Y125.391 E.00895
; LINE_WIDTH: 0.392012
M73 P58 R8
G3 X133.253 Y126.418 I-6.116 J-3.192 E.02187
; LINE_WIDTH: 0.391772
G3 X132.422 Y127.311 I-5.564 J-4.343 E.02184
; LINE_WIDTH: 0.391352
G1 X131.95 Y127.699 E.01094
; LINE_WIDTH: 0.389372
G1 X131.477 Y128.023 E.01019
; LINE_WIDTH: 0.388772
G3 X130.337 Y128.592 I-3.513 J-5.616 E.02264
; LINE_WIDTH: 0.386812
G1 X129.761 Y128.786 E.01074
; LINE_WIDTH: 0.390932
G3 X128.664 Y129.008 I-1.873 J-6.435 E.02001
; LINE_WIDTH: 0.390412
G3 X127.464 Y129.041 I-.788 J-6.759 E.02142
; LINE_WIDTH: 0.390542
G3 X126.276 Y128.863 I.411 J-6.791 E.02144
; LINE_WIDTH: 0.390722
G1 X125.705 Y128.698 E.01061
; LINE_WIDTH: 0.392172
G3 X124.606 Y128.216 I2.224 J-6.565 E.02153
; LINE_WIDTH: 0.391742
G1 X124.092 Y127.905 E.01075
; LINE_WIDTH: 0.389842
G1 X123.627 Y127.565 E.01026
; LINE_WIDTH: 0.389722
G1 X123.151 Y127.147 E.01127
; LINE_WIDTH: 0.387622
G3 X122.303 Y126.152 I4.478 J-4.676 E.02316
; LINE_WIDTH: 0.391372
G1 X122.03 Y125.732 E.00896
; LINE_WIDTH: 0.392052
G3 X121.183 Y123.482 I5.932 J-3.519 E.04329
; LINE_WIDTH: 0.419992
G1 X121.004 Y123.326 E.00457
G1 X120.384 Y123.326 E.01196
G1 X119.763 Y123.326 E.01196
G1 X119.143 Y123.326 E.01196
G1 X118.335 Y123.326 E.01557
G1 X118.335 Y123.187 E.00267
G1 X118.335 Y122.567 E.01196
G1 X118.335 Y121.946 E.01196
G1 X118.335 Y121.279 E.01287
G1 X118.335 Y121.231 E.00091
G1 X118.335 Y121.184 E.00091
G1 X120.381 Y121.174 E.03944
G1 X120.589 Y121.174 E.004
G1 X120.797 Y121.174 E.004
G1 X121.004 Y121.174 E.004
G1 X121.184 Y121.006 E.00474
; LINE_WIDTH: 0.388642
G1 X121.352 Y120.321 E.0125
; LINE_WIDTH: 0.385772
G3 X130.847 Y116.132 I6.53 J1.946 E.20767
; LINE_WIDTH: 0.386932
G3 X131.887 Y116.756 I-2.723 J5.713 E.02145
; LINE_WIDTH: 0.391372
G3 X133.385 Y118.256 I-4.032 J5.524 E.03805
; LINE_WIDTH: 0.389352
G1 X133.72 Y118.766 E.01085
; LINE_WIDTH: 0.389712
G3 X134.256 Y119.886 I-5.876 J3.498 E.02211
; LINE_WIDTH: 0.393622
G1 X134.536 Y120.863 E.01829
; LINE_WIDTH: 0.419992
G1 X134.663 Y121.01 E.00374
G1 X135.453 Y121.017 E.01524
G1 X136.192 Y121.017 E.01424
G1 X137.665 Y121.017 E.0284
G1 X137.665 Y121.338 E.0062
G1 X137.665 Y121.794 E.00878
G1 X137.665 Y122.25 E.00878
G1 X137.665 Y122.705 E.00878
G1 X137.665 Y123.161 E.00878
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
G1 X137.665 Y123.482 E.0062
G1 X135.665 Y123.483 E.03855
G2 X135.124 Y123.483 I-.192 J62.414 E.01043
G1 X134.903 Y123.484 E.00425
G1 X134.743 Y123.485 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X134.538 Y123.634 E-.09622
G1 X134.502 Y123.784 E-.05866
G1 X134.338 Y124.372 E-.23199
G1 X134.124 Y124.938 E-.22995
G1 X133.963 Y125.279 E-.14319
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 52/145
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.8 I1.107 J.506 P1  F30000
G1 X135.153 Y122.678 Z4.8
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X135.15 Y121.821 E.01776
G1 X136.832 Y121.822 E.03489
G1 X136.832 Y122.25 E.00888
G1 X136.832 Y122.678 E.00888
G1 X135.213 Y122.678 E.03358
G1 X134.681 Y123.114 F30000
G1 F1200
G2 X134.685 Y121.384 I-6.838 J-.882 E.03598
G1 X134.709 Y121.397 E.00056
G1 X137.256 Y121.397 E.05283
G1 X137.256 Y122.25 E.01768
G1 X137.256 Y123.102 E.01768
G2 X134.741 Y123.113 I-.825 J101.727 E.05217
; WIPE_START
G1 F3600
G1 X134.726 Y122.736 E-.14323
G1 X134.742 Y122.12 E-.23422
G1 X134.685 Y121.384 E-.28058
G1 X134.709 Y121.397 E-.01035
G1 X134.95 Y121.397 E-.09162
; WIPE_END
G1 E-.04 F1800
M73 P59 R8
G1 X136.403 Y122.25 Z4.92 F30000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.457912
G1 F1200
G1 X135.594 Y122.25 E.01711
; WIPE_START
G1 F3600
G1 X136.403 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.92 I.019 J-1.217 P1  F30000
G1 X120.56 Y122.006 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.512812
G1 F1200
G1 X120.558 Y122.493 E.0116
G1 X119.2 Y122.493 E.03234
G1 X119.2 Y122.006 E.0116
G1 X120.5 Y122.006 E.03097
G1 X121.052 Y121.522 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X121.04 Y122.917 I7.356 J.761 E.02898
G1 X121.009 Y122.949 E.00092
G1 X118.744 Y122.949 E.04699
G1 X118.744 Y121.551 E.029
G1 X120.744 Y121.551 E.04148
G2 X120.993 Y121.533 I.036 J-1.27 E.00518
; WIPE_START
G1 F3600
G1 X121.024 Y121.763 E-.08825
G1 X121.008 Y122.38 E-.23424
G1 X121.04 Y122.917 E-.20451
G1 X121.009 Y122.949 E-.01677
G1 X120.44 Y122.949 E-.21624
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.92 I.779 J.935 P1  F30000
G1 X128.901 Y115.897 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.385812
G1 F1200
M204 S5000
G1 X129.393 Y115.988 E.00881
; LINE_WIDTH: 0.387522
G3 X130.488 Y116.36 I-1.456 J6.085 E.02049
; LINE_WIDTH: 0.386252
G1 X131.006 Y116.619 E.0102
; LINE_WIDTH: 0.386502
G3 X131.961 Y117.269 I-3.072 J5.539 E.0204
; LINE_WIDTH: 0.385342
G3 X132.784 Y118.078 I-4.038 J4.931 E.02033
; LINE_WIDTH: 0.385572
G1 X133.139 Y118.535 E.01018
; LINE_WIDTH: 0.387832
G3 X133.795 Y119.709 I-5.192 J3.674 E.02385
; LINE_WIDTH: 0.385832
G1 X134.056 Y120.433 E.01355
; LINE_WIDTH: 0.389832
G1 X134.178 Y120.921 E.00896
; LINE_WIDTH: 0.419992
G3 X134.224 Y123.397 I-5.67 J1.344 E.0481
; LINE_WIDTH: 0.406472
G1 X134.062 Y124.047 E.01248
; LINE_WIDTH: 0.385912
G1 X133.875 Y124.596 E.0102
; LINE_WIDTH: 0.385782
G1 X133.641 Y125.125 E.01019
; LINE_WIDTH: 0.389972
G3 X132.967 Y126.195 I-6.021 J-3.043 E.02255
; LINE_WIDTH: 0.389352
G1 X132.537 Y126.696 E.01173
; LINE_WIDTH: 0.385342
G1 X132.12 Y127.096 E.01016
; LINE_WIDTH: 0.384892
G1 X131.668 Y127.457 E.01016
; LINE_WIDTH: 0.386472
G1 X131.022 Y127.872 E.01354
; LINE_WIDTH: 0.386592
G1 X130.503 Y128.132 E.01025
; LINE_WIDTH: 0.386762
G1 X129.965 Y128.345 E.01021
; LINE_WIDTH: 0.386902
G1 X129.41 Y128.507 E.0102
; LINE_WIDTH: 0.389442
G1 X128.808 Y128.623 E.01092
; LINE_WIDTH: 0.391102
G3 X127.688 Y128.687 I-.95 J-6.858 E.02005
; LINE_WIDTH: 0.392052
G3 X126.013 Y128.415 I.377 J-7.623 E.03045
; LINE_WIDTH: 0.390622
G3 X124.995 Y128.013 I2.062 J-6.711 E.01955
; LINE_WIDTH: 0.388722
G3 X123.94 Y127.352 I2.96 J-5.9 E.02213
; LINE_WIDTH: 0.389962
G1 X123.501 Y126.976 E.01029
; LINE_WIDTH: 0.391002
G3 X122.729 Y126.121 I4.651 J-4.974 E.0206
; LINE_WIDTH: 0.390222
G1 X122.255 Y125.399 E.01539
; LINE_WIDTH: 0.385812
G1 X121.955 Y124.791 E.01194
; LINE_WIDTH: 0.389952
G3 X121.555 Y123.503 I6.369 J-2.684 E.02405
; LINE_WIDTH: 0.419992
G3 X121.533 Y121.103 I5.4 J-1.25 E.04662
; LINE_WIDTH: 0.392252
G1 X121.668 Y120.531 E.01054
; LINE_WIDTH: 0.389762
G1 X121.846 Y119.981 E.01029
; LINE_WIDTH: 0.389372
G3 X123.94 Y117.148 I6.189 J2.384 E.06339
; LINE_WIDTH: 0.386252
G3 X127.098 Y115.854 I3.935 J5.1 E.06088
G1 X128.054 Y115.812 E.01687
; LINE_WIDTH: 0.385152
G1 X128.726 Y115.864 E.01184
; LINE_WIDTH: 0.385812
G1 X128.842 Y115.886 E.00208
; WIPE_START
G1 F1800
M204 S10000
G1 X129.393 Y115.988 E-.21289
G1 X129.95 Y116.149 E-.22027
G1 X130.488 Y116.36 E-.2198
G1 X130.74 Y116.486 E-.10705
; WIPE_END
G1 E-.04
G17
G3 Z4.92 I-1.06 J.599 P1  F30000
G1 X134.709 Y123.511 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X134.576 Y123.572 E.00282
; LINE_WIDTH: 0.406472
G1 X134.532 Y123.662 E.00186
; LINE_WIDTH: 0.391992
G1 X134.375 Y124.263 E.01111
; LINE_WIDTH: 0.389352
G1 X134.168 Y124.838 E.01086
; LINE_WIDTH: 0.389932
G3 X133.562 Y125.984 I-6.21 J-2.553 E.02313
; LINE_WIDTH: 0.389352
G1 X133.258 Y126.413 E.00934
; LINE_WIDTH: 0.390252
G1 X132.937 Y126.796 E.00891
; LINE_WIDTH: 0.390852
G3 X132.111 Y127.575 I-5.031 J-4.51 E.02029
; LINE_WIDTH: 0.392632
G3 X131.13 Y128.226 I-4.463 J-5.656 E.02115
; LINE_WIDTH: 0.388682
G1 X130.59 Y128.49 E.01066
; LINE_WIDTH: 0.388502
G1 X130.029 Y128.705 E.01066
; LINE_WIDTH: 0.388312
G1 X129.451 Y128.87 E.01066
; LINE_WIDTH: 0.388172
G1 X128.769 Y128.994 E.01228
; LINE_WIDTH: 0.391102
G3 X127.672 Y129.051 I-.895 J-6.614 E.01964
; LINE_WIDTH: 0.392052
G3 X125.897 Y128.76 I.36 J-7.765 E.03229
; LINE_WIDTH: 0.390622
G3 X124.775 Y128.307 I2.024 J-6.633 E.02161
; LINE_WIDTH: 0.388892
G1 X124.193 Y127.97 E.01194
; LINE_WIDTH: 0.386832
G3 X123.181 Y127.172 I3.522 J-5.509 E.02279
; LINE_WIDTH: 0.391002
G3 X122.435 Y126.336 I4.601 J-4.853 E.02002
; LINE_WIDTH: 0.392002
G3 X121.832 Y125.376 I5.493 J-4.12 E.02033
; LINE_WIDTH: 0.391482
G1 X121.576 Y124.822 E.01091
; LINE_WIDTH: 0.389962
G3 X121.186 Y123.511 I7.183 J-2.847 E.02439
; LINE_WIDTH: 0.419992
G1 X121.009 Y123.358 E.0045
G1 X119.994 Y123.358 E.01958
G1 X118.335 Y123.358 E.03197
G1 X118.335 Y122.374 E.01896
G1 X118.335 Y121.248 E.02171
G1 X118.335 Y121.141 E.00206
G1 X120.666 Y121.141 E.04493
G1 X121.009 Y121.141 E.00662
G1 X121.187 Y120.986 E.00454
; LINE_WIDTH: 0.389782
G1 X121.352 Y120.321 E.01219
; LINE_WIDTH: 0.385772
G3 X127.079 Y115.494 I6.551 J1.96 E.13954
; LINE_WIDTH: 0.396372
G3 X128.395 Y115.466 I.809 J7.226 E.02388
; LINE_WIDTH: 0.391922
G1 X128.997 Y115.539 E.01087
; LINE_WIDTH: 0.391462
G1 X129.595 Y115.666 E.01092
; LINE_WIDTH: 0.389402
G1 X130.095 Y115.818 E.0093
; LINE_WIDTH: 0.387002
G1 X130.662 Y116.044 E.01077
; LINE_WIDTH: 0.385772
G1 X131.202 Y116.316 E.01066
; LINE_WIDTH: 0.389342
G1 X131.63 Y116.575 E.00889
; LINE_WIDTH: 0.390012
G1 X132.054 Y116.881 E.0093
; LINE_WIDTH: 0.390222
G1 X132.497 Y117.257 E.01036
; LINE_WIDTH: 0.390852
G3 X133.548 Y118.494 I-5.366 J5.624 E.02904
; LINE_WIDTH: 0.390702
G1 X133.816 Y118.93 E.00912
; LINE_WIDTH: 0.391122
G1 X134.044 Y119.382 E.00905
; LINE_WIDTH: 0.392932
G3 X134.408 Y120.352 I-6.248 J2.896 E.01862
; LINE_WIDTH: 0.392602
G1 X134.541 Y120.864 E.00949
; LINE_WIDTH: 0.419992
G1 X134.709 Y120.988 E.00402
G1 X135.94 Y120.988 E.02373
G1 X137.665 Y120.988 E.03326
G1 X137.665 Y121.469 E.00928
G1 X137.665 Y122.25 E.01504
G1 X137.665 Y123.032 E.01507
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
G1 X137.665 Y123.511 E.00924
G1 X135.299 Y123.511 E.0456
G1 X134.769 Y123.511 E.01022
; CHANGE_LAYER
; Z_HEIGHT: 4.59789
; LAYER_HEIGHT: 0.0778947
; WIPE_START
G1 F1800
M204 S10000
G1 X134.576 Y123.572 E-.07689
G1 X134.532 Y123.662 E-.03804
G1 X134.375 Y124.263 E-.23584
G1 X134.168 Y124.838 E-.23219
G1 X133.972 Y125.26 E-.17704
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 53/145
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.92 I-.507 J-1.106 P1  F30000
G1 X132.038 Y126.146 Z4.92
G1 Z4.598
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1476
G3 X130.256 Y127.431 I-4.201 J-3.949 E.08848
G3 X123.58 Y126 I-2.381 J-5.181 E.293
G1 X132.17 Y126 E.34384
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
G2 X133.511 Y123.106 I-4.327 J-3.763 E.12938
G1 X122.237 Y123.106 E.45124
G3 X122.549 Y120.212 I5.635 J-.857 E.11782
G1 X133.2 Y120.212 E.42627
G2 X130.811 Y117.361 I-5.406 J2.104 E.15154
G1 X130.736 Y117.317 E.00346
G1 X125.014 Y117.317 E.22903
G3 X125.485 Y117.072 I2.65 J4.525 E.02127
; CHANGE_LAYER
; Z_HEIGHT: 4.64
; LAYER_HEIGHT: 0.0421052
; WIPE_START
G1 F7329.351
G1 X125.014 Y117.317 E-.20185
G1 X126.483 Y117.317 E-.55816
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/145
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.998 I-.642 J1.034 P1  F30000
G1 X135.151 Y122.697 Z4.998
G1 Z4.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F1476
G2 X135.151 Y121.803 I-5.603 J-.447 E.01855
G1 X136.832 Y121.803 E.03485
G1 X136.832 Y122.25 E.00927
G1 X136.832 Y122.696 E.00927
G1 X135.211 Y122.697 E.0336
G1 X134.689 Y123.104 F30000
G1 F1476
G2 X134.704 Y121.379 I-9.283 J-.946 E.03583
G1 X137.256 Y121.379 E.05292
G1 X137.256 Y122.25 E.01807
G1 X137.256 Y123.121 E.01807
G1 X135.256 Y123.121 E.04148
G3 X134.749 Y123.107 I-.015 J-8.92 E.01052
; WIPE_START
G1 F3600
G1 X134.738 Y122.531 E-.21911
G1 X134.735 Y121.914 E-.23422
G1 X134.704 Y121.379 E-.20391
G1 X134.975 Y121.379 E-.10277
; WIPE_END
G1 E-.04 F1800
G1 X135.609 Y122.25 Z5.04 F30000
G1 Z4.64
G1 E.8 F1800
; LINE_WIDTH: 0.495112
G1 F1476
G1 X136.385 Y122.25 E.0178
; WIPE_START
G1 F3600
G1 X135.609 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I.021 J-1.217 P1  F30000
G1 X120.55 Y121.996 Z5.04
G1 Z4.64
G1 E.8 F1800
; LINE_WIDTH: 0.533582
G1 F1476
G1 X120.548 Y122.504 E.01261
G1 X119.21 Y122.504 E.03322
G1 X119.21 Y121.996 E.01261
G1 X120.49 Y121.996 E.03178
G1 X121.054 Y121.504 F30000
; LINE_WIDTH: 0.449992
G1 F1476
G2 X121.041 Y122.941 I7.348 J.785 E.02984
G1 X121.014 Y122.97 E.00082
G1 X118.744 Y122.97 E.04709
G1 X118.744 Y121.53 E.02987
G2 X120.994 Y121.507 I.771 J-34.715 E.04668
; WIPE_START
G1 F3600
G1 X121.024 Y121.763 E-.09813
G1 X121.008 Y122.38 E-.23423
G1 X121.041 Y122.941 E-.21358
G1 X121.014 Y122.97 E-.015
G1 X120.491 Y122.97 E-.19907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I.783 J.932 P1  F30000
G1 X128.909 Y115.893 Z5.04
G1 Z4.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389612
G1 F1476
M204 S5000
G1 X128.935 Y115.896 E.00046
; LINE_WIDTH: 0.389372
G3 X130.132 Y116.215 I-1.081 J6.453 E.02204
; LINE_WIDTH: 0.385362
G3 X131.655 Y117.033 I-2.659 J6.781 E.03047
; LINE_WIDTH: 0.385542
G1 X132.108 Y117.393 E.01017
; LINE_WIDTH: 0.388072
G1 X132.597 Y117.866 E.01205
; LINE_WIDTH: 0.389672
G3 X133.351 Y118.856 I-5.046 J4.627 E.02218
; LINE_WIDTH: 0.385362
G1 X133.678 Y119.453 E.01197
; LINE_WIDTH: 0.385802
G3 X134.108 Y120.621 I-5.721 J2.772 E.02194
; LINE_WIDTH: 0.419992
G1 X134.275 Y121.371 E.0148
G3 X134.168 Y123.598 I-5.905 J.835 E.04324
; LINE_WIDTH: 0.393362
G1 X134.028 Y124.147 E.01018
; LINE_WIDTH: 0.390842
G3 X133.59 Y125.215 I-6.154 J-1.898 E.02064
; LINE_WIDTH: 0.392922
G3 X132.973 Y126.186 I-6.795 J-3.636 E.02067
; LINE_WIDTH: 0.389402
G1 X132.323 Y126.909 E.01728
G1 X131.886 Y127.29 E.01031
; LINE_WIDTH: 0.389792
G1 X131.445 Y127.61 E.00971
; LINE_WIDTH: 0.389902
G1 X130.958 Y127.904 E.01013
; LINE_WIDTH: 0.391942
G1 X130.447 Y128.151 E.01016
; LINE_WIDTH: 0.392062
G3 X129.374 Y128.512 I-2.681 J-6.19 E.0203
; LINE_WIDTH: 0.390662
G3 X128.25 Y128.678 I-1.5 J-6.264 E.0203
; LINE_WIDTH: 0.390542
G1 X127.695 Y128.687 E.00988
; LINE_WIDTH: 0.390352
G3 X126.566 Y128.555 I.178 J-6.439 E.02029
; LINE_WIDTH: 0.390222
G1 X126.015 Y128.415 E.01014
; LINE_WIDTH: 0.390612
G3 X124.993 Y128.012 I2.058 J-6.705 E.01962
; LINE_WIDTH: 0.388632
G1 X124.441 Y127.701 E.01123
; LINE_WIDTH: 0.389392
G1 X124.008 Y127.401 E.00937
; LINE_WIDTH: 0.391522
G3 X123.094 Y126.562 I4.176 J-5.463 E.02221
; LINE_WIDTH: 0.390922
G1 X122.612 Y125.965 E.01371
; LINE_WIDTH: 0.385112
G1 X122.257 Y125.401 E.0117
; LINE_WIDTH: 0.385812
G3 X121.574 Y123.591 I6.114 J-3.339 E.03417
; LINE_WIDTH: 0.419992
G3 X121.533 Y121.101 I5.418 J-1.336 E.04841
; LINE_WIDTH: 0.393112
G1 X121.668 Y120.531 E.01052
; LINE_WIDTH: 0.389742
G1 X121.846 Y119.981 E.01029
; LINE_WIDTH: 0.389372
G1 X122.074 Y119.45 E.01027
; LINE_WIDTH: 0.392922
G3 X122.493 Y118.71 I10.81 J5.629 E.01527
; LINE_WIDTH: 0.384682
G1 X122.833 Y118.24 E.01019
; LINE_WIDTH: 0.384542
G3 X123.631 Y117.404 I5.042 J4.01 E.02029
; LINE_WIDTH: 0.385112
G1 X124.154 Y116.992 E.0117
; LINE_WIDTH: 0.385802
G3 X125.247 Y116.367 I3.684 J5.181 E.0222
; LINE_WIDTH: 0.388032
G1 X125.882 Y116.123 E.01206
; LINE_WIDTH: 0.389672
G3 X127.016 Y115.866 I2.055 J6.445 E.02071
; LINE_WIDTH: 0.391232
G3 X128.366 Y115.827 I.873 J6.943 E.02418
; LINE_WIDTH: 0.389612
G1 X128.85 Y115.886 E.00867
; WIPE_START
G1 F1800
M204 S10000
G1 X128.935 Y115.896 E-.03273
G1 X129.502 Y116.017 E-.22013
G1 X130.132 Y116.215 E-.25084
G1 X130.663 Y116.443 E-.21955
G1 X130.748 Y116.488 E-.03675
; WIPE_END
G1 E-.04
G17
G3 Z5.04 I-1.061 J.596 P1  F30000
G1 X134.704 Y123.53 Z5.04
G1 Z4.64
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1476
M204 S5000
G1 X134.527 Y123.68 E.00449
; LINE_WIDTH: 0.393362
G1 X134.375 Y124.262 E.01081
; LINE_WIDTH: 0.390842
G3 X133.911 Y125.391 I-6.501 J-2.013 E.02181
; LINE_WIDTH: 0.392922
G3 X133.253 Y126.419 I-6.36 J-3.343 E.02193
; LINE_WIDTH: 0.389402
G1 X132.916 Y126.819 E.00931
; LINE_WIDTH: 0.387012
G1 X132.49 Y127.247 E.01067
; LINE_WIDTH: 0.389342
G1 X132.111 Y127.575 E.00891
; LINE_WIDTH: 0.389792
G1 X131.644 Y127.915 E.01028
; LINE_WIDTH: 0.389902
G1 X131.129 Y128.226 E.01071
; LINE_WIDTH: 0.391942
G1 X130.588 Y128.489 E.01077
; LINE_WIDTH: 0.392062
G3 X129.449 Y128.869 I-2.747 J-6.33 E.02154
; LINE_WIDTH: 0.390662
G3 X128.26 Y129.043 I-1.574 J-6.621 E.02146
; LINE_WIDTH: 0.390542
G1 X127.674 Y129.051 E.01046
; LINE_WIDTH: 0.390352
G3 X126.481 Y128.91 I.2 J-6.799 E.02145
; LINE_WIDTH: 0.390222
G1 X125.898 Y128.761 E.01072
; LINE_WIDTH: 0.390612
G3 X124.772 Y128.306 I2.024 J-6.635 E.02169
; LINE_WIDTH: 0.388882
G1 X124.193 Y127.971 E.01187
; LINE_WIDTH: 0.386612
G1 X123.694 Y127.616 E.01082
; LINE_WIDTH: 0.385812
G1 X123.181 Y127.169 E.01198
; LINE_WIDTH: 0.390922
G3 X122.488 Y126.406 I4.358 J-4.651 E.01843
; LINE_WIDTH: 0.391952
G3 X121.832 Y125.376 I5.472 J-4.208 E.02188
; LINE_WIDTH: 0.391532
G1 X121.575 Y124.823 E.01091
; LINE_WIDTH: 0.389662
M73 P60 R8
G1 X121.37 Y124.247 E.01087
; LINE_WIDTH: 0.391262
G1 X121.192 Y123.531 E.01318
; LINE_WIDTH: 0.419992
G1 X121.014 Y123.379 E.00451
G1 X118.335 Y123.379 E.05165
G1 X118.335 Y121.121 E.04353
G1 X121.014 Y121.12 E.05165
G1 X121.192 Y120.965 E.00454
; LINE_WIDTH: 0.389652
G1 X121.352 Y120.321 E.0118
; LINE_WIDTH: 0.385782
G3 X121.798 Y119.192 I6.537 J1.933 E.02141
; LINE_WIDTH: 0.392922
G3 X122.376 Y118.243 I6.155 J3.096 E.01996
; LINE_WIDTH: 0.390852
G3 X123.179 Y117.326 I5.501 J4.008 E.02179
; LINE_WIDTH: 0.391952
G3 X124.134 Y116.567 I4.756 J5.002 E.02187
; LINE_WIDTH: 0.391522
G1 X124.658 Y116.254 E.01092
; LINE_WIDTH: 0.389732
G3 X125.805 Y115.768 I3.222 J6.011 E.0222
; LINE_WIDTH: 0.387712
G1 X126.481 Y115.591 E.01237
; LINE_WIDTH: 0.385802
G3 X128.506 Y115.477 I1.461 J7.841 E.0358
; LINE_WIDTH: 0.386262
G1 X129.079 Y115.554 E.01019
; LINE_WIDTH: 0.389372
G1 X129.588 Y115.664 E.00925
; LINE_WIDTH: 0.390252
G1 X130.068 Y115.809 E.00894
; LINE_WIDTH: 0.390822
G3 X132.885 Y117.645 I-2.224 J6.492 E.06063
; LINE_WIDTH: 0.389672
G1 X133.259 Y118.088 E.01032
; LINE_WIDTH: 0.390242
G1 X133.55 Y118.496 E.00894
; LINE_WIDTH: 0.392112
G3 X134.094 Y119.49 I-5.768 J3.805 E.02031
; LINE_WIDTH: 0.391262
G1 X134.317 Y120.058 E.01091
; LINE_WIDTH: 0.395782
G1 X134.532 Y120.839 E.01465
; LINE_WIDTH: 0.419992
G1 X134.704 Y120.969 E.00417
G1 X137.665 Y120.969 E.05707
G1 X137.665 Y122.25 E.02468
G1 X137.665 Y123.53 E.02468
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
G1 X134.764 Y123.53 E.05591
; CHANGE_LAYER
; Z_HEIGHT: 4.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X134.527 Y123.68 E-.10693
G1 X134.375 Y124.262 E-.22859
G1 X134.168 Y124.837 E-.23215
G1 X133.954 Y125.296 E-.19234
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 55/145
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.04 I1.105 J.51 P1  F30000
G1 X135.151 Y122.705 Z5.04
G1 Z4.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X135.151 Y121.794 E.0189
G1 X136.832 Y121.794 E.03487
G1 X136.832 Y122.25 E.00945
G1 X136.832 Y122.705 E.00945
G1 X135.211 Y122.705 E.03362
G1 X134.688 Y123.114 F30000
G1 F1200
G2 X134.703 Y121.37 I-9.166 J-.949 E.03622
G1 X137.256 Y121.37 E.05296
G1 X137.256 Y122.25 E.01825
G1 X137.256 Y123.13 E.01825
G1 X135.256 Y123.13 E.04148
G3 X134.748 Y123.117 I-.011 J-9.709 E.01054
; WIPE_START
G1 F3600
G1 X134.738 Y122.531 E-.22278
G1 X134.735 Y121.914 E-.23422
G1 X134.703 Y121.37 E-.20729
G1 X134.954 Y121.37 E-.09572
; WIPE_END
G1 E-.04 F1800
G1 X135.618 Y122.25 Z5.16 F30000
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.512772
G1 F1200
G1 X136.376 Y122.25 E.01805
; WIPE_START
G1 F3600
G1 X135.618 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.16 I.021 J-1.217 P1  F30000
G1 X120.546 Y121.991 Z5.16
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.543372
G1 F1200
G1 X120.543 Y122.508 E.0131
G1 X119.215 Y122.509 E.03362
G1 X119.215 Y121.991 E.0131
G1 X120.486 Y121.991 E.03215
G1 X121.052 Y121.504 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X121.041 Y122.941 I7.606 J.777 E.02984
G1 X121.017 Y122.979 E.00095
G1 X118.744 Y122.979 E.04713
G1 X118.744 Y121.52 E.03027
G2 X120.992 Y121.506 I.767 J-56.352 E.04663
; WIPE_START
G1 F3600
G1 X121.024 Y121.763 E-.09863
G1 X121.008 Y122.38 E-.23423
G1 X121.041 Y122.941 E-.21357
G1 X121.017 Y122.979 E-.01747
G1 X120.5 Y122.979 E-.1961
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.16 I.785 J.93 P1  F30000
G1 X128.895 Y115.894 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.391872
G1 F1200
M204 S5000
G1 X128.926 Y115.898 E.00055
; LINE_WIDTH: 0.391572
G1 X129.491 Y116.014 E.01033
; LINE_WIDTH: 0.389542
G1 X130.491 Y116.365 E.01884
; LINE_WIDTH: 0.391032
G3 X131.497 Y116.926 I-2.859 J6.309 E.0206
; LINE_WIDTH: 0.390172
G1 X132.171 Y117.45 E.01521
; LINE_WIDTH: 0.385082
G1 X132.656 Y117.932 E.01201
; LINE_WIDTH: 0.386132
G3 X133.352 Y118.856 I-4.648 J4.225 E.02041
; LINE_WIDTH: 0.387052
G3 X133.906 Y119.987 I-5.282 J3.293 E.02229
; LINE_WIDTH: 0.385352
G1 X134.108 Y120.62 E.01168
; LINE_WIDTH: 0.419992
G3 X134.172 Y123.611 I-5.848 J1.621 E.05827
; LINE_WIDTH: 0.389582
G1 X134.029 Y124.153 E.00997
; LINE_WIDTH: 0.389362
G1 X133.833 Y124.697 E.01028
; LINE_WIDTH: 0.391582
G1 X133.588 Y125.218 E.01031
; LINE_WIDTH: 0.391922
G3 X132.968 Y126.189 I-5.955 J-3.116 E.02065
; LINE_WIDTH: 0.390852
G1 X132.327 Y126.907 E.01718
; LINE_WIDTH: 0.389672
G1 X131.885 Y127.29 E.0104
; LINE_WIDTH: 0.389802
G3 X130.957 Y127.905 I-4.014 J-5.05 E.01984
; LINE_WIDTH: 0.389992
G1 X130.446 Y128.155 E.01013
; LINE_WIDTH: 0.391702
G1 X129.915 Y128.356 E.01016
; LINE_WIDTH: 0.392262
G3 X128.814 Y128.62 I-2.157 J-6.555 E.02032
; LINE_WIDTH: 0.390602
G3 X127.697 Y128.687 I-.943 J-6.401 E.01997
; LINE_WIDTH: 0.390342
G3 X126.568 Y128.556 I.177 J-6.441 E.0203
; LINE_WIDTH: 0.390202
G1 X126.016 Y128.416 E.01014
; LINE_WIDTH: 0.390972
G3 X124.933 Y127.982 I2.094 J-6.792 E.02086
; LINE_WIDTH: 0.388452
G3 X123.94 Y127.352 I3.005 J-5.837 E.02088
; LINE_WIDTH: 0.387322
G1 X123.498 Y126.978 E.01023
; LINE_WIDTH: 0.386272
G1 X123.092 Y126.567 E.01018
; LINE_WIDTH: 0.386612
G3 X122.399 Y125.643 I4.708 J-4.259 E.02041
; LINE_WIDTH: 0.385392
G1 X122.117 Y125.139 E.01016
; LINE_WIDTH: 0.384532
G3 X121.694 Y124.064 I5.759 J-2.889 E.02029
; LINE_WIDTH: 0.387792
G1 X121.554 Y123.503 E.01023
; LINE_WIDTH: 0.419992
G3 X121.51 Y121.201 I5.545 J-1.259 E.04468
; LINE_WIDTH: 0.402432
G1 X121.637 Y120.636 E.01067
; LINE_WIDTH: 0.386222
G1 X121.807 Y120.084 E.01019
; LINE_WIDTH: 0.385772
G3 X122.291 Y119.035 I6.073 J2.168 E.02036
; LINE_WIDTH: 0.389952
G3 X123.028 Y118.008 I5.821 J3.393 E.02254
; LINE_WIDTH: 0.389372
G3 X127.016 Y115.866 I4.848 J4.243 E.08223
; LINE_WIDTH: 0.396372
G3 X128.357 Y115.83 I.901 J8.694 E.02434
; LINE_WIDTH: 0.391872
G1 X128.836 Y115.887 E.00862
; WIPE_START
G1 F1800
M204 S10000
G1 X128.926 Y115.898 E-.03449
G1 X129.491 Y116.014 E-.21941
G1 X130.491 Y116.365 E-.40253
G1 X130.734 Y116.487 E-.10357
; WIPE_END
G1 E-.04
G17
G3 Z5.16 I-1.061 J.597 P1  F30000
G1 X134.703 Y123.539 Z5.16
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X134.527 Y123.69 E.00447
; LINE_WIDTH: 0.389582
G1 X134.503 Y123.785 E.00175
; LINE_WIDTH: 0.386492
G1 X134.338 Y124.372 E.01076
; LINE_WIDTH: 0.385772
G1 X134.124 Y124.938 E.01065
; LINE_WIDTH: 0.391582
G1 X133.91 Y125.391 E.00895
; LINE_WIDTH: 0.391922
G3 X133.258 Y126.412 I-6.157 J-3.214 E.02173
; LINE_WIDTH: 0.390852
G3 X132.551 Y127.193 I-5.64 J-4.396 E.01882
; LINE_WIDTH: 0.389672
G1 X132.111 Y127.575 E.01035
; LINE_WIDTH: 0.389802
G3 X131.128 Y128.226 I-4.234 J-5.323 E.02102
; LINE_WIDTH: 0.389992
G1 X130.588 Y128.49 E.01071
; LINE_WIDTH: 0.391702
G1 X130.026 Y128.704 E.01077
; LINE_WIDTH: 0.392262
G3 X128.857 Y128.983 I-2.187 J-6.596 E.02156
; LINE_WIDTH: 0.390602
G3 X127.676 Y129.051 I-.983 J-6.738 E.02112
; LINE_WIDTH: 0.390342
G3 X126.482 Y128.91 I.199 J-6.804 E.02145
; LINE_WIDTH: 0.390202
G1 X125.9 Y128.761 E.01072
; LINE_WIDTH: 0.390972
G3 X124.72 Y128.278 I1.995 J-6.55 E.02278
; LINE_WIDTH: 0.386672
G1 X124.193 Y127.97 E.01078
; LINE_WIDTH: 0.387072
G3 X123.232 Y127.221 I3.461 J-5.43 E.02155
; LINE_WIDTH: 0.385782
G1 X122.805 Y126.786 E.01074
; LINE_WIDTH: 0.386222
G3 X122.08 Y125.811 I4.877 J-4.388 E.02145
; LINE_WIDTH: 0.385312
G1 X121.785 Y125.277 E.01071
; LINE_WIDTH: 0.384532
G3 X121.343 Y124.141 I6.093 J-3.029 E.02142
; LINE_WIDTH: 0.387742
G1 X121.2 Y123.577 E.01031
; LINE_WIDTH: 0.419992
G1 X121.017 Y123.389 E.00506
G1 X118.335 Y123.389 E.05169
G1 X118.335 Y121.111 E.04391
G1 X121.017 Y121.111 E.05169
G1 X121.156 Y121.04 E.00301
; LINE_WIDTH: 0.402432
G1 X121.194 Y120.955 E.00171
; LINE_WIDTH: 0.390702
G1 X121.317 Y120.432 E.00959
; LINE_WIDTH: 0.389372
G3 X121.748 Y119.29 I6.562 J1.819 E.02174
; LINE_WIDTH: 0.389962
G3 X122.445 Y118.152 I5.992 J2.89 E.0238
; LINE_WIDTH: 0.385802
G3 X127.079 Y115.494 I5.474 J4.173 E.09659
; LINE_WIDTH: 0.396372
G3 X128.394 Y115.466 I.81 J7.227 E.02387
; LINE_WIDTH: 0.391872
G1 X128.997 Y115.539 E.01088
; LINE_WIDTH: 0.391572
G1 X129.595 Y115.666 E.01092
; LINE_WIDTH: 0.389402
G1 X130.099 Y115.82 E.00938
; LINE_WIDTH: 0.386902
G1 X130.739 Y116.08 E.0122
; LINE_WIDTH: 0.391032
G3 X131.706 Y116.627 I-2.793 J6.066 E.01985
; LINE_WIDTH: 0.391922
G3 X132.582 Y117.338 I-3.853 J5.649 E.02023
; LINE_WIDTH: 0.391512
G1 X133.064 Y117.85 E.01257
; LINE_WIDTH: 0.390042
G1 X133.384 Y118.255 E.0092
; LINE_WIDTH: 0.389382
G3 X133.966 Y119.215 I-5.578 J4.04 E.01998
; LINE_WIDTH: 0.391592
G1 X134.173 Y119.676 E.00904
; LINE_WIDTH: 0.391912
G1 X134.379 Y120.252 E.01095
; LINE_WIDTH: 0.395712
G1 X134.53 Y120.83 E.0108
; LINE_WIDTH: 0.419992
G1 X134.703 Y120.961 E.00417
G1 X137.665 Y120.961 E.0571
G1 X137.665 Y122.25 E.02485
G1 X137.665 Y123.539 E.02485
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
G1 X134.762 Y123.539 E.05595
; CHANGE_LAYER
; Z_HEIGHT: 4.86947
; LAYER_HEIGHT: 0.109473
; WIPE_START
G1 F1800
M204 S10000
G1 X134.527 Y123.69 E-.10641
G1 X134.503 Y123.785 E-.0373
G1 X134.338 Y124.372 E-.23177
G1 X134.124 Y124.938 E-.22994
G1 X133.95 Y125.306 E-.15459
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 56/145
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.16 I-.49 J-1.114 P1  F30000
G1 X132.038 Y126.146 Z5.16
G1 Z4.869
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1477
G3 X123.58 Y126 I-4.163 J-3.896 E.38149
G1 X132.17 Y126 E.34384
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
G2 X133.511 Y123.106 I-4.315 J-3.757 E.12939
G1 X122.237 Y123.106 E.45124
G3 X122.549 Y120.212 I5.64 J-.856 E.11781
G1 X133.199 Y120.212 E.42627
G2 X130.736 Y117.317 I-5.319 J2.031 E.15509
G1 X125.014 Y117.317 E.22903
G3 X125.485 Y117.072 I4.049 J7.22 E.02126
; CHANGE_LAYER
; Z_HEIGHT: 4.88
; LAYER_HEIGHT: 0.0105267
; WIPE_START
G1 F7329.351
G1 X125.014 Y117.317 E-.20184
G1 X126.483 Y117.317 E-.55816
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/145
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.269 I-.643 J1.034 P1  F30000
G1 X135.148 Y122.705 Z5.269
G1 Z4.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F1477
G2 X135.152 Y121.795 I-5.725 J-.479 E.01889
G1 X136.832 Y121.795 E.03484
G1 X136.832 Y122.25 E.00943
G1 X136.832 Y122.704 E.00943
G1 X135.208 Y122.705 E.03368
G1 X134.703 Y123.129 F30000
G1 F1477
G2 X134.703 Y121.371 I-14.212 J-.879 E.03649
G1 X137.256 Y121.371 E.05296
G1 X137.256 Y122.25 E.01823
G1 X137.256 Y123.129 E.01823
G1 X134.763 Y123.129 E.05171
; WIPE_START
G1 F3600
G1 X134.742 Y122.276 E-.32415
G1 X134.703 Y121.371 E-.34438
G1 X134.943 Y121.371 E-.09147
; WIPE_END
G1 E-.04 F1800
G1 X135.62 Y122.25 Z5.28 F30000
G1 Z4.88
G1 E.8 F1800
; LINE_WIDTH: 0.511172
G1 F1477
G1 X136.377 Y122.25 E.01795
; WIPE_START
G1 F3600
G1 X135.62 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.28 I.021 J-1.217 P1  F30000
G1 X120.546 Y121.991 Z5.28
G1 Z4.88
G1 E.8 F1800
; LINE_WIDTH: 0.542522
G1 F1477
G1 X120.544 Y122.508 E.01306
G1 X119.215 Y122.508 E.03358
G1 X119.215 Y121.991 E.01306
G1 X120.486 Y121.991 E.03212
G1 X121.052 Y121.505 F30000
; LINE_WIDTH: 0.449992
G1 F1477
G2 X121.041 Y122.941 I7.608 J.776 E.02982
G1 X121.016 Y122.979 E.00094
G1 X118.744 Y122.979 E.04713
G1 X118.744 Y121.521 E.03024
G2 X120.992 Y121.507 I.767 J-55.928 E.04663
; WIPE_START
G1 F3600
G1 X121.024 Y121.763 E-.09833
G1 X121.008 Y122.38 E-.23423
G1 X121.041 Y122.941 E-.21358
G1 X121.016 Y122.979 E-.01725
G1 X120.499 Y122.979 E-.19662
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.28 I.786 J.929 P1  F30000
G1 X128.881 Y115.89 Z5.28
G1 Z4.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389622
M73 P61 R8
G1 F1477
M204 S5000
G1 X128.935 Y115.896 E.00098
; LINE_WIDTH: 0.389372
G3 X130.132 Y116.215 I-1.082 J6.458 E.02204
; LINE_WIDTH: 0.385412
G1 X130.663 Y116.442 E.01016
; LINE_WIDTH: 0.384542
G3 X132.168 Y117.449 I-3.153 J6.345 E.03185
; LINE_WIDTH: 0.386232
G3 X133.025 Y118.379 I-4.131 J4.665 E.02233
; LINE_WIDTH: 0.385772
G1 X133.352 Y118.856 E.01018
; LINE_WIDTH: 0.388112
G3 X133.908 Y119.991 I-5.329 J3.317 E.02242
; LINE_WIDTH: 0.389702
G1 X134.086 Y120.545 E.01036
; LINE_WIDTH: 0.410802
G1 X134.242 Y121.184 E.01238
; LINE_WIDTH: 0.419992
G3 X134.205 Y123.488 I-5.904 J1.058 E.0447
; LINE_WIDTH: 0.399592
G1 X134.062 Y124.049 E.01058
; LINE_WIDTH: 0.385962
G1 X133.875 Y124.596 E.01019
; LINE_WIDTH: 0.385782
G3 X133.035 Y126.108 I-6.704 J-2.738 E.03051
; LINE_WIDTH: 0.387412
G3 X132.263 Y126.967 I-5.036 J-3.745 E.02045
; LINE_WIDTH: 0.386342
G3 X131.35 Y127.675 I-4.364 J-4.688 E.02039
; LINE_WIDTH: 0.385862
G1 X130.85 Y127.965 E.01018
; LINE_WIDTH: 0.385732
G1 X130.325 Y128.208 E.01017
; LINE_WIDTH: 0.385622
G3 X129.223 Y128.55 I-2.449 J-5.956 E.02034
; LINE_WIDTH: 0.385402
G3 X127.498 Y128.681 I-1.407 J-7.092 E.03049
; LINE_WIDTH: 0.384952
G3 X126.356 Y128.51 I.378 J-6.436 E.02031
; LINE_WIDTH: 0.384842
G3 X125.262 Y128.138 I1.515 J-6.246 E.02031
; LINE_WIDTH: 0.385202
G3 X124.095 Y127.466 I2.588 J-5.844 E.02371
; LINE_WIDTH: 0.384452
G1 X123.642 Y127.106 E.01014
; LINE_WIDTH: 0.386132
G3 X122.843 Y126.273 I4.142 J-4.775 E.02038
; LINE_WIDTH: 0.385792
G3 X121.954 Y124.789 I5.725 J-4.438 E.03052
; LINE_WIDTH: 0.389942
G3 X121.555 Y123.503 I6.385 J-2.687 E.02402
; LINE_WIDTH: 0.419992
G3 X121.51 Y121.201 I5.538 J-1.259 E.04468
; LINE_WIDTH: 0.402362
G1 X121.637 Y120.637 E.01066
; LINE_WIDTH: 0.386222
G1 X121.807 Y120.084 E.01019
; LINE_WIDTH: 0.385792
G3 X122.292 Y119.035 I6.07 J2.167 E.02037
; LINE_WIDTH: 0.389962
G3 X123.028 Y118.007 I5.824 J3.395 E.02255
; LINE_WIDTH: 0.389362
G3 X127.016 Y115.866 I4.847 J4.243 E.08222
; LINE_WIDTH: 0.391122
G3 X128.366 Y115.827 I.872 J6.907 E.02417
; LINE_WIDTH: 0.389622
G1 X128.821 Y115.882 E.00815
; WIPE_START
G1 F1800
M204 S10000
G1 X128.935 Y115.896 E-.04372
G1 X129.502 Y116.017 E-.22009
G1 X130.132 Y116.215 E-.25087
G1 X130.663 Y116.442 E-.21954
G1 X130.723 Y116.474 E-.02578
; WIPE_END
G1 E-.04
G17
G3 Z5.28 I-1.06 J.597 P1  F30000
G1 X134.703 Y123.538 Z5.28
G1 Z4.88
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1477
M204 S5000
G1 X134.55 Y123.627 E.0034
; LINE_WIDTH: 0.399592
G1 X134.527 Y123.689 E.00121
; LINE_WIDTH: 0.390102
G1 X134.375 Y124.263 E.01057
; LINE_WIDTH: 0.389352
G3 X132.917 Y126.82 I-6.757 J-2.16 E.05272
; LINE_WIDTH: 0.387092
G1 X132.49 Y127.247 E.01067
; LINE_WIDTH: 0.389332
G1 X132.111 Y127.575 E.0089
; LINE_WIDTH: 0.389782
G3 X131.127 Y128.227 I-4.245 J-5.342 E.02104
; LINE_WIDTH: 0.389992
G3 X130.025 Y128.706 I-3.252 J-5.979 E.02143
; LINE_WIDTH: 0.390142
G3 X128.855 Y128.983 I-2.149 J-6.457 E.02144
; LINE_WIDTH: 0.390292
G1 X128.257 Y129.043 E.01072
; LINE_WIDTH: 0.390522
G3 X127.077 Y129.007 I-.38 J-6.811 E.02108
; LINE_WIDTH: 0.390632
G3 X125.9 Y128.761 I.798 J-6.759 E.02148
; LINE_WIDTH: 0.390752
G1 X125.334 Y128.561 E.01072
; LINE_WIDTH: 0.393142
G3 X124.245 Y128.004 I2.713 J-6.65 E.022
; LINE_WIDTH: 0.390022
G3 X122.882 Y126.873 I4.298 J-6.562 E.03162
; LINE_WIDTH: 0.389372
G3 X121.831 Y125.377 I5.688 J-5.111 E.03258
; LINE_WIDTH: 0.389952
G3 X121.34 Y124.135 I5.839 J-3.029 E.02382
; LINE_WIDTH: 0.387962
G1 X121.196 Y123.558 E.01053
; LINE_WIDTH: 0.419992
G1 X121.016 Y123.388 E.00478
G1 X118.335 Y123.388 E.05168
G1 X118.335 Y121.112 E.04387
G1 X121.016 Y121.112 E.05168
G1 X121.156 Y121.041 E.00302
; LINE_WIDTH: 0.402362
G1 X121.194 Y120.956 E.0017
; LINE_WIDTH: 0.390702
G1 X121.317 Y120.433 E.0096
; LINE_WIDTH: 0.389372
G3 X121.747 Y119.29 I6.564 J1.82 E.02173
; LINE_WIDTH: 0.389962
G3 X122.445 Y118.152 I5.994 J2.891 E.02381
; LINE_WIDTH: 0.385802
G3 X128.506 Y115.477 I5.452 J4.147 E.12174
; LINE_WIDTH: 0.386262
G1 X129.079 Y115.554 E.01019
; LINE_WIDTH: 0.389372
G1 X129.588 Y115.664 E.00925
; LINE_WIDTH: 0.390202
G1 X130.072 Y115.81 E.00902
; LINE_WIDTH: 0.390852
G3 X131.63 Y116.576 I-2.61 J7.281 E.03105
; LINE_WIDTH: 0.391842
G3 X133.004 Y117.778 I-4.689 J6.746 E.03274
; LINE_WIDTH: 0.389352
G1 X133.385 Y118.256 E.01087
; LINE_WIDTH: 0.389722
G3 X134.022 Y119.333 I-5.488 J3.976 E.0223
; LINE_WIDTH: 0.389212
G1 X134.281 Y119.955 E.01198
; LINE_WIDTH: 0.391242
G1 X134.525 Y120.808 E.01586
; LINE_WIDTH: 0.410802
G1 X134.602 Y120.929 E.00269
; LINE_WIDTH: 0.419992
G1 X134.703 Y120.961 E.00204
G1 X137.665 Y120.961 E.0571
G1 X137.665 Y122.25 E.02483
G1 X137.665 Y123.538 E.02483
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
G1 X134.763 Y123.538 E.05594
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X134.55 Y123.627 E-.08756
G1 X134.527 Y123.689 E-.0251
G1 X134.375 Y124.263 E-.22546
G1 X134.169 Y124.837 E-.232
G1 X133.958 Y125.29 E-.18988
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 58/145
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.28 I1.106 J.507 P1  F30000
G1 X135.149 Y122.694 Z5.28
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G2 X135.152 Y121.805 I-5.619 J-.467 E.01845
G1 X136.832 Y121.805 E.03483
G1 X136.832 Y122.25 E.00922
G1 X136.832 Y122.694 E.00922
G1 X135.209 Y122.694 E.03366
G1 X134.705 Y123.118 F30000
G1 F1200
G3 X134.742 Y122.276 I15.308 J.247 E.0175
G1 X134.705 Y121.381 E.01857
G1 X137.256 Y121.381 E.05291
G1 X137.256 Y122.25 E.01802
G1 X137.256 Y123.118 E.01802
G1 X134.765 Y123.118 E.05166
; WIPE_START
G1 F3600
G1 X134.742 Y122.276 E-.32032
G1 X134.705 Y121.381 E-.34026
G1 X134.967 Y121.381 E-.09942
; WIPE_END
G1 E-.04 F1800
G1 X136.387 Y122.25 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.490292
G1 F1200
G1 X135.61 Y122.25 E.01765
; WIPE_START
G1 F3600
G1 X136.387 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.019 J-1.217 P1  F30000
G1 X120.549 Y121.997 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.530922
G1 F1200
G1 X120.552 Y122.502 E.01248
G1 X119.209 Y122.502 E.03316
G1 X119.209 Y121.997 E.01248
G1 X120.489 Y121.997 E.03163
G1 X121.044 Y121.531 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X121.051 Y122.984 I9.379 J.682 E.03017
G1 X121.014 Y122.967 E.00085
G1 X118.744 Y122.967 E.04708
G1 X118.744 Y121.532 E.02975
G2 X120.984 Y121.531 I.84 J-497.727 E.04646
; WIPE_START
G1 F3600
G1 X121.008 Y122.228 E-.26503
G1 X121.051 Y122.984 E-.28773
G1 X121.014 Y122.967 E-.01554
G1 X120.509 Y122.967 E-.19169
; WIPE_END
G1 E-.04 F1800
G1 X126.335 Y118.036 Z5.4 F30000
G1 X128.861 Y115.897 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389632
G1 F1200
M204 S5000
G1 X129.204 Y115.946 E.00616
; LINE_WIDTH: 0.386262
G1 X129.766 Y116.092 E.01023
; LINE_WIDTH: 0.386132
G3 X130.836 Y116.527 I-1.823 J6.007 E.02038
; LINE_WIDTH: 0.387532
G1 X131.404 Y116.859 E.01164
; LINE_WIDTH: 0.389752
G1 X131.895 Y117.217 E.01082
; LINE_WIDTH: 0.391292
G1 X132.403 Y117.674 E.01221
G1 X132.975 Y118.314 E.01534
; LINE_WIDTH: 0.385792
G1 X133.351 Y118.855 E.0116
; LINE_WIDTH: 0.391402
G3 X133.937 Y120.069 I-6.381 J3.829 E.02414
; LINE_WIDTH: 0.384852
G1 X134.108 Y120.621 E.01014
; LINE_WIDTH: 0.410072
G1 X134.241 Y121.184 E.01087
; LINE_WIDTH: 0.419992
G3 X134.204 Y123.488 I-5.871 J1.057 E.0447
; LINE_WIDTH: 0.398102
G1 X134.062 Y124.049 E.01053
; LINE_WIDTH: 0.389962
G3 X133.59 Y125.222 I-6.473 J-1.922 E.02255
; LINE_WIDTH: 0.389372
G3 X132.537 Y126.696 I-6.365 J-3.431 E.03229
; LINE_WIDTH: 0.385442
G3 X131.603 Y127.503 I-4.678 J-4.47 E.02174
; LINE_WIDTH: 0.386402
G3 X130.503 Y128.132 I-3.691 J-5.175 E.02238
; LINE_WIDTH: 0.391062
G3 X129.365 Y128.515 I-2.829 J-6.529 E.02147
; LINE_WIDTH: 0.390212
G3 X128.239 Y128.679 I-1.489 J-6.27 E.02031
; LINE_WIDTH: 0.390532
G3 X126.565 Y128.554 I-.297 J-7.292 E.03
; LINE_WIDTH: 0.390692
G3 X125.477 Y128.226 I1.311 J-6.304 E.02029
; LINE_WIDTH: 0.392252
G3 X124.446 Y127.698 I2.617 J-6.39 E.02079
; LINE_WIDTH: 0.391542
G1 X124.016 Y127.407 E.00928
; LINE_WIDTH: 0.389352
G1 X123.569 Y127.04 E.01028
; LINE_WIDTH: 0.389732
G3 X122.155 Y125.212 I4.341 J-4.818 E.04135
; LINE_WIDTH: 0.391672
G1 X121.917 Y124.688 E.01031
; LINE_WIDTH: 0.391832
G3 X121.546 Y123.447 I6.275 J-2.547 E.02321
; LINE_WIDTH: 0.419992
G3 X121.541 Y121.069 I5.379 J-1.201 E.04619
; LINE_WIDTH: 0.391132
G1 X121.667 Y120.532 E.00986
; LINE_WIDTH: 0.389402
G3 X122.348 Y118.942 I6.946 J2.034 E.03084
; LINE_WIDTH: 0.391112
G1 X122.669 Y118.461 E.01032
; LINE_WIDTH: 0.392182
G3 X123.425 Y117.596 I5.582 J4.114 E.02062
; LINE_WIDTH: 0.390852
G1 X123.631 Y117.404 E.00502
; LINE_WIDTH: 0.385062
G1 X124.147 Y116.996 E.01155
; LINE_WIDTH: 0.385802
G3 X125.247 Y116.367 I3.69 J5.176 E.02235
; LINE_WIDTH: 0.388202
G1 X125.89 Y116.12 E.01221
; LINE_WIDTH: 0.389642
G3 X127.016 Y115.866 I2.049 J6.458 E.02056
; LINE_WIDTH: 0.391072
G3 X128.367 Y115.828 I.872 J6.893 E.02419
; LINE_WIDTH: 0.389632
G1 X128.802 Y115.889 E.00781
; WIPE_START
G1 F1800
M204 S10000
G1 X129.204 Y115.946 E-.15448
G1 X129.766 Y116.092 E-.22055
G1 X130.311 Y116.285 E-.21961
G1 X130.706 Y116.468 E-.16536
; WIPE_END
G1 E-.04
G1 X134.468 Y123.109 Z5.4 F30000
G1 X134.705 Y123.528 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X134.55 Y123.622 E.00349
; LINE_WIDTH: 0.398102
G1 X134.529 Y123.679 E.00111
; LINE_WIDTH: 0.389962
G3 X134.122 Y124.943 I-6.579 J-1.421 E.02369
; LINE_WIDTH: 0.385772
G3 X133.543 Y126.011 I-6.262 J-2.701 E.0214
; LINE_WIDTH: 0.389362
G1 X133.253 Y126.419 E.0089
; LINE_WIDTH: 0.390182
G1 X132.931 Y126.803 E.00893
; LINE_WIDTH: 0.390862
G1 X132.572 Y127.172 E.0092
; LINE_WIDTH: 0.391852
G3 X131.642 Y127.916 I-4.759 J-5.003 E.02134
; LINE_WIDTH: 0.391342
G1 X131.127 Y128.227 E.01075
; LINE_WIDTH: 0.388832
G1 X130.586 Y128.491 E.01069
; LINE_WIDTH: 0.391062
G3 X129.445 Y128.87 I-2.772 J-6.439 E.0215
; LINE_WIDTH: 0.390212
G3 X128.255 Y129.043 I-1.57 J-6.624 E.02146
; LINE_WIDTH: 0.390532
G3 X126.485 Y128.91 I-.312 J-7.686 E.03174
; LINE_WIDTH: 0.390692
G3 X125.335 Y128.562 I1.389 J-6.655 E.02146
; LINE_WIDTH: 0.392252
G3 X124.242 Y128.002 I2.619 J-6.461 E.02203
; LINE_WIDTH: 0.391542
G1 X123.787 Y127.69 E.00988
; LINE_WIDTH: 0.389352
G1 X123.316 Y127.301 E.01086
; LINE_WIDTH: 0.389732
G3 X122.467 Y126.379 I4.559 J-5.048 E.02235
; LINE_WIDTH: 0.387532
G1 X122.077 Y125.807 E.01223
; LINE_WIDTH: 0.385822
G3 X121.495 Y124.605 I5.67 J-3.486 E.02356
; LINE_WIDTH: 0.385052
G1 X121.294 Y123.956 E.01194
; LINE_WIDTH: 0.400802
G1 X121.167 Y123.465 E.00928
; LINE_WIDTH: 0.419992
G1 X121.014 Y123.376 E.00342
G1 X118.335 Y123.376 E.05164
G1 X118.335 Y121.123 E.04343
G1 X121.014 Y121.123 E.05164
G1 X121.187 Y120.984 E.00428
; LINE_WIDTH: 0.391132
G1 X121.203 Y120.912 E.00132
; LINE_WIDTH: 0.387402
G1 X121.352 Y120.321 E.01077
; LINE_WIDTH: 0.385792
G3 X122.097 Y118.66 I7.316 J2.283 E.03213
; LINE_WIDTH: 0.391112
G1 X122.376 Y118.243 E.00896
; LINE_WIDTH: 0.392182
G3 X123.179 Y117.326 I5.619 J4.11 E.02187
; LINE_WIDTH: 0.391872
G3 X124.134 Y116.567 I4.742 J4.985 E.02187
; LINE_WIDTH: 0.391682
G1 X124.658 Y116.253 E.01092
; LINE_WIDTH: 0.389752
G3 X125.813 Y115.765 I3.211 J5.988 E.02235
; LINE_WIDTH: 0.387512
G1 X126.481 Y115.591 E.01222
; LINE_WIDTH: 0.385802
G3 X127.781 Y115.452 I1.334 J6.294 E.02305
; LINE_WIDTH: 0.389632
G1 X128.394 Y115.465 E.01091
; LINE_WIDTH: 0.392962
G3 X129.396 Y115.617 I-.659 J7.709 E.01821
; LINE_WIDTH: 0.390072
G3 X130.556 Y115.995 I-1.606 J6.894 E.02176
; LINE_WIDTH: 0.389642
G3 X131.633 Y116.576 I-2.726 J6.341 E.0218
; LINE_WIDTH: 0.388182
G1 X132.217 Y117.015 E.01293
; LINE_WIDTH: 0.391292
G1 X132.66 Y117.414 E.01067
; LINE_WIDTH: 0.392202
G3 X133.384 Y118.257 I-4.8 J4.855 E.01992
; LINE_WIDTH: 0.391102
G1 X133.72 Y118.766 E.01091
; LINE_WIDTH: 0.391402
G3 X134.173 Y119.676 I-6.234 J3.673 E.01817
; LINE_WIDTH: 0.390862
G1 X134.379 Y120.252 E.01093
; LINE_WIDTH: 0.391362
G1 X134.528 Y120.821 E.01051
; LINE_WIDTH: 0.410072
G1 X134.601 Y120.936 E.00256
; LINE_WIDTH: 0.419992
G1 X134.705 Y120.972 E.00212
G1 X137.665 Y120.972 E.05706
G1 X137.665 Y122.25 E.02463
G1 X137.665 Y123.528 E.02463
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
G1 X134.765 Y123.528 E.0559
; CHANGE_LAYER
; Z_HEIGHT: 5.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X134.55 Y123.622 E-.08914
G1 X134.529 Y123.679 E-.02311
G1 X134.375 Y124.263 E-.22957
G1 X134.122 Y124.943 E-.27584
G1 X133.958 Y125.28 E-.14234
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 59/145
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.4 I1.106 J.507 P1  F30000
G1 X135.153 Y122.674 Z5.4
G1 Z5.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G2 X135.153 Y121.826 I-5.789 J-.424 E.01761
G1 X136.832 Y121.826 E.03481
G1 X136.832 Y122.25 E.0088
G1 X136.832 Y122.674 E.0088
G1 X135.213 Y122.674 E.03356
G1 X134.691 Y123.078 F30000
G1 F1200
G2 X134.71 Y121.401 I-9.691 J-.946 E.03483
G1 X137.256 Y121.401 E.05281
G1 X137.256 Y122.25 E.0176
G1 X137.256 Y123.098 E.0176
G1 X135.256 Y123.098 E.04148
G3 X134.751 Y123.082 I-.024 J-7.377 E.01048
; WIPE_START
G1 F3600
G1 X134.738 Y122.531 E-.2097
G1 X134.735 Y121.914 E-.23422
G1 X134.71 Y121.401 E-.19517
G1 X135.028 Y121.401 E-.1209
; WIPE_END
G1 E-.04 F1800
G1 X135.586 Y122.25 Z5.52 F30000
G1 Z5.12
G1 E.8 F1800
; LINE_WIDTH: 0.449712
G1 F1200
G1 X136.407 Y122.25 E.01702
; WIPE_START
G1 F3600
G1 X135.586 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.52 I.02 J-1.217 P1  F30000
G1 X120.563 Y122.008 Z5.52
G1 Z5.12
G1 E.8 F1800
; LINE_WIDTH: 0.508272
G1 F1200
G1 X120.56 Y122.491 E.01138
G1 X119.198 Y122.491 E.03214
G1 X119.198 Y122.008 E.01138
G1 X120.503 Y122.008 E.03079
G1 X121.048 Y121.536 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X121.039 Y122.912 I7.641 J.738 E.02859
G1 X121.009 Y122.944 E.00092
G1 X118.744 Y122.944 E.04698
G1 X118.744 Y121.555 E.02881
G2 X120.988 Y121.538 I.784 J-43.962 E.04656
; WIPE_START
G1 F3600
G1 X121.024 Y121.763 E-.08673
G1 X121.008 Y122.38 E-.23422
G1 X121.039 Y122.912 E-.20274
G1 X121.009 Y122.944 E-.01686
G1 X120.432 Y122.944 E-.21945
; WIPE_END
G1 E-.04 F1800
G1 X126.278 Y118.038 Z5.52 F30000
G1 X128.843 Y115.887 Z5.52
M73 P62 R8
G1 Z5.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.385812
G1 F1200
M204 S5000
G1 X129.393 Y115.988 E.00985
; LINE_WIDTH: 0.387312
G3 X130.488 Y116.361 I-1.457 J6.085 E.02048
; LINE_WIDTH: 0.387112
G3 X131.497 Y116.922 I-2.549 J5.777 E.02043
; LINE_WIDTH: 0.386562
G3 X132.39 Y117.655 I-3.539 J5.219 E.02041
; LINE_WIDTH: 0.385542
G3 X133.202 Y118.628 I-4.41 J4.505 E.02234
; LINE_WIDTH: 0.385292
G1 X133.543 Y119.189 E.01153
; LINE_WIDTH: 0.386172
G3 X134 Y120.251 I-5.493 J2.992 E.0204
; LINE_WIDTH: 0.386032
G1 X134.155 Y120.808 E.01018
; LINE_WIDTH: 0.419992
G3 X134.177 Y123.58 I-5.833 J1.434 E.05392
; LINE_WIDTH: 0.390002
G1 X134.029 Y124.153 E.01055
; LINE_WIDTH: 0.389362
G1 X133.833 Y124.697 E.01028
; LINE_WIDTH: 0.391712
G3 X133.3 Y125.718 I-6.534 J-2.764 E.02063
; LINE_WIDTH: 0.391852
G1 X132.966 Y126.19 E.01034
G1 X132.402 Y126.834 E.01533
; LINE_WIDTH: 0.386132
G1 X131.973 Y127.221 E.01018
; LINE_WIDTH: 0.386312
G3 X131.02 Y127.873 I-4.08 J-4.943 E.02039
; LINE_WIDTH: 0.386492
G1 X130.503 Y128.132 E.0102
; LINE_WIDTH: 0.386632
G1 X129.965 Y128.344 E.01021
; LINE_WIDTH: 0.386752
G1 X129.41 Y128.507 E.0102
; LINE_WIDTH: 0.386912
G1 X128.843 Y128.62 E.0102
; LINE_WIDTH: 0.387062
G1 X128.268 Y128.681 E.01021
; LINE_WIDTH: 0.387862
G1 X127.692 Y128.691 E.01021
; LINE_WIDTH: 0.388022
G1 X127.123 Y128.649 E.01011
; LINE_WIDTH: 0.388202
G1 X126.56 Y128.557 E.0101
; LINE_WIDTH: 0.388372
G1 X126.008 Y128.416 E.0101
; LINE_WIDTH: 0.388552
G3 X124.927 Y127.979 I1.906 J-6.266 E.02071
; LINE_WIDTH: 0.388212
G1 X124.432 Y127.696 E.01011
; LINE_WIDTH: 0.389382
G1 X124.008 Y127.401 E.00919
; LINE_WIDTH: 0.391702
G3 X123.088 Y126.556 I4.24 J-5.535 E.02238
; LINE_WIDTH: 0.390742
G1 X122.612 Y125.965 E.01354
; LINE_WIDTH: 0.385042
G1 X122.262 Y125.41 E.01151
; LINE_WIDTH: 0.385812
G1 X121.955 Y124.791 E.01218
; LINE_WIDTH: 0.389952
G3 X121.555 Y123.503 I6.356 J-2.679 E.02405
; LINE_WIDTH: 0.419992
G3 X121.511 Y121.202 I5.468 J-1.255 E.04469
; LINE_WIDTH: 0.399612
G1 X121.637 Y120.637 E.01058
; LINE_WIDTH: 0.386042
G1 X121.807 Y120.084 E.01019
; LINE_WIDTH: 0.385792
G3 X122.955 Y118.09 I6.068 J2.166 E.04072
; LINE_WIDTH: 0.387452
G1 X123.403 Y117.612 E.01158
; LINE_WIDTH: 0.389762
G3 X123.926 Y117.159 I9.47 J10.408 E.01232
; LINE_WIDTH: 0.386392
G1 X124.399 Y116.825 E.01022
; LINE_WIDTH: 0.386262
G3 X127.098 Y115.854 I3.567 J5.678 E.05094
G1 X128.054 Y115.812 E.01687
; LINE_WIDTH: 0.385062
G1 X128.713 Y115.863 E.0116
; LINE_WIDTH: 0.385812
G1 X128.783 Y115.876 E.00127
; WIPE_START
G1 F1800
M204 S10000
G1 X129.393 Y115.988 E-.23537
G1 X129.95 Y116.149 E-.22037
G1 X130.488 Y116.361 E-.21979
G1 X130.687 Y116.46 E-.08447
; WIPE_END
G1 E-.04
G1 X134.47 Y123.089 Z5.52 F30000
G1 X134.709 Y123.507 Z5.52
G1 Z5.12
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X134.533 Y123.658 E.00448
; LINE_WIDTH: 0.390002
G1 X134.502 Y123.784 E.00231
; LINE_WIDTH: 0.385852
G3 X134.124 Y124.938 I-6.663 J-1.546 E.02141
; LINE_WIDTH: 0.391712
G3 X133.605 Y125.919 I-6.169 J-2.637 E.01989
; LINE_WIDTH: 0.391852
G3 X132.929 Y126.804 I-5.791 J-3.718 E.01994
; LINE_WIDTH: 0.390092
G1 X132.572 Y127.173 E.00915
; LINE_WIDTH: 0.389362
G3 X131.642 Y127.917 I-4.721 J-4.951 E.02119
; LINE_WIDTH: 0.388872
G1 X131.126 Y128.228 E.0107
; LINE_WIDTH: 0.388742
G1 X130.585 Y128.492 E.01069
; LINE_WIDTH: 0.388592
G1 X130.023 Y128.707 E.01068
; LINE_WIDTH: 0.388422
G1 X129.444 Y128.872 E.01068
; LINE_WIDTH: 0.388242
G1 X128.852 Y128.984 E.01067
; LINE_WIDTH: 0.388082
G1 X128.253 Y129.045 E.01066
; LINE_WIDTH: 0.387912
G1 X127.648 Y129.05 E.01073
; LINE_WIDTH: 0.387112
G1 X127.039 Y129.002 E.01078
; LINE_WIDTH: 0.386982
G1 X126.437 Y128.9 E.01079
; LINE_WIDTH: 0.386822
G1 X125.848 Y128.744 E.01077
; LINE_WIDTH: 0.386692
G3 X123.694 Y127.615 I2.032 J-6.495 E.04314
; LINE_WIDTH: 0.385802
G1 X123.173 Y127.161 E.01217
; LINE_WIDTH: 0.390742
G1 X122.815 Y126.798 E.0091
; LINE_WIDTH: 0.390872
G1 X122.488 Y126.406 E.00912
; LINE_WIDTH: 0.391832
G3 X121.832 Y125.376 I5.449 J-4.192 E.02188
; LINE_WIDTH: 0.391722
G1 X121.576 Y124.823 E.01091
; LINE_WIDTH: 0.389952
G3 X121.186 Y123.507 I7.151 J-2.836 E.02448
; LINE_WIDTH: 0.419992
G1 X121.009 Y123.354 E.00451
G1 X118.335 Y123.354 E.05154
G1 X118.335 Y121.146 E.04255
G1 X121.01 Y121.146 E.05156
G1 X121.16 Y121.061 E.00332
; LINE_WIDTH: 0.399612
G1 X121.187 Y120.99 E.00139
; LINE_WIDTH: 0.390252
G1 X121.317 Y120.432 E.01021
; LINE_WIDTH: 0.389372
G3 X122.375 Y118.243 I6.56 J1.819 E.04346
; LINE_WIDTH: 0.389652
G3 X123.178 Y117.325 I5.585 J4.077 E.02173
; LINE_WIDTH: 0.388262
G1 X123.731 Y116.855 E.01286
; LINE_WIDTH: 0.385782
G3 X127.079 Y115.494 I4.147 J5.4 E.0644
; LINE_WIDTH: 0.396372
G3 X128.394 Y115.466 I.81 J7.234 E.02387
; LINE_WIDTH: 0.391782
G3 X129.595 Y115.666 I-.535 J6.925 E.02181
; LINE_WIDTH: 0.389392
G1 X130.096 Y115.818 E.0093
; LINE_WIDTH: 0.387192
G3 X131.72 Y116.638 I-2.648 J7.262 E.03224
; LINE_WIDTH: 0.389372
G1 X132.124 Y116.935 E.00891
; LINE_WIDTH: 0.390152
G3 X132.939 Y117.706 I-4.404 J5.469 E.02002
; LINE_WIDTH: 0.392232
G3 X133.613 Y118.594 I-5.164 J4.619 E.01999
; LINE_WIDTH: 0.391002
G1 X133.966 Y119.218 E.01281
; LINE_WIDTH: 0.390132
G1 X134.174 Y119.675 E.00895
; LINE_WIDTH: 0.389362
G1 X134.38 Y120.252 E.01088
; LINE_WIDTH: 0.392492
G1 X134.538 Y120.858 E.01124
; LINE_WIDTH: 0.419992
G1 X134.71 Y120.992 E.0042
G1 X137.665 Y120.992 E.05697
G1 X137.665 Y122.25 E.02424
G1 X137.665 Y123.507 E.02424
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
G1 X134.769 Y123.507 E.05582
; CHANGE_LAYER
; Z_HEIGHT: 5.14105
; LAYER_HEIGHT: 0.0210528
; WIPE_START
G1 F1800
M204 S10000
G1 X134.533 Y123.658 E-.10659
G1 X134.502 Y123.784 E-.04918
G1 X134.338 Y124.372 E-.23195
G1 X134.124 Y124.938 E-.22996
G1 X133.964 Y125.277 E-.14233
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 60/145
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.52 I-.501 J-1.109 P1  F30000
G1 X132.038 Y126.146 Z5.52
G1 Z5.141
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1467
G3 X123.58 Y126 I-4.163 J-3.897 E.38149
G1 X132.17 Y126 E.34384
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
G2 X133.511 Y123.106 I-4.282 J-3.742 E.12941
G1 X122.237 Y123.106 E.45124
G3 X122.549 Y120.212 I5.639 J-.856 E.11782
G1 X133.199 Y120.212 E.42626
G2 X130.736 Y117.317 I-5.345 J2.054 E.15505
G1 X125.014 Y117.317 E.22903
G3 X125.485 Y117.072 I2.864 J4.938 E.02127
; CHANGE_LAYER
; Z_HEIGHT: 5.24
; LAYER_HEIGHT: 0.098947
; WIPE_START
G1 F7329.351
G1 X125.014 Y117.317 E-.20185
G1 X126.483 Y117.317 E-.55816
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/145
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.541 I-.637 J1.037 P1  F30000
G1 X135.154 Y122.643 Z5.541
G1 Z5.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F1467
G1 X135.152 Y121.856 E.01633
G1 X136.832 Y121.856 E.03484
G1 X136.832 Y122.25 E.00816
G1 X136.832 Y122.643 E.00816
G1 X135.214 Y122.643 E.03356
G1 X134.684 Y123.083 F30000
G1 F1467
G2 X134.69 Y121.415 I-6.871 J-.856 E.03467
G1 X134.716 Y121.432 E.00064
G1 X137.256 Y121.432 E.05269
G1 X137.256 Y122.25 E.01696
G1 X137.256 Y123.067 E.01696
G2 X134.744 Y123.081 I-.846 J73.946 E.0521
; WIPE_START
G1 F3600
G1 X134.726 Y122.736 E-.13138
G1 X134.742 Y122.12 E-.23423
G1 X134.69 Y121.415 E-.26841
G1 X134.716 Y121.432 E-.0117
G1 X135.016 Y121.432 E-.11428
; WIPE_END
G1 E-.04 F1800
G1 X136.438 Y122.25 Z5.64 F30000
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.388532
G1 F1467
G1 X135.559 Y122.25 E.01559
; WIPE_START
G1 F3600
G1 X136.438 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.64 I.017 J-1.217 P1  F30000
G1 X120.576 Y122.026 Z5.64
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.474032
G1 F1467
G1 X120.576 Y122.474 E.00983
G1 X119.18 Y122.474 E.03058
G1 X119.18 Y122.026 E.00982
G1 X120.516 Y122.026 E.02927
G1 X121.045 Y121.578 F30000
; LINE_WIDTH: 0.449992
G1 F1467
G2 X121.045 Y122.921 I9.503 J.672 E.02788
G1 X118.744 Y122.91 E.04772
G1 X118.744 Y121.589 E.0274
G2 X120.985 Y121.579 I.803 J-71.791 E.04648
; WIPE_START
G1 F3600
G1 X121.012 Y122.25 E-.25492
G1 X121.045 Y122.921 E-.25547
G1 X120.388 Y122.918 E-.24961
; WIPE_END
G1 E-.04 F1800
G1 X126.255 Y118.036 Z5.64 F30000
G1 X128.835 Y115.888 Z5.64
G1 Z5.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392922
G1 F1467
M204 S5000
G1 X128.932 Y115.901 E.00176
G3 X129.496 Y116.018 I-1.268 J7.54 E.01034
; LINE_WIDTH: 0.390862
G1 X130.311 Y116.285 E.0153
; LINE_WIDTH: 0.386142
G1 X130.835 Y116.528 E.01019
; LINE_WIDTH: 0.387562
G1 X131.399 Y116.856 E.01154
; LINE_WIDTH: 0.389782
G3 X132.39 Y117.654 I-3.779 J5.707 E.02269
; LINE_WIDTH: 0.385492
G1 X132.784 Y118.078 E.01017
; LINE_WIDTH: 0.384542
G1 X133.138 Y118.535 E.01014
; LINE_WIDTH: 0.385022
G1 X133.486 Y119.086 E.01146
; LINE_WIDTH: 0.387322
G1 X133.796 Y119.708 E.01228
; LINE_WIDTH: 0.391432
G3 X134.185 Y120.949 I-7.137 J2.918 E.02328
; LINE_WIDTH: 0.419992
G3 X134.219 Y123.412 I-5.601 J1.31 E.04785
; LINE_WIDTH: 0.402042
G1 X134.062 Y124.047 E.01204
; LINE_WIDTH: 0.385762
G3 X133.36 Y125.63 I-6.916 J-2.121 E.03054
; LINE_WIDTH: 0.387402
G3 X132.539 Y126.695 I-5.508 J-3.394 E.02383
; LINE_WIDTH: 0.387032
G1 X132.12 Y127.096 E.01024
; LINE_WIDTH: 0.386372
G3 X131.086 Y127.834 I-4.165 J-4.746 E.02244
; LINE_WIDTH: 0.385152
G1 X130.504 Y128.131 E.01148
; LINE_WIDTH: 0.384682
G3 X127.114 Y128.647 I-2.629 J-5.881 E.0609
; LINE_WIDTH: 0.384812
G1 X126.543 Y128.553 E.01016
; LINE_WIDTH: 0.385412
G3 X124.414 Y127.682 I1.317 J-6.258 E.04067
; LINE_WIDTH: 0.384542
G1 X123.941 Y127.351 E.01014
; LINE_WIDTH: 0.385312
G1 X123.415 Y126.898 E.01219
; LINE_WIDTH: 0.385792
G3 X122.611 Y125.965 I4.388 J-4.593 E.02171
; LINE_WIDTH: 0.387402
G3 X121.954 Y124.791 I5.288 J-3.732 E.02383
; LINE_WIDTH: 0.387042
G3 X121.595 Y123.691 I6.007 J-2.57 E.02047
; LINE_WIDTH: 0.412452
G1 X121.479 Y123.125 E.01093
; LINE_WIDTH: 0.419992
G3 X121.476 Y121.392 I6.723 J-.876 E.0335
; LINE_WIDTH: 0.412652
G1 X121.593 Y120.824 E.01097
; LINE_WIDTH: 0.384892
G1 X121.746 Y120.267 E.01014
; LINE_WIDTH: 0.385312
G3 X122.255 Y119.101 I6.161 J1.998 E.0224
; LINE_WIDTH: 0.385792
G3 X122.955 Y118.09 I5.556 J3.098 E.02169
; LINE_WIDTH: 0.387402
G1 X123.401 Y117.614 E.01153
; LINE_WIDTH: 0.389762
G3 X124.331 Y116.871 I4.655 J4.875 E.02121
; LINE_WIDTH: 0.389362
G3 X126.447 Y115.969 I3.544 J5.379 E.04111
G1 X127.016 Y115.866 E.01028
; LINE_WIDTH: 0.390972
G3 X128.366 Y115.828 I.87 J6.852 E.02417
; LINE_WIDTH: 0.392922
G1 X128.775 Y115.881 E.0074
; WIPE_START
G1 F1800
M204 S10000
G1 X128.932 Y115.901 E-.06
G1 X129.496 Y116.018 E-.21889
G1 X130.311 Y116.285 E-.32575
G1 X130.681 Y116.457 E-.15536
; WIPE_END
G1 E-.04
G1 X134.484 Y123.075 Z5.64 F30000
G1 X134.715 Y123.477 Z5.64
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1467
M204 S5000
G1 X134.567 Y123.558 E.00326
; LINE_WIDTH: 0.402042
G1 X134.539 Y123.628 E.0014
; LINE_WIDTH: 0.390812
G1 X134.375 Y124.263 E.01171
; LINE_WIDTH: 0.389352
G3 X133.911 Y125.391 I-6.497 J-2.013 E.0217
; LINE_WIDTH: 0.389652
G3 X133.254 Y126.419 I-6.11 J-3.186 E.02173
; LINE_WIDTH: 0.388242
G1 X132.778 Y126.968 E.01289
; LINE_WIDTH: 0.387212
G1 X132.339 Y127.383 E.01067
; LINE_WIDTH: 0.389362
G1 X131.95 Y127.699 E.0089
; LINE_WIDTH: 0.392032
G3 X130.947 Y128.32 I-4.175 J-5.625 E.02116
; LINE_WIDTH: 0.391882
G1 X130.398 Y128.569 E.01078
; LINE_WIDTH: 0.390742
G3 X129.246 Y128.914 I-2.524 J-6.322 E.02149
; LINE_WIDTH: 0.390642
G3 X127.45 Y129.04 I-1.431 J-7.515 E.0322
; LINE_WIDTH: 0.390472
G3 X126.26 Y128.859 I.426 J-6.795 E.02148
; LINE_WIDTH: 0.390352
G1 X125.713 Y128.702 E.01014
; LINE_WIDTH: 0.390032
G3 X124.61 Y128.22 I2.153 J-6.432 E.02147
; LINE_WIDTH: 0.390802
G1 X123.95 Y127.807 E.0139
; LINE_WIDTH: 0.392242
G3 X123.022 Y127.018 I4.031 J-5.681 E.02184
; LINE_WIDTH: 0.391022
G1 X122.614 Y126.565 E.0109
; LINE_WIDTH: 0.389652
G3 X121.927 Y125.557 I5.334 J-4.368 E.02173
; LINE_WIDTH: 0.388262
G1 X121.609 Y124.903 E.01288
; LINE_WIDTH: 0.387222
G1 X121.399 Y124.331 E.01077
; LINE_WIDTH: 0.391322
G1 X121.182 Y123.478 E.01573
; LINE_WIDTH: 0.412452
G1 X121.114 Y123.358 E.0026
; LINE_WIDTH: 0.419992
G1 X121.003 Y123.319 E.00227
G1 X118.335 Y123.319 E.05143
G1 X118.335 Y121.18 E.04123
G1 X120.335 Y121.18 E.03855
G2 X121.1 Y121.151 I.149 J-6.084 E.01476
; LINE_WIDTH: 0.412652
G1 X121.181 Y121.024 E.00285
; LINE_WIDTH: 0.391472
G1 X121.318 Y120.432 E.01086
; LINE_WIDTH: 0.392252
G3 X121.748 Y119.29 I6.741 J1.886 E.02189
; LINE_WIDTH: 0.391002
G3 X122.375 Y118.243 I6.243 J3.024 E.02183
; LINE_WIDTH: 0.389652
G3 X123.178 Y117.325 I5.58 J4.073 E.02172
; LINE_WIDTH: 0.388302
G1 X123.731 Y116.855 E.01286
; LINE_WIDTH: 0.385792
G3 X128.501 Y115.476 I4.178 J5.512 E.08941
; LINE_WIDTH: 0.392922
G3 X129.595 Y115.666 I-.635 J6.878 E.01995
; LINE_WIDTH: 0.390862
G1 X130.079 Y115.813 E.00903
; LINE_WIDTH: 0.390122
G1 X130.556 Y115.996 E.00911
; LINE_WIDTH: 0.390722
G3 X131.63 Y116.574 I-2.896 J6.66 E.02178
; LINE_WIDTH: 0.389782
G1 X132.124 Y116.935 E.01089
; LINE_WIDTH: 0.390152
G1 X132.507 Y117.266 E.00902
; LINE_WIDTH: 0.390852
G3 X133.263 Y118.094 I-4.597 J4.955 E.02005
; LINE_WIDTH: 0.391802
G3 X134.143 Y119.603 I-6.273 J4.672 E.03132
; LINE_WIDTH: 0.387112
G1 X134.409 Y120.359 E.01416
; LINE_WIDTH: 0.389182
G1 X134.539 Y120.866 E.0093
; LINE_WIDTH: 0.419992
G1 X134.716 Y121.023 E.00456
G1 X137.665 Y121.023 E.05685
G1 X137.665 Y122.25 E.02365
G1 X137.665 Y123.477 E.02365
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
G1 X134.775 Y123.477 E.0557
; CHANGE_LAYER
; Z_HEIGHT: 5.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X134.567 Y123.558 E-.08493
G1 X134.539 Y123.628 E-.02883
G1 X134.375 Y124.263 E-.24928
G1 X134.168 Y124.838 E-.23186
G1 X133.985 Y125.232 E-.1651
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 62/145
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 15
G17
M73 P63 R8
G3 Z5.64 I1.106 J.508 P1  F30000
G1 X135.227 Y122.532 Z5.64
G1 Z5.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.589802
G1 F1200
G1 X135.228 Y121.968 E.01556
G1 X136.762 Y121.968 E.04228
G1 X136.762 Y122.25 E.00778
G1 X136.762 Y122.532 E.00778
G1 X135.287 Y122.532 E.04067
G1 X134.689 Y123.046 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X134.695 Y121.453 I-6.984 J-.825 E.03311
G1 X134.724 Y121.473 E.00073
G1 X137.256 Y121.474 E.05251
G1 X137.256 Y122.25 E.0161
G1 X137.256 Y123.026 E.0161
G2 X134.749 Y123.044 I-.867 J53.283 E.052
; WIPE_START
G1 F3600
G1 X134.726 Y122.736 E-.11734
G1 X134.742 Y122.12 E-.23423
G1 X134.695 Y121.453 E-.25407
G1 X134.724 Y121.473 E-.01344
G1 X135.095 Y121.473 E-.14091
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.76 I-.048 J-1.216 P1  F30000
G1 X120.599 Y122.049 Z5.76
G1 Z5.36
G1 E.8 F1800
; LINE_WIDTH: 0.427232
G1 F1200
G1 X120.599 Y122.45 E.00788
G1 X119.157 Y122.45 E.02831
G1 X119.157 Y122.049 E.00788
G1 X120.539 Y122.049 E.02713
G1 X121.041 Y121.621 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X121.041 Y122.878 I9.184 J.629 E.0261
G1 X120.995 Y122.863 E.00099
G1 X118.744 Y122.863 E.04669
G1 X118.744 Y121.636 E.02546
G2 X120.981 Y121.623 I.828 J-48.902 E.0464
; WIPE_START
G1 F3600
G1 X121.012 Y122.25 E-.23852
G1 X121.041 Y122.878 E-.2391
G1 X120.995 Y122.863 E-.01821
G1 X120.3 Y122.863 E-.26417
; WIPE_END
G1 E-.04 F1800
G1 X126.205 Y118.028 Z5.76 F30000
G1 X128.821 Y115.886 Z5.76
G1 Z5.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.391812
G1 F1200
M204 S5000
G1 X128.926 Y115.898 E.0019
G3 X129.491 Y116.014 I-1.11 J6.847 E.01033
; LINE_WIDTH: 0.389392
G1 X130.411 Y116.328 E.01728
G3 X131.894 Y117.216 I-2.948 J6.609 E.0308
; LINE_WIDTH: 0.391402
G3 X132.907 Y118.227 I-4.542 J5.562 E.02563
; LINE_WIDTH: 0.384522
G3 X133.796 Y119.71 I-5.726 J4.438 E.0304
; LINE_WIDTH: 0.385832
G1 X134.056 Y120.433 E.01352
; LINE_WIDTH: 0.388302
G1 X134.195 Y120.994 E.01026
; LINE_WIDTH: 0.419992
G3 X134.216 Y123.415 I-5.513 J1.258 E.04702
; LINE_WIDTH: 0.396652
G1 X134.062 Y124.048 E.01182
; LINE_WIDTH: 0.386982
G1 X133.804 Y124.772 E.01358
; LINE_WIDTH: 0.387092
G3 X133.257 Y125.792 I-5.862 J-2.488 E.02048
; LINE_WIDTH: 0.386252
G1 X132.918 Y126.26 E.01018
; LINE_WIDTH: 0.386972
G3 X132.12 Y127.096 I-4.961 J-3.931 E.02044
; LINE_WIDTH: 0.386352
G3 X131.022 Y127.871 I-4.194 J-4.782 E.02374
; LINE_WIDTH: 0.384752
G1 X130.503 Y128.132 E.01019
; LINE_WIDTH: 0.384652
G3 X127.69 Y128.689 I-2.68 J-6.146 E.0507
; LINE_WIDTH: 0.384752
G3 X126.543 Y128.553 I.185 J-6.441 E.0203
; LINE_WIDTH: 0.385422
G1 X125.984 Y128.408 E.01016
; LINE_WIDTH: 0.386602
G1 X125.373 Y128.186 E.01147
; LINE_WIDTH: 0.386712
G3 X124.254 Y127.578 I2.486 J-5.905 E.02251
; LINE_WIDTH: 0.385782
G1 X123.789 Y127.231 E.01021
G3 X122.3 Y125.478 I4.087 J-4.982 E.04072
; LINE_WIDTH: 0.388402
G1 X121.986 Y124.863 E.01225
; LINE_WIDTH: 0.389632
G3 X121.615 Y123.769 I6.191 J-2.706 E.02056
; LINE_WIDTH: 0.408862
G1 X121.48 Y123.125 E.01234
; LINE_WIDTH: 0.419992
G3 X121.478 Y121.392 I6.523 J-.877 E.0335
; LINE_WIDTH: 0.409572
G1 X121.637 Y120.639 E.01443
; LINE_WIDTH: 0.385772
G3 X122.955 Y118.09 I6.475 J1.732 E.05092
; LINE_WIDTH: 0.387342
G1 X123.399 Y117.616 E.01148
; LINE_WIDTH: 0.389772
G3 X124.331 Y116.871 I4.655 J4.87 E.02125
; LINE_WIDTH: 0.389362
G3 X127.016 Y115.866 I3.639 J5.632 E.05136
; LINE_WIDTH: 0.396372
G3 X128.358 Y115.83 I.904 J8.727 E.02435
; LINE_WIDTH: 0.391812
G1 X128.761 Y115.879 E.00727
; WIPE_START
G1 F1800
M204 S10000
G1 X128.926 Y115.898 E-.06308
G1 X129.491 Y116.014 E-.2193
G1 X130.411 Y116.328 E-.36932
G1 X130.668 Y116.452 E-.1083
; WIPE_END
G1 E-.04
G1 X134.502 Y123.052 Z5.76 F30000
G1 X134.724 Y123.435 Z5.76
G1 Z5.36
G1 E.8 F1800
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X134.565 Y123.537 E.00363
; LINE_WIDTH: 0.396652
G1 X134.548 Y123.587 E.00097
; LINE_WIDTH: 0.390272
G1 X134.374 Y124.264 E.01245
; LINE_WIDTH: 0.389862
G1 X134.122 Y124.946 E.01295
; LINE_WIDTH: 0.387262
G3 X133.54 Y126.015 I-5.986 J-2.567 E.02154
; LINE_WIDTH: 0.385772
G1 X133.179 Y126.508 E.01076
; LINE_WIDTH: 0.387262
G3 X132.339 Y127.383 I-4.882 J-3.845 E.02148
; LINE_WIDTH: 0.389352
G1 X131.95 Y127.699 E.0089
; LINE_WIDTH: 0.393102
G3 X130.946 Y128.321 I-4.3 J-5.821 E.02123
; LINE_WIDTH: 0.390782
G3 X129.245 Y128.914 I-3.352 J-6.876 E.03223
; LINE_WIDTH: 0.390652
M73 P63 R7
G3 X128.049 Y129.052 I-1.37 J-6.667 E.0215
; LINE_WIDTH: 0.390552
G3 X126.849 Y128.976 I-.174 J-6.803 E.02148
; LINE_WIDTH: 0.390422
G3 X125.152 Y128.486 I1.25 J-7.513 E.03155
; LINE_WIDTH: 0.389152
G1 X124.611 Y128.22 E.01071
; LINE_WIDTH: 0.389372
G3 X122.248 Y126.076 I3.435 J-6.159 E.05723
; LINE_WIDTH: 0.389792
G3 X121.639 Y124.971 I5.599 J-3.807 E.02249
; LINE_WIDTH: 0.387322
G1 X121.4 Y124.336 E.01199
; LINE_WIDTH: 0.389372
G1 X121.262 Y123.855 E.0089
; LINE_WIDTH: 0.408862
G1 X121.122 Y123.326 E.01025
; LINE_WIDTH: 0.419992
G1 X120.995 Y123.273 E.00266
G1 X118.335 Y123.273 E.05128
G1 X118.335 Y121.227 E.03943
G1 X120.995 Y121.227 E.05127
G1 X121.109 Y121.184 E.00234
; LINE_WIDTH: 0.409572
G1 X121.174 Y121.07 E.00246
; LINE_WIDTH: 0.393022
G1 X121.318 Y120.431 E.01176
; LINE_WIDTH: 0.389372
G3 X122.375 Y118.243 I6.557 J1.819 E.04344
; LINE_WIDTH: 0.389612
G3 X123.178 Y117.325 I5.575 J4.069 E.02172
; LINE_WIDTH: 0.388392
G1 X123.731 Y116.855 E.01287
; LINE_WIDTH: 0.385792
G3 X127.079 Y115.494 I4.147 J5.4 E.0644
; LINE_WIDTH: 0.396372
G3 X128.394 Y115.466 I.81 J7.235 E.02387
; LINE_WIDTH: 0.391812
G3 X129.595 Y115.666 I-.538 J6.941 E.02181
; LINE_WIDTH: 0.389392
G1 X130.096 Y115.818 E.0093
; LINE_WIDTH: 0.387262
G1 X130.662 Y116.044 E.01078
; LINE_WIDTH: 0.385762
G3 X132.217 Y117.014 I-3.197 J6.855 E.03234
; LINE_WIDTH: 0.391402
G3 X133.003 Y117.778 I-4.281 J5.197 E.01963
; LINE_WIDTH: 0.390852
G3 X134.009 Y119.305 I-5.842 J4.941 E.03271
; LINE_WIDTH: 0.392912
G3 X134.408 Y120.352 I-6.301 J3.003 E.02014
; LINE_WIDTH: 0.388302
G1 X134.548 Y120.909 E.01018
; LINE_WIDTH: 0.419992
G1 X134.724 Y121.064 E.00452
G1 X137.665 Y121.064 E.05669
G1 X137.665 Y122.25 E.02285
G1 X137.665 Y123.435 E.02285
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
G1 X134.784 Y123.435 E.05553
; CHANGE_LAYER
; Z_HEIGHT: 5.41263
; LAYER_HEIGHT: 0.0526314
; WIPE_START
G1 F1800
M204 S10000
G1 X134.565 Y123.537 E-.09165
G1 X134.548 Y123.587 E-.02039
G1 X134.374 Y124.264 E-.2654
G1 X134.122 Y124.946 E-.27647
G1 X134 Y125.197 E-.10608
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 63/145
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.76 I-.53 J-1.096 P1  F30000
G1 X132.038 Y126.146 Z5.76
G1 Z5.413
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1404
G3 X123.58 Y126 I-4.163 J-3.897 E.38149
G1 X132.17 Y126 E.34384
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
G2 X133.511 Y123.106 I-4.326 J-3.762 E.12938
G1 X122.237 Y123.106 E.45123
G3 X122.385 Y120.71 I5.639 J-.856 E.09681
G3 X122.55 Y120.212 I7.231 J2.122 E.02101
G1 X133.199 Y120.212 E.42624
G2 X130.799 Y117.353 I-5.324 J2.035 E.1522
G1 X125.014 Y117.317 E.23154
G3 X125.485 Y117.072 I2.864 J4.938 E.02127
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.0673685
; WIPE_START
G1 F7329.351
G1 X125.014 Y117.317 E-.20183
G1 X126.483 Y117.326 E-.55817
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/145
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.813 I-.76 J-.95 P1  F30000
G1 X121.03 Y121.689 Z5.813
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F1404
G2 X121.033 Y122.811 I8.584 J.536 E.02327
G1 X118.744 Y122.802 E.04748
G1 X118.744 Y121.697 E.02293
G2 X120.97 Y121.69 I.852 J-85.423 E.04617
; WIPE_START
G1 F3600
G1 X121.008 Y122.266 E-.21936
G1 X121.033 Y122.811 E-.20705
G1 X120.155 Y122.807 E-.33359
; WIPE_END
G1 E-.04 F1800
G1 X119.297 Y122.25 Z5.88 F30000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.706952
G1 F1404
G1 X120.456 Y122.25 E.03861
; WIPE_START
G1 F3600
G1 X119.297 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.88 I-.02 J1.217 P1  F30000
G1 X135.201 Y122.505 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.536322
G1 F1404
G1 X135.203 Y121.994 E.01275
G1 X136.788 Y121.994 E.03957
G1 X136.788 Y122.25 E.00637
G1 X136.788 Y122.505 E.00637
G1 X135.261 Y122.505 E.03813
G1 X134.695 Y122.999 F30000
; LINE_WIDTH: 0.449992
G1 F1404
G2 X134.709 Y121.559 I-7.298 J-.79 E.02993
G1 X134.735 Y121.527 E.00085
G1 X137.256 Y121.527 E.05229
G1 X137.256 Y122.25 E.01499
G1 X137.256 Y122.972 E.01499
G1 X135.256 Y122.972 E.04148
G2 X134.754 Y122.991 I-.15 J2.75 E.01042
M204 S250
G1 X134.735 Y123.382 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1404
M204 S5000
G1 X134.558 Y123.537 E.00454
; LINE_WIDTH: 0.389092
G1 X134.398 Y124.178 E.01173
; LINE_WIDTH: 0.385772
G3 X133.952 Y125.307 I-6.543 J-1.935 E.0214
; LINE_WIDTH: 0.392922
G3 X133.374 Y126.256 I-6.153 J-3.094 E.01996
; LINE_WIDTH: 0.390842
G3 X132.111 Y127.575 I-6.115 J-4.597 E.03268
; LINE_WIDTH: 0.392672
G3 X131.124 Y128.229 I-4.459 J-5.651 E.02126
; LINE_WIDTH: 0.388792
G1 X130.582 Y128.493 E.0107
; LINE_WIDTH: 0.388642
G1 X130.02 Y128.708 E.01068
; LINE_WIDTH: 0.388482
G1 X129.44 Y128.873 E.01069
; LINE_WIDTH: 0.388302
G1 X128.848 Y128.985 E.01068
; LINE_WIDTH: 0.388162
G1 X128.248 Y129.045 E.01069
; LINE_WIDTH: 0.387992
G1 X127.646 Y129.051 E.01067
; LINE_WIDTH: 0.387822
G1 X127.04 Y129.002 E.01076
; LINE_WIDTH: 0.386872
G1 X126.438 Y128.9 E.01078
; LINE_WIDTH: 0.386732
G1 X125.848 Y128.744 E.01077
; LINE_WIDTH: 0.386602
G1 X125.274 Y128.537 E.01076
; LINE_WIDTH: 0.386482
G1 X124.721 Y128.277 E.01078
; LINE_WIDTH: 0.386932
G3 X123.694 Y127.615 I2.972 J-5.738 E.02161
; LINE_WIDTH: 0.385812
G1 X123.167 Y127.156 E.0123
; LINE_WIDTH: 0.390602
G1 X122.81 Y126.793 E.00908
; LINE_WIDTH: 0.390842
G1 X122.488 Y126.406 E.00898
; LINE_WIDTH: 0.391322
G1 X122.084 Y125.821 E.01271
; LINE_WIDTH: 0.391872
G3 X121.575 Y124.822 I5.83 J-3.6 E.02009
; LINE_WIDTH: 0.389972
G1 X121.34 Y124.135 E.01292
; LINE_WIDTH: 0.390762
G1 X121.164 Y123.376 E.01392
; LINE_WIDTH: 0.419992
G1 X121.064 Y123.229 E.00342
G1 X120.984 Y123.212 E.00158
G1 X118.335 Y123.212 E.05107
G1 X118.335 Y121.288 E.03708
G1 X120.984 Y121.288 E.05107
G1 X121.163 Y121.128 E.00463
; LINE_WIDTH: 0.391782
G1 X121.267 Y120.63 E.00909
; LINE_WIDTH: 0.392912
G3 X121.662 Y119.475 I6.882 J1.708 E.02195
; LINE_WIDTH: 0.389792
G1 X121.958 Y118.89 E.01167
; LINE_WIDTH: 0.387292
G1 X122.322 Y118.321 E.01194
; LINE_WIDTH: 0.392912
G3 X123.034 Y117.469 I5.625 J3.978 E.01995
; LINE_WIDTH: 0.390842
G3 X125.493 Y115.876 I5.004 J5.033 E.05268
; LINE_WIDTH: 0.390162
G1 X125.974 Y115.716 E.00902
; LINE_WIDTH: 0.389372
G1 X126.568 Y115.572 E.01087
; LINE_WIDTH: 0.389612
G3 X127.781 Y115.445 I1.319 J6.765 E.02173
; LINE_WIDTH: 0.388452
G1 X128.501 Y115.476 E.01278
; LINE_WIDTH: 0.392922
G3 X129.595 Y115.666 I-.635 J6.877 E.01995
; LINE_WIDTH: 0.390852
G1 X130.083 Y115.814 E.00911
; LINE_WIDTH: 0.390142
G1 X130.556 Y115.995 E.00902
; LINE_WIDTH: 0.390752
G3 X131.63 Y116.574 I-2.896 J6.661 E.02179
; LINE_WIDTH: 0.391132
G3 X132.433 Y117.198 I-4.098 J6.103 E.01819
; LINE_WIDTH: 0.390862
G1 X132.868 Y117.628 E.01091
; LINE_WIDTH: 0.392302
G3 X133.613 Y118.594 I-5.137 J4.733 E.02189
; LINE_WIDTH: 0.390902
G1 X133.918 Y119.123 E.0109
; LINE_WIDTH: 0.389992
G1 X134.212 Y119.783 E.01287
; LINE_WIDTH: 0.385452
G1 X134.409 Y120.359 E.01071
; LINE_WIDTH: 0.388582
G1 X134.558 Y120.96 E.01098
; LINE_WIDTH: 0.419992
G1 X134.735 Y121.118 E.00458
G1 X137.665 Y121.118 E.05648
M73 P64 R7
G1 X137.665 Y122.25 E.02182
G1 X137.665 Y123.382 E.02182
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
G1 X134.795 Y123.382 E.05532
; WIPE_START
G1 F1800
M204 S10000
G1 X134.558 Y123.537 E-.10768
G1 X134.398 Y124.178 E-.25094
G1 X134.199 Y124.755 E-.23209
G1 X134.017 Y125.162 E-.16929
; WIPE_END
G1 E-.04
G1 X130.279 Y118.508 Z5.88 F30000
G1 X128.805 Y115.885 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.392922
G1 F1404
M204 S5000
G1 X128.932 Y115.901 E.0023
G3 X129.496 Y116.018 I-1.264 J7.522 E.01034
; LINE_WIDTH: 0.390852
G1 X130.311 Y116.285 E.0153
; LINE_WIDTH: 0.386172
G1 X130.835 Y116.528 E.01019
; LINE_WIDTH: 0.387462
G1 X131.395 Y116.853 E.01145
; LINE_WIDTH: 0.391132
G3 X132.39 Y117.655 I-4.218 J6.257 E.02286
; LINE_WIDTH: 0.384532
G1 X132.784 Y118.078 E.01014
; LINE_WIDTH: 0.385362
G1 X133.207 Y118.635 E.0123
; LINE_WIDTH: 0.385792
G1 X133.544 Y119.189 E.01142
; LINE_WIDTH: 0.391412
G3 X134.002 Y120.267 I-6.565 J3.422 E.02096
; LINE_WIDTH: 0.390072
G1 X134.196 Y120.996 E.01344
; LINE_WIDTH: 0.419992
G3 X134.214 Y123.417 I-5.43 J1.251 E.04704
; LINE_WIDTH: 0.392192
G1 X134.083 Y123.968 E.01015
; LINE_WIDTH: 0.389662
G1 X133.904 Y124.518 E.01028
; LINE_WIDTH: 0.389372
G1 X133.676 Y125.049 E.01027
; LINE_WIDTH: 0.392922
G3 X133.084 Y126.035 I-6.883 J-3.464 E.02067
; LINE_WIDTH: 0.390842
G3 X131.889 Y127.284 I-5.79 J-4.341 E.03093
; LINE_WIDTH: 0.392672
G3 X131.022 Y127.872 I-5.053 J-6.528 E.0188
; LINE_WIDTH: 0.386442
G1 X130.503 Y128.132 E.01025
; LINE_WIDTH: 0.386562
G1 X129.965 Y128.344 E.0102
; LINE_WIDTH: 0.386682
G1 X129.41 Y128.507 E.01021
; LINE_WIDTH: 0.386842
G3 X128.268 Y128.681 I-1.536 J-6.26 E.02042
; LINE_WIDTH: 0.387092
G1 X127.69 Y128.69 E.01022
; LINE_WIDTH: 0.388122
G1 X127.128 Y128.65 E.00998
; LINE_WIDTH: 0.388282
G1 X126.565 Y128.558 E.01012
; LINE_WIDTH: 0.388442
G1 X126.012 Y128.417 E.01011
; LINE_WIDTH: 0.388602
G1 X125.475 Y128.228 E.01011
; LINE_WIDTH: 0.388752
G3 X124.424 Y127.691 I2.46 J-6.104 E.02099
; LINE_WIDTH: 0.389402
G1 X124.008 Y127.401 E.00901
; LINE_WIDTH: 0.391842
G3 X123.083 Y126.551 I4.289 J-5.59 E.02251
; LINE_WIDTH: 0.390602
G1 X122.612 Y125.964 E.01341
; LINE_WIDTH: 0.385742
G3 X121.955 Y124.791 I5.262 J-3.72 E.02372
; LINE_WIDTH: 0.389952
G3 X121.554 Y123.503 I6.399 J-2.695 E.02405
; LINE_WIDTH: 0.419992
G3 X121.517 Y121.224 I5.141 J-1.224 E.04427
; LINE_WIDTH: 0.393262
G1 X121.621 Y120.724 E.00919
; LINE_WIDTH: 0.392912
G3 X121.988 Y119.637 I7.161 J1.814 E.02062
; LINE_WIDTH: 0.389792
G1 X122.252 Y119.104 E.01058
; LINE_WIDTH: 0.389622
G1 X122.557 Y118.616 E.01024
; LINE_WIDTH: 0.392912
G3 X123.288 Y117.731 I6.244 J4.412 E.02063
; LINE_WIDTH: 0.390842
G3 X123.934 Y117.153 I5.401 J5.396 E.01548
; LINE_WIDTH: 0.384522
G3 X124.9 Y116.535 I3.946 J5.105 E.02015
; LINE_WIDTH: 0.385392
G1 X125.425 Y116.291 E.01017
; LINE_WIDTH: 0.386182
G3 X126.527 Y115.95 I2.429 J5.888 E.02037
; LINE_WIDTH: 0.385772
G1 X127.098 Y115.854 E.01018
; LINE_WIDTH: 0.387282
G1 X127.743 Y115.808 E.01143
; LINE_WIDTH: 0.389772
G1 X128.364 Y115.827 E.01105
; LINE_WIDTH: 0.392922
G1 X128.746 Y115.877 E.00691
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.932 Y115.901 E-.07139
G1 X129.496 Y116.018 E-.21887
G1 X130.311 Y116.285 E-.32578
G1 X130.654 Y116.444 E-.14396
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 65/145
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.88 I-.587 J-1.066 P1  F30000
G1 X121.03 Y121.743 Z5.88
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G2 X121.03 Y122.757 I7.18 J.507 E.02105
G1 X120.972 Y122.725 E.00137
G1 X118.744 Y122.725 E.04621
G1 X118.744 Y121.774 E.01972
G1 X120.744 Y121.774 E.04148
G2 X120.972 Y121.756 I.037 J-.977 E.00474
; WIPE_START
G1 F3600
G1 X121.012 Y122.25 E-.18818
G1 X121.03 Y122.757 E-.19273
G1 X120.972 Y122.725 E-.02504
G1 X120.04 Y122.725 E-.35405
; WIPE_END
G1 E-.04 F1800
G1 X119.22 Y122.25 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.552392
G1 F1200
G1 X120.537 Y122.25 E.03391
; WIPE_START
G1 F3600
G1 X119.22 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.017 J1.217 P1  F30000
G1 X135.172 Y122.472 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.469362
G1 F1200
G1 X135.169 Y122.028 E.00962
G1 X136.822 Y122.028 E.03586
G1 X136.822 Y122.25 E.00481
G1 X136.822 Y122.471 E.00481
G1 X135.232 Y122.472 E.03449
G1 X134.711 Y122.908 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G2 X134.706 Y121.57 I-9.467 J-.632 E.02777
G1 X134.747 Y121.594 E.001
G1 X137.256 Y121.594 E.05203
G1 X137.256 Y122.25 E.0136
G1 X137.256 Y122.905 E.0136
G1 X134.771 Y122.908 E.05154
M204 S250
G1 X134.748 Y123.315 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X134.57 Y123.471 E.00456
; LINE_WIDTH: 0.389972
G1 X134.546 Y123.586 E.00209
; LINE_WIDTH: 0.386192
G1 X134.398 Y124.178 E.01075
; LINE_WIDTH: 0.385772
G3 X133.653 Y125.84 I-7.317 J-2.284 E.03213
; LINE_WIDTH: 0.392912
G3 X132.993 Y126.733 I-5.852 J-3.634 E.01995
; LINE_WIDTH: 0.390832
G3 X130.018 Y128.707 I-5.119 J-4.483 E.0645
; LINE_WIDTH: 0.390722
G3 X128.246 Y129.044 I-2.301 J-7.292 E.03226
; LINE_WIDTH: 0.390582
G3 X127.088 Y129.008 I-.372 J-6.819 E.0207
; LINE_WIDTH: 0.390142
G3 X125.908 Y128.764 I.788 J-6.764 E.02149
; LINE_WIDTH: 0.390832
G3 X124.721 Y128.278 I1.964 J-6.492 E.02292
; LINE_WIDTH: 0.386352
G3 X123.701 Y127.621 I3.12 J-5.968 E.02142
; LINE_WIDTH: 0.391932
G3 X122.949 Y126.942 I4.02 J-5.207 E.01815
; LINE_WIDTH: 0.391362
G1 X122.614 Y126.566 E.009
; LINE_WIDTH: 0.389632
G3 X121.927 Y125.556 I5.337 J-4.371 E.02175
; LINE_WIDTH: 0.388522
G1 X121.611 Y124.903 E.01287
; LINE_WIDTH: 0.385772
G1 X121.399 Y124.331 E.01074
; LINE_WIDTH: 0.385982
G1 X121.238 Y123.743 E.01074
; LINE_WIDTH: 0.398782
G1 X121.137 Y123.244 E.00928
; LINE_WIDTH: 0.419992
G1 X120.972 Y123.134 E.00382
G1 X118.335 Y123.134 E.05083
G1 X118.335 Y121.365 E.0341
G1 X120.972 Y121.365 E.05083
G1 X121.128 Y121.269 E.00353
; LINE_WIDTH: 0.398612
G1 X121.15 Y121.204 E.00127
; LINE_WIDTH: 0.390212
G1 X121.266 Y120.629 E.01045
; LINE_WIDTH: 0.389802
G1 X121.454 Y119.998 E.01172
; LINE_WIDTH: 0.387232
G1 X121.712 Y119.371 E.01198
; LINE_WIDTH: 0.385802
G3 X123.169 Y117.339 I6.143 J2.868 E.04427
; LINE_WIDTH: 0.385382
G1 X123.728 Y116.86 E.01294
; LINE_WIDTH: 0.384552
G3 X127.765 Y115.459 I4.15 J5.441 E.07624
; LINE_WIDTH: 0.385752
G1 X128.501 Y115.476 E.01296
; LINE_WIDTH: 0.392922
G3 X129.595 Y115.666 I-.635 J6.877 E.01995
; LINE_WIDTH: 0.390852
G1 X130.085 Y115.815 E.00915
; LINE_WIDTH: 0.390172
G1 X130.556 Y115.995 E.00898
; LINE_WIDTH: 0.390742
G3 X131.63 Y116.574 I-2.894 J6.656 E.02179
; LINE_WIDTH: 0.388562
G1 X132.209 Y117.009 E.01284
; LINE_WIDTH: 0.385482
G3 X133.073 Y117.865 I-4.063 J4.971 E.02142
; LINE_WIDTH: 0.384532
G3 X133.772 Y118.863 I-5.195 J4.383 E.02141
; LINE_WIDTH: 0.385452
G3 X134.282 Y119.969 I-5.612 J3.256 E.02144
; LINE_WIDTH: 0.384602
G1 X134.46 Y120.552 E.0107
; LINE_WIDTH: 0.392612
G1 X134.577 Y121.056 E.00928
; LINE_WIDTH: 0.419992
G1 X134.747 Y121.185 E.00411
G1 X137.665 Y121.185 E.05624
G1 X137.665 Y122.25 E.02053
G1 X137.665 Y123.315 E.02053
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
G1 X134.808 Y123.315 E.05508
; WIPE_START
G1 F1800
M204 S10000
G1 X134.57 Y123.471 E-.10802
G1 X134.546 Y123.586 E-.04466
G1 X134.398 Y124.178 E-.23187
G1 X134.199 Y124.755 E-.23196
G1 X134.045 Y125.1 E-.14349
; WIPE_END
G1 E-.04
G1 X130.264 Y118.469 Z6 F30000
G1 X128.79 Y115.883 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.392922
G1 F1200
M204 S5000
G1 X128.932 Y115.901 E.00257
G3 X129.496 Y116.018 I-1.271 J7.555 E.01034
; LINE_WIDTH: 0.390852
G1 X130.311 Y116.285 E.0153
; LINE_WIDTH: 0.386182
G1 X130.835 Y116.528 E.01019
; LINE_WIDTH: 0.387422
G1 X131.392 Y116.852 E.0114
; LINE_WIDTH: 0.391172
G3 X132.262 Y117.536 I-4.194 J6.227 E.01979
; LINE_WIDTH: 0.390052
G1 X132.784 Y118.078 E.0134
; LINE_WIDTH: 0.384532
G3 X133.45 Y119.021 I-4.91 J4.173 E.02028
; LINE_WIDTH: 0.385372
G3 X133.937 Y120.069 I-5.479 J3.183 E.02035
; LINE_WIDTH: 0.384362
G1 X134.108 Y120.621 E.01013
; LINE_WIDTH: 0.392612
G1 X134.228 Y121.163 E.00995
; LINE_WIDTH: 0.419992
G3 X134.213 Y123.403 I-5.37 J1.084 E.04349
; LINE_WIDTH: 0.389972
G1 X134.083 Y123.968 E.01032
; LINE_WIDTH: 0.389372
G3 X133.402 Y125.558 I-6.949 J-2.036 E.03083
; LINE_WIDTH: 0.392912
G3 X132.724 Y126.486 I-6.545 J-4.068 E.02065
; LINE_WIDTH: 0.390832
G3 X129.912 Y128.358 I-4.85 J-4.238 E.06102
; LINE_WIDTH: 0.390722
G3 X128.236 Y128.679 I-2.188 J-6.898 E.03052
; LINE_WIDTH: 0.390582
G3 X127.141 Y128.648 I-.363 J-6.518 E.01956
; LINE_WIDTH: 0.390142
G3 X126.024 Y128.418 I.734 J-6.405 E.02034
; LINE_WIDTH: 0.390832
G3 X124.954 Y127.991 I2.037 J-6.66 E.0206
; LINE_WIDTH: 0.389102
G1 X124.902 Y127.966 E.00103
; LINE_WIDTH: 0.388902
G1 X124.459 Y127.712 E.00905
; LINE_WIDTH: 0.389382
G1 X124.007 Y127.401 E.00976
; LINE_WIDTH: 0.391932
G1 X123.564 Y127.031 E.01033
G1 X122.966 Y126.423 E.01527
; LINE_WIDTH: 0.386212
G1 X122.611 Y125.965 E.01021
; LINE_WIDTH: 0.387222
G1 X122.266 Y125.42 E.01139
; LINE_WIDTH: 0.389802
G3 X121.777 Y124.326 I5.888 J-3.288 E.02136
; LINE_WIDTH: 0.389362
G1 X121.616 Y123.771 E.01028
; LINE_WIDTH: 0.390092
G1 X121.509 Y123.227 E.00987
; LINE_WIDTH: 0.419992
G3 X121.483 Y121.392 I5.954 J-1 E.03552
; LINE_WIDTH: 0.398612
G1 X121.592 Y120.824 E.01054
; LINE_WIDTH: 0.388532
G1 X121.781 Y120.159 E.01226
; LINE_WIDTH: 0.389622
G3 X122.251 Y119.108 I6.331 J2.205 E.02051
; LINE_WIDTH: 0.389382
G3 X122.903 Y118.155 I5.621 J3.139 E.02056
; LINE_WIDTH: 0.390852
G1 X123.291 Y117.727 E.01031
; LINE_WIDTH: 0.392332
G3 X124.169 Y116.984 I4.983 J4.994 E.02064
; LINE_WIDTH: 0.390852
G3 X126.821 Y115.898 I3.808 J5.515 E.05155
; LINE_WIDTH: 0.391572
G1 X127.387 Y115.83 E.0102
G1 X128.369 Y115.828 E.01756
; LINE_WIDTH: 0.392922
G1 X128.73 Y115.875 E.00654
; CHANGE_LAYER
; Z_HEIGHT: 5.68421
; LAYER_HEIGHT: 0.0842104
; WIPE_START
G1 F1800
M204 S10000
G1 X128.932 Y115.901 E-.07718
G1 X129.496 Y116.018 E-.21885
G1 X130.311 Y116.285 E-.32579
G1 X130.64 Y116.438 E-.13818
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 66/145
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6 I-.149 J-1.208 P1  F30000
G1 X125.485 Y117.072 Z6
G1 Z5.684
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1399
G2 X125.014 Y117.317 I3.579 J7.468 E.02127
G1 X130.736 Y117.317 E.22903
G3 X133.199 Y120.212 I-2.881 J4.947 E.15505
G1 X122.55 Y120.212 E.42623
G2 X122.237 Y123.106 I5.32 J2.038 E.11782
G1 X133.511 Y123.106 E.45123
G3 X132.17 Y126 I-5.667 J-.868 E.12938
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
G1 X123.58 Y126 E.34384
G2 X132.038 Y126.146 I4.295 J-3.75 E.3815
; CHANGE_LAYER
; Z_HEIGHT: 5.72
; LAYER_HEIGHT: 0.0357895
; WIPE_START
G1 F7329.351
G1 X131.228 Y126.862 E-.41086
G1 X130.433 Y127.322 E-.34915
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/145
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.084 I.611 J-1.053 P1  F30000
G1 X121.021 Y121.862 Z6.084
G1 Z5.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F1399
G2 X121.024 Y122.653 I10.502 J.351 E.01641
G1 X120.957 Y122.628 E.00149
G1 X118.744 Y122.628 E.0459
G1 X118.744 Y121.872 E.01567
G2 X120.961 Y121.864 I.942 J-47.602 E.04598
; WIPE_START
G1 F3600
G1 X121.024 Y122.653 E-.30091
G1 X120.957 Y122.628 E-.02723
G1 X119.821 Y122.628 E-.43186
; WIPE_END
G1 E-.04 F1800
G1 X119.122 Y122.25 Z6.12 F30000
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.357292
G1 F1399
G1 X120.631 Y122.25 E.02446
; WIPE_START
G1 F3600
G1 X119.122 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.12 I-.014 J1.217 P1  F30000
G1 X135.131 Y122.43 Z6.12
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.386722
G1 F1399
G1 X135.131 Y122.069 E.00637
G1 X136.863 Y122.069 E.03058
G1 X136.863 Y122.25 E.00319
G1 X136.863 Y122.43 E.00319
G1 X135.191 Y122.43 E.02952
G1 X134.807 Y122.839 F30000
; LINE_WIDTH: 0.449992
G1 F1399
G1 X134.712 Y122.842 E.00197
G2 X134.712 Y121.657 I-8.914 J-.593 E.02459
G1 X134.762 Y121.677 E.0011
G1 X137.256 Y121.677 E.05173
G1 X137.256 Y122.25 E.01189
G1 X137.256 Y122.823 E.01189
G2 X135.311 Y122.823 I-.971 J39.539 E.04034
G1 X134.867 Y122.837 E.00921
M204 S250
G1 X134.634 Y123.288 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.408272
G1 F1399
M204 S5000
G1 X134.584 Y123.389 E.00212
; LINE_WIDTH: 0.392332
M73 P65 R7
G3 X134.242 Y124.648 I-6.985 J-1.22 E.0234
; LINE_WIDTH: 0.390782
G1 X134.003 Y125.209 E.01089
; LINE_WIDTH: 0.389962
G3 X133.305 Y126.347 I-5.99 J-2.888 E.02381
; LINE_WIDTH: 0.385772
G3 X132.486 Y127.251 I-5.427 J-4.095 E.0215
; LINE_WIDTH: 0.386352
G1 X132.046 Y127.625 E.01019
; LINE_WIDTH: 0.389732
G3 X131.122 Y128.229 I-4.06 J-5.194 E.01966
; LINE_WIDTH: 0.392232
G3 X130.017 Y128.707 I-3.321 J-6.163 E.02161
; LINE_WIDTH: 0.391702
G1 X129.436 Y128.872 E.01079
; LINE_WIDTH: 0.390682
G3 X127.642 Y129.05 I-1.646 J-7.473 E.03226
; LINE_WIDTH: 0.390552
G1 X127.09 Y129.009 E.00987
; LINE_WIDTH: 0.390132
G3 X125.909 Y128.764 I.786 J-6.764 E.02151
; LINE_WIDTH: 0.390582
G3 X124.778 Y128.309 I2.011 J-6.634 E.02178
; LINE_WIDTH: 0.387862
G1 X124.194 Y127.971 E.01195
; LINE_WIDTH: 0.386272
G1 X123.701 Y127.621 E.01065
; LINE_WIDTH: 0.391952
G3 X122.882 Y126.871 I4.096 J-5.295 E.01991
; LINE_WIDTH: 0.391682
G1 X122.487 Y126.405 E.01092
; LINE_WIDTH: 0.392922
G3 X121.831 Y125.377 I5.697 J-4.358 E.02193
; LINE_WIDTH: 0.389982
G3 X121.34 Y124.135 I5.821 J-3.021 E.02383
; LINE_WIDTH: 0.406982
G1 X121.098 Y123.105 E.01972
; LINE_WIDTH: 0.419992
G1 X120.957 Y123.037 E.00301
G1 X118.335 Y123.037 E.05054
G1 X118.335 Y121.463 E.03034
G1 X120.335 Y121.463 E.03855
G2 X121.014 Y121.454 I.147 J-15.612 E.01309
G1 X121.133 Y121.319 E.00348
; LINE_WIDTH: 0.393162
G1 X121.169 Y121.115 E.00371
; LINE_WIDTH: 0.385782
G3 X122.322 Y118.321 I6.948 J1.231 E.05363
; LINE_WIDTH: 0.392912
G3 X123.034 Y117.469 I5.627 J3.98 E.01995
; LINE_WIDTH: 0.390842
G3 X126.769 Y115.536 I4.907 J4.908 E.07626
; LINE_WIDTH: 0.394752
G1 X127.375 Y115.467 E.01101
G1 X128.397 Y115.466 E.01844
; LINE_WIDTH: 0.391942
G3 X129.595 Y115.666 I-.542 J6.95 E.02177
; LINE_WIDTH: 0.389392
G1 X130.096 Y115.817 E.00931
; LINE_WIDTH: 0.387392
G3 X131.725 Y116.642 I-2.644 J7.249 E.03236
; LINE_WIDTH: 0.386242
G1 X132.188 Y116.988 E.01019
; LINE_WIDTH: 0.389352
G1 X132.578 Y117.331 E.00925
; LINE_WIDTH: 0.390182
G1 X132.93 Y117.696 E.00903
; LINE_WIDTH: 0.392352
G3 X133.613 Y118.593 I-5.197 J4.663 E.02023
; LINE_WIDTH: 0.390772
G1 X133.919 Y119.122 E.01091
; LINE_WIDTH: 0.389352
G3 X134.38 Y120.252 I-6.042 J3.126 E.02172
; LINE_WIDTH: 0.403602
G1 X134.623 Y121.198 E.01805
; LINE_WIDTH: 0.419992
G1 X134.762 Y121.267 E.00299
G1 X137.665 Y121.267 E.05596
G1 X137.665 Y122.25 E.01893
G1 X137.665 Y123.232 E.01893
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
G1 X134.762 Y123.232 E.05595
G1 X134.689 Y123.264 E.00154
; WIPE_START
G1 F1800
M204 S10000
G1 X134.584 Y123.389 E-.06213
G1 X134.431 Y124.068 E-.26446
G1 X134.242 Y124.648 E-.23157
G1 X134.034 Y125.136 E-.20184
; WIPE_END
G1 E-.04
G1 X130.267 Y118.498 Z6.12 F30000
G1 X128.78 Y115.876 Z6.12
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.385812
G1 F1399
M204 S5000
G1 X129.392 Y115.988 E.01097
; LINE_WIDTH: 0.387102
G3 X130.488 Y116.361 I-1.464 J6.105 E.02047
; LINE_WIDTH: 0.386832
G3 X131.498 Y116.922 I-2.565 J5.804 E.02042
; LINE_WIDTH: 0.386242
G1 X131.961 Y117.268 E.01019
; LINE_WIDTH: 0.386572
G3 X132.784 Y118.078 I-4.027 J4.919 E.0204
; LINE_WIDTH: 0.385402
G1 X133.21 Y118.639 E.01239
; LINE_WIDTH: 0.385782
G3 X134.154 Y120.808 I-5.307 J3.6 E.04188
; LINE_WIDTH: 0.403602
G1 X134.267 Y121.375 E.01068
; LINE_WIDTH: 0.419992
G3 X134.272 Y123.108 I-6.337 J.883 E.0335
; LINE_WIDTH: 0.408272
G1 X134.157 Y123.675 E.01083
; LINE_WIDTH: 0.385392
G1 X133.964 Y124.353 E.01239
; LINE_WIDTH: 0.385802
G3 X133.458 Y125.464 I-6.018 J-2.066 E.02152
; LINE_WIDTH: 0.389962
G3 X132.722 Y126.492 I-5.828 J-3.398 E.02255
; LINE_WIDTH: 0.389352
G3 X131.886 Y127.29 I-4.85 J-4.245 E.02057
; LINE_WIDTH: 0.389732
G3 X130.952 Y127.908 I-4.04 J-5.092 E.01997
; LINE_WIDTH: 0.392232
G3 X129.909 Y128.358 I-3.312 J-6.247 E.02036
; LINE_WIDTH: 0.391702
G1 X129.362 Y128.515 E.01019
; LINE_WIDTH: 0.390682
G3 X127.663 Y128.686 I-1.568 J-7.069 E.03053
; LINE_WIDTH: 0.390552
G1 X127.143 Y128.648 E.0093
; LINE_WIDTH: 0.390132
G3 X126.026 Y128.419 I.732 J-6.403 E.02035
; LINE_WIDTH: 0.390582
G3 X124.971 Y128.001 I2.059 J-6.741 E.02025
; LINE_WIDTH: 0.389062
G1 X124.459 Y127.711 E.01046
; LINE_WIDTH: 0.389362
G1 X124.007 Y127.4 E.00975
; LINE_WIDTH: 0.391952
G3 X123.155 Y126.628 I4.282 J-5.577 E.02062
; LINE_WIDTH: 0.391682
G1 X122.781 Y126.189 E.01031
; LINE_WIDTH: 0.392922
G3 X122.16 Y125.221 I6.161 J-4.639 E.02065
; LINE_WIDTH: 0.389982
G3 X121.555 Y123.503 I6.624 J-3.298 E.03253
; LINE_WIDTH: 0.406982
G1 X121.458 Y122.933 E.01078
; LINE_WIDTH: 0.419992
G3 X121.518 Y121.202 I5.87 J-.662 E.03349
; LINE_WIDTH: 0.386262
G3 X122.613 Y118.532 I6.341 J1.04 E.0513
; LINE_WIDTH: 0.385842
G1 X123.08 Y117.947 E.01318
; LINE_WIDTH: 0.384672
G1 X123.488 Y117.533 E.0102
; LINE_WIDTH: 0.384542
G3 X127.098 Y115.855 I4.444 J4.84 E.07096
G1 X128.054 Y115.813 E.01679
; LINE_WIDTH: 0.384972
G1 X128.699 Y115.861 E.01136
; LINE_WIDTH: 0.385812
G1 X128.721 Y115.865 E.00038
; CHANGE_LAYER
; Z_HEIGHT: 5.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X129.392 Y115.988 E-.25951
G1 X129.95 Y116.149 E-.22043
G1 X130.488 Y116.361 E-.21979
G1 X130.63 Y116.431 E-.06027
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 68/145
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.12 I-1.02 J.664 P1  F30000
G1 X134.727 Y122.724 Z6.12
G1 Z5.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G2 X134.721 Y121.763 I-12.617 J-.405 E.01992
G1 X134.779 Y121.779 E.00124
G1 X137.256 Y121.779 E.05138
G1 X137.256 Y122.25 E.00977
G1 X137.256 Y122.721 E.00977
G1 X135.256 Y122.721 E.04148
G2 X134.787 Y122.723 I-.022 J45.7 E.00973
; WIPE_START
G1 F3600
G1 X134.721 Y121.763 E-.3655
G1 X134.779 Y121.779 E-.0227
G1 X135.757 Y121.779 E-.3718
; WIPE_END
G1 E-.04 F1800
G1 X136.785 Y122.25 Z6.24 F30000
G1 Z5.84
G1 E.8 F1800
; LINE_WIDTH: 0.543792
G1 F1200
G1 X135.212 Y122.25 E.03982
; WIPE_START
G1 F3600
G1 X136.785 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.24 I-.018 J-1.217 P1  F30000
G1 X120.991 Y122.486 Z6.24
G1 Z5.84
G1 E.8 F1800
; LINE_WIDTH: 0.491282
G1 F1200
G1 X118.765 Y122.482 E.05068
G1 X118.765 Y122.017 E.0106
G2 X120.991 Y122.013 I.997 J-64.786 E.05068
G1 X120.991 Y122.426 E.00941
; WIPE_START
G1 F3600
G1 X118.992 Y122.477 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.315 Y118.202 Z6.24 F30000
G1 X128.759 Y115.875 Z6.24
G1 Z5.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389562
G1 F1200
M204 S5000
G1 X128.935 Y115.896 E.00316
; LINE_WIDTH: 0.392932
G3 X130.311 Y116.285 I-1.379 J7.506 E.02569
; LINE_WIDTH: 0.386202
G1 X130.835 Y116.528 E.01019
; LINE_WIDTH: 0.385152
G1 X131.387 Y116.85 E.01123
; LINE_WIDTH: 0.386942
G1 X131.959 Y117.267 E.0125
; LINE_WIDTH: 0.387342
G3 X132.784 Y118.077 I-3.994 J4.887 E.02048
; LINE_WIDTH: 0.386742
G3 X133.543 Y119.188 I-4.793 J4.089 E.02378
; LINE_WIDTH: 0.385522
G1 X133.796 Y119.71 E.01021
; LINE_WIDTH: 0.389982
G3 X134.183 Y120.937 I-6.342 J2.673 E.02294
; LINE_WIDTH: 0.411042
G1 X134.294 Y121.565 E.01202
; LINE_WIDTH: 0.419992
G3 X134.242 Y123.234 I-5.904 J.65 E.03229
; LINE_WIDTH: 0.389612
G1 X134.132 Y123.782 E.00994
; LINE_WIDTH: 0.389372
G1 X133.97 Y124.338 E.01029
; LINE_WIDTH: 0.389582
G3 X133.499 Y125.393 I-6.486 J-2.262 E.02058
; LINE_WIDTH: 0.388562
G1 X133.194 Y125.885 E.01026
; LINE_WIDTH: 0.389592
G3 X132.46 Y126.774 I-5.501 J-3.794 E.02055
; LINE_WIDTH: 0.389352
G3 X131.578 Y127.52 I-4.586 J-4.526 E.02057
; LINE_WIDTH: 0.389762
G3 X129.965 Y128.345 I-4.129 J-6.089 E.03232
; LINE_WIDTH: 0.387152
G1 X129.41 Y128.507 E.01022
; LINE_WIDTH: 0.388332
G3 X128.268 Y128.681 I-1.544 J-6.31 E.02051
; LINE_WIDTH: 0.386982
G1 X127.69 Y128.69 E.0102
; LINE_WIDTH: 0.388232
G1 X127.133 Y128.65 E.0099
; LINE_WIDTH: 0.388362
G1 X126.569 Y128.559 E.01014
; LINE_WIDTH: 0.388512
G1 X126.016 Y128.418 E.01012
; LINE_WIDTH: 0.390152
G1 X125.479 Y128.228 E.01015
; LINE_WIDTH: 0.392092
G3 X124.298 Y127.608 I2.778 J-6.725 E.02392
; LINE_WIDTH: 0.389392
G3 X123.403 Y126.887 I3.686 J-5.493 E.02046
; LINE_WIDTH: 0.385712
G3 X122.612 Y125.965 I4.383 J-4.56 E.02142
; LINE_WIDTH: 0.384942
G3 X121.643 Y123.879 I5.274 J-3.717 E.0406
; LINE_WIDTH: 0.387162
G1 X121.492 Y123.125 E.01358
; LINE_WIDTH: 0.419992
G3 X121.48 Y121.472 I5.297 J-.863 E.032
; LINE_WIDTH: 0.390012
G1 X121.592 Y120.824 E.01171
; LINE_WIDTH: 0.385772
G3 X122.493 Y118.708 I6.33 J1.444 E.0407
; LINE_WIDTH: 0.391802
G3 X123.29 Y117.728 I5.96 J4.031 E.02265
; LINE_WIDTH: 0.392382
G1 X123.715 Y117.338 E.01032
G1 X124.168 Y116.984 E.01032
; LINE_WIDTH: 0.390842
G3 X125.703 Y116.187 I4.105 J6.026 E.03093
; LINE_WIDTH: 0.391642
G3 X126.82 Y115.898 I2.272 J6.466 E.02068
; LINE_WIDTH: 0.391512
G1 X127.387 Y115.83 E.01021
G1 X128.369 Y115.828 E.01756
; LINE_WIDTH: 0.389562
G1 X128.699 Y115.868 E.00591
; WIPE_START
G1 F1800
M204 S10000
G1 X128.935 Y115.896 E-.09041
G1 X129.498 Y116.022 E-.2189
G1 X130.311 Y116.285 E-.32469
G1 X130.611 Y116.425 E-.126
; WIPE_END
G1 E-.04
G1 X134.445 Y123.024 Z6.24 F30000
G1 X134.601 Y123.291 Z6.24
G1 Z5.84
G1 E.8 F1800
; LINE_WIDTH: 0.389612
G1 F1200
M204 S5000
G1 X134.583 Y123.386 E.00171
; LINE_WIDTH: 0.386582
G1 X134.454 Y123.981 E.01074
; LINE_WIDTH: 0.387092
G3 X133.05 Y126.665 I-6.755 J-1.824 E.05393
; LINE_WIDTH: 0.385772
G3 X132.179 Y127.518 I-5.175 J-4.415 E.02149
; LINE_WIDTH: 0.385912
G3 X131.17 Y128.201 I-4.237 J-5.174 E.02149
; LINE_WIDTH: 0.385442
G1 X130.621 Y128.471 E.01076
; LINE_WIDTH: 0.387342
G1 X130.051 Y128.697 E.01084
; LINE_WIDTH: 0.388462
G3 X128.803 Y128.99 I-2.139 J-6.305 E.02275
; LINE_WIDTH: 0.388092
G3 X127.64 Y129.051 I-.928 J-6.594 E.02067
; LINE_WIDTH: 0.387952
G1 X127.04 Y129.002 E.01066
; LINE_WIDTH: 0.386762
G1 X126.438 Y128.9 E.01078
; LINE_WIDTH: 0.386642
G1 X125.846 Y128.744 E.0108
; LINE_WIDTH: 0.386542
G1 X125.213 Y128.509 E.01191
; LINE_WIDTH: 0.385862
G1 X124.548 Y128.177 E.01309
; LINE_WIDTH: 0.386242
G3 X123.539 Y127.492 I2.935 J-5.405 E.02152
; LINE_WIDTH: 0.386112
G1 X123.133 Y127.125 E.00966
; LINE_WIDTH: 0.385532
G3 X122.304 Y126.15 I4.538 J-4.698 E.02255
; LINE_WIDTH: 0.385012
G3 X121.291 Y123.937 I5.494 J-3.853 E.04299
; LINE_WIDTH: 0.389572
G1 X121.12 Y123.082 E.01551
; LINE_WIDTH: 0.419992
G1 X120.989 Y122.918 E.00404
G1 X120.941 Y122.912 E.00094
G1 X118.335 Y122.912 E.05023
G1 X118.335 Y121.587 E.02555
G1 X120.335 Y121.587 E.03855
G2 X120.971 Y121.585 I.212 J-27.872 E.01227
G1 X121.117 Y121.438 E.00399
; LINE_WIDTH: 0.391992
G1 X121.138 Y121.312 E.00228
; LINE_WIDTH: 0.389352
G3 X121.662 Y119.475 I7.335 J1.098 E.03406
; LINE_WIDTH: 0.390752
G3 X122.257 Y118.41 I6.331 J2.844 E.02179
; LINE_WIDTH: 0.390172
G1 X122.742 Y117.788 E.01406
; LINE_WIDTH: 0.385412
G3 X123.728 Y116.86 I5.106 J4.438 E.02384
; LINE_WIDTH: 0.384542
G3 X125.31 Y115.951 I4.574 J6.132 E.03209
; LINE_WIDTH: 0.384942
G3 X126.476 Y115.594 I2.571 J6.319 E.02145
; LINE_WIDTH: 0.384592
G3 X127.76 Y115.459 I1.266 J5.847 E.02268
; LINE_WIDTH: 0.385772
G3 X129.105 Y115.559 I.232 J5.957 E.02381
; LINE_WIDTH: 0.392932
G3 X130.084 Y115.814 I-1.246 J6.785 E.01818
; LINE_WIDTH: 0.390212
G1 X130.556 Y115.995 E.009
; LINE_WIDTH: 0.390692
G3 X131.723 Y116.639 I-2.762 J6.388 E.02381
; LINE_WIDTH: 0.390452
G1 X132.216 Y117.009 E.01099
; LINE_WIDTH: 0.387352
G1 X132.666 Y117.418 E.01076
; LINE_WIDTH: 0.387062
G1 X133.078 Y117.869 E.01079
; LINE_WIDTH: 0.387422
G1 X133.447 Y118.342 E.0106
; LINE_WIDTH: 0.392952
G3 X134.006 Y119.299 I-6.121 J4.223 E.01992
; LINE_WIDTH: 0.391322
G3 X134.41 Y120.363 I-6.169 J2.95 E.02036
; LINE_WIDTH: 0.392122
G1 X134.599 Y121.205 E.01546
; LINE_WIDTH: 0.411042
G1 X134.669 Y121.33 E.00272
; LINE_WIDTH: 0.419992
G1 X134.779 Y121.369 E.00225
G1 X137.665 Y121.369 E.05563
G1 X137.665 Y122.25 E.01697
G1 X137.665 Y123.13 E.01697
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
G1 X134.779 Y123.13 E.05563
G1 X134.645 Y123.251 E.00348
; CHANGE_LAYER
; Z_HEIGHT: 5.95579
; LAYER_HEIGHT: 0.115789
; WIPE_START
G1 F1800
M204 S10000
G1 X134.583 Y123.386 E-.05636
G1 X134.454 Y123.981 E-.23131
G1 X134.294 Y124.507 E-.2089
G1 X134.039 Y125.127 E-.25489
G1 X134.029 Y125.147 E-.00855
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 69/145
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.24 I-.546 J-1.088 P1  F30000
G1 X132.038 Y126.146 Z6.24
G1 Z5.956
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1293
G3 X123.58 Y126 I-4.163 J-3.897 E.38149
G1 X132.17 Y126 E.34384
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
G2 X133.513 Y123.106 I-4.295 J-3.75 E.12942
G1 X122.237 Y123.106 E.45128
G3 X122.549 Y120.212 I5.698 J-.85 E.11779
G1 X133.199 Y120.212 E.42625
G2 X130.736 Y117.317 I-5.316 J2.028 E.15509
G1 X125.014 Y117.317 E.22903
G3 X125.485 Y117.072 I4.049 J7.22 E.02126
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.00421047
; WIPE_START
G1 F7329.351
G1 X125.014 Y117.317 E-.20184
G1 X126.483 Y117.317 E-.55816
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/145
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.356 I-.646 J1.031 P1  F30000
G1 X134.8 Y122.528 Z6.356
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.581572
; LAYER_HEIGHT: 0.12
G1 F1293
G1 X134.799 Y121.972 E.01511
G1 X137.19 Y121.972 E.06499
G1 X137.19 Y122.25 E.00755
G1 X137.19 Y122.528 E.00755
G1 X134.86 Y122.528 E.06333
M204 S250
G1 X134.618 Y123.166 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.391102
G1 F1293
M204 S5000
G1 X134.483 Y123.872 E.01284
; LINE_WIDTH: 0.390832
G3 X134.087 Y125.025 I-6.605 J-1.621 E.02179
; LINE_WIDTH: 0.391592
G1 X133.813 Y125.57 E.01091
; LINE_WIDTH: 0.392022
G3 X133.126 Y126.578 I-6.108 J-3.428 E.02187
; LINE_WIDTH: 0.389362
G1 X132.717 Y127.031 E.01086
; LINE_WIDTH: 0.389572
G3 X131.786 Y127.819 I-4.892 J-4.838 E.02172
; LINE_WIDTH: 0.388712
G1 X131.17 Y128.201 E.01286
; LINE_WIDTH: 0.385442
G1 X130.621 Y128.471 E.01076
; LINE_WIDTH: 0.387282
G1 X130.051 Y128.697 E.01084
; LINE_WIDTH: 0.388402
G3 X128.842 Y128.986 I-2.168 J-6.402 E.02206
; LINE_WIDTH: 0.388282
G1 X128.241 Y129.045 E.01071
; LINE_WIDTH: 0.388122
G1 X127.638 Y129.051 E.01069
; LINE_WIDTH: 0.387982
G1 X127.04 Y129.002 E.01062
; LINE_WIDTH: 0.386732
G1 X126.435 Y128.898 E.01083
; LINE_WIDTH: 0.390142
G1 X125.718 Y128.702 E.01325
; LINE_WIDTH: 0.392162
G3 X124.266 Y128.017 I2.222 J-6.59 E.02882
; LINE_WIDTH: 0.390862
G3 X123.316 Y127.301 I3.618 J-5.782 E.02127
; LINE_WIDTH: 0.391602
G3 X122.137 Y125.906 I5.226 J-5.612 E.03274
; LINE_WIDTH: 0.392042
G3 X121.576 Y124.822 I5.879 J-3.735 E.02188
; LINE_WIDTH: 0.389972
G1 X121.34 Y124.135 E.01293
; LINE_WIDTH: 0.387002
G1 X121.194 Y123.541 E.01081
; LINE_WIDTH: 0.389202
G1 X121.102 Y122.917 E.01121
; LINE_WIDTH: 0.419992
G1 X120.922 Y122.747 E.00477
G1 X118.335 Y122.747 E.04987
G1 X118.335 Y121.753 E.01916
G1 X120.921 Y121.753 E.04985
M73 P66 R7
G1 X121.078 Y121.66 E.00352
; LINE_WIDTH: 0.400772
G1 X121.102 Y121.583 E.00148
; LINE_WIDTH: 0.390592
G3 X121.317 Y120.433 I7.049 J.722 E.02088
; LINE_WIDTH: 0.389372
G1 X121.507 Y119.851 E.01088
; LINE_WIDTH: 0.390682
G3 X122.038 Y118.752 I6.493 J2.461 E.02181
; LINE_WIDTH: 0.389982
G1 X122.442 Y118.156 E.01282
; LINE_WIDTH: 0.389352
G1 X122.756 Y117.766 E.00891
; LINE_WIDTH: 0.390042
G1 X123.114 Y117.389 E.00925
; LINE_WIDTH: 0.390202
G1 X123.55 Y116.998 E.01045
; LINE_WIDTH: 0.390852
G3 X126.769 Y115.536 I4.324 J5.249 E.06383
; LINE_WIDTH: 0.394752
G1 X127.375 Y115.467 E.01101
G1 X128.397 Y115.466 E.01844
; LINE_WIDTH: 0.391512
G1 X128.998 Y115.539 E.01082
; LINE_WIDTH: 0.390852
G3 X130.086 Y115.815 I-1.125 J6.715 E.02007
; LINE_WIDTH: 0.390232
G1 X130.556 Y115.995 E.00897
; LINE_WIDTH: 0.390692
G3 X131.725 Y116.64 I-2.786 J6.436 E.02385
; LINE_WIDTH: 0.390172
G3 X133.079 Y117.867 I-4.38 J6.193 E.03263
; LINE_WIDTH: 0.391662
G3 X133.777 Y118.869 I-5.118 J4.309 E.02188
; LINE_WIDTH: 0.387392
G1 X134.059 Y119.411 E.01081
; LINE_WIDTH: 0.389022
G3 X134.464 Y120.559 I-6.034 J2.771 E.02166
; LINE_WIDTH: 0.390852
G1 X134.617 Y121.328 E.014
; LINE_WIDTH: 0.416702
G1 X134.712 Y121.475 E.00334
; LINE_WIDTH: 0.419992
G1 X134.798 Y121.497 E.0017
G1 X137.665 Y121.497 E.05527
G1 X137.665 Y122.25 E.01451
G1 X137.665 Y123.003 E.01451
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
G1 X134.798 Y123.003 E.05527
G1 X134.658 Y123.071 E.003
; LINE_WIDTH: 0.406502
G1 X134.641 Y123.11 E.0008
; WIPE_START
G1 F1800
M204 S10000
G1 X134.483 Y123.872 E-.2956
G1 X134.311 Y124.456 E-.23148
G1 X134.087 Y125.025 E-.2322
G1 X134.086 Y125.027 E-.00072
; WIPE_END
G1 E-.04
G1 X130.244 Y118.432 Z6.36 F30000
G1 X128.751 Y115.87 Z6.36
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.384922
G1 F1293
M204 S5000
G1 X129.207 Y115.947 E.00812
; LINE_WIDTH: 0.385292
G1 X129.766 Y116.091 E.01014
; LINE_WIDTH: 0.386212
G3 X130.835 Y116.528 I-1.812 J5.952 E.02038
; LINE_WIDTH: 0.385102
G3 X131.81 Y117.149 I-2.964 J5.733 E.02033
; LINE_WIDTH: 0.384662
G3 X132.657 Y117.933 I-3.898 J5.059 E.02028
; LINE_WIDTH: 0.384342
G1 X133.025 Y118.379 E.01013
; LINE_WIDTH: 0.390012
G3 X133.718 Y119.534 I-5.488 J4.081 E.02403
; LINE_WIDTH: 0.386702
G1 X133.917 Y120.015 E.00918
; LINE_WIDTH: 0.389632
G3 X134.218 Y121.124 I-6.31 J2.306 E.02048
; LINE_WIDTH: 0.416702
G1 X134.314 Y121.758 E.01225
; LINE_WIDTH: 0.419992
G3 X134.294 Y122.916 I-6.107 J.469 E.02235
; LINE_WIDTH: 0.406502
G1 X134.197 Y123.487 E.01078
; LINE_WIDTH: 0.384532
G3 X133.64 Y125.124 I-7.055 J-1.484 E.03041
; LINE_WIDTH: 0.384912
G1 X133.328 Y125.679 E.01117
; LINE_WIDTH: 0.385802
G3 X132.12 Y127.096 I-5.943 J-3.841 E.03289
; LINE_WIDTH: 0.387032
G1 X131.621 Y127.491 E.01124
; LINE_WIDTH: 0.390382
G3 X130.612 Y128.08 I-3.961 J-5.634 E.02086
; LINE_WIDTH: 0.389812
G1 X129.965 Y128.345 E.01244
; LINE_WIDTH: 0.387202
G1 X129.41 Y128.507 E.01022
; LINE_WIDTH: 0.386722
G3 X128.268 Y128.681 I-1.535 J-6.25 E.02041
; LINE_WIDTH: 0.386942
G1 X127.69 Y128.69 E.01021
; LINE_WIDTH: 0.388252
G1 X127.135 Y128.65 E.00987
; LINE_WIDTH: 0.388382
G3 X125.984 Y128.408 I.733 J-6.333 E.02088
; LINE_WIDTH: 0.383922
G1 X125.386 Y128.19 E.01114
; LINE_WIDTH: 0.382642
G1 X124.747 Y127.88 E.01239
; LINE_WIDTH: 0.384872
G3 X123.79 Y127.231 I3.011 J-5.47 E.02034
; LINE_WIDTH: 0.384992
G3 X122.967 Y126.422 I4.142 J-5.039 E.02029
; LINE_WIDTH: 0.384562
G1 X122.612 Y125.965 E.01016
; LINE_WIDTH: 0.384912
G1 X122.271 Y125.427 E.01117
; LINE_WIDTH: 0.385822
G1 X121.955 Y124.791 E.0125
; LINE_WIDTH: 0.389952
G3 X121.555 Y123.504 I6.403 J-2.697 E.02405
; LINE_WIDTH: 0.387782
G1 X121.468 Y122.931 E.01025
; LINE_WIDTH: 0.419992
G3 X121.442 Y121.776 I4.244 J-.672 E.02234
; LINE_WIDTH: 0.400772
G1 X121.519 Y121.202 E.01061
; LINE_WIDTH: 0.386332
G3 X121.807 Y120.084 I6.2 J1.003 E.02039
; LINE_WIDTH: 0.385782
G3 X122.291 Y119.036 I6.241 J2.246 E.02034
; LINE_WIDTH: 0.389962
G3 X123.029 Y118.007 I5.824 J3.393 E.02258
; LINE_WIDTH: 0.389352
G1 X123.487 Y117.532 E.01173
; LINE_WIDTH: 0.385372
G3 X124.4 Y116.825 I4.339 J4.656 E.02033
; LINE_WIDTH: 0.384532
G3 X127.098 Y115.855 I3.566 J5.678 E.05069
G1 X128.054 Y115.813 E.01679
; LINE_WIDTH: 0.384922
G3 X128.692 Y115.86 I-.142 J6.252 E.01124
; WIPE_START
G1 F1800
M204 S10000
G1 X129.207 Y115.947 E-.19855
G1 X129.766 Y116.091 E-.21927
G1 X130.311 Y116.285 E-.21956
G1 X130.603 Y116.421 E-.12262
; WIPE_END
G1 E-.04
G1 X124.064 Y120.357 Z6.36 F30000
G1 X120.921 Y122.25 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.625572
G1 F1293
G1 X118.832 Y122.25 E.06127
; CHANGE_LAYER
; Z_HEIGHT: 6.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X120.832 Y122.25 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/145
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.36 I-.022 J1.217 P1  F30000
G1 X134.718 Y122.503 Z6.36
G1 Z6.08
G1 E.8 F1800
; LINE_WIDTH: 0.416762
G1 F1200
G1 X134.717 Y122.015 E.00933
G1 X134.818 Y122.054 E.00207
G1 X136.818 Y122.054 E.03823
; LINE_WIDTH: 0.416652
G1 X137.272 Y122.054 E.00868
G1 X137.272 Y122.25 E.00374
; LINE_WIDTH: 0.416642
G1 X137.272 Y122.445 E.00374
G1 X137.077 Y122.445 E.00374
; LINE_WIDTH: 0.416762
G1 X134.85 Y122.445 E.04258
G1 X134.773 Y122.479 E.00159
M204 S250
G1 X134.639 Y123.006 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.389012
G1 F1200
M204 S5000
G1 X134.534 Y123.652 E.01162
; LINE_WIDTH: 0.389352
G3 X133.911 Y125.391 I-7.453 J-1.687 E.03292
; LINE_WIDTH: 0.389582
G3 X133.254 Y126.419 I-6.094 J-3.176 E.02173
; LINE_WIDTH: 0.388742
G1 X132.777 Y126.966 E.01288
; LINE_WIDTH: 0.385792
G1 X132.333 Y127.388 E.01078
; LINE_WIDTH: 0.385982
G3 X131.175 Y128.196 I-4.419 J-5.095 E.02492
; LINE_WIDTH: 0.384792
G3 X128.264 Y129.039 I-3.398 J-6.286 E.05362
; LINE_WIDTH: 0.384642
G3 X127.043 Y128.996 I-.384 J-6.44 E.02146
; LINE_WIDTH: 0.385972
G1 X126.435 Y128.898 E.01085
; LINE_WIDTH: 0.390112
G3 X125.227 Y128.51 I1.2 J-5.814 E.02265
; LINE_WIDTH: 0.382982
G1 X124.553 Y128.18 E.01312
; LINE_WIDTH: 0.384822
G3 X122.677 Y126.635 I3.272 J-5.884 E.0429
; LINE_WIDTH: 0.384592
G1 X122.304 Y126.15 E.01073
; LINE_WIDTH: 0.384962
G3 X121.699 Y125.092 I5.283 J-3.72 E.02142
; LINE_WIDTH: 0.386142
G3 X121.29 Y123.944 I5.395 J-2.569 E.02152
; LINE_WIDTH: 0.385192
G1 X121.162 Y123.347 E.01073
; LINE_WIDTH: 0.387282
G1 X121.091 Y122.778 E.01014
; LINE_WIDTH: 0.431932
G1 X121.064 Y122.676 E.00209
; LINE_WIDTH: 0.476582
G1 X121.037 Y122.574 E.00232
; LINE_WIDTH: 0.521232
G1 X121.011 Y122.472 E.00255
G1 X120.921 Y122.472 E.00217
; LINE_WIDTH: 0.472222
G1 X118.921 Y122.472 E.04366
; LINE_WIDTH: 0.470952
G1 X118.36 Y122.472 E.01221
; LINE_WIDTH: 0.470602
G1 X118.36 Y122.027 E.00968
G1 X120.902 Y122.027 E.05527
; LINE_WIDTH: 0.495882
G1 X120.956 Y122.027 E.00126
; LINE_WIDTH: 0.521232
G1 X121.011 Y122.027 E.00132
G1 X121.033 Y121.987 E.00111
; LINE_WIDTH: 0.474942
G1 X121.074 Y121.754 E.0052
; LINE_WIDTH: 0.429172
G1 X121.115 Y121.521 E.00467
; LINE_WIDTH: 0.384542
G1 X121.207 Y120.915 E.01074
; LINE_WIDTH: 0.385782
G3 X122.102 Y118.653 I6.575 J1.295 E.04307
; LINE_WIDTH: 0.386932
G3 X122.813 Y117.705 I5.511 J3.388 E.02095
; LINE_WIDTH: 0.389372
G1 X123.168 Y117.336 E.0091
; LINE_WIDTH: 0.390262
G1 X123.547 Y117 E.00903
; LINE_WIDTH: 0.390882
G3 X124.398 Y116.401 I4.28 J5.178 E.01861
; LINE_WIDTH: 0.390272
G1 X124.837 Y116.16 E.00892
; LINE_WIDTH: 0.389402
G3 X125.893 Y115.74 I3.04 J6.095 E.02022
; LINE_WIDTH: 0.387522
G3 X127.086 Y115.493 I1.902 J6.19 E.02159
; LINE_WIDTH: 0.385792
G3 X130.281 Y115.887 I.758 J7.007 E.05716
; LINE_WIDTH: 0.389372
G1 X130.743 Y116.079 E.0089
; LINE_WIDTH: 0.390022
G1 X131.202 Y116.314 E.00918
; LINE_WIDTH: 0.390862
G1 X131.629 Y116.575 E.00893
; LINE_WIDTH: 0.391572
G1 X132.123 Y116.935 E.01094
; LINE_WIDTH: 0.392062
G3 X133.005 Y117.779 I-4.375 J5.455 E.02188
; LINE_WIDTH: 0.391692
G3 X133.777 Y118.867 I-5.225 J4.525 E.02391
; LINE_WIDTH: 0.385762
G3 X134.464 Y120.561 I-6.624 J3.671 E.03226
; LINE_WIDTH: 0.405082
G1 X134.677 Y121.591 E.01951
; LINE_WIDTH: 0.419992
G1 X134.818 Y121.662 E.00303
G1 X137.665 Y121.662 E.05487
G1 X137.665 Y122.25 E.01133
G1 X137.665 Y122.838 E.01133
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
G1 X134.818 Y122.838 E.05487
G1 X134.683 Y122.965 E.00358
; WIPE_START
G1 F1800
M204 S10000
G1 X134.534 Y123.652 E-.2671
G1 X134.375 Y124.263 E-.23996
G1 X134.168 Y124.838 E-.23219
G1 X134.145 Y124.888 E-.02074
; WIPE_END
G1 E-.04
G1 X130.214 Y118.346 Z6.48 F30000
G1 X128.727 Y115.871 Z6.48
G1 Z6.08
G1 E.8 F1800
; LINE_WIDTH: 0.389702
G1 F1200
M204 S5000
G1 X128.935 Y115.896 E.00374
; LINE_WIDTH: 0.389362
G3 X131.172 Y116.715 I-1.08 J6.416 E.04259
; LINE_WIDTH: 0.385692
G1 X131.655 Y117.033 E.01017
; LINE_WIDTH: 0.384882
G1 X132.149 Y117.43 E.01113
; LINE_WIDTH: 0.385802
G3 X133.024 Y118.379 I-4.124 J4.68 E.02277
; LINE_WIDTH: 0.389992
G3 X133.681 Y119.46 I-5.303 J3.963 E.02255
; LINE_WIDTH: 0.389352
G3 X134.23 Y121.186 I-6.589 J3.045 E.03229
; LINE_WIDTH: 0.405082
G1 X134.309 Y121.759 E.01072
; LINE_WIDTH: 0.419992
G3 X134.286 Y122.915 I-4.938 J.483 E.02235
; LINE_WIDTH: 0.391682
G1 X134.198 Y123.487 E.01035
; LINE_WIDTH: 0.385992
G1 X134.061 Y124.049 E.01018
; LINE_WIDTH: 0.385792
G3 X133.36 Y125.63 I-6.92 J-2.124 E.03052
; LINE_WIDTH: 0.386982
G1 X133.001 Y126.152 E.01119
; LINE_WIDTH: 0.389792
G3 X132.181 Y127.04 I-5.338 J-4.107 E.02155
; LINE_WIDTH: 0.390622
G1 X131.733 Y127.405 E.01031
G1 X131.021 Y127.871 E.01518
; LINE_WIDTH: 0.384662
G3 X129.41 Y128.505 I-3.422 J-6.331 E.03046
; LINE_WIDTH: 0.384882
G3 X127.114 Y128.646 I-1.533 J-6.224 E.0406
; LINE_WIDTH: 0.388272
G3 X125.984 Y128.408 I.701 J-6.122 E.0205
; LINE_WIDTH: 0.383922
G1 X125.389 Y128.191 E.0111
; LINE_WIDTH: 0.382612
G1 X124.747 Y127.88 E.01243
; LINE_WIDTH: 0.384862
G3 X123.79 Y127.231 I3.01 J-5.47 E.02034
; LINE_WIDTH: 0.384972
G3 X122.966 Y126.422 I4.139 J-5.036 E.0203
; LINE_WIDTH: 0.384572
G1 X122.612 Y125.965 E.01015
; LINE_WIDTH: 0.384902
G3 X122.033 Y124.964 I5.272 J-3.715 E.02033
; LINE_WIDTH: 0.386322
G3 X121.643 Y123.879 I5.617 J-2.635 E.02036
; LINE_WIDTH: 0.385302
G1 X121.521 Y123.313 E.01018
; LINE_WIDTH: 0.387282
G1 X121.45 Y122.739 E.01021
; LINE_WIDTH: 0.431932
G1 X121.423 Y122.574 E.00334
; LINE_WIDTH: 0.476582
G1 X121.395 Y122.408 E.0037
; LINE_WIDTH: 0.521232
G3 X121.394 Y122.114 I.378 J-.148 E.00728
; LINE_WIDTH: 0.477996
G1 X121.421 Y121.987 E.00289
; LINE_WIDTH: 0.434759
G1 X121.447 Y121.859 E.00261
; LINE_WIDTH: 0.391522
G1 X121.528 Y121.158 E.01261
; LINE_WIDTH: 0.390102
G1 X121.667 Y120.53 E.01146
; LINE_WIDTH: 0.389372
G3 X122.735 Y118.366 I6.253 J1.739 E.04316
; LINE_WIDTH: 0.388322
G1 X123.082 Y117.944 E.00967
; LINE_WIDTH: 0.386592
G1 X123.487 Y117.532 E.0102
; LINE_WIDTH: 0.390262
G1 X123.775 Y117.284 E.00678
G1 X124.4 Y116.825 E.01381
; LINE_WIDTH: 0.386242
G3 X125.425 Y116.291 I3.436 J5.347 E.02039
; LINE_WIDTH: 0.387002
G3 X126.527 Y115.949 I2.427 J5.873 E.02042
; LINE_WIDTH: 0.386802
G1 X127.098 Y115.854 E.01021
; LINE_WIDTH: 0.386252
G1 X127.73 Y115.81 E.01117
; LINE_WIDTH: 0.389702
G3 X128.367 Y115.828 I.135 J6.582 E.01134
G1 X128.667 Y115.864 E.00539
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.935 Y115.896 E-.10264
G1 X129.501 Y116.017 E-.21966
G1 X130.053 Y116.188 E-.21958
G1 X130.584 Y116.406 E-.21812
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 72/145
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.48 I-.965 J.741 P1  F30000
G1 X134.66 Y121.715 Z6.48
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.429398
G1 F1200
M204 S5000
G1 X134.682 Y121.767 E.00111
; LINE_WIDTH: 0.470464
G1 X134.705 Y121.819 E.00123
; LINE_WIDTH: 0.51153
G1 X134.727 Y121.871 E.00134
; LINE_WIDTH: 0.552596
G1 X134.749 Y121.922 E.00145
; LINE_WIDTH: 0.593662
G1 X134.772 Y121.974 E.00157
G1 X134.841 Y121.974 E.00192
; LINE_WIDTH: 0.576552
G1 X136.841 Y121.974 E.05386
; LINE_WIDTH: 0.576382
G1 X137.587 Y121.974 E.02008
G1 X137.587 Y122.25 E.00741
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
; LINE_WIDTH: 0.576342
G1 X137.587 Y122.525 E.00741
G1 X137.312 Y122.525 E.00741
; LINE_WIDTH: 0.576502
G1 X134.841 Y122.525 E.06653
; LINE_WIDTH: 0.593662
G1 X134.71 Y122.548 E.00368
G1 X134.696 Y122.635 E.00243
; LINE_WIDTH: 0.551884
G1 X134.681 Y122.721 E.00225
; LINE_WIDTH: 0.510106
G1 X134.666 Y122.807 E.00207
; LINE_WIDTH: 0.468328
G1 X134.651 Y122.893 E.00189
; LINE_WIDTH: 0.42655
G1 X134.637 Y122.98 E.00171
; LINE_WIDTH: 0.386412
G3 X134.398 Y124.178 I-6.504 J-.671 E.02158
; LINE_WIDTH: 0.385762
G3 X133.949 Y125.312 I-6.522 J-1.928 E.0215
; LINE_WIDTH: 0.386102
G3 X133.272 Y126.386 I-5.775 J-2.889 E.02241
; LINE_WIDTH: 0.384502
G1 X132.917 Y126.814 E.00975
; LINE_WIDTH: 0.386142
G3 X132.022 Y127.639 I-4.754 J-4.252 E.02148
; LINE_WIDTH: 0.385492
G3 X130.994 Y128.292 I-3.908 J-5.022 E.02145
; LINE_WIDTH: 0.384682
G3 X129.273 Y128.903 I-3.308 J-6.594 E.03214
; LINE_WIDTH: 0.384052
G1 X128.668 Y129.003 E.01074
; LINE_WIDTH: 0.385022
G1 X128.059 Y129.049 E.01073
; LINE_WIDTH: 0.385442
G3 X126.842 Y128.968 I-.201 J-6.235 E.02148
; LINE_WIDTH: 0.386332
G1 X126.239 Y128.853 E.01082
; LINE_WIDTH: 0.387552
G3 X125.087 Y128.456 I1.498 J-6.205 E.0216
; LINE_WIDTH: 0.386332
G1 X124.543 Y128.181 E.01075
; LINE_WIDTH: 0.386232
G3 X123.538 Y127.49 I3.246 J-5.792 E.02152
; LINE_WIDTH: 0.388262
G3 X122.67 Y126.632 I4.067 J-4.986 E.02166
; LINE_WIDTH: 0.386962
G1 X122.299 Y126.146 E.01079
; LINE_WIDTH: 0.385792
G1 X121.945 Y125.581 E.01175
; LINE_WIDTH: 0.385462
M73 P67 R7
G1 X121.615 Y124.908 E.01318
; LINE_WIDTH: 0.384532
G3 X121.133 Y123.143 I7.228 J-2.922 E.03217
; LINE_WIDTH: 0.385182
G1 X121.079 Y122.533 E.01075
; LINE_WIDTH: 0.385962
G1 X121.08 Y121.921 E.01078
; LINE_WIDTH: 0.387902
G1 X121.136 Y121.305 E.01095
G1 X121.296 Y120.518 E.01421
; LINE_WIDTH: 0.386932
G3 X121.712 Y119.371 I6.344 J1.647 E.02158
; LINE_WIDTH: 0.385792
G3 X122.327 Y118.316 I6.053 J2.821 E.02154
; LINE_WIDTH: 0.387612
G1 X122.692 Y117.841 E.01059
; LINE_WIDTH: 0.390622
G1 X123.033 Y117.47 E.00899
; LINE_WIDTH: 0.392462
G3 X123.965 Y116.681 I4.99 J4.956 E.02192
; LINE_WIDTH: 0.390852
G3 X126.075 Y115.688 I3.907 J5.564 E.04183
; LINE_WIDTH: 0.390262
G1 X126.567 Y115.572 E.00901
; LINE_WIDTH: 0.390512
G1 X127.172 Y115.482 E.01091
; LINE_WIDTH: 0.394952
G3 X128.392 Y115.466 I.707 J7.292 E.02204
; LINE_WIDTH: 0.391552
G1 X128.998 Y115.539 E.01092
; LINE_WIDTH: 0.390842
G3 X131.198 Y116.313 I-1.126 J6.716 E.04184
; LINE_WIDTH: 0.390262
G1 X131.629 Y116.574 E.00899
; LINE_WIDTH: 0.389342
G1 X132.124 Y116.934 E.01087
; LINE_WIDTH: 0.389982
G3 X133.776 Y118.866 I-4.269 J5.325 E.04553
; LINE_WIDTH: 0.386922
G3 X134.286 Y119.976 I-5.667 J3.276 E.0216
; LINE_WIDTH: 0.385772
G1 X134.464 Y120.559 E.01074
; LINE_WIDTH: 0.386022
G1 X134.589 Y121.155 E.01072
; LINE_WIDTH: 0.388332
G1 X134.653 Y121.656 E.00895
; WIPE_START
G1 F1800
M204 S10000
G1 X134.682 Y121.767 E-.04381
G1 X134.705 Y121.819 E-.02145
G1 X134.727 Y121.871 E-.02145
G1 X134.749 Y121.922 E-.02145
G1 X134.772 Y121.974 E-.02145
G1 X134.841 Y121.974 E-.02628
G1 X136.431 Y121.974 E-.60412
; WIPE_END
G1 E-.04
G1 X130.443 Y117.241 Z6.6 F30000
G1 X128.71 Y115.871 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.391552
G1 F1200
M204 S5000
G1 X128.929 Y115.897 E.00396
; LINE_WIDTH: 0.390842
G3 X130.582 Y116.407 I-1.307 J7.164 E.03096
G1 X131.337 Y116.816 E.01532
; LINE_WIDTH: 0.386242
G1 X131.81 Y117.148 E.01018
; LINE_WIDTH: 0.385762
G1 X132.251 Y117.522 E.01018
; LINE_WIDTH: 0.386082
G3 X133.025 Y118.379 I-4.26 J4.63 E.02038
; LINE_WIDTH: 0.389942
G3 X133.682 Y119.46 I-5.53 J4.101 E.02256
; LINE_WIDTH: 0.389562
G3 X134.086 Y120.541 I-6.015 J2.86 E.02055
; LINE_WIDTH: 0.389342
G1 X134.219 Y121.132 E.01076
; LINE_WIDTH: 0.388892
G1 X134.3 Y121.76 E.01125
; LINE_WIDTH: 0.429398
G1 X134.324 Y121.86 E.00202
; LINE_WIDTH: 0.470464
G1 X134.348 Y121.959 E.00223
; LINE_WIDTH: 0.51153
G1 X134.371 Y122.059 E.00243
; LINE_WIDTH: 0.552596
G1 X134.395 Y122.159 E.00264
; LINE_WIDTH: 0.593662
G3 X134.396 Y122.437 I-.384 J.14 E.00788
; LINE_WIDTH: 0.55314
G1 X134.371 Y122.513 E.00208
; LINE_WIDTH: 0.512618
G1 X134.346 Y122.59 E.00192
; LINE_WIDTH: 0.472096
G1 X134.321 Y122.666 E.00176
; LINE_WIDTH: 0.431574
G1 X134.296 Y122.743 E.0016
; LINE_WIDTH: 0.391052
G1 X134.217 Y123.382 E.0115
; LINE_WIDTH: 0.389552
G3 X133.904 Y124.518 I-6.467 J-1.17 E.02098
; LINE_WIDTH: 0.389362
G3 X133.002 Y126.149 I-6.638 J-2.604 E.03324
; LINE_WIDTH: 0.384762
G1 X132.667 Y126.555 E.00923
; LINE_WIDTH: 0.386312
G3 X131.823 Y127.34 I-4.74 J-4.25 E.02036
; LINE_WIDTH: 0.385392
G3 X130.849 Y127.964 I-3.864 J-4.964 E.02036
; LINE_WIDTH: 0.384582
G3 X129.222 Y128.548 I-3.216 J-6.391 E.0304
; LINE_WIDTH: 0.384312
G1 X128.652 Y128.645 E.01014
; LINE_WIDTH: 0.385342
G1 X128.076 Y128.689 E.01016
; LINE_WIDTH: 0.385672
G3 X126.923 Y128.62 I-.205 J-6.255 E.02036
; LINE_WIDTH: 0.388352
G3 X125.8 Y128.35 I.914 J-6.263 E.0205
; LINE_WIDTH: 0.388772
G3 X124.791 Y127.906 I2.133 J-6.215 E.01959
; LINE_WIDTH: 0.388982
G1 X124.302 Y127.61 E.01015
; LINE_WIDTH: 0.389372
G3 X123.778 Y127.222 I4.872 J-7.122 E.0116
; LINE_WIDTH: 0.386472
G1 X123.397 Y126.882 E.00901
; LINE_WIDTH: 0.387502
G3 X122.611 Y125.965 I4.346 J-4.522 E.02138
; LINE_WIDTH: 0.386262
G1 X122.274 Y125.432 E.01113
; LINE_WIDTH: 0.385802
G1 X121.955 Y124.791 E.0126
; LINE_WIDTH: 0.384642
G1 X121.751 Y124.248 E.01018
; LINE_WIDTH: 0.384532
G1 X121.597 Y123.691 E.01014
; LINE_WIDTH: 0.384812
G1 X121.492 Y123.123 E.01014
; LINE_WIDTH: 0.385672
G1 X121.439 Y122.547 E.01017
; LINE_WIDTH: 0.388772
G3 X121.489 Y121.393 I6.618 J-.293 E.02053
; LINE_WIDTH: 0.389912
G3 X121.78 Y120.162 I6.866 J.975 E.02255
; LINE_WIDTH: 0.389582
G3 X122.252 Y119.108 I6.285 J2.18 E.02057
; LINE_WIDTH: 0.389372
G3 X122.955 Y118.09 I5.786 J3.243 E.02203
; LINE_WIDTH: 0.386562
G1 X123.386 Y117.629 E.01113
; LINE_WIDTH: 0.385792
G1 X123.926 Y117.16 E.0126
; LINE_WIDTH: 0.384632
G3 X125.425 Y116.292 I4.35 J5.783 E.03046
; LINE_WIDTH: 0.385252
G1 X125.968 Y116.096 E.01016
; LINE_WIDTH: 0.386242
G3 X127.098 Y115.854 I1.89 J6.069 E.02039
; LINE_WIDTH: 0.394952
G3 X128.355 Y115.83 I.791 J8.364 E.02272
; LINE_WIDTH: 0.391552
G1 X128.65 Y115.864 E.00531
; CHANGE_LAYER
; Z_HEIGHT: 6.22737
; LAYER_HEIGHT: 0.0273685
; WIPE_START
G1 F1800
M204 S10000
G1 X128.929 Y115.897 E-.10685
G1 X129.495 Y116.018 E-.21981
G1 X130.047 Y116.188 E-.21957
G1 X130.568 Y116.401 E-.21377
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 73/145
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.6 I-.16 J-1.206 P1  F30000
G1 X125.484 Y117.074 Z6.6
G1 Z6.227
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1200
G2 X125.014 Y117.317 I3.186 J6.722 E.02118
G1 X130.736 Y117.317 E.22903
G3 X130.837 Y117.378 I-.771 J1.406 E.00471
G3 X133.199 Y120.212 I-2.949 J4.859 E.15037
G1 X122.55 Y120.212 E.42623
G2 X122.237 Y123.106 I5.314 J2.037 E.11782
G1 X133.511 Y123.106 E.45123
G3 X132.17 Y126 I-5.615 J-.843 E.12941
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
G1 X123.58 Y126 E.34384
G1 X123.699 Y126.133 E.00715
G2 X124.188 Y126.6 I5.061 J-4.81 E.02709
G2 X132.038 Y126.146 I3.687 J-4.35 E.34724
; CHANGE_LAYER
; Z_HEIGHT: 6.32
; LAYER_HEIGHT: 0.0926318
; WIPE_START
G1 F7329.351
G1 X131.187 Y126.892 E-.43009
G1 X130.44 Y127.334 E-.32991
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/145
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.627 I.909 J.809 P1  F30000
G1 X134.668 Y122.579 Z6.627
G1 Z6.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389702
; LAYER_HEIGHT: 0.12
G1 F1200
M204 S5000
G1 X134.623 Y123.123 E.00971
; LINE_WIDTH: 0.391142
G3 X134.375 Y124.262 I-7.046 J-.936 E.02085
; LINE_WIDTH: 0.389362
G3 X133.911 Y125.391 I-6.506 J-2.015 E.02173
; LINE_WIDTH: 0.389552
G3 X133.254 Y126.418 I-6.084 J-3.17 E.02172
; LINE_WIDTH: 0.388862
G1 X132.773 Y126.97 E.01299
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
; LINE_WIDTH: 0.385822
G1 X132.182 Y127.513 E.01413
; LINE_WIDTH: 0.384842
G3 X131.174 Y128.197 I-4.256 J-5.186 E.02142
; LINE_WIDTH: 0.384652
G1 X130.625 Y128.467 E.01074
; LINE_WIDTH: 0.384082
G1 X130.054 Y128.691 E.01073
; LINE_WIDTH: 0.385202
G3 X128.867 Y128.977 I-2.093 J-6.078 E.0215
; LINE_WIDTH: 0.386702
G1 X128.258 Y129.043 E.01082
; LINE_WIDTH: 0.388092
G3 X127.037 Y129.001 I-.393 J-6.336 E.02166
; LINE_WIDTH: 0.389872
G1 X126.302 Y128.87 E.0133
; LINE_WIDTH: 0.390852
G3 X125.16 Y128.489 I1.635 J-6.816 E.02151
; LINE_WIDTH: 0.389362
G1 X124.617 Y128.224 E.01074
; LINE_WIDTH: 0.389682
G3 X123.627 Y127.565 I3.284 J-6.011 E.0212
; LINE_WIDTH: 0.389922
G3 X122.366 Y126.243 I4.963 J-5.997 E.0326
; LINE_WIDTH: 0.390262
G3 X121.741 Y125.195 I5.751 J-4.137 E.02177
; LINE_WIDTH: 0.389962
G1 X121.464 Y124.524 E.01294
; LINE_WIDTH: 0.385772
G1 X121.286 Y123.938 E.01077
; LINE_WIDTH: 0.388152
G1 X121.155 Y123.321 E.01118
; LINE_WIDTH: 0.389002
G1 X121.083 Y122.669 E.01164
; LINE_WIDTH: 0.389752
G1 X121.075 Y122.004 E.01185
; LINE_WIDTH: 0.390252
G1 X121.137 Y121.304 E.01252
; LINE_WIDTH: 0.391512
G3 X121.439 Y120.043 I6.827 J.967 E.02322
; LINE_WIDTH: 0.390842
G3 X121.936 Y118.929 I6.435 J2.206 E.02181
; LINE_WIDTH: 0.391482
G1 X122.258 Y118.41 E.01092
; LINE_WIDTH: 0.392352
G3 X123.032 Y117.469 I6.007 J4.151 E.02187
; LINE_WIDTH: 0.389562
G3 X123.965 Y116.681 I4.874 J4.817 E.02175
; LINE_WIDTH: 0.388802
G1 X124.573 Y116.3 E.01273
; LINE_WIDTH: 0.392972
G3 X125.587 Y115.842 I3.489 J6.374 E.02001
; LINE_WIDTH: 0.390832
G3 X126.769 Y115.536 I2.288 J6.408 E.02181
; LINE_WIDTH: 0.394752
G1 X127.375 Y115.467 E.01101
G1 X128.397 Y115.466 E.01844
; LINE_WIDTH: 0.391412
G1 X128.998 Y115.539 E.01081
; LINE_WIDTH: 0.390852
G3 X130.086 Y115.815 I-1.115 J6.67 E.02008
; LINE_WIDTH: 0.390272
G1 X130.556 Y115.995 E.00896
; LINE_WIDTH: 0.389542
G3 X131.631 Y116.575 I-2.722 J6.335 E.02174
; LINE_WIDTH: 0.388702
G1 X132.055 Y116.881 E.00929
; LINE_WIDTH: 0.386912
G1 X132.518 Y117.278 E.01076
; LINE_WIDTH: 0.385762
G3 X133.328 Y118.182 I-4.654 J4.983 E.0214
; LINE_WIDTH: 0.392902
G3 X133.918 Y119.123 I-5.526 J4.123 E.01995
; LINE_WIDTH: 0.390842
G1 X134.174 Y119.677 E.01089
; LINE_WIDTH: 0.391152
G3 X134.487 Y120.643 I-6.773 J2.731 E.01816
; LINE_WIDTH: 0.389392
G1 X134.593 Y121.166 E.00948
; LINE_WIDTH: 0.388902
G1 X134.667 Y121.824 E.01176
; LINE_WIDTH: 0.389702
G3 X134.675 Y122.489 I-6.825 J.423 E.01185
G1 X134.673 Y122.519 E.00053
; WIPE_START
G1 F1800
M204 S10000
G1 X134.623 Y123.123 E-.23025
G1 X134.51 Y123.756 E-.2444
G1 X134.375 Y124.262 E-.19888
G1 X134.298 Y124.476 E-.08648
; WIPE_END
G1 E-.04
G1 X130.144 Y118.074 Z6.72 F30000
G1 X128.71 Y115.863 Z6.72
G1 Z6.32
G1 E.8 F1800
; LINE_WIDTH: 0.384872
G1 F1200
M204 S5000
G1 X129.207 Y115.947 E.00886
; LINE_WIDTH: 0.385222
G1 X129.766 Y116.091 E.01014
; LINE_WIDTH: 0.386242
G3 X130.835 Y116.527 I-1.856 J6.075 E.02038
; LINE_WIDTH: 0.386872
G1 X131.379 Y116.843 E.0111
; LINE_WIDTH: 0.387622
G3 X132.252 Y117.521 I-3.399 J5.274 E.01958
; LINE_WIDTH: 0.386252
G3 X133.448 Y119.019 I-4.85 J5.103 E.0339
; LINE_WIDTH: 0.384652
G1 X133.717 Y119.535 E.0102
; LINE_WIDTH: 0.385492
G1 X133.92 Y120.022 E.00928
; LINE_WIDTH: 0.386262
G1 X134.108 Y120.62 E.01105
; LINE_WIDTH: 0.387162
G3 X134.299 Y121.76 I-6.105 J1.607 E.02045
; LINE_WIDTH: 0.385972
G1 X134.317 Y122.338 E.01018
; LINE_WIDTH: 0.385112
G1 X134.283 Y122.915 E.01016
; LINE_WIDTH: 0.384982
G1 X134.206 Y123.438 E.00927
; LINE_WIDTH: 0.386162
G3 X133.875 Y124.596 I-6.175 J-1.137 E.02127
; LINE_WIDTH: 0.385782
G3 X133.36 Y125.629 I-5.999 J-2.346 E.02035
; LINE_WIDTH: 0.386892
G1 X133.005 Y126.148 E.0111
; LINE_WIDTH: 0.389822
G1 X132.591 Y126.636 E.01138
; LINE_WIDTH: 0.392912
G3 X131.737 Y127.402 I-5.487 J-5.259 E.02063
; LINE_WIDTH: 0.390852
G3 X130.785 Y127.994 I-3.858 J-5.146 E.02003
; LINE_WIDTH: 0.390752
G1 X130.141 Y128.278 E.01256
; LINE_WIDTH: 0.390282
G1 X129.534 Y128.473 E.01135
; LINE_WIDTH: 0.389972
G3 X128.28 Y128.68 I-1.725 J-6.535 E.02268
; LINE_WIDTH: 0.387922
G1 X127.69 Y128.69 E.01044
; LINE_WIDTH: 0.388362
G3 X126.543 Y128.552 I.183 J-6.364 E.02051
; LINE_WIDTH: 0.384072
G1 X125.984 Y128.408 E.01012
; LINE_WIDTH: 0.386562
G3 X124.869 Y127.948 I1.859 J-6.09 E.0213
; LINE_WIDTH: 0.386402
G1 X124.413 Y127.683 E.0093
; LINE_WIDTH: 0.385892
G3 X123.499 Y126.977 I3.383 J-5.325 E.02036
; LINE_WIDTH: 0.384542
G1 X123.093 Y126.566 E.01014
; LINE_WIDTH: 0.386092
G3 X122.4 Y125.643 I4.582 J-4.162 E.02037
; LINE_WIDTH: 0.386242
G1 X122.116 Y125.139 E.01019
; LINE_WIDTH: 0.389982
G3 X121.665 Y123.96 I6.066 J-2.998 E.02252
; LINE_WIDTH: 0.389342
G1 X121.52 Y123.313 E.01178
; LINE_WIDTH: 0.386482
G1 X121.451 Y122.739 E.01019
; LINE_WIDTH: 0.385872
G1 X121.433 Y122.162 E.01018
; LINE_WIDTH: 0.385032
G1 X121.468 Y121.584 E.01016
; LINE_WIDTH: 0.383822
G1 X121.544 Y121.062 E.00924
; LINE_WIDTH: 0.384572
G3 X122.747 Y118.352 I6.521 J1.273 E.05245
; LINE_WIDTH: 0.386312
G3 X123.63 Y117.403 I4.99 J3.756 E.0229
; LINE_WIDTH: 0.385772
G1 X123.632 Y117.401 E.00005
; LINE_WIDTH: 0.386872
G3 X124.728 Y116.627 I4.264 J4.877 E.02373
; LINE_WIDTH: 0.386522
G1 X125.422 Y116.293 E.01359
; LINE_WIDTH: 0.384672
G1 X125.968 Y116.096 E.01019
; LINE_WIDTH: 0.384542
G3 X127.098 Y115.855 I1.906 J6.154 E.02029
G1 X128.054 Y115.813 E.01679
; LINE_WIDTH: 0.384872
G3 X128.65 Y115.855 I-.141 J6.238 E.01049
; CHANGE_LAYER
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X129.207 Y115.947 E-.21459
G1 X129.766 Y116.091 E-.2193
G1 X130.311 Y116.285 E-.21956
G1 X130.565 Y116.402 E-.10655
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 75/145
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.72 I-1.012 J.676 P1  F30000
G1 X134.67 Y122.552 Z6.72
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.389802
G1 F1200
M204 S5000
G1 X134.623 Y123.122 E.01017
; LINE_WIDTH: 0.391092
G3 X134.375 Y124.262 I-7.048 J-.935 E.02087
; LINE_WIDTH: 0.389352
G3 X132.858 Y126.884 I-6.748 J-2.156 E.05427
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
; LINE_WIDTH: 0.390452
G3 X131.95 Y127.699 I-5.083 J-4.746 E.02179
; LINE_WIDTH: 0.389372
G1 X131.467 Y128.03 E.0104
; LINE_WIDTH: 0.388972
G1 X130.939 Y128.326 E.01074
; LINE_WIDTH: 0.388782
G1 X130.443 Y128.546 E.00965
; LINE_WIDTH: 0.384112
G1 X129.866 Y128.752 E.01073
; LINE_WIDTH: 0.384702
G3 X128.67 Y129.001 I-1.892 J-6.071 E.02147
; LINE_WIDTH: 0.383892
G1 X128.06 Y129.047 E.01072
; LINE_WIDTH: 0.385512
G3 X126.842 Y128.968 I-.222 J-6.04 E.0215
; LINE_WIDTH: 0.386242
G1 X126.239 Y128.853 E.01082
; LINE_WIDTH: 0.387662
G3 X125.087 Y128.456 I1.479 J-6.15 E.0216
; LINE_WIDTH: 0.386302
G3 X124.025 Y127.859 I2.797 J-6.221 E.02151
; LINE_WIDTH: 0.386182
G1 X123.538 Y127.49 E.01076
; LINE_WIDTH: 0.388022
G3 X122.67 Y126.632 I4.039 J-4.957 E.02164
; LINE_WIDTH: 0.386892
G1 X122.299 Y126.144 E.01083
; LINE_WIDTH: 0.387182
G3 X121.615 Y124.908 I5.15 J-3.656 E.02503
; LINE_WIDTH: 0.384532
G3 X121.243 Y123.745 I5.979 J-2.553 E.02145
; LINE_WIDTH: 0.384692
G1 X121.133 Y123.143 E.01074
; LINE_WIDTH: 0.385212
G1 X121.079 Y122.533 E.01075
; LINE_WIDTH: 0.385892
G1 X121.08 Y121.921 E.01078
; LINE_WIDTH: 0.388002
M73 P67 R6
G1 X121.136 Y121.302 E.01101
G1 X121.296 Y120.518 E.01416
; LINE_WIDTH: 0.386812
G3 X121.712 Y119.371 I6.37 J1.656 E.02157
; LINE_WIDTH: 0.385792
G1 X121.994 Y118.83 E.01074
; LINE_WIDTH: 0.386382
G1 X122.298 Y118.354 E.00995
; LINE_WIDTH: 0.387592
G1 X122.705 Y117.826 E.0118
; LINE_WIDTH: 0.388952
G3 X123.731 Y116.855 I5.009 J4.269 E.02512
; LINE_WIDTH: 0.385782
G3 X124.756 Y116.204 I4.156 J5.411 E.02141
; LINE_WIDTH: 0.389362
G3 X125.691 Y115.806 I2.942 J5.605 E.01808
; LINE_WIDTH: 0.391512
G3 X126.769 Y115.536 I2.209 J6.548 E.01989
; LINE_WIDTH: 0.394752
G1 X127.375 Y115.467 E.01101
G1 X128.397 Y115.466 E.01844
; LINE_WIDTH: 0.391372
G1 X128.998 Y115.539 E.01081
; LINE_WIDTH: 0.390842
G3 X130.742 Y116.079 I-1.38 J7.539 E.03269
; LINE_WIDTH: 0.391472
G3 X131.799 Y116.691 I-2.92 J6.263 E.02185
; LINE_WIDTH: 0.390832
G3 X133.136 Y117.935 I-4.514 J6.192 E.03268
; LINE_WIDTH: 0.392912
G3 X133.823 Y118.943 I-5.57 J4.531 E.02193
; LINE_WIDTH: 0.390212
G1 X134.094 Y119.49 E.01087
; LINE_WIDTH: 0.391082
G3 X134.487 Y120.643 I-6.6 J2.894 E.02179
; LINE_WIDTH: 0.389392
G1 X134.594 Y121.168 E.00952
; LINE_WIDTH: 0.388912
G1 X134.667 Y121.825 E.01173
; LINE_WIDTH: 0.389692
G1 X134.675 Y122.489 E.01182
; LINE_WIDTH: 0.389802
G1 X134.675 Y122.492 E.00007
; WIPE_START
G1 F1800
M204 S10000
G1 X134.623 Y123.122 E-.23991
G1 X134.509 Y123.759 E-.24622
G1 X134.375 Y124.262 E-.19763
G1 X134.308 Y124.451 E-.07624
; WIPE_END
G1 E-.04
G1 X130.117 Y118.072 Z6.84 F30000
G1 X128.662 Y115.857 Z6.84
M73 P68 R6
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.384852
G1 F1200
M204 S5000
G1 X128.683 Y115.859 E.00038
G3 X129.207 Y115.947 I-.769 J6.186 E.00933
; LINE_WIDTH: 0.384532
G3 X130.835 Y116.528 I-1.604 J7.064 E.03039
; LINE_WIDTH: 0.384832
G3 X131.81 Y117.149 I-3.013 J5.805 E.02032
; LINE_WIDTH: 0.384522
G3 X133.025 Y118.379 I-4.51 J5.668 E.0304
; LINE_WIDTH: 0.385812
G3 X133.697 Y119.492 I-5.057 J3.814 E.02292
; LINE_WIDTH: 0.385432
G1 X133.919 Y120.024 E.01015
; LINE_WIDTH: 0.386272
G1 X134.108 Y120.62 E.01102
; LINE_WIDTH: 0.387122
G3 X134.299 Y121.76 I-6.114 J1.609 E.02045
; LINE_WIDTH: 0.385972
G1 X134.317 Y122.338 E.01018
; LINE_WIDTH: 0.385132
G1 X134.283 Y122.915 E.01016
; LINE_WIDTH: 0.385002
G1 X134.206 Y123.44 E.00933
; LINE_WIDTH: 0.386162
G3 X133.875 Y124.596 I-6.171 J-1.138 E.02122
; LINE_WIDTH: 0.385792
G3 X131.823 Y127.341 I-6.024 J-2.365 E.06105
; LINE_WIDTH: 0.386222
G3 X130.325 Y128.207 I-4.296 J-5.701 E.03058
; LINE_WIDTH: 0.383792
G1 X129.781 Y128.403 E.01011
; LINE_WIDTH: 0.384592
G3 X128.652 Y128.644 I-1.873 J-6.008 E.02029
; LINE_WIDTH: 0.384152
G1 X128.076 Y128.688 E.01012
; LINE_WIDTH: 0.385732
G3 X126.923 Y128.62 I-.213 J-6.176 E.02036
; LINE_WIDTH: 0.388402
G3 X125.8 Y128.35 I.917 J-6.275 E.0205
; LINE_WIDTH: 0.388812
G3 X124.793 Y127.907 I2.134 J-6.218 E.01956
; LINE_WIDTH: 0.389002
G1 X124.303 Y127.611 E.01016
; LINE_WIDTH: 0.389372
G1 X123.856 Y127.283 E.00985
G1 X123.393 Y126.878 E.01094
; LINE_WIDTH: 0.387612
G3 X122.611 Y125.965 I4.345 J-4.512 E.0213
; LINE_WIDTH: 0.387962
G3 X121.955 Y124.791 I5.183 J-3.667 E.02386
; LINE_WIDTH: 0.384642
G1 X121.751 Y124.248 E.01018
; LINE_WIDTH: 0.384532
G1 X121.597 Y123.691 E.01014
; LINE_WIDTH: 0.385082
G1 X121.492 Y123.123 E.01015
; LINE_WIDTH: 0.385702
G1 X121.439 Y122.547 E.01018
; LINE_WIDTH: 0.388802
G3 X121.489 Y121.393 I6.63 J-.292 E.02053
; LINE_WIDTH: 0.389902
G3 X121.78 Y120.162 I6.844 J.97 E.02254
; LINE_WIDTH: 0.389552
G3 X122.252 Y119.108 I6.268 J2.171 E.02056
; LINE_WIDTH: 0.389362
G1 X122.554 Y118.617 E.01025
; LINE_WIDTH: 0.388702
G1 X122.954 Y118.091 E.01174
; LINE_WIDTH: 0.386522
G1 X123.382 Y117.633 E.01105
; LINE_WIDTH: 0.389832
G3 X124.331 Y116.871 I4.657 J4.831 E.02169
; LINE_WIDTH: 0.389372
G3 X126.527 Y115.95 I3.578 J5.455 E.04256
; LINE_WIDTH: 0.384572
G1 X127.098 Y115.855 E.01016
G1 X128.054 Y115.813 E.01679
; LINE_WIDTH: 0.384852
G1 X128.602 Y115.853 E.00964
; CHANGE_LAYER
; Z_HEIGHT: 6.49895
; LAYER_HEIGHT: 0.0589471
; WIPE_START
G1 F1800
M204 S10000
G1 X128.683 Y115.859 E-.03105
G1 X129.207 Y115.947 E-.20187
G1 X129.766 Y116.091 E-.21932
G1 X130.31 Y116.286 E-.21955
G1 X130.521 Y116.383 E-.08822
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 76/145
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.84 I-.165 J-1.206 P1  F30000
G1 X125.484 Y117.074 Z6.84
G1 Z6.499
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1200
G2 X125.014 Y117.317 I3.531 J7.388 E.02118
G1 X130.736 Y117.317 E.22903
G3 X132.724 Y119.249 I-2.873 J4.946 E.11207
G1 X132.793 Y119.364 E.00534
G3 X133.199 Y120.212 I-5.301 J3.058 E.03766
G1 X122.548 Y120.215 E.42628
G2 X122.413 Y120.614 I4.802 J1.854 E.01684
G2 X122.237 Y123.106 I5.531 J1.642 E.1008
G1 X133.511 Y123.106 E.45123
G3 X133.383 Y123.727 I-5.429 J-.8 E.02539
G1 X133.365 Y123.791 E.00265
G3 X132.17 Y126 I-5.554 J-1.575 E.10134
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
G1 X123.58 Y126 E.34384
G2 X132.038 Y126.146 I4.295 J-3.751 E.38148
; CHANGE_LAYER
; Z_HEIGHT: 6.56
; LAYER_HEIGHT: 0.0610528
; WIPE_START
G1 F7329.351
G1 X131.227 Y126.863 E-.41137
G1 X130.433 Y127.322 E-.34864
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/145
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.899 I.913 J.805 P1  F30000
G1 X134.665 Y122.52 Z6.899
G1 Z6.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384772
; LAYER_HEIGHT: 0.12
G1 F1200
M204 S5000
G1 X134.637 Y122.981 E.0081
; LINE_WIDTH: 0.385332
G1 X134.544 Y123.585 E.01075
; LINE_WIDTH: 0.385762
G3 X133.952 Y125.307 I-7.449 J-1.6 E.03214
; LINE_WIDTH: 0.392902
G3 X133.375 Y126.255 I-6.157 J-3.097 E.01994
; LINE_WIDTH: 0.390842
G1 X132.994 Y126.732 E.01091
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
; LINE_WIDTH: 0.392912
G3 X132.111 Y127.575 I-5.381 J-4.751 E.02193
; LINE_WIDTH: 0.389362
G1 X131.635 Y127.921 E.01046
; LINE_WIDTH: 0.388952
G1 X131.184 Y128.196 E.00938
; LINE_WIDTH: 0.388772
G3 X130.009 Y128.711 I-3.299 J-5.92 E.02281
; LINE_WIDTH: 0.388602
G1 X129.476 Y128.859 E.00981
; LINE_WIDTH: 0.384342
G1 X128.875 Y128.976 E.01073
; LINE_WIDTH: 0.384712
G3 X127.656 Y129.044 I-.967 J-6.292 E.02147
; LINE_WIDTH: 0.383802
G1 X127.045 Y128.998 E.01072
; LINE_WIDTH: 0.385472
G3 X125.853 Y128.739 I.677 J-5.99 E.0215
; LINE_WIDTH: 0.386292
G3 X124.715 Y128.273 I1.7 J-5.764 E.02171
; LINE_WIDTH: 0.386172
G1 X124.025 Y127.859 E.01418
G1 X123.538 Y127.491 E.01075
; LINE_WIDTH: 0.386462
G3 X122.669 Y126.63 I4.348 J-5.261 E.02159
; LINE_WIDTH: 0.387602
G1 X122.292 Y126.14 E.01095
; LINE_WIDTH: 0.388752
G1 X121.927 Y125.555 E.01223
; LINE_WIDTH: 0.389252
G1 X121.655 Y125.01 E.01082
; LINE_WIDTH: 0.390392
G3 X121.262 Y123.855 I6.362 J-2.809 E.02179
; LINE_WIDTH: 0.389412
G1 X121.156 Y123.329 E.00953
; LINE_WIDTH: 0.389032
G3 X121.074 Y122.137 I6.398 J-1.039 E.02126
; LINE_WIDTH: 0.385542
G1 X121.114 Y121.526 E.01077
; LINE_WIDTH: 0.383962
G1 X121.207 Y120.921 E.01073
; LINE_WIDTH: 0.384542
G3 X122.419 Y118.194 I6.864 J1.418 E.05275
; LINE_WIDTH: 0.384102
G1 X122.835 Y117.685 E.01153
; LINE_WIDTH: 0.385762
G3 X124.761 Y116.202 I5.014 J4.521 E.04302
; LINE_WIDTH: 0.386052
G3 X125.89 Y115.746 I2.953 J5.687 E.02148
; LINE_WIDTH: 0.385782
G3 X127.079 Y115.494 I1.942 J6.23 E.02143
; LINE_WIDTH: 0.396372
G3 X128.093 Y115.456 I.748 J6.431 E.01841
; LINE_WIDTH: 0.384882
G3 X129.305 Y115.601 I-.153 J6.412 E.02146
; LINE_WIDTH: 0.385252
G3 X130.467 Y115.964 I-1.311 J6.24 E.02143
; LINE_WIDTH: 0.384522
G3 X131.55 Y116.53 I-2.381 J5.871 E.02147
; LINE_WIDTH: 0.384092
G1 X132.051 Y116.883 E.01073
; LINE_WIDTH: 0.385752
G1 X132.517 Y117.277 E.01074
; LINE_WIDTH: 0.386742
G3 X133.328 Y118.182 I-4.499 J4.845 E.02148
; LINE_WIDTH: 0.392892
G3 X133.953 Y119.193 I-5.495 J4.1 E.02137
; LINE_WIDTH: 0.390512
G1 X134.174 Y119.676 E.00947
; LINE_WIDTH: 0.391032
G3 X134.527 Y120.819 I-6.54 J2.646 E.02139
; LINE_WIDTH: 0.390752
G3 X134.679 Y122.173 I-6.674 J1.435 E.02436
; LINE_WIDTH: 0.390292
G1 X134.675 Y122.371 E.00353
; LINE_WIDTH: 0.384772
G1 X134.669 Y122.46 E.00157
; WIPE_START
G1 F1800
M204 S10000
G1 X134.637 Y122.981 E-.19822
G1 X134.544 Y123.585 E-.23227
G1 X134.398 Y124.178 E-.23213
G1 X134.315 Y124.42 E-.09738
; WIPE_END
G1 E-.04
G1 X130.101 Y118.057 Z6.96 F30000
G1 X128.644 Y115.856 Z6.96
G1 Z6.56
G1 E.8 F1800
; LINE_WIDTH: 0.384832
G1 F1200
M204 S5000
G1 X128.681 Y115.859 E.00065
G3 X129.207 Y115.947 I-.79 J6.325 E.00938
; LINE_WIDTH: 0.385182
G3 X130.31 Y116.286 I-1.293 J6.163 E.0203
; LINE_WIDTH: 0.384522
G3 X131.809 Y117.149 I-2.843 J6.676 E.03041
; LINE_WIDTH: 0.386252
G1 X132.251 Y117.521 E.01018
; LINE_WIDTH: 0.387272
G1 X132.628 Y117.899 E.00944
; LINE_WIDTH: 0.389532
G1 X132.974 Y118.314 E.00961
; LINE_WIDTH: 0.392892
G3 X133.626 Y119.353 I-6.045 J4.517 E.02203
; LINE_WIDTH: 0.390512
G1 X133.834 Y119.808 E.00892
; LINE_WIDTH: 0.391032
G3 X134.168 Y120.886 I-6.31 J2.548 E.02019
; LINE_WIDTH: 0.390752
G3 X134.314 Y122.172 I-6.344 J1.373 E.02313
; LINE_WIDTH: 0.390292
G1 X134.294 Y122.771 E.01069
; LINE_WIDTH: 0.390092
G1 X134.215 Y123.383 E.01099
; LINE_WIDTH: 0.389642
G1 X134.083 Y123.969 E.01069
; LINE_WIDTH: 0.389372
G3 X133.676 Y125.049 I-6.212 J-1.721 E.02054
; LINE_WIDTH: 0.392902
G3 X133.085 Y126.034 I-6.889 J-3.468 E.02065
; LINE_WIDTH: 0.390842
G1 X132.724 Y126.486 E.01032
; LINE_WIDTH: 0.392912
G3 X131.895 Y127.283 I-5.743 J-5.148 E.02066
; LINE_WIDTH: 0.389362
G1 X131.445 Y127.612 E.00991
; LINE_WIDTH: 0.388952
G1 X130.504 Y128.132 E.0191
; LINE_WIDTH: 0.386352
G3 X129.41 Y128.506 I-2.568 J-5.722 E.02041
; LINE_WIDTH: 0.383912
G1 X128.843 Y128.618 E.01012
; LINE_WIDTH: 0.384572
G3 X127.69 Y128.688 I-.957 J-6.22 E.02029
; LINE_WIDTH: 0.384042
G1 X127.114 Y128.646 E.01012
; LINE_WIDTH: 0.385672
G3 X125.984 Y128.407 I.709 J-6.133 E.02035
; LINE_WIDTH: 0.388662
G1 X125.481 Y128.231 E.00946
; LINE_WIDTH: 0.388862
G1 X124.965 Y127.997 E.01007
; LINE_WIDTH: 0.389332
G3 X123.419 Y126.903 I3.306 J-6.307 E.03376
; LINE_WIDTH: 0.388742
G1 X122.969 Y126.427 E.01162
; LINE_WIDTH: 0.387632
G1 X122.611 Y125.965 E.01035
; LINE_WIDTH: 0.386552
G3 X122.032 Y124.965 I5.348 J-3.761 E.02041
; LINE_WIDTH: 0.385792
G3 X121.642 Y123.879 I5.994 J-2.769 E.02033
; LINE_WIDTH: 0.387072
G3 X121.451 Y122.739 I6.079 J-1.604 E.02044
; LINE_WIDTH: 0.385832
G1 X121.433 Y122.162 E.01018
; LINE_WIDTH: 0.385072
G1 X121.468 Y121.584 E.01016
; LINE_WIDTH: 0.383682
G1 X121.553 Y121.013 E.01012
; LINE_WIDTH: 0.384542
G3 X123.082 Y117.946 I6.358 J1.254 E.06083
; LINE_WIDTH: 0.386252
G3 X123.497 Y117.523 I3.775 J3.292 E.01045
G3 X124.9 Y116.535 I4.845 J5.389 E.03033
; LINE_WIDTH: 0.386452
G3 X125.969 Y116.096 I2.919 J5.593 E.02039
; LINE_WIDTH: 0.386262
G3 X127.098 Y115.854 I1.888 J6.046 E.02039
G1 X128.054 Y115.812 E.01687
; LINE_WIDTH: 0.384832
G1 X128.584 Y115.851 E.00933
; CHANGE_LAYER
; Z_HEIGHT: 6.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.681 Y115.859 E-.03682
G1 X129.207 Y115.947 E-.20287
G1 X129.766 Y116.091 E-.21933
G1 X130.31 Y116.286 E-.21956
G1 X130.505 Y116.376 E-.08143
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 78/145
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.96 I-1.006 J.685 P1  F30000
G1 X134.667 Y122.493 Z6.96
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.384802
G1 F1200
M204 S5000
G1 X134.637 Y122.981 E.00858
; LINE_WIDTH: 0.385352
G1 X134.545 Y123.585 E.01075
; LINE_WIDTH: 0.385772
G3 X133.948 Y125.313 I-7.428 J-1.595 E.03226
; LINE_WIDTH: 0.385902
G3 X133.182 Y126.5 I-5.895 J-2.967 E.02493
; LINE_WIDTH: 0.384522
G3 X132.336 Y127.382 I-5.185 J-4.123 E.02146
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
; LINE_WIDTH: 0.385122
G1 X131.825 Y127.786 E.01144
; LINE_WIDTH: 0.385512
G3 X130.813 Y128.382 I-3.718 J-5.16 E.0207
; LINE_WIDTH: 0.384652
G3 X129.668 Y128.807 I-2.778 J-5.722 E.02147
; LINE_WIDTH: 0.383842
G1 X129.07 Y128.943 E.01073
; LINE_WIDTH: 0.385132
G3 X127.854 Y129.05 I-1.164 J-6.305 E.02149
; LINE_WIDTH: 0.386352
G1 X127.241 Y129.023 E.01081
; LINE_WIDTH: 0.387992
G3 X126.041 Y128.8 I.536 J-6.22 E.02166
; LINE_WIDTH: 0.389762
G3 X124.798 Y128.318 I1.752 J-6.368 E.02377
; LINE_WIDTH: 0.390392
G1 X124.1 Y127.911 E.0144
; LINE_WIDTH: 0.391422
G3 X123.167 Y127.162 I3.831 J-5.73 E.02142
; LINE_WIDTH: 0.390842
G3 X122.366 Y126.243 I4.726 J-4.929 E.0218
; LINE_WIDTH: 0.391412
G3 X121.741 Y125.194 I5.59 J-4.04 E.02185
; LINE_WIDTH: 0.392922
G3 X121.342 Y124.148 I6.303 J-3.003 E.02012
; LINE_WIDTH: 0.386212
G1 X121.211 Y123.593 E.01004
; LINE_WIDTH: 0.384022
G3 X121.096 Y121.723 I7.334 J-1.386 E.03291
; LINE_WIDTH: 0.384452
G1 X121.17 Y121.116 E.01074
; LINE_WIDTH: 0.385782
G3 X122.443 Y118.158 I6.87 J1.205 E.05721
; LINE_WIDTH: 0.384542
G3 X124.23 Y116.511 I5.39 J4.058 E.04286
; LINE_WIDTH: 0.384152
G1 X124.761 Y116.205 E.01074
; LINE_WIDTH: 0.385782
G3 X125.893 Y115.744 I2.968 J5.668 E.02154
; LINE_WIDTH: 0.387672
G1 X126.496 Y115.586 E.01103
; LINE_WIDTH: 0.390522
G1 X127.173 Y115.482 E.01222
; LINE_WIDTH: 0.394952
G3 X128.392 Y115.466 I.707 J7.296 E.02202
; LINE_WIDTH: 0.391412
G1 X128.998 Y115.539 E.01091
; LINE_WIDTH: 0.390842
G3 X130.743 Y116.08 I-1.321 J7.35 E.03271
; LINE_WIDTH: 0.391442
G3 X131.735 Y116.648 I-2.844 J6.118 E.02046
; LINE_WIDTH: 0.391102
G1 X132.224 Y117.016 E.01092
; LINE_WIDTH: 0.387722
G1 X132.666 Y117.418 E.01059
; LINE_WIDTH: 0.386802
G1 X133.078 Y117.868 E.01076
; LINE_WIDTH: 0.385772
G3 X133.797 Y118.908 I-4.965 J4.199 E.02228
; LINE_WIDTH: 0.389262
G1 X134.096 Y119.492 E.01167
; LINE_WIDTH: 0.390232
G1 X134.357 Y120.182 E.01315
; LINE_WIDTH: 0.390762
G3 X134.679 Y122.175 I-7.339 J2.209 E.03614
; LINE_WIDTH: 0.390252
G1 X134.675 Y122.371 E.00348
; LINE_WIDTH: 0.384802
G1 X134.671 Y122.433 E.0011
; WIPE_START
G1 F1800
M204 S10000
G1 X134.637 Y122.981 E-.20852
G1 X134.545 Y123.585 E-.23227
G1 X134.398 Y124.178 E-.23207
G1 X134.324 Y124.395 E-.08714
; WIPE_END
G1 E-.04
G1 X130.094 Y118.041 Z7.08 F30000
G1 X128.644 Y115.863 Z7.08
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.391412
G1 F1200
M204 S5000
G1 X128.929 Y115.897 E.00514
; LINE_WIDTH: 0.390842
G3 X130.583 Y116.408 I-1.237 J6.937 E.03096
; LINE_WIDTH: 0.391442
G3 X131.518 Y116.941 I-2.76 J5.922 E.01927
; LINE_WIDTH: 0.391102
G1 X131.961 Y117.268 E.00985
; LINE_WIDTH: 0.387712
G1 X132.385 Y117.648 E.01006
; LINE_WIDTH: 0.389372
G3 X133.089 Y118.468 I-4.748 J4.791 E.01924
; LINE_WIDTH: 0.390312
G3 X133.717 Y119.535 I-5.602 J4.015 E.02211
; LINE_WIDTH: 0.384782
G1 X133.936 Y120.07 E.01014
; LINE_WIDTH: 0.383762
G3 X134.228 Y121.186 I-6.02 J2.171 E.02023
; LINE_WIDTH: 0.384052
G1 X134.298 Y121.76 E.01012
; LINE_WIDTH: 0.385022
G1 X134.317 Y122.338 E.01015
; LINE_WIDTH: 0.385182
G1 X134.283 Y122.915 E.01016
; LINE_WIDTH: 0.385802
G1 X134.198 Y123.487 E.01018
; LINE_WIDTH: 0.386242
G3 X132.918 Y126.258 I-6.51 J-1.327 E.05428
; LINE_WIDTH: 0.384522
G3 X132.12 Y127.096 I-4.993 J-3.956 E.02032
; LINE_WIDTH: 0.385052
G1 X131.634 Y127.481 E.0109
; LINE_WIDTH: 0.385362
G3 X130.677 Y128.05 I-3.654 J-5.058 E.01959
; LINE_WIDTH: 0.384572
G3 X129.596 Y128.457 I-2.747 J-5.659 E.02029
; LINE_WIDTH: 0.384112
G1 X129.033 Y128.587 E.01013
; LINE_WIDTH: 0.385492
M73 P69 R6
G3 X127.883 Y128.692 I-1.148 J-6.205 E.02034
; LINE_WIDTH: 0.388272
G3 X126.733 Y128.591 I-.017 J-6.399 E.0205
; LINE_WIDTH: 0.388652
G3 X125.619 Y128.283 I1.162 J-6.386 E.02053
; LINE_WIDTH: 0.385422
G3 X124.578 Y127.783 I2.139 J-5.777 E.02033
; LINE_WIDTH: 0.385142
G3 X123.643 Y127.107 I3.213 J-5.429 E.0203
; LINE_WIDTH: 0.384562
G3 X122.843 Y126.272 I4.23 J-4.855 E.0203
; LINE_WIDTH: 0.384862
G3 X122.206 Y125.31 I5.089 J-4.061 E.02029
; LINE_WIDTH: 0.384562
G1 X121.955 Y124.789 E.01015
; LINE_WIDTH: 0.385822
G3 X121.565 Y123.543 I5.708 J-2.467 E.02302
; LINE_WIDTH: 0.383952
G3 X121.451 Y121.776 I7.013 J-1.341 E.0311
; LINE_WIDTH: 0.384832
G1 X121.518 Y121.202 E.01014
; LINE_WIDTH: 0.386252
G3 X122.714 Y118.394 I6.546 J1.128 E.05428
; LINE_WIDTH: 0.384682
G1 X123.082 Y117.945 E.01019
; LINE_WIDTH: 0.384522
G3 X123.493 Y117.527 I6.316 J5.801 E.01029
; LINE_WIDTH: 0.384532
G3 X124.901 Y116.535 I4.887 J5.441 E.03027
; LINE_WIDTH: 0.386252
G3 X125.968 Y116.096 I2.926 J5.589 E.02038
; LINE_WIDTH: 0.386362
G3 X127.098 Y115.854 I1.885 J6.056 E.02039
; LINE_WIDTH: 0.394952
G3 X128.355 Y115.829 I.794 J8.369 E.02273
; LINE_WIDTH: 0.391412
G1 X128.584 Y115.856 E.00412
; CHANGE_LAYER
; Z_HEIGHT: 6.77053
; LAYER_HEIGHT: 0.0905266
; WIPE_START
G1 F1800
M204 S10000
G1 X128.929 Y115.897 E-.13196
G1 X129.496 Y116.018 E-.22003
G1 X129.976 Y116.163 E-.19075
G1 X130.506 Y116.377 E-.21726
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 79/145
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.08 I-.167 J-1.205 P1  F30000
G1 X125.485 Y117.072 Z7.08
G1 Z6.771
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1200
G2 X125.067 Y117.286 I2.383 J5.169 E.01879
G1 X125.014 Y117.317 E.00248
G1 X130.736 Y117.317 E.22903
G3 X133.08 Y119.92 I-2.944 J5.007 E.1424
G3 X133.199 Y120.212 I-3.348 J1.541 E.0126
G1 X122.55 Y120.212 E.42623
G2 X122.237 Y123.106 I5.38 J2.045 E.11779
G1 X133.511 Y123.106 E.45124
G3 X132.17 Y126 I-5.637 J-.854 E.1294
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
G1 X123.58 Y126 E.34384
G2 X127.09 Y127.898 I4.291 J-3.743 E.16317
G2 X131.446 Y126.695 I.785 J-5.649 E.18599
G2 X132.038 Y126.146 I-4.145 J-5.064 E.03232
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.0294738
; WIPE_START
G1 F7329.351
G1 X131.446 Y126.695 E-.30668
G1 X131.446 Y126.695 E-.00001
G1 X130.501 Y127.312 E-.42913
G1 X130.442 Y127.336 E-.02419
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/145
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.171 I.92 J.797 P1  F30000
G1 X134.668 Y122.46 Z7.171
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.391092
; LAYER_HEIGHT: 0.12
G1 F1200
M204 S5000
G1 X134.656 Y122.809 E.00624
; LINE_WIDTH: 0.392112
G3 X134.432 Y124.068 I-7.001 J-.593 E.02293
; LINE_WIDTH: 0.389362
G3 X131.635 Y127.922 I-6.563 J-1.823 E.08649
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
; LINE_WIDTH: 0.389072
G1 X131.167 Y128.205 E.00971
; LINE_WIDTH: 0.389272
G1 X130.571 Y128.498 E.01181
G1 X129.82 Y128.765 E.01416
; LINE_WIDTH: 0.386642
G1 X129.266 Y128.91 E.01011
; LINE_WIDTH: 0.388412
G3 X128.026 Y129.053 I-1.38 J-6.503 E.02216
; LINE_WIDTH: 0.388252
G1 X127.458 Y129.038 E.01008
; LINE_WIDTH: 0.384782
G1 X126.848 Y128.972 E.01076
; LINE_WIDTH: 0.386032
G3 X125.665 Y128.677 I.815 J-5.803 E.02152
; LINE_WIDTH: 0.384582
G3 X124.548 Y128.177 I1.892 J-5.722 E.02151
; LINE_WIDTH: 0.386142
G3 X123.539 Y127.491 I2.915 J-5.372 E.02154
; LINE_WIDTH: 0.386642
G3 X122.672 Y126.632 I4.205 J-5.108 E.02156
; LINE_WIDTH: 0.385772
G1 X122.3 Y126.146 E.01078
; LINE_WIDTH: 0.387722
G1 X121.963 Y125.619 E.01107
; LINE_WIDTH: 0.389262
G1 X121.655 Y125.009 E.01214
; LINE_WIDTH: 0.390292
G3 X121.262 Y123.855 I6.344 J-2.802 E.02176
; LINE_WIDTH: 0.389412
G1 X121.155 Y123.325 E.00961
; LINE_WIDTH: 0.389042
G1 X121.083 Y122.667 E.01176
; LINE_WIDTH: 0.389702
G3 X121.114 Y121.526 I6.134 J-.404 E.02033
; LINE_WIDTH: 0.383862
G1 X121.207 Y120.921 E.01072
; LINE_WIDTH: 0.384542
G3 X124.23 Y116.511 I6.719 J1.366 E.09635
; LINE_WIDTH: 0.384192
G1 X124.761 Y116.204 E.01074
; LINE_WIDTH: 0.385772
G3 X129.111 Y115.56 I3.133 J6.152 E.07877
; LINE_WIDTH: 0.386032
G3 X130.284 Y115.89 I-1.147 J6.326 E.0215
; LINE_WIDTH: 0.385782
G3 X132.368 Y117.144 I-2.332 J6.235 E.04305
; LINE_WIDTH: 0.389322
G3 X134.358 Y120.181 I-4.465 J5.096 E.06534
; LINE_WIDTH: 0.388922
G1 X134.528 Y120.821 E.01175
; LINE_WIDTH: 0.389932
G1 X134.637 Y121.496 E.01219
; LINE_WIDTH: 0.390542
G1 X134.679 Y122.178 E.01218
; LINE_WIDTH: 0.391092
G1 X134.671 Y122.4 E.00396
; WIPE_START
G1 F1800
M204 S10000
G1 X134.656 Y122.809 E-.15565
G1 X134.571 Y123.452 E-.24622
G1 X134.432 Y124.068 E-.24016
G1 X134.336 Y124.363 E-.11797
; WIPE_END
G1 E-.04
G1 X130.083 Y118.026 Z7.2 F30000
G1 X128.629 Y115.859 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.389742
G1 F1200
M204 S5000
G1 X128.935 Y115.896 E.00549
; LINE_WIDTH: 0.389372
G1 X129.501 Y116.017 E.01029
; LINE_WIDTH: 0.389892
G3 X130.589 Y116.408 I-1.771 J6.633 E.02059
; LINE_WIDTH: 0.389342
G3 X132.526 Y117.792 I-2.74 J5.883 E.04256
; LINE_WIDTH: 0.385772
G3 X133.796 Y119.71 I-4.641 J4.454 E.04072
; LINE_WIDTH: 0.386762
G3 X134.154 Y120.808 I-5.811 J2.504 E.02042
; LINE_WIDTH: 0.385842
G1 X134.258 Y121.377 E.01017
; LINE_WIDTH: 0.384672
G1 X134.31 Y121.953 E.01015
; LINE_WIDTH: 0.384332
G1 X134.311 Y122.531 E.01013
; LINE_WIDTH: 0.384462
G1 X134.254 Y123.146 E.01083
; LINE_WIDTH: 0.385702
G3 X133.724 Y124.95 I-6.982 J-1.069 E.0332
; LINE_WIDTH: 0.386772
G3 X133.148 Y125.952 I-5.721 J-2.628 E.02042
; LINE_WIDTH: 0.385762
G3 X131.973 Y127.221 I-5.854 J-4.239 E.03052
; LINE_WIDTH: 0.386132
G1 X131.511 Y127.569 E.01019
; LINE_WIDTH: 0.387522
G3 X130.503 Y128.132 I-3.548 J-5.164 E.02045
; LINE_WIDTH: 0.391862
G3 X129.233 Y128.548 I-3.007 J-7.031 E.02395
; LINE_WIDTH: 0.387842
G1 X128.652 Y128.646 E.01043
; LINE_WIDTH: 0.386582
G3 X127.498 Y128.681 I-.767 J-6.237 E.0204
; LINE_WIDTH: 0.384312
G1 X126.923 Y128.621 E.01014
; LINE_WIDTH: 0.385762
G3 X125.801 Y128.347 I.876 J-6.038 E.02035
; LINE_WIDTH: 0.384662
G3 X124.745 Y127.879 I1.96 J-5.845 E.0203
; LINE_WIDTH: 0.388942
G1 X124.303 Y127.61 E.0092
; LINE_WIDTH: 0.389372
G3 X123.419 Y126.902 I3.689 J-5.508 E.02016
; LINE_WIDTH: 0.389522
G3 X122.662 Y126.033 I4.576 J-4.75 E.02052
; LINE_WIDTH: 0.389352
G1 X122.299 Y125.478 E.01178
; LINE_WIDTH: 0.386312
G1 X122.033 Y124.965 E.0102
; LINE_WIDTH: 0.385492
G1 X121.827 Y124.467 E.00947
; LINE_WIDTH: 0.385782
G1 X121.642 Y123.879 E.01085
; LINE_WIDTH: 0.386992
G3 X121.451 Y122.739 I6.089 J-1.605 E.02044
; LINE_WIDTH: 0.385832
G1 X121.433 Y122.161 E.01018
; LINE_WIDTH: 0.385112
G1 X121.468 Y121.584 E.01016
; LINE_WIDTH: 0.383672
G1 X121.553 Y121.013 E.01012
; LINE_WIDTH: 0.384532
G3 X123.487 Y117.533 I6.436 J1.3 E.07095
G3 X124.901 Y116.535 I4.886 J5.423 E.03041
; LINE_WIDTH: 0.386242
G3 X127.714 Y115.81 I3.028 J5.927 E.05162
; LINE_WIDTH: 0.389742
G3 X128.367 Y115.828 I.147 J6.618 E.01163
G1 X128.569 Y115.852 E.00363
; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.935 Y115.896 E-.14009
G1 X129.501 Y116.017 E-.21991
G1 X129.984 Y116.165 E-.19163
G1 X130.492 Y116.369 E-.20837
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 81/145
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.2 I-1.002 J.69 P1  F30000
G1 X134.671 Y122.439 Z7.2
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.384852
G1 F1200
M204 S5000
G1 X134.637 Y122.981 E.00953
; LINE_WIDTH: 0.385372
G3 X134.397 Y124.179 I-6.608 J-.699 E.02152
; LINE_WIDTH: 0.387762
G1 X134.194 Y124.774 E.01112
; LINE_WIDTH: 0.389332
G1 X133.911 Y125.392 E.01209
; LINE_WIDTH: 0.389962
G3 X133.178 Y126.508 I-5.813 J-3.017 E.02381
; LINE_WIDTH: 0.387762
G1 X132.765 Y126.982 E.01113
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
; LINE_WIDTH: 0.389492
G3 X131.786 Y127.819 I-4.904 J-4.749 E.02294
; LINE_WIDTH: 0.389122
G1 X131.169 Y128.204 E.01291
; LINE_WIDTH: 0.387252
G1 X130.624 Y128.472 E.01074
; LINE_WIDTH: 0.385872
G3 X129.473 Y128.862 I-2.765 J-6.274 E.02143
; LINE_WIDTH: 0.388012
G1 X128.837 Y128.987 E.01148
; LINE_WIDTH: 0.388212
G1 X128.328 Y129.04 E.00907
; LINE_WIDTH: 0.390052
G1 X127.825 Y129.054 E.00896
; LINE_WIDTH: 0.390672
G3 X125.648 Y128.679 I.058 J-6.846 E.03958
; LINE_WIDTH: 0.390502
G3 X124.025 Y127.858 I2.565 J-7.091 E.03252
; LINE_WIDTH: 0.386132
G1 X123.539 Y127.491 E.01074
; LINE_WIDTH: 0.386292
G1 X123.112 Y127.106 E.01013
; LINE_WIDTH: 0.386752
G3 X122.299 Y126.147 I4.533 J-4.66 E.02222
; LINE_WIDTH: 0.385792
G1 X121.953 Y125.595 E.01147
; LINE_WIDTH: 0.385562
G1 X121.615 Y124.908 E.01347
; LINE_WIDTH: 0.384532
G3 X121.243 Y123.745 I5.98 J-2.554 E.02145
; LINE_WIDTH: 0.384642
G1 X121.133 Y123.143 E.01074
; LINE_WIDTH: 0.385282
G1 X121.079 Y122.533 E.01075
; LINE_WIDTH: 0.385752
G1 X121.081 Y121.921 E.01078
; LINE_WIDTH: 0.388112
G1 X121.138 Y121.293 E.01118
; LINE_WIDTH: 0.389362
G3 X122.257 Y118.41 I6.995 J1.058 E.05543
; LINE_WIDTH: 0.390262
G1 X122.712 Y117.82 E.01327
; LINE_WIDTH: 0.390812
G1 X123.18 Y117.325 E.01215
; LINE_WIDTH: 0.391352
G3 X124.133 Y116.567 I4.745 J4.985 E.02182
; LINE_WIDTH: 0.390832
G3 X126.97 Y115.506 I3.822 J5.9 E.05448
; LINE_WIDTH: 0.392842
G3 X128.394 Y115.466 I.91 J6.959 E.02562
; LINE_WIDTH: 0.391282
G1 X128.998 Y115.539 E.01086
; LINE_WIDTH: 0.390852
G3 X130.743 Y116.08 I-1.325 J7.361 E.03271
; LINE_WIDTH: 0.391332
G1 X131.284 Y116.362 E.0109
; LINE_WIDTH: 0.392302
G3 X132.382 Y117.153 I-3.475 J5.976 E.0243
; LINE_WIDTH: 0.390792
G3 X134.174 Y119.677 I-4.722 J5.251 E.05568
; LINE_WIDTH: 0.390952
G3 X134.527 Y120.82 I-6.506 J2.635 E.02138
; LINE_WIDTH: 0.390762
G3 X134.679 Y122.181 I-6.679 J1.435 E.02448
; LINE_WIDTH: 0.390212
G1 X134.675 Y122.371 E.00339
; LINE_WIDTH: 0.384852
G1 X134.674 Y122.379 E.00014
; WIPE_START
G1 F1800
M204 S10000
G1 X134.637 Y122.981 E-.22912
G1 X134.545 Y123.585 E-.23225
G1 X134.397 Y124.179 E-.23266
G1 X134.341 Y124.344 E-.06598
; WIPE_END
G1 E-.04
G1 X130.06 Y118.024 Z7.32 F30000
G1 X128.588 Y115.851 Z7.32
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.384782
G1 F1200
M204 S5000
G1 X128.673 Y115.857 E.00149
G3 X129.207 Y115.947 I-.782 J6.321 E.00952
; LINE_WIDTH: 0.385112
G3 X130.31 Y116.286 I-1.296 J6.176 E.0203
; LINE_WIDTH: 0.384522
G1 X130.835 Y116.528 E.01014
; LINE_WIDTH: 0.384762
G3 X131.958 Y117.268 I-2.96 J5.715 E.02365
; LINE_WIDTH: 0.383502
G1 X132.39 Y117.655 E.01015
; LINE_WIDTH: 0.384512
G3 X133.717 Y119.535 I-4.503 J4.588 E.04058
; LINE_WIDTH: 0.385322
G3 X134.107 Y120.621 I-5.806 J2.7 E.02031
; LINE_WIDTH: 0.383872
G3 X134.298 Y121.76 I-6.264 J1.635 E.02026
; LINE_WIDTH: 0.385072
G1 X134.317 Y122.338 E.01016
; LINE_WIDTH: 0.385232
G1 X134.283 Y122.915 E.01016
; LINE_WIDTH: 0.385832
G3 X134.061 Y124.048 I-6.365 J-.656 E.02036
; LINE_WIDTH: 0.386262
G3 X133.641 Y125.124 I-6.107 J-1.769 E.02039
; LINE_WIDTH: 0.385772
G1 X133.36 Y125.63 E.01017
; LINE_WIDTH: 0.389942
G3 X132.538 Y126.696 I-5.838 J-3.651 E.02402
; LINE_WIDTH: 0.386242
G1 X132.12 Y127.096 E.01018
; LINE_WIDTH: 0.386592
G1 X131.639 Y127.479 E.01086
; LINE_WIDTH: 0.387422
G3 X130.503 Y128.132 I-3.706 J-5.127 E.02321
; LINE_WIDTH: 0.386192
G1 X129.965 Y128.344 E.01019
; LINE_WIDTH: 0.385702
G1 X129.41 Y128.507 E.01018
; LINE_WIDTH: 0.387562
G1 X128.807 Y128.625 E.01087
; LINE_WIDTH: 0.388212
G3 X127.69 Y128.69 I-.929 J-6.353 E.01985
; LINE_WIDTH: 0.385892
G1 X127.114 Y128.646 E.01017
; LINE_WIDTH: 0.385792
G3 X124.915 Y127.972 I.749 J-6.366 E.04071
; LINE_WIDTH: 0.389522
G3 X123.855 Y127.283 I3.033 J-5.823 E.02252
; LINE_WIDTH: 0.389382
G1 X123.419 Y126.903 E.01028
; LINE_WIDTH: 0.388852
G1 X122.972 Y126.431 E.01154
; LINE_WIDTH: 0.389382
G1 X122.661 Y126.032 E.00899
; LINE_WIDTH: 0.390232
G1 X122.344 Y125.549 E.01029
; LINE_WIDTH: 0.392602
G3 X121.846 Y124.512 I6.332 J-3.678 E.02065
; LINE_WIDTH: 0.390842
G3 X121.516 Y123.267 I6.122 J-2.293 E.02303
; LINE_WIDTH: 0.390042
G1 X121.446 Y122.647 E.01111
; LINE_WIDTH: 0.389582
G1 X121.437 Y122.024 E.01108
; LINE_WIDTH: 0.388862
G1 X121.489 Y121.393 E.01125
; LINE_WIDTH: 0.386512
G1 X121.592 Y120.824 E.01019
; LINE_WIDTH: 0.385782
M73 P70 R6
G3 X122.834 Y118.24 I6.496 J1.531 E.05087
; LINE_WIDTH: 0.383502
G1 X123.213 Y117.804 E.01011
; LINE_WIDTH: 0.384532
G3 X123.636 Y117.398 I5.851 J5.677 E.01029
; LINE_WIDTH: 0.384782
G3 X124.564 Y116.723 I4.295 J4.93 E.02017
; LINE_WIDTH: 0.384532
G1 X125.073 Y116.449 E.01013
; LINE_WIDTH: 0.385112
G3 X126.154 Y116.042 I2.753 J5.678 E.02032
; LINE_WIDTH: 0.384532
G3 X128.057 Y115.812 I1.785 J6.756 E.03374
; LINE_WIDTH: 0.384782
G1 X128.528 Y115.847 E.00829
; CHANGE_LAYER
; Z_HEIGHT: 7.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.673 Y115.857 E-.05495
G1 X129.207 Y115.947 E-.206
G1 X129.766 Y116.091 E-.21945
G1 X130.31 Y116.286 E-.21948
G1 X130.454 Y116.352 E-.06012
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 82/145
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.32 I-.998 J.696 P1  F30000
G1 X134.673 Y122.403 Z7.32
G1 Z7.04
G1 E.8 F1800
; LINE_WIDTH: 0.390562
G1 F1200
M204 S5000
G1 X134.668 Y122.569 E.00296
; LINE_WIDTH: 0.384492
G1 X134.612 Y123.178 E.01072
; LINE_WIDTH: 0.384292
G1 X134.501 Y123.778 E.01071
; LINE_WIDTH: 0.384532
G3 X134.119 Y124.938 I-6.282 J-1.429 E.02145
; LINE_WIDTH: 0.384292
G1 X133.854 Y125.49 E.01073
; LINE_WIDTH: 0.385782
G3 X131.346 Y128.1 I-5.96 J-3.217 E.0645
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
; LINE_WIDTH: 0.385542
G1 X130.809 Y128.385 E.01069
; LINE_WIDTH: 0.387752
G1 X130.294 Y128.61 E.00996
; LINE_WIDTH: 0.389872
G1 X129.813 Y128.772 E.00903
; LINE_WIDTH: 0.390572
G1 X129.322 Y128.898 E.00905
; LINE_WIDTH: 0.390752
G3 X128.323 Y129.04 I-1.466 J-6.773 E.01801
; LINE_WIDTH: 0.390052
G1 X127.823 Y129.055 E.00891
; LINE_WIDTH: 0.388372
G1 X127.241 Y129.023 E.01033
; LINE_WIDTH: 0.388122
G3 X126.044 Y128.803 I.558 J-6.384 E.02159
; LINE_WIDTH: 0.386692
G1 X125.467 Y128.612 E.01072
; LINE_WIDTH: 0.385572
G1 X124.909 Y128.37 E.01071
; LINE_WIDTH: 0.384582
G3 X123.864 Y127.739 I2.834 J-5.876 E.02144
; LINE_WIDTH: 0.384262
G1 X123.385 Y127.357 E.01073
; LINE_WIDTH: 0.384772
G1 X122.943 Y126.932 E.01078
; LINE_WIDTH: 0.389352
G3 X121.37 Y124.247 I5.094 J-4.786 E.05577
; LINE_WIDTH: 0.390032
G3 X121.112 Y123.003 I6.57 J-2.009 E.02267
; LINE_WIDTH: 0.390542
G3 X121.084 Y121.823 I6.888 J-.759 E.02107
; LINE_WIDTH: 0.389592
G1 X121.137 Y121.293 E.00948
; LINE_WIDTH: 0.389372
G3 X121.662 Y119.475 I7.523 J1.185 E.03373
; LINE_WIDTH: 0.390162
G3 X122.257 Y118.41 I6.305 J2.827 E.02177
; LINE_WIDTH: 0.389372
G3 X125.497 Y115.88 I5.662 J3.912 E.07422
; LINE_WIDTH: 0.383662
G1 X126.08 Y115.691 E.01072
; LINE_WIDTH: 0.384542
G3 X127.894 Y115.453 I1.852 J7.066 E.03217
; LINE_WIDTH: 0.385772
G3 X129.111 Y115.56 I.067 J6.184 E.02154
; LINE_WIDTH: 0.386012
G3 X130.284 Y115.89 I-1.152 J6.347 E.0215
; LINE_WIDTH: 0.385782
G3 X133.207 Y118.025 I-2.395 J6.347 E.06449
; LINE_WIDTH: 0.386512
G3 X133.875 Y119.047 I-5.097 J4.064 E.02158
; LINE_WIDTH: 0.387802
G1 X134.149 Y119.615 E.01116
; LINE_WIDTH: 0.389362
G3 X134.528 Y120.82 I-6.287 J2.64 E.02249
; LINE_WIDTH: 0.389872
G1 X134.637 Y121.493 E.01214
; LINE_WIDTH: 0.390562
G1 X134.679 Y122.183 E.01233
G1 X134.674 Y122.343 E.00285
; WIPE_START
G1 F1800
M204 S10000
G1 X134.668 Y122.569 E-.08587
G1 X134.612 Y123.178 E-.23217
G1 X134.501 Y123.778 E-.23217
G1 X134.353 Y124.31 E-.2098
; WIPE_END
G1 E-.04
G1 X130.062 Y117.998 Z7.44 F30000
G1 X128.604 Y115.853 Z7.44
G1 Z7.04
G1 E.8 F1800
; LINE_WIDTH: 0.386252
G1 F1200
M204 S5000
G1 X129.017 Y115.909 E.00735
; LINE_WIDTH: 0.386442
G3 X130.131 Y116.216 I-1.115 J6.224 E.02041
; LINE_WIDTH: 0.386272
G3 X132.907 Y118.226 I-2.251 J6.03 E.06116
; LINE_WIDTH: 0.387042
G1 X133.229 Y118.665 E.00961
; LINE_WIDTH: 0.389462
G3 X133.796 Y119.71 I-5.753 J3.801 E.02116
; LINE_WIDTH: 0.386192
G3 X134.258 Y121.377 I-6.68 J2.747 E.03056
; LINE_WIDTH: 0.384732
G1 X134.31 Y121.953 E.01015
; LINE_WIDTH: 0.384342
G3 X134.157 Y123.675 I-7.227 J.228 E.0304
; LINE_WIDTH: 0.384532
G3 X133.801 Y124.774 I-6.173 J-1.394 E.02028
; LINE_WIDTH: 0.384672
G1 X133.552 Y125.295 E.01014
; LINE_WIDTH: 0.386252
G3 X131.187 Y127.776 I-5.67 J-3.037 E.06116
; LINE_WIDTH: 0.385982
G1 X130.678 Y128.051 E.01018
; LINE_WIDTH: 0.387752
G3 X129.597 Y128.458 I-2.731 J-5.603 E.02047
; LINE_WIDTH: 0.386132
G1 X129.033 Y128.587 E.01019
; LINE_WIDTH: 0.385672
G1 X128.461 Y128.666 E.01017
; LINE_WIDTH: 0.386872
G1 X127.883 Y128.693 E.01021
; LINE_WIDTH: 0.388502
G3 X126.733 Y128.591 I.005 J-6.58 E.02051
; LINE_WIDTH: 0.388722
G3 X125.618 Y128.284 I1.176 J-6.456 E.02054
; LINE_WIDTH: 0.385762
G1 X125.087 Y128.057 E.01017
; LINE_WIDTH: 0.384652
G3 X123.642 Y127.106 I3.259 J-6.523 E.03042
; LINE_WIDTH: 0.385512
G3 X122.843 Y126.272 I4.166 J-4.794 E.02035
; LINE_WIDTH: 0.385792
G3 X121.954 Y124.789 I5.694 J-4.422 E.03052
; LINE_WIDTH: 0.385782
G3 X121.596 Y123.691 I5.852 J-2.513 E.02036
; LINE_WIDTH: 0.385202
G3 X121.44 Y122.547 I6.169 J-1.425 E.02032
; LINE_WIDTH: 0.386132
G1 X121.438 Y121.969 E.01019
; LINE_WIDTH: 0.386932
G3 X121.592 Y120.824 I6.295 J.264 E.02043
; LINE_WIDTH: 0.385782
G3 X125.604 Y116.222 I6.318 J1.459 E.11189
; LINE_WIDTH: 0.383552
G1 X126.153 Y116.042 E.01012
; LINE_WIDTH: 0.384532
G3 X127.867 Y115.809 I1.813 J6.897 E.03041
; LINE_WIDTH: 0.386252
G3 X128.445 Y115.832 I.04 J6.205 E.01019
G1 X128.544 Y115.845 E.00178
; CHANGE_LAYER
; Z_HEIGHT: 7.04211
; LAYER_HEIGHT: 0.00210524
; WIPE_START
G1 F1800
M204 S10000
G1 X129.017 Y115.909 E-.18129
G1 X129.581 Y116.037 E-.21984
G1 X130.131 Y116.216 E-.21976
G1 X130.468 Y116.359 E-.13911
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 83/145
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.44 I-.173 J-1.205 P1  F30000
G1 X125.485 Y117.072 Z7.44
G1 Z7.042
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1200
G2 X125.014 Y117.317 I2.359 J5.118 E.02127
G1 X130.736 Y117.317 E.22903
G3 X133.199 Y120.212 I-2.868 J4.935 E.15506
G1 X122.549 Y120.212 E.42624
G1 X122.525 Y120.276 E.00278
G2 X122.237 Y123.106 I5.351 J1.973 E.11504
G1 X133.511 Y123.106 E.45124
G3 X132.17 Y126 I-5.637 J-.854 E.1294
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
G1 X123.58 Y126 E.34384
G1 X123.757 Y126.194 E.01051
G2 X127.09 Y127.898 I4.125 J-3.959 E.15264
G2 X132.038 Y126.146 I.779 J-5.665 E.21827
; CHANGE_LAYER
; Z_HEIGHT: 7.16
; LAYER_HEIGHT: 0.117895
; WIPE_START
G1 F7329.351
G1 X131.497 Y126.655 E-.28217
G1 X130.942 Y127.058 E-.26061
G1 X130.443 Y127.336 E-.21722
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/145
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.442 I.926 J.79 P1  F30000
G1 X134.672 Y122.378 Z7.442
G1 Z7.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.390682
; LAYER_HEIGHT: 0.12
G1 F1200
M204 S5000
G1 X134.655 Y122.815 E.00779
; LINE_WIDTH: 0.390802
G3 X132.571 Y127.173 I-6.787 J-.568 E.08814
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
; LINE_WIDTH: 0.391272
G3 X131.638 Y127.919 I-4.776 J-5.018 E.02137
; LINE_WIDTH: 0.390592
G1 X131.209 Y128.181 E.00897
; LINE_WIDTH: 0.390162
G1 X130.761 Y128.413 E.00899
; LINE_WIDTH: 0.388952
G1 X130.29 Y128.612 E.00907
; LINE_WIDTH: 0.389852
G1 X129.812 Y128.773 E.00899
; LINE_WIDTH: 0.390582
G1 X129.324 Y128.898 E.00898
; LINE_WIDTH: 0.390752
G3 X128.325 Y129.039 I-1.469 J-6.774 E.01801
; LINE_WIDTH: 0.390032
G1 X127.821 Y129.055 E.00899
; LINE_WIDTH: 0.388422
G1 X127.241 Y129.023 E.0103
; LINE_WIDTH: 0.388172
G3 X126.044 Y128.803 I.556 J-6.375 E.0216
; LINE_WIDTH: 0.386662
G1 X125.468 Y128.612 E.01072
; LINE_WIDTH: 0.385602
G1 X124.909 Y128.369 E.01072
; LINE_WIDTH: 0.384572
G1 X124.373 Y128.079 E.0107
; LINE_WIDTH: 0.384722
G3 X123.389 Y127.361 I3.462 J-5.774 E.02141
; LINE_WIDTH: 0.384522
G1 X122.949 Y126.936 E.01072
; LINE_WIDTH: 0.385062
G3 X122.19 Y125.983 I4.64 J-4.469 E.02143
; LINE_WIDTH: 0.384532
G3 X121.243 Y123.745 I5.638 J-3.705 E.04286
; LINE_WIDTH: 0.384692
G1 X121.133 Y123.143 E.01075
; LINE_WIDTH: 0.385312
G1 X121.079 Y122.533 E.01075
; LINE_WIDTH: 0.385682
G1 X121.081 Y121.921 E.01078
; LINE_WIDTH: 0.388222
G1 X121.138 Y121.288 E.01127
; LINE_WIDTH: 0.389362
G3 X123.431 Y117.097 I6.746 J.967 E.08676
; LINE_WIDTH: 0.388952
G1 X123.965 Y116.68 E.01204
; LINE_WIDTH: 0.389362
G3 X131.909 Y116.77 I3.909 J5.573 E.1508
; LINE_WIDTH: 0.388922
G1 X132.436 Y117.199 E.01206
; LINE_WIDTH: 0.389342
G3 X133.263 Y118.094 I-4.583 J5.07 E.0217
; LINE_WIDTH: 0.390052
G3 X133.948 Y119.182 I-5.406 J4.161 E.02293
; LINE_WIDTH: 0.389842
G1 X134.174 Y119.676 E.00968
; LINE_WIDTH: 0.389362
G3 X134.529 Y120.827 I-6.311 J2.577 E.02143
; LINE_WIDTH: 0.390552
G3 X134.679 Y122.186 I-6.746 J1.428 E.02442
; LINE_WIDTH: 0.390682
G1 X134.674 Y122.318 E.00237
; WIPE_START
G1 F1800
M204 S10000
G1 X134.655 Y122.815 E-.18874
G1 X134.572 Y123.454 E-.24479
G1 X134.432 Y124.068 E-.23932
G1 X134.361 Y124.286 E-.08715
; WIPE_END
G1 E-.04
G1 X130.05 Y117.987 Z7.56 F30000
G1 X128.588 Y115.851 Z7.56
G1 Z7.16
G1 E.8 F1800
; LINE_WIDTH: 0.386672
G1 F1200
M204 S5000
G1 X129.017 Y115.909 E.00765
G3 X129.581 Y116.037 I-1.12 J6.212 E.01021
; LINE_WIDTH: 0.385772
G3 X131.173 Y116.715 I-2.017 J6.944 E.03052
; LINE_WIDTH: 0.386672
G3 X132.132 Y117.414 I-3.224 J5.433 E.02097
; LINE_WIDTH: 0.386162
G1 X132.526 Y117.792 E.00963
; LINE_WIDTH: 0.385762
G3 X133.23 Y118.668 I-4.603 J4.416 E.01981
; LINE_WIDTH: 0.385542
G1 X133.544 Y119.19 E.01071
; LINE_WIDTH: 0.385992
G3 X134.253 Y121.346 I-5.597 J3.036 E.0402
; LINE_WIDTH: 0.384622
G1 X134.31 Y121.952 E.01068
; LINE_WIDTH: 0.384322
G3 X134.157 Y123.676 I-7.222 J.229 E.03041
; LINE_WIDTH: 0.384522
G3 X133.802 Y124.774 I-6.268 J-1.421 E.02028
; LINE_WIDTH: 0.385062
G3 X133.255 Y125.792 I-5.818 J-2.469 E.02032
; LINE_WIDTH: 0.384522
G3 X132.12 Y127.095 I-5.964 J-4.048 E.0304
; LINE_WIDTH: 0.384952
G1 X131.643 Y127.475 E.01071
; LINE_WIDTH: 0.385522
G1 X131.186 Y127.776 E.00962
; LINE_WIDTH: 0.386522
G1 X130.678 Y128.051 E.01019
; LINE_WIDTH: 0.387912
G3 X129.597 Y128.458 I-2.767 J-5.708 E.02049
; LINE_WIDTH: 0.386162
G1 X129.033 Y128.587 E.01019
; LINE_WIDTH: 0.385712
G1 X128.461 Y128.666 E.01017
; LINE_WIDTH: 0.386832
G1 X127.883 Y128.693 E.01021
; LINE_WIDTH: 0.388522
G3 X126.733 Y128.591 I.006 J-6.588 E.02051
; LINE_WIDTH: 0.388752
G3 X125.619 Y128.284 I1.178 J-6.466 E.02053
; LINE_WIDTH: 0.385802
G1 X125.087 Y128.057 E.01018
; LINE_WIDTH: 0.384642
G1 X124.578 Y127.784 E.01014
; LINE_WIDTH: 0.384752
G1 X124.095 Y127.466 E.01014
; LINE_WIDTH: 0.390842
G1 X123.861 Y127.284 E.00529
G3 X121.515 Y123.263 I4.037 J-5.05 E.08501
; LINE_WIDTH: 0.389982
G1 X121.446 Y122.646 E.01106
; LINE_WIDTH: 0.389562
G1 X121.437 Y122.026 E.01102
; LINE_WIDTH: 0.388902
G1 X121.489 Y121.393 E.01129
; LINE_WIDTH: 0.386392
G1 X121.592 Y120.824 E.01019
; LINE_WIDTH: 0.385782
G3 X123.213 Y117.803 I6.282 J1.425 E.06107
; LINE_WIDTH: 0.386652
G3 X124.107 Y117.024 I4.579 J4.352 E.02096
; LINE_WIDTH: 0.386172
G1 X124.564 Y116.723 E.00965
; LINE_WIDTH: 0.385782
G3 X128.445 Y115.832 I3.341 J5.659 E.0712
; LINE_WIDTH: 0.386672
G1 X128.528 Y115.843 E.00149
; CHANGE_LAYER
; Z_HEIGHT: 7.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X129.017 Y115.909 E-.18754
G1 X129.581 Y116.037 E-.21979
G1 X130.132 Y116.215 E-.2198
G1 X130.453 Y116.352 E-.13287
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 85/145
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.56 I-.995 J.7 P1  F30000
G1 X134.672 Y122.352 Z7.56
G1 Z7.28
G1 E.8 F1800
; LINE_WIDTH: 0.390772
G1 F1200
M204 S5000
G1 X134.651 Y122.836 E.00864
G3 X132.571 Y127.173 I-6.853 J-.618 E.0877
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
; LINE_WIDTH: 0.391232
G3 X131.631 Y127.923 I-4.744 J-4.981 E.02151
; LINE_WIDTH: 0.390612
G1 X131.2 Y128.186 E.00901
; LINE_WIDTH: 0.390122
G1 X130.754 Y128.416 E.00895
; LINE_WIDTH: 0.388982
G1 X130.287 Y128.613 E.009
; LINE_WIDTH: 0.389832
G1 X129.81 Y128.773 E.00895
; LINE_WIDTH: 0.390592
G1 X129.319 Y128.899 E.00904
; LINE_WIDTH: 0.390752
G3 X128.321 Y129.039 I-1.453 J-6.69 E.01802
; LINE_WIDTH: 0.390002
G1 X127.819 Y129.055 E.00894
; LINE_WIDTH: 0.388462
G1 X127.241 Y129.023 E.01026
; LINE_WIDTH: 0.388212
M73 P71 R6
G3 X126.044 Y128.803 I.554 J-6.366 E.0216
; LINE_WIDTH: 0.386622
G1 X125.467 Y128.612 E.01072
; LINE_WIDTH: 0.385642
G1 X124.909 Y128.37 E.0107
; LINE_WIDTH: 0.384792
G3 X123.388 Y127.36 I3.479 J-6.894 E.03212
; LINE_WIDTH: 0.384532
G3 X121.243 Y123.745 I4.587 J-5.166 E.07494
; LINE_WIDTH: 0.384722
G1 X121.133 Y123.142 E.01074
; LINE_WIDTH: 0.385332
G1 X121.079 Y122.533 E.01075
; LINE_WIDTH: 0.385662
G1 X121.081 Y121.921 E.01078
; LINE_WIDTH: 0.388252
G1 X121.139 Y121.285 E.01131
; LINE_WIDTH: 0.389362
G3 X133.263 Y118.094 I6.737 J.968 E.28332
; LINE_WIDTH: 0.390012
G3 X133.947 Y119.18 I-5.396 J4.155 E.02288
; LINE_WIDTH: 0.389822
G1 X134.174 Y119.676 E.00971
; LINE_WIDTH: 0.389362
G3 X134.53 Y120.831 I-6.303 J2.575 E.02151
; LINE_WIDTH: 0.390002
G1 X134.639 Y121.507 E.01221
; LINE_WIDTH: 0.390582
G1 X134.679 Y122.188 E.01217
; LINE_WIDTH: 0.390772
G1 X134.675 Y122.292 E.00185
; WIPE_START
G1 F1800
M204 S10000
G1 X134.651 Y122.836 E-.20684
G1 X134.57 Y123.464 E-.24093
G1 X134.432 Y124.068 E-.23516
G1 X134.369 Y124.26 E-.07708
; WIPE_END
G1 E-.04
G1 X130.038 Y117.976 Z7.68 F30000
G1 X128.572 Y115.849 Z7.68
G1 Z7.28
G1 E.8 F1800
; LINE_WIDTH: 0.385782
G1 F1200
M204 S5000
G1 X129.017 Y115.913 E.0079
G3 X131.172 Y116.715 I-1.135 J6.351 E.0407
; LINE_WIDTH: 0.386622
G3 X132.108 Y117.393 I-3.225 J5.433 E.02041
; LINE_WIDTH: 0.385762
G3 X133.231 Y118.67 I-4.827 J5.379 E.03001
; LINE_WIDTH: 0.385582
G1 X133.544 Y119.19 E.01066
; LINE_WIDTH: 0.386002
G3 X134.258 Y121.377 I-5.609 J3.041 E.04075
; LINE_WIDTH: 0.384502
G1 X134.31 Y121.953 E.01014
; LINE_WIDTH: 0.384082
G1 X134.311 Y122.531 E.01013
; LINE_WIDTH: 0.384232
G1 X134.26 Y123.107 E.01013
; LINE_WIDTH: 0.384432
G1 X134.157 Y123.675 E.01013
; LINE_WIDTH: 0.384532
G3 X132.12 Y127.096 I-6.398 J-1.494 E.07096
; LINE_WIDTH: 0.384922
G1 X131.645 Y127.473 E.01066
; LINE_WIDTH: 0.385552
G1 X131.186 Y127.776 E.00967
; LINE_WIDTH: 0.386492
G1 X130.678 Y128.051 E.01018
; LINE_WIDTH: 0.387962
G3 X129.597 Y128.458 I-2.774 J-5.725 E.02049
; LINE_WIDTH: 0.386192
G1 X129.033 Y128.587 E.01019
; LINE_WIDTH: 0.385742
G1 X128.461 Y128.666 E.01017
; LINE_WIDTH: 0.386792
G1 X127.883 Y128.693 E.01021
; LINE_WIDTH: 0.388572
G3 X126.733 Y128.591 I.007 J-6.597 E.02051
; LINE_WIDTH: 0.388782
G3 X125.618 Y128.284 I1.181 J-6.474 E.02054
; LINE_WIDTH: 0.385832
G1 X125.087 Y128.057 E.01018
; LINE_WIDTH: 0.384882
G3 X124.095 Y127.467 I2.816 J-5.855 E.02029
; LINE_WIDTH: 0.390842
G1 X123.861 Y127.284 E.0053
; LINE_WIDTH: 0.390852
G3 X121.515 Y123.261 I4.038 J-5.05 E.08504
; LINE_WIDTH: 0.389962
G1 X121.446 Y122.645 E.01103
; LINE_WIDTH: 0.389552
G1 X121.437 Y122.028 E.01099
; LINE_WIDTH: 0.388922
G1 X121.489 Y121.393 E.01131
; LINE_WIDTH: 0.386332
G1 X121.592 Y120.824 E.01019
; LINE_WIDTH: 0.385782
G3 X128.444 Y115.837 I6.289 J1.44 E.16275
G1 X128.513 Y115.843 E.00121
; CHANGE_LAYER
; Z_HEIGHT: 7.31368
; LAYER_HEIGHT: 0.0336838
; WIPE_START
G1 F1800
M204 S10000
G1 X129.017 Y115.913 E-.19335
G1 X129.581 Y116.037 E-.21963
G1 X130.131 Y116.215 E-.2198
G1 X130.439 Y116.346 E-.12721
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 86/145
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.68 I-.176 J-1.204 P1  F30000
G1 X125.487 Y117.072 Z7.68
G1 Z7.314
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1200
G1 X125.351 Y117.137 E.00604
G2 X125.015 Y117.317 I2.414 J4.895 E.01528
G1 X130.736 Y117.317 E.229
G3 X133.201 Y120.212 I-2.864 J4.935 E.15511
G1 X122.549 Y120.212 E.42631
G1 X122.465 Y120.449 E.01008
G2 X122.237 Y123.106 I5.445 J1.804 E.10773
G1 X133.513 Y123.106 E.45128
G3 X132.73 Y125.241 I-5.668 J-.866 E.09164
G1 X132.634 Y125.392 E.00716
G3 X132.17 Y126 I-4.851 J-3.219 E.03062
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
G1 X123.58 Y126 E.34384
G2 X132.038 Y126.146 I4.295 J-3.756 E.3814
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.0863161
; WIPE_START
G1 F7329.351
G1 X131.067 Y126.975 E-.48509
G1 X130.429 Y127.317 E-.27491
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/145
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.714 I.927 J.788 P1  F30000
G1 X134.674 Y122.324 Z7.714
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.390682
; LAYER_HEIGHT: 0.12
G1 F1200
M204 S5000
G1 X134.655 Y122.819 E.00882
; LINE_WIDTH: 0.390812
G3 X131.202 Y128.185 I-6.843 J-.609 E.11844
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
; LINE_WIDTH: 0.390102
G1 X130.752 Y128.416 E.00902
; LINE_WIDTH: 0.389002
G1 X130.289 Y128.612 E.00893
; LINE_WIDTH: 0.389822
G1 X129.809 Y128.774 E.00902
; LINE_WIDTH: 0.390612
G1 X129.322 Y128.898 E.00897
; LINE_WIDTH: 0.390772
G3 X128.323 Y129.039 I-1.455 J-6.687 E.01802
; LINE_WIDTH: 0.389982
G1 X127.817 Y129.055 E.00901
; LINE_WIDTH: 0.388492
G1 X127.241 Y129.023 E.01023
; LINE_WIDTH: 0.388272
G3 X126.044 Y128.803 I.553 J-6.361 E.0216
; LINE_WIDTH: 0.386602
G1 X125.467 Y128.612 E.01072
; LINE_WIDTH: 0.385672
G1 X124.909 Y128.37 E.01071
; LINE_WIDTH: 0.384572
G1 X124.373 Y128.079 E.0107
; LINE_WIDTH: 0.384712
G3 X123.388 Y127.36 I3.466 J-5.779 E.02142
; LINE_WIDTH: 0.384522
G1 X122.949 Y126.936 E.01072
; LINE_WIDTH: 0.385022
G3 X122.19 Y125.983 I4.66 J-4.484 E.02143
; LINE_WIDTH: 0.384532
G3 X121.243 Y123.745 I5.637 J-3.705 E.04286
; LINE_WIDTH: 0.384752
G1 X121.133 Y123.142 E.01075
; LINE_WIDTH: 0.385342
G1 X121.079 Y122.533 E.01075
; LINE_WIDTH: 0.385622
G1 X121.081 Y121.921 E.01078
; LINE_WIDTH: 0.388302
G1 X121.139 Y121.283 E.01135
; LINE_WIDTH: 0.389362
G3 X121.662 Y119.475 I7.517 J1.193 E.03355
; LINE_WIDTH: 0.389982
G3 X122.257 Y118.41 I6.284 J2.815 E.02175
; LINE_WIDTH: 0.389362
G3 X123.434 Y117.094 I6.306 J4.455 E.03145
; LINE_WIDTH: 0.388022
G1 X123.914 Y116.716 E.01083
; LINE_WIDTH: 0.389982
G3 X125.022 Y116.072 I4 J5.601 E.02286
; LINE_WIDTH: 0.389372
G3 X131.913 Y116.773 I2.853 J6.178 E.12919
; LINE_WIDTH: 0.388992
G1 X132.435 Y117.199 E.01197
; LINE_WIDTH: 0.389272
G1 X132.869 Y117.627 E.01084
; LINE_WIDTH: 0.389982
G3 X133.614 Y118.593 I-5.058 J4.671 E.02174
; LINE_WIDTH: 0.389362
G3 X134.529 Y120.826 I-5.742 J3.659 E.04313
; LINE_WIDTH: 0.389822
G1 X134.637 Y121.488 E.01195
; LINE_WIDTH: 0.390582
G1 X134.679 Y122.191 E.01256
; LINE_WIDTH: 0.390682
G1 X134.676 Y122.264 E.00131
; WIPE_START
G1 F1800
M204 S10000
G1 X134.655 Y122.819 E-.21074
G1 X134.57 Y123.465 E-.24778
G1 X134.432 Y124.068 E-.2349
G1 X134.377 Y124.234 E-.06659
; WIPE_END
G1 E-.04
G1 X130.026 Y117.964 Z7.8 F30000
G1 X128.556 Y115.847 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.385782
G1 F1200
M204 S5000
G1 X129.017 Y115.909 E.00819
G3 X131.172 Y116.715 I-1.142 J6.34 E.04072
; LINE_WIDTH: 0.386602
G3 X132.128 Y117.41 I-3.228 J5.438 E.02087
; LINE_WIDTH: 0.386052
G1 X132.527 Y117.792 E.00973
; LINE_WIDTH: 0.385752
G3 X134 Y120.251 I-4.884 J4.597 E.05085
; LINE_WIDTH: 0.386082
G3 X134.258 Y121.377 I-6.034 J1.975 E.02037
; LINE_WIDTH: 0.384862
G1 X134.31 Y121.953 E.01015
; LINE_WIDTH: 0.384322
G3 X134.26 Y123.106 I-6.376 J.301 E.02027
; LINE_WIDTH: 0.384432
G1 X134.157 Y123.675 E.01014
; LINE_WIDTH: 0.384532
G3 X133.802 Y124.774 I-6.278 J-1.424 E.02029
; LINE_WIDTH: 0.385022
G3 X133.255 Y125.792 I-5.826 J-2.473 E.02032
; LINE_WIDTH: 0.384512
G3 X132.12 Y127.096 I-5.967 J-4.05 E.0304
; LINE_WIDTH: 0.384702
G1 X131.668 Y127.457 E.01015
; LINE_WIDTH: 0.385592
G1 X131.186 Y127.776 E.01016
; LINE_WIDTH: 0.386482
G1 X130.678 Y128.051 E.01019
; LINE_WIDTH: 0.388012
G3 X129.597 Y128.458 I-2.783 J-5.75 E.02049
; LINE_WIDTH: 0.386222
G1 X129.033 Y128.587 E.01019
; LINE_WIDTH: 0.385782
G1 X128.461 Y128.666 E.01017
; LINE_WIDTH: 0.386772
G1 X127.883 Y128.693 E.01021
; LINE_WIDTH: 0.388592
G3 X126.733 Y128.591 I.008 J-6.607 E.02051
; LINE_WIDTH: 0.388802
G3 X125.618 Y128.284 I1.181 J-6.477 E.02054
; LINE_WIDTH: 0.385862
G1 X125.087 Y128.057 E.01018
; LINE_WIDTH: 0.384642
G3 X124.095 Y127.466 I2.791 J-5.813 E.02029
; LINE_WIDTH: 0.390842
G1 X123.861 Y127.284 E.0053
G3 X121.514 Y123.259 I4.039 J-5.05 E.08508
; LINE_WIDTH: 0.389932
G1 X121.446 Y122.645 E.011
; LINE_WIDTH: 0.389542
G1 X121.437 Y122.028 E.01096
; LINE_WIDTH: 0.388932
G1 X121.489 Y121.393 E.01133
; LINE_WIDTH: 0.386272
G1 X121.592 Y120.824 E.01019
; LINE_WIDTH: 0.385782
G3 X123.212 Y117.803 I6.282 J1.425 E.06107
; LINE_WIDTH: 0.386592
G3 X124.081 Y117.042 I4.623 J4.399 E.02041
; LINE_WIDTH: 0.386402
G1 X124.542 Y116.737 E.00974
; LINE_WIDTH: 0.385782
G3 X128.445 Y115.832 I3.334 J5.512 E.07171
G1 X128.497 Y115.839 E.00093
; CHANGE_LAYER
; Z_HEIGHT: 7.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X129.017 Y115.909 E-.1995
G1 X129.581 Y116.037 E-.21974
G1 X130.131 Y116.215 E-.21976
G1 X130.424 Y116.34 E-.12101
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 88/145
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.8 I-.991 J.707 P1  F30000
G1 X134.675 Y122.298 Z7.8
G1 Z7.52
G1 E.8 F1800
; LINE_WIDTH: 0.391052
G1 F1200
M204 S5000
G1 X134.653 Y122.838 E.00966
G3 X134.57 Y123.465 I-6.801 J-.59 E.0113
; LINE_WIDTH: 0.390922
G3 X133.742 Y125.695 I-6.673 J-1.209 E.04269
; LINE_WIDTH: 0.390812
G3 X132.571 Y127.173 I-6.468 J-3.919 E.03374
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
; LINE_WIDTH: 0.391162
G3 X131.637 Y127.92 I-4.763 J-5.002 E.02139
; LINE_WIDTH: 0.390662
G1 X131.205 Y128.183 E.00903
; LINE_WIDTH: 0.390082
G1 X130.758 Y128.414 E.00896
; LINE_WIDTH: 0.389012
G1 X130.292 Y128.611 E.00898
; LINE_WIDTH: 0.389802
G1 X129.814 Y128.772 E.00897
; LINE_WIDTH: 0.390632
G1 X129.324 Y128.898 E.00902
; LINE_WIDTH: 0.390772
G3 X128.325 Y129.039 I-1.444 J-6.593 E.01803
; LINE_WIDTH: 0.389962
G1 X127.815 Y129.055 E.00908
; LINE_WIDTH: 0.388522
G1 X127.241 Y129.023 E.0102
; LINE_WIDTH: 0.388302
G3 X126.044 Y128.802 I.551 J-6.352 E.0216
; LINE_WIDTH: 0.386582
G1 X125.467 Y128.612 E.01072
; LINE_WIDTH: 0.385712
G1 X124.909 Y128.37 E.01071
; LINE_WIDTH: 0.384562
G1 X124.373 Y128.079 E.0107
; LINE_WIDTH: 0.384722
G3 X123.388 Y127.361 I3.465 J-5.778 E.02142
; LINE_WIDTH: 0.384512
G1 X122.965 Y126.953 E.0103
; LINE_WIDTH: 0.385012
G3 X122.19 Y125.983 I4.659 J-4.513 E.02185
; LINE_WIDTH: 0.384542
G3 X121.243 Y123.744 I5.637 J-3.705 E.04287
; LINE_WIDTH: 0.384792
G1 X121.133 Y123.142 E.01074
; LINE_WIDTH: 0.385362
G1 X121.079 Y122.533 E.01075
; LINE_WIDTH: 0.385592
G1 X121.081 Y121.921 E.01078
; LINE_WIDTH: 0.388322
G1 X121.139 Y121.281 E.01139
; LINE_WIDTH: 0.389372
G3 X133.614 Y118.593 I6.738 J.979 E.29396
; LINE_WIDTH: 0.389782
G3 X134.174 Y119.676 I-5.92 J3.751 E.02172
; LINE_WIDTH: 0.389352
G3 X134.53 Y120.829 I-6.306 J2.576 E.02148
; LINE_WIDTH: 0.389952
G1 X134.638 Y121.503 E.01216
; LINE_WIDTH: 0.390592
G1 X134.679 Y122.193 E.01234
; LINE_WIDTH: 0.391052
M73 P72 R6
G1 X134.677 Y122.238 E.0008
; WIPE_START
G1 F1800
M204 S10000
G1 X134.653 Y122.838 E-.22825
G1 X134.57 Y123.465 E-.24033
G1 X134.432 Y124.068 E-.23499
G1 X134.386 Y124.209 E-.05643
; WIPE_END
G1 E-.04
G1 X129.987 Y117.972 Z7.92 F30000
G1 X128.483 Y115.839 Z7.92
G1 Z7.52
G1 E.8 F1800
; LINE_WIDTH: 0.389372
G1 F1200
M204 S5000
G1 X128.542 Y115.849 E.00107
G3 X131.688 Y117.056 I-.665 J6.434 E.0606
; LINE_WIDTH: 0.388022
G1 X132.109 Y117.394 E.00956
; LINE_WIDTH: 0.385742
G3 X133.544 Y119.19 I-4.22 J4.842 E.04068
; LINE_WIDTH: 0.385982
G3 X134.258 Y121.377 I-5.612 J3.041 E.04074
; LINE_WIDTH: 0.384582
G1 X134.31 Y121.953 E.01014
; LINE_WIDTH: 0.384112
G1 X134.311 Y122.531 E.01013
; LINE_WIDTH: 0.384432
G1 X134.256 Y123.129 E.01054
; LINE_WIDTH: 0.384572
G3 X133.802 Y124.774 I-7.107 J-1.079 E.03
; LINE_WIDTH: 0.385002
G3 X133.256 Y125.792 I-5.832 J-2.476 E.02031
; LINE_WIDTH: 0.384522
G3 X132.12 Y127.096 I-5.967 J-4.05 E.03041
; LINE_WIDTH: 0.384872
G1 X131.649 Y127.47 E.01056
; LINE_WIDTH: 0.385632
G1 X131.186 Y127.776 E.00976
; LINE_WIDTH: 0.386452
G1 X130.678 Y128.051 E.01019
; LINE_WIDTH: 0.388062
G3 X129.597 Y128.458 I-2.789 J-5.765 E.02049
; LINE_WIDTH: 0.386252
G1 X129.033 Y128.587 E.01019
; LINE_WIDTH: 0.385812
G1 X128.461 Y128.666 E.01017
; LINE_WIDTH: 0.386732
G1 X127.883 Y128.693 E.0102
; LINE_WIDTH: 0.388632
G3 X126.733 Y128.591 I.008 J-6.613 E.02052
; LINE_WIDTH: 0.388832
G3 X125.618 Y128.284 I1.183 J-6.486 E.02054
; LINE_WIDTH: 0.385912
G1 X125.087 Y128.057 E.01018
; LINE_WIDTH: 0.384622
G1 X124.578 Y127.784 E.01014
; LINE_WIDTH: 0.384742
G3 X123.642 Y127.106 I3.285 J-5.517 E.0203
; LINE_WIDTH: 0.384532
G1 X123.241 Y126.724 E.00973
; LINE_WIDTH: 0.385092
G3 X122.503 Y125.805 I4.532 J-4.396 E.02072
; LINE_WIDTH: 0.384542
G3 X121.597 Y123.69 I5.358 J-3.547 E.04058
; LINE_WIDTH: 0.385182
G1 X121.492 Y123.123 E.01015
; LINE_WIDTH: 0.385852
G1 X121.439 Y122.547 E.01018
; LINE_WIDTH: 0.388942
G3 X121.489 Y121.393 I6.673 J-.288 E.02054
; LINE_WIDTH: 0.386212
G1 X121.592 Y120.824 E.01018
; LINE_WIDTH: 0.385782
G3 X123.63 Y117.403 I6.398 J1.494 E.07121
; LINE_WIDTH: 0.389372
G1 X123.706 Y117.339 E.00177
G3 X127.966 Y115.815 I4.171 J4.944 E.08217
G1 X128.423 Y115.837 E.00814
; CHANGE_LAYER
; Z_HEIGHT: 7.58526
; LAYER_HEIGHT: 0.0652633
; WIPE_START
G1 F1800
M204 S10000
G1 X128.542 Y115.849 E-.04551
G1 X129.114 Y115.929 E-.21953
G1 X129.676 Y116.065 E-.21957
G1 X130.223 Y116.251 E-.21957
G1 X130.357 Y116.311 E-.05582
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 89/145
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.92 I-1.154 J.385 P1  F30000
G1 X130.683 Y117.286 Z7.92
G1 Z7.585
G1 E.8 F1800
; FEATURE: Support transition
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1200
G1 X129.788 Y117.318 E.03581
G1 X129.788 Y116.878 E.01759
G2 X128.894 Y116.639 I-1.936 J5.441 E.03709
G1 X128.894 Y117.318 E.02717
G1 X128 Y117.318 E.03579
G1 X128 Y116.549 E.03077
G2 X127.106 Y116.6 I-.123 J5.717 E.03589
G1 X127.106 Y117.318 E.02874
G1 X126.212 Y117.318 E.03579
G1 X126.212 Y116.795 E.02091
G2 X125.41 Y117.107 I1.721 J5.603 E.03446
G1 X125.317 Y117.153 E.00414
G1 X125.317 Y117.318 E.00658
G1 X125.106 Y117.318 E.00846
G1 X125.106 Y126 E.3475
G1 X125.317 Y126 E.00846
G1 X125.317 Y127.346 E.05389
G2 X125.734 Y127.535 I4.656 J-9.712 E.01831
G2 X126.194 Y127.699 I2.335 J-5.819 E.01955
G1 X126.212 Y126 E.06802
G1 X127.106 Y126 E.03579
G1 X127.106 Y127.9 E.07605
G2 X127.333 Y127.926 I.669 J-4.736 E.00916
G1 X127.443 Y127.936 E.0044
G2 X128 Y127.951 I.498 J-8.024 E.02233
G1 X128 Y126 E.07809
G1 X128.894 Y126 E.03579
G1 X128.894 Y127.861 E.07449
G2 X129.788 Y127.621 I-1.05 J-5.712 E.03709
G1 X129.788 Y126 E.0649
G1 X130.486 Y126 E.0279
G1 X130.5 Y123.303 F30000
; FEATURE: Support
G1 F7329.351
G1 X130.5 Y125.606 E.09217
G1 X125.5 Y125.606 E.20011
G1 X125.5 Y123.106 E.10006
G1 X130.5 Y123.106 E.20011
G1 X130.5 Y120.212 E.11584
G1 X125.5 Y120.212 E.20011
G1 X125.5 Y117.712 E.10006
G1 X130.5 Y117.712 E.20011
G1 X130.5 Y120.014 E.09217
G1 X130.964 Y117.456 F30000
; FEATURE: Support transition
G1 F1200
G1 X130.894 Y117.413 E.00328
G1 X130.894 Y126 E.3437
G1 X130.683 Y126 E.00846
G1 X130.683 Y127.213 E.04856
G2 X131.342 Y126.777 I-2.838 J-5.009 E.03166
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
G1 X131.577 Y126.587 E.01209
G1 X131.577 Y117.913 E.34717
G3 X132.471 Y118.875 I-3.623 J4.264 E.0527
G1 X132.471 Y125.624 E.27012
G2 X132.592 Y125.454 I-2.482 J-1.888 E.00836
G2 X133.365 Y123.79 I-4.764 J-3.226 E.07377
G1 X133.365 Y120.71 E.12327
G2 X133.086 Y119.933 I-6.197 J1.795 E.03307
G1 X133.563 Y121.833 F30000
G1 F1200
G3 X133.572 Y122.505 I-7.593 J.445 E.02691
G1 X125.143 Y117.245 F30000
G1 F1200
G2 X124.423 Y117.711 I2.702 J4.962 E.03435
G1 X124.423 Y126.788 E.36332
G3 X123.608 Y126.032 I3.416 J-4.501 E.04459
M73 P72 R5
G1 X123.529 Y125.942 E.00479
G1 X123.529 Y118.558 E.29553
G2 X122.686 Y119.886 I4.362 J3.702 E.06315
G1 X122.635 Y120 E.00502
G1 X122.635 Y124.499 E.18006
G2 X122.927 Y125.084 I6.513 J-2.886 E.0262
G1 X122.437 Y123.967 F30000
G1 F1200
G3 X122.202 Y121.673 I5.468 J-1.721 E.09296
G1 X122.216 Y121.547 E.00508
G3 X122.416 Y120.602 I5.712 J.714 E.03869
; CHANGE_LAYER
; Z_HEIGHT: 7.64
; LAYER_HEIGHT: 0.0547366
; WIPE_START
G1 X122.216 Y121.547 E-.36691
G1 X122.202 Y121.673 E-.04826
G1 X122.205 Y122.58 E-.34482
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/145
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.985 I.03 J1.217 P1  F30000
G1 X134.676 Y122.271 Z7.985
G1 Z7.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.390782
; LAYER_HEIGHT: 0.12
M204 S5000
G1 X134.651 Y122.839 E.01015
G3 X132.571 Y127.173 I-6.853 J-.622 E.08764
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
; LINE_WIDTH: 0.391112
G3 X131.636 Y127.92 I-4.758 J-4.997 E.02141
; LINE_WIDTH: 0.390692
G1 X131.208 Y128.182 E.00896
; LINE_WIDTH: 0.390062
G1 X130.757 Y128.415 E.00904
; LINE_WIDTH: 0.389032
G1 X130.294 Y128.61 E.00892
; LINE_WIDTH: 0.389782
G1 X129.813 Y128.773 E.00904
; LINE_WIDTH: 0.390632
G1 X129.326 Y128.897 E.00896
; LINE_WIDTH: 0.390772
G3 X128.327 Y129.039 I-1.447 J-6.596 E.01803
; LINE_WIDTH: 0.389932
G1 X127.813 Y129.055 E.00915
; LINE_WIDTH: 0.388562
G1 X127.241 Y129.023 E.01016
; LINE_WIDTH: 0.388362
G3 X126.044 Y128.802 I.549 J-6.343 E.02161
; LINE_WIDTH: 0.386542
G1 X125.467 Y128.612 E.01072
; LINE_WIDTH: 0.385752
G1 X124.909 Y128.37 E.01071
; LINE_WIDTH: 0.384552
G1 X124.373 Y128.079 E.01069
; LINE_WIDTH: 0.384842
G3 X123.388 Y127.36 I3.478 J-5.797 E.02144
; LINE_WIDTH: 0.384522
G3 X121.244 Y123.745 I4.586 J-5.164 E.07493
; LINE_WIDTH: 0.384822
G1 X121.133 Y123.142 E.01075
; LINE_WIDTH: 0.385382
G1 X121.079 Y122.533 E.01075
; LINE_WIDTH: 0.386272
G3 X121.14 Y121.313 I6.295 J-.299 E.02157
; LINE_WIDTH: 0.389342
G3 X123.033 Y117.469 I6.821 J.97 E.07747
; LINE_WIDTH: 0.389462
G3 X129.142 Y115.564 I4.86 J4.837 E.11838
; LINE_WIDTH: 0.389332
G3 X133.614 Y118.593 I-1.305 J6.742 E.09869
; LINE_WIDTH: 0.389772
G3 X134.175 Y119.677 I-5.913 J3.747 E.02173
; LINE_WIDTH: 0.389352
G3 X134.531 Y120.835 I-6.299 J2.573 E.02158
; LINE_WIDTH: 0.389922
G1 X134.638 Y121.5 E.012
; LINE_WIDTH: 0.390602
G1 X134.679 Y122.196 E.01243
; LINE_WIDTH: 0.390782
G1 X134.678 Y122.211 E.00027
; WIPE_START
M204 S10000
G1 X134.651 Y122.839 E-.23888
G1 X134.569 Y123.466 E-.24015
G1 X134.432 Y124.068 E-.23468
G1 X134.394 Y124.184 E-.04628
; WIPE_END
G1 E-.04
G1 X130.001 Y117.942 Z8.04 F30000
G1 X128.524 Y115.843 Z8.04
G1 Z7.64
G1 E.8 F1800
; LINE_WIDTH: 0.386522
M204 S5000
G1 X129.017 Y115.909 E.00877
G3 X129.581 Y116.037 I-1.124 J6.233 E.01021
; LINE_WIDTH: 0.385782
G3 X131.172 Y116.715 I-2.018 J6.946 E.03051
; LINE_WIDTH: 0.386532
G3 X132.108 Y117.393 I-3.231 J5.442 E.02041
; LINE_WIDTH: 0.385752
G3 X133.544 Y119.19 I-4.215 J4.841 E.04071
; LINE_WIDTH: 0.385962
G3 X134.258 Y121.377 I-5.618 J3.044 E.04074
; LINE_WIDTH: 0.384652
G1 X134.31 Y121.953 E.01014
; LINE_WIDTH: 0.384112
G1 X134.311 Y122.531 E.01013
; LINE_WIDTH: 0.384252
G1 X134.26 Y123.107 E.01013
; LINE_WIDTH: 0.384432
G1 X134.157 Y123.675 E.01013
; LINE_WIDTH: 0.384532
G3 X132.12 Y127.096 I-6.398 J-1.494 E.07096
; LINE_WIDTH: 0.384842
G1 X131.651 Y127.469 E.01051
; LINE_WIDTH: 0.385672
G1 X131.186 Y127.776 E.00981
; LINE_WIDTH: 0.386412
G1 X130.678 Y128.051 E.01018
; LINE_WIDTH: 0.388132
G3 X129.597 Y128.458 I-2.797 J-5.785 E.0205
; LINE_WIDTH: 0.386292
G1 X129.033 Y128.587 E.01019
; LINE_WIDTH: 0.385862
G1 X128.461 Y128.666 E.01017
; LINE_WIDTH: 0.386692
G1 X127.883 Y128.693 E.0102
; LINE_WIDTH: 0.388672
G3 X126.733 Y128.591 I.009 J-6.621 E.02052
; LINE_WIDTH: 0.388862
G3 X125.618 Y128.284 I1.186 J-6.497 E.02054
; LINE_WIDTH: 0.385942
G1 X125.087 Y128.057 E.01018
; LINE_WIDTH: 0.384622
G1 X124.578 Y127.784 E.01014
; LINE_WIDTH: 0.384892
G3 X123.643 Y127.106 I3.31 J-5.551 E.0203
; LINE_WIDTH: 0.384542
G3 X121.597 Y123.691 I4.342 J-4.92 E.07096
; LINE_WIDTH: 0.385222
G1 X121.492 Y123.123 E.01015
; LINE_WIDTH: 0.385872
G1 X121.439 Y122.547 E.01018
; LINE_WIDTH: 0.388982
G1 X121.437 Y122.028 E.00921
; LINE_WIDTH: 0.389622
G3 X121.593 Y120.824 I6.71 J.256 E.02164
; LINE_WIDTH: 0.385782
G3 X123.63 Y117.403 I6.394 J1.491 E.0712
; LINE_WIDTH: 0.389462
G1 X123.706 Y117.34 E.00176
G1 X124.1 Y117.029 E.00893
; LINE_WIDTH: 0.386222
G1 X124.564 Y116.723 E.00979
; LINE_WIDTH: 0.385772
G3 X128.444 Y115.832 I3.341 J5.659 E.0712
; LINE_WIDTH: 0.386522
G1 X128.465 Y115.835 E.00036
; CHANGE_LAYER
; Z_HEIGHT: 7.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X129.017 Y115.909 E-.21178
G1 X129.581 Y116.037 E-.21989
G1 X130.132 Y116.215 E-.21971
G1 X130.395 Y116.327 E-.10862
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 91/145
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.04 I-.986 J.713 P1  F30000
G1 X134.677 Y122.244 Z8.04
G1 Z7.76
G1 E.8 F1800
; LINE_WIDTH: 0.390772
G1 F1200
M204 S5000
G1 X134.653 Y122.841 E.01065
G3 X131.21 Y128.18 I-6.781 J-.592 E.11796
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
; LINE_WIDTH: 0.390032
G1 X130.756 Y128.415 E.00911
; LINE_WIDTH: 0.389022
G1 X130.293 Y128.611 E.00893
; LINE_WIDTH: 0.389862
G1 X129.818 Y128.771 E.00891
; LINE_WIDTH: 0.390642
G1 X129.329 Y128.897 E.00902
; LINE_WIDTH: 0.390782
G3 X128.329 Y129.039 I-1.463 J-6.692 E.01804
; LINE_WIDTH: 0.389912
G1 X127.811 Y129.055 E.00922
; LINE_WIDTH: 0.388592
G1 X127.241 Y129.023 E.01013
; LINE_WIDTH: 0.388392
G3 X126.045 Y128.802 I.548 J-6.337 E.0216
; LINE_WIDTH: 0.386502
M73 P73 R5
G1 X125.467 Y128.612 E.01072
; LINE_WIDTH: 0.385792
G1 X124.909 Y128.37 E.01072
; LINE_WIDTH: 0.384562
G1 X124.373 Y128.079 E.01069
; LINE_WIDTH: 0.384812
G3 X123.388 Y127.36 I3.478 J-5.796 E.02143
; LINE_WIDTH: 0.384542
G3 X121.244 Y123.745 I4.586 J-5.164 E.07494
; LINE_WIDTH: 0.384852
G1 X121.133 Y123.142 E.01075
; LINE_WIDTH: 0.385392
G1 X121.079 Y122.533 E.01075
; LINE_WIDTH: 0.386242
G3 X121.14 Y121.313 I6.308 J-.298 E.02157
; LINE_WIDTH: 0.389352
G3 X131.919 Y116.777 I6.741 J.944 E.25009
; LINE_WIDTH: 0.389102
G1 X132.435 Y117.199 E.01184
; LINE_WIDTH: 0.389342
G3 X134.531 Y120.832 I-4.686 J5.123 E.07575
; LINE_WIDTH: 0.389902
G1 X134.638 Y121.498 E.01201
; LINE_WIDTH: 0.390612
G1 X134.678 Y122.184 E.01226
; WIPE_START
G1 F1800
M204 S10000
G1 X134.653 Y122.841 E-.24962
G1 X134.569 Y123.466 E-.23969
G1 X134.432 Y124.068 E-.23454
G1 X134.402 Y124.158 E-.03616
; WIPE_END
G1 E-.04
G1 X129.99 Y117.93 Z8.16 F30000
G1 X128.509 Y115.841 Z8.16
G1 Z7.76
G1 E.8 F1800
; LINE_WIDTH: 0.385772
G1 F1200
M204 S5000
G1 X129.016 Y115.914 E.00902
G3 X131.172 Y116.715 I-1.139 J6.374 E.0407
; LINE_WIDTH: 0.386502
G3 X132.121 Y117.405 I-3.236 J5.449 E.02072
; LINE_WIDTH: 0.385882
G1 X132.526 Y117.792 E.00986
; LINE_WIDTH: 0.385752
G3 X134 Y120.251 I-4.883 J4.597 E.05086
; LINE_WIDTH: 0.385962
G3 X134.258 Y121.377 I-6.038 J1.975 E.02037
; LINE_WIDTH: 0.384682
G1 X134.31 Y121.953 E.01015
; LINE_WIDTH: 0.384122
G1 X134.311 Y122.531 E.01013
; LINE_WIDTH: 0.384272
G1 X134.26 Y123.106 E.01013
; LINE_WIDTH: 0.384442
G3 X133.552 Y125.295 I-6.381 J-.855 E.04056
; LINE_WIDTH: 0.384972
G3 X132.916 Y126.26 I-5.591 J-2.991 E.02032
; LINE_WIDTH: 0.384512
G3 X132.12 Y127.096 I-5.007 J-3.974 E.02028
; LINE_WIDTH: 0.384682
G1 X131.668 Y127.457 E.01014
; LINE_WIDTH: 0.385732
G1 X131.186 Y127.776 E.01018
; LINE_WIDTH: 0.386392
G1 X130.678 Y128.051 E.01019
; LINE_WIDTH: 0.387912
G3 X129.597 Y128.458 I-2.767 J-5.707 E.02048
; LINE_WIDTH: 0.386332
G1 X129.033 Y128.587 E.0102
; LINE_WIDTH: 0.385892
G1 X128.461 Y128.666 E.01017
; LINE_WIDTH: 0.386642
G1 X127.883 Y128.693 E.0102
; LINE_WIDTH: 0.388702
G3 X126.733 Y128.591 I.01 J-6.625 E.02052
; LINE_WIDTH: 0.388862
G3 X125.618 Y128.284 I1.186 J-6.499 E.02054
; LINE_WIDTH: 0.385972
G1 X125.087 Y128.057 E.01018
; LINE_WIDTH: 0.384622
G1 X124.578 Y127.784 E.01014
; LINE_WIDTH: 0.384862
G1 X124.109 Y127.477 E.00984
; LINE_WIDTH: 0.391102
G1 X123.861 Y127.284 E.00562
G1 X123.425 Y126.904 E.01033
; LINE_WIDTH: 0.390852
G3 X121.513 Y123.252 I4.571 J-4.72 E.07484
; LINE_WIDTH: 0.389842
G1 X121.446 Y122.643 E.01092
; LINE_WIDTH: 0.389522
G3 X121.592 Y120.824 I7.049 J-.347 E.03254
; LINE_WIDTH: 0.385782
G3 X123.213 Y117.803 I6.279 J1.422 E.06108
; LINE_WIDTH: 0.386482
G3 X124.081 Y117.043 I4.593 J4.368 E.02039
; LINE_WIDTH: 0.385772
G3 X128.444 Y115.838 I3.796 J5.246 E.08138
G1 X128.449 Y115.838 E.00009
; CHANGE_LAYER
; Z_HEIGHT: 7.85684
; LAYER_HEIGHT: 0.0968418
; WIPE_START
G1 F1800
M204 S10000
G1 X129.016 Y115.914 E-.21747
G1 X129.581 Y116.037 E-.21966
G1 X130.131 Y116.215 E-.21976
G1 X130.381 Y116.321 E-.10311
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 92/145
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.16 I-1.179 J.303 P1  F30000
G1 X130.683 Y117.495 Z8.16
G1 Z7.857
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1898
G1 X130.683 Y117.286 E.00835
G2 X129.85 Y116.9 I-2.839 J5.031 E.03677
G1 X129.788 Y116.878 E.00262
G1 X129.788 Y117.318 E.01759
G1 X128.894 Y117.318 E.03579
G1 X128.894 Y116.639 E.02717
G2 X128 Y116.549 I-1.01 J5.548 E.03601
G1 X128 Y117.318 E.03077
G1 X127.106 Y117.318 E.03579
G1 X127.106 Y116.6 E.02874
G1 X127.04 Y116.608 E.00264
G2 X126.212 Y116.795 I.87 J5.796 E.03404
G1 X126.212 Y117.318 E.02091
G1 X125.317 Y117.318 E.03579
G1 X125.317 Y117.153 E.00658
G2 X124.423 Y117.711 I2.67 J5.276 E.04224
G1 X124.423 Y126.788 E.36332
G2 X125.284 Y127.33 I3.451 J-4.535 E.04077
G1 X125.317 Y126 E.05325
G1 X126.212 Y126 E.03579
G1 X126.212 Y127.704 E.06823
G2 X127.015 Y127.887 I1.703 J-5.623 E.033
G1 X127.106 Y127.9 E.00367
G1 X127.106 Y126 E.07605
G1 X128 Y126 E.03579
G1 X128 Y127.951 E.07809
G2 X128.41 Y127.927 I-.15 J-6.189 E.01644
G1 X128.567 Y127.91 E.00634
G2 X128.894 Y127.861 I-.757 J-6.108 E.01322
G1 X128.894 Y126 E.07449
G1 X129.788 Y126 E.03579
G1 X129.788 Y127.621 E.06489
G2 X130.522 Y127.301 I-1.896 J-5.339 E.03208
G1 X130.683 Y127.213 E.00731
G1 X130.683 Y126 E.04856
G1 X130.894 Y126 E.00846
G1 X130.894 Y117.412 E.3437
G3 X131.577 Y117.913 I-3.072 J4.909 E.03392
G1 X131.577 Y126.587 E.34718
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
G2 X132.438 Y125.67 I-3.676 J-4.316 E.05044
G1 X132.471 Y118.875 E.27201
G3 X133.337 Y120.611 I-4.729 J3.442 E.07803
G1 X133.365 Y124.353 E.14978
G1 X130.5 Y123.303 F30000
; FEATURE: Support
G1 F1898
G1 X130.5 Y125.606 E.09217
G1 X125.5 Y125.606 E.20011
G1 X125.5 Y123.106 E.10006
G1 X130.5 Y123.106 E.20011
G1 X130.5 Y120.606 E.10006
G1 X125.5 Y120.606 E.20011
G1 X125.5 Y122.909 E.09217
; WIPE_START
G1 F7329.351
G1 X125.5 Y120.909 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.635 Y124.916 Z8.257 F30000
G1 Z7.857
G1 E.8 F1800
; FEATURE: Support interface
G1 F1898
G1 X122.635 Y120 E.19676
G3 X123.529 Y118.558 I5.265 J2.266 E.06818
G1 X123.529 Y126.21 E.30627
G1 X129.986 Y120.212 F30000
; FEATURE: Support transition
G1 F1200
G1 X130.5 Y120.212 E.02059
G1 X130.5 Y117.712 E.10007
G1 X129.788 Y117.712 E.02848
G1 X129.788 Y120.212 E.10007
G1 X128.894 Y120.212 E.03579
G1 X128.894 Y117.712 E.10007
G1 X128 Y117.712 E.03579
G1 X128 Y120.212 E.10007
G1 X127.106 Y120.212 E.03579
G1 X127.106 Y117.712 E.10007
G1 X126.212 Y117.712 E.03579
G1 X126.212 Y120.212 E.10007
G1 X125.5 Y120.212 E.02848
G1 X125.5 Y117.712 E.10007
G1 X126.014 Y117.712 E.02059
; CHANGE_LAYER
; Z_HEIGHT: 7.88
; LAYER_HEIGHT: 0.0231581
; WIPE_START
G1 X125.5 Y117.712 E-.19545
G1 X125.5 Y119.197 E-.56455
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/145
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.257 I-.38 J1.156 P1  F30000
G1 X134.678 Y122.217 Z8.257
G1 Z7.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.390702
; LAYER_HEIGHT: 0.12
M204 S5000
G1 X134.654 Y122.826 E.01087
G3 X134.569 Y123.466 I-6.782 J-.576 E.01153
; LINE_WIDTH: 0.390832
G3 X131.213 Y128.179 I-6.696 J-1.218 E.10666
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
; LINE_WIDTH: 0.389982
G1 X130.761 Y128.412 E.00906
; LINE_WIDTH: 0.389052
G1 X130.3 Y128.608 E.0089
; LINE_WIDTH: 0.389832
G1 X129.818 Y128.771 E.00906
; LINE_WIDTH: 0.390652
G1 X129.331 Y128.896 E.00896
; LINE_WIDTH: 0.390782
G3 X128.331 Y129.039 I-1.466 J-6.695 E.01805
; LINE_WIDTH: 0.389892
G1 X127.809 Y129.054 E.0093
; LINE_WIDTH: 0.388632
G1 X127.241 Y129.023 E.01009
; LINE_WIDTH: 0.388442
G3 X126.044 Y128.802 I.545 J-6.323 E.02162
; LINE_WIDTH: 0.386462
G1 X125.467 Y128.612 E.01071
; LINE_WIDTH: 0.385822
G1 X124.909 Y128.37 E.01072
; LINE_WIDTH: 0.384562
G1 X124.373 Y128.079 E.01069
; LINE_WIDTH: 0.384792
G3 X123.388 Y127.36 I3.48 J-5.798 E.02143
; LINE_WIDTH: 0.384522
G1 X122.949 Y126.936 E.01072
; LINE_WIDTH: 0.384932
G3 X122.19 Y125.983 I4.699 J-4.514 E.02143
; LINE_WIDTH: 0.384532
G3 X121.244 Y123.744 I5.635 J-3.703 E.04286
; LINE_WIDTH: 0.384892
G1 X121.133 Y123.142 E.01075
; LINE_WIDTH: 0.385412
G1 X121.079 Y122.533 E.01075
; LINE_WIDTH: 0.386232
G3 X121.14 Y121.313 I6.321 J-.298 E.02157
; LINE_WIDTH: 0.389342
G3 X133.263 Y118.094 I6.738 J.935 E.28376
; LINE_WIDTH: 0.389712
G3 X133.919 Y119.123 I-5.428 J4.181 E.02173
; LINE_WIDTH: 0.389352
G3 X134.531 Y120.836 I-6.852 J3.416 E.03242
; LINE_WIDTH: 0.389872
G1 X134.637 Y121.496 E.01191
; LINE_WIDTH: 0.390622
G1 X134.676 Y122.157 E.01182
; WIPE_START
M204 S10000
G1 X134.654 Y122.826 E-.25432
G1 X134.569 Y123.466 E-.24537
G1 X134.432 Y124.068 E-.23439
G1 X134.411 Y124.132 E-.02593
; WIPE_END
G1 E-.04
G1 X129.945 Y117.943 Z8.28 F30000
G1 X128.425 Y115.836 Z8.28
G1 Z7.88
G1 E.8 F1800
; LINE_WIDTH: 0.389362
M204 S5000
G1 X128.542 Y115.849 E.00209
G3 X131.693 Y117.06 I-.665 J6.434 E.06072
; LINE_WIDTH: 0.388162
G1 X132.109 Y117.394 E.00945
; LINE_WIDTH: 0.385762
G3 X134 Y120.251 I-4.234 J4.856 E.06104
; LINE_WIDTH: 0.385902
G3 X134.258 Y121.377 I-6.049 J1.978 E.02036
; LINE_WIDTH: 0.384752
G1 X134.31 Y121.953 E.01015
; LINE_WIDTH: 0.384322
G3 X134.26 Y123.107 I-6.375 J.301 E.02027
; LINE_WIDTH: 0.384442
G3 X133.552 Y125.295 I-6.38 J-.855 E.04056
; LINE_WIDTH: 0.384962
G3 X132.917 Y126.259 I-5.592 J-2.992 E.02031
; LINE_WIDTH: 0.384522
G3 X132.119 Y127.096 I-5.01 J-3.976 E.0203
; LINE_WIDTH: 0.384682
G1 X131.668 Y127.457 E.01013
; LINE_WIDTH: 0.385752
G1 X131.187 Y127.776 E.01018
; LINE_WIDTH: 0.386362
G1 X130.678 Y128.051 E.01019
; LINE_WIDTH: 0.388012
G3 X129.597 Y128.458 I-2.781 J-5.742 E.02049
; LINE_WIDTH: 0.386342
G1 X129.033 Y128.587 E.0102
; LINE_WIDTH: 0.385932
G1 X128.461 Y128.666 E.01017
; LINE_WIDTH: 0.386612
G1 X127.883 Y128.693 E.0102
; LINE_WIDTH: 0.388722
G3 X126.733 Y128.59 I.01 J-6.632 E.02052
; LINE_WIDTH: 0.388922
G3 X125.619 Y128.284 I1.192 J-6.52 E.02054
; LINE_WIDTH: 0.386022
G1 X125.087 Y128.057 E.01018
; LINE_WIDTH: 0.384622
G1 X124.578 Y127.784 E.01014
; LINE_WIDTH: 0.384842
G3 X123.643 Y127.106 I3.305 J-5.545 E.0203
; LINE_WIDTH: 0.384542
G1 X123.224 Y126.707 E.01015
; LINE_WIDTH: 0.384982
G3 X122.503 Y125.805 I4.57 J-4.395 E.02031
; LINE_WIDTH: 0.384542
G3 X121.597 Y123.691 I5.357 J-3.546 E.04057
; LINE_WIDTH: 0.385302
G1 X121.492 Y123.123 E.01015
; LINE_WIDTH: 0.385902
G1 X121.439 Y122.547 E.01018
; LINE_WIDTH: 0.389012
G1 X121.437 Y122.03 E.00918
; LINE_WIDTH: 0.389592
G3 X121.593 Y120.824 I6.696 J.252 E.02167
; LINE_WIDTH: 0.385772
G3 X123.63 Y117.403 I6.394 J1.491 E.0712
; LINE_WIDTH: 0.389362
G1 X123.706 Y117.339 E.00177
G3 X127.966 Y115.815 I4.171 J4.943 E.08217
G1 X128.365 Y115.833 E.00711
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.542 Y115.849 E-.06748
G1 X129.114 Y115.929 E-.21954
G1 X129.676 Y116.065 E-.21956
G1 X130.223 Y116.252 E-.21972
G1 X130.304 Y116.288 E-.0337
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 94/145
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.28 I-.976 J.727 P1  F30000
G1 X134.676 Y122.161 Z8.28
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.390632
G1 F1200
M204 S5000
G1 X134.679 Y122.204 E.00078
G1 X134.668 Y122.57 E.00653
; LINE_WIDTH: 0.384432
G3 X134.502 Y123.779 I-6.902 J-.335 E.02143
; LINE_WIDTH: 0.384532
G3 X133.856 Y125.487 I-7.414 J-1.826 E.03211
; LINE_WIDTH: 0.384982
G3 X133.182 Y126.501 I-5.745 J-3.087 E.02143
; LINE_WIDTH: 0.384522
G3 X132.337 Y127.382 I-5.223 J-4.164 E.02143
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
; LINE_WIDTH: 0.384702
G3 X131.346 Y128.094 I-4.159 J-4.746 E.02146
; LINE_WIDTH: 0.385072
G1 X130.807 Y128.387 E.01078
; LINE_WIDTH: 0.387002
G3 X129.662 Y128.811 I-2.666 J-5.441 E.0216
; LINE_WIDTH: 0.388712
M73 P74 R5
G1 X129.012 Y128.959 E.01183
; LINE_WIDTH: 0.389842
G3 X126.602 Y128.934 I-1.137 J-6.749 E.04312
; LINE_WIDTH: 0.389682
G3 X124.348 Y128.069 I1.286 J-6.717 E.04318
; LINE_WIDTH: 0.389362
G3 X122.487 Y126.406 I3.529 J-5.821 E.04463
; LINE_WIDTH: 0.389752
G3 X121.832 Y125.377 I5.536 J-4.25 E.02173
; LINE_WIDTH: 0.389362
G3 X121.37 Y124.248 I6.039 J-3.125 E.02172
; LINE_WIDTH: 0.389862
G3 X121.073 Y122.453 I7.381 J-2.143 E.03246
; LINE_WIDTH: 0.389512
G3 X121.14 Y121.275 I6.857 J-.202 E.02102
; LINE_WIDTH: 0.389362
G3 X121.935 Y118.929 I6.751 J.981 E.04428
; LINE_WIDTH: 0.389672
G3 X122.624 Y117.922 I5.973 J3.344 E.02174
; LINE_WIDTH: 0.389362
G3 X123.964 Y116.681 I5.831 J4.955 E.03255
; LINE_WIDTH: 0.389672
G3 X125.022 Y116.072 I3.931 J5.605 E.02174
; LINE_WIDTH: 0.389392
G3 X134.53 Y120.829 I2.853 J6.178 E.21693
; LINE_WIDTH: 0.389852
G1 X134.637 Y121.494 E.01199
; LINE_WIDTH: 0.390632
G1 X134.673 Y122.101 E.01085
; WIPE_START
G1 F1800
M204 S10000
G1 X134.679 Y122.204 E-.03931
G1 X134.668 Y122.57 E-.13899
G1 X134.612 Y123.178 E-.2321
G1 X134.502 Y123.779 E-.23209
G1 X134.419 Y124.077 E-.11752
; WIPE_END
G1 E-.04
G1 X129.915 Y117.914 Z8.4 F30000
G1 X128.392 Y115.83 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.385782
G1 F1200
M204 S5000
G1 X128.444 Y115.833 E.00093
G3 X131.172 Y116.715 I-.569 J6.42 E.05089
; LINE_WIDTH: 0.386432
G3 X132.108 Y117.393 I-3.241 J5.456 E.0204
; LINE_WIDTH: 0.385752
G3 X134 Y120.251 I-4.232 J4.857 E.06107
; LINE_WIDTH: 0.386012
G3 X134.258 Y121.377 I-6.036 J1.975 E.02037
; LINE_WIDTH: 0.384752
G1 X134.31 Y121.953 E.01015
; LINE_WIDTH: 0.384322
G3 X134.26 Y123.106 I-6.37 J.302 E.02027
; LINE_WIDTH: 0.384452
G3 X133.552 Y125.295 I-6.38 J-.855 E.04056
; LINE_WIDTH: 0.384942
G3 X132.916 Y126.26 I-5.599 J-2.997 E.02031
; LINE_WIDTH: 0.384522
G3 X132.12 Y127.096 I-5.011 J-3.979 E.02028
; LINE_WIDTH: 0.384682
G3 X131.186 Y127.775 I-4.147 J-4.722 E.02029
; LINE_WIDTH: 0.385612
G1 X130.678 Y128.051 E.01017
; LINE_WIDTH: 0.388012
G3 X129.597 Y128.458 I-2.741 J-5.644 E.02048
; LINE_WIDTH: 0.385442
G3 X128.461 Y128.665 I-1.706 J-6.124 E.02035
; LINE_WIDTH: 0.386572
G3 X126.169 Y128.462 I-.592 J-6.342 E.04081
; LINE_WIDTH: 0.385502
G3 X125.087 Y128.058 I1.693 J-6.181 E.02034
; LINE_WIDTH: 0.386692
G3 X124.095 Y127.467 I2.731 J-5.712 E.02041
; LINE_WIDTH: 0.385782
G3 X122.503 Y125.805 I3.763 J-5.2 E.04072
; LINE_WIDTH: 0.385962
G3 X121.954 Y124.789 I5.292 J-3.516 E.02037
; LINE_WIDTH: 0.385792
G3 X121.596 Y123.691 I5.865 J-2.519 E.02036
; LINE_WIDTH: 0.385302
G1 X121.492 Y123.123 E.01016
; LINE_WIDTH: 0.386082
G3 X121.439 Y121.969 I6.305 J-.87 E.02038
; LINE_WIDTH: 0.386592
G3 X121.592 Y120.824 I6.308 J.264 E.0204
; LINE_WIDTH: 0.385782
G3 X123.63 Y117.403 I6.395 J1.492 E.07121
G1 X123.632 Y117.401 E.00005
G3 X127.867 Y115.808 I4.243 J4.851 E.08139
G1 X128.332 Y115.827 E.00819
; CHANGE_LAYER
; Z_HEIGHT: 8.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.444 Y115.833 E-.0429
G1 X129.017 Y115.909 E-.21965
G1 X129.581 Y116.037 E-.21982
G1 X130.131 Y116.215 E-.21966
G1 X130.272 Y116.275 E-.05797
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 95/145
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.4 I-.973 J.731 P1  F30000
G1 X134.674 Y122.134 Z8.4
G1 Z8.12
G1 E.8 F1800
; LINE_WIDTH: 0.390642
G1 F1200
M204 S5000
G1 X134.679 Y122.207 E.00131
G1 X134.668 Y122.57 E.00648
; LINE_WIDTH: 0.384432
G1 X134.611 Y123.178 E.01072
; LINE_WIDTH: 0.384542
G3 X134.122 Y124.937 I-7.5 J-1.139 E.03211
; LINE_WIDTH: 0.384942
G3 X133.542 Y126.008 I-6.012 J-2.566 E.02143
; LINE_WIDTH: 0.384522
G3 X132.338 Y127.381 I-6.259 J-4.273 E.03211
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
; LINE_WIDTH: 0.384672
G3 X131.346 Y128.094 I-4.161 J-4.748 E.02146
; LINE_WIDTH: 0.385102
G1 X130.806 Y128.387 E.01079
; LINE_WIDTH: 0.386692
G3 X129.662 Y128.811 I-2.687 J-5.5 E.02158
; LINE_WIDTH: 0.388732
G1 X129.01 Y128.959 E.01186
; LINE_WIDTH: 0.389822
G3 X126.599 Y128.934 I-1.135 J-6.748 E.04314
; LINE_WIDTH: 0.389672
G3 X124.345 Y128.068 I1.288 J-6.717 E.04319
; LINE_WIDTH: 0.389352
G3 X121.37 Y124.247 I3.534 J-5.821 E.08801
; LINE_WIDTH: 0.389812
G1 X121.209 Y123.613 E.01166
; LINE_WIDTH: 0.389922
G3 X121.073 Y122.453 I6.723 J-1.373 E.02081
; LINE_WIDTH: 0.389522
G3 X121.14 Y121.273 I6.854 J-.201 E.02105
; LINE_WIDTH: 0.389362
G3 X131.925 Y116.781 I6.74 J.99 E.24955
; LINE_WIDTH: 0.389212
G1 X132.435 Y117.199 E.01171
; LINE_WIDTH: 0.389352
G3 X134.53 Y120.831 I-4.685 J5.123 E.07574
; LINE_WIDTH: 0.389802
G1 X134.637 Y121.491 E.0119
; LINE_WIDTH: 0.390642
G1 X134.671 Y122.074 E.0104
; WIPE_START
G1 F1800
M204 S10000
G1 X134.679 Y122.207 E-.05065
G1 X134.668 Y122.57 E-.13799
G1 X134.611 Y123.178 E-.2322
G1 X134.499 Y123.788 E-.23558
G1 X134.426 Y124.05 E-.10358
; WIPE_END
G1 E-.04
G1 X129.9 Y117.905 Z8.52 F30000
G1 X128.372 Y115.829 Z8.52
G1 Z8.12
G1 E.8 F1800
; LINE_WIDTH: 0.385782
G1 F1200
M204 S5000
G1 X128.445 Y115.832 E.00128
; LINE_WIDTH: 0.386392
G3 X129.581 Y116.037 I-.555 J6.33 E.02039
; LINE_WIDTH: 0.385802
G3 X131.172 Y116.715 I-2.018 J6.946 E.03052
; LINE_WIDTH: 0.386392
G3 X132.115 Y117.399 I-3.242 J5.457 E.02057
; LINE_WIDTH: 0.385762
G3 X134 Y120.251 I-4.239 J4.85 E.0609
; LINE_WIDTH: 0.385982
G3 X134.258 Y121.377 I-6.045 J1.977 E.02037
; LINE_WIDTH: 0.384802
G1 X134.31 Y121.953 E.01015
; LINE_WIDTH: 0.384322
G3 X134.26 Y123.106 I-6.369 J.302 E.02027
; LINE_WIDTH: 0.384522
G3 X133.802 Y124.774 I-7.13 J-1.06 E.03041
; LINE_WIDTH: 0.384902
G3 X133.256 Y125.792 I-5.848 J-2.485 E.02031
; LINE_WIDTH: 0.384522
G3 X132.12 Y127.095 I-5.972 J-4.055 E.0304
; LINE_WIDTH: 0.384662
G3 X131.186 Y127.775 I-4.145 J-4.72 E.0203
; LINE_WIDTH: 0.385642
G1 X130.678 Y128.051 E.01017
; LINE_WIDTH: 0.388262
G3 X129.597 Y128.458 I-2.774 J-5.729 E.0205
; LINE_WIDTH: 0.385402
G3 X128.461 Y128.665 I-1.708 J-6.134 E.02034
; LINE_WIDTH: 0.386542
G3 X126.169 Y128.462 I-.592 J-6.345 E.04081
; LINE_WIDTH: 0.385502
G3 X125.087 Y128.058 I1.694 J-6.185 E.02034
; LINE_WIDTH: 0.386762
G3 X124.095 Y127.467 I2.71 J-5.677 E.02042
; LINE_WIDTH: 0.385782
G1 X123.64 Y127.105 E.01022
; LINE_WIDTH: 0.385772
G3 X121.596 Y123.691 I4.349 J-4.922 E.07117
; LINE_WIDTH: 0.385112
G1 X121.492 Y123.123 E.01015
; LINE_WIDTH: 0.386112
G3 X121.439 Y121.969 I6.288 J-.87 E.02038
; LINE_WIDTH: 0.386562
G3 X121.592 Y120.824 I6.315 J.265 E.0204
; LINE_WIDTH: 0.385782
G3 X127.867 Y115.807 I6.283 J1.425 E.1527
G1 X128.312 Y115.826 E.00784
; CHANGE_LAYER
; Z_HEIGHT: 8.12842
; LAYER_HEIGHT: 0.00842094
; WIPE_START
G1 F1800
M204 S10000
G1 X128.445 Y115.832 E-.05046
G1 X129.017 Y115.909 E-.21954
G1 X129.581 Y116.037 E-.2198
G1 X130.132 Y116.215 E-.21988
G1 X130.254 Y116.267 E-.05031
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 96/145
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.52 I-.984 J-.717 P1  F30000
G1 X125.559 Y122.711 Z8.52
G1 Z8.128
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F2063
G1 X130.5 Y122.711 E.19774
G1 X130.5 Y120.606 E.08427
G1 X125.5 Y120.606 E.20011
G1 X125.5 Y122.711 E.08427
G1 X126.014 Y123.106 F30000
; FEATURE: Support transition
G1 F1200
G1 X125.5 Y123.106 E.02059
G1 X125.5 Y125.606 E.10007
G1 X126.212 Y125.606 E.02848
G1 X126.212 Y123.106 E.10007
G1 X127.106 Y123.106 E.03579
G1 X127.106 Y125.606 E.10007
G1 X128 Y125.606 E.03579
G1 X128 Y123.106 E.10007
G1 X128.894 Y123.106 E.03579
G1 X128.894 Y125.606 E.10007
G1 X129.788 Y125.606 E.03579
G1 X129.788 Y123.106 E.10007
G1 X130.5 Y123.106 E.02848
G1 X130.5 Y125.606 E.10007
G1 X129.986 Y125.606 E.02059
; WIPE_START
G1 X130.5 Y125.606 E-.19546
G1 X130.5 Y124.12 E-.56454
; WIPE_END
G1 E-.04 F1800
G1 X130.683 Y127.415 Z8.528 F30000
G1 Z8.128
G1 E.8 F1800
; FEATURE: Support interface
G1 F2063
G1 X130.683 Y126 E.05666
G1 X129.788 Y126 E.03579
G1 X129.788 Y127.621 E.0649
G3 X129.012 Y127.838 I-1.899 J-5.314 E.0323
G1 X128.894 Y127.861 E.00479
G1 X128.894 Y126 E.07449
G1 X128 Y126 E.03579
G1 X128 Y127.951 E.07809
G3 X127.243 Y127.917 I-.124 J-5.709 E.03037
G1 X127.106 Y127.9 E.00552
G1 X127.106 Y126 E.07605
G1 X126.212 Y126 E.03579
G1 X126.212 Y127.704 E.06823
G3 X125.322 Y127.349 I1.712 J-5.569 E.03837
G1 X125.317 Y126 E.05399
G1 X125.106 Y126 E.00846
G1 X125.106 Y120.212 E.23166
G1 X125.317 Y120.212 E.00846
G1 X125.317 Y117.153 E.12242
G3 X126.194 Y116.8 I2.587 J5.159 E.03789
G1 X126.212 Y120.212 E.13656
G1 X127.106 Y120.212 E.03579
G1 X127.106 Y116.6 E.14458
G3 X127.351 Y116.571 I.6 J4.099 E.00989
G1 X127.543 Y116.557 E.00769
G3 X127.99 Y116.548 I.333 J6.028 E.01788
G1 X128 Y120.212 E.14662
G1 X128.894 Y120.212 E.03579
G1 X128.894 Y116.639 E.14301
G3 X129.171 Y116.696 I-.836 J4.681 E.0113
G3 X129.71 Y116.85 I-2.229 J8.844 E.02245
G1 X129.788 Y116.878 E.00334
G1 X129.788 Y120.212 E.13343
G1 X130.683 Y120.212 E.03579
G1 X130.683 Y117.286 E.11709
G3 X131.577 Y117.913 I-2.84 J5.006 E.04376
G1 X131.577 Y126.587 E.34719
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
G2 X132.453 Y125.65 I-3.747 J-4.381 E.05146
G1 X132.471 Y118.875 E.27118
G3 X133.337 Y120.611 I-4.604 J3.379 E.07803
G1 X133.365 Y124.353 E.1498
; WIPE_START
G1 F4800
G1 X133.35 Y122.354 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.583 Y125.883 Z8.528 F30000
G1 X124.423 Y127.01 Z8.528
G1 Z8.128
G1 E.8 F1800
G1 F2063
G1 X124.423 Y117.711 E.37219
G1 X124.364 Y117.756 E.003
G2 X123.529 Y118.558 I3.76 J4.754 E.04638
G1 X123.529 Y125.942 E.29555
G1 X123.457 Y125.855 E.0045
G3 X122.635 Y124.499 I4.43 J-3.615 E.0637
G1 X122.635 Y119.583 E.19676
; CHANGE_LAYER
; Z_HEIGHT: 8.24
; LAYER_HEIGHT: 0.111579
; WIPE_START
G1 F4800
G1 X122.635 Y121.583 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/145
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.528 I-.053 J1.216 P1  F30000
G1 X134.673 Y122.106 Z8.528
G1 Z8.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.390642
; LAYER_HEIGHT: 0.12
M204 S5000
G1 X134.679 Y122.209 E.00184
G1 X134.668 Y122.57 E.00643
; LINE_WIDTH: 0.384432
G3 X134.5 Y123.786 I-6.885 J-.332 E.02155
; LINE_WIDTH: 0.384532
G3 X134.122 Y124.937 I-6.612 J-1.531 E.02129
; LINE_WIDTH: 0.384932
M73 P75 R5
G3 X133.541 Y126.008 I-6.025 J-2.574 E.02142
; LINE_WIDTH: 0.384522
G3 X132.338 Y127.381 I-6.26 J-4.274 E.03211
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
; LINE_WIDTH: 0.384682
G3 X131.345 Y128.094 I-4.163 J-4.751 E.02147
; LINE_WIDTH: 0.385132
G1 X130.806 Y128.387 E.01078
; LINE_WIDTH: 0.386642
G3 X129.662 Y128.811 I-2.694 J-5.519 E.02158
; LINE_WIDTH: 0.388772
G1 X129.008 Y128.959 E.01189
; LINE_WIDTH: 0.389792
G3 X127.803 Y129.054 I-1.143 J-6.824 E.02154
; LINE_WIDTH: 0.389652
G3 X124.343 Y128.066 I.076 J-6.821 E.0648
; LINE_WIDTH: 0.389362
G3 X121.37 Y124.248 I3.537 J-5.819 E.08794
; LINE_WIDTH: 0.389802
G3 X121.073 Y122.453 I7.424 J-2.151 E.03246
; LINE_WIDTH: 0.389512
G3 X121.141 Y121.27 I6.848 J-.201 E.02109
; LINE_WIDTH: 0.389372
G3 X121.662 Y119.475 I7.524 J1.21 E.03332
; LINE_WIDTH: 0.389522
G3 X122.257 Y118.41 I6.234 J2.787 E.02173
; LINE_WIDTH: 0.389362
G3 X123.447 Y117.083 I6.288 J4.441 E.03175
; LINE_WIDTH: 0.388392
G1 X123.928 Y116.707 E.01083
; LINE_WIDTH: 0.389352
G3 X133.263 Y118.094 I3.944 J5.567 E.18527
; LINE_WIDTH: 0.389522
G3 X133.919 Y119.123 I-5.409 J4.169 E.02173
; LINE_WIDTH: 0.389352
G3 X134.53 Y120.831 I-6.86 J3.42 E.03232
; LINE_WIDTH: 0.389942
G1 X134.637 Y121.489 E.01188
; LINE_WIDTH: 0.390642
G1 X134.669 Y122.047 E.00996
; WIPE_START
M204 S10000
G1 X134.679 Y122.209 E-.06198
G1 X134.668 Y122.57 E-.137
G1 X134.612 Y123.178 E-.23219
G1 X134.5 Y123.786 E-.23468
G1 X134.433 Y124.024 E-.09415
; WIPE_END
G1 E-.04
G1 X129.885 Y117.895 Z8.64 F30000
G1 X128.352 Y115.828 Z8.64
G1 Z8.24
G1 E.8 F1800
; LINE_WIDTH: 0.385782
M204 S5000
G1 X128.445 Y115.832 E.00163
G3 X131.173 Y116.715 I-.57 J6.417 E.05089
; LINE_WIDTH: 0.386362
G3 X132.108 Y117.393 I-3.245 J5.461 E.0204
; LINE_WIDTH: 0.385742
G3 X134 Y120.251 I-4.232 J4.857 E.06107
; LINE_WIDTH: 0.385992
G3 X134.257 Y121.37 I-6.027 J1.973 E.02024
; LINE_WIDTH: 0.384792
G1 X134.31 Y121.953 E.01027
; LINE_WIDTH: 0.384332
G3 X134.26 Y123.106 I-6.364 J.303 E.02028
; LINE_WIDTH: 0.384492
G3 X133.802 Y124.774 I-7.135 J-1.062 E.03041
; LINE_WIDTH: 0.384882
G3 X133.255 Y125.792 I-5.852 J-2.487 E.02031
; LINE_WIDTH: 0.384522
G3 X132.12 Y127.096 I-5.971 J-4.055 E.0304
; LINE_WIDTH: 0.384662
G3 X131.185 Y127.775 I-4.148 J-4.723 E.0203
; LINE_WIDTH: 0.385662
G1 X130.678 Y128.051 E.01017
; LINE_WIDTH: 0.388292
G3 X129.597 Y128.458 I-2.778 J-5.742 E.0205
; LINE_WIDTH: 0.385382
G3 X128.461 Y128.665 I-1.709 J-6.143 E.02034
; LINE_WIDTH: 0.386512
G3 X126.169 Y128.462 I-.592 J-6.348 E.0408
; LINE_WIDTH: 0.385502
G3 X125.087 Y128.058 I1.694 J-6.185 E.02035
; LINE_WIDTH: 0.386702
G3 X124.095 Y127.467 I2.714 J-5.683 E.0204
; LINE_WIDTH: 0.385772
G1 X123.64 Y127.105 E.01023
G3 X121.596 Y123.691 I4.349 J-4.923 E.07116
; LINE_WIDTH: 0.385132
G1 X121.492 Y123.123 E.01016
; LINE_WIDTH: 0.386092
G3 X121.439 Y121.969 I6.294 J-.87 E.02038
; LINE_WIDTH: 0.386512
G3 X121.592 Y120.824 I6.32 J.265 E.02039
; LINE_WIDTH: 0.385792
G3 X123.213 Y117.803 I6.282 J1.425 E.06108
; LINE_WIDTH: 0.386352
G3 X124.081 Y117.042 I4.632 J4.41 E.02039
; LINE_WIDTH: 0.386192
G1 X124.564 Y116.723 E.01019
; LINE_WIDTH: 0.385782
G3 X127.867 Y115.807 I3.311 J5.527 E.06107
G1 X128.292 Y115.826 E.00749
; CHANGE_LAYER
; Z_HEIGHT: 8.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.445 Y115.832 E-.05799
G1 X129.017 Y115.909 E-.21949
G1 X129.581 Y116.037 E-.21981
G1 X130.132 Y116.215 E-.21977
G1 X130.235 Y116.259 E-.04294
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 98/145
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.64 I-.969 J.736 P1  F30000
G1 X134.675 Y122.105 Z8.64
G1 Z8.36
G1 E.8 F1800
; LINE_WIDTH: 0.389112
G1 F1200
M204 S5000
G1 X134.666 Y122.568 E.00822
; LINE_WIDTH: 0.384152
G1 X134.611 Y123.182 E.01081
; LINE_WIDTH: 0.384532
G3 X133.542 Y126.009 I-6.991 J-1.028 E.05343
; LINE_WIDTH: 0.384892
G3 X132.779 Y126.96 I-5.479 J-3.615 E.02142
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
; LINE_WIDTH: 0.384522
G1 X132.337 Y127.382 E.01072
; LINE_WIDTH: 0.384672
G3 X131.346 Y128.094 I-4.162 J-4.75 E.02146
; LINE_WIDTH: 0.385162
G1 X130.806 Y128.387 E.01079
; LINE_WIDTH: 0.386592
G3 X129.661 Y128.811 I-2.702 J-5.541 E.02157
; LINE_WIDTH: 0.388822
G1 X129.007 Y128.96 E.01192
; LINE_WIDTH: 0.389772
G3 X126.595 Y128.933 I-1.132 J-6.743 E.04315
; LINE_WIDTH: 0.389622
G3 X124.34 Y128.064 I1.291 J-6.712 E.04322
; LINE_WIDTH: 0.389362
G3 X123.316 Y127.301 I3.549 J-5.832 E.02273
; LINE_WIDTH: 0.389472
G3 X122.487 Y126.405 I4.57 J-5.061 E.02174
; LINE_WIDTH: 0.389362
G3 X121.37 Y124.247 I5.387 J-4.155 E.04343
; LINE_WIDTH: 0.389762
G1 X121.209 Y123.617 E.01158
; LINE_WIDTH: 0.389882
G3 X121.073 Y122.452 I6.713 J-1.376 E.02091
; LINE_WIDTH: 0.389502
G3 X121.141 Y121.268 I6.845 J-.201 E.02113
; LINE_WIDTH: 0.389362
G3 X121.935 Y118.929 I6.747 J.987 E.04415
; LINE_WIDTH: 0.389472
G3 X122.624 Y117.922 I5.95 J3.328 E.02173
; LINE_WIDTH: 0.389352
G3 X124.48 Y116.353 I5.252 J4.329 E.04343
; LINE_WIDTH: 0.389492
G3 X125.587 Y115.841 I3.401 J5.909 E.02172
; LINE_WIDTH: 0.389372
G3 X131.459 Y116.465 I2.288 J6.408 E.10859
; LINE_WIDTH: 0.389782
G3 X132.434 Y117.198 I-3.686 J5.92 E.02173
; LINE_WIDTH: 0.389332
G3 X134.531 Y120.834 I-4.684 J5.124 E.07581
; LINE_WIDTH: 0.389942
G3 X134.677 Y122.043 I-6.749 J1.426 E.02171
; LINE_WIDTH: 0.389112
G1 X134.676 Y122.045 E.00004
; WIPE_START
G1 F1800
M204 S10000
G1 X134.666 Y122.568 E-.19858
G1 X134.611 Y123.182 E-.23452
G1 X134.502 Y123.778 E-.23016
G1 X134.433 Y124.023 E-.09675
; WIPE_END
G1 E-.04
G1 X129.876 Y117.901 Z8.76 F30000
G1 X128.333 Y115.827 Z8.76
G1 Z8.36
G1 E.8 F1800
; LINE_WIDTH: 0.385782
G1 F1200
M204 S5000
G1 X128.444 Y115.838 E.00197
G3 X131.652 Y117.031 I-.568 J6.44 E.06096
; LINE_WIDTH: 0.385922
G3 X132.526 Y117.791 I-3.719 J5.157 E.02044
; LINE_WIDTH: 0.385762
G3 X134 Y120.251 I-4.883 J4.597 E.05087
; LINE_WIDTH: 0.385932
G3 X134.257 Y121.373 I-6.043 J1.977 E.02029
; LINE_WIDTH: 0.386132
G3 X134.31 Y122.531 I-6.091 J.858 E.02046
; LINE_WIDTH: 0.384102
G1 X134.259 Y123.111 E.0102
; LINE_WIDTH: 0.384542
G3 X133.256 Y125.792 I-6.632 J-.953 E.0506
; LINE_WIDTH: 0.384852
G3 X132.537 Y126.695 I-5.316 J-3.493 E.0203
; LINE_WIDTH: 0.384522
G1 X132.12 Y127.096 E.01014
; LINE_WIDTH: 0.384652
G3 X131.186 Y127.775 I-4.146 J-4.721 E.02029
; LINE_WIDTH: 0.385702
G1 X130.678 Y128.051 E.01017
; LINE_WIDTH: 0.388342
G1 X130.177 Y128.267 E.00967
; LINE_WIDTH: 0.389662
G3 X129.033 Y128.587 I-2.426 J-6.462 E.02116
; LINE_WIDTH: 0.385332
G1 X128.461 Y128.665 E.01017
; LINE_WIDTH: 0.386472
G3 X126.168 Y128.462 I-.591 J-6.353 E.04081
; LINE_WIDTH: 0.385512
G3 X125.087 Y128.058 I1.696 J-6.189 E.02034
; LINE_WIDTH: 0.386652
G3 X124.095 Y127.467 I2.718 J-5.69 E.0204
; LINE_WIDTH: 0.385782
G3 X121.596 Y123.691 I3.778 J-5.215 E.08144
; LINE_WIDTH: 0.385142
G1 X121.492 Y123.123 E.01015
; LINE_WIDTH: 0.386082
G3 X121.439 Y121.969 I6.297 J-.87 E.02038
; LINE_WIDTH: 0.386472
G3 X121.592 Y120.824 I6.325 J.266 E.02041
; LINE_WIDTH: 0.385792
G3 X123.63 Y117.403 I6.397 J1.494 E.0712
G1 X123.632 Y117.401 E.00005
; LINE_WIDTH: 0.385782
G3 X127.867 Y115.813 I4.244 J4.877 E.08133
G1 X128.273 Y115.826 E.00715
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F1800
M204 S10000
G1 X128.444 Y115.838 E-.06528
G1 X129.017 Y115.909 E-.21948
G1 X129.581 Y116.037 E-.21976
G1 X130.132 Y116.215 E-.2198
G1 X130.218 Y116.252 E-.03568
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 99/145
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.76 I-.987 J-.712 P1  F30000
G1 X125.559 Y122.711 Z8.76
G1 Z8.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.271579
G1 F1749
G1 X130.5 Y122.711 E.19774
G1 X130.5 Y120.606 E.08427
G1 X125.5 Y120.606 E.20011
G1 X125.5 Y122.711 E.08427
; WIPE_START
G1 F7329.351
G1 X125.5 Y120.711 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.635 Y119.583 Z8.8 F30000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F1749
G1 X122.635 Y124.499 E.19678
G2 X123.343 Y125.711 I5.276 J-2.272 E.05631
G1 X123.529 Y125.942 E.01188
G1 X123.529 Y118.557 E.29558
G3 X124.423 Y117.711 I4.382 J3.733 E.04938
G1 X124.423 Y127.01 E.37221
; WIPE_START
G1 F4800
G1 X124.423 Y125.01 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.683 Y127.416 Z8.8 F30000
G1 Z8.4
G1 E.8 F1800
G1 F1749
G1 X130.683 Y123.105 E.17252
G1 X129.788 Y123.105 E.03579
G1 X129.788 Y127.621 E.18075
G3 X128.965 Y127.847 I-2.122 J-6.134 E.0342
G1 X128.894 Y127.861 E.00289
G1 X128.894 Y123.105 E.19034
G1 X128 Y123.105 E.03579
G1 X128 Y127.951 E.19394
G3 X127.212 Y127.914 I-.073 J-6.859 E.03158
G1 X127.106 Y127.9 E.0043
G1 X127.106 Y123.105 E.1919
G1 X126.212 Y123.105 E.03579
G1 X126.212 Y127.704 E.18408
G3 X125.317 Y127.346 I1.807 J-5.805 E.0386
G1 X125.317 Y123.105 E.16974
G1 X125.106 Y123.105 E.00846
G1 X125.106 Y120.212 E.11581
G1 X125.317 Y120.212 E.00846
G1 X125.317 Y117.153 E.12243
G3 X126.108 Y116.828 I2.851 J5.811 E.03426
G1 X126.212 Y116.795 E.00433
G1 X126.212 Y120.212 E.13676
G1 X127.106 Y120.212 E.03579
G1 X127.106 Y116.599 E.14459
G3 X128 Y116.549 I.771 J5.666 E.03589
G1 X128 Y120.212 E.14662
G1 X128.894 Y120.212 E.03579
G1 X128.894 Y116.639 E.14302
G3 X129.788 Y116.878 I-1.026 J5.623 E.03709
G1 X129.788 Y120.212 E.13344
G1 X130.683 Y120.212 E.03579
G1 X130.683 Y117.286 E.1171
G3 X131.577 Y117.912 I-2.815 J4.971 E.04376
G1 X131.577 Y126.587 E.3472
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
G2 X132.355 Y125.778 I-3.719 J-4.355 E.04498
G1 X132.471 Y125.625 E.00771
G1 X132.471 Y118.874 E.27019
G3 X133.365 Y120.71 I-4.597 J3.375 E.08216
G1 X133.365 Y124.354 E.14586
; CHANGE_LAYER
; Z_HEIGHT: 8.48
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F4800
G1 X133.365 Y122.354 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/145
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.8 I.25 J1.191 P1  F30000
G1 X134.676 Y122.079 Z8.8
G1 Z8.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389122
; LAYER_HEIGHT: 0.12
G1 F1749
M204 S5000
G1 X134.666 Y122.567 E.00868
; LINE_WIDTH: 0.384222
G1 X134.612 Y123.178 E.01074
; LINE_WIDTH: 0.384462
G3 X133.856 Y125.486 I-6.728 J-.924 E.04283
; LINE_WIDTH: 0.384872
G3 X133.182 Y126.501 I-5.79 J-3.115 E.02142
; LINE_WIDTH: 0.384532
G3 X132.337 Y127.382 I-5.234 J-4.175 E.02144
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
; LINE_WIDTH: 0.384682
G3 X131.346 Y128.094 I-4.167 J-4.758 E.02146
; LINE_WIDTH: 0.385182
G1 X130.806 Y128.387 E.01079
; LINE_WIDTH: 0.386552
G3 X129.661 Y128.811 I-2.709 J-5.559 E.02157
; LINE_WIDTH: 0.388842
G1 X129.005 Y128.96 E.01195
; LINE_WIDTH: 0.389752
G3 X125.363 Y128.574 I-1.129 J-6.723 E.06598
; LINE_WIDTH: 0.389602
G3 X124.337 Y128.063 I2.518 J-6.341 E.02042
; LINE_WIDTH: 0.389402
G3 X122.487 Y126.405 I3.544 J-5.819 E.04441
; LINE_WIDTH: 0.389672
G3 X121.831 Y125.377 I5.512 J-4.235 E.02173
; LINE_WIDTH: 0.389372
G3 X121.37 Y124.248 I6.038 J-3.125 E.02172
; LINE_WIDTH: 0.389742
M73 P76 R5
G3 X121.073 Y122.452 I7.375 J-2.142 E.03248
; LINE_WIDTH: 0.389492
G3 X121.142 Y121.266 I6.843 J-.2 E.02115
; LINE_WIDTH: 0.389372
G3 X134.532 Y120.84 I6.734 J.992 E.33704
; LINE_WIDTH: 0.389802
G3 X134.676 Y122.019 I-6.727 J1.418 E.02117
; WIPE_START
G1 F1800
M204 S10000
G1 X134.666 Y122.567 E-.20844
G1 X134.612 Y123.178 E-.23295
G1 X134.502 Y123.777 E-.23136
G1 X134.44 Y123.998 E-.08725
; WIPE_END
G1 E-.04
G1 X129.862 Y117.891 Z8.88 F30000
G1 X128.313 Y115.826 Z8.88
G1 Z8.48
G1 E.8 F1800
; LINE_WIDTH: 0.385782
G1 F1749
M204 S5000
G1 X128.443 Y115.838 E.00229
G3 X134.258 Y121.377 I-.573 J6.424 E.15261
; LINE_WIDTH: 0.386112
G3 X134.31 Y122.53 I-6.106 J.853 E.02037
; LINE_WIDTH: 0.384172
G1 X134.26 Y123.106 E.01013
; LINE_WIDTH: 0.384452
G3 X133.552 Y125.295 I-6.381 J-.855 E.04056
; LINE_WIDTH: 0.384842
G3 X132.917 Y126.26 I-5.614 J-3.006 E.0203
; LINE_WIDTH: 0.384522
G3 X132.119 Y127.096 I-5.015 J-3.982 E.0203
; LINE_WIDTH: 0.384672
G3 X131.186 Y127.775 I-4.153 J-4.731 E.02029
; LINE_WIDTH: 0.385722
G1 X130.678 Y128.051 E.01018
; LINE_WIDTH: 0.388392
G1 X130.18 Y128.266 E.00961
; LINE_WIDTH: 0.389652
G3 X129.033 Y128.587 I-2.422 J-6.436 E.02121
; LINE_WIDTH: 0.385312
G1 X128.461 Y128.665 E.01016
; LINE_WIDTH: 0.386422
G3 X126.17 Y128.462 I-.591 J-6.354 E.04077
; LINE_WIDTH: 0.385522
G3 X125.087 Y128.058 I1.693 J-6.185 E.02038
; LINE_WIDTH: 0.386612
G3 X124.096 Y127.467 I2.721 J-5.694 E.02037
; LINE_WIDTH: 0.385782
G1 X123.64 Y127.105 E.01025
; LINE_WIDTH: 0.385752
G3 X122.503 Y125.805 I4.827 J-5.37 E.03047
; LINE_WIDTH: 0.385922
G3 X121.954 Y124.789 I5.305 J-3.523 E.02037
; LINE_WIDTH: 0.385782
G3 X121.596 Y123.691 I5.876 J-2.522 E.02036
; LINE_WIDTH: 0.385372
G1 X121.492 Y123.123 E.01015
; LINE_WIDTH: 0.386012
G3 X121.438 Y121.969 I6.32 J-.871 E.02037
; LINE_WIDTH: 0.386442
G3 X121.592 Y120.824 I6.332 J.267 E.0204
; LINE_WIDTH: 0.385782
G3 X123.212 Y117.804 I6.282 J1.425 E.06107
; LINE_WIDTH: 0.386282
G3 X124.083 Y117.041 I4.609 J4.386 E.02043
; LINE_WIDTH: 0.385782
G3 X127.867 Y115.812 I3.787 J5.22 E.07119
G1 X128.253 Y115.825 E.0068
; CHANGE_LAYER
; Z_HEIGHT: 8.52
; LAYER_HEIGHT: 0.0400009
; WIPE_START
G1 F1800
M204 S10000
G1 X128.443 Y115.838 E-.07211
G1 X129.017 Y115.909 E-.21997
G1 X129.581 Y116.037 E-.21984
G1 X130.132 Y116.215 E-.21982
G1 X130.2 Y116.244 E-.02826
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 101/145
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.88 I-1.119 J.479 P1  F30000
G1 X130.683 Y117.372 Z8.88
G1 Z8.52
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.12
G1 F1379
G1 X130.683 Y120.212 E.05474
G1 X129.788 Y120.212 E.01724
G1 X129.788 Y117.146 E.05909
G2 X128.894 Y116.894 I-2.079 J5.672 E.01792
G1 X128.894 Y120.212 E.06395
G1 X128 Y120.212 E.01724
G1 X128 Y116.801 E.06574
G2 X127.106 Y116.853 I-.14 J5.291 E.01729
G1 X127.106 Y120.212 E.06473
G1 X126.212 Y120.212 E.01724
G1 X126.212 Y117.058 E.06078
G2 X125.317 Y117.435 I1.93 J5.833 E.01872
G1 X125.317 Y120.212 E.05352
G1 X125.106 Y120.212 E.00407
G1 X125.106 Y126 E.11157
G1 X125.317 Y126 E.00407
G1 X125.317 Y127.063 E.0205
G2 X126.212 Y127.44 I2.677 J-5.103 E.01873
G1 X126.212 Y126 E.02777
G1 X127.106 Y126 E.01724
G1 X127.106 Y127.647 E.03176
G2 X128 Y127.7 I1.029 J-9.832 E.01727
G1 X128 Y126 E.03277
G1 X128.894 Y126 E.01724
G1 X128.894 Y127.605 E.03093
G2 X129.788 Y127.353 I-1.685 J-7.7 E.01792
G1 X129.788 Y126 E.02608
G1 X130.683 Y126 E.01724
G1 X130.683 Y126.921 E.01776
G2 X131.577 Y126.253 I-3.017 J-4.97 E.02155
G1 X131.577 Y118.249 E.15427
G3 X132.471 Y119.319 I-3.849 J4.127 E.02694
G1 X132.471 Y125.497 E.11909
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
; WIPE_START
G1 F4800
G1 X132.471 Y123.497 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.378 Y126.316 Z8.92 F30000
G1 X124.423 Y126.695 Z8.92
G1 Z8.52
G1 E.8 F1800
G1 F1379
G1 X124.423 Y118.031 E.16701
G2 X123.529 Y118.961 I3.617 J4.374 E.02492
G1 X123.529 Y125.538 E.12679
G3 X122.635 Y123.754 I4.363 J-3.303 E.03869
G1 X122.635 Y120.191 E.06868
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F4800
G1 X122.635 Y122.191 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/145
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.92 I.017 J1.217 P1  F30000
G1 X134.65 Y122.023 Z8.92
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.439342
; LAYER_HEIGHT: 0.12
G1 F1379
M204 S5000
G1 X134.652 Y122.046 E.00046
; LINE_WIDTH: 0.439382
G1 X134.652 Y122.167 E.00244
; LINE_WIDTH: 0.439892
G1 X134.642 Y122.668 E.01016
; LINE_WIDTH: 0.442352
G3 X134.458 Y123.867 I-7.049 J-.466 E.02472
; LINE_WIDTH: 0.442802
G3 X134.065 Y125.016 I-6.903 J-1.721 E.0248
; LINE_WIDTH: 0.439942
G3 X132.698 Y127.014 I-6.213 J-2.783 E.04927
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
; LINE_WIDTH: 0.439382
G1 X132.252 Y127.428 E.01231
; LINE_WIDTH: 0.439732
G3 X131.089 Y128.219 I-4.435 J-5.267 E.02852
; LINE_WIDTH: 0.440292
G3 X129.921 Y128.713 I-3.261 J-6.088 E.02573
; LINE_WIDTH: 0.439892
G1 X129.398 Y128.856 E.01098
; LINE_WIDTH: 0.439422
G1 X128.598 Y128.99 E.0164
; LINE_WIDTH: 0.440422
G3 X127.241 Y128.997 I-.711 J-6.586 E.02757
; LINE_WIDTH: 0.439222
G1 X126.591 Y128.906 E.01326
; LINE_WIDTH: 0.440252
G3 X125.282 Y128.512 I1.263 J-6.559 E.02775
; LINE_WIDTH: 0.436762
G3 X124.208 Y127.947 I2.42 J-5.911 E.02443
; LINE_WIDTH: 0.436352
G3 X123.275 Y127.228 I3.516 J-5.524 E.02369
; LINE_WIDTH: 0.442802
G3 X122.506 Y126.389 I4.738 J-5.11 E.02322
; LINE_WIDTH: 0.440802
G1 X122.137 Y125.859 E.01311
; LINE_WIDTH: 0.441172
G1 X121.854 Y125.364 E.01158
; LINE_WIDTH: 0.441652
G3 X121.394 Y124.238 I6.252 J-3.212 E.02476
; LINE_WIDTH: 0.439912
G3 X121.098 Y122.354 I7.153 J-2.088 E.03873
; LINE_WIDTH: 0.436222
G1 X121.118 Y121.718 E.01278
; LINE_WIDTH: 0.436032
G1 X121.192 Y121.124 E.01201
; LINE_WIDTH: 0.442182
G3 X121.463 Y120.05 I6.508 J1.069 E.02258
; LINE_WIDTH: 0.442812
G3 X121.958 Y118.94 I6.727 J2.334 E.0248
; LINE_WIDTH: 0.439972
G3 X122.644 Y117.937 I5.985 J3.356 E.02464
; LINE_WIDTH: 0.439422
G1 X123.052 Y117.485 E.01231
; LINE_WIDTH: 0.439252
G1 X123.567 Y117.017 E.01409
; LINE_WIDTH: 0.436382
G1 X124.078 Y116.635 E.01279
; LINE_WIDTH: 0.435902
G1 X124.62 Y116.307 E.01271
; LINE_WIDTH: 0.435782
G1 X125.142 Y116.048 E.01168
; LINE_WIDTH: 0.436052
G1 X125.7 Y115.831 E.012
; LINE_WIDTH: 0.442202
G3 X126.774 Y115.561 I2.169 J6.359 E.02258
; LINE_WIDTH: 0.442802
G3 X127.986 Y115.471 I1.132 J7.028 E.02481
; LINE_WIDTH: 0.439962
G3 X129.156 Y115.592 I-.118 J6.833 E.02386
; LINE_WIDTH: 0.438722
G1 X129.895 Y115.78 E.0154
; LINE_WIDTH: 0.436352
G3 X130.985 Y116.227 I-2.008 J6.45 E.02367
; LINE_WIDTH: 0.442802
G3 X131.979 Y116.855 I-3.194 J6.162 E.024
; LINE_WIDTH: 0.441152
G1 X132.417 Y117.218 E.01155
; LINE_WIDTH: 0.442802
G3 X133.244 Y118.11 I-4.792 J5.271 E.02483
; LINE_WIDTH: 0.439962
G3 X133.897 Y119.135 I-5.435 J4.181 E.02464
; LINE_WIDTH: 0.439402
G1 X134.152 Y119.687 E.01229
; LINE_WIDTH: 0.439252
G1 X134.38 Y120.346 E.01409
; LINE_WIDTH: 0.436362
G1 X134.529 Y120.966 E.01281
; LINE_WIDTH: 0.439342
G3 X134.611 Y121.486 I-6.267 J1.257 E.01066
G1 X134.646 Y121.963 E.00967
; WIPE_START
G1 F1800
M204 S10000
G1 X134.652 Y122.046 E-.03147
G1 X134.652 Y122.167 E-.04583
G1 X134.642 Y122.668 E-.19076
G1 X134.581 Y123.234 E-.21602
G1 X134.458 Y123.867 E-.24507
G1 X134.435 Y123.945 E-.03085
; WIPE_END
G1 E-.04
G1 X129.81 Y117.873 Z9 F30000
G1 X128.31 Y115.905 Z9
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.439962
G1 F1379
M204 S5000
G1 X128.535 Y115.919 E.00457
G3 X129.059 Y115.994 I-.695 J6.707 E.01072
; LINE_WIDTH: 0.439842
G3 X130.207 Y116.325 I-1.269 J6.551 E.02422
; LINE_WIDTH: 0.439402
G1 X130.729 Y116.559 E.01156
; LINE_WIDTH: 0.442802
G3 X131.723 Y117.181 I-3.504 J6.713 E.02395
; LINE_WIDTH: 0.441152
G1 X132.133 Y117.521 E.01081
; LINE_WIDTH: 0.442802
G3 X132.908 Y118.351 I-5.105 J5.542 E.02318
; LINE_WIDTH: 0.439962
G3 X133.523 Y119.311 I-5.245 J4.033 E.02312
; LINE_WIDTH: 0.439402
G1 X133.738 Y119.766 E.01018
; LINE_WIDTH: 0.439262
G1 X133.962 Y120.382 E.01325
; LINE_WIDTH: 0.439462
G3 X134.238 Y122.055 I-7.053 J2.026 E.03437
; LINE_WIDTH: 0.439892
G1 X134.229 Y122.64 E.01186
; LINE_WIDTH: 0.442352
G3 X134.057 Y123.76 I-7.195 J-.531 E.02309
; LINE_WIDTH: 0.442802
G3 X133.693 Y124.834 I-7.295 J-1.869 E.02315
; LINE_WIDTH: 0.439942
G3 X132.415 Y126.713 I-5.889 J-2.634 E.04624
; LINE_WIDTH: 0.439382
G1 X132.049 Y127.059 E.01019
; LINE_WIDTH: 0.436322
G1 X131.625 Y127.396 E.01088
; LINE_WIDTH: 0.435732
G1 X130.986 Y127.805 E.0152
; LINE_WIDTH: 0.435062
G3 X129.942 Y128.272 I-3.163 J-5.669 E.02292
; LINE_WIDTH: 0.436862
G3 X128.674 Y128.566 I-2.03 J-5.877 E.02621
; LINE_WIDTH: 0.434972
G1 X128.075 Y128.614 E.01202
; LINE_WIDTH: 0.439162
G3 X126.774 Y128.521 I-.191 J-6.481 E.02641
; LINE_WIDTH: 0.435292
G1 X126.19 Y128.39 E.01197
; LINE_WIDTH: 0.439432
G3 X125.008 Y127.935 I1.761 J-6.34 E.02567
; LINE_WIDTH: 0.439932
G3 X124.05 Y127.34 I3.191 J-6.201 E.02286
; LINE_WIDTH: 0.439412
G1 X123.61 Y126.976 E.01154
; LINE_WIDTH: 0.442802
G3 X122.84 Y126.143 I5.223 J-5.598 E.02316
; LINE_WIDTH: 0.440802
G1 X122.492 Y125.643 E.01236
; LINE_WIDTH: 0.441172
G1 X122.227 Y125.181 E.01082
; LINE_WIDTH: 0.441652
G3 X121.794 Y124.131 I6.149 J-3.149 E.02312
; LINE_WIDTH: 0.439912
G3 X121.511 Y122.437 I6.935 J-2.027 E.03486
; LINE_WIDTH: 0.439422
G1 X121.521 Y121.854 E.01179
; LINE_WIDTH: 0.440292
G1 X121.578 Y121.323 E.01083
; LINE_WIDTH: 0.442182
G3 X121.853 Y120.192 I6.842 J1.066 E.02373
; LINE_WIDTH: 0.442812
G3 X122.311 Y119.155 I7.103 J2.517 E.02315
; LINE_WIDTH: 0.439972
G1 X122.613 Y118.668 E.01158
G1 X122.953 Y118.212 E.01153
; LINE_WIDTH: 0.439422
G1 X123.287 Y117.834 E.0102
; LINE_WIDTH: 0.439272
G1 X123.766 Y117.387 E.01325
; LINE_WIDTH: 0.439422
G1 X124.216 Y117.04 E.0115
; LINE_WIDTH: 0.440182
G3 X125.205 Y116.47 I3.897 J5.621 E.02315
; LINE_WIDTH: 0.439952
G1 X125.733 Y116.256 E.01154
; LINE_WIDTH: 0.442202
G3 X126.833 Y115.972 I2.303 J6.661 E.02317
; LINE_WIDTH: 0.442802
G3 X127.964 Y115.884 I1.149 J7.44 E.02315
; LINE_WIDTH: 0.439962
G1 X128.25 Y115.901 E.00579
; CHANGE_LAYER
; Z_HEIGHT: 8.64
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F1800
M204 S10000
G1 X128.535 Y115.919 E-.10863
G1 X129.059 Y115.994 E-.20113
G1 X129.669 Y116.142 E-.23873
G1 X130.196 Y116.321 E-.21151
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 103/145
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9 I-1.15 J.399 P1  F30000
G1 X130.683 Y117.721 Z9
G1 Z8.64
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.12
G1 F4800
G1 X130.683 Y120.212 E.04801
G1 X129.788 Y120.212 E.01724
G1 X129.788 Y117.468 E.0529
G2 X128.894 Y117.201 I-2.686 J7.369 E.018
G1 X128.894 Y120.212 E.05804
G1 X128 Y120.212 E.01724
G1 X128 Y117.101 E.05997
G2 X127.106 Y117.157 I.057 J8.033 E.01728
G1 X127.106 Y120.212 E.05889
G1 X126.212 Y120.212 E.01724
G1 X126.212 Y117.375 E.05468
G2 X125.317 Y117.779 I2.582 J6.914 E.01892
G1 X125.317 Y120.212 E.0469
G1 X125.106 Y120.212 E.00407
G1 X125.106 Y123.105 E.05578
G1 X125.317 Y123.105 E.00407
G1 X125.317 Y126.721 E.0697
G2 X126.21 Y127.126 I4.284 J-8.261 E.0189
M73 P77 R5
G1 X126.212 Y125.593 E.02956
; LAYER_HEIGHT: 0.24
G1 X126.212 Y123.105 E.08963
G1 X127.106 Y123.105 E.03222
G1 X127.106 Y125.593 E.08963
; LAYER_HEIGHT: 0.12
G1 X127.106 Y127.345 E.03377
G2 X128 Y127.4 I1.092 J-10.36 E.01728
G1 X128 Y125.593 E.03484
; LAYER_HEIGHT: 0.24
G1 X128 Y123.105 E.08963
G1 X128.894 Y123.105 E.03222
G1 X128.894 Y125.593 E.08963
; LAYER_HEIGHT: 0.12
G1 X128.894 Y127.299 E.0329
G2 X129.788 Y127.033 I-1.988 J-8.304 E.018
G1 X129.788 Y125.593 E.02776
; LAYER_HEIGHT: 0.24
G1 X129.788 Y123.105 E.08963
G1 X130.487 Y123.105 E.02517
; LAYER_HEIGHT: 0.12
G1 X130.683 Y123.105 E.00377
G1 X130.683 Y126.567 E.06673
G2 X131.577 Y125.833 I-3.766 J-5.498 E.02233
G1 X131.577 Y118.668 E.1381
G3 X132.471 Y119.925 I-4.277 J3.99 E.02981
G1 X132.471 Y124.947 E.09681
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
G1 X125.559 Y122.711 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.24
G1 F8141.211
G1 X130.487 Y122.711 E.17756
; LAYER_HEIGHT: 0.12
G1 F8472
G1 X130.5 Y120.606 E.04059
G1 X125.5 Y120.606 E.09637
G1 X125.5 Y122.711 E.04058
; WIPE_START
G1 F9000
G1 X125.5 Y120.711 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.529 Y125.332 Z9.04 F30000
G1 Z8.64
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X123.529 Y119.484 E.11271
G3 X124.423 Y118.426 I4.397 J2.809 E.02678
M73 P77 R4
G1 X124.423 Y126.309 E.15194
; CHANGE_LAYER
; Z_HEIGHT: 8.72
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 X124.423 Y124.309 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/145
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.04 I.268 J1.187 P1  F30000
G1 X134.657 Y121.996 Z9.04
G1 Z8.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
; LAYER_HEIGHT: 0.12
M204 S5000
G1 X134.661 Y122.053 E.00111
G3 X134.466 Y123.876 I-8.395 J.024 E.03541
G3 X131.513 Y127.969 I-6.564 J-1.625 E.09969
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
G3 X128.439 Y129.01 I-3.658 J-5.746 E.06317
G3 X134.54 Y120.987 I-.563 J-6.76 E.60251
G3 X134.621 Y121.49 I-5.928 J1.212 E.00983
G1 X134.653 Y121.936 E.00862
; WIPE_START
M204 S10000
G1 X134.661 Y122.053 E-.04462
G1 X134.651 Y122.676 E-.23651
G1 X134.563 Y123.386 E-.27186
G1 X134.466 Y123.876 E-.19002
G1 X134.454 Y123.919 E-.017
; WIPE_END
G1 E-.04
G17
G3 Z9.12 I.949 J-.761 P1  F30000
G1 X128.275 Y116.215 Z9.12
G1 Z8.72
G1 E.8 F1800
G1 F600
M204 S5000
G1 X128.5 Y116.228 E.00436
G3 X130.33 Y116.709 I-.587 J5.952 E.03661
G3 X132.12 Y117.925 I-2.971 J6.301 E.04188
G3 X133.182 Y119.355 I-4.304 J4.307 E.03446
G3 X133.334 Y119.654 I-2.601 J1.51 E.00647
G3 X133.642 Y120.39 I-4.288 J2.227 E.01539
G1 X133.83 Y121.134 E.0148
G3 X133.657 Y124.008 I-5.99 J1.081 E.05602
G3 X133.552 Y124.326 I-2.653 J-.699 E.00646
G3 X130.82 Y127.53 I-5.618 J-2.025 E.08295
G3 X130.101 Y127.871 I-4.005 J-7.51 E.01534
G3 X127.713 Y128.292 I-2.188 J-5.429 E.04708
G3 X127.306 Y128.27 I-.015 J-3.54 E.00787
G1 X126.908 Y128.231 E.0077
G3 X125.21 Y127.678 I1.074 J-6.182 E.03454
G3 X124.942 Y127.535 I.981 J-2.162 E.00587
G3 X123.553 Y126.477 I2.398 J-4.585 E.03381
G3 X123.25 Y126.141 I2.607 J-2.662 E.00874
G3 X122.461 Y124.971 I4.766 J-4.065 E.02725
G1 X122.152 Y124.239 E.01531
G3 X121.835 Y122.53 I5.893 J-1.978 E.03362
G3 X121.834 Y122.027 I3.789 J-.255 E.0097
G3 X123.365 Y118.226 I5.797 J.127 E.08073
G3 X123.608 Y117.964 I2.181 J1.779 E.00689
G3 X123.948 Y117.635 I2.573 J2.32 E.00913
G3 X126.756 Y116.309 I3.838 J4.49 E.06057
G3 X127.063 Y116.26 I.559 J2.543 E.00599
G3 X127.96 Y116.2 I.851 J5.92 E.01735
G1 X128.215 Y116.212 E.00491
; WIPE_START
M204 S10000
G1 X128.5 Y116.228 E-.10873
G1 X129.027 Y116.304 E-.20206
G1 X129.715 Y116.477 E-.2697
G1 X130.157 Y116.644 E-.17952
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.12 I-.965 J.742 P1  F30000
G1 X134.29 Y122.022 Z9.12
G1 Z8.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.370572
G1 F3600
G1 X134.292 Y122.048 E.00044
G1 X134.286 Y122.638 E.00995
; LINE_WIDTH: 0.365172
G1 X134.216 Y123.269 E.01053
; LINE_WIDTH: 0.368512
G1 X134.113 Y123.773 E.00863
; LINE_WIDTH: 0.373612
G3 X133.742 Y124.863 I-7.167 J-1.829 E.01959
; LINE_WIDTH: 0.364992
G1 X133.454 Y125.432 E.01059
; LINE_WIDTH: 0.373632
G3 X132.835 Y126.328 I-6.566 J-3.88 E.01853
; LINE_WIDTH: 0.368532
G1 X132.45 Y126.757 E.00965
; LINE_WIDTH: 0.365352
G1 X131.872 Y127.275 E.01289
; LINE_WIDTH: 0.356432
G1 X131.356 Y127.643 E.01025
; LINE_WIDTH: 0.370532
G1 X130.925 Y127.898 E.00845
; LINE_WIDTH: 0.372732
G3 X129.824 Y128.37 I-3.379 J-6.368 E.02036
; LINE_WIDTH: 0.363452
G1 X129.177 Y128.537 E.01102
; LINE_WIDTH: 0.357972
G1 X128.484 Y128.643 E.01139
; LINE_WIDTH: 0.370012
G1 X127.942 Y128.669 E.00913
; LINE_WIDTH: 0.372532
G3 X126.665 Y128.556 I-.038 J-6.808 E.02177
; LINE_WIDTH: 0.367412
G1 X126.055 Y128.409 E.01049
; LINE_WIDTH: 0.365252
G1 X125.474 Y128.207 E.01021
; LINE_WIDTH: 0.372052
G3 X124.54 Y127.735 I2.719 J-6.536 E.01773
; LINE_WIDTH: 0.370852
G1 X124.015 Y127.385 E.01064
; LINE_WIDTH: 0.361952
G1 X123.529 Y126.979 E.01041
; LINE_WIDTH: 0.373632
G3 X122.795 Y126.177 I5.257 J-5.546 E.0185
; LINE_WIDTH: 0.368572
G1 X122.462 Y125.707 E.00965
; LINE_WIDTH: 0.364952
G1 X122.146 Y125.153 E.01059
; LINE_WIDTH: 0.373652
G3 X121.74 Y124.143 I6.865 J-3.346 E.01853
; LINE_WIDTH: 0.368492
G1 X121.587 Y123.554 E.01021
; LINE_WIDTH: 0.365632
G1 X121.491 Y122.958 E.01002
; LINE_WIDTH: 0.372512
G3 X121.467 Y121.858 I7.235 J-.706 E.01867
; LINE_WIDTH: 0.370832
G1 X121.519 Y121.325 E.00904
; LINE_WIDTH: 0.369112
G1 X121.638 Y120.726 E.01025
; LINE_WIDTH: 0.369492
G3 X121.995 Y119.671 I6.257 J1.531 E.01875
; LINE_WIDTH: 0.369152
G3 X122.602 Y118.583 I6.1 J2.687 E.02094
; LINE_WIDTH: 0.370712
G1 X122.916 Y118.172 E.00873
; LINE_WIDTH: 0.372372
G3 X123.727 Y117.344 I5.535 J4.61 E.01965
; LINE_WIDTH: 0.361992
G1 X124.231 Y116.96 E.01042
; LINE_WIDTH: 0.368572
G1 X124.664 Y116.689 E.00857
; LINE_WIDTH: 0.373632
G3 X125.708 Y116.203 I3.633 J6.445 E.0196
; LINE_WIDTH: 0.364972
G1 X126.319 Y116.018 E.01059
; LINE_WIDTH: 0.373612
G3 X127.395 Y115.846 I1.75 J7.513 E.01854
; LINE_WIDTH: 0.367672
G1 X127.971 Y115.828 E.00964
; LINE_WIDTH: 0.368532
G3 X129.116 Y115.948 I-.135 J6.805 E.01932
; LINE_WIDTH: 0.369132
G1 X129.675 Y116.087 E.00967
; LINE_WIDTH: 0.369492
G1 X130.22 Y116.273 E.00968
; LINE_WIDTH: 0.370692
G3 X131.251 Y116.786 I-2.53 J6.374 E.01944
; LINE_WIDTH: 0.369112
G1 X131.726 Y117.112 E.00968
; LINE_WIDTH: 0.369312
G1 X132.145 Y117.455 E.00909
; LINE_WIDTH: 0.372292
G3 X132.962 Y118.326 I-4.838 J5.355 E.02025
; LINE_WIDTH: 0.361932
G1 X133.323 Y118.847 E.01042
; LINE_WIDTH: 0.373592
G3 X133.803 Y119.782 I-6.634 J3.999 E.01789
; LINE_WIDTH: 0.367352
G1 X134.013 Y120.358 E.01024
; LINE_WIDTH: 0.369372
G3 X134.254 Y121.517 I-6.405 J1.937 E.01992
; LINE_WIDTH: 0.370572
G1 X134.286 Y121.962 E.00752
; CHANGE_LAYER
; Z_HEIGHT: 8.76
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F3600
G1 X134.292 Y122.048 E-.03266
G1 X134.286 Y122.638 E-.22424
G1 X134.216 Y123.269 E-.24105
G1 X134.113 Y123.773 E-.19566
G1 X134.063 Y123.941 E-.06639
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/145
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.12 I-.261 J-1.189 P1  F30000
G1 X132.471 Y124.29 Z9.12
G1 Z8.76
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.12
G1 F2929
G1 X132.471 Y120.697 E.06926
G2 X131.577 Y119.115 I-4.973 J1.768 E.03519
G1 X131.577 Y125.387 E.1209
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
G3 X130.683 Y126.206 I-3.827 J-3.282 E.02343
G1 X130.683 Y126 E.00398
G1 X129.788 Y126 E.01724
G1 X129.788 Y126.707 E.01364
G3 X128.894 Y126.994 I-2.701 J-6.892 E.01811
G1 X128.894 Y126 E.01916
G1 X128 Y126 E.01724
G1 X128 Y127.1 E.02121
G3 X127.106 Y127.04 I-.113 J-4.982 E.0173
G1 X127.106 Y126 E.02005
G1 X126.212 Y126 E.01724
G1 X126.192 Y126.799 E.01541
G3 X125.317 Y126.372 I2.514 J-6.259 E.01877
G1 X125.317 Y126 E.00717
G1 X125.106 Y126 E.00407
G1 X125.106 Y120.212 E.11157
G1 X125.317 Y120.212 E.00407
G1 X125.317 Y118.128 E.04017
G3 X126.212 Y117.692 I2.957 J4.935 E.0192
G1 X126.212 Y120.212 E.04857
G1 X127.106 Y120.212 E.01724
G1 X127.106 Y117.46 E.05304
G3 X128 Y117.401 I.764 J4.721 E.0173
G1 X128 Y120.212 E.05419
G1 X128.894 Y120.212 E.01724
G1 X128.894 Y117.507 E.05213
G3 X129.788 Y117.792 I-1.651 J6.741 E.0181
G1 X129.788 Y120.212 E.04665
G1 X130.683 Y120.212 E.01724
G1 X130.683 Y118.077 E.04115
; WIPE_START
G1 F4800
G1 X130.683 Y120.077 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.306 Y124.27 Z9.16 F30000
G1 X123.529 Y124.781 Z9.16
G1 Z8.76
G1 E.8 F1800
G1 F2929
G1 X123.529 Y120.096 E.09032
G3 X124.423 Y118.841 I4.84 J2.504 E.0298
G1 X124.423 Y125.907 E.1362
; CHANGE_LAYER
; Z_HEIGHT: 8.84
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F4800
G1 X124.423 Y123.907 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/145
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.16 I.226 J1.196 P1  F30000
G1 X134.655 Y121.97 Z9.16
G1 Z8.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
; LAYER_HEIGHT: 0.12
M204 S5000
G1 X134.661 Y122.061 E.00175
G3 X131.521 Y127.964 I-6.819 J.16 E.13471
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
G3 X128.425 Y129.011 I-3.67 J-5.756 E.0636
G3 X134.542 Y120.996 I-.55 J-6.761 E.60241
G3 X134.622 Y121.495 I-5.915 J1.201 E.00974
G1 X134.651 Y121.91 E.00802
; WIPE_START
M204 S10000
G1 X134.661 Y122.061 E-.05734
G1 X134.65 Y122.682 E-.23612
G1 X134.573 Y123.333 E-.2492
G1 X134.464 Y123.883 E-.21292
G1 X134.461 Y123.894 E-.00442
; WIPE_END
G1 E-.04
G17
G3 Z9.24 I.928 J-.787 P1  F30000
G1 X128.211 Y116.522 Z9.24
G1 Z8.84
G1 E.8 F1800
G1 F600
M204 S5000
G1 X128.358 Y116.524 E.00284
G3 X133.59 Y121.603 I-.474 J5.722 E.15227
G1 X133.629 Y122.496 E.01725
G3 X133.46 Y123.622 I-5.633 J-.274 E.02198
G1 X133.176 Y124.502 E.01784
G1 X132.891 Y125.07 E.01224
G3 X127.927 Y128.001 I-4.995 J-2.791 E.11644
G1 X127.028 Y127.947 E.01735
G3 X125.282 Y127.382 I.989 J-6.039 E.0355
G1 X124.47 Y126.894 E.01827
G3 X122.166 Y121.488 I3.44 J-4.66 E.11879
G3 X124.081 Y117.916 I5.86 J.842 E.07974
G3 X127.176 Y116.533 I3.892 J4.553 E.06625
G1 X127.752 Y116.514 E.01111
G1 X128.151 Y116.521 E.00769
; WIPE_START
M204 S10000
G1 X128.358 Y116.524 E-.07883
G1 X128.966 Y116.597 E-.23255
G1 X129.526 Y116.733 E-.21925
G1 X130.093 Y116.941 E-.22936
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.24 I-.951 J.759 P1  F30000
G1 X134.139 Y122.007 Z9.24
G1 Z8.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.669932
G1 F2929
G1 X134.142 Y122.053 E.00147
G1 X134.136 Y122.629 E.01814
; LINE_WIDTH: 0.664632
G1 X134.069 Y123.235 E.01905
; LINE_WIDTH: 0.669972
G3 X133.605 Y124.802 I-7.382 J-1.336 E.05156
; LINE_WIDTH: 0.667252
G1 X133.353 Y125.304 E.01763
; LINE_WIDTH: 0.669612
G1 X133.056 Y125.782 E.01771
; LINE_WIDTH: 0.669992
G3 X132.344 Y126.652 I-5.5 J-3.774 E.03545
; LINE_WIDTH: 0.664392
G1 X131.892 Y127.068 E.0192
; LINE_WIDTH: 0.671792
G3 X130.853 Y127.768 I-4.378 J-5.382 E.03962
; LINE_WIDTH: 0.670092
G3 X129.779 Y128.226 I-3.123 J-5.831 E.03682
; LINE_WIDTH: 0.665732
G1 X129.137 Y128.391 E.02075
; LINE_WIDTH: 0.658532
G1 X128.48 Y128.493 E.02058
; LINE_WIDTH: 0.669372
G1 X127.942 Y128.519 E.01692
; LINE_WIDTH: 0.669992
G3 X126.691 Y128.407 I-.06 J-6.341 E.03964
; LINE_WIDTH: 0.669072
G1 X126.098 Y128.265 E.01919
; LINE_WIDTH: 0.664952
G1 X125.57 Y128.084 E.01744
; LINE_WIDTH: 0.670932
G3 X124.616 Y127.606 I2.6 J-6.371 E.03371
; LINE_WIDTH: 0.669792
G1 X124.111 Y127.268 E.01911
; LINE_WIDTH: 0.663372
G1 X123.639 Y126.876 E.01914
; LINE_WIDTH: 0.670012
G3 X122.589 Y125.627 I5.246 J-5.474 E.05149
; LINE_WIDTH: 0.664412
G1 X122.284 Y125.094 E.01919
; LINE_WIDTH: 0.670032
G3 X121.734 Y123.525 I6.726 J-3.238 E.05248
; LINE_WIDTH: 0.665472
G1 X121.64 Y122.948 E.01829
; LINE_WIDTH: 0.670172
M73 P78 R4
G3 X121.667 Y121.345 I7.786 J-.672 E.05059
; LINE_WIDTH: 0.662892
G1 X121.793 Y120.713 E.02009
; LINE_WIDTH: 0.670052
G3 X122.396 Y119.195 I7.302 J2.023 E.05155
; LINE_WIDTH: 0.664452
G1 X122.721 Y118.674 E.01918
; LINE_WIDTH: 0.670052
G3 X123.819 Y117.464 I6.124 J4.458 E.05157
; LINE_WIDTH: 0.664472
G1 X124.306 Y117.091 E.01916
; LINE_WIDTH: 0.670052
G3 X125.759 Y116.345 I4.169 J6.329 E.05153
; LINE_WIDTH: 0.664412
G1 X126.347 Y116.166 E.01919
; LINE_WIDTH: 0.670012
G1 X126.848 Y116.064 E.01612
; LINE_WIDTH: 0.676852
G3 X128.53 Y116.014 I1.066 J7.484 E.05369
; LINE_WIDTH: 0.670052
G1 X129.087 Y116.095 E.01773
; LINE_WIDTH: 0.664332
G1 X129.648 Y116.232 E.01801
; LINE_WIDTH: 0.671132
G3 X130.679 Y116.642 I-2.023 J6.596 E.03507
; LINE_WIDTH: 0.670012
G1 X131.172 Y116.913 E.01773
; LINE_WIDTH: 0.664392
G1 X131.678 Y117.261 E.01918
; LINE_WIDTH: 0.670032
G3 X132.837 Y118.413 I-4.728 J5.918 E.05155
; LINE_WIDTH: 0.664432
G1 X133.189 Y118.916 E.01918
; LINE_WIDTH: 0.669992
G3 X133.869 Y120.401 I-6.503 J3.877 E.05155
; LINE_WIDTH: 0.664452
G1 X134.021 Y120.996 E.01916
; LINE_WIDTH: 0.669392
G1 X134.104 Y121.533 E.01711
; LINE_WIDTH: 0.669932
G1 X134.134 Y121.947 E.01307
; CHANGE_LAYER
; Z_HEIGHT: 8.88
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F3600
G1 X134.142 Y122.053 E-.04052
G1 X134.136 Y122.629 E-.21881
G1 X134.069 Y123.235 E-.2318
G1 X133.966 Y123.737 E-.19476
G1 X133.911 Y123.924 E-.0741
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/145
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.24 I-.58 J-1.07 P1  F30000
G1 X131.577 Y125.191 Z9.24
G1 Z8.88
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.12
G1 F3751
G1 X131.577 Y119.601 E.10775
G2 X130.683 Y118.667 I-3.792 J2.734 E.02501
G1 X130.683 Y120.212 E.02978
G1 X129.788 Y120.212 E.01724
G1 X129.788 Y118.12 E.04031
G2 X128.894 Y117.814 I-1.948 J4.229 E.01825
G1 X128.894 Y120.212 E.04622
G1 X128 Y120.212 E.01724
G1 X128 Y117.701 E.0484
G2 X127.106 Y117.763 I.007 J6.5 E.01729
G1 X127.106 Y120.212 E.04719
G1 X126.212 Y120.212 E.01724
G1 X126.212 Y118.014 E.04236
G2 X125.317 Y118.484 I2.329 J5.524 E.01949
G1 X125.317 Y120.212 E.03331
G1 X125.106 Y120.212 E.00407
G1 X125.106 Y123.106 E.05578
G1 X125.317 Y123.106 E.00407
G1 X125.317 Y126.014 E.05606
G2 X126.212 Y126.486 I2.582 J-3.806 E.01953
G1 X126.212 Y125.593 E.01722
; LAYER_HEIGHT: 0.24
G1 X126.212 Y123.106 E.08962
G1 X127.106 Y123.106 E.03222
G1 X127.106 Y125.593 E.08962
; LAYER_HEIGHT: 0.12
G1 X127.106 Y126.735 E.02202
G2 X128 Y126.8 I.936 J-6.667 E.0173
G1 X128 Y125.593 E.02328
; LAYER_HEIGHT: 0.24
G1 X128 Y123.106 E.08962
G1 X128.894 Y123.106 E.03222
G1 X128.894 Y125.593 E.08962
; LAYER_HEIGHT: 0.12
G1 X128.894 Y126.685 E.02106
G2 X129.788 Y126.379 I-1.56 J-6.016 E.01824
G1 X129.788 Y125.593 E.01516
; LAYER_HEIGHT: 0.24
G1 X129.788 Y123.106 E.08962
G1 X130.487 Y123.106 E.02517
; LAYER_HEIGHT: 0.12
G1 X130.683 Y123.106 E.00377
G1 X130.683 Y126.055 E.05686
; WIPE_START
G1 F4800
G1 X130.683 Y124.055 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.559 Y122.711 Z9.28 F30000
G1 Z8.88
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.24
G1 F3751
G1 X130.487 Y122.711 E.17756
; LAYER_HEIGHT: 0.12
G1 X130.5 Y120.606 E.04059
G1 X125.5 Y120.606 E.09637
G1 X125.5 Y122.711 E.04058
; WIPE_START
G1 F9000
G1 X125.5 Y120.711 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.529 Y124.116 Z9.28 F30000
G1 Z8.88
G1 E.8 F1800
; FEATURE: Support interface
G1 F3751
G1 X123.529 Y120.898 E.06203
G3 X124.423 Y119.284 I4.642 J1.517 E.03579
G1 X124.423 Y125.482 E.11947
; WIPE_START
G1 F4800
G1 X124.423 Y123.482 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.28 I1.217 J0 P1  F30000
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
; CHANGE_LAYER
; Z_HEIGHT: 8.96
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 108/145
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
; OBJECT_ID: 15
G1 X134.222 Y121.974
G1 Z8.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.497592
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X134.228 Y122.071 E.00226
G1 X134.22 Y122.644 E.01321
; LINE_WIDTH: 0.494942
G1 X134.152 Y123.246 E.0139
; LINE_WIDTH: 0.497512
G3 X133.678 Y124.846 I-7.139 J-1.244 E.03856
; LINE_WIDTH: 0.494842
G1 X133.402 Y125.389 E.01399
; LINE_WIDTH: 0.497562
G3 X132.397 Y126.718 I-6.324 J-3.74 E.03852
; LINE_WIDTH: 0.494802
G1 X131.946 Y127.131 E.01401
; LINE_WIDTH: 0.497562
G3 X130.549 Y128.017 I-4.598 J-5.706 E.03826
; LINE_WIDTH: 0.494522
G1 X129.972 Y128.25 E.01426
; LINE_WIDTH: 0.497612
G3 X128.366 Y128.588 I-2.349 J-7.181 E.03794
; LINE_WIDTH: 0.494102
G3 X126.87 Y128.524 I-.487 J-6.174 E.03437
; LINE_WIDTH: 0.491662
G1 X126.232 Y128.385 E.01487
; LINE_WIDTH: 0.497472
G1 X125.748 Y128.239 E.01165
; LINE_WIDTH: 0.497612
G3 X124.679 Y127.745 I2.169 J-6.104 E.02721
; LINE_WIDTH: 0.495022
G1 X124.175 Y127.419 E.01377
; LINE_WIDTH: 0.497562
G3 X122.958 Y126.279 I4.487 J-6.013 E.03854
; LINE_WIDTH: 0.494802
G1 X122.595 Y125.789 E.01399
; LINE_WIDTH: 0.497562
G3 X121.856 Y124.294 I6.308 J-4.05 E.03854
; LINE_WIDTH: 0.494822
G1 X121.688 Y123.708 E.01399
; LINE_WIDTH: 0.497672
G3 X121.53 Y122.617 I6.345 J-1.476 E.02547
; LINE_WIDTH: 0.497532
G1 X121.522 Y122.018 E.01381
; LINE_WIDTH: 0.495412
G1 X121.57 Y121.441 E.0133
; LINE_WIDTH: 0.497672
G3 X121.805 Y120.365 I6.466 J.848 E.02544
; LINE_WIDTH: 0.497552
G1 X121.996 Y119.83 E.01312
; LINE_WIDTH: 0.494822
G1 X122.257 Y119.277 E.01401
; LINE_WIDTH: 0.497562
G3 X123.222 Y117.918 I6.425 J3.542 E.03854
; LINE_WIDTH: 0.494822
G1 X123.659 Y117.492 E.014
; LINE_WIDTH: 0.497552
G3 X125.041 Y116.559 I4.772 J5.576 E.03854
; LINE_WIDTH: 0.494832
G1 X125.6 Y116.314 E.01399
; LINE_WIDTH: 0.497562
G3 X127.221 Y115.926 I2.505 J6.888 E.03854
; LINE_WIDTH: 0.503342
G3 X128.556 Y115.931 I.645 J7.149 E.03122
; LINE_WIDTH: 0.497472
G1 X129.114 Y116.014 E.013
; LINE_WIDTH: 0.494812
G1 X129.706 Y116.163 E.014
; LINE_WIDTH: 0.497552
G3 X131.2 Y116.831 I-2.253 J7.037 E.03784
; LINE_WIDTH: 0.493922
G1 X131.728 Y117.194 E.01467
; LINE_WIDTH: 0.497552
G3 X132.911 Y118.369 I-4.549 J5.76 E.03854
; LINE_WIDTH: 0.494822
G1 X133.259 Y118.87 E.01399
; LINE_WIDTH: 0.497542
G3 X133.748 Y119.821 I-5.442 J3.404 E.02469
; LINE_WIDTH: 0.497132
G1 X133.944 Y120.358 E.01318
; LINE_WIDTH: 0.493932
G1 X134.103 Y120.978 E.01465
; LINE_WIDTH: 0.497132
G1 X134.191 Y121.539 E.01308
; LINE_WIDTH: 0.497592
G1 X134.217 Y121.914 E.00867
M204 S250
G1 X134.652 Y121.944 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.078 E.00258
G3 X126.112 Y128.797 I-6.781 J.17 E.24315
G3 X127.807 Y115.462 I1.763 J-6.551 E.37512
G1 X128.621 Y115.503 E.0157
G3 X134.623 Y121.508 I-.767 J6.769 E.17669
G1 X134.648 Y121.885 E.00728
; WIPE_START
M204 S10000
G1 X134.661 Y122.078 E-.0737
G1 X134.649 Y122.688 E-.23186
G1 X134.574 Y123.328 E-.24485
G1 X134.466 Y123.869 E-.2096
; WIPE_END
G1 E-.04
G17
G3 Z9.36 I.933 J-.781 P1  F30000
G1 X128.204 Y116.389 Z9.36
G1 Z8.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.503342
G1 F3600
G1 X128.493 Y116.398 E.00674
; LINE_WIDTH: 0.497472
G1 X129.003 Y116.47 E.01187
; LINE_WIDTH: 0.494812
G1 X129.536 Y116.6 E.0126
; LINE_WIDTH: 0.497552
G3 X130.937 Y117.218 I-2.301 J7.109 E.03538
; LINE_WIDTH: 0.494772
G1 X131.416 Y117.545 E.0133
; LINE_WIDTH: 0.497552
G3 X132.527 Y118.639 I-4.54 J5.718 E.03604
; LINE_WIDTH: 0.494822
G1 X132.843 Y119.088 E.01259
; LINE_WIDTH: 0.497542
G1 X133.1 Y119.543 E.01206
G1 X133.464 Y120.394 E.02135
; LINE_WIDTH: 0.494842
G1 X133.636 Y121.032 E.01514
; LINE_WIDTH: 0.497132
G1 X133.722 Y121.588 E.01297
G1 X133.76 Y122.476 E.0205
; LINE_WIDTH: 0.495472
G1 X133.7 Y123.103 E.01446
; LINE_WIDTH: 0.497512
G3 X133.259 Y124.636 I-7.021 J-1.194 E.03687
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
; LINE_WIDTH: 0.494842
G1 X133.013 Y125.127 E.01259
; LINE_WIDTH: 0.497562
G3 X132.078 Y126.375 I-6.28 J-3.733 E.03604
; LINE_WIDTH: 0.494812
G1 X131.674 Y126.749 E.01261
; LINE_WIDTH: 0.497562
G3 X130.371 Y127.584 I-4.575 J-5.707 E.03579
; LINE_WIDTH: 0.495092
G1 X129.865 Y127.792 E.01255
; LINE_WIDTH: 0.497612
G3 X128.354 Y128.12 I-2.372 J-7.273 E.03572
; LINE_WIDTH: 0.493992
G1 X127.736 Y128.137 E.01415
; LINE_WIDTH: 0.494242
G1 X127.053 Y128.081 E.0157
; LINE_WIDTH: 0.497322
G1 X126.551 Y127.983 E.0118
; LINE_WIDTH: 0.497472
G1 X125.913 Y127.797 E.01531
; LINE_WIDTH: 0.497612
G3 X124.932 Y127.35 I2.16 J-6.04 E.02492
; LINE_WIDTH: 0.495022
G1 X124.476 Y127.059 E.0124
; LINE_WIDTH: 0.494842
G1 X123.897 Y126.592 E.01705
; LINE_WIDTH: 0.491472
G1 X123.407 Y126.086 E.01604
; LINE_WIDTH: 0.494812
G3 X122.625 Y124.917 I4.474 J-3.838 E.03232
; LINE_WIDTH: 0.491462
G1 X122.344 Y124.272 E.01603
; LINE_WIDTH: 0.494812
G3 X122.023 Y122.902 I5.538 J-2.021 E.03233
; LINE_WIDTH: 0.490942
G1 X121.986 Y122.199 E.01602
; LINE_WIDTH: 0.494942
G3 X122.167 Y120.805 I5.893 J.052 E.03233
; LINE_WIDTH: 0.491492
G1 X122.38 Y120.133 E.01604
; LINE_WIDTH: 0.494832
G1 X122.653 Y119.528 E.01523
; LINE_WIDTH: 0.497562
G3 X123.551 Y118.252 I6.379 J3.536 E.03606
; LINE_WIDTH: 0.494832
G1 X123.942 Y117.867 E.01259
; LINE_WIDTH: 0.497552
G3 X125.232 Y116.988 I4.731 J5.553 E.03607
; LINE_WIDTH: 0.494832
G1 X125.734 Y116.764 E.01261
; LINE_WIDTH: 0.497562
G3 X127.242 Y116.395 I2.48 J6.873 E.03588
; LINE_WIDTH: 0.503342
G3 X127.784 Y116.375 I.606 J8.942 E.01267
G1 X128.144 Y116.387 E.00842
M204 S250
G1 X128.188 Y116.821 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F600
M204 S5000
G1 X128.348 Y116.825 E.00307
G3 X131.698 Y118.352 I-.458 J5.445 E.07239
G3 X133.218 Y121.14 I-4.057 J4.02 E.06203
G3 X133.168 Y123.553 I-5.596 J1.091 E.04688
G1 X132.9 Y124.384 E.01684
G3 X122.588 Y120.888 I-5.022 J-2.145 E.31451
G3 X124.245 Y118.174 I5.512 J1.504 E.0621
G3 X125.349 Y117.409 I3.559 J3.958 E.02597
G3 X127.211 Y116.83 I2.783 J5.67 E.03773
G1 X127.48 Y116.821 E.00519
G3 X127.797 Y116.811 I.4 J7.186 E.00611
G1 X128.128 Y116.82 E.00639
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F600
M204 S10000
G1 X128.348 Y116.825 E-.0833
G1 X128.9 Y116.889 E-.21141
G1 X129.473 Y117.029 E-.22399
G1 X130.068 Y117.251 E-.2413
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/145
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.36 I-.446 J-1.132 P1  F30000
G1 X124.423 Y119.474 Z9.36
G1 Z9
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.12
G1 F4800
G1 X124.423 Y125.024 E.10698
; WIPE_START
G1 X124.423 Y123.024 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.683 Y125.676 Z9.4 F30000
G1 Z9
G1 E.8 F1800
G1 F4800
G1 X130.683 Y123.106 E.04955
G1 X129.788 Y123.106 E.01724
G1 X129.788 Y126.046 E.05668
G3 X128.894 Y126.377 I-1.923 J-3.825 E.01842
G1 X128.894 Y123.106 E.06305
G1 X128 Y123.106 E.01724
G1 X128 Y126.501 E.06544
G3 X127.106 Y126.43 I.012 J-5.888 E.01731
G1 X127.106 Y123.106 E.06409
G1 X126.212 Y123.106 E.01724
G1 X126.212 Y126.162 E.05892
G3 X125.317 Y125.645 I1.695 J-3.966 E.01996
G1 X125.317 Y123.106 E.04896
G1 X125.106 Y123.106 E.00407
G1 X125.106 Y120.212 E.05578
G1 X125.317 Y120.212 E.00407
G1 X125.317 Y118.854 E.02618
G3 X126.212 Y118.337 I2.59 J3.454 E.01995
G1 X126.212 Y120.212 E.03613
G1 X127.106 Y120.212 E.01724
G1 X127.106 Y118.067 E.04133
G3 X128 Y118.001 I.831 J5.12 E.01731
G1 X128 Y120.212 E.04262
G1 X128.894 Y120.212 E.01724
G1 X128.894 Y118.121 E.0403
G3 X129.788 Y118.453 I-1.527 J5.486 E.01841
G1 X129.788 Y120.212 E.0339
M73 P79 R4
G1 X130.683 Y120.212 E.01724
G1 X130.683 Y119.056 E.02228
G3 X131.577 Y120.16 I-3.217 J3.52 E.02749
G1 X131.577 Y124.683 E.08719
; WIPE_START
G1 X131.577 Y122.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J0 P1  F30000
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
; CHANGE_LAYER
; Z_HEIGHT: 9.08
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 110/145
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
; OBJECT_ID: 15
G1 X134.243 Y121.946
G1 Z9.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X134.252 Y122.069 E.00256
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
G3 X127.605 Y115.878 I-6.375 J.18 E.6214
G1 X128.575 Y115.909 E.02014
G3 X134.214 Y121.541 I-.71 J6.35 E.1785
G1 X134.239 Y121.886 E.00717
M204 S250
G1 X134.65 Y121.918 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.075 E.00303
G3 X127.617 Y115.468 I-6.783 J.174 E.61469
G1 X128.636 Y115.505 E.01965
G3 X134.621 Y121.512 I-.793 J6.776 E.17637
G1 X134.646 Y121.859 E.0067
; WIPE_START
M204 S10000
G1 X134.661 Y122.075 E-.08247
G1 X134.649 Y122.695 E-.2356
G1 X134.575 Y123.324 E-.24068
G1 X134.471 Y123.843 E-.20124
; WIPE_END
G1 E-.04
G17
G3 Z9.48 I.916 J-.802 P1  F30000
G1 X128.212 Y116.696 Z9.48
G1 Z9.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F3600
G1 X128.833 Y116.769 E.01296
G3 X132.826 Y119.717 I-.987 J5.516 E.10667
G1 X133.159 Y120.495 E.01755
G1 X133.324 Y121.11 E.0132
G3 X133.276 Y123.575 I-5.693 J1.123 E.05155
G1 X133.009 Y124.405 E.01806
G3 X132.466 Y125.388 I-4.92 J-2.077 E.02336
G1 X131.925 Y126.072 E.01808
G3 X123.301 Y119.074 I-4.044 J-3.828 E.34527
G3 X123.713 Y118.551 I38.587 J29.945 E.0138
G1 X124.184 Y118.08 E.01382
G3 X127.146 Y116.731 I3.806 J4.428 E.06841
G1 X128.153 Y116.69 E.0209
M204 S250
G1 X128.157 Y117.099 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F600
M204 S5000
G1 X128.166 Y117.099 E.00017
G3 X122.745 Y122.801 I-.294 J5.149 E.45211
G3 X122.878 Y120.963 I6.021 J-.486 E.03565
G3 X123.998 Y118.85 I5.098 J1.348 E.0465
G1 X124.033 Y118.806 E.00108
G3 X127.219 Y117.134 I3.837 J3.438 E.07085
G1 X128.097 Y117.101 E.01694
; WIPE_START
M204 S10000
G1 X128.166 Y117.099 E-.02623
G1 X128.785 Y117.171 E-.23669
G1 X129.358 Y117.309 E-.22427
G1 X129.963 Y117.531 E-.24466
G1 X130.029 Y117.565 E-.02816
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.48 I-.923 J.793 P1  F30000
G1 X133.835 Y121.993 Z9.48
G1 Z9.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.420112
G1 F3600
G1 X133.843 Y122.063 E.00136
G1 X133.837 Y122.611 E.01056
; LINE_WIDTH: 0.415072
G1 X133.776 Y123.168 E.01067
; LINE_WIDTH: 0.420132
G3 X133.331 Y124.68 I-7.001 J-1.241 E.03045
; LINE_WIDTH: 0.414952
G1 X133.077 Y125.183 E.01073
; LINE_WIDTH: 0.420112
G3 X132.13 Y126.441 I-6.111 J-3.615 E.03042
; LINE_WIDTH: 0.414872
G1 X131.715 Y126.825 E.01075
; LINE_WIDTH: 0.420212
G3 X130.868 Y127.416 I-4.06 J-4.917 E.01994
; LINE_WIDTH: 0.420032
G1 X130.396 Y127.665 E.0103
; LINE_WIDTH: 0.414392
G1 X129.727 Y127.926 E.01364
; LINE_WIDTH: 0.408472
G1 X129.057 Y128.102 E.01295
; LINE_WIDTH: 0.413192
G1 X128.35 Y128.204 E.01354
; LINE_WIDTH: 0.413552
G3 X127.045 Y128.165 I-.472 J-6.02 E.0248
; LINE_WIDTH: 0.419912
G1 X126.532 Y128.067 E.01007
; LINE_WIDTH: 0.420372
G3 X125.517 Y127.737 I1.442 J-6.163 E.02061
; LINE_WIDTH: 0.415352
G1 X125.019 Y127.496 E.01054
; LINE_WIDTH: 0.420152
G3 X123.729 Y126.549 I3.497 J-6.113 E.03093
; LINE_WIDTH: 0.415552
G1 X123.358 Y126.158 E.01027
; LINE_WIDTH: 0.420292
G3 X122.493 Y124.841 I5.548 J-4.583 E.03045
; LINE_WIDTH: 0.414872
G1 X122.273 Y124.321 E.01074
; LINE_WIDTH: 0.420232
G3 X121.926 Y122.783 I6.757 J-2.331 E.03048
; LINE_WIDTH: 0.414992
G1 X121.902 Y122.221 E.0107
; LINE_WIDTH: 0.420112
G1 X121.929 Y121.711 E.00985
; LINE_WIDTH: 0.420452
G3 X122.117 Y120.661 I6.355 J.597 E.02061
; LINE_WIDTH: 0.414972
G1 X122.294 Y120.124 E.01075
; LINE_WIDTH: 0.421332
G3 X122.749 Y119.188 I6.026 J2.353 E.02016
; LINE_WIDTH: 0.419792
G1 X123.043 Y118.738 E.01036
; LINE_WIDTH: 0.414992
G1 X123.396 Y118.299 E.01072
; LINE_WIDTH: 0.420132
G1 X123.75 Y117.933 E.0098
; LINE_WIDTH: 0.420252
G3 X124.562 Y117.279 I4.421 J4.655 E.02013
; LINE_WIDTH: 0.413272
G1 X125.07 Y116.976 E.01121
; LINE_WIDTH: 0.421392
G3 X126.03 Y116.571 I3.028 J5.839 E.02018
; LINE_WIDTH: 0.419812
G1 X126.546 Y116.426 E.01031
; LINE_WIDTH: 0.414892
G1 X127.073 Y116.331 E.0102
; LINE_WIDTH: 0.430392
G3 X128.292 Y116.297 I.81 J7.321 E.02415
; LINE_WIDTH: 0.413252
G3 X129.578 Y116.524 I-.302 J5.468 E.02479
; LINE_WIDTH: 0.420212
G3 X131.014 Y117.168 I-2.195 J6.823 E.03041
; LINE_WIDTH: 0.414712
G1 X131.481 Y117.487 E.01077
; LINE_WIDTH: 0.420252
G3 X132.6 Y118.596 I-4.477 J5.639 E.03045
; LINE_WIDTH: 0.414972
G1 X132.936 Y119.079 E.0112
; LINE_WIDTH: 0.419192
G1 X133.187 Y119.523 E.00981
; LINE_WIDTH: 0.420292
G3 X133.575 Y120.462 I-5.756 J2.929 E.01962
; LINE_WIDTH: 0.413212
G1 X133.745 Y121.155 E.01351
; LINE_WIDTH: 0.420112
G1 X133.829 Y121.933 E.01509
; CHANGE_LAYER
; Z_HEIGHT: 9.12
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F3600
G1 X133.843 Y122.063 E-.0497
G1 X133.837 Y122.611 E-.20819
G1 X133.776 Y123.168 E-.2131
G1 X133.675 Y123.667 E-.19319
G1 X133.604 Y123.909 E-.09582
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/145
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.48 I-.103 J-1.213 P1  F30000
G1 X131.577 Y124.08 Z9.48
G1 Z9.12
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.12
G1 F4237
G1 X131.577 Y120.868 E.06191
G2 X130.683 Y119.469 I-3.931 J1.528 E.03222
G1 X130.683 Y120.212 E.01431
G1 X129.788 Y120.212 E.01724
G1 X129.788 Y118.793 E.02735
G2 X128.894 Y118.432 I-1.916 J3.462 E.01863
G1 X128.894 Y120.212 E.0343
G1 X128 Y120.212 E.01724
G1 X128 Y118.301 E.03683
G2 X127.106 Y118.374 I-.126 J3.97 E.01733
G1 X127.106 Y120.212 E.03543
G1 X126.212 Y120.212 E.01724
G1 X126.212 Y118.665 E.0298
G2 X125.317 Y119.238 I1.703 J3.647 E.02052
G1 X125.317 Y120.212 E.01878
G1 X125.106 Y120.212 E.00407
G1 X125.106 Y123.106 E.05578
G1 X125.317 Y123.106 E.00407
G1 X125.317 Y125.262 E.04156
G2 X126.212 Y125.834 I2.966 J-3.65 E.02051
G1 X126.212 Y123.106 E.05259
G1 X127.106 Y123.106 E.01724
G1 X127.106 Y126.126 E.05821
G2 X128 Y126.2 I.789 J-4.064 E.01733
G1 X128 Y123.106 E.05965
G1 X128.894 Y123.106 E.01724
G1 X128.894 Y126.068 E.0571
G2 X129.788 Y125.708 I-1.087 J-3.992 E.01862
G1 X129.788 Y123.106 E.05016
G1 X130.683 Y123.106 E.01724
G1 X130.683 Y125.279 E.04189
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
; WIPE_START
G1 F4800
G1 X130.683 Y123.279 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.559 Y122.711 Z9.52 F30000
G1 Z9.12
G1 E.8 F1800
; FEATURE: Support
G1 F4237
G1 X130.5 Y122.711 E.09523
G1 X130.5 Y120.606 E.04058
G1 X125.5 Y120.606 E.09637
G1 X125.5 Y122.711 E.04058
; WIPE_START
G1 F9000
G1 X125.5 Y120.711 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.423 Y124.517 Z9.52 F30000
G1 Z9.12
G1 E.8 F1800
; FEATURE: Support interface
G1 F4237
G1 X124.423 Y119.985 E.08735
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F4800
G1 X124.423 Y121.985 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/145
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.52 I.008 J1.217 P1  F30000
G1 X134.241 Y121.92 Z9.52
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X134.252 Y122.085 E.00343
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
G3 X127.614 Y115.878 I-6.375 J.164 E.62124
G1 X128.584 Y115.911 E.02014
G3 X134.214 Y121.538 I-.715 J6.345 E.17826
G1 X134.236 Y121.86 E.0067
M204 S250
G1 X134.648 Y121.893 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.091 E.00383
G3 X127.626 Y115.469 I-6.784 J.159 E.61457
G1 X128.645 Y115.506 E.01966
G3 X134.622 Y121.508 I-.775 J6.748 E.17629
G1 X134.644 Y121.833 E.00627
; WIPE_START
M204 S10000
G1 X134.661 Y122.091 E-.09837
G1 X134.648 Y122.701 E-.23176
G1 X134.578 Y123.32 E-.23664
G1 X134.477 Y123.818 E-.19323
; WIPE_END
G1 E-.04
G17
G3 Z9.6 I.893 J-.826 P1  F30000
G1 X128.164 Y116.992 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F3600
G1 X128.78 Y117.062 E.01285
G3 X124.265 Y126.087 I-.911 J5.186 E.40644
G3 X127.193 Y117.027 I3.624 J-3.832 E.24633
G1 X128.104 Y116.99 E.01892
M204 S250
G1 X128.146 Y117.398 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F600
M204 S5000
G1 X128.148 Y117.398 E.00004
G3 X124.561 Y125.804 I-.279 J4.849 E.3589
G3 X127.266 Y117.429 I3.327 J-3.55 E.21196
G1 X128.086 Y117.4 E.01582
; WIPE_START
M204 S10000
G1 X128.148 Y117.398 E-.02357
G1 X128.731 Y117.466 E-.22305
G1 X129.279 Y117.598 E-.21412
G1 X129.841 Y117.805 E-.22752
G1 X130.008 Y117.892 E-.07174
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.905 J.813 P1  F30000
G1 X133.683 Y121.982 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.719612
G1 F3600
G1 X133.693 Y122.076 E.00323
G1 X133.688 Y122.599 E.01775
; LINE_WIDTH: 0.714392
G1 X133.632 Y123.123 E.01774
; LINE_WIDTH: 0.719652
G3 X133.382 Y124.133 I-6.247 J-1.011 E.03532
; LINE_WIDTH: 0.719472
G1 X133.194 Y124.619 E.01767
; LINE_WIDTH: 0.714372
G1 X132.952 Y125.101 E.01817
; LINE_WIDTH: 0.719532
G3 X132.024 Y126.336 I-5.993 J-3.54 E.05253
; LINE_WIDTH: 0.714292
G1 X131.627 Y126.703 E.0182
; LINE_WIDTH: 0.719572
G3 X130.792 Y127.286 I-3.954 J-4.769 E.03457
; LINE_WIDTH: 0.719412
G1 X130.331 Y127.53 E.01767
; LINE_WIDTH: 0.713852
G1 X129.69 Y127.78 E.02315
; LINE_WIDTH: 0.708412
G1 X129.017 Y127.957 E.02323
; LINE_WIDTH: 0.712552
G1 X128.328 Y128.055 E.02339
; LINE_WIDTH: 0.713132
G1 X127.626 Y128.068 E.02359
; LINE_WIDTH: 0.713332
G1 X127.076 Y128.018 E.01856
; LINE_WIDTH: 0.719252
G1 X126.566 Y127.921 E.01759
; LINE_WIDTH: 0.719672
G3 X125.577 Y127.6 I1.406 J-6.013 E.03533
; LINE_WIDTH: 0.714772
G1 X125.1 Y127.369 E.01786
; LINE_WIDTH: 0.719472
M73 P80 R4
G3 X123.852 Y126.459 I3.443 J-6.034 E.0525
; LINE_WIDTH: 0.714212
G1 X123.476 Y126.066 E.01832
; LINE_WIDTH: 0.719632
G3 X122.628 Y124.776 I5.376 J-4.457 E.05246
; LINE_WIDTH: 0.714352
G1 X122.417 Y124.279 E.01817
; LINE_WIDTH: 0.719532
G3 X122.075 Y122.769 I6.587 J-2.285 E.05263
; LINE_WIDTH: 0.714472
G1 X122.052 Y122.232 E.01812
; LINE_WIDTH: 0.719412
G1 X122.078 Y121.724 E.01723
; LINE_WIDTH: 0.719752
G3 X122.262 Y120.7 I6.189 J.581 E.03534
; LINE_WIDTH: 0.714432
G1 X122.43 Y120.187 E.01818
; LINE_WIDTH: 0.719492
G3 X123.154 Y118.841 I6.436 J2.592 E.05194
; LINE_WIDTH: 0.715072
G1 X123.475 Y118.437 E.0174
; LINE_WIDTH: 0.719492
G3 X124.652 Y117.4 I5.184 J4.699 E.05335
; LINE_WIDTH: 0.712892
G1 X125.131 Y117.114 E.01873
; LINE_WIDTH: 0.719552
G3 X126.579 Y116.573 I3.146 J6.212 E.05254
; LINE_WIDTH: 0.714332
G1 X127.093 Y116.479 E.0176
; LINE_WIDTH: 0.728932
G1 X127.597 Y116.441 E.01736
G1 X128.501 Y116.463 E.03108
; LINE_WIDTH: 0.719032
G1 X129 Y116.536 E.01712
; LINE_WIDTH: 0.714332
G1 X129.525 Y116.665 E.01818
; LINE_WIDTH: 0.719532
G3 X130.937 Y117.296 I-2.118 J6.631 E.05257
; LINE_WIDTH: 0.714412
G1 X131.382 Y117.602 E.01816
; LINE_WIDTH: 0.719452
G3 X132.482 Y118.688 I-4.269 J5.424 E.05255
; LINE_WIDTH: 0.714332
G1 X132.792 Y119.13 E.01818
; LINE_WIDTH: 0.719532
G3 X133.439 Y120.533 I-5.957 J3.6 E.05253
; LINE_WIDTH: 0.714312
G1 X133.599 Y121.193 E.02286
; LINE_WIDTH: 0.719612
G1 X133.677 Y121.922 E.02488
; CHANGE_LAYER
; Z_HEIGHT: 9.24
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F3600
G1 X133.693 Y122.076 E-.05893
G1 X133.688 Y122.599 E-.19879
G1 X133.632 Y123.123 E-.20017
G1 X133.538 Y123.594 E-.18226
G1 X133.451 Y123.897 E-.11986
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/145
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.6 I-.398 J-1.15 P1  F30000
G1 X130.683 Y124.853 Z9.6
G1 Z9.24
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.12
G1 F3416
G1 X130.683 Y123.106 E.03369
G1 X129.788 Y123.106 E.01724
G1 X129.788 Y125.359 E.04344
G3 X128.894 Y125.757 I-1.987 J-3.266 E.01891
G1 X128.894 Y123.106 E.0511
G1 X128 Y123.106 E.01724
G1 X128 Y125.899 E.05384
G3 X127.106 Y125.82 I-.046 J-4.582 E.01733
G1 X127.106 Y123.106 E.05232
G1 X126.212 Y123.106 E.01724
G1 X126.212 Y125.501 E.04617
G3 X125.317 Y124.856 I1.686 J-3.282 E.02133
G1 X125.317 Y123.106 E.03374
G1 X125.106 Y123.106 E.00407
G1 X125.106 Y120.212 E.05578
G1 X125.317 Y120.212 E.00407
G1 X125.32 Y119.639 E.01104
G3 X126.212 Y118.998 I2.652 J2.748 E.02124
G1 X126.212 Y120.212 E.02339
G1 X127.106 Y120.212 E.01724
G1 X127.106 Y118.68 E.02953
G3 X128 Y118.601 I.817 J4.15 E.01734
G1 X128 Y120.212 E.03105
G1 X128.894 Y120.212 E.01724
G1 X128.901 Y118.744 E.02829
G3 X129.788 Y119.139 I-1.271 J4.052 E.01877
G1 X129.788 Y120.212 E.02067
G1 X130.683 Y120.212 E.01724
G1 X130.683 Y119.648 E.01086
; WIPE_START
G1 F4800
G1 X130.683 Y120.212 E-.21406
G1 X129.788 Y120.212 E-.33981
G1 X129.788 Y119.669 E-.20613
; WIPE_END
G1 E-.04 F1800
G1 X124.423 Y120.592 Z9.64 F30000
G1 Z9.24
G1 E.8 F1800
G1 F3416
G1 X124.423 Y123.906 E.06387
; WIPE_START
G1 F4800
G1 X124.423 Y121.906 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.64 I1.217 J0 P1  F30000
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
; CHANGE_LAYER
; Z_HEIGHT: 9.32
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 114/145
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
; OBJECT_ID: 15
G1 X133.78 Y121.927
G1 Z9.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.522402
; LAYER_HEIGHT: 0.12
G1 F3416
G1 X133.791 Y122.085 E.00384
G1 X133.784 Y122.618 E.01294
; LINE_WIDTH: 0.519782
G1 X133.726 Y123.148 E.01289
; LINE_WIDTH: 0.522202
G1 X133.622 Y123.665 E.0128
; LINE_WIDTH: 0.522432
G3 X133.278 Y124.668 I-5.92 J-1.467 E.02578
; LINE_WIDTH: 0.519822
G1 X133.038 Y125.147 E.01294
; LINE_WIDTH: 0.522392
G3 X132.44 Y126.017 I-5.3 J-2.999 E.02567
; LINE_WIDTH: 0.522242
G1 X132.085 Y126.412 E.0129
; LINE_WIDTH: 0.519792
G1 X131.694 Y126.773 E.01284
; LINE_WIDTH: 0.522362
G3 X130.832 Y127.377 I-3.914 J-4.672 E.02561
; LINE_WIDTH: 0.522262
G1 X130.36 Y127.623 E.0129
; LINE_WIDTH: 0.519602
G1 X129.853 Y127.829 E.01324
; LINE_WIDTH: 0.522282
G3 X128.32 Y128.153 I-2.18 J-6.533 E.03812
; LINE_WIDTH: 0.519512
G1 X127.757 Y128.169 E.01359
; LINE_WIDTH: 0.522272
G3 X126.744 Y128.059 I.13 J-5.957 E.02477
; LINE_WIDTH: 0.521952
G1 X126.191 Y127.925 E.01379
; LINE_WIDTH: 0.520042
G1 X125.693 Y127.753 E.01274
; LINE_WIDTH: 0.522312
G3 X124.781 Y127.295 I2.203 J-5.526 E.02482
; LINE_WIDTH: 0.521972
G1 X124.314 Y126.979 E.01368
; LINE_WIDTH: 0.519702
G1 X123.902 Y126.638 E.01291
; LINE_WIDTH: 0.522242
G1 X123.529 Y126.267 E.01278
; LINE_WIDTH: 0.522412
G3 X122.868 Y125.408 I4.455 J-4.107 E.02635
; LINE_WIDTH: 0.520152
G1 X122.614 Y124.963 E.01238
; LINE_WIDTH: 0.522392
G3 X122.216 Y123.984 I5.421 J-2.771 E.0257
; LINE_WIDTH: 0.522232
G1 X122.078 Y123.45 E.0134
; LINE_WIDTH: 0.520162
G1 X121.993 Y122.923 E.0129
; LINE_WIDTH: 0.522422
G3 X122.022 Y121.365 I6.866 J-.652 E.03793
; LINE_WIDTH: 0.519422
G1 X122.13 Y120.822 E.01335
; LINE_WIDTH: 0.522232
G1 X122.277 Y120.326 E.01256
; LINE_WIDTH: 0.522422
G3 X122.708 Y119.362 I5.663 J1.95 E.02568
; LINE_WIDTH: 0.519452
G1 X122.995 Y118.899 E.01315
; LINE_WIDTH: 0.522452
G3 X123.666 Y118.088 I5.002 J3.46 E.0256
; LINE_WIDTH: 0.522242
G1 X124.056 Y117.726 E.01291
; LINE_WIDTH: 0.519762
G1 X124.478 Y117.401 E.01288
; LINE_WIDTH: 0.522382
G3 X125.888 Y116.673 I3.823 J5.674 E.03861
; LINE_WIDTH: 0.519762
G1 X126.408 Y116.515 E.01314
; LINE_WIDTH: 0.522292
G1 X126.916 Y116.409 E.0126
; LINE_WIDTH: 0.524692
G1 X127.444 Y116.348 E.01295
; LINE_WIDTH: 0.524852
G3 X128.505 Y116.364 I.435 J6.08 E.02593
; LINE_WIDTH: 0.522242
G1 X129.03 Y116.443 E.01289
; LINE_WIDTH: 0.519772
G1 X129.547 Y116.571 E.01286
; LINE_WIDTH: 0.522362
G3 X130.995 Y117.219 I-2.05 J6.523 E.03862
; LINE_WIDTH: 0.519692
G1 X131.453 Y117.533 E.01339
; LINE_WIDTH: 0.522292
G3 X132.565 Y118.637 I-4.251 J5.395 E.03814
; LINE_WIDTH: 0.519782
G1 X132.873 Y119.077 E.01296
; LINE_WIDTH: 0.522402
G3 X133.356 Y120.016 I-5.153 J3.246 E.02568
; LINE_WIDTH: 0.522272
G1 X133.532 Y120.508 E.01268
; LINE_WIDTH: 0.519582
G1 X133.668 Y121.03 E.01304
; LINE_WIDTH: 0.522122
G1 X133.755 Y121.576 E.01341
; LINE_WIDTH: 0.522402
G1 X133.776 Y121.867 E.00708
G1 X134.238 Y121.894 F30000
; LINE_WIDTH: 0.449992
G1 F3416
G1 X134.252 Y122.092 E.00411
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
G3 X134.214 Y121.542 I-6.374 J.159 E.81953
G1 X134.234 Y121.834 E.00607
M204 S250
G1 X134.646 Y121.867 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.098 E.00446
G3 X134.372 Y120.287 I-6.782 J.155 E.78617
G3 X134.617 Y121.513 I-7.258 J2.088 E.02413
G1 X134.641 Y121.807 E.00569
; WIPE_START
M204 S10000
G1 X134.661 Y122.098 E-.1107
G1 X134.647 Y122.707 E-.23163
G1 X134.578 Y123.315 E-.23224
G1 X134.48 Y123.793 E-.18544
; WIPE_END
G1 E-.04
G17
G3 Z9.72 I.9 J-.82 P1  F30000
G1 X128.154 Y116.847 Z9.72
G1 Z9.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.524852
G1 F3416
G1 X128.781 Y116.9 E.01537
; LINE_WIDTH: 0.519662
G3 X130.022 Y117.267 I-.861 J5.193 E.03133
; LINE_WIDTH: 0.517132
G1 X130.603 Y117.56 E.01562
; LINE_WIDTH: 0.519252
G3 X131.637 Y118.34 I-2.643 J4.577 E.03134
; LINE_WIDTH: 0.517132
G1 X132.077 Y118.817 E.01559
; LINE_WIDTH: 0.519752
G3 X132.773 Y119.915 I-4.078 J3.353 E.03148
; LINE_WIDTH: 0.517382
G1 X133.015 Y120.512 E.01549
; LINE_WIDTH: 0.519592
G1 X133.185 Y121.132 E.01552
; LINE_WIDTH: 0.522122
G1 X133.262 Y121.628 E.01216
G1 X133.297 Y122.434 E.01958
; LINE_WIDTH: 0.520142
G1 X133.242 Y123.049 E.01492
; LINE_WIDTH: 0.522202
G1 X133.142 Y123.54 E.01218
G1 X132.889 Y124.322 E.01992
; LINE_WIDTH: 0.519762
G3 X132.252 Y125.456 I-4.883 J-1.999 E.03151
; LINE_WIDTH: 0.517112
G1 X131.841 Y125.952 E.01548
; LINE_WIDTH: 0.519652
G3 X130.851 Y126.786 I-3.861 J-3.578 E.03133
; LINE_WIDTH: 0.517182
G1 X130.288 Y127.109 E.01561
; LINE_WIDTH: 0.520072
G3 X129.066 Y127.543 I-2.383 J-4.78 E.0314
; LINE_WIDTH: 0.517502
G1 X128.431 Y127.647 E.01547
; LINE_WIDTH: 0.519232
G3 X127.126 Y127.623 I-.558 J-5.277 E.03156
; LINE_WIDTH: 0.517432
G1 X126.495 Y127.496 E.01549
; LINE_WIDTH: 0.519442
G3 X125.291 Y127.02 I1.322 J-5.104 E.03133
; LINE_WIDTH: 0.517432
G1 X124.735 Y126.674 E.01573
; LINE_WIDTH: 0.519742
G3 X123.783 Y125.812 I3.029 J-4.303 E.03112
; LINE_WIDTH: 0.517122
G1 X123.384 Y125.294 E.0157
; LINE_WIDTH: 0.519742
G3 X122.788 Y124.137 I4.339 J-2.966 E.0315
; LINE_WIDTH: 0.517052
G1 X122.601 Y123.521 E.01548
; LINE_WIDTH: 0.519132
G3 X122.45 Y122.236 I5.131 J-1.255 E.03129
; LINE_WIDTH: 0.517462
G1 X122.49 Y121.587 E.01561
; LINE_WIDTH: 0.519992
G3 X122.801 Y120.329 I5.305 J.643 E.0314
; LINE_WIDTH: 0.517422
G1 X123.068 Y119.734 E.01568
; LINE_WIDTH: 0.519772
G3 X123.805 Y118.662 I4.695 J2.44 E.03151
; LINE_WIDTH: 0.517142
G1 X124.259 Y118.205 E.01547
; LINE_WIDTH: 0.519712
G3 X125.32 Y117.464 I3.524 J3.915 E.03133
; LINE_WIDTH: 0.517152
G1 X125.91 Y117.193 E.0156
; LINE_WIDTH: 0.519952
G3 X127.165 Y116.871 I1.94 J4.958 E.03138
; LINE_WIDTH: 0.524852
G1 X127.967 Y116.832 E.0196
G1 X128.094 Y116.842 E.00311
G1 X128.115 Y117.304 F30000
; LINE_WIDTH: 0.449992
G1 F3416
G1 X128.725 Y117.365 E.01271
G3 X124.113 Y125.495 I-.851 J4.89 E.39417
G3 X127.246 Y117.321 I3.768 J-3.243 E.22205
G1 X127.981 Y117.293 E.01524
G1 X128.055 Y117.299 E.00156
M204 S250
G1 X128.08 Y117.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F600
M204 S5000
G1 X128.675 Y117.773 E.01154
G3 X124.409 Y125.212 I-.802 J4.483 E.33615
G3 X127.319 Y117.724 I3.473 J-2.96 E.18936
G1 X127.97 Y117.703 E.01255
G1 X128.016 Y117.704 E.00088
G1 X128.02 Y117.705 E.00009
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F600
M204 S10000
G1 X128.675 Y117.773 E-.25031
G1 X129.202 Y117.888 E-.20472
G1 X129.718 Y118.079 E-.20929
G1 X129.942 Y118.195 E-.09568
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/145
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.72 I-1.18 J.297 P1  F30000
G1 X130.411 Y120.059 Z9.72
G1 Z9.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.16
G1 F6484
G2 X125.215 Y120.212 I-2.536 J2.191 E.14957
G1 X130.535 Y120.212 E.13376
G1 X130.612 Y120.314 E.00322
G3 X131.216 Y121.993 I-2.755 J1.939 E.04542
G3 X131.115 Y123.106 I-3.342 J.257 E.02822
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
G1 X124.635 Y123.106 E.16293
G2 X131.059 Y123.295 I3.24 J-.856 E.21622
; CHANGE_LAYER
; Z_HEIGHT: 9.44
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F9000
G1 X130.838 Y123.818 E-.21592
G1 X130.542 Y124.28 E-.20842
G1 X130.246 Y124.62 E-.17125
G1 X129.914 Y124.897 E-.16441
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/145
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.8 I.742 J.965 P1  F30000
G1 X133.814 Y121.898 Z9.8
G1 Z9.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X133.828 Y122.091 E.00402
G3 X133.572 Y120.518 I-5.949 J.159 E.74247
G3 X133.786 Y121.579 I-6.49 J1.861 E.02246
G1 X133.809 Y121.838 E.00541
G1 X134.236 Y121.868 F30000
G1 F3600
G1 X134.252 Y122.098 E.00477
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
G3 X133.983 Y120.412 I-6.373 J.152 E.79532
G3 X134.209 Y121.548 I-6.945 J1.973 E.02406
G1 X134.231 Y121.809 E.00543
M204 S250
G1 X134.644 Y121.842 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.104 E.00507
G3 X133.625 Y118.643 I-6.783 J.145 E.75121
G3 X134.62 Y121.517 I-5.882 J3.646 E.05911
G1 X134.64 Y121.782 E.00511
; WIPE_START
M204 S10000
G1 X134.661 Y122.104 E-.12273
G1 X134.647 Y122.714 E-.23178
M73 P81 R4
G1 X134.581 Y123.297 E-.22295
G1 X134.485 Y123.768 E-.18255
; WIPE_END
G1 E-.04
G17
G3 Z9.84 I.875 J-.846 P1  F30000
G1 X128.111 Y117.169 Z9.84
G1 Z9.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F3600
G1 X128.698 Y117.226 E.01223
G3 X129.319 Y117.37 I-.741 J4.593 E.01322
G1 X130.141 Y117.691 E.0183
G3 X131.979 Y119.239 I-2.509 J4.847 E.05026
G1 X132.357 Y119.834 E.01461
G3 X132.869 Y121.259 I-5.546 J2.799 E.03151
G1 X132.963 Y122.076 E.01705
G1 X132.913 Y122.979 E.01876
G1 X132.765 Y123.668 E.01462
G1 X132.512 Y124.335 E.01478
G1 X132.131 Y125.044 E.01671
G3 X131.12 Y126.173 I-5.097 J-3.548 E.03151
G1 X130.446 Y126.643 E.01705
G1 X129.822 Y126.954 E.01446
G1 X129.149 Y127.172 E.01467
G1 X128.35 Y127.319 E.01684
G1 X127.778 Y127.329 E.01188
G3 X126.447 Y127.125 I.034 J-4.666 E.02803
G1 X125.934 Y126.958 E.01118
G1 X125.237 Y126.603 E.01622
G3 X124.068 Y125.629 I3.288 J-5.137 E.03165
G1 X123.641 Y125.078 E.01446
G3 X123.172 Y124.196 I7.715 J-4.673 E.02073
G1 X122.942 Y123.506 E.01508
G1 X122.816 Y122.819 E.01449
G1 X122.791 Y121.992 E.01715
G1 X122.872 Y121.302 E.01441
G1 X123.068 Y120.587 E.01537
G1 X123.371 Y119.876 E.01604
G1 X123.681 Y119.382 E.01211
G3 X126.232 Y117.432 I4.238 J2.9 E.06773
G1 X126.902 Y117.252 E.01438
G1 X127.499 Y117.189 E.01245
G3 X128.032 Y117.167 I.458 J4.63 E.01107
G1 X128.051 Y117.168 E.0004
G1 X128.071 Y117.592 F30000
G1 F3600
G1 X128.657 Y117.648 E.01223
G1 X129.215 Y117.782 E.01189
G1 X129.977 Y118.083 E.017
G3 X131.018 Y118.809 I-1.908 J3.842 E.02642
G1 X131.586 Y119.431 E.01747
G1 X131.994 Y120.054 E.01546
G1 X132.295 Y120.751 E.01575
G1 X132.444 Y121.31 E.012
G1 X132.541 Y122.119 E.01689
G1 X132.49 Y122.948 E.01725
G1 X132.352 Y123.572 E.01324
G1 X132.118 Y124.178 E.01348
G1 X131.765 Y124.83 E.01539
G1 X131.294 Y125.427 E.01575
G1 X130.865 Y125.832 E.01225
G1 X130.208 Y126.292 E.01664
G1 X129.639 Y126.571 E.01315
G1 X129.025 Y126.766 E.01336
G1 X128.288 Y126.899 E.01552
G1 X127.778 Y126.905 E.01057
G3 X126.572 Y126.72 I.033 J-4.241 E.0254
G1 X126.078 Y126.557 E.01079
G1 X125.431 Y126.226 E.01508
G1 X124.911 Y125.856 E.01323
G1 X124.432 Y125.393 E.01382
G1 X123.981 Y124.824 E.01506
G3 X123.574 Y124.062 I9.737 J-5.688 E.01791
G1 X123.345 Y123.372 E.01508
G1 X123.234 Y122.749 E.01312
G1 X123.215 Y121.986 E.01584
G3 X124.621 Y118.901 I4.743 J.299 E.0719
G1 X125.161 Y118.453 E.01455
G1 X125.697 Y118.121 E.01308
G3 X127.005 Y117.663 I2.331 J4.568 E.02882
G3 X127.991 Y117.584 I1.586 J13.547 E.02052
G1 X128.011 Y117.586 E.00041
M204 S250
G1 X128.034 Y118.002 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F600
M204 S5000
G1 X128.618 Y118.056 E.01131
G1 X129.115 Y118.179 E.00986
G1 X129.82 Y118.46 E.01464
G3 X130.757 Y119.124 I-1.753 J3.468 E.0222
G1 X131.274 Y119.696 E.01487
G1 X131.645 Y120.267 E.01313
G1 X131.918 Y120.91 E.01347
G1 X132.048 Y121.411 E.00997
G1 X132.133 Y122.16 E.01453
G1 X132.081 Y122.919 E.01467
G3 X131.411 Y124.624 I-4.844 J-.92 E.03553
G1 X130.975 Y125.17 E.01347
G1 X130.587 Y125.531 E.0102
G1 X129.978 Y125.953 E.01429
G3 X128.228 Y126.494 I-2.306 J-4.359 E.03551
G3 X126.815 Y126.362 I-.307 J-4.346 E.02749
G1 X126.694 Y126.329 E.00242
G1 X126.57 Y126.29 E.0025
G1 X126.265 Y126.193 E.00618
G1 X125.617 Y125.861 E.01402
G1 X125.152 Y125.525 E.01106
G3 X124.309 Y124.578 I3.226 J-3.723 E.02451
G1 X123.976 Y123.964 E.01346
G1 X123.872 Y123.656 E.00626
G3 X123.77 Y123.34 I4.743 J-1.707 E.00641
G1 X123.719 Y123.174 E.00335
G1 X123.637 Y122.677 E.00971
G1 X123.624 Y121.98 E.01345
G3 X127.105 Y118.06 I4.285 J.3 E.10866
G1 X127.917 Y117.991 E.01571
G1 X127.974 Y117.997 E.00111
; WIPE_START
M204 S10000
G1 X128.618 Y118.056 E-.24567
G1 X129.115 Y118.179 E-.19443
G1 X129.82 Y118.46 E-.28856
G1 X129.891 Y118.503 E-.03134
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.84 I-.856 J.865 P1  F30000
G1 X133.383 Y121.957 Z9.84
G1 Z9.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.464332
G1 F3600
G1 X133.396 Y122.085 E.00275
; LINE_WIDTH: 0.479012
G3 X133.306 Y123.236 I-6.875 J.043 E.02563
; LINE_WIDTH: 0.464472
G1 X133.12 Y123.973 E.0163
; LINE_WIDTH: 0.472332
G3 X132.696 Y124.938 I-5.446 J-1.817 E.02303
; LINE_WIDTH: 0.471252
G1 X132.38 Y125.44 E.01293
; LINE_WIDTH: 0.463372
G1 X131.906 Y126.023 E.01608
; LINE_WIDTH: 0.467592
G1 X131.445 Y126.462 E.01375
; LINE_WIDTH: 0.476152
G3 X130.497 Y127.108 I-4.005 J-4.863 E.0253
; LINE_WIDTH: 0.464372
G1 X129.805 Y127.422 E.0163
; LINE_WIDTH: 0.472452
G3 X128.758 Y127.698 I-1.98 J-5.387 E.02368
; LINE_WIDTH: 0.471632
G1 X128.196 Y127.761 E.01233
; LINE_WIDTH: 0.466772
G1 X127.284 Y127.74 E.01969
G1 X126.56 Y127.61 E.01584
; LINE_WIDTH: 0.463252
G1 X125.88 Y127.4 E.01524
; LINE_WIDTH: 0.479332
G3 X124.847 Y126.865 I2.554 J-6.203 E.02581
; LINE_WIDTH: 0.471172
G1 X124.181 Y126.352 E.01832
G1 X123.623 Y125.77 E.01755
; LINE_WIDTH: 0.460592
G1 X123.272 Y125.301 E.01245
; LINE_WIDTH: 0.476392
G3 X122.761 Y124.332 I5.541 J-3.545 E.02416
; LINE_WIDTH: 0.466932
G1 X122.478 Y123.42 E.0206
; LINE_WIDTH: 0.465812
G1 X122.389 Y122.889 E.01157
; LINE_WIDTH: 0.476352
G3 X122.374 Y121.782 I6.525 J-.644 E.02444
; LINE_WIDTH: 0.463152
G1 X122.491 Y121.031 E.01623
; LINE_WIDTH: 0.471092
G1 X122.651 Y120.466 E.0128
; LINE_WIDTH: 0.471792
G3 X123.085 Y119.504 I5.38 J1.849 E.02304
; LINE_WIDTH: 0.467532
G1 X123.61 Y118.743 E.01998
G1 X124.102 Y118.221 E.0155
; LINE_WIDTH: 0.462572
G1 X124.654 Y117.764 E.0153
; LINE_WIDTH: 0.471232
G1 X125.098 Y117.479 E.01148
; LINE_WIDTH: 0.472572
G1 X125.557 Y117.241 E.01129
G1 X126.272 Y116.967 E.01673
; LINE_WIDTH: 0.460272
G1 X126.849 Y116.824 E.01264
; LINE_WIDTH: 0.482032
G3 X128.073 Y116.733 I1.111 J6.674 E.02741
; LINE_WIDTH: 0.463852
G1 X128.923 Y116.826 E.01832
; LINE_WIDTH: 0.468432
G1 X129.425 Y116.95 E.01117
; LINE_WIDTH: 0.475852
G3 X130.502 Y117.394 I-1.81 J5.92 E.02568
; LINE_WIDTH: 0.464652
G1 X131.143 Y117.8 E.01629
; LINE_WIDTH: 0.472772
G1 X131.568 Y118.148 E.012
; LINE_WIDTH: 0.474092
G1 X131.92 Y118.496 E.01086
G1 X132.441 Y119.146 E.01826
; LINE_WIDTH: 0.461492
G1 X132.741 Y119.64 E.0123
; LINE_WIDTH: 0.476772
G3 X133.154 Y120.627 I-6.138 J3.146 E.02362
; LINE_WIDTH: 0.465292
G1 X133.323 Y121.367 E.01631
; LINE_WIDTH: 0.464332
G1 X133.377 Y121.898 E.01144
; CHANGE_LAYER
; Z_HEIGHT: 9.56
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F3600
G1 X133.396 Y122.085 E-.07153
G1 X133.381 Y122.582 E-.18917
G1 X133.306 Y123.236 E-.25017
G1 X133.146 Y123.872 E-.24913
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/145
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.84 I1.206 J.164 P1  F30000
G1 X133.413 Y121.905 Z9.84
G1 Z9.56
G1 E.8 F1800
; LINE_WIDTH: 0.401742
G1 F3135
G1 X133.427 Y122.093 E.00347
G1 X133.424 Y122.539 E.0082
; LINE_WIDTH: 0.399542
G3 X133.274 Y123.566 I-5.823 J-.328 E.019
; LINE_WIDTH: 0.397752
G1 X133.133 Y124.047 E.00913
; LINE_WIDTH: 0.399872
G1 X132.947 Y124.517 E.00924
G1 X132.555 Y125.24 E.01505
; LINE_WIDTH: 0.394522
G1 X132.174 Y125.773 E.01182
; LINE_WIDTH: 0.399462
G3 X131.463 Y126.494 I-4.622 J-3.848 E.01852
; LINE_WIDTH: 0.395912
G1 X130.801 Y126.971 E.01476
; LINE_WIDTH: 0.394492
G1 X130.225 Y127.287 E.01184
; LINE_WIDTH: 0.399462
G3 X129.274 Y127.628 I-2.495 J-5.457 E.01849
; LINE_WIDTH: 0.398822
G1 X128.297 Y127.79 E.01805
M73 P81 R3
G1 X127.637 Y127.799 E.01205
; LINE_WIDTH: 0.395762
G1 X126.809 Y127.704 E.01507
G1 X126.022 Y127.485 E.01477
; LINE_WIDTH: 0.393732
G1 X125.448 Y127.248 E.01118
; LINE_WIDTH: 0.399392
G3 X124.534 Y126.69 I2.557 J-5.22 E.01959
; LINE_WIDTH: 0.400482
G1 X123.808 Y126.034 E.01792
G1 X123.479 Y125.649 E.00928
; LINE_WIDTH: 0.399192
G3 X122.873 Y124.664 I4.379 J-3.37 E.02114
; LINE_WIDTH: 0.394262
G1 X122.567 Y123.898 E.01487
; LINE_WIDTH: 0.399042
G3 X122.355 Y122.887 I5.629 J-1.709 E.01887
; LINE_WIDTH: 0.397212
G1 X122.323 Y122.128 E.01381
; LINE_WIDTH: 0.394282
G1 X122.377 Y121.433 E.01255
; LINE_WIDTH: 0.399072
G3 X122.619 Y120.446 I5.81 J.9 E.01858
G1 X123.018 Y119.552 E.01786
G1 X123.34 Y119.041 E.01104
; LINE_WIDTH: 0.397662
G1 X123.911 Y118.356 E.0162
G1 X124.282 Y118.01 E.00923
; LINE_WIDTH: 0.399452
G3 X125.183 Y117.391 I3.673 J4.384 E.02001
; LINE_WIDTH: 0.394932
G1 X125.885 Y117.063 E.01398
; LINE_WIDTH: 0.401562
G3 X126.964 Y116.766 I2.138 J5.667 E.02059
; LINE_WIDTH: 0.404452
G3 X128.19 Y116.705 I.916 J6.057 E.02276
; LINE_WIDTH: 0.395172
G1 X128.94 Y116.795 E.01365
; LINE_WIDTH: 0.399532
G3 X129.966 Y117.103 I-1.138 J5.659 E.01961
; LINE_WIDTH: 0.395432
G1 X130.672 Y117.45 E.01423
; LINE_WIDTH: 0.398352
G1 X131.2 Y117.798 E.01151
; LINE_WIDTH: 0.398512
G3 X131.95 Y118.469 I-3.507 J4.675 E.01836
; LINE_WIDTH: 0.399542
G3 X132.575 Y119.285 I-4.475 J4.076 E.0188
; LINE_WIDTH: 0.398292
G1 X133.013 Y120.134 E.01741
G1 X133.24 Y120.815 E.01308
; LINE_WIDTH: 0.394082
G1 X133.387 Y121.547 E.01344
; LINE_WIDTH: 0.401742
G1 X133.409 Y121.845 E.00549
G1 X133.812 Y121.872 F30000
; LINE_WIDTH: 0.449992
G1 F3135
G1 X133.827 Y122.099 E.00471
G3 X133.792 Y121.583 I-5.95 J.152 E.76492
G1 X133.808 Y121.812 E.00478
G1 X134.234 Y121.843 F30000
G1 F3135
G1 X134.252 Y122.105 E.00545
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
G3 X134.215 Y121.551 I-6.373 J.145 E.81925
G1 X134.23 Y121.783 E.00481
M204 S250
G1 X134.642 Y121.817 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.111 E.00569
G3 X134.623 Y121.521 I-6.782 J.138 E.81013
G1 X134.638 Y121.757 E.00454
; WIPE_START
M204 S10000
G1 X134.661 Y122.111 E-.13504
G1 X134.646 Y122.72 E-.23149
G1 X134.577 Y123.323 E-.23061
G1 X134.489 Y123.743 E-.16287
; WIPE_END
G1 E-.04
G1 X131.738 Y118.797 Z9.96 F30000
G1 Z9.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399542
G1 F3135
G1 X131.975 Y119.08 E.00675
G3 X132.254 Y119.468 I-5.312 J4.115 E.00872
; LINE_WIDTH: 0.395412
G1 X132.528 Y119.957 E.01013
; LINE_WIDTH: 0.394572
G1 X132.817 Y120.673 E.01393
; LINE_WIDTH: 0.401662
G3 X133.038 Y121.734 I-7.287 J2.072 E.01994
; LINE_WIDTH: 0.394902
G1 X133.056 Y122.483 E.01351
; LINE_WIDTH: 0.399542
G3 X132.915 Y123.479 I-6.386 J-.397 E.01841
; LINE_WIDTH: 0.395002
G1 X132.752 Y124.016 E.01012
; LINE_WIDTH: 0.398322
G1 X132.398 Y124.783 E.01539
G1 X131.923 Y125.493 E.01556
; LINE_WIDTH: 0.399462
G3 X131.237 Y126.201 I-5.138 J-4.295 E.01802
; LINE_WIDTH: 0.395912
G1 X130.791 Y126.539 E.01013
; LINE_WIDTH: 0.394462
G1 X130.122 Y126.925 E.01392
; LINE_WIDTH: 0.399462
G3 X129.198 Y127.266 I-2.776 J-6.096 E.01802
; LINE_WIDTH: 0.397042
G1 X128.699 Y127.37 E.00925
G1 X127.878 Y127.436 E.01495
; LINE_WIDTH: 0.399342
G3 X126.898 Y127.345 I.124 J-6.595 E.01801
; LINE_WIDTH: 0.397042
G1 X126.404 Y127.222 E.00924
G1 X125.634 Y126.927 E.01496
; LINE_WIDTH: 0.399392
G3 X124.77 Y126.404 I2.876 J-5.726 E.01848
; LINE_WIDTH: 0.396502
G1 X124.358 Y126.063 E.00969
; LINE_WIDTH: 0.397392
G1 X123.766 Y125.413 E.01597
G1 X123.317 Y124.726 E.01492
; LINE_WIDTH: 0.401882
G3 X122.898 Y123.715 I6.687 J-3.366 E.02014
; LINE_WIDTH: 0.393262
G1 X122.763 Y123.126 E.01086
; LINE_WIDTH: 0.396982
G1 X122.691 Y122.4 E.01324
G1 X122.73 Y121.588 E.01474
; LINE_WIDTH: 0.399072
G3 X122.965 Y120.581 I5.949 J.855 E.01891
; LINE_WIDTH: 0.397212
G1 X123.147 Y120.114 E.0091
; LINE_WIDTH: 0.395532
G1 X123.515 Y119.441 E.01388
; LINE_WIDTH: 0.398902
G3 X124.176 Y118.616 I4.796 J3.168 E.01931
; LINE_WIDTH: 0.397662
G1 X124.632 Y118.2 E.01122
; LINE_WIDTH: 0.393402
G1 X125.147 Y117.839 E.01131
; LINE_WIDTH: 0.401632
G3 X126.189 Y117.345 I3.393 J5.821 E.02121
; LINE_WIDTH: 0.395062
G1 X126.833 Y117.17 E.01206
; LINE_WIDTH: 0.404452
G3 X128.072 Y117.065 I1.273 J7.663 E.02305
; LINE_WIDTH: 0.395532
G1 X128.825 Y117.151 E.01369
; LINE_WIDTH: 0.399532
G3 X129.811 Y117.438 I-1.243 J6.104 E.01879
; LINE_WIDTH: 0.395432
G1 X130.417 Y117.73 E.01215
; LINE_WIDTH: 0.398352
G1 X130.975 Y118.095 E.01215
G1 X131.649 Y118.691 E.01638
; LINE_WIDTH: 0.399542
G1 X131.699 Y118.751 E.00144
G1 X131.445 Y119.064 F30000
; LINE_WIDTH: 0.449992
G1 F3135
M73 P82 R3
G1 X131.822 Y119.534 E.01251
G1 X132.133 Y120.063 E.01271
G1 X132.446 Y120.814 E.01688
G1 X132.626 Y121.635 E.01744
G1 X132.659 Y122.491 E.01775
G1 X132.568 Y123.214 E.01513
G1 X132.398 Y123.819 E.01302
G1 X132.041 Y124.607 E.01795
G1 X131.601 Y125.262 E.01637
G1 X131.112 Y125.782 E.0148
G1 X130.613 Y126.177 E.0132
G1 X129.931 Y126.577 E.01639
G1 X129.265 Y126.835 E.01481
G1 X128.618 Y126.98 E.01375
G1 X127.856 Y127.041 E.01585
G3 X126.45 Y126.824 I.136 J-5.552 E.02961
G1 X125.786 Y126.561 E.01481
G1 X125.168 Y126.203 E.01481
G1 X124.653 Y125.792 E.01368
G1 X124.066 Y125.152 E.018
G1 X123.655 Y124.518 E.01568
G1 X123.324 Y123.745 E.01743
G3 X123.088 Y122.37 I5.369 J-1.631 E.02901
G3 X125.373 Y118.164 I4.836 J-.097 E.10387
G3 X126.293 Y117.728 I4.094 J7.462 E.02113
G1 X126.937 Y117.552 E.01385
G3 X128.049 Y117.46 I1.476 J11.038 E.02314
G1 X128.778 Y117.545 E.01522
G1 X129.482 Y117.736 E.01513
G3 X130.85 Y118.494 I-2.061 J5.335 E.03256
G1 X131.375 Y118.978 E.01481
G1 X131.407 Y119.017 E.00105
G1 X131.118 Y119.33 F30000
G1 F3135
G1 X131.488 Y119.795 E.01232
G1 X131.763 Y120.271 E.0114
G1 X132.049 Y120.964 E.01557
G1 X132.21 Y121.719 E.01601
G1 X132.235 Y122.499 E.01618
G1 X132.148 Y123.153 E.01369
G1 X131.991 Y123.696 E.01171
G1 X131.66 Y124.42 E.01651
G1 X131.256 Y125.015 E.01493
G1 X130.808 Y125.487 E.01349
G1 X130.356 Y125.84 E.01189
G1 X129.727 Y126.205 E.01508
G1 X129.118 Y126.437 E.01351
G1 X128.532 Y126.565 E.01244
G1 X127.833 Y126.617 E.01454
G1 X127.185 Y126.563 E.0135
G1 X126.602 Y126.425 E.01243
G1 X125.948 Y126.169 E.01456
G1 X125.387 Y125.84 E.0135
G1 X124.923 Y125.465 E.01237
G1 X124.386 Y124.874 E.01656
G1 X124.016 Y124.295 E.01424
G1 X123.717 Y123.585 E.016
G1 X123.563 Y122.944 E.01367
G1 X123.511 Y122.338 E.0126
G1 X123.549 Y121.649 E.01432
G1 X123.685 Y121.017 E.01342
G1 X123.906 Y120.428 E.01305
G1 X124.227 Y119.847 E.01377
G3 X125.615 Y118.512 I4.028 J2.798 E.04021
G1 X126.304 Y118.175 E.01591
G3 X127.164 Y117.941 I2.855 J8.823 E.01849
G1 X127.942 Y117.884 E.01618
G1 X128.727 Y117.966 E.01637
G1 X129.363 Y118.143 E.01369
G3 X130.147 Y118.52 I-4.435 J10.248 E.01805
G1 X130.607 Y118.842 E.01163
G1 X131.08 Y119.283 E.01343
M204 S250
G1 X130.793 Y119.589 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F600
M204 S5000
G3 X131.667 Y121.11 I-3.047 J2.763 E.03407
G1 X131.809 Y121.8 E.01359
G3 X131.6 Y123.578 I-4.281 J.398 E.03475
G1 X131.293 Y124.239 E.01405
G1 X130.923 Y124.777 E.01258
G1 X130.514 Y125.202 E.01137
G3 X128.45 Y126.164 I-2.694 J-3.084 E.04449
G1 X127.811 Y126.209 E.01234
G1 X127.223 Y126.155 E.01137
G3 X125.184 Y125.149 I.695 J-3.979 E.04443
G1 X124.695 Y124.605 E.0141
G1 X124.364 Y124.081 E.01195
G3 X123.919 Y122.308 I3.896 J-1.922 E.0355
G3 X125.849 Y118.848 I4.029 J-.021 E.07984
G1 X126.48 Y118.544 E.01351
G1 X127.157 Y118.356 E.01354
G1 X127.972 Y118.292 E.01576
G1 X128.678 Y118.373 E.0137
G1 X129.249 Y118.536 E.01143
G1 X129.885 Y118.838 E.01358
G3 X130.752 Y119.545 I-2.139 J3.513 E.02163
; CHANGE_LAYER
; Z_HEIGHT: 9.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F600
M204 S10000
G1 X131.165 Y120.046 E-.24666
G1 X131.455 Y120.559 E-.22412
G1 X131.667 Y121.11 E-.22409
G1 X131.701 Y121.278 E-.06512
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/145
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.96 I.77 J-.943 P1  F30000
G1 X130.214 Y120.063 Z9.96
G1 Z9.68
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F2637
G2 X125.405 Y120.212 I-2.339 J2.187 E.22346
G1 X130.344 Y120.212 E.20277
G3 X131.068 Y122.022 I-2.499 J2.05 E.08131
G3 X130.96 Y123.106 I-3.323 J.217 E.04494
G1 X124.79 Y123.106 E.25334
G2 X130.901 Y123.294 I3.085 J-.856 E.33369
; WIPE_START
G1 F7144.614
G1 X130.706 Y123.748 E-.18789
G1 X130.423 Y124.189 E-.19903
G1 X130.14 Y124.514 E-.16359
G1 X129.717 Y124.867 E-.20949
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.08 I.766 J.946 P1  F30000
G1 X133.413 Y121.874 Z10.08
G1 Z9.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399542
; LAYER_HEIGHT: 0.12
G1 F2637
G1 X133.428 Y122.092 E.004
G1 X133.421 Y122.598 E.00925
; LINE_WIDTH: 0.398442
G1 X133.276 Y123.552 E.01758
G1 X133.137 Y124.039 E.00923
; LINE_WIDTH: 0.399512
G3 X132.724 Y124.964 I-5.665 J-1.973 E.01853
; LINE_WIDTH: 0.399722
G1 X132.176 Y125.766 E.01776
G1 X131.838 Y126.143 E.00925
; LINE_WIDTH: 0.398822
G3 X131.075 Y126.795 I-4.191 J-4.14 E.01834
; LINE_WIDTH: 0.399562
G3 X130.202 Y127.296 I-3.493 J-5.07 E.01841
; LINE_WIDTH: 0.395722
G1 X129.446 Y127.577 E.01459
; LINE_WIDTH: 0.393552
G1 X128.845 Y127.72 E.01112
; LINE_WIDTH: 0.399442
G3 X127.771 Y127.806 I-.99 J-5.647 E.01971
; LINE_WIDTH: 0.398852
G1 X126.81 Y127.703 E.01763
G1 X126.315 Y127.584 E.00928
; LINE_WIDTH: 0.399342
G3 X125.376 Y127.213 I1.714 J-5.709 E.01847
; LINE_WIDTH: 0.396672
G1 X124.702 Y126.807 E.01427
; LINE_WIDTH: 0.394352
G1 X124.162 Y126.386 E.01234
; LINE_WIDTH: 0.399332
G3 X123.474 Y125.642 I4.014 J-4.407 E.01853
; LINE_WIDTH: 0.396672
G1 X123.042 Y124.985 E.01426
; LINE_WIDTH: 0.393612
G1 X122.763 Y124.427 E.01122
; LINE_WIDTH: 0.401712
G3 X122.416 Y123.275 I5.302 J-2.228 E.02216
; LINE_WIDTH: 0.396832
G1 X122.321 Y122.427 E.01548
G1 X122.327 Y121.927 E.00908
; LINE_WIDTH: 0.399132
G3 X122.507 Y120.82 I5.597 J.343 E.02051
; LINE_WIDTH: 0.396862
G1 X122.792 Y120.003 E.01569
G1 X123.021 Y119.542 E.00934
; LINE_WIDTH: 0.399392
G3 X123.644 Y118.649 I4.988 J2.816 E.01992
; LINE_WIDTH: 0.397942
G1 X124.276 Y118.016 E.01627
G1 X124.676 Y117.705 E.00922
; LINE_WIDTH: 0.399522
G3 X125.596 Y117.183 I3.351 J4.833 E.01936
; LINE_WIDTH: 0.394862
G1 X126.36 Y116.906 E.01467
; LINE_WIDTH: 0.395072
G1 X126.956 Y116.768 E.01105
; LINE_WIDTH: 0.399512
G3 X127.966 Y116.693 I.955 J5.96 E.01854
; LINE_WIDTH: 0.395252
G1 X128.496 Y116.728 E.00958
; LINE_WIDTH: 0.399482
G1 X129.425 Y116.915 E.01732
G1 X129.905 Y117.077 E.00926
; LINE_WIDTH: 0.399282
G1 X130.368 Y117.284 E.00926
; LINE_WIDTH: 0.398392
G1 X130.968 Y117.637 E.01269
; LINE_WIDTH: 0.394762
G1 X131.588 Y118.114 E.01412
; LINE_WIDTH: 0.397942
G1 X131.949 Y118.471 E.00923
; LINE_WIDTH: 0.398672
G3 X132.653 Y119.418 I-4.001 J3.707 E.02156
; LINE_WIDTH: 0.393372
G1 X132.955 Y120.001 E.0118
; LINE_WIDTH: 0.398102
G1 X133.182 Y120.605 E.01174
; LINE_WIDTH: 0.398662
G3 X133.394 Y121.593 I-5.493 J1.695 E.01845
; LINE_WIDTH: 0.399542
G1 X133.409 Y121.814 E.00405
G1 X133.81 Y121.847 F30000
; LINE_WIDTH: 0.449992
G1 F2637
G1 X133.827 Y122.098 E.00523
G3 X133.792 Y121.58 I-5.95 J.152 E.76488
G1 X133.806 Y121.787 E.0043
G1 X134.233 Y121.817 F30000
G1 F2637
G1 X134.252 Y122.105 E.00597
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
G3 X134.215 Y121.549 I-6.374 J.145 E.81932
G1 X134.229 Y121.758 E.00433
M204 S250
G1 X134.64 Y121.791 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.111 E.00618
G3 X132.485 Y117.271 I-6.781 J.139 E.7163
G3 X134.62 Y121.519 I-4.684 J5.015 E.09359
G1 X134.636 Y121.731 E.0041
; WIPE_START
M204 S10000
G1 X134.661 Y122.111 E-.14455
G1 X134.645 Y122.728 E-.2344
G1 X134.576 Y123.327 E-.22923
G1 X134.496 Y123.718 E-.15182
; WIPE_END
G1 E-.04
G17
G3 Z10.08 I.875 J-.846 P1  F30000
G1 X128.067 Y117.072 Z10.08
G1 Z9.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.393252
G1 F2637
G1 X128.269 Y117.077 E.00362
; LINE_WIDTH: 0.398232
G1 X128.882 Y117.164 E.01129
; LINE_WIDTH: 0.399482
G3 X129.866 Y117.461 I-1.169 J5.653 E.01879
; LINE_WIDTH: 0.395072
G1 X130.576 Y117.821 E.01437
G1 X131.203 Y118.272 E.01396
; LINE_WIDTH: 0.397942
G1 X131.681 Y118.729 E.01202
G1 X132.219 Y119.415 E.01587
; LINE_WIDTH: 0.399532
G3 X132.677 Y120.287 I-5.698 J3.548 E.01802
; LINE_WIDTH: 0.395602
G1 X132.86 Y120.817 E.01014
; LINE_WIDTH: 0.394242
G1 X133.018 Y121.574 E.01392
; LINE_WIDTH: 0.399542
G3 X133.054 Y122.558 I-6.641 J.735 E.01802
; LINE_WIDTH: 0.395732
G1 X132.989 Y123.115 E.01015
; LINE_WIDTH: 0.394492
G1 X132.804 Y123.865 E.01393
; LINE_WIDTH: 0.399512
G3 X132.41 Y124.769 I-6.321 J-2.218 E.01802
; LINE_WIDTH: 0.395872
G1 X132.111 Y125.243 E.01014
; LINE_WIDTH: 0.398462
G1 X131.56 Y125.895 E.01556
G1 X130.91 Y126.456 E.01564
; LINE_WIDTH: 0.399562
G3 X130.063 Y126.953 I-3.825 J-5.544 E.01798
; LINE_WIDTH: 0.395722
G1 X129.55 Y127.159 E.00999
; LINE_WIDTH: 0.394372
G1 X128.804 Y127.353 E.01391
; LINE_WIDTH: 0.399442
G3 X127.794 Y127.436 I-1.024 J-6.265 E.01852
; LINE_WIDTH: 0.396532
G1 X127.263 Y127.401 E.00965
; LINE_WIDTH: 0.394932
G1 X126.504 Y127.252 E.01396
; LINE_WIDTH: 0.399342
G3 X125.557 Y126.889 I1.768 J-6.038 E.01855
; LINE_WIDTH: 0.396672
G1 X125.094 Y126.628 E.00963
; LINE_WIDTH: 0.394272
G1 X124.475 Y126.167 E.01392
; LINE_WIDTH: 0.399332
G3 X123.777 Y125.429 I4.206 J-4.678 E.01856
; LINE_WIDTH: 0.396672
G1 X123.473 Y124.995 E.00961
; LINE_WIDTH: 0.394932
G1 X123.115 Y124.309 E.01396
; LINE_WIDTH: 0.401712
G3 X122.786 Y123.26 I6.974 J-2.761 E.02023
; LINE_WIDTH: 0.393602
G1 X122.705 Y122.665 E.0108
; LINE_WIDTH: 0.396832
G1 X122.698 Y121.932 E.0133
G1 X122.81 Y121.133 E.01463
; LINE_WIDTH: 0.399112
G3 X123.128 Y120.161 I5.887 J1.389 E.0187
; LINE_WIDTH: 0.396862
G1 X123.356 Y119.701 E.00931
; LINE_WIDTH: 0.395532
G1 X123.784 Y119.062 E.0139
; LINE_WIDTH: 0.398662
G1 X124.185 Y118.609 E.01103
G1 X124.883 Y118.012 E.01674
; LINE_WIDTH: 0.395522
G1 X125.542 Y117.617 E.0139
; LINE_WIDTH: 0.398492
G1 X126.131 Y117.368 E.01165
G1 X126.998 Y117.137 E.01635
; LINE_WIDTH: 0.395112
G1 X127.763 Y117.064 E.01387
; LINE_WIDTH: 0.393252
G1 X128.007 Y117.07 E.0044
G1 X128.056 Y117.47 F30000
; LINE_WIDTH: 0.449992
G1 F2637
G1 X128.353 Y117.489 E.00617
G3 X128.927 Y117.575 I-.491 J5.216 E.01206
G1 X129.648 Y117.806 E.01568
G1 X130.388 Y118.17 E.01711
G1 X130.966 Y118.589 E.01481
G1 X131.398 Y119.009 E.01249
G1 X131.899 Y119.649 E.01687
G1 X132.241 Y120.276 E.01481
G1 X132.45 Y120.844 E.01254
G1 X132.628 Y121.646 E.01705
G1 X132.665 Y122.359 E.01481
G1 X132.605 Y122.988 E.0131
G1 X132.421 Y123.762 E.0165
G1 X132.146 Y124.422 E.01482
G1 X131.818 Y124.965 E.01316
G1 X131.263 Y125.631 E.01799
G1 X130.661 Y126.147 E.01644
G1 X130.051 Y126.518 E.01481
G1 X129.475 Y126.762 E.01298
G1 X128.712 Y126.967 E.0164
G1 X128.002 Y127.039 E.0148
G1 X127.34 Y127.008 E.01374
G1 X126.588 Y126.865 E.01587
G3 X125.288 Y126.283 I1.674 J-5.481 E.02962
G1 X124.718 Y125.854 E.0148
G3 X123.798 Y124.767 I3.88 J-4.216 E.02961
G1 X123.469 Y124.133 E.01482
G1 X123.209 Y123.333 E.01745
G3 X123.712 Y119.877 I4.804 J-1.064 E.07404
G1 X124.109 Y119.288 E.01473
G1 X124.475 Y118.882 E.01135
G1 X125.129 Y118.324 E.01783
G1 X125.739 Y117.961 E.01473
G1 X126.276 Y117.739 E.01204
G1 X127.086 Y117.524 E.01739
G3 X127.793 Y117.467 I.776 J5.182 E.01471
G1 X127.996 Y117.469 E.00423
G1 X128.038 Y117.892 F30000
G1 F2637
G1 X128.304 Y117.909 E.00555
G3 X128.859 Y117.994 I-.443 J4.729 E.01164
G1 X129.511 Y118.207 E.01423
G1 X130.187 Y118.544 E.01566
G1 X130.712 Y118.929 E.0135
G1 X131.096 Y119.307 E.01119
G1 X131.557 Y119.9 E.01557
G1 X131.865 Y120.473 E.0135
G1 X132.049 Y120.983 E.01123
G1 X132.211 Y121.724 E.01574
G1 X132.241 Y122.375 E.0135
G1 X132.183 Y122.94 E.01179
G1 X132.011 Y123.652 E.01519
G1 X131.757 Y124.252 E.01351
G1 X131.459 Y124.739 E.01185
G1 X130.945 Y125.349 E.01653
G1 X130.395 Y125.817 E.01499
G1 X129.837 Y126.152 E.0135
G1 X129.317 Y126.368 E.01168
G1 X128.613 Y126.555 E.0151
G1 X127.966 Y126.617 E.01349
G1 X127.367 Y126.585 E.01243
G1 X126.678 Y126.45 E.01456
G1 X126.067 Y126.226 E.01351
G1 X125.563 Y125.951 E.0119
G1 X124.978 Y125.519 E.01508
G1 X124.525 Y125.052 E.0135
G1 X124.174 Y124.563 E.01249
G1 X123.849 Y123.943 E.01451
G1 X123.614 Y123.208 E.01601
G1 X123.518 Y122.555 E.01368
G1 X123.52 Y121.944 E.01268
G1 X123.619 Y121.267 E.0142
G1 X123.811 Y120.649 E.01342
G1 X124.086 Y120.079 E.01311
G1 X124.457 Y119.531 E.01374
G3 X125.392 Y118.657 I3.417 J2.718 E.02664
G1 X125.95 Y118.329 E.01343
G1 X126.43 Y118.135 E.01074
G1 X127.18 Y117.938 E.01609
G3 X127.824 Y117.889 I.682 J4.701 E.01341
G1 X127.978 Y117.891 E.00318
M204 S250
G1 X128.02 Y118.297 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.239 Y118.307 E.00422
G3 X128.792 Y118.398 I-.364 J3.943 E.01082
G1 X129.379 Y118.595 E.01193
G1 X129.993 Y118.904 E.01326
G3 X131.832 Y122.389 I-2.193 J3.385 E.07935
G3 X131.112 Y124.521 I-4.09 J-.193 E.04394
G1 X130.639 Y125.077 E.01406
G3 X129.164 Y125.989 I-2.909 J-3.058 E.03367
G1 X128.518 Y126.157 E.01286
G1 X127.931 Y126.209 E.01137
G3 X125.764 Y125.594 I-.027 J-4.03 E.04401
G1 X125.23 Y125.196 E.01284
G3 X124.215 Y123.761 I3.045 J-3.228 E.0341
G1 X124.005 Y123.088 E.01359
G3 X124.793 Y119.764 I3.896 J-.832 E.06803
G3 X127.855 Y118.29 I3.082 J2.486 E.06771
G1 X127.96 Y118.295 E.00202
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.239 Y118.307 E-.10599
G1 X128.792 Y118.398 E-.21322
G1 X129.379 Y118.595 E-.23511
G1 X129.862 Y118.838 E-.20568
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 119/145
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z10.08 I-.787 J.928 P1  F30000
G1 X133.412 Y121.849 Z10.08
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399532
G1 F2224
G1 X133.428 Y122.092 E.00446
G1 X133.422 Y122.594 E.00917
; LINE_WIDTH: 0.398552
G1 X133.276 Y123.555 E.01771
G1 X133.074 Y124.204 E.01238
; LINE_WIDTH: 0.395972
G1 X132.733 Y124.949 E.01483
; LINE_WIDTH: 0.397642
G1 X132.467 Y125.38 E.00921
; LINE_WIDTH: 0.400272
G1 X132.161 Y125.784 E.00929
G1 X131.474 Y126.483 E.01793
; LINE_WIDTH: 0.398732
G1 X131.075 Y126.795 E.00924
; LINE_WIDTH: 0.399602
G3 X130.194 Y127.3 I-3.469 J-5.03 E.01857
; LINE_WIDTH: 0.395522
G1 X129.449 Y127.576 E.01438
; LINE_WIDTH: 0.393572
G1 X128.846 Y127.72 E.01114
; LINE_WIDTH: 0.402162
G3 X127.79 Y127.807 I-1.038 J-6.142 E.01954
; LINE_WIDTH: 0.399572
G3 X126.788 Y127.699 I.13 J-5.901 E.01844
; LINE_WIDTH: 0.395482
G1 X126.001 Y127.478 E.01478
; LINE_WIDTH: 0.394232
G1 X125.434 Y127.241 E.01107
; LINE_WIDTH: 0.399542
G3 X124.547 Y126.701 I2.622 J-5.297 E.019
; LINE_WIDTH: 0.397762
G1 X124.157 Y126.379 E.0092
; LINE_WIDTH: 0.399022
G3 X123.383 Y125.516 I3.683 J-4.078 E.02119
; LINE_WIDTH: 0.396192
G1 X122.946 Y124.817 E.01493
; LINE_WIDTH: 0.396942
G1 X122.733 Y124.357 E.00921
; LINE_WIDTH: 0.399472
G3 X122.412 Y123.25 I5.2 J-2.108 E.02109
; LINE_WIDTH: 0.396302
G1 X122.32 Y122.41 E.0153
; LINE_WIDTH: 0.399142
G1 X122.379 Y121.434 E.01785
G3 X122.802 Y119.982 I6.073 J.981 E.02769
; LINE_WIDTH: 0.397262
G1 X123.159 Y119.317 E.0137
; LINE_WIDTH: 0.394432
G1 X123.576 Y118.726 E.01304
; LINE_WIDTH: 0.398492
G3 X124.289 Y118.006 I4.423 J3.661 E.01849
; LINE_WIDTH: 0.398142
G1 X124.861 Y117.585 E.01292
; LINE_WIDTH: 0.394992
G1 X125.531 Y117.21 E.01387
; LINE_WIDTH: 0.398412
G3 X127.165 Y116.741 I2.472 J5.536 E.03107
; LINE_WIDTH: 0.394472
G1 X127.928 Y116.693 E.01379
; LINE_WIDTH: 0.395332
G1 X128.448 Y116.721 E.0094
; LINE_WIDTH: 0.398152
G1 X128.949 Y116.798 E.00923
; LINE_WIDTH: 0.399712
G1 X129.441 Y116.919 E.00927
G1 X130.25 Y117.228 E.01584
; LINE_WIDTH: 0.395122
G1 X130.779 Y117.511 E.01082
; LINE_WIDTH: 0.399622
G3 X131.59 Y118.116 I-3.209 J5.153 E.01852
; LINE_WIDTH: 0.397822
G1 X131.949 Y118.471 E.00919
; LINE_WIDTH: 0.398742
G3 X132.65 Y119.414 I-4.011 J3.715 E.02147
; LINE_WIDTH: 0.393422
G1 X132.953 Y119.999 E.01184
; LINE_WIDTH: 0.397862
G1 X133.182 Y120.604 E.01178
; LINE_WIDTH: 0.398752
G3 X133.394 Y121.591 I-5.534 J1.703 E.01843
; LINE_WIDTH: 0.399532
G1 X133.408 Y121.789 E.00363
G1 X133.808 Y121.822 F30000
; LINE_WIDTH: 0.449992
G1 F2224
G1 X133.827 Y122.099 E.00575
G3 X133.791 Y121.578 I-5.95 J.152 E.76483
G1 X133.804 Y121.762 E.00382
G1 X134.231 Y121.792 F30000
G1 F2224
G1 X134.252 Y122.105 E.0065
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
M73 P83 R3
G3 X134.214 Y121.547 I-6.374 J.145 E.81927
G1 X134.227 Y121.733 E.00386
M204 S250
G1 X134.639 Y121.767 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.111 E.00665
G3 X132.489 Y117.275 I-6.781 J.139 E.71645
G3 X134.63 Y121.61 I-4.687 J5.01 E.09523
G1 X134.636 Y121.707 E.00187
; WIPE_START
M204 S10000
G1 X134.661 Y122.111 E-.15396
G1 X134.646 Y122.723 E-.23266
G1 X134.561 Y123.404 E-.26061
G1 X134.501 Y123.694 E-.11277
; WIPE_END
G1 E-.04
G1 X129.175 Y118.227 Z10.2 F30000
G1 X128.049 Y117.071 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.393252
G1 F2224
G1 X128.263 Y117.076 E.00384
; LINE_WIDTH: 0.398152
G1 X128.883 Y117.164 E.01141
; LINE_WIDTH: 0.399712
G3 X129.871 Y117.463 I-1.195 J5.731 E.01889
; LINE_WIDTH: 0.395212
G1 X130.582 Y117.824 E.01441
G1 X131.209 Y118.277 E.01397
; LINE_WIDTH: 0.397822
G1 X131.681 Y118.729 E.01188
G1 X132.216 Y119.411 E.01578
; LINE_WIDTH: 0.399552
G3 X132.676 Y120.283 I-5.699 J3.557 E.01804
; LINE_WIDTH: 0.395652
G1 X132.859 Y120.813 E.01013
; LINE_WIDTH: 0.394302
G1 X133.017 Y121.569 E.01393
; LINE_WIDTH: 0.399532
G3 X133.054 Y122.554 I-6.64 J.741 E.01802
; LINE_WIDTH: 0.395832
G1 X132.99 Y123.111 E.01015
; LINE_WIDTH: 0.394532
G1 X132.805 Y123.862 E.01394
; LINE_WIDTH: 0.399502
G3 X132.411 Y124.767 I-6.294 J-2.202 E.01806
; LINE_WIDTH: 0.395972
G1 X132.113 Y125.24 E.01011
; LINE_WIDTH: 0.398842
G1 X131.561 Y125.894 E.01561
G1 X130.902 Y126.462 E.01586
; LINE_WIDTH: 0.399602
G3 X130.055 Y126.957 I-3.828 J-5.575 E.01795
; LINE_WIDTH: 0.395522
G1 X129.552 Y127.158 E.00981
; LINE_WIDTH: 0.394362
G1 X128.806 Y127.352 E.01389
; LINE_WIDTH: 0.402162
G3 X127.697 Y127.435 I-1.117 J-7.494 E.02047
; LINE_WIDTH: 0.393522
G1 X127.086 Y127.376 E.01104
; LINE_WIDTH: 0.397652
G3 X126.132 Y127.134 I.895 J-5.547 E.01793
; LINE_WIDTH: 0.394442
G1 X125.614 Y126.918 E.01011
; LINE_WIDTH: 0.399542
G3 X124.77 Y126.405 I3.046 J-5.968 E.01806
; LINE_WIDTH: 0.396042
G1 X124.342 Y126.047 E.01011
; LINE_WIDTH: 0.394542
G1 X123.817 Y125.48 E.01394
; LINE_WIDTH: 0.399422
G3 X123.275 Y124.647 I5.241 J-4.002 E.01816
; LINE_WIDTH: 0.396192
G1 X123.054 Y124.164 E.00962
; LINE_WIDTH: 0.394842
G1 X122.819 Y123.408 E.0143
; LINE_WIDTH: 0.399412
G3 X122.69 Y122.416 I6.322 J-1.326 E.01828
; LINE_WIDTH: 0.396302
G1 X122.7 Y121.891 E.00951
; LINE_WIDTH: 0.395082
G1 X122.81 Y121.132 E.01385
; LINE_WIDTH: 0.399102
G3 X123.135 Y120.147 I5.812 J1.369 E.01896
; LINE_WIDTH: 0.397262
G1 X123.423 Y119.586 E.01146
; LINE_WIDTH: 0.393592
G1 X123.785 Y119.06 E.01149
; LINE_WIDTH: 0.398492
G1 X124.185 Y118.609 E.01099
G1 X124.876 Y118.017 E.01656
; LINE_WIDTH: 0.395382
G1 X125.535 Y117.621 E.01391
; LINE_WIDTH: 0.398412
G1 X126.131 Y117.368 E.0118
G1 X126.991 Y117.138 E.01622
; LINE_WIDTH: 0.395012
G1 X127.756 Y117.065 E.01387
; LINE_WIDTH: 0.393252
G1 X127.989 Y117.07 E.00419
G1 X128.039 Y117.469 F30000
; LINE_WIDTH: 0.449992
G1 F2224
G1 X128.351 Y117.489 E.00649
G3 X128.922 Y117.574 I-.489 J5.228 E.01197
G1 X129.647 Y117.806 E.0158
G1 X130.393 Y118.174 E.01724
G1 X130.971 Y118.593 E.01482
G1 X131.398 Y119.009 E.01235
G1 X131.897 Y119.645 E.01678
G1 X132.239 Y120.273 E.01483
G1 X132.455 Y120.859 E.01296
G1 X132.628 Y121.643 E.01664
G1 X132.665 Y122.356 E.01481
G1 X132.605 Y122.988 E.01318
G1 X132.422 Y123.759 E.01644
G1 X132.147 Y124.419 E.01482
G1 X131.818 Y124.964 E.01321
G1 X131.263 Y125.629 E.01796
G1 X130.654 Y126.153 E.01666
G1 X130.043 Y126.522 E.01481
G1 X129.475 Y126.762 E.01279
G1 X128.714 Y126.967 E.01635
G1 X127.855 Y127.04 E.01788
G3 X126.285 Y126.769 I.12 J-5.388 E.03317
G1 X125.767 Y126.552 E.01163
G1 X125.151 Y126.191 E.01481
G1 X124.656 Y125.793 E.0132
G1 X124.113 Y125.216 E.01642
G1 X123.714 Y124.624 E.01482
G1 X123.435 Y124.043 E.01337
G1 X123.2 Y123.298 E.0162
G3 X123.097 Y121.898 I5.554 J-1.115 E.02919
G1 X123.201 Y121.197 E.0147
G1 X123.351 Y120.694 E.01089
G3 X124.476 Y118.882 I4.315 J1.423 E.04465
G1 X125.122 Y118.328 E.01765
G1 X125.733 Y117.964 E.01475
G1 X126.277 Y117.739 E.01221
G1 X127.08 Y117.525 E.01725
G3 X127.787 Y117.467 I.782 J5.192 E.01472
G1 X127.979 Y117.469 E.00399
G1 X128.021 Y117.891 F30000
G1 F2224
G1 X128.3 Y117.909 E.00579
G3 X128.854 Y117.993 I-.437 J4.728 E.01163
G1 X129.511 Y118.208 E.01434
G1 X130.192 Y118.547 E.01578
G1 X130.716 Y118.933 E.01351
G1 X131.096 Y119.307 E.01106
G1 X131.555 Y119.896 E.01549
G1 X131.864 Y120.47 E.01352
G1 X132.055 Y120.998 E.01165
G1 X132.211 Y121.721 E.01533
G1 X132.241 Y122.371 E.0135
G1 X132.183 Y122.941 E.01187
G1 X132.012 Y123.65 E.01513
G1 X131.758 Y124.249 E.01351
G1 X131.459 Y124.739 E.01191
G1 X130.946 Y125.347 E.0165
G1 X130.388 Y125.822 E.0152
G1 X129.829 Y126.156 E.0135
G1 X129.317 Y126.368 E.0115
G1 X128.615 Y126.554 E.01506
G1 X127.826 Y126.616 E.01642
G3 X126.449 Y126.378 I.205 J-5.283 E.02908
G1 X125.931 Y126.161 E.01163
G1 X125.372 Y125.829 E.0135
G1 X124.927 Y125.467 E.01189
G1 X124.43 Y124.935 E.01511
G1 X124.069 Y124.393 E.01351
G1 X123.82 Y123.866 E.01209
G1 X123.608 Y123.18 E.01488
G1 X123.517 Y122.534 E.01353
G1 X123.52 Y121.943 E.01227
G1 X123.619 Y121.266 E.01419
G1 X123.812 Y120.647 E.01343
G3 X125.386 Y118.661 I4.11 J1.639 E.05332
G1 X125.944 Y118.332 E.01344
G1 X126.431 Y118.134 E.01091
G1 X127.175 Y117.938 E.01594
G3 X127.819 Y117.889 I.688 J4.698 E.01342
G1 X127.961 Y117.89 E.00294
M204 S250
G1 X128.004 Y118.297 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.234 Y118.309 E.00444
G3 X128.788 Y118.397 I-.345 J3.951 E.01082
G1 X129.379 Y118.595 E.01201
G1 X129.997 Y118.907 E.01335
G3 X131.668 Y121.133 I-2.234 J3.417 E.05474
G1 X131.808 Y121.796 E.01307
G1 X131.832 Y122.386 E.01138
G3 X131.112 Y124.521 I-4.084 J-.188 E.044
G1 X130.64 Y125.075 E.01402
G1 X130.132 Y125.503 E.01282
G3 X128.52 Y126.156 I-2.434 J-3.691 E.03374
G1 X127.798 Y126.208 E.01395
G1 X127.207 Y126.152 E.01144
G3 X126.607 Y126 I2.726 J-12.044 E.01194
G3 X125.584 Y125.479 I1.257 J-3.728 E.0222
G3 X124.192 Y123.695 I2.411 J-3.317 E.0442
G3 X127.851 Y118.294 I3.697 J-1.436 E.14765
G1 X127.944 Y118.296 E.0018
; CHANGE_LAYER
; Z_HEIGHT: 9.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.234 Y118.309 E-.11033
G1 X128.788 Y118.397 E-.21306
G1 X129.379 Y118.595 E-.23685
G1 X129.848 Y118.832 E-.19975
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 120/145
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z10.2 I-.783 J.932 P1  F30000
G1 X133.41 Y121.824 Z10.2
G1 Z9.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399522
G1 F2224
G1 X133.428 Y122.092 E.00491
G1 X133.422 Y122.591 E.00912
; LINE_WIDTH: 0.395972
G1 X133.309 Y123.399 E.01476
; LINE_WIDTH: 0.394152
G1 X133.151 Y123.993 E.01107
; LINE_WIDTH: 0.399502
G3 X132.731 Y124.953 I-5.557 J-1.861 E.01917
; LINE_WIDTH: 0.397522
G1 X132.466 Y125.381 E.00914
; LINE_WIDTH: 0.400442
G1 X132.16 Y125.785 E.00928
G1 X131.572 Y126.395 E.01552
; LINE_WIDTH: 0.394812
G1 X131.101 Y126.774 E.01092
; LINE_WIDTH: 0.399652
G3 X130.215 Y127.291 I-3.481 J-4.95 E.01877
; LINE_WIDTH: 0.397362
G1 X129.748 Y127.481 E.00917
; LINE_WIDTH: 0.399132
G3 X128.606 Y127.755 I-1.834 J-5.138 E.02147
; LINE_WIDTH: 0.394422
G1 X127.831 Y127.806 E.01399
; LINE_WIDTH: 0.399642
G3 X126.776 Y127.697 I.07 J-5.845 E.01941
; LINE_WIDTH: 0.395792
G1 X125.99 Y127.474 E.01478
; LINE_WIDTH: 0.394492
G1 X125.427 Y127.238 E.01101
; LINE_WIDTH: 0.399612
G3 X124.547 Y126.701 I2.601 J-5.247 E.01887
; LINE_WIDTH: 0.398012
G1 X124.157 Y126.379 E.0092
; LINE_WIDTH: 0.398932
G3 X123.376 Y125.506 I3.661 J-4.059 E.02141
; LINE_WIDTH: 0.393452
G1 X123.02 Y124.949 E.01188
; LINE_WIDTH: 0.397902
G1 X122.737 Y124.364 E.01183
; LINE_WIDTH: 0.398982
G3 X122.32 Y122.41 I5.215 J-2.132 E.03666
; LINE_WIDTH: 0.399132
G1 X122.379 Y121.434 E.01784
G3 X122.802 Y119.982 I6.071 J.98 E.02769
; LINE_WIDTH: 0.397232
G1 X123.16 Y119.315 E.01375
; LINE_WIDTH: 0.394422
G1 X123.577 Y118.726 E.01301
; LINE_WIDTH: 0.398322
G3 X124.853 Y117.59 I4.632 J3.921 E.03123
; LINE_WIDTH: 0.395142
G1 X125.531 Y117.21 E.01404
; LINE_WIDTH: 0.398322
G1 X126 Y117.019 E.00923
; LINE_WIDTH: 0.398532
G3 X127.157 Y116.742 I1.832 J5.11 E.02173
; LINE_WIDTH: 0.394362
G1 X127.922 Y116.693 E.0138
; LINE_WIDTH: 0.395482
G1 X128.448 Y116.722 E.00952
; LINE_WIDTH: 0.398062
G1 X128.949 Y116.798 E.00923
; LINE_WIDTH: 0.399912
G1 X129.441 Y116.92 E.00928
G1 X130.257 Y117.231 E.01596
; LINE_WIDTH: 0.395292
G1 X130.783 Y117.513 E.01078
; LINE_WIDTH: 0.399542
G3 X131.588 Y118.114 I-3.19 J5.119 E.01839
; LINE_WIDTH: 0.397732
G1 X131.948 Y118.47 E.00921
; LINE_WIDTH: 0.398812
G3 X132.648 Y119.41 I-4.029 J3.729 E.02141
; LINE_WIDTH: 0.393462
G1 X132.952 Y119.995 E.01186
; LINE_WIDTH: 0.397792
G1 X133.182 Y120.604 E.01185
; LINE_WIDTH: 0.398832
G3 X133.394 Y121.589 I-5.553 J1.707 E.01839
; LINE_WIDTH: 0.399522
G1 X133.406 Y121.764 E.00321
G1 X133.806 Y121.797 F30000
; LINE_WIDTH: 0.449992
G1 F2224
G1 X133.827 Y122.098 E.00626
G3 X133.791 Y121.576 I-5.95 J.152 E.76478
G1 X133.802 Y121.737 E.00335
G1 X134.229 Y121.768 F30000
G1 F2224
G1 X134.252 Y122.105 E.00701
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
G3 X134.214 Y121.545 I-6.374 J.145 E.81922
G1 X134.225 Y121.708 E.00339
M204 S250
G1 X134.638 Y121.742 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.111 E.00713
G3 X134.181 Y119.74 I-6.783 J.139 E.77477
G3 X134.629 Y121.606 I-6.551 J2.56 E.03712
G1 X134.634 Y121.682 E.00146
; WIPE_START
M204 S10000
G1 X134.661 Y122.111 E-.16337
G1 X134.646 Y122.719 E-.23128
G1 X134.561 Y123.4 E-.26069
G1 X134.505 Y123.67 E-.10466
; WIPE_END
G1 E-.04
G1 X129.152 Y118.229 Z10.32 F30000
G1 X128.02 Y117.078 Z10.32
G1 Z9.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399542
G1 F2224
G1 X128.257 Y117.076 E.00433
; LINE_WIDTH: 0.398062
G1 X128.883 Y117.164 E.01152
; LINE_WIDTH: 0.399912
G3 X129.875 Y117.465 I-1.219 J5.802 E.01899
; LINE_WIDTH: 0.395352
G1 X130.587 Y117.828 E.01443
G1 X131.214 Y118.281 E.01399
; LINE_WIDTH: 0.397732
G1 X131.68 Y118.727 E.01172
G1 X132.214 Y119.407 E.01572
; LINE_WIDTH: 0.399522
G3 X132.674 Y120.278 I-5.689 J3.559 E.01802
; LINE_WIDTH: 0.395782
G1 X132.858 Y120.808 E.01015
; LINE_WIDTH: 0.394362
G1 X133.017 Y121.565 E.01394
; LINE_WIDTH: 0.399522
G3 X133.054 Y122.552 I-6.628 J.745 E.01805
; LINE_WIDTH: 0.395972
G1 X132.99 Y123.107 E.01013
; LINE_WIDTH: 0.394362
G1 X132.806 Y123.858 E.01393
; LINE_WIDTH: 0.399502
G3 X132.413 Y124.763 I-6.3 J-2.199 E.01803
; LINE_WIDTH: 0.395722
G1 X132.115 Y125.237 E.01014
; LINE_WIDTH: 0.399162
G1 X131.561 Y125.893 E.01568
G1 X130.895 Y126.467 E.01605
; LINE_WIDTH: 0.399652
G3 X130.048 Y126.96 I-3.829 J-5.602 E.01792
; LINE_WIDTH: 0.395352
G1 X129.552 Y127.158 E.00965
; LINE_WIDTH: 0.394342
G1 X128.808 Y127.352 E.01385
; LINE_WIDTH: 0.402372
G3 X127.692 Y127.435 I-1.128 J-7.633 E.02062
; LINE_WIDTH: 0.393072
G1 X127.076 Y127.374 E.01112
; LINE_WIDTH: 0.397992
G1 X126.41 Y127.223 E.01243
; LINE_WIDTH: 0.398892
G1 X125.982 Y127.075 E.00827
G1 X125.465 Y126.844 E.01032
; LINE_WIDTH: 0.393092
G1 X124.937 Y126.523 E.0111
; LINE_WIDTH: 0.398012
G1 X124.401 Y126.098 E.01244
G1 X123.809 Y125.47 E.01571
; LINE_WIDTH: 0.399542
G3 X123.273 Y124.644 I5.349 J-4.057 E.01803
; LINE_WIDTH: 0.395932
G1 X123.042 Y124.132 E.01015
; LINE_WIDTH: 0.394492
G1 X122.816 Y123.393 E.01394
; LINE_WIDTH: 0.398882
G3 X122.691 Y122.415 I5.966 J-1.257 E.018
; LINE_WIDTH: 0.396832
G1 X122.7 Y121.894 E.00946
; LINE_WIDTH: 0.395202
G1 X122.81 Y121.132 E.01391
; LINE_WIDTH: 0.399122
G3 X123.135 Y120.147 I5.825 J1.373 E.01895
; LINE_WIDTH: 0.397232
G1 X123.358 Y119.698 E.00912
; LINE_WIDTH: 0.395142
G1 X123.786 Y119.058 E.0139
; LINE_WIDTH: 0.398322
G1 X124.185 Y118.609 E.01095
G1 X124.868 Y118.023 E.0164
; LINE_WIDTH: 0.395212
G1 X125.528 Y117.625 E.01391
; LINE_WIDTH: 0.398322
G1 X126.131 Y117.368 E.01195
G1 X126.985 Y117.139 E.01609
; LINE_WIDTH: 0.399542
G1 X127.488 Y117.082 E.00926
G1 X127.96 Y117.078 E.00862
G1 X128.022 Y117.469 F30000
; LINE_WIDTH: 0.449992
G1 F2224
G1 X128.35 Y117.489 E.00681
G3 X128.917 Y117.573 I-.487 J5.242 E.0119
G1 X129.647 Y117.807 E.01589
G1 X130.398 Y118.177 E.01737
G1 X130.976 Y118.598 E.01483
G1 X131.397 Y119.007 E.01218
G1 X131.894 Y119.642 E.01672
G1 X132.237 Y120.268 E.01481
G1 X132.456 Y120.859 E.01307
G1 X132.627 Y121.639 E.01655
G1 X132.665 Y122.352 E.01482
M73 P84 R3
G1 X132.607 Y122.975 E.01297
G1 X132.423 Y123.756 E.01664
G1 X132.149 Y124.416 E.01482
G1 X131.818 Y124.966 E.01332
G1 X131.263 Y125.628 E.01792
G1 X130.647 Y126.158 E.01686
G1 X130.035 Y126.526 E.01481
G1 X129.476 Y126.762 E.01259
G1 X128.716 Y126.967 E.01632
G1 X127.846 Y127.039 E.0181
G3 X126.136 Y126.707 I.149 J-5.335 E.03629
G3 X124.657 Y125.793 I1.835 J-4.624 E.03626
G1 X124.106 Y125.208 E.01667
G1 X123.708 Y124.614 E.01482
G1 X123.438 Y124.045 E.01308
G1 X123.197 Y123.285 E.01654
G3 X123.714 Y119.874 I4.821 J-1.014 E.07309
G1 X124.111 Y119.285 E.01474
G1 X124.475 Y118.881 E.01127
G1 X125.116 Y118.333 E.01748
G1 X125.726 Y117.968 E.01476
G1 X126.277 Y117.738 E.01238
G1 X127.074 Y117.526 E.01709
G3 X127.781 Y117.467 I.789 J5.205 E.01473
G1 X127.962 Y117.468 E.00376
G1 X128.005 Y117.89 F30000
G1 F2224
G1 X128.295 Y117.908 E.00602
G3 X128.849 Y117.992 I-.432 J4.728 E.01164
G1 X129.51 Y118.208 E.01442
G1 X130.196 Y118.55 E.0159
G1 X130.721 Y118.937 E.01352
G1 X131.095 Y119.306 E.0109
G1 X131.553 Y119.893 E.01544
G1 X131.862 Y120.466 E.0135
G1 X132.055 Y120.999 E.01176
G1 X132.21 Y121.717 E.01524
G1 X132.241 Y122.368 E.01351
G1 X132.185 Y122.927 E.01166
G1 X132.013 Y123.646 E.01533
G1 X131.76 Y124.246 E.01351
G1 X131.458 Y124.741 E.01201
G1 X130.946 Y125.346 E.01644
G1 X130.381 Y125.827 E.01538
G1 X129.822 Y126.159 E.0135
G1 X129.318 Y126.368 E.01131
G1 X128.617 Y126.554 E.01504
G1 X127.818 Y126.616 E.01662
G3 X126.301 Y126.316 I.172 J-4.858 E.03221
G3 X124.929 Y125.468 I1.664 J-4.223 E.03363
G1 X124.424 Y124.927 E.01536
G1 X124.064 Y124.384 E.01351
G3 X123.52 Y121.941 I3.956 J-2.163 E.0526
G1 X123.62 Y121.265 E.01417
G1 X123.812 Y120.647 E.01344
G3 X125.38 Y118.665 I4.111 J1.641 E.05315
G1 X125.938 Y118.335 E.01345
G1 X126.433 Y118.133 E.01108
G1 X127.169 Y117.939 E.01579
G3 X127.814 Y117.889 I.694 J4.697 E.01343
G1 X127.945 Y117.89 E.00272
M204 S250
G1 X127.988 Y118.296 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.229 Y118.308 E.00466
G3 X128.784 Y118.396 I-.342 J3.948 E.01083
G1 X129.378 Y118.596 E.01208
G1 X130.001 Y118.91 E.01345
G3 X131.669 Y121.134 I-2.239 J3.416 E.05468
G1 X131.808 Y121.793 E.01299
G1 X131.832 Y122.383 E.01138
G3 X131.111 Y124.523 I-4.107 J-.192 E.0441
G1 X130.641 Y125.074 E.01396
G1 X130.125 Y125.507 E.01298
G3 X128.522 Y126.156 I-2.424 J-3.685 E.03356
G1 X127.791 Y126.208 E.01413
G3 X126.46 Y125.939 I.194 J-4.393 E.02627
G3 X125.577 Y125.474 I1.16 J-3.272 E.0193
G3 X124.197 Y123.701 I2.427 J-3.314 E.04388
G3 X127.846 Y118.294 I3.691 J-1.444 E.14769
G1 X127.928 Y118.295 E.00159
; CHANGE_LAYER
; Z_HEIGHT: 9.96
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F1800
M204 S10000
G1 X128.229 Y118.308 E-.1146
G1 X128.784 Y118.396 E-.21326
G1 X129.378 Y118.596 E-.23823
G1 X129.834 Y118.825 E-.19391
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 121/145
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z10.32 I-1.11 J.5 P1  F30000
G1 X130.683 Y120.71 Z10.32
G1 Z9.96
G1 E.8 F1800
; FEATURE: Support transition
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X130.683 Y123.788 E.1264
G3 X129.887 Y124.74 I-2.817 J-1.546 E.05129
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
G1 X129.788 Y124.818 E.00513
G1 X129.788 Y119.683 E.21082
G2 X129.427 Y119.45 I-1.87 J2.501 E.01769
G1 X129.421 Y119.446 E.00029
G2 X128.894 Y119.215 I-1.538 J2.779 E.02365
G1 X128.894 Y125.285 E.24925
G3 X128.326 Y125.419 I-1.049 J-3.168 E.02399
G1 X128.3 Y125.423 E.00109
G3 X128 Y125.449 I-.758 J-6.978 E.01237
G1 X128 Y119.05 E.26273
G2 X127.637 Y119.057 I-.117 J3.247 E.01493
G2 X127.165 Y119.128 I.211 J3.013 E.01962
G1 X127.106 Y119.142 E.00249
G1 X127.106 Y125.358 E.2552
G3 X126.235 Y124.999 I.819 J-3.23 E.0388
G1 X126.212 Y119.514 E.22523
G2 X125.352 Y120.279 I1.675 J2.748 E.04749
G1 X125.317 Y124.176 E.16001
G3 X124.769 Y121.471 I2.562 J-1.927 E.11713
G1 X124.803 Y121.345 E.00536
G3 X125.198 Y120.493 I3.266 J.993 E.03869
G1 X125.203 Y120.485 E.0004
G1 X130.88 Y121.142 F30000
G1 F1200
G1 X130.88 Y121.143 E.00005
G3 X131.068 Y122.478 I-3.021 J1.106 E.05576
G3 X130.881 Y123.353 I-3.193 J-.228 E.03683
; CHANGE_LAYER
; Z_HEIGHT: 10.04
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 X131.068 Y122.478 E-.33979
G1 X131.068 Y122.478 E0
G1 X131.036 Y121.741 E-.28059
G1 X130.943 Y121.385 E-.13962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/145
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z10.36 I-.202 J1.2 P1  F30000
G1 X133.408 Y121.799 Z10.36
G1 Z10.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399502
; LAYER_HEIGHT: 0.12
G1 F3600
G1 X133.429 Y122.092 E.00537
G1 X133.423 Y122.575 E.00882
; LINE_WIDTH: 0.397782
G1 X133.37 Y123.075 E.00915
; LINE_WIDTH: 0.398992
G3 X133.077 Y124.196 I-5.409 J-.815 E.02118
; LINE_WIDTH: 0.396142
G1 X132.733 Y124.948 E.01497
; LINE_WIDTH: 0.397502
G1 X132.467 Y125.38 E.00922
; LINE_WIDTH: 0.400592
G1 X132.161 Y125.784 E.0093
G1 X131.565 Y126.401 E.01571
; LINE_WIDTH: 0.395022
G1 X131.096 Y126.778 E.01088
; LINE_WIDTH: 0.399672
G3 X130.214 Y127.292 I-3.5 J-4.997 E.01866
; LINE_WIDTH: 0.397262
G1 X129.746 Y127.482 E.00917
; LINE_WIDTH: 0.399152
G3 X128.606 Y127.755 I-1.834 J-5.144 E.02145
; LINE_WIDTH: 0.394702
G1 X127.824 Y127.806 E.01414
; LINE_WIDTH: 0.399662
G3 X126.766 Y127.695 I.08 J-5.83 E.01947
; LINE_WIDTH: 0.395572
G1 X125.98 Y127.471 E.01478
; LINE_WIDTH: 0.394742
G1 X125.42 Y127.235 E.01096
; LINE_WIDTH: 0.399652
G3 X124.548 Y126.701 I2.635 J-5.287 E.01872
; LINE_WIDTH: 0.398202
G1 X124.157 Y126.379 E.00923
; LINE_WIDTH: 0.398802
G3 X123.369 Y125.497 I3.653 J-4.053 E.02161
; LINE_WIDTH: 0.395692
G1 X122.946 Y124.816 E.0145
; LINE_WIDTH: 0.398252
G1 X122.734 Y124.358 E.00919
; LINE_WIDTH: 0.398872
G3 X122.409 Y123.234 I5.025 J-2.064 E.02139
; LINE_WIDTH: 0.396842
G1 X122.321 Y122.426 E.01475
G1 X122.327 Y121.923 E.00912
; LINE_WIDTH: 0.399182
G3 X122.508 Y120.817 I5.594 J.346 E.02051
; LINE_WIDTH: 0.397182
G1 X122.795 Y119.997 E.01577
G1 X123.021 Y119.543 E.0092
; LINE_WIDTH: 0.399372
G3 X123.646 Y118.647 I4.977 J2.807 E.01999
; LINE_WIDTH: 0.398472
G1 X124.276 Y118.016 E.01625
G1 X124.676 Y117.705 E.00923
; LINE_WIDTH: 0.399602
G3 X125.573 Y117.192 I3.419 J4.948 E.01891
; LINE_WIDTH: 0.395392
G1 X126.338 Y116.912 E.01472
; LINE_WIDTH: 0.394782
G1 X126.957 Y116.768 E.01146
; LINE_WIDTH: 0.399552
G3 X127.966 Y116.693 I.953 J5.963 E.01853
; LINE_WIDTH: 0.395662
G1 X128.477 Y116.725 E.00926
; LINE_WIDTH: 0.400112
G1 X129.425 Y116.915 E.0177
G1 X129.905 Y117.078 E.00926
; LINE_WIDTH: 0.399972
G1 X130.368 Y117.284 E.00927
; LINE_WIDTH: 0.398082
G1 X130.986 Y117.649 E.01307
; LINE_WIDTH: 0.394632
G1 X131.588 Y118.113 E.01371
; LINE_WIDTH: 0.397562
G1 X131.949 Y118.47 E.00924
; LINE_WIDTH: 0.398872
G3 X132.645 Y119.405 I-4.037 J3.734 E.02131
; LINE_WIDTH: 0.393502
G1 X132.95 Y119.992 E.01189
; LINE_WIDTH: 0.397822
G1 X133.182 Y120.603 E.01189
; LINE_WIDTH: 0.398882
G3 X133.394 Y121.589 I-5.598 J1.717 E.01843
; LINE_WIDTH: 0.399502
G1 X133.404 Y121.74 E.00275
G1 X133.805 Y121.772 F30000
; LINE_WIDTH: 0.449992
G1 F3600
G1 X133.827 Y122.098 E.00678
G3 X133.791 Y121.577 I-5.95 J.152 E.76478
G1 X133.801 Y121.712 E.00283
G1 X134.227 Y121.743 F30000
G1 F3600
G1 X134.252 Y122.105 E.00753
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
G3 X134.214 Y121.545 I-6.374 J.145 E.81922
G1 X134.223 Y121.683 E.00286
M204 S250
G1 X134.636 Y121.717 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.111 E.00761
G3 X133.283 Y118.148 I-6.783 J.138 E.7394
G3 X134.627 Y121.604 I-5.609 J4.171 E.07233
G1 X134.631 Y121.657 E.00104
; WIPE_START
M204 S10000
G1 X134.661 Y122.111 E-.17288
G1 X134.646 Y122.72 E-.23127
G1 X134.562 Y123.396 E-.25899
G1 X134.51 Y123.645 E-.09686
; WIPE_END
G1 E-.04
G1 X129.138 Y118.224 Z10.44 F30000
G1 X128.001 Y117.078 Z10.44
G1 Z10.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399552
G1 F3600
G1 X128.25 Y117.075 E.00455
; LINE_WIDTH: 0.397972
G1 X128.883 Y117.164 E.01163
; LINE_WIDTH: 0.400112
G3 X129.88 Y117.467 I-1.245 J5.881 E.01909
; LINE_WIDTH: 0.395522
G1 X130.593 Y117.831 E.01448
G1 X131.22 Y118.286 E.01399
; LINE_WIDTH: 0.397562
G1 X131.68 Y118.728 E.01161
G1 X132.211 Y119.403 E.0156
; LINE_WIDTH: 0.399522
G3 X132.672 Y120.274 I-5.692 J3.569 E.01803
; LINE_WIDTH: 0.395922
G1 X132.856 Y120.804 E.01016
; LINE_WIDTH: 0.394202
G1 X133.016 Y121.561 E.01394
; LINE_WIDTH: 0.399502
G3 X133.054 Y122.552 I-6.56 J.746 E.01814
; LINE_WIDTH: 0.396082
G1 X132.991 Y123.103 E.01005
; LINE_WIDTH: 0.394322
G1 X132.807 Y123.855 E.01395
; LINE_WIDTH: 0.399462
G3 X132.411 Y124.767 I-6.211 J-2.159 E.01819
; LINE_WIDTH: 0.396142
G1 X132.117 Y125.235 E.01
; LINE_WIDTH: 0.399472
G1 X131.56 Y125.893 E.01575
G1 X130.887 Y126.473 E.01623
; LINE_WIDTH: 0.395122
G1 X130.225 Y126.873 E.01397
; LINE_WIDTH: 0.397262
G1 X129.623 Y127.132 E.01191
G1 X128.81 Y127.352 E.01529
; LINE_WIDTH: 0.402592
G3 X127.685 Y127.435 I-1.131 J-7.671 E.02081
; LINE_WIDTH: 0.393142
G1 X127.066 Y127.372 E.01117
; LINE_WIDTH: 0.398202
G1 X126.411 Y127.223 E.01223
G1 X125.594 Y126.908 E.01594
; LINE_WIDTH: 0.394882
G1 X124.927 Y126.517 E.01396
; LINE_WIDTH: 0.398202
G1 X124.401 Y126.098 E.01224
; LINE_WIDTH: 0.398802
G1 X124.079 Y125.779 E.00827
G1 X123.707 Y125.339 E.0105
; LINE_WIDTH: 0.393372
G1 X123.37 Y124.82 E.01113
; LINE_WIDTH: 0.398252
G1 X123.079 Y124.218 E.01217
G1 X122.813 Y123.381 E.016
; LINE_WIDTH: 0.398762
G3 X122.691 Y122.415 I5.95 J-1.241 E.01778
; LINE_WIDTH: 0.396842
G1 X122.7 Y121.894 E.00946
; LINE_WIDTH: 0.395202
G1 X122.81 Y121.131 E.01393
; LINE_WIDTH: 0.399162
G3 X123.134 Y120.147 I5.848 J1.382 E.01893
; LINE_WIDTH: 0.397182
G1 X123.36 Y119.696 E.00916
; LINE_WIDTH: 0.395422
G1 X123.788 Y119.056 E.01392
; LINE_WIDTH: 0.398142
G1 X124.185 Y118.608 E.0109
G1 X124.862 Y118.027 E.01623
; LINE_WIDTH: 0.395082
G1 X125.521 Y117.629 E.0139
; LINE_WIDTH: 0.398292
G1 X126.123 Y117.371 E.01194
G1 X126.978 Y117.141 E.01612
; LINE_WIDTH: 0.399552
G1 X127.488 Y117.082 E.00939
G1 X127.941 Y117.078 E.00828
G1 X128.006 Y117.468 F30000
; LINE_WIDTH: 0.449992
G1 F3600
G1 X128.348 Y117.489 E.00712
G3 X128.912 Y117.572 I-.485 J5.256 E.01183
G1 X129.647 Y117.807 E.01601
G1 X130.404 Y118.18 E.0175
G1 X130.981 Y118.602 E.01483
G1 X131.397 Y119.008 E.01206
G1 X131.892 Y119.638 E.01661
G1 X132.235 Y120.264 E.01482
G1 X132.453 Y120.851 E.01298
G1 X132.627 Y121.635 E.01665
G1 X132.665 Y122.348 E.01482
G1 X132.607 Y122.975 E.01306
G1 X132.424 Y123.753 E.01658
G1 X132.15 Y124.413 E.01482
G1 X131.818 Y124.965 E.01337
G1 X131.263 Y125.628 E.01793
G1 X130.64 Y126.163 E.01704
G1 X130.027 Y126.53 E.01482
G1 X129.475 Y126.762 E.01242
G1 X128.718 Y126.966 E.01627
G1 X127.838 Y127.039 E.01831
G1 X127.106 Y126.979 E.01523
G1 X126.51 Y126.837 E.01271
G1 X125.749 Y126.543 E.01692
G3 X124.378 Y125.515 I2.513 J-4.781 E.03569
G3 X123.443 Y124.055 I3.653 J-3.369 E.03616
G1 X123.195 Y123.274 E.017
G1 X123.097 Y122.608 E.01395
G1 X123.096 Y121.935 E.01397
G1 X123.201 Y121.195 E.01549
G3 X123.715 Y119.873 I5.61 J1.418 E.02951
G1 X124.113 Y119.283 E.01475
G1 X124.476 Y118.88 E.01124
G1 X125.11 Y118.337 E.01731
G1 X125.719 Y117.971 E.01475
G1 X126.27 Y117.741 E.01238
G1 X127.068 Y117.527 E.01713
G3 X127.775 Y117.468 I.795 J5.218 E.01474
G1 X127.946 Y117.468 E.00353
G1 X127.989 Y117.89 F30000
G1 F3600
G1 X128.289 Y117.908 E.00624
G3 X128.845 Y117.991 I-.426 J4.729 E.01165
G1 X129.51 Y118.209 E.01452
G1 X130.201 Y118.553 E.01602
G1 X130.725 Y118.94 E.01352
G1 X131.096 Y119.306 E.01079
G1 X131.55 Y119.89 E.01534
G1 X131.86 Y120.462 E.01351
G1 X132.052 Y120.991 E.01167
G1 X132.21 Y121.714 E.01534
G1 X132.241 Y122.364 E.01351
G1 X132.185 Y122.928 E.01175
G1 X132.014 Y123.644 E.01527
G1 X131.761 Y124.244 E.01351
G1 X131.458 Y124.74 E.01206
G1 X130.946 Y125.345 E.01644
G1 X130.375 Y125.831 E.01556
G1 X129.814 Y126.163 E.01351
G1 X129.318 Y126.368 E.01115
G1 X128.619 Y126.554 E.01499
G1 X127.81 Y126.616 E.01683
G1 X127.15 Y126.557 E.01375
G1 X126.616 Y126.426 E.0114
G1 X125.915 Y126.153 E.01561
G3 X124.696 Y125.235 I2.309 J-4.333 E.03177
G3 X124.06 Y124.375 I2.819 J-2.753 E.02226
G3 X123.52 Y121.941 I4.002 J-2.164 E.05239
G1 X123.62 Y121.264 E.01419
G1 X123.813 Y120.645 E.01345
G3 X125.374 Y118.669 I4.097 J1.632 E.05298
G1 X125.932 Y118.338 E.01344
G1 X126.426 Y118.136 E.01108
G1 X127.163 Y117.94 E.01583
G3 X127.809 Y117.889 I.7 J4.696 E.01344
G1 X127.929 Y117.889 E.00249
M204 S250
G1 X127.973 Y118.296 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.225 Y118.306 E.00487
G3 X128.78 Y118.395 I-.349 J3.94 E.01084
G1 X129.378 Y118.596 E.01217
G1 X130.006 Y118.913 E.01356
G3 X131.666 Y121.126 I-2.243 J3.412 E.05441
G1 X131.808 Y121.79 E.01308
G1 X131.832 Y122.38 E.01138
G3 X131.111 Y124.523 I-4.099 J-.186 E.04416
G1 X130.641 Y125.073 E.01395
G1 X130.12 Y125.511 E.01313
G3 X128.523 Y126.156 I-2.413 J-3.678 E.03339
G1 X127.783 Y126.208 E.01431
G3 X125.117 Y125.091 I.155 J-4.109 E.05692
G1 X125.004 Y124.965 E.00327
G3 X127.841 Y118.291 I2.872 J-2.719 E.17687
G1 X127.913 Y118.293 E.00138
; CHANGE_LAYER
; Z_HEIGHT: 10.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.225 Y118.306 E-.11872
G1 X128.78 Y118.395 E-.21349
G1 X129.378 Y118.596 E-.2399
G1 X129.819 Y118.819 E-.18789
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 123/145
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z10.44 I-.774 J.939 P1  F30000
G1 X133.407 Y121.774 Z10.44
G1 Z10.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399492
G1 F2223
G1 X133.429 Y122.092 E.00583
G1 X133.422 Y122.588 E.00906
; LINE_WIDTH: 0.396112
G1 X133.31 Y123.391 E.01468
; LINE_WIDTH: 0.394022
G1 X133.153 Y123.988 E.01111
; LINE_WIDTH: 0.399472
G3 X132.728 Y124.957 I-5.535 J-1.846 E.01936
; LINE_WIDTH: 0.400752
G1 X132.171 Y125.771 E.01809
G1 X131.833 Y126.149 E.00929
; LINE_WIDTH: 0.399762
G1 X131.461 Y126.494 E.00928
; LINE_WIDTH: 0.398382
G1 X130.894 Y126.911 E.01283
; LINE_WIDTH: 0.395032
G1 X130.221 Y127.288 E.01393
; LINE_WIDTH: 0.397192
G1 X129.752 Y127.48 E.00919
; LINE_WIDTH: 0.399042
G3 X128.606 Y127.755 I-1.853 J-5.203 E.02156
; LINE_WIDTH: 0.394982
G1 X127.816 Y127.806 E.01429
; LINE_WIDTH: 0.399692
G3 X126.8 Y127.703 I.102 J-6.03 E.0187
; LINE_WIDTH: 0.398382
G1 X126.312 Y127.582 E.00916
; LINE_WIDTH: 0.398632
G3 X125.21 Y127.122 I1.525 J-5.206 E.02182
; LINE_WIDTH: 0.395142
G1 X124.547 Y126.701 E.01418
; LINE_WIDTH: 0.398412
G1 X124.157 Y126.379 E.00923
; LINE_WIDTH: 0.398662
G3 X123.362 Y125.487 I3.63 J-4.032 E.02181
; LINE_WIDTH: 0.395432
G1 X122.946 Y124.817 E.01427
; LINE_WIDTH: 0.398442
G1 X122.734 Y124.356 E.00925
; LINE_WIDTH: 0.398722
G3 X122.436 Y123.391 I5.383 J-2.191 E.01844
; LINE_WIDTH: 0.399752
G3 X122.32 Y122.394 I5.959 J-1.197 E.01837
; LINE_WIDTH: 0.399222
G1 X122.379 Y121.436 E.01752
G3 X122.802 Y119.982 I6.051 J.97 E.02773
; LINE_WIDTH: 0.397152
G1 X123.163 Y119.311 E.01383
; LINE_WIDTH: 0.394392
G1 X123.577 Y118.726 E.01292
; LINE_WIDTH: 0.397952
G1 X123.916 Y118.35 E.00922
; LINE_WIDTH: 0.398622
G3 X124.839 Y117.599 I3.881 J3.827 E.02173
; LINE_WIDTH: 0.395492
G1 X125.531 Y117.21 E.01436
; LINE_WIDTH: 0.398082
G1 X126.001 Y117.019 E.00923
; LINE_WIDTH: 0.398762
G3 X127.144 Y116.744 I1.839 J5.143 E.02148
; LINE_WIDTH: 0.394112
G1 X127.909 Y116.693 E.01381
; LINE_WIDTH: 0.395792
G1 X128.448 Y116.722 E.00976
; LINE_WIDTH: 0.397922
G1 X128.95 Y116.798 E.00924
; LINE_WIDTH: 0.400322
G1 X129.441 Y116.92 E.00927
G1 X130.269 Y117.237 E.01623
; LINE_WIDTH: 0.395682
G1 X130.778 Y117.511 E.01046
; LINE_WIDTH: 0.399542
G3 X131.588 Y118.114 I-3.209 J5.159 E.01848
; LINE_WIDTH: 0.397452
G1 X131.949 Y118.47 E.00921
; LINE_WIDTH: 0.398952
G3 X132.643 Y119.401 I-4.054 J3.747 E.02123
; LINE_WIDTH: 0.395842
G1 X133.013 Y120.131 E.0148
; LINE_WIDTH: 0.397742
G1 X133.183 Y120.605 E.00916
; LINE_WIDTH: 0.398962
G3 X133.395 Y121.593 I-5.665 J1.731 E.01847
; LINE_WIDTH: 0.399492
G1 X133.403 Y121.714 E.00221
G1 X133.803 Y121.748 F30000
; LINE_WIDTH: 0.449992
G1 F2223
G1 X133.827 Y122.098 E.00728
G3 X133.791 Y121.572 I-5.949 J.152 E.76465
G1 X133.799 Y121.688 E.00242
G1 X134.226 Y121.718 F30000
G1 F2223
G1 X134.252 Y122.105 E.00803
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
G3 X134.214 Y121.54 I-6.373 J.145 E.81908
G1 X134.222 Y121.658 E.00245
M204 S250
G1 X134.634 Y121.692 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.111 E.00808
G3 X133.283 Y118.149 I-6.783 J.138 E.73943
G3 X134.627 Y121.6 I-5.605 J4.17 E.07224
G1 X134.63 Y121.632 E.00064
; WIPE_START
M204 S10000
G1 X134.661 Y122.111 E-.18209
G1 X134.646 Y122.716 E-.23022
G1 X134.563 Y123.393 E-.2589
G1 X134.515 Y123.621 E-.08879
; WIPE_END
G1 E-.04
G1 X129.123 Y118.22 Z10.56 F30000
G1 X127.983 Y117.077 Z10.56
G1 Z10.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399542
G1 F2223
G1 X128.244 Y117.075 E.00478
; LINE_WIDTH: 0.397922
G1 X128.877 Y117.163 E.01161
; LINE_WIDTH: 0.400322
G3 X129.884 Y117.469 I-1.255 J5.934 E.0193
; LINE_WIDTH: 0.395682
G1 X130.599 Y117.835 E.01453
G1 X131.225 Y118.29 E.014
; LINE_WIDTH: 0.397452
G1 X131.68 Y118.727 E.01146
G1 X132.208 Y119.399 E.01552
; LINE_WIDTH: 0.399512
G3 X132.672 Y120.274 I-5.625 J3.538 E.01812
; LINE_WIDTH: 0.396052
G1 X132.855 Y120.8 E.01009
; LINE_WIDTH: 0.394332
G1 X133.015 Y121.557 E.01394
; LINE_WIDTH: 0.399492
G3 X133.054 Y122.549 I-6.542 J.75 E.01816
; LINE_WIDTH: 0.396112
G1 X132.992 Y123.1 E.01004
; LINE_WIDTH: 0.394442
M73 P85 R3
G1 X132.809 Y123.851 E.01394
; LINE_WIDTH: 0.399472
G3 X132.414 Y124.762 I-6.235 J-2.162 E.01816
; LINE_WIDTH: 0.396022
G1 X132.119 Y125.232 E.01004
; LINE_WIDTH: 0.399762
G1 X131.56 Y125.893 E.01582
G1 X130.88 Y126.478 E.01642
; LINE_WIDTH: 0.395322
G1 X130.217 Y126.877 E.01399
; LINE_WIDTH: 0.397192
G1 X129.621 Y127.133 E.01177
G1 X128.812 Y127.351 E.01521
; LINE_WIDTH: 0.402812
G3 X127.676 Y127.434 I-1.131 J-7.654 E.02103
; LINE_WIDTH: 0.393522
G1 X127.055 Y127.371 E.01122
; LINE_WIDTH: 0.398382
G1 X126.411 Y127.223 E.01204
G1 X125.585 Y126.904 E.01614
; LINE_WIDTH: 0.399752
G3 X124.745 Y126.386 I3.081 J-5.936 E.01805
; LINE_WIDTH: 0.395172
G1 X124.317 Y126.023 E.01014
G3 X123.766 Y125.419 I7.868 J-7.719 E.01477
; LINE_WIDTH: 0.395042
G1 X123.365 Y124.81 E.01318
; LINE_WIDTH: 0.398442
G1 X123.079 Y124.217 E.01199
G1 X122.81 Y123.37 E.01619
; LINE_WIDTH: 0.399752
G3 X122.689 Y122.401 I6.711 J-1.33 E.01787
; LINE_WIDTH: 0.395522
G1 X122.7 Y121.886 E.00931
; LINE_WIDTH: 0.394812
G1 X122.811 Y121.13 E.01378
; LINE_WIDTH: 0.399162
G3 X123.134 Y120.148 I5.865 J1.388 E.0189
; LINE_WIDTH: 0.397152
G1 X123.36 Y119.695 E.00919
; LINE_WIDTH: 0.395392
G1 X123.79 Y119.054 E.01395
; LINE_WIDTH: 0.397952
G1 X124.185 Y118.608 E.01083
G1 X124.855 Y118.033 E.01608
; LINE_WIDTH: 0.399622
G3 X125.704 Y117.538 I3.798 J5.55 E.01798
; LINE_WIDTH: 0.395542
G1 X126.224 Y117.333 E.01011
; LINE_WIDTH: 0.394662
G1 X126.971 Y117.142 E.0139
; LINE_WIDTH: 0.399542
G3 X127.489 Y117.082 I.951 J5.942 E.00953
G1 X127.923 Y117.078 E.00794
G1 X127.989 Y117.468 F30000
; LINE_WIDTH: 0.449992
G1 F2223
G1 X128.347 Y117.489 E.00743
G3 X128.906 Y117.571 I-.484 J5.272 E.01173
G1 X129.647 Y117.808 E.01612
G3 X131.397 Y119.007 I-1.643 J4.274 E.04442
G1 X131.889 Y119.634 E.01654
G1 X132.234 Y120.26 E.01482
G1 X132.454 Y120.853 E.01312
G1 X132.626 Y121.631 E.01652
G1 X132.665 Y122.344 E.01482
G1 X132.606 Y122.98 E.01324
G1 X132.425 Y123.749 E.0164
G1 X132.151 Y124.41 E.01484
G1 X131.818 Y124.966 E.01345
G1 X131.263 Y125.627 E.0179
G1 X130.633 Y126.167 E.01722
G1 X130.019 Y126.534 E.01483
G1 X129.473 Y126.763 E.01227
G1 X128.72 Y126.966 E.01619
G1 X127.83 Y127.039 E.01852
G1 X127.097 Y126.977 E.01526
G1 X126.511 Y126.837 E.01248
G1 X125.74 Y126.539 E.01715
G1 X125.126 Y126.173 E.01483
G3 X124.073 Y125.167 I4.192 J-5.441 E.03027
G1 X123.698 Y124.596 E.01417
G1 X123.443 Y124.054 E.01242
G1 X123.193 Y123.263 E.0172
G1 X123.094 Y122.555 E.01483
G1 X123.096 Y121.938 E.01279
G1 X123.201 Y121.194 E.01559
G3 X123.716 Y119.871 I5.607 J1.418 E.02952
G1 X124.115 Y119.281 E.01479
G1 X124.475 Y118.88 E.01117
G1 X125.103 Y118.342 E.01715
G1 X125.713 Y117.974 E.01477
G1 X126.279 Y117.737 E.01274
G1 X127.061 Y117.528 E.01679
G3 X127.769 Y117.468 I.802 J5.233 E.01476
G1 X127.929 Y117.468 E.00332
G1 X127.973 Y117.889 F30000
G1 F2223
G1 X128.284 Y117.907 E.00647
G3 X128.839 Y117.99 I-.42 J4.73 E.01164
G1 X129.51 Y118.209 E.01463
G1 X130.206 Y118.556 E.01614
G1 X130.73 Y118.944 E.01352
G1 X131.095 Y119.305 E.01065
G1 X131.548 Y119.886 E.01528
G1 X131.859 Y120.459 E.01351
G1 X132.053 Y120.994 E.01181
G1 X132.209 Y121.71 E.01521
G1 X132.241 Y122.361 E.01351
G1 X132.185 Y122.933 E.01193
G1 X132.015 Y123.64 E.01509
G1 X131.762 Y124.242 E.01353
G1 X131.458 Y124.741 E.01214
G1 X130.946 Y125.344 E.0164
G1 X130.369 Y125.835 E.01573
G1 X129.807 Y126.167 E.01352
G1 X129.316 Y126.369 E.01102
G1 X128.621 Y126.553 E.01492
G1 X127.802 Y126.616 E.01703
G1 X127.141 Y126.555 E.01377
G1 X126.618 Y126.426 E.01117
G1 X125.907 Y126.149 E.01584
G1 X125.349 Y125.812 E.01351
G3 X124.4 Y124.897 I4.074 J-5.171 E.02738
G1 X124.055 Y124.367 E.01313
G1 X123.83 Y123.881 E.01111
G1 X123.601 Y123.149 E.01589
G1 X123.515 Y122.503 E.01352
G1 X123.52 Y121.947 E.01154
G1 X123.62 Y121.264 E.01433
G1 X123.813 Y120.644 E.01346
G3 X125.368 Y118.673 I4.099 J1.635 E.0528
G1 X125.926 Y118.341 E.01347
G1 X126.436 Y118.132 E.01143
G1 X127.157 Y117.941 E.01548
G3 X127.803 Y117.889 I.707 J4.696 E.01346
G1 X127.913 Y117.889 E.00227
M204 S250
G1 X127.957 Y118.295 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.22 Y118.306 E.00507
G3 X128.775 Y118.394 I-.343 J3.945 E.01083
G1 X129.378 Y118.596 E.01226
G1 X130.011 Y118.916 E.01366
G3 X131.667 Y121.129 I-2.25 J3.411 E.05436
G1 X131.807 Y121.787 E.01296
G1 X131.832 Y122.377 E.01138
G3 X131.111 Y124.525 I-4.084 J-.177 E.04426
G1 X130.641 Y125.072 E.0139
G1 X130.114 Y125.515 E.01328
G3 X128.525 Y126.155 I-2.403 J-3.672 E.03323
G1 X127.775 Y126.207 E.01449
G3 X124.72 Y124.642 I.099 J-3.957 E.06844
G1 X124.716 Y124.637 E.00012
G3 X127.836 Y118.291 I3.161 J-2.386 E.16848
G1 X127.897 Y118.293 E.00118
; CHANGE_LAYER
; Z_HEIGHT: 10.24
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F1800
M204 S10000
G1 X128.22 Y118.306 E-.12282
G1 X128.775 Y118.394 E-.21335
G1 X129.378 Y118.596 E-.24168
G1 X129.806 Y118.812 E-.18215
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 124/145
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z10.56 I-.321 J-1.174 P1  F30000
G1 X125.317 Y120.041 Z10.56
G1 Z10.24
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F2739
G1 X125.317 Y124.176 E.16975
G2 X125.782 Y124.672 I2.848 J-2.2 E.02794
G1 X125.873 Y124.75 E.00494
G2 X126.197 Y124.976 I3.62 J-4.835 E.0162
G1 X126.212 Y119.514 E.22426
G3 X127.106 Y119.142 I1.659 J2.727 E.03992
G1 X127.106 Y125.358 E.2552
G2 X128 Y125.449 I.773 J-3.142 E.03703
G1 X128 Y119.05 E.26275
G3 X128.894 Y119.215 I-.122 J3.172 E.03746
G1 X128.894 Y125.285 E.24925
G2 X129.787 Y124.819 I-1.046 J-3.092 E.04151
G1 X129.788 Y119.683 E.21088
G3 X130.615 Y120.593 I-1.956 J2.606 E.05077
G1 X130.683 Y120.71 E.00554
G1 X130.683 Y124.131 E.14047
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
; CHANGE_LAYER
; Z_HEIGHT: 10.28
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F4800
G1 X130.683 Y122.131 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/145
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z10.64 I.166 J1.206 P1  F30000
G1 X133.405 Y121.756 Z10.64
G1 Z10.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.398152
; LAYER_HEIGHT: 0.12
G1 F2739
G1 X133.43 Y122.094 E.00616
; LINE_WIDTH: 0.399662
G3 X133.372 Y123.073 I-6.247 J.119 E.01796
; LINE_WIDTH: 0.398752
G3 X133.131 Y124.053 I-5.738 J-.895 E.01843
; LINE_WIDTH: 0.398112
G1 X132.851 Y124.716 E.0131
; LINE_WIDTH: 0.394852
G1 X132.472 Y125.373 E.01369
; LINE_WIDTH: 0.398762
G3 X131.828 Y126.155 I-4.756 J-3.265 E.0185
; LINE_WIDTH: 0.397792
G1 X131.352 Y126.581 E.01162
; LINE_WIDTH: 0.396402
G1 X130.662 Y127.057 E.01519
; LINE_WIDTH: 0.397302
G1 X130.212 Y127.291 E.00921
; LINE_WIDTH: 0.399092
G3 X129.132 Y127.66 I-2.334 J-5.071 E.02087
; LINE_WIDTH: 0.396322
G1 X128.303 Y127.79 E.01521
G1 X127.795 Y127.807 E.0092
; LINE_WIDTH: 0.399682
G3 X126.745 Y127.69 I.125 J-5.885 E.01935
; LINE_WIDTH: 0.398452
G1 X125.851 Y127.424 E.01698
G1 X125.387 Y127.22 E.00924
; LINE_WIDTH: 0.399752
G3 X124.5 Y126.663 I2.687 J-5.265 E.01918
; LINE_WIDTH: 0.395022
G1 X123.89 Y126.119 E.01477
; LINE_WIDTH: 0.395232
G1 X123.493 Y125.667 E.01086
; LINE_WIDTH: 0.399772
G3 X122.941 Y124.809 I4.852 J-3.726 E.01867
; LINE_WIDTH: 0.398612
G3 X122.403 Y123.2 I5.46 J-2.72 E.03103
; LINE_WIDTH: 0.395292
G1 X122.32 Y122.425 E.0141
; LINE_WIDTH: 0.396722
G1 X122.327 Y121.918 E.00918
; LINE_WIDTH: 0.399222
G3 X122.509 Y120.815 I5.633 J.359 E.02045
; LINE_WIDTH: 0.397112
G1 X122.795 Y119.997 E.01573
G1 X123.021 Y119.543 E.00921
; LINE_WIDTH: 0.399362
G3 X123.648 Y118.645 I4.974 J2.804 E.02003
; LINE_WIDTH: 0.398752
G1 X124.276 Y118.016 E.01622
G1 X124.675 Y117.705 E.00923
; LINE_WIDTH: 0.399622
G3 X125.558 Y117.199 I3.468 J5.027 E.01862
; LINE_WIDTH: 0.395732
G1 X126.324 Y116.917 E.01476
; LINE_WIDTH: 0.394372
G1 X126.917 Y116.776 E.01098
; LINE_WIDTH: 0.399542
G3 X127.958 Y116.692 I.998 J5.877 E.01912
; LINE_WIDTH: 0.395942
G1 X128.465 Y116.724 E.00919
G1 X129.269 Y116.874 E.01481
; LINE_WIDTH: 0.394542
G1 X129.898 Y117.073 E.01189
; LINE_WIDTH: 0.399522
G3 X130.803 Y117.526 I-2.233 J5.586 E.01853
; LINE_WIDTH: 0.398272
G1 X131.583 Y118.112 E.01776
G1 X131.944 Y118.463 E.00917
; LINE_WIDTH: 0.398852
G3 X132.562 Y119.265 I-4.249 J3.913 E.01849
; LINE_WIDTH: 0.397962
G1 X132.909 Y119.905 E.01325
; LINE_WIDTH: 0.394732
G1 X133.184 Y120.604 E.01355
; LINE_WIDTH: 0.398822
G3 X133.393 Y121.593 I-5.556 J1.69 E.01846
; LINE_WIDTH: 0.398152
G1 X133.401 Y121.696 E.00189
G1 X133.801 Y121.724 F30000
; LINE_WIDTH: 0.449992
G1 F2739
G1 X133.827 Y122.1 E.00782
G3 X133.791 Y121.572 I-5.949 J.151 E.76458
G1 X133.797 Y121.664 E.00191
G1 X134.224 Y121.694 F30000
G1 F2739
G1 X134.252 Y122.106 E.00857
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
G3 X133.794 Y119.873 I-6.374 J.143 E.78338
G3 X134.212 Y121.54 I-6.088 J2.411 E.03576
G1 X134.219 Y121.634 E.00195
M204 S250
G1 X134.632 Y121.667 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.112 E.00859
G3 X134.179 Y119.735 I-6.783 J.137 E.7747
G3 X134.62 Y121.51 I-6.464 J2.547 E.03536
G1 X134.627 Y121.608 E.00188
; WIPE_START
M204 S10000
G1 X134.661 Y122.112 E-.19217
G1 X134.646 Y122.719 E-.23053
G1 X134.564 Y123.386 E-.25543
G1 X134.52 Y123.597 E-.08187
; WIPE_END
G1 E-.04
G1 X129.109 Y118.215 Z10.68 F30000
G1 X127.965 Y117.077 Z10.68
G1 Z10.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399542
G1 F2739
G1 X128.239 Y117.075 E.005
; LINE_WIDTH: 0.397762
G1 X128.884 Y117.164 E.01185
G1 X129.705 Y117.396 E.01552
; LINE_WIDTH: 0.399522
G3 X130.594 Y117.832 I-2.477 J6.182 E.0181
; LINE_WIDTH: 0.396032
G1 X131.052 Y118.149 E.01009
; LINE_WIDTH: 0.394512
G1 X131.579 Y118.619 E.01273
; LINE_WIDTH: 0.398852
G3 X132.24 Y119.453 I-4.106 J3.935 E.01944
; LINE_WIDTH: 0.397962
G1 X132.543 Y119.986 E.01116
; LINE_WIDTH: 0.393492
G1 X132.782 Y120.571 E.01136
; LINE_WIDTH: 0.398822
G3 X133.022 Y121.631 I-5.295 J1.756 E.01985
; LINE_WIDTH: 0.398152
G1 X133.063 Y122.232 E.01098
; LINE_WIDTH: 0.393552
G1 X133.025 Y122.863 E.01137
; LINE_WIDTH: 0.398752
G1 X132.909 Y123.484 E.01151
G1 X132.618 Y124.351 E.01669
; LINE_WIDTH: 0.395592
G1 X132.251 Y125.033 E.01399
; LINE_WIDTH: 0.398762
G1 X131.876 Y125.545 E.01159
G1 X131.288 Y126.156 E.01546
; LINE_WIDTH: 0.399412
G3 X130.478 Y126.736 I-4.188 J-4.992 E.01822
; LINE_WIDTH: 0.396402
G1 X129.996 Y126.984 E.00981
; LINE_WIDTH: 0.394742
G1 X129.268 Y127.246 E.01397
; LINE_WIDTH: 0.399412
G3 X128.274 Y127.421 I-1.605 J-6.195 E.01845
; LINE_WIDTH: 0.396322
G1 X127.67 Y127.434 E.01095
; LINE_WIDTH: 0.393352
G1 X127.045 Y127.369 E.01129
; LINE_WIDTH: 0.398632
G1 X126.414 Y127.223 E.01181
G1 X125.575 Y126.899 E.0164
; LINE_WIDTH: 0.395342
G1 X124.909 Y126.504 E.01398
; LINE_WIDTH: 0.398592
G1 X124.402 Y126.098 E.01185
G1 X123.788 Y125.444 E.01635
; LINE_WIDTH: 0.395322
G1 X123.766 Y125.418 E.0006
; LINE_WIDTH: 0.395272
G1 X123.359 Y124.799 E.01338
; LINE_WIDTH: 0.398612
G1 X123.078 Y124.215 E.01182
G1 X122.808 Y123.358 E.01638
; LINE_WIDTH: 0.399772
G3 X122.689 Y122.39 I6.737 J-1.316 E.01784
; LINE_WIDTH: 0.395292
G1 X122.7 Y121.884 E.00915
; LINE_WIDTH: 0.394662
G1 X122.811 Y121.129 E.01376
; LINE_WIDTH: 0.399182
G3 X123.134 Y120.148 I5.88 J1.393 E.01889
; LINE_WIDTH: 0.397112
G1 X123.361 Y119.693 E.00924
; LINE_WIDTH: 0.395342
G1 X123.791 Y119.052 E.01395
; LINE_WIDTH: 0.397792
G1 X124.185 Y118.608 E.01079
G1 X124.848 Y118.038 E.01591
; LINE_WIDTH: 0.399622
G3 X125.697 Y117.542 I3.807 J5.542 E.01799
; LINE_WIDTH: 0.395732
G1 X126.217 Y117.335 E.01013
; LINE_WIDTH: 0.394552
G1 X126.964 Y117.143 E.0139
; LINE_WIDTH: 0.399542
G3 X127.489 Y117.082 I.958 J5.927 E.00966
G1 X127.905 Y117.078 E.00761
G1 X127.973 Y117.468 F30000
; LINE_WIDTH: 0.449992
G1 F2739
G1 X128.345 Y117.489 E.00772
G3 X128.901 Y117.57 I-.482 J5.287 E.01166
G1 X129.585 Y117.774 E.01481
G1 X130.232 Y118.079 E.01483
G1 X130.764 Y118.432 E.01325
G1 X131.31 Y118.909 E.01503
G1 X131.669 Y119.334 E.01154
G1 X132.137 Y120.061 E.01793
G1 X132.415 Y120.719 E.01482
G1 X132.558 Y121.269 E.01178
G1 X132.664 Y122.123 E.01785
G1 X132.63 Y122.838 E.01484
G1 X132.52 Y123.399 E.01187
G1 X132.246 Y124.21 E.01776
G1 X131.906 Y124.839 E.01483
G1 X131.561 Y125.3 E.01195
M73 P86 R3
G1 X131.013 Y125.871 E.01641
G1 X130.444 Y126.294 E.01469
G1 X129.867 Y126.604 E.01359
G1 X129.141 Y126.871 E.01605
G1 X128.439 Y127.008 E.01483
G1 X127.791 Y127.04 E.01347
G1 X127.087 Y126.975 E.01465
G1 X126.515 Y126.838 E.01221
G1 X125.731 Y126.534 E.01743
G1 X125.118 Y126.168 E.01483
G3 X124.071 Y125.164 I4.362 J-5.597 E.03012
G1 X123.693 Y124.586 E.01433
G1 X123.442 Y124.053 E.01223
G1 X123.19 Y123.252 E.01741
G1 X123.093 Y122.544 E.01483
G1 X123.096 Y121.942 E.01249
G1 X123.202 Y121.194 E.01567
G3 X123.717 Y119.87 I5.596 J1.415 E.02955
G1 X124.116 Y119.279 E.01479
G1 X124.475 Y118.88 E.01114
G1 X125.096 Y118.347 E.01698
G1 X125.706 Y117.978 E.01478
G1 X126.279 Y117.737 E.0129
G1 X127.055 Y117.529 E.01665
G3 X127.764 Y117.468 I.809 J5.247 E.01477
G1 X127.913 Y117.468 E.0031
G1 X127.957 Y117.889 F30000
G1 F2739
G1 X128.279 Y117.907 E.00669
G3 X128.835 Y117.989 I-.415 J4.73 E.01165
G1 X129.457 Y118.179 E.0135
G3 X131.022 Y119.221 I-1.895 J4.541 E.03923
G1 X131.434 Y119.718 E.01341
G1 X131.772 Y120.277 E.01353
G1 X132.022 Y120.878 E.01351
G1 X132.145 Y121.367 E.01047
G1 X132.242 Y122.159 E.01654
G1 X132.206 Y122.81 E.01353
G1 X132.105 Y123.309 E.01056
G1 X131.85 Y124.06 E.01644
G1 X131.536 Y124.631 E.01351
G1 X131.226 Y125.04 E.01064
G1 X130.718 Y125.566 E.01517
G1 X130.196 Y125.95 E.01344
G1 X129.673 Y126.227 E.01228
G1 X129.005 Y126.469 E.01474
G1 X128.364 Y126.59 E.01352
G1 X127.776 Y126.616 E.01222
G1 X127.132 Y126.554 E.01341
G1 X126.622 Y126.427 E.0109
G1 X125.899 Y126.144 E.01612
G1 X125.341 Y125.807 E.01351
G3 X124.397 Y124.893 I4.203 J-5.285 E.0273
G1 X124.05 Y124.358 E.01323
G1 X123.83 Y123.88 E.01092
G1 X123.599 Y123.139 E.0161
G1 X123.514 Y122.493 E.01352
G1 X123.52 Y121.951 E.01125
G1 X123.62 Y121.263 E.01441
G1 X123.813 Y120.643 E.01347
G3 X125.362 Y118.677 I4.102 J1.639 E.05263
G1 X125.92 Y118.344 E.01347
G1 X126.437 Y118.131 E.0116
G1 X127.152 Y117.942 E.01534
G3 X127.798 Y117.889 I.713 J4.694 E.01347
G1 X127.897 Y117.889 E.00206
M204 S250
G1 X127.942 Y118.295 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.216 Y118.306 E.00528
G3 X131.798 Y122.784 I-.351 J3.953 E.12353
G3 X124.715 Y124.635 I-3.924 J-.54 E.17997
G1 X124.712 Y124.631 E.00009
G3 X123.994 Y123.03 I3.625 J-2.588 E.03405
G3 X127.832 Y118.291 I3.885 J-.778 E.13415
G1 X127.882 Y118.292 E.00098
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.216 Y118.306 E-.12684
G1 X128.771 Y118.393 E-.21346
G1 X129.334 Y118.569 E-.22425
G1 X129.797 Y118.794 E-.19545
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 126/145
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z10.68 I-.769 J.943 P1  F30000
G1 X133.403 Y121.733 Z10.68
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399422
G1 F2223
G1 X133.43 Y122.091 E.00657
; LINE_WIDTH: 0.397452
G1 X133.422 Y122.58 E.00888
; LINE_WIDTH: 0.399102
G3 X133.274 Y123.572 I-5.907 J-.378 E.01833
; LINE_WIDTH: 0.399422
G3 X132.947 Y124.521 I-5.896 J-1.499 E.01836
; LINE_WIDTH: 0.399132
G1 X132.47 Y125.372 E.01782
G1 X132.168 Y125.78 E.00926
; LINE_WIDTH: 0.401882
G3 X131.354 Y126.58 I-4.6 J-3.873 E.02102
; LINE_WIDTH: 0.396502
G1 X130.662 Y127.058 E.01525
; LINE_WIDTH: 0.397242
G1 X130.212 Y127.292 E.00921
; LINE_WIDTH: 0.399132
G3 X129.134 Y127.66 I-2.333 J-5.073 E.02082
; LINE_WIDTH: 0.396652
G1 X128.301 Y127.79 E.0153
; LINE_WIDTH: 0.400892
G3 X127.289 Y127.776 I-.419 J-6.001 E.01859
; LINE_WIDTH: 0.396562
G1 X126.51 Y127.633 E.01436
; LINE_WIDTH: 0.394352
G1 X125.851 Y127.427 E.01243
; LINE_WIDTH: 0.399342
G3 X124.95 Y126.975 I2.21 J-5.535 E.01843
; LINE_WIDTH: 0.396592
G1 X124.312 Y126.51 E.01432
; LINE_WIDTH: 0.394342
G1 X123.806 Y126.036 E.01249
; LINE_WIDTH: 0.399322
G3 X123.187 Y125.234 I4.38 J-4.018 E.01852
G1 X122.738 Y124.367 E.01784
G3 X122.357 Y122.911 I5.733 J-2.279 E.02756
; LINE_WIDTH: 0.402432
G3 X122.331 Y121.881 I6.204 J-.675 E.019
; LINE_WIDTH: 0.395472
G1 X122.447 Y121.073 E.01475
; LINE_WIDTH: 0.394812
G1 X122.605 Y120.488 E.01093
; LINE_WIDTH: 0.398612
G3 X123.02 Y119.545 I5.476 J1.849 E.01881
; LINE_WIDTH: 0.397062
G1 X123.283 Y119.119 E.0091
; LINE_WIDTH: 0.401532
G1 X123.59 Y118.715 E.00931
G1 X124.165 Y118.117 E.01526
; LINE_WIDTH: 0.394482
G1 X124.639 Y117.732 E.011
; LINE_WIDTH: 0.399582
G3 X125.532 Y117.21 I3.428 J4.836 E.01893
; LINE_WIDTH: 0.397832
G1 X126 Y117.019 E.00921
; LINE_WIDTH: 0.398962
G3 X127.13 Y116.746 I1.848 J5.179 E.02125
; LINE_WIDTH: 0.396102
G1 X127.95 Y116.693 E.01488
; LINE_WIDTH: 0.397652
G1 X128.456 Y116.723 E.00922
; LINE_WIDTH: 0.398962
G3 X129.61 Y116.974 I-.581 J5.453 E.0216
; LINE_WIDTH: 0.394472
G1 X130.354 Y117.275 E.01446
; LINE_WIDTH: 0.399512
G3 X131.215 Y117.808 I-2.717 J5.351 E.01854
; LINE_WIDTH: 0.396182
G1 X131.821 Y118.342 E.01463
; LINE_WIDTH: 0.394442
G1 X132.267 Y118.843 E.01209
; LINE_WIDTH: 0.399482
G3 X132.812 Y119.697 I-4.768 J3.641 E.01853
; LINE_WIDTH: 0.399082
G1 X133.182 Y120.604 E.01788
G1 X133.312 Y121.094 E.00924
; LINE_WIDTH: 0.399422
G3 X133.392 Y121.591 I-5.935 J1.208 E.0092
G1 X133.398 Y121.673 E.00151
G1 X133.799 Y121.7 F30000
; LINE_WIDTH: 0.449992
G1 F2223
G1 X133.827 Y122.097 E.00827
G3 X133.79 Y121.569 I-5.949 J.153 E.76464
G1 X133.795 Y121.64 E.00147
G1 X134.222 Y121.67 F30000
G1 F2223
G1 X134.252 Y122.103 E.00901
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
G3 X134.213 Y121.538 I-6.373 J.146 E.81907
G1 X134.218 Y121.61 E.00151
M204 S250
G1 X134.63 Y121.643 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.11 E.00901
G3 X133.928 Y119.18 I-6.783 J.139 E.76292
G3 X134.615 Y121.508 I-6.481 J3.177 E.04701
G1 X134.624 Y121.584 E.00147
; WIPE_START
M204 S10000
G1 X134.661 Y122.11 E-.20037
G1 X134.639 Y122.782 E-.25563
G1 X134.577 Y123.324 E-.20751
G1 X134.523 Y123.573 E-.0965
; WIPE_END
G1 E-.04
G1 X129.115 Y118.187 Z10.8 F30000
G1 X127.989 Y117.066 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.396102
G1 F2223
G1 X128.499 Y117.1 E.00925
; LINE_WIDTH: 0.394542
G1 X129.258 Y117.251 E.01397
; LINE_WIDTH: 0.401862
G3 X130.273 Y117.648 I-2.253 J7.234 E.02005
; LINE_WIDTH: 0.393232
G1 X130.797 Y117.965 E.01101
; LINE_WIDTH: 0.397552
G1 X131.348 Y118.399 E.01274
G1 X131.929 Y119.014 E.01538
; LINE_WIDTH: 0.399482
G3 X132.475 Y119.852 I-5.181 J3.972 E.0183
; LINE_WIDTH: 0.396252
G1 X132.702 Y120.351 E.00993
; LINE_WIDTH: 0.394622
M73 P86 R2
G1 X132.931 Y121.09 E.01395
; LINE_WIDTH: 0.399422
G3 X133.06 Y122.085 I-6.337 J1.326 E.01834
; LINE_WIDTH: 0.396342
G1 X133.048 Y122.631 E.00989
; LINE_WIDTH: 0.394652
G1 X132.934 Y123.396 E.01396
; LINE_WIDTH: 0.399422
G3 X132.616 Y124.354 I-6.209 J-1.529 E.01846
; LINE_WIDTH: 0.396492
G1 X132.372 Y124.834 E.00976
; LINE_WIDTH: 0.394752
G1 X131.937 Y125.475 E.01397
; LINE_WIDTH: 0.401882
G3 X131.171 Y126.256 I-5.768 J-4.887 E.02014
; LINE_WIDTH: 0.393252
G1 X130.678 Y126.613 E.01093
; LINE_WIDTH: 0.397242
G1 X130.049 Y126.958 E.01304
G1 X129.27 Y127.245 E.01508
; LINE_WIDTH: 0.399382
G3 X128.276 Y127.421 I-1.597 J-6.143 E.01845
; LINE_WIDTH: 0.396652
G1 X127.604 Y127.428 E.01219
; LINE_WIDTH: 0.397062
G1 X126.863 Y127.336 E.01355
G1 X126.071 Y127.113 E.01494
; LINE_WIDTH: 0.399342
G3 X125.159 Y126.669 I2.294 J-5.867 E.01855
; LINE_WIDTH: 0.396592
G1 X124.72 Y126.367 E.00967
; LINE_WIDTH: 0.394952
G1 X124.142 Y125.851 E.01398
; LINE_WIDTH: 0.399322
G3 X123.509 Y125.049 I4.549 J-4.243 E.01869
; LINE_WIDTH: 0.396792
G1 X123.247 Y124.593 E.00954
; LINE_WIDTH: 0.394972
G1 X122.95 Y123.878 E.01398
; LINE_WIDTH: 0.399272
G3 X122.728 Y122.885 I5.911 J-1.847 E.0186
; LINE_WIDTH: 0.396832
G1 X122.691 Y122.164 E.0131
; LINE_WIDTH: 0.398372
G1 X122.75 Y121.473 E.01262
G1 X122.952 Y120.617 E.01604
; LINE_WIDTH: 0.398612
G3 X123.341 Y119.733 I5.635 J1.952 E.01762
; LINE_WIDTH: 0.397062
G1 X123.609 Y119.299 E.00927
; LINE_WIDTH: 0.398832
G1 X124.189 Y118.605 E.0165
G1 X124.841 Y118.042 E.0157
; LINE_WIDTH: 0.399582
G3 X125.69 Y117.545 I3.818 J5.538 E.01799
; LINE_WIDTH: 0.395902
G1 X126.21 Y117.337 E.01014
; LINE_WIDTH: 0.394462
G1 X126.957 Y117.145 E.01392
; LINE_WIDTH: 0.399512
G3 X127.929 Y117.063 I1.04 J6.54 E.01784
G1 X127.959 Y117.47 F30000
; LINE_WIDTH: 0.449992
G1 F2223
G1 X128.398 Y117.491 E.0091
G1 X129.174 Y117.638 E.01638
G1 X129.96 Y117.937 E.01746
G1 X130.592 Y118.304 E.01515
G1 X131.093 Y118.705 E.01332
G1 X131.633 Y119.278 E.01632
G1 X132.034 Y119.871 E.01486
G1 X132.314 Y120.455 E.01343
G1 X132.55 Y121.2 E.01621
G1 X132.654 Y121.908 E.01484
G1 X132.653 Y122.557 E.01347
G1 X132.543 Y123.33 E.01618
G1 X132.33 Y124.012 E.01482
G1 X132.045 Y124.602 E.0136
G1 X131.614 Y125.246 E.01607
G1 X131.03 Y125.854 E.01748
G3 X129.816 Y126.63 I-3.608 J-4.305 E.02998
G1 X129.143 Y126.87 E.01483
G1 X128.441 Y127.007 E.01483
G3 X127.404 Y127.016 I-.583 J-7.546 E.02153
G3 X125.384 Y126.34 I.615 J-5.196 E.0445
G3 X123.853 Y124.85 I2.781 J-4.387 E.04462
G3 X123.125 Y122.864 I4.448 J-2.758 E.04418
G1 X123.087 Y122.143 E.01498
G1 X123.145 Y121.52 E.01298
G1 X123.334 Y120.721 E.01703
G1 X123.586 Y120.114 E.01362
G1 X123.933 Y119.529 E.01412
G1 X124.489 Y118.868 E.0179
G1 X125.09 Y118.351 E.01645
G1 X125.699 Y117.981 E.01479
G1 X126.28 Y117.736 E.01307
G1 X127.049 Y117.53 E.0165
G1 X127.758 Y117.46 E.01478
G1 X127.899 Y117.467 E.00294
G1 X127.937 Y117.891 F30000
G1 F2223
G1 X128.37 Y117.914 E.00899
G1 X129.083 Y118.052 E.01506
G1 X129.803 Y118.331 E.01602
G1 X130.373 Y118.667 E.01371
G1 X130.822 Y119.031 E.01201
G1 X131.316 Y119.56 E.01501
G1 X131.679 Y120.103 E.01354
G1 X131.928 Y120.631 E.01212
G1 X132.142 Y121.317 E.0149
G1 X132.233 Y121.963 E.01353
G1 X132.229 Y122.549 E.01216
G1 X132.125 Y123.258 E.01487
G1 X131.927 Y123.879 E.01351
G1 X131.666 Y124.411 E.01229
G1 X131.268 Y125 E.01476
G1 X130.729 Y125.555 E.01604
G1 X130.198 Y125.948 E.0137
G1 X129.672 Y126.227 E.01236
G1 X129.007 Y126.468 E.01468
G1 X128.366 Y126.59 E.01352
G3 X126.939 Y126.516 I-.449 J-5.154 E.02974
G1 X126.314 Y126.329 E.01353
G1 X125.724 Y126.051 E.01352
G1 X125.222 Y125.716 E.01254
G1 X124.701 Y125.25 E.0145
G1 X124.29 Y124.744 E.01352
G1 X123.981 Y124.223 E.01257
G1 X123.714 Y123.578 E.01447
G1 X123.549 Y122.842 E.01566
G1 X123.51 Y122.121 E.01498
G1 X123.567 Y121.57 E.01149
G3 X124.295 Y119.751 I4.569 J.774 E.04094
G1 X124.807 Y119.149 E.0164
G1 X125.357 Y118.681 E.01496
G1 X125.914 Y118.347 E.01348
G1 X126.438 Y118.13 E.01176
G1 X127.146 Y117.943 E.01519
G1 X127.793 Y117.883 E.01348
G1 X127.877 Y117.887 E.00175
M204 S250
G1 X127.91 Y118.296 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.343 Y118.323 E.00836
G1 X128.995 Y118.452 E.01282
G1 X129.651 Y118.711 E.0136
G1 X130.161 Y119.017 E.01145
G3 X131.556 Y120.801 I-2.39 J3.305 E.04424
G1 X131.749 Y121.43 E.01267
G1 X131.828 Y122.016 E.0114
G3 X131.301 Y124.227 I-4.061 J.201 E.0444
G1 X130.934 Y124.764 E.01254
G3 X129.485 Y125.863 I-3.285 J-2.824 E.03533
G1 X128.875 Y126.081 E.01246
G1 X128.294 Y126.187 E.01139
G1 X127.778 Y126.196 E.00995
G1 X127.049 Y126.119 E.01414
G1 X126.436 Y125.938 E.01232
G3 X124.98 Y124.95 I1.713 J-4.092 E.03414
G3 X124.095 Y123.429 I3.318 J-2.947 E.03415
G1 X123.957 Y122.82 E.01203
G1 X123.919 Y122.099 E.01392
G3 X124.643 Y119.965 I3.937 J.146 E.04405
G1 X125.114 Y119.419 E.0139
G1 X125.613 Y119 E.01257
G1 X126.121 Y118.7 E.01135
G3 X127.827 Y118.298 I1.771 J3.694 E.03405
G1 X127.85 Y118.298 E.00044
; CHANGE_LAYER
; Z_HEIGHT: 10.52
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F1800
M204 S10000
G1 X128.343 Y118.323 E-.18754
G1 X128.995 Y118.452 E-.25278
G1 X129.651 Y118.711 E-.26807
G1 X129.768 Y118.781 E-.05162
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 127/145
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z10.8 I-.332 J-1.171 P1  F30000
G1 X125.317 Y120.041 Z10.8
G1 Z10.52
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F2732
G1 X125.317 Y124.176 E.16977
G2 X126.097 Y124.913 I2.686 J-2.059 E.04426
G1 X126.212 Y124.985 E.00554
G1 X126.212 Y119.514 E.22464
G3 X127.106 Y119.142 I1.746 J2.935 E.0399
G1 X127.106 Y125.357 E.2552
G1 X127.15 Y125.369 E.00187
G2 X128 Y125.449 I.727 J-3.161 E.03517
G1 X128 Y119.05 E.26276
G3 X128.894 Y119.215 I-.122 J3.169 E.03747
G1 X128.894 Y125.285 E.24926
G2 X129.788 Y124.818 I-1.055 J-3.108 E.04157
G1 X129.788 Y119.683 E.21084
G3 X130.605 Y120.578 I-1.895 J2.551 E.05004
G1 X130.683 Y120.71 E.00628
G1 X130.683 Y124.131 E.14049
; WIPE_START
G1 F4800
G1 X130.683 Y122.131 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.401 Y121.709 Z10.92 F30000
G1 Z10.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.399432
; LAYER_HEIGHT: 0.12
G1 F2732
G1 X133.43 Y122.093 E.00703
; LINE_WIDTH: 0.396482
G1 X133.392 Y122.888 E.01444
; LINE_WIDTH: 0.394392
G1 X133.277 Y123.559 E.01227
; LINE_WIDTH: 0.399392
G3 X132.948 Y124.518 I-5.791 J-1.45 E.01853
; LINE_WIDTH: 0.399152
G1 X132.47 Y125.372 E.01787
G1 X132.168 Y125.78 E.00927
; LINE_WIDTH: 0.401872
G3 X131.357 Y126.577 I-4.607 J-3.879 E.02095
; LINE_WIDTH: 0.396562
G1 X130.661 Y127.058 E.01532
; LINE_WIDTH: 0.397172
G1 X130.211 Y127.292 E.00921
; LINE_WIDTH: 0.399182
G3 X129.137 Y127.659 I-2.331 J-5.068 E.02077
; LINE_WIDTH: 0.396802
G1 X128.298 Y127.791 E.01541
; LINE_WIDTH: 0.400852
G3 X127.287 Y127.776 I-.417 J-5.98 E.01857
; LINE_WIDTH: 0.396662
G1 X126.511 Y127.633 E.01429
; LINE_WIDTH: 0.394352
G1 X125.852 Y127.427 E.01245
; LINE_WIDTH: 0.399332
G3 X124.947 Y126.973 I2.204 J-5.522 E.01852
; LINE_WIDTH: 0.396752
G1 X124.313 Y126.511 E.01423
; LINE_WIDTH: 0.394322
G1 X123.806 Y126.036 E.01251
; LINE_WIDTH: 0.399322
G3 X123.188 Y125.235 I4.377 J-4.016 E.01851
; LINE_WIDTH: 0.396802
G1 X122.818 Y124.546 E.01419
; LINE_WIDTH: 0.394352
G1 X122.566 Y123.896 E.01256
; LINE_WIDTH: 0.399282
G3 X122.357 Y122.904 I5.662 J-1.713 E.01855
; LINE_WIDTH: 0.397162
G1 X122.327 Y121.927 E.01775
; LINE_WIDTH: 0.398132
G1 X122.38 Y121.422 E.00924
; LINE_WIDTH: 0.398912
G3 X122.676 Y120.295 I5.421 J.822 E.0213
; LINE_WIDTH: 0.394932
G1 X122.994 Y119.595 E.01388
; LINE_WIDTH: 0.396642
G1 X123.279 Y119.126 E.00994
; LINE_WIDTH: 0.401372
G3 X123.916 Y118.35 I5.028 J3.482 E.01846
; LINE_WIDTH: 0.398982
G3 X124.817 Y117.613 I3.891 J3.835 E.02127
; LINE_WIDTH: 0.396092
G1 X125.531 Y117.211 E.01486
; LINE_WIDTH: 0.397702
G1 X126 Y117.019 E.00921
; LINE_WIDTH: 0.399032
G3 X127.123 Y116.747 I1.853 J5.199 E.02113
; LINE_WIDTH: 0.396262
G1 X127.95 Y116.693 E.015
; LINE_WIDTH: 0.397532
G1 X128.456 Y116.723 E.00922
; LINE_WIDTH: 0.399072
G3 X129.604 Y116.972 I-.583 J5.458 E.02148
; LINE_WIDTH: 0.394442
G1 X130.354 Y117.275 E.01457
; LINE_WIDTH: 0.399472
G3 X131.214 Y117.807 I-2.711 J5.341 E.01852
; LINE_WIDTH: 0.396312
G1 X131.818 Y118.338 E.01457
; LINE_WIDTH: 0.394412
G1 X132.267 Y118.843 E.01218
; LINE_WIDTH: 0.399442
G3 X132.811 Y119.697 I-4.754 J3.63 E.01851
; LINE_WIDTH: 0.399122
G1 X133.181 Y120.603 E.01787
G1 X133.31 Y121.087 E.00913
; LINE_WIDTH: 0.399432
G3 X133.391 Y121.587 I-5.859 J1.208 E.00927
G1 X133.396 Y121.649 E.00113
G1 X133.798 Y121.676 F30000
; LINE_WIDTH: 0.449992
G1 F2732
G1 X133.827 Y122.099 E.00879
G3 X133.79 Y121.566 I-5.949 J.151 E.76454
G1 X133.793 Y121.616 E.00104
G1 X134.221 Y121.646 F30000
G1 F2732
G1 X134.252 Y122.105 E.00954
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
G3 X134.213 Y121.534 I-6.373 J.145 E.81897
G1 X134.217 Y121.586 E.00108
M204 S250
G1 X134.629 Y121.619 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.661 Y122.111 E.0095
G3 X134.379 Y120.309 I-6.782 J.138 E.78633
G3 X134.616 Y121.504 I-7.273 J2.061 E.02351
G1 X134.622 Y121.56 E.00107
; WIPE_START
M204 S10000
G1 X134.661 Y122.111 E-.21009
G1 X134.64 Y122.778 E-.25334
G1 X134.577 Y123.324 E-.20888
G1 X134.528 Y123.549 E-.0877
; WIPE_END
G1 E-.04
G1 X129.102 Y118.181 Z10.92 F30000
G1 X127.974 Y117.065 Z10.92
G1 Z10.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.396262
G1 F2732
G1 X128.493 Y117.1 E.00942
; LINE_WIDTH: 0.394622
G1 X129.252 Y117.249 E.01396
; LINE_WIDTH: 0.401892
G3 X130.269 Y117.647 I-2.242 J7.232 E.02009
; LINE_WIDTH: 0.393242
G1 X130.792 Y117.962 E.01098
; LINE_WIDTH: 0.397442
G1 X131.35 Y118.401 E.01291
G1 X131.926 Y119.01 E.01523
; LINE_WIDTH: 0.399442
G3 X132.475 Y119.852 I-5.103 J3.926 E.01838
; LINE_WIDTH: 0.396402
G1 X132.7 Y120.347 E.00985
; LINE_WIDTH: 0.394722
G1 X132.93 Y121.086 E.01396
; LINE_WIDTH: 0.399432
G3 X133.059 Y122.087 I-6.266 J1.321 E.01845
; LINE_WIDTH: 0.396482
G1 X133.048 Y122.626 E.00979
; LINE_WIDTH: 0.394762
G1 X132.934 Y123.392 E.01397
; LINE_WIDTH: 0.399392
G3 X132.617 Y124.352 I-6.176 J-1.513 E.01848
; LINE_WIDTH: 0.396552
G1 X132.374 Y124.831 E.00975
; LINE_WIDTH: 0.394812
G1 X131.939 Y125.472 E.01397
; LINE_WIDTH: 0.401872
G3 X131.173 Y126.255 I-5.767 J-4.878 E.02015
; LINE_WIDTH: 0.393302
G1 X130.68 Y126.612 E.01094
; LINE_WIDTH: 0.397172
G1 X130.048 Y126.958 E.01309
G1 X129.272 Y127.245 E.01502
; LINE_WIDTH: 0.399342
G3 X128.273 Y127.421 I-1.587 J-6.082 E.01855
; LINE_WIDTH: 0.396802
G1 X127.606 Y127.428 E.01211
; LINE_WIDTH: 0.397072
G1 X126.865 Y127.336 E.01356
G1 X126.073 Y127.113 E.01493
; LINE_WIDTH: 0.399332
G3 X125.156 Y126.666 I2.266 J-5.811 E.01866
; LINE_WIDTH: 0.396752
G1 X124.721 Y126.368 E.00957
; LINE_WIDTH: 0.394952
G1 X124.143 Y125.852 E.01398
; LINE_WIDTH: 0.399322
G3 X123.509 Y125.049 I4.543 J-4.24 E.0187
; LINE_WIDTH: 0.396802
M73 P87 R2
G1 X123.247 Y124.594 E.00953
; LINE_WIDTH: 0.395042
G1 X122.95 Y123.878 E.01399
; LINE_WIDTH: 0.399282
G3 X122.727 Y122.88 I5.863 J-1.834 E.0187
; LINE_WIDTH: 0.397162
G1 X122.691 Y122.174 E.01282
; LINE_WIDTH: 0.398132
G1 X122.75 Y121.471 E.01285
G1 X122.948 Y120.627 E.01578
; LINE_WIDTH: 0.398742
G3 X123.341 Y119.732 I5.665 J1.952 E.01786
; LINE_WIDTH: 0.397092
G1 X123.61 Y119.296 E.00929
; LINE_WIDTH: 0.398512
G1 X124.189 Y118.604 E.01644
G1 X124.834 Y118.048 E.01552
; LINE_WIDTH: 0.399572
G3 X125.686 Y117.547 I3.794 J5.476 E.01808
; LINE_WIDTH: 0.396092
G1 X126.203 Y117.34 E.01009
; LINE_WIDTH: 0.394542
G1 X126.951 Y117.146 E.01393
; LINE_WIDTH: 0.399482
G3 X127.914 Y117.063 I1.038 J6.451 E.01768
G1 X127.944 Y117.469 F30000
; LINE_WIDTH: 0.449992
G1 F2732
G1 X128.398 Y117.491 E.00943
G1 X129.168 Y117.636 E.01624
G1 X129.956 Y117.935 E.01747
G3 X131.146 Y118.749 I-2.536 J4.987 E.02999
G1 X131.63 Y119.274 E.01483
G1 X132.031 Y119.866 E.01483
G1 X132.314 Y120.456 E.01356
G1 X132.549 Y121.196 E.0161
G1 X132.654 Y121.904 E.01485
G1 X132.653 Y122.56 E.0136
G1 X132.544 Y123.326 E.01606
G1 X132.332 Y124.009 E.01482
G1 X132.045 Y124.602 E.01367
G1 X131.616 Y125.243 E.016
G3 X130.294 Y126.384 I-4.245 J-3.583 E.03636
G3 X128.268 Y127.023 I-2.56 J-4.58 E.04438
G1 X127.601 Y127.032 E.01384
G3 X125.38 Y126.338 I.39 J-5.146 E.04868
G3 X123.854 Y124.851 I2.781 J-4.382 E.04452
G3 X123.125 Y122.858 I4.411 J-2.743 E.04432
G1 X123.086 Y122.153 E.01465
G1 X123.145 Y121.517 E.01326
G1 X123.331 Y120.731 E.01675
G1 X123.586 Y120.114 E.01385
G1 X123.933 Y119.529 E.0141
G1 X124.489 Y118.867 E.01792
G1 X125.083 Y118.356 E.01627
G1 X125.693 Y117.984 E.0148
G1 X126.281 Y117.736 E.01324
G1 X127.043 Y117.531 E.01636
G1 X127.752 Y117.46 E.01479
G1 X127.884 Y117.466 E.00275
G1 X127.923 Y117.89 F30000
G1 F2732
G1 X128.371 Y117.914 E.00931
G1 X129.078 Y118.051 E.01493
G1 X129.799 Y118.329 E.01603
G1 X130.368 Y118.664 E.0137
G1 X130.825 Y119.034 E.0122
G1 X131.314 Y119.557 E.01485
G1 X131.676 Y120.099 E.01352
G1 X131.929 Y120.633 E.01225
G1 X132.141 Y121.313 E.01479
G1 X132.233 Y121.959 E.01354
G1 X132.229 Y122.552 E.01229
G1 X132.125 Y123.255 E.01475
G1 X131.929 Y123.876 E.01351
G1 X131.666 Y124.412 E.01236
G1 X131.27 Y124.998 E.01469
G1 X130.732 Y125.553 E.01604
G1 X130.2 Y125.947 E.01373
G1 X129.671 Y126.228 E.01242
G1 X129.009 Y126.468 E.01462
G1 X128.368 Y126.59 E.01352
G3 X126.94 Y126.516 I-.451 J-5.16 E.02975
G1 X126.316 Y126.33 E.01352
G1 X125.726 Y126.052 E.01352
G1 X125.222 Y125.716 E.01256
G1 X124.702 Y125.251 E.01448
G1 X124.29 Y124.745 E.01353
G1 X123.98 Y124.22 E.01264
G1 X123.714 Y123.579 E.01441
G1 X123.563 Y122.945 E.01352
G3 X123.513 Y122.028 I11.089 J-1.06 E.01905
G1 X123.578 Y121.471 E.01162
G3 X124.294 Y119.752 I4.718 J.958 E.03889
G1 X124.807 Y119.148 E.01643
G1 X125.35 Y118.686 E.01479
G1 X125.908 Y118.35 E.0135
G1 X126.439 Y118.129 E.01193
G1 X127.141 Y117.944 E.01505
G1 X127.788 Y117.883 E.01348
G1 X127.863 Y117.887 E.00156
M204 S250
G1 X127.896 Y118.295 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.344 Y118.323 E.00866
G1 X128.99 Y118.451 E.0127
G1 X129.647 Y118.709 E.01361
G1 X130.157 Y119.014 E.01144
G3 X131.557 Y120.803 I-2.373 J3.299 E.04438
G1 X131.748 Y121.426 E.01257
G1 X131.827 Y122.013 E.01141
G3 X131.301 Y124.227 I-4.049 J.207 E.04447
G1 X130.936 Y124.761 E.01247
G3 X129.484 Y125.864 I-3.289 J-2.825 E.03541
G1 X128.877 Y126.08 E.01241
G1 X128.296 Y126.187 E.01139
G1 X127.776 Y126.196 E.01002
G1 X127.05 Y126.119 E.01408
G1 X126.437 Y125.939 E.01232
G3 X124.98 Y124.951 I1.712 J-4.094 E.03415
G3 X124.095 Y123.429 I3.318 J-2.947 E.03416
G1 X123.962 Y122.854 E.01139
G1 X123.931 Y122.333 E.01006
G3 X124.643 Y119.966 I3.822 J-.141 E.04851
G1 X125.115 Y119.418 E.01394
G1 X125.608 Y119.004 E.01242
G1 X126.115 Y118.703 E.01137
G3 X127.822 Y118.298 I1.775 J3.678 E.03408
G1 X127.836 Y118.297 E.00026
; CHANGE_LAYER
; Z_HEIGHT: 10.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.344 Y118.323 E-.1934
G1 X128.99 Y118.451 E-.25032
G1 X129.647 Y118.709 E-.26827
G1 X129.756 Y118.774 E-.04801
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 128/145
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z10.92 I-.719 J.982 P1  F30000
G1 X133.716 Y121.675 Z10.92
G1 Z10.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1881
G1 X133.738 Y121.893 E.00455
G3 X132.163 Y126.264 I-5.923 J.336 E.09903
G1 X131.565 Y126.815 E.01686
G3 X127.286 Y128.09 I-3.684 J-4.543 E.09502
G1 X126.42 Y127.941 E.01825
G3 X124.037 Y126.696 I1.554 J-5.877 E.05623
G3 X122.757 Y125.135 I4.738 J-5.187 E.04201
G3 X122.375 Y120.203 I5.153 J-2.881 E.10588
G3 X129.879 Y116.728 I5.509 J2.055 E.19027
G1 X130.629 Y117.067 E.01706
G3 X133.078 Y119.532 I-2.704 J5.135 E.0732
G1 X133.427 Y120.329 E.01804
G3 X133.679 Y121.377 I-6.218 J2.052 E.02238
G1 X133.708 Y121.615 E.00498
G1 X134.137 Y121.631 F30000
G1 F1881
G1 X134.162 Y121.885 E.0053
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
G3 X133.849 Y120.254 I-6.284 J.362 E.7858
G3 X134.104 Y121.356 I-6.828 J2.158 E.0235
G1 X134.13 Y121.572 E.0045
M204 S250
G1 X134.544 Y121.591 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.572 Y121.878 E.00555
G3 X133.433 Y118.496 I-6.692 J.37 E.74214
G3 X134.514 Y121.312 I-5.667 J3.791 E.05863
G1 X134.537 Y121.532 E.00425
; WIPE_START
M204 S10000
G1 X134.572 Y121.878 E-.13219
G1 X134.577 Y122.515 E-.24223
G1 X134.523 Y123.14 E-.23846
G1 X134.452 Y123.521 E-.14713
; WIPE_END
G1 E-.04
G1 X128.857 Y118.33 Z11.04 F30000
G1 X127.928 Y117.468 Z11.04
G1 Z10.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1881
G1 X128.266 Y117.482 E.007
G3 X129.162 Y117.635 I-.49 J5.574 E.01889
G1 X129.889 Y117.908 E.01611
G1 X130.584 Y118.298 E.01652
G1 X131.142 Y118.745 E.01482
G1 X131.59 Y119.229 E.01368
G1 X132.029 Y119.863 E.016
G3 X132.548 Y121.192 I-4.938 J2.692 E.02968
G1 X132.653 Y121.9 E.01484
G1 X132.652 Y122.616 E.01484
G1 X132.554 Y123.264 E.0136
G1 X132.333 Y124.006 E.01606
G3 X131.618 Y125.241 I-5.193 J-2.182 E.02968
G1 X131.037 Y125.848 E.01743
G1 X130.451 Y126.289 E.01521
G3 X129.147 Y126.869 I-2.898 J-4.764 E.02967
G1 X128.445 Y127.007 E.01484
G1 X127.602 Y127.032 E.01749
G3 X123.914 Y124.949 I.326 J-4.884 E.09086
G3 X123.345 Y123.8 I3.906 J-2.648 E.02668
G1 X123.149 Y123.039 E.0163
G1 X123.107 Y122.537 E.01044
G3 X123.306 Y120.823 I4.31 J-.368 E.03604
G1 X123.586 Y120.113 E.01584
G1 X123.949 Y119.503 E.01474
G3 X125.077 Y118.361 I4.619 J3.432 E.0334
G1 X125.686 Y117.988 E.01481
G1 X126.344 Y117.71 E.01483
G1 X126.968 Y117.549 E.01335
G1 X127.746 Y117.46 E.01625
G1 X127.869 Y117.465 E.00254
G1 X127.908 Y117.89 F30000
G1 F1881
G1 X128.434 Y117.918 E.01093
G1 X129.038 Y118.042 E.01279
G1 X129.733 Y118.303 E.01539
G1 X130.365 Y118.661 E.01508
G1 X130.871 Y119.072 E.01351
G1 X131.274 Y119.512 E.01237
G1 X131.675 Y120.095 E.01469
G1 X131.953 Y120.685 E.01353
G1 X132.117 Y121.228 E.01176
G1 X132.233 Y121.956 E.01529
G1 X132.228 Y122.608 E.01353
G1 X132.136 Y123.193 E.01229
G1 X131.929 Y123.874 E.01475
G1 X131.642 Y124.46 E.01353
G1 X131.318 Y124.929 E.01184
G1 X130.735 Y125.55 E.01767
G1 X130.202 Y125.946 E.01376
G1 X129.626 Y126.251 E.01352
G1 X129.059 Y126.451 E.01248
G1 X128.37 Y126.589 E.01457
G1 X127.597 Y126.608 E.01604
G1 X126.942 Y126.517 E.01372
G1 X126.389 Y126.352 E.01196
G1 X125.727 Y126.053 E.01508
G1 X125.184 Y125.69 E.01354
G3 X124.264 Y124.71 I3.554 J-4.257 E.02796
G3 X123.74 Y123.645 I3.496 J-2.381 E.0247
G1 X123.563 Y122.945 E.01498
G1 X123.51 Y122.14 E.01674
G1 X123.576 Y121.481 E.01374
G1 X123.716 Y120.933 E.01172
G1 X123.976 Y120.281 E.01457
G1 X124.311 Y119.725 E.01346
G3 X125.344 Y118.69 I4.209 J3.168 E.03044
G1 X125.902 Y118.353 E.0135
G1 X126.503 Y118.103 E.01352
G1 X127.066 Y117.962 E.01204
G1 X127.782 Y117.883 E.01494
G1 X127.848 Y117.886 E.00136
M204 S250
G1 X127.882 Y118.295 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.407 Y118.332 E.01015
G3 X128.952 Y118.442 I-.534 J4.051 E.01071
G1 X129.582 Y118.683 E.01301
G1 X130.154 Y119.012 E.01272
G1 X130.61 Y119.387 E.01138
G3 X131.724 Y121.342 I-2.812 J2.896 E.04394
G1 X131.827 Y122.01 E.01303
G1 X131.819 Y122.601 E.0114
G3 X130.984 Y124.693 I-4.025 J-.393 E.044
G1 X130.444 Y125.262 E.01512
G3 X128.927 Y126.063 I-2.763 J-3.393 E.03329
G1 X128.298 Y126.187 E.01236
G3 X126.51 Y125.962 I-.367 J-4.299 E.03498
G1 X125.905 Y125.684 E.01283
G1 X125.415 Y125.352 E.0114
G3 X124.602 Y124.479 I3.373 J-3.956 E.02305
G3 X124.121 Y123.496 I3.098 J-2.124 E.02117
G1 X123.962 Y122.854 E.01275
G1 X123.918 Y122.117 E.01423
G3 X124.352 Y120.443 I4.435 J.255 E.03355
G1 X124.659 Y119.94 E.01136
G3 X126.657 Y118.482 I3.344 J2.486 E.04839
G3 X127.817 Y118.297 I1.217 J3.901 E.02274
G1 X127.822 Y118.297 E.00009
; WIPE_START
M204 S10000
G1 X128.407 Y118.332 E-.22275
G1 X128.952 Y118.442 E-.21098
G1 X129.582 Y118.683 E-.25645
G1 X129.741 Y118.775 E-.06981
; WIPE_END
G1 E-.04
G1 X133.179 Y121.761 Z11.04 F30000
G1 Z10.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.683072
G1 F1881
G1 X133.197 Y121.902 E.00459
G1 X133.202 Y122.063 E.00517
; LINE_WIDTH: 0.683452
G1 X133.171 Y122.859 E.0256
; LINE_WIDTH: 0.688832
G1 X133.09 Y123.355 E.01628
; LINE_WIDTH: 0.692712
G3 X132.756 Y124.391 I-5.561 J-1.221 E.03557
; LINE_WIDTH: 0.681272
G1 X132.458 Y124.974 E.02098
; LINE_WIDTH: 0.689392
G1 X132.109 Y125.489 E.02019
; LINE_WIDTH: 0.695132
G3 X131.422 Y126.23 I-4.857 J-3.808 E.03311
; LINE_WIDTH: 0.692592
G3 X130.568 Y126.85 I-3.815 J-4.357 E.03447
; LINE_WIDTH: 0.686012
G1 X129.849 Y127.203 E.02587
G1 X129.094 Y127.438 E.02552
; LINE_WIDTH: 0.681832
G1 X128.494 Y127.546 E.01954
; LINE_WIDTH: 0.697632
G3 X127.352 Y127.554 I-.616 J-6.349 E.03757
; LINE_WIDTH: 0.681352
G1 X126.704 Y127.451 E.02103
; LINE_WIDTH: 0.689172
G1 X126.103 Y127.277 E.02031
; LINE_WIDTH: 0.692792
G3 X125.105 Y126.803 I1.872 J-5.228 E.03608
; LINE_WIDTH: 0.683012
G1 X124.457 Y126.341 E.0256
; LINE_WIDTH: 0.688412
G1 X124.08 Y125.994 E.0166
; LINE_WIDTH: 0.692812
G3 X123.404 Y125.152 I4.164 J-4.036 E.03524
; LINE_WIDTH: 0.682292
G1 X123.083 Y124.586 E.02089
; LINE_WIDTH: 0.688992
G1 X122.839 Y123.998 E.02064
; LINE_WIDTH: 0.692632
G3 X122.585 Y122.897 I5.255 J-1.794 E.03692
; LINE_WIDTH: 0.684112
G1 X122.543 Y122.118 E.02511
; LINE_WIDTH: 0.693392
G3 X122.666 Y121.114 I6.296 J.258 E.03305
; LINE_WIDTH: 0.687412
G1 X122.882 Y120.386 E.02455
; LINE_WIDTH: 0.681412
G1 X123.109 Y119.858 E.01843
; LINE_WIDTH: 0.692792
G3 X123.66 Y118.986 I5.312 J2.745 E.0337
; LINE_WIDTH: 0.689412
G1 X124.187 Y118.4 E.02558
; LINE_WIDTH: 0.690232
G1 X124.655 Y118.002 E.01997
; LINE_WIDTH: 0.692512
G3 X125.622 Y117.42 I3.274 J4.343 E.03684
; LINE_WIDTH: 0.680492
G1 X126.228 Y117.179 E.02087
; LINE_WIDTH: 0.689352
G1 X126.841 Y117.02 E.02057
; LINE_WIDTH: 0.692632
G3 X127.935 Y116.92 I1.058 J5.537 E.03585
; LINE_WIDTH: 0.686912
G1 X128.745 Y116.989 E.0263
G1 X129.524 Y117.181 E.02593
; LINE_WIDTH: 0.690972
G1 X130.09 Y117.402 E.01977
; LINE_WIDTH: 0.692372
G3 X131.054 Y117.971 I-2.306 J5.01 E.03654
; LINE_WIDTH: 0.685592
M73 P88 R2
G1 X131.657 Y118.49 E.02566
; LINE_WIDTH: 0.691652
G1 X132.262 Y119.224 E.03098
G1 X132.594 Y119.772 E.02086
; LINE_WIDTH: 0.687492
G1 X132.921 Y120.526 E.02659
G1 X133.114 Y121.272 E.02493
; LINE_WIDTH: 0.683072
G1 X133.171 Y121.701 E.01391
; CHANGE_LAYER
; Z_HEIGHT: 10.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X133.197 Y121.902 E-.07707
G1 X133.202 Y122.063 E-.06116
G1 X133.171 Y122.859 E-.30256
G1 X133.09 Y123.355 E-.19079
G1 X133.003 Y123.681 E-.12843
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/145
; update layer progress
M73 L129
M991 S0 P128 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z11.04 I1.169 J.338 P1  F30000
G1 X133.592 Y121.647 Z11.04
G1 Z10.76
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F1836
G1 X133.626 Y122.1 E.00943
G3 X133.415 Y123.804 I-6.733 J.029 E.03571
G1 X133.065 Y124.738 E.02068
G3 X128.117 Y127.999 I-5.217 J-2.532 E.12901
G1 X127.112 Y127.954 E.02086
G3 X124.824 Y127.128 I.847 J-5.925 E.05082
G1 X124.032 Y126.533 E.02054
G3 X122.133 Y121.883 I3.912 J-4.31 E.10773
G1 X122.251 Y121.06 E.01725
G1 X122.485 Y120.233 E.01783
G3 X123.342 Y118.706 I5.972 J2.351 E.03644
G1 X124.016 Y117.979 E.02055
G3 X126.248 Y116.736 I3.975 J4.508 E.05339
G1 X127.092 Y116.548 E.01795
G3 X131.955 Y118.199 I.759 J5.751 E.11036
G1 X132.538 Y118.879 E.01857
G1 X132.968 Y119.582 E.01709
G1 X133.318 Y120.38 E.01807
G3 X133.573 Y121.514 I-6.459 J2.045 E.02414
G1 X133.583 Y121.588 E.00155
G1 X134.014 Y121.614 F30000
G1 F1836
G1 X134.05 Y122.113 E.01038
G3 X132.55 Y118.212 I-6.174 J.135 E.71634
G3 X134.002 Y121.479 I-4.737 J4.061 E.07521
G1 X134.009 Y121.554 E.00157
M204 S250
G1 X134.422 Y121.585 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.46 Y122.125 E.01044
G1 X134.429 Y122.908 E.0151
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
G3 X121.306 Y121.783 I-6.553 J-.663 E.39496
G1 X121.439 Y120.869 E.01782
G3 X125.173 Y116.244 I6.426 J1.368 E.11888
G1 X126.031 Y115.931 E.01762
G3 X127.845 Y115.662 I1.911 J6.653 E.03543
G3 X129.929 Y115.996 I-.1 J7.297 E.04083
G3 X133.241 Y118.43 I-2.111 J6.342 E.08052
G1 X133.716 Y119.214 E.01767
G3 X134.332 Y120.946 I-6.162 J3.168 E.03555
G3 X134.412 Y121.445 I-6.514 J1.3 E.00973
G1 X134.418 Y121.525 E.00155
; WIPE_START
M204 S10000
G1 X134.46 Y122.125 E-.22866
G1 X134.429 Y122.908 E-.2976
G1 X134.359 Y123.408 E-.19182
G1 X134.334 Y123.515 E-.04193
; WIPE_END
G1 E-.04
G1 X128.778 Y118.282 Z11.16 F30000
G1 X127.915 Y117.468 Z11.16
G1 Z10.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1836
G1 X128.43 Y117.491 E.0107
G1 X129.154 Y117.633 E.01531
G3 X130.58 Y118.295 I-1.714 J5.554 E.03271
G1 X131.138 Y118.742 E.01483
G1 X131.528 Y119.159 E.01183
G1 X132.027 Y119.859 E.01785
G1 X132.276 Y120.373 E.01183
G1 X132.547 Y121.188 E.01781
G3 X131.037 Y125.848 I-4.726 J1.044 E.10655
G1 X130.454 Y126.288 E.01515
G1 X129.823 Y126.627 E.01485
G1 X129.149 Y126.868 E.01484
G1 X128.447 Y127.007 E.01484
G1 X127.604 Y127.032 E.01749
G1 X126.88 Y126.936 E.01515
G1 X126.677 Y126.886 E.00433
G1 X126.193 Y126.736 E.01052
G1 X125.543 Y126.435 E.01484
G1 X124.946 Y126.041 E.01485
G1 X124.414 Y125.563 E.01484
G1 X124.031 Y125.101 E.01246
G1 X123.592 Y124.396 E.01721
G1 X123.362 Y123.842 E.01246
G1 X123.149 Y123.039 E.01721
G1 X123.101 Y122.449 E.01229
G3 X123.283 Y120.906 I4.633 J-.236 E.03238
G1 X123.586 Y120.113 E.01761
G1 X123.951 Y119.501 E.01477
G1 X124.426 Y118.937 E.0153
G3 X125.079 Y118.358 I2.795 J2.497 E.01813
G1 X125.679 Y117.991 E.0146
G1 X126.338 Y117.712 E.01483
G1 X126.883 Y117.569 E.0117
G1 X127.741 Y117.46 E.01792
G1 X127.855 Y117.465 E.00237
G1 X127.895 Y117.889 F30000
G1 F1836
G1 X128.405 Y117.914 E.01058
G1 X129.066 Y118.048 E.014
G1 X129.79 Y118.325 E.01608
G1 X130.317 Y118.632 E.01264
G1 X130.868 Y119.069 E.01459
G1 X131.212 Y119.442 E.01052
G1 X131.673 Y120.092 E.01654
G1 X131.891 Y120.55 E.01052
G1 X132.14 Y121.306 E.0165
G1 X132.233 Y121.952 E.01354
G1 X132.228 Y122.604 E.01353
G1 X132.127 Y123.249 E.01354
G1 X131.931 Y123.871 E.01352
G1 X131.644 Y124.457 E.01353
G1 X131.343 Y124.894 E.01101
G1 X130.735 Y125.55 E.01855
G1 X130.205 Y125.944 E.01371
G1 X129.628 Y126.25 E.01354
G1 X129.013 Y126.467 E.01353
G1 X128.372 Y126.589 E.01353
G1 X127.598 Y126.608 E.01605
G1 X126.944 Y126.517 E.01371
G1 X126.803 Y126.48 E.00302
G1 X126.318 Y126.331 E.01052
G1 X125.728 Y126.053 E.01353
G1 X125.185 Y125.691 E.01353
G1 X124.703 Y125.252 E.01353
G1 X124.363 Y124.836 E.01115
G1 X123.959 Y124.184 E.0159
G1 X123.757 Y123.687 E.01115
G1 X123.563 Y122.945 E.0159
G1 X123.525 Y122.425 E.01082
G3 X123.976 Y120.28 I4.22 J-.232 E.04598
G1 X124.312 Y119.723 E.01349
G1 X124.745 Y119.216 E.01383
G1 X125.338 Y118.694 E.01639
G1 X125.896 Y118.356 E.01352
G1 X126.497 Y118.105 E.01352
G1 X126.983 Y117.981 E.01039
G1 X127.777 Y117.883 E.01661
G1 X127.835 Y117.886 E.0012
M204 S250
G1 X127.871 Y118.294 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.38 Y118.323 E.00983
G3 X128.981 Y118.448 I-.505 J3.927 E.01185
G1 X129.64 Y118.706 E.01363
G3 X130.939 Y124.758 I-1.795 J3.551 E.1367
G3 X128.299 Y126.186 I-3.137 J-2.643 E.05923
G1 X127.593 Y126.199 E.01362
G1 X126.924 Y126.09 E.01307
G3 X123.962 Y122.854 I.945 J-3.838 E.08962
G1 X123.918 Y122.126 E.01406
G3 X124.66 Y119.938 I3.952 J.121 E.04519
G1 X125.053 Y119.486 E.01154
G1 X125.597 Y119.011 E.01392
G3 X127.811 Y118.291 I2.278 J3.238 E.04555
; WIPE_START
M204 S10000
G1 X128.38 Y118.323 E-.21662
G1 X128.981 Y118.448 E-.23334
G1 X129.64 Y118.706 E-.26869
G1 X129.733 Y118.761 E-.04135
; WIPE_END
G1 E-.04
G1 X133.11 Y121.696 Z11.16 F30000
G1 Z10.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.572952
G1 F1836
G1 X133.144 Y122.086 E.01046
; LINE_WIDTH: 0.566652
G1 X133.132 Y122.62 E.01412
; LINE_WIDTH: 0.572972
G3 X132.957 Y123.652 I-5.665 J-.429 E.02806
; LINE_WIDTH: 0.567292
G1 X132.705 Y124.361 E.01991
; LINE_WIDTH: 0.562032
G1 X132.418 Y124.919 E.01644
; LINE_WIDTH: 0.570512
G1 X132.086 Y125.418 E.01599
; LINE_WIDTH: 0.574532
G3 X131.378 Y126.185 I-4.443 J-3.393 E.02804
; LINE_WIDTH: 0.572912
G3 X130.516 Y126.812 I-3.668 J-4.137 E.02855
; LINE_WIDTH: 0.566812
G1 X130.043 Y127.053 E.01404
; LINE_WIDTH: 0.572912
G3 X129.048 Y127.389 I-2.302 J-5.167 E.02814
; LINE_WIDTH: 0.567472
G1 X128.533 Y127.48 E.01387
; LINE_WIDTH: 0.575312
G1 X128.12 Y127.512 E.01112
G1 X127.363 Y127.496 E.02034
; LINE_WIDTH: 0.562012
G1 X126.743 Y127.396 E.01647
; LINE_WIDTH: 0.570432
G1 X126.163 Y127.234 E.01605
; LINE_WIDTH: 0.571952
G3 X125.099 Y126.73 I1.819 J-5.223 E.03149
; LINE_WIDTH: 0.567532
G1 X124.499 Y126.297 E.0196
; LINE_WIDTH: 0.562012
G1 X124.042 Y125.865 E.01648
; LINE_WIDTH: 0.570332
G1 X123.652 Y125.402 E.01612
; LINE_WIDTH: 0.571992
G3 X123.054 Y124.38 I4.45 J-3.292 E.03169
; LINE_WIDTH: 0.568512
G1 X122.807 Y123.693 E.01936
; LINE_WIDTH: 0.558992
G1 X122.671 Y123.079 E.0164
; LINE_WIDTH: 0.578232
G3 X122.612 Y121.941 I6.152 J-.892 E.03085
; LINE_WIDTH: 0.565872
G1 X122.717 Y121.17 E.02055
; LINE_WIDTH: 0.566612
G1 X122.936 Y120.405 E.02103
; LINE_WIDTH: 0.572492
G1 X123.344 Y119.56 E.0251
G1 X123.709 Y119.021 E.01739
; LINE_WIDTH: 0.568772
G1 X124.336 Y118.341 E.02454
; LINE_WIDTH: 0.566292
G1 X124.767 Y117.994 E.01464
; LINE_WIDTH: 0.573012
G3 X125.653 Y117.469 I3.36 J4.662 E.02759
; LINE_WIDTH: 0.566312
G1 X126.372 Y117.199 E.0203
; LINE_WIDTH: 0.566472
G1 X127.152 Y117.027 E.02112
G1 X127.699 Y116.983 E.0145
; LINE_WIDTH: 0.572172
G3 X128.733 Y117.049 I.166 J5.523 E.02771
; LINE_WIDTH: 0.568112
G1 X129.36 Y117.189 E.01704
; LINE_WIDTH: 0.577292
G3 X130.345 Y117.595 I-1.958 J6.147 E.02876
; LINE_WIDTH: 0.567772
G1 X130.784 Y117.854 E.01352
; LINE_WIDTH: 0.572892
G3 X131.607 Y118.528 I-3.154 J4.685 E.02848
; LINE_WIDTH: 0.566632
G1 X132.131 Y119.139 E.02129
G1 X132.538 Y119.794 E.02038
G1 X132.859 Y120.532 E.02129
G1 X133.007 Y121.054 E.01436
; LINE_WIDTH: 0.572952
G3 X133.097 Y121.552 I-5.548 J1.261 E.01355
G1 X133.105 Y121.637 E.00226
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F3600
G1 X133.144 Y122.086 E-.17135
G1 X133.132 Y122.62 E-.20287
G1 X133.071 Y123.123 E-.1926
G1 X132.964 Y123.62 E-.19319
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/145
; update layer progress
M73 L130
M991 S0 P129 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z11.16 I-.266 J-1.188 P1  F30000
G1 X130.683 Y124.131 Z11.16
G1 Z10.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F2320
G1 X130.683 Y120.71 E.14047
G1 X130.615 Y120.594 E.00549
G2 X129.788 Y119.683 I-2.766 J1.679 E.05082
G1 X129.788 Y124.818 E.21082
G3 X128.894 Y125.285 I-1.929 J-2.6 E.0416
G1 X128.894 Y119.215 E.24926
G2 X128 Y119.05 I-1.037 J3.118 E.03746
G1 X128 Y125.449 E.26277
G3 X127.562 Y125.436 I-.077 J-4.548 E.01798
G1 X127.521 Y125.431 E.0017
G3 X127.106 Y125.357 I.558 J-4.338 E.01733
G1 X127.106 Y119.142 E.25521
G2 X126.212 Y119.514 I.871 J3.355 E.0399
G1 X126.195 Y124.975 E.22423
G3 X125.317 Y124.176 I1.743 J-2.796 E.04902
G1 X125.317 Y120.041 E.16978
; WIPE_START
G1 F4800
G1 X125.317 Y122.041 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.217 J0 P1  F30000
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
; CHANGE_LAYER
; Z_HEIGHT: 10.88
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 131/145
; update layer progress
M73 L131
M991 S0 P130 ;notify layer change
; OBJECT_ID: 15
G1 X133.473 Y121.683
G1 Z10.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
; LAYER_HEIGHT: 0.12
G1 F2320
G1 X133.492 Y121.821 E.00291
G1 X133.492 Y121.825 E.00008
G3 X133.309 Y123.709 I-5.968 J.37 E.03941
G1 X133.039 Y124.487 E.01709
G3 X132.033 Y126.049 I-5.522 J-2.451 E.03869
G1 X131.407 Y126.626 E.01766
G3 X126.501 Y127.706 I-3.535 J-4.375 E.10803
G1 X125.718 Y127.448 E.0171
G3 X123.155 Y125.308 I2.208 J-5.249 E.07029
G3 X122.456 Y123.779 I4.906 J-3.168 E.035
G1 X122.292 Y122.946 E.01761
G1 X122.242 Y122.171 E.01611
G3 X122.939 Y119.539 I5.984 J.177 E.05698
G1 X123.407 Y118.831 E.01761
G1 X123.917 Y118.241 E.01617
G3 X125.479 Y117.159 I4.145 J4.314 E.03959
G1 X126.248 Y116.862 E.0171
G3 X127.918 Y116.637 I1.506 J4.877 E.03512
G3 X129.74 Y116.933 I-.007 J5.796 E.03846
G1 X130.498 Y117.271 E.01721
G3 X133.407 Y121.189 I-2.616 J4.982 E.10469
G1 X133.465 Y121.623 E.00909
G1 X133.894 Y121.613 F30000
G1 F2320
G1 X133.916 Y121.811 E.00413
G3 X131.846 Y126.826 I-6.108 J.413 E.11661
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
G1 X131.211 Y127.309 E.01654
G3 X122.91 Y125.722 I-3.331 J-5.083 E.19384
G1 X122.495 Y125.038 E.0166
G3 X127.413 Y116.208 I5.392 J-2.782 E.24777
G1 X128.446 Y116.218 E.02144
G1 X129.227 Y116.343 E.01638
G3 X132.734 Y118.63 I-1.431 J6.027 E.0886
G1 X133.169 Y119.302 E.0166
G1 X133.454 Y119.885 E.01347
G1 X133.717 Y120.641 E.0166
G3 X133.857 Y121.282 I-5.642 J1.563 E.01362
G1 X133.887 Y121.553 E.00565
M204 S250
G1 X134.3 Y121.567 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.326 Y121.8 E.00452
G3 X132.113 Y127.137 I-6.52 J.424 E.11534
G1 X131.438 Y127.65 E.01634
G3 X122.572 Y125.955 I-3.559 J-5.42 E.19245
G1 X122.132 Y125.229 E.01637
G3 X127.388 Y115.798 I5.748 J-2.976 E.2461
G1 X128.481 Y115.809 E.02106
G1 X129.316 Y115.942 E.01629
G3 X133.064 Y118.387 I-1.527 J6.438 E.088
G1 X133.526 Y119.1 E.01637
G3 X134.26 Y121.274 I-6.196 J3.303 E.04444
G1 X134.292 Y121.508 E.00454
; WIPE_START
M204 S10000
G1 X134.326 Y121.8 E-.11196
G1 X134.342 Y122.443 E-.24427
G1 X134.282 Y123.143 E-.26692
G1 X134.218 Y123.497 E-.13685
; WIPE_END
G1 E-.04
G1 X128.696 Y118.228 Z11.28 F30000
G1 X127.9 Y117.468 Z11.28
G1 Z10.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F2320
G1 X128.349 Y117.49 E.00932
G3 X129.942 Y117.928 I-.465 J4.808 E.03444
G1 X130.576 Y118.292 E.01516
G3 X131.621 Y125.236 I-2.725 J3.961 E.1633
G1 X131.039 Y125.846 E.01749
G3 X129.684 Y126.686 I-3.71 J-4.472 E.03318
G3 X127.289 Y126.998 I-1.83 J-4.702 E.05058
G3 X123.953 Y125.003 I.626 J-4.833 E.08294
G3 X123.149 Y123.04 I4.038 J-2.799 E.04435
G1 X123.086 Y122.183 E.01782
G3 X123.952 Y119.499 I5.066 J.154 E.05929
G1 X124.506 Y118.844 E.01778
G3 X127.735 Y117.47 I3.377 J3.454 E.07449
G1 X127.84 Y117.469 E.00219
G1 X127.881 Y117.889 F30000
G1 F2320
G1 X128.323 Y117.91 E.00918
G3 X132.229 Y122.601 I-.466 J4.36 E.14003
G1 X132.128 Y123.243 E.01347
G1 X131.932 Y123.868 E.0136
G1 X131.646 Y124.453 E.01349
M73 P89 R2
G1 X131.275 Y124.992 E.01358
G1 X130.737 Y125.548 E.01605
G3 X126.32 Y126.331 I-2.875 J-3.369 E.09758
G1 X125.729 Y126.054 E.01354
G1 X125.186 Y125.692 E.01353
G1 X124.703 Y125.253 E.01354
G1 X124.287 Y124.742 E.01366
G1 X123.979 Y124.22 E.01257
G1 X123.715 Y123.58 E.01436
G1 X123.574 Y122.992 E.01254
G1 X123.509 Y122.159 E.01733
G1 X123.572 Y121.5 E.01373
G1 X123.715 Y120.93 E.01219
G1 X123.977 Y120.28 E.01453
G1 X124.29 Y119.759 E.01261
G1 X124.825 Y119.124 E.01723
G1 X125.333 Y118.698 E.01373
G1 X125.882 Y118.364 E.01333
G1 X126.491 Y118.107 E.01372
G1 X127.115 Y117.949 E.01335
G1 X127.772 Y117.883 E.01369
G1 X127.821 Y117.886 E.00102
M204 S250
G1 X127.856 Y118.294 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X128.398 Y118.33 E.01047
G3 X128.978 Y118.447 I-.503 J4 E.01141
G1 X129.506 Y118.652 E.01092
G1 X130.147 Y119.007 E.01413
G3 X130.94 Y124.756 I-2.307 J3.247 E.12531
G3 X129.442 Y125.886 I-3.327 J-2.853 E.03645
G1 X128.931 Y126.062 E.01042
G1 X128.301 Y126.186 E.01238
G1 X127.779 Y126.196 E.01006
G1 X127.007 Y126.113 E.01498
G3 X124.611 Y124.491 I.961 J-4.001 E.05697
G1 X124.61 Y124.49 E.00004
G3 X124.096 Y123.43 I3.502 J-2.355 E.02278
G1 X123.973 Y122.901 E.01048
G1 X123.918 Y122.135 E.01479
G3 X124.353 Y120.441 I4.431 J.235 E.03394
G1 X124.638 Y119.974 E.01055
G1 X125.133 Y119.393 E.0147
G3 X127.797 Y118.3 I2.762 J2.937 E.05674
; WIPE_START
M204 S10000
G1 X128.398 Y118.33 E-.22886
G1 X128.978 Y118.447 E-.22477
G1 X129.506 Y118.652 E-.21521
G1 X129.716 Y118.768 E-.09116
; WIPE_END
G1 E-.04
G1 X133.057 Y121.739 Z11.28 F30000
G1 Z10.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.445432
G1 F2320
G1 X133.071 Y121.832 E.00193
G1 X133.071 Y121.836 E.00008
; LINE_WIDTH: 0.452332
G3 X133.033 Y122.977 I-5.548 J.389 E.02384
; LINE_WIDTH: 0.451072
G1 X132.907 Y123.595 E.01313
; LINE_WIDTH: 0.439152
G1 X132.651 Y124.33 E.01572
; LINE_WIDTH: 0.445072
G1 X132.402 Y124.834 E.01153
; LINE_WIDTH: 0.452352
G3 X131.736 Y125.745 I-4.721 J-2.749 E.02358
; LINE_WIDTH: 0.451812
G1 X131.155 Y126.294 E.01665
; LINE_WIDTH: 0.437352
G1 X130.516 Y126.739 E.01566
; LINE_WIDTH: 0.442152
G1 X129.819 Y127.084 E.01584
G1 X129.076 Y127.318 E.01585
G1 X128.324 Y127.442 E.01553
; LINE_WIDTH: 0.455232
G3 X127.225 Y127.418 I-.425 J-5.827 E.02311
; LINE_WIDTH: 0.451092
G1 X126.608 Y127.302 E.01307
; LINE_WIDTH: 0.439072
G1 X125.869 Y127.057 E.01572
; LINE_WIDTH: 0.445192
G1 X125.361 Y126.816 E.01154
; LINE_WIDTH: 0.452152
G3 X124.39 Y126.121 I2.7 J-4.798 E.02495
; LINE_WIDTH: 0.451832
G1 X123.948 Y125.676 E.01306
; LINE_WIDTH: 0.447472
G1 X123.511 Y125.092 E.01503
; LINE_WIDTH: 0.437352
G1 X123.136 Y124.411 E.01566
; LINE_WIDTH: 0.442292
G1 X122.864 Y123.681 E.01585
; LINE_WIDTH: 0.442832
G1 X122.739 Y123.133 E.01146
; LINE_WIDTH: 0.457772
G3 X122.673 Y121.967 I5.911 J-.918 E.02471
; LINE_WIDTH: 0.441772
G1 X122.772 Y121.196 E.01582
G1 X122.987 Y120.451 E.01576
; LINE_WIDTH: 0.442472
G1 X123.299 Y119.756 E.01552
; LINE_WIDTH: 0.443032
G1 X123.594 Y119.278 E.01147
; LINE_WIDTH: 0.457732
G3 X124.364 Y118.402 I4.815 J3.458 E.02467
; LINE_WIDTH: 0.439432
G1 X124.976 Y117.921 E.01573
; LINE_WIDTH: 0.444772
G1 X125.457 Y117.632 E.01151
; LINE_WIDTH: 0.452492
G3 X126.516 Y117.221 I2.536 J4.956 E.02374
; LINE_WIDTH: 0.450992
G1 X127.139 Y117.093 E.01322
; LINE_WIDTH: 0.437732
G1 X127.914 Y117.048 E.01564
; LINE_WIDTH: 0.437592
G1 X128.476 Y117.076 E.01133
; LINE_WIDTH: 0.451892
G1 X129.042 Y117.173 E.01197
; LINE_WIDTH: 0.452992
G1 X129.585 Y117.33 E.0118
G1 X130.309 Y117.645 E.0165
; LINE_WIDTH: 0.438172
G1 X130.838 Y117.964 E.01246
; LINE_WIDTH: 0.451352
G1 X131.282 Y118.309 E.01169
; LINE_WIDTH: 0.452152
G3 X132.067 Y119.154 I-3.55 J4.085 E.02411
; LINE_WIDTH: 0.442532
G1 X132.48 Y119.814 E.01587
; LINE_WIDTH: 0.440152
G1 X132.788 Y120.528 E.01576
; LINE_WIDTH: 0.439212
G1 X132.993 Y121.279 E.01572
; LINE_WIDTH: 0.445432
G1 X133.049 Y121.679 E.0083
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X133.071 Y121.832 E-.05858
G1 X133.071 Y121.836 E-.00153
G1 X133.082 Y122.405 E-.21634
G1 X133.033 Y122.977 E-.2179
G1 X132.907 Y123.595 E-.24
G1 X132.885 Y123.659 E-.02564
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/145
; update layer progress
M73 L132
M991 S0 P131 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z11.28 I1.196 J.227 P1  F30000
G1 X133.269 Y121.639 Z11.28
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.602752
G1 F1514
G1 X133.311 Y122.106 E.01323
; LINE_WIDTH: 0.600742
G1 X133.275 Y122.86 E.02121
; LINE_WIDTH: 0.598602
G1 X133.179 Y123.449 E.01671
; LINE_WIDTH: 0.603172
G3 X132.776 Y124.603 I-5.31 J-1.204 E.03459
; LINE_WIDTH: 0.602742
G1 X132.448 Y125.193 E.01905
; LINE_WIDTH: 0.600742
G1 X131.98 Y125.811 E.02178
; LINE_WIDTH: 0.604602
G3 X131.141 Y126.596 I-4.006 J-3.438 E.03259
; LINE_WIDTH: 0.602752
G1 X130.578 Y126.968 E.01903
; LINE_WIDTH: 0.600662
G1 X129.898 Y127.295 E.02122
; LINE_WIDTH: 0.598232
G1 X129.334 Y127.487 E.01668
; LINE_WIDTH: 0.603102
G1 X128.771 Y127.612 E.01626
; LINE_WIDTH: 0.604512
G1 X128.1 Y127.681 E.0191
G1 X127.346 Y127.659 E.02134
; LINE_WIDTH: 0.598622
G1 X126.756 Y127.571 E.01671
; LINE_WIDTH: 0.603162
G3 X125.595 Y127.185 I1.125 J-5.332 E.03463
; LINE_WIDTH: 0.602762
G1 X125.001 Y126.866 E.01901
; LINE_WIDTH: 0.600692
G1 X124.391 Y126.423 E.02119
; LINE_WIDTH: 0.598262
G1 X123.955 Y126.017 E.01669
; LINE_WIDTH: 0.603102
G3 X122.901 Y124.447 I4.625 J-4.244 E.05359
; LINE_WIDTH: 0.600712
G1 X122.646 Y123.735 E.02124
; LINE_WIDTH: 0.598272
G1 X122.514 Y123.155 E.01667
; LINE_WIDTH: 0.605652
G3 X122.448 Y121.907 I5.698 J-.927 E.0355
; LINE_WIDTH: 0.600602
G1 X122.551 Y121.154 E.02135
; LINE_WIDTH: 0.598182
G1 X122.702 Y120.578 E.01666
; LINE_WIDTH: 0.603052
G3 X123.583 Y118.91 I5.922 J2.063 E.05345
; LINE_WIDTH: 0.600762
G1 X124.088 Y118.35 E.02119
; LINE_WIDTH: 0.598322
G1 X124.536 Y117.959 E.01667
; LINE_WIDTH: 0.603102
G3 X126.21 Y117.073 I3.74 J5.044 E.05367
; LINE_WIDTH: 0.600792
G1 X126.923 Y116.897 E.02065
; LINE_WIDTH: 0.604392
G3 X127.91 Y116.829 I.777 J4.102 E.02803
; LINE_WIDTH: 0.598572
G1 X128.514 Y116.85 E.01694
; LINE_WIDTH: 0.603182
G1 X129.101 Y116.953 E.01682
; LINE_WIDTH: 0.604012
G1 X129.703 Y117.13 E.01775
G1 X130.417 Y117.446 E.02205
; LINE_WIDTH: 0.597952
G1 X130.929 Y117.752 E.01671
; LINE_WIDTH: 0.602802
G1 X131.421 Y118.128 E.01747
; LINE_WIDTH: 0.603132
G3 X132.271 Y119.048 I-3.592 J4.171 E.03544
; LINE_WIDTH: 0.600092
G1 X132.681 Y119.712 E.02188
; LINE_WIDTH: 0.598622
G1 X132.932 Y120.252 E.0167
; LINE_WIDTH: 0.603182
G3 X133.25 Y121.433 I-5.069 J1.998 E.03461
; LINE_WIDTH: 0.602752
G1 X133.263 Y121.579 E.00413
G1 X133.766 Y121.591 F30000
; LINE_WIDTH: 0.449992
G1 F1514
G1 X133.811 Y122.121 E.01103
G3 X127.362 Y116.336 I-5.932 J.126 E.57188
G3 X128.741 Y116.383 I.265 J12.584 E.02864
G3 X130.666 Y117.015 I-.964 J6.181 E.0422
G1 X131.395 Y117.479 E.01793
G3 X132.691 Y118.779 I-3.741 J5.029 E.03821
G1 X133.129 Y119.497 E.01745
G3 X133.749 Y121.387 I-5.68 J2.907 E.04144
G1 X133.761 Y121.531 E.00299
M204 S250
G1 X134.173 Y121.556 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1514
M204 S5000
G1 X134.22 Y122.133 E.01116
G1 X134.199 Y122.819 E.01322
G1 X134.08 Y123.594 E.01511
G3 X133.226 Y125.668 I-6.902 J-1.63 E.04343
G3 X131.703 Y127.315 I-5.938 J-3.962 E.04341
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
G1 X131.049 Y127.749 E.01513
G1 X130.348 Y128.098 E.01511
G3 X128.16 Y128.593 I-2.641 J-6.586 E.04342
G1 X127.401 Y128.582 E.01463
G1 X126.623 Y128.474 E.01513
G3 X124.537 Y127.651 I1.529 J-6.929 E.04341
G1 X123.897 Y127.199 E.0151
G3 X122.424 Y125.506 I4.546 J-5.445 E.04343
G1 X122.074 Y124.832 E.01463
G1 X121.8 Y124.097 E.01513
G3 X121.537 Y121.87 I6.826 J-1.937 E.04341
G1 X121.632 Y121.092 E.01511
G3 X122.424 Y118.993 I6.951 J1.424 E.04342
G1 X122.852 Y118.366 E.01464
G1 X123.369 Y117.776 E.01513
G3 X125.206 Y116.488 I4.939 J5.091 E.04342
G1 X125.913 Y116.211 E.01463
G1 X126.672 Y116.015 E.01512
G1 X127.397 Y115.918 E.01409
G1 X128.566 Y115.938 E.02254
G3 X131.641 Y117.152 I-.665 J6.186 E.0645
G3 X133.036 Y118.558 I-4.026 J5.39 E.0383
G1 X133.499 Y119.32 E.01719
G1 X133.859 Y120.157 E.01756
G3 X134.149 Y121.351 I-6.425 J2.195 E.02372
G1 X134.166 Y121.497 E.00283
; WIPE_START
G1 F1800
M204 S10000
G1 X134.22 Y122.133 E-.24271
G1 X134.199 Y122.819 E-.26061
G1 X134.097 Y123.486 E-.25668
; WIPE_END
G1 E-.04
G1 X128.637 Y118.153 Z11.4 F30000
G1 X127.878 Y117.411 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.604392
G1 F1514
G1 X128.439 Y117.417 E.01586
; LINE_WIDTH: 0.603182
G1 X128.96 Y117.512 E.01496
; LINE_WIDTH: 0.604012
G3 X129.964 Y117.858 I-1.268 J5.317 E.03007
; LINE_WIDTH: 0.600872
G1 X130.564 Y118.197 E.01936
; LINE_WIDTH: 0.602802
G1 X131.038 Y118.559 E.01684
; LINE_WIDTH: 0.603132
G3 X131.775 Y119.34 I-3.508 J4.047 E.03037
; LINE_WIDTH: 0.598702
G1 X132.084 Y119.811 E.01576
; LINE_WIDTH: 0.600162
G1 X132.39 Y120.438 E.0196
; LINE_WIDTH: 0.603182
G3 X132.677 Y121.499 I-4.902 J1.898 E.03108
; LINE_WIDTH: 0.602752
G1 X132.736 Y122.043 E.01546
; LINE_WIDTH: 0.598072
G1 X132.727 Y122.605 E.01573
; LINE_WIDTH: 0.600202
G1 X132.626 Y123.295 E.01959
; LINE_WIDTH: 0.603172
G3 X132.266 Y124.334 I-5.111 J-1.19 E.03109
; LINE_WIDTH: 0.602742
G1 X132.008 Y124.817 E.01545
; LINE_WIDTH: 0.598052
G1 X131.683 Y125.277 E.01574
; LINE_WIDTH: 0.604602
G3 X130.812 Y126.122 I-4.223 J-3.479 E.03444
; LINE_WIDTH: 0.602752
G1 X130.36 Y126.432 E.01545
; LINE_WIDTH: 0.598052
G1 X129.861 Y126.69 E.01573
; LINE_WIDTH: 0.600912
G1 X129.227 Y126.922 E.01899
; LINE_WIDTH: 0.603102
G1 X128.689 Y127.041 E.01555
; LINE_WIDTH: 0.604512
G3 X127.576 Y127.106 I-.888 J-5.641 E.03159
; LINE_WIDTH: 0.600162
G1 X126.9 Y127.016 E.01916
; LINE_WIDTH: 0.603162
G3 X125.856 Y126.671 I1.115 J-5.131 E.03109
; LINE_WIDTH: 0.602762
G1 X125.371 Y126.421 E.0154
; LINE_WIDTH: 0.598042
G1 X124.907 Y126.103 E.01572
; LINE_WIDTH: 0.600882
G1 X124.401 Y125.654 E.01904
; LINE_WIDTH: 0.603102
G3 X123.857 Y124.992 I4.897 J-4.583 E.0242
; LINE_WIDTH: 0.595072
G1 X123.529 Y124.434 E.01802
; LINE_WIDTH: 0.596292
G1 X123.252 Y123.762 E.02028
; LINE_WIDTH: 0.600862
G1 X123.087 Y123.106 E.01902
; LINE_WIDTH: 0.605652
G3 X123.015 Y122.016 I6.647 J-.983 E.03101
; LINE_WIDTH: 0.598242
G1 X123.076 Y121.457 E.01573
; LINE_WIDTH: 0.601022
G1 X123.231 Y120.804 E.01887
; LINE_WIDTH: 0.603052
G3 X123.988 Y119.324 I5.661 J1.96 E.04706
; LINE_WIDTH: 0.598172
G1 X124.352 Y118.896 E.01573
; LINE_WIDTH: 0.600822
G1 X124.853 Y118.439 E.01908
; LINE_WIDTH: 0.603102
G3 X126.31 Y117.643 I3.585 J4.834 E.04701
; LINE_WIDTH: 0.598112
G1 X126.852 Y117.494 E.01573
; LINE_WIDTH: 0.604392
G1 X127.497 Y117.407 E.01842
G1 X127.818 Y117.411 E.00909
G1 X127.867 Y117.883 F30000
; LINE_WIDTH: 0.449992
G1 F1514
G1 X128.419 Y117.916 E.01149
G1 X129.059 Y118.045 E.01353
G3 X130.72 Y118.946 I-1.377 J4.522 E.03945
G1 X131.303 Y119.543 E.01732
G3 X129.065 Y126.449 I-3.447 J2.698 E.17753
G1 X128.376 Y126.589 E.0146
G1 X127.602 Y126.608 E.01606
G1 X126.974 Y126.522 E.01313
G1 X126.321 Y126.332 E.01412
G1 X125.73 Y126.054 E.01354
G1 X125.187 Y125.692 E.01353
G3 X124.266 Y124.712 I3.563 J-4.271 E.02798
G1 X123.96 Y124.185 E.01263
G1 X123.715 Y123.58 E.01354
G1 X123.574 Y122.994 E.01249
G1 X123.509 Y122.168 E.01719
G1 X123.57 Y121.509 E.01373
G1 X123.715 Y120.93 E.01238
G1 X123.977 Y120.279 E.01458
G1 X124.315 Y119.72 E.01354
G1 X124.731 Y119.218 E.01353
G1 X125.181 Y118.815 E.01253
G1 X125.764 Y118.426 E.01453
G1 X126.357 Y118.154 E.01353
G1 X126.984 Y117.974 E.01353
G3 X127.807 Y117.885 I1.55 J10.556 E.01716
M204 S250
G1 X127.842 Y118.291 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1514
M204 S5000
G1 X128.394 Y118.332 E.01067
G3 X128.973 Y118.446 I-.497 J4.068 E.0114
G1 X129.632 Y118.702 E.01363
G3 X131.327 Y120.31 I-1.833 J3.628 E.04567
G3 X131.82 Y122.591 I-3.513 J1.953 E.04565
G3 X130.942 Y124.754 I-4.005 J-.366 E.04565
G1 X130.577 Y125.128 E.01007
G1 X129.968 Y125.611 E.01498
G3 X128.933 Y126.062 I-2.016 J-3.215 E.02183
G1 X128.303 Y126.186 E.01239
G1 X127.596 Y126.199 E.01363
G3 X125.418 Y125.354 I.299 J-4.002 E.04569
G3 X124.603 Y124.481 I3.384 J-3.971 E.02308
G3 X123.973 Y122.903 I3.706 J-2.395 E.03294
G1 X123.917 Y122.144 E.01468
G1 X123.977 Y121.553 E.01146
G3 X125.043 Y119.482 I4.003 J.751 E.04552
G3 X127.093 Y118.368 I2.88 J2.857 E.04562
G1 X127.592 Y118.313 E.00967
G3 X127.787 Y118.303 I.305 J4.087 E.00377
; CHANGE_LAYER
; Z_HEIGHT: 11.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X128.394 Y118.332 E-.23061
G1 X128.973 Y118.446 E-.22449
G1 X129.632 Y118.702 E-.26872
G1 X129.714 Y118.75 E-.03618
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 133/145
; update layer progress
M73 L133
M991 S0 P132 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z11.4 I-.833 J.887 P1  F30000
G1 X132.801 Y121.647 Z11.4
G1 Z11.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F3600
G1 X132.841 Y122.139 E.01024
G3 X127.435 Y117.303 I-4.963 J.109 E.47828
G3 X128.518 Y117.328 I.238 J13.471 E.02248
G3 X132.793 Y121.546 I-.638 J4.921 E.13379
G1 X132.796 Y121.587 E.00085
G1 X133.223 Y121.608 F30000
G1 F3600
G1 X133.265 Y122.152 E.01131
G3 X127.378 Y116.883 I-5.387 J.096 E.51828
G3 X128.587 Y116.909 I.351 J11.638 E.02511
G3 X133.215 Y121.508 I-.708 J5.34 E.14537
G1 X133.218 Y121.548 E.00083
G1 X133.649 Y121.629 F30000
G1 F3600
G1 X133.655 Y121.662 E.00069
G1 X133.689 Y122.164 E.01045
G3 X127.431 Y116.448 I-5.813 J.08 E.5607
G3 X128.657 Y116.491 I.127 J13.813 E.02545
G3 X132.197 Y118.36 I-.777 J5.759 E.08478
G1 X132.734 Y119.065 E.01839
G1 X132.996 Y119.496 E.01045
G1 X133.351 Y120.308 E.01839
G1 X133.503 Y120.788 E.01046
G1 X133.639 Y121.57 E.01645
M204 S250
G1 X134.052 Y121.554 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X134.066 Y121.625 E.00139
G3 X134.098 Y122.177 I-6.217 J.643 E.01066
G1 X134.08 Y122.808 E.01218
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
G3 X124.6 Y127.549 I-6.215 J-.58 E.24403
G3 X121.657 Y121.878 I3.346 J-5.336 E.12916
G1 X121.754 Y121.096 E.01519
G3 X122.527 Y119.055 I6.84 J1.423 E.04224
G1 X122.974 Y118.406 E.01518
G3 X127.406 Y116.038 I4.962 J3.954 E.0996
G1 X128.529 Y116.055 E.02164
M73 P90 R2
G3 X133.988 Y121.094 I-.68 J6.213 E.15335
G1 X134.044 Y121.495 E.00779
; WIPE_START
M204 S10000
G1 X134.066 Y121.625 E-.05013
G1 X134.098 Y122.177 E-.21009
G1 X134.08 Y122.808 E-.24013
G1 X133.978 Y123.484 E-.25965
; WIPE_END
G1 E-.04
G1 X131.571 Y121.849 Z11.52 F30000
G1 Z11.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F600
G3 X130.554 Y124.827 I-3.824 J.357 E.06726
G3 X129.696 Y125.485 I-3.555 J-3.746 E.02246
G1 X129.129 Y125.75 E.01297
G1 X128.446 Y125.916 E.01458
G3 X125.901 Y125.398 I-.566 J-3.729 E.05499
G1 X125.339 Y124.962 E.01477
G3 X124.641 Y124.081 I3.811 J-3.736 E.02335
G1 X124.494 Y123.755 E.00741
G1 X124.299 Y123.262 E.011
G3 X124.419 Y120.88 I3.988 J-.993 E.05018
G3 X124.991 Y119.906 I5.969 J2.85 E.02346
G1 X125.36 Y119.518 E.01111
G1 X125.949 Y119.078 E.01524
G1 X126.289 Y118.896 E.00801
G1 X126.863 Y118.681 E.01271
G1 X127.266 Y118.592 E.00856
G1 X127.936 Y118.542 E.01394
G1 X128.304 Y118.562 E.00764
G1 X128.917 Y118.681 E.01297
G1 X129.568 Y118.948 E.0146
G1 X129.888 Y119.132 E.00765
G3 X130.971 Y120.192 I-2.273 J3.407 E.0316
G3 X131.561 Y121.79 I-3.798 J2.312 E.03556
M204 S250
G1 X131.123 Y121.735 F30000
; FEATURE: Overhang wall
G1 F600
M204 S5000
G1 X131.159 Y122.437 E.01458
G3 X130.13 Y124.644 I-3.44 J-.262 E.05162
G1 X129.707 Y124.98 E.0112
G1 X129.123 Y125.29 E.01371
G3 X128.341 Y125.505 I-1.248 J-3.014 E.01687
G1 X127.566 Y125.523 E.01607
G1 X126.798 Y125.356 E.01632
G1 X126.154 Y125.053 E.01475
G1 X125.608 Y124.634 E.01427
G3 X124.991 Y123.83 I3.372 J-3.228 E.02107
G1 X124.881 Y123.583 E.00561
G1 X124.701 Y123.116 E.01037
G1 X124.598 Y122.576 E.01141
G3 X124.66 Y121.553 I5.963 J-.152 E.02127
G1 X124.816 Y121.029 E.01135
G1 X125.07 Y120.561 E.01104
G3 X126.438 Y119.293 I2.754 J1.599 E.03926
G1 X127.012 Y119.078 E.01271
G1 X127.297 Y119.015 E.00607
G1 X127.967 Y118.965 E.01394
G1 X128.652 Y119.056 E.01433
G3 X129.411 Y119.342 I-.767 J3.183 E.01686
G1 X130.049 Y119.783 E.01608
G1 X130.531 Y120.309 E.0148
G1 X130.908 Y120.98 E.01597
G1 X131.107 Y121.678 E.01505
M204 S250
G1 X130.711 Y121.836 F30000
G1 F600
M204 S5000
G1 X130.735 Y122.444 E.01262
G1 X130.632 Y123.034 E.01243
G3 X130.254 Y123.848 I-5.358 J-1.991 E.01864
G1 X129.932 Y124.25 E.01069
G1 X129.443 Y124.649 E.01308
G1 X128.939 Y124.908 E.01175
G1 X128.257 Y125.089 E.01464
G1 X127.573 Y125.099 E.0142
G1 X126.904 Y124.945 E.01423
G1 X126.349 Y124.677 E.01279
G1 X125.878 Y124.306 E.01244
G1 X125.453 Y123.782 E.014
G1 X125.269 Y123.41 E.0086
G1 X125.118 Y123.034 E.00841
G1 X125.019 Y122.525 E.01075
G1 X125.043 Y121.815 E.01473
G1 X125.199 Y121.221 E.01274
G3 X125.647 Y120.446 I5.152 J2.459 E.01858
G1 X126.006 Y120.073 E.01075
G1 X126.427 Y119.779 E.01065
G1 X127.056 Y119.515 E.01416
G1 X127.329 Y119.438 E.00587
G1 X127.999 Y119.388 E.01394
G1 X128.577 Y119.474 E.01211
G1 X129.235 Y119.728 E.01464
G1 X129.794 Y120.123 E.01419
G1 X130.207 Y120.583 E.01283
G1 X130.532 Y121.175 E.01401
G1 X130.695 Y121.778 E.01295
M204 S250
G1 X130.313 Y121.933 F30000
; LINE_WIDTH: 0.419992
G1 F600
M204 S5000
G1 X130.326 Y122.45 E.00996
G1 X130.231 Y122.955 E.00991
G1 X129.959 Y123.553 E.01266
G1 X129.641 Y123.961 E.00997
G1 X129.188 Y124.329 E.01126
G1 X128.724 Y124.558 E.00997
G1 X128.166 Y124.69 E.01105
G1 X127.579 Y124.689 E.01132
G1 X127.007 Y124.549 E.01135
G1 X126.538 Y124.313 E.01013
G1 X126.138 Y123.99 E.00992
G1 X125.777 Y123.531 E.01125
G1 X125.642 Y123.244 E.00612
G1 X125.519 Y122.955 E.00605
G1 X125.424 Y122.458 E.00975
G1 X125.452 Y121.834 E.01204
G1 X125.592 Y121.336 E.00997
G1 X125.914 Y120.767 E.01261
G1 X126.269 Y120.387 E.01002
G1 X126.689 Y120.095 E.00986
G3 X127.359 Y119.846 I2.487 J5.664 E.01379
G1 X128.029 Y119.797 E.01295
G1 X128.545 Y119.884 E.01007
G1 X129.074 Y120.105 E.01106
G1 X129.549 Y120.45 E.01131
G1 X129.895 Y120.848 E.01016
G1 X130.169 Y121.364 E.01126
G1 X130.298 Y121.875 E.01016
; WIPE_START
M204 S10000
G1 X130.326 Y122.45 E-.21872
G1 X130.231 Y122.955 E-.19532
G1 X129.959 Y123.553 E-.24966
G1 X129.803 Y123.753 E-.0963
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.52 I-1.056 J-.604 P1  F30000
G1 X128.065 Y126.793 Z11.52
G1 Z11.12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.445825
G1 F14283.224
G2 X128.393 Y117.732 I-.2 J-4.544 E.27846
G2 X127.193 Y117.761 I-.43 J7.044 E.02469
G1 X126.483 Y117.924 E.01497
G2 X128.005 Y126.792 I1.397 J4.325 E.26665
G1 X128.075 Y126.375 F30000
; LINE_WIDTH: 0.444089
G1 F14342.503
G3 X124.921 Y125.135 I-.144 J-4.266 E.07129
G1 X124.451 Y124.558 E.01523
G3 X123.919 Y123.457 I4.798 J-2.998 E.02505
G1 X123.751 Y122.535 E.01917
G3 X123.821 Y121.454 I12.698 J.273 E.02215
G1 X124.104 Y120.558 E.01922
G1 X124.462 Y119.929 E.01481
G1 X124.735 Y119.566 E.00929
G1 X125.271 Y119.039 E.01535
G3 X126.609 Y118.329 I2.66 J3.395 E.03115
G1 X127.069 Y118.199 E.00978
G1 X127.905 Y118.127 E.01716
G1 X128.364 Y118.147 E.00939
G1 X129.211 Y118.342 E.01779
G3 X131.845 Y121.141 I-1.376 J3.933 E.08169
G3 X131.987 Y122.635 I-4.926 J1.223 E.03082
G1 X131.798 Y123.552 E.01914
G3 X131.354 Y124.487 I-10.508 J-4.424 E.02118
G1 X130.87 Y125.099 E.01595
G1 X130.344 Y125.552 E.01421
G3 X128.135 Y126.369 I-2.49 J-3.336 E.04884
; CHANGE_LAYER
; Z_HEIGHT: 11.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F14342.503
G1 X128.529 Y126.328 E-.15055
G1 X129.045 Y126.211 E-.20131
G1 X129.486 Y126.053 E-.1777
G1 X129.948 Y125.819 E-.19718
G1 X130.021 Y125.77 E-.03327
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/145
; update layer progress
M73 L134
M991 S0 P133 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z11.52 I1.024 J.658 P1  F30000
M73 P90 R1
G1 X132.68 Y121.635 Z11.52
G1 Z11.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F2206
G1 X132.721 Y122.139 E.01048
G1 X132.669 Y122.927 E.01638
G3 X129.12 Y126.931 I-4.805 J-.684 E.11753
G1 X128.291 Y127.08 E.01749
G3 X126.615 Y126.932 I-.352 J-5.573 E.03502
G1 X125.896 Y126.674 E.01586
G3 X131.074 Y118.611 I1.984 J-4.42 E.34567
G3 X132.67 Y121.561 I-3.278 J3.68 E.071
G1 X132.672 Y121.576 E.00031
G1 X133.102 Y121.596 F30000
G1 F2206
G1 X133.146 Y122.152 E.01157
G3 X129.215 Y127.345 I-5.283 J.085 E.14555
G1 X128.324 Y127.504 E.01877
G3 X125.61 Y127.011 I-.408 J-5.475 E.05783
G1 X124.845 Y126.568 E.01835
G3 X132.61 Y119.948 I3.029 J-4.312 E.39855
G3 X133.095 Y121.523 I-4.711 J2.311 E.03433
G1 X133.096 Y121.536 E.00027
G1 X133.524 Y121.56 F30000
G1 F2206
G1 X133.57 Y122.164 E.01257
G3 X129.305 Y116.74 I-5.691 J.086 E.58801
G3 X131.702 Y118.037 I-1.436 J5.517 E.05708
G3 X132.993 Y119.763 I-4.31 J4.568 E.04494
G3 X133.517 Y121.485 I-5.096 J2.495 E.03749
G1 X133.519 Y121.5 E.00032
M204 S250
G1 X133.931 Y121.55 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X133.943 Y121.636 E.00168
G3 X133.979 Y122.177 I-6.597 J.705 E.01045
G3 X133.657 Y124.225 I-6.708 J-.005 E.04013
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
G3 X133.528 Y119.933 I-5.776 J-1.975 E.65472
G3 X133.862 Y121.092 I-6.183 J2.408 E.02328
G1 X133.922 Y121.49 E.00776
; WIPE_START
M204 S10000
G1 X133.943 Y121.636 E-.05591
G1 X133.979 Y122.177 E-.20596
G1 X133.96 Y122.797 E-.23603
G1 X133.857 Y123.479 E-.2621
; WIPE_END
G1 E-.04
G17
G3 Z11.64 I.395 J-1.151 P1  F30000
G1 X124.707 Y120.336 Z11.64
G1 Z11.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F2206
G1 X124.854 Y120.085 E.00604
G1 X125.265 Y119.611 E.01301
G3 X126.292 Y118.895 I3.04 J3.264 E.02604
G1 X126.86 Y118.682 E.0126
G1 X127.369 Y118.578 E.01078
G3 X128.443 Y118.581 I.531 J3.123 E.02238
G1 X129.151 Y118.766 E.01517
G1 X129.511 Y118.92 E.00812
G1 X130.032 Y119.232 E.0126
G3 X130.919 Y120.129 I-2.59 J3.445 E.02627
G1 X131.227 Y120.662 E.01277
G1 X131.377 Y121.026 E.00816
M73 P91 R1
G1 X131.53 Y121.614 E.0126
G1 X131.579 Y122.13 E.01077
G3 X131.465 Y123.198 I-3.162 J.202 E.02238
G1 X131.236 Y123.802 E.0134
G3 X130.411 Y124.962 I-3.717 J-1.77 E.02967
G1 X129.923 Y125.352 E.01297
G3 X128.877 Y125.825 I-2.671 J-4.52 E.02386
G1 X128.285 Y125.945 E.01253
G1 X127.55 Y125.947 E.01525
G3 X124.598 Y123.989 I.328 J-3.699 E.07659
G3 X124.169 Y122.54 I3.648 J-1.867 E.03153
G1 X124.195 Y121.78 E.01576
G1 X124.265 Y121.395 E.00812
G1 X124.452 Y120.799 E.01295
G1 X124.582 Y120.55 E.00582
G1 X124.677 Y120.388 E.0039
G1 X125.081 Y120.543 F30000
G1 F2206
G1 X125.229 Y120.297 E.00597
G3 X126.441 Y119.292 I2.93 J2.3 E.03289
G1 X127.009 Y119.079 E.0126
G1 X127.718 Y118.964 E.01489
G3 X128.616 Y119.045 I.054 J4.435 E.01874
G1 X129.169 Y119.221 E.01205
G3 X130.019 Y119.756 I-2.16 J4.373 E.02086
G1 X130.393 Y120.135 E.01104
G3 X130.966 Y121.132 I-3.678 J2.777 E.02393
G1 X131.119 Y121.72 E.0126
G1 X131.159 Y122.437 E.01489
G3 X130.979 Y123.336 I-4.237 J-.383 E.01905
G1 X130.759 Y123.83 E.01121
G1 X130.302 Y124.468 E.01629
G1 X129.81 Y124.906 E.01366
G1 X129.569 Y125.067 E.00602
G1 X129.022 Y125.33 E.0126
G1 X128.355 Y125.502 E.01427
G3 X127.31 Y125.489 I-.468 J-4.365 E.02172
G1 X126.78 Y125.35 E.01138
G1 X126.152 Y125.052 E.0144
G1 X125.643 Y124.662 E.01331
G3 X125.117 Y124.041 I2.235 J-2.424 E.01692
G1 X124.777 Y123.349 E.016
G1 X124.61 Y122.652 E.01486
G1 X124.619 Y121.799 E.01768
G1 X124.792 Y121.102 E.0149
G1 X124.955 Y120.751 E.00802
G1 X125.05 Y120.595 E.00379
G1 X125.438 Y120.765 F30000
G1 F2206
G1 X125.549 Y120.576 E.00455
G1 X125.904 Y120.169 E.01121
G1 X126.454 Y119.761 E.01419
G1 X127.158 Y119.476 E.01576
G1 X127.769 Y119.385 E.0128
G1 X128.367 Y119.426 E.01244
G1 X128.901 Y119.576 E.01151
G1 X129.501 Y119.903 E.01417
G1 X129.717 Y120.054 E.00548
G1 X130.091 Y120.433 E.01104
G3 X130.556 Y121.239 I-4.131 J2.916 E.01932
G1 X130.709 Y121.827 E.0126
G1 X130.735 Y122.444 E.0128
G1 X130.632 Y123.034 E.01243
G1 X130.371 Y123.657 E.01401
G1 X129.967 Y124.209 E.01419
G1 X129.541 Y124.578 E.01169
G1 X128.938 Y124.9 E.01417
G1 X128.7 Y124.995 E.00532
G1 X128.184 Y125.102 E.01095
G1 X127.562 Y125.098 E.01289
G1 X126.887 Y124.94 E.01439
G1 X126.348 Y124.676 E.01244
G1 X125.912 Y124.334 E.01149
G1 X125.462 Y123.793 E.01462
G1 X125.164 Y123.176 E.01419
G1 X125.026 Y122.57 E.0129
G1 X125.043 Y121.818 E.01559
G1 X125.199 Y121.221 E.01281
G1 X125.329 Y120.952 E.00619
G1 X125.408 Y120.817 E.00325
M204 S250
G1 X125.788 Y120.969 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X125.857 Y120.845 E.00274
G1 X126.212 Y120.438 E.01041
G1 X126.689 Y120.096 E.01132
G1 X127.302 Y119.859 E.01266
G1 X127.817 Y119.791 E.01002
G1 X128.33 Y119.833 E.00991
G1 X128.822 Y119.981 E.00991
G3 X129.426 Y120.342 I-3.371 J6.315 E.01357
G1 X129.8 Y120.721 E.01026
G1 X130.139 Y121.293 E.01282
G1 X130.313 Y121.93 E.01273
G1 X130.326 Y122.45 E.01002
G1 X130.231 Y122.955 E.00991
G1 X129.998 Y123.491 E.01126
G1 X129.643 Y123.958 E.01132
G1 X129.247 Y124.291 E.00996
G1 X128.761 Y124.531 E.01045
G1 X128.182 Y124.687 E.01156
G1 X127.569 Y124.689 E.01182
G1 X126.991 Y124.544 E.01148
G1 X126.537 Y124.313 E.00981
G1 X126.138 Y123.99 E.0099
G1 X125.785 Y123.542 E.01099
G1 X125.538 Y123.01 E.01132
G1 X125.428 Y122.491 E.01023
G1 X125.452 Y121.837 E.01261
G1 X125.592 Y121.336 E.01003
G1 X125.689 Y121.146 E.0041
G1 X125.759 Y121.022 E.00275
; WIPE_START
M204 S10000
G1 X125.857 Y120.845 E-.07684
G1 X126.212 Y120.438 E-.20532
G1 X126.689 Y120.096 E-.22312
G1 X127.302 Y119.859 E-.24961
G1 X127.315 Y119.857 E-.00511
; WIPE_END
G1 E-.04
G17
G3 Z11.64 I-1.214 J.086 P1  F30000
G1 X127.798 Y126.702 Z11.64
G1 Z11.24
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385336
G1 F2206
G1 X128.307 Y126.676 E.00896
G1 X129.114 Y126.53 E.01443
G2 X130.948 Y125.481 I-1.29 J-4.382 E.03748
G1 X131.469 Y124.881 E.01397
G1 X131.754 Y124.447 E.00913
G1 X132.068 Y123.755 E.01335
G2 X123.463 Y122.844 I-4.192 J-1.503 E.28332
G1 X123.608 Y123.525 E.01224
G1 X123.914 Y124.293 E.01453
G2 X125.306 Y125.892 I3.971 J-2.052 E.03763
G1 X125.988 Y126.285 E.01384
G1 X126.732 Y126.553 E.01391
G2 X127.738 Y126.698 I1.025 J-3.541 E.01791
G1 X128.219 Y126.337 F30000
; LINE_WIDTH: 0.382502
G1 F2206
G1 X127.344 Y126.321 E.01526
G3 X126.342 Y126.055 I2.06 J-9.803 E.01808
G1 X125.652 Y125.698 E.01357
G1 X125.123 Y125.289 E.01165
G3 X123.901 Y123.229 I2.812 J-3.06 E.04238
G1 X123.786 Y122.585 E.01142
G1 X123.816 Y121.749 E.01459
G3 X124.034 Y120.802 I4.349 J.503 E.01699
G1 X124.474 Y119.95 E.01672
G3 X125.283 Y119.074 I4.535 J3.377 E.02084
G1 X125.947 Y118.632 E.0139
G1 X126.836 Y118.279 E.01669
G1 X127.136 Y118.216 E.00535
G1 X127.845 Y118.156 E.01241
G1 X128.603 Y118.211 E.01325
G1 X129.269 Y118.394 E.01206
G1 X129.705 Y118.581 E.00826
G1 X130.502 Y119.097 E.01656
G3 X131.202 Y119.852 I-8.213 J8.329 E.01797
G1 X131.564 Y120.466 E.01243
G1 X131.755 Y120.932 E.00879
G1 X131.926 Y121.654 E.01293
G3 X131.964 Y122.628 I-5.476 J.697 E.01704
G1 X131.757 Y123.577 E.01694
G1 X131.467 Y124.234 E.01253
G3 X130.743 Y125.185 I-4.712 J-2.839 E.02088
G3 X128.531 Y126.285 I-2.933 J-3.121 E.04372
G1 X128.278 Y126.327 E.00447
; CHANGE_LAYER
; Z_HEIGHT: 11.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F16818.502
G1 X128.531 Y126.285 E-.09744
G1 X129.037 Y126.177 E-.1966
G1 X129.477 Y126.013 E-.17855
G1 X129.932 Y125.796 E-.19158
G1 X130.143 Y125.658 E-.09584
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/145
; update layer progress
M73 L135
M991 S0 P134 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z11.64 I1.044 J.625 P1  F30000
G1 X132.559 Y121.624 Z11.64
G1 Z11.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1902
G1 X132.602 Y122.139 E.01071
G3 X126.317 Y126.712 I-4.731 J.105 E.18919
G1 X125.615 Y126.403 E.01591
G3 X123.177 Y122.772 I2.294 J-4.174 E.09424
G1 X123.162 Y121.919 E.0177
G3 X127.462 Y117.541 I4.702 J.318 E.1386
G3 X128.429 Y117.556 I.183 J20.046 E.02006
G3 X132.552 Y121.565 I-.561 J4.702 E.12819
G1 X132.981 Y121.584 F30000
G1 F1902
G1 X133.026 Y122.151 E.01181
G3 X122.753 Y122.798 I-5.151 J.088 E.32591
G1 X122.738 Y121.897 E.01868
G3 X127.474 Y117.112 I5.131 J.342 E.15225
G1 X128.359 Y117.125 E.01835
G3 X132.972 Y121.524 I-.508 J5.151 E.14245
G1 X133.403 Y121.547 F30000
G1 F1902
G1 X133.45 Y122.164 E.01283
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
G3 X127.449 Y116.687 I-5.575 J.082 E.53784
G1 X128.365 Y116.701 E.01901
G3 X133.395 Y121.488 I-.514 J5.576 E.15535
M204 S250
G1 X133.811 Y121.515 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X133.859 Y122.176 E.01278
G3 X127.424 Y116.277 I-5.985 J.07 E.53635
G1 X128.504 Y116.293 E.02081
G3 X132.778 Y118.818 I-.686 J6.04 E.09856
G1 X133.232 Y119.595 E.01734
G3 X133.806 Y121.455 I-5.291 J2.65 E.03771
; WIPE_START
M204 S10000
G1 X133.859 Y122.176 E-.27466
G1 X133.841 Y122.787 E-.23206
G1 X133.741 Y123.446 E-.25328
; WIPE_END
G1 E-.04
G17
G3 Z11.76 I.41 J-1.146 P1  F30000
G1 X124.77 Y120.236 Z11.76
G1 Z11.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1902
G1 X124.933 Y120.006 E.00586
G3 X125.538 Y119.368 I3.64 J2.846 E.01826
G3 X126.874 Y118.67 I2.535 J3.222 E.03145
G1 X127.606 Y118.551 E.01538
G3 X128.531 Y118.597 I.292 J3.475 E.01925
G1 X129.132 Y118.764 E.01295
G3 X130.307 Y119.444 I-1.528 J3.992 E.02827
G1 X130.747 Y119.888 E.01297
G3 X131.592 Y122.293 I-3.209 J2.479 E.05379
G1 X131.498 Y123.047 E.01575
G1 X131.393 Y123.427 E.00819
G1 X131.154 Y124.001 E.01288
G3 X130.034 Y125.274 I-3.881 J-2.284 E.0354
G1 X129.492 Y125.59 E.01301
G1 X128.902 Y125.814 E.01308
G1 X128.492 Y125.908 E.00874
G3 X127.002 Y125.857 I-.612 J-3.892 E.0311
G1 X126.435 Y125.664 E.01242
G3 X124.402 Y123.572 I1.451 J-3.443 E.06216
G1 X124.252 Y123.062 E.01103
G3 X124.371 Y121.007 I4.022 J-.797 E.04314
G1 X124.667 Y120.384 E.0143
G1 X124.735 Y120.285 E.0025
G1 X125.119 Y120.47 F30000
G1 F1902
G1 X125.253 Y120.279 E.00484
G3 X125.579 Y119.897 I3.669 J2.798 E.01041
G1 X126.195 Y119.425 E.0161
G1 X126.849 Y119.124 E.01494
G1 X127.67 Y118.971 E.01731
G3 X128.712 Y119.068 I.117 J4.36 E.02176
G1 X129.231 Y119.249 E.01141
G3 X130.009 Y119.746 I-2.365 J4.555 E.01918
G1 X130.419 Y120.158 E.01205
G1 X130.744 Y120.64 E.01205
G1 X131.059 Y121.431 E.01768
G1 X131.163 Y122.142 E.0149
G1 X131.078 Y122.99 E.01767
G1 X130.843 Y123.669 E.0149
G1 X130.483 Y124.255 E.01427
G3 X128.455 Y125.485 I-2.695 J-2.155 E.05023
G1 X127.863 Y125.537 E.01232
G1 X127.214 Y125.462 E.01355
G1 X126.85 Y125.375 E.00776
G1 X126.362 Y125.174 E.01094
G1 X125.831 Y124.827 E.01315
G1 X125.387 Y124.386 E.01299
G3 X124.804 Y123.436 I2.637 J-2.27 E.02321
G1 X124.659 Y122.943 E.01068
G1 X124.596 Y122.2 E.01546
G1 X124.613 Y121.833 E.00762
G1 X124.725 Y121.304 E.0112
G1 X125.049 Y120.57 E.01665
G1 X125.084 Y120.519 E.00129
G1 X125.482 Y120.692 F30000
G1 F1902
G1 X125.899 Y120.175 E.01379
G1 X126.439 Y119.772 E.01397
G1 X127.01 Y119.517 E.01298
G1 X127.733 Y119.39 E.01521
G1 X128.442 Y119.44 E.01474
G1 X129.022 Y119.623 E.01262
G3 X129.711 Y120.048 I-2.21 J4.347 E.01682
G1 X130.091 Y120.427 E.01113
G1 X130.39 Y120.873 E.01113
G1 X130.659 Y121.575 E.01558
G1 X130.741 Y122.187 E.0128
G1 X130.657 Y122.933 E.01558
G1 X130.448 Y123.514 E.01281
M73 P92 R1
G1 X130.129 Y124.021 E.01244
G1 X129.652 Y124.498 E.014
G1 X129.068 Y124.856 E.0142
G1 X128.551 Y125.036 E.01136
G3 X127.674 Y125.108 I-.818 J-4.557 E.01827
G1 X127.141 Y125.02 E.0112
G1 X126.573 Y124.804 E.01261
G3 X125.206 Y123.301 I1.434 J-2.677 E.04295
G1 X125.052 Y122.762 E.01164
G1 X125.02 Y122.181 E.01207
G1 X125.056 Y121.792 E.0081
G1 X125.188 Y121.254 E.0115
G1 X125.43 Y120.755 E.0115
G1 X125.444 Y120.738 E.00045
M204 S250
G1 X125.793 Y120.945 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X125.801 Y120.929 E.00034
G1 X126.211 Y120.44 E.0123
G1 X126.674 Y120.106 E.01101
G1 X127.165 Y119.895 E.0103
G1 X127.794 Y119.795 E.01227
G1 X128.399 Y119.847 E.01171
G1 X128.89 Y120.01 E.00997
G1 X129.389 Y120.313 E.01126
G1 X129.761 Y120.672 E.00997
G1 X130.048 Y121.099 E.00991
G1 X130.274 Y121.713 E.01261
G1 X130.334 Y122.229 E.01002
G1 X130.252 Y122.878 E.0126
G1 X130.067 Y123.364 E.01003
G1 X129.787 Y123.796 E.00991
G1 X129.369 Y124.203 E.01125
G1 X128.863 Y124.501 E.01132
G1 X128.385 Y124.655 E.00967
G1 X127.79 Y124.707 E.01151
G1 X127.208 Y124.616 E.01136
G1 X126.728 Y124.425 E.00996
G1 X126.301 Y124.139 E.00991
G1 X125.9 Y123.714 E.01127
G1 X125.594 Y123.171 E.012
G1 X125.454 Y122.689 E.00967
G3 X125.556 Y121.432 I3.008 J-.389 E.02448
G1 X125.767 Y120.999 E.00929
; WIPE_START
M204 S10000
G1 X125.801 Y120.929 E-.02941
G1 X126.211 Y120.44 E-.24253
G1 X126.674 Y120.106 E-.2171
G1 X127.165 Y119.895 E-.20309
G1 X127.342 Y119.867 E-.06786
; WIPE_END
G1 E-.04
G17
G3 Z11.76 I-1.21 J.133 P1  F30000
G1 X128.064 Y126.458 Z11.76
G1 Z11.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.624152
G1 F1902
G2 X130.42 Y125.618 I-.214 J-4.323 E.07425
G1 X130.974 Y125.107 E.02204
G1 X131.427 Y124.52 E.02172
G2 X130.605 Y119.029 I-3.584 J-2.27 E.17707
G2 X129.74 Y118.466 I-4.123 J5.392 E.0302
G1 X129.021 Y118.192 E.02254
G1 X128.345 Y118.062 E.02013
G1 X127.827 Y118.038 E.01516
G1 X127.061 Y118.121 E.02255
G2 X125.663 Y118.671 I.766 J3.994 E.0442
G2 X123.664 Y122.098 I2.183 J3.57 E.12092
G1 X123.692 Y122.752 E.01917
G2 X124.141 Y124.188 I4.2 J-.526 E.04424
G1 X124.388 Y124.627 E.01476
G1 X124.972 Y125.308 E.02623
G2 X126.567 Y126.256 I3.034 J-3.286 E.0547
G2 X128.004 Y126.458 I1.323 J-4.211 E.04264
; CHANGE_LAYER
; Z_HEIGHT: 11.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F10026.749
G1 X127.56 Y126.458 E-.16886
G1 X127.061 Y126.384 E-.19165
G1 X126.567 Y126.256 E-.19366
G1 X126.068 Y126.045 E-.20583
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 136/145
; update layer progress
M73 L136
M991 S0 P135 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z11.76 I.695 J.999 P1  F30000
G1 X132.438 Y121.614 Z11.76
G1 Z11.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1869
G1 X132.482 Y122.139 E.01094
G3 X127.475 Y117.66 I-4.604 J.109 E.44399
G3 X128.457 Y117.682 I.17 J14.706 E.02038
G3 X132.43 Y121.554 I-.577 J4.567 E.12351
G1 X132.86 Y121.572 F30000
G1 F1869
G1 X132.906 Y122.152 E.01206
G3 X127.418 Y117.24 I-5.028 J.096 E.48399
G3 X128.526 Y117.263 I.306 J11.813 E.02301
G3 X132.852 Y121.512 I-.647 J4.986 E.13501
G1 X133.282 Y121.535 F30000
G1 F1869
G1 X133.33 Y122.164 E.0131
G3 X127.458 Y116.807 I-5.454 J.08 E.52611
G3 X128.596 Y116.845 I.116 J13.472 E.02363
G3 X132.989 Y120.36 I-.749 J5.439 E.12252
G3 X133.267 Y121.478 I-5.697 J2.012 E.02392
M204 S250
G1 X133.687 Y121.54 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X133.708 Y121.657 E.00229
G3 X133.739 Y122.177 I-5.858 J.611 E.01004
G3 X130.862 Y127.301 I-5.912 J.05 E.11855
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
G1 X130.181 Y127.647 E.01471
G3 X127.433 Y116.397 I-2.298 J-5.4 E.39215
G1 X128.491 Y116.413 E.0204
G3 X133.632 Y121.146 I-.641 J5.855 E.14419
G1 X133.679 Y121.48 E.0065
; WIPE_START
M204 S10000
G1 X133.708 Y121.657 E-.06794
G1 X133.739 Y122.177 E-.19788
G1 X133.721 Y122.776 E-.22785
G1 X133.617 Y123.469 E-.26634
; WIPE_END
G1 E-.04
G17
G3 Z11.88 I.407 J-1.147 P1  F30000
G1 X124.727 Y120.31 Z11.88
G1 Z11.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1869
G1 X124.825 Y120.138 E.00411
G1 X125.241 Y119.636 E.01353
G3 X126.292 Y118.895 I3.023 J3.17 E.02676
G1 X126.86 Y118.681 E.0126
G1 X127.263 Y118.593 E.00855
G1 X127.935 Y118.542 E.01399
G1 X128.304 Y118.562 E.00766
G1 X128.918 Y118.681 E.01297
G3 X130.395 Y119.517 I-1.421 J4.235 E.03541
G3 X131.346 Y120.921 I-3.145 J3.153 E.0354
G1 X131.53 Y121.614 E.01486
G1 X131.579 Y122.132 E.01081
G3 X131.465 Y123.198 I-3.159 J.2 E.02234
G1 X131.206 Y123.869 E.01492
G3 X128.877 Y125.825 I-3.392 J-1.674 E.06493
G1 X128.264 Y125.947 E.01297
G1 X127.638 Y125.955 E.01297
G1 X126.873 Y125.825 E.0161
G3 X125.848 Y125.364 I1.664 J-5.074 E.02335
G1 X125.356 Y124.975 E.01301
G3 X124.474 Y120.753 I2.553 J-2.737 E.09536
G1 X124.697 Y120.362 E.00933
G1 X125.095 Y120.519 F30000
G1 F1869
G1 X125.192 Y120.35 E.00404
G3 X126.209 Y119.414 I2.842 J2.068 E.02886
G1 X126.9 Y119.12 E.01556
G1 X127.294 Y119.016 E.00847
G1 X127.967 Y118.965 E.01399
G1 X128.644 Y119.055 E.01417
G1 X129.338 Y119.303 E.01529
G1 X129.982 Y119.725 E.01598
G1 X130.521 Y120.297 E.0163
G1 X130.876 Y120.903 E.01457
G1 X131.119 Y121.72 E.01768
G1 X131.159 Y122.437 E.01489
G3 X130.979 Y123.336 I-4.246 J-.385 E.01905
G1 X130.759 Y123.829 E.0112
G1 X130.392 Y124.353 E.01327
G1 X130.13 Y124.643 E.00811
G3 X128.789 Y125.41 I-2.525 J-2.861 E.03227
G1 X128.219 Y125.525 E.01205
G1 X127.638 Y125.531 E.01205
G1 X126.961 Y125.41 E.01427
G3 X126.043 Y124.98 I1.508 J-4.422 E.02107
G3 X124.991 Y123.83 I2.209 J-3.075 E.03257
G3 X124.591 Y122.421 I3.246 J-1.683 E.03057
G1 X124.607 Y121.882 E.0112
G3 X124.855 Y120.939 I4.901 J.785 E.02025
G1 X125.066 Y120.571 E.00879
G1 X125.464 Y120.73 F30000
G1 F1869
G1 X125.56 Y120.562 E.004
G1 X125.916 Y120.156 E.01121
G1 X126.436 Y119.774 E.01338
G1 X127.049 Y119.517 E.01378
G1 X127.326 Y119.439 E.00598
G1 X127.999 Y119.388 E.01399
G1 X128.569 Y119.472 E.01195
G1 X129.177 Y119.696 E.01345
G1 X129.738 Y120.072 E.01401
G1 X130.202 Y120.576 E.0142
G1 X130.503 Y121.104 E.0126
G1 X130.709 Y121.827 E.01559
G1 X130.735 Y122.443 E.01279
G1 X130.632 Y123.034 E.01243
G3 X130.297 Y123.781 I-4.388 J-1.518 E.01701
G1 X129.967 Y124.209 E.01121
G3 X129.32 Y124.725 I-3.116 J-3.243 E.0172
G1 X128.829 Y124.952 E.01121
G1 X128.287 Y125.083 E.01157
G1 X127.638 Y125.107 E.01346
G1 X127.05 Y124.995 E.01243
G1 X126.43 Y124.725 E.01401
G1 X125.885 Y124.312 E.01419
G1 X125.453 Y123.781 E.0142
G1 X125.159 Y123.163 E.01419
G3 X125.236 Y121.125 I2.891 J-.91 E.04315
G1 X125.434 Y120.782 E.00822
M204 S250
G1 X125.818 Y120.933 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X125.914 Y120.767 E.0037
G1 X126.265 Y120.394 E.00987
G1 X126.689 Y120.096 E.00999
G3 X127.357 Y119.847 I2.49 J5.659 E.01374
G1 X128.029 Y119.797 E.013
G1 X128.545 Y119.884 E.01008
G1 X129.022 Y120.075 E.0099
G1 X129.503 Y120.407 E.01126
G1 X129.893 Y120.846 E.01132
G1 X130.142 Y121.298 E.00995
G1 X130.312 Y121.93 E.01262
G1 X130.326 Y122.449 E.01001
G1 X130.231 Y122.955 E.00991
G1 X129.998 Y123.49 E.01126
G1 X129.643 Y123.958 E.01132
G1 X129.188 Y124.329 E.01132
G1 X128.657 Y124.581 E.01132
G1 X128.152 Y124.693 E.00997
G1 X127.638 Y124.697 E.00991
G1 X127.135 Y124.595 E.00991
G1 X126.602 Y124.354 E.01126
G1 X126.14 Y123.992 E.01131
G1 X125.776 Y123.531 E.01132
G1 X125.533 Y122.997 E.01131
G1 X125.428 Y122.49 E.00997
G1 X125.44 Y121.907 E.01126
G1 X125.604 Y121.305 E.01202
G1 X125.788 Y120.985 E.00711
; WIPE_START
M204 S10000
G1 X125.914 Y120.767 E-.09569
G1 X126.265 Y120.394 E-.19461
G1 X126.689 Y120.096 E-.19701
G1 X127.357 Y119.847 E-.27068
G1 X127.362 Y119.847 E-.00201
; WIPE_END
G1 E-.04
G17
G3 Z11.88 I-1.205 J.171 P1  F30000
G1 X128.288 Y126.388 Z11.88
G1 Z11.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50199
G1 F1869
G1 X128.966 Y126.262 E.01606
G2 X129.984 Y125.837 I-1.453 J-4.905 E.02574
G1 X130.707 Y125.296 E.02102
G2 X131.619 Y124.053 I-3.492 J-3.521 E.03605
G2 X131.809 Y120.914 I-3.812 J-1.805 E.07503
G1 X131.503 Y120.227 E.01752
G1 X131.237 Y119.807 E.01157
G1 X130.825 Y119.321 E.01484
G2 X130.041 Y118.702 I-2.889 J2.85 E.0233
G1 X129.278 Y118.335 E.01973
G1 X128.353 Y118.117 E.02211
G1 X127.554 Y118.114 E.01862
G2 X126.591 Y118.299 I.105 J3.141 E.02291
G1 X125.928 Y118.575 E.01673
G1 X125.286 Y119.003 E.01796
G2 X124.317 Y120.124 I2.54 J3.176 E.03471
G1 X124.064 Y120.577 E.01208
G1 X123.794 Y121.448 E.02123
G2 X123.722 Y122.498 I6.509 J.972 E.02453
G2 X123.906 Y123.503 I7.42 J-.841 E.02381
G1 X124.288 Y124.36 E.02185
G2 X126.602 Y126.213 I3.769 J-2.336 E.07037
G2 X127.576 Y126.4 I1.446 J-4.888 E.02313
G1 X128.228 Y126.389 E.0152
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F12598.736
G1 X127.576 Y126.4 E-.24806
G1 X127.24 Y126.358 E-.1285
G1 X126.602 Y126.213 E-.24871
G1 X126.274 Y126.078 E-.13473
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/145
; update layer progress
M73 L137
M991 S0 P136 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z11.88 I.731 J.973 P1  F30000
G1 X132.221 Y121.613 Z11.88
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.631582
G1 F1600
G3 X132.271 Y122.136 I-4.888 J.737 E.01559
; LINE_WIDTH: 0.631562
G1 X132.257 Y122.662 E.01558
; LINE_WIDTH: 0.629462
G3 X132.034 Y123.689 I-4.786 J-.503 E.03107
; LINE_WIDTH: 0.627622
G1 X131.831 Y124.175 E.0155
; LINE_WIDTH: 0.628012
G1 X131.571 Y124.635 E.01558
; LINE_WIDTH: 0.631672
G3 X130.903 Y125.443 I-4.013 J-2.637 E.03111
; LINE_WIDTH: 0.627622
G1 X130.499 Y125.781 E.01549
; LINE_WIDTH: 0.627992
G1 X130.057 Y126.07 E.01557
; LINE_WIDTH: 0.631652
G3 X129.092 Y126.479 I-2.345 J-4.184 E.0311
; LINE_WIDTH: 0.627632
G3 X128.056 Y126.645 I-1.226 J-4.326 E.03094
; LINE_WIDTH: 0.627462
G1 X127.505 Y126.635 E.01621
; LINE_WIDTH: 0.630662
G3 X125.546 Y125.984 I.416 J-4.526 E.06161
; LINE_WIDTH: 0.629462
G3 X124.727 Y125.326 I2.588 J-4.06 E.03106
; LINE_WIDTH: 0.631482
G3 X124.076 Y124.472 I3.643 J-3.452 E.03186
; LINE_WIDTH: 0.631612
G3 X123.664 Y123.53 I4.383 J-2.48 E.03052
; LINE_WIDTH: 0.629462
G3 X123.481 Y122.495 I4.62 J-1.35 E.03109
; LINE_WIDTH: 0.630652
G3 X123.862 Y120.443 I4.539 J-.218 E.06228
; LINE_WIDTH: 0.627632
G1 X124.107 Y119.978 E.01549
; LINE_WIDTH: 0.627912
G3 X126.045 Y118.249 I3.879 J2.399 E.07752
; LINE_WIDTH: 0.630832
G3 X127.041 Y117.928 I1.963 J4.384 E.03101
; LINE_WIDTH: 0.635292
G1 X127.546 Y117.869 E.01516
G1 X128.358 Y117.875 E.02419
; LINE_WIDTH: 0.627612
G1 X128.871 Y117.964 E.01534
; LINE_WIDTH: 0.628012
G1 X129.378 Y118.115 E.01558
; LINE_WIDTH: 0.631632
G3 X130.333 Y118.6 I-1.666 J4.466 E.03178
; LINE_WIDTH: 0.627672
G3 X131.446 Y119.677 I-2.924 J4.134 E.04578
; LINE_WIDTH: 0.629452
G3 X131.955 Y120.597 I-3.935 J2.776 E.03109
; LINE_WIDTH: 0.631582
G3 X132.211 Y121.554 I-4.622 J1.752 E.02938
G1 X132.739 Y121.566 F30000
; LINE_WIDTH: 0.449992
G1 F1600
G3 X132.786 Y122.152 I-4.867 J.689 E.0122
G3 X127.431 Y117.359 I-4.908 J.096 E.47256
G3 X128.506 Y117.381 I.29 J11.941 E.0223
G3 X130.678 Y118.219 I-.681 J5.003 E.04874
G3 X132.73 Y121.506 I-2.806 J4.035 E.08261
G1 X133.17 Y121.631 F30000
G1 F1600
G1 X133.172 Y121.637 E.00013
G3 X133.21 Y122.164 I-5.377 J.658 E.01097
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
G3 X127.374 Y116.939 I-5.332 J.084 E.51256
G3 X128.575 Y116.963 I.386 J10.687 E.02493
G3 X130.933 Y117.88 I-.749 J5.416 E.05296
G3 X133.03 Y120.904 I-3.138 J4.415 E.07788
G1 X133.159 Y121.572 E.01411
M204 S250
G1 X133.57 Y121.547 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1600
M204 S5000
G1 X133.579 Y121.6 E.00105
G3 X133.619 Y122.177 I-5.907 J.699 E.01114
G3 X127.442 Y116.517 I-5.744 J.067 E.51468
G1 X128.479 Y116.532 E.01998
G3 X133.494 Y121.081 I-.627 J5.731 E.1395
G1 X133.561 Y121.487 E.00793
; WIPE_START
G1 F1800
M204 S10000
G1 X133.579 Y121.6 E-.04356
G1 X133.619 Y122.177 E-.21949
G1 X133.601 Y122.765 E-.22372
G1 X133.499 Y123.445 E-.26135
G1 X133.491 Y123.475 E-.01188
; WIPE_END
G1 E-.04
G1 X126.351 Y120.776 Z12 F30000
G1 X124.712 Y120.157 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.627912
G1 F1600
G1 X124.861 Y119.942 E.00769
G3 X126.26 Y118.812 I3.089 J2.391 E.05344
; LINE_WIDTH: 0.630832
G3 X127.256 Y118.505 I1.732 J3.854 E.0309
; LINE_WIDTH: 0.626032
G1 X127.929 Y118.458 E.0198
; LINE_WIDTH: 0.624462
G1 X128.319 Y118.476 E.01144
G1 X128.941 Y118.6 E.01856
; LINE_WIDTH: 0.631632
G1 X129.581 Y118.863 E.02048
G1 X130.008 Y119.105 E.01454
; LINE_WIDTH: 0.624782
G1 X130.503 Y119.501 E.01858
; LINE_WIDTH: 0.624472
G1 X130.921 Y119.978 E.01856
; LINE_WIDTH: 0.629452
G3 X131.427 Y120.894 I-3.624 J2.6 E.03095
; LINE_WIDTH: 0.623482
G1 X131.599 Y121.502 E.01848
; LINE_WIDTH: 0.631562
G3 X131.652 Y122.682 I-4.497 J.796 E.03508
; LINE_WIDTH: 0.622902
G1 X131.55 Y123.215 E.01584
; LINE_WIDTH: 0.627622
G1 X131.292 Y123.91 E.02182
; LINE_WIDTH: 0.628012
G1 X131.087 Y124.278 E.0124
G1 X130.721 Y124.763 E.01789
; LINE_WIDTH: 0.625362
G1 X130.466 Y125.029 E.0108
; LINE_WIDTH: 0.624462
M73 P93 R1
G1 X129.97 Y125.423 E.01856
; LINE_WIDTH: 0.631652
G1 X129.353 Y125.742 E.02057
G1 X128.895 Y125.91 E.01445
; LINE_WIDTH: 0.624482
G1 X128.272 Y126.032 E.01857
; LINE_WIDTH: 0.623622
G1 X127.638 Y126.042 E.01853
; LINE_WIDTH: 0.630662
G3 X126.549 Y125.814 I.388 J-4.563 E.03299
; LINE_WIDTH: 0.624782
G1 X125.939 Y125.518 E.01987
; LINE_WIDTH: 0.629462
G3 X125.103 Y124.851 I2.262 J-3.696 E.03164
; LINE_WIDTH: 0.622882
G1 X124.713 Y124.353 E.01846
; LINE_WIDTH: 0.631612
G3 X124.216 Y123.282 I3.842 J-2.435 E.03508
; LINE_WIDTH: 0.622902
G1 X124.109 Y122.75 E.01584
; LINE_WIDTH: 0.630652
G1 X124.088 Y122.014 E.02179
G1 X124.151 Y121.502 E.01524
; LINE_WIDTH: 0.624792
G1 X124.295 Y120.981 E.01583
; LINE_WIDTH: 0.624042
G1 X124.339 Y120.85 E.00404
; LINE_WIDTH: 0.627632
G1 X124.621 Y120.29 E.01846
; LINE_WIDTH: 0.627912
G1 X124.678 Y120.206 E.00298
G1 X125.132 Y120.445 F30000
; LINE_WIDTH: 0.449992
G1 F1600
G1 X125.249 Y120.28 E.00419
G3 X125.585 Y119.89 I2.956 J2.206 E.01069
G1 X126.189 Y119.429 E.01577
G1 X126.441 Y119.292 E.00594
G1 X127.009 Y119.079 E.0126
G1 X127.294 Y119.016 E.00605
G1 X127.967 Y118.965 E.01399
G1 X128.642 Y119.054 E.01412
G1 X128.929 Y119.136 E.00619
G1 X129.484 Y119.383 E.0126
G1 X130.027 Y119.766 E.01378
G1 X130.531 Y120.309 E.01536
G1 X130.876 Y120.903 E.01426
G3 X131.143 Y121.882 I-4.351 J1.71 E.02107
G3 X130.985 Y123.322 I-3.716 J.322 E.03024
G1 X130.752 Y123.854 E.01204
G3 X130.141 Y124.634 I-4.388 J-2.802 E.02058
G1 X129.689 Y124.998 E.01205
G3 X128.789 Y125.41 I-2.6 J-4.501 E.02057
G1 X128.219 Y125.525 E.01205
G1 X127.638 Y125.531 E.01204
G1 X126.883 Y125.385 E.01597
G1 X126.168 Y125.06 E.01629
G1 X125.608 Y124.634 E.01459
G1 X125.117 Y124.041 E.01597
G3 X124.702 Y123.116 I4.029 J-2.367 E.02107
G1 X124.598 Y122.575 E.01142
G3 X124.644 Y121.638 I4.892 J-.23 E.01949
G3 X124.816 Y121.029 I6.874 J1.617 E.01313
G3 X125.075 Y120.534 I3.389 J1.457 E.0116
G1 X125.1 Y120.496 E.00095
G1 X125.507 Y120.659 F30000
G1 F1600
G1 X125.888 Y120.188 E.01256
G1 X126.433 Y119.776 E.01418
G1 X127.067 Y119.51 E.01425
G1 X127.326 Y119.439 E.00557
G1 X127.999 Y119.388 E.01399
G1 X128.566 Y119.472 E.01189
G1 X129.199 Y119.721 E.0141
G1 X129.435 Y119.845 E.00555
G1 X129.858 Y120.176 E.01113
G1 X130.207 Y120.583 E.01112
G1 X130.503 Y121.104 E.01243
G1 X130.697 Y121.751 E.01401
G1 X130.735 Y122.434 E.01419
G1 X130.632 Y123.034 E.01262
G1 X130.43 Y123.542 E.01134
G1 X130.044 Y124.105 E.01416
G1 X129.872 Y124.306 E.00549
G1 X129.456 Y124.644 E.01113
G3 X128.7 Y124.995 I-2.707 J-4.842 E.01728
G1 X128.175 Y125.103 E.01113
G1 X127.638 Y125.107 E.01112
G1 X126.977 Y124.971 E.014
G1 X126.357 Y124.681 E.0142
G1 X125.878 Y124.306 E.01262
G1 X125.453 Y123.781 E.01401
G1 X125.159 Y123.164 E.01419
G1 X125.026 Y122.57 E.01262
G3 X125.053 Y121.751 I4.645 J-.259 E.01701
G3 X125.213 Y121.178 I6.463 J1.503 E.01234
G1 X125.446 Y120.734 E.01041
G1 X125.469 Y120.706 E.00076
M204 S250
G1 X125.818 Y120.91 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1600
M204 S5000
G1 X125.843 Y120.864 E.00102
G1 X126.196 Y120.457 E.01039
G1 X126.669 Y120.11 E.0113
G3 X127.357 Y119.847 I2.135 J4.549 E.01421
G1 X128.029 Y119.797 E.013
G1 X128.545 Y119.884 E.01008
G3 X129.185 Y120.169 I-2.94 J7.464 E.01351
G1 X129.589 Y120.487 E.00991
G1 X129.918 Y120.882 E.0099
G1 X130.155 Y121.328 E.00974
G1 X130.303 Y121.86 E.01064
G1 X130.326 Y122.446 E.01131
G1 X130.231 Y122.955 E.00997
G1 X130.033 Y123.429 E.00991
G3 X129.612 Y123.99 I-6.559 J-4.479 E.01352
G1 X129.207 Y124.316 E.01001
G1 X128.66 Y124.579 E.01171
G1 X128.152 Y124.693 E.01003
G1 X127.638 Y124.697 E.00991
G1 X127.068 Y124.572 E.01126
G1 X126.54 Y124.315 E.01132
G1 X126.138 Y123.99 E.00997
G1 X125.777 Y123.531 E.01126
G1 X125.533 Y122.997 E.01131
G1 X125.428 Y122.49 E.00997
G1 X125.44 Y121.907 E.01126
G3 X125.597 Y121.322 I5.47 J1.15 E.01167
G1 X125.789 Y120.963 E.00785
; CHANGE_LAYER
; Z_HEIGHT: 11.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X125.843 Y120.864 E-.04285
G1 X126.196 Y120.457 E-.20474
G1 X126.669 Y120.11 E-.22278
G1 X127.357 Y119.847 E-.27994
G1 X127.382 Y119.845 E-.00969
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 138/145
; update layer progress
M73 L138
M991 S0 P137 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z12 I-.426 J1.14 P1  F30000
G1 X132.14 Y121.623 Z12
G1 Z11.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.569512
G1 F1588
G1 X132.182 Y122.137 E.01371
G3 X131.956 Y123.644 I-4.795 J.049 E.04067
; LINE_WIDTH: 0.567712
G1 X131.759 Y124.12 E.01366
; LINE_WIDTH: 0.568112
G1 X131.508 Y124.57 E.01367
; LINE_WIDTH: 0.571752
G3 X130.855 Y125.367 I-3.955 J-2.575 E.02755
; LINE_WIDTH: 0.570722
G3 X129.084 Y126.389 I-3.053 J-3.244 E.05497
; LINE_WIDTH: 0.567712
G1 X128.581 Y126.502 E.01365
; LINE_WIDTH: 0.568022
G3 X126.063 Y126.161 I-.682 J-4.435 E.06832
; LINE_WIDTH: 0.567712
G1 X125.608 Y125.918 E.01367
; LINE_WIDTH: 0.570722
G3 X124.173 Y124.461 I2.372 J-3.771 E.05496
; LINE_WIDTH: 0.569502
G3 X123.57 Y122.508 I3.813 J-2.246 E.05486
; LINE_WIDTH: 0.570742
G3 X124.464 Y119.612 I4.389 J-.232 E.08243
; LINE_WIDTH: 0.567682
G1 X124.804 Y119.224 E.01367
; LINE_WIDTH: 0.568062
G3 X126.063 Y118.339 I3.383 J3.47 E.04098
; LINE_WIDTH: 0.571752
G3 X127.042 Y118.019 I1.945 J4.295 E.02754
; LINE_WIDTH: 0.575362
G1 X127.551 Y117.958 E.01378
G1 X128.348 Y117.965 E.02142
; LINE_WIDTH: 0.567702
G1 X128.85 Y118.052 E.01349
; LINE_WIDTH: 0.568112
G1 X129.344 Y118.198 E.01367
; LINE_WIDTH: 0.571752
G3 X130.264 Y118.661 I-1.648 J4.423 E.02754
; LINE_WIDTH: 0.567702
G1 X130.674 Y118.973 E.01366
; LINE_WIDTH: 0.568012
G3 X132.034 Y121.119 I-2.955 J3.376 E.0683
; LINE_WIDTH: 0.567702
G1 X132.128 Y121.564 E.01207
G1 X132.619 Y121.58 F30000
; LINE_WIDTH: 0.449992
G1 F1588
G3 X132.666 Y122.152 I-4.753 J.68 E.0119
G3 X127.445 Y117.478 I-4.788 J.096 E.46113
G3 X128.485 Y117.499 I.274 J12.112 E.02159
G3 X132.61 Y121.521 I-.619 J4.761 E.12815
G1 X133.042 Y121.542 F30000
G1 F1588
G3 X133.09 Y122.164 I-5.168 J.711 E.01295
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
G3 X127.388 Y117.058 I-5.213 J.084 E.50113
G3 X128.555 Y117.081 I.372 J10.677 E.02422
G3 X130.859 Y117.975 I-.71 J5.247 E.05176
G3 X133.034 Y121.483 I-2.985 J4.278 E.088
M204 S250
G1 X133.45 Y121.505 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1588
M204 S5000
G3 X133.499 Y122.177 I-5.576 J.748 E.01298
G3 X127.451 Y116.636 I-5.624 J.068 E.50396
G3 X128.622 Y116.677 I.125 J13.185 E.02258
G3 X131.105 Y117.648 I-.775 J5.645 E.05187
G3 X133.442 Y121.446 I-3.231 J4.605 E.08838
; WIPE_START
G1 F1800
M204 S10000
G1 X133.499 Y122.177 E-.2785
G1 X133.482 Y122.754 E-.21967
G1 X133.382 Y123.42 E-.2559
G1 X133.377 Y123.435 E-.00593
; WIPE_END
G1 E-.04
G1 X126.274 Y120.643 Z12.12 F30000
G1 X124.816 Y120.069 Z12.12
G1 Z11.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.567682
G1 F1588
G1 X125.199 Y119.596 E.01613
; LINE_WIDTH: 0.568062
G3 X126.272 Y118.839 I3.045 J3.177 E.03496
G1 X126.84 Y118.628 E.01606
; LINE_WIDTH: 0.566092
G1 X127.258 Y118.535 E.01132
G1 X127.931 Y118.488 E.01782
; LINE_WIDTH: 0.564582
G1 X128.314 Y118.505 E.0101
G1 X128.933 Y118.628 E.01663
; LINE_WIDTH: 0.571752
G1 X129.569 Y118.89 E.01835
G1 X129.99 Y119.129 E.01292
; LINE_WIDTH: 0.564582
G1 X130.482 Y119.523 E.01662
; LINE_WIDTH: 0.568012
G3 X131.38 Y120.862 I-2.949 J2.947 E.043
; LINE_WIDTH: 0.567702
G3 X131.626 Y121.844 I-3.752 J1.462 E.02691
; LINE_WIDTH: 0.562832
G1 X131.64 Y122.43 E.01538
; LINE_WIDTH: 0.569512
G3 X131.428 Y123.511 I-4.187 J-.26 E.02938
; LINE_WIDTH: 0.564582
G1 X131.17 Y124.087 E.01662
; LINE_WIDTH: 0.571752
G1 X130.774 Y124.649 E.01835
G1 X130.43 Y125.02 E.01352
; LINE_WIDTH: 0.564862
G3 X129.21 Y125.774 I-2.686 J-2.986 E.038
; LINE_WIDTH: 0.567712
G1 X128.481 Y125.969 E.02
; LINE_WIDTH: 0.568022
G3 X126.668 Y125.821 I-.605 J-3.756 E.04869
; LINE_WIDTH: 0.567712
G3 X125.759 Y125.373 I1.311 J-3.809 E.02691
; LINE_WIDTH: 0.564882
G1 X125.238 Y124.942 E.01782
; LINE_WIDTH: 0.570722
G3 X124.558 Y124.047 I3.19 J-3.129 E.03003
; LINE_WIDTH: 0.562912
G1 X124.509 Y123.945 E.00297
G1 X124.298 Y123.448 E.01419
; LINE_WIDTH: 0.569522
G3 X124.11 Y122.407 I4.123 J-1.285 E.02819
; LINE_WIDTH: 0.564892
G3 X124.724 Y120.183 I3.971 J-.1 E.06171
; LINE_WIDTH: 0.567682
G1 X124.778 Y120.116 E.00228
G1 X125.141 Y120.442 F30000
; LINE_WIDTH: 0.449992
G1 F1588
G1 X125.279 Y120.23 E.00525
G1 X125.671 Y119.802 E.01203
G1 X126.186 Y119.431 E.01317
G1 X126.442 Y119.291 E.00605
G1 X127.009 Y119.079 E.01256
G1 X127.294 Y119.016 E.00605
G1 X127.967 Y118.965 E.01399
G1 X128.639 Y119.054 E.01406
G1 X128.93 Y119.137 E.00628
G1 X129.484 Y119.383 E.01257
G1 X130.025 Y119.765 E.01374
G3 X130.578 Y120.377 I-2.225 J2.565 E.01715
G1 X130.933 Y121.046 E.0157
G1 X131.126 Y121.75 E.01516
G3 X130.985 Y123.322 I-3.664 J.462 E.03298
G1 X130.752 Y123.854 E.01205
G3 X130.129 Y124.644 I-4.194 J-2.662 E.02089
G3 X128.788 Y125.41 I-2.532 J-2.874 E.03226
G1 X128.219 Y125.525 E.01205
G1 X127.584 Y125.523 E.01317
G3 X126.789 Y125.354 I.307 J-3.393 E.0169
G1 X126.154 Y125.053 E.01458
G1 X125.55 Y124.575 E.01598
G1 X125.065 Y123.957 E.01629
G1 X124.951 Y123.757 E.00479
G1 X124.748 Y123.279 E.01076
G3 X124.644 Y121.638 I3.615 J-1.052 E.03438
G3 X125.071 Y120.548 I3.739 J.838 E.02438
G1 X125.108 Y120.492 E.00139
G1 X125.491 Y120.677 F30000
G1 F1588
G1 X125.594 Y120.514 E.004
G1 X125.955 Y120.118 E.01111
G1 X126.43 Y119.778 E.01212
G1 X127.044 Y119.519 E.01381
G1 X127.326 Y119.439 E.00609
G1 X127.999 Y119.388 E.01399
G1 X128.563 Y119.471 E.01184
G1 X129.199 Y119.721 E.01416
G1 X129.436 Y119.845 E.00555
G1 X129.858 Y120.176 E.01112
G1 X130.232 Y120.624 E.01212
G1 X130.55 Y121.23 E.01419
G1 X130.713 Y121.845 E.01319
G1 X130.735 Y122.443 E.01243
G1 X130.632 Y123.034 E.01243
G1 X130.431 Y123.539 E.01128
G1 X130.046 Y124.103 E.01416
G1 X129.865 Y124.312 E.00573
G1 X129.443 Y124.649 E.0112
G3 X128.7 Y124.995 I-2.385 J-4.146 E.01701
G1 X128.175 Y125.103 E.01113
G1 X127.591 Y125.099 E.01212
G1 X126.923 Y124.95 E.01418
G1 X126.349 Y124.676 E.0132
G1 X125.824 Y124.251 E.01402
G1 X125.408 Y123.708 E.0142
G1 X125.341 Y123.59 E.00282
G1 X125.133 Y123.095 E.01112
G1 X125.026 Y122.57 E.01113
G3 X125.053 Y121.751 I4.665 J-.258 E.01701
G1 X125.197 Y121.23 E.01121
G3 X125.442 Y120.755 I4.37 J1.955 E.0111
G1 X125.459 Y120.728 E.00067
M204 S250
G1 X125.834 Y120.893 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M73 P94 R1
G1 F1588
M204 S5000
G1 X125.872 Y120.823 E.00153
G1 X126.214 Y120.436 E.00995
G1 X126.666 Y120.112 E.01071
G3 X127.357 Y119.847 I2.274 J4.886 E.01428
G1 X128.029 Y119.797 E.013
G1 X128.545 Y119.884 E.01008
G3 X129.185 Y120.169 I-2.946 J7.477 E.01352
G1 X129.591 Y120.489 E.00996
G1 X129.934 Y120.906 E.01041
G1 X130.182 Y121.407 E.01077
G1 X130.314 Y121.936 E.0105
G1 X130.326 Y122.449 E.00991
G1 X130.231 Y122.955 E.00991
G1 X130.033 Y123.429 E.00991
G3 X129.61 Y123.992 I-6.165 J-4.192 E.01357
G1 X129.187 Y124.329 E.01041
G1 X128.657 Y124.581 E.01132
G1 X128.152 Y124.693 E.00997
G1 X127.597 Y124.69 E.01071
G1 X127.026 Y124.554 E.0113
G1 X126.538 Y124.313 E.0105
G1 X126.089 Y123.939 E.01127
G1 X125.717 Y123.429 E.01216
G1 X125.521 Y122.963 E.00974
G1 X125.424 Y122.457 E.00994
G1 X125.44 Y121.906 E.01061
G1 X125.591 Y121.339 E.01132
G1 X125.806 Y120.946 E.00864
; CHANGE_LAYER
; Z_HEIGHT: 11.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X125.872 Y120.823 E-.0529
G1 X126.214 Y120.436 E-.19621
G1 X126.666 Y120.112 E-.21112
G1 X127.357 Y119.847 E-.28129
G1 X127.405 Y119.843 E-.01848
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 139/145
; update layer progress
M73 L139
M991 S0 P138 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z12.12 I-.438 J1.135 P1  F30000
G1 X132.051 Y121.635 Z12.12
G1 Z11.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.509562
G1 F1563
G1 X132.093 Y122.138 E.01194
G3 X131.834 Y123.706 I-4.57 J.053 E.03779
; LINE_WIDTH: 0.505792
G1 X131.537 Y124.332 E.01624
; LINE_WIDTH: 0.510792
G1 X131.143 Y124.918 E.01676
G3 X129.073 Y126.298 I-3.37 J-2.812 E.05982
; LINE_WIDTH: 0.507782
G1 X128.581 Y126.41 E.01189
; LINE_WIDTH: 0.508122
G3 X126.147 Y126.094 I-.681 J-4.288 E.05869
; LINE_WIDTH: 0.504072
G1 X125.645 Y125.834 E.01322
; LINE_WIDTH: 0.509572
G3 X124.857 Y125.203 I2.512 J-3.937 E.02393
; LINE_WIDTH: 0.511682
G3 X123.66 Y122.488 I3.125 J-3 E.07195
; LINE_WIDTH: 0.509582
G3 X123.745 Y121.398 I4.316 J-.212 E.02594
; LINE_WIDTH: 0.504982
G1 X123.951 Y120.704 E.01694
; LINE_WIDTH: 0.508742
G3 X124.535 Y119.672 I3.977 J1.571 E.0281
; LINE_WIDTH: 0.511832
G3 X125.243 Y118.948 I3.523 J2.735 E.0241
; LINE_WIDTH: 0.510822
G3 X127.059 Y118.107 I2.694 J3.434 E.0479
; LINE_WIDTH: 0.515452
G1 X127.556 Y118.048 E.01198
G1 X128.32 Y118.054 E.0183
; LINE_WIDTH: 0.510802
G3 X130.213 Y118.735 I-.482 J4.311 E.04813
; LINE_WIDTH: 0.507762
G3 X131.299 Y119.78 I-2.79 J3.985 E.03567
; LINE_WIDTH: 0.510782
G3 X132.042 Y121.576 I-3.56 J2.525 E.04647
G1 X132.497 Y121.595 F30000
; LINE_WIDTH: 0.449992
G1 F1563
G3 X132.546 Y122.152 I-4.698 J.694 E.0116
G1 X132.498 Y122.887 E.0153
G3 X131.809 Y124.773 I-5.131 J-.805 E.0419
G3 X125.94 Y126.495 I-3.924 J-2.512 E.1384
G3 X123.306 Y121.29 I1.946 J-4.254 E.13063
G1 X123.53 Y120.547 E.01612
G1 X123.792 Y119.978 E.01298
G1 X124.183 Y119.384 E.01476
G3 X127.926 Y117.596 I3.635 J2.801 E.08928
G3 X130.97 Y118.753 I.02 J4.531 E.06907
G3 X132.488 Y121.536 I-3.171 J3.536 E.06705
G1 X132.922 Y121.557 F30000
G1 F1563
G3 X132.97 Y122.164 I-5.062 J.71 E.01266
G3 X132.17 Y124.999 I-5.261 J.044 E.06193
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
G3 X125.869 Y126.936 I-4.298 J-2.765 E.14859
G1 X125.19 Y126.585 E.01586
G3 X123.424 Y119.765 I2.713 J-4.341 E.16115
G1 X123.844 Y119.126 E.01585
G3 X127.932 Y117.172 I3.972 J3.057 E.09753
G1 X128.56 Y117.203 E.01303
G3 X132.913 Y121.497 I-.7 J5.063 E.13596
M204 S250
G1 X133.33 Y121.52 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1563
M204 S5000
G3 X133.379 Y122.177 I-5.469 J.746 E.0127
G3 X132.902 Y124.499 I-5.324 J.116 E.04608
G1 X132.517 Y125.217 E.01571
G3 X125.702 Y127.31 I-4.639 J-2.965 E.14948
G1 X124.977 Y126.935 E.01572
G3 X123.07 Y119.559 I2.928 J-4.692 E.162
G1 X123.518 Y118.878 E.01571
G3 X127.46 Y116.756 I4.412 J3.473 E.08877
G3 X128.627 Y116.799 I.137 J11.962 E.02251
G3 X133.321 Y121.46 I-.766 J5.466 E.13673
; WIPE_START
G1 F1800
M204 S10000
G1 X133.379 Y122.177 E-.27303
G1 X133.362 Y122.744 E-.21558
G1 X133.264 Y123.395 E-.25046
G1 X133.25 Y123.448 E-.02093
; WIPE_END
G1 E-.04
G1 X126.142 Y120.667 Z12.24 F30000
G1 X124.795 Y120.14 Z12.24
G1 Z11.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.508392
G1 F1563
G1 X124.916 Y119.966 E.005
G3 X125.31 Y119.532 I3.01 J2.329 E.01386
; LINE_WIDTH: 0.505262
G1 X125.595 Y119.286 E.00882
; LINE_WIDTH: 0.504992
G3 X126.872 Y118.649 I2.387 J3.182 E.03361
; LINE_WIDTH: 0.506142
G1 X127.261 Y118.565 E.00935
G1 X127.934 Y118.518 E.01584
; LINE_WIDTH: 0.504962
G3 X129.688 Y118.98 I-.024 J3.65 E.04295
; LINE_WIDTH: 0.507762
G1 X130.301 Y119.405 E.01757
G1 X130.608 Y119.699 E.01003
G1 X130.992 Y120.178 E.01447
; LINE_WIDTH: 0.504962
G1 X131.309 Y120.772 E.01577
; LINE_WIDTH: 0.510812
G3 X131.596 Y121.847 I-4.132 J1.677 E.02646
; LINE_WIDTH: 0.502912
G1 X131.61 Y122.43 E.01361
; LINE_WIDTH: 0.509562
G3 X131.392 Y123.52 I-4.093 J-.252 E.02636
; LINE_WIDTH: 0.505792
G1 X131.17 Y124.012 E.01268
; LINE_WIDTH: 0.504972
G3 X129.197 Y125.746 I-3.29 J-1.753 E.06289
; LINE_WIDTH: 0.507782
G1 X128.477 Y125.939 E.01757
; LINE_WIDTH: 0.508122
G3 X126.675 Y125.792 I-.601 J-3.74 E.04305
; LINE_WIDTH: 0.506772
G1 X125.946 Y125.453 E.0189
; LINE_WIDTH: 0.503162
G1 X125.322 Y124.982 E.01825
; LINE_WIDTH: 0.511682
G3 X124.618 Y124.093 I3.256 J-3.302 E.02702
; LINE_WIDTH: 0.503602
G1 X124.359 Y123.519 E.0147
; LINE_WIDTH: 0.511682
G3 X124.135 Y122.385 I4.3 J-1.438 E.02754
; LINE_WIDTH: 0.502952
G1 X124.158 Y121.846 E.01259
; LINE_WIDTH: 0.510822
G1 X124.309 Y121.142 E.01707
G1 X124.395 Y120.871 E.00675
; LINE_WIDTH: 0.500552
G1 X124.702 Y120.274 E.01559
; LINE_WIDTH: 0.508392
G1 X124.761 Y120.189 E.00243
G1 X125.213 Y120.348 F30000
; LINE_WIDTH: 0.449992
G1 F1563
G1 X125.562 Y119.927 E.01136
G1 X125.844 Y119.663 E.00801
G1 X126.295 Y119.366 E.01121
G1 X126.881 Y119.124 E.01315
G1 X127.294 Y119.016 E.00886
G1 X127.967 Y118.965 E.01399
G1 X128.243 Y118.982 E.00574
G3 X129.695 Y119.51 I-.556 J3.793 E.03226
G1 X130.151 Y119.869 E.01204
G1 X130.531 Y120.309 E.01205
G1 X130.908 Y120.98 E.01597
G1 X131.123 Y121.735 E.01629
G1 X131.159 Y122.437 E.01457
G3 X130.979 Y123.336 I-4.252 J-.386 E.01905
G3 X130.129 Y124.644 I-3.504 J-1.346 E.03258
G3 X128.789 Y125.41 I-2.533 J-2.877 E.03226
G1 X128.219 Y125.525 E.01205
G1 X127.588 Y125.523 E.01309
G3 X126.789 Y125.354 I.305 J-3.407 E.01698
G1 X126.154 Y125.053 E.01458
G1 X125.609 Y124.634 E.01426
G3 X124.991 Y123.83 I3.374 J-3.229 E.02107
G3 X124.587 Y122.339 I3.435 J-1.732 E.03226
G1 X124.614 Y121.789 E.01141
G3 X124.816 Y121.029 I10.059 J2.268 E.01632
G1 X125.098 Y120.487 E.01268
G1 X125.174 Y120.394 E.00249
G1 X125.537 Y120.611 F30000
G1 F1563
G1 X125.877 Y120.211 E.01089
G3 X126.078 Y120.017 I3.318 J3.237 E.00578
G1 X126.529 Y119.72 E.01121
G3 X127.326 Y119.439 I1.767 J3.746 E.01756
G1 X127.999 Y119.388 E.01399
G3 X128.829 Y119.547 I-.392 J4.295 E.01756
G1 X129.32 Y119.775 E.01121
G1 X129.764 Y120.099 E.01141
G1 X130.207 Y120.583 E.01362
G1 X130.532 Y121.175 E.01401
G1 X130.711 Y121.836 E.0142
G1 X130.735 Y122.443 E.01261
G1 X130.632 Y123.034 E.01243
G1 X130.372 Y123.657 E.01401
G3 X129.865 Y124.312 I-3.842 J-2.448 E.0172
G1 X129.443 Y124.649 E.01121
G3 X128.7 Y124.995 I-2.392 J-4.16 E.01701
G1 X128.175 Y125.103 E.01113
G1 X127.594 Y125.099 E.01204
G1 X126.919 Y124.949 E.01434
G1 X126.349 Y124.677 E.01311
G1 X125.878 Y124.306 E.01243
G1 X125.453 Y123.782 E.01401
G1 X125.159 Y123.163 E.0142
G1 X125.02 Y122.493 E.01419
G1 X125.032 Y121.885 E.01262
G3 X125.214 Y121.178 I8.751 J1.875 E.01515
G1 X125.471 Y120.688 E.01149
G1 X125.498 Y120.656 E.00086
M204 S250
G1 X125.839 Y120.869 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1563
M204 S5000
G1 X125.84 Y120.867 E.00006
G3 X126.303 Y120.359 I6.481 J5.44 E.01325
G1 X126.754 Y120.061 E.01042
G1 X127.305 Y119.858 E.01131
G1 X128.029 Y119.797 E.01401
G1 X128.612 Y119.904 E.01143
G1 X129.148 Y120.146 E.01132
G1 X129.559 Y120.458 E.00996
G1 X129.895 Y120.848 E.00991
G1 X130.169 Y121.364 E.01126
G1 X130.313 Y121.933 E.01132
G1 X130.326 Y122.449 E.00996
G1 X130.231 Y122.955 E.00991
G1 X129.998 Y123.49 E.01126
G1 X129.643 Y123.958 E.01132
G1 X129.187 Y124.329 E.01132
G1 X128.657 Y124.581 E.01131
G1 X128.152 Y124.693 E.00997
G1 X127.6 Y124.69 E.01064
G1 X127.022 Y124.553 E.01145
G1 X126.538 Y124.313 E.01042
G1 X126.138 Y123.99 E.00991
G1 X125.777 Y123.531 E.01126
G1 X125.533 Y122.997 E.01132
G1 X125.422 Y122.42 E.01131
G1 X125.44 Y121.904 E.00997
G3 X125.597 Y121.322 I5.556 J1.18 E.01161
G1 X125.811 Y120.922 E.00874
; CHANGE_LAYER
; Z_HEIGHT: 11.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X125.84 Y120.867 E-.02393
G1 X126.303 Y120.359 E-.2611
G1 X126.754 Y120.061 E-.20541
G1 X127.305 Y119.858 E-.22299
G1 X127.427 Y119.848 E-.04657
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 140/145
; update layer progress
M73 L140
M991 S0 P139 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z12.24 I-.447 J1.132 P1  F30000
G1 X131.952 Y121.635 Z12.24
G1 Z11.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.451742
G1 F1537
G3 X132.002 Y122.139 I-4.388 J.683 E.01055
; LINE_WIDTH: 0.451722
G1 X131.964 Y122.804 E.01388
; LINE_WIDTH: 0.444852
G1 X131.789 Y123.573 E.01616
; LINE_WIDTH: 0.447882
G1 X131.597 Y124.042 E.01045
; LINE_WIDTH: 0.448372
G1 X131.349 Y124.483 E.01047
G1 X130.854 Y125.106 E.01643
G3 X129.961 Y125.813 I-2.97 J-2.839 E.0236
; LINE_WIDTH: 0.451892
G3 X129.045 Y126.212 I-2.22 J-3.841 E.02086
; LINE_WIDTH: 0.447882
G3 X128.047 Y126.376 I-1.165 J-3.967 E.02093
G1 X127.241 Y126.327 E.01668
; LINE_WIDTH: 0.445072
G1 X126.689 Y126.203 E.01159
; LINE_WIDTH: 0.449022
G3 X125.709 Y125.767 I1.245 J-4.12 E.02225
; LINE_WIDTH: 0.449632
G1 X125.291 Y125.47 E.01063
G1 X124.776 Y124.972 E.01484
; LINE_WIDTH: 0.444682
G1 X124.353 Y124.406 E.01448
; LINE_WIDTH: 0.449642
G3 X123.75 Y122.403 I3.533 J-2.155 E.04383
; LINE_WIDTH: 0.445062
G1 X123.786 Y121.69 E.01463
; LINE_WIDTH: 0.450882
G1 X123.926 Y121.045 E.01372
G1 X124.096 Y120.581 E.01028
; LINE_WIDTH: 0.447902
G1 X124.329 Y120.131 E.01045
; LINE_WIDTH: 0.448402
G1 X124.616 Y119.714 E.01047
G1 X125.164 Y119.137 E.01643
; LINE_WIDTH: 0.447892
G1 X125.693 Y118.743 E.01362
G1 X126.118 Y118.513 E.00998
; LINE_WIDTH: 0.451922
G3 X127.064 Y118.199 I1.885 J4.096 E.02082
; LINE_WIDTH: 0.453112
G1 X127.561 Y118.136 E.01045
G1 X128.252 Y118.142 E.01444
; LINE_WIDTH: 0.448222
G3 X129.246 Y118.354 I-.297 J3.819 E.02106
; LINE_WIDTH: 0.451932
G3 X130.141 Y118.795 I-1.532 J4.242 E.02082
; LINE_WIDTH: 0.447872
G3 X130.911 Y119.45 I-2.273 J3.454 E.02092
G1 X131.382 Y120.076 E.01617
; LINE_WIDTH: 0.442982
G1 X131.651 Y120.581 E.01169
; LINE_WIDTH: 0.451742
G3 X131.943 Y121.576 I-4.087 J1.737 E.02164
G1 X132.381 Y121.609 F30000
; LINE_WIDTH: 0.449992
G1 F1537
G3 X132.426 Y122.152 I-4.512 J.647 E.01131
G3 X127.472 Y117.716 I-4.549 J.096 E.43827
G3 X128.413 Y117.73 I.251 J14.778 E.01954
G3 X132.373 Y121.549 I-.543 J4.525 E.1225
G1 X132.804 Y121.571 F30000
G1 F1537
G3 X132.851 Y122.164 I-4.936 J.686 E.01236
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
G3 X127.415 Y117.296 I-4.973 J.084 E.47827
G3 X128.483 Y117.312 I.362 J11.558 E.02216
G3 X130.714 Y118.166 I-.653 J5.049 E.05003
G3 X132.795 Y121.511 I-2.846 J4.09 E.08402
M204 S250
G1 X133.208 Y121.559 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1537
M204 S5000
G1 X133.221 Y121.633 E.00144
G3 X133.26 Y122.177 I-5.414 J.655 E.01052
G3 X127.469 Y116.876 I-5.384 J.068 E.48253
G3 X128.55 Y116.908 I.017 J17.38 E.02084
G3 X130.96 Y117.838 I-.717 J5.443 E.05027
G3 X133.082 Y120.904 I-3.152 J4.45 E.07335
G1 X133.197 Y121.5 E.0117
; WIPE_START
G1 F1800
M204 S10000
G1 X133.221 Y121.633 E-.05123
G1 X133.26 Y122.177 E-.20721
G1 X133.243 Y122.733 E-.21145
G1 X133.147 Y123.37 E-.245
G1 X133.115 Y123.485 E-.04511
; WIPE_END
G1 E-.04
G1 X126.034 Y120.636 Z12.36 F30000
G1 X124.826 Y120.15 Z12.36
G1 Z11.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.448402
G1 F1537
G1 X124.932 Y119.994 E.0039
G1 X125.333 Y119.551 E.01234
; LINE_WIDTH: 0.445192
G1 X125.594 Y119.323 E.00711
; LINE_WIDTH: 0.444802
G1 X126.116 Y118.98 E.01279
; LINE_WIDTH: 0.451922
G1 X126.74 Y118.726 E.01405
G1 X127.241 Y118.597 E.01078
; LINE_WIDTH: 0.445552
G1 X127.847 Y118.546 E.01248
; LINE_WIDTH: 0.448212
G1 X128.275 Y118.565 E.00885
G1 X128.916 Y118.686 E.01348
; LINE_WIDTH: 0.451932
G1 X129.539 Y118.943 E.01405
G1 X129.953 Y119.176 E.0099
; LINE_WIDTH: 0.444792
G1 X130.441 Y119.566 E.0128
G1 X130.852 Y120.036 E.01279
G1 X131.247 Y120.704 E.0159
; LINE_WIDTH: 0.451742
G3 X131.558 Y121.782 I-4.256 J1.81 E.02344
; LINE_WIDTH: 0.443642
G1 X131.58 Y122.409 E.01281
; LINE_WIDTH: 0.449622
G3 X131.373 Y123.487 I-4.083 J-.225 E.02283
; LINE_WIDTH: 0.444802
G1 X131.118 Y124.058 E.01281
; LINE_WIDTH: 0.451912
G1 X130.729 Y124.608 E.01404
G1 X130.409 Y124.96 E.00989
; LINE_WIDTH: 0.445052
G1 X129.93 Y125.341 E.01255
; LINE_WIDTH: 0.451892
G1 X129.321 Y125.658 E.0143
G1 X128.877 Y125.822 E.00988
; LINE_WIDTH: 0.444802
G1 X128.263 Y125.942 E.01281
G1 X127.638 Y125.952 E.0128
; LINE_WIDTH: 0.450862
G3 X126.587 Y125.732 I.415 J-4.6 E.02239
; LINE_WIDTH: 0.444232
M73 P95 R1
G1 X125.979 Y125.437 E.01382
; LINE_WIDTH: 0.449632
G3 X125.17 Y124.793 I2.231 J-3.629 E.02149
; LINE_WIDTH: 0.445522
G1 X124.736 Y124.223 E.01469
; LINE_WIDTH: 0.449642
G3 X124.303 Y123.26 I3.56 J-2.182 E.02194
; LINE_WIDTH: 0.442962
G1 X124.197 Y122.733 E.01098
; LINE_WIDTH: 0.450862
G1 X124.178 Y122.022 E.01478
G1 X124.237 Y121.526 E.01037
; LINE_WIDTH: 0.445092
G1 X124.382 Y121.005 E.01108
; LINE_WIDTH: 0.447902
G1 X124.696 Y120.34 E.0152
; LINE_WIDTH: 0.448402
G1 X124.792 Y120.199 E.00351
G1 X125.171 Y120.389 F30000
; LINE_WIDTH: 0.449992
G1 F1537
G1 X125.247 Y120.277 E.0028
G1 X125.646 Y119.834 E.01238
G1 X126.172 Y119.44 E.01362
G1 X126.451 Y119.288 E.00658
G1 X127.009 Y119.079 E.01238
G1 X127.279 Y119.017 E.00574
G1 X127.884 Y118.963 E.01261
G1 X128.643 Y119.055 E.01585
G1 X128.939 Y119.14 E.00638
G1 X129.484 Y119.383 E.01238
G1 X130.021 Y119.762 E.01363
G3 X130.613 Y120.42 I-2.395 J2.748 E.01841
G3 X131.143 Y121.882 I-3.304 J2.024 E.03247
G3 X130.985 Y123.322 I-3.716 J.322 E.03024
G1 X130.751 Y123.854 E.01205
G3 X130.141 Y124.634 I-4.455 J-2.855 E.02057
G1 X129.697 Y124.994 E.01187
G3 X128.789 Y125.41 I-2.624 J-4.524 E.02074
G1 X128.219 Y125.525 E.01206
G1 X127.638 Y125.531 E.01205
G1 X126.882 Y125.385 E.01597
G1 X126.168 Y125.06 E.01628
G1 X125.609 Y124.634 E.01458
G1 X125.074 Y123.97 E.01767
G1 X124.765 Y123.322 E.0149
G3 X124.591 Y122.422 I4.082 J-1.255 E.01905
G1 X124.607 Y121.882 E.0112
G3 X124.788 Y121.117 I8.333 J1.564 E.01629
G1 X125.069 Y120.54 E.01332
G1 X125.137 Y120.439 E.00254
G1 X125.554 Y120.605 F30000
G1 F1537
G1 X125.876 Y120.213 E.01051
G1 X126.07 Y120.022 E.00565
G1 X126.515 Y119.723 E.01112
G3 X127.317 Y119.44 I2.06 J4.553 E.01766
G1 X127.922 Y119.385 E.01261
G1 X128.574 Y119.474 E.01363
G1 X129.194 Y119.719 E.01384
G1 X129.436 Y119.845 E.00566
G1 X129.858 Y120.176 E.01113
G1 X130.207 Y120.583 E.01112
G1 X130.503 Y121.104 E.01244
G1 X130.697 Y121.751 E.01401
G1 X130.735 Y122.434 E.01419
G1 X130.632 Y123.034 E.01262
G1 X130.433 Y123.534 E.01117
G1 X130.049 Y124.099 E.01416
G1 X129.872 Y124.306 E.00566
G1 X129.46 Y124.642 E.01102
G3 X128.701 Y124.995 I-2.745 J-4.905 E.01738
G1 X128.175 Y125.103 E.01114
G1 X127.638 Y125.107 E.01113
G1 X126.977 Y124.971 E.01401
G1 X126.357 Y124.681 E.01419
G1 X125.878 Y124.306 E.01262
G1 X125.414 Y123.716 E.01558
G1 X125.155 Y123.155 E.01281
G1 X125.026 Y122.57 E.01243
G3 X125.053 Y121.751 I4.687 J-.257 E.017
G1 X125.197 Y121.23 E.01121
G1 X125.443 Y120.741 E.01136
G1 X125.516 Y120.651 E.00241
M204 S250
G1 X125.857 Y120.853 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1537
M204 S5000
G1 X126.301 Y120.36 E.01278
G1 X126.734 Y120.072 E.01002
G1 X127.302 Y119.859 E.01171
G1 X127.959 Y119.793 E.01273
G1 X128.506 Y119.877 E.01068
G3 X129.185 Y120.169 I-2.117 J5.864 E.01425
G1 X129.589 Y120.487 E.00991
G1 X129.918 Y120.881 E.0099
G1 X130.155 Y121.328 E.00975
G1 X130.303 Y121.86 E.01064
G1 X130.326 Y122.446 E.01131
G1 X130.231 Y122.955 E.00997
G1 X130.033 Y123.429 E.00992
G3 X129.612 Y123.99 I-6.759 J-4.63 E.01351
G1 X129.207 Y124.316 E.01002
G1 X128.66 Y124.579 E.0117
G1 X128.152 Y124.693 E.01003
G1 X127.638 Y124.697 E.00991
G1 X127.068 Y124.572 E.01126
G1 X126.54 Y124.315 E.01131
G1 X126.138 Y123.99 E.00997
G1 X125.741 Y123.47 E.01261
G1 X125.531 Y122.994 E.01003
G1 X125.428 Y122.49 E.00991
G1 X125.44 Y121.907 E.01126
G1 X125.591 Y121.339 E.01132
G1 X125.822 Y120.901 E.00954
; CHANGE_LAYER
; Z_HEIGHT: 12.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X126.301 Y120.36 E-.27452
G1 X126.734 Y120.072 E-.1975
G1 X127.302 Y119.859 E-.23078
G1 X127.452 Y119.844 E-.0572
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 141/145
; update layer progress
M73 L141
M991 S0 P140 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z12.36 I-.458 J1.128 P1  F30000
G1 X131.87 Y121.636 Z12.36
G1 Z12.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.393702
G1 F1513
G1 X131.911 Y122.14 E.00909
G1 X131.875 Y122.788 E.01168
; LINE_WIDTH: 0.383162
G1 X131.749 Y123.388 E.01072
; LINE_WIDTH: 0.387942
G1 X131.52 Y123.993 E.01146
; LINE_WIDTH: 0.388482
G1 X131.28 Y124.424 E.00875
; LINE_WIDTH: 0.391822
G3 X130.602 Y125.227 I-3.506 J-2.273 E.01886
; LINE_WIDTH: 0.385192
G1 X129.905 Y125.745 E.01526
; LINE_WIDTH: 0.390922
G3 X128.947 Y126.144 I-2.112 J-3.716 E.01857
; LINE_WIDTH: 0.384992
G1 X128.13 Y126.28 E.01455
; LINE_WIDTH: 0.384892
G1 X127.584 Y126.281 E.00959
; LINE_WIDTH: 0.389692
G1 X127.078 Y126.21 E.00908
G1 X126.438 Y126.021 E.01189
; LINE_WIDTH: 0.383772
G1 X125.759 Y125.694 E.01318
; LINE_WIDTH: 0.391772
G1 X125.345 Y125.397 E.00913
G1 X124.846 Y124.916 E.01239
; LINE_WIDTH: 0.384902
G1 X124.411 Y124.332 E.0128
; LINE_WIDTH: 0.389662
G1 X124.181 Y123.883 E.00897
G1 X123.969 Y123.268 E.01158
; LINE_WIDTH: 0.384772
G1 X123.842 Y122.507 E.01354
; LINE_WIDTH: 0.390912
G3 X123.918 Y121.443 I4.194 J-.233 E.0191
; LINE_WIDTH: 0.385282
G1 X124.119 Y120.768 E.01238
; LINE_WIDTH: 0.387922
G1 X124.401 Y120.187 E.01146
G1 X124.649 Y119.819 E.00785
; LINE_WIDTH: 0.388162
G3 X125.317 Y119.124 I3.139 J2.347 E.01713
; LINE_WIDTH: 0.388502
G3 X126.187 Y118.579 I2.497 J3.025 E.01825
G1 X126.926 Y118.325 E.01385
; LINE_WIDTH: 0.393202
G1 X127.565 Y118.226 E.01162
G1 X128.242 Y118.232 E.01216
; LINE_WIDTH: 0.388362
G3 X129.167 Y118.423 I-.27 J3.638 E.0168
; LINE_WIDTH: 0.384892
G1 X129.674 Y118.63 E.00961
; LINE_WIDTH: 0.390912
G1 X130.109 Y118.885 E.00901
G1 X130.719 Y119.385 E.01408
; LINE_WIDTH: 0.385002
G1 X131.142 Y119.869 E.01129
; LINE_WIDTH: 0.389662
G1 X131.408 Y120.293 E.0089
G1 X131.674 Y120.885 E.01156
; LINE_WIDTH: 0.384922
G1 X131.855 Y121.578 E.01257
G1 X132.266 Y121.651 F30000
; LINE_WIDTH: 0.449992
G1 F1513
G3 X132.307 Y122.152 I-4.403 J.611 E.01043
G3 X126.043 Y118.213 I-4.43 J.096 E.39593
G1 X126.828 Y117.948 E.01717
G1 X127.484 Y117.835 E.01382
G3 X128.401 Y117.85 I.219 J15.505 E.01903
G3 X132.257 Y121.592 I-.539 J4.413 E.11967
G1 X132.688 Y121.613 F30000
G1 F1513
G3 X132.731 Y122.165 I-4.825 J.648 E.01149
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
G3 X127.428 Y117.415 I-4.853 J.083 E.46683
G3 X128.471 Y117.431 I.341 J11.712 E.02165
G3 X132.68 Y121.554 I-.608 J4.83 E.13125
M204 S250
G1 X133.085 Y121.549 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1513
M204 S5000
G1 X133.104 Y121.648 E.00193
G3 X133.14 Y122.177 I-5.255 J.622 E.01024
G3 X127.478 Y116.995 I-5.264 J.067 E.47181
G1 X128.434 Y117.01 E.01844
G3 X133.011 Y121.106 I-.586 J5.259 E.12629
G1 X133.075 Y121.49 E.00751
; WIPE_START
G1 F1800
M204 S10000
G1 X133.104 Y121.648 E-.06086
G1 X133.14 Y122.177 E-.20181
G1 X133.123 Y122.728 E-.20922
G1 X133.03 Y123.345 E-.23731
G1 X132.994 Y123.474 E-.0508
; WIPE_END
G1 E-.04
G1 X125.93 Y120.583 Z12.48 F30000
G1 X124.865 Y120.146 Z12.48
G1 Z12.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.388322
G1 F1513
M73 P95 R0
G1 X124.959 Y120.009 E.00295
G3 X125.984 Y119.094 I2.952 J2.274 E.0245
; LINE_WIDTH: 0.388552
G3 X126.871 Y118.712 I1.922 J3.248 E.01719
; LINE_WIDTH: 0.385742
G1 X127.244 Y118.627 E.00672
G1 X127.849 Y118.576 E.0107
; LINE_WIDTH: 0.388432
G1 X128.277 Y118.595 E.0076
G1 X128.907 Y118.714 E.01136
; LINE_WIDTH: 0.384832
G1 X129.486 Y118.941 E.01092
; LINE_WIDTH: 0.390912
G3 X130.371 Y119.542 I-2.113 J4.061 E.01914
; LINE_WIDTH: 0.385262
G1 X130.816 Y120.039 E.01173
; LINE_WIDTH: 0.389662
G3 X131.314 Y120.933 I-3.46 J2.512 E.01825
; LINE_WIDTH: 0.383062
G1 X131.466 Y121.447 E.00936
; LINE_WIDTH: 0.393702
G1 X131.543 Y122.142 E.01258
G1 X131.534 Y122.665 E.0094
; LINE_WIDTH: 0.383052
G1 X131.432 Y123.191 E.00937
; LINE_WIDTH: 0.387942
G1 X131.185 Y123.853 E.01251
; LINE_WIDTH: 0.388482
G3 X130.625 Y124.691 I-3.317 J-1.612 E.01793
; LINE_WIDTH: 0.385222
G3 X129.172 Y125.692 I-2.731 J-2.409 E.03133
; LINE_WIDTH: 0.387982
G1 X128.47 Y125.88 E.01287
G1 X128.053 Y125.924 E.00742
; LINE_WIDTH: 0.387792
G1 X127.447 Y125.907 E.01074
; LINE_WIDTH: 0.383132
G1 X126.88 Y125.792 E.0101
; LINE_WIDTH: 0.391762
G3 X125.867 Y125.336 I1.369 J-4.397 E.01994
; LINE_WIDTH: 0.383772
G1 X125.376 Y124.949 E.01094
; LINE_WIDTH: 0.393622
G3 X124.638 Y124.006 I3.317 J-3.357 E.0216
; LINE_WIDTH: 0.382952
G1 X124.406 Y123.475 E.01012
; LINE_WIDTH: 0.389702
G3 X124.199 Y122.41 I3.822 J-1.292 E.01937
; LINE_WIDTH: 0.384982
G1 X124.216 Y121.87 E.00949
; LINE_WIDTH: 0.385282
G3 X124.411 Y121.013 I3.568 J.359 E.01548
; LINE_WIDTH: 0.384032
G1 X124.451 Y120.893 E.00222
; LINE_WIDTH: 0.387922
G1 X124.722 Y120.356 E.01065
; LINE_WIDTH: 0.388322
G1 X124.831 Y120.196 E.00343
G1 X125.187 Y120.367 F30000
; LINE_WIDTH: 0.449992
G1 F1513
G1 X125.258 Y120.27 E.0025
G3 X125.585 Y119.89 I3.013 J2.26 E.0104
G1 X126.173 Y119.44 E.01536
G1 X126.456 Y119.286 E.00668
G1 X127.009 Y119.079 E.01226
G1 X127.279 Y119.017 E.00574
G1 X127.884 Y118.963 E.01261
G1 X128.639 Y119.054 E.01578
G3 X129.463 Y119.364 I-.847 J3.496 E.01829
G1 X129.982 Y119.725 E.01313
G1 X130.521 Y120.297 E.01629
G1 X130.876 Y120.903 E.01458
G3 X130.985 Y123.322 I-3.183 J1.354 E.0513
G1 X130.751 Y123.854 E.01205
G3 X130.13 Y124.644 I-4.208 J-2.674 E.02088
G3 X128.788 Y125.41 I-2.535 J-2.88 E.03226
G1 X128.22 Y125.525 E.01204
G1 X127.639 Y125.531 E.01205
G1 X126.962 Y125.41 E.01426
G1 X126.253 Y125.11 E.01597
G3 X125.438 Y124.456 I2.316 J-3.717 E.02172
G1 X125.074 Y123.97 E.01259
G1 X124.765 Y123.322 E.0149
G3 X124.591 Y122.421 I4.085 J-1.256 E.01906
G1 X124.607 Y121.882 E.0112
G3 X124.816 Y121.03 I6.832 J1.224 E.0182
G3 X125.071 Y120.544 I3.455 J1.501 E.01139
G1 X125.154 Y120.418 E.00313
G1 X125.563 Y120.577 F30000
G1 F1513
G1 X125.881 Y120.195 E.01032
G1 X126.417 Y119.787 E.01396
G1 X127.035 Y119.522 E.01396
G1 X127.317 Y119.44 E.00608
G1 X127.922 Y119.385 E.01261
G1 X128.57 Y119.473 E.01355
G1 X129.177 Y119.696 E.01342
G1 X129.738 Y120.072 E.01401
G1 X130.201 Y120.576 E.0142
G1 X130.503 Y121.104 E.01262
G1 X130.684 Y121.676 E.01243
G3 X130.724 Y122.57 I-5.661 J.702 E.01858
G1 X130.622 Y123.078 E.01075
G1 X130.409 Y123.59 E.01151
G3 X129.865 Y124.312 I-3.953 J-2.413 E.01877
G1 X129.442 Y124.649 E.01122
G3 X128.7 Y124.995 I-2.404 J-4.186 E.017
G1 X128.175 Y125.103 E.01112
G1 X127.639 Y125.107 E.01113
G1 X127.05 Y124.995 E.01243
G1 X126.431 Y124.725 E.01401
G1 X125.885 Y124.312 E.01421
G1 X125.413 Y123.716 E.01576
G1 X125.155 Y123.155 E.0128
G1 X125.026 Y122.57 E.01243
G3 X125.053 Y121.751 I4.707 J-.257 E.01701
G3 X125.213 Y121.179 I6.48 J1.508 E.01233
G1 X125.471 Y120.688 E.0115
G1 X125.525 Y120.624 E.00173
M204 S250
G1 X125.87 Y120.833 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1513
M204 S5000
G1 X126.19 Y120.464 E.0094
G1 X126.652 Y120.122 E.0111
G3 X127.354 Y119.847 I2.314 J4.878 E.01453
G1 X127.959 Y119.793 E.01172
G1 X128.503 Y119.877 E.01061
G1 X129.022 Y120.075 E.01071
G1 X129.503 Y120.407 E.01126
G1 X129.893 Y120.845 E.01132
G1 X130.143 Y121.298 E.00997
G1 X130.291 Y121.79 E.00991
G1 X130.326 Y122.443 E.01261
G1 X130.231 Y122.955 E.01002
G1 X130.033 Y123.429 E.00991
G3 X129.61 Y123.992 I-6.205 J-4.222 E.01356
G1 X129.187 Y124.329 E.01042
G1 X128.657 Y124.581 E.01131
G1 X128.152 Y124.693 E.00997
G1 X127.639 Y124.697 E.0099
G1 X127.135 Y124.595 E.00991
G1 X126.603 Y124.354 E.01126
G1 X126.14 Y123.992 E.01133
G1 X125.741 Y123.47 E.01265
G1 X125.531 Y122.994 E.01002
G1 X125.428 Y122.49 E.00991
G1 X125.44 Y121.907 E.01126
G3 X125.597 Y121.322 I5.472 J1.15 E.01166
G1 X125.834 Y120.88 E.00967
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X126.19 Y120.464 E-.20804
G1 X126.652 Y120.122 E-.21878
G1 X127.354 Y119.847 E-.28614
G1 X127.477 Y119.836 E-.04704
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 142/145
; update layer progress
M73 L142
M991 S0 P141 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z12.48 I-.43 J1.138 P1  F30000
G1 X132.138 Y121.599 Z12.48
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1329
G3 X132.187 Y122.155 I-4.263 J.653 E.01158
G3 X130.834 Y125.388 I-4.395 J.06 E.07476
G1 X130.209 Y125.868 E.01634
G3 X126.093 Y118.322 I-2.333 J-3.623 E.29377
G1 X126.866 Y118.064 E.01691
G1 X127.533 Y117.949 E.01403
G1 X128.341 Y117.965 E.01675
G3 X132.129 Y121.54 I-.465 J4.287 E.11599
G1 X132.56 Y121.559 F30000
G1 F1329
G3 X132.611 Y122.168 I-4.69 J.696 E.01268
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
G3 X127.439 Y117.534 I-4.734 J.081 E.45535
G3 X128.488 Y117.554 I.281 J12.794 E.02176
G3 X132.551 Y121.5 I-.618 J4.701 E.1259
M204 S250
G1 X132.968 Y121.52 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1329
M204 S5000
G3 X133.02 Y122.18 I-5.085 J.733 E.01276
G3 X127.486 Y117.115 I-5.145 J.065 E.46108
G3 X128.556 Y117.15 I-.098 J19.074 E.02063
G3 X130.373 Y117.757 I-.805 J5.44 E.03712
G3 X131.789 Y118.917 I-2.689 J4.726 E.03545
G3 X132.959 Y121.461 I-3.906 J3.337 E.05467
; WIPE_START
G1 F1800
M204 S10000
G1 X133.02 Y122.18 E-.27412
G1 X133.004 Y122.711 E-.20203
G1 X132.912 Y123.321 E-.23418
G1 X132.878 Y123.447 E-.04967
; WIPE_END
G1 E-.04
G1 X125.825 Y120.529 Z12.6 F30000
M73 P96 R0
G1 X125.258 Y120.295 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1329
G1 X125.58 Y119.907 E.01047
G1 X125.831 Y119.672 E.00712
G1 X126.31 Y119.352 E.01196
G3 X127.248 Y119.02 I2.242 J4.852 E.02067
G1 X127.861 Y118.957 E.01278
G1 X128.486 Y119.019 E.01303
G1 X129.235 Y119.256 E.01629
G3 X129.971 Y119.717 I-1.547 J3.284 E.01806
G1 X130.391 Y120.134 E.01226
G1 X130.757 Y120.672 E.01351
G3 X131.064 Y121.446 I-2.734 J1.531 E.01732
G1 X131.163 Y122.142 E.01459
G1 X131.08 Y122.973 E.01732
G1 X130.843 Y123.668 E.01524
G1 X130.483 Y124.255 E.01427
G1 X129.879 Y124.856 E.01768
G1 X129.266 Y125.231 E.0149
G3 X128.389 Y125.498 I-1.675 J-3.93 E.01905
G3 X126.835 Y125.369 I-.472 J-3.758 E.03258
G1 X126.338 Y125.157 E.01121
G1 X125.79 Y124.782 E.01378
G1 X125.525 Y124.552 E.00728
G1 X125.156 Y124.109 E.01196
G1 X124.86 Y123.556 E.01302
G3 X124.627 Y122.764 I2.841 J-1.267 E.01717
G1 X124.598 Y122.023 E.01539
G3 X124.784 Y121.132 I3.709 J.31 E.01891
G3 X125.098 Y120.487 I7.356 J3.178 E.01489
G1 X125.219 Y120.341 E.00395
G1 X125.582 Y120.558 F30000
G1 F1329
G1 X125.896 Y120.19 E.01003
G3 X126.07 Y120.023 I3.256 J3.209 E.00502
G1 X126.513 Y119.724 E.01108
G3 X127.299 Y119.442 I2.35 J5.297 E.01734
G1 X127.853 Y119.381 E.01156
G1 X128.442 Y119.44 E.01228
G1 X129.092 Y119.655 E.0142
G1 X129.566 Y119.935 E.01142
G3 X130.181 Y120.547 I-3.229 J3.858 E.01802
G1 X130.459 Y121.003 E.01109
G1 X130.65 Y121.548 E.01199
G1 X130.741 Y122.186 E.01337
G1 X130.66 Y122.916 E.01522
G1 X130.448 Y123.513 E.01315
G1 X130.129 Y124.021 E.01244
G1 X129.59 Y124.545 E.01558
G1 X129.059 Y124.86 E.01281
G1 X128.491 Y125.049 E.01242
G3 X127.674 Y125.108 I-.746 J-4.641 E.01702
G1 X127.141 Y125.02 E.0112
G1 X126.505 Y124.767 E.0142
G3 X125.849 Y124.278 I2.38 J-3.877 E.017
G1 X125.506 Y123.868 E.01108
G1 X125.237 Y123.36 E.01193
G1 X125.048 Y122.7 E.01425
G1 X125.022 Y122.023 E.01405
G1 X125.161 Y121.368 E.01388
G1 X125.247 Y121.104 E.00576
G1 X125.471 Y120.688 E.00981
G1 X125.543 Y120.604 E.0023
M204 S250
G1 X125.887 Y120.819 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1329
M204 S5000
G1 X126.2 Y120.464 E.00911
G1 X126.607 Y120.152 E.0099
G3 X127.348 Y119.848 I2.29 J4.529 E.01544
G1 X127.845 Y119.79 E.00965
G1 X128.399 Y119.847 E.01074
G1 X128.954 Y120.04 E.01132
G1 X129.381 Y120.306 E.00969
G1 X129.804 Y120.725 E.01149
G1 X130.081 Y121.164 E.01001
G1 X130.263 Y121.681 E.01055
G1 X130.334 Y122.229 E.01066
G1 X130.254 Y122.861 E.01227
G1 X130.067 Y123.364 E.01034
G1 X129.787 Y123.796 E.00992
G1 X129.312 Y124.245 E.01261
G1 X128.86 Y124.503 E.01003
G1 X128.37 Y124.658 E.0099
G1 X127.788 Y124.707 E.01127
G1 X127.208 Y124.616 E.01131
G1 X126.666 Y124.391 E.01132
G1 X126.193 Y124.043 E.01131
G1 X125.855 Y123.652 E.00997
G1 X125.6 Y123.172 E.01048
G1 X125.446 Y122.603 E.01137
G1 X125.431 Y122.023 E.01118
G3 X125.608 Y121.298 I5.969 J1.07 E.01438
G1 X125.832 Y120.882 E.00911
G1 X125.847 Y120.864 E.00046
; WIPE_START
G1 F1800
M204 S10000
G1 X126.2 Y120.464 E-.20247
G1 X126.607 Y120.152 E-.19516
G1 X127.348 Y119.848 E-.30407
G1 X127.5 Y119.83 E-.0583
; WIPE_END
G1 E-.04
G1 X131.622 Y121.618 Z12.6 F30000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.624912
G1 F1329
G1 X131.676 Y122.14 E.01537
; LINE_WIDTH: 0.624412
G1 X131.666 Y122.457 E.00929
; LINE_WIDTH: 0.631552
G3 X131.483 Y123.443 I-3.766 J-.19 E.02981
; LINE_WIDTH: 0.628172
G1 X131.169 Y124.14 E.02251
; LINE_WIDTH: 0.620292
G1 X130.863 Y124.597 E.01597
; LINE_WIDTH: 0.642072
G1 X130.497 Y124.992 E.01624
G1 X129.927 Y125.445 E.02192
; LINE_WIDTH: 0.619012
G1 X129.446 Y125.71 E.01593
; LINE_WIDTH: 0.633992
G3 X128.427 Y126.007 I-1.588 J-3.547 E.03165
; LINE_WIDTH: 0.622612
G1 X127.75 Y126.048 E.0198
; LINE_WIDTH: 0.636752
G3 X126.634 Y125.84 I.198 J-4.163 E.03402
; LINE_WIDTH: 0.625272
G1 X126.021 Y125.566 E.01968
; LINE_WIDTH: 0.634632
G1 X125.48 Y125.196 E.01953
G1 X125.135 Y124.883 E.01386
; LINE_WIDTH: 0.624692
G1 X124.74 Y124.396 E.01837
; LINE_WIDTH: 0.631132
G1 X124.403 Y123.793 E.02044
G1 X124.254 Y123.403 E.01234
; LINE_WIDTH: 0.628532
G1 X124.102 Y122.708 E.02098
; LINE_WIDTH: 0.630712
G1 X124.083 Y122.023 E.02028
; LINE_WIDTH: 0.633792
G1 X124.145 Y121.536 E.01458
G1 X124.339 Y120.856 E.02104
; LINE_WIDTH: 0.629952
G1 X124.615 Y120.298 E.01838
; LINE_WIDTH: 0.631172
G1 X124.868 Y119.929 E.01323
G1 X125.386 Y119.377 E.0224
; LINE_WIDTH: 0.631432
G1 X125.848 Y119.037 E.01698
; LINE_WIDTH: 0.631672
G1 X126.281 Y118.802 E.01462
G1 X126.992 Y118.554 E.02228
; LINE_WIDTH: 0.617012
G1 X127.658 Y118.46 E.01945
; LINE_WIDTH: 0.635912
G1 X128.331 Y118.482 E.02009
G1 X128.898 Y118.593 E.01725
; LINE_WIDTH: 0.622632
G1 X129.486 Y118.808 E.01826
; LINE_WIDTH: 0.630492
G3 X130.332 Y119.353 I-1.593 J3.403 E.02986
; LINE_WIDTH: 0.627172
G1 X130.853 Y119.889 E.02197
; LINE_WIDTH: 0.630352
G1 X131.195 Y120.402 E.01822
G1 X131.375 Y120.769 E.01209
; LINE_WIDTH: 0.630672
G3 X131.612 Y121.559 I-3.645 J1.524 E.02444
; CHANGE_LAYER
; Z_HEIGHT: 12.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X131.676 Y122.14 E-.22206
G1 X131.666 Y122.457 E-.1206
G1 X131.59 Y123.042 E-.2242
G1 X131.483 Y123.443 E-.15791
G1 X131.445 Y123.528 E-.03524
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 143/145
; update layer progress
M73 L143
M991 S0 P142 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z12.6 I1.169 J.337 P1  F30000
G1 X132.005 Y121.584 Z12.6
G1 Z12.32
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F1300
G3 X132.067 Y122.158 I-4.748 J.802 E.01198
G3 X130.368 Y125.621 I-4.194 J.091 E.08313
G1 X129.733 Y126.005 E.0154
G3 X127.328 Y126.398 I-1.866 J-3.857 E.05125
G1 X126.62 Y126.25 E.01499
G1 X126.083 Y126.04 E.01198
G1 X125.429 Y125.644 E.01585
G3 X124.232 Y124.319 I2.608 J-3.559 E.0373
G1 X123.888 Y123.552 E.01742
G3 X125.113 Y119.105 I4.018 J-1.286 E.10123
G1 X125.634 Y118.706 E.01361
G1 X126.198 Y118.41 E.0132
G1 X126.903 Y118.179 E.0154
G1 X127.539 Y118.069 E.01337
G1 X128.278 Y118.086 E.01533
G1 X128.832 Y118.167 E.01162
G1 X129.473 Y118.382 E.01403
G1 X130.086 Y118.691 E.01424
G3 X131.404 Y119.996 I-2.455 J3.799 E.03873
G1 X131.717 Y120.571 E.01358
G3 X131.995 Y121.525 I-4.46 J1.815 E.02065
G1 X132.445 Y121.642 F30000
G1 F1300
G1 X132.447 Y121.653 E.00024
G3 X132.491 Y122.171 I-4.862 J.67 E.01077
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
G3 X126.926 Y126.768 I-4.625 J.068 E.17176
G1 X126.137 Y126.519 E.01715
G1 X125.55 Y126.235 E.01353
G3 X123.908 Y124.617 I2.568 J-4.248 E.04827
G3 X128.287 Y117.662 I3.958 J-2.364 E.21043
G3 X130.843 Y118.715 I-.417 J4.643 E.05821
G3 X131.933 Y120.046 I-3.352 J3.854 E.03586
G3 X132.333 Y121.08 I-4.347 J2.278 E.02304
G1 X132.433 Y121.583 E.01065
M204 S250
G1 X132.846 Y121.565 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1300
M204 S5000
G1 X132.855 Y121.613 E.00094
G3 X132.9 Y122.183 I-5.126 J.695 E.01101
G3 X127.495 Y117.235 I-5.025 J.063 E.45035
G1 X128.479 Y117.257 E.01898
G3 X129.701 Y117.575 I-.578 J4.738 E.02441
G3 X131.124 Y118.417 I-2.005 J5.009 E.03198
G1 X131.638 Y118.922 E.0139
G3 X132.731 Y120.992 I-3.91 J3.387 E.04553
G1 X132.834 Y121.506 E.01011
; WIPE_START
G1 F1800
M204 S10000
G1 X132.855 Y121.613 E-.04141
G1 X132.9 Y122.183 E-.21704
G1 X132.884 Y122.701 E-.19705
G1 X132.809 Y123.221 E-.19951
G1 X132.738 Y123.488 E-.10499
; WIPE_END
G1 E-.04
G1 X125.696 Y120.545 Z12.72 F30000
G1 X125.214 Y120.344 Z12.72
G1 Z12.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1300
G1 X125.34 Y120.153 E.00475
G1 X125.716 Y119.763 E.01123
G1 X126.295 Y119.366 E.01457
G1 X126.869 Y119.129 E.01289
G3 X128.921 Y119.128 I1.027 J3.099 E.04329
G1 X129.583 Y119.439 E.01517
G1 X130.142 Y119.866 E.01458
G1 X130.545 Y120.335 E.01283
G1 X130.733 Y120.63 E.00726
G1 X130.989 Y121.177 E.01253
G3 X131.157 Y122.124 I-3.966 J1.192 E.01998
G1 X131.131 Y122.7 E.01196
G1 X130.974 Y123.342 E.01371
G1 X130.861 Y123.623 E.00629
G1 X130.558 Y124.149 E.0126
G1 X130.126 Y124.643 E.0136
G1 X129.862 Y124.866 E.00717
G3 X128.93 Y125.369 I-1.873 J-2.355 E.02209
G1 X128.326 Y125.508 E.01285
G1 X127.708 Y125.536 E.01283
G1 X126.895 Y125.388 E.01713
G1 X126.167 Y125.06 E.01656
G1 X125.608 Y124.634 E.01458
G1 X125.162 Y124.11 E.01427
G3 X124.725 Y123.195 I3.723 J-2.339 E.02108
G1 X124.613 Y122.667 E.01121
G1 X124.597 Y122.022 E.01338
G3 X124.814 Y121.036 I5.2 J.627 E.02097
G3 X125.072 Y120.559 I5.261 J2.538 E.01124
G1 X125.181 Y120.394 E.0041
G1 X125.595 Y120.524 F30000
G1 F1300
G1 X125.973 Y120.105 E.01171
G1 X126.529 Y119.72 E.01401
G1 X127.012 Y119.528 E.01079
G3 X128.817 Y119.54 I.885 J2.682 E.0381
G1 X129.393 Y119.819 E.01327
G1 X129.872 Y120.193 E.01262
G1 X130.213 Y120.599 E.011
G1 X130.514 Y121.153 E.01307
G1 X130.622 Y121.449 E.00652
G1 X130.732 Y121.987 E.01141
G3 X130.684 Y122.823 I-5.683 J.089 E.01739
G1 X130.531 Y123.334 E.01105
G3 X130.103 Y124.053 I-5.015 J-2.499 E.01737
G1 X129.73 Y124.438 E.01112
G1 X129.289 Y124.743 E.01113
G1 X128.812 Y124.959 E.01085
G1 X128.238 Y125.093 E.01224
G1 X127.703 Y125.112 E.0111
G1 X126.984 Y124.973 E.01517
G1 X126.357 Y124.681 E.01435
G1 X125.878 Y124.306 E.01262
G1 X125.494 Y123.846 E.01243
G3 X125.14 Y123.107 I4.052 J-2.392 E.01701
M73 P97 R0
G1 X125.028 Y122.579 E.01121
G1 X125.021 Y122.028 E.01142
G3 X125.212 Y121.182 I6.997 J1.134 E.018
G1 X125.556 Y120.569 E.01458
M204 S250
G1 X125.898 Y120.796 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1300
M204 S5000
G1 X125.914 Y120.767 E.00064
G1 X126.269 Y120.387 E.01001
G1 X126.754 Y120.061 E.01126
G1 X127.305 Y119.858 E.01132
G1 X127.818 Y119.791 E.00997
G1 X128.226 Y119.816 E.00788
G1 X128.714 Y119.938 E.0097
G1 X129.21 Y120.185 E.01068
G1 X129.612 Y120.509 E.00997
G1 X129.936 Y120.909 E.00991
G1 X130.194 Y121.433 E.01127
G1 X130.322 Y122.006 E.01131
G3 X130.291 Y122.709 I-8.066 J-.001 E.01357
G1 X130.142 Y123.201 E.00992
G1 X129.836 Y123.733 E.01182
G1 X129.481 Y124.112 E.01002
G1 X129.058 Y124.405 E.00991
G1 X128.615 Y124.595 E.00929
G1 X128.114 Y124.697 E.00986
G1 X127.654 Y124.698 E.00887
G1 X127.068 Y124.572 E.01155
G1 X126.54 Y124.315 E.01132
G1 X126.138 Y123.99 E.00997
G1 X125.814 Y123.591 E.00991
G1 X125.556 Y123.067 E.01126
G1 X125.428 Y122.494 E.01132
G1 X125.431 Y121.977 E.00996
G3 X125.596 Y121.324 I19.073 J4.468 E.01298
G1 X125.868 Y120.848 E.01057
; WIPE_START
G1 F1800
M204 S10000
G1 X125.914 Y120.767 E-.03543
G1 X126.269 Y120.387 E-.19743
G1 X126.754 Y120.061 E-.22205
G1 X127.305 Y119.858 E-.22316
G1 X127.519 Y119.83 E-.08193
; WIPE_END
G1 E-.04
G1 X131.56 Y121.627 Z12.72 F30000
G1 Z12.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.514292
G1 F1300
G1 X131.612 Y122.144 E.01242
; LINE_WIDTH: 0.511992
G1 X131.55 Y122.963 E.01951
; LINE_WIDTH: 0.509972
G3 X131.253 Y123.849 I-3.757 J-.763 E.02219
; LINE_WIDTH: 0.506812
G1 X130.808 Y124.575 E.02002
; LINE_WIDTH: 0.509832
G1 X130.454 Y124.957 E.01232
; LINE_WIDTH: 0.510512
G3 X129.617 Y125.561 I-2.637 J-2.775 E.02454
; LINE_WIDTH: 0.497692
G1 X129.084 Y125.788 E.01337
; LINE_WIDTH: 0.512432
G3 X128.032 Y125.986 I-1.238 J-3.683 E.02555
; LINE_WIDTH: 0.509872
G1 X127.384 Y125.952 E.01535
; LINE_WIDTH: 0.507912
G1 X126.783 Y125.827 E.01449
; LINE_WIDTH: 0.516192
G3 X125.768 Y125.339 I1.245 J-3.886 E.02707
; LINE_WIDTH: 0.502252
G1 X125.322 Y124.982 E.01331
; LINE_WIDTH: 0.513792
G3 X124.632 Y124.111 I2.672 J-2.826 E.0266
; LINE_WIDTH: 0.504952
G1 X124.318 Y123.416 E.01786
; LINE_WIDTH: 0.516032
G3 X124.141 Y122.43 I4.047 J-1.235 E.02407
; LINE_WIDTH: 0.506432
G1 X124.185 Y121.64 E.0186
; LINE_WIDTH: 0.518032
G3 X124.499 Y120.651 I3.946 J.709 E.02503
; LINE_WIDTH: 0.503392
G1 X124.802 Y120.125 E.0142
; LINE_WIDTH: 0.513792
G3 X125.595 Y119.286 I3.113 J2.149 E.02764
; LINE_WIDTH: 0.505952
G1 X126.152 Y118.931 E.01552
; LINE_WIDTH: 0.516232
G3 X127.218 Y118.568 I1.839 J3.647 E.02708
; LINE_WIDTH: 0.507772
G1 X127.929 Y118.519 E.01682
; LINE_WIDTH: 0.502012
G1 X128.53 Y118.569 E.01403
; LINE_WIDTH: 0.502332
G1 X129.074 Y118.704 E.01307
; LINE_WIDTH: 0.517672
G3 X130.062 Y119.217 I-1.488 J4.072 E.02685
; LINE_WIDTH: 0.502212
G1 X130.499 Y119.586 E.01331
; LINE_WIDTH: 0.510492
G1 X130.9 Y120.052 E.01457
; LINE_WIDTH: 0.511892
G1 X131.143 Y120.433 E.01074
G1 X131.409 Y121.03 E.01555
; LINE_WIDTH: 0.514292
G1 X131.545 Y121.569 E.01327
; CHANGE_LAYER
; Z_HEIGHT: 12.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X131.612 Y122.144 E-.22017
G1 X131.55 Y122.963 E-.31189
G1 X131.41 Y123.469 E-.19956
G1 X131.382 Y123.538 E-.02839
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 144/145
; update layer progress
M73 L144
M991 S0 P143 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z12.72 I1.175 J.316 P1  F30000
G1 X131.894 Y121.634 Z12.72
G1 Z12.44
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F1277
G1 X131.934 Y121.908 E.00574
G3 X131.309 Y124.443 I-4.311 J.282 E.05502
G3 X128.132 Y126.309 I-3.466 J-2.264 E.07918
G1 X127.393 Y126.289 E.01534
G3 X124.585 Y124.647 I.488 J-4.058 E.06939
G1 X124.243 Y124.092 E.01352
G1 X124.003 Y123.497 E.01332
G1 X123.849 Y122.843 E.01394
G3 X123.939 Y121.2 I4.308 J-.586 E.03432
G1 X124.155 Y120.589 E.01345
G1 X124.423 Y120.087 E.0118
G3 X125.547 Y118.908 I3.742 J2.442 E.03398
G1 X126.135 Y118.576 E.014
G1 X126.852 Y118.313 E.01584
G1 X127.549 Y118.189 E.01469
G1 X128.402 Y118.212 E.01769
G1 X129.027 Y118.342 E.01326
G3 X130.883 Y119.505 I-1.286 J4.112 E.04593
G1 X131.331 Y120.109 E.0156
G1 X131.673 Y120.776 E.01555
G1 X131.862 Y121.412 E.01376
G1 X131.886 Y121.575 E.00341
G1 X132.312 Y121.563 F30000
G1 F1277
G1 X132.358 Y121.895 E.00696
G3 X132.131 Y123.71 I-5.045 J.29 E.03813
G3 X129.558 Y126.422 I-4.318 J-1.519 E.07988
G1 X128.874 Y126.636 E.01488
G1 X128.248 Y126.733 E.01313
G1 X127.533 Y126.736 E.01484
G3 X124.257 Y124.923 I.383 J-4.558 E.08
G1 X123.879 Y124.317 E.01482
G3 X123.766 Y120.417 I4.074 J-2.069 E.08361
G1 X124.064 Y119.86 E.01312
G1 X124.491 Y119.285 E.01484
G3 X127.46 Y117.773 I3.392 J2.991 E.07078
G3 X128.522 Y117.804 I.192 J11.902 E.02206
G1 X129.196 Y117.952 E.01431
G3 X131.213 Y119.24 I-1.442 J4.483 E.0502
G3 X132.28 Y121.377 I-3.532 J3.097 E.05009
G1 X132.302 Y121.504 E.00267
M204 S250
G1 X132.715 Y121.501 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1277
M204 S5000
G1 X132.767 Y121.883 E.00744
G1 X132.782 Y122.395 E.00987
G1 X132.712 Y123.088 E.01343
G1 X132.52 Y123.838 E.01492
G3 X130.732 Y126.242 I-4.793 J-1.699 E.05861
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
G3 X128.967 Y127.036 I-3.007 J-4.324 E.03753
G1 X128.28 Y127.142 E.01339
G1 X127.506 Y127.145 E.01492
G3 X123.926 Y125.166 I.415 J-4.978 E.08124
G1 X123.517 Y124.51 E.01491
G3 X123 Y121.665 I4.56 J-2.296 E.0565
G1 X123.133 Y120.981 E.01342
G1 X123.39 Y120.252 E.01491
G1 X123.717 Y119.64 E.01337
G1 X124.179 Y119.018 E.01493
G3 X125.644 Y117.877 I4.013 J3.64 E.03598
G1 X126.36 Y117.58 E.01493
G3 X127.504 Y117.354 I1.51 J4.645 E.02253
G1 X128.498 Y117.381 E.01918
G1 X129.254 Y117.538 E.01488
G3 X131.533 Y118.983 I-1.523 J4.919 E.05263
G1 X132.013 Y119.626 E.01545
G3 X132.504 Y120.645 I-3.393 J2.262 E.02189
G1 X132.69 Y121.315 E.01339
G1 X132.707 Y121.441 E.00246
; WIPE_START
G1 F1800
M204 S10000
G1 X132.767 Y121.883 E-.16941
G1 X132.782 Y122.395 E-.19464
G1 X132.712 Y123.088 E-.26478
G1 X132.626 Y123.423 E-.13118
; WIPE_END
G1 E-.04
G1 X125.621 Y120.392 Z12.84 F30000
G1 X125.282 Y120.245 Z12.84
G1 Z12.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1277
G1 X125.605 Y119.867 E.01032
G1 X126.21 Y119.414 E.01567
G1 X126.895 Y119.114 E.01553
G1 X127.213 Y119.033 E.0068
G1 X127.952 Y118.967 E.01537
G3 X128.808 Y119.091 I-.072 J3.506 E.018
G1 X129.338 Y119.303 E.01184
G1 X129.913 Y119.676 E.01422
G1 X130.166 Y119.891 E.00689
G1 X130.525 Y120.302 E.01131
G3 X131.101 Y121.593 I-3.04 J2.131 E.0295
G1 X131.157 Y122.369 E.01613
G3 X130.988 Y123.324 I-4.17 J-.243 E.02016
G3 X130.13 Y124.644 I-3.453 J-1.307 E.03291
G1 X129.707 Y124.98 E.01121
G1 X129.096 Y125.296 E.01427
G1 X128.788 Y125.41 E.00679
G1 X128.268 Y125.519 E.01102
G1 X127.715 Y125.536 E.01149
G1 X127.055 Y125.436 E.01384
G3 X126.05 Y124.986 I1.579 J-4.885 E.02288
G1 X125.622 Y124.651 E.01128
G1 X125.223 Y124.196 E.01255
G3 X124.772 Y123.349 I4.595 J-2.991 E.01994
G3 X124.631 Y121.72 I3.579 J-1.13 E.03417
G1 X124.784 Y121.132 E.0126
G1 X124.889 Y120.876 E.00574
G1 X125.192 Y120.35 E.0126
G1 X125.243 Y120.291 E.00161
G1 X125.587 Y120.552 F30000
G1 F1277
G1 X125.72 Y120.381 E.00449
G3 X126.012 Y120.072 I2.678 J2.233 E.00881
G1 X126.454 Y119.761 E.01121
G1 X127.05 Y119.508 E.01344
G1 X127.251 Y119.456 E.00431
G1 X127.99 Y119.389 E.01537
G1 X128.618 Y119.481 E.01317
G1 X129.177 Y119.696 E.01243
G3 X130.282 Y120.693 I-1.689 J2.983 E.03111
G1 X130.523 Y121.145 E.01063
G1 X130.684 Y121.676 E.0115
G1 X130.733 Y122.388 E.01481
G1 X130.61 Y123.107 E.01513
G1 X130.328 Y123.731 E.0142
G3 X128.755 Y124.98 I-2.589 J-1.644 E.04245
G3 X127.709 Y125.112 I-.887 J-2.827 E.022
G1 X127.131 Y125.018 E.01214
G3 X126.31 Y124.651 I1.946 J-5.459 E.01869
G1 X125.905 Y124.336 E.01063
G1 X125.546 Y123.921 E.01138
G1 X125.177 Y123.224 E.01637
G1 X125.039 Y122.664 E.01196
G1 X125.022 Y121.98 E.01419
G1 X125.194 Y121.239 E.01577
G3 X125.475 Y120.714 I3.204 J1.375 E.01237
G1 X125.553 Y120.601 E.00284
M204 S250
G1 X125.907 Y120.779 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1277
M204 S5000
G1 X125.914 Y120.767 E.00026
G1 X126.247 Y120.407 E.00945
G1 X126.689 Y120.096 E.01042
G1 X127.2 Y119.889 E.01061
G1 X128.026 Y119.797 E.01603
G1 X128.545 Y119.884 E.01013
G1 X129.022 Y120.075 E.00991
G1 X129.503 Y120.407 E.01127
G1 X129.896 Y120.85 E.01142
G1 X130.143 Y121.298 E.00986
G1 X130.291 Y121.79 E.0099
G1 X130.324 Y122.406 E.01189
G1 X130.209 Y123.022 E.01207
G1 X129.96 Y123.553 E.01132
G1 X129.641 Y123.961 E.00996
G1 X129.248 Y124.281 E.00977
G1 X128.745 Y124.54 E.0109
G1 X128.152 Y124.693 E.0118
G1 X127.665 Y124.7 E.00939
G1 X127.17 Y124.606 E.0097
G1 X126.601 Y124.352 E.01203
G1 X126.19 Y124.041 E.00992
G1 X125.858 Y123.656 E.0098
G1 X125.568 Y123.103 E.01204
G1 X125.437 Y122.567 E.01065
G1 X125.431 Y121.98 E.01131
G1 X125.59 Y121.342 E.01267
G1 X125.878 Y120.831 E.0113
; WIPE_START
G1 F1800
M204 S10000
G1 X125.914 Y120.767 E-.028
G1 X126.247 Y120.407 E-.18631
G1 X126.689 Y120.096 E-.20545
G1 X127.2 Y119.889 E-.20924
G1 X127.542 Y119.851 E-.13099
; WIPE_END
G1 E-.04
G1 X131.503 Y121.7 Z12.84 F30000
G1 Z12.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.398732
G1 F1277
G1 X131.536 Y121.92 E.00406
G1 X131.552 Y122.351 E.00787
; LINE_WIDTH: 0.392292
G1 X131.518 Y122.748 E.00713
; LINE_WIDTH: 0.379852
G1 X131.39 Y123.332 E.01035
; LINE_WIDTH: 0.398172
G3 X130.892 Y124.353 I-3.711 J-1.175 E.02077
; LINE_WIDTH: 0.383752
G1 X130.426 Y124.905 E.01265
; LINE_WIDTH: 0.391832
G3 X129.662 Y125.464 I-2.714 J-2.909 E.01698
; LINE_WIDTH: 0.382612
G1 X129.171 Y125.69 E.00943
; LINE_WIDTH: 0.392532
G3 X128.131 Y125.92 I-1.324 J-3.529 E.01917
; LINE_WIDTH: 0.380712
G1 X127.445 Y125.903 E.0119
G1 X126.884 Y125.794 E.00993
; LINE_WIDTH: 0.402512
G3 X125.811 Y125.294 I1.22 J-4.018 E.02187
; LINE_WIDTH: 0.383712
G1 X125.258 Y124.84 E.01253
; LINE_WIDTH: 0.384172
G3 X124.751 Y124.183 I2.294 J-2.293 E.01457
; LINE_WIDTH: 0.379432
G1 X124.46 Y123.622 E.01093
; LINE_WIDTH: 0.398192
G3 X124.207 Y122.52 I3.751 J-1.438 E.02066
; LINE_WIDTH: 0.382012
G1 X124.217 Y121.818 E.01222
; LINE_WIDTH: 0.400592
G1 X124.326 Y121.306 E.00961
G1 X124.55 Y120.681 E.01216
; LINE_WIDTH: 0.383932
G1 X124.95 Y120.022 E.01349
; LINE_WIDTH: 0.379432
G1 X125.349 Y119.572 E.01041
; LINE_WIDTH: 0.397712
G3 X126.284 Y118.935 I2.697 J2.955 E.02064
; LINE_WIDTH: 0.380132
G1 X126.949 Y118.688 E.0123
; LINE_WIDTH: 0.410752
G1 X127.571 Y118.595 E.01184
G1 X128.297 Y118.597 E.01367
; LINE_WIDTH: 0.377612
G1 X128.798 Y118.69 E.00876
; LINE_WIDTH: 0.393952
G3 X129.766 Y119.095 I-.932 J3.584 E.01894
; LINE_WIDTH: 0.383332
G1 X130.207 Y119.407 E.00945
; LINE_WIDTH: 0.395372
G1 X130.573 Y119.754 E.00912
G1 X130.998 Y120.308 E.01262
; LINE_WIDTH: 0.382092
G1 X131.306 Y120.912 E.01181
G1 X131.465 Y121.447 E.00974
; LINE_WIDTH: 0.398732
G1 X131.494 Y121.641 E.00356
; CHANGE_LAYER
; Z_HEIGHT: 12.56
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F3600
G1 X131.536 Y121.92 E-.10738
G1 X131.552 Y122.351 E-.16393
G1 X131.518 Y122.748 E-.15122
G1 X131.39 Y123.332 E-.22713
G1 X131.283 Y123.602 E-.11036
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 145/145
; update layer progress
M73 L145
M991 S0 P144 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z12.84 I1.032 J.645 P1  F30000
G1 X132.59 Y121.509 Z12.84
G1 Z12.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1543
M204 S5000
G1 X132.646 Y121.908 E.00776
G3 X131.911 Y124.828 I-4.88 J.324 E.05901
G1 X131.481 Y125.402 E.01382
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
G3 X130.016 Y126.534 I-3.911 J-3.548 E.03587
G3 X128.377 Y127.013 I-2.308 J-4.856 E.03304
G1 X127.66 Y127.034 E.01383
G1 X126.948 Y126.949 E.01382
G3 X125.359 Y126.325 I1.144 J-5.253 E.03305
G1 X124.778 Y125.903 E.01383
G1 X124.267 Y125.4 E.01383
G3 X123.139 Y121.536 I3.697 J-3.176 E.07998
G1 X123.299 Y120.837 E.01382
G3 X124.176 Y119.207 I5.016 J1.65 E.03586
G1 X124.564 Y118.789 E.01099
G1 X125.118 Y118.333 E.01382
G1 X125.734 Y117.965 E.01383
G1 X126.258 Y117.741 E.01098
G1 X126.95 Y117.551 E.01384
G1 X127.66 Y117.465 E.0138
G1 X128.376 Y117.486 E.01379
G1 X129.081 Y117.615 E.01383
G1 X129.623 Y117.791 E.01098
G1 X130.271 Y118.103 E.01386
G3 X132.572 Y121.366 I-2.485 J4.195 E.0793
G1 X132.583 Y121.45 E.00162
; WIPE_START
G1 F1800
M204 S10000
G1 X132.646 Y121.908 E-.17575
G1 X132.656 Y122.537 E-.2392
G1 X132.588 Y123.104 E-.2171
G1 X132.508 Y123.432 E-.12795
; WIPE_END
G1 E-.04
G1 X125.916 Y120.765 Z12.96 F30000
G1 Z12.56
G1 E.8 F1800
G1 F1543
M204 S5000
G1 X126.269 Y120.387 E.00997
G1 X126.725 Y120.076 E.01065
G1 X127.302 Y119.859 E.01187
G1 X127.818 Y119.791 E.01002
G1 X128.33 Y119.833 E.00991
G3 X129.426 Y120.342 I-.705 J2.954 E.02346
G1 X129.805 Y120.727 E.01042
G1 X130.111 Y121.228 E.01131
G1 X130.276 Y121.718 E.00996
G1 X130.334 Y122.229 E.00991
G3 X130.24 Y122.924 I-8.551 J-.805 E.01351
G1 X130.046 Y123.403 E.00997
G1 X129.742 Y123.85 E.01042
G1 X129.366 Y124.205 E.00996
G1 X128.9 Y124.48 E.01043
G1 X128.353 Y124.656 E.0111
G1 X127.715 Y124.703 E.01233
G1 X127.205 Y124.616 E.00996
G1 X126.605 Y124.355 E.01261
G1 X126.191 Y124.041 E.01002
G1 X125.855 Y123.652 E.00992
G1 X125.557 Y123.069 E.01261
G1 X125.428 Y122.493 E.01138
G1 X125.452 Y121.837 E.01266
G1 X125.592 Y121.336 E.01002
G1 X125.886 Y120.817 E.0115
; WIPE_START
G1 F1800
M204 S10000
G1 X126.269 Y120.387 E-.21884
G1 X126.725 Y120.076 E-.20993
G1 X127.302 Y119.859 E-.23409
G1 X127.555 Y119.826 E-.09714
; WIPE_END
G1 E-.04
G1 X131.944 Y120.187 Z12.96 F30000
G1 Z12.56
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1543
M204 S2000
G1 X129.941 Y118.184 E.0546
G1 X129.024 Y117.825
G1 X132.296 Y121.096 E.08919
M73 P98 R0
G1 X132.418 Y121.776
G1 X128.344 Y117.702 E.11105
G1 X127.77 Y117.685
G1 X132.436 Y122.352 E.12722
G1 X132.397 Y122.871
G1 X127.262 Y117.735 E.13999
G1 X126.789 Y117.82
G1 X128.694 Y119.725 E.05193
G1 X128.003 Y119.591
G1 X126.352 Y117.94 E.04499
G1 X125.959 Y118.105
G1 X127.471 Y119.617 E.04123
G1 X127.028 Y119.732
G1 X125.597 Y118.3 E.03902
G1 X125.248 Y118.509
G1 X126.625 Y119.886 E.03755
G1 X126.291 Y120.109
G1 X124.941 Y118.76 E.03679
G1 X124.645 Y119.021
G1 X125.991 Y120.367 E.0367
G1 X125.733 Y120.667
G1 X124.376 Y119.31 E.03698
G1 X124.142 Y119.633
G1 X125.53 Y121.021 E.03784
G1 X125.35 Y121.398
G1 X123.918 Y119.966 E.03903
G1 X123.727 Y120.333
G1 X125.235 Y121.841 E.0411
G1 X125.21 Y122.374
G1 X123.569 Y120.733 E.04474
G1 X123.446 Y121.167
G1 X125.334 Y123.055 E.05146
; WIPE_START
G1 F1800
M204 S10000
G1 X123.919 Y121.641 E-.76
; WIPE_END
G1 E-.04
G1 X130.41 Y121.441 Z12.96 F30000
G1 Z12.56
G1 E.8 F1800
G1 F1543
M204 S2000
G1 X132.307 Y123.338 E.05173
G1 X132.18 Y123.768
G1 X130.54 Y122.128 E.04471
G1 X130.495 Y122.641
G1 X132.021 Y124.167 E.04159
G1 X131.826 Y124.529
G1 X130.401 Y123.105 E.03884
G1 X130.24 Y123.501
G1 X131.609 Y124.87 E.03733
G1 X131.37 Y125.189
G1 X130.01 Y123.829 E.03707
G1 X129.759 Y124.136
G1 X131.102 Y125.478 E.03659
G1 X130.812 Y125.745
G1 X129.465 Y124.399 E.03671
G1 X129.112 Y124.604
G1 X130.501 Y125.992 E.03784
G1 X130.152 Y126.2
G1 X128.722 Y124.771 E.03896
G1 X128.286 Y124.892
G1 X129.789 Y126.395 E.04098
G1 X129.396 Y126.56
G1 X127.754 Y124.918 E.04477
G1 X127.081 Y124.802
G1 X128.965 Y126.686 E.05136
G1 X128.495 Y126.774
G1 X123.35 Y121.628 E.14026
G1 X123.311 Y122.147
G1 X127.972 Y126.808 E.12706
G1 X127.389 Y126.783
G1 X123.331 Y122.725 E.11063
G1 X123.455 Y123.407
G1 X126.712 Y126.663 E.08877
G1 X125.816 Y126.325
G1 X123.792 Y124.301 E.05516
M204 S10000
G1 X123.857 Y124.236 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.181708
G1 F1543
G1 X123.768 Y124.107 E.0012
; LINE_WIDTH: 0.138248
G1 X123.679 Y123.977 E.00086
; LINE_WIDTH: 0.0947876
G1 X123.59 Y123.848 E.00053
; WIPE_START
G1 F21000
G1 X123.679 Y123.977 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.537 Y123.509 Z12.96 F30000
G1 Z12.56
G1 E.8 F1800
; LINE_WIDTH: 0.0922392
G1 F1543
G1 X125.461 Y123.404 E.00042
; LINE_WIDTH: 0.130602
G1 X125.385 Y123.299 E.00066
; LINE_WIDTH: 0.161847
G1 X125.309 Y123.194 E.00086
G3 X125.34 Y123.048 I1.24 J.187 E.00099
; WIPE_START
G1 F21000
G1 X125.309 Y123.194 E-.40666
G1 X125.385 Y123.299 E-.35334
; WIPE_END
G1 E-.04 F1800
G1 X129.1 Y119.882 Z12.96 F30000
G1 Z12.56
G1 E.8 F1800
; LINE_WIDTH: 0.086654
G1 F1543
G2 X128.774 Y119.645 I-2.098 J2.545 E.0012
; WIPE_START
G1 F21000
G1 X129.1 Y119.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.18 Y119.112 Z12.96 F30000
G1 Z12.56
G1 E.8 F1800
; LINE_WIDTH: 0.0782954
G1 F1543
G2 X130.915 Y118.847 I-2.095 J1.833 E.00096
; WIPE_START
G1 F21000
G1 X131.18 Y119.112 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.161 Y120.656 Z12.96 F30000
G1 Z12.56
G1 E.8 F1800
; LINE_WIDTH: 0.095067
G1 F1543
G1 X132.067 Y120.521 E.00056
; LINE_WIDTH: 0.139056
G1 X131.974 Y120.387 E.00091
; LINE_WIDTH: 0.183046
G1 X131.88 Y120.252 E.00126
; WIPE_START
G1 F21000
G1 X131.974 Y120.387 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.487 Y121.364 Z12.96 F30000
G1 Z12.56
G1 E.8 F1800
; LINE_WIDTH: 0.100717
G1 F1543
G2 X130.238 Y121.019 I-3.094 J1.975 E.00156
; WIPE_START
G1 F21000
G1 X130.487 Y121.364 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.015 Y124.868 Z12.96 F30000
G1 Z12.56
G1 E.8 F1800
; LINE_WIDTH: 0.180975
G1 F1543
G1 X126.886 Y124.778 E.0012
; LINE_WIDTH: 0.13781
G1 X126.756 Y124.688 E.00086
; LINE_WIDTH: 0.0946445
G1 X126.626 Y124.598 E.00053
; WIPE_START
G1 F21000
G1 X126.756 Y124.688 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.051 Y126.746 Z12.96 F30000
G1 Z12.56
G1 E.8 F1800
; LINE_WIDTH: 0.0868696
G1 F1543
G1 X126.767 Y126.608 E.00094
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F21000
G1 X127.051 Y126.746 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.96 I1.217 J0 P1  F30000
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
G1 Z13.06 F900 ; lower z a little
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

    G1 Z112.56 F600
    G1 Z110.56

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

