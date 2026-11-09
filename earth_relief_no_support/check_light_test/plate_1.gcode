; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 20m 40s; total estimated time: 27m 54s
; total layer number: 88
; total filament length [mm] : 1539.27
; total filament volume [cm^3] : 3702.38
; total filament weight [g] : 4.59
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 7.16
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
; bottom_color_penetration_layers = 7
; bottom_shell_layers = 5
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 20
; brim_object_gap = 0.1
; brim_type = outer_only
; brim_width = 5
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
; initial_layer_infill_speed = 40
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 20
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.5
; inner_wall_speed = 80
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
; ironing_flow = 8%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.08
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
; outer_wall_line_width = 0.45
; outer_wall_speed = 35
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
; print_settings_id = 0.08mm Earth no supports @P1S
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
; sparse_infill_speed = 450
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
; support_bottom_z_distance = 0.08
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
; top_color_penetration_layers = 9
; top_one_wall_type = all top
; top_shell_layers = 6
; top_shell_thickness = 0.8
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
M73 P0 R27
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
M73 P2 R27
G1 E50 F200
M400
M104 S220
G92 E0
M73 P17 R23
G1 E50 F200
M400
M106 P1 S255
G92 E0
M73 P17 R22
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P18 R22
G1 E-0.5 F300

M73 P19 R22
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
M73 P20 R22
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
    G29 A X99.3293 Y113.329 I57.3414 J29.3414
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
G0 X240 E15 F484.772
G0 Y11 E0.700 F121.193
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F484.772
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
; layer num/total_layer_count: 1/88
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
; OBJECT_ID: 15
G1 X100.926 Y112.797 F30000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1200
M204 S500
G1 X101.419 Y112.386 E.0239
G1 X101.964 Y112.053 E.02378
G1 X102.802 Y111.727 E.03351
G1 X103.429 Y111.596 E.02386
G1 X104.008 Y111.558 E.02159
G1 X151.992 Y111.558 E1.78722
M73 P21 R22
G1 X152.64 Y111.606 E.02422
G1 X153.263 Y111.746 E.02377
G1 X154.106 Y112.103 E.0341
G1 X154.724 Y112.5 E.02737
G1 X155.203 Y112.926 E.02386
M73 P21 R21
G1 X155.614 Y113.419 E.0239
G1 X155.947 Y113.964 E.02378
G1 X156.273 Y114.802 E.03351
G1 X156.404 Y115.429 E.02386
G1 X156.442 Y116.008 E.0216
G1 X156.442 Y135.991 E.74432
G1 X156.394 Y136.64 E.02422
G1 X156.254 Y137.263 E.02377
G1 X155.897 Y138.106 E.0341
G1 X155.5 Y138.724 E.02737
G1 X155.074 Y139.203 E.02386
G1 X154.581 Y139.614 E.0239
G1 X154.036 Y139.947 E.02378
G1 X153.198 Y140.273 E.03351
G1 X152.571 Y140.404 E.02386
G1 X151.992 Y140.442 E.0216
G1 X104.009 Y140.442 E1.78721
G1 X103.36 Y140.394 E.02422
G1 X102.739 Y140.254 E.02373
G1 X101.812 Y139.851 E.03765
G1 X101.277 Y139.501 E.02381
G1 X100.797 Y139.074 E.0239
G1 X100.386 Y138.581 E.0239
G1 X100.053 Y138.036 E.02378
G1 X99.727 Y137.198 E.03351
M73 P22 R21
G1 X99.596 Y136.571 E.02386
G1 X99.558 Y135.992 E.02159
G1 X99.558 Y116.008 E.74433
M73 P23 R21
G1 X99.606 Y115.36 E.02422
G1 X99.746 Y114.737 E.02377
G1 X100.103 Y113.894 E.0341
G1 X100.5 Y113.276 E.02737
M73 P24 R21
G1 X100.886 Y112.842 E.02163
M204 S6000
M73 P25 R20
G1 X101.228 Y113.145 F30000
G1 F1200
M204 S500
G1 X101.238 Y113.134 E.00055
G1 X101.678 Y112.765 E.02137
G1 X102.157 Y112.471 E.02094
G1 X102.944 Y112.165 E.03145
G1 X103.482 Y112.052 E.02048
G1 X104.027 Y112.015 E.02036
G1 X151.98 Y112.015 E1.78605
G1 X152.582 Y112.061 E.02251
G1 X153.133 Y112.188 E.02105
G1 X153.881 Y112.505 E.03024
M73 P26 R20
G1 X154.455 Y112.873 E.02541
G1 X154.88 Y113.253 E.02123
G1 X155.235 Y113.678 E.02062
G1 X155.529 Y114.157 E.02094
G1 X155.829 Y114.922 E.03061
G1 X155.951 Y115.501 E.02203
G1 X155.985 Y116.027 E.01966
G1 X155.985 Y135.969 E.74277
G1 X155.942 Y136.562 E.02214
G1 X155.812 Y137.133 E.02181
G1 X155.495 Y137.881 E.03024
G1 X155.14 Y138.438 E.02461
G1 X154.747 Y138.88 E.02203
G1 X154.322 Y139.235 E.02062
G1 X153.843 Y139.529 E.02094
G1 X153.056 Y139.835 E.03145
G1 X152.518 Y139.948 E.02048
G1 X151.973 Y139.985 E.02037
G1 X104.031 Y139.985 E1.78566
G1 X103.438 Y139.942 E.02214
G1 X102.894 Y139.82 E.02075
G1 X102.02 Y139.441 E.0355
G1 X101.548 Y139.13 E.02105
G1 X101.134 Y138.762 E.02062
G1 X100.765 Y138.322 E.02137
G1 X100.471 Y137.843 E.02094
G1 X100.165 Y137.056 E.03145
G1 X100.052 Y136.518 E.02048
G1 X100.015 Y135.973 E.02036
G1 X100.015 Y116.02 E.74315
G1 X100.058 Y115.438 E.02176
G1 X100.18 Y114.89 E.0209
G1 X100.515 Y114.099 E.03201
G1 X100.86 Y113.562 E.02375
G1 X101.189 Y113.19 E.0185
M204 S6000
G1 X101.532 Y113.492 F30000
G1 F1200
M204 S500
G1 X101.551 Y113.47 E.00108
G1 X101.938 Y113.143 E.01884
G1 X102.372 Y112.878 E.01897
G1 X103.085 Y112.602 E.02848
G1 X103.554 Y112.505 E.01781
G1 X104.047 Y112.472 E.01843
G1 X151.957 Y112.472 E1.78445
G1 X152.503 Y112.514 E.0204
G1 X153.003 Y112.629 E.01911
G1 X153.677 Y112.917 E.02729
G1 X154.169 Y113.232 E.02175
G1 X154.543 Y113.564 E.01866
G1 X154.868 Y113.953 E.01887
G1 X155.123 Y114.373 E.01826
G1 X155.392 Y115.065 E.02766
G1 X155.495 Y115.553 E.01861
G1 X155.528 Y116.038 E.01809
G1 X155.528 Y135.948 E.74156
G1 X155.489 Y136.484 E.02004
G1 X155.371 Y137.004 E.01984
G1 X155.094 Y137.657 E.02643
G1 X154.781 Y138.153 E.02183
G1 X154.421 Y138.558 E.02018
G1 X154.047 Y138.868 E.0181
G1 X153.628 Y139.122 E.01825
G1 X152.915 Y139.398 E.02848
G1 X152.446 Y139.495 E.01781
G1 X151.952 Y139.528 E.01843
G1 X104.052 Y139.528 E1.7841
G1 X103.515 Y139.489 E.02008
G1 X103.049 Y139.387 E.01776
G1 X102.228 Y139.031 E.03332
G1 X101.819 Y138.76 E.01827
G1 X101.456 Y138.435 E.01814
G1 X101.132 Y138.046 E.01888
G1 X100.878 Y137.628 E.01822
G1 X100.602 Y136.915 E.02848
G1 X100.505 Y136.446 E.01781
G1 X100.472 Y135.953 E.01843
G1 X100.473 Y116.032 E.74196
G1 X100.511 Y115.515 E.01933
G1 X100.615 Y115.042 E.01802
G1 X100.928 Y114.303 E.0299
G1 X101.22 Y113.847 E.02015
G1 X101.492 Y113.537 E.0154
M204 S6000
G1 X101.836 Y113.84 F30000
G1 F1200
M204 S500
G1 X101.88 Y113.79 E.00249
G1 X102.215 Y113.51 E.01628
G1 X102.587 Y113.285 E.01621
G1 X103.226 Y113.04 E.02549
G1 X103.625 Y112.959 E.01516
G1 X104.068 Y112.929 E.01653
G1 X151.934 Y112.929 E1.78286
G1 X152.424 Y112.966 E.01827
G1 X152.872 Y113.07 E.01714
G1 X153.472 Y113.328 E.02433
M73 P27 R20
G1 X153.883 Y113.591 E.01817
G1 X154.207 Y113.877 E.01607
G1 X154.489 Y114.212 E.01633
G1 X154.716 Y114.587 E.01632
G1 X154.955 Y115.206 E.02473
G1 X155.041 Y115.626 E.01595
G1 X155.07 Y116.049 E.0158
G1 X155.071 Y135.926 E.74035
G1 X155.036 Y136.406 E.01793
G1 X154.929 Y136.874 E.01787
G1 X154.692 Y137.434 E.02266
G1 X154.42 Y137.867 E.01905
G1 X154.094 Y138.235 E.0183
G1 X153.772 Y138.5 E.01554
G1 X153.414 Y138.715 E.01556
G1 X152.774 Y138.96 E.02552
G1 X152.375 Y139.041 E.01516
G1 X151.932 Y139.071 E.01653
G1 X104.074 Y139.071 E1.78254
G1 X103.59 Y139.036 E.01806
G1 X103.203 Y138.952 E.01476
G1 X102.437 Y138.621 E.0311
G1 X102.092 Y138.39 E.01545
G1 X101.779 Y138.109 E.01566
G1 X101.499 Y137.771 E.01637
G1 X101.285 Y137.414 E.0155
G1 X101.04 Y136.774 E.02552
G1 X100.959 Y136.375 E.01516
G1 X100.929 Y135.932 E.01652
G1 X100.93 Y116.044 E.74076
G1 X100.964 Y115.591 E.01694
G1 X101.05 Y115.194 E.01513
G1 X101.34 Y114.507 E.02778
G1 X101.592 Y114.115 E.01736
G1 X101.796 Y113.885 E.01143
M204 S6000
G1 X102.138 Y114.19 F30000
G1 F1200
M204 S500
G1 X102.207 Y114.112 E.0039
G1 X102.491 Y113.877 E.01371
G1 X102.8 Y113.692 E.01343
G1 X103.365 Y113.478 E.02252
G1 X103.695 Y113.412 E.01252
G1 X104.087 Y113.386 E.01465
G1 X151.912 Y113.386 E1.7813
G1 X152.344 Y113.418 E.01612
G1 X152.74 Y113.511 E.01515
G1 X153.267 Y113.739 E.02137
G1 X153.598 Y113.952 E.01466
G1 X153.871 Y114.19 E.0135
G1 X154.121 Y114.488 E.0145
G1 X154.308 Y114.8 E.01355
G1 X154.517 Y115.347 E.02179
G1 X154.588 Y115.697 E.01331
G1 X154.613 Y116.06 E.01355
G1 X154.614 Y135.915 E.73951
G1 X154.584 Y136.328 E.01543
G1 X154.495 Y136.721 E.015
G1 X154.279 Y137.231 E.02065
G1 X154.059 Y137.583 E.01544
G1 X153.783 Y137.897 E.01557
G1 X153.499 Y138.131 E.01372
G1 X153.201 Y138.307 E.01287
G1 X152.635 Y138.522 E.02259
G1 X152.305 Y138.588 E.01251
G1 X151.913 Y138.614 E.01465
G1 X104.095 Y138.614 E1.78101
G1 X103.665 Y138.583 E.01607
G1 X103.357 Y138.518 E.01174
G1 X102.646 Y138.211 E.02884
G1 X102.366 Y138.022 E.01258
G1 X102.104 Y137.784 E.01318
G1 X101.868 Y137.497 E.01385
G1 X101.693 Y137.202 E.01278
G1 X101.478 Y136.635 E.02259
G1 X101.412 Y136.305 E.01252
G1 X101.386 Y135.913 E.01465
G1 X101.388 Y116.056 E.73958
G1 X101.417 Y115.666 E.01459
G1 X101.485 Y115.345 E.01222
G1 X101.752 Y114.711 E.02561
G1 X101.965 Y114.384 E.01452
G1 X102.098 Y114.235 E.00745
M204 S6000
G1 X102.464 Y114.527 F30000
G1 F1200
M204 S500
G1 X102.48 Y114.508 E.00092
G1 X102.842 Y114.208 E.0175
G1 X103.185 Y114.023 E.01452
G1 X103.553 Y113.904 E.0144
G1 X104.036 Y113.843 E.01815
G1 X151.959 Y113.843 E1.78496
G1 X152.407 Y113.899 E.0168
G1 X152.859 Y114.04 E.01763
G1 X153.033 Y114.133 E.00737
G1 X153.41 Y114.405 E.0173
G1 X153.658 Y114.658 E.0132
G1 X153.781 Y114.822 E.00764
G1 X154.048 Y115.371 E.02273
G1 X154.115 Y115.645 E.01053
M73 P28 R20
G1 X154.157 Y116.035 E.01459
G1 X154.157 Y135.966 E.74238
G1 X154.089 Y136.459 E.01853
G1 X153.92 Y136.939 E.01896
G1 X153.81 Y137.132 E.00828
G1 X153.637 Y137.367 E.01084
G1 X153.337 Y137.663 E.01571
G1 X153.178 Y137.781 E.00737
G1 X152.629 Y138.048 E.02273
G1 X152.355 Y138.115 E.01053
G1 X151.965 Y138.157 E.01459
G1 X104.034 Y138.157 E1.78527
G1 X103.541 Y138.089 E.01853
G1 X103.061 Y137.92 E.01896
G1 X102.868 Y137.81 E.00828
G1 X102.633 Y137.637 E.01084
G1 X102.337 Y137.337 E.01571
G1 X102.219 Y137.178 E.00737
G1 X101.952 Y136.629 E.02273
G1 X101.885 Y136.354 E.01056
G1 X101.847 Y136.033 E.01202
G1 X101.843 Y116.041 E.74465
G1 X101.899 Y115.592 E.01686
G1 X102.003 Y115.233 E.01391
G1 X102.198 Y114.862 E.01562
G1 X102.427 Y114.574 E.01369
M204 S6000
G1 X102.777 Y114.865 F30000
G1 F1200
M204 S500
G1 X102.839 Y114.791 E.00358
G1 X103.131 Y114.562 E.01382
G1 X103.398 Y114.427 E.01116
G1 X103.692 Y114.339 E.01143
G1 X104.027 Y114.3 E.01256
G1 X151.968 Y114.3 E1.7856
G1 X152.355 Y114.353 E.01457
G1 X152.645 Y114.443 E.01128
G1 X152.769 Y114.506 E.0052
G1 X153.075 Y114.717 E.01383
G1 X153.338 Y114.984 E.01397
G1 X153.411 Y115.09 E.00479
G1 X153.603 Y115.478 E.01614
G1 X153.66 Y115.69 E.00819
M73 P28 R19
G1 X153.7 Y116.027 E.01264
G1 X153.7 Y135.976 E.743
G1 X153.659 Y136.306 E.01241
G1 X153.529 Y136.702 E.01553
G1 X153.408 Y136.913 E.00903
G1 X153.269 Y137.097 E.00859
G1 X153.016 Y137.338 E.013
G1 X152.91 Y137.411 E.00481
G1 X152.522 Y137.603 E.01614
G1 X152.31 Y137.66 E.00819
G1 X151.973 Y137.7 E.01264
G1 X104.024 Y137.7 E1.78589
G1 X103.694 Y137.659 E.01241
G1 X103.298 Y137.529 E.01553
G1 X103.087 Y137.408 E.00903
G1 X102.903 Y137.269 E.00859
G1 X102.663 Y137.016 E.01299
G1 X102.589 Y136.91 E.00481
G1 X102.397 Y136.522 E.01615
G1 X102.339 Y136.31 E.00819
G1 X102.3 Y135.973 E.01263
G1 X102.3 Y116.032 E.7427
G1 X102.353 Y115.645 E.01457
G1 X102.443 Y115.358 E.01116
G1 X102.6 Y115.078 E.01199
G1 X102.739 Y114.911 E.00809
M204 S6000
G1 X103.091 Y115.203 F30000
G1 F1200
M204 S500
G1 X103.196 Y115.076 E.00615
G1 X103.403 Y114.929 E.00943
G1 X103.6 Y114.837 E.0081
G1 X103.742 Y114.794 E.00552
G1 X104.019 Y114.757 E.01043
G1 X151.977 Y114.757 E1.78624
G1 X152.295 Y114.806 E.01198
G1 X152.503 Y114.878 E.00819
G1 X152.827 Y115.101 E.01467
G1 X153.003 Y115.295 E.00976
G1 X153.164 Y115.603 E.01293
G1 X153.206 Y115.742 E.0054
G1 X153.243 Y116.019 E.01044
G1 X153.243 Y135.984 E.74361
G1 X153.224 Y136.166 E.00679
G1 X153.13 Y136.48 E.01222
G1 X153.051 Y136.629 E.00628
G1 X152.899 Y136.828 E.00934
G1 X152.705 Y137.003 E.00972
G1 X152.397 Y137.164 E.01294
G1 X152.258 Y137.206 E.0054
G1 X151.981 Y137.243 E.01044
G1 X104.016 Y137.243 E1.78651
G1 X103.834 Y137.224 E.00679
G1 X103.52 Y137.13 E.01222
G1 X103.371 Y137.051 E.00628
G1 X103.172 Y136.899 E.00934
G1 X102.997 Y136.705 E.00972
G1 X102.836 Y136.397 E.01294
G1 X102.794 Y136.258 E.0054
G1 X102.757 Y135.981 E.01043
G1 X102.757 Y116.023 E.74335
G1 X102.806 Y115.705 E.01198
G1 X102.878 Y115.497 E.00819
M73 P29 R19
G1 X102.944 Y115.379 E.00504
G1 X103.053 Y115.249 E.00631
M204 S6000
G1 X103.41 Y115.521 F30000
G1 F1200
M204 S500
G1 X103.473 Y115.439 E.00383
G1 X103.586 Y115.348 E.00541
G1 X103.803 Y115.246 E.00893
G1 X104.011 Y115.214 E.00782
G1 X151.988 Y115.214 E1.78696
G1 X152.221 Y115.257 E.00884
G1 X152.339 Y115.304 E.00475
G1 X152.561 Y115.473 E.01037
G1 X152.652 Y115.586 E.00541
G1 X152.754 Y115.803 E.00892
G1 X152.786 Y116.011 E.00782
G1 X152.786 Y135.991 E.74421
G1 X152.77 Y136.118 E.00475
G1 X152.694 Y136.343 E.00884
G1 X152.527 Y136.561 E.01023
G1 X152.414 Y136.652 E.00541
G1 X152.197 Y136.754 E.00892
G1 X151.989 Y136.786 E.00782
G1 X104.009 Y136.786 E1.7871
G1 X103.882 Y136.77 E.00475
G1 X103.657 Y136.694 E.00884
G1 X103.439 Y136.527 E.01023
G1 X103.348 Y136.414 E.00541
G1 X103.246 Y136.197 E.00893
G1 X103.214 Y135.989 E.00782
G1 X103.214 Y116.012 E.74407
G1 X103.257 Y115.779 E.00884
G1 X103.304 Y115.661 E.00475
G1 X103.374 Y115.568 E.00431
M204 S6000
G1 X103.747 Y115.805 F30000
G1 F1200
M204 S500
G1 X103.884 Y115.696 E.00651
G1 X104 Y115.671 E.00442
G1 X152 Y115.671 E1.78782
G1 X152.111 Y115.7 E.00426
G1 X152.195 Y115.747 E.00361
G1 X152.304 Y115.884 E.00651
G1 X152.329 Y116 E.00442
G1 X152.329 Y136 E.74492
G1 X152.3 Y136.111 E.00426
G1 X152.253 Y136.195 E.00361
G1 X152.116 Y136.304 E.00651
G1 X152 Y136.329 E.00442
G1 X104 Y136.329 E1.78782
G1 X103.889 Y136.3 E.00426
G1 X103.805 Y136.253 E.00361
G1 X103.696 Y136.116 E.00651
G1 X103.671 Y136 E.00442
G1 X103.671 Y116 E.74492
G1 X103.7 Y115.889 E.00426
G1 X103.718 Y115.857 E.00137
; WIPE_START
G1 X103.884 Y115.696 E-.08797
G1 X104 Y115.671 E-.04514
G1 X105.65 Y115.671 E-.6269
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.652 Y118.708 Z.6 F30000
G1 X151.6 Y135.6 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1200
M204 S500
G1 X104.4 Y135.6 E1.75802
G1 X104.4 Y116.4 E.71513
G1 X151.6 Y116.4 E1.75802
G1 X151.6 Y135.54 E.71289
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
M204 S6000
G1 X151.143 Y135.143 F30000
; FEATURE: Inner wall
G1 F1200
M204 S500
G1 X104.857 Y135.143 E1.72397
G1 X104.857 Y116.857 E.68108
G1 X151.143 Y116.857 E1.72397
G1 X151.143 Y135.083 E.67884
M204 S6000
G1 X150.686 Y134.686 F30000
G1 F1200
M204 S500
G1 X105.314 Y134.686 E1.68992
G1 X105.314 Y117.314 E.64703
G1 X150.686 Y117.314 E1.68992
G1 X150.686 Y134.626 E.6448
; WIPE_START
M73 P30 R19
G1 X148.686 Y134.629 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X149.083 Y127.006 Z.6 F30000
G1 X149.578 Y117.497 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50035
G1 F2400
M204 S500
G1 X150.297 Y118.216 E.0379
G1 X150.297 Y118.863 E.02411
G1 X149.137 Y117.703 E.06116
G1 X148.49 Y117.703 E.02411
G1 X150.297 Y119.51 E.09526
G1 X150.297 Y120.157 E.02411
G1 X147.843 Y117.703 E.12936
G1 X147.196 Y117.703 E.02411
G1 X150.297 Y120.804 E.16347
G1 X150.297 Y121.451 E.02411
G1 X146.549 Y117.703 E.19757
G1 X145.903 Y117.703 E.02411
G1 X150.297 Y122.097 E.23167
G1 X150.297 Y122.744 E.02411
G1 X145.256 Y117.703 E.26577
G1 X144.609 Y117.703 E.02411
G1 X150.297 Y123.391 E.29987
G1 X150.297 Y124.038 E.02411
G1 X143.962 Y117.703 E.33397
G1 X143.315 Y117.703 E.02411
G1 X150.297 Y124.685 E.36807
G1 X150.297 Y125.332 E.02411
G1 X142.668 Y117.703 E.40217
G1 X142.021 Y117.703 E.02411
G1 X150.297 Y125.979 E.43627
G1 X150.297 Y126.626 E.02411
G1 X141.374 Y117.703 E.47038
G1 X140.727 Y117.703 E.02411
G1 X150.297 Y127.273 E.50448
G1 X150.297 Y127.92 E.02411
G1 X140.08 Y117.703 E.53858
G1 X139.434 Y117.703 E.02411
G1 X150.297 Y128.566 E.57268
G1 X150.297 Y129.213 E.02411
M73 P31 R19
G1 X138.787 Y117.703 E.60678
G1 X138.14 Y117.703 E.02411
G1 X150.297 Y129.86 E.64088
G1 X150.297 Y130.507 E.02411
G1 X137.493 Y117.703 E.67498
G1 X136.846 Y117.703 E.02411
G1 X150.297 Y131.154 E.70908
G1 X150.297 Y131.801 E.02411
G1 X136.199 Y117.703 E.74319
G1 X135.552 Y117.703 E.02411
G1 X150.297 Y132.448 E.77729
G1 X150.297 Y133.095 E.02411
G1 X134.905 Y117.703 E.81139
G1 X134.258 Y117.703 E.02411
G1 X150.297 Y133.742 E.84549
G1 X150.297 Y134.297 E.02071
G1 X150.206 Y134.297 E.0034
G1 X133.611 Y117.703 E.87478
G1 X132.964 Y117.703 E.02411
G1 X149.559 Y134.297 E.87478
G1 X148.912 Y134.297 E.02411
G1 X132.318 Y117.703 E.87478
G1 X131.671 Y117.703 E.02411
G1 X148.265 Y134.297 E.87478
G1 X147.618 Y134.297 E.02411
G1 X131.024 Y117.703 E.87478
G1 X130.377 Y117.703 E.02411
G1 X146.972 Y134.297 E.87478
G1 X146.325 Y134.297 E.02411
G1 X129.73 Y117.703 E.87478
G1 X129.083 Y117.703 E.02411
G1 X145.678 Y134.297 E.87478
G1 X145.031 Y134.297 E.02411
G1 X128.436 Y117.703 E.87478
G1 X127.789 Y117.703 E.02411
G1 X144.384 Y134.297 E.87478
G1 X143.737 Y134.297 E.02411
G1 X127.142 Y117.703 E.87478
G1 X126.495 Y117.703 E.02411
G1 X143.09 Y134.297 E.87478
G1 X142.443 Y134.297 E.02411
G1 X125.849 Y117.703 E.87478
G1 X125.202 Y117.703 E.02411
G1 X141.796 Y134.297 E.87478
G1 X141.149 Y134.297 E.02411
G1 X124.555 Y117.703 E.87478
G1 X123.908 Y117.703 E.02411
G1 X140.503 Y134.297 E.87478
G1 X139.856 Y134.297 E.02411
G1 X123.261 Y117.703 E.87478
G1 X122.614 Y117.703 E.02411
M73 P31 R18
G1 X139.209 Y134.297 E.87478
G1 X138.562 Y134.297 E.02411
M73 P32 R18
G1 X121.967 Y117.703 E.87478
G1 X121.32 Y117.703 E.02411
G1 X137.915 Y134.297 E.87478
G1 X137.268 Y134.297 E.02411
G1 X120.673 Y117.703 E.87478
G1 X120.026 Y117.703 E.02411
G1 X136.621 Y134.297 E.87478
G1 X135.974 Y134.297 E.02411
G1 X119.38 Y117.703 E.87478
G1 X118.733 Y117.703 E.02411
G1 X135.327 Y134.297 E.87478
G1 X134.68 Y134.297 E.02411
G1 X118.086 Y117.703 E.87478
G1 X117.439 Y117.703 E.02411
G1 X134.034 Y134.297 E.87478
G1 X133.387 Y134.297 E.02411
G1 X116.792 Y117.703 E.87478
G1 X116.145 Y117.703 E.02411
G1 X132.74 Y134.297 E.87478
G1 X132.093 Y134.297 E.02411
G1 X115.498 Y117.703 E.87478
G1 X114.851 Y117.703 E.02411
G1 X131.446 Y134.297 E.87478
G1 X130.799 Y134.297 E.02411
G1 X114.204 Y117.703 E.87478
G1 X113.557 Y117.703 E.02411
G1 X130.152 Y134.297 E.87478
G1 X129.505 Y134.297 E.02411
G1 X112.91 Y117.703 E.87478
G1 X112.264 Y117.703 E.02411
G1 X128.858 Y134.297 E.87478
G1 X128.211 Y134.297 E.02411
G1 X111.617 Y117.703 E.87478
G1 X110.97 Y117.703 E.02411
G1 X127.564 Y134.297 E.87478
G1 X126.918 Y134.297 E.02411
G1 X110.323 Y117.703 E.87478
G1 X109.676 Y117.703 E.02411
G1 X126.271 Y134.297 E.87478
G1 X125.624 Y134.297 E.02411
G1 X109.029 Y117.703 E.87478
G1 X108.382 Y117.703 E.02411
G1 X124.977 Y134.297 E.87478
G1 X124.33 Y134.297 E.02411
G1 X107.735 Y117.703 E.87478
G1 X107.088 Y117.703 E.02411
G1 X123.683 Y134.297 E.87478
G1 X123.036 Y134.297 E.02411
G1 X106.441 Y117.703 E.87478
G1 X105.795 Y117.703 E.02411
G1 X122.389 Y134.297 E.87478
G1 X121.742 Y134.297 E.02411
G1 X105.703 Y118.258 E.84552
M73 P33 R18
G1 X105.703 Y118.905 E.02411
G1 X121.095 Y134.297 E.81142
G1 X120.449 Y134.297 E.02411
G1 X105.703 Y119.551 E.77732
G1 X105.703 Y120.198 E.02411
G1 X119.802 Y134.297 E.74322
G1 X119.155 Y134.297 E.02411
G1 X105.703 Y120.845 E.70912
G1 X105.703 Y121.492 E.02411
G1 X118.508 Y134.297 E.67502
G1 X117.861 Y134.297 E.02411
G1 X105.703 Y122.139 E.64092
G1 X105.703 Y122.786 E.02411
G1 X117.214 Y134.297 E.60682
G1 X116.567 Y134.297 E.02411
G1 X105.703 Y123.433 E.57271
G1 X105.703 Y124.08 E.02411
G1 X115.92 Y134.297 E.53861
G1 X115.273 Y134.297 E.02411
G1 X105.703 Y124.727 E.50451
G1 X105.703 Y125.374 E.02411
G1 X114.626 Y134.297 E.47041
G1 X113.98 Y134.297 E.02411
G1 X105.703 Y126.02 E.43631
G1 X105.703 Y126.667 E.02411
G1 X113.333 Y134.297 E.40221
G1 X112.686 Y134.297 E.02411
G1 X105.703 Y127.314 E.36811
G1 X105.703 Y127.961 E.02411
G1 X112.039 Y134.297 E.33401
G1 X111.392 Y134.297 E.02411
G1 X105.703 Y128.608 E.29991
G1 X105.703 Y129.255 E.02411
G1 X110.745 Y134.297 E.2658
G1 X110.098 Y134.297 E.02411
G1 X105.703 Y129.902 E.2317
G1 X105.703 Y130.549 E.02411
G1 X109.451 Y134.297 E.1976
G1 X108.804 Y134.297 E.02411
G1 X105.703 Y131.196 E.1635
G1 X105.703 Y131.843 E.02411
G1 X108.157 Y134.297 E.1294
G1 X107.51 Y134.297 E.02411
G1 X105.703 Y132.49 E.0953
G1 X105.703 Y133.136 E.02411
G1 X106.864 Y134.297 E.0612
G1 X106.217 Y134.297 E.02411
G1 X105.497 Y133.578 E.03794
; CHANGE_LAYER
; Z_HEIGHT: 0.28
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F2400
G1 X106.217 Y134.297 E-.38676
M73 P34 R18
G1 X106.864 Y134.297 E-.24583
G1 X106.626 Y134.06 E-.12741
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/88
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
G3 Z.6 I-.021 J1.217 P1  F30000
G1 X150.834 Y134.834 Z.6
G1 Z.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.817 Y134.639 Z.68 F30000
G1 Z.28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423508
G1 F21000
G1 X150.458 Y133.999 E.012
G1 X150.458 Y133.424 E.00761
G1 X149.424 Y134.458 E.01937
G1 X148.849 Y134.458 E.00761
G1 X150.458 Y132.849 E.03013
G1 X150.458 Y132.275 E.00761
G1 X148.275 Y134.458 E.04089
G1 X147.7 Y134.458 E.00761
G1 X150.458 Y131.7 E.05166
G1 X150.458 Y131.125 E.00761
G1 X147.125 Y134.458 E.06242
G1 X146.551 Y134.458 E.00761
G1 X150.458 Y130.551 E.07318
G1 X150.458 Y129.976 E.00761
G1 X145.976 Y134.458 E.08395
G1 X145.402 Y134.458 E.00761
G1 X150.458 Y129.402 E.09471
G1 X150.458 Y128.827 E.00761
G1 X144.827 Y134.458 E.10547
G1 X144.252 Y134.458 E.00761
G1 X150.458 Y128.252 E.11624
G1 X150.458 Y127.678 E.00761
G1 X143.678 Y134.458 E.127
G1 X143.103 Y134.458 E.00761
G1 X150.458 Y127.103 E.13777
G1 X150.458 Y126.528 E.00761
G1 X142.528 Y134.458 E.14853
G1 X141.954 Y134.458 E.00761
G1 X150.458 Y125.954 E.15929
G1 X150.458 Y125.379 E.00761
G1 X141.379 Y134.458 E.17006
G1 X140.804 Y134.458 E.00761
G1 X150.458 Y124.804 E.18082
G1 X150.458 Y124.23 E.00761
G1 X140.23 Y134.458 E.19158
G1 X139.655 Y134.458 E.00761
G1 X150.458 Y123.655 E.20235
G1 X150.458 Y123.08 E.00761
G1 X139.08 Y134.458 E.21311
G1 X138.506 Y134.458 E.00761
G1 X150.458 Y122.506 E.22387
G1 X150.458 Y121.931 E.00761
G1 X137.931 Y134.458 E.23464
G1 X137.356 Y134.458 E.00761
G1 X150.458 Y121.356 E.2454
G1 X150.458 Y120.782 E.00761
G1 X136.782 Y134.458 E.25617
M73 P35 R18
G1 X136.207 Y134.458 E.00761
G1 X150.458 Y120.207 E.26693
G1 X150.458 Y119.632 E.00761
G1 X135.632 Y134.458 E.27769
G1 X135.058 Y134.458 E.00761
G1 X150.458 Y119.058 E.28846
G1 X150.458 Y118.483 E.00761
G1 X134.483 Y134.458 E.29922
G1 X133.909 Y134.458 E.00761
G1 X150.458 Y117.909 E.30998
G1 X150.458 Y117.542 E.00485
G1 X150.25 Y117.542 E.00276
G1 X133.334 Y134.458 E.31685
G1 X132.759 Y134.458 E.00761
G1 X149.675 Y117.542 E.31685
G1 X149.101 Y117.542 E.00761
G1 X132.185 Y134.458 E.31685
G1 X131.61 Y134.458 E.00761
G1 X148.526 Y117.542 E.31685
G1 X147.951 Y117.542 E.00761
G1 X131.035 Y134.458 E.31685
G1 X130.461 Y134.458 E.00761
G1 X147.377 Y117.542 E.31685
G1 X146.802 Y117.542 E.00761
G1 X129.886 Y134.458 E.31685
G1 X129.311 Y134.458 E.00761
G1 X146.227 Y117.542 E.31685
G1 X145.653 Y117.542 E.00761
G1 X128.737 Y134.458 E.31685
G1 X128.162 Y134.458 E.00761
G1 X145.078 Y117.542 E.31685
G1 X144.503 Y117.542 E.00761
G1 X127.587 Y134.458 E.31685
G1 X127.013 Y134.458 E.00761
G1 X143.929 Y117.542 E.31685
G1 X143.354 Y117.542 E.00761
G1 X126.438 Y134.458 E.31685
G1 X125.863 Y134.458 E.00761
G1 X142.779 Y117.542 E.31685
G1 X142.205 Y117.542 E.00761
G1 X125.289 Y134.458 E.31685
G1 X124.714 Y134.458 E.00761
G1 X141.63 Y117.542 E.31685
G1 X141.055 Y117.542 E.00761
G1 X124.139 Y134.458 E.31685
G1 X123.565 Y134.458 E.00761
G1 X140.481 Y117.542 E.31685
G1 X139.906 Y117.542 E.00761
G1 X122.99 Y134.458 E.31685
G1 X122.415 Y134.458 E.00761
G1 X139.331 Y117.542 E.31685
G1 X138.757 Y117.542 E.00761
G1 X121.841 Y134.458 E.31685
G1 X121.266 Y134.458 E.00761
G1 X138.182 Y117.542 E.31685
G1 X137.607 Y117.542 E.00761
G1 X120.692 Y134.458 E.31685
G1 X120.117 Y134.458 E.00761
G1 X137.033 Y117.542 E.31685
G1 X136.458 Y117.542 E.00761
G1 X119.542 Y134.458 E.31685
G1 X118.968 Y134.458 E.00761
G1 X135.884 Y117.542 E.31685
G1 X135.309 Y117.542 E.00761
G1 X118.393 Y134.458 E.31685
G1 X117.818 Y134.458 E.00761
G1 X134.734 Y117.542 E.31685
G1 X134.16 Y117.542 E.00761
G1 X117.244 Y134.458 E.31685
G1 X116.669 Y134.458 E.00761
G1 X133.585 Y117.542 E.31685
G1 X133.01 Y117.542 E.00761
G1 X116.094 Y134.458 E.31685
G1 X115.52 Y134.458 E.00761
G1 X132.436 Y117.542 E.31685
G1 X131.861 Y117.542 E.00761
G1 X114.945 Y134.458 E.31685
G1 X114.37 Y134.458 E.00761
G1 X131.286 Y117.542 E.31685
G1 X130.712 Y117.542 E.00761
G1 X113.796 Y134.458 E.31685
G1 X113.221 Y134.458 E.00761
G1 X130.137 Y117.542 E.31685
G1 X129.562 Y117.542 E.00761
G1 X112.646 Y134.458 E.31685
G1 X112.072 Y134.458 E.00761
G1 X128.988 Y117.542 E.31685
G1 X128.413 Y117.542 E.00761
G1 X111.497 Y134.458 E.31685
G1 X110.922 Y134.458 E.00761
G1 X127.838 Y117.542 E.31685
G1 X127.264 Y117.542 E.00761
G1 X110.348 Y134.458 E.31685
G1 X109.773 Y134.458 E.00761
G1 X126.689 Y117.542 E.31685
G1 X126.114 Y117.542 E.00761
G1 X109.198 Y134.458 E.31685
G1 X108.624 Y134.458 E.00761
G1 X125.54 Y117.542 E.31685
G1 X124.965 Y117.542 E.00761
G1 X108.049 Y134.458 E.31685
G1 X107.475 Y134.458 E.00761
G1 X124.39 Y117.542 E.31685
G1 X123.816 Y117.542 E.00761
G1 X106.9 Y134.458 E.31685
G1 X106.325 Y134.458 E.00761
G1 X123.241 Y117.542 E.31685
G1 X122.667 Y117.542 E.00761
G1 X105.751 Y134.458 E.31685
G1 X105.542 Y134.458 E.00276
G1 X105.542 Y134.092 E.00485
G1 X122.092 Y117.542 E.30999
G1 X121.517 Y117.542 E.00761
G1 X105.542 Y133.517 E.29923
G1 X105.542 Y132.943 E.00761
G1 X120.943 Y117.542 E.28846
G1 X120.368 Y117.542 E.00761
G1 X105.542 Y132.368 E.2777
G1 X105.542 Y131.793 E.00761
G1 X119.793 Y117.542 E.26694
G1 X119.219 Y117.542 E.00761
G1 X105.542 Y131.219 E.25617
G1 X105.542 Y130.644 E.00761
G1 X118.644 Y117.542 E.24541
G1 X118.069 Y117.542 E.00761
G1 X105.542 Y130.069 E.23465
G1 X105.542 Y129.495 E.00761
G1 X117.495 Y117.542 E.22388
G1 X116.92 Y117.542 E.00761
G1 X105.542 Y128.92 E.21312
G1 X105.542 Y128.345 E.00761
G1 X116.345 Y117.542 E.20235
G1 X115.771 Y117.542 E.00761
G1 X105.542 Y127.771 E.19159
G1 X105.542 Y127.196 E.00761
G1 X115.196 Y117.542 E.18083
G1 X114.621 Y117.542 E.00761
G1 X105.542 Y126.621 E.17006
G1 X105.542 Y126.047 E.00761
G1 X114.047 Y117.542 E.1593
G1 X113.472 Y117.542 E.00761
G1 X105.542 Y125.472 E.14854
G1 X105.542 Y124.897 E.00761
G1 X112.897 Y117.542 E.13777
G1 X112.323 Y117.542 E.00761
G1 X105.542 Y124.323 E.12701
G1 X105.542 Y123.748 E.00761
G1 X111.748 Y117.542 E.11625
G1 X111.173 Y117.542 E.00761
G1 X105.542 Y123.174 E.10548
G1 X105.542 Y122.599 E.00761
G1 X110.599 Y117.542 E.09472
G1 X110.024 Y117.542 E.00761
G1 X105.542 Y122.024 E.08395
G1 X105.542 Y121.45 E.00761
G1 X109.45 Y117.542 E.07319
G1 X108.875 Y117.542 E.00761
G1 X105.542 Y120.875 E.06243
G1 X105.542 Y120.3 E.00761
G1 X108.3 Y117.542 E.05166
G1 X107.726 Y117.542 E.00761
G1 X105.542 Y119.726 E.0409
G1 X105.542 Y119.151 E.00761
G1 X107.151 Y117.542 E.03014
G1 X106.576 Y117.542 E.00761
G1 X105.542 Y118.576 E.01937
G1 X105.542 Y118.002 E.00761
G1 X106.183 Y117.361 E.012
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X105.542 Y118.002 E-.34442
G1 X105.542 Y118.576 E-.21837
G1 X105.909 Y118.209 E-.19722
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/88
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.68 I-.422 J1.141 P1  F30000
G1 X150.834 Y134.834 Z.68
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
M73 P35 R17
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.094 Z.76 F30000
G1 X150.639 Y118.183 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423508
G1 F21000
G1 X149.999 Y117.542 E.012
G1 X149.424 Y117.542 E.00761
G1 X150.458 Y118.576 E.01937
G1 X150.458 Y119.151 E.00761
G1 X148.849 Y117.542 E.03013
G1 X148.275 Y117.542 E.00761
G1 X150.458 Y119.725 E.04089
G1 X150.458 Y120.3 E.00761
G1 X147.7 Y117.542 E.05166
G1 X147.125 Y117.542 E.00761
G1 X150.458 Y120.874 E.06242
G1 X150.458 Y121.449 E.00761
G1 X146.551 Y117.542 E.07318
G1 X145.976 Y117.542 E.00761
G1 X150.458 Y122.024 E.08395
G1 X150.458 Y122.598 E.00761
G1 X145.402 Y117.542 E.09471
G1 X144.827 Y117.542 E.00761
G1 X150.458 Y123.173 E.10547
G1 X150.458 Y123.748 E.00761
G1 X144.252 Y117.542 E.11624
G1 X143.678 Y117.542 E.00761
G1 X150.458 Y124.322 E.127
G1 X150.458 Y124.897 E.00761
G1 X143.103 Y117.542 E.13777
G1 X142.528 Y117.542 E.00761
G1 X150.458 Y125.472 E.14853
G1 X150.458 Y126.046 E.00761
G1 X141.954 Y117.542 E.15929
G1 X141.379 Y117.542 E.00761
G1 X150.458 Y126.621 E.17006
G1 X150.458 Y127.196 E.00761
G1 X140.804 Y117.542 E.18082
G1 X140.23 Y117.542 E.00761
G1 X150.458 Y127.77 E.19158
G1 X150.458 Y128.345 E.00761
G1 X139.655 Y117.542 E.20235
G1 X139.08 Y117.542 E.00761
G1 X150.458 Y128.92 E.21311
G1 X150.458 Y129.494 E.00761
G1 X138.506 Y117.542 E.22387
G1 X137.931 Y117.542 E.00761
M73 P36 R17
G1 X150.458 Y130.069 E.23464
G1 X150.458 Y130.644 E.00761
G1 X137.356 Y117.542 E.2454
G1 X136.782 Y117.542 E.00761
G1 X150.458 Y131.218 E.25617
G1 X150.458 Y131.793 E.00761
G1 X136.207 Y117.542 E.26693
G1 X135.632 Y117.542 E.00761
G1 X150.458 Y132.368 E.27769
G1 X150.458 Y132.942 E.00761
G1 X135.058 Y117.542 E.28846
G1 X134.483 Y117.542 E.00761
G1 X150.458 Y133.517 E.29922
G1 X150.458 Y134.091 E.00761
G1 X133.909 Y117.542 E.30998
G1 X133.334 Y117.542 E.00761
G1 X150.25 Y134.458 E.31685
G1 X149.675 Y134.458 E.00761
G1 X132.759 Y117.542 E.31685
G1 X132.185 Y117.542 E.00761
G1 X149.1 Y134.458 E.31685
G1 X148.526 Y134.458 E.00761
G1 X131.61 Y117.542 E.31685
G1 X131.035 Y117.542 E.00761
G1 X147.951 Y134.458 E.31685
G1 X147.377 Y134.458 E.00761
G1 X130.461 Y117.542 E.31685
G1 X129.886 Y117.542 E.00761
G1 X146.802 Y134.458 E.31685
G1 X146.227 Y134.458 E.00761
G1 X129.311 Y117.542 E.31685
G1 X128.737 Y117.542 E.00761
G1 X145.653 Y134.458 E.31685
G1 X145.078 Y134.458 E.00761
G1 X128.162 Y117.542 E.31685
G1 X127.587 Y117.542 E.00761
G1 X144.503 Y134.458 E.31685
G1 X143.929 Y134.458 E.00761
G1 X127.013 Y117.542 E.31685
G1 X126.438 Y117.542 E.00761
G1 X143.354 Y134.458 E.31685
G1 X142.779 Y134.458 E.00761
G1 X125.863 Y117.542 E.31685
G1 X125.289 Y117.542 E.00761
G1 X142.205 Y134.458 E.31685
G1 X141.63 Y134.458 E.00761
G1 X124.714 Y117.542 E.31685
G1 X124.139 Y117.542 E.00761
G1 X141.055 Y134.458 E.31685
G1 X140.481 Y134.458 E.00761
G1 X123.565 Y117.542 E.31685
G1 X122.99 Y117.542 E.00761
G1 X139.906 Y134.458 E.31685
G1 X139.331 Y134.458 E.00761
G1 X122.415 Y117.542 E.31685
G1 X121.841 Y117.542 E.00761
G1 X138.757 Y134.458 E.31685
G1 X138.182 Y134.458 E.00761
G1 X121.266 Y117.542 E.31685
G1 X120.692 Y117.542 E.00761
G1 X137.607 Y134.458 E.31685
G1 X137.033 Y134.458 E.00761
G1 X120.117 Y117.542 E.31685
G1 X119.542 Y117.542 E.00761
G1 X136.458 Y134.458 E.31685
G1 X135.884 Y134.458 E.00761
G1 X118.968 Y117.542 E.31685
G1 X118.393 Y117.542 E.00761
G1 X135.309 Y134.458 E.31685
G1 X134.734 Y134.458 E.00761
G1 X117.818 Y117.542 E.31685
G1 X117.244 Y117.542 E.00761
G1 X134.16 Y134.458 E.31685
G1 X133.585 Y134.458 E.00761
G1 X116.669 Y117.542 E.31685
G1 X116.094 Y117.542 E.00761
G1 X133.01 Y134.458 E.31685
G1 X132.436 Y134.458 E.00761
G1 X115.52 Y117.542 E.31685
G1 X114.945 Y117.542 E.00761
G1 X131.861 Y134.458 E.31685
G1 X131.286 Y134.458 E.00761
G1 X114.37 Y117.542 E.31685
G1 X113.796 Y117.542 E.00761
G1 X130.712 Y134.458 E.31685
G1 X130.137 Y134.458 E.00761
G1 X113.221 Y117.542 E.31685
G1 X112.646 Y117.542 E.00761
G1 X129.562 Y134.458 E.31685
G1 X128.988 Y134.458 E.00761
G1 X112.072 Y117.542 E.31685
G1 X111.497 Y117.542 E.00761
G1 X128.413 Y134.458 E.31685
G1 X127.838 Y134.458 E.00761
G1 X110.922 Y117.542 E.31685
G1 X110.348 Y117.542 E.00761
G1 X127.264 Y134.458 E.31685
G1 X126.689 Y134.458 E.00761
G1 X109.773 Y117.542 E.31685
G1 X109.198 Y117.542 E.00761
G1 X126.114 Y134.458 E.31685
G1 X125.54 Y134.458 E.00761
G1 X108.624 Y117.542 E.31685
G1 X108.049 Y117.542 E.00761
G1 X124.965 Y134.458 E.31685
G1 X124.39 Y134.458 E.00761
G1 X107.475 Y117.542 E.31685
G1 X106.9 Y117.542 E.00761
G1 X123.816 Y134.458 E.31685
G1 X123.241 Y134.458 E.00761
G1 X106.325 Y117.542 E.31685
G1 X105.751 Y117.542 E.00761
G1 X122.667 Y134.458 E.31685
G1 X122.092 Y134.458 E.00761
G1 X105.542 Y117.908 E.30999
G1 X105.542 Y118.483 E.00761
G1 X121.517 Y134.458 E.29923
G1 X120.943 Y134.458 E.00761
G1 X105.542 Y119.057 E.28846
G1 X105.542 Y119.632 E.00761
G1 X120.368 Y134.458 E.2777
G1 X119.793 Y134.458 E.00761
G1 X105.542 Y120.207 E.26694
G1 X105.542 Y120.781 E.00761
G1 X119.219 Y134.458 E.25617
G1 X118.644 Y134.458 E.00761
G1 X105.542 Y121.356 E.24541
G1 X105.542 Y121.931 E.00761
G1 X118.069 Y134.458 E.23465
G1 X117.495 Y134.458 E.00761
G1 X105.542 Y122.505 E.22388
G1 X105.542 Y123.08 E.00761
G1 X116.92 Y134.458 E.21312
G1 X116.345 Y134.458 E.00761
G1 X105.542 Y123.655 E.20235
G1 X105.542 Y124.229 E.00761
G1 X115.771 Y134.458 E.19159
G1 X115.196 Y134.458 E.00761
G1 X105.542 Y124.804 E.18083
G1 X105.542 Y125.379 E.00761
G1 X114.621 Y134.458 E.17006
G1 X114.047 Y134.458 E.00761
G1 X105.542 Y125.953 E.1593
G1 X105.542 Y126.528 E.00761
G1 X113.472 Y134.458 E.14854
G1 X112.897 Y134.458 E.00761
G1 X105.542 Y127.103 E.13777
G1 X105.542 Y127.677 E.00761
G1 X112.323 Y134.458 E.12701
G1 X111.748 Y134.458 E.00761
G1 X105.542 Y128.252 E.11625
G1 X105.542 Y128.826 E.00761
G1 X111.174 Y134.458 E.10548
G1 X110.599 Y134.458 E.00761
G1 X105.542 Y129.401 E.09472
G1 X105.542 Y129.976 E.00761
G1 X110.024 Y134.458 E.08395
G1 X109.45 Y134.458 E.00761
G1 X105.542 Y130.55 E.07319
G1 X105.542 Y131.125 E.00761
G1 X108.875 Y134.458 E.06243
G1 X108.3 Y134.458 E.00761
G1 X105.542 Y131.7 E.05166
G1 X105.542 Y132.274 E.00761
G1 X107.726 Y134.458 E.0409
G1 X107.151 Y134.458 E.00761
G1 X105.542 Y132.849 E.03014
G1 X105.542 Y133.424 E.00761
G1 X106.576 Y134.458 E.01937
G1 X106.002 Y134.458 E.00761
G1 X105.361 Y133.817 E.012
; CHANGE_LAYER
; Z_HEIGHT: 0.44
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X106.002 Y134.458 E-.34442
G1 X106.576 Y134.458 E-.21837
G1 X106.209 Y134.091 E-.19721
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/88
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.76 I-.02 J1.217 P1  F30000
G1 X150.834 Y134.834 Z.76
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.817 Y134.639 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423508
G1 F21000
G1 X150.458 Y133.999 E.012
G1 X150.458 Y133.424 E.00761
G1 X149.424 Y134.458 E.01937
G1 X148.849 Y134.458 E.00761
G1 X150.458 Y132.849 E.03013
G1 X150.458 Y132.275 E.00761
G1 X148.275 Y134.458 E.04089
G1 X147.7 Y134.458 E.00761
G1 X150.458 Y131.7 E.05166
G1 X150.458 Y131.125 E.00761
G1 X147.125 Y134.458 E.06242
G1 X146.551 Y134.458 E.00761
G1 X150.458 Y130.551 E.07318
G1 X150.458 Y129.976 E.00761
G1 X145.976 Y134.458 E.08395
G1 X145.402 Y134.458 E.00761
G1 X150.458 Y129.402 E.09471
G1 X150.458 Y128.827 E.00761
G1 X144.827 Y134.458 E.10547
G1 X144.252 Y134.458 E.00761
G1 X150.458 Y128.252 E.11624
G1 X150.458 Y127.678 E.00761
G1 X143.678 Y134.458 E.127
G1 X143.103 Y134.458 E.00761
G1 X150.458 Y127.103 E.13777
G1 X150.458 Y126.528 E.00761
G1 X142.528 Y134.458 E.14853
G1 X141.954 Y134.458 E.00761
G1 X150.458 Y125.954 E.15929
G1 X150.458 Y125.379 E.00761
G1 X141.379 Y134.458 E.17006
G1 X140.804 Y134.458 E.00761
G1 X150.458 Y124.804 E.18082
G1 X150.458 Y124.23 E.00761
G1 X140.23 Y134.458 E.19158
G1 X139.655 Y134.458 E.00761
G1 X150.458 Y123.655 E.20235
G1 X150.458 Y123.08 E.00761
G1 X139.08 Y134.458 E.21311
G1 X138.506 Y134.458 E.00761
G1 X150.458 Y122.506 E.22387
G1 X150.458 Y121.931 E.00761
M73 P37 R17
G1 X137.931 Y134.458 E.23464
G1 X137.356 Y134.458 E.00761
G1 X150.458 Y121.356 E.2454
G1 X150.458 Y120.782 E.00761
G1 X136.782 Y134.458 E.25617
G1 X136.207 Y134.458 E.00761
G1 X150.458 Y120.207 E.26693
G1 X150.458 Y119.632 E.00761
G1 X135.632 Y134.458 E.27769
G1 X135.058 Y134.458 E.00761
G1 X150.458 Y119.058 E.28846
G1 X150.458 Y118.483 E.00761
G1 X134.483 Y134.458 E.29922
G1 X133.909 Y134.458 E.00761
G1 X150.458 Y117.909 E.30998
G1 X150.458 Y117.542 E.00485
G1 X150.25 Y117.542 E.00276
G1 X133.334 Y134.458 E.31685
G1 X132.759 Y134.458 E.00761
G1 X149.675 Y117.542 E.31685
G1 X149.101 Y117.542 E.00761
G1 X132.185 Y134.458 E.31685
G1 X131.61 Y134.458 E.00761
G1 X148.526 Y117.542 E.31685
G1 X147.951 Y117.542 E.00761
G1 X131.035 Y134.458 E.31685
G1 X130.461 Y134.458 E.00761
G1 X147.377 Y117.542 E.31685
G1 X146.802 Y117.542 E.00761
G1 X129.886 Y134.458 E.31685
G1 X129.311 Y134.458 E.00761
G1 X146.227 Y117.542 E.31685
G1 X145.653 Y117.542 E.00761
G1 X128.737 Y134.458 E.31685
G1 X128.162 Y134.458 E.00761
G1 X145.078 Y117.542 E.31685
G1 X144.503 Y117.542 E.00761
G1 X127.587 Y134.458 E.31685
G1 X127.013 Y134.458 E.00761
G1 X143.929 Y117.542 E.31685
G1 X143.354 Y117.542 E.00761
G1 X126.438 Y134.458 E.31685
G1 X125.863 Y134.458 E.00761
G1 X142.779 Y117.542 E.31685
G1 X142.205 Y117.542 E.00761
G1 X125.289 Y134.458 E.31685
G1 X124.714 Y134.458 E.00761
G1 X141.63 Y117.542 E.31685
G1 X141.055 Y117.542 E.00761
G1 X124.139 Y134.458 E.31685
G1 X123.565 Y134.458 E.00761
G1 X140.481 Y117.542 E.31685
G1 X139.906 Y117.542 E.00761
G1 X122.99 Y134.458 E.31685
G1 X122.415 Y134.458 E.00761
G1 X139.331 Y117.542 E.31685
G1 X138.757 Y117.542 E.00761
G1 X121.841 Y134.458 E.31685
G1 X121.266 Y134.458 E.00761
G1 X138.182 Y117.542 E.31685
G1 X137.607 Y117.542 E.00761
G1 X120.692 Y134.458 E.31685
G1 X120.117 Y134.458 E.00761
G1 X137.033 Y117.542 E.31685
G1 X136.458 Y117.542 E.00761
G1 X119.542 Y134.458 E.31685
G1 X118.968 Y134.458 E.00761
G1 X135.884 Y117.542 E.31685
G1 X135.309 Y117.542 E.00761
G1 X118.393 Y134.458 E.31685
G1 X117.818 Y134.458 E.00761
G1 X134.734 Y117.542 E.31685
G1 X134.16 Y117.542 E.00761
G1 X117.244 Y134.458 E.31685
G1 X116.669 Y134.458 E.00761
G1 X133.585 Y117.542 E.31685
G1 X133.01 Y117.542 E.00761
G1 X116.094 Y134.458 E.31685
G1 X115.52 Y134.458 E.00761
G1 X132.436 Y117.542 E.31685
G1 X131.861 Y117.542 E.00761
G1 X114.945 Y134.458 E.31685
G1 X114.37 Y134.458 E.00761
G1 X131.286 Y117.542 E.31685
G1 X130.712 Y117.542 E.00761
G1 X113.796 Y134.458 E.31685
G1 X113.221 Y134.458 E.00761
G1 X130.137 Y117.542 E.31685
G1 X129.562 Y117.542 E.00761
G1 X112.646 Y134.458 E.31685
G1 X112.072 Y134.458 E.00761
G1 X128.988 Y117.542 E.31685
G1 X128.413 Y117.542 E.00761
G1 X111.497 Y134.458 E.31685
G1 X110.922 Y134.458 E.00761
G1 X127.838 Y117.542 E.31685
G1 X127.264 Y117.542 E.00761
G1 X110.348 Y134.458 E.31685
G1 X109.773 Y134.458 E.00761
G1 X126.689 Y117.542 E.31685
G1 X126.114 Y117.542 E.00761
G1 X109.198 Y134.458 E.31685
G1 X108.624 Y134.458 E.00761
G1 X125.54 Y117.542 E.31685
G1 X124.965 Y117.542 E.00761
G1 X108.049 Y134.458 E.31685
G1 X107.475 Y134.458 E.00761
G1 X124.39 Y117.542 E.31685
G1 X123.816 Y117.542 E.00761
G1 X106.9 Y134.458 E.31685
G1 X106.325 Y134.458 E.00761
G1 X123.241 Y117.542 E.31685
G1 X122.667 Y117.542 E.00761
G1 X105.751 Y134.458 E.31685
G1 X105.542 Y134.458 E.00276
G1 X105.542 Y134.092 E.00485
G1 X122.092 Y117.542 E.30999
G1 X121.517 Y117.542 E.00761
G1 X105.542 Y133.517 E.29923
G1 X105.542 Y132.943 E.00761
G1 X120.943 Y117.542 E.28846
G1 X120.368 Y117.542 E.00761
G1 X105.542 Y132.368 E.2777
G1 X105.542 Y131.793 E.00761
G1 X119.793 Y117.542 E.26694
G1 X119.219 Y117.542 E.00761
G1 X105.542 Y131.219 E.25617
G1 X105.542 Y130.644 E.00761
G1 X118.644 Y117.542 E.24541
G1 X118.069 Y117.542 E.00761
G1 X105.542 Y130.069 E.23465
G1 X105.542 Y129.495 E.00761
G1 X117.495 Y117.542 E.22388
G1 X116.92 Y117.542 E.00761
G1 X105.542 Y128.92 E.21312
G1 X105.542 Y128.345 E.00761
G1 X116.345 Y117.542 E.20235
G1 X115.771 Y117.542 E.00761
G1 X105.542 Y127.771 E.19159
G1 X105.542 Y127.196 E.00761
G1 X115.196 Y117.542 E.18083
G1 X114.621 Y117.542 E.00761
G1 X105.542 Y126.621 E.17006
G1 X105.542 Y126.047 E.00761
G1 X114.047 Y117.542 E.1593
G1 X113.472 Y117.542 E.00761
G1 X105.542 Y125.472 E.14854
G1 X105.542 Y124.897 E.00761
G1 X112.897 Y117.542 E.13777
G1 X112.323 Y117.542 E.00761
G1 X105.542 Y124.323 E.12701
G1 X105.542 Y123.748 E.00761
G1 X111.748 Y117.542 E.11625
G1 X111.173 Y117.542 E.00761
G1 X105.542 Y123.174 E.10548
G1 X105.542 Y122.599 E.00761
G1 X110.599 Y117.542 E.09472
G1 X110.024 Y117.542 E.00761
G1 X105.542 Y122.024 E.08395
G1 X105.542 Y121.45 E.00761
G1 X109.45 Y117.542 E.07319
G1 X108.875 Y117.542 E.00761
G1 X105.542 Y120.875 E.06243
G1 X105.542 Y120.3 E.00761
G1 X108.3 Y117.542 E.05166
G1 X107.726 Y117.542 E.00761
G1 X105.542 Y119.726 E.0409
G1 X105.542 Y119.151 E.00761
G1 X107.151 Y117.542 E.03014
G1 X106.576 Y117.542 E.00761
G1 X105.542 Y118.576 E.01937
G1 X105.542 Y118.002 E.00761
G1 X106.183 Y117.361 E.012
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X105.542 Y118.002 E-.34442
G1 X105.542 Y118.576 E-.21837
G1 X105.909 Y118.209 E-.19722
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/88
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.84 I-.422 J1.141 P1  F30000
G1 X150.834 Y134.834 Z.84
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.094 Z.92 F30000
G1 X150.639 Y118.183 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423508
G1 F21000
G1 X149.999 Y117.542 E.012
G1 X149.424 Y117.542 E.00761
G1 X150.458 Y118.576 E.01937
G1 X150.458 Y119.151 E.00761
G1 X148.849 Y117.542 E.03013
G1 X148.275 Y117.542 E.00761
G1 X150.458 Y119.725 E.04089
G1 X150.458 Y120.3 E.00761
G1 X147.7 Y117.542 E.05166
G1 X147.125 Y117.542 E.00761
G1 X150.458 Y120.874 E.06242
G1 X150.458 Y121.449 E.00761
G1 X146.551 Y117.542 E.07318
G1 X145.976 Y117.542 E.00761
G1 X150.458 Y122.024 E.08395
G1 X150.458 Y122.598 E.00761
G1 X145.402 Y117.542 E.09471
G1 X144.827 Y117.542 E.00761
G1 X150.458 Y123.173 E.10547
G1 X150.458 Y123.748 E.00761
G1 X144.252 Y117.542 E.11624
G1 X143.678 Y117.542 E.00761
G1 X150.458 Y124.322 E.127
G1 X150.458 Y124.897 E.00761
G1 X143.103 Y117.542 E.13777
G1 X142.528 Y117.542 E.00761
G1 X150.458 Y125.472 E.14853
G1 X150.458 Y126.046 E.00761
G1 X141.954 Y117.542 E.15929
G1 X141.379 Y117.542 E.00761
G1 X150.458 Y126.621 E.17006
G1 X150.458 Y127.196 E.00761
G1 X140.804 Y117.542 E.18082
G1 X140.23 Y117.542 E.00761
G1 X150.458 Y127.77 E.19158
G1 X150.458 Y128.345 E.00761
G1 X139.655 Y117.542 E.20235
G1 X139.08 Y117.542 E.00761
G1 X150.458 Y128.92 E.21311
G1 X150.458 Y129.494 E.00761
M73 P38 R17
G1 X138.506 Y117.542 E.22387
G1 X137.931 Y117.542 E.00761
G1 X150.458 Y130.069 E.23464
G1 X150.458 Y130.644 E.00761
G1 X137.356 Y117.542 E.2454
G1 X136.782 Y117.542 E.00761
G1 X150.458 Y131.218 E.25617
G1 X150.458 Y131.793 E.00761
G1 X136.207 Y117.542 E.26693
G1 X135.632 Y117.542 E.00761
G1 X150.458 Y132.368 E.27769
G1 X150.458 Y132.942 E.00761
G1 X135.058 Y117.542 E.28846
G1 X134.483 Y117.542 E.00761
G1 X150.458 Y133.517 E.29922
G1 X150.458 Y134.091 E.00761
G1 X133.909 Y117.542 E.30998
G1 X133.334 Y117.542 E.00761
G1 X150.25 Y134.458 E.31685
G1 X149.675 Y134.458 E.00761
G1 X132.759 Y117.542 E.31685
G1 X132.185 Y117.542 E.00761
G1 X149.1 Y134.458 E.31685
G1 X148.526 Y134.458 E.00761
G1 X131.61 Y117.542 E.31685
G1 X131.035 Y117.542 E.00761
G1 X147.951 Y134.458 E.31685
G1 X147.377 Y134.458 E.00761
G1 X130.461 Y117.542 E.31685
G1 X129.886 Y117.542 E.00761
G1 X146.802 Y134.458 E.31685
G1 X146.227 Y134.458 E.00761
G1 X129.311 Y117.542 E.31685
G1 X128.737 Y117.542 E.00761
G1 X145.653 Y134.458 E.31685
G1 X145.078 Y134.458 E.00761
G1 X128.162 Y117.542 E.31685
G1 X127.587 Y117.542 E.00761
G1 X144.503 Y134.458 E.31685
G1 X143.929 Y134.458 E.00761
G1 X127.013 Y117.542 E.31685
G1 X126.438 Y117.542 E.00761
G1 X143.354 Y134.458 E.31685
G1 X142.779 Y134.458 E.00761
G1 X125.863 Y117.542 E.31685
G1 X125.289 Y117.542 E.00761
G1 X142.205 Y134.458 E.31685
G1 X141.63 Y134.458 E.00761
G1 X124.714 Y117.542 E.31685
G1 X124.139 Y117.542 E.00761
G1 X141.055 Y134.458 E.31685
G1 X140.481 Y134.458 E.00761
G1 X123.565 Y117.542 E.31685
G1 X122.99 Y117.542 E.00761
G1 X139.906 Y134.458 E.31685
G1 X139.331 Y134.458 E.00761
G1 X122.415 Y117.542 E.31685
G1 X121.841 Y117.542 E.00761
G1 X138.757 Y134.458 E.31685
G1 X138.182 Y134.458 E.00761
G1 X121.266 Y117.542 E.31685
G1 X120.692 Y117.542 E.00761
G1 X137.607 Y134.458 E.31685
G1 X137.033 Y134.458 E.00761
G1 X120.117 Y117.542 E.31685
G1 X119.542 Y117.542 E.00761
G1 X136.458 Y134.458 E.31685
G1 X135.884 Y134.458 E.00761
G1 X118.968 Y117.542 E.31685
G1 X118.393 Y117.542 E.00761
G1 X135.309 Y134.458 E.31685
G1 X134.734 Y134.458 E.00761
G1 X117.818 Y117.542 E.31685
G1 X117.244 Y117.542 E.00761
G1 X134.16 Y134.458 E.31685
G1 X133.585 Y134.458 E.00761
G1 X116.669 Y117.542 E.31685
G1 X116.094 Y117.542 E.00761
G1 X133.01 Y134.458 E.31685
G1 X132.436 Y134.458 E.00761
G1 X115.52 Y117.542 E.31685
G1 X114.945 Y117.542 E.00761
G1 X131.861 Y134.458 E.31685
G1 X131.286 Y134.458 E.00761
G1 X114.37 Y117.542 E.31685
G1 X113.796 Y117.542 E.00761
G1 X130.712 Y134.458 E.31685
G1 X130.137 Y134.458 E.00761
G1 X113.221 Y117.542 E.31685
G1 X112.646 Y117.542 E.00761
G1 X129.562 Y134.458 E.31685
G1 X128.988 Y134.458 E.00761
G1 X112.072 Y117.542 E.31685
G1 X111.497 Y117.542 E.00761
G1 X128.413 Y134.458 E.31685
G1 X127.838 Y134.458 E.00761
G1 X110.922 Y117.542 E.31685
G1 X110.348 Y117.542 E.00761
G1 X127.264 Y134.458 E.31685
G1 X126.689 Y134.458 E.00761
G1 X109.773 Y117.542 E.31685
G1 X109.198 Y117.542 E.00761
G1 X126.114 Y134.458 E.31685
G1 X125.54 Y134.458 E.00761
G1 X108.624 Y117.542 E.31685
G1 X108.049 Y117.542 E.00761
G1 X124.965 Y134.458 E.31685
G1 X124.39 Y134.458 E.00761
G1 X107.475 Y117.542 E.31685
G1 X106.9 Y117.542 E.00761
G1 X123.816 Y134.458 E.31685
G1 X123.241 Y134.458 E.00761
G1 X106.325 Y117.542 E.31685
G1 X105.751 Y117.542 E.00761
G1 X122.667 Y134.458 E.31685
G1 X122.092 Y134.458 E.00761
G1 X105.542 Y117.908 E.30999
G1 X105.542 Y118.483 E.00761
G1 X121.517 Y134.458 E.29923
G1 X120.943 Y134.458 E.00761
G1 X105.542 Y119.057 E.28846
G1 X105.542 Y119.632 E.00761
G1 X120.368 Y134.458 E.2777
G1 X119.793 Y134.458 E.00761
G1 X105.542 Y120.207 E.26694
G1 X105.542 Y120.781 E.00761
G1 X119.219 Y134.458 E.25617
G1 X118.644 Y134.458 E.00761
G1 X105.542 Y121.356 E.24541
G1 X105.542 Y121.931 E.00761
G1 X118.069 Y134.458 E.23465
G1 X117.495 Y134.458 E.00761
G1 X105.542 Y122.505 E.22388
G1 X105.542 Y123.08 E.00761
G1 X116.92 Y134.458 E.21312
G1 X116.345 Y134.458 E.00761
G1 X105.542 Y123.655 E.20235
G1 X105.542 Y124.229 E.00761
G1 X115.771 Y134.458 E.19159
G1 X115.196 Y134.458 E.00761
G1 X105.542 Y124.804 E.18083
G1 X105.542 Y125.379 E.00761
G1 X114.621 Y134.458 E.17006
G1 X114.047 Y134.458 E.00761
G1 X105.542 Y125.953 E.1593
G1 X105.542 Y126.528 E.00761
G1 X113.472 Y134.458 E.14854
G1 X112.897 Y134.458 E.00761
G1 X105.542 Y127.103 E.13777
G1 X105.542 Y127.677 E.00761
G1 X112.323 Y134.458 E.12701
G1 X111.748 Y134.458 E.00761
G1 X105.542 Y128.252 E.11625
G1 X105.542 Y128.826 E.00761
G1 X111.174 Y134.458 E.10548
G1 X110.599 Y134.458 E.00761
G1 X105.542 Y129.401 E.09472
G1 X105.542 Y129.976 E.00761
G1 X110.024 Y134.458 E.08395
G1 X109.45 Y134.458 E.00761
G1 X105.542 Y130.55 E.07319
G1 X105.542 Y131.125 E.00761
G1 X108.875 Y134.458 E.06243
G1 X108.3 Y134.458 E.00761
G1 X105.542 Y131.7 E.05166
G1 X105.542 Y132.274 E.00761
G1 X107.726 Y134.458 E.0409
G1 X107.151 Y134.458 E.00761
G1 X105.542 Y132.849 E.03014
G1 X105.542 Y133.424 E.00761
G1 X106.576 Y134.458 E.01937
G1 X106.002 Y134.458 E.00761
G1 X105.361 Y133.817 E.012
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X106.002 Y134.458 E-.34442
G1 X106.576 Y134.458 E-.21837
G1 X106.209 Y134.091 E-.19721
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/88
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.92 I-.02 J1.217 P1  F30000
G1 X150.834 Y134.834 Z.92
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.759 Y134.638 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.954 E.01365
G1 X150.443 Y133.339 E.00867
G1 X149.339 Y134.443 E.02202
G1 X148.725 Y134.443 E.00867
G1 X150.443 Y132.725 E.03429
G1 X150.443 Y132.11 E.00867
G1 X148.11 Y134.443 E.04655
G1 X147.495 Y134.443 E.00867
G1 X150.443 Y131.495 E.05881
G1 X150.443 Y130.881 E.00867
G1 X146.881 Y134.443 E.07108
G1 X146.266 Y134.443 E.00867
G1 X150.443 Y130.266 E.08334
G1 X150.443 Y129.651 E.00867
G1 X145.651 Y134.443 E.0956
G1 X145.037 Y134.443 E.00867
G1 X150.443 Y129.037 E.10787
G1 X150.443 Y128.422 E.00867
G1 X144.422 Y134.443 E.12013
G1 X143.807 Y134.443 E.00867
G1 X150.443 Y127.807 E.13239
G1 X150.443 Y127.193 E.00867
G1 X143.193 Y134.443 E.14465
G1 X142.578 Y134.443 E.00867
G1 X150.443 Y126.578 E.15692
G1 X150.443 Y125.964 E.00867
G1 X141.964 Y134.443 E.16918
G1 X141.349 Y134.443 E.00867
G1 X150.443 Y125.349 E.18144
G1 X150.443 Y124.734 E.00867
G1 X140.734 Y134.443 E.19371
G1 X140.12 Y134.443 E.00867
G1 X150.443 Y124.12 E.20597
G1 X150.443 Y123.505 E.00867
G1 X139.505 Y134.443 E.21823
G1 X138.89 Y134.443 E.00867
G1 X150.443 Y122.89 E.2305
G1 X150.443 Y122.276 E.00867
M73 P39 R17
G1 X138.276 Y134.443 E.24276
G1 X137.661 Y134.443 E.00867
G1 X150.443 Y121.661 E.25502
G1 X150.443 Y121.047 E.00867
M73 P39 R16
G1 X137.047 Y134.443 E.26728
G1 X136.432 Y134.443 E.00867
G1 X150.443 Y120.432 E.27955
G1 X150.443 Y119.817 E.00867
G1 X135.817 Y134.443 E.29181
G1 X135.203 Y134.443 E.00867
G1 X150.443 Y119.203 E.30407
G1 X150.443 Y118.588 E.00867
G1 X134.588 Y134.443 E.31634
G1 X133.973 Y134.443 E.00867
G1 X150.443 Y117.973 E.3286
G1 X150.443 Y117.557 E.00587
G1 X150.245 Y117.557 E.0028
G1 X133.359 Y134.443 E.33691
G1 X132.744 Y134.443 E.00867
G1 X149.63 Y117.557 E.33691
G1 X149.015 Y117.557 E.00867
G1 X132.129 Y134.443 E.33691
G1 X131.515 Y134.443 E.00867
G1 X148.401 Y117.557 E.33691
G1 X147.786 Y117.557 E.00867
G1 X130.9 Y134.443 E.33691
G1 X130.286 Y134.443 E.00867
G1 X147.172 Y117.557 E.33691
G1 X146.557 Y117.557 E.00867
G1 X129.671 Y134.443 E.33691
G1 X129.056 Y134.443 E.00867
G1 X145.942 Y117.557 E.33691
G1 X145.328 Y117.557 E.00867
G1 X128.442 Y134.443 E.33691
G1 X127.827 Y134.443 E.00867
G1 X144.713 Y117.557 E.33691
G1 X144.098 Y117.557 E.00867
G1 X127.212 Y134.443 E.33691
G1 X126.598 Y134.443 E.00867
G1 X143.484 Y117.557 E.33691
G1 X142.869 Y117.557 E.00867
G1 X125.983 Y134.443 E.33691
G1 X125.369 Y134.443 E.00867
G1 X142.254 Y117.557 E.33691
G1 X141.64 Y117.557 E.00867
G1 X124.754 Y134.443 E.33691
G1 X124.139 Y134.443 E.00867
G1 X141.025 Y117.557 E.33691
G1 X140.411 Y117.557 E.00867
G1 X123.525 Y134.443 E.33691
G1 X122.91 Y134.443 E.00867
G1 X139.796 Y117.557 E.33691
G1 X139.181 Y117.557 E.00867
G1 X122.295 Y134.443 E.33691
G1 X121.681 Y134.443 E.00867
G1 X138.567 Y117.557 E.33691
G1 X137.952 Y117.557 E.00867
G1 X121.066 Y134.443 E.33691
G1 X120.451 Y134.443 E.00867
G1 X137.337 Y117.557 E.33691
G1 X136.723 Y117.557 E.00867
G1 X119.837 Y134.443 E.33691
G1 X119.222 Y134.443 E.00867
G1 X136.108 Y117.557 E.33691
G1 X135.494 Y117.557 E.00867
G1 X118.608 Y134.443 E.33691
G1 X118.455 Y134.443 E.00216
G1 X118.455 Y133.981 E.00651
G1 X134.879 Y117.557 E.32769
G1 X134.264 Y117.557 E.00867
G1 X118.455 Y133.367 E.31543
G1 X118.455 Y132.752 E.00867
G1 X133.65 Y117.557 E.30317
G1 X133.035 Y117.557 E.00867
G1 X118.455 Y132.137 E.29091
G1 X118.455 Y131.523 E.00867
G1 X132.42 Y117.557 E.27864
G1 X131.806 Y117.557 E.00867
G1 X118.455 Y130.908 E.26638
G1 X118.455 Y130.293 E.00867
G1 X131.191 Y117.557 E.25412
G1 X130.576 Y117.557 E.00867
G1 X118.455 Y129.679 E.24185
G1 X118.455 Y129.064 E.00867
G1 X129.962 Y117.557 E.22959
G1 X129.347 Y117.557 E.00867
G1 X118.455 Y128.45 E.21733
G1 X118.455 Y127.835 E.00867
G1 X128.733 Y117.557 E.20506
G1 X128.118 Y117.557 E.00867
G1 X118.455 Y127.22 E.1928
G1 X118.455 Y126.606 E.00867
G1 X127.503 Y117.557 E.18054
G1 X126.889 Y117.557 E.00867
G1 X118.455 Y125.991 E.16827
G1 X118.455 Y125.376 E.00867
G1 X126.274 Y117.557 E.15601
G1 X125.659 Y117.557 E.00867
G1 X118.455 Y124.762 E.14375
G1 X118.455 Y124.147 E.00867
G1 X125.045 Y117.557 E.13149
G1 X124.43 Y117.557 E.00867
G1 X118.455 Y123.533 E.11922
G1 X118.455 Y122.918 E.00867
G1 X123.816 Y117.557 E.10696
G1 X123.201 Y117.557 E.00867
G1 X118.455 Y122.303 E.0947
G1 X118.455 Y121.689 E.00867
G1 X122.586 Y117.557 E.08243
G1 X121.972 Y117.557 E.00867
G1 X118.455 Y121.074 E.07017
G1 X118.455 Y120.459 E.00867
G1 X121.357 Y117.557 E.05791
G1 X120.742 Y117.557 E.00867
G1 X118.455 Y119.845 E.04564
G1 X118.455 Y119.23 E.00867
G1 X120.128 Y117.557 E.03338
G1 X119.513 Y117.557 E.00867
G1 X118.455 Y118.615 E.02112
G1 X118.455 Y118.001 E.00867
G1 X119.093 Y117.362 E.01274
G1 X105.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F21000
G1 X106.01 Y117.542 E.01228
G1 X106.59 Y117.542 E.00776
G1 X105.542 Y118.59 E.01983
G1 X105.542 Y119.171 E.00776
G1 X107.171 Y117.542 E.0308
G1 X107.751 Y117.542 E.00776
G1 X105.542 Y119.751 E.04177
G1 X105.542 Y120.331 E.00776
G1 X108.331 Y117.542 E.05274
G1 X108.911 Y117.542 E.00776
G1 X105.542 Y120.911 E.06371
G1 X105.542 Y121.491 E.00776
G1 X109.491 Y117.542 E.07469
G1 X110.072 Y117.542 E.00776
G1 X105.542 Y122.072 E.08566
G1 X105.542 Y122.652 E.00776
G1 X110.652 Y117.542 E.09663
G1 X111.232 Y117.542 E.00776
G1 X105.542 Y123.232 E.1076
G1 X105.542 Y123.812 E.00776
G1 X111.812 Y117.542 E.11858
G1 X112.392 Y117.542 E.00776
G1 X105.542 Y124.392 E.12955
G1 X105.542 Y124.972 E.00776
G1 X112.972 Y117.542 E.14052
G1 X113.553 Y117.542 E.00776
G1 X105.542 Y125.553 E.15149
G1 X105.542 Y126.133 E.00776
G1 X114.133 Y117.542 E.16247
G1 X114.713 Y117.542 E.00776
G1 X105.542 Y126.713 E.17344
G1 X105.542 Y127.293 E.00776
G1 X115.293 Y117.542 E.18441
G1 X115.873 Y117.542 E.00776
G1 X105.542 Y127.873 E.19538
G1 X105.542 Y128.454 E.00776
G1 X116.454 Y117.542 E.20635
G1 X117.034 Y117.542 E.00776
G1 X105.542 Y129.034 E.21733
G1 X105.542 Y129.614 E.00776
G1 X117.614 Y117.542 E.2283
G1 X118.037 Y117.542 E.00565
G1 X118.037 Y117.699 E.00211
G1 X105.542 Y130.194 E.23629
G1 X105.542 Y130.774 E.00776
G1 X118.037 Y118.28 E.23629
G1 X118.037 Y118.86 E.00776
G1 X105.542 Y131.355 E.23629
G1 X105.542 Y131.935 E.00776
G1 X118.037 Y119.44 E.23629
G1 X118.037 Y120.02 E.00776
G1 X105.542 Y132.515 E.23629
G1 X105.542 Y133.095 E.00776
G1 X118.037 Y120.6 E.23629
G1 X118.037 Y121.181 E.00776
G1 X105.542 Y133.675 E.23629
G1 X105.542 Y134.256 E.00776
G1 X118.037 Y121.761 E.23629
G1 X118.037 Y122.341 E.00776
G1 X105.92 Y134.458 E.22915
G1 X106.5 Y134.458 E.00776
G1 X118.037 Y122.921 E.21818
G1 X118.037 Y123.501 E.00776
G1 X107.08 Y134.458 E.2072
G1 X107.66 Y134.458 E.00776
G1 X118.037 Y124.082 E.19623
G1 X118.037 Y124.662 E.00776
G1 X108.241 Y134.458 E.18526
G1 X108.821 Y134.458 E.00776
G1 X118.037 Y125.242 E.17429
G1 X118.037 Y125.822 E.00776
G1 X109.401 Y134.458 E.16331
G1 X109.981 Y134.458 E.00776
G1 X118.037 Y126.402 E.15234
G1 X118.037 Y126.983 E.00776
G1 X110.561 Y134.458 E.14137
G1 X111.142 Y134.458 E.00776
G1 X118.037 Y127.563 E.1304
G1 X118.037 Y128.143 E.00776
G1 X111.722 Y134.458 E.11943
G1 X112.302 Y134.458 E.00776
G1 X118.037 Y128.723 E.10845
G1 X118.037 Y129.303 E.00776
G1 X112.882 Y134.458 E.09748
G1 X113.462 Y134.458 E.00776
G1 X118.037 Y129.884 E.08651
G1 X118.037 Y130.464 E.00776
G1 X114.043 Y134.458 E.07554
G1 X114.623 Y134.458 E.00776
G1 X118.037 Y131.044 E.06456
G1 X118.037 Y131.624 E.00776
G1 X115.203 Y134.458 E.05359
G1 X115.783 Y134.458 E.00776
G1 X118.037 Y132.204 E.04262
G1 X118.037 Y132.785 E.00776
G1 X116.363 Y134.458 E.03165
G1 X116.944 Y134.458 E.00776
G1 X118.037 Y133.365 E.02067
G1 X118.037 Y133.945 E.00776
G1 X117.342 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X118.037 Y133.945 E-.37311
G1 X118.037 Y133.365 E-.22048
G1 X117.727 Y133.674 E-.16641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/88
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1 I-.043 J1.216 P1  F30000
G1 X150.834 Y134.834 Z1
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.094 Z1.08 F30000
G1 X150.638 Y118.241 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X149.954 Y117.557 E.01365
G1 X149.339 Y117.557 E.00867
G1 X150.443 Y118.661 E.02202
G1 X150.443 Y119.275 E.00867
G1 X148.725 Y117.557 E.03429
G1 X148.11 Y117.557 E.00867
G1 X150.443 Y119.89 E.04655
G1 X150.443 Y120.505 E.00867
G1 X147.495 Y117.557 E.05881
G1 X146.881 Y117.557 E.00867
G1 X150.443 Y121.119 E.07108
G1 X150.443 Y121.734 E.00867
G1 X146.266 Y117.557 E.08334
G1 X145.651 Y117.557 E.00867
G1 X150.443 Y122.349 E.0956
G1 X150.443 Y122.963 E.00867
G1 X145.037 Y117.557 E.10787
G1 X144.422 Y117.557 E.00867
G1 X150.443 Y123.578 E.12013
G1 X150.443 Y124.193 E.00867
G1 X143.807 Y117.557 E.13239
G1 X143.193 Y117.557 E.00867
G1 X150.443 Y124.807 E.14465
G1 X150.443 Y125.422 E.00867
G1 X142.578 Y117.557 E.15692
G1 X141.964 Y117.557 E.00867
G1 X150.443 Y126.036 E.16918
G1 X150.443 Y126.651 E.00867
G1 X141.349 Y117.557 E.18144
G1 X140.734 Y117.557 E.00867
G1 X150.443 Y127.266 E.19371
M73 P40 R16
G1 X150.443 Y127.88 E.00867
G1 X140.12 Y117.557 E.20597
G1 X139.505 Y117.557 E.00867
G1 X150.443 Y128.495 E.21823
G1 X150.443 Y129.11 E.00867
G1 X138.89 Y117.557 E.2305
G1 X138.276 Y117.557 E.00867
G1 X150.443 Y129.724 E.24276
G1 X150.443 Y130.339 E.00867
G1 X137.661 Y117.557 E.25502
G1 X137.047 Y117.557 E.00867
G1 X150.443 Y130.953 E.26729
G1 X150.443 Y131.568 E.00867
G1 X136.432 Y117.557 E.27955
G1 X135.817 Y117.557 E.00867
G1 X150.443 Y132.183 E.29181
G1 X150.443 Y132.797 E.00867
G1 X135.203 Y117.557 E.30407
G1 X134.588 Y117.557 E.00867
G1 X150.443 Y133.412 E.31634
G1 X150.443 Y134.027 E.00867
G1 X133.973 Y117.557 E.3286
G1 X133.359 Y117.557 E.00867
G1 X150.245 Y134.443 E.33691
G1 X149.63 Y134.443 E.00867
G1 X132.744 Y117.557 E.33691
G1 X132.129 Y117.557 E.00867
G1 X149.015 Y134.443 E.33691
G1 X148.401 Y134.443 E.00867
G1 X131.515 Y117.557 E.33691
G1 X130.9 Y117.557 E.00867
G1 X147.786 Y134.443 E.33691
G1 X147.172 Y134.443 E.00867
G1 X130.286 Y117.557 E.33691
G1 X129.671 Y117.557 E.00867
G1 X146.557 Y134.443 E.33691
G1 X145.942 Y134.443 E.00867
G1 X129.056 Y117.557 E.33691
G1 X128.442 Y117.557 E.00867
G1 X145.328 Y134.443 E.33691
G1 X144.713 Y134.443 E.00867
G1 X127.827 Y117.557 E.33691
G1 X127.212 Y117.557 E.00867
G1 X144.098 Y134.443 E.33691
G1 X143.484 Y134.443 E.00867
G1 X126.598 Y117.557 E.33691
G1 X125.983 Y117.557 E.00867
G1 X142.869 Y134.443 E.33691
G1 X142.254 Y134.443 E.00867
G1 X125.369 Y117.557 E.33691
G1 X124.754 Y117.557 E.00867
G1 X141.64 Y134.443 E.33691
G1 X141.025 Y134.443 E.00867
G1 X124.139 Y117.557 E.33691
G1 X123.525 Y117.557 E.00867
G1 X140.411 Y134.443 E.33691
G1 X139.796 Y134.443 E.00867
G1 X122.91 Y117.557 E.33691
G1 X122.295 Y117.557 E.00867
G1 X139.181 Y134.443 E.33691
G1 X138.567 Y134.443 E.00867
G1 X121.681 Y117.557 E.33691
G1 X121.066 Y117.557 E.00867
G1 X137.952 Y134.443 E.33691
G1 X137.337 Y134.443 E.00867
G1 X120.451 Y117.557 E.33691
G1 X119.837 Y117.557 E.00867
G1 X136.723 Y134.443 E.33691
G1 X136.108 Y134.443 E.00867
G1 X119.222 Y117.557 E.33691
G1 X118.608 Y117.557 E.00867
G1 X135.494 Y134.443 E.33691
G1 X134.879 Y134.443 E.00867
G1 X118.455 Y118.019 E.32769
G1 X118.455 Y118.633 E.00867
G1 X134.264 Y134.443 E.31543
G1 X133.65 Y134.443 E.00867
G1 X118.455 Y119.248 E.30317
G1 X118.455 Y119.863 E.00867
G1 X133.035 Y134.443 E.29091
G1 X132.42 Y134.443 E.00867
G1 X118.455 Y120.477 E.27864
G1 X118.455 Y121.092 E.00867
G1 X131.806 Y134.443 E.26638
G1 X131.191 Y134.443 E.00867
G1 X118.455 Y121.707 E.25412
G1 X118.455 Y122.321 E.00867
G1 X130.576 Y134.443 E.24185
G1 X129.962 Y134.443 E.00867
G1 X118.455 Y122.936 E.22959
G1 X118.455 Y123.55 E.00867
G1 X129.347 Y134.443 E.21733
G1 X128.733 Y134.443 E.00867
G1 X118.455 Y124.165 E.20506
G1 X118.455 Y124.78 E.00867
G1 X128.118 Y134.443 E.1928
G1 X127.503 Y134.443 E.00867
G1 X118.455 Y125.394 E.18054
G1 X118.455 Y126.009 E.00867
G1 X126.889 Y134.443 E.16827
G1 X126.274 Y134.443 E.00867
G1 X118.455 Y126.624 E.15601
G1 X118.455 Y127.238 E.00867
G1 X125.659 Y134.443 E.14375
G1 X125.045 Y134.443 E.00867
G1 X118.455 Y127.853 E.13149
G1 X118.455 Y128.467 E.00867
G1 X124.43 Y134.443 E.11922
G1 X123.816 Y134.443 E.00867
G1 X118.455 Y129.082 E.10696
G1 X118.455 Y129.697 E.00867
G1 X123.201 Y134.443 E.0947
G1 X122.586 Y134.443 E.00867
G1 X118.455 Y130.311 E.08243
G1 X118.455 Y130.926 E.00867
G1 X121.972 Y134.443 E.07017
G1 X121.357 Y134.443 E.00867
G1 X118.455 Y131.541 E.05791
G1 X118.455 Y132.155 E.00867
G1 X120.742 Y134.443 E.04564
G1 X120.128 Y134.443 E.00867
G1 X118.455 Y132.77 E.03338
G1 X118.455 Y133.385 E.00867
G1 X119.513 Y134.443 E.02112
G1 X118.898 Y134.443 E.00867
G1 X118.26 Y133.804 E.01274
G1 X106.191 Y134.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F21000
G1 X105.542 Y133.99 E.01228
G1 X105.542 Y133.41 E.00776
G1 X106.59 Y134.458 E.01982
G1 X107.171 Y134.458 E.00776
G1 X105.542 Y132.829 E.0308
G1 X105.542 Y132.249 E.00776
G1 X107.751 Y134.458 E.04177
G1 X108.331 Y134.458 E.00776
G1 X105.542 Y131.669 E.05274
G1 X105.542 Y131.089 E.00776
G1 X108.911 Y134.458 E.06371
G1 X109.491 Y134.458 E.00776
G1 X105.542 Y130.509 E.07469
G1 X105.542 Y129.929 E.00776
G1 X110.071 Y134.458 E.08566
G1 X110.652 Y134.458 E.00776
G1 X105.542 Y129.348 E.09663
G1 X105.542 Y128.768 E.00776
G1 X111.232 Y134.458 E.1076
G1 X111.812 Y134.458 E.00776
G1 X105.542 Y128.188 E.11858
G1 X105.542 Y127.608 E.00776
G1 X112.392 Y134.458 E.12955
G1 X112.972 Y134.458 E.00776
G1 X105.542 Y127.028 E.14052
G1 X105.542 Y126.447 E.00776
G1 X113.553 Y134.458 E.15149
G1 X114.133 Y134.458 E.00776
G1 X105.542 Y125.867 E.16247
G1 X105.542 Y125.287 E.00776
G1 X114.713 Y134.458 E.17344
G1 X115.293 Y134.458 E.00776
G1 X105.542 Y124.707 E.18441
G1 X105.542 Y124.127 E.00776
G1 X115.873 Y134.458 E.19538
G1 X116.454 Y134.458 E.00776
G1 X105.542 Y123.546 E.20635
G1 X105.542 Y122.966 E.00776
G1 X117.034 Y134.458 E.21733
G1 X117.614 Y134.458 E.00776
G1 X105.542 Y122.386 E.2283
G1 X105.542 Y121.806 E.00776
G1 X118.037 Y134.301 E.23629
G1 X118.037 Y133.72 E.00776
G1 X105.542 Y121.226 E.23629
G1 X105.542 Y120.645 E.00776
G1 X118.037 Y133.14 E.23629
G1 X118.037 Y132.56 E.00776
G1 X105.542 Y120.065 E.23629
G1 X105.542 Y119.485 E.00776
G1 X118.037 Y131.98 E.23629
G1 X118.037 Y131.4 E.00776
G1 X105.542 Y118.905 E.23629
G1 X105.542 Y118.325 E.00776
G1 X118.037 Y130.819 E.23629
G1 X118.037 Y130.239 E.00776
G1 X105.542 Y117.744 E.23629
G1 X105.542 Y117.542 E.00271
G1 X105.92 Y117.542 E.00505
G1 X118.037 Y129.659 E.22915
G1 X118.037 Y129.079 E.00776
G1 X106.5 Y117.542 E.21818
G1 X107.08 Y117.542 E.00776
G1 X118.037 Y128.499 E.2072
G1 X118.037 Y127.918 E.00776
G1 X107.66 Y117.542 E.19623
G1 X108.241 Y117.542 E.00776
G1 X118.037 Y127.338 E.18526
G1 X118.037 Y126.758 E.00776
G1 X108.821 Y117.542 E.17429
G1 X109.401 Y117.542 E.00776
G1 X118.037 Y126.178 E.16331
G1 X118.037 Y125.598 E.00776
G1 X109.981 Y117.542 E.15234
G1 X110.561 Y117.542 E.00776
G1 X118.037 Y125.017 E.14137
G1 X118.037 Y124.437 E.00776
G1 X111.142 Y117.542 E.1304
G1 X111.722 Y117.542 E.00776
G1 X118.037 Y123.857 E.11943
G1 X118.037 Y123.277 E.00776
G1 X112.302 Y117.542 E.10845
G1 X112.882 Y117.542 E.00776
G1 X118.037 Y122.697 E.09748
G1 X118.037 Y122.116 E.00776
G1 X113.462 Y117.542 E.08651
G1 X114.043 Y117.542 E.00776
G1 X118.037 Y121.536 E.07554
G1 X118.037 Y120.956 E.00776
G1 X114.623 Y117.542 E.06456
G1 X115.203 Y117.542 E.00776
G1 X118.037 Y120.376 E.05359
G1 X118.037 Y119.796 E.00776
G1 X115.783 Y117.542 E.04262
G1 X116.363 Y117.542 E.00776
G1 X118.037 Y119.215 E.03165
G1 X118.037 Y118.635 E.00776
G1 X116.944 Y117.542 E.02067
G1 X117.524 Y117.542 E.00776
G1 X118.218 Y118.236 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X117.524 Y117.542 E-.37311
G1 X116.944 Y117.542 E-.22048
G1 X117.253 Y117.852 E-.16641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/88
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.08 I-.549 J1.086 P1  F30000
G1 X150.834 Y134.834 Z1.08
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.759 Y134.638 Z1.16 F30000
G1 Z.76
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.954 E.01365
G1 X150.443 Y133.339 E.00867
G1 X149.339 Y134.443 E.02202
G1 X148.725 Y134.443 E.00867
G1 X150.443 Y132.725 E.03429
G1 X150.443 Y132.11 E.00867
G1 X148.11 Y134.443 E.04655
G1 X147.495 Y134.443 E.00867
G1 X150.443 Y131.495 E.05881
G1 X150.443 Y130.881 E.00867
G1 X146.881 Y134.443 E.07108
G1 X146.266 Y134.443 E.00867
G1 X150.443 Y130.266 E.08334
G1 X150.443 Y129.651 E.00867
G1 X145.651 Y134.443 E.0956
G1 X145.037 Y134.443 E.00867
G1 X150.443 Y129.037 E.10787
G1 X150.443 Y128.422 E.00867
G1 X144.422 Y134.443 E.12013
G1 X143.807 Y134.443 E.00867
G1 X150.443 Y127.807 E.13239
G1 X150.443 Y127.193 E.00867
G1 X143.193 Y134.443 E.14465
G1 X142.578 Y134.443 E.00867
M73 P41 R16
G1 X150.443 Y126.578 E.15692
G1 X150.443 Y125.964 E.00867
G1 X141.964 Y134.443 E.16918
G1 X141.349 Y134.443 E.00867
G1 X150.443 Y125.349 E.18144
G1 X150.443 Y124.734 E.00867
G1 X140.734 Y134.443 E.19371
G1 X140.12 Y134.443 E.00867
G1 X150.443 Y124.12 E.20597
G1 X150.443 Y123.505 E.00867
G1 X139.505 Y134.443 E.21823
G1 X138.89 Y134.443 E.00867
G1 X150.443 Y122.89 E.2305
G1 X150.443 Y122.276 E.00867
G1 X138.276 Y134.443 E.24276
G1 X137.661 Y134.443 E.00867
G1 X150.443 Y121.661 E.25502
G1 X150.443 Y121.047 E.00867
G1 X137.047 Y134.443 E.26728
G1 X136.432 Y134.443 E.00867
G1 X150.443 Y120.432 E.27955
G1 X150.443 Y119.817 E.00867
G1 X135.817 Y134.443 E.29181
G1 X135.203 Y134.443 E.00867
G1 X150.443 Y119.203 E.30407
G1 X150.443 Y118.588 E.00867
G1 X134.588 Y134.443 E.31634
G1 X133.973 Y134.443 E.00867
G1 X150.443 Y117.973 E.3286
G1 X150.443 Y117.557 E.00587
G1 X150.245 Y117.557 E.0028
G1 X133.359 Y134.443 E.33691
G1 X132.744 Y134.443 E.00867
G1 X149.63 Y117.557 E.33691
G1 X149.015 Y117.557 E.00867
G1 X132.129 Y134.443 E.33691
G1 X131.515 Y134.443 E.00867
G1 X148.401 Y117.557 E.33691
G1 X147.786 Y117.557 E.00867
G1 X130.9 Y134.443 E.33691
G1 X130.286 Y134.443 E.00867
G1 X147.172 Y117.557 E.33691
G1 X146.557 Y117.557 E.00867
G1 X129.671 Y134.443 E.33691
G1 X129.056 Y134.443 E.00867
G1 X145.942 Y117.557 E.33691
G1 X145.328 Y117.557 E.00867
G1 X128.442 Y134.443 E.33691
G1 X127.827 Y134.443 E.00867
G1 X144.713 Y117.557 E.33691
G1 X144.098 Y117.557 E.00867
G1 X127.212 Y134.443 E.33691
G1 X126.598 Y134.443 E.00867
G1 X143.484 Y117.557 E.33691
G1 X142.869 Y117.557 E.00867
G1 X125.983 Y134.443 E.33691
G1 X125.369 Y134.443 E.00867
G1 X142.254 Y117.557 E.33691
G1 X141.64 Y117.557 E.00867
G1 X124.754 Y134.443 E.33691
G1 X124.139 Y134.443 E.00867
G1 X141.025 Y117.557 E.33691
G1 X140.411 Y117.557 E.00867
G1 X123.525 Y134.443 E.33691
G1 X122.91 Y134.443 E.00867
G1 X139.796 Y117.557 E.33691
G1 X139.181 Y117.557 E.00867
G1 X122.295 Y134.443 E.33691
G1 X121.681 Y134.443 E.00867
G1 X138.567 Y117.557 E.33691
G1 X137.952 Y117.557 E.00867
G1 X121.066 Y134.443 E.33691
G1 X120.451 Y134.443 E.00867
G1 X137.337 Y117.557 E.33691
G1 X136.723 Y117.557 E.00867
G1 X119.837 Y134.443 E.33691
G1 X119.222 Y134.443 E.00867
G1 X136.108 Y117.557 E.33691
G1 X135.494 Y117.557 E.00867
G1 X118.608 Y134.443 E.33691
G1 X118.455 Y134.443 E.00216
G1 X118.455 Y133.981 E.00651
G1 X134.879 Y117.557 E.32769
G1 X134.264 Y117.557 E.00867
G1 X118.455 Y133.367 E.31543
G1 X118.455 Y132.752 E.00867
G1 X133.65 Y117.557 E.30317
G1 X133.035 Y117.557 E.00867
G1 X118.455 Y132.137 E.29091
G1 X118.455 Y131.523 E.00867
G1 X132.42 Y117.557 E.27864
G1 X131.806 Y117.557 E.00867
G1 X118.455 Y130.908 E.26638
G1 X118.455 Y130.293 E.00867
G1 X131.191 Y117.557 E.25412
G1 X130.576 Y117.557 E.00867
G1 X118.455 Y129.679 E.24185
G1 X118.455 Y129.064 E.00867
G1 X129.962 Y117.557 E.22959
G1 X129.347 Y117.557 E.00867
G1 X118.455 Y128.45 E.21733
G1 X118.455 Y127.835 E.00867
G1 X128.733 Y117.557 E.20506
G1 X128.118 Y117.557 E.00867
G1 X118.455 Y127.22 E.1928
G1 X118.455 Y126.606 E.00867
G1 X127.503 Y117.557 E.18054
G1 X126.889 Y117.557 E.00867
G1 X118.455 Y125.991 E.16827
G1 X118.455 Y125.376 E.00867
G1 X126.274 Y117.557 E.15601
G1 X125.659 Y117.557 E.00867
G1 X118.455 Y124.762 E.14375
G1 X118.455 Y124.147 E.00867
G1 X125.045 Y117.557 E.13149
G1 X124.43 Y117.557 E.00867
G1 X118.455 Y123.533 E.11922
G1 X118.455 Y122.918 E.00867
G1 X123.816 Y117.557 E.10696
G1 X123.201 Y117.557 E.00867
G1 X118.455 Y122.303 E.0947
G1 X118.455 Y121.689 E.00867
G1 X122.586 Y117.557 E.08243
G1 X121.972 Y117.557 E.00867
G1 X118.455 Y121.074 E.07017
G1 X118.455 Y120.459 E.00867
G1 X121.357 Y117.557 E.05791
G1 X120.742 Y117.557 E.00867
G1 X118.455 Y119.845 E.04564
G1 X118.455 Y119.23 E.00867
G1 X120.128 Y117.557 E.03338
G1 X119.513 Y117.557 E.00867
G1 X118.455 Y118.615 E.02112
G1 X118.455 Y118.001 E.00867
G1 X119.093 Y117.362 E.01274
G1 X105.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F21000
G1 X106.01 Y117.542 E.01228
G1 X106.59 Y117.542 E.00776
G1 X105.542 Y118.59 E.01983
G1 X105.542 Y119.171 E.00776
G1 X107.171 Y117.542 E.0308
G1 X107.751 Y117.542 E.00776
G1 X105.542 Y119.751 E.04177
G1 X105.542 Y120.331 E.00776
G1 X108.331 Y117.542 E.05274
G1 X108.911 Y117.542 E.00776
G1 X105.542 Y120.911 E.06371
G1 X105.542 Y121.491 E.00776
G1 X109.491 Y117.542 E.07469
G1 X110.072 Y117.542 E.00776
G1 X105.542 Y122.072 E.08566
G1 X105.542 Y122.652 E.00776
G1 X110.652 Y117.542 E.09663
G1 X111.232 Y117.542 E.00776
G1 X105.542 Y123.232 E.1076
G1 X105.542 Y123.812 E.00776
G1 X111.812 Y117.542 E.11858
G1 X112.392 Y117.542 E.00776
G1 X105.542 Y124.392 E.12955
G1 X105.542 Y124.972 E.00776
G1 X112.972 Y117.542 E.14052
G1 X113.553 Y117.542 E.00776
G1 X105.542 Y125.553 E.15149
G1 X105.542 Y126.133 E.00776
G1 X114.133 Y117.542 E.16247
G1 X114.713 Y117.542 E.00776
G1 X105.542 Y126.713 E.17344
G1 X105.542 Y127.293 E.00776
G1 X115.293 Y117.542 E.18441
G1 X115.873 Y117.542 E.00776
G1 X105.542 Y127.873 E.19538
G1 X105.542 Y128.454 E.00776
G1 X116.454 Y117.542 E.20635
G1 X117.034 Y117.542 E.00776
G1 X105.542 Y129.034 E.21733
G1 X105.542 Y129.614 E.00776
G1 X117.614 Y117.542 E.2283
G1 X118.037 Y117.542 E.00565
G1 X118.037 Y117.699 E.00211
G1 X105.542 Y130.194 E.23629
G1 X105.542 Y130.774 E.00776
G1 X118.037 Y118.28 E.23629
G1 X118.037 Y118.86 E.00776
G1 X105.542 Y131.355 E.23629
G1 X105.542 Y131.935 E.00776
G1 X118.037 Y119.44 E.23629
G1 X118.037 Y120.02 E.00776
G1 X105.542 Y132.515 E.23629
G1 X105.542 Y133.095 E.00776
G1 X118.037 Y120.6 E.23629
G1 X118.037 Y121.181 E.00776
G1 X105.542 Y133.675 E.23629
G1 X105.542 Y134.256 E.00776
G1 X118.037 Y121.761 E.23629
G1 X118.037 Y122.341 E.00776
G1 X105.92 Y134.458 E.22915
G1 X106.5 Y134.458 E.00776
G1 X118.037 Y122.921 E.21818
G1 X118.037 Y123.501 E.00776
G1 X107.08 Y134.458 E.2072
G1 X107.66 Y134.458 E.00776
G1 X118.037 Y124.082 E.19623
G1 X118.037 Y124.662 E.00776
G1 X108.241 Y134.458 E.18526
G1 X108.821 Y134.458 E.00776
G1 X118.037 Y125.242 E.17429
G1 X118.037 Y125.822 E.00776
G1 X109.401 Y134.458 E.16331
G1 X109.981 Y134.458 E.00776
G1 X118.037 Y126.402 E.15234
G1 X118.037 Y126.983 E.00776
G1 X110.561 Y134.458 E.14137
G1 X111.142 Y134.458 E.00776
G1 X118.037 Y127.563 E.1304
G1 X118.037 Y128.143 E.00776
G1 X111.722 Y134.458 E.11943
G1 X112.302 Y134.458 E.00776
G1 X118.037 Y128.723 E.10845
G1 X118.037 Y129.303 E.00776
G1 X112.882 Y134.458 E.09748
G1 X113.462 Y134.458 E.00776
G1 X118.037 Y129.884 E.08651
G1 X118.037 Y130.464 E.00776
G1 X114.043 Y134.458 E.07554
G1 X114.623 Y134.458 E.00776
G1 X118.037 Y131.044 E.06456
G1 X118.037 Y131.624 E.00776
G1 X115.203 Y134.458 E.05359
G1 X115.783 Y134.458 E.00776
G1 X118.037 Y132.204 E.04262
G1 X118.037 Y132.785 E.00776
G1 X116.363 Y134.458 E.03165
G1 X116.944 Y134.458 E.00776
G1 X118.037 Y133.365 E.02067
G1 X118.037 Y133.945 E.00776
G1 X117.342 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X118.037 Y133.945 E-.37311
G1 X118.037 Y133.365 E-.22048
G1 X117.727 Y133.674 E-.16641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/88
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.16 I-.043 J1.216 P1  F30000
M73 P42 R16
G1 X150.834 Y134.834 Z1.16
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.094 Z1.24 F30000
G1 X150.638 Y118.241 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X149.954 Y117.557 E.01365
G1 X149.339 Y117.557 E.00867
G1 X150.443 Y118.661 E.02202
G1 X150.443 Y119.275 E.00867
G1 X148.725 Y117.557 E.03429
G1 X148.11 Y117.557 E.00867
G1 X150.443 Y119.89 E.04655
G1 X150.443 Y120.505 E.00867
G1 X147.495 Y117.557 E.05881
G1 X146.881 Y117.557 E.00867
G1 X150.443 Y121.119 E.07108
G1 X150.443 Y121.734 E.00867
G1 X146.266 Y117.557 E.08334
G1 X145.651 Y117.557 E.00867
G1 X150.443 Y122.349 E.0956
G1 X150.443 Y122.963 E.00867
G1 X145.037 Y117.557 E.10787
G1 X144.422 Y117.557 E.00867
G1 X150.443 Y123.578 E.12013
G1 X150.443 Y124.193 E.00867
G1 X143.807 Y117.557 E.13239
G1 X143.193 Y117.557 E.00867
G1 X150.443 Y124.807 E.14465
G1 X150.443 Y125.422 E.00867
G1 X142.578 Y117.557 E.15692
G1 X141.964 Y117.557 E.00867
G1 X150.443 Y126.036 E.16918
G1 X150.443 Y126.651 E.00867
G1 X141.349 Y117.557 E.18144
G1 X140.734 Y117.557 E.00867
G1 X150.443 Y127.266 E.19371
G1 X150.443 Y127.88 E.00867
G1 X140.12 Y117.557 E.20597
G1 X139.505 Y117.557 E.00867
G1 X150.443 Y128.495 E.21823
G1 X150.443 Y129.11 E.00867
G1 X138.89 Y117.557 E.2305
G1 X138.276 Y117.557 E.00867
G1 X150.443 Y129.724 E.24276
G1 X150.443 Y130.339 E.00867
G1 X137.661 Y117.557 E.25502
G1 X137.047 Y117.557 E.00867
G1 X150.443 Y130.953 E.26729
G1 X150.443 Y131.568 E.00867
G1 X136.432 Y117.557 E.27955
G1 X135.817 Y117.557 E.00867
G1 X150.443 Y132.183 E.29181
G1 X150.443 Y132.797 E.00867
G1 X135.203 Y117.557 E.30407
G1 X134.588 Y117.557 E.00867
G1 X150.443 Y133.412 E.31634
G1 X150.443 Y134.027 E.00867
G1 X133.973 Y117.557 E.3286
G1 X133.359 Y117.557 E.00867
G1 X150.245 Y134.443 E.33691
G1 X149.63 Y134.443 E.00867
G1 X132.744 Y117.557 E.33691
G1 X132.129 Y117.557 E.00867
G1 X149.015 Y134.443 E.33691
G1 X148.401 Y134.443 E.00867
G1 X131.515 Y117.557 E.33691
G1 X130.9 Y117.557 E.00867
G1 X147.786 Y134.443 E.33691
G1 X147.172 Y134.443 E.00867
G1 X130.286 Y117.557 E.33691
G1 X129.671 Y117.557 E.00867
G1 X146.557 Y134.443 E.33691
G1 X145.942 Y134.443 E.00867
G1 X129.056 Y117.557 E.33691
G1 X128.442 Y117.557 E.00867
G1 X145.328 Y134.443 E.33691
G1 X144.713 Y134.443 E.00867
G1 X127.827 Y117.557 E.33691
G1 X127.212 Y117.557 E.00867
G1 X144.098 Y134.443 E.33691
G1 X143.484 Y134.443 E.00867
G1 X126.598 Y117.557 E.33691
G1 X125.983 Y117.557 E.00867
G1 X142.869 Y134.443 E.33691
G1 X142.254 Y134.443 E.00867
G1 X125.369 Y117.557 E.33691
G1 X124.754 Y117.557 E.00867
G1 X141.64 Y134.443 E.33691
G1 X141.025 Y134.443 E.00867
G1 X124.139 Y117.557 E.33691
G1 X123.525 Y117.557 E.00867
G1 X140.411 Y134.443 E.33691
G1 X139.796 Y134.443 E.00867
G1 X122.91 Y117.557 E.33691
G1 X122.295 Y117.557 E.00867
G1 X139.181 Y134.443 E.33691
G1 X138.567 Y134.443 E.00867
G1 X121.681 Y117.557 E.33691
G1 X121.066 Y117.557 E.00867
G1 X137.952 Y134.443 E.33691
G1 X137.337 Y134.443 E.00867
G1 X120.451 Y117.557 E.33691
G1 X119.837 Y117.557 E.00867
G1 X136.723 Y134.443 E.33691
G1 X136.108 Y134.443 E.00867
G1 X119.222 Y117.557 E.33691
G1 X118.608 Y117.557 E.00867
G1 X135.494 Y134.443 E.33691
G1 X134.879 Y134.443 E.00867
G1 X118.455 Y118.019 E.32769
G1 X118.455 Y118.633 E.00867
G1 X134.264 Y134.443 E.31543
G1 X133.65 Y134.443 E.00867
G1 X118.455 Y119.248 E.30317
G1 X118.455 Y119.863 E.00867
G1 X133.035 Y134.443 E.29091
M73 P42 R15
G1 X132.42 Y134.443 E.00867
G1 X118.455 Y120.477 E.27864
G1 X118.455 Y121.092 E.00867
G1 X131.806 Y134.443 E.26638
G1 X131.191 Y134.443 E.00867
G1 X118.455 Y121.707 E.25412
G1 X118.455 Y122.321 E.00867
G1 X130.576 Y134.443 E.24185
G1 X129.962 Y134.443 E.00867
G1 X118.455 Y122.936 E.22959
G1 X118.455 Y123.55 E.00867
G1 X129.347 Y134.443 E.21733
G1 X128.733 Y134.443 E.00867
G1 X118.455 Y124.165 E.20506
G1 X118.455 Y124.78 E.00867
G1 X128.118 Y134.443 E.1928
G1 X127.503 Y134.443 E.00867
G1 X118.455 Y125.394 E.18054
G1 X118.455 Y126.009 E.00867
G1 X126.889 Y134.443 E.16827
G1 X126.274 Y134.443 E.00867
G1 X118.455 Y126.624 E.15601
G1 X118.455 Y127.238 E.00867
G1 X125.659 Y134.443 E.14375
G1 X125.045 Y134.443 E.00867
G1 X118.455 Y127.853 E.13149
G1 X118.455 Y128.467 E.00867
G1 X124.43 Y134.443 E.11922
G1 X123.816 Y134.443 E.00867
G1 X118.455 Y129.082 E.10696
G1 X118.455 Y129.697 E.00867
G1 X123.201 Y134.443 E.0947
G1 X122.586 Y134.443 E.00867
G1 X118.455 Y130.311 E.08243
G1 X118.455 Y130.926 E.00867
G1 X121.972 Y134.443 E.07017
G1 X121.357 Y134.443 E.00867
G1 X118.455 Y131.541 E.05791
G1 X118.455 Y132.155 E.00867
G1 X120.742 Y134.443 E.04564
G1 X120.128 Y134.443 E.00867
G1 X118.455 Y132.77 E.03338
G1 X118.455 Y133.385 E.00867
G1 X119.513 Y134.443 E.02112
G1 X118.898 Y134.443 E.00867
G1 X118.26 Y133.804 E.01274
G1 X106.191 Y134.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F21000
G1 X105.542 Y133.99 E.01228
G1 X105.542 Y133.41 E.00776
G1 X106.59 Y134.458 E.01982
G1 X107.171 Y134.458 E.00776
G1 X105.542 Y132.829 E.0308
G1 X105.542 Y132.249 E.00776
G1 X107.751 Y134.458 E.04177
G1 X108.331 Y134.458 E.00776
G1 X105.542 Y131.669 E.05274
G1 X105.542 Y131.089 E.00776
G1 X108.911 Y134.458 E.06371
G1 X109.491 Y134.458 E.00776
G1 X105.542 Y130.509 E.07469
G1 X105.542 Y129.929 E.00776
G1 X110.071 Y134.458 E.08566
G1 X110.652 Y134.458 E.00776
G1 X105.542 Y129.348 E.09663
G1 X105.542 Y128.768 E.00776
G1 X111.232 Y134.458 E.1076
G1 X111.812 Y134.458 E.00776
G1 X105.542 Y128.188 E.11858
G1 X105.542 Y127.608 E.00776
G1 X112.392 Y134.458 E.12955
G1 X112.972 Y134.458 E.00776
G1 X105.542 Y127.028 E.14052
G1 X105.542 Y126.447 E.00776
G1 X113.553 Y134.458 E.15149
G1 X114.133 Y134.458 E.00776
G1 X105.542 Y125.867 E.16247
G1 X105.542 Y125.287 E.00776
G1 X114.713 Y134.458 E.17344
G1 X115.293 Y134.458 E.00776
G1 X105.542 Y124.707 E.18441
G1 X105.542 Y124.127 E.00776
G1 X115.873 Y134.458 E.19538
G1 X116.454 Y134.458 E.00776
G1 X105.542 Y123.546 E.20635
G1 X105.542 Y122.966 E.00776
G1 X117.034 Y134.458 E.21733
G1 X117.614 Y134.458 E.00776
G1 X105.542 Y122.386 E.2283
G1 X105.542 Y121.806 E.00776
G1 X118.037 Y134.301 E.23629
G1 X118.037 Y133.72 E.00776
G1 X105.542 Y121.226 E.23629
G1 X105.542 Y120.645 E.00776
G1 X118.037 Y133.14 E.23629
G1 X118.037 Y132.56 E.00776
G1 X105.542 Y120.065 E.23629
G1 X105.542 Y119.485 E.00776
G1 X118.037 Y131.98 E.23629
G1 X118.037 Y131.4 E.00776
G1 X105.542 Y118.905 E.23629
G1 X105.542 Y118.325 E.00776
G1 X118.037 Y130.819 E.23629
G1 X118.037 Y130.239 E.00776
G1 X105.542 Y117.744 E.23629
G1 X105.542 Y117.542 E.00271
G1 X105.92 Y117.542 E.00505
G1 X118.037 Y129.659 E.22915
G1 X118.037 Y129.079 E.00776
G1 X106.5 Y117.542 E.21818
G1 X107.08 Y117.542 E.00776
G1 X118.037 Y128.499 E.2072
G1 X118.037 Y127.918 E.00776
M73 P43 R15
G1 X107.66 Y117.542 E.19623
G1 X108.241 Y117.542 E.00776
G1 X118.037 Y127.338 E.18526
G1 X118.037 Y126.758 E.00776
G1 X108.821 Y117.542 E.17429
G1 X109.401 Y117.542 E.00776
G1 X118.037 Y126.178 E.16331
G1 X118.037 Y125.598 E.00776
G1 X109.981 Y117.542 E.15234
G1 X110.561 Y117.542 E.00776
G1 X118.037 Y125.017 E.14137
G1 X118.037 Y124.437 E.00776
G1 X111.142 Y117.542 E.1304
G1 X111.722 Y117.542 E.00776
G1 X118.037 Y123.857 E.11943
G1 X118.037 Y123.277 E.00776
G1 X112.302 Y117.542 E.10845
G1 X112.882 Y117.542 E.00776
G1 X118.037 Y122.697 E.09748
G1 X118.037 Y122.116 E.00776
G1 X113.462 Y117.542 E.08651
G1 X114.043 Y117.542 E.00776
G1 X118.037 Y121.536 E.07554
G1 X118.037 Y120.956 E.00776
G1 X114.623 Y117.542 E.06456
G1 X115.203 Y117.542 E.00776
G1 X118.037 Y120.376 E.05359
G1 X118.037 Y119.796 E.00776
G1 X115.783 Y117.542 E.04262
G1 X116.363 Y117.542 E.00776
G1 X118.037 Y119.215 E.03165
G1 X118.037 Y118.635 E.00776
G1 X116.944 Y117.542 E.02067
G1 X117.524 Y117.542 E.00776
G1 X118.218 Y118.236 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 0.92
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X117.524 Y117.542 E-.37311
G1 X116.944 Y117.542 E-.22048
G1 X117.253 Y117.852 E-.16641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/88
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.24 I-.549 J1.086 P1  F30000
G1 X150.834 Y134.834 Z1.24
G1 Z.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.759 Y134.638 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.954 E.01365
G1 X150.443 Y133.339 E.00867
G1 X149.339 Y134.443 E.02202
G1 X148.725 Y134.443 E.00867
G1 X150.443 Y132.725 E.03429
G1 X150.443 Y132.11 E.00867
G1 X148.11 Y134.443 E.04655
G1 X147.495 Y134.443 E.00867
G1 X150.443 Y131.495 E.05881
G1 X150.443 Y130.881 E.00867
G1 X146.881 Y134.443 E.07108
G1 X146.266 Y134.443 E.00867
G1 X150.443 Y130.266 E.08334
G1 X150.443 Y129.651 E.00867
G1 X145.651 Y134.443 E.0956
G1 X145.037 Y134.443 E.00867
G1 X150.443 Y129.037 E.10787
G1 X150.443 Y128.422 E.00867
G1 X144.422 Y134.443 E.12013
G1 X143.807 Y134.443 E.00867
G1 X150.443 Y127.807 E.13239
G1 X150.443 Y127.193 E.00867
G1 X143.193 Y134.443 E.14465
G1 X142.578 Y134.443 E.00867
G1 X150.443 Y126.578 E.15692
G1 X150.443 Y125.964 E.00867
G1 X141.964 Y134.443 E.16918
G1 X141.349 Y134.443 E.00867
G1 X150.443 Y125.349 E.18144
G1 X150.443 Y124.734 E.00867
G1 X140.734 Y134.443 E.19371
G1 X140.12 Y134.443 E.00867
G1 X150.443 Y124.12 E.20597
G1 X150.443 Y123.505 E.00867
G1 X139.505 Y134.443 E.21823
G1 X138.89 Y134.443 E.00867
G1 X150.443 Y122.89 E.2305
G1 X150.443 Y122.276 E.00867
G1 X138.276 Y134.443 E.24276
G1 X137.661 Y134.443 E.00867
G1 X150.443 Y121.661 E.25502
G1 X150.443 Y121.047 E.00867
G1 X137.047 Y134.443 E.26728
G1 X136.432 Y134.443 E.00867
G1 X150.443 Y120.432 E.27955
G1 X150.443 Y119.817 E.00867
G1 X135.817 Y134.443 E.29181
G1 X135.203 Y134.443 E.00867
G1 X150.443 Y119.203 E.30407
G1 X150.443 Y118.588 E.00867
G1 X134.588 Y134.443 E.31634
G1 X133.973 Y134.443 E.00867
G1 X150.443 Y117.973 E.3286
G1 X150.443 Y117.557 E.00587
G1 X150.245 Y117.557 E.0028
G1 X133.359 Y134.443 E.33691
G1 X132.744 Y134.443 E.00867
G1 X149.63 Y117.557 E.33691
G1 X149.015 Y117.557 E.00867
G1 X132.129 Y134.443 E.33691
G1 X131.515 Y134.443 E.00867
G1 X148.401 Y117.557 E.33691
G1 X147.786 Y117.557 E.00867
G1 X130.9 Y134.443 E.33691
G1 X130.286 Y134.443 E.00867
G1 X147.172 Y117.557 E.33691
G1 X146.557 Y117.557 E.00867
G1 X129.671 Y134.443 E.33691
G1 X129.056 Y134.443 E.00867
G1 X145.942 Y117.557 E.33691
G1 X145.328 Y117.557 E.00867
G1 X128.442 Y134.443 E.33691
G1 X127.827 Y134.443 E.00867
G1 X144.713 Y117.557 E.33691
G1 X144.098 Y117.557 E.00867
G1 X127.212 Y134.443 E.33691
G1 X126.598 Y134.443 E.00867
G1 X143.484 Y117.557 E.33691
G1 X142.869 Y117.557 E.00867
G1 X125.983 Y134.443 E.33691
G1 X125.369 Y134.443 E.00867
G1 X142.254 Y117.557 E.33691
G1 X141.64 Y117.557 E.00867
G1 X124.754 Y134.443 E.33691
G1 X124.139 Y134.443 E.00867
G1 X141.025 Y117.557 E.33691
G1 X140.411 Y117.557 E.00867
G1 X123.525 Y134.443 E.33691
G1 X122.91 Y134.443 E.00867
G1 X139.796 Y117.557 E.33691
G1 X139.181 Y117.557 E.00867
G1 X122.295 Y134.443 E.33691
G1 X121.681 Y134.443 E.00867
G1 X138.567 Y117.557 E.33691
G1 X137.952 Y117.557 E.00867
G1 X121.066 Y134.443 E.33691
G1 X120.451 Y134.443 E.00867
G1 X137.337 Y117.557 E.33691
G1 X136.723 Y117.557 E.00867
G1 X119.837 Y134.443 E.33691
G1 X119.222 Y134.443 E.00867
G1 X136.108 Y117.557 E.33691
G1 X135.494 Y117.557 E.00867
G1 X118.608 Y134.443 E.33691
G1 X118.455 Y134.443 E.00216
G1 X118.455 Y133.981 E.00651
G1 X134.879 Y117.557 E.32769
G1 X134.264 Y117.557 E.00867
G1 X118.455 Y133.367 E.31543
G1 X118.455 Y132.752 E.00867
G1 X133.65 Y117.557 E.30317
G1 X133.035 Y117.557 E.00867
G1 X118.455 Y132.137 E.29091
G1 X118.455 Y131.523 E.00867
G1 X132.42 Y117.557 E.27864
G1 X131.806 Y117.557 E.00867
G1 X118.455 Y130.908 E.26638
G1 X118.455 Y130.293 E.00867
G1 X131.191 Y117.557 E.25412
G1 X130.576 Y117.557 E.00867
G1 X118.455 Y129.679 E.24185
G1 X118.455 Y129.064 E.00867
G1 X129.962 Y117.557 E.22959
G1 X129.347 Y117.557 E.00867
G1 X118.455 Y128.45 E.21733
G1 X118.455 Y127.835 E.00867
G1 X128.733 Y117.557 E.20506
G1 X128.118 Y117.557 E.00867
G1 X118.455 Y127.22 E.1928
G1 X118.455 Y126.606 E.00867
G1 X127.503 Y117.557 E.18054
G1 X126.889 Y117.557 E.00867
G1 X118.455 Y125.991 E.16827
G1 X118.455 Y125.376 E.00867
G1 X126.274 Y117.557 E.15601
G1 X125.659 Y117.557 E.00867
G1 X118.455 Y124.762 E.14375
G1 X118.455 Y124.147 E.00867
G1 X125.045 Y117.557 E.13149
G1 X124.43 Y117.557 E.00867
G1 X118.455 Y123.533 E.11922
G1 X118.455 Y122.918 E.00867
G1 X123.816 Y117.557 E.10696
G1 X123.201 Y117.557 E.00867
G1 X118.455 Y122.303 E.0947
G1 X118.455 Y121.689 E.00867
G1 X122.586 Y117.557 E.08243
G1 X121.972 Y117.557 E.00867
G1 X118.455 Y121.074 E.07017
G1 X118.455 Y120.459 E.00867
G1 X121.357 Y117.557 E.05791
G1 X120.742 Y117.557 E.00867
G1 X118.455 Y119.845 E.04564
G1 X118.455 Y119.23 E.00867
G1 X120.128 Y117.557 E.03338
G1 X119.513 Y117.557 E.00867
G1 X118.455 Y118.615 E.02112
G1 X118.455 Y118.001 E.00867
G1 X119.093 Y117.362 E.01274
G1 X105.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F21000
G1 X106.01 Y117.542 E.01228
G1 X106.59 Y117.542 E.00776
G1 X105.542 Y118.59 E.01983
G1 X105.542 Y119.171 E.00776
G1 X107.171 Y117.542 E.0308
G1 X107.751 Y117.542 E.00776
G1 X105.542 Y119.751 E.04177
G1 X105.542 Y120.331 E.00776
G1 X108.331 Y117.542 E.05274
G1 X108.911 Y117.542 E.00776
G1 X105.542 Y120.911 E.06371
M73 P44 R15
G1 X105.542 Y121.491 E.00776
G1 X109.491 Y117.542 E.07469
G1 X110.072 Y117.542 E.00776
G1 X105.542 Y122.072 E.08566
G1 X105.542 Y122.652 E.00776
G1 X110.652 Y117.542 E.09663
G1 X111.232 Y117.542 E.00776
G1 X105.542 Y123.232 E.1076
G1 X105.542 Y123.812 E.00776
G1 X111.812 Y117.542 E.11858
G1 X112.392 Y117.542 E.00776
G1 X105.542 Y124.392 E.12955
G1 X105.542 Y124.972 E.00776
G1 X112.972 Y117.542 E.14052
G1 X113.553 Y117.542 E.00776
G1 X105.542 Y125.553 E.15149
G1 X105.542 Y126.133 E.00776
G1 X114.133 Y117.542 E.16247
G1 X114.713 Y117.542 E.00776
G1 X105.542 Y126.713 E.17344
G1 X105.542 Y127.293 E.00776
G1 X115.293 Y117.542 E.18441
G1 X115.873 Y117.542 E.00776
G1 X105.542 Y127.873 E.19538
G1 X105.542 Y128.454 E.00776
G1 X116.454 Y117.542 E.20635
G1 X117.034 Y117.542 E.00776
G1 X105.542 Y129.034 E.21733
G1 X105.542 Y129.614 E.00776
G1 X117.614 Y117.542 E.2283
G1 X118.037 Y117.542 E.00565
G1 X118.037 Y117.699 E.00211
G1 X105.542 Y130.194 E.23629
G1 X105.542 Y130.774 E.00776
G1 X118.037 Y118.28 E.23629
G1 X118.037 Y118.86 E.00776
G1 X105.542 Y131.355 E.23629
G1 X105.542 Y131.935 E.00776
G1 X118.037 Y119.44 E.23629
G1 X118.037 Y120.02 E.00776
G1 X105.542 Y132.515 E.23629
G1 X105.542 Y133.095 E.00776
G1 X118.037 Y120.6 E.23629
G1 X118.037 Y121.181 E.00776
G1 X105.542 Y133.675 E.23629
G1 X105.542 Y134.256 E.00776
G1 X118.037 Y121.761 E.23629
G1 X118.037 Y122.341 E.00776
G1 X105.92 Y134.458 E.22915
G1 X106.5 Y134.458 E.00776
G1 X118.037 Y122.921 E.21818
G1 X118.037 Y123.501 E.00776
G1 X107.08 Y134.458 E.2072
G1 X107.66 Y134.458 E.00776
G1 X118.037 Y124.082 E.19623
G1 X118.037 Y124.662 E.00776
G1 X108.241 Y134.458 E.18526
G1 X108.821 Y134.458 E.00776
G1 X118.037 Y125.242 E.17429
G1 X118.037 Y125.822 E.00776
G1 X109.401 Y134.458 E.16331
G1 X109.981 Y134.458 E.00776
G1 X118.037 Y126.402 E.15234
G1 X118.037 Y126.983 E.00776
G1 X110.561 Y134.458 E.14137
G1 X111.142 Y134.458 E.00776
G1 X118.037 Y127.563 E.1304
G1 X118.037 Y128.143 E.00776
G1 X111.722 Y134.458 E.11943
G1 X112.302 Y134.458 E.00776
G1 X118.037 Y128.723 E.10845
G1 X118.037 Y129.303 E.00776
G1 X112.882 Y134.458 E.09748
G1 X113.462 Y134.458 E.00776
G1 X118.037 Y129.884 E.08651
G1 X118.037 Y130.464 E.00776
G1 X114.043 Y134.458 E.07554
G1 X114.623 Y134.458 E.00776
G1 X118.037 Y131.044 E.06456
G1 X118.037 Y131.624 E.00776
G1 X115.203 Y134.458 E.05359
G1 X115.783 Y134.458 E.00776
G1 X118.037 Y132.204 E.04262
G1 X118.037 Y132.785 E.00776
G1 X116.363 Y134.458 E.03165
G1 X116.944 Y134.458 E.00776
G1 X118.037 Y133.365 E.02067
G1 X118.037 Y133.945 E.00776
G1 X117.342 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X118.037 Y133.945 E-.37311
G1 X118.037 Y133.365 E-.22048
G1 X117.727 Y133.674 E-.16641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/88
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.32 I-.043 J1.216 P1  F30000
G1 X150.834 Y134.834 Z1.32
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.094 Z1.4 F30000
G1 X150.638 Y118.241 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X149.954 Y117.557 E.01365
G1 X149.339 Y117.557 E.00867
G1 X150.443 Y118.661 E.02202
G1 X150.443 Y119.275 E.00867
G1 X148.725 Y117.557 E.03429
G1 X148.11 Y117.557 E.00867
G1 X150.443 Y119.89 E.04655
G1 X150.443 Y120.505 E.00867
G1 X147.495 Y117.557 E.05881
G1 X146.881 Y117.557 E.00867
G1 X150.443 Y121.119 E.07108
G1 X150.443 Y121.734 E.00867
G1 X146.266 Y117.557 E.08334
G1 X145.651 Y117.557 E.00867
G1 X150.443 Y122.349 E.0956
G1 X150.443 Y122.963 E.00867
G1 X145.037 Y117.557 E.10787
G1 X144.422 Y117.557 E.00867
G1 X150.443 Y123.578 E.12013
G1 X150.443 Y124.193 E.00867
G1 X143.807 Y117.557 E.13239
G1 X143.193 Y117.557 E.00867
G1 X150.443 Y124.807 E.14465
G1 X150.443 Y125.422 E.00867
G1 X142.578 Y117.557 E.15692
G1 X141.964 Y117.557 E.00867
G1 X150.443 Y126.036 E.16918
G1 X150.443 Y126.651 E.00867
G1 X141.349 Y117.557 E.18144
G1 X140.734 Y117.557 E.00867
G1 X150.443 Y127.266 E.19371
G1 X150.443 Y127.88 E.00867
G1 X140.12 Y117.557 E.20597
G1 X139.505 Y117.557 E.00867
G1 X150.443 Y128.495 E.21823
G1 X150.443 Y129.11 E.00867
G1 X138.89 Y117.557 E.2305
G1 X138.276 Y117.557 E.00867
G1 X150.443 Y129.724 E.24276
G1 X150.443 Y130.339 E.00867
G1 X137.661 Y117.557 E.25502
G1 X137.047 Y117.557 E.00867
G1 X150.443 Y130.953 E.26729
G1 X150.443 Y131.568 E.00867
G1 X136.432 Y117.557 E.27955
G1 X135.817 Y117.557 E.00867
G1 X150.443 Y132.183 E.29181
G1 X150.443 Y132.797 E.00867
G1 X135.203 Y117.557 E.30407
G1 X134.588 Y117.557 E.00867
G1 X150.443 Y133.412 E.31634
G1 X150.443 Y134.027 E.00867
G1 X133.973 Y117.557 E.3286
G1 X133.359 Y117.557 E.00867
G1 X150.245 Y134.443 E.33691
G1 X149.63 Y134.443 E.00867
G1 X132.744 Y117.557 E.33691
G1 X132.129 Y117.557 E.00867
G1 X149.015 Y134.443 E.33691
G1 X148.401 Y134.443 E.00867
G1 X131.515 Y117.557 E.33691
G1 X130.9 Y117.557 E.00867
G1 X147.786 Y134.443 E.33691
G1 X147.172 Y134.443 E.00867
G1 X130.286 Y117.557 E.33691
G1 X129.671 Y117.557 E.00867
G1 X146.557 Y134.443 E.33691
G1 X145.942 Y134.443 E.00867
G1 X129.056 Y117.557 E.33691
G1 X128.442 Y117.557 E.00867
G1 X145.328 Y134.443 E.33691
G1 X144.713 Y134.443 E.00867
G1 X127.827 Y117.557 E.33691
G1 X127.212 Y117.557 E.00867
G1 X144.098 Y134.443 E.33691
G1 X143.484 Y134.443 E.00867
G1 X126.598 Y117.557 E.33691
G1 X125.983 Y117.557 E.00867
G1 X142.869 Y134.443 E.33691
G1 X142.254 Y134.443 E.00867
G1 X125.369 Y117.557 E.33691
G1 X124.754 Y117.557 E.00867
G1 X141.64 Y134.443 E.33691
G1 X141.025 Y134.443 E.00867
G1 X124.139 Y117.557 E.33691
G1 X123.525 Y117.557 E.00867
G1 X140.411 Y134.443 E.33691
G1 X139.796 Y134.443 E.00867
G1 X122.91 Y117.557 E.33691
G1 X122.295 Y117.557 E.00867
G1 X139.181 Y134.443 E.33691
G1 X138.567 Y134.443 E.00867
G1 X121.681 Y117.557 E.33691
G1 X121.066 Y117.557 E.00867
G1 X137.952 Y134.443 E.33691
G1 X137.337 Y134.443 E.00867
G1 X120.451 Y117.557 E.33691
G1 X119.837 Y117.557 E.00867
G1 X136.723 Y134.443 E.33691
G1 X136.108 Y134.443 E.00867
G1 X119.222 Y117.557 E.33691
G1 X118.608 Y117.557 E.00867
G1 X135.494 Y134.443 E.33691
G1 X134.879 Y134.443 E.00867
G1 X118.455 Y118.019 E.32769
G1 X118.455 Y118.633 E.00867
G1 X134.264 Y134.443 E.31543
G1 X133.65 Y134.443 E.00867
G1 X118.455 Y119.248 E.30317
G1 X118.455 Y119.863 E.00867
G1 X133.035 Y134.443 E.29091
G1 X132.42 Y134.443 E.00867
G1 X118.455 Y120.477 E.27864
G1 X118.455 Y121.092 E.00867
G1 X131.806 Y134.443 E.26638
G1 X131.191 Y134.443 E.00867
G1 X118.455 Y121.707 E.25412
G1 X118.455 Y122.321 E.00867
G1 X130.576 Y134.443 E.24185
G1 X129.962 Y134.443 E.00867
G1 X118.455 Y122.936 E.22959
G1 X118.455 Y123.55 E.00867
G1 X129.347 Y134.443 E.21733
G1 X128.733 Y134.443 E.00867
G1 X118.455 Y124.165 E.20506
G1 X118.455 Y124.78 E.00867
G1 X128.118 Y134.443 E.1928
G1 X127.503 Y134.443 E.00867
G1 X118.455 Y125.394 E.18054
G1 X118.455 Y126.009 E.00867
G1 X126.889 Y134.443 E.16827
G1 X126.274 Y134.443 E.00867
G1 X118.455 Y126.624 E.15601
G1 X118.455 Y127.238 E.00867
G1 X125.659 Y134.443 E.14375
G1 X125.045 Y134.443 E.00867
G1 X118.455 Y127.853 E.13149
G1 X118.455 Y128.467 E.00867
G1 X124.43 Y134.443 E.11922
M73 P45 R15
G1 X123.816 Y134.443 E.00867
G1 X118.455 Y129.082 E.10696
G1 X118.455 Y129.697 E.00867
G1 X123.201 Y134.443 E.0947
G1 X122.586 Y134.443 E.00867
G1 X118.455 Y130.311 E.08243
G1 X118.455 Y130.926 E.00867
G1 X121.972 Y134.443 E.07017
G1 X121.357 Y134.443 E.00867
G1 X118.455 Y131.541 E.05791
G1 X118.455 Y132.155 E.00867
G1 X120.742 Y134.443 E.04564
G1 X120.128 Y134.443 E.00867
G1 X118.455 Y132.77 E.03338
G1 X118.455 Y133.385 E.00867
G1 X119.513 Y134.443 E.02112
G1 X118.898 Y134.443 E.00867
G1 X118.26 Y133.804 E.01274
G1 X106.191 Y134.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F21000
G1 X105.542 Y133.99 E.01228
G1 X105.542 Y133.41 E.00776
G1 X106.59 Y134.458 E.01982
G1 X107.171 Y134.458 E.00776
G1 X105.542 Y132.829 E.0308
G1 X105.542 Y132.249 E.00776
G1 X107.751 Y134.458 E.04177
G1 X108.331 Y134.458 E.00776
G1 X105.542 Y131.669 E.05274
G1 X105.542 Y131.089 E.00776
G1 X108.911 Y134.458 E.06371
G1 X109.491 Y134.458 E.00776
G1 X105.542 Y130.509 E.07469
G1 X105.542 Y129.929 E.00776
G1 X110.071 Y134.458 E.08566
G1 X110.652 Y134.458 E.00776
G1 X105.542 Y129.348 E.09663
G1 X105.542 Y128.768 E.00776
G1 X111.232 Y134.458 E.1076
G1 X111.812 Y134.458 E.00776
G1 X105.542 Y128.188 E.11858
G1 X105.542 Y127.608 E.00776
G1 X112.392 Y134.458 E.12955
G1 X112.972 Y134.458 E.00776
G1 X105.542 Y127.028 E.14052
G1 X105.542 Y126.447 E.00776
G1 X113.553 Y134.458 E.15149
G1 X114.133 Y134.458 E.00776
G1 X105.542 Y125.867 E.16247
G1 X105.542 Y125.287 E.00776
G1 X114.713 Y134.458 E.17344
G1 X115.293 Y134.458 E.00776
G1 X105.542 Y124.707 E.18441
G1 X105.542 Y124.127 E.00776
G1 X115.873 Y134.458 E.19538
G1 X116.454 Y134.458 E.00776
G1 X105.542 Y123.546 E.20635
G1 X105.542 Y122.966 E.00776
G1 X117.034 Y134.458 E.21733
G1 X117.614 Y134.458 E.00776
G1 X105.542 Y122.386 E.2283
G1 X105.542 Y121.806 E.00776
G1 X118.037 Y134.301 E.23629
G1 X118.037 Y133.72 E.00776
G1 X105.542 Y121.226 E.23629
G1 X105.542 Y120.645 E.00776
G1 X118.037 Y133.14 E.23629
G1 X118.037 Y132.56 E.00776
G1 X105.542 Y120.065 E.23629
G1 X105.542 Y119.485 E.00776
G1 X118.037 Y131.98 E.23629
G1 X118.037 Y131.4 E.00776
G1 X105.542 Y118.905 E.23629
G1 X105.542 Y118.325 E.00776
G1 X118.037 Y130.819 E.23629
G1 X118.037 Y130.239 E.00776
G1 X105.542 Y117.744 E.23629
G1 X105.542 Y117.542 E.00271
G1 X105.92 Y117.542 E.00505
G1 X118.037 Y129.659 E.22915
G1 X118.037 Y129.079 E.00776
G1 X106.5 Y117.542 E.21818
G1 X107.08 Y117.542 E.00776
G1 X118.037 Y128.499 E.2072
G1 X118.037 Y127.918 E.00776
G1 X107.66 Y117.542 E.19623
G1 X108.241 Y117.542 E.00776
G1 X118.037 Y127.338 E.18526
G1 X118.037 Y126.758 E.00776
G1 X108.821 Y117.542 E.17429
G1 X109.401 Y117.542 E.00776
G1 X118.037 Y126.178 E.16331
G1 X118.037 Y125.598 E.00776
G1 X109.981 Y117.542 E.15234
G1 X110.561 Y117.542 E.00776
G1 X118.037 Y125.017 E.14137
G1 X118.037 Y124.437 E.00776
G1 X111.142 Y117.542 E.1304
G1 X111.722 Y117.542 E.00776
G1 X118.037 Y123.857 E.11943
G1 X118.037 Y123.277 E.00776
G1 X112.302 Y117.542 E.10845
G1 X112.882 Y117.542 E.00776
G1 X118.037 Y122.697 E.09748
G1 X118.037 Y122.116 E.00776
G1 X113.462 Y117.542 E.08651
G1 X114.043 Y117.542 E.00776
G1 X118.037 Y121.536 E.07554
G1 X118.037 Y120.956 E.00776
G1 X114.623 Y117.542 E.06456
G1 X115.203 Y117.542 E.00776
G1 X118.037 Y120.376 E.05359
G1 X118.037 Y119.796 E.00776
G1 X115.783 Y117.542 E.04262
G1 X116.363 Y117.542 E.00776
G1 X118.037 Y119.215 E.03165
G1 X118.037 Y118.635 E.00776
G1 X116.944 Y117.542 E.02067
G1 X117.524 Y117.542 E.00776
G1 X118.218 Y118.236 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 1.08
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X117.524 Y117.542 E-.37311
G1 X116.944 Y117.542 E-.22048
G1 X117.253 Y117.852 E-.16641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/88
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.4 I-.549 J1.086 P1  F30000
G1 X150.834 Y134.834 Z1.4
G1 Z1.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.759 Y134.638 Z1.48 F30000
G1 Z1.08
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.954 E.01365
G1 X150.443 Y133.339 E.00867
G1 X149.339 Y134.443 E.02202
G1 X148.725 Y134.443 E.00867
G1 X150.443 Y132.725 E.03429
G1 X150.443 Y132.11 E.00867
G1 X148.11 Y134.443 E.04655
G1 X147.495 Y134.443 E.00867
G1 X150.443 Y131.495 E.05881
G1 X150.443 Y130.881 E.00867
G1 X146.881 Y134.443 E.07108
G1 X146.266 Y134.443 E.00867
G1 X150.443 Y130.266 E.08334
G1 X150.443 Y129.651 E.00867
G1 X145.651 Y134.443 E.0956
G1 X145.037 Y134.443 E.00867
G1 X150.443 Y129.037 E.10787
G1 X150.443 Y128.422 E.00867
G1 X144.422 Y134.443 E.12013
G1 X143.807 Y134.443 E.00867
G1 X150.443 Y127.807 E.13239
G1 X150.443 Y127.193 E.00867
G1 X143.193 Y134.443 E.14465
G1 X142.578 Y134.443 E.00867
G1 X150.443 Y126.578 E.15692
G1 X150.443 Y125.964 E.00867
G1 X141.964 Y134.443 E.16918
G1 X141.349 Y134.443 E.00867
G1 X150.443 Y125.349 E.18144
G1 X150.443 Y124.734 E.00867
G1 X140.734 Y134.443 E.19371
G1 X140.12 Y134.443 E.00867
G1 X150.443 Y124.12 E.20597
G1 X150.443 Y123.505 E.00867
G1 X139.505 Y134.443 E.21823
G1 X138.89 Y134.443 E.00867
G1 X150.443 Y122.89 E.2305
G1 X150.443 Y122.276 E.00867
G1 X138.276 Y134.443 E.24276
G1 X137.661 Y134.443 E.00867
G1 X150.443 Y121.661 E.25502
G1 X150.443 Y121.047 E.00867
G1 X137.047 Y134.443 E.26728
G1 X136.432 Y134.443 E.00867
G1 X150.443 Y120.432 E.27955
G1 X150.443 Y119.817 E.00867
G1 X135.817 Y134.443 E.29181
G1 X135.203 Y134.443 E.00867
G1 X150.443 Y119.203 E.30407
G1 X150.443 Y118.588 E.00867
G1 X134.588 Y134.443 E.31634
G1 X133.973 Y134.443 E.00867
G1 X150.443 Y117.973 E.3286
G1 X150.443 Y117.557 E.00587
G1 X150.245 Y117.557 E.0028
G1 X133.359 Y134.443 E.33691
G1 X132.744 Y134.443 E.00867
G1 X149.63 Y117.557 E.33691
G1 X149.015 Y117.557 E.00867
G1 X132.129 Y134.443 E.33691
G1 X131.515 Y134.443 E.00867
G1 X148.401 Y117.557 E.33691
G1 X147.786 Y117.557 E.00867
G1 X130.9 Y134.443 E.33691
G1 X130.286 Y134.443 E.00867
G1 X147.172 Y117.557 E.33691
G1 X146.557 Y117.557 E.00867
G1 X129.671 Y134.443 E.33691
G1 X129.056 Y134.443 E.00867
G1 X145.942 Y117.557 E.33691
G1 X145.328 Y117.557 E.00867
G1 X128.442 Y134.443 E.33691
G1 X127.827 Y134.443 E.00867
G1 X144.713 Y117.557 E.33691
G1 X144.098 Y117.557 E.00867
G1 X127.212 Y134.443 E.33691
G1 X126.598 Y134.443 E.00867
G1 X143.484 Y117.557 E.33691
G1 X142.869 Y117.557 E.00867
G1 X125.983 Y134.443 E.33691
G1 X125.369 Y134.443 E.00867
G1 X142.254 Y117.557 E.33691
G1 X141.64 Y117.557 E.00867
G1 X124.754 Y134.443 E.33691
G1 X124.139 Y134.443 E.00867
G1 X141.025 Y117.557 E.33691
G1 X140.411 Y117.557 E.00867
G1 X123.525 Y134.443 E.33691
G1 X122.91 Y134.443 E.00867
G1 X139.796 Y117.557 E.33691
G1 X139.181 Y117.557 E.00867
G1 X122.295 Y134.443 E.33691
G1 X121.681 Y134.443 E.00867
G1 X138.567 Y117.557 E.33691
G1 X137.952 Y117.557 E.00867
G1 X121.066 Y134.443 E.33691
G1 X120.451 Y134.443 E.00867
G1 X137.337 Y117.557 E.33691
G1 X136.723 Y117.557 E.00867
G1 X119.837 Y134.443 E.33691
G1 X119.222 Y134.443 E.00867
G1 X136.108 Y117.557 E.33691
G1 X135.494 Y117.557 E.00867
G1 X118.608 Y134.443 E.33691
G1 X118.455 Y134.443 E.00216
G1 X118.455 Y133.981 E.00651
G1 X134.879 Y117.557 E.32769
G1 X134.264 Y117.557 E.00867
G1 X118.455 Y133.367 E.31543
G1 X118.455 Y132.752 E.00867
G1 X133.65 Y117.557 E.30317
G1 X133.035 Y117.557 E.00867
M73 P46 R15
G1 X118.455 Y132.137 E.29091
G1 X118.455 Y131.523 E.00867
G1 X132.42 Y117.557 E.27864
G1 X131.806 Y117.557 E.00867
G1 X118.455 Y130.908 E.26638
G1 X118.455 Y130.293 E.00867
G1 X131.191 Y117.557 E.25412
G1 X130.576 Y117.557 E.00867
G1 X118.455 Y129.679 E.24185
G1 X118.455 Y129.064 E.00867
G1 X129.962 Y117.557 E.22959
G1 X129.347 Y117.557 E.00867
G1 X118.455 Y128.45 E.21733
G1 X118.455 Y127.835 E.00867
G1 X128.733 Y117.557 E.20506
G1 X128.118 Y117.557 E.00867
G1 X118.455 Y127.22 E.1928
G1 X118.455 Y126.606 E.00867
G1 X127.503 Y117.557 E.18054
G1 X126.889 Y117.557 E.00867
G1 X118.455 Y125.991 E.16827
G1 X118.455 Y125.376 E.00867
G1 X126.274 Y117.557 E.15601
G1 X125.659 Y117.557 E.00867
G1 X118.455 Y124.762 E.14375
G1 X118.455 Y124.147 E.00867
G1 X125.045 Y117.557 E.13149
G1 X124.43 Y117.557 E.00867
G1 X118.455 Y123.533 E.11922
G1 X118.455 Y122.918 E.00867
G1 X123.816 Y117.557 E.10696
G1 X123.201 Y117.557 E.00867
G1 X118.455 Y122.303 E.0947
G1 X118.455 Y121.689 E.00867
G1 X122.586 Y117.557 E.08243
G1 X121.972 Y117.557 E.00867
G1 X118.455 Y121.074 E.07017
G1 X118.455 Y120.459 E.00867
G1 X121.357 Y117.557 E.05791
G1 X120.742 Y117.557 E.00867
G1 X118.455 Y119.845 E.04564
G1 X118.455 Y119.23 E.00867
G1 X120.128 Y117.557 E.03338
G1 X119.513 Y117.557 E.00867
G1 X118.455 Y118.615 E.02112
G1 X118.455 Y118.001 E.00867
G1 X119.093 Y117.362 E.01274
G1 X105.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F21000
G1 X106.01 Y117.542 E.01228
G1 X106.59 Y117.542 E.00776
G1 X105.542 Y118.59 E.01983
G1 X105.542 Y119.171 E.00776
G1 X107.171 Y117.542 E.0308
G1 X107.751 Y117.542 E.00776
G1 X105.542 Y119.751 E.04177
G1 X105.542 Y120.331 E.00776
G1 X108.331 Y117.542 E.05274
G1 X108.911 Y117.542 E.00776
G1 X105.542 Y120.911 E.06371
G1 X105.542 Y121.491 E.00776
G1 X109.491 Y117.542 E.07469
G1 X110.072 Y117.542 E.00776
G1 X105.542 Y122.072 E.08566
G1 X105.542 Y122.652 E.00776
G1 X110.652 Y117.542 E.09663
G1 X111.232 Y117.542 E.00776
G1 X105.542 Y123.232 E.1076
G1 X105.542 Y123.812 E.00776
G1 X111.812 Y117.542 E.11858
G1 X112.392 Y117.542 E.00776
G1 X105.542 Y124.392 E.12955
G1 X105.542 Y124.972 E.00776
G1 X112.972 Y117.542 E.14052
G1 X113.553 Y117.542 E.00776
G1 X105.542 Y125.553 E.15149
G1 X105.542 Y126.133 E.00776
G1 X114.133 Y117.542 E.16247
G1 X114.713 Y117.542 E.00776
G1 X105.542 Y126.713 E.17344
G1 X105.542 Y127.293 E.00776
G1 X115.293 Y117.542 E.18441
G1 X115.873 Y117.542 E.00776
G1 X105.542 Y127.873 E.19538
G1 X105.542 Y128.454 E.00776
G1 X116.454 Y117.542 E.20635
G1 X117.034 Y117.542 E.00776
G1 X105.542 Y129.034 E.21733
G1 X105.542 Y129.614 E.00776
G1 X117.614 Y117.542 E.2283
G1 X118.037 Y117.542 E.00565
G1 X118.037 Y117.699 E.00211
G1 X105.542 Y130.194 E.23629
G1 X105.542 Y130.774 E.00776
G1 X118.037 Y118.28 E.23629
G1 X118.037 Y118.86 E.00776
G1 X105.542 Y131.355 E.23629
G1 X105.542 Y131.935 E.00776
G1 X118.037 Y119.44 E.23629
G1 X118.037 Y120.02 E.00776
G1 X105.542 Y132.515 E.23629
G1 X105.542 Y133.095 E.00776
G1 X118.037 Y120.6 E.23629
G1 X118.037 Y121.181 E.00776
G1 X105.542 Y133.675 E.23629
M73 P46 R14
G1 X105.542 Y134.256 E.00776
G1 X118.037 Y121.761 E.23629
G1 X118.037 Y122.341 E.00776
G1 X105.92 Y134.458 E.22915
G1 X106.5 Y134.458 E.00776
G1 X118.037 Y122.921 E.21818
G1 X118.037 Y123.501 E.00776
G1 X107.08 Y134.458 E.2072
G1 X107.66 Y134.458 E.00776
G1 X118.037 Y124.082 E.19623
G1 X118.037 Y124.662 E.00776
G1 X108.241 Y134.458 E.18526
G1 X108.821 Y134.458 E.00776
G1 X118.037 Y125.242 E.17429
G1 X118.037 Y125.822 E.00776
G1 X109.401 Y134.458 E.16331
G1 X109.981 Y134.458 E.00776
G1 X118.037 Y126.402 E.15234
G1 X118.037 Y126.983 E.00776
G1 X110.561 Y134.458 E.14137
G1 X111.142 Y134.458 E.00776
G1 X118.037 Y127.563 E.1304
G1 X118.037 Y128.143 E.00776
G1 X111.722 Y134.458 E.11943
G1 X112.302 Y134.458 E.00776
G1 X118.037 Y128.723 E.10845
G1 X118.037 Y129.303 E.00776
G1 X112.882 Y134.458 E.09748
G1 X113.462 Y134.458 E.00776
G1 X118.037 Y129.884 E.08651
G1 X118.037 Y130.464 E.00776
G1 X114.043 Y134.458 E.07554
G1 X114.623 Y134.458 E.00776
G1 X118.037 Y131.044 E.06456
G1 X118.037 Y131.624 E.00776
G1 X115.203 Y134.458 E.05359
G1 X115.783 Y134.458 E.00776
G1 X118.037 Y132.204 E.04262
G1 X118.037 Y132.785 E.00776
G1 X116.363 Y134.458 E.03165
G1 X116.944 Y134.458 E.00776
G1 X118.037 Y133.365 E.02067
G1 X118.037 Y133.945 E.00776
G1 X117.342 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X118.037 Y133.945 E-.37311
G1 X118.037 Y133.365 E-.22048
G1 X117.727 Y133.674 E-.16641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/88
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.48 I-.043 J1.216 P1  F30000
G1 X150.834 Y134.834 Z1.48
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X105.166 Y134.834 E.71873
G1 X105.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.71873
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X104.683 Y135.317 E.73393
G1 X104.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.73393
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.094 Z1.56 F30000
G1 X150.638 Y118.241 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X149.954 Y117.557 E.01365
G1 X149.339 Y117.557 E.00867
G1 X150.443 Y118.661 E.02202
G1 X150.443 Y119.275 E.00867
G1 X148.725 Y117.557 E.03429
G1 X148.11 Y117.557 E.00867
G1 X150.443 Y119.89 E.04655
G1 X150.443 Y120.505 E.00867
G1 X147.495 Y117.557 E.05881
G1 X146.881 Y117.557 E.00867
G1 X150.443 Y121.119 E.07108
G1 X150.443 Y121.734 E.00867
G1 X146.266 Y117.557 E.08334
G1 X145.651 Y117.557 E.00867
G1 X150.443 Y122.349 E.0956
G1 X150.443 Y122.963 E.00867
G1 X145.037 Y117.557 E.10787
G1 X144.422 Y117.557 E.00867
G1 X150.443 Y123.578 E.12013
G1 X150.443 Y124.193 E.00867
G1 X143.807 Y117.557 E.13239
G1 X143.193 Y117.557 E.00867
G1 X150.443 Y124.807 E.14465
G1 X150.443 Y125.422 E.00867
G1 X142.578 Y117.557 E.15692
G1 X141.964 Y117.557 E.00867
G1 X150.443 Y126.036 E.16918
G1 X150.443 Y126.651 E.00867
G1 X141.349 Y117.557 E.18144
G1 X140.734 Y117.557 E.00867
G1 X150.443 Y127.266 E.19371
G1 X150.443 Y127.88 E.00867
G1 X140.12 Y117.557 E.20597
G1 X139.505 Y117.557 E.00867
G1 X150.443 Y128.495 E.21823
G1 X150.443 Y129.11 E.00867
G1 X138.89 Y117.557 E.2305
G1 X138.276 Y117.557 E.00867
G1 X150.443 Y129.724 E.24276
G1 X150.443 Y130.339 E.00867
G1 X137.661 Y117.557 E.25502
G1 X137.047 Y117.557 E.00867
G1 X150.443 Y130.953 E.26729
G1 X150.443 Y131.568 E.00867
G1 X136.432 Y117.557 E.27955
G1 X135.817 Y117.557 E.00867
G1 X150.443 Y132.183 E.29181
G1 X150.443 Y132.797 E.00867
G1 X135.203 Y117.557 E.30407
G1 X134.588 Y117.557 E.00867
G1 X150.443 Y133.412 E.31634
G1 X150.443 Y134.027 E.00867
G1 X133.973 Y117.557 E.3286
G1 X133.359 Y117.557 E.00867
G1 X150.245 Y134.443 E.33691
G1 X149.63 Y134.443 E.00867
G1 X132.744 Y117.557 E.33691
G1 X132.129 Y117.557 E.00867
G1 X149.015 Y134.443 E.33691
G1 X148.401 Y134.443 E.00867
G1 X131.515 Y117.557 E.33691
G1 X130.9 Y117.557 E.00867
G1 X147.786 Y134.443 E.33691
G1 X147.172 Y134.443 E.00867
G1 X130.286 Y117.557 E.33691
G1 X129.671 Y117.557 E.00867
G1 X146.557 Y134.443 E.33691
G1 X145.942 Y134.443 E.00867
G1 X129.056 Y117.557 E.33691
G1 X128.442 Y117.557 E.00867
G1 X145.328 Y134.443 E.33691
G1 X144.713 Y134.443 E.00867
G1 X127.827 Y117.557 E.33691
G1 X127.212 Y117.557 E.00867
G1 X144.098 Y134.443 E.33691
G1 X143.484 Y134.443 E.00867
M73 P47 R14
G1 X126.598 Y117.557 E.33691
G1 X125.983 Y117.557 E.00867
G1 X142.869 Y134.443 E.33691
G1 X142.254 Y134.443 E.00867
G1 X125.369 Y117.557 E.33691
G1 X124.754 Y117.557 E.00867
G1 X141.64 Y134.443 E.33691
G1 X141.025 Y134.443 E.00867
G1 X124.139 Y117.557 E.33691
G1 X123.525 Y117.557 E.00867
G1 X140.411 Y134.443 E.33691
G1 X139.796 Y134.443 E.00867
G1 X122.91 Y117.557 E.33691
G1 X122.295 Y117.557 E.00867
G1 X139.181 Y134.443 E.33691
G1 X138.567 Y134.443 E.00867
G1 X121.681 Y117.557 E.33691
G1 X121.066 Y117.557 E.00867
G1 X137.952 Y134.443 E.33691
G1 X137.337 Y134.443 E.00867
G1 X120.451 Y117.557 E.33691
G1 X119.837 Y117.557 E.00867
G1 X136.723 Y134.443 E.33691
G1 X136.108 Y134.443 E.00867
G1 X119.222 Y117.557 E.33691
G1 X118.608 Y117.557 E.00867
G1 X135.494 Y134.443 E.33691
G1 X134.879 Y134.443 E.00867
G1 X118.455 Y118.019 E.32769
G1 X118.455 Y118.633 E.00867
G1 X134.264 Y134.443 E.31543
G1 X133.65 Y134.443 E.00867
G1 X118.455 Y119.248 E.30317
G1 X118.455 Y119.863 E.00867
G1 X133.035 Y134.443 E.29091
G1 X132.42 Y134.443 E.00867
G1 X118.455 Y120.477 E.27864
G1 X118.455 Y121.092 E.00867
G1 X131.806 Y134.443 E.26638
G1 X131.191 Y134.443 E.00867
G1 X118.455 Y121.707 E.25412
G1 X118.455 Y122.321 E.00867
G1 X130.576 Y134.443 E.24185
G1 X129.962 Y134.443 E.00867
G1 X118.455 Y122.936 E.22959
G1 X118.455 Y123.55 E.00867
G1 X129.347 Y134.443 E.21733
G1 X128.733 Y134.443 E.00867
G1 X118.455 Y124.165 E.20506
G1 X118.455 Y124.78 E.00867
G1 X128.118 Y134.443 E.1928
G1 X127.503 Y134.443 E.00867
G1 X118.455 Y125.394 E.18054
G1 X118.455 Y126.009 E.00867
G1 X126.889 Y134.443 E.16827
G1 X126.274 Y134.443 E.00867
G1 X118.455 Y126.624 E.15601
G1 X118.455 Y127.238 E.00867
G1 X125.659 Y134.443 E.14375
G1 X125.045 Y134.443 E.00867
G1 X118.455 Y127.853 E.13149
G1 X118.455 Y128.467 E.00867
G1 X124.43 Y134.443 E.11922
G1 X123.816 Y134.443 E.00867
G1 X118.455 Y129.082 E.10696
G1 X118.455 Y129.697 E.00867
G1 X123.201 Y134.443 E.0947
G1 X122.586 Y134.443 E.00867
G1 X118.455 Y130.311 E.08243
G1 X118.455 Y130.926 E.00867
G1 X121.972 Y134.443 E.07017
G1 X121.357 Y134.443 E.00867
G1 X118.455 Y131.541 E.05791
G1 X118.455 Y132.155 E.00867
G1 X120.742 Y134.443 E.04564
G1 X120.128 Y134.443 E.00867
G1 X118.455 Y132.77 E.03338
G1 X118.455 Y133.385 E.00867
G1 X119.513 Y134.443 E.02112
G1 X118.898 Y134.443 E.00867
G1 X118.26 Y133.804 E.01274
G1 X106.191 Y134.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F21000
G1 X105.542 Y133.99 E.01228
G1 X105.542 Y133.41 E.00776
G1 X106.59 Y134.458 E.01982
G1 X107.171 Y134.458 E.00776
G1 X105.542 Y132.829 E.0308
G1 X105.542 Y132.249 E.00776
G1 X107.751 Y134.458 E.04177
G1 X108.331 Y134.458 E.00776
G1 X105.542 Y131.669 E.05274
G1 X105.542 Y131.089 E.00776
G1 X108.911 Y134.458 E.06371
G1 X109.491 Y134.458 E.00776
G1 X105.542 Y130.509 E.07469
G1 X105.542 Y129.929 E.00776
G1 X110.071 Y134.458 E.08566
G1 X110.652 Y134.458 E.00776
G1 X105.542 Y129.348 E.09663
G1 X105.542 Y128.768 E.00776
G1 X111.232 Y134.458 E.1076
G1 X111.812 Y134.458 E.00776
G1 X105.542 Y128.188 E.11858
G1 X105.542 Y127.608 E.00776
G1 X112.392 Y134.458 E.12955
G1 X112.972 Y134.458 E.00776
G1 X105.542 Y127.028 E.14052
G1 X105.542 Y126.447 E.00776
G1 X113.553 Y134.458 E.15149
G1 X114.133 Y134.458 E.00776
G1 X105.542 Y125.867 E.16247
G1 X105.542 Y125.287 E.00776
G1 X114.713 Y134.458 E.17344
G1 X115.293 Y134.458 E.00776
G1 X105.542 Y124.707 E.18441
G1 X105.542 Y124.127 E.00776
G1 X115.873 Y134.458 E.19538
G1 X116.454 Y134.458 E.00776
G1 X105.542 Y123.546 E.20635
G1 X105.542 Y122.966 E.00776
G1 X117.034 Y134.458 E.21733
G1 X117.614 Y134.458 E.00776
G1 X105.542 Y122.386 E.2283
G1 X105.542 Y121.806 E.00776
G1 X118.037 Y134.301 E.23629
G1 X118.037 Y133.72 E.00776
G1 X105.542 Y121.226 E.23629
G1 X105.542 Y120.645 E.00776
G1 X118.037 Y133.14 E.23629
G1 X118.037 Y132.56 E.00776
G1 X105.542 Y120.065 E.23629
G1 X105.542 Y119.485 E.00776
G1 X118.037 Y131.98 E.23629
G1 X118.037 Y131.4 E.00776
G1 X105.542 Y118.905 E.23629
G1 X105.542 Y118.325 E.00776
G1 X118.037 Y130.819 E.23629
G1 X118.037 Y130.239 E.00776
G1 X105.542 Y117.744 E.23629
G1 X105.542 Y117.542 E.00271
G1 X105.92 Y117.542 E.00505
G1 X118.037 Y129.659 E.22915
G1 X118.037 Y129.079 E.00776
G1 X106.5 Y117.542 E.21818
G1 X107.08 Y117.542 E.00776
G1 X118.037 Y128.499 E.2072
G1 X118.037 Y127.918 E.00776
G1 X107.66 Y117.542 E.19623
G1 X108.241 Y117.542 E.00776
G1 X118.037 Y127.338 E.18526
G1 X118.037 Y126.758 E.00776
G1 X108.821 Y117.542 E.17429
G1 X109.401 Y117.542 E.00776
G1 X118.037 Y126.178 E.16331
G1 X118.037 Y125.598 E.00776
G1 X109.981 Y117.542 E.15234
G1 X110.561 Y117.542 E.00776
G1 X118.037 Y125.017 E.14137
G1 X118.037 Y124.437 E.00776
G1 X111.142 Y117.542 E.1304
G1 X111.722 Y117.542 E.00776
G1 X118.037 Y123.857 E.11943
G1 X118.037 Y123.277 E.00776
G1 X112.302 Y117.542 E.10845
G1 X112.882 Y117.542 E.00776
G1 X118.037 Y122.697 E.09748
G1 X118.037 Y122.116 E.00776
G1 X113.462 Y117.542 E.08651
G1 X114.043 Y117.542 E.00776
G1 X118.037 Y121.536 E.07554
G1 X118.037 Y120.956 E.00776
G1 X114.623 Y117.542 E.06456
G1 X115.203 Y117.542 E.00776
G1 X118.037 Y120.376 E.05359
G1 X118.037 Y119.796 E.00776
G1 X115.783 Y117.542 E.04262
G1 X116.363 Y117.542 E.00776
G1 X118.037 Y119.215 E.03165
G1 X118.037 Y118.635 E.00776
G1 X116.944 Y117.542 E.02067
G1 X117.524 Y117.542 E.00776
G1 X118.218 Y118.236 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 1.24
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X117.524 Y117.542 E-.37311
G1 X116.944 Y117.542 E-.22048
G1 X117.253 Y117.852 E-.16641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/88
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.56 I-.549 J1.086 P1  F30000
G1 X150.834 Y134.834 Z1.56
G1 Z1.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.979 Y134.834 E.51708
G1 X117.979 Y117.166 E.27807
G1 X150.834 Y117.166 E.51708
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X117.496 Y135.317 E.53228
G1 X117.496 Y116.683 E.29327
G1 X151.317 Y116.683 E.53228
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X104.225 Y135.775 E.67084
G1 X104.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.67084
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.758 Y134.638 Z1.64 F30000
G1 Z1.24
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.953 E.01366
G1 X150.443 Y133.338 E.00868
G1 X149.338 Y134.443 E.02205
G1 X148.723 Y134.443 E.00868
G1 X150.443 Y132.723 E.03432
G1 X150.443 Y132.108 E.00868
G1 X148.108 Y134.443 E.04659
G1 X147.493 Y134.443 E.00868
G1 X150.443 Y131.493 E.05887
G1 X150.443 Y130.877 E.00868
G1 X146.877 Y134.443 E.07114
G1 X146.262 Y134.443 E.00868
G1 X150.443 Y130.262 E.08341
G1 X150.443 Y129.647 E.00868
G1 X145.647 Y134.443 E.09568
G1 X145.032 Y134.443 E.00868
G1 X150.443 Y129.032 E.10796
G1 X150.443 Y128.417 E.00868
G1 X144.417 Y134.443 E.12023
G1 X143.802 Y134.443 E.00868
G1 X150.443 Y127.802 E.1325
G1 X150.443 Y127.187 E.00868
G1 X143.187 Y134.443 E.14477
G1 X142.572 Y134.443 E.00868
G1 X150.443 Y126.572 E.15705
G1 X150.443 Y125.957 E.00868
G1 X141.957 Y134.443 E.16932
G1 X141.341 Y134.443 E.00868
G1 X150.443 Y125.341 E.18159
G1 X150.443 Y124.726 E.00868
G1 X140.726 Y134.443 E.19386
G1 X140.111 Y134.443 E.00868
G1 X150.443 Y124.111 E.20614
G1 X150.443 Y123.496 E.00868
G1 X139.496 Y134.443 E.21841
G1 X138.881 Y134.443 E.00868
G1 X150.443 Y122.881 E.23068
G1 X150.443 Y122.266 E.00868
G1 X138.266 Y134.443 E.24296
G1 X137.651 Y134.443 E.00868
G1 X150.443 Y121.651 E.25523
G1 X150.443 Y121.036 E.00868
G1 X137.036 Y134.443 E.2675
G1 X136.421 Y134.443 E.00868
M73 P48 R14
G1 X150.443 Y120.421 E.27977
G1 X150.443 Y119.805 E.00868
G1 X135.805 Y134.443 E.29205
G1 X135.19 Y134.443 E.00868
G1 X150.443 Y119.19 E.30432
G1 X150.443 Y118.575 E.00868
G1 X134.575 Y134.443 E.31659
G1 X133.96 Y134.443 E.00868
G1 X150.443 Y117.96 E.32886
G1 X150.443 Y117.557 E.00569
G1 X150.231 Y117.557 E.00299
G1 X133.345 Y134.443 E.33691
G1 X132.73 Y134.443 E.00868
G1 X149.616 Y117.557 E.33691
G1 X149.001 Y117.557 E.00868
G1 X132.115 Y134.443 E.33691
G1 X131.5 Y134.443 E.00868
G1 X148.386 Y117.557 E.33691
G1 X147.771 Y117.557 E.00868
G1 X130.885 Y134.443 E.33691
G1 X130.269 Y134.443 E.00868
G1 X147.155 Y117.557 E.33691
G1 X146.54 Y117.557 E.00868
G1 X129.654 Y134.443 E.33691
G1 X129.039 Y134.443 E.00868
G1 X145.925 Y117.557 E.33691
G1 X145.31 Y117.557 E.00868
G1 X128.424 Y134.443 E.33691
G1 X127.809 Y134.443 E.00868
G1 X144.695 Y117.557 E.33691
G1 X144.08 Y117.557 E.00868
G1 X127.194 Y134.443 E.33691
G1 X126.579 Y134.443 E.00868
G1 X143.465 Y117.557 E.33691
G1 X142.85 Y117.557 E.00868
G1 X125.964 Y134.443 E.33691
G1 X125.349 Y134.443 E.00868
G1 X142.235 Y117.557 E.33691
G1 X141.619 Y117.557 E.00868
G1 X124.733 Y134.443 E.33691
G1 X124.118 Y134.443 E.00868
G1 X141.004 Y117.557 E.33691
G1 X140.389 Y117.557 E.00868
G1 X123.503 Y134.443 E.33691
G1 X122.888 Y134.443 E.00868
G1 X139.774 Y117.557 E.33691
G1 X139.159 Y117.557 E.00868
G1 X122.273 Y134.443 E.33691
G1 X121.658 Y134.443 E.00868
G1 X138.544 Y117.557 E.33691
G1 X137.929 Y117.557 E.00868
G1 X121.043 Y134.443 E.33691
G1 X120.428 Y134.443 E.00868
G1 X137.314 Y117.557 E.33691
G1 X136.699 Y117.557 E.00868
G1 X119.813 Y134.443 E.33691
G1 X119.197 Y134.443 E.00868
G1 X136.083 Y117.557 E.33691
G1 X135.468 Y117.557 E.00868
G1 X118.582 Y134.443 E.33691
G1 X118.37 Y134.443 E.003
G1 X118.37 Y134.04 E.00568
G1 X134.853 Y117.557 E.32887
G1 X134.238 Y117.557 E.00868
G1 X118.37 Y133.425 E.3166
G1 X118.37 Y132.81 E.00868
G1 X133.623 Y117.557 E.30433
G1 X133.008 Y117.557 E.00868
G1 X118.37 Y132.195 E.29205
G1 X118.37 Y131.58 E.00868
G1 X132.393 Y117.557 E.27978
G1 X131.778 Y117.557 E.00868
G1 X118.37 Y130.965 E.26751
G1 X118.37 Y130.35 E.00868
G1 X131.163 Y117.557 E.25524
G1 X130.547 Y117.557 E.00868
G1 X118.37 Y129.734 E.24296
G1 X118.37 Y129.119 E.00868
G1 X129.932 Y117.557 E.23069
G1 X129.317 Y117.557 E.00868
G1 X118.37 Y128.504 E.21842
G1 X118.37 Y127.889 E.00868
G1 X128.702 Y117.557 E.20614
G1 X128.087 Y117.557 E.00868
G1 X118.37 Y127.274 E.19387
G1 X118.37 Y126.659 E.00868
G1 X127.472 Y117.557 E.1816
G1 X126.857 Y117.557 E.00868
G1 X118.37 Y126.044 E.16933
G1 X118.37 Y125.429 E.00868
G1 X126.242 Y117.557 E.15705
G1 X125.627 Y117.557 E.00868
G1 X118.37 Y124.814 E.14478
G1 X118.37 Y124.198 E.00868
G1 X125.011 Y117.557 E.13251
G1 X124.396 Y117.557 E.00868
G1 X118.37 Y123.583 E.12024
G1 X118.37 Y122.968 E.00868
G1 X123.781 Y117.557 E.10796
G1 X123.166 Y117.557 E.00868
G1 X118.37 Y122.353 E.09569
G1 X118.37 Y121.738 E.00868
G1 X122.551 Y117.557 E.08342
G1 X121.936 Y117.557 E.00868
G1 X118.37 Y121.123 E.07115
G1 X118.37 Y120.508 E.00868
G1 X121.321 Y117.557 E.05887
G1 X120.706 Y117.557 E.00868
G1 X118.37 Y119.893 E.0466
G1 X118.37 Y119.278 E.00868
G1 X120.091 Y117.557 E.03433
G1 X119.475 Y117.557 E.00868
G1 X118.37 Y118.662 E.02205
G1 X118.37 Y118.047 E.00868
G1 X119.055 Y117.362 E.01367
; WIPE_START
G1 X118.37 Y118.047 E-.36815
G1 X118.37 Y118.662 E-.23374
G1 X118.664 Y118.368 E-.15811
; WIPE_END
G1 E-.04 F1800
G1 X117.696 Y125.939 Z1.64 F30000
G1 X116.468 Y135.538 Z1.64
G1 Z1.24
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X117.234 Y134.772 E.01423
G1 X117.234 Y134.202
G1 X115.898 Y135.538 E.02481
G1 X115.328 Y135.538
G1 X117.234 Y133.633 E.03539
G1 X117.234 Y133.063
G1 X114.759 Y135.538 E.04597
G1 X114.189 Y135.538
G1 X117.234 Y132.493 E.05655
G1 X117.234 Y131.923
G1 X113.619 Y135.538 E.06713
G1 X113.049 Y135.538
G1 X117.234 Y131.354 E.07771
G1 X117.234 Y130.784
G1 X112.48 Y135.538 E.08828
G1 X111.91 Y135.538
G1 X117.234 Y130.214 E.09886
G1 X117.234 Y129.645
G1 X111.34 Y135.538 E.10944
G1 X110.771 Y135.538
G1 X117.234 Y129.075 E.12002
G1 X117.234 Y128.505
G1 X110.201 Y135.538 E.1306
G1 X109.631 Y135.538
G1 X117.234 Y127.936 E.14118
G1 X117.234 Y127.366
G1 X109.062 Y135.538 E.15176
G1 X108.492 Y135.538
G1 X117.234 Y126.796 E.16233
G1 X117.234 Y126.227
G1 X107.922 Y135.538 E.17291
G1 X107.353 Y135.538
G1 X117.234 Y125.657 E.18349
G1 X117.234 Y125.087
G1 X106.783 Y135.538 E.19407
G1 X106.213 Y135.538
G1 X117.234 Y124.518 E.20465
G1 X117.234 Y123.948
G1 X105.644 Y135.538 E.21523
G1 X105.074 Y135.538
G1 X117.234 Y123.378 E.22581
G1 X117.234 Y122.808
G1 X104.504 Y135.538 E.23638
G1 X104.462 Y135.011
G1 X117.234 Y122.239 E.23717
G1 X117.234 Y121.669
G1 X104.462 Y134.442 E.23717
G1 X104.462 Y133.872
G1 X117.234 Y121.099 E.23717
G1 X117.234 Y120.53
G1 X104.462 Y133.302 E.23717
G1 X104.462 Y132.733
G1 X117.234 Y119.96 E.23717
G1 X117.234 Y119.39
G1 X104.462 Y132.163 E.23717
G1 X104.462 Y131.593
G1 X117.234 Y118.821 E.23717
G1 X117.234 Y118.251
G1 X104.462 Y131.024 E.23717
G1 X104.462 Y130.454
G1 X117.234 Y117.681 E.23717
G1 X117.234 Y117.112
G1 X104.462 Y129.884 E.23717
G1 X104.462 Y129.314
G1 X117.234 Y116.542 E.23717
G1 X116.745 Y116.462
G1 X104.462 Y128.745 E.22809
G1 X104.462 Y128.175
G1 X116.175 Y116.462 E.21751
G1 X115.605 Y116.462
G1 X104.462 Y127.605 E.20693
G1 X104.462 Y127.036
G1 X115.036 Y116.462 E.19635
G1 X114.466 Y116.462
G1 X104.462 Y126.466 E.18577
G1 X104.462 Y125.896
G1 X113.896 Y116.462 E.1752
G1 X113.327 Y116.462
G1 X104.462 Y125.327 E.16462
G1 X104.462 Y124.757
G1 X112.757 Y116.462 E.15404
G1 X112.187 Y116.462
G1 X104.462 Y124.187 E.14346
G1 X104.462 Y123.618
G1 X111.618 Y116.462 E.13288
G1 X111.048 Y116.462
G1 X104.462 Y123.048 E.1223
G1 X104.462 Y122.478
G1 X110.478 Y116.462 E.11172
G1 X109.909 Y116.462
G1 X104.462 Y121.909 E.10115
G1 X104.462 Y121.339
G1 X109.339 Y116.462 E.09057
G1 X108.769 Y116.462
G1 X104.462 Y120.769 E.07999
G1 X104.462 Y120.199
G1 X108.199 Y116.462 E.06941
G1 X107.63 Y116.462
G1 X104.462 Y119.63 E.05883
M73 P49 R14
G1 X104.462 Y119.06
G1 X107.06 Y116.462 E.04825
G1 X106.49 Y116.462
G1 X104.462 Y118.49 E.03767
G1 X104.462 Y117.921
G1 X105.921 Y116.462 E.0271
G1 X105.351 Y116.462
G1 X104.462 Y117.351 E.01652
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F1800
M204 S10000
G1 X105.351 Y116.462 E-.47801
G1 X105.921 Y116.462 E-.21648
G1 X105.799 Y116.583 E-.06551
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 15/88
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.64 I-.457 J1.128 P1  F30000
G1 X150.834 Y134.834 Z1.64
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.095 Z1.72 F30000
G1 X150.638 Y118.241 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X149.954 Y117.557 E.01365
G1 X149.339 Y117.557 E.00867
G1 X150.443 Y118.661 E.02202
G1 X150.443 Y119.275 E.00867
G1 X148.725 Y117.557 E.03429
G1 X148.11 Y117.557 E.00867
G1 X150.443 Y119.89 E.04655
G1 X150.443 Y120.505 E.00867
G1 X147.495 Y117.557 E.05881
G1 X146.881 Y117.557 E.00867
G1 X150.443 Y121.119 E.07108
G1 X150.443 Y121.734 E.00867
G1 X146.266 Y117.557 E.08334
G1 X145.651 Y117.557 E.00867
G1 X150.443 Y122.349 E.0956
G1 X150.443 Y122.963 E.00867
G1 X145.037 Y117.557 E.10787
G1 X144.422 Y117.557 E.00867
G1 X150.443 Y123.578 E.12013
G1 X150.443 Y124.193 E.00867
G1 X143.807 Y117.557 E.13239
G1 X143.193 Y117.557 E.00867
G1 X150.443 Y124.807 E.14465
G1 X150.443 Y125.422 E.00867
G1 X142.578 Y117.557 E.15692
G1 X141.964 Y117.557 E.00867
G1 X150.443 Y126.036 E.16918
G1 X150.443 Y126.651 E.00867
G1 X141.349 Y117.557 E.18144
G1 X140.734 Y117.557 E.00867
G1 X150.443 Y127.266 E.19371
G1 X150.443 Y127.88 E.00867
G1 X140.12 Y117.557 E.20597
G1 X139.505 Y117.557 E.00867
M73 P49 R13
G1 X150.443 Y128.495 E.21823
G1 X150.443 Y129.11 E.00867
G1 X138.89 Y117.557 E.2305
G1 X138.276 Y117.557 E.00867
G1 X150.443 Y129.724 E.24276
G1 X150.443 Y130.339 E.00867
G1 X137.661 Y117.557 E.25502
M73 P50 R13
G1 X137.047 Y117.557 E.00867
G1 X150.443 Y130.953 E.26729
G1 X150.443 Y131.568 E.00867
G1 X136.432 Y117.557 E.27955
G1 X135.817 Y117.557 E.00867
G1 X150.443 Y132.183 E.29181
G1 X150.443 Y132.797 E.00867
G1 X135.203 Y117.557 E.30407
G1 X134.588 Y117.557 E.00867
G1 X150.443 Y133.412 E.31634
G1 X150.443 Y134.027 E.00867
G1 X133.973 Y117.557 E.3286
G1 X133.359 Y117.557 E.00867
G1 X150.245 Y134.443 E.33691
G1 X149.63 Y134.443 E.00867
G1 X132.744 Y117.557 E.33691
G1 X132.129 Y117.557 E.00867
G1 X149.015 Y134.443 E.33691
G1 X148.401 Y134.443 E.00867
G1 X131.515 Y117.557 E.33691
G1 X130.9 Y117.557 E.00867
G1 X147.786 Y134.443 E.33691
G1 X147.172 Y134.443 E.00867
G1 X130.286 Y117.557 E.33691
G1 X129.671 Y117.557 E.00867
G1 X146.557 Y134.443 E.33691
G1 X145.942 Y134.443 E.00867
G1 X129.056 Y117.557 E.33691
G1 X128.442 Y117.557 E.00867
G1 X145.328 Y134.443 E.33691
G1 X144.713 Y134.443 E.00867
G1 X127.827 Y117.557 E.33691
G1 X127.212 Y117.557 E.00867
G1 X144.098 Y134.443 E.33691
G1 X143.484 Y134.443 E.00867
G1 X126.598 Y117.557 E.33691
G1 X125.983 Y117.557 E.00867
G1 X142.869 Y134.443 E.33691
G1 X142.254 Y134.443 E.00867
G1 X125.369 Y117.557 E.33691
G1 X124.754 Y117.557 E.00867
G1 X141.64 Y134.443 E.33691
G1 X141.025 Y134.443 E.00867
G1 X124.139 Y117.557 E.33691
G1 X123.525 Y117.557 E.00867
G1 X140.411 Y134.443 E.33691
G1 X139.796 Y134.443 E.00867
G1 X122.91 Y117.557 E.33691
G1 X122.295 Y117.557 E.00867
G1 X139.181 Y134.443 E.33691
G1 X138.567 Y134.443 E.00867
G1 X121.681 Y117.557 E.33691
G1 X121.066 Y117.557 E.00867
G1 X137.952 Y134.443 E.33691
G1 X137.337 Y134.443 E.00867
G1 X120.451 Y117.557 E.33691
G1 X119.837 Y117.557 E.00867
G1 X136.723 Y134.443 E.33691
G1 X136.108 Y134.443 E.00867
G1 X119.222 Y117.557 E.33691
G1 X118.608 Y117.557 E.00867
G1 X135.494 Y134.443 E.33691
G1 X134.879 Y134.443 E.00867
G1 X118.455 Y118.019 E.32769
G1 X118.455 Y118.633 E.00867
G1 X134.264 Y134.443 E.31543
G1 X133.65 Y134.443 E.00867
G1 X118.455 Y119.248 E.30317
G1 X118.455 Y119.863 E.00867
G1 X133.035 Y134.443 E.29091
G1 X132.42 Y134.443 E.00867
G1 X118.455 Y120.477 E.27864
G1 X118.455 Y121.092 E.00867
G1 X131.806 Y134.443 E.26638
G1 X131.191 Y134.443 E.00867
G1 X118.455 Y121.707 E.25412
G1 X118.455 Y122.321 E.00867
G1 X130.576 Y134.443 E.24185
G1 X129.962 Y134.443 E.00867
G1 X118.455 Y122.936 E.22959
G1 X118.455 Y123.55 E.00867
G1 X129.347 Y134.443 E.21733
G1 X128.733 Y134.443 E.00867
G1 X118.455 Y124.165 E.20506
G1 X118.455 Y124.78 E.00867
G1 X128.118 Y134.443 E.1928
G1 X127.503 Y134.443 E.00867
G1 X118.455 Y125.394 E.18054
G1 X118.455 Y126.009 E.00867
G1 X126.889 Y134.443 E.16827
G1 X126.274 Y134.443 E.00867
G1 X118.455 Y126.624 E.15601
G1 X118.455 Y127.238 E.00867
G1 X125.659 Y134.443 E.14375
G1 X125.045 Y134.443 E.00867
G1 X118.455 Y127.853 E.13149
G1 X118.455 Y128.467 E.00867
G1 X124.43 Y134.443 E.11922
G1 X123.816 Y134.443 E.00867
G1 X118.455 Y129.082 E.10696
G1 X118.455 Y129.697 E.00867
G1 X123.201 Y134.443 E.0947
G1 X122.586 Y134.443 E.00867
G1 X118.455 Y130.311 E.08243
G1 X118.455 Y130.926 E.00867
G1 X121.972 Y134.443 E.07017
G1 X121.357 Y134.443 E.00867
G1 X118.455 Y131.541 E.05791
G1 X118.455 Y132.155 E.00867
G1 X120.742 Y134.443 E.04564
G1 X120.128 Y134.443 E.00867
G1 X118.455 Y132.77 E.03338
G1 X118.455 Y133.385 E.00867
G1 X119.513 Y134.443 E.02112
G1 X118.898 Y134.443 E.00867
G1 X118.26 Y133.804 E.01274
G1 X118.03 Y117.823 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432788
G1 F16800
G1 X118.03 Y117.615 E.00282
G1 X117.615 Y117.615 E.00563
G1 X117.615 Y134.385 E.22719
G1 X118.03 Y134.385 E.00563
G1 X118.03 Y117.883 E.22356
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F16800
G1 X118.03 Y119.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/88
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.72 I-.505 J1.107 P1  F30000
G1 X150.834 Y134.834 Z1.72
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.759 Y134.638 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.954 E.01365
G1 X150.443 Y133.339 E.00867
G1 X149.339 Y134.443 E.02202
G1 X148.725 Y134.443 E.00867
G1 X150.443 Y132.725 E.03429
G1 X150.443 Y132.11 E.00867
G1 X148.11 Y134.443 E.04655
G1 X147.495 Y134.443 E.00867
G1 X150.443 Y131.495 E.05881
G1 X150.443 Y130.881 E.00867
G1 X146.881 Y134.443 E.07108
G1 X146.266 Y134.443 E.00867
G1 X150.443 Y130.266 E.08334
G1 X150.443 Y129.651 E.00867
G1 X145.651 Y134.443 E.0956
G1 X145.037 Y134.443 E.00867
G1 X150.443 Y129.037 E.10787
G1 X150.443 Y128.422 E.00867
G1 X144.422 Y134.443 E.12013
G1 X143.807 Y134.443 E.00867
G1 X150.443 Y127.807 E.13239
G1 X150.443 Y127.193 E.00867
G1 X143.193 Y134.443 E.14465
G1 X142.578 Y134.443 E.00867
G1 X150.443 Y126.578 E.15692
G1 X150.443 Y125.964 E.00867
G1 X141.964 Y134.443 E.16918
G1 X141.349 Y134.443 E.00867
G1 X150.443 Y125.349 E.18144
G1 X150.443 Y124.734 E.00867
G1 X140.734 Y134.443 E.19371
G1 X140.12 Y134.443 E.00867
G1 X150.443 Y124.12 E.20597
G1 X150.443 Y123.505 E.00867
G1 X139.505 Y134.443 E.21823
G1 X138.89 Y134.443 E.00867
G1 X150.443 Y122.89 E.2305
G1 X150.443 Y122.276 E.00867
G1 X138.276 Y134.443 E.24276
G1 X137.661 Y134.443 E.00867
G1 X150.443 Y121.661 E.25502
G1 X150.443 Y121.047 E.00867
G1 X137.047 Y134.443 E.26728
G1 X136.432 Y134.443 E.00867
G1 X150.443 Y120.432 E.27955
G1 X150.443 Y119.817 E.00867
G1 X135.817 Y134.443 E.29181
G1 X135.203 Y134.443 E.00867
G1 X150.443 Y119.203 E.30407
G1 X150.443 Y118.588 E.00867
G1 X134.588 Y134.443 E.31634
G1 X133.973 Y134.443 E.00867
G1 X150.443 Y117.973 E.3286
G1 X150.443 Y117.557 E.00587
G1 X150.245 Y117.557 E.0028
G1 X133.359 Y134.443 E.33691
G1 X132.744 Y134.443 E.00867
G1 X149.63 Y117.557 E.33691
G1 X149.015 Y117.557 E.00867
G1 X132.129 Y134.443 E.33691
G1 X131.515 Y134.443 E.00867
G1 X148.401 Y117.557 E.33691
G1 X147.786 Y117.557 E.00867
G1 X130.9 Y134.443 E.33691
G1 X130.286 Y134.443 E.00867
G1 X147.172 Y117.557 E.33691
G1 X146.557 Y117.557 E.00867
G1 X129.671 Y134.443 E.33691
G1 X129.056 Y134.443 E.00867
G1 X145.942 Y117.557 E.33691
G1 X145.328 Y117.557 E.00867
G1 X128.442 Y134.443 E.33691
G1 X127.827 Y134.443 E.00867
G1 X144.713 Y117.557 E.33691
G1 X144.098 Y117.557 E.00867
G1 X127.212 Y134.443 E.33691
M73 P51 R13
G1 X126.598 Y134.443 E.00867
G1 X143.484 Y117.557 E.33691
G1 X142.869 Y117.557 E.00867
G1 X125.983 Y134.443 E.33691
G1 X125.369 Y134.443 E.00867
G1 X142.254 Y117.557 E.33691
G1 X141.64 Y117.557 E.00867
G1 X124.754 Y134.443 E.33691
G1 X124.139 Y134.443 E.00867
G1 X141.025 Y117.557 E.33691
G1 X140.411 Y117.557 E.00867
G1 X123.525 Y134.443 E.33691
G1 X122.91 Y134.443 E.00867
G1 X139.796 Y117.557 E.33691
G1 X139.181 Y117.557 E.00867
G1 X122.295 Y134.443 E.33691
G1 X121.681 Y134.443 E.00867
G1 X138.567 Y117.557 E.33691
G1 X137.952 Y117.557 E.00867
G1 X121.066 Y134.443 E.33691
G1 X120.451 Y134.443 E.00867
G1 X137.337 Y117.557 E.33691
G1 X136.723 Y117.557 E.00867
G1 X119.837 Y134.443 E.33691
G1 X119.222 Y134.443 E.00867
G1 X136.108 Y117.557 E.33691
G1 X135.494 Y117.557 E.00867
G1 X118.608 Y134.443 E.33691
G1 X118.455 Y134.443 E.00216
G1 X118.455 Y133.981 E.00651
G1 X134.879 Y117.557 E.32769
G1 X134.264 Y117.557 E.00867
G1 X118.455 Y133.367 E.31543
G1 X118.455 Y132.752 E.00867
G1 X133.65 Y117.557 E.30317
G1 X133.035 Y117.557 E.00867
G1 X118.455 Y132.137 E.29091
G1 X118.455 Y131.523 E.00867
G1 X132.42 Y117.557 E.27864
G1 X131.806 Y117.557 E.00867
G1 X118.455 Y130.908 E.26638
G1 X118.455 Y130.293 E.00867
G1 X131.191 Y117.557 E.25412
G1 X130.576 Y117.557 E.00867
G1 X118.455 Y129.679 E.24185
G1 X118.455 Y129.064 E.00867
G1 X129.962 Y117.557 E.22959
G1 X129.347 Y117.557 E.00867
G1 X118.455 Y128.45 E.21733
G1 X118.455 Y127.835 E.00867
G1 X128.733 Y117.557 E.20506
G1 X128.118 Y117.557 E.00867
G1 X118.455 Y127.22 E.1928
G1 X118.455 Y126.606 E.00867
G1 X127.503 Y117.557 E.18054
G1 X126.889 Y117.557 E.00867
G1 X118.455 Y125.991 E.16827
G1 X118.455 Y125.376 E.00867
G1 X126.274 Y117.557 E.15601
G1 X125.659 Y117.557 E.00867
G1 X118.455 Y124.762 E.14375
G1 X118.455 Y124.147 E.00867
G1 X125.045 Y117.557 E.13149
G1 X124.43 Y117.557 E.00867
G1 X118.455 Y123.533 E.11922
G1 X118.455 Y122.918 E.00867
G1 X123.816 Y117.557 E.10696
G1 X123.201 Y117.557 E.00867
G1 X118.455 Y122.303 E.0947
G1 X118.455 Y121.689 E.00867
G1 X122.586 Y117.557 E.08243
G1 X121.972 Y117.557 E.00867
G1 X118.455 Y121.074 E.07017
G1 X118.455 Y120.459 E.00867
G1 X121.357 Y117.557 E.05791
G1 X120.742 Y117.557 E.00867
G1 X118.455 Y119.845 E.04564
G1 X118.455 Y119.23 E.00867
G1 X120.128 Y117.557 E.03338
G1 X119.513 Y117.557 E.00867
G1 X118.455 Y118.615 E.02112
G1 X118.455 Y118.001 E.00867
G1 X119.093 Y117.362 E.01274
G1 X118.03 Y117.823 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432788
G1 F16800
G1 X118.03 Y117.615 E.00282
G1 X117.615 Y117.615 E.00563
G1 X117.615 Y134.385 E.22719
G1 X118.03 Y134.385 E.00563
G1 X118.03 Y117.883 E.22356
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F16800
G1 X118.03 Y119.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/88
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.8 I-.505 J1.107 P1  F30000
G1 X150.834 Y134.834 Z1.8
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.095 Z1.88 F30000
G1 X150.638 Y118.248 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X149.947 Y117.557 E.01379
G1 X149.327 Y117.557 E.00874
G1 X150.443 Y118.673 E.02226
G1 X150.443 Y119.292 E.00874
G1 X148.708 Y117.557 E.03462
G1 X148.088 Y117.557 E.00874
G1 X150.443 Y119.912 E.04698
G1 X150.443 Y120.531 E.00874
G1 X147.469 Y117.557 E.05934
G1 X146.849 Y117.557 E.00874
G1 X150.443 Y121.151 E.0717
G1 X150.443 Y121.77 E.00874
G1 X146.23 Y117.557 E.08406
G1 X145.611 Y117.557 E.00874
G1 X150.443 Y122.389 E.09642
G1 X150.443 Y123.009 E.00874
G1 X144.991 Y117.557 E.10877
G1 X144.372 Y117.557 E.00874
G1 X150.443 Y123.628 E.12113
G1 X150.443 Y124.248 E.00874
G1 X143.752 Y117.557 E.13349
G1 X143.133 Y117.557 E.00874
G1 X150.443 Y124.867 E.14585
G1 X150.443 Y125.487 E.00874
G1 X142.513 Y117.557 E.15821
G1 X141.894 Y117.557 E.00874
G1 X150.443 Y126.106 E.17057
G1 X150.443 Y126.725 E.00874
G1 X141.275 Y117.557 E.18293
G1 X140.655 Y117.557 E.00874
G1 X150.443 Y127.345 E.19529
G1 X150.443 Y127.964 E.00874
G1 X140.036 Y117.557 E.20764
G1 X139.416 Y117.557 E.00874
G1 X150.443 Y128.584 E.22
G1 X150.443 Y129.203 E.00874
G1 X138.797 Y117.557 E.23236
G1 X138.177 Y117.557 E.00874
G1 X150.443 Y129.823 E.24472
G1 X150.443 Y130.442 E.00874
G1 X137.558 Y117.557 E.25708
G1 X136.939 Y117.557 E.00874
G1 X150.443 Y131.061 E.26944
G1 X150.443 Y131.681 E.00874
G1 X136.319 Y117.557 E.2818
G1 X135.7 Y117.557 E.00874
G1 X150.443 Y132.3 E.29416
G1 X150.443 Y132.92 E.00874
G1 X135.08 Y117.557 E.30651
G1 X134.461 Y117.557 E.00874
G1 X150.443 Y133.539 E.31887
G1 X150.443 Y134.158 E.00874
G1 X133.842 Y117.557 E.33123
G1 X133.222 Y117.557 E.00874
G1 X150.108 Y134.443 E.33691
G1 X149.489 Y134.443 E.00874
G1 X132.603 Y117.557 E.33691
G1 X131.983 Y117.557 E.00874
G1 X148.869 Y134.443 E.33691
G1 X148.25 Y134.443 E.00874
G1 X131.364 Y117.557 E.33691
G1 X130.744 Y117.557 E.00874
G1 X147.63 Y134.443 E.33691
G1 X147.011 Y134.443 E.00874
G1 X130.455 Y117.887 E.33033
G1 X130.455 Y118.506 E.00874
G1 X146.392 Y134.443 E.31797
G1 X145.772 Y134.443 E.00874
G1 X130.455 Y119.126 E.30561
G1 X130.455 Y119.745 E.00874
G1 X145.153 Y134.443 E.29325
G1 X144.533 Y134.443 E.00874
G1 X130.455 Y120.364 E.28089
G1 X130.455 Y120.984 E.00874
G1 X143.914 Y134.443 E.26853
G1 X143.294 Y134.443 E.00874
G1 X130.455 Y121.603 E.25618
G1 X130.455 Y122.223 E.00874
G1 X142.675 Y134.443 E.24382
G1 X142.056 Y134.443 E.00874
G1 X130.455 Y122.842 E.23146
G1 X130.455 Y123.462 E.00874
G1 X141.436 Y134.443 E.2191
G1 X140.817 Y134.443 E.00874
G1 X130.455 Y124.081 E.20674
G1 X130.455 Y124.7 E.00874
G1 X140.197 Y134.443 E.19438
G1 X139.578 Y134.443 E.00874
G1 X130.455 Y125.32 E.18202
G1 X130.455 Y125.939 E.00874
G1 X138.958 Y134.443 E.16966
G1 X138.339 Y134.443 E.00874
G1 X130.455 Y126.559 E.15731
G1 X130.455 Y127.178 E.00874
G1 X137.72 Y134.443 E.14495
G1 X137.1 Y134.443 E.00874
G1 X130.455 Y127.798 E.13259
G1 X130.455 Y128.417 E.00874
G1 X136.481 Y134.443 E.12023
G1 X135.861 Y134.443 E.00874
G1 X130.455 Y129.036 E.10787
G1 X130.455 Y129.656 E.00874
G1 X135.242 Y134.443 E.09551
G1 X134.622 Y134.443 E.00874
G1 X130.455 Y130.275 E.08315
G1 X130.455 Y130.895 E.00874
G1 X134.003 Y134.443 E.07079
G1 X133.384 Y134.443 E.00874
G1 X130.455 Y131.514 E.05844
G1 X130.455 Y132.134 E.00874
G1 X132.764 Y134.443 E.04608
G1 X132.145 Y134.443 E.00874
G1 X130.455 Y132.753 E.03372
G1 X130.455 Y133.372 E.00874
G1 X131.525 Y134.443 E.02136
G1 X130.906 Y134.443 E.00874
G1 X130.26 Y133.797 E.01289
G1 X128.965 Y134.638 F30000
G1 F20793.295
G1 X128.321 Y133.994 E.01284
G1 X128.321 Y133.376 E.00872
G1 X129.02 Y134.075 E.01394
G1 X129.02 Y133.456 E.00872
G1 X128.321 Y132.758 E.01394
G1 X128.321 Y132.14 E.00872
G1 X129.02 Y132.838 E.01394
G1 X129.02 Y132.22 E.00872
G1 X128.321 Y131.522 E.01394
G1 X128.321 Y130.904 E.00872
G1 X129.02 Y131.602 E.01394
G1 X129.02 Y130.984 E.00872
G1 X128.321 Y130.286 E.01394
G1 X128.321 Y129.668 E.00872
G1 X129.02 Y130.366 E.01394
G1 X129.02 Y129.748 E.00872
M73 P52 R13
G1 X128.321 Y129.05 E.01394
G1 X128.321 Y128.432 E.00872
G1 X129.02 Y129.13 E.01394
G1 X129.02 Y128.512 E.00872
G1 X128.321 Y127.814 E.01394
G1 X128.321 Y127.196 E.00872
G1 X129.02 Y127.894 E.01394
G1 X129.02 Y127.276 E.00872
G1 X128.321 Y126.578 E.01394
G1 X128.321 Y125.96 E.00872
G1 X129.02 Y126.658 E.01394
G1 X129.02 Y126.04 E.00872
G1 X128.321 Y125.342 E.01394
G1 X128.321 Y124.724 E.00872
G1 X129.02 Y125.422 E.01394
G1 X129.02 Y124.804 E.00872
G1 X128.321 Y124.106 E.01394
G1 X128.321 Y123.488 E.00872
G1 X129.02 Y124.186 E.01394
G1 X129.02 Y123.568 E.00872
G1 X128.321 Y122.87 E.01394
G1 X128.321 Y122.252 E.00872
G1 X129.02 Y122.95 E.01394
G1 X129.02 Y122.332 E.00872
G1 X128.321 Y121.634 E.01394
G1 X128.321 Y121.016 E.00872
G1 X129.02 Y121.714 E.01394
G1 X129.02 Y121.096 E.00872
G1 X128.321 Y120.398 E.01394
G1 X128.321 Y119.779 E.00872
G1 X129.02 Y120.478 E.01394
G1 X129.02 Y119.86 E.00872
G1 X128.321 Y119.161 E.01394
G1 X128.321 Y118.543 E.00872
G1 X129.02 Y119.242 E.01394
G1 X129.02 Y118.624 E.00872
G1 X128.321 Y117.925 E.01394
G1 X128.321 Y117.557 E.0052
G1 X128.571 Y117.557 E.00352
G1 X129.214 Y118.201 E.01284
G1 X129.988 Y117.908 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.518428
G1 F16800
G1 X129.988 Y117.658 E.00409
G1 X129.487 Y117.658 E.00819
G1 X129.487 Y134.342 E.2726
G1 X129.988 Y134.342 E.00819
G1 X129.988 Y117.968 E.26753
G1 X128.085 Y118.224 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421768
G1 F21000
G1 X127.402 Y117.542 E.01272
G1 X126.83 Y117.542 E.00755
G1 X127.903 Y118.615 E.02001
G1 X127.903 Y119.187 E.00755
G1 X126.258 Y117.542 E.03069
G1 X125.686 Y117.542 E.00755
G1 X127.903 Y119.759 E.04136
G1 X127.903 Y120.332 E.00755
G1 X125.114 Y117.542 E.05203
G1 X124.541 Y117.542 E.00755
G1 X127.903 Y120.904 E.0627
G1 X127.903 Y121.476 E.00755
G1 X123.969 Y117.542 E.07337
G1 X123.397 Y117.542 E.00755
G1 X127.903 Y122.048 E.08405
G1 X127.903 Y122.62 E.00755
G1 X122.825 Y117.542 E.09472
G1 X122.253 Y117.542 E.00755
G1 X127.903 Y123.193 E.10539
G1 X127.903 Y123.765 E.00755
G1 X121.68 Y117.542 E.11606
G1 X121.108 Y117.542 E.00755
G1 X127.903 Y124.337 E.12673
G1 X127.903 Y124.909 E.00755
G1 X120.536 Y117.542 E.1374
G1 X119.964 Y117.542 E.00755
G1 X127.903 Y125.481 E.14807
G1 X127.903 Y126.054 E.00755
G1 X119.392 Y117.542 E.15875
G1 X118.819 Y117.542 E.00755
G1 X127.903 Y126.626 E.16942
G1 X127.903 Y127.198 E.00755
G1 X118.247 Y117.542 E.18009
G1 X117.675 Y117.542 E.00755
G1 X127.903 Y127.77 E.19076
G1 X127.903 Y128.342 E.00755
G1 X117.542 Y117.981 E.19325
G1 X117.542 Y118.553 E.00755
G1 X127.903 Y128.915 E.19325
G1 X127.903 Y129.487 E.00755
G1 X117.542 Y119.125 E.19325
G1 X117.542 Y119.698 E.00755
G1 X127.903 Y130.059 E.19325
G1 X127.903 Y130.631 E.00755
G1 X117.542 Y120.27 E.19325
G1 X117.542 Y120.842 E.00755
G1 X127.903 Y131.203 E.19325
G1 X127.903 Y131.775 E.00755
G1 X117.542 Y121.414 E.19325
G1 X117.542 Y121.986 E.00755
G1 X127.903 Y132.348 E.19325
G1 X127.903 Y132.92 E.00755
G1 X117.542 Y122.558 E.19325
G1 X117.542 Y123.131 E.00755
G1 X127.903 Y133.492 E.19325
G1 X127.903 Y134.064 E.00755
G1 X117.542 Y123.703 E.19325
G1 X117.542 Y124.275 E.00755
G1 X127.725 Y134.458 E.18992
G1 X127.153 Y134.458 E.00755
G1 X117.542 Y124.847 E.17925
G1 X117.542 Y125.419 E.00755
G1 X126.581 Y134.458 E.16858
G1 X126.008 Y134.458 E.00755
G1 X117.542 Y125.992 E.1579
G1 X117.542 Y126.564 E.00755
G1 X125.436 Y134.458 E.14723
G1 X124.864 Y134.458 E.00755
G1 X117.542 Y127.136 E.13656
G1 X117.542 Y127.708 E.00755
G1 X124.292 Y134.458 E.12589
G1 X123.72 Y134.458 E.00755
G1 X117.542 Y128.28 E.11522
G1 X117.542 Y128.853 E.00755
G1 X123.147 Y134.458 E.10455
G1 X122.575 Y134.458 E.00755
G1 X117.542 Y129.425 E.09387
G1 X117.542 Y129.997 E.00755
G1 X122.003 Y134.458 E.0832
G1 X121.431 Y134.458 E.00755
G1 X117.542 Y130.569 E.07253
G1 X117.542 Y131.141 E.00755
G1 X120.859 Y134.458 E.06186
G1 X120.286 Y134.458 E.00755
G1 X117.542 Y131.714 E.05119
G1 X117.542 Y132.286 E.00755
G1 X119.714 Y134.458 E.04052
G1 X119.142 Y134.458 E.00755
G1 X117.542 Y132.858 E.02984
G1 X117.542 Y133.43 E.00755
G1 X118.57 Y134.458 E.01917
G1 X117.998 Y134.458 E.00755
G1 X117.361 Y133.821 E.01188
; CHANGE_LAYER
; Z_HEIGHT: 1.56
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X117.998 Y134.458 E-.34237
G1 X118.57 Y134.458 E-.21743
G1 X118.197 Y134.086 E-.2002
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/88
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.88 I-.028 J1.217 P1  F30000
G1 X150.834 Y134.834 Z1.88
G1 Z1.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z1.96 F30000
G1 Z1.56
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.611 E.00874
G1 X145.611 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10877
G1 X150.443 Y128.372 E.00874
G1 X144.372 Y134.443 E.12113
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.13349
G1 X150.443 Y127.133 E.00874
G1 X143.133 Y134.443 E.14585
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15821
G1 X150.443 Y125.894 E.00874
G1 X141.894 Y134.443 E.17057
G1 X141.275 Y134.443 E.00874
G1 X150.443 Y125.275 E.18293
G1 X150.443 Y124.655 E.00874
G1 X140.655 Y134.443 E.19528
G1 X140.036 Y134.443 E.00874
G1 X150.443 Y124.036 E.20764
G1 X150.443 Y123.416 E.00874
G1 X139.416 Y134.443 E.22
G1 X138.797 Y134.443 E.00874
G1 X150.443 Y122.797 E.23236
G1 X150.443 Y122.177 E.00874
G1 X138.177 Y134.443 E.24472
G1 X137.558 Y134.443 E.00874
G1 X150.443 Y121.558 E.25708
G1 X150.443 Y120.939 E.00874
G1 X136.939 Y134.443 E.26944
G1 X136.319 Y134.443 E.00874
G1 X150.443 Y120.319 E.2818
G1 X150.443 Y119.7 E.00874
G1 X135.7 Y134.443 E.29415
G1 X135.08 Y134.443 E.00874
G1 X150.443 Y119.08 E.30651
G1 X150.443 Y118.461 E.00874
G1 X134.461 Y134.443 E.31887
G1 X133.842 Y134.443 E.00874
G1 X150.443 Y117.842 E.33123
G1 X150.443 Y117.557 E.00401
G1 X150.108 Y117.557 E.00472
G1 X133.222 Y134.443 E.33691
G1 X132.603 Y134.443 E.00874
G1 X149.489 Y117.557 E.33691
G1 X148.869 Y117.557 E.00874
G1 X131.983 Y134.443 E.33691
G1 X131.364 Y134.443 E.00874
G1 X148.25 Y117.557 E.33691
G1 X147.63 Y117.557 E.00874
G1 X130.744 Y134.443 E.33691
G1 X130.455 Y134.443 E.00409
G1 X130.455 Y134.113 E.00465
G1 X147.011 Y117.557 E.33033
G1 X146.392 Y117.557 E.00874
G1 X130.455 Y133.494 E.31797
G1 X130.455 Y132.874 E.00874
G1 X145.772 Y117.557 E.30561
G1 X145.153 Y117.557 E.00874
G1 X130.455 Y132.255 E.29325
G1 X130.455 Y131.635 E.00874
G1 X144.533 Y117.557 E.28089
G1 X143.914 Y117.557 E.00874
G1 X130.455 Y131.016 E.26853
G1 X130.455 Y130.397 E.00874
G1 X143.294 Y117.557 E.25618
G1 X142.675 Y117.557 E.00874
G1 X130.455 Y129.777 E.24382
G1 X130.455 Y129.158 E.00874
G1 X142.056 Y117.557 E.23146
G1 X141.436 Y117.557 E.00874
G1 X130.455 Y128.538 E.2191
G1 X130.455 Y127.919 E.00874
G1 X140.817 Y117.557 E.20674
G1 X140.197 Y117.557 E.00874
G1 X130.455 Y127.3 E.19438
G1 X130.455 Y126.68 E.00874
G1 X139.578 Y117.557 E.18202
G1 X138.958 Y117.557 E.00874
G1 X130.455 Y126.061 E.16966
G1 X130.455 Y125.441 E.00874
G1 X138.339 Y117.557 E.15731
G1 X137.72 Y117.557 E.00874
G1 X130.455 Y124.822 E.14495
G1 X130.455 Y124.202 E.00874
G1 X137.1 Y117.557 E.13259
G1 X136.481 Y117.557 E.00874
G1 X130.455 Y123.583 E.12023
G1 X130.455 Y122.964 E.00874
G1 X135.861 Y117.557 E.10787
G1 X135.242 Y117.557 E.00874
G1 X130.455 Y122.344 E.09551
G1 X130.455 Y121.725 E.00874
G1 X134.622 Y117.557 E.08315
G1 X134.003 Y117.557 E.00874
G1 X130.455 Y121.105 E.07079
G1 X130.455 Y120.486 E.00874
G1 X133.384 Y117.557 E.05844
G1 X132.764 Y117.557 E.00874
G1 X130.455 Y119.866 E.04608
G1 X130.455 Y119.247 E.00874
G1 X132.145 Y117.557 E.03372
G1 X131.525 Y117.557 E.00874
G1 X130.455 Y118.628 E.02136
G1 X130.455 Y118.008 E.00874
G1 X131.101 Y117.362 E.01289
G1 X117.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427438
G1 F21000
G1 X118.009 Y117.542 E.01227
G1 X118.59 Y117.542 E.00776
G1 X117.542 Y118.59 E.01981
G1 X117.542 Y119.17 E.00776
G1 X119.17 Y117.542 E.03079
G1 X119.75 Y117.542 E.00776
G1 X117.542 Y119.75 E.04176
G1 X117.542 Y120.33 E.00776
G1 X120.33 Y117.542 E.05273
G1 X120.911 Y117.542 E.00776
G1 X117.542 Y120.911 E.0637
G1 X117.542 Y121.491 E.00776
G1 X121.491 Y117.542 E.07468
G1 X122.071 Y117.542 E.00776
G1 X117.542 Y122.071 E.08565
G1 X117.542 Y122.651 E.00776
G1 X122.651 Y117.542 E.09662
G1 X123.231 Y117.542 E.00776
G1 X117.542 Y123.231 E.1076
G1 X117.542 Y123.812 E.00776
G1 X123.812 Y117.542 E.11857
G1 X124.392 Y117.542 E.00776
G1 X117.542 Y124.392 E.12954
G1 X117.542 Y124.972 E.00776
G1 X124.972 Y117.542 E.14052
G1 X125.552 Y117.542 E.00776
G1 X117.542 Y125.552 E.15149
G1 X117.542 Y126.132 E.00776
G1 X126.132 Y117.542 E.16246
G1 X126.713 Y117.542 E.00776
G1 X117.542 Y126.713 E.17343
G1 X117.542 Y127.293 E.00776
G1 X127.293 Y117.542 E.18441
G1 X127.873 Y117.542 E.00776
G1 X117.542 Y127.873 E.19538
G1 X117.542 Y128.453 E.00776
G1 X128.453 Y117.542 E.20635
G1 X129.033 Y117.542 E.00776
G1 X117.542 Y129.033 E.21732
G1 X117.542 Y129.614 E.00776
G1 X129.614 Y117.542 E.2283
G1 X130.037 Y117.542 E.00566
G1 X130.037 Y117.699 E.0021
G1 X117.542 Y130.194 E.2363
G1 X117.542 Y130.774 E.00776
G1 X130.037 Y118.279 E.2363
G1 X130.037 Y118.859 E.00776
G1 X117.542 Y131.354 E.2363
G1 X117.542 Y131.935 E.00776
G1 X130.037 Y119.44 E.2363
G1 X130.037 Y120.02 E.00776
G1 X117.542 Y132.515 E.2363
G1 X117.542 Y133.095 E.00776
G1 X130.037 Y120.6 E.2363
G1 X130.037 Y121.18 E.00776
G1 X117.542 Y133.675 E.2363
G1 X117.542 Y134.255 E.00776
G1 X130.037 Y121.761 E.2363
M73 P53 R13
G1 X130.037 Y122.341 E.00776
G1 X117.92 Y134.458 E.22916
G1 X118.5 Y134.458 E.00776
G1 X130.037 Y122.921 E.21819
G1 X130.037 Y123.501 E.00776
G1 X119.08 Y134.458 E.20721
G1 X119.66 Y134.458 E.00776
G1 X130.037 Y124.081 E.19624
G1 X130.037 Y124.662 E.00776
G1 X120.24 Y134.458 E.18527
G1 X120.821 Y134.458 E.00776
G1 X130.037 Y125.242 E.1743
G1 X130.037 Y125.822 E.00776
G1 X121.401 Y134.458 E.16332
G1 X121.981 Y134.458 E.00776
G1 X130.037 Y126.402 E.15235
G1 X130.037 Y126.982 E.00776
G1 X122.561 Y134.458 E.14138
G1 X123.141 Y134.458 E.00776
G1 X130.037 Y127.563 E.1304
G1 X130.037 Y128.143 E.00776
G1 X123.722 Y134.458 E.11943
G1 X124.302 Y134.458 E.00776
G1 X130.037 Y128.723 E.10846
G1 X130.037 Y129.303 E.00776
G1 X124.882 Y134.458 E.09749
G1 X125.462 Y134.458 E.00776
G1 X130.037 Y129.883 E.08651
G1 X130.037 Y130.464 E.00776
G1 X126.043 Y134.458 E.07554
G1 X126.623 Y134.458 E.00776
G1 X130.037 Y131.044 E.06457
G1 X130.037 Y131.624 E.00776
G1 X127.203 Y134.458 E.05359
G1 X127.783 Y134.458 E.00776
G1 X130.037 Y132.204 E.04262
G1 X130.037 Y132.785 E.00776
G1 X128.363 Y134.458 E.03165
G1 X128.944 Y134.458 E.00776
G1 X130.037 Y133.365 E.02068
G1 X130.037 Y133.945 E.00776
G1 X129.343 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X130.037 Y133.945 E-.37312
G1 X130.037 Y133.365 E-.22048
G1 X129.727 Y133.674 E-.1664
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/88
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.96 I-.067 J1.215 P1  F30000
G1 X150.834 Y134.834 Z1.96
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.095 Z2.04 F30000
G1 X150.638 Y118.248 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X149.947 Y117.557 E.01379
G1 X149.327 Y117.557 E.00874
G1 X150.443 Y118.673 E.02226
G1 X150.443 Y119.292 E.00874
G1 X148.708 Y117.557 E.03462
G1 X148.088 Y117.557 E.00874
G1 X150.443 Y119.912 E.04698
G1 X150.443 Y120.531 E.00874
G1 X147.469 Y117.557 E.05934
G1 X146.849 Y117.557 E.00874
G1 X150.443 Y121.151 E.0717
G1 X150.443 Y121.77 E.00874
G1 X146.23 Y117.557 E.08406
G1 X145.611 Y117.557 E.00874
G1 X150.443 Y122.389 E.09642
G1 X150.443 Y123.009 E.00874
G1 X144.991 Y117.557 E.10877
G1 X144.372 Y117.557 E.00874
G1 X150.443 Y123.628 E.12113
G1 X150.443 Y124.248 E.00874
G1 X143.752 Y117.557 E.13349
G1 X143.133 Y117.557 E.00874
G1 X150.443 Y124.867 E.14585
G1 X150.443 Y125.487 E.00874
G1 X142.513 Y117.557 E.15821
G1 X141.894 Y117.557 E.00874
G1 X150.443 Y126.106 E.17057
G1 X150.443 Y126.725 E.00874
G1 X141.275 Y117.557 E.18293
G1 X140.655 Y117.557 E.00874
G1 X150.443 Y127.345 E.19529
G1 X150.443 Y127.964 E.00874
G1 X140.036 Y117.557 E.20764
G1 X139.416 Y117.557 E.00874
G1 X150.443 Y128.584 E.22
G1 X150.443 Y129.203 E.00874
G1 X138.797 Y117.557 E.23236
G1 X138.177 Y117.557 E.00874
G1 X150.443 Y129.823 E.24472
G1 X150.443 Y130.442 E.00874
G1 X137.558 Y117.557 E.25708
M73 P53 R12
G1 X136.939 Y117.557 E.00874
G1 X150.443 Y131.061 E.26944
G1 X150.443 Y131.681 E.00874
G1 X136.319 Y117.557 E.2818
G1 X135.7 Y117.557 E.00874
G1 X150.443 Y132.3 E.29416
G1 X150.443 Y132.92 E.00874
G1 X135.08 Y117.557 E.30651
G1 X134.461 Y117.557 E.00874
G1 X150.443 Y133.539 E.31887
G1 X150.443 Y134.158 E.00874
G1 X133.842 Y117.557 E.33123
G1 X133.222 Y117.557 E.00874
G1 X150.108 Y134.443 E.33691
G1 X149.489 Y134.443 E.00874
G1 X132.603 Y117.557 E.33691
G1 X131.983 Y117.557 E.00874
G1 X148.869 Y134.443 E.33691
G1 X148.25 Y134.443 E.00874
G1 X131.364 Y117.557 E.33691
G1 X130.744 Y117.557 E.00874
G1 X147.63 Y134.443 E.33691
G1 X147.011 Y134.443 E.00874
G1 X130.455 Y117.887 E.33033
G1 X130.455 Y118.506 E.00874
G1 X146.392 Y134.443 E.31797
G1 X145.772 Y134.443 E.00874
G1 X130.455 Y119.126 E.30561
G1 X130.455 Y119.745 E.00874
G1 X145.153 Y134.443 E.29325
G1 X144.533 Y134.443 E.00874
G1 X130.455 Y120.364 E.28089
G1 X130.455 Y120.984 E.00874
G1 X143.914 Y134.443 E.26853
G1 X143.294 Y134.443 E.00874
G1 X130.455 Y121.603 E.25618
G1 X130.455 Y122.223 E.00874
G1 X142.675 Y134.443 E.24382
G1 X142.056 Y134.443 E.00874
G1 X130.455 Y122.842 E.23146
G1 X130.455 Y123.462 E.00874
G1 X141.436 Y134.443 E.2191
G1 X140.817 Y134.443 E.00874
G1 X130.455 Y124.081 E.20674
G1 X130.455 Y124.7 E.00874
G1 X140.197 Y134.443 E.19438
G1 X139.578 Y134.443 E.00874
G1 X130.455 Y125.32 E.18202
G1 X130.455 Y125.939 E.00874
G1 X138.958 Y134.443 E.16966
G1 X138.339 Y134.443 E.00874
G1 X130.455 Y126.559 E.15731
G1 X130.455 Y127.178 E.00874
G1 X137.72 Y134.443 E.14495
G1 X137.1 Y134.443 E.00874
G1 X130.455 Y127.798 E.13259
G1 X130.455 Y128.417 E.00874
G1 X136.481 Y134.443 E.12023
G1 X135.861 Y134.443 E.00874
G1 X130.455 Y129.036 E.10787
G1 X130.455 Y129.656 E.00874
G1 X135.242 Y134.443 E.09551
G1 X134.622 Y134.443 E.00874
G1 X130.455 Y130.275 E.08315
G1 X130.455 Y130.895 E.00874
G1 X134.003 Y134.443 E.07079
G1 X133.384 Y134.443 E.00874
G1 X130.455 Y131.514 E.05844
G1 X130.455 Y132.134 E.00874
G1 X132.764 Y134.443 E.04608
G1 X132.145 Y134.443 E.00874
G1 X130.455 Y132.753 E.03372
G1 X130.455 Y133.372 E.00874
G1 X131.525 Y134.443 E.02136
G1 X130.906 Y134.443 E.00874
G1 X130.26 Y133.797 E.01289
G1 X118.191 Y134.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427438
G1 F21000
G1 X117.542 Y133.991 E.01227
G1 X117.542 Y133.41 E.00776
G1 X118.59 Y134.458 E.01981
G1 X119.17 Y134.458 E.00776
G1 X117.542 Y132.83 E.03079
G1 X117.542 Y132.25 E.00776
G1 X119.75 Y134.458 E.04176
G1 X120.33 Y134.458 E.00776
G1 X117.542 Y131.67 E.05273
G1 X117.542 Y131.089 E.00776
G1 X120.911 Y134.458 E.0637
G1 X121.491 Y134.458 E.00776
G1 X117.542 Y130.509 E.07468
G1 X117.542 Y129.929 E.00776
G1 X122.071 Y134.458 E.08565
G1 X122.651 Y134.458 E.00776
G1 X117.542 Y129.349 E.09662
G1 X117.542 Y128.769 E.00776
G1 X123.231 Y134.458 E.1076
G1 X123.812 Y134.458 E.00776
G1 X117.542 Y128.188 E.11857
G1 X117.542 Y127.608 E.00776
G1 X124.392 Y134.458 E.12954
G1 X124.972 Y134.458 E.00776
G1 X117.542 Y127.028 E.14051
G1 X117.542 Y126.448 E.00776
G1 X125.552 Y134.458 E.15149
G1 X126.132 Y134.458 E.00776
G1 X117.542 Y125.868 E.16246
G1 X117.542 Y125.287 E.00776
G1 X126.713 Y134.458 E.17343
G1 X127.293 Y134.458 E.00776
G1 X117.542 Y124.707 E.18441
G1 X117.542 Y124.127 E.00776
G1 X127.873 Y134.458 E.19538
G1 X128.453 Y134.458 E.00776
G1 X117.542 Y123.547 E.20635
G1 X117.542 Y122.967 E.00776
G1 X129.033 Y134.458 E.21732
G1 X129.614 Y134.458 E.00776
G1 X117.542 Y122.386 E.2283
G1 X117.542 Y121.806 E.00776
G1 X130.037 Y134.301 E.2363
G1 X130.037 Y133.721 E.00776
G1 X117.542 Y121.226 E.2363
G1 X117.542 Y120.646 E.00776
G1 X130.037 Y133.14 E.2363
G1 X130.037 Y132.56 E.00776
G1 X117.542 Y120.065 E.2363
G1 X117.542 Y119.485 E.00776
G1 X130.037 Y131.98 E.2363
G1 X130.037 Y131.4 E.00776
G1 X117.542 Y118.905 E.2363
G1 X117.542 Y118.325 E.00776
G1 X130.037 Y130.82 E.2363
G1 X130.037 Y130.239 E.00776
G1 X117.542 Y117.745 E.2363
G1 X117.542 Y117.542 E.00271
G1 X117.92 Y117.542 E.00505
G1 X130.037 Y129.659 E.22916
G1 X130.037 Y129.079 E.00776
G1 X118.5 Y117.542 E.21819
G1 X119.08 Y117.542 E.00776
G1 X130.037 Y128.499 E.20721
G1 X130.037 Y127.919 E.00776
G1 X119.66 Y117.542 E.19624
G1 X120.24 Y117.542 E.00776
G1 X130.037 Y127.338 E.18527
G1 X130.037 Y126.758 E.00776
G1 X120.821 Y117.542 E.1743
G1 X121.401 Y117.542 E.00776
G1 X130.037 Y126.178 E.16332
G1 X130.037 Y125.598 E.00776
G1 X121.981 Y117.542 E.15235
G1 X122.561 Y117.542 E.00776
G1 X130.037 Y125.018 E.14138
G1 X130.037 Y124.437 E.00776
G1 X123.141 Y117.542 E.1304
G1 X123.722 Y117.542 E.00776
G1 X130.037 Y123.857 E.11943
G1 X130.037 Y123.277 E.00776
G1 X124.302 Y117.542 E.10846
G1 X124.882 Y117.542 E.00776
G1 X130.037 Y122.697 E.09749
G1 X130.037 Y122.117 E.00776
G1 X125.462 Y117.542 E.08651
G1 X126.043 Y117.542 E.00776
G1 X130.037 Y121.536 E.07554
G1 X130.037 Y120.956 E.00776
G1 X126.623 Y117.542 E.06457
G1 X127.203 Y117.542 E.00776
G1 X130.037 Y120.376 E.05359
G1 X130.037 Y119.796 E.00776
G1 X127.783 Y117.542 E.04262
G1 X128.363 Y117.542 E.00776
G1 X130.037 Y119.215 E.03165
G1 X130.037 Y118.635 E.00776
G1 X128.944 Y117.542 E.02068
G1 X129.524 Y117.542 E.00776
G1 X130.218 Y118.236 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 1.72
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X129.524 Y117.542 E-.37312
G1 X128.944 Y117.542 E-.22048
G1 X129.253 Y117.852 E-.1664
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/88
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G17
M73 P54 R12
G3 Z2.04 I-.753 J.956 P1  F30000
G1 X150.834 Y134.834 Z2.04
G1 Z1.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z2.12 F30000
G1 Z1.72
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.611 E.00874
G1 X145.611 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10877
G1 X150.443 Y128.372 E.00874
G1 X144.372 Y134.443 E.12113
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.13349
G1 X150.443 Y127.133 E.00874
G1 X143.133 Y134.443 E.14585
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15821
G1 X150.443 Y125.894 E.00874
G1 X141.894 Y134.443 E.17057
G1 X141.275 Y134.443 E.00874
G1 X150.443 Y125.275 E.18293
G1 X150.443 Y124.655 E.00874
G1 X140.655 Y134.443 E.19528
G1 X140.036 Y134.443 E.00874
G1 X150.443 Y124.036 E.20764
G1 X150.443 Y123.416 E.00874
G1 X139.416 Y134.443 E.22
G1 X138.797 Y134.443 E.00874
G1 X150.443 Y122.797 E.23236
G1 X150.443 Y122.177 E.00874
G1 X138.177 Y134.443 E.24472
G1 X137.558 Y134.443 E.00874
G1 X150.443 Y121.558 E.25708
G1 X150.443 Y120.939 E.00874
G1 X136.939 Y134.443 E.26944
G1 X136.319 Y134.443 E.00874
G1 X150.443 Y120.319 E.2818
G1 X150.443 Y119.7 E.00874
G1 X135.7 Y134.443 E.29415
G1 X135.08 Y134.443 E.00874
G1 X150.443 Y119.08 E.30651
G1 X150.443 Y118.461 E.00874
G1 X134.461 Y134.443 E.31887
G1 X133.842 Y134.443 E.00874
G1 X150.443 Y117.842 E.33123
G1 X150.443 Y117.557 E.00401
G1 X150.108 Y117.557 E.00472
G1 X133.222 Y134.443 E.33691
G1 X132.603 Y134.443 E.00874
G1 X149.489 Y117.557 E.33691
G1 X148.869 Y117.557 E.00874
G1 X131.983 Y134.443 E.33691
G1 X131.364 Y134.443 E.00874
G1 X148.25 Y117.557 E.33691
G1 X147.63 Y117.557 E.00874
G1 X130.744 Y134.443 E.33691
G1 X130.455 Y134.443 E.00409
G1 X130.455 Y134.113 E.00465
G1 X147.011 Y117.557 E.33033
G1 X146.392 Y117.557 E.00874
G1 X130.455 Y133.494 E.31797
G1 X130.455 Y132.874 E.00874
G1 X145.772 Y117.557 E.30561
G1 X145.153 Y117.557 E.00874
G1 X130.455 Y132.255 E.29325
G1 X130.455 Y131.635 E.00874
G1 X144.533 Y117.557 E.28089
G1 X143.914 Y117.557 E.00874
G1 X130.455 Y131.016 E.26853
G1 X130.455 Y130.397 E.00874
G1 X143.294 Y117.557 E.25618
G1 X142.675 Y117.557 E.00874
G1 X130.455 Y129.777 E.24382
G1 X130.455 Y129.158 E.00874
G1 X142.056 Y117.557 E.23146
G1 X141.436 Y117.557 E.00874
G1 X130.455 Y128.538 E.2191
G1 X130.455 Y127.919 E.00874
G1 X140.817 Y117.557 E.20674
G1 X140.197 Y117.557 E.00874
G1 X130.455 Y127.3 E.19438
G1 X130.455 Y126.68 E.00874
G1 X139.578 Y117.557 E.18202
G1 X138.958 Y117.557 E.00874
G1 X130.455 Y126.061 E.16966
G1 X130.455 Y125.441 E.00874
G1 X138.339 Y117.557 E.15731
G1 X137.72 Y117.557 E.00874
G1 X130.455 Y124.822 E.14495
G1 X130.455 Y124.202 E.00874
G1 X137.1 Y117.557 E.13259
G1 X136.481 Y117.557 E.00874
G1 X130.455 Y123.583 E.12023
G1 X130.455 Y122.964 E.00874
G1 X135.861 Y117.557 E.10787
G1 X135.242 Y117.557 E.00874
G1 X130.455 Y122.344 E.09551
G1 X130.455 Y121.725 E.00874
G1 X134.622 Y117.557 E.08315
G1 X134.003 Y117.557 E.00874
G1 X130.455 Y121.105 E.07079
G1 X130.455 Y120.486 E.00874
G1 X133.384 Y117.557 E.05844
G1 X132.764 Y117.557 E.00874
G1 X130.455 Y119.866 E.04608
G1 X130.455 Y119.247 E.00874
G1 X132.145 Y117.557 E.03372
G1 X131.525 Y117.557 E.00874
G1 X130.455 Y118.628 E.02136
G1 X130.455 Y118.008 E.00874
G1 X131.101 Y117.362 E.01289
G1 X117.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427438
G1 F21000
G1 X118.009 Y117.542 E.01227
G1 X118.59 Y117.542 E.00776
G1 X117.542 Y118.59 E.01981
G1 X117.542 Y119.17 E.00776
G1 X119.17 Y117.542 E.03079
G1 X119.75 Y117.542 E.00776
G1 X117.542 Y119.75 E.04176
G1 X117.542 Y120.33 E.00776
G1 X120.33 Y117.542 E.05273
G1 X120.911 Y117.542 E.00776
G1 X117.542 Y120.911 E.0637
G1 X117.542 Y121.491 E.00776
G1 X121.491 Y117.542 E.07468
G1 X122.071 Y117.542 E.00776
G1 X117.542 Y122.071 E.08565
G1 X117.542 Y122.651 E.00776
G1 X122.651 Y117.542 E.09662
G1 X123.231 Y117.542 E.00776
G1 X117.542 Y123.231 E.1076
G1 X117.542 Y123.812 E.00776
G1 X123.812 Y117.542 E.11857
G1 X124.392 Y117.542 E.00776
G1 X117.542 Y124.392 E.12954
G1 X117.542 Y124.972 E.00776
G1 X124.972 Y117.542 E.14052
G1 X125.552 Y117.542 E.00776
G1 X117.542 Y125.552 E.15149
G1 X117.542 Y126.132 E.00776
G1 X126.132 Y117.542 E.16246
G1 X126.713 Y117.542 E.00776
G1 X117.542 Y126.713 E.17343
G1 X117.542 Y127.293 E.00776
G1 X127.293 Y117.542 E.18441
G1 X127.873 Y117.542 E.00776
G1 X117.542 Y127.873 E.19538
G1 X117.542 Y128.453 E.00776
G1 X128.453 Y117.542 E.20635
G1 X129.033 Y117.542 E.00776
G1 X117.542 Y129.033 E.21732
G1 X117.542 Y129.614 E.00776
G1 X129.614 Y117.542 E.2283
G1 X130.037 Y117.542 E.00566
G1 X130.037 Y117.699 E.0021
G1 X117.542 Y130.194 E.2363
G1 X117.542 Y130.774 E.00776
G1 X130.037 Y118.279 E.2363
G1 X130.037 Y118.859 E.00776
G1 X117.542 Y131.354 E.2363
G1 X117.542 Y131.935 E.00776
G1 X130.037 Y119.44 E.2363
G1 X130.037 Y120.02 E.00776
G1 X117.542 Y132.515 E.2363
G1 X117.542 Y133.095 E.00776
G1 X130.037 Y120.6 E.2363
G1 X130.037 Y121.18 E.00776
G1 X117.542 Y133.675 E.2363
G1 X117.542 Y134.255 E.00776
G1 X130.037 Y121.761 E.2363
G1 X130.037 Y122.341 E.00776
G1 X117.92 Y134.458 E.22916
G1 X118.5 Y134.458 E.00776
G1 X130.037 Y122.921 E.21819
G1 X130.037 Y123.501 E.00776
G1 X119.08 Y134.458 E.20721
G1 X119.66 Y134.458 E.00776
G1 X130.037 Y124.081 E.19624
G1 X130.037 Y124.662 E.00776
G1 X120.24 Y134.458 E.18527
G1 X120.821 Y134.458 E.00776
G1 X130.037 Y125.242 E.1743
G1 X130.037 Y125.822 E.00776
G1 X121.401 Y134.458 E.16332
G1 X121.981 Y134.458 E.00776
G1 X130.037 Y126.402 E.15235
G1 X130.037 Y126.982 E.00776
G1 X122.561 Y134.458 E.14138
G1 X123.141 Y134.458 E.00776
G1 X130.037 Y127.563 E.1304
G1 X130.037 Y128.143 E.00776
G1 X123.722 Y134.458 E.11943
G1 X124.302 Y134.458 E.00776
G1 X130.037 Y128.723 E.10846
G1 X130.037 Y129.303 E.00776
G1 X124.882 Y134.458 E.09749
G1 X125.462 Y134.458 E.00776
G1 X130.037 Y129.883 E.08651
G1 X130.037 Y130.464 E.00776
G1 X126.043 Y134.458 E.07554
G1 X126.623 Y134.458 E.00776
G1 X130.037 Y131.044 E.06457
G1 X130.037 Y131.624 E.00776
G1 X127.203 Y134.458 E.05359
G1 X127.783 Y134.458 E.00776
G1 X130.037 Y132.204 E.04262
G1 X130.037 Y132.785 E.00776
G1 X128.363 Y134.458 E.03165
G1 X128.944 Y134.458 E.00776
G1 X130.037 Y133.365 E.02068
G1 X130.037 Y133.945 E.00776
G1 X129.343 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X130.037 Y133.945 E-.37312
G1 X130.037 Y133.365 E-.22048
G1 X129.727 Y133.674 E-.1664
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/88
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.12 I-.067 J1.215 P1  F30000
G1 X150.834 Y134.834 Z2.12
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.095 Z2.2 F30000
G1 X150.638 Y118.248 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X149.947 Y117.557 E.01379
G1 X149.327 Y117.557 E.00874
G1 X150.443 Y118.673 E.02226
G1 X150.443 Y119.292 E.00874
G1 X148.708 Y117.557 E.03462
G1 X148.088 Y117.557 E.00874
G1 X150.443 Y119.912 E.04698
G1 X150.443 Y120.531 E.00874
G1 X147.469 Y117.557 E.05934
G1 X146.849 Y117.557 E.00874
G1 X150.443 Y121.151 E.0717
G1 X150.443 Y121.77 E.00874
G1 X146.23 Y117.557 E.08406
G1 X145.611 Y117.557 E.00874
G1 X150.443 Y122.389 E.09642
G1 X150.443 Y123.009 E.00874
G1 X144.991 Y117.557 E.10877
G1 X144.372 Y117.557 E.00874
G1 X150.443 Y123.628 E.12113
G1 X150.443 Y124.248 E.00874
G1 X143.752 Y117.557 E.13349
G1 X143.133 Y117.557 E.00874
G1 X150.443 Y124.867 E.14585
G1 X150.443 Y125.487 E.00874
G1 X142.513 Y117.557 E.15821
G1 X141.894 Y117.557 E.00874
G1 X150.443 Y126.106 E.17057
G1 X150.443 Y126.725 E.00874
M73 P55 R12
G1 X141.275 Y117.557 E.18293
G1 X140.655 Y117.557 E.00874
G1 X150.443 Y127.345 E.19529
G1 X150.443 Y127.964 E.00874
G1 X140.036 Y117.557 E.20764
G1 X139.416 Y117.557 E.00874
G1 X150.443 Y128.584 E.22
G1 X150.443 Y129.203 E.00874
G1 X138.797 Y117.557 E.23236
G1 X138.177 Y117.557 E.00874
G1 X150.443 Y129.823 E.24472
G1 X150.443 Y130.442 E.00874
G1 X137.558 Y117.557 E.25708
G1 X136.939 Y117.557 E.00874
G1 X150.443 Y131.061 E.26944
G1 X150.443 Y131.681 E.00874
G1 X136.319 Y117.557 E.2818
G1 X135.7 Y117.557 E.00874
G1 X150.443 Y132.3 E.29416
G1 X150.443 Y132.92 E.00874
G1 X135.08 Y117.557 E.30651
G1 X134.461 Y117.557 E.00874
G1 X150.443 Y133.539 E.31887
G1 X150.443 Y134.158 E.00874
G1 X133.842 Y117.557 E.33123
G1 X133.222 Y117.557 E.00874
G1 X150.108 Y134.443 E.33691
G1 X149.489 Y134.443 E.00874
G1 X132.603 Y117.557 E.33691
G1 X131.983 Y117.557 E.00874
G1 X148.869 Y134.443 E.33691
G1 X148.25 Y134.443 E.00874
G1 X131.364 Y117.557 E.33691
G1 X130.744 Y117.557 E.00874
G1 X147.63 Y134.443 E.33691
G1 X147.011 Y134.443 E.00874
G1 X130.455 Y117.887 E.33033
G1 X130.455 Y118.506 E.00874
G1 X146.392 Y134.443 E.31797
G1 X145.772 Y134.443 E.00874
G1 X130.455 Y119.126 E.30561
G1 X130.455 Y119.745 E.00874
G1 X145.153 Y134.443 E.29325
G1 X144.533 Y134.443 E.00874
G1 X130.455 Y120.364 E.28089
G1 X130.455 Y120.984 E.00874
G1 X143.914 Y134.443 E.26853
G1 X143.294 Y134.443 E.00874
G1 X130.455 Y121.603 E.25618
G1 X130.455 Y122.223 E.00874
G1 X142.675 Y134.443 E.24382
G1 X142.056 Y134.443 E.00874
G1 X130.455 Y122.842 E.23146
G1 X130.455 Y123.462 E.00874
G1 X141.436 Y134.443 E.2191
G1 X140.817 Y134.443 E.00874
G1 X130.455 Y124.081 E.20674
G1 X130.455 Y124.7 E.00874
G1 X140.197 Y134.443 E.19438
G1 X139.578 Y134.443 E.00874
G1 X130.455 Y125.32 E.18202
G1 X130.455 Y125.939 E.00874
G1 X138.958 Y134.443 E.16966
G1 X138.339 Y134.443 E.00874
G1 X130.455 Y126.559 E.15731
G1 X130.455 Y127.178 E.00874
G1 X137.72 Y134.443 E.14495
G1 X137.1 Y134.443 E.00874
G1 X130.455 Y127.798 E.13259
G1 X130.455 Y128.417 E.00874
G1 X136.481 Y134.443 E.12023
G1 X135.861 Y134.443 E.00874
G1 X130.455 Y129.036 E.10787
G1 X130.455 Y129.656 E.00874
G1 X135.242 Y134.443 E.09551
G1 X134.622 Y134.443 E.00874
G1 X130.455 Y130.275 E.08315
G1 X130.455 Y130.895 E.00874
G1 X134.003 Y134.443 E.07079
G1 X133.384 Y134.443 E.00874
G1 X130.455 Y131.514 E.05844
G1 X130.455 Y132.134 E.00874
G1 X132.764 Y134.443 E.04608
G1 X132.145 Y134.443 E.00874
G1 X130.455 Y132.753 E.03372
G1 X130.455 Y133.372 E.00874
G1 X131.525 Y134.443 E.02136
G1 X130.906 Y134.443 E.00874
G1 X130.26 Y133.797 E.01289
G1 X118.191 Y134.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427438
G1 F21000
G1 X117.542 Y133.991 E.01227
G1 X117.542 Y133.41 E.00776
G1 X118.59 Y134.458 E.01981
G1 X119.17 Y134.458 E.00776
G1 X117.542 Y132.83 E.03079
G1 X117.542 Y132.25 E.00776
G1 X119.75 Y134.458 E.04176
G1 X120.33 Y134.458 E.00776
G1 X117.542 Y131.67 E.05273
G1 X117.542 Y131.089 E.00776
G1 X120.911 Y134.458 E.0637
G1 X121.491 Y134.458 E.00776
G1 X117.542 Y130.509 E.07468
G1 X117.542 Y129.929 E.00776
G1 X122.071 Y134.458 E.08565
G1 X122.651 Y134.458 E.00776
G1 X117.542 Y129.349 E.09662
G1 X117.542 Y128.769 E.00776
G1 X123.231 Y134.458 E.1076
G1 X123.812 Y134.458 E.00776
G1 X117.542 Y128.188 E.11857
G1 X117.542 Y127.608 E.00776
G1 X124.392 Y134.458 E.12954
G1 X124.972 Y134.458 E.00776
G1 X117.542 Y127.028 E.14051
G1 X117.542 Y126.448 E.00776
G1 X125.552 Y134.458 E.15149
G1 X126.132 Y134.458 E.00776
G1 X117.542 Y125.868 E.16246
G1 X117.542 Y125.287 E.00776
G1 X126.713 Y134.458 E.17343
G1 X127.293 Y134.458 E.00776
G1 X117.542 Y124.707 E.18441
G1 X117.542 Y124.127 E.00776
G1 X127.873 Y134.458 E.19538
G1 X128.453 Y134.458 E.00776
G1 X117.542 Y123.547 E.20635
G1 X117.542 Y122.967 E.00776
G1 X129.033 Y134.458 E.21732
G1 X129.614 Y134.458 E.00776
G1 X117.542 Y122.386 E.2283
G1 X117.542 Y121.806 E.00776
G1 X130.037 Y134.301 E.2363
G1 X130.037 Y133.721 E.00776
G1 X117.542 Y121.226 E.2363
G1 X117.542 Y120.646 E.00776
G1 X130.037 Y133.14 E.2363
G1 X130.037 Y132.56 E.00776
G1 X117.542 Y120.065 E.2363
G1 X117.542 Y119.485 E.00776
G1 X130.037 Y131.98 E.2363
G1 X130.037 Y131.4 E.00776
G1 X117.542 Y118.905 E.2363
G1 X117.542 Y118.325 E.00776
G1 X130.037 Y130.82 E.2363
G1 X130.037 Y130.239 E.00776
G1 X117.542 Y117.745 E.2363
G1 X117.542 Y117.542 E.00271
G1 X117.92 Y117.542 E.00505
G1 X130.037 Y129.659 E.22916
G1 X130.037 Y129.079 E.00776
G1 X118.5 Y117.542 E.21819
G1 X119.08 Y117.542 E.00776
G1 X130.037 Y128.499 E.20721
G1 X130.037 Y127.919 E.00776
G1 X119.66 Y117.542 E.19624
G1 X120.24 Y117.542 E.00776
G1 X130.037 Y127.338 E.18527
G1 X130.037 Y126.758 E.00776
G1 X120.821 Y117.542 E.1743
G1 X121.401 Y117.542 E.00776
G1 X130.037 Y126.178 E.16332
G1 X130.037 Y125.598 E.00776
G1 X121.981 Y117.542 E.15235
G1 X122.561 Y117.542 E.00776
G1 X130.037 Y125.018 E.14138
G1 X130.037 Y124.437 E.00776
G1 X123.141 Y117.542 E.1304
G1 X123.722 Y117.542 E.00776
G1 X130.037 Y123.857 E.11943
G1 X130.037 Y123.277 E.00776
G1 X124.302 Y117.542 E.10846
G1 X124.882 Y117.542 E.00776
G1 X130.037 Y122.697 E.09749
G1 X130.037 Y122.117 E.00776
G1 X125.462 Y117.542 E.08651
G1 X126.043 Y117.542 E.00776
G1 X130.037 Y121.536 E.07554
G1 X130.037 Y120.956 E.00776
G1 X126.623 Y117.542 E.06457
G1 X127.203 Y117.542 E.00776
G1 X130.037 Y120.376 E.05359
G1 X130.037 Y119.796 E.00776
G1 X127.783 Y117.542 E.04262
G1 X128.363 Y117.542 E.00776
G1 X130.037 Y119.215 E.03165
G1 X130.037 Y118.635 E.00776
G1 X128.944 Y117.542 E.02068
G1 X129.524 Y117.542 E.00776
G1 X130.218 Y118.236 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 1.88
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X129.524 Y117.542 E-.37312
G1 X128.944 Y117.542 E-.22048
G1 X129.253 Y117.852 E-.1664
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/88
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.2 I-.753 J.956 P1  F30000
G1 X150.834 Y134.834 Z2.2
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.611 E.00874
G1 X145.611 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10877
G1 X150.443 Y128.372 E.00874
G1 X144.372 Y134.443 E.12113
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.13349
G1 X150.443 Y127.133 E.00874
G1 X143.133 Y134.443 E.14585
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15821
G1 X150.443 Y125.894 E.00874
G1 X141.894 Y134.443 E.17057
G1 X141.275 Y134.443 E.00874
G1 X150.443 Y125.275 E.18293
G1 X150.443 Y124.655 E.00874
G1 X140.655 Y134.443 E.19528
G1 X140.036 Y134.443 E.00874
G1 X150.443 Y124.036 E.20764
G1 X150.443 Y123.416 E.00874
G1 X139.416 Y134.443 E.22
G1 X138.797 Y134.443 E.00874
M73 P56 R12
G1 X150.443 Y122.797 E.23236
G1 X150.443 Y122.177 E.00874
G1 X138.177 Y134.443 E.24472
G1 X137.558 Y134.443 E.00874
G1 X150.443 Y121.558 E.25708
G1 X150.443 Y120.939 E.00874
G1 X136.939 Y134.443 E.26944
G1 X136.319 Y134.443 E.00874
G1 X150.443 Y120.319 E.2818
G1 X150.443 Y119.7 E.00874
G1 X135.7 Y134.443 E.29415
G1 X135.08 Y134.443 E.00874
G1 X150.443 Y119.08 E.30651
G1 X150.443 Y118.461 E.00874
G1 X134.461 Y134.443 E.31887
G1 X133.842 Y134.443 E.00874
G1 X150.443 Y117.842 E.33123
G1 X150.443 Y117.557 E.00401
G1 X150.108 Y117.557 E.00472
G1 X133.222 Y134.443 E.33691
G1 X132.603 Y134.443 E.00874
G1 X149.489 Y117.557 E.33691
G1 X148.869 Y117.557 E.00874
G1 X131.983 Y134.443 E.33691
G1 X131.364 Y134.443 E.00874
G1 X148.25 Y117.557 E.33691
G1 X147.63 Y117.557 E.00874
G1 X130.744 Y134.443 E.33691
G1 X130.455 Y134.443 E.00409
G1 X130.455 Y134.113 E.00465
G1 X147.011 Y117.557 E.33033
G1 X146.392 Y117.557 E.00874
G1 X130.455 Y133.494 E.31797
G1 X130.455 Y132.874 E.00874
G1 X145.772 Y117.557 E.30561
G1 X145.153 Y117.557 E.00874
G1 X130.455 Y132.255 E.29325
G1 X130.455 Y131.635 E.00874
G1 X144.533 Y117.557 E.28089
G1 X143.914 Y117.557 E.00874
G1 X130.455 Y131.016 E.26853
G1 X130.455 Y130.397 E.00874
G1 X143.294 Y117.557 E.25618
G1 X142.675 Y117.557 E.00874
G1 X130.455 Y129.777 E.24382
G1 X130.455 Y129.158 E.00874
G1 X142.056 Y117.557 E.23146
G1 X141.436 Y117.557 E.00874
G1 X130.455 Y128.538 E.2191
G1 X130.455 Y127.919 E.00874
G1 X140.817 Y117.557 E.20674
G1 X140.197 Y117.557 E.00874
G1 X130.455 Y127.3 E.19438
G1 X130.455 Y126.68 E.00874
G1 X139.578 Y117.557 E.18202
G1 X138.958 Y117.557 E.00874
G1 X130.455 Y126.061 E.16966
G1 X130.455 Y125.441 E.00874
G1 X138.339 Y117.557 E.15731
G1 X137.72 Y117.557 E.00874
G1 X130.455 Y124.822 E.14495
G1 X130.455 Y124.202 E.00874
G1 X137.1 Y117.557 E.13259
G1 X136.481 Y117.557 E.00874
G1 X130.455 Y123.583 E.12023
G1 X130.455 Y122.964 E.00874
G1 X135.861 Y117.557 E.10787
G1 X135.242 Y117.557 E.00874
G1 X130.455 Y122.344 E.09551
G1 X130.455 Y121.725 E.00874
G1 X134.622 Y117.557 E.08315
G1 X134.003 Y117.557 E.00874
G1 X130.455 Y121.105 E.07079
G1 X130.455 Y120.486 E.00874
G1 X133.384 Y117.557 E.05844
G1 X132.764 Y117.557 E.00874
G1 X130.455 Y119.866 E.04608
G1 X130.455 Y119.247 E.00874
G1 X132.145 Y117.557 E.03372
G1 X131.525 Y117.557 E.00874
G1 X130.455 Y118.628 E.02136
G1 X130.455 Y118.008 E.00874
G1 X131.101 Y117.362 E.01289
G1 X117.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427438
G1 F21000
G1 X118.009 Y117.542 E.01227
G1 X118.59 Y117.542 E.00776
G1 X117.542 Y118.59 E.01981
G1 X117.542 Y119.17 E.00776
G1 X119.17 Y117.542 E.03079
G1 X119.75 Y117.542 E.00776
G1 X117.542 Y119.75 E.04176
G1 X117.542 Y120.33 E.00776
G1 X120.33 Y117.542 E.05273
G1 X120.911 Y117.542 E.00776
G1 X117.542 Y120.911 E.0637
G1 X117.542 Y121.491 E.00776
G1 X121.491 Y117.542 E.07468
G1 X122.071 Y117.542 E.00776
G1 X117.542 Y122.071 E.08565
G1 X117.542 Y122.651 E.00776
G1 X122.651 Y117.542 E.09662
G1 X123.231 Y117.542 E.00776
G1 X117.542 Y123.231 E.1076
G1 X117.542 Y123.812 E.00776
G1 X123.812 Y117.542 E.11857
G1 X124.392 Y117.542 E.00776
G1 X117.542 Y124.392 E.12954
G1 X117.542 Y124.972 E.00776
G1 X124.972 Y117.542 E.14052
G1 X125.552 Y117.542 E.00776
G1 X117.542 Y125.552 E.15149
G1 X117.542 Y126.132 E.00776
G1 X126.132 Y117.542 E.16246
G1 X126.713 Y117.542 E.00776
G1 X117.542 Y126.713 E.17343
G1 X117.542 Y127.293 E.00776
G1 X127.293 Y117.542 E.18441
G1 X127.873 Y117.542 E.00776
G1 X117.542 Y127.873 E.19538
G1 X117.542 Y128.453 E.00776
G1 X128.453 Y117.542 E.20635
G1 X129.033 Y117.542 E.00776
G1 X117.542 Y129.033 E.21732
G1 X117.542 Y129.614 E.00776
G1 X129.614 Y117.542 E.2283
G1 X130.037 Y117.542 E.00566
G1 X130.037 Y117.699 E.0021
G1 X117.542 Y130.194 E.2363
G1 X117.542 Y130.774 E.00776
G1 X130.037 Y118.279 E.2363
G1 X130.037 Y118.859 E.00776
G1 X117.542 Y131.354 E.2363
G1 X117.542 Y131.935 E.00776
G1 X130.037 Y119.44 E.2363
G1 X130.037 Y120.02 E.00776
G1 X117.542 Y132.515 E.2363
G1 X117.542 Y133.095 E.00776
G1 X130.037 Y120.6 E.2363
G1 X130.037 Y121.18 E.00776
G1 X117.542 Y133.675 E.2363
G1 X117.542 Y134.255 E.00776
G1 X130.037 Y121.761 E.2363
G1 X130.037 Y122.341 E.00776
G1 X117.92 Y134.458 E.22916
G1 X118.5 Y134.458 E.00776
G1 X130.037 Y122.921 E.21819
G1 X130.037 Y123.501 E.00776
G1 X119.08 Y134.458 E.20721
G1 X119.66 Y134.458 E.00776
G1 X130.037 Y124.081 E.19624
G1 X130.037 Y124.662 E.00776
G1 X120.24 Y134.458 E.18527
G1 X120.821 Y134.458 E.00776
G1 X130.037 Y125.242 E.1743
G1 X130.037 Y125.822 E.00776
G1 X121.401 Y134.458 E.16332
G1 X121.981 Y134.458 E.00776
G1 X130.037 Y126.402 E.15235
G1 X130.037 Y126.982 E.00776
G1 X122.561 Y134.458 E.14138
G1 X123.141 Y134.458 E.00776
G1 X130.037 Y127.563 E.1304
G1 X130.037 Y128.143 E.00776
G1 X123.722 Y134.458 E.11943
G1 X124.302 Y134.458 E.00776
G1 X130.037 Y128.723 E.10846
G1 X130.037 Y129.303 E.00776
G1 X124.882 Y134.458 E.09749
G1 X125.462 Y134.458 E.00776
G1 X130.037 Y129.883 E.08651
G1 X130.037 Y130.464 E.00776
G1 X126.043 Y134.458 E.07554
G1 X126.623 Y134.458 E.00776
G1 X130.037 Y131.044 E.06457
G1 X130.037 Y131.624 E.00776
G1 X127.203 Y134.458 E.05359
G1 X127.783 Y134.458 E.00776
G1 X130.037 Y132.204 E.04262
G1 X130.037 Y132.785 E.00776
G1 X128.363 Y134.458 E.03165
G1 X128.944 Y134.458 E.00776
G1 X130.037 Y133.365 E.02068
G1 X130.037 Y133.945 E.00776
G1 X129.343 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F21000
G1 X130.037 Y133.945 E-.37312
G1 X130.037 Y133.365 E-.22048
G1 X129.727 Y133.674 E-.1664
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/88
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.28 I-.067 J1.215 P1  F30000
G1 X150.834 Y134.834 Z2.28
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.095 Z2.36 F30000
G1 X150.638 Y118.248 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X149.947 Y117.557 E.01379
G1 X149.327 Y117.557 E.00874
G1 X150.443 Y118.673 E.02226
G1 X150.443 Y119.292 E.00874
G1 X148.708 Y117.557 E.03462
G1 X148.088 Y117.557 E.00874
G1 X150.443 Y119.912 E.04698
G1 X150.443 Y120.531 E.00874
G1 X147.469 Y117.557 E.05934
G1 X146.849 Y117.557 E.00874
G1 X150.443 Y121.151 E.0717
G1 X150.443 Y121.77 E.00874
G1 X146.23 Y117.557 E.08406
G1 X145.611 Y117.557 E.00874
G1 X150.443 Y122.389 E.09642
G1 X150.443 Y123.009 E.00874
G1 X144.991 Y117.557 E.10877
G1 X144.372 Y117.557 E.00874
G1 X150.443 Y123.628 E.12113
G1 X150.443 Y124.248 E.00874
G1 X143.752 Y117.557 E.13349
G1 X143.133 Y117.557 E.00874
G1 X150.443 Y124.867 E.14585
G1 X150.443 Y125.487 E.00874
G1 X142.513 Y117.557 E.15821
G1 X141.894 Y117.557 E.00874
G1 X150.443 Y126.106 E.17057
G1 X150.443 Y126.725 E.00874
G1 X141.275 Y117.557 E.18293
G1 X140.655 Y117.557 E.00874
G1 X150.443 Y127.345 E.19529
G1 X150.443 Y127.964 E.00874
G1 X140.036 Y117.557 E.20764
G1 X139.416 Y117.557 E.00874
G1 X150.443 Y128.584 E.22
G1 X150.443 Y129.203 E.00874
G1 X138.797 Y117.557 E.23236
G1 X138.177 Y117.557 E.00874
G1 X150.443 Y129.823 E.24472
G1 X150.443 Y130.442 E.00874
G1 X137.558 Y117.557 E.25708
M73 P57 R12
G1 X136.939 Y117.557 E.00874
M73 P57 R11
G1 X150.443 Y131.061 E.26944
G1 X150.443 Y131.681 E.00874
G1 X136.319 Y117.557 E.2818
G1 X135.7 Y117.557 E.00874
G1 X150.443 Y132.3 E.29416
G1 X150.443 Y132.92 E.00874
G1 X135.08 Y117.557 E.30651
G1 X134.461 Y117.557 E.00874
G1 X150.443 Y133.539 E.31887
G1 X150.443 Y134.158 E.00874
G1 X133.842 Y117.557 E.33123
G1 X133.222 Y117.557 E.00874
G1 X150.108 Y134.443 E.33691
G1 X149.489 Y134.443 E.00874
G1 X132.603 Y117.557 E.33691
G1 X131.983 Y117.557 E.00874
G1 X148.869 Y134.443 E.33691
G1 X148.25 Y134.443 E.00874
G1 X131.364 Y117.557 E.33691
G1 X130.744 Y117.557 E.00874
G1 X147.63 Y134.443 E.33691
G1 X147.011 Y134.443 E.00874
G1 X130.455 Y117.887 E.33033
G1 X130.455 Y118.506 E.00874
G1 X146.392 Y134.443 E.31797
G1 X145.772 Y134.443 E.00874
G1 X130.455 Y119.126 E.30561
G1 X130.455 Y119.745 E.00874
G1 X145.153 Y134.443 E.29325
G1 X144.533 Y134.443 E.00874
G1 X130.455 Y120.364 E.28089
G1 X130.455 Y120.984 E.00874
G1 X143.914 Y134.443 E.26853
G1 X143.294 Y134.443 E.00874
G1 X130.455 Y121.603 E.25618
G1 X130.455 Y122.223 E.00874
G1 X142.675 Y134.443 E.24382
G1 X142.056 Y134.443 E.00874
G1 X130.455 Y122.842 E.23146
G1 X130.455 Y123.462 E.00874
G1 X141.436 Y134.443 E.2191
G1 X140.817 Y134.443 E.00874
G1 X130.455 Y124.081 E.20674
G1 X130.455 Y124.7 E.00874
G1 X140.197 Y134.443 E.19438
G1 X139.578 Y134.443 E.00874
G1 X130.455 Y125.32 E.18202
G1 X130.455 Y125.939 E.00874
G1 X138.958 Y134.443 E.16966
G1 X138.339 Y134.443 E.00874
G1 X130.455 Y126.559 E.15731
G1 X130.455 Y127.178 E.00874
G1 X137.72 Y134.443 E.14495
G1 X137.1 Y134.443 E.00874
G1 X130.455 Y127.798 E.13259
G1 X130.455 Y128.417 E.00874
G1 X136.481 Y134.443 E.12023
G1 X135.861 Y134.443 E.00874
G1 X130.455 Y129.036 E.10787
G1 X130.455 Y129.656 E.00874
G1 X135.242 Y134.443 E.09551
G1 X134.622 Y134.443 E.00874
G1 X130.455 Y130.275 E.08315
G1 X130.455 Y130.895 E.00874
G1 X134.003 Y134.443 E.07079
G1 X133.384 Y134.443 E.00874
G1 X130.455 Y131.514 E.05844
G1 X130.455 Y132.134 E.00874
G1 X132.764 Y134.443 E.04608
G1 X132.145 Y134.443 E.00874
G1 X130.455 Y132.753 E.03372
G1 X130.455 Y133.372 E.00874
G1 X131.525 Y134.443 E.02136
G1 X130.906 Y134.443 E.00874
G1 X130.26 Y133.797 E.01289
G1 X118.191 Y134.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427438
G1 F21000
G1 X117.542 Y133.991 E.01227
G1 X117.542 Y133.41 E.00776
G1 X118.59 Y134.458 E.01981
G1 X119.17 Y134.458 E.00776
G1 X117.542 Y132.83 E.03079
G1 X117.542 Y132.25 E.00776
G1 X119.75 Y134.458 E.04176
G1 X120.33 Y134.458 E.00776
G1 X117.542 Y131.67 E.05273
G1 X117.542 Y131.089 E.00776
G1 X120.911 Y134.458 E.0637
G1 X121.491 Y134.458 E.00776
G1 X117.542 Y130.509 E.07468
G1 X117.542 Y129.929 E.00776
G1 X122.071 Y134.458 E.08565
G1 X122.651 Y134.458 E.00776
G1 X117.542 Y129.349 E.09662
G1 X117.542 Y128.769 E.00776
G1 X123.231 Y134.458 E.1076
G1 X123.812 Y134.458 E.00776
G1 X117.542 Y128.188 E.11857
G1 X117.542 Y127.608 E.00776
G1 X124.392 Y134.458 E.12954
G1 X124.972 Y134.458 E.00776
G1 X117.542 Y127.028 E.14051
G1 X117.542 Y126.448 E.00776
G1 X125.552 Y134.458 E.15149
G1 X126.132 Y134.458 E.00776
G1 X117.542 Y125.868 E.16246
G1 X117.542 Y125.287 E.00776
G1 X126.713 Y134.458 E.17343
G1 X127.293 Y134.458 E.00776
G1 X117.542 Y124.707 E.18441
G1 X117.542 Y124.127 E.00776
G1 X127.873 Y134.458 E.19538
G1 X128.453 Y134.458 E.00776
G1 X117.542 Y123.547 E.20635
G1 X117.542 Y122.967 E.00776
G1 X129.033 Y134.458 E.21732
G1 X129.614 Y134.458 E.00776
G1 X117.542 Y122.386 E.2283
G1 X117.542 Y121.806 E.00776
G1 X130.037 Y134.301 E.2363
G1 X130.037 Y133.721 E.00776
G1 X117.542 Y121.226 E.2363
G1 X117.542 Y120.646 E.00776
G1 X130.037 Y133.14 E.2363
G1 X130.037 Y132.56 E.00776
G1 X117.542 Y120.065 E.2363
G1 X117.542 Y119.485 E.00776
G1 X130.037 Y131.98 E.2363
G1 X130.037 Y131.4 E.00776
G1 X117.542 Y118.905 E.2363
G1 X117.542 Y118.325 E.00776
G1 X130.037 Y130.82 E.2363
G1 X130.037 Y130.239 E.00776
G1 X117.542 Y117.745 E.2363
G1 X117.542 Y117.542 E.00271
G1 X117.92 Y117.542 E.00505
G1 X130.037 Y129.659 E.22916
G1 X130.037 Y129.079 E.00776
G1 X118.5 Y117.542 E.21819
G1 X119.08 Y117.542 E.00776
G1 X130.037 Y128.499 E.20721
G1 X130.037 Y127.919 E.00776
G1 X119.66 Y117.542 E.19624
G1 X120.24 Y117.542 E.00776
G1 X130.037 Y127.338 E.18527
G1 X130.037 Y126.758 E.00776
G1 X120.821 Y117.542 E.1743
G1 X121.401 Y117.542 E.00776
G1 X130.037 Y126.178 E.16332
G1 X130.037 Y125.598 E.00776
G1 X121.981 Y117.542 E.15235
G1 X122.561 Y117.542 E.00776
G1 X130.037 Y125.018 E.14138
G1 X130.037 Y124.437 E.00776
G1 X123.141 Y117.542 E.1304
G1 X123.722 Y117.542 E.00776
G1 X130.037 Y123.857 E.11943
G1 X130.037 Y123.277 E.00776
G1 X124.302 Y117.542 E.10846
G1 X124.882 Y117.542 E.00776
G1 X130.037 Y122.697 E.09749
G1 X130.037 Y122.117 E.00776
G1 X125.462 Y117.542 E.08651
G1 X126.043 Y117.542 E.00776
G1 X130.037 Y121.536 E.07554
G1 X130.037 Y120.956 E.00776
G1 X126.623 Y117.542 E.06457
G1 X127.203 Y117.542 E.00776
G1 X130.037 Y120.376 E.05359
G1 X130.037 Y119.796 E.00776
G1 X127.783 Y117.542 E.04262
G1 X128.363 Y117.542 E.00776
G1 X130.037 Y119.215 E.03165
G1 X130.037 Y118.635 E.00776
G1 X128.944 Y117.542 E.02068
G1 X129.524 Y117.542 E.00776
G1 X130.218 Y118.236 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 2.04
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X129.524 Y117.542 E-.37312
G1 X128.944 Y117.542 E-.22048
G1 X129.253 Y117.852 E-.1664
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/88
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.36 I-.753 J.956 P1  F30000
G1 X150.834 Y134.834 Z2.36
G1 Z2.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z2.44 F30000
G1 Z2.04
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.611 E.00874
G1 X145.611 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10877
G1 X150.443 Y128.372 E.00874
G1 X144.372 Y134.443 E.12113
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.13349
G1 X150.443 Y127.133 E.00874
G1 X143.133 Y134.443 E.14585
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15821
G1 X150.443 Y125.894 E.00874
G1 X141.894 Y134.443 E.17057
G1 X141.275 Y134.443 E.00874
G1 X150.443 Y125.275 E.18293
G1 X150.443 Y124.655 E.00874
G1 X140.655 Y134.443 E.19528
G1 X140.036 Y134.443 E.00874
G1 X150.443 Y124.036 E.20764
G1 X150.443 Y123.416 E.00874
G1 X139.416 Y134.443 E.22
G1 X138.797 Y134.443 E.00874
G1 X150.443 Y122.797 E.23236
G1 X150.443 Y122.177 E.00874
G1 X138.177 Y134.443 E.24472
G1 X137.558 Y134.443 E.00874
G1 X150.443 Y121.558 E.25708
G1 X150.443 Y120.939 E.00874
G1 X136.939 Y134.443 E.26944
G1 X136.319 Y134.443 E.00874
M73 P58 R11
G1 X150.443 Y120.319 E.2818
G1 X150.443 Y119.7 E.00874
G1 X135.7 Y134.443 E.29415
G1 X135.08 Y134.443 E.00874
G1 X150.443 Y119.08 E.30651
G1 X150.443 Y118.461 E.00874
G1 X134.461 Y134.443 E.31887
G1 X133.842 Y134.443 E.00874
G1 X150.443 Y117.842 E.33123
G1 X150.443 Y117.557 E.00401
G1 X150.108 Y117.557 E.00472
G1 X133.222 Y134.443 E.33691
G1 X132.603 Y134.443 E.00874
G1 X149.489 Y117.557 E.33691
G1 X148.869 Y117.557 E.00874
G1 X131.983 Y134.443 E.33691
G1 X131.364 Y134.443 E.00874
G1 X148.25 Y117.557 E.33691
G1 X147.63 Y117.557 E.00874
G1 X130.744 Y134.443 E.33691
G1 X130.455 Y134.443 E.00409
G1 X130.455 Y134.113 E.00465
G1 X147.011 Y117.557 E.33033
G1 X146.392 Y117.557 E.00874
G1 X130.455 Y133.494 E.31797
G1 X130.455 Y132.874 E.00874
G1 X145.772 Y117.557 E.30561
G1 X145.153 Y117.557 E.00874
G1 X130.455 Y132.255 E.29325
G1 X130.455 Y131.635 E.00874
G1 X144.533 Y117.557 E.28089
G1 X143.914 Y117.557 E.00874
G1 X130.455 Y131.016 E.26853
G1 X130.455 Y130.397 E.00874
G1 X143.294 Y117.557 E.25618
G1 X142.675 Y117.557 E.00874
G1 X130.455 Y129.777 E.24382
G1 X130.455 Y129.158 E.00874
G1 X142.056 Y117.557 E.23146
G1 X141.436 Y117.557 E.00874
G1 X130.455 Y128.538 E.2191
G1 X130.455 Y127.919 E.00874
G1 X140.817 Y117.557 E.20674
G1 X140.197 Y117.557 E.00874
G1 X130.455 Y127.3 E.19438
G1 X130.455 Y126.68 E.00874
G1 X139.578 Y117.557 E.18202
G1 X138.958 Y117.557 E.00874
G1 X130.455 Y126.061 E.16966
G1 X130.455 Y125.441 E.00874
G1 X138.339 Y117.557 E.15731
G1 X137.72 Y117.557 E.00874
G1 X130.455 Y124.822 E.14495
G1 X130.455 Y124.202 E.00874
G1 X137.1 Y117.557 E.13259
G1 X136.481 Y117.557 E.00874
G1 X130.455 Y123.583 E.12023
G1 X130.455 Y122.964 E.00874
G1 X135.861 Y117.557 E.10787
G1 X135.242 Y117.557 E.00874
G1 X130.455 Y122.344 E.09551
G1 X130.455 Y121.725 E.00874
G1 X134.622 Y117.557 E.08315
G1 X134.003 Y117.557 E.00874
G1 X130.455 Y121.105 E.07079
G1 X130.455 Y120.486 E.00874
G1 X133.384 Y117.557 E.05844
G1 X132.764 Y117.557 E.00874
G1 X130.455 Y119.866 E.04608
G1 X130.455 Y119.247 E.00874
G1 X132.145 Y117.557 E.03372
G1 X131.525 Y117.557 E.00874
G1 X130.455 Y118.628 E.02136
G1 X130.455 Y118.008 E.00874
G1 X131.101 Y117.362 E.01289
G1 X117.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427438
G1 F21000
G1 X118.009 Y117.542 E.01227
G1 X118.59 Y117.542 E.00776
G1 X117.542 Y118.59 E.01981
G1 X117.542 Y119.17 E.00776
G1 X119.17 Y117.542 E.03079
G1 X119.75 Y117.542 E.00776
G1 X117.542 Y119.75 E.04176
G1 X117.542 Y120.33 E.00776
G1 X120.33 Y117.542 E.05273
G1 X120.911 Y117.542 E.00776
G1 X117.542 Y120.911 E.0637
G1 X117.542 Y121.491 E.00776
G1 X121.491 Y117.542 E.07468
G1 X122.071 Y117.542 E.00776
G1 X117.542 Y122.071 E.08565
G1 X117.542 Y122.651 E.00776
G1 X122.651 Y117.542 E.09662
G1 X123.231 Y117.542 E.00776
G1 X117.542 Y123.231 E.1076
G1 X117.542 Y123.812 E.00776
G1 X123.812 Y117.542 E.11857
G1 X124.392 Y117.542 E.00776
G1 X117.542 Y124.392 E.12954
G1 X117.542 Y124.972 E.00776
G1 X124.972 Y117.542 E.14052
G1 X125.552 Y117.542 E.00776
G1 X117.542 Y125.552 E.15149
G1 X117.542 Y126.132 E.00776
G1 X126.132 Y117.542 E.16246
G1 X126.713 Y117.542 E.00776
G1 X117.542 Y126.713 E.17343
G1 X117.542 Y127.293 E.00776
G1 X127.293 Y117.542 E.18441
G1 X127.873 Y117.542 E.00776
G1 X117.542 Y127.873 E.19538
G1 X117.542 Y128.453 E.00776
G1 X128.453 Y117.542 E.20635
G1 X129.033 Y117.542 E.00776
G1 X117.542 Y129.033 E.21732
G1 X117.542 Y129.614 E.00776
G1 X129.614 Y117.542 E.2283
G1 X130.037 Y117.542 E.00566
G1 X130.037 Y117.699 E.0021
G1 X117.542 Y130.194 E.2363
G1 X117.542 Y130.774 E.00776
G1 X130.037 Y118.279 E.2363
G1 X130.037 Y118.859 E.00776
G1 X117.542 Y131.354 E.2363
G1 X117.542 Y131.935 E.00776
G1 X130.037 Y119.44 E.2363
G1 X130.037 Y120.02 E.00776
G1 X117.542 Y132.515 E.2363
G1 X117.542 Y133.095 E.00776
G1 X130.037 Y120.6 E.2363
G1 X130.037 Y121.18 E.00776
G1 X117.542 Y133.675 E.2363
G1 X117.542 Y134.255 E.00776
G1 X130.037 Y121.761 E.2363
G1 X130.037 Y122.341 E.00776
G1 X117.92 Y134.458 E.22916
G1 X118.5 Y134.458 E.00776
G1 X130.037 Y122.921 E.21819
G1 X130.037 Y123.501 E.00776
G1 X119.08 Y134.458 E.20721
G1 X119.66 Y134.458 E.00776
G1 X130.037 Y124.081 E.19624
G1 X130.037 Y124.662 E.00776
G1 X120.24 Y134.458 E.18527
G1 X120.821 Y134.458 E.00776
G1 X130.037 Y125.242 E.1743
G1 X130.037 Y125.822 E.00776
G1 X121.401 Y134.458 E.16332
G1 X121.981 Y134.458 E.00776
G1 X130.037 Y126.402 E.15235
G1 X130.037 Y126.982 E.00776
G1 X122.561 Y134.458 E.14138
G1 X123.141 Y134.458 E.00776
G1 X130.037 Y127.563 E.1304
G1 X130.037 Y128.143 E.00776
G1 X123.722 Y134.458 E.11943
G1 X124.302 Y134.458 E.00776
G1 X130.037 Y128.723 E.10846
G1 X130.037 Y129.303 E.00776
G1 X124.882 Y134.458 E.09749
G1 X125.462 Y134.458 E.00776
G1 X130.037 Y129.883 E.08651
G1 X130.037 Y130.464 E.00776
G1 X126.043 Y134.458 E.07554
G1 X126.623 Y134.458 E.00776
G1 X130.037 Y131.044 E.06457
G1 X130.037 Y131.624 E.00776
G1 X127.203 Y134.458 E.05359
G1 X127.783 Y134.458 E.00776
G1 X130.037 Y132.204 E.04262
G1 X130.037 Y132.785 E.00776
G1 X128.363 Y134.458 E.03165
G1 X128.944 Y134.458 E.00776
G1 X130.037 Y133.365 E.02068
G1 X130.037 Y133.945 E.00776
G1 X129.343 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X130.037 Y133.945 E-.37312
G1 X130.037 Y133.365 E-.22048
G1 X129.727 Y133.674 E-.1664
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/88
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.44 I-.067 J1.215 P1  F30000
G1 X150.834 Y134.834 Z2.44
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X117.166 Y134.834 E.52987
G1 X117.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.52987
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X116.683 Y135.317 E.54507
G1 X116.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.54507
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.095 Z2.52 F30000
G1 X150.638 Y118.248 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X149.947 Y117.557 E.01379
G1 X149.327 Y117.557 E.00874
G1 X150.443 Y118.673 E.02226
G1 X150.443 Y119.292 E.00874
G1 X148.708 Y117.557 E.03462
G1 X148.088 Y117.557 E.00874
G1 X150.443 Y119.912 E.04698
G1 X150.443 Y120.531 E.00874
G1 X147.469 Y117.557 E.05934
G1 X146.849 Y117.557 E.00874
G1 X150.443 Y121.151 E.0717
G1 X150.443 Y121.77 E.00874
G1 X146.23 Y117.557 E.08406
G1 X145.611 Y117.557 E.00874
G1 X150.443 Y122.389 E.09642
G1 X150.443 Y123.009 E.00874
G1 X144.991 Y117.557 E.10877
G1 X144.372 Y117.557 E.00874
G1 X150.443 Y123.628 E.12113
G1 X150.443 Y124.248 E.00874
G1 X143.752 Y117.557 E.13349
G1 X143.133 Y117.557 E.00874
G1 X150.443 Y124.867 E.14585
G1 X150.443 Y125.487 E.00874
G1 X142.513 Y117.557 E.15821
G1 X141.894 Y117.557 E.00874
G1 X150.443 Y126.106 E.17057
G1 X150.443 Y126.725 E.00874
G1 X141.275 Y117.557 E.18293
G1 X140.655 Y117.557 E.00874
G1 X150.443 Y127.345 E.19529
G1 X150.443 Y127.964 E.00874
G1 X140.036 Y117.557 E.20764
G1 X139.416 Y117.557 E.00874
G1 X150.443 Y128.584 E.22
G1 X150.443 Y129.203 E.00874
G1 X138.797 Y117.557 E.23236
G1 X138.177 Y117.557 E.00874
G1 X150.443 Y129.823 E.24472
G1 X150.443 Y130.442 E.00874
G1 X137.558 Y117.557 E.25708
G1 X136.939 Y117.557 E.00874
G1 X150.443 Y131.061 E.26944
G1 X150.443 Y131.681 E.00874
G1 X136.319 Y117.557 E.2818
G1 X135.7 Y117.557 E.00874
G1 X150.443 Y132.3 E.29416
G1 X150.443 Y132.92 E.00874
G1 X135.08 Y117.557 E.30651
G1 X134.461 Y117.557 E.00874
G1 X150.443 Y133.539 E.31887
G1 X150.443 Y134.158 E.00874
G1 X133.842 Y117.557 E.33123
G1 X133.222 Y117.557 E.00874
G1 X150.108 Y134.443 E.33691
G1 X149.489 Y134.443 E.00874
G1 X132.603 Y117.557 E.33691
G1 X131.983 Y117.557 E.00874
G1 X148.869 Y134.443 E.33691
G1 X148.25 Y134.443 E.00874
G1 X131.364 Y117.557 E.33691
G1 X130.744 Y117.557 E.00874
G1 X147.63 Y134.443 E.33691
G1 X147.011 Y134.443 E.00874
G1 X130.455 Y117.887 E.33033
G1 X130.455 Y118.506 E.00874
G1 X146.392 Y134.443 E.31797
G1 X145.772 Y134.443 E.00874
G1 X130.455 Y119.126 E.30561
G1 X130.455 Y119.745 E.00874
G1 X145.153 Y134.443 E.29325
G1 X144.533 Y134.443 E.00874
G1 X130.455 Y120.364 E.28089
G1 X130.455 Y120.984 E.00874
G1 X143.914 Y134.443 E.26853
G1 X143.294 Y134.443 E.00874
G1 X130.455 Y121.603 E.25618
G1 X130.455 Y122.223 E.00874
G1 X142.675 Y134.443 E.24382
G1 X142.056 Y134.443 E.00874
G1 X130.455 Y122.842 E.23146
G1 X130.455 Y123.462 E.00874
G1 X141.436 Y134.443 E.2191
G1 X140.817 Y134.443 E.00874
G1 X130.455 Y124.081 E.20674
G1 X130.455 Y124.7 E.00874
G1 X140.197 Y134.443 E.19438
G1 X139.578 Y134.443 E.00874
G1 X130.455 Y125.32 E.18202
G1 X130.455 Y125.939 E.00874
G1 X138.958 Y134.443 E.16966
G1 X138.339 Y134.443 E.00874
G1 X130.455 Y126.559 E.15731
G1 X130.455 Y127.178 E.00874
G1 X137.72 Y134.443 E.14495
M73 P59 R11
G1 X137.1 Y134.443 E.00874
G1 X130.455 Y127.798 E.13259
G1 X130.455 Y128.417 E.00874
G1 X136.481 Y134.443 E.12023
G1 X135.861 Y134.443 E.00874
G1 X130.455 Y129.036 E.10787
G1 X130.455 Y129.656 E.00874
G1 X135.242 Y134.443 E.09551
G1 X134.622 Y134.443 E.00874
G1 X130.455 Y130.275 E.08315
G1 X130.455 Y130.895 E.00874
G1 X134.003 Y134.443 E.07079
G1 X133.384 Y134.443 E.00874
G1 X130.455 Y131.514 E.05844
G1 X130.455 Y132.134 E.00874
G1 X132.764 Y134.443 E.04608
G1 X132.145 Y134.443 E.00874
G1 X130.455 Y132.753 E.03372
G1 X130.455 Y133.372 E.00874
G1 X131.525 Y134.443 E.02136
G1 X130.906 Y134.443 E.00874
G1 X130.26 Y133.797 E.01289
G1 X118.191 Y134.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427438
G1 F21000
G1 X117.542 Y133.991 E.01227
G1 X117.542 Y133.41 E.00776
G1 X118.59 Y134.458 E.01981
G1 X119.17 Y134.458 E.00776
G1 X117.542 Y132.83 E.03079
G1 X117.542 Y132.25 E.00776
G1 X119.75 Y134.458 E.04176
G1 X120.33 Y134.458 E.00776
G1 X117.542 Y131.67 E.05273
G1 X117.542 Y131.089 E.00776
G1 X120.911 Y134.458 E.0637
G1 X121.491 Y134.458 E.00776
G1 X117.542 Y130.509 E.07468
G1 X117.542 Y129.929 E.00776
G1 X122.071 Y134.458 E.08565
G1 X122.651 Y134.458 E.00776
G1 X117.542 Y129.349 E.09662
G1 X117.542 Y128.769 E.00776
G1 X123.231 Y134.458 E.1076
G1 X123.812 Y134.458 E.00776
G1 X117.542 Y128.188 E.11857
G1 X117.542 Y127.608 E.00776
G1 X124.392 Y134.458 E.12954
G1 X124.972 Y134.458 E.00776
G1 X117.542 Y127.028 E.14051
G1 X117.542 Y126.448 E.00776
G1 X125.552 Y134.458 E.15149
G1 X126.132 Y134.458 E.00776
G1 X117.542 Y125.868 E.16246
G1 X117.542 Y125.287 E.00776
G1 X126.713 Y134.458 E.17343
G1 X127.293 Y134.458 E.00776
G1 X117.542 Y124.707 E.18441
G1 X117.542 Y124.127 E.00776
G1 X127.873 Y134.458 E.19538
G1 X128.453 Y134.458 E.00776
G1 X117.542 Y123.547 E.20635
G1 X117.542 Y122.967 E.00776
G1 X129.033 Y134.458 E.21732
G1 X129.614 Y134.458 E.00776
G1 X117.542 Y122.386 E.2283
G1 X117.542 Y121.806 E.00776
G1 X130.037 Y134.301 E.2363
G1 X130.037 Y133.721 E.00776
G1 X117.542 Y121.226 E.2363
G1 X117.542 Y120.646 E.00776
G1 X130.037 Y133.14 E.2363
G1 X130.037 Y132.56 E.00776
G1 X117.542 Y120.065 E.2363
G1 X117.542 Y119.485 E.00776
G1 X130.037 Y131.98 E.2363
G1 X130.037 Y131.4 E.00776
G1 X117.542 Y118.905 E.2363
G1 X117.542 Y118.325 E.00776
G1 X130.037 Y130.82 E.2363
G1 X130.037 Y130.239 E.00776
G1 X117.542 Y117.745 E.2363
G1 X117.542 Y117.542 E.00271
G1 X117.92 Y117.542 E.00505
G1 X130.037 Y129.659 E.22916
G1 X130.037 Y129.079 E.00776
G1 X118.5 Y117.542 E.21819
G1 X119.08 Y117.542 E.00776
G1 X130.037 Y128.499 E.20721
G1 X130.037 Y127.919 E.00776
G1 X119.66 Y117.542 E.19624
G1 X120.24 Y117.542 E.00776
G1 X130.037 Y127.338 E.18527
G1 X130.037 Y126.758 E.00776
G1 X120.821 Y117.542 E.1743
G1 X121.401 Y117.542 E.00776
G1 X130.037 Y126.178 E.16332
G1 X130.037 Y125.598 E.00776
G1 X121.981 Y117.542 E.15235
G1 X122.561 Y117.542 E.00776
G1 X130.037 Y125.018 E.14138
G1 X130.037 Y124.437 E.00776
G1 X123.141 Y117.542 E.1304
G1 X123.722 Y117.542 E.00776
G1 X130.037 Y123.857 E.11943
G1 X130.037 Y123.277 E.00776
G1 X124.302 Y117.542 E.10846
G1 X124.882 Y117.542 E.00776
G1 X130.037 Y122.697 E.09749
G1 X130.037 Y122.117 E.00776
G1 X125.462 Y117.542 E.08651
G1 X126.043 Y117.542 E.00776
G1 X130.037 Y121.536 E.07554
G1 X130.037 Y120.956 E.00776
G1 X126.623 Y117.542 E.06457
G1 X127.203 Y117.542 E.00776
G1 X130.037 Y120.376 E.05359
G1 X130.037 Y119.796 E.00776
G1 X127.783 Y117.542 E.04262
G1 X128.363 Y117.542 E.00776
G1 X130.037 Y119.215 E.03165
G1 X130.037 Y118.635 E.00776
G1 X128.944 Y117.542 E.02068
G1 X129.524 Y117.542 E.00776
G1 X130.218 Y118.236 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F21000
G1 X129.524 Y117.542 E-.37312
G1 X128.944 Y117.542 E-.22048
G1 X129.253 Y117.852 E-.1664
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/88
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.52 I-.753 J.956 P1  F30000
G1 X150.834 Y134.834 Z2.52
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.979 Y134.834 E.32822
G1 X129.979 Y117.166 E.27807
G1 X150.834 Y117.166 E.32822
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X129.496 Y135.317 E.34342
G1 X129.496 Y116.683 E.29327
G1 X151.317 Y116.683 E.34342
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X116.225 Y135.775 E.50154
G1 X116.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.50154
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.751 Y134.638 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X150.443 Y133.946 E.01381
G1 X150.443 Y133.326 E.00875
G1 X149.326 Y134.443 E.02229
G1 X148.706 Y134.443 E.00875
G1 X150.443 Y132.706 E.03467
G1 X150.443 Y132.085 E.00875
G1 X148.085 Y134.443 E.04704
G1 X147.465 Y134.443 E.00875
G1 X150.443 Y131.465 E.05941
G1 X150.443 Y130.845 E.00875
G1 X146.845 Y134.443 E.07178
G1 X146.225 Y134.443 E.00875
G1 X150.443 Y130.225 E.08415
G1 X150.443 Y129.605 E.00875
G1 X145.605 Y134.443 E.09652
G1 X144.985 Y134.443 E.00875
G1 X150.443 Y128.985 E.10889
G1 X150.443 Y128.365 E.00875
G1 X144.365 Y134.443 E.12127
G1 X143.745 Y134.443 E.00875
G1 X150.443 Y127.745 E.13364
G1 X150.443 Y127.125 E.00875
G1 X143.125 Y134.443 E.14601
G1 X142.505 Y134.443 E.00875
G1 X150.443 Y126.505 E.15838
G1 X150.443 Y125.885 E.00875
G1 X141.885 Y134.443 E.17075
G1 X141.265 Y134.443 E.00875
G1 X150.443 Y125.265 E.18312
G1 X150.443 Y124.645 E.00875
G1 X140.645 Y134.443 E.19549
G1 X140.025 Y134.443 E.00875
G1 X150.443 Y124.025 E.20787
G1 X150.443 Y123.405 E.00875
G1 X139.405 Y134.443 E.22024
G1 X138.785 Y134.443 E.00875
G1 X150.443 Y122.785 E.23261
G1 X150.443 Y122.164 E.00875
G1 X138.164 Y134.443 E.24498
G1 X137.544 Y134.443 E.00875
G1 X150.443 Y121.544 E.25735
G1 X150.443 Y120.924 E.00875
G1 X136.924 Y134.443 E.26972
G1 X136.304 Y134.443 E.00875
G1 X150.443 Y120.304 E.28209
G1 X150.443 Y119.684 E.00875
G1 X135.684 Y134.443 E.29447
G1 X135.064 Y134.443 E.00875
G1 X150.443 Y119.064 E.30684
G1 X150.443 Y118.444 E.00875
G1 X134.444 Y134.443 E.31921
G1 X133.824 Y134.443 E.00875
G1 X150.443 Y117.824 E.33158
G1 X150.443 Y117.557 E.00377
G1 X150.09 Y117.557 E.00498
G1 X133.204 Y134.443 E.33691
G1 X132.584 Y134.443 E.00875
G1 X149.47 Y117.557 E.33691
G1 X148.85 Y117.557 E.00875
G1 X131.964 Y134.443 E.33691
G1 X131.344 Y134.443 E.00875
G1 X148.23 Y117.557 E.33691
G1 X147.61 Y117.557 E.00875
G1 X130.724 Y134.443 E.33691
G1 X130.37 Y134.443 E.00499
G1 X130.37 Y134.177 E.00376
G1 X146.99 Y117.557 E.33159
G1 X146.37 Y117.557 E.00875
G1 X130.37 Y133.557 E.31922
G1 X130.37 Y132.936 E.00875
G1 X145.75 Y117.557 E.30685
G1 X145.129 Y117.557 E.00875
G1 X130.37 Y132.316 E.29448
G1 X130.37 Y131.696 E.00875
G1 X144.509 Y117.557 E.28211
G1 X143.889 Y117.557 E.00875
G1 X130.37 Y131.076 E.26974
G1 X130.37 Y130.456 E.00875
G1 X143.269 Y117.557 E.25736
G1 X142.649 Y117.557 E.00875
G1 X130.37 Y129.836 E.24499
G1 X130.37 Y129.216 E.00875
G1 X142.029 Y117.557 E.23262
G1 X141.409 Y117.557 E.00875
G1 X130.37 Y128.596 E.22025
G1 X130.37 Y127.976 E.00875
G1 X140.789 Y117.557 E.20788
G1 X140.169 Y117.557 E.00875
G1 X130.37 Y127.356 E.19551
G1 X130.37 Y126.736 E.00875
G1 X139.549 Y117.557 E.18314
G1 X138.929 Y117.557 E.00875
G1 X130.37 Y126.116 E.17076
G1 X130.37 Y125.496 E.00875
G1 X138.309 Y117.557 E.15839
G1 X137.689 Y117.557 E.00875
G1 X130.37 Y124.876 E.14602
G1 X130.37 Y124.256 E.00875
G1 X137.069 Y117.557 E.13365
G1 X136.449 Y117.557 E.00875
G1 X130.37 Y123.636 E.12128
G1 X130.37 Y123.015 E.00875
G1 X135.829 Y117.557 E.10891
G1 X135.208 Y117.557 E.00875
G1 X130.37 Y122.395 E.09654
G1 X130.37 Y121.775 E.00875
G1 X134.588 Y117.557 E.08416
G1 X133.968 Y117.557 E.00875
G1 X130.37 Y121.155 E.07179
G1 X130.37 Y120.535 E.00875
G1 X133.348 Y117.557 E.05942
G1 X132.728 Y117.557 E.00875
G1 X130.37 Y119.915 E.04705
G1 X130.37 Y119.295 E.00875
G1 X132.108 Y117.557 E.03468
G1 X131.488 Y117.557 E.00875
G1 X130.37 Y118.675 E.02231
G1 X130.37 Y118.055 E.00875
G1 X131.063 Y117.362 E.01382
; WIPE_START
G1 X130.37 Y118.055 E-.37228
G1 X130.37 Y118.675 E-.23562
G1 X130.653 Y118.392 E-.1521
; WIPE_END
G1 E-.04 F1800
G1 X129.672 Y125.961 Z2.6 F30000
G1 X128.431 Y135.538 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X129.234 Y134.735 E.01491
G1 X129.234 Y134.166
G1 X127.861 Y135.538 E.02549
G1 X127.292 Y135.538
G1 X129.234 Y133.596 E.03607
G1 X129.234 Y133.026
G1 X126.722 Y135.538 E.04665
G1 X126.152 Y135.538
G1 X129.234 Y132.457 E.05723
G1 X129.234 Y131.887
G1 X125.583 Y135.538 E.06781
G1 X125.013 Y135.538
G1 X129.234 Y131.317 E.07838
G1 X129.234 Y130.748
G1 X124.443 Y135.538 E.08896
G1 X123.874 Y135.538
G1 X129.234 Y130.178 E.09954
G1 X129.234 Y129.608
G1 X123.304 Y135.538 E.11012
G1 X122.734 Y135.538
M73 P60 R11
G1 X129.234 Y129.038 E.1207
G1 X129.234 Y128.469
G1 X122.164 Y135.538 E.13128
G1 X121.595 Y135.538
G1 X129.234 Y127.899 E.14186
G1 X129.234 Y127.329
G1 X121.025 Y135.538 E.15243
G1 X120.455 Y135.538
G1 X129.234 Y126.76 E.16301
G1 X129.234 Y126.19
G1 X119.886 Y135.538 E.17359
G1 X119.316 Y135.538
G1 X129.234 Y125.62 E.18417
G1 X129.234 Y125.051
G1 X118.746 Y135.538 E.19475
G1 X118.177 Y135.538
G1 X129.234 Y124.481 E.20533
G1 X129.234 Y123.911
G1 X117.607 Y135.538 E.21591
G1 X117.037 Y135.538
G1 X129.234 Y123.342 E.22648
G1 X129.234 Y122.772
G1 X116.468 Y135.538 E.23706
G1 X116.462 Y134.975
G1 X129.234 Y122.202 E.23717
G1 X129.234 Y121.633
G1 X116.462 Y134.405 E.23717
G1 X116.462 Y133.835
G1 X129.234 Y121.063 E.23717
G1 X129.234 Y120.493
G1 X116.462 Y133.266 E.23717
G1 X116.462 Y132.696
G1 X129.234 Y119.923 E.23717
G1 X129.234 Y119.354
G1 X116.462 Y132.126 E.23717
G1 X116.462 Y131.557
G1 X129.234 Y118.784 E.23717
G1 X129.234 Y118.214
G1 X116.462 Y130.987 E.23717
G1 X116.462 Y130.417
G1 X129.234 Y117.645 E.23717
G1 X129.234 Y117.075
G1 X116.462 Y129.848 E.23717
G1 X116.462 Y129.278
G1 X129.234 Y116.505 E.23717
G1 X128.708 Y116.462
G1 X116.462 Y128.708 E.22741
G1 X116.462 Y128.139
G1 X128.139 Y116.462 E.21683
G1 X127.569 Y116.462
G1 X116.462 Y127.569 E.20625
G1 X116.462 Y126.999
G1 X126.999 Y116.462 E.19567
G1 X126.429 Y116.462
G1 X116.462 Y126.429 E.18509
G1 X116.462 Y125.86
G1 X125.86 Y116.462 E.17452
G1 X125.29 Y116.462
G1 X116.462 Y125.29 E.16394
G1 X116.462 Y124.72
G1 X124.72 Y116.462 E.15336
G1 X124.151 Y116.462
G1 X116.462 Y124.151 E.14278
G1 X116.462 Y123.581
G1 X123.581 Y116.462 E.1322
G1 X123.011 Y116.462
G1 X116.462 Y123.011 E.12162
G1 X116.462 Y122.442
G1 X122.442 Y116.462 E.11104
G1 X121.872 Y116.462
G1 X116.462 Y121.872 E.10047
G1 X116.462 Y121.302
G1 X121.302 Y116.462 E.08989
G1 X120.733 Y116.462
G1 X116.462 Y120.733 E.07931
G1 X116.462 Y120.163
G1 X120.163 Y116.462 E.06873
G1 X119.593 Y116.462
G1 X116.462 Y119.593 E.05815
M73 P60 R10
G1 X116.462 Y119.024
G1 X119.024 Y116.462 E.04757
G1 X118.454 Y116.462
G1 X116.462 Y118.454 E.037
G1 X116.462 Y117.884
G1 X117.884 Y116.462 E.02642
G1 X117.314 Y116.462
G1 X116.462 Y117.314 E.01584
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F1800
M204 S10000
G1 X117.314 Y116.462 E-.45836
G1 X117.884 Y116.462 E-.21648
G1 X117.726 Y116.62 E-.08515
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 27/88
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.6 I-.587 J1.066 P1  F30000
G1 X150.834 Y134.834 Z2.6
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
M73 P61 R10
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.097 Z2.68 F30000
G1 X150.638 Y118.248 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15984
G1 X149.947 Y117.557 E.01379
G1 X149.327 Y117.557 E.00874
G1 X150.443 Y118.673 E.02226
G1 X150.443 Y119.292 E.00874
G1 X148.708 Y117.557 E.03462
G1 X148.088 Y117.557 E.00874
G1 X150.443 Y119.912 E.04698
G1 X150.443 Y120.531 E.00874
G1 X147.469 Y117.557 E.05934
G1 X146.849 Y117.557 E.00874
G1 X150.443 Y121.151 E.0717
G1 X150.443 Y121.77 E.00874
G1 X146.23 Y117.557 E.08406
G1 X145.611 Y117.557 E.00874
G1 X150.443 Y122.389 E.09642
G1 X150.443 Y123.009 E.00874
G1 X144.991 Y117.557 E.10877
G1 X144.372 Y117.557 E.00874
G1 X150.443 Y123.628 E.12113
G1 X150.443 Y124.248 E.00874
G1 X143.752 Y117.557 E.13349
G1 X143.133 Y117.557 E.00874
G1 X150.443 Y124.867 E.14585
G1 X150.443 Y125.487 E.00874
G1 X142.513 Y117.557 E.15821
G1 X141.894 Y117.557 E.00874
G1 X150.443 Y126.106 E.17057
G1 X150.443 Y126.725 E.00874
G1 X141.275 Y117.557 E.18293
G1 X140.655 Y117.557 E.00874
G1 X150.443 Y127.345 E.19529
G1 X150.443 Y127.964 E.00874
G1 X140.036 Y117.557 E.20764
G1 X139.416 Y117.557 E.00874
G1 X150.443 Y128.584 E.22
G1 X150.443 Y129.203 E.00874
G1 X138.797 Y117.557 E.23236
G1 X138.177 Y117.557 E.00874
G1 X150.443 Y129.823 E.24472
G1 X150.443 Y130.442 E.00874
G1 X137.558 Y117.557 E.25708
G1 X136.939 Y117.557 E.00874
G1 X150.443 Y131.061 E.26944
G1 X150.443 Y131.681 E.00874
G1 X136.319 Y117.557 E.2818
G1 X135.7 Y117.557 E.00874
G1 X150.443 Y132.3 E.29416
G1 X150.443 Y132.92 E.00874
G1 X135.08 Y117.557 E.30651
G1 X134.461 Y117.557 E.00874
G1 X150.443 Y133.539 E.31887
G1 X150.443 Y134.158 E.00874
G1 X133.842 Y117.557 E.33123
G1 X133.222 Y117.557 E.00874
G1 X150.108 Y134.443 E.33691
G1 X149.489 Y134.443 E.00874
G1 X132.603 Y117.557 E.33691
G1 X131.983 Y117.557 E.00874
G1 X148.869 Y134.443 E.33691
G1 X148.25 Y134.443 E.00874
G1 X131.364 Y117.557 E.33691
G1 X130.744 Y117.557 E.00874
G1 X147.63 Y134.443 E.33691
G1 X147.011 Y134.443 E.00874
G1 X130.455 Y117.887 E.33033
G1 X130.455 Y118.506 E.00874
G1 X146.392 Y134.443 E.31797
G1 X145.772 Y134.443 E.00874
G1 X130.455 Y119.126 E.30561
G1 X130.455 Y119.745 E.00874
G1 X145.153 Y134.443 E.29325
G1 X144.533 Y134.443 E.00874
G1 X130.455 Y120.364 E.28089
G1 X130.455 Y120.984 E.00874
G1 X143.914 Y134.443 E.26853
G1 X143.294 Y134.443 E.00874
G1 X130.455 Y121.603 E.25618
G1 X130.455 Y122.223 E.00874
G1 X142.675 Y134.443 E.24382
G1 X142.056 Y134.443 E.00874
G1 X130.455 Y122.842 E.23146
G1 X130.455 Y123.462 E.00874
G1 X141.436 Y134.443 E.2191
G1 X140.817 Y134.443 E.00874
G1 X130.455 Y124.081 E.20674
G1 X130.455 Y124.7 E.00874
G1 X140.197 Y134.443 E.19438
G1 X139.578 Y134.443 E.00874
G1 X130.455 Y125.32 E.18202
G1 X130.455 Y125.939 E.00874
G1 X138.958 Y134.443 E.16966
G1 X138.339 Y134.443 E.00874
G1 X130.455 Y126.559 E.15731
G1 X130.455 Y127.178 E.00874
G1 X137.72 Y134.443 E.14495
G1 X137.1 Y134.443 E.00874
G1 X130.455 Y127.798 E.13259
G1 X130.455 Y128.417 E.00874
G1 X136.481 Y134.443 E.12023
G1 X135.861 Y134.443 E.00874
G1 X130.455 Y129.036 E.10787
G1 X130.455 Y129.656 E.00874
G1 X135.242 Y134.443 E.09551
G1 X134.622 Y134.443 E.00874
G1 X130.455 Y130.275 E.08315
G1 X130.455 Y130.895 E.00874
G1 X134.003 Y134.443 E.07079
G1 X133.384 Y134.443 E.00874
G1 X130.455 Y131.514 E.05844
G1 X130.455 Y132.134 E.00874
G1 X132.764 Y134.443 E.04608
G1 X132.145 Y134.443 E.00874
G1 X130.455 Y132.753 E.03372
G1 X130.455 Y133.372 E.00874
G1 X131.525 Y134.443 E.02136
G1 X130.906 Y134.443 E.00874
G1 X130.26 Y133.797 E.01289
G1 X130.031 Y117.823 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432788
G1 F15984
G1 X130.031 Y117.615 E.00282
G1 X129.615 Y117.615 E.00563
G1 X129.615 Y134.385 E.22719
G1 X130.031 Y134.385 E.00563
G1 X130.031 Y117.883 E.22356
; CHANGE_LAYER
; Z_HEIGHT: 2.36
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F16800
G1 X130.031 Y119.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/88
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.68 I-.71 J.988 P1  F30000
G1 X150.834 Y134.834 Z2.68
G1 Z2.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15279
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.611 E.00874
G1 X145.611 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10877
G1 X150.443 Y128.372 E.00874
G1 X144.372 Y134.443 E.12113
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.13349
G1 X150.443 Y127.133 E.00874
G1 X143.133 Y134.443 E.14585
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15821
G1 X150.443 Y125.894 E.00874
G1 X141.894 Y134.443 E.17057
G1 X141.275 Y134.443 E.00874
G1 X150.443 Y125.275 E.18293
M73 P62 R10
G1 X150.443 Y124.655 E.00874
G1 X140.655 Y134.443 E.19528
G1 X140.036 Y134.443 E.00874
G1 X150.443 Y124.036 E.20764
G1 X150.443 Y123.416 E.00874
G1 X139.416 Y134.443 E.22
G1 X138.797 Y134.443 E.00874
G1 X150.443 Y122.797 E.23236
G1 X150.443 Y122.177 E.00874
G1 X138.177 Y134.443 E.24472
G1 X137.558 Y134.443 E.00874
G1 X150.443 Y121.558 E.25708
G1 X150.443 Y120.939 E.00874
G1 X136.939 Y134.443 E.26944
G1 X136.319 Y134.443 E.00874
G1 X150.443 Y120.319 E.2818
G1 X150.443 Y119.7 E.00874
G1 X135.7 Y134.443 E.29415
G1 X135.08 Y134.443 E.00874
G1 X150.443 Y119.08 E.30651
G1 X150.443 Y118.461 E.00874
G1 X134.461 Y134.443 E.31887
G1 X133.842 Y134.443 E.00874
G1 X150.443 Y117.842 E.33123
G1 X150.443 Y117.557 E.00401
G1 X150.108 Y117.557 E.00472
G1 X133.222 Y134.443 E.33691
G1 X132.603 Y134.443 E.00874
G1 X149.489 Y117.557 E.33691
G1 X148.869 Y117.557 E.00874
G1 X131.983 Y134.443 E.33691
G1 X131.364 Y134.443 E.00874
G1 X148.25 Y117.557 E.33691
G1 X147.63 Y117.557 E.00874
G1 X130.744 Y134.443 E.33691
G1 X130.455 Y134.443 E.00409
G1 X130.455 Y134.113 E.00465
G1 X147.011 Y117.557 E.33033
G1 X146.392 Y117.557 E.00874
G1 X130.455 Y133.494 E.31797
G1 X130.455 Y132.874 E.00874
G1 X145.772 Y117.557 E.30561
G1 X145.153 Y117.557 E.00874
G1 X130.455 Y132.255 E.29325
G1 X130.455 Y131.635 E.00874
G1 X144.533 Y117.557 E.28089
G1 X143.914 Y117.557 E.00874
G1 X130.455 Y131.016 E.26853
G1 X130.455 Y130.397 E.00874
G1 X143.294 Y117.557 E.25618
G1 X142.675 Y117.557 E.00874
G1 X130.455 Y129.777 E.24382
G1 X130.455 Y129.158 E.00874
G1 X142.056 Y117.557 E.23146
G1 X141.436 Y117.557 E.00874
G1 X130.455 Y128.538 E.2191
G1 X130.455 Y127.919 E.00874
G1 X140.817 Y117.557 E.20674
G1 X140.197 Y117.557 E.00874
G1 X130.455 Y127.3 E.19438
G1 X130.455 Y126.68 E.00874
G1 X139.578 Y117.557 E.18202
G1 X138.958 Y117.557 E.00874
G1 X130.455 Y126.061 E.16966
G1 X130.455 Y125.441 E.00874
G1 X138.339 Y117.557 E.15731
G1 X137.72 Y117.557 E.00874
G1 X130.455 Y124.822 E.14495
G1 X130.455 Y124.202 E.00874
G1 X137.1 Y117.557 E.13259
G1 X136.481 Y117.557 E.00874
G1 X130.455 Y123.583 E.12023
G1 X130.455 Y122.964 E.00874
G1 X135.861 Y117.557 E.10787
G1 X135.242 Y117.557 E.00874
G1 X130.455 Y122.344 E.09551
G1 X130.455 Y121.725 E.00874
G1 X134.622 Y117.557 E.08315
G1 X134.003 Y117.557 E.00874
G1 X130.455 Y121.105 E.07079
G1 X130.455 Y120.486 E.00874
G1 X133.384 Y117.557 E.05844
G1 X132.764 Y117.557 E.00874
G1 X130.455 Y119.866 E.04608
G1 X130.455 Y119.247 E.00874
G1 X132.145 Y117.557 E.03372
G1 X131.525 Y117.557 E.00874
G1 X130.455 Y118.628 E.02136
G1 X130.455 Y118.008 E.00874
G1 X131.101 Y117.362 E.01289
G1 X130.031 Y117.823 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432788
G1 F15279
G1 X130.031 Y117.615 E.00282
G1 X129.615 Y117.615 E.00563
G1 X129.615 Y134.385 E.22719
G1 X130.031 Y134.385 E.00563
G1 X130.031 Y117.883 E.22356
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F16800
G1 X130.031 Y119.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/88
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.76 I-.71 J.988 P1  F30000
G1 X150.834 Y134.834 Z2.76
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.097 Z2.84 F30000
G1 X150.638 Y118.248 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15572
G1 X149.947 Y117.557 E.01379
G1 X149.327 Y117.557 E.00874
G1 X150.443 Y118.673 E.02226
G1 X150.443 Y119.292 E.00874
G1 X148.708 Y117.557 E.03462
G1 X148.088 Y117.557 E.00874
G1 X150.443 Y119.912 E.04698
G1 X150.443 Y120.531 E.00874
G1 X147.469 Y117.557 E.05934
G1 X146.849 Y117.557 E.00874
G1 X150.443 Y121.151 E.0717
G1 X150.443 Y121.77 E.00874
G1 X146.23 Y117.557 E.08406
G1 X145.611 Y117.557 E.00874
G1 X150.443 Y122.389 E.09642
G1 X150.443 Y123.009 E.00874
G1 X144.991 Y117.557 E.10877
G1 X144.372 Y117.557 E.00874
G1 X150.443 Y123.628 E.12113
G1 X150.443 Y124.248 E.00874
G1 X143.752 Y117.557 E.13349
G1 X143.133 Y117.557 E.00874
G1 X150.443 Y124.867 E.14585
G1 X150.443 Y125.487 E.00874
G1 X142.513 Y117.557 E.15821
G1 X141.894 Y117.557 E.00874
G1 X150.443 Y126.106 E.17057
G1 X150.443 Y126.725 E.00874
G1 X141.275 Y117.557 E.18293
G1 X140.655 Y117.557 E.00874
G1 X150.443 Y127.345 E.19529
G1 X150.443 Y127.964 E.00874
G1 X140.036 Y117.557 E.20764
G1 X139.416 Y117.557 E.00874
G1 X150.443 Y128.584 E.22
G1 X150.443 Y129.203 E.00874
G1 X138.797 Y117.557 E.23236
G1 X138.177 Y117.557 E.00874
G1 X150.443 Y129.823 E.24472
G1 X150.443 Y130.442 E.00874
G1 X137.558 Y117.557 E.25708
G1 X136.939 Y117.557 E.00874
G1 X150.443 Y131.061 E.26944
G1 X150.443 Y131.681 E.00874
G1 X136.319 Y117.557 E.2818
G1 X135.7 Y117.557 E.00874
G1 X150.443 Y132.3 E.29416
G1 X150.443 Y132.92 E.00874
G1 X135.08 Y117.557 E.30651
G1 X134.461 Y117.557 E.00874
G1 X150.443 Y133.539 E.31887
G1 X150.443 Y134.158 E.00874
G1 X133.842 Y117.557 E.33123
G1 X133.222 Y117.557 E.00874
G1 X150.108 Y134.443 E.33691
G1 X149.489 Y134.443 E.00874
G1 X132.603 Y117.557 E.33691
G1 X131.983 Y117.557 E.00874
G1 X148.869 Y134.443 E.33691
G1 X148.25 Y134.443 E.00874
G1 X131.364 Y117.557 E.33691
G1 X130.744 Y117.557 E.00874
G1 X147.63 Y134.443 E.33691
G1 X147.011 Y134.443 E.00874
G1 X130.455 Y117.887 E.33033
G1 X130.455 Y118.506 E.00874
G1 X146.392 Y134.443 E.31797
G1 X145.772 Y134.443 E.00874
G1 X130.455 Y119.126 E.30561
G1 X130.455 Y119.745 E.00874
G1 X145.153 Y134.443 E.29325
G1 X144.533 Y134.443 E.00874
G1 X130.455 Y120.364 E.28089
G1 X130.455 Y120.984 E.00874
G1 X143.914 Y134.443 E.26853
G1 X143.294 Y134.443 E.00874
G1 X130.455 Y121.603 E.25618
G1 X130.455 Y122.223 E.00874
G1 X142.675 Y134.443 E.24382
G1 X142.056 Y134.443 E.00874
G1 X130.455 Y122.842 E.23146
G1 X130.455 Y123.462 E.00874
G1 X141.436 Y134.443 E.2191
G1 X140.817 Y134.443 E.00874
G1 X130.455 Y124.081 E.20674
G1 X130.455 Y124.7 E.00874
G1 X140.197 Y134.443 E.19438
G1 X139.578 Y134.443 E.00874
G1 X130.455 Y125.32 E.18202
G1 X130.455 Y125.939 E.00874
G1 X138.958 Y134.443 E.16966
G1 X138.339 Y134.443 E.00874
G1 X130.455 Y126.559 E.15731
G1 X130.455 Y127.178 E.00874
M73 P63 R10
G1 X137.72 Y134.443 E.14495
G1 X137.1 Y134.443 E.00874
G1 X130.455 Y127.798 E.13259
G1 X130.455 Y128.417 E.00874
G1 X136.481 Y134.443 E.12023
G1 X135.861 Y134.443 E.00874
G1 X130.455 Y129.036 E.10787
G1 X130.455 Y129.656 E.00874
G1 X135.242 Y134.443 E.09551
G1 X134.622 Y134.443 E.00874
G1 X130.455 Y130.275 E.08315
G1 X130.455 Y130.895 E.00874
G1 X134.003 Y134.443 E.07079
G1 X133.384 Y134.443 E.00874
G1 X130.455 Y131.514 E.05844
G1 X130.455 Y132.134 E.00874
G1 X132.764 Y134.443 E.04608
G1 X132.145 Y134.443 E.00874
G1 X130.455 Y132.753 E.03372
G1 X130.455 Y133.372 E.00874
G1 X131.525 Y134.443 E.02136
G1 X130.906 Y134.443 E.00874
G1 X130.26 Y133.797 E.01289
G1 X130.031 Y117.823 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432788
G1 F15572
G1 X130.031 Y117.615 E.00282
G1 X129.615 Y117.615 E.00563
G1 X129.615 Y134.385 E.22719
G1 X130.031 Y134.385 E.00563
G1 X130.031 Y117.883 E.22356
; CHANGE_LAYER
; Z_HEIGHT: 2.52
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F16800
G1 X130.031 Y119.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/88
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.84 I-.71 J.988 P1  F30000
G1 X150.834 Y134.834 Z2.84
G1 Z2.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z2.92 F30000
G1 Z2.52
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15279
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.611 E.00874
G1 X145.611 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10877
G1 X150.443 Y128.372 E.00874
G1 X144.372 Y134.443 E.12113
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.13349
G1 X150.443 Y127.133 E.00874
G1 X143.133 Y134.443 E.14585
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15821
G1 X150.443 Y125.894 E.00874
G1 X141.894 Y134.443 E.17057
G1 X141.275 Y134.443 E.00874
G1 X150.443 Y125.275 E.18293
G1 X150.443 Y124.655 E.00874
G1 X140.655 Y134.443 E.19528
G1 X140.036 Y134.443 E.00874
G1 X150.443 Y124.036 E.20764
G1 X150.443 Y123.416 E.00874
G1 X139.416 Y134.443 E.22
G1 X138.797 Y134.443 E.00874
G1 X150.443 Y122.797 E.23236
G1 X150.443 Y122.177 E.00874
G1 X138.177 Y134.443 E.24472
G1 X137.558 Y134.443 E.00874
G1 X150.443 Y121.558 E.25708
G1 X150.443 Y120.939 E.00874
G1 X136.939 Y134.443 E.26944
G1 X136.319 Y134.443 E.00874
G1 X150.443 Y120.319 E.2818
G1 X150.443 Y119.7 E.00874
G1 X135.7 Y134.443 E.29415
G1 X135.08 Y134.443 E.00874
G1 X150.443 Y119.08 E.30651
G1 X150.443 Y118.461 E.00874
G1 X134.461 Y134.443 E.31887
G1 X133.842 Y134.443 E.00874
G1 X150.443 Y117.842 E.33123
G1 X150.443 Y117.557 E.00401
G1 X150.108 Y117.557 E.00472
G1 X133.222 Y134.443 E.33691
G1 X132.603 Y134.443 E.00874
G1 X149.489 Y117.557 E.33691
G1 X148.869 Y117.557 E.00874
G1 X131.983 Y134.443 E.33691
G1 X131.364 Y134.443 E.00874
G1 X148.25 Y117.557 E.33691
G1 X147.63 Y117.557 E.00874
G1 X130.744 Y134.443 E.33691
G1 X130.455 Y134.443 E.00409
G1 X130.455 Y134.113 E.00465
G1 X147.011 Y117.557 E.33033
G1 X146.392 Y117.557 E.00874
G1 X130.455 Y133.494 E.31797
G1 X130.455 Y132.874 E.00874
G1 X145.772 Y117.557 E.30561
G1 X145.153 Y117.557 E.00874
G1 X130.455 Y132.255 E.29325
G1 X130.455 Y131.635 E.00874
G1 X144.533 Y117.557 E.28089
G1 X143.914 Y117.557 E.00874
G1 X130.455 Y131.016 E.26853
G1 X130.455 Y130.397 E.00874
G1 X143.294 Y117.557 E.25618
G1 X142.675 Y117.557 E.00874
G1 X130.455 Y129.777 E.24382
G1 X130.455 Y129.158 E.00874
G1 X142.056 Y117.557 E.23146
G1 X141.436 Y117.557 E.00874
G1 X130.455 Y128.538 E.2191
G1 X130.455 Y127.919 E.00874
G1 X140.817 Y117.557 E.20674
G1 X140.197 Y117.557 E.00874
G1 X130.455 Y127.3 E.19438
G1 X130.455 Y126.68 E.00874
G1 X139.578 Y117.557 E.18202
G1 X138.958 Y117.557 E.00874
G1 X130.455 Y126.061 E.16966
G1 X130.455 Y125.441 E.00874
G1 X138.339 Y117.557 E.15731
G1 X137.72 Y117.557 E.00874
G1 X130.455 Y124.822 E.14495
G1 X130.455 Y124.202 E.00874
G1 X137.1 Y117.557 E.13259
G1 X136.481 Y117.557 E.00874
G1 X130.455 Y123.583 E.12023
G1 X130.455 Y122.964 E.00874
G1 X135.861 Y117.557 E.10787
G1 X135.242 Y117.557 E.00874
G1 X130.455 Y122.344 E.09551
G1 X130.455 Y121.725 E.00874
G1 X134.622 Y117.557 E.08315
G1 X134.003 Y117.557 E.00874
G1 X130.455 Y121.105 E.07079
G1 X130.455 Y120.486 E.00874
G1 X133.384 Y117.557 E.05844
G1 X132.764 Y117.557 E.00874
G1 X130.455 Y119.866 E.04608
G1 X130.455 Y119.247 E.00874
G1 X132.145 Y117.557 E.03372
G1 X131.525 Y117.557 E.00874
G1 X130.455 Y118.628 E.02136
G1 X130.455 Y118.008 E.00874
G1 X131.101 Y117.362 E.01289
G1 X130.031 Y117.823 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432788
G1 F15279
G1 X130.031 Y117.615 E.00282
G1 X129.615 Y117.615 E.00563
G1 X129.615 Y134.385 E.22719
G1 X130.031 Y134.385 E.00563
G1 X130.031 Y117.883 E.22356
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F16800
G1 X130.031 Y119.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/88
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.92 I-.71 J.988 P1  F30000
G1 X150.834 Y134.834 Z2.92
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.097 Z3 F30000
G1 X150.638 Y118.239 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15590
G1 X149.956 Y117.557 E.01361
G1 X149.342 Y117.557 E.00865
G1 X150.443 Y118.657 E.02196
G1 X150.443 Y119.271 E.00865
G1 X148.729 Y117.557 E.03419
G1 X148.116 Y117.557 E.00865
G1 X150.443 Y119.884 E.04643
G1 X150.443 Y120.497 E.00865
G1 X147.503 Y117.557 E.05867
G1 X146.889 Y117.557 E.00865
G1 X150.443 Y121.111 E.0709
G1 X150.443 Y121.724 E.00865
G1 X146.276 Y117.557 E.08314
G1 X145.663 Y117.557 E.00865
G1 X150.443 Y122.337 E.09537
G1 X150.443 Y122.951 E.00865
G1 X145.049 Y117.557 E.10761
G1 X144.436 Y117.557 E.00865
G1 X150.443 Y123.564 E.11985
G1 X150.443 Y124.177 E.00865
G1 X143.823 Y117.557 E.13208
G1 X143.21 Y117.557 E.00865
G1 X150.443 Y124.79 E.14432
G1 X150.443 Y125.404 E.00865
G1 X142.596 Y117.557 E.15656
G1 X141.983 Y117.557 E.00865
G1 X150.443 Y126.017 E.16879
G1 X150.443 Y126.63 E.00865
G1 X141.37 Y117.557 E.18103
G1 X140.756 Y117.557 E.00865
G1 X150.443 Y127.244 E.19326
G1 X150.443 Y127.857 E.00865
G1 X140.143 Y117.557 E.2055
G1 X139.53 Y117.557 E.00865
G1 X150.443 Y128.47 E.21774
G1 X150.443 Y129.083 E.00865
G1 X138.917 Y117.557 E.22997
G1 X138.303 Y117.557 E.00865
G1 X150.443 Y129.697 E.24221
G1 X150.443 Y130.31 E.00865
M73 P64 R10
G1 X137.69 Y117.557 E.25445
G1 X137.077 Y117.557 E.00865
G1 X150.443 Y130.923 E.26668
G1 X150.443 Y131.537 E.00865
G1 X136.463 Y117.557 E.27892
G1 X135.85 Y117.557 E.00865
G1 X150.443 Y132.15 E.29115
G1 X150.443 Y132.763 E.00865
G1 X135.237 Y117.557 E.30339
G1 X134.624 Y117.557 E.00865
G1 X150.443 Y133.376 E.31563
G1 X150.443 Y133.99 E.00865
G1 X134.01 Y117.557 E.32786
G1 X133.397 Y117.557 E.00865
G1 X150.283 Y134.443 E.33691
G1 X149.67 Y134.443 E.00865
G1 X132.784 Y117.557 E.33691
G1 X132.17 Y117.557 E.00865
G1 X149.056 Y134.443 E.33691
G1 X148.443 Y134.443 E.00865
G1 X131.557 Y117.557 E.33691
G1 X130.944 Y117.557 E.00865
G1 X147.83 Y134.443 E.33691
G1 X147.217 Y134.443 E.00865
G1 X130.331 Y117.557 E.33691
G1 X129.717 Y117.557 E.00865
G1 X146.603 Y134.443 E.33691
G1 X145.99 Y134.443 E.00865
G1 X129.557 Y118.01 E.32787
G1 X129.557 Y118.623 E.00865
G1 X145.377 Y134.443 E.31563
G1 X144.763 Y134.443 E.00865
G1 X129.557 Y119.237 E.30339
G1 X129.557 Y119.85 E.00865
G1 X144.15 Y134.443 E.29116
G1 X143.537 Y134.443 E.00865
G1 X129.557 Y120.463 E.27892
G1 X129.557 Y121.077 E.00865
G1 X142.924 Y134.443 E.26669
M73 P64 R9
G1 X142.31 Y134.443 E.00865
G1 X129.557 Y121.69 E.25445
G1 X129.557 Y122.303 E.00865
G1 X141.697 Y134.443 E.24221
G1 X141.084 Y134.443 E.00865
G1 X129.557 Y122.916 E.22998
G1 X129.557 Y123.53 E.00865
G1 X140.47 Y134.443 E.21774
G1 X139.857 Y134.443 E.00865
G1 X129.557 Y124.143 E.2055
G1 X129.557 Y124.756 E.00865
G1 X139.244 Y134.443 E.19327
G1 X138.631 Y134.443 E.00865
G1 X129.557 Y125.37 E.18103
G1 X129.557 Y125.983 E.00865
G1 X138.017 Y134.443 E.1688
G1 X137.404 Y134.443 E.00865
G1 X129.557 Y126.596 E.15656
G1 X129.557 Y127.209 E.00865
G1 X136.791 Y134.443 E.14432
G1 X136.177 Y134.443 E.00865
G1 X129.557 Y127.823 E.13209
G1 X129.557 Y128.436 E.00865
G1 X135.564 Y134.443 E.11985
G1 X134.951 Y134.443 E.00865
G1 X129.557 Y129.049 E.10761
G1 X129.557 Y129.663 E.00865
G1 X134.338 Y134.443 E.09538
G1 X133.724 Y134.443 E.00865
G1 X129.557 Y130.276 E.08314
G1 X129.557 Y130.889 E.00865
G1 X133.111 Y134.443 E.07091
G1 X132.498 Y134.443 E.00865
G1 X129.557 Y131.502 E.05867
G1 X129.557 Y132.116 E.00865
G1 X131.884 Y134.443 E.04643
G1 X131.271 Y134.443 E.00865
G1 X129.557 Y132.729 E.0342
G1 X129.557 Y133.342 E.00865
G1 X130.658 Y134.443 E.02196
G1 X130.044 Y134.443 E.00865
G1 X129.362 Y133.761 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 2.68
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F20793.295
G1 X130.044 Y134.443 E-.3666
G1 X130.658 Y134.443 E-.23305
G1 X130.359 Y134.145 E-.16036
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/88
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3 I-.041 J1.216 P1  F30000
G1 X150.834 Y134.834 Z3
G1 Z2.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.761 Y134.638 Z3.08 F30000
G1 Z2.68
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15378
G1 X150.443 Y133.956 E.01361
G1 X150.443 Y133.342 E.00865
G1 X149.342 Y134.443 E.02196
G1 X148.729 Y134.443 E.00865
G1 X150.443 Y132.729 E.03419
G1 X150.443 Y132.116 E.00865
G1 X148.116 Y134.443 E.04643
G1 X147.503 Y134.443 E.00865
G1 X150.443 Y131.503 E.05867
G1 X150.443 Y130.889 E.00865
G1 X146.889 Y134.443 E.0709
G1 X146.276 Y134.443 E.00865
G1 X150.443 Y130.276 E.08314
G1 X150.443 Y129.663 E.00865
G1 X145.663 Y134.443 E.09537
G1 X145.049 Y134.443 E.00865
G1 X150.443 Y129.049 E.10761
G1 X150.443 Y128.436 E.00865
G1 X144.436 Y134.443 E.11985
G1 X143.823 Y134.443 E.00865
G1 X150.443 Y127.823 E.13208
G1 X150.443 Y127.21 E.00865
G1 X143.21 Y134.443 E.14432
G1 X142.596 Y134.443 E.00865
G1 X150.443 Y126.596 E.15656
G1 X150.443 Y125.983 E.00865
G1 X141.983 Y134.443 E.16879
G1 X141.37 Y134.443 E.00865
G1 X150.443 Y125.37 E.18103
G1 X150.443 Y124.756 E.00865
G1 X140.756 Y134.443 E.19326
G1 X140.143 Y134.443 E.00865
G1 X150.443 Y124.143 E.2055
G1 X150.443 Y123.53 E.00865
G1 X139.53 Y134.443 E.21774
G1 X138.917 Y134.443 E.00865
G1 X150.443 Y122.917 E.22997
G1 X150.443 Y122.303 E.00865
G1 X138.303 Y134.443 E.24221
G1 X137.69 Y134.443 E.00865
G1 X150.443 Y121.69 E.25445
G1 X150.443 Y121.077 E.00865
G1 X137.077 Y134.443 E.26668
G1 X136.463 Y134.443 E.00865
G1 X150.443 Y120.463 E.27892
G1 X150.443 Y119.85 E.00865
G1 X135.85 Y134.443 E.29115
G1 X135.237 Y134.443 E.00865
G1 X150.443 Y119.237 E.30339
G1 X150.443 Y118.624 E.00865
G1 X134.624 Y134.443 E.31563
G1 X134.01 Y134.443 E.00865
G1 X150.443 Y118.01 E.32786
G1 X150.443 Y117.557 E.0064
G1 X150.283 Y117.557 E.00226
G1 X133.397 Y134.443 E.33691
G1 X132.784 Y134.443 E.00865
G1 X149.67 Y117.557 E.33691
G1 X149.056 Y117.557 E.00865
G1 X132.17 Y134.443 E.33691
G1 X131.557 Y134.443 E.00865
G1 X148.443 Y117.557 E.33691
G1 X147.83 Y117.557 E.00865
G1 X130.944 Y134.443 E.33691
G1 X130.331 Y134.443 E.00865
G1 X147.217 Y117.557 E.33691
G1 X146.603 Y117.557 E.00865
G1 X129.717 Y134.443 E.33691
G1 X129.557 Y134.443 E.00226
G1 X129.557 Y133.99 E.00639
G1 X145.99 Y117.557 E.32787
G1 X145.377 Y117.557 E.00865
G1 X129.557 Y133.377 E.31563
G1 X129.557 Y132.763 E.00865
G1 X144.763 Y117.557 E.30339
G1 X144.15 Y117.557 E.00865
G1 X129.557 Y132.15 E.29116
G1 X129.557 Y131.537 E.00865
G1 X143.537 Y117.557 E.27892
G1 X142.924 Y117.557 E.00865
G1 X129.557 Y130.923 E.26669
G1 X129.557 Y130.31 E.00865
G1 X142.31 Y117.557 E.25445
G1 X141.697 Y117.557 E.00865
G1 X129.557 Y129.697 E.24221
G1 X129.557 Y129.084 E.00865
G1 X141.084 Y117.557 E.22998
G1 X140.47 Y117.557 E.00865
G1 X129.557 Y128.47 E.21774
G1 X129.557 Y127.857 E.00865
G1 X139.857 Y117.557 E.2055
G1 X139.244 Y117.557 E.00865
G1 X129.557 Y127.244 E.19327
G1 X129.557 Y126.63 E.00865
G1 X138.631 Y117.557 E.18103
G1 X138.017 Y117.557 E.00865
G1 X129.557 Y126.017 E.1688
G1 X129.557 Y125.404 E.00865
G1 X137.404 Y117.557 E.15656
G1 X136.791 Y117.557 E.00865
G1 X129.557 Y124.791 E.14432
G1 X129.557 Y124.177 E.00865
G1 X136.177 Y117.557 E.13209
G1 X135.564 Y117.557 E.00865
G1 X129.557 Y123.564 E.11985
G1 X129.557 Y122.951 E.00865
G1 X134.951 Y117.557 E.10761
G1 X134.338 Y117.557 E.00865
G1 X129.557 Y122.337 E.09538
G1 X129.557 Y121.724 E.00865
G1 X133.724 Y117.557 E.08314
G1 X133.111 Y117.557 E.00865
G1 X129.557 Y121.111 E.07091
G1 X129.557 Y120.498 E.00865
G1 X132.498 Y117.557 E.05867
G1 X131.884 Y117.557 E.00865
G1 X129.557 Y119.884 E.04643
G1 X129.557 Y119.271 E.00865
G1 X131.271 Y117.557 E.0342
G1 X130.658 Y117.557 E.00865
G1 X129.557 Y118.658 E.02196
G1 X129.557 Y118.044 E.00865
G1 X130.239 Y117.362 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X129.557 Y118.044 E-.3666
G1 X129.557 Y118.658 E-.23305
G1 X129.855 Y118.359 E-.16035
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/88
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.08 I-.752 J.957 P1  F30000
G1 X150.834 Y134.834 Z3.08
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
M73 P65 R9
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.097 Z3.16 F30000
G1 X150.638 Y118.239 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15590
G1 X149.956 Y117.557 E.01361
G1 X149.342 Y117.557 E.00865
G1 X150.443 Y118.657 E.02196
G1 X150.443 Y119.271 E.00865
G1 X148.729 Y117.557 E.03419
G1 X148.116 Y117.557 E.00865
G1 X150.443 Y119.884 E.04643
G1 X150.443 Y120.497 E.00865
G1 X147.503 Y117.557 E.05867
G1 X146.889 Y117.557 E.00865
G1 X150.443 Y121.111 E.0709
G1 X150.443 Y121.724 E.00865
G1 X146.276 Y117.557 E.08314
G1 X145.663 Y117.557 E.00865
G1 X150.443 Y122.337 E.09537
G1 X150.443 Y122.951 E.00865
G1 X145.049 Y117.557 E.10761
G1 X144.436 Y117.557 E.00865
G1 X150.443 Y123.564 E.11985
G1 X150.443 Y124.177 E.00865
G1 X143.823 Y117.557 E.13208
G1 X143.21 Y117.557 E.00865
G1 X150.443 Y124.79 E.14432
G1 X150.443 Y125.404 E.00865
G1 X142.596 Y117.557 E.15656
G1 X141.983 Y117.557 E.00865
G1 X150.443 Y126.017 E.16879
G1 X150.443 Y126.63 E.00865
G1 X141.37 Y117.557 E.18103
G1 X140.756 Y117.557 E.00865
G1 X150.443 Y127.244 E.19326
G1 X150.443 Y127.857 E.00865
G1 X140.143 Y117.557 E.2055
G1 X139.53 Y117.557 E.00865
G1 X150.443 Y128.47 E.21774
G1 X150.443 Y129.083 E.00865
G1 X138.917 Y117.557 E.22997
G1 X138.303 Y117.557 E.00865
G1 X150.443 Y129.697 E.24221
G1 X150.443 Y130.31 E.00865
G1 X137.69 Y117.557 E.25445
G1 X137.077 Y117.557 E.00865
G1 X150.443 Y130.923 E.26668
G1 X150.443 Y131.537 E.00865
G1 X136.463 Y117.557 E.27892
G1 X135.85 Y117.557 E.00865
G1 X150.443 Y132.15 E.29115
G1 X150.443 Y132.763 E.00865
G1 X135.237 Y117.557 E.30339
G1 X134.624 Y117.557 E.00865
G1 X150.443 Y133.376 E.31563
G1 X150.443 Y133.99 E.00865
G1 X134.01 Y117.557 E.32786
G1 X133.397 Y117.557 E.00865
G1 X150.283 Y134.443 E.33691
G1 X149.67 Y134.443 E.00865
G1 X132.784 Y117.557 E.33691
G1 X132.17 Y117.557 E.00865
G1 X149.056 Y134.443 E.33691
G1 X148.443 Y134.443 E.00865
G1 X131.557 Y117.557 E.33691
G1 X130.944 Y117.557 E.00865
G1 X147.83 Y134.443 E.33691
G1 X147.217 Y134.443 E.00865
G1 X130.331 Y117.557 E.33691
G1 X129.717 Y117.557 E.00865
G1 X146.603 Y134.443 E.33691
G1 X145.99 Y134.443 E.00865
G1 X129.557 Y118.01 E.32787
G1 X129.557 Y118.623 E.00865
G1 X145.377 Y134.443 E.31563
G1 X144.763 Y134.443 E.00865
G1 X129.557 Y119.237 E.30339
G1 X129.557 Y119.85 E.00865
G1 X144.15 Y134.443 E.29116
G1 X143.537 Y134.443 E.00865
G1 X129.557 Y120.463 E.27892
G1 X129.557 Y121.077 E.00865
G1 X142.924 Y134.443 E.26669
G1 X142.31 Y134.443 E.00865
G1 X129.557 Y121.69 E.25445
G1 X129.557 Y122.303 E.00865
G1 X141.697 Y134.443 E.24221
G1 X141.084 Y134.443 E.00865
G1 X129.557 Y122.916 E.22998
G1 X129.557 Y123.53 E.00865
G1 X140.47 Y134.443 E.21774
G1 X139.857 Y134.443 E.00865
G1 X129.557 Y124.143 E.2055
G1 X129.557 Y124.756 E.00865
G1 X139.244 Y134.443 E.19327
G1 X138.631 Y134.443 E.00865
G1 X129.557 Y125.37 E.18103
G1 X129.557 Y125.983 E.00865
G1 X138.017 Y134.443 E.1688
G1 X137.404 Y134.443 E.00865
G1 X129.557 Y126.596 E.15656
G1 X129.557 Y127.209 E.00865
G1 X136.791 Y134.443 E.14432
G1 X136.177 Y134.443 E.00865
G1 X129.557 Y127.823 E.13209
G1 X129.557 Y128.436 E.00865
G1 X135.564 Y134.443 E.11985
G1 X134.951 Y134.443 E.00865
G1 X129.557 Y129.049 E.10761
G1 X129.557 Y129.663 E.00865
G1 X134.338 Y134.443 E.09538
G1 X133.724 Y134.443 E.00865
G1 X129.557 Y130.276 E.08314
G1 X129.557 Y130.889 E.00865
G1 X133.111 Y134.443 E.07091
G1 X132.498 Y134.443 E.00865
G1 X129.557 Y131.502 E.05867
G1 X129.557 Y132.116 E.00865
G1 X131.884 Y134.443 E.04643
G1 X131.271 Y134.443 E.00865
G1 X129.557 Y132.729 E.0342
G1 X129.557 Y133.342 E.00865
G1 X130.658 Y134.443 E.02196
G1 X130.044 Y134.443 E.00865
G1 X129.362 Y133.761 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 2.84
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X130.044 Y134.443 E-.3666
G1 X130.658 Y134.443 E-.23305
G1 X130.359 Y134.145 E-.16036
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/88
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.16 I-.041 J1.216 P1  F30000
G1 X150.834 Y134.834 Z3.16
G1 Z2.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.761 Y134.638 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15378
G1 X150.443 Y133.956 E.01361
G1 X150.443 Y133.342 E.00865
G1 X149.342 Y134.443 E.02196
G1 X148.729 Y134.443 E.00865
G1 X150.443 Y132.729 E.03419
G1 X150.443 Y132.116 E.00865
G1 X148.116 Y134.443 E.04643
G1 X147.503 Y134.443 E.00865
G1 X150.443 Y131.503 E.05867
G1 X150.443 Y130.889 E.00865
G1 X146.889 Y134.443 E.0709
G1 X146.276 Y134.443 E.00865
G1 X150.443 Y130.276 E.08314
G1 X150.443 Y129.663 E.00865
G1 X145.663 Y134.443 E.09537
G1 X145.049 Y134.443 E.00865
G1 X150.443 Y129.049 E.10761
G1 X150.443 Y128.436 E.00865
G1 X144.436 Y134.443 E.11985
G1 X143.823 Y134.443 E.00865
G1 X150.443 Y127.823 E.13208
G1 X150.443 Y127.21 E.00865
G1 X143.21 Y134.443 E.14432
G1 X142.596 Y134.443 E.00865
G1 X150.443 Y126.596 E.15656
G1 X150.443 Y125.983 E.00865
G1 X141.983 Y134.443 E.16879
G1 X141.37 Y134.443 E.00865
G1 X150.443 Y125.37 E.18103
G1 X150.443 Y124.756 E.00865
G1 X140.756 Y134.443 E.19326
G1 X140.143 Y134.443 E.00865
G1 X150.443 Y124.143 E.2055
G1 X150.443 Y123.53 E.00865
G1 X139.53 Y134.443 E.21774
G1 X138.917 Y134.443 E.00865
G1 X150.443 Y122.917 E.22997
G1 X150.443 Y122.303 E.00865
G1 X138.303 Y134.443 E.24221
G1 X137.69 Y134.443 E.00865
G1 X150.443 Y121.69 E.25445
G1 X150.443 Y121.077 E.00865
G1 X137.077 Y134.443 E.26668
G1 X136.463 Y134.443 E.00865
M73 P66 R9
G1 X150.443 Y120.463 E.27892
G1 X150.443 Y119.85 E.00865
G1 X135.85 Y134.443 E.29115
G1 X135.237 Y134.443 E.00865
G1 X150.443 Y119.237 E.30339
G1 X150.443 Y118.624 E.00865
G1 X134.624 Y134.443 E.31563
G1 X134.01 Y134.443 E.00865
G1 X150.443 Y118.01 E.32786
G1 X150.443 Y117.557 E.0064
G1 X150.283 Y117.557 E.00226
G1 X133.397 Y134.443 E.33691
G1 X132.784 Y134.443 E.00865
G1 X149.67 Y117.557 E.33691
G1 X149.056 Y117.557 E.00865
G1 X132.17 Y134.443 E.33691
G1 X131.557 Y134.443 E.00865
G1 X148.443 Y117.557 E.33691
G1 X147.83 Y117.557 E.00865
G1 X130.944 Y134.443 E.33691
G1 X130.331 Y134.443 E.00865
G1 X147.217 Y117.557 E.33691
G1 X146.603 Y117.557 E.00865
G1 X129.717 Y134.443 E.33691
G1 X129.557 Y134.443 E.00226
G1 X129.557 Y133.99 E.00639
G1 X145.99 Y117.557 E.32787
G1 X145.377 Y117.557 E.00865
G1 X129.557 Y133.377 E.31563
G1 X129.557 Y132.763 E.00865
G1 X144.763 Y117.557 E.30339
G1 X144.15 Y117.557 E.00865
G1 X129.557 Y132.15 E.29116
G1 X129.557 Y131.537 E.00865
G1 X143.537 Y117.557 E.27892
G1 X142.924 Y117.557 E.00865
G1 X129.557 Y130.923 E.26669
G1 X129.557 Y130.31 E.00865
G1 X142.31 Y117.557 E.25445
G1 X141.697 Y117.557 E.00865
G1 X129.557 Y129.697 E.24221
G1 X129.557 Y129.084 E.00865
G1 X141.084 Y117.557 E.22998
G1 X140.47 Y117.557 E.00865
G1 X129.557 Y128.47 E.21774
G1 X129.557 Y127.857 E.00865
G1 X139.857 Y117.557 E.2055
G1 X139.244 Y117.557 E.00865
G1 X129.557 Y127.244 E.19327
G1 X129.557 Y126.63 E.00865
G1 X138.631 Y117.557 E.18103
G1 X138.017 Y117.557 E.00865
G1 X129.557 Y126.017 E.1688
G1 X129.557 Y125.404 E.00865
G1 X137.404 Y117.557 E.15656
G1 X136.791 Y117.557 E.00865
G1 X129.557 Y124.791 E.14432
G1 X129.557 Y124.177 E.00865
G1 X136.177 Y117.557 E.13209
G1 X135.564 Y117.557 E.00865
G1 X129.557 Y123.564 E.11985
G1 X129.557 Y122.951 E.00865
G1 X134.951 Y117.557 E.10761
G1 X134.338 Y117.557 E.00865
G1 X129.557 Y122.337 E.09538
G1 X129.557 Y121.724 E.00865
G1 X133.724 Y117.557 E.08314
G1 X133.111 Y117.557 E.00865
G1 X129.557 Y121.111 E.07091
G1 X129.557 Y120.498 E.00865
G1 X132.498 Y117.557 E.05867
G1 X131.884 Y117.557 E.00865
G1 X129.557 Y119.884 E.04643
G1 X129.557 Y119.271 E.00865
G1 X131.271 Y117.557 E.0342
G1 X130.658 Y117.557 E.00865
G1 X129.557 Y118.658 E.02196
G1 X129.557 Y118.044 E.00865
G1 X130.239 Y117.362 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F20793.295
G1 X129.557 Y118.044 E-.3666
G1 X129.557 Y118.658 E-.23305
G1 X129.855 Y118.359 E-.16035
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/88
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.24 I-.752 J.957 P1  F30000
G1 X150.834 Y134.834 Z3.24
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.097 Z3.32 F30000
G1 X150.638 Y118.239 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15590
G1 X149.956 Y117.557 E.01361
G1 X149.342 Y117.557 E.00865
G1 X150.443 Y118.657 E.02196
G1 X150.443 Y119.271 E.00865
G1 X148.729 Y117.557 E.03419
G1 X148.116 Y117.557 E.00865
G1 X150.443 Y119.884 E.04643
G1 X150.443 Y120.497 E.00865
G1 X147.503 Y117.557 E.05867
G1 X146.889 Y117.557 E.00865
G1 X150.443 Y121.111 E.0709
G1 X150.443 Y121.724 E.00865
G1 X146.276 Y117.557 E.08314
G1 X145.663 Y117.557 E.00865
G1 X150.443 Y122.337 E.09537
G1 X150.443 Y122.951 E.00865
G1 X145.049 Y117.557 E.10761
G1 X144.436 Y117.557 E.00865
G1 X150.443 Y123.564 E.11985
G1 X150.443 Y124.177 E.00865
G1 X143.823 Y117.557 E.13208
G1 X143.21 Y117.557 E.00865
G1 X150.443 Y124.79 E.14432
G1 X150.443 Y125.404 E.00865
G1 X142.596 Y117.557 E.15656
G1 X141.983 Y117.557 E.00865
G1 X150.443 Y126.017 E.16879
G1 X150.443 Y126.63 E.00865
G1 X141.37 Y117.557 E.18103
G1 X140.756 Y117.557 E.00865
G1 X150.443 Y127.244 E.19326
G1 X150.443 Y127.857 E.00865
G1 X140.143 Y117.557 E.2055
G1 X139.53 Y117.557 E.00865
G1 X150.443 Y128.47 E.21774
G1 X150.443 Y129.083 E.00865
G1 X138.917 Y117.557 E.22997
G1 X138.303 Y117.557 E.00865
G1 X150.443 Y129.697 E.24221
G1 X150.443 Y130.31 E.00865
G1 X137.69 Y117.557 E.25445
G1 X137.077 Y117.557 E.00865
G1 X150.443 Y130.923 E.26668
G1 X150.443 Y131.537 E.00865
G1 X136.463 Y117.557 E.27892
G1 X135.85 Y117.557 E.00865
G1 X150.443 Y132.15 E.29115
G1 X150.443 Y132.763 E.00865
G1 X135.237 Y117.557 E.30339
G1 X134.624 Y117.557 E.00865
G1 X150.443 Y133.376 E.31563
G1 X150.443 Y133.99 E.00865
G1 X134.01 Y117.557 E.32786
G1 X133.397 Y117.557 E.00865
G1 X150.283 Y134.443 E.33691
G1 X149.67 Y134.443 E.00865
G1 X132.784 Y117.557 E.33691
G1 X132.17 Y117.557 E.00865
G1 X149.056 Y134.443 E.33691
G1 X148.443 Y134.443 E.00865
G1 X131.557 Y117.557 E.33691
G1 X130.944 Y117.557 E.00865
G1 X147.83 Y134.443 E.33691
G1 X147.217 Y134.443 E.00865
G1 X130.331 Y117.557 E.33691
G1 X129.717 Y117.557 E.00865
G1 X146.603 Y134.443 E.33691
G1 X145.99 Y134.443 E.00865
G1 X129.557 Y118.01 E.32787
G1 X129.557 Y118.623 E.00865
G1 X145.377 Y134.443 E.31563
G1 X144.763 Y134.443 E.00865
G1 X129.557 Y119.237 E.30339
G1 X129.557 Y119.85 E.00865
G1 X144.15 Y134.443 E.29116
G1 X143.537 Y134.443 E.00865
G1 X129.557 Y120.463 E.27892
G1 X129.557 Y121.077 E.00865
G1 X142.924 Y134.443 E.26669
G1 X142.31 Y134.443 E.00865
G1 X129.557 Y121.69 E.25445
G1 X129.557 Y122.303 E.00865
G1 X141.697 Y134.443 E.24221
G1 X141.084 Y134.443 E.00865
G1 X129.557 Y122.916 E.22998
G1 X129.557 Y123.53 E.00865
G1 X140.47 Y134.443 E.21774
G1 X139.857 Y134.443 E.00865
G1 X129.557 Y124.143 E.2055
G1 X129.557 Y124.756 E.00865
G1 X139.244 Y134.443 E.19327
G1 X138.631 Y134.443 E.00865
G1 X129.557 Y125.37 E.18103
G1 X129.557 Y125.983 E.00865
G1 X138.017 Y134.443 E.1688
G1 X137.404 Y134.443 E.00865
G1 X129.557 Y126.596 E.15656
G1 X129.557 Y127.209 E.00865
G1 X136.791 Y134.443 E.14432
G1 X136.177 Y134.443 E.00865
G1 X129.557 Y127.823 E.13209
G1 X129.557 Y128.436 E.00865
G1 X135.564 Y134.443 E.11985
G1 X134.951 Y134.443 E.00865
G1 X129.557 Y129.049 E.10761
G1 X129.557 Y129.663 E.00865
G1 X134.338 Y134.443 E.09538
G1 X133.724 Y134.443 E.00865
G1 X129.557 Y130.276 E.08314
G1 X129.557 Y130.889 E.00865
G1 X133.111 Y134.443 E.07091
G1 X132.498 Y134.443 E.00865
G1 X129.557 Y131.502 E.05867
G1 X129.557 Y132.116 E.00865
G1 X131.884 Y134.443 E.04643
G1 X131.271 Y134.443 E.00865
G1 X129.557 Y132.729 E.0342
G1 X129.557 Y133.342 E.00865
G1 X130.658 Y134.443 E.02196
G1 X130.044 Y134.443 E.00865
G1 X129.362 Y133.761 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X130.044 Y134.443 E-.3666
G1 X130.658 Y134.443 E-.23305
G1 X130.359 Y134.145 E-.16036
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/88
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.32 I-.041 J1.216 P1  F30000
G1 X150.834 Y134.834 Z3.32
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.761 Y134.638 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15378
G1 X150.443 Y133.956 E.01361
G1 X150.443 Y133.342 E.00865
G1 X149.342 Y134.443 E.02196
G1 X148.729 Y134.443 E.00865
G1 X150.443 Y132.729 E.03419
G1 X150.443 Y132.116 E.00865
G1 X148.116 Y134.443 E.04643
G1 X147.503 Y134.443 E.00865
G1 X150.443 Y131.503 E.05867
G1 X150.443 Y130.889 E.00865
G1 X146.889 Y134.443 E.0709
G1 X146.276 Y134.443 E.00865
G1 X150.443 Y130.276 E.08314
G1 X150.443 Y129.663 E.00865
G1 X145.663 Y134.443 E.09537
G1 X145.049 Y134.443 E.00865
G1 X150.443 Y129.049 E.10761
G1 X150.443 Y128.436 E.00865
G1 X144.436 Y134.443 E.11985
G1 X143.823 Y134.443 E.00865
G1 X150.443 Y127.823 E.13208
G1 X150.443 Y127.21 E.00865
G1 X143.21 Y134.443 E.14432
G1 X142.596 Y134.443 E.00865
G1 X150.443 Y126.596 E.15656
G1 X150.443 Y125.983 E.00865
G1 X141.983 Y134.443 E.16879
G1 X141.37 Y134.443 E.00865
G1 X150.443 Y125.37 E.18103
G1 X150.443 Y124.756 E.00865
M73 P67 R9
G1 X140.756 Y134.443 E.19326
G1 X140.143 Y134.443 E.00865
G1 X150.443 Y124.143 E.2055
G1 X150.443 Y123.53 E.00865
G1 X139.53 Y134.443 E.21774
G1 X138.917 Y134.443 E.00865
G1 X150.443 Y122.917 E.22997
G1 X150.443 Y122.303 E.00865
G1 X138.303 Y134.443 E.24221
G1 X137.69 Y134.443 E.00865
G1 X150.443 Y121.69 E.25445
G1 X150.443 Y121.077 E.00865
G1 X137.077 Y134.443 E.26668
G1 X136.463 Y134.443 E.00865
G1 X150.443 Y120.463 E.27892
G1 X150.443 Y119.85 E.00865
G1 X135.85 Y134.443 E.29115
G1 X135.237 Y134.443 E.00865
G1 X150.443 Y119.237 E.30339
G1 X150.443 Y118.624 E.00865
G1 X134.624 Y134.443 E.31563
G1 X134.01 Y134.443 E.00865
G1 X150.443 Y118.01 E.32786
G1 X150.443 Y117.557 E.0064
G1 X150.283 Y117.557 E.00226
G1 X133.397 Y134.443 E.33691
G1 X132.784 Y134.443 E.00865
G1 X149.67 Y117.557 E.33691
G1 X149.056 Y117.557 E.00865
G1 X132.17 Y134.443 E.33691
G1 X131.557 Y134.443 E.00865
G1 X148.443 Y117.557 E.33691
G1 X147.83 Y117.557 E.00865
G1 X130.944 Y134.443 E.33691
G1 X130.331 Y134.443 E.00865
G1 X147.217 Y117.557 E.33691
G1 X146.603 Y117.557 E.00865
G1 X129.717 Y134.443 E.33691
G1 X129.557 Y134.443 E.00226
G1 X129.557 Y133.99 E.00639
G1 X145.99 Y117.557 E.32787
G1 X145.377 Y117.557 E.00865
G1 X129.557 Y133.377 E.31563
G1 X129.557 Y132.763 E.00865
G1 X144.763 Y117.557 E.30339
G1 X144.15 Y117.557 E.00865
G1 X129.557 Y132.15 E.29116
G1 X129.557 Y131.537 E.00865
G1 X143.537 Y117.557 E.27892
G1 X142.924 Y117.557 E.00865
G1 X129.557 Y130.923 E.26669
G1 X129.557 Y130.31 E.00865
G1 X142.31 Y117.557 E.25445
G1 X141.697 Y117.557 E.00865
G1 X129.557 Y129.697 E.24221
G1 X129.557 Y129.084 E.00865
G1 X141.084 Y117.557 E.22998
G1 X140.47 Y117.557 E.00865
G1 X129.557 Y128.47 E.21774
G1 X129.557 Y127.857 E.00865
G1 X139.857 Y117.557 E.2055
G1 X139.244 Y117.557 E.00865
G1 X129.557 Y127.244 E.19327
G1 X129.557 Y126.63 E.00865
G1 X138.631 Y117.557 E.18103
G1 X138.017 Y117.557 E.00865
G1 X129.557 Y126.017 E.1688
G1 X129.557 Y125.404 E.00865
G1 X137.404 Y117.557 E.15656
G1 X136.791 Y117.557 E.00865
G1 X129.557 Y124.791 E.14432
G1 X129.557 Y124.177 E.00865
G1 X136.177 Y117.557 E.13209
G1 X135.564 Y117.557 E.00865
G1 X129.557 Y123.564 E.11985
G1 X129.557 Y122.951 E.00865
G1 X134.951 Y117.557 E.10761
G1 X134.338 Y117.557 E.00865
G1 X129.557 Y122.337 E.09538
G1 X129.557 Y121.724 E.00865
G1 X133.724 Y117.557 E.08314
G1 X133.111 Y117.557 E.00865
G1 X129.557 Y121.111 E.07091
G1 X129.557 Y120.498 E.00865
G1 X132.498 Y117.557 E.05867
G1 X131.884 Y117.557 E.00865
G1 X129.557 Y119.884 E.04643
G1 X129.557 Y119.271 E.00865
G1 X131.271 Y117.557 E.0342
G1 X130.658 Y117.557 E.00865
G1 X129.557 Y118.658 E.02196
G1 X129.557 Y118.044 E.00865
G1 X130.239 Y117.362 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X129.557 Y118.044 E-.3666
G1 X129.557 Y118.658 E-.23305
G1 X129.855 Y118.359 E-.16035
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/88
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.4 I-.752 J.957 P1  F30000
G1 X150.834 Y134.834 Z3.4
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.097 Z3.48 F30000
G1 X150.638 Y118.239 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15590
G1 X149.956 Y117.557 E.01361
G1 X149.342 Y117.557 E.00865
G1 X150.443 Y118.657 E.02196
G1 X150.443 Y119.271 E.00865
G1 X148.729 Y117.557 E.03419
G1 X148.116 Y117.557 E.00865
G1 X150.443 Y119.884 E.04643
G1 X150.443 Y120.497 E.00865
G1 X147.503 Y117.557 E.05867
G1 X146.889 Y117.557 E.00865
G1 X150.443 Y121.111 E.0709
G1 X150.443 Y121.724 E.00865
G1 X146.276 Y117.557 E.08314
G1 X145.663 Y117.557 E.00865
G1 X150.443 Y122.337 E.09537
G1 X150.443 Y122.951 E.00865
G1 X145.049 Y117.557 E.10761
G1 X144.436 Y117.557 E.00865
G1 X150.443 Y123.564 E.11985
G1 X150.443 Y124.177 E.00865
G1 X143.823 Y117.557 E.13208
G1 X143.21 Y117.557 E.00865
G1 X150.443 Y124.79 E.14432
G1 X150.443 Y125.404 E.00865
G1 X142.596 Y117.557 E.15656
G1 X141.983 Y117.557 E.00865
G1 X150.443 Y126.017 E.16879
G1 X150.443 Y126.63 E.00865
G1 X141.37 Y117.557 E.18103
G1 X140.756 Y117.557 E.00865
G1 X150.443 Y127.244 E.19326
G1 X150.443 Y127.857 E.00865
G1 X140.143 Y117.557 E.2055
G1 X139.53 Y117.557 E.00865
G1 X150.443 Y128.47 E.21774
G1 X150.443 Y129.083 E.00865
G1 X138.917 Y117.557 E.22997
G1 X138.303 Y117.557 E.00865
G1 X150.443 Y129.697 E.24221
G1 X150.443 Y130.31 E.00865
G1 X137.69 Y117.557 E.25445
M73 P67 R8
G1 X137.077 Y117.557 E.00865
G1 X150.443 Y130.923 E.26668
G1 X150.443 Y131.537 E.00865
G1 X136.463 Y117.557 E.27892
G1 X135.85 Y117.557 E.00865
G1 X150.443 Y132.15 E.29115
G1 X150.443 Y132.763 E.00865
G1 X135.237 Y117.557 E.30339
G1 X134.624 Y117.557 E.00865
G1 X150.443 Y133.376 E.31563
G1 X150.443 Y133.99 E.00865
G1 X134.01 Y117.557 E.32786
G1 X133.397 Y117.557 E.00865
G1 X150.283 Y134.443 E.33691
G1 X149.67 Y134.443 E.00865
G1 X132.784 Y117.557 E.33691
G1 X132.17 Y117.557 E.00865
G1 X149.056 Y134.443 E.33691
G1 X148.443 Y134.443 E.00865
G1 X131.557 Y117.557 E.33691
G1 X130.944 Y117.557 E.00865
G1 X147.83 Y134.443 E.33691
G1 X147.217 Y134.443 E.00865
G1 X130.331 Y117.557 E.33691
G1 X129.717 Y117.557 E.00865
G1 X146.603 Y134.443 E.33691
G1 X145.99 Y134.443 E.00865
G1 X129.557 Y118.01 E.32787
G1 X129.557 Y118.623 E.00865
G1 X145.377 Y134.443 E.31563
G1 X144.763 Y134.443 E.00865
G1 X129.557 Y119.237 E.30339
G1 X129.557 Y119.85 E.00865
G1 X144.15 Y134.443 E.29116
G1 X143.537 Y134.443 E.00865
G1 X129.557 Y120.463 E.27892
G1 X129.557 Y121.077 E.00865
G1 X142.924 Y134.443 E.26669
G1 X142.31 Y134.443 E.00865
G1 X129.557 Y121.69 E.25445
G1 X129.557 Y122.303 E.00865
G1 X141.697 Y134.443 E.24221
G1 X141.084 Y134.443 E.00865
G1 X129.557 Y122.916 E.22998
G1 X129.557 Y123.53 E.00865
G1 X140.47 Y134.443 E.21774
G1 X139.857 Y134.443 E.00865
G1 X129.557 Y124.143 E.2055
G1 X129.557 Y124.756 E.00865
G1 X139.244 Y134.443 E.19327
G1 X138.631 Y134.443 E.00865
G1 X129.557 Y125.37 E.18103
G1 X129.557 Y125.983 E.00865
G1 X138.017 Y134.443 E.1688
G1 X137.404 Y134.443 E.00865
G1 X129.557 Y126.596 E.15656
G1 X129.557 Y127.209 E.00865
G1 X136.791 Y134.443 E.14432
M73 P68 R8
G1 X136.177 Y134.443 E.00865
G1 X129.557 Y127.823 E.13209
G1 X129.557 Y128.436 E.00865
G1 X135.564 Y134.443 E.11985
G1 X134.951 Y134.443 E.00865
G1 X129.557 Y129.049 E.10761
G1 X129.557 Y129.663 E.00865
G1 X134.338 Y134.443 E.09538
G1 X133.724 Y134.443 E.00865
G1 X129.557 Y130.276 E.08314
G1 X129.557 Y130.889 E.00865
G1 X133.111 Y134.443 E.07091
G1 X132.498 Y134.443 E.00865
G1 X129.557 Y131.502 E.05867
G1 X129.557 Y132.116 E.00865
G1 X131.884 Y134.443 E.04643
G1 X131.271 Y134.443 E.00865
G1 X129.557 Y132.729 E.0342
G1 X129.557 Y133.342 E.00865
G1 X130.658 Y134.443 E.02196
G1 X130.044 Y134.443 E.00865
G1 X129.362 Y133.761 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 3.16
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F20793.295
G1 X130.044 Y134.443 E-.3666
G1 X130.658 Y134.443 E-.23305
G1 X130.359 Y134.145 E-.16036
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/88
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.48 I-.041 J1.216 P1  F30000
G1 X150.834 Y134.834 Z3.48
G1 Z3.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.761 Y134.638 Z3.56 F30000
G1 Z3.16
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15378
G1 X150.443 Y133.956 E.01361
G1 X150.443 Y133.342 E.00865
G1 X149.342 Y134.443 E.02196
G1 X148.729 Y134.443 E.00865
G1 X150.443 Y132.729 E.03419
G1 X150.443 Y132.116 E.00865
G1 X148.116 Y134.443 E.04643
G1 X147.503 Y134.443 E.00865
G1 X150.443 Y131.503 E.05867
G1 X150.443 Y130.889 E.00865
G1 X146.889 Y134.443 E.0709
G1 X146.276 Y134.443 E.00865
G1 X150.443 Y130.276 E.08314
G1 X150.443 Y129.663 E.00865
G1 X145.663 Y134.443 E.09537
G1 X145.049 Y134.443 E.00865
G1 X150.443 Y129.049 E.10761
G1 X150.443 Y128.436 E.00865
G1 X144.436 Y134.443 E.11985
G1 X143.823 Y134.443 E.00865
G1 X150.443 Y127.823 E.13208
G1 X150.443 Y127.21 E.00865
G1 X143.21 Y134.443 E.14432
G1 X142.596 Y134.443 E.00865
G1 X150.443 Y126.596 E.15656
G1 X150.443 Y125.983 E.00865
G1 X141.983 Y134.443 E.16879
G1 X141.37 Y134.443 E.00865
G1 X150.443 Y125.37 E.18103
G1 X150.443 Y124.756 E.00865
G1 X140.756 Y134.443 E.19326
G1 X140.143 Y134.443 E.00865
G1 X150.443 Y124.143 E.2055
G1 X150.443 Y123.53 E.00865
G1 X139.53 Y134.443 E.21774
G1 X138.917 Y134.443 E.00865
G1 X150.443 Y122.917 E.22997
G1 X150.443 Y122.303 E.00865
G1 X138.303 Y134.443 E.24221
G1 X137.69 Y134.443 E.00865
G1 X150.443 Y121.69 E.25445
G1 X150.443 Y121.077 E.00865
G1 X137.077 Y134.443 E.26668
G1 X136.463 Y134.443 E.00865
G1 X150.443 Y120.463 E.27892
G1 X150.443 Y119.85 E.00865
G1 X135.85 Y134.443 E.29115
G1 X135.237 Y134.443 E.00865
G1 X150.443 Y119.237 E.30339
G1 X150.443 Y118.624 E.00865
G1 X134.624 Y134.443 E.31563
G1 X134.01 Y134.443 E.00865
G1 X150.443 Y118.01 E.32786
G1 X150.443 Y117.557 E.0064
G1 X150.283 Y117.557 E.00226
G1 X133.397 Y134.443 E.33691
G1 X132.784 Y134.443 E.00865
G1 X149.67 Y117.557 E.33691
G1 X149.056 Y117.557 E.00865
G1 X132.17 Y134.443 E.33691
G1 X131.557 Y134.443 E.00865
G1 X148.443 Y117.557 E.33691
G1 X147.83 Y117.557 E.00865
G1 X130.944 Y134.443 E.33691
G1 X130.331 Y134.443 E.00865
G1 X147.217 Y117.557 E.33691
G1 X146.603 Y117.557 E.00865
G1 X129.717 Y134.443 E.33691
G1 X129.557 Y134.443 E.00226
G1 X129.557 Y133.99 E.00639
G1 X145.99 Y117.557 E.32787
G1 X145.377 Y117.557 E.00865
G1 X129.557 Y133.377 E.31563
G1 X129.557 Y132.763 E.00865
G1 X144.763 Y117.557 E.30339
G1 X144.15 Y117.557 E.00865
G1 X129.557 Y132.15 E.29116
G1 X129.557 Y131.537 E.00865
G1 X143.537 Y117.557 E.27892
G1 X142.924 Y117.557 E.00865
G1 X129.557 Y130.923 E.26669
G1 X129.557 Y130.31 E.00865
G1 X142.31 Y117.557 E.25445
G1 X141.697 Y117.557 E.00865
G1 X129.557 Y129.697 E.24221
G1 X129.557 Y129.084 E.00865
G1 X141.084 Y117.557 E.22998
G1 X140.47 Y117.557 E.00865
G1 X129.557 Y128.47 E.21774
G1 X129.557 Y127.857 E.00865
G1 X139.857 Y117.557 E.2055
G1 X139.244 Y117.557 E.00865
G1 X129.557 Y127.244 E.19327
G1 X129.557 Y126.63 E.00865
G1 X138.631 Y117.557 E.18103
G1 X138.017 Y117.557 E.00865
G1 X129.557 Y126.017 E.1688
G1 X129.557 Y125.404 E.00865
G1 X137.404 Y117.557 E.15656
G1 X136.791 Y117.557 E.00865
G1 X129.557 Y124.791 E.14432
G1 X129.557 Y124.177 E.00865
G1 X136.177 Y117.557 E.13209
G1 X135.564 Y117.557 E.00865
G1 X129.557 Y123.564 E.11985
G1 X129.557 Y122.951 E.00865
G1 X134.951 Y117.557 E.10761
G1 X134.338 Y117.557 E.00865
G1 X129.557 Y122.337 E.09538
G1 X129.557 Y121.724 E.00865
G1 X133.724 Y117.557 E.08314
G1 X133.111 Y117.557 E.00865
G1 X129.557 Y121.111 E.07091
G1 X129.557 Y120.498 E.00865
G1 X132.498 Y117.557 E.05867
G1 X131.884 Y117.557 E.00865
G1 X129.557 Y119.884 E.04643
G1 X129.557 Y119.271 E.00865
G1 X131.271 Y117.557 E.0342
G1 X130.658 Y117.557 E.00865
G1 X129.557 Y118.658 E.02196
G1 X129.557 Y118.044 E.00865
G1 X130.239 Y117.362 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X129.557 Y118.044 E-.3666
G1 X129.557 Y118.658 E-.23305
G1 X129.855 Y118.359 E-.16035
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/88
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.56 I-.752 J.957 P1  F30000
G1 X150.834 Y134.834 Z3.56
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.097 Z3.64 F30000
G1 X150.638 Y118.239 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15590
G1 X149.956 Y117.557 E.01361
G1 X149.342 Y117.557 E.00865
G1 X150.443 Y118.657 E.02196
G1 X150.443 Y119.271 E.00865
G1 X148.729 Y117.557 E.03419
G1 X148.116 Y117.557 E.00865
G1 X150.443 Y119.884 E.04643
G1 X150.443 Y120.497 E.00865
G1 X147.503 Y117.557 E.05867
G1 X146.889 Y117.557 E.00865
G1 X150.443 Y121.111 E.0709
G1 X150.443 Y121.724 E.00865
G1 X146.276 Y117.557 E.08314
G1 X145.663 Y117.557 E.00865
G1 X150.443 Y122.337 E.09537
G1 X150.443 Y122.951 E.00865
G1 X145.049 Y117.557 E.10761
G1 X144.436 Y117.557 E.00865
G1 X150.443 Y123.564 E.11985
G1 X150.443 Y124.177 E.00865
G1 X143.823 Y117.557 E.13208
G1 X143.21 Y117.557 E.00865
G1 X150.443 Y124.79 E.14432
G1 X150.443 Y125.404 E.00865
G1 X142.596 Y117.557 E.15656
G1 X141.983 Y117.557 E.00865
G1 X150.443 Y126.017 E.16879
G1 X150.443 Y126.63 E.00865
G1 X141.37 Y117.557 E.18103
G1 X140.756 Y117.557 E.00865
G1 X150.443 Y127.244 E.19326
G1 X150.443 Y127.857 E.00865
G1 X140.143 Y117.557 E.2055
G1 X139.53 Y117.557 E.00865
G1 X150.443 Y128.47 E.21774
G1 X150.443 Y129.083 E.00865
G1 X138.917 Y117.557 E.22997
G1 X138.303 Y117.557 E.00865
G1 X150.443 Y129.697 E.24221
G1 X150.443 Y130.31 E.00865
M73 P69 R8
G1 X137.69 Y117.557 E.25445
G1 X137.077 Y117.557 E.00865
G1 X150.443 Y130.923 E.26668
G1 X150.443 Y131.537 E.00865
G1 X136.463 Y117.557 E.27892
G1 X135.85 Y117.557 E.00865
G1 X150.443 Y132.15 E.29115
G1 X150.443 Y132.763 E.00865
G1 X135.237 Y117.557 E.30339
G1 X134.624 Y117.557 E.00865
G1 X150.443 Y133.376 E.31563
G1 X150.443 Y133.99 E.00865
G1 X134.01 Y117.557 E.32786
G1 X133.397 Y117.557 E.00865
G1 X150.283 Y134.443 E.33691
G1 X149.67 Y134.443 E.00865
G1 X132.784 Y117.557 E.33691
G1 X132.17 Y117.557 E.00865
G1 X149.056 Y134.443 E.33691
G1 X148.443 Y134.443 E.00865
G1 X131.557 Y117.557 E.33691
G1 X130.944 Y117.557 E.00865
G1 X147.83 Y134.443 E.33691
G1 X147.217 Y134.443 E.00865
G1 X130.331 Y117.557 E.33691
G1 X129.717 Y117.557 E.00865
G1 X146.603 Y134.443 E.33691
G1 X145.99 Y134.443 E.00865
G1 X129.557 Y118.01 E.32787
G1 X129.557 Y118.623 E.00865
G1 X145.377 Y134.443 E.31563
G1 X144.763 Y134.443 E.00865
G1 X129.557 Y119.237 E.30339
G1 X129.557 Y119.85 E.00865
G1 X144.15 Y134.443 E.29116
G1 X143.537 Y134.443 E.00865
G1 X129.557 Y120.463 E.27892
G1 X129.557 Y121.077 E.00865
G1 X142.924 Y134.443 E.26669
G1 X142.31 Y134.443 E.00865
G1 X129.557 Y121.69 E.25445
G1 X129.557 Y122.303 E.00865
G1 X141.697 Y134.443 E.24221
G1 X141.084 Y134.443 E.00865
G1 X129.557 Y122.916 E.22998
G1 X129.557 Y123.53 E.00865
G1 X140.47 Y134.443 E.21774
G1 X139.857 Y134.443 E.00865
G1 X129.557 Y124.143 E.2055
G1 X129.557 Y124.756 E.00865
G1 X139.244 Y134.443 E.19327
G1 X138.631 Y134.443 E.00865
G1 X129.557 Y125.37 E.18103
G1 X129.557 Y125.983 E.00865
G1 X138.017 Y134.443 E.1688
G1 X137.404 Y134.443 E.00865
G1 X129.557 Y126.596 E.15656
G1 X129.557 Y127.209 E.00865
G1 X136.791 Y134.443 E.14432
G1 X136.177 Y134.443 E.00865
G1 X129.557 Y127.823 E.13209
G1 X129.557 Y128.436 E.00865
G1 X135.564 Y134.443 E.11985
G1 X134.951 Y134.443 E.00865
G1 X129.557 Y129.049 E.10761
G1 X129.557 Y129.663 E.00865
G1 X134.338 Y134.443 E.09538
G1 X133.724 Y134.443 E.00865
G1 X129.557 Y130.276 E.08314
G1 X129.557 Y130.889 E.00865
G1 X133.111 Y134.443 E.07091
G1 X132.498 Y134.443 E.00865
G1 X129.557 Y131.502 E.05867
G1 X129.557 Y132.116 E.00865
G1 X131.884 Y134.443 E.04643
G1 X131.271 Y134.443 E.00865
G1 X129.557 Y132.729 E.0342
G1 X129.557 Y133.342 E.00865
G1 X130.658 Y134.443 E.02196
G1 X130.044 Y134.443 E.00865
G1 X129.362 Y133.761 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 3.32
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X130.044 Y134.443 E-.3666
G1 X130.658 Y134.443 E-.23305
G1 X130.359 Y134.145 E-.16036
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/88
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.64 I-.041 J1.216 P1  F30000
G1 X150.834 Y134.834 Z3.64
G1 Z3.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.761 Y134.638 Z3.72 F30000
G1 Z3.32
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15378
G1 X150.443 Y133.956 E.01361
G1 X150.443 Y133.342 E.00865
G1 X149.342 Y134.443 E.02196
G1 X148.729 Y134.443 E.00865
G1 X150.443 Y132.729 E.03419
G1 X150.443 Y132.116 E.00865
G1 X148.116 Y134.443 E.04643
G1 X147.503 Y134.443 E.00865
G1 X150.443 Y131.503 E.05867
G1 X150.443 Y130.889 E.00865
G1 X146.889 Y134.443 E.0709
G1 X146.276 Y134.443 E.00865
G1 X150.443 Y130.276 E.08314
G1 X150.443 Y129.663 E.00865
G1 X145.663 Y134.443 E.09537
G1 X145.049 Y134.443 E.00865
G1 X150.443 Y129.049 E.10761
G1 X150.443 Y128.436 E.00865
G1 X144.436 Y134.443 E.11985
G1 X143.823 Y134.443 E.00865
G1 X150.443 Y127.823 E.13208
G1 X150.443 Y127.21 E.00865
G1 X143.21 Y134.443 E.14432
G1 X142.596 Y134.443 E.00865
G1 X150.443 Y126.596 E.15656
G1 X150.443 Y125.983 E.00865
G1 X141.983 Y134.443 E.16879
G1 X141.37 Y134.443 E.00865
G1 X150.443 Y125.37 E.18103
G1 X150.443 Y124.756 E.00865
G1 X140.756 Y134.443 E.19326
G1 X140.143 Y134.443 E.00865
G1 X150.443 Y124.143 E.2055
G1 X150.443 Y123.53 E.00865
G1 X139.53 Y134.443 E.21774
G1 X138.917 Y134.443 E.00865
G1 X150.443 Y122.917 E.22997
G1 X150.443 Y122.303 E.00865
G1 X138.303 Y134.443 E.24221
G1 X137.69 Y134.443 E.00865
G1 X150.443 Y121.69 E.25445
G1 X150.443 Y121.077 E.00865
G1 X137.077 Y134.443 E.26668
G1 X136.463 Y134.443 E.00865
G1 X150.443 Y120.463 E.27892
G1 X150.443 Y119.85 E.00865
G1 X135.85 Y134.443 E.29115
G1 X135.237 Y134.443 E.00865
G1 X150.443 Y119.237 E.30339
G1 X150.443 Y118.624 E.00865
G1 X134.624 Y134.443 E.31563
G1 X134.01 Y134.443 E.00865
G1 X150.443 Y118.01 E.32786
G1 X150.443 Y117.557 E.0064
G1 X150.283 Y117.557 E.00226
G1 X133.397 Y134.443 E.33691
G1 X132.784 Y134.443 E.00865
G1 X149.67 Y117.557 E.33691
G1 X149.056 Y117.557 E.00865
G1 X132.17 Y134.443 E.33691
G1 X131.557 Y134.443 E.00865
G1 X148.443 Y117.557 E.33691
G1 X147.83 Y117.557 E.00865
G1 X130.944 Y134.443 E.33691
G1 X130.331 Y134.443 E.00865
G1 X147.217 Y117.557 E.33691
G1 X146.603 Y117.557 E.00865
G1 X129.717 Y134.443 E.33691
G1 X129.557 Y134.443 E.00226
G1 X129.557 Y133.99 E.00639
G1 X145.99 Y117.557 E.32787
G1 X145.377 Y117.557 E.00865
G1 X129.557 Y133.377 E.31563
G1 X129.557 Y132.763 E.00865
G1 X144.763 Y117.557 E.30339
G1 X144.15 Y117.557 E.00865
G1 X129.557 Y132.15 E.29116
G1 X129.557 Y131.537 E.00865
G1 X143.537 Y117.557 E.27892
G1 X142.924 Y117.557 E.00865
G1 X129.557 Y130.923 E.26669
G1 X129.557 Y130.31 E.00865
G1 X142.31 Y117.557 E.25445
G1 X141.697 Y117.557 E.00865
G1 X129.557 Y129.697 E.24221
G1 X129.557 Y129.084 E.00865
G1 X141.084 Y117.557 E.22998
G1 X140.47 Y117.557 E.00865
G1 X129.557 Y128.47 E.21774
G1 X129.557 Y127.857 E.00865
G1 X139.857 Y117.557 E.2055
G1 X139.244 Y117.557 E.00865
G1 X129.557 Y127.244 E.19327
G1 X129.557 Y126.63 E.00865
G1 X138.631 Y117.557 E.18103
G1 X138.017 Y117.557 E.00865
G1 X129.557 Y126.017 E.1688
G1 X129.557 Y125.404 E.00865
G1 X137.404 Y117.557 E.15656
G1 X136.791 Y117.557 E.00865
G1 X129.557 Y124.791 E.14432
G1 X129.557 Y124.177 E.00865
G1 X136.177 Y117.557 E.13209
G1 X135.564 Y117.557 E.00865
G1 X129.557 Y123.564 E.11985
G1 X129.557 Y122.951 E.00865
G1 X134.951 Y117.557 E.10761
G1 X134.338 Y117.557 E.00865
G1 X129.557 Y122.337 E.09538
G1 X129.557 Y121.724 E.00865
G1 X133.724 Y117.557 E.08314
G1 X133.111 Y117.557 E.00865
G1 X129.557 Y121.111 E.07091
G1 X129.557 Y120.498 E.00865
G1 X132.498 Y117.557 E.05867
G1 X131.884 Y117.557 E.00865
G1 X129.557 Y119.884 E.04643
G1 X129.557 Y119.271 E.00865
G1 X131.271 Y117.557 E.0342
G1 X130.658 Y117.557 E.00865
G1 X129.557 Y118.658 E.02196
G1 X129.557 Y118.044 E.00865
G1 X130.239 Y117.362 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F20793.295
G1 X129.557 Y118.044 E-.3666
G1 X129.557 Y118.658 E-.23305
G1 X129.855 Y118.359 E-.16035
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/88
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.72 I-.752 J.957 P1  F30000
G1 X150.834 Y134.834 Z3.72
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
M73 P70 R8
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.151 Y128.097 Z3.8 F30000
G1 X150.638 Y118.239 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15590
G1 X149.956 Y117.557 E.01361
G1 X149.342 Y117.557 E.00865
G1 X150.443 Y118.657 E.02196
G1 X150.443 Y119.271 E.00865
G1 X148.729 Y117.557 E.03419
G1 X148.116 Y117.557 E.00865
G1 X150.443 Y119.884 E.04643
G1 X150.443 Y120.497 E.00865
G1 X147.503 Y117.557 E.05867
G1 X146.889 Y117.557 E.00865
G1 X150.443 Y121.111 E.0709
G1 X150.443 Y121.724 E.00865
G1 X146.276 Y117.557 E.08314
G1 X145.663 Y117.557 E.00865
G1 X150.443 Y122.337 E.09537
G1 X150.443 Y122.951 E.00865
G1 X145.049 Y117.557 E.10761
G1 X144.436 Y117.557 E.00865
G1 X150.443 Y123.564 E.11985
G1 X150.443 Y124.177 E.00865
G1 X143.823 Y117.557 E.13208
G1 X143.21 Y117.557 E.00865
G1 X150.443 Y124.79 E.14432
G1 X150.443 Y125.404 E.00865
G1 X142.596 Y117.557 E.15656
G1 X141.983 Y117.557 E.00865
G1 X150.443 Y126.017 E.16879
G1 X150.443 Y126.63 E.00865
G1 X141.37 Y117.557 E.18103
G1 X140.756 Y117.557 E.00865
G1 X150.443 Y127.244 E.19326
G1 X150.443 Y127.857 E.00865
G1 X140.143 Y117.557 E.2055
G1 X139.53 Y117.557 E.00865
G1 X150.443 Y128.47 E.21774
G1 X150.443 Y129.083 E.00865
G1 X138.917 Y117.557 E.22997
G1 X138.303 Y117.557 E.00865
G1 X150.443 Y129.697 E.24221
G1 X150.443 Y130.31 E.00865
G1 X137.69 Y117.557 E.25445
G1 X137.077 Y117.557 E.00865
G1 X150.443 Y130.923 E.26668
G1 X150.443 Y131.537 E.00865
G1 X136.463 Y117.557 E.27892
G1 X135.85 Y117.557 E.00865
G1 X150.443 Y132.15 E.29115
G1 X150.443 Y132.763 E.00865
G1 X135.237 Y117.557 E.30339
G1 X134.624 Y117.557 E.00865
G1 X150.443 Y133.376 E.31563
G1 X150.443 Y133.99 E.00865
G1 X134.01 Y117.557 E.32786
G1 X133.397 Y117.557 E.00865
G1 X150.283 Y134.443 E.33691
G1 X149.67 Y134.443 E.00865
G1 X132.784 Y117.557 E.33691
G1 X132.17 Y117.557 E.00865
G1 X149.056 Y134.443 E.33691
G1 X148.443 Y134.443 E.00865
G1 X131.557 Y117.557 E.33691
G1 X130.944 Y117.557 E.00865
G1 X147.83 Y134.443 E.33691
G1 X147.217 Y134.443 E.00865
G1 X130.331 Y117.557 E.33691
G1 X129.717 Y117.557 E.00865
G1 X146.603 Y134.443 E.33691
G1 X145.99 Y134.443 E.00865
G1 X129.557 Y118.01 E.32787
G1 X129.557 Y118.623 E.00865
G1 X145.377 Y134.443 E.31563
G1 X144.763 Y134.443 E.00865
G1 X129.557 Y119.237 E.30339
G1 X129.557 Y119.85 E.00865
G1 X144.15 Y134.443 E.29116
G1 X143.537 Y134.443 E.00865
G1 X129.557 Y120.463 E.27892
G1 X129.557 Y121.077 E.00865
G1 X142.924 Y134.443 E.26669
G1 X142.31 Y134.443 E.00865
G1 X129.557 Y121.69 E.25445
G1 X129.557 Y122.303 E.00865
G1 X141.697 Y134.443 E.24221
G1 X141.084 Y134.443 E.00865
G1 X129.557 Y122.916 E.22998
G1 X129.557 Y123.53 E.00865
G1 X140.47 Y134.443 E.21774
G1 X139.857 Y134.443 E.00865
G1 X129.557 Y124.143 E.2055
G1 X129.557 Y124.756 E.00865
G1 X139.244 Y134.443 E.19327
G1 X138.631 Y134.443 E.00865
G1 X129.557 Y125.37 E.18103
G1 X129.557 Y125.983 E.00865
G1 X138.017 Y134.443 E.1688
G1 X137.404 Y134.443 E.00865
G1 X129.557 Y126.596 E.15656
G1 X129.557 Y127.209 E.00865
G1 X136.791 Y134.443 E.14432
G1 X136.177 Y134.443 E.00865
G1 X129.557 Y127.823 E.13209
G1 X129.557 Y128.436 E.00865
G1 X135.564 Y134.443 E.11985
G1 X134.951 Y134.443 E.00865
G1 X129.557 Y129.049 E.10761
G1 X129.557 Y129.663 E.00865
G1 X134.338 Y134.443 E.09538
G1 X133.724 Y134.443 E.00865
G1 X129.557 Y130.276 E.08314
G1 X129.557 Y130.889 E.00865
G1 X133.111 Y134.443 E.07091
G1 X132.498 Y134.443 E.00865
G1 X129.557 Y131.502 E.05867
G1 X129.557 Y132.116 E.00865
G1 X131.884 Y134.443 E.04643
G1 X131.271 Y134.443 E.00865
G1 X129.557 Y132.729 E.0342
G1 X129.557 Y133.342 E.00865
G1 X130.658 Y134.443 E.02196
G1 X130.044 Y134.443 E.00865
G1 X129.362 Y133.761 E.01361
; CHANGE_LAYER
; Z_HEIGHT: 3.48
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X130.044 Y134.443 E-.3666
G1 X130.658 Y134.443 E-.23305
G1 X130.359 Y134.145 E-.16036
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/88
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.8 I-.041 J1.216 P1  F30000
G1 X150.834 Y134.834 Z3.8
G1 Z3.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.76 Y134.638 Z3.88 F30000
G1 Z3.48
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15834
G1 X150.443 Y133.955 E.01363
G1 X150.443 Y133.341 E.00866
G1 X149.341 Y134.443 E.02199
G1 X148.727 Y134.443 E.00866
G1 X150.443 Y132.727 E.03424
G1 X150.443 Y132.113 E.00866
G1 X148.113 Y134.443 E.04649
G1 X147.499 Y134.443 E.00866
G1 X150.443 Y131.499 E.05874
G1 X150.443 Y130.885 E.00866
G1 X146.885 Y134.443 E.07098
G1 X146.271 Y134.443 E.00866
G1 X150.443 Y130.271 E.08323
G1 X150.443 Y129.657 E.00866
G1 X145.657 Y134.443 E.09548
G1 X145.043 Y134.443 E.00866
G1 X150.443 Y129.043 E.10773
G1 X150.443 Y128.43 E.00866
G1 X144.43 Y134.443 E.11998
G1 X143.816 Y134.443 E.00866
G1 X150.443 Y127.816 E.13223
G1 X150.443 Y127.202 E.00866
G1 X143.202 Y134.443 E.14448
G1 X142.588 Y134.443 E.00866
G1 X150.443 Y126.588 E.15673
G1 X150.443 Y125.974 E.00866
G1 X142.455 Y133.962 E.15938
G1 X142.455 Y133.348 E.00866
G1 X150.443 Y125.36 E.15938
G1 X150.443 Y124.746 E.00866
G1 X142.455 Y132.734 E.15938
G1 X142.455 Y132.12 E.00866
G1 X150.443 Y124.132 E.15938
G1 X150.443 Y123.518 E.00866
G1 X142.455 Y131.506 E.15938
G1 X142.455 Y130.892 E.00866
G1 X150.443 Y122.904 E.15938
G1 X150.443 Y122.29 E.00866
G1 X142.455 Y130.279 E.15938
G1 X142.455 Y129.665 E.00866
G1 X150.443 Y121.676 E.15938
G1 X150.443 Y121.062 E.00866
G1 X142.455 Y129.051 E.15938
G1 X142.455 Y128.437 E.00866
G1 X150.443 Y120.449 E.15938
G1 X150.443 Y119.835 E.00866
G1 X142.455 Y127.823 E.15938
G1 X142.455 Y127.209 E.00866
G1 X150.443 Y119.221 E.15938
G1 X150.443 Y118.607 E.00866
G1 X142.455 Y126.595 E.15938
G1 X142.455 Y125.981 E.00866
G1 X150.443 Y117.993 E.15938
G1 X150.443 Y117.557 E.00615
G1 X150.265 Y117.557 E.00251
G1 X142.455 Y125.367 E.15583
M73 P71 R8
G1 X142.455 Y124.753 E.00866
G1 X149.651 Y117.557 E.14358
G1 X149.037 Y117.557 E.00866
G1 X142.455 Y124.139 E.13133
G1 X142.455 Y123.525 E.00866
G1 X148.423 Y117.557 E.11908
G1 X147.809 Y117.557 E.00866
G1 X142.455 Y122.911 E.10683
G1 X142.455 Y122.297 E.00866
G1 X147.195 Y117.557 E.09458
G1 X146.581 Y117.557 E.00866
G1 X142.455 Y121.684 E.08233
G1 X142.455 Y121.07 E.00866
G1 X145.967 Y117.557 E.07008
G1 X145.353 Y117.557 E.00866
G1 X142.455 Y120.456 E.05783
G1 X142.455 Y119.842 E.00866
G1 X144.74 Y117.557 E.04559
G1 X144.126 Y117.557 E.00866
G1 X142.455 Y119.228 E.03334
G1 X142.455 Y118.614 E.00866
G1 X143.512 Y117.557 E.02109
G1 X142.898 Y117.557 E.00866
G1 X142.26 Y118.195 E.01273
G1 X141.988 Y117.908 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.518428
G1 F15834
G1 X141.988 Y117.658 E.00409
G1 X141.487 Y117.658 E.00819
G1 X141.487 Y134.342 E.2726
G1 X141.988 Y134.342 E.00819
G1 X141.988 Y117.968 E.26753
G1 X140.126 Y118.201 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15834
G1 X140.77 Y117.557 E.01284
G1 X141.02 Y117.557 E.00352
G1 X141.02 Y117.925 E.0052
G1 X140.321 Y118.624 E.01394
G1 X140.321 Y119.242 E.00872
G1 X141.02 Y118.544 E.01394
G1 X141.02 Y119.162 E.00872
G1 X140.321 Y119.86 E.01394
G1 X140.321 Y120.478 E.00872
G1 X141.02 Y119.78 E.01394
G1 X141.02 Y120.398 E.00872
G1 X140.321 Y121.096 E.01394
G1 X140.321 Y121.714 E.00872
G1 X141.02 Y121.016 E.01394
G1 X141.02 Y121.634 E.00872
G1 X140.321 Y122.332 E.01394
G1 X140.321 Y122.95 E.00872
G1 X141.02 Y122.252 E.01394
G1 X141.02 Y122.87 E.00872
G1 X140.321 Y123.568 E.01394
G1 X140.321 Y124.186 E.00872
G1 X141.02 Y123.488 E.01394
G1 X141.02 Y124.106 E.00872
G1 X140.321 Y124.804 E.01394
G1 X140.321 Y125.422 E.00872
G1 X141.02 Y124.724 E.01394
G1 X141.02 Y125.342 E.00872
G1 X140.321 Y126.04 E.01394
G1 X140.321 Y126.658 E.00872
G1 X141.02 Y125.96 E.01394
G1 X141.02 Y126.578 E.00872
G1 X140.321 Y127.276 E.01394
G1 X140.321 Y127.894 E.00872
G1 X141.02 Y127.196 E.01394
G1 X141.02 Y127.814 E.00872
G1 X140.321 Y128.512 E.01394
G1 X140.321 Y129.13 E.00872
G1 X141.02 Y128.432 E.01394
G1 X141.02 Y129.05 E.00872
G1 X140.321 Y129.748 E.01394
G1 X140.321 Y130.366 E.00872
G1 X141.02 Y129.668 E.01394
G1 X141.02 Y130.286 E.00872
G1 X140.321 Y130.984 E.01394
G1 X140.321 Y131.602 E.00872
G1 X141.02 Y130.904 E.01394
G1 X141.02 Y131.522 E.00872
G1 X140.321 Y132.22 E.01394
G1 X140.321 Y132.839 E.00872
G1 X141.02 Y132.14 E.01394
G1 X141.02 Y132.758 E.00872
G1 X140.321 Y133.457 E.01394
G1 X140.321 Y134.075 E.00872
G1 X141.02 Y133.376 E.01394
G1 X141.02 Y133.994 E.00872
G1 X140.376 Y134.638 E.01284
G1 X139.221 Y134.639 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421768
G1 F15834
G1 X139.903 Y133.957 E.01272
G1 X139.903 Y133.385 E.00755
G1 X138.83 Y134.458 E.02001
G1 X138.258 Y134.458 E.00755
G1 X139.903 Y132.813 E.03069
G1 X139.903 Y132.241 E.00755
G1 X137.686 Y134.458 E.04136
G1 X137.114 Y134.458 E.00755
G1 X139.903 Y131.668 E.05203
G1 X139.903 Y131.096 E.00755
G1 X136.541 Y134.458 E.0627
G1 X135.969 Y134.458 E.00755
G1 X139.903 Y130.524 E.07337
G1 X139.903 Y129.952 E.00755
G1 X135.397 Y134.458 E.08404
G1 X134.825 Y134.458 E.00755
G1 X139.903 Y129.38 E.09472
G1 X139.903 Y128.807 E.00755
G1 X134.253 Y134.458 E.10539
G1 X133.68 Y134.458 E.00755
G1 X139.903 Y128.235 E.11606
G1 X139.903 Y127.663 E.00755
G1 X133.108 Y134.458 E.12673
G1 X132.536 Y134.458 E.00755
G1 X139.903 Y127.091 E.1374
G1 X139.903 Y126.519 E.00755
G1 X131.964 Y134.458 E.14807
G1 X131.392 Y134.458 E.00755
G1 X139.903 Y125.946 E.15875
G1 X139.903 Y125.374 E.00755
G1 X130.819 Y134.458 E.16942
G1 X130.247 Y134.458 E.00755
G1 X139.903 Y124.802 E.18009
G1 X139.903 Y124.23 E.00755
G1 X129.675 Y134.458 E.19076
G1 X129.542 Y134.458 E.00176
G1 X129.542 Y134.019 E.00579
G1 X139.903 Y123.658 E.19324
G1 X139.903 Y123.085 E.00755
G1 X129.542 Y133.447 E.19324
G1 X129.542 Y132.875 E.00755
G1 X139.903 Y122.513 E.19324
G1 X139.903 Y121.941 E.00755
G1 X129.542 Y132.302 E.19324
G1 X129.542 Y131.73 E.00755
G1 X139.903 Y121.369 E.19324
G1 X139.903 Y120.797 E.00755
G1 X129.542 Y131.158 E.19324
G1 X129.542 Y130.586 E.00755
G1 X139.903 Y120.225 E.19324
G1 X139.903 Y119.652 E.00755
G1 X129.542 Y130.014 E.19324
G1 X129.542 Y129.441 E.00755
G1 X139.903 Y119.08 E.19324
G1 X139.903 Y118.508 E.00755
G1 X129.542 Y128.869 E.19324
G1 X129.542 Y128.297 E.00755
G1 X139.903 Y117.936 E.19324
G1 X139.903 Y117.542 E.00519
G1 X139.725 Y117.542 E.00235
G1 X129.542 Y127.725 E.18992
G1 X129.542 Y127.153 E.00755
G1 X139.153 Y117.542 E.17925
G1 X138.581 Y117.542 E.00755
G1 X129.542 Y126.581 E.16857
G1 X129.542 Y126.008 E.00755
G1 X138.008 Y117.542 E.1579
G1 X137.436 Y117.542 E.00755
G1 X129.542 Y125.436 E.14723
G1 X129.542 Y124.864 E.00755
G1 X136.864 Y117.542 E.13656
G1 X136.292 Y117.542 E.00755
G1 X129.542 Y124.292 E.12589
G1 X129.542 Y123.72 E.00755
G1 X135.72 Y117.542 E.11522
G1 X135.147 Y117.542 E.00755
G1 X129.542 Y123.147 E.10454
G1 X129.542 Y122.575 E.00755
G1 X134.575 Y117.542 E.09387
G1 X134.003 Y117.542 E.00755
G1 X129.542 Y122.003 E.0832
G1 X129.542 Y121.431 E.00755
G1 X133.431 Y117.542 E.07253
G1 X132.859 Y117.542 E.00755
G1 X129.542 Y120.859 E.06186
G1 X129.542 Y120.286 E.00755
G1 X132.286 Y117.542 E.05119
G1 X131.714 Y117.542 E.00755
G1 X129.542 Y119.714 E.04051
G1 X129.542 Y119.142 E.00755
G1 X131.142 Y117.542 E.02984
G1 X130.57 Y117.542 E.00755
G1 X129.542 Y118.57 E.01917
G1 X129.542 Y117.998 E.00755
G1 X130.179 Y117.361 E.01188
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X129.542 Y117.998 E-.34233
G1 X129.542 Y118.57 E-.21743
G1 X129.915 Y118.197 E-.20024
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/88
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.88 I-.757 J.952 P1  F30000
G1 X150.834 Y134.834 Z3.88
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
M73 P71 R7
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.093 Y134.638 Z3.96 F30000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F16093
G1 X142.455 Y134 E.01273
G1 X142.455 Y133.386 E.00866
G1 X143.512 Y134.443 E.02109
G1 X144.126 Y134.443 E.00866
G1 X142.455 Y132.772 E.03334
G1 X142.455 Y132.158 E.00866
G1 X144.74 Y134.443 E.04559
G1 X145.353 Y134.443 E.00866
G1 X142.455 Y131.544 E.05783
G1 X142.455 Y130.93 E.00866
G1 X145.967 Y134.443 E.07008
G1 X146.581 Y134.443 E.00866
G1 X142.455 Y130.316 E.08233
G1 X142.455 Y129.702 E.00866
G1 X147.195 Y134.443 E.09458
G1 X147.809 Y134.443 E.00866
G1 X142.455 Y129.089 E.10683
G1 X142.455 Y128.475 E.00866
G1 X148.423 Y134.443 E.11908
G1 X149.037 Y134.443 E.00866
G1 X142.455 Y127.861 E.13133
G1 X142.455 Y127.247 E.00866
G1 X149.651 Y134.443 E.14358
G1 X150.265 Y134.443 E.00866
G1 X142.455 Y126.633 E.15583
G1 X142.455 Y126.019 E.00866
G1 X150.443 Y134.007 E.15938
G1 X150.443 Y133.393 E.00866
G1 X142.455 Y125.405 E.15938
G1 X142.455 Y124.791 E.00866
G1 X150.443 Y132.779 E.15938
G1 X150.443 Y132.165 E.00866
G1 X142.455 Y124.177 E.15938
G1 X142.455 Y123.563 E.00866
G1 X150.443 Y131.551 E.15938
G1 X150.443 Y130.938 E.00866
G1 X142.455 Y122.949 E.15938
G1 X142.455 Y122.335 E.00866
G1 X150.443 Y130.324 E.15938
G1 X150.443 Y129.71 E.00866
G1 X142.455 Y121.721 E.15938
G1 X142.455 Y121.108 E.00866
G1 X150.443 Y129.096 E.15938
G1 X150.443 Y128.482 E.00866
G1 X142.455 Y120.494 E.15938
G1 X142.455 Y119.88 E.00866
G1 X150.443 Y127.868 E.15938
G1 X150.443 Y127.254 E.00866
G1 X142.455 Y119.266 E.15938
G1 X142.455 Y118.652 E.00866
G1 X150.443 Y126.64 E.15938
G1 X150.443 Y126.026 E.00866
G1 X142.455 Y118.038 E.15938
G1 X142.455 Y117.557 E.00679
G1 X142.588 Y117.557 E.00188
G1 X150.443 Y125.412 E.15673
G1 X150.443 Y124.798 E.00866
G1 X143.202 Y117.557 E.14448
G1 X143.816 Y117.557 E.00866
G1 X150.443 Y124.184 E.13223
G1 X150.443 Y123.57 E.00866
G1 X144.43 Y117.557 E.11998
G1 X145.043 Y117.557 E.00866
G1 X150.443 Y122.957 E.10773
G1 X150.443 Y122.343 E.00866
G1 X145.657 Y117.557 E.09548
G1 X146.271 Y117.557 E.00866
G1 X150.443 Y121.729 E.08323
G1 X150.443 Y121.115 E.00866
G1 X146.885 Y117.557 E.07098
G1 X147.499 Y117.557 E.00866
G1 X150.443 Y120.501 E.05874
G1 X150.443 Y119.887 E.00866
G1 X148.113 Y117.557 E.04649
G1 X148.727 Y117.557 E.00866
G1 X150.443 Y119.273 E.03424
G1 X150.443 Y118.659 E.00866
G1 X149.341 Y117.557 E.02199
G1 X149.955 Y117.557 E.00866
G1 X150.638 Y118.24 E.01363
G1 X142.218 Y118.236 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F16093
G1 X141.524 Y117.542 E.01313
G1 X140.944 Y117.542 E.00776
G1 X142.037 Y118.635 E.02067
G1 X142.037 Y119.215 E.00776
G1 X140.363 Y117.542 E.03165
G1 X139.783 Y117.542 E.00776
G1 X142.037 Y119.796 E.04262
G1 X142.037 Y120.376 E.00776
G1 X139.203 Y117.542 E.05359
G1 X138.623 Y117.542 E.00776
G1 X142.037 Y120.956 E.06456
G1 X142.037 Y121.536 E.00776
G1 X138.043 Y117.542 E.07554
G1 X137.462 Y117.542 E.00776
G1 X142.037 Y122.116 E.08651
G1 X142.037 Y122.697 E.00776
G1 X136.882 Y117.542 E.09748
G1 X136.302 Y117.542 E.00776
G1 X142.037 Y123.277 E.10845
G1 X142.037 Y123.857 E.00776
G1 X135.722 Y117.542 E.11943
G1 X135.142 Y117.542 E.00776
G1 X142.037 Y124.437 E.1304
G1 X142.037 Y125.017 E.00776
G1 X134.561 Y117.542 E.14137
G1 X133.981 Y117.542 E.00776
G1 X142.037 Y125.598 E.15234
G1 X142.037 Y126.178 E.00776
G1 X133.401 Y117.542 E.16331
G1 X132.821 Y117.542 E.00776
G1 X142.037 Y126.758 E.17429
G1 X142.037 Y127.338 E.00776
G1 X132.241 Y117.542 E.18526
G1 X131.66 Y117.542 E.00776
G1 X142.037 Y127.918 E.19623
G1 X142.037 Y128.499 E.00776
G1 X131.08 Y117.542 E.2072
G1 X130.5 Y117.542 E.00776
G1 X142.037 Y129.079 E.21818
G1 X142.037 Y129.659 E.00776
G1 X129.92 Y117.542 E.22915
G1 X129.542 Y117.542 E.00505
G1 X129.542 Y117.744 E.00271
G1 X142.037 Y130.239 E.23629
G1 X142.037 Y130.819 E.00776
G1 X129.542 Y118.325 E.23629
G1 X129.542 Y118.905 E.00776
G1 X142.037 Y131.4 E.23629
G1 X142.037 Y131.98 E.00776
G1 X129.542 Y119.485 E.23629
G1 X129.542 Y120.065 E.00776
G1 X142.037 Y132.56 E.23629
G1 X142.037 Y133.14 E.00776
G1 X129.542 Y120.645 E.23629
G1 X129.542 Y121.226 E.00776
G1 X142.037 Y133.72 E.23629
G1 X142.037 Y134.301 E.00776
G1 X129.542 Y121.806 E.23629
G1 X129.542 Y122.386 E.00776
G1 X141.614 Y134.458 E.2283
G1 X141.034 Y134.458 E.00776
G1 X129.542 Y122.966 E.21733
G1 X129.542 Y123.546 E.00776
G1 X140.454 Y134.458 E.20635
G1 X139.874 Y134.458 E.00776
G1 X129.542 Y124.127 E.19538
G1 X129.542 Y124.707 E.00776
G1 X139.293 Y134.458 E.18441
G1 X138.713 Y134.458 E.00776
G1 X129.542 Y125.287 E.17344
G1 X129.542 Y125.867 E.00776
G1 X138.133 Y134.458 E.16247
G1 X137.553 Y134.458 E.00776
G1 X129.542 Y126.447 E.15149
G1 X129.542 Y127.028 E.00776
G1 X136.973 Y134.458 E.14052
G1 X136.392 Y134.458 E.00776
G1 X129.542 Y127.608 E.12955
G1 X129.542 Y128.188 E.00776
G1 X135.812 Y134.458 E.11858
G1 X135.232 Y134.458 E.00776
G1 X129.542 Y128.768 E.1076
G1 X129.542 Y129.348 E.00776
G1 X134.652 Y134.458 E.09663
G1 X134.072 Y134.458 E.00776
G1 X129.542 Y129.929 E.08566
G1 X129.542 Y130.509 E.00776
G1 X133.491 Y134.458 E.07469
G1 X132.911 Y134.458 E.00776
G1 X129.542 Y131.089 E.06371
G1 X129.542 Y131.669 E.00776
G1 X132.331 Y134.458 E.05274
G1 X131.751 Y134.458 E.00776
G1 X129.542 Y132.249 E.04177
G1 X129.542 Y132.829 E.00776
G1 X131.171 Y134.458 E.0308
G1 X130.59 Y134.458 E.00776
G1 X129.542 Y133.41 E.01982
G1 X129.542 Y133.99 E.00776
G1 X130.191 Y134.639 E.01228
; CHANGE_LAYER
; Z_HEIGHT: 3.64
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F21000
G1 X129.542 Y133.99 E-.34898
G1 X129.542 Y133.41 E-.22048
G1 X129.897 Y133.764 E-.19055
; WIPE_END
M73 P72 R7
G1 E-.04 F1800
; layer num/total_layer_count: 44/88
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.96 I-.062 J1.215 P1  F30000
G1 X150.834 Y134.834 Z3.96
G1 Z3.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.76 Y134.638 Z4.04 F30000
G1 Z3.64
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F16026
G1 X150.443 Y133.955 E.01363
G1 X150.443 Y133.341 E.00866
G1 X149.341 Y134.443 E.02199
G1 X148.727 Y134.443 E.00866
G1 X150.443 Y132.727 E.03424
G1 X150.443 Y132.113 E.00866
G1 X148.113 Y134.443 E.04649
G1 X147.499 Y134.443 E.00866
G1 X150.443 Y131.499 E.05874
G1 X150.443 Y130.885 E.00866
G1 X146.885 Y134.443 E.07098
G1 X146.271 Y134.443 E.00866
G1 X150.443 Y130.271 E.08323
G1 X150.443 Y129.657 E.00866
G1 X145.657 Y134.443 E.09548
G1 X145.043 Y134.443 E.00866
G1 X150.443 Y129.043 E.10773
G1 X150.443 Y128.43 E.00866
G1 X144.43 Y134.443 E.11998
G1 X143.816 Y134.443 E.00866
G1 X150.443 Y127.816 E.13223
G1 X150.443 Y127.202 E.00866
G1 X143.202 Y134.443 E.14448
G1 X142.588 Y134.443 E.00866
G1 X150.443 Y126.588 E.15673
G1 X150.443 Y125.974 E.00866
G1 X142.455 Y133.962 E.15938
G1 X142.455 Y133.348 E.00866
G1 X150.443 Y125.36 E.15938
G1 X150.443 Y124.746 E.00866
G1 X142.455 Y132.734 E.15938
G1 X142.455 Y132.12 E.00866
G1 X150.443 Y124.132 E.15938
G1 X150.443 Y123.518 E.00866
G1 X142.455 Y131.506 E.15938
G1 X142.455 Y130.892 E.00866
G1 X150.443 Y122.904 E.15938
G1 X150.443 Y122.29 E.00866
G1 X142.455 Y130.279 E.15938
G1 X142.455 Y129.665 E.00866
G1 X150.443 Y121.676 E.15938
G1 X150.443 Y121.062 E.00866
G1 X142.455 Y129.051 E.15938
G1 X142.455 Y128.437 E.00866
G1 X150.443 Y120.449 E.15938
G1 X150.443 Y119.835 E.00866
G1 X142.455 Y127.823 E.15938
G1 X142.455 Y127.209 E.00866
G1 X150.443 Y119.221 E.15938
G1 X150.443 Y118.607 E.00866
G1 X142.455 Y126.595 E.15938
G1 X142.455 Y125.981 E.00866
G1 X150.443 Y117.993 E.15938
G1 X150.443 Y117.557 E.00615
G1 X150.265 Y117.557 E.00251
G1 X142.455 Y125.367 E.15583
G1 X142.455 Y124.753 E.00866
G1 X149.651 Y117.557 E.14358
G1 X149.037 Y117.557 E.00866
G1 X142.455 Y124.139 E.13133
G1 X142.455 Y123.525 E.00866
G1 X148.423 Y117.557 E.11908
G1 X147.809 Y117.557 E.00866
G1 X142.455 Y122.911 E.10683
G1 X142.455 Y122.297 E.00866
G1 X147.195 Y117.557 E.09458
G1 X146.581 Y117.557 E.00866
G1 X142.455 Y121.684 E.08233
G1 X142.455 Y121.07 E.00866
G1 X145.967 Y117.557 E.07008
G1 X145.353 Y117.557 E.00866
G1 X142.455 Y120.456 E.05783
G1 X142.455 Y119.842 E.00866
G1 X144.74 Y117.557 E.04559
G1 X144.126 Y117.557 E.00866
G1 X142.455 Y119.228 E.03334
G1 X142.455 Y118.614 E.00866
G1 X143.512 Y117.557 E.02109
G1 X142.898 Y117.557 E.00866
G1 X142.26 Y118.195 E.01273
G1 X129.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F16026
G1 X130.01 Y117.542 E.01228
G1 X130.59 Y117.542 E.00776
G1 X129.542 Y118.59 E.01982
G1 X129.542 Y119.171 E.00776
G1 X131.171 Y117.542 E.0308
G1 X131.751 Y117.542 E.00776
G1 X129.542 Y119.751 E.04177
G1 X129.542 Y120.331 E.00776
G1 X132.331 Y117.542 E.05274
G1 X132.911 Y117.542 E.00776
G1 X129.542 Y120.911 E.06371
G1 X129.542 Y121.491 E.00776
G1 X133.491 Y117.542 E.07469
G1 X134.072 Y117.542 E.00776
G1 X129.542 Y122.071 E.08566
G1 X129.542 Y122.652 E.00776
G1 X134.652 Y117.542 E.09663
G1 X135.232 Y117.542 E.00776
G1 X129.542 Y123.232 E.1076
G1 X129.542 Y123.812 E.00776
G1 X135.812 Y117.542 E.11858
G1 X136.392 Y117.542 E.00776
G1 X129.542 Y124.392 E.12955
G1 X129.542 Y124.972 E.00776
G1 X136.973 Y117.542 E.14052
G1 X137.553 Y117.542 E.00776
G1 X129.542 Y125.553 E.15149
G1 X129.542 Y126.133 E.00776
G1 X138.133 Y117.542 E.16247
G1 X138.713 Y117.542 E.00776
G1 X129.542 Y126.713 E.17344
G1 X129.542 Y127.293 E.00776
G1 X139.293 Y117.542 E.18441
G1 X139.874 Y117.542 E.00776
G1 X129.542 Y127.873 E.19538
G1 X129.542 Y128.454 E.00776
G1 X140.454 Y117.542 E.20635
G1 X141.034 Y117.542 E.00776
G1 X129.542 Y129.034 E.21733
G1 X129.542 Y129.614 E.00776
G1 X141.614 Y117.542 E.2283
G1 X142.037 Y117.542 E.00565
G1 X142.037 Y117.699 E.00211
G1 X129.542 Y130.194 E.23629
G1 X129.542 Y130.774 E.00776
G1 X142.037 Y118.28 E.23629
G1 X142.037 Y118.86 E.00776
G1 X129.542 Y131.355 E.23629
G1 X129.542 Y131.935 E.00776
G1 X142.037 Y119.44 E.23629
G1 X142.037 Y120.02 E.00776
G1 X129.542 Y132.515 E.23629
G1 X129.542 Y133.095 E.00776
G1 X142.037 Y120.6 E.23629
G1 X142.037 Y121.181 E.00776
G1 X129.542 Y133.675 E.23629
G1 X129.542 Y134.256 E.00776
G1 X142.037 Y121.761 E.23629
G1 X142.037 Y122.341 E.00776
G1 X129.92 Y134.458 E.22915
G1 X130.5 Y134.458 E.00776
G1 X142.037 Y122.921 E.21818
G1 X142.037 Y123.501 E.00776
G1 X131.08 Y134.458 E.2072
G1 X131.66 Y134.458 E.00776
G1 X142.037 Y124.082 E.19623
G1 X142.037 Y124.662 E.00776
G1 X132.241 Y134.458 E.18526
G1 X132.821 Y134.458 E.00776
G1 X142.037 Y125.242 E.17429
G1 X142.037 Y125.822 E.00776
G1 X133.401 Y134.458 E.16331
G1 X133.981 Y134.458 E.00776
G1 X142.037 Y126.402 E.15234
G1 X142.037 Y126.983 E.00776
G1 X134.561 Y134.458 E.14137
G1 X135.142 Y134.458 E.00776
G1 X142.037 Y127.563 E.1304
G1 X142.037 Y128.143 E.00776
G1 X135.722 Y134.458 E.11943
G1 X136.302 Y134.458 E.00776
G1 X142.037 Y128.723 E.10845
G1 X142.037 Y129.303 E.00776
G1 X136.882 Y134.458 E.09748
G1 X137.462 Y134.458 E.00776
G1 X142.037 Y129.884 E.08651
G1 X142.037 Y130.464 E.00776
G1 X138.043 Y134.458 E.07554
G1 X138.623 Y134.458 E.00776
G1 X142.037 Y131.044 E.06456
G1 X142.037 Y131.624 E.00776
G1 X139.203 Y134.458 E.05359
G1 X139.783 Y134.458 E.00776
G1 X142.037 Y132.204 E.04262
G1 X142.037 Y132.785 E.00776
G1 X140.363 Y134.458 E.03165
G1 X140.944 Y134.458 E.00776
G1 X142.037 Y133.365 E.02067
G1 X142.037 Y133.945 E.00776
G1 X141.343 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X142.037 Y133.945 E-.37311
G1 X142.037 Y133.365 E-.22047
G1 X141.727 Y133.674 E-.16642
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/88
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.04 I-.154 J1.207 P1  F30000
G1 X150.834 Y134.834 Z4.04
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.093 Y134.638 Z4.12 F30000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15923
G1 X142.455 Y134 E.01273
G1 X142.455 Y133.386 E.00866
G1 X143.512 Y134.443 E.02109
G1 X144.126 Y134.443 E.00866
G1 X142.455 Y132.772 E.03334
G1 X142.455 Y132.158 E.00866
G1 X144.74 Y134.443 E.04559
G1 X145.353 Y134.443 E.00866
G1 X142.455 Y131.544 E.05783
G1 X142.455 Y130.93 E.00866
G1 X145.967 Y134.443 E.07008
G1 X146.581 Y134.443 E.00866
G1 X142.455 Y130.316 E.08233
G1 X142.455 Y129.702 E.00866
G1 X147.195 Y134.443 E.09458
G1 X147.809 Y134.443 E.00866
G1 X142.455 Y129.089 E.10683
G1 X142.455 Y128.475 E.00866
G1 X148.423 Y134.443 E.11908
G1 X149.037 Y134.443 E.00866
G1 X142.455 Y127.861 E.13133
G1 X142.455 Y127.247 E.00866
G1 X149.651 Y134.443 E.14358
G1 X150.265 Y134.443 E.00866
G1 X142.455 Y126.633 E.15583
G1 X142.455 Y126.019 E.00866
G1 X150.443 Y134.007 E.15938
G1 X150.443 Y133.393 E.00866
G1 X142.455 Y125.405 E.15938
G1 X142.455 Y124.791 E.00866
G1 X150.443 Y132.779 E.15938
G1 X150.443 Y132.165 E.00866
G1 X142.455 Y124.177 E.15938
G1 X142.455 Y123.563 E.00866
G1 X150.443 Y131.551 E.15938
G1 X150.443 Y130.938 E.00866
G1 X142.455 Y122.949 E.15938
G1 X142.455 Y122.335 E.00866
G1 X150.443 Y130.324 E.15938
G1 X150.443 Y129.71 E.00866
G1 X142.455 Y121.721 E.15938
G1 X142.455 Y121.108 E.00866
M73 P73 R7
G1 X150.443 Y129.096 E.15938
G1 X150.443 Y128.482 E.00866
G1 X142.455 Y120.494 E.15938
G1 X142.455 Y119.88 E.00866
G1 X150.443 Y127.868 E.15938
G1 X150.443 Y127.254 E.00866
G1 X142.455 Y119.266 E.15938
G1 X142.455 Y118.652 E.00866
G1 X150.443 Y126.64 E.15938
G1 X150.443 Y126.026 E.00866
G1 X142.455 Y118.038 E.15938
G1 X142.455 Y117.557 E.00679
G1 X142.588 Y117.557 E.00188
G1 X150.443 Y125.412 E.15673
G1 X150.443 Y124.798 E.00866
G1 X143.202 Y117.557 E.14448
G1 X143.816 Y117.557 E.00866
G1 X150.443 Y124.184 E.13223
G1 X150.443 Y123.57 E.00866
G1 X144.43 Y117.557 E.11998
G1 X145.043 Y117.557 E.00866
G1 X150.443 Y122.957 E.10773
G1 X150.443 Y122.343 E.00866
G1 X145.657 Y117.557 E.09548
G1 X146.271 Y117.557 E.00866
G1 X150.443 Y121.729 E.08323
G1 X150.443 Y121.115 E.00866
G1 X146.885 Y117.557 E.07098
G1 X147.499 Y117.557 E.00866
G1 X150.443 Y120.501 E.05874
G1 X150.443 Y119.887 E.00866
G1 X148.113 Y117.557 E.04649
G1 X148.727 Y117.557 E.00866
G1 X150.443 Y119.273 E.03424
G1 X150.443 Y118.659 E.00866
G1 X149.341 Y117.557 E.02199
G1 X149.955 Y117.557 E.00866
G1 X150.638 Y118.24 E.01363
G1 X142.218 Y118.236 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F15923
G1 X141.524 Y117.542 E.01313
G1 X140.944 Y117.542 E.00776
G1 X142.037 Y118.635 E.02067
G1 X142.037 Y119.215 E.00776
G1 X140.363 Y117.542 E.03165
G1 X139.783 Y117.542 E.00776
G1 X142.037 Y119.796 E.04262
G1 X142.037 Y120.376 E.00776
G1 X139.203 Y117.542 E.05359
G1 X138.623 Y117.542 E.00776
G1 X142.037 Y120.956 E.06456
G1 X142.037 Y121.536 E.00776
G1 X138.043 Y117.542 E.07554
G1 X137.462 Y117.542 E.00776
G1 X142.037 Y122.116 E.08651
G1 X142.037 Y122.697 E.00776
G1 X136.882 Y117.542 E.09748
G1 X136.302 Y117.542 E.00776
G1 X142.037 Y123.277 E.10845
G1 X142.037 Y123.857 E.00776
G1 X135.722 Y117.542 E.11943
G1 X135.142 Y117.542 E.00776
G1 X142.037 Y124.437 E.1304
G1 X142.037 Y125.017 E.00776
G1 X134.561 Y117.542 E.14137
G1 X133.981 Y117.542 E.00776
G1 X142.037 Y125.598 E.15234
G1 X142.037 Y126.178 E.00776
G1 X133.401 Y117.542 E.16331
G1 X132.821 Y117.542 E.00776
G1 X142.037 Y126.758 E.17429
G1 X142.037 Y127.338 E.00776
G1 X132.241 Y117.542 E.18526
G1 X131.66 Y117.542 E.00776
G1 X142.037 Y127.918 E.19623
G1 X142.037 Y128.499 E.00776
G1 X131.08 Y117.542 E.2072
G1 X130.5 Y117.542 E.00776
G1 X142.037 Y129.079 E.21818
G1 X142.037 Y129.659 E.00776
G1 X129.92 Y117.542 E.22915
G1 X129.542 Y117.542 E.00505
G1 X129.542 Y117.744 E.00271
G1 X142.037 Y130.239 E.23629
G1 X142.037 Y130.819 E.00776
G1 X129.542 Y118.325 E.23629
G1 X129.542 Y118.905 E.00776
G1 X142.037 Y131.4 E.23629
G1 X142.037 Y131.98 E.00776
G1 X129.542 Y119.485 E.23629
G1 X129.542 Y120.065 E.00776
G1 X142.037 Y132.56 E.23629
G1 X142.037 Y133.14 E.00776
G1 X129.542 Y120.645 E.23629
G1 X129.542 Y121.226 E.00776
G1 X142.037 Y133.72 E.23629
G1 X142.037 Y134.301 E.00776
G1 X129.542 Y121.806 E.23629
G1 X129.542 Y122.386 E.00776
G1 X141.614 Y134.458 E.2283
G1 X141.034 Y134.458 E.00776
G1 X129.542 Y122.966 E.21733
G1 X129.542 Y123.546 E.00776
G1 X140.454 Y134.458 E.20635
G1 X139.874 Y134.458 E.00776
G1 X129.542 Y124.127 E.19538
G1 X129.542 Y124.707 E.00776
G1 X139.293 Y134.458 E.18441
G1 X138.713 Y134.458 E.00776
G1 X129.542 Y125.287 E.17344
G1 X129.542 Y125.867 E.00776
G1 X138.133 Y134.458 E.16247
G1 X137.553 Y134.458 E.00776
G1 X129.542 Y126.447 E.15149
G1 X129.542 Y127.028 E.00776
G1 X136.973 Y134.458 E.14052
G1 X136.392 Y134.458 E.00776
G1 X129.542 Y127.608 E.12955
G1 X129.542 Y128.188 E.00776
G1 X135.812 Y134.458 E.11858
G1 X135.232 Y134.458 E.00776
G1 X129.542 Y128.768 E.1076
G1 X129.542 Y129.348 E.00776
G1 X134.652 Y134.458 E.09663
G1 X134.072 Y134.458 E.00776
G1 X129.542 Y129.929 E.08566
G1 X129.542 Y130.509 E.00776
G1 X133.491 Y134.458 E.07469
G1 X132.911 Y134.458 E.00776
G1 X129.542 Y131.089 E.06371
G1 X129.542 Y131.669 E.00776
G1 X132.331 Y134.458 E.05274
G1 X131.751 Y134.458 E.00776
G1 X129.542 Y132.249 E.04177
G1 X129.542 Y132.829 E.00776
G1 X131.171 Y134.458 E.0308
G1 X130.59 Y134.458 E.00776
G1 X129.542 Y133.41 E.01982
G1 X129.542 Y133.99 E.00776
G1 X130.191 Y134.639 E.01228
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X129.542 Y133.99 E-.34898
G1 X129.542 Y133.41 E-.22048
G1 X129.897 Y133.764 E-.19055
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/88
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.12 I-.062 J1.215 P1  F30000
G1 X150.834 Y134.834 Z4.12
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.76 Y134.638 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F16026
G1 X150.443 Y133.955 E.01363
G1 X150.443 Y133.341 E.00866
G1 X149.341 Y134.443 E.02199
G1 X148.727 Y134.443 E.00866
G1 X150.443 Y132.727 E.03424
G1 X150.443 Y132.113 E.00866
G1 X148.113 Y134.443 E.04649
G1 X147.499 Y134.443 E.00866
G1 X150.443 Y131.499 E.05874
G1 X150.443 Y130.885 E.00866
G1 X146.885 Y134.443 E.07098
G1 X146.271 Y134.443 E.00866
G1 X150.443 Y130.271 E.08323
G1 X150.443 Y129.657 E.00866
G1 X145.657 Y134.443 E.09548
G1 X145.043 Y134.443 E.00866
G1 X150.443 Y129.043 E.10773
G1 X150.443 Y128.43 E.00866
G1 X144.43 Y134.443 E.11998
G1 X143.816 Y134.443 E.00866
G1 X150.443 Y127.816 E.13223
G1 X150.443 Y127.202 E.00866
G1 X143.202 Y134.443 E.14448
G1 X142.588 Y134.443 E.00866
G1 X150.443 Y126.588 E.15673
G1 X150.443 Y125.974 E.00866
G1 X142.455 Y133.962 E.15938
G1 X142.455 Y133.348 E.00866
G1 X150.443 Y125.36 E.15938
G1 X150.443 Y124.746 E.00866
G1 X142.455 Y132.734 E.15938
G1 X142.455 Y132.12 E.00866
G1 X150.443 Y124.132 E.15938
G1 X150.443 Y123.518 E.00866
G1 X142.455 Y131.506 E.15938
G1 X142.455 Y130.892 E.00866
G1 X150.443 Y122.904 E.15938
G1 X150.443 Y122.29 E.00866
G1 X142.455 Y130.279 E.15938
G1 X142.455 Y129.665 E.00866
G1 X150.443 Y121.676 E.15938
G1 X150.443 Y121.062 E.00866
G1 X142.455 Y129.051 E.15938
G1 X142.455 Y128.437 E.00866
G1 X150.443 Y120.449 E.15938
G1 X150.443 Y119.835 E.00866
G1 X142.455 Y127.823 E.15938
G1 X142.455 Y127.209 E.00866
G1 X150.443 Y119.221 E.15938
G1 X150.443 Y118.607 E.00866
G1 X142.455 Y126.595 E.15938
G1 X142.455 Y125.981 E.00866
G1 X150.443 Y117.993 E.15938
G1 X150.443 Y117.557 E.00615
G1 X150.265 Y117.557 E.00251
G1 X142.455 Y125.367 E.15583
G1 X142.455 Y124.753 E.00866
G1 X149.651 Y117.557 E.14358
G1 X149.037 Y117.557 E.00866
G1 X142.455 Y124.139 E.13133
G1 X142.455 Y123.525 E.00866
G1 X148.423 Y117.557 E.11908
G1 X147.809 Y117.557 E.00866
G1 X142.455 Y122.911 E.10683
G1 X142.455 Y122.297 E.00866
G1 X147.195 Y117.557 E.09458
G1 X146.581 Y117.557 E.00866
G1 X142.455 Y121.684 E.08233
G1 X142.455 Y121.07 E.00866
G1 X145.967 Y117.557 E.07008
G1 X145.353 Y117.557 E.00866
G1 X142.455 Y120.456 E.05783
G1 X142.455 Y119.842 E.00866
G1 X144.74 Y117.557 E.04559
G1 X144.126 Y117.557 E.00866
G1 X142.455 Y119.228 E.03334
G1 X142.455 Y118.614 E.00866
G1 X143.512 Y117.557 E.02109
G1 X142.898 Y117.557 E.00866
G1 X142.26 Y118.195 E.01273
G1 X129.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F16026
G1 X130.01 Y117.542 E.01228
G1 X130.59 Y117.542 E.00776
G1 X129.542 Y118.59 E.01982
G1 X129.542 Y119.171 E.00776
G1 X131.171 Y117.542 E.0308
G1 X131.751 Y117.542 E.00776
G1 X129.542 Y119.751 E.04177
G1 X129.542 Y120.331 E.00776
G1 X132.331 Y117.542 E.05274
G1 X132.911 Y117.542 E.00776
G1 X129.542 Y120.911 E.06371
G1 X129.542 Y121.491 E.00776
G1 X133.491 Y117.542 E.07469
G1 X134.072 Y117.542 E.00776
G1 X129.542 Y122.071 E.08566
G1 X129.542 Y122.652 E.00776
G1 X134.652 Y117.542 E.09663
G1 X135.232 Y117.542 E.00776
G1 X129.542 Y123.232 E.1076
G1 X129.542 Y123.812 E.00776
G1 X135.812 Y117.542 E.11858
G1 X136.392 Y117.542 E.00776
G1 X129.542 Y124.392 E.12955
G1 X129.542 Y124.972 E.00776
G1 X136.973 Y117.542 E.14052
G1 X137.553 Y117.542 E.00776
G1 X129.542 Y125.553 E.15149
G1 X129.542 Y126.133 E.00776
G1 X138.133 Y117.542 E.16247
G1 X138.713 Y117.542 E.00776
G1 X129.542 Y126.713 E.17344
G1 X129.542 Y127.293 E.00776
G1 X139.293 Y117.542 E.18441
G1 X139.874 Y117.542 E.00776
G1 X129.542 Y127.873 E.19538
G1 X129.542 Y128.454 E.00776
G1 X140.454 Y117.542 E.20635
G1 X141.034 Y117.542 E.00776
G1 X129.542 Y129.034 E.21733
G1 X129.542 Y129.614 E.00776
G1 X141.614 Y117.542 E.2283
G1 X142.037 Y117.542 E.00565
G1 X142.037 Y117.699 E.00211
G1 X129.542 Y130.194 E.23629
G1 X129.542 Y130.774 E.00776
G1 X142.037 Y118.28 E.23629
G1 X142.037 Y118.86 E.00776
G1 X129.542 Y131.355 E.23629
G1 X129.542 Y131.935 E.00776
G1 X142.037 Y119.44 E.23629
G1 X142.037 Y120.02 E.00776
G1 X129.542 Y132.515 E.23629
G1 X129.542 Y133.095 E.00776
G1 X142.037 Y120.6 E.23629
G1 X142.037 Y121.181 E.00776
G1 X129.542 Y133.675 E.23629
G1 X129.542 Y134.256 E.00776
G1 X142.037 Y121.761 E.23629
G1 X142.037 Y122.341 E.00776
G1 X129.92 Y134.458 E.22915
G1 X130.5 Y134.458 E.00776
G1 X142.037 Y122.921 E.21818
G1 X142.037 Y123.501 E.00776
G1 X131.08 Y134.458 E.2072
G1 X131.66 Y134.458 E.00776
G1 X142.037 Y124.082 E.19623
G1 X142.037 Y124.662 E.00776
G1 X132.241 Y134.458 E.18526
G1 X132.821 Y134.458 E.00776
G1 X142.037 Y125.242 E.17429
G1 X142.037 Y125.822 E.00776
G1 X133.401 Y134.458 E.16331
G1 X133.981 Y134.458 E.00776
G1 X142.037 Y126.402 E.15234
G1 X142.037 Y126.983 E.00776
G1 X134.561 Y134.458 E.14137
G1 X135.142 Y134.458 E.00776
G1 X142.037 Y127.563 E.1304
G1 X142.037 Y128.143 E.00776
G1 X135.722 Y134.458 E.11943
G1 X136.302 Y134.458 E.00776
G1 X142.037 Y128.723 E.10845
G1 X142.037 Y129.303 E.00776
G1 X136.882 Y134.458 E.09748
G1 X137.462 Y134.458 E.00776
M73 P74 R7
G1 X142.037 Y129.884 E.08651
G1 X142.037 Y130.464 E.00776
G1 X138.043 Y134.458 E.07554
G1 X138.623 Y134.458 E.00776
G1 X142.037 Y131.044 E.06456
G1 X142.037 Y131.624 E.00776
G1 X139.203 Y134.458 E.05359
G1 X139.783 Y134.458 E.00776
G1 X142.037 Y132.204 E.04262
G1 X142.037 Y132.785 E.00776
G1 X140.363 Y134.458 E.03165
G1 X140.944 Y134.458 E.00776
G1 X142.037 Y133.365 E.02067
G1 X142.037 Y133.945 E.00776
G1 X141.343 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F21000
G1 X142.037 Y133.945 E-.37311
G1 X142.037 Y133.365 E-.22047
G1 X141.727 Y133.674 E-.16642
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/88
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.2 I-.154 J1.207 P1  F30000
G1 X150.834 Y134.834 Z4.2
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.093 Y134.638 Z4.28 F30000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15923
G1 X142.455 Y134 E.01273
G1 X142.455 Y133.386 E.00866
G1 X143.512 Y134.443 E.02109
G1 X144.126 Y134.443 E.00866
G1 X142.455 Y132.772 E.03334
G1 X142.455 Y132.158 E.00866
G1 X144.74 Y134.443 E.04559
G1 X145.353 Y134.443 E.00866
G1 X142.455 Y131.544 E.05783
G1 X142.455 Y130.93 E.00866
G1 X145.967 Y134.443 E.07008
G1 X146.581 Y134.443 E.00866
G1 X142.455 Y130.316 E.08233
G1 X142.455 Y129.702 E.00866
G1 X147.195 Y134.443 E.09458
G1 X147.809 Y134.443 E.00866
G1 X142.455 Y129.089 E.10683
G1 X142.455 Y128.475 E.00866
G1 X148.423 Y134.443 E.11908
G1 X149.037 Y134.443 E.00866
G1 X142.455 Y127.861 E.13133
G1 X142.455 Y127.247 E.00866
G1 X149.651 Y134.443 E.14358
G1 X150.265 Y134.443 E.00866
G1 X142.455 Y126.633 E.15583
G1 X142.455 Y126.019 E.00866
G1 X150.443 Y134.007 E.15938
G1 X150.443 Y133.393 E.00866
G1 X142.455 Y125.405 E.15938
G1 X142.455 Y124.791 E.00866
G1 X150.443 Y132.779 E.15938
G1 X150.443 Y132.165 E.00866
G1 X142.455 Y124.177 E.15938
G1 X142.455 Y123.563 E.00866
G1 X150.443 Y131.551 E.15938
G1 X150.443 Y130.938 E.00866
G1 X142.455 Y122.949 E.15938
G1 X142.455 Y122.335 E.00866
G1 X150.443 Y130.324 E.15938
G1 X150.443 Y129.71 E.00866
G1 X142.455 Y121.721 E.15938
G1 X142.455 Y121.108 E.00866
G1 X150.443 Y129.096 E.15938
G1 X150.443 Y128.482 E.00866
G1 X142.455 Y120.494 E.15938
G1 X142.455 Y119.88 E.00866
G1 X150.443 Y127.868 E.15938
G1 X150.443 Y127.254 E.00866
G1 X142.455 Y119.266 E.15938
G1 X142.455 Y118.652 E.00866
G1 X150.443 Y126.64 E.15938
G1 X150.443 Y126.026 E.00866
G1 X142.455 Y118.038 E.15938
G1 X142.455 Y117.557 E.00679
G1 X142.588 Y117.557 E.00188
G1 X150.443 Y125.412 E.15673
G1 X150.443 Y124.798 E.00866
G1 X143.202 Y117.557 E.14448
G1 X143.816 Y117.557 E.00866
G1 X150.443 Y124.184 E.13223
G1 X150.443 Y123.57 E.00866
G1 X144.43 Y117.557 E.11998
G1 X145.043 Y117.557 E.00866
G1 X150.443 Y122.957 E.10773
G1 X150.443 Y122.343 E.00866
G1 X145.657 Y117.557 E.09548
G1 X146.271 Y117.557 E.00866
G1 X150.443 Y121.729 E.08323
G1 X150.443 Y121.115 E.00866
G1 X146.885 Y117.557 E.07098
G1 X147.499 Y117.557 E.00866
G1 X150.443 Y120.501 E.05874
G1 X150.443 Y119.887 E.00866
G1 X148.113 Y117.557 E.04649
G1 X148.727 Y117.557 E.00866
G1 X150.443 Y119.273 E.03424
G1 X150.443 Y118.659 E.00866
G1 X149.341 Y117.557 E.02199
G1 X149.955 Y117.557 E.00866
G1 X150.638 Y118.24 E.01363
G1 X142.218 Y118.236 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F15923
G1 X141.524 Y117.542 E.01313
G1 X140.944 Y117.542 E.00776
G1 X142.037 Y118.635 E.02067
G1 X142.037 Y119.215 E.00776
G1 X140.363 Y117.542 E.03165
G1 X139.783 Y117.542 E.00776
G1 X142.037 Y119.796 E.04262
G1 X142.037 Y120.376 E.00776
G1 X139.203 Y117.542 E.05359
G1 X138.623 Y117.542 E.00776
G1 X142.037 Y120.956 E.06456
G1 X142.037 Y121.536 E.00776
G1 X138.043 Y117.542 E.07554
G1 X137.462 Y117.542 E.00776
G1 X142.037 Y122.116 E.08651
G1 X142.037 Y122.697 E.00776
G1 X136.882 Y117.542 E.09748
G1 X136.302 Y117.542 E.00776
G1 X142.037 Y123.277 E.10845
G1 X142.037 Y123.857 E.00776
G1 X135.722 Y117.542 E.11943
G1 X135.142 Y117.542 E.00776
G1 X142.037 Y124.437 E.1304
G1 X142.037 Y125.017 E.00776
G1 X134.561 Y117.542 E.14137
G1 X133.981 Y117.542 E.00776
G1 X142.037 Y125.598 E.15234
G1 X142.037 Y126.178 E.00776
G1 X133.401 Y117.542 E.16331
G1 X132.821 Y117.542 E.00776
G1 X142.037 Y126.758 E.17429
G1 X142.037 Y127.338 E.00776
G1 X132.241 Y117.542 E.18526
G1 X131.66 Y117.542 E.00776
G1 X142.037 Y127.918 E.19623
G1 X142.037 Y128.499 E.00776
G1 X131.08 Y117.542 E.2072
G1 X130.5 Y117.542 E.00776
G1 X142.037 Y129.079 E.21818
G1 X142.037 Y129.659 E.00776
G1 X129.92 Y117.542 E.22915
G1 X129.542 Y117.542 E.00505
G1 X129.542 Y117.744 E.00271
G1 X142.037 Y130.239 E.23629
G1 X142.037 Y130.819 E.00776
G1 X129.542 Y118.325 E.23629
G1 X129.542 Y118.905 E.00776
G1 X142.037 Y131.4 E.23629
G1 X142.037 Y131.98 E.00776
G1 X129.542 Y119.485 E.23629
G1 X129.542 Y120.065 E.00776
G1 X142.037 Y132.56 E.23629
G1 X142.037 Y133.14 E.00776
G1 X129.542 Y120.645 E.23629
G1 X129.542 Y121.226 E.00776
G1 X142.037 Y133.72 E.23629
G1 X142.037 Y134.301 E.00776
G1 X129.542 Y121.806 E.23629
G1 X129.542 Y122.386 E.00776
G1 X141.614 Y134.458 E.2283
G1 X141.034 Y134.458 E.00776
G1 X129.542 Y122.966 E.21733
G1 X129.542 Y123.546 E.00776
G1 X140.454 Y134.458 E.20635
G1 X139.874 Y134.458 E.00776
G1 X129.542 Y124.127 E.19538
G1 X129.542 Y124.707 E.00776
G1 X139.293 Y134.458 E.18441
G1 X138.713 Y134.458 E.00776
G1 X129.542 Y125.287 E.17344
G1 X129.542 Y125.867 E.00776
G1 X138.133 Y134.458 E.16247
G1 X137.553 Y134.458 E.00776
G1 X129.542 Y126.447 E.15149
G1 X129.542 Y127.028 E.00776
G1 X136.973 Y134.458 E.14052
G1 X136.392 Y134.458 E.00776
G1 X129.542 Y127.608 E.12955
G1 X129.542 Y128.188 E.00776
G1 X135.812 Y134.458 E.11858
G1 X135.232 Y134.458 E.00776
G1 X129.542 Y128.768 E.1076
G1 X129.542 Y129.348 E.00776
G1 X134.652 Y134.458 E.09663
G1 X134.072 Y134.458 E.00776
G1 X129.542 Y129.929 E.08566
G1 X129.542 Y130.509 E.00776
G1 X133.491 Y134.458 E.07469
G1 X132.911 Y134.458 E.00776
G1 X129.542 Y131.089 E.06371
G1 X129.542 Y131.669 E.00776
G1 X132.331 Y134.458 E.05274
G1 X131.751 Y134.458 E.00776
G1 X129.542 Y132.249 E.04177
G1 X129.542 Y132.829 E.00776
G1 X131.171 Y134.458 E.0308
G1 X130.59 Y134.458 E.00776
G1 X129.542 Y133.41 E.01982
G1 X129.542 Y133.99 E.00776
G1 X130.191 Y134.639 E.01228
; CHANGE_LAYER
; Z_HEIGHT: 3.96
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X129.542 Y133.99 E-.34898
G1 X129.542 Y133.41 E-.22048
G1 X129.897 Y133.764 E-.19055
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/88
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.28 I-.062 J1.215 P1  F30000
G1 X150.834 Y134.834 Z4.28
G1 Z3.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.76 Y134.638 Z4.36 F30000
G1 Z3.96
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F16026
G1 X150.443 Y133.955 E.01363
G1 X150.443 Y133.341 E.00866
G1 X149.341 Y134.443 E.02199
G1 X148.727 Y134.443 E.00866
G1 X150.443 Y132.727 E.03424
G1 X150.443 Y132.113 E.00866
G1 X148.113 Y134.443 E.04649
G1 X147.499 Y134.443 E.00866
G1 X150.443 Y131.499 E.05874
G1 X150.443 Y130.885 E.00866
G1 X146.885 Y134.443 E.07098
G1 X146.271 Y134.443 E.00866
G1 X150.443 Y130.271 E.08323
G1 X150.443 Y129.657 E.00866
G1 X145.657 Y134.443 E.09548
G1 X145.043 Y134.443 E.00866
G1 X150.443 Y129.043 E.10773
G1 X150.443 Y128.43 E.00866
G1 X144.43 Y134.443 E.11998
G1 X143.816 Y134.443 E.00866
G1 X150.443 Y127.816 E.13223
G1 X150.443 Y127.202 E.00866
G1 X143.202 Y134.443 E.14448
G1 X142.588 Y134.443 E.00866
G1 X150.443 Y126.588 E.15673
G1 X150.443 Y125.974 E.00866
G1 X142.455 Y133.962 E.15938
G1 X142.455 Y133.348 E.00866
G1 X150.443 Y125.36 E.15938
G1 X150.443 Y124.746 E.00866
G1 X142.455 Y132.734 E.15938
G1 X142.455 Y132.12 E.00866
G1 X150.443 Y124.132 E.15938
G1 X150.443 Y123.518 E.00866
G1 X142.455 Y131.506 E.15938
G1 X142.455 Y130.892 E.00866
G1 X150.443 Y122.904 E.15938
M73 P74 R6
G1 X150.443 Y122.29 E.00866
G1 X142.455 Y130.279 E.15938
G1 X142.455 Y129.665 E.00866
G1 X150.443 Y121.676 E.15938
M73 P75 R6
G1 X150.443 Y121.062 E.00866
G1 X142.455 Y129.051 E.15938
G1 X142.455 Y128.437 E.00866
G1 X150.443 Y120.449 E.15938
G1 X150.443 Y119.835 E.00866
G1 X142.455 Y127.823 E.15938
G1 X142.455 Y127.209 E.00866
G1 X150.443 Y119.221 E.15938
G1 X150.443 Y118.607 E.00866
G1 X142.455 Y126.595 E.15938
G1 X142.455 Y125.981 E.00866
G1 X150.443 Y117.993 E.15938
G1 X150.443 Y117.557 E.00615
G1 X150.265 Y117.557 E.00251
G1 X142.455 Y125.367 E.15583
G1 X142.455 Y124.753 E.00866
G1 X149.651 Y117.557 E.14358
G1 X149.037 Y117.557 E.00866
G1 X142.455 Y124.139 E.13133
G1 X142.455 Y123.525 E.00866
G1 X148.423 Y117.557 E.11908
G1 X147.809 Y117.557 E.00866
G1 X142.455 Y122.911 E.10683
G1 X142.455 Y122.297 E.00866
G1 X147.195 Y117.557 E.09458
G1 X146.581 Y117.557 E.00866
G1 X142.455 Y121.684 E.08233
G1 X142.455 Y121.07 E.00866
G1 X145.967 Y117.557 E.07008
G1 X145.353 Y117.557 E.00866
G1 X142.455 Y120.456 E.05783
G1 X142.455 Y119.842 E.00866
G1 X144.74 Y117.557 E.04559
G1 X144.126 Y117.557 E.00866
G1 X142.455 Y119.228 E.03334
G1 X142.455 Y118.614 E.00866
G1 X143.512 Y117.557 E.02109
G1 X142.898 Y117.557 E.00866
G1 X142.26 Y118.195 E.01273
G1 X129.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F16026
G1 X130.01 Y117.542 E.01228
G1 X130.59 Y117.542 E.00776
G1 X129.542 Y118.59 E.01982
G1 X129.542 Y119.171 E.00776
G1 X131.171 Y117.542 E.0308
G1 X131.751 Y117.542 E.00776
G1 X129.542 Y119.751 E.04177
G1 X129.542 Y120.331 E.00776
G1 X132.331 Y117.542 E.05274
G1 X132.911 Y117.542 E.00776
G1 X129.542 Y120.911 E.06371
G1 X129.542 Y121.491 E.00776
G1 X133.491 Y117.542 E.07469
G1 X134.072 Y117.542 E.00776
G1 X129.542 Y122.071 E.08566
G1 X129.542 Y122.652 E.00776
G1 X134.652 Y117.542 E.09663
G1 X135.232 Y117.542 E.00776
G1 X129.542 Y123.232 E.1076
G1 X129.542 Y123.812 E.00776
G1 X135.812 Y117.542 E.11858
G1 X136.392 Y117.542 E.00776
G1 X129.542 Y124.392 E.12955
G1 X129.542 Y124.972 E.00776
G1 X136.973 Y117.542 E.14052
G1 X137.553 Y117.542 E.00776
G1 X129.542 Y125.553 E.15149
G1 X129.542 Y126.133 E.00776
G1 X138.133 Y117.542 E.16247
G1 X138.713 Y117.542 E.00776
G1 X129.542 Y126.713 E.17344
G1 X129.542 Y127.293 E.00776
G1 X139.293 Y117.542 E.18441
G1 X139.874 Y117.542 E.00776
G1 X129.542 Y127.873 E.19538
G1 X129.542 Y128.454 E.00776
G1 X140.454 Y117.542 E.20635
G1 X141.034 Y117.542 E.00776
G1 X129.542 Y129.034 E.21733
G1 X129.542 Y129.614 E.00776
G1 X141.614 Y117.542 E.2283
G1 X142.037 Y117.542 E.00565
G1 X142.037 Y117.699 E.00211
G1 X129.542 Y130.194 E.23629
G1 X129.542 Y130.774 E.00776
G1 X142.037 Y118.28 E.23629
G1 X142.037 Y118.86 E.00776
G1 X129.542 Y131.355 E.23629
G1 X129.542 Y131.935 E.00776
G1 X142.037 Y119.44 E.23629
G1 X142.037 Y120.02 E.00776
G1 X129.542 Y132.515 E.23629
G1 X129.542 Y133.095 E.00776
G1 X142.037 Y120.6 E.23629
G1 X142.037 Y121.181 E.00776
G1 X129.542 Y133.675 E.23629
G1 X129.542 Y134.256 E.00776
G1 X142.037 Y121.761 E.23629
G1 X142.037 Y122.341 E.00776
G1 X129.92 Y134.458 E.22915
G1 X130.5 Y134.458 E.00776
G1 X142.037 Y122.921 E.21818
G1 X142.037 Y123.501 E.00776
G1 X131.08 Y134.458 E.2072
G1 X131.66 Y134.458 E.00776
G1 X142.037 Y124.082 E.19623
G1 X142.037 Y124.662 E.00776
G1 X132.241 Y134.458 E.18526
G1 X132.821 Y134.458 E.00776
G1 X142.037 Y125.242 E.17429
G1 X142.037 Y125.822 E.00776
G1 X133.401 Y134.458 E.16331
G1 X133.981 Y134.458 E.00776
G1 X142.037 Y126.402 E.15234
G1 X142.037 Y126.983 E.00776
G1 X134.561 Y134.458 E.14137
G1 X135.142 Y134.458 E.00776
G1 X142.037 Y127.563 E.1304
G1 X142.037 Y128.143 E.00776
G1 X135.722 Y134.458 E.11943
G1 X136.302 Y134.458 E.00776
G1 X142.037 Y128.723 E.10845
G1 X142.037 Y129.303 E.00776
G1 X136.882 Y134.458 E.09748
G1 X137.462 Y134.458 E.00776
G1 X142.037 Y129.884 E.08651
G1 X142.037 Y130.464 E.00776
G1 X138.043 Y134.458 E.07554
G1 X138.623 Y134.458 E.00776
G1 X142.037 Y131.044 E.06456
G1 X142.037 Y131.624 E.00776
G1 X139.203 Y134.458 E.05359
G1 X139.783 Y134.458 E.00776
G1 X142.037 Y132.204 E.04262
G1 X142.037 Y132.785 E.00776
G1 X140.363 Y134.458 E.03165
G1 X140.944 Y134.458 E.00776
G1 X142.037 Y133.365 E.02067
G1 X142.037 Y133.945 E.00776
G1 X141.343 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X142.037 Y133.945 E-.37311
G1 X142.037 Y133.365 E-.22047
G1 X141.727 Y133.674 E-.16642
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/88
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.36 I-.154 J1.207 P1  F30000
G1 X150.834 Y134.834 Z4.36
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.093 Y134.638 Z4.44 F30000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F15923
G1 X142.455 Y134 E.01273
G1 X142.455 Y133.386 E.00866
G1 X143.512 Y134.443 E.02109
G1 X144.126 Y134.443 E.00866
G1 X142.455 Y132.772 E.03334
G1 X142.455 Y132.158 E.00866
G1 X144.74 Y134.443 E.04559
G1 X145.353 Y134.443 E.00866
G1 X142.455 Y131.544 E.05783
G1 X142.455 Y130.93 E.00866
G1 X145.967 Y134.443 E.07008
G1 X146.581 Y134.443 E.00866
G1 X142.455 Y130.316 E.08233
G1 X142.455 Y129.702 E.00866
G1 X147.195 Y134.443 E.09458
G1 X147.809 Y134.443 E.00866
G1 X142.455 Y129.089 E.10683
G1 X142.455 Y128.475 E.00866
G1 X148.423 Y134.443 E.11908
G1 X149.037 Y134.443 E.00866
G1 X142.455 Y127.861 E.13133
G1 X142.455 Y127.247 E.00866
G1 X149.651 Y134.443 E.14358
G1 X150.265 Y134.443 E.00866
G1 X142.455 Y126.633 E.15583
G1 X142.455 Y126.019 E.00866
G1 X150.443 Y134.007 E.15938
G1 X150.443 Y133.393 E.00866
G1 X142.455 Y125.405 E.15938
G1 X142.455 Y124.791 E.00866
G1 X150.443 Y132.779 E.15938
G1 X150.443 Y132.165 E.00866
G1 X142.455 Y124.177 E.15938
G1 X142.455 Y123.563 E.00866
G1 X150.443 Y131.551 E.15938
G1 X150.443 Y130.938 E.00866
G1 X142.455 Y122.949 E.15938
G1 X142.455 Y122.335 E.00866
G1 X150.443 Y130.324 E.15938
G1 X150.443 Y129.71 E.00866
G1 X142.455 Y121.721 E.15938
G1 X142.455 Y121.108 E.00866
G1 X150.443 Y129.096 E.15938
G1 X150.443 Y128.482 E.00866
G1 X142.455 Y120.494 E.15938
G1 X142.455 Y119.88 E.00866
G1 X150.443 Y127.868 E.15938
G1 X150.443 Y127.254 E.00866
G1 X142.455 Y119.266 E.15938
G1 X142.455 Y118.652 E.00866
G1 X150.443 Y126.64 E.15938
G1 X150.443 Y126.026 E.00866
G1 X142.455 Y118.038 E.15938
G1 X142.455 Y117.557 E.00679
G1 X142.588 Y117.557 E.00188
G1 X150.443 Y125.412 E.15673
G1 X150.443 Y124.798 E.00866
G1 X143.202 Y117.557 E.14448
G1 X143.816 Y117.557 E.00866
G1 X150.443 Y124.184 E.13223
G1 X150.443 Y123.57 E.00866
G1 X144.43 Y117.557 E.11998
G1 X145.043 Y117.557 E.00866
G1 X150.443 Y122.957 E.10773
G1 X150.443 Y122.343 E.00866
G1 X145.657 Y117.557 E.09548
G1 X146.271 Y117.557 E.00866
G1 X150.443 Y121.729 E.08323
G1 X150.443 Y121.115 E.00866
G1 X146.885 Y117.557 E.07098
G1 X147.499 Y117.557 E.00866
G1 X150.443 Y120.501 E.05874
G1 X150.443 Y119.887 E.00866
G1 X148.113 Y117.557 E.04649
G1 X148.727 Y117.557 E.00866
G1 X150.443 Y119.273 E.03424
G1 X150.443 Y118.659 E.00866
G1 X149.341 Y117.557 E.02199
G1 X149.955 Y117.557 E.00866
G1 X150.638 Y118.24 E.01363
G1 X142.218 Y118.236 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F15923
G1 X141.524 Y117.542 E.01313
G1 X140.944 Y117.542 E.00776
G1 X142.037 Y118.635 E.02067
G1 X142.037 Y119.215 E.00776
G1 X140.363 Y117.542 E.03165
G1 X139.783 Y117.542 E.00776
G1 X142.037 Y119.796 E.04262
G1 X142.037 Y120.376 E.00776
G1 X139.203 Y117.542 E.05359
G1 X138.623 Y117.542 E.00776
G1 X142.037 Y120.956 E.06456
G1 X142.037 Y121.536 E.00776
G1 X138.043 Y117.542 E.07554
G1 X137.462 Y117.542 E.00776
G1 X142.037 Y122.116 E.08651
G1 X142.037 Y122.697 E.00776
G1 X136.882 Y117.542 E.09748
G1 X136.302 Y117.542 E.00776
G1 X142.037 Y123.277 E.10845
G1 X142.037 Y123.857 E.00776
G1 X135.722 Y117.542 E.11943
G1 X135.142 Y117.542 E.00776
G1 X142.037 Y124.437 E.1304
G1 X142.037 Y125.017 E.00776
G1 X134.561 Y117.542 E.14137
G1 X133.981 Y117.542 E.00776
G1 X142.037 Y125.598 E.15234
G1 X142.037 Y126.178 E.00776
G1 X133.401 Y117.542 E.16331
G1 X132.821 Y117.542 E.00776
G1 X142.037 Y126.758 E.17429
G1 X142.037 Y127.338 E.00776
G1 X132.241 Y117.542 E.18526
G1 X131.66 Y117.542 E.00776
G1 X142.037 Y127.918 E.19623
G1 X142.037 Y128.499 E.00776
G1 X131.08 Y117.542 E.2072
G1 X130.5 Y117.542 E.00776
G1 X142.037 Y129.079 E.21818
G1 X142.037 Y129.659 E.00776
G1 X129.92 Y117.542 E.22915
G1 X129.542 Y117.542 E.00505
G1 X129.542 Y117.744 E.00271
G1 X142.037 Y130.239 E.23629
G1 X142.037 Y130.819 E.00776
G1 X129.542 Y118.325 E.23629
G1 X129.542 Y118.905 E.00776
G1 X142.037 Y131.4 E.23629
G1 X142.037 Y131.98 E.00776
G1 X129.542 Y119.485 E.23629
G1 X129.542 Y120.065 E.00776
G1 X142.037 Y132.56 E.23629
G1 X142.037 Y133.14 E.00776
G1 X129.542 Y120.645 E.23629
G1 X129.542 Y121.226 E.00776
G1 X142.037 Y133.72 E.23629
G1 X142.037 Y134.301 E.00776
G1 X129.542 Y121.806 E.23629
G1 X129.542 Y122.386 E.00776
G1 X141.614 Y134.458 E.2283
G1 X141.034 Y134.458 E.00776
G1 X129.542 Y122.966 E.21733
G1 X129.542 Y123.546 E.00776
M73 P76 R6
G1 X140.454 Y134.458 E.20635
G1 X139.874 Y134.458 E.00776
G1 X129.542 Y124.127 E.19538
G1 X129.542 Y124.707 E.00776
G1 X139.293 Y134.458 E.18441
G1 X138.713 Y134.458 E.00776
G1 X129.542 Y125.287 E.17344
G1 X129.542 Y125.867 E.00776
G1 X138.133 Y134.458 E.16247
G1 X137.553 Y134.458 E.00776
G1 X129.542 Y126.447 E.15149
G1 X129.542 Y127.028 E.00776
G1 X136.973 Y134.458 E.14052
G1 X136.392 Y134.458 E.00776
G1 X129.542 Y127.608 E.12955
G1 X129.542 Y128.188 E.00776
G1 X135.812 Y134.458 E.11858
G1 X135.232 Y134.458 E.00776
G1 X129.542 Y128.768 E.1076
G1 X129.542 Y129.348 E.00776
G1 X134.652 Y134.458 E.09663
G1 X134.072 Y134.458 E.00776
G1 X129.542 Y129.929 E.08566
G1 X129.542 Y130.509 E.00776
G1 X133.491 Y134.458 E.07469
G1 X132.911 Y134.458 E.00776
G1 X129.542 Y131.089 E.06371
G1 X129.542 Y131.669 E.00776
G1 X132.331 Y134.458 E.05274
G1 X131.751 Y134.458 E.00776
G1 X129.542 Y132.249 E.04177
G1 X129.542 Y132.829 E.00776
G1 X131.171 Y134.458 E.0308
G1 X130.59 Y134.458 E.00776
G1 X129.542 Y133.41 E.01982
G1 X129.542 Y133.99 E.00776
G1 X130.191 Y134.639 E.01228
; CHANGE_LAYER
; Z_HEIGHT: 4.12
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X129.542 Y133.99 E-.34898
G1 X129.542 Y133.41 E-.22048
G1 X129.897 Y133.764 E-.19055
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/88
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.44 I-.062 J1.215 P1  F30000
G1 X150.834 Y134.834 Z4.44
G1 Z4.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X129.166 Y134.834 E.34102
G1 X129.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.34102
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X128.683 Y135.317 E.35622
G1 X128.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.35622
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.76 Y134.638 Z4.52 F30000
G1 Z4.12
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F16026
G1 X150.443 Y133.955 E.01363
G1 X150.443 Y133.341 E.00866
G1 X149.341 Y134.443 E.02199
G1 X148.727 Y134.443 E.00866
G1 X150.443 Y132.727 E.03424
G1 X150.443 Y132.113 E.00866
G1 X148.113 Y134.443 E.04649
G1 X147.499 Y134.443 E.00866
G1 X150.443 Y131.499 E.05874
G1 X150.443 Y130.885 E.00866
G1 X146.885 Y134.443 E.07098
G1 X146.271 Y134.443 E.00866
G1 X150.443 Y130.271 E.08323
G1 X150.443 Y129.657 E.00866
G1 X145.657 Y134.443 E.09548
G1 X145.043 Y134.443 E.00866
G1 X150.443 Y129.043 E.10773
G1 X150.443 Y128.43 E.00866
G1 X144.43 Y134.443 E.11998
G1 X143.816 Y134.443 E.00866
G1 X150.443 Y127.816 E.13223
G1 X150.443 Y127.202 E.00866
G1 X143.202 Y134.443 E.14448
G1 X142.588 Y134.443 E.00866
G1 X150.443 Y126.588 E.15673
G1 X150.443 Y125.974 E.00866
G1 X142.455 Y133.962 E.15938
G1 X142.455 Y133.348 E.00866
G1 X150.443 Y125.36 E.15938
G1 X150.443 Y124.746 E.00866
G1 X142.455 Y132.734 E.15938
G1 X142.455 Y132.12 E.00866
G1 X150.443 Y124.132 E.15938
G1 X150.443 Y123.518 E.00866
G1 X142.455 Y131.506 E.15938
G1 X142.455 Y130.892 E.00866
G1 X150.443 Y122.904 E.15938
G1 X150.443 Y122.29 E.00866
G1 X142.455 Y130.279 E.15938
G1 X142.455 Y129.665 E.00866
G1 X150.443 Y121.676 E.15938
G1 X150.443 Y121.062 E.00866
G1 X142.455 Y129.051 E.15938
G1 X142.455 Y128.437 E.00866
G1 X150.443 Y120.449 E.15938
G1 X150.443 Y119.835 E.00866
G1 X142.455 Y127.823 E.15938
G1 X142.455 Y127.209 E.00866
G1 X150.443 Y119.221 E.15938
G1 X150.443 Y118.607 E.00866
G1 X142.455 Y126.595 E.15938
G1 X142.455 Y125.981 E.00866
G1 X150.443 Y117.993 E.15938
G1 X150.443 Y117.557 E.00615
G1 X150.265 Y117.557 E.00251
G1 X142.455 Y125.367 E.15583
G1 X142.455 Y124.753 E.00866
G1 X149.651 Y117.557 E.14358
G1 X149.037 Y117.557 E.00866
G1 X142.455 Y124.139 E.13133
G1 X142.455 Y123.525 E.00866
G1 X148.423 Y117.557 E.11908
G1 X147.809 Y117.557 E.00866
G1 X142.455 Y122.911 E.10683
G1 X142.455 Y122.297 E.00866
G1 X147.195 Y117.557 E.09458
G1 X146.581 Y117.557 E.00866
G1 X142.455 Y121.684 E.08233
G1 X142.455 Y121.07 E.00866
G1 X145.967 Y117.557 E.07008
G1 X145.353 Y117.557 E.00866
G1 X142.455 Y120.456 E.05783
G1 X142.455 Y119.842 E.00866
G1 X144.74 Y117.557 E.04559
G1 X144.126 Y117.557 E.00866
G1 X142.455 Y119.228 E.03334
G1 X142.455 Y118.614 E.00866
G1 X143.512 Y117.557 E.02109
G1 X142.898 Y117.557 E.00866
G1 X142.26 Y118.195 E.01273
G1 X129.361 Y118.191 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427428
G1 F16026
G1 X130.01 Y117.542 E.01228
G1 X130.59 Y117.542 E.00776
G1 X129.542 Y118.59 E.01982
G1 X129.542 Y119.171 E.00776
G1 X131.171 Y117.542 E.0308
G1 X131.751 Y117.542 E.00776
G1 X129.542 Y119.751 E.04177
G1 X129.542 Y120.331 E.00776
G1 X132.331 Y117.542 E.05274
G1 X132.911 Y117.542 E.00776
G1 X129.542 Y120.911 E.06371
G1 X129.542 Y121.491 E.00776
G1 X133.491 Y117.542 E.07469
G1 X134.072 Y117.542 E.00776
G1 X129.542 Y122.071 E.08566
G1 X129.542 Y122.652 E.00776
G1 X134.652 Y117.542 E.09663
G1 X135.232 Y117.542 E.00776
G1 X129.542 Y123.232 E.1076
G1 X129.542 Y123.812 E.00776
G1 X135.812 Y117.542 E.11858
G1 X136.392 Y117.542 E.00776
G1 X129.542 Y124.392 E.12955
G1 X129.542 Y124.972 E.00776
G1 X136.973 Y117.542 E.14052
G1 X137.553 Y117.542 E.00776
G1 X129.542 Y125.553 E.15149
G1 X129.542 Y126.133 E.00776
G1 X138.133 Y117.542 E.16247
G1 X138.713 Y117.542 E.00776
G1 X129.542 Y126.713 E.17344
G1 X129.542 Y127.293 E.00776
G1 X139.293 Y117.542 E.18441
G1 X139.874 Y117.542 E.00776
G1 X129.542 Y127.873 E.19538
G1 X129.542 Y128.454 E.00776
G1 X140.454 Y117.542 E.20635
G1 X141.034 Y117.542 E.00776
G1 X129.542 Y129.034 E.21733
G1 X129.542 Y129.614 E.00776
G1 X141.614 Y117.542 E.2283
G1 X142.037 Y117.542 E.00565
G1 X142.037 Y117.699 E.00211
G1 X129.542 Y130.194 E.23629
G1 X129.542 Y130.774 E.00776
G1 X142.037 Y118.28 E.23629
G1 X142.037 Y118.86 E.00776
G1 X129.542 Y131.355 E.23629
G1 X129.542 Y131.935 E.00776
G1 X142.037 Y119.44 E.23629
G1 X142.037 Y120.02 E.00776
G1 X129.542 Y132.515 E.23629
G1 X129.542 Y133.095 E.00776
G1 X142.037 Y120.6 E.23629
G1 X142.037 Y121.181 E.00776
G1 X129.542 Y133.675 E.23629
G1 X129.542 Y134.256 E.00776
G1 X142.037 Y121.761 E.23629
G1 X142.037 Y122.341 E.00776
G1 X129.92 Y134.458 E.22915
G1 X130.5 Y134.458 E.00776
G1 X142.037 Y122.921 E.21818
G1 X142.037 Y123.501 E.00776
G1 X131.08 Y134.458 E.2072
G1 X131.66 Y134.458 E.00776
G1 X142.037 Y124.082 E.19623
G1 X142.037 Y124.662 E.00776
G1 X132.241 Y134.458 E.18526
G1 X132.821 Y134.458 E.00776
G1 X142.037 Y125.242 E.17429
G1 X142.037 Y125.822 E.00776
G1 X133.401 Y134.458 E.16331
G1 X133.981 Y134.458 E.00776
G1 X142.037 Y126.402 E.15234
G1 X142.037 Y126.983 E.00776
G1 X134.561 Y134.458 E.14137
G1 X135.142 Y134.458 E.00776
G1 X142.037 Y127.563 E.1304
G1 X142.037 Y128.143 E.00776
G1 X135.722 Y134.458 E.11943
G1 X136.302 Y134.458 E.00776
G1 X142.037 Y128.723 E.10845
G1 X142.037 Y129.303 E.00776
G1 X136.882 Y134.458 E.09748
G1 X137.462 Y134.458 E.00776
G1 X142.037 Y129.884 E.08651
G1 X142.037 Y130.464 E.00776
G1 X138.043 Y134.458 E.07554
G1 X138.623 Y134.458 E.00776
G1 X142.037 Y131.044 E.06456
G1 X142.037 Y131.624 E.00776
G1 X139.203 Y134.458 E.05359
G1 X139.783 Y134.458 E.00776
G1 X142.037 Y132.204 E.04262
G1 X142.037 Y132.785 E.00776
G1 X140.363 Y134.458 E.03165
G1 X140.944 Y134.458 E.00776
G1 X142.037 Y133.365 E.02067
G1 X142.037 Y133.945 E.00776
G1 X141.343 Y134.639 E.01313
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X142.037 Y133.945 E-.37311
G1 X142.037 Y133.365 E-.22047
G1 X141.727 Y133.674 E-.16642
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/88
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.52 I-.154 J1.207 P1  F30000
G1 X150.834 Y134.834 Z4.52
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.979 Y134.834 E.13937
G1 X141.979 Y117.166 E.27807
G1 X150.834 Y117.166 E.13937
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X141.496 Y135.317 E.15457
G1 X141.496 Y116.683 E.29327
G1 X151.317 Y116.683 E.15457
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X128.225 Y135.775 E.33225
G1 X128.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.33225
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.055 Y134.638 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F20793.295
G1 X142.37 Y133.953 E.01366
G1 X142.37 Y133.338 E.00867
G1 X143.475 Y134.443 E.02204
G1 X144.09 Y134.443 E.00867
G1 X142.37 Y132.723 E.03431
G1 X142.37 Y132.108 E.00867
G1 X144.705 Y134.443 E.04658
G1 X145.319 Y134.443 E.00867
G1 X142.37 Y131.494 E.05884
G1 X142.37 Y130.879 E.00867
G1 X145.934 Y134.443 E.07111
G1 X146.549 Y134.443 E.00867
G1 X142.37 Y130.264 E.08338
G1 X142.37 Y129.649 E.00867
G1 X147.164 Y134.443 E.09565
G1 X147.779 Y134.443 E.00867
G1 X142.37 Y129.034 E.10792
G1 X142.37 Y128.419 E.00867
G1 X148.394 Y134.443 E.12018
G1 X149.009 Y134.443 E.00867
G1 X142.37 Y127.804 E.13245
G1 X142.37 Y127.19 E.00867
G1 X149.623 Y134.443 E.14472
G1 X150.238 Y134.443 E.00867
G1 X142.37 Y126.575 E.15699
G1 X142.37 Y125.96 E.00867
G1 X150.443 Y134.033 E.16107
G1 X150.443 Y133.418 E.00867
G1 X142.37 Y125.345 E.16107
G1 X142.37 Y124.73 E.00867
G1 X150.443 Y132.803 E.16107
G1 X150.443 Y132.188 E.00867
G1 X142.37 Y124.115 E.16107
G1 X142.37 Y123.5 E.00867
G1 X150.443 Y131.573 E.16107
G1 X150.443 Y130.959 E.00867
G1 X142.37 Y122.886 E.16107
G1 X142.37 Y122.271 E.00867
G1 X150.443 Y130.344 E.16107
G1 X150.443 Y129.729 E.00867
G1 X142.37 Y121.656 E.16107
M73 P77 R6
G1 X142.37 Y121.041 E.00867
G1 X150.443 Y129.114 E.16107
G1 X150.443 Y128.499 E.00867
G1 X142.37 Y120.426 E.16107
G1 X142.37 Y119.811 E.00867
G1 X150.443 Y127.884 E.16107
G1 X150.443 Y127.269 E.00867
G1 X142.37 Y119.196 E.16107
G1 X142.37 Y118.582 E.00867
G1 X150.443 Y126.655 E.16107
G1 X150.443 Y126.04 E.00867
G1 X142.37 Y117.967 E.16107
G1 X142.37 Y117.557 E.00578
G1 X142.575 Y117.557 E.00289
G1 X150.443 Y125.425 E.15698
G1 X150.443 Y124.81 E.00867
G1 X143.19 Y117.557 E.14471
G1 X143.805 Y117.557 E.00867
G1 X150.443 Y124.195 E.13244
G1 X150.443 Y123.58 E.00867
G1 X144.42 Y117.557 E.12018
G1 X145.035 Y117.557 E.00867
G1 X150.443 Y122.965 E.10791
G1 X150.443 Y122.351 E.00867
G1 X145.649 Y117.557 E.09564
G1 X146.264 Y117.557 E.00867
G1 X150.443 Y121.736 E.08337
G1 X150.443 Y121.121 E.00867
G1 X146.879 Y117.557 E.07111
G1 X147.494 Y117.557 E.00867
G1 X150.443 Y120.506 E.05884
G1 X150.443 Y119.891 E.00867
G1 X148.109 Y117.557 E.04657
G1 X148.724 Y117.557 E.00867
G1 X150.443 Y119.276 E.0343
G1 X150.443 Y118.661 E.00867
G1 X149.339 Y117.557 E.02203
G1 X149.953 Y117.557 E.00867
G1 X150.638 Y118.241 E.01365
; WIPE_START
G1 X149.953 Y117.557 E-.36775
G1 X149.339 Y117.557 E-.23365
G1 X149.634 Y117.852 E-.15861
; WIPE_END
G1 E-.04 F1800
G1 X142.018 Y117.353 Z4.6 F30000
G1 X141.234 Y117.301 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X140.394 Y116.462 E.01559
G1 X139.825 Y116.462
G1 X141.234 Y117.871 E.02617
G1 X141.234 Y118.441
G1 X139.255 Y116.462 E.03675
G1 X138.685 Y116.462
G1 X141.234 Y119.01 E.04733
G1 X141.234 Y119.58
G1 X138.116 Y116.462 E.05791
G1 X137.546 Y116.462
G1 X141.234 Y120.15 E.06848
G1 X141.234 Y120.719
G1 X136.976 Y116.462 E.07906
G1 X136.407 Y116.462
G1 X141.234 Y121.289 E.08964
G1 X141.234 Y121.859
G1 X135.837 Y116.462 E.10022
G1 X135.267 Y116.462
G1 X141.234 Y122.428 E.1108
G1 X141.234 Y122.998
G1 X134.698 Y116.462 E.12138
G1 X134.128 Y116.462
G1 X141.234 Y123.568 E.13196
G1 X141.234 Y124.137
G1 X133.558 Y116.462 E.14253
G1 X132.989 Y116.462
G1 X141.234 Y124.707 E.15311
G1 X141.234 Y125.277
G1 X132.419 Y116.462 E.16369
G1 X131.849 Y116.462
G1 X141.234 Y125.847 E.17427
G1 X141.234 Y126.416
G1 X131.279 Y116.462 E.18485
G1 X130.71 Y116.462
G1 X141.234 Y126.986 E.19543
G1 X141.234 Y127.556
G1 X130.14 Y116.462 E.20601
G1 X129.57 Y116.462
G1 X141.234 Y128.125 E.21658
G1 X141.234 Y128.695
G1 X129.001 Y116.462 E.22716
G1 X128.462 Y116.492
G1 X141.234 Y129.265 E.23717
G1 X141.234 Y129.834
G1 X128.462 Y117.062 E.23717
G1 X128.462 Y117.631
G1 X141.234 Y130.404 E.23717
G1 X141.234 Y130.974
G1 X128.462 Y118.201 E.23717
G1 X128.462 Y118.771
G1 X141.234 Y131.543 E.23717
G1 X141.234 Y132.113
G1 X128.462 Y119.341 E.23717
G1 X128.462 Y119.91
G1 X141.234 Y132.683 E.23717
G1 X141.234 Y133.252
G1 X128.462 Y120.48 E.23717
G1 X128.462 Y121.05
G1 X141.234 Y133.822 E.23717
G1 X141.234 Y134.392
G1 X128.462 Y121.619 E.23717
G1 X128.462 Y122.189
G1 X141.234 Y134.962 E.23717
G1 X141.234 Y135.531
G1 X128.462 Y122.759 E.23717
G1 X128.462 Y123.328
G1 X140.672 Y135.538 E.22673
G1 X140.102 Y135.538
G1 X128.462 Y123.898 E.21615
G1 X128.462 Y124.468
G1 X139.532 Y135.538 E.20557
G1 X138.963 Y135.538
G1 X128.462 Y125.037 E.19499
G1 X128.462 Y125.607
G1 X138.393 Y135.538 E.18442
G1 X137.823 Y135.538
G1 X128.462 Y126.177 E.17384
G1 X128.462 Y126.746
G1 X137.254 Y135.538 E.16326
G1 X136.684 Y135.538
G1 X128.462 Y127.316 E.15268
G1 X128.462 Y127.886
G1 X136.114 Y135.538 E.1421
G1 X135.544 Y135.538
G1 X128.462 Y128.456 E.13152
G1 X128.462 Y129.025
G1 X134.975 Y135.538 E.12094
G1 X134.405 Y135.538
G1 X128.462 Y129.595 E.11037
G1 X128.462 Y130.165
G1 X133.835 Y135.538 E.09979
G1 X133.266 Y135.538
G1 X128.462 Y130.734 E.08921
G1 X128.462 Y131.304
G1 X132.696 Y135.538 E.07863
G1 X132.126 Y135.538
G1 X128.462 Y131.874 E.06805
G1 X128.462 Y132.443
G1 X131.557 Y135.538 E.05747
G1 X130.987 Y135.538
G1 X128.462 Y133.013 E.04689
G1 X128.462 Y133.583
G1 X130.417 Y135.538 E.03632
G1 X129.848 Y135.538
G1 X128.462 Y134.152 E.02574
M73 P78 R6
G1 X128.462 Y134.722
G1 X129.278 Y135.538 E.01516
; CHANGE_LAYER
; Z_HEIGHT: 4.28
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F1800
M204 S10000
G1 X128.462 Y134.722 E-.43871
G1 X128.462 Y134.152 E-.21648
G1 X128.657 Y134.347 E-.1048
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 52/88
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.6 I-.027 J1.217 P1  F30000
G1 X150.834 Y134.834 Z4.6
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.76 Y134.638 Z4.68 F30000
G1 Z4.28
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4892
G1 X150.443 Y133.955 E.01363
G1 X150.443 Y133.341 E.00866
M73 P78 R5
G1 X149.341 Y134.443 E.02199
G1 X148.727 Y134.443 E.00866
G1 X150.443 Y132.727 E.03424
G1 X150.443 Y132.113 E.00866
G1 X148.113 Y134.443 E.04649
G1 X147.499 Y134.443 E.00866
G1 X150.443 Y131.499 E.05874
G1 X150.443 Y130.885 E.00866
G1 X146.885 Y134.443 E.07098
G1 X146.271 Y134.443 E.00866
G1 X150.443 Y130.271 E.08323
G1 X150.443 Y129.657 E.00866
G1 X145.657 Y134.443 E.09548
G1 X145.043 Y134.443 E.00866
G1 X150.443 Y129.043 E.10773
G1 X150.443 Y128.43 E.00866
G1 X144.43 Y134.443 E.11998
G1 X143.816 Y134.443 E.00866
G1 X150.443 Y127.816 E.13223
G1 X150.443 Y127.202 E.00866
G1 X143.202 Y134.443 E.14448
G1 X142.588 Y134.443 E.00866
G1 X150.443 Y126.588 E.15673
G1 X150.443 Y125.974 E.00866
G1 X142.455 Y133.962 E.15938
G1 X142.455 Y133.348 E.00866
G1 X150.443 Y125.36 E.15938
G1 X150.443 Y124.746 E.00866
G1 X142.455 Y132.734 E.15938
G1 X142.455 Y132.12 E.00866
G1 X150.443 Y124.132 E.15938
G1 X150.443 Y123.518 E.00866
G1 X142.455 Y131.506 E.15938
G1 X142.455 Y130.892 E.00866
G1 X150.443 Y122.904 E.15938
G1 X150.443 Y122.29 E.00866
G1 X142.455 Y130.279 E.15938
G1 X142.455 Y129.665 E.00866
G1 X150.443 Y121.676 E.15938
G1 X150.443 Y121.062 E.00866
G1 X142.455 Y129.051 E.15938
G1 X142.455 Y128.437 E.00866
G1 X150.443 Y120.449 E.15938
G1 X150.443 Y119.835 E.00866
G1 X142.455 Y127.823 E.15938
G1 X142.455 Y127.209 E.00866
G1 X150.443 Y119.221 E.15938
G1 X150.443 Y118.607 E.00866
G1 X142.455 Y126.595 E.15938
G1 X142.455 Y125.981 E.00866
G1 X150.443 Y117.993 E.15938
G1 X150.443 Y117.557 E.00615
G1 X150.265 Y117.557 E.00251
G1 X142.455 Y125.367 E.15583
G1 X142.455 Y124.753 E.00866
G1 X149.651 Y117.557 E.14358
G1 X149.037 Y117.557 E.00866
G1 X142.455 Y124.139 E.13133
G1 X142.455 Y123.525 E.00866
G1 X148.423 Y117.557 E.11908
G1 X147.809 Y117.557 E.00866
G1 X142.455 Y122.911 E.10683
G1 X142.455 Y122.297 E.00866
G1 X147.195 Y117.557 E.09458
G1 X146.581 Y117.557 E.00866
G1 X142.455 Y121.684 E.08233
G1 X142.455 Y121.07 E.00866
G1 X145.967 Y117.557 E.07008
G1 X145.353 Y117.557 E.00866
G1 X142.455 Y120.456 E.05783
G1 X142.455 Y119.842 E.00866
G1 X144.74 Y117.557 E.04559
G1 X144.126 Y117.557 E.00866
G1 X142.455 Y119.228 E.03334
G1 X142.455 Y118.614 E.00866
G1 X143.512 Y117.557 E.02109
G1 X142.898 Y117.557 E.00866
G1 X142.26 Y118.195 E.01273
G1 X142.031 Y117.823 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432788
G1 F4892
G1 X142.031 Y117.615 E.00282
G1 X141.615 Y117.615 E.00563
G1 X141.615 Y134.385 E.22719
G1 X142.031 Y134.385 E.00563
G1 X142.031 Y117.883 E.22356
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F16800
G1 X142.031 Y119.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/88
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.68 I-1.049 J.617 P1  F30000
G1 X150.834 Y134.834 Z4.68
G1 Z4.36
M73 P79 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.093 Y134.638 Z4.76 F30000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4848
G1 X142.455 Y134 E.01273
G1 X142.455 Y133.386 E.00866
G1 X143.512 Y134.443 E.02109
G1 X144.126 Y134.443 E.00866
G1 X142.455 Y132.772 E.03334
G1 X142.455 Y132.158 E.00866
G1 X144.74 Y134.443 E.04559
G1 X145.353 Y134.443 E.00866
G1 X142.455 Y131.544 E.05783
G1 X142.455 Y130.93 E.00866
G1 X145.967 Y134.443 E.07008
G1 X146.581 Y134.443 E.00866
G1 X142.455 Y130.316 E.08233
G1 X142.455 Y129.702 E.00866
G1 X147.195 Y134.443 E.09458
G1 X147.809 Y134.443 E.00866
G1 X142.455 Y129.089 E.10683
G1 X142.455 Y128.475 E.00866
G1 X148.423 Y134.443 E.11908
G1 X149.037 Y134.443 E.00866
G1 X142.455 Y127.861 E.13133
G1 X142.455 Y127.247 E.00866
G1 X149.651 Y134.443 E.14358
G1 X150.265 Y134.443 E.00866
G1 X142.455 Y126.633 E.15583
G1 X142.455 Y126.019 E.00866
G1 X150.443 Y134.007 E.15938
G1 X150.443 Y133.393 E.00866
G1 X142.455 Y125.405 E.15938
G1 X142.455 Y124.791 E.00866
G1 X150.443 Y132.779 E.15938
G1 X150.443 Y132.165 E.00866
G1 X142.455 Y124.177 E.15938
G1 X142.455 Y123.563 E.00866
G1 X150.443 Y131.551 E.15938
G1 X150.443 Y130.938 E.00866
G1 X142.455 Y122.949 E.15938
G1 X142.455 Y122.335 E.00866
G1 X150.443 Y130.324 E.15938
G1 X150.443 Y129.71 E.00866
G1 X142.455 Y121.721 E.15938
G1 X142.455 Y121.108 E.00866
G1 X150.443 Y129.096 E.15938
G1 X150.443 Y128.482 E.00866
G1 X142.455 Y120.494 E.15938
G1 X142.455 Y119.88 E.00866
G1 X150.443 Y127.868 E.15938
G1 X150.443 Y127.254 E.00866
G1 X142.455 Y119.266 E.15938
G1 X142.455 Y118.652 E.00866
G1 X150.443 Y126.64 E.15938
G1 X150.443 Y126.026 E.00866
G1 X142.455 Y118.038 E.15938
G1 X142.455 Y117.557 E.00679
G1 X142.588 Y117.557 E.00188
G1 X150.443 Y125.412 E.15673
G1 X150.443 Y124.798 E.00866
G1 X143.202 Y117.557 E.14448
G1 X143.816 Y117.557 E.00866
G1 X150.443 Y124.184 E.13223
G1 X150.443 Y123.57 E.00866
G1 X144.43 Y117.557 E.11998
G1 X145.043 Y117.557 E.00866
G1 X150.443 Y122.957 E.10773
G1 X150.443 Y122.343 E.00866
G1 X145.657 Y117.557 E.09548
G1 X146.271 Y117.557 E.00866
G1 X150.443 Y121.729 E.08323
G1 X150.443 Y121.115 E.00866
G1 X146.885 Y117.557 E.07098
G1 X147.499 Y117.557 E.00866
G1 X150.443 Y120.501 E.05874
G1 X150.443 Y119.887 E.00866
G1 X148.113 Y117.557 E.04649
G1 X148.727 Y117.557 E.00866
G1 X150.443 Y119.273 E.03424
G1 X150.443 Y118.659 E.00866
G1 X149.341 Y117.557 E.02199
G1 X149.955 Y117.557 E.00866
G1 X150.638 Y118.24 E.01363
G1 X142.031 Y117.823 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432788
G1 F4848
G1 X142.031 Y117.615 E.00282
G1 X141.615 Y117.615 E.00563
G1 X141.615 Y134.385 E.22719
G1 X142.031 Y134.385 E.00563
G1 X142.031 Y117.883 E.22356
; CHANGE_LAYER
; Z_HEIGHT: 4.44
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F16800
G1 X142.031 Y119.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/88
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.76 I-1.049 J.617 P1  F30000
G1 X150.834 Y134.834 Z4.76
G1 Z4.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.76 Y134.638 Z4.84 F30000
G1 Z4.44
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4819
G1 X150.443 Y133.955 E.01363
G1 X150.443 Y133.341 E.00866
G1 X149.341 Y134.443 E.02199
G1 X148.727 Y134.443 E.00866
G1 X150.443 Y132.727 E.03424
G1 X150.443 Y132.113 E.00866
G1 X148.113 Y134.443 E.04649
G1 X147.499 Y134.443 E.00866
G1 X150.443 Y131.499 E.05874
G1 X150.443 Y130.885 E.00866
G1 X146.885 Y134.443 E.07098
G1 X146.271 Y134.443 E.00866
G1 X150.443 Y130.271 E.08323
G1 X150.443 Y129.657 E.00866
G1 X145.657 Y134.443 E.09548
G1 X145.043 Y134.443 E.00866
G1 X150.443 Y129.043 E.10773
G1 X150.443 Y128.43 E.00866
G1 X144.43 Y134.443 E.11998
G1 X143.816 Y134.443 E.00866
G1 X150.443 Y127.816 E.13223
G1 X150.443 Y127.202 E.00866
G1 X143.202 Y134.443 E.14448
G1 X142.588 Y134.443 E.00866
G1 X150.443 Y126.588 E.15673
G1 X150.443 Y125.974 E.00866
G1 X142.455 Y133.962 E.15938
G1 X142.455 Y133.348 E.00866
G1 X150.443 Y125.36 E.15938
G1 X150.443 Y124.746 E.00866
G1 X142.455 Y132.734 E.15938
G1 X142.455 Y132.12 E.00866
G1 X150.443 Y124.132 E.15938
G1 X150.443 Y123.518 E.00866
G1 X142.455 Y131.506 E.15938
G1 X142.455 Y130.892 E.00866
G1 X150.443 Y122.904 E.15938
G1 X150.443 Y122.29 E.00866
G1 X142.455 Y130.279 E.15938
G1 X142.455 Y129.665 E.00866
G1 X150.443 Y121.676 E.15938
G1 X150.443 Y121.062 E.00866
G1 X142.455 Y129.051 E.15938
G1 X142.455 Y128.437 E.00866
G1 X150.443 Y120.449 E.15938
G1 X150.443 Y119.835 E.00866
G1 X142.455 Y127.823 E.15938
G1 X142.455 Y127.209 E.00866
G1 X150.443 Y119.221 E.15938
G1 X150.443 Y118.607 E.00866
G1 X142.455 Y126.595 E.15938
G1 X142.455 Y125.981 E.00866
G1 X150.443 Y117.993 E.15938
G1 X150.443 Y117.557 E.00615
G1 X150.265 Y117.557 E.00251
G1 X142.455 Y125.367 E.15583
G1 X142.455 Y124.753 E.00866
G1 X149.651 Y117.557 E.14358
G1 X149.037 Y117.557 E.00866
G1 X142.455 Y124.139 E.13133
G1 X142.455 Y123.525 E.00866
G1 X148.423 Y117.557 E.11908
G1 X147.809 Y117.557 E.00866
G1 X142.455 Y122.911 E.10683
G1 X142.455 Y122.297 E.00866
G1 X147.195 Y117.557 E.09458
G1 X146.581 Y117.557 E.00866
G1 X142.455 Y121.684 E.08233
G1 X142.455 Y121.07 E.00866
G1 X145.967 Y117.557 E.07008
G1 X145.353 Y117.557 E.00866
G1 X142.455 Y120.456 E.05783
G1 X142.455 Y119.842 E.00866
G1 X144.74 Y117.557 E.04559
G1 X144.126 Y117.557 E.00866
G1 X142.455 Y119.228 E.03334
G1 X142.455 Y118.614 E.00866
G1 X143.512 Y117.557 E.02109
G1 X142.898 Y117.557 E.00866
G1 X142.26 Y118.195 E.01273
G1 X142.031 Y117.823 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432788
G1 F4819
G1 X142.031 Y117.615 E.00282
M73 P80 R5
G1 X141.615 Y117.615 E.00563
G1 X141.615 Y134.385 E.22719
G1 X142.031 Y134.385 E.00563
G1 X142.031 Y117.883 E.22356
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F16800
G1 X142.031 Y119.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/88
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.84 I-1.049 J.617 P1  F30000
G1 X150.834 Y134.834 Z4.84
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.093 Y134.638 Z4.92 F30000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4848
G1 X142.455 Y134 E.01273
G1 X142.455 Y133.386 E.00866
G1 X143.512 Y134.443 E.02109
G1 X144.126 Y134.443 E.00866
G1 X142.455 Y132.772 E.03334
G1 X142.455 Y132.158 E.00866
G1 X144.74 Y134.443 E.04559
G1 X145.353 Y134.443 E.00866
G1 X142.455 Y131.544 E.05783
G1 X142.455 Y130.93 E.00866
G1 X145.967 Y134.443 E.07008
G1 X146.581 Y134.443 E.00866
G1 X142.455 Y130.316 E.08233
G1 X142.455 Y129.702 E.00866
G1 X147.195 Y134.443 E.09458
G1 X147.809 Y134.443 E.00866
G1 X142.455 Y129.089 E.10683
G1 X142.455 Y128.475 E.00866
G1 X148.423 Y134.443 E.11908
G1 X149.037 Y134.443 E.00866
G1 X142.455 Y127.861 E.13133
G1 X142.455 Y127.247 E.00866
G1 X149.651 Y134.443 E.14358
G1 X150.265 Y134.443 E.00866
G1 X142.455 Y126.633 E.15583
G1 X142.455 Y126.019 E.00866
G1 X150.443 Y134.007 E.15938
G1 X150.443 Y133.393 E.00866
G1 X142.455 Y125.405 E.15938
G1 X142.455 Y124.791 E.00866
G1 X150.443 Y132.779 E.15938
G1 X150.443 Y132.165 E.00866
G1 X142.455 Y124.177 E.15938
G1 X142.455 Y123.563 E.00866
G1 X150.443 Y131.551 E.15938
G1 X150.443 Y130.938 E.00866
G1 X142.455 Y122.949 E.15938
G1 X142.455 Y122.335 E.00866
G1 X150.443 Y130.324 E.15938
G1 X150.443 Y129.71 E.00866
G1 X142.455 Y121.721 E.15938
G1 X142.455 Y121.108 E.00866
G1 X150.443 Y129.096 E.15938
G1 X150.443 Y128.482 E.00866
G1 X142.455 Y120.494 E.15938
G1 X142.455 Y119.88 E.00866
G1 X150.443 Y127.868 E.15938
G1 X150.443 Y127.254 E.00866
G1 X142.455 Y119.266 E.15938
G1 X142.455 Y118.652 E.00866
G1 X150.443 Y126.64 E.15938
G1 X150.443 Y126.026 E.00866
G1 X142.455 Y118.038 E.15938
G1 X142.455 Y117.557 E.00679
G1 X142.588 Y117.557 E.00188
G1 X150.443 Y125.412 E.15673
G1 X150.443 Y124.798 E.00866
G1 X143.202 Y117.557 E.14448
G1 X143.816 Y117.557 E.00866
G1 X150.443 Y124.184 E.13223
G1 X150.443 Y123.57 E.00866
G1 X144.43 Y117.557 E.11998
G1 X145.043 Y117.557 E.00866
G1 X150.443 Y122.957 E.10773
G1 X150.443 Y122.343 E.00866
G1 X145.657 Y117.557 E.09548
G1 X146.271 Y117.557 E.00866
G1 X150.443 Y121.729 E.08323
G1 X150.443 Y121.115 E.00866
G1 X146.885 Y117.557 E.07098
G1 X147.499 Y117.557 E.00866
G1 X150.443 Y120.501 E.05874
G1 X150.443 Y119.887 E.00866
G1 X148.113 Y117.557 E.04649
G1 X148.727 Y117.557 E.00866
G1 X150.443 Y119.273 E.03424
G1 X150.443 Y118.659 E.00866
G1 X149.341 Y117.557 E.02199
G1 X149.955 Y117.557 E.00866
G1 X150.638 Y118.24 E.01363
G1 X142.031 Y117.823 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.432788
G1 F4848
G1 X142.031 Y117.615 E.00282
G1 X141.615 Y117.615 E.00563
G1 X141.615 Y134.385 E.22719
G1 X142.031 Y134.385 E.00563
G1 X142.031 Y117.883 E.22356
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F16800
G1 X142.031 Y119.883 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/88
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.92 I-1.049 J.617 P1  F30000
G1 X150.834 Y134.834 Z4.92
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4797
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4797
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4797
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
M73 P81 R5
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/88
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z5
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z5.08 F30000
G1 X141.362 Y133.752 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.76
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/88
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.08 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z5.08
G1 Z4.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z5.16 F30000
G1 Z4.76
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
M73 P82 R5
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
M73 P82 R4
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/88
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.16 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z5.16
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z5.24 F30000
G1 X141.362 Y133.752 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/88
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.24 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z5.24
G1 Z4.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z5.32 F30000
G1 Z4.92
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
M73 P83 R4
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/88
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.32 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z5.32
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z5.4 F30000
G1 X141.362 Y133.752 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/88
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.4 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z5.4
G1 Z5.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z5.48 F30000
G1 Z5.08
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
M73 P84 R4
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/88
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.48 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z5.48
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z5.56 F30000
G1 X141.362 Y133.752 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.24
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/88
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.56 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z5.56
G1 Z5.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z5.64 F30000
G1 Z5.24
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
M73 P85 R4
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/88
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.64 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z5.64
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z5.72 F30000
G1 X141.362 Y133.752 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
M73 P85 R3
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/88
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.72 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z5.72
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
M73 P86 R3
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/88
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.8 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z5.8
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z5.88 F30000
G1 X141.362 Y133.752 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.56
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/88
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.88 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z5.88
G1 Z5.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z5.96 F30000
G1 Z5.56
M73 P87 R3
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/88
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.96 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z5.96
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z6.04 F30000
G1 X141.362 Y133.752 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.72
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/88
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.04 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z6.04
G1 Z5.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
M73 P88 R3
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z6.12 F30000
G1 Z5.72
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/88
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.12 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z6.12
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z6.2 F30000
G1 X141.362 Y133.752 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.88
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/88
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.2 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z6.2
G1 Z5.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
M73 P89 R3
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z6.28 F30000
G1 Z5.88
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
M73 P89 R2
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/88
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.28 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z6.28
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z6.36 F30000
G1 X141.362 Y133.752 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
M73 P90 R2
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 6.04
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/88
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.36 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z6.36
G1 Z6.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z6.44 F30000
G1 Z6.04
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/88
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.44 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z6.44
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z6.52 F30000
G1 X141.362 Y133.752 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
M73 P91 R2
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/88
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.52 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z6.52
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 6.28
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/88
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.6 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z6.6
G1 Z6.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y133.982 Z6.68 F30000
G1 X141.362 Y133.752 Z6.68
G1 Z6.28
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4812
G1 X142.054 Y134.443 E.0138
G1 X142.673 Y134.443 E.00874
G1 X141.557 Y133.327 E.02227
G1 X141.557 Y132.707 E.00874
G1 X143.293 Y134.443 E.03463
G1 X143.912 Y134.443 E.00874
G1 X141.557 Y132.088 E.04699
G1 X141.557 Y131.468 E.00874
G1 X144.532 Y134.443 E.05935
G1 X145.151 Y134.443 E.00874
G1 X141.557 Y130.849 E.07171
G1 X141.557 Y130.229 E.00874
G1 X145.771 Y134.443 E.08407
G1 X146.39 Y134.443 E.00874
G1 X141.557 Y129.61 E.09643
G1 X141.557 Y128.991 E.00874
G1 X147.01 Y134.443 E.10879
G1 X147.629 Y134.443 E.00874
G1 X141.557 Y128.371 E.12115
G1 X141.557 Y127.752 E.00874
G1 X148.248 Y134.443 E.13351
G1 X148.868 Y134.443 E.00874
G1 X141.557 Y127.132 E.14587
G1 X141.557 Y126.513 E.00874
G1 X149.487 Y134.443 E.15822
G1 X150.107 Y134.443 E.00874
G1 X141.557 Y125.893 E.17058
G1 X141.557 Y125.274 E.00874
G1 X150.443 Y134.16 E.17729
G1 X150.443 Y133.54 E.00874
G1 X141.557 Y124.654 E.17729
G1 X141.557 Y124.035 E.00874
G1 X150.443 Y132.921 E.17729
G1 X150.443 Y132.301 E.00874
G1 X141.557 Y123.415 E.17729
G1 X141.557 Y122.796 E.00874
G1 X150.443 Y131.682 E.17729
G1 X150.443 Y131.062 E.00874
G1 X141.557 Y122.176 E.17729
G1 X141.557 Y121.557 E.00874
G1 X150.443 Y130.443 E.17729
G1 X150.443 Y129.823 E.00874
G1 X141.557 Y120.937 E.17729
M73 P92 R2
G1 X141.557 Y120.318 E.00874
G1 X150.443 Y129.204 E.17729
G1 X150.443 Y128.584 E.00874
G1 X141.557 Y119.699 E.17729
G1 X141.557 Y119.079 E.00874
G1 X150.443 Y127.965 E.17729
G1 X150.443 Y127.345 E.00874
G1 X141.557 Y118.46 E.17729
G1 X141.557 Y117.84 E.00874
G1 X150.443 Y126.726 E.17729
G1 X150.443 Y126.107 E.00874
G1 X141.893 Y117.557 E.17058
G1 X142.513 Y117.557 E.00874
G1 X150.443 Y125.487 E.15822
G1 X150.443 Y124.868 E.00874
G1 X143.132 Y117.557 E.14586
G1 X143.752 Y117.557 E.00874
G1 X150.443 Y124.248 E.1335
G1 X150.443 Y123.629 E.00874
G1 X144.371 Y117.557 E.12114
G1 X144.991 Y117.557 E.00874
G1 X150.443 Y123.009 E.10878
G1 X150.443 Y122.39 E.00874
G1 X145.61 Y117.557 E.09642
G1 X146.23 Y117.557 E.00874
G1 X150.443 Y121.77 E.08406
G1 X150.443 Y121.151 E.00874
G1 X146.849 Y117.557 E.0717
G1 X147.469 Y117.557 E.00874
G1 X150.443 Y120.531 E.05934
G1 X150.443 Y119.912 E.00874
G1 X148.088 Y117.557 E.04698
G1 X148.708 Y117.557 E.00874
G1 X150.443 Y119.292 E.03462
G1 X150.443 Y118.673 E.00874
G1 X149.327 Y117.557 E.02226
G1 X149.947 Y117.557 E.00874
G1 X150.638 Y118.248 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 6.36
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X149.947 Y117.557 E-.37147
G1 X149.327 Y117.557 E-.2354
G1 X149.612 Y117.842 E-.15314
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/88
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.68 I-1.214 J.087 P1  F30000
G1 X150.834 Y134.834 Z6.68
G1 Z6.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4795
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4795
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.752 Y134.638 Z6.76 F30000
G1 Z6.36
G1 E.8 F1800
; FEATURE: Sparse infill
G1 F4795
G1 X150.443 Y133.947 E.01379
G1 X150.443 Y133.327 E.00874
G1 X149.327 Y134.443 E.02226
G1 X148.708 Y134.443 E.00874
G1 X150.443 Y132.708 E.03462
G1 X150.443 Y132.088 E.00874
G1 X148.088 Y134.443 E.04698
G1 X147.469 Y134.443 E.00874
G1 X150.443 Y131.469 E.05934
G1 X150.443 Y130.849 E.00874
G1 X146.849 Y134.443 E.0717
G1 X146.23 Y134.443 E.00874
G1 X150.443 Y130.23 E.08406
G1 X150.443 Y129.61 E.00874
G1 X145.61 Y134.443 E.09642
G1 X144.991 Y134.443 E.00874
G1 X150.443 Y128.991 E.10878
G1 X150.443 Y128.371 E.00874
G1 X144.371 Y134.443 E.12114
G1 X143.752 Y134.443 E.00874
G1 X150.443 Y127.752 E.1335
G1 X150.443 Y127.132 E.00874
G1 X143.132 Y134.443 E.14586
G1 X142.513 Y134.443 E.00874
G1 X150.443 Y126.513 E.15822
G1 X150.443 Y125.893 E.00874
G1 X141.893 Y134.443 E.17058
G1 X141.557 Y134.443 E.00475
G1 X141.557 Y134.16 E.00399
G1 X150.443 Y125.274 E.17729
G1 X150.443 Y124.655 E.00874
G1 X141.557 Y133.54 E.17729
G1 X141.557 Y132.921 E.00874
G1 X150.443 Y124.035 E.17729
G1 X150.443 Y123.416 E.00874
G1 X141.557 Y132.301 E.17729
G1 X141.557 Y131.682 E.00874
G1 X150.443 Y122.796 E.17729
G1 X150.443 Y122.177 E.00874
G1 X141.557 Y131.063 E.17729
G1 X141.557 Y130.443 E.00874
G1 X150.443 Y121.557 E.17729
G1 X150.443 Y120.938 E.00874
G1 X141.557 Y129.824 E.17729
G1 X141.557 Y129.204 E.00874
G1 X150.443 Y120.318 E.17729
G1 X150.443 Y119.699 E.00874
G1 X141.557 Y128.585 E.17729
G1 X141.557 Y127.965 E.00874
G1 X150.443 Y119.079 E.17729
G1 X150.443 Y118.46 E.00874
G1 X141.557 Y127.346 E.17729
G1 X141.557 Y126.726 E.00874
G1 X150.443 Y117.84 E.17729
G1 X150.443 Y117.557 E.004
G1 X150.107 Y117.557 E.00474
G1 X141.557 Y126.107 E.17058
G1 X141.557 Y125.487 E.00874
G1 X149.487 Y117.557 E.15822
G1 X148.868 Y117.557 E.00874
G1 X141.557 Y124.868 E.14587
G1 X141.557 Y124.248 E.00874
G1 X148.248 Y117.557 E.13351
G1 X147.629 Y117.557 E.00874
G1 X141.557 Y123.629 E.12115
G1 X141.557 Y123.009 E.00874
G1 X147.01 Y117.557 E.10879
G1 X146.39 Y117.557 E.00874
G1 X141.557 Y122.39 E.09643
G1 X141.557 Y121.771 E.00874
G1 X145.771 Y117.557 E.08407
G1 X145.151 Y117.557 E.00874
G1 X141.557 Y121.151 E.07171
G1 X141.557 Y120.532 E.00874
G1 X144.532 Y117.557 E.05935
G1 X143.912 Y117.557 E.00874
G1 X141.557 Y119.912 E.04699
G1 X141.557 Y119.293 E.00874
G1 X143.293 Y117.557 E.03463
G1 X142.673 Y117.557 E.00874
G1 X141.557 Y118.673 E.02227
G1 X141.557 Y118.054 E.00874
G1 X142.249 Y117.362 E.0138
; CHANGE_LAYER
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F20793.295
G1 X141.557 Y118.054 E-.3716
G1 X141.557 Y118.673 E-.2354
G1 X141.842 Y118.388 E-.153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/88
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.76 I-1.068 J.584 P1  F30000
G1 X150.834 Y134.834 Z6.76
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.22 Y134.644 Z6.84 F30000
G1 X142.19 Y134.639 Z6.84
G1 Z6.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426628
G1 F5148
G1 X141.542 Y133.992 E.01222
G1 X141.542 Y133.413 E.00773
G1 X142.587 Y134.458 E.01973
G1 X143.166 Y134.458 E.00773
G1 X141.542 Y132.834 E.03066
G1 X141.542 Y132.255 E.00773
G1 X143.746 Y134.458 E.04159
G1 X144.325 Y134.458 E.00773
G1 X141.542 Y131.675 E.05252
G1 X141.542 Y131.096 E.00773
G1 X144.904 Y134.458 E.06345
G1 X145.483 Y134.458 E.00773
G1 X141.542 Y130.517 E.07438
G1 X141.542 Y129.938 E.00773
G1 X146.062 Y134.458 E.08531
G1 X146.641 Y134.458 E.00773
G1 X141.542 Y129.359 E.09624
G1 X141.542 Y128.78 E.00773
G1 X147.22 Y134.458 E.10717
G1 X147.799 Y134.458 E.00773
G1 X141.542 Y128.201 E.1181
G1 X141.542 Y127.622 E.00773
G1 X148.378 Y134.458 E.12903
G1 X148.957 Y134.458 E.00773
G1 X141.542 Y127.043 E.13995
G1 X141.542 Y126.464 E.00773
G1 X149.536 Y134.458 E.15088
G1 X150.115 Y134.458 E.00773
G1 X141.542 Y125.885 E.16181
M73 P92 R1
G1 X141.542 Y125.306 E.00773
G1 X150.458 Y134.222 E.16828
G1 X150.458 Y133.643 E.00773
G1 X141.542 Y124.727 E.16828
G1 X141.542 Y124.148 E.00773
G1 X150.458 Y133.064 E.16828
G1 X150.458 Y132.484 E.00773
G1 X141.542 Y123.569 E.16828
G1 X141.542 Y122.99 E.00773
G1 X150.458 Y131.905 E.16828
G1 X150.458 Y131.326 E.00773
G1 X141.542 Y122.41 E.16828
M73 P93 R1
G1 X141.542 Y121.831 E.00773
G1 X150.458 Y130.747 E.16828
G1 X150.458 Y130.168 E.00773
G1 X141.542 Y121.252 E.16828
G1 X141.542 Y120.673 E.00773
G1 X150.458 Y129.589 E.16828
G1 X150.458 Y129.01 E.00773
G1 X141.542 Y120.094 E.16828
G1 X141.542 Y119.515 E.00773
G1 X150.458 Y128.431 E.16828
G1 X150.458 Y127.852 E.00773
G1 X141.542 Y118.936 E.16828
G1 X141.542 Y118.357 E.00773
G1 X150.458 Y127.273 E.16828
G1 X150.458 Y126.694 E.00773
G1 X141.542 Y117.778 E.16828
G1 X141.542 Y117.542 E.00315
G1 X141.885 Y117.542 E.00458
G1 X150.458 Y126.115 E.16181
G1 X150.458 Y125.536 E.00773
G1 X142.464 Y117.542 E.15088
G1 X143.043 Y117.542 E.00773
G1 X150.458 Y124.957 E.13995
G1 X150.458 Y124.378 E.00773
G1 X143.622 Y117.542 E.12902
G1 X144.201 Y117.542 E.00773
G1 X150.458 Y123.798 E.11809
G1 X150.458 Y123.219 E.00773
G1 X144.781 Y117.542 E.10716
G1 X145.36 Y117.542 E.00773
G1 X150.458 Y122.64 E.09623
G1 X150.458 Y122.061 E.00773
G1 X145.939 Y117.542 E.0853
G1 X146.518 Y117.542 E.00773
G1 X150.458 Y121.482 E.07437
G1 X150.458 Y120.903 E.00773
G1 X147.097 Y117.542 E.06344
G1 X147.676 Y117.542 E.00773
G1 X150.458 Y120.324 E.05251
G1 X150.458 Y119.745 E.00773
G1 X148.255 Y117.542 E.04158
G1 X148.834 Y117.542 E.00773
G1 X150.458 Y119.166 E.03065
G1 X150.458 Y118.587 E.00773
G1 X149.413 Y117.542 E.01972
G1 X149.992 Y117.542 E.00773
G1 X150.639 Y118.189 E.01221
; CHANGE_LAYER
; Z_HEIGHT: 6.52
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X149.992 Y117.542 E-.34776
G1 X149.413 Y117.542 E-.22004
G1 X149.771 Y117.9 E-.19219
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/88
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.84 I-1.215 J.076 P1  F30000
G1 X150.834 Y134.834 Z6.84
G1 Z6.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.811 Y134.639 Z6.92 F30000
G1 Z6.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426628
G1 F5129
G1 X150.458 Y133.992 E.01221
G1 X150.458 Y133.413 E.00773
G1 X149.413 Y134.458 E.01972
G1 X148.834 Y134.458 E.00773
G1 X150.458 Y132.834 E.03065
G1 X150.458 Y132.255 E.00773
G1 X148.255 Y134.458 E.04158
G1 X147.676 Y134.458 E.00773
G1 X150.458 Y131.676 E.05251
G1 X150.458 Y131.097 E.00773
G1 X147.097 Y134.458 E.06344
G1 X146.518 Y134.458 E.00773
G1 X150.458 Y130.518 E.07437
G1 X150.458 Y129.939 E.00773
G1 X145.939 Y134.458 E.0853
G1 X145.36 Y134.458 E.00773
G1 X150.458 Y129.36 E.09623
G1 X150.458 Y128.781 E.00773
G1 X144.781 Y134.458 E.10716
G1 X144.201 Y134.458 E.00773
G1 X150.458 Y128.201 E.11809
G1 X150.458 Y127.622 E.00773
G1 X143.622 Y134.458 E.12902
G1 X143.043 Y134.458 E.00773
G1 X150.458 Y127.043 E.13995
G1 X150.458 Y126.464 E.00773
G1 X142.464 Y134.458 E.15088
G1 X141.885 Y134.458 E.00773
G1 X150.458 Y125.885 E.16181
G1 X150.458 Y125.306 E.00773
G1 X141.542 Y134.222 E.16828
G1 X141.542 Y133.643 E.00773
G1 X150.458 Y124.727 E.16828
G1 X150.458 Y124.148 E.00773
G1 X141.542 Y133.064 E.16828
G1 X141.542 Y132.485 E.00773
G1 X150.458 Y123.569 E.16828
G1 X150.458 Y122.99 E.00773
G1 X141.542 Y131.906 E.16828
G1 X141.542 Y131.327 E.00773
G1 X150.458 Y122.411 E.16828
G1 X150.458 Y121.832 E.00773
G1 X141.542 Y130.748 E.16828
G1 X141.542 Y130.169 E.00773
G1 X150.458 Y121.253 E.16828
G1 X150.458 Y120.674 E.00773
G1 X141.542 Y129.59 E.16828
G1 X141.542 Y129.01 E.00773
G1 X150.458 Y120.095 E.16828
G1 X150.458 Y119.516 E.00773
G1 X141.542 Y128.431 E.16828
G1 X141.542 Y127.852 E.00773
G1 X150.458 Y118.936 E.16828
G1 X150.458 Y118.357 E.00773
G1 X141.542 Y127.273 E.16828
G1 X141.542 Y126.694 E.00773
G1 X150.458 Y117.778 E.16828
G1 X150.458 Y117.542 E.00315
G1 X150.115 Y117.542 E.00457
G1 X141.542 Y126.115 E.16181
G1 X141.542 Y125.536 E.00773
G1 X149.536 Y117.542 E.15088
G1 X148.957 Y117.542 E.00773
G1 X141.542 Y124.957 E.13996
G1 X141.542 Y124.378 E.00773
G1 X148.378 Y117.542 E.12903
G1 X147.799 Y117.542 E.00773
G1 X141.542 Y123.799 E.1181
G1 X141.542 Y123.22 E.00773
G1 X147.22 Y117.542 E.10717
G1 X146.641 Y117.542 E.00773
G1 X141.542 Y122.641 E.09624
G1 X141.542 Y122.062 E.00773
G1 X146.062 Y117.542 E.08531
G1 X145.483 Y117.542 E.00773
G1 X141.542 Y121.483 E.07438
G1 X141.542 Y120.904 E.00773
G1 X144.904 Y117.542 E.06345
G1 X144.325 Y117.542 E.00773
G1 X141.542 Y120.325 E.05252
G1 X141.542 Y119.745 E.00773
G1 X143.746 Y117.542 E.04159
G1 X143.166 Y117.542 E.00773
G1 X141.542 Y119.166 E.03066
G1 X141.542 Y118.587 E.00773
G1 X142.587 Y117.542 E.01973
G1 X142.008 Y117.542 E.00773
G1 X141.361 Y118.19 E.01222
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X142.008 Y117.542 E-.34798
G1 X142.587 Y117.542 E-.22004
G1 X142.23 Y117.899 E-.19198
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/88
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.92 I-1.085 J.551 P1  F30000
G1 X150.834 Y134.834 Z6.92
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.22 Y134.644 Z7 F30000
G1 X142.19 Y134.639 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426628
G1 F5148
G1 X141.542 Y133.992 E.01222
G1 X141.542 Y133.413 E.00773
G1 X142.587 Y134.458 E.01973
G1 X143.166 Y134.458 E.00773
G1 X141.542 Y132.834 E.03066
G1 X141.542 Y132.255 E.00773
G1 X143.746 Y134.458 E.04159
G1 X144.325 Y134.458 E.00773
G1 X141.542 Y131.675 E.05252
G1 X141.542 Y131.096 E.00773
G1 X144.904 Y134.458 E.06345
G1 X145.483 Y134.458 E.00773
G1 X141.542 Y130.517 E.07438
G1 X141.542 Y129.938 E.00773
G1 X146.062 Y134.458 E.08531
G1 X146.641 Y134.458 E.00773
G1 X141.542 Y129.359 E.09624
G1 X141.542 Y128.78 E.00773
G1 X147.22 Y134.458 E.10717
G1 X147.799 Y134.458 E.00773
G1 X141.542 Y128.201 E.1181
G1 X141.542 Y127.622 E.00773
G1 X148.378 Y134.458 E.12903
G1 X148.957 Y134.458 E.00773
G1 X141.542 Y127.043 E.13995
G1 X141.542 Y126.464 E.00773
G1 X149.536 Y134.458 E.15088
G1 X150.115 Y134.458 E.00773
G1 X141.542 Y125.885 E.16181
G1 X141.542 Y125.306 E.00773
G1 X150.458 Y134.222 E.16828
G1 X150.458 Y133.643 E.00773
G1 X141.542 Y124.727 E.16828
G1 X141.542 Y124.148 E.00773
G1 X150.458 Y133.064 E.16828
G1 X150.458 Y132.484 E.00773
G1 X141.542 Y123.569 E.16828
M73 P94 R1
G1 X141.542 Y122.99 E.00773
G1 X150.458 Y131.905 E.16828
G1 X150.458 Y131.326 E.00773
G1 X141.542 Y122.41 E.16828
G1 X141.542 Y121.831 E.00773
G1 X150.458 Y130.747 E.16828
G1 X150.458 Y130.168 E.00773
G1 X141.542 Y121.252 E.16828
G1 X141.542 Y120.673 E.00773
G1 X150.458 Y129.589 E.16828
G1 X150.458 Y129.01 E.00773
G1 X141.542 Y120.094 E.16828
G1 X141.542 Y119.515 E.00773
G1 X150.458 Y128.431 E.16828
G1 X150.458 Y127.852 E.00773
G1 X141.542 Y118.936 E.16828
G1 X141.542 Y118.357 E.00773
G1 X150.458 Y127.273 E.16828
G1 X150.458 Y126.694 E.00773
G1 X141.542 Y117.778 E.16828
G1 X141.542 Y117.542 E.00315
G1 X141.885 Y117.542 E.00458
G1 X150.458 Y126.115 E.16181
G1 X150.458 Y125.536 E.00773
G1 X142.464 Y117.542 E.15088
G1 X143.043 Y117.542 E.00773
G1 X150.458 Y124.957 E.13995
G1 X150.458 Y124.378 E.00773
G1 X143.622 Y117.542 E.12902
G1 X144.201 Y117.542 E.00773
G1 X150.458 Y123.798 E.11809
G1 X150.458 Y123.219 E.00773
G1 X144.781 Y117.542 E.10716
G1 X145.36 Y117.542 E.00773
G1 X150.458 Y122.64 E.09623
G1 X150.458 Y122.061 E.00773
G1 X145.939 Y117.542 E.0853
G1 X146.518 Y117.542 E.00773
G1 X150.458 Y121.482 E.07437
G1 X150.458 Y120.903 E.00773
G1 X147.097 Y117.542 E.06344
G1 X147.676 Y117.542 E.00773
G1 X150.458 Y120.324 E.05251
G1 X150.458 Y119.745 E.00773
G1 X148.255 Y117.542 E.04158
G1 X148.834 Y117.542 E.00773
G1 X150.458 Y119.166 E.03065
G1 X150.458 Y118.587 E.00773
G1 X149.413 Y117.542 E.01972
G1 X149.992 Y117.542 E.00773
G1 X150.639 Y118.189 E.01221
; CHANGE_LAYER
; Z_HEIGHT: 6.68
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X149.992 Y117.542 E-.34776
G1 X149.413 Y117.542 E-.22004
G1 X149.771 Y117.9 E-.19219
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/88
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7 I-1.215 J.076 P1  F30000
G1 X150.834 Y134.834 Z7
G1 Z6.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.811 Y134.639 Z7.08 F30000
G1 Z6.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426628
G1 F5129
G1 X150.458 Y133.992 E.01221
G1 X150.458 Y133.413 E.00773
G1 X149.413 Y134.458 E.01972
G1 X148.834 Y134.458 E.00773
G1 X150.458 Y132.834 E.03065
G1 X150.458 Y132.255 E.00773
G1 X148.255 Y134.458 E.04158
G1 X147.676 Y134.458 E.00773
G1 X150.458 Y131.676 E.05251
G1 X150.458 Y131.097 E.00773
G1 X147.097 Y134.458 E.06344
G1 X146.518 Y134.458 E.00773
G1 X150.458 Y130.518 E.07437
G1 X150.458 Y129.939 E.00773
G1 X145.939 Y134.458 E.0853
G1 X145.36 Y134.458 E.00773
G1 X150.458 Y129.36 E.09623
G1 X150.458 Y128.781 E.00773
G1 X144.781 Y134.458 E.10716
G1 X144.201 Y134.458 E.00773
G1 X150.458 Y128.201 E.11809
G1 X150.458 Y127.622 E.00773
G1 X143.622 Y134.458 E.12902
G1 X143.043 Y134.458 E.00773
G1 X150.458 Y127.043 E.13995
G1 X150.458 Y126.464 E.00773
G1 X142.464 Y134.458 E.15088
G1 X141.885 Y134.458 E.00773
G1 X150.458 Y125.885 E.16181
G1 X150.458 Y125.306 E.00773
G1 X141.542 Y134.222 E.16828
G1 X141.542 Y133.643 E.00773
G1 X150.458 Y124.727 E.16828
G1 X150.458 Y124.148 E.00773
G1 X141.542 Y133.064 E.16828
G1 X141.542 Y132.485 E.00773
G1 X150.458 Y123.569 E.16828
G1 X150.458 Y122.99 E.00773
G1 X141.542 Y131.906 E.16828
G1 X141.542 Y131.327 E.00773
G1 X150.458 Y122.411 E.16828
G1 X150.458 Y121.832 E.00773
G1 X141.542 Y130.748 E.16828
G1 X141.542 Y130.169 E.00773
G1 X150.458 Y121.253 E.16828
G1 X150.458 Y120.674 E.00773
G1 X141.542 Y129.59 E.16828
G1 X141.542 Y129.01 E.00773
G1 X150.458 Y120.095 E.16828
G1 X150.458 Y119.516 E.00773
G1 X141.542 Y128.431 E.16828
G1 X141.542 Y127.852 E.00773
G1 X150.458 Y118.936 E.16828
G1 X150.458 Y118.357 E.00773
G1 X141.542 Y127.273 E.16828
G1 X141.542 Y126.694 E.00773
G1 X150.458 Y117.778 E.16828
G1 X150.458 Y117.542 E.00315
G1 X150.115 Y117.542 E.00457
G1 X141.542 Y126.115 E.16181
G1 X141.542 Y125.536 E.00773
G1 X149.536 Y117.542 E.15088
G1 X148.957 Y117.542 E.00773
G1 X141.542 Y124.957 E.13996
G1 X141.542 Y124.378 E.00773
G1 X148.378 Y117.542 E.12903
G1 X147.799 Y117.542 E.00773
G1 X141.542 Y123.799 E.1181
G1 X141.542 Y123.22 E.00773
G1 X147.22 Y117.542 E.10717
G1 X146.641 Y117.542 E.00773
G1 X141.542 Y122.641 E.09624
G1 X141.542 Y122.062 E.00773
G1 X146.062 Y117.542 E.08531
G1 X145.483 Y117.542 E.00773
G1 X141.542 Y121.483 E.07438
G1 X141.542 Y120.904 E.00773
G1 X144.904 Y117.542 E.06345
G1 X144.325 Y117.542 E.00773
G1 X141.542 Y120.325 E.05252
G1 X141.542 Y119.745 E.00773
G1 X143.746 Y117.542 E.04159
G1 X143.166 Y117.542 E.00773
G1 X141.542 Y119.166 E.03066
G1 X141.542 Y118.587 E.00773
G1 X142.587 Y117.542 E.01973
G1 X142.008 Y117.542 E.00773
G1 X141.361 Y118.19 E.01222
; CHANGE_LAYER
; Z_HEIGHT: 6.76
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F21000
G1 X142.008 Y117.542 E-.34798
G1 X142.587 Y117.542 E-.22004
G1 X142.23 Y117.899 E-.19198
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/88
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.08 I-1.085 J.551 P1  F30000
G1 X150.834 Y134.834 Z7.08
G1 Z6.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.22 Y134.644 Z7.16 F30000
G1 X142.19 Y134.639 Z7.16
G1 Z6.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426628
G1 F5148
G1 X141.542 Y133.992 E.01222
G1 X141.542 Y133.413 E.00773
G1 X142.587 Y134.458 E.01973
G1 X143.166 Y134.458 E.00773
G1 X141.542 Y132.834 E.03066
G1 X141.542 Y132.255 E.00773
G1 X143.746 Y134.458 E.04159
G1 X144.325 Y134.458 E.00773
G1 X141.542 Y131.675 E.05252
G1 X141.542 Y131.096 E.00773
G1 X144.904 Y134.458 E.06345
G1 X145.483 Y134.458 E.00773
G1 X141.542 Y130.517 E.07438
G1 X141.542 Y129.938 E.00773
G1 X146.062 Y134.458 E.08531
G1 X146.641 Y134.458 E.00773
G1 X141.542 Y129.359 E.09624
G1 X141.542 Y128.78 E.00773
G1 X147.22 Y134.458 E.10717
G1 X147.799 Y134.458 E.00773
G1 X141.542 Y128.201 E.1181
G1 X141.542 Y127.622 E.00773
G1 X148.378 Y134.458 E.12903
G1 X148.957 Y134.458 E.00773
G1 X141.542 Y127.043 E.13995
G1 X141.542 Y126.464 E.00773
G1 X149.536 Y134.458 E.15088
G1 X150.115 Y134.458 E.00773
G1 X141.542 Y125.885 E.16181
M73 P95 R1
G1 X141.542 Y125.306 E.00773
G1 X150.458 Y134.222 E.16828
G1 X150.458 Y133.643 E.00773
G1 X141.542 Y124.727 E.16828
G1 X141.542 Y124.148 E.00773
G1 X150.458 Y133.064 E.16828
G1 X150.458 Y132.484 E.00773
G1 X141.542 Y123.569 E.16828
G1 X141.542 Y122.99 E.00773
G1 X150.458 Y131.905 E.16828
G1 X150.458 Y131.326 E.00773
G1 X141.542 Y122.41 E.16828
G1 X141.542 Y121.831 E.00773
G1 X150.458 Y130.747 E.16828
G1 X150.458 Y130.168 E.00773
G1 X141.542 Y121.252 E.16828
G1 X141.542 Y120.673 E.00773
G1 X150.458 Y129.589 E.16828
G1 X150.458 Y129.01 E.00773
G1 X141.542 Y120.094 E.16828
G1 X141.542 Y119.515 E.00773
G1 X150.458 Y128.431 E.16828
G1 X150.458 Y127.852 E.00773
G1 X141.542 Y118.936 E.16828
G1 X141.542 Y118.357 E.00773
G1 X150.458 Y127.273 E.16828
G1 X150.458 Y126.694 E.00773
G1 X141.542 Y117.778 E.16828
G1 X141.542 Y117.542 E.00315
G1 X141.885 Y117.542 E.00458
G1 X150.458 Y126.115 E.16181
G1 X150.458 Y125.536 E.00773
G1 X142.464 Y117.542 E.15088
G1 X143.043 Y117.542 E.00773
G1 X150.458 Y124.957 E.13995
G1 X150.458 Y124.378 E.00773
G1 X143.622 Y117.542 E.12902
G1 X144.201 Y117.542 E.00773
G1 X150.458 Y123.798 E.11809
G1 X150.458 Y123.219 E.00773
G1 X144.781 Y117.542 E.10716
G1 X145.36 Y117.542 E.00773
G1 X150.458 Y122.64 E.09623
G1 X150.458 Y122.061 E.00773
G1 X145.939 Y117.542 E.0853
G1 X146.518 Y117.542 E.00773
G1 X150.458 Y121.482 E.07437
G1 X150.458 Y120.903 E.00773
G1 X147.097 Y117.542 E.06344
G1 X147.676 Y117.542 E.00773
G1 X150.458 Y120.324 E.05251
G1 X150.458 Y119.745 E.00773
G1 X148.255 Y117.542 E.04158
G1 X148.834 Y117.542 E.00773
G1 X150.458 Y119.166 E.03065
G1 X150.458 Y118.587 E.00773
G1 X149.413 Y117.542 E.01972
G1 X149.992 Y117.542 E.00773
G1 X150.639 Y118.189 E.01221
; CHANGE_LAYER
; Z_HEIGHT: 6.84
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X149.992 Y117.542 E-.34776
G1 X149.413 Y117.542 E-.22004
G1 X149.771 Y117.9 E-.19219
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/88
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.16 I-1.215 J.076 P1  F30000
G1 X150.834 Y134.834 Z7.16
G1 Z6.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.811 Y134.639 Z7.24 F30000
G1 Z6.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426628
G1 F5129
G1 X150.458 Y133.992 E.01221
G1 X150.458 Y133.413 E.00773
G1 X149.413 Y134.458 E.01972
G1 X148.834 Y134.458 E.00773
G1 X150.458 Y132.834 E.03065
G1 X150.458 Y132.255 E.00773
G1 X148.255 Y134.458 E.04158
G1 X147.676 Y134.458 E.00773
G1 X150.458 Y131.676 E.05251
G1 X150.458 Y131.097 E.00773
G1 X147.097 Y134.458 E.06344
G1 X146.518 Y134.458 E.00773
G1 X150.458 Y130.518 E.07437
G1 X150.458 Y129.939 E.00773
G1 X145.939 Y134.458 E.0853
G1 X145.36 Y134.458 E.00773
G1 X150.458 Y129.36 E.09623
G1 X150.458 Y128.781 E.00773
G1 X144.781 Y134.458 E.10716
G1 X144.201 Y134.458 E.00773
G1 X150.458 Y128.201 E.11809
G1 X150.458 Y127.622 E.00773
G1 X143.622 Y134.458 E.12902
G1 X143.043 Y134.458 E.00773
G1 X150.458 Y127.043 E.13995
G1 X150.458 Y126.464 E.00773
G1 X142.464 Y134.458 E.15088
G1 X141.885 Y134.458 E.00773
G1 X150.458 Y125.885 E.16181
G1 X150.458 Y125.306 E.00773
G1 X141.542 Y134.222 E.16828
G1 X141.542 Y133.643 E.00773
G1 X150.458 Y124.727 E.16828
G1 X150.458 Y124.148 E.00773
G1 X141.542 Y133.064 E.16828
G1 X141.542 Y132.485 E.00773
G1 X150.458 Y123.569 E.16828
G1 X150.458 Y122.99 E.00773
G1 X141.542 Y131.906 E.16828
G1 X141.542 Y131.327 E.00773
G1 X150.458 Y122.411 E.16828
G1 X150.458 Y121.832 E.00773
G1 X141.542 Y130.748 E.16828
G1 X141.542 Y130.169 E.00773
G1 X150.458 Y121.253 E.16828
G1 X150.458 Y120.674 E.00773
G1 X141.542 Y129.59 E.16828
G1 X141.542 Y129.01 E.00773
G1 X150.458 Y120.095 E.16828
G1 X150.458 Y119.516 E.00773
G1 X141.542 Y128.431 E.16828
G1 X141.542 Y127.852 E.00773
G1 X150.458 Y118.936 E.16828
G1 X150.458 Y118.357 E.00773
G1 X141.542 Y127.273 E.16828
G1 X141.542 Y126.694 E.00773
G1 X150.458 Y117.778 E.16828
G1 X150.458 Y117.542 E.00315
G1 X150.115 Y117.542 E.00457
G1 X141.542 Y126.115 E.16181
G1 X141.542 Y125.536 E.00773
G1 X149.536 Y117.542 E.15088
G1 X148.957 Y117.542 E.00773
G1 X141.542 Y124.957 E.13996
G1 X141.542 Y124.378 E.00773
G1 X148.378 Y117.542 E.12903
G1 X147.799 Y117.542 E.00773
G1 X141.542 Y123.799 E.1181
G1 X141.542 Y123.22 E.00773
G1 X147.22 Y117.542 E.10717
G1 X146.641 Y117.542 E.00773
G1 X141.542 Y122.641 E.09624
G1 X141.542 Y122.062 E.00773
G1 X146.062 Y117.542 E.08531
G1 X145.483 Y117.542 E.00773
G1 X141.542 Y121.483 E.07438
G1 X141.542 Y120.904 E.00773
G1 X144.904 Y117.542 E.06345
G1 X144.325 Y117.542 E.00773
G1 X141.542 Y120.325 E.05252
G1 X141.542 Y119.745 E.00773
G1 X143.746 Y117.542 E.04159
G1 X143.166 Y117.542 E.00773
G1 X141.542 Y119.166 E.03066
G1 X141.542 Y118.587 E.00773
G1 X142.587 Y117.542 E.01973
G1 X142.008 Y117.542 E.00773
G1 X141.361 Y118.19 E.01222
; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X142.008 Y117.542 E-.34798
G1 X142.587 Y117.542 E-.22004
G1 X142.23 Y117.899 E-.19198
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/88
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.24 I-1.085 J.551 P1  F30000
G1 X150.834 Y134.834 Z7.24
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.22 Y134.644 Z7.32 F30000
G1 X142.19 Y134.639 Z7.32
G1 Z6.92
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426628
G1 F5148
G1 X141.542 Y133.992 E.01222
G1 X141.542 Y133.413 E.00773
M73 P96 R1
G1 X142.587 Y134.458 E.01973
G1 X143.166 Y134.458 E.00773
G1 X141.542 Y132.834 E.03066
G1 X141.542 Y132.255 E.00773
G1 X143.746 Y134.458 E.04159
G1 X144.325 Y134.458 E.00773
G1 X141.542 Y131.675 E.05252
G1 X141.542 Y131.096 E.00773
G1 X144.904 Y134.458 E.06345
G1 X145.483 Y134.458 E.00773
G1 X141.542 Y130.517 E.07438
G1 X141.542 Y129.938 E.00773
G1 X146.062 Y134.458 E.08531
G1 X146.641 Y134.458 E.00773
G1 X141.542 Y129.359 E.09624
G1 X141.542 Y128.78 E.00773
G1 X147.22 Y134.458 E.10717
G1 X147.799 Y134.458 E.00773
G1 X141.542 Y128.201 E.1181
G1 X141.542 Y127.622 E.00773
G1 X148.378 Y134.458 E.12903
G1 X148.957 Y134.458 E.00773
G1 X141.542 Y127.043 E.13995
G1 X141.542 Y126.464 E.00773
G1 X149.536 Y134.458 E.15088
G1 X150.115 Y134.458 E.00773
G1 X141.542 Y125.885 E.16181
G1 X141.542 Y125.306 E.00773
G1 X150.458 Y134.222 E.16828
G1 X150.458 Y133.643 E.00773
G1 X141.542 Y124.727 E.16828
G1 X141.542 Y124.148 E.00773
G1 X150.458 Y133.064 E.16828
G1 X150.458 Y132.484 E.00773
G1 X141.542 Y123.569 E.16828
G1 X141.542 Y122.99 E.00773
G1 X150.458 Y131.905 E.16828
G1 X150.458 Y131.326 E.00773
G1 X141.542 Y122.41 E.16828
G1 X141.542 Y121.831 E.00773
G1 X150.458 Y130.747 E.16828
G1 X150.458 Y130.168 E.00773
G1 X141.542 Y121.252 E.16828
G1 X141.542 Y120.673 E.00773
G1 X150.458 Y129.589 E.16828
G1 X150.458 Y129.01 E.00773
G1 X141.542 Y120.094 E.16828
G1 X141.542 Y119.515 E.00773
G1 X150.458 Y128.431 E.16828
G1 X150.458 Y127.852 E.00773
G1 X141.542 Y118.936 E.16828
G1 X141.542 Y118.357 E.00773
G1 X150.458 Y127.273 E.16828
G1 X150.458 Y126.694 E.00773
G1 X141.542 Y117.778 E.16828
G1 X141.542 Y117.542 E.00315
G1 X141.885 Y117.542 E.00458
G1 X150.458 Y126.115 E.16181
G1 X150.458 Y125.536 E.00773
G1 X142.464 Y117.542 E.15088
G1 X143.043 Y117.542 E.00773
G1 X150.458 Y124.957 E.13995
G1 X150.458 Y124.378 E.00773
G1 X143.622 Y117.542 E.12902
G1 X144.201 Y117.542 E.00773
G1 X150.458 Y123.798 E.11809
G1 X150.458 Y123.219 E.00773
G1 X144.781 Y117.542 E.10716
G1 X145.36 Y117.542 E.00773
G1 X150.458 Y122.64 E.09623
G1 X150.458 Y122.061 E.00773
G1 X145.939 Y117.542 E.0853
G1 X146.518 Y117.542 E.00773
G1 X150.458 Y121.482 E.07437
G1 X150.458 Y120.903 E.00773
G1 X147.097 Y117.542 E.06344
G1 X147.676 Y117.542 E.00773
G1 X150.458 Y120.324 E.05251
G1 X150.458 Y119.745 E.00773
G1 X148.255 Y117.542 E.04158
G1 X148.834 Y117.542 E.00773
G1 X150.458 Y119.166 E.03065
G1 X150.458 Y118.587 E.00773
G1 X149.413 Y117.542 E.01972
G1 X149.992 Y117.542 E.00773
G1 X150.639 Y118.189 E.01221
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X149.992 Y117.542 E-.34776
G1 X149.413 Y117.542 E-.22004
G1 X149.771 Y117.9 E-.19219
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/88
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.32 I-1.215 J.076 P1  F30000
G1 X150.834 Y134.834 Z7.32
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
M73 P96 R0
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.811 Y134.639 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426628
G1 F5129
G1 X150.458 Y133.992 E.01221
G1 X150.458 Y133.413 E.00773
G1 X149.413 Y134.458 E.01972
G1 X148.834 Y134.458 E.00773
G1 X150.458 Y132.834 E.03065
G1 X150.458 Y132.255 E.00773
G1 X148.255 Y134.458 E.04158
G1 X147.676 Y134.458 E.00773
G1 X150.458 Y131.676 E.05251
G1 X150.458 Y131.097 E.00773
G1 X147.097 Y134.458 E.06344
G1 X146.518 Y134.458 E.00773
G1 X150.458 Y130.518 E.07437
G1 X150.458 Y129.939 E.00773
G1 X145.939 Y134.458 E.0853
G1 X145.36 Y134.458 E.00773
G1 X150.458 Y129.36 E.09623
G1 X150.458 Y128.781 E.00773
G1 X144.781 Y134.458 E.10716
G1 X144.201 Y134.458 E.00773
G1 X150.458 Y128.201 E.11809
G1 X150.458 Y127.622 E.00773
G1 X143.622 Y134.458 E.12902
G1 X143.043 Y134.458 E.00773
G1 X150.458 Y127.043 E.13995
G1 X150.458 Y126.464 E.00773
G1 X142.464 Y134.458 E.15088
G1 X141.885 Y134.458 E.00773
G1 X150.458 Y125.885 E.16181
G1 X150.458 Y125.306 E.00773
G1 X141.542 Y134.222 E.16828
G1 X141.542 Y133.643 E.00773
G1 X150.458 Y124.727 E.16828
G1 X150.458 Y124.148 E.00773
G1 X141.542 Y133.064 E.16828
G1 X141.542 Y132.485 E.00773
G1 X150.458 Y123.569 E.16828
G1 X150.458 Y122.99 E.00773
G1 X141.542 Y131.906 E.16828
G1 X141.542 Y131.327 E.00773
G1 X150.458 Y122.411 E.16828
G1 X150.458 Y121.832 E.00773
G1 X141.542 Y130.748 E.16828
G1 X141.542 Y130.169 E.00773
G1 X150.458 Y121.253 E.16828
G1 X150.458 Y120.674 E.00773
G1 X141.542 Y129.59 E.16828
G1 X141.542 Y129.01 E.00773
G1 X150.458 Y120.095 E.16828
G1 X150.458 Y119.516 E.00773
G1 X141.542 Y128.431 E.16828
G1 X141.542 Y127.852 E.00773
G1 X150.458 Y118.936 E.16828
G1 X150.458 Y118.357 E.00773
G1 X141.542 Y127.273 E.16828
G1 X141.542 Y126.694 E.00773
G1 X150.458 Y117.778 E.16828
G1 X150.458 Y117.542 E.00315
G1 X150.115 Y117.542 E.00457
G1 X141.542 Y126.115 E.16181
G1 X141.542 Y125.536 E.00773
G1 X149.536 Y117.542 E.15088
G1 X148.957 Y117.542 E.00773
G1 X141.542 Y124.957 E.13996
G1 X141.542 Y124.378 E.00773
G1 X148.378 Y117.542 E.12903
G1 X147.799 Y117.542 E.00773
G1 X141.542 Y123.799 E.1181
G1 X141.542 Y123.22 E.00773
G1 X147.22 Y117.542 E.10717
G1 X146.641 Y117.542 E.00773
G1 X141.542 Y122.641 E.09624
G1 X141.542 Y122.062 E.00773
G1 X146.062 Y117.542 E.08531
G1 X145.483 Y117.542 E.00773
G1 X141.542 Y121.483 E.07438
G1 X141.542 Y120.904 E.00773
G1 X144.904 Y117.542 E.06345
G1 X144.325 Y117.542 E.00773
G1 X141.542 Y120.325 E.05252
G1 X141.542 Y119.745 E.00773
G1 X143.746 Y117.542 E.04159
G1 X143.166 Y117.542 E.00773
G1 X141.542 Y119.166 E.03066
G1 X141.542 Y118.587 E.00773
G1 X142.587 Y117.542 E.01973
G1 X142.008 Y117.542 E.00773
G1 X141.361 Y118.19 E.01222
; CHANGE_LAYER
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X142.008 Y117.542 E-.34798
G1 X142.587 Y117.542 E-.22004
G1 X142.23 Y117.899 E-.19198
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/88
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.4 I-1.085 J.551 P1  F30000
G1 X150.834 Y134.834 Z7.4
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F4800
G1 X141.166 Y134.834 E.15216
G1 X141.166 Y117.166 E.27807
G1 X150.834 Y117.166 E.15216
G1 X150.834 Y134.774 E.27712
G1 X151.317 Y135.317 F30000
G1 F4800
G1 X140.683 Y135.317 E.16736
G1 X140.683 Y116.683 E.29327
G1 X151.317 Y116.683 E.16736
M73 P97 R0
G1 X151.317 Y135.257 E.29232
M204 S250
G1 X151.775 Y135.775 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.22 Y134.644 Z7.48 F30000
G1 X142.19 Y134.639 Z7.48
G1 Z7.08
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426628
G1 F5148
G1 X141.542 Y133.992 E.01222
G1 X141.542 Y133.413 E.00773
G1 X142.587 Y134.458 E.01973
G1 X143.166 Y134.458 E.00773
G1 X141.542 Y132.834 E.03066
G1 X141.542 Y132.255 E.00773
G1 X143.746 Y134.458 E.04159
G1 X144.325 Y134.458 E.00773
G1 X141.542 Y131.675 E.05252
G1 X141.542 Y131.096 E.00773
G1 X144.904 Y134.458 E.06345
G1 X145.483 Y134.458 E.00773
G1 X141.542 Y130.517 E.07438
G1 X141.542 Y129.938 E.00773
G1 X146.062 Y134.458 E.08531
G1 X146.641 Y134.458 E.00773
G1 X141.542 Y129.359 E.09624
G1 X141.542 Y128.78 E.00773
G1 X147.22 Y134.458 E.10717
G1 X147.799 Y134.458 E.00773
G1 X141.542 Y128.201 E.1181
G1 X141.542 Y127.622 E.00773
G1 X148.378 Y134.458 E.12903
G1 X148.957 Y134.458 E.00773
G1 X141.542 Y127.043 E.13995
G1 X141.542 Y126.464 E.00773
G1 X149.536 Y134.458 E.15088
G1 X150.115 Y134.458 E.00773
G1 X141.542 Y125.885 E.16181
G1 X141.542 Y125.306 E.00773
G1 X150.458 Y134.222 E.16828
G1 X150.458 Y133.643 E.00773
G1 X141.542 Y124.727 E.16828
G1 X141.542 Y124.148 E.00773
G1 X150.458 Y133.064 E.16828
G1 X150.458 Y132.484 E.00773
G1 X141.542 Y123.569 E.16828
G1 X141.542 Y122.99 E.00773
G1 X150.458 Y131.905 E.16828
G1 X150.458 Y131.326 E.00773
G1 X141.542 Y122.41 E.16828
G1 X141.542 Y121.831 E.00773
G1 X150.458 Y130.747 E.16828
G1 X150.458 Y130.168 E.00773
G1 X141.542 Y121.252 E.16828
G1 X141.542 Y120.673 E.00773
G1 X150.458 Y129.589 E.16828
G1 X150.458 Y129.01 E.00773
G1 X141.542 Y120.094 E.16828
G1 X141.542 Y119.515 E.00773
G1 X150.458 Y128.431 E.16828
G1 X150.458 Y127.852 E.00773
G1 X141.542 Y118.936 E.16828
G1 X141.542 Y118.357 E.00773
G1 X150.458 Y127.273 E.16828
G1 X150.458 Y126.694 E.00773
G1 X141.542 Y117.778 E.16828
G1 X141.542 Y117.542 E.00315
G1 X141.885 Y117.542 E.00458
G1 X150.458 Y126.115 E.16181
G1 X150.458 Y125.536 E.00773
G1 X142.464 Y117.542 E.15088
G1 X143.043 Y117.542 E.00773
G1 X150.458 Y124.957 E.13995
G1 X150.458 Y124.378 E.00773
G1 X143.622 Y117.542 E.12902
G1 X144.201 Y117.542 E.00773
G1 X150.458 Y123.798 E.11809
G1 X150.458 Y123.219 E.00773
G1 X144.781 Y117.542 E.10716
G1 X145.36 Y117.542 E.00773
G1 X150.458 Y122.64 E.09623
G1 X150.458 Y122.061 E.00773
G1 X145.939 Y117.542 E.0853
G1 X146.518 Y117.542 E.00773
G1 X150.458 Y121.482 E.07437
G1 X150.458 Y120.903 E.00773
G1 X147.097 Y117.542 E.06344
G1 X147.676 Y117.542 E.00773
G1 X150.458 Y120.324 E.05251
G1 X150.458 Y119.745 E.00773
G1 X148.255 Y117.542 E.04158
G1 X148.834 Y117.542 E.00773
G1 X150.458 Y119.166 E.03065
G1 X150.458 Y118.587 E.00773
G1 X149.413 Y117.542 E.01972
G1 X149.992 Y117.542 E.00773
G1 X150.639 Y118.189 E.01221
; CHANGE_LAYER
; Z_HEIGHT: 7.16
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F21000
G1 X149.992 Y117.542 E-.34776
G1 X149.413 Y117.542 E-.22004
G1 X149.771 Y117.9 E-.19219
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/88
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.48 I-1.209 J.136 P1  F30000
G1 X151.775 Y135.775 Z7.48
G1 Z7.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.45
G1 F2100
M204 S5000
G1 X140.225 Y135.775 E.16295
G1 X140.225 Y116.225 E.27581
G1 X151.775 Y116.225 E.16295
G1 X151.775 Y135.715 E.27497
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
M204 S10000
G1 X149.775 Y135.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.649 Y135.538 Z7.56 F30000
G1 Z7.16
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X151.538 Y134.649 E.01652
G1 X151.538 Y134.079
G1 X150.079 Y135.538 E.0271
G1 X149.509 Y135.538
G1 X151.538 Y133.509 E.03768
G1 X151.538 Y132.94
G1 X148.94 Y135.538 E.04826
G1 X148.37 Y135.538
G1 X151.538 Y132.37 E.05883
G1 X151.538 Y131.8
G1 X147.8 Y135.538 E.06941
G1 X147.231 Y135.538
G1 X151.538 Y131.231 E.07999
G1 X151.538 Y130.661
G1 X146.661 Y135.538 E.09057
G1 X146.091 Y135.538
G1 X151.538 Y130.091 E.10115
G1 X151.538 Y129.522
G1 X145.522 Y135.538 E.11173
G1 X144.952 Y135.538
G1 X151.538 Y128.952 E.12231
G1 X151.538 Y128.382
G1 X144.382 Y135.538 E.13288
G1 X143.813 Y135.538
G1 X151.538 Y127.813 E.14346
G1 X151.538 Y127.243
G1 X143.243 Y135.538 E.15404
G1 X142.673 Y135.538
G1 X151.538 Y126.673 E.16462
G1 X151.538 Y126.104
G1 X142.104 Y135.538 E.1752
G1 X141.534 Y135.538
G1 X151.538 Y125.534 E.18578
G1 X151.538 Y124.964
G1 X140.964 Y135.538 E.19635
G1 X140.462 Y135.471
G1 X151.538 Y124.394 E.20569
G1 X151.538 Y123.825
G1 X140.462 Y134.902 E.20569
G1 X140.462 Y134.332
G1 X151.538 Y123.255 E.20569
G1 X151.538 Y122.685
G1 X140.462 Y133.762 E.20569
G1 X140.462 Y133.193
G1 X151.538 Y122.116 E.20569
G1 X151.538 Y121.546
G1 X140.462 Y132.623 E.20569
G1 X140.462 Y132.053
G1 X151.538 Y120.976 E.20569
G1 X151.538 Y120.407
G1 X140.462 Y131.484 E.20569
G1 X140.462 Y130.914
G1 X151.538 Y119.837 E.20569
G1 X151.538 Y119.267
G1 X140.462 Y130.344 E.20569
G1 X140.462 Y129.774
G1 X151.538 Y118.698 E.20569
G1 X151.538 Y118.128
G1 X140.462 Y129.205 E.20569
G1 X140.462 Y128.635
G1 X151.538 Y117.558 E.20569
G1 X151.538 Y116.989
G1 X140.462 Y128.065 E.20569
G1 X140.462 Y127.496
G1 X151.496 Y116.462 E.20489
M73 P98 R0
G1 X150.926 Y116.462
G1 X140.462 Y126.926 E.19432
G1 X140.462 Y126.356
G1 X150.356 Y116.462 E.18374
G1 X149.787 Y116.462
G1 X140.462 Y125.787 E.17316
G1 X140.462 Y125.217
G1 X149.217 Y116.462 E.16258
G1 X148.647 Y116.462
G1 X140.462 Y124.647 E.152
G1 X140.462 Y124.078
G1 X148.078 Y116.462 E.14142
G1 X147.508 Y116.462
G1 X140.462 Y123.508 E.13084
G1 X140.462 Y122.938
G1 X146.938 Y116.462 E.12027
G1 X146.369 Y116.462
G1 X140.462 Y122.369 E.10969
G1 X140.462 Y121.799
G1 X145.799 Y116.462 E.09911
G1 X145.229 Y116.462
G1 X140.462 Y121.229 E.08853
G1 X140.462 Y120.659
G1 X144.659 Y116.462 E.07795
G1 X144.09 Y116.462
G1 X140.462 Y120.09 E.06737
G1 X140.462 Y119.52
G1 X143.52 Y116.462 E.05679
G1 X142.95 Y116.462
G1 X140.462 Y118.95 E.04622
G1 X140.462 Y118.381
G1 X142.381 Y116.462 E.03564
G1 X141.811 Y116.462
G1 X140.462 Y117.811 E.02506
G1 X140.462 Y117.241
G1 X141.241 Y116.462 E.01448
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F1800
M204 S10000
G1 X140.462 Y117.241 E-.41907
G1 X140.462 Y117.811 E-.21648
G1 X140.693 Y117.579 E-.12445
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.56 I1.217 J0 P1  F30000
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
G1 Z7.66 F900 ; lower z a little
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

    G1 Z107.16 F600
    G1 Z105.16

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

