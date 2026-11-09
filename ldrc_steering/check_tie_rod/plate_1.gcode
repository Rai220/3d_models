; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 7m 28s; total estimated time: 14m 33s
; total layer number: 45
; total filament length [mm] : 259.67
; total filament volume [cm^3] : 624.58
; total filament weight [g] : 0.77
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 5.48
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
; initial_layer_print_height = 0.2
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
M73 P3 R13
G1 E50 F200
M400
M104 S220
G92 E0
M73 P33 R9
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P35 R9
G1 E-0.5 F300

M73 P37 R9
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
M73 P38 R9
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
M73 P38 R8
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
    G29 A X101.608 Y119.658 I52.7845 J16.6841
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
M73 P39 R8
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
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/45
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
; OBJECT_ID: 15
G1 X102.81 Y118.467 F30000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1200
M204 S500
G1 X103.207 Y118.202 E.01777
G1 X103.751 Y117.987 E.02178
G1 X104.466 Y117.886 E.0269
G1 X112.553 Y117.893 E.30121
G1 X112.929 Y117.935 E.01408
M73 P40 R8
G1 X113.279 Y118.009 E.01332
G1 X113.588 Y118.106 E.01207
G1 X113.883 Y118.229 E.01192
G1 X114.168 Y118.378 E.01198
G1 X114.438 Y118.552 E.01198
G1 X114.691 Y118.748 E.01189
G1 X114.981 Y119.026 E.01498
G1 X115.117 Y119.088 E.00555
G1 X115.221 Y119.074 E.00391
G1 X115.449 Y118.987 E.00912
M73 P41 R8
G1 X116.166 Y118.886 E.02695
G1 X116.939 Y118.886 E.0288
G1 X117.427 Y118.933 E.01826
G1 X117.889 Y119.069 E.01794
G1 X118.247 Y119.245 E.01484
G1 X118.647 Y119.519 E.01806
G1 X118.983 Y119.86 E.01785
G1 X119.249 Y120.259 E.01784
G1 X119.437 Y120.712 E.0183
G1 X119.573 Y121.577 E.03259
G1 X119.607 Y121.665 E.00353
G1 X119.659 Y121.746 E.00357
G1 X119.762 Y121.832 E.00501
G1 X119.931 Y121.884 E.00657
G1 X140.006 Y121.886 E.7477
G1 X140.147 Y121.837 E.00555
M73 P42 R8
G1 X140.234 Y121.661 E.00734
G1 X140.239 Y121.353 E.01147
G1 X140.273 Y120.98 E.01394
G1 X140.376 Y120.503 E.01817
G1 X140.517 Y120.102 E.01584
G1 X140.646 Y119.829 E.01123
G1 X140.867 Y119.461 E.01602
G1 X141.217 Y119.025 E.0208
M73 P44 R8
G1 X141.64 Y118.641 E.02129
M73 P45 R7
G1 X141.959 Y118.421 E.01442
G1 X142.219 Y118.276 E.01109
G1 X142.67 Y118.085 E.01825
G1 X143.236 Y117.94 E.02178
M73 P48 R7
G1 X143.853 Y117.886 E.02307
G1 X151.539 Y117.886 E.28626
G1 X152.027 Y117.933 E.01826
G1 X152.489 Y118.069 E.01794
G1 X152.846 Y118.245 E.01484
G1 X153.246 Y118.519 E.01806
G1 X153.583 Y118.86 E.01785
G1 X153.848 Y119.258 E.01781
G1 X154.048 Y119.75 E.01977
G1 X154.164 Y120.517 E.0289
G1 X154.164 Y124.489 E.14794
G1 X154.117 Y124.977 E.01826
G1 X153.98 Y125.441 E.018
G1 X153.85 Y125.715 E.01131
G1 X153.53 Y126.198 E.02159
G1 X153.19 Y126.533 E.01779
G1 X152.793 Y126.798 E.01777
G1 X152.249 Y127.013 E.02178
G1 X151.534 Y127.114 E.0269
G1 X147.217 Y127.114 E.16079
G1 X147.076 Y127.163 E.00555
G1 X146.81 Y127.569 E.01809
G1 X146.553 Y127.893 E.01541
G1 X146.256 Y128.192 E.0157
G1 X145.92 Y128.459 E.01598
G1 X145.555 Y128.683 E.01595
G1 X145.165 Y128.863 E.01599
G1 X144.7 Y129.011 E.01817
G1 X144.23 Y129.092 E.01778
G1 X143.912 Y129.111 E.01184
G1 X120.792 Y129.114 E.86113
G1 X120.651 Y129.162 E.00555
G1 X120.564 Y129.341 E.00741
G1 X120.557 Y130.697 E.05048
G1 X120.478 Y131.275 E.02175
G1 X120.377 Y131.644 E.01426
G1 X120.259 Y131.95 E.01221
G1 X120.117 Y132.238 E.01194
G1 X119.928 Y132.544 E.01339
G1 X119.695 Y132.849 E.01432
G1 X119.444 Y133.113 E.01355
G1 X119.151 Y133.365 E.01441
G1 X118.885 Y133.551 E.01211
G1 X118.606 Y133.711 E.01195
G1 X118.294 Y133.854 E.01279
G1 X117.803 Y134.01 E.0192
G1 X117.47 Y134.075 E.01264
G1 X116.979 Y134.113 E.01835
G1 X112.351 Y134.107 E.17237
G1 X111.912 Y134.056 E.01645
G1 X111.518 Y133.962 E.01511
G1 X111 Y133.763 E.02068
G1 X110.719 Y133.615 E.01182
G1 X110.45 Y133.439 E.01197
G1 X110.197 Y133.242 E.01195
G1 X109.963 Y133.022 E.01195
G1 X109.733 Y132.763 E.0129
G1 X109.442 Y132.341 E.01911
G1 X109.292 Y132.061 E.01185
G1 X109.166 Y131.765 E.01195
G1 X109.067 Y131.459 E.012
M73 P49 R7
G1 X108.991 Y131.124 E.01279
G1 X108.939 Y130.622 E.01879
G1 X108.935 Y127.342 E.12216
G1 X108.886 Y127.201 E.00555
G1 X108.707 Y127.114 E.00744
G1 X104.461 Y127.114 E.15813
G1 X103.973 Y127.067 E.01826
G1 X103.511 Y126.931 E.01794
G1 X103.153 Y126.755 E.01485
G1 X102.753 Y126.481 E.01806
G1 X102.417 Y126.14 E.01785
G1 X102.152 Y125.743 E.01777
G1 X101.937 Y125.199 E.02177
G1 X101.836 Y124.484 E.02691
G1 X101.836 Y120.511 E.14798
G1 X101.883 Y120.023 E.01826
G1 X102.02 Y119.559 E.018
G1 X102.15 Y119.285 E.01131
G1 X102.47 Y118.802 E.02159
G1 X102.768 Y118.509 E.01555
M204 S6000
G1 X103.091 Y118.836 F30000
G1 F1200
M204 S500
G1 X103.111 Y118.816 E.00107
G1 X103.434 Y118.604 E.01437
G1 X103.853 Y118.438 E.0168
G1 X104.488 Y118.345 E.0239
G1 X112.535 Y118.351 E.29971
G1 X112.849 Y118.386 E.01177
G1 X113.156 Y118.45 E.01167
G1 X113.7 Y118.649 E.02156
G1 X114.179 Y118.929 E.02068
G1 X114.397 Y119.099 E.0103
G1 X114.657 Y119.348 E.01343
G1 X114.908 Y119.495 E.01084
G1 X115.192 Y119.538 E.01069
G1 X115.394 Y119.497 E.00768
G1 X115.58 Y119.43 E.00734
G1 X116.208 Y119.343 E.02362
G1 X116.911 Y119.343 E.02619
G1 X117.352 Y119.387 E.01653
G1 X117.711 Y119.493 E.01393
G1 X118.023 Y119.646 E.01296
G1 X118.341 Y119.864 E.01435
G1 X118.618 Y120.141 E.01458
G1 X118.836 Y120.464 E.01453
G1 X118.988 Y120.822 E.01448
G1 X119.12 Y121.638 E.03077
G1 X119.224 Y121.914 E.01099
G1 X119.376 Y122.105 E.00909
G1 X119.458 Y122.173 E.00398
G1 X119.642 Y122.273 E.00778
G1 X119.941 Y122.341 E.01144
G1 X139.994 Y122.343 E.74689
G1 X140.282 Y122.274 E.01103
G1 X140.455 Y122.171 E.0075
G1 X140.562 Y122.029 E.00661
G1 X140.637 Y121.877 E.0063
G1 X140.692 Y121.649 E.00875
G1 X140.728 Y121.042 E.02267
G1 X140.815 Y120.636 E.01544
G1 X140.939 Y120.282 E.01397
G1 X141.047 Y120.051 E.00951
G1 X141.249 Y119.715 E.01459
G1 X141.559 Y119.332 E.01836
G1 X141.932 Y118.994 E.01875
G1 X142.195 Y118.814 E.01188
G1 X142.414 Y118.691 E.00934
G1 X142.807 Y118.523 E.01593
G1 X143.324 Y118.391 E.01989
G1 X143.879 Y118.343 E.02074
G1 X151.524 Y118.344 E.28472
G1 X151.927 Y118.382 E.01508
G1 X152.311 Y118.493 E.0149
G1 X152.623 Y118.646 E.01295
G1 X152.961 Y118.881 E.01532
G1 X153.234 Y119.161 E.01458
G1 X153.447 Y119.486 E.01447
G1 X153.607 Y119.888 E.0161
G1 X153.705 Y120.541 E.02462
G1 X153.707 Y124.461 E.14598
G1 X153.662 Y124.903 E.01654
G1 X153.555 Y125.267 E.01414
G1 X153.455 Y125.48 E.00878
G1 X153.183 Y125.894 E.01845
G1 X152.909 Y126.168 E.01443
G1 X152.566 Y126.396 E.01534
G1 X152.115 Y126.57 E.018
G1 X151.492 Y126.657 E.02343
G1 X147.228 Y126.657 E.15882
G1 X147.057 Y126.686 E.00647
G1 X146.94 Y126.726 E.0046
G1 X146.764 Y126.831 E.00766
G1 X146.435 Y127.306 E.02152
G1 X146.216 Y127.583 E.01315
G1 X145.945 Y127.856 E.01432
G1 X145.65 Y128.088 E.01397
G1 X145.331 Y128.283 E.01392
G1 X144.991 Y128.439 E.01393
G1 X144.582 Y128.567 E.01596
G1 X144.169 Y128.638 E.01562
G1 X143.894 Y128.654 E.01026
G1 X120.804 Y128.657 E.86002
G1 X120.633 Y128.685 E.00647
G1 X120.516 Y128.726 E.0046
G1 X120.343 Y128.829 E.00749
G1 X120.235 Y128.973 E.0067
G1 X120.16 Y129.126 E.00636
G1 X120.107 Y129.354 E.00873
G1 X120.1 Y130.655 E.04845
G1 X120.03 Y131.174 E.01951
G1 X119.944 Y131.495 E.01237
G1 X119.842 Y131.761 E.01062
G1 X119.713 Y132.022 E.01083
G1 X119.555 Y132.278 E.01122
G1 X119.351 Y132.546 E.01255
G1 X119.134 Y132.776 E.01179
G1 X118.875 Y132.999 E.0127
G1 X118.644 Y133.161 E.01052
G1 X118.121 Y133.429 E.0219
G1 X117.697 Y133.565 E.01658
G1 X117.401 Y133.622 E.01125
G1 X116.956 Y133.656 E.0166
G1 X112.37 Y133.649 E.17081
G1 X112 Y133.606 E.01387
G1 X111.662 Y133.526 E.01293
G1 X111.197 Y133.349 E.01855
G1 X110.956 Y133.223 E.01011
G1 X110.491 Y132.89 E.02132
G1 X110.287 Y132.698 E.01042
G1 X110.089 Y132.474 E.01116
G1 X109.837 Y132.109 E.01651
G1 X109.707 Y131.868 E.01018
G1 X109.507 Y131.332 E.02134
G1 X109.442 Y131.042 E.01107
G1 X109.396 Y130.591 E.01686
G1 X109.392 Y127.353 E.12061
G1 X109.323 Y127.065 E.01104
G1 X109.22 Y126.892 E.00749
G1 X109.075 Y126.785 E.00673
G1 X108.921 Y126.71 E.00638
G1 X108.691 Y126.657 E.00877
G1 X104.489 Y126.657 E.15649
G1 X104.073 Y126.618 E.01557
G1 X103.689 Y126.507 E.01489
G1 X103.377 Y126.354 E.01296
G1 X103.059 Y126.136 E.01435
G1 X102.766 Y125.839 E.01555
G1 X102.554 Y125.516 E.01437
G1 X102.388 Y125.097 E.0168
G1 X102.295 Y124.461 E.02392
G1 X102.293 Y120.539 E.14609
G1 X102.333 Y120.123 E.01557
G1 X102.445 Y119.733 E.01511
G1 X102.554 Y119.503 E.00951
G1 X102.817 Y119.106 E.01773
G1 X103.048 Y118.878 E.01209
M204 S6000
G1 X103.372 Y119.205 F30000
G1 F1200
M204 S500
G1 X103.411 Y119.165 E.00209
G1 X103.659 Y119.007 E.01093
G1 X103.958 Y118.888 E.01198
G1 X104.512 Y118.803 E.02088
G1 X112.524 Y118.81 E.29842
G1 X113.039 Y118.894 E.01946
G1 X113.515 Y119.07 E.01889
M73 P50 R7
G1 X113.934 Y119.318 E.01812
G1 X114.437 Y119.749 E.02469
G1 X114.666 Y119.883 E.00989
G1 X114.853 Y119.949 E.0074
G1 X115.113 Y119.988 E.00976
G1 X115.294 Y119.984 E.00676
G1 X115.704 Y119.875 E.01581
G1 X116.249 Y119.8 E.02047
G1 X116.881 Y119.8 E.02355
G1 X117.277 Y119.842 E.01481
G1 X117.555 Y119.926 E.01084
G1 X117.801 Y120.048 E.01021
G1 X118.037 Y120.21 E.01069
G1 X118.254 Y120.424 E.01135
G1 X118.425 Y120.672 E.01123
G1 X118.539 Y120.934 E.01065
G1 X118.697 Y121.811 E.03317
G1 X118.793 Y122.065 E.01012
G1 X118.873 Y122.206 E.00605
G1 X119.012 Y122.381 E.00832
G1 X119.159 Y122.518 E.00749
G1 X119.418 Y122.671 E.01118
G1 X119.55 Y122.721 E.00527
G1 X119.833 Y122.785 E.0108
G1 X119.949 Y122.798 E.00434
G1 X139.981 Y122.8 E.7461
G1 X140.381 Y122.72 E.01521
G1 X140.525 Y122.661 E.0058
G1 X140.678 Y122.57 E.00662
G1 X140.827 Y122.436 E.00747
G1 X140.974 Y122.226 E.00956
G1 X141.083 Y121.975 E.01018
G1 X141.149 Y121.665 E.01179
G1 X141.184 Y121.093 E.02135
G1 X141.261 Y120.747 E.0132
G1 X141.444 Y120.281 E.01868
G1 X141.619 Y119.987 E.01274
G1 X141.885 Y119.656 E.01582
G1 X142.209 Y119.36 E.01634
G1 X142.603 Y119.109 E.01738
G1 X142.944 Y118.962 E.01385
G1 X143.412 Y118.842 E.01799
G1 X143.905 Y118.8 E.01841
G1 X151.495 Y118.801 E.28271
G1 X151.828 Y118.832 E.01246
G1 X152.134 Y118.918 E.01184
G1 X152.4 Y119.047 E.01099
G1 X152.674 Y119.241 E.01249
G1 X152.884 Y119.46 E.0113
G1 X153.045 Y119.711 E.01112
G1 X153.165 Y120.023 E.01246
G1 X153.247 Y120.565 E.02043
G1 X153.25 Y124.431 E.14398
G1 X153.213 Y124.802 E.01387
G1 X153.129 Y125.095 E.01135
G1 X153.06 Y125.248 E.00626
G1 X152.834 Y125.592 E.01534
G1 X152.606 Y125.82 E.01201
G1 X152.341 Y125.993 E.01181
G1 X151.984 Y126.127 E.01419
G1 X151.451 Y126.2 E.02003
G1 X147.24 Y126.2 E.15686
G1 X146.9 Y126.257 E.0128
G1 X146.697 Y126.339 E.00818
G1 X146.542 Y126.431 E.00672
G1 X146.379 Y126.583 E.0083
G1 X146.07 Y127.031 E.02026
G1 X145.878 Y127.273 E.01151
G1 X145.646 Y127.508 E.01231
G1 X145.382 Y127.717 E.01254
G1 X145.109 Y127.882 E.01189
G1 X144.819 Y128.014 E.01186
G1 X144.466 Y128.123 E.01376
G1 X144.109 Y128.183 E.01347
G1 X143.876 Y128.197 E.00871
G1 X120.813 Y128.2 E.859
G1 X120.564 Y128.234 E.00938
G1 X120.375 Y128.291 E.00734
G1 X120.118 Y128.431 E.01089
G1 X119.969 Y128.566 E.00751
G1 X119.875 Y128.691 E.00581
G1 X119.752 Y128.92 E.0097
G1 X119.714 Y129.027 E.0042
G1 X119.65 Y129.365 E.01282
G1 X119.644 Y130.614 E.04654
G1 X119.583 Y131.075 E.0173
G1 X119.427 Y131.565 E.01916
G1 X119.174 Y132.024 E.01952
G1 X119.007 Y132.244 E.01029
G1 X118.822 Y132.44 E.01004
G1 X118.399 Y132.773 E.02005
G1 X117.936 Y133.009 E.01936
G1 X117.591 Y133.119 E.01347
G1 X117.331 Y133.169 E.00985
G1 X116.934 Y133.199 E.01484
G1 X112.405 Y133.192 E.16869
G1 X112.087 Y133.156 E.01191
G1 X111.805 Y133.091 E.01077
G1 X111.393 Y132.935 E.01644
G1 X111.205 Y132.837 E.00788
G1 X110.789 Y132.542 E.019
G1 X110.445 Y132.185 E.01846
G1 X110.232 Y131.876 E.01398
G1 X110.129 Y131.687 E.00801
G1 X109.944 Y131.192 E.01969
G1 X109.893 Y130.961 E.00882
G1 X109.853 Y130.561 E.01497
G1 X109.849 Y127.366 E.11899
G1 X109.769 Y126.966 E.01521
G1 X109.71 Y126.821 E.0058
G1 X109.619 Y126.669 E.0066
G1 X109.482 Y126.518 E.00762
G1 X109.356 Y126.424 E.00584
G1 X109.129 Y126.303 E.00955
G1 X108.798 Y126.213 E.01278
G1 X108.683 Y126.2 E.00431
G1 X104.517 Y126.2 E.15516
G1 X104.171 Y126.168 E.01294
G1 X103.866 Y126.082 E.01183
G1 X103.617 Y125.962 E.0103
G1 X103.364 Y125.791 E.01136
G1 X103.115 Y125.539 E.0132
G1 X102.957 Y125.292 E.01094
G1 X102.838 Y124.993 E.01197
G1 X102.753 Y124.438 E.0209
G1 X102.75 Y120.567 E.14417
G1 X102.782 Y120.221 E.01294
G1 X102.871 Y119.906 E.01218
G1 X102.959 Y119.72 E.00768
G1 X103.164 Y119.41 E.01386
G1 X103.329 Y119.247 E.00863
M204 S6000
G1 X103.644 Y119.577 F30000
G1 F1200
M204 S500
G1 X103.853 Y119.429 E.00955
G1 X104.05 Y119.337 E.0081
G1 X104.381 Y119.264 E.0126
G1 X112.39 Y119.26 E.29832
G1 X112.752 Y119.299 E.01355
G1 X113.059 Y119.378 E.01181
G1 X113.178 Y119.425 E.00479
G1 X113.615 Y119.661 E.01848
G1 X113.8 Y119.798 E.00857
G1 X114.126 Y120.142 E.01765
G1 X114.24 Y120.307 E.00747
G1 X114.39 Y120.587 E.01184
G1 X114.486 Y120.844 E.01022
G1 X114.582 Y121.328 E.01836
G1 X114.594 Y128.114 E.25278
G1 X114.642 Y128.218 E.00426
G1 X114.732 Y128.251 E.00357
G1 X114.867 Y128.203 E.00534
G1 X114.9 Y128.114 E.00351
G1 X114.917 Y121.42 E.24933
G1 X114.996 Y121.084 E.01287
G1 X115.154 Y120.785 E.0126
G1 X115.267 Y120.652 E.00649
G1 X115.444 Y120.498 E.00875
G1 X115.753 Y120.336 E.01299
G1 X115.892 Y120.294 E.0054
G1 X116.169 Y120.257 E.01041
G1 X117.028 Y120.267 E.03201
G1 X117.37 Y120.346 E.01308
G1 X117.536 Y120.422 E.0068
G1 X117.671 Y120.512 E.00605
G1 X117.921 Y120.763 E.01318
G1 X118.066 Y121.01 E.01065
G1 X118.174 Y121.354 E.01345
G1 X118.22 Y121.779 E.01592
G1 X118.301 Y122.089 E.01192
G1 X118.431 Y122.371 E.01157
G1 X118.61 Y122.626 E.01161
G1 X118.839 Y122.855 E.01206
G1 X119.119 Y123.042 E.01253
G1 X119.417 Y123.167 E.01202
G1 X119.759 Y123.242 E.01306
G1 X141.469 Y123.257 E.80861
G1 X141.573 Y123.209 E.00426
G1 X141.606 Y123.121 E.00352
G1 X141.62 Y121.32 E.06706
G1 X141.708 Y120.855 E.01765
G1 X141.886 Y120.421 E.01747
G1 X142.002 Y120.234 E.00819
G1 X142.176 Y120.014 E.01044
G1 X142.666 Y119.602 E.02384
G1 X142.834 Y119.509 E.00716
G1 X143.197 Y119.361 E.01458
G1 X143.392 Y119.313 E.0075
G1 X143.864 Y119.257 E.01771
G1 X151.527 Y119.257 E.2854
G1 X151.843 Y119.306 E.01192
G1 X151.961 Y119.343 E.00461
G1 X152.263 Y119.503 E.01271
G1 X152.473 Y119.694 E.01056
G1 X152.621 Y119.903 E.00955
G1 X152.713 Y120.1 E.0081
G1 X152.756 Y120.242 E.00552
G1 X152.793 Y120.519 E.01044
G1 X152.793 Y124.477 E.1474
M73 P51 R7
G1 X152.744 Y124.794 E.01193
G1 X152.707 Y124.911 E.0046
G1 X152.547 Y125.213 E.01271
G1 X152.356 Y125.423 E.01056
G1 X152.147 Y125.571 E.00955
G1 X151.95 Y125.663 E.0081
G1 X151.808 Y125.706 E.00552
G1 X151.53 Y125.743 E.01044
G1 X146.811 Y125.743 E.17579
G1 X146.52 Y125.699 E.01097
G1 X146.255 Y125.599 E.01054
G1 X146.141 Y125.607 E.00426
G1 X146.07 Y125.713 E.00474
G1 X146.053 Y125.874 E.00604
G1 X145.971 Y126.2 E.01253
G1 X145.761 Y126.654 E.01861
G1 X145.42 Y127.088 E.02055
G1 X145.326 Y127.176 E.0048
G1 X144.88 Y127.481 E.02011
G1 X144.375 Y127.672 E.02012
G1 X143.899 Y127.74 E.01791
G1 X119.327 Y127.754 E.9152
G1 X119.223 Y127.801 E.00426
G1 X119.19 Y127.89 E.00352
G1 X119.171 Y130.746 E.1064
G1 X119.156 Y130.865 E.00444
G1 X119.043 Y131.288 E.0163
G1 X118.852 Y131.675 E.0161
G1 X118.572 Y132.04 E.01712
G1 X118.252 Y132.322 E.01589
G1 X118.03 Y132.461 E.00976
G1 X117.707 Y132.607 E.01321
G1 X117.433 Y132.685 E.01058
G1 X117.103 Y132.734 E.01243
G1 X112.562 Y132.743 E.16916
G1 X112.185 Y132.708 E.01409
G1 X111.802 Y132.609 E.01473
G1 X111.531 Y132.492 E.011
G1 X111.194 Y132.28 E.01483
G1 X110.911 Y132.024 E.0142
G1 X110.689 Y131.744 E.01332
G1 X110.465 Y131.311 E.01814
G1 X110.354 Y130.922 E.01509
G1 X110.307 Y130.486 E.01633
G1 X110.306 Y125.463 E.18709
G1 X110.258 Y125.359 E.00426
G1 X110.148 Y125.327 E.00426
G1 X110.074 Y125.363 E.00306
G1 X109.98 Y125.452 E.00483
G1 X109.774 Y125.589 E.00922
G1 X109.586 Y125.671 E.00763
G1 X109.268 Y125.737 E.01211
G1 X104.396 Y125.738 E.18146
G1 X104.177 Y125.699 E.00828
G1 X103.972 Y125.631 E.00804
G1 X103.821 Y125.551 E.00637
G1 X103.618 Y125.396 E.00949
G1 X103.529 Y125.308 E.00467
G1 X103.379 Y125.097 E.00965
G1 X103.286 Y124.898 E.00819
G1 X103.232 Y124.708 E.00734
G1 X103.208 Y120.524 E.15584
G1 X103.255 Y120.211 E.01178
G1 X103.376 Y119.907 E.01221
G1 X103.45 Y119.791 E.0051
G1 X103.604 Y119.622 E.00852
M204 S6000
G1 X103.923 Y119.939 F30000
G1 F1200
M204 S500
G1 X104.036 Y119.848 E.00541
G1 X104.253 Y119.746 E.00893
G1 X104.461 Y119.714 E.00782
G1 X112.345 Y119.714 E.29367
G1 X112.628 Y119.739 E.01059
G1 X112.953 Y119.823 E.01249
G1 X113.405 Y120.068 E.01915
G1 X113.522 Y120.16 E.00554
G1 X113.751 Y120.403 E.01244
G1 X113.833 Y120.516 E.00521
G1 X113.991 Y120.811 E.01246
G1 X114.04 Y120.94 E.00515
G1 X114.115 Y121.264 E.01237
G1 X114.128 Y121.382 E.00443
G1 X114.137 Y128.271 E.25661
G1 X114.184 Y128.48 E.00796
G1 X114.266 Y128.593 E.00519
G1 X114.37 Y128.667 E.00476
G1 X114.517 Y128.709 E.0057
G1 X114.987 Y128.707 E.0175
G1 X115.098 Y128.681 E.00425
G1 X115.232 Y128.59 E.00601
G1 X115.309 Y128.487 E.00481
G1 X115.357 Y128.32 E.00647
G1 X115.364 Y121.512 E.25358
G1 X115.407 Y121.282 E.00869
G1 X115.494 Y121.091 E.00782
G1 X115.623 Y120.939 E.00743
G1 X115.736 Y120.848 E.00541
G1 X115.953 Y120.746 E.00893
G1 X116.161 Y120.714 E.00782
G1 X116.938 Y120.714 E.02894
G1 X117.168 Y120.757 E.00871
G1 X117.356 Y120.843 E.00772
G1 X117.535 Y121.008 E.00907
G1 X117.634 Y121.156 E.00662
G1 X117.718 Y121.39 E.00927
G1 X117.77 Y121.874 E.01814
G1 X117.873 Y122.258 E.0148
G1 X118.04 Y122.613 E.01461
G1 X118.268 Y122.934 E.01466
G1 X118.561 Y123.222 E.01529
G1 X118.915 Y123.455 E.01581
G1 X119.292 Y123.61 E.01519
G1 X119.708 Y123.699 E.01584
G1 X119.976 Y123.714 E.01001
G1 X141.801 Y123.714 E.81287
G1 X141.932 Y123.682 E.00502
G1 X142.023 Y123.595 E.0047
G1 X142.062 Y123.459 E.00526
G1 X142.069 Y121.403 E.07656
G1 X142.131 Y121.029 E.01411
G1 X142.269 Y120.672 E.01428
G1 X142.395 Y120.469 E.0089
G1 X142.538 Y120.292 E.00846
G1 X142.889 Y120.001 E.01698
G1 X143.006 Y119.932 E.00505
G1 X143.312 Y119.803 E.0124
G1 X143.442 Y119.767 E.00503
G1 X143.856 Y119.714 E.01554
G1 X151.537 Y119.714 E.28609
G1 X151.768 Y119.757 E.00871
G1 X151.959 Y119.844 E.00783
G1 X152.111 Y119.973 E.00743
G1 X152.202 Y120.086 E.00541
G1 X152.303 Y120.303 E.00892
G1 X152.335 Y120.511 E.00782
G1 X152.335 Y124.488 E.14813
G1 X152.293 Y124.718 E.00872
G1 X152.206 Y124.909 E.00783
G1 X152.077 Y125.061 E.00743
G1 X151.964 Y125.152 E.00541
G1 X151.747 Y125.254 E.00892
G1 X151.539 Y125.286 E.00782
G1 X146.801 Y125.286 E.1765
G1 X146.674 Y125.27 E.00475
G1 X146.449 Y125.194 E.00885
G1 X146.212 Y125 E.01142
G1 X146.114 Y124.859 E.00639
G1 X146.025 Y124.633 E.00903
G1 X145.989 Y124.437 E.00745
G1 X145.944 Y124.358 E.00337
G1 X145.912 Y124.33 E.00157
G1 X145.802 Y124.298 E.00426
G1 X145.694 Y124.365 E.00472
G1 X145.651 Y124.443 E.00333
G1 X145.634 Y124.547 E.00394
G1 X145.612 Y125.754 E.04496
G1 X145.524 Y126.102 E.01337
G1 X145.346 Y126.462 E.01495
G1 X145.064 Y126.801 E.01642
G1 X144.716 Y127.054 E.01604
G1 X144.31 Y127.219 E.01633
G1 X143.909 Y127.283 E.01513
G1 X118.93 Y127.297 E.93036
G1 X118.804 Y127.36 E.00523
G1 X118.757 Y127.437 E.00337
M73 P52 R6
G1 X118.735 Y127.551 E.00433
G1 X118.714 Y130.751 E.1192
G1 X118.633 Y131.087 E.01286
G1 X118.489 Y131.397 E.01274
G1 X118.272 Y131.695 E.01371
G1 X118.009 Y131.935 E.01328
G1 X117.839 Y132.046 E.00753
G1 X117.589 Y132.165 E.01032
G1 X117.298 Y132.249 E.01129
G1 X117.038 Y132.282 E.00975
G1 X112.555 Y132.286 E.16699
G1 X112.298 Y132.265 E.00962
G1 X111.993 Y132.193 E.01167
G1 X111.702 Y132.068 E.01179
G1 X111.439 Y131.894 E.01176
G1 X111.219 Y131.686 E.01126
G1 X111.047 Y131.46 E.01058
G1 X110.904 Y131.185 E.01156
G1 X110.809 Y130.881 E.01187
G1 X110.764 Y130.493 E.01454
G1 X110.763 Y124.539 E.22175
G1 X110.737 Y124.421 E.00452
G1 X110.658 Y124.328 E.00454
G1 X110.544 Y124.291 E.00446
G1 X110.237 Y124.288 E.01144
G1 X110.128 Y124.314 E.00418
G1 X110.026 Y124.413 E.00529
G1 X109.939 Y124.751 E.013
G1 X109.871 Y124.891 E.00581
G1 X109.712 Y125.083 E.00928
G1 X109.601 Y125.166 E.00515
G1 X109.389 Y125.259 E.0086
G1 X109.198 Y125.286 E.00718
G1 X104.459 Y125.286 E.17653
G1 X104.332 Y125.27 E.00475
G1 X104.107 Y125.194 E.00885
G1 X103.889 Y125.027 E.01023
G1 X103.798 Y124.914 E.00541
G1 X103.695 Y124.694 E.00906
G1 X103.677 Y124.607 E.00331
G1 X103.665 Y120.512 E.1525
G1 X103.707 Y120.282 E.00871
G1 X103.794 Y120.091 E.00783
G1 X103.884 Y119.985 E.0052
M204 S6000
G1 X104.197 Y120.305 F30000
G1 F1200
M204 S500
G1 X104.334 Y120.196 E.00651
G1 X104.45 Y120.171 E.00442
G1 X112.351 Y120.171 E.29429
G1 X112.594 Y120.195 E.00908
G1 X112.834 Y120.264 E.0093
G1 X113.183 Y120.468 E.01506
G1 X113.426 Y120.724 E.01314
G1 X113.592 Y121.035 E.01314
G1 X113.671 Y121.375 E.013
G1 X113.679 Y128.284 E.25735
G1 X113.705 Y128.507 E.00837
G1 X113.763 Y128.67 E.00645
G1 X113.894 Y128.871 E.0089
G1 X114.024 Y128.993 E.00665
G1 X114.15 Y129.073 E.00559
G1 X114.351 Y129.147 E.00798
G1 X114.469 Y129.167 E.00446
G1 X115.054 Y129.164 E.02177
G1 X115.231 Y129.124 E.00675
G1 X115.369 Y129.063 E.00561
G1 X115.589 Y128.891 E.0104
G1 X115.742 Y128.66 E.01034
G1 X115.814 Y128.4 E.01005
G1 X115.821 Y121.5 E.257
G1 X115.85 Y121.389 E.00425
G1 X115.897 Y121.305 E.00361
G1 X116.034 Y121.196 E.00651
G1 X116.15 Y121.171 E.00442
G1 X116.95 Y121.171 E.0298
G1 X117.061 Y121.2 E.00426
G1 X117.145 Y121.247 E.00361
G1 X117.262 Y121.422 E.00785
G1 X117.321 Y121.97 E.02053
G1 X117.446 Y122.429 E.01773
G1 X117.65 Y122.857 E.01765
G1 X117.927 Y123.243 E.0177
G1 X118.271 Y123.577 E.01784
G1 X118.456 Y123.714 E.00859
G1 X118.726 Y123.874 E.01165
G1 X119.169 Y124.054 E.01785
G1 X119.637 Y124.152 E.0178
G1 X119.959 Y124.171 E.01201
G1 X141.854 Y124.171 E.8155
G1 X142.061 Y124.134 E.00785
G1 X142.255 Y124.031 E.00816
G1 X142.39 Y123.892 E.00723
G1 X142.489 Y123.692 E.00829
G1 X142.519 Y123.507 E.00699
G1 X142.521 Y121.469 E.07593
G1 X142.557 Y121.193 E.01034
G1 X142.658 Y120.91 E.01119
G1 X142.744 Y120.764 E.00633
G1 X142.901 Y120.57 E.00929
G1 X143.175 Y120.357 E.01292
G1 X143.498 Y120.221 E.01307
G1 X143.848 Y120.171 E.01315
G1 X151.55 Y120.171 E.28688
G1 X151.66 Y120.2 E.00426
G1 X151.745 Y120.247 E.00361
G1 X151.854 Y120.384 E.00651
G1 X151.878 Y120.5 E.00442
G1 X151.878 Y124.5 E.14898
G1 X151.85 Y124.611 E.00426
G1 X151.803 Y124.695 E.00361
G1 X151.666 Y124.804 E.00651
G1 X151.55 Y124.829 E.00442
G1 X146.792 Y124.829 E.17721
G1 X146.681 Y124.8 E.00426
G1 X146.597 Y124.753 E.00361
G1 X146.481 Y124.586 E.00757
G1 X146.449 Y124.366 E.00828
G1 X146.396 Y124.208 E.0062
G1 X146.325 Y124.093 E.00502
G1 X146.213 Y123.978 E.006
G1 X146.078 Y123.893 E.00593
G1 X145.925 Y123.842 E.00601
G1 X145.825 Y123.831 E.00376
G1 X145.671 Y123.854 E.00578
G1 X145.525 Y123.913 E.00588
G1 X145.397 Y124.006 E.00589
G1 X145.281 Y124.144 E.0067
G1 X145.215 Y124.283 E.00575
G1 X145.177 Y124.494 E.00799
G1 X145.167 Y125.647 E.04295
G1 X145.112 Y125.906 E.00986
G1 X144.992 Y126.172 E.01084
G1 X144.787 Y126.438 E.01254
G1 X144.539 Y126.633 E.01174
G1 X144.241 Y126.768 E.01218
G1 X143.919 Y126.826 E.01217
G1 X118.836 Y126.84 E.93424
G1 X118.663 Y126.896 E.00679
G1 X118.499 Y127.006 E.00737
G1 X118.374 Y127.16 E.00736
G1 X118.299 Y127.345 E.00743
G1 X118.279 Y127.516 E.00643
G1 X118.27 Y130.646 E.11657
G1 X118.216 Y130.9 E.00968
G1 X118.117 Y131.132 E.00939
G1 X117.962 Y131.359 E.01023
G1 X117.767 Y131.546 E.01009
G1 X117.581 Y131.668 E.00829
G1 X117.397 Y131.75 E.00752
G1 X117.175 Y131.809 E.00855
G1 X116.987 Y131.828 E.00702
G1 X112.55 Y131.829 E.16528
G1 X112.328 Y131.809 E.00827
G1 X112.1 Y131.749 E.00878
G1 X111.887 Y131.65 E.00878
G1 X111.694 Y131.515 E.00875
G1 X111.536 Y131.357 E.00832
G1 X111.414 Y131.187 E.00781
G1 X111.31 Y130.976 E.00876
G1 X111.246 Y130.747 E.00885
G1 X111.221 Y130.5 E.00923
G1 X111.22 Y124.465 E.22479
G1 X111.156 Y124.214 E.00966
G1 X111.083 Y124.093 E.00526
G1 X110.99 Y123.995 E.00502
G1 X110.82 Y123.888 E.00748
G1 X110.625 Y123.835 E.00753
G1 X110.177 Y123.831 E.01671
G1 X109.976 Y123.873 E.00764
G1 X109.803 Y123.968 E.00736
G1 X109.666 Y124.109 E.00733
G1 X109.568 Y124.306 E.00818
G1 X109.534 Y124.538 E.00873
G1 X109.452 Y124.706 E.00698
M73 P53 R6
G1 X109.316 Y124.808 E.00634
G1 X109.208 Y124.829 E.00408
G1 X104.45 Y124.829 E.17721
G1 X104.339 Y124.8 E.00426
G1 X104.255 Y124.753 E.00361
G1 X104.146 Y124.616 E.00651
G1 X104.122 Y124.5 E.00442
G1 X104.122 Y120.5 E.14898
G1 X104.15 Y120.389 E.00426
G1 X104.168 Y120.357 E.00137
; WIPE_START
G1 X104.334 Y120.196 E-.08797
G1 X104.45 Y120.171 E-.04514
G1 X106.1 Y120.171 E-.6269
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X113.722 Y120.559 Z.6 F30000
G1 X147.412 Y122.273 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.4995
G1 F1200
M204 S500
G1 X148.027 Y122.272 E.02289
; LINE_WIDTH: 0.49984
G1 X149.779 Y122.272 E.06522
G1 X149.779 Y122.5 E.00851
G1 X149.779 Y122.729 E.00851
G1 X148.027 Y122.729 E.06522
; LINE_WIDTH: 0.4995
G1 X147.915 Y122.729 E.00417
G1 X147.853 Y122.648 E.00379
G1 X147.457 Y122.312 E.01932
; WIPE_START
G1 X148.027 Y122.272 E-.21696
G1 X149.456 Y122.272 E-.54304
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X144.23 Y121.885 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.63635
G1 F1200
M204 S500
G2 X144.749 Y121.866 I.147 J-2.948 E.02514
; LINE_WIDTH: 0.597108
G1 X144.971 Y121.846 E.01008
; LINE_WIDTH: 0.557865
G1 X145.194 Y121.826 E.00936
; LINE_WIDTH: 0.518623
G1 X145.416 Y121.806 E.00865
; LINE_WIDTH: 0.48511
G1 X146.297 Y121.809 E.03176
; LINE_WIDTH: 0.49999
G2 X150.236 Y121.815 I2.306 J-233.423 E.14668
G1 X150.236 Y122.5 E.02554
G1 X150.236 Y123.186 E.02553
G1 X147.679 Y123.186 E.09522
G1 X147.504 Y122.943 E.01115
G1 X146.958 Y122.51 E.02598
G1 X146.607 Y122.341 E.01451
; LINE_WIDTH: 0.49947
G1 X146.237 Y122.243 E.01423
; LINE_WIDTH: 0.48511
G1 X145.925 Y122.212 E.01129
; LINE_WIDTH: 0.4868
G1 X145.342 Y122.251 E.02112
; LINE_WIDTH: 0.53665
G1 X145.109 Y122.319 E.00976
; LINE_WIDTH: 0.5865
G1 X144.877 Y122.387 E.01075
; LINE_WIDTH: 0.63635
G1 X144.644 Y122.455 E.01173
G1 X144.23 Y122.765 E.025
G1 X144.23 Y121.945 E.03965
; WIPE_START
G1 X144.749 Y121.866 E-.19947
G1 X144.971 Y121.846 E-.08479
G1 X145.194 Y121.826 E-.08479
G1 X145.416 Y121.806 E-.0848
G1 X146.222 Y121.809 E-.30616
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X138.635 Y122.646 Z.6 F30000
G1 X117.443 Y124.984 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.46481
G1 F1200
M204 S500
G1 X118.1 Y125.372 E.02624
G1 X117.892 Y125.463 E.00779
G1 X117.444 Y125.78 E.01888
G1 X117.443 Y125.044 E.02531
; WIPE_START
G1 X118.1 Y125.372 E-.27915
G1 X117.892 Y125.463 E-.08613
G1 X117.444 Y125.78 E-.20865
G1 X117.443 Y125.29 E-.18606
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.486 Y128.834 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.65794
G1 F1200
M204 S500
G1 X112.569 Y128.977 E.00828
; LINE_WIDTH: 0.618453
G1 X112.653 Y129.119 E.00775
; LINE_WIDTH: 0.578965
G1 X112.737 Y129.261 E.00722
; LINE_WIDTH: 0.539478
G1 X112.821 Y129.404 E.00669
; LINE_WIDTH: 0.49999
G1 X113.228 Y129.87 E.02305
G1 X113.792 Y130.199 E.02432
; LINE_WIDTH: 0.48785
G1 X114.002 Y130.254 E.00788
; LINE_WIDTH: 0.45508
G1 X114.556 Y130.314 E.01872
; LINE_WIDTH: 0.41827
G1 X115.123 Y130.307 E.01733
; LINE_WIDTH: 0.45913
G1 X115.403 Y130.262 E.00964
; LINE_WIDTH: 0.49999
G2 X115.869 Y130.135 I-.01 J-.954 E.01818
G1 X116.373 Y129.777 E.023
G1 X116.771 Y129.245 E.02475
; LINE_WIDTH: 0.5417
G1 X116.857 Y129.067 E.00801
; LINE_WIDTH: 0.58341
G1 X116.943 Y128.89 E.00868
; LINE_WIDTH: 0.62512
G1 X117.029 Y128.713 E.00935
G1 X117.05 Y128.91 E.00942
; LINE_WIDTH: 0.58341
G1 X117.07 Y129.108 E.00874
; LINE_WIDTH: 0.5417
G1 X117.091 Y129.305 E.00807
; LINE_WIDTH: 0.49999
G3 X117.067 Y130.554 I-14.379 J.35 E.04654
G1 X116.923 Y130.642 E.00631
G1 X115.741 Y130.642 E.04401
G1 X115.433 Y130.662 E.01148
; LINE_WIDTH: 0.45913
G1 X115.126 Y130.682 E.01045
; LINE_WIDTH: 0.41827
G1 X114.545 Y130.684 E.01776
; LINE_WIDTH: 0.45508
G1 X113.968 Y130.663 E.01939
; LINE_WIDTH: 0.49999
G2 X112.616 Y130.64 I-1.056 J22 E.05038
G1 X112.465 Y130.592 E.0059
G1 X112.407 Y130.446 E.00585
G1 X112.407 Y129.501 E.0352
; LINE_WIDTH: 0.539478
G1 X112.426 Y129.334 E.00679
; LINE_WIDTH: 0.578965
G1 X112.446 Y129.167 E.00733
; LINE_WIDTH: 0.618453
G1 X112.466 Y129.001 E.00787
; LINE_WIDTH: 0.65794
G1 X112.478 Y128.894 E.0054
; WIPE_START
G1 X112.569 Y128.977 E-.04673
G1 X112.653 Y129.119 E-.0628
G1 X112.737 Y129.261 E-.0628
G1 X112.821 Y129.404 E-.0628
G1 X113.228 Y129.87 E-.23515
G1 X113.792 Y130.199 E-.24812
G1 X113.898 Y130.227 E-.04161
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X116.657 Y130.129 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.51082
G1 F1200
M204 S500
G2 X116.686 Y130.18 I-.026 J.049 E.01079
; WIPE_START
G1 X116.657 Y130.23 E-.152
G1 X116.598 Y130.23 E-.15199
G1 X116.569 Y130.18 E-.152
G1 X116.598 Y130.129 E-.152
G1 X116.657 Y130.129 E-.15199
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.903 Y130.122 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.51838
G1 F1200
M204 S500
G2 X112.933 Y130.173 I-.026 J.049 E.01114
; WIPE_START
G1 X112.903 Y130.225 E-.15201
G1 X112.844 Y130.225 E-.152
G1 X112.814 Y130.173 E-.152
G1 X112.844 Y130.122 E-.15201
G1 X112.903 Y130.122 E-.15198
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X109.196 Y123.45 Z.6 F30000
G1 X108.557 Y122.3 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.4995
G1 F1200
M204 S500
G1 X108.316 Y122.49 E.01142
G2 X108.098 Y122.729 I1.417 J1.513 E.01204
G1 X107.997 Y122.729 E.00374
; LINE_WIDTH: 0.49984
G1 X106.221 Y122.729 E.06611
G1 X106.221 Y122.272 E.01702
G1 X107.997 Y122.272 E.06612
; LINE_WIDTH: 0.4995
G1 X108.577 Y122.273 E.02156
M204 S6000
G1 X108.834 Y122.656 F30000
; LINE_WIDTH: 0.49999
G1 F1200
M204 S500
G1 X108.653 Y122.799 E.00857
G1 X108.321 Y123.186 E.01899
G1 X105.764 Y123.186 E.09523
G1 X105.764 Y121.815 E.05107
G1 X109.515 Y121.816 E.13968
; LINE_WIDTH: 0.49968
G1 X110.186 Y121.795 E.02501
; LINE_WIDTH: 0.48816
G1 X110.749 Y121.811 E.02042
; LINE_WIDTH: 0.51893
G1 X111.311 Y121.827 E.02183
; LINE_WIDTH: 0.557775
G1 X111.649 Y121.846 E.01421
; LINE_WIDTH: 0.59662
G1 X111.988 Y121.866 E.01528
G1 X111.983 Y122.627 E.03436
G1 X111.622 Y122.405 E.01909
G1 X111.422 Y122.345 E.00943
; LINE_WIDTH: 0.557775
G1 X111.222 Y122.285 E.00877
; LINE_WIDTH: 0.51893
G1 X111.026 Y122.256 E.0077
; LINE_WIDTH: 0.4938
G1 X110.829 Y122.227 E.00729
; LINE_WIDTH: 0.46867
G1 X110.14 Y122.209 E.02393
; LINE_WIDTH: 0.49968
G1 X109.563 Y122.284 E.02164
; LINE_WIDTH: 0.49999
G2 X108.947 Y122.575 I.754 J2.397 E.02544
G1 X108.882 Y122.621 E.00298
M204 S6000
G1 X109.1 Y123.029 F30000
G1 F1200
M204 S500
G1 X108.84 Y123.271 E.01323
G2 X108.571 Y123.643 I1.734 J1.539 E.01712
G1 X105.307 Y123.643 E.12156
G1 X105.307 Y121.357 E.08513
G1 X112.261 Y121.36 E.259
G1 X112.431 Y121.399 E.00649
G1 X112.493 Y121.57 E.0068
G1 X112.493 Y123.698 E.07924
; LINE_WIDTH: 0.534507
G1 X112.476 Y123.891 E.00778
; LINE_WIDTH: 0.569024
G1 X112.458 Y124.085 E.00832
; LINE_WIDTH: 0.60354
G1 X112.441 Y124.278 E.00887
G1 X112.383 Y124.113 E.00797
; LINE_WIDTH: 0.55853
G1 X112.326 Y123.949 E.00733
; LINE_WIDTH: 0.51352
G1 X112.082 Y123.458 E.02102
; LINE_WIDTH: 0.49999
G1 X111.638 Y123.004 E.02364
G2 X110.814 Y122.668 I-1.288 J1.985 E.03336
G1 X110.163 Y122.645 E.02424
G1 X109.658 Y122.731 E.01911
G1 X109.165 Y122.969 E.02038
G1 X109.144 Y122.988 E.00105
; WIPE_START
G1 X108.84 Y123.271 E-.15783
G1 X108.571 Y123.643 E-.17441
G1 X107.445 Y123.643 E-.42776
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.073 Y123.904 Z.6 F30000
G1 X117.002 Y123.97 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
M204 S500
G1 X117.077 Y124.062 E.00441
G1 X117.66 Y124.601 E.0296
G1 X118.316 Y124.986 E.02831
G1 X118.892 Y125.206 E.02295
G1 X119.166 Y125.248 E.01033
; LINE_WIDTH: 0.46838
G1 X119.44 Y125.289 E.00961
; LINE_WIDTH: 0.43677
G1 X119.948 Y125.315 E.01632
; LINE_WIDTH: 0.41648
G1 X141.884 Y125.314 E.66775
; LINE_WIDTH: 0.456985
G1 X142.158 Y125.285 E.00928
; LINE_WIDTH: 0.49999
G2 X142.655 Y125.165 I.041 J-.922 E.01931
G1 X143.144 Y124.828 E.02212
; LINE_WIDTH: 0.50152
G1 X143.436 Y124.45 E.01784
; LINE_WIDTH: 0.50577
G1 X143.551 Y124.231 E.00933
G1 X143.691 Y123.689 E.0211
; LINE_WIDTH: 0.49999
G3 X143.732 Y121.443 I171.141 J1.99 E.0837
G1 X143.878 Y121.36 E.00625
G1 X150.693 Y121.357 E.25382
G1 X150.693 Y122.5 E.04257
G1 X150.693 Y123.643 E.04255
G1 X147.432 Y123.643 E.12146
G1 X147.155 Y123.238 E.01826
G1 X146.692 Y122.881 E.02178
G1 X146.481 Y122.78 E.0087
G1 X145.925 Y122.649 E.02128
G1 X145.477 Y122.687 E.01676
G1 X145.244 Y122.751 E.00898
G1 X144.694 Y123.05 E.02333
M73 P54 R6
G1 X144.337 Y123.432 E.01949
G1 X144.083 Y123.955 E.02163
; LINE_WIDTH: 0.50516
G1 X143.989 Y124.461 E.01939
G1 X143.989 Y125.056 E.02243
; LINE_WIDTH: 0.49999
G1 X143.958 Y125.567 E.01907
G1 X143.831 Y125.641 E.00546
G1 X142.472 Y125.642 E.05064
G1 X142.178 Y125.663 E.01097
; LINE_WIDTH: 0.456985
G1 X141.884 Y125.685 E.00994
; LINE_WIDTH: 0.41648
G1 X119.948 Y125.689 E.66775
; LINE_WIDTH: 0.43677
G1 X119.4 Y125.679 E.0176
; LINE_WIDTH: 0.46838
G1 X119.12 Y125.663 E.00972
; LINE_WIDTH: 0.49999
G1 X118.84 Y125.647 E.01044
G1 X118.268 Y125.78 E.02184
G1 X118.033 Y125.895 E.00977
G1 X117.551 Y126.286 E.0231
G1 X117.251 Y126.766 E.02108
; LINE_WIDTH: 0.548135
G1 X117.153 Y127.042 E.01205
; LINE_WIDTH: 0.59628
G1 X117.054 Y127.317 E.0132
G1 X117.03 Y127.023 E.0133
; LINE_WIDTH: 0.548135
G1 X117.005 Y126.729 E.01214
; LINE_WIDTH: 0.49999
G1 X117.002 Y124.03 E.10053
; WIPE_START
G1 X117.077 Y124.062 E-.03094
G1 X117.66 Y124.601 E-.30196
G1 X118.316 Y124.986 E-.28888
G1 X118.656 Y125.116 E-.13822
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.137 Y123.806 Z.6 F30000
G1 X109.277 Y123.483 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1200
M204 S500
G1 X109.048 Y123.721 E.0123
G1 X108.874 Y124.1 E.01554
G1 X104.85 Y124.1 E.14987
G1 X104.85 Y120.9 E.11918
G1 X111.711 Y120.903 E.25554
G1 X112.478 Y120.929 E.02857
G1 X112.708 Y121.035 E.00946
G1 X112.901 Y121.274 E.01144
G1 X112.95 Y121.527 E.00958
G1 X112.95 Y128.306 E.25248
G1 X113.013 Y128.741 E.0164
G1 X113.231 Y129.201 E.01893
G1 X113.556 Y129.551 E.0178
G1 X114.003 Y129.801 E.0191
G1 X114.546 Y129.9 E.02053
G1 X115.116 Y129.891 E.02125
G1 X115.563 Y129.776 E.0172
G1 X115.969 Y129.531 E.01763
G1 X116.307 Y129.143 E.01917
G1 X116.505 Y128.665 E.01928
G1 X116.55 Y128.306 E.01349
G1 X116.544 Y123.907 E.16383
; LINE_WIDTH: 0.50514
G2 X116.396 Y122.444 I-28.301 J2.129 E.0554
; LINE_WIDTH: 0.49147
G1 X116.427 Y121.857 E.02149
G1 X116.643 Y121.86 E.00787
G1 X116.734 Y122.016 E.00661
; LINE_WIDTH: 0.50028
G2 X117.062 Y123.208 I22.251 J-5.475 E.04607
; LINE_WIDTH: 0.49999
G1 X117.393 Y123.731 E.02307
G1 X117.905 Y124.215 E.02621
G1 X118.488 Y124.562 E.0253
G1 X118.978 Y124.757 E.01962
G2 X119.948 Y124.9 I.981 J-3.297 E.03665
G1 X141.884 Y124.9 E.81703
G1 X142.337 Y124.809 E.01719
G1 X142.819 Y124.504 E.02125
G1 X143.111 Y124.097 E.01866
G1 X143.248 Y123.536 E.02151
G3 X143.267 Y121.41 I44.556 J-.668 E.07918
G1 X143.385 Y121.125 E.01149
G1 X143.559 Y120.98 E.00845
G1 X143.81 Y120.903 E.00976
G1 X151.15 Y120.9 E.27338
G1 X151.15 Y122.5 E.0596
G1 X151.15 Y124.1 E.05958
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X147.12 Y124.1 E.15011
G1 X147.068 Y123.928 E.00667
G1 X146.819 Y123.55 E.01686
G1 X146.426 Y123.253 E.01835
G1 X145.988 Y123.115 E.01711
G1 X145.518 Y123.142 E.01753
G1 X145.077 Y123.337 E.01795
G1 X144.78 Y123.597 E.01474
G1 X144.539 Y124.011 E.01783
G1 X144.449 Y124.462 E.01714
G1 X144.445 Y125.441 E.03643
G3 X143.875 Y126.098 I-.665 J0 E.03534
G1 X118.846 Y126.104 E.93222
G1 X118.388 Y126.221 E.01759
G1 X117.975 Y126.499 E.01855
G1 X117.721 Y126.833 E.01563
G1 X117.568 Y127.294 E.01811
G1 X117.55 Y127.494 E.00746
G1 X117.547 Y130.449 E.11007
G1 X117.48 Y130.77 E.01221
G1 X117.324 Y130.963 E.00924
G3 X116.956 Y131.1 I-.579 J-.991 E.01469
G1 X112.616 Y131.097 E.16166
G1 X112.263 Y131.021 E.01344
G3 X111.95 Y130.479 I.453 J-.623 E.02399
G1 X111.948 Y124.43 E.22531
G1 X111.872 Y124.045 E.01464
G1 X111.681 Y123.679 E.01537
G1 X111.33 Y123.341 E.01816
G1 X110.798 Y123.125 E.02139
G1 X110.147 Y123.102 E.02424
G1 X109.752 Y123.179 E.015
G1 X109.386 Y123.369 E.01537
G1 X109.319 Y123.439 E.00362
; WIPE_START
G1 X109.048 Y123.721 E-.14832
G1 X108.874 Y124.1 E-.15855
G1 X107.682 Y124.1 E-.45313
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.311 Y124.313 Z.6 F30000
G1 X143.535 Y125.1 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.55782
G1 F1200
M204 S500
G2 X143.567 Y125.155 I-.028 J.053 E.01307
; WIPE_START
G1 X143.535 Y125.211 E-.152
G1 X143.471 Y125.211 E-.152
G1 X143.439 Y125.155 E-.152
G1 X143.471 Y125.1 E-.152
M73 P55 R6
G1 X143.535 Y125.1 E-.152
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.973 Y126.13 Z.6 F30000
G1 X117.029 Y128.713 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.62512
G1 F1200
M204 S500
G1 X117.05 Y127.493 E.05786
; LINE_WIDTH: 0.59628
G1 X117.054 Y127.317 E.00794
; WIPE_START
G1 X117.05 Y127.493 E-.0959
G1 X117.029 Y128.713 E-.6641
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.441 Y124.278 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.60354
G1 F1200
M204 S500
G1 X112.449 Y124.43 E.00696
; LINE_WIDTH: 0.58764
G1 X112.45 Y128.306 E.17203
; LINE_WIDTH: 0.62075
G1 X112.467 Y128.561 E.01205
; LINE_WIDTH: 0.655
G1 X112.484 Y128.816 E.01276
; LINE_WIDTH: 0.65794
G1 X112.486 Y128.834 E.0009
; CHANGE_LAYER
; Z_HEIGHT: 0.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1200
G1 X112.484 Y128.816 E-.00685
G1 X112.467 Y128.561 E-.09723
G1 X112.45 Y128.306 E-.09722
G1 X112.449 Y126.835 E-.55871
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/45
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
G3 Z.6 I.184 J1.203 P1  F30000
G1 X144.314 Y121.966 Z.6
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.446282
G1 F3600
G1 X144.925 Y121.966 E.01257
; LINE_WIDTH: 0.495277
G1 X145.197 Y121.99 E.00626
; LINE_WIDTH: 0.544272
G1 X145.469 Y122.015 E.00692
G1 X145.296 Y122.08 E.00467
; LINE_WIDTH: 0.498492
G1 X144.965 Y122.218 E.0083
; LINE_WIDTH: 0.472387
G1 X144.633 Y122.356 E.00784
; LINE_WIDTH: 0.446282
G1 X144.314 Y122.589 E.00813
G1 X144.314 Y122.026 E.01158
; WIPE_START
G1 X144.925 Y121.966 E-.23336
G1 X145.197 Y121.99 E-.1037
G1 X145.469 Y122.015 E-.1037
G1 X145.296 Y122.08 E-.07002
G1 X144.965 Y122.218 E-.1365
G1 X144.691 Y122.332 E-.11273
; WIPE_END
G1 E-.04 F1800
G1 X142.64 Y125.411 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.537432
G1 F3600
G1 X142.815 Y125.339 E.00473
G1 X143.322 Y124.977 E.0156
G1 X143.612 Y124.603 E.01184
; LINE_WIDTH: 0.538672
G1 X143.772 Y124.293 E.00875
G1 X143.762 Y124.652 E.00903
; LINE_WIDTH: 0.537432
G1 X143.761 Y125.411 E.01898
G1 X142.7 Y125.411 E.02655
; WIPE_START
G1 X142.815 Y125.339 E-.05158
G1 X143.322 Y124.977 E-.23691
G1 X143.612 Y124.603 E-.17991
G1 X143.772 Y124.293 E-.1326
G1 X143.762 Y124.652 E-.13678
G1 X143.762 Y124.711 E-.02222
; WIPE_END
G1 E-.04 F1800
G1 X146.122 Y122.015 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.543632
G1 F3600
G1 X146.377 Y121.991 E.00648
; LINE_WIDTH: 0.496812
G1 X146.631 Y121.968 E.00589
; LINE_WIDTH: 0.449992
G1 X150.277 Y121.968 E.07563
G1 X150.277 Y122.5 E.01104
G1 X150.277 Y123.032 E.01104
G1 X147.761 Y123.032 E.05219
G1 X147.639 Y122.864 E.00432
G2 X146.894 Y122.299 I-1.951 J1.8 E.01949
; LINE_WIDTH: 0.496812
G1 X146.508 Y122.157 E.00948
; LINE_WIDTH: 0.543632
G1 X146.178 Y122.035 E.0089
; WIPE_START
G1 X146.377 Y121.991 E-.07724
G1 X146.631 Y121.968 E-.09719
G1 X148.172 Y121.968 E-.58557
; WIPE_END
G1 E-.04 F1800
G1 X143.914 Y121.543 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X150.702 Y121.543 E.14078
G1 X150.702 Y122.5 E.01984
G1 X150.702 Y123.457 E.01984
G1 X147.533 Y123.457 E.06573
G1 X147.329 Y123.154 E.00756
G2 X145.427 Y122.509 I-1.526 J1.372 E.04354
G1 X144.852 Y122.717 E.01269
G1 X144.476 Y122.997 E.00972
G1 X144.221 Y123.279 E.00787
; LINE_WIDTH: 0.492262
G1 X144.073 Y123.489 E.00587
; LINE_WIDTH: 0.534532
G1 X143.924 Y123.699 E.0064
G1 X143.908 Y123.443 E.0064
; LINE_WIDTH: 0.492262
G1 X143.891 Y123.186 E.00586
; LINE_WIDTH: 0.449992
G3 X143.912 Y121.603 I22.754 J-.5 E.03284
; WIPE_START
G1 X145.911 Y121.586 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.122 Y122.015 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.544272
G1 F3600
G1 X145.469 Y122.015 E.01657
; WIPE_START
G1 X146.122 Y122.015 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.516 Y122.653 Z.72 F30000
G1 X117.193 Y124.442 Z.72
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.571 Y124.766 E.01033
G1 X118.225 Y125.151 E.01573
G1 X118.867 Y125.392 E.01422
G1 X119.386 Y125.481 E.01092
G1 X118.86 Y125.461 E.01092
G1 X118.574 Y125.501 E.00599
G1 X118.001 Y125.69 E.01251
G1 X117.548 Y126.026 E.01169
G1 X117.193 Y126.481 E.01198
G1 X117.193 Y124.502 E.04106
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522332
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.15201
G1 X117.592 Y125.363 E-.15199
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.746 Y130.423 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.513902
G1 F3600
G1 X116.006 Y130.308 E.00678
G1 X116.462 Y130 E.01313
G1 X116.872 Y129.494 E.01555
G3 X116.86 Y130.424 I-37.346 J-.009 E.0222
G1 X115.806 Y130.423 E.02516
; WIPE_START
G1 X116.006 Y130.308 E-.08764
G1 X116.462 Y130 E-.20902
G1 X116.872 Y129.494 E-.24757
G1 X116.865 Y130.062 E-.21577
; WIPE_END
G1 E-.04 F1800
G1 X112.632 Y129.512 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.520732
G1 F3600
G1 X113.047 Y129.987 E.01528
G1 X113.473 Y130.301 E.01281
G1 X113.806 Y130.432 E.00867
; LINE_WIDTH: 0.491422
G1 X113.951 Y130.453 E.00332
; LINE_WIDTH: 0.451877
G1 X114.095 Y130.473 E.00304
; LINE_WIDTH: 0.448466
G1 X113.88 Y130.454 E.00447
; LINE_WIDTH: 0.484599
G1 X113.664 Y130.436 E.00486
; LINE_WIDTH: 0.520732
G1 X113.448 Y130.418 E.00524
G1 X112.632 Y130.417 E.01975
G1 X112.632 Y129.572 E.02047
; WIPE_START
G1 X113.047 Y129.987 E-.22324
G1 X113.473 Y130.301 E-.20115
G1 X113.806 Y130.432 E-.1361
G1 X113.951 Y130.453 E-.05546
G1 X114.095 Y130.473 E-.05546
G1 X113.88 Y130.454 E-.08224
G1 X113.863 Y130.453 E-.00635
; WIPE_END
G1 E-.04 F1800
G1 X111.461 Y123.209 Z.72 F30000
G1 X111.07 Y122.03 Z.72
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.575372
G1 F3600
G1 X111.17 Y122.009 E.00274
; LINE_WIDTH: 0.532856
G1 X111.27 Y121.988 E.00253
; LINE_WIDTH: 0.490339
G1 X111.369 Y121.967 E.00232
; LINE_WIDTH: 0.447822
G1 X111.904 Y121.946 E.01104
; LINE_WIDTH: 0.406352
G1 X111.904 Y122.485 E.01004
G1 X111.625 Y122.305 E.00618
; LINE_WIDTH: 0.448607
G1 X111.486 Y122.236 E.0032
; LINE_WIDTH: 0.490862
G1 X111.348 Y122.168 E.00352
; LINE_WIDTH: 0.533117
G1 X111.209 Y122.099 E.00384
; LINE_WIDTH: 0.575372
G1 X111.124 Y122.057 E.00255
; WIPE_START
G1 X111.17 Y122.009 E-.0252
G1 X111.27 Y121.988 E-.03875
G1 X111.369 Y121.967 E-.03875
G1 X111.904 Y121.946 E-.20337
G1 X111.904 Y122.485 E-.20495
G1 X111.625 Y122.305 E-.12625
G1 X111.486 Y122.236 E-.05882
G1 X111.348 Y122.168 E-.05882
G1 X111.336 Y122.162 E-.00511
; WIPE_END
G1 E-.04 F1800
G1 X108.445 Y122.809 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.238 Y123.032 E.00631
G1 X105.723 Y123.032 E.05218
G1 X105.723 Y121.968 E.02208
G1 X109.388 Y121.968 E.07602
; LINE_WIDTH: 0.494432
G1 X109.638 Y121.99 E.00577
; LINE_WIDTH: 0.538872
G1 X109.889 Y122.012 E.00631
G1 X109.651 Y122.094 E.0063
; LINE_WIDTH: 0.494432
G1 X109.414 Y122.175 E.00576
; LINE_WIDTH: 0.449992
G1 X108.911 Y122.414 E.01155
G1 X108.597 Y122.646 E.00809
G1 X108.486 Y122.765 E.00338
G1 X108.804 Y123.041 F30000
G1 F3600
G1 X108.689 Y123.134 E.00307
G1 X108.473 Y123.457 E.00806
G1 X105.298 Y123.457 E.06584
G1 X105.298 Y121.543 E.03968
G1 X109.714 Y121.544 E.09159
G3 X112.307 Y121.56 I1 J47.972 E.05379
G1 X112.307 Y123.487 E.03998
G2 X111.23 Y122.579 I-1.789 J1.029 E.0298
G1 X110.68 Y122.464 E.01165
G1 X110.148 Y122.458 E.01104
G1 X109.519 Y122.586 E.01331
G1 X109.163 Y122.755 E.00818
G1 X108.851 Y123.004 E.00826
; WIPE_START
G1 X108.689 Y123.134 E-.07909
G1 X108.473 Y123.457 E-.14765
G1 X107.069 Y123.457 E-.53326
; WIPE_END
G1 E-.04 F1800
G1 X111.07 Y122.03 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.575372
G1 F3600
G1 X110.878 Y122.017 E.00519
; LINE_WIDTH: 0.548542
G1 X110.685 Y122.004 E.00493
; LINE_WIDTH: 0.538872
G1 X109.889 Y122.012 E.01997
; WIPE_START
G1 X110.685 Y122.004 E-.51187
G1 X110.878 Y122.017 E-.12407
G1 X111.07 Y122.03 E-.12406
; WIPE_END
G1 E-.04 F1800
G1 X109.079 Y123.358 Z.72 F30000
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X109.006 Y123.415 E.00191
G1 X108.722 Y123.881 E.01132
G1 X104.874 Y123.881 E.07982
G1 X104.874 Y121.119 E.05728
G1 X112.246 Y121.119 E.15291
G1 X112.493 Y121.158 E.00519
G1 X112.638 Y121.276 E.00387
G1 X112.731 Y121.518 E.00538
G1 X112.731 Y123.182 E.03452
; LINE_WIDTH: 0.464022
G1 X112.724 Y123.913 E.01566
; LINE_WIDTH: 0.491777
G1 X112.71 Y124.176 E.006
; LINE_WIDTH: 0.519532
G1 X112.696 Y124.439 E.00636
G1 X112.696 Y126.439 E.04828
; LINE_WIDTH: 0.518632
G1 X112.697 Y128.301 E.04487
; LINE_WIDTH: 0.517802
G1 X112.697 Y128.301 E.00001
; LINE_WIDTH: 0.556502
G1 X112.751 Y128.803 E.01309
G1 X112.851 Y128.976 E.00518
; LINE_WIDTH: 0.520999
G1 X112.951 Y129.148 E.00483
; LINE_WIDTH: 0.485496
G1 X113.051 Y129.321 E.00448
; LINE_WIDTH: 0.449992
G1 X113.493 Y129.773 E.01312
G1 X113.986 Y130.025 E.01147
G1 X114.559 Y130.119 E.01206
G1 X115.257 Y130.089 E.01449
G1 X115.763 Y129.923 E.01104
G1 X116.153 Y129.665 E.0097
G1 X116.483 Y129.268 E.01071
; LINE_WIDTH: 0.493887
G1 X116.63 Y128.965 E.0077
; LINE_WIDTH: 0.537782
G1 X116.777 Y128.663 E.00842
G1 X116.803 Y128.301 E.00909
; LINE_WIDTH: 0.526942
G2 X116.788 Y126.963 I-11.695 J-.539 E.03281
; LINE_WIDTH: 0.488467
G1 X116.769 Y126.598 E.00827
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.07026
G1 X116.868 Y123.393 E.00429
G1 X117.312 Y123.975 E.01518
G1 X117.798 Y124.407 E.0135
G1 X118.385 Y124.758 E.01417
G1 X118.945 Y124.975 E.01247
G2 X119.95 Y125.119 I1.027 J-3.583 E.02112
G1 X141.878 Y125.119 E.45483
G1 X142.354 Y125.032 E.01003
G1 X142.56 Y124.947 E.00462
G1 X142.987 Y124.651 E.01078
G1 X143.296 Y124.225 E.01091
G1 X143.433 Y123.798 E.00931
G1 X143.467 Y123.53 E.0056
G1 X143.467 Y121.606 E.03992
G1 X143.508 Y121.352 E.00532
G1 X143.615 Y121.219 E.00356
G1 X143.866 Y121.119 E.0056
G1 X151.126 Y121.119 E.15058
G1 X151.126 Y122.5 E.02864
G1 X151.126 Y123.881 E.02864
G1 X149.126 Y123.881 E.04148
G3 X147.283 Y123.88 I-.549 J-557.505 E.03823
G1 X147.108 Y123.566 E.00745
G1 X146.733 Y123.187 E.01107
G1 X146.262 Y122.954 E.01089
G1 X145.766 Y122.889 E.01036
G1 X145.551 Y122.914 E.0045
G1 X145.072 Y123.08 E.01052
G1 X144.733 Y123.334 E.00878
G1 X144.583 Y123.5 E.00463
G1 X144.348 Y123.894 E.00952
G1 X144.231 Y124.439 E.01157
G3 X144.201 Y125.619 I-13.592 J.25 E.02449
G1 X144.103 Y125.762 E.00359
G1 X143.87 Y125.879 E.0054
G1 X118.855 Y125.885 E.51888
G1 X118.319 Y126.016 E.01144
G1 X118.113 Y126.122 E.0048
G1 X117.668 Y126.52 E.0124
; LINE_WIDTH: 0.452092
G1 X117.415 Y127.003 E.01136
; LINE_WIDTH: 0.485362
G1 X117.356 Y127.251 E.00573
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.498 E.00614
; LINE_WIDTH: 0.537782
G1 X117.285 Y128.708 E.03028
G1 X117.307 Y128.97 E.00658
; LINE_WIDTH: 0.493887
G1 X117.329 Y129.232 E.00602
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.413 E.02449
G1 X117.276 Y130.677 E.00559
G1 X117.168 Y130.793 E.00328
G1 X116.911 Y130.88 E.00563
G1 X112.911 Y130.877 E.08297
G3 X112.4 Y130.841 I-.148 J-1.537 E.01067
G1 X112.264 Y130.728 E.00367
G1 X112.173 Y130.499 E.00511
G1 X112.172 Y129.541 E.01988
; LINE_WIDTH: 0.485199
G1 X112.189 Y129.307 E.00527
; LINE_WIDTH: 0.520406
G1 X112.207 Y129.073 E.00567
; LINE_WIDTH: 0.555612
G2 X112.205 Y128.301 I-3.488 J-.377 E.02003
; LINE_WIDTH: 0.518692
M73 P56 R6
G1 X112.203 Y126.301 E.0482
; LINE_WIDTH: 0.519532
G1 X112.202 Y124.439 E.04495
G1 X112.145 Y124.212 E.00567
; LINE_WIDTH: 0.491777
G1 X112.087 Y123.984 E.00535
; LINE_WIDTH: 0.464022
G1 X111.785 Y123.463 E.0129
; LINE_WIDTH: 0.449992
G2 X111.118 Y122.988 I-1.551 J1.47 E.01708
G1 X110.676 Y122.888 E.00941
G1 X110.148 Y122.883 E.01095
G1 X109.624 Y122.997 E.01112
G1 X109.415 Y123.097 E.00482
G1 X109.126 Y123.321 E.00758
M204 S250
G1 X109.416 Y123.607 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.344 Y123.658 E.00171
G1 X109.091 Y124.042 E.00886
G1 X109.032 Y124.29 E.00492
G1 X104.982 Y124.29 E.07806
G1 F2250
G1 X104.932 Y124.29 E.00096
G1 F2700
G1 X104.883 Y124.29 E.00096
G1 F3150
G1 X104.833 Y124.29 E.00096
G1 F3600
G1 X104.783 Y124.29 E.00096
G1 F3200.846
G1 X104.734 Y124.29 E.00096
G1 F2689.471
G1 X104.684 Y124.29 E.00096
G1 F2222.487
G1 X104.634 Y124.29 E.00096
G1 F1800
G1 X104.584 Y124.29 E.00096
G1 F1500
G1 X104.535 Y124.29 E.00096
G1 F1200
G1 X104.485 Y124.29 E.00096
G1 F900
G1 X104.465 Y124.29 E.00039
G1 X104.465 Y120.71 E.06901
G1 X104.536 Y120.71 E.00137
G1 F1200
G1 X104.711 Y120.71 E.00338
G1 F1500
G1 X104.887 Y120.71 E.00338
G1 F1800
G1 X105.062 Y120.71 E.00338
G1 F3488.157
G1 X105.237 Y120.71 E.00338
G1 F3600
G1 X105.413 Y120.71 E.00338
G1 X105.588 Y120.71 E.00338
G1 X105.763 Y120.71 E.00338
G1 F3150
G1 X105.939 Y120.71 E.00338
G1 F2700
G1 X106.114 Y120.71 E.00338
G1 F2250
G1 X106.289 Y120.71 E.00338
G1 F1800
G1 X112.246 Y120.71 E.11482
G1 X112.647 Y120.772 E.00782
G1 X112.881 Y120.919 E.00534
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.206 Y128.72 E.00819
G1 X113.412 Y129.129 E.00881
G1 X113.77 Y129.471 E.00954
G1 X114.151 Y129.65 E.00812
G1 X114.549 Y129.71 E.00777
G1 X115.1 Y129.701 E.01061
G1 X115.491 Y129.6 E.00779
G1 X115.847 Y129.385 E.00802
G1 X116.165 Y129.01 E.00948
G1 X116.322 Y128.619 E.00813
G1 X116.36 Y128.301 E.00617
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430582
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437832
G1 X116.786 Y122.088 E.00753
G1 X116.948 Y122.634 E.01148
; LINE_WIDTH: 0.419992
G1 X117.197 Y123.149 E.01104
G1 X117.589 Y123.673 E.0126
G1 X118.016 Y124.061 E.01114
G1 X118.538 Y124.379 E.01177
G2 X119.95 Y124.71 I1.523 J-3.314 E.02814
G1 X141.878 Y124.71 E.42267
G1 X142.269 Y124.631 E.00769
G1 X142.659 Y124.394 E.0088
G1 X142.938 Y124.02 E.00898
G1 X143.058 Y123.53 E.00972
G1 X143.058 Y121.606 E.03709
G1 X143.12 Y121.202 E.00788
G1 X143.251 Y120.987 E.00484
G1 X143.467 Y120.812 E.00536
G1 X143.854 Y120.71 E.00771
G1 X150.002 Y120.71 E.11849
G1 F2250
G1 X150.149 Y120.71 E.00284
G1 F2700
G1 X150.296 Y120.71 E.00284
G1 F3150
G1 X150.444 Y120.71 E.00284
G1 F3600
G1 X150.591 Y120.71 E.00284
G1 X150.738 Y120.71 E.00284
G1 X150.886 Y120.71 E.00284
G1 F3181.874
G1 X151.033 Y120.71 E.00284
G1 F1800
G1 X151.181 Y120.71 E.00284
G1 F1500
G1 X151.328 Y120.71 E.00284
G1 F1200
G1 X151.475 Y120.71 E.00284
G1 F900
G1 X151.535 Y120.71 E.00115
G1 X151.535 Y122.5 E.0345
G1 X151.535 Y124.29 E.0345
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.464 Y124.29 E.00137
G1 F1200
G1 X151.289 Y124.29 E.00338
G1 F1500
G1 X151.113 Y124.29 E.00338
G1 F1800
G1 X150.938 Y124.29 E.00338
G1 F3488.157
G1 X150.763 Y124.29 E.00338
G1 F3600
G1 X150.587 Y124.29 E.00338
G1 X150.412 Y124.29 E.00338
G1 X150.237 Y124.29 E.00338
G1 F3150
G1 X150.061 Y124.29 E.00338
G1 F2700
G1 X149.886 Y124.29 E.00338
G1 F2250
G1 X149.711 Y124.29 E.00338
G1 F1800
G1 X146.971 Y124.29 E.05281
G1 X146.946 Y124.141 E.00292
G1 X146.75 Y123.764 E.00819
G1 X146.461 Y123.493 E.00762
G1 X146.103 Y123.331 E.00757
G1 X145.741 Y123.298 E.00702
G1 X145.328 Y123.41 E.00824
G1 X144.981 Y123.66 E.00823
G1 X144.73 Y124.044 E.00885
G1 X144.64 Y124.44 E.00782
G3 X144.594 Y125.752 I-8.947 J.344 E.02533
G1 X144.475 Y125.976 E.0049
G1 X144.267 Y126.166 E.00541
G1 X143.895 Y126.288 E.00756
G1 X118.86 Y126.294 E.48255
G1 X118.433 Y126.409 E.00853
G1 X118.063 Y126.682 E.00886
G1 X117.843 Y127.016 E.00771
G1 X117.74 Y127.499 E.00952
G1 X117.736 Y130.441 E.0567
G1 X117.649 Y130.862 E.00829
G1 X117.499 Y131.064 E.00485
G1 X117.27 Y131.218 E.00532
G1 X116.957 Y131.29 E.00619
G1 X112.957 Y131.286 E.0771
G3 X112.233 Y131.221 I-.171 J-2.136 E.01408
G1 X112.018 Y131.08 E.00495
G1 X111.851 Y130.861 E.00531
G1 X111.764 Y130.557 E.00609
G1 X111.758 Y124.439 E.11792
G1 X111.681 Y124.076 E.00716
G1 X111.442 Y123.687 E.0088
G1 X111.071 Y123.411 E.00891
G1 X110.672 Y123.297 E.008
G1 X110.15 Y123.292 E.01006
G1 X109.726 Y123.394 E.00841
G1 X109.466 Y123.573 E.00609
; WIPE_START
M204 S10000
G1 X109.344 Y123.658 E-.05642
G1 X109.091 Y124.042 E-.17464
G1 X109.032 Y124.29 E-.09696
G1 X107.895 Y124.29 E-.43197
; WIPE_END
G1 E-.04
G1 X115.526 Y124.165 Z.72 F30000
G1 X143.924 Y123.699 Z.72
G1 Z.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.538672
G1 F3600
G1 X143.772 Y124.293 E.01536
; WIPE_START
G1 X143.924 Y123.699 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.311 Y124.252 Z.72 F30000
G1 X119.386 Y125.481 Z.72
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.409732
G1 F3600
G1 X119.892 Y125.501 E.00951
; LINE_WIDTH: 0.368532
G1 X119.95 Y125.502 E.00098
; LINE_WIDTH: 0.366772
G1 X121.878 Y125.502 E.03215
; LINE_WIDTH: 0.366362
G1 X123.878 Y125.501 E.03331
; LINE_WIDTH: 0.365952
G1 X125.878 Y125.501 E.03327
; LINE_WIDTH: 0.365532
G1 X127.878 Y125.501 E.03323
; LINE_WIDTH: 0.365122
G1 X129.878 Y125.501 E.03319
; LINE_WIDTH: 0.364702
G1 X131.878 Y125.5 E.03314
; LINE_WIDTH: 0.364282
G1 X133.878 Y125.5 E.0331
; LINE_WIDTH: 0.363872
G1 X135.878 Y125.5 E.03306
; LINE_WIDTH: 0.363452
G1 X137.878 Y125.5 E.03302
; LINE_WIDTH: 0.363042
G1 X139.878 Y125.499 E.03298
; LINE_WIDTH: 0.362622
G1 X141.878 Y125.499 E.03294
; LINE_WIDTH: 0.377152
G1 X142.05 Y125.492 E.00296
; WIPE_START
G1 X141.878 Y125.499 E-.06541
G1 X140.05 Y125.499 E-.69459
; WIPE_END
G1 E-.04 F1800
G1 X132.554 Y126.936 Z.72 F30000
G1 X114.095 Y130.473 Z.72
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.412332
G1 F3600
G1 X115.113 Y130.495 E.01923
; LINE_WIDTH: 0.385072
G1 X115.268 Y130.487 E.00274
; WIPE_START
G1 X115.113 Y130.495 E-.10091
G1 X114.095 Y130.473 E-.65909
; WIPE_END
G1 E-.04 F1800
G1 X109.72 Y124.219 Z.72 F30000
G1 X108.405 Y122.34 Z.72
G1 Z.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345902
G1 F18741.227
G1 X106.095 Y122.34 E.03616
G1 X106.095 Y122.66 E.00501
G1 X108.051 Y122.66 E.03063
G1 X108.361 Y122.38 E.00653
; WIPE_START
G1 X108.051 Y122.66 E-.15852
G1 X106.468 Y122.66 E-.60148
; WIPE_END
G1 E-.04 F1800
G1 X114.101 Y122.601 Z.72 F30000
G1 X147.599 Y122.34 Z.72
G1 Z.32
G1 E.8 F1800
; LINE_WIDTH: 0.345912
G1 F18740.631
G1 X147.932 Y122.66 E.00722
G1 X149.905 Y122.66 E.03089
G1 X149.905 Y122.34 E.00501
G1 X147.659 Y122.34 E.03516
; CHANGE_LAYER
; Z_HEIGHT: 0.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18740.631
G1 X149.659 Y122.34 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/45
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.72 I.085 J-1.214 P1  F30000
G1 X144.314 Y121.966 Z.72
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.446282
G1 F3600
G1 X144.926 Y121.966 E.01258
; LINE_WIDTH: 0.495247
G1 X145.197 Y121.99 E.00626
; LINE_WIDTH: 0.544212
G1 X145.469 Y122.015 E.00692
G1 X145.297 Y122.079 E.00466
; LINE_WIDTH: 0.498572
G1 X144.965 Y122.218 E.00831
; LINE_WIDTH: 0.472427
G1 X144.633 Y122.356 E.00785
; LINE_WIDTH: 0.446282
G1 X144.314 Y122.593 E.00818
G1 X144.314 Y122.026 E.01167
; WIPE_START
G1 X144.926 Y121.966 E-.23356
G1 X145.197 Y121.99 E-.10369
G1 X145.469 Y122.015 E-.10369
G1 X145.297 Y122.079 E-.06984
G1 X144.965 Y122.218 E-.13667
G1 X144.692 Y122.332 E-.11253
; WIPE_END
G1 E-.04 F1800
G1 X142.645 Y125.411 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.537972
G1 F3600
G1 X142.838 Y125.33 E.00526
G1 X143.318 Y124.98 E.01486
G1 X143.604 Y124.614 E.01163
; LINE_WIDTH: 0.538612
G1 X143.772 Y124.293 E.00911
G1 X143.762 Y124.668 E.00942
; LINE_WIDTH: 0.537972
G1 X143.761 Y125.411 E.0186
G1 X142.705 Y125.411 E.02645
; WIPE_START
G1 X142.838 Y125.33 E-.05945
G1 X143.318 Y124.98 E-.22551
G1 X143.604 Y124.614 E-.17641
G1 X143.772 Y124.293 E-.13804
G1 X143.762 Y124.668 E-.14271
G1 X143.762 Y124.715 E-.01788
; WIPE_END
G1 E-.04 F1800
G1 X146.123 Y122.015 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.543672
G1 F3600
G1 X146.377 Y121.991 E.00647
; LINE_WIDTH: 0.496832
G1 X146.632 Y121.968 E.00589
; LINE_WIDTH: 0.449992
G1 X150.405 Y121.968 E.07825
G1 X150.405 Y122.5 E.01104
G1 X150.405 Y123.032 E.01104
G1 X147.759 Y123.032 E.05487
G1 X147.641 Y122.87 E.00416
G2 X146.894 Y122.299 I-1.97 J1.803 E.0196
; LINE_WIDTH: 0.496832
G1 X146.509 Y122.157 E.00947
; LINE_WIDTH: 0.543672
G1 X146.179 Y122.035 E.0089
; WIPE_START
G1 X146.377 Y121.991 E-.07721
G1 X146.632 Y121.968 E-.09715
G1 X148.173 Y121.968 E-.58564
; WIPE_END
G1 E-.04 F1800
G1 X143.916 Y121.543 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X150.829 Y121.543 E.14338
G1 X150.829 Y122.5 E.01984
G1 X150.829 Y123.457 E.01984
G1 X147.537 Y123.457 E.06828
G1 X147.336 Y123.166 E.00733
G2 X145.428 Y122.508 I-1.534 J1.354 E.04378
G1 X144.852 Y122.717 E.01271
G1 X144.444 Y123.029 E.01065
; LINE_WIDTH: 0.492222
G1 X144.184 Y123.364 E.00968
; LINE_WIDTH: 0.534452
G1 X143.924 Y123.699 E.01055
G1 X143.907 Y123.466 E.00583
; LINE_WIDTH: 0.492222
G1 X143.891 Y123.232 E.00535
; LINE_WIDTH: 0.449992
G3 X143.913 Y121.603 I21.676 J-.523 E.03379
; WIPE_START
G1 X145.913 Y121.586 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.123 Y122.015 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.544212
G1 F3600
G1 X145.469 Y122.015 E.01657
; WIPE_START
G1 X146.123 Y122.015 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.517 Y122.653 Z.84 F30000
G1 X117.193 Y124.442 Z.84
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.767 E.01034
G1 X118.225 Y125.151 E.01572
G1 X118.867 Y125.392 E.01422
G1 X119.386 Y125.481 E.01091
G1 X118.668 Y125.479 E.01488
G1 X118.201 Y125.609 E.01006
G1 X117.888 Y125.76 E.00722
G1 X117.42 Y126.156 E.01272
G1 X117.193 Y126.479 E.00817
G1 X117.193 Y124.502 E.04099
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522312
M73 P57 R6
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.15201
G1 X117.592 Y125.363 E-.15199
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.746 Y130.423 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.513912
G1 F3600
G1 X116.309 Y130.117 E.01531
G1 X116.557 Y129.9 E.00786
G1 X116.872 Y129.492 E.01229
G3 X116.86 Y130.424 I-33.553 J.022 E.02224
G1 X115.806 Y130.423 E.02516
; WIPE_START
G1 X116.309 Y130.117 E-.22394
G1 X116.557 Y129.9 E-.12515
G1 X116.872 Y129.492 E-.19575
G1 X116.865 Y130.059 E-.21516
; WIPE_END
G1 E-.04 F1800
G1 X112.63 Y129.507 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.517912
G1 F3600
G2 X113.685 Y130.392 I1.855 J-1.139 E.03371
; LINE_WIDTH: 0.503382
G1 X113.843 Y130.426 E.00378
; LINE_WIDTH: 0.469757
G1 X114.001 Y130.461 E.00351
; LINE_WIDTH: 0.477022
G1 X113.657 Y130.44 E.0076
; LINE_WIDTH: 0.517912
G2 X112.631 Y130.419 I-.692 J8.621 E.02472
G1 X112.63 Y129.567 E.0205
; WIPE_START
G1 X112.812 Y129.76 E-.10072
G1 X113.051 Y129.999 E-.1285
G1 X113.358 Y130.233 E-.14699
G1 X113.685 Y130.392 E-.13789
G1 X113.843 Y130.426 E-.06151
G1 X114.001 Y130.461 E-.06151
G1 X113.678 Y130.441 E-.12288
; WIPE_END
G1 E-.04 F1800
G1 X111.292 Y123.192 Z.84 F30000
G1 X110.906 Y122.018 Z.84
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.551312
G1 F3600
G1 X111.036 Y121.995 E.00341
; LINE_WIDTH: 0.503726
G1 X111.167 Y121.971 E.0031
; LINE_WIDTH: 0.456139
G1 X111.297 Y121.947 E.00279
; LINE_WIDTH: 0.408552
G1 X111.904 Y121.946 E.01136
; LINE_WIDTH: 0.406352
G1 X111.904 Y122.485 E.01004
G1 X111.625 Y122.305 E.00618
; LINE_WIDTH: 0.454672
G1 X111.385 Y122.209 E.00541
; LINE_WIDTH: 0.502992
G1 X111.145 Y122.114 E.00602
; LINE_WIDTH: 0.551312
G1 X110.961 Y122.041 E.00509
; WIPE_START
G1 X111.036 Y121.995 E-.03335
G1 X111.167 Y121.971 E-.05041
G1 X111.297 Y121.947 E-.05041
G1 X111.904 Y121.946 E-.23065
G1 X111.904 Y122.485 E-.20495
G1 X111.625 Y122.305 E-.12624
G1 X111.469 Y122.242 E-.06399
; WIPE_END
G1 E-.04 F1800
G1 X108.355 Y122.901 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.242 Y123.032 E.00358
G1 X105.595 Y123.032 E.05489
G1 X105.595 Y121.968 E.02208
G1 X109.209 Y121.968 E.07494
; LINE_WIDTH: 0.499122
G1 X109.503 Y121.992 E.00685
; LINE_WIDTH: 0.548252
G1 X109.798 Y122.017 E.00756
G1 X109.525 Y122.126 E.00751
; LINE_WIDTH: 0.499122
G1 X109.253 Y122.235 E.0068
; LINE_WIDTH: 0.449992
G1 X108.785 Y122.497 E.01111
G2 X108.488 Y122.746 I1.344 J1.908 E.00805
G1 X108.394 Y122.856 E.003
G1 X108.627 Y123.221 F30000
G1 F3600
G1 X108.47 Y123.457 E.00588
G1 X105.171 Y123.457 E.06842
G1 X105.171 Y121.543 E.03968
G1 X109.714 Y121.544 E.09422
G3 X112.307 Y121.56 I1 J47.891 E.05379
G1 X112.307 Y123.488 E.04
G2 X111.184 Y122.567 I-1.74 J.978 E.03082
G1 X110.555 Y122.457 E.01324
G1 X109.88 Y122.483 E.01401
G1 X109.389 Y122.637 E.01068
G1 X109.058 Y122.823 E.00787
G1 X108.671 Y123.156 E.01059
G1 X108.661 Y123.171 E.00038
; WIPE_START
G1 X108.47 Y123.457 E-.13055
G1 X106.813 Y123.457 E-.62945
; WIPE_END
G1 E-.04 F1800
G1 X110.906 Y122.018 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.551312
G1 F3600
G1 X110.546 Y122 E.00926
; LINE_WIDTH: 0.548252
G1 X109.798 Y122.017 E.0191
; WIPE_START
G1 X110.546 Y122 E-.51274
G1 X110.906 Y122.018 E-.24726
; WIPE_END
G1 E-.04 F1800
G1 X109.011 Y123.42 Z.84 F30000
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.98 Y123.446 E.00085
G1 X108.725 Y123.881 E.01045
G1 X104.747 Y123.881 E.0825
G1 X104.747 Y121.119 E.05728
G1 X112.247 Y121.119 E.15557
G1 X112.493 Y121.158 E.00517
G1 X112.638 Y121.276 E.00387
G1 X112.731 Y121.518 E.00538
G1 X112.731 Y123.185 E.03457
; LINE_WIDTH: 0.464732
G1 X112.723 Y123.918 E.01574
; LINE_WIDTH: 0.492127
G1 X112.71 Y124.179 E.00595
; LINE_WIDTH: 0.519522
G1 X112.696 Y124.439 E.00629
G1 X112.696 Y126.439 E.04828
; LINE_WIDTH: 0.518632
G1 X112.697 Y128.301 E.04487
; LINE_WIDTH: 0.549072
G1 X112.741 Y128.751 E.01158
G1 X112.787 Y128.841 E.00257
; LINE_WIDTH: 0.515882
G1 X112.832 Y128.93 E.00241
; LINE_WIDTH: 0.482692
G1 X113.136 Y129.436 E.01318
; LINE_WIDTH: 0.449992
G1 X113.567 Y129.825 E.01205
G1 X114.068 Y130.049 E.01139
G1 X114.559 Y130.119 E.01028
G1 X115.253 Y130.089 E.01441
G1 X115.763 Y129.923 E.01112
G1 X116.207 Y129.608 E.0113
G1 X116.56 Y129.136 E.01221
; LINE_WIDTH: 0.493902
G1 X116.668 Y128.9 E.00596
; LINE_WIDTH: 0.537812
G1 X116.777 Y128.663 E.00652
G1 X116.803 Y128.301 E.0091
; LINE_WIDTH: 0.522972
G1 X116.806 Y127.327 E.02367
G1 X116.787 Y127.042 E.00695
; LINE_WIDTH: 0.486482
G1 X116.769 Y126.756 E.00644
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.202 E.07373
G1 X116.92 Y123.476 E.0065
G1 X117.318 Y123.981 E.01332
G1 X117.799 Y124.408 E.01333
G1 X118.385 Y124.758 E.01416
G1 X118.945 Y124.975 E.01246
G2 X119.95 Y125.119 I1.028 J-3.583 E.02112
G1 X141.878 Y125.119 E.45485
G1 X142.011 Y125.104 E.00277
G1 X142.583 Y124.937 E.01237
G1 X142.975 Y124.661 E.00995
G1 X143.296 Y124.225 E.01122
G1 X143.434 Y123.798 E.00931
G1 X143.467 Y123.53 E.0056
G3 X143.494 Y121.386 I31.411 J-.67 E.04449
G1 X143.613 Y121.224 E.00416
G1 X143.866 Y121.119 E.00567
G1 X151.253 Y121.119 E.15322
G1 X151.253 Y122.5 E.02864
G1 X151.253 Y123.881 E.02864
G1 X147.282 Y123.881 E.08236
G1 X147.131 Y123.597 E.00667
G1 X146.739 Y123.193 E.01168
G1 X146.262 Y122.954 E.01107
G1 X145.767 Y122.889 E.01035
G1 X145.552 Y122.914 E.0045
G1 X145.072 Y123.08 E.01054
G1 X144.706 Y123.362 E.00958
G1 X144.559 Y123.53 E.00463
G1 X144.348 Y123.894 E.00873
G1 X144.231 Y124.439 E.01156
G3 X144.201 Y125.619 I-12.66 J.273 E.0245
G1 X144.103 Y125.762 E.0036
G1 X143.87 Y125.879 E.00539
G1 X118.855 Y125.885 E.51888
G1 X118.319 Y126.016 E.01143
G1 X117.894 Y126.277 E.01034
G1 X117.562 Y126.676 E.01077
; LINE_WIDTH: 0.484002
G1 X117.348 Y127.198 E.01264
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.498 E.00734
; LINE_WIDTH: 0.537812
G1 X117.285 Y128.708 E.03028
G1 X117.307 Y128.994 E.00719
; LINE_WIDTH: 0.493902
G1 X117.329 Y129.281 E.00657
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.412 E.02346
G1 X117.275 Y130.682 E.00571
G1 X117.159 Y130.797 E.00339
G1 X116.911 Y130.88 E.00542
G1 X112.911 Y130.877 E.08297
G3 X112.401 Y130.841 I-.148 J-1.544 E.01066
G1 X112.264 Y130.727 E.00369
G1 X112.173 Y130.498 E.00511
G1 X112.172 Y129.475 E.02123
; LINE_WIDTH: 0.483662
G1 X112.189 Y129.255 E.00495
; LINE_WIDTH: 0.517332
G1 X112.205 Y129.034 E.00531
; LINE_WIDTH: 0.551002
G2 X112.205 Y128.301 I-3.364 J-.365 E.01887
; LINE_WIDTH: 0.518702
G1 X112.203 Y126.301 E.0482
; LINE_WIDTH: 0.519522
G1 X112.202 Y124.439 E.04495
G1 X112.146 Y124.214 E.00561
; LINE_WIDTH: 0.492127
G1 X112.089 Y123.988 E.0053
; LINE_WIDTH: 0.464732
G1 X111.786 Y123.465 E.01299
; LINE_WIDTH: 0.449992
G2 X111.091 Y122.981 I-1.472 J1.375 E.01768
G1 X110.564 Y122.881 E.01113
G1 X110.046 Y122.892 E.01075
G1 X109.525 Y123.039 E.01123
G1 X109.33 Y123.148 E.00463
G1 X109.057 Y123.381 E.00745
M204 S250
G1 X109.381 Y123.643 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.295 Y123.711 E.00211
G1 X109.065 Y124.111 E.0089
G1 X109.027 Y124.29 E.00352
G1 X104.947 Y124.29 E.07864
G1 F2250
G1 X104.867 Y124.29 E.00154
G1 F2700
G1 X104.787 Y124.29 E.00154
G1 F3150
G1 X104.707 Y124.29 E.00154
G1 F3600
G1 X104.628 Y124.29 E.00154
G1 X104.548 Y124.29 E.00154
G1 F3313.786
G1 X104.468 Y124.29 E.00154
G1 F2499.595
G1 X104.388 Y124.29 E.00154
G1 F1800
G1 X104.338 Y124.29 E.00097
G1 X104.338 Y120.71 E.06901
G1 X104.484 Y120.71 E.00283
G1 F2250
G1 X104.716 Y120.71 E.00447
G1 F2700
G1 X104.948 Y120.71 E.00447
G1 F3150
G1 X105.179 Y120.71 E.00447
G1 F3600
G1 X105.411 Y120.71 E.00447
G1 F3150
G1 X105.643 Y120.71 E.00447
G1 F2700
G1 X105.874 Y120.71 E.00447
G1 F2250
G1 X106.106 Y120.71 E.00447
G1 F1800
G1 X112.247 Y120.71 E.11837
G1 X112.647 Y120.772 E.0078
G1 X112.881 Y120.919 E.00534
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.195 Y128.683 E.00745
G1 X113.388 Y129.094 E.00875
G1 X113.664 Y129.386 E.00774
G1 X114.076 Y129.626 E.00919
G1 X114.549 Y129.71 E.00926
G1 X115.096 Y129.701 E.01055
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00875
G1 X116.321 Y128.621 E.0088
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.761 E.10678
; LINE_WIDTH: 0.430602
G1 X116.365 Y121.715 E.02071
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437562
G1 X116.787 Y122.09 E.00758
G1 X116.978 Y122.711 E.01309
; LINE_WIDTH: 0.419992
G1 X117.246 Y123.228 E.01121
G1 X117.594 Y123.679 E.01098
G1 X118.017 Y124.062 E.01099
G1 X118.538 Y124.379 E.01176
G2 X119.95 Y124.71 I1.523 J-3.316 E.02813
G1 X141.878 Y124.71 E.42268
G1 X142.296 Y124.621 E.00823
G1 X142.639 Y124.413 E.00774
G1 X142.938 Y124.02 E.00951
G1 X143.058 Y123.53 E.00972
G1 X143.058 Y121.588 E.03743
G1 X143.102 Y121.249 E.00658
G1 X143.239 Y121.003 E.00543
G1 X143.468 Y120.812 E.00576
G1 X143.854 Y120.71 E.00769
G1 X150.063 Y120.71 E.11969
G1 F2250
G1 X150.273 Y120.71 E.00404
G1 F2700
G1 X150.482 Y120.71 E.00404
G1 F3150
G1 X150.692 Y120.71 E.00404
G1 F3600
G1 X150.901 Y120.71 E.00404
G1 F3150
G1 X151.111 Y120.71 E.00404
G1 F2700
G1 X151.32 Y120.71 E.00404
G1 F2250
G1 X151.53 Y120.71 E.00404
G1 F1800
G1 X151.662 Y120.71 E.00255
G1 X151.662 Y122.5 E.0345
G1 X151.662 Y124.29 E.0345
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.516 Y124.29 E.00283
G1 F2250
G1 X151.284 Y124.29 E.00447
G1 F2700
G1 X151.052 Y124.29 E.00447
G1 F3150
G1 X150.821 Y124.29 E.00447
G1 F3600
G1 X150.589 Y124.29 E.00447
G1 F3150
G1 X150.357 Y124.29 E.00447
G1 F2700
G1 X150.126 Y124.29 E.00447
G1 F2250
G1 X149.894 Y124.29 E.00447
G1 F1800
G1 X146.971 Y124.29 E.05634
G1 X146.946 Y124.141 E.00292
G1 X146.77 Y123.79 E.00757
G1 X146.464 Y123.495 E.00819
G1 X146.104 Y123.331 E.00762
G1 X145.741 Y123.297 E.00701
G1 X145.328 Y123.41 E.00825
G1 X144.959 Y123.684 E.00886
G1 X144.729 Y124.047 E.00829
G1 X144.64 Y124.44 E.00777
G3 X144.594 Y125.752 I-8.954 J.343 E.02534
G1 X144.475 Y125.977 E.0049
G1 X144.269 Y126.164 E.00537
G1 X143.895 Y126.288 E.0076
G1 X118.86 Y126.294 E.48255
G1 X118.433 Y126.409 E.00853
G1 X118.132 Y126.61 E.00696
G1 X117.891 Y126.92 E.00758
G1 X117.756 Y127.323 E.00818
G1 X117.74 Y127.499 E.00341
G1 X117.736 Y130.441 E.0567
G1 X117.648 Y130.863 E.00833
G1 X117.518 Y131.045 E.00431
G1 X117.27 Y131.218 E.00583
G1 X116.957 Y131.29 E.00619
G1 X112.957 Y131.286 E.0771
G3 X112.233 Y131.221 I-.17 J-2.141 E.01408
G1 X112.018 Y131.08 E.00497
G1 X111.851 Y130.861 E.0053
G1 X111.764 Y130.556 E.00611
G1 X111.758 Y124.44 E.1179
G1 X111.682 Y124.08 E.00709
G1 X111.442 Y123.687 E.00886
G1 X111.071 Y123.411 E.00892
G1 X110.576 Y123.29 E.00981
G1 X110.054 Y123.301 E.01007
G1 X109.656 Y123.426 E.00805
G1 X109.428 Y123.606 E.00559
; WIPE_START
M204 S10000
G1 X109.295 Y123.711 E-.06441
G1 X109.065 Y124.111 E-.17553
G1 X109.027 Y124.29 E-.06944
G1 X107.841 Y124.29 E-.45061
; WIPE_END
G1 E-.04
G1 X115.472 Y124.165 Z.84 F30000
G1 X143.924 Y123.699 Z.84
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.538612
G1 F3600
G1 X143.772 Y124.293 E.01535
; WIPE_START
G1 X143.924 Y123.699 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.311 Y124.252 Z.84 F30000
G1 X119.386 Y125.481 Z.84
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.409692
G1 F3600
G1 X119.891 Y125.501 E.00949
; LINE_WIDTH: 0.368512
G1 X119.95 Y125.502 E.00098
; LINE_WIDTH: 0.366732
G1 X121.878 Y125.502 E.03215
; LINE_WIDTH: 0.366332
G1 X123.878 Y125.501 E.0333
; LINE_WIDTH: 0.365922
G1 X125.878 Y125.501 E.03326
; LINE_WIDTH: 0.365502
G1 X127.878 Y125.501 E.03322
; LINE_WIDTH: 0.365092
G1 X129.878 Y125.501 E.03318
; LINE_WIDTH: 0.364682
G1 X131.878 Y125.5 E.03314
; LINE_WIDTH: 0.364272
G1 X133.878 Y125.5 E.0331
; LINE_WIDTH: 0.363852
M73 P58 R6
G1 X135.878 Y125.5 E.03306
; LINE_WIDTH: 0.363442
G1 X137.878 Y125.5 E.03302
; LINE_WIDTH: 0.363032
G1 X139.878 Y125.499 E.03298
; LINE_WIDTH: 0.362622
G1 X141.878 Y125.499 E.03294
; LINE_WIDTH: 0.377152
G1 X142.05 Y125.492 E.00296
; WIPE_START
G1 X141.878 Y125.499 E-.06541
G1 X140.05 Y125.499 E-.69459
; WIPE_END
G1 E-.04 F1800
G1 X132.553 Y126.927 Z.84 F30000
G1 X114.001 Y130.461 Z.84
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.436132
G1 F3600
G1 X114.275 Y130.48 E.00551
; LINE_WIDTH: 0.398432
G1 X114.549 Y130.499 E.005
; LINE_WIDTH: 0.369752
G1 X115.109 Y130.495 E.00942
; LINE_WIDTH: 0.384632
G1 X115.265 Y130.487 E.00274
; WIPE_START
G1 X115.109 Y130.495 E-.09394
G1 X114.549 Y130.499 E-.33637
G1 X114.275 Y130.48 E-.16485
G1 X114.001 Y130.461 E-.16485
; WIPE_END
G1 E-.04 F1800
G1 X109.667 Y124.178 Z.84 F30000
G1 X108.399 Y122.34 Z.84
G1 Z.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345902
G1 F18741.234
G1 X105.968 Y122.34 E.03806
G1 X105.968 Y122.66 E.00501
G1 X107.974 Y122.66 E.03141
G2 X108.102 Y122.599 I.01 J-.144 E.00232
G1 X108.354 Y122.379 E.00523
; WIPE_START
G1 X108.102 Y122.599 E-.12689
G1 X108.077 Y122.626 E-.01408
G1 X107.974 Y122.66 E-.04122
G1 X106.454 Y122.66 E-.57781
; WIPE_END
G1 E-.04 F1800
G1 X114.086 Y122.601 Z.84 F30000
G1 X147.611 Y122.34 Z.84
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.345912
G1 F18740.631
G1 X147.931 Y122.66 E.00708
G1 X150.032 Y122.66 E.0329
G1 X150.032 Y122.34 E.00501
G1 X147.671 Y122.34 E.03696
; CHANGE_LAYER
; Z_HEIGHT: 0.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18740.631
G1 X149.671 Y122.34 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/45
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.84 I.085 J-1.214 P1  F30000
G1 X144.314 Y121.966 Z.84
G1 Z.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.445692
G1 F3600
G1 X144.873 Y121.966 E.01148
; LINE_WIDTH: 0.494972
G1 X145.171 Y121.99 E.00686
; LINE_WIDTH: 0.544252
G1 X145.469 Y122.015 E.00758
G1 X145.373 Y122.052 E.00261
; LINE_WIDTH: 0.518422
G1 X145.276 Y122.089 E.00248
; LINE_WIDTH: 0.492592
G1 X144.629 Y122.357 E.01599
; LINE_WIDTH: 0.445692
G1 X144.313 Y122.591 E.00806
G1 X144.314 Y122.026 E.0116
; WIPE_START
G1 X144.873 Y121.966 E-.21373
G1 X145.171 Y121.99 E-.11364
G1 X145.469 Y122.015 E-.11364
G1 X145.373 Y122.052 E-.03918
G1 X145.276 Y122.089 E-.03918
G1 X144.691 Y122.331 E-.24063
; WIPE_END
G1 E-.04 F1800
G1 X142.639 Y125.411 Z.96 F30000
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.537302
G1 F3600
G1 X142.816 Y125.338 E.00478
G1 X143.323 Y124.977 E.01557
G1 X143.585 Y124.647 E.01054
; LINE_WIDTH: 0.544512
G1 X143.77 Y124.29 E.0102
G1 X143.762 Y124.707 E.01059
; LINE_WIDTH: 0.537302
G1 X143.761 Y125.411 E.0176
G1 X142.699 Y125.411 E.02655
; WIPE_START
G1 X142.816 Y125.338 E-.05223
G1 X143.323 Y124.977 E-.23654
G1 X143.585 Y124.647 E-.16017
G1 X143.77 Y124.29 E-.15284
G1 X143.762 Y124.706 E-.15822
; WIPE_END
G1 E-.04 F1800
G1 X146.123 Y122.015 Z.96 F30000
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.543732
G1 F3600
G1 X146.378 Y121.991 E.00648
; LINE_WIDTH: 0.496862
G1 X146.632 Y121.968 E.00589
; LINE_WIDTH: 0.449992
G1 X150.518 Y121.968 E.0806
G1 X150.518 Y122.5 E.01104
G1 X150.518 Y123.032 E.01104
G1 X147.761 Y123.032 E.05718
G1 X147.639 Y122.865 E.00429
G2 X146.895 Y122.3 I-1.955 J1.801 E.01949
; LINE_WIDTH: 0.496862
G1 X146.509 Y122.157 E.00948
; LINE_WIDTH: 0.543732
G1 X146.179 Y122.035 E.0089
; WIPE_START
G1 X146.378 Y121.991 E-.07725
G1 X146.632 Y121.968 E-.0972
G1 X148.173 Y121.968 E-.58555
; WIPE_END
G1 E-.04 F1800
G1 X143.915 Y121.543 Z.96 F30000
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X150.942 Y121.543 E.14577
G1 X150.942 Y122.5 E.01984
G1 X150.942 Y123.457 E.01984
G1 X147.533 Y123.457 E.07071
G1 X147.331 Y123.156 E.00752
G2 X145.413 Y122.513 I-1.524 J1.365 E.04388
G1 X144.841 Y122.722 E.01263
G1 X144.432 Y123.038 E.01073
; LINE_WIDTH: 0.492222
G1 X144.178 Y123.369 E.00951
; LINE_WIDTH: 0.534452
G1 X143.924 Y123.699 E.01037
G1 X143.907 Y123.466 E.00583
; LINE_WIDTH: 0.492222
G1 X143.891 Y123.232 E.00534
; LINE_WIDTH: 0.449992
G3 X143.912 Y121.603 I23.168 J-.523 E.03379
; WIPE_START
G1 X145.912 Y121.586 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.123 Y122.015 Z.96 F30000
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.544252
G1 F3600
G1 X145.469 Y122.015 E.01658
; WIPE_START
G1 X146.123 Y122.015 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.517 Y122.653 Z.96 F30000
G1 X117.193 Y124.441 Z.96
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.767 E.01035
G1 X118.225 Y125.151 E.01573
G1 X118.867 Y125.392 E.01422
G1 X119.386 Y125.481 E.01091
G1 X118.668 Y125.479 E.01488
G1 X118.202 Y125.609 E.01005
G1 X117.889 Y125.76 E.0072
G1 X117.421 Y126.155 E.0127
G1 X117.193 Y126.479 E.00821
G1 X117.193 Y124.501 E.04102
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522352
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.15201
G1 X117.592 Y125.363 E-.15199
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.746 Y130.423 Z.96 F30000
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.513902
G1 F3600
G1 X116.309 Y130.117 E.0153
G1 X116.557 Y129.9 E.00786
G1 X116.872 Y129.492 E.0123
G1 X116.871 Y130.424 E.02223
G1 X115.806 Y130.423 E.02542
; WIPE_START
G1 X116.309 Y130.117 E-.22388
G1 X116.557 Y129.9 E-.12517
G1 X116.872 Y129.492 E-.1958
G1 X116.871 Y130.059 E-.21515
; WIPE_END
G1 E-.04 F1800
G1 X112.629 Y129.504 Z.96 F30000
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.515822
G1 F3600
G2 X113.664 Y130.383 I1.847 J-1.126 E.0331
; LINE_WIDTH: 0.505262
G1 X113.83 Y130.422 E.00398
; LINE_WIDTH: 0.471547
G1 X113.995 Y130.46 E.0037
; LINE_WIDTH: 0.476827
G1 X113.628 Y130.44 E.00811
; LINE_WIDTH: 0.515822
G2 X112.63 Y130.42 I-.69 J9.391 E.02392
G1 X112.629 Y129.564 E.0205
; WIPE_START
G1 X112.801 Y129.748 E-.09568
G1 X113.05 Y130.004 E-.13583
G1 X113.315 Y130.203 E-.12561
G1 X113.664 Y130.383 E-.14952
G1 X113.83 Y130.422 E-.06448
G1 X113.995 Y130.46 E-.06447
G1 X113.668 Y130.442 E-.12441
; WIPE_END
G1 E-.04 F1800
G1 X111.284 Y123.192 Z.96 F30000
G1 X110.898 Y122.019 Z.96
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.551512
G1 F3600
G1 X111.087 Y121.995 E.00489
; LINE_WIDTH: 0.504722
G1 X111.276 Y121.972 E.00446
; LINE_WIDTH: 0.457932
G1 X111.465 Y121.948 E.00402
; LINE_WIDTH: 0.411142
G1 X111.902 Y121.948 E.00824
G1 X111.902 Y122.48 E.01001
G1 X111.407 Y122.215 E.01058
; LINE_WIDTH: 0.457932
G1 X111.237 Y122.15 E.00384
; LINE_WIDTH: 0.504722
G1 X111.068 Y122.084 E.00426
; LINE_WIDTH: 0.551512
G1 X110.954 Y122.04 E.00313
; WIPE_START
G1 X111.087 Y121.995 E-.05331
G1 X111.276 Y121.972 E-.0723
G1 X111.465 Y121.948 E-.0723
G1 X111.902 Y121.948 E-.1661
G1 X111.902 Y122.48 E-.20197
G1 X111.451 Y122.239 E-.19402
; WIPE_END
G1 E-.04 F1800
G1 X108.24 Y123.032 Z.96 F30000
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X105.482 Y123.032 E.0572
G1 X105.482 Y121.968 E.02208
G1 X109.532 Y121.968 E.08401
; LINE_WIDTH: 0.493522
G1 X109.74 Y121.99 E.00479
; LINE_WIDTH: 0.537052
G1 X109.949 Y122.011 E.00523
G1 X109.748 Y122.072 E.00523
; LINE_WIDTH: 0.493522
G1 X109.548 Y122.134 E.00479
; LINE_WIDTH: 0.449992
G1 X109.047 Y122.333 E.01119
G2 X108.277 Y122.986 I1.41 J2.445 E.02105
G1 X108.487 Y123.427 F30000
G1 F3600
G1 X108.466 Y123.457 E.00075
G1 X105.058 Y123.457 E.07069
G1 X105.058 Y121.543 E.03968
G1 X109.709 Y121.544 E.09648
G3 X112.307 Y121.56 I1 J48.187 E.05389
G1 X112.307 Y123.482 E.03988
G1 X112.032 Y123.102 E.00973
G1 X111.543 Y122.722 E.01286
G2 X110.871 Y122.493 I-.948 J1.68 E.0148
G1 X110.208 Y122.457 E.01378
G1 X109.63 Y122.55 E.01214
G2 X108.725 Y123.108 I.559 J1.918 E.0223
G1 X108.523 Y123.379 E.00702
; WIPE_START
G1 X108.466 Y123.457 E-.03663
G1 X106.562 Y123.457 E-.72337
; WIPE_END
G1 E-.04 F1800
G1 X110.898 Y122.019 Z.96 F30000
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.551512
G1 F3600
G1 X109.949 Y122.011 E.02441
; WIPE_START
G1 X110.898 Y122.019 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.811 Y123.704 Z.96 F30000
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.725 Y123.881 E.00407
G1 X104.634 Y123.881 E.08486
G1 X104.634 Y121.119 E.05728
G1 X112.248 Y121.119 E.15794
G1 X112.493 Y121.158 E.00514
G1 X112.638 Y121.276 E.00388
G1 X112.731 Y121.518 E.00538
G1 X112.731 Y123.66 E.04443
; LINE_WIDTH: 0.484757
G1 X112.713 Y124.049 E.00875
; LINE_WIDTH: 0.519522
G1 X112.696 Y124.439 E.00941
G1 X112.696 Y126.439 E.04828
; LINE_WIDTH: 0.518642
G1 X112.697 Y128.301 E.04487
; LINE_WIDTH: 0.550222
G1 X112.743 Y128.759 E.01181
G1 X112.789 Y128.848 E.00257
; LINE_WIDTH: 0.516297
G1 X112.834 Y128.937 E.00241
; LINE_WIDTH: 0.482372
G1 X113.129 Y129.429 E.01281
; LINE_WIDTH: 0.449992
G1 X113.529 Y129.799 E.0113
G1 X114.063 Y130.047 E.0122
G1 X114.559 Y130.119 E.0104
G1 X115.253 Y130.089 E.01441
G1 X115.763 Y129.923 E.01112
G1 X116.207 Y129.608 E.0113
G1 X116.56 Y129.136 E.01221
; LINE_WIDTH: 0.493882
G1 X116.668 Y128.9 E.00596
; LINE_WIDTH: 0.537772
G1 X116.777 Y128.663 E.00652
G1 X116.803 Y128.301 E.00909
; LINE_WIDTH: 0.522962
G1 X116.806 Y127.327 E.02366
G1 X116.787 Y127.042 E.00696
; LINE_WIDTH: 0.486477
G1 X116.769 Y126.756 E.00644
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.07354
G1 X116.868 Y123.392 E.00427
G1 X117.307 Y123.969 E.01504
G1 X117.798 Y124.408 E.01368
G1 X118.385 Y124.758 E.01417
G1 X118.945 Y124.975 E.01246
G2 X119.95 Y125.119 I1.028 J-3.583 E.02112
G1 X141.879 Y125.119 E.45485
G1 X142.354 Y125.032 E.01003
G1 X142.56 Y124.946 E.00463
G1 X142.988 Y124.65 E.01079
G1 X143.287 Y124.239 E.01055
G1 X143.431 Y123.807 E.00944
G1 X143.467 Y123.53 E.00579
G1 X143.467 Y121.588 E.04029
G1 X143.525 Y121.33 E.00548
G1 X143.67 Y121.177 E.00438
G1 X143.866 Y121.119 E.00424
G1 X151.366 Y121.119 E.15557
G1 X151.366 Y122.5 E.02864
G1 X151.366 Y123.881 E.02864
G1 X147.282 Y123.881 E.08471
G1 X147.112 Y123.571 E.00733
G1 X146.734 Y123.188 E.01116
G1 X146.262 Y122.954 E.01092
G1 X145.728 Y122.888 E.01116
G1 X145.173 Y123.036 E.01191
G1 X144.977 Y123.142 E.00463
G1 X144.559 Y123.53 E.01183
G1 X144.348 Y123.894 E.00873
G1 X144.231 Y124.439 E.01156
G3 X144.201 Y125.62 I-13.18 J.26 E.0245
G1 X144.103 Y125.762 E.00358
G1 X143.87 Y125.879 E.0054
G1 X118.855 Y125.885 E.51888
G1 X118.319 Y126.016 E.01143
G1 X117.896 Y126.276 E.01031
G1 X117.562 Y126.676 E.0108
; LINE_WIDTH: 0.483932
G1 X117.348 Y127.198 E.01265
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.499 E.00736
; LINE_WIDTH: 0.537772
G1 X117.285 Y128.708 E.03026
G1 X117.307 Y128.994 E.00719
; LINE_WIDTH: 0.493882
G1 X117.328 Y129.281 E.00657
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.501 E.02532
G1 X117.21 Y130.767 E.00603
G1 X116.957 Y130.88 E.00573
G1 X112.957 Y130.877 E.08297
G3 X112.401 Y130.841 I-.17 J-1.688 E.01162
G1 X112.263 Y130.727 E.00371
G1 X112.173 Y130.497 E.00512
G1 X112.172 Y129.477 E.02116
; LINE_WIDTH: 0.483979
G1 X112.189 Y129.258 E.00492
; LINE_WIDTH: 0.517966
G1 X112.205 Y129.039 E.00529
; LINE_WIDTH: 0.551952
G2 X112.205 Y128.301 I-3.333 J-.366 E.01903
; LINE_WIDTH: 0.518712
G1 X112.203 Y126.301 E.0482
; LINE_WIDTH: 0.519522
G1 X112.202 Y124.439 E.04495
; LINE_WIDTH: 0.529162
G2 X112.11 Y124.077 I-.676 J-.02 E.00933
; LINE_WIDTH: 0.489577
G1 X112.026 Y123.847 E.00555
; LINE_WIDTH: 0.449992
M73 P58 R5
G1 X111.746 Y123.415 E.01068
G1 X111.367 Y123.108 E.01011
G1 X110.847 Y122.916 E.0115
G1 X110.208 Y122.881 E.01328
G1 X109.711 Y122.966 E.01045
G2 X109.196 Y123.244 I.479 J1.505 E.01221
G1 X108.844 Y123.637 E.01094
G1 X108.837 Y123.65 E.00031
M204 S250
G1 X109.302 Y123.726 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.166 Y123.889 E.0041
G1 X109.016 Y124.286 E.00817
G3 X104.604 Y124.29 I-3.385 J-1327.131 E.08504
G1 F2250
G1 X104.55 Y124.29 E.00103
G1 F2700
G1 X104.497 Y124.29 E.00103
G1 F3150
G1 X104.443 Y124.29 E.00103
G1 F3600
G1 X104.389 Y124.29 E.00103
G1 F3327.234
G1 X104.336 Y124.29 E.00103
G1 F2766.47
G1 X104.282 Y124.29 E.00103
G1 F2257.328
G1 X104.229 Y124.29 E.00103
G1 F1800
G1 X104.224 Y120.71 E.06901
G1 X104.244 Y120.71 E.00038
G1 F2250
G1 X104.492 Y120.71 E.00477
G1 F2700
G1 X104.739 Y120.71 E.00477
G1 F3150
G1 X104.987 Y120.71 E.00477
G1 F3600
G1 X105.234 Y120.71 E.00477
G1 F3150
G1 X105.482 Y120.71 E.00477
G1 F2700
G1 X105.729 Y120.71 E.00477
G1 F2250
G1 X105.977 Y120.71 E.00477
G1 F1800
G1 X112.248 Y120.71 E.12088
G1 X112.647 Y120.772 E.00778
G1 X112.881 Y120.919 E.00534
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.197 Y128.69 E.00758
G1 X113.388 Y129.095 E.00863
G1 X113.672 Y129.401 E.00805
G1 X114.069 Y129.623 E.00877
G1 X114.549 Y129.71 E.00941
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00875
G1 X116.321 Y128.621 E.00881
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.679 E.10837
; LINE_WIDTH: 0.430582
G1 X116.365 Y121.715 E.01907
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437842
G1 X116.786 Y122.088 E.00753
G1 X116.948 Y122.634 E.01149
; LINE_WIDTH: 0.419992
G1 X117.197 Y123.149 E.01102
G1 X117.584 Y123.668 E.01247
G1 X118.017 Y124.062 E.01129
G1 X118.539 Y124.379 E.01177
G2 X119.95 Y124.71 I1.523 J-3.315 E.02812
G1 X141.878 Y124.71 E.42269
G1 X142.27 Y124.631 E.00769
G1 X142.695 Y124.364 E.00968
G1 X142.932 Y124.018 E.0081
G1 X143.058 Y123.53 E.00971
G1 X143.058 Y121.588 E.03744
G1 X143.102 Y121.249 E.00658
M73 P59 R5
G1 X143.237 Y121.005 E.00537
G1 X143.469 Y120.811 E.00583
G1 X143.854 Y120.71 E.00768
G1 X150.092 Y120.71 E.12024
G1 F2250
G1 X150.33 Y120.71 E.00458
G1 F2700
G1 X150.568 Y120.71 E.00458
G1 F3150
G1 X150.805 Y120.71 E.00458
G1 F3600
G1 X151.043 Y120.71 E.00458
G1 F3150
G1 X151.281 Y120.71 E.00458
G1 F2700
G1 X151.519 Y120.71 E.00458
G1 F2250
G1 X151.757 Y120.71 E.00458
G1 F1800
G1 X151.776 Y120.71 E.00037
G1 X151.776 Y122.5 E.0345
G1 X151.776 Y124.29 E.0345
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.756 Y124.29 E.00038
G1 F2250
G1 X151.508 Y124.29 E.00477
G1 F2700
G1 X151.261 Y124.29 E.00477
G1 F3150
G1 X151.013 Y124.29 E.00477
G1 F3600
G1 X150.766 Y124.29 E.00477
G1 F3150
G1 X150.518 Y124.29 E.00477
G1 F2700
G1 X150.271 Y124.29 E.00477
G1 F2250
G1 X150.023 Y124.29 E.00477
G1 F1800
G1 X146.971 Y124.29 E.05883
G1 X146.946 Y124.141 E.00291
G1 X146.753 Y123.768 E.00809
G1 X146.462 Y123.494 E.00771
G1 X146.104 Y123.332 E.00758
G1 X145.741 Y123.297 E.00702
G1 X145.299 Y123.425 E.00887
G1 X144.957 Y123.686 E.00828
G1 X144.729 Y124.047 E.00823
G1 X144.64 Y124.44 E.00776
G3 X144.594 Y125.752 I-8.94 J.344 E.02534
G1 X144.475 Y125.976 E.00489
G1 X144.269 Y126.164 E.00537
G1 X143.895 Y126.288 E.0076
G1 X118.86 Y126.294 E.48255
G1 X118.433 Y126.409 E.00853
G1 X118.134 Y126.609 E.00694
G1 X117.891 Y126.92 E.0076
G1 X117.756 Y127.323 E.00818
G1 X117.74 Y127.5 E.00343
G1 X117.736 Y130.44 E.05666
G1 X117.649 Y130.862 E.00832
G3 X116.972 Y131.29 I-.75 J-.438 E.01604
G1 X112.972 Y131.286 E.0771
G3 X112.233 Y131.221 I-.177 J-2.188 E.01436
G1 X112.017 Y131.079 E.00498
G1 X111.851 Y130.861 E.00528
G1 X111.764 Y130.555 E.00613
G1 X111.758 Y124.44 E.11788
G1 X111.692 Y124.107 E.00654
G1 X111.508 Y123.764 E.0075
G1 X111.249 Y123.514 E.00694
G1 X110.823 Y123.325 E.00898
G1 X110.219 Y123.29 E.01167
G1 X109.789 Y123.368 E.00841
G1 X109.415 Y123.59 E.00839
G1 X109.34 Y123.68 E.00226
; WIPE_START
M204 S10000
G1 X109.166 Y123.889 E-.10363
G1 X109.016 Y124.286 E-.16115
G1 X107.713 Y124.287 E-.49522
; WIPE_END
G1 E-.04
G1 X115.344 Y124.163 Z.96 F30000
G1 X143.924 Y123.699 Z.96
G1 Z.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.544512
G1 F3600
G1 X143.77 Y124.29 E.01547
; WIPE_START
G1 X143.924 Y123.699 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.311 Y124.252 Z.96 F30000
G1 X119.386 Y125.481 Z.96
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.409672
G1 F3600
G1 X119.891 Y125.501 E.00949
; LINE_WIDTH: 0.368512
G1 X119.95 Y125.502 E.00098
; LINE_WIDTH: 0.366752
G1 X121.879 Y125.502 E.03216
; LINE_WIDTH: 0.366352
G1 X123.879 Y125.501 E.03331
; LINE_WIDTH: 0.365932
G1 X125.879 Y125.501 E.03326
; LINE_WIDTH: 0.365522
G1 X127.879 Y125.501 E.03322
; LINE_WIDTH: 0.365102
G1 X129.879 Y125.501 E.03318
; LINE_WIDTH: 0.364692
G1 X131.879 Y125.5 E.03314
; LINE_WIDTH: 0.364282
G1 X133.879 Y125.5 E.0331
; LINE_WIDTH: 0.363862
G1 X135.879 Y125.5 E.03306
; LINE_WIDTH: 0.363452
G1 X137.879 Y125.5 E.03302
; LINE_WIDTH: 0.363032
G1 X139.879 Y125.499 E.03298
; LINE_WIDTH: 0.362622
G1 X141.879 Y125.499 E.03294
; LINE_WIDTH: 0.377152
G1 X142.05 Y125.492 E.00296
; WIPE_START
G1 X141.879 Y125.499 E-.06541
G1 X140.051 Y125.499 E-.69459
; WIPE_END
G1 E-.04 F1800
G1 X132.553 Y126.927 Z.96 F30000
G1 X113.995 Y130.46 Z.96
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.437832
G1 F3600
G1 X114.272 Y130.479 E.00559
; LINE_WIDTH: 0.399282
G1 X114.549 Y130.499 E.00507
; LINE_WIDTH: 0.369772
G1 X115.109 Y130.495 E.00942
; LINE_WIDTH: 0.384652
G1 X115.265 Y130.487 E.00274
; WIPE_START
G1 X115.109 Y130.495 E-.09344
G1 X114.549 Y130.499 E-.33477
G1 X114.272 Y130.479 E-.16589
G1 X113.995 Y130.46 E-.1659
; WIPE_END
G1 E-.04 F1800
G1 X109.662 Y124.176 Z.96 F30000
G1 X108.396 Y122.34 Z.96
G1 Z.56
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345897
G1 F18741.536
G1 X105.854 Y122.34 E.03979
G1 X105.854 Y122.66 E.00501
G1 X108.059 Y122.66 E.0345
G3 X108.351 Y122.38 I1.057 J.811 E.00637
; WIPE_START
G1 X108.059 Y122.66 E-.15398
G1 X106.464 Y122.66 E-.60602
; WIPE_END
G1 E-.04 F1800
G1 X114.096 Y122.601 Z.96 F30000
G1 X147.61 Y122.34 Z.96
G1 Z.56
G1 E.8 F1800
; LINE_WIDTH: 0.345912
G1 F18740.631
G1 X147.933 Y122.66 E.00711
G1 X150.146 Y122.66 E.03464
G1 X150.146 Y122.34 E.00501
G1 X147.67 Y122.34 E.03875
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18740.631
G1 X149.67 Y122.34 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/45
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.96 I-.057 J-1.216 P1  F30000
G1 X144.314 Y122.589 Z.96
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.446272
G1 F3600
G1 X144.314 Y121.966 E.01281
G1 X144.925 Y121.966 E.01255
; LINE_WIDTH: 0.495262
G1 X145.197 Y121.99 E.00627
; LINE_WIDTH: 0.544252
G1 X145.469 Y122.015 E.00693
G1 X145.296 Y122.08 E.00467
; LINE_WIDTH: 0.498442
G1 X144.965 Y122.218 E.0083
; LINE_WIDTH: 0.472357
G1 X144.633 Y122.356 E.00784
; LINE_WIDTH: 0.446272
G1 X144.362 Y122.554 E.00689
; WIPE_START
G1 X144.314 Y121.966 E-.22413
G1 X144.925 Y121.966 E-.23204
G1 X145.197 Y121.99 E-.10383
G1 X145.469 Y122.015 E-.10383
G1 X145.296 Y122.08 E-.07007
G1 X145.233 Y122.106 E-.02611
; WIPE_END
G1 E-.04 F1800
G1 X142.654 Y125.411 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.537402
G1 F3600
G1 X142.937 Y125.274 E.00788
G1 X143.323 Y124.977 E.01217
G1 X143.613 Y124.601 E.01187
; LINE_WIDTH: 0.538652
G1 X143.772 Y124.293 E.00872
G1 X143.762 Y124.651 E.00899
; LINE_WIDTH: 0.537402
G1 X143.761 Y125.411 E.01902
G1 X142.714 Y125.411 E.0262
; WIPE_START
G1 X142.937 Y125.274 E-.09972
G1 X143.323 Y124.977 E-.1849
G1 X143.613 Y124.601 E-.18029
G1 X143.772 Y124.293 E-.13207
G1 X143.762 Y124.651 E-.13619
G1 X143.762 Y124.722 E-.02683
; WIPE_END
G1 E-.04 F1800
G1 X146.123 Y122.015 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.543772
G1 F3600
G1 X146.378 Y121.991 E.00648
; LINE_WIDTH: 0.496882
G1 X146.632 Y121.968 E.00589
; LINE_WIDTH: 0.449992
G1 X150.62 Y121.968 E.08271
G1 X150.62 Y122.5 E.01104
G1 X150.62 Y123.032 E.01104
G1 X147.759 Y123.032 E.05934
G1 X147.641 Y122.87 E.00416
G2 X146.895 Y122.3 I-1.97 J1.802 E.01959
; LINE_WIDTH: 0.496882
G1 X146.509 Y122.157 E.00947
; LINE_WIDTH: 0.543772
G1 X146.179 Y122.035 E.0089
; WIPE_START
G1 X146.378 Y121.991 E-.07723
G1 X146.632 Y121.968 E-.09718
G1 X148.173 Y121.968 E-.58559
; WIPE_END
G1 E-.04 F1800
G1 X143.891 Y123.186 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X143.892 Y121.588 E.03314
G1 X143.936 Y121.543 E.0013
G1 X151.044 Y121.543 E.14744
G1 X151.044 Y122.5 E.01984
G1 X151.044 Y123.457 E.01984
G1 X147.537 Y123.457 E.07274
G1 X147.336 Y123.166 E.00733
G2 X145.427 Y122.509 I-1.534 J1.354 E.0438
G1 X144.852 Y122.717 E.0127
G1 X144.476 Y122.997 E.00972
G1 X144.222 Y123.279 E.00787
; LINE_WIDTH: 0.492212
G1 X144.073 Y123.489 E.00588
; LINE_WIDTH: 0.534432
G1 X143.924 Y123.699 E.00641
G1 X143.907 Y123.443 E.0064
; LINE_WIDTH: 0.492212
G1 X143.895 Y123.246 E.0045
; WIPE_START
G1 X143.892 Y121.588 E-.62988
G1 X143.936 Y121.543 E-.0239
G1 X144.216 Y121.543 E-.10622
; WIPE_END
G1 E-.04 F1800
G1 X146.123 Y122.015 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.544252
G1 F3600
G1 X145.469 Y122.015 E.01659
; WIPE_START
G1 X146.123 Y122.015 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.517 Y122.653 Z1.08 F30000
G1 X117.193 Y124.442 Z1.08
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01033
G1 X118.225 Y125.151 E.01573
G1 X118.867 Y125.392 E.01422
G1 X119.385 Y125.481 E.01091
G1 X118.86 Y125.46 E.01091
G1 X118.574 Y125.501 E.00599
G1 X118.001 Y125.69 E.0125
G1 X117.552 Y126.022 E.01159
G1 X117.193 Y126.482 E.01209
G1 X117.193 Y124.502 E.04106
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522332
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.15201
G1 X117.592 Y125.363 E-.15199
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.746 Y130.423 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.513912
G1 F3600
G1 X116.309 Y130.117 E.01531
G1 X116.56 Y129.897 E.00795
G1 X116.872 Y129.493 E.0122
G3 X116.861 Y130.424 I-37.774 J.013 E.02223
G1 X115.806 Y130.423 E.02518
; WIPE_START
G1 X116.309 Y130.117 E-.22398
G1 X116.56 Y129.897 E-.12654
G1 X116.872 Y129.493 E-.19426
G1 X116.865 Y130.059 E-.21522
; WIPE_END
G1 E-.04 F1800
G1 X112.629 Y129.502 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.515732
G1 F3600
G1 X113.04 Y129.994 E.01536
G2 X113.713 Y130.4 I1.419 J-1.588 E.01893
; LINE_WIDTH: 0.502682
G1 X113.879 Y130.433 E.00395
; LINE_WIDTH: 0.463567
G1 X114.045 Y130.467 E.00362
; LINE_WIDTH: 0.470092
G1 X113.661 Y130.443 E.00835
; LINE_WIDTH: 0.515732
G2 X112.63 Y130.42 I-.714 J8.662 E.02473
G1 X112.629 Y129.562 E.02056
; WIPE_START
G1 X113.04 Y129.994 E-.22662
G1 X113.329 Y130.21 E-.137
G1 X113.713 Y130.4 E-.16289
G1 X113.879 Y130.433 E-.06435
G1 X114.045 Y130.467 E-.06435
G1 X113.77 Y130.45 E-.10479
; WIPE_END
G1 E-.04 F1800
G1 X111.249 Y123.246 Z1.08 F30000
G1 X110.818 Y122.011 Z1.08
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.537372
G1 F3600
G1 X110.985 Y121.99 E.00422
; LINE_WIDTH: 0.494159
G1 X111.153 Y121.968 E.00387
; LINE_WIDTH: 0.450946
G1 X111.32 Y121.947 E.00351
; LINE_WIDTH: 0.407732
G1 X111.903 Y121.947 E.0109
G1 X111.903 Y122.48 E.00997
G1 X111.584 Y122.291 E.00693
; LINE_WIDTH: 0.450946
G1 X111.328 Y122.198 E.00565
; LINE_WIDTH: 0.494159
G1 X111.073 Y122.105 E.00623
; LINE_WIDTH: 0.537372
G1 X110.874 Y122.032 E.0053
; WIPE_START
G1 X110.985 Y121.99 E-.04515
G1 X111.153 Y121.968 E-.06415
G1 X111.32 Y121.947 E-.06414
G1 X111.903 Y121.947 E-.22172
G1 X111.903 Y122.48 E-.20284
G1 X111.584 Y122.291 E-.14111
G1 X111.532 Y122.272 E-.0209
; WIPE_END
G1 E-.04 F1800
G1 X108.244 Y123.032 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X105.38 Y123.032 E.05939
G1 X105.38 Y121.968 E.02208
G1 X109.532 Y121.968 E.08613
; LINE_WIDTH: 0.493512
G1 X109.741 Y121.99 E.00479
; LINE_WIDTH: 0.537032
G1 X109.949 Y122.011 E.00523
G1 X109.749 Y122.072 E.00523
; LINE_WIDTH: 0.493512
G1 X109.548 Y122.133 E.00478
; LINE_WIDTH: 0.449992
G1 X109.033 Y122.343 E.01155
G2 X108.28 Y122.984 I1.135 J2.095 E.02067
G1 X108.514 Y123.384 F30000
G1 F3600
G1 X108.461 Y123.457 E.00185
G1 X104.956 Y123.457 E.07271
G1 X104.956 Y121.543 E.03968
G1 X109.712 Y121.544 E.09866
G3 X112.307 Y121.56 I1 J47.563 E.05381
G1 X112.307 Y123.479 E.0398
G1 X112.009 Y123.081 E.0103
G1 X111.476 Y122.683 E.01381
G2 X110.799 Y122.479 I-.939 J1.896 E.01472
G1 X110.208 Y122.457 E.01228
G1 X109.63 Y122.55 E.01214
G2 X108.716 Y123.117 I.58 J1.953 E.02258
G1 X108.55 Y123.336 E.00571
; WIPE_START
G1 X108.461 Y123.457 E-.05673
G1 X106.611 Y123.457 E-.70327
; WIPE_END
G1 E-.04 F1800
G1 X110.818 Y122.011 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.537372
G1 F3600
G1 X109.949 Y122.011 E.02174
; WIPE_START
G1 X110.818 Y122.011 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.853 Y123.671 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.721 Y123.881 E.00513
G1 X104.532 Y123.881 E.0869
G1 X104.532 Y121.119 E.05728
G1 X112.249 Y121.119 E.16007
G1 X112.493 Y121.158 E.00512
G1 X112.638 Y121.276 E.00388
G1 X112.731 Y121.518 E.00538
G1 X112.731 Y123.318 E.03735
; LINE_WIDTH: 0.465162
G1 X112.723 Y123.922 E.01296
; LINE_WIDTH: 0.492337
G1 X112.71 Y124.18 E.00591
; LINE_WIDTH: 0.519512
G1 X112.696 Y124.439 E.00625
M73 P60 R5
G1 X112.696 Y126.439 E.04828
; LINE_WIDTH: 0.518582
G1 X112.697 Y128.301 E.04486
; LINE_WIDTH: 0.550372
G1 X112.743 Y128.761 E.01186
G1 X112.786 Y128.846 E.00245
; LINE_WIDTH: 0.518177
G1 X112.829 Y128.932 E.0023
; LINE_WIDTH: 0.485982
G1 X113.103 Y129.394 E.01208
; LINE_WIDTH: 0.449992
G1 X113.537 Y129.804 E.01239
G1 X114.106 Y130.06 E.01293
G1 X114.559 Y130.119 E.00948
G1 X115.253 Y130.089 E.01442
G1 X115.762 Y129.923 E.01111
G1 X116.209 Y129.606 E.01135
G1 X116.564 Y129.128 E.01235
; LINE_WIDTH: 0.493892
G1 X116.671 Y128.896 E.00586
; LINE_WIDTH: 0.537792
G1 X116.777 Y128.663 E.00641
G1 X116.803 Y128.301 E.00909
; LINE_WIDTH: 0.526952
G2 X116.788 Y126.962 I-11.73 J-.54 E.03283
; LINE_WIDTH: 0.488472
G1 X116.769 Y126.596 E.00829
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.199 E.07047
G1 X116.909 Y123.459 E.00613
G1 X117.318 Y123.981 E.01374
G1 X117.798 Y124.408 E.01333
G1 X118.384 Y124.758 E.01417
G1 X118.945 Y124.975 E.01247
G2 X119.95 Y125.119 I1.028 J-3.582 E.02112
G1 X141.938 Y125.115 E.45609
G1 X142.107 Y125.091 E.00353
G1 X142.664 Y124.894 E.01227
G1 X142.988 Y124.65 E.0084
G1 X143.296 Y124.225 E.01088
G1 X143.433 Y123.798 E.00931
G1 X143.467 Y123.53 E.0056
G3 X143.494 Y121.385 I31.442 J-.67 E.0445
G1 X143.667 Y121.175 E.00563
G1 X143.88 Y121.119 E.00457
G1 X151.468 Y121.119 E.1574
G1 X151.468 Y122.5 E.02864
G1 X151.468 Y123.881 E.02864
G1 X147.282 Y123.881 E.08682
G1 X147.131 Y123.597 E.00666
G1 X146.739 Y123.193 E.01168
G1 X146.262 Y122.954 E.01106
G1 X145.767 Y122.889 E.01037
G1 X145.551 Y122.914 E.00451
G1 X145.071 Y123.08 E.01053
G1 X144.733 Y123.334 E.00877
G1 X144.584 Y123.5 E.00463
G1 X144.348 Y123.894 E.00953
G1 X144.231 Y124.439 E.01156
G3 X144.201 Y125.619 I-13.712 J.248 E.02449
G1 X144.103 Y125.761 E.00359
G1 X143.87 Y125.879 E.0054
G1 X118.854 Y125.885 E.51889
G1 X118.319 Y126.016 E.01143
G1 X118.114 Y126.121 E.00478
G1 X117.67 Y126.516 E.01232
; LINE_WIDTH: 0.452072
G1 X117.415 Y127.003 E.01145
; LINE_WIDTH: 0.485352
G1 X117.356 Y127.251 E.00573
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.499 E.00614
; LINE_WIDTH: 0.537792
G1 X117.285 Y128.708 E.03028
G1 X117.307 Y128.989 E.00707
; LINE_WIDTH: 0.493892
G1 X117.329 Y129.271 E.00646
; LINE_WIDTH: 0.449992
G3 X117.293 Y130.641 I-9.407 J.443 E.02846
G1 X117.154 Y130.803 E.00442
G1 X116.912 Y130.88 E.00528
G1 X114.912 Y130.879 E.04148
G3 X112.488 Y130.864 I-.761 J-72.81 E.05027
G1 X112.281 Y130.755 E.00486
G1 X112.173 Y130.51 E.00554
G1 X112.172 Y129.428 E.02245
; LINE_WIDTH: 0.484019
G1 X112.189 Y129.226 E.00455
; LINE_WIDTH: 0.518046
G1 X112.206 Y129.024 E.00488
; LINE_WIDTH: 0.552072
G2 X112.205 Y128.301 I-3.078 J-.358 E.01864
; LINE_WIDTH: 0.518652
G1 X112.204 Y126.301 E.0482
; LINE_WIDTH: 0.519512
G1 X112.202 Y124.439 E.04494
; LINE_WIDTH: 0.530282
G2 X112.103 Y124.059 I-.704 J-.02 E.00983
; LINE_WIDTH: 0.490137
G1 X112.014 Y123.819 E.00582
; LINE_WIDTH: 0.449992
G1 X111.732 Y123.402 E.01043
G1 X111.284 Y123.062 E.01166
G1 X110.783 Y122.903 E.01092
G1 X110.208 Y122.881 E.01194
G1 X109.711 Y122.966 E.01045
G2 X109.01 Y123.419 I.744 J1.92 E.01743
G1 X108.884 Y123.62 E.00492
M204 S250
G1 X109.191 Y123.875 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.133 Y123.949 E.00182
G1 X109.031 Y124.29 E.00686
G1 X104.908 Y124.29 E.07948
G1 F2250
G1 X104.784 Y124.29 E.00238
G1 F2700
G1 X104.661 Y124.29 E.00238
G1 F3150
G1 X104.537 Y124.29 E.00238
G1 F3600
G1 X104.413 Y124.29 E.00238
G1 F3150
G1 X104.29 Y124.29 E.00238
G1 F2700
G1 X104.166 Y124.29 E.00238
G1 F2250
G1 X104.122 Y124.29 E.00085
G1 X104.122 Y120.71 E.06901
G1 X104.219 Y120.71 E.00187
G1 F2700
G1 X104.491 Y120.71 E.00524
G1 F3150
G1 X104.763 Y120.71 E.00524
G1 F3600
G1 X105.035 Y120.71 E.00524
G1 F3150
G1 X105.307 Y120.71 E.00524
G1 F2700
G1 X105.579 Y120.71 E.00524
G1 F2250
G1 X105.851 Y120.71 E.00524
G1 F1800
G1 X112.122 Y120.71 E.12089
G3 X112.647 Y120.772 I.063 J1.728 E.01022
G1 X112.881 Y120.919 E.00534
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00724
G1 X113.14 Y128.301 E.13097
G1 X113.197 Y128.691 E.00761
G1 X113.366 Y129.063 E.00787
G1 X113.671 Y129.399 E.00875
G1 X114.106 Y129.635 E.00953
G1 X114.549 Y129.71 E.00867
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00784
G1 X115.847 Y129.385 E.00803
G1 X116.15 Y129.036 E.0089
G1 X116.321 Y128.621 E.00866
G1 X116.36 Y128.301 E.00621
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430582
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437832
G1 X116.786 Y122.087 E.00753
G1 X116.949 Y122.636 E.01153
; LINE_WIDTH: 0.419992
G1 X117.236 Y123.212 E.01239
G1 X117.594 Y123.679 E.01135
G1 X118.017 Y124.062 E.01099
G1 X118.538 Y124.379 E.01177
G2 X119.95 Y124.71 I1.523 J-3.315 E.02813
G1 X141.938 Y124.706 E.42384
G1 X142.366 Y124.59 E.00854
G1 X142.669 Y124.387 E.00704
G1 X142.938 Y124.02 E.00877
G1 X143.058 Y123.53 E.00972
G1 X143.058 Y121.588 E.03744
G1 X143.102 Y121.25 E.00657
G1 X143.237 Y121.005 E.00539
G3 X143.859 Y120.71 I.736 J.749 E.01351
G1 X150.188 Y120.71 E.122
G1 F2250
G1 X150.517 Y120.71 E.00635
G1 F2700
G1 X150.847 Y120.71 E.00635
G1 F3150
G1 X151.176 Y120.71 E.00635
G1 F3600
G1 X151.506 Y120.71 E.00635
G1 F3150
G1 X151.835 Y120.71 E.00635
G1 F2700
G1 X151.872 Y120.71 E.00072
G1 F2250
G1 X151.878 Y122.5 E.0345
G1 X151.878 Y124.29 E.0345
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.781 Y124.29 E.00187
G1 F2700
G1 X151.509 Y124.29 E.00524
G1 F3150
G1 X151.237 Y124.29 E.00524
G1 F3600
G1 X150.965 Y124.29 E.00524
G1 F3150
G1 X150.693 Y124.29 E.00524
G1 F2700
G1 X150.421 Y124.29 E.00524
G1 F2250
G1 X150.149 Y124.29 E.00524
G1 F1800
G1 X146.971 Y124.29 E.06127
G1 X146.946 Y124.141 E.00292
G1 X146.77 Y123.79 E.00756
G1 X146.464 Y123.495 E.0082
G1 X146.104 Y123.332 E.00762
G1 X145.741 Y123.297 E.00703
G1 X145.328 Y123.41 E.00825
G1 X144.981 Y123.659 E.00822
G1 X144.73 Y124.045 E.00886
G1 X144.64 Y124.44 E.00782
G3 X144.594 Y125.752 I-8.965 J.344 E.02533
G1 X144.475 Y125.976 E.0049
G1 X144.265 Y126.167 E.00547
G1 X143.895 Y126.288 E.0075
G1 X118.86 Y126.294 E.48255
G1 X118.433 Y126.409 E.00853
G1 X118.065 Y126.679 E.00878
G1 X117.844 Y127.016 E.00778
G1 X117.74 Y127.499 E.00953
G1 X117.736 Y130.414 E.05618
G1 X117.671 Y130.815 E.00783
G1 X117.497 Y131.066 E.00589
G1 X117.268 Y131.219 E.00531
G1 X116.957 Y131.29 E.00615
G1 X112.957 Y131.286 E.0771
G3 X112.236 Y131.221 I-.181 J-2.025 E.01403
G1 X111.985 Y131.047 E.0059
G1 X111.829 Y130.816 E.00537
G1 X111.764 Y130.562 E.00504
G1 X111.758 Y124.44 E.11802
G1 X111.683 Y124.082 E.00704
G1 X111.506 Y123.762 E.00705
G1 X111.194 Y123.478 E.00814
G1 X110.766 Y123.312 E.00884
G1 X110.215 Y123.29 E.01063
G1 X109.79 Y123.368 E.00834
G1 X109.395 Y123.608 E.0089
G1 X109.227 Y123.827 E.00532
; WIPE_START
M204 S10000
G1 X109.133 Y123.949 E-.05863
G1 X109.031 Y124.29 E-.13515
G1 X107.541 Y124.29 E-.56622
; WIPE_END
G1 E-.04
G1 X115.173 Y124.166 Z1.08 F30000
G1 X143.924 Y123.699 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.538652
G1 F3600
G1 X143.772 Y124.293 E.01535
; WIPE_START
G1 X143.924 Y123.699 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.311 Y124.252 Z1.08 F30000
G1 X119.385 Y125.481 Z1.08
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.409752
G1 F3600
G1 X119.891 Y125.501 E.0095
; LINE_WIDTH: 0.368512
G1 X119.95 Y125.502 E.00099
; LINE_WIDTH: 0.366752
G1 X121.938 Y125.501 E.03316
; LINE_WIDTH: 0.366562
G1 X125.938 Y125.501 E.06665
; LINE_WIDTH: 0.366382
G1 X129.938 Y125.5 E.06662
; LINE_WIDTH: 0.366202
G1 X133.938 Y125.499 E.06658
; LINE_WIDTH: 0.366022
G1 X137.938 Y125.498 E.06655
; LINE_WIDTH: 0.365842
G1 X141.938 Y125.497 E.06651
; LINE_WIDTH: 0.380732
G1 X142.11 Y125.49 E.00299
; WIPE_START
G1 X141.938 Y125.497 E-.06545
G1 X140.111 Y125.498 E-.69455
; WIPE_END
G1 E-.04 F1800
G1 X132.613 Y126.927 Z1.08 F30000
G1 X114.045 Y130.467 Z1.08
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.424452
G1 F3600
G1 X114.297 Y130.483 E.00492
; LINE_WIDTH: 0.392592
G1 X114.549 Y130.499 E.00453
; LINE_WIDTH: 0.369792
G1 X115.109 Y130.495 E.00942
; LINE_WIDTH: 0.384672
G1 X115.265 Y130.487 E.00274
; WIPE_START
G1 X115.109 Y130.495 E-.09729
G1 X114.549 Y130.499 E-.34866
G1 X114.297 Y130.483 E-.15702
G1 X114.045 Y130.467 E-.15702
; WIPE_END
G1 E-.04 F1800
G1 X109.687 Y124.201 Z1.08 F30000
G1 X108.393 Y122.34 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345891
G1 F18741.861
G1 X105.752 Y122.34 E.04133
G1 X105.752 Y122.66 E.00501
G1 X108.056 Y122.66 E.03605
G3 X108.348 Y122.38 I1.01 J.761 E.00636
; WIPE_START
G1 X108.056 Y122.66 E-.15385
G1 X106.461 Y122.66 E-.60615
; WIPE_END
G1 E-.04 F1800
G1 X114.093 Y122.601 Z1.08 F30000
G1 X147.611 Y122.34 Z1.08
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.345912
G1 F18740.631
G1 X147.931 Y122.66 E.00708
G1 X150.248 Y122.66 E.03627
G1 X150.248 Y122.34 E.00501
G1 X147.671 Y122.34 E.04033
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18740.631
G1 X149.671 Y122.34 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/45
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.08 I.085 J-1.214 P1  F30000
G1 X144.314 Y121.966 Z1.08
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.446282
G1 F3600
G1 X144.925 Y121.966 E.01257
; LINE_WIDTH: 0.495257
G1 X145.197 Y121.99 E.00627
; LINE_WIDTH: 0.544232
G1 X145.469 Y122.015 E.00692
G1 X145.297 Y122.08 E.00467
; LINE_WIDTH: 0.498512
G1 X144.965 Y122.218 E.00831
; LINE_WIDTH: 0.472397
G1 X144.633 Y122.356 E.00785
; LINE_WIDTH: 0.446282
G1 X144.314 Y122.589 E.00813
G1 X144.314 Y122.026 E.01158
; WIPE_START
G1 X144.925 Y121.966 E-.2334
M73 P61 R5
G1 X145.197 Y121.99 E-.10373
G1 X145.469 Y122.015 E-.10373
G1 X145.297 Y122.08 E-.06995
G1 X144.965 Y122.218 E-.13658
G1 X144.691 Y122.332 E-.11261
; WIPE_END
G1 E-.04 F1800
G1 X142.645 Y125.411 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.537962
G1 F3600
G1 X142.843 Y125.327 E.0054
G1 X143.318 Y124.98 E.01472
G1 X143.626 Y124.575 E.01274
; LINE_WIDTH: 0.537252
G1 X143.778 Y124.279 E.00832
G1 X143.762 Y124.62 E.00855
; LINE_WIDTH: 0.537962
G1 X143.761 Y125.411 E.0198
G1 X142.705 Y125.411 E.02645
; WIPE_START
G1 X142.843 Y125.327 E-.06159
G1 X143.318 Y124.98 E-.22338
G1 X143.626 Y124.575 E-.19336
G1 X143.778 Y124.279 E-.12649
G1 X143.762 Y124.62 E-.12987
G1 X143.762 Y124.687 E-.0253
; WIPE_END
G1 E-.04 F1800
G1 X146.123 Y122.015 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.543752
G1 F3600
G1 X146.378 Y121.991 E.00648
; LINE_WIDTH: 0.496872
G1 X146.632 Y121.968 E.00589
; LINE_WIDTH: 0.449992
G1 X150.712 Y121.968 E.08462
G1 X150.712 Y122.5 E.01104
G1 X150.712 Y123.032 E.01104
G1 X147.761 Y123.032 E.06121
G1 X147.64 Y122.866 E.00428
G2 X146.894 Y122.3 I-1.958 J1.804 E.01951
; LINE_WIDTH: 0.496872
G1 X146.509 Y122.157 E.00947
; LINE_WIDTH: 0.543752
G1 X146.179 Y122.035 E.0089
; WIPE_START
G1 X146.378 Y121.991 E-.07722
G1 X146.632 Y121.968 E-.09717
G1 X148.173 Y121.968 E-.58561
; WIPE_END
G1 E-.04 F1800
G1 X143.9 Y121.543 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X151.136 Y121.543 E.15008
G1 X151.136 Y122.5 E.01984
G1 X151.136 Y123.457 E.01984
G1 X147.534 Y123.457 E.07472
G1 X147.331 Y123.157 E.0075
G2 X145.427 Y122.509 I-1.528 J1.368 E.0436
G1 X144.852 Y122.717 E.0127
G1 X144.476 Y122.997 E.00972
G1 X144.221 Y123.279 E.00787
; LINE_WIDTH: 0.492282
G1 X144.073 Y123.489 E.00587
; LINE_WIDTH: 0.534572
G1 X143.924 Y123.699 E.0064
G1 X143.908 Y123.443 E.00639
; LINE_WIDTH: 0.492282
G1 X143.891 Y123.186 E.00586
; LINE_WIDTH: 0.449992
G3 X143.899 Y121.603 I59.699 J-.492 E.03283
; WIPE_START
G1 X145.899 Y121.587 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.123 Y122.015 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.544232
G1 F3600
G1 X145.469 Y122.015 E.01658
; WIPE_START
G1 X146.123 Y122.015 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.517 Y122.653 Z1.2 F30000
G1 X117.193 Y124.442 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01033
G1 X118.225 Y125.151 E.01572
G1 X118.867 Y125.392 E.01423
G1 X119.386 Y125.481 E.01092
G1 X118.86 Y125.461 E.01092
G1 X118.574 Y125.501 E.00599
G1 X118.001 Y125.69 E.0125
G1 X117.585 Y125.99 E.01063
G2 X117.193 Y126.485 I1.184 J1.338 E.01317
G1 X117.193 Y124.502 E.04113
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522292
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.152
G1 X117.623 Y125.416 E-.15199
G1 X117.592 Y125.363 E-.152
G1 X117.623 Y125.309 E-.152
G1 X117.685 Y125.309 E-.15199
; WIPE_END
G1 E-.04 F1800
G1 X115.746 Y130.423 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.513922
G1 F3600
G1 X116.309 Y130.117 E.01529
G1 X116.547 Y129.913 E.00749
G1 X116.872 Y129.491 E.01271
G1 X116.871 Y130.424 E.02226
G1 X115.806 Y130.423 E.02542
; WIPE_START
G1 X116.309 Y130.117 E-.22371
G1 X116.547 Y129.913 E-.11927
G1 X116.872 Y129.491 E-.20229
G1 X116.871 Y130.056 E-.21472
; WIPE_END
G1 E-.04 F1800
G1 X112.63 Y129.507 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.518012
G1 F3600
G2 X113.691 Y130.394 I1.86 J-1.148 E.03386
; LINE_WIDTH: 0.503032
G1 X113.849 Y130.428 E.00377
; LINE_WIDTH: 0.468762
G1 X114.007 Y130.462 E.0035
; LINE_WIDTH: 0.476252
G1 X113.662 Y130.44 E.00763
; LINE_WIDTH: 0.518012
G2 X112.631 Y130.419 I-.695 J8.524 E.02484
G1 X112.63 Y129.567 E.02049
; WIPE_START
G1 X112.812 Y129.76 E-.10063
G1 X113.051 Y129.999 E-.12832
G1 X113.361 Y130.235 E-.14799
G1 X113.691 Y130.394 E-.13947
G1 X113.849 Y130.428 E-.06144
G1 X114.007 Y130.462 E-.06144
G1 X113.69 Y130.442 E-.12071
; WIPE_END
G1 E-.04 F1800
G1 X111.228 Y123.218 Z1.2 F30000
G1 X110.817 Y122.011 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.537292
G1 F3600
G1 X110.985 Y121.99 E.00422
; LINE_WIDTH: 0.494109
G1 X111.152 Y121.968 E.00387
; LINE_WIDTH: 0.450926
G1 X111.32 Y121.947 E.00351
; LINE_WIDTH: 0.407742
G1 X111.903 Y121.947 E.0109
G1 X111.903 Y122.481 E.00997
G1 X111.584 Y122.291 E.00693
; LINE_WIDTH: 0.450926
G1 X111.329 Y122.198 E.00566
; LINE_WIDTH: 0.494109
G1 X111.073 Y122.105 E.00623
; LINE_WIDTH: 0.537292
G1 X110.874 Y122.032 E.0053
; WIPE_START
G1 X110.985 Y121.99 E-.04516
G1 X111.152 Y121.968 E-.06417
G1 X111.32 Y121.947 E-.06417
G1 X111.903 Y121.947 E-.22179
G1 X111.903 Y122.481 E-.20285
G1 X111.584 Y122.291 E-.14102
G1 X111.533 Y122.273 E-.02085
; WIPE_END
G1 E-.04 F1800
G1 X108.243 Y123.032 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X105.288 Y123.032 E.06129
G1 X105.288 Y121.968 E.02208
G1 X109.118 Y121.968 E.07944
; LINE_WIDTH: 0.496166
G1 X109.288 Y121.991 E.00394
; LINE_WIDTH: 0.542339
G1 X109.458 Y122.014 E.00432
; LINE_WIDTH: 0.588512
G1 X109.627 Y122.037 E.00471
G1 X109.376 Y122.17 E.00783
; LINE_WIDTH: 0.542339
G1 X109.124 Y122.303 E.00719
; LINE_WIDTH: 0.496166
G1 X108.873 Y122.436 E.00654
; LINE_WIDTH: 0.449992
G1 X108.454 Y122.78 E.01123
G1 X108.281 Y122.986 E.00559
G1 X108.505 Y123.412 F30000
G1 F3600
G1 X108.471 Y123.457 E.00117
G1 X104.864 Y123.457 E.07481
G1 X104.864 Y121.543 E.03968
G1 X109.712 Y121.544 E.10057
G3 X112.307 Y121.56 I1 J48.308 E.05381
G1 X112.307 Y123.478 E.03978
G1 X112.009 Y123.081 E.01028
G2 X110.799 Y122.479 I-1.463 J1.423 E.02858
G2 X109.726 Y122.521 I-.407 J3.334 E.02236
G2 X108.78 Y123.052 I.619 J2.213 E.02273
G1 X108.541 Y123.364 E.00815
; WIPE_START
G1 X108.471 Y123.457 E-.04417
G1 X106.587 Y123.457 E-.71583
; WIPE_END
G1 E-.04 F1800
G1 X110.817 Y122.011 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.537292
G1 F3600
G1 X110.207 Y122 E.01526
; LINE_WIDTH: 0.551492
G1 X109.917 Y122.019 E.00747
; LINE_WIDTH: 0.588512
G1 X109.627 Y122.037 E.008
; WIPE_START
G1 X109.917 Y122.019 E-.18541
G1 X110.207 Y122 E-.18541
G1 X110.817 Y122.011 E-.38918
; WIPE_END
G1 E-.04 F1800
G1 X108.82 Y123.694 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.725 Y123.881 E.00435
G1 X104.44 Y123.881 E.08888
G1 X104.44 Y121.119 E.05728
G1 X112.25 Y121.119 E.162
G1 X112.492 Y121.158 E.00509
G1 X112.639 Y121.276 E.0039
G1 X112.731 Y121.518 E.00536
G1 X112.731 Y123.315 E.03728
; LINE_WIDTH: 0.464002
G1 X112.724 Y123.913 E.01282
; LINE_WIDTH: 0.491757
G1 X112.71 Y124.176 E.006
; LINE_WIDTH: 0.519512
G1 X112.696 Y124.439 E.00636
G1 X112.696 Y126.439 E.04828
; LINE_WIDTH: 0.518672
G1 X112.697 Y128.301 E.04486
; LINE_WIDTH: 0.550792
G1 X112.744 Y128.762 E.01191
G1 X112.79 Y128.851 E.00258
; LINE_WIDTH: 0.516492
G1 X112.836 Y128.941 E.00241
; LINE_WIDTH: 0.482192
G1 X113.136 Y129.436 E.01293
; LINE_WIDTH: 0.449992
G1 X113.568 Y129.826 E.01208
G1 X114.074 Y130.05 E.01147
G1 X114.559 Y130.119 E.01017
G1 X115.253 Y130.089 E.01442
G1 X115.763 Y129.923 E.01111
G1 X116.201 Y129.615 E.01112
G1 X116.538 Y129.175 E.01148
; LINE_WIDTH: 0.493882
G1 X116.657 Y128.919 E.00647
; LINE_WIDTH: 0.537772
G1 X116.777 Y128.663 E.00708
G1 X116.803 Y128.301 E.00909
; LINE_WIDTH: 0.526932
G2 X116.788 Y126.955 I-12.014 J-.541 E.033
; LINE_WIDTH: 0.488462
G1 X116.769 Y126.581 E.00846
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.196 E.07022
G1 X116.92 Y123.476 E.0066
G1 X117.318 Y123.981 E.01332
G1 X117.798 Y124.408 E.01333
G1 X118.384 Y124.758 E.01416
G1 X118.945 Y124.975 E.01247
G2 X119.95 Y125.119 I1.028 J-3.584 E.02112
G1 X141.878 Y125.119 E.45485
G1 X142.012 Y125.104 E.00279
G1 X142.587 Y124.935 E.01245
G1 X142.975 Y124.661 E.00985
G1 X143.302 Y124.213 E.01148
G2 X143.467 Y123.53 I-1.792 J-.795 E.01466
G1 X143.467 Y121.597 E.0401
G1 X143.5 Y121.371 E.00473
G1 X143.672 Y121.172 E.00545
G1 X143.875 Y121.119 E.00435
G1 X151.56 Y121.119 E.1594
G1 X151.56 Y122.5 E.02864
G1 X151.56 Y123.881 E.02864
G1 X147.282 Y123.881 E.08873
G1 X147.114 Y123.574 E.00727
G1 X146.734 Y123.188 E.01122
G1 X146.262 Y122.954 E.01093
G1 X145.767 Y122.889 E.01036
G1 X145.551 Y122.914 E.0045
G1 X145.072 Y123.08 E.01053
G1 X144.733 Y123.334 E.00878
G1 X144.583 Y123.5 E.00463
G1 X144.348 Y123.894 E.00952
G1 X144.231 Y124.439 E.01157
G3 X144.201 Y125.619 I-13.063 J.263 E.02449
G1 X144.102 Y125.762 E.00361
G1 X143.87 Y125.879 E.00538
G1 X118.854 Y125.885 E.51889
G1 X118.3 Y126.022 E.01184
G1 X117.841 Y126.328 E.01143
G1 X117.5 Y126.794 E.01199
; LINE_WIDTH: 0.452172
G1 X117.415 Y127.003 E.00471
; LINE_WIDTH: 0.485402
G1 X117.356 Y127.251 E.00572
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.499 E.00614
; LINE_WIDTH: 0.537772
G1 X117.285 Y128.708 E.03027
G1 X117.307 Y129.019 E.00781
; LINE_WIDTH: 0.493882
G1 X117.328 Y129.33 E.00714
; LINE_WIDTH: 0.449992
G3 X117.298 Y130.636 I-13.528 J.335 E.02711
G1 X117.186 Y130.779 E.00376
G1 X116.952 Y130.88 E.00529
G1 X112.952 Y130.877 E.08297
G3 X112.401 Y130.841 I-.167 J-1.683 E.01149
G1 X112.263 Y130.727 E.00373
G1 X112.173 Y130.496 E.00515
G1 X112.172 Y129.479 E.02109
; LINE_WIDTH: 0.483592
G1 X112.188 Y129.253 E.00506
; LINE_WIDTH: 0.517192
G1 X112.205 Y129.028 E.00543
; LINE_WIDTH: 0.550792
G2 X112.205 Y128.301 I-3.377 J-.362 E.0187
; LINE_WIDTH: 0.518732
G1 X112.203 Y126.301 E.04821
; LINE_WIDTH: 0.519512
G1 X112.202 Y124.439 E.04494
; LINE_WIDTH: 0.530562
G2 X112.101 Y124.054 I-.711 J-.019 E.00996
; LINE_WIDTH: 0.490277
G1 X112.011 Y123.811 E.00589
; LINE_WIDTH: 0.449992
G1 X111.732 Y123.402 E.01026
G1 X111.285 Y123.063 E.01166
G1 X110.782 Y122.903 E.01093
G1 X110.231 Y122.881 E.01144
G1 X109.786 Y122.941 E.00932
G1 X109.279 Y123.181 E.01162
G2 X108.866 Y123.629 I1.169 J1.496 E.0127
G1 X108.854 Y123.645 E.00041
M204 S250
G1 X109.29 Y123.75 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.17 Y123.885 E.00348
G1 X109.016 Y124.286 E.00829
G3 X104.564 Y124.29 I-3.405 J-1418.863 E.08582
G1 F2250
G1 X104.47 Y124.29 E.00181
G1 F2700
G1 X104.376 Y124.29 E.00181
G1 F3150
G1 X104.282 Y124.29 E.00181
G1 F3600
G1 X104.188 Y124.29 E.00181
G1 F3150
G1 X104.094 Y124.29 E.00181
G1 F2700
G1 X104.031 Y124.29 E.00122
G1 X104.031 Y120.71 E.06901
G1 X104.233 Y120.71 E.0039
G1 F3150
G1 X104.533 Y120.71 E.00577
G1 F3600
G1 X104.832 Y120.71 E.00577
G1 F3150
G1 X105.132 Y120.71 E.00577
G1 F2700
G1 X105.431 Y120.71 E.00577
G1 F2250
G1 X105.731 Y120.71 E.00577
G1 F1800
G1 X112.031 Y120.71 E.12143
G3 X112.647 Y120.771 I.11 J2.023 E.01198
G1 X112.881 Y120.92 E.00535
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00724
G1 X113.14 Y128.301 E.13097
G1 X113.198 Y128.693 E.00764
G1 X113.388 Y129.095 E.00858
G1 X113.664 Y129.385 E.00772
G1 X114.081 Y129.627 E.00929
G1 X114.549 Y129.71 E.00917
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.386 E.00801
G1 X116.125 Y129.076 E.00802
G1 X116.32 Y128.624 E.00949
G1 X116.36 Y128.301 E.00627
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430592
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437842
G1 X116.786 Y122.088 E.00753
G1 X116.949 Y122.636 E.01153
; LINE_WIDTH: 0.419992
G1 X117.246 Y123.228 E.01276
G1 X117.594 Y123.679 E.01098
G1 X118.017 Y124.062 E.01099
G1 X118.538 Y124.378 E.01176
G2 X119.949 Y124.71 I1.524 J-3.316 E.02813
G1 X141.878 Y124.71 E.42268
G1 X142.3 Y124.619 E.00831
G1 X142.64 Y124.412 E.00767
G1 X142.938 Y124.026 E.0094
G1 X143.058 Y123.53 E.00984
G1 X143.058 Y121.597 E.03727
G1 X143.11 Y121.226 E.00721
G1 X143.252 Y120.986 E.00537
G1 X143.469 Y120.81 E.00538
G1 X143.857 Y120.71 E.00772
G1 X151.874 Y120.71 E.15453
G1 F2250
G1 X151.891 Y120.71 E.00032
G1 F2700
G1 X151.908 Y120.71 E.00032
G1 F3150
G1 X151.924 Y120.71 E.00032
G1 F3600
G1 X151.941 Y120.71 E.00032
G1 F3150
G1 X151.958 Y120.71 E.00032
G1 F2700
G1 X151.969 Y122.5 E.0345
G1 X151.969 Y124.29 E.0345
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.767 Y124.29 E.0039
G1 F3150
G1 X151.467 Y124.29 E.00577
G1 F3600
G1 X151.168 Y124.29 E.00577
G1 F3150
G1 X150.868 Y124.29 E.00577
G1 F2700
G1 X150.569 Y124.29 E.00577
G1 F2250
G1 X150.269 Y124.29 E.00577
G1 F1800
G1 X146.971 Y124.29 E.06357
G1 X146.946 Y124.141 E.00292
G1 X146.755 Y123.77 E.00803
G1 X146.462 Y123.494 E.00777
G1 X146.104 Y123.332 E.00758
G1 X145.741 Y123.297 E.00702
G1 X145.328 Y123.41 E.00825
G1 X144.981 Y123.659 E.00823
G1 X144.73 Y124.045 E.00886
G1 X144.64 Y124.44 E.00782
G3 X144.594 Y125.752 I-8.955 J.343 E.02533
G1 X144.474 Y125.977 E.0049
G1 X144.269 Y126.164 E.00536
G1 X143.895 Y126.288 E.0076
G1 X118.86 Y126.294 E.48255
G1 X118.433 Y126.41 E.00853
M73 P62 R5
G1 X118.089 Y126.654 E.00813
G1 X117.845 Y127.014 E.00838
G1 X117.74 Y127.499 E.00957
G1 X117.736 Y130.436 E.05661
G1 X117.68 Y130.794 E.00699
G1 X117.547 Y131.013 E.00493
G1 X117.331 Y131.188 E.00537
G1 X116.972 Y131.29 E.0072
G1 X112.972 Y131.286 E.0771
G3 X112.233 Y131.221 I-.176 J-2.197 E.01436
G3 X111.763 Y130.553 I.398 J-.779 E.01638
G1 X111.758 Y124.44 E.11783
G1 X111.681 Y124.076 E.00716
G1 X111.506 Y123.762 E.00694
G1 X111.194 Y123.479 E.00813
G1 X110.766 Y123.312 E.00885
G1 X110.215 Y123.29 E.01063
G1 X109.859 Y123.344 E.00694
G1 X109.476 Y123.54 E.00831
G1 X109.33 Y123.705 E.00424
; WIPE_START
M204 S10000
G1 X109.17 Y123.885 E-.09145
G1 X109.016 Y124.286 E-.16343
G1 X107.687 Y124.287 E-.50512
; WIPE_END
G1 E-.04
G1 X115.318 Y124.163 Z1.2 F30000
G1 X143.924 Y123.699 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.534572
G1 F3600
G1 X143.778 Y124.279 E.01487
; WIPE_START
G1 X143.924 Y123.699 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.311 Y124.252 Z1.2 F30000
G1 X119.386 Y125.481 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.409732
G1 F3600
G1 X119.891 Y125.501 E.00949
; LINE_WIDTH: 0.368532
G1 X119.95 Y125.502 E.00098
; LINE_WIDTH: 0.366772
G1 X121.878 Y125.502 E.03216
; LINE_WIDTH: 0.366362
G1 X123.878 Y125.501 E.03331
; LINE_WIDTH: 0.365952
G1 X125.878 Y125.501 E.03327
; LINE_WIDTH: 0.365532
G1 X127.878 Y125.501 E.03323
; LINE_WIDTH: 0.365122
G1 X129.878 Y125.501 E.03319
; LINE_WIDTH: 0.364702
G1 X131.878 Y125.5 E.03314
; LINE_WIDTH: 0.364282
G1 X133.878 Y125.5 E.0331
; LINE_WIDTH: 0.363872
G1 X135.878 Y125.5 E.03306
; LINE_WIDTH: 0.363452
G1 X137.878 Y125.5 E.03302
; LINE_WIDTH: 0.363042
G1 X139.878 Y125.499 E.03298
; LINE_WIDTH: 0.362622
G1 X141.878 Y125.499 E.03294
; LINE_WIDTH: 0.377152
G1 X142.05 Y125.492 E.00296
; WIPE_START
G1 X141.878 Y125.499 E-.06541
G1 X140.05 Y125.499 E-.69459
; WIPE_END
G1 E-.04 F1800
G1 X132.553 Y126.928 Z1.2 F30000
G1 X114.007 Y130.462 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.434492
G1 F3600
G1 X114.278 Y130.48 E.00542
; LINE_WIDTH: 0.397612
G1 X114.549 Y130.499 E.00493
; LINE_WIDTH: 0.369792
G1 X115.109 Y130.495 E.00942
; LINE_WIDTH: 0.384672
G1 X115.265 Y130.487 E.00274
; WIPE_START
G1 X115.109 Y130.495 E-.09436
G1 X114.549 Y130.499 E-.33814
G1 X114.278 Y130.48 E-.16375
G1 X114.007 Y130.462 E-.16375
; WIPE_END
G1 E-.04 F1800
G1 X109.068 Y124.643 Z1.2 F30000
G1 X107.504 Y122.8 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X108.105 Y122.2 E.01638
G1 X107.547 Y122.2
G1 X106.947 Y122.8 E.01638
G1 X106.389 Y122.8
G1 X106.99 Y122.2 E.01638
G1 X106.432 Y122.2
G1 X105.831 Y122.8 E.01638
; WIPE_START
M204 S10000
G1 X106.432 Y122.2 E-.3229
G1 X106.99 Y122.2 E-.21186
G1 X106.571 Y122.619 E-.22524
; WIPE_END
G1 E-.04
G1 X108.18 Y122.18 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.234951
G1 F21000
G1 X108.255 Y122.234 E.00095
; LINE_WIDTH: 0.280371
G1 X108.33 Y122.287 E.00115
; LINE_WIDTH: 0.322676
G1 F20207.237
G1 X108.406 Y122.341 E.00134
G1 X108.338 Y122.433 E.00165
; LINE_WIDTH: 0.282454
G1 F21000
G2 X107.961 Y122.82 I1.98 J2.307 E.00679
; WIPE_START
G1 X108.338 Y122.433 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.67 Y122.18 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.0870382
G1 F21000
G1 X105.67 Y122.82 E.00192
; WIPE_START
G1 X105.67 Y122.18 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.302 Y122.287 Z1.2 F30000
G1 X149.877 Y122.8 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X150.341 Y122.337 E.01264
G1 X149.92 Y122.2
G1 X149.32 Y122.8 E.01638
G1 X148.762 Y122.8
G1 X149.363 Y122.2 E.01638
G1 X148.805 Y122.2
G1 X148.204 Y122.8 E.01638
G1 X147.773 Y122.674
G1 X148.248 Y122.2 E.01294
; CHANGE_LAYER
; Z_HEIGHT: 0.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X147.773 Y122.674 E-.25514
G1 X148.204 Y122.8 E-.1708
G1 X148.805 Y122.2 E-.32292
G1 X148.835 Y122.2 E-.01115
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 7/45
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.2 I-.045 J-1.216 P1  F30000
G1 X104.961 Y123.821 Z1.2
G1 Z.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.569402
G1 F3600
G1 X104.417 Y123.821 E.01445
G1 X104.417 Y121.179 E.07023
G1 X104.961 Y121.179 E.01445
G1 X104.961 Y121.451 E.00723
G1 X104.961 Y123.761 E.06141
M204 S250
G1 X105.43 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X105.184 Y124.29 E.00474
G1 F2250
G1 X104.938 Y124.29 E.00474
G1 F2700
G1 X104.692 Y124.29 E.00474
G1 F3150
G1 X104.447 Y124.29 E.00474
G1 F3600
G1 X104.201 Y124.29 E.00474
G1 F3150
G1 X103.955 Y124.29 E.00474
G1 F2700
G1 X103.955 Y120.71 E.06901
G1 F3150
G1 X104.201 Y120.71 E.00474
G1 F3600
G1 X104.447 Y120.71 E.00474
G1 F3150
G1 X104.692 Y120.71 E.00474
G1 F2700
G1 X104.938 Y120.71 E.00474
G1 F2250
G1 X105.184 Y120.71 E.00474
G1 F1800
G1 X105.43 Y120.71 E.00474
G1 X105.43 Y121.451 E.01428
G1 X105.43 Y124.23 E.05357
; WIPE_START
M204 S10000
G1 X105.184 Y124.29 E-.09615
G1 X104.938 Y124.29 E-.09341
G1 X104.692 Y124.29 E-.09341
G1 X104.447 Y124.29 E-.09341
G1 X104.201 Y124.29 E-.09341
G1 X103.955 Y124.29 E-.09341
G1 X103.955 Y123.772 E-.19679
; WIPE_END
G1 E-.04
G1 X111.584 Y123.547 Z1.32 F30000
G1 X144.316 Y122.581 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.446932
G1 F3600
G1 X144.317 Y121.967 E.01265
; LINE_WIDTH: 0.454442
G1 X144.978 Y121.97 E.01386
; LINE_WIDTH: 0.491406
G1 X145.102 Y121.989 E.00284
; LINE_WIDTH: 0.528369
G1 X145.225 Y122.007 E.00307
; LINE_WIDTH: 0.565332
G1 X145.349 Y122.026 E.00329
G1 X145.131 Y122.127 E.00633
; LINE_WIDTH: 0.525866
G1 X144.914 Y122.228 E.00587
; LINE_WIDTH: 0.486399
G1 X144.696 Y122.33 E.0054
; LINE_WIDTH: 0.446932
G1 X144.366 Y122.548 E.00815
; WIPE_START
G1 X144.317 Y121.967 E-.22167
G1 X144.978 Y121.97 E-.25122
G1 X145.102 Y121.989 E-.04745
G1 X145.225 Y122.007 E-.04746
G1 X145.349 Y122.026 E-.04746
G1 X145.131 Y122.127 E-.09117
G1 X145.003 Y122.187 E-.05358
; WIPE_END
G1 E-.04 F1800
G1 X146.426 Y122.044 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.602932
G1 F3600
G1 X146.605 Y122.027 E.00509
; LINE_WIDTH: 0.568847
G1 X146.785 Y122.01 E.00479
; LINE_WIDTH: 0.534762
G1 X147.633 Y122.007 E.02111
; LINE_WIDTH: 0.528032
G1 X147.633 Y122.258 E.00617
G1 X147.633 Y122.827 E.01398
G1 X147.219 Y122.449 E.01379
; LINE_WIDTH: 0.565482
G1 X146.822 Y122.247 E.01174
; LINE_WIDTH: 0.602932
G1 X146.479 Y122.072 E.01087
; WIPE_START
G1 X146.605 Y122.027 E-.05083
G1 X146.785 Y122.01 E-.06857
G1 X147.633 Y122.007 E-.32233
G1 X147.633 Y122.258 E-.09544
G1 X147.633 Y122.827 E-.21629
G1 X147.62 Y122.816 E-.00654
; WIPE_END
G1 E-.04 F1800
G1 X143.869 Y123.902 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.497012
G1 F3600
G1 X143.892 Y123.358 E.01255
; LINE_WIDTH: 0.449992
G3 X143.903 Y121.544 I75.96 J-.435 E.03762
G1 X148.096 Y121.544 E.08698
G1 X148.096 Y122.258 E.01482
G1 X148.096 Y123.457 E.02486
G1 X147.531 Y123.457 E.01172
G1 X147.206 Y123.035 E.01105
G2 X145.432 Y122.5 I-1.424 J1.515 E.03983
G1 X144.815 Y122.741 E.01375
G1 X144.336 Y123.135 E.01286
G1 X144.126 Y123.415 E.00725
; LINE_WIDTH: 0.497012
G1 X143.897 Y123.849 E.01131
; WIPE_START
G1 X143.892 Y123.358 E-.18672
G1 X143.901 Y121.849 E-.57328
; WIPE_END
G1 E-.04 F1800
G1 X146.426 Y122.044 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.602932
G1 F3600
G1 X146.139 Y122.025 E.00812
; LINE_WIDTH: 0.564432
G1 X145.851 Y122.006 E.00758
; LINE_WIDTH: 0.565332
G1 X145.349 Y122.026 E.01327
; WIPE_START
G1 X145.851 Y122.006 E-.35454
G1 X146.139 Y122.025 E-.20273
G1 X146.426 Y122.044 E-.20273
; WIPE_END
G1 E-.04 F1800
G1 X142.638 Y125.412 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.536482
G1 F3600
G1 X142.856 Y125.318 E.00593
G1 X143.321 Y124.978 E.01438
G1 X143.65 Y124.533 E.01382
; LINE_WIDTH: 0.535372
G1 X143.783 Y124.27 E.00732
G1 X143.762 Y124.568 E.00744
; LINE_WIDTH: 0.536482
G1 X143.758 Y125.412 E.02106
G1 X142.698 Y125.412 E.02647
; WIPE_START
G1 X142.856 Y125.318 E-.06993
G1 X143.321 Y124.978 E-.2189
G1 X143.65 Y124.533 E-.21029
G1 X143.783 Y124.27 E-.11164
G1 X143.762 Y124.568 E-.11341
G1 X143.762 Y124.662 E-.03583
; WIPE_END
G1 E-.04 F1800
G1 X136.129 Y124.6 Z1.32 F30000
G1 X117.193 Y124.444 Z1.32
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.465 Y124.684 E.00751
G1 X118.225 Y125.151 E.01851
G1 X118.867 Y125.392 E.01422
G1 X119.386 Y125.481 E.01092
G1 X118.86 Y125.461 E.01092
G1 X118.574 Y125.501 E.00599
G1 X117.983 Y125.7 E.01292
G1 X117.61 Y125.966 E.00952
G2 X117.193 Y126.487 I1.24 J1.419 E.0139
G1 X117.193 Y124.504 E.04113
G1 X117.686 Y125.307 F30000
; LINE_WIDTH: 0.523952
G1 F3600
G2 X117.717 Y125.361 I-.027 J.052 E.00734
; WIPE_START
G1 X117.686 Y125.415 E-.15201
G1 X117.624 Y125.415 E-.152
G1 X117.592 Y125.361 E-.152
G1 X117.624 Y125.307 E-.15201
G1 X117.686 Y125.307 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.746 Y130.424 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.514942
G1 F3600
G1 X116.309 Y130.118 E.01534
G1 X116.557 Y129.901 E.00788
G1 X116.874 Y129.49 E.0124
G3 X116.871 Y130.421 I-141.977 J.066 E.02227
G3 X115.806 Y130.424 I-.689 J-52.016 E.02549
; WIPE_START
G1 X116.309 Y130.118 E-.22405
G1 X116.557 Y129.901 E-.12525
G1 X116.874 Y129.49 E-.19701
G1 X116.872 Y130.052 E-.21369
; WIPE_END
G1 E-.04 F1800
G1 X112.629 Y129.497 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.521572
G1 F3600
G1 X112.674 Y129.579 E.00226
G1 X113.042 Y129.987 E.01333
G1 X113.472 Y130.301 E.01291
G1 X113.806 Y130.434 E.0087
; LINE_WIDTH: 0.492892
G1 X113.951 Y130.454 E.00334
; LINE_WIDTH: 0.453842
G1 X114.095 Y130.474 E.00306
; LINE_WIDTH: 0.450386
G1 X113.879 Y130.456 E.0045
; LINE_WIDTH: 0.485979
G1 X113.663 Y130.438 E.00488
; LINE_WIDTH: 0.521572
G1 X113.447 Y130.421 E.00526
G1 X112.629 Y130.418 E.01982
G1 X112.629 Y129.557 E.02086
; WIPE_START
G1 X112.674 Y129.579 E-.01891
G1 X113.042 Y129.987 E-.20888
G1 X113.472 Y130.301 E-.2024
G1 X113.806 Y130.434 E-.13635
G1 X113.951 Y130.454 E-.05559
G1 X114.095 Y130.474 E-.05559
G1 X113.88 Y130.456 E-.08227
; WIPE_END
G1 E-.04 F1800
G1 X111.347 Y123.256 Z1.32 F30000
G1 X110.912 Y122.019 Z1.32
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.551932
G1 F3600
G1 X111.041 Y121.995 E.00338
; LINE_WIDTH: 0.504606
G1 X111.17 Y121.971 E.00308
; LINE_WIDTH: 0.457279
G1 X111.3 Y121.948 E.00277
; LINE_WIDTH: 0.409952
G1 X111.904 Y121.946 E.01136
; LINE_WIDTH: 0.406332
G1 X111.904 Y122.485 E.01004
G1 X111.625 Y122.305 E.00618
; LINE_WIDTH: 0.454866
G1 X111.387 Y122.209 E.00537
; LINE_WIDTH: 0.503399
G1 X111.15 Y122.114 E.00598
; LINE_WIDTH: 0.551932
G1 X110.968 Y122.041 E.00505
; WIPE_START
G1 X111.041 Y121.995 E-.03295
G1 X111.17 Y121.971 E-.04992
G1 X111.3 Y121.948 E-.04992
G1 X111.904 Y121.946 E-.22972
G1 X111.904 Y122.485 E-.20495
G1 X111.625 Y122.305 E-.12626
G1 X111.463 Y122.24 E-.0663
; WIPE_END
G1 E-.04 F1800
G1 X108.367 Y122.828 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.528432
G1 F3600
G1 X108.367 Y122.007 E.02017
G1 X109.209 Y122.007 E.02069
; LINE_WIDTH: 0.548192
G1 X109.799 Y122.017 E.01507
G1 X109.24 Y122.198 E.015
; LINE_WIDTH: 0.528432
G1 X108.777 Y122.453 E.01301
G1 X108.411 Y122.787 E.01216
G1 X108.47 Y123.457 F30000
; LINE_WIDTH: 0.449992
G1 F3600
G1 X107.904 Y123.457 E.01174
G1 X107.904 Y121.543 E.03968
G1 X109.714 Y121.544 E.03755
G3 X112.307 Y121.56 I.999 J48.094 E.05379
G1 X112.307 Y123.479 E.0398
G2 X111.185 Y122.568 I-1.752 J1.012 E.03064
G1 X110.559 Y122.457 E.01319
G1 X109.881 Y122.483 E.01408
G1 X109.389 Y122.637 E.01069
G2 X108.791 Y123.038 I.818 J1.862 E.01501
G1 X108.506 Y123.409 E.0097
; WIPE_START
G1 X107.904 Y123.457 E-.22971
G1 X107.904 Y122.061 E-.53029
; WIPE_END
G1 E-.04 F1800
G1 X110.912 Y122.019 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.551932
G1 F3600
G1 X110.55 Y122 E.00933
; LINE_WIDTH: 0.548192
G1 X109.799 Y122.017 E.01918
; WIPE_START
G1 X110.55 Y122 E-.51254
G1 X110.912 Y122.019 E-.24746
; WIPE_END
G1 E-.04 F1800
G1 X108.769 Y123.795 Z1.32 F30000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.721 Y123.881 E.00204
G1 X107.479 Y123.881 E.02575
G1 X107.479 Y121.119 E.05728
G1 X112.251 Y121.119 E.09897
G1 X112.492 Y121.158 E.00508
G1 X112.639 Y121.276 E.0039
G1 X112.731 Y121.518 E.00537
G1 X112.731 Y123.166 E.03418
; LINE_WIDTH: 0.451932
G1 X112.73 Y123.884 E.01497
; LINE_WIDTH: 0.485397
G1 X112.713 Y124.177 E.00659
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00707
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.557622
G1 X112.751 Y128.803 E.01313
G1 X112.86 Y128.987 E.00557
; LINE_WIDTH: 0.521746
G1 X112.968 Y129.172 E.0052
; LINE_WIDTH: 0.485869
G1 X113.077 Y129.357 E.00482
; LINE_WIDTH: 0.449992
G1 X113.5 Y129.779 E.01239
G1 X113.986 Y130.025 E.01131
G1 X114.559 Y130.119 E.01205
G1 X115.253 Y130.089 E.01442
G1 X115.762 Y129.923 E.01111
G1 X116.207 Y129.608 E.0113
G1 X116.56 Y129.136 E.01221
; LINE_WIDTH: 0.494212
G1 X116.669 Y128.899 E.00598
; LINE_WIDTH: 0.538432
G1 X116.778 Y128.662 E.00654
G1 X116.804 Y128.301 E.00909
; LINE_WIDTH: 0.526952
G2 X116.788 Y126.949 I-12.29 J-.539 E.03315
; LINE_WIDTH: 0.488472
G1 X116.769 Y126.57 E.00858
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.215 E.06959
G1 X116.848 Y123.359 E.00341
G1 X117.225 Y123.879 E.01332
G1 X117.698 Y124.329 E.01355
G1 X118.384 Y124.758 E.01678
G1 X118.945 Y124.975 E.01247
G2 X119.95 Y125.119 I1.027 J-3.581 E.02111
G1 X141.878 Y125.119 E.45485
G1 X142.39 Y125.018 E.01082
G1 X142.595 Y124.93 E.00463
G1 X142.987 Y124.651 E.00998
G1 X143.268 Y124.264 E.00991
G2 X143.467 Y123.531 I-1.758 J-.871 E.01586
G3 X143.494 Y121.399 I36.886 J-.603 E.04423
G1 X143.602 Y121.229 E.00419
G1 X143.846 Y121.12 E.00554
M73 P63 R5
G1 X148.521 Y121.119 E.09696
G1 X148.521 Y122.258 E.02362
G1 X148.521 Y123.881 E.03366
G1 X147.28 Y123.881 E.02574
G1 X146.939 Y123.364 E.01283
G1 X146.472 Y123.036 E.01185
G1 X145.939 Y122.89 E.01147
G2 X145.366 Y122.961 I-.093 J1.6 E.01204
G1 X144.866 Y123.219 E.01166
G1 X144.504 Y123.608 E.01105
G1 X144.299 Y124.03 E.00973
G1 X144.229 Y124.468 E.00918
G1 X144.226 Y125.427 E.01991
G1 X144.189 Y125.649 E.00466
G1 X144.075 Y125.784 E.00368
G1 X143.83 Y125.879 E.00545
G1 X118.854 Y125.885 E.51804
G1 X118.3 Y126.022 E.01184
G1 X117.862 Y126.307 E.01085
G1 X117.504 Y126.788 E.01244
; LINE_WIDTH: 0.452072
G1 X117.415 Y127.003 E.00484
; LINE_WIDTH: 0.485357
G1 X117.356 Y127.251 E.00574
; LINE_WIDTH: 0.518642
G1 X117.296 Y127.499 E.00615
; LINE_WIDTH: 0.538432
G1 X117.287 Y128.706 E.03026
G1 X117.309 Y128.994 E.00722
; LINE_WIDTH: 0.494212
G1 X117.331 Y129.281 E.00659
; LINE_WIDTH: 0.449992
G3 X117.308 Y130.609 I-17.135 J.367 E.02757
G1 X117.182 Y130.789 E.00455
G1 X116.934 Y130.88 E.00548
G1 X113.081 Y130.881 E.07992
G1 X112.416 Y130.847 E.0138
G1 X112.234 Y130.692 E.00497
G1 X112.169 Y130.478 E.00465
G1 X112.169 Y129.59 E.0184
; LINE_WIDTH: 0.485596
G1 X112.187 Y129.34 E.00565
; LINE_WIDTH: 0.521199
G1 X112.205 Y129.089 E.00608
; LINE_WIDTH: 0.556802
G2 X112.203 Y128.301 I-3.697 J-.388 E.02052
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09234
; LINE_WIDTH: 0.529892
G2 X112.131 Y124.143 I-.677 J-.022 E.00835
; LINE_WIDTH: 0.490912
G1 X112.069 Y123.958 E.00443
; LINE_WIDTH: 0.451932
G1 X111.78 Y123.456 E.01207
; LINE_WIDTH: 0.449992
G2 X111.092 Y122.982 I-1.49 J1.425 E.01746
G1 X110.568 Y122.881 E.01107
G1 X109.865 Y122.924 E.01461
G1 X109.336 Y123.143 E.01186
G1 X108.928 Y123.515 E.01145
G1 X108.799 Y123.743 E.00544
M204 S250
G1 X109.123 Y123.993 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.089 Y124.047 E.00122
G1 X109.032 Y124.29 E.00481
G1 X107.07 Y124.29 E.03781
G1 X107.07 Y120.71 E.06901
G1 X112.251 Y120.71 E.09986
G1 X112.647 Y120.772 E.00773
G1 X112.881 Y120.92 E.00534
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00724
G1 X113.14 Y128.301 E.13097
G1 X113.207 Y128.721 E.0082
G1 X113.435 Y129.159 E.00954
G1 X113.771 Y129.473 E.00886
G1 X114.151 Y129.65 E.00808
G1 X114.549 Y129.71 E.00777
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00784
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00875
G1 X116.321 Y128.621 E.00881
G1 X116.36 Y128.301 E.00623
G1 X116.36 Y122.678 E.10837
; LINE_WIDTH: 0.430592
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437832
G1 X116.786 Y122.087 E.00753
G1 X116.947 Y122.633 E.01147
; LINE_WIDTH: 0.419992
G1 X117.182 Y123.124 E.01048
G1 X117.513 Y123.587 E.01098
G1 X117.923 Y123.988 E.01105
G1 X118.538 Y124.379 E.01405
G2 X119.95 Y124.71 I1.523 J-3.315 E.02813
G1 X141.878 Y124.71 E.42268
G1 X142.3 Y124.619 E.00831
G1 X142.664 Y124.39 E.00829
G1 X142.942 Y124.014 E.00903
G1 X143.058 Y123.53 E.00959
G1 X143.062 Y121.551 E.03815
G1 X143.097 Y121.299 E.00491
G1 X143.25 Y120.988 E.00668
G1 X143.468 Y120.811 E.00541
G1 X143.828 Y120.71 E.0072
G1 X148.93 Y120.71 E.09834
G1 X148.93 Y122.258 E.02984
G1 X148.93 Y124.29 E.03917
G1 X146.968 Y124.29 E.03781
G1 X146.935 Y124.11 E.00353
G1 X146.728 Y123.736 E.00824
G1 X146.409 Y123.462 E.0081
G1 X146.001 Y123.309 E.00839
G1 X145.599 Y123.319 E.00776
G1 X145.203 Y123.479 E.00823
G1 X144.908 Y123.742 E.00761
G1 X144.711 Y124.101 E.0079
G1 X144.639 Y124.469 E.00722
G1 X144.635 Y125.429 E.0185
G1 X144.569 Y125.817 E.00759
G1 X144.426 Y126.034 E.00501
G1 X144.187 Y126.21 E.00571
G1 X143.882 Y126.288 E.00607
G1 X118.86 Y126.294 E.4823
G1 X118.433 Y126.409 E.00853
G1 X118.106 Y126.636 E.00767
G1 X117.846 Y127.011 E.00879
G1 X117.74 Y127.499 E.00962
G1 X117.74 Y129.499 E.03855
G3 X117.72 Y130.619 I-16.981 J.258 E.02158
G1 X117.604 Y130.939 E.00656
G1 X117.43 Y131.124 E.0049
G3 X116.964 Y131.29 I-.682 J-1.178 E.00958
G1 X112.964 Y131.29 E.0771
G3 X112.275 Y131.237 I-.159 J-2.463 E.01337
G1 X112.055 Y131.112 E.00487
G1 X111.874 Y130.901 E.00537
G1 X111.76 Y130.493 E.00817
G1 X111.76 Y124.47 E.11609
G1 X111.669 Y124.048 E.00831
G1 X111.44 Y123.684 E.00828
G1 X111.071 Y123.411 E.00886
G1 X110.58 Y123.29 E.00974
G1 X110.055 Y123.301 E.01013
G1 X109.656 Y123.426 E.00806
G1 X109.317 Y123.686 E.00823
G1 X109.155 Y123.943 E.00586
; WIPE_START
M204 S10000
G1 X109.089 Y124.047 E-.0469
G1 X109.032 Y124.29 E-.09485
G1 X107.405 Y124.29 E-.61826
; WIPE_END
G1 E-.04
G1 X115.037 Y124.209 Z1.32 F30000
G1 X143.869 Y123.902 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.531652
G1 F3600
G1 X143.783 Y124.27 E.00936
; WIPE_START
G1 X143.869 Y123.902 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.253 Y124.393 Z1.32 F30000
G1 X119.386 Y125.481 Z1.32
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.409712
G1 F3600
G1 X119.891 Y125.501 E.00949
; LINE_WIDTH: 0.368552
G1 X119.95 Y125.502 E.00098
; LINE_WIDTH: 0.366772
G1 X121.878 Y125.502 E.03216
; LINE_WIDTH: 0.366362
G1 X123.878 Y125.501 E.03331
; LINE_WIDTH: 0.365952
G1 X125.878 Y125.501 E.03327
; LINE_WIDTH: 0.365532
G1 X127.878 Y125.501 E.03323
; LINE_WIDTH: 0.365122
G1 X129.878 Y125.501 E.03319
; LINE_WIDTH: 0.364702
G1 X131.878 Y125.5 E.03314
; LINE_WIDTH: 0.364282
G1 X133.878 Y125.5 E.0331
; LINE_WIDTH: 0.363872
G1 X135.878 Y125.5 E.03306
; LINE_WIDTH: 0.363452
G1 X137.878 Y125.5 E.03302
; LINE_WIDTH: 0.363042
G1 X139.878 Y125.499 E.03298
; LINE_WIDTH: 0.362622
G1 X141.878 Y125.499 E.03294
; LINE_WIDTH: 0.377152
G1 X142.05 Y125.492 E.00296
; WIPE_START
G1 X141.878 Y125.499 E-.06541
G1 X140.05 Y125.499 E-.69459
; WIPE_END
G1 E-.04 F1800
G1 X132.554 Y126.936 Z1.32 F30000
G1 X114.095 Y130.474 Z1.32
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.414792
G1 F3600
G1 X115.109 Y130.496 E.01928
; LINE_WIDTH: 0.386332
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.10209
G1 X114.095 Y130.474 E-.65791
; WIPE_END
G1 E-.04 F1800
G1 X121.607 Y129.121 Z1.32 F30000
G1 X151.039 Y123.821 Z1.32
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.569402
G1 F3600
G1 X151.039 Y121.179 E.07023
G1 X151.583 Y121.179 E.01445
G1 X151.583 Y121.451 E.00723
G1 X151.583 Y123.821 E.063
G1 X151.099 Y123.821 E.01286
M204 S250
G1 X150.57 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X150.57 Y120.71 E.06901
G1 X150.816 Y120.71 E.00474
G1 F2250
G1 X151.062 Y120.71 E.00474
G1 F2700
G1 X151.308 Y120.71 E.00474
G1 F3150
G1 X151.553 Y120.71 E.00474
G1 F3600
G1 X151.799 Y120.71 E.00474
G1 F3150
G1 X152.045 Y120.71 E.00474
G1 F2700
G1 X152.052 Y121.451 E.01428
G1 X152.045 Y124.29 E.05473
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 F3150
G1 X151.799 Y124.29 E.00474
G1 F3600
G1 X151.553 Y124.29 E.00474
G1 F3150
G1 X151.308 Y124.29 E.00474
G1 F2700
G1 X151.062 Y124.29 E.00474
G1 F2250
G1 X150.816 Y124.29 E.00474
G1 F1800
G1 X150.63 Y124.29 E.00358
; CHANGE_LAYER
; Z_HEIGHT: 1.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X150.597 Y122.29 E-.76
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 8/45
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.32 I-.042 J-1.216 P1  F30000
G1 X104.75 Y123.867 Z1.32
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.478262
G1 F3600
G1 X104.297 Y123.867 E.01001
G1 X104.297 Y121.133 E.06047
G1 X104.75 Y121.133 E.01001
G1 X104.75 Y121.36 E.00501
G1 X104.75 Y123.807 E.05414
M204 S250
G1 X105.173 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X104.937 Y124.29 E.00455
G1 F2250
G1 X104.701 Y124.29 E.00455
G1 F2700
G1 X104.465 Y124.29 E.00455
G1 F3150
G1 X104.23 Y124.29 E.00455
G1 F3600
G1 X103.994 Y124.29 E.00455
G1 F3150
G1 X103.874 Y124.29 E.00231
G1 X103.874 Y120.71 E.06901
G1 X103.994 Y120.71 E.00231
G1 F3600
G1 X104.23 Y120.71 E.00455
G1 F3150
G1 X104.465 Y120.71 E.00455
G1 F2700
G1 X104.701 Y120.71 E.00455
G1 F2250
G1 X104.937 Y120.71 E.00455
G1 F1800
G1 X105.173 Y120.71 E.00455
G1 X105.173 Y121.36 E.01252
G1 X105.173 Y124.23 E.05533
; WIPE_START
M204 S10000
G1 X104.937 Y124.29 E-.09248
G1 X104.701 Y124.29 E-.08962
G1 X104.465 Y124.29 E-.08962
G1 X104.23 Y124.29 E-.08962
G1 X103.994 Y124.29 E-.08962
G1 X103.874 Y124.29 E-.0456
G1 X103.874 Y123.597 E-.26343
; WIPE_END
G1 E-.04
G1 X111.504 Y123.406 Z1.44 F30000
G1 X144.317 Y122.583 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.448802
G1 F3600
G1 X144.318 Y121.968 E.01273
G1 X144.901 Y121.967 E.01206
; LINE_WIDTH: 0.490152
G1 X145.04 Y121.988 E.0032
; LINE_WIDTH: 0.531502
G1 X145.18 Y122.009 E.00348
; LINE_WIDTH: 0.572852
G1 X145.319 Y122.029 E.00377
G1 X145.09 Y122.141 E.00681
; LINE_WIDTH: 0.531502
G1 X144.861 Y122.253 E.0063
; LINE_WIDTH: 0.490152
G1 X144.632 Y122.364 E.00578
; LINE_WIDTH: 0.448802
G1 X144.366 Y122.549 E.0067
; WIPE_START
G1 X144.318 Y121.968 E-.22166
M73 P64 R5
G1 X144.901 Y121.967 E-.2215
G1 X145.04 Y121.988 E-.05354
G1 X145.18 Y122.009 E-.05355
G1 X145.319 Y122.029 E-.05355
G1 X145.09 Y122.141 E-.09678
G1 X144.95 Y122.21 E-.05942
; WIPE_END
G1 E-.04 F1800
G1 X146.349 Y122.035 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.584632
G1 F3600
G1 X146.469 Y122.017 E.00331
; LINE_WIDTH: 0.548839
G1 X146.588 Y121.999 E.00309
; LINE_WIDTH: 0.513046
G1 X146.708 Y121.982 E.00288
; LINE_WIDTH: 0.477252
G1 X147.407 Y121.976 E.01543
; LINE_WIDTH: 0.466272
G1 X147.407 Y122.196 E.00474
G1 X147.407 Y122.643 E.00961
G1 X147.065 Y122.379 E.0093
; LINE_WIDTH: 0.505726
G1 X146.826 Y122.265 E.00621
; LINE_WIDTH: 0.545179
G1 X146.588 Y122.15 E.00672
; LINE_WIDTH: 0.584632
G1 X146.403 Y122.061 E.00559
; WIPE_START
G1 X146.469 Y122.017 E-.03
G1 X146.588 Y121.999 E-.04598
G1 X146.708 Y121.982 E-.04598
G1 X147.407 Y121.976 E-.26562
G1 X147.407 Y122.196 E-.0837
G1 X147.407 Y122.643 E-.16961
G1 X147.159 Y122.452 E-.11912
; WIPE_END
G1 E-.04 F1800
G1 X143.892 Y122.962 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G3 X143.909 Y121.544 I32.268 J-.327 E.02943
G1 X147.84 Y121.544 E.08152
G1 X147.84 Y122.196 E.01354
G1 X147.84 Y123.457 E.02614
G1 X147.531 Y123.457 E.00639
G1 X147.194 Y123.025 E.01136
G2 X146.551 Y122.61 I-1.428 J1.506 E.01598
G1 X145.909 Y122.462 E.01367
G1 X145.403 Y122.508 E.01053
G1 X144.807 Y122.75 E.01335
G1 X144.325 Y123.146 E.01293
; LINE_WIDTH: 0.489952
G1 X144.126 Y123.43 E.00788
; LINE_WIDTH: 0.529912
G1 X143.927 Y123.715 E.00856
G1 X143.911 Y123.532 E.00452
; LINE_WIDTH: 0.490082
G1 X143.894 Y123.022 E.01158
; WIPE_START
G1 X143.909 Y121.544 E-.56187
G1 X144.431 Y121.544 E-.19813
; WIPE_END
G1 E-.04 F1800
G1 X146.349 Y122.035 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.584632
G1 F3600
G1 X146.129 Y122.019 E.00604
; LINE_WIDTH: 0.552042
G1 X145.909 Y122.003 E.00568
; LINE_WIDTH: 0.546152
G1 X145.614 Y122.016 E.00751
; LINE_WIDTH: 0.572852
G1 X145.319 Y122.029 E.00789
; WIPE_START
G1 X145.614 Y122.016 E-.21729
G1 X145.909 Y122.003 E-.21729
G1 X146.129 Y122.019 E-.16271
G1 X146.349 Y122.035 E-.16272
; WIPE_END
G1 E-.04 F1800
G1 X142.652 Y125.411 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.537142
G1 F3600
G2 X143.512 Y124.743 I-.878 J-2.019 E.02752
G1 X143.801 Y124.204 E.0153
; LINE_WIDTH: 0.521012
G1 X143.784 Y124.297 E.00228
; LINE_WIDTH: 0.537142
G2 X143.758 Y125.411 I13.361 J.868 E.02788
G1 X142.712 Y125.411 E.02616
; WIPE_START
G1 X142.963 Y125.255 E-.11236
G1 X143.247 Y125.037 E-.13618
G1 X143.512 Y124.743 E-.15033
G1 X143.801 Y124.204 E-.23253
G1 X143.784 Y124.297 E-.03575
G1 X143.778 Y124.541 E-.09284
; WIPE_END
G1 E-.04 F1800
G1 X136.146 Y124.512 Z1.44 F30000
G1 X117.193 Y124.44 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01037
G1 X118.225 Y125.151 E.01572
G1 X118.867 Y125.392 E.01423
G1 X119.385 Y125.48 E.0109
G1 X118.86 Y125.46 E.0109
G1 X118.574 Y125.501 E.00599
G1 X118.001 Y125.69 E.01251
G1 X117.555 Y126.019 E.01149
G1 X117.297 Y126.316 E.00817
G1 X117.193 Y126.495 E.00429
G1 X117.193 Y124.5 E.04137
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522292
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.152
G1 X117.623 Y125.416 E-.15199
G1 X117.592 Y125.363 E-.152
G1 X117.623 Y125.309 E-.152
G1 X117.685 Y125.309 E-.15199
; WIPE_END
G1 E-.04 F1800
G1 X115.746 Y130.424 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.514942
G1 F3600
G1 X116.31 Y130.117 E.01535
G1 X116.558 Y129.9 E.00788
G1 X116.874 Y129.49 E.01239
G3 X116.871 Y130.421 I-137.231 J.066 E.02226
G3 X115.806 Y130.424 I-.688 J-50.265 E.02549
; WIPE_START
G1 X116.31 Y130.117 E-.22417
G1 X116.558 Y129.9 E-.12524
G1 X116.874 Y129.49 E-.19688
G1 X116.872 Y130.052 E-.2137
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.499 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.516562
G1 F3600
G1 X113.014 Y129.971 E.01466
G1 X113.272 Y130.176 E.00789
G1 X113.77 Y130.423 E.01335
G3 X112.627 Y130.42 I-.294 J-100.154 E.02744
G1 X112.627 Y129.559 E.02066
; WIPE_START
G1 X113.014 Y129.971 E-.21505
G1 X113.272 Y130.176 E-.12501
G1 X113.77 Y130.423 E-.21142
G1 X113.222 Y130.422 E-.20851
; WIPE_END
G1 E-.04 F1800
G1 X111.181 Y123.067 Z1.44 F30000
G1 X110.89 Y122.016 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.547172
G1 F3600
G1 X111.009 Y121.995 E.00309
; LINE_WIDTH: 0.505259
G1 X111.129 Y121.974 E.00284
; LINE_WIDTH: 0.463346
G1 X111.248 Y121.954 E.00259
; LINE_WIDTH: 0.421432
G1 X111.904 Y121.947 E.01268
; LINE_WIDTH: 0.407522
G1 X111.904 Y122.484 E.01004
G1 X111.621 Y122.305 E.00625
; LINE_WIDTH: 0.454072
G1 X111.377 Y122.209 E.00548
; LINE_WIDTH: 0.500622
G1 X111.134 Y122.113 E.00608
; LINE_WIDTH: 0.547172
G1 X110.946 Y122.038 E.00515
; WIPE_START
G1 X111.009 Y121.995 E-.02916
G1 X111.129 Y121.974 E-.04607
G1 X111.248 Y121.954 E-.04607
G1 X111.904 Y121.947 E-.24907
G1 X111.904 Y122.484 E-.20432
G1 X111.621 Y122.305 E-.12727
G1 X111.479 Y122.249 E-.05804
; WIPE_END
G1 E-.04 F1800
G1 X108.593 Y122.643 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.465602
G1 F3600
G1 X108.593 Y121.976 E.01436
G1 X109.209 Y121.976 E.01326
; LINE_WIDTH: 0.506917
G1 X109.504 Y121.996 E.00695
; LINE_WIDTH: 0.548232
G1 X109.799 Y122.017 E.00755
G1 X109.585 Y122.096 E.00583
; LINE_WIDTH: 0.500102
G1 X108.931 Y122.381 E.01653
; LINE_WIDTH: 0.465602
G1 X108.64 Y122.607 E.00792
G1 X108.47 Y123.457 F30000
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.16 Y123.457 E.00641
G1 X108.16 Y121.544 E.03968
G1 X109.713 Y121.544 E.0322
G3 X112.307 Y121.56 I.999 J48.434 E.05381
G1 X112.307 Y123.479 E.03982
G2 X111.143 Y122.553 I-1.766 J1.024 E.03158
G1 X110.559 Y122.457 E.01227
G1 X110.037 Y122.468 E.01082
G1 X109.728 Y122.522 E.00651
G1 X109.164 Y122.745 E.01259
G1 X108.791 Y123.039 E.00984
G1 X108.506 Y123.409 E.0097
; WIPE_START
G1 X108.16 Y123.457 E-.13261
G1 X108.16 Y121.805 E-.62739
; WIPE_END
G1 E-.04 F1800
G1 X110.89 Y122.016 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.547172
G1 F3600
G1 X110.55 Y122 E.00868
; LINE_WIDTH: 0.548232
G1 X109.799 Y122.017 E.01919
; WIPE_START
G1 X110.55 Y122 E-.52294
G1 X110.89 Y122.016 E-.23706
; WIPE_END
G1 E-.04 F1800
G1 X108.772 Y123.79 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.721 Y123.881 E.00216
G1 X107.736 Y123.881 E.02042
G1 X107.736 Y121.119 E.05728
G1 X112.252 Y121.119 E.09367
G1 X112.492 Y121.158 E.00504
G1 X112.639 Y121.277 E.00392
G1 X112.731 Y121.518 E.00536
G1 X112.731 Y123.12 E.03323
; LINE_WIDTH: 0.451912
G1 X112.73 Y123.884 E.01591
; LINE_WIDTH: 0.485387
G1 X112.713 Y124.177 E.00659
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00707
G1 X112.696 Y128.301 E.09235
; LINE_WIDTH: 0.550192
G1 X112.741 Y128.751 E.01161
G1 X112.783 Y128.837 E.00246
; LINE_WIDTH: 0.518317
G1 X112.826 Y128.923 E.00231
; LINE_WIDTH: 0.486442
G1 X113.099 Y129.39 E.01217
; LINE_WIDTH: 0.449992
G1 X113.497 Y129.777 E.01152
G1 X114.021 Y130.034 E.0121
G1 X114.559 Y130.119 E.0113
G1 X115.253 Y130.089 E.01442
G1 X115.763 Y129.923 E.01111
G1 X116.207 Y129.607 E.01131
G1 X116.56 Y129.136 E.0122
; LINE_WIDTH: 0.494212
G1 X116.669 Y128.899 E.00598
; LINE_WIDTH: 0.538432
G1 X116.778 Y128.662 E.00654
G1 X116.804 Y128.301 E.00909
; LINE_WIDTH: 0.551462
G1 X116.82 Y127.026 E.03277
G1 X116.803 Y126.78 E.00633
; LINE_WIDTH: 0.517639
G1 X116.786 Y126.534 E.00593
; LINE_WIDTH: 0.483816
G1 X116.769 Y126.288 E.00552
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.06383
G1 X116.867 Y123.39 E.00424
G1 X117.296 Y123.957 E.01475
G1 X117.798 Y124.408 E.014
G1 X118.384 Y124.758 E.01416
G1 X118.945 Y124.975 E.01247
G2 X119.95 Y125.119 I1.028 J-3.583 E.02112
G1 X141.938 Y125.115 E.45609
G1 X142.479 Y124.984 E.01155
G2 X143.113 Y124.5 I-.843 J-1.761 E.01666
G1 X143.37 Y124.053 E.01069
G1 X143.467 Y123.531 E.01101
G1 X143.471 Y121.56 E.04089
G1 X143.505 Y121.353 E.00435
G1 X143.607 Y121.222 E.00344
G1 X143.846 Y121.12 E.0054
G1 X148.264 Y121.119 E.09163
G1 X148.264 Y122.196 E.02234
G1 X148.264 Y123.881 E.03494
G1 X147.28 Y123.881 E.02041
G2 X146.428 Y123.016 I-1.535 J.66 E.02577
G1 X145.909 Y122.886 E.0111
G1 X145.476 Y122.926 E.009
G1 X144.997 Y123.13 E.01081
G1 X144.621 Y123.45 E.01026
G1 X144.334 Y123.939 E.01175
G1 X144.229 Y124.467 E.01117
G3 X144.19 Y125.646 I-8.34 J.313 E.02447
G1 X144.061 Y125.794 E.00407
G1 X143.834 Y125.879 E.00503
G1 X119.834 Y125.885 E.49781
G2 X118.692 Y125.909 I-.221 J16.647 E.0237
G1 X118.201 Y126.064 E.01067
G1 X117.816 Y126.353 E.00999
G1 X117.664 Y126.528 E.00481
; LINE_WIDTH: 0.483816
G1 X117.557 Y126.708 E.0047
; LINE_WIDTH: 0.517639
G1 X117.45 Y126.888 E.00504
; LINE_WIDTH: 0.551462
G1 X117.342 Y127.068 E.00539
G1 X117.296 Y127.499 E.01114
; LINE_WIDTH: 0.538432
G1 X117.287 Y128.706 E.03026
G1 X117.309 Y128.994 E.00722
; LINE_WIDTH: 0.494212
G1 X117.331 Y129.281 E.0066
; LINE_WIDTH: 0.449992
G3 X117.308 Y130.605 I-17.468 J.367 E.02747
G1 X117.147 Y130.812 E.00545
G1 X116.948 Y130.88 E.00438
G1 X112.948 Y130.881 E.08297
G3 X112.416 Y130.847 I-.038 J-3.597 E.01105
G1 X112.235 Y130.699 E.00485
G1 X112.169 Y130.464 E.00506
G1 X112.169 Y129.426 E.02153
; LINE_WIDTH: 0.484019
G1 X112.186 Y129.222 E.00459
; LINE_WIDTH: 0.518046
G1 X112.203 Y129.018 E.00493
; LINE_WIDTH: 0.552072
G2 X112.203 Y128.301 I-3.086 J-.36 E.01849
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09234
; LINE_WIDTH: 0.529902
G1 X112.193 Y124.328 E.00352
G1 X112.084 Y124.036 E.00766
; LINE_WIDTH: 0.489947
G1 X111.975 Y123.745 E.00706
; LINE_WIDTH: 0.449992
G2 X111.056 Y122.968 I-1.439 J.769 E.02557
G1 X110.568 Y122.881 E.01028
G1 X110.046 Y122.892 E.01082
G1 X109.525 Y123.039 E.01123
G1 X109.337 Y123.142 E.00445
G1 X108.919 Y123.53 E.01184
G1 X108.801 Y123.738 E.00495
M204 S250
G1 X109.126 Y123.988 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.089 Y124.047 E.00135
G1 X109.032 Y124.29 E.00481
G1 X107.327 Y124.29 E.03286
G1 X107.327 Y120.71 E.06901
G1 X112.252 Y120.71 E.09493
G1 X112.647 Y120.771 E.00769
G1 X112.881 Y120.92 E.00535
G1 X113.05 Y121.141 E.00536
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.195 Y128.683 E.00746
G1 X113.366 Y129.063 E.00802
G1 X113.65 Y129.383 E.00825
G1 X114.031 Y129.609 E.00853
G1 X114.549 Y129.71 E.01018
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00875
G1 X116.321 Y128.621 E.00881
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430592
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437832
G1 X116.786 Y122.087 E.00753
G1 X116.948 Y122.634 E.01148
; LINE_WIDTH: 0.419992
G1 X117.197 Y123.148 E.01102
G1 X117.574 Y123.657 E.0122
G1 X118.017 Y124.062 E.01157
G1 X118.538 Y124.379 E.01176
G2 X119.95 Y124.71 I1.523 J-3.315 E.02813
G1 X141.938 Y124.706 E.42383
G1 X142.365 Y124.59 E.00854
G1 X142.715 Y124.34 E.00829
G1 X142.966 Y123.955 E.00885
G1 X143.058 Y123.53 E.00838
G3 X143.087 Y121.339 I37.282 J-.601 E.04225
G1 X143.195 Y121.078 E.00545
G1 X143.445 Y120.824 E.00686
G1 X143.828 Y120.71 E.0077
G1 X148.673 Y120.71 E.09339
G1 X148.673 Y122.196 E.02865
G1 X148.673 Y124.29 E.04036
G1 X146.968 Y124.29 E.03286
G1 X146.935 Y124.109 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00888
G1 X145.966 Y123.304 E.0083
G1 X145.563 Y123.327 E.00778
G1 X145.173 Y123.499 E.00822
G1 X144.906 Y123.744 E.00699
G1 X144.704 Y124.114 E.00812
G1 X144.639 Y124.469 E.00696
G1 X144.635 Y125.438 E.01868
G1 X144.569 Y125.816 E.0074
G1 X144.414 Y126.047 E.00536
G1 X144.164 Y126.22 E.00586
G1 X143.883 Y126.288 E.00557
G1 X118.86 Y126.294 E.48232
G1 X118.433 Y126.41 E.00854
G1 X118.068 Y126.676 E.00871
G1 X117.82 Y127.077 E.00909
G1 X117.74 Y127.499 E.00829
G1 X117.74 Y129.499 E.03855
G3 X117.704 Y130.729 I-9.317 J.34 E.02372
G1 X117.591 Y130.956 E.0049
G1 X117.37 Y131.165 E.00586
G1 X116.969 Y131.29 E.00809
G1 X114.969 Y131.29 E.03855
G3 X112.427 Y131.265 I-.885 J-39.081 E.04901
G1 X112.162 Y131.173 E.00541
G3 X111.76 Y130.488 I.503 J-.755 E.01583
G1 X111.76 Y124.47 E.116
G1 X111.669 Y124.048 E.00832
G1 X111.417 Y123.661 E.00891
G1 X111.038 Y123.396 E.0089
G1 X110.58 Y123.29 E.00906
G1 X110.054 Y123.301 E.01013
G1 X109.656 Y123.426 E.00805
G1 X109.317 Y123.686 E.00823
G1 X109.158 Y123.937 E.00573
; WIPE_START
M204 S10000
G1 X109.089 Y124.047 E-.04933
G1 X109.032 Y124.29 E-.09484
G1 X107.411 Y124.29 E-.61583
; WIPE_END
G1 E-.04
G1 X115.043 Y124.174 Z1.44 F30000
G1 X143.914 Y123.735 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.535172
G1 F3600
G1 X143.801 Y124.204 E.01201
; WIPE_START
G1 X143.914 Y123.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.301 Y124.277 Z1.44 F30000
G1 X119.385 Y125.48 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.409752
G1 F3600
G1 X119.891 Y125.501 E.0095
; LINE_WIDTH: 0.368492
G1 X119.95 Y125.502 E.00099
; LINE_WIDTH: 0.366652
G1 X123.938 Y125.501 E.06648
; LINE_WIDTH: 0.366472
G1 X127.938 Y125.5 E.06663
; LINE_WIDTH: 0.366282
G1 X131.938 Y125.499 E.0666
; LINE_WIDTH: 0.366102
G1 X135.938 Y125.499 E.06656
; LINE_WIDTH: 0.366002
G1 X137.938 Y125.498 E.03327
; LINE_WIDTH: 0.365822
G1 X141.938 Y125.497 E.06651
; LINE_WIDTH: 0.380712
G1 X142.11 Y125.49 E.00299
; WIPE_START
G1 X141.938 Y125.497 E-.06545
G1 X140.11 Y125.498 E-.69455
; WIPE_END
M73 P65 R5
G1 E-.04 F1800
G1 X132.618 Y126.952 Z1.44 F30000
G1 X114.373 Y130.492 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.378552
G1 F3600
G1 X115.109 Y130.496 E.01269
; LINE_WIDTH: 0.386332
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.13387
G1 X114.373 Y130.492 E-.62613
; WIPE_END
G1 E-.04 F1800
G1 X121.885 Y129.142 Z1.44 F30000
G1 X151.25 Y123.867 Z1.44
G1 Z1.04
G1 E.8 F1800
; LINE_WIDTH: 0.478252
G1 F3600
G1 X151.25 Y121.133 E.06047
G1 X151.703 Y121.133 E.01001
G1 X151.703 Y121.36 E.00501
G1 X151.703 Y123.867 E.05546
G1 X151.31 Y123.867 E.00868
M204 S250
G1 X150.827 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X150.827 Y120.71 E.06901
G1 X151.063 Y120.71 E.00455
G1 F2250
G1 X151.299 Y120.71 E.00455
G1 F2700
G1 X151.535 Y120.71 E.00455
G1 F3150
G1 X151.77 Y120.71 E.00455
G1 F3600
G1 X152.006 Y120.71 E.00455
G1 F3150
G1 X152.126 Y120.71 E.00231
G1 X152.126 Y121.36 E.01252
G1 X152.126 Y124.29 E.05648
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.006 Y124.29 E.00231
G1 F3600
G1 X151.77 Y124.29 E.00455
G1 F3150
G1 X151.535 Y124.29 E.00455
G1 F2700
G1 X151.299 Y124.29 E.00455
G1 F2250
G1 X151.063 Y124.29 E.00455
G1 F1800
G1 X150.887 Y124.29 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X150.853 Y122.29 E-.76
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 9/45
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.44 I-.042 J-1.216 P1  F30000
G1 X104.596 Y123.896 Z1.44
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.420122
G1 F3600
G1 X104.201 Y123.896 E.0076
G1 X104.201 Y121.104 E.05382
G1 X104.596 Y121.104 E.0076
G1 X104.596 Y121.301 E.0038
G1 X104.596 Y123.836 E.04886
M204 S250
G1 X104.99 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X104.752 Y124.29 E.00458
G1 F2250
G1 X104.514 Y124.29 E.00458
G1 F2700
G1 X104.277 Y124.29 E.00458
G1 F3150
G1 X104.039 Y124.29 E.00458
G1 F3600
G1 X103.807 Y124.29 E.00447
G1 X103.807 Y120.71 E.06901
G1 X104.039 Y120.71 E.00447
G1 F3150
G1 X104.277 Y120.71 E.00458
G1 F2700
G1 X104.514 Y120.71 E.00458
G1 F2250
G1 X104.752 Y120.71 E.00458
G1 F1800
G1 X104.99 Y120.71 E.00458
G1 X104.99 Y121.301 E.0114
G1 X104.99 Y124.23 E.05645
; WIPE_START
M204 S10000
G1 X104.752 Y124.29 E-.0932
G1 X104.514 Y124.29 E-.09037
G1 X104.277 Y124.29 E-.09037
G1 X104.039 Y124.29 E-.09037
G1 X103.807 Y124.29 E-.08806
G1 X103.807 Y123.48 E-.30764
; WIPE_END
G1 E-.04
G1 X111.434 Y123.195 Z1.56 F30000
G1 X144.317 Y121.967 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.447152
G1 F3600
G1 X144.925 Y121.967 E.01251
; LINE_WIDTH: 0.489032
G1 X145.056 Y121.988 E.00302
; LINE_WIDTH: 0.530912
G1 X145.188 Y122.008 E.00329
; LINE_WIDTH: 0.572792
G1 X145.319 Y122.029 E.00356
G1 X145.105 Y122.133 E.00636
; LINE_WIDTH: 0.530842
G1 X144.891 Y122.236 E.00587
; LINE_WIDTH: 0.488892
G1 X144.676 Y122.339 E.00538
; LINE_WIDTH: 0.446942
G1 X144.316 Y122.584 E.00898
G1 X144.317 Y122.027 E.01149
; WIPE_START
G1 X144.925 Y121.967 E-.23199
G1 X145.056 Y121.988 E-.05063
G1 X145.188 Y122.008 E-.05063
G1 X145.319 Y122.029 E-.05063
G1 X145.105 Y122.133 E-.09037
G1 X144.891 Y122.236 E-.09036
G1 X144.676 Y122.339 E-.09036
G1 X144.448 Y122.494 E-.10503
; WIPE_END
G1 E-.04 F1800
G1 X146.358 Y122.037 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.587292
G1 F3600
G1 X146.451 Y122.018 E.00259
; LINE_WIDTH: 0.549605
G1 X146.543 Y121.999 E.00242
; LINE_WIDTH: 0.511917
G1 X146.636 Y121.98 E.00224
; LINE_WIDTH: 0.47423
G1 X146.728 Y121.961 E.00207
; LINE_WIDTH: 0.436542
G1 X147.244 Y121.956 E.01037
; LINE_WIDTH: 0.426172
G1 X147.244 Y122.156 E.00392
G1 X147.244 Y122.539 E.00749
G1 X146.949 Y122.332 E.00705
; LINE_WIDTH: 0.466452
G1 X146.801 Y122.258 E.00356
; LINE_WIDTH: 0.506732
G1 X146.653 Y122.184 E.00388
; LINE_WIDTH: 0.547012
G1 X146.506 Y122.11 E.00421
; LINE_WIDTH: 0.587292
G1 X146.412 Y122.063 E.00289
; WIPE_START
G1 X146.451 Y122.018 E-.0228
G1 X146.543 Y121.999 E-.03588
G1 X146.636 Y121.98 E-.03588
G1 X146.728 Y121.961 E-.03588
G1 X147.244 Y121.956 E-.19614
G1 X147.244 Y122.156 E-.07608
G1 X147.244 Y122.539 E-.1453
G1 X146.949 Y122.332 E-.13693
G1 X146.801 Y122.258 E-.06276
G1 X146.772 Y122.244 E-.01236
; WIPE_END
G1 E-.04 F1800
G1 X143.909 Y121.544 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X147.657 Y121.544 E.07773
G1 X147.657 Y122.156 E.01271
G1 X147.657 Y123.457 E.02697
G1 X147.531 Y123.457 E.0026
G1 X147.199 Y123.028 E.01125
G1 X146.753 Y122.695 E.01155
G1 X146.213 Y122.508 E.01185
G1 X145.909 Y122.462 E.00638
G1 X145.403 Y122.508 E.01053
G1 X144.815 Y122.742 E.01314
G1 X144.307 Y123.17 E.01378
; LINE_WIDTH: 0.484977
G1 X144.116 Y123.451 E.00763
; LINE_WIDTH: 0.519962
G1 X143.924 Y123.732 E.00821
G1 X143.906 Y123.532 E.00484
; LINE_WIDTH: 0.480462
G1 X143.892 Y122.994 E.01196
; LINE_WIDTH: 0.449992
G3 X143.907 Y121.604 I33.289 J-.341 E.02885
; WIPE_START
G1 X145.907 Y121.572 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.358 Y122.037 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.587292
G1 F3600
G1 X146.133 Y122.02 E.00619
; LINE_WIDTH: 0.553382
G1 X145.909 Y122.003 E.00581
; LINE_WIDTH: 0.546132
G1 X145.614 Y122.016 E.0075
; LINE_WIDTH: 0.572792
G1 X145.319 Y122.029 E.00789
; WIPE_START
G1 X145.614 Y122.016 E-.21539
G1 X145.909 Y122.003 E-.2154
G1 X146.133 Y122.02 E-.16461
G1 X146.358 Y122.037 E-.16461
; WIPE_END
G1 E-.04 F1800
G1 X142.638 Y125.412 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.536482
G1 F3600
G1 X142.856 Y125.318 E.00594
G1 X143.321 Y124.978 E.01438
G1 X143.656 Y124.521 E.01413
; LINE_WIDTH: 0.534762
G1 X143.785 Y124.262 E.00721
G1 X143.762 Y124.555 E.00731
; LINE_WIDTH: 0.536482
G1 X143.758 Y125.412 E.02139
G1 X142.698 Y125.412 E.02647
; WIPE_START
G1 X142.856 Y125.318 E-.07002
G1 X143.321 Y124.978 E-.21883
G1 X143.656 Y124.521 E-.21507
G1 X143.785 Y124.262 E-.11013
G1 X143.762 Y124.555 E-.11166
G1 X143.762 Y124.645 E-.0343
; WIPE_END
G1 E-.04 F1800
G1 X136.13 Y124.587 Z1.56 F30000
G1 X117.193 Y124.442 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.571 Y124.766 E.01032
G1 X118.225 Y125.151 E.01573
G1 X118.867 Y125.392 E.01423
G1 X119.385 Y125.481 E.01091
G1 X118.86 Y125.461 E.01091
G1 X118.574 Y125.501 E.006
G1 X118.001 Y125.69 E.01251
G1 X117.557 Y126.018 E.01144
G1 X117.193 Y126.482 E.01224
G1 X117.193 Y124.502 E.04107
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522292
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.152
G1 X117.623 Y125.416 E-.15199
G1 X117.592 Y125.363 E-.152
G1 X117.623 Y125.309 E-.152
G1 X117.685 Y125.309 E-.15199
; WIPE_END
G1 E-.04 F1800
G1 X115.741 Y130.424 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.514942
G1 F3600
G1 X116.296 Y130.126 E.01506
G1 X116.557 Y129.901 E.00825
G1 X116.874 Y129.49 E.0124
G3 X116.871 Y130.421 I-136.693 J.066 E.02226
G3 X115.801 Y130.424 I-.691 J-50.328 E.0256
; WIPE_START
G1 X116.296 Y130.126 E-.21949
G1 X116.557 Y129.901 E-.13115
G1 X116.874 Y129.49 E-.19708
G1 X116.872 Y130.049 E-.21228
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.507 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.517802
G1 F3600
G1 X113.05 Y130.005 E.01572
G2 X113.664 Y130.384 I1.417 J-1.609 E.01744
; LINE_WIDTH: 0.507432
G1 X113.829 Y130.423 E.004
; LINE_WIDTH: 0.473932
G1 X113.995 Y130.461 E.00372
; LINE_WIDTH: 0.479117
G1 X113.627 Y130.442 E.00816
; LINE_WIDTH: 0.517802
G2 X112.627 Y130.419 I-.736 J10.505 E.02407
G1 X112.627 Y129.567 E.02051
; WIPE_START
G1 X113.05 Y130.005 E-.23139
G1 X113.314 Y130.204 E-.12558
G1 X113.664 Y130.384 E-.14955
G1 X113.829 Y130.423 E-.06455
G1 X113.995 Y130.461 E-.06455
G1 X113.668 Y130.444 E-.12438
; WIPE_END
G1 E-.04 F1800
G1 X111.491 Y123.129 Z1.56 F30000
G1 X111.168 Y122.042 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.598932
G1 F3600
G1 X111.25 Y122.022 E.00237
; LINE_WIDTH: 0.558715
G1 X111.332 Y122.002 E.00221
; LINE_WIDTH: 0.518497
G1 X111.415 Y121.982 E.00204
; LINE_WIDTH: 0.47828
G1 X111.497 Y121.962 E.00187
; LINE_WIDTH: 0.438062
G1 X111.904 Y121.946 E.00822
; LINE_WIDTH: 0.405782
G1 X111.904 Y122.476 E.00986
G1 X111.632 Y122.307 E.00596
; LINE_WIDTH: 0.45407
G1 X111.516 Y122.241 E.0028
; LINE_WIDTH: 0.502357
G1 X111.4 Y122.175 E.00311
; LINE_WIDTH: 0.550645
G1 X111.284 Y122.109 E.00343
; LINE_WIDTH: 0.598932
G1 X111.22 Y122.072 E.00206
; WIPE_START
G1 X111.25 Y122.022 E-.02213
G1 X111.332 Y122.002 E-.03219
G1 X111.415 Y121.982 E-.03219
G1 X111.497 Y121.962 E-.03219
G1 X111.904 Y121.946 E-.15501
G1 X111.904 Y122.476 E-.20167
G1 X111.632 Y122.307 E-.12182
G1 X111.516 Y122.241 E-.05079
G1 X111.4 Y122.175 E-.0508
G1 X111.284 Y122.109 E-.0508
G1 X111.26 Y122.095 E-.01042
; WIPE_END
G1 E-.04 F1800
G1 X108.757 Y122.534 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.428722
G1 F3600
G1 X108.757 Y121.957 E.01137
G1 X109.458 Y121.957 E.01382
; LINE_WIDTH: 0.464966
G1 X109.612 Y121.975 E.00332
; LINE_WIDTH: 0.501209
G1 X109.765 Y121.993 E.00359
; LINE_WIDTH: 0.537452
G1 X109.919 Y122.012 E.00387
G1 X109.85 Y122.036 E.00184
; LINE_WIDTH: 0.517472
G1 X109.456 Y122.184 E.01012
; LINE_WIDTH: 0.473097
G1 X109.062 Y122.332 E.00921
; LINE_WIDTH: 0.428722
G1 X108.807 Y122.501 E.00602
; WIPE_START
G1 X108.757 Y121.957 E-.20751
G1 X109.458 Y121.957 E-.26647
G1 X109.612 Y121.975 E-.05877
G1 X109.765 Y121.993 E-.05877
G1 X109.919 Y122.012 E-.05877
G1 X109.85 Y122.036 E-.02789
G1 X109.648 Y122.111 E-.08183
; WIPE_END
G1 E-.04 F1800
G1 X108.469 Y123.446 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.461 Y123.457 E.00026
G1 X108.343 Y123.457 E.00244
G1 X108.343 Y121.544 E.03968
G1 X109.714 Y121.544 E.02844
G3 X112.307 Y121.56 I.999 J48.107 E.05377
G1 X112.307 Y123.482 E.03987
G2 X111.328 Y122.618 I-1.737 J.982 E.02758
M73 P65 R4
G1 X110.72 Y122.468 E.01299
G1 X110.178 Y122.457 E.01125
G1 X109.573 Y122.568 E.01276
G1 X109.273 Y122.687 E.00669
G2 X108.671 Y123.177 I1.143 J2.019 E.01618
G1 X108.505 Y123.398 E.00573
; WIPE_START
G1 X108.461 Y123.457 E-.02756
G1 X108.343 Y123.457 E-.04478
G1 X108.343 Y121.647 E-.68766
; WIPE_END
G1 E-.04 F1800
G1 X111.168 Y122.042 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.598932
G1 F3600
G1 X110.949 Y122.024 E.00616
; LINE_WIDTH: 0.562372
G1 X110.73 Y122.006 E.00576
; LINE_WIDTH: 0.537452
G1 X109.919 Y122.012 E.02028
; WIPE_START
G1 X110.73 Y122.006 E-.49287
G1 X110.949 Y122.024 E-.13357
G1 X111.168 Y122.042 E-.13356
; WIPE_END
G1 E-.04 F1800
G1 X108.828 Y123.709 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.72 Y123.881 E.00421
G1 X107.919 Y123.881 E.01661
G1 X107.919 Y121.119 E.05728
G1 X111.919 Y121.119 E.08297
G3 X112.492 Y121.158 I.167 J1.803 E.01196
G1 X112.639 Y121.276 E.00392
G1 X112.731 Y121.518 E.00536
G1 X112.731 Y123.172 E.03431
; LINE_WIDTH: 0.454162
G1 X112.729 Y123.9 E.01525
; LINE_WIDTH: 0.486512
G1 X112.713 Y124.185 E.00643
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00688
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.556742
G1 X112.75 Y128.795 E.01292
G1 X112.799 Y128.884 E.00262
; LINE_WIDTH: 0.518442
G1 X112.848 Y128.972 E.00243
; LINE_WIDTH: 0.480142
G1 X113.129 Y129.429 E.01193
; LINE_WIDTH: 0.449992
G1 X113.529 Y129.799 E.0113
G1 X114.063 Y130.047 E.01221
G1 X114.559 Y130.119 E.01039
G1 X115.245 Y130.092 E.01424
G1 X115.722 Y129.942 E.01037
G1 X116.207 Y129.608 E.01222
G1 X116.56 Y129.136 E.01221
; LINE_WIDTH: 0.494212
G1 X116.669 Y128.899 E.00598
; LINE_WIDTH: 0.538432
G1 X116.778 Y128.662 E.00654
G1 X116.804 Y128.301 E.00908
; LINE_WIDTH: 0.526942
G2 X116.788 Y126.961 I-11.824 J-.537 E.03285
; LINE_WIDTH: 0.488467
G1 X116.769 Y126.594 E.00831
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.196 E.07048
G1 X116.92 Y123.476 E.0066
G1 X117.317 Y123.981 E.01332
G1 X117.798 Y124.407 E.01333
G1 X118.384 Y124.758 E.01417
G1 X118.945 Y124.975 E.01248
G2 X119.95 Y125.119 I1.027 J-3.583 E.02111
G1 X141.878 Y125.119 E.45485
G1 X142.39 Y125.018 E.01082
G1 X142.595 Y124.93 E.00463
G1 X142.987 Y124.651 E.00998
G1 X143.273 Y124.255 E.01013
G1 X143.366 Y124.042 E.00482
G1 X143.467 Y123.531 E.0108
G3 X143.5 Y121.366 I30.564 J-.615 E.04494
G1 X143.609 Y121.22 E.00378
G1 X143.846 Y121.12 E.00534
G1 X148.081 Y121.119 E.08783
G1 X148.081 Y122.156 E.02151
G1 X148.081 Y123.881 E.03577
G1 X147.28 Y123.881 E.01662
G1 X146.935 Y123.361 E.01294
G2 X146.441 Y123.022 I-1.15 J1.147 E.0125
G1 X145.909 Y122.886 E.0114
G1 X145.477 Y122.926 E.009
G1 X145.007 Y123.12 E.01054
G1 X144.603 Y123.475 E.01116
G1 X144.336 Y123.935 E.01104
G1 X144.237 Y124.372 E.00928
G3 X144.195 Y125.634 I-21.326 J-.081 E.0262
G1 X144.053 Y125.799 E.00452
G1 X143.834 Y125.879 E.00483
G1 X118.855 Y125.885 E.51813
G1 X118.319 Y126.016 E.01144
G1 X118.115 Y126.121 E.00475
G1 X117.674 Y126.512 E.01222
; LINE_WIDTH: 0.452122
G1 X117.415 Y127.003 E.01158
; LINE_WIDTH: 0.485382
G1 X117.356 Y127.251 E.00573
; LINE_WIDTH: 0.518642
G1 X117.296 Y127.499 E.00615
; LINE_WIDTH: 0.538432
G1 X117.287 Y128.706 E.03026
G1 X117.309 Y128.994 E.00722
; LINE_WIDTH: 0.494212
G1 X117.331 Y129.281 E.0066
; LINE_WIDTH: 0.449992
G3 X117.308 Y130.609 I-17.127 J.367 E.02757
G1 X117.15 Y130.813 E.00535
G1 X116.934 Y130.88 E.00469
G1 X112.934 Y130.881 E.08297
G3 X112.416 Y130.847 I-.031 J-3.517 E.01077
G1 X112.237 Y130.698 E.00482
G1 X112.169 Y130.478 E.00479
G1 X112.169 Y129.491 E.02047
; LINE_WIDTH: 0.485576
G1 X112.187 Y129.273 E.0049
; LINE_WIDTH: 0.521159
G1 X112.205 Y129.056 E.00528
; LINE_WIDTH: 0.556742
G2 X112.203 Y128.301 I-3.215 J-.372 E.01965
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09234
; LINE_WIDTH: 0.529382
G1 X112.193 Y124.331 E.00343
G1 X112.09 Y124.049 E.0074
; LINE_WIDTH: 0.489687
G1 X111.986 Y123.766 E.00682
; LINE_WIDTH: 0.449992
G1 X111.638 Y123.307 E.01196
G1 X111.198 Y123.022 E.01086
G1 X110.712 Y122.892 E.01045
G1 X110.178 Y122.881 E.01107
G1 X109.666 Y122.982 E.01082
G1 X109.461 Y123.07 E.00463
G1 X109.01 Y123.42 E.01184
G1 X108.86 Y123.658 E.00584
M204 S250
G1 X109.217 Y123.838 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.162 Y123.91 E.00174
G1 X109.028 Y124.29 E.00777
G1 X107.51 Y124.29 E.02925
G1 X107.51 Y120.71 E.06901
G1 X112.253 Y120.71 E.09142
G1 X112.647 Y120.771 E.00768
G1 X112.881 Y120.919 E.00535
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.206 Y128.72 E.00819
G1 X113.389 Y129.097 E.00807
G1 X113.672 Y129.401 E.00801
G1 X114.069 Y129.623 E.00876
G1 X114.549 Y129.71 E.00941
G1 X115.097 Y129.701 E.01055
G1 X115.455 Y129.615 E.0071
M73 P66 R4
G1 X115.845 Y129.387 E.0087
G1 X116.146 Y129.043 E.00881
G1 X116.321 Y128.621 E.00881
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.678 E.10837
; LINE_WIDTH: 0.430592
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437832
G1 X116.786 Y122.087 E.00753
G1 X116.949 Y122.637 E.01154
; LINE_WIDTH: 0.419992
G1 X117.246 Y123.228 E.01275
G1 X117.594 Y123.679 E.01098
G1 X118.016 Y124.061 E.01099
G1 X118.538 Y124.378 E.01177
G2 X119.95 Y124.71 I1.523 J-3.315 E.02814
G1 X141.878 Y124.71 E.42268
G1 X142.3 Y124.619 E.00832
G1 X142.664 Y124.39 E.00828
G1 X142.937 Y124.021 E.00885
G1 X143.058 Y123.53 E.00974
G1 X143.062 Y121.559 E.038
G1 X143.118 Y121.206 E.00689
G3 X143.445 Y120.824 I.729 J.294 E.00987
G1 X143.828 Y120.71 E.0077
G1 X148.49 Y120.71 E.08986
G1 X148.49 Y122.156 E.02788
G1 X148.49 Y124.29 E.04113
G1 X146.968 Y124.29 E.02933
G1 X146.935 Y124.11 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.385 Y123.447 E.00865
G1 X145.967 Y123.304 E.00851
G1 X145.563 Y123.327 E.00779
G1 X145.2 Y123.481 E.00761
G1 X144.888 Y123.768 E.00818
G1 X144.703 Y124.117 E.0076
G1 X144.639 Y124.469 E.00691
G1 X144.635 Y125.438 E.01867
G1 X144.576 Y125.801 E.00708
G1 X144.413 Y126.047 E.0057
G1 X144.164 Y126.22 E.00585
G1 X143.883 Y126.288 E.00557
G1 X118.86 Y126.294 E.48233
G1 X118.433 Y126.41 E.00853
G1 X118.069 Y126.675 E.00868
G1 X117.844 Y127.016 E.00787
G1 X117.74 Y127.499 E.00953
G1 X117.74 Y129.499 E.03855
G3 X117.719 Y130.625 I-16.444 J.258 E.02171
G1 X117.605 Y130.936 E.00638
G1 X117.387 Y131.154 E.00595
G3 X116.964 Y131.29 I-.59 J-1.114 E.0086
G1 X112.964 Y131.29 E.0771
G3 X112.274 Y131.237 I-.159 J-2.461 E.01338
G3 X111.878 Y130.909 I.272 J-.732 E.0101
G1 X111.76 Y130.493 E.00835
G1 X111.76 Y124.47 E.11609
G1 X111.674 Y124.06 E.00808
G1 X111.441 Y123.685 E.0085
G1 X111.13 Y123.441 E.00763
G1 X110.703 Y123.301 E.00865
G1 X110.182 Y123.29 E.01005
G1 X109.756 Y123.381 E.00839
G1 X109.392 Y123.61 E.00829
G1 X109.253 Y123.791 E.0044
; WIPE_START
M204 S10000
G1 X109.162 Y123.91 E-.05708
G1 X109.028 Y124.29 E-.15317
G1 X107.581 Y124.29 E-.54976
; WIPE_END
G1 E-.04
G1 X115.212 Y124.18 Z1.56 F30000
G1 X143.904 Y123.766 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.529332
G1 F3600
G1 X143.785 Y124.262 E.01256
; WIPE_START
G1 X143.904 Y123.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.29 Y124.298 Z1.56 F30000
G1 X119.385 Y125.481 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.409772
G1 F3600
G1 X119.891 Y125.501 E.0095
; LINE_WIDTH: 0.368532
G1 X119.95 Y125.502 E.00099
; LINE_WIDTH: 0.366772
G1 X121.878 Y125.502 E.03216
; LINE_WIDTH: 0.366362
G1 X123.878 Y125.501 E.03331
; LINE_WIDTH: 0.365952
G1 X125.878 Y125.501 E.03327
; LINE_WIDTH: 0.365532
G1 X127.878 Y125.501 E.03323
; LINE_WIDTH: 0.365122
G1 X129.878 Y125.501 E.03319
; LINE_WIDTH: 0.364702
G1 X131.878 Y125.5 E.03314
; LINE_WIDTH: 0.364282
G1 X133.878 Y125.5 E.0331
; LINE_WIDTH: 0.363872
G1 X135.878 Y125.5 E.03306
; LINE_WIDTH: 0.363452
G1 X137.878 Y125.5 E.03302
; LINE_WIDTH: 0.363042
G1 X139.878 Y125.499 E.03298
; LINE_WIDTH: 0.362622
G1 X141.878 Y125.499 E.03294
; LINE_WIDTH: 0.377152
G1 X142.05 Y125.492 E.00296
; WIPE_START
G1 X141.878 Y125.499 E-.06541
G1 X140.05 Y125.499 E-.69459
; WIPE_END
G1 E-.04 F1800
G1 X132.553 Y126.927 Z1.56 F30000
G1 X113.995 Y130.461 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.440432
G1 F3600
G1 X114.272 Y130.481 E.00564
; LINE_WIDTH: 0.401642
G1 X114.549 Y130.5 E.00511
; LINE_WIDTH: 0.371432
G1 X115.109 Y130.496 E.00946
; LINE_WIDTH: 0.386332
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.09392
G1 X114.549 Y130.5 E-.3341
G1 X114.272 Y130.481 E-.16599
G1 X113.995 Y130.461 E-.16599
; WIPE_END
G1 E-.04 F1800
G1 X121.512 Y129.142 Z1.56 F30000
G1 X151.404 Y123.896 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.420122
G1 F3600
G1 X151.404 Y121.104 E.05382
G1 X151.799 Y121.104 E.0076
G1 X151.799 Y121.301 E.0038
G1 X151.799 Y123.896 E.05002
G1 X151.464 Y123.896 E.00645
M204 S250
G1 X151.01 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X151.01 Y120.71 E.06901
G1 X151.248 Y120.71 E.00458
G1 F2250
G1 X151.486 Y120.71 E.00458
G1 F2700
G1 X151.723 Y120.71 E.00458
G1 F3150
G1 X151.961 Y120.71 E.00458
G1 F3600
G1 X152.193 Y120.71 E.00447
G1 X152.193 Y121.301 E.0114
G1 X152.193 Y124.29 E.0576
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.961 Y124.29 E.00447
G1 F3150
G1 X151.723 Y124.29 E.00458
G1 F2700
G1 X151.486 Y124.29 E.00458
G1 F2250
G1 X151.248 Y124.29 E.00458
G1 F1800
G1 X151.07 Y124.29 E.00343
; CHANGE_LAYER
; Z_HEIGHT: 1.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X151.036 Y122.29 E-.76
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 10/45
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.56 I-.042 J-1.216 P1  F30000
G1 X104.473 Y123.916 Z1.56
G1 Z1.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.378622
G1 F3600
G1 X104.12 Y123.916 E.00609
G1 X104.12 Y121.084 E.04888
G1 X104.473 Y121.084 E.00609
G1 X104.473 Y121.26 E.00304
G1 X104.473 Y123.856 E.0448
M204 S250
G1 X104.847 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X104.604 Y124.29 E.00468
G1 F2250
G1 X104.361 Y124.29 E.00468
G1 F2700
G1 X104.118 Y124.29 E.00468
G1 F3150
G1 X103.875 Y124.29 E.00468
G1 F3600
G1 X103.747 Y124.29 E.00247
G1 X103.747 Y120.71 E.06901
G1 X103.875 Y120.71 E.00247
G1 F3150
G1 X104.118 Y120.71 E.00468
G1 F2700
G1 X104.361 Y120.71 E.00468
G1 F2250
G1 X104.604 Y120.71 E.00468
G1 F1800
G1 X104.847 Y120.71 E.00468
G1 X104.847 Y121.26 E.0106
G1 X104.847 Y124.23 E.05725
; WIPE_START
M204 S10000
G1 X104.604 Y124.29 E-.0951
G1 X104.361 Y124.29 E-.09232
G1 X104.118 Y124.29 E-.09232
G1 X103.875 Y124.29 E-.09232
G1 X103.747 Y124.29 E-.04869
G1 X103.747 Y123.397 E-.33924
; WIPE_END
G1 E-.04
G1 X111.378 Y123.245 Z1.68 F30000
G1 X144.317 Y122.586 Z1.68
G1 Z1.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.448802
G1 F3600
G1 X144.318 Y121.968 E.01279
G1 X144.846 Y121.967 E.01093
; LINE_WIDTH: 0.492966
G1 X144.994 Y121.99 E.00341
; LINE_WIDTH: 0.537129
G1 X145.142 Y122.012 E.00373
; LINE_WIDTH: 0.581292
G1 X145.289 Y122.034 E.00406
G1 X145.067 Y122.145 E.00675
; LINE_WIDTH: 0.537129
G1 X144.845 Y122.257 E.00622
; LINE_WIDTH: 0.492966
G1 X144.623 Y122.369 E.00568
; LINE_WIDTH: 0.448802
G1 X144.366 Y122.551 E.00653
; WIPE_START
G1 X144.318 Y121.968 E-.22258
G1 X144.846 Y121.967 E-.2008
G1 X144.994 Y121.99 E-.05673
G1 X145.142 Y122.012 E-.05674
G1 X145.289 Y122.034 E-.05674
G1 X145.067 Y122.145 E-.09449
G1 X144.898 Y122.23 E-.07193
; WIPE_END
G1 E-.04 F1800
G1 X146.297 Y122.03 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.575152
G1 F3600
G1 X146.394 Y122.009 E.00267
; LINE_WIDTH: 0.531895
G1 X146.491 Y121.987 E.00246
; LINE_WIDTH: 0.488637
G1 X146.588 Y121.966 E.00225
; LINE_WIDTH: 0.44538
G1 X146.685 Y121.944 E.00204
; LINE_WIDTH: 0.402122
G1 X147.115 Y121.942 E.00791
; LINE_WIDTH: 0.398732
G1 X147.115 Y122.129 E.0034
G1 X147.115 Y122.46 E.00603
G1 X146.85 Y122.298 E.00565
; LINE_WIDTH: 0.442837
G1 X146.712 Y122.231 E.00313
; LINE_WIDTH: 0.486942
G1 X146.574 Y122.164 E.00347
; LINE_WIDTH: 0.531047
G1 X146.435 Y122.097 E.0038
; LINE_WIDTH: 0.575152
G1 X146.351 Y122.057 E.00252
; WIPE_START
G1 X146.394 Y122.009 E-.02445
G1 X146.491 Y121.987 E-.03781
G1 X146.588 Y121.966 E-.03781
G1 X146.685 Y121.944 E-.03781
G1 X147.115 Y121.942 E-.16325
G1 X147.115 Y122.129 E-.07087
G1 X147.115 Y122.46 E-.12576
G1 X146.85 Y122.298 E-.11778
G1 X146.712 Y122.231 E-.05841
G1 X146.574 Y122.164 E-.05841
G1 X146.508 Y122.133 E-.02764
; WIPE_END
G1 E-.04 F1800
G1 X143.899 Y123.416 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.469782
G1 F3600
G1 X143.892 Y123.013 E.00875
; LINE_WIDTH: 0.449992
G3 X143.909 Y121.544 I33.319 J-.35 E.03049
G1 X147.513 Y121.544 E.07476
G1 X147.513 Y122.129 E.01214
G1 X147.513 Y123.426 E.02692
G1 X147.194 Y123.025 E.01063
G2 X146.536 Y122.605 I-1.402 J1.473 E.01629
G1 X145.879 Y122.459 E.01397
G1 X145.374 Y122.516 E.01054
G1 X144.811 Y122.748 E.01264
G2 X144.296 Y123.181 I1.015 J1.729 E.01402
; LINE_WIDTH: 0.483257
G1 X144.107 Y123.476 E.00784
; LINE_WIDTH: 0.516522
G1 X143.918 Y123.771 E.00841
G1 X143.901 Y123.532 E.00576
; LINE_WIDTH: 0.469782
G1 X143.9 Y123.476 E.00121
; WIPE_START
G1 X143.892 Y123.013 E-.17595
G1 X143.909 Y121.544 E-.55845
G1 X143.977 Y121.544 E-.0256
; WIPE_END
G1 E-.04 F1800
G1 X146.297 Y122.03 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.575152
G1 F3600
G1 X146.088 Y122.016 E.00563
; LINE_WIDTH: 0.545802
G1 X145.879 Y122.001 E.00533
; LINE_WIDTH: 0.548872
G1 X145.584 Y122.017 E.00755
; LINE_WIDTH: 0.581292
G1 X145.289 Y122.034 E.00802
; WIPE_START
G1 X145.584 Y122.017 E-.22224
G1 X145.879 Y122.001 E-.22225
G1 X146.088 Y122.016 E-.15775
G1 X146.297 Y122.03 E-.15776
; WIPE_END
G1 E-.04 F1800
G1 X142.638 Y125.412 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.536482
G1 F3600
G1 X142.857 Y125.317 E.00594
G1 X143.321 Y124.978 E.01438
G1 X143.656 Y124.521 E.01413
; LINE_WIDTH: 0.534112
G1 X143.792 Y124.231 E.00797
G1 X143.763 Y124.555 E.00809
; LINE_WIDTH: 0.536482
G1 X143.758 Y125.412 E.02139
G1 X142.698 Y125.412 E.02647
; WIPE_START
G1 X142.857 Y125.317 E-.07009
G1 X143.321 Y124.978 E-.21876
G1 X143.656 Y124.521 E-.21506
G1 X143.792 Y124.231 E-.12186
G1 X143.763 Y124.555 E-.12367
G1 X143.763 Y124.583 E-.01056
; WIPE_END
G1 E-.04 F1800
G1 X136.13 Y124.542 Z1.68 F30000
G1 X117.193 Y124.442 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01033
G1 X118.225 Y125.151 E.01573
G1 X118.867 Y125.392 E.01422
G1 X119.386 Y125.481 E.01092
G1 X118.86 Y125.461 E.01092
G1 X118.574 Y125.501 E.00599
G1 X118.001 Y125.69 E.0125
G2 X117.196 Y126.462 I1.183 J2.04 E.02335
G3 X117.193 Y124.502 I137.194 J-1.19 E.04065
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522332
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.15201
G1 X117.592 Y125.363 E-.15199
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.502 Y130.462 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.469547
G1 F3600
G1 X115.651 Y130.429 E.00332
; LINE_WIDTH: 0.501512
G1 X115.801 Y130.396 E.00356
; LINE_WIDTH: 0.519422
G2 X116.872 Y129.503 I-.749 J-1.986 E.0343
G3 X116.871 Y130.421 I-485.479 J.195 E.02216
G2 X115.841 Y130.442 I-.338 J8.662 E.02488
; LINE_WIDTH: 0.478502
G1 X115.561 Y130.459 E.00621
; WIPE_START
G1 X115.651 Y130.429 E-.03585
G1 X115.801 Y130.396 E-.05819
G1 X116.137 Y130.237 E-.14152
G1 X116.399 Y130.05 E-.12209
G1 X116.656 Y129.801 E-.13616
G1 X116.872 Y129.503 E-.13975
G1 X116.872 Y129.836 E-.12644
; WIPE_END
G1 E-.04 F1800
G1 X112.629 Y129.499 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.522752
G1 F3600
G1 X112.912 Y129.872 E.01139
G1 X113.237 Y130.153 E.01044
G1 X113.756 Y130.42 E.01418
G3 X112.63 Y130.417 I-.319 J-103.245 E.02736
G1 X112.629 Y129.559 E.02087
; WIPE_START
G1 X112.912 Y129.872 E-.16043
G1 X113.237 Y130.153 E-.16322
G1 X113.756 Y130.42 E-.22173
G1 X113.191 Y130.419 E-.21462
; WIPE_END
G1 E-.04 F1800
G1 X111.165 Y123.06 Z1.68 F30000
G1 X110.877 Y122.015 Z1.68
G1 Z1.28
M73 P67 R4
G1 E.8 F1800
; LINE_WIDTH: 0.544512
G1 F3600
G1 X110.991 Y121.996 E.00292
; LINE_WIDTH: 0.505726
G1 X111.104 Y121.976 E.0027
; LINE_WIDTH: 0.466939
G1 X111.218 Y121.957 E.00248
; LINE_WIDTH: 0.428152
G1 X111.903 Y121.947 E.01349
; LINE_WIDTH: 0.408522
G1 X111.903 Y122.475 E.00989
G1 X111.618 Y122.305 E.00622
; LINE_WIDTH: 0.453852
G1 X111.371 Y122.209 E.00555
; LINE_WIDTH: 0.499182
G1 X111.124 Y122.112 E.00614
; LINE_WIDTH: 0.544512
G1 X110.933 Y122.037 E.0052
; WIPE_START
G1 X110.991 Y121.996 E-.02694
G1 X111.104 Y121.976 E-.04376
G1 X111.218 Y121.957 E-.04376
G1 X111.903 Y121.947 E-.26048
G1 X111.903 Y122.475 E-.20074
G1 X111.618 Y122.305 E-.12623
G1 X111.475 Y122.25 E-.05808
; WIPE_END
G1 E-.04 F1800
G1 X108.886 Y122.461 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.400302
G1 F3600
G1 X108.886 Y121.943 E.00949
G1 X109.21 Y121.943 E.00593
; LINE_WIDTH: 0.449586
G1 X109.406 Y121.968 E.0041
; LINE_WIDTH: 0.498869
G1 X109.602 Y121.992 E.00458
; LINE_WIDTH: 0.548152
G1 X109.799 Y122.017 E.00505
G1 X109.695 Y122.065 E.00293
; LINE_WIDTH: 0.505152
G1 X109.591 Y122.114 E.00269
; LINE_WIDTH: 0.462152
G1 X109.239 Y122.288 E.00838
; LINE_WIDTH: 0.431227
G1 X108.94 Y122.435 E.0066
; WIPE_START
G1 X108.886 Y121.943 E-.18801
G1 X109.21 Y121.943 E-.12305
G1 X109.406 Y121.968 E-.07521
G1 X109.602 Y121.992 E-.07521
G1 X109.799 Y122.017 E-.07521
G1 X109.695 Y122.065 E-.04359
G1 X109.591 Y122.114 E-.04359
G1 X109.27 Y122.272 E-.13614
; WIPE_END
G1 E-.04 F1800
G1 X108.487 Y123.428 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.487 Y121.544 E.03908
G1 X109.712 Y121.544 E.02541
G3 X112.307 Y121.56 I.999 J47.821 E.05383
G1 X112.307 Y123.489 E.04001
G1 X112.021 Y123.095 E.01009
G2 X111.118 Y122.545 I-1.584 J1.582 E.02215
G1 X110.559 Y122.457 E.01173
G1 X109.881 Y122.483 E.01408
G1 X109.308 Y122.668 E.01249
G1 X108.791 Y123.039 E.01318
G1 X108.524 Y123.381 E.00901
; WIPE_START
G1 X108.487 Y121.544 E-.69821
G1 X108.649 Y121.544 E-.0618
; WIPE_END
G1 E-.04 F1800
G1 X110.877 Y122.015 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.544512
G1 F3600
G1 X110.55 Y122 E.00831
; LINE_WIDTH: 0.548152
G1 X109.799 Y122.017 E.01919
; WIPE_START
G1 X110.55 Y122 E-.52926
G1 X110.877 Y122.015 E-.23074
; WIPE_END
G1 E-.04 F1800
G1 X108.773 Y123.789 Z1.68 F30000
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.721 Y123.881 E.00218
G1 X108.062 Y123.881 E.01366
G1 X108.062 Y121.119 E.05728
G1 X112.062 Y121.119 E.08297
G3 X112.492 Y121.158 I.096 J1.354 E.00899
G1 X112.639 Y121.276 E.00391
G1 X112.731 Y121.518 E.00536
G1 X112.731 Y122.996 E.03066
; LINE_WIDTH: 0.451912
G1 X112.73 Y123.77 E.01613
; LINE_WIDTH: 0.486282
G1 X112.713 Y124.09 E.0072
; LINE_WIDTH: 0.520652
G1 X112.695 Y124.409 E.00774
G1 X112.696 Y126.409 E.04839
; LINE_WIDTH: 0.519982
G1 X112.696 Y128.301 E.0457
; LINE_WIDTH: 0.557292
G1 X112.75 Y128.796 E.01295
G1 X112.805 Y128.891 E.00287
; LINE_WIDTH: 0.514817
G1 X112.86 Y128.987 E.00264
; LINE_WIDTH: 0.472342
G1 X113.212 Y129.523 E.01401
; LINE_WIDTH: 0.449992
G1 X113.714 Y129.91 E.01314
G1 X114.278 Y130.093 E.0123
G1 X115.09 Y130.11 E.01684
G1 X115.598 Y129.995 E.0108
G1 X116.079 Y129.721 E.01149
G1 X116.453 Y129.313 E.01148
; LINE_WIDTH: 0.483982
G1 X116.555 Y129.131 E.00466
; LINE_WIDTH: 0.517972
G1 X116.656 Y128.949 E.00501
; LINE_WIDTH: 0.551962
G1 X116.758 Y128.768 E.00535
G1 X116.804 Y128.301 E.01207
; LINE_WIDTH: 0.540112
G1 X116.814 Y127.127 E.02951
G1 X116.792 Y126.795 E.00839
; LINE_WIDTH: 0.495052
G1 X116.769 Y126.462 E.00765
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.2 E.06766
G1 X116.92 Y123.476 E.00653
G1 X117.318 Y123.981 E.01333
G1 X117.798 Y124.407 E.01333
G1 X118.384 Y124.758 E.01417
G1 X118.945 Y124.975 E.01247
G2 X119.95 Y125.119 I1.028 J-3.584 E.02112
G1 X141.878 Y125.119 E.45485
G1 X142.39 Y125.018 E.01082
G1 X142.595 Y124.93 E.00464
G1 X142.987 Y124.651 E.00998
G1 X143.273 Y124.255 E.01013
G1 X143.366 Y124.042 E.00482
G1 X143.467 Y123.531 E.0108
G3 X143.5 Y121.364 I30.338 J-.615 E.04497
G1 X143.607 Y121.223 E.00367
G1 X143.846 Y121.12 E.00541
G1 X147.938 Y121.119 E.08487
G1 X147.938 Y122.129 E.02094
G1 X147.938 Y123.881 E.03634
G1 X147.28 Y123.881 E.01365
G2 X146.627 Y123.119 I-1.689 J.788 E.02107
G1 X146.419 Y123.013 E.00483
G1 X145.879 Y122.883 E.01153
G1 X145.447 Y122.934 E.00901
G1 X144.989 Y123.134 E.01038
G1 X144.596 Y123.481 E.01087
G1 X144.312 Y124.01 E.01245
G1 X144.235 Y124.389 E.00803
G3 X144.208 Y125.56 I-32.004 J-.14 E.02428
G1 X144.089 Y125.78 E.00519
G1 X143.848 Y125.879 E.00541
G1 X118.854 Y125.885 E.51842
G1 X118.319 Y126.016 E.01143
G1 X117.891 Y126.28 E.01043
G1 X117.543 Y126.711 E.01148
; LINE_WIDTH: 0.495052
G1 X117.431 Y126.955 E.00616
; LINE_WIDTH: 0.540112
G1 X117.319 Y127.199 E.00675
G1 X117.296 Y127.499 E.00758
; LINE_WIDTH: 0.550092
G1 X117.281 Y128.79 E.03309
G1 X117.298 Y128.943 E.00394
; LINE_WIDTH: 0.514547
G1 X117.316 Y129.095 E.00368
; LINE_WIDTH: 0.479002
G1 X117.331 Y129.892 E.01765
; LINE_WIDTH: 0.449992
G1 X117.308 Y130.609 E.01489
G1 X117.15 Y130.813 E.00535
G1 X116.934 Y130.88 E.00468
G1 X113.138 Y130.881 E.07874
G1 X112.416 Y130.847 E.01498
G1 X112.238 Y130.699 E.00481
G1 X112.169 Y130.477 E.00481
G1 X112.169 Y129.591 E.01838
; LINE_WIDTH: 0.485759
G1 X112.186 Y129.34 E.00565
; LINE_WIDTH: 0.521526
G1 X112.204 Y129.09 E.00609
; LINE_WIDTH: 0.557292
G2 X112.202 Y128.301 I-3.691 J-.387 E.02055
; LINE_WIDTH: 0.520022
G1 X112.201 Y126.301 E.04833
; LINE_WIDTH: 0.520652
G1 X112.201 Y124.409 E.04576
; LINE_WIDTH: 0.538492
G1 X112.184 Y124.229 E.00454
G1 X112.056 Y123.946 E.00779
; LINE_WIDTH: 0.494242
G1 X111.928 Y123.663 E.00712
; LINE_WIDTH: 0.449992
G2 X111.522 Y123.212 I-1.424 J.874 E.01264
G1 X111.034 Y122.96 E.0114
G1 X110.568 Y122.881 E.00981
G1 X110.046 Y122.892 E.01082
G1 X109.525 Y123.038 E.01123
G1 X109.337 Y123.142 E.00445
G1 X108.919 Y123.531 E.01185
G1 X108.802 Y123.737 E.00492
M204 S250
G1 X109.127 Y123.987 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.089 Y124.047 E.00136
G1 X109.032 Y124.29 E.00481
G1 X107.653 Y124.29 E.02657
G1 X107.653 Y120.71 E.06901
G1 X112.254 Y120.71 E.08868
G1 X112.647 Y120.771 E.00766
G1 X112.881 Y120.919 E.00534
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.207 Y128.721 E.0082
G1 X113.435 Y129.159 E.00954
G1 X113.805 Y129.494 E.0096
G1 X114.293 Y129.684 E.0101
G1 X114.979 Y129.709 E.01322
G1 X115.358 Y129.648 E.00741
G1 X115.746 Y129.462 E.00828
G1 X116.051 Y129.178 E.00804
G1 X116.285 Y128.744 E.0095
G1 X116.36 Y128.301 E.00867
G1 X116.36 Y122.735 E.10728
; LINE_WIDTH: 0.430572
G1 X116.365 Y121.715 E.02018
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437632
G1 X116.787 Y122.089 E.00756
G1 X116.969 Y122.687 E.01259
; LINE_WIDTH: 0.419992
G1 X117.245 Y123.228 E.0117
G1 X117.594 Y123.679 E.01099
G1 X118.016 Y124.061 E.01099
G1 X118.538 Y124.379 E.01177
G2 X119.95 Y124.71 I1.523 J-3.316 E.02813
G1 X141.878 Y124.71 E.42268
G1 X142.3 Y124.619 E.00832
G1 X142.664 Y124.39 E.00829
G1 X142.937 Y124.021 E.00885
G1 X143.058 Y123.53 E.00974
G1 X143.062 Y121.559 E.038
G1 X143.118 Y121.206 E.0069
G3 X143.445 Y120.824 I.728 J.294 E.00987
G1 X143.828 Y120.71 E.00769
G1 X148.347 Y120.71 E.0871
G1 X148.347 Y122.129 E.02735
G1 X148.347 Y124.29 E.04166
G1 X146.968 Y124.29 E.02657
G1 X146.935 Y124.109 E.00354
G1 X146.728 Y123.736 E.00823
G1 X146.374 Y123.441 E.00887
G1 X145.933 Y123.3 E.00892
G1 X145.527 Y123.336 E.00786
G1 X145.18 Y123.495 E.00736
G1 X144.886 Y123.77 E.00777
G1 X144.706 Y124.132 E.00778
G1 X144.639 Y124.469 E.00662
G1 X144.635 Y125.44 E.01872
G1 X144.548 Y125.859 E.00824
G1 X144.361 Y126.096 E.00581
G1 X144.095 Y126.248 E.00592
G1 X143.887 Y126.288 E.00407
G1 X118.86 Y126.294 E.48241
G1 X118.433 Y126.409 E.00853
G1 X118.13 Y126.613 E.00704
G1 X117.846 Y127.01 E.0094
G1 X117.74 Y127.499 E.00966
G1 X117.74 Y129.499 E.03855
G3 X117.719 Y130.626 I-19.723 J.196 E.02172
G1 X117.606 Y130.936 E.00636
G1 X117.387 Y131.154 E.00596
G3 X116.964 Y131.29 I-.589 J-1.114 E.0086
G1 X112.964 Y131.29 E.0771
G3 X112.275 Y131.237 I-.159 J-2.462 E.01338
G3 X111.879 Y130.91 I.272 J-.731 E.01008
G1 X111.76 Y130.493 E.00837
G1 X111.756 Y124.41 E.11725
G1 X111.641 Y123.983 E.00852
G1 X111.366 Y123.611 E.00892
G1 X111.015 Y123.386 E.00803
G1 X110.58 Y123.29 E.00858
G1 X110.055 Y123.301 E.01013
G1 X109.656 Y123.426 E.00805
G1 X109.316 Y123.686 E.00824
G1 X109.159 Y123.936 E.00571
; WIPE_START
M204 S10000
G1 X109.089 Y124.047 E-.04969
G1 X109.032 Y124.29 E-.09489
G1 X107.653 Y124.29 E-.52388
G1 X107.653 Y124.049 E-.09153
; WIPE_END
G1 E-.04
G1 X115.285 Y124 Z1.68 F30000
G1 X143.892 Y123.817 Z1.68
G1 Z1.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.526752
G1 F3600
G1 X143.792 Y124.231 E.01041
; WIPE_START
G1 X143.892 Y123.817 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.277 Y124.334 Z1.68 F30000
G1 X119.386 Y125.481 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.409732
G1 F3600
G1 X119.891 Y125.501 E.00949
; LINE_WIDTH: 0.368552
G1 X119.95 Y125.502 E.00098
; LINE_WIDTH: 0.366772
G1 X121.878 Y125.502 E.03216
; LINE_WIDTH: 0.366362
G1 X123.878 Y125.501 E.03331
; LINE_WIDTH: 0.365952
G1 X125.878 Y125.501 E.03327
; LINE_WIDTH: 0.365532
G1 X127.878 Y125.501 E.03323
; LINE_WIDTH: 0.365122
G1 X129.878 Y125.501 E.03319
; LINE_WIDTH: 0.364702
G1 X131.878 Y125.5 E.03314
; LINE_WIDTH: 0.364282
G1 X133.878 Y125.5 E.0331
; LINE_WIDTH: 0.363872
G1 X135.878 Y125.5 E.03306
; LINE_WIDTH: 0.363452
G1 X137.878 Y125.5 E.03302
; LINE_WIDTH: 0.363042
G1 X139.878 Y125.499 E.03298
; LINE_WIDTH: 0.362622
G1 X141.878 Y125.499 E.03294
; LINE_WIDTH: 0.377152
G1 X142.05 Y125.492 E.00296
; WIPE_START
G1 X141.878 Y125.499 E-.06541
G1 X140.05 Y125.499 E-.69459
; WIPE_END
G1 E-.04 F1800
G1 X132.557 Y126.949 Z1.68 F30000
G1 X114.263 Y130.487 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.389492
G1 F3600
G1 X114.949 Y130.499 E.0122
; LINE_WIDTH: 0.400632
G1 X115.225 Y130.481 E.00506
; LINE_WIDTH: 0.437252
G1 X115.5 Y130.463 E.00555
; WIPE_START
G1 X115.225 Y130.481 E-.16937
G1 X114.949 Y130.499 E-.16937
G1 X114.263 Y130.487 E-.42126
; WIPE_END
G1 E-.04 F1800
G1 X121.78 Y129.161 Z1.68 F30000
G1 X151.527 Y123.916 Z1.68
G1 Z1.28
G1 E.8 F1800
; LINE_WIDTH: 0.378612
G1 F3600
G1 X151.527 Y121.084 E.04887
G1 X151.879 Y121.084 E.00609
G1 X151.879 Y121.26 E.00304
G1 X151.879 Y123.916 E.04583
G1 X151.587 Y123.916 E.00505
M204 S250
G1 X151.153 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X151.153 Y120.71 E.06901
G1 X151.396 Y120.71 E.00468
G1 F2250
G1 X151.639 Y120.71 E.00468
G1 F2700
G1 X151.882 Y120.71 E.00468
G1 F3150
G1 X152.125 Y120.71 E.00468
G1 F1800
G1 X152.253 Y120.71 E.00247
G1 X152.253 Y121.26 E.0106
G1 F3600
G1 X152.253 Y121.66 E.00771
G1 X152.253 Y124.29 E.05069
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.125 Y124.29 E.00247
G1 F3150
G1 X151.882 Y124.29 E.00468
G1 F2700
G1 X151.639 Y124.29 E.00468
M73 P68 R4
G1 F2250
G1 X151.396 Y124.29 E.00468
G1 F1800
G1 X151.213 Y124.29 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X151.18 Y122.29 E-.76
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 11/45
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.68 I-.052 J-1.216 P1  F30000
G1 X104.73 Y124.29 Z1.68
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 X104.475 Y124.29 E.00491
G1 F2250
G1 X104.22 Y124.29 E.00491
G1 F2700
G1 X103.965 Y124.29 E.00491
G1 F3150
G1 X103.711 Y124.29 E.00491
G1 F3600
G1 X103.694 Y124.29 E.00032
G1 X103.694 Y120.71 E.06901
G1 X103.71 Y120.71 E.00032
G1 F3150
G1 X103.965 Y120.71 E.00491
G1 F2700
G1 X104.22 Y120.71 E.00491
G1 F2250
G1 X104.475 Y120.71 E.00491
G1 F1800
G1 X104.73 Y120.71 E.00491
G1 X104.73 Y121.228 E.00999
G1 X104.73 Y124.23 E.05786
; WIPE_START
M204 S10000
G1 X104.475 Y124.29 E-.09949
G1 X104.22 Y124.29 E-.09684
G1 X103.965 Y124.29 E-.09684
G1 X103.711 Y124.29 E-.09684
G1 X103.694 Y124.29 E-.0064
G1 X103.694 Y123.333 E-.3636
; WIPE_END
G1 E-.04
G1 X104.212 Y121.228 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.667712
G1 F3600
G1 X104.212 Y123.772 E.07984
; WIPE_START
G1 X104.212 Y121.772 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.843 Y121.927 Z1.8 F30000
G1 X144.317 Y122.586 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.448772
G1 F3600
G1 X144.318 Y121.968 E.01279
G1 X144.847 Y121.967 E.01094
; LINE_WIDTH: 0.492946
G1 X144.994 Y121.99 E.00341
; LINE_WIDTH: 0.537119
G1 X145.142 Y122.012 E.00373
; LINE_WIDTH: 0.581292
G1 X145.289 Y122.034 E.00405
G1 X145.067 Y122.145 E.00675
; LINE_WIDTH: 0.537119
G1 X144.845 Y122.257 E.00622
; LINE_WIDTH: 0.492946
G1 X144.623 Y122.369 E.00568
; LINE_WIDTH: 0.448772
G1 X144.366 Y122.551 E.00653
; WIPE_START
G1 X144.318 Y121.968 E-.22257
G1 X144.847 Y121.967 E-.20091
G1 X144.994 Y121.99 E-.0567
G1 X145.142 Y122.012 E-.0567
G1 X145.289 Y122.034 E-.0567
G1 X145.067 Y122.145 E-.0945
G1 X144.898 Y122.23 E-.07192
; WIPE_END
G1 E-.04 F1800
G1 X146.297 Y122.03 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.575152
G1 F3600
G1 X146.394 Y122.006 E.00269
; LINE_WIDTH: 0.527015
G1 X146.491 Y121.982 E.00245
; LINE_WIDTH: 0.478877
G1 X146.588 Y121.958 E.00222
; LINE_WIDTH: 0.43074
G1 X146.685 Y121.934 E.00198
; LINE_WIDTH: 0.382602
G1 X147.008 Y121.932 E.00562
; LINE_WIDTH: 0.378942
G1 X147.008 Y122.109 E.00305
G1 X147.008 Y122.411 E.00521
G1 X146.767 Y122.274 E.00478
; LINE_WIDTH: 0.427995
G1 X146.649 Y122.213 E.0026
; LINE_WIDTH: 0.477047
G1 X146.532 Y122.152 E.00292
; LINE_WIDTH: 0.5261
G1 X146.414 Y122.091 E.00324
; LINE_WIDTH: 0.575152
G1 X146.35 Y122.058 E.00194
; WIPE_START
G1 X146.394 Y122.006 E-.02688
G1 X146.491 Y121.982 E-.03973
G1 X146.588 Y121.958 E-.03973
G1 X146.685 Y121.934 E-.03973
G1 X147.008 Y121.932 E-.12793
G1 X147.008 Y122.109 E-.07008
G1 X147.008 Y122.411 E-.11972
G1 X146.767 Y122.274 E-.1099
G1 X146.649 Y122.213 E-.05253
G1 X146.532 Y122.152 E-.05253
G1 X146.414 Y122.091 E-.05253
G1 X146.35 Y122.058 E-.02872
; WIPE_END
G1 E-.04 F1800
G1 X143.867 Y123.912 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.496892
G1 F3600
G1 X143.891 Y123.403 E.01174
; LINE_WIDTH: 0.449992
G3 X143.909 Y121.544 I42.424 J-.526 E.03857
G1 X147.396 Y121.544 E.07233
G1 X147.396 Y122.109 E.01173
G1 X147.396 Y123.255 E.02378
G2 X146.536 Y122.605 I-1.74 J1.408 E.02258
G1 X145.879 Y122.459 E.01398
G1 X145.374 Y122.516 E.01053
G1 X144.811 Y122.748 E.01264
G2 X144.101 Y123.453 I1.196 J1.914 E.02091
; LINE_WIDTH: 0.496892
G1 X143.894 Y123.859 E.01051
; WIPE_START
G1 X143.891 Y123.403 E-.17319
G1 X143.906 Y121.859 E-.58681
; WIPE_END
G1 E-.04 F1800
G1 X146.297 Y122.03 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.575152
G1 F3600
G1 X146.088 Y122.016 E.00563
; LINE_WIDTH: 0.545792
G1 X145.879 Y122.001 E.00533
; LINE_WIDTH: 0.548862
G1 X145.584 Y122.017 E.00755
; LINE_WIDTH: 0.581292
G1 X145.289 Y122.034 E.00801
; WIPE_START
G1 X145.584 Y122.017 E-.22222
G1 X145.879 Y122.001 E-.22222
G1 X146.088 Y122.016 E-.15778
G1 X146.297 Y122.03 E-.15779
; WIPE_END
G1 E-.04 F1800
G1 X142.638 Y125.412 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.536482
G1 F3600
G1 X142.856 Y125.318 E.00594
G1 X143.321 Y124.978 E.01438
; LINE_WIDTH: 0.536622
G1 X143.635 Y124.561 E.01302
; LINE_WIDTH: 0.537212
G1 X143.777 Y124.29 E.00765
G1 X143.761 Y124.602 E.00781
; LINE_WIDTH: 0.536622
G1 X143.758 Y125.412 E.02022
; LINE_WIDTH: 0.536482
G1 X142.698 Y125.412 E.02647
; WIPE_START
G1 X142.856 Y125.318 E-.07
G1 X143.321 Y124.978 E-.21883
G1 X143.635 Y124.561 E-.19813
G1 X143.777 Y124.29 E-.11624
G1 X143.761 Y124.602 E-.11872
G1 X143.761 Y124.702 E-.03808
; WIPE_END
G1 E-.04 F1800
G1 X136.129 Y124.628 Z1.8 F30000
G1 X117.193 Y124.442 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.767 E.01034
G1 X118.225 Y125.151 E.01571
G1 X118.867 Y125.392 E.01422
G1 X119.386 Y125.481 E.01092
G1 X118.86 Y125.461 E.01092
G1 X118.574 Y125.501 E.00599
G1 X118.001 Y125.69 E.01251
G2 X117.198 Y126.455 I1.21 J2.074 E.02321
G3 X117.193 Y124.502 I75.671 J-1.192 E.0405
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522292
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.152
G1 X117.623 Y125.416 E-.15199
G1 X117.592 Y125.363 E-.152
G1 X117.623 Y125.309 E-.152
G1 X117.685 Y125.309 E-.15199
; WIPE_END
G1 E-.04 F1800
G1 X115.746 Y130.424 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.514942
G1 F3600
G1 X116.309 Y130.118 E.01534
G1 X116.557 Y129.901 E.00788
G1 X116.874 Y129.49 E.0124
G3 X116.86 Y130.424 I-27.542 J.066 E.02233
G1 X115.806 Y130.424 E.02523
; WIPE_START
G1 X116.309 Y130.118 E-.22392
G1 X116.557 Y129.901 E-.12524
G1 X116.874 Y129.49 E-.19705
G1 X116.866 Y130.053 E-.2138
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.501 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.517782
G1 F3600
G1 X113.039 Y129.994 E.01545
G2 X113.637 Y130.374 I1.399 J-1.541 E.01713
; LINE_WIDTH: 0.508722
G1 X113.802 Y130.416 E.00401
; LINE_WIDTH: 0.478647
G1 X113.967 Y130.457 E.00376
; LINE_WIDTH: 0.483177
G1 X113.608 Y130.44 E.00803
; LINE_WIDTH: 0.517782
G2 X112.627 Y130.419 I-.727 J11.366 E.02361
G1 X112.627 Y129.561 E.02064
; WIPE_START
G1 X113.039 Y129.994 E-.22696
G1 X113.306 Y130.2 E-.12814
G1 X113.637 Y130.374 E-.14218
G1 X113.802 Y130.416 E-.06453
G1 X113.967 Y130.457 E-.06453
G1 X113.615 Y130.44 E-.13366
; WIPE_END
G1 E-.04 F1800
G1 X111.144 Y123.219 Z1.8 F30000
G1 X110.729 Y122.006 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.525752
G1 F3600
G1 X110.891 Y121.986 E.00397
; LINE_WIDTH: 0.486412
G1 X111.052 Y121.966 E.00366
; LINE_WIDTH: 0.447072
G1 X111.213 Y121.947 E.00334
; LINE_WIDTH: 0.407732
G1 X111.903 Y121.947 E.0129
G1 X111.903 Y122.478 E.00992
G1 X111.544 Y122.277 E.00768
; LINE_WIDTH: 0.447072
G1 X111.273 Y122.186 E.0059
; LINE_WIDTH: 0.486412
G1 X111.001 Y122.096 E.00645
; LINE_WIDTH: 0.525752
G1 X110.786 Y122.025 E.00553
; WIPE_START
G1 X110.891 Y121.986 E-.04221
G1 X111.052 Y121.966 E-.06167
G1 X111.213 Y121.947 E-.06167
G1 X111.903 Y121.947 E-.26247
G1 X111.903 Y122.478 E-.20179
G1 X111.604 Y122.31 E-.13019
; WIPE_END
G1 E-.04 F1800
G1 X109.007 Y122.396 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.378252
G1 F3600
G1 X108.992 Y121.932 E.00801
G1 X109.458 Y121.932 E.00803
; LINE_WIDTH: 0.418047
G1 X109.573 Y121.952 E.00224
; LINE_WIDTH: 0.457842
G1 X109.689 Y121.972 E.00247
; LINE_WIDTH: 0.497637
G1 X109.804 Y121.992 E.0027
; LINE_WIDTH: 0.537432
G1 X109.919 Y122.012 E.00293
G1 X109.811 Y122.056 E.00292
; LINE_WIDTH: 0.497637
G1 X109.703 Y122.1 E.0027
; LINE_WIDTH: 0.457842
G1 X109.595 Y122.145 E.00247
; LINE_WIDTH: 0.418047
G1 X109.487 Y122.189 E.00224
; LINE_WIDTH: 0.378252
G1 X109.062 Y122.372 E.00797
G1 X108.604 Y123.258 F30000
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.604 Y121.544 E.03557
G1 X109.712 Y121.544 E.023
G3 X112.307 Y121.56 I.998 J47.76 E.05381
G1 X112.307 Y123.481 E.03986
G1 X111.978 Y123.048 E.01128
G1 X111.476 Y122.683 E.01288
G2 X110.72 Y122.468 I-1.021 J2.154 E.01637
G1 X109.951 Y122.482 E.01596
G1 X109.392 Y122.627 E.01197
G1 X108.927 Y122.919 E.01139
G1 X108.645 Y123.215 E.00848
; WIPE_START
G1 X108.604 Y121.544 E-.63525
G1 X108.932 Y121.544 E-.12475
; WIPE_END
G1 E-.04 F1800
G1 X110.729 Y122.006 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.537432
G1 F3600
G1 X109.919 Y122.012 E.02027
; WIPE_START
G1 X110.729 Y122.006 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.833 Y123.7 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.719 Y123.881 E.00442
G1 X108.179 Y123.881 E.0112
G1 X108.179 Y121.119 E.05728
G1 X112.179 Y121.119 E.08297
G3 X112.492 Y121.158 I.038 J.988 E.00656
G1 X112.639 Y121.277 E.00392
G1 X112.731 Y121.518 E.00536
G1 X112.731 Y123.27 E.03635
; LINE_WIDTH: 0.457822
G1 X112.727 Y123.927 E.01388
; LINE_WIDTH: 0.488342
G1 X112.712 Y124.199 E.00615
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00655
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.553132
G1 X112.745 Y128.771 E.0122
G1 X112.789 Y128.856 E.00247
; LINE_WIDTH: 0.519362
G1 X112.833 Y128.941 E.00231
; LINE_WIDTH: 0.485592
G1 X113.103 Y129.393 E.01183
; LINE_WIDTH: 0.449992
G1 X113.525 Y129.797 E.01211
G1 X114.039 Y130.04 E.0118
G1 X114.559 Y130.119 E.01091
G1 X115.253 Y130.089 E.01442
G1 X115.763 Y129.923 E.01111
G1 X116.207 Y129.608 E.0113
G1 X116.56 Y129.136 E.01221
; LINE_WIDTH: 0.494212
G1 X116.669 Y128.899 E.00598
; LINE_WIDTH: 0.538432
G1 X116.778 Y128.662 E.00654
G1 X116.804 Y128.301 E.00908
; LINE_WIDTH: 0.540112
G1 X116.814 Y127.127 E.02951
G1 X116.792 Y126.791 E.00847
; LINE_WIDTH: 0.495052
G1 X116.769 Y126.455 E.00773
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.202 E.06747
G1 X116.897 Y123.439 E.00558
G1 X117.318 Y123.981 E.01425
G1 X117.798 Y124.408 E.01333
G1 X118.384 Y124.758 E.01416
G1 X118.945 Y124.975 E.01247
G2 X119.95 Y125.119 I1.028 J-3.583 E.02112
G1 X141.878 Y125.119 E.45485
G1 X142.39 Y125.018 E.01082
G1 X142.595 Y124.93 E.00463
G1 X142.987 Y124.651 E.00998
G1 X143.255 Y124.289 E.00934
G2 X143.467 Y123.531 I-1.804 J-.912 E.01642
G1 X143.471 Y121.56 E.04089
G1 X143.504 Y121.356 E.00429
G1 X143.608 Y121.22 E.00354
G1 X143.846 Y121.12 E.00537
G1 X147.821 Y121.119 E.08244
G1 X147.821 Y122.109 E.02053
G1 X147.821 Y123.881 E.03675
G1 X147.28 Y123.881 E.01122
G2 X146.932 Y123.359 I-2.046 J.985 E.01304
G2 X146.419 Y123.013 I-1.141 J1.14 E.01291
G1 X145.879 Y122.883 E.01154
G1 X145.447 Y122.934 E.00901
G1 X144.989 Y123.133 E.01037
G1 X144.596 Y123.481 E.01087
G1 X144.35 Y123.908 E.01023
G1 X144.237 Y124.372 E.0099
G3 X144.208 Y125.56 I-38.779 J-.358 E.02465
G1 X144.089 Y125.78 E.00519
G1 X143.848 Y125.879 E.00541
G1 X118.854 Y125.885 E.51841
G1 X118.319 Y126.016 E.01144
G1 X117.904 Y126.269 E.01008
G1 X117.545 Y126.707 E.01175
; LINE_WIDTH: 0.495052
G1 X117.432 Y126.953 E.00621
; LINE_WIDTH: 0.540112
G1 X117.319 Y127.199 E.0068
G1 X117.296 Y127.499 E.00758
; LINE_WIDTH: 0.538432
G1 X117.287 Y128.706 E.03026
G1 X117.309 Y128.994 E.00722
; LINE_WIDTH: 0.494212
G1 X117.331 Y129.281 E.0066
; LINE_WIDTH: 0.449992
G1 X117.331 Y130.179 E.01863
G1 X117.289 Y130.644 E.00969
G1 X117.153 Y130.804 E.00435
G1 X116.911 Y130.88 E.00525
G1 X112.911 Y130.881 E.08297
G3 X112.416 Y130.847 I-.02 J-3.355 E.01031
G1 X112.229 Y130.689 E.00507
G1 X112.169 Y130.464 E.00484
G1 X112.169 Y129.432 E.0214
; LINE_WIDTH: 0.484372
G1 X112.186 Y129.225 E.00465
; LINE_WIDTH: 0.518752
G1 X112.204 Y129.019 E.005
; LINE_WIDTH: 0.553132
G2 X112.203 Y128.301 I-3.064 J-.359 E.01856
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09234
G1 X112.145 Y124.232 E.00591
; LINE_WIDTH: 0.488342
G1 X112.086 Y123.994 E.00554
; LINE_WIDTH: 0.457822
G1 X111.834 Y123.522 E.01129
; LINE_WIDTH: 0.449992
G1 X111.454 Y123.163 E.01085
G1 X111.268 Y123.057 E.00445
G1 X110.711 Y122.892 E.01204
G1 X110.178 Y122.881 E.01107
G1 X109.666 Y122.982 E.01082
G1 X109.461 Y123.07 E.00463
G1 X109.01 Y123.42 E.01184
G1 X108.865 Y123.65 E.00563
M204 S250
G1 X109.168 Y123.904 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.133 Y123.949 E.00109
G1 X109.028 Y124.29 E.00687
G1 X107.77 Y124.29 E.02424
G1 X107.77 Y120.71 E.06901
G1 X111.77 Y120.71 E.0771
G3 X112.646 Y120.771 I.242 J2.839 E.017
G1 X112.881 Y120.919 E.00534
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.2 Y128.7 E.00778
G1 X113.367 Y129.063 E.00771
G1 X113.67 Y129.399 E.00873
G1 X114.049 Y129.616 E.0084
G1 X114.549 Y129.71 E.00982
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00875
G1 X116.321 Y128.621 E.00881
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430572
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437832
G1 X116.786 Y122.087 E.00753
G1 X116.948 Y122.635 E.01151
; LINE_WIDTH: 0.419992
G1 X117.224 Y123.193 E.01198
G1 X117.594 Y123.679 E.01179
G1 X118.017 Y124.062 E.01099
G1 X118.538 Y124.379 E.01176
G2 X119.95 Y124.71 I1.523 J-3.316 E.02813
G1 X141.878 Y124.71 E.42268
G1 X142.3 Y124.619 E.00831
G1 X142.664 Y124.39 E.00829
G1 X142.936 Y124.03 E.0087
G1 X143.058 Y123.53 E.00991
G3 X143.086 Y121.34 I37.925 J-.6 E.04223
G1 X143.198 Y121.075 E.00554
G1 X143.445 Y120.824 E.00678
G1 X143.828 Y120.71 E.00771
G1 X148.23 Y120.71 E.08485
G1 X148.23 Y122.109 E.02696
G1 X148.23 Y124.29 E.04204
G1 X146.968 Y124.29 E.02432
G1 X146.935 Y124.109 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00887
G1 X145.933 Y123.3 E.00893
G1 X145.527 Y123.336 E.00786
G1 X145.18 Y123.495 E.00736
G1 X144.886 Y123.77 E.00776
G1 X144.716 Y124.089 E.00697
G1 X144.639 Y124.469 E.00748
G1 X144.635 Y125.44 E.01872
G1 X144.548 Y125.859 E.00824
G1 X144.361 Y126.096 E.00581
G1 X144.095 Y126.248 E.00592
G1 X143.887 Y126.288 E.00407
G1 X118.86 Y126.294 E.48241
G1 X118.433 Y126.409 E.00853
G1 X118.14 Y126.603 E.00676
G1 X117.846 Y127.01 E.00967
G1 X117.74 Y127.499 E.00966
G1 X117.74 Y130.389 E.05571
G1 X117.673 Y130.807 E.00816
G1 X117.496 Y131.066 E.00604
G1 X117.268 Y131.219 E.00529
G1 X116.957 Y131.29 E.00615
G1 X114.957 Y131.29 E.03855
G3 X112.421 Y131.264 I-.858 J-39.895 E.04889
G1 X112.163 Y131.174 E.00527
G3 X111.76 Y130.488 I.514 J-.764 E.01586
G1 X111.76 Y124.47 E.116
G1 X111.682 Y124.079 E.00769
G1 X111.485 Y123.736 E.00762
G1 X111.192 Y123.477 E.00754
G1 X110.703 Y123.301 E.01001
G1 X110.182 Y123.29 E.01005
G1 X109.756 Y123.381 E.00839
G1 X109.392 Y123.61 E.00829
G1 X109.204 Y123.857 E.00599
; WIPE_START
M204 S10000
G1 X109.133 Y123.949 E-.04426
M73 P69 R4
G1 X109.028 Y124.29 E-.13553
G1 X107.77 Y124.29 E-.47784
G1 X107.77 Y124.021 E-.10236
; WIPE_END
G1 E-.04
G1 X115.403 Y123.998 Z1.8 F30000
G1 X143.867 Y123.912 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.537212
G1 F3600
G1 X143.777 Y124.29 E.00971
; WIPE_START
G1 X143.867 Y123.912 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.25 Y124.4 Z1.8 F30000
G1 X119.386 Y125.481 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.409732
G1 F3600
G1 X119.891 Y125.501 E.00949
; LINE_WIDTH: 0.368552
G1 X119.95 Y125.502 E.00098
; LINE_WIDTH: 0.366772
G1 X121.878 Y125.502 E.03216
; LINE_WIDTH: 0.366362
G1 X123.878 Y125.501 E.03331
; LINE_WIDTH: 0.365952
G1 X125.878 Y125.501 E.03327
; LINE_WIDTH: 0.365532
G1 X127.878 Y125.501 E.03323
; LINE_WIDTH: 0.365122
G1 X129.878 Y125.501 E.03319
; LINE_WIDTH: 0.364702
G1 X131.878 Y125.5 E.03314
; LINE_WIDTH: 0.364282
G1 X133.878 Y125.5 E.0331
; LINE_WIDTH: 0.363872
G1 X135.878 Y125.5 E.03306
; LINE_WIDTH: 0.363452
G1 X137.878 Y125.5 E.03302
; LINE_WIDTH: 0.363042
G1 X139.878 Y125.499 E.03298
; LINE_WIDTH: 0.362622
G1 X141.878 Y125.499 E.03294
; LINE_WIDTH: 0.377152
G1 X142.05 Y125.492 E.00296
; WIPE_START
G1 X141.878 Y125.499 E-.06541
G1 X140.05 Y125.499 E-.69459
; WIPE_END
G1 E-.04 F1800
G1 X132.552 Y126.925 Z1.8 F30000
G1 X113.967 Y130.457 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.448572
G1 F3600
G1 X114.258 Y130.478 E.00604
; LINE_WIDTH: 0.405712
G1 X114.55 Y130.5 E.00543
; LINE_WIDTH: 0.371432
G1 X115.109 Y130.496 E.00946
; LINE_WIDTH: 0.386312
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.09188
G1 X114.55 Y130.5 E-.32684
G1 X114.258 Y130.478 E-.17064
G1 X113.967 Y130.457 E-.17064
; WIPE_END
G1 E-.04 F1800
G1 X121.497 Y129.212 Z1.8 F30000
G1 X151.27 Y124.29 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.27 Y120.71 E.06901
G1 X151.525 Y120.71 E.00491
G1 F2250
G1 X151.78 Y120.71 E.00491
G1 F2700
G1 X152.035 Y120.71 E.00491
G1 F3150
G1 X152.289 Y120.71 E.00491
G1 F1800
G1 X152.306 Y120.71 E.00032
G1 X152.306 Y121.228 E.00999
G1 F3600
G1 X152.306 Y121.628 E.00771
G1 X152.306 Y124.29 E.05131
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.289 Y124.29 E.00032
G1 F3150
G1 X152.035 Y124.29 E.00491
G1 F2700
G1 X151.78 Y124.29 E.00491
G1 F2250
G1 X151.525 Y124.29 E.00491
G1 F1800
G1 X151.33 Y124.29 E.00376
; WIPE_START
M204 S10000
G1 X151.297 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X151.788 Y121.228 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.667712
G1 F3600
G1 X151.788 Y123.772 E.07984
; CHANGE_LAYER
; Z_HEIGHT: 1.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X151.788 Y121.772 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/45
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.8 I-.065 J-1.215 P1  F30000
G1 X104.633 Y124.29 Z1.8
G1 Z1.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X104.353 Y124.29 E.0054
G1 F2250
G1 X104.073 Y124.29 E.0054
G1 F2700
G1 X103.793 Y124.29 E.0054
G1 F3150
G1 X103.646 Y124.29 E.00283
G1 X103.646 Y120.71 E.06901
G1 X103.793 Y120.71 E.00283
G1 F2700
G1 X104.073 Y120.71 E.0054
G1 F2250
G1 X104.353 Y120.71 E.0054
G1 F1800
G1 X104.633 Y120.71 E.0054
G1 X104.633 Y121.203 E.00951
G1 X104.633 Y124.23 E.05834
; WIPE_START
M204 S10000
G1 X104.353 Y124.29 E-.10882
G1 X104.073 Y124.29 E-.1064
G1 X103.793 Y124.29 E-.1064
G1 X103.646 Y124.29 E-.05573
G1 X103.646 Y123.283 E-.38265
; WIPE_END
G1 E-.04
G1 X104.139 Y121.203 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.618192
G1 F3600
G1 X104.139 Y123.797 E.07512
; WIPE_START
G1 X104.139 Y121.797 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.77 Y121.947 Z1.92 F30000
G1 X144.317 Y122.586 Z1.92
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.448782
G1 F3600
G1 X144.318 Y121.967 E.01279
G1 X144.846 Y121.967 E.01093
; LINE_WIDTH: 0.492972
G1 X144.994 Y121.99 E.00341
; LINE_WIDTH: 0.537162
G1 X145.142 Y122.012 E.00373
; LINE_WIDTH: 0.581352
G1 X145.289 Y122.034 E.00405
G1 X145.067 Y122.145 E.00675
; LINE_WIDTH: 0.537162
G1 X144.845 Y122.257 E.00622
; LINE_WIDTH: 0.492972
G1 X144.623 Y122.369 E.00568
; LINE_WIDTH: 0.448782
G1 X144.366 Y122.551 E.00653
G1 X143.892 Y123.013 F30000
; LINE_WIDTH: 0.449992
G1 F3600
G3 X143.9 Y121.544 I103.865 J-.205 E.03048
G1 X147.299 Y121.544 E.07051
G1 X147.299 Y122.095 E.01143
G1 X147.299 Y123.145 E.02178
G1 X146.889 Y122.785 E.01132
G1 X146.537 Y122.606 E.0082
G1 X145.879 Y122.459 E.01398
G1 X145.374 Y122.516 E.01054
G1 X144.811 Y122.748 E.01263
G2 X144.296 Y123.181 I1.017 J1.731 E.01401
; LINE_WIDTH: 0.491737
G1 X144.106 Y123.454 E.00759
; LINE_WIDTH: 0.533482
G1 X143.916 Y123.728 E.00826
G1 X143.911 Y123.532 E.00486
; LINE_WIDTH: 0.490192
G1 X143.894 Y123.073 E.01043
; WIPE_START
G1 X143.9 Y121.544 E-.58111
G1 X144.37 Y121.544 E-.17889
; WIPE_END
G1 E-.04 F1800
G1 X146.748 Y122.095 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.703352
G1 F3600
G1 X146.686 Y122.085 E.0021
; LINE_WIDTH: 0.684432
G1 X146.484 Y122.064 E.00653
; LINE_WIDTH: 0.642442
G1 X146.282 Y122.043 E.00612
; LINE_WIDTH: 0.600452
G1 X146.08 Y122.022 E.0057
; LINE_WIDTH: 0.558462
G1 X145.879 Y122.001 E.00528
; LINE_WIDTH: 0.548912
G1 X145.584 Y122.017 E.00755
; LINE_WIDTH: 0.581352
G1 X145.289 Y122.034 E.00802
; WIPE_START
G1 X145.584 Y122.017 E-.15311
G1 X145.879 Y122.001 E-.15311
G1 X146.08 Y122.022 E-.10521
G1 X146.282 Y122.043 E-.10522
G1 X146.484 Y122.064 E-.10521
G1 X146.686 Y122.085 E-.10522
G1 X146.748 Y122.095 E-.03291
; WIPE_END
G1 E-.04 F1800
G1 X142.652 Y125.411 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.537142
G1 F3600
G2 X143.512 Y124.743 I-.879 J-2.02 E.02753
G1 X143.802 Y124.204 E.0153
; LINE_WIDTH: 0.520962
G1 X143.784 Y124.297 E.00229
; LINE_WIDTH: 0.537142
G2 X143.758 Y125.411 I13.344 J.868 E.02788
G1 X142.712 Y125.411 E.02615
; WIPE_START
G1 X142.963 Y125.255 E-.11238
G1 X143.248 Y125.037 E-.13626
G1 X143.512 Y124.743 E-.15033
G1 X143.802 Y124.204 E-.23251
G1 X143.784 Y124.297 E-.0359
G1 X143.778 Y124.54 E-.09263
; WIPE_END
G1 E-.04 F1800
G1 X136.146 Y124.512 Z1.92 F30000
G1 X117.193 Y124.442 Z1.92
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01033
G1 X118.224 Y125.151 E.01572
G1 X118.867 Y125.392 E.01423
G1 X119.385 Y125.481 E.01091
G1 X118.669 Y125.478 E.01486
G1 X118.201 Y125.609 E.01008
G1 X117.886 Y125.762 E.00725
G1 X117.416 Y126.16 E.01279
G1 X117.193 Y126.478 E.00805
G1 X117.193 Y124.502 E.04098
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522312
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.15201
G1 X117.592 Y125.363 E-.15199
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.745 Y130.424 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.514852
G1 F3600
G1 X116.013 Y130.305 E.00701
G1 X116.466 Y129.997 E.01309
G1 X116.874 Y129.491 E.01554
G3 X116.872 Y130.424 I-216.866 J.061 E.02229
G1 X115.805 Y130.424 E.02552
; WIPE_START
G1 X116.013 Y130.305 E-.09105
G1 X116.466 Y129.997 E-.20796
G1 X116.874 Y129.491 E-.247
G1 X116.873 Y130.055 E-.21399
; WIPE_END
G1 E-.04 F1800
G1 X112.629 Y129.496 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.521622
G1 F3600
G1 X112.674 Y129.579 E.0023
G1 X113.042 Y129.987 E.01331
G1 X113.472 Y130.301 E.01292
G1 X113.805 Y130.434 E.00869
; LINE_WIDTH: 0.492922
G1 X113.95 Y130.454 E.00334
; LINE_WIDTH: 0.453877
G1 X114.095 Y130.474 E.00306
; LINE_WIDTH: 0.450429
G1 X113.879 Y130.456 E.0045
; LINE_WIDTH: 0.486026
G1 X113.663 Y130.438 E.00488
; LINE_WIDTH: 0.521622
G1 X113.447 Y130.421 E.00525
G1 X112.629 Y130.418 E.01983
G1 X112.629 Y129.556 E.02089
; WIPE_START
G1 X112.674 Y129.579 E-.01946
G1 X113.042 Y129.987 E-.20862
G1 X113.472 Y130.301 E-.20255
G1 X113.805 Y130.434 E-.13624
G1 X113.95 Y130.454 E-.05558
G1 X114.095 Y130.474 E-.05558
G1 X113.88 Y130.456 E-.08198
; WIPE_END
G1 E-.04 F1800
G1 X111.37 Y123.248 Z1.92 F30000
G1 X110.942 Y122.019 Z1.92
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.553252
G1 F3600
G1 X111.052 Y121.999 E.00288
; LINE_WIDTH: 0.513039
G1 X111.161 Y121.979 E.00266
; LINE_WIDTH: 0.472826
G1 X111.271 Y121.959 E.00244
; LINE_WIDTH: 0.432612
G1 X111.904 Y121.947 E.01258
; LINE_WIDTH: 0.407482
G1 X111.904 Y122.48 E.00996
G1 X111.621 Y122.305 E.00621
; LINE_WIDTH: 0.456072
G1 X111.395 Y122.21 E.00516
; LINE_WIDTH: 0.504662
G1 X111.168 Y122.115 E.00575
; LINE_WIDTH: 0.553252
G1 X110.997 Y122.043 E.00478
; WIPE_START
G1 X111.052 Y121.999 E-.02642
G1 X111.161 Y121.979 E-.04237
G1 X111.271 Y121.959 E-.04237
G1 X111.904 Y121.947 E-.24036
G1 X111.904 Y122.48 E-.20273
G1 X111.621 Y122.305 E-.12643
G1 X111.428 Y122.224 E-.07932
; WIPE_END
G1 E-.04 F1800
G1 X108.701 Y123.144 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.701 Y121.544 E.03319
G1 X109.713 Y121.544 E.02099
G3 X112.307 Y121.56 I.998 J48.304 E.05381
G1 X112.307 Y123.484 E.03992
G1 X112.053 Y123.127 E.00908
G2 X111.158 Y122.556 I-1.655 J1.608 E.02221
G1 X110.592 Y122.458 E.01191
G1 X109.88 Y122.483 E.01478
G2 X109.07 Y122.813 I.482 J2.348 E.01826
G1 X108.745 Y123.104 E.00904
; WIPE_START
G1 X108.701 Y121.544 E-.59308
G1 X109.14 Y121.544 E-.16693
; WIPE_END
G1 E-.04 F1800
G1 X110.942 Y122.019 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.553252
G1 F3600
G1 X110.585 Y122.001 E.00923
; LINE_WIDTH: 0.548172
G1 X109.799 Y122.017 E.02008
; LINE_WIDTH: 0.588442
G1 X109.663 Y122.037 E.00378
; LINE_WIDTH: 0.628712
G1 X109.527 Y122.057 E.00405
; LINE_WIDTH: 0.668982
G1 X109.391 Y122.077 E.00432
; LINE_WIDTH: 0.709252
G1 X109.255 Y122.097 E.0046
; WIPE_START
G1 X109.391 Y122.077 E-.06169
G1 X109.527 Y122.057 E-.06169
G1 X109.663 Y122.037 E-.06169
G1 X109.799 Y122.017 E-.06169
G1 X110.585 Y122.001 E-.35269
G1 X110.942 Y122.019 E-.16055
; WIPE_END
G1 E-.04 F1800
G1 X108.768 Y123.798 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.721 Y123.881 E.00197
G1 X108.276 Y123.881 E.00922
G1 X108.276 Y121.119 E.05728
G1 X112.256 Y121.119 E.08254
G1 X112.492 Y121.157 E.00495
G1 X112.639 Y121.277 E.00393
G1 X112.731 Y121.518 E.00535
G1 X112.731 Y123.041 E.0316
; LINE_WIDTH: 0.451822
G1 X112.73 Y123.77 E.01518
; LINE_WIDTH: 0.486232
G1 X112.713 Y124.09 E.00721
; LINE_WIDTH: 0.520642
G1 X112.695 Y124.409 E.00775
G1 X112.696 Y126.409 E.04839
; LINE_WIDTH: 0.519982
G1 X112.696 Y128.301 E.04571
; LINE_WIDTH: 0.558122
G1 X112.751 Y128.803 E.01314
G1 X112.859 Y128.988 E.00558
; LINE_WIDTH: 0.522079
G1 X112.968 Y129.172 E.0052
; LINE_WIDTH: 0.486036
G1 X113.077 Y129.357 E.00483
; LINE_WIDTH: 0.449992
G1 X113.5 Y129.779 E.01238
G1 X113.986 Y130.025 E.0113
G1 X114.559 Y130.119 E.01205
G1 X115.253 Y130.089 E.01442
G1 X115.766 Y129.92 E.01121
G1 X116.223 Y129.593 E.01165
G1 X116.56 Y129.136 E.01177
; LINE_WIDTH: 0.494232
G1 X116.669 Y128.899 E.00597
; LINE_WIDTH: 0.538472
G1 X116.778 Y128.663 E.00653
G1 X116.804 Y128.301 E.00909
; LINE_WIDTH: 0.522942
G1 X116.806 Y127.328 E.02365
G1 X116.787 Y127.042 E.00696
; LINE_WIDTH: 0.486467
G1 X116.769 Y126.756 E.00645
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.07353
G1 X116.868 Y123.393 E.0043
G1 X117.318 Y123.981 E.01535
G1 X117.798 Y124.407 E.01332
G1 X118.384 Y124.758 E.01416
G1 X118.945 Y124.975 E.01248
G2 X119.95 Y125.119 I1.027 J-3.583 E.02111
G1 X141.939 Y125.115 E.4561
G1 X142.479 Y124.984 E.01154
G2 X143.113 Y124.499 I-.844 J-1.763 E.01666
G1 X143.37 Y124.053 E.01068
G1 X143.467 Y123.531 E.01101
G1 X143.471 Y121.561 E.04087
G1 X143.522 Y121.322 E.00506
G1 X143.632 Y121.202 E.00339
G1 X143.846 Y121.12 E.00475
G1 X147.724 Y121.119 E.08043
G1 X147.724 Y122.095 E.02023
G1 X147.724 Y123.881 E.03705
G1 X147.28 Y123.881 E.00921
G1 X147.209 Y123.745 E.00317
G1 X146.933 Y123.359 E.00985
G2 X146.42 Y123.013 I-1.141 J1.14 E.01291
G1 X145.879 Y122.883 E.01154
G1 X145.475 Y122.93 E.00844
G1 X144.989 Y123.133 E.01092
G1 X144.596 Y123.481 E.01088
G1 X144.336 Y123.935 E.01086
G1 X144.253 Y124.278 E.00732
G2 X144.208 Y125.56 I33.091 J1.792 E.0266
G1 X144.089 Y125.78 E.00519
G1 X143.848 Y125.879 E.00541
G1 X118.854 Y125.885 E.51842
G1 X118.319 Y126.016 E.01144
G1 X117.891 Y126.281 E.01043
G1 X117.562 Y126.677 E.01068
; LINE_WIDTH: 0.483952
G1 X117.348 Y127.199 E.01263
; LINE_WIDTH: 0.518642
G1 X117.296 Y127.499 E.00735
; LINE_WIDTH: 0.538472
G1 X117.287 Y128.707 E.03027
G1 X117.309 Y128.994 E.00721
; LINE_WIDTH: 0.494232
G1 X117.331 Y129.28 E.00659
; LINE_WIDTH: 0.449992
G3 X117.304 Y130.61 I-15.676 J.355 E.0276
G1 X117.174 Y130.788 E.00457
G1 X116.948 Y130.88 E.00508
G1 X112.948 Y130.881 E.08297
G3 X112.367 Y130.816 I-.151 J-1.29 E.01221
G1 X112.216 Y130.661 E.00451
G1 X112.169 Y130.477 E.00393
G1 X112.169 Y129.591 E.01838
; LINE_WIDTH: 0.485746
G1 X112.186 Y129.341 E.00565
; LINE_WIDTH: 0.521499
G1 X112.204 Y129.09 E.00609
; LINE_WIDTH: 0.557252
G2 X112.202 Y128.301 I-3.696 J-.387 E.02054
; LINE_WIDTH: 0.520012
G1 X112.201 Y126.301 E.04833
; LINE_WIDTH: 0.520642
G1 X112.201 Y124.409 E.04576
; LINE_WIDTH: 0.538512
G1 X112.184 Y124.229 E.00454
G1 X112.058 Y123.949 E.00769
; LINE_WIDTH: 0.494252
G1 X111.933 Y123.669 E.00702
; LINE_WIDTH: 0.449992
G1 X111.557 Y123.24 E.01183
M73 P70 R4
G1 X111.065 Y122.97 E.01166
G1 X110.6 Y122.883 E.00981
G1 X109.864 Y122.924 E.01528
G1 X109.337 Y123.142 E.01184
G1 X108.919 Y123.53 E.01183
G1 X108.797 Y123.746 E.00514
M204 S250
G1 X109.121 Y123.996 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.089 Y124.047 E.00116
G1 X109.032 Y124.29 E.00481
G1 X107.867 Y124.29 E.02245
G1 X107.867 Y120.71 E.06901
G1 X111.867 Y120.71 E.0771
G3 X112.646 Y120.771 I.194 J2.523 E.01512
G1 X112.881 Y120.919 E.00535
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.206 Y128.72 E.00819
G1 X113.436 Y129.16 E.00955
G1 X113.771 Y129.473 E.00885
G1 X114.151 Y129.65 E.00807
G1 X114.549 Y129.71 E.00777
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00785
G1 X115.861 Y129.373 E.00838
G1 X116.147 Y129.042 E.00842
G1 X116.321 Y128.621 E.00877
G1 X116.36 Y128.301 E.00623
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430602
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437842
G1 X116.786 Y122.087 E.00753
G1 X116.948 Y122.634 E.01148
; LINE_WIDTH: 0.419992
G1 X117.197 Y123.149 E.01104
G1 X117.594 Y123.679 E.01276
G1 X118.016 Y124.061 E.01098
G1 X118.538 Y124.378 E.01176
G2 X119.95 Y124.71 I1.523 J-3.314 E.02814
G1 X141.939 Y124.706 E.42385
G1 X142.365 Y124.59 E.00853
G1 X142.715 Y124.34 E.00829
G1 X142.966 Y123.955 E.00885
G1 X143.058 Y123.53 E.00838
G1 X143.062 Y121.56 E.03798
G1 X143.149 Y121.138 E.00831
G3 X143.828 Y120.71 I.75 J.437 E.01607
G1 X148.133 Y120.71 E.08298
G1 X148.133 Y122.095 E.02669
G1 X148.133 Y124.29 E.04232
G1 X146.968 Y124.29 E.02245
G1 X146.935 Y124.109 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00887
G1 X145.933 Y123.3 E.00893
G1 X145.527 Y123.336 E.00786
G1 X145.18 Y123.495 E.00735
G1 X144.886 Y123.77 E.00777
G1 X144.703 Y124.117 E.00755
G1 X144.639 Y124.469 E.0069
G1 X144.635 Y125.44 E.01872
G1 X144.548 Y125.859 E.00824
G1 X144.361 Y126.096 E.0058
G1 X144.095 Y126.248 E.00592
G1 X143.888 Y126.288 E.00407
G1 X118.86 Y126.294 E.48242
G1 X118.433 Y126.41 E.00853
G1 X118.13 Y126.613 E.00704
G1 X117.89 Y126.92 E.0075
G1 X117.756 Y127.323 E.00819
G1 X117.74 Y127.499 E.00341
G1 X117.74 Y129.499 E.03855
G3 X117.696 Y130.749 I-8.179 J.34 E.02413
G1 X117.545 Y131.015 E.00589
G1 X117.329 Y131.19 E.00536
G1 X116.969 Y131.29 E.0072
G1 X112.969 Y131.29 E.0771
G3 X112.276 Y131.237 I-.161 J-2.474 E.01344
G1 X112.038 Y131.097 E.00532
G1 X111.848 Y130.856 E.00591
G1 X111.76 Y130.493 E.00722
G1 X111.756 Y124.41 E.11725
G1 X111.64 Y123.983 E.00853
G1 X111.39 Y123.633 E.00828
G1 X111.036 Y123.395 E.00823
G1 X110.61 Y123.292 E.00845
G1 X110.055 Y123.301 E.0107
G1 X109.699 Y123.412 E.00719
G1 X109.317 Y123.685 E.00906
G1 X109.153 Y123.945 E.00592
; WIPE_START
M204 S10000
G1 X109.089 Y124.047 E-.04559
G1 X109.032 Y124.29 E-.09487
G1 X107.867 Y124.29 E-.4425
G1 X107.867 Y123.824 E-.17704
; WIPE_END
G1 E-.04
G1 X115.5 Y123.805 Z1.92 F30000
G1 X143.914 Y123.735 Z1.92
G1 Z1.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.535192
G1 F3600
G1 X143.802 Y124.204 E.012
; WIPE_START
G1 X143.914 Y123.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.301 Y124.277 Z1.92 F30000
G1 X119.385 Y125.481 Z1.92
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.409792
G1 F3600
G1 X119.891 Y125.501 E.0095
; LINE_WIDTH: 0.368552
G1 X119.95 Y125.502 E.00099
; LINE_WIDTH: 0.366792
G1 X121.939 Y125.501 E.03317
; LINE_WIDTH: 0.366602
G1 X125.939 Y125.501 E.06666
; LINE_WIDTH: 0.366422
G1 X129.939 Y125.5 E.06662
; LINE_WIDTH: 0.366242
G1 X133.939 Y125.499 E.06659
; LINE_WIDTH: 0.366062
G1 X137.939 Y125.498 E.06655
; LINE_WIDTH: 0.365882
G1 X141.939 Y125.497 E.06652
; LINE_WIDTH: 0.380772
G1 X142.111 Y125.49 E.00299
; WIPE_START
G1 X141.939 Y125.497 E-.06545
G1 X140.111 Y125.498 E-.69455
; WIPE_END
G1 E-.04 F1800
G1 X132.614 Y126.932 Z1.92 F30000
G1 X114.095 Y130.474 Z1.92
G1 Z1.52
G1 E.8 F1800
; LINE_WIDTH: 0.414832
G1 F3600
G1 X115.109 Y130.496 E.01929
; LINE_WIDTH: 0.386312
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.10209
G1 X114.095 Y130.474 E-.65791
; WIPE_END
G1 E-.04 F1800
G1 X121.625 Y129.225 Z1.92 F30000
G1 X151.367 Y124.29 Z1.92
G1 Z1.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.367 Y120.71 E.06901
G1 X151.647 Y120.71 E.0054
G1 F2250
G1 X151.927 Y120.71 E.0054
G1 F2700
G1 X152.207 Y120.71 E.0054
G1 F3150
G1 X152.354 Y120.71 E.00283
G1 X152.354 Y121.203 E.00951
G1 X152.354 Y124.29 E.0595
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.207 Y124.29 E.00283
G1 F2700
G1 X151.927 Y124.29 E.0054
G1 F2250
G1 X151.647 Y124.29 E.0054
G1 F1800
G1 X151.427 Y124.29 E.00424
; WIPE_START
M204 S10000
G1 X151.394 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X151.861 Y121.203 Z1.92 F30000
G1 Z1.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.618172
G1 F3600
G1 X151.861 Y123.797 E.07512
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X151.861 Y121.797 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/45
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.92 I-.064 J-1.215 P1  F30000
G1 X104.552 Y124.29 Z1.92
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X104.222 Y124.29 E.00635
G1 F2250
G1 X103.893 Y124.29 E.00635
G1 F2700
G1 X103.605 Y124.29 E.00555
G1 X103.605 Y120.71 E.06901
G1 X103.893 Y120.71 E.00555
G1 F2250
G1 X104.222 Y120.71 E.00635
G1 F1800
G1 X104.552 Y120.71 E.00635
G1 X104.552 Y121.183 E.00912
G1 X104.552 Y124.23 E.05873
; WIPE_START
M204 S10000
G1 X104.222 Y124.29 E-.12725
G1 X103.893 Y124.29 E-.1252
G1 X103.605 Y124.29 E-.10935
G1 X103.605 Y123.242 E-.3982
; WIPE_END
G1 E-.04
G1 X104.078 Y121.183 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.578192
G1 F3600
G1 X104.078 Y123.817 E.07113
; WIPE_START
G1 X104.078 Y121.817 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.709 Y121.963 Z2.04 F30000
G1 X144.317 Y122.589 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.450212
G1 F3600
G1 X144.319 Y121.968 E.01289
G1 X144.53 Y121.968 E.00439
; LINE_WIDTH: 0.497012
G1 X144.774 Y121.992 E.00563
; LINE_WIDTH: 0.543812
G1 X145.017 Y122.015 E.00619
; LINE_WIDTH: 0.590612
G1 X145.26 Y122.038 E.00675
G1 X145.05 Y122.148 E.00654
; LINE_WIDTH: 0.543812
G1 X144.84 Y122.258 E.006
; LINE_WIDTH: 0.497012
G1 X144.63 Y122.368 E.00546
; LINE_WIDTH: 0.450212
G1 X144.366 Y122.555 E.00671
; WIPE_START
G1 X144.319 Y121.968 E-.22359
G1 X144.53 Y121.968 E-.08047
G1 X144.774 Y121.992 E-.09282
G1 X145.017 Y122.015 E-.09282
G1 X145.26 Y122.038 E-.09282
G1 X145.05 Y122.148 E-.09002
G1 X144.846 Y122.255 E-.08744
; WIPE_END
G1 E-.04 F1800
G1 X143.896 Y123.794 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.526272
G1 F3600
G1 X143.9 Y123.765 E.00073
; LINE_WIDTH: 0.520602
G1 X143.896 Y123.435 E.00797
; LINE_WIDTH: 0.485297
G1 X143.892 Y123.106 E.0074
; LINE_WIDTH: 0.449992
G1 X143.895 Y121.588 E.03149
G1 X143.934 Y121.544 E.00122
G1 X147.218 Y121.544 E.06812
G1 X147.218 Y122.084 E.01121
G1 X147.218 Y123.052 E.02008
G2 X146.529 Y122.603 I-1.385 J1.373 E.01719
G1 X145.879 Y122.459 E.0138
G1 X145.345 Y122.525 E.01116
G1 X144.83 Y122.742 E.01161
G1 X144.478 Y122.994 E.00895
G1 X144.245 Y123.245 E.00711
; LINE_WIDTH: 0.488132
G1 X144.071 Y123.52 E.00736
; LINE_WIDTH: 0.526272
G1 X143.929 Y123.744 E.00649
; WIPE_START
G1 X143.9 Y123.765 E-.01347
G1 X143.896 Y123.435 E-.12524
G1 X143.892 Y123.106 E-.12524
G1 X143.895 Y121.8 E-.49605
; WIPE_END
G1 E-.04 F1800
G1 X146.678 Y122.084 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.682192
G1 F3600
G1 X146.478 Y122.063 E.00644
; LINE_WIDTH: 0.640782
G1 X146.278 Y122.043 E.00604
; LINE_WIDTH: 0.599372
G1 X146.079 Y122.022 E.00563
; LINE_WIDTH: 0.557962
G1 X145.879 Y122.001 E.00522
; LINE_WIDTH: 0.553582
G1 X145.57 Y122.02 E.00801
; LINE_WIDTH: 0.590612
G1 X145.26 Y122.038 E.00857
; WIPE_START
G1 X145.57 Y122.02 E-.16565
G1 X145.879 Y122.001 E-.16565
G1 X146.079 Y122.022 E-.10717
G1 X146.278 Y122.043 E-.10718
G1 X146.478 Y122.063 E-.10718
G1 X146.678 Y122.084 E-.10717
; WIPE_END
G1 E-.04 F1800
G1 X142.638 Y125.412 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.536462
G1 F3600
G1 X142.856 Y125.318 E.00592
G1 X143.321 Y124.978 E.01438
G1 X143.656 Y124.521 E.01413
; LINE_WIDTH: 0.534322
G1 X143.789 Y124.246 E.00759
G1 X143.763 Y124.555 E.0077
; LINE_WIDTH: 0.536462
G1 X143.758 Y125.412 E.02139
G1 X142.698 Y125.412 E.02646
; WIPE_START
G1 X142.856 Y125.318 E-.06979
G1 X143.321 Y124.978 E-.21888
G1 X143.656 Y124.521 E-.21508
G1 X143.789 Y124.246 E-.11595
G1 X143.763 Y124.555 E-.1176
G1 X143.762 Y124.614 E-.02269
; WIPE_END
G1 E-.04 F1800
G1 X136.13 Y124.565 Z2.04 F30000
G1 X117.193 Y124.442 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01033
G1 X118.187 Y125.136 E.01489
G1 X118.858 Y125.39 E.01488
G1 X119.386 Y125.479 E.01111
G1 X118.767 Y125.473 E.01284
G1 X118.192 Y125.603 E.01223
G2 X117.526 Y126.046 I1.078 J2.34 E.01666
G1 X117.193 Y126.483 E.01138
G1 X117.193 Y124.502 E.04108
G1 X117.688 Y125.313 F30000
; LINE_WIDTH: 0.527712
G1 F3600
G2 X117.719 Y125.368 I-.027 J.052 E.00745
; WIPE_START
M73 P71 R4
G1 X117.688 Y125.422 E-.152
G1 X117.625 Y125.422 E-.15201
G1 X117.594 Y125.368 E-.152
G1 X117.625 Y125.313 E-.152
G1 X117.688 Y125.313 E-.15201
; WIPE_END
G1 E-.04 F1800
G1 X115.741 Y130.424 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.514002
G1 F3600
G1 X116.302 Y130.122 E.01521
G1 X116.557 Y129.9 E.00807
G1 X116.872 Y129.493 E.0123
G1 X116.871 Y130.424 E.02224
G1 X115.801 Y130.424 E.02554
; WIPE_START
G1 X116.302 Y130.122 E-.2223
G1 X116.557 Y129.9 E-.12843
G1 X116.872 Y129.493 E-.19582
G1 X116.871 Y130.054 E-.21345
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.501 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.517872
G1 F3600
G1 X113.039 Y129.994 E.01549
G1 X113.3 Y130.197 E.00794
G1 X113.764 Y130.422 E.0124
G3 X112.627 Y130.419 I-.273 J-109.852 E.02734
G1 X112.627 Y129.561 E.02066
; WIPE_START
G1 X113.039 Y129.994 E-.22754
G1 X113.3 Y130.197 E-.12544
G1 X113.764 Y130.422 E-.19586
G1 X113.208 Y130.421 E-.21116
; WIPE_END
G1 E-.04 F1800
G1 X111.185 Y123.061 Z2.04 F30000
G1 X110.897 Y122.015 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.543932
G1 F3600
G1 X111.032 Y121.992 E.00346
; LINE_WIDTH: 0.499142
G1 X111.167 Y121.97 E.00316
; LINE_WIDTH: 0.454352
G1 X111.902 Y121.949 E.0154
; LINE_WIDTH: 0.411522
G1 X111.902 Y122.474 E.0099
G1 X111.586 Y122.294 E.00685
; LINE_WIDTH: 0.455659
G1 X111.357 Y122.201 E.00521
; LINE_WIDTH: 0.499796
G1 X111.127 Y122.108 E.00574
; LINE_WIDTH: 0.543932
G1 X110.953 Y122.037 E.00476
; WIPE_START
G1 X111.032 Y121.992 E-.03455
G1 X111.167 Y121.97 E-.05188
G1 X111.902 Y121.949 E-.27933
G1 X111.902 Y122.474 E-.19955
G1 X111.586 Y122.294 E-.13798
G1 X111.448 Y122.238 E-.05671
; WIPE_END
G1 E-.04 F1800
G1 X108.782 Y123.05 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.782 Y121.544 E.03124
G1 X109.709 Y121.544 E.01922
G3 X112.307 Y121.56 I.998 J48.174 E.05389
G1 X112.307 Y123.491 E.04005
G1 X112.012 Y123.084 E.01042
G2 X111.072 Y122.529 I-1.675 J1.764 E.02284
G1 X110.593 Y122.458 E.01004
G1 X109.881 Y122.483 E.01477
G2 X108.827 Y123.01 I.496 J2.311 E.0247
; WIPE_START
G1 X108.782 Y121.544 E-.55737
G1 X109.315 Y121.544 E-.20263
; WIPE_END
G1 E-.04 F1800
G1 X110.897 Y122.015 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.543932
G1 F3600
G1 X110.585 Y122.001 E.00793
; LINE_WIDTH: 0.525712
G1 X110.034 Y122.006 E.01348
; LINE_WIDTH: 0.565872
G1 X109.856 Y122.026 E.00471
; LINE_WIDTH: 0.606032
G1 X109.679 Y122.046 E.00506
; LINE_WIDTH: 0.646192
G1 X109.502 Y122.066 E.00541
; LINE_WIDTH: 0.686352
G1 X109.324 Y122.086 E.00576
; WIPE_START
G1 X109.502 Y122.066 E-.08595
G1 X109.679 Y122.046 E-.08595
G1 X109.856 Y122.026 E-.08595
G1 X110.034 Y122.006 E-.08595
G1 X110.585 Y122.001 E-.26553
G1 X110.897 Y122.015 E-.15068
; WIPE_END
G1 E-.04 F1800
G1 X108.793 Y123.753 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.721 Y123.881 E.00304
G1 X108.358 Y123.881 E.00753
G1 X108.358 Y121.119 E.05728
G1 X112.257 Y121.119 E.08087
G1 X112.491 Y121.157 E.00493
G1 X112.639 Y121.277 E.00394
G1 X112.731 Y121.518 E.00535
G1 X112.731 Y123.721 E.04569
; LINE_WIDTH: 0.485682
G1 X112.713 Y124.058 E.00759
; LINE_WIDTH: 0.521372
G1 X112.695 Y124.395 E.00818
G1 X112.696 Y126.395 E.04846
; LINE_WIDTH: 0.520472
G1 X112.696 Y128.301 E.04609
; LINE_WIDTH: 0.554372
G1 X112.745 Y128.775 E.01233
G1 X112.79 Y128.86 E.00248
; LINE_WIDTH: 0.520092
G1 X112.834 Y128.945 E.00232
; LINE_WIDTH: 0.485812
G1 X113.103 Y129.393 E.01176
; LINE_WIDTH: 0.449992
G1 X113.522 Y129.795 E.01204
G1 X114.021 Y130.034 E.01147
G1 X114.559 Y130.119 E.0113
G1 X115.249 Y130.09 E.01433
G1 X115.741 Y129.933 E.01071
G1 X116.207 Y129.608 E.01178
G1 X116.56 Y129.136 E.01222
; LINE_WIDTH: 0.493862
G1 X116.669 Y128.899 E.00596
; LINE_WIDTH: 0.537732
G1 X116.777 Y128.663 E.00652
G1 X116.803 Y128.301 E.00908
; LINE_WIDTH: 0.535982
G1 X116.812 Y127.155 E.02859
G1 X116.791 Y126.893 E.00655
; LINE_WIDTH: 0.492987
G1 X116.769 Y126.632 E.006
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.07096
G1 X116.869 Y123.393 E.00431
G1 X117.318 Y123.981 E.01536
G1 X117.798 Y124.408 E.01332
G1 X118.347 Y124.743 E.01333
G1 X118.945 Y124.975 E.01332
G2 X119.95 Y125.119 I1.028 J-3.583 E.02111
G1 X141.878 Y125.119 E.45485
G1 X142.39 Y125.018 E.01082
G1 X142.595 Y124.93 E.00463
G1 X142.987 Y124.651 E.00998
G1 X143.273 Y124.255 E.01013
G1 X143.366 Y124.042 E.00482
G1 X143.467 Y123.531 E.0108
G1 X143.471 Y121.587 E.04033
G1 X143.513 Y121.36 E.00479
G1 X143.622 Y121.212 E.0038
G1 X143.887 Y121.12 E.00582
G1 X147.642 Y121.119 E.0779
G1 X147.642 Y122.084 E.02001
G1 X147.642 Y123.881 E.03727
G1 X147.28 Y123.881 E.00752
G1 X147.224 Y123.77 E.00256
G1 X146.932 Y123.359 E.01047
G2 X146.412 Y123.011 I-1.121 J1.115 E.01307
G1 X145.879 Y122.883 E.01136
G1 X145.419 Y122.943 E.00963
G1 X144.949 Y123.16 E.01073
G1 X144.556 Y123.533 E.01125
G1 X144.33 Y123.957 E.00996
G1 X144.236 Y124.38 E.00899
G3 X144.208 Y125.56 I-36.155 J-.263 E.02448
G1 X144.089 Y125.78 E.00519
G1 X143.848 Y125.879 E.00541
G1 X118.949 Y125.881 E.51645
G1 X118.49 Y125.954 E.00965
G1 X118.011 Y126.187 E.01105
G1 X117.609 Y126.605 E.01203
; LINE_WIDTH: 0.492987
G1 X117.465 Y126.895 E.0074
; LINE_WIDTH: 0.535982
G1 X117.321 Y127.185 E.00808
G1 X117.296 Y127.499 E.00784
; LINE_WIDTH: 0.537732
G1 X117.285 Y128.707 E.03026
G1 X117.307 Y128.994 E.00719
; LINE_WIDTH: 0.493862
G1 X117.329 Y129.281 E.00658
; LINE_WIDTH: 0.449992
G3 X117.298 Y130.636 I-14.485 J.349 E.02813
G1 X117.186 Y130.779 E.00376
G1 X116.951 Y130.88 E.0053
G1 X112.951 Y130.881 E.08297
G3 X112.416 Y130.847 I-.04 J-3.64 E.01113
G1 X112.234 Y130.692 E.00497
G1 X112.169 Y130.477 E.00466
G1 X112.168 Y129.434 E.02164
; LINE_WIDTH: 0.484786
G1 X112.186 Y129.228 E.00463
; LINE_WIDTH: 0.519579
G1 X112.203 Y129.022 E.00498
; LINE_WIDTH: 0.554372
G2 X112.202 Y128.301 I-3.041 J-.358 E.01869
; LINE_WIDTH: 0.520512
G1 X112.201 Y126.301 E.04838
; LINE_WIDTH: 0.521372
G1 X112.199 Y124.395 E.04617
; LINE_WIDTH: 0.542122
G1 X112.18 Y124.201 E.00493
G1 X112.044 Y123.915 E.008
; LINE_WIDTH: 0.496057
G1 X111.908 Y123.629 E.00729
; LINE_WIDTH: 0.449992
G2 X111.512 Y123.206 I-1.325 J.845 E.01208
G1 X110.99 Y122.945 E.0121
G1 X110.6 Y122.883 E.00821
G1 X109.865 Y122.924 E.01527
G1 X109.337 Y123.142 E.01185
G1 X108.919 Y123.53 E.01184
G1 X108.822 Y123.701 E.00406
M204 S250
G1 X109.147 Y123.951 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.13 Y123.978 E.00062
G2 X109.032 Y124.29 I1.159 J.535 E.00632
G1 X107.948 Y124.29 E.02088
G1 X107.948 Y120.71 E.06901
G1 X111.948 Y120.71 E.0771
G3 X112.646 Y120.771 I.154 J2.259 E.01356
G1 X112.881 Y120.919 E.00535
G1 X113.05 Y121.141 E.00536
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.201 Y128.703 E.00785
G1 X113.367 Y129.064 E.00765
G1 X113.671 Y129.399 E.00873
G1 X114.033 Y129.61 E.00807
G1 X114.549 Y129.71 E.01014
G1 X115.097 Y129.701 E.01055
G1 X115.472 Y129.608 E.00746
G1 X115.846 Y129.386 E.00837
G1 X116.146 Y129.043 E.00879
G1 X116.321 Y128.621 E.00881
G1 X116.36 Y128.301 E.00621
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430592
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437832
G1 X116.786 Y122.087 E.00753
G1 X116.948 Y122.634 E.01148
; LINE_WIDTH: 0.419992
G1 X117.197 Y123.15 E.01104
G1 X117.594 Y123.679 E.01276
G1 X118.017 Y124.062 E.01098
G1 X118.5 Y124.363 E.01099
G1 X119.029 Y124.574 E.01098
G2 X119.95 Y124.71 I.929 J-3.114 E.01799
G1 X141.878 Y124.71 E.42268
G1 X142.3 Y124.619 E.00831
G1 X142.664 Y124.39 E.00829
G1 X142.937 Y124.021 E.00885
G1 X143.058 Y123.53 E.00974
G1 X143.062 Y121.441 E.04026
G1 X143.156 Y121.126 E.00635
G1 X143.298 Y120.937 E.00456
G1 X143.53 Y120.781 E.00538
G1 X143.841 Y120.71 E.00616
G1 X148.052 Y120.71 E.08116
G1 X148.052 Y122.084 E.02648
G1 X148.052 Y124.29 E.04252
G1 X146.968 Y124.29 E.02088
G1 X146.935 Y124.109 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00887
G1 X145.934 Y123.3 E.00892
G1 X145.496 Y123.345 E.00849
G1 X145.141 Y123.521 E.00763
G1 X144.856 Y123.812 E.00786
G2 X144.639 Y124.469 I1.095 J.726 E.0135
G1 X144.635 Y125.441 E.01873
G1 X144.548 Y125.859 E.00823
G1 X144.361 Y126.096 E.00581
G1 X144.095 Y126.248 E.00592
G1 X143.888 Y126.288 E.00407
G1 X118.949 Y126.29 E.48069
G1 X118.562 Y126.356 E.00757
G1 X118.214 Y126.542 E.00761
G1 X117.921 Y126.87 E.00847
G1 X117.782 Y127.189 E.00671
G1 X117.74 Y127.499 E.00603
G1 X117.736 Y130.436 E.05661
G1 X117.68 Y130.794 E.007
G1 X117.547 Y131.013 E.00493
G1 X117.331 Y131.188 E.00536
G1 X116.972 Y131.29 E.0072
G1 X112.972 Y131.29 E.0771
G3 X112.275 Y131.237 I-.163 J-2.488 E.01352
G1 X112.055 Y131.112 E.00487
G1 X111.874 Y130.901 E.00536
G1 X111.76 Y130.492 E.00818
G1 X111.755 Y124.396 E.11752
G1 X111.625 Y123.952 E.00891
G1 X111.365 Y123.609 E.00831
G1 X110.999 Y123.385 E.00827
G1 X110.61 Y123.292 E.00771
G1 X110.055 Y123.301 E.01069
G1 X109.656 Y123.426 E.00807
G1 X109.317 Y123.686 E.00823
G1 X109.179 Y123.901 E.00492
; WIPE_START
M204 S10000
G1 X109.13 Y123.978 E-.03494
G1 X109.032 Y124.29 E-.12423
G1 X107.948 Y124.29 E-.41164
G1 X107.948 Y123.792 E-.18918
; WIPE_END
G1 E-.04
G1 X115.581 Y123.793 Z2.04 F30000
G1 X143.896 Y123.794 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.526272
G1 F3600
G1 X143.789 Y124.246 E.01137
; WIPE_START
G1 X143.896 Y123.794 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.282 Y124.318 Z2.04 F30000
G1 X119.386 Y125.479 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.405752
G1 F3600
G1 X119.891 Y125.499 E.00939
; LINE_WIDTH: 0.364692
G1 X119.95 Y125.5 E.00097
; LINE_WIDTH: 0.362952
G1 X121.878 Y125.5 E.0318
; LINE_WIDTH: 0.362762
G1 X125.878 Y125.5 E.06591
; LINE_WIDTH: 0.362562
G1 X129.878 Y125.5 E.06587
; LINE_WIDTH: 0.362372
G1 X133.878 Y125.499 E.06583
; LINE_WIDTH: 0.362272
G1 X135.878 Y125.499 E.03291
; LINE_WIDTH: 0.362082
G1 X139.878 Y125.499 E.06578
; LINE_WIDTH: 0.361982
G1 X141.878 Y125.499 E.03288
; LINE_WIDTH: 0.376832
G1 X142.05 Y125.491 E.00295
; WIPE_START
G1 X141.878 Y125.499 E-.06532
G1 X140.05 Y125.499 E-.69468
; WIPE_END
G1 E-.04 F1800
G1 X132.558 Y126.956 Z2.04 F30000
G1 X114.373 Y130.492 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.378552
G1 F3600
G1 X115.109 Y130.496 E.01269
; LINE_WIDTH: 0.386312
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.13385
G1 X114.373 Y130.492 E-.62615
; WIPE_END
G1 E-.04 F1800
G1 X121.901 Y129.233 Z2.04 F30000
G1 X151.448 Y124.29 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.448 Y120.71 E.06901
G1 X151.778 Y120.71 E.00635
G1 F2250
G1 X152.107 Y120.71 E.00635
G1 F2700
G1 X152.395 Y120.71 E.00555
G1 X152.395 Y121.183 E.00912
G1 X152.395 Y124.29 E.05988
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.107 Y124.29 E.00555
G1 F2250
G1 X151.778 Y124.29 E.00635
G1 F1800
G1 X151.508 Y124.29 E.00519
; WIPE_START
M204 S10000
G1 X151.475 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X151.922 Y121.183 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.578192
G1 F3600
G1 X151.922 Y123.817 E.07113
; CHANGE_LAYER
; Z_HEIGHT: 1.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X151.922 Y121.817 E-.76
; WIPE_END
M73 P72 R4
G1 E-.04 F1800
; layer num/total_layer_count: 14/45
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.04 I-.063 J-1.215 P1  F30000
G1 X104.484 Y124.29 Z2.04
G1 Z1.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X104.095 Y124.29 E.00749
G1 F2250
G1 X103.707 Y124.29 E.00749
G1 F2700
G1 X103.569 Y124.29 E.00266
G1 X103.569 Y120.71 E.06901
G1 X103.707 Y120.71 E.00266
G1 F2250
G1 X104.095 Y120.71 E.00749
G1 F1800
G1 X104.484 Y120.71 E.00749
G1 X104.484 Y121.167 E.00882
G1 X104.484 Y124.23 E.05903
; WIPE_START
M204 S10000
G1 X104.095 Y124.29 E-.14937
G1 X103.707 Y124.29 E-.14763
G1 X103.569 Y124.29 E-.05239
G1 X103.569 Y123.209 E-.41061
; WIPE_END
G1 E-.04
G1 X104.026 Y121.167 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.546372
G1 F3600
G1 X104.026 Y123.833 E.06784
; WIPE_START
G1 X104.026 Y121.833 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.657 Y121.976 Z2.16 F30000
G1 X144.318 Y122.587 Z2.16
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.451632
G1 F3600
G1 X144.319 Y121.969 E.01288
G1 X144.744 Y121.969 E.00885
; LINE_WIDTH: 0.497959
G1 X144.916 Y121.992 E.004
; LINE_WIDTH: 0.544286
G1 X145.088 Y122.015 E.0044
; LINE_WIDTH: 0.590612
G1 X145.26 Y122.038 E.00479
G1 X145.114 Y122.114 E.00455
; LINE_WIDTH: 0.544286
G1 X144.967 Y122.19 E.00418
; LINE_WIDTH: 0.497959
G1 X144.821 Y122.266 E.00381
; LINE_WIDTH: 0.451632
G1 X144.369 Y122.555 E.01118
; WIPE_START
G1 X144.319 Y121.969 E-.22352
G1 X144.744 Y121.969 E-.16146
G1 X144.916 Y121.992 E-.0659
G1 X145.088 Y122.015 E-.0659
G1 X145.26 Y122.038 E-.0659
G1 X145.114 Y122.114 E-.06265
G1 X144.967 Y122.19 E-.06264
G1 X144.846 Y122.253 E-.05203
; WIPE_END
G1 E-.04 F1800
G1 X143.899 Y123.788 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.526552
G1 F3600
G1 X143.905 Y123.734 E.00133
; LINE_WIDTH: 0.516132
G1 X143.898 Y123.417 E.00759
; LINE_WIDTH: 0.483062
G1 X143.892 Y123.1 E.00708
; LINE_WIDTH: 0.449992
G1 X143.895 Y121.588 E.03137
G1 X143.934 Y121.544 E.00122
G1 X147.15 Y121.544 E.06671
G1 X147.15 Y122.076 E.01104
G1 X147.15 Y122.99 E.01898
G1 X146.888 Y122.785 E.0069
G1 X146.472 Y122.587 E.00957
G1 X145.879 Y122.459 E.01258
G1 X145.345 Y122.525 E.01115
G1 X144.84 Y122.741 E.01139
G1 X144.449 Y123.018 E.00994
G1 X144.247 Y123.239 E.00621
; LINE_WIDTH: 0.488272
G1 X144.073 Y123.513 E.00735
; LINE_WIDTH: 0.526552
G1 X143.931 Y123.737 E.00649
; WIPE_START
G1 X143.905 Y123.734 E-.0103
G1 X143.898 Y123.417 E-.12037
G1 X143.892 Y123.1 E-.12037
G1 X143.895 Y121.761 E-.50895
; WIPE_END
G1 E-.04 F1800
G1 X146.618 Y122.076 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.665472
G1 F3600
G1 X146.372 Y122.051 E.00775
; LINE_WIDTH: 0.615812
G1 X146.125 Y122.026 E.00715
; LINE_WIDTH: 0.566152
G1 X145.879 Y122.001 E.00654
; LINE_WIDTH: 0.553552
G1 X145.569 Y122.02 E.008
; LINE_WIDTH: 0.590612
G1 X145.26 Y122.038 E.00856
; WIPE_START
G1 X145.569 Y122.02 E-.17285
G1 X145.879 Y122.001 E-.17285
G1 X146.125 Y122.026 E-.1381
G1 X146.372 Y122.051 E-.1381
G1 X146.618 Y122.076 E-.1381
; WIPE_END
G1 E-.04 F1800
G1 X142.656 Y125.411 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.538422
G1 F3600
G2 X143.541 Y124.708 I-.948 J-2.101 E.02861
G1 X143.805 Y124.188 E.01461
G2 X143.757 Y125.411 I8.3 J.934 E.03069
G1 X142.716 Y125.411 E.0261
; WIPE_START
G1 X142.975 Y125.246 E-.1167
G1 X143.28 Y125.006 E-.14741
G1 X143.541 Y124.708 E-.15049
G1 X143.805 Y124.188 E-.22147
G1 X143.779 Y124.513 E-.12393
; WIPE_END
G1 E-.04 F1800
G1 X136.147 Y124.492 Z2.16 F30000
G1 X117.193 Y124.439 Z2.16
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01038
G1 X118.225 Y125.151 E.01572
G1 X118.867 Y125.392 E.01422
G1 X119.386 Y125.481 E.01092
G1 X118.86 Y125.461 E.01092
G1 X118.574 Y125.501 E.00599
G1 X118.001 Y125.69 E.0125
G1 X117.563 Y126.011 E.01127
G1 X117.303 Y126.307 E.00817
G1 X117.193 Y126.496 E.00453
G1 X117.193 Y124.499 E.04144
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522312
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.15201
G1 X117.592 Y125.363 E-.15199
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.75 Y130.421 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.513622
G1 F3600
G1 X116.309 Y130.117 E.01518
G1 X116.557 Y129.9 E.00786
G1 X116.875 Y129.488 E.01241
G3 X116.869 Y130.42 I-71.244 J.067 E.02223
G1 X115.81 Y130.421 E.02526
; WIPE_START
G1 X116.309 Y130.117 E-.22199
G1 X116.557 Y129.9 E-.1252
G1 X116.875 Y129.488 E-.19776
G1 X116.872 Y130.054 E-.21505
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.501 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.517742
G1 F3600
G1 X113.039 Y129.994 E.01546
G1 X113.3 Y130.196 E.00794
G1 X113.761 Y130.421 E.01233
G3 X112.627 Y130.419 I-.389 J-112.304 E.02726
G1 X112.627 Y129.561 E.02065
; WIPE_START
G1 X113.039 Y129.994 E-.22725
G1 X113.3 Y130.196 E-.12537
G1 X113.761 Y130.421 E-.19483
G1 X113.201 Y130.42 E-.21255
; WIPE_END
G1 E-.04 F1800
G1 X111.237 Y123.045 Z2.16 F30000
G1 X110.964 Y122.022 Z2.16
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.558372
G1 F3600
G1 X111.084 Y121.999 E.00317
; LINE_WIDTH: 0.512612
G1 X111.203 Y121.976 E.0029
; LINE_WIDTH: 0.466852
G1 X111.323 Y121.953 E.00262
; LINE_WIDTH: 0.421092
G1 X111.904 Y121.946 E.01124
; LINE_WIDTH: 0.406292
G1 X111.904 Y122.485 E.01003
G1 X111.625 Y122.305 E.00618
; LINE_WIDTH: 0.444312
G1 X111.46 Y122.234 E.00368
; LINE_WIDTH: 0.482332
G1 X111.295 Y122.163 E.00401
; LINE_WIDTH: 0.520352
G1 X111.13 Y122.093 E.00435
; LINE_WIDTH: 0.558372
G1 X111.02 Y122.046 E.00312
; WIPE_START
G1 X111.084 Y121.999 E-.03016
G1 X111.203 Y121.976 E-.04624
G1 X111.323 Y121.953 E-.04624
G1 X111.904 Y121.946 E-.22089
G1 X111.904 Y122.485 E-.20491
G1 X111.625 Y122.305 E-.12623
G1 X111.46 Y122.234 E-.06829
G1 X111.419 Y122.216 E-.01705
; WIPE_END
G1 E-.04 F1800
G1 X108.85 Y122.991 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.85 Y121.544 E.03002
G1 X109.714 Y121.544 E.01792
G3 X112.307 Y121.56 I.997 J47.614 E.05378
G1 X112.307 Y123.47 E.03963
G2 X111.2 Y122.571 I-1.776 J1.055 E.03018
G1 X110.592 Y122.458 E.01283
G1 X109.881 Y122.483 E.01477
G1 X109.553 Y122.581 E.00709
G1 X109.07 Y122.813 E.01112
G1 X108.896 Y122.953 E.00463
; WIPE_START
G1 X108.85 Y121.544 E-.53598
G1 X109.439 Y121.544 E-.22402
; WIPE_END
G1 E-.04 F1800
G1 X109.383 Y122.076 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.667152
G1 F3600
G1 X109.6 Y122.053 E.00684
; LINE_WIDTH: 0.620012
G1 X109.817 Y122.029 E.00634
; LINE_WIDTH: 0.572872
G1 X110.033 Y122.006 E.00584
; LINE_WIDTH: 0.525732
G1 X110.585 Y122.001 E.01348
; LINE_WIDTH: 0.558372
G1 X110.964 Y122.022 E.0099
; WIPE_START
G1 X110.585 Y122.001 E-.18216
G1 X110.033 Y122.006 E-.26416
G1 X109.817 Y122.029 E-.10456
G1 X109.6 Y122.053 E-.10456
G1 X109.383 Y122.076 E-.10456
; WIPE_END
G1 E-.04 F1800
G1 X108.778 Y123.78 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.721 Y123.881 E.0024
G1 X108.426 Y123.881 E.00612
G1 X108.426 Y121.119 E.05728
G1 X112.258 Y121.119 E.07949
G1 X112.491 Y121.157 E.00491
G1 X112.639 Y121.277 E.00395
G1 X112.731 Y121.518 E.00534
G1 X112.731 Y123.149 E.03383
; LINE_WIDTH: 0.458472
G1 X112.727 Y123.814 E.01407
; LINE_WIDTH: 0.489557
G1 X112.711 Y124.112 E.00676
; LINE_WIDTH: 0.520642
G1 X112.695 Y124.409 E.00721
G1 X112.696 Y126.409 E.04839
; LINE_WIDTH: 0.519982
G1 X112.696 Y128.301 E.0457
; LINE_WIDTH: 0.554422
G1 X112.746 Y128.777 E.01237
G1 X112.79 Y128.862 E.00248
; LINE_WIDTH: 0.520012
G1 X112.835 Y128.946 E.00232
; LINE_WIDTH: 0.485602
G1 X113.103 Y129.393 E.01172
; LINE_WIDTH: 0.449992
G1 X113.521 Y129.795 E.01203
G1 X114.02 Y130.034 E.01148
G1 X114.559 Y130.119 E.01131
G1 X115.254 Y130.089 E.01442
G1 X115.763 Y129.923 E.01111
G1 X116.207 Y129.608 E.0113
G1 X116.56 Y129.136 E.01221
; LINE_WIDTH: 0.494217
G1 X116.669 Y128.899 E.00597
; LINE_WIDTH: 0.538442
G1 X116.778 Y128.662 E.00654
G1 X116.804 Y128.301 E.00909
; LINE_WIDTH: 0.551412
G1 X116.82 Y127.026 E.03276
G1 X116.803 Y126.777 E.00643
; LINE_WIDTH: 0.517606
G1 X116.786 Y126.527 E.00601
; LINE_WIDTH: 0.483799
G1 X116.769 Y126.278 E.0056
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.06362
G1 X116.866 Y123.389 E.0042
G1 X117.28 Y123.94 E.0143
G1 X117.798 Y124.407 E.01448
G1 X118.384 Y124.758 E.01416
G1 X118.945 Y124.975 E.01248
G2 X119.95 Y125.119 I1.027 J-3.584 E.02111
G1 X141.95 Y125.114 E.45633
G1 X142.482 Y124.983 E.01138
G2 X143.137 Y124.47 I-.927 J-1.858 E.01737
G1 X143.373 Y124.044 E.01008
G1 X143.467 Y123.531 E.01082
G1 X143.471 Y121.587 E.04033
G1 X143.522 Y121.322 E.00559
G1 X143.629 Y121.207 E.00327
G1 X143.887 Y121.12 E.00564
G1 X147.574 Y121.119 E.07649
M73 P72 R3
G1 X147.574 Y122.076 E.01984
G1 X147.574 Y123.881 E.03744
G1 X147.28 Y123.881 E.00611
G1 X147.237 Y123.792 E.00205
G1 X146.932 Y123.359 E.01098
G2 X146.42 Y123.013 I-1.14 J1.14 E.01291
G1 X145.879 Y122.883 E.01153
G1 X145.419 Y122.943 E.00963
G1 X144.917 Y123.182 E.01153
G1 X144.561 Y123.525 E.01026
G1 X144.342 Y123.931 E.00956
G1 X144.255 Y124.255 E.00697
G2 X144.201 Y125.584 I36.017 J2.109 E.02757
G1 X144.08 Y125.787 E.00491
G1 X143.848 Y125.879 E.00519
G1 X119.848 Y125.885 E.49781
G2 X118.691 Y125.909 I-.227 J16.848 E.024
G1 X118.201 Y126.064 E.01066
G1 X117.823 Y126.347 E.0098
G1 X117.67 Y126.521 E.00481
; LINE_WIDTH: 0.483799
G1 X117.561 Y126.704 E.00477
; LINE_WIDTH: 0.517606
G1 X117.451 Y126.886 E.00512
; LINE_WIDTH: 0.551412
G1 X117.342 Y127.069 E.00547
G1 X117.296 Y127.499 E.01113
; LINE_WIDTH: 0.538442
G1 X117.287 Y128.707 E.03026
G1 X117.309 Y128.994 E.00722
; LINE_WIDTH: 0.494217
G1 X117.331 Y129.281 E.00659
; LINE_WIDTH: 0.449992
G3 X117.297 Y130.609 I-11.549 J.367 E.02757
G1 X117.201 Y130.765 E.00381
G1 X116.959 Y130.876 E.00551
G1 X112.959 Y130.88 E.08297
G3 X112.416 Y130.847 I-.047 J-3.681 E.0113
G1 X112.235 Y130.699 E.00486
G1 X112.169 Y130.464 E.00506
G1 X112.169 Y129.434 E.02135
; LINE_WIDTH: 0.484802
G1 X112.186 Y129.229 E.00462
; LINE_WIDTH: 0.519612
G1 X112.203 Y129.024 E.00498
; LINE_WIDTH: 0.554422
G2 X112.202 Y128.301 I-3.037 J-.359 E.01872
; LINE_WIDTH: 0.520012
G1 X112.201 Y126.301 E.04833
; LINE_WIDTH: 0.520642
G1 X112.201 Y124.409 E.04576
; LINE_WIDTH: 0.536622
G2 X112.12 Y124.071 I-.611 J-.032 E.0088
; LINE_WIDTH: 0.497547
G1 X112.054 Y123.904 E.00415
; LINE_WIDTH: 0.458472
G1 X111.775 Y123.449 E.0113
; LINE_WIDTH: 0.449992
G1 X111.305 Y123.075 E.01245
G1 X111.101 Y122.984 E.00463
G1 X110.6 Y122.883 E.01061
G1 X109.865 Y122.924 E.01527
G1 X109.337 Y123.142 E.01184
G1 X108.919 Y123.53 E.01183
G1 X108.807 Y123.728 E.0047
M204 S250
G1 X109.13 Y123.979 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.117 Y123.999 E.00048
G1 X109.032 Y124.29 E.00584
G1 X108.016 Y124.29 E.01957
G1 X108.016 Y120.71 E.06901
G1 X112.016 Y120.71 E.0771
G3 X112.646 Y120.771 I.121 J2.039 E.01225
G1 X112.881 Y120.919 E.00535
G1 X113.05 Y121.141 E.00536
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.202 Y128.704 E.00787
G1 X113.367 Y129.064 E.00763
G1 X113.67 Y129.399 E.00872
G1 X114.033 Y129.61 E.00807
G1 X114.55 Y129.71 E.01015
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00784
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00875
G1 X116.321 Y128.621 E.0088
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.678 E.10837
; LINE_WIDTH: 0.430582
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437812
G1 X116.786 Y122.087 E.00752
G1 X116.948 Y122.634 E.01149
; LINE_WIDTH: 0.419992
G1 X117.196 Y123.148 E.01101
G1 X117.559 Y123.64 E.01178
G1 X118.016 Y124.061 E.01199
G1 X118.538 Y124.378 E.01176
G2 X119.95 Y124.71 I1.523 J-3.315 E.02814
G1 X141.951 Y124.705 E.42409
G1 X142.366 Y124.59 E.0083
G1 X142.737 Y124.316 E.00889
G1 X142.967 Y123.953 E.00829
G1 X143.058 Y123.53 E.00833
G1 X143.062 Y121.559 E.038
G1 X143.149 Y121.138 E.00829
G1 X143.299 Y120.936 E.00484
G1 X143.529 Y120.781 E.00535
G1 X143.841 Y120.71 E.00616
G1 X147.984 Y120.71 E.07985
G1 X147.984 Y122.076 E.02632
G1 X147.984 Y124.29 E.04268
G1 X146.968 Y124.29 E.01957
G1 X146.935 Y124.109 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00887
G1 X145.933 Y123.3 E.00892
G1 X145.495 Y123.345 E.00849
G1 X145.115 Y123.541 E.00825
G1 X144.862 Y123.801 E.00699
G1 X144.714 Y124.102 E.00646
G1 X144.639 Y124.469 E.00723
G1 X144.635 Y125.441 E.01873
G1 X144.548 Y125.858 E.00821
G1 X144.35 Y126.105 E.00611
G1 X144.096 Y126.248 E.00562
G1 X143.887 Y126.288 E.00409
G1 X118.86 Y126.294 E.48241
G1 X118.433 Y126.41 E.00853
G1 X118.073 Y126.67 E.00856
G1 X117.82 Y127.076 E.00923
G1 X117.74 Y127.499 E.0083
G1 X117.74 Y130.391 E.05574
G1 X117.674 Y130.809 E.00816
G1 X117.548 Y131.012 E.0046
G1 X117.322 Y131.193 E.00559
G1 X117.021 Y131.285 E.00606
G1 X115.021 Y131.287 E.03855
G3 X112.426 Y131.265 I-.937 J-41.47 E.05002
G1 X112.162 Y131.173 E.0054
G3 X111.76 Y130.488 I.503 J-.755 E.01584
G1 X111.756 Y124.41 E.11716
G1 X111.655 Y124.013 E.00789
G1 X111.439 Y123.682 E.00762
G1 X111.071 Y123.411 E.0088
G1 X110.61 Y123.292 E.00918
G1 X110.055 Y123.301 E.01069
G1 X109.656 Y123.426 E.00807
G1 X109.317 Y123.685 E.00823
G1 X109.162 Y123.928 E.00554
; WIPE_START
M204 S10000
M73 P73 R3
G1 X109.117 Y123.999 E-.03221
G1 X109.032 Y124.29 E-.11508
G1 X108.016 Y124.29 E-.38584
G1 X108.016 Y123.693 E-.22687
; WIPE_END
G1 E-.04
G1 X115.649 Y123.713 Z2.16 F30000
G1 X143.899 Y123.788 Z2.16
G1 Z1.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.526552
G1 F3600
G1 X143.805 Y124.188 E.01008
; WIPE_START
G1 X143.899 Y123.788 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.285 Y124.313 Z2.16 F30000
G1 X119.386 Y125.481 Z2.16
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.409712
G1 F3600
G1 X119.891 Y125.501 E.00949
; LINE_WIDTH: 0.368552
G1 X119.95 Y125.502 E.00099
; LINE_WIDTH: 0.366852
G1 X125.951 Y125.5 E.10009
; LINE_WIDTH: 0.366962
G1 X133.951 Y125.499 E.13346
; LINE_WIDTH: 0.367072
G1 X141.951 Y125.497 E.1335
; LINE_WIDTH: 0.382052
G1 X142.123 Y125.489 E.003
; WIPE_START
G1 X141.951 Y125.497 E-.06549
G1 X140.124 Y125.497 E-.69451
; WIPE_END
G1 E-.04 F1800
G1 X132.631 Y126.95 Z2.16 F30000
G1 X114.373 Y130.491 Z2.16
G1 Z1.76
G1 E.8 F1800
; LINE_WIDTH: 0.376632
G1 F3600
G1 X115.109 Y130.494 E.01262
; LINE_WIDTH: 0.383612
G1 X115.267 Y130.487 E.00277
; WIPE_START
G1 X115.109 Y130.494 E-.13444
G1 X114.373 Y130.491 E-.62556
; WIPE_END
G1 E-.04 F1800
G1 X121.902 Y129.234 Z2.16 F30000
G1 X151.516 Y124.29 Z2.16
G1 Z1.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.516 Y120.71 E.06901
G1 X151.905 Y120.71 E.00749
G1 F2250
G1 X152.293 Y120.71 E.00749
G1 F2700
G1 X152.431 Y120.71 E.00266
G1 X152.431 Y121.167 E.00882
G1 X152.431 Y124.29 E.06019
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.293 Y124.29 E.00266
G1 F2250
G1 X151.905 Y124.29 E.00749
G1 F1800
G1 X151.576 Y124.29 E.00633
; WIPE_START
M204 S10000
G1 X151.543 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X151.974 Y121.167 Z2.16 F30000
G1 Z1.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.546352
G1 F3600
G1 X151.974 Y123.833 E.06784
; CHANGE_LAYER
; Z_HEIGHT: 1.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X151.974 Y121.833 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/45
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.16 I-.063 J-1.215 P1  F30000
G1 X104.428 Y124.29 Z2.16
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X103.93 Y124.29 E.00958
G1 F2250
G1 X103.538 Y124.29 E.00756
G1 X103.538 Y120.71 E.06901
G1 X103.93 Y120.71 E.00756
G1 F1800
G1 X104.428 Y120.71 E.00958
G1 X104.428 Y121.155 E.00857
G1 X104.428 Y124.23 E.05928
; WIPE_START
M204 S10000
G1 X103.93 Y124.29 E-.19031
G1 X103.538 Y124.29 E-.14903
G1 X103.538 Y123.183 E-.42066
; WIPE_END
G1 E-.04
G1 X103.983 Y121.155 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.520912
G1 F3600
G1 X103.983 Y123.845 E.06514
; WIPE_START
G1 X103.983 Y121.845 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.614 Y121.986 Z2.28 F30000
G1 X144.317 Y122.588 Z2.28
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.450232
G1 F3600
G1 X144.319 Y121.968 E.01286
G1 X144.531 Y121.968 E.0044
; LINE_WIDTH: 0.497019
G1 X144.774 Y121.992 E.00563
; LINE_WIDTH: 0.543806
G1 X145.017 Y122.015 E.00619
; LINE_WIDTH: 0.590592
G1 X145.26 Y122.038 E.00675
G1 X145.05 Y122.148 E.00654
; LINE_WIDTH: 0.543806
G1 X144.84 Y122.258 E.006
; LINE_WIDTH: 0.497019
G1 X144.63 Y122.368 E.00546
; LINE_WIDTH: 0.450232
G1 X144.367 Y122.553 E.00669
; WIPE_START
G1 X144.319 Y121.968 E-.22313
G1 X144.531 Y121.968 E-.08048
G1 X144.774 Y121.992 E-.09283
G1 X145.017 Y122.015 E-.09283
G1 X145.26 Y122.038 E-.09283
G1 X145.05 Y122.148 E-.09004
G1 X144.845 Y122.255 E-.08785
; WIPE_END
G1 E-.04 F1800
G1 X143.899 Y123.788 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.526552
G1 F3600
G1 X143.905 Y123.733 E.00133
; LINE_WIDTH: 0.516092
G1 X143.898 Y123.408 E.00781
; LINE_WIDTH: 0.483042
G1 X143.892 Y123.082 E.00729
; LINE_WIDTH: 0.449992
G1 X143.895 Y121.588 E.03099
G1 X143.934 Y121.544 E.00122
G1 X147.094 Y121.544 E.06555
G1 X147.094 Y122.069 E.01089
G1 X147.094 Y122.947 E.01821
G1 X146.888 Y122.785 E.00542
G1 X146.425 Y122.573 E.01058
G1 X145.879 Y122.459 E.01156
G1 X145.346 Y122.525 E.01116
G1 X144.83 Y122.742 E.01161
G2 X144.258 Y123.227 I.924 J1.668 E.01565
; LINE_WIDTH: 0.488272
G1 X144.079 Y123.508 E.00752
; LINE_WIDTH: 0.526552
G1 X143.932 Y123.737 E.00668
; WIPE_START
G1 X143.905 Y123.733 E-.0104
G1 X143.898 Y123.408 E-.12384
G1 X143.892 Y123.082 E-.12385
G1 X143.895 Y121.761 E-.50192
; WIPE_END
G1 E-.04 F1800
G1 X146.569 Y122.069 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.651672
G1 F3600
G1 X146.339 Y122.046 E.00707
; LINE_WIDTH: 0.606632
G1 X146.109 Y122.024 E.00656
; LINE_WIDTH: 0.561592
G1 X145.879 Y122.001 E.00605
; LINE_WIDTH: 0.553572
G1 X145.57 Y122.02 E.008
; LINE_WIDTH: 0.590592
G1 X145.26 Y122.038 E.00857
; WIPE_START
G1 X145.57 Y122.02 E-.17946
G1 X145.879 Y122.001 E-.17946
G1 X146.109 Y122.024 E-.1337
G1 X146.339 Y122.046 E-.1337
G1 X146.569 Y122.069 E-.1337
; WIPE_END
G1 E-.04 F1800
G1 X142.653 Y125.411 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.537592
G1 F3600
G2 X143.523 Y124.73 I-.9 J-2.047 E.02796
G1 X143.805 Y124.188 E.01527
G2 X143.758 Y125.411 I8.774 J.95 E.03065
G1 X142.713 Y125.411 E.02615
; WIPE_START
G1 X142.968 Y125.251 E-.11436
G1 X143.261 Y125.025 E-.14064
G1 X143.523 Y124.73 E-.15022
G1 X143.805 Y124.188 E-.23187
G1 X143.781 Y124.511 E-.12292
; WIPE_END
G1 E-.04 F1800
G1 X136.149 Y124.491 Z2.28 F30000
G1 X117.193 Y124.442 Z2.28
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01033
G1 X118.187 Y125.136 E.01489
G1 X118.858 Y125.39 E.01488
G1 X119.386 Y125.479 E.0111
G1 X118.767 Y125.473 E.01284
G1 X118.192 Y125.603 E.01223
G2 X117.488 Y126.083 I1.224 J2.546 E.01773
G1 X117.193 Y126.489 E.01041
G1 X117.193 Y124.502 E.04121
G1 X117.689 Y125.315 F30000
; LINE_WIDTH: 0.529812
G1 F3600
G2 X117.721 Y125.369 I-.028 J.052 E.00751
; WIPE_START
G1 X117.689 Y125.424 E-.152
G1 X117.626 Y125.424 E-.152
G1 X117.595 Y125.369 E-.152
G1 X117.626 Y125.315 E-.152
G1 X117.689 Y125.315 E-.152
; WIPE_END
G1 E-.04 F1800
G1 X115.747 Y130.422 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.513062
G1 F3600
G1 X116.309 Y130.117 E.01524
G1 X116.557 Y129.9 E.00784
G1 X116.872 Y129.491 E.01232
G1 X116.871 Y130.421 E.02217
G1 X115.807 Y130.422 E.02536
; WIPE_START
G1 X116.309 Y130.117 E-.22327
G1 X116.557 Y129.9 E-.12508
G1 X116.872 Y129.491 E-.19646
G1 X116.872 Y130.057 E-.21519
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.502 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.517742
G1 F3600
G1 X113.04 Y129.995 E.01546
G1 X113.309 Y130.201 E.00817
G1 X113.757 Y130.422 E.01201
G3 X112.627 Y130.419 I-.352 J-112.354 E.02718
G1 X112.627 Y129.562 E.02063
; WIPE_START
G1 X113.04 Y129.995 E-.22715
G1 X113.309 Y130.201 E-.12903
G1 X113.757 Y130.422 E-.18979
G1 X113.194 Y130.421 E-.21402
; WIPE_END
G1 E-.04 F1800
G1 X111.095 Y123.082 Z2.28 F30000
G1 X110.788 Y122.01 Z2.28
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.533332
G1 F3600
G1 X110.962 Y121.989 E.00435
; LINE_WIDTH: 0.492086
G1 X111.136 Y121.968 E.004
; LINE_WIDTH: 0.450839
G1 X111.31 Y121.948 E.00364
; LINE_WIDTH: 0.409592
G1 X111.902 Y121.948 E.01112
G1 X111.902 Y122.483 E.01004
G2 X111.268 Y122.171 I-1.164 J1.568 E.01335
; LINE_WIDTH: 0.450839
G1 X111.108 Y122.117 E.00351
; LINE_WIDTH: 0.492086
G1 X110.948 Y122.063 E.00385
; LINE_WIDTH: 0.533332
G1 X110.845 Y122.029 E.0027
; WIPE_START
G1 X110.962 Y121.989 E-.04702
G1 X111.136 Y121.968 E-.0666
G1 X111.31 Y121.948 E-.0666
G1 X111.902 Y121.948 E-.22511
G1 X111.902 Y122.483 E-.20329
G1 X111.637 Y122.317 E-.11877
G1 X111.558 Y122.286 E-.03262
; WIPE_END
G1 E-.04 F1800
G1 X108.906 Y122.939 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.906 Y121.544 E.02894
G1 X109.711 Y121.544 E.01669
G3 X112.307 Y121.56 I.997 J48.308 E.05385
G1 X112.307 Y123.48 E.03984
G1 X112.021 Y123.091 E.01002
G2 X110.773 Y122.475 I-1.496 J1.459 E.02941
G1 X110.178 Y122.457 E.01235
G1 X109.572 Y122.568 E.01277
G2 X108.952 Y122.901 I.588 J1.842 E.01469
; WIPE_START
G1 X108.906 Y121.544 E-.51603
G1 X109.548 Y121.544 E-.24398
; WIPE_END
G1 E-.04 F1800
G1 X110.788 Y122.01 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.533332
G1 F3600
G1 X110.178 Y122 E.01514
; LINE_WIDTH: 0.558452
G1 X109.928 Y122.022 E.00654
; LINE_WIDTH: 0.602032
G1 X109.678 Y122.044 E.00707
; LINE_WIDTH: 0.645612
G1 X109.428 Y122.066 E.00761
; WIPE_START
G1 X109.678 Y122.044 E-.13997
G1 X109.928 Y122.022 E-.13996
G1 X110.178 Y122 E-.13996
G1 X110.788 Y122.01 E-.34011
; WIPE_END
G1 E-.04 F1800
G1 X108.784 Y123.776 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.718 Y123.881 E.00258
G1 X108.482 Y123.881 E.0049
G1 X108.482 Y121.119 E.05728
G1 X112.258 Y121.119 E.07834
G1 X112.491 Y121.157 E.00489
G1 X112.639 Y121.277 E.00395
G1 X112.731 Y121.518 E.00535
G1 X112.731 Y123.325 E.03748
; LINE_WIDTH: 0.461242
G1 X112.725 Y123.953 E.01337
; LINE_WIDTH: 0.490052
G1 X112.711 Y124.211 E.00588
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00625
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.554192
G1 X112.746 Y128.778 E.01241
G1 X112.791 Y128.863 E.00248
; LINE_WIDTH: 0.519682
G1 X112.836 Y128.948 E.00232
; LINE_WIDTH: 0.485172
G1 X113.103 Y129.394 E.01167
; LINE_WIDTH: 0.449992
G1 X113.527 Y129.798 E.01214
G1 X114.037 Y130.04 E.01172
G1 X114.522 Y130.119 E.01019
G1 X115.253 Y130.089 E.01518
G1 X115.762 Y129.923 E.01111
G1 X116.207 Y129.608 E.0113
G1 X116.559 Y129.136 E.01221
; LINE_WIDTH: 0.493892
G1 X116.668 Y128.9 E.00596
; LINE_WIDTH: 0.537792
G1 X116.777 Y128.663 E.00652
G1 X116.803 Y128.301 E.0091
; LINE_WIDTH: 0.522982
G2 X116.787 Y127.02 I-10.349 J-.513 E.03115
; LINE_WIDTH: 0.486487
G1 X116.769 Y126.713 E.00693
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.212 E.07262
G1 X116.868 Y123.393 E.00428
G1 X117.318 Y123.981 E.01535
G1 X117.798 Y124.408 E.01332
G1 X118.347 Y124.742 E.01333
G1 X118.945 Y124.975 E.01332
G2 X119.95 Y125.119 I1.027 J-3.582 E.02111
G1 X141.938 Y125.115 E.45609
G1 X142.479 Y124.984 E.01154
G2 X143.123 Y124.488 I-.871 J-1.796 E.01697
G1 X143.373 Y124.044 E.01057
G1 X143.467 Y123.531 E.01082
G1 X143.471 Y121.587 E.04033
G1 X143.522 Y121.323 E.00558
G1 X143.63 Y121.207 E.00328
G1 X143.887 Y121.12 E.00563
G1 X147.518 Y121.119 E.07533
G1 X147.518 Y122.069 E.01969
G1 X147.518 Y123.881 E.03759
G1 X147.28 Y123.881 E.00495
G1 X147.247 Y123.809 E.00163
G1 X146.932 Y123.359 E.01139
G2 X146.42 Y123.013 I-1.141 J1.14 E.01291
G1 X145.879 Y122.883 E.01153
G1 X145.419 Y122.943 E.00963
G1 X144.949 Y123.16 E.01074
G1 X144.567 Y123.518 E.01087
G1 X144.342 Y123.931 E.00974
G1 X144.255 Y124.255 E.00696
G2 X144.208 Y125.56 I28.477 J1.668 E.02708
G1 X144.089 Y125.78 E.00518
G1 X143.848 Y125.879 E.00541
G1 X119.848 Y125.881 E.49781
G2 X118.893 Y125.883 I-.149 J117.309 E.01981
G1 X118.359 Y125.993 E.01132
G1 X117.98 Y126.211 E.00905
G1 X117.592 Y126.629 E.01184
; LINE_WIDTH: 0.481512
G1 X117.352 Y127.19 E.01359
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.499 E.00756
; LINE_WIDTH: 0.537792
G1 X117.285 Y128.708 E.03028
G1 X117.307 Y128.994 E.00719
; LINE_WIDTH: 0.493892
G1 X117.329 Y129.281 E.00658
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.501 E.02531
G1 X117.209 Y130.767 E.00604
G1 X116.956 Y130.877 E.00573
G1 X112.956 Y130.88 E.08297
G3 X112.37 Y130.819 I-.156 J-1.336 E.01232
G1 X112.215 Y130.66 E.00461
G1 X112.169 Y130.477 E.0039
G1 X112.169 Y129.435 E.02163
; LINE_WIDTH: 0.484726
G1 X112.187 Y129.23 E.00462
; LINE_WIDTH: 0.519459
G1 X112.204 Y129.025 E.00497
; LINE_WIDTH: 0.554192
G2 X112.203 Y128.301 I-3.037 J-.36 E.01876
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09235
; LINE_WIDTH: 0.527682
G1 X112.195 Y124.342 E.00313
G1 X112.108 Y124.088 E.00661
; LINE_WIDTH: 0.488837
G1 X112.02 Y123.833 E.0061
; LINE_WIDTH: 0.449992
G1 X111.739 Y123.408 E.01056
M73 P74 R3
G1 X111.313 Y123.079 E.01115
G1 X110.76 Y122.899 E.01207
G1 X110.178 Y122.881 E.01208
G1 X109.666 Y122.982 E.01082
G1 X109.461 Y123.07 E.00463
G1 X109.01 Y123.42 E.01184
G1 X108.816 Y123.725 E.00749
M204 S250
G1 X109.122 Y123.985 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.028 Y124.29 E.00615
G1 X108.072 Y124.29 E.01841
G1 X108.072 Y120.71 E.06901
G1 X112.072 Y120.71 E.0771
G3 X112.647 Y120.771 I.093 J1.856 E.01118
G1 X112.881 Y120.919 E.00535
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.202 Y128.706 E.0079
G1 X113.367 Y129.064 E.0076
G1 X113.671 Y129.4 E.00872
G1 X114.055 Y129.618 E.00851
G1 X114.514 Y129.709 E.00903
G1 X115.096 Y129.701 E.01122
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00875
G1 X116.321 Y128.621 E.00881
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.716 E.10765
; LINE_WIDTH: 0.430562
G1 X116.365 Y121.715 E.0198
G1 X116.753 Y121.715 E.00766
; LINE_WIDTH: 0.437692
G1 X116.786 Y122.088 E.00755
G1 X116.961 Y122.668 E.01218
; LINE_WIDTH: 0.419992
G1 X117.197 Y123.149 E.01035
G1 X117.594 Y123.679 E.01276
G1 X118.017 Y124.061 E.01098
G1 X118.5 Y124.363 E.01099
G1 X119.03 Y124.574 E.01098
G2 X119.95 Y124.71 I.929 J-3.115 E.01799
G1 X141.938 Y124.706 E.42384
G1 X142.365 Y124.591 E.00853
G1 X142.724 Y124.331 E.00854
G1 X142.967 Y123.954 E.00863
G1 X143.058 Y123.53 E.00836
G1 X143.062 Y121.559 E.038
G1 X143.149 Y121.138 E.00829
G1 X143.299 Y120.936 E.00485
G1 X143.53 Y120.781 E.00536
G1 X143.841 Y120.71 E.00616
G1 X147.928 Y120.71 E.07877
G1 X147.928 Y122.069 E.02619
G1 X147.928 Y124.29 E.04282
G1 X146.968 Y124.29 E.01849
G1 X146.935 Y124.11 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00887
G1 X145.934 Y123.3 E.00892
G1 X145.496 Y123.345 E.00849
G1 X145.141 Y123.521 E.00763
G1 X144.865 Y123.799 E.00755
G1 X144.714 Y124.102 E.00651
G1 X144.639 Y124.469 E.00723
G1 X144.635 Y125.44 E.01872
G1 X144.548 Y125.859 E.00825
G1 X144.362 Y126.095 E.0058
G1 X144.094 Y126.248 E.00593
G1 X143.887 Y126.288 E.00406
G1 X118.949 Y126.29 E.48069
G1 X118.562 Y126.357 E.00757
G1 X118.189 Y126.563 E.00823
G1 X117.91 Y126.887 E.00824
G1 X117.757 Y127.32 E.00885
G1 X117.74 Y127.499 E.00347
G1 X117.736 Y130.44 E.05668
G1 X117.649 Y130.862 E.00831
G3 X117.011 Y131.286 I-.752 J-.44 E.01528
G1 X113.011 Y131.29 E.0771
G3 X112.275 Y131.237 I-.184 J-2.614 E.01426
G1 X112.046 Y131.103 E.00513
G1 X111.848 Y130.856 E.0061
G1 X111.76 Y130.493 E.00721
G1 X111.76 Y124.47 E.11609
G1 X111.688 Y124.097 E.00731
G1 X111.507 Y123.763 E.00733
G1 X111.222 Y123.496 E.00753
G1 X110.747 Y123.308 E.00984
G1 X110.184 Y123.291 E.01085
G1 X109.756 Y123.381 E.00843
G1 X109.392 Y123.61 E.00829
G1 X109.147 Y123.932 E.0078
; WIPE_START
M204 S10000
G1 X109.028 Y124.29 E-.14357
G1 X108.072 Y124.29 E-.36303
G1 X108.072 Y123.623 E-.25341
; WIPE_END
G1 E-.04
G1 X115.705 Y123.658 Z2.28 F30000
G1 X143.899 Y123.788 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.526552
G1 F3600
G1 X143.805 Y124.188 E.01007
; WIPE_START
G1 X143.899 Y123.788 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.285 Y124.313 Z2.28 F30000
G1 X119.386 Y125.479 Z2.28
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.405792
G1 F3600
G1 X119.891 Y125.499 E.00939
; LINE_WIDTH: 0.364712
G1 X119.95 Y125.5 E.00098
; LINE_WIDTH: 0.363172
G1 X121.938 Y125.5 E.03281
; LINE_WIDTH: 0.363402
G1 X123.938 Y125.499 E.03302
; LINE_WIDTH: 0.363632
G1 X125.938 Y125.499 E.03304
; LINE_WIDTH: 0.363852
G1 X127.938 Y125.499 E.03306
; LINE_WIDTH: 0.364082
G1 X129.938 Y125.499 E.03308
; LINE_WIDTH: 0.364312
G1 X131.938 Y125.498 E.03311
; LINE_WIDTH: 0.364542
G1 X133.938 Y125.498 E.03313
; LINE_WIDTH: 0.364762
G1 X135.938 Y125.498 E.03315
; LINE_WIDTH: 0.364992
G1 X137.938 Y125.498 E.03317
; LINE_WIDTH: 0.365222
G1 X139.938 Y125.497 E.0332
; LINE_WIDTH: 0.365452
G1 X141.938 Y125.497 E.03322
; LINE_WIDTH: 0.380432
G1 X142.11 Y125.49 E.00298
; WIPE_START
G1 X141.938 Y125.497 E-.0654
G1 X140.11 Y125.497 E-.69461
; WIPE_END
G1 E-.04 F1800
G1 X132.617 Y126.949 Z2.28 F30000
G1 X114.332 Y130.491 Z2.28
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.378832
G1 F3600
G1 X115.107 Y130.495 E.01338
; LINE_WIDTH: 0.384372
G1 X115.267 Y130.487 E.0028
; WIPE_START
G1 X115.107 Y130.495 E-.12987
G1 X114.332 Y130.491 E-.63013
; WIPE_END
G1 E-.04 F1800
G1 X121.861 Y129.237 Z2.28 F30000
G1 X151.572 Y124.29 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.572 Y120.71 E.06901
G1 X152.069 Y120.71 E.00958
G1 F2250
G1 X152.462 Y120.71 E.00756
G1 X152.462 Y121.155 E.00857
G1 X152.462 Y124.29 E.06043
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.07 Y124.29 E.00756
G1 F1800
G1 X151.632 Y124.29 E.00843
; WIPE_START
M204 S10000
G1 X151.599 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X152.017 Y121.155 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.520912
G1 F3600
G1 X152.017 Y123.845 E.06514
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X152.017 Y121.845 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/45
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.28 I-.062 J-1.215 P1  F30000
G1 X104.382 Y124.29 Z2.28
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X103.691 Y124.29 E.01333
G1 F2250
G1 X103.513 Y124.29 E.00343
G1 X103.513 Y120.71 E.06901
G1 X103.691 Y120.71 E.00343
G1 F1800
G1 X104.382 Y120.71 E.01333
G1 X104.382 Y121.145 E.00838
G1 X104.382 Y124.23 E.05947
; WIPE_START
M204 S10000
G1 X103.691 Y124.29 E-.26369
G1 X103.513 Y124.29 E-.06754
G1 X103.513 Y123.162 E-.42877
; WIPE_END
G1 E-.04
G1 X103.948 Y121.145 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.500572
G1 F3600
G1 X103.948 Y123.855 E.06294
; WIPE_START
G1 X103.948 Y121.855 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.579 Y121.994 Z2.4 F30000
G1 X144.318 Y122.589 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.450762
G1 F3600
G1 X144.319 Y121.968 E.01289
G1 X144.759 Y121.968 E.00915
; LINE_WIDTH: 0.497366
G1 X144.926 Y121.992 E.00389
; LINE_WIDTH: 0.543969
G1 X145.093 Y122.015 E.00427
; LINE_WIDTH: 0.590572
G1 X145.26 Y122.038 E.00465
G1 X145.051 Y122.148 E.00653
; LINE_WIDTH: 0.543969
G1 X144.841 Y122.258 E.00599
; LINE_WIDTH: 0.497366
G1 X144.632 Y122.368 E.00545
; LINE_WIDTH: 0.450762
G1 X144.367 Y122.554 E.00673
; WIPE_START
G1 X144.319 Y121.968 E-.22336
G1 X144.759 Y121.968 E-.16734
G1 X144.926 Y121.992 E-.06403
G1 X145.093 Y122.015 E-.06403
G1 X145.26 Y122.038 E-.06403
G1 X145.051 Y122.148 E-.08985
G1 X144.847 Y122.255 E-.08737
; WIPE_END
G1 E-.04 F1800
G1 X143.898 Y123.793 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.525232
G1 F3600
G1 X143.903 Y123.733 E.00147
; LINE_WIDTH: 0.513842
G1 X143.898 Y123.42 E.00749
; LINE_WIDTH: 0.481917
G1 X143.892 Y123.106 E.007
; LINE_WIDTH: 0.449992
G3 X143.9 Y121.544 I112.038 J-.231 E.0324
G1 X147.049 Y121.544 E.06532
G1 X147.049 Y122.063 E.01078
G1 X147.049 Y122.911 E.01759
G1 X146.888 Y122.785 E.00423
G1 X146.386 Y122.562 E.0114
G1 X145.879 Y122.459 E.01074
G1 X145.346 Y122.525 E.01115
G1 X144.834 Y122.742 E.01153
G1 X144.468 Y123.003 E.00932
G1 X144.245 Y123.244 E.00682
; LINE_WIDTH: 0.487612
G1 X144.071 Y123.519 E.00734
; LINE_WIDTH: 0.525232
G1 X143.93 Y123.743 E.00647
; WIPE_START
G1 X143.903 Y123.733 E-.01056
G1 X143.898 Y123.42 E-.11921
G1 X143.892 Y123.106 E-.11921
G1 X143.899 Y121.761 E-.51102
; WIPE_END
G1 E-.04 F1800
G1 X146.529 Y122.063 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.640432
G1 F3600
G1 X146.312 Y122.042 E.00654
; LINE_WIDTH: 0.599119
G1 X146.096 Y122.022 E.0061
; LINE_WIDTH: 0.557806
G1 X145.879 Y122.001 E.00566
; LINE_WIDTH: 0.553532
G1 X145.569 Y122.02 E.008
; LINE_WIDTH: 0.590572
G1 X145.26 Y122.038 E.00856
; WIPE_START
G1 X145.569 Y122.02 E-.18505
G1 X145.879 Y122.001 E-.18505
G1 X146.096 Y122.022 E-.12996
G1 X146.312 Y122.042 E-.12997
G1 X146.529 Y122.063 E-.12997
; WIPE_END
G1 E-.04 F1800
G1 X142.656 Y125.411 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.538392
G1 F3600
G2 X143.541 Y124.708 I-.944 J-2.097 E.02861
G1 X143.805 Y124.188 E.01462
G2 X143.757 Y125.411 I8.294 J.934 E.0307
G1 X142.716 Y125.411 E.0261
; WIPE_START
G1 X142.976 Y125.246 E-.11686
G1 X143.28 Y125.006 E-.14722
G1 X143.541 Y124.708 E-.15047
G1 X143.805 Y124.188 E-.22164
G1 X143.78 Y124.513 E-.1238
; WIPE_END
G1 E-.04 F1800
G1 X136.147 Y124.493 Z2.4 F30000
G1 X117.193 Y124.444 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.488 Y124.703 E.00814
G1 X118.187 Y125.136 E.01705
G1 X118.857 Y125.39 E.01487
G1 X119.386 Y125.479 E.01111
G1 X118.782 Y125.47 E.01252
G1 X118.197 Y125.603 E.01244
G1 X117.987 Y125.716 E.00496
G1 X117.531 Y126.041 E.01161
G1 X117.193 Y126.482 E.01151
G1 X117.193 Y124.504 E.04102
G1 X117.689 Y125.313 F30000
; LINE_WIDTH: 0.529892
G1 F3600
G2 X117.721 Y125.367 I-.028 J.052 E.00752
; WIPE_START
G1 X117.689 Y125.422 E-.15201
M73 P75 R3
G1 X117.626 Y125.422 E-.152
G1 X117.595 Y125.367 E-.152
G1 X117.626 Y125.313 E-.15201
G1 X117.689 Y125.313 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.744 Y130.424 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.513992
G1 F3600
G1 X116.309 Y130.117 E.01536
G1 X116.557 Y129.9 E.00787
G1 X116.872 Y129.493 E.0123
G1 X116.871 Y130.424 E.02223
G1 X115.804 Y130.424 E.02548
; WIPE_START
G1 X116.309 Y130.117 E-.22474
G1 X116.557 Y129.9 E-.12521
G1 X116.872 Y129.493 E-.19576
G1 X116.871 Y130.057 E-.21429
; WIPE_END
G1 E-.04 F1800
G1 X112.629 Y129.495 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.520362
G1 F3600
G1 X112.675 Y129.578 E.00231
G1 X113.043 Y129.992 E.01338
G1 X113.428 Y130.275 E.01157
G1 X113.79 Y130.43 E.00952
; LINE_WIDTH: 0.496182
G1 X113.942 Y130.452 E.00355
; LINE_WIDTH: 0.455537
G1 X114.095 Y130.474 E.00324
; LINE_WIDTH: 0.450049
G1 X113.862 Y130.456 E.00484
; LINE_WIDTH: 0.485206
G1 X113.629 Y130.439 E.00525
; LINE_WIDTH: 0.520362
G2 X112.629 Y130.418 I-.643 J6.981 E.02422
G1 X112.629 Y129.555 E.02088
; WIPE_START
G1 X112.675 Y129.578 E-.01964
G1 X113.043 Y129.992 E-.21029
G1 X113.428 Y130.275 E-.18176
G1 X113.79 Y130.43 E-.14955
G1 X113.942 Y130.452 E-.05858
G1 X114.095 Y130.474 E-.05858
G1 X113.881 Y130.458 E-.0816
; WIPE_END
G1 E-.04 F1800
G1 X111.256 Y123.291 Z2.4 F30000
G1 X110.786 Y122.009 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.533072
G1 F3600
G1 X110.942 Y121.988 E.00391
; LINE_WIDTH: 0.490762
G1 X111.099 Y121.967 E.00358
; LINE_WIDTH: 0.448452
G1 X111.255 Y121.946 E.00326
; LINE_WIDTH: 0.406142
G1 X111.904 Y121.946 E.01208
G1 X111.904 Y122.474 E.00982
G1 X111.509 Y122.258 E.00838
; LINE_WIDTH: 0.448452
G1 X111.268 Y122.175 E.00526
; LINE_WIDTH: 0.490762
G1 X111.027 Y122.092 E.00579
; LINE_WIDTH: 0.533072
G1 X110.843 Y122.029 E.00483
; WIPE_START
G1 X110.942 Y121.988 E-.04079
G1 X111.099 Y121.967 E-.05986
G1 X111.255 Y121.946 E-.05986
G1 X111.904 Y121.946 E-.24683
G1 X111.904 Y122.474 E-.20056
G1 X111.553 Y122.282 E-.15209
; WIPE_END
G1 E-.04 F1800
G1 X108.951 Y122.902 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.951 Y121.544 E.02818
G1 X109.714 Y121.544 E.01582
G3 X112.307 Y121.56 I.997 J48.023 E.05378
G1 X112.307 Y123.489 E.04002
G2 X111.374 Y122.637 I-1.744 J.972 E.02666
G1 X110.772 Y122.475 E.01294
G1 X110.178 Y122.457 E.01232
G1 X109.583 Y122.565 E.01255
G2 X108.999 Y122.865 I.558 J1.808 E.01369
; WIPE_START
G1 X108.951 Y121.544 E-.50247
G1 X109.629 Y121.544 E-.25753
; WIPE_END
G1 E-.04 F1800
G1 X110.786 Y122.009 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.533072
G1 F3600
G1 X110.178 Y122 E.01509
; LINE_WIDTH: 0.555292
G1 X109.942 Y122.02 E.00614
; LINE_WIDTH: 0.595732
G1 X109.705 Y122.041 E.00661
; LINE_WIDTH: 0.636172
G1 X109.469 Y122.061 E.00708
; WIPE_START
G1 X109.705 Y122.041 E-.1366
G1 X109.942 Y122.02 E-.13659
G1 X110.178 Y122 E-.13659
G1 X110.786 Y122.009 E-.35022
; WIPE_END
G1 E-.04 F1800
G1 X108.77 Y123.798 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.717 Y123.881 E.00204
G1 X108.527 Y123.881 E.00394
G1 X108.527 Y121.119 E.05728
G1 X112.26 Y121.12 E.07742
G1 X112.491 Y121.157 E.00486
G1 X112.639 Y121.277 E.00396
G1 X112.731 Y121.518 E.00534
G1 X112.731 Y123.238 E.03567
; LINE_WIDTH: 0.461512
G1 X112.725 Y123.955 E.01527
; LINE_WIDTH: 0.490187
G1 X112.711 Y124.212 E.00586
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00622
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.557572
G1 X112.751 Y128.802 E.01312
G1 X112.859 Y128.987 E.00558
; LINE_WIDTH: 0.521712
G1 X112.968 Y129.172 E.0052
; LINE_WIDTH: 0.485852
G1 X113.077 Y129.357 E.00482
; LINE_WIDTH: 0.449992
G1 X113.463 Y129.753 E.01148
G1 X113.977 Y130.021 E.01203
G1 X114.559 Y130.119 E.01223
G1 X115.254 Y130.089 E.01442
G1 X115.763 Y129.923 E.01111
G1 X116.207 Y129.608 E.0113
G1 X116.56 Y129.136 E.01221
; LINE_WIDTH: 0.493897
G1 X116.668 Y128.9 E.00596
; LINE_WIDTH: 0.537802
G1 X116.777 Y128.663 E.00652
G1 X116.803 Y128.301 E.0091
; LINE_WIDTH: 0.535982
G1 X116.812 Y127.155 E.02858
G1 X116.791 Y126.883 E.0068
; LINE_WIDTH: 0.492987
G1 X116.769 Y126.611 E.00623
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.07053
G1 X116.865 Y123.388 E.00418
G1 X117.268 Y123.927 E.01396
G1 X117.72 Y124.347 E.0128
G1 X118.347 Y124.742 E.01536
G1 X118.945 Y124.975 E.01331
G2 X119.95 Y125.119 I1.028 J-3.582 E.02112
G1 X141.949 Y125.114 E.45631
G1 X142.482 Y124.983 E.01139
G2 X143.137 Y124.47 I-.923 J-1.854 E.01738
G1 X143.373 Y124.044 E.01009
G1 X143.467 Y123.531 E.01081
G1 X143.471 Y121.561 E.04087
G1 X143.522 Y121.323 E.00506
G1 X143.633 Y121.202 E.00339
G1 X143.846 Y121.12 E.00475
G1 X147.473 Y121.119 E.07523
G1 X147.473 Y122.063 E.01958
G1 X147.473 Y123.881 E.0377
G1 X147.28 Y123.881 E.00401
G1 X147.08 Y123.527 E.00841
G2 X146.419 Y123.013 I-1.57 J1.336 E.01749
G1 X145.879 Y122.883 E.01153
G1 X145.419 Y122.943 E.00963
G1 X144.937 Y123.168 E.01102
G1 X144.557 Y123.532 E.01093
G1 X144.343 Y123.929 E.00935
G1 X144.255 Y124.255 E.00701
G2 X144.201 Y125.584 I36.123 J2.116 E.02758
G1 X144.079 Y125.788 E.00494
G1 X143.848 Y125.879 E.00515
G1 X118.949 Y125.881 E.51645
G1 X118.527 Y125.942 E.00885
G1 X118.019 Y126.183 E.01167
G1 X117.618 Y126.589 E.01183
; LINE_WIDTH: 0.492987
G1 X117.47 Y126.887 E.00761
; LINE_WIDTH: 0.535982
G1 X117.321 Y127.185 E.00831
G1 X117.296 Y127.499 E.00784
; LINE_WIDTH: 0.537802
G1 X117.285 Y128.708 E.03028
G1 X117.307 Y128.994 E.00719
; LINE_WIDTH: 0.493897
G1 X117.329 Y129.281 E.00657
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.439 E.02402
G3 X117.189 Y130.778 I-.45 J.014 E.00781
G1 X116.957 Y130.88 E.00526
G1 X113.025 Y130.881 E.08155
G1 X112.416 Y130.847 E.01265
G1 X112.235 Y130.699 E.00485
G1 X112.169 Y130.464 E.00507
G1 X112.169 Y129.59 E.01812
; LINE_WIDTH: 0.485576
G1 X112.187 Y129.34 E.00565
; LINE_WIDTH: 0.521159
G1 X112.205 Y129.089 E.00609
; LINE_WIDTH: 0.556742
G2 X112.203 Y128.301 I-3.698 J-.388 E.02051
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09235
; LINE_WIDTH: 0.527622
G1 X112.195 Y124.343 E.00312
G1 X112.103 Y124.081 E.00681
; LINE_WIDTH: 0.488807
G1 X112.012 Y123.819 E.00628
; LINE_WIDTH: 0.449992
G1 X111.67 Y123.338 E.01224
G1 X111.285 Y123.058 E.00987
G1 X110.759 Y122.899 E.01141
G1 X110.178 Y122.881 E.01205
G1 X109.676 Y122.979 E.0106
G1 X109.461 Y123.07 E.00485
G1 X109.01 Y123.42 E.01184
G1 X108.802 Y123.747 E.00804
M204 S250
G1 X109.116 Y124.005 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.028 Y124.29 E.00576
G1 X108.118 Y124.29 E.01754
G1 X108.118 Y120.71 E.06901
G1 X112.118 Y120.71 E.0771
G3 X112.646 Y120.771 I.071 J1.708 E.01029
G1 X112.881 Y120.919 E.00536
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.206 Y128.72 E.00819
G1 X113.435 Y129.159 E.00954
G1 X113.739 Y129.451 E.00813
G1 X114.148 Y129.649 E.00875
G1 X114.549 Y129.71 E.00783
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00875
G1 X116.321 Y128.621 E.0088
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430562
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00766
; LINE_WIDTH: 0.437802
G1 X116.786 Y122.087 E.00752
G1 X116.948 Y122.634 E.01149
; LINE_WIDTH: 0.419992
G1 X117.196 Y123.148 E.011
G1 X117.552 Y123.633 E.01159
G1 X117.944 Y124.005 E.01042
G1 X118.5 Y124.363 E.01276
G1 X119.029 Y124.574 E.01098
G2 X119.95 Y124.71 I.929 J-3.113 E.01799
G1 X141.949 Y124.705 E.42404
G1 X142.367 Y124.59 E.00835
G1 X142.737 Y124.316 E.00888
G1 X142.967 Y123.953 E.0083
G1 X143.058 Y123.53 E.00832
G1 X143.062 Y121.56 E.03798
G1 X143.149 Y121.138 E.00831
G3 X143.828 Y120.71 I.75 J.437 E.01607
G1 X147.882 Y120.71 E.07815
G1 X147.882 Y122.063 E.02608
G1 X147.882 Y124.29 E.04292
G1 X146.968 Y124.29 E.01761
G1 X146.935 Y124.11 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00888
G1 X145.933 Y123.3 E.00892
G1 X145.496 Y123.345 E.00848
G1 X145.132 Y123.528 E.00785
G1 X144.857 Y123.809 E.00757
G1 X144.716 Y124.097 E.00618
G1 X144.639 Y124.469 E.00732
G1 X144.635 Y125.44 E.01872
G1 X144.548 Y125.858 E.00822
G1 X144.348 Y126.107 E.00615
G1 X144.096 Y126.248 E.00558
G1 X143.888 Y126.288 E.00409
G1 X118.949 Y126.29 E.48069
G1 X118.594 Y126.346 E.00694
G1 X118.216 Y126.541 E.00819
G1 X117.929 Y126.856 E.00822
G1 X117.783 Y127.188 E.00699
G1 X117.74 Y127.499 E.00605
G1 X117.736 Y130.439 E.05668
G1 X117.648 Y130.863 E.00835
G1 X117.517 Y131.046 E.00434
G1 X117.287 Y131.211 E.00546
G1 X116.972 Y131.29 E.00626
G1 X113.025 Y131.29 E.07607
G1 X112.426 Y131.265 E.01156
G1 X112.162 Y131.173 E.0054
G3 X111.76 Y130.488 I.503 J-.755 E.01584
G1 X111.76 Y124.47 E.116
G1 X111.689 Y124.099 E.00728
G1 X111.465 Y123.713 E.0086
G1 X111.151 Y123.452 E.00787
G1 X110.746 Y123.308 E.00829
G1 X110.184 Y123.291 E.01083
G1 X109.767 Y123.378 E.00822
G1 X109.392 Y123.61 E.00848
G1 X109.135 Y123.948 E.00819
; WIPE_START
M204 S10000
G1 X109.028 Y124.29 E-.1363
G1 X108.118 Y124.29 E-.34569
G1 X108.118 Y123.558 E-.278
; WIPE_END
G1 E-.04
G1 X115.75 Y123.609 Z2.4 F30000
G1 X143.898 Y123.793 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.525232
G1 F3600
G1 X143.805 Y124.188 E.0099
; WIPE_START
G1 X143.898 Y123.793 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.283 Y124.317 Z2.4 F30000
G1 X119.386 Y125.479 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.405812
G1 F3600
G1 X119.891 Y125.499 E.0094
; LINE_WIDTH: 0.364712
G1 X119.95 Y125.5 E.00098
; LINE_WIDTH: 0.363292
G1 X121.949 Y125.5 E.03299
; LINE_WIDTH: 0.363612
G1 X123.949 Y125.499 E.03304
; LINE_WIDTH: 0.363942
G1 X125.949 Y125.499 E.03307
; LINE_WIDTH: 0.364262
G1 X127.949 Y125.499 E.0331
; LINE_WIDTH: 0.364582
G1 X129.949 Y125.498 E.03313
; LINE_WIDTH: 0.364912
G1 X131.949 Y125.498 E.03316
; LINE_WIDTH: 0.365232
G1 X133.949 Y125.498 E.0332
; LINE_WIDTH: 0.365552
G1 X135.949 Y125.498 E.03323
; LINE_WIDTH: 0.365882
G1 X137.949 Y125.497 E.03326
; LINE_WIDTH: 0.366202
G1 X139.949 Y125.497 E.03329
; LINE_WIDTH: 0.366532
G1 X141.949 Y125.497 E.03332
; LINE_WIDTH: 0.381512
G1 X142.121 Y125.489 E.00299
; WIPE_START
G1 X141.949 Y125.497 E-.06541
G1 X140.121 Y125.497 E-.69459
; WIPE_END
G1 E-.04 F1800
G1 X132.625 Y126.931 Z2.4 F30000
G1 X114.095 Y130.474 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.414892
G1 F3600
G1 X115.109 Y130.496 E.0193
; LINE_WIDTH: 0.386332
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.10202
G1 X114.095 Y130.474 E-.65798
; WIPE_END
G1 E-.04 F1800
G1 X121.626 Y129.233 Z2.4 F30000
G1 X151.618 Y124.29 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.618 Y120.71 E.06901
G1 X152.309 Y120.71 E.01333
G1 F2250
G1 X152.487 Y120.71 E.00343
G1 X152.487 Y121.145 E.00838
G1 X152.487 Y124.29 E.06063
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.309 Y124.29 E.00343
G1 F1800
G1 X151.678 Y124.29 E.01217
; WIPE_START
M204 S10000
G1 X151.644 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X152.052 Y121.145 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.500552
G1 F3600
G1 X152.052 Y123.855 E.06293
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.12
; WIPE_START
M73 P76 R3
G1 F3600
G1 X152.052 Y121.855 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/45
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.4 I-.062 J-1.215 P1  F30000
G1 X104.346 Y124.29 Z2.4
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X103.493 Y124.29 E.01646
G1 X103.493 Y120.71 E.06901
G1 X104.346 Y120.71 E.01646
G1 X104.346 Y121.137 E.00823
G1 X104.346 Y124.23 E.05962
; WIPE_START
M204 S10000
G1 X103.493 Y124.29 E-.32528
G1 X103.493 Y123.146 E-.43472
; WIPE_END
G1 E-.04
G1 X103.919 Y121.137 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.485412
G1 F3600
G1 X103.919 Y123.863 E.06127
; WIPE_START
G1 X103.919 Y121.863 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.551 Y122 Z2.52 F30000
G1 X144.318 Y122.589 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.450702
G1 F3600
G1 X144.319 Y121.968 E.01289
G1 X144.76 Y121.968 E.00917
; LINE_WIDTH: 0.497339
G1 X144.927 Y121.992 E.00388
; LINE_WIDTH: 0.543976
G1 X145.093 Y122.015 E.00426
; LINE_WIDTH: 0.590612
G1 X145.26 Y122.038 E.00464
G1 X145.051 Y122.148 E.00653
; LINE_WIDTH: 0.543976
G1 X144.841 Y122.258 E.00599
; LINE_WIDTH: 0.497339
G1 X144.632 Y122.368 E.00545
; LINE_WIDTH: 0.450702
G1 X144.367 Y122.554 E.00673
; WIPE_START
G1 X144.319 Y121.968 E-.22333
G1 X144.76 Y121.968 E-.16771
G1 X144.927 Y121.992 E-.0639
G1 X145.093 Y122.015 E-.06391
G1 X145.26 Y122.038 E-.0639
G1 X145.051 Y122.148 E-.08987
G1 X144.847 Y122.255 E-.08738
; WIPE_END
G1 E-.04 F1800
G1 X143.898 Y123.792 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.525432
G1 F3600
G1 X143.904 Y123.734 E.00144
; LINE_WIDTH: 0.514252
G1 X143.898 Y123.418 E.00753
; LINE_WIDTH: 0.482122
G1 X143.892 Y123.103 E.00703
; LINE_WIDTH: 0.449992
G3 X143.9 Y121.544 I110.58 J-.234 E.03234
G1 X147.013 Y121.544 E.06457
G1 X147.013 Y122.059 E.01068
G1 X147.013 Y122.883 E.0171
G1 X146.536 Y122.605 E.01144
G1 X145.879 Y122.459 E.01396
G1 X145.345 Y122.525 E.01115
G1 X144.833 Y122.742 E.01154
G1 X144.469 Y123.001 E.00926
G1 X144.246 Y123.242 E.00682
; LINE_WIDTH: 0.487712
G1 X144.072 Y123.517 E.00735
; LINE_WIDTH: 0.525432
G1 X143.93 Y123.742 E.00649
; WIPE_START
G1 X143.904 Y123.734 E-.01047
G1 X143.898 Y123.418 E-.1198
G1 X143.892 Y123.103 E-.1198
G1 X143.899 Y121.761 E-.50993
; WIPE_END
G1 E-.04 F1800
G1 X146.498 Y122.059 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.631652
G1 F3600
G1 X146.292 Y122.04 E.00614
; LINE_WIDTH: 0.593272
G1 X146.085 Y122.02 E.00575
; LINE_WIDTH: 0.554892
G1 X145.879 Y122.001 E.00536
; LINE_WIDTH: 0.553562
G1 X145.569 Y122.02 E.008
; LINE_WIDTH: 0.590612
G1 X145.26 Y122.038 E.00856
; WIPE_START
G1 X145.569 Y122.02 E-.18978
G1 X145.879 Y122.001 E-.18979
G1 X146.085 Y122.02 E-.12681
G1 X146.292 Y122.04 E-.12681
G1 X146.498 Y122.059 E-.12681
; WIPE_END
G1 E-.04 F1800
G1 X142.654 Y125.411 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.537502
G1 F3600
G2 X143.521 Y124.732 I-.906 J-2.05 E.02783
G1 X143.805 Y124.188 E.01535
G2 X143.758 Y125.411 I8.855 J.952 E.03064
G1 X142.714 Y125.411 E.0261
; WIPE_START
G1 X142.967 Y125.252 E-.11344
G1 X143.258 Y125.027 E-.13973
G1 X143.521 Y124.732 E-.15014
G1 X143.805 Y124.188 E-.23311
G1 X143.781 Y124.513 E-.12359
; WIPE_END
G1 E-.04 F1800
G1 X136.148 Y124.493 Z2.52 F30000
G1 X117.193 Y124.442 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.571 Y124.766 E.01032
G1 X118.187 Y125.136 E.01489
G1 X118.858 Y125.39 E.01488
G1 X119.386 Y125.479 E.01111
G1 X118.767 Y125.473 E.01285
G1 X118.192 Y125.603 E.01223
G2 X117.495 Y126.075 I1.248 J2.591 E.01751
G1 X117.193 Y126.48 E.01048
G1 X117.193 Y124.502 E.04103
G1 X117.689 Y125.315 F30000
; LINE_WIDTH: 0.529772
G1 F3600
G2 X117.721 Y125.369 I-.028 J.052 E.00751
; WIPE_START
G1 X117.689 Y125.424 E-.152
G1 X117.626 Y125.424 E-.152
G1 X117.595 Y125.369 E-.152
G1 X117.626 Y125.315 E-.152
G1 X117.689 Y125.315 E-.152
; WIPE_END
G1 E-.04 F1800
G1 X115.744 Y130.424 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.514002
G1 F3600
G1 X116.309 Y130.117 E.01536
G1 X116.547 Y129.912 E.00749
G1 X116.872 Y129.491 E.01269
G1 X116.871 Y130.424 E.02226
G1 X115.804 Y130.424 E.02548
; WIPE_START
G1 X116.309 Y130.117 E-.2248
G1 X116.547 Y129.912 E-.11928
G1 X116.872 Y129.491 E-.20205
G1 X116.871 Y130.054 E-.21386
; WIPE_END
G1 E-.04 F1800
G1 X112.629 Y129.497 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.521572
G1 F3600
G1 X112.675 Y129.579 E.00228
G1 X113.042 Y129.987 E.01331
G1 X113.473 Y130.302 E.01293
G1 X113.806 Y130.434 E.00869
; LINE_WIDTH: 0.489532
G1 X113.943 Y130.453 E.00315
; LINE_WIDTH: 0.453202
G1 X114.081 Y130.473 E.0029
; LINE_WIDTH: 0.451772
G1 X113.87 Y130.456 E.00441
; LINE_WIDTH: 0.486672
G1 X113.659 Y130.438 E.00477
; LINE_WIDTH: 0.521572
G1 X113.448 Y130.421 E.00513
G1 X112.629 Y130.418 E.01984
G1 X112.629 Y129.557 E.02086
; WIPE_START
G1 X112.675 Y129.579 E-.01918
G1 X113.042 Y129.987 E-.20858
G1 X113.473 Y130.302 E-.20266
G1 X113.806 Y130.434 E-.13619
G1 X113.943 Y130.453 E-.05275
G1 X114.081 Y130.473 E-.05275
G1 X113.87 Y130.456 E-.08045
G1 X113.85 Y130.454 E-.00745
; WIPE_END
G1 E-.04 F1800
G1 X111.236 Y123.283 Z2.52 F30000
G1 X110.771 Y122.008 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.530912
G1 F3600
G1 X110.929 Y121.988 E.00392
; LINE_WIDTH: 0.489406
G1 X111.086 Y121.967 E.0036
; LINE_WIDTH: 0.447899
G1 X111.244 Y121.946 E.00328
; LINE_WIDTH: 0.406392
G1 X111.904 Y121.946 E.01229
G1 X111.904 Y122.474 E.00982
G1 X111.518 Y122.262 E.0082
; LINE_WIDTH: 0.447899
G1 X111.269 Y122.178 E.00543
; LINE_WIDTH: 0.489406
G1 X111.02 Y122.093 E.00596
; LINE_WIDTH: 0.530912
G1 X110.828 Y122.028 E.00501
; WIPE_START
G1 X110.929 Y121.988 E-.04116
G1 X111.086 Y121.967 E-.06034
G1 X111.244 Y121.946 E-.06034
G1 X111.904 Y121.946 E-.25101
G1 X111.904 Y122.474 E-.20055
G1 X111.566 Y122.289 E-.14659
; WIPE_END
G1 E-.04 F1800
G1 X108.987 Y122.878 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.987 Y121.544 E.02768
G1 X109.714 Y121.544 E.01507
G3 X112.307 Y121.56 I.997 J48.238 E.05379
G1 X112.307 Y123.491 E.04007
G2 X111.935 Y123.006 I-1.535 J.792 E.01274
G1 X111.467 Y122.676 E.01188
G2 X110.758 Y122.473 I-.96 J2.018 E.01537
G1 X110.178 Y122.457 E.01204
G1 X109.614 Y122.558 E.01188
G1 X109.224 Y122.718 E.00874
G1 X109.037 Y122.844 E.00468
; WIPE_START
G1 X108.987 Y121.544 E-.49467
G1 X109.685 Y121.544 E-.26533
; WIPE_END
G1 E-.04 F1800
G1 X110.771 Y122.008 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.530912
G1 F3600
G1 X110.178 Y122 E.01465
; LINE_WIDTH: 0.552906
G1 X109.952 Y122.019 E.00584
; LINE_WIDTH: 0.590959
G1 X109.727 Y122.038 E.00626
; LINE_WIDTH: 0.629012
G1 X109.501 Y122.057 E.00668
; WIPE_START
G1 X109.727 Y122.038 E-.13527
G1 X109.952 Y122.019 E-.13527
G1 X110.178 Y122 E-.13526
G1 X110.771 Y122.008 E-.3542
; WIPE_END
G1 E-.04 F1800
G1 X108.755 Y123.821 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.717 Y123.881 E.00147
G1 X108.563 Y123.881 E.0032
G1 X108.563 Y121.119 E.05728
G1 X112.261 Y121.12 E.0767
G1 X112.491 Y121.157 E.00483
G1 X112.64 Y121.278 E.00398
G1 X112.731 Y121.518 E.00533
G1 X112.731 Y123.243 E.03578
; LINE_WIDTH: 0.463432
G1 X112.724 Y123.97 E.01555
; LINE_WIDTH: 0.491147
G1 X112.71 Y124.22 E.0057
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00604
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.557672
G1 X112.751 Y128.803 E.01314
G1 X112.86 Y128.988 E.00558
; LINE_WIDTH: 0.521779
G1 X112.969 Y129.172 E.0052
; LINE_WIDTH: 0.485886
G1 X113.077 Y129.357 E.00482
; LINE_WIDTH: 0.449992
G1 X113.5 Y129.779 E.01239
G1 X113.986 Y130.025 E.0113
G1 X114.522 Y130.119 E.0113
G1 X115.254 Y130.089 E.01518
G1 X115.762 Y129.923 E.01111
G1 X116.201 Y129.614 E.01112
G1 X116.538 Y129.175 E.01147
; LINE_WIDTH: 0.493907
G1 X116.657 Y128.919 E.00647
; LINE_WIDTH: 0.537822
G1 X116.777 Y128.663 E.00708
G1 X116.803 Y128.301 E.0091
; LINE_WIDTH: 0.535972
G1 X116.812 Y127.155 E.02858
G1 X116.791 Y126.89 E.00663
; LINE_WIDTH: 0.492982
G1 X116.769 Y126.625 E.00608
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.198 E.07108
G1 X116.92 Y123.476 E.00657
G1 X117.318 Y123.981 E.01334
G1 X117.798 Y124.407 E.01331
G1 X118.346 Y124.742 E.01333
G1 X118.945 Y124.975 E.01332
G2 X119.95 Y125.119 I1.027 J-3.582 E.02111
G1 X141.948 Y125.114 E.45629
G1 X142.482 Y124.983 E.01141
G2 X143.121 Y124.49 I-.876 J-1.797 E.01685
G1 X143.373 Y124.045 E.01062
G1 X143.467 Y123.531 E.01082
G1 X143.471 Y121.561 E.04086
G1 X143.522 Y121.323 E.00506
G1 X143.633 Y121.202 E.00339
G1 X143.846 Y121.12 E.00475
G1 X147.437 Y121.119 E.07449
G1 X147.437 Y122.059 E.01949
G1 X147.437 Y123.881 E.03779
G1 X147.28 Y123.881 E.00327
G1 X147.08 Y123.527 E.00842
G2 X146.419 Y123.013 I-1.569 J1.336 E.01748
G1 X145.879 Y122.883 E.01153
G1 X145.419 Y122.943 E.00963
G1 X144.939 Y123.167 E.01099
G1 X144.558 Y123.53 E.01092
G1 X144.343 Y123.929 E.0094
G1 X144.255 Y124.256 E.00701
G2 X144.208 Y125.56 I29.101 J1.688 E.02707
G1 X144.098 Y125.774 E.00499
G1 X143.839 Y125.879 E.0058
G1 X119.839 Y125.881 E.49781
G2 X118.893 Y125.883 I-.145 J116.768 E.01962
G1 X118.359 Y125.993 E.01132
G1 X117.981 Y126.21 E.00904
G1 X117.606 Y126.606 E.0113
; LINE_WIDTH: 0.492982
G1 X117.463 Y126.896 E.00737
; LINE_WIDTH: 0.535972
G1 X117.321 Y127.185 E.00805
G1 X117.296 Y127.499 E.00784
; LINE_WIDTH: 0.537822
G1 X117.285 Y128.708 E.03029
G1 X117.307 Y129.019 E.0078
; LINE_WIDTH: 0.493907
G1 X117.328 Y129.33 E.00713
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.439 E.023
G3 X117.189 Y130.778 I-.45 J.014 E.00782
G1 X116.957 Y130.88 E.00525
G1 X113.082 Y130.881 E.08039
G1 X112.416 Y130.847 E.01382
G1 X112.238 Y130.702 E.00475
G1 X112.169 Y130.468 E.00506
G1 X112.169 Y129.591 E.0182
; LINE_WIDTH: 0.485619
G1 X112.187 Y129.341 E.00565
; LINE_WIDTH: 0.521246
G1 X112.205 Y129.09 E.00609
; LINE_WIDTH: 0.556872
G2 X112.203 Y128.301 I-3.697 J-.388 E.02054
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09235
; LINE_WIDTH: 0.527152
G1 X112.195 Y124.346 E.00303
G1 X112.106 Y124.089 E.00668
; LINE_WIDTH: 0.488572
G1 X112.017 Y123.831 E.00617
; LINE_WIDTH: 0.449992
G1 X111.672 Y123.34 E.01245
G1 X111.242 Y123.041 E.01087
G1 X110.746 Y122.897 E.0107
G1 X110.195 Y122.881 E.01144
G1 X109.708 Y122.972 E.01028
G1 X109.461 Y123.07 E.0055
G1 X109.01 Y123.42 E.01184
G1 X108.787 Y123.77 E.00862
M204 S250
G1 X109.11 Y124.025 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.028 Y124.29 E.00536
G1 X108.154 Y124.29 E.01685
G1 X108.154 Y120.71 E.06901
G1 X112.154 Y120.71 E.0771
G3 X112.646 Y120.771 I.054 J1.592 E.0096
G1 X112.881 Y120.919 E.00536
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00724
G1 X113.14 Y128.301 E.13097
G1 X113.207 Y128.721 E.0082
G1 X113.436 Y129.16 E.00954
G1 X113.772 Y129.473 E.00886
G1 X114.151 Y129.65 E.00807
G1 X114.514 Y129.709 E.00709
G1 X115.096 Y129.701 E.01123
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.385 E.00802
G1 X116.125 Y129.076 E.00801
G1 X116.319 Y128.624 E.00948
G1 X116.36 Y128.301 E.00628
G1 X116.36 Y122.708 E.1078
; LINE_WIDTH: 0.430602
G1 X116.365 Y121.715 E.01966
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437732
G1 X116.786 Y122.089 E.00755
G1 X116.959 Y122.663 E.01209
; LINE_WIDTH: 0.419992
G1 X117.246 Y123.228 E.0122
G1 X117.594 Y123.679 E.011
G1 X118.016 Y124.061 E.01097
G1 X118.5 Y124.363 E.01099
G1 X119.03 Y124.574 E.01099
G2 X119.95 Y124.71 I.929 J-3.114 E.01798
G1 X141.947 Y124.705 E.42402
G1 X142.366 Y124.59 E.00837
G1 X142.722 Y124.333 E.00847
G1 X142.966 Y123.955 E.00867
G1 X143.058 Y123.53 E.00837
G1 X143.062 Y121.56 E.03797
G1 X143.149 Y121.138 E.00831
G3 X143.828 Y120.71 I.75 J.437 E.01607
G1 X147.846 Y120.71 E.07746
G1 X147.846 Y122.059 E.026
G1 X147.846 Y124.29 E.04301
G1 X146.968 Y124.29 E.01693
G1 X146.935 Y124.109 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00888
G1 X145.933 Y123.3 E.00892
G1 X145.496 Y123.345 E.00849
G1 X145.133 Y123.527 E.00782
G1 X144.858 Y123.808 E.00757
G1 X144.716 Y124.098 E.00623
G1 X144.639 Y124.469 E.0073
G1 X144.635 Y125.44 E.01872
G1 X144.547 Y125.86 E.00827
G1 X144.379 Y126.081 E.00535
G1 X144.142 Y126.23 E.00539
G1 X143.885 Y126.288 E.00509
G1 X118.949 Y126.29 E.48064
G1 X118.562 Y126.357 E.00757
G1 X118.189 Y126.563 E.00822
G1 X117.921 Y126.867 E.00781
G1 X117.782 Y127.189 E.00675
G1 X117.74 Y127.499 E.00603
G1 X117.736 Y130.44 E.05668
G1 X117.648 Y130.863 E.00833
G1 X117.517 Y131.046 E.00435
G1 X117.287 Y131.211 E.00546
G1 X116.972 Y131.29 E.00627
G1 X113.082 Y131.29 E.07498
G1 X112.442 Y131.267 E.01234
G1 X112.162 Y131.173 E.0057
G3 X111.76 Y130.49 I.516 J-.763 E.01579
G1 X111.76 Y124.47 E.11603
G1 X111.693 Y124.109 E.00706
G1 X111.466 Y123.714 E.0088
G1 X111.161 Y123.458 E.00767
G1 X110.735 Y123.306 E.00872
G1 X110.183 Y123.291 E.01063
G1 X109.798 Y123.371 E.00759
G1 X109.392 Y123.61 E.00907
G1 X109.134 Y123.949 E.00823
G1 X109.128 Y123.967 E.00036
; WIPE_START
M204 S10000
M73 P77 R3
G1 X109.028 Y124.29 E-.12839
G1 X108.154 Y124.29 E-.33215
G1 X108.154 Y123.502 E-.29946
; WIPE_END
G1 E-.04
G1 X115.786 Y123.564 Z2.52 F30000
G1 X143.898 Y123.792 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.525432
G1 F3600
G1 X143.805 Y124.188 E.00994
; WIPE_START
G1 X143.898 Y123.792 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.283 Y124.316 Z2.52 F30000
G1 X119.386 Y125.479 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.405752
G1 F3600
G1 X119.891 Y125.499 E.00939
; LINE_WIDTH: 0.364692
G1 X119.95 Y125.5 E.00097
; LINE_WIDTH: 0.363262
G1 X121.948 Y125.5 E.03297
; LINE_WIDTH: 0.363572
G1 X123.948 Y125.499 E.03303
; LINE_WIDTH: 0.363882
G1 X125.948 Y125.499 E.03306
; LINE_WIDTH: 0.364202
G1 X127.948 Y125.499 E.0331
; LINE_WIDTH: 0.364512
G1 X129.948 Y125.498 E.03313
; LINE_WIDTH: 0.364822
G1 X131.948 Y125.498 E.03316
; LINE_WIDTH: 0.365132
G1 X133.948 Y125.498 E.03319
; LINE_WIDTH: 0.365452
G1 X135.948 Y125.498 E.03322
; LINE_WIDTH: 0.365762
G1 X137.948 Y125.497 E.03325
; LINE_WIDTH: 0.366072
G1 X139.948 Y125.497 E.03328
; LINE_WIDTH: 0.366392
G1 X141.948 Y125.497 E.03331
; LINE_WIDTH: 0.381372
G1 X142.12 Y125.489 E.00299
; WIPE_START
G1 X141.948 Y125.497 E-.06541
G1 X140.12 Y125.497 E-.69459
; WIPE_END
G1 E-.04 F1800
G1 X132.623 Y126.93 Z2.52 F30000
G1 X114.081 Y130.473 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.416872
G1 F3600
G1 X115.107 Y130.496 E.01964
; LINE_WIDTH: 0.386312
G1 X115.266 Y130.488 E.00281
; WIPE_START
G1 X115.107 Y130.496 E-.102
G1 X114.081 Y130.473 E-.658
; WIPE_END
G1 E-.04 F1800
G1 X121.612 Y129.234 Z2.52 F30000
G1 X151.654 Y124.29 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.654 Y120.71 E.06901
G1 X152.507 Y120.71 E.01646
G1 X152.507 Y121.137 E.00823
G1 X152.507 Y124.29 E.06078
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.714 Y124.29 E.0153
; WIPE_START
M204 S10000
G1 X151.68 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X152.081 Y121.137 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.485412
G1 F3600
G1 X152.081 Y123.863 E.06127
; CHANGE_LAYER
; Z_HEIGHT: 2.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X152.081 Y121.863 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/45
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.52 I-.062 J-1.215 P1  F30000
G1 X104.32 Y124.29 Z2.52
G1 Z2.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X103.477 Y124.29 E.01623
G1 X103.477 Y120.71 E.06901
G1 X104.32 Y120.71 E.01623
G1 X104.32 Y121.131 E.00812
G1 X104.32 Y124.23 E.05973
; WIPE_START
M204 S10000
G1 X103.477 Y124.29 E-.32086
G1 X103.477 Y123.134 E-.43914
; WIPE_END
G1 E-.04
G1 X103.898 Y121.131 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.473752
G1 F3600
G1 X103.898 Y123.869 E.05997
; WIPE_START
G1 X103.898 Y121.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.53 Y122.003 Z2.64 F30000
G1 X144.315 Y122.582 Z2.64
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.445682
G1 F3600
G1 X144.316 Y121.966 E.01264
G1 X144.697 Y121.966 E.00781
; LINE_WIDTH: 0.483352
G1 X144.924 Y121.985 E.0051
; LINE_WIDTH: 0.521022
G1 X145.151 Y122.004 E.00552
; LINE_WIDTH: 0.558692
G1 X145.379 Y122.022 E.00594
G1 X145.173 Y122.114 E.00587
; LINE_WIDTH: 0.521022
G1 X144.967 Y122.206 E.00545
; LINE_WIDTH: 0.483352
G1 X144.761 Y122.297 E.00504
; LINE_WIDTH: 0.445682
G1 X144.366 Y122.55 E.00963
G1 X143.892 Y123.26 F30000
; LINE_WIDTH: 0.449992
G1 F3600
G1 X143.895 Y121.544 E.0356
G1 X146.986 Y121.544 E.06411
G1 X146.986 Y122.049 E.01048
G1 X146.986 Y122.857 E.01676
G2 X145.992 Y122.476 I-1.186 J1.61 E.02235
G1 X145.461 Y122.494 E.01101
G1 X144.823 Y122.734 E.01415
G1 X144.377 Y123.091 E.01185
; LINE_WIDTH: 0.493412
G1 X144.152 Y123.389 E.00855
; LINE_WIDTH: 0.536832
G1 X143.926 Y123.688 E.00934
G1 X143.909 Y123.474 E.00535
; LINE_WIDTH: 0.493412
G1 X143.897 Y123.32 E.00353
; WIPE_START
G1 X143.895 Y121.544 E-.675
G1 X144.119 Y121.544 E-.085
; WIPE_END
G1 E-.04 F1800
G1 X146.481 Y122.049 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.611892
G1 F3600
G1 X146.235 Y122.029 E.00706
; LINE_WIDTH: 0.572932
G1 X145.989 Y122.01 E.0066
; LINE_WIDTH: 0.558692
G1 X145.379 Y122.022 E.01592
; WIPE_START
G1 X145.989 Y122.01 E-.42055
G1 X146.235 Y122.029 E-.16972
G1 X146.481 Y122.049 E-.16972
; WIPE_END
G1 E-.04 F1800
G1 X142.638 Y125.412 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.536462
G1 F3600
G1 X142.856 Y125.318 E.00592
G1 X143.321 Y124.978 E.01438
; LINE_WIDTH: 0.536722
G1 X143.635 Y124.562 E.01302
; LINE_WIDTH: 0.537812
G1 X143.776 Y124.293 E.00758
G1 X143.761 Y124.602 E.00775
; LINE_WIDTH: 0.536722
G1 X143.758 Y125.412 E.02021
; LINE_WIDTH: 0.536462
G1 X142.698 Y125.412 E.02646
; WIPE_START
G1 X142.856 Y125.318 E-.06979
G1 X143.321 Y124.978 E-.2189
G1 X143.635 Y124.562 E-.19805
G1 X143.776 Y124.293 E-.1151
G1 X143.761 Y124.602 E-.11758
G1 X143.761 Y124.709 E-.04059
; WIPE_END
G1 E-.04 F1800
G1 X136.129 Y124.631 Z2.64 F30000
G1 X117.193 Y124.438 Z2.64
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.571 Y124.766 E.01039
G1 X118.187 Y125.136 E.01489
G1 X118.857 Y125.39 E.01487
G1 X119.386 Y125.479 E.01111
G1 X118.782 Y125.47 E.01253
G1 X118.197 Y125.603 E.01244
G2 X117.498 Y126.075 I1.177 J2.501 E.01757
G1 X117.193 Y126.49 E.01069
G1 X117.193 Y124.498 E.04134
G1 X117.69 Y125.315 F30000
; LINE_WIDTH: 0.530492
G1 F3600
G2 X117.721 Y125.37 I-.028 J.052 E.00754
; WIPE_START
G1 X117.69 Y125.425 E-.15201
G1 X117.626 Y125.425 E-.152
G1 X117.595 Y125.37 E-.152
G1 X117.626 Y125.315 E-.15201
G1 X117.69 Y125.315 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.744 Y130.424 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.514002
G1 F3600
G1 X116.309 Y130.118 E.01535
G1 X116.547 Y129.913 E.00749
G1 X116.872 Y129.491 E.01271
G1 X116.871 Y130.424 E.02226
G1 X115.804 Y130.424 E.02548
; WIPE_START
G1 X116.309 Y130.118 E-.22458
G1 X116.547 Y129.913 E-.11926
G1 X116.872 Y129.491 E-.20228
G1 X116.871 Y130.054 E-.21388
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.506 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.517802
G1 F3600
G1 X112.8 Y129.748 E.00717
G1 X113.3 Y130.196 E.01615
G1 X113.764 Y130.422 E.01241
G3 X112.627 Y130.419 I-.274 J-109.12 E.02734
G1 X112.627 Y129.566 E.02054
; WIPE_START
G1 X112.8 Y129.748 E-.09554
G1 X113.3 Y130.196 E-.25511
G1 X113.764 Y130.422 E-.19608
G1 X113.203 Y130.421 E-.21326
; WIPE_END
G1 E-.04 F1800
G1 X111.093 Y123.086 Z2.64 F30000
G1 X110.783 Y122.009 Z2.64
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.532572
G1 F3600
G1 X110.941 Y121.988 E.00396
; LINE_WIDTH: 0.490509
G1 X111.099 Y121.967 E.00363
; LINE_WIDTH: 0.448446
G1 X111.258 Y121.946 E.0033
; LINE_WIDTH: 0.406382
G1 X111.904 Y121.946 E.01203
G1 X111.904 Y122.476 E.00986
G1 X111.523 Y122.264 E.00812
; LINE_WIDTH: 0.448446
G1 X111.276 Y122.179 E.00539
; LINE_WIDTH: 0.490509
G1 X111.03 Y122.094 E.00593
; LINE_WIDTH: 0.532572
G1 X110.84 Y122.029 E.00498
; WIPE_START
G1 X110.941 Y121.988 E-.04154
G1 X111.099 Y121.967 E-.06066
G1 X111.258 Y121.946 E-.06066
G1 X111.904 Y121.946 E-.24563
G1 X111.904 Y122.476 E-.20133
G1 X111.559 Y122.284 E-.15018
; WIPE_END
G1 E-.04 F1800
G1 X109.014 Y122.86 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X109.014 Y121.544 E.0273
G1 X109.714 Y121.544 E.01452
G3 X112.307 Y121.56 I.997 J47.796 E.05379
G1 X112.307 Y123.487 E.03997
G1 X111.958 Y123.03 E.01192
G1 X111.467 Y122.676 E.01255
G2 X110.769 Y122.475 I-.949 J1.985 E.01515
G1 X110.178 Y122.457 E.01226
G1 X109.638 Y122.553 E.01139
G1 X109.224 Y122.718 E.00924
G1 X109.064 Y122.826 E.00401
; WIPE_START
G1 X109.014 Y121.544 E-.48781
G1 X109.714 Y121.544 E-.26598
G1 X109.73 Y121.544 E-.00621
; WIPE_END
G1 E-.04 F1800
G1 X110.783 Y122.009 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.532572
G1 F3600
G1 X110.178 Y122 E.01499
; LINE_WIDTH: 0.551092
G1 X109.96 Y122.018 E.00561
; LINE_WIDTH: 0.587352
G1 X109.743 Y122.037 E.006
; LINE_WIDTH: 0.623612
G1 X109.525 Y122.055 E.00639
; WIPE_START
G1 X109.743 Y122.037 E-.13174
G1 X109.96 Y122.018 E-.13174
G1 X110.178 Y122 E-.13174
G1 X110.783 Y122.009 E-.36479
; WIPE_END
G1 E-.04 F1800
G1 X108.74 Y123.845 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.717 Y123.881 E.00088
G1 X108.59 Y123.881 E.00264
G1 X108.59 Y121.119 E.05728
G1 X112.261 Y121.12 E.07616
G1 X112.491 Y121.157 E.00482
G1 X112.639 Y121.277 E.00397
G1 X112.731 Y121.518 E.00534
G1 X112.731 Y123.27 E.03635
; LINE_WIDTH: 0.461932
G1 X112.725 Y123.958 E.01466
; LINE_WIDTH: 0.490397
G1 X112.711 Y124.214 E.00583
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00618
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.554982
G1 X112.747 Y128.784 E.01257
G1 X112.795 Y128.872 E.0026
; LINE_WIDTH: 0.517997
G1 X112.843 Y128.961 E.00242
; LINE_WIDTH: 0.481012
G1 X113.129 Y129.429 E.01221
; LINE_WIDTH: 0.449992
G1 X113.521 Y129.795 E.01113
G1 X114.02 Y130.034 E.01147
G1 X114.559 Y130.119 E.01131
G1 X115.254 Y130.089 E.01442
G1 X115.763 Y129.923 E.01111
G1 X116.201 Y129.615 E.01111
G1 X116.538 Y129.175 E.01148
; LINE_WIDTH: 0.493882
G1 X116.657 Y128.919 E.00647
; LINE_WIDTH: 0.537772
G1 X116.777 Y128.663 E.00708
G1 X116.803 Y128.301 E.00909
; LINE_WIDTH: 0.522992
G2 X116.787 Y127.02 I-10.345 J-.513 E.03116
; LINE_WIDTH: 0.486492
G1 X116.769 Y126.713 E.00693
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.07264
G1 X116.865 Y123.388 E.00418
G1 X117.27 Y123.928 E.01399
G1 X117.798 Y124.407 E.0148
G1 X118.346 Y124.742 E.01333
G1 X118.945 Y124.975 E.01331
G2 X119.95 Y125.119 I1.028 J-3.582 E.02112
G1 X141.878 Y125.119 E.45485
G1 X142.39 Y125.018 E.01082
G1 X142.595 Y124.93 E.00463
G1 X142.987 Y124.651 E.00998
G1 X143.295 Y124.227 E.01087
G1 X143.438 Y123.778 E.00978
G1 X143.467 Y123.531 E.00515
G1 X143.471 Y121.543 E.04125
G1 X143.501 Y121.36 E.00385
G1 X143.647 Y121.187 E.00467
G1 X143.856 Y121.12 E.00457
G1 X147.41 Y121.119 E.07372
G1 X147.41 Y122.049 E.01928
G1 X147.41 Y123.881 E.038
G1 X147.281 Y123.881 E.00269
G1 X146.94 Y123.365 E.01283
G1 X146.489 Y123.042 E.0115
G1 X145.998 Y122.9 E.0106
G1 X145.535 Y122.912 E.00961
G1 X145.079 Y123.082 E.01008
G1 X144.659 Y123.408 E.01105
G1 X144.354 Y123.876 E.01157
G1 X144.238 Y124.37 E.01054
G3 X144.208 Y125.56 I-39.463 J-.382 E.02469
G1 X144.089 Y125.78 E.00519
G1 X143.848 Y125.879 E.00541
G1 X118.949 Y125.881 E.51645
G1 X118.527 Y125.942 E.00886
G1 X118.217 Y126.075 E.00698
G1 X117.826 Y126.343 E.00985
G1 X117.594 Y126.627 E.0076
; LINE_WIDTH: 0.481482
G1 X117.352 Y127.189 E.01364
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.499 E.00757
; LINE_WIDTH: 0.537772
G1 X117.285 Y128.708 E.03028
G1 X117.307 Y129.019 E.00781
; LINE_WIDTH: 0.493882
G1 X117.328 Y129.33 E.00714
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.511 E.02449
G1 X117.216 Y130.758 E.00563
G1 X116.957 Y130.88 E.00594
G1 X112.957 Y130.881 E.08297
G3 X112.416 Y130.847 I-.042 J-3.675 E.01125
G1 X112.235 Y130.699 E.00486
G1 X112.169 Y130.464 E.00506
G1 X112.169 Y129.486 E.02029
; LINE_WIDTH: 0.484989
G1 X112.187 Y129.266 E.00495
; LINE_WIDTH: 0.519986
G1 X112.204 Y129.046 E.00533
; LINE_WIDTH: 0.554982
G2 X112.203 Y128.301 I-3.257 J-.369 E.01932
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09235
; LINE_WIDTH: 0.527522
G1 X112.195 Y124.344 E.0031
G1 X112.106 Y124.085 E.00671
; LINE_WIDTH: 0.488757
G1 X112.016 Y123.827 E.00619
; LINE_WIDTH: 0.449992
M73 P78 R3
G1 X111.692 Y123.36 E.01179
G1 X111.244 Y123.042 E.0114
G1 X110.756 Y122.899 E.01055
G1 X110.196 Y122.881 E.01161
G1 X109.731 Y122.967 E.00981
G1 X109.461 Y123.07 E.006
G1 X109.01 Y123.42 E.01184
G1 X108.772 Y123.794 E.0092
M204 S250
G1 X109.104 Y124.045 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.028 Y124.29 E.00494
G1 X108.18 Y124.29 E.01633
G1 X108.18 Y120.71 E.06901
G1 X112.261 Y120.71 E.07866
G1 X112.646 Y120.771 E.00751
G1 X112.881 Y120.919 E.00535
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.203 Y128.71 E.00799
G1 X113.389 Y129.096 E.00824
G1 X113.672 Y129.401 E.00803
G1 X114.032 Y129.61 E.00802
G1 X114.549 Y129.71 E.01015
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00784
G1 X115.847 Y129.386 E.00801
G1 X116.125 Y129.076 E.00802
G1 X116.32 Y128.624 E.00949
G1 X116.36 Y128.301 E.00627
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430582
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437832
G1 X116.786 Y122.087 E.00753
G1 X116.948 Y122.634 E.01148
; LINE_WIDTH: 0.419992
G1 X117.196 Y123.148 E.01101
G1 X117.549 Y123.629 E.0115
G1 X118.016 Y124.061 E.01227
G1 X118.5 Y124.363 E.01099
G1 X119.029 Y124.574 E.01098
G2 X119.95 Y124.71 I.929 J-3.114 E.01799
G1 X141.878 Y124.71 E.42268
G1 X142.3 Y124.619 E.00831
G1 X142.664 Y124.39 E.00829
G1 X142.936 Y124.03 E.0087
G1 X143.058 Y123.535 E.00982
G1 X143.062 Y121.542 E.03842
G1 X143.118 Y121.204 E.0066
G1 X143.324 Y120.926 E.00667
G3 X143.831 Y120.71 I.599 J.703 E.01079
G1 X147.82 Y120.71 E.07688
G1 X147.82 Y122.049 E.02581
G1 X147.82 Y124.29 E.0432
G1 X146.968 Y124.29 E.01641
G1 X146.935 Y124.11 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.403 Y123.457 E.00825
G1 X146.066 Y123.322 E.007
G1 X145.639 Y123.312 E.00825
G1 X145.233 Y123.461 E.00832
G1 X144.931 Y123.714 E.00761
G1 X144.754 Y123.995 E.0064
G1 X144.639 Y124.469 E.00939
G1 X144.635 Y125.441 E.01872
G1 X144.548 Y125.859 E.00824
G1 X144.361 Y126.096 E.00581
G1 X144.095 Y126.248 E.00591
G1 X143.888 Y126.288 E.00407
G1 X118.949 Y126.29 E.48069
G1 X118.593 Y126.346 E.00695
G1 X118.198 Y126.556 E.00863
G1 X117.91 Y126.886 E.00844
G1 X117.757 Y127.32 E.00886
G1 X117.74 Y127.499 E.00348
G1 X117.736 Y130.452 E.05692
G1 X117.671 Y130.816 E.00713
G1 X117.515 Y131.048 E.00539
G1 X117.287 Y131.211 E.0054
G1 X116.972 Y131.29 E.00627
G1 X114.972 Y131.29 E.03855
G3 X112.426 Y131.265 I-.869 J-40.794 E.04907
G1 X112.162 Y131.173 E.0054
G3 X111.76 Y130.488 I.503 J-.755 E.01584
G1 X111.76 Y124.47 E.116
G1 X111.69 Y124.101 E.00723
G1 X111.481 Y123.731 E.00819
G1 X111.162 Y123.459 E.00807
G1 X110.743 Y123.308 E.00859
G1 X110.184 Y123.291 E.01079
G1 X109.756 Y123.381 E.00843
G1 X109.392 Y123.61 E.00829
G1 X109.133 Y123.949 E.00823
G1 X109.122 Y123.988 E.00078
; WIPE_START
M204 S10000
G1 X109.028 Y124.29 E-.12026
G1 X108.18 Y124.29 E-.32195
G1 X108.18 Y123.454 E-.31779
; WIPE_END
G1 E-.04
G1 X115.813 Y123.504 Z2.64 F30000
G1 X143.926 Y123.688 Z2.64
G1 Z2.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.537812
G1 F3600
G1 X143.776 Y124.293 E.01563
; WIPE_START
G1 X143.926 Y123.688 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.314 Y124.243 Z2.64 F30000
G1 X119.386 Y125.479 Z2.64
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.405792
G1 F3600
G1 X119.891 Y125.499 E.00939
; LINE_WIDTH: 0.364712
G1 X119.95 Y125.5 E.00097
; LINE_WIDTH: 0.362952
G1 X121.878 Y125.5 E.0318
; LINE_WIDTH: 0.362762
G1 X125.878 Y125.5 E.06591
; LINE_WIDTH: 0.362562
G1 X129.878 Y125.5 E.06587
; LINE_WIDTH: 0.362372
G1 X133.878 Y125.499 E.06583
; LINE_WIDTH: 0.362272
G1 X135.878 Y125.499 E.03291
; LINE_WIDTH: 0.362082
G1 X139.878 Y125.499 E.06578
; LINE_WIDTH: 0.361982
G1 X141.878 Y125.499 E.03288
; LINE_WIDTH: 0.376832
G1 X142.05 Y125.491 E.00295
; WIPE_START
G1 X141.878 Y125.499 E-.06532
G1 X140.05 Y125.499 E-.69468
; WIPE_END
G1 E-.04 F1800
G1 X132.558 Y126.956 Z2.64 F30000
G1 X114.373 Y130.492 Z2.64
G1 Z2.24
G1 E.8 F1800
; LINE_WIDTH: 0.378592
G1 F3600
G1 X115.109 Y130.496 E.0127
; LINE_WIDTH: 0.386332
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.13383
G1 X114.373 Y130.492 E-.62617
; WIPE_END
G1 E-.04 F1800
G1 X121.902 Y129.24 Z2.64 F30000
G1 X151.68 Y124.29 Z2.64
G1 Z2.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.68 Y120.71 E.06901
G1 X152.523 Y120.71 E.01623
G1 X152.523 Y121.131 E.00812
G1 X152.523 Y124.29 E.06089
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.74 Y124.29 E.01508
; WIPE_START
M204 S10000
G1 X151.707 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X152.102 Y121.131 Z2.64 F30000
G1 Z2.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.473732
G1 F3600
G1 X152.102 Y123.869 E.05996
; CHANGE_LAYER
; Z_HEIGHT: 2.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X152.102 Y121.869 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/45
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.64 I-.062 J-1.215 P1  F30000
G1 X104.302 Y124.29 Z2.64
G1 Z2.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X103.467 Y124.29 E.01609
G1 X103.467 Y120.71 E.06901
G1 X104.302 Y120.71 E.01609
G1 X104.302 Y121.127 E.00804
G1 X104.302 Y124.23 E.05981
; WIPE_START
M204 S10000
G1 X103.467 Y124.29 E-.31797
G1 X103.467 Y123.127 E-.44203
; WIPE_END
G1 E-.04
G1 X103.884 Y121.127 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.466112
G1 F3600
G1 X103.884 Y123.873 E.05911
; WIPE_START
G1 X103.884 Y121.873 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.516 Y122.008 Z2.76 F30000
G1 X144.318 Y122.589 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.450572
G1 F3600
G1 X144.319 Y121.968 E.01288
G1 X144.762 Y121.968 E.00921
; LINE_WIDTH: 0.497252
G1 X144.928 Y121.992 E.00386
; LINE_WIDTH: 0.543932
G1 X145.094 Y122.015 E.00424
; LINE_WIDTH: 0.590612
G1 X145.26 Y122.038 E.00463
G1 X145.05 Y122.148 E.00653
; LINE_WIDTH: 0.543932
G1 X144.841 Y122.258 E.00599
; LINE_WIDTH: 0.497252
G1 X144.631 Y122.368 E.00545
; LINE_WIDTH: 0.450572
G1 X144.367 Y122.554 E.00672
; WIPE_START
G1 X144.319 Y121.968 E-.22329
G1 X144.762 Y121.968 E-.16845
G1 X144.928 Y121.992 E-.06366
G1 X145.094 Y122.015 E-.06367
G1 X145.26 Y122.038 E-.06367
G1 X145.05 Y122.148 E-.0899
G1 X144.847 Y122.255 E-.08737
; WIPE_END
G1 E-.04 F1800
G1 X143.898 Y123.791 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.525692
G1 F3600
G1 X143.904 Y123.734 E.00142
; LINE_WIDTH: 0.514672
G1 X143.898 Y123.416 E.0076
; LINE_WIDTH: 0.482332
G1 X143.892 Y123.098 E.0071
; LINE_WIDTH: 0.449992
G3 X143.9 Y121.544 I112.72 J-.224 E.03223
G1 X146.968 Y121.544 E.06365
G1 X146.968 Y122.053 E.01057
G1 X146.968 Y122.848 E.01648
G1 X146.536 Y122.605 E.01027
G1 X145.879 Y122.459 E.01397
G1 X145.345 Y122.525 E.01115
G1 X144.832 Y122.742 E.01155
G1 X144.473 Y122.998 E.00915
G1 X144.249 Y123.239 E.00682
; LINE_WIDTH: 0.487842
G1 X144.074 Y123.515 E.0074
; LINE_WIDTH: 0.525692
G1 X143.93 Y123.741 E.00654
; WIPE_START
G1 X143.904 Y123.734 E-.01043
G1 X143.898 Y123.416 E-.12081
G1 X143.892 Y123.098 E-.12081
G1 X143.899 Y121.761 E-.50795
; WIPE_END
G1 E-.04 F1800
G1 X146.459 Y122.053 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.620632
G1 F3600
G1 X146.265 Y122.036 E.00564
; LINE_WIDTH: 0.585926
G1 X146.072 Y122.019 E.00531
; LINE_WIDTH: 0.551219
G1 X145.879 Y122.001 E.00498
; LINE_WIDTH: 0.553562
G1 X145.569 Y122.02 E.008
; LINE_WIDTH: 0.590612
G1 X145.26 Y122.038 E.00856
; WIPE_START
G1 X145.569 Y122.02 E-.19599
G1 X145.879 Y122.001 E-.196
G1 X146.072 Y122.019 E-.12267
G1 X146.265 Y122.036 E-.12267
G1 X146.459 Y122.053 E-.12267
; WIPE_END
G1 E-.04 F1800
G1 X142.652 Y125.411 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.537122
G1 F3600
G2 X143.512 Y124.743 I-.879 J-2.02 E.02752
G1 X143.805 Y124.188 E.01569
; LINE_WIDTH: 0.519682
G1 X143.782 Y124.313 E.00305
; LINE_WIDTH: 0.537122
G2 X143.758 Y125.411 I13.91 J.854 E.02748
G1 X142.712 Y125.411 E.02615
; WIPE_START
G1 X142.962 Y125.255 E-.11225
G1 X143.247 Y125.037 E-.13624
G1 X143.512 Y124.743 E-.15038
G1 X143.805 Y124.188 E-.23841
G1 X143.782 Y124.313 E-.04806
G1 X143.778 Y124.509 E-.07466
; WIPE_END
G1 E-.04 F1800
G1 X136.145 Y124.49 Z2.76 F30000
G1 X117.193 Y124.442 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01033
G1 X118.225 Y125.151 E.01572
G1 X118.867 Y125.392 E.01422
G1 X119.385 Y125.481 E.01091
G1 X118.86 Y125.461 E.01091
G1 X118.573 Y125.501 E.006
G1 X118.001 Y125.69 E.0125
G1 X117.545 Y126.029 E.01178
M73 P79 R3
G1 X117.193 Y126.486 E.01196
G1 X117.193 Y124.502 E.04114
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522332
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.15201
G1 X117.592 Y125.363 E-.15199
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.743 Y130.424 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.513992
G1 F3600
G1 X116.309 Y130.118 E.01535
G1 X116.557 Y129.901 E.00787
G1 X116.872 Y129.493 E.01231
G1 X116.871 Y130.424 E.02224
G1 X115.803 Y130.424 E.02548
; WIPE_START
G1 X116.309 Y130.118 E-.22459
G1 X116.557 Y129.901 E-.12526
G1 X116.872 Y129.493 E-.19589
G1 X116.871 Y130.056 E-.21427
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.5 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.517782
G1 F3600
G1 X113.039 Y129.994 E.01548
G2 X113.713 Y130.401 I1.422 J-1.592 E.01904
; LINE_WIDTH: 0.504902
G1 X113.879 Y130.435 E.00397
; LINE_WIDTH: 0.465907
G1 X114.045 Y130.468 E.00365
; LINE_WIDTH: 0.472347
G1 X113.661 Y130.445 E.0084
; LINE_WIDTH: 0.517782
G2 X112.627 Y130.419 I-.755 J9.524 E.02489
G1 X112.627 Y129.56 E.02067
; WIPE_START
G1 X113.039 Y129.994 E-.22745
G1 X113.328 Y130.211 E-.13718
G1 X113.713 Y130.401 E-.16311
G1 X113.879 Y130.435 E-.06442
G1 X114.045 Y130.468 E-.06442
G1 X113.774 Y130.452 E-.10342
; WIPE_END
G1 E-.04 F1800
G1 X111.224 Y123.258 Z2.76 F30000
G1 X110.781 Y122.009 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.532312
G1 F3600
G1 X110.94 Y121.988 E.00395
; LINE_WIDTH: 0.490339
G1 X111.098 Y121.967 E.00363
; LINE_WIDTH: 0.448366
G1 X111.256 Y121.946 E.0033
; LINE_WIDTH: 0.406392
G1 X111.904 Y121.946 E.01206
G1 X111.904 Y122.474 E.00982
G1 X111.523 Y122.264 E.0081
; LINE_WIDTH: 0.448366
G1 X111.276 Y122.179 E.0054
; LINE_WIDTH: 0.490339
G1 X111.028 Y122.094 E.00594
; LINE_WIDTH: 0.532312
G1 X110.838 Y122.029 E.00499
; WIPE_START
G1 X110.94 Y121.988 E-.04155
G1 X111.098 Y121.967 E-.06068
G1 X111.256 Y121.946 E-.06068
G1 X111.904 Y121.946 E-.24622
G1 X111.904 Y122.474 E-.20055
G1 X111.557 Y122.283 E-.15033
; WIPE_END
G1 E-.04 F1800
G1 X109.032 Y122.848 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X109.032 Y121.544 E.02705
G1 X109.714 Y121.544 E.01414
G3 X112.307 Y121.56 I.997 J48.308 E.05379
G1 X112.307 Y123.484 E.03992
G2 X111.935 Y123.007 I-1.573 J.84 E.01261
G1 X111.467 Y122.676 E.01189
G2 X110.767 Y122.474 I-.951 J1.989 E.01518
G1 X110.178 Y122.457 E.01223
G1 X109.653 Y122.55 E.01105
G1 X109.224 Y122.718 E.00956
G1 X109.082 Y122.814 E.00357
; WIPE_START
G1 X109.032 Y121.544 E-.48319
G1 X109.714 Y121.544 E-.25913
G1 X109.76 Y121.544 E-.01769
; WIPE_END
G1 E-.04 F1800
G1 X110.781 Y122.009 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.532312
G1 F3600
G1 X110.178 Y122 E.01494
; LINE_WIDTH: 0.549879
G1 X109.966 Y122.018 E.00546
; LINE_WIDTH: 0.584926
G1 X109.753 Y122.035 E.00582
; LINE_WIDTH: 0.619972
G1 X109.541 Y122.053 E.00619
; WIPE_START
G1 X109.753 Y122.035 E-.13033
G1 X109.966 Y122.018 E-.13033
G1 X110.178 Y122 E-.13033
G1 X110.781 Y122.009 E-.369
; WIPE_END
G1 E-.04 F1800
G1 X108.724 Y123.869 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.717 Y123.881 E.00029
G1 X108.608 Y123.881 E.00226
G1 X108.608 Y121.119 E.05728
G1 X112.262 Y121.12 E.07581
G1 X112.49 Y121.157 E.00479
G1 X112.64 Y121.278 E.00399
G1 X112.731 Y121.518 E.00532
G1 X112.731 Y123.227 E.03544
; LINE_WIDTH: 0.457812
G1 X112.727 Y123.927 E.01479
; LINE_WIDTH: 0.488337
G1 X112.712 Y124.198 E.00615
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00655
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.550212
G1 X112.741 Y128.752 E.01162
G1 X112.784 Y128.837 E.00246
; LINE_WIDTH: 0.518322
G1 X112.826 Y128.923 E.00231
; LINE_WIDTH: 0.486432
G1 X113.103 Y129.394 E.0123
; LINE_WIDTH: 0.449992
G1 X113.537 Y129.804 E.01238
G1 X114.106 Y130.06 E.01294
G1 X114.559 Y130.119 E.00947
G1 X115.254 Y130.089 E.01442
G1 X115.762 Y129.923 E.0111
G1 X116.207 Y129.608 E.0113
G1 X116.56 Y129.136 E.01222
; LINE_WIDTH: 0.493877
G1 X116.668 Y128.899 E.00596
; LINE_WIDTH: 0.537762
G1 X116.777 Y128.663 E.00652
G1 X116.803 Y128.301 E.00909
; LINE_WIDTH: 0.525992
G2 X116.788 Y126.986 I-11.309 J-.528 E.03217
; LINE_WIDTH: 0.487992
G1 X116.769 Y126.635 E.00796
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.198 E.07129
G1 X116.92 Y123.476 E.00658
G1 X117.318 Y123.981 E.01332
G1 X117.798 Y124.408 E.01333
G1 X118.384 Y124.758 E.01416
G1 X118.945 Y124.975 E.01247
G2 X119.95 Y125.119 I1.028 J-3.582 E.02112
G1 X141.939 Y125.115 E.4561
G1 X142.479 Y124.984 E.01154
G2 X143.113 Y124.5 I-.843 J-1.762 E.01666
G1 X143.373 Y124.045 E.01087
G1 X143.467 Y123.531 E.01082
G1 X143.471 Y121.561 E.04087
G1 X143.523 Y121.318 E.00515
G1 X143.645 Y121.197 E.00356
G1 X143.846 Y121.12 E.00447
G1 X147.392 Y121.119 E.07356
G1 X147.392 Y122.053 E.01937
G1 X147.392 Y123.881 E.03791
G1 X147.282 Y123.881 E.0023
G1 X147.08 Y123.527 E.00844
G2 X146.419 Y123.013 I-1.569 J1.336 E.01749
G1 X145.879 Y122.883 E.01153
G1 X145.419 Y122.943 E.00963
G1 X144.941 Y123.165 E.01093
G1 X144.56 Y123.527 E.01091
G1 X144.343 Y123.93 E.00949
G1 X144.255 Y124.255 E.007
G2 X144.208 Y125.56 I31.225 J1.765 E.02708
G1 X144.089 Y125.78 E.00518
G1 X143.848 Y125.879 E.00541
G1 X119.848 Y125.885 E.49781
G2 X118.691 Y125.909 I-.228 J16.825 E.024
G1 X118.201 Y126.064 E.01066
G1 X117.808 Y126.362 E.01024
G1 X117.662 Y126.529 E.00459
; LINE_WIDTH: 0.456442
G1 X117.403 Y127.031 E.01189
; LINE_WIDTH: 0.487537
G1 X117.35 Y127.265 E.00542
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.498 E.00578
; LINE_WIDTH: 0.537762
G1 X117.285 Y128.708 E.03027
G1 X117.307 Y128.994 E.00719
; LINE_WIDTH: 0.493877
G1 X117.328 Y129.281 E.00657
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.439 E.02403
G3 X117.19 Y130.777 I-.447 J.015 E.00778
G1 X116.957 Y130.88 E.00528
G1 X112.957 Y130.881 E.08297
G3 X112.369 Y130.818 I-.155 J-1.329 E.01238
G1 X112.215 Y130.66 E.00456
G1 X112.169 Y130.478 E.0039
G1 X112.169 Y129.426 E.02182
; LINE_WIDTH: 0.484022
G1 X112.186 Y129.222 E.00459
; LINE_WIDTH: 0.518052
G1 X112.203 Y129.018 E.00493
; LINE_WIDTH: 0.552082
G2 X112.203 Y128.301 I-3.086 J-.36 E.01849
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09234
; LINE_WIDTH: 0.528462
G1 X112.194 Y124.337 E.00327
G1 X112.098 Y124.066 E.00706
; LINE_WIDTH: 0.489227
G1 X112.001 Y123.796 E.00651
; LINE_WIDTH: 0.449992
G1 X111.673 Y123.34 E.01165
G1 X111.244 Y123.042 E.01083
G1 X110.754 Y122.898 E.01058
G1 X110.196 Y122.881 E.01158
G1 X109.747 Y122.963 E.00948
G1 X109.461 Y123.07 E.00632
G1 X109.01 Y123.419 E.01184
G1 X108.756 Y123.818 E.0098
M204 S250
G1 X109.097 Y124.066 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.028 Y124.29 E.00453
G1 X108.198 Y124.29 E.01598
G1 X108.198 Y120.71 E.06901
G1 X112.262 Y120.71 E.07834
G1 X112.646 Y120.771 E.00748
G1 X112.881 Y120.92 E.00536
G1 X113.05 Y121.141 E.00536
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.195 Y128.684 E.00746
G1 X113.366 Y129.063 E.00802
G1 X113.671 Y129.399 E.00875
G1 X114.106 Y129.635 E.00955
G1 X114.549 Y129.71 E.00867
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00784
G1 X115.847 Y129.386 E.00802
G1 X116.146 Y129.043 E.00876
G1 X116.321 Y128.621 E.00881
G1 X116.36 Y128.301 E.00621
G1 X116.36 Y122.701 E.10795
; LINE_WIDTH: 0.430592
G1 X116.365 Y121.715 E.01951
M73 P79 R2
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437762
G1 X116.786 Y122.088 E.00754
G1 X116.957 Y122.657 E.01195
; LINE_WIDTH: 0.419992
G1 X117.246 Y123.228 E.01234
G1 X117.594 Y123.679 E.01098
G1 X118.017 Y124.062 E.01099
G1 X118.538 Y124.378 E.01176
G2 X119.95 Y124.71 I1.523 J-3.315 E.02814
G1 X141.938 Y124.706 E.42384
G1 X142.365 Y124.591 E.00852
G1 X142.715 Y124.34 E.00829
G1 X142.966 Y123.956 E.00885
G1 X143.058 Y123.53 E.00838
G1 X143.062 Y121.56 E.03798
G1 X143.15 Y121.137 E.00834
G1 X143.281 Y120.954 E.00434
G1 X143.512 Y120.788 E.00548
G1 X143.828 Y120.71 E.00626
G1 X147.802 Y120.71 E.07659
G1 X147.802 Y122.053 E.02589
G1 X147.802 Y124.29 E.04312
G1 X146.968 Y124.29 E.01606
G1 X146.935 Y124.11 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00888
G1 X145.933 Y123.3 E.00892
G1 X145.495 Y123.345 E.00848
G1 X145.135 Y123.526 E.00777
G1 X144.86 Y123.806 E.00757
G1 X144.715 Y124.099 E.0063
G1 X144.639 Y124.469 E.00728
G1 X144.635 Y125.441 E.01873
G1 X144.548 Y125.859 E.00823
G1 X144.361 Y126.096 E.00581
G1 X144.095 Y126.248 E.00592
G1 X143.887 Y126.288 E.00407
G1 X118.86 Y126.294 E.48242
G1 X118.433 Y126.41 E.00853
G1 X118.061 Y126.684 E.00891
G1 X117.834 Y127.04 E.00814
G1 X117.74 Y127.499 E.00903
G1 X117.736 Y130.44 E.05668
G1 X117.648 Y130.864 E.00835
G1 X117.517 Y131.046 E.00433
G1 X117.282 Y131.214 E.00558
G1 X116.972 Y131.29 E.00615
G1 X112.972 Y131.29 E.0771
G3 X112.276 Y131.237 I-.163 J-2.484 E.0135
G1 X112.042 Y131.101 E.00521
G1 X111.848 Y130.856 E.00601
G1 X111.76 Y130.493 E.00721
G1 X111.76 Y124.47 E.1161
G1 X111.682 Y124.079 E.00769
G1 X111.464 Y123.711 E.00823
G1 X111.161 Y123.458 E.00761
G1 X110.742 Y123.307 E.00858
G1 X110.184 Y123.291 E.01076
G1 X109.756 Y123.381 E.00842
G1 X109.393 Y123.61 E.00828
G1 X109.133 Y123.949 E.00824
G1 X109.115 Y124.008 E.00119
; WIPE_START
M204 S10000
G1 X109.028 Y124.29 E-.11206
G1 X108.198 Y124.29 E-.3151
G1 X108.198 Y123.414 E-.33285
; WIPE_END
G1 E-.04
G1 X115.83 Y123.495 Z2.76 F30000
G1 X143.898 Y123.791 Z2.76
G1 Z2.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.525692
G1 F3600
G1 X143.805 Y124.188 E.00997
; WIPE_START
G1 X143.898 Y123.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.284 Y124.316 Z2.76 F30000
G1 X119.385 Y125.481 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.409772
G1 F3600
G1 X119.891 Y125.501 E.0095
; LINE_WIDTH: 0.368552
G1 X119.95 Y125.502 E.00099
; LINE_WIDTH: 0.366772
G1 X121.939 Y125.501 E.03316
; LINE_WIDTH: 0.366592
G1 X125.939 Y125.501 E.06666
; LINE_WIDTH: 0.366412
G1 X129.939 Y125.5 E.06662
; LINE_WIDTH: 0.366232
G1 X133.939 Y125.499 E.06659
; LINE_WIDTH: 0.366052
G1 X137.939 Y125.498 E.06655
; LINE_WIDTH: 0.365872
G1 X141.939 Y125.497 E.06652
; LINE_WIDTH: 0.380772
G1 X142.111 Y125.49 E.00299
; WIPE_START
G1 X141.939 Y125.497 E-.06545
G1 X140.111 Y125.498 E-.69455
; WIPE_END
G1 E-.04 F1800
G1 X132.613 Y126.927 Z2.76 F30000
G1 X114.045 Y130.468 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.426912
G1 F3600
G1 X114.297 Y130.484 E.00496
; LINE_WIDTH: 0.394882
G1 X114.549 Y130.5 E.00456
; LINE_WIDTH: 0.371432
G1 X115.109 Y130.496 E.00946
; LINE_WIDTH: 0.386312
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.09781
G1 X114.549 Y130.5 E-.34804
G1 X114.297 Y130.484 E-.15707
G1 X114.045 Y130.468 E-.15708
; WIPE_END
G1 E-.04 F1800
G1 X121.577 Y129.232 Z2.76 F30000
G1 X151.698 Y124.29 Z2.76
G1 Z2.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.698 Y120.71 E.06901
G1 X152.533 Y120.71 E.01609
G1 X152.533 Y121.127 E.00804
G1 X152.533 Y124.29 E.06096
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.758 Y124.29 E.01493
; WIPE_START
M204 S10000
G1 X151.725 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X152.116 Y121.127 Z2.76 F30000
G1 Z2.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.466112
G1 F3600
G1 X152.116 Y123.873 E.05911
; CHANGE_LAYER
; Z_HEIGHT: 2.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X152.116 Y121.873 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/45
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.76 I-.061 J-1.215 P1  F30000
G1 X104.292 Y124.29 Z2.76
G1 Z2.48
M73 P80 R2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X103.461 Y124.29 E.01602
G1 X103.461 Y120.71 E.06901
G1 X104.292 Y120.71 E.01602
G1 X104.292 Y121.125 E.00801
G1 X104.292 Y124.23 E.05984
; WIPE_START
M204 S10000
G1 X103.461 Y124.29 E-.31657
G1 X103.461 Y123.123 E-.44343
; WIPE_END
G1 E-.04
G1 X103.877 Y121.125 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.462432
G1 F3600
G1 X103.877 Y123.875 E.05869
; WIPE_START
G1 X103.877 Y121.875 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.508 Y122.009 Z2.88 F30000
G1 X144.317 Y122.59 Z2.88
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.450642
G1 F3600
G1 X144.318 Y121.972 E.01283
G1 X144.745 Y121.971 E.00888
; LINE_WIDTH: 0.496506
G1 X144.916 Y121.994 E.00398
; LINE_WIDTH: 0.542369
G1 X145.088 Y122.017 E.00436
; LINE_WIDTH: 0.588232
G1 X145.259 Y122.04 E.00475
G1 X145.113 Y122.115 E.00452
; LINE_WIDTH: 0.542369
G1 X144.967 Y122.191 E.00415
; LINE_WIDTH: 0.496506
G1 X144.821 Y122.266 E.00378
; LINE_WIDTH: 0.450642
G1 X144.367 Y122.557 E.0112
; WIPE_START
G1 X144.318 Y121.972 E-.22318
G1 X144.745 Y121.971 E-.16246
G1 X144.916 Y121.994 E-.06563
G1 X145.088 Y122.017 E-.06563
G1 X145.259 Y122.04 E-.06563
G1 X145.113 Y122.115 E-.06242
G1 X144.967 Y122.191 E-.06241
G1 X144.844 Y122.254 E-.05264
; WIPE_END
G1 E-.04 F1800
G1 X143.898 Y123.791 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.525772
G1 F3600
G1 X143.904 Y123.734 E.00139
; LINE_WIDTH: 0.514962
G1 X143.898 Y123.422 E.00746
; LINE_WIDTH: 0.482477
G1 X143.892 Y123.11 E.00697
; LINE_WIDTH: 0.449992
G3 X143.899 Y121.548 I92.315 J-.35 E.03241
G1 X146.959 Y121.545 E.06346
G1 X146.959 Y122.053 E.01054
G1 X146.959 Y122.84 E.01633
G1 X146.536 Y122.606 E.01002
G1 X145.878 Y122.459 E.01399
G1 X145.345 Y122.526 E.01115
G1 X144.837 Y122.742 E.01144
G1 X144.447 Y123.02 E.00994
G1 X144.242 Y123.246 E.00632
; LINE_WIDTH: 0.487882
G1 X144.07 Y123.518 E.00728
; LINE_WIDTH: 0.525772
G1 X143.93 Y123.74 E.00641
; WIPE_START
G1 X143.904 Y123.734 E-.0103
G1 X143.898 Y123.422 E-.11859
G1 X143.892 Y123.11 E-.11859
G1 X143.898 Y121.761 E-.51251
; WIPE_END
G1 E-.04 F1800
G1 X146.451 Y122.053 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.617032
G1 F3600
G1 X146.26 Y122.036 E.00555
; LINE_WIDTH: 0.582846
G1 X146.068 Y122.019 E.00523
; LINE_WIDTH: 0.548659
G1 X145.877 Y122.002 E.00491
; LINE_WIDTH: 0.551352
G1 X145.568 Y122.021 E.00796
; LINE_WIDTH: 0.588232
G1 X145.259 Y122.04 E.00852
; WIPE_START
G1 X145.568 Y122.021 E-.19699
G1 X145.877 Y122.002 E-.19699
G1 X146.068 Y122.019 E-.12201
G1 X146.26 Y122.036 E-.12201
G1 X146.451 Y122.053 E-.122
; WIPE_END
G1 E-.04 F1800
G1 X142.653 Y125.411 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.537352
G1 F3600
G2 X143.518 Y124.737 I-.895 J-2.039 E.02772
G1 X143.804 Y124.189 E.01548
G2 X143.758 Y125.411 I8.958 J.955 E.03062
G1 X142.713 Y125.411 E.02613
; WIPE_START
G1 X142.965 Y125.253 E-.11298
G1 X143.254 Y125.031 E-.13845
G1 X143.518 Y124.737 E-.15026
G1 X143.804 Y124.189 E-.2351
G1 X143.781 Y124.512 E-.12322
; WIPE_END
G1 E-.04 F1800
G1 X136.149 Y124.492 Z2.88 F30000
G1 X117.193 Y124.442 Z2.88
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01033
G1 X118.222 Y125.15 E.01566
G1 X118.861 Y125.391 E.01418
G1 X119.386 Y125.481 E.01104
G1 X118.854 Y125.461 E.01104
G1 X118.565 Y125.502 E.00605
G1 X118.001 Y125.69 E.01234
G1 X117.545 Y126.029 E.01177
G1 X117.193 Y126.486 E.01197
G1 X117.193 Y124.502 E.04115
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522312
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.15201
G1 X117.592 Y125.363 E-.15199
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.744 Y130.424 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.514002
G1 F3600
G1 X116.309 Y130.117 E.01536
G1 X116.557 Y129.9 E.00786
G1 X116.872 Y129.493 E.0123
G3 X116.86 Y130.424 I-36.095 J.019 E.02224
G1 X115.804 Y130.424 E.02523
; WIPE_START
G1 X116.309 Y130.117 E-.22472
G1 X116.557 Y129.9 E-.12515
G1 X116.872 Y129.493 E-.19584
G1 X116.865 Y130.056 E-.21428
; WIPE_END
G1 E-.04 F1800
G1 X112.629 Y129.498 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.520342
G1 F3600
G1 X112.682 Y129.592 E.00263
G1 X113.043 Y129.992 E.013
G1 X113.428 Y130.275 E.01156
G1 X113.79 Y130.43 E.00952
; LINE_WIDTH: 0.496172
G1 X113.943 Y130.452 E.00355
; LINE_WIDTH: 0.455512
G1 X114.095 Y130.474 E.00324
; LINE_WIDTH: 0.450016
G1 X113.862 Y130.456 E.00485
; LINE_WIDTH: 0.485179
G1 X113.629 Y130.439 E.00525
; LINE_WIDTH: 0.520342
G2 X112.629 Y130.418 I-.643 J6.979 E.02422
G1 X112.629 Y129.558 E.02081
; WIPE_START
G1 X112.682 Y129.592 E-.02429
G1 X113.043 Y129.992 E-.20435
G1 X113.428 Y130.275 E-.18173
G1 X113.79 Y130.43 E-.14964
G1 X113.943 Y130.452 E-.05859
G1 X114.095 Y130.474 E-.05859
G1 X113.878 Y130.458 E-.0828
; WIPE_END
G1 E-.04 F1800
G1 X111.25 Y123.292 Z2.88 F30000
G1 X110.78 Y122.009 Z2.88
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.532052
G1 F3600
G1 X110.938 Y121.988 E.00395
; LINE_WIDTH: 0.490162
G1 X111.096 Y121.967 E.00362
; LINE_WIDTH: 0.448272
G1 X111.254 Y121.946 E.0033
; LINE_WIDTH: 0.406382
G1 X111.904 Y121.946 E.0121
G1 X111.904 Y122.474 E.00982
G1 X111.522 Y122.264 E.00811
; LINE_WIDTH: 0.448272
G1 X111.275 Y122.179 E.00541
; LINE_WIDTH: 0.490162
G1 X111.027 Y122.094 E.00594
; LINE_WIDTH: 0.532052
G1 X110.836 Y122.028 E.00499
; WIPE_START
G1 X110.938 Y121.988 E-.04148
G1 X111.096 Y121.967 E-.06062
G1 X111.254 Y121.946 E-.06063
G1 X111.904 Y121.946 E-.24704
G1 X111.904 Y122.474 E-.20055
G1 X111.559 Y122.284 E-.14969
; WIPE_END
G1 E-.04 F1800
G1 X109.041 Y122.841 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X109.041 Y121.544 E.02692
G1 X109.714 Y121.544 E.01395
G3 X112.307 Y121.56 I.996 J48.163 E.05379
G1 X112.307 Y123.477 E.03977
G1 X111.935 Y123.007 E.01244
G1 X111.467 Y122.676 E.01188
G2 X110.766 Y122.474 I-.953 J1.994 E.01522
G1 X110.178 Y122.457 E.01219
G1 X109.662 Y122.548 E.01087
G1 X109.224 Y122.718 E.00974
G1 X109.091 Y122.808 E.00332
; WIPE_START
G1 X109.041 Y121.544 E-.48075
G1 X109.714 Y121.544 E-.2555
G1 X109.776 Y121.544 E-.02375
; WIPE_END
G1 E-.04 F1800
G1 X110.78 Y122.009 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.532052
G1 F3600
G1 X110.178 Y122 E.01489
; LINE_WIDTH: 0.549239
G1 X109.969 Y122.017 E.00538
; LINE_WIDTH: 0.583646
G1 X109.759 Y122.035 E.00573
; LINE_WIDTH: 0.618052
G1 X109.55 Y122.052 E.00609
; WIPE_START
G1 X109.759 Y122.035 E-.12963
G1 X109.969 Y122.017 E-.12963
G1 X110.178 Y122 E-.12963
G1 X110.78 Y122.009 E-.37111
; WIPE_END
G1 E-.04 F1800
G1 X108.717 Y123.881 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.617 Y123.881 E.00206
G1 X108.617 Y121.119 E.05728
G1 X112.263 Y121.12 E.07563
G1 X112.49 Y121.157 E.00477
G1 X112.64 Y121.278 E.00399
G1 X112.731 Y121.518 E.00533
G1 X112.731 Y123.21 E.0351
; LINE_WIDTH: 0.452022
G1 X112.73 Y123.884 E.01406
; LINE_WIDTH: 0.485442
G1 X112.713 Y124.177 E.00659
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00707
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.518722
G1 X112.756 Y128.565 E.00654
; LINE_WIDTH: 0.484357
G1 X112.816 Y128.83 E.00608
; LINE_WIDTH: 0.449992
G1 X113.081 Y129.365 E.01238
G1 X113.463 Y129.753 E.0113
G1 X113.978 Y130.021 E.01203
G1 X114.559 Y130.119 E.01223
G1 X115.253 Y130.089 E.01442
G1 X115.763 Y129.923 E.01111
G1 X116.207 Y129.608 E.0113
G1 X116.56 Y129.136 E.01221
; LINE_WIDTH: 0.493887
G1 X116.668 Y128.9 E.00596
; LINE_WIDTH: 0.537782
G1 X116.777 Y128.663 E.00652
G1 X116.803 Y128.301 E.0091
; LINE_WIDTH: 0.525952
G2 X116.788 Y126.987 I-11.294 J-.527 E.03214
; LINE_WIDTH: 0.487972
G1 X116.769 Y126.636 E.00794
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.07105
G1 X116.868 Y123.393 E.0043
G1 X117.317 Y123.981 E.01534
G1 X117.798 Y124.407 E.01333
G1 X118.381 Y124.756 E.0141
G1 X118.945 Y124.975 E.01254
G2 X119.95 Y125.119 I1.028 J-3.583 E.02112
G1 X141.944 Y125.115 E.45621
G1 X142.48 Y124.983 E.01145
G2 X143.118 Y124.494 I-.863 J-1.784 E.01678
G1 X143.373 Y124.045 E.01072
G1 X143.467 Y123.531 E.01083
G1 X143.469 Y121.571 E.04066
G1 X143.517 Y121.333 E.00504
G1 X143.621 Y121.213 E.00329
G1 X143.837 Y121.124 E.00486
G1 X147.383 Y121.12 E.07354
G1 X147.383 Y122.053 E.01935
G1 X147.383 Y123.881 E.03791
G1 X147.282 Y123.881 E.00209
G1 X147.08 Y123.527 E.00844
G2 X146.419 Y123.013 I-1.569 J1.335 E.01748
G1 X145.878 Y122.883 E.01155
G1 X145.418 Y122.943 E.00962
G1 X144.917 Y123.182 E.01152
G1 X144.556 Y123.531 E.01041
G1 X144.342 Y123.931 E.00939
G1 X144.255 Y124.256 E.00699
G2 X144.208 Y125.56 I30.015 J1.72 E.02707
G1 X144.083 Y125.787 E.00537
G1 X143.839 Y125.879 E.00542
G1 X119.839 Y125.885 E.49781
G2 X118.684 Y125.91 I-.222 J16.687 E.02396
G1 X118.201 Y126.064 E.01052
G1 X117.808 Y126.362 E.01024
G1 X117.662 Y126.529 E.0046
; LINE_WIDTH: 0.456652
G1 X117.403 Y127.032 E.01192
; LINE_WIDTH: 0.487642
G1 X117.35 Y127.265 E.0054
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.499 E.00577
; LINE_WIDTH: 0.537782
G1 X117.285 Y128.708 E.03028
G1 X117.307 Y128.995 E.00719
; LINE_WIDTH: 0.493887
G1 X117.329 Y129.281 E.00658
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.413 E.02348
G1 X117.275 Y130.682 E.00568
G1 X117.157 Y130.798 E.00343
G1 X116.911 Y130.88 E.00537
G1 X112.911 Y130.881 E.08297
G3 X112.367 Y130.816 I-.132 J-1.21 E.01146
G1 X112.216 Y130.661 E.0045
G1 X112.169 Y130.478 E.00392
G1 X112.169 Y128.888 E.03298
; LINE_WIDTH: 0.484357
G1 X112.186 Y128.594 E.00659
; LINE_WIDTH: 0.518722
G1 X112.203 Y128.301 E.00708
G1 X112.203 Y126.301 E.0482
; LINE_WIDTH: 0.518862
G1 X112.203 Y124.47 E.04414
; LINE_WIDTH: 0.529902
G1 X112.193 Y124.327 E.00352
G1 X112.089 Y124.044 E.00744
; LINE_WIDTH: 0.489947
G1 X111.985 Y123.761 E.00685
; LINE_WIDTH: 0.449992
G1 X111.672 Y123.34 E.01087
G1 X111.244 Y123.042 E.01083
G1 X110.753 Y122.898 E.01061
G1 X110.196 Y122.881 E.01156
G2 X109.461 Y123.07 I.168 J2.181 E.01582
G1 X109.01 Y123.42 E.01184
G1 X108.749 Y123.83 E.01009
M204 S250
G1 X109.091 Y124.086 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.028 Y124.29 E.00411
G1 X108.208 Y124.29 E.0158
G1 X108.208 Y120.71 E.06901
G1 X112.263 Y120.71 E.07817
G1 X112.646 Y120.771 E.00747
G1 X112.881 Y120.919 E.00536
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.219 Y128.757 E.00893
G1 X113.437 Y129.162 E.00886
G1 X113.739 Y129.451 E.00807
G1 X114.148 Y129.649 E.00875
G1 X114.549 Y129.71 E.00782
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00875
G1 X116.321 Y128.621 E.00881
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.678 E.10839
; LINE_WIDTH: 0.430592
G1 X116.365 Y121.715 E.01905
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437822
G1 X116.786 Y122.087 E.00752
G1 X116.948 Y122.634 E.01148
; LINE_WIDTH: 0.419992
G1 X117.197 Y123.15 E.01105
G1 X117.594 Y123.679 E.01274
G1 X118.017 Y124.061 E.01099
G1 X118.535 Y124.377 E.0117
G2 X119.95 Y124.71 I1.527 J-3.317 E.0282
G1 X141.944 Y124.705 E.42395
G1 X142.366 Y124.59 E.00843
G1 X142.719 Y124.336 E.0084
G1 X142.966 Y123.955 E.00874
G1 X143.058 Y123.531 E.00837
G1 X143.06 Y121.571 E.03778
G1 X143.139 Y121.159 E.00807
G1 X143.282 Y120.953 E.00484
G1 X143.51 Y120.789 E.0054
G1 X143.782 Y120.714 E.00543
G1 X147.792 Y120.71 E.0773
G1 X147.792 Y122.053 E.02588
G1 X147.792 Y124.29 E.04312
G1 X146.968 Y124.29 E.01588
G1 X146.935 Y124.109 E.00354
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00887
G1 X145.933 Y123.3 E.00892
G1 X145.496 Y123.345 E.00848
G1 X145.115 Y123.541 E.00825
G1 X144.859 Y123.807 E.00711
G1 X144.715 Y124.1 E.0063
G1 X144.639 Y124.469 E.00726
G1 X144.635 Y125.441 E.01873
G1 X144.548 Y125.859 E.00823
G1 X144.36 Y126.098 E.00586
G3 X143.885 Y126.288 I-.519 J-.607 E.01004
G1 X118.854 Y126.295 E.48247
G1 X118.432 Y126.41 E.00843
G1 X118.061 Y126.684 E.0089
G1 X117.833 Y127.041 E.00817
G1 X117.74 Y127.499 E.00901
G1 X117.736 Y130.441 E.0567
G1 X117.648 Y130.863 E.00831
G1 X117.518 Y131.045 E.00431
G1 X117.267 Y131.22 E.0059
G1 X116.957 Y131.29 E.00612
G1 X112.957 Y131.29 E.0771
G3 X112.276 Y131.238 I-.155 J-2.432 E.01321
G1 X112.038 Y131.097 E.00534
G1 X111.849 Y130.856 E.00589
G1 X111.76 Y130.493 E.00721
G1 X111.76 Y124.47 E.1161
G1 X111.669 Y124.048 E.00831
G1 X111.462 Y123.709 E.00767
G1 X111.161 Y123.458 E.00755
G1 X110.741 Y123.307 E.00861
G1 X110.184 Y123.291 E.01074
G1 X109.756 Y123.381 E.00842
G1 X109.392 Y123.61 E.00829
G1 X109.133 Y123.949 E.00823
M73 P81 R2
G1 X109.109 Y124.029 E.00161
; WIPE_START
M204 S10000
G1 X109.028 Y124.29 E-.1039
G1 X108.208 Y124.29 E-.31147
G1 X108.208 Y123.383 E-.34463
; WIPE_END
G1 E-.04
G1 X115.84 Y123.47 Z2.88 F30000
G1 X143.898 Y123.791 Z2.88
G1 Z2.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.525772
G1 F3600
G1 X143.804 Y124.189 E.00999
; WIPE_START
G1 X143.898 Y123.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.284 Y124.316 Z2.88 F30000
G1 X119.386 Y125.481 Z2.88
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.410272
G1 F3600
G1 X119.891 Y125.501 E.0095
; LINE_WIDTH: 0.369092
G1 X119.95 Y125.502 E.00099
; LINE_WIDTH: 0.367332
G1 X121.944 Y125.502 E.03331
; LINE_WIDTH: 0.367152
G1 X125.944 Y125.501 E.06677
; LINE_WIDTH: 0.366982
G1 X129.944 Y125.5 E.06673
; LINE_WIDTH: 0.366802
G1 X133.944 Y125.499 E.0667
; LINE_WIDTH: 0.366632
G1 X137.944 Y125.498 E.06667
; LINE_WIDTH: 0.366452
G1 X141.944 Y125.497 E.06663
; LINE_WIDTH: 0.381352
G1 X142.116 Y125.49 E.003
; WIPE_START
G1 X141.944 Y125.497 E-.06547
G1 X140.116 Y125.498 E-.69453
; WIPE_END
G1 E-.04 F1800
G1 X132.62 Y126.931 Z2.88 F30000
G1 X114.095 Y130.474 Z2.88
G1 Z2.48
G1 E.8 F1800
; LINE_WIDTH: 0.414852
G1 F3600
G1 X115.109 Y130.496 E.01929
; LINE_WIDTH: 0.386312
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.10205
G1 X114.095 Y130.474 E-.65795
; WIPE_END
G1 E-.04 F1800
G1 X121.627 Y129.236 Z2.88 F30000
G1 X151.708 Y124.29 Z2.88
G1 Z2.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.708 Y120.71 E.06901
G1 X152.539 Y120.71 E.01602
G1 X152.539 Y121.125 E.00801
G1 X152.539 Y124.29 E.061
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.768 Y124.29 E.01486
; WIPE_START
M204 S10000
G1 X151.734 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X152.123 Y121.125 Z2.88 F30000
G1 Z2.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.462412
G1 F3600
G1 X152.123 Y123.875 E.05869
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X152.123 Y121.875 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/45
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.88 I-.061 J-1.215 P1  F30000
G1 X104.291 Y124.29 Z2.88
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X103.461 Y124.29 E.016
G1 X103.461 Y120.71 E.06901
G1 X104.291 Y120.71 E.016
G1 X104.291 Y121.125 E.008
G1 X104.291 Y124.23 E.05985
; WIPE_START
M204 S10000
G1 X103.461 Y124.29 E-.31625
G1 X103.461 Y123.122 E-.44375
; WIPE_END
G1 E-.04
G1 X103.876 Y121.125 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.461572
G1 F3600
G1 X103.876 Y123.875 E.0586
; WIPE_START
G1 X103.876 Y121.875 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.507 Y122.01 Z3 F30000
G1 X144.317 Y122.589 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.450812
G1 F3600
G1 X144.318 Y121.972 E.01284
G1 X144.745 Y121.971 E.00888
; LINE_WIDTH: 0.496739
G1 X144.916 Y121.994 E.00398
; LINE_WIDTH: 0.542666
G1 X145.087 Y122.017 E.00437
; LINE_WIDTH: 0.588592
G1 X145.259 Y122.04 E.00476
G1 X145.113 Y122.115 E.00452
; LINE_WIDTH: 0.542666
G1 X144.967 Y122.191 E.00415
; LINE_WIDTH: 0.496739
G1 X144.821 Y122.266 E.00378
; LINE_WIDTH: 0.450812
G1 X144.367 Y122.557 E.01119
; WIPE_START
G1 X144.318 Y121.972 E-.22324
G1 X144.745 Y121.971 E-.1623
G1 X144.916 Y121.994 E-.06568
G1 X145.087 Y122.017 E-.06568
G1 X145.259 Y122.04 E-.06568
G1 X145.113 Y122.115 E-.06246
G1 X144.967 Y122.191 E-.06246
G1 X144.844 Y122.254 E-.05249
; WIPE_END
G1 E-.04 F1800
G1 X143.899 Y123.79 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.525992
G1 F3600
G1 X143.904 Y123.734 E.00139
; LINE_WIDTH: 0.515182
G1 X143.898 Y123.421 E.00749
; LINE_WIDTH: 0.482587
G1 X143.892 Y123.108 E.00699
; LINE_WIDTH: 0.449992
G3 X143.9 Y121.547 I81.332 J-.367 E.03237
G1 X146.957 Y121.544 E.06342
G1 X146.957 Y122.052 E.01054
G1 X146.957 Y122.84 E.01633
G1 X146.53 Y122.603 E.01013
G1 X145.878 Y122.459 E.01385
G1 X145.345 Y122.526 E.01115
G1 X144.838 Y122.742 E.01143
G1 X144.448 Y123.02 E.00993
G1 X144.243 Y123.244 E.0063
; LINE_WIDTH: 0.487992
G1 X144.071 Y123.517 E.00729
; LINE_WIDTH: 0.525992
G1 X143.931 Y123.739 E.00643
; WIPE_START
G1 X143.904 Y123.734 E-.01032
G1 X143.898 Y123.421 E-.11889
G1 X143.892 Y123.108 E-.11889
G1 X143.899 Y121.761 E-.5119
; WIPE_END
G1 E-.04 F1800
G1 X146.45 Y122.052 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.616552
G1 F3600
G1 X146.259 Y122.036 E.00553
; LINE_WIDTH: 0.582626
G1 X146.068 Y122.019 E.00521
; LINE_WIDTH: 0.548699
G1 X145.878 Y122.002 E.00489
; LINE_WIDTH: 0.551682
G1 X145.568 Y122.021 E.00797
; LINE_WIDTH: 0.588592
G1 X145.259 Y122.04 E.00853
; WIPE_START
G1 X145.568 Y122.021 E-.19726
G1 X145.878 Y122.002 E-.19727
G1 X146.068 Y122.019 E-.12182
G1 X146.259 Y122.036 E-.12182
G1 X146.45 Y122.052 E-.12182
; WIPE_END
G1 E-.04 F1800
G1 X142.654 Y125.411 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.538422
G1 F3600
G2 X143.541 Y124.708 I-.938 J-2.093 E.02865
G1 X143.805 Y124.188 E.01461
G2 X143.757 Y125.411 I8.3 J.934 E.03069
G1 X142.714 Y125.411 E.02614
; WIPE_START
G1 X142.975 Y125.246 E-.11727
G1 X143.28 Y125.006 E-.14734
G1 X143.541 Y124.708 E-.15048
G1 X143.805 Y124.188 E-.22154
G1 X143.78 Y124.512 E-.12338
; WIPE_END
G1 E-.04 F1800
G1 X136.147 Y124.49 Z3 F30000
G1 X117.193 Y124.436 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.571 Y124.766 E.01041
G1 X118.222 Y125.15 E.01567
G1 X118.862 Y125.391 E.01419
G1 X119.386 Y125.481 E.01101
G1 X118.855 Y125.461 E.01101
G1 X118.567 Y125.502 E.00604
G1 X118.001 Y125.69 E.01237
G1 X117.577 Y125.997 E.01086
G2 X117.193 Y126.484 I1.163 J1.311 E.01292
G1 X117.193 Y124.496 E.04124
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522312
G1 F3600
G2 X117.716 Y125.363 I-.027 J.052 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.15201
G1 X117.592 Y125.363 E-.15199
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.744 Y130.424 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.514002
G1 F3600
G1 X116.309 Y130.117 E.01536
G1 X116.557 Y129.9 E.00787
G1 X116.872 Y129.493 E.0123
G1 X116.871 Y130.424 E.02224
G1 X115.804 Y130.424 E.02548
; WIPE_START
G1 X116.309 Y130.117 E-.22475
G1 X116.557 Y129.9 E-.12521
G1 X116.872 Y129.493 E-.19575
G1 X116.871 Y130.057 E-.21429
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.5 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.517772
G1 F3600
G1 X113.039 Y129.994 E.01547
G1 X113.3 Y130.196 E.00794
G1 X113.761 Y130.423 E.01235
G3 X112.627 Y130.419 I-.272 J-108.372 E.02726
G1 X112.627 Y129.56 E.02067
; WIPE_START
G1 X113.039 Y129.994 E-.22725
G1 X113.3 Y130.196 E-.1254
G1 X113.761 Y130.423 E-.19511
G1 X113.202 Y130.421 E-.21223
; WIPE_END
G1 E-.04 F1800
G1 X111.088 Y123.087 Z3 F30000
G1 X110.778 Y122.009 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.531812
G1 F3600
G1 X110.936 Y121.988 E.00394
; LINE_WIDTH: 0.489999
G1 X111.093 Y121.967 E.00361
; LINE_WIDTH: 0.448186
G1 X111.251 Y121.946 E.00329
; LINE_WIDTH: 0.406372
G1 X111.904 Y121.946 E.01215
G1 X111.904 Y122.477 E.00987
G1 X111.521 Y122.263 E.00817
; LINE_WIDTH: 0.448186
G1 X111.273 Y122.178 E.00541
; LINE_WIDTH: 0.489999
G1 X111.025 Y122.094 E.00594
; LINE_WIDTH: 0.531812
G1 X110.834 Y122.028 E.00499
; WIPE_START
G1 X110.936 Y121.988 E-.04137
G1 X111.093 Y121.967 E-.06052
G1 X111.251 Y121.946 E-.06051
G1 X111.904 Y121.946 E-.24806
G1 X111.904 Y122.477 E-.20156
G1 X111.564 Y122.287 E-.14798
; WIPE_END
G1 E-.04 F1800
G1 X109.043 Y122.84 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X109.043 Y121.544 E.0269
G1 X109.714 Y121.544 E.01392
G3 X112.307 Y121.56 I.996 J48.301 E.05379
G1 X112.307 Y123.487 E.03998
G1 X111.966 Y123.038 E.01169
G1 X111.467 Y122.676 E.01279
G2 X110.764 Y122.474 I-.954 J2 E.01525
G1 X110.178 Y122.457 E.01216
G1 X109.663 Y122.547 E.01085
G1 X109.224 Y122.718 E.00976
G1 X109.093 Y122.807 E.00329
; WIPE_START
G1 X109.043 Y121.544 E-.4804
G1 X109.714 Y121.544 E-.25497
G1 X109.779 Y121.544 E-.02464
; WIPE_END
G1 E-.04 F1800
G1 X110.778 Y122.009 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.531812
G1 F3600
G1 X110.178 Y122 E.01484
; LINE_WIDTH: 0.549126
G1 X109.969 Y122.017 E.00537
; LINE_WIDTH: 0.583439
G1 X109.76 Y122.035 E.00572
; LINE_WIDTH: 0.617752
G1 X109.551 Y122.052 E.00607
; WIPE_START
G1 X109.76 Y122.035 E-.12971
G1 X109.969 Y122.017 E-.1297
G1 X110.178 Y122 E-.1297
G1 X110.778 Y122.009 E-.37088
; WIPE_END
G1 E-.04 F1800
G1 X108.717 Y123.881 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.619 Y123.881 E.00203
G1 X108.619 Y121.119 E.05728
G1 X112.264 Y121.12 E.07562
G1 X112.49 Y121.157 E.00475
G1 X112.64 Y121.278 E.00399
G1 X112.731 Y121.518 E.00533
G1 X112.731 Y123.286 E.03668
; LINE_WIDTH: 0.463442
G1 X112.724 Y123.97 E.01462
; LINE_WIDTH: 0.491152
G1 X112.71 Y124.22 E.0057
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00604
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.550162
G1 X112.741 Y128.751 E.01161
G1 X112.783 Y128.837 E.00246
; LINE_WIDTH: 0.518332
G1 X112.826 Y128.923 E.00231
; LINE_WIDTH: 0.486502
G1 X113.103 Y129.393 E.0123
; LINE_WIDTH: 0.449992
G1 X113.521 Y129.795 E.01203
G1 X114.012 Y130.032 E.01131
G1 X114.522 Y130.119 E.01074
G1 X115.253 Y130.089 E.01518
G1 X115.763 Y129.923 E.01111
G1 X116.207 Y129.608 E.0113
G1 X116.56 Y129.136 E.01221
; LINE_WIDTH: 0.493892
G1 X116.668 Y128.9 E.00596
; LINE_WIDTH: 0.537792
G1 X116.777 Y128.663 E.00652
G1 X116.803 Y128.301 E.0091
; LINE_WIDTH: 0.526932
G2 X116.788 Y126.956 I-11.936 J-.541 E.03296
; LINE_WIDTH: 0.488462
G1 X116.769 Y126.585 E.00841
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.06999
G1 X116.863 Y123.385 E.00411
G1 X117.252 Y123.908 E.01352
G1 X117.798 Y124.407 E.01535
G1 X118.382 Y124.757 E.01411
G1 X118.945 Y124.975 E.01253
G2 X119.95 Y125.119 I1.028 J-3.583 E.02111
G1 X141.943 Y125.115 E.45619
G1 X142.48 Y124.983 E.01148
G2 X143.137 Y124.47 I-.917 J-1.85 E.01742
G1 X143.373 Y124.044 E.01009
G1 X143.467 Y123.531 E.01083
G1 X143.469 Y121.574 E.0406
G1 X143.518 Y121.33 E.00515
G1 X143.619 Y121.215 E.00318
G1 X143.842 Y121.123 E.005
G1 X147.381 Y121.12 E.07342
G1 X147.381 Y122.052 E.01934
G1 X147.381 Y123.881 E.03792
G1 X147.282 Y123.881 E.00206
G1 X147.076 Y123.522 E.00857
G2 X146.414 Y123.011 I-1.565 J1.342 E.01748
G1 X145.878 Y122.883 E.01142
G1 X145.418 Y122.943 E.00963
G1 X144.917 Y123.182 E.01151
G1 X144.557 Y123.53 E.01038
G1 X144.343 Y123.93 E.00942
G1 X144.255 Y124.255 E.00698
G2 X144.208 Y125.56 I25.032 J1.545 E.02708
G1 X144.089 Y125.78 E.00518
G1 X143.848 Y125.879 E.00541
G1 X118.853 Y125.885 E.51846
G1 X118.318 Y126.017 E.01143
G1 X118.119 Y126.117 E.00461
G1 X117.69 Y126.493 E.01184
; LINE_WIDTH: 0.452132
G1 X117.415 Y127.003 E.01208
; LINE_WIDTH: 0.485382
G1 X117.356 Y127.251 E.00573
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.499 E.00614
; LINE_WIDTH: 0.537792
G1 X117.285 Y128.708 E.03028
G1 X117.307 Y128.994 E.00719
; LINE_WIDTH: 0.493892
G1 X117.329 Y129.281 E.00657
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.439 E.02402
G3 X117.189 Y130.778 I-.451 J.014 E.00782
G1 X116.957 Y130.88 E.00526
G1 X112.957 Y130.881 E.08297
G3 X112.368 Y130.817 I-.155 J-1.322 E.01239
G1 X112.215 Y130.661 E.00454
G1 X112.169 Y130.478 E.00391
G1 X112.169 Y129.425 E.02183
; LINE_WIDTH: 0.484009
G1 X112.186 Y129.221 E.00459
; LINE_WIDTH: 0.518026
G1 X112.203 Y129.017 E.00493
; LINE_WIDTH: 0.552042
G2 X112.203 Y128.301 I-3.084 J-.36 E.01848
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09235
; LINE_WIDTH: 0.527152
G1 X112.195 Y124.346 E.00303
G1 X112.108 Y124.093 E.00658
; LINE_WIDTH: 0.488572
G1 X112.021 Y123.839 E.00607
; LINE_WIDTH: 0.449992
G1 X111.699 Y123.368 E.01184
G1 X111.243 Y123.042 E.01163
M73 P82 R2
G1 X110.751 Y122.898 E.01062
G1 X110.196 Y122.881 E.01153
G2 X109.461 Y123.07 I.169 J2.185 E.01581
G1 X109.01 Y123.42 E.01185
G1 X108.749 Y123.83 E.01009
M204 S250
G1 X109.085 Y124.106 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.028 Y124.29 E.00371
G1 X108.209 Y124.29 E.01577
G1 X108.209 Y120.71 E.06901
G1 X112.264 Y120.71 E.07816
G1 X112.646 Y120.771 E.00745
G1 X112.881 Y120.919 E.00536
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.195 Y128.683 E.00745
G1 X113.366 Y129.062 E.00802
G1 X113.67 Y129.399 E.00875
G1 X114.033 Y129.61 E.00808
G1 X114.514 Y129.709 E.00948
G1 X115.096 Y129.701 E.01122
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00876
G1 X116.321 Y128.621 E.0088
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430572
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00766
; LINE_WIDTH: 0.437832
G1 X116.786 Y122.087 E.00753
G1 X116.948 Y122.634 E.01148
; LINE_WIDTH: 0.419992
G1 X117.196 Y123.147 E.01099
G1 X117.533 Y123.61 E.01105
G1 X118.016 Y124.061 E.01275
G1 X118.535 Y124.377 E.01171
G2 X119.95 Y124.71 I1.526 J-3.317 E.02819
G1 X141.943 Y124.706 E.42393
G1 X142.366 Y124.59 E.00845
G1 X142.737 Y124.316 E.0089
G1 X142.967 Y123.953 E.00829
G1 X143.058 Y123.53 E.00833
G1 X143.06 Y121.573 E.03773
G1 X143.141 Y121.156 E.00819
G1 X143.282 Y120.953 E.00477
G1 X143.51 Y120.79 E.0054
G1 X143.787 Y120.714 E.00553
G1 X147.791 Y120.71 E.07717
G1 X147.791 Y122.052 E.02587
G1 X147.791 Y124.29 E.04313
G1 X146.968 Y124.29 E.01585
G1 X146.935 Y124.109 E.00354
G1 X146.725 Y123.732 E.00833
G1 X146.369 Y123.439 E.00888
G1 X145.933 Y123.3 E.00883
G1 X145.495 Y123.345 E.00848
G1 X145.115 Y123.541 E.00825
G1 X144.86 Y123.805 E.00708
G1 X144.715 Y124.1 E.00633
G1 X144.639 Y124.469 E.00726
G1 X144.635 Y125.44 E.01872
G1 X144.548 Y125.859 E.00824
G1 X144.362 Y126.095 E.0058
G1 X144.095 Y126.248 E.00592
G1 X143.888 Y126.288 E.00407
G1 X118.855 Y126.294 E.48251
G1 X118.432 Y126.41 E.00845
G1 X118.083 Y126.66 E.00828
G1 X117.845 Y127.014 E.00823
G1 X117.74 Y127.499 E.00956
G1 X117.736 Y130.44 E.05668
G1 X117.648 Y130.863 E.00834
G1 X117.517 Y131.046 E.00434
G1 X117.287 Y131.211 E.00545
G1 X116.972 Y131.29 E.00627
G1 X112.972 Y131.29 E.0771
G3 X112.276 Y131.237 I-.163 J-2.485 E.0135
G1 X112.041 Y131.099 E.00526
G1 X111.849 Y130.856 E.00597
G1 X111.76 Y130.493 E.00721
G1 X111.76 Y124.47 E.1161
G1 X111.693 Y124.109 E.00706
G1 X111.487 Y123.738 E.00818
G1 X111.163 Y123.46 E.00823
G1 X110.739 Y123.307 E.00868
G1 X110.184 Y123.291 E.01071
G1 X109.757 Y123.381 E.00842
G1 X109.392 Y123.61 E.00829
G1 X109.133 Y123.949 E.00823
G1 X109.103 Y124.049 E.00201
; WIPE_START
M204 S10000
G1 X109.028 Y124.29 E-.09588
G1 X108.209 Y124.29 E-.31093
G1 X108.209 Y123.361 E-.35319
; WIPE_END
G1 E-.04
G1 X115.841 Y123.452 Z3 F30000
G1 X143.899 Y123.79 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.525992
G1 F3600
G1 X143.805 Y124.188 E.01001
; WIPE_START
G1 X143.899 Y123.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.284 Y124.315 Z3 F30000
G1 X119.386 Y125.481 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.410152
G1 F3600
G1 X119.891 Y125.501 E.0095
; LINE_WIDTH: 0.368972
G1 X119.95 Y125.502 E.00099
; LINE_WIDTH: 0.367192
G1 X121.943 Y125.502 E.03327
; LINE_WIDTH: 0.367012
G1 X125.943 Y125.501 E.06674
; LINE_WIDTH: 0.366842
G1 X129.943 Y125.5 E.06671
; LINE_WIDTH: 0.366662
G1 X133.943 Y125.499 E.06667
; LINE_WIDTH: 0.366492
G1 X137.943 Y125.498 E.06664
; LINE_WIDTH: 0.366312
G1 X141.943 Y125.497 E.0666
; LINE_WIDTH: 0.381212
G1 X142.115 Y125.49 E.00299
; WIPE_START
G1 X141.943 Y125.497 E-.06546
G1 X140.115 Y125.498 E-.69454
; WIPE_END
G1 E-.04 F1800
G1 X132.622 Y126.948 Z3 F30000
G1 X114.323 Y130.49 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.381812
G1 F3600
G1 X115.107 Y130.496 E.01365
; LINE_WIDTH: 0.386332
G1 X115.266 Y130.488 E.00281
; WIPE_START
G1 X115.107 Y130.496 E-.12828
G1 X114.323 Y130.49 E-.63172
; WIPE_END
G1 E-.04 F1800
G1 X121.853 Y129.242 Z3 F30000
G1 X151.709 Y124.29 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.709 Y120.71 E.06901
G1 X152.539 Y120.71 E.016
G1 X152.539 Y121.125 E.008
G1 X152.539 Y124.29 E.06101
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.769 Y124.29 E.01484
; WIPE_START
M204 S10000
G1 X151.736 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X152.124 Y121.125 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.461592
G1 F3600
G1 X152.124 Y123.875 E.0586
; CHANGE_LAYER
; Z_HEIGHT: 2.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X152.124 Y121.875 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/45
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3 I-.061 J-1.215 P1  F30000
G1 X104.297 Y124.29 Z3
G1 Z2.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X103.465 Y124.29 E.01605
G1 X103.465 Y120.71 E.06901
G1 X104.297 Y120.71 E.01605
G1 X104.297 Y121.126 E.00803
G1 X104.297 Y124.23 E.05982
; WIPE_START
M204 S10000
G1 X103.465 Y124.29 E-.31728
G1 X103.465 Y123.125 E-.44272
; WIPE_END
G1 E-.04
G1 X103.881 Y121.126 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.464312
G1 F3600
G1 X103.881 Y123.874 E.05891
; WIPE_START
G1 X103.881 Y121.874 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.512 Y122.009 Z3.12 F30000
G1 X144.317 Y122.588 Z3.12
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.450472
G1 F3600
G1 X144.317 Y121.968 E.01288
G1 X144.53 Y121.968 E.0044
; LINE_WIDTH: 0.497172
G1 X144.773 Y121.992 E.00564
; LINE_WIDTH: 0.543872
G1 X145.017 Y122.015 E.0062
; LINE_WIDTH: 0.590572
G1 X145.26 Y122.038 E.00676
G1 X145.05 Y122.148 E.00655
; LINE_WIDTH: 0.543872
G1 X144.84 Y122.258 E.00601
; LINE_WIDTH: 0.497172
G1 X144.629 Y122.368 E.00547
; LINE_WIDTH: 0.450472
G1 X144.366 Y122.554 E.00669
; WIPE_START
G1 X144.317 Y121.968 E-.22325
G1 X144.53 Y121.968 E-.08059
G1 X144.773 Y121.992 E-.09296
G1 X145.017 Y122.015 E-.09296
G1 X145.26 Y122.038 E-.09296
G1 X145.05 Y122.148 E-.09016
G1 X144.847 Y122.254 E-.08713
; WIPE_END
G1 E-.04 F1800
G1 X143.899 Y123.788 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.526592
G1 F3600
G1 X143.905 Y123.734 E.00133
; LINE_WIDTH: 0.516182
G1 X143.898 Y123.408 E.00782
; LINE_WIDTH: 0.483087
G1 X143.892 Y123.082 E.00729
; LINE_WIDTH: 0.449992
G3 X143.897 Y121.547 I146.344 J-.284 E.03183
G3 X146.964 Y121.544 I2.435 J759.246 E.06362
G1 X146.964 Y122.053 E.01056
G1 X146.964 Y122.843 E.01638
G1 X146.536 Y122.605 E.01015
G1 X145.879 Y122.459 E.01397
G1 X145.346 Y122.525 E.01114
G1 X144.829 Y122.743 E.01163
G2 X144.258 Y123.227 I.925 J1.668 E.01563
; LINE_WIDTH: 0.488292
G1 X144.079 Y123.507 E.00752
; LINE_WIDTH: 0.526592
G1 X143.932 Y123.737 E.00668
; WIPE_START
G1 X143.905 Y123.734 E-.01039
G1 X143.898 Y123.408 E-.12389
G1 X143.892 Y123.082 E-.12389
G1 X143.896 Y121.761 E-.50183
; WIPE_END
G1 E-.04 F1800
G1 X146.455 Y122.053 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.619592
G1 F3600
G1 X146.263 Y122.036 E.0056
; LINE_WIDTH: 0.585219
G1 X146.071 Y122.018 E.00527
; LINE_WIDTH: 0.550846
G1 X145.879 Y122.001 E.00495
; LINE_WIDTH: 0.553522
G1 X145.569 Y122.02 E.008
; LINE_WIDTH: 0.590572
G1 X145.26 Y122.038 E.00856
; WIPE_START
G1 X145.569 Y122.02 E-.19653
G1 X145.879 Y122.001 E-.19653
G1 X146.071 Y122.018 E-.12231
G1 X146.263 Y122.036 E-.12231
G1 X146.455 Y122.053 E-.12231
; WIPE_END
G1 E-.04 F1800
G1 X142.653 Y125.411 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.537182
G1 F3600
G2 X143.516 Y124.739 I-.888 J-2.03 E.02763
G1 X143.805 Y124.188 E.01556
G2 X143.758 Y125.411 I9.006 J.957 E.03062
G1 X142.713 Y125.411 E.02613
; WIPE_START
G1 X142.964 Y125.254 E-.11261
G1 X143.251 Y125.034 E-.1375
G1 X143.516 Y124.739 E-.15037
G1 X143.805 Y124.188 E-.23651
G1 X143.781 Y124.511 E-.12301
; WIPE_END
G1 E-.04 F1800
G1 X136.149 Y124.491 Z3.12 F30000
G1 X117.193 Y124.443 Z3.12
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.489 Y124.703 E.00816
G1 X118.223 Y125.15 E.01784
M73 P83 R2
G1 X118.864 Y125.391 E.01419
G1 X119.386 Y125.481 E.01099
G1 X118.856 Y125.461 E.01099
G1 X118.569 Y125.502 E.00603
G1 X117.988 Y125.697 E.01271
G1 X117.577 Y125.997 E.01055
G2 X117.193 Y126.484 I1.162 J1.31 E.01292
G1 X117.193 Y124.503 E.0411
G1 X117.686 Y125.308 F30000
; LINE_WIDTH: 0.523632
G1 F3600
G2 X117.717 Y125.361 I-.027 J.052 E.00733
; WIPE_START
G1 X117.686 Y125.415 E-.15201
G1 X117.623 Y125.415 E-.15201
G1 X117.592 Y125.361 E-.152
G1 X117.623 Y125.308 E-.15201
G1 X117.686 Y125.308 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.744 Y130.424 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.514012
G1 F3600
G1 X116.309 Y130.117 E.01535
G1 X116.557 Y129.901 E.00786
G1 X116.872 Y129.493 E.01231
G1 X116.871 Y130.424 E.02224
G1 X115.804 Y130.424 E.02548
; WIPE_START
G1 X116.309 Y130.117 E-.22462
G1 X116.557 Y129.901 E-.12511
G1 X116.872 Y129.493 E-.19597
G1 X116.871 Y130.057 E-.21431
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.5 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.517762
G1 F3600
G1 X113.039 Y129.994 E.01547
G2 X113.712 Y130.401 I1.424 J-1.594 E.01904
; LINE_WIDTH: 0.504942
G1 X113.879 Y130.435 E.00397
; LINE_WIDTH: 0.465957
G1 X114.045 Y130.468 E.00365
; LINE_WIDTH: 0.472367
G1 X113.661 Y130.445 E.00841
; LINE_WIDTH: 0.517762
G2 X112.627 Y130.419 I-.755 J9.532 E.02488
G1 X112.627 Y129.56 E.02067
; WIPE_START
G1 X113.039 Y129.994 E-.22729
G1 X113.327 Y130.211 E-.13714
G1 X113.712 Y130.401 E-.16319
G1 X113.879 Y130.435 E-.06447
G1 X114.045 Y130.468 E-.06446
G1 X113.773 Y130.452 E-.10346
; WIPE_END
G1 E-.04 F1800
G1 X111.22 Y123.259 Z3.12 F30000
G1 X110.776 Y122.009 Z3.12
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.531512
G1 F3600
G1 X110.934 Y121.988 E.00393
; LINE_WIDTH: 0.489796
G1 X111.091 Y121.967 E.00361
; LINE_WIDTH: 0.448079
G1 X111.249 Y121.946 E.00329
; LINE_WIDTH: 0.406362
G1 X111.904 Y121.946 E.01219
G1 X111.904 Y122.477 E.00987
G1 X111.52 Y122.263 E.00818
; LINE_WIDTH: 0.448079
G1 X111.272 Y122.178 E.00541
; LINE_WIDTH: 0.489796
G1 X111.024 Y122.093 E.00595
; LINE_WIDTH: 0.531512
G1 X110.833 Y122.028 E.005
; WIPE_START
G1 X110.934 Y121.988 E-.04131
G1 X111.091 Y121.967 E-.06047
G1 X111.249 Y121.946 E-.06047
G1 X111.904 Y121.946 E-.24889
G1 X111.904 Y122.477 E-.20157
G1 X111.565 Y122.288 E-.1473
; WIPE_END
G1 E-.04 F1800
G1 X109.036 Y122.845 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X109.036 Y121.544 E.02699
G1 X109.714 Y121.544 E.01406
G3 X112.307 Y121.56 I.996 J48.483 E.05378
G1 X112.307 Y123.487 E.03998
G1 X111.966 Y123.038 E.01169
G1 X111.467 Y122.676 E.01279
G2 X110.762 Y122.474 I-.956 J2.005 E.01528
G1 X110.178 Y122.457 E.01212
G1 X109.657 Y122.549 E.01097
G1 X109.224 Y122.718 E.00964
G1 X109.086 Y122.811 E.00346
; WIPE_START
G1 X109.036 Y121.544 E-.48212
G1 X109.714 Y121.544 E-.25755
G1 X109.767 Y121.544 E-.02033
; WIPE_END
G1 E-.04 F1800
G1 X110.776 Y122.009 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.531512
G1 F3600
G1 X110.178 Y122 E.01478
; LINE_WIDTH: 0.549579
G1 X109.967 Y122.018 E.00542
; LINE_WIDTH: 0.584346
G1 X109.756 Y122.035 E.00578
; LINE_WIDTH: 0.619112
G1 X109.545 Y122.052 E.00614
; WIPE_START
G1 X109.756 Y122.035 E-.13053
G1 X109.967 Y122.018 E-.13053
G1 X110.178 Y122 E-.13053
G1 X110.776 Y122.009 E-.36842
; WIPE_END
G1 E-.04 F1800
G1 X108.717 Y123.881 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.612 Y123.881 E.00217
G1 X108.612 Y121.119 E.05728
G1 X112.265 Y121.12 E.07578
G1 X112.49 Y121.156 E.00473
G1 X112.64 Y121.278 E.00401
G1 X112.731 Y121.518 E.00532
G1 X112.731 Y123.286 E.03668
; LINE_WIDTH: 0.463432
G1 X112.724 Y123.97 E.01462
; LINE_WIDTH: 0.491147
G1 X112.71 Y124.22 E.0057
; LINE_WIDTH: 0.518862
G1 X112.696 Y124.47 E.00604
G1 X112.696 Y128.301 E.09236
; LINE_WIDTH: 0.550202
G1 X112.741 Y128.751 E.01161
G1 X112.783 Y128.837 E.00246
; LINE_WIDTH: 0.518332
G1 X112.826 Y128.923 E.00231
; LINE_WIDTH: 0.486462
G1 X113.103 Y129.394 E.0123
; LINE_WIDTH: 0.449992
G1 X113.537 Y129.803 E.01238
G1 X114.106 Y130.06 E.01295
G1 X114.559 Y130.119 E.00947
G1 X115.253 Y130.089 E.01442
G1 X115.763 Y129.923 E.01111
G1 X116.207 Y129.608 E.01129
G1 X116.56 Y129.136 E.01221
; LINE_WIDTH: 0.493877
G1 X116.668 Y128.9 E.00597
; LINE_WIDTH: 0.537762
G1 X116.777 Y128.663 E.00653
G1 X116.803 Y128.301 E.00909
; LINE_WIDTH: 0.526952
G2 X116.788 Y126.956 I-11.941 J-.541 E.03297
; LINE_WIDTH: 0.488472
G1 X116.769 Y126.585 E.00842
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.211 E.06998
G1 X116.863 Y123.386 E.00412
G1 X117.246 Y123.902 E.01333
G1 X117.72 Y124.347 E.0135
G1 X118.383 Y124.757 E.01615
G1 X118.945 Y124.975 E.01251
G2 X119.95 Y125.119 I1.027 J-3.581 E.02111
G1 X141.942 Y125.115 E.45616
G1 X142.48 Y124.983 E.01149
G2 X143.116 Y124.496 I-.855 J-1.774 E.01673
G1 X143.373 Y124.044 E.01079
G1 X143.467 Y123.531 E.01083
G3 X143.497 Y121.37 I31.458 J-.639 E.04483
G1 X143.637 Y121.194 E.00467
G1 X143.86 Y121.12 E.00488
G1 X147.388 Y121.119 E.07318
G1 X147.388 Y122.053 E.01936
G1 X147.388 Y123.881 E.03792
G1 X147.282 Y123.881 E.00221
G1 X147.055 Y123.497 E.00925
G2 X146.419 Y123.013 I-1.475 J1.281 E.01669
G1 X145.879 Y122.883 E.01153
G1 X145.419 Y122.943 E.00962
G1 X144.949 Y123.16 E.01074
G1 X144.567 Y123.518 E.01086
G1 X144.342 Y123.931 E.00975
G1 X144.255 Y124.255 E.00696
G2 X144.208 Y125.56 I30.426 J1.738 E.02708
G1 X144.089 Y125.78 E.00518
G1 X143.851 Y125.879 E.00536
G1 X118.853 Y125.885 E.51851
G1 X118.318 Y126.017 E.01142
G1 X118.12 Y126.117 E.00461
G1 X117.69 Y126.493 E.01185
; LINE_WIDTH: 0.452072
G1 X117.415 Y127.003 E.01207
; LINE_WIDTH: 0.485352
G1 X117.356 Y127.251 E.00573
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.499 E.00614
; LINE_WIDTH: 0.537762
G1 X117.285 Y128.708 E.03027
G1 X117.307 Y128.994 E.0072
; LINE_WIDTH: 0.493877
G1 X117.329 Y129.281 E.00658
; LINE_WIDTH: 0.449992
G1 X117.327 Y130.439 E.02402
G3 X117.19 Y130.777 I-.449 J.015 E.0078
G1 X116.957 Y130.88 E.00527
G1 X112.957 Y130.881 E.08297
G3 X112.416 Y130.847 I-.042 J-3.675 E.01126
G1 X112.236 Y130.7 E.00482
G1 X112.169 Y130.468 E.005
G1 X112.169 Y129.426 E.02162
; LINE_WIDTH: 0.484019
G1 X112.186 Y129.222 E.00459
; LINE_WIDTH: 0.518046
G1 X112.203 Y129.018 E.00493
; LINE_WIDTH: 0.552072
G2 X112.203 Y128.301 I-3.086 J-.36 E.01849
; LINE_WIDTH: 0.518792
G1 X112.203 Y124.47 E.09235
; LINE_WIDTH: 0.527142
G1 X112.195 Y124.346 E.00303
G1 X112.108 Y124.093 E.00658
; LINE_WIDTH: 0.488567
G1 X112.022 Y123.839 E.00607
; LINE_WIDTH: 0.449992
G1 X111.699 Y123.368 E.01184
G1 X111.242 Y123.042 E.01163
G1 X110.75 Y122.898 E.01064
G1 X110.196 Y122.881 E.0115
G2 X109.461 Y123.07 I.164 J2.162 E.01581
G1 X109.01 Y123.42 E.01184
G1 X108.749 Y123.83 E.01009
M204 S250
G1 X109.079 Y124.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.028 Y124.29 E.00331
G1 X108.203 Y124.29 E.0159
G1 X108.203 Y120.71 E.06901
G1 X112.265 Y120.71 E.07831
G1 X112.646 Y120.771 E.00743
G1 X112.881 Y120.919 E.00536
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00724
G1 X113.14 Y128.301 E.13097
G1 X113.195 Y128.683 E.00745
G1 X113.366 Y129.063 E.00802
G1 X113.67 Y129.399 E.00874
G1 X114.106 Y129.635 E.00955
G1 X114.549 Y129.71 E.00867
G1 X115.097 Y129.701 E.01055
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.386 E.00801
G1 X116.145 Y129.043 E.00875
G1 X116.321 Y128.621 E.00882
G1 X116.36 Y128.301 E.00621
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430592
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437832
G1 X116.786 Y122.087 E.00753
G1 X116.948 Y122.634 E.01148
; LINE_WIDTH: 0.419992
G1 X117.196 Y123.147 E.01098
G1 X117.531 Y123.609 E.01099
G1 X117.944 Y124.005 E.01103
G1 X118.536 Y124.378 E.0135
G2 X119.95 Y124.71 I1.525 J-3.317 E.02817
G1 X141.942 Y124.706 E.4239
G1 X142.366 Y124.59 E.00847
G1 X142.718 Y124.338 E.00835
G1 X142.966 Y123.955 E.00879
G1 X143.058 Y123.53 E.00837
G1 X143.06 Y121.546 E.03824
G1 X143.109 Y121.226 E.00625
G1 X143.308 Y120.942 E.00668
G1 X143.528 Y120.794 E.00511
G1 X143.832 Y120.71 E.00608
G1 X147.797 Y120.71 E.07643
G1 X147.797 Y122.053 E.02588
G1 X147.797 Y124.29 E.04313
G1 X146.968 Y124.29 E.01598
G1 X146.935 Y124.109 E.00355
G1 X146.706 Y123.711 E.00886
G1 X146.372 Y123.439 E.00831
G1 X145.933 Y123.3 E.00887
G1 X145.496 Y123.345 E.00848
G1 X145.141 Y123.521 E.00763
G1 X144.865 Y123.799 E.00755
G1 X144.714 Y124.102 E.00652
G1 X144.639 Y124.469 E.00723
G1 X144.635 Y125.44 E.01872
G1 X144.547 Y125.859 E.00825
G1 X144.362 Y126.095 E.00579
G1 X144.095 Y126.248 E.00592
G1 X143.891 Y126.288 E.004
G1 X118.857 Y126.294 E.48254
G1 X118.433 Y126.409 E.00847
G1 X118.083 Y126.66 E.00829
G1 X117.845 Y127.014 E.00823
G1 X117.74 Y127.499 E.00957
G1 X117.736 Y130.44 E.05668
G1 X117.648 Y130.863 E.00834
G1 X117.517 Y131.046 E.00434
G1 X117.284 Y131.213 E.00552
G1 X116.972 Y131.29 E.00621
G1 X114.972 Y131.29 E.03855
G3 X112.439 Y131.267 I-.852 J-45.866 E.04882
G1 X112.162 Y131.173 E.00564
G3 X111.76 Y130.49 I.517 J-.764 E.0158
G1 X111.76 Y124.47 E.11604
G1 X111.693 Y124.11 E.00706
G1 X111.487 Y123.738 E.00819
G1 X111.163 Y123.46 E.00823
G1 X110.738 Y123.307 E.00871
G1 X110.184 Y123.291 E.01069
G1 X109.756 Y123.381 E.00842
G1 X109.392 Y123.61 E.00829
G1 X109.134 Y123.949 E.00823
G1 X109.096 Y124.069 E.00241
; WIPE_START
M204 S10000
G1 X109.028 Y124.29 E-.0881
G1 X108.203 Y124.29 E-.31352
G1 X108.203 Y123.347 E-.35839
; WIPE_END
G1 E-.04
G1 X115.834 Y123.441 Z3.12 F30000
G1 X143.899 Y123.788 Z3.12
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.526592
G1 F3600
G1 X143.805 Y124.188 E.01008
; WIPE_START
G1 X143.899 Y123.788 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.285 Y124.313 Z3.12 F30000
G1 X119.386 Y125.481 Z3.12
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.409992
G1 F3600
G1 X119.891 Y125.501 E.00949
; LINE_WIDTH: 0.368812
G1 X119.95 Y125.502 E.00099
; LINE_WIDTH: 0.367092
G1 X121.942 Y125.502 E.03325
; LINE_WIDTH: 0.366972
G1 X123.942 Y125.501 E.03337
; LINE_WIDTH: 0.366862
G1 X125.942 Y125.501 E.03336
; LINE_WIDTH: 0.366752
G1 X127.942 Y125.5 E.03334
; LINE_WIDTH: 0.366642
G1 X129.942 Y125.5 E.03333
; LINE_WIDTH: 0.366532
G1 X131.942 Y125.499 E.03332
; LINE_WIDTH: 0.366422
G1 X133.942 Y125.499 E.03331
; LINE_WIDTH: 0.366312
G1 X135.942 Y125.498 E.0333
; LINE_WIDTH: 0.366202
G1 X137.942 Y125.498 E.03329
; LINE_WIDTH: 0.366092
G1 X139.942 Y125.498 E.03328
; LINE_WIDTH: 0.365982
G1 X141.942 Y125.497 E.03327
; LINE_WIDTH: 0.380872
G1 X142.114 Y125.49 E.00299
; WIPE_START
G1 X141.942 Y125.497 E-.06545
G1 X140.114 Y125.498 E-.69455
; WIPE_END
G1 E-.04 F1800
G1 X132.617 Y126.927 Z3.12 F30000
G1 X114.045 Y130.468 Z3.12
G1 Z2.72
G1 E.8 F1800
; LINE_WIDTH: 0.426972
G1 F3600
G1 X114.297 Y130.484 E.00496
; LINE_WIDTH: 0.394912
G1 X114.549 Y130.5 E.00456
; LINE_WIDTH: 0.371432
G1 X115.109 Y130.496 E.00946
; LINE_WIDTH: 0.386312
G1 X115.266 Y130.488 E.00277
; WIPE_START
G1 X115.109 Y130.496 E-.0978
G1 X114.549 Y130.5 E-.34795
G1 X114.297 Y130.484 E-.15713
G1 X114.045 Y130.468 E-.15713
; WIPE_END
G1 E-.04 F1800
G1 X121.577 Y129.232 Z3.12 F30000
G1 X151.703 Y124.29 Z3.12
G1 Z2.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.703 Y120.71 E.06901
G1 X152.535 Y120.71 E.01605
G1 X152.535 Y121.126 E.00803
G1 X152.535 Y124.29 E.06098
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.763 Y124.29 E.0149
; WIPE_START
M204 S10000
G1 X151.729 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X152.119 Y121.126 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.464312
G1 F3600
M73 P84 R2
G1 X152.119 Y123.874 E.05891
; CHANGE_LAYER
; Z_HEIGHT: 2.84
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X152.119 Y121.874 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/45
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.12 I-.061 J-1.215 P1  F30000
G1 X104.313 Y124.29 Z3.12
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X103.473 Y124.29 E.01618
G1 X103.473 Y120.71 E.06901
G1 X104.313 Y120.71 E.01618
G1 X104.313 Y121.13 E.00809
G1 X104.313 Y124.23 E.05976
; WIPE_START
M204 S10000
G1 X103.473 Y124.29 E-.31986
G1 X103.473 Y123.132 E-.44014
; WIPE_END
G1 E-.04
G1 X103.893 Y121.13 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.471112
G1 F3600
G1 X103.893 Y123.87 E.05967
; WIPE_START
G1 X103.893 Y121.87 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.524 Y122.006 Z3.24 F30000
G1 X144.318 Y122.588 Z3.24
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.450342
G1 F3600
G1 X144.319 Y121.968 E.01287
G1 X144.531 Y121.968 E.0044
; LINE_WIDTH: 0.497106
G1 X144.774 Y121.992 E.00563
; LINE_WIDTH: 0.543869
G1 X145.017 Y122.015 E.00619
; LINE_WIDTH: 0.590632
G1 X145.26 Y122.038 E.00674
G1 X145.05 Y122.148 E.00654
; LINE_WIDTH: 0.543869
G1 X144.84 Y122.258 E.006
; LINE_WIDTH: 0.497106
G1 X144.631 Y122.368 E.00546
; LINE_WIDTH: 0.450342
G1 X144.367 Y122.554 E.0067
; WIPE_START
G1 X144.319 Y121.968 E-.22318
G1 X144.531 Y121.968 E-.0805
G1 X144.774 Y121.992 E-.09279
G1 X145.017 Y122.015 E-.0928
G1 X145.26 Y122.038 E-.0928
G1 X145.05 Y122.148 E-.08997
G1 X144.845 Y122.256 E-.08797
; WIPE_END
G1 E-.04 F1800
G1 X143.899 Y123.789 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.526272
G1 F3600
G1 X143.904 Y123.734 E.00134
; LINE_WIDTH: 0.515772
G1 X143.898 Y123.41 E.00775
; LINE_WIDTH: 0.482882
G1 X143.892 Y123.087 E.00723
; LINE_WIDTH: 0.449992
G3 X143.9 Y121.544 I109.702 J-.229 E.032
G1 X146.979 Y121.544 E.06388
G1 X146.979 Y122.055 E.0106
G1 X146.979 Y122.856 E.01663
G1 X146.536 Y122.605 E.01056
G1 X145.879 Y122.459 E.01397
G1 X145.345 Y122.525 E.01115
G1 X144.83 Y122.742 E.01159
G1 X144.48 Y122.991 E.00892
G1 X144.255 Y123.231 E.00682
; LINE_WIDTH: 0.488132
G1 X144.077 Y123.51 E.00748
; LINE_WIDTH: 0.526272
G1 X143.931 Y123.738 E.00663
; WIPE_START
G1 X143.904 Y123.734 E-.01037
G1 X143.898 Y123.41 E-.12299
G1 X143.892 Y123.087 E-.12299
G1 X143.899 Y121.761 E-.50364
; WIPE_END
G1 E-.04 F1800
G1 X146.468 Y122.055 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.623412
G1 F3600
G1 X146.272 Y122.037 E.00577
; LINE_WIDTH: 0.587772
G1 X146.075 Y122.019 E.00542
; LINE_WIDTH: 0.552132
G1 X145.879 Y122.001 E.00508
; LINE_WIDTH: 0.553562
G1 X145.569 Y122.02 E.008
; LINE_WIDTH: 0.590632
G1 X145.26 Y122.038 E.00856
; WIPE_START
G1 X145.569 Y122.02 E-.19437
G1 X145.879 Y122.001 E-.19437
G1 X146.075 Y122.019 E-.12376
G1 X146.272 Y122.037 E-.12376
G1 X146.468 Y122.055 E-.12376
; WIPE_END
G1 E-.04 F1800
G1 X142.652 Y125.411 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.537142
G1 F3600
G2 X143.513 Y124.743 I-.878 J-2.019 E.02753
G1 X143.805 Y124.188 E.01568
; LINE_WIDTH: 0.519632
G1 X143.782 Y124.312 E.00304
; LINE_WIDTH: 0.537142
G2 X143.758 Y125.411 I13.877 J.854 E.0275
G1 X142.712 Y125.411 E.02615
; WIPE_START
G1 X142.963 Y125.255 E-.11253
G1 X143.248 Y125.037 E-.13619
G1 X143.513 Y124.743 E-.15035
G1 X143.805 Y124.188 E-.23825
G1 X143.782 Y124.312 E-.04785
G1 X143.778 Y124.509 E-.07484
; WIPE_END
G1 E-.04 F1800
G1 X136.145 Y124.49 Z3.24 F30000
G1 X117.193 Y124.442 Z3.24
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X117.572 Y124.766 E.01033
G1 X118.222 Y125.15 E.01565
G1 X118.867 Y125.392 E.01429
G1 X119.386 Y125.481 E.01093
G1 X118.86 Y125.461 E.01093
G1 X118.572 Y125.501 E.00602
G1 X118.001 Y125.691 E.01249
G1 X117.574 Y126 E.01094
G2 X117.193 Y126.484 I1.16 J1.303 E.01283
G1 X117.193 Y124.502 E.04111
G1 X117.685 Y125.309 F30000
; LINE_WIDTH: 0.522172
G1 F3600
G2 X117.716 Y125.363 I-.027 J.051 E.00729
; WIPE_START
G1 X117.685 Y125.416 E-.15201
G1 X117.623 Y125.416 E-.152
G1 X117.592 Y125.363 E-.152
G1 X117.623 Y125.309 E-.15201
G1 X117.685 Y125.309 E-.15198
; WIPE_END
G1 E-.04 F1800
G1 X115.481 Y130.466 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.463152
G1 F3600
G1 X115.62 Y130.438 E.00303
; LINE_WIDTH: 0.495232
G1 X115.759 Y130.41 E.00325
; LINE_WIDTH: 0.520672
G2 X116.869 Y129.514 I-.764 J-2.082 E.03514
G1 X116.867 Y130.421 E.02193
G2 X115.803 Y130.443 I-.371 J7.659 E.02579
; LINE_WIDTH: 0.475872
G1 X115.541 Y130.462 E.00578
; WIPE_START
G1 X115.62 Y130.438 E-.03133
G1 X115.759 Y130.41 E-.0538
G1 X116.09 Y130.266 E-.13711
G1 X116.372 Y130.069 E-.13095
G1 X116.676 Y129.774 E-.16105
G1 X116.869 Y129.514 E-.12278
G1 X116.868 Y129.838 E-.12297
; WIPE_END
G1 E-.04 F1800
G1 X112.627 Y129.495 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.517362
G1 F3600
G1 X113.024 Y129.983 E.01513
G2 X113.731 Y130.42 I1.668 J-1.91 E.02007
G1 X113.863 Y130.439 F30000
; LINE_WIDTH: 0.481606
G1 F3600
G1 X113.994 Y130.457 E.00296
G1 X113.863 Y130.439 E.00296
; LINE_WIDTH: 0.516782
G1 X113.731 Y130.42 E.00318
G1 X113.863 Y130.439 E.00318
G1 X114.125 Y130.476 F30000
; LINE_WIDTH: 0.446429
G1 F3600
G1 X113.994 Y130.457 E.00273
G1 X114.125 Y130.476 E.00273
G1 X113.731 Y130.42 F30000
; LINE_WIDTH: 0.517362
G1 F3600
G3 X112.627 Y130.42 I-.541 J-46.251 E.02654
G1 X112.627 Y129.555 E.02078
; WIPE_START
G1 X113.024 Y129.983 E-.22192
G1 X113.407 Y130.259 E-.17947
G1 X113.731 Y130.42 E-.13737
G1 X113.863 Y130.439 E-.05039
G1 X113.994 Y130.457 E-.05039
G1 X113.863 Y130.439 E-.05039
G1 X113.731 Y130.42 E-.05039
G1 X113.783 Y130.427 E-.01967
; WIPE_END
G1 E-.04 F1800
G1 X111.356 Y123.191 Z3.24 F30000
G1 X110.964 Y122.022 Z3.24
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.558212
G1 F3600
G1 X111.084 Y121.999 E.00317
; LINE_WIDTH: 0.512529
G1 X111.203 Y121.976 E.00289
; LINE_WIDTH: 0.466846
G1 X111.323 Y121.954 E.00262
; LINE_WIDTH: 0.421162
G1 X111.904 Y121.946 E.01125
; LINE_WIDTH: 0.406332
G1 X111.905 Y122.483 E.00998
G1 X111.626 Y122.305 E.00616
; LINE_WIDTH: 0.444302
G1 X111.46 Y122.234 E.00368
; LINE_WIDTH: 0.482272
G1 X111.295 Y122.164 E.00401
; LINE_WIDTH: 0.520242
G1 X111.129 Y122.093 E.00435
; LINE_WIDTH: 0.558212
G1 X111.019 Y122.046 E.00312
; WIPE_START
G1 X111.084 Y121.999 E-.03013
G1 X111.203 Y121.976 E-.04622
G1 X111.323 Y121.954 E-.04622
G1 X111.904 Y121.946 E-.22114
G1 X111.905 Y122.483 E-.20389
G1 X111.626 Y122.305 E-.12579
G1 X111.46 Y122.234 E-.06835
G1 X111.416 Y122.215 E-.01827
; WIPE_END
G1 E-.04 F1800
G1 X109.021 Y122.852 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X109.021 Y121.544 E.02715
G1 X109.714 Y121.544 E.01439
G3 X112.307 Y121.56 I.996 J48.541 E.05378
G1 X112.308 Y123.481 E.03986
G2 X111.2 Y122.571 I-1.75 J1 E.0304
G1 X110.592 Y122.458 E.01282
G1 X109.881 Y122.483 E.01478
G1 X109.389 Y122.637 E.01068
G1 X109.073 Y122.822 E.00761
; WIPE_START
G1 X109.021 Y121.544 E-.48624
G1 X109.714 Y121.544 E-.26356
G1 X109.741 Y121.544 E-.0102
; WIPE_END
G1 E-.04 F1800
G1 X110.964 Y122.022 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.558212
G1 F3600
G1 X110.585 Y122.001 E.00989
; LINE_WIDTH: 0.525672
G1 X110.033 Y122.006 E.01348
; LINE_WIDTH: 0.572242
G1 X109.781 Y122.029 E.00676
; LINE_WIDTH: 0.618812
G1 X109.529 Y122.052 E.00734
; WIPE_START
G1 X109.781 Y122.029 E-.13379
G1 X110.033 Y122.006 E-.13379
G1 X110.585 Y122.001 E-.29155
G1 X110.964 Y122.022 E-.20087
; WIPE_END
G1 E-.04 F1800
G1 X108.72 Y123.881 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F3600
G1 X108.596 Y123.881 E.00256
G1 X108.596 Y121.119 E.05728
G1 X112.266 Y121.12 E.07611
G1 X112.49 Y121.156 E.00471
G1 X112.64 Y121.278 E.00401
G1 X112.731 Y121.518 E.00532
G1 X112.732 Y123.12 E.03323
; LINE_WIDTH: 0.451972
G1 X112.731 Y123.884 E.01592
; LINE_WIDTH: 0.485932
G1 X112.715 Y124.177 E.0066
; LINE_WIDTH: 0.519892
G1 X112.698 Y124.47 E.00709
; LINE_WIDTH: 0.520502
G1 X112.699 Y126.47 E.04838
; LINE_WIDTH: 0.521102
G1 X112.7 Y128.408 E.04695
G1 X112.727 Y128.576 E.00411
; LINE_WIDTH: 0.511412
G1 X112.842 Y128.872 E.00754
; LINE_WIDTH: 0.480702
G1 X112.957 Y129.168 E.00707
; LINE_WIDTH: 0.449992
G1 X113.326 Y129.637 E.01238
G1 X113.86 Y129.977 E.01312
G1 X114.398 Y130.111 E.01151
G1 X114.977 Y130.119 E.01202
G1 X115.409 Y130.057 E.00905
G1 X115.891 Y129.851 E.01087
G1 X116.128 Y129.666 E.00623
G1 X116.473 Y129.286 E.01065
; LINE_WIDTH: 0.485442
G1 X116.565 Y129.124 E.00418
; LINE_WIDTH: 0.520892
G1 X116.657 Y128.962 E.00451
; LINE_WIDTH: 0.556342
G1 X116.749 Y128.801 E.00483
G1 X116.803 Y128.301 E.01304
; LINE_WIDTH: 0.526942
G2 X116.788 Y126.957 I-11.92 J-.541 E.03296
; LINE_WIDTH: 0.488467
G1 X116.769 Y126.586 E.0084
; LINE_WIDTH: 0.449992
G1 X116.769 Y123.197 E.0703
G1 X116.92 Y123.476 E.00659
G1 X117.317 Y123.981 E.01332
G1 X117.798 Y124.408 E.01333
G1 X118.381 Y124.756 E.01409
G1 X118.945 Y124.975 E.01255
G2 X119.95 Y125.119 I1.027 J-3.583 E.02111
G1 X141.939 Y125.115 E.4561
G1 X142.48 Y124.983 E.01155
G2 X143.113 Y124.499 I-.844 J-1.761 E.01666
G1 X143.373 Y124.044 E.01087
G1 X143.467 Y123.532 E.01081
G1 X143.471 Y121.561 E.04087
G1 X143.522 Y121.322 E.00506
G1 X143.632 Y121.202 E.00339
G1 X143.846 Y121.12 E.00475
G1 X147.403 Y121.119 E.07379
G1 X147.403 Y122.055 E.0194
G1 X147.403 Y123.881 E.03788
G1 X147.281 Y123.881 E.00254
G1 X147.078 Y123.525 E.00849
G2 X146.419 Y123.013 I-1.562 J1.332 E.01743
G1 X145.879 Y122.883 E.01154
G1 X145.419 Y122.943 E.00962
G1 X144.946 Y123.161 E.0108
G1 X144.565 Y123.521 E.01088
G1 X144.342 Y123.931 E.00967
G1 X144.255 Y124.255 E.00697
G2 X144.208 Y125.56 I31.174 J1.762 E.02708
G1 X144.089 Y125.78 E.00519
G1 X143.848 Y125.879 E.00541
G1 X118.855 Y125.885 E.51842
G1 X118.316 Y126.018 E.0115
G1 X118.117 Y126.119 E.00464
G1 X117.688 Y126.495 E.01183
; LINE_WIDTH: 0.452092
G1 X117.415 Y127.003 E.01202
; LINE_WIDTH: 0.485362
G1 X117.356 Y127.251 E.00573
; LINE_WIDTH: 0.518632
G1 X117.296 Y127.499 E.00614
G1 X117.296 Y128.302 E.01937
; LINE_WIDTH: 0.556342
G2 X117.293 Y129.062 I3.229 J.39 E.01977
; LINE_WIDTH: 0.520892
G1 X117.311 Y129.278 E.00523
; LINE_WIDTH: 0.485442
G1 X117.328 Y129.493 E.00486
; LINE_WIDTH: 0.449992
G3 X117.297 Y130.638 I-8.928 J.329 E.02377
G1 X117.188 Y130.777 E.00367
G1 X116.951 Y130.88 E.00536
G1 X112.951 Y130.881 E.08297
G3 X112.416 Y130.847 I-.014 J-4.039 E.01113
G1 X112.237 Y130.701 E.00479
G1 X112.169 Y130.469 E.00502
G1 X112.169 Y129.076 E.02889
; LINE_WIDTH: 0.485547
G1 X112.187 Y128.742 E.00751
; LINE_WIDTH: 0.521102
G1 X112.205 Y128.408 E.00809
G1 X112.204 Y126.408 E.04844
; LINE_WIDTH: 0.520482
G1 X112.204 Y124.47 E.04689
; LINE_WIDTH: 0.530872
G1 X112.193 Y124.327 E.00353
G1 X112.084 Y124.037 E.00767
; LINE_WIDTH: 0.490432
G1 X111.975 Y123.746 E.00706
; LINE_WIDTH: 0.449992
G2 X111.101 Y122.984 I-1.43 J.758 E.0246
G1 X110.61 Y122.883 E.01039
G1 X110.048 Y122.892 E.01165
G1 X109.828 Y122.936 E.00466
G1 X109.337 Y123.142 E.01104
G1 X108.919 Y123.531 E.01185
G1 X108.75 Y123.829 E.0071
M204 S250
G1 X109.073 Y124.115 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1800
M204 S5000
G1 X109.032 Y124.29 E.00346
G1 X108.187 Y124.29 E.01628
G1 X108.187 Y120.71 E.06901
G1 X112.266 Y120.71 E.07862
G1 X112.646 Y120.771 E.00742
G1 X112.881 Y120.919 E.00536
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.145 Y128.408 E.13304
G1 X113.265 Y128.874 E.00927
G1 X113.518 Y129.257 E.00885
G1 X113.913 Y129.555 E.00954
G1 X114.404 Y129.701 E.00987
G1 X114.983 Y129.709 E.01117
G1 X115.336 Y129.654 E.0069
G1 X115.715 Y129.482 E.00801
G1 X116.071 Y129.151 E.00938
G1 X116.275 Y128.776 E.00823
G1 X116.36 Y128.301 E.0093
G1 X116.36 Y122.686 E.10824
; LINE_WIDTH: 0.430602
G1 X116.365 Y121.715 E.01921
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437812
G1 X116.786 Y122.088 E.00753
G1 X116.952 Y122.643 E.01167
; LINE_WIDTH: 0.419992
G1 X117.246 Y123.228 E.01262
G1 X117.594 Y123.679 E.01098
G1 X118.017 Y124.061 E.01099
G1 X118.535 Y124.377 E.0117
G2 X119.95 Y124.71 I1.527 J-3.317 E.0282
G1 X141.938 Y124.706 E.42384
G1 X142.366 Y124.59 E.00853
G1 X142.715 Y124.34 E.00829
G1 X142.966 Y123.955 E.00885
G1 X143.058 Y123.531 E.00837
G1 X143.062 Y121.56 E.03798
G1 X143.149 Y121.138 E.00831
G3 X143.828 Y120.71 I.75 J.437 E.01607
G1 X147.813 Y120.71 E.07681
G1 X147.813 Y122.055 E.02592
G1 X147.813 Y124.29 E.04309
G1 X146.968 Y124.29 E.01628
G1 X146.935 Y124.109 E.00354
G1 X146.726 Y123.734 E.00828
G1 X146.374 Y123.441 E.00883
G1 X145.933 Y123.3 E.00892
G1 X145.495 Y123.345 E.00848
G1 X145.139 Y123.522 E.00767
G1 X144.863 Y123.801 E.00756
G1 X144.714 Y124.101 E.00646
G1 X144.639 Y124.469 E.00723
G1 X144.635 Y125.441 E.01873
G1 X144.548 Y125.859 E.00823
G1 X144.361 Y126.096 E.00581
G1 X144.095 Y126.248 E.00592
G1 X143.888 Y126.288 E.00407
G1 X118.86 Y126.294 E.48242
G1 X118.431 Y126.411 E.00857
G1 X118.081 Y126.662 E.00829
G1 X117.845 Y127.014 E.00818
G1 X117.74 Y127.499 E.00956
G1 X117.736 Y130.435 E.0566
G1 X117.68 Y130.797 E.00705
G1 X117.549 Y131.011 E.00485
G1 X117.333 Y131.187 E.00537
G1 X116.972 Y131.29 E.00723
G1 X114.972 Y131.29 E.03855
G3 X112.442 Y131.267 I-.814 J-50.979 E.04877
G1 X112.162 Y131.173 E.00569
G3 X111.76 Y130.49 I.517 J-.764 E.01579
G1 X111.76 Y124.47 E.11604
G1 X111.669 Y124.048 E.00831
G1 X111.417 Y123.661 E.00891
G1 X111.068 Y123.41 E.00829
G1 X110.61 Y123.292 E.00912
G1 X110.055 Y123.301 E.01069
G1 X109.656 Y123.426 E.00806
G1 X109.316 Y123.686 E.00824
G1 X109.089 Y124.047 E.00823
G1 X109.086 Y124.057 E.00019
; WIPE_START
M204 S10000
G1 X109.032 Y124.29 E-.09097
M73 P85 R2
G1 X108.187 Y124.29 E-.32088
G1 X108.187 Y123.374 E-.34814
; WIPE_END
G1 E-.04
G1 X115.819 Y123.462 Z3.24 F30000
G1 X143.899 Y123.789 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.526272
G1 F3600
G1 X143.805 Y124.188 E.01005
; WIPE_START
G1 X143.899 Y123.789 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.285 Y124.314 Z3.24 F30000
G1 X119.386 Y125.481 Z3.24
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.409672
G1 F3600
G1 X119.891 Y125.501 E.00949
; LINE_WIDTH: 0.368532
G1 X119.95 Y125.502 E.00099
; LINE_WIDTH: 0.366772
G1 X121.939 Y125.501 E.03316
; LINE_WIDTH: 0.366592
G1 X125.939 Y125.501 E.06666
; LINE_WIDTH: 0.366412
G1 X129.939 Y125.5 E.06662
; LINE_WIDTH: 0.366232
G1 X133.939 Y125.499 E.06659
; LINE_WIDTH: 0.366052
G1 X137.939 Y125.498 E.06655
; LINE_WIDTH: 0.365872
G1 X141.939 Y125.497 E.06652
; LINE_WIDTH: 0.380772
G1 X142.111 Y125.49 E.00299
; WIPE_START
G1 X141.939 Y125.497 E-.06545
G1 X140.111 Y125.498 E-.69455
; WIPE_END
G1 E-.04 F1800
G1 X132.615 Y126.934 Z3.24 F30000
G1 X114.125 Y130.476 Z3.24
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.411252
G1 F3600
G1 X114.972 Y130.5 E.01597
; LINE_WIDTH: 0.397242
G1 X115.227 Y130.483 E.00463
; LINE_WIDTH: 0.431072
G1 X115.481 Y130.466 E.00505
; WIPE_START
G1 X115.227 Y130.483 E-.1428
G1 X114.972 Y130.5 E-.14281
G1 X114.125 Y130.476 E-.47439
; WIPE_END
G1 E-.04 F1800
G1 X121.656 Y129.236 Z3.24 F30000
G1 X151.687 Y124.29 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X151.687 Y120.71 E.06901
G1 X152.527 Y120.71 E.01618
G1 X152.527 Y121.13 E.00809
G1 X152.527 Y124.29 E.06091
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.747 Y124.29 E.01503
; WIPE_START
M204 S10000
G1 X151.714 Y122.29 E-.76
; WIPE_END
G1 E-.04
G1 X152.107 Y121.13 Z3.24 F30000
G1 Z2.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.471092
G1 F3600
G1 X152.107 Y123.87 E.05967
; CHANGE_LAYER
; Z_HEIGHT: 2.96
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X152.107 Y121.87 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/45
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.24 I-.062 J-1.215 P1  F30000
G1 X104.336 Y124.29 Z3.24
G1 Z2.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F2250
M204 S5000
G1 X104.257 Y124.29 E.00154
G1 F1800
G1 X103.487 Y124.29 E.01483
G1 X103.487 Y120.71 E.06901
G1 X104.257 Y120.71 E.01483
G1 F2250
G1 X104.336 Y120.71 E.00154
G1 X104.336 Y121.135 E.00819
G1 X104.336 Y124.23 E.05966
; WIPE_START
M204 S10000
G1 X104.257 Y124.29 E-.03798
G1 X103.487 Y124.29 E-.29241
G1 X103.487 Y123.159 E-.42961
; WIPE_END
G1 E-.04 F1800
G1 X103.912 Y121.135 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.480952
G1 F3600
G1 X103.912 Y123.865 E.06077
; WIPE_START
G1 X103.912 Y121.865 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.069 Y124.134 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
M204 S5000
G1 X109.032 Y124.29 E.00308
G1 X108.264 Y124.29 E.01479
G1 F2250
G1 X108.163 Y124.29 E.00194
G1 X108.163 Y120.71 E.06901
G1 X108.353 Y120.71 E.00366
G1 F1800
G1 X112.163 Y120.71 E.07344
G3 X112.646 Y120.771 I.052 J1.54 E.00941
G1 X112.881 Y120.919 E.00536
G1 X113.05 Y121.141 E.00537
G1 X113.14 Y121.506 E.00725
G1 X113.14 Y128.301 E.13097
G1 X113.219 Y128.758 E.00894
G1 X113.437 Y129.162 E.00885
G1 X113.772 Y129.473 E.0088
G1 X114.151 Y129.65 E.00808
G1 X114.515 Y129.709 E.00711
G1 X115.096 Y129.701 E.0112
G1 X115.491 Y129.6 E.00785
G1 X115.847 Y129.385 E.00802
G1 X116.146 Y129.043 E.00875
G1 X116.321 Y128.621 E.00881
G1 X116.36 Y128.301 E.00622
G1 X116.36 Y122.678 E.10838
; LINE_WIDTH: 0.430582
G1 X116.365 Y121.715 E.01906
G1 X116.753 Y121.715 E.00767
; LINE_WIDTH: 0.437822
G1 X116.786 Y122.087 E.00752
G1 X116.948 Y122.634 E.01148
; LINE_WIDTH: 0.419992
G1 X117.195 Y123.147 E.01098
G1 X117.534 Y123.613 E.01111
G1 X118.017 Y124.061 E.0127
G1 X118.538 Y124.379 E.01177
G2 X119.95 Y124.71 I1.523 J-3.315 E.02813
G1 X141.938 Y124.706 E.42384
G1 X142.365 Y124.59 E.00853
G1 X142.738 Y124.316 E.00891
G1 X142.968 Y123.952 E.00829
G1 X143.058 Y123.53 E.00832
G1 X143.062 Y121.541 E.03835
G1 X143.093 Y121.307 E.00455
G1 X143.234 Y121.007 E.00638
G1 X143.471 Y120.81 E.00594
G1 X143.829 Y120.71 E.00717
G1 X147.835 Y120.71 E.07722
G1 F2250
G1 X147.836 Y122.057 E.02597
G1 X147.836 Y124.29 E.04303
G1 X147.748 Y124.29 E.0017
G1 F1800
G1 X146.968 Y124.29 E.01504
G1 X146.935 Y124.11 E.00353
G1 X146.728 Y123.736 E.00824
G1 X146.374 Y123.441 E.00887
G1 X145.933 Y123.3 E.00893
G1 X145.495 Y123.346 E.00849
G1 X145.141 Y123.521 E.00761
G1 X144.865 Y123.799 E.00756
G1 X144.714 Y124.102 E.00651
G1 X144.639 Y124.468 E.00722
G1 X144.635 Y125.439 E.0187
G1 X144.547 Y125.86 E.0083
G1 X144.378 Y126.082 E.00537
G1 X144.167 Y126.22 E.00487
G1 X143.883 Y126.288 E.00562
G1 X118.86 Y126.294 E.48234
G1 X118.433 Y126.409 E.00852
G1 X118.061 Y126.684 E.00891
G1 X117.819 Y127.078 E.00892
G1 X117.74 Y127.499 E.00826
G1 X117.736 Y130.414 E.05619
G1 X117.681 Y130.793 E.00737
G1 X117.514 Y131.047 E.00587
G1 X117.266 Y131.22 E.00582
G1 X116.958 Y131.29 E.0061
G1 X113.081 Y131.29 E.07472
G1 X112.426 Y131.264 E.01264
G1 X112.162 Y131.173 E.00539
G3 X111.76 Y130.488 I.504 J-.756 E.01584
G1 X111.756 Y124.409 E.11717
G1 X111.655 Y124.012 E.0079
G1 X111.392 Y123.635 E.00886
G1 X111.066 Y123.408 E.00766
G1 X110.609 Y123.292 E.00909
G1 X110.055 Y123.301 E.01069
G1 X109.656 Y123.426 E.00806
G1 X109.317 Y123.686 E.00823
G1 X109.09 Y124.045 E.0082
G1 X109.082 Y124.076 E.0006
; WIPE_START
M204 S10000
G1 X109.032 Y124.29 E-.08359
G1 X108.264 Y124.29 E-.29158
G1 X108.163 Y124.29 E-.03834
G1 X108.163 Y123.378 E-.34649
; WIPE_END
G1 E-.04
G1 X115.795 Y123.502 Z3.36 F30000
G1 X147.188 Y124.009 Z3.36
G1 Z2.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.365752
G1 F3600
G1 X147.259 Y124.015 E.00119
; LINE_WIDTH: 0.392622
G1 X147.351 Y123.956 E.00196
; LINE_WIDTH: 0.419492
G1 X147.443 Y123.896 E.00211
G1 X147.443 Y121.104 E.05375
; WIPE_START
G1 X147.443 Y123.104 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.82 Y122.712 Z3.36 F30000
G1 X108.557 Y121.104 Z3.36
G1 Z2.96
G1 E.8 F1800
G1 F3600
G1 X108.557 Y123.896 E.05375
G1 X108.681 Y123.947 E.00258
; LINE_WIDTH: 0.392622
G1 X108.805 Y123.998 E.00241
; LINE_WIDTH: 0.365752
G1 X108.805 Y124.072 E.00122
G1 X108.869 Y124.035 E.00122
; WIPE_START
G1 X108.805 Y124.072 E-.02797
M73 P86 R2
G1 X108.805 Y123.998 E-.02798
G1 X108.681 Y123.947 E-.05096
G1 X108.557 Y123.896 E-.05096
G1 X108.557 Y122.311 E-.60214
; WIPE_END
G1 E-.04 F1800
G1 X116.147 Y123.121 Z3.36 F30000
G1 X143.818 Y126.071 Z3.36
G1 Z2.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M204 S2000
G1 X144.418 Y125.472 E.01634
G1 X144.42 Y124.912
G1 X143.261 Y126.072 E.03161
G1 X142.703 Y126.072
G1 X144.438 Y124.336 E.04731
; WIPE_START
M204 S10000
G1 X143.024 Y125.751 E-.76
; WIPE_END
G1 E-.04
G1 X146.872 Y123.576 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
M204 S2000
G1 X147.226 Y123.221 E.00966
G1 X147.226 Y122.664
G1 X146.57 Y123.319 E.01787
G1 X146.186 Y123.147
G1 X147.226 Y122.106 E.02836
G1 X147.226 Y121.549
G1 X145.674 Y123.101 E.04231
; WIPE_START
M204 S10000
G1 X147.088 Y121.686 E-.76
; WIPE_END
G1 E-.04
G1 X147.226 Y120.991 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
M204 S2000
G1 X142.145 Y126.072 E.13851
G1 X141.587 Y126.073
G1 X146.733 Y120.927 E.14027
G1 X146.175 Y120.927
G1 X143.199 Y123.904 E.08114
G1 X143.275 Y123.269
G1 X145.617 Y120.927 E.06385
G1 X145.06 Y120.927
G1 X143.276 Y122.711 E.04862
G1 X143.277 Y122.152
G1 X144.502 Y120.927 E.03339
G1 X143.945 Y120.927
G1 X143.279 Y121.593 E.01816
; WIPE_START
M204 S10000
G1 X143.945 Y120.927 E-.35801
G1 X144.502 Y120.927 E-.21188
G1 X144.149 Y121.281 E-.19011
; WIPE_END
G1 E-.04
G1 X142.254 Y124.849 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
M204 S2000
G1 X141.029 Y126.073 E.03337
G1 X140.471 Y126.073
G1 X141.622 Y124.923 E.03136
G1 X141.064 Y124.923
G1 X139.914 Y126.073 E.03136
G1 X139.356 Y126.074
G1 X140.506 Y124.923 E.03137
G1 X139.949 Y124.923
G1 X138.798 Y126.074 E.03137
G1 X138.24 Y126.074
G1 X139.391 Y124.923 E.03138
G1 X138.834 Y124.923
G1 X137.682 Y126.075 E.03138
G1 X137.125 Y126.075
G1 X138.276 Y124.923 E.03139
G1 X137.718 Y124.924
G1 X136.567 Y126.075 E.03139
G1 X136.009 Y126.075
G1 X137.161 Y124.924 E.03139
G1 X136.603 Y124.924
G1 X135.451 Y126.076 E.0314
G1 X134.893 Y126.076
G1 X136.045 Y124.924 E.0314
G1 X135.488 Y124.924
G1 X134.335 Y126.076 E.03141
G1 X133.778 Y126.076
G1 X134.93 Y124.924 E.03141
G1 X134.372 Y124.924
G1 X133.22 Y126.077 E.03142
G1 X132.662 Y126.077
G1 X133.815 Y124.924 E.03142
M73 P86 R1
G1 X133.257 Y124.924
G1 X132.104 Y126.077 E.03143
G1 X131.546 Y126.078
G1 X132.699 Y124.924 E.03143
G1 X132.142 Y124.925
G1 X130.989 Y126.078 E.03144
G1 X130.431 Y126.078
G1 X131.584 Y124.925 E.03144
G1 X131.027 Y124.925
G1 X129.873 Y126.078 E.03145
G1 X129.315 Y126.079
G1 X130.469 Y124.925 E.03145
G1 X129.911 Y124.925
G1 X128.757 Y126.079 E.03146
G1 X128.199 Y126.079
G1 X129.354 Y124.925 E.03146
G1 X128.796 Y124.925
G1 X127.642 Y126.08 E.03147
G1 X127.084 Y126.08
G1 X128.238 Y124.925 E.03147
G1 X127.681 Y124.925
G1 X126.526 Y126.08 E.03148
G1 X125.968 Y126.08
G1 X127.123 Y124.926 E.03148
G1 X126.565 Y124.926
G1 X125.41 Y126.081 E.03149
G1 X124.852 Y126.081
G1 X126.008 Y124.926 E.03149
G1 X125.45 Y124.926
G1 X124.295 Y126.081 E.0315
G1 X123.737 Y126.082
G1 X124.892 Y124.926 E.0315
G1 X124.335 Y124.926
G1 X123.179 Y126.082 E.03151
G1 X122.621 Y126.082
G1 X123.777 Y124.926 E.03151
G1 X123.22 Y124.926
G1 X122.063 Y126.082 E.03152
G1 X121.506 Y126.083
G1 X122.662 Y124.926 E.03152
G1 X122.104 Y124.926
G1 X120.948 Y126.083 E.03153
G1 X120.39 Y126.083
G1 X121.547 Y124.927 E.03153
G1 X120.989 Y124.927
G1 X119.832 Y126.084 E.03154
G1 X119.274 Y126.084
G1 X120.431 Y124.927 E.03154
G1 X119.878 Y124.923
G1 X118.687 Y126.113 E.03246
; WIPE_START
M204 S10000
G1 X119.878 Y124.923 E-.63986
G1 X120.194 Y124.925 E-.12014
; WIPE_END
G1 E-.04
G1 X117.52 Y130.068 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
M204 S2000
G1 X116.515 Y131.073 E.02738
G1 X115.958 Y131.073
G1 X117.521 Y129.51 E.0426
G1 X117.521 Y128.952
G1 X115.4 Y131.073 E.05782
G1 X114.843 Y131.073
G1 X117.522 Y128.394 E.07304
G1 X117.523 Y127.835
G1 X116.432 Y128.926 E.02972
G1 X116.577 Y128.224
G1 X117.562 Y127.238 E.02687
G1 X116.577 Y127.666
G1 X119.377 Y124.866 E.07633
G1 X118.923 Y124.763
G1 X116.577 Y127.109 E.06395
G1 X116.577 Y126.551
G1 X118.523 Y124.605 E.05305
G1 X118.166 Y124.404
G1 X116.577 Y125.994 E.04332
G1 X116.577 Y125.436
G1 X117.827 Y124.186 E.03408
G1 X117.54 Y123.915
G1 X116.577 Y124.878 E.02625
G1 X116.577 Y124.321
G1 X117.276 Y123.622 E.01906
G1 X117.04 Y123.301
G1 X116.577 Y123.763 E.01261
; WIPE_START
M204 S10000
G1 X117.04 Y123.301 E-.24866
G1 X117.276 Y123.622 E-.15153
G1 X116.606 Y124.291 E-.35981
; WIPE_END
G1 E-.04
G1 X115.549 Y129.809 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
M204 S2000
G1 X114.285 Y131.073 E.03445
G1 X113.727 Y131.073
G1 X114.884 Y129.916 E.03154
G1 X114.342 Y129.901
G1 X113.17 Y131.073 E.03195
G1 X112.612 Y131.073
G1 X113.906 Y129.779 E.03527
G1 X113.556 Y129.572
G1 X112.19 Y130.938 E.03724
G1 X111.989 Y130.581
G1 X113.272 Y129.298 E.03496
G1 X113.065 Y128.948
G1 X111.977 Y130.036 E.02967
G1 X111.976 Y129.479
G1 X112.956 Y128.499 E.02671
G1 X112.923 Y127.975
G1 X111.976 Y128.922 E.02583
G1 X111.975 Y128.365
G1 X112.923 Y127.417 E.02584
G1 X112.923 Y126.859
G1 X111.975 Y127.808 E.02585
G1 X111.975 Y127.25
G1 X112.923 Y126.302 E.02586
G1 X112.923 Y125.744
G1 X111.974 Y126.693 E.02587
G1 X111.974 Y126.136
G1 X112.923 Y125.187 E.02588
G1 X112.923 Y124.629
G1 X111.974 Y125.579 E.02589
G1 X111.973 Y125.022
G1 X112.923 Y124.072 E.0259
G1 X112.923 Y123.514
G1 X111.973 Y124.465 E.02591
G1 X111.876 Y124.004
G1 X112.923 Y122.957 E.02856
M73 P87 R1
G1 X112.923 Y122.399
G1 X111.673 Y123.65 E.03409
G1 X111.399 Y123.366
G1 X112.923 Y121.842 E.04156
G1 X112.877 Y121.331
G1 X111.03 Y123.177 E.05032
G1 X110.574 Y123.075
G1 X112.631 Y121.018 E.05608
G1 X112.165 Y120.927
G1 X109.999 Y123.093 E.05904
; WIPE_START
M204 S10000
G1 X111.413 Y121.679 E-.76
; WIPE_END
G1 E-.04
G1 X108.774 Y123.761 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
M204 S2000
G1 X111.607 Y120.927 E.07724
G1 X111.05 Y120.927
G1 X108.774 Y123.203 E.06204
G1 X108.774 Y122.645
G1 X110.493 Y120.927 E.04684
G1 X109.935 Y120.927
G1 X108.774 Y122.088 E.03165
G1 X108.774 Y121.53
G1 X109.378 Y120.927 E.01645
; WIPE_START
M204 S10000
G1 X108.774 Y121.53 E-.3243
G1 X108.774 Y122.088 E-.21187
G1 X109.191 Y121.671 E-.22384
; WIPE_END
G1 E-.04
G1 X114.583 Y127.073 Z3.36 F30000
G1 X116.498 Y128.991 Z3.36
G1 Z2.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.177067
G1 F21000
G1 X116.349 Y129.201 E.0019
; LINE_WIDTH: 0.128126
G3 X116.032 Y129.544 I-30.47 J-27.82 E.00234
; LINE_WIDTH: 0.133151
G1 X115.864 Y129.68 E.00113
; LINE_WIDTH: 0.187666
G1 X115.688 Y129.823 E.00179
G1 X115.536 Y129.796 E.00122
; WIPE_START
G1 X115.688 Y129.823 E-.30807
G1 X115.864 Y129.68 E-.45193
; WIPE_END
G1 E-.04 F1800
G1 X117.539 Y130.468 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; LINE_WIDTH: 0.296352
G1 F21000
G3 X116.922 Y131.092 I-1.91 J-1.271 E.01169
; WIPE_START
G1 X117.265 Y130.805 E-.38548
G1 X117.539 Y130.468 E-.37452
; WIPE_END
G1 E-.04 F1800
G1 X114.119 Y129.845 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; LINE_WIDTH: 0.0885061
G1 F21000
G1 X114.045 Y129.863 E.00023
G1 X113.954 Y129.8 E.00034
; WIPE_START
G1 X114.045 Y129.863 E-.45207
G1 X114.119 Y129.845 E-.30793
; WIPE_END
G1 E-.04 F1800
G1 X113.016 Y122.293 Z3.36 F30000
G1 X112.871 Y121.301 Z3.36
G1 Z2.96
G1 E.8 F1800
; LINE_WIDTH: 0.0929144
G1 F21000
G2 X112.766 Y121.162 I-.392 J.187 E.00058
; WIPE_START
G1 X112.871 Y121.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.011 Y123.105 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; LINE_WIDTH: 0.118768
G1 F21000
G1 X109.774 Y123.04 E.00112
; WIPE_START
G1 X110.011 Y123.105 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.999 Y123.232 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; LINE_WIDTH: 0.0891478
G1 F21000
G1 X116.928 Y123.133 E.00038
; LINE_WIDTH: 0.130146
G1 X116.804 Y123.073 E.0007
; LINE_WIDTH: 0.179977
G1 X116.681 Y123.013 E.00104
; LINE_WIDTH: 0.229807
G1 X116.557 Y122.953 E.00137
; WIPE_START
G1 X116.681 Y123.013 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.696 Y126.855 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; LINE_WIDTH: 0.0969646
G1 F21000
G2 X117.508 Y127.114 I2.863 J2.269 E.00111
; WIPE_START
G1 X117.696 Y126.855 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.285 Y126.044 Z3.36 F30000
G1 X144.536 Y123.987 Z3.36
G1 Z2.96
G1 E.8 F1800
; LINE_WIDTH: 0.0879124
G1 F21000
G1 X144.485 Y124.062 E.00027
; LINE_WIDTH: 0.129044
G2 X144.363 Y124.261 I1.445 J1.031 E.00118
; WIPE_START
G1 X144.485 Y124.062 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X145.599 Y123.025 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; LINE_WIDTH: 0.110877
G1 F21000
G1 X145.352 Y123.163 E.00118
; WIPE_START
G1 X145.599 Y123.025 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.187 Y123.892 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; LINE_WIDTH: 0.176357
G1 F21000
G1 X143.228 Y124.043 E.00115
G1 X143.219 Y124.057 E.00013
; LINE_WIDTH: 0.157122
G1 X143.133 Y124.168 E.00089
; LINE_WIDTH: 0.123499
G1 X143.048 Y124.278 E.00067
; LINE_WIDTH: 0.0898759
G1 X142.963 Y124.388 E.00044
G1 X142.819 Y124.53 F30000
; LINE_WIDTH: 0.090766
G1 F21000
G3 X142.574 Y124.748 I-2.311 J-2.357 E.00104
; LINE_WIDTH: 0.132981
G1 X142.45 Y124.838 E.0008
; LINE_WIDTH: 0.159315
G1 X142.325 Y124.92 E.00098
; WIPE_START
G1 X142.45 Y124.838 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.069 Y124.385 Z3.36 F30000
G1 X151.663 Y124.29 Z3.36
G1 Z2.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F2250
M204 S5000
G1 X151.663 Y120.71 E.06901
G1 X151.744 Y120.71 E.00155
G1 F1800
G1 X152.513 Y120.71 E.01482
G1 X152.513 Y121.135 E.00819
G1 X152.513 Y124.29 E.06082
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.744 Y124.29 E.01482
G1 F2250
G1 X151.723 Y124.29 E.0004
; WIPE_START
M204 S10000
G1 X151.69 Y122.29 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.088 Y121.135 Z3.36 F30000
G1 Z2.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.480952
G1 F3600
G1 X152.088 Y123.865 E.06077
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X152.088 Y121.865 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/45
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.36 I-1.196 J-.225 P1  F30000
G1 X151.632 Y124.29 Z3.36
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X151.632 Y120.71 E.06901
G1 X152.063 Y120.71 E.00831
G1 X152.494 Y120.71 E.00831
G1 X152.494 Y121.142 E.00832
G1 X152.494 Y124.29 E.06068
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.063 Y124.29 E.00831
G1 X151.692 Y124.29 E.00716
; WIPE_START
G1 F2250
M204 S10000
G1 X151.658 Y122.29 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.063 Y121.142 Z3.48 F30000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.494912
G1 F1200
G1 X152.063 Y123.858 E.06231
; WIPE_START
G1 F3600
G1 X152.063 Y121.858 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.868 Y124.29 Z3.48 F30000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X147.437 Y124.29 E.00831
G1 X147.006 Y124.29 E.00831
G1 X147.006 Y120.71 E.06901
G1 X147.437 Y120.71 E.00831
G1 X147.868 Y120.71 E.00831
G1 X147.869 Y121.142 E.00832
G1 X147.868 Y124.23 E.05953
; WIPE_START
G1 F2700
M204 S10000
G1 X147.437 Y124.29 E-.16541
G1 X147.006 Y124.29 E-.16383
G1 X147.006 Y123.156 E-.43076
; WIPE_END
G1 E-.04 F1800
G1 X147.437 Y121.142 Z3.48 F30000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.494972
G1 F1200
G1 X147.437 Y123.858 E.06232
; WIPE_START
G1 F3600
G1 X147.437 Y121.858 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.82 Y122.34 Z3.48 F30000
G1 X108.994 Y124.29 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.563 Y124.29 E.00831
G1 X108.133 Y124.29 E.00831
G1 X108.133 Y120.71 E.06901
G1 X108.563 Y120.71 E.00831
G1 X108.994 Y120.71 E.00831
G1 X108.994 Y121.142 E.00832
G1 X108.994 Y124.23 E.05953
; WIPE_START
G1 F1800
M204 S10000
G1 X108.563 Y124.29 E-.16532
G1 X108.133 Y124.29 E-.16374
G1 X108.133 Y123.156 E-.43094
; WIPE_END
G1 E-.04
G1 X108.563 Y121.142 Z3.48 F30000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.494992
G1 F1200
G1 X108.563 Y123.858 E.06232
; WIPE_START
G1 F3600
G1 X108.563 Y121.858 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.368 Y124.29 Z3.48 F30000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X103.937 Y124.29 E.00831
G1 X103.506 Y124.29 E.00831
G1 X103.506 Y120.71 E.06901
G1 X103.937 Y120.71 E.00831
G1 X104.368 Y120.71 E.00831
G1 X104.369 Y121.142 E.00832
G1 X104.368 Y124.23 E.05953
; WIPE_START
G1 F2700
M204 S10000
G1 X103.937 Y124.29 E-.1654
G1 X103.506 Y124.29 E-.16381
G1 X103.506 Y123.156 E-.43078
; WIPE_END
G1 E-.04 F1800
G1 X103.937 Y121.142 Z3.48 F30000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.494912
G1 F1200
G1 X103.937 Y123.858 E.06231
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X103.937 Y121.858 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/45
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.48 I-1.194 J.233 P1  F30000
G1 X104.411 Y124.29 Z3.48
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.12 Y124.29 E.00562
G1 X103.824 Y124.29 E.00569
G1 X103.529 Y124.29 E.00569
G1 X103.529 Y120.71 E.06901
G1 X103.824 Y120.71 E.00569
G1 X104.12 Y120.71 E.00569
G1 X104.411 Y120.71 E.00562
G1 X104.411 Y121.151 E.0085
G1 X104.411 Y124.23 E.05935
; WIPE_START
G1 F2700
M204 S10000
G1 X104.12 Y124.29 E-.11319
G1 X103.824 Y124.29 E-.11221
G1 X103.529 Y124.29 E-.11222
G1 X103.529 Y123.178 E-.42238
; WIPE_END
G1 E-.04 F1800
G1 X103.97 Y121.151 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.513892
G1 F1200
G1 X103.97 Y123.849 E.06438
; WIPE_START
G1 F3600
G1 X103.97 Y121.849 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.971 Y124.29 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.676 Y124.29 E.00569
G1 X108.38 Y124.29 E.00569
M73 P88 R1
G1 X108.089 Y124.29 E.00563
G1 X108.089 Y120.71 E.06901
G1 X108.38 Y120.71 E.00563
G1 X108.675 Y120.71 E.00569
G1 X108.971 Y120.71 E.00569
G1 X108.971 Y121.151 E.0085
G1 X108.971 Y124.23 E.05935
; WIPE_START
G1 F1800
M204 S10000
G1 X108.676 Y124.29 E-.11443
G1 X108.38 Y124.29 E-.11213
G1 X108.089 Y124.29 E-.11091
G1 X108.089 Y123.178 E-.42253
; WIPE_END
G1 E-.04
G1 X108.53 Y121.151 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.513572
G1 F1200
G1 X108.53 Y123.849 E.06435
; WIPE_START
G1 F3600
G1 X108.53 Y121.849 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.147 Y122.321 Z3.6 F30000
G1 X147.911 Y124.29 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X147.619 Y124.29 E.00563
G1 X147.324 Y124.29 E.00569
G1 X147.029 Y124.29 E.00569
G1 X147.029 Y120.71 E.06901
G1 X147.324 Y120.71 E.00569
G1 X147.619 Y120.71 E.00569
G1 X147.911 Y120.71 E.00563
G1 X147.911 Y121.151 E.0085
G1 X147.911 Y124.23 E.05935
; WIPE_START
G1 F2700
M204 S10000
G1 X147.619 Y124.29 E-.1133
G1 X147.324 Y124.29 E-.1121
G1 X147.029 Y124.29 E-.1121
G1 X147.029 Y123.178 E-.42251
; WIPE_END
G1 E-.04 F1800
G1 X147.47 Y121.151 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.513552
G1 F1200
G1 X147.47 Y123.849 E.06435
; WIPE_START
G1 F3600
G1 X147.47 Y121.849 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.589 Y124.29 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X151.589 Y120.71 E.06901
G1 X151.88 Y120.71 E.00562
G1 X152.176 Y120.71 E.00569
G1 X152.471 Y120.71 E.00569
G1 X152.471 Y121.151 E.0085
G1 X152.471 Y124.29 E.0605
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.176 Y124.29 E.00569
G1 X151.88 Y124.29 E.00569
G1 X151.649 Y124.29 E.00447
; WIPE_START
G1 F2700
M204 S10000
G1 X151.615 Y122.29 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.03 Y121.151 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.513892
G1 F1200
G1 X152.03 Y123.849 E.06438
; CHANGE_LAYER
; Z_HEIGHT: 3.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X152.03 Y121.849 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/45
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.6 I-1.193 J-.241 P1  F30000
G1 X151.536 Y124.29 Z3.6
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X151.536 Y120.71 E.06901
G1 X151.761 Y120.71 E.00433
G1 X151.988 Y120.71 E.00437
G1 X152.215 Y120.71 E.00437
G1 X152.442 Y120.71 E.00437
G1 X152.442 Y121.163 E.00873
G1 X152.442 Y124.29 E.06028
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.215 Y124.29 E.00437
G1 X151.988 Y124.29 E.00437
G1 X151.761 Y124.29 E.00437
G1 X151.596 Y124.29 E.00317
; WIPE_START
G1 F3150
M204 S10000
G1 X151.563 Y122.29 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.989 Y121.163 Z3.72 F30000
G1 Z3.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.536972
G1 F1200
G1 X151.989 Y123.837 E.06685
; WIPE_START
G1 F3600
G1 X151.989 Y121.837 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.964 Y124.29 Z3.72 F30000
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X147.739 Y124.29 E.00434
G1 X147.512 Y124.29 E.00437
G1 X147.285 Y124.29 E.00437
G1 X147.058 Y124.29 E.00437
G1 X147.058 Y120.71 E.06901
G1 X147.285 Y120.71 E.00437
G1 X147.512 Y120.71 E.00437
G1 X147.738 Y120.71 E.00437
G1 X147.964 Y120.71 E.00434
G1 X147.964 Y121.163 E.00873
G1 X147.964 Y124.23 E.05912
; WIPE_START
G1 F3150
M204 S10000
G1 X147.739 Y124.29 E-.08855
G1 X147.512 Y124.29 E-.08621
G1 X147.285 Y124.29 E-.08621
G1 X147.058 Y124.29 E-.08621
G1 X147.058 Y123.204 E-.41283
; WIPE_END
G1 E-.04 F1800
G1 X147.511 Y121.163 Z3.72 F30000
G1 Z3.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.537272
G1 F1200
G1 X147.511 Y123.837 E.06688
; WIPE_START
G1 F3600
G1 X147.511 Y121.837 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.894 Y122.322 Z3.72 F30000
G1 X108.942 Y124.29 Z3.72
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.715 Y124.29 E.00437
G1 X108.488 Y124.29 E.00437
G1 X108.261 Y124.29 E.00437
G1 X108.036 Y124.29 E.00434
G1 X108.036 Y120.71 E.06901
G1 X108.261 Y120.71 E.00434
G1 X108.488 Y120.71 E.00437
G1 X108.715 Y120.71 E.00437
G1 X108.942 Y120.71 E.00437
G1 X108.942 Y121.163 E.00873
G1 X108.942 Y124.23 E.05912
; WIPE_START
G1 F1800
M204 S10000
G1 X108.715 Y124.29 E-.08919
G1 X108.488 Y124.29 E-.08623
G1 X108.261 Y124.29 E-.08623
G1 X108.036 Y124.29 E-.0855
G1 X108.036 Y123.204 E-.41286
; WIPE_END
G1 E-.04
G1 X108.489 Y121.163 Z3.72 F30000
G1 Z3.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.537252
G1 F1200
G1 X108.489 Y123.837 E.06688
; WIPE_START
G1 F3600
G1 X108.489 Y121.837 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.464 Y124.29 Z3.72 F30000
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.239 Y124.29 E.00433
G1 X104.012 Y124.29 E.00437
G1 X103.785 Y124.29 E.00437
G1 X103.558 Y124.29 E.00437
G1 X103.558 Y120.71 E.06901
G1 X103.785 Y120.71 E.00437
G1 X104.012 Y120.71 E.00437
G1 X104.239 Y120.71 E.00437
G1 X104.464 Y120.71 E.00433
G1 X104.464 Y121.163 E.00873
G1 X104.464 Y124.23 E.05912
; WIPE_START
G1 F3150
M204 S10000
G1 X104.239 Y124.29 E-.08839
G1 X104.012 Y124.29 E-.08623
G1 X103.785 Y124.29 E-.08623
G1 X103.558 Y124.29 E-.08623
G1 X103.558 Y123.203 E-.41293
; WIPE_END
G1 E-.04 F1800
G1 X104.011 Y121.163 Z3.72 F30000
G1 Z3.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.536992
G1 F1200
G1 X104.011 Y123.837 E.06685
; CHANGE_LAYER
; Z_HEIGHT: 3.44
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X104.011 Y121.837 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/45
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.72 I-1.191 J.251 P1  F30000
G1 X104.528 Y124.29 Z3.72
G1 Z3.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.374 Y124.29 E.00296
G1 X104.179 Y124.29 E.00377
G1 X103.983 Y124.29 E.00377
G1 X103.788 Y124.29 E.00377
G1 X103.592 Y124.29 E.00377
G1 X103.592 Y120.71 E.06901
G1 X103.788 Y120.71 E.00377
G1 X103.983 Y120.71 E.00377
G1 X104.179 Y120.71 E.00377
G1 X104.374 Y120.71 E.00377
G1 X104.528 Y120.71 E.00296
G1 X104.528 Y121.178 E.00901
G1 X104.528 Y121.578 E.00771
G1 X104.528 Y124.23 E.05112
; WIPE_START
G1 F3600
M204 S10000
G1 X104.374 Y124.29 E-.06265
G1 X104.179 Y124.29 E-.07427
G1 X103.983 Y124.29 E-.07427
G1 X103.788 Y124.29 E-.07427
G1 X103.592 Y124.29 E-.07427
G1 X103.592 Y123.237 E-.40027
; WIPE_END
G1 E-.04 F1800
G1 X104.06 Y121.178 Z3.84 F30000
G1 Z3.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.566872
G1 F1200
G1 X104.06 Y123.822 E.06997
; WIPE_START
G1 F3600
G1 X104.06 Y121.822 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.908 Y124.29 Z3.84 F30000
G1 Z3.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.712 Y124.29 E.00377
G1 X108.517 Y124.29 E.00377
G1 X108.321 Y124.29 E.00377
G1 X108.126 Y124.29 E.00377
G1 X107.972 Y124.29 E.00296
G1 X107.972 Y120.71 E.06901
G1 X108.126 Y120.71 E.00296
G1 X108.321 Y120.71 E.00377
G1 X108.517 Y120.71 E.00377
G1 X108.712 Y120.71 E.00377
G1 X108.908 Y120.71 E.00377
G1 X108.908 Y121.178 E.00901
G1 X108.908 Y124.23 E.05884
; WIPE_START
G1 F1800
M204 S10000
G1 X108.712 Y124.29 E-.07769
G1 X108.517 Y124.29 E-.07428
G1 X108.321 Y124.29 E-.07428
G1 X108.126 Y124.29 E-.07428
G1 X107.972 Y124.29 E-.05831
G1 X107.972 Y123.234 E-.40117
; WIPE_END
G1 E-.04
G1 X108.44 Y121.178 Z3.84 F30000
G1 Z3.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.566792
G1 F1200
G1 X108.44 Y123.822 E.06996
; WIPE_START
G1 F3600
G1 X108.44 Y121.822 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.058 Y122.297 Z3.84 F30000
G1 X148.028 Y124.29 Z3.84
G1 Z3.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X147.874 Y124.29 E.00296
G1 X147.679 Y124.29 E.00377
G1 X147.483 Y124.29 E.00377
G1 X147.288 Y124.29 E.00377
G1 X147.092 Y124.29 E.00377
M73 P89 R1
G1 X147.092 Y120.71 E.06901
G1 X147.288 Y120.71 E.00377
G1 X147.483 Y120.71 E.00377
G1 X147.679 Y120.71 E.00377
G1 X147.874 Y120.71 E.00377
G1 X148.028 Y120.71 E.00296
G1 X148.028 Y121.178 E.00901
G1 X148.028 Y121.578 E.00771
G1 X148.028 Y124.23 E.05113
; WIPE_START
G1 F3600
M204 S10000
G1 X147.874 Y124.29 E-.06265
G1 X147.679 Y124.29 E-.07426
G1 X147.483 Y124.29 E-.07427
G1 X147.288 Y124.29 E-.07426
G1 X147.092 Y124.29 E-.07427
G1 X147.092 Y123.237 E-.40029
; WIPE_END
G1 E-.04 F1800
G1 X147.56 Y121.178 Z3.84 F30000
G1 Z3.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.566812
G1 F1200
G1 X147.56 Y123.822 E.06996
; WIPE_START
G1 F3600
G1 X147.56 Y121.822 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.472 Y124.29 Z3.84 F30000
G1 Z3.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X151.472 Y120.71 E.06901
G1 X151.626 Y120.71 E.00296
G1 X151.821 Y120.71 E.00377
G1 X152.017 Y120.71 E.00377
G1 X152.212 Y120.71 E.00377
G1 X152.408 Y120.71 E.00377
G1 X152.408 Y121.178 E.00901
G1 X152.408 Y124.29 E.05999
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.212 Y124.29 E.00377
G1 X152.017 Y124.29 E.00377
G1 X151.821 Y124.29 E.00377
G1 X151.626 Y124.29 E.00377
G1 X151.532 Y124.29 E.0018
; WIPE_START
G1 F3600
M204 S10000
G1 X151.499 Y122.29 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.94 Y121.178 Z3.84 F30000
G1 Z3.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.566872
G1 F1200
G1 X151.94 Y123.822 E.06997
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X151.94 Y121.822 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/45
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.84 I-.063 J-1.215 P1  F30000
G1 X104.494 Y124.29 Z3.84
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.322 Y124.29 E.00332
G1 X104.149 Y124.29 E.00332
G1 X103.977 Y124.29 E.00332
G1 X103.804 Y124.29 E.00332
G1 X103.632 Y124.29 E.00332
G1 X103.632 Y120.71 E.06901
G1 X103.804 Y120.71 E.00332
G1 X103.977 Y120.71 E.00332
G1 X104.149 Y120.71 E.00332
G1 X104.322 Y120.71 E.00332
G1 X104.494 Y120.71 E.00332
G1 X104.604 Y120.71 E.00212
G1 X104.604 Y121.196 E.00937
G1 X104.604 Y121.596 E.00771
G1 X104.604 Y124.29 E.05193
G1 X104.554 Y124.29 E.00096
; WIPE_START
G1 F3150
M204 S10000
G1 X104.322 Y124.29 E-.08835
G1 X104.149 Y124.29 E-.06555
G1 X103.977 Y124.29 E-.06555
G1 X103.804 Y124.29 E-.06555
G1 X103.632 Y124.29 E-.06555
G1 X103.632 Y123.212 E-.40945
; WIPE_END
G1 E-.04 F1800
G1 X104.118 Y121.196 Z3.96 F30000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.603812
G1 F1200
G1 X104.118 Y123.804 E.0737
; WIPE_START
G1 F3600
G1 X104.118 Y121.804 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.868 Y124.29 Z3.96 F30000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.696 Y124.29 E.00332
G1 X108.523 Y124.29 E.00332
G1 X108.351 Y124.29 E.00332
G1 X108.178 Y124.29 E.00332
G1 X108.006 Y124.29 E.00332
G1 X107.896 Y124.29 E.00212
G1 X107.896 Y120.71 E.06901
G1 X108.006 Y120.71 E.00212
G1 X108.178 Y120.71 E.00332
G1 X108.351 Y120.71 E.00332
G1 X108.523 Y120.71 E.00332
G1 X108.696 Y120.71 E.00332
G1 X108.868 Y120.71 E.00332
G1 X108.868 Y121.196 E.00937
G1 X108.868 Y124.23 E.05848
; WIPE_START
G1 F1800
M204 S10000
G1 X108.696 Y124.29 E-.06939
G1 X108.523 Y124.29 E-.06554
G1 X108.351 Y124.29 E-.06553
G1 X108.178 Y124.29 E-.06554
G1 X108.006 Y124.29 E-.06553
G1 X107.896 Y124.29 E-.04177
G1 X107.896 Y123.272 E-.3867
; WIPE_END
G1 E-.04
G1 X108.382 Y121.196 Z3.96 F30000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.603752
G1 F1200
G1 X108.382 Y123.804 E.0737
; WIPE_START
G1 F3600
G1 X108.382 Y121.804 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.999 Y122.282 Z3.96 F30000
G1 X147.994 Y124.29 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X147.822 Y124.29 E.00332
G1 X147.649 Y124.29 E.00332
G1 X147.477 Y124.29 E.00332
G1 X147.304 Y124.29 E.00332
G1 X147.132 Y124.29 E.00332
G1 X147.132 Y120.71 E.06901
G1 X147.304 Y120.71 E.00332
G1 X147.477 Y120.71 E.00332
G1 X147.649 Y120.71 E.00332
G1 X147.822 Y120.71 E.00332
G1 X147.994 Y120.71 E.00332
G1 X148.104 Y120.71 E.00212
G1 X148.104 Y121.196 E.00937
G1 X148.104 Y121.596 E.00771
G1 X148.104 Y124.29 E.05193
G1 X148.054 Y124.29 E.00096
; WIPE_START
G1 F3150
M204 S10000
G1 X147.822 Y124.29 E-.08833
G1 X147.649 Y124.29 E-.06554
G1 X147.477 Y124.29 E-.06553
G1 X147.304 Y124.29 E-.06554
G1 X147.132 Y124.29 E-.06554
G1 X147.132 Y123.212 E-.40951
; WIPE_END
G1 E-.04 F1800
G1 X147.618 Y121.196 Z3.96 F30000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.603752
G1 F1200
G1 X147.618 Y123.804 E.0737
; WIPE_START
G1 F3600
G1 X147.618 Y121.804 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.506 Y124.29 Z3.96 F30000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X151.396 Y124.29 E.00212
G1 X151.396 Y120.71 E.06901
G1 X151.506 Y120.71 E.00212
G1 X151.678 Y120.71 E.00332
G1 X151.851 Y120.71 E.00332
G1 X152.023 Y120.71 E.00332
G1 X152.196 Y120.71 E.00332
G1 X152.368 Y120.71 E.00332
G1 X152.368 Y121.196 E.00937
G1 X152.368 Y124.29 E.05964
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.196 Y124.29 E.00332
G1 X152.023 Y124.29 E.00332
G1 X151.851 Y124.29 E.00332
G1 X151.678 Y124.29 E.00332
G1 X151.566 Y124.29 E.00217
; WIPE_START
G1 F3600
M204 S10000
G1 X151.396 Y124.29 E-.06453
G1 X151.396 Y122.46 E-.69547
; WIPE_END
G1 E-.04 F1800
G1 X151.882 Y121.196 Z3.96 F30000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.603812
G1 F1200
G1 X151.882 Y123.804 E.0737
; CHANGE_LAYER
; Z_HEIGHT: 3.68
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X151.882 Y121.804 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/45
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.96 I-1.207 J-.158 P1  F30000
G1 X151.557 Y124.29 Z3.96
G1 Z3.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X151.404 Y124.29 E.00295
G1 X151.304 Y124.29 E.00191
G1 X151.304 Y120.71 E.06901
G1 X151.404 Y120.71 E.00191
G1 X151.557 Y120.71 E.00295
G1 X151.71 Y120.71 E.00295
G1 X151.863 Y120.71 E.00295
G1 X152.016 Y120.71 E.00295
G1 X152.17 Y120.71 E.00295
G1 X152.323 Y120.71 E.00295
G1 X152.323 Y121.219 E.00981
G1 X152.323 Y124.29 E.05919
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.17 Y124.29 E.00295
G1 X152.016 Y124.29 E.00295
G1 X151.863 Y124.29 E.00295
G1 X151.71 Y124.29 E.00295
G1 X151.617 Y124.29 E.0018
; WIPE_START
G1 F3600
M204 S10000
G1 X151.404 Y124.29 E-.08101
G1 X151.304 Y124.29 E-.03768
G1 X151.304 Y122.602 E-.64131
; WIPE_END
G1 E-.04 F1800
G1 X151.814 Y121.219 Z4.08 F30000
G1 Z3.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.649772
G1 F1200
G1 X151.814 Y123.781 E.07816
; WIPE_START
G1 F3600
G1 X151.814 Y121.781 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.943 Y124.29 Z4.08 F30000
G1 Z3.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X147.79 Y124.29 E.00295
G1 X147.637 Y124.29 E.00295
G1 X147.483 Y124.29 E.00295
G1 X147.33 Y124.29 E.00295
G1 X147.177 Y124.29 E.00295
G1 X147.177 Y120.71 E.06901
G1 X147.33 Y120.71 E.00295
G1 X147.483 Y120.71 E.00295
G1 X147.637 Y120.71 E.00295
G1 X147.79 Y120.71 E.00295
G1 X147.943 Y120.71 E.00295
G1 X148.096 Y120.71 E.00295
G1 X148.196 Y120.71 E.00192
G1 X148.196 Y121.219 E.00982
G1 X148.196 Y124.29 E.05919
G1 X148.096 Y124.29 E.00191
G1 X148.003 Y124.29 E.0018
; WIPE_START
G1 F3150
M204 S10000
G1 X147.79 Y124.29 E-.08101
G1 X147.637 Y124.29 E-.05821
G1 X147.483 Y124.29 E-.0582
G1 X147.33 Y124.29 E-.05821
G1 X147.177 Y124.29 E-.05821
G1 X147.177 Y123.116 E-.44616
; WIPE_END
G1 E-.04 F1800
G1 X147.686 Y121.219 Z4.08 F30000
G1 Z3.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.649912
G1 F1200
G1 X147.686 Y123.781 E.07817
; WIPE_START
G1 F3600
G1 X147.686 Y121.781 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.07 Y122.273 Z4.08 F30000
G1 X108.823 Y124.29 Z4.08
G1 Z3.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.67 Y124.29 E.00295
G1 X108.517 Y124.29 E.00295
G1 X108.363 Y124.29 E.00295
G1 X108.21 Y124.29 E.00295
G1 X108.057 Y124.29 E.00295
G1 X107.904 Y124.29 E.00295
G1 X107.804 Y124.29 E.00192
G1 X107.804 Y120.71 E.06901
G1 X107.904 Y120.71 E.00191
G1 X108.057 Y120.71 E.00295
G1 X108.21 Y120.71 E.00295
G1 X108.363 Y120.71 E.00295
G1 X108.517 Y120.71 E.00295
G1 X108.67 Y120.71 E.00295
G1 X108.823 Y120.71 E.00295
G1 X108.823 Y121.219 E.00982
G1 X108.823 Y124.23 E.05803
; WIPE_START
G1 F1800
M204 S10000
G1 X108.67 Y124.29 E-.06251
G1 X108.517 Y124.29 E-.05821
G1 X108.363 Y124.29 E-.05821
G1 X108.21 Y124.29 E-.05821
G1 X108.057 Y124.29 E-.05821
G1 X107.904 Y124.29 E-.0582
G1 X107.804 Y124.29 E-.03775
G1 X107.804 Y123.32 E-.3687
; WIPE_END
G1 E-.04
G1 X108.314 Y121.219 Z4.08 F30000
G1 Z3.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.649932
G1 F1200
G1 X108.314 Y123.781 E.07817
; WIPE_START
G1 F3600
G1 X108.314 Y121.781 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.443 Y124.29 Z4.08 F30000
G1 Z3.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.29 Y124.29 E.00295
G1 X104.137 Y124.29 E.00295
G1 X103.984 Y124.29 E.00295
M73 P90 R1
G1 X103.83 Y124.29 E.00295
G1 X103.677 Y124.29 E.00295
G1 X103.677 Y120.71 E.06901
G1 X103.83 Y120.71 E.00295
G1 X103.984 Y120.71 E.00295
G1 X104.137 Y120.71 E.00295
G1 X104.29 Y120.71 E.00295
G1 X104.443 Y120.71 E.00295
G1 X104.596 Y120.71 E.00295
G1 X104.696 Y120.71 E.00191
G1 X104.696 Y121.219 E.00981
G1 X104.696 Y124.29 E.05919
G1 X104.596 Y124.29 E.00191
G1 X104.503 Y124.29 E.0018
; WIPE_START
G1 F3150
M204 S10000
G1 X104.29 Y124.29 E-.081
G1 X104.137 Y124.29 E-.05821
G1 X103.984 Y124.29 E-.0582
G1 X103.83 Y124.29 E-.0582
G1 X103.677 Y124.29 E-.05821
G1 X103.677 Y123.116 E-.44617
; WIPE_END
G1 E-.04 F1800
G1 X104.186 Y121.219 Z4.08 F30000
G1 Z3.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.649792
G1 F1200
G1 X104.186 Y123.781 E.07816
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X104.186 Y121.781 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/45
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.08 I-1.212 J.108 P1  F30000
G1 X104.411 Y124.29 Z4.08
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.274 Y124.29 E.00263
G1 X104.138 Y124.29 E.00263
G1 X104.001 Y124.29 E.00263
G1 X103.865 Y124.29 E.00263
G1 X103.728 Y124.29 E.00263
G1 X103.728 Y120.71 E.06901
G1 X103.865 Y120.71 E.00263
G1 X104.001 Y120.71 E.00263
G1 X104.138 Y120.71 E.00263
G1 X104.274 Y120.71 E.00263
G1 X104.411 Y120.71 E.00263
G1 X104.547 Y120.71 E.00263
G1 X104.684 Y120.71 E.00263
G1 X104.805 Y120.71 E.00235
G1 X104.805 Y121.249 E.01038
G1 X104.805 Y124.29 E.05863
G1 X104.684 Y124.29 E.00235
G1 X104.547 Y124.29 E.00263
G1 X104.471 Y124.29 E.00147
; WIPE_START
G1 F3150
M204 S10000
G1 X104.274 Y124.29 E-.07465
G1 X104.138 Y124.29 E-.05186
G1 X104.001 Y124.29 E-.05185
G1 X103.865 Y124.29 E-.05186
G1 X103.728 Y124.29 E-.05186
G1 X103.728 Y123.032 E-.47791
; WIPE_END
G1 E-.04 F1800
G1 X104.267 Y121.249 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.708572
G1 F1200
G1 X104.267 Y123.751 E.08356
; WIPE_START
G1 F3600
G1 X104.267 Y121.751 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.771 Y124.29 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.635 Y124.29 E.00263
G1 X108.499 Y124.29 E.00263
G1 X108.362 Y124.29 E.00263
G1 X108.226 Y124.29 E.00263
G1 X108.089 Y124.29 E.00263
G1 X107.953 Y124.29 E.00263
G1 X107.816 Y124.29 E.00263
G1 X107.695 Y124.29 E.00235
G1 X107.695 Y120.71 E.06901
G1 X107.816 Y120.71 E.00235
G1 X107.953 Y120.71 E.00263
G1 X108.089 Y120.71 E.00263
G1 X108.226 Y120.71 E.00263
G1 X108.362 Y120.71 E.00263
G1 X108.499 Y120.71 E.00263
G1 X108.635 Y120.71 E.00263
G1 X108.771 Y120.71 E.00263
G1 X108.771 Y121.248 E.01038
G1 X108.771 Y124.23 E.05747
; WIPE_START
G1 F1800
M204 S10000
G1 X108.635 Y124.29 E-.05663
G1 X108.499 Y124.29 E-.05184
G1 X108.362 Y124.29 E-.05184
G1 X108.226 Y124.29 E-.05184
G1 X108.089 Y124.29 E-.05184
G1 X107.953 Y124.29 E-.05184
G1 X107.816 Y124.29 E-.05184
G1 X107.695 Y124.29 E-.0463
G1 X107.695 Y123.379 E-.34603
; WIPE_END
G1 E-.04
G1 X108.233 Y121.248 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.708292
G1 F1200
G1 X108.233 Y123.752 E.08354
; WIPE_START
G1 F3600
G1 X108.233 Y121.752 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.85 Y122.239 Z4.2 F30000
G1 X147.911 Y124.29 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X147.774 Y124.29 E.00263
G1 X147.638 Y124.29 E.00263
G1 X147.501 Y124.29 E.00263
G1 X147.365 Y124.29 E.00263
G1 X147.229 Y124.29 E.00263
G1 X147.229 Y120.71 E.06901
G1 X147.365 Y120.71 E.00263
G1 X147.501 Y120.71 E.00263
G1 X147.638 Y120.71 E.00263
G1 X147.774 Y120.71 E.00263
G1 X147.911 Y120.71 E.00263
G1 X148.047 Y120.71 E.00263
G1 X148.183 Y120.71 E.00263
G1 X148.305 Y120.71 E.00235
G1 X148.305 Y121.248 E.01038
G1 X148.305 Y124.29 E.05863
G1 X148.183 Y124.29 E.00235
G1 X148.047 Y124.29 E.00263
G1 X147.971 Y124.29 E.00147
; WIPE_START
G1 F3150
M204 S10000
G1 X147.774 Y124.29 E-.07464
G1 X147.638 Y124.29 E-.05184
G1 X147.501 Y124.29 E-.05184
G1 X147.365 Y124.29 E-.05184
G1 X147.229 Y124.29 E-.05184
G1 X147.229 Y123.032 E-.47802
; WIPE_END
G1 E-.04 F1800
G1 X147.767 Y121.248 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.708292
G1 F1200
G1 X147.767 Y123.752 E.08354
; WIPE_START
G1 F3600
G1 X147.767 Y121.752 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.589 Y124.29 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X151.453 Y124.29 E.00263
G1 X151.316 Y124.29 E.00263
G1 X151.195 Y124.29 E.00235
G1 X151.195 Y120.71 E.06901
G1 X151.316 Y120.71 E.00235
G1 X151.453 Y120.71 E.00263
G1 X151.589 Y120.71 E.00263
G1 X151.726 Y120.71 E.00263
G1 X151.862 Y120.71 E.00263
G1 X151.999 Y120.71 E.00263
G1 X152.135 Y120.71 E.00263
G1 X152.272 Y120.71 E.00263
G1 X152.272 Y121.249 E.01038
G1 X152.272 Y124.29 E.05863
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.135 Y124.29 E.00263
G1 X151.999 Y124.29 E.00263
G1 X151.862 Y124.29 E.00263
G1 X151.726 Y124.29 E.00263
G1 X151.649 Y124.29 E.00147
; WIPE_START
G1 F3600
M204 S10000
G1 X151.453 Y124.29 E-.07465
G1 X151.316 Y124.29 E-.05186
G1 X151.195 Y124.29 E-.04628
G1 X151.195 Y122.745 E-.58721
; WIPE_END
G1 E-.04 F1800
G1 X151.733 Y121.249 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.708552
G1 F1200
G1 X151.733 Y123.751 E.08356
; CHANGE_LAYER
; Z_HEIGHT: 3.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X151.733 Y121.751 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/45
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.2 I-1.206 J-.16 P1  F30000
G1 X151.448 Y123.903 Z4.2
G1 Z3.92
G1 E.8 F1800
; LINE_WIDTH: 0.404922
G1 F1200
G1 X151.448 Y121.097 E.05203
G1 X151.827 Y121.097 E.00703
G1 X151.827 Y121.286 E.00351
G1 X151.827 Y123.903 E.04852
G1 X151.508 Y123.903 E.00592
M204 S250
G1 X151.177 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X151.061 Y124.29 E.00224
G1 X151.061 Y120.71 E.06901
G1 X151.177 Y120.71 E.00224
G1 X151.307 Y120.71 E.0025
G1 X151.436 Y120.71 E.0025
G1 X151.566 Y120.71 E.0025
G1 X151.695 Y120.71 E.0025
G1 X151.825 Y120.71 E.0025
G1 X151.955 Y120.71 E.0025
G1 X152.084 Y120.71 E.0025
G1 X152.214 Y120.71 E.0025
G1 X152.214 Y121.286 E.01111
G1 X152.214 Y124.29 E.0579
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.084 Y124.29 E.0025
G1 X151.955 Y124.29 E.0025
G1 X151.825 Y124.29 E.0025
G1 X151.695 Y124.29 E.0025
G1 X151.566 Y124.29 E.0025
G1 X151.436 Y124.29 E.0025
G1 X151.307 Y124.29 E.0025
G1 X151.237 Y124.29 E.00134
; WIPE_START
G1 F3600
M204 S10000
G1 X151.061 Y124.29 E-.06698
G1 X151.061 Y122.466 E-.69303
; WIPE_END
G1 E-.04 F1800
G1 X148.052 Y123.903 Z4.32 F30000
G1 Z3.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.405032
G1 F1200
G1 X147.673 Y123.903 E.00703
G1 X147.673 Y121.097 E.05204
G1 X148.052 Y121.097 E.00703
G1 X148.052 Y121.286 E.00352
G1 X148.052 Y123.843 E.04741
M204 S250
G1 X148.323 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X148.193 Y124.29 E.0025
G1 X148.064 Y124.29 E.0025
G1 X147.934 Y124.29 E.0025
G1 X147.804 Y124.29 E.0025
G1 X147.675 Y124.29 E.0025
G1 X147.545 Y124.29 E.0025
G1 X147.416 Y124.29 E.0025
G1 X147.286 Y124.29 E.0025
G1 X147.286 Y120.71 E.06901
G1 X147.416 Y120.71 E.0025
G1 X147.545 Y120.71 E.0025
G1 X147.675 Y120.71 E.0025
G1 X147.804 Y120.71 E.0025
G1 X147.934 Y120.71 E.0025
G1 X148.064 Y120.71 E.0025
G1 X148.193 Y120.71 E.0025
G1 X148.323 Y120.71 E.0025
G1 X148.439 Y120.71 E.00224
G1 X148.439 Y121.286 E.01111
G1 X148.439 Y124.29 E.0579
G1 X148.383 Y124.29 E.00108
; WIPE_START
G1 F1800
M204 S10000
G1 X148.193 Y124.29 E-.07204
G1 X148.064 Y124.29 E-.04924
G1 X147.934 Y124.29 E-.04924
G1 X147.804 Y124.29 E-.04924
G1 X147.675 Y124.29 E-.04924
G1 X147.545 Y124.29 E-.04924
G1 X147.416 Y124.29 E-.04924
G1 X147.286 Y124.29 E-.04924
G1 X147.286 Y123.387 E-.3433
; WIPE_END
G1 E-.04
G1 X139.654 Y123.488 Z4.32 F30000
G1 X108.327 Y123.903 Z4.32
G1 Z3.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.405032
G1 F1200
G1 X107.948 Y123.903 E.00703
G1 X107.948 Y121.097 E.05204
G1 X108.327 Y121.097 E.00703
G1 X108.327 Y121.286 E.00352
G1 X108.327 Y123.843 E.04741
M204 S250
G1 X108.714 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.584 Y124.29 E.0025
G1 X108.455 Y124.29 E.0025
G1 X108.325 Y124.29 E.0025
G1 X108.196 Y124.29 E.0025
G1 X108.066 Y124.29 E.0025
G1 X107.936 Y124.29 E.0025
G1 X107.807 Y124.29 E.0025
G1 X107.677 Y124.29 E.0025
G1 X107.561 Y124.29 E.00224
G1 X107.561 Y120.71 E.06901
G1 X107.677 Y120.71 E.00224
G1 X107.807 Y120.71 E.0025
G1 X107.936 Y120.71 E.0025
G1 X108.066 Y120.71 E.0025
G1 X108.196 Y120.71 E.0025
G1 X108.325 Y120.71 E.0025
G1 X108.455 Y120.71 E.0025
G1 X108.584 Y120.71 E.0025
G1 X108.714 Y120.71 E.0025
G1 X108.714 Y121.286 E.01111
G1 X108.714 Y124.23 E.05674
; WIPE_START
G1 F1800
M204 S10000
G1 X108.584 Y124.29 E-.05426
G1 X108.455 Y124.29 E-.04924
G1 X108.325 Y124.29 E-.04924
G1 X108.196 Y124.29 E-.04923
G1 X108.066 Y124.29 E-.04924
G1 X107.936 Y124.29 E-.04924
G1 X107.807 Y124.29 E-.04923
G1 X107.677 Y124.29 E-.04924
G1 X107.561 Y124.29 E-.04418
G1 X107.561 Y123.456 E-.31691
; WIPE_END
G1 E-.04
G1 X104.552 Y123.903 Z4.32 F30000
G1 Z3.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.404922
G1 F1200
G1 X104.173 Y123.903 E.00703
G1 X104.173 Y121.097 E.05203
G1 X104.552 Y121.097 E.00703
G1 X104.552 Y121.286 E.00351
G1 X104.552 Y123.843 E.0474
M204 S250
G1 X104.823 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.693 Y124.29 E.0025
G1 X104.564 Y124.29 E.0025
G1 X104.434 Y124.29 E.0025
G1 X104.305 Y124.29 E.0025
G1 X104.175 Y124.29 E.0025
G1 X104.045 Y124.29 E.0025
G1 X103.916 Y124.29 E.0025
G1 X103.786 Y124.29 E.0025
G1 X103.786 Y120.71 E.06901
G1 X103.916 Y120.71 E.0025
G1 X104.045 Y120.71 E.0025
G1 X104.175 Y120.71 E.0025
G1 X104.305 Y120.71 E.0025
G1 X104.434 Y120.71 E.0025
G1 X104.564 Y120.71 E.0025
G1 X104.693 Y120.71 E.0025
G1 X104.823 Y120.71 E.0025
G1 X104.939 Y120.71 E.00224
G1 X104.939 Y121.286 E.01111
G1 X104.939 Y124.29 E.0579
G1 X104.883 Y124.29 E.00108
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X104.693 Y124.29 E-.07203
G1 X104.564 Y124.29 E-.04923
G1 X104.434 Y124.29 E-.04923
G1 X104.305 Y124.29 E-.04923
M73 P91 R1
G1 X104.175 Y124.29 E-.04923
G1 X104.045 Y124.29 E-.04923
G1 X103.916 Y124.29 E-.04923
G1 X103.786 Y124.29 E-.04923
G1 X103.786 Y123.386 E-.34338
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 33/45
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.32 I-.579 J1.07 P1  F30000
G1 X104.694 Y123.877 Z4.32
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.456592
G1 F1200
G1 X104.263 Y123.877 E.00908
G1 X104.263 Y121.123 E.05803
G1 X104.694 Y121.123 E.00908
G1 X104.694 Y121.338 E.00454
G1 X104.694 Y123.817 E.05223
M204 S250
G1 X104.828 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.706 Y124.29 E.00236
G1 X104.584 Y124.29 E.00236
G1 X104.462 Y124.29 E.00236
G1 X104.339 Y124.29 E.00236
G1 X104.217 Y124.29 E.00236
G1 X104.095 Y124.29 E.00236
G1 X103.973 Y124.29 E.00236
G1 X103.851 Y124.29 E.00236
G1 X103.851 Y120.71 E.06901
G1 X103.973 Y120.71 E.00236
G1 X104.095 Y120.71 E.00236
G1 X104.217 Y120.71 E.00236
G1 X104.339 Y120.71 E.00236
G1 X104.462 Y120.71 E.00236
G1 X104.584 Y120.71 E.00236
G1 X104.706 Y120.71 E.00236
G1 X104.828 Y120.71 E.00236
G1 X104.95 Y120.71 E.00236
G1 X105.073 Y120.71 E.00236
G1 X105.106 Y120.71 E.00065
G1 X105.106 Y121.338 E.0121
G1 X105.106 Y124.29 E.0569
G1 X105.073 Y124.29 E.00065
G1 X104.95 Y124.29 E.00236
G1 X104.888 Y124.29 E.0012
; WIPE_START
G1 F1800
M204 S10000
G1 X104.706 Y124.29 E-.06924
G1 X104.584 Y124.29 E-.04644
G1 X104.462 Y124.29 E-.04644
G1 X104.339 Y124.29 E-.04644
G1 X104.217 Y124.29 E-.04644
G1 X104.095 Y124.29 E-.04644
G1 X103.973 Y124.29 E-.04644
G1 X103.851 Y124.29 E-.04644
G1 X103.851 Y123.328 E-.36569
; WIPE_END
G1 E-.04
G1 X108.237 Y123.878 Z4.44 F30000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.456442
G1 F1200
G1 X107.806 Y123.878 E.00907
G1 X107.806 Y121.122 E.05802
G1 X108.237 Y121.122 E.00907
G1 X108.237 Y121.338 E.00453
G1 X108.237 Y123.818 E.05222
M204 S250
G1 X108.649 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.527 Y124.29 E.00235
G1 X108.405 Y124.29 E.00235
G1 X108.283 Y124.29 E.00236
G1 X108.16 Y124.29 E.00235
G1 X108.038 Y124.29 E.00236
G1 X107.916 Y124.29 E.00235
G1 X107.794 Y124.29 E.00236
G1 X107.672 Y124.29 E.00235
G1 X107.55 Y124.29 E.00235
G1 X107.427 Y124.29 E.00236
G1 X107.394 Y124.29 E.00065
G1 X107.394 Y120.71 E.06901
G1 X107.427 Y120.71 E.00065
G1 X107.55 Y120.71 E.00236
G1 X107.672 Y120.71 E.00235
G1 X107.794 Y120.71 E.00235
G1 X107.916 Y120.71 E.00236
G1 X108.038 Y120.71 E.00235
G1 X108.16 Y120.71 E.00236
G1 X108.283 Y120.71 E.00235
G1 X108.405 Y120.71 E.00236
G1 X108.527 Y120.71 E.00235
G1 X108.649 Y120.71 E.00236
G1 X108.649 Y121.338 E.0121
G1 X108.649 Y124.23 E.05575
; WIPE_START
G1 F1800
M204 S10000
G1 X108.527 Y124.29 E-.05172
G1 X108.405 Y124.29 E-.04642
G1 X108.283 Y124.29 E-.04643
G1 X108.16 Y124.29 E-.04642
G1 X108.038 Y124.29 E-.04643
G1 X107.916 Y124.29 E-.04642
G1 X107.794 Y124.29 E-.04643
G1 X107.672 Y124.29 E-.04642
G1 X107.55 Y124.29 E-.04642
G1 X107.427 Y124.29 E-.04643
G1 X107.394 Y124.29 E-.01287
G1 X107.394 Y123.56 E-.27757
; WIPE_END
G1 E-.04
G1 X115.026 Y123.619 Z4.44 F30000
G1 X148.194 Y123.878 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.456432
G1 F1200
G1 X147.763 Y123.878 E.00907
G1 X147.763 Y121.122 E.05801
G1 X148.194 Y121.122 E.00907
G1 X148.194 Y121.338 E.00453
G1 X148.194 Y123.818 E.05222
M204 S250
G1 X148.328 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X148.206 Y124.29 E.00235
G1 X148.084 Y124.29 E.00235
G1 X147.962 Y124.29 E.00236
G1 X147.84 Y124.29 E.00235
G1 X147.717 Y124.29 E.00235
G1 X147.595 Y124.29 E.00236
G1 X147.473 Y124.29 E.00235
G1 X147.351 Y124.29 E.00236
G1 X147.351 Y120.71 E.06901
G1 X147.473 Y120.71 E.00235
G1 X147.595 Y120.71 E.00235
G1 X147.717 Y120.71 E.00236
G1 X147.84 Y120.71 E.00235
G1 X147.962 Y120.71 E.00235
G1 X148.084 Y120.71 E.00236
G1 X148.206 Y120.71 E.00235
G1 X148.328 Y120.71 E.00235
G1 X148.45 Y120.71 E.00236
G1 X148.573 Y120.71 E.00235
G1 X148.606 Y120.71 E.00065
G1 X148.606 Y121.338 E.0121
G1 X148.606 Y124.29 E.0569
G1 X148.573 Y124.29 E.00065
G1 X148.45 Y124.29 E.00235
G1 X148.388 Y124.29 E.0012
; WIPE_START
G1 F1800
M204 S10000
G1 X148.206 Y124.29 E-.06922
G1 X148.084 Y124.29 E-.04642
G1 X147.962 Y124.29 E-.04643
G1 X147.84 Y124.29 E-.04642
G1 X147.717 Y124.29 E-.04642
G1 X147.595 Y124.29 E-.04643
G1 X147.473 Y124.29 E-.04642
G1 X147.351 Y124.29 E-.04643
G1 X147.351 Y123.327 E-.36579
; WIPE_END
G1 E-.04
G1 X151.306 Y123.877 Z4.44 F30000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.456592
G1 F1200
G1 X151.306 Y121.123 E.05803
G1 X151.737 Y121.123 E.00908
G1 X151.737 Y121.338 E.00454
G1 X151.737 Y123.877 E.05349
G1 X151.366 Y123.877 E.00781
M204 S250
G1 X151.172 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X151.05 Y124.29 E.00236
G1 X150.927 Y124.29 E.00236
G1 X150.894 Y124.29 E.00065
G1 X150.894 Y120.71 E.06901
G1 X150.927 Y120.71 E.00065
G1 X151.05 Y120.71 E.00236
G1 X151.172 Y120.71 E.00236
G1 X151.294 Y120.71 E.00236
G1 X151.416 Y120.71 E.00236
G1 X151.538 Y120.71 E.00236
G1 X151.661 Y120.71 E.00236
G1 X151.783 Y120.71 E.00236
G1 X151.905 Y120.71 E.00236
G1 X152.027 Y120.71 E.00236
G1 X152.149 Y120.71 E.00236
G1 X152.149 Y121.338 E.0121
G1 X152.149 Y124.29 E.0569
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X152.027 Y124.29 E.00236
G1 X151.905 Y124.29 E.00236
G1 X151.783 Y124.29 E.00236
G1 X151.661 Y124.29 E.00236
G1 X151.538 Y124.29 E.00236
G1 X151.416 Y124.29 E.00236
G1 X151.294 Y124.29 E.00236
G1 X151.232 Y124.29 E.0012
; CHANGE_LAYER
; Z_HEIGHT: 4.16
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
M204 S10000
G1 X151.05 Y124.29 E-.06924
G1 X150.927 Y124.29 E-.04644
G1 X150.894 Y124.29 E-.01284
G1 X150.894 Y122.628 E-.63148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/45
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.44 I-1.196 J.223 P1  F30000
G1 X151.119 Y123.839 Z4.44
G1 Z4.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.533102
G1 F1200
G1 X151.119 Y121.161 E.06644
G1 X151.627 Y121.161 E.01259
G1 X151.627 Y121.414 E.00629
G1 X151.627 Y123.839 E.06015
G1 X151.179 Y123.839 E.0111
M204 S250
G1 X150.849 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X150.737 Y124.29 E.00215
G1 F600
G1 X150.668 Y124.29 E.00132
G1 X150.668 Y120.71 E.06901
G1 X150.737 Y120.71 E.00132
G1 F1200
G1 X150.849 Y120.71 E.00215
G1 X150.96 Y120.71 E.00215
G1 X151.072 Y120.71 E.00215
G1 X151.184 Y120.71 E.00215
G1 X151.296 Y120.71 E.00215
G1 X151.407 Y120.71 E.00215
G1 X151.519 Y120.71 E.00215
G1 X151.631 Y120.71 E.00215
G1 X151.742 Y120.71 E.00215
G1 X151.854 Y120.71 E.00215
G1 X151.966 Y120.71 E.00215
G1 X152.077 Y120.71 E.00215
G1 X152.077 Y121.414 E.01358
G1 X152.077 Y124.29 E.05543
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.966 Y124.29 E.00215
G1 X151.854 Y124.29 E.00215
G1 X151.742 Y124.29 E.00215
G1 X151.631 Y124.29 E.00215
G1 X151.519 Y124.29 E.00215
G1 X151.407 Y124.29 E.00215
G1 X151.296 Y124.29 E.00215
G1 X151.184 Y124.29 E.00215
G1 X151.072 Y124.29 E.00215
G1 X150.96 Y124.29 E.00215
G1 X150.909 Y124.29 E.001
; WIPE_START
G1 F3600
M204 S10000
G1 X150.737 Y124.29 E-.06524
G1 X150.668 Y124.29 E-.0261
G1 X150.668 Y122.53 E-.66866
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.56 I-.604 J-1.056 P1  F30000
G1 X148.381 Y123.839 Z4.56
G1 Z4.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.533182
G1 F1200
G1 X147.873 Y123.839 E.01259
G1 X147.873 Y121.161 E.06645
G1 X148.381 Y121.161 E.01259
G1 X148.381 Y121.415 E.00629
G1 X148.381 Y123.779 E.05867
M204 S250
G1 X148.651 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X148.539 Y124.29 E.00215
G1 X148.428 Y124.29 E.00215
G1 X148.316 Y124.29 E.00215
G1 X148.204 Y124.29 E.00215
G1 X148.093 Y124.29 E.00215
G1 X147.981 Y124.29 E.00215
G1 X147.869 Y124.29 E.00215
G1 X147.758 Y124.29 E.00215
G1 X147.646 Y124.29 E.00215
G1 X147.534 Y124.29 E.00215
G1 X147.423 Y124.29 E.00215
G1 X147.423 Y120.71 E.06901
G1 X147.534 Y120.71 E.00215
G1 X147.646 Y120.71 E.00215
G1 X147.758 Y120.71 E.00215
G1 X147.869 Y120.71 E.00215
G1 X147.981 Y120.71 E.00215
G1 X148.093 Y120.71 E.00215
G1 X148.204 Y120.71 E.00215
G1 X148.316 Y120.71 E.00215
G1 X148.428 Y120.71 E.00215
G1 X148.539 Y120.71 E.00215
G1 X148.651 Y120.71 E.00215
G1 X148.763 Y120.71 E.00215
G1 X148.832 Y120.71 E.00132
G1 X148.832 Y121.015 E.00587
G1 X148.832 Y121.415 E.00771
G1 F600
G1 X148.832 Y124.29 E.05543
G1 X148.763 Y124.29 E.00132
G1 F864.336
G1 X148.711 Y124.29 E.001
; WIPE_START
M204 S10000
G1 X148.539 Y124.29 E-.06524
G1 X148.428 Y124.29 E-.04245
G1 X148.316 Y124.29 E-.04245
G1 X148.204 Y124.29 E-.04245
G1 X148.093 Y124.29 E-.04245
G1 X147.981 Y124.29 E-.04244
G1 X147.869 Y124.29 E-.04245
G1 X147.758 Y124.29 E-.04245
G1 X147.646 Y124.29 E-.04245
G1 X147.534 Y124.29 E-.04245
G1 X147.423 Y124.29 E-.04245
G1 X147.423 Y123.579 E-.2703
; WIPE_END
G1 E-.04 F1800
G1 X139.79 Y123.629 Z4.56 F30000
G1 X108.127 Y123.839 Z4.56
G1 Z4.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.533182
G1 F1200
G1 X107.619 Y123.839 E.01259
G1 X107.619 Y121.161 E.06645
G1 X108.127 Y121.161 E.01259
G1 X108.127 Y121.415 E.00629
G1 X108.127 Y123.779 E.05867
M204 S250
G1 X108.577 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.466 Y124.29 E.00215
G1 X108.354 Y124.29 E.00215
G1 X108.242 Y124.29 E.00215
G1 X108.131 Y124.29 E.00215
G1 X108.019 Y124.29 E.00215
G1 X107.907 Y124.29 E.00215
G1 X107.796 Y124.29 E.00215
G1 X107.684 Y124.29 E.00215
G1 X107.572 Y124.29 E.00215
G1 X107.461 Y124.29 E.00215
G1 X107.349 Y124.29 E.00215
G1 X107.237 Y124.29 E.00215
G1 F600
G1 X107.168 Y124.29 E.00132
G1 X107.168 Y120.71 E.06901
G1 X107.237 Y120.71 E.00132
G1 F1200
G1 X107.349 Y120.71 E.00215
G1 X107.46 Y120.71 E.00215
G1 X107.572 Y120.71 E.00215
G1 X107.684 Y120.71 E.00215
G1 X107.796 Y120.71 E.00215
G1 X107.907 Y120.71 E.00215
G1 X108.019 Y120.71 E.00215
G1 X108.131 Y120.71 E.00215
G1 X108.242 Y120.71 E.00215
G1 X108.354 Y120.71 E.00215
G1 X108.466 Y120.71 E.00215
G1 X108.577 Y120.71 E.00215
G1 X108.577 Y121.415 E.01358
G1 X108.577 Y124.23 E.05427
; WIPE_START
G1 F1800
M204 S10000
G1 X108.466 Y124.29 E-.04818
G1 X108.354 Y124.29 E-.04245
G1 X108.242 Y124.29 E-.04245
G1 X108.131 Y124.29 E-.04245
G1 X108.019 Y124.29 E-.04245
G1 X107.907 Y124.29 E-.04244
G1 X107.796 Y124.29 E-.04245
G1 X107.684 Y124.29 E-.04245
G1 X107.572 Y124.29 E-.04245
G1 X107.461 Y124.29 E-.04245
G1 X107.349 Y124.29 E-.04244
G1 X107.237 Y124.29 E-.04245
G1 X107.168 Y124.29 E-.02612
G1 X107.168 Y123.714 E-.2188
; WIPE_END
G1 E-.04
G17
G3 Z4.56 I-.066 J-1.215 P1  F30000
G1 X104.881 Y123.839 Z4.56
G1 Z4.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.533102
G1 F1200
G1 X104.373 Y123.839 E.01259
G1 X104.373 Y121.161 E.06644
G1 X104.881 Y121.161 E.01259
G1 X104.881 Y121.414 E.00629
G1 X104.881 Y123.779 E.05866
M204 S250
G1 X105.151 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X105.04 Y124.29 E.00215
G1 X104.928 Y124.29 E.00215
G1 X104.816 Y124.29 E.00215
G1 X104.704 Y124.29 E.00215
G1 X104.593 Y124.29 E.00215
G1 X104.481 Y124.29 E.00215
M73 P92 R1
G1 X104.369 Y124.29 E.00215
G1 X104.258 Y124.29 E.00215
G1 X104.146 Y124.29 E.00215
G1 X104.034 Y124.29 E.00215
G1 X103.923 Y124.29 E.00215
G1 X103.923 Y120.71 E.06901
G1 X104.034 Y120.71 E.00215
G1 X104.146 Y120.71 E.00215
G1 X104.258 Y120.71 E.00215
G1 X104.369 Y120.71 E.00215
G1 X104.481 Y120.71 E.00215
G1 X104.593 Y120.71 E.00215
G1 X104.704 Y120.71 E.00215
G1 X104.816 Y120.71 E.00215
G1 X104.928 Y120.71 E.00215
G1 X105.04 Y120.71 E.00215
G1 X105.151 Y120.71 E.00215
G1 X105.263 Y120.71 E.00215
G1 X105.332 Y120.71 E.00132
G1 X105.332 Y121.014 E.00587
G1 X105.332 Y121.414 E.00771
G1 F600
G1 X105.332 Y124.29 E.05543
G1 X105.263 Y124.29 E.00132
G1 F864.28
G1 X105.211 Y124.29 E.001
; CHANGE_LAYER
; Z_HEIGHT: 4.28
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F864.28
M204 S10000
G1 X105.04 Y124.29 E-.06524
G1 X104.928 Y124.29 E-.04244
G1 X104.816 Y124.29 E-.04244
G1 X104.704 Y124.29 E-.04244
G1 X104.593 Y124.29 E-.04244
G1 X104.481 Y124.29 E-.04244
G1 X104.369 Y124.29 E-.04244
G1 X104.258 Y124.29 E-.04244
G1 X104.146 Y124.29 E-.04244
G1 X104.034 Y124.29 E-.04244
G1 X103.923 Y124.29 E-.04244
G1 X103.923 Y123.579 E-.27034
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/45
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.56 I-.259 J1.189 P1  F30000
G1 X105.309 Y123.881 Z4.56
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X104.412 Y123.881 E.01862
G1 X104.412 Y121.119 E.05728
G1 X105.309 Y121.119 E.01862
G1 X105.309 Y121.568 E.00931
G1 X105.309 Y123.821 E.04673
M204 S250
G1 X105.345 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X105.255 Y124.29 E.00173
G1 X105.166 Y124.29 E.00173
G1 X105.076 Y124.29 E.00173
G1 X104.987 Y124.29 E.00173
G1 X104.897 Y124.29 E.00173
G1 X104.808 Y124.29 E.00173
G1 X104.718 Y124.29 E.00173
G1 X104.629 Y124.29 E.00173
G1 X104.539 Y124.29 E.00173
G1 X104.45 Y124.29 E.00173
G1 X104.36 Y124.29 E.00173
G1 X104.271 Y124.29 E.00173
G1 X104.181 Y124.29 E.00173
G1 X104.092 Y124.29 E.00173
G1 X104.002 Y124.29 E.00173
G1 X104.002 Y120.71 E.06901
G1 X104.092 Y120.71 E.00173
G1 X104.181 Y120.71 E.00173
G1 X104.271 Y120.71 E.00173
G1 X104.36 Y120.71 E.00173
G1 X104.45 Y120.71 E.00173
G1 X104.539 Y120.71 E.00173
G1 X104.629 Y120.71 E.00173
G1 X104.718 Y120.71 E.00173
G1 X104.808 Y120.71 E.00173
G1 X104.897 Y120.71 E.00173
G1 X104.987 Y120.71 E.00173
G1 X105.076 Y120.71 E.00173
G1 X105.166 Y120.71 E.00173
G1 X105.255 Y120.71 E.00173
G1 X105.345 Y120.71 E.00173
G1 F1088.113
G1 X105.434 Y120.71 E.00173
G1 F600
G1 X105.524 Y120.71 E.00173
G1 X105.614 Y120.71 E.00173
G1 X105.703 Y120.71 E.00173
G1 X105.718 Y120.71 E.00029
G1 X105.718 Y121.568 E.01654
G1 X105.718 Y124.29 E.05247
G1 X105.703 Y124.29 E.00029
G1 X105.614 Y124.29 E.00173
G1 X105.524 Y124.29 E.00173
G1 X105.434 Y124.29 E.00173
G1 F744.988
G1 X105.405 Y124.29 E.00057
; WIPE_START
M204 S10000
G1 X105.255 Y124.29 E-.05681
G1 X105.166 Y124.29 E-.03402
G1 X105.076 Y124.29 E-.03401
G1 X104.987 Y124.29 E-.03401
G1 X104.897 Y124.29 E-.03401
G1 X104.808 Y124.29 E-.03401
G1 X104.718 Y124.29 E-.03402
G1 X104.629 Y124.29 E-.03401
G1 X104.539 Y124.29 E-.03401
G1 X104.45 Y124.29 E-.03401
G1 X104.36 Y124.29 E-.03402
G1 X104.271 Y124.29 E-.03401
G1 X104.181 Y124.29 E-.03401
G1 X104.092 Y124.29 E-.03401
G1 X104.002 Y124.29 E-.03402
G1 X104.002 Y123.693 E-.22698
; WIPE_END
G1 E-.04 F1800
G1 X104.86 Y121.568 Z4.68 F30000
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.499032
G1 F1200
G1 X104.86 Y123.432 E.04313
; WIPE_START
G1 F3600
G1 X104.86 Y121.568 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.68 I-.709 J.989 P1  F30000
G1 X108.088 Y123.881 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F1200
G1 X107.191 Y123.881 E.01862
G1 X107.191 Y121.119 E.05728
G1 X108.088 Y121.119 E.01862
G1 X108.088 Y121.568 E.00931
G1 X108.088 Y123.821 E.04673
M204 S250
G1 X108.498 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.408 Y124.29 E.00173
G1 X108.319 Y124.29 E.00173
G1 X108.229 Y124.29 E.00173
G1 X108.14 Y124.29 E.00173
G1 X108.05 Y124.29 E.00173
G1 X107.961 Y124.29 E.00173
G1 X107.871 Y124.29 E.00173
G1 X107.782 Y124.29 E.00173
G1 X107.692 Y124.29 E.00173
G1 X107.603 Y124.29 E.00173
G1 X107.513 Y124.29 E.00173
G1 X107.424 Y124.29 E.00173
G1 X107.334 Y124.29 E.00173
G1 X107.245 Y124.29 E.00173
G1 X107.155 Y124.29 E.00173
G1 F1088.113
G1 X107.066 Y124.29 E.00173
G1 F600
G1 X106.976 Y124.29 E.00173
G1 X106.887 Y124.29 E.00173
G1 X106.797 Y124.29 E.00173
G1 X106.782 Y124.29 E.00029
G1 X106.782 Y120.71 E.06901
G1 X106.797 Y120.71 E.00029
G1 X106.887 Y120.71 E.00173
G1 X106.976 Y120.71 E.00173
G1 X107.066 Y120.71 E.00173
G1 F1088.113
G1 X107.155 Y120.71 E.00173
G1 F1200
G1 X107.245 Y120.71 E.00173
G1 X107.334 Y120.71 E.00173
G1 X107.424 Y120.71 E.00173
G1 X107.513 Y120.71 E.00173
G1 X107.603 Y120.71 E.00173
G1 X107.692 Y120.71 E.00173
G1 X107.782 Y120.71 E.00173
G1 X107.871 Y120.71 E.00173
G1 X107.961 Y120.71 E.00173
G1 X108.05 Y120.71 E.00173
G1 X108.14 Y120.71 E.00173
G1 X108.229 Y120.71 E.00173
G1 X108.319 Y120.71 E.00173
G1 X108.408 Y120.71 E.00173
G1 X108.498 Y120.71 E.00173
G1 X108.498 Y121.568 E.01654
G1 X108.498 Y124.23 E.05131
; WIPE_START
G1 F1800
M204 S10000
G1 X108.408 Y124.29 E-.04095
G1 X108.319 Y124.29 E-.03401
G1 X108.229 Y124.29 E-.03401
G1 X108.14 Y124.29 E-.03401
G1 X108.05 Y124.29 E-.03401
G1 X107.961 Y124.29 E-.03401
G1 X107.871 Y124.29 E-.03401
G1 X107.782 Y124.29 E-.03401
G1 X107.692 Y124.29 E-.03401
G1 X107.603 Y124.29 E-.03401
G1 X107.513 Y124.29 E-.03401
G1 X107.424 Y124.29 E-.03401
G1 X107.334 Y124.29 E-.03401
G1 X107.245 Y124.29 E-.03401
G1 X107.155 Y124.29 E-.03401
G1 X107.066 Y124.29 E-.03401
G1 X106.976 Y124.29 E-.03401
G1 X106.887 Y124.29 E-.03401
G1 X106.797 Y124.29 E-.03401
G1 X106.782 Y124.29 E-.00581
G1 X106.782 Y124.024 E-.10099
; WIPE_END
G1 E-.04
G1 X107.64 Y121.568 Z4.68 F30000
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.499012
G1 F1200
G1 X107.64 Y123.432 E.04313
; WIPE_START
G1 F3600
G1 X107.64 Y121.568 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.26 Y121.996 Z4.68 F30000
G1 X148.809 Y123.881 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F1200
G1 X147.912 Y123.881 E.01862
G1 X147.912 Y121.119 E.05728
G1 X148.809 Y121.119 E.01862
G1 X148.809 Y121.568 E.00931
G1 X148.809 Y123.821 E.04673
M204 S250
G1 X148.845 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X148.755 Y124.29 E.00173
G1 X148.666 Y124.29 E.00173
G1 X148.576 Y124.29 E.00173
G1 X148.487 Y124.29 E.00173
G1 X148.397 Y124.29 E.00173
G1 X148.308 Y124.29 E.00173
G1 X148.218 Y124.29 E.00173
G1 X148.129 Y124.29 E.00173
G1 X148.039 Y124.29 E.00173
G1 X147.95 Y124.29 E.00173
G1 X147.86 Y124.29 E.00173
G1 X147.771 Y124.29 E.00173
G1 X147.681 Y124.29 E.00173
G1 X147.592 Y124.29 E.00173
G1 X147.502 Y124.29 E.00173
G1 X147.502 Y120.71 E.06901
G1 X147.592 Y120.71 E.00173
G1 X147.681 Y120.71 E.00173
G1 X147.771 Y120.71 E.00173
G1 X147.86 Y120.71 E.00173
G1 X147.95 Y120.71 E.00173
G1 X148.039 Y120.71 E.00173
G1 X148.129 Y120.71 E.00173
G1 X148.218 Y120.71 E.00173
G1 X148.308 Y120.71 E.00173
G1 X148.397 Y120.71 E.00173
G1 X148.487 Y120.71 E.00173
G1 X148.576 Y120.71 E.00173
G1 X148.666 Y120.71 E.00173
G1 X148.755 Y120.71 E.00173
G1 X148.845 Y120.71 E.00173
G1 F1088.113
G1 X148.934 Y120.71 E.00173
G1 F600
G1 X149.024 Y120.71 E.00173
G1 X149.113 Y120.71 E.00173
G1 X149.203 Y120.71 E.00173
G1 X149.218 Y120.71 E.00029
G1 X149.218 Y121.568 E.01654
G1 X149.218 Y124.29 E.05247
G1 X149.203 Y124.29 E.00029
G1 X149.113 Y124.29 E.00173
G1 X149.024 Y124.29 E.00173
G1 X148.934 Y124.29 E.00173
G1 F744.988
G1 X148.905 Y124.29 E.00057
; WIPE_START
M204 S10000
G1 X148.755 Y124.29 E-.05681
G1 X148.666 Y124.29 E-.03401
G1 X148.576 Y124.29 E-.03401
G1 X148.487 Y124.29 E-.03401
G1 X148.397 Y124.29 E-.03401
G1 X148.308 Y124.29 E-.03401
G1 X148.218 Y124.29 E-.03401
G1 X148.129 Y124.29 E-.03401
G1 X148.039 Y124.29 E-.03401
G1 X147.95 Y124.29 E-.03401
G1 X147.86 Y124.29 E-.03401
G1 X147.771 Y124.29 E-.03401
G1 X147.681 Y124.29 E-.03401
G1 X147.592 Y124.29 E-.03401
G1 X147.502 Y124.29 E-.03401
G1 X147.502 Y123.693 E-.227
; WIPE_END
G1 E-.04 F1800
G1 X148.36 Y121.568 Z4.68 F30000
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.498992
G1 F1200
G1 X148.36 Y123.432 E.04313
; WIPE_START
G1 F3600
G1 X148.36 Y121.568 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.68 I-.857 J.864 P1  F30000
G1 X150.691 Y123.881 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F1200
G1 X150.691 Y121.119 E.05728
G1 X151.588 Y121.119 E.01862
G1 X151.588 Y121.568 E.00931
G1 X151.588 Y123.881 E.04797
G1 X150.751 Y123.881 E.01737
M204 S250
G1 X150.655 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1088.113
M204 S5000
G1 X150.565 Y124.29 E.00173
G1 F600
G1 X150.476 Y124.29 E.00173
G1 X150.386 Y124.29 E.00173
G1 X150.297 Y124.29 E.00173
G1 X150.282 Y124.29 E.00029
G1 X150.282 Y120.71 E.06901
G1 X150.297 Y120.71 E.00029
G1 X150.386 Y120.71 E.00173
G1 X150.476 Y120.71 E.00173
G1 X150.565 Y120.71 E.00173
G1 F1088.113
G1 X150.655 Y120.71 E.00173
G1 F1200
G1 X150.745 Y120.71 E.00173
G1 X150.834 Y120.71 E.00173
G1 X150.924 Y120.71 E.00173
G1 X151.013 Y120.71 E.00173
G1 X151.103 Y120.71 E.00173
G1 X151.192 Y120.71 E.00173
G1 X151.282 Y120.71 E.00173
G1 X151.371 Y120.71 E.00173
G1 X151.461 Y120.71 E.00173
G1 X151.55 Y120.71 E.00173
G1 X151.64 Y120.71 E.00173
G1 X151.729 Y120.71 E.00173
G1 X151.819 Y120.71 E.00173
G1 X151.908 Y120.71 E.00173
G1 X151.998 Y120.71 E.00173
G1 X151.998 Y121.568 E.01654
G1 X151.998 Y124.29 E.05247
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.908 Y124.29 E.00173
G1 X151.819 Y124.29 E.00173
G1 X151.729 Y124.29 E.00173
G1 X151.64 Y124.29 E.00173
G1 X151.55 Y124.29 E.00173
G1 X151.461 Y124.29 E.00173
G1 X151.371 Y124.29 E.00173
G1 X151.282 Y124.29 E.00173
G1 X151.192 Y124.29 E.00173
G1 X151.103 Y124.29 E.00173
G1 X151.013 Y124.29 E.00173
G1 X150.924 Y124.29 E.00173
G1 X150.834 Y124.29 E.00173
G1 X150.745 Y124.29 E.00173
G1 X150.715 Y124.29 E.00057
; WIPE_START
G1 F1800
M204 S10000
G1 X150.565 Y124.29 E-.05681
G1 X150.476 Y124.29 E-.03402
G1 X150.386 Y124.29 E-.03401
G1 X150.297 Y124.29 E-.03401
G1 X150.282 Y124.29 E-.00579
G1 X150.282 Y122.723 E-.59535
; WIPE_END
G1 E-.04
G1 X151.14 Y121.568 Z4.68 F30000
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.499012
G1 F1200
G1 X151.14 Y123.432 E.04313
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X151.14 Y121.568 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/45
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.68 I-1.154 J-.385 P1  F30000
G1 X150.652 Y123.032 Z4.68
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F1200
G1 X150.612 Y123.032 E.00083
G1 X150.572 Y123.032 E.00083
G1 X150.532 Y123.032 E.00083
G1 X150.492 Y123.032 E.00083
G1 X150.452 Y123.032 E.00083
G1 X150.412 Y123.032 E.00083
G1 X150.372 Y123.032 E.00083
G1 X150.332 Y123.032 E.00083
G1 X150.292 Y123.032 E.00083
G1 X150.253 Y123.032 E.00083
G1 X150.213 Y123.032 E.00083
G1 X150.173 Y123.032 E.00083
G1 X150.133 Y123.032 E.00083
G1 X150.093 Y123.032 E.00083
G1 X150.053 Y123.032 E.00083
G1 X150.013 Y123.032 E.00083
G1 X149.973 Y123.032 E.00083
G1 X149.933 Y123.032 E.00083
G1 X149.893 Y123.032 E.00083
G1 X149.872 Y123.032 E.00045
; FEATURE: Overhang wall

M204 S5000
G1 X149.628 Y123.032 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X149.607 Y123.032 E.00045
G1 X149.567 Y123.032 E.00083
G1 X149.527 Y123.032 E.00083
G1 X149.487 Y123.032 E.00083
G1 X149.447 Y123.032 E.00083
G1 X149.407 Y123.032 E.00083
G1 X149.367 Y123.032 E.00083
G1 X149.327 Y123.032 E.00083
G1 X149.287 Y123.032 E.00083
G1 X149.248 Y123.032 E.00083
G1 X149.208 Y123.032 E.00083
G1 X149.168 Y123.032 E.00083
G1 X149.128 Y123.032 E.00083
G1 X149.088 Y123.032 E.00083
G1 X149.048 Y123.032 E.00083
G1 X149.008 Y123.032 E.00083
G1 X148.968 Y123.032 E.00083
G1 X148.928 Y123.032 E.00083
G1 X148.889 Y123.032 E.00083
G1 X148.849 Y123.032 E.00083
G1 X148.849 Y121.968 E.02208
G1 X148.889 Y121.968 E.00083
G1 X148.928 Y121.968 E.00083
G1 X148.968 Y121.968 E.00083
G1 X149.008 Y121.968 E.00083
G1 X149.048 Y121.968 E.00083
M73 P93 R1
G1 X149.088 Y121.968 E.00083
G1 X149.128 Y121.968 E.00083
G1 X149.168 Y121.968 E.00083
G1 X149.208 Y121.968 E.00083
G1 X149.248 Y121.968 E.00083
G1 X149.287 Y121.968 E.00083
G1 X149.327 Y121.968 E.00083
G1 X149.367 Y121.968 E.00083
G1 X149.407 Y121.968 E.00083
G1 X149.447 Y121.968 E.00083
G1 X149.487 Y121.968 E.00083
G1 X149.527 Y121.968 E.00083
G1 X149.567 Y121.968 E.00083
G1 X149.607 Y121.968 E.00083
G1 X149.628 Y121.968 E.00045
; FEATURE: Overhang wall

M204 S5000
G1 X149.872 Y121.968 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X149.893 Y121.968 E.00045
G1 X149.933 Y121.968 E.00083
G1 X149.973 Y121.968 E.00083
G1 X150.013 Y121.968 E.00083
G1 X150.053 Y121.968 E.00083
G1 X150.093 Y121.968 E.00083
G1 X150.133 Y121.968 E.00083
G1 X150.173 Y121.968 E.00083
G1 X150.213 Y121.968 E.00083
G1 X150.253 Y121.968 E.00083
G1 X150.292 Y121.968 E.00083
G1 X150.332 Y121.968 E.00083
G1 X150.372 Y121.968 E.00083
G1 X150.412 Y121.968 E.00083
G1 X150.452 Y121.968 E.00083
G1 X150.492 Y121.968 E.00083
G1 X150.532 Y121.968 E.00083
G1 X150.572 Y121.968 E.00083
G1 X150.612 Y121.968 E.00083
G1 X150.652 Y121.968 E.00083
G1 X150.652 Y122.5 E.01104
G1 X150.652 Y122.972 E.0098
G1 X151.076 Y123.457 F30000
G1 F1200
G1 X151.014 Y123.457 E.00128
G1 X150.953 Y123.457 E.00128
G1 X150.891 Y123.457 E.00128
G1 X150.829 Y123.457 E.00128
G1 X150.768 Y123.457 E.00128
G1 X150.706 Y123.457 E.00128
G1 X150.645 Y123.457 E.00128
G1 X150.583 Y123.457 E.00128
G1 X150.521 Y123.457 E.00128
G1 X150.46 Y123.457 E.00128
G1 X150.398 Y123.457 E.00128
G1 X150.336 Y123.457 E.00128
G1 X150.275 Y123.457 E.00128
G1 X150.213 Y123.457 E.00128
G1 X150.152 Y123.457 E.00128
G1 X150.09 Y123.457 E.00128
G1 X150.028 Y123.457 E.00128
G1 X149.967 Y123.457 E.00128
G1 X149.905 Y123.457 E.00128
G1 X149.872 Y123.457 E.00069
; FEATURE: Overhang wall

M204 S5000
G1 X149.628 Y123.457 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X149.595 Y123.457 E.00069
G1 X149.533 Y123.457 E.00128
G1 X149.472 Y123.457 E.00128
G1 X149.41 Y123.457 E.00128
G1 X149.348 Y123.457 E.00128
G1 X149.287 Y123.457 E.00128
G1 X149.225 Y123.457 E.00128
G1 X149.164 Y123.457 E.00128
G1 X149.102 Y123.457 E.00128
G1 X149.04 Y123.457 E.00128
G1 X148.979 Y123.457 E.00128
G1 X148.917 Y123.457 E.00128
G1 X148.856 Y123.457 E.00128
G1 X148.794 Y123.457 E.00128
G1 X148.732 Y123.457 E.00128
G1 X148.671 Y123.457 E.00128
G1 X148.609 Y123.457 E.00128
G1 X148.548 Y123.457 E.00128
G1 X148.486 Y123.457 E.00128
G1 X148.424 Y123.457 E.00128
G1 X148.424 Y121.543 E.03968
G1 X148.486 Y121.543 E.00128
G1 X148.548 Y121.543 E.00128
G1 X148.609 Y121.543 E.00128
G1 X148.671 Y121.543 E.00128
G1 X148.732 Y121.543 E.00128
G1 X148.794 Y121.543 E.00128
G1 X148.856 Y121.543 E.00128
G1 X148.917 Y121.543 E.00128
G1 X148.979 Y121.543 E.00128
G1 X149.04 Y121.543 E.00128
G1 X149.102 Y121.543 E.00128
G1 X149.164 Y121.543 E.00128
G1 X149.225 Y121.543 E.00128
G1 X149.287 Y121.543 E.00128
G1 X149.348 Y121.543 E.00128
G1 X149.41 Y121.543 E.00128
G1 X149.472 Y121.543 E.00128
G1 X149.533 Y121.543 E.00128
G1 X149.595 Y121.543 E.00128
G1 X149.628 Y121.543 E.00069
; FEATURE: Overhang wall

M204 S5000
G1 X149.872 Y121.543 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X149.905 Y121.543 E.00069
G1 X149.967 Y121.543 E.00128
G1 X150.028 Y121.543 E.00128
G1 X150.09 Y121.543 E.00128
G1 X150.152 Y121.543 E.00128
G1 X150.213 Y121.543 E.00128
G1 X150.275 Y121.543 E.00128
G1 X150.336 Y121.543 E.00128
G1 X150.398 Y121.543 E.00128
G1 X150.46 Y121.543 E.00128
G1 X150.521 Y121.543 E.00128
G1 X150.583 Y121.543 E.00128
G1 X150.644 Y121.543 E.00128
G1 X150.706 Y121.543 E.00128
G1 X150.768 Y121.543 E.00128
G1 X150.829 Y121.543 E.00128
G1 X150.891 Y121.543 E.00128
G1 X150.953 Y121.543 E.00128
G1 X151.014 Y121.543 E.00128
G1 X151.076 Y121.543 E.00128
G1 X151.076 Y122.5 E.01984
G1 X151.076 Y123.397 E.0186
G1 X151.5 Y123.881 F30000
G1 F1200
G1 X151.417 Y123.881 E.00173
G1 X151.333 Y123.881 E.00173
G1 X151.25 Y123.881 E.00173
G1 X151.167 Y123.881 E.00173
G1 X151.083 Y123.881 E.00173
G1 X151 Y123.881 E.00173
G1 X150.917 Y123.881 E.00173
G1 X150.833 Y123.881 E.00173
G1 X150.75 Y123.881 E.00173
G1 X150.667 Y123.881 E.00173
G1 X150.584 Y123.881 E.00173
G1 X150.5 Y123.881 E.00173
G1 X150.417 Y123.881 E.00173
G1 X150.334 Y123.881 E.00173
G1 X150.25 Y123.881 E.00173
G1 X150.167 Y123.881 E.00173
G1 X150.084 Y123.881 E.00173
G1 X150 Y123.881 E.00173
G1 X149.917 Y123.881 E.00173
G1 X149.872 Y123.881 E.00094
; FEATURE: Overhang wall

M204 S5000
G1 X149.628 Y123.881 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X149.583 Y123.881 E.00094
G1 X149.5 Y123.881 E.00173
G1 X149.416 Y123.881 E.00173
G1 X149.333 Y123.881 E.00173
G1 X149.25 Y123.881 E.00173
G1 X149.167 Y123.881 E.00173
G1 X149.083 Y123.881 E.00173
G1 X149 Y123.881 E.00173
G1 X148.917 Y123.881 E.00173
G1 X148.833 Y123.881 E.00173
G1 X148.75 Y123.881 E.00173
G1 X148.667 Y123.881 E.00173
G1 X148.583 Y123.881 E.00173
G1 X148.5 Y123.881 E.00173
G1 X148.417 Y123.881 E.00173
G1 X148.333 Y123.881 E.00173
G1 X148.25 Y123.881 E.00173
G1 X148.167 Y123.881 E.00173
G1 X148.083 Y123.881 E.00173
G1 X148 Y123.881 E.00173
G1 X148 Y121.119 E.05728
G1 X148.083 Y121.119 E.00173
G1 X148.167 Y121.119 E.00173
G1 X148.25 Y121.119 E.00173
G1 X148.333 Y121.119 E.00173
G1 X148.417 Y121.119 E.00173
G1 X148.5 Y121.119 E.00173
G1 X148.583 Y121.119 E.00173
G1 X148.667 Y121.119 E.00173
G1 X148.75 Y121.119 E.00173
G1 X148.833 Y121.119 E.00173
G1 X148.917 Y121.119 E.00173
G1 X149 Y121.119 E.00173
G1 X149.083 Y121.119 E.00173
G1 X149.166 Y121.119 E.00173
G1 X149.25 Y121.119 E.00173
G1 X149.333 Y121.119 E.00173
G1 X149.416 Y121.119 E.00173
G1 X149.5 Y121.119 E.00173
G1 X149.583 Y121.119 E.00173
G1 X149.628 Y121.119 E.00094
; FEATURE: Overhang wall

M204 S5000
G1 X149.872 Y121.119 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X149.917 Y121.119 E.00094
G1 X150 Y121.119 E.00173
G1 X150.084 Y121.119 E.00173
G1 X150.167 Y121.119 E.00173
G1 X150.25 Y121.119 E.00173
G1 X150.334 Y121.119 E.00173
G1 X150.417 Y121.119 E.00173
G1 X150.5 Y121.119 E.00173
G1 X150.584 Y121.119 E.00173
G1 X150.667 Y121.119 E.00173
G1 X150.75 Y121.119 E.00173
G1 X150.833 Y121.119 E.00173
G1 X150.917 Y121.119 E.00173
G1 X151 Y121.119 E.00173
G1 X151.083 Y121.119 E.00173
G1 X151.167 Y121.119 E.00173
G1 X151.25 Y121.119 E.00173
G1 X151.333 Y121.119 E.00173
G1 X151.417 Y121.119 E.00173
G1 X151.5 Y121.119 E.00173
G1 X151.5 Y122.5 E.02864
G1 X151.5 Y123.821 E.0274
M204 S250
G1 X151.909 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X151.802 Y124.29 E.00207
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G1 X151.694 Y124.29 E.00207
G1 X151.587 Y124.29 E.00207
G1 X151.479 Y124.29 E.00207
G1 X151.371 Y124.29 E.00207
G1 X151.264 Y124.29 E.00207
G1 X151.156 Y124.29 E.00207
G1 X151.049 Y124.29 E.00207
G1 X150.941 Y124.29 E.00207
G1 X150.834 Y124.29 E.00207
G1 X150.726 Y124.29 E.00207
G1 X150.618 Y124.29 E.00207
G1 X150.511 Y124.29 E.00207
G1 X150.403 Y124.29 E.00207
G1 X150.296 Y124.29 E.00207
G1 X150.188 Y124.29 E.00207
G1 X150.081 Y124.29 E.00207
G1 X149.973 Y124.29 E.00207
G1 X149.898 Y124.29 E.00144
G1 X149.872 Y124.29 E.00051
; FEATURE: Overhang wall

G1 X149.628 Y124.29 E.00469
; FEATURE: Outer wall
G1 X149.528 Y124.29 E.00193
G1 X149.428 Y124.29 E.00193
G1 X149.328 Y124.29 E.00193
G1 X149.228 Y124.29 E.00193
G1 X149.128 Y124.29 E.00193
G1 X149.028 Y124.29 E.00193
G1 X148.928 Y124.29 E.00193
G1 X148.828 Y124.29 E.00193
G1 X148.728 Y124.29 E.00193
G1 X148.628 Y124.29 E.00193
G1 X148.528 Y124.29 E.00193
G1 X148.428 Y124.29 E.00193
G1 X148.328 Y124.29 E.00193
G1 X148.228 Y124.29 E.00193
G1 X148.128 Y124.29 E.00193
G1 X148.028 Y124.29 E.00193
G1 X147.928 Y124.29 E.00193
G1 X147.828 Y124.29 E.00193
G1 X147.728 Y124.29 E.00193
G1 X147.591 Y124.29 E.00265
G1 X147.591 Y120.71 E.06901
G1 X147.698 Y120.71 E.00207
G1 X147.806 Y120.71 E.00207
G1 X147.913 Y120.71 E.00207
G1 X148.021 Y120.71 E.00207
G1 X148.129 Y120.71 E.00207
G1 X148.236 Y120.71 E.00207
G1 X148.344 Y120.71 E.00207
G1 X148.451 Y120.71 E.00207
G1 X148.559 Y120.71 E.00207
G1 X148.666 Y120.71 E.00207
G1 X148.774 Y120.71 E.00207
G1 X148.881 Y120.71 E.00207
G1 X148.989 Y120.71 E.00207
G1 X149.096 Y120.71 E.00207
G1 X149.204 Y120.71 E.00207
G1 X149.311 Y120.71 E.00207
G1 X149.419 Y120.71 E.00207
G1 X149.526 Y120.71 E.00207
G1 X149.602 Y120.71 E.00145
G1 X149.628 Y120.71 E.00051
; FEATURE: Overhang wall

G1 X149.872 Y120.71 E.00469
; FEATURE: Outer wall
G1 X149.972 Y120.71 E.00193
G1 X150.072 Y120.71 E.00193
G1 X150.172 Y120.71 E.00193
G1 X150.272 Y120.71 E.00193
G1 X150.372 Y120.71 E.00193
G1 X150.472 Y120.71 E.00193
G1 X150.572 Y120.71 E.00193
G1 X150.672 Y120.71 E.00193
M73 P93 R0
G1 X150.772 Y120.71 E.00193
G1 X150.872 Y120.71 E.00193
G1 X150.972 Y120.71 E.00193
G1 X151.072 Y120.71 E.00193
G1 X151.172 Y120.71 E.00193
G1 X151.272 Y120.71 E.00193
G1 X151.372 Y120.71 E.00193
G1 X151.472 Y120.71 E.00193
G1 X151.572 Y120.71 E.00193
G1 X151.672 Y120.71 E.00193
G1 X151.772 Y120.71 E.00193
G1 X151.909 Y120.71 E.00265
G1 X151.909 Y122.5 E.0345
G1 X151.909 Y124.23 E.03335
; WIPE_START
G1 F1800
M204 S10000
G1 X151.802 Y124.29 E-.0468
G1 X151.694 Y124.29 E-.04088
G1 X151.587 Y124.29 E-.04088
G1 X151.479 Y124.29 E-.04088
G1 X151.371 Y124.29 E-.04087
G1 X151.264 Y124.29 E-.04088
G1 X151.156 Y124.29 E-.04088
G1 X151.049 Y124.29 E-.04088
G1 X150.941 Y124.29 E-.04087
G1 X150.834 Y124.29 E-.04088
G1 X150.726 Y124.29 E-.04088
G1 X150.618 Y124.29 E-.04088
G1 X150.511 Y124.29 E-.04088
G1 X150.403 Y124.29 E-.04087
G1 X150.296 Y124.29 E-.04088
G1 X150.188 Y124.29 E-.04088
G1 X150.081 Y124.29 E-.04088
G1 X149.973 Y124.29 E-.04087
G1 X149.925 Y124.29 E-.01831
; WIPE_END
G1 E-.04
G17
G3 Z4.8 I1.152 J.392 P1  F30000
G1 X150.483 Y122.647 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.498842
G1 F1200
G1 X149.017 Y122.647 E.03392
; WIPE_START
G1 X150.483 Y122.647 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.011 J-1.217 P1  F30000
G1 X107.151 Y123.032 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X107.111 Y123.032 E.00083
G1 X107.072 Y123.032 E.00083
G1 X107.032 Y123.032 E.00083
G1 X106.992 Y123.032 E.00083
G1 X106.952 Y123.032 E.00083
G1 X106.912 Y123.032 E.00083
G1 X106.872 Y123.032 E.00083
G1 X106.832 Y123.032 E.00083
G1 X106.792 Y123.032 E.00083
G1 X106.752 Y123.032 E.00083
G1 X106.713 Y123.032 E.00083
G1 X106.673 Y123.032 E.00083
G1 X106.633 Y123.032 E.00083
G1 X106.593 Y123.032 E.00083
G1 X106.553 Y123.032 E.00083
G1 X106.513 Y123.032 E.00083
G1 X106.473 Y123.032 E.00083
G1 X106.433 Y123.032 E.00083
G1 X106.393 Y123.032 E.00083
G1 X106.372 Y123.032 E.00045
; FEATURE: Overhang wall

M204 S5000
G1 X106.128 Y123.032 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X106.107 Y123.032 E.00045
G1 X106.067 Y123.032 E.00083
G1 X106.027 Y123.032 E.00083
G1 X105.987 Y123.032 E.00083
G1 X105.947 Y123.032 E.00083
G1 X105.907 Y123.032 E.00083
G1 X105.867 Y123.032 E.00083
G1 X105.827 Y123.032 E.00083
G1 X105.787 Y123.032 E.00083
G1 X105.747 Y123.032 E.00083
G1 X105.708 Y123.032 E.00083
G1 X105.668 Y123.032 E.00083
G1 X105.628 Y123.032 E.00083
G1 X105.588 Y123.032 E.00083
G1 X105.548 Y123.032 E.00083
G1 X105.508 Y123.032 E.00083
G1 X105.468 Y123.032 E.00083
G1 X105.428 Y123.032 E.00083
G1 X105.388 Y123.032 E.00083
G1 X105.348 Y123.032 E.00083
G1 X105.348 Y121.968 E.02208
G1 X105.388 Y121.968 E.00083
G1 X105.428 Y121.968 E.00083
G1 X105.468 Y121.968 E.00083
G1 X105.508 Y121.968 E.00083
G1 X105.548 Y121.968 E.00083
G1 X105.588 Y121.968 E.00083
G1 X105.628 Y121.968 E.00083
G1 X105.668 Y121.968 E.00083
G1 X105.708 Y121.968 E.00083
G1 X105.747 Y121.968 E.00083
G1 X105.787 Y121.968 E.00083
G1 X105.827 Y121.968 E.00083
G1 X105.867 Y121.968 E.00083
G1 X105.907 Y121.968 E.00083
G1 X105.947 Y121.968 E.00083
G1 X105.987 Y121.968 E.00083
G1 X106.027 Y121.968 E.00083
G1 X106.067 Y121.968 E.00083
G1 X106.107 Y121.968 E.00083
G1 X106.128 Y121.968 E.00045
; FEATURE: Overhang wall

M204 S5000
G1 X106.372 Y121.968 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X106.393 Y121.968 E.00045
G1 X106.433 Y121.968 E.00083
G1 X106.473 Y121.968 E.00083
G1 X106.513 Y121.968 E.00083
G1 X106.553 Y121.968 E.00083
G1 X106.593 Y121.968 E.00083
G1 X106.633 Y121.968 E.00083
G1 X106.673 Y121.968 E.00083
G1 X106.713 Y121.968 E.00083
G1 X106.752 Y121.968 E.00083
G1 X106.792 Y121.968 E.00083
G1 X106.832 Y121.968 E.00083
G1 X106.872 Y121.968 E.00083
G1 X106.912 Y121.968 E.00083
G1 X106.952 Y121.968 E.00083
G1 X106.992 Y121.968 E.00083
G1 X107.032 Y121.968 E.00083
G1 X107.072 Y121.968 E.00083
G1 X107.111 Y121.968 E.00083
G1 X107.151 Y121.968 E.00083
G1 X107.151 Y122.5 E.01104
G1 X107.151 Y122.972 E.0098
G1 X107.576 Y123.457 F30000
G1 F1200
G1 X107.514 Y123.457 E.00128
G1 X107.452 Y123.457 E.00128
G1 X107.391 Y123.457 E.00128
G1 X107.329 Y123.457 E.00128
G1 X107.268 Y123.457 E.00128
G1 X107.206 Y123.457 E.00128
G1 X107.144 Y123.457 E.00128
G1 X107.083 Y123.457 E.00128
G1 X107.021 Y123.457 E.00128
G1 X106.96 Y123.457 E.00128
G1 X106.898 Y123.457 E.00128
G1 X106.836 Y123.457 E.00128
G1 X106.775 Y123.457 E.00128
G1 X106.713 Y123.457 E.00128
G1 X106.652 Y123.457 E.00128
G1 X106.59 Y123.457 E.00128
G1 X106.528 Y123.457 E.00128
G1 X106.467 Y123.457 E.00128
G1 X106.405 Y123.457 E.00128
G1 X106.372 Y123.457 E.00069
; FEATURE: Overhang wall

M204 S5000
G1 X106.128 Y123.457 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X106.095 Y123.457 E.00069
G1 X106.033 Y123.457 E.00128
G1 X105.972 Y123.457 E.00128
G1 X105.91 Y123.457 E.00128
G1 X105.848 Y123.457 E.00128
G1 X105.787 Y123.457 E.00128
G1 X105.725 Y123.457 E.00128
G1 X105.664 Y123.457 E.00128
G1 X105.602 Y123.457 E.00128
G1 X105.54 Y123.457 E.00128
G1 X105.479 Y123.457 E.00128
G1 X105.417 Y123.457 E.00128
G1 X105.355 Y123.457 E.00128
G1 X105.294 Y123.457 E.00128
G1 X105.232 Y123.457 E.00128
G1 X105.171 Y123.457 E.00128
G1 X105.109 Y123.457 E.00128
G1 X105.047 Y123.457 E.00128
G1 X104.986 Y123.457 E.00128
G1 X104.924 Y123.457 E.00128
G1 X104.924 Y121.543 E.03968
G1 X104.986 Y121.543 E.00128
G1 X105.047 Y121.543 E.00128
G1 X105.109 Y121.543 E.00128
G1 X105.171 Y121.543 E.00128
G1 X105.232 Y121.543 E.00128
G1 X105.294 Y121.543 E.00128
G1 X105.355 Y121.543 E.00128
G1 X105.417 Y121.543 E.00128
G1 X105.479 Y121.543 E.00128
G1 X105.54 Y121.543 E.00128
G1 X105.602 Y121.543 E.00128
G1 X105.664 Y121.543 E.00128
G1 X105.725 Y121.543 E.00128
G1 X105.787 Y121.543 E.00128
G1 X105.848 Y121.543 E.00128
G1 X105.91 Y121.543 E.00128
G1 X105.972 Y121.543 E.00128
G1 X106.033 Y121.543 E.00128
G1 X106.095 Y121.543 E.00128
G1 X106.128 Y121.543 E.00069
; FEATURE: Overhang wall

M204 S5000
G1 X106.372 Y121.543 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X106.405 Y121.543 E.00069
G1 X106.467 Y121.543 E.00128
G1 X106.528 Y121.543 E.00128
G1 X106.59 Y121.543 E.00128
G1 X106.652 Y121.543 E.00128
G1 X106.713 Y121.543 E.00128
G1 X106.775 Y121.543 E.00128
G1 X106.836 Y121.543 E.00128
G1 X106.898 Y121.543 E.00128
G1 X106.96 Y121.543 E.00128
G1 X107.021 Y121.543 E.00128
G1 X107.083 Y121.543 E.00128
G1 X107.144 Y121.543 E.00128
G1 X107.206 Y121.543 E.00128
G1 X107.268 Y121.543 E.00128
G1 X107.329 Y121.543 E.00128
G1 X107.391 Y121.543 E.00128
G1 X107.452 Y121.543 E.00128
G1 X107.514 Y121.543 E.00128
G1 X107.576 Y121.543 E.00128
G1 X107.576 Y122.5 E.01984
G1 X107.576 Y123.397 E.0186
G1 X108 Y123.881 F30000
G1 F1200
G1 X107.917 Y123.881 E.00173
G1 X107.833 Y123.881 E.00173
G1 X107.75 Y123.881 E.00173
G1 X107.667 Y123.881 E.00173
G1 X107.583 Y123.881 E.00173
G1 X107.5 Y123.881 E.00173
G1 X107.417 Y123.881 E.00173
G1 X107.333 Y123.881 E.00173
G1 X107.25 Y123.881 E.00173
G1 X107.167 Y123.881 E.00173
G1 X107.083 Y123.881 E.00173
G1 X107 Y123.881 E.00173
G1 X106.917 Y123.881 E.00173
G1 X106.833 Y123.881 E.00173
G1 X106.75 Y123.881 E.00173
G1 X106.667 Y123.881 E.00173
G1 X106.584 Y123.881 E.00173
G1 X106.5 Y123.881 E.00173
G1 X106.417 Y123.881 E.00173
G1 X106.372 Y123.881 E.00094
; FEATURE: Overhang wall

M204 S5000
G1 X106.128 Y123.881 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X106.083 Y123.881 E.00094
G1 X106 Y123.881 E.00173
G1 X105.916 Y123.881 E.00173
G1 X105.833 Y123.881 E.00173
G1 X105.75 Y123.881 E.00173
G1 X105.666 Y123.881 E.00173
G1 X105.583 Y123.881 E.00173
G1 X105.5 Y123.881 E.00173
G1 X105.416 Y123.881 E.00173
G1 X105.333 Y123.881 E.00173
G1 X105.25 Y123.881 E.00173
G1 X105.167 Y123.881 E.00173
G1 X105.083 Y123.881 E.00173
G1 X105 Y123.881 E.00173
G1 X104.917 Y123.881 E.00173
G1 X104.833 Y123.881 E.00173
G1 X104.75 Y123.881 E.00173
G1 X104.667 Y123.881 E.00173
G1 X104.583 Y123.881 E.00173
G1 X104.5 Y123.881 E.00173
G1 X104.5 Y121.119 E.05728
G1 X104.583 Y121.119 E.00173
G1 X104.667 Y121.119 E.00173
G1 X104.75 Y121.119 E.00173
G1 X104.833 Y121.119 E.00173
G1 X104.917 Y121.119 E.00173
G1 X105 Y121.119 E.00173
G1 X105.083 Y121.119 E.00173
G1 X105.167 Y121.119 E.00173
G1 X105.25 Y121.119 E.00173
G1 X105.333 Y121.119 E.00173
G1 X105.416 Y121.119 E.00173
G1 X105.5 Y121.119 E.00173
G1 X105.583 Y121.119 E.00173
G1 X105.666 Y121.119 E.00173
G1 X105.75 Y121.119 E.00173
G1 X105.833 Y121.119 E.00173
G1 X105.916 Y121.119 E.00173
G1 X106 Y121.119 E.00173
G1 X106.083 Y121.119 E.00173
G1 X106.128 Y121.119 E.00094
; FEATURE: Overhang wall

M204 S5000
G1 X106.372 Y121.119 E.00505
; FEATURE: Inner wall
M204 S10000
G1 X106.417 Y121.119 E.00094
G1 X106.5 Y121.119 E.00173
G1 X106.584 Y121.119 E.00173
G1 X106.667 Y121.119 E.00173
G1 X106.75 Y121.119 E.00173
G1 X106.833 Y121.119 E.00173
G1 X106.917 Y121.119 E.00173
G1 X107 Y121.119 E.00173
G1 X107.083 Y121.119 E.00173
G1 X107.167 Y121.119 E.00173
G1 X107.25 Y121.119 E.00173
G1 X107.333 Y121.119 E.00173
G1 X107.417 Y121.119 E.00173
G1 X107.5 Y121.119 E.00173
G1 X107.583 Y121.119 E.00173
G1 X107.667 Y121.119 E.00173
G1 X107.75 Y121.119 E.00173
G1 X107.833 Y121.119 E.00173
G1 X107.916 Y121.119 E.00173
G1 X108 Y121.119 E.00173
G1 X108 Y122.5 E.02864
G1 X108 Y123.821 E.0274
M204 S250
G1 X108.409 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X108.302 Y124.29 E.00207
G1 X108.194 Y124.29 E.00207
G1 X108.087 Y124.29 E.00207
G1 X107.979 Y124.29 E.00207
G1 X107.871 Y124.29 E.00207
G1 X107.764 Y124.29 E.00207
G1 X107.656 Y124.29 E.00207
G1 X107.549 Y124.29 E.00207
G1 X107.441 Y124.29 E.00207
G1 X107.334 Y124.29 E.00207
G1 X107.226 Y124.29 E.00207
G1 X107.119 Y124.29 E.00207
G1 X107.011 Y124.29 E.00207
G1 X106.904 Y124.29 E.00207
G1 X106.796 Y124.29 E.00207
G1 X106.689 Y124.29 E.00207
G1 X106.581 Y124.29 E.00207
G1 X106.474 Y124.29 E.00207
G1 X106.398 Y124.29 E.00145
G1 X106.372 Y124.29 E.00051
; FEATURE: Overhang wall

G1 X106.128 Y124.29 E.00469
; FEATURE: Outer wall
G1 X106.028 Y124.29 E.00193
G1 X105.928 Y124.29 E.00193
G1 X105.828 Y124.29 E.00193
G1 X105.728 Y124.29 E.00193
G1 X105.628 Y124.29 E.00193
G1 X105.528 Y124.29 E.00193
G1 X105.428 Y124.29 E.00193
G1 X105.328 Y124.29 E.00193
G1 X105.228 Y124.29 E.00193
G1 X105.128 Y124.29 E.00193
G1 X105.028 Y124.29 E.00193
G1 X104.928 Y124.29 E.00193
G1 X104.828 Y124.29 E.00193
G1 X104.728 Y124.29 E.00193
G1 X104.628 Y124.29 E.00193
G1 X104.528 Y124.29 E.00193
G1 X104.428 Y124.29 E.00193
G1 X104.328 Y124.29 E.00193
G1 X104.228 Y124.29 E.00193
G1 X104.091 Y124.29 E.00265
G1 X104.091 Y120.71 E.06901
G1 X104.198 Y120.71 E.00207
G1 X104.306 Y120.71 E.00207
G1 X104.413 Y120.71 E.00207
G1 X104.521 Y120.71 E.00207
G1 X104.629 Y120.71 E.00207
G1 X104.736 Y120.71 E.00207
G1 X104.844 Y120.71 E.00207
G1 X104.951 Y120.71 E.00207
G1 X105.059 Y120.71 E.00207
G1 X105.166 Y120.71 E.00207
G1 X105.274 Y120.71 E.00207
G1 X105.382 Y120.71 E.00207
G1 X105.489 Y120.71 E.00207
G1 X105.597 Y120.71 E.00207
G1 X105.704 Y120.71 E.00207
G1 X105.812 Y120.71 E.00207
G1 X105.919 Y120.71 E.00207
G1 X106.027 Y120.71 E.00207
G1 X106.102 Y120.71 E.00144
G1 X106.128 Y120.71 E.00051
; FEATURE: Overhang wall

G1 X106.372 Y120.71 E.00469
; FEATURE: Outer wall
G1 X106.472 Y120.71 E.00193
G1 X106.572 Y120.71 E.00193
G1 X106.672 Y120.71 E.00193
G1 X106.772 Y120.71 E.00193
G1 X106.872 Y120.71 E.00193
G1 X106.972 Y120.71 E.00193
G1 X107.072 Y120.71 E.00193
G1 X107.172 Y120.71 E.00193
G1 X107.272 Y120.71 E.00193
G1 X107.372 Y120.71 E.00193
G1 X107.472 Y120.71 E.00193
G1 X107.572 Y120.71 E.00193
G1 X107.672 Y120.71 E.00193
G1 X107.772 Y120.71 E.00193
G1 X107.872 Y120.71 E.00193
G1 X107.972 Y120.71 E.00193
G1 X108.072 Y120.71 E.00193
G1 X108.172 Y120.71 E.00193
G1 X108.272 Y120.71 E.00193
G1 X108.409 Y120.71 E.00265
G1 X108.409 Y122.5 E.0345
G1 X108.409 Y124.23 E.03335
; WIPE_START
G1 F1800
M204 S10000
G1 X108.302 Y124.29 E-.04679
G1 X108.194 Y124.29 E-.04086
G1 X108.087 Y124.29 E-.04085
G1 X107.979 Y124.29 E-.04086
G1 X107.871 Y124.29 E-.04086
G1 X107.764 Y124.29 E-.04085
G1 X107.656 Y124.29 E-.04086
G1 X107.549 Y124.29 E-.04085
G1 X107.441 Y124.29 E-.04086
G1 X107.334 Y124.29 E-.04086
G1 X107.226 Y124.29 E-.04085
G1 X107.119 Y124.29 E-.04086
G1 X107.011 Y124.29 E-.04085
G1 X106.904 Y124.29 E-.04086
G1 X106.796 Y124.29 E-.04086
G1 X106.689 Y124.29 E-.04085
G1 X106.581 Y124.29 E-.04086
G1 X106.474 Y124.29 E-.04085
G1 X106.425 Y124.29 E-.01866
; WIPE_END
G1 E-.04
G17
G3 Z4.8 I1.169 J.337 P1  F30000
G1 X106.983 Y122.353 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.498842
G1 F1200
G1 X105.517 Y122.353 E.03392
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1200
G1 X106.983 Y122.353 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/45
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.8 I-.019 J1.217 P1  F30000
G1 X150.553 Y123.032 Z4.8
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X148.947 Y123.032 E.03332
G1 X148.947 Y121.968 E.02208
G1 X150.553 Y121.968 E.03332
G1 X150.553 Y122.5 E.01104
G1 X150.553 Y122.972 E.0098
G1 X150.977 Y123.457 F30000
G1 F1200
G1 X148.523 Y123.457 E.05092
G1 X148.523 Y121.543 E.03968
G1 X150.977 Y121.543 E.05092
G1 X150.977 Y122.5 E.01984
G1 X150.977 Y123.397 E.0186
G1 X151.402 Y123.881 F30000
G1 F1200
G1 X148.098 Y123.881 E.06852
G1 X148.098 Y121.119 E.05728
G1 X151.402 Y121.119 E.06852
G1 X151.402 Y122.5 E.02864
G1 X151.402 Y123.821 E.0274
M204 S250
G1 X151.811 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X147.689 Y124.29 E.07945
G1 X147.689 Y120.71 E.06901
G1 X151.811 Y120.71 E.07945
G1 X151.811 Y122.5 E.0345
G1 X151.811 Y124.23 E.03335
;========Date 20250206========
; SKIPPABLE_START
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
G1 F1800
M204 S10000
G1 X149.811 Y124.259 E-.76
; WIPE_END
G1 E-.04
G17
G3 Z4.92 I1.163 J-.358 P1  F30000
G1 X149.319 Y122.66 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345912
G1 F1200
G1 X150.181 Y122.66 E.01349
G1 X150.181 Y122.34 E.00501
G1 X149.319 Y122.34 E.01349
G1 X149.319 Y122.6 E.00407
; WIPE_START
G1 F18740.631
G1 X149.319 Y122.34 E-.09886
G1 X150.181 Y122.34 E-.32753
G1 X150.181 Y122.66 E-.12166
G1 X149.623 Y122.66 E-.21195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.92 I-.011 J-1.217 P1  F30000
G1 X107.053 Y123.032 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X105.447 Y123.032 E.03332
G1 X105.447 Y121.968 E.02208
G1 X107.053 Y121.968 E.03332
G1 X107.053 Y122.5 E.01104
G1 X107.053 Y122.972 E.0098
G1 X107.477 Y123.457 F30000
G1 F1200
G1 X105.023 Y123.457 E.05092
G1 X105.023 Y121.543 E.03968
G1 X107.477 Y121.543 E.05092
G1 X107.477 Y122.5 E.01984
G1 X107.477 Y123.397 E.0186
G1 X107.902 Y123.881 F30000
G1 F1200
G1 X104.598 Y123.881 E.06852
G1 X104.598 Y121.119 E.05728
G1 X107.902 Y121.119 E.06852
G1 X107.902 Y122.5 E.02864
G1 X107.902 Y123.821 E.0274
M204 S250
G1 X108.311 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.189 Y124.29 E.07945
G1 X104.189 Y120.71 E.06901
G1 X108.311 Y120.71 E.07945
G1 X108.311 Y122.5 E.0345
G1 X108.311 Y124.23 E.03335
; WIPE_START
G1 F1800
M204 S10000
G1 X106.311 Y124.259 E-.76
; WIPE_END
G1 E-.04
G17
G3 Z4.92 I1.186 J.274 P1  F30000
G1 X106.681 Y122.66 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345922
G1 F1200
G1 X106.681 Y122.34 E.00501
G1 X105.819 Y122.34 E.01349
G1 X105.819 Y122.66 E.00501
G1 X106.621 Y122.66 E.01255
; CHANGE_LAYER
; Z_HEIGHT: 4.64
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18740.045
G1 X105.819 Y122.66 E-.30473
G1 X105.819 Y122.34 E-.12166
G1 X106.681 Y122.34 E-.32753
G1 X106.681 Y122.356 E-.00607
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/45
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.92 I-.019 J1.217 P1  F30000
G1 X150.444 Y123.032 Z4.92
G1 Z4.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X149.056 Y123.032 E.02879
G1 X149.056 Y121.968 E.02208
G1 X150.444 Y121.968 E.02879
G1 X150.444 Y122.5 E.01104
M73 P94 R0
G1 X150.444 Y122.972 E.0098
G1 X150.868 Y123.457 F30000
G1 F1200
G1 X148.632 Y123.457 E.04638
G1 X148.632 Y121.543 E.03968
G1 X150.868 Y121.543 E.04638
G1 X150.868 Y122.5 E.01984
G1 X150.868 Y123.397 E.0186
G1 X151.292 Y123.881 F30000
G1 F1200
G1 X148.207 Y123.881 E.06398
G1 X148.207 Y121.119 E.05728
G1 X151.292 Y121.119 E.06398
G1 X151.292 Y122.5 E.02864
G1 X151.292 Y123.821 E.0274
M204 S250
G1 X151.701 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X147.798 Y124.29 E.07524
G1 X147.798 Y120.71 E.06901
G1 X151.701 Y120.71 E.07524
G1 X151.701 Y122.5 E.0345
G1 X151.701 Y124.23 E.03335
;========Date 20250206========
; SKIPPABLE_START
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
G1 F1800
M204 S10000
G1 X149.702 Y124.261 E-.76
; WIPE_END
G1 E-.04
G17
G3 Z5.04 I1.2 J-.205 P1  F30000
G1 X149.428 Y122.66 Z5.04
G1 Z4.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345917
G1 F1200
G1 X150.071 Y122.66 E.01007
G1 X150.071 Y122.34 E.00501
G1 X149.428 Y122.34 E.01007
G1 X149.428 Y122.6 E.00407
; WIPE_START
G1 F18740.347
G1 X149.428 Y122.34 E-.1059
G1 X150.071 Y122.34 E-.26189
G1 X150.071 Y122.66 E-.13032
G1 X149.428 Y122.66 E-.26189
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I-.011 J-1.217 P1  F30000
G1 X106.944 Y123.032 Z5.04
G1 Z4.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X105.556 Y123.032 E.02879
G1 X105.556 Y121.968 E.02208
G1 X106.944 Y121.968 E.02879
G1 X106.944 Y122.5 E.01104
G1 X106.944 Y122.972 E.0098
G1 X107.368 Y123.457 F30000
G1 F1200
G1 X105.132 Y123.457 E.04638
G1 X105.132 Y121.543 E.03968
G1 X107.368 Y121.543 E.04638
G1 X107.368 Y122.5 E.01984
G1 X107.368 Y123.397 E.0186
G1 X107.793 Y123.881 F30000
G1 F1200
G1 X104.708 Y123.881 E.06398
G1 X104.708 Y121.119 E.05728
G1 X107.793 Y121.119 E.06398
G1 X107.793 Y122.5 E.02864
G1 X107.793 Y123.821 E.0274
M204 S250
G1 X108.202 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.299 Y124.29 E.07524
G1 X104.299 Y120.71 E.06901
G1 X108.202 Y120.71 E.07524
G1 X108.202 Y122.5 E.0345
G1 X108.202 Y124.23 E.03335
; WIPE_START
G1 F1800
M204 S10000
G1 X106.202 Y124.261 E-.76
; WIPE_END
G1 E-.04
G17
G3 Z5.04 I1.186 J.274 P1  F30000
G1 X106.572 Y122.66 Z5.04
G1 Z4.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345917
G1 F1200
G1 X106.572 Y122.34 E.00501
G1 X105.928 Y122.34 E.01007
G1 X105.928 Y122.66 E.00501
G1 X106.512 Y122.66 E.00913
; CHANGE_LAYER
; Z_HEIGHT: 4.76
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18740.338
G1 X105.928 Y122.66 E-.23746
G1 X105.928 Y122.34 E-.13033
G1 X106.572 Y122.34 E-.26188
G1 X106.572 Y122.66 E-.13032
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/45
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.04 I-.01 J1.217 P1  F30000
G1 X150.321 Y123.032 Z5.04
G1 Z4.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X149.178 Y123.032 E.02371
G1 X149.178 Y121.968 E.02208
G1 X150.321 Y121.968 E.02371
G1 X150.321 Y122.5 E.01104
G1 X150.321 Y122.972 E.0098
G1 X150.746 Y123.457 F30000
G1 F1200
G1 X148.754 Y123.457 E.04131
G1 X148.754 Y121.543 E.03968
G1 X150.746 Y121.543 E.04131
G1 X150.746 Y122.5 E.01984
G1 X150.746 Y123.397 E.0186
G1 X151.17 Y123.881 F30000
G1 F1200
G1 X148.33 Y123.881 E.05891
G1 X148.33 Y121.119 E.05728
G1 X151.17 Y121.119 E.05891
G1 X151.17 Y122.5 E.02864
G1 X151.17 Y123.821 E.0274
M204 S250
G1 X151.579 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X147.921 Y124.29 E.07052
G1 X147.921 Y120.71 E.06901
G1 X151.579 Y120.71 E.07052
G1 X151.579 Y122.5 E.0345
G1 X151.579 Y124.23 E.03335
;========Date 20250206========
; SKIPPABLE_START
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
G1 F1800
M204 S10000
G1 X149.579 Y124.263 E-.76
; WIPE_END
G1 E-.04
G17
G3 Z5.16 I1.217 J-.022 P1  F30000
G1 X149.551 Y122.66 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345917
G1 F1200
G1 X149.949 Y122.66 E.00624
G1 X149.949 Y122.34 E.00501
G1 X149.551 Y122.34 E.00624
G1 X149.551 Y122.6 E.00407
; WIPE_START
G1 F18740.351
G1 X149.551 Y122.34 E-.14351
G1 X149.949 Y122.34 E-.21995
G1 X149.949 Y122.66 E-.1766
G1 X149.551 Y122.66 E-.21995
; WIPE_END
G1 E-.04 F1800
G1 X141.918 Y122.727 Z5.16 F30000
G1 X106.822 Y123.032 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X105.679 Y123.032 E.02371
G1 X105.679 Y121.968 E.02208
G1 X106.822 Y121.968 E.02371
G1 X106.822 Y122.5 E.01104
G1 X106.822 Y122.972 E.0098
G1 X107.246 Y123.457 F30000
G1 F1200
G1 X105.254 Y123.457 E.04131
G1 X105.254 Y121.543 E.03968
G1 X107.246 Y121.543 E.04131
G1 X107.246 Y122.5 E.01984
G1 X107.246 Y123.397 E.0186
G1 X107.67 Y123.881 F30000
G1 F1200
G1 X104.83 Y123.881 E.05891
G1 X104.83 Y121.119 E.05728
M73 P95 R0
G1 X107.67 Y121.119 E.05891
G1 X107.67 Y122.5 E.02864
G1 X107.67 Y123.821 E.0274
M204 S250
G1 X108.079 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.421 Y124.29 E.07052
G1 X104.421 Y120.71 E.06901
G1 X108.079 Y120.71 E.07052
G1 X108.079 Y122.5 E.0345
G1 X108.079 Y124.23 E.03335
; WIPE_START
G1 F1800
M204 S10000
G1 X106.08 Y124.263 E-.76
; WIPE_END
G1 E-.04
G1 X106.449 Y122.66 Z5.16 F30000
G1 Z4.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345922
G1 F1200
G1 X106.449 Y122.34 E.00501
G1 X106.051 Y122.34 E.00624
G1 X106.051 Y122.66 E.00501
G1 X106.389 Y122.66 E.0053
; CHANGE_LAYER
; Z_HEIGHT: 4.88
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F18740.045
G1 X106.051 Y122.66 E-.18685
G1 X106.051 Y122.34 E-.1766
G1 X106.449 Y122.34 E-.21995
G1 X106.449 Y122.66 E-.1766
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/45
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.16 I-.01 J1.217 P1  F30000
G1 X150.184 Y123.032 Z5.16
G1 Z4.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X149.316 Y123.032 E.018
G1 X149.316 Y121.968 E.02208
G1 X150.184 Y121.968 E.018
G1 X150.184 Y122.402 E.009
G1 X150.184 Y122.972 E.01184
G1 X150.608 Y123.457 F30000
G1 F1200
G1 X148.892 Y123.457 E.0356
G1 X148.892 Y121.543 E.03968
G1 X150.608 Y121.543 E.0356
G1 X150.608 Y122.402 E.0178
G1 X150.608 Y123.397 E.02064
G1 X151.032 Y123.881 F30000
G1 F1200
G1 X148.467 Y123.881 E.0532
G1 X148.467 Y121.119 E.05728
G1 X151.032 Y121.119 E.0532
G1 X151.032 Y122.402 E.0266
G1 X151.032 Y123.821 E.02944
M204 S250
G1 X151.442 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X148.058 Y124.29 E.06522
G1 X148.058 Y120.71 E.06901
G1 X151.442 Y120.71 E.06522
G1 X151.442 Y122.402 E.03261
G1 X151.442 Y124.23 E.03524
;========Date 20250206========
; SKIPPABLE_START
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
G1 F1800
M204 S10000
G1 X149.442 Y124.265 E-.76
; WIPE_END
G1 E-.04
G1 X149.75 Y122.598 Z5.28 F30000
G1 Z4.88
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.469412
G1 F1200
G1 X149.75 Y122.462 E.00296
; WIPE_START
G1 F13523.871
G1 X149.75 Y122.598 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.118 Y122.675 Z5.28 F30000
G1 X106.684 Y123.032 Z5.28
G1 Z4.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X105.816 Y123.032 E.018
G1 X105.816 Y121.968 E.02208
G1 X106.684 Y121.968 E.018
G1 X106.684 Y122.402 E.009
G1 X106.684 Y122.972 E.01184
G1 X107.108 Y123.457 F30000
G1 F1200
G1 X105.392 Y123.457 E.0356
G1 X105.392 Y121.543 E.03968
G1 X107.108 Y121.543 E.0356
G1 X107.108 Y122.402 E.0178
G1 X107.108 Y123.397 E.02064
G1 X107.533 Y123.881 F30000
G1 F1200
G1 X104.968 Y123.881 E.0532
G1 X104.968 Y121.119 E.05728
G1 X107.533 Y121.119 E.0532
G1 X107.533 Y122.402 E.0266
G1 X107.533 Y123.821 E.02944
M204 S250
G1 X107.942 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.558 Y124.29 E.06522
G1 X104.558 Y120.71 E.06901
G1 X107.942 Y120.71 E.06522
G1 X107.942 Y122.402 E.03261
G1 X107.942 Y124.23 E.03524
; WIPE_START
G1 F1800
M204 S10000
G1 X105.942 Y124.265 E-.76
; WIPE_END
G1 E-.04
G1 X106.25 Y122.598 Z5.28 F30000
G1 Z4.88
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.469432
G1 F1200
G1 X106.25 Y122.462 E.00296
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F13523.261
G1 X106.25 Y122.598 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/45
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.28 I-.011 J1.217 P1  F30000
G1 X149.995 Y123 Z5.28
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.515172
G1 F1200
G1 X149.505 Y123 E.01171
G1 X149.505 Y122 E.02391
G1 X149.995 Y122 E.01171
G1 X149.995 Y122.245 E.00586
G1 X149.995 Y122.94 E.01662
G1 X150.451 Y123.457 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G1 X149.048 Y123.457 E.0291
G1 X149.048 Y121.543 E.03968
G1 X150.451 Y121.543 E.0291
G1 X150.451 Y122.245 E.01455
G1 X150.451 Y123.397 E.02388
G1 X150.876 Y123.881 F30000
G1 F1200
G1 X148.624 Y123.881 E.0467
G1 X148.624 Y121.119 E.05728
G1 X150.876 Y121.119 E.0467
G1 X150.876 Y122.245 E.02335
G1 X150.876 Y123.821 E.03268
M204 S250
G1 X151.285 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X148.215 Y124.29 E.05918
G1 X148.215 Y120.71 E.06901
G1 X151.285 Y120.71 E.05918
G1 X151.285 Y122.245 E.02959
G1 X151.285 Y124.23 E.03826
;========Date 20250206========
; SKIPPABLE_START
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
G1 F1800
M204 S10000
G1 X149.285 Y124.269 E-.76
; WIPE_END
G1 E-.04
G1 X141.656 Y124.043 Z5.4 F30000
G1 X106.495 Y123 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.515172
G1 F1200
G1 X106.005 Y123 E.01171
G1 X106.005 Y122 E.02391
G1 X106.495 Y122 E.01171
G1 X106.495 Y122.245 E.00586
G1 X106.495 Y122.94 E.01662
G1 X106.952 Y123.457 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G1 X105.549 Y123.457 E.0291
G1 X105.549 Y121.543 E.03968
G1 X106.952 Y121.543 E.0291
G1 X106.952 Y122.245 E.01455
G1 X106.952 Y123.397 E.02388
G1 X107.376 Y123.881 F30000
M73 P96 R0
G1 F1200
G1 X105.124 Y123.881 E.0467
G1 X105.124 Y121.119 E.05728
G1 X107.376 Y121.119 E.0467
G1 X107.376 Y122.245 E.02335
G1 X107.376 Y123.821 E.03268
M204 S250
G1 X107.785 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.715 Y124.29 E.05918
G1 X104.715 Y120.71 E.06901
G1 X107.785 Y120.71 E.05918
G1 X107.785 Y122.245 E.02959
G1 X107.785 Y124.23 E.03826
; CHANGE_LAYER
; Z_HEIGHT: 5.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X105.786 Y124.269 E-.76
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 42/45
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.4 I.022 J1.217 P1  F30000
G1 X150.27 Y123.457 Z5.4
G1 Z5.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X149.23 Y123.457 E.02158
G1 X149.23 Y121.543 E.03968
G1 X150.27 Y121.543 E.02158
G1 X150.27 Y122.064 E.01079
G1 X150.27 Y123.397 E.02765
G1 X150.695 Y123.881 F30000
G1 F1200
G1 X148.806 Y123.881 E.03918
G1 X148.806 Y121.119 E.05728
G1 X150.695 Y121.119 E.03918
G1 X150.695 Y122.064 E.01959
G1 X150.695 Y123.821 E.03645
M204 S250
G1 X151.104 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X148.397 Y124.29 E.05219
G1 X148.397 Y120.71 E.06901
G1 X151.104 Y120.71 E.05219
G1 X151.104 Y122.064 E.02609
G1 X151.104 Y124.23 E.04176
;========Date 20250206========
; SKIPPABLE_START
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
G1 F1800
M204 S10000
G1 X149.104 Y124.274 E-.76
; WIPE_END
G1 E-.04
G1 X149.75 Y122.064 Z5.52 F30000
G1 Z5.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.641932
G1 F1200
G1 X149.75 Y122.936 E.02629
; WIPE_START
G1 F3600
G1 X149.75 Y122.064 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.122 Y122.311 Z5.52 F30000
G1 X106.77 Y123.457 Z5.52
G1 Z5.12
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F1200
G1 X105.73 Y123.457 E.02158
G1 X105.73 Y121.543 E.03968
G1 X106.77 Y121.543 E.02158
G1 X106.77 Y122.064 E.01079
G1 X106.77 Y123.397 E.02765
G1 X107.194 Y123.881 F30000
G1 F1200
G1 X105.305 Y123.881 E.03918
G1 X105.305 Y121.119 E.05728
G1 X107.194 Y121.119 E.03918
G1 X107.194 Y122.064 E.01959
G1 X107.194 Y123.821 E.03645
M204 S250
G1 X107.603 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X104.896 Y124.29 E.05219
G1 X104.896 Y120.71 E.06901
G1 X107.603 Y120.71 E.05219
G1 X107.603 Y122.064 E.02609
G1 X107.603 Y124.23 E.04176
; WIPE_START
G1 F1800
M204 S10000
G1 X105.604 Y124.274 E-.76
; WIPE_END
G1 E-.04
G1 X106.25 Y122.064 Z5.52 F30000
G1 Z5.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.641952
G1 F1200
G1 X106.25 Y122.936 E.02629
; CHANGE_LAYER
; Z_HEIGHT: 5.24
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X106.25 Y122.064 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/45
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.52 I-.037 J1.216 P1  F30000
G1 X150.008 Y123.411 Z5.52
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.541972
G1 F1200
G1 X149.492 Y123.411 E.01303
G1 X149.492 Y121.589 E.04596
G1 X150.008 Y121.589 E.01303
G1 X150.008 Y121.848 E.00651
G1 X150.008 Y123.351 E.03793
G1 X150.478 Y123.881 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G1 X149.022 Y123.881 E.03021
G1 X149.022 Y121.119 E.05728
G1 X150.478 Y121.119 E.03021
G1 X150.478 Y121.848 E.01511
G1 X150.478 Y123.821 E.04093
M204 S250
G1 X150.888 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X148.612 Y124.29 E.04385
G1 X148.612 Y120.71 E.06901
G1 X150.888 Y120.71 E.04385
G1 X150.888 Y121.848 E.02193
G1 X150.888 Y124.23 E.04592
;========Date 20250206========
; SKIPPABLE_START
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
G1 F1800
M204 S10000
G1 X148.888 Y124.283 E-.76
; WIPE_END
G1 E-.04
G1 X141.257 Y124.126 Z5.64 F30000
G1 X106.508 Y123.411 Z5.64
G1 Z5.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.541972
G1 F1200
G1 X105.992 Y123.411 E.01303
G1 X105.992 Y121.589 E.04596
G1 X106.508 Y121.589 E.01303
G1 X106.508 Y121.848 E.00651
G1 X106.508 Y123.351 E.03793
G1 X106.978 Y123.881 F30000
; LINE_WIDTH: 0.449992
G1 F1200
G1 X105.522 Y123.881 E.03021
G1 X105.522 Y121.119 E.05728
G1 X106.978 Y121.119 E.03021
G1 X106.978 Y121.848 E.01511
G1 X106.978 Y123.821 E.04093
M204 S250
G1 X107.388 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X105.112 Y124.29 E.04385
G1 X105.112 Y120.71 E.06901
G1 X107.388 Y120.71 E.04385
G1 X107.388 Y121.848 E.02193
G1 X107.388 Y124.23 E.04592
; CHANGE_LAYER
; Z_HEIGHT: 5.36
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F1800
M204 S10000
G1 X105.388 Y124.283 E-.76
; WIPE_END
G1 E-.04
; layer num/total_layer_count: 44/45
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.64 I.011 J1.217 P1  F30000
G1 X150.208 Y123.881 Z5.64
G1 Z5.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449992
G1 F1200
G1 X149.293 Y123.881 E.01897
G1 X149.293 Y121.119 E.05728
G1 X150.208 Y121.119 E.01897
G1 X150.208 Y121.577 E.00948
G1 X150.208 Y123.821 E.04655
M204 S250
G1 X150.617 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X148.884 Y124.29 E.0334
G1 X148.884 Y120.71 E.06901
M73 P97 R0
G1 X150.617 Y120.71 E.0334
G1 X150.617 Y121.577 E.0167
G1 X150.617 Y124.23 E.05115
;========Date 20250206========
; SKIPPABLE_START
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
G1 F1800
M204 S10000
G1 X148.884 Y124.29 E-.65895
G1 X148.884 Y124.024 E-.10105
; WIPE_END
G1 E-.04
G1 X149.75 Y121.577 Z5.76 F30000
G1 Z5.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.516072
G1 F1200
G1 X149.75 Y123.423 E.04428
; WIPE_START
G1 F3600
G1 X149.75 Y121.577 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.129 Y121.985 Z5.76 F30000
G1 X106.707 Y123.881 Z5.76
G1 Z5.36
G1 E.8 F1800
; LINE_WIDTH: 0.449992
G1 F1200
G1 X105.792 Y123.881 E.01897
G1 X105.792 Y121.119 E.05728
G1 X106.707 Y121.119 E.01897
G1 X106.707 Y121.577 E.00948
G1 X106.707 Y123.821 E.04655
M204 S250
G1 X107.116 Y124.29 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X105.383 Y124.29 E.0334
G1 X105.383 Y120.71 E.06901
G1 X107.116 Y120.71 E.0334
G1 X107.116 Y121.577 E.0167
G1 X107.116 Y124.23 E.05115
; WIPE_START
G1 F1800
M204 S10000
G1 X105.383 Y124.29 E-.65895
G1 X105.383 Y124.024 E-.10105
; WIPE_END
G1 E-.04
G1 X106.25 Y121.577 Z5.76 F30000
G1 Z5.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.516072
G1 F1200
G1 X106.25 Y123.423 E.04428
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F3600
G1 X106.25 Y121.577 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/45
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.76 I-.075 J1.215 P1  F30000
G1 X150.227 Y124.29 Z5.76
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X149.272 Y124.29 E.0184
G1 X149.272 Y120.71 E.06901
G1 X150.227 Y120.71 E.0184
G1 X150.227 Y121.187 E.0092
G1 X150.227 Y124.23 E.05865
;========Date 20250206========
; SKIPPABLE_START
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
G1 F1800
M204 S10000
G1 X149.272 Y124.29 E-.36343
G1 X149.272 Y123.246 E-.39657
; WIPE_END
G1 E-.04
G1 X149.489 Y121.006 Z5.88 F30000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
M204 S2000
G1 X150.01 Y121.527 E.0142
G1 X150.01 Y122.084
G1 X149.489 Y121.564 E.0142
G1 X149.489 Y122.121
G1 X150.01 Y122.642 E.0142
G1 X150.01 Y123.199
G1 X149.489 Y122.679 E.0142
G1 X149.489 Y123.236
G1 X150.01 Y123.757 E.0142
M204 S10000
G1 X150.03 Y123.773 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.238864
G1 F1200
G1 X149.924 Y123.987 E.00249
G1 X149.469 Y123.955 E.00475
; WIPE_START
G1 F21000
G1 X149.924 Y123.987 E-.49865
G1 X150.03 Y123.773 E-.26135
; WIPE_END
G1 E-.04 F1800
G1 X142.398 Y123.864 Z5.88 F30000
G1 X106.728 Y124.29 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419992
G1 F1200
M204 S5000
G1 X105.773 Y124.29 E.0184
G1 X105.773 Y120.71 E.06901
G1 X106.728 Y120.71 E.0184
G1 X106.728 Y121.187 E.0092
G1 X106.728 Y124.23 E.05865
; WIPE_START
G1 F1800
M204 S10000
G1 X105.773 Y124.29 E-.36343
G1 X105.773 Y123.246 E-.39657
; WIPE_END
G1 E-.04
G1 X105.99 Y120.995 Z5.88 F30000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
M204 S2000
G1 X106.511 Y121.516 E.0142
G1 X106.511 Y122.074
G1 X105.99 Y121.553 E.0142
G1 X105.99 Y122.11
M73 P98 R0
G1 X106.511 Y122.631 E.0142
G1 X106.511 Y123.189
G1 X105.99 Y122.668 E.0142
G1 X105.99 Y123.225
G1 X106.511 Y123.746 E.0142
M204 S10000
G1 X106.531 Y123.77 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22856
G1 F1200
G1 X106.421 Y123.983 E.00238
; LINE_WIDTH: 0.256764
G1 X105.97 Y123.944 E.00511
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F21000
G1 X106.421 Y123.983 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.88 I1.217 J0 P1  F30000
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
G1 Z5.98 F900 ; lower z a little
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

    G1 Z105.48 F600
    G1 Z103.48

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

