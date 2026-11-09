; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 37m 47s; total estimated time: 44m 18s
; total layer number: 58
; total filament length [mm] : 6924.05
; total filament volume [cm^3] : 16654.30
; total filament weight [g] : 20.65
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 9.32
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
; sparse_infill_density = 8%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
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
M73 P0 R44
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
M73 P1 R43
G1 E50 F200
M400
M104 S220
G92 E0
M73 P11 R39
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P12 R38
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
    G29 A X85.0032 Y85.0032 I85.9935 J85.9935
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
; layer num/total_layer_count: 1/58
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
; OBJECT_ID: 15
G1 X127.489 Y167.682 F30000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M204 S500
G3 X117.376 Y85.691 I.501 J-41.681 E4.45916
M73 P13 R38
G3 X129.184 Y84.334 I10.605 J40.234 E.44423
G3 X127.549 Y167.683 I-1.194 J41.667 E4.84952
M204 S6000
G1 X127.483 Y168.139 F30000
G1 F1800
M204 S500
G3 X117.259 Y85.249 I.507 J-42.138 E4.50807
G3 X129.196 Y83.877 I10.722 J40.677 E.44904
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.543 Y168.14 I-1.206 J42.124 E4.90279
M204 S6000
G1 X127.478 Y168.596 F30000
; FEATURE: Outer wall
G1 F1800
M204 S500
G3 X117.143 Y84.807 I.512 J-42.595 E4.55694
G3 X129.207 Y83.42 I10.839 J41.119 E.45385
G3 X127.538 Y168.597 I-1.217 J42.581 E4.95604
; WIPE_START
G1 X126.432 Y168.571 E-.42024
G1 X125.539 Y168.527 E-.33976
; WIPE_END
G1 E-.04
M204 S6000
G1 X128.281 Y161.404 Z.6 F30000
G1 X154.274 Y93.876 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50173
G1 F3600
M204 S500
G1 X157.583 Y97.186 E.17497
G3 X161.22 Y101.471 I-29.114 J28.392 E.2103
G1 X152.529 Y92.78 E.45951
G2 X150.419 Y91.32 I-19.855 J26.421 E.09596
G1 X162.68 Y103.581 E.64829
G3 X163.711 Y105.26 I-45.316 J28.959 E.07365
G1 X148.74 Y90.289 E.79153
G2 X147.29 Y89.488 I-17.043 J29.12 E.06198
G1 X164.512 Y106.71 E.91063
G3 X165.179 Y108.025 I-43.602 J22.912 E.05511
G1 X145.975 Y88.821 E1.01538
G2 X144.768 Y88.263 I-11.954 J24.27 E.04972
G1 X165.737 Y109.232 E1.1087
G3 X166.22 Y110.365 I-22.819 J10.412 E.04604
G1 X143.635 Y87.78 E1.19413
G2 X142.565 Y87.359 I-9.112 J21.572 E.04301
G1 X166.641 Y111.435 E1.273
G3 X167.011 Y112.453 I-20.569 J8.035 E.04049
G1 X141.547 Y86.989 E1.34635
M73 P14 R38
G2 X140.573 Y86.665 I-7.11 J19.695 E.03838
M73 P14 R37
G1 X167.335 Y113.427 E1.415
G3 X167.622 Y114.362 I-18.903 J6.302 E.03658
G1 X139.638 Y86.378 E1.4796
G2 X138.736 Y86.125 I-5.611 J18.254 E.03503
G1 X167.875 Y115.264 E1.54068
G3 X168.099 Y116.137 I-17.655 J5 E.03371
G1 X137.863 Y85.901 E1.5987
G2 X137.015 Y85.702 I-4.476 J17.191 E.03255
G1 X168.298 Y116.985 E1.65402
G3 X168.474 Y117.809 I-16.687 J3.99 E.03153
G1 X136.191 Y85.526 E1.70693
G2 X135.386 Y85.37 I-3.577 J16.332 E.03064
M73 P15 R37
G1 X168.629 Y118.614 E1.75769
G1 X168.766 Y119.399 E.02979
G1 X134.601 Y85.234 E1.8064
G2 X133.838 Y85.12 I-2.718 J15.55 E.02885
G1 X168.88 Y120.162 E1.85279
G3 X168.979 Y120.91 I-15.193 J2.397 E.02822
G1 X133.09 Y85.021 E1.89759
G2 X132.355 Y84.935 I-2.111 J14.897 E.02765
G1 X169.065 Y121.645 E1.94096
G1 X169.136 Y122.364 E.02704
G1 X131.636 Y84.864 E1.98277
G2 X130.933 Y84.81 I-1.456 J14.316 E.02636
G1 X169.19 Y123.067 E2.0228
G3 X169.234 Y123.76 I-14.118 J1.243 E.02596
G1 X130.242 Y84.768 E2.06165
G1 X129.564 Y84.739 E.02537
G1 X169.267 Y124.443 E2.09927
G3 X169.285 Y125.109 I-13.427 J.681 E.02491
G1 X128.896 Y84.72 E2.13551
G1 X128.24 Y84.713 E.0245
G1 X169.294 Y125.767 E2.17065
G1 X169.294 Y126.416 E.02426
G1 X127.585 Y84.707 E2.2053
G2 X126.949 Y84.719 I-.137 J9.301 E.0238
G1 X169.281 Y127.051 E2.23824
G3 X169.261 Y127.681 I-12.81 J-.08 E.02355
G1 X126.319 Y84.739 E2.2705
G1 X125.701 Y84.769 E.02315
G1 X169.231 Y128.299 E2.30159
G3 X169.192 Y128.909 I-12.429 J-.494 E.02284
G1 X125.091 Y84.808 E2.33175
G1 X124.487 Y84.853 E.02265
G1 X169.147 Y129.513 E2.36134
G3 X169.09 Y130.104 I-12.142 J-.882 E.02222
G1 X123.896 Y84.91 E2.38957
G2 X123.308 Y84.972 I.956 J12.009 E.02209
G1 X169.028 Y130.692 E2.41739
G1 X168.957 Y131.27 E.02176
G1 X122.73 Y85.043 E2.44417
G2 X122.159 Y85.12 I1.296 J11.69 E.02156
G1 X168.879 Y131.841 E2.47027
G1 X168.796 Y132.406 E.02136
G1 X121.594 Y85.204 E2.49572
G2 X121.038 Y85.297 I1.613 J11.402 E.02108
G1 X168.703 Y132.962 E2.52023
M73 P16 R37
G1 X168.607 Y133.515 E.02098
G1 X120.485 Y85.393 E2.54439
G2 X119.943 Y85.5 I1.91 J11.131 E.02066
G1 X168.5 Y134.057 E2.56741
G3 X168.392 Y134.598 I-11.014 J-1.933 E.02061
G1 X119.402 Y85.608 E2.59024
G1 X118.873 Y85.727 E.0203
G1 X168.273 Y135.127 E2.61196
G3 X168.151 Y135.655 I-10.868 J-2.223 E.02024
G1 X118.345 Y85.849 E2.63343
G1 X117.826 Y85.979 E.02
G1 X168.021 Y136.174 E2.654
G3 X167.888 Y136.689 I-10.57 J-2.461 E.01991
G1 X117.311 Y86.112 E2.6742
G1 X116.803 Y86.253 E.01971
G1 X167.747 Y137.197 E2.69363
G3 X167.603 Y137.701 I-10.334 J-2.696 E.01961
G1 X116.299 Y86.397 E2.71263
G1 X115.801 Y86.548 E.01945
G1 X167.452 Y138.199 E2.73096
G3 X167.296 Y138.693 I-10.107 J-2.917 E.01934
G1 X115.307 Y86.704 E2.74882
G1 X114.82 Y86.865 E.0192
G1 X167.135 Y139.18 E2.76609
G3 X166.969 Y139.663 I-9.923 J-3.137 E.01909
G1 X114.337 Y87.031 E2.78286
G1 X113.859 Y87.202 E.01898
G1 X166.798 Y140.141 E2.79908
M73 P16 R36
G3 X166.622 Y140.614 I-9.739 J-3.345 E.01887
G1 X113.386 Y87.378 E2.81482
G1 X112.917 Y87.558 E.01876
G1 X166.442 Y141.083 E2.83003
G3 X166.257 Y141.547 I-9.547 J-3.538 E.01867
G1 X112.453 Y87.743 E2.84477
G1 X111.995 Y87.933 E.01857
G1 X166.067 Y142.005 E2.85898
G3 X165.873 Y142.46 I-9.36 J-3.722 E.01849
G1 X111.54 Y88.127 E2.87278
G1 X111.09 Y88.326 E.01839
G1 X165.674 Y142.91 E2.88602
G3 X165.471 Y143.356 I-9.17 J-3.893 E.01833
G1 X110.644 Y88.529 E2.8989
G1 X110.203 Y88.737 E.01822
G1 X165.263 Y143.797 E2.91118
G3 X165.052 Y144.235 I-9.003 J-4.064 E.01818
G1 X109.765 Y88.948 E2.92319
G1 X109.334 Y89.165 E.01807
G1 X164.835 Y144.666 E2.93452
G3 X164.616 Y145.096 I-8.938 J-4.279 E.01804
G1 X108.904 Y89.384 E2.94569
M73 P17 R36
G1 X108.481 Y89.61 E.01793
G1 X164.39 Y145.519 E2.95609
G3 X164.163 Y145.941 I-8.779 J-4.439 E.01792
G1 X108.059 Y89.837 E2.96644
G1 X107.644 Y90.071 E.0178
G1 X163.928 Y146.356 E2.97593
G1 X163.694 Y146.77 E.0178
G1 X107.23 Y90.306 E2.98543
G2 X106.824 Y90.549 I4.703 J8.334 E.01769
G1 X163.451 Y147.176 E2.99408
G1 X163.208 Y147.582 E.01768
G1 X106.418 Y90.792 E3.00267
G2 X106.019 Y91.042 I4.905 J8.276 E.0176
G1 X162.958 Y147.981 E3.01055
G1 X162.707 Y148.378 E.01758
G1 X105.622 Y91.293 E3.01826
G2 X105.23 Y91.55 I5.034 J8.108 E.01752
G1 X162.45 Y148.77 E3.0254
G1 X162.19 Y149.159 E.01749
G1 X104.841 Y91.81 E3.03222
G2 X104.456 Y92.074 I5.17 J7.959 E.01745
G1 X161.926 Y149.544 E3.03863
G1 X161.658 Y149.925 E.01741
G1 X104.075 Y92.342 E3.04459
G2 X103.697 Y92.613 I5.297 J7.806 E.01739
G1 X161.387 Y150.303 E3.05028
G1 X161.111 Y150.675 E.01734
G1 X103.325 Y92.889 E3.05537
G2 X102.953 Y93.166 I5.507 J7.771 E.01734
G1 X160.834 Y151.047 E3.06036
G1 X160.549 Y151.412 E.01728
G1 X102.588 Y93.451 E3.06459
G1 X102.224 Y93.735 E.01728
G1 X160.265 Y151.776 E3.06882
G3 X159.973 Y152.133 I-7.438 J-5.782 E.01724
G1 X101.867 Y94.027 E3.07227
G1 X101.511 Y94.319 E.01724
G1 X159.681 Y152.489 E3.07565
G3 X159.382 Y152.84 I-7.302 J-5.911 E.01721
G1 X101.16 Y94.618 E3.07842
M73 P18 R36
G1 X100.812 Y94.918 E.0172
G1 X159.082 Y153.188 E3.08095
G3 X158.777 Y153.533 I-7.173 J-6.041 E.01719
G1 X100.467 Y95.223 E3.08304
G1 X100.127 Y95.531 E.01717
G1 X158.469 Y153.873 E3.08473
G3 X158.158 Y154.211 I-7.052 J-6.179 E.01717
G1 X99.789 Y95.842 E3.08615
G1 X99.457 Y96.159 E.01716
G1 X157.841 Y154.543 E3.08699
G3 X157.524 Y154.875 I-6.871 J-6.259 E.01716
G1 X99.125 Y96.476 E3.08774
G1 X98.801 Y96.8 E.01715
G1 X157.2 Y155.199 E3.08774
G1 X156.875 Y155.524 E.01715
G1 X98.476 Y97.125 E3.08774
G2 X98.159 Y97.456 I6.594 J6.628 E.01716
G1 X156.544 Y155.841 E3.08699
G1 X156.211 Y156.157 E.01716
G1 X97.843 Y97.789 E3.08615
G2 X97.532 Y98.127 I6.728 J6.504 E.01717
G1 X155.873 Y156.468 E3.08473
G1 X155.533 Y156.777 E.01717
G1 X97.223 Y98.467 E3.08304
G2 X96.919 Y98.811 I6.865 J6.383 E.01719
G1 X155.189 Y157.081 E3.08095
G1 X154.84 Y157.382 E.0172
G1 X96.618 Y99.16 E3.07842
M73 P18 R35
G2 X96.32 Y99.51 I6.983 J6.244 E.01721
G1 X154.49 Y157.68 E3.07565
G1 X154.133 Y157.973 E.01724
G1 X96.027 Y99.867 E3.07228
G2 X95.735 Y100.224 I7.159 J6.15 E.01724
G1 X153.776 Y158.265 E3.06883
G1 X153.412 Y158.549 E.01728
G1 X95.451 Y100.588 E3.0646
M73 P19 R35
G1 X95.167 Y100.952 E.01728
G1 X153.048 Y158.833 E3.06037
G3 X152.676 Y159.111 I-5.835 J-7.433 E.01734
G1 X94.889 Y101.324 E3.05538
G1 X94.613 Y101.697 E.01734
G1 X152.303 Y159.387 E3.05029
G3 X151.925 Y159.658 I-5.696 J-7.563 E.01739
G1 X94.342 Y102.075 E3.04459
G1 X94.074 Y102.456 E.01741
G1 X151.544 Y159.926 E3.03864
G3 X151.159 Y160.189 I-5.554 J-7.694 E.01745
G1 X93.811 Y102.841 E3.03223
G1 X93.551 Y103.23 E.01749
G1 X150.77 Y160.449 E3.02541
G3 X150.378 Y160.706 I-5.421 J-7.842 E.01752
G1 X93.294 Y103.622 E3.01827
G1 X93.042 Y104.019 E.01758
G1 X149.981 Y160.958 E3.01056
G3 X149.582 Y161.208 I-5.294 J-8.011 E.0176
G1 X92.792 Y104.418 E3.00268
G1 X92.549 Y104.824 E.01768
G1 X149.176 Y161.451 E2.99409
G3 X148.77 Y161.694 I-5.089 J-8.057 E.01769
G1 X92.306 Y105.23 E2.98544
G1 X92.072 Y105.644 E.0178
G1 X148.356 Y161.928 E2.97595
G1 X147.942 Y162.163 E.0178
G1 X91.837 Y106.058 E2.96645
G2 X91.611 Y106.48 I8.53 J4.85 E.01792
G1 X147.52 Y162.389 E2.95611
G1 X147.097 Y162.615 E.01793
G1 X91.385 Y106.903 E2.9457
G2 X91.166 Y107.333 I8.629 J4.664 E.01804
G1 X146.667 Y162.834 E2.93454
G1 X146.235 Y163.052 E.01807
G1 X90.948 Y107.765 E2.92321
M73 P20 R35
G2 X90.738 Y108.203 I8.85 J4.53 E.01818
G1 X145.797 Y163.262 E2.9112
G1 X145.357 Y163.471 E.01822
G1 X90.529 Y108.643 E2.89892
G2 X90.327 Y109.09 I8.98 J4.345 E.01833
G1 X144.91 Y163.673 E2.88603
G1 X144.461 Y163.873 E.01839
G1 X90.127 Y109.539 E2.8728
G2 X89.933 Y109.994 I9.178 J4.183 E.01849
G1 X144.006 Y164.067 E2.859
G1 X143.547 Y164.257 E.01857
G1 X89.743 Y110.453 E2.84479
G2 X89.558 Y110.917 I9.342 J3.995 E.01867
G1 X143.083 Y164.442 E2.83005
G1 X142.615 Y164.622 E.01876
G1 X89.378 Y111.385 E2.81484
G2 X89.202 Y111.858 I9.541 J3.81 E.01887
G1 X142.142 Y164.798 E2.7991
G1 X141.664 Y164.969 E.01898
G1 X89.031 Y112.336 E2.78288
G2 X88.865 Y112.819 I9.75 J3.618 E.01909
G1 X141.181 Y165.135 E2.76611
G1 X140.693 Y165.296 E.0192
G1 X88.704 Y113.307 E2.74884
G2 X88.549 Y113.8 I9.955 J3.412 E.01934
G1 X140.2 Y165.451 E2.73099
G1 X139.702 Y165.602 E.01945
G1 X88.398 Y114.298 E2.71265
G2 X88.253 Y114.802 I10.212 J3.206 E.01961
G1 X139.198 Y165.747 E2.69365
G1 X138.69 Y165.888 E.01971
G1 X88.112 Y115.31 E2.67422
G2 X87.979 Y115.826 I10.449 J2.98 E.01991
G1 X138.174 Y166.021 E2.65402
G1 X137.656 Y166.151 E.02
G1 X87.849 Y116.344 E2.63346
M73 P21 R34
G2 X87.727 Y116.872 I10.684 J2.737 E.02024
G1 X137.128 Y166.273 E2.61199
G1 X136.598 Y166.392 E.0203
G1 X87.608 Y117.402 E2.59027
G2 X87.5 Y117.942 I10.966 J2.485 E.0206
G1 X136.058 Y166.5 E2.56744
G3 X135.516 Y166.607 I-2.44 J-10.962 E.02066
G1 X87.393 Y118.484 E2.54442
G1 X87.297 Y119.037 E.02098
G1 X134.963 Y166.703 E2.52026
G3 X134.407 Y166.796 I-2.162 J-11.264 E.02108
G1 X87.204 Y119.593 E2.49575
G1 X87.121 Y120.158 E.02136
G1 X133.842 Y166.879 E2.47031
G3 X133.27 Y166.957 I-1.868 J-11.613 E.02156
G1 X87.043 Y120.73 E2.4442
G1 X86.972 Y121.307 E.02176
G1 X132.693 Y167.028 E2.41743
G3 X132.105 Y167.09 I-1.547 J-11.972 E.02209
G1 X86.91 Y121.895 E2.38961
G2 X86.853 Y122.486 I12.075 J1.473 E.02221
G1 X131.514 Y167.147 E2.36138
G1 X130.91 Y167.192 E.02265
G1 X86.808 Y123.09 E2.33179
G2 X86.769 Y123.7 I12.389 J1.104 E.02284
G1 X130.3 Y167.231 E2.30164
G1 X129.682 Y167.261 E.02315
G1 X86.739 Y124.318 E2.27054
G2 X86.719 Y124.948 I12.82 J.71 E.02355
G1 X129.052 Y167.281 E2.23829
G3 X128.417 Y167.294 I-.59 J-12.948 E.02377
G1 X86.706 Y125.583 E2.20539
G1 X86.706 Y126.232 E.02426
G1 X127.768 Y167.294 E2.17109
G3 X127.11 Y167.285 I-.137 J-13.438 E.02462
G1 X86.715 Y126.89 E2.13578
G2 X86.732 Y127.557 I13.475 J-.015 E.02491
M73 P22 R34
G1 X126.443 Y167.267 E2.09966
G1 X125.761 Y167.234 E.02554
G1 X86.766 Y128.239 E2.0618
G2 X86.81 Y128.932 I14.139 J-.548 E.02596
G1 X125.068 Y167.19 E2.02285
G3 X124.365 Y167.136 I.752 J-14.348 E.02636
G1 X86.864 Y129.635 E1.98282
G1 X86.935 Y130.354 E.02704
G1 X123.646 Y167.065 E1.94102
G3 X122.911 Y166.979 I1.374 J-14.973 E.02765
G1 X87.021 Y131.089 E1.89765
G2 X87.12 Y131.837 I15.276 J-1.646 E.02822
G1 X122.163 Y166.88 E1.85285
G3 X121.4 Y166.766 I1.951 J-15.65 E.02885
G1 X87.234 Y132.6 E1.80647
G1 X87.37 Y133.385 E.02979
G1 X120.615 Y166.63 E1.75776
G3 X119.81 Y166.474 I2.768 J-16.47 E.03064
G1 X87.526 Y134.19 E1.70699
G2 X87.702 Y135.014 I16.896 J-3.173 E.03153
G1 X118.986 Y166.298 E1.65409
G3 X118.138 Y166.1 I3.631 J-17.398 E.03255
G1 X87.9 Y135.862 E1.59878
G2 X88.125 Y136.735 I17.874 J-4.125 E.0337
G1 X117.265 Y165.875 E1.54076
G3 X116.363 Y165.622 I4.7 J-18.479 E.03503
G1 X88.378 Y137.637 E1.47968
G2 X88.664 Y138.572 I19.146 J-5.352 E.03657
G1 X115.428 Y165.336 E1.41508
G3 X114.454 Y165.011 I6.133 J-20.012 E.03837
G1 X88.989 Y139.546 E1.34644
G2 X89.358 Y140.564 I20.914 J-7.007 E.04049
G1 X113.436 Y164.642 E1.27311
G3 X112.366 Y164.221 I8.047 J-22.008 E.04301
G1 X89.779 Y141.634 E1.19424
G2 X90.263 Y142.766 I23.293 J-9.276 E.04603
G1 X111.234 Y163.737 E1.10882
G3 X110.027 Y163.179 I10.744 J-24.821 E.04972
G1 X90.821 Y143.973 E1.0155
G2 X91.487 Y145.288 I44.275 J-21.598 E.0551
G1 X108.712 Y162.513 E.91078
G3 X107.262 Y161.712 I15.585 J-29.912 E.06197
G1 X92.288 Y146.738 E.79169
M73 P23 R34
G2 X93.318 Y148.417 I46.153 J-27.158 E.07363
G1 X105.583 Y160.682 E.64849
G3 X103.474 Y159.222 I17.707 J-27.83 E.09591
G1 X94.778 Y150.526 E.45981
G2 X98.399 Y154.796 I32.693 J-24.055 E.20949
G1 X101.731 Y158.128 E.17617
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3600
G1 X100.317 Y156.713 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/58
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
G3 Z.6 I-.466 J1.124 P1  F30000
G1 X127.486 Y167.967 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P23 R33
G3 X126.454 Y84.055 I.505 J-41.969 E3.51766
G3 X129.486 Y84.053 I1.539 J46.704 E.08216
G3 X127.546 Y167.968 I-1.495 J41.945 E3.5445
G1 X127.481 Y168.383 F30000
G1 F9000
G3 X126.439 Y83.639 I.51 J-42.384 E3.5525
G3 X129.501 Y83.638 I1.554 J47.184 E.08298
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.384 I-1.51 J42.361 E3.57962
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.784 E.00008
G3 X126.424 Y83.239 I.515 J-42.785 E3.32725
G3 X129.515 Y83.238 I1.568 J47.662 E.07773
G3 X128.525 Y168.783 I-1.525 J42.761 E3.3278
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.784 E-.02292
G1 X126.425 Y168.761 E-.39928
G1 X125.537 Y168.717 E-.33779
; WIPE_END
G1 E-.04 F1800
G1 X132.713 Y166.118 Z.76 F30000
G1 X154.732 Y158.14 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421576
G1 F11620.701
G1 X157.821 Y155.051 E.11029
G2 X161.184 Y151.141 I-29.577 J-28.835 E.13026
G1 X153.141 Y159.184 E.28713
G3 X151.233 Y160.544 I-26.707 J-35.44 E.05916
G1 X162.544 Y149.233 E.4038
G2 X163.527 Y147.702 I-38.688 J-25.929 E.04593
G1 X149.702 Y161.527 E.49356
G3 X148.383 Y162.299 I-16.368 J-26.471 E.03859
G1 X164.299 Y146.383 E.56821
G2 X164.949 Y145.185 I-24.02 J-13.811 E.0344
G1 X147.185 Y162.949 E.63417
G3 X146.092 Y163.494 I-38.753 J-76.292 E.03084
G1 X165.494 Y144.092 E.69267
G2 X165.971 Y143.068 I-20.605 J-10.208 E.02851
G1 X145.068 Y163.971 E.74623
G3 X144.1 Y164.391 I-9.056 J-19.532 E.02664
G1 X166.391 Y142.1 E.79578
G2 X166.764 Y141.179 I-18.58 J-8.072 E.0251
G1 X143.179 Y164.764 E.84201
G3 X142.297 Y165.099 I-7.267 J-17.838 E.02382
G1 X167.099 Y140.297 E.88544
G2 X167.4 Y139.448 I-17.077 J-6.536 E.02274
G1 X141.448 Y165.4 E.92649
G1 X140.631 Y165.67 E.02174
G1 X167.67 Y138.631 E.96533
G2 X167.911 Y137.842 I-15.913 J-5.289 E.02081
G1 X139.842 Y165.911 E1.00207
G3 X139.076 Y166.129 I-4.832 J-15.486 E.02012
G1 X168.129 Y137.076 E1.03723
G2 X168.329 Y136.329 I-15.096 J-4.428 E.01952
G1 X138.329 Y166.329 E1.07101
G3 X137.599 Y166.511 I-4.09 J-14.824 E.01899
G1 X168.511 Y135.599 E1.10358
G1 X168.67 Y134.893 E.01827
M73 P24 R33
G1 X136.893 Y166.67 E1.13445
G3 X136.201 Y166.814 I-3.291 J-14.023 E.01786
G1 X168.814 Y134.201 E1.16433
G2 X168.947 Y133.52 I-13.796 J-3.046 E.0175
G1 X135.52 Y166.947 E1.19336
G1 X134.857 Y167.062 E.01698
G1 X169.062 Y132.858 E1.22112
G2 X169.165 Y132.207 I-13.222 J-2.419 E.01662
G1 X134.207 Y167.165 E1.248
G3 X133.565 Y167.259 I-2.25 J-13.085 E.01638
G1 X169.259 Y131.565 E1.27428
G1 X169.336 Y130.941 E.01589
G1 X132.941 Y167.336 E1.29933
G3 X132.323 Y167.405 I-1.724 J-12.528 E.01568
G1 X169.405 Y130.324 E1.32385
G1 X169.465 Y129.716 E.01541
G1 X131.716 Y167.465 E1.34767
G3 X131.121 Y167.513 I-1.263 J-12.09 E.01507
G1 X169.513 Y129.121 E1.37061
G2 X169.556 Y128.53 I-12.162 J-1.183 E.01495
G1 X130.53 Y167.556 E1.39323
G1 X129.954 Y167.584 E.01456
G1 X169.584 Y127.954 E1.4148
G2 X169.608 Y127.382 I-11.655 J-.784 E.01446
G1 X129.382 Y167.608 E1.4361
G1 X128.821 Y167.622 E.01418
G1 X169.622 Y126.821 E1.45663
G2 X169.63 Y126.266 I-11.281 J-.433 E.01402
G1 X128.266 Y167.63 E1.47673
G1 X127.718 Y167.63 E.01383
G1 X169.63 Y125.718 E1.49628
G2 X169.622 Y125.178 I-11.03 J-.114 E.01363
G1 X127.178 Y167.622 E1.51528
G1 X126.643 Y167.609 E.0135
G1 X169.609 Y124.643 E1.5339
G2 X169.588 Y124.117 I-10.704 J.174 E.01329
G1 X126.117 Y167.588 E1.55191
G1 X125.595 Y167.562 E.01319
G1 X169.562 Y123.595 E1.56963
G2 X169.528 Y123.082 I-10.517 J.443 E.01299
G1 X125.082 Y167.528 E1.58674
G1 X124.572 Y167.49 E.01291
G1 X169.49 Y122.572 E1.6036
G2 X169.444 Y122.07 I-10.253 J.684 E.01272
G1 X124.07 Y167.444 E1.61988
G1 X123.572 Y167.395 E.01265
G1 X169.395 Y121.572 E1.63593
G2 X169.339 Y121.081 I-10.052 J.909 E.01248
G1 X123.081 Y167.339 E1.65144
G1 X122.593 Y167.278 E.0124
G1 X169.278 Y120.593 E1.6667
G2 X169.212 Y120.112 I-9.813 J1.111 E.01226
G1 X122.112 Y167.212 E1.6815
G1 X121.635 Y167.141 E.01217
G1 X169.141 Y119.635 E1.696
G2 X169.066 Y119.163 I-9.685 J1.31 E.01207
G1 X121.163 Y167.066 E1.71015
G1 X120.696 Y166.985 E.01196
G1 X168.985 Y118.696 E1.72392
G2 X168.9 Y118.233 I-9.475 J1.48 E.01189
G1 X120.233 Y166.9 E1.73747
G1 X119.776 Y166.81 E.01176
G1 X168.81 Y117.776 E1.75053
G2 X168.718 Y117.32 I-9.367 J1.656 E.01173
G1 X119.32 Y166.718 E1.7635
G1 X118.873 Y166.617 E.01157
G1 X168.617 Y116.873 E1.77588
G1 X168.517 Y116.426 E.01157
G1 X118.426 Y166.517 E1.78826
G3 X117.987 Y166.408 I1.995 J-8.994 E.01142
G1 X168.408 Y115.987 E1.80005
G1 X168.298 Y115.549 E.0114
G1 X117.549 Y166.298 E1.81177
G3 X117.117 Y166.183 I2.138 J-8.871 E.01129
G1 X168.183 Y115.117 E1.82308
G1 X168.064 Y114.688 E.01124
G1 X116.688 Y166.064 E1.83416
G3 X116.262 Y165.942 I2.271 J-8.758 E.01118
G1 X167.942 Y114.262 E1.84502
G1 X167.815 Y113.842 E.01108
G1 X115.842 Y165.815 E1.85547
G1 X115.422 Y165.687 E.01108
G1 X167.687 Y113.422 E1.86591
G1 X167.551 Y113.01 E.01094
G1 X115.01 Y165.551 E1.87575
G1 X114.598 Y165.415 E.01094
G1 X167.415 Y112.599 E1.8856
G2 X167.274 Y112.192 I-8.328 J2.672 E.01086
G1 X114.192 Y165.274 E1.89505
G1 X113.789 Y165.13 E.01081
G1 X167.13 Y111.789 E1.90429
G2 X166.983 Y111.388 I-8.258 J2.789 E.01078
G1 X113.388 Y164.983 E1.91338
G1 X112.993 Y164.831 E.01069
G1 X166.831 Y110.993 E1.92205
G1 X166.678 Y110.597 E.01069
G1 X112.597 Y164.678 E1.93072
G3 X112.209 Y164.519 I3.044 J-7.979 E.0106
G1 X166.519 Y110.209 E1.9389
G1 X166.359 Y109.822 E.01058
G1 X111.822 Y164.359 E1.947
G3 X111.438 Y164.195 I3.155 J-7.934 E.01054
G1 X166.195 Y109.438 E1.95486
G1 X166.027 Y109.058 E.01048
G1 X111.058 Y164.027 E1.9624
G1 X110.679 Y163.859 E.01048
G1 X165.859 Y108.679 E1.96994
G2 X165.683 Y108.307 I-7.677 J3.393 E.01039
G1 X110.307 Y163.683 E1.97696
G1 X109.935 Y163.507 E.01038
G1 X165.507 Y107.935 E1.98396
G2 X165.328 Y107.567 I-7.588 J3.469 E.01034
G1 X109.567 Y163.328 E1.9907
G1 X109.203 Y163.144 E.0103
G1 X165.144 Y107.203 E1.99716
G1 X164.961 Y106.838 E.0103
G1 X108.838 Y162.961 E2.00362
G3 X108.481 Y162.771 I3.62 J-7.215 E.01022
G1 X164.771 Y106.481 E2.00956
G1 X164.58 Y106.124 E.01022
G1 X108.124 Y162.58 E2.0155
G3 X107.771 Y162.386 I3.769 J-7.292 E.01018
G1 X164.386 Y105.771 E2.0212
G1 X164.188 Y105.421 E.01014
G1 X107.421 Y162.188 E2.02661
G1 X107.071 Y161.99 E.01014
G1 X163.99 Y105.071 E2.03202
G2 X163.785 Y104.728 I-7.155 J4.032 E.01008
G1 X106.728 Y161.785 E2.03697
G1 X106.386 Y161.58 E.01008
G1 X163.58 Y104.386 E2.04186
G2 X163.372 Y104.046 I-7.015 J4.051 E.01006
G1 X106.046 Y161.372 E2.04659
G1 X105.711 Y161.16 E.01002
G1 X163.16 Y103.711 E2.05098
G1 X162.948 Y103.375 E.01002
G1 X105.375 Y160.948 E2.05537
G3 X105.045 Y160.73 I4.271 J-6.831 E.00998
G1 X162.73 Y103.045 E2.05938
G1 X162.511 Y102.717 E.00997
G1 X104.717 Y160.511 E2.06327
G3 X104.39 Y160.29 I4.327 J-6.768 E.00996
G1 X162.29 Y102.39 E2.06707
G1 X162.064 Y102.069 E.00992
G1 X104.069 Y160.064 E2.07046
G1 X103.747 Y159.837 E.00992
G1 X161.837 Y101.747 E2.07385
G2 X161.607 Y101.43 I-6.558 J4.516 E.0099
G1 X103.43 Y159.607 E2.07696
G1 X103.115 Y159.374 E.00988
G1 X161.374 Y101.116 E2.07986
M73 P25 R33
G1 X161.141 Y100.801 E.00988
G1 X102.801 Y159.141 E2.08276
G3 X102.493 Y158.901 I4.705 J-6.356 E.00985
G1 X160.901 Y100.493 E2.08519
G1 X160.661 Y100.186 E.00985
G1 X102.186 Y158.661 E2.0876
G3 X101.88 Y158.418 I4.782 J-6.334 E.00984
G1 X160.418 Y99.88 E2.08984
G1 X160.172 Y99.58 E.00982
G1 X101.58 Y158.172 E2.09177
G1 X101.279 Y157.925 E.00982
G1 X159.925 Y99.279 E2.09369
G2 X159.673 Y98.983 I-6.119 J4.951 E.00981
G1 X100.983 Y157.673 E2.09527
G1 X100.689 Y157.419 E.0098
G1 X159.419 Y98.689 E2.09671
G2 X159.165 Y98.396 I-6.109 J5.036 E.0098
G1 X100.396 Y157.165 E2.09811
G1 X100.108 Y156.905 E.00979
G1 X158.905 Y98.108 E2.09907
G1 X158.644 Y97.821 E.00979
G1 X99.821 Y156.644 E2.10003
G3 X99.537 Y156.381 I5.224 J-5.921 E.00978
G1 X158.381 Y97.537 E2.10077
G1 X158.114 Y97.256 E.00978
G1 X99.256 Y156.114 E2.10125
G1 X98.976 Y155.847 E.00978
G1 X157.847 Y96.976 E2.10173
G2 X157.574 Y96.701 I-5.712 J5.388 E.00978
G1 X98.701 Y155.574 E2.10182
G1 X98.427 Y155.3 E.00978
G1 X157.3 Y96.427 E2.10182
G2 X157.025 Y96.154 I-5.65 J5.424 E.00978
G1 X98.154 Y155.025 E2.10173
G1 X97.887 Y154.745 E.00978
G1 X156.745 Y95.887 E2.10125
G1 X156.464 Y95.62 E.00978
G1 X97.62 Y154.464 E2.10077
G3 X97.357 Y154.18 I5.656 J-5.508 E.00978
G1 X156.18 Y95.357 E2.10003
G1 X155.893 Y95.096 E.00979
G1 X97.096 Y153.893 E2.09907
G1 X96.836 Y153.606 E.00979
G1 X155.606 Y94.836 E2.09811
G2 X155.312 Y94.582 I-5.317 J5.838 E.0098
G1 X96.582 Y153.312 E2.09672
G1 X96.328 Y153.018 E.0098
G1 X155.018 Y94.328 E2.09527
G2 X154.722 Y94.076 I-5.281 J5.906 E.00981
G1 X96.076 Y152.722 E2.0937
G1 X95.829 Y152.421 E.00982
G1 X154.421 Y93.829 E2.09177
G1 X154.121 Y93.582 E.00982
G1 X95.582 Y152.121 E2.08985
G3 X95.34 Y151.815 I6.096 J-5.092 E.00984
G1 X153.815 Y93.34 E2.08761
G1 X153.508 Y93.1 E.00985
G1 X95.1 Y151.508 E2.0852
G3 X94.86 Y151.2 I6.079 J-4.985 E.00985
G1 X153.2 Y92.86 E2.08277
G1 X152.886 Y92.627 E.00988
G1 X94.627 Y150.886 E2.07987
G1 X94.394 Y150.571 E.00988
G1 X152.571 Y92.394 E2.07697
G2 X152.254 Y92.163 I-4.84 J6.334 E.0099
G1 X94.163 Y150.254 E2.07387
M73 P25 R32
G1 X93.937 Y149.933 E.00992
G1 X151.933 Y91.937 E2.07047
G1 X151.611 Y91.711 E.00992
G1 X93.711 Y149.611 E2.06708
G3 X93.49 Y149.284 I6.557 J-4.661 E.00996
G1 X151.284 Y91.49 E2.06328
G1 X150.956 Y91.271 E.00997
G1 X93.271 Y148.956 E2.05939
G3 X93.053 Y148.626 I6.598 J-4.591 E.00998
G1 X150.626 Y91.053 E2.05539
G1 X150.291 Y90.841 E.01002
G1 X92.841 Y148.291 E2.051
G1 X92.628 Y147.955 E.01002
G1 X149.955 Y90.628 E2.04661
G2 X149.615 Y90.421 I-4.387 J6.8 E.01006
G1 X92.421 Y147.615 E2.04188
G1 X92.216 Y147.273 E.01008
G1 X149.273 Y90.216 E2.03699
G2 X148.93 Y90.011 I-4.372 J6.943 E.01008
G1 X92.011 Y146.93 E2.03204
G1 X91.813 Y146.58 E.01014
G1 X148.58 Y89.813 E2.02663
G1 X148.231 Y89.615 E.01014
G1 X91.615 Y146.231 E2.02122
G3 X91.421 Y145.877 I7.127 J-4.14 E.01018
G1 X147.877 Y89.421 E2.01552
G1 X147.52 Y89.23 E.01022
G1 X91.23 Y145.52 E2.00959
G3 X91.04 Y145.163 I7.403 J-4.18 E.01022
G1 X147.163 Y89.04 E2.00364
G1 X146.799 Y88.856 E.0103
G1 X90.856 Y144.799 E1.99718
G1 X90.673 Y144.435 E.0103
G1 X146.435 Y88.673 E1.99072
G2 X146.066 Y88.493 I-3.839 J7.41 E.01034
G1 X90.493 Y144.066 E1.98398
G1 X90.318 Y143.695 E.01038
G1 X145.695 Y88.318 E1.97699
G2 X145.322 Y88.142 I-3.666 J7.29 E.01039
G1 X90.142 Y143.322 E1.96997
G1 X89.974 Y142.943 E.01048
G1 X144.943 Y87.974 E1.96243
G1 X144.564 Y87.806 E.01048
G1 X89.806 Y142.564 E1.95489
G3 X89.642 Y142.18 I7.724 J-3.52 E.01054
G1 X144.18 Y87.642 E1.94703
G1 X143.792 Y87.482 E.01058
G1 X89.482 Y141.792 E1.93893
G3 X89.322 Y141.404 I7.858 J-3.45 E.0106
G1 X143.404 Y87.322 E1.93075
G1 X143.009 Y87.17 E.01069
G1 X89.17 Y141.009 E1.92208
M73 P26 R32
G1 X89.017 Y140.614 E.01069
G1 X142.614 Y87.017 E1.91342
G2 X142.213 Y86.871 I-3.183 J8.089 E.01078
G1 X88.871 Y140.213 E1.90433
G1 X88.727 Y139.809 E.01081
G1 X141.809 Y86.727 E1.89508
G2 X141.403 Y86.585 I-3.095 J8.231 E.01086
G1 X88.585 Y139.403 E1.88563
G1 X88.449 Y138.991 E.01094
G1 X140.991 Y86.449 E1.87579
G1 X140.58 Y86.313 E.01094
G1 X88.313 Y138.58 E1.86595
G1 X88.185 Y138.16 E.01108
G1 X140.16 Y86.185 E1.85551
G1 X139.74 Y86.058 E.01108
G1 X88.058 Y137.74 E1.84506
G3 X87.936 Y137.314 I8.609 J-2.69 E.01118
G1 X139.314 Y85.936 E1.8342
G1 X138.885 Y85.818 E.01123
G1 X87.818 Y136.885 E1.82312
G3 X87.702 Y136.452 I8.715 J-2.559 E.01129
G1 X138.452 Y85.702 E1.81182
G1 X138.015 Y85.592 E.0114
G1 X87.592 Y136.015 E1.8001
G3 X87.484 Y135.576 I8.953 J-2.452 E.01142
G1 X137.576 Y85.484 E1.78831
G1 X137.128 Y85.383 E.01157
G1 X87.383 Y135.128 E1.77593
G1 X87.283 Y134.681 E.01157
G1 X136.681 Y85.283 E1.76355
G2 X136.226 Y85.191 I-2.11 J9.263 E.01173
G1 X87.191 Y134.226 E1.75058
G1 X87.1 Y133.769 E.01176
G1 X135.769 Y85.1 E1.73751
G2 X135.305 Y85.016 I-1.941 J9.369 E.01189
G1 X87.016 Y133.305 E1.72397
G1 X86.935 Y132.839 E.01196
G1 X134.839 Y84.935 E1.7102
G2 X134.367 Y84.859 I-1.776 J9.568 E.01207
G1 X86.859 Y132.367 E1.69606
G1 X86.788 Y131.89 E.01217
G1 X133.89 Y84.788 E1.68156
G2 X133.409 Y84.722 I-1.595 J9.764 E.01226
G1 X86.722 Y131.409 E1.66675
G1 X86.662 Y130.921 E.0124
G1 X132.921 Y84.662 E1.6515
G2 X132.43 Y84.605 I-1.399 J9.971 E.01248
G1 X86.605 Y130.43 E1.63599
G1 X86.556 Y129.932 E.01265
G1 X131.932 Y84.556 E1.61994
G2 X131.43 Y84.51 I-1.187 J10.214 E.01272
G1 X86.51 Y129.43 E1.60367
G1 X86.472 Y128.92 E.01291
G1 X130.92 Y84.472 E1.5868
G2 X130.406 Y84.438 I-.915 J9.912 E.01299
G1 X86.438 Y128.407 E1.56969
G1 X86.412 Y127.885 E.01319
G1 X129.884 Y84.413 E1.55195
G2 X129.359 Y84.391 I-.746 J11.302 E.01327
G1 X86.391 Y127.359 E1.53397
G1 X86.378 Y126.824 E.0135
G1 X128.824 Y84.378 E1.51536
G2 X128.284 Y84.37 I-.427 J11.004 E.01363
G1 X86.37 Y126.284 E1.49636
G1 X86.37 Y125.736 E.01382
G1 X127.736 Y84.37 E1.4768
G2 X127.181 Y84.378 I-.123 J11.298 E.01402
G1 X86.378 Y125.181 E1.45671
G1 X86.391 Y124.62 E.01418
G1 X126.62 Y84.391 E1.43618
G2 X126.048 Y84.416 I.21 J11.657 E.01445
G1 X86.416 Y124.048 E1.41489
G1 X86.444 Y123.472 E.01456
G1 X125.472 Y84.444 E1.39332
G2 X124.881 Y84.487 I.577 J12.011 E.01495
G1 X86.487 Y122.881 E1.3707
G3 X86.534 Y122.286 I12.154 J.669 E.01507
G1 X124.286 Y84.534 E1.34776
G1 X123.679 Y84.594 E.01541
G1 X86.594 Y121.679 E1.32394
G3 X86.664 Y121.062 I12.642 J1.11 E.01568
G1 X123.062 Y84.664 E1.29943
G1 X122.437 Y84.741 E.01589
G1 X86.741 Y120.437 E1.27438
G3 X86.835 Y119.795 I13.127 J1.6 E.01638
G1 X121.795 Y84.835 E1.2481
G2 X121.145 Y84.938 I1.765 J13.311 E.01662
G1 X86.938 Y119.145 E1.22123
G1 X87.052 Y118.482 E.01698
G1 X120.482 Y85.052 E1.19347
G2 X119.802 Y85.185 I2.363 J13.922 E.0175
G1 X87.185 Y117.802 E1.16444
G3 X87.33 Y117.11 I14.173 J2.599 E.01785
G1 X119.11 Y85.33 E1.13457
G1 X118.404 Y85.488 E.01827
G1 X87.488 Y116.404 E1.10369
G3 X87.671 Y115.674 I14.792 J3.305 E.01899
G1 X117.674 Y85.671 E1.07113
G2 X116.927 Y85.87 I3.68 J15.295 E.01952
G1 X87.87 Y114.927 E1.03736
G3 X88.088 Y114.161 I15.702 J4.064 E.02011
G1 X116.161 Y86.088 E1.0022
G2 X115.373 Y86.329 I4.498 J16.151 E.02081
G1 X88.329 Y113.373 E.96548
G1 X88.599 Y112.555 E.02174
G1 X114.555 Y86.599 E.92663
G2 X113.706 Y86.9 I5.709 J17.444 E.02273
G1 X88.9 Y111.706 E.8856
G3 X89.234 Y110.824 I18.123 J6.365 E.02381
G1 X112.824 Y87.234 E.84218
G2 X111.903 Y87.608 I7.144 J18.941 E.02509
G1 X89.608 Y109.903 E.79596
G3 X90.028 Y108.935 I19.903 J8.065 E.02663
G1 X110.935 Y88.028 E.74642
G2 X109.912 Y88.504 I9.172 J21.061 E.0285
G1 X90.504 Y107.912 E.69288
G3 X91.049 Y106.819 I77.531 J37.988 E.03082
G1 X108.819 Y89.049 E.63442
G2 X107.622 Y89.698 I12.657 J24.754 E.03439
G1 X91.698 Y105.622 E.56848
G3 X92.47 Y104.303 I27.26 J15.055 E.03857
G1 X106.303 Y90.47 E.49386
G2 X104.773 Y91.452 I24.28 J39.501 E.04589
G1 X93.452 Y102.773 E.40418
G3 X94.81 Y100.867 I36.653 J24.685 E.05909
G1 X102.867 Y92.81 E.28764
G2 X98.993 Y96.137 I24.761 J32.756 E.129
G1 X95.85 Y99.28 E.11219
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11620.701
G1 X97.264 Y97.865 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/58
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.76 I-1.118 J.482 P1  F30000
G1 X127.486 Y167.968 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P27 R32
G3 X124.398 Y84.181 I.506 J-41.969 E3.46177
G3 X129.453 Y84.053 I3.632 J43.319 E.13709
G3 X127.546 Y167.968 I-1.461 J41.946 E3.54544
G1 X127.481 Y168.383 F30000
G1 F9000
G3 X124.362 Y83.767 I.511 J-42.384 E3.49605
G3 X129.468 Y83.637 I3.668 J43.752 E.13847
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.384 I-1.476 J42.362 E3.58055
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.784 E.00007
G3 X124.328 Y83.368 I.516 J-42.785 E3.27438
G3 X129.482 Y83.237 I3.703 J44.168 E.1297
G3 X128.525 Y168.784 I-1.491 J42.762 E3.32868
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.784 E-.02291
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.3378
; WIPE_END
G1 E-.04 F1800
G1 X118.54 Y165.669 Z.92 F30000
G1 X101.28 Y158.15 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421576
G1 F11620.701
G1 X98.138 Y155.008 E.11217
G3 X94.81 Y151.133 I29.42 J-28.628 E.12902
G1 X102.867 Y159.19 E.28763
G2 X104.773 Y160.548 I26.604 J-35.312 E.0591
G1 X93.452 Y149.227 E.40417
G3 X92.47 Y147.697 I38.483 J-25.788 E.0459
G1 X106.303 Y161.53 E.49386
G2 X107.622 Y162.302 I16.395 J-26.523 E.03857
G1 X91.698 Y146.378 E.56848
G3 X91.049 Y145.181 I24.054 J-13.827 E.03439
G1 X108.819 Y162.951 E.63442
G2 X109.912 Y163.496 I39.209 J-77.246 E.03082
G1 X90.504 Y144.088 E.69287
G3 X90.028 Y143.065 I20.571 J-10.19 E.0285
G1 X110.935 Y163.972 E.74642
G2 X111.903 Y164.392 I9.055 J-19.536 E.02663
G1 X89.608 Y142.097 E.79596
G3 X89.234 Y141.176 I18.528 J-8.049 E.02509
G1 X112.824 Y164.766 E.84218
G2 X113.706 Y165.1 I7.264 J-17.833 E.02381
G1 X88.9 Y140.294 E.8856
G3 X88.599 Y139.445 I17.089 J-6.538 E.02273
G1 X114.555 Y165.401 E.92663
G1 X115.373 Y165.671 E.02174
G1 X88.329 Y138.627 E.96548
G3 X88.088 Y137.839 I15.921 J-5.29 E.02081
G1 X116.161 Y165.912 E1.0022
G2 X116.927 Y166.13 I4.843 J-15.527 E.02011
G1 X87.87 Y137.073 E1.03736
G3 X87.671 Y136.326 I15.094 J-4.426 E.01952
G1 X117.674 Y166.329 E1.07113
G2 X118.404 Y166.512 I4.144 J-15.045 E.01899
G1 X87.488 Y135.596 E1.10369
G1 X87.33 Y134.89 E.01827
G1 X119.11 Y166.67 E1.13457
G2 X119.802 Y166.815 I3.294 J-14.045 E.01785
G1 X87.185 Y134.198 E1.16444
G3 X87.052 Y133.518 I13.812 J-3.048 E.0175
G1 X120.482 Y166.948 E1.19347
G1 X121.145 Y167.062 E.01698
G1 X86.938 Y132.855 E1.22123
G3 X86.835 Y132.205 I13.193 J-2.413 E.01662
G1 X121.795 Y167.165 E1.2481
G2 X122.437 Y167.259 I2.236 J-13.002 E.01638
G1 X86.741 Y131.563 E1.27438
G1 X86.664 Y130.938 E.01589
G1 X123.062 Y167.336 E1.29943
G2 X123.679 Y167.406 I1.725 J-12.546 E.01568
G1 X86.594 Y130.321 E1.32394
G1 X86.534 Y129.714 E.01541
G1 X124.286 Y167.466 E1.34776
G2 X124.881 Y167.513 I1.264 J-12.115 E.01507
G1 X86.487 Y129.119 E1.3707
G3 X86.444 Y128.528 I12.01 J-1.171 E.01495
G1 X125.472 Y167.556 E1.39331
G1 X126.048 Y167.584 E.01456
G1 X86.416 Y127.952 E1.41489
G3 X86.391 Y127.38 I11.623 J-.781 E.01445
G1 X126.62 Y167.609 E1.43618
G1 X127.181 Y167.622 E.01418
G1 X86.378 Y126.819 E1.45671
G3 X86.37 Y126.264 I11.29 J-.432 E.01402
G1 X127.736 Y167.63 E1.4768
G1 X128.284 Y167.63 E.01382
G1 X86.37 Y125.716 E1.49635
G3 X86.378 Y125.176 I10.997 J-.113 E.01363
G1 X128.824 Y167.622 E1.51535
G1 X129.359 Y167.609 E.0135
G1 X86.391 Y124.641 E1.53397
G3 X86.412 Y124.115 I10.723 J.176 E.01329
G1 X129.885 Y167.588 E1.55198
G1 X130.407 Y167.562 E.01319
G1 X86.438 Y123.593 E1.5697
G3 X86.472 Y123.08 I10.464 J.441 E.01299
G1 X130.92 Y167.528 E1.5868
G1 X131.43 Y167.49 E.01291
G1 X86.51 Y122.57 E1.60367
G3 X86.556 Y122.068 I10.285 J.688 E.01272
G1 X131.932 Y167.444 E1.61994
G1 X132.43 Y167.395 E.01265
G1 X86.605 Y121.57 E1.63599
G3 X86.662 Y121.079 I10.041 J.909 E.01248
G1 X132.921 Y167.338 E1.6515
G1 X133.409 Y167.278 E.0124
G1 X86.722 Y120.591 E1.66675
G3 X86.788 Y120.11 I9.833 J1.115 E.01226
G1 X133.89 Y167.212 E1.68156
G1 X134.367 Y167.141 E.01217
G1 X86.859 Y119.633 E1.69606
G3 X86.935 Y119.161 I9.667 J1.308 E.01207
G1 X134.839 Y167.065 E1.7102
G1 X135.305 Y166.984 E.01196
G1 X87.016 Y118.695 E1.72397
G3 X87.1 Y118.231 I9.469 J1.48 E.01189
G1 X135.769 Y166.9 E1.73751
G1 X136.226 Y166.809 E.01176
G1 X87.191 Y117.774 E1.75058
G3 X87.283 Y117.319 I9.379 J1.66 E.01173
G1 X136.681 Y166.717 E1.76355
G1 X137.128 Y166.617 E.01157
G1 X87.383 Y116.872 E1.77593
G1 X87.484 Y116.424 E.01157
G1 X137.576 Y166.516 E1.78831
G2 X138.015 Y166.408 I-2.008 J-9.041 E.01142
G1 X87.592 Y115.985 E1.8001
G1 X87.702 Y115.548 E.0114
G1 X138.452 Y166.298 E1.81181
G2 X138.885 Y166.182 I-2.127 J-8.83 E.01129
G1 X87.818 Y115.115 E1.82312
G1 X87.936 Y114.686 E.01123
G1 X139.314 Y166.064 E1.8342
G2 X139.74 Y165.942 I-2.265 J-8.732 E.01118
G1 X88.058 Y114.26 E1.84506
G1 X88.185 Y113.84 E.01108
G1 X140.16 Y165.814 E1.85551
G1 X140.58 Y165.687 E.01108
G1 X88.313 Y113.42 E1.86595
M73 P27 R31
G1 X88.449 Y113.009 E.01094
G1 X140.991 Y165.551 E1.87579
G1 X141.403 Y165.415 E.01094
G1 X88.585 Y112.597 E1.88563
G3 X88.727 Y112.191 I8.338 J2.677 E.01086
G1 X141.809 Y165.273 E1.89508
G1 X142.213 Y165.129 E.01081
G1 X88.871 Y111.787 E1.90433
G3 X89.017 Y111.386 I8.291 J2.802 E.01078
G1 X142.614 Y164.983 E1.91342
G1 X143.009 Y164.83 E.01069
G1 X89.17 Y110.991 E1.92208
G1 X89.322 Y110.596 E.01069
G1 X143.404 Y164.678 E1.93075
G2 X143.792 Y164.518 I-3.028 J-7.936 E.0106
G1 X89.482 Y110.208 E1.93893
G1 X89.642 Y109.82 E.01058
G1 X144.18 Y164.358 E1.94703
G2 X144.564 Y164.194 I-3.153 J-7.926 E.01054
G1 X89.806 Y109.436 E1.95489
G1 X89.974 Y109.057 E.01048
G1 X144.943 Y164.026 E1.96243
G1 X145.322 Y163.858 E.01048
G1 X90.142 Y108.678 E1.96997
G3 X90.318 Y108.305 I7.573 J3.345 E.01039
G1 X145.695 Y163.682 E1.97699
G1 X146.066 Y163.507 E.01038
G1 X90.493 Y107.934 E1.98398
G3 X90.673 Y107.565 I7.577 J3.465 E.01034
G1 X146.435 Y163.327 E1.99072
M73 P28 R31
G1 X146.799 Y163.144 E.0103
G1 X90.856 Y107.201 E1.99718
G1 X91.04 Y106.837 E.0103
G1 X147.163 Y162.96 E2.00364
G2 X147.52 Y162.77 I-3.617 J-7.21 E.01022
G1 X91.23 Y106.48 E2.00959
G1 X91.421 Y106.123 E.01022
G1 X147.877 Y162.579 E2.01552
G2 X148.231 Y162.385 I-3.772 J-7.295 E.01018
G1 X91.615 Y105.769 E2.02122
G1 X91.813 Y105.42 E.01014
G1 X148.58 Y162.187 E2.02663
G1 X148.93 Y161.989 E.01014
G1 X92.011 Y105.07 E2.03204
G3 X92.216 Y104.727 I7.135 J4.021 E.01008
G1 X149.273 Y161.784 E2.03698
G1 X149.615 Y161.579 E.01008
G1 X92.421 Y104.385 E2.04188
G3 X92.628 Y104.045 I7.015 J4.051 E.01006
G1 X149.955 Y161.372 E2.04661
G1 X150.291 Y161.159 E.01002
G1 X92.841 Y103.709 E2.051
G1 X93.053 Y103.374 E.01002
G1 X150.626 Y160.947 E2.05539
G2 X150.956 Y160.729 I-4.267 J-6.824 E.00998
G1 X93.271 Y103.044 E2.05939
G1 X93.49 Y102.716 E.00997
G1 X151.284 Y160.51 E2.06328
G2 X151.611 Y160.289 I-4.349 J-6.801 E.00996
G1 X93.711 Y102.389 E2.06708
G1 X93.937 Y102.067 E.00992
G1 X151.933 Y160.063 E2.07047
G1 X152.254 Y159.837 E.00992
G1 X94.163 Y101.746 E2.07387
G3 X94.394 Y101.429 I6.578 J4.532 E.0099
G1 X152.571 Y159.606 E2.07697
G1 X152.886 Y159.373 E.00988
G1 X94.627 Y101.114 E2.07987
G1 X94.86 Y100.8 E.00988
G1 X153.2 Y159.14 E2.08277
G2 X153.508 Y158.9 I-4.64 J-6.272 E.00985
G1 X95.1 Y100.492 E2.0852
G1 X95.34 Y100.184 E.00985
G1 X153.815 Y158.66 E2.08761
G2 X154.121 Y158.418 I-4.799 J-6.355 E.00984
G1 X95.582 Y99.879 E2.08985
G1 X95.829 Y99.579 E.00982
G1 X154.421 Y158.171 E2.09177
G1 X154.722 Y157.924 E.00982
G1 X96.076 Y99.278 E2.0937
G3 X96.328 Y98.982 I6.162 J4.989 E.00981
G1 X155.018 Y157.672 E2.09527
G1 X155.312 Y157.418 E.0098
G1 X96.582 Y98.688 E2.09672
G3 X96.836 Y98.394 I6.126 J5.053 E.0098
G1 X155.606 Y157.164 E2.09811
G1 X155.893 Y156.904 E.00979
G1 X97.096 Y98.107 E2.09907
G1 X97.357 Y97.82 E.00979
G1 X156.18 Y156.643 E2.10003
G2 X156.464 Y156.38 I-5.217 J-5.912 E.00978
G1 X97.62 Y97.536 E2.10077
G1 X97.887 Y97.255 E.00978
G1 X156.745 Y156.113 E2.10125
G1 X157.025 Y155.846 E.00978
G1 X98.154 Y96.975 E2.10173
G3 X98.427 Y96.7 I5.731 J5.408 E.00978
G1 X157.3 Y155.573 E2.10182
G1 X157.574 Y155.299 E.00978
G1 X98.701 Y96.426 E2.10182
G3 X98.976 Y96.153 I5.691 J5.467 E.00978
G1 X157.847 Y155.024 E2.10173
G1 X158.114 Y154.744 E.00978
G1 X99.256 Y95.886 E2.10125
G1 X99.537 Y95.619 E.00978
G1 X158.381 Y154.463 E2.10077
G2 X158.644 Y154.179 I-5.658 J-5.509 E.00978
G1 X99.821 Y95.356 E2.10003
G1 X100.108 Y95.095 E.00979
G1 X158.905 Y153.892 E2.09907
G1 X159.165 Y153.604 E.00979
G1 X100.396 Y94.835 E2.09811
G3 X100.689 Y94.581 I5.348 J5.876 E.0098
G1 X159.419 Y153.311 E2.09671
G1 X159.673 Y153.017 E.0098
G1 X100.983 Y94.327 E2.09527
G3 X101.279 Y94.075 I5.282 J5.909 E.00981
G1 X159.925 Y152.721 E2.09369
G1 X160.172 Y152.42 E.00982
G1 X101.58 Y93.828 E2.09177
G1 X101.88 Y93.582 E.00982
G1 X160.418 Y152.12 E2.08984
G2 X160.661 Y151.814 I-6.08 J-5.077 E.00984
G1 X102.186 Y93.339 E2.0876
G1 X102.493 Y93.099 E.00985
G1 X160.901 Y151.507 E2.08519
G2 X161.141 Y151.199 I-6.081 J-4.985 E.00985
G1 X102.801 Y92.859 E2.08276
G1 X103.115 Y92.626 E.00988
G1 X161.374 Y150.884 E2.07986
G1 X161.607 Y150.57 E.00988
G1 X103.43 Y92.393 E2.07696
G3 X103.747 Y92.163 I4.848 J6.347 E.0099
G1 X161.837 Y150.253 E2.07385
G1 X162.064 Y149.931 E.00992
G1 X104.069 Y91.936 E2.07046
G1 X104.39 Y91.71 E.00992
G1 X162.29 Y149.61 E2.06707
G2 X162.511 Y149.283 I-6.551 J-4.657 E.00996
G1 X104.717 Y91.489 E2.06327
G1 X105.045 Y91.27 E.00997
G1 X162.73 Y148.955 E2.05938
G2 X162.948 Y148.625 I-6.575 J-4.576 E.00998
G1 X105.375 Y91.052 E2.05537
G1 X105.711 Y90.84 E.01002
G1 X163.16 Y148.289 E2.05098
G1 X163.372 Y147.954 E.01002
G1 X106.046 Y90.628 E2.04659
G3 X106.386 Y90.42 I4.407 J6.834 E.01006
G1 X163.58 Y147.614 E2.04186
G1 X163.785 Y147.272 E.01008
G1 X106.728 Y90.215 E2.03697
M73 P29 R31
G3 X107.071 Y90.01 I4.31 J6.841 E.01008
G1 X163.99 Y146.929 E2.03202
G1 X164.188 Y146.579 E.01014
G1 X107.421 Y89.812 E2.02661
G1 X107.771 Y89.614 E.01014
G1 X164.386 Y146.229 E2.0212
G2 X164.58 Y145.876 I-7.082 J-4.114 E.01018
G1 X108.124 Y89.42 E2.0155
G1 X108.481 Y89.229 E.01022
G1 X164.771 Y145.519 E2.00957
G2 X164.961 Y145.162 I-7.212 J-4.077 E.01022
G1 X108.838 Y89.039 E2.00362
G1 X109.203 Y88.856 E.0103
G1 X165.144 Y144.797 E1.99716
G1 X165.328 Y144.433 E.0103
G1 X109.567 Y88.672 E1.9907
G3 X109.935 Y88.493 I3.839 J7.412 E.01034
G1 X165.507 Y144.065 E1.98396
G1 X165.683 Y143.693 E.01038
G1 X110.307 Y88.317 E1.97696
G3 X110.679 Y88.141 I3.756 J7.48 E.01039
G1 X165.859 Y143.321 E1.96994
G1 X166.027 Y142.942 E.01048
G1 X111.058 Y87.973 E1.9624
G1 X111.438 Y87.805 E.01048
G1 X166.195 Y142.562 E1.95486
G2 X166.359 Y142.178 I-7.739 J-3.526 E.01054
G1 X111.822 Y87.641 E1.947
G1 X112.209 Y87.481 E.01058
G1 X166.519 Y141.791 E1.9389
G2 X166.678 Y141.403 I-7.869 J-3.453 E.0106
G1 X112.597 Y87.322 E1.93072
G1 X112.993 Y87.169 E.01069
G1 X166.831 Y141.007 E1.92205
G1 X166.983 Y140.612 E.01069
G1 X113.388 Y87.017 E1.91338
G3 X113.789 Y86.87 I3.184 J8.097 E.01078
G1 X167.13 Y140.211 E1.90429
G1 X167.274 Y139.808 E.01081
G1 X114.192 Y86.726 E1.89505
G3 X114.598 Y86.585 I3.079 J8.189 E.01086
G1 X167.415 Y139.402 E1.8856
G1 X167.551 Y138.99 E.01094
G1 X115.01 Y86.449 E1.87575
G1 X115.422 Y86.313 E.01094
G1 X167.687 Y138.578 E1.86591
G1 X167.815 Y138.158 E.01108
G1 X115.842 Y86.185 E1.85547
G1 X116.262 Y86.058 E.01108
G1 X167.942 Y137.738 E1.84502
G2 X168.064 Y137.312 I-8.62 J-2.693 E.01118
G1 X116.688 Y85.936 E1.83416
G1 X117.117 Y85.817 E.01123
G1 X168.183 Y136.883 E1.82308
G2 X168.298 Y136.451 I-8.726 J-2.562 E.01129
G1 X117.549 Y85.702 E1.81177
G1 X117.987 Y85.592 E.0114
G1 X168.408 Y136.013 E1.80005
G2 X168.517 Y135.574 I-8.887 J-2.435 E.01142
G1 X118.426 Y85.483 E1.78827
G1 X118.873 Y85.383 E.01157
G1 X168.617 Y135.127 E1.77588
G1 X168.718 Y134.68 E.01157
G1 X119.32 Y85.282 E1.7635
G3 X119.776 Y85.19 I2.1 J9.217 E.01173
G1 X168.81 Y134.224 E1.75053
G1 X168.9 Y133.767 E.01176
G1 X120.233 Y85.1 E1.73747
G3 X120.696 Y85.015 I1.95 J9.423 E.01189
G1 X168.985 Y133.304 E1.72392
G1 X169.066 Y132.837 E.01196
G1 X121.163 Y84.934 E1.71015
G3 X121.635 Y84.859 I1.779 J9.593 E.01207
G1 X169.141 Y132.365 E1.696
G1 X169.212 Y131.888 E.01217
G1 X122.112 Y84.788 E1.6815
G3 X122.593 Y84.722 I1.597 J9.782 E.01226
G1 X169.278 Y131.407 E1.6667
G1 X169.339 Y130.919 E.0124
G1 X123.081 Y84.661 E1.65144
G3 X123.572 Y84.605 I1.396 J9.959 E.01248
G1 X169.395 Y130.428 E1.63593
G1 X169.444 Y129.93 E.01265
G1 X124.07 Y84.556 E1.61988
G3 X124.572 Y84.51 I1.184 J10.186 E.01272
G1 X169.49 Y129.428 E1.6036
G1 X169.528 Y128.918 E.01291
G1 X125.082 Y84.472 E1.58674
G3 X125.595 Y84.438 I.953 J10.421 E.01299
G1 X169.562 Y128.405 E1.56963
G1 X169.588 Y127.883 E.01319
G1 X126.117 Y84.412 E1.55191
G3 X126.643 Y84.391 I.701 J10.693 E.01329
G1 X169.609 Y127.357 E1.5339
G1 X169.622 Y126.822 E.0135
G1 X127.178 Y84.378 E1.51529
G3 X127.718 Y84.37 I.426 J10.981 E.01363
G1 X169.63 Y126.282 E1.49628
G1 X169.63 Y125.734 E.01383
G1 X128.266 Y84.37 E1.47673
G3 X128.821 Y84.378 I.122 J11.312 E.01402
G1 X169.622 Y125.179 E1.45663
G1 X169.608 Y124.618 E.01418
G1 X129.382 Y84.391 E1.4361
G3 X129.956 Y84.417 I-.285 J12.766 E.01449
G1 X169.584 Y124.046 E1.41476
G1 X169.556 Y123.47 E.01456
G1 X130.53 Y84.444 E1.39323
G3 X131.121 Y84.487 I-.515 J11.164 E.01495
G1 X169.513 Y122.879 E1.37061
G2 X169.465 Y122.284 I-12.156 J.67 E.01507
G1 X131.716 Y84.535 E1.34767
G1 X132.323 Y84.595 E.01541
G1 X169.405 Y121.677 E1.32385
G2 X169.336 Y121.059 I-12.614 J1.108 E.01568
G1 X132.941 Y84.664 E1.29933
G1 X133.565 Y84.741 E.01589
G1 X169.259 Y120.435 E1.27428
G2 X169.165 Y119.793 I-13.063 J1.591 E.01638
G1 X134.207 Y84.835 E1.248
G3 X134.857 Y84.938 I-1.767 J13.311 E.01662
G1 X169.062 Y119.142 E1.22112
G1 X168.947 Y118.48 E.01698
M73 P30 R31
G1 X135.52 Y85.053 E1.19336
G3 X136.201 Y85.186 I-2.353 J13.863 E.0175
G1 X168.814 Y117.799 E1.16433
G2 X168.67 Y117.107 I-14.146 J2.594 E.01786
G1 X136.893 Y85.33 E1.13445
G1 X137.599 Y85.489 E.01827
G1 X168.511 Y116.401 E1.10357
M73 P30 R30
G2 X168.329 Y115.671 I-14.875 J3.327 E.01899
G1 X138.329 Y85.671 E1.07101
G3 X139.076 Y85.871 I-3.674 J15.269 E.01952
G1 X168.129 Y114.924 E1.03723
G2 X167.911 Y114.158 I-15.729 J4.073 E.02012
G1 X139.842 Y86.089 E1.00207
G3 X140.631 Y86.33 I-4.519 J16.212 E.02081
G1 X167.67 Y113.369 E.96533
G1 X167.4 Y112.552 E.02174
G1 X141.448 Y86.6 E.92649
G3 X142.297 Y86.901 I-5.718 J17.465 E.02273
G1 X167.099 Y111.703 E.88544
G2 X166.764 Y110.821 I-18.178 J6.387 E.02382
G1 X143.179 Y87.236 E.84201
G3 X144.1 Y87.609 I-7.145 J18.941 E.0251
G1 X166.391 Y109.9 E.79579
G2 X165.971 Y108.932 I-19.943 J8.084 E.02664
G1 X145.068 Y88.029 E.74623
G3 X146.092 Y88.506 I-9.191 J21.097 E.02851
G1 X165.494 Y107.908 E.69267
G2 X164.949 Y106.815 I-77.218 J37.848 E.03084
G1 X147.185 Y89.051 E.63417
G3 X148.383 Y89.701 I-12.631 J24.701 E.0344
G1 X164.299 Y105.617 E.56821
G2 X163.527 Y104.298 I-27.264 J15.062 E.03859
G1 X149.702 Y90.473 E.49356
G3 X151.233 Y91.456 I-24.443 J39.74 E.04593
G1 X162.544 Y102.767 E.4038
G2 X161.184 Y100.859 I-36.782 J24.785 E.05915
G1 X153.141 Y92.816 E.28714
G3 X157.051 Y96.178 I-24.926 J32.941 E.13026
G1 X160.14 Y99.268 E.1103
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11620.701
G1 X158.726 Y97.854 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/58
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.92 I-1.112 J-.495 P1  F30000
G1 X127.486 Y167.968 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X124.398 Y84.181 I.504 J-41.969 E3.4619
G3 X129.43 Y84.052 I3.629 J43.268 E.13649
G3 X127.546 Y167.969 I-1.441 J41.947 E3.54597
G1 X127.481 Y168.383 F30000
G1 F9000
G3 X123.328 Y83.869 I.51 J-42.384 E3.46791
G3 X129.441 Y83.636 I4.658 J41.988 E.16591
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.384 I-1.45 J42.363 E3.58126
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.784 E.00007
G3 X123.284 Y83.471 I.515 J-42.785 E3.24804
G3 X129.451 Y83.236 I4.701 J42.379 E.15529
G3 X128.525 Y168.784 I-1.46 J42.763 E3.32942
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.784 E-.0229
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.33781
; WIPE_END
G1 E-.04 F1800
G1 X132.713 Y166.118 Z1.08 F30000
G1 X154.732 Y158.14 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421576
G1 F11620.701
G1 X157.821 Y155.051 E.11029
G2 X161.184 Y151.141 I-29.576 J-28.834 E.13026
G1 X153.141 Y159.184 E.28713
G3 X151.233 Y160.544 I-26.673 J-35.394 E.05916
G1 X162.544 Y149.233 E.4038
G2 X163.527 Y147.702 I-38.726 J-25.954 E.04593
G1 X149.702 Y161.527 E.49356
G3 X148.383 Y162.299 I-16.378 J-26.486 E.03859
G1 X164.299 Y146.383 E.56821
G2 X164.949 Y145.185 I-24.025 J-13.814 E.0344
G1 X147.185 Y162.949 E.63417
G3 X146.092 Y163.494 I-38.771 J-76.331 E.03084
G1 X165.494 Y144.092 E.69267
G2 X165.971 Y143.068 I-20.605 J-10.208 E.02851
G1 X145.068 Y163.971 E.74623
G3 X144.1 Y164.391 I-9.056 J-19.532 E.02664
G1 X166.391 Y142.1 E.79578
G2 X166.764 Y141.179 I-18.575 J-8.069 E.0251
G1 X143.179 Y164.764 E.84201
G3 X142.297 Y165.099 I-7.268 J-17.839 E.02382
G1 X167.099 Y140.297 E.88544
G2 X167.4 Y139.448 I-17.122 J-6.552 E.02274
G1 X141.448 Y165.4 E.92649
G1 X140.631 Y165.67 E.02174
G1 X167.67 Y138.631 E.96533
G2 X167.911 Y137.842 I-15.902 J-5.286 E.02081
G1 X139.842 Y165.911 E1.00207
G3 X139.076 Y166.129 I-4.832 J-15.486 E.02012
G1 X168.129 Y137.076 E1.03723
G2 X168.329 Y136.329 I-15.096 J-4.428 E.01952
G1 X138.329 Y166.329 E1.07101
G3 X137.599 Y166.511 I-4.09 J-14.824 E.01899
G1 X168.511 Y135.599 E1.10358
G1 X168.67 Y134.893 E.01827
G1 X136.893 Y166.67 E1.13445
G3 X136.201 Y166.814 I-3.291 J-14.023 E.01786
G1 X168.814 Y134.201 E1.16433
G2 X168.947 Y133.52 I-13.796 J-3.046 E.0175
G1 X135.52 Y166.947 E1.19336
G1 X134.857 Y167.062 E.01698
G1 X169.062 Y132.858 E1.22112
G2 X169.165 Y132.207 I-13.222 J-2.419 E.01662
G1 X134.207 Y167.165 E1.248
G3 X133.565 Y167.259 I-2.25 J-13.085 E.01638
G1 X169.259 Y131.565 E1.27428
G1 X169.336 Y130.941 E.01589
G1 X132.941 Y167.336 E1.29933
G3 X132.323 Y167.405 I-1.724 J-12.528 E.01568
G1 X169.405 Y130.324 E1.32385
G1 X169.465 Y129.716 E.01541
G1 X131.716 Y167.465 E1.34767
G3 X131.121 Y167.513 I-1.266 J-12.123 E.01507
G1 X169.513 Y129.121 E1.37061
G2 X169.556 Y128.53 I-12.162 J-1.183 E.01495
G1 X130.53 Y167.556 E1.39323
G1 X129.954 Y167.584 E.01456
G1 X169.584 Y127.954 E1.4148
G2 X169.608 Y127.382 I-11.655 J-.784 E.01446
G1 X129.382 Y167.608 E1.4361
G1 X128.821 Y167.622 E.01418
G1 X169.622 Y126.821 E1.45663
G2 X169.63 Y126.266 I-11.281 J-.433 E.01402
G1 X128.266 Y167.63 E1.47673
G1 X127.718 Y167.63 E.01383
G1 X169.63 Y125.718 E1.49628
G2 X169.622 Y125.178 I-11.03 J-.114 E.01363
G1 X127.178 Y167.622 E1.51528
G1 X126.643 Y167.609 E.0135
G1 X169.609 Y124.643 E1.5339
G2 X169.588 Y124.117 I-10.704 J.174 E.01329
G1 X126.117 Y167.588 E1.55191
G1 X125.595 Y167.562 E.01319
G1 X169.562 Y123.595 E1.56963
G2 X169.528 Y123.082 I-10.517 J.443 E.01299
G1 X125.082 Y167.528 E1.58674
G1 X124.572 Y167.49 E.01291
G1 X169.49 Y122.572 E1.6036
G2 X169.444 Y122.07 I-10.246 J.683 E.01272
G1 X124.07 Y167.444 E1.61988
G1 X123.572 Y167.395 E.01265
G1 X169.395 Y121.572 E1.63593
G2 X169.339 Y121.081 I-10.052 J.909 E.01248
G1 X123.081 Y167.339 E1.65144
G1 X122.593 Y167.278 E.0124
G1 X169.278 Y120.593 E1.6667
G2 X169.212 Y120.112 I-9.813 J1.111 E.01226
G1 X122.112 Y167.212 E1.6815
G1 X121.635 Y167.141 E.01217
G1 X169.141 Y119.635 E1.696
G2 X169.066 Y119.163 I-9.685 J1.31 E.01207
G1 X121.163 Y167.066 E1.71015
G1 X120.696 Y166.985 E.01196
G1 X168.985 Y118.696 E1.72392
G2 X168.9 Y118.233 I-9.475 J1.48 E.01189
G1 X120.233 Y166.9 E1.73747
G1 X119.776 Y166.81 E.01176
G1 X168.81 Y117.776 E1.75053
G2 X168.718 Y117.32 I-9.367 J1.656 E.01173
G1 X119.32 Y166.718 E1.7635
G1 X118.873 Y166.617 E.01157
G1 X168.617 Y116.873 E1.77588
M73 P31 R30
G1 X168.517 Y116.426 E.01157
G1 X118.426 Y166.517 E1.78826
G3 X117.987 Y166.408 I1.995 J-8.994 E.01142
G1 X168.408 Y115.987 E1.80005
G1 X168.298 Y115.549 E.0114
G1 X117.549 Y166.298 E1.81177
G3 X117.117 Y166.183 I2.133 J-8.853 E.01129
G1 X168.183 Y115.117 E1.82308
G1 X168.064 Y114.688 E.01124
G1 X116.688 Y166.064 E1.83416
G3 X116.262 Y165.942 I2.265 J-8.736 E.01118
G1 X167.942 Y114.262 E1.84502
G1 X167.815 Y113.842 E.01108
G1 X115.842 Y165.815 E1.85547
G1 X115.422 Y165.687 E.01108
G1 X167.687 Y113.422 E1.86591
G1 X167.551 Y113.01 E.01094
G1 X115.01 Y165.551 E1.87575
G1 X114.598 Y165.415 E.01094
G1 X167.415 Y112.599 E1.8856
G2 X167.274 Y112.192 I-8.328 J2.672 E.01086
G1 X114.192 Y165.274 E1.89505
G1 X113.789 Y165.13 E.01081
G1 X167.13 Y111.789 E1.90429
G2 X166.983 Y111.388 I-8.247 J2.785 E.01078
G1 X113.388 Y164.983 E1.91338
G1 X112.993 Y164.831 E.01069
G1 X166.831 Y110.993 E1.92205
G1 X166.678 Y110.597 E.01069
G1 X112.597 Y164.678 E1.93072
G3 X112.209 Y164.519 I3.027 J-7.937 E.0106
G1 X166.519 Y110.209 E1.9389
G1 X166.359 Y109.822 E.01058
G1 X111.822 Y164.359 E1.947
G3 X111.438 Y164.195 I3.155 J-7.934 E.01054
G1 X166.195 Y109.438 E1.95486
G1 X166.027 Y109.058 E.01048
G1 X111.058 Y164.027 E1.9624
G1 X110.679 Y163.859 E.01048
G1 X165.859 Y108.679 E1.96994
G2 X165.683 Y108.307 I-7.677 J3.393 E.01039
G1 X110.307 Y163.683 E1.97696
G1 X109.935 Y163.507 E.01038
G1 X165.507 Y107.935 E1.98396
G2 X165.328 Y107.567 I-7.601 J3.475 E.01034
G1 X109.567 Y163.328 E1.9907
G1 X109.203 Y163.144 E.0103
G1 X165.144 Y107.203 E1.99716
G1 X164.961 Y106.838 E.0103
G1 X108.838 Y162.961 E2.00362
G3 X108.481 Y162.771 I3.662 J-7.295 E.01022
G1 X164.771 Y106.481 E2.00957
G1 X164.58 Y106.124 E.01022
G1 X108.124 Y162.58 E2.0155
G3 X107.771 Y162.386 I3.776 J-7.303 E.01018
G1 X164.386 Y105.771 E2.0212
G1 X164.188 Y105.421 E.01014
G1 X107.421 Y162.188 E2.02661
G1 X107.071 Y161.99 E.01014
G1 X163.99 Y105.071 E2.03202
G2 X163.785 Y104.728 I-7.068 J3.98 E.01008
G1 X106.728 Y161.785 E2.03697
G1 X106.386 Y161.58 E.01008
G1 X163.58 Y104.386 E2.04186
G2 X163.372 Y104.046 I-7.014 J4.05 E.01006
G1 X106.046 Y161.372 E2.04659
G1 X105.711 Y161.16 E.01002
G1 X163.16 Y103.711 E2.05098
G1 X162.948 Y103.375 E.01002
G1 X105.375 Y160.948 E2.05537
G3 X105.045 Y160.73 I4.255 J-6.807 E.00998
G1 X162.73 Y103.045 E2.05938
G1 X162.511 Y102.717 E.00997
G1 X104.717 Y160.511 E2.06327
G3 X104.39 Y160.29 I4.347 J-6.797 E.00996
G1 X162.29 Y102.39 E2.06707
G1 X162.064 Y102.069 E.00992
G1 X104.069 Y160.064 E2.07046
G1 X103.747 Y159.837 E.00992
G1 X161.837 Y101.747 E2.07385
G2 X161.607 Y101.43 I-6.578 J4.531 E.0099
G1 X103.43 Y159.607 E2.07696
G1 X103.115 Y159.374 E.00988
G1 X161.374 Y101.116 E2.07986
G1 X161.141 Y100.801 E.00988
G1 X102.801 Y159.141 E2.08276
G3 X102.493 Y158.901 I4.774 J-6.444 E.00985
G1 X160.901 Y100.493 E2.08519
G1 X160.661 Y100.186 E.00985
G1 X102.186 Y158.661 E2.0876
G3 X101.88 Y158.418 I4.776 J-6.326 E.00984
G1 X160.418 Y99.88 E2.08984
G1 X160.172 Y99.58 E.00982
G1 X101.58 Y158.172 E2.09177
G1 X101.279 Y157.925 E.00982
G1 X159.925 Y99.279 E2.09369
G2 X159.673 Y98.983 I-6.141 J4.969 E.00981
G1 X100.983 Y157.673 E2.09527
G1 X100.689 Y157.419 E.0098
G1 X159.419 Y98.689 E2.09671
G2 X159.165 Y98.396 I-6.104 J5.032 E.0098
G1 X100.396 Y157.165 E2.09811
G1 X100.108 Y156.905 E.00979
G1 X158.905 Y98.108 E2.09907
G1 X158.644 Y97.821 E.00979
G1 X99.821 Y156.644 E2.10003
G3 X99.537 Y156.381 I5.216 J-5.912 E.00978
G1 X158.381 Y97.537 E2.10077
G1 X158.114 Y97.256 E.00978
G1 X99.256 Y156.114 E2.10125
G1 X98.976 Y155.847 E.00978
G1 X157.847 Y96.976 E2.10173
G2 X157.574 Y96.701 I-5.762 J5.438 E.00978
G1 X98.701 Y155.574 E2.10182
G1 X98.427 Y155.3 E.00978
G1 X157.3 Y96.427 E2.10182
G2 X157.025 Y96.154 I-5.65 J5.424 E.00978
G1 X98.154 Y155.025 E2.10173
G1 X97.887 Y154.745 E.00978
G1 X156.745 Y95.887 E2.10125
G1 X156.464 Y95.62 E.00978
G1 X97.62 Y154.464 E2.10077
G3 X97.357 Y154.18 I5.656 J-5.508 E.00978
G1 X156.18 Y95.357 E2.10003
G1 X155.893 Y95.096 E.00979
G1 X97.096 Y153.893 E2.09907
G1 X96.836 Y153.606 E.00979
G1 X155.606 Y94.836 E2.09811
G2 X155.312 Y94.582 I-5.317 J5.838 E.0098
G1 X96.582 Y153.312 E2.09672
G1 X96.328 Y153.018 E.0098
G1 X155.018 Y94.328 E2.09527
G2 X154.722 Y94.076 I-5.276 J5.9 E.00981
G1 X96.076 Y152.722 E2.0937
M73 P32 R30
G1 X95.829 Y152.421 E.00982
G1 X154.421 Y93.829 E2.09177
G1 X154.121 Y93.582 E.00982
G1 X95.582 Y152.121 E2.08985
G3 X95.34 Y151.815 I6.115 J-5.106 E.00984
G1 X153.816 Y93.34 E2.08761
G1 X153.508 Y93.1 E.00985
G1 X95.1 Y151.508 E2.0852
G3 X94.86 Y151.2 I6.103 J-5.004 E.00985
G1 X153.2 Y92.86 E2.08277
G1 X152.886 Y92.627 E.00988
G1 X94.627 Y150.886 E2.07987
G1 X94.394 Y150.571 E.00988
G1 X152.571 Y92.394 E2.07697
G2 X152.254 Y92.163 I-4.84 J6.334 E.0099
G1 X94.163 Y150.254 E2.07387
G1 X93.937 Y149.933 E.00992
G1 X151.933 Y91.937 E2.07047
G1 X151.611 Y91.711 E.00992
G1 X93.711 Y149.611 E2.06708
G3 X93.49 Y149.284 I6.549 J-4.656 E.00996
G1 X151.284 Y91.49 E2.06328
G1 X150.956 Y91.271 E.00997
G1 X93.271 Y148.956 E2.05939
G3 X93.053 Y148.626 I6.598 J-4.591 E.00998
G1 X150.626 Y91.053 E2.05539
G1 X150.291 Y90.841 E.01002
G1 X92.841 Y148.291 E2.051
G1 X92.628 Y147.955 E.01002
G1 X149.955 Y90.628 E2.04661
G2 X149.615 Y90.421 I-4.382 J6.792 E.01006
G1 X92.421 Y147.615 E2.04188
G1 X92.216 Y147.273 E.01008
G1 X149.273 Y90.216 E2.03699
G2 X148.93 Y90.011 I-4.378 J6.952 E.01008
G1 X92.011 Y146.93 E2.03204
M73 P32 R29
G1 X91.813 Y146.58 E.01014
G1 X148.58 Y89.813 E2.02663
G1 X148.231 Y89.615 E.01014
G1 X91.615 Y146.231 E2.02122
G3 X91.421 Y145.877 I7.097 J-4.123 E.01018
G1 X147.877 Y89.421 E2.01552
G1 X147.52 Y89.23 E.01022
G1 X91.23 Y145.52 E2.00959
G3 X91.04 Y145.163 I7.271 J-4.109 E.01022
G1 X147.163 Y89.04 E2.00364
G1 X146.799 Y88.856 E.0103
G1 X90.856 Y144.799 E1.99718
G1 X90.673 Y144.435 E.0103
G1 X146.435 Y88.673 E1.99072
G2 X146.066 Y88.493 I-3.839 J7.41 E.01034
G1 X90.493 Y144.066 E1.98398
G1 X90.318 Y143.695 E.01038
G1 X145.695 Y88.318 E1.97699
G2 X145.322 Y88.142 I-3.666 J7.29 E.01039
G1 X90.142 Y143.322 E1.96997
G1 X89.974 Y142.943 E.01048
G1 X144.943 Y87.974 E1.96243
G1 X144.564 Y87.806 E.01048
G1 X89.806 Y142.564 E1.95489
G3 X89.642 Y142.18 I7.724 J-3.52 E.01054
G1 X144.18 Y87.642 E1.94703
G1 X143.792 Y87.482 E.01058
G1 X89.482 Y141.792 E1.93893
G3 X89.322 Y141.404 I7.837 J-3.442 E.0106
G1 X143.404 Y87.322 E1.93075
G1 X143.009 Y87.17 E.01069
G1 X89.17 Y141.009 E1.92208
G1 X89.017 Y140.614 E.01069
G1 X142.614 Y87.017 E1.91342
G2 X142.213 Y86.871 I-3.183 J8.089 E.01078
G1 X88.871 Y140.213 E1.90433
G1 X88.727 Y139.809 E.01081
G1 X141.809 Y86.727 E1.89508
G2 X141.403 Y86.585 I-3.095 J8.231 E.01086
G1 X88.585 Y139.403 E1.88563
G1 X88.449 Y138.991 E.01094
G1 X140.991 Y86.449 E1.87579
G1 X140.58 Y86.313 E.01094
G1 X88.313 Y138.58 E1.86595
G1 X88.185 Y138.16 E.01108
G1 X140.16 Y86.185 E1.85551
G1 X139.74 Y86.058 E.01108
G1 X88.058 Y137.74 E1.84506
G3 X87.936 Y137.314 I8.609 J-2.69 E.01118
G1 X139.314 Y85.936 E1.8342
G1 X138.885 Y85.818 E.01123
G1 X87.818 Y136.885 E1.82312
G3 X87.702 Y136.452 I8.715 J-2.559 E.01129
G1 X138.452 Y85.702 E1.81182
G1 X138.015 Y85.592 E.0114
G1 X87.592 Y136.015 E1.8001
G3 X87.484 Y135.576 I8.953 J-2.452 E.01142
G1 X137.576 Y85.484 E1.78831
G1 X137.128 Y85.383 E.01157
G1 X87.383 Y135.128 E1.77593
G1 X87.283 Y134.681 E.01157
G1 X136.681 Y85.283 E1.76355
G2 X136.226 Y85.191 I-2.11 J9.263 E.01173
G1 X87.191 Y134.226 E1.75058
G1 X87.1 Y133.769 E.01176
G1 X135.769 Y85.1 E1.73751
G2 X135.305 Y85.016 I-1.941 J9.369 E.01189
G1 X87.016 Y133.305 E1.72397
G1 X86.935 Y132.839 E.01196
G1 X134.839 Y84.935 E1.7102
G2 X134.367 Y84.859 I-1.776 J9.568 E.01207
G1 X86.859 Y132.367 E1.69606
G1 X86.788 Y131.89 E.01217
G1 X133.89 Y84.788 E1.68156
G2 X133.409 Y84.722 I-1.595 J9.764 E.01226
G1 X86.722 Y131.409 E1.66675
G1 X86.662 Y130.921 E.0124
G1 X132.921 Y84.662 E1.6515
G2 X132.43 Y84.605 I-1.398 J9.967 E.01248
G1 X86.605 Y130.43 E1.63599
G1 X86.556 Y129.932 E.01265
G1 X131.932 Y84.556 E1.61994
M73 P33 R29
G2 X131.43 Y84.51 I-1.188 J10.224 E.01272
G1 X86.51 Y129.43 E1.60367
G1 X86.472 Y128.92 E.01291
G1 X130.92 Y84.472 E1.5868
G2 X130.406 Y84.438 I-.883 J9.467 E.013
G1 X86.438 Y128.407 E1.56969
G1 X86.412 Y127.885 E.01319
G1 X129.883 Y84.414 E1.55192
G2 X129.358 Y84.392 I-.581 J7.487 E.01328
G1 X86.391 Y127.359 E1.53394
G1 X86.378 Y126.824 E.0135
G1 X128.816 Y84.386 E1.51508
G1 X128.275 Y84.379 E.01367
G1 X86.37 Y126.284 E1.49603
G1 X86.37 Y125.736 E.01382
G1 X127.734 Y84.373 E1.4767
G2 X127.181 Y84.378 I-.211 J7.646 E.01395
G1 X86.378 Y125.181 E1.45671
G1 X86.391 Y124.62 E.01418
G1 X126.62 Y84.391 E1.43618
G2 X126.048 Y84.416 I.21 J11.657 E.01445
G1 X86.416 Y124.048 E1.41489
G1 X86.444 Y123.472 E.01456
G1 X125.472 Y84.444 E1.39332
G2 X124.881 Y84.487 I.577 J12.011 E.01495
G1 X86.487 Y122.881 E1.3707
G3 X86.534 Y122.286 I12.154 J.669 E.01507
G1 X124.286 Y84.534 E1.34776
G1 X123.679 Y84.594 E.01541
G1 X86.594 Y121.679 E1.32394
G3 X86.664 Y121.062 I12.642 J1.11 E.01568
G1 X123.062 Y84.664 E1.29943
G1 X122.437 Y84.741 E.01589
G1 X86.741 Y120.437 E1.27438
G3 X86.835 Y119.795 I13.127 J1.6 E.01638
G1 X121.795 Y84.835 E1.2481
G2 X121.145 Y84.938 I1.765 J13.311 E.01662
G1 X86.938 Y119.145 E1.22123
G1 X87.052 Y118.482 E.01698
G1 X120.482 Y85.052 E1.19347
G2 X119.802 Y85.185 I2.363 J13.922 E.0175
G1 X87.185 Y117.802 E1.16444
G3 X87.33 Y117.11 I14.173 J2.599 E.01785
G1 X119.11 Y85.33 E1.13457
G1 X118.404 Y85.488 E.01827
G1 X87.488 Y116.404 E1.10369
G3 X87.671 Y115.674 I14.792 J3.305 E.01899
G1 X117.674 Y85.671 E1.07113
G2 X116.927 Y85.87 I3.68 J15.295 E.01952
G1 X87.87 Y114.927 E1.03736
G3 X88.088 Y114.161 I15.702 J4.064 E.02011
G1 X116.161 Y86.088 E1.0022
G2 X115.373 Y86.329 I4.513 J16.198 E.02081
G1 X88.329 Y113.373 E.96548
G1 X88.599 Y112.555 E.02174
G1 X114.555 Y86.599 E.92664
G2 X113.706 Y86.9 I5.693 J17.401 E.02273
G1 X88.9 Y111.706 E.8856
G3 X89.234 Y110.824 I18.138 J6.37 E.02381
G1 X112.824 Y87.234 E.84218
G2 X111.903 Y87.608 I7.134 J18.917 E.02509
G1 X89.608 Y109.903 E.79596
G3 X90.028 Y108.935 I19.92 J8.072 E.02663
G1 X110.935 Y88.028 E.74642
G2 X109.912 Y88.504 I9.164 J21.045 E.0285
G1 X90.504 Y107.912 E.69288
G3 X91.049 Y106.819 I77.46 J37.952 E.03082
G1 X108.819 Y89.049 E.63442
G2 X107.622 Y89.698 I12.625 J24.694 E.03439
G1 X91.698 Y105.622 E.56848
G3 X92.47 Y104.303 I27.26 J15.055 E.03857
G1 X106.303 Y90.47 E.49386
G2 X104.773 Y91.452 I24.232 J39.427 E.0459
G1 X93.452 Y102.773 E.40418
G3 X94.81 Y100.867 I36.643 J24.678 E.05909
G1 X102.867 Y92.81 E.28763
G2 X98.993 Y96.137 I24.747 J32.74 E.129
G1 X95.85 Y99.28 E.11219
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11620.701
G1 X97.264 Y97.865 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/58
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.08 I-1.118 J.482 P1  F30000
G1 X127.486 Y167.969 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X122.351 Y84.408 I.505 J-41.969 E3.40605
G3 X129.397 Y84.051 I5.674 J42.272 E.19138
G3 X127.546 Y167.97 I-1.406 J41.949 E3.54696
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X122.295 Y83.996 I.51 J-42.385 E3.43979
G3 X129.407 Y83.636 I5.73 J42.686 E.19318
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.386 I-1.417 J42.364 E3.5822
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.785 E.00004
G3 X122.241 Y83.599 I.515 J-42.785 E3.22168
G3 X129.417 Y83.235 I5.784 J43.085 E.18086
G3 X128.525 Y168.785 I-1.427 J42.765 E3.33028
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.785 E-.02289
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.33782
; WIPE_END
G1 E-.04 F1800
G1 X118.54 Y165.669 Z1.24 F30000
G1 X101.28 Y158.15 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421576
G1 F11620.701
G1 X98.138 Y155.008 E.11217
G3 X94.81 Y151.133 I29.42 J-28.628 E.12902
G1 X102.867 Y159.19 E.28763
G2 X104.773 Y160.548 I26.607 J-35.316 E.0591
G1 X93.452 Y149.227 E.40418
G3 X92.47 Y147.697 I38.584 J-25.852 E.04589
G1 X106.303 Y161.53 E.49386
G2 X107.622 Y162.302 I16.393 J-26.519 E.03857
G1 X91.698 Y146.378 E.56848
G3 X91.049 Y145.181 I24.054 J-13.827 E.03439
G1 X108.819 Y162.951 E.63442
G2 X109.912 Y163.496 I39.209 J-77.246 E.03082
G1 X90.504 Y144.088 E.69287
G3 X90.028 Y143.065 I20.571 J-10.19 E.0285
G1 X110.935 Y163.972 E.74642
G2 X111.903 Y164.392 I9.055 J-19.536 E.02663
G1 X89.608 Y142.097 E.79596
G3 X89.234 Y141.176 I18.548 J-8.057 E.02509
G1 X112.824 Y164.766 E.84218
G2 X113.706 Y165.1 I7.264 J-17.833 E.02381
G1 X88.9 Y140.294 E.8856
G3 X88.599 Y139.445 I17.145 J-6.558 E.02273
G1 X114.555 Y165.401 E.92664
G1 X115.373 Y165.671 E.02174
G1 X88.329 Y138.627 E.96548
G3 X88.088 Y137.839 I15.963 J-5.303 E.02081
G1 X116.161 Y165.912 E1.0022
G2 X116.927 Y166.13 I4.843 J-15.527 E.02011
G1 X87.87 Y137.073 E1.03736
G3 X87.671 Y136.326 I15.094 J-4.426 E.01952
G1 X117.674 Y166.329 E1.07113
G2 X118.404 Y166.512 I4.144 J-15.045 E.01899
G1 X87.488 Y135.596 E1.10369
G1 X87.33 Y134.89 E.01827
G1 X119.11 Y166.67 E1.13457
G2 X119.802 Y166.815 I3.294 J-14.045 E.01785
G1 X87.185 Y134.198 E1.16444
G3 X87.052 Y133.518 I13.812 J-3.048 E.0175
G1 X120.482 Y166.948 E1.19347
G1 X121.145 Y167.062 E.01698
M73 P34 R29
G1 X86.938 Y132.855 E1.22123
G3 X86.835 Y132.205 I13.193 J-2.413 E.01662
G1 X121.795 Y167.165 E1.2481
G2 X122.437 Y167.259 I2.236 J-13.002 E.01638
G1 X86.741 Y131.563 E1.27438
G1 X86.664 Y130.938 E.01589
G1 X123.062 Y167.336 E1.29943
G2 X123.679 Y167.406 I1.725 J-12.546 E.01568
G1 X86.594 Y130.321 E1.32394
G1 X86.534 Y129.714 E.01541
G1 X124.286 Y167.466 E1.34776
G2 X124.881 Y167.513 I1.264 J-12.115 E.01507
G1 X86.487 Y129.119 E1.3707
G3 X86.444 Y128.528 I12.01 J-1.171 E.01495
G1 X125.472 Y167.556 E1.39331
G1 X126.048 Y167.584 E.01456
G1 X86.416 Y127.952 E1.41489
G3 X86.391 Y127.38 I11.623 J-.781 E.01445
G1 X126.62 Y167.609 E1.43618
G1 X127.181 Y167.622 E.01418
G1 X86.378 Y126.819 E1.45671
G3 X86.37 Y126.264 I11.29 J-.432 E.01402
G1 X127.736 Y167.63 E1.4768
G1 X128.284 Y167.63 E.01382
G1 X86.37 Y125.716 E1.49635
G3 X86.378 Y125.176 I10.997 J-.113 E.01363
G1 X128.824 Y167.622 E1.51535
G1 X129.359 Y167.609 E.0135
G1 X86.391 Y124.641 E1.53397
G3 X86.412 Y124.115 I10.723 J.176 E.01329
G1 X129.885 Y167.588 E1.55198
G1 X130.407 Y167.562 E.01319
G1 X86.438 Y123.593 E1.5697
G3 X86.472 Y123.08 I10.464 J.441 E.01299
G1 X130.92 Y167.528 E1.5868
G1 X131.43 Y167.49 E.01291
G1 X86.51 Y122.57 E1.60367
G3 X86.556 Y122.068 I10.285 J.688 E.01272
G1 X131.932 Y167.444 E1.61994
G1 X132.43 Y167.395 E.01265
G1 X86.605 Y121.57 E1.63599
G3 X86.662 Y121.079 I10.041 J.909 E.01248
G1 X132.921 Y167.338 E1.6515
G1 X133.409 Y167.278 E.0124
G1 X86.722 Y120.591 E1.66675
G3 X86.788 Y120.11 I9.833 J1.115 E.01226
G1 X133.89 Y167.212 E1.68156
G1 X134.367 Y167.141 E.01217
G1 X86.859 Y119.633 E1.69606
G3 X86.935 Y119.161 I9.667 J1.308 E.01207
G1 X134.839 Y167.065 E1.7102
G1 X135.305 Y166.984 E.01196
G1 X87.016 Y118.695 E1.72397
G3 X87.1 Y118.231 I9.469 J1.48 E.01189
G1 X135.769 Y166.9 E1.73751
G1 X136.226 Y166.809 E.01176
G1 X87.191 Y117.774 E1.75058
G3 X87.283 Y117.319 I9.379 J1.66 E.01173
G1 X136.681 Y166.717 E1.76355
G1 X137.128 Y166.617 E.01157
G1 X87.383 Y116.872 E1.77593
G1 X87.484 Y116.424 E.01157
G1 X137.576 Y166.516 E1.78831
G2 X138.015 Y166.408 I-1.983 J-8.94 E.01142
G1 X87.592 Y115.985 E1.8001
G1 X87.702 Y115.548 E.0114
G1 X138.452 Y166.298 E1.81181
G2 X138.885 Y166.182 I-2.127 J-8.83 E.01129
G1 X87.818 Y115.115 E1.82312
G1 X87.936 Y114.686 E.01123
G1 X139.314 Y166.064 E1.8342
G2 X139.74 Y165.942 I-2.265 J-8.732 E.01118
G1 X88.058 Y114.26 E1.84506
G1 X88.185 Y113.84 E.01108
G1 X140.16 Y165.814 E1.85551
G1 X140.58 Y165.687 E.01108
G1 X88.313 Y113.42 E1.86595
G1 X88.449 Y113.009 E.01094
G1 X140.991 Y165.551 E1.87579
G1 X141.403 Y165.415 E.01094
G1 X88.585 Y112.597 E1.88563
G3 X88.727 Y112.191 I8.338 J2.677 E.01086
G1 X141.809 Y165.273 E1.89508
G1 X142.213 Y165.129 E.01081
G1 X88.871 Y111.787 E1.90433
G3 X89.017 Y111.386 I8.291 J2.802 E.01078
G1 X142.614 Y164.983 E1.91342
G1 X143.009 Y164.83 E.01069
G1 X89.17 Y110.991 E1.92208
G1 X89.322 Y110.596 E.01069
G1 X143.404 Y164.678 E1.93075
G2 X143.792 Y164.518 I-3.028 J-7.936 E.0106
G1 X89.482 Y110.208 E1.93893
G1 X89.642 Y109.82 E.01058
G1 X144.18 Y164.358 E1.94703
G2 X144.564 Y164.194 I-3.153 J-7.926 E.01054
G1 X89.806 Y109.436 E1.95489
G1 X89.974 Y109.057 E.01048
G1 X144.943 Y164.026 E1.96243
G1 X145.322 Y163.858 E.01048
G1 X90.142 Y108.678 E1.96997
G3 X90.318 Y108.305 I7.573 J3.345 E.01039
G1 X145.695 Y163.682 E1.97699
M73 P34 R28
G1 X146.066 Y163.507 E.01038
G1 X90.493 Y107.934 E1.98398
G3 X90.673 Y107.565 I7.577 J3.465 E.01034
G1 X146.435 Y163.327 E1.99072
G1 X146.799 Y163.144 E.0103
G1 X90.856 Y107.201 E1.99718
G1 X91.04 Y106.837 E.0103
G1 X147.163 Y162.96 E2.00364
G2 X147.52 Y162.77 I-3.617 J-7.21 E.01022
G1 X91.23 Y106.48 E2.00959
G1 X91.421 Y106.123 E.01022
G1 X147.877 Y162.579 E2.01552
G2 X148.231 Y162.385 I-3.772 J-7.295 E.01018
G1 X91.615 Y105.769 E2.02122
G1 X91.813 Y105.42 E.01014
G1 X148.58 Y162.187 E2.02663
G1 X148.93 Y161.989 E.01014
G1 X92.011 Y105.07 E2.03204
G3 X92.216 Y104.727 I7.147 J4.029 E.01008
G1 X149.273 Y161.784 E2.03699
G1 X149.615 Y161.579 E.01008
G1 X92.421 Y104.385 E2.04188
G3 X92.628 Y104.045 I7.035 J4.064 E.01006
G1 X149.955 Y161.372 E2.04661
G1 X150.291 Y161.159 E.01002
G1 X92.841 Y103.709 E2.051
G1 X93.053 Y103.374 E.01002
G1 X150.626 Y160.947 E2.05539
G2 X150.956 Y160.729 I-4.268 J-6.825 E.00998
G1 X93.271 Y103.044 E2.05939
G1 X93.49 Y102.716 E.00997
G1 X151.284 Y160.51 E2.06328
G2 X151.611 Y160.289 I-4.353 J-6.806 E.00996
G1 X93.711 Y102.389 E2.06708
G1 X93.937 Y102.067 E.00992
G1 X151.933 Y160.063 E2.07047
G1 X152.254 Y159.837 E.00992
G1 X94.163 Y101.746 E2.07386
G3 X94.394 Y101.429 I6.563 J4.521 E.0099
G1 X152.571 Y159.606 E2.07697
G1 X152.886 Y159.373 E.00988
G1 X94.627 Y101.114 E2.07987
G1 X94.86 Y100.8 E.00988
G1 X153.2 Y159.14 E2.08277
G2 X153.508 Y158.9 I-4.86 J-6.554 E.00985
G1 X95.1 Y100.492 E2.0852
G1 X95.34 Y100.184 E.00985
G1 X153.815 Y158.66 E2.08761
G2 X154.121 Y158.418 I-4.799 J-6.355 E.00984
G1 X95.582 Y99.879 E2.08985
G1 X95.829 Y99.579 E.00982
G1 X154.421 Y158.171 E2.09177
G1 X154.722 Y157.924 E.00982
G1 X96.076 Y99.278 E2.0937
G3 X96.328 Y98.982 I6.135 J4.965 E.00981
G1 X155.018 Y157.672 E2.09527
M73 P35 R28
G1 X155.312 Y157.418 E.0098
G1 X96.582 Y98.688 E2.09672
G3 X96.836 Y98.394 I6.128 J5.055 E.0098
G1 X155.606 Y157.164 E2.09811
G1 X155.893 Y156.904 E.00979
G1 X97.096 Y98.107 E2.09907
G1 X97.357 Y97.82 E.00979
G1 X156.18 Y156.643 E2.10003
G2 X156.464 Y156.38 I-5.217 J-5.912 E.00978
G1 X97.62 Y97.536 E2.10077
G1 X97.887 Y97.255 E.00978
G1 X156.745 Y156.113 E2.10125
G1 X157.025 Y155.846 E.00978
G1 X98.154 Y96.975 E2.10173
G3 X98.427 Y96.7 I5.732 J5.409 E.00978
G1 X157.3 Y155.573 E2.10182
G1 X157.574 Y155.299 E.00978
G1 X98.701 Y96.426 E2.10182
G3 X98.976 Y96.153 I5.691 J5.467 E.00978
G1 X157.847 Y155.024 E2.10173
G1 X158.114 Y154.744 E.00978
G1 X99.256 Y95.886 E2.10125
G1 X99.537 Y95.619 E.00978
G1 X158.381 Y154.463 E2.10077
G2 X158.644 Y154.179 I-5.658 J-5.509 E.00978
G1 X99.821 Y95.356 E2.10003
G1 X100.108 Y95.095 E.00979
G1 X158.905 Y153.892 E2.09907
G1 X159.165 Y153.604 E.00979
G1 X100.396 Y94.835 E2.09811
G3 X100.689 Y94.581 I5.348 J5.876 E.0098
G1 X159.419 Y153.311 E2.09671
G1 X159.673 Y153.017 E.0098
G1 X100.983 Y94.327 E2.09527
G3 X101.279 Y94.075 I5.282 J5.909 E.00981
G1 X159.925 Y152.721 E2.09369
G1 X160.172 Y152.42 E.00982
G1 X101.58 Y93.828 E2.09177
G1 X101.88 Y93.582 E.00982
G1 X160.418 Y152.12 E2.08984
G2 X160.661 Y151.814 I-6.095 J-5.09 E.00984
G1 X102.186 Y93.339 E2.0876
G1 X102.493 Y93.099 E.00985
G1 X160.901 Y151.507 E2.08519
G2 X161.141 Y151.199 I-5.951 J-4.884 E.00985
G1 X102.801 Y92.859 E2.08276
G1 X103.115 Y92.626 E.00988
G1 X161.374 Y150.884 E2.07986
G1 X161.607 Y150.57 E.00988
G1 X103.43 Y92.393 E2.07696
G3 X103.747 Y92.163 I4.851 J6.352 E.0099
G1 X161.837 Y150.253 E2.07385
G1 X162.064 Y149.931 E.00992
G1 X104.069 Y91.936 E2.07046
G1 X104.39 Y91.71 E.00992
G1 X162.29 Y149.61 E2.06707
G2 X162.511 Y149.283 I-6.556 J-4.66 E.00996
G1 X104.717 Y91.489 E2.06327
G1 X105.045 Y91.27 E.00997
G1 X162.73 Y148.955 E2.05938
G2 X162.948 Y148.625 I-6.614 J-4.602 E.00998
G1 X105.375 Y91.052 E2.05537
G1 X105.711 Y90.84 E.01002
G1 X163.16 Y148.289 E2.05098
G1 X163.372 Y147.954 E.01002
G1 X106.046 Y90.628 E2.04659
G3 X106.386 Y90.42 I4.401 J6.825 E.01006
G1 X163.58 Y147.614 E2.04186
G1 X163.785 Y147.272 E.01008
G1 X106.728 Y90.215 E2.03697
G3 X107.071 Y90.01 I4.31 J6.841 E.01008
G1 X163.99 Y146.929 E2.03202
G1 X164.188 Y146.579 E.01014
G1 X107.421 Y89.812 E2.02661
G1 X107.771 Y89.614 E.01014
G1 X164.386 Y146.229 E2.0212
G2 X164.58 Y145.876 I-7.082 J-4.114 E.01018
G1 X108.124 Y89.42 E2.0155
G1 X108.481 Y89.229 E.01022
G1 X164.771 Y145.519 E2.00957
G2 X164.961 Y145.162 I-7.212 J-4.077 E.01022
G1 X108.838 Y89.039 E2.00362
G1 X109.203 Y88.856 E.0103
G1 X165.144 Y144.797 E1.99716
G1 X165.328 Y144.433 E.0103
G1 X109.567 Y88.672 E1.9907
G3 X109.935 Y88.493 I3.839 J7.412 E.01034
G1 X165.507 Y144.065 E1.98396
G1 X165.683 Y143.693 E.01038
G1 X110.307 Y88.317 E1.97696
G3 X110.679 Y88.141 I3.756 J7.48 E.01039
G1 X165.859 Y143.321 E1.96994
G1 X166.027 Y142.942 E.01048
G1 X111.058 Y87.973 E1.9624
G1 X111.438 Y87.805 E.01048
G1 X166.195 Y142.562 E1.95486
G2 X166.359 Y142.178 I-7.739 J-3.526 E.01054
G1 X111.822 Y87.641 E1.947
G1 X112.209 Y87.481 E.01058
G1 X166.519 Y141.791 E1.9389
G2 X166.678 Y141.403 I-7.869 J-3.453 E.0106
G1 X112.597 Y87.322 E1.93072
G1 X112.993 Y87.169 E.01069
G1 X166.831 Y141.007 E1.92205
G1 X166.983 Y140.612 E.01069
G1 X113.388 Y87.017 E1.91338
G3 X113.789 Y86.87 I3.195 J8.126 E.01078
G1 X167.13 Y140.211 E1.90429
G1 X167.274 Y139.808 E.01081
G1 X114.192 Y86.726 E1.89505
G3 X114.598 Y86.585 I3.083 J8.199 E.01086
G1 X167.415 Y139.402 E1.8856
G1 X167.551 Y138.99 E.01094
G1 X115.01 Y86.449 E1.87575
G1 X115.422 Y86.313 E.01094
G1 X167.687 Y138.578 E1.86591
M73 P36 R28
G1 X167.815 Y138.158 E.01108
G1 X115.842 Y86.185 E1.85547
G1 X116.262 Y86.058 E.01108
G1 X167.942 Y137.738 E1.84502
G2 X168.064 Y137.312 I-8.62 J-2.693 E.01118
G1 X116.688 Y85.936 E1.83416
G1 X117.117 Y85.817 E.01124
G1 X168.183 Y136.883 E1.82308
G2 X168.298 Y136.451 I-8.726 J-2.562 E.01129
G1 X117.549 Y85.702 E1.81177
G1 X117.987 Y85.592 E.0114
G1 X168.408 Y136.013 E1.80005
G2 X168.517 Y135.574 I-8.887 J-2.435 E.01142
G1 X118.426 Y85.483 E1.78827
G1 X118.873 Y85.383 E.01157
G1 X168.617 Y135.127 E1.77588
G1 X168.718 Y134.68 E.01157
G1 X119.32 Y85.282 E1.7635
G3 X119.776 Y85.19 I2.096 J9.196 E.01173
G1 X168.81 Y134.224 E1.75053
G1 X168.9 Y133.767 E.01176
G1 X120.233 Y85.1 E1.73746
G3 X120.696 Y85.015 I1.946 J9.399 E.01189
G1 X168.985 Y133.304 E1.72392
G1 X169.066 Y132.837 E.01196
G1 X121.163 Y84.934 E1.71015
G3 X121.635 Y84.859 I1.779 J9.593 E.01207
G1 X169.141 Y132.365 E1.696
G1 X169.212 Y131.888 E.01217
G1 X122.112 Y84.788 E1.6815
G3 X122.593 Y84.722 I1.597 J9.782 E.01226
G1 X169.278 Y131.407 E1.6667
G1 X169.339 Y130.919 E.0124
G1 X123.081 Y84.661 E1.65144
G3 X123.572 Y84.605 I1.396 J9.959 E.01248
G1 X169.395 Y130.428 E1.63593
G1 X169.444 Y129.93 E.01265
G1 X124.07 Y84.556 E1.61988
G3 X124.572 Y84.51 I1.184 J10.186 E.01272
G1 X169.49 Y129.428 E1.6036
G1 X169.528 Y128.918 E.01291
G1 X125.082 Y84.472 E1.58674
G3 X125.595 Y84.438 I.953 J10.421 E.01299
G1 X169.562 Y128.405 E1.56963
G1 X169.588 Y127.883 E.01319
G1 X126.117 Y84.412 E1.55191
G3 X126.643 Y84.391 I.701 J10.693 E.01329
G1 X169.609 Y127.357 E1.5339
G1 X169.622 Y126.822 E.0135
G1 X127.178 Y84.378 E1.51529
G3 X127.721 Y84.373 I.34 J7.537 E.0137
G1 X169.63 Y126.282 E1.49619
G1 X169.63 Y125.734 E.01383
G1 X128.275 Y84.379 E1.47641
G1 X128.828 Y84.385 E.01398
G1 X169.622 Y125.179 E1.45636
G1 X169.608 Y124.618 E.01418
G1 X129.382 Y84.392 E1.43609
G1 X129.956 Y84.418 E.0145
G1 X169.584 Y124.046 E1.41473
G1 X169.556 Y123.47 E.01456
G1 X130.53 Y84.444 E1.39323
G3 X131.121 Y84.487 I-.475 J10.615 E.01495
G1 X169.513 Y122.879 E1.37061
G2 X169.465 Y122.284 I-12.156 J.67 E.01507
G1 X131.716 Y84.535 E1.34767
G1 X132.323 Y84.595 E.01541
G1 X169.405 Y121.677 E1.32385
G2 X169.336 Y121.059 I-12.614 J1.108 E.01568
G1 X132.941 Y84.664 E1.29933
G1 X133.565 Y84.741 E.01589
G1 X169.259 Y120.435 E1.27428
G2 X169.165 Y119.793 I-13.063 J1.591 E.01638
G1 X134.207 Y84.835 E1.248
G3 X134.857 Y84.938 I-1.766 J13.307 E.01662
G1 X169.062 Y119.142 E1.22112
G1 X168.947 Y118.48 E.01698
G1 X135.52 Y85.053 E1.19336
G3 X136.201 Y85.186 I-2.359 J13.895 E.0175
G1 X168.814 Y117.799 E1.16433
G2 X168.67 Y117.107 I-14.161 J2.597 E.01785
G1 X136.893 Y85.33 E1.13445
G1 X137.599 Y85.489 E.01827
G1 X168.511 Y116.401 E1.10358
G2 X168.329 Y115.671 I-15.033 J3.366 E.01899
G1 X138.329 Y85.671 E1.07101
G3 X139.076 Y85.871 I-3.674 J15.269 E.01952
G1 X168.129 Y114.924 E1.03723
G2 X167.911 Y114.158 I-15.729 J4.073 E.02012
G1 X139.842 Y86.089 E1.00207
G3 X140.631 Y86.33 I-4.519 J16.212 E.02081
G1 X167.67 Y113.369 E.96533
G1 X167.4 Y112.552 E.02174
G1 X141.448 Y86.6 E.92649
G3 X142.297 Y86.901 I-5.718 J17.465 E.02273
G1 X167.099 Y111.703 E.88544
G2 X166.764 Y110.821 I-18.178 J6.387 E.02382
G1 X143.179 Y87.236 E.84201
G3 X144.1 Y87.609 I-7.145 J18.941 E.0251
G1 X166.391 Y109.9 E.79579
G2 X165.971 Y108.932 I-19.943 J8.084 E.02664
G1 X145.068 Y88.029 E.74623
G3 X146.092 Y88.506 I-9.191 J21.097 E.02851
G1 X165.494 Y107.908 E.69267
G2 X164.949 Y106.815 I-77.218 J37.848 E.03084
G1 X147.185 Y89.051 E.63417
G3 X148.383 Y89.701 I-12.631 J24.701 E.0344
G1 X164.299 Y105.617 E.56821
G2 X163.527 Y104.298 I-27.243 J15.049 E.03859
G1 X149.702 Y90.473 E.49356
G3 X151.233 Y91.456 I-24.448 J39.748 E.04593
G1 X162.544 Y102.767 E.40381
M73 P36 R27
G2 X161.184 Y100.859 I-36.762 J24.771 E.05916
G1 X153.141 Y92.816 E.28714
G3 X157.051 Y96.178 I-24.925 J32.939 E.13025
G1 X160.14 Y99.268 E.1103
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11620.701
G1 X158.726 Y97.854 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/58
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.24 I-1.112 J-.495 P1  F30000
G1 X127.486 Y167.968 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X121.332 Y84.559 I.504 J-41.969 E3.37809
G3 X129.363 Y84.05 I6.652 J41.328 E.2184
G3 X127.546 Y167.969 I-1.373 J41.949 E3.5478
G1 X127.481 Y168.384 F30000
G1 F9000
G3 X121.266 Y84.149 I.509 J-42.384 E3.41155
G3 X129.373 Y83.635 I6.717 J41.735 E.22047
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.384 I-1.383 J42.365 E3.58303
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.786 E.00002
G3 X121.202 Y83.753 I.514 J-42.786 E3.1953
G3 X129.383 Y83.234 I6.78 J42.128 E.20641
G3 X128.525 Y168.786 I-1.393 J42.766 E3.33113
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.786 E-.02288
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.33782
; WIPE_END
G1 E-.04 F1800
G1 X127.692 Y167.615 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P37 R27
G1 F10826.06
G3 X126.03 Y167.568 I.445 J-45.513 E.04505
G3 X126.46 Y166.557 I1.761 J.152 E.03028
G3 X127.915 Y165.303 I5.676 J5.111 E.05218
G2 X129.794 Y162.794 I-3.528 J-4.601 E.08601
G2 X129.812 Y160.285 I-3.571 J-1.279 E.06928
G1 X129.54 Y159.867 E.01351
G2 X128.085 Y158.613 I-5.676 J5.112 E.05218
G3 X126.206 Y156.104 I3.528 J-4.602 E.08601
G3 X126.188 Y153.595 I3.571 J-1.279 E.06928
G3 X127.588 Y152.184 I3.874 J2.441 E.0543
G3 X123.173 Y151.732 I.305 J-24.802 E.12042
G3 X122.85 Y152.341 I-1.092 J-.189 E.01898
G3 X121.396 Y153.595 I-5.677 J-5.112 E.05218
G2 X119.516 Y156.104 I3.528 J4.601 E.08601
G2 X119.499 Y158.613 I3.571 J1.279 E.06928
G1 X119.77 Y159.031 E.01351
G2 X121.225 Y160.285 I5.676 J-5.112 E.05218
G3 X123.104 Y162.794 I-3.528 J4.601 E.08601
G3 X123.122 Y165.303 I-3.571 J1.279 E.06928
G1 X122.85 Y165.721 E.01351
G3 X121.29 Y167.072 I-15.482 J-16.293 E.05595
G3 X119.655 Y166.77 I5.325 J-33.388 E.04505
G1 X114.926 Y148.684 F30000
G1 F10826.06
G1 X116.389 Y149.473 E.04504
G3 X114.535 Y151.923 I-5.349 J-2.12 E.08427
G2 X113.081 Y153.177 I4.221 J6.365 E.05218
G1 X112.809 Y153.595 E.01351
G2 X112.826 Y156.104 I3.588 J1.229 E.06928
G2 X114.706 Y158.613 I5.407 J-2.093 E.08601
G3 X116.16 Y159.867 I-4.221 J6.366 E.05218
G1 X116.432 Y160.285 E.01351
G3 X116.415 Y162.794 I-3.588 J1.229 E.06928
G3 X114.535 Y165.303 I-5.407 J-2.093 E.08601
G1 X114.468 Y165.356 E.00234
G3 X109.89 Y163.469 I16.68 J-46.958 E.13423
G2 X107.845 Y160.285 I-5.078 J1.012 E.10496
G3 X106.391 Y159.031 I4.222 J-6.366 E.05218
G1 X106.119 Y158.613 E.01351
G3 X106.137 Y156.104 I3.588 J-1.229 E.06928
G3 X108.016 Y153.595 I5.407 J2.093 E.08601
G2 X109.471 Y152.341 I-4.222 J-6.366 E.05218
G1 X109.742 Y151.923 E.01351
G2 X109.725 Y149.414 I-3.588 J-1.229 E.06928
G2 X107.845 Y146.906 I-5.407 J2.093 E.08601
G3 X106.391 Y145.651 I4.222 J-6.366 E.05218
G1 X106.119 Y145.233 E.01351
G3 X106.137 Y142.725 I3.588 J-1.229 E.06928
G3 X106.839 Y141.429 I3.472 J1.044 E.04023
G1 X107.158 Y141.858 E.01449
G2 X107.863 Y142.739 I26.822 J-20.742 E.03056
G1 X107.27 Y138.693 F30000
G1 F10826.06
G1 X108.187 Y140.08 E.04504
G2 X107.739 Y140.472 I2.496 J3.304 E.01614
G2 X116.637 Y148.155 I20.233 J-14.438 E.3216
G2 X116.579 Y147.456 I-1.144 J-.256 E.0193
G1 X117.881 Y148.102 E.03938
G1 X119.533 Y148.786 E.04847
G1 X121.232 Y149.347 E.04847
G1 X123.206 Y149.829 E.05505
G3 X123.317 Y150.454 I-1.521 J.594 E.01733
G2 X128.969 Y150.88 I4.765 J-25.513 E.15389
G1 X129.411 Y150.266 E.0205
G1 X131.066 Y150.112 E.04504
G1 X134.901 Y149.924 F30000
G1 F10826.06
G1 X134.935 Y149.915 E.00095
G2 X136.482 Y149.409 I-7.562 J-25.749 E.0441
G1 X136.24 Y148.867 E.01608
G1 X137.58 Y148.341 E.03899
G1 X139.192 Y147.578 E.04834
G1 X140.75 Y146.696 E.04849
G1 X142.139 Y145.771 E.04523
G3 X142.606 Y146.165 I-1.322 J2.04 E.0166
G2 X146.213 Y142.978 I-14.821 J-20.407 E.13063
G3 X148.155 Y140.216 I4.974 J1.433 E.09319
G1 X148.778 Y139.718 E.02162
G1 X148.872 Y139.579 E.00455
G2 X150.094 Y137.482 I-22.327 J-14.425 E.06578
G2 X149.958 Y136.423 I-2.738 J-.187 E.02914
G1 X150.62 Y134.898 E.04504
G1 X152.544 Y130.186 F30000
G1 F10826.06
G2 X152.768 Y128.539 I-24.84 J-4.228 E.04505
G3 X152.873 Y127.115 I2.269 J-.549 E.03933
G2 X149.067 Y112.729 I-24.877 J-1.114 E.40948
G1 X148.601 Y113.1 E.01613
G1 X147.347 Y111.283 E.05984
G1 X146.209 Y109.897 E.04859
G1 X144.974 Y108.6 E.04853
G1 X143.279 Y107.095 E.06141
G2 X142.92 Y106.349 I-1.321 J.176 E.02283
G2 X141.465 Y105.095 I-5.676 J5.112 E.05218
G2 X133.32 Y101.677 I-13.185 J20.006 E.24072
G2 X133.057 Y102.224 I1.186 J.908 E.01658
G1 X131.274 Y101.913 E.04902
G1 X129.493 Y101.738 E.04851
G1 X127.704 Y101.694 E.04848
G1 X126.008 Y101.775 E.04602
G3 X125.977 Y101.184 I1.475 J-.373 E.01614
G2 X119.515 Y102.592 I2.186 J25.554 E.17973
G1 X119.345 Y103.287 E.01936
G1 X117.335 Y104.156 E.05935
G1 X115.093 Y105.403 E.06952
G3 X114.612 Y105.008 I2.507 J-3.539 E.0169
G2 X113.241 Y105.948 I13.544 J21.22 E.04505
G1 X107.229 Y104.499 F30000
G1 F10826.06
G1 X105.931 Y103.46 E.04505
G3 X106.079 Y102.821 I1.685 J.054 E.01789
G1 X100.858 Y98.642 E.18121
G1 X100.384 Y99.02 E.01644
G1 X101.682 Y100.059 E.04505
G1 X100.54 Y96.736 F30000
G1 F10826.06
G1 X101.838 Y97.775 E.04505
G1 X102.062 Y97.569 E.00825
G2 X103.275 Y94.224 I-3.532 J-3.175 E.09883
G1 X103.053 Y93.387 E.02345
G2 X102.739 Y92.926 I-1.326 J.564 E.01521
G3 X105.902 Y90.736 I26.106 J34.329 E.10429
G1 X106.119 Y91.715 E.02716
G2 X106.797 Y92.551 I2.458 J-1.301 E.02936
G3 X108.751 Y94.224 I-10.628 J14.395 E.06976
G3 X109.965 Y97.569 I-3.532 J3.175 E.09883
G1 X109.742 Y98.405 E.02345
G3 X109.064 Y99.241 I-2.458 J-1.301 E.02936
G2 X107.11 Y100.913 I10.63 J14.398 E.06976
G1 X106.617 Y101.6 E.0229
G1 X107.915 Y102.638 E.04505
G1 X103.739 Y111.46 F30000
G1 F10826.06
G1 X102.44 Y110.421 E.04505
G1 X102.094 Y110.902 E.01606
G1 X103.393 Y111.941 E.04505
G1 X102.443 Y112.832 F30000
G1 F10826.06
G1 X101.145 Y111.793 E.04505
G2 X99.429 Y113.457 I2.936 J4.743 E.06525
G2 X99.447 Y115.965 I3.588 J1.229 E.06928
G2 X101.326 Y118.474 I5.407 J-2.093 E.08601
G3 X102.621 Y119.564 I-3.653 J5.653 E.04598
G1 X102.379 Y120.575 E.02816
G2 X101.855 Y124.518 I28.124 J5.74 E.10788
G2 X99.701 Y126.418 I56.796 J66.564 E.07785
G1 X99.429 Y126.836 E.01351
G2 X99.447 Y129.345 I3.588 J1.229 E.06928
G2 X101.326 Y131.854 I5.407 J-2.093 E.08601
G3 X102.81 Y133.152 I-4.097 J6.176 E.05358
G1 X102.846 Y133.289 E.00384
G2 X103.265 Y134.602 I138.816 J-43.599 E.03735
G3 X101.156 Y138.543 I-5.035 J-.16 E.1255
G2 X99.701 Y139.798 I4.221 J6.365 E.05218
G1 X99.429 Y140.216 E.01351
G2 X99.447 Y142.725 I3.588 J1.229 E.06928
G2 X101.326 Y145.233 I5.407 J-2.093 E.08601
G3 X102.781 Y146.488 I-4.221 J6.366 E.05218
G1 X103.053 Y146.906 E.01351
G3 X103.035 Y149.414 I-3.588 J1.229 E.06928
G3 X101.156 Y151.923 I-5.407 J-2.093 E.08601
G2 X99.701 Y153.177 I4.221 J6.365 E.05218
G1 X99.429 Y153.595 E.01351
G2 X99.675 Y156.492 I3.117 J1.194 E.0815
G2 X100.816 Y157.509 I21.285 J-22.725 E.04144
G1 X94.888 Y151.212 F30000
G1 F10826.06
G2 X95.924 Y152.513 I27.047 J-20.471 E.04505
G2 X96.363 Y151.923 I-1.276 J-1.408 E.02005
G1 X96.586 Y151.087 E.02345
G2 X95.372 Y147.742 I-4.746 J-.17 E.09883
G2 X93.418 Y146.069 I-12.582 J12.723 E.06976
G3 X92.739 Y145.233 I1.78 J-2.137 E.02936
G1 X92.517 Y144.397 E.02345
G3 X93.73 Y141.052 I4.746 J-.17 E.09883
G3 X95.685 Y139.38 I12.584 J12.725 E.06976
G2 X96.363 Y138.543 I-1.78 J-2.137 E.02936
G1 X96.586 Y137.707 E.02345
G2 X95.372 Y134.362 I-4.746 J-.17 E.09883
G2 X93.418 Y132.69 I-12.582 J12.723 E.06976
G3 X92.739 Y131.854 I1.78 J-2.137 E.02936
G1 X92.517 Y131.017 E.02345
G3 X93.73 Y127.673 I4.746 J-.17 E.09883
G3 X95.685 Y126 I12.584 J12.725 E.06976
G2 X96.363 Y125.164 I-1.78 J-2.137 E.02936
G1 X96.586 Y124.328 E.02345
G2 X95.372 Y120.983 I-4.746 J-.17 E.09883
G2 X93.418 Y119.31 I-12.582 J12.723 E.06976
G3 X92.739 Y118.474 I1.78 J-2.137 E.02936
G1 X92.517 Y117.638 E.02345
G3 X93.73 Y114.293 I4.746 J-.17 E.09883
G3 X95.685 Y112.621 I12.584 J12.725 E.06976
G2 X96.363 Y111.784 I-1.78 J-2.137 E.02936
G1 X96.586 Y110.948 E.02345
G2 X95.372 Y107.603 I-4.746 J-.17 E.09883
G2 X93.418 Y105.931 I-12.582 J12.723 E.06976
G3 X92.73 Y105.059 I2.094 J-2.359 E.03025
G1 X92.26 Y104.682 E.01632
G2 X87.203 Y117.788 I35.747 J21.32 E.38247
G2 X88.995 Y119.31 I11.459 J-11.669 E.06376
G3 X89.673 Y120.147 I-1.78 J2.137 E.02936
G1 X89.896 Y120.983 E.02345
G3 X88.682 Y124.328 I-4.746 J.17 E.09883
G2 X86.385 Y126.353 I149.085 J171.413 E.08298
G2 X86.62 Y130.433 I42.959 J-.43 E.11078
G1 X87.041 Y131.017 E.01951
G2 X88.995 Y132.69 I12.581 J-12.722 E.06976
G3 X89.673 Y133.526 I-1.78 J2.137 E.02936
G1 X89.896 Y134.362 E.02345
G3 X88.199 Y138.153 I-4.869 J.096 E.11626
G2 X88.715 Y139.733 I43.332 J-13.279 E.04505
G1 X103.103 Y121.371 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.469419
G1 F10342.851
G3 X105.243 Y114.889 I25.016 J4.667 E.19419
; LINE_WIDTH: 0.487621
G1 F9927.529
G1 X105.386 Y114.567 E.01041
; LINE_WIDTH: 0.515285
G1 F9356.508
G1 X105.529 Y114.244 E.01105
G1 X105.103 Y113.856 E.01805
; LINE_WIDTH: 0.471146
G1 F10301.962
G1 X92.77 Y103.986 E.44982
G1 X92.539 Y104.36 E.01253
G1 X104.83 Y114.197 E.44831
; LINE_WIDTH: 0.489811
G1 F9879.796
G1 X104.894 Y114.284 E.00318
; LINE_WIDTH: 0.514339
G1 F9374.943
G1 X104.957 Y114.37 E.00335
G1 X104.915 Y114.573 E.00649
; LINE_WIDTH: 0.469357
G1 F10344.345
G2 X112.915 Y105.122 I23.082 J11.428 E4.23477
G2 X111.905 Y105.889 I8.848 J12.706 E.03596
; LINE_WIDTH: 0.482796
G1 F10034.34
G1 X111.781 Y105.972 E.00438
; LINE_WIDTH: 0.517908
G1 F9305.761
G1 X111.657 Y106.055 E.00472
G1 X111.543 Y106.054 E.00357
; LINE_WIDTH: 0.511296
G1 F9434.754
G1 X111.475 Y106.017 E.00241
; LINE_WIDTH: 0.471184
G1 F10301.082
G1 X111.407 Y105.98 E.00221
G1 X99.113 Y96.14 E.44843
G1 X98.799 Y96.448 E.01253
G1 X111.134 Y106.321 E.44993
; LINE_WIDTH: 0.489819
G1 F9879.633
G1 X111.37 Y106.486 E.00855
; LINE_WIDTH: 0.515835
G1 F9345.81
G1 X111.606 Y106.651 E.00904
G1 X112.015 Y106.359 E.01576
; LINE_WIDTH: 0.469353
G1 F10344.427
G3 X103.092 Y121.43 I15.985 J19.641 E4.00506
G1 X98.162 Y97.533 F30000
; LINE_WIDTH: 0.422026
G1 F11607.212
G1 X94.757 Y100.938 E.12171
G2 X93.477 Y102.735 I35.024 J26.308 E.05575
G1 X93.495 Y102.749 E.00057
G1 X98.343 Y97.9 E.17329
G1 X98.648 Y98.144 E.00986
G1 X93.8 Y102.993 E.17329
G1 X94.104 Y103.236 E.00986
G1 X98.953 Y98.388 E.17329
G1 X99.257 Y98.632 E.00986
G1 X94.409 Y103.48 E.17329
G1 X94.713 Y103.724 E.00986
G1 X99.562 Y98.875 E.17329
G1 X99.866 Y99.119 E.00986
G1 X95.018 Y103.968 E.17329
G1 X95.322 Y104.211 E.00986
G1 X100.171 Y99.363 E.17329
G1 X100.475 Y99.607 E.00986
G1 X95.627 Y104.455 E.17329
G1 X95.931 Y104.699 E.00986
G1 X100.78 Y99.85 E.17329
G1 X101.084 Y100.094 E.00986
G1 X96.236 Y104.943 E.17329
G1 X96.54 Y105.186 E.00986
G1 X101.389 Y100.338 E.17329
G1 X101.693 Y100.582 E.00986
G1 X96.845 Y105.43 E.17329
G1 X97.15 Y105.674 E.00986
G1 X101.998 Y100.825 E.17329
G1 X102.303 Y101.069 E.00986
G1 X97.454 Y105.917 E.17329
G1 X97.759 Y106.161 E.00986
G1 X102.607 Y101.313 E.17329
G1 X102.912 Y101.557 E.00986
G1 X98.063 Y106.405 E.17329
G1 X98.368 Y106.649 E.00986
G1 X103.216 Y101.8 E.17329
G1 X103.521 Y102.044 E.00986
G1 X98.672 Y106.892 E.17329
G1 X98.977 Y107.136 E.00986
G1 X103.825 Y102.288 E.17329
G1 X104.13 Y102.531 E.00986
G1 X99.281 Y107.38 E.17329
G1 X99.586 Y107.624 E.00986
G1 X104.434 Y102.775 E.17329
G1 X104.739 Y103.019 E.00986
G1 X99.89 Y107.867 E.17329
G1 X100.195 Y108.111 E.00986
G1 X105.043 Y103.263 E.17329
G1 X105.348 Y103.506 E.00986
G1 X100.5 Y108.355 E.17329
G1 X100.804 Y108.599 E.00986
G1 X105.652 Y103.75 E.17329
G1 X105.957 Y103.994 E.00986
G1 X101.109 Y108.842 E.17329
G1 X101.413 Y109.086 E.00986
G1 X106.262 Y104.238 E.17329
G1 X106.566 Y104.481 E.00986
G1 X101.718 Y109.33 E.17329
G1 X102.022 Y109.573 E.00986
G1 X106.871 Y104.725 E.17329
G1 X107.175 Y104.969 E.00986
G1 X102.327 Y109.817 E.17329
G1 X102.631 Y110.061 E.00986
G1 X107.48 Y105.213 E.17329
G1 X107.784 Y105.456 E.00986
G1 X102.936 Y110.305 E.17329
G1 X103.24 Y110.548 E.00986
G1 X108.089 Y105.7 E.17329
G1 X108.393 Y105.944 E.00986
G1 X103.545 Y110.792 E.17329
G1 X103.849 Y111.036 E.00986
G1 X108.698 Y106.188 E.17329
G1 X109.002 Y106.431 E.00986
G1 X104.154 Y111.28 E.17329
G1 X104.459 Y111.523 E.00986
G1 X109.307 Y106.675 E.17329
G1 X109.611 Y106.919 E.00986
G1 X104.763 Y111.767 E.17329
G1 X105.068 Y112.011 E.00986
G1 X109.916 Y107.162 E.17329
G1 X110.221 Y107.406 E.00986
G1 X105.372 Y112.255 E.17329
G1 X105.677 Y112.498 E.00986
G1 X110.525 Y107.65 E.17329
G1 X110.83 Y107.894 E.00986
G1 X105.981 Y112.742 E.17329
G1 X106.286 Y112.986 E.00986
G1 X111.134 Y108.137 E.17329
G1 X111.439 Y108.381 E.00986
G1 X106.59 Y113.229 E.17329
G1 X106.895 Y113.473 E.00986
G1 X112.907 Y107.461 E.21489
G3 X114.943 Y105.973 I15.443 J18.996 E.06377
G1 X107.199 Y113.717 E.27678
G1 X107.261 Y113.766 E.002
G1 X107.31 Y114.023 E.00661
G1 X107.138 Y114.327 E.00882
G1 X116.327 Y105.138 E.32844
G3 X116.989 Y104.779 I7.632 J13.304 E.01904
G1 X117.482 Y104.531 E.01394
G1 X106.531 Y115.482 E.39141
G2 X106.264 Y116.044 I11.438 J5.773 E.01573
G1 X106.063 Y116.498 E.01256
G1 X118.498 Y104.063 E.44447
G1 X119.424 Y103.686 E.02526
G1 X105.686 Y117.424 E.49103
G2 X105.372 Y118.286 I26.636 J10.178 E.02318
G1 X120.286 Y103.372 E.53304
G1 X121.092 Y103.114 E.02139
G1 X105.114 Y119.092 E.57107
G1 X104.895 Y119.859 E.02016
G1 X121.859 Y102.895 E.60632
G3 X122.475 Y102.74 I3.474 J12.459 E.01605
G1 X122.588 Y102.714 E.00295
G1 X104.714 Y120.588 E.63886
G1 X104.563 Y121.287 E.01807
G1 X123.288 Y102.563 E.66923
G3 X123.961 Y102.438 I2.896 J13.679 E.01732
G1 X104.438 Y121.961 E.6978
G2 X104.335 Y122.612 I13.218 J2.417 E.01666
G1 X124.612 Y102.335 E.72473
G3 X125.242 Y102.253 I1.989 J12.827 E.01606
G1 X104.253 Y123.242 E.75019
G1 X104.19 Y123.854 E.01554
G1 X125.854 Y102.19 E.77431
G1 X126.448 Y102.144 E.01507
G1 X104.144 Y124.448 E.79721
G1 X104.113 Y125.027 E.01465
G1 X127.027 Y102.113 E.81899
G3 X127.592 Y102.097 I.611 J11.478 E.01427
G1 X104.097 Y125.592 E.83974
G2 X104.094 Y126.143 I11.209 J.333 E.01393
G1 X128.143 Y102.094 E.85954
G3 X128.681 Y102.104 I.075 J10.97 E.01362
G1 X104.104 Y126.681 E.87845
G2 X104.125 Y127.209 I10.873 J-.167 E.01334
G1 X129.209 Y102.125 E.89655
G3 X129.725 Y102.157 I-.388 J10.527 E.01308
G1 X104.157 Y127.725 E.91387
G1 X104.198 Y128.232 E.01284
G1 X130.232 Y102.198 E.93048
G1 X130.729 Y102.25 E.01263
G1 X104.25 Y128.729 E.94641
G1 X104.31 Y129.217 E.01243
G1 X131.217 Y102.31 E.96171
G1 X131.694 Y102.381 E.0122
G1 X104.381 Y129.694 E.97624
G2 X104.46 Y130.164 I9.581 J-1.368 E.01203
G1 X132.164 Y102.46 E.9902
G3 X132.625 Y102.546 I-1.527 J9.432 E.01188
G1 X104.546 Y130.626 E1.00362
G2 X104.64 Y131.08 I9.318 J-1.684 E.01173
G1 X133.08 Y102.64 E1.01651
G1 X133.528 Y102.74 E.0116
G1 X104.74 Y131.528 E1.02892
G1 X104.85 Y131.966 E.01142
G1 X133.966 Y102.85 E1.04066
G1 X134.398 Y102.966 E.01131
G1 X104.966 Y132.398 E1.05195
G1 X105.089 Y132.824 E.0112
G1 X134.824 Y103.089 E1.06281
G1 X135.244 Y103.217 E.0111
G1 X105.217 Y133.244 E1.07324
G1 X105.353 Y133.657 E.01097
G1 X135.657 Y103.353 E1.08311
G1 X136.063 Y103.495 E.01088
G1 X105.495 Y134.063 E1.09255
G1 X105.642 Y134.464 E.0108
G1 X136.464 Y103.642 E1.10162
G1 X136.859 Y103.795 E.01072
G1 X105.795 Y134.859 E1.11031
G1 X105.955 Y135.247 E.01061
G1 X137.247 Y103.955 E1.11845
G1 X137.631 Y104.12 E.01055
G1 X106.12 Y135.631 E1.12626
G1 X106.29 Y136.01 E.01049
G1 X138.01 Y104.29 E1.13374
G1 X138.382 Y104.466 E.01041
G1 X106.466 Y136.382 E1.14075
G1 X106.647 Y136.749 E.01034
G1 X138.749 Y104.647 E1.14738
G3 X139.111 Y104.833 I-3.601 J7.479 E.0103
G1 X106.833 Y137.111 E1.1537
G1 X107.024 Y137.469 E.01024
G1 X139.469 Y105.024 E1.15964
G3 X139.82 Y105.221 I-3.83 J7.238 E.01018
G1 X107.221 Y137.82 E1.16515
G1 X107.422 Y138.167 E.01014
G1 X140.167 Y105.422 E1.17038
G1 X140.51 Y105.627 E.0101
G1 X107.627 Y138.51 E1.17529
G1 X107.839 Y138.846 E.01005
G1 X140.846 Y105.839 E1.17974
G3 X141.179 Y106.055 I-4.213 J6.863 E.01002
G1 X108.055 Y139.179 E1.18392
G1 X108.274 Y139.508 E.00999
G1 X141.508 Y106.274 E1.18782
G3 X141.83 Y106.501 I-4.463 J6.697 E.00995
G1 X108.501 Y139.83 E1.19125
G2 X108.73 Y140.148 I6.615 J-4.527 E.00993
G1 X142.148 Y106.73 E1.19442
G1 X142.463 Y106.964 E.00991
G1 X108.964 Y140.463 E1.19733
G1 X109.204 Y140.771 E.00987
G1 X142.771 Y107.204 E1.19977
G1 X143.076 Y107.447 E.00986
G1 X109.447 Y141.076 E1.20196
G1 X109.694 Y141.377 E.00985
G1 X143.377 Y107.694 E1.20389
G3 X143.672 Y107.948 I-5.014 J6.125 E.00983
G1 X109.948 Y141.672 E1.20536
G2 X110.205 Y141.963 I6.053 J-5.078 E.00982
G1 X143.963 Y108.205 E1.2066
G1 X144.251 Y108.466 E.00981
G1 X110.466 Y142.251 E1.20756
G1 X110.732 Y142.532 E.0098
G1 X144.532 Y108.732 E1.20807
G3 X144.81 Y109.003 I-5.366 J5.8 E.0098
G1 X111.003 Y142.81 E1.20836
M73 P38 R27
G1 X111.277 Y143.084 E.0098
G1 X145.084 Y109.277 E1.20836
G1 X145.353 Y109.557 E.0098
G1 X111.557 Y143.353 E1.20792
G2 X111.84 Y143.617 I5.547 J-5.654 E.0098
G1 X145.617 Y109.841 E1.20725
G1 X145.878 Y110.128 E.00981
G1 X112.128 Y143.878 E1.20629
G1 X112.422 Y144.133 E.00982
G1 X146.133 Y110.422 E1.2049
G3 X146.384 Y110.719 I-5.929 J5.276 E.00983
G1 X112.718 Y144.384 E1.20328
G1 X113.02 Y144.631 E.00985
G1 X146.631 Y111.02 E1.20135
G1 X146.873 Y111.327 E.00987
G1 X113.327 Y144.873 E1.199
G1 X113.637 Y145.11 E.00988
G1 X147.11 Y111.637 E1.19641
G1 X147.344 Y111.952 E.00991
G1 X113.952 Y145.344 E1.1935
G1 X114.273 Y145.571 E.00994
G1 X147.571 Y112.273 E1.19016
G3 X147.795 Y112.597 I-6.483 J4.718 E.00996
G1 X114.597 Y145.795 E1.18658
G1 X114.926 Y146.015 E.00999
G1 X148.015 Y112.926 E1.18269
G1 X148.228 Y113.26 E.01004
G1 X115.26 Y146.228 E1.17834
G1 X115.599 Y146.438 E.01007
G1 X148.438 Y113.599 E1.17373
G1 X148.644 Y113.942 E.0101
G1 X115.942 Y146.644 E1.16882
G1 X116.291 Y146.842 E.01016
G1 X148.842 Y114.292 E1.16343
G1 X149.037 Y114.645 E.0102
G1 X116.645 Y147.037 E1.15775
G1 X117.003 Y147.228 E.01024
G1 X149.228 Y115.003 E1.15179
G1 X149.411 Y115.367 E.01032
G1 X117.367 Y147.411 E1.14532
G2 X117.736 Y147.59 I3.837 J-7.441 E.01037
G1 X149.59 Y115.736 E1.13852
G1 X149.765 Y116.11 E.01042
G1 X118.11 Y147.765 E1.13141
G1 X118.49 Y147.933 E.0105
G1 X149.933 Y116.49 E1.12386
G1 X150.096 Y116.876 E.01058
G1 X118.876 Y148.096 E1.11587
G1 X119.266 Y148.254 E.01065
G1 X150.254 Y117.266 E1.10755
G1 X150.406 Y117.662 E.01072
G1 X119.662 Y148.406 E1.09886
G1 X120.066 Y148.551 E.01084
G1 X150.551 Y118.066 E1.08961
G3 X150.69 Y118.475 I-8.253 J3.041 E.01092
G1 X120.474 Y148.69 E1.07997
G1 X120.889 Y148.824 E.01101
G1 X150.824 Y118.889 E1.06995
G1 X150.952 Y119.31 E.01111
G1 X121.309 Y148.952 E1.05948
G2 X121.738 Y149.071 I2.67 J-8.753 E.01125
G1 X151.071 Y119.738 E1.04842
G1 X151.185 Y120.173 E.01136
G1 X122.173 Y149.185 E1.03693
G1 X122.615 Y149.292 E.01148
G1 X151.292 Y120.615 E1.02498
G1 X151.392 Y121.063 E.0116
G1 X123.063 Y149.392 E1.01255
G1 X123.52 Y149.483 E.01178
G1 X151.483 Y121.52 E.99945
G1 X151.566 Y121.985 E.01194
G1 X123.985 Y149.566 E.98581
G1 X124.457 Y149.642 E.0121
G1 X151.642 Y122.458 E.97162
G3 X151.709 Y122.938 I-9.777 J1.616 E.01227
G1 X124.938 Y149.709 E.95684
G1 X125.428 Y149.768 E.01246
G1 X151.768 Y123.428 E.94145
G1 X151.817 Y123.927 E.01268
G1 X125.927 Y149.817 E.92537
G1 X126.437 Y149.855 E.01293
G1 X151.855 Y124.437 E.9085
G1 X151.883 Y124.957 E.01317
G1 X126.957 Y149.883 E.8909
G1 X127.489 Y149.9 E.01343
G1 X151.9 Y125.489 E.87252
G1 X151.906 Y126.032 E.01372
G1 X128.032 Y149.906 E.85331
G2 X128.587 Y149.898 I.131 J-11.329 E.01404
G1 X151.898 Y126.587 E.8332
G1 X151.878 Y127.156 E.01439
G1 X129.156 Y149.878 E.81212
G1 X129.74 Y149.842 E.01478
G1 X151.842 Y127.74 E.78999
G1 X151.791 Y128.339 E.01521
G1 X130.339 Y149.791 E.76672
G1 X130.956 Y149.722 E.01569
G1 X151.722 Y128.956 E.74221
G3 X151.634 Y129.593 I-13.002 J-1.472 E.01623
G1 X131.593 Y149.634 E.71633
G1 X132.25 Y149.525 E.01683
G1 X151.525 Y130.25 E.68896
G1 X151.393 Y130.93 E.01752
G1 X132.93 Y149.393 E.65992
G1 X133.64 Y149.231 E.01841
G1 X151.231 Y131.64 E.62874
G1 X151.038 Y132.382 E.01937
G1 X134.382 Y149.038 E.59532
G1 X135.158 Y148.81 E.02045
G1 X150.81 Y133.158 E.55942
G1 X150.533 Y133.983 E.02198
G1 X135.983 Y148.533 E.52006
G1 X136.86 Y148.205 E.02366
G1 X150.205 Y134.86 E.47698
G1 X149.798 Y135.815 E.02623
G1 X137.815 Y147.798 E.42833
G2 X138.486 Y147.485 I-6.05 J-13.839 E.01873
G1 X138.869 Y147.292 E.01083
G1 X149.292 Y136.869 E.37255
G3 X148.945 Y137.528 I-13.612 J-6.764 E.01883
G1 X148.632 Y138.078 E.01599
G1 X140.078 Y146.632 E.30572
G2 X141.589 Y145.669 I-13.008 J-22.083 E.04529
G1 X147.669 Y139.589 E.2173
G3 X146.665 Y140.939 I-21.624 J-15.028 E.04251
G1 X146.293 Y141.392 E.01483
G1 X145.516 Y142.271 E.02965
G1 X142.856 Y144.95 E.09542
G1 X135.123 Y151.198 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X136.525 Y150.763 I-19.571 J-65.506 E.03977
G1 X136.707 Y150.695 E.00528
G1 X136.724 Y151.087 E.01063
G1 X136.502 Y151.923 E.02345
G1 X136.23 Y152.341 E.01351
G3 X134.775 Y153.595 I-5.677 J-5.112 E.05218
G2 X132.896 Y156.104 I3.528 J4.601 E.08601
G2 X132.878 Y158.613 I3.571 J1.279 E.06928
G1 X133.15 Y159.031 E.01351
G2 X134.605 Y160.285 I5.676 J-5.112 E.05218
G3 X136.484 Y162.794 I-3.528 J4.601 E.08601
G3 X136.502 Y165.303 I-3.571 J1.279 E.06928
G1 X136.23 Y165.721 E.01351
G3 X134.66 Y167.081 I-15.875 J-16.729 E.0563
G2 X140.569 Y165.675 I-7.849 J-46.09 E.16469
G2 X141.294 Y165.303 I-.14 J-1.166 E.02256
G2 X143.174 Y162.794 I-3.528 J-4.601 E.08601
G2 X143.191 Y160.285 I-3.571 J-1.279 E.06928
G1 X142.92 Y159.867 E.01351
G2 X141.465 Y158.613 I-5.676 J5.112 E.05218
G3 X139.585 Y156.104 I3.528 J-4.601 E.08601
G3 X139.568 Y153.595 I3.571 J-1.279 E.06928
G1 X139.84 Y153.177 E.01351
G3 X141.294 Y151.923 I5.676 J5.111 E.05218
G2 X143.378 Y148.578 I-3.067 J-4.232 E.10949
G2 X143.285 Y147.256 I-2.154 J-.512 E.03646
G2 X146.159 Y144.861 I-13.608 J-19.25 E.10148
G2 X146.53 Y145.651 I1.393 J-.172 E.02404
G2 X147.984 Y146.906 I5.676 J-5.112 E.05218
G3 X149.864 Y149.414 I-3.528 J4.601 E.08601
G3 X149.881 Y151.923 I-3.571 J1.279 E.06928
G1 X149.609 Y152.341 E.01351
G3 X148.155 Y153.595 I-5.677 J-5.112 E.05218
G2 X146.275 Y156.104 I3.528 J4.601 E.08601
G2 X146.258 Y158.613 I3.571 J1.279 E.06928
G1 X146.53 Y159.031 E.01351
G2 X147.984 Y160.285 I5.676 J-5.112 E.05218
G3 X149.33 Y161.733 I-2.862 J4.01 E.05392
G2 X154.381 Y158.185 I-21.334 J-35.739 E.16741
G3 X152.965 Y156.104 I3.543 J-3.933 E.06885
G3 X152.948 Y153.595 I3.571 J-1.279 E.06928
G1 X153.219 Y153.177 E.01351
G3 X154.674 Y151.923 I5.676 J5.111 E.05218
G2 X156.553 Y149.414 I-3.528 J-4.601 E.08601
G2 X156.571 Y146.906 I-3.571 J-1.279 E.06928
G1 X156.299 Y146.488 E.01351
G2 X154.845 Y145.233 I-5.676 J5.112 E.05218
G3 X152.965 Y142.725 I3.528 J-4.601 E.08601
G3 X152.948 Y140.216 I3.571 J-1.279 E.06928
G1 X153.219 Y139.798 E.01351
G3 X154.674 Y138.543 I5.676 J5.111 E.05218
G2 X156.553 Y136.035 I-3.528 J-4.601 E.08601
G2 X156.571 Y133.526 I-3.571 J-1.279 E.06928
G1 X156.299 Y133.108 E.01351
G2 X153.939 Y131.017 I-88.082 J97.081 E.08545
G1 X153.747 Y130.751 E.0089
G2 X154.178 Y125.56 I-25.776 J-4.754 E.14138
G1 X154.674 Y125.164 E.0172
G2 X156.553 Y122.655 I-3.528 J-4.601 E.08601
G2 X156.571 Y120.147 I-3.571 J-1.279 E.06928
G1 X156.299 Y119.728 E.01351
G2 X154.845 Y118.474 I-5.676 J5.112 E.05218
G3 X152.965 Y115.965 I3.528 J-4.601 E.08601
G3 X152.948 Y113.457 I3.571 J-1.279 E.06928
G1 X153.219 Y113.039 E.01351
G3 X154.674 Y111.784 I5.676 J5.111 E.05218
G2 X156.553 Y109.276 I-3.528 J-4.601 E.08601
G2 X156.571 Y106.767 I-3.571 J-1.279 E.06928
G1 X156.299 Y106.349 E.01351
G2 X154.845 Y105.095 I-5.676 J5.112 E.05218
G3 X152.965 Y102.586 I3.528 J-4.601 E.08601
G3 X152.948 Y100.077 I3.571 J-1.279 E.06928
G1 X153.219 Y99.659 E.01351
G3 X154.674 Y98.405 I5.676 J5.111 E.05218
G2 X156.587 Y95.758 I-3.067 J-4.231 E.09001
G3 X160.966 Y100.601 I-28.715 J30.362 E.17712
G2 X159.655 Y102.586 I3.651 J3.839 E.06501
G2 X159.637 Y105.095 I3.571 J1.279 E.06928
G1 X159.909 Y105.513 E.01351
G2 X161.364 Y106.767 I5.676 J-5.112 E.05218
G3 X163.243 Y109.276 I-3.528 J4.601 E.08601
G3 X163.261 Y111.784 I-3.571 J1.279 E.06928
G1 X162.989 Y112.202 E.01351
G3 X161.534 Y113.457 I-5.677 J-5.112 E.05218
G2 X159.655 Y115.965 I3.528 J4.601 E.08601
G2 X159.637 Y118.474 I3.571 J1.279 E.06928
G1 X159.909 Y118.892 E.01351
G2 X161.364 Y120.147 I5.676 J-5.112 E.05218
G3 X163.243 Y122.655 I-3.528 J4.601 E.08601
G3 X163.261 Y125.164 I-3.571 J1.279 E.06928
G1 X162.989 Y125.582 E.01351
G3 X161.534 Y126.836 I-5.677 J-5.112 E.05218
G2 X159.655 Y129.345 I3.528 J4.601 E.08601
G2 X159.637 Y131.854 I3.571 J1.279 E.06928
G1 X159.909 Y132.272 E.01351
G2 X161.364 Y133.526 I5.676 J-5.112 E.05218
G3 X163.243 Y136.035 I-3.528 J4.601 E.08601
G3 X163.261 Y138.543 I-3.571 J1.279 E.06928
G1 X162.989 Y138.962 E.01351
G3 X161.534 Y140.216 I-5.677 J-5.112 E.05218
G2 X159.655 Y142.725 I3.528 J4.601 E.08601
G2 X159.637 Y145.233 I3.571 J1.279 E.06928
G1 X159.909 Y145.651 E.01351
G2 X161.364 Y146.906 I5.676 J-5.112 E.05218
G3 X162.871 Y148.578 I-3.33 J4.517 E.06143
G1 X162.908 Y148.66 E.00243
G2 X166.252 Y142.397 I-35.619 J-23.043 E.19263
G3 X166.327 Y140.216 I2.85 J-.993 E.06049
G3 X167.551 Y138.945 I3.565 J2.207 E.04817
G2 X169.098 Y132.551 I-43.194 J-13.842 E.17841
G1 X168.224 Y131.854 E.03031
G3 X166.345 Y129.345 I3.528 J-4.601 E.08601
G3 X166.327 Y126.836 I3.571 J-1.279 E.06928
G1 X166.599 Y126.418 E.01351
G3 X168.054 Y125.164 I5.676 J5.111 E.05218
G2 X169.543 Y123.516 I-3.278 J-4.461 E.0606
G2 X169.044 Y119.129 I-51.082 J3.583 E.1197
G1 X168.224 Y118.474 E.02843
G3 X166.345 Y115.965 I3.528 J-4.601 E.08601
G3 X166.327 Y113.457 I3.571 J-1.279 E.06928
G3 X167.321 Y112.369 I3.234 J1.956 E.04019
G2 X166.744 Y110.809 I-32.05 J10.978 E.04505
G1 X147.967 Y89.486 F30000
G1 F10826.06
G2 X146.492 Y88.719 I-16.38 J29.684 E.04505
G2 X146.258 Y91.715 I3.314 J1.767 E.08378
G2 X146.936 Y92.551 I2.458 J-1.301 E.02936
G3 X148.89 Y94.224 I-10.628 J14.395 E.06976
G3 X150.104 Y97.569 I-3.532 J3.175 E.09883
G1 X149.881 Y98.405 E.02345
G3 X149.203 Y99.241 I-2.458 J-1.301 E.02936
G2 X147.249 Y100.913 I10.631 J14.399 E.06976
G2 X146.035 Y104.258 I3.532 J3.175 E.09883
G1 X146.258 Y105.095 E.02345
G2 X146.936 Y105.931 I2.458 J-1.301 E.02936
G3 X148.89 Y107.603 I-10.628 J14.395 E.06976
G3 X150.104 Y110.948 I-3.532 J3.175 E.09883
G1 X149.914 Y111.662 E.02002
G2 X139.566 Y102.505 I-22.028 J14.468 E.37884
G3 X139.568 Y100.077 I3.516 J-1.211 E.06702
G3 X140.246 Y99.241 I2.458 J1.301 E.02936
G2 X142.2 Y97.569 I-10.628 J-14.396 E.06976
G2 X143.414 Y94.224 I-3.532 J-3.175 E.09883
G1 X143.191 Y93.387 E.02345
G2 X142.513 Y92.551 I-2.458 J1.301 E.02936
G3 X140.559 Y90.879 I10.627 J-14.395 E.06976
G3 X139.345 Y87.534 I3.532 J-3.175 E.09883
G1 X139.568 Y86.698 E.02345
G3 X139.971 Y86.144 I1.605 J.746 E.01868
G2 X136.366 Y85.234 I-12.092 J40.306 E.1008
G3 X135.823 Y85.861 I-1.861 J-1.061 E.02262
G2 X133.869 Y87.534 I10.63 J14.398 E.06976
G2 X132.655 Y90.879 I3.532 J3.175 E.09883
G1 X132.878 Y91.715 E.02345
G2 X133.556 Y92.551 I2.458 J-1.301 E.02936
G3 X135.511 Y94.224 I-10.628 J14.395 E.06976
G3 X136.724 Y97.569 I-3.532 J3.175 E.09883
G1 X136.502 Y98.405 E.02345
G3 X135.823 Y99.241 I-2.458 J-1.301 E.02936
G2 X134.242 Y100.57 I8.43 J11.641 E.05602
G1 X134.056 Y100.521 E.00519
G2 X126.321 Y99.872 I-6.015 J25.292 E.21112
G3 X126.867 Y99.241 I1.873 J1.066 E.02275
G2 X128.821 Y97.569 I-10.628 J-14.396 E.06976
G2 X130.035 Y94.224 I-3.532 J-3.175 E.09883
G1 X129.812 Y93.387 E.02345
G2 X129.133 Y92.551 I-2.458 J1.301 E.02936
G3 X127.179 Y90.879 I10.627 J-14.395 E.06976
G3 X125.966 Y87.534 I3.532 J-3.175 E.09883
G1 X126.188 Y86.698 E.02345
G3 X126.867 Y85.861 I2.458 J1.301 E.02936
G2 X128.595 Y84.397 I-9.294 J-12.724 E.06143
G2 X123.22 Y84.659 I-.49 J45.218 E.14592
G3 X122.444 Y85.861 I-2.157 J-.541 E.03947
G2 X120.49 Y87.534 I10.63 J14.398 E.06976
G2 X119.276 Y90.879 I3.532 J3.175 E.09883
G1 X119.499 Y91.715 E.02345
G2 X120.177 Y92.551 I2.458 J-1.301 E.02936
G3 X122.131 Y94.224 I-10.628 J14.395 E.06976
G3 X123.345 Y97.569 I-3.532 J3.175 E.09883
G1 X123.122 Y98.405 E.02345
G3 X122.444 Y99.241 I-2.458 J-1.301 E.02936
G2 X120.485 Y100.919 I15.275 J19.805 E.06992
G2 X113.675 Y104.085 I7.54 J25.129 E.2042
G3 X112.586 Y100.913 I3.424 J-2.949 E.09309
G1 X112.809 Y100.077 E.02345
G3 X113.487 Y99.241 I2.458 J1.301 E.02936
G2 X115.441 Y97.569 I-10.628 J-14.396 E.06976
G2 X116.655 Y94.224 I-3.532 J-3.175 E.09883
G1 X116.432 Y93.387 E.02345
G2 X115.754 Y92.551 I-2.458 J1.301 E.02936
G3 X113.8 Y90.879 I10.627 J-14.395 E.06976
G3 X112.643 Y87.32 I3.409 J-3.076 E.10443
G3 X114.201 Y86.739 I12.618 J31.436 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X112.643 Y87.32 E-.63176
G1 X112.586 Y87.534 E-.084
G1 X112.591 Y87.65 E-.04424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/58
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.4 I-1.197 J.222 P1  F30000
G1 X127.486 Y167.97 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X120.317 Y84.736 I.504 J-41.969 E3.35025
G3 X129.329 Y84.05 I7.701 J41.632 E.24538
G3 X127.546 Y167.97 I-1.339 J41.951 E3.54876
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X120.241 Y84.327 I.509 J-42.385 E3.38344
G3 X129.339 Y83.634 I7.777 J42.04 E.24773
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.386 I-1.349 J42.366 E3.584
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.786 E.00002
G3 X120.168 Y83.933 I.514 J-42.786 E3.16891
G3 X129.349 Y83.233 I7.85 J42.437 E.23195
G3 X128.525 Y168.786 I-1.359 J42.767 E3.33197
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.786 E-.02288
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.33783
; WIPE_END
G1 E-.04 F1800
G1 X119.779 Y166.795 Z1.56 F30000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X121.389 Y167.09 I6.795 J-32.582 E.04434
G2 X122.696 Y166.139 I-13.592 J-20.066 E.04381
G2 X123.348 Y165.303 I-1.358 J-1.731 E.02902
G1 X123.498 Y164.466 E.02302
G2 X122.065 Y161.121 I-4.994 J.16 E.10093
G2 X119.924 Y159.449 I-14.281 J16.072 E.07366
G3 X119.272 Y158.613 I1.358 J-1.731 E.02902
G1 X119.123 Y157.777 E.02302
G3 X120.556 Y154.432 I4.994 J.16 E.10093
G3 X122.696 Y152.759 I14.283 J16.075 E.07366
G2 X123.376 Y151.77 I-1.208 J-1.557 E.03304
G2 X127.407 Y152.177 I4.439 J-23.798 E.10994
G2 X125.962 Y153.595 I1.747 J3.225 E.05559
G1 X125.812 Y154.432 E.02302
G2 X127.246 Y157.777 I4.994 J-.16 E.10093
G2 X129.386 Y159.449 I14.279 J-16.069 E.07366
G3 X130.038 Y160.285 I-1.358 J1.731 E.02902
G1 X130.188 Y161.121 E.02302
G3 X128.755 Y164.466 I-4.994 J-.16 E.10093
G3 X126.614 Y166.139 I-14.28 J-16.071 E.07366
G2 X125.857 Y167.56 I1.201 J1.551 E.04495
G2 X134.848 Y167.048 I2.046 J-43.323 E.24446
G3 X136.076 Y166.139 I7.8 J9.245 E.04143
G2 X136.728 Y165.303 I-1.358 J-1.731 E.02902
G1 X136.878 Y164.466 E.02302
G2 X135.444 Y161.121 I-4.994 J.16 E.10093
G2 X133.304 Y159.449 I-14.281 J16.072 E.07366
G3 X132.652 Y158.613 I1.358 J-1.731 E.02902
G1 X132.502 Y157.777 E.02302
G3 X133.935 Y154.432 I4.994 J.16 E.10093
G3 X136.076 Y152.759 I14.283 J16.075 E.07366
G2 X136.728 Y151.923 I-1.358 J-1.731 E.02902
G1 X136.878 Y151.087 E.02302
M73 P39 R27
G1 X136.827 Y150.65 E.01191
G3 X135.29 Y151.154 I-15.817 J-45.679 E.04384
G1 X135.247 Y151.165 E.00121
G1 X139.08 Y166.113 F30000
G1 F10826.06
G2 X140.569 Y165.675 I-8.185 J-30.57 E.04207
M73 P39 R26
G2 X141.134 Y165.303 I-.291 J-1.056 E.01863
G2 X143.567 Y161.121 I-2.906 J-4.491 E.13603
G2 X142.766 Y159.449 I-2.146 J0 E.05197
G1 X141.626 Y158.613 E.03831
G3 X139.192 Y154.432 I2.906 J-4.491 E.13603
G3 X139.994 Y152.759 I2.146 J.001 E.05197
G1 X141.134 Y151.923 E.03831
G2 X143.471 Y148.578 I-2.958 J-4.556 E.11336
G2 X143.458 Y147.131 I-2.414 J-.702 E.03977
G2 X145.828 Y145.184 I-16.813 J-22.879 E.08316
G1 X145.994 Y145.022 E.00627
G2 X146.683 Y146.069 I1.838 J-.46 E.03463
G1 X147.823 Y146.906 E.03831
G3 X150.257 Y151.087 I-2.906 J4.491 E.13603
G3 X149.455 Y152.759 I-2.146 J-.001 E.05197
G1 X148.316 Y153.595 E.03831
G2 X145.882 Y157.777 I2.906 J4.491 E.13603
G2 X146.683 Y159.449 I2.146 J0 E.05197
G3 X148.824 Y161.121 I-12.14 J17.744 E.07366
G1 X149.316 Y161.741 E.02144
G2 X154.437 Y158.138 I-21.326 J-35.755 E.16985
G3 X152.572 Y154.432 I3.237 J-3.953 E.11579
G3 X153.373 Y152.759 I2.146 J.001 E.05197
G1 X154.513 Y151.923 E.03831
G2 X156.947 Y147.742 I-2.906 J-4.491 E.13603
G2 X156.145 Y146.069 I-2.146 J0 E.05197
G1 X155.005 Y145.233 E.03831
G3 X152.572 Y141.052 I2.906 J-4.491 E.13603
G3 X153.373 Y139.38 I2.146 J.001 E.05197
G1 X154.513 Y138.543 E.03831
G2 X156.947 Y134.362 I-2.906 J-4.491 E.13603
G2 X156.145 Y132.69 I-2.146 J0 E.05197
G3 X154.005 Y131.017 I12.138 J-17.742 E.07366
G1 X153.756 Y130.703 E.01086
G2 X154.176 Y125.411 I-25.895 J-4.72 E.1441
G1 X154.513 Y125.164 E.01133
G2 X156.947 Y120.983 I-2.906 J-4.491 E.13603
G2 X156.145 Y119.31 I-2.146 J.001 E.05197
G1 X155.005 Y118.474 E.03831
G3 X152.572 Y114.293 I2.906 J-4.491 E.13603
G3 X153.373 Y112.621 I2.147 J.001 E.05197
G1 X154.513 Y111.784 E.03831
G2 X156.947 Y107.603 I-2.906 J-4.491 E.13603
G2 X156.145 Y105.931 I-2.146 J.001 E.05197
G1 X155.005 Y105.095 E.03831
G3 X152.572 Y100.913 I2.906 J-4.491 E.13603
G3 X153.373 Y99.241 I2.147 J.001 E.05197
G1 X154.513 Y98.405 E.03831
G2 X156.628 Y95.796 I-2.965 J-4.565 E.0925
G3 X161.006 Y100.653 I-28.783 J30.354 E.17737
G2 X159.261 Y104.258 I3.364 J3.853 E.11152
G2 X160.063 Y105.931 I2.146 J0 E.05197
G1 X161.203 Y106.767 E.03831
G3 X163.637 Y110.948 I-2.906 J4.491 E.13603
G3 X162.835 Y112.621 I-2.146 J-.001 E.05197
G1 X161.695 Y113.457 E.03831
G2 X159.261 Y117.638 I2.906 J4.491 E.13603
G2 X160.063 Y119.31 I2.146 J0 E.05197
G1 X161.203 Y120.147 E.03831
G3 X163.637 Y124.328 I-2.906 J4.491 E.13603
G3 X162.835 Y126 I-2.146 J-.001 E.05197
G1 X161.695 Y126.836 E.03831
G2 X159.261 Y131.017 I2.906 J4.491 E.13603
G2 X160.063 Y132.69 I2.146 J0 E.05197
G1 X161.203 Y133.526 E.03831
G3 X163.637 Y137.707 I-2.906 J4.491 E.13603
G3 X162.835 Y139.38 I-2.146 J-.001 E.05197
G1 X161.695 Y140.216 E.03831
G2 X159.261 Y144.397 I2.906 J4.491 E.13603
G2 X160.063 Y146.069 I2.146 J0 E.05197
G1 X161.203 Y146.906 E.03831
G3 X162.867 Y148.578 I-3.206 J4.854 E.06437
G1 X162.908 Y148.66 E.00247
G2 X166.222 Y142.464 I-35.526 J-22.988 E.1906
G3 X166.101 Y140.216 I3.561 J-1.319 E.06195
G3 X167.616 Y138.746 I3.293 J1.879 E.05796
G2 X169.122 Y132.394 I-43.238 J-13.603 E.17705
G1 X168.385 Y131.854 E.02476
G3 X165.951 Y127.673 I2.906 J-4.491 E.13603
G3 X166.753 Y126 I2.146 J.001 E.05197
G1 X167.893 Y125.164 E.03831
G2 X169.543 Y123.509 I-3.171 J-4.812 E.06377
G2 X169.01 Y118.933 I-49.972 J3.493 E.12487
G1 X168.385 Y118.474 E.02102
G3 X166.301 Y115.965 I3.397 J-4.943 E.08951
G3 X166.101 Y113.457 I3.729 J-1.559 E.06934
G3 X167.274 Y112.238 I2.823 J1.544 E.04639
G2 X166.694 Y110.68 I-32.026 J11.043 E.04505
G1 X148.352 Y109.886 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422076
G1 F11605.716
G2 X145.551 Y107.106 I-138.072 J136.288 E.09978
G1 X144.603 Y106.267 E.03199
G1 X143.615 Y105.477 E.03197
G1 X142.818 Y104.901 E.02486
G1 X149.096 Y111.178 E.2244
G1 X149.616 Y111.936 E.02323
G1 X150.114 Y112.745 E.02401
G1 X141.255 Y103.886 E.3167
G1 X140.434 Y103.407 E.02401
G1 X140.006 Y103.185 E.01219
G1 X150.825 Y114.004 E.38674
G1 X151.362 Y115.09 E.03062
G1 X138.905 Y102.633 E.4453
G1 X137.933 Y102.208 E.02682
G1 X151.792 Y116.067 E.49541
G1 X152.148 Y116.973 E.02459
G1 X137.027 Y101.852 E.54052
G2 X136.174 Y101.546 I-3.536 J8.535 E.02294
G1 X152.454 Y117.826 E.58197
G1 X152.708 Y118.629 E.02128
G1 X135.371 Y101.292 E.61975
G1 X134.613 Y101.082 E.01989
G1 X152.918 Y119.387 E.65436
G1 X153.108 Y120.126 E.01928
G1 X133.874 Y100.892 E.68756
G1 X133.178 Y100.744 E.01797
G1 X153.256 Y120.822 E.7177
G1 X153.388 Y121.502 E.01753
G1 X132.497 Y100.611 E.74678
G1 X131.844 Y100.506 E.01673
G1 X153.494 Y122.156 E.77391
G1 X153.583 Y122.794 E.01628
G1 X131.206 Y100.417 E.7999
G1 X130.589 Y100.349 E.01569
G1 X153.651 Y123.411 E.8244
G3 X153.707 Y124.015 I-6.124 J.869 E.01534
G1 X129.982 Y100.29 E.84809
G1 X129.397 Y100.253 E.01481
G1 X153.743 Y124.599 E.87028
G1 X153.772 Y125.177 E.01462
G1 X128.828 Y100.232 E.89167
G1 X128.262 Y100.214 E.01433
G1 X153.779 Y125.732 E.91217
G1 X153.786 Y126.287 E.01403
G1 X127.72 Y100.221 E.93178
G1 X127.178 Y100.228 E.01369
G1 X153.768 Y126.817 E.95049
G1 X153.748 Y127.346 E.01338
G1 X126.656 Y100.253 E.96848
G1 X126.139 Y100.285 E.01308
G1 X153.716 Y127.862 E.98577
G1 X153.672 Y128.367 E.01281
G1 X125.63 Y100.324 E1.00242
G1 X125.136 Y100.379 E.01255
G1 X153.627 Y128.87 E1.01847
G1 X153.562 Y129.353 E.01232
G1 X124.643 Y100.434 E1.03377
G1 X124.165 Y100.505 E.0122
G1 X153.496 Y129.836 E1.04848
G1 X153.421 Y130.309 E.01211
G1 X123.693 Y100.581 E1.06269
G1 X123.223 Y100.659 E.01204
G1 X153.335 Y130.771 E1.07641
G1 X153.249 Y131.234 E.01189
G1 X122.771 Y100.755 E1.08951
G1 X122.318 Y100.851 E.01169
G1 X153.148 Y131.681 E1.10208
G1 X153.043 Y132.124 E.01151
G1 X121.871 Y100.952 E1.1143
G1 X121.432 Y101.062 E.01143
G1 X152.938 Y132.567 E1.12621
G1 X152.815 Y132.993 E.01119
G1 X121.007 Y101.185 E1.13701
G1 X120.582 Y101.308 E.01119
G1 X152.692 Y133.418 E1.1478
G1 X152.566 Y133.841 E.01115
G1 X120.159 Y101.434 E1.15843
G1 X119.751 Y101.574 E.01091
G1 X152.426 Y134.249 E1.168
G1 X152.285 Y134.657 E.01091
G1 X119.343 Y101.715 E1.17757
G2 X118.939 Y101.858 I1.259 J4.195 E.01086
G1 X152.143 Y135.062 E1.18694
G1 X151.99 Y135.458 E.01072
G1 X118.547 Y102.015 E1.19548
G1 X118.155 Y102.171 E.01066
G1 X151.829 Y135.845 E1.20373
G1 X151.665 Y136.229 E.01056
G1 X117.766 Y102.331 E1.21174
G1 X117.39 Y102.503 E.01046
G1 X151.5 Y136.613 E1.21931
G1 X151.325 Y136.986 E.01042
G1 X117.014 Y102.676 E1.22649
G1 X116.64 Y102.85 E.01043
G1 X151.145 Y137.355 E1.23344
G1 X150.965 Y137.723 E.01037
G1 X116.279 Y103.037 E1.23992
G1 X115.918 Y103.225 E.01028
G1 X150.777 Y138.083 E1.24609
G1 X150.582 Y138.437 E.0102
G1 X115.557 Y103.412 E1.25202
G1 X115.211 Y103.614 E.01014
G1 X150.388 Y138.791 E1.25745
G1 X150.186 Y139.138 E.01014
G1 X114.865 Y103.816 E1.26264
G1 X114.518 Y104.018 E.01014
G1 X149.977 Y139.477 E1.26755
G1 X149.768 Y139.816 E.01007
G1 X114.184 Y104.232 E1.27202
G1 X113.852 Y104.448 E.01002
G1 X149.555 Y140.152 E1.27629
G1 X149.332 Y140.477 E.00997
G1 X113.52 Y104.664 E1.28019
G1 X113.197 Y104.89 E.00995
G1 X149.109 Y140.802 E1.28375
G1 X148.885 Y141.127 E.00996
G1 X112.878 Y105.12 E1.28712
G1 X112.56 Y105.35 E.00993
G1 X148.648 Y141.438 E1.29003
G1 X148.411 Y141.749 E.00989
G1 X112.248 Y105.586 E1.29273
G1 X111.942 Y105.829 E.00986
G1 X148.174 Y142.061 E1.29517
G1 X147.926 Y142.361 E.00984
G1 X111.567 Y106.002 E1.29971
G1 X111.476 Y106.002 E.00231
G1 X109.186 Y104.169 E.07414
G1 X147.676 Y142.659 E1.37587
G1 X147.425 Y142.957 E.00984
G1 X106.44 Y101.971 E1.46509
G1 X103.693 Y99.773 E.08891
G1 X147.167 Y143.247 E1.55403
G1 X146.903 Y143.531 E.00981
G1 X100.947 Y97.575 E1.64276
G1 X99.064 Y96.069 E.06094
G1 X98.976 Y96.153 E.00308
G1 X146.638 Y143.815 E1.70377
G1 X146.37 Y144.095 E.0098
G1 X98.701 Y96.426 E1.70402
G1 X98.427 Y96.7 E.0098
G1 X146.093 Y144.366 E1.7039
G1 X145.815 Y144.637 E.0098
G1 X98.154 Y96.975 E1.70374
G1 X97.886 Y97.256 E.0098
G1 X145.537 Y144.907 E1.70335
G1 X145.246 Y145.164 E.00982
G1 X97.619 Y97.537 E1.70251
G2 X97.355 Y97.822 I5.658 J5.508 E.00981
G1 X144.955 Y145.422 E1.70154
G1 X144.664 Y145.679 E.00982
G1 X97.094 Y98.109 E1.70045
G1 X96.834 Y98.397 E.00981
G1 X144.362 Y145.925 E1.69899
G1 X144.057 Y146.169 E.00986
G1 X96.579 Y98.691 E1.6972
G1 X96.325 Y98.985 E.00983
G1 X143.753 Y146.413 E1.69539
G1 X143.441 Y146.649 E.00989
G1 X96.073 Y99.282 E1.69324
G1 X95.826 Y99.583 E.00985
G1 X143.123 Y146.879 E1.6907
G1 X142.804 Y147.109 E.00993
G1 X95.579 Y99.884 E1.68816
G2 X95.336 Y100.19 I6.08 J5.075 E.00987
G1 X142.483 Y147.336 E1.68533
G1 X142.154 Y147.556 E.00999
G1 X95.096 Y100.498 E1.68217
G2 X94.856 Y100.806 I6.018 J4.932 E.00988
G1 X141.817 Y147.768 E1.67873
G1 X141.478 Y147.977 E.01007
G1 X94.622 Y101.121 E1.67495
G1 X94.389 Y101.436 E.00991
G1 X141.139 Y148.186 E1.67117
G3 X140.794 Y148.389 I-2.943 J-4.611 E.01013
G1 X94.158 Y101.753 E1.66706
G1 X93.932 Y102.075 E.00995
G1 X140.444 Y148.587 E1.66265
G3 X140.083 Y148.775 I-2.718 J-4.786 E.01028
G1 X93.705 Y102.397 E1.65786
G2 X93.484 Y102.725 I6.616 J4.695 E.00999
G1 X139.722 Y148.962 E1.65284
G1 X139.361 Y149.15 E.01028
G1 X104.854 Y114.642 E1.23351
G1 X104.675 Y115.012 E.01037
G1 X138.987 Y149.324 E1.22654
G1 X138.611 Y149.496 E.01046
G1 X104.501 Y115.386 E1.21933
G1 X104.336 Y115.77 E.01056
G1 X138.235 Y149.668 E1.21176
G1 X137.849 Y149.831 E.01058
G1 X104.171 Y116.154 E1.20387
G1 X104.012 Y116.542 E.01062
G1 X137.458 Y149.988 E1.19559
G1 X137.058 Y150.137 E.01078
G1 X103.863 Y116.942 E1.18662
G1 X103.714 Y117.342 E.01078
G1 X136.658 Y150.286 E1.17764
G1 X136.253 Y150.429 E.01086
G1 X103.571 Y117.747 E1.16827
M73 P40 R26
G1 X103.439 Y118.163 E.01104
G1 X135.837 Y150.561 E1.1581
G1 X135.42 Y150.693 E.01104
G1 X103.307 Y118.58 E1.14793
G1 X103.183 Y119.004 E.01117
G1 X134.996 Y150.817 E1.13722
G1 X134.562 Y150.931 E.01134
G1 X103.069 Y119.437 E1.1258
G1 X102.954 Y119.871 E.01134
G1 X134.129 Y151.046 E1.11437
G1 X133.683 Y151.149 E.01155
G1 X102.848 Y120.314 E1.10225
G1 X102.751 Y120.765 E.01166
G1 X133.231 Y151.245 E1.08955
G1 X132.778 Y151.34 E.01169
G1 X102.665 Y121.227 E1.07644
G1 X102.579 Y121.69 E.01189
G1 X132.308 Y151.419 E1.06273
G1 X131.836 Y151.495 E.01209
G1 X102.504 Y122.163 E1.04852
G1 X102.438 Y122.646 E.01232
G1 X131.359 Y151.566 E1.03381
G1 X130.865 Y151.621 E.01255
G1 X102.373 Y123.128 E1.01851
G1 X102.328 Y123.632 E.01278
G1 X130.372 Y151.676 E1.00247
G1 X129.866 Y151.719 E.01282
G1 X102.284 Y124.137 E.98596
G1 X102.252 Y124.652 E.01306
G1 X129.35 Y151.751 E.9687
G1 X128.823 Y151.772 E.01333
G1 X102.232 Y125.181 E.95055
G2 X102.214 Y125.711 I7.191 J.516 E.0134
G1 X128.282 Y151.779 E.93185
G1 X127.74 Y151.786 E.01369
G1 X102.214 Y126.259 E.91248
G2 X102.232 Y126.826 I7.708 J.028 E.01435
G1 X127.174 Y151.768 E.89156
G1 X126.604 Y151.747 E.0144
G1 X102.253 Y127.396 E.87046
G1 X102.295 Y127.986 E.01495
G1 X126.014 Y151.705 E.84788
G1 X125.414 Y151.653 E.01522
G1 X102.347 Y128.586 E.82459
G1 X102.413 Y129.2 E.01563
G1 X124.794 Y151.582 E.80006
G1 X124.16 Y151.496 E.01619
G1 X102.506 Y129.842 E.77405
G1 X102.611 Y130.495 E.01673
G1 X123.502 Y151.386 E.74678
G1 X122.828 Y151.261 E.01732
G1 X102.744 Y131.176 E.71795
G1 X102.891 Y131.872 E.01797
G1 X122.12 Y151.101 E.68738
G1 X121.399 Y150.929 E.01874
G1 X103.081 Y132.61 E.65481
G1 X103.291 Y133.369 E.01988
G1 X120.627 Y150.705 E.61971
G3 X119.825 Y150.451 I2.178 J-8.287 E.02126
G1 X103.545 Y134.171 E.58196
G1 X103.838 Y135.013 E.02253
G1 X118.987 Y150.161 E.54151
G1 X118.073 Y149.796 E.02488
G1 X104.204 Y135.927 E.49578
G2 X104.636 Y136.907 I16.667 J-6.757 E.02708
G1 X117.087 Y149.357 E.44507
G1 X116.688 Y149.175 E.01107
G3 X116.012 Y148.831 I6.679 J-13.972 E.01919
G1 X105.173 Y137.992 E.38746
G1 X105.883 Y139.251 E.03652
G1 X114.749 Y148.117 E.31693
G1 X114.471 Y147.954 E.00815
G1 X113.187 Y147.102 E.03895
G1 X106.9 Y140.816 E.22471
G1 X107.478 Y141.616 E.02493
G1 X108.267 Y142.603 E.03194
G1 X109.106 Y143.552 E.03203
G2 X111.903 Y146.368 I116.201 J-112.629 E.10031
G1 X114.957 Y148.702 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X116.421 Y149.489 E.04504
G3 X114.374 Y151.923 I-5.405 J-2.468 E.08723
G1 X113.234 Y152.759 E.03831
G2 X112.433 Y154.432 I1.345 J1.673 E.05197
G2 X114.867 Y158.613 I5.34 J-.31 E.13603
G1 X116.007 Y159.449 E.03831
G3 X116.808 Y161.121 I-1.345 J1.673 E.05197
G3 X114.374 Y165.303 I-5.34 J-.31 E.13603
G1 X114.356 Y165.316 E.00064
G3 X109.987 Y163.515 I13.963 J-40.062 E.1281
G2 X107.685 Y160.285 I-5.236 J1.297 E.11007
G1 X106.545 Y159.449 E.03831
G3 X105.743 Y157.777 I1.345 J-1.673 E.05197
G3 X108.177 Y153.595 I5.34 J.31 E.13603
G1 X109.317 Y152.759 E.03831
G2 X110.118 Y151.087 I-1.345 J-1.673 E.05197
G2 X107.685 Y146.906 I-5.34 J.31 E.13603
G1 X106.545 Y146.069 E.03831
G3 X105.743 Y144.397 I1.345 J-1.673 E.05197
G3 X106.858 Y141.453 I4.778 J.127 E.08691
G1 X107.158 Y141.858 E.01365
G2 X107.882 Y142.763 I27.566 J-21.317 E.03141
G1 X88.688 Y139.657 F30000
G1 F10826.06
G3 X88.176 Y138.075 I45.852 J-15.729 E.04505
G2 X90.049 Y134.362 I-3.23 J-3.959 E.11606
G1 X89.899 Y133.526 E.02302
G2 X89.247 Y132.69 I-2.01 J.895 E.02902
G3 X87.107 Y131.017 I12.138 J-17.742 E.07366
G1 X86.617 Y130.4 E.02136
G3 X86.385 Y126.093 I41.867 J-4.415 E.11693
G1 X86.475 Y126 E.0035
G2 X88.616 Y124.328 I-12.139 J-17.743 E.07366
G2 X90.049 Y120.983 I-3.561 J-3.505 E.10093
G1 X89.899 Y120.147 E.02302
G2 X89.247 Y119.31 I-2.01 J.895 E.02902
G3 X87.215 Y117.728 I11.478 J-16.842 E.06983
G3 X92.26 Y104.682 I40.798 J8.277 E.38082
G3 X92.513 Y105.095 I-.109 J.351 E.01431
G2 X93.165 Y105.931 I2.01 J-.894 E.02902
G3 X95.306 Y107.603 I-12.14 J17.744 E.07366
G3 X96.739 Y110.948 I-3.561 J3.505 E.10093
G1 X96.589 Y111.784 E.02302
G3 X95.937 Y112.621 I-2.01 J-.894 E.02902
G2 X93.797 Y114.293 I12.142 J17.747 E.07366
G2 X92.363 Y117.638 I3.561 J3.505 E.10093
G1 X92.513 Y118.474 E.02302
G2 X93.165 Y119.31 I2.01 J-.894 E.02902
G3 X95.306 Y120.983 I-12.14 J17.744 E.07366
G3 X96.739 Y124.328 I-3.561 J3.505 E.10093
G1 X96.589 Y125.164 E.02302
G3 X95.937 Y126 I-2.01 J-.894 E.02902
G2 X93.797 Y127.673 I12.142 J17.747 E.07366
G2 X92.363 Y131.017 I3.561 J3.505 E.10093
G1 X92.513 Y131.854 E.02302
G2 X93.165 Y132.69 I2.01 J-.894 E.02902
G3 X95.306 Y134.362 I-12.14 J17.744 E.07366
G3 X96.739 Y137.707 I-3.561 J3.505 E.10093
G1 X96.589 Y138.543 E.02302
G3 X95.937 Y139.38 I-2.01 J-.894 E.02902
G2 X93.797 Y141.052 I12.142 J17.747 E.07366
G2 X92.363 Y144.397 I3.561 J3.505 E.10093
G1 X92.513 Y145.233 E.02302
G2 X93.165 Y146.069 I2.01 J-.894 E.02902
G3 X95.306 Y147.742 I-12.14 J17.744 E.07366
G3 X96.739 Y151.087 I-3.561 J3.505 E.10093
G1 X96.589 Y151.923 E.02302
G3 X96.04 Y152.654 I-1.747 J-.741 E.02503
G3 X95.001 Y151.356 I25.945 J-21.836 E.04505
G1 X100.762 Y157.463 F30000
G1 F10826.06
G3 X99.527 Y156.351 I29.772 J-34.317 E.04505
G3 X99.053 Y154.432 I4.902 J-2.227 E.05386
G3 X99.855 Y152.759 I2.146 J.001 E.05197
G1 X100.995 Y151.923 E.03831
G2 X103.429 Y147.742 I-2.906 J-4.491 E.13603
G2 X102.627 Y146.069 I-2.146 J0 E.05197
G1 X101.487 Y145.233 E.03831
G3 X99.053 Y141.052 I2.906 J-4.491 E.13603
G3 X99.855 Y139.38 I2.146 J.001 E.05197
G2 X101.996 Y137.707 I-12.139 J-17.743 E.07366
G2 X103.368 Y134.89 I-3.471 J-3.434 E.08645
G3 X102.71 Y132.775 I28.63 J-10.064 E.06001
G1 X101.487 Y131.854 E.0415
G3 X99.053 Y127.673 I2.906 J-4.491 E.13603
G3 X99.855 Y126 I2.146 J.001 E.05197
G2 X101.858 Y124.442 I-11.302 J-16.602 E.06881
G3 X102.379 Y120.575 I29.084 J1.947 E.10583
G1 X102.675 Y119.359 E.03389
G1 X101.487 Y118.474 E.04014
G3 X99.403 Y115.965 I3.397 J-4.943 E.08951
G3 X99.203 Y113.457 I3.73 J-1.559 E.06934
G1 X99.447 Y113.039 E.01312
G3 X101.063 Y111.728 I10.46 J11.237 E.05641
G1 X99.765 Y110.689 E.04505
G1 X103.994 Y113.783 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422076
G1 F11605.716
G1 X93.265 Y103.053 E.38356
G2 X93.047 Y103.384 I6.633 J4.608 E.01001
G1 X100.135 Y110.472 E.25338
G1 X97.389 Y108.274 E.08891
G1 X92.834 Y103.72 E.1628
G1 X92.622 Y104.055 E.01005
G1 X95.756 Y107.189 E.11203
G1 X100.494 Y96.7 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X101.792 Y97.738 E.04505
G1 X101.996 Y97.569 E.00718
G2 X103.429 Y94.224 I-3.561 J-3.505 E.10093
G1 X103.279 Y93.387 E.02302
G2 X102.885 Y92.816 I-1.348 J.508 E.019
G3 X105.748 Y90.834 I34.523 J46.818 E.09438
G1 X105.893 Y91.715 E.02419
G2 X106.545 Y92.551 I2.01 J-.894 E.02902
G3 X108.685 Y94.224 I-12.14 J17.744 E.07366
G3 X110.118 Y97.569 I-3.561 J3.505 E.10093
G1 X109.969 Y98.405 E.02302
G3 X109.317 Y99.241 I-2.01 J-.894 E.02902
G2 X107.176 Y100.913 I12.142 J17.747 E.07366
G1 X106.626 Y101.607 E.02399
G1 X107.924 Y102.646 E.04505
G1 X114.013 Y86.806 F30000
G1 F10826.06
G2 X112.458 Y87.394 I16.991 J47.284 E.04505
G2 X113.866 Y90.879 I5.019 J-.001 E.10438
G2 X116.007 Y92.551 I14.279 J-16.069 E.07366
G3 X116.658 Y93.387 I-1.358 J1.731 E.02902
G1 X116.808 Y94.224 E.02302
G3 X115.375 Y97.569 I-4.994 J-.16 E.10093
G3 X113.234 Y99.241 I-14.28 J-16.071 E.07366
G2 X112.583 Y100.077 I1.358 J1.731 E.02902
G1 X112.433 Y100.913 E.02302
G2 X113.71 Y104.062 I4.853 J-.135 E.09407
G3 X120.582 Y100.891 I14.297 J21.952 E.2058
G3 X122.696 Y99.241 I14.093 J15.875 E.07271
G2 X123.348 Y98.405 I-1.358 J-1.731 E.02902
G1 X123.498 Y97.569 E.02302
G2 X122.065 Y94.224 I-4.994 J.16 E.10093
G2 X119.924 Y92.551 I-14.281 J16.072 E.07366
G3 X119.272 Y91.715 I1.358 J-1.731 E.02902
G1 X119.123 Y90.879 E.02302
G3 X120.556 Y87.534 I4.994 J.16 E.10093
G3 X122.696 Y85.861 I14.283 J16.075 E.07366
G2 X123.418 Y84.635 I-1.126 J-1.488 E.03956
G3 X128.507 Y84.396 I4.432 J40.093 E.13813
G3 X126.614 Y85.861 I-12.519 J-14.216 E.0649
G2 X125.962 Y86.698 I1.358 J1.731 E.02902
G1 X125.812 Y87.534 E.02302
G2 X127.246 Y90.879 I4.994 J-.16 E.10093
G2 X129.386 Y92.551 I14.279 J-16.069 E.07366
G3 X130.038 Y93.387 I-1.358 J1.731 E.02902
G1 X130.188 Y94.224 E.02302
G3 X128.755 Y97.569 I-4.994 J-.16 E.10093
G3 X126.614 Y99.241 I-14.28 J-16.071 E.07366
G2 X126.073 Y99.888 I1.032 J1.413 E.02308
G3 X134.056 Y100.521 I1.953 J26.029 E.21787
G1 X134.321 Y100.591 E.00743
G3 X136.076 Y99.241 I11.54 J13.185 E.06002
G2 X136.728 Y98.405 I-1.358 J-1.731 E.02902
G1 X136.878 Y97.569 E.02302
G2 X135.444 Y94.224 I-4.994 J.16 E.10093
G2 X133.304 Y92.551 I-14.281 J16.072 E.07366
G3 X132.652 Y91.715 I1.358 J-1.731 E.02902
G1 X132.502 Y90.879 E.02302
G3 X133.935 Y87.534 I4.994 J.16 E.10093
G3 X136.076 Y85.861 I14.283 J16.075 E.07366
G2 X136.581 Y85.277 I-.925 J-1.309 E.02114
G3 X139.776 Y86.085 I-9.251 J43.299 E.08933
G2 X139.342 Y86.698 I1.017 J1.181 E.02055
G1 X139.192 Y87.534 E.02302
G2 X140.625 Y90.879 I4.994 J-.16 E.10093
G2 X142.766 Y92.551 I14.279 J-16.069 E.07366
G3 X143.418 Y93.387 I-1.358 J1.731 E.02902
G1 X143.567 Y94.224 E.02302
G3 X142.134 Y97.569 I-4.994 J-.16 E.10093
G3 X139.994 Y99.241 I-14.28 J-16.071 E.07366
G2 X139.342 Y100.077 I1.358 J1.731 E.02902
G2 X139.508 Y102.475 I3.816 J.94 E.0662
G3 X149.955 Y111.722 I-11.649 J23.686 E.38259
G1 X150.052 Y111.88 E.005
G1 X150.257 Y110.948 E.02585
G2 X148.824 Y107.603 I-4.994 J.16 E.10093
G2 X146.683 Y105.931 I-14.281 J16.072 E.07366
G3 X146.032 Y105.095 I1.358 J-1.731 E.02902
G1 X145.882 Y104.258 E.02302
G3 X147.315 Y100.913 I4.994 J.16 E.10093
G3 X149.455 Y99.241 I14.283 J16.075 E.07366
G2 X150.107 Y98.405 I-1.358 J-1.731 E.02902
G1 X150.257 Y97.569 E.02302
G2 X148.824 Y94.224 I-4.994 J.16 E.10093
G2 X146.683 Y92.551 I-14.281 J16.072 E.07366
G3 X146.032 Y91.715 I1.358 J-1.731 E.02902
G3 X146.48 Y88.712 I3.913 J-.951 E.08435
G3 X147.955 Y89.479 I-14.892 J30.44 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X146.48 Y88.712 E-.63176
G1 X146.328 Y89.014 E-.12824
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/58
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.56 I-1.184 J-.282 P1  F30000
G1 X127.486 Y167.968 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X119.307 Y84.937 I.504 J-41.968 E3.32227
G3 X129.295 Y84.049 I8.676 J40.971 E.27239
G3 X127.546 Y167.969 I-1.305 J41.951 E3.54961
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X119.22 Y84.53 I.509 J-42.385 E3.35522
G3 X129.306 Y83.633 I8.762 J41.376 E.27502
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.386 I-1.316 J42.367 E3.58491
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.786 E.00002
G3 X119.137 Y84.138 I.514 J-42.785 E3.14248
G3 X129.316 Y83.233 I8.844 J41.766 E.25752
G3 X128.525 Y168.786 I-1.326 J42.768 E3.33282
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.786 E-.02287
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.33783
; WIPE_END
G1 E-.04 F1800
G1 X119.9 Y166.819 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X121.537 Y167.112 I9.121 J-46.316 E.04505
G3 X123.003 Y166.139 I29.057 J42.2 E.04767
G2 X123.608 Y165.303 I-.974 J-1.341 E.02844
G1 X123.666 Y164.466 E.02271
G2 X122.001 Y161.121 I-5.436 J.618 E.10332
G2 X119.618 Y159.449 I-12.916 J15.871 E.07896
G3 X119.013 Y158.613 I.974 J-1.341 E.02844
G1 X118.955 Y157.777 E.02271
G3 X120.62 Y154.432 I5.436 J.618 E.10332
G3 X123.003 Y152.759 I12.918 J15.874 E.07896
G2 X123.615 Y151.815 I-.999 J-1.319 E.03112
G2 X127.201 Y152.17 I4.144 J-23.589 E.09772
G1 X126.308 Y152.759 E.029
G2 X125.703 Y153.595 I.974 J1.341 E.02844
G1 X125.645 Y154.432 E.02271
G2 X127.309 Y157.777 I5.436 J-.618 E.10332
G2 X129.693 Y159.449 I12.918 J-15.874 E.07896
G3 X130.298 Y160.285 I-.974 J1.341 E.02844
G1 X130.356 Y161.121 E.02271
G3 X128.691 Y164.466 I-5.436 J-.618 E.10332
G3 X126.308 Y166.139 I-12.919 J-15.876 E.07896
G2 X125.663 Y167.55 I.972 J1.297 E.04385
G2 X135.063 Y167.011 I2.24 J-43.158 E.25564
G3 X136.382 Y166.139 I26.138 J38.101 E.04286
G2 X136.987 Y165.303 I-.974 J-1.341 E.02844
G1 X137.045 Y164.466 E.02271
G2 X135.381 Y161.121 I-5.435 J.618 E.10332
G2 X132.997 Y159.449 I-12.917 J15.873 E.07896
G3 X132.392 Y158.613 I.974 J-1.341 E.02844
G1 X132.334 Y157.777 E.02271
G3 X133.999 Y154.432 I5.436 J.618 E.10332
G3 X136.382 Y152.759 I12.918 J15.874 E.07896
G1 X136.785 Y152.341 E.01573
G2 X136.952 Y150.604 I-1.996 J-1.068 E.04854
G3 X135.374 Y151.128 I-6.159 J-15.922 E.04506
G1 X144.143 Y146.323 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421766
G1 F11615.001
G1 X146.474 Y143.992 E.08325
G2 X149.094 Y140.824 I-19.538 J-18.827 E.10394
G1 X142.821 Y147.097 E.22408
G3 X141.257 Y148.113 I-12.077 J-16.882 E.0471
M73 P41 R26
G1 X150.113 Y139.258 E.31629
G1 X150.281 Y138.985 E.00808
G1 X150.823 Y137.999 E.02843
G1 X140.009 Y148.813 E.38625
G3 X138.92 Y149.354 I-6.049 J-10.804 E.03074
G1 X151.36 Y136.915 E.44433
G2 X151.79 Y135.937 I-9.756 J-4.872 E.02699
G1 X137.928 Y149.799 E.49512
G3 X137.032 Y150.147 I-5.173 J-11.989 E.02428
G1 X152.159 Y135.02 E.54031
G1 X152.449 Y134.182 E.02238
G1 X136.178 Y150.452 E.58114
G1 X135.376 Y150.707 E.02125
G1 X152.702 Y133.38 E.61885
G1 X152.926 Y132.609 E.02029
G1 X134.618 Y150.917 E.65392
G1 X133.88 Y151.107 E.01926
G1 X153.099 Y131.888 E.68648
G1 X153.259 Y131.18 E.01833
G1 X133.185 Y151.254 E.71702
G1 X132.504 Y151.387 E.01753
G1 X153.384 Y130.507 E.74582
G1 X153.494 Y129.849 E.01685
G1 X131.851 Y151.493 E.77307
G1 X131.213 Y151.582 E.01626
G1 X153.581 Y129.215 E.79892
G1 X153.653 Y128.595 E.01576
G1 X130.597 Y151.651 E.8235
G1 X129.99 Y151.71 E.0154
G1 X153.704 Y127.995 E.84702
G1 X153.746 Y127.405 E.01494
G1 X129.403 Y151.749 E.86949
G1 X128.831 Y151.772 E.01445
G1 X153.767 Y126.837 E.89066
G1 X153.786 Y126.27 E.01432
G1 X128.277 Y151.779 E.91114
G1 X127.722 Y151.786 E.01401
G1 X153.779 Y125.729 E.93071
G1 X153.772 Y125.188 E.01367
G1 X127.192 Y151.768 E.94941
G1 X126.663 Y151.749 E.01336
G1 X153.747 Y124.665 E.96738
G1 X153.715 Y124.149 E.01306
G1 X126.148 Y151.716 E.98466
G1 X125.643 Y151.673 E.01279
G1 X153.677 Y123.64 E1.0013
G1 X153.622 Y123.146 E.01253
G1 X125.14 Y151.629 E1.01734
G1 X124.657 Y151.563 E.0123
G1 X153.567 Y122.653 E1.03261
G1 X153.497 Y122.176 E.01218
G1 X124.175 Y151.498 E1.04732
G1 X123.701 Y151.423 E.0121
G1 X153.421 Y121.704 E1.06151
G1 X153.343 Y121.234 E.01204
G1 X123.24 Y151.337 E1.07524
G1 X122.778 Y151.251 E.01187
G1 X153.247 Y120.782 E1.08832
G1 X153.151 Y120.329 E.01167
G1 X122.33 Y151.151 E1.10089
G1 X121.887 Y151.046 E.01149
G1 X153.049 Y119.884 E1.11304
G1 X152.935 Y119.45 E.01133
G1 X121.444 Y150.941 E1.12477
G1 X121.019 Y150.818 E.01118
G1 X152.82 Y119.017 E1.13589
G1 X152.697 Y118.593 E.01116
G1 X120.594 Y150.695 E1.14664
G1 X120.171 Y150.57 E.01114
G1 X152.565 Y118.177 E1.15704
G1 X152.433 Y117.76 E.01102
G1 X119.764 Y150.43 E1.16689
G1 X119.356 Y150.29 E.01089
G1 X152.291 Y117.355 E1.17636
G1 X152.142 Y116.956 E.01076
G1 X118.951 Y150.147 E1.18553
G1 X118.56 Y149.99 E.01065
G1 X151.994 Y116.556 E1.1942
G1 X151.834 Y116.167 E.01061
G1 X118.168 Y149.834 E1.2025
G1 X117.779 Y149.675 E.01061
G1 X151.67 Y115.784 E1.21052
G1 X151.506 Y115.4 E.01054
G1 X117.403 Y149.503 E1.21807
G1 X117.028 Y149.33 E.01044
G1 X151.332 Y115.027 E1.22527
G1 X151.152 Y114.658 E.01035
G1 X116.653 Y149.157 E1.23223
G1 X116.289 Y148.974 E.01031
G1 X150.972 Y114.29 E1.23883
G1 X150.784 Y113.93 E.01026
G1 X115.928 Y148.786 E1.245
G1 X115.571 Y148.595 E.01023
G1 X150.59 Y113.577 E1.2508
G1 X150.395 Y113.223 E.01019
G1 X115.225 Y148.394 E1.25622
G1 X114.879 Y148.192 E.01012
G1 X150.195 Y112.876 E1.26143
G1 X149.986 Y112.537 E.01006
G1 X114.532 Y147.99 E1.26633
G1 X114.198 Y147.777 E.01002
G1 X149.777 Y112.198 E1.27082
G1 X149.565 Y111.862 E.01003
G1 X113.866 Y147.561 E1.2751
G1 X113.534 Y147.345 E.01
G1 X149.342 Y111.537 E1.27899
G1 X149.119 Y111.212 E.00995
G1 X113.211 Y147.12 E1.28257
G1 X112.893 Y146.89 E.00991
G1 X148.896 Y110.887 E1.28596
G1 X148.659 Y110.576 E.00988
G1 X112.575 Y146.661 E1.28886
M73 P41 R25
G1 X112.261 Y146.426 E.00989
G1 X148.422 Y110.265 E1.29162
G1 X148.186 Y109.954 E.00988
G1 X111.953 Y146.186 E1.29415
G3 X111.653 Y145.938 I3.227 J-4.205 E.00983
G1 X147.938 Y109.653 E1.29603
G1 X147.688 Y109.356 E.00982
G1 X111.356 Y145.688 E1.29771
G1 X111.058 Y145.437 E.00982
G1 X147.437 Y109.058 E1.2994
G2 X147.18 Y108.768 I-3.084 J2.474 E.00981
G1 X110.768 Y145.18 E1.30057
G1 X110.484 Y144.916 E.00979
G1 X146.916 Y108.484 E1.30129
G1 X146.652 Y108.2 E.00979
G1 X110.2 Y144.652 E1.30202
G1 X109.919 Y144.385 E.00979
G1 X146.385 Y107.919 E1.30248
G1 X146.108 Y107.649 E.00979
G1 X109.649 Y144.108 E1.30224
G1 X109.378 Y143.83 E.00979
G1 X145.83 Y107.378 E1.302
G1 X145.553 Y107.107 E.00979
G1 X109.107 Y143.553 E1.30176
G1 X108.85 Y143.262 E.0098
G1 X145.262 Y106.85 E1.30057
G1 X144.971 Y106.593 E.0098
G1 X108.593 Y142.971 E1.29936
G1 X108.336 Y142.681 E.0098
G1 X144.681 Y106.336 E1.29816
G1 X144.38 Y106.089 E.00983
G1 X108.089 Y142.38 E1.29625
G1 X107.845 Y142.076 E.00984
G1 X144.076 Y105.845 E1.29408
G1 X143.771 Y105.602 E.00985
G1 X107.602 Y141.771 E1.29191
G1 X107.363 Y141.462 E.00987
G1 X143.46 Y105.365 E1.28932
G1 X143.142 Y105.135 E.00991
G1 X107.13 Y141.147 E1.2863
G1 X106.905 Y140.824 E.00994
G1 X142.824 Y104.905 E1.28295
G1 X142.503 Y104.679 E.00993
G1 X106.683 Y140.499 E1.27942
G1 X106.46 Y140.174 E.00995
G1 X142.171 Y104.463 E1.27553
G1 X141.839 Y104.247 E.01
G1 X106.246 Y139.84 E1.2713
G1 X106.037 Y139.501 E.01006
G1 X141.506 Y104.032 E1.26688
G1 X141.16 Y103.83 E.01012
G1 X105.828 Y139.162 E1.26197
G1 X105.626 Y138.816 E.01012
G1 X140.813 Y103.628 E1.25682
G1 X140.467 Y103.427 E.01012
G1 X105.432 Y138.462 E1.25141
G1 X105.237 Y138.109 E.01019
G1 X140.108 Y103.238 E1.24552
G1 X139.747 Y103.051 E.01026
G1 X105.048 Y137.75 E1.2394
G1 X104.868 Y137.382 E.01035
G1 X139.386 Y102.864 E1.23293
G1 X139.017 Y102.685 E.01036
G1 X104.688 Y137.014 E1.22615
G1 X104.511 Y136.643 E.01038
G1 X138.642 Y102.512 E1.21907
G1 X138.258 Y102.348 E.01054
G1 X104.343 Y136.263 E1.21139
G3 X104.183 Y135.875 I5.202 J-2.368 E.0106
G1 X137.875 Y102.184 E1.20339
G2 X137.488 Y102.023 I-1.833 J3.863 E.01059
G1 X104.027 Y135.484 E1.19516
G1 X103.87 Y135.092 E.01065
G1 X137.088 Y101.874 E1.18648
G1 X136.689 Y101.726 E.01076
G1 X103.723 Y134.692 E1.17749
G1 X103.581 Y134.285 E.01087
G1 X136.285 Y101.581 E1.16812
G1 X135.869 Y101.45 E.01102
G1 X103.45 Y133.869 E1.15797
G1 X103.318 Y133.453 E.01102
G1 X135.453 Y101.318 E1.14781
G1 X135.031 Y101.192 E.01113
G1 X103.192 Y133.031 E1.13722
G1 X103.078 Y132.597 E.01133
G1 X134.597 Y101.078 E1.12582
G1 X134.164 Y100.964 E.01133
G1 X102.964 Y132.164 E1.11441
G1 X102.859 Y131.72 E.01151
G1 X133.72 Y100.859 E1.10231
G1 X133.268 Y100.763 E.01167
G1 X102.763 Y131.268 E1.08957
G1 X102.668 Y130.816 E.01167
G1 X132.816 Y100.668 E1.07684
G2 X132.348 Y100.588 I-1.049 J4.719 E.01199
G1 X102.587 Y130.348 E1.063
G1 X102.512 Y129.876 E.01207
G1 X131.876 Y100.512 E1.04885
G1 X131.401 Y100.439 E.01214
G1 X102.438 Y129.402 E1.03452
G1 X102.378 Y128.914 E.01241
G1 X130.908 Y100.384 E1.01905
G1 X130.415 Y100.329 E.01253
G1 X102.332 Y128.412 E1.00308
G1 X102.288 Y127.908 E.01279
G1 X129.912 Y100.285 E.98665
G2 X129.395 Y100.253 I-.682 J6.982 E.01308
G1 X102.253 Y127.395 E.96945
G1 X102.234 Y126.866 E.01336
G1 X128.866 Y100.234 E.95127
G1 X128.338 Y100.214 E.01336
G1 X102.214 Y126.338 E.93309
G3 X102.214 Y125.791 I7.422 J-.284 E.01382
G1 X127.784 Y100.22 E.91334
G1 X127.23 Y100.227 E.01401
G1 X102.23 Y125.226 E.89292
G1 X102.251 Y124.657 E.01438
G1 X126.655 Y100.253 E.87166
G1 X126.071 Y100.289 E.01477
G1 X102.29 Y124.071 E.84942
G1 X102.342 Y123.471 E.0152
G1 X125.471 Y100.342 E.82613
G1 X124.855 Y100.41 E.01566
G1 X102.41 Y122.855 E.80169
M73 P42 R25
G1 X102.496 Y122.221 E.01616
G1 X124.221 Y100.496 E.77598
G1 X123.568 Y100.601 E.0167
G1 X102.602 Y121.567 E.74889
G1 X102.727 Y120.894 E.0173
G1 X122.892 Y100.729 E.72025
G1 X122.197 Y100.877 E.01794
G1 X102.874 Y120.199 E.69017
G3 X103.062 Y119.464 I10.057 J2.175 E.01918
G1 X121.474 Y101.052 E.65764
G2 X120.705 Y101.273 I2.621 J10.56 E.02022
G1 X103.266 Y118.712 E.62289
G1 X103.52 Y117.91 E.02125
G1 X119.91 Y101.52 E.58543
G1 X119.075 Y101.807 E.02231
G1 X103.818 Y117.064 E.54495
G3 X104.165 Y116.169 I9.284 J3.087 E.02426
G1 X118.167 Y102.167 E.50014
G1 X117.191 Y102.594 E.02691
G1 X104.582 Y115.204 E.4504
G1 X104.922 Y114.502 E.01972
G1 X104.888 Y114.35 E.00392
G1 X116.116 Y103.122 E.40106
G2 X114.887 Y103.803 I6.319 J12.852 E.0355
G1 X104.625 Y114.065 E.36656
G1 X104.32 Y113.822 E.00985
G1 X113.397 Y104.745 E.3242
G2 X111.724 Y106.002 I12.733 J18.682 E.05287
G1 X111.592 Y106.002 E.00334
G1 X104.016 Y113.578 E.2706
G1 X103.712 Y113.335 E.00985
G1 X111.236 Y105.81 E.26876
G1 X110.932 Y105.567 E.00985
G1 X103.407 Y113.091 E.26876
G1 X103.103 Y112.847 E.00985
G1 X110.628 Y105.323 E.26876
G1 X110.323 Y105.079 E.00984
G1 X102.799 Y112.604 E.26876
G1 X102.494 Y112.36 E.00985
G1 X110.019 Y104.836 E.26876
G1 X109.715 Y104.592 E.00985
G1 X102.19 Y112.117 E.26876
G1 X101.886 Y111.873 E.00985
G1 X109.41 Y104.349 E.26876
G1 X109.106 Y104.105 E.00985
G1 X101.581 Y111.63 E.26876
G1 X101.277 Y111.386 E.00985
G1 X108.802 Y103.862 E.26876
G1 X108.497 Y103.618 E.00985
G1 X100.973 Y111.142 E.26876
G1 X100.668 Y110.899 E.00985
G1 X108.193 Y103.374 E.26876
G1 X107.889 Y103.131 E.00985
G1 X100.364 Y110.655 E.26876
G1 X100.06 Y110.412 E.00985
G1 X107.584 Y102.887 E.26876
G1 X107.28 Y102.644 E.00985
G1 X99.755 Y110.168 E.26876
G1 X99.451 Y109.925 E.00985
G1 X106.976 Y102.4 E.26876
G1 X106.671 Y102.157 E.00985
G1 X99.147 Y109.681 E.26876
G1 X98.842 Y109.437 E.00985
G1 X106.367 Y101.913 E.26876
G1 X106.062 Y101.669 E.00985
G1 X98.538 Y109.194 E.26876
G1 X98.234 Y108.95 E.00985
G1 X105.758 Y101.426 E.26876
G1 X105.454 Y101.182 E.00985
G1 X97.929 Y108.707 E.26876
G1 X97.625 Y108.463 E.00985
G1 X105.149 Y100.939 E.26876
G1 X104.845 Y100.695 E.00985
G1 X97.321 Y108.22 E.26876
G1 X97.016 Y107.976 E.00985
G1 X104.541 Y100.452 E.26876
G1 X104.236 Y100.208 E.00985
G1 X96.712 Y107.732 E.26876
G1 X96.408 Y107.489 E.00985
G1 X103.932 Y99.964 E.26876
G1 X103.628 Y99.721 E.00984
G1 X96.103 Y107.245 E.26876
G1 X95.799 Y107.002 E.00985
G1 X103.323 Y99.477 E.26876
G1 X103.019 Y99.234 E.00984
G1 X95.495 Y106.758 E.26876
G1 X95.19 Y106.515 E.00985
G1 X102.715 Y98.99 E.26876
G1 X102.41 Y98.747 E.00985
G1 X94.886 Y106.271 E.26876
G1 X94.582 Y106.027 E.00985
G1 X102.106 Y98.503 E.26876
G1 X101.802 Y98.259 E.00985
G1 X94.277 Y105.784 E.26876
G1 X93.973 Y105.54 E.00985
G1 X101.497 Y98.016 E.26876
G1 X101.193 Y97.772 E.00985
G1 X93.669 Y105.297 E.26876
G1 X93.364 Y105.053 E.00985
G1 X100.889 Y97.529 E.26876
G1 X100.584 Y97.285 E.00985
G1 X93.06 Y104.81 E.26876
G1 X92.756 Y104.566 E.00985
G1 X100.28 Y97.042 E.26876
G1 X99.976 Y96.798 E.00985
G1 X92.468 Y104.306 E.26816
G3 X93.45 Y102.776 I39.35 J24.179 E.04592
G1 X99.671 Y96.554 E.22221
G1 X99.367 Y96.311 E.00985
G1 X94.809 Y100.869 E.16282
G3 X99.186 Y95.944 I34.221 J26.007 E.16659
G1 X100.46 Y96.673 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X101.759 Y97.712 E.04505
G2 X103.538 Y93.387 I-3.053 J-3.785 E.13218
G2 X103.062 Y92.684 I-1.311 J.376 E.0234
G3 X105.58 Y90.941 I37.881 J52.003 E.083
G1 X105.633 Y91.715 E.02103
G2 X106.238 Y92.551 I1.579 J-.505 E.02844
G3 X108.622 Y94.224 I-10.534 J17.546 E.07896
G3 X110.286 Y97.569 I-3.771 J3.963 E.10332
G1 X110.228 Y98.405 E.02271
G3 X109.623 Y99.241 I-1.579 J-.505 E.02844
G2 X107.24 Y100.913 I10.538 J17.551 E.07896
G1 X106.631 Y101.611 E.02509
G1 X107.929 Y102.65 E.04505
G1 X113.821 Y86.875 F30000
G1 F10826.06
G2 X112.269 Y87.472 I15.016 J41.311 E.04505
G2 X113.93 Y90.879 I5.602 J-.623 E.10473
G2 X116.313 Y92.551 I12.916 J-15.871 E.07896
G3 X116.918 Y93.387 I-.974 J1.341 E.02844
G1 X116.976 Y94.224 E.02271
G3 X115.311 Y97.569 I-5.436 J-.618 E.10332
G3 X112.928 Y99.241 I-12.917 J-15.873 E.07896
G2 X112.323 Y100.077 I.974 J1.341 E.02844
G2 X113.741 Y104.042 I4.701 J.555 E.11825
G3 X120.681 Y100.862 I14.259 J21.959 E.20759
G3 X123.003 Y99.241 I12.987 J16.121 E.07679
G2 X123.608 Y98.405 I-.974 J-1.341 E.02844
G1 X123.666 Y97.569 E.02271
G2 X122.001 Y94.224 I-5.436 J.618 E.10332
G2 X119.618 Y92.551 I-12.918 J15.874 E.07896
G3 X119.013 Y91.715 I.974 J-1.341 E.02844
G1 X118.955 Y90.879 E.02271
G3 X120.62 Y87.534 I5.436 J.618 E.10332
G3 X123.003 Y85.861 I12.92 J15.876 E.07896
G2 X123.636 Y84.614 I-.908 J-1.246 E.03936
G3 X128.441 Y84.395 I4.203 J39.524 E.13041
G3 X126.308 Y85.861 I-14.076 J-18.198 E.07018
G2 X125.703 Y86.698 I.974 J1.341 E.02844
G1 X125.645 Y87.534 E.02271
G2 X127.309 Y90.879 I5.436 J-.618 E.10332
G2 X129.693 Y92.551 I12.916 J-15.871 E.07896
G3 X130.298 Y93.387 I-.974 J1.341 E.02844
G1 X130.356 Y94.224 E.02271
G3 X128.691 Y97.569 I-5.436 J-.618 E.10332
G3 X126.308 Y99.241 I-12.917 J-15.873 E.07896
G2 X125.786 Y99.905 I.753 J1.129 E.02328
G3 X134.056 Y100.521 I2.207 J26.228 E.22567
G1 X134.373 Y100.604 E.00888
G3 X136.382 Y99.241 I17.158 J23.121 E.06581
G2 X136.987 Y98.405 I-.974 J-1.341 E.02844
G1 X137.045 Y97.569 E.02271
G2 X135.381 Y94.224 I-5.436 J.618 E.10332
G2 X132.997 Y92.551 I-12.919 J15.876 E.07896
G3 X132.392 Y91.715 I.974 J-1.341 E.02844
G1 X132.334 Y90.879 E.02271
G3 X133.999 Y87.534 I5.436 J.618 E.10332
G3 X136.382 Y85.861 I12.92 J15.876 E.07896
G2 X136.838 Y85.334 I-.578 J-.96 E.01922
G3 X139.54 Y86.014 I-9.609 J43.818 E.0755
G2 X139.082 Y86.698 I.814 J1.04 E.02266
G1 X139.024 Y87.534 E.02271
G2 X140.689 Y90.879 I5.436 J-.618 E.10332
G2 X143.072 Y92.551 I12.916 J-15.871 E.07896
G3 X143.677 Y93.387 I-.974 J1.341 E.02844
G1 X143.735 Y94.224 E.02271
G3 X142.07 Y97.569 I-5.436 J-.618 E.10332
G3 X139.687 Y99.241 I-12.917 J-15.873 E.07896
G2 X139.082 Y100.077 I.974 J1.341 E.02844
G2 X139.437 Y102.441 I4.41 J.547 E.06557
G3 X150.203 Y112.124 I-11.514 J23.627 E.3975
G1 X150.367 Y111.784 E.01023
G1 X150.425 Y110.948 E.02271
G2 X148.76 Y107.603 I-5.436 J.618 E.10332
G2 X146.377 Y105.931 I-12.919 J15.876 E.07896
G3 X145.772 Y105.095 I.974 J-1.341 E.02844
G1 X145.714 Y104.258 E.02271
G3 X147.379 Y100.913 I5.436 J.618 E.10332
G3 X149.762 Y99.241 I12.92 J15.876 E.07896
G2 X150.367 Y98.405 I-.974 J-1.341 E.02844
G1 X150.425 Y97.569 E.02271
G2 X148.76 Y94.224 I-5.436 J.618 E.10332
G2 X146.377 Y92.551 I-12.919 J15.876 E.07896
G3 X145.772 Y91.715 I.974 J-1.341 E.02844
G3 X146.462 Y88.703 I4.46 J-.563 E.08546
G3 X147.937 Y89.47 I-14.88 J30.438 E.04505
G1 X166.643 Y110.548 F30000
G1 F10826.06
G3 X167.227 Y112.105 I-31.43 J12.67 E.04505
G2 X166.043 Y113.039 I1.491 J3.107 E.04118
G1 X165.841 Y113.457 E.01258
G2 X166.249 Y115.965 I4.581 J.543 E.06977
G2 X168.978 Y118.747 I5.871 J-3.031 E.1072
G3 X169.543 Y123.51 I-48.809 J8.2 E.13002
G3 X167.713 Y125.164 I-5.276 J-3.999 E.06722
G1 X166.446 Y126 E.04113
G2 X165.841 Y126.836 I.974 J1.341 E.02844
G2 X166.249 Y129.345 I4.581 J.543 E.06977
G2 X169.145 Y132.237 I6.076 J-3.189 E.11262
G3 X167.675 Y138.569 I-45.059 J-7.126 E.17629
G1 X166.446 Y139.38 E.03989
G2 X165.841 Y140.216 I.974 J1.341 E.02844
G2 X166.185 Y142.548 I4.376 J.547 E.06467
G3 X162.912 Y148.653 I-38.696 J-16.815 E.18792
G1 X162.869 Y148.578 E.00234
G2 X161.023 Y146.906 I-5.318 J4.015 E.0679
G1 X159.757 Y146.069 E.04113
G3 X159.152 Y145.233 I.974 J-1.341 E.02844
G3 X159.559 Y142.725 I4.581 J-.543 E.06977
G3 X161.875 Y140.216 I5.426 J2.686 E.09379
G1 X163.142 Y139.38 E.04113
G2 X163.747 Y138.543 I-.974 J-1.341 E.02844
G2 X163.339 Y136.035 I-4.581 J-.543 E.06977
G2 X161.023 Y133.526 I-5.426 J2.686 E.09379
G1 X159.757 Y132.69 E.04113
G3 X159.152 Y131.854 I.974 J-1.341 E.02844
G3 X159.559 Y129.345 I4.581 J-.543 E.06977
G3 X161.875 Y126.836 I5.426 J2.686 E.09379
G1 X163.142 Y126 E.04113
G2 X163.747 Y125.164 I-.974 J-1.341 E.02844
G2 X163.339 Y122.655 I-4.581 J-.543 E.06977
G2 X161.023 Y120.147 I-5.426 J2.686 E.09379
G1 X159.757 Y119.31 E.04113
G3 X159.152 Y118.474 I.974 J-1.341 E.02844
G3 X159.559 Y115.965 I4.581 J-.543 E.06977
G3 X161.875 Y113.457 I5.426 J2.686 E.09379
G1 X163.142 Y112.621 E.04113
G2 X163.747 Y111.784 I-.974 J-1.341 E.02844
G2 X163.339 Y109.276 I-4.581 J-.543 E.06977
G2 X161.023 Y106.767 I-5.426 J2.686 E.09379
G1 X159.757 Y105.931 E.04113
G3 X159.152 Y105.095 I.974 J-1.341 E.02844
G3 X159.559 Y102.586 I4.581 J-.543 E.06977
G3 X161.033 Y100.687 I5.569 J2.8 E.06555
G2 X156.671 Y95.837 I-33.217 J25.493 E.17692
G3 X154.333 Y98.405 I-5.461 J-2.624 E.09542
G1 X153.067 Y99.241 E.04113
G2 X152.462 Y100.077 I.974 J1.341 E.02844
G2 X152.869 Y102.586 I4.581 J.543 E.06977
G2 X155.185 Y105.095 I5.426 J-2.686 E.09379
G1 X156.452 Y105.931 E.04113
G3 X157.057 Y106.767 I-.974 J1.341 E.02844
G3 X156.649 Y109.276 I-4.581 J.543 E.06977
G3 X154.333 Y111.784 I-5.426 J-2.686 E.09379
G1 X153.067 Y112.621 E.04113
G2 X152.462 Y113.457 I.974 J1.341 E.02844
G2 X152.869 Y115.965 I4.581 J.543 E.06977
G2 X155.185 Y118.474 I5.426 J-2.686 E.09379
G1 X156.452 Y119.31 E.04113
G3 X157.057 Y120.147 I-.974 J1.341 E.02844
G3 X156.649 Y122.655 I-4.581 J.543 E.06977
G3 X154.174 Y125.269 I-5.586 J-2.81 E.09894
G3 X153.762 Y130.667 I-26.478 J.694 E.14694
G2 X155.185 Y131.854 I4.442 J-3.877 E.05042
G1 X156.452 Y132.69 E.04113
G3 X157.057 Y133.526 I-.974 J1.341 E.02844
G3 X156.649 Y136.035 I-4.581 J.543 E.06977
G3 X154.333 Y138.543 I-5.426 J-2.686 E.09379
G1 X153.067 Y139.38 E.04113
G2 X152.462 Y140.216 I.974 J1.341 E.02844
G2 X152.869 Y142.725 I4.581 J.543 E.06977
G2 X155.185 Y145.233 I5.426 J-2.686 E.09379
G1 X156.452 Y146.069 E.04113
G3 X157.057 Y146.906 I-.974 J1.341 E.02844
G3 X156.649 Y149.414 I-4.581 J.543 E.06977
G3 X154.333 Y151.923 I-5.426 J-2.686 E.09379
G1 X153.067 Y152.759 E.04113
G2 X152.462 Y153.595 I.974 J1.341 E.02844
G2 X152.869 Y156.104 I4.581 J.543 E.06977
G2 X154.472 Y158.11 I5.518 J-2.767 E.07008
G3 X149.306 Y161.747 I-26.489 J-32.134 E.17136
G2 X147.644 Y160.285 I-4.87 J3.862 E.06031
G1 X146.377 Y159.449 E.04113
G3 X145.772 Y158.613 I.974 J-1.341 E.02844
G3 X146.179 Y156.104 I4.581 J-.543 E.06977
G3 X148.495 Y153.595 I5.426 J2.686 E.09379
G1 X149.762 Y152.759 E.04113
G2 X150.367 Y151.923 I-.974 J-1.341 E.02844
G2 X149.96 Y149.414 I-4.581 J-.543 E.06977
G2 X147.644 Y146.906 I-5.426 J2.686 E.09379
G1 X146.377 Y146.069 E.04113
G3 X145.772 Y145.234 I.973 J-1.341 E.02843
G3 X143.682 Y146.97 I-20.527 J-22.593 E.07366
G3 X143.27 Y149.414 I-4.549 J.491 E.06803
G3 X140.954 Y151.923 I-5.426 J-2.686 E.09379
G1 X139.687 Y152.759 E.04113
G2 X139.082 Y153.595 I.974 J1.341 E.02844
G2 X139.49 Y156.104 I4.581 J.543 E.06977
G2 X141.805 Y158.613 I5.426 J-2.686 E.09379
G1 X143.072 Y159.449 E.04113
G3 X143.677 Y160.285 I-.974 J1.341 E.02844
G3 X143.27 Y162.794 I-4.581 J.543 E.06977
G3 X140.954 Y165.303 I-5.426 J-2.686 E.09379
G3 X139.592 Y165.971 I-1.805 J-1.957 E.04169
G1 X138.641 Y166.234 E.02675
G1 X114.993 Y148.723 F30000
G1 F10826.06
G1 X116.458 Y149.508 E.04504
G3 X114.195 Y151.923 I-5.352 J-2.747 E.09086
G1 X112.928 Y152.759 E.04113
G2 X112.323 Y153.595 I.974 J1.341 E.02844
G2 X112.73 Y156.104 I4.581 J.543 E.06977
G2 X115.046 Y158.613 I5.426 J-2.686 E.09379
G1 X116.313 Y159.449 E.04113
G3 X116.918 Y160.285 I-.974 J1.341 E.02844
G3 X116.511 Y162.794 I-4.581 J.543 E.06977
G3 X114.237 Y165.274 I-5.356 J-2.629 E.09243
G3 X110.102 Y163.57 I13.902 J-39.594 E.12123
G2 X107.505 Y160.285 I-5.59 J1.751 E.11603
G1 X106.238 Y159.449 E.04113
G3 X105.633 Y158.613 I.974 J-1.341 E.02844
G3 X106.041 Y156.104 I4.581 J-.543 E.06977
G3 X108.357 Y153.595 I5.426 J2.686 E.09379
G1 X109.623 Y152.759 E.04113
G2 X110.228 Y151.923 I-.974 J-1.341 E.02844
G2 X109.821 Y149.414 I-4.581 J-.543 E.06977
G2 X107.505 Y146.906 I-5.426 J2.686 E.09379
G1 X106.238 Y146.069 E.04113
G3 X105.633 Y145.233 I.974 J-1.341 E.02844
G3 X106.041 Y142.725 I4.581 J-.543 E.06977
G3 X106.873 Y141.473 I3.416 J1.369 E.04101
G1 X107.158 Y141.858 E.01298
G2 X107.897 Y142.782 I28.149 J-21.768 E.03207
G1 X100.678 Y157.39 F30000
G1 F10826.06
G3 X99.446 Y156.274 I28.921 J-33.157 E.04505
G3 X98.943 Y153.595 I3.409 J-2.027 E.07539
G3 X99.548 Y152.759 I1.579 J.505 E.02844
G2 X101.932 Y151.087 I-10.536 J-17.549 E.07896
G2 X103.596 Y147.742 I-3.771 J-3.963 E.10332
G1 X103.538 Y146.906 E.02271
G2 X102.933 Y146.069 I-1.579 J.505 E.02844
G3 X100.55 Y144.397 I10.535 J-17.547 E.07896
G3 X98.886 Y141.052 I3.771 J-3.963 E.10332
G1 X98.943 Y140.216 E.02271
G3 X99.548 Y139.38 I1.579 J.505 E.02844
G2 X101.932 Y137.707 I-10.536 J-17.549 E.07896
G2 X103.45 Y135.119 I-3.508 J-3.797 E.0825
G1 X103.236 Y134.521 E.0172
G3 X102.636 Y132.494 I36.313 J-11.846 E.05731
G3 X100.55 Y131.017 I9.423 J-15.527 E.0693
G3 X98.886 Y127.673 I3.771 J-3.963 E.10332
G1 X98.943 Y126.836 E.02271
G3 X99.548 Y126 I1.579 J.505 E.02844
G2 X101.861 Y124.386 I-10.69 J-17.78 E.07647
G3 X102.724 Y119.172 I26.825 J1.763 E.14344
G3 X100.55 Y117.638 I9.749 J-16.121 E.07216
G3 X98.886 Y114.293 I3.771 J-3.963 E.10332
G1 X98.943 Y113.457 E.02271
G3 X99.548 Y112.621 I1.579 J.505 E.02844
G2 X100.987 Y111.667 I-27.042 J-42.343 E.04676
G1 X92.26 Y104.682 E.30288
G1 X92.229 Y104.734 E.00163
G2 X92.859 Y105.931 I1.525 J-.039 E.03796
G3 X95.242 Y107.603 I-10.534 J17.546 E.07896
G3 X96.907 Y110.948 I-3.771 J3.963 E.10332
G1 X96.849 Y111.784 E.02271
G3 X96.244 Y112.621 I-1.579 J-.505 E.02844
G2 X93.86 Y114.293 I10.538 J17.551 E.07896
G2 X92.196 Y117.638 I3.771 J3.963 E.10332
G1 X92.254 Y118.474 E.02271
G2 X92.859 Y119.31 I1.579 J-.505 E.02844
G3 X95.242 Y120.983 I-10.534 J17.546 E.07896
G3 X96.907 Y124.328 I-3.771 J3.963 E.10332
G1 X96.849 Y125.164 E.02271
G3 X96.244 Y126 I-1.579 J-.505 E.02844
G2 X93.86 Y127.673 I10.536 J17.548 E.07896
G2 X92.196 Y131.017 I3.771 J3.963 E.10332
G1 X92.254 Y131.854 E.02271
G2 X92.859 Y132.69 I1.579 J-.505 E.02844
G3 X95.242 Y134.362 I-10.532 J17.543 E.07896
G3 X96.907 Y137.707 I-3.771 J3.963 E.10332
G1 X96.849 Y138.543 E.02271
G3 X96.244 Y139.38 I-1.579 J-.505 E.02844
G2 X93.86 Y141.052 I10.536 J17.548 E.07896
G2 X92.196 Y144.397 I3.771 J3.963 E.10332
G1 X92.254 Y145.233 E.02271
G2 X92.859 Y146.069 I1.579 J-.505 E.02844
G3 X95.242 Y147.742 I-10.532 J17.543 E.07896
G3 X96.907 Y151.087 I-3.771 J3.963 E.10332
G1 X96.849 Y151.923 E.02271
G3 X96.156 Y152.796 I-2.027 J-.897 E.03052
G3 X88.162 Y138.03 I31.914 J-26.825 E.45814
G2 X90.217 Y134.362 I-3.476 J-4.358 E.1168
G1 X90.159 Y133.526 E.02271
G2 X89.554 Y132.69 I-1.579 J.505 E.02844
G3 X87.171 Y131.017 I10.535 J-17.547 E.07896
G1 X86.615 Y130.381 E.02289
G3 X86.385 Y125.857 I41.846 J-4.397 E.12279
G2 X88.552 Y124.328 I-9.723 J-16.075 E.07194
G2 X90.217 Y120.983 I-3.771 J-3.963 E.10332
G1 X90.159 Y120.147 E.02271
G2 X89.554 Y119.31 I-1.579 J.505 E.02844
G3 X87.224 Y117.682 I10.643 J-17.709 E.07707
G3 X87.589 Y116.06 I43.057 J8.834 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X87.224 Y117.682 E-.63173
G1 X87.485 Y117.897 E-.12827
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/58
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.72 I-.951 J.76 P1  F30000
G1 X127.486 Y167.97 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X118.301 Y85.162 I.504 J-41.969 E3.29438
G3 X129.262 Y84.048 I9.711 J41.056 E.29939
G3 X127.546 Y167.97 I-1.271 J41.953 E3.55058
G1 X127.481 Y168.386 F30000
G1 F9000
G3 X118.205 Y84.758 I.509 J-42.385 E3.32703
G3 X129.272 Y83.632 I9.807 J41.461 E.30229
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.386 I-1.282 J42.368 E3.58583
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.787 E.00001
G3 X118.113 Y84.368 I.515 J-42.786 E3.11608
G3 X129.282 Y83.232 I9.9 J41.852 E.28307
G3 X128.525 Y168.786 I-1.292 J42.769 E3.33369
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.787 E-.02287
G1 X126.425 Y168.761 E-.3993
G1 X125.537 Y168.717 E-.33783
; WIPE_END
G1 E-.04 F1800
G1 X120.044 Y166.848 Z1.88 F30000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X121.682 Y167.133 I8.367 J-43.175 E.04505
G2 X123.41 Y166.139 I-25.345 J-46.051 E.05402
G2 X123.915 Y165.303 I-.628 J-.95 E.02735
G2 X121.374 Y160.703 I-5.722 J.16 E.14792
G3 X119.211 Y159.449 I83.75 J-146.909 E.06775
G3 X118.706 Y158.613 I.628 J-.95 E.02735
G3 X121.247 Y154.014 I5.722 J.16 E.14792
G2 X123.41 Y152.759 I-83.671 J-146.771 E.06775
G2 X123.91 Y151.866 I-.816 J-1.044 E.02848
G2 X126.922 Y152.159 I4.204 J-27.579 E.08203
G2 X125.901 Y152.759 I4.44 J8.727 E.03211
G2 X125.396 Y153.595 I.628 J.95 E.02735
G2 X127.937 Y158.195 I5.722 J-.16 E.14792
G3 X130.1 Y159.449 I-83.763 J146.93 E.06775
G3 X130.604 Y160.285 I-.628 J.95 E.02735
G3 X128.063 Y164.884 I-5.722 J-.16 E.14792
G2 X125.901 Y166.139 I83.683 J146.794 E.06775
G2 X125.439 Y167.539 I.819 J1.046 E.04235
G2 X135.352 Y166.961 I2.535 J-41.814 E.26969
G2 X136.789 Y166.139 I-6.066 J-12.274 E.0449
G2 X137.294 Y165.303 I-.628 J-.95 E.02735
G2 X134.753 Y160.703 I-5.722 J.16 E.14792
G3 X132.59 Y159.449 I83.75 J-146.909 E.06775
G3 X132.085 Y158.613 I.628 J-.95 E.02735
G3 X134.627 Y154.014 I5.722 J.16 E.14792
G2 X136.789 Y152.759 I-83.671 J-146.771 E.06775
G2 X137.294 Y151.923 I-.628 J-.95 E.02735
G2 X137.081 Y150.556 I-3.542 J-.148 E.03773
G3 X135.506 Y151.086 I-6.217 J-15.876 E.04506
G1 X137.915 Y166.417 F30000
G1 F10826.06
G1 X138.607 Y166.244 E.01934
G2 X140.744 Y165.303 I-1.604 J-6.539 E.0636
G2 X143.984 Y160.285 I-2.603 J-5.236 E.16986
G2 X143.479 Y159.449 I-1.133 J.114 E.02735
G2 X142.015 Y158.613 I-7.632 J11.662 E.04571
G3 X138.775 Y153.595 I2.603 J-5.236 E.16986
G3 X139.28 Y152.759 I1.133 J.114 E.02735
G3 X140.744 Y151.923 I7.632 J11.662 E.04571
G2 X143.984 Y146.906 I-2.603 J-5.236 E.16986
G1 X143.944 Y146.773 E.00375
G2 X145.53 Y145.448 I-12.779 J-16.901 E.05602
G1 X145.591 Y145.651 E.00575
G1 X145.97 Y146.069 E.01529
G2 X147.434 Y146.906 I7.633 J-11.663 E.04571
G3 X150.674 Y151.923 I-2.603 J5.236 E.16986
G3 X150.169 Y152.759 I-1.133 J-.114 E.02735
G3 X148.705 Y153.595 I-7.632 J-11.66 E.04571
G2 X145.465 Y158.613 I2.603 J5.236 E.16986
G2 X145.97 Y159.449 I1.133 J-.114 E.02735
G2 X147.434 Y160.285 I7.633 J-11.663 E.04571
G3 X149.301 Y161.75 I-2.888 J5.605 E.0647
G2 X154.524 Y158.067 I-21.338 J-35.804 E.17333
G3 X152.155 Y153.595 I3.331 J-4.628 E.14208
G3 X152.66 Y152.759 I1.133 J.114 E.02735
G3 X154.124 Y151.923 I7.632 J11.662 E.04571
G2 X157.364 Y146.906 I-2.603 J-5.236 E.16986
G2 X156.859 Y146.069 I-1.133 J.114 E.02735
G2 X155.395 Y145.233 I-7.632 J11.662 E.04571
G3 X152.155 Y140.216 I2.603 J-5.236 E.16986
G3 X152.66 Y139.38 I1.133 J.114 E.02735
G3 X154.124 Y138.543 I7.632 J11.662 E.04571
G2 X157.364 Y133.526 I-2.603 J-5.236 E.16986
G2 X156.859 Y132.69 I-1.133 J.114 E.02735
G2 X155.395 Y131.854 I-7.632 J11.662 E.04571
G3 X153.767 Y130.639 I2.726 J-5.35 E.05529
G2 X154.173 Y125.135 I-26.269 J-4.701 E.14983
G2 X157.364 Y120.147 I-2.637 J-5.202 E.16829
G2 X156.859 Y119.31 I-1.133 J.114 E.02735
G2 X155.395 Y118.474 I-7.632 J11.662 E.04571
G3 X152.155 Y113.457 I2.603 J-5.236 E.16986
G3 X152.66 Y112.621 I1.133 J.114 E.02735
G3 X154.124 Y111.784 I7.632 J11.662 E.04571
G2 X157.364 Y106.767 I-2.603 J-5.236 E.16986
G2 X156.859 Y105.931 I-1.133 J.114 E.02735
G2 X155.395 Y105.095 I-7.632 J11.662 E.04571
G3 X152.155 Y100.077 I2.603 J-5.236 E.16986
G3 X152.66 Y99.241 I1.133 J.114 E.02735
G3 X154.124 Y98.405 I7.632 J11.662 E.04571
G2 X156.716 Y95.881 I-2.861 J-5.532 E.09948
G3 X161.067 Y100.731 I-28.957 J30.354 E.17674
G2 X158.845 Y105.095 I3.48 J4.52 E.13716
G2 X159.349 Y105.931 I1.133 J-.114 E.02735
G2 X160.813 Y106.767 I7.633 J-11.663 E.04571
M73 P43 R25
G3 X164.053 Y111.784 I-2.603 J5.236 E.16986
G3 X163.549 Y112.621 I-1.133 J-.114 E.02735
G3 X162.085 Y113.457 I-7.632 J-11.66 E.04571
G2 X158.845 Y118.474 I2.603 J5.236 E.16986
G2 X159.349 Y119.31 I1.133 J-.114 E.02735
G2 X160.813 Y120.147 I7.633 J-11.663 E.04571
G3 X164.053 Y125.164 I-2.603 J5.236 E.16986
G3 X163.549 Y126 I-1.133 J-.114 E.02735
G3 X162.085 Y126.836 I-7.632 J-11.66 E.04571
G2 X158.845 Y131.854 I2.603 J5.236 E.16986
G2 X159.349 Y132.69 I1.133 J-.114 E.02735
G2 X160.813 Y133.526 I7.633 J-11.663 E.04571
G3 X164.053 Y138.543 I-2.603 J5.236 E.16986
G3 X163.549 Y139.38 I-1.133 J-.114 E.02735
G3 X162.085 Y140.216 I-7.632 J-11.66 E.04571
G2 X158.845 Y145.233 I2.603 J5.236 E.16986
G2 X159.349 Y146.069 I1.133 J-.114 E.02735
G2 X160.813 Y146.906 I7.633 J-11.663 E.04571
G3 X162.88 Y148.578 I-3.12 J5.968 E.07251
G1 X162.919 Y148.642 E.00203
G2 X166.148 Y142.63 I-35.34 J-22.856 E.18512
G3 X165.534 Y140.216 I5.276 J-2.627 E.06801
G3 X166.039 Y139.38 I1.133 J.114 E.02735
G3 X167.722 Y138.412 I23.7 J39.289 E.0526
G2 X169.171 Y132.065 I-39.953 J-12.456 E.17659
G3 X165.534 Y126.836 I2.29 J-5.471 E.18217
G3 X166.039 Y126 I1.133 J.114 E.02735
G3 X167.503 Y125.164 I7.632 J11.662 E.04571
G2 X169.543 Y123.519 I-3.087 J-5.916 E.07148
G2 X168.947 Y118.566 I-49.078 J3.397 E.13523
G3 X165.534 Y113.457 I2.405 J-5.3 E.17538
G3 X166.039 Y112.621 I1.133 J.114 E.02735
G3 X167.175 Y111.96 I6.022 J9.04 E.03562
G2 X166.584 Y110.406 I-44.361 J15.97 E.04505
G1 X148.352 Y109.886 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422076
G1 F11605.716
G2 X145.551 Y107.106 I-138.072 J136.288 E.09978
G1 X144.603 Y106.267 E.03199
G1 X143.615 Y105.477 E.03197
G1 X142.818 Y104.901 E.02486
G1 X149.096 Y111.178 E.2244
G1 X149.616 Y111.936 E.02323
G1 X150.114 Y112.745 E.02401
G1 X141.255 Y103.886 E.3167
G1 X140.434 Y103.407 E.02401
G1 X140.006 Y103.185 E.01219
G1 X150.825 Y114.004 E.38674
G1 X151.362 Y115.09 E.03062
G1 X138.905 Y102.633 E.4453
G1 X137.933 Y102.208 E.02682
G1 X151.792 Y116.067 E.49541
G1 X152.148 Y116.973 E.02459
G1 X137.027 Y101.852 E.54052
G2 X136.174 Y101.546 I-3.536 J8.535 E.02294
G1 X152.454 Y117.826 E.58197
G1 X152.708 Y118.629 E.02128
G1 X135.371 Y101.292 E.61975
G1 X134.613 Y101.082 E.01989
G1 X152.918 Y119.387 E.65436
G1 X153.108 Y120.126 E.01928
G1 X133.874 Y100.892 E.68756
G1 X133.178 Y100.744 E.01797
G1 X153.256 Y120.822 E.7177
G1 X153.388 Y121.502 E.01753
G1 X132.497 Y100.611 E.74678
G1 X131.844 Y100.506 E.01673
G1 X153.494 Y122.156 E.77391
G1 X153.583 Y122.794 E.01628
G1 X131.206 Y100.417 E.7999
G1 X130.589 Y100.349 E.01569
G1 X153.651 Y123.411 E.8244
G3 X153.707 Y124.015 I-6.124 J.869 E.01534
G1 X129.982 Y100.29 E.84809
G1 X129.397 Y100.253 E.01481
G1 X153.743 Y124.599 E.87028
G1 X153.772 Y125.177 E.01462
G1 X128.828 Y100.232 E.89167
G1 X128.262 Y100.214 E.01433
G1 X153.779 Y125.732 E.91217
G1 X153.786 Y126.287 E.01403
G1 X127.72 Y100.221 E.93178
G1 X127.178 Y100.228 E.01369
G1 X153.768 Y126.817 E.95049
G1 X153.748 Y127.346 E.01338
G1 X126.656 Y100.253 E.96848
G1 X126.139 Y100.285 E.01308
G1 X153.716 Y127.862 E.98577
G1 X153.672 Y128.367 E.01281
G1 X125.63 Y100.324 E1.00242
G1 X125.136 Y100.379 E.01255
G1 X153.627 Y128.87 E1.01847
G1 X153.562 Y129.353 E.01232
G1 X124.643 Y100.434 E1.03377
G1 X124.165 Y100.505 E.0122
G1 X153.496 Y129.836 E1.04848
G1 X153.421 Y130.309 E.01211
G1 X123.693 Y100.581 E1.06269
G1 X123.223 Y100.659 E.01204
G1 X153.335 Y130.771 E1.07641
G1 X153.249 Y131.234 E.01189
G1 X122.771 Y100.755 E1.08951
G1 X122.318 Y100.851 E.01169
G1 X153.148 Y131.681 E1.10208
G1 X153.043 Y132.124 E.01151
G1 X121.871 Y100.952 E1.1143
G1 X121.432 Y101.062 E.01143
G1 X152.938 Y132.567 E1.12621
G1 X152.815 Y132.993 E.01119
G1 X121.007 Y101.185 E1.13701
G1 X120.582 Y101.308 E.01119
G1 X152.692 Y133.418 E1.1478
G1 X152.566 Y133.841 E.01115
G1 X120.159 Y101.434 E1.15843
G1 X119.751 Y101.574 E.01091
G1 X152.426 Y134.249 E1.168
G1 X152.285 Y134.657 E.01091
G1 X119.343 Y101.715 E1.17757
G2 X118.939 Y101.858 I1.259 J4.195 E.01086
G1 X152.143 Y135.062 E1.18694
G1 X151.99 Y135.458 E.01072
G1 X118.547 Y102.015 E1.19548
G1 X118.155 Y102.171 E.01066
G1 X151.829 Y135.845 E1.20373
G1 X151.665 Y136.229 E.01056
G1 X117.766 Y102.331 E1.21174
G1 X117.39 Y102.503 E.01046
G1 X151.5 Y136.613 E1.21931
G1 X151.325 Y136.986 E.01042
G1 X117.014 Y102.676 E1.22649
G1 X116.64 Y102.85 E.01043
G1 X151.145 Y137.355 E1.23344
G1 X150.965 Y137.723 E.01037
G1 X116.279 Y103.037 E1.23992
G1 X115.918 Y103.225 E.01028
G1 X150.777 Y138.083 E1.24609
G1 X150.582 Y138.437 E.0102
G1 X115.557 Y103.412 E1.25202
G1 X115.211 Y103.614 E.01014
G1 X150.388 Y138.791 E1.25745
G1 X150.186 Y139.138 E.01014
G1 X114.865 Y103.816 E1.26264
G1 X114.518 Y104.018 E.01014
G1 X149.977 Y139.477 E1.26755
G1 X149.768 Y139.816 E.01007
G1 X114.184 Y104.232 E1.27202
G1 X113.852 Y104.448 E.01002
G1 X149.555 Y140.152 E1.27629
G1 X149.332 Y140.477 E.00997
G1 X113.52 Y104.664 E1.28019
G1 X113.197 Y104.89 E.00995
G1 X149.109 Y140.802 E1.28375
G1 X148.885 Y141.127 E.00996
G1 X112.878 Y105.12 E1.28712
G1 X112.56 Y105.35 E.00993
G1 X148.648 Y141.438 E1.29003
G1 X148.411 Y141.749 E.00989
G1 X112.248 Y105.586 E1.29273
G1 X111.942 Y105.829 E.00986
G1 X148.174 Y142.061 E1.29517
G1 X147.926 Y142.361 E.00984
G1 X111.567 Y106.002 E1.29971
G1 X111.476 Y106.002 E.00231
G1 X109.186 Y104.169 E.07414
G1 X147.676 Y142.659 E1.37587
G1 X147.425 Y142.957 E.00984
G1 X106.44 Y101.971 E1.46509
G1 X103.693 Y99.773 E.08891
G1 X147.167 Y143.247 E1.55403
G1 X146.903 Y143.531 E.00981
G1 X100.947 Y97.575 E1.64276
G1 X99.064 Y96.069 E.06094
G1 X98.976 Y96.153 E.00308
G1 X146.638 Y143.815 E1.70377
G1 X146.37 Y144.095 E.0098
G1 X98.701 Y96.426 E1.70402
G1 X98.427 Y96.7 E.0098
G1 X146.093 Y144.366 E1.7039
G1 X145.815 Y144.637 E.0098
G1 X98.154 Y96.975 E1.70374
G1 X97.886 Y97.256 E.0098
G1 X145.537 Y144.907 E1.70335
G1 X145.246 Y145.164 E.00982
G1 X97.619 Y97.537 E1.70251
G2 X97.355 Y97.822 I5.641 J5.492 E.00981
G1 X144.955 Y145.422 E1.70154
G1 X144.664 Y145.679 E.00982
G1 X97.094 Y98.109 E1.70045
G1 X96.834 Y98.397 E.00981
G1 X144.362 Y145.925 E1.69899
G1 X144.057 Y146.169 E.00986
G1 X96.579 Y98.691 E1.6972
G1 X96.325 Y98.985 E.00983
G1 X143.753 Y146.413 E1.69539
G1 X143.441 Y146.649 E.00989
G1 X96.073 Y99.282 E1.69324
G1 X95.826 Y99.583 E.00985
G1 X143.123 Y146.879 E1.6907
G1 X142.804 Y147.109 E.00993
G1 X95.579 Y99.884 E1.68816
G2 X95.336 Y100.19 I6.097 J5.088 E.00987
G1 X142.483 Y147.336 E1.68533
G1 X142.154 Y147.556 E.00999
G1 X95.096 Y100.498 E1.68217
G2 X94.856 Y100.806 I6.142 J5.03 E.00988
G1 X141.817 Y147.768 E1.67873
G1 X141.478 Y147.977 E.01007
G1 X94.622 Y101.121 E1.67495
G1 X94.389 Y101.436 E.00991
G1 X141.139 Y148.186 E1.67117
G3 X140.794 Y148.389 I-2.943 J-4.611 E.01013
G1 X94.158 Y101.753 E1.66706
M73 P43 R24
G1 X93.932 Y102.075 E.00995
G1 X140.444 Y148.587 E1.66265
G3 X140.083 Y148.775 I-2.718 J-4.786 E.01028
G1 X93.705 Y102.397 E1.65786
G2 X93.484 Y102.725 I6.616 J4.695 E.00999
G1 X139.722 Y148.962 E1.65284
G1 X139.361 Y149.15 E.01028
G1 X104.854 Y114.642 E1.23351
G1 X104.675 Y115.012 E.01037
G1 X138.987 Y149.324 E1.22654
G1 X138.611 Y149.496 E.01046
G1 X104.501 Y115.386 E1.21933
G1 X104.336 Y115.77 E.01056
G1 X138.235 Y149.668 E1.21176
G1 X137.849 Y149.831 E.01058
G1 X104.171 Y116.154 E1.20387
G1 X104.012 Y116.542 E.01062
G1 X137.458 Y149.988 E1.19559
G1 X137.058 Y150.137 E.01078
G1 X103.863 Y116.942 E1.18662
G1 X103.714 Y117.342 E.01078
G1 X136.658 Y150.286 E1.17764
G1 X136.253 Y150.429 E.01086
G1 X103.571 Y117.747 E1.16827
G1 X103.439 Y118.163 E.01104
G1 X135.837 Y150.561 E1.1581
G1 X135.42 Y150.693 E.01104
G1 X103.307 Y118.58 E1.14793
G1 X103.183 Y119.004 E.01117
G1 X134.996 Y150.817 E1.13722
G1 X134.562 Y150.931 E.01134
G1 X103.069 Y119.437 E1.1258
G1 X102.954 Y119.871 E.01134
G1 X134.129 Y151.046 E1.11437
G1 X133.683 Y151.149 E.01155
G1 X102.848 Y120.314 E1.10225
G1 X102.751 Y120.765 E.01166
G1 X133.231 Y151.245 E1.08955
G1 X132.778 Y151.34 E.01169
G1 X102.665 Y121.227 E1.07644
G1 X102.579 Y121.69 E.01189
G1 X132.308 Y151.419 E1.06273
G1 X131.836 Y151.495 E.01209
G1 X102.504 Y122.163 E1.04852
G1 X102.438 Y122.646 E.01232
G1 X131.359 Y151.566 E1.03381
G1 X130.865 Y151.621 E.01255
G1 X102.373 Y123.128 E1.01851
G1 X102.328 Y123.632 E.01278
G1 X130.372 Y151.676 E1.00247
G1 X129.866 Y151.719 E.01282
G1 X102.284 Y124.137 E.98596
G1 X102.252 Y124.652 E.01306
G1 X129.35 Y151.751 E.9687
G1 X128.823 Y151.772 E.01333
G1 X102.232 Y125.181 E.95055
G2 X102.214 Y125.711 I7.191 J.516 E.0134
G1 X128.282 Y151.779 E.93185
G1 X127.74 Y151.786 E.01369
G1 X102.214 Y126.259 E.91248
M73 P44 R24
G2 X102.232 Y126.826 I7.708 J.028 E.01435
G1 X127.174 Y151.768 E.89156
G1 X126.604 Y151.747 E.0144
G1 X102.253 Y127.396 E.87046
G1 X102.295 Y127.986 E.01495
G1 X126.014 Y151.705 E.84788
G1 X125.414 Y151.653 E.01522
G1 X102.347 Y128.586 E.82459
G1 X102.413 Y129.2 E.01563
G1 X124.794 Y151.582 E.80006
G1 X124.16 Y151.496 E.01619
G1 X102.506 Y129.842 E.77405
G1 X102.611 Y130.495 E.01673
G1 X123.502 Y151.386 E.74678
G1 X122.828 Y151.261 E.01732
G1 X102.744 Y131.176 E.71795
G1 X102.891 Y131.872 E.01797
G1 X122.12 Y151.101 E.68738
G1 X121.399 Y150.929 E.01874
G1 X103.081 Y132.61 E.65481
G1 X103.291 Y133.369 E.01988
G1 X120.627 Y150.705 E.61971
G3 X119.825 Y150.451 I2.178 J-8.287 E.02126
G1 X103.545 Y134.171 E.58196
G1 X103.838 Y135.013 E.02253
G1 X118.987 Y150.161 E.54151
G1 X118.073 Y149.796 E.02488
G1 X104.204 Y135.927 E.49578
G2 X104.636 Y136.907 I16.667 J-6.757 E.02708
G1 X117.087 Y149.357 E.44507
G1 X116.688 Y149.175 E.01107
G3 X116.012 Y148.831 I6.679 J-13.972 E.01919
G1 X105.173 Y137.992 E.38746
G1 X105.883 Y139.251 E.03652
G1 X114.749 Y148.117 E.31693
G1 X114.471 Y147.954 E.00815
G1 X113.187 Y147.102 E.03895
G1 X106.9 Y140.816 E.22471
G1 X107.478 Y141.616 E.02493
G1 X108.267 Y142.603 E.03194
G1 X109.106 Y143.552 E.03203
G2 X111.903 Y146.368 I116.201 J-112.629 E.10031
G1 X115.033 Y148.746 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X116.5 Y149.529 E.04504
G3 X113.985 Y151.923 I-5.289 J-3.038 E.09541
G2 X112.521 Y152.759 I6.168 J12.498 E.04571
G2 X112.016 Y153.595 I.628 J.95 E.02735
G2 X115.256 Y158.613 I5.843 J-.219 E.16986
G3 X116.72 Y159.449 I-6.168 J12.498 E.04571
G3 X117.225 Y160.285 I-.628 J.95 E.02735
G3 X114.109 Y165.228 I-5.808 J-.208 E.1659
G3 X110.236 Y163.63 I16.951 J-46.571 E.11356
G2 X107.295 Y160.285 I-5.689 J2.037 E.12361
G3 X105.831 Y159.449 I6.169 J-12.499 E.04571
G3 X105.326 Y158.613 I.628 J-.95 E.02735
G3 X108.566 Y153.595 I5.843 J.219 E.16986
G2 X110.03 Y152.759 I-6.168 J-12.497 E.04571
G2 X110.535 Y151.923 I-.628 J-.95 E.02735
G2 X107.295 Y146.906 I-5.843 J.219 E.16986
G3 X105.831 Y146.069 I6.169 J-12.499 E.04571
G3 X105.326 Y145.233 I.628 J-.95 E.02735
G3 X106.884 Y141.488 I5.837 J.231 E.11224
G1 X107.158 Y141.858 E.01248
G2 X107.909 Y142.797 I28.599 J-22.116 E.03258
G1 X104.908 Y160.62 F30000
G1 F10826.06
G3 X103.341 Y159.449 I5.733 J-9.308 E.05309
G3 X99.291 Y156.104 I15.788 J-23.239 E.14254
G3 X98.637 Y153.595 I5.379 J-2.742 E.0708
G3 X99.141 Y152.759 I1.133 J.114 E.02735
G3 X101.304 Y151.505 I85.846 J145.539 E.06775
G2 X103.845 Y146.906 I-3.181 J-4.759 E.14792
G2 X103.341 Y146.069 I-1.133 J.114 E.02735
G2 X101.178 Y144.815 I-85.834 J145.517 E.06775
G3 X98.637 Y140.216 I3.181 J-4.759 E.14792
G3 X99.141 Y139.38 I1.133 J.114 E.02735
G3 X101.304 Y138.125 I85.846 J145.539 E.06775
G2 X103.513 Y135.278 I-3.019 J-4.621 E.09947
G1 X103.236 Y134.521 E.02183
G3 X102.564 Y132.221 I36.589 J-11.934 E.06495
G3 X100.612 Y131.017 I5.429 J-10.994 E.06223
G3 X98.637 Y126.836 I3.987 J-4.441 E.12867
G3 X99.141 Y126 I1.133 J.114 E.02735
G3 X101.304 Y124.746 I86.005 J145.813 E.06775
G1 X101.866 Y124.331 E.01891
G3 X102.779 Y118.965 I26.95 J1.826 E.14774
G3 X100.612 Y117.638 I12.092 J-22.173 E.06889
G3 X98.637 Y113.457 I3.987 J-4.441 E.12867
G3 X99.141 Y112.621 I1.133 J.114 E.02735
G3 X100.908 Y111.604 I30.179 J50.367 E.05523
G1 X92.26 Y104.682 E.30014
G2 X91.97 Y105.172 I9.824 J6.134 E.01542
G2 X92.452 Y105.931 I1.039 J-.128 E.02515
G2 X94.615 Y107.185 I85.754 J-145.381 E.06775
G3 X97.156 Y111.784 I-3.181 J4.759 E.14792
G3 X96.651 Y112.621 I-1.133 J-.114 E.02735
G3 X94.488 Y113.875 I-85.676 J-145.244 E.06775
G2 X91.947 Y118.474 I3.181 J4.759 E.14792
G2 X92.452 Y119.31 I1.133 J-.114 E.02735
G2 X94.615 Y120.565 I85.754 J-145.381 E.06775
G3 X97.156 Y125.164 I-3.181 J4.759 E.14792
G3 X96.651 Y126 I-1.133 J-.114 E.02735
G3 X94.488 Y127.254 I-85.834 J-145.517 E.06775
G2 X91.947 Y131.854 I3.181 J4.759 E.14792
G2 X92.452 Y132.69 I1.133 J-.114 E.02735
G2 X94.615 Y133.944 I85.913 J-145.654 E.06775
G3 X97.156 Y138.543 I-3.181 J4.759 E.14792
G3 X96.651 Y139.38 I-1.133 J-.114 E.02735
G3 X94.488 Y140.634 I-85.834 J-145.517 E.06775
G2 X91.947 Y145.233 I3.181 J4.759 E.14792
G2 X92.452 Y146.069 I1.133 J-.114 E.02735
G2 X94.615 Y147.324 I85.913 J-145.654 E.06775
G3 X97.156 Y151.923 I-3.181 J4.759 E.14792
G3 X96.307 Y152.971 I-1.545 J-.384 E.03773
G3 X88.142 Y137.965 I32.111 J-27.196 E.46614
G2 X90.466 Y133.526 I-3.374 J-4.594 E.14056
G2 X89.961 Y132.69 I-1.133 J.114 E.02735
G2 X87.798 Y131.436 I-85.834 J145.517 E.06775
G3 X86.614 Y130.373 I2.5 J-3.975 E.04331
G3 X86.385 Y125.617 I42.267 J-4.422 E.12908
G2 X88.491 Y124.328 I-11.14 J-20.552 E.06693
G2 X90.466 Y120.147 I-3.987 J-4.441 E.12867
G2 X89.961 Y119.31 I-1.133 J.114 E.02735
G2 X87.798 Y118.056 I-85.993 J145.791 E.06775
G1 X87.233 Y117.638 E.01904
G3 X87.6 Y116.017 I43.385 J8.968 E.04505
G1 X103.994 Y113.783 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422076
G1 F11605.716
G1 X93.265 Y103.053 E.38356
G2 X93.047 Y103.384 I6.633 J4.608 E.01001
G1 X100.135 Y110.472 E.25338
G1 X97.389 Y108.274 E.08891
G1 X92.834 Y103.72 E.1628
G1 X92.622 Y104.055 E.01005
G1 X95.756 Y107.189 E.11203
G1 X100.421 Y96.641 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X101.719 Y97.68 E.04505
G1 X101.87 Y97.569 E.00508
G2 X103.845 Y93.387 I-3.987 J-4.441 E.12867
G2 X103.286 Y92.518 I-1.583 J.403 E.0285
G3 X105.376 Y91.069 I54.823 J76.863 E.0689
G2 X105.831 Y92.551 I1.315 J.407 E.04461
G2 X107.994 Y93.806 I85.754 J-145.381 E.06775
G3 X110.535 Y98.405 I-3.181 J4.759 E.14792
G3 X110.03 Y99.241 I-1.133 J-.114 E.02735
G3 X107.867 Y100.495 I-85.676 J-145.244 E.06775
G2 X106.632 Y101.612 I2.631 J4.152 E.04534
G1 X107.93 Y102.651 E.04505
G1 X113.633 Y86.942 F30000
G1 F10826.06
G2 X112.085 Y87.549 I16.579 J44.591 E.04505
G2 X114.557 Y91.297 I5.862 J-1.178 E.12473
G3 X116.72 Y92.551 I-83.75 J146.909 E.06775
G3 X117.225 Y93.387 I-.628 J.95 E.02735
G3 X114.684 Y97.987 I-5.722 J-.16 E.14792
G2 X112.521 Y99.241 I83.842 J147.068 E.06775
G2 X112.016 Y100.077 I.628 J.95 E.02735
G2 X113.768 Y104.025 I5.854 J-.235 E.11985
G3 X120.795 Y100.83 I14.237 J21.984 E.20994
G3 X123.41 Y99.241 I27.078 J41.631 E.08293
G2 X123.915 Y98.405 I-.628 J-.95 E.02735
G2 X121.374 Y93.806 I-5.722 J.16 E.14792
G3 X119.211 Y92.551 I83.591 J-146.635 E.06775
G3 X118.706 Y91.715 I.628 J-.95 E.02735
G3 X121.247 Y87.116 I5.722 J.16 E.14792
G2 X123.41 Y85.861 I-83.513 J-146.498 E.06775
G2 X123.881 Y84.589 I-.761 J-1.005 E.03881
G3 X128.352 Y84.394 I3.95 J39.142 E.12132
G3 X125.901 Y85.861 I-41.227 J-66.088 E.07742
G2 X125.396 Y86.698 I.628 J.95 E.02735
G2 X127.937 Y91.297 I5.722 J-.16 E.14792
G3 X130.1 Y92.551 I-83.842 J147.068 E.06775
G3 X130.604 Y93.387 I-.628 J.95 E.02735
G3 X128.629 Y97.569 I-5.962 J-.259 E.12867
G3 X126.581 Y98.823 I-7.601 J-10.111 E.06518
G2 X125.522 Y99.659 I.903 J2.233 E.03707
G1 X125.436 Y99.942 E.00802
G3 X134.451 Y100.625 I2.582 J25.776 E.24624
G3 X136.789 Y99.241 I100.233 J166.688 E.07363
G2 X137.294 Y98.405 I-.628 J-.95 E.02735
G2 X134.753 Y93.806 I-5.722 J.16 E.14792
G3 X132.59 Y92.551 I83.591 J-146.635 E.06775
G3 X132.085 Y91.715 I.628 J-.95 E.02735
G3 X134.061 Y87.534 I5.962 J.259 E.12867
G3 X136.109 Y86.28 I7.602 J10.114 E.06518
G2 X137.168 Y85.443 I-.903 J-2.234 E.03707
G3 X139.221 Y85.926 I-2.85 J16.719 E.05719
G2 X138.775 Y86.698 I.589 J.855 E.02495
G2 X141.316 Y91.297 I5.722 J-.16 E.14792
G3 X143.479 Y92.551 I-83.842 J147.068 E.06775
G3 X143.984 Y93.387 I-.628 J.95 E.02735
G3 X141.443 Y97.987 I-5.722 J-.16 E.14792
G2 X139.28 Y99.241 I83.75 J146.909 E.06775
G2 X138.775 Y100.077 I.628 J.95 E.02735
G2 X139.35 Y102.4 I5.763 J-.194 E.06532
G3 X150.371 Y112.398 I-11.416 J23.657 E.40879
G2 X150.674 Y111.784 I-.495 J-.626 E.01916
G2 X148.133 Y107.185 I-5.722 J.16 E.14792
G3 X145.97 Y105.931 I83.591 J-146.635 E.06775
G3 X145.465 Y105.095 I.628 J-.95 E.02735
G3 X148.006 Y100.495 I5.722 J.16 E.14792
G2 X150.169 Y99.241 I-83.513 J-146.498 E.06775
G2 X150.674 Y98.405 I-.628 J-.95 E.02735
G2 X148.133 Y93.806 I-5.722 J.16 E.14792
G3 X145.97 Y92.551 I83.591 J-146.635 E.06775
G3 X145.465 Y91.715 I.628 J-.95 E.02735
G3 X146.439 Y88.692 I5.357 J.057 E.08738
G3 X147.914 Y89.458 I-14.881 J30.469 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X146.439 Y88.692 E-.63176
G1 X146.261 Y88.978 E-.12824
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/58
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.88 I-1.184 J-.281 P1  F30000
G1 X127.486 Y167.97 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X118.301 Y85.162 I.504 J-41.969 E3.29442
G3 X129.228 Y84.047 I9.71 J41.047 E.29848
G3 X127.546 Y167.971 I-1.238 J41.954 E3.55146
G1 X127.481 Y168.384 F30000
G1 F9000
G3 X117.196 Y85.011 I.51 J-42.384 E3.29877
G3 X129.238 Y83.632 I10.786 J40.922 E.32957
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.385 I-1.248 J42.369 E3.58669
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.786 E.00002
G3 X117.094 Y84.623 I.515 J-42.785 E3.08965
G3 X129.248 Y83.231 I10.888 J41.309 E.30863
G3 X128.525 Y168.786 I-1.258 J42.77 E3.33452
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.786 E-.02286
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.33784
; WIPE_END
G1 E-.04 F1800
G1 X133.048 Y167.359 Z2.04 F30000
G1 X134.205 Y167.15 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X137.512 Y166.139 I-.475 J-7.467 E.09456
G1 X137.732 Y165.721 E.0128
G2 X137.433 Y164.466 I-4.394 J.382 E.03506
G2 X134.62 Y160.703 I-6.168 J1.678 E.13038
G2 X131.868 Y159.449 I-29.538 J61.154 E.08195
G1 X131.648 Y159.031 E.0128
G3 X131.946 Y157.777 I4.393 J.382 E.03506
G3 X134.76 Y154.014 I6.168 J1.678 E.13038
G3 X137.512 Y152.759 I29.546 J61.17 E.08195
G1 X137.732 Y152.341 E.0128
G2 X137.214 Y150.507 I-7.921 J1.244 E.05178
G3 X126.561 Y152.146 I-9.186 J-24.26 E.29422
G2 X125.178 Y152.759 I7.169 J18.028 E.04099
G1 X124.958 Y153.177 E.0128
G2 X125.257 Y154.432 I4.394 J-.382 E.03506
G2 X128.07 Y158.195 I6.167 J-1.678 E.13038
G2 X130.822 Y159.449 I29.539 J-61.155 E.08195
G1 X131.042 Y159.867 E.0128
G3 X130.744 Y161.121 I-4.394 J-.382 E.03506
G3 X127.93 Y164.884 I-6.168 J-1.678 E.13038
G3 X125.178 Y166.139 I-29.547 J-61.172 E.08195
G1 X124.958 Y166.557 E.0128
G2 X125.172 Y167.519 I3.364 J-.243 E.02681
G3 X121.848 Y167.158 I4.675 J-58.428 E.09063
G3 X124.132 Y166.139 I75.066 J165.262 E.06778
G1 X124.352 Y165.721 E.0128
G2 X124.054 Y164.466 I-4.394 J.382 E.03506
G2 X121.24 Y160.703 I-6.168 J1.678 E.13038
G2 X118.489 Y159.449 I-29.538 J61.154 E.08195
G1 X118.268 Y159.031 E.0128
G3 X118.567 Y157.777 I4.393 J.382 E.03506
G3 X121.38 Y154.014 I6.168 J1.678 E.13038
G3 X124.132 Y152.759 I29.546 J61.17 E.08195
G2 X124.296 Y151.923 I-.505 J-.533 E.02463
G3 X116.547 Y149.551 I3.85 J-26.421 E.22044
G3 X114.55 Y151.505 I-5.272 J-3.389 E.07633
G3 X111.799 Y152.759 I-29.547 J-61.172 E.08195
G1 X111.579 Y153.177 E.0128
G2 X111.877 Y154.432 I4.394 J-.382 E.03506
G2 X114.691 Y158.195 I6.167 J-1.678 E.13038
G2 X117.442 Y159.449 I29.546 J-61.17 E.08195
G1 X117.662 Y159.867 E.0128
G3 X117.048 Y161.958 I-8.562 J-1.38 E.0592
G3 X113.968 Y165.178 I-5.601 J-2.273 E.12366
G3 X110.386 Y163.704 I14.111 J-39.385 E.105
G2 X107.861 Y160.703 I-5.435 J2.011 E.10842
G2 X105.109 Y159.449 I-29.538 J61.154 E.08195
G1 X104.889 Y159.031 E.0128
G3 X105.187 Y157.777 I4.393 J.382 E.03506
G3 X108.001 Y154.014 I6.168 J1.678 E.13038
G3 X110.753 Y152.759 I29.546 J61.17 E.08195
G1 X110.973 Y152.341 E.0128
G2 X110.674 Y151.087 I-4.394 J.382 E.03506
G2 X107.861 Y147.324 I-6.168 J1.678 E.13038
G2 X105.109 Y146.069 I-29.538 J61.154 E.08195
G1 X104.889 Y145.651 E.0128
G3 X106.869 Y141.47 I8.047 J1.251 E.1271
G1 X106.87 Y141.469 E.00004
G2 X107.894 Y142.778 I18.38 J-13.333 E.04506
G1 X88.63 Y139.491 F30000
G1 F10826.06
G3 X88.125 Y137.907 I31.993 J-11.081 E.04505
G2 X90.605 Y134.362 I-3.699 J-5.229 E.11959
G2 X90.903 Y133.108 I-4.096 J-1.637 E.03506
G1 X90.683 Y132.69 E.0128
G3 X87.932 Y131.436 I26.794 J-62.425 E.08195
G3 X86.617 Y130.403 I2.951 J-5.108 E.04544
G3 X86.387 Y125.401 I48.812 J-4.752 E.13573
G2 X89.311 Y123.491 I-2.249 J-6.634 E.09563
G2 X90.903 Y119.728 I-7.182 J-5.259 E.11172
G1 X90.683 Y119.31 E.0128
G3 X87.932 Y118.056 I26.779 J-62.391 E.08195
G3 X87.242 Y117.595 I1.493 J-2.983 E.02254
G3 X91.638 Y105.758 I41.651 J8.736 E.34343
G1 X91.729 Y105.931 E.00529
G3 X94.481 Y107.185 I-26.802 J62.442 E.08195
G3 X97.295 Y110.948 I-3.354 J5.441 E.13038
G3 X97.593 Y112.202 I-4.096 J1.637 E.03506
G1 X97.373 Y112.621 E.0128
G2 X94.621 Y113.875 I26.81 J62.458 E.08195
G2 X91.808 Y117.638 I3.354 J5.441 E.13038
G2 X91.509 Y118.892 I4.096 J1.637 E.03506
G1 X91.729 Y119.31 E.0128
G3 X94.481 Y120.565 I-26.802 J62.442 E.08195
G3 X97.295 Y124.328 I-3.354 J5.441 E.13038
G3 X97.593 Y125.582 I-4.096 J1.637 E.03506
G1 X97.373 Y126 E.0128
G2 X94.621 Y127.254 I26.794 J62.425 E.08195
G2 X91.808 Y131.017 I3.354 J5.441 E.13038
G2 X91.509 Y132.272 I4.096 J1.637 E.03506
G1 X91.729 Y132.69 E.0128
G3 X94.481 Y133.944 I-26.787 J62.408 E.08195
G3 X97.295 Y137.707 I-3.354 J5.441 E.13038
G3 X97.593 Y138.962 I-4.096 J1.637 E.03506
G1 X97.373 Y139.38 E.0128
G2 X94.621 Y140.634 I26.794 J62.425 E.08195
G2 X91.808 Y144.397 I3.354 J5.441 E.13038
G2 X91.509 Y145.651 I4.096 J1.637 E.03506
G1 X91.729 Y146.069 E.0128
G3 X94.481 Y147.324 I-26.787 J62.408 E.08195
G3 X97.295 Y151.087 I-3.354 J5.441 E.13038
G3 X97.593 Y152.341 I-4.096 J1.637 E.03506
G1 X97.373 Y152.759 E.0128
G1 X96.479 Y153.17 E.02666
G3 X95.417 Y151.89 I36.059 J-30.985 E.04505
G1 X105.626 Y161.089 F30000
G1 F10826.06
G3 X104.242 Y160.168 I23.85 J-37.33 E.04505
G1 X104.283 Y159.867 E.00822
G1 X104.063 Y159.449 E.0128
G2 X102.158 Y158.62 I-11.579 J24.005 E.05631
G3 X99.182 Y156.022 I26.313 J-33.147 E.10708
G3 X98.256 Y153.595 I10.176 J-5.273 E.07054
G3 X98.419 Y152.759 I.669 J-.303 E.02463
G1 X99.329 Y152.341 E.02714
G2 X102.303 Y150.669 I-3.179 J-9.132 E.09294
G2 X104.226 Y146.906 I-6.184 J-5.533 E.11579
G2 X104.063 Y146.069 I-.668 J-.303 E.02463
G1 X103.153 Y145.651 E.02714
G3 X100.179 Y143.979 I3.179 J-9.132 E.09294
G3 X98.256 Y140.216 I6.184 J-5.533 E.11579
G3 X98.419 Y139.38 I.669 J-.303 E.02463
G3 X100.342 Y138.543 I11.682 J24.23 E.05683
G2 X103.566 Y135.409 I-2.325 J-5.617 E.12479
G3 X102.518 Y132.046 I26.651 J-10.143 E.09551
G3 X100.179 Y130.599 I4.566 J-9.999 E.07473
G3 X98.256 Y126.836 I6.184 J-5.533 E.11579
G3 X98.419 Y126 I.669 J-.303 E.02463
G1 X99.329 Y125.582 E.02714
G2 X101.87 Y124.277 I-3.563 J-10.063 E.07763
G3 X102.833 Y118.76 I27.213 J1.906 E.15201
G3 X100.179 Y117.22 I2.97 J-8.174 E.08359
G3 X98.256 Y113.457 I6.184 J-5.533 E.11579
G3 X98.419 Y112.621 I.669 J-.303 E.02463
G2 X100.827 Y111.539 I-42.378 J-97.62 E.07153
G1 X99.529 Y110.5 E.04505
G1 X107.917 Y102.64 F30000
G1 F10826.06
G1 X106.619 Y101.601 E.04505
G3 X108.001 Y100.495 I4.309 J3.968 E.04815
G3 X110.753 Y99.241 I29.561 J61.204 E.08195
G1 X110.973 Y98.823 E.0128
G2 X110.674 Y97.569 I-4.394 J.382 E.03506
G2 X107.861 Y93.806 I-6.168 J1.678 E.13038
G2 X105.109 Y92.551 I-29.554 J61.187 E.08195
G1 X104.889 Y92.133 E.0128
G3 X105.075 Y91.268 I3.018 J.196 E.02405
G2 X103.556 Y92.318 I28.631 J43.048 E.05003
G1 X104.063 Y92.551 E.01512
G1 X104.283 Y92.969 E.0128
G3 X103.985 Y94.224 I-4.394 J-.382 E.03506
G3 X101.684 Y97.651 I-6.27 J-1.722 E.11384
G1 X100.385 Y96.613 E.04505
G1 X99.186 Y95.944 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421766
G1 F11615.001
G2 X94.809 Y100.869 I29.845 J30.933 E.16659
G1 X99.367 Y96.311 E.16282
G1 X99.671 Y96.554 E.00985
G1 X93.45 Y102.776 E.22221
G2 X92.468 Y104.306 I38.33 J25.685 E.04593
G1 X99.976 Y96.798 E.26816
G1 X100.28 Y97.042 E.00985
G1 X92.756 Y104.566 E.26876
G1 X93.06 Y104.81 E.00985
G1 X100.584 Y97.285 E.26876
G1 X100.889 Y97.529 E.00985
G1 X93.364 Y105.053 E.26876
G1 X93.669 Y105.297 E.00985
G1 X101.193 Y97.772 E.26876
G1 X101.497 Y98.016 E.00985
G1 X93.973 Y105.54 E.26876
G1 X94.277 Y105.784 E.00985
G1 X101.802 Y98.259 E.26876
G1 X102.106 Y98.503 E.00985
G1 X94.582 Y106.027 E.26876
G1 X94.886 Y106.271 E.00985
G1 X102.41 Y98.747 E.26876
G1 X102.715 Y98.99 E.00985
G1 X95.19 Y106.515 E.26876
G1 X95.495 Y106.758 E.00985
G1 X103.019 Y99.234 E.26876
G1 X103.323 Y99.477 E.00984
G1 X95.799 Y107.002 E.26876
G1 X96.103 Y107.245 E.00985
G1 X103.628 Y99.721 E.26876
G1 X103.932 Y99.964 E.00984
G1 X96.408 Y107.489 E.26876
G1 X96.712 Y107.732 E.00985
G1 X104.236 Y100.208 E.26876
G1 X104.541 Y100.452 E.00985
G1 X97.016 Y107.976 E.26876
G1 X97.321 Y108.22 E.00985
G1 X104.845 Y100.695 E.26876
G1 X105.149 Y100.939 E.00985
G1 X97.625 Y108.463 E.26876
G1 X97.929 Y108.707 E.00985
G1 X105.454 Y101.182 E.26876
G1 X105.758 Y101.426 E.00985
G1 X98.234 Y108.95 E.26876
G1 X98.538 Y109.194 E.00985
G1 X106.062 Y101.669 E.26876
G1 X106.367 Y101.913 E.00985
G1 X98.842 Y109.437 E.26876
G1 X99.147 Y109.681 E.00985
G1 X106.671 Y102.157 E.26876
G1 X106.976 Y102.4 E.00985
G1 X99.451 Y109.925 E.26876
G1 X99.755 Y110.168 E.00985
G1 X107.28 Y102.644 E.26876
G1 X107.584 Y102.887 E.00985
G1 X100.06 Y110.412 E.26876
G1 X100.364 Y110.655 E.00985
G1 X107.889 Y103.131 E.26876
G1 X108.193 Y103.374 E.00985
G1 X100.668 Y110.899 E.26876
G1 X100.973 Y111.142 E.00985
G1 X108.497 Y103.618 E.26876
G1 X108.802 Y103.862 E.00985
G1 X101.277 Y111.386 E.26876
G1 X101.581 Y111.63 E.00985
G1 X109.106 Y104.105 E.26876
G1 X109.41 Y104.349 E.00985
G1 X101.886 Y111.873 E.26876
G1 X102.19 Y112.117 E.00985
G1 X109.715 Y104.592 E.26876
G1 X110.019 Y104.836 E.00985
G1 X102.494 Y112.36 E.26876
G1 X102.799 Y112.604 E.00985
G1 X110.323 Y105.079 E.26876
G1 X110.628 Y105.323 E.00984
G1 X103.103 Y112.847 E.26876
G1 X103.407 Y113.091 E.00985
G1 X110.932 Y105.567 E.26876
M73 P45 R24
G1 X111.236 Y105.81 E.00985
G1 X103.712 Y113.335 E.26876
G1 X104.016 Y113.578 E.00985
G1 X111.592 Y106.002 E.2706
G1 X111.724 Y106.002 E.00334
G3 X113.397 Y104.745 I14.406 J17.425 E.05287
G1 X104.32 Y113.822 E.3242
G1 X104.625 Y114.065 E.00985
G1 X114.887 Y103.803 E.36656
G3 X116.116 Y103.122 I7.548 J12.171 E.0355
G1 X104.888 Y114.35 E.40106
G1 X104.922 Y114.502 E.00392
G1 X104.582 Y115.204 E.01972
G1 X117.191 Y102.594 E.4504
G1 X118.167 Y102.167 E.02691
G1 X104.165 Y116.169 E.50014
G2 X103.818 Y117.064 I8.936 J3.982 E.02426
G1 X119.075 Y101.807 E.54495
G1 X119.91 Y101.52 E.02231
G1 X103.52 Y117.91 E.58543
G1 X103.266 Y118.712 E.02125
G1 X120.705 Y101.273 E.62289
G3 X121.474 Y101.052 I3.39 J10.338 E.02022
G1 X103.062 Y119.464 E.65764
G2 X102.874 Y120.199 I9.869 J2.91 E.01918
G1 X122.197 Y100.877 E.69017
G1 X122.892 Y100.729 E.01794
G1 X102.727 Y120.894 E.72025
G1 X102.602 Y121.567 E.0173
G1 X123.568 Y100.601 E.74889
G1 X124.221 Y100.496 E.0167
G1 X102.496 Y122.221 E.77598
G1 X102.41 Y122.855 E.01616
G1 X124.855 Y100.41 E.80169
G1 X125.471 Y100.342 E.01566
G1 X102.342 Y123.471 E.82613
G1 X102.29 Y124.071 E.0152
G1 X126.071 Y100.289 E.84942
G1 X126.655 Y100.253 E.01477
G1 X102.251 Y124.657 E.87166
G1 X102.23 Y125.226 E.01438
G1 X127.23 Y100.227 E.89292
G1 X127.784 Y100.22 E.01401
G1 X102.214 Y125.791 E.91334
G2 X102.214 Y126.338 I7.423 J.263 E.01382
G1 X128.338 Y100.214 E.93309
G1 X128.866 Y100.234 E.01336
G1 X102.234 Y126.866 E.95127
G1 X102.253 Y127.395 E.01336
G1 X129.395 Y100.253 E.96945
G3 X129.912 Y100.285 I-.165 J7.013 E.01308
G1 X102.288 Y127.908 E.98665
G1 X102.332 Y128.412 E.01279
G1 X130.415 Y100.329 E1.00308
G1 X130.908 Y100.384 E.01253
G1 X102.378 Y128.914 E1.01905
G1 X102.438 Y129.402 E.01241
G1 X131.401 Y100.439 E1.03452
G1 X131.876 Y100.512 E.01214
G1 X102.512 Y129.876 E1.04885
G1 X102.587 Y130.348 E.01207
G1 X132.348 Y100.588 E1.063
G3 X132.816 Y100.668 I-.581 J4.799 E.01199
G1 X102.668 Y130.816 E1.07684
G1 X102.763 Y131.268 E.01167
G1 X133.268 Y100.763 E1.08957
G1 X133.72 Y100.859 E.01167
G1 X102.859 Y131.72 E1.10231
G1 X102.964 Y132.164 E.01151
G1 X134.164 Y100.964 E1.11441
G1 X134.597 Y101.078 E.01133
G1 X103.078 Y132.597 E1.12582
G1 X103.192 Y133.031 E.01133
G1 X135.031 Y101.192 E1.13722
G1 X135.453 Y101.318 E.01113
G1 X103.318 Y133.453 E1.14781
G1 X103.45 Y133.869 E.01102
G1 X135.869 Y101.45 E1.15797
G1 X136.285 Y101.581 E.01102
G1 X103.581 Y134.285 E1.16812
G1 X103.723 Y134.692 E.01087
G1 X136.689 Y101.726 E1.17749
G1 X137.088 Y101.874 E.01076
G1 X103.87 Y135.092 E1.18648
G1 X104.027 Y135.484 E.01065
G1 X137.488 Y102.023 E1.19516
G3 X137.875 Y102.184 I-1.446 J4.024 E.01059
G1 X104.183 Y135.875 E1.20339
G2 X104.343 Y136.263 I5.362 J-1.979 E.0106
G1 X138.258 Y102.348 E1.21139
G1 X138.642 Y102.512 E.01054
G1 X104.511 Y136.643 E1.21907
G1 X104.688 Y137.014 E.01038
G1 X139.017 Y102.685 E1.22615
G1 X139.386 Y102.864 E.01036
G1 X104.868 Y137.382 E1.23293
G1 X105.048 Y137.75 E.01035
G1 X139.747 Y103.051 E1.2394
G1 X140.108 Y103.238 E.01026
G1 X105.237 Y138.109 E1.24552
G1 X105.432 Y138.462 E.01019
G1 X140.467 Y103.427 E1.25141
G1 X140.813 Y103.628 E.01012
G1 X105.626 Y138.816 E1.25682
G1 X105.828 Y139.162 E.01012
G1 X141.16 Y103.83 E1.26197
G1 X141.506 Y104.032 E.01012
G1 X106.037 Y139.501 E1.26688
G1 X106.246 Y139.84 E.01006
G1 X141.839 Y104.247 E1.2713
G1 X142.171 Y104.463 E.01
G1 X106.46 Y140.174 E1.27553
G1 X106.683 Y140.499 E.00995
G1 X142.503 Y104.679 E1.27942
G1 X142.824 Y104.905 E.00993
G1 X106.905 Y140.824 E1.28295
G1 X107.13 Y141.147 E.00994
G1 X143.142 Y105.135 E1.2863
G1 X143.46 Y105.365 E.00991
G1 X107.363 Y141.462 E1.28932
G1 X107.602 Y141.771 E.00987
G1 X143.771 Y105.602 E1.29191
G1 X144.076 Y105.845 E.00985
G1 X107.845 Y142.076 E1.29408
G1 X108.089 Y142.38 E.00984
G1 X144.38 Y106.089 E1.29625
G1 X144.681 Y106.336 E.00983
G1 X108.336 Y142.681 E1.29816
G1 X108.593 Y142.971 E.0098
G1 X144.971 Y106.593 E1.29936
G1 X145.262 Y106.85 E.0098
G1 X108.85 Y143.262 E1.30057
G1 X109.107 Y143.553 E.0098
G1 X145.553 Y107.107 E1.30176
G1 X145.83 Y107.378 E.00979
G1 X109.378 Y143.83 E1.302
G1 X109.649 Y144.108 E.00979
G1 X146.108 Y107.649 E1.30224
G1 X146.385 Y107.919 E.00979
G1 X109.919 Y144.385 E1.30248
G1 X110.2 Y144.652 E.00979
G1 X146.652 Y108.2 E1.30202
G1 X146.916 Y108.484 E.00979
G1 X110.484 Y144.916 E1.30129
G1 X110.768 Y145.18 E.00979
G1 X147.18 Y108.768 E1.30057
G3 X147.437 Y109.058 I-2.826 J2.764 E.00981
G1 X111.058 Y145.437 E1.2994
G1 X111.356 Y145.688 E.00982
G1 X147.688 Y109.356 E1.29771
G1 X147.938 Y109.653 E.00982
G1 X111.653 Y145.938 E1.29603
G2 X111.953 Y146.186 I3.527 J-3.957 E.00983
G1 X148.186 Y109.954 E1.29415
G1 X148.422 Y110.265 E.00988
G1 X112.261 Y146.426 E1.29162
G1 X112.575 Y146.661 E.00989
G1 X148.659 Y110.576 E1.28886
G1 X148.896 Y110.887 E.00988
G1 X112.893 Y146.89 E1.28596
G1 X113.211 Y147.12 E.00991
G1 X149.119 Y111.212 E1.28257
G1 X149.342 Y111.537 E.00995
G1 X113.534 Y147.345 E1.27899
G1 X113.866 Y147.561 E.01
G1 X149.565 Y111.862 E1.2751
G1 X149.777 Y112.198 E.01003
G1 X114.198 Y147.777 E1.27082
G1 X114.532 Y147.99 E.01002
G1 X149.986 Y112.537 E1.26633
G1 X150.195 Y112.876 E.01006
G1 X114.879 Y148.192 E1.26143
G1 X115.225 Y148.394 E.01012
G1 X150.395 Y113.223 E1.25622
G1 X150.59 Y113.577 E.01019
G1 X115.571 Y148.595 E1.2508
G1 X115.928 Y148.786 E.01023
G1 X150.784 Y113.93 E1.245
G1 X150.972 Y114.29 E.01026
G1 X116.289 Y148.974 E1.23883
G1 X116.653 Y149.157 E.01031
G1 X151.152 Y114.658 E1.23223
G1 X151.332 Y115.027 E.01035
G1 X117.028 Y149.33 E1.22527
G1 X117.403 Y149.503 E.01044
G1 X151.506 Y115.4 E1.21807
G1 X151.67 Y115.784 E.01054
G1 X117.779 Y149.675 E1.21052
G1 X118.168 Y149.834 E.01061
G1 X151.834 Y116.167 E1.2025
G1 X151.994 Y116.556 E.01061
G1 X118.56 Y149.99 E1.1942
G1 X118.951 Y150.147 E.01065
G1 X152.142 Y116.956 E1.18553
G1 X152.291 Y117.355 E.01076
G1 X119.356 Y150.29 E1.17636
G1 X119.764 Y150.43 E.01089
G1 X152.433 Y117.76 E1.16689
G1 X152.565 Y118.177 E.01102
G1 X120.171 Y150.57 E1.15704
G1 X120.594 Y150.695 E.01114
G1 X152.697 Y118.593 E1.14664
G1 X152.82 Y119.017 E.01116
G1 X121.019 Y150.818 E1.13589
G1 X121.444 Y150.941 E.01118
G1 X152.935 Y119.45 E1.12477
G1 X153.049 Y119.884 E.01133
G1 X121.887 Y151.046 E1.11304
G1 X122.33 Y151.151 E.01149
G1 X153.151 Y120.329 E1.10089
G1 X153.247 Y120.782 E.01167
G1 X122.778 Y151.251 E1.08832
G1 X123.24 Y151.337 E.01187
G1 X153.343 Y121.234 E1.07524
G1 X153.421 Y121.704 E.01204
G1 X123.701 Y151.423 E1.06151
G1 X124.175 Y151.498 E.0121
G1 X153.497 Y122.176 E1.04732
G1 X153.567 Y122.653 E.01218
G1 X124.657 Y151.563 E1.03261
M73 P45 R23
G1 X125.14 Y151.629 E.0123
G1 X153.622 Y123.146 E1.01734
G1 X153.677 Y123.64 E.01253
G1 X125.643 Y151.673 E1.0013
G1 X126.148 Y151.716 E.01279
G1 X153.715 Y124.149 E.98466
G1 X153.747 Y124.665 E.01306
G1 X126.663 Y151.749 E.96738
G1 X127.192 Y151.768 E.01336
G1 X153.772 Y125.188 E.94941
G1 X153.779 Y125.729 E.01367
G1 X127.722 Y151.786 E.93071
G1 X128.277 Y151.779 E.01401
G1 X153.786 Y126.27 E.91114
G1 X153.767 Y126.837 E.01432
G1 X128.831 Y151.772 E.89066
G1 X129.403 Y151.749 E.01445
G1 X153.746 Y127.405 E.86949
G1 X153.704 Y127.995 E.01494
G1 X129.99 Y151.71 E.84702
G1 X130.597 Y151.651 E.0154
G1 X153.653 Y128.595 E.8235
G1 X153.581 Y129.215 E.01576
G1 X131.213 Y151.582 E.79892
G1 X131.851 Y151.493 E.01626
G1 X153.494 Y129.849 E.77307
G1 X153.384 Y130.507 E.01685
G1 X132.504 Y151.387 E.74582
M73 P46 R23
G1 X133.185 Y151.254 E.01753
G1 X153.259 Y131.18 E.71702
G1 X153.099 Y131.888 E.01833
G1 X133.88 Y151.107 E.68648
G1 X134.618 Y150.917 E.01926
G1 X152.926 Y132.609 E.65392
G1 X152.702 Y133.38 E.02029
G1 X135.376 Y150.707 E.61885
G1 X136.178 Y150.452 E.02125
G1 X152.449 Y134.182 E.58114
G1 X152.159 Y135.02 E.02238
G1 X137.032 Y150.147 E.54031
G2 X137.928 Y149.799 I-4.277 J-12.337 E.02428
G1 X151.79 Y135.937 E.49512
G3 X151.36 Y136.915 I-10.185 J-3.894 E.02699
G1 X138.92 Y149.354 E.44433
G2 X140.009 Y148.813 I-4.96 J-11.345 E.03074
G1 X150.823 Y137.999 E.38625
G1 X150.281 Y138.985 E.02843
G1 X150.113 Y139.258 E.00808
G1 X141.257 Y148.113 E.31629
G2 X142.821 Y147.097 I-10.514 J-17.898 E.0471
G1 X149.094 Y140.824 E.22408
G3 X146.474 Y143.992 I-22.159 J-15.659 E.10394
G1 X144.143 Y146.323 E.08325
G1 X149.448 Y141.017 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X150.357 Y139.625 I-13.795 J-10.002 E.04506
G1 X150.891 Y139.38 E.01593
G1 X151.111 Y138.962 E.0128
G2 X151.029 Y138.456 I-1.752 J.024 E.01393
G2 X151.778 Y136.972 I-14.783 J-8.388 E.04506
G1 X137.467 Y166.525 F30000
G1 F10826.06
G2 X138.487 Y166.274 I-4.614 J-20.899 E.02847
G1 X138.558 Y166.139 E.00413
G1 X139.468 Y165.721 E.02714
G2 X142.442 Y164.048 I-3.179 J-9.132 E.09294
G2 X144.365 Y160.285 I-6.184 J-5.533 E.11579
G2 X144.201 Y159.449 I-.668 J-.303 E.02463
G1 X143.291 Y159.031 E.02714
G3 X140.318 Y157.358 I3.179 J-9.132 E.09294
G3 X138.394 Y153.595 I6.184 J-5.533 E.11579
G3 X138.558 Y152.759 I.669 J-.303 E.02463
G1 X139.468 Y152.341 E.02714
G2 X142.442 Y150.669 I-3.179 J-9.132 E.09294
G2 X144.422 Y146.488 I-6.068 J-5.432 E.1271
G1 X144.386 Y146.42 E.00208
G2 X144.866 Y146.035 I-8.349 J-10.914 E.01667
G1 X145.114 Y145.816 E.00898
G1 X145.248 Y146.069 E.00777
G1 X146.158 Y146.488 E.02714
G3 X149.132 Y148.16 I-3.179 J9.132 E.09294
G3 X151.055 Y151.923 I-6.183 J5.533 E.11579
G3 X150.891 Y152.759 I-.668 J.303 E.02463
G1 X149.981 Y153.177 E.02714
G2 X147.007 Y154.85 I3.179 J9.133 E.09294
G2 X145.084 Y158.613 I6.184 J5.533 E.11579
G2 X145.248 Y159.449 I.669 J.303 E.02463
G1 X146.158 Y159.867 E.02714
G3 X149.317 Y161.74 I-2.216 J7.339 E.10051
G2 X154.573 Y158.027 I-21.377 J-35.831 E.17454
G3 X153.697 Y157.358 I2.229 J-3.828 E.02993
G3 X151.774 Y153.595 I6.184 J-5.533 E.11579
G3 X151.937 Y152.759 I.669 J-.303 E.02463
G1 X152.848 Y152.341 E.02714
G2 X155.821 Y150.669 I-3.179 J-9.132 E.09294
G2 X157.744 Y146.906 I-6.184 J-5.533 E.11579
G2 X157.581 Y146.069 I-.668 J-.303 E.02463
G1 X156.671 Y145.651 E.02714
G3 X153.697 Y143.979 I3.179 J-9.132 E.09294
G3 X151.774 Y140.216 I6.184 J-5.533 E.11579
G3 X151.937 Y139.38 I.669 J-.303 E.02463
G1 X152.848 Y138.962 E.02714
G2 X155.821 Y137.289 I-3.179 J-9.132 E.09294
G2 X157.744 Y133.526 I-6.184 J-5.533 E.11579
G2 X157.581 Y132.69 I-.668 J-.303 E.02463
G1 X156.671 Y132.272 E.02714
G3 X153.764 Y130.656 I3.195 J-9.17 E.09055
G2 X154.171 Y125.041 I-26.399 J-4.737 E.15285
G2 X155.821 Y123.91 I-3.924 J-7.493 E.05433
G2 X157.744 Y120.147 I-6.184 J-5.533 E.11579
G2 X157.581 Y119.31 I-.668 J-.303 E.02463
G1 X156.671 Y118.892 E.02714
G3 X153.697 Y117.22 I3.179 J-9.132 E.09294
G3 X151.774 Y113.457 I6.183 J-5.533 E.11579
G3 X151.937 Y112.621 I.669 J-.303 E.02463
G1 X152.848 Y112.202 E.02714
G2 X155.821 Y110.53 I-3.179 J-9.132 E.09294
G2 X157.744 Y106.767 I-6.184 J-5.533 E.11579
G2 X157.581 Y105.931 I-.668 J-.303 E.02463
G1 X156.671 Y105.513 E.02714
G3 X153.697 Y103.84 I3.179 J-9.132 E.09294
G3 X151.774 Y100.077 I6.183 J-5.533 E.11579
G3 X151.937 Y99.241 I.669 J-.303 E.02463
G3 X153.86 Y98.405 I11.682 J24.23 E.05683
G2 X156.76 Y95.923 I-2.13 J-5.425 E.10539
G3 X161.098 Y100.771 I-29.069 J30.376 E.17645
G2 X160.387 Y101.332 I1.883 J3.119 E.02461
G2 X158.464 Y105.095 I6.184 J5.533 E.11579
G2 X158.627 Y105.931 I.669 J.303 E.02463
G1 X159.537 Y106.349 E.02714
G3 X162.511 Y108.021 I-3.179 J9.132 E.09294
G3 X164.434 Y111.784 I-6.184 J5.533 E.11579
G3 X164.271 Y112.621 I-.668 J.303 E.02463
G1 X163.361 Y113.039 E.02714
G2 X160.387 Y114.711 I3.179 J9.133 E.09294
G2 X158.464 Y118.474 I6.184 J5.533 E.11579
G2 X158.627 Y119.31 I.669 J.303 E.02463
G1 X159.537 Y119.728 E.02714
G3 X162.511 Y121.401 I-3.179 J9.132 E.09294
G3 X164.434 Y125.164 I-6.184 J5.533 E.11579
G3 X164.271 Y126 I-.668 J.303 E.02463
G1 X163.361 Y126.418 E.02714
G2 X160.387 Y128.091 I3.179 J9.133 E.09294
G2 X158.464 Y131.854 I6.184 J5.533 E.11579
G2 X158.627 Y132.69 I.669 J.303 E.02463
G1 X159.537 Y133.108 E.02714
G3 X162.511 Y134.78 I-3.179 J9.132 E.09294
G3 X164.434 Y138.543 I-6.183 J5.533 E.11579
G3 X164.271 Y139.38 I-.668 J.303 E.02463
G1 X163.361 Y139.798 E.02714
G2 X160.387 Y141.47 I3.179 J9.133 E.09294
G2 X158.464 Y145.233 I6.184 J5.533 E.11579
G2 X158.627 Y146.069 I.669 J.303 E.02463
G1 X159.537 Y146.488 E.02714
G3 X162.93 Y148.625 I-2.14 J7.158 E.11
G2 X166.113 Y142.711 I-35.27 J-22.795 E.18219
G3 X165.154 Y140.216 I10.284 J-5.386 E.07258
G3 X165.317 Y139.38 I.669 J-.303 E.02463
G2 X167.762 Y138.28 I-38.691 J-89.291 E.07266
G2 X169.192 Y131.917 I-39.919 J-12.314 E.17688
G3 X167.077 Y130.599 I2.619 J-6.561 E.0679
G3 X165.154 Y126.836 I6.184 J-5.533 E.11579
G3 X165.317 Y126 I.669 J-.303 E.02463
G1 X166.227 Y125.582 E.02714
G2 X169.544 Y123.539 I-2.154 J-7.211 E.10678
G2 X168.921 Y118.415 I-48.92 J3.354 E.13993
G3 X167.077 Y117.22 I2.926 J-6.535 E.05978
G3 X165.154 Y113.457 I6.183 J-5.533 E.11579
G3 X165.317 Y112.621 I.669 J-.303 E.02463
G3 X167.128 Y111.83 I11.039 J22.83 E.05357
G2 X166.532 Y110.279 I-41.383 J15.03 E.04505
G1 X147.887 Y89.443 F30000
G1 F10826.06
G2 X146.411 Y88.678 I-16.337 J29.7 E.04505
G2 X145.028 Y92.133 I7.296 J4.925 E.10162
G1 X145.248 Y92.551 E.0128
G3 X147.999 Y93.806 I-26.802 J62.442 E.08195
G3 X150.813 Y97.569 I-3.354 J5.441 E.13038
G3 X151.111 Y98.823 I-4.096 J1.637 E.03506
G1 X150.891 Y99.241 E.0128
G2 X148.14 Y100.495 I26.81 J62.458 E.08195
G2 X145.326 Y104.258 I3.354 J5.441 E.13038
G2 X145.028 Y105.513 I4.095 J1.636 E.03506
G1 X145.248 Y105.931 E.0128
G3 X147.999 Y107.185 I-26.802 J62.442 E.08195
G3 X150.813 Y110.948 I-3.354 J5.441 E.13038
G3 X151.111 Y112.202 I-4.096 J1.637 E.03506
G1 X150.891 Y112.621 E.0128
G1 X150.593 Y112.758 E.0089
G1 X150.624 Y112.808 E.00161
G3 X151.384 Y114.22 I-43.181 J24.151 E.04344
G1 X140.723 Y103.112 F30000
G1 F10826.06
G1 X140.632 Y103.058 E.00287
G2 X139.245 Y102.35 I-32.567 J62.033 E.04218
G3 X138.338 Y99.659 I10.93 J-5.185 E.07714
G1 X138.558 Y99.241 E.0128
G2 X141.31 Y97.987 I-26.787 J-62.408 E.08195
G2 X144.123 Y94.224 I-3.354 J-5.441 E.13038
G2 X144.422 Y92.969 I-4.096 J-1.637 E.03506
G1 X144.201 Y92.551 E.0128
G3 X141.45 Y91.297 I26.78 J-62.393 E.08195
G3 X138.636 Y87.534 I3.354 J-5.441 E.13038
G3 X138.338 Y86.28 I4.096 J-1.637 E.03506
G1 X138.558 Y85.861 E.0128
G1 X138.719 Y85.787 E.00481
G2 X137.688 Y85.526 I-5.833 J20.86 E.02882
G1 X137.512 Y85.861 E.01026
G2 X134.76 Y87.116 I26.81 J62.458 E.08195
G2 X131.946 Y90.879 I3.354 J5.441 E.13038
G2 X131.648 Y92.133 I4.095 J1.636 E.03506
G1 X131.868 Y92.551 E.0128
G3 X134.62 Y93.806 I-26.802 J62.442 E.08195
G3 X137.433 Y97.569 I-3.354 J5.441 E.13038
G3 X137.732 Y98.823 I-4.096 J1.637 E.03506
G1 X137.512 Y99.241 E.0128
G2 X134.53 Y100.646 I21.599 J49.713 E.08933
G2 X125.003 Y99.991 I-6.507 J25.033 E.26025
G1 X124.958 Y99.659 E.00906
G1 X125.178 Y99.241 E.0128
G2 X127.93 Y97.987 I-26.78 J-62.393 E.08195
G2 X130.744 Y94.224 I-3.354 J-5.441 E.13038
G2 X131.042 Y92.969 I-4.096 J-1.637 E.03506
G1 X130.822 Y92.551 E.0128
G3 X128.07 Y91.297 I26.78 J-62.393 E.08195
G3 X125.257 Y87.534 I3.354 J-5.441 E.13038
G3 X124.958 Y86.28 I4.096 J-1.637 E.03506
G1 X125.178 Y85.861 E.0128
G2 X127.93 Y84.607 I-26.78 J-62.393 E.08195
G1 X128.258 Y84.393 E.01061
G2 X124.162 Y84.562 I-.423 J39.492 E.11113
G3 X124.352 Y85.443 I-2.888 J1.086 E.02452
G1 X124.132 Y85.861 E.0128
G2 X121.38 Y87.116 I26.81 J62.458 E.08195
G2 X118.567 Y90.879 I3.354 J5.441 E.13038
G2 X118.268 Y92.133 I4.095 J1.636 E.03506
G1 X118.489 Y92.551 E.0128
G3 X121.24 Y93.806 I-26.802 J62.442 E.08195
G3 X124.054 Y97.569 I-3.354 J5.441 E.13038
G3 X124.352 Y98.823 I-4.096 J1.637 E.03506
G1 X124.132 Y99.241 E.0128
G2 X121.38 Y100.495 I26.81 J62.458 E.08195
G3 X120.095 Y101.032 I-1.521 J-1.833 E.03831
G2 X113.772 Y104.022 I8.144 J25.406 E.19006
G3 X111.877 Y100.913 I4.746 J-5.026 E.09983
G3 X111.579 Y99.659 I4.096 J-1.637 E.03506
G1 X111.799 Y99.241 E.0128
G2 X114.55 Y97.987 I-26.78 J-62.393 E.08195
G2 X117.364 Y94.224 I-3.354 J-5.441 E.13038
G2 X117.662 Y92.969 I-4.096 J-1.637 E.03506
G1 X117.442 Y92.551 E.0128
G3 X114.691 Y91.297 I26.787 J-62.408 E.08195
G3 X111.91 Y87.621 I3.295 J-5.382 E.12785
G3 X113.455 Y87.007 I13.258 J31.104 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X111.91 Y87.621 E-.63177
G1 X112.029 Y87.937 E-.12824
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/58
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.04 I-1.195 J.231 P1  F30000
G1 X127.486 Y167.97 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X117.302 Y85.413 I.504 J-41.969 E3.2665
G3 X129.194 Y84.046 I10.68 J40.519 E.32547
G3 X127.546 Y167.971 I-1.204 J41.955 E3.55239
G1 X127.481 Y168.386 F30000
G1 F9000
G3 X117.196 Y85.011 I.509 J-42.385 E3.29884
G3 X129.204 Y83.631 I10.785 J40.918 E.32866
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.386 I-1.215 J42.37 E3.58763
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.786 E.00001
G3 X117.094 Y84.623 I.514 J-42.785 E3.08968
G3 X129.214 Y83.23 I10.887 J41.305 E.30778
G3 X128.525 Y168.786 I-1.225 J42.771 E3.33535
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.786 E-.02285
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.33785
; WIPE_END
G1 E-.04 F1800
G1 X126.505 Y167.591 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X124.845 Y167.495 I2.354 J-55.375 E.04505
G2 X123.819 Y166.736 I-1.089 J.399 E.03662
G2 X122.026 Y167.184 I.819 J7.086 E.05021
G3 X120.386 Y166.915 I4.658 J-33.594 E.04505
G1 X106.024 Y161.341 F30000
G1 F10826.06
G3 X104.63 Y160.435 I17.749 J-28.825 E.04505
G3 X105.422 Y160.046 I.733 J.493 E.02502
G3 X110.568 Y163.79 I-.433 J6.004 E.18168
G2 X113.828 Y165.128 I17.923 J-39.036 E.09553
G2 X116.711 Y162.805 I-1.846 J-5.241 E.10227
G3 X117.965 Y160.472 I326.575 J174.073 E.07178
G1 X118.384 Y160.121 E.0148
G1 X118.802 Y160.046 E.01151
G3 X123.401 Y162.783 I-.527 J6.119 E.15005
G2 X124.655 Y165.116 I326.53 J-174.048 E.07178
G1 X125.073 Y165.467 E.0148
G1 X125.491 Y165.542 E.01151
G2 X130.091 Y162.805 I-.527 J-6.119 E.15005
G3 X131.345 Y160.472 I326.575 J174.073 E.07178
G1 X131.763 Y160.121 E.0148
G1 X132.181 Y160.046 E.01151
G3 X136.78 Y162.783 I-.527 J6.119 E.15005
G2 X138.035 Y165.116 I325.324 J-173.399 E.07178
G1 X138.453 Y165.467 E.0148
G1 X138.871 Y165.542 E.01151
G2 X143.47 Y162.805 I-.527 J-6.119 E.15005
G3 X144.725 Y160.472 I326.575 J174.073 E.07178
G1 X145.143 Y160.121 E.0148
G1 X145.561 Y160.046 E.01151
G3 X149.324 Y161.724 I-.752 J6.744 E.11344
G2 X154.618 Y157.99 I-22.003 J-36.812 E.17572
G3 X152.669 Y156.115 I3.246 J-5.326 E.07387
G2 X151.414 Y153.782 I-326.253 J173.899 E.07178
G1 X150.996 Y153.431 E.0148
G1 X150.578 Y153.357 E.01151
G2 X145.979 Y156.093 I.527 J6.119 E.15005
G3 X144.725 Y158.426 I-326.86 J-174.224 E.07178
G1 X144.306 Y158.777 E.0148
G1 X143.888 Y158.852 E.01151
G3 X139.289 Y156.115 I.527 J-6.119 E.15005
G2 X138.035 Y153.782 I-326.253 J173.899 E.07178
G1 X137.617 Y153.431 E.0148
G1 X137.199 Y153.357 E.01151
G2 X132.599 Y156.093 I.527 J6.119 E.15005
G3 X131.345 Y158.426 I-326.86 J-174.224 E.07178
G1 X130.927 Y158.777 E.0148
G1 X130.509 Y158.852 E.01151
G3 X125.91 Y156.115 I.527 J-6.119 E.15005
G2 X124.655 Y153.782 I-326.253 J173.899 E.07178
G1 X124.237 Y153.431 E.0148
G1 X123.819 Y153.357 E.01151
G2 X119.22 Y156.093 I.527 J6.119 E.15005
G3 X117.965 Y158.426 I-325.651 J-173.574 E.07178
G1 X117.547 Y158.777 E.0148
G1 X117.129 Y158.852 E.01151
G3 X112.53 Y156.115 I.527 J-6.119 E.15005
G2 X111.276 Y153.782 I-326.253 J173.899 E.07178
G1 X110.858 Y153.431 E.0148
G1 X110.439 Y153.357 E.01151
G2 X105.84 Y156.093 I.527 J6.119 E.15005
G3 X104.586 Y158.426 I-325.651 J-173.574 E.07178
G1 X104.168 Y158.777 E.0148
G1 X103.75 Y158.852 E.01151
G3 X101.8 Y158.333 I.737 J-6.694 E.05487
G3 X99.002 Y155.852 I35.793 J-43.17 E.10135
G2 X97.896 Y153.782 I-110.307 J57.643 E.06359
G2 X96.688 Y153.413 I-.88 J.721 E.03627
G3 X95.618 Y152.141 I25.361 J-22.416 E.04505
G1 X88.612 Y139.437 F30000
G1 F10826.06
G3 X88.108 Y137.853 I32.026 J-11.061 E.04505
G2 X90.37 Y135.301 I-2.917 J-4.864 E.09386
G3 X91.206 Y133.713 I13.338 J6.009 E.04866
G1 X91.624 Y133.361 E.0148
G1 X92.043 Y133.287 E.01151
G3 X97.06 Y136.769 I-.489 J6.06 E.17337
G2 X97.896 Y138.357 I13.335 J-6.008 E.04866
G1 X98.314 Y138.708 E.0148
G1 X98.732 Y138.782 E.01151
G2 X103.617 Y135.537 I-.474 J-6.012 E.16594
G1 X103.236 Y134.521 E.02941
G3 X102.471 Y131.824 I29.153 J-9.721 E.07599
G3 X98.732 Y128.611 I1.526 J-5.558 E.13804
G2 X97.896 Y127.023 I-13.338 J6.009 E.04866
G1 X97.478 Y126.672 E.0148
G1 X97.06 Y126.597 E.01151
G2 X92.043 Y130.079 I.489 J6.06 E.17337
G3 X91.206 Y131.667 I-13.336 J-6.008 E.04866
G1 X90.788 Y132.018 E.0148
G1 X90.37 Y132.093 E.01151
G3 X86.62 Y130.426 I.751 J-6.743 E.11298
G3 X86.392 Y125.211 I47.515 J-4.687 E.14151
G2 X90.37 Y121.921 I-1.345 J-5.677 E.14489
G3 X91.206 Y120.333 I13.338 J6.009 E.04866
G1 X91.624 Y119.982 E.0148
G1 X92.043 Y119.908 E.01151
G3 X97.06 Y123.389 I-.489 J6.06 E.17337
G2 X97.896 Y124.977 I13.335 J-6.008 E.04866
G1 X98.314 Y125.329 E.0148
G1 X98.732 Y125.403 E.01151
G2 X101.875 Y124.223 I-.516 J-6.15 E.09212
G3 X102.888 Y118.577 I25.595 J1.679 E.15575
G3 X98.732 Y115.231 I1.226 J-5.776 E.15
G2 X97.896 Y113.643 I-13.338 J6.009 E.04866
G1 X97.478 Y113.292 E.0148
G1 X97.06 Y113.218 E.01151
G2 X92.043 Y116.699 I.489 J6.06 E.17337
G3 X91.206 Y118.287 I-13.336 J-6.008 E.04866
G1 X90.788 Y118.639 E.0148
G1 X90.37 Y118.713 E.01151
G3 X87.251 Y117.548 I.504 J-6.109 E.09137
G3 X89.781 Y109.53 I42.956 J9.144 E.22818
G2 X91.206 Y106.954 I-81.734 J-46.911 E.07979
G1 X91.624 Y106.602 E.0148
G1 X92.043 Y106.528 E.01151
G3 X97.06 Y110.01 I-.489 J6.06 E.17337
G2 X97.896 Y111.598 I13.335 J-6.008 E.04866
G1 X98.314 Y111.949 E.0148
G1 X98.732 Y112.023 E.01151
G2 X100.747 Y111.475 I-.731 J-6.665 E.05681
G1 X99.449 Y110.436 E.04505
G1 X95.756 Y107.189 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422076
G1 F11605.716
G1 X92.622 Y104.055 E.11203
G1 X92.834 Y103.72 E.01005
G1 X97.389 Y108.274 E.1628
G1 X100.135 Y110.472 E.08891
G1 X93.047 Y103.384 E.25338
G3 X93.265 Y103.053 I6.835 J4.268 E.01001
G1 X103.994 Y113.783 E.38356
G1 X107.902 Y142.788 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X106.877 Y141.479 I17.353 J-14.648 E.04506
G2 X105.004 Y144.312 I5.429 J5.625 E.09275
G1 X104.586 Y145.047 E.02291
G1 X104.168 Y145.398 E.0148
G1 X103.75 Y145.472 E.01151
G3 X98.732 Y141.991 I.489 J-6.06 E.17337
G2 X97.896 Y140.403 I-13.338 J6.009 E.04866
G1 X97.478 Y140.051 E.0148
G1 X97.06 Y139.977 E.01151
G2 X92.043 Y143.459 I.489 J6.06 E.17337
G3 X91.206 Y145.047 I-13.336 J-6.008 E.04866
G1 X91.06 Y145.17 E.00518
G2 X91.894 Y146.693 I31.416 J-16.214 E.04707
G1 X92.043 Y146.667 E.00409
G3 X97.06 Y150.148 I-.489 J6.06 E.17337
G2 X97.896 Y151.736 I13.335 J-6.008 E.04866
G1 X98.314 Y152.088 E.0148
G1 X98.732 Y152.162 E.01151
G2 X103.75 Y148.68 I-.489 J-6.06 E.17337
G3 X104.586 Y147.092 I13.338 J6.009 E.04866
G1 X105.004 Y146.741 E.0148
G1 X105.422 Y146.667 E.01151
G3 X110.439 Y150.148 I-.489 J6.06 E.17337
G2 X111.276 Y151.736 I13.335 J-6.008 E.04866
G1 X111.694 Y152.088 E.0148
G1 X112.112 Y152.162 E.01151
G2 X116.604 Y149.577 I-.521 J-6.101 E.14501
G2 X124.983 Y152.012 I11.502 J-23.948 E.23751
G1 X125.073 Y152.088 E.00319
G2 X125.91 Y152.098 I.434 J-1.226 E.02307
G2 X137.349 Y150.456 I2.088 J-26.128 E.31576
G2 X138.035 Y151.736 I10.755 J-4.934 E.03937
G1 X138.453 Y152.088 E.0148
G1 X138.871 Y152.162 E.01151
G2 X143.888 Y148.68 I-.489 J-6.06 E.17337
G3 X144.725 Y147.092 I13.338 J6.009 E.04866
G1 X145.143 Y146.741 E.0148
G1 X145.561 Y146.667 E.01151
G3 X150.578 Y150.148 I-.489 J6.06 E.17337
G2 X151.414 Y151.736 I13.335 J-6.008 E.04866
G1 X151.832 Y152.088 E.0148
G1 X152.251 Y152.162 E.01151
G2 X157.268 Y148.68 I-.489 J-6.06 E.17337
G3 X158.104 Y147.092 I13.338 J6.009 E.04866
G1 X158.522 Y146.741 E.0148
G1 X158.94 Y146.667 E.01151
G3 X162.94 Y148.608 I-.615 J6.358 E.12306
G2 X166.081 Y142.782 I-35.225 J-22.748 E.17954
G2 X164.794 Y140.403 I-130.291 J68.935 E.07331
G1 X164.376 Y140.051 E.0148
G1 X163.958 Y139.977 E.01151
G2 X158.94 Y143.459 I.489 J6.06 E.17337
G3 X158.104 Y145.047 I-13.336 J-6.008 E.04866
G1 X157.686 Y145.398 E.0148
G1 X157.268 Y145.472 E.01151
G3 X152.251 Y141.991 I.489 J-6.06 E.17337
G2 X151.414 Y140.403 I-13.338 J6.009 E.04866
G1 X150.996 Y140.051 E.0148
G2 X150.095 Y140.051 I-.452 J1.327 E.02487
G2 X151.246 Y138.061 I-32.512 J-20.149 E.06229
G2 X152.251 Y138.782 I1.049 J-.401 E.03548
G2 X157.268 Y135.301 I-.489 J-6.06 E.17337
G3 X158.104 Y133.713 I13.338 J6.009 E.04866
G1 X158.522 Y133.361 E.0148
G1 X158.94 Y133.287 E.01151
G3 X163.958 Y136.769 I-.489 J6.06 E.17337
G2 X164.794 Y138.357 I13.335 J-6.008 E.04866
G1 X165.212 Y138.708 E.0148
G1 X165.63 Y138.782 E.01151
G2 X167.797 Y138.166 I-.747 J-6.74 E.06133
G2 X169.214 Y131.775 I-40.02 J-12.223 E.17757
G3 X165.63 Y128.611 I1.662 J-5.494 E.1336
G2 X164.794 Y127.023 I-13.336 J6.008 E.04866
G1 X164.376 Y126.672 E.0148
G1 X163.958 Y126.597 E.01151
G2 X158.94 Y130.079 I.489 J6.06 E.17337
G3 X158.104 Y131.667 I-13.336 J-6.008 E.04866
G1 X157.686 Y132.018 E.0148
G1 X157.268 Y132.093 E.01151
G3 X153.766 Y130.644 I.778 J-6.838 E.10402
G2 X154.163 Y124.901 I-24.974 J-4.61 E.15634
G2 X157.268 Y121.921 I-2.34 J-5.545 E.11924
G3 X158.104 Y120.333 I13.338 J6.009 E.04866
G1 X158.522 Y119.982 E.0148
G1 X158.94 Y119.908 E.01151
G3 X163.958 Y123.389 I-.489 J6.06 E.17337
G2 X164.794 Y124.977 I13.335 J-6.008 E.04866
G1 X165.212 Y125.329 E.0148
G1 X165.63 Y125.403 E.01151
G2 X169.545 Y123.556 I-.623 J-6.393 E.11963
G2 X168.895 Y118.283 I-42.534 J2.565 E.14405
G3 X165.63 Y115.231 I2.217 J-5.644 E.12403
G2 X164.794 Y113.643 I-13.336 J6.008 E.04866
G1 X164.376 Y113.292 E.0148
G1 X163.958 Y113.218 E.01151
G2 X158.94 Y116.699 I.489 J6.06 E.17337
G3 X158.104 Y118.287 I-13.336 J-6.008 E.04866
G1 X157.686 Y118.639 E.0148
G1 X157.268 Y118.713 E.01151
G3 X152.251 Y115.231 I.489 J-6.06 E.17337
G2 X151.414 Y113.643 I-13.338 J6.009 E.04866
G1 X150.996 Y113.292 E.0148
G1 X150.879 Y113.271 E.00322
G2 X150.029 Y111.843 I-15.08 J8.006 E.04506
G1 X148.352 Y109.886 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422076
G1 F11605.716
G2 X145.551 Y107.106 I-138.072 J136.288 E.09978
G1 X144.603 Y106.267 E.03199
G1 X143.615 Y105.477 E.03197
G1 X142.818 Y104.901 E.02486
G1 X149.096 Y111.178 E.2244
G1 X149.616 Y111.936 E.02323
G1 X150.114 Y112.745 E.02401
G1 X141.255 Y103.886 E.3167
G1 X140.434 Y103.407 E.02401
G1 X140.006 Y103.185 E.01219
G1 X150.825 Y114.004 E.38674
G1 X151.362 Y115.09 E.03062
G1 X138.905 Y102.633 E.4453
G1 X137.933 Y102.208 E.02682
G1 X151.792 Y116.067 E.49541
G1 X152.148 Y116.973 E.02459
G1 X137.027 Y101.852 E.54052
G2 X136.174 Y101.546 I-3.536 J8.535 E.02294
G1 X152.454 Y117.826 E.58197
G1 X152.708 Y118.629 E.02128
G1 X135.371 Y101.292 E.61975
G1 X134.613 Y101.082 E.01989
G1 X152.918 Y119.387 E.65436
G1 X153.108 Y120.126 E.01928
G1 X133.874 Y100.892 E.68756
G1 X133.178 Y100.744 E.01797
G1 X153.256 Y120.822 E.7177
G1 X153.388 Y121.502 E.01753
G1 X132.497 Y100.611 E.74678
G1 X131.844 Y100.506 E.01673
G1 X153.494 Y122.156 E.77391
G1 X153.583 Y122.794 E.01628
G1 X131.206 Y100.417 E.7999
G1 X130.589 Y100.349 E.01569
G1 X153.651 Y123.411 E.8244
G3 X153.707 Y124.015 I-6.124 J.869 E.01534
G1 X129.982 Y100.29 E.84809
G1 X129.397 Y100.253 E.01481
G1 X153.743 Y124.599 E.87028
G1 X153.772 Y125.177 E.01462
G1 X128.828 Y100.232 E.89167
G1 X128.262 Y100.214 E.01433
G1 X153.779 Y125.732 E.91217
G1 X153.786 Y126.287 E.01403
G1 X127.72 Y100.221 E.93178
G1 X127.178 Y100.228 E.01369
G1 X153.768 Y126.817 E.95049
G1 X153.748 Y127.346 E.01338
G1 X126.656 Y100.253 E.96848
G1 X126.139 Y100.285 E.01308
G1 X153.716 Y127.862 E.98577
G1 X153.672 Y128.367 E.01281
G1 X125.63 Y100.324 E1.00242
G1 X125.136 Y100.379 E.01255
G1 X153.627 Y128.87 E1.01847
G1 X153.562 Y129.353 E.01232
G1 X124.643 Y100.434 E1.03377
G1 X124.165 Y100.505 E.0122
G1 X153.496 Y129.836 E1.04848
G1 X153.421 Y130.309 E.01211
G1 X123.693 Y100.581 E1.06269
G1 X123.223 Y100.659 E.01204
G1 X153.335 Y130.771 E1.07641
G1 X153.249 Y131.234 E.01189
G1 X122.771 Y100.755 E1.08951
G1 X122.318 Y100.851 E.01169
G1 X153.148 Y131.681 E1.10208
M73 P47 R23
G1 X153.043 Y132.124 E.01151
G1 X121.871 Y100.952 E1.1143
G1 X121.432 Y101.062 E.01143
G1 X152.938 Y132.567 E1.12621
G1 X152.815 Y132.993 E.01119
G1 X121.007 Y101.185 E1.13701
G1 X120.582 Y101.308 E.01119
G1 X152.692 Y133.418 E1.1478
G1 X152.566 Y133.841 E.01115
G1 X120.159 Y101.434 E1.15843
G1 X119.751 Y101.574 E.01091
G1 X152.426 Y134.249 E1.168
G1 X152.285 Y134.657 E.01091
G1 X119.343 Y101.715 E1.17757
G2 X118.939 Y101.858 I1.259 J4.195 E.01086
G1 X152.143 Y135.062 E1.18694
G1 X151.99 Y135.458 E.01072
G1 X118.547 Y102.015 E1.19548
G1 X118.155 Y102.171 E.01066
G1 X151.829 Y135.845 E1.20373
G1 X151.665 Y136.229 E.01056
G1 X117.766 Y102.331 E1.21174
G1 X117.39 Y102.503 E.01046
G1 X151.5 Y136.613 E1.21931
G1 X151.325 Y136.986 E.01042
G1 X117.014 Y102.676 E1.22649
G1 X116.64 Y102.85 E.01043
G1 X151.145 Y137.355 E1.23344
G1 X150.965 Y137.723 E.01037
G1 X116.279 Y103.037 E1.23992
G1 X115.918 Y103.225 E.01028
G1 X150.777 Y138.083 E1.24609
G1 X150.582 Y138.437 E.0102
G1 X115.557 Y103.412 E1.25202
G1 X115.211 Y103.614 E.01014
G1 X150.388 Y138.791 E1.25745
G1 X150.186 Y139.138 E.01014
G1 X114.865 Y103.816 E1.26264
G1 X114.518 Y104.018 E.01014
G1 X149.977 Y139.477 E1.26755
G1 X149.768 Y139.816 E.01007
G1 X114.184 Y104.232 E1.27202
G1 X113.852 Y104.448 E.01002
G1 X149.555 Y140.152 E1.27629
G1 X149.332 Y140.477 E.00997
G1 X113.52 Y104.664 E1.28019
G1 X113.197 Y104.89 E.00995
G1 X149.109 Y140.802 E1.28375
G1 X148.885 Y141.127 E.00996
G1 X112.878 Y105.12 E1.28712
G1 X112.56 Y105.35 E.00993
G1 X148.648 Y141.438 E1.29003
G1 X148.411 Y141.749 E.00989
G1 X112.248 Y105.586 E1.29273
G1 X111.942 Y105.829 E.00986
G1 X148.174 Y142.061 E1.29517
G1 X147.926 Y142.361 E.00984
G1 X111.567 Y106.002 E1.29971
G1 X111.476 Y106.002 E.00231
G1 X109.186 Y104.169 E.07414
G1 X147.676 Y142.659 E1.37588
G1 X147.425 Y142.957 E.00984
G1 X106.44 Y101.971 E1.46509
G1 X103.693 Y99.773 E.08891
G1 X147.167 Y143.247 E1.55403
G1 X146.903 Y143.531 E.00981
G1 X100.947 Y97.575 E1.64277
G1 X99.065 Y96.069 E.06094
G1 X98.976 Y96.153 E.00308
G1 X146.638 Y143.815 E1.70377
G1 X146.37 Y144.095 E.0098
G1 X98.701 Y96.426 E1.70402
G1 X98.427 Y96.7 E.0098
G1 X146.093 Y144.366 E1.7039
G1 X145.815 Y144.637 E.0098
G1 X98.154 Y96.975 E1.70374
G1 X97.886 Y97.256 E.0098
G1 X145.537 Y144.907 E1.70335
G1 X145.246 Y145.164 E.00982
G1 X97.619 Y97.537 E1.70251
G2 X97.355 Y97.822 I5.641 J5.492 E.00981
G1 X144.955 Y145.422 E1.70154
G1 X144.664 Y145.679 E.00982
G1 X97.094 Y98.109 E1.70045
G1 X96.834 Y98.397 E.00981
G1 X144.362 Y145.925 E1.69899
G1 X144.057 Y146.169 E.00986
G1 X96.579 Y98.691 E1.6972
G1 X96.325 Y98.985 E.00983
G1 X143.753 Y146.413 E1.69539
G1 X143.441 Y146.649 E.00989
G1 X96.073 Y99.282 E1.69324
G1 X95.826 Y99.583 E.00985
G1 X143.123 Y146.879 E1.6907
G1 X142.804 Y147.109 E.00993
G1 X95.579 Y99.884 E1.68816
G2 X95.336 Y100.19 I6.081 J5.076 E.00987
G1 X142.483 Y147.336 E1.68533
G1 X142.154 Y147.556 E.00999
G1 X95.096 Y100.498 E1.68217
G2 X94.856 Y100.806 I6.11 J5.004 E.00988
G1 X141.817 Y147.768 E1.67873
G1 X141.478 Y147.977 E.01007
G1 X94.622 Y101.121 E1.67495
G1 X94.389 Y101.436 E.00991
G1 X141.139 Y148.186 E1.67117
G3 X140.794 Y148.389 I-2.943 J-4.611 E.01013
G1 X94.158 Y101.753 E1.66706
G1 X93.932 Y102.075 E.00995
G1 X140.444 Y148.587 E1.66265
G3 X140.083 Y148.775 I-2.718 J-4.786 E.01028
G1 X93.705 Y102.397 E1.65786
G2 X93.484 Y102.725 I6.554 J4.653 E.00999
G1 X139.722 Y148.962 E1.65284
G1 X139.361 Y149.15 E.01028
G1 X104.854 Y114.642 E1.23351
G1 X104.675 Y115.012 E.01037
G1 X138.987 Y149.324 E1.22654
G1 X138.611 Y149.496 E.01046
G1 X104.501 Y115.386 E1.21933
G1 X104.336 Y115.77 E.01056
G1 X138.235 Y149.668 E1.21176
G1 X137.849 Y149.831 E.01058
G1 X104.171 Y116.154 E1.20387
G1 X104.012 Y116.542 E.01062
G1 X137.458 Y149.988 E1.19559
G1 X137.058 Y150.137 E.01078
G1 X103.863 Y116.942 E1.18662
G1 X103.714 Y117.342 E.01078
G1 X136.658 Y150.286 E1.17764
G1 X136.253 Y150.429 E.01086
G1 X103.571 Y117.747 E1.16827
G1 X103.439 Y118.163 E.01104
G1 X135.837 Y150.561 E1.1581
G1 X135.42 Y150.693 E.01104
G1 X103.307 Y118.58 E1.14793
G1 X103.183 Y119.004 E.01117
G1 X134.996 Y150.817 E1.13722
G1 X134.562 Y150.931 E.01134
G1 X103.069 Y119.437 E1.1258
G1 X102.954 Y119.871 E.01134
G1 X134.129 Y151.046 E1.11437
G1 X133.683 Y151.149 E.01155
G1 X102.848 Y120.314 E1.10225
G1 X102.751 Y120.765 E.01166
G1 X133.231 Y151.245 E1.08955
G1 X132.778 Y151.34 E.01169
G1 X102.665 Y121.227 E1.07644
G1 X102.579 Y121.69 E.01189
G1 X132.308 Y151.419 E1.06273
G1 X131.836 Y151.495 E.01209
G1 X102.504 Y122.163 E1.04852
G1 X102.438 Y122.646 E.01232
G1 X131.359 Y151.566 E1.03381
G1 X130.865 Y151.621 E.01255
G1 X102.373 Y123.128 E1.01851
G1 X102.328 Y123.632 E.01278
G1 X130.372 Y151.676 E1.00247
G1 X129.866 Y151.719 E.01282
G1 X102.284 Y124.137 E.98596
G1 X102.252 Y124.652 E.01306
G1 X129.35 Y151.751 E.9687
G1 X128.823 Y151.772 E.01333
G1 X102.232 Y125.181 E.95055
G2 X102.214 Y125.711 I7.191 J.516 E.0134
G1 X128.282 Y151.779 E.93185
G1 X127.74 Y151.786 E.01369
G1 X102.214 Y126.259 E.91248
G2 X102.232 Y126.826 I7.708 J.028 E.01435
G1 X127.174 Y151.768 E.89156
G1 X126.604 Y151.747 E.0144
G1 X102.253 Y127.396 E.87046
G1 X102.295 Y127.986 E.01495
G1 X126.014 Y151.705 E.84788
G1 X125.414 Y151.653 E.01522
G1 X102.347 Y128.586 E.82459
G1 X102.413 Y129.2 E.01563
G1 X124.794 Y151.582 E.80006
G1 X124.16 Y151.496 E.01619
G1 X102.506 Y129.842 E.77405
G1 X102.611 Y130.495 E.01673
G1 X123.502 Y151.386 E.74678
G1 X122.828 Y151.261 E.01732
G1 X102.744 Y131.176 E.71795
G1 X102.891 Y131.872 E.01797
G1 X122.12 Y151.101 E.68738
G1 X121.399 Y150.929 E.01874
G1 X103.081 Y132.61 E.65481
M73 P48 R23
G1 X103.291 Y133.369 E.01988
G1 X120.627 Y150.705 E.61971
G3 X119.825 Y150.451 I2.178 J-8.287 E.02126
G1 X103.545 Y134.171 E.58196
G1 X103.838 Y135.013 E.02253
G1 X118.987 Y150.161 E.54151
G1 X118.073 Y149.796 E.02488
G1 X104.204 Y135.927 E.49578
G2 X104.636 Y136.907 I16.667 J-6.757 E.02708
G1 X117.087 Y149.357 E.44507
G1 X116.688 Y149.175 E.01107
G3 X116.012 Y148.831 I6.679 J-13.972 E.01919
G1 X105.173 Y137.992 E.38746
G1 X105.883 Y139.251 E.03652
G1 X114.749 Y148.117 E.31693
G1 X114.471 Y147.954 E.00815
G1 X113.187 Y147.102 E.03895
G1 X106.9 Y140.816 E.22471
G1 X107.478 Y141.616 E.02493
G1 X108.267 Y142.603 E.03194
G1 X109.106 Y143.552 E.03203
G2 X111.903 Y146.368 I116.201 J-112.629 E.10031
G1 X129.82 Y84.429 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
M73 P48 R22
G2 X128.158 Y84.392 I-1.394 J25.1 E.04506
G3 X125.491 Y85.264 I-3.154 J-5.13 E.07673
G3 X124.481 Y84.532 I.05 J-1.133 E.03582
G2 X111.731 Y87.695 I3.749 J42.381 E.35738
G1 X112.112 Y88.472 E.02345
G2 X117.129 Y91.954 I5.506 J-2.579 E.17337
G1 X117.547 Y91.88 E.01151
G1 X117.965 Y91.528 E.0148
G2 X118.802 Y89.94 I-12.5 J-7.596 E.04866
G3 X123.819 Y86.459 I5.506 J2.579 E.17337
G1 X124.237 Y86.533 E.01151
G1 X124.655 Y86.884 E.0148
G3 X125.491 Y88.472 I-12.502 J7.597 E.04866
G2 X130.509 Y91.954 I5.506 J-2.579 E.17337
G1 X130.927 Y91.88 E.01151
G1 X131.345 Y91.528 E.0148
G2 X132.181 Y89.94 I-12.5 J-7.596 E.04866
G3 X137.199 Y86.459 I5.506 J2.579 E.17337
G1 X137.617 Y86.533 E.01151
G1 X138.035 Y86.884 E.0148
G3 X138.871 Y88.472 I-12.502 J7.597 E.04866
G2 X143.888 Y91.954 I5.506 J-2.579 E.17337
G1 X144.306 Y91.88 E.01151
G1 X144.725 Y91.528 E.0148
G1 X145.143 Y90.793 E.02291
G3 X146.361 Y88.653 I11.217 J4.967 E.06685
G2 X144.854 Y87.951 I-21.33 J43.833 E.04505
G1 X140.599 Y103.041 F30000
G1 F10826.06
G2 X139.117 Y102.289 I-11.014 J19.876 E.04506
G2 X138.035 Y100.264 I-94.73 J49.29 E.06222
G1 X137.617 Y99.913 E.0148
G1 X137.199 Y99.838 E.01151
G2 X134.603 Y100.665 I.493 J6.037 E.07445
G2 X124.412 Y100.059 I-6.605 J25.099 E.27845
G2 X123.819 Y99.838 I-.488 J.404 E.01795
G2 X121.11 Y100.738 I.486 J5.991 E.07809
G2 X113.779 Y104.018 I6.956 J25.384 E.21849
G3 X111.694 Y100.999 I5.068 J-5.729 E.10039
G1 X111.276 Y100.264 E.02291
G1 X110.858 Y99.913 E.0148
G1 X110.439 Y99.838 E.01151
G2 X106.608 Y101.593 I.637 J6.453 E.1163
G1 X101.639 Y97.616 E.17245
G2 X103.75 Y95.162 I-3.031 J-4.742 E.08896
G3 X104.586 Y93.574 I13.338 J6.009 E.04866
G1 X105.004 Y93.223 E.0148
G1 X105.422 Y93.148 E.01151
G3 X110.439 Y96.63 I-.489 J6.06 E.17337
G2 X111.276 Y98.218 I13.335 J-6.008 E.04866
G1 X111.694 Y98.569 E.0148
G1 X112.112 Y98.644 E.01151
G2 X117.129 Y95.162 I-.489 J-6.06 E.17337
G3 X117.965 Y93.574 I13.338 J6.009 E.04866
G1 X118.384 Y93.223 E.0148
G1 X118.802 Y93.148 E.01151
G3 X123.819 Y96.63 I-.489 J6.06 E.17337
G2 X124.655 Y98.218 I13.335 J-6.008 E.04866
G1 X125.073 Y98.569 E.0148
G1 X125.491 Y98.644 E.01151
G2 X130.509 Y95.162 I-.489 J-6.06 E.17337
G3 X131.345 Y93.574 I13.338 J6.009 E.04866
G1 X131.763 Y93.223 E.0148
G1 X132.181 Y93.148 E.01151
G3 X137.199 Y96.63 I-.489 J6.06 E.17337
G2 X138.035 Y98.218 I13.335 J-6.008 E.04866
G1 X138.453 Y98.569 E.0148
G1 X138.871 Y98.644 E.01151
G2 X143.888 Y95.162 I-.489 J-6.06 E.17337
G3 X144.725 Y93.574 I13.338 J6.009 E.04866
G1 X145.143 Y93.223 E.0148
G1 X145.561 Y93.148 E.01151
G3 X150.578 Y96.63 I-.489 J6.06 E.17337
G2 X151.414 Y98.218 I13.335 J-6.008 E.04866
G1 X151.832 Y98.569 E.0148
G1 X152.251 Y98.644 E.01151
G2 X156.807 Y95.967 I-.523 J-6.109 E.14805
G3 X161.132 Y100.814 I-31.774 J32.702 E.17615
G2 X158.94 Y103.32 I2.964 J4.803 E.09157
G3 X158.104 Y104.908 I-13.336 J-6.008 E.04866
G1 X157.686 Y105.259 E.0148
G1 X157.268 Y105.333 E.01151
G3 X152.251 Y101.852 I.489 J-6.06 E.17337
G2 X151.414 Y100.264 I-13.338 J6.009 E.04866
G1 X150.996 Y99.913 E.0148
G1 X150.578 Y99.838 E.01151
G2 X145.561 Y103.32 I.489 J6.06 E.17337
G3 X144.725 Y104.908 I-13.336 J-6.008 E.04866
G1 X144.306 Y105.259 E.0148
G1 X144.043 Y105.306 E.00725
G2 X145.561 Y106.528 I13.597 J-15.332 E.05282
G3 X150.578 Y110.01 I-.489 J6.06 E.17337
G2 X151.414 Y111.598 I13.335 J-6.008 E.04866
G1 X151.832 Y111.949 E.0148
G1 X152.251 Y112.023 E.01151
G2 X157.268 Y108.542 I-.489 J-6.06 E.17337
G3 X158.104 Y106.954 I13.338 J6.009 E.04866
G1 X158.522 Y106.602 E.0148
G1 X158.94 Y106.528 E.01151
G3 X163.958 Y110.01 I-.489 J6.06 E.17337
G2 X164.794 Y111.598 I13.335 J-6.008 E.04866
G1 X165.212 Y111.949 E.0148
G1 X165.63 Y112.023 E.01151
G2 X167.082 Y111.7 I-.297 J-4.749 E.04047
G2 X166.479 Y110.151 I-42.345 J15.597 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X167.082 Y111.7 E-.63174
G1 X166.76 Y111.802 E-.12827
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/58
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.2 I-.997 J-.697 P1  F30000
G1 X127.486 Y167.97 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.206 Y104.08 I.513 J-41.969 E2.39757
G1 X105.036 Y114.349 E.44529
G2 X111.6 Y106.147 I22.962 J11.65 E4.09704
G1 X98.77 Y95.879 E.44529
G3 X129.16 Y84.045 I29.233 J30.134 E.9076
G3 X127.546 Y167.971 I-1.162 J41.956 E3.55376
G1 X127.481 Y168.383 F30000
G1 F9000
G3 X92.101 Y103.464 I.519 J-42.383 E2.43392
G1 X105.561 Y114.236 E.46715
G2 X111.605 Y106.684 I22.436 J11.762 E4.04925
G1 X98.145 Y95.912 E.46715
G3 X129.171 Y83.63 I29.841 J30.055 E.92935
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.541 Y168.384 I-1.171 J42.37 E3.58896
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.786 E.00001
G3 X116.082 Y84.903 I.515 J-42.785 E3.06325
G3 X129.181 Y83.229 I11.926 J41.237 E.33332
G3 X128.525 Y168.786 I-1.19 J42.772 E3.33621
G1 X127.536 Y168.787 E.02488
; WIPE_START
M204 S10000
G1 X127.476 Y168.786 E-.02285
G1 X126.425 Y168.761 E-.3993
G1 X125.537 Y168.717 E-.33786
; WIPE_END
G1 E-.04 F1800
G1 X126.13 Y167.573 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X124.471 Y167.468 I1.319 J-33.811 E.04505
G2 X123.819 Y167.069 I-.858 J.669 E.02116
G2 X122.264 Y167.219 I-.469 J3.263 E.04275
G3 X120.622 Y166.957 I4.538 J-33.608 E.04505
G1 X106.326 Y161.526 F30000
G1 F10826.06
G3 X104.925 Y160.631 I24.016 J-39.133 E.04505
G3 X105.422 Y160.379 I.585 J.537 E.01545
G3 X109.603 Y162.128 I.25 J5.274 E.12694
G3 X110.817 Y163.904 I-12.091 J9.573 E.05833
G2 X113.647 Y165.063 I28.111 J-64.573 E.08287
G2 X116.293 Y163.459 I-1.275 J-5.088 E.0851
G2 X117.965 Y160.953 I-16.452 J-12.789 E.08172
G3 X118.802 Y160.379 I1.184 J.828 E.02809
G3 X122.983 Y162.128 I.25 J5.274 E.12694
G3 X124.655 Y164.635 I-16.448 J12.786 E.08172
G2 X125.491 Y165.209 I1.184 J-.828 E.02809
G2 X129.673 Y163.459 I.25 J-5.274 E.12694
G2 X131.345 Y160.953 I-16.455 J-12.791 E.08172
G3 X132.181 Y160.379 I1.184 J.828 E.02809
G3 X136.362 Y162.128 I.25 J5.274 E.12694
G3 X138.035 Y164.635 I-16.45 J12.788 E.08172
G2 X138.871 Y165.209 I1.184 J-.828 E.02809
G2 X143.052 Y163.459 I.25 J-5.274 E.12694
G2 X144.725 Y160.953 I-16.455 J-12.791 E.08172
G3 X145.561 Y160.379 I1.184 J.828 E.02809
G3 X149.315 Y161.742 I.298 J5.031 E.11128
G2 X154.657 Y157.958 I-21.433 J-35.922 E.17757
G3 X153.087 Y156.77 I2.051 J-4.343 E.05374
G3 X151.414 Y154.263 I16.45 J-12.788 E.08172
G2 X150.578 Y153.689 I-1.184 J.828 E.02809
G2 X146.397 Y155.439 I-.25 J5.274 E.12694
G2 X144.725 Y157.945 I16.449 J12.787 E.08172
G3 X143.888 Y158.519 I-1.184 J-.828 E.02809
G3 X139.707 Y156.77 I-.25 J-5.274 E.12694
G3 X138.035 Y154.263 I16.45 J-12.788 E.08172
G2 X137.199 Y153.689 I-1.184 J.828 E.02809
G2 X133.017 Y155.439 I-.25 J5.274 E.12694
G2 X131.345 Y157.945 I16.449 J12.787 E.08172
G3 X130.509 Y158.519 I-1.184 J-.828 E.02809
G3 X126.328 Y156.77 I-.25 J-5.274 E.12694
G3 X124.655 Y154.263 I16.453 J-12.79 E.08172
G2 X123.819 Y153.689 I-1.184 J.828 E.02809
G2 X119.638 Y155.439 I-.25 J5.274 E.12694
G2 X117.965 Y157.945 I16.452 J12.789 E.08172
G3 X117.129 Y158.519 I-1.184 J-.828 E.02809
G3 X112.948 Y156.77 I-.25 J-5.274 E.12694
G3 X111.276 Y154.263 I16.453 J-12.79 E.08172
G2 X110.439 Y153.689 I-1.184 J.828 E.02809
G2 X106.258 Y155.439 I-.25 J5.274 E.12694
G2 X104.586 Y157.945 I16.452 J12.789 E.08172
G3 X103.75 Y158.519 I-1.184 J-.828 E.02809
G3 X101.572 Y158.146 I-.326 J-4.637 E.06044
G3 X98.71 Y155.562 I26.565 J-32.305 E.10451
G1 X97.896 Y154.263 E.04154
G2 X96.93 Y153.687 I-1.169 J.861 E.0313
G3 X95.85 Y152.423 I35.119 J-31.096 E.04505
G1 X88.598 Y139.396 F30000
G1 F10826.06
G3 X88.095 Y137.811 I32.012 J-11.035 E.04505
G2 X90.37 Y135.528 I-2.976 J-5.24 E.0884
G1 X91.206 Y134.194 E.04267
G3 X92.043 Y133.62 I1.184 J.828 E.02809
G3 X94.551 Y134.121 I.301 J5.018 E.07009
G3 X97.06 Y136.541 I-2.805 J5.418 E.09578
G1 X97.896 Y137.876 E.04267
G2 X98.732 Y138.45 I1.184 J-.828 E.02809
G2 X101.241 Y137.948 I.301 J-5.019 E.07009
G2 X103.719 Y135.575 I-2.741 J-5.344 E.09429
G3 X102.525 Y131.685 I24.568 J-9.671 E.11039
G3 X98.732 Y128.839 I1.16 J-5.496 E.13264
G1 X97.896 Y127.504 E.04268
G2 X97.06 Y126.93 I-1.184 J.828 E.02809
G2 X94.551 Y127.432 I-.301 J5.018 E.07009
G2 X92.043 Y129.851 I2.805 J5.418 E.09578
G1 X91.206 Y131.186 E.04267
G3 X90.37 Y131.76 I-1.184 J-.828 E.02809
G3 X87.861 Y131.258 I-.301 J-5.018 E.07009
G3 X86.617 Y130.399 I1.431 J-3.401 E.04128
G3 X86.396 Y125.036 I46.839 J-4.614 E.14551
G2 X90.37 Y122.149 I-.996 J-5.549 E.13772
G1 X91.206 Y120.814 E.04267
G3 X92.043 Y120.24 I1.184 J.828 E.02809
G3 X94.551 Y120.742 I.301 J5.018 E.07009
G3 X97.06 Y123.162 I-2.805 J5.418 E.09578
G1 X97.896 Y124.496 E.04267
G2 X98.732 Y125.07 I1.184 J-.828 E.02809
G2 X101.963 Y124.146 I.277 J-5.139 E.09275
G3 X103.032 Y118.392 I28.092 J2.242 E.15887
G1 X102.913 Y118.394 E.0032
G3 X98.732 Y115.459 I.847 J-5.653 E.14349
G1 X97.896 Y114.125 E.04268
G2 X97.06 Y113.55 I-1.184 J.828 E.02809
G2 X94.551 Y114.052 I-.301 J5.019 E.07009
G2 X92.043 Y116.472 I2.805 J5.418 E.09578
G1 X91.206 Y117.806 E.04267
G3 X90.37 Y118.381 I-1.184 J-.828 E.02809
G3 X87.256 Y117.524 I-.317 J-4.937 E.08916
G3 X89.69 Y109.744 I41.062 J8.576 E.22125
G2 X91.206 Y107.435 I-17.86 J-13.382 E.0749
G3 X92.043 Y106.86 I1.184 J.828 E.02809
G3 X94.551 Y107.362 I.301 J5.018 E.07009
G3 X97.06 Y109.782 I-2.805 J5.418 E.09578
G1 X97.896 Y111.117 E.04267
G2 X98.732 Y111.691 I1.184 J-.828 E.02809
G2 X100.755 Y111.378 I.332 J-4.543 E.05594
G1 X99.457 Y110.339 E.04505
; WIPE_START
G1 X100.755 Y111.378 E-.63181
G1 X100.43 Y111.467 E-.12819
; WIPE_END
G1 E-.04 F1800
G1 X102.219 Y118.887 Z2.36 F30000
G1 X107.971 Y142.744 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F10826.06
G3 X106.946 Y141.436 I17.24 J-14.564 E.04506
G1 X106.258 Y142.059 E.02514
G2 X104.586 Y144.565 I16.452 J12.789 E.08172
G3 X103.75 Y145.14 I-1.184 J-.828 E.02809
G3 X99.569 Y143.39 I-.25 J-5.274 E.12694
G3 X97.896 Y140.884 I16.453 J-12.79 E.08172
G2 X97.06 Y140.309 I-1.184 J.828 E.02809
G2 X92.879 Y142.059 I-.25 J5.274 E.12694
G2 X91.206 Y144.565 I16.452 J12.789 E.08172
G1 X90.901 Y144.855 E.0114
G2 X92.069 Y146.999 I97.338 J-51.614 E.06614
G3 X96.224 Y148.749 I.226 J5.271 E.12623
G3 X97.896 Y151.255 I-16.448 J12.786 E.08172
G2 X98.732 Y151.83 I1.184 J-.828 E.02809
G2 X102.913 Y150.08 I.25 J-5.274 E.12694
G2 X104.586 Y147.573 I-16.452 J-12.789 E.08172
G3 X105.422 Y146.999 I1.184 J.828 E.02809
G3 X109.603 Y148.749 I.25 J5.274 E.12694
G3 X111.276 Y151.255 I-16.448 J12.786 E.08172
G2 X112.112 Y151.83 I1.184 J-.828 E.02809
G2 X116.711 Y149.551 I.263 J-5.25 E.1453
G2 X118.241 Y150.207 I154.989 J-359.191 E.0451
; WIPE_START
G1 X116.711 Y149.551 E-.63244
G1 X116.503 Y149.814 E-.12756
; WIPE_END
G1 E-.04 F1800
G1 X124.124 Y150.233 Z2.36 F30000
G1 X135.887 Y150.88 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F10826.06
G2 X137.455 Y150.33 I-4.811 J-16.239 E.04506
G1 X138.035 Y151.255 E.02957
G2 X138.871 Y151.83 I1.184 J-.828 E.02809
G2 X143.052 Y150.08 I.25 J-5.274 E.12694
G2 X144.725 Y147.573 I-16.455 J-12.791 E.08172
G3 X145.561 Y146.999 I1.184 J.828 E.02809
G3 X149.742 Y148.749 I.25 J5.274 E.12694
G3 X151.414 Y151.255 I-16.45 J12.788 E.08172
G2 X152.251 Y151.83 I1.184 J-.828 E.02809
G2 X156.432 Y150.08 I.25 J-5.274 E.12694
G2 X158.104 Y147.573 I-16.455 J-12.791 E.08172
G3 X158.94 Y146.999 I1.184 J.828 E.02809
G3 X162.95 Y148.593 I.275 J5.148 E.12063
G2 X166.047 Y142.859 I-35.202 J-22.716 E.17677
G3 X164.794 Y140.884 I57.816 J-38.058 E.06339
G2 X163.958 Y140.309 I-1.184 J.828 E.02809
G2 X159.777 Y142.059 I-.25 J5.274 E.12694
G2 X158.104 Y144.565 I16.449 J12.787 E.08172
G3 X157.268 Y145.14 I-1.184 J-.828 E.02809
G3 X153.087 Y143.39 I-.25 J-5.274 E.12694
G3 X151.414 Y140.884 I16.45 J-12.788 E.08172
G2 X150.578 Y140.309 I-1.184 J.828 E.02809
G1 X149.843 Y140.298 E.01993
G2 X151.32 Y137.725 I-66.27 J-39.765 E.08039
G2 X152.251 Y138.45 I1.575 J-1.063 E.03249
G2 X156.432 Y136.7 I.25 J-5.274 E.12694
G2 X158.104 Y134.194 I-16.455 J-12.791 E.08172
G3 X158.94 Y133.62 I1.184 J.828 E.02809
G3 X163.121 Y135.369 I.25 J5.274 E.12694
G3 X164.794 Y137.876 I-16.45 J12.787 E.08172
G2 X165.63 Y138.45 I1.184 J-.828 E.02809
G2 X167.826 Y138.069 I.325 J-4.653 E.06098
G2 X169.233 Y131.642 I-40.214 J-12.172 E.17849
G3 X166.466 Y130.011 I1.147 J-5.109 E.08846
G3 X164.794 Y127.504 I16.45 J-12.788 E.08172
G2 X163.958 Y126.93 I-1.184 J.828 E.02809
G2 X159.777 Y128.679 I-.25 J5.274 E.12694
G2 X158.104 Y131.186 I16.449 J12.787 E.08172
G3 X157.268 Y131.76 I-1.184 J-.828 E.02809
G3 X153.699 Y130.565 I-.295 J-5.045 E.10451
G2 X154.078 Y124.833 I-30.785 J-4.914 E.15589
G2 X156.432 Y123.321 I-1.902 J-5.549 E.07655
G2 X158.104 Y120.814 I-16.453 J-12.79 E.08172
G3 X158.94 Y120.24 I1.184 J.828 E.02809
G3 X163.121 Y121.99 I.25 J5.274 E.12694
G3 X164.794 Y124.496 I-16.452 J12.789 E.08172
G2 X165.63 Y125.07 I1.184 J-.828 E.02809
G2 X169.545 Y123.562 I.286 J-5.092 E.11717
G2 X168.871 Y118.163 I-42.226 J2.53 E.14753
G3 X166.466 Y116.631 I1.88 J-5.605 E.07803
G3 X164.794 Y114.125 I16.448 J-12.786 E.08172
G2 X163.958 Y113.55 I-1.184 J.828 E.02809
G2 X159.777 Y115.3 I-.25 J5.274 E.12694
G2 X158.104 Y117.806 I16.451 J12.788 E.08172
G3 X157.268 Y118.381 I-1.184 J-.828 E.02809
G3 X153.087 Y116.631 I-.25 J-5.274 E.12694
G3 X151.414 Y114.125 I16.448 J-12.786 E.08172
G1 X151.083 Y113.81 E.01238
G2 X150.257 Y112.367 I-15.097 J7.687 E.04506
; WIPE_START
G1 X151.083 Y113.81 E-.63164
G1 X151.328 Y114.042 E-.12836
; WIPE_END
G1 E-.04 F1800
G1 X145.967 Y108.609 Z2.36 F30000
G1 X140.527 Y103.095 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F10826.06
G2 X139.043 Y102.344 I-10.932 J19.759 E.04506
G3 X138.035 Y100.745 I46.877 J-30.676 E.05124
G2 X137.199 Y100.171 I-1.184 J.828 E.02809
G2 X134.69 Y100.672 I-.301 J5.019 E.07009
G1 X134.573 Y100.741 E.00367
G2 X123.932 Y100.219 I-6.597 J25.745 E.29065
G1 X123.819 Y100.171 E.00333
G2 X120.999 Y100.855 I-.42 J4.424 E.08009
G2 X113.866 Y104.057 I7.036 J25.214 E.21267
G1 X113.784 Y104.009 E.00257
G3 X112.112 Y102.08 I4.138 J-5.276 E.06962
G1 X111.276 Y100.745 E.04268
G2 X110.439 Y100.171 I-1.184 J.828 E.02809
G2 X107.931 Y100.672 I-.301 J5.019 E.07009
G2 X106.553 Y101.653 I1.652 J3.779 E.04614
G1 X101.536 Y97.637 E.17415
G2 X103.75 Y95.39 I-3.032 J-5.202 E.08649
G1 X104.586 Y94.055 E.04267
G3 X105.422 Y93.481 I1.184 J.828 E.02809
G3 X107.931 Y93.983 I.301 J5.018 E.07009
G3 X110.439 Y96.402 I-2.805 J5.418 E.09578
G1 X111.276 Y97.737 E.04267
G2 X112.112 Y98.311 I1.184 J-.828 E.02809
G2 X114.621 Y97.81 I.301 J-5.018 E.07009
G2 X117.129 Y95.39 I-2.805 J-5.418 E.09578
G1 X117.965 Y94.055 E.04267
G3 X118.802 Y93.481 I1.184 J.828 E.02809
G3 X121.31 Y93.983 I.301 J5.018 E.07009
G3 X123.819 Y96.402 I-2.805 J5.418 E.09578
G1 X124.655 Y97.737 E.04267
G2 X125.491 Y98.311 I1.184 J-.828 E.02809
G2 X128 Y97.81 I.301 J-5.018 E.07009
G2 X130.509 Y95.39 I-2.805 J-5.418 E.09578
G1 X131.345 Y94.055 E.04267
G3 X132.181 Y93.481 I1.184 J.828 E.02809
G3 X134.69 Y93.983 I.301 J5.018 E.07009
G3 X137.199 Y96.402 I-2.805 J5.418 E.09578
G1 X138.035 Y97.737 E.04267
G2 X138.871 Y98.311 I1.184 J-.828 E.02809
G2 X141.38 Y97.81 I.301 J-5.018 E.07009
G2 X143.888 Y95.39 I-2.805 J-5.418 E.09578
G1 X144.725 Y94.055 E.04267
G3 X145.561 Y93.481 I1.184 J.828 E.02809
G3 X148.069 Y93.983 I.301 J5.018 E.07009
G3 X150.578 Y96.402 I-2.805 J5.418 E.09578
G1 X151.414 Y97.737 E.04267
G2 X152.251 Y98.311 I1.184 J-.828 E.02809
G2 X154.759 Y97.81 I.301 J-5.018 E.07009
G2 X156.86 Y96.017 I-2.184 J-4.687 E.07574
G3 X161.155 Y100.845 I-31.835 J32.645 E.17523
G2 X158.94 Y103.092 I3.032 J5.202 E.0865
G1 X158.104 Y104.427 E.04267
G3 X157.268 Y105.001 I-1.184 J-.828 E.02809
G3 X154.759 Y104.499 I-.301 J-5.018 E.07009
G3 X152.251 Y102.08 I2.805 J-5.418 E.09578
G1 X151.414 Y100.745 E.04268
G2 X150.578 Y100.171 I-1.184 J.828 E.02809
G2 X148.069 Y100.672 I-.301 J5.019 E.07009
G2 X145.561 Y103.092 I2.805 J5.418 E.09578
G1 X144.725 Y104.427 E.04267
G3 X143.511 Y105.007 I-1.139 J-.823 E.03801
G3 X145.753 Y106.857 I-17.215 J23.141 E.07881
G3 X148.069 Y107.362 I.139 J4.931 E.06488
G3 X150.578 Y109.782 I-2.805 J5.418 E.09578
G1 X151.414 Y111.117 E.04267
G2 X152.251 Y111.691 I1.184 J-.828 E.02809
G2 X154.759 Y111.189 I.301 J-5.018 E.07009
G2 X157.268 Y108.769 I-2.805 J-5.418 E.09578
G1 X158.104 Y107.435 E.04267
G3 X158.94 Y106.86 I1.184 J.828 E.02809
G3 X161.449 Y107.362 I.301 J5.018 E.07009
G3 X163.958 Y109.782 I-2.805 J5.418 E.09578
G1 X164.794 Y111.117 E.04267
G2 X165.63 Y111.691 I1.184 J-.828 E.02809
G2 X167.037 Y111.574 I.464 J-2.941 E.03862
G2 X166.427 Y110.027 I-48.116 J18.063 E.04505
G1 X144.816 Y87.934 F30000
G1 F10826.06
G3 X146.323 Y88.634 I-20.969 J47.147 E.04505
G2 X144.725 Y91.047 I16.881 J12.92 E.07851
G3 X143.888 Y91.621 I-1.184 J-.828 E.02809
G3 X141.38 Y91.12 I-.301 J-5.018 E.07009
G3 X138.871 Y88.7 I2.805 J-5.418 E.09578
G1 X138.035 Y87.365 E.04268
G2 X137.199 Y86.791 I-1.184 J.828 E.02809
G2 X134.69 Y87.293 I-.301 J5.019 E.07009
G2 X132.181 Y89.713 I2.805 J5.418 E.09578
G1 X131.345 Y91.047 E.04267
G3 X130.509 Y91.621 I-1.184 J-.828 E.02809
G3 X128 Y91.12 I-.301 J-5.018 E.07009
G3 X125.491 Y88.7 I2.805 J-5.418 E.09578
G1 X124.655 Y87.365 E.04268
G2 X123.819 Y86.791 I-1.184 J.828 E.02809
G2 X121.31 Y87.293 I-.301 J5.019 E.07009
G2 X118.802 Y89.713 I2.805 J5.418 E.09578
G1 X117.965 Y91.047 E.04267
G3 X117.129 Y91.621 I-1.184 J-.828 E.02809
G3 X114.621 Y91.12 I-.301 J-5.018 E.07009
G3 X112.112 Y88.7 I2.805 J-5.418 E.09578
G1 X111.535 Y87.779 E.02946
G3 X124.813 Y84.507 I16.481 J38.311 E.37224
G2 X125.491 Y84.932 I.905 J-.692 E.02216
G2 X128 Y84.43 I.301 J-5.018 E.07009
G1 X128.067 Y84.391 E.00211
G3 X129.729 Y84.425 I.303 J25.234 E.04506
; WIPE_START
G1 X128.067 Y84.391 E-.63173
G1 X128 Y84.43 E-.02959
G1 X127.758 Y84.524 E-.09868
; WIPE_END
G1 E-.04 F1800
G1 X130.327 Y91.711 Z2.36 F30000
G1 X148.008 Y141.171 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X143.171 Y146.008 E.17197
M204 S10000
G1 X141.401 Y147.232 F30000
G1 F11668.197
M204 S2000
G1 X149.232 Y139.401 E.27844
M204 S10000
G1 X150.018 Y138.07 F30000
G1 F11668.197
M204 S2000
G1 X140.07 Y148.017 E.35368
M204 S10000
G1 X138.945 Y148.598 F30000
G1 F11668.197
M204 S2000
G1 X150.598 Y136.945 E.41434
G1 X151.058 Y135.939
G1 X137.939 Y149.058 E.46646
G1 X137.02 Y149.431
G1 X151.431 Y135.02 E.51239
G1 X151.747 Y134.16
G1 X136.16 Y149.747 E.5542
G1 X135.354 Y150.006
G1 X152.006 Y133.354 E.59207
G1 X152.228 Y132.587
G1 X134.587 Y150.228 E.62725
G1 X133.853 Y150.417
G1 X152.417 Y131.853 E.66007
G1 X152.575 Y131.149
G1 X133.149 Y150.575 E.69069
G1 X132.472 Y150.707
G1 X152.707 Y130.472 E.71944
G1 X152.816 Y129.818
G1 X131.818 Y150.816 E.7466
G1 X131.183 Y150.905
G1 X152.905 Y129.183 E.77234
G1 X152.976 Y128.567
G1 X130.567 Y150.976 E.79678
G1 X129.967 Y151.031
G1 X153.031 Y127.967 E.82005
G1 X153.07 Y127.382
G1 X129.382 Y151.07 E.84223
G1 X128.811 Y151.095
M73 P49 R22
G1 X153.095 Y126.811 E.86342
G1 X153.108 Y126.254
G1 X128.254 Y151.108 E.88369
G1 X127.708 Y151.108
G1 X153.108 Y125.708 E.90308
G1 X153.095 Y125.176
G1 X127.176 Y151.095 E.92157
G1 X126.653 Y151.072
G1 X153.072 Y124.653 E.93931
G1 X153.039 Y124.141
G1 X126.141 Y151.039 E.95635
G1 X125.638 Y150.996
G1 X152.996 Y123.638 E.97274
G1 X152.945 Y123.143
G1 X125.143 Y150.946 E.98851
G1 X124.658 Y150.886
G1 X152.886 Y122.658 E1.00365
G1 X152.816 Y122.182
G1 X124.182 Y150.816 E1.01809
G1 X123.714 Y150.739
G1 X152.739 Y121.714 E1.032
G1 X152.655 Y121.252
G1 X123.252 Y150.655 E1.04543
G1 X122.797 Y150.565
G1 X152.565 Y120.797 E1.05838
G1 X152.465 Y120.352
G1 X122.352 Y150.465 E1.07066
G1 X121.913 Y150.358
G1 X152.358 Y119.913 E1.08251
G1 X152.247 Y119.479
G1 X121.479 Y150.247 E1.09395
G1 X121.052 Y150.128
G1 X152.128 Y119.052 E1.10494
G1 X152.002 Y118.632
G1 X120.632 Y150.002 E1.11537
G1 X120.218 Y149.871
G1 X151.871 Y118.218 E1.12544
G1 X151.735 Y117.809
G1 X119.809 Y149.735 E1.13517
G1 X119.407 Y149.592
G1 X151.592 Y117.407 E1.14434
G1 X151.443 Y117.01
G1 X119.01 Y149.443 E1.15316
G1 X118.618 Y149.29
G1 X151.29 Y116.618 E1.16167
G1 X151.13 Y116.232
G1 X118.232 Y149.13 E1.1697
G1 X117.852 Y148.965
G1 X150.965 Y115.852 E1.17736
G1 X150.796 Y115.475
G1 X117.475 Y148.796 E1.18474
G1 X117.105 Y148.621
G1 X150.621 Y115.105 E1.19168
G1 X150.441 Y114.74
G1 X116.74 Y148.441 E1.19826
G1 X116.378 Y148.257
G1 X150.257 Y114.378 E1.20458
G1 X150.067 Y114.023
G1 X116.023 Y148.067 E1.21046
G1 X115.672 Y147.873
G1 X149.873 Y113.672 E1.21602
G1 X149.675 Y113.324
G1 X115.324 Y147.675 E1.22133
G1 X114.983 Y147.47
G1 X149.47 Y112.983 E1.22619
G1 X149.262 Y112.646
G1 X114.646 Y147.262 E1.23078
G1 X114.312 Y147.051
G1 X149.051 Y112.312 E1.23513
G1 X148.832 Y111.985
G1 X113.985 Y146.832 E1.239
G1 X113.661 Y146.611
G1 X148.611 Y111.661 E1.24264
G1 X148.386 Y111.341
G1 X113.341 Y146.385 E1.24601
G1 X113.027 Y146.154
G1 X148.154 Y111.027 E1.24897
G1 X147.92 Y110.716
G1 X112.716 Y145.92 E1.25171
G1 X112.409 Y145.681
G1 X147.681 Y110.409 E1.25411
G1 X147.438 Y110.107
G1 X112.107 Y145.438 E1.25617
G1 X111.808 Y145.191
G1 X147.191 Y109.808 E1.25804
G1 X146.939 Y109.516
G1 X111.516 Y144.939 E1.25947
G1 X111.226 Y144.683
G1 X146.683 Y109.226 E1.26067
G1 X146.423 Y108.94
G1 X110.94 Y144.423 E1.26162
G1 X110.66 Y144.158
G1 X146.158 Y108.66 E1.26214
G1 X145.89 Y108.383
G1 X110.383 Y143.89 E1.26248
G1 X110.11 Y143.617
G1 X145.617 Y108.11 E1.26248
G1 X145.34 Y107.842
G1 X109.842 Y143.34 E1.26214
G1 X109.577 Y143.06
G1 X145.06 Y107.577 E1.26162
G1 X144.774 Y107.317
G1 X109.317 Y142.774 E1.26067
G1 X109.061 Y142.484
G1 X144.484 Y107.061 E1.25947
G1 X144.191 Y106.809
G1 X108.809 Y142.191 E1.25804
G1 X108.562 Y141.892
G1 X143.892 Y106.562 E1.25617
G1 X143.591 Y106.319
G1 X108.319 Y141.591 E1.2541
G1 X108.08 Y141.284
G1 X143.284 Y106.08 E1.25171
G1 X142.973 Y105.846
G1 X107.846 Y140.973 E1.24896
G1 X107.614 Y140.659
G1 X142.659 Y105.614 E1.24601
G1 X142.339 Y105.389
G1 X107.389 Y140.339 E1.24265
G1 X107.168 Y140.015
G1 X142.015 Y105.168 E1.23899
G1 X141.688 Y104.949
G1 X106.949 Y139.688 E1.23513
G1 X106.738 Y139.354
G1 X141.354 Y104.738 E1.23078
G1 X141.017 Y104.53
G1 X106.53 Y139.017 E1.22619
G1 X106.325 Y138.675
G1 X140.676 Y104.325 E1.22133
G1 X140.328 Y104.127
G1 X106.127 Y138.328 E1.21601
G1 X105.933 Y137.977
G1 X139.977 Y103.933 E1.21046
G1 X139.622 Y103.743
G1 X105.743 Y137.622 E1.20458
G1 X105.559 Y137.26
G1 X139.26 Y103.559 E1.19826
G1 X138.895 Y103.379
G1 X105.379 Y136.895 E1.19168
G1 X105.204 Y136.525
G1 X138.525 Y103.204 E1.18474
G1 X138.148 Y103.035
G1 X105.035 Y136.148 E1.17736
G1 X104.87 Y135.768
G1 X137.768 Y102.87 E1.1697
G1 X137.382 Y102.71
G1 X104.71 Y135.382 E1.16167
G1 X104.557 Y134.99
G1 X136.99 Y102.557 E1.15316
G1 X136.593 Y102.408
G1 X104.408 Y134.593 E1.14434
G1 X104.264 Y134.191
G1 X136.191 Y102.265 E1.13517
G1 X135.782 Y102.129
G1 X104.129 Y133.782 E1.12544
G1 X103.998 Y133.367
G1 X135.368 Y101.998 E1.11537
G1 X134.948 Y101.872
G1 X103.872 Y132.948 E1.10494
G1 X103.753 Y132.521
G1 X134.521 Y101.753 E1.09395
G1 X134.087 Y101.642
G1 X103.641 Y132.087 E1.08251
G1 X103.535 Y131.648
G1 X133.648 Y101.535 E1.07066
G1 X133.203 Y101.435
G1 X103.435 Y131.203 E1.05838
G1 X103.345 Y130.748
G1 X132.748 Y101.345 E1.04543
G1 X132.286 Y101.261
G1 X103.261 Y130.286 E1.032
G1 X103.184 Y129.818
G1 X131.818 Y101.184 E1.01808
G1 X131.342 Y101.114
G1 X103.114 Y129.342 E1.00364
G1 X103.054 Y128.857
G1 X130.857 Y101.054 E.98851
G1 X130.362 Y101.004
G1 X103.004 Y128.362 E.97274
M73 P50 R22
G1 X102.961 Y127.859
G1 X129.859 Y100.961 E.95635
G1 X129.346 Y100.928
G1 X102.928 Y127.346 E.93931
G1 X102.905 Y126.824
G1 X128.824 Y100.905 E.92156
G1 X128.292 Y100.892
G1 X102.892 Y126.292 E.90307
G1 X102.892 Y125.746
G1 X127.746 Y100.892 E.88368
G1 X127.188 Y100.905
G1 X102.905 Y125.188 E.86341
G1 X102.93 Y124.618
G1 X126.618 Y100.93 E.84222
G1 X126.033 Y100.969
G1 X102.969 Y124.033 E.82004
G1 X103.024 Y123.433
G1 X125.433 Y101.024 E.79678
G1 X124.817 Y101.095
G1 X103.095 Y122.817 E.77233
G1 X103.184 Y122.182
G1 X124.182 Y101.184 E.74659
G1 X123.527 Y101.293
G1 X103.293 Y121.527 E.71943
G1 X103.425 Y120.85
G1 X122.85 Y101.425 E.69068
G1 X122.147 Y101.583
G1 X103.583 Y120.147 E.66006
G1 X103.772 Y119.413
G1 X121.413 Y101.772 E.62724
G1 X120.645 Y101.994
G1 X103.994 Y118.646 E.59206
G1 X104.253 Y117.84
G1 X119.84 Y102.253 E.55419
G1 X118.979 Y102.569
G1 X104.569 Y116.979 E.51238
G1 X104.942 Y116.061
G1 X118.061 Y102.942 E.46644
G1 X117.055 Y103.402
G1 X105.402 Y115.055 E.41432
G1 X105.786 Y114.126
G1 X115.929 Y103.983 E.36064
M204 S10000
G1 X114.599 Y104.768 F30000
G1 F11668.197
M204 S2000
G1 X105.484 Y113.883 E.32409
G1 X105.181 Y113.641
G1 X112.828 Y105.993 E.27192
M204 S10000
G1 X111.436 Y106.84 F30000
G1 F11668.197
M204 S2000
G1 X104.878 Y113.398 E.23319
G1 X104.575 Y113.156
G1 X111.133 Y106.597 E.23319
G1 X110.83 Y106.355
G1 X104.272 Y112.913 E.23319
G1 X103.969 Y112.671
G1 X110.527 Y106.112 E.23319
G1 X110.224 Y105.87
G1 X103.666 Y112.428 E.23319
M73 P50 R21
G1 X103.363 Y112.186
G1 X109.922 Y105.627 E.23319
G1 X109.619 Y105.385
G1 X103.06 Y111.943 E.23319
G1 X102.757 Y111.701
G1 X109.316 Y105.142 E.23319
G1 X109.013 Y104.9
G1 X102.454 Y111.459 E.23319
G1 X102.151 Y111.216
G1 X108.71 Y104.657 E.23319
G1 X108.407 Y104.415
G1 X101.848 Y110.974 E.23319
G1 X101.545 Y110.731
G1 X108.104 Y104.173 E.23319
G1 X107.801 Y103.93
G1 X101.242 Y110.489 E.23319
G1 X100.939 Y110.246
G1 X107.498 Y103.688 E.23319
G1 X107.195 Y103.445
G1 X100.636 Y110.004 E.23319
G1 X100.333 Y109.761
G1 X106.892 Y103.203 E.23319
G1 X106.589 Y102.96
G1 X100.03 Y109.519 E.23319
G1 X99.727 Y109.276
G1 X106.286 Y102.718 E.23319
G1 X105.983 Y102.475
G1 X99.425 Y109.034 E.23319
G1 X99.122 Y108.792
G1 X105.68 Y102.233 E.23319
G1 X105.377 Y101.99
G1 X98.819 Y108.549 E.23319
G1 X98.516 Y108.307
G1 X105.074 Y101.748 E.23319
G1 X104.771 Y101.506
G1 X98.213 Y108.064 E.23319
G1 X97.91 Y107.822
G1 X104.468 Y101.263 E.23319
G1 X104.166 Y101.021
G1 X97.607 Y107.579 E.23319
G1 X97.304 Y107.337
G1 X103.863 Y100.778 E.23319
G1 X103.56 Y100.536
G1 X97.001 Y107.094 E.23319
G1 X96.698 Y106.852
G1 X103.257 Y100.293 E.23319
G1 X102.954 Y100.051
G1 X96.395 Y106.609 E.23319
G1 X96.092 Y106.367
G1 X102.651 Y99.808 E.23319
G1 X102.348 Y99.566
G1 X95.789 Y106.124 E.2332
G1 X95.486 Y105.882
G1 X102.045 Y99.323 E.23319
G1 X101.742 Y99.081
G1 X95.183 Y105.64 E.23319
G1 X94.88 Y105.397
G1 X101.439 Y98.838 E.23319
G1 X101.136 Y98.596
G1 X94.577 Y105.155 E.23319
G1 X94.274 Y104.912
G1 X100.833 Y98.354 E.23319
G1 X100.53 Y98.111
G1 X93.972 Y104.67 E.23319
G1 X93.669 Y104.427
G1 X100.227 Y97.869 E.23319
G1 X99.924 Y97.626
G1 X93.366 Y104.185 E.2332
G1 X93.063 Y103.942
G1 X99.621 Y97.384 E.2332
G1 X99.318 Y97.141
G1 X92.76 Y103.7 E.2332
G1 X92.457 Y103.457
G1 X99.015 Y96.899 E.23319
G1 X98.712 Y96.656
G1 X92.154 Y103.215 E.2332
; WIPE_START
M204 S10000
G1 X93.568 Y101.801 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.85 Y101.974 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X98.41 Y96.414 E.19768
G1 X98.107 Y96.171
G1 X94.313 Y99.965 E.1349
; WIPE_START
M204 S10000
G1 X95.727 Y98.551 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.864 Y101.257 Z2.36 F30000
G1 X113.7 Y105.364 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101075
G1 F18000
G1 X113.508 Y105.525 E.00109
; LINE_WIDTH: 0.142005
G1 X113.317 Y105.686 E.00176
; LINE_WIDTH: 0.17958
G1 X113.104 Y105.87 E.00267
; LINE_WIDTH: 0.213797
G1 X112.89 Y106.055 E.0033
G1 X115.224 Y104.387 F30000
; LINE_WIDTH: 0.098599
G1 F18000
G1 X115.102 Y104.482 E.00065
; LINE_WIDTH: 0.134578
G1 X114.98 Y104.577 E.00101
; LINE_WIDTH: 0.170557
G1 X114.858 Y104.672 E.00137
; LINE_WIDTH: 0.205904
G1 X114.661 Y104.83 E.00282
G1 X116.454 Y103.703 F30000
; LINE_WIDTH: 0.103125
G1 F18000
G1 X116.3 Y103.817 E.00086
; LINE_WIDTH: 0.14813
G1 X116.146 Y103.931 E.00142
; LINE_WIDTH: 0.193135
G1 X115.992 Y104.045 E.00198
G1 X118.485 Y102.764 F30000
; LINE_WIDTH: 0.101386
G1 F18000
G1 X118.365 Y102.845 E.00063
; LINE_WIDTH: 0.143082
G1 X118.245 Y102.925 E.00102
; LINE_WIDTH: 0.184777
G1 X118.125 Y103.006 E.00142
; WIPE_START
G1 X118.245 Y102.925 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.323 Y105.781 Z2.36 F30000
G1 X151.113 Y116.188 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0984451
G1 F18000
G1 X151.05 Y116.096 E.00047
G1 X151.064 Y116.027 E.00029
; WIPE_START
G1 X151.05 Y116.096 E-.29415
G1 X151.113 Y116.188 E-.46585
; WIPE_END
G1 E-.04 F1800
G1 X151.161 Y123.821 Z2.36 F30000
G1 X151.236 Y135.515 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.101607
G1 F18000
G1 X151.155 Y135.635 E.00063
; LINE_WIDTH: 0.143572
G1 X151.075 Y135.755 E.00103
; LINE_WIDTH: 0.185537
G1 X150.995 Y135.876 E.00142
G1 X150.297 Y137.546 F30000
; LINE_WIDTH: 0.103122
G1 F18000
G1 X150.183 Y137.7 E.00086
; LINE_WIDTH: 0.14813
G1 X150.069 Y137.854 E.00142
; LINE_WIDTH: 0.193139
G1 X149.955 Y138.008 E.00198
G1 X149.613 Y138.776 F30000
; LINE_WIDTH: 0.0986136
G1 F18000
G1 X149.518 Y138.898 E.00065
; LINE_WIDTH: 0.134591
G1 X149.423 Y139.02 E.00101
; LINE_WIDTH: 0.170568
G1 X149.328 Y139.142 E.00137
; LINE_WIDTH: 0.205918
G1 X149.17 Y139.339 E.00282
G1 X148.636 Y140.3 F30000
; LINE_WIDTH: 0.101083
G1 F18000
G1 X148.475 Y140.491 E.00109
; LINE_WIDTH: 0.142018
G1 X148.314 Y140.683 E.00176
; LINE_WIDTH: 0.179602
G1 X148.13 Y140.896 E.00267
; LINE_WIDTH: 0.21381
G1 X147.946 Y141.109 E.0033
G1 X146.34 Y143.143 F30000
; LINE_WIDTH: 0.0892389
G1 F18000
G3 X145.143 Y144.34 I-38.86 J-37.663 E.00606
G1 X143.109 Y145.946 F30000
; LINE_WIDTH: 0.213795
G1 F18000
G1 X142.896 Y146.13 E.0033
; LINE_WIDTH: 0.179589
G1 X142.683 Y146.314 E.00267
; LINE_WIDTH: 0.142026
G1 X142.491 Y146.475 E.00176
; LINE_WIDTH: 0.101081
G1 X142.3 Y146.636 E.00109
G1 X141.339 Y147.17 F30000
; LINE_WIDTH: 0.205986
G1 F18000
G1 X141.142 Y147.327 E.00282
; LINE_WIDTH: 0.170692
G1 X141.02 Y147.423 E.00138
; LINE_WIDTH: 0.134659
G1 X140.898 Y147.518 E.00101
; LINE_WIDTH: 0.0986255
G1 X140.776 Y147.613 E.00065
G1 X140.008 Y147.955 F30000
; LINE_WIDTH: 0.193136
G1 F18000
G1 X139.854 Y148.069 E.00198
; LINE_WIDTH: 0.148131
G1 X139.7 Y148.183 E.00142
; LINE_WIDTH: 0.103126
G1 X139.546 Y148.297 E.00086
G1 X138.881 Y148.535 F30000
; LINE_WIDTH: 0.188892
G1 F18000
G1 X138.747 Y148.629 E.00165
; LINE_WIDTH: 0.145573
G1 X138.613 Y148.724 E.00119
; LINE_WIDTH: 0.102255
G1 X138.479 Y148.818 E.00073
; WIPE_START
G1 X138.613 Y148.724 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.253 Y143.29 Z2.36 F30000
G1 X105.465 Y115.118 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.188896
G1 F18000
G1 X105.371 Y115.253 E.00165
; LINE_WIDTH: 0.145582
G1 X105.276 Y115.387 E.00119
; LINE_WIDTH: 0.102268
G1 X105.182 Y115.521 E.00073
; WIPE_START
G1 X105.276 Y115.387 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.09 Y109.787 Z2.36 F30000
G1 X92.912 Y102.035 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.201608
G1 F18000
G1 X92.73 Y102.257 E.00313
; LINE_WIDTH: 0.153211
G1 X92.548 Y102.479 E.00222
; LINE_WIDTH: 0.104814
G1 X92.366 Y102.7 E.00132
; WIPE_START
G1 X92.548 Y102.479 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.374 Y100.027 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.220514
G1 F18000
G1 X94.168 Y100.26 E.00377
; LINE_WIDTH: 0.186405
G1 X93.975 Y100.484 E.00293
; LINE_WIDTH: 0.14409
G1 X93.782 Y100.707 E.00211
; LINE_WIDTH: 0.101774
G1 X93.589 Y100.931 E.0013
; WIPE_START
G1 X93.782 Y100.707 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.902 Y95.983 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.196651
G1 F18000
G2 X96.844 Y97.058 I43.254 J43.583 E.01596
; LINE_WIDTH: 0.167077
G1 X96.484 Y97.436 E.00452
; LINE_WIDTH: 0.141441
G1 X96.124 Y97.815 E.00365
; LINE_WIDTH: 0.104623
G1 X95.664 Y98.309 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X96.124 Y97.815 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/58
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.36 I-1.111 J.497 P1  F30000
G1 X127.486 Y167.97 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X92.595 Y103.461 I.515 J-41.969 E2.4173
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X129.127 Y84.045 I29.749 J29.608 E.92648
G3 X127.546 Y167.971 I-1.126 J41.957 E3.5548
G1 X127.481 Y168.386 F30000
G1 F9000
G3 X92.492 Y102.847 I.516 J-42.385 E2.45397
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X129.137 Y83.629 I30.375 J29.594 E.9482
G3 X127.541 Y168.387 I-1.14 J42.372 E3.58983
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.783 E.00008
G3 X92.402 Y102.262 I.524 J-42.784 E2.3092
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X129.147 Y83.228 I30.948 J29.497 E.89917
G3 X128.525 Y168.783 I-1.147 J42.771 E3.33744
G1 X127.536 Y168.787 E.02487
; WIPE_START
M204 S10000
G1 X127.476 Y168.783 E-.02286
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.33786
; WIPE_END
G1 E-.04 F1800
G1 X125.608 Y167.548 Z2.52 F30000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X123.95 Y167.417 I2.843 J-46.809 E.04505
G1 X123.819 Y167.345 E.00406
G1 X122.983 Y167.23 E.02287
G3 X122.399 Y167.239 I-.309 J-1.058 E.016
G3 X121.036 Y167.028 I3.624 J-27.908 E.03739
G1 X106.578 Y161.677 F30000
G1 F10826.06
G3 X105.169 Y160.795 I24.072 J-39.974 E.04505
G1 X105.422 Y160.655 E.00783
G1 X106.258 Y160.54 E.02287
G3 X109.603 Y162.066 I-.324 J5.14 E.10186
G3 X111.081 Y164.021 I-15.289 J13.096 E.06645
G2 X113.419 Y164.979 I17.779 J-40.027 E.06847
G2 X116.293 Y163.522 I-.693 J-4.931 E.08891
G2 X117.965 Y161.292 I-17.454 J-14.829 E.07559
G3 X118.802 Y160.655 I1.572 J1.198 E.02882
G1 X119.638 Y160.54 E.02287
G3 X122.983 Y162.066 I-.324 J5.14 E.10186
G3 X124.655 Y164.296 I-17.451 J14.827 E.07559
G2 X125.491 Y164.932 I1.572 J-1.198 E.02882
G1 X126.328 Y165.048 E.02287
G2 X129.673 Y163.522 I-.324 J-5.14 E.10186
G2 X131.345 Y161.292 I-17.454 J-14.829 E.07559
G3 X132.181 Y160.655 I1.572 J1.198 E.02882
G1 X133.017 Y160.54 E.02287
G3 X136.362 Y162.066 I-.324 J5.14 E.10186
G3 X138.035 Y164.296 I-17.451 J14.827 E.07559
M73 P51 R21
G2 X138.871 Y164.932 I1.572 J-1.198 E.02882
G1 X139.707 Y165.048 E.02287
G2 X143.052 Y163.522 I-.324 J-5.14 E.10186
G2 X144.725 Y161.292 I-17.454 J-14.829 E.07559
G3 X145.561 Y160.655 I1.572 J1.198 E.02882
G1 X146.397 Y160.54 E.02287
G3 X149.335 Y161.73 I-.297 J4.955 E.08742
G2 X154.694 Y157.928 I-21.481 J-35.955 E.17822
G3 X153.087 Y156.833 I1.833 J-4.416 E.05306
G3 X151.414 Y154.602 I17.455 J-14.83 E.07559
G2 X150.578 Y153.966 I-1.572 J1.198 E.02882
G1 X149.742 Y153.85 E.02287
G2 X146.397 Y155.376 I.324 J5.14 E.10186
G2 X144.725 Y157.606 I17.453 J14.828 E.07559
G3 X143.888 Y158.243 I-1.572 J-1.198 E.02882
G1 X143.052 Y158.358 E.02287
G3 X139.707 Y156.833 I.324 J-5.141 E.10186
G3 X138.035 Y154.602 I17.455 J-14.83 E.07559
G2 X137.199 Y153.966 I-1.572 J1.198 E.02882
G1 X136.362 Y153.85 E.02287
G2 X133.017 Y155.376 I.324 J5.14 E.10186
G2 X131.345 Y157.606 I17.453 J14.828 E.07559
G3 X130.509 Y158.243 I-1.572 J-1.198 E.02882
G1 X129.673 Y158.358 E.02287
G3 X126.328 Y156.833 I.324 J-5.141 E.10186
G3 X124.655 Y154.602 I17.455 J-14.83 E.07559
G2 X123.819 Y153.966 I-1.572 J1.198 E.02882
G1 X122.983 Y153.85 E.02287
G2 X119.638 Y155.376 I.324 J5.14 E.10186
G2 X117.965 Y157.606 I17.453 J14.828 E.07559
G3 X117.129 Y158.243 I-1.572 J-1.198 E.02882
G1 X116.293 Y158.358 E.02287
G3 X112.948 Y156.833 I.324 J-5.141 E.10186
G3 X111.276 Y154.602 I17.455 J-14.83 E.07559
G2 X110.439 Y153.966 I-1.572 J1.198 E.02882
G1 X109.603 Y153.85 E.02287
G2 X106.258 Y155.376 I.324 J5.14 E.10186
G2 X104.586 Y157.606 I17.453 J14.828 E.07559
G3 X103.75 Y158.243 I-1.572 J-1.198 E.02882
G3 X101.42 Y158.021 I-.799 J-3.953 E.06435
G3 X99.675 Y156.492 I29.732 J-35.685 E.06286
G3 X97.896 Y154.602 I7.541 J-8.881 E.07048
G3 X96.205 Y152.852 I8.569 J-9.975 E.06603
G1 X107.905 Y142.792 F30000
G1 F10826.06
G3 X107.158 Y141.858 I27.715 J-22.945 E.03242
G1 X106.88 Y141.483 E.01264
G1 X106.258 Y141.996 E.02184
G2 X104.586 Y144.227 I17.453 J14.828 E.07559
G3 X103.75 Y144.863 I-1.572 J-1.198 E.02882
G1 X102.913 Y144.978 E.02287
G3 X99.569 Y143.453 I.324 J-5.141 E.10186
G3 X97.896 Y141.222 I17.455 J-14.83 E.07559
G2 X97.06 Y140.586 I-1.572 J1.198 E.02882
G1 X96.224 Y140.471 E.02287
G2 X92.879 Y141.996 I.324 J5.14 E.10186
G2 X91.206 Y144.227 I17.453 J14.828 E.07559
G1 X90.789 Y144.632 E.01576
G2 X92.22 Y147.251 I57.976 J-29.973 E.08087
G1 X92.879 Y147.16 E.01802
G3 X96.224 Y148.686 I-.324 J5.14 E.10186
G3 X97.896 Y150.917 I-17.451 J14.827 E.07559
G2 X98.732 Y151.553 I1.572 J-1.198 E.02882
G1 X99.569 Y151.668 E.02287
G2 X102.913 Y150.143 I-.324 J-5.14 E.10186
G2 X104.586 Y147.912 I-17.454 J-14.829 E.07559
G3 X105.422 Y147.276 I1.572 J1.198 E.02882
G1 X106.258 Y147.16 E.02287
G3 X109.603 Y148.686 I-.324 J5.14 E.10186
G3 X111.276 Y150.917 I-17.451 J14.827 E.07559
G2 X112.112 Y151.553 I1.572 J-1.198 E.02882
G1 X112.948 Y151.668 E.02287
G2 X116.708 Y149.625 I-.401 J-5.218 E.11945
G2 X118.231 Y150.29 I7.585 J-15.28 E.04506
; WIPE_START
G1 X116.708 Y149.625 E-.63164
G1 X116.497 Y149.888 E-.12836
; WIPE_END
G1 E-.04 F1800
G1 X124.119 Y150.285 Z2.52 F30000
G1 X136.069 Y150.907 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F10826.06
G2 X137.635 Y150.35 I-4.932 J-16.336 E.04506
G2 X138.871 Y151.553 I2.579 J-1.413 E.04743
G1 X139.707 Y151.668 E.02287
G2 X143.052 Y150.143 I-.324 J-5.14 E.10186
G2 X144.725 Y147.912 I-17.454 J-14.829 E.07559
G3 X145.561 Y147.276 I1.572 J1.198 E.02882
G1 X146.397 Y147.16 E.02287
G3 X149.742 Y148.686 I-.324 J5.14 E.10186
G3 X151.414 Y150.917 I-17.451 J14.827 E.07559
G2 X152.251 Y151.553 I1.572 J-1.198 E.02882
G1 X153.087 Y151.668 E.02287
G2 X156.432 Y150.143 I-.324 J-5.14 E.10186
G2 X158.104 Y147.912 I-17.454 J-14.829 E.07559
G3 X158.94 Y147.276 I1.572 J1.198 E.02882
G1 X159.777 Y147.16 E.02287
G3 X162.97 Y148.561 I-.311 J5.05 E.09647
G2 X166.027 Y142.904 I-35.184 J-22.666 E.17441
G3 X164.794 Y141.222 I13.171 J-10.95 E.05654
G2 X163.958 Y140.586 I-1.572 J1.198 E.02882
G1 X163.121 Y140.471 E.02287
G2 X159.777 Y141.996 I.324 J5.14 E.10186
G2 X158.104 Y144.227 I17.453 J14.828 E.07559
G3 X157.268 Y144.863 I-1.572 J-1.198 E.02882
G1 X156.432 Y144.978 E.02287
G3 X153.087 Y143.453 I.324 J-5.141 E.10186
G3 X151.414 Y141.222 I17.455 J-14.83 E.07559
G2 X150.578 Y140.586 I-1.572 J1.198 E.02882
G1 X149.816 Y140.481 E.02085
G2 X151.474 Y137.595 I-19.504 J-13.127 E.09027
G2 X152.251 Y138.173 I1.437 J-1.119 E.02656
G1 X153.087 Y138.289 E.02287
G2 X156.432 Y136.763 I-.324 J-5.14 E.10186
G2 X158.104 Y134.533 I-17.454 J-14.829 E.07559
G3 X158.94 Y133.896 I1.572 J1.198 E.02882
G1 X159.777 Y133.781 E.02287
G3 X163.121 Y135.306 I-.324 J5.14 E.10186
G3 X164.794 Y137.537 I-17.451 J14.827 E.07559
G2 X165.63 Y138.173 I1.572 J-1.198 E.02882
G2 X167.851 Y137.987 I.795 J-3.856 E.06123
G2 X169.25 Y131.517 I-43.417 J-12.771 E.17954
G3 X166.466 Y130.073 I.785 J-4.919 E.08643
G3 X164.794 Y127.843 I17.452 J-14.828 E.07559
G2 X163.958 Y127.206 I-1.572 J1.198 E.02882
G1 X163.121 Y127.091 E.02287
G2 X159.777 Y128.617 I.324 J5.14 E.10186
G2 X158.104 Y130.847 I17.453 J14.828 E.07559
G3 X157.268 Y131.484 I-1.572 J-1.198 E.02882
G1 X156.432 Y131.599 E.02287
G3 X153.923 Y130.763 I.55 J-5.832 E.07228
G1 X153.768 Y130.635 E.00544
G2 X154.171 Y125.03 I-26.44 J-4.717 E.15257
G1 X154.152 Y124.712 E.00862
G2 X156.432 Y123.384 I-1.577 J-5.327 E.0722
G2 X158.104 Y121.153 I-17.454 J-14.829 E.07559
G3 X158.94 Y120.517 I1.572 J1.198 E.02882
G1 X159.777 Y120.401 E.02287
G3 X163.121 Y121.927 I-.324 J5.14 E.10186
G3 X164.794 Y124.157 I-17.451 J14.827 E.07559
G2 X165.63 Y124.794 I1.572 J-1.198 E.02882
G1 X166.466 Y124.909 E.02287
G2 X169.547 Y123.601 I-.303 J-4.997 E.09247
G2 X168.85 Y118.056 I-41.979 J2.461 E.15155
G3 X166.466 Y116.694 I1.518 J-5.423 E.07515
G3 X164.794 Y114.463 I17.452 J-14.828 E.07559
G2 X163.958 Y113.827 I-1.572 J1.198 E.02882
G1 X163.121 Y113.712 E.02287
G2 X159.777 Y115.237 I.324 J5.14 E.10186
G2 X158.104 Y117.468 I17.453 J14.828 E.07559
G3 X157.268 Y118.104 I-1.572 J-1.198 E.02882
G1 X156.432 Y118.219 E.02287
G3 X153.087 Y116.694 I.324 J-5.141 E.10186
G3 X150.944 Y113.39 I9.797 J-8.699 E.10712
G1 X153.777 Y125.057 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407774
G1 F12050.2
G2 X111.892 Y105.859 I-25.777 J.949 E1.38679
; LINE_WIDTH: 0.417574
G1 F11742.067
G1 X111.775 Y105.939 E.00357
; LINE_WIDTH: 0.40823
G1 F12035.515
G1 X111.657 Y106.02 E.00348
G3 X111.427 Y105.955 I-.054 J-.247 E.00606
G1 X99.118 Y96.103 E.38429
G1 X98.847 Y96.365 E.00918
G1 X111.194 Y106.247 E.38544
; LINE_WIDTH: 0.424566
G1 F11531.661
G1 X111.4 Y106.39 E.0064
; LINE_WIDTH: 0.445047
G1 F10956.608
G1 X111.607 Y106.534 E.00674
G1 X112.113 Y106.157 E.01691
; LINE_WIDTH: 0.407774
G1 F12050.217
G3 X104.172 Y117.148 I15.886 J19.842 E3.55369
G3 X105.154 Y114.855 I38.152 J14.981 E.06073
; LINE_WIDTH: 0.422336
G1 F11597.939
G1 X105.285 Y114.563 E.0081
; LINE_WIDTH: 0.447544
G1 F10890.399
G1 X105.415 Y114.27 E.00863
G1 X105.044 Y113.93 E.01356
; LINE_WIDTH: 0.407801
G1 F12049.32
G1 X92.698 Y104.049 E.385
G1 X92.501 Y104.37 E.00917
G1 X104.811 Y114.222 E.38385
; LINE_WIDTH: 0.424556
G1 F11531.957
G1 X104.866 Y114.3 E.00244
; LINE_WIDTH: 0.446625
G1 F10914.691
G1 X104.922 Y114.378 E.00258
G1 X104.886 Y114.56 E.00496
; LINE_WIDTH: 0.407778
G1 F12050.075
G2 X153.778 Y125.117 I23.115 J11.441 E2.28264
G1 X166.378 Y109.908 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X166.992 Y111.453 I-31.108 J13.261 E.04505
G3 X164.794 Y110.778 I-.57 J-2.062 E.06578
G1 X163.958 Y109.592 E.03932
G2 X159.777 Y107.022 I-4.65 J2.879 E.13791
G2 X158.104 Y107.773 I-.109 J1.994 E.05162
G1 X157.268 Y108.959 E.03932
G3 X153.087 Y111.53 I-4.65 J-2.879 E.13791
G3 X151.414 Y110.778 I-.109 J-1.994 E.05162
G1 X150.578 Y109.592 E.03932
G2 X146.397 Y107.022 I-4.65 J2.879 E.13791
G1 X146.083 Y107.065 E.00858
G2 X143.359 Y104.797 I-16.332 J16.848 E.09613
G2 X144.725 Y104.088 I-.062 J-1.788 E.04309
G1 X145.561 Y102.902 E.03932
G3 X149.742 Y100.332 I4.65 J2.879 E.13791
G3 X151.414 Y101.084 I.109 J1.994 E.05162
G1 X152.251 Y102.27 E.03932
G2 X156.432 Y104.84 I4.65 J-2.879 E.13791
G2 X158.104 Y104.088 I.109 J-1.994 E.05162
G1 X158.94 Y102.902 E.03932
G3 X161.175 Y100.872 I4.973 J3.228 E.08271
G2 X156.893 Y96.049 I-36.148 J27.778 E.17492
G3 X153.087 Y98.15 I-4.21 J-3.128 E.12147
G3 X151.414 Y97.398 I-.109 J-1.994 E.05162
G1 X150.578 Y96.212 E.03932
G2 X146.397 Y93.642 I-4.65 J2.879 E.13791
G2 X144.725 Y94.394 I-.109 J1.994 E.05162
G1 X143.888 Y95.58 E.03932
G3 X139.707 Y98.15 I-4.65 J-2.879 E.13791
G3 X138.035 Y97.398 I-.109 J-1.994 E.05162
G1 X137.199 Y96.212 E.03932
G2 X133.017 Y93.642 I-4.65 J2.879 E.13791
G2 X131.345 Y94.394 I-.109 J1.994 E.05162
G1 X130.509 Y95.58 E.03932
G3 X126.328 Y98.15 I-4.65 J-2.879 E.13791
G3 X124.655 Y97.398 I-.109 J-1.994 E.05162
G1 X123.819 Y96.212 E.03932
G2 X119.638 Y93.642 I-4.65 J2.879 E.13791
G2 X117.965 Y94.394 I-.109 J1.994 E.05162
G1 X117.129 Y95.58 E.03932
G3 X112.948 Y98.15 I-4.65 J-2.879 E.13791
G3 X111.276 Y97.398 I-.109 J-1.994 E.05162
G1 X110.439 Y96.212 E.03932
G2 X106.258 Y93.642 I-4.65 J2.879 E.13791
G2 X104.586 Y94.394 I-.109 J1.994 E.05162
G1 X103.75 Y95.58 E.03932
G3 X101.585 Y97.573 I-4.975 J-3.231 E.08056
G1 X106.593 Y101.581 E.17381
G3 X109.603 Y100.332 I3.309 J3.723 E.08995
G3 X111.276 Y101.084 I.109 J1.994 E.05162
G1 X112.112 Y102.27 E.03932
G2 X113.784 Y104.004 I4.981 J-3.13 E.06575
G3 X134.757 Y100.706 I14.2 J21.963 E.59238
G3 X136.362 Y100.332 I1.885 J4.464 E.04487
G3 X138.035 Y101.084 I.109 J1.994 E.05162
G1 X138.775 Y102.133 E.03481
G3 X140.266 Y102.868 I-8.952 J20.037 E.04505
G1 X144.778 Y87.917 F30000
G1 F10826.06
G3 X146.287 Y88.615 I-22.581 J50.78 E.04505
G2 X144.725 Y90.708 I16.381 J13.857 E.07082
G3 X143.052 Y91.46 I-1.564 J-1.242 E.05162
G3 X138.871 Y88.89 I.469 J-5.449 E.13791
G1 X138.035 Y87.704 E.03932
G2 X136.362 Y86.952 I-1.564 J1.242 E.05162
G2 X132.181 Y89.522 I.469 J5.449 E.13791
G1 X131.345 Y90.708 E.03932
G3 X129.673 Y91.46 I-1.564 J-1.242 E.05162
G3 X125.491 Y88.89 I.469 J-5.449 E.13791
G1 X124.655 Y87.704 E.03932
G2 X122.983 Y86.952 I-1.564 J1.242 E.05162
G2 X118.802 Y89.522 I.469 J5.449 E.13791
G1 X117.965 Y90.708 E.03932
G3 X116.293 Y91.46 I-1.564 J-1.242 E.05162
G3 X112.112 Y88.89 I.469 J-5.449 E.13791
G1 X111.377 Y87.848 E.03454
G3 X125.174 Y84.481 I16.634 J38.2 E.38671
G1 X125.491 Y84.655 E.00982
G2 X127.955 Y84.389 I.805 J-4.092 E.06818
G3 X129.618 Y84.421 I.349 J25.318 E.04506
; WIPE_START
G1 X127.955 Y84.389 E-.63174
G1 X127.635 Y84.494 E-.12826
; WIPE_END
G1 E-.04 F1800
G1 X121.992 Y89.633 Z2.52 F30000
G1 X99.29 Y110.309 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F10826.06
G1 X100.588 Y111.348 E.04505
G3 X99.569 Y111.53 I-1.037 J-2.862 E.02819
G3 X97.896 Y110.778 I-.109 J-1.994 E.05162
G1 X97.06 Y109.592 E.03932
G2 X92.879 Y107.022 I-4.65 J2.879 E.13791
G2 X91.206 Y107.773 I-.109 J1.994 E.05162
G3 X89.634 Y109.879 I-18.052 J-11.841 E.07126
G2 X87.259 Y117.507 I38.615 J16.205 E.2168
G2 X89.534 Y118.219 I2.769 J-4.852 E.06509
G2 X91.206 Y117.468 I.109 J-1.994 E.05162
G1 X92.043 Y116.282 E.03932
G3 X96.224 Y113.712 I4.65 J2.879 E.13791
G3 X97.896 Y114.463 I.109 J1.994 E.05162
G1 X98.732 Y115.649 E.03932
G2 X102.913 Y118.219 I4.65 J-2.879 E.13791
G1 X103.005 Y118.207 E.00251
G2 X101.879 Y124.178 I24.091 J7.637 E.16505
G3 X99.569 Y124.909 I-2.812 J-4.866 E.06618
G3 X97.896 Y124.157 I-.109 J-1.994 E.05162
G1 X97.06 Y122.971 E.03932
G2 X92.879 Y120.401 I-4.65 J2.879 E.13791
G2 X91.206 Y121.153 I-.109 J1.994 E.05162
G3 X89.534 Y123.384 I-19.127 J-12.599 E.07559
G3 X86.4 Y124.878 I-3.598 J-3.512 E.09605
G2 X86.62 Y130.429 I46.73 J.929 E.15061
G2 X89.534 Y131.599 I3.21 J-3.782 E.08657
G2 X91.206 Y130.847 I.109 J-1.994 E.05162
G1 X92.043 Y129.661 E.03932
G3 X96.224 Y127.091 I4.65 J2.879 E.13791
G3 X97.896 Y127.843 I.109 J1.994 E.05162
G2 X99.569 Y130.073 I19.128 J-12.6 E.07559
G2 X102.408 Y131.525 I3.567 J-3.474 E.08796
G2 X103.236 Y134.521 I27.635 J-6.024 E.08427
G1 X103.709 Y135.769 E.03616
G3 X99.569 Y138.289 I-4.601 J-2.898 E.13614
G3 X97.896 Y137.537 I-.109 J-1.994 E.05162
G1 X97.06 Y136.351 E.03932
G2 X92.879 Y133.781 I-4.65 J2.879 E.13791
G2 X91.206 Y134.533 I-.109 J1.994 E.05162
G1 X90.37 Y135.719 E.03932
G3 X88.085 Y137.776 I-4.98 J-3.235 E.08428
G3 X87.647 Y136.172 I43.894 J-12.83 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X88.085 Y137.776 E-.63174
G1 X88.383 Y137.618 E-.12826
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/58
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.52 I-.746 J.961 P1  F30000
G1 X127.486 Y167.967 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.514 J-41.967 E2.41721
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X129.093 Y84.044 I29.749 J29.607 E.92556
G3 X127.546 Y167.968 I-1.093 J41.956 E3.55554
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X92.492 Y102.847 I.515 J-42.384 E2.45394
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X129.103 Y83.628 I30.375 J29.594 E.94728
G3 X127.541 Y168.385 I-1.107 J42.373 E3.59066
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.785 E.00005
G3 X92.402 Y102.262 I.525 J-42.784 E2.30923
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X129.113 Y83.228 I30.947 J29.497 E.89832
G3 X128.525 Y168.785 I-1.113 J42.773 E3.33834
G1 X127.536 Y168.787 E.02488
; WIPE_START
M204 S10000
G1 X127.476 Y168.785 E-.02284
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.33787
; WIPE_END
G1 E-.04 F1800
G1 X129.452 Y162.165 Z2.68 F30000
G1 X136.204 Y150.865 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X137.726 Y150.316 I-15.628 J-45.741 E.04384
G1 X137.767 Y150.299 E.00121
G2 X138.871 Y151.314 I2.843 J-1.982 E.04097
G1 X139.707 Y151.509 E.02327
G2 X143.052 Y150.208 I.041 J-4.844 E.09963
G2 X144.725 Y148.183 I-14.041 J-13.302 E.07121
G3 X145.561 Y147.514 I1.969 J1.603 E.02924
G1 X146.397 Y147.319 E.02327
G3 X149.742 Y148.621 I.041 J4.844 E.09963
G3 X151.414 Y150.645 I-14.037 J13.299 E.07121
G2 X152.251 Y151.314 I1.969 J-1.603 E.02924
G1 X153.087 Y151.509 E.02327
G2 X156.432 Y150.208 I.041 J-4.844 E.09963
G2 X158.104 Y148.183 I-14.041 J-13.302 E.07121
G3 X158.94 Y147.514 I1.969 J1.603 E.02924
G1 X159.777 Y147.319 E.02327
G3 X162.993 Y148.525 I.085 J4.668 E.09532
G2 X165.992 Y142.983 I-35.193 J-22.626 E.17089
G3 X164.794 Y141.494 I10.345 J-9.545 E.05184
G2 X163.958 Y140.824 I-1.969 J1.603 E.02924
G1 X163.121 Y140.63 E.02327
G2 X159.777 Y141.931 I-.041 J4.844 E.09963
G2 X158.104 Y143.956 I14.039 J13.301 E.07121
G3 X157.268 Y144.625 I-1.969 J-1.603 E.02924
G1 X156.432 Y144.82 E.02327
G3 X153.087 Y143.518 I-.041 J-4.844 E.09963
G3 X151.414 Y141.494 I14.039 J-13.3 E.07121
G2 X150.578 Y140.824 I-1.969 J1.603 E.02924
G1 X149.712 Y140.632 E.02404
G2 X151.564 Y137.411 I-19.45 J-13.323 E.10076
G2 X152.251 Y137.935 I1.557 J-1.33 E.02358
G1 X153.087 Y138.13 E.02327
G2 X156.432 Y136.828 I.041 J-4.844 E.09963
G2 X158.104 Y134.804 I-14.041 J-13.302 E.07121
G3 X158.94 Y134.135 I1.969 J1.603 E.02924
G1 X159.777 Y133.94 E.02327
M73 P52 R21
G3 X163.121 Y135.241 I.041 J4.844 E.09963
G3 X164.794 Y137.266 I-14.037 J13.299 E.07121
G2 X165.63 Y137.935 I1.969 J-1.603 E.02924
G2 X167.872 Y137.917 I1.094 J-3.468 E.06177
G2 X169.264 Y131.401 I-43.225 J-12.638 E.18073
G3 X166.466 Y130.139 I.45 J-4.73 E.08469
G3 X164.794 Y128.114 I14.036 J-13.298 E.07121
G2 X163.958 Y127.445 I-1.969 J1.603 E.02924
G1 X163.121 Y127.25 E.02327
G2 X159.777 Y128.551 I-.041 J4.844 E.09963
G2 X158.104 Y130.576 I14.039 J13.301 E.07121
G3 X157.268 Y131.245 I-1.969 J-1.603 E.02924
G1 X156.432 Y131.44 E.02327
G3 X153.766 Y130.647 I-.092 J-4.567 E.07658
G2 X154.147 Y124.63 I-24.754 J-4.586 E.16375
G2 X156.432 Y123.449 I-1.229 J-5.177 E.07041
G2 X158.104 Y121.424 I-14.041 J-13.302 E.07121
G3 X158.94 Y120.755 I1.969 J1.603 E.02924
G1 X159.777 Y120.56 E.02327
G3 X163.121 Y121.862 I.041 J4.844 E.09963
G3 X164.794 Y123.886 I-14.037 J13.299 E.07121
G2 X165.63 Y124.555 I1.969 J-1.603 E.02924
G1 X166.466 Y124.75 E.02327
G2 X169.549 Y123.645 I.089 J-4.602 E.09074
G2 X168.831 Y117.962 I-41.824 J2.398 E.15534
G3 X166.466 Y116.759 I1.179 J-5.244 E.07265
G3 X164.794 Y114.734 I14.036 J-13.298 E.07121
G2 X163.958 Y114.065 I-1.969 J1.603 E.02924
G1 X163.121 Y113.87 E.02327
G2 X159.777 Y115.172 I-.041 J4.844 E.09963
G2 X158.104 Y117.196 I14.039 J13.301 E.07121
G3 X157.268 Y117.866 I-1.969 J-1.603 E.02924
G1 X156.432 Y118.06 E.02327
G3 X153.087 Y116.759 I-.041 J-4.844 E.09963
G3 X151.958 Y115.437 I9.144 J-8.957 E.04714
G2 X151.245 Y113.936 I-41.649 J18.848 E.04505
G1 X153.777 Y125.057 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407775
G1 F12050.165
G2 X111.892 Y105.859 I-25.779 J.953 E1.3867
; LINE_WIDTH: 0.417574
G1 F11742.067
G1 X111.775 Y105.939 E.00357
; LINE_WIDTH: 0.40824
G1 F12035.197
G1 X111.657 Y106.02 E.00348
G3 X111.427 Y105.955 I-.054 J-.248 E.00606
G1 X99.118 Y96.103 E.3843
G1 X98.847 Y96.365 E.00918
G1 X111.194 Y106.247 E.38545
; LINE_WIDTH: 0.424566
G1 F11531.661
G1 X111.4 Y106.39 E.0064
; LINE_WIDTH: 0.445048
G1 F10956.601
G1 X111.607 Y106.534 E.00674
G1 X112.113 Y106.157 E.01691
; LINE_WIDTH: 0.407772
G1 F12050.255
G3 X104.172 Y117.147 I15.885 J19.841 E3.55355
G3 X105.154 Y114.855 I38.143 J14.978 E.06072
; LINE_WIDTH: 0.422336
G1 F11597.939
G1 X105.285 Y114.563 E.0081
; LINE_WIDTH: 0.447542
G1 F10890.462
G1 X105.415 Y114.271 E.00862
G1 X105.044 Y113.93 E.01356
; LINE_WIDTH: 0.407791
G1 F12049.648
G1 X92.698 Y104.049 E.38499
G1 X92.501 Y104.37 E.00916
G1 X104.811 Y114.222 E.38384
; LINE_WIDTH: 0.424556
G1 F11531.957
G1 X104.866 Y114.3 E.00244
; LINE_WIDTH: 0.446628
G1 F10914.59
G1 X104.922 Y114.378 E.00258
G1 X104.886 Y114.56 E.00496
; LINE_WIDTH: 0.407779
G1 F12050.047
G2 X153.778 Y125.117 I23.115 J11.44 E2.28257
G1 X166.33 Y109.792 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X166.947 Y111.336 I-31.085 J13.319 E.04505
G1 X166.466 Y111.371 E.01306
G1 X165.63 Y111.176 E.02327
G1 X165.212 Y110.914 E.01337
G3 X163.958 Y109.424 I4.628 J-5.17 E.05294
G2 X161.449 Y107.465 I-4.741 J3.484 E.08735
G2 X158.94 Y107.376 I-1.384 J3.613 E.06927
G1 X158.522 Y107.638 E.01337
G2 X157.268 Y109.127 I4.628 J5.171 E.05294
G3 X154.759 Y111.087 I-4.741 J-3.483 E.08735
G3 X152.251 Y111.176 I-1.384 J-3.613 E.06927
G1 X151.832 Y110.914 E.01337
G3 X150.578 Y109.424 I4.628 J-5.17 E.05294
G2 X146.397 Y107.181 I-4.27 J2.94 E.13355
G1 X146.239 Y107.217 E.00438
G2 X143.163 Y104.655 I-16.78 J17.022 E.10862
G2 X144.306 Y104.224 I-.056 J-1.882 E.03374
G2 X145.561 Y102.735 I-4.628 J-5.17 E.05294
G3 X148.069 Y100.775 I4.741 J3.483 E.08735
G3 X150.578 Y100.686 I1.384 J3.613 E.06927
G1 X150.996 Y100.948 E.01337
G3 X152.251 Y102.437 I-4.628 J5.171 E.05294
G2 X154.759 Y104.397 I4.741 J-3.483 E.08735
G2 X157.268 Y104.486 I1.384 J-3.613 E.06927
G1 X157.686 Y104.224 E.01337
G2 X158.94 Y102.735 I-4.628 J-5.17 E.05294
G3 X161.192 Y100.895 I4.642 J3.384 E.07965
G2 X156.951 Y96.104 I-36.271 J27.833 E.17351
G3 X154.759 Y97.707 I-4.206 J-3.451 E.07437
G3 X152.251 Y97.796 I-1.384 J-3.613 E.06927
G1 X151.832 Y97.534 E.01337
G3 X150.578 Y96.045 I4.628 J-5.17 E.05294
G2 X148.069 Y94.085 I-4.741 J3.484 E.08735
G2 X145.561 Y93.996 I-1.384 J3.613 E.06927
G1 X145.143 Y94.258 E.01337
G2 X143.888 Y95.747 I4.628 J5.171 E.05294
G3 X141.38 Y97.707 I-4.741 J-3.483 E.08735
G3 X138.871 Y97.796 I-1.384 J-3.613 E.06927
G1 X138.453 Y97.534 E.01337
G3 X137.199 Y96.045 I4.628 J-5.17 E.05294
G2 X134.69 Y94.085 I-4.741 J3.484 E.08735
G2 X132.181 Y93.996 I-1.384 J3.613 E.06927
G1 X131.763 Y94.258 E.01337
G2 X130.509 Y95.747 I4.628 J5.171 E.05294
G3 X128 Y97.707 I-4.741 J-3.483 E.08735
G3 X125.491 Y97.796 I-1.384 J-3.613 E.06927
G1 X125.073 Y97.534 E.01337
G3 X123.819 Y96.045 I4.628 J-5.17 E.05294
G2 X121.31 Y94.085 I-4.741 J3.483 E.08735
G2 X118.802 Y93.996 I-1.384 J3.613 E.06927
G1 X118.384 Y94.258 E.01337
G2 X117.129 Y95.747 I4.628 J5.171 E.05294
G3 X114.621 Y97.707 I-4.741 J-3.483 E.08735
G3 X112.112 Y97.796 I-1.384 J-3.613 E.06927
G1 X111.694 Y97.534 E.01337
G3 X110.439 Y96.045 I4.628 J-5.17 E.05294
G2 X107.931 Y94.085 I-4.741 J3.483 E.08735
G2 X105.422 Y93.996 I-1.384 J3.613 E.06927
G1 X105.004 Y94.258 E.01337
G2 X103.75 Y95.747 I4.628 J5.171 E.05294
G3 X101.564 Y97.556 I-4.639 J-3.381 E.07767
G1 X106.568 Y101.561 E.17367
G3 X107.931 Y100.775 I2.576 J2.892 E.04293
G3 X110.439 Y100.686 I1.384 J3.613 E.06927
G1 X110.858 Y100.948 E.01337
G3 X112.112 Y102.437 I-4.628 J5.171 E.05294
G2 X113.784 Y104.005 I4.657 J-3.29 E.06255
G3 X115.214 Y103.148 I33.105 J53.617 E.04517
; WIPE_START
G1 X113.784 Y104.005 E-.63346
G1 X113.518 Y103.806 E-.12654
; WIPE_END
G1 E-.04 F1800
G1 X106.557 Y106.938 Z2.68 F30000
G1 X99.209 Y110.244 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F10826.06
G1 X100.507 Y111.283 E.04505
G3 X98.732 Y111.176 I-.669 J-3.67 E.04865
G1 X98.314 Y110.914 E.01337
G3 X97.06 Y109.424 I4.628 J-5.17 E.05294
G2 X93.715 Y107.241 I-4.363 J3.03 E.11097
G2 X91.206 Y108.045 I-.597 J2.454 E.07509
G3 X89.574 Y110.024 I-15.363 J-11.007 E.06958
G2 X87.261 Y117.496 I38.642 J16.053 E.21223
G1 X87.861 Y117.777 E.01795
G2 X90.37 Y117.866 I1.384 J-3.613 E.06927
G1 X90.788 Y117.604 E.01337
G2 X92.043 Y116.114 I-4.628 J-5.17 E.05294
G3 X94.551 Y114.154 I4.741 J3.483 E.08735
G3 X97.06 Y114.065 I1.384 J3.613 E.06927
G1 X97.478 Y114.327 E.01337
G3 X98.732 Y115.817 I-4.628 J5.17 E.05294
G2 X102.913 Y118.06 I4.27 J-2.94 E.13355
G1 X103.063 Y118.026 E.00415
G2 X101.88 Y124.167 I24.08 J7.823 E.16991
G1 X101.241 Y124.466 E.01911
G3 X98.732 Y124.555 I-1.384 J-3.613 E.06927
G1 X98.314 Y124.293 E.01337
G3 X97.06 Y122.804 I4.628 J-5.17 E.05294
G2 X94.551 Y120.844 I-4.741 J3.483 E.08735
G2 X92.043 Y120.755 I-1.384 J3.613 E.06927
G1 X91.624 Y121.017 E.01337
G2 X90.37 Y122.506 I4.628 J5.171 E.05294
G3 X86.404 Y124.735 I-4.26 J-2.938 E.12764
G2 X86.623 Y130.464 I46.611 J1.081 E.15545
G2 X87.861 Y131.156 I2.288 J-2.638 E.03871
G2 X90.37 Y131.245 I1.384 J-3.613 E.06927
G1 X90.788 Y130.983 E.01337
G2 X92.043 Y129.494 I-4.628 J-5.17 E.05294
G3 X94.551 Y127.534 I4.741 J3.483 E.08735
G3 X97.06 Y127.445 I1.384 J3.613 E.06927
G1 X97.478 Y127.707 E.01337
G3 X98.732 Y129.196 I-4.628 J5.171 E.05294
G2 X102.382 Y131.402 I4.262 J-2.93 E.1191
G2 X103.754 Y135.88 I25.704 J-5.425 E.12709
G1 X103.75 Y135.886 E.00019
G3 X101.241 Y137.846 I-4.741 J-3.483 E.08735
G3 X98.732 Y137.935 I-1.384 J-3.613 E.06927
G1 X98.314 Y137.673 E.01337
G3 X97.06 Y136.184 I4.628 J-5.17 E.05294
G2 X94.551 Y134.224 I-4.741 J3.483 E.08735
G2 X92.043 Y134.135 I-1.384 J3.613 E.06927
G1 X91.624 Y134.397 E.01337
G2 X90.37 Y135.886 I4.628 J5.171 E.05294
G3 X88.076 Y137.746 I-4.65 J-3.392 E.08093
G3 X87.64 Y136.141 I44.928 J-13.068 E.04505
G1 X106.784 Y161.801 F30000
G1 F10826.06
G3 X105.37 Y160.927 I17.083 J-29.202 E.04505
G1 X106.258 Y160.699 E.02485
G3 X109.603 Y162 I.041 J4.844 E.09963
G3 X111.276 Y164.025 I-14.037 J13.299 E.07121
G1 X111.43 Y164.175 E.00583
G2 X113.148 Y164.875 I18.022 J-41.802 E.05028
G2 X116.293 Y163.587 I-.119 J-4.776 E.09414
G2 X117.965 Y161.563 I-14.041 J-13.302 E.07121
G3 X118.802 Y160.894 I1.969 J1.603 E.02924
G1 X119.638 Y160.699 E.02327
G3 X122.983 Y162 I.041 J4.844 E.09963
G3 X124.655 Y164.025 I-14.037 J13.299 E.07121
G2 X125.491 Y164.694 I1.969 J-1.603 E.02924
G1 X126.328 Y164.889 E.02327
G2 X129.673 Y163.587 I.041 J-4.844 E.09963
G2 X131.345 Y161.563 I-14.041 J-13.302 E.07121
G3 X132.181 Y160.894 I1.969 J1.603 E.02924
G1 X133.017 Y160.699 E.02327
G3 X136.362 Y162 I.041 J4.844 E.09963
G3 X138.035 Y164.025 I-14.037 J13.299 E.07121
G2 X138.871 Y164.694 I1.969 J-1.603 E.02924
G1 X139.707 Y164.889 E.02327
G2 X143.052 Y163.587 I.041 J-4.844 E.09963
G2 X144.725 Y161.563 I-14.041 J-13.302 E.07121
G3 X145.561 Y160.894 I1.969 J1.603 E.02924
G1 X146.397 Y160.699 E.02327
G3 X149.36 Y161.715 I.093 J4.56 E.08665
G2 X154.727 Y157.9 I-21.538 J-35.987 E.1786
G3 X153.087 Y156.898 I1.596 J-4.456 E.05246
G3 X151.414 Y154.873 I14.039 J-13.3 E.07121
G2 X150.578 Y154.204 I-1.969 J1.603 E.02924
G1 X149.742 Y154.009 E.02327
G2 X146.397 Y155.311 I-.041 J4.844 E.09963
G2 X144.725 Y157.335 I14.039 J13.301 E.07121
G3 X143.888 Y158.004 I-1.969 J-1.603 E.02924
G1 X143.052 Y158.199 E.02327
G3 X139.707 Y156.898 I-.041 J-4.844 E.09963
G3 X138.035 Y154.873 I14.039 J-13.3 E.07121
G2 X137.199 Y154.204 I-1.969 J1.603 E.02924
G1 X136.362 Y154.009 E.02327
G2 X133.017 Y155.311 I-.041 J4.844 E.09963
G2 X131.345 Y157.335 I14.039 J13.301 E.07121
G3 X130.509 Y158.004 I-1.969 J-1.603 E.02924
G1 X129.673 Y158.199 E.02327
G3 X126.328 Y156.898 I-.041 J-4.844 E.09963
G3 X124.655 Y154.873 I14.039 J-13.3 E.07121
G2 X123.819 Y154.204 I-1.969 J1.603 E.02924
G1 X122.983 Y154.009 E.02327
G2 X119.638 Y155.311 I-.041 J4.844 E.09963
G2 X117.965 Y157.335 I14.039 J13.301 E.07121
G3 X117.129 Y158.004 I-1.969 J-1.603 E.02924
G1 X116.293 Y158.199 E.02327
G3 X112.948 Y156.898 I-.041 J-4.844 E.09963
G3 X111.276 Y154.873 I14.039 J-13.3 E.07121
G2 X110.439 Y154.204 I-1.969 J1.603 E.02924
G1 X109.603 Y154.009 E.02327
G2 X106.258 Y155.311 I-.041 J4.844 E.09963
G2 X104.586 Y157.335 I14.039 J13.301 E.07121
G3 X103.75 Y158.004 I-1.969 J-1.603 E.02924
G3 X101.315 Y157.935 I-1.115 J-3.63 E.06718
G3 X100.062 Y156.843 I30.548 J-36.304 E.04505
G1 X107.896 Y142.781 F30000
G1 F10826.06
G3 X107.158 Y141.858 I27.372 J-22.661 E.03203
G1 X106.872 Y141.472 E.01303
G1 X106.258 Y141.931 E.02076
G2 X104.586 Y143.956 I14.039 J13.301 E.07121
G3 X103.75 Y144.625 I-1.969 J-1.603 E.02924
G1 X102.913 Y144.82 E.02327
G3 X99.569 Y143.518 I-.041 J-4.844 E.09963
G3 X97.896 Y141.494 I14.039 J-13.3 E.07121
G2 X97.06 Y140.824 I-1.969 J1.603 E.02924
G1 X96.224 Y140.63 E.02327
G2 X92.879 Y141.931 I-.041 J4.844 E.09963
G2 X91.206 Y143.956 I14.039 J13.301 E.07121
G3 X90.686 Y144.427 I-1.353 J-.971 E.01917
G2 X92.337 Y147.446 I51.671 J-26.293 E.09325
G1 X92.879 Y147.319 E.01509
G3 X96.224 Y148.621 I.041 J4.844 E.09963
G3 X97.896 Y150.645 I-14.037 J13.299 E.07121
G2 X98.732 Y151.314 I1.969 J-1.603 E.02924
G1 X99.569 Y151.509 E.02327
G2 X102.913 Y150.208 I.041 J-4.844 E.09963
G2 X104.586 Y148.183 I-14.041 J-13.302 E.07121
G3 X105.422 Y147.514 I1.969 J1.603 E.02924
G1 X106.258 Y147.319 E.02327
G3 X109.603 Y148.621 I.041 J4.844 E.09963
G3 X111.276 Y150.645 I-14.037 J13.299 E.07121
G2 X112.112 Y151.314 I1.969 J-1.603 E.02924
G1 X112.948 Y151.509 E.02327
G2 X116.781 Y149.658 I-.043 J-4.982 E.11917
G2 X118.305 Y150.32 I7.546 J-15.29 E.04506
; WIPE_START
G1 X116.781 Y149.658 E-.63163
G1 X116.557 Y149.911 E-.12837
; WIPE_END
G1 E-.04 F1800
G1 X118.991 Y142.677 Z2.68 F30000
G1 X133.236 Y100.347 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F10826.06
G3 X134.854 Y100.731 I-3.123 J16.751 E.04506
G3 X137.199 Y100.686 I1.24 J3.504 E.06466
G3 X138.568 Y102.045 I-2.102 J3.488 E.05277
G1 X140.066 Y102.765 E.04504
G1 X144.729 Y87.895 F30000
G1 F10826.06
G3 X146.238 Y88.591 I-13.422 J31.094 E.04505
G2 X144.725 Y90.437 I12.806 J12.046 E.06474
G3 X142.216 Y91.241 I-1.912 J-1.65 E.07509
G3 X138.871 Y89.058 I1.018 J-5.213 E.11097
G2 X137.617 Y87.568 I-5.882 J3.681 E.05294
G1 X137.199 Y87.306 E.01337
G2 X134.69 Y87.395 I-1.125 J3.702 E.06927
G2 X132.181 Y89.355 I2.233 J5.443 E.08735
G3 X130.927 Y90.844 I-5.882 J-3.681 E.05294
G1 X130.509 Y91.106 E.01337
G3 X128 Y91.017 I-1.125 J-3.702 E.06927
G3 X125.491 Y89.058 I2.233 J-5.443 E.08735
G2 X124.237 Y87.568 I-5.882 J3.681 E.05294
G1 X123.819 Y87.306 E.01337
G2 X121.31 Y87.395 I-1.125 J3.702 E.06927
G2 X118.802 Y89.355 I2.233 J5.443 E.08735
G3 X117.547 Y90.844 I-5.882 J-3.681 E.05294
G1 X117.129 Y91.106 E.01337
G3 X114.621 Y91.017 I-1.125 J-3.702 E.06927
G3 X112.112 Y89.058 I2.233 J-5.443 E.08735
G1 X111.218 Y87.919 E.03923
G3 X125.639 Y84.451 I16.934 J38.7 E.404
G2 X127.776 Y84.388 I.968 J-3.445 E.05883
G3 X129.438 Y84.414 I.43 J25.378 E.04506
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X127.776 Y84.388 E-.63175
G1 X127.45 Y84.475 E-.12825
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/58
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.68 I-1.217 J.001 P1  F30000
G1 X127.486 Y167.967 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.514 J-41.967 E2.41722
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X129.059 Y84.043 I29.749 J29.607 E.92465
G3 X127.546 Y167.968 I-1.059 J41.957 E3.55645
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X92.492 Y102.847 I.515 J-42.384 E2.45394
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X129.069 Y83.627 I30.375 J29.594 E.94637
G3 X127.541 Y168.385 I-1.073 J42.373 E3.59158
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.787 E.00001
G3 X92.402 Y102.262 I.525 J-42.785 E2.30929
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X129.079 Y83.227 I30.947 J29.497 E.89747
G3 X128.525 Y168.787 I-1.078 J42.775 E3.33929
G1 X127.536 Y168.787 E.02488
; WIPE_START
M204 S10000
G1 X127.476 Y168.787 E-.02283
G1 X126.425 Y168.761 E-.3993
G1 X125.537 Y168.717 E-.33787
; WIPE_END
G1 E-.04 F1800
G1 X129.481 Y162.183 Z2.84 F30000
G1 X136.336 Y150.823 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X137.726 Y150.316 I-21.628 J-61.485 E.0401
G1 X137.895 Y150.246 E.00495
G2 X138.871 Y151.104 I3.226 J-2.687 E.03535
G1 X139.707 Y151.364 E.02373
G2 X143.888 Y149.419 I.249 J-4.93 E.13002
G3 X145.561 Y147.725 I5.082 J3.346 E.06491
G1 X146.397 Y147.465 E.02373
G3 X150.578 Y149.41 I.249 J4.93 E.13002
G2 X152.251 Y151.104 I5.082 J-3.346 E.06491
G1 X153.087 Y151.364 E.02373
G2 X157.268 Y149.419 I.249 J-4.93 E.13002
G3 X158.94 Y147.725 I5.082 J3.346 E.06491
G1 X159.777 Y147.465 E.02373
G3 X163.019 Y148.484 I.383 J4.45 E.09448
G2 X165.956 Y143.063 I-35.243 J-22.603 E.16721
G1 X165.63 Y142.729 E.01266
G2 X163.958 Y141.035 I-5.082 J3.346 E.06491
G1 X163.121 Y140.775 E.02373
G2 X158.94 Y142.72 I-.249 J4.93 E.13002
G3 X157.268 Y144.414 I-5.082 J-3.346 E.06491
G1 X156.432 Y144.674 E.02373
M73 P52 R20
G3 X152.251 Y142.729 I-.249 J-4.93 E.13002
G2 X150.578 Y141.035 I-5.082 J3.346 E.06491
G1 X149.614 Y140.775 E.02707
G2 X151.64 Y137.254 I-19.695 J-13.679 E.11023
G2 X152.251 Y137.724 I1.654 J-1.515 E.02098
G1 X153.087 Y137.984 E.02373
G2 X157.268 Y136.039 I.249 J-4.93 E.13002
G3 X158.94 Y134.345 I5.082 J3.346 E.06491
G1 X159.777 Y134.085 E.02373
G3 X163.958 Y136.031 I.249 J4.93 E.13002
G2 X165.212 Y137.44 I7.207 J-5.151 E.05122
G2 X167.89 Y137.858 I1.761 J-2.491 E.07611
G2 X169.277 Y131.293 I-43.126 J-12.541 E.182
G3 X165.63 Y129.349 I.286 J-4.93 E.11554
G2 X163.958 Y127.656 I-5.082 J3.346 E.06491
G1 X163.121 Y127.395 E.02373
G2 X158.94 Y129.341 I-.249 J4.93 E.13002
G3 X157.268 Y131.034 I-5.082 J-3.346 E.06491
G1 X156.432 Y131.295 E.02373
M73 P53 R20
G3 X153.763 Y130.664 I-.404 J-4.254 E.07565
G2 X154.142 Y124.556 I-24.736 J-4.601 E.16624
G2 X157.268 Y122.659 I-.871 J-4.96 E.10139
G3 X158.94 Y120.966 I5.082 J3.346 E.06491
G1 X159.777 Y120.706 E.02373
G3 X163.958 Y122.651 I.249 J4.93 E.13002
G2 X165.63 Y124.345 I5.082 J-3.346 E.06491
G1 X166.466 Y124.605 E.02373
G2 X169.552 Y123.692 I.404 J-4.306 E.08933
G2 X168.815 Y117.879 I-41.729 J2.336 E.15892
G3 X165.63 Y115.97 I.822 J-4.981 E.10303
G2 X163.958 Y114.276 I-5.082 J3.346 E.06491
G1 X163.121 Y114.016 E.02373
G2 X158.94 Y115.961 I-.249 J4.93 E.13002
G3 X157.268 Y117.655 I-5.082 J-3.346 E.06491
G1 X156.432 Y117.915 E.02373
G3 X152.251 Y115.97 I-.249 J-4.93 E.13002
G3 X151.422 Y114.299 I12.128 J-7.053 E.05057
G1 X153.777 Y125.057 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407771
G1 F12050.294
G2 X111.892 Y105.859 I-25.777 J.949 E1.38677
; LINE_WIDTH: 0.417566
G1 F11742.296
G1 X111.775 Y105.939 E.00357
; LINE_WIDTH: 0.40824
G1 F12035.197
G1 X111.657 Y106.02 E.00348
G3 X111.427 Y105.955 I-.054 J-.248 E.00606
G1 X99.118 Y96.103 E.3843
G1 X98.847 Y96.365 E.00918
G1 X111.194 Y106.247 E.38545
; LINE_WIDTH: 0.424569
G1 F11531.587
G1 X111.4 Y106.39 E.0064
; LINE_WIDTH: 0.445053
G1 F10956.449
G1 X111.607 Y106.534 E.00674
G1 X112.113 Y106.157 E.01691
; LINE_WIDTH: 0.407768
G1 F12050.393
G3 X104.172 Y117.148 I15.884 J19.84 E3.55334
G3 X105.154 Y114.855 I38.136 J14.975 E.06072
; LINE_WIDTH: 0.422336
G1 F11597.939
G1 X105.285 Y114.563 E.0081
; LINE_WIDTH: 0.447544
G1 F10890.402
G1 X105.415 Y114.271 E.00863
G1 X105.044 Y113.93 E.01356
; LINE_WIDTH: 0.407801
G1 F12049.32
G1 X92.698 Y104.049 E.385
G1 X92.501 Y104.37 E.00917
G1 X104.811 Y114.222 E.38385
; LINE_WIDTH: 0.424556
G1 F11531.957
G1 X104.866 Y114.3 E.00244
; LINE_WIDTH: 0.446625
G1 F10914.691
G1 X104.922 Y114.378 E.00258
G1 X104.886 Y114.56 E.00496
; LINE_WIDTH: 0.407783
G1 F12049.902
G2 X153.778 Y125.117 I23.116 J11.437 E2.28242
G1 X166.284 Y109.681 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X166.904 Y111.224 I-31.06 J13.373 E.04505
G1 X166.466 Y111.225 E.01185
G1 X165.63 Y110.965 E.02373
G3 X163.958 Y109.271 I3.409 J-5.039 E.06491
G2 X161.449 Y107.504 I-4.394 J3.574 E.0842
G2 X158.94 Y107.586 I-1.14 J3.548 E.06937
G2 X157.268 Y109.28 I3.41 J5.04 E.06491
G3 X154.759 Y111.047 I-4.394 J-3.574 E.0842
G3 X152.251 Y110.965 I-1.14 J-3.547 E.06937
G3 X150.578 Y109.271 I3.409 J-5.039 E.06491
G2 X146.397 Y107.326 I-3.932 J2.985 E.13002
G2 X142.997 Y104.535 I-25.006 J27 E.11927
G1 X143.888 Y104.275 E.02516
G2 X145.561 Y102.582 I-3.41 J-5.04 E.06491
G3 X148.069 Y100.814 I4.394 J3.574 E.0842
G3 X150.578 Y100.896 I1.14 J3.548 E.06937
G3 X152.251 Y102.59 I-3.41 J5.04 E.06491
G2 X154.759 Y104.357 I4.394 J-3.574 E.0842
G2 X157.268 Y104.275 I1.14 J-3.547 E.06937
G2 X158.94 Y102.582 I-3.41 J-5.04 E.06491
G3 X161.206 Y100.914 I4.3 J3.47 E.07707
G2 X157.012 Y96.162 I-36.451 J27.944 E.17187
G3 X154.759 Y97.668 I-3.98 J-3.519 E.07424
G3 X152.251 Y97.585 I-1.14 J-3.547 E.06937
G3 X150.578 Y95.892 I3.409 J-5.039 E.06491
G2 X148.069 Y94.125 I-4.394 J3.574 E.0842
G2 X145.561 Y94.207 I-1.14 J3.548 E.06937
G2 X143.888 Y95.9 I3.41 J5.04 E.06491
G3 X141.38 Y97.668 I-4.394 J-3.574 E.0842
G3 X138.871 Y97.585 I-1.14 J-3.547 E.06937
G3 X137.199 Y95.892 I3.409 J-5.039 E.06491
G2 X134.69 Y94.125 I-4.394 J3.574 E.0842
G2 X132.181 Y94.207 I-1.14 J3.548 E.06937
G2 X130.509 Y95.9 I3.41 J5.04 E.06491
G3 X128 Y97.668 I-4.394 J-3.574 E.0842
G3 X125.491 Y97.585 I-1.14 J-3.547 E.06937
G3 X123.819 Y95.892 I3.409 J-5.039 E.06491
G2 X121.31 Y94.125 I-4.394 J3.574 E.0842
G2 X118.802 Y94.207 I-1.14 J3.548 E.06937
G2 X117.129 Y95.9 I3.41 J5.04 E.06491
G3 X114.621 Y97.668 I-4.394 J-3.574 E.0842
G3 X112.112 Y97.585 I-1.14 J-3.547 E.06937
G3 X110.439 Y95.892 I3.409 J-5.039 E.06491
G2 X107.931 Y94.125 I-4.394 J3.574 E.0842
G2 X105.422 Y94.207 I-1.14 J3.548 E.06937
G2 X103.75 Y95.9 I3.41 J5.04 E.06491
G3 X101.547 Y97.542 I-4.294 J-3.463 E.07524
G1 X106.537 Y101.536 E.1732
G3 X107.931 Y100.814 I2.428 J2.984 E.04283
G3 X110.439 Y100.896 I1.14 J3.548 E.06937
G3 X112.112 Y102.59 I-3.41 J5.04 E.06491
G2 X113.784 Y104.014 I4.306 J-3.365 E.05992
G3 X115.207 Y103.153 I12.271 J18.67 E.04506
; WIPE_START
G1 X113.784 Y104.014 E-.63174
G1 X113.505 Y103.824 E-.12826
; WIPE_END
G1 E-.04 F1800
G1 X106.524 Y106.91 Z2.84 F30000
G1 X99.128 Y110.179 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F10826.06
G1 X100.426 Y111.218 E.04505
G3 X98.732 Y110.965 I-.452 J-2.769 E.04715
G3 X97.06 Y109.271 I3.409 J-5.039 E.06491
G2 X93.715 Y107.329 I-4.04 J3.105 E.10751
G2 X91.206 Y108.276 I-.42 J2.684 E.07599
G3 X89.534 Y110.137 I-12.643 J-9.679 E.06787
G2 X87.262 Y117.491 I38.018 J15.77 E.20886
G1 X87.861 Y117.737 E.01755
G2 X90.37 Y117.655 I1.14 J-3.547 E.06937
G2 X92.043 Y115.961 I-3.409 J-5.039 E.06491
G3 X94.551 Y114.194 I4.395 J3.574 E.0842
G3 X97.06 Y114.276 I1.14 J3.548 E.06937
G3 X98.732 Y115.97 I-3.41 J5.04 E.06491
G2 X102.913 Y117.915 I3.932 J-2.985 E.13002
G1 X103.118 Y117.851 E.0058
G2 X101.88 Y124.164 I24.162 J8.016 E.17478
G1 X101.241 Y124.427 E.01872
G3 X98.732 Y124.345 I-1.14 J-3.547 E.06937
G3 X97.06 Y122.651 I3.409 J-5.039 E.06491
G2 X94.551 Y120.884 I-4.394 J3.574 E.0842
G2 X92.043 Y120.966 I-1.14 J3.548 E.06937
G2 X90.37 Y122.659 I3.41 J5.04 E.06491
G3 X86.407 Y124.604 I-3.908 J-2.953 E.12409
G2 X86.627 Y130.503 I46.634 J1.211 E.16007
G2 X87.861 Y131.116 I2.089 J-2.655 E.03761
G2 X90.37 Y131.034 I1.14 J-3.548 E.06937
G2 X92.043 Y129.341 I-3.41 J-5.04 E.06491
G3 X94.551 Y127.574 I4.394 J3.574 E.0842
G3 X97.06 Y127.656 I1.14 J3.547 E.06937
G3 X98.732 Y129.349 I-3.409 J5.039 E.06491
G2 X102.359 Y131.293 I3.938 J-2.993 E.11499
G2 X103.795 Y135.984 I25.871 J-5.356 E.13314
G3 X101.241 Y137.806 I-4.666 J-3.84 E.08601
G3 X98.732 Y137.724 I-1.14 J-3.548 E.06937
G3 X97.06 Y136.031 I3.41 J-5.04 E.06491
G2 X94.551 Y134.263 I-4.394 J3.573 E.0842
G2 X92.043 Y134.345 I-1.14 J3.547 E.06937
G2 X90.37 Y136.039 I3.41 J5.04 E.06491
G3 X88.068 Y137.721 I-4.308 J-3.479 E.07814
G3 X87.633 Y136.117 I46.051 J-13.335 E.04505
G1 X106.993 Y161.926 F30000
G1 F10826.06
G3 X105.576 Y161.057 I16.975 J-29.259 E.04505
G1 X106.258 Y160.844 E.01938
G3 X109.603 Y161.933 I.35 J4.609 E.09778
G3 X111.276 Y163.794 I-10.97 J11.539 E.06787
G2 X112.948 Y164.744 I2.386 J-2.255 E.05289
G2 X117.129 Y162.798 I.249 J-4.93 E.13002
G3 X118.802 Y161.105 I5.082 J3.346 E.06491
G1 X119.638 Y160.844 E.02373
G3 X123.819 Y162.79 I.249 J4.93 E.13002
G2 X125.491 Y164.483 I5.082 J-3.346 E.06491
G1 X126.328 Y164.744 E.02373
G2 X130.509 Y162.798 I.249 J-4.93 E.13002
G3 X132.181 Y161.105 I5.082 J3.346 E.06491
G1 X133.017 Y160.844 E.02373
G3 X137.199 Y162.79 I.249 J4.93 E.13002
G2 X138.871 Y164.483 I5.082 J-3.346 E.06491
G1 X139.707 Y164.744 E.02373
G2 X143.888 Y162.798 I.249 J-4.93 E.13002
G3 X145.561 Y161.105 I5.082 J3.346 E.06491
G1 X146.397 Y160.844 E.02373
G3 X149.392 Y161.696 I.404 J4.272 E.08634
G2 X154.758 Y157.875 I-21.599 J-36.014 E.17867
G3 X152.251 Y156.108 I1.886 J-5.34 E.08417
G2 X150.578 Y154.415 I-5.082 J3.346 E.06491
G1 X149.742 Y154.155 E.02373
G2 X145.561 Y156.1 I-.249 J4.93 E.13002
G3 X143.888 Y157.794 I-5.082 J-3.346 E.06491
G1 X143.052 Y158.054 E.02373
G3 X138.871 Y156.108 I-.249 J-4.93 E.13002
G2 X137.199 Y154.415 I-5.082 J3.346 E.06491
G1 X136.362 Y154.155 E.02373
G2 X132.181 Y156.1 I-.249 J4.93 E.13002
G3 X130.509 Y157.794 I-5.082 J-3.346 E.06491
G1 X129.673 Y158.054 E.02373
G3 X125.491 Y156.108 I-.249 J-4.93 E.13002
G2 X123.819 Y154.415 I-5.082 J3.346 E.06491
G1 X122.983 Y154.155 E.02373
G2 X118.802 Y156.1 I-.249 J4.93 E.13002
G3 X117.129 Y157.794 I-5.082 J-3.346 E.06491
G1 X116.293 Y158.054 E.02373
G3 X112.112 Y156.108 I-.249 J-4.93 E.13002
G2 X110.439 Y154.415 I-5.082 J3.346 E.06491
G1 X109.603 Y154.155 E.02373
G2 X105.422 Y156.1 I-.249 J4.93 E.13002
G3 X103.75 Y157.794 I-5.082 J-3.346 E.06491
G3 X101.243 Y157.876 I-1.369 J-3.464 E.06931
G3 X99.993 Y156.78 I34.988 J-41.171 E.04505
G1 X107.884 Y142.765 F30000
G1 F10826.06
G3 X107.158 Y141.858 I26.913 J-22.281 E.03149
G1 X106.86 Y141.456 E.01357
G2 X105.422 Y142.72 I2.363 J4.136 E.05224
G3 X103.75 Y144.414 I-5.082 J-3.346 E.06491
G1 X102.913 Y144.674 E.02373
G3 X98.732 Y142.729 I-.249 J-4.93 E.13002
G2 X97.06 Y141.035 I-5.082 J3.346 E.06491
G1 X96.224 Y140.775 E.02373
G2 X92.043 Y142.72 I-.249 J4.93 E.13002
G3 X90.6 Y144.257 I-5.398 J-3.619 E.05736
G2 X92.431 Y147.604 I50.081 J-25.225 E.10339
G1 X92.879 Y147.465 E.0127
G3 X97.06 Y149.41 I.249 J4.93 E.13002
G2 X98.732 Y151.104 I5.082 J-3.346 E.06491
G1 X99.569 Y151.364 E.02373
G2 X103.75 Y149.419 I.249 J-4.93 E.13002
G3 X105.422 Y147.725 I5.082 J3.346 E.06491
G1 X106.258 Y147.465 E.02373
G3 X110.439 Y149.41 I.249 J4.93 E.13002
G2 X112.112 Y151.104 I5.082 J-3.346 E.06491
G1 X112.948 Y151.364 E.02373
G2 X116.86 Y149.694 I.276 J-4.772 E.11944
G2 X118.386 Y150.353 I7.505 J-15.306 E.04506
; WIPE_START
G1 X116.86 Y149.694 E-.63162
G1 X116.624 Y149.936 E-.12838
; WIPE_END
G1 E-.04 F1800
G1 X119.063 Y142.704 Z2.84 F30000
G1 X133.341 Y100.369 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F10826.06
G3 X134.957 Y100.758 I-3.177 J16.746 E.04506
G3 X137.199 Y100.896 I.916 J3.393 E.06193
G3 X138.333 Y101.944 I-2.391 J3.727 E.04206
G1 X139.839 Y102.647 E.04504
G1 X144.672 Y87.87 F30000
G1 F10826.06
G3 X146.182 Y88.565 I-13.398 J31.115 E.04505
G3 X144.306 Y90.611 I-209.329 J-190.006 E.07523
G1 X143.888 Y90.896 E.0137
G3 X141.38 Y90.978 I-1.369 J-3.465 E.06937
G3 X138.871 Y89.21 I1.886 J-5.341 E.0842
G2 X137.199 Y87.517 I-5.082 J3.346 E.06491
G2 X134.69 Y87.435 I-1.369 J3.466 E.06937
G2 X132.181 Y89.202 I1.886 J5.341 E.0842
G3 X130.509 Y90.896 I-5.082 J-3.346 E.06491
G3 X128 Y90.978 I-1.369 J-3.465 E.06937
G3 X125.491 Y89.21 I1.886 J-5.341 E.0842
G2 X123.819 Y87.517 I-5.082 J3.346 E.06491
G2 X121.31 Y87.435 I-1.369 J3.466 E.06937
G2 X118.802 Y89.202 I1.886 J5.341 E.0842
G3 X117.129 Y90.896 I-5.082 J-3.346 E.06491
G3 X114.621 Y90.978 I-1.369 J-3.465 E.06937
G3 X112.112 Y89.21 I1.886 J-5.341 E.0842
G2 X111.054 Y87.992 I-6.22 J4.329 E.04382
G3 X126.191 Y84.424 I17.076 J38.554 E.42385
G1 X126.328 Y84.466 E.00386
G3 X129.05 Y84.398 I2.692 J53.452 E.07381
G1 X129.198 Y84.404 E.00399
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X129.05 Y84.398 E-.05601
G1 X127.535 Y84.386 E-.5758
G1 X127.205 Y84.455 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/58
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.84 I-1.217 J.004 P1  F30000
G1 X127.486 Y167.97 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.515 J-41.969 E2.4173
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X129.025 Y84.042 I29.749 J29.607 E.92373
G3 X127.546 Y167.971 I-1.025 J41.959 E3.55753
G1 X127.481 Y168.386 F30000
G1 F9000
G3 X92.492 Y102.847 I.516 J-42.385 E2.45398
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X129.036 Y83.627 I30.375 J29.593 E.94545
G3 X127.541 Y168.387 I-1.039 J42.375 E3.59257
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.784 E.00008
G3 X92.402 Y102.262 I.524 J-42.784 E2.30921
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X129.045 Y83.226 I30.947 J29.497 E.89663
G3 X128.525 Y168.784 I-1.046 J42.774 E3.33998
G1 X127.536 Y168.787 E.02488
; WIPE_START
M204 S10000
G1 X127.476 Y168.784 E-.02284
G1 X126.425 Y168.761 E-.39928
G1 X125.537 Y168.717 E-.33788
; WIPE_END
G1 E-.04 F1800
G1 X129.509 Y162.2 Z3 F30000
G1 X136.466 Y150.782 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X137.726 Y150.316 I-58.856 J-161.22 E.0364
G1 X138.021 Y150.194 E.00865
G2 X139.707 Y151.23 I2.535 J-2.234 E.05443
G2 X143.052 Y150.346 I.627 J-4.395 E.0963
G2 X144.725 Y148.619 I-8.521 J-9.924 E.06524
G3 X146.397 Y147.598 I2.468 J2.163 E.05391
G3 X149.742 Y148.482 I.627 J4.396 E.0963
G3 X151.414 Y150.21 I-8.52 J9.923 E.06524
G2 X153.087 Y151.23 I2.468 J-2.164 E.05391
G2 X156.432 Y150.346 I.627 J-4.395 E.0963
G2 X158.104 Y148.619 I-8.521 J-9.924 E.06524
G3 X159.777 Y147.598 I2.468 J2.163 E.05391
G3 X163.048 Y148.438 I.644 J4.287 E.09402
G2 X165.92 Y143.145 I-35.331 J-22.596 E.16333
G3 X164.794 Y141.929 I6.018 J-6.709 E.04496
G2 X163.121 Y140.909 I-2.468 J2.164 E.05391
G2 X159.777 Y141.793 I-.627 J4.396 E.0963
G2 X158.104 Y143.52 I8.52 J9.923 E.06524
G3 X156.432 Y144.541 I-2.468 J-2.164 E.05391
G3 X153.087 Y143.656 I-.627 J-4.396 E.0963
G3 X151.414 Y141.929 I8.52 J-9.924 E.06524
G2 X149.742 Y140.909 I-2.468 J2.164 E.05391
G1 X149.531 Y140.896 E.00572
G2 X151.709 Y137.114 I-20.061 J-14.068 E.11841
G2 X153.087 Y137.851 I2.066 J-2.207 E.04283
G2 X156.432 Y136.967 I.627 J-4.395 E.0963
G2 X158.104 Y135.24 I-8.521 J-9.924 E.06524
G3 X159.777 Y134.219 I2.468 J2.163 E.05391
G3 X163.121 Y135.103 I.627 J4.396 E.0963
G3 X164.794 Y136.83 I-8.52 J9.923 E.06524
G2 X167.905 Y137.81 I2.373 J-2.108 E.09282
G2 X169.29 Y131.193 I-43.09 J-12.471 E.18335
G3 X166.466 Y130.277 I-.145 J-4.364 E.08206
G3 X164.794 Y128.55 I8.519 J-9.923 E.06524
G2 X163.121 Y127.529 I-2.468 J2.164 E.05391
G2 X159.777 Y128.413 I-.627 J4.396 E.0963
G2 X158.104 Y130.14 I8.52 J9.923 E.06524
G3 X156.432 Y131.161 I-2.468 J-2.164 E.05391
G3 X153.759 Y130.687 I-.665 J-4.024 E.07499
G2 X154.138 Y124.489 I-24.731 J-4.624 E.16868
G2 X156.432 Y123.587 I-.594 J-4.877 E.06751
G2 X158.104 Y121.86 I-8.519 J-9.923 E.06524
G3 X159.777 Y120.839 I2.468 J2.164 E.05391
G3 X163.121 Y121.723 I.627 J4.396 E.0963
G3 X164.794 Y123.45 I-8.52 J9.923 E.06524
G2 X166.466 Y124.471 I2.468 J-2.164 E.05391
G2 X169.554 Y123.744 I.668 J-4.081 E.08822
G2 X168.8 Y117.806 I-41.676 J2.275 E.16234
G3 X166.466 Y116.897 I.565 J-4.905 E.06861
G3 X164.794 Y115.17 I8.519 J-9.923 E.06524
G2 X163.121 Y114.149 I-2.468 J2.164 E.05391
G2 X159.777 Y115.034 I-.627 J4.396 E.0963
G2 X158.104 Y116.761 I8.52 J9.923 E.06524
G3 X156.432 Y117.781 I-2.468 J-2.164 E.05392
G3 X152.251 Y116.113 I-.552 J-4.691 E.12715
G2 X151.564 Y114.589 I-40.442 J17.304 E.0453
G1 X153.777 Y125.057 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407786
G1 F12049.82
G2 X111.893 Y105.859 I-25.777 J.949 E1.38683
; LINE_WIDTH: 0.417559
G1 F11742.526
G1 X111.775 Y105.939 E.00357
; LINE_WIDTH: 0.40823
G1 F12035.51
G1 X111.657 Y106.02 E.00348
G3 X111.427 Y105.955 I-.054 J-.248 E.00606
G1 X99.118 Y96.103 E.38429
G1 X98.847 Y96.365 E.00918
G1 X111.194 Y106.247 E.38544
; LINE_WIDTH: 0.424569
G1 F11531.587
G1 X111.4 Y106.39 E.0064
; LINE_WIDTH: 0.445048
G1 F10956.58
G1 X111.607 Y106.534 E.00674
G1 X112.113 Y106.156 E.01692
; LINE_WIDTH: 0.407779
G1 F12050.035
G3 X104.172 Y117.148 I15.885 J19.842 E3.55373
G3 X105.154 Y114.855 I38.15 J14.98 E.06071
; LINE_WIDTH: 0.422336
G1 F11597.939
G1 X105.285 Y114.563 E.0081
; LINE_WIDTH: 0.447546
G1 F10890.351
G1 X105.415 Y114.271 E.00863
G1 X105.044 Y113.93 E.01356
; LINE_WIDTH: 0.407801
G1 F12049.32
G1 X92.698 Y104.049 E.385
G1 X92.501 Y104.37 E.00916
G1 X104.811 Y114.222 E.38385
; LINE_WIDTH: 0.424556
G1 F11531.957
G1 X104.866 Y114.3 E.00244
; LINE_WIDTH: 0.446628
G1 F10914.59
G1 X104.922 Y114.378 E.00258
G1 X104.886 Y114.56 E.00496
; LINE_WIDTH: 0.407813
G1 F12048.96
G2 X153.778 Y125.117 I23.116 J11.437 E2.28259
G1 X166.239 Y109.574 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X166.862 Y111.116 I-51.822 J21.846 E.04505
G1 X166.466 Y111.092 E.01074
G1 X165.63 Y110.775 E.02423
G3 X163.958 Y109.128 I4.447 J-6.187 E.06387
G2 X161.449 Y107.537 I-4.047 J3.608 E.08154
G2 X158.94 Y107.776 I-.924 J3.582 E.06968
G2 X157.268 Y109.423 I4.447 J6.187 E.06387
G3 X154.759 Y111.015 I-4.047 J-3.607 E.08154
G3 X152.251 Y110.775 I-.924 J-3.581 E.06968
G3 X150.578 Y109.128 I4.446 J-6.187 E.06387
G2 X146.482 Y107.454 I-3.618 J3.006 E.12482
G2 X142.831 Y104.415 I-17.977 J17.886 E.12892
G1 X143.052 Y104.402 E.00601
G1 X143.888 Y104.086 E.02423
G2 X145.561 Y102.438 I-4.446 J-6.186 E.06387
G3 X148.069 Y100.847 I4.047 J3.607 E.08154
G3 X150.578 Y101.086 I.924 J3.581 E.06968
G3 X152.251 Y102.734 I-4.447 J6.187 E.06387
G2 X154.759 Y104.325 I4.047 J-3.607 E.08154
G2 X157.268 Y104.086 I.924 J-3.581 E.06968
G2 X158.94 Y102.438 I-4.446 J-6.186 E.06387
G3 X161.217 Y100.929 I3.958 J3.5 E.07486
G2 X157.076 Y96.224 I-33.799 J25.57 E.17
G3 X154.759 Y97.635 I-3.751 J-3.551 E.07438
G3 X152.251 Y97.396 I-.924 J-3.581 E.06968
G3 X150.578 Y95.748 I4.446 J-6.187 E.06387
G2 X148.069 Y94.157 I-4.047 J3.608 E.08154
G2 X145.561 Y94.396 I-.924 J3.582 E.06968
G2 X143.888 Y96.044 I4.447 J6.187 E.06387
G3 X141.38 Y97.635 I-4.047 J-3.607 E.08154
G3 X138.871 Y97.396 I-.924 J-3.581 E.06968
M73 P54 R20
G3 X137.199 Y95.748 I4.446 J-6.187 E.06387
G2 X134.69 Y94.157 I-4.047 J3.608 E.08154
G2 X132.181 Y94.396 I-.924 J3.582 E.06968
G2 X130.509 Y96.044 I4.447 J6.187 E.06387
G3 X128 Y97.635 I-4.047 J-3.607 E.08154
G3 X125.491 Y97.396 I-.924 J-3.581 E.06968
G3 X123.819 Y95.748 I4.447 J-6.187 E.06387
G2 X121.31 Y94.157 I-4.047 J3.608 E.08154
G2 X118.802 Y94.396 I-.924 J3.582 E.06968
G2 X117.129 Y96.044 I4.447 J6.187 E.06387
G3 X114.621 Y97.635 I-4.047 J-3.607 E.08154
G3 X112.112 Y97.396 I-.924 J-3.581 E.06968
G3 X110.439 Y95.748 I4.447 J-6.187 E.06387
G2 X107.931 Y94.157 I-4.047 J3.608 E.08154
G2 X105.422 Y94.396 I-.924 J3.582 E.06968
G2 X103.75 Y96.044 I4.447 J6.187 E.06387
G3 X101.533 Y97.531 I-3.949 J-3.49 E.07312
G1 X106.5 Y101.506 E.17238
G3 X107.931 Y100.847 I2.283 J3.072 E.04299
G3 X110.439 Y101.086 I.924 J3.581 E.06968
G3 X112.112 Y102.734 I-4.447 J6.187 E.06387
G2 X113.773 Y104.021 I3.924 J-3.346 E.05736
G3 X115.195 Y103.16 I9.54 J14.137 E.04506
G1 X112.436 Y87.403 F30000
G1 F10826.06
G2 X110.908 Y88.056 I12.557 J31.493 E.04505
G3 X112.112 Y89.354 I-7.663 J8.319 E.04802
G2 X114.621 Y90.945 I4.047 J-3.607 E.08154
G2 X117.129 Y90.706 I.924 J-3.581 E.06968
G2 X118.802 Y89.059 I-4.446 J-6.186 E.06387
G3 X121.31 Y87.467 I4.047 J3.608 E.08154
G3 X123.819 Y87.707 I.924 J3.581 E.06968
G3 X125.491 Y89.354 I-4.447 J6.187 E.06387
G2 X128 Y90.945 I4.047 J-3.607 E.08154
G2 X130.509 Y90.706 I.924 J-3.581 E.06968
G2 X132.181 Y89.059 I-4.446 J-6.186 E.06387
G3 X134.69 Y87.467 I4.047 J3.607 E.08154
G3 X137.199 Y87.707 I.924 J3.581 E.06968
G3 X138.871 Y89.354 I-4.447 J6.187 E.06387
G2 X141.38 Y90.945 I4.047 J-3.607 E.08154
G2 X144.306 Y90.404 I.92 J-3.212 E.08359
G3 X146.119 Y88.535 I73.276 J69.234 E.07056
G2 X144.608 Y87.842 I-14.881 J30.444 E.04505
G1 X139.586 Y102.516 F30000
G1 F10826.06
G1 X138.905 Y102.19 E.02046
G3 X137.617 Y101.388 I.498 J-2.238 E.04192
G2 X135.072 Y100.788 I-1.875 J2.258 E.07342
G2 X133.457 Y100.394 I-4.853 J16.351 E.04506
; WIPE_START
G1 X135.072 Y100.788 E-.63164
G1 X135.406 Y100.737 E-.12836
; WIPE_END
G1 E-.04 F1800
G1 X128.014 Y102.639 Z3 F30000
G1 X99.027 Y110.099 Z3
G1 Z2.6
G1 E.8 F1800
G1 F10826.06
G1 X100.326 Y111.138 E.04505
G3 X98.732 Y110.775 I-.212 J-2.75 E.04495
G3 X97.06 Y109.128 I4.447 J-6.187 E.06387
G2 X94.551 Y107.537 I-4.047 J3.608 E.08154
G2 X91.624 Y108.077 I-.92 J3.212 E.08359
G3 X89.534 Y110.208 I-49.781 J-46.767 E.08088
G2 X87.262 Y117.492 I36.676 J15.434 E.20708
G2 X90.37 Y117.465 I1.525 J-3.35 E.08694
G2 X92.043 Y115.818 I-4.446 J-6.186 E.06387
G3 X94.551 Y114.227 I4.047 J3.608 E.08154
G3 X97.06 Y114.466 I.924 J3.581 E.06968
G3 X98.732 Y116.113 I-4.447 J6.187 E.06387
G2 X102.913 Y117.781 I3.629 J-3.023 E.12715
G1 X103.171 Y117.684 E.00746
G2 X101.88 Y124.168 I24.307 J8.211 E.17963
G3 X98.732 Y124.155 I-1.56 J-3.385 E.08804
G3 X97.06 Y122.507 I4.447 J-6.187 E.06387
G2 X94.551 Y120.916 I-4.047 J3.608 E.08154
G2 X92.043 Y121.156 I-.924 J3.582 E.06968
G2 X90.37 Y122.803 I4.447 J6.187 E.06387
G3 X86.41 Y124.485 I-3.607 J-2.99 E.12113
G2 X86.632 Y130.547 I46.737 J1.325 E.1645
G2 X87.861 Y131.084 I1.891 J-2.656 E.03662
G2 X90.37 Y130.845 I.924 J-3.582 E.06968
G2 X92.043 Y129.197 I-4.446 J-6.187 E.06387
G3 X94.551 Y127.606 I4.047 J3.607 E.08154
G3 X97.06 Y127.845 I.924 J3.581 E.06968
G3 X98.732 Y129.493 I-4.447 J6.187 E.06387
G2 X102.338 Y131.196 I3.641 J-3.039 E.11153
G2 X103.836 Y136.085 I26.097 J-5.319 E.13877
G3 X101.241 Y137.774 I-4.233 J-3.667 E.085
G3 X98.732 Y137.534 I-.924 J-3.581 E.06968
G3 X97.06 Y135.887 I4.447 J-6.187 E.06387
G2 X94.551 Y134.296 I-4.047 J3.607 E.08154
G2 X92.043 Y134.535 I-.924 J3.581 E.06968
G2 X90.37 Y136.183 I4.447 J6.187 E.06387
G3 X88.062 Y137.702 I-3.965 J-3.509 E.07575
G3 X87.629 Y136.097 I47.061 J-13.579 E.04505
G1 X107.868 Y142.745 F30000
G1 F10826.06
G3 X107.158 Y141.858 I26.312 J-21.783 E.03078
G1 X106.844 Y141.435 E.01427
G1 X106.258 Y141.793 E.0186
G2 X104.586 Y143.52 I8.52 J9.923 E.06524
G3 X102.913 Y144.541 I-2.468 J-2.164 E.05391
G3 X99.569 Y143.656 I-.627 J-4.396 E.0963
G3 X97.896 Y141.929 I8.52 J-9.924 E.06524
G2 X96.224 Y140.909 I-2.468 J2.164 E.05391
G2 X92.043 Y142.577 I-.552 J4.691 E.12715
G3 X90.53 Y144.109 I-6.27 J-4.677 E.05852
G2 X92.511 Y147.737 I38.725 J-18.789 E.11207
G1 X92.879 Y147.598 E.01064
G3 X96.224 Y148.482 I.627 J4.396 E.0963
G3 X97.896 Y150.21 I-8.52 J9.923 E.06524
G2 X99.569 Y151.23 I2.468 J-2.164 E.05391
G2 X102.913 Y150.346 I.627 J-4.395 E.0963
G2 X104.586 Y148.619 I-8.521 J-9.924 E.06524
G3 X106.258 Y147.598 I2.468 J2.164 E.05391
G3 X109.603 Y148.482 I.627 J4.396 E.0963
G3 X111.276 Y150.21 I-8.52 J9.923 E.06524
G2 X112.948 Y151.23 I2.468 J-2.164 E.05391
G2 X116.946 Y149.734 I.563 J-4.584 E.12025
G2 X118.474 Y150.388 I7.463 J-15.33 E.04506
G1 X147.99 Y162.502 F30000
G1 F10826.06
G2 X149.431 Y161.672 I-24.584 J-44.377 E.04505
G2 X145.561 Y161.294 I-2.257 J3.107 E.11049
G2 X143.888 Y162.942 I4.446 J6.187 E.06387
G3 X139.707 Y164.61 I-3.629 J-3.023 E.12715
G3 X138.035 Y163.589 I.796 J-3.184 E.05391
G2 X136.362 Y161.862 I-10.192 J8.196 E.06524
G2 X133.017 Y160.978 I-2.717 J3.512 E.0963
G2 X131.345 Y161.999 I.796 J3.184 E.05391
G3 X129.673 Y163.726 I-10.193 J-8.197 E.06524
G3 X126.328 Y164.61 I-2.717 J-3.511 E.0963
G3 X124.655 Y163.589 I.796 J-3.184 E.05391
G2 X122.983 Y161.862 I-10.192 J8.196 E.06524
G2 X119.638 Y160.978 I-2.717 J3.512 E.0963
G2 X117.965 Y161.999 I.796 J3.184 E.05391
G3 X116.293 Y163.726 I-10.193 J-8.197 E.06524
G3 X112.948 Y164.61 I-2.717 J-3.511 E.0963
G3 X111.276 Y163.589 I.796 J-3.184 E.05391
G2 X109.603 Y161.862 I-10.192 J8.196 E.06524
G2 X106.258 Y160.978 I-2.717 J3.512 E.0963
G1 X105.753 Y161.169 E.01464
G3 X101.177 Y157.82 I22.614 J-35.704 E.15377
G2 X102.913 Y157.92 I1.163 J-5.08 E.04736
G2 X104.586 Y156.899 I-.796 J-3.184 E.05391
G3 X106.258 Y155.172 I10.192 J8.196 E.06524
G3 X109.603 Y154.288 I2.717 J3.512 E.0963
G3 X111.276 Y155.309 I-.796 J3.184 E.05391
G2 X112.948 Y157.036 I10.193 J-8.197 E.06524
G2 X116.293 Y157.92 I2.717 J-3.511 E.0963
G2 X117.965 Y156.899 I-.796 J-3.184 E.05391
G3 X119.638 Y155.172 I10.192 J8.196 E.06524
G3 X122.983 Y154.288 I2.717 J3.512 E.0963
G3 X124.655 Y155.309 I-.796 J3.184 E.05391
G2 X126.328 Y157.036 I10.193 J-8.197 E.06524
G2 X129.673 Y157.92 I2.717 J-3.511 E.0963
G2 X131.345 Y156.899 I-.796 J-3.184 E.05391
G3 X133.017 Y155.172 I10.192 J8.196 E.06524
G3 X136.362 Y154.288 I2.717 J3.512 E.0963
G3 X138.035 Y155.309 I-.796 J3.184 E.05391
G2 X139.707 Y157.036 I10.193 J-8.197 E.06524
G2 X143.052 Y157.92 I2.717 J-3.511 E.0963
G2 X144.725 Y156.899 I-.796 J-3.184 E.05391
G3 X146.397 Y155.172 I10.192 J8.196 E.06524
G3 X149.742 Y154.288 I2.717 J3.512 E.0963
G3 X151.414 Y155.309 I-.796 J3.184 E.05391
G2 X153.087 Y157.036 I10.193 J-8.197 E.06524
G2 X154.795 Y157.844 I3.428 J-5.036 E.05142
G2 X156.04 Y156.75 I-21.673 J-25.906 E.04491
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X154.795 Y157.844 E-.62969
G1 X154.471 Y157.734 E-.13031
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/58
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3 I-.432 J-1.138 P1  F30000
G1 X127.486 Y167.97 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.515 J-41.969 E2.4173
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.992 Y84.041 I29.749 J29.607 E.92282
G3 X127.546 Y167.971 I-.991 J41.96 E3.55845
G1 X127.481 Y168.386 F30000
G1 F9000
G3 X92.492 Y102.847 I.516 J-42.385 E2.45398
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.513 J11.953 E3.96626
G1 X97.629 Y96.428 E.48568
G3 X129.002 Y83.626 I30.375 J29.594 E.94454
G3 X127.541 Y168.387 I-1.005 J42.376 E3.59348
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.784 E.00008
G3 X92.402 Y102.262 I.524 J-42.784 E2.30921
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.995 J12.051 E3.63683
G1 X97.039 Y96.469 E.47023
G3 X129.012 Y83.225 I30.947 J29.497 E.89578
G3 X128.525 Y168.784 I-1.012 J42.775 E3.34083
G1 X127.536 Y168.787 E.02488
; WIPE_START
M204 S10000
G1 X127.476 Y168.784 E-.02283
G1 X126.425 Y168.761 E-.39928
G1 X125.537 Y168.717 E-.33789
; WIPE_END
G1 E-.04 F1800
G1 X129.273 Y162.062 Z3.16 F30000
G1 X135.996 Y150.084 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X137.557 Y149.512 I-11.757 J-34.483 E.04505
G2 X138.871 Y150.741 I6.255 J-5.374 E.04884
G2 X141.38 Y151.127 I1.792 J-3.29 E.07017
G2 X143.888 Y149.7 I-1.2 J-5.026 E.07927
G3 X145.561 Y148.088 I8.18 J6.815 E.06306
G3 X148.069 Y147.701 I1.792 J3.29 E.07017
G3 X150.578 Y149.129 I-1.2 J5.026 E.07927
G2 X152.251 Y150.741 I8.18 J-6.815 E.06306
G2 X154.759 Y151.127 I1.792 J-3.29 E.07017
G2 X157.268 Y149.7 I-1.2 J-5.026 E.07927
G3 X158.94 Y148.088 I8.18 J6.815 E.06306
G3 X161.449 Y147.701 I1.792 J3.29 E.07017
G3 X163.081 Y148.386 I-.793 J4.176 E.04831
G2 X165.883 Y143.228 I-35.496 J-22.625 E.1592
G2 X163.958 Y141.398 I-29.291 J28.898 E.07199
G2 X161.449 Y141.011 I-1.792 J3.289 E.07017
G2 X158.94 Y142.439 I1.2 J5.026 E.07927
G3 X157.268 Y144.051 I-8.179 J-6.814 E.06306
G3 X154.759 Y144.438 I-1.792 J-3.29 E.07017
G3 X152.251 Y143.01 I1.2 J-5.026 E.07927
G2 X150.578 Y141.398 I-8.18 J6.815 E.06306
G2 X148.488 Y140.971 I-1.715 J3.059 E.05874
G2 X151.159 Y136.371 I-20.585 J-15.03 E.1444
G2 X152.251 Y137.361 I5.059 J-4.477 E.04001
G2 X154.759 Y137.748 I1.792 J-3.29 E.07017
G2 X157.268 Y136.32 I-1.2 J-5.026 E.07927
G3 X158.94 Y134.709 I8.18 J6.815 E.06306
G3 X161.449 Y134.322 I1.792 J3.29 E.07017
G3 X163.958 Y135.749 I-1.2 J5.026 E.07927
G2 X165.63 Y137.361 I8.18 J-6.815 E.06306
G2 X167.917 Y137.77 I1.74 J-3.135 E.06411
G2 X169.301 Y131.1 I-43.095 J-12.421 E.18476
G3 X165.63 Y129.631 I-.323 J-4.515 E.11089
G2 X163.958 Y128.019 I-8.18 J6.815 E.06306
G2 X161.449 Y127.632 I-1.792 J3.289 E.07017
G2 X158.94 Y129.059 I1.2 J5.026 E.07927
G3 X157.268 Y130.671 I-8.179 J-6.814 E.06306
G3 X154.759 Y131.058 I-1.792 J-3.29 E.07017
G3 X153.012 Y130.287 I1.352 J-5.425 E.052
G2 X153.323 Y124.377 I-29.186 J-4.495 E.16063
G2 X157.268 Y122.941 I.612 J-4.457 E.11836
G3 X158.94 Y121.329 I8.18 J6.815 E.06306
G3 X161.449 Y120.942 I1.792 J3.29 E.07017
G3 X163.958 Y122.37 I-1.2 J5.027 E.07927
G2 X165.63 Y123.981 I8.18 J-6.815 E.06306
G2 X168.139 Y124.368 I1.792 J-3.29 E.07017
G2 X169.557 Y123.8 I-.626 J-3.615 E.0417
G2 X168.788 Y117.742 I-41.656 J2.213 E.16563
G3 X165.63 Y116.251 I.232 J-4.581 E.09706
G2 X163.958 Y114.639 I-8.18 J6.815 E.06306
G2 X161.449 Y114.252 I-1.792 J3.29 E.07017
G2 X158.94 Y115.68 I1.2 J5.026 E.07927
G3 X157.268 Y117.292 I-8.179 J-6.814 E.06306
G3 X154.759 Y117.679 I-1.792 J-3.29 E.07017
G3 X152.251 Y116.251 I1.2 J-5.026 E.07927
G2 X150.772 Y114.805 I-7.326 J6.016 E.05615
G2 X145.75 Y107.867 I-24.156 J12.197 E.23308
G3 X148.069 Y107.563 I1.606 J3.248 E.06456
G3 X150.578 Y108.99 I-1.2 J5.027 E.07927
G2 X152.251 Y110.602 I8.18 J-6.815 E.06306
G2 X154.759 Y110.989 I1.792 J-3.29 E.07017
G2 X157.268 Y109.561 I-1.2 J-5.026 E.07927
G3 X158.94 Y107.949 I8.18 J6.815 E.06306
G3 X161.449 Y107.563 I1.792 J3.29 E.07017
G3 X163.958 Y108.99 I-1.2 J5.027 E.07927
G2 X165.63 Y110.602 I8.18 J-6.815 E.06306
G1 X166.466 Y110.968 E.02474
G1 X166.822 Y111.012 E.00971
G2 X166.194 Y109.472 I-44.309 J17.184 E.04505
; WIPE_START
G1 X166.822 Y111.012 E-.63174
G1 X166.487 Y110.971 E-.12826
; WIPE_END
G1 E-.04 F1800
G1 X159.074 Y109.155 Z3.16 F30000
G1 X124.984 Y100.804 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F10826.06
G2 X123.34 Y101.05 I5.205 J40.526 E.04505
G1 X122.983 Y100.893 E.01057
G2 X118.733 Y102.374 I-.824 J4.473 E.12757
G2 X114.817 Y104.318 I9.581 J24.212 E.1186
G3 X112.112 Y102.871 I.69 J-4.543 E.08476
G2 X110.439 Y101.26 I-8.18 J6.815 E.06306
G2 X107.931 Y100.873 I-1.792 J3.29 E.07017
G2 X105.797 Y101.977 I1.061 J4.662 E.06581
G1 X100.437 Y97.688 E.18603
G2 X103.75 Y96.182 I-.106 J-4.63 E.10133
G3 X105.422 Y94.57 I8.18 J6.815 E.06306
G3 X107.931 Y94.183 I1.792 J3.29 E.07017
G3 X110.439 Y95.611 I-1.2 J5.026 E.07927
G2 X112.112 Y97.222 I8.18 J-6.815 E.06306
G2 X114.621 Y97.609 I1.792 J-3.29 E.07017
G2 X117.129 Y96.182 I-1.2 J-5.026 E.07927
G3 X118.802 Y94.57 I8.18 J6.815 E.06306
G3 X121.31 Y94.183 I1.792 J3.29 E.07017
G3 X123.819 Y95.611 I-1.2 J5.026 E.07927
G2 X125.491 Y97.222 I8.18 J-6.815 E.06306
G2 X128 Y97.609 I1.792 J-3.29 E.07017
G2 X130.509 Y96.182 I-1.2 J-5.026 E.07927
G3 X132.181 Y94.57 I8.18 J6.815 E.06306
G3 X134.69 Y94.183 I1.792 J3.29 E.07017
G3 X137.199 Y95.611 I-1.2 J5.027 E.07927
G2 X138.871 Y97.222 I8.18 J-6.815 E.06306
G2 X141.38 Y97.609 I1.792 J-3.29 E.07017
G2 X143.888 Y96.182 I-1.2 J-5.026 E.07927
G3 X145.561 Y94.57 I8.18 J6.815 E.06306
G3 X148.069 Y94.183 I1.792 J3.29 E.07017
G3 X150.578 Y95.611 I-1.2 J5.027 E.07927
G2 X152.251 Y97.222 I8.18 J-6.815 E.06306
G2 X154.759 Y97.609 I1.792 J-3.29 E.07017
G2 X157.142 Y96.29 I-1.141 J-4.873 E.07475
G3 X161.225 Y100.94 I-29.594 J30.102 E.16782
G2 X158.94 Y102.3 I1.34 J4.849 E.07292
G3 X157.268 Y103.912 I-8.179 J-6.814 E.06306
G3 X154.759 Y104.299 I-1.792 J-3.29 E.07017
G3 X152.251 Y102.871 I1.2 J-5.026 E.07927
G2 X150.578 Y101.26 I-8.18 J6.815 E.06306
G2 X148.069 Y100.873 I-1.792 J3.29 E.07017
G2 X145.561 Y102.3 I1.2 J5.026 E.07927
G3 X143.888 Y103.912 I-8.179 J-6.814 E.06306
G3 X140.781 Y104.07 I-1.713 J-3.052 E.08738
G2 X139.404 Y103.331 I-8.209 J13.622 E.04236
G3 X138.035 Y101.978 I5.578 J-7.015 E.05227
G1 X137.199 Y101.26 E.02986
G2 X134.69 Y100.873 I-1.792 J3.29 E.07017
G2 X133.617 Y101.252 I.355 J2.71 E.03107
G2 X131.984 Y100.94 I-3.991 J16.454 E.04506
G1 X144.536 Y87.81 F30000
G1 F10826.06
G3 X146.048 Y88.501 I-13.328 J31.141 E.04505
G3 X143.888 Y90.532 I-68.07 J-70.207 E.08034
G3 X141.38 Y90.919 I-1.792 J-3.29 E.07017
G3 X138.871 Y89.492 I1.2 J-5.026 E.07927
G2 X137.199 Y87.88 I-8.18 J6.815 E.06306
G2 X134.69 Y87.493 I-1.792 J3.29 E.07017
G2 X132.181 Y88.921 I1.2 J5.026 E.07927
G3 X130.509 Y90.532 I-8.179 J-6.814 E.06306
G3 X128 Y90.919 I-1.792 J-3.29 E.07017
G3 X125.491 Y89.492 I1.2 J-5.026 E.07927
G2 X123.819 Y87.88 I-8.18 J6.815 E.06306
G2 X121.31 Y87.493 I-1.792 J3.29 E.07017
G2 X118.802 Y88.921 I1.2 J5.027 E.07927
G3 X117.129 Y90.532 I-8.179 J-6.814 E.06306
G3 X114.621 Y90.919 I-1.792 J-3.29 E.07017
G3 X112.112 Y89.492 I1.2 J-5.026 E.07927
G2 X110.734 Y88.133 I-6.879 J5.598 E.05253
G3 X112.261 Y87.476 I14.175 J30.807 E.04505
; WIPE_START
G1 X110.734 Y88.133 E-.63176
G1 X110.99 Y88.353 E-.12824
; WIPE_END
G1 E-.04 F1800
G1 X107.544 Y95.163 Z3.16 F30000
G1 X100.081 Y109.908 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F10826.06
G1 X101.379 Y110.947 E.04505
G3 X98.732 Y110.602 I-.941 J-3.1 E.07455
G3 X97.06 Y108.99 I6.507 J-8.426 E.06306
G2 X94.551 Y107.563 I-3.709 J3.599 E.07927
G2 X92.043 Y107.949 I-.717 J3.677 E.07017
G1 X91.206 Y108.667 E.02986
G3 X89.534 Y110.281 I-8.305 J-6.932 E.0631
G1 X89.448 Y110.329 E.00266
G2 X87.261 Y117.499 I38.878 J15.776 E.2034
G2 X90.37 Y117.292 I1.337 J-3.375 E.08727
G2 X92.043 Y115.68 I-6.507 J-8.426 E.06306
G3 X94.551 Y114.252 I3.709 J3.599 E.07927
G3 X97.06 Y114.639 I.717 J3.677 E.07017
G3 X98.732 Y116.251 I-6.508 J8.427 E.06306
G2 X101.241 Y117.679 I3.708 J-3.599 E.07927
G2 X104.366 Y116.763 I.74 J-3.263 E.09215
G2 X102.724 Y123.764 I24.647 J9.472 E.19548
G3 X101.241 Y124.368 I-2.16 J-3.182 E.04371
G3 X98.732 Y123.981 I-.717 J-3.677 E.07017
G3 X97.06 Y122.37 I6.507 J-8.426 E.06306
G2 X94.551 Y120.942 I-3.709 J3.599 E.07927
G2 X92.043 Y121.329 I-.717 J3.677 E.07017
G2 X90.37 Y122.941 I6.508 J8.427 E.06306
G3 X86.415 Y124.375 I-3.334 J-3.022 E.11863
G2 X86.636 Y130.587 I42.541 J1.598 E.16858
G2 X87.861 Y131.058 I1.793 J-2.837 E.03581
G2 X90.37 Y130.671 I.717 J-3.677 E.07017
G2 X92.043 Y129.059 I-6.506 J-8.425 E.06306
G3 X94.551 Y127.632 I3.709 J3.599 E.07927
G3 X97.06 Y128.019 I.717 J3.676 E.07017
G3 X98.732 Y129.631 I-6.508 J8.427 E.06306
G2 X102.913 Y131.038 I3.357 J-3.058 E.12482
G1 X103.111 Y130.951 E.00585
G2 X104.481 Y135.538 I32.283 J-7.142 E.12984
G1 X103.75 Y136.32 E.02902
G3 X101.241 Y137.748 I-3.709 J-3.599 E.07927
G3 X98.732 Y137.361 I-.717 J-3.677 E.07017
G3 X97.06 Y135.749 I6.507 J-8.426 E.06306
G2 X94.551 Y134.322 I-3.708 J3.599 E.07927
G2 X92.043 Y134.709 I-.717 J3.677 E.07017
G2 X90.37 Y136.32 I6.508 J8.427 E.06306
G3 X88.058 Y137.689 I-3.632 J-3.497 E.07369
G3 X87.625 Y136.084 I47.912 J-13.788 E.04505
G1 X108.64 Y142.411 F30000
G1 F10826.06
G3 X107.607 Y141.108 I33.752 J-27.826 E.04505
G2 X105.422 Y142.439 I1.427 J4.802 E.07009
G3 X103.75 Y144.051 I-8.179 J-6.814 E.06306
G1 X102.913 Y144.417 E.02474
G3 X98.732 Y143.01 I-.824 J-4.465 E.12482
G2 X97.06 Y141.398 I-8.18 J6.815 E.06306
G1 X96.224 Y141.032 E.02474
G2 X92.043 Y142.439 I-.825 J4.465 E.12482
G3 X90.464 Y143.97 I-7.763 J-6.424 E.05969
G2 X92.581 Y147.852 I46.133 J-22.631 E.11986
G1 X92.879 Y147.722 E.00881
G3 X97.06 Y149.129 I.825 J4.465 E.12482
G2 X98.732 Y150.741 I8.18 J-6.815 E.06306
G1 X99.569 Y151.107 E.02474
G2 X103.75 Y149.7 I.825 J-4.465 E.12482
G3 X105.422 Y148.088 I8.18 J6.815 E.06306
G1 X106.258 Y147.722 E.02474
G3 X110.439 Y149.129 I.825 J4.465 E.12482
G2 X112.112 Y150.741 I8.18 J-6.815 E.06306
G1 X112.948 Y151.107 E.02474
G2 X115.457 Y150.877 I.85 J-4.532 E.06914
G2 X117.63 Y149.165 I-3.251 J-6.36 E.07544
G2 X119.168 Y149.796 I21.068 J-49.198 E.04505
G1 X148.039 Y162.476 F30000
G1 F10826.06
G2 X149.478 Y161.644 I-27.301 J-48.913 E.04505
G2 X145.561 Y161.468 I-2.108 J3.229 E.11147
G2 X143.888 Y163.079 I6.508 J8.427 E.06306
G3 X139.707 Y164.487 I-3.357 J-3.058 E.12482
G1 X138.871 Y164.12 E.02474
G3 X137.199 Y162.508 I6.507 J-8.426 E.06306
G2 X133.017 Y161.101 I-3.357 J3.058 E.12482
G1 X132.181 Y161.468 E.02474
G2 X130.509 Y163.079 I6.508 J8.427 E.06306
G3 X126.328 Y164.487 I-3.357 J-3.058 E.12482
G1 X125.491 Y164.12 E.02474
G3 X123.819 Y162.508 I6.507 J-8.426 E.06306
G2 X119.638 Y161.101 I-3.357 J3.058 E.12482
G1 X118.802 Y161.468 E.02474
G2 X117.129 Y163.079 I6.508 J8.427 E.06306
G3 X112.948 Y164.487 I-3.357 J-3.058 E.12482
G1 X112.112 Y164.12 E.02474
G3 X110.439 Y162.508 I6.507 J-8.426 E.06306
G2 X106.258 Y161.101 I-3.357 J3.058 E.12482
G1 X105.896 Y161.26 E.01071
G3 X101.137 Y157.786 I22.418 J-35.712 E.15979
G2 X104.586 Y156.712 I.834 J-3.395 E.10285
G3 X106.258 Y155.098 I8.305 J6.932 E.0631
G3 X109.603 Y154.411 I2.465 J3.514 E.09516
M73 P54 R19
G1 X110.439 Y154.778 E.02474
G3 X112.112 Y156.39 I-6.508 J8.427 E.06306
G2 X116.293 Y157.797 I3.357 J-3.058 E.12482
G1 X117.129 Y157.43 E.02474
G2 X118.802 Y155.819 I-6.506 J-8.425 E.06306
G3 X122.983 Y154.411 I3.357 J3.058 E.12482
G1 X123.819 Y154.778 E.02474
G3 X125.491 Y156.39 I-6.508 J8.427 E.06306
G2 X129.673 Y157.797 I3.357 J-3.058 E.12482
G1 X130.509 Y157.43 E.02474
G2 X132.181 Y155.819 I-6.506 J-8.425 E.06306
G3 X136.362 Y154.411 I3.357 J3.058 E.12482
G1 X137.199 Y154.778 E.02474
G3 X138.871 Y156.39 I-6.508 J8.427 E.06306
G2 X143.052 Y157.797 I3.357 J-3.058 E.12482
G1 X143.888 Y157.43 E.02474
G2 X145.561 Y155.819 I-6.506 J-8.425 E.06306
G3 X149.742 Y154.411 I3.357 J3.058 E.12482
G1 X150.578 Y154.778 E.02474
G3 X152.251 Y156.39 I-6.508 J8.427 E.06306
G2 X154.82 Y157.823 I3.443 J-3.152 E.08111
G2 X156.068 Y156.725 I-21.756 J-25.978 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X154.82 Y157.823 E-.63176
G1 X154.495 Y157.731 E-.12824
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/58
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.16 I-.431 J-1.138 P1  F30000
G1 X127.486 Y167.967 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.514 J-41.967 E2.41721
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.958 Y84.04 I29.735 J29.571 E.92195
G3 X127.546 Y167.968 I-.958 J41.96 E3.5592
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X92.492 Y102.847 I.515 J-42.384 E2.45394
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X128.968 Y83.625 I30.368 J29.577 E.94364
G3 X127.541 Y168.385 I-.972 J42.376 E3.59432
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.785 E.00006
G3 X92.402 Y102.262 I.525 J-42.784 E2.30923
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.978 Y83.224 I30.962 J29.532 E.89488
G3 X128.525 Y168.785 I-.978 J42.776 E3.34173
G1 X127.536 Y168.787 E.02488
; WIPE_START
M204 S10000
G1 X127.476 Y168.785 E-.02282
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.33789
; WIPE_END
G1 E-.04 F1800
G1 X129.297 Y162.075 Z3.32 F30000
G1 X136.105 Y150.05 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X137.662 Y149.468 I-12.194 J-34.992 E.04505
G2 X138.871 Y150.579 I7.804 J-7.271 E.04455
G2 X142.216 Y150.904 I2.011 J-3.325 E.09417
G2 X144.725 Y148.981 I-2.939 J-6.432 E.08638
G3 X147.233 Y147.685 I2.954 J2.642 E.07823
G3 X150.578 Y148.994 I.2 J4.416 E.10023
G2 X152.251 Y150.579 I11.101 J-10.037 E.0625
G2 X155.595 Y150.904 I2.011 J-3.325 E.09417
G2 X158.104 Y148.981 I-2.939 J-6.432 E.08638
G3 X160.613 Y147.685 I2.954 J2.642 E.07823
G3 X163.117 Y148.329 I.112 J4.754 E.07096
G2 X165.845 Y143.315 I-35.734 J-22.688 E.15478
G2 X163.958 Y141.559 I-82.591 J86.891 E.06984
G2 X160.613 Y141.235 I-2.011 J3.325 E.09417
G2 X158.104 Y143.158 I2.939 J6.432 E.08638
G3 X155.595 Y144.454 I-2.954 J-2.642 E.07823
G3 X152.251 Y143.145 I-.2 J-4.416 E.10023
G2 X150.578 Y141.559 I-11.101 J10.037 E.0625
G2 X148.456 Y141.014 I-1.922 J3.078 E.0603
G2 X151.21 Y136.26 I-20.667 J-15.144 E.14916
M73 P55 R19
G2 X152.251 Y137.2 I6.607 J-6.267 E.03803
G2 X155.595 Y137.524 I2.011 J-3.325 E.09417
G2 X158.104 Y135.601 I-2.939 J-6.432 E.08638
G3 X160.613 Y134.305 I2.954 J2.642 E.07823
G3 X163.958 Y135.615 I.2 J4.416 E.10023
G2 X165.63 Y137.2 I11.1 J-10.036 E.0625
G2 X167.927 Y137.738 I1.947 J-3.143 E.06505
G2 X169.312 Y131.014 I-43.121 J-12.387 E.18621
G3 X165.63 Y129.765 I-.589 J-4.317 E.10919
G2 X163.958 Y128.18 I-11.1 J10.036 E.0625
G2 X160.613 Y127.855 I-2.011 J3.324 E.09417
G2 X158.104 Y129.779 I2.939 J6.432 E.08638
G3 X155.595 Y131.075 I-2.954 J-2.642 E.07823
G3 X152.999 Y130.359 I-.24 J-4.198 E.07429
G2 X153.316 Y124.275 I-28.85 J-4.555 E.16537
G2 X157.268 Y123.075 I.866 J-4.254 E.11662
G3 X158.94 Y121.49 I11.103 J10.039 E.0625
G3 X162.285 Y121.166 I2.011 J3.325 E.09417
G3 X164.794 Y123.089 I-2.939 J6.431 E.08638
G2 X167.303 Y124.385 I2.954 J-2.642 E.07823
G2 X169.56 Y123.861 I.136 J-4.537 E.0635
G2 X168.776 Y117.686 I-41.66 J2.15 E.1688
G3 X165.63 Y116.386 I-.04 J-4.36 E.09478
G2 X163.958 Y114.8 I-11.1 J10.036 E.0625
G2 X160.613 Y114.476 I-2.011 J3.325 E.09417
G2 X158.104 Y116.399 I2.939 J6.432 E.08638
G3 X155.595 Y117.695 I-2.954 J-2.642 E.07823
G3 X152.251 Y116.386 I-.2 J-4.416 E.10023
G2 X150.912 Y115.092 I-9.045 J8.023 E.0505
G2 X145.852 Y107.967 I-24.302 J11.897 E.23784
G3 X148.069 Y107.582 I1.705 J3.244 E.06199
G3 X150.578 Y108.856 I-.877 J4.834 E.07732
G2 X152.251 Y110.441 I11.1 J-10.035 E.0625
G2 X155.595 Y110.765 I2.011 J-3.325 E.09417
G2 X158.104 Y108.842 I-2.939 J-6.432 E.08638
G3 X160.613 Y107.546 I2.954 J2.642 E.07823
G3 X163.958 Y108.856 I.2 J4.416 E.10023
G2 X165.63 Y110.441 I11.1 J-10.036 E.0625
G1 X166.466 Y110.854 E.02527
G1 X166.783 Y110.911 E.00873
G2 X166.15 Y109.374 I-41.352 J16.13 E.04505
; WIPE_START
G1 X166.783 Y110.911 E-.63173
G1 X166.466 Y110.854 E-.12237
G1 X166.452 Y110.847 E-.0059
; WIPE_END
G1 E-.04 F1800
G1 X159.032 Y109.062 Z3.32 F30000
G1 X124.791 Y100.826 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F10826.06
G2 X123.15 Y101.09 I4.549 J33.498 E.04504
G1 X122.983 Y101.008 E.00504
G2 X118.515 Y102.458 I-1.072 J4.302 E.13415
G2 X114.863 Y104.29 I15.013 J34.491 E.11076
G3 X112.112 Y103.006 I.346 J-4.33 E.08404
G2 X110.439 Y101.421 I-11.101 J10.037 E.0625
G2 X107.095 Y101.096 I-2.011 J3.325 E.09417
G2 X105.729 Y101.923 I1.18 J3.492 E.0436
G1 X100.346 Y97.615 E.1868
G1 X100.405 Y97.626 E.00161
G2 X103.75 Y96.316 I.2 J-4.416 E.10023
G3 X105.422 Y94.731 I11.103 J10.039 E.0625
G3 X108.767 Y94.407 I2.011 J3.325 E.09417
G3 X111.276 Y96.33 I-2.939 J6.431 E.08638
G2 X113.784 Y97.626 I2.954 J-2.642 E.07823
G2 X117.129 Y96.316 I.2 J-4.416 E.10023
G3 X118.802 Y94.731 I11.103 J10.039 E.0625
G3 X122.147 Y94.407 I2.011 J3.325 E.09417
G3 X124.655 Y96.33 I-2.939 J6.431 E.08638
G2 X127.164 Y97.626 I2.954 J-2.642 E.07823
G2 X130.509 Y96.316 I.2 J-4.416 E.10023
G3 X132.181 Y94.731 I11.103 J10.039 E.0625
G3 X135.526 Y94.407 I2.011 J3.325 E.09417
G3 X138.035 Y96.33 I-2.939 J6.431 E.08638
G2 X140.543 Y97.626 I2.954 J-2.642 E.07823
G2 X143.888 Y96.316 I.2 J-4.416 E.10023
G3 X145.561 Y94.731 I11.103 J10.039 E.0625
G3 X148.906 Y94.407 I2.011 J3.325 E.09417
G3 X151.414 Y96.33 I-2.939 J6.431 E.08638
G2 X153.923 Y97.626 I2.954 J-2.642 E.07823
G2 X157.212 Y96.36 I.222 J-4.332 E.09835
G3 X161.229 Y100.946 I-29.556 J29.943 E.16533
G2 X158.94 Y102.166 I1.017 J4.666 E.07118
G3 X157.268 Y103.751 I-11.101 J-10.037 E.0625
G3 X153.923 Y104.075 I-2.011 J-3.325 E.09417
G3 X151.414 Y102.152 I2.939 J-6.432 E.08638
G2 X148.906 Y100.856 I-2.954 J2.642 E.07823
G2 X145.561 Y102.166 I-.2 J4.416 E.10023
G3 X143.888 Y103.751 I-11.101 J-10.037 E.0625
G3 X140.78 Y104.07 I-1.85 J-2.722 E.08821
G3 X138.871 Y103.006 I8.304 J-17.142 E.05927
G2 X137.199 Y101.421 I-11.101 J10.037 E.0625
G2 X133.558 Y101.24 I-1.991 J3.344 E.10279
G2 X131.925 Y100.931 I-3.96 J16.456 E.04506
G1 X144.455 Y87.774 F30000
G1 F10826.06
G3 X145.968 Y88.463 I-13.291 J31.167 E.04505
G2 X143.888 Y90.371 I116.297 J128.832 E.07647
G3 X140.543 Y90.696 I-2.011 J-3.325 E.09417
G3 X138.035 Y88.773 I2.939 J-6.432 E.08638
G2 X135.526 Y87.477 I-2.954 J2.642 E.07823
G2 X132.181 Y88.786 I-.2 J4.416 E.10023
G3 X130.509 Y90.371 I-11.101 J-10.037 E.0625
G3 X127.164 Y90.696 I-2.011 J-3.325 E.09417
G3 X124.655 Y88.773 I2.939 J-6.432 E.08638
G2 X122.147 Y87.477 I-2.954 J2.642 E.07823
G2 X118.802 Y88.786 I-.2 J4.416 E.10023
G3 X117.129 Y90.371 I-11.101 J-10.037 E.0625
G3 X113.784 Y90.696 I-2.011 J-3.325 E.09417
G3 X111.276 Y88.773 I2.939 J-6.432 E.08638
G1 X110.61 Y88.19 E.02397
G3 X112.135 Y87.528 I21.798 J48.106 E.04505
; WIPE_START
G1 X110.61 Y88.19 E-.63176
G1 X110.864 Y88.412 E-.12825
; WIPE_END
G1 E-.04 F1800
G1 X107.438 Y95.233 Z3.32 F30000
G1 X100.07 Y109.899 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F10826.06
G1 X101.368 Y110.938 E.04505
G3 X98.732 Y110.441 I-.748 J-3.264 E.07478
G3 X97.06 Y108.856 I9.427 J-11.62 E.0625
G2 X93.715 Y107.546 I-3.145 J3.107 E.10023
G2 X91.206 Y108.842 I.445 J3.938 E.07823
G3 X89.534 Y110.359 I-6.859 J-5.881 E.06134
G1 X89.41 Y110.419 E.00372
G2 X87.258 Y117.512 I39 J15.706 E.20111
G2 X90.37 Y117.131 I1.158 J-3.435 E.08785
G2 X92.043 Y115.545 I-9.429 J-11.622 E.0625
G3 X95.387 Y114.236 I3.145 J3.107 E.10023
G3 X97.896 Y115.532 I-.445 J3.938 E.07823
G2 X100.405 Y117.455 I5.448 J-4.508 E.08638
G2 X104.471 Y116.499 I1.326 J-3.488 E.12013
G3 X105.139 Y114.977 I15.834 J6.043 E.04506
; WIPE_START
G1 X104.471 Y116.499 E-.63164
G1 X104.217 Y116.722 E-.12836
; WIPE_END
G1 E-.04 F1800
G1 X102.856 Y124.232 Z3.32 F30000
G1 X102.627 Y125.493 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F10826.06
G3 X102.718 Y123.833 I16.94 J.098 E.04506
G3 X100.405 Y124.385 I-2.182 J-4.024 E.06519
G3 X97.896 Y123.089 I.445 J-3.938 E.07823
G2 X95.387 Y121.166 I-5.448 J4.508 E.08638
G2 X92.043 Y121.49 I-1.334 J3.649 E.09417
G2 X90.37 Y123.075 I9.43 J11.624 E.0625
G3 X86.42 Y124.275 I-3.085 J-3.054 E.11659
G2 X86.643 Y130.649 I45.785 J1.585 E.17296
G2 X88.698 Y131.075 I1.913 J-4.064 E.05738
G2 X91.206 Y129.779 I-.445 J-3.938 E.07823
G3 X93.715 Y127.855 I5.448 J4.508 E.08638
G3 X97.06 Y128.18 I1.334 J3.649 E.09417
G3 X98.732 Y129.765 I-9.429 J11.622 E.0625
G2 X102.913 Y130.923 I3.109 J-3.096 E.12297
G1 X103.09 Y130.836 E.00534
G2 X104.532 Y135.656 I30.904 J-6.619 E.13648
G1 X103.75 Y136.455 E.03029
G3 X100.405 Y137.764 I-3.145 J-3.107 E.10023
G3 X97.896 Y136.468 I.445 J-3.938 E.07823
G2 X95.387 Y134.545 I-5.448 J4.508 E.08638
G2 X92.043 Y134.87 I-1.334 J3.649 E.09417
G2 X90.37 Y136.455 I9.43 J11.624 E.0625
G3 X88.056 Y137.681 I-3.313 J-3.455 E.07188
G3 X87.623 Y136.076 I48.451 J-13.92 E.04505
G1 X108.641 Y142.412 F30000
G1 F10826.06
G3 X107.608 Y141.11 I33.605 J-27.714 E.04505
G1 X107.095 Y141.235 E.01431
G2 X104.586 Y143.158 I2.939 J6.432 E.08638
G3 X100.405 Y144.214 I-2.851 J-2.484 E.12435
G3 X97.896 Y142.291 I2.939 J-6.432 E.08638
G2 X96.224 Y141.146 I-2.989 J2.574 E.05554
G2 X92.043 Y142.304 I-1.073 J4.254 E.12297
G3 X90.41 Y143.855 I-10.855 J-9.796 E.06107
G2 X92.644 Y147.952 I44.448 J-21.578 E.1265
G3 X95.387 Y147.925 I1.408 J3.627 E.07597
G3 X97.896 Y149.848 I-2.939 J6.432 E.08638
G2 X102.077 Y150.904 I2.851 J-2.484 E.12435
G2 X104.586 Y148.981 I-2.939 J-6.432 E.08638
G3 X108.767 Y147.925 I2.851 J2.484 E.12434
G3 X111.276 Y149.848 I-2.939 J6.432 E.08638
G2 X115.457 Y150.904 I2.851 J-2.484 E.12435
G2 X117.738 Y149.213 I-2.704 J-6.033 E.07755
G2 X119.28 Y149.834 I16.175 J-37.926 E.04505
G1 X148.097 Y162.444 F30000
G1 F10826.06
G2 X149.535 Y161.61 I-16.262 J-29.709 E.04505
G2 X144.725 Y162.36 I-1.959 J3.233 E.14333
G3 X142.216 Y164.283 I-5.448 J-4.509 E.08638
G3 X138.035 Y163.228 I-1.33 J-3.539 E.12435
G2 X135.526 Y161.304 I-5.448 J4.508 E.08638
G2 X131.345 Y162.36 I-1.33 J3.539 E.12435
G3 X128.836 Y164.283 I-5.448 J-4.509 E.08638
G3 X124.655 Y163.228 I-1.33 J-3.539 E.12435
G2 X122.147 Y161.304 I-5.448 J4.508 E.08638
G2 X117.965 Y162.36 I-1.33 J3.539 E.12434
G3 X115.457 Y164.283 I-5.448 J-4.509 E.08638
G3 X111.276 Y163.228 I-1.33 J-3.539 E.12435
G2 X108.767 Y161.304 I-5.448 J4.508 E.08638
G2 X106.016 Y161.335 I-1.335 J3.65 E.07621
G3 X101.115 Y157.767 I22.348 J-35.841 E.1644
G2 X104.586 Y156.538 I.666 J-3.633 E.10445
G3 X107.095 Y154.615 I5.448 J4.509 E.08638
G3 X111.276 Y155.671 I1.33 J3.539 E.12435
G2 X113.784 Y157.594 I5.448 J-4.508 E.08638
G2 X117.965 Y156.538 I1.33 J-3.539 E.12435
G3 X120.474 Y154.615 I5.448 J4.509 E.08638
G3 X124.655 Y155.671 I1.33 J3.539 E.12435
G2 X127.164 Y157.594 I5.448 J-4.508 E.08638
G2 X131.345 Y156.538 I1.33 J-3.539 E.12435
G3 X133.854 Y154.615 I5.448 J4.509 E.08638
G3 X138.035 Y155.671 I1.33 J3.539 E.12434
G2 X140.543 Y157.594 I5.448 J-4.508 E.08638
G2 X144.725 Y156.538 I1.33 J-3.539 E.12435
G3 X147.233 Y154.615 I5.448 J4.509 E.08638
G3 X151.414 Y155.671 I1.33 J3.539 E.12434
G2 X153.923 Y157.594 I5.448 J-4.508 E.08638
G2 X154.845 Y157.802 I.982 J-2.207 E.02578
G2 X156.092 Y156.703 I-21.767 J-25.965 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X154.845 Y157.802 E-.63176
G1 X154.516 Y157.727 E-.12824
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/58
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.32 I-.431 J-1.138 P1  F30000
G1 X127.486 Y167.967 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.514 J-41.967 E2.41721
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.924 Y84.04 I29.735 J29.572 E.92103
G3 X127.546 Y167.968 I-.924 J41.96 E3.56012
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X92.492 Y102.847 I.515 J-42.384 E2.45393
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X128.934 Y83.624 I30.368 J29.577 E.94273
G3 X127.541 Y168.385 I-.938 J42.377 E3.59524
M204 S250
G1 X127.476 Y168.787 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.476 Y168.785 E.00003
G3 X92.402 Y102.262 I.525 J-42.785 E2.30926
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.944 Y83.224 I30.962 J29.532 E.89403
G3 X128.525 Y168.785 I-.944 J42.777 E3.34264
G1 X127.536 Y168.787 E.02488
; WIPE_START
M204 S10000
G1 X127.476 Y168.785 E-.0228
G1 X126.425 Y168.761 E-.39929
G1 X125.537 Y168.717 E-.3379
; WIPE_END
G1 E-.04 F1800
G1 X123.172 Y161.461 Z3.48 F30000
G1 X119.395 Y149.874 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X117.851 Y149.26 I9.711 J-26.683 E.04505
G3 X115.457 Y150.936 I-4.606 J-4.03 E.07997
G3 X111.276 Y149.681 I-1.129 J-3.831 E.12515
G2 X108.767 Y147.892 I-4.82 J4.106 E.08434
G2 X104.586 Y149.147 I-1.129 J3.831 E.12515
G3 X102.077 Y150.936 I-4.82 J-4.106 E.08434
G3 X97.896 Y149.681 I-1.129 J-3.831 E.12515
G2 X95.387 Y147.892 I-4.82 J4.106 E.08434
G2 X92.7 Y148.04 I-1.142 J3.734 E.07446
G3 X90.37 Y143.738 I31.859 J-20.036 E.13266
G2 X92.043 Y142.171 I-15.786 J-18.517 E.06214
G3 X97.896 Y142.458 I2.792 J2.903 E.17784
G2 X100.405 Y144.246 I4.82 J-4.106 E.08434
G2 X104.586 Y142.992 I1.129 J-3.831 E.12515
G3 X107.095 Y141.203 I4.82 J4.106 E.08434
G1 X107.605 Y141.106 E.01407
G2 X108.637 Y142.408 I34.935 J-26.633 E.04505
G1 X87.623 Y136.073 F30000
G1 F10826.06
G2 X88.055 Y137.679 I49.057 J-12.358 E.04505
G2 X90.37 Y136.589 I-.698 J-4.485 E.07028
G3 X92.043 Y135.021 I17.463 J16.954 E.06214
G3 X97.06 Y135.481 I2.222 J3.361 E.14749
G2 X98.732 Y137.049 I17.456 J-16.947 E.06214
G2 X103.75 Y136.589 I2.222 J-3.361 E.14749
G1 X104.581 Y135.772 E.03158
G3 X103.07 Y130.731 I28.509 J-11.293 E.14278
G1 X102.913 Y130.817 E.00485
G3 X98.732 Y129.899 I-1.3 J-4.057 E.12153
G2 X97.06 Y128.331 I-17.46 J16.952 E.06214
G2 X92.043 Y128.791 I-2.222 J3.361 E.14749
G3 X90.37 Y130.359 I-17.458 J-16.95 E.06214
G3 X86.65 Y130.707 I-2.181 J-3.254 E.10553
G3 X86.424 Y124.183 I45.116 J-4.83 E.17703
G2 X90.37 Y123.209 I1.09 J-4.064 E.11494
G3 X92.043 Y121.641 I17.463 J16.954 E.06214
G3 X97.06 Y122.101 I2.222 J3.361 E.14749
M73 P56 R19
G2 X98.732 Y123.669 I17.456 J-16.947 E.06214
G2 X102.712 Y123.906 I2.193 J-3.293 E.11322
G3 X102.902 Y122.255 I18.674 J1.311 E.04505
G1 X105.26 Y114.73 F30000
G1 F10826.06
G2 X104.573 Y116.243 I31.654 J15.279 E.04504
G3 X98.732 Y116.519 I-3.051 J-2.624 E.17737
G2 X97.06 Y114.952 I-17.46 J16.952 E.06214
G2 X92.043 Y115.412 I-2.222 J3.361 E.14749
G3 X90.37 Y116.979 I-17.458 J-16.95 E.06214
G3 X87.254 Y117.531 I-2.132 J-2.97 E.08867
G3 X89.373 Y110.509 I41.274 J8.622 E.19898
G1 X89.534 Y110.441 E.00474
G2 X91.206 Y109.009 I-4.067 J-6.443 E.05987
G3 X97.06 Y108.722 I3.062 J2.616 E.17784
G2 X98.732 Y110.289 I17.456 J-16.947 E.06214
G2 X101.362 Y110.933 I2.081 J-2.806 E.07533
G1 X100.064 Y109.895 E.04505
; WIPE_START
G1 X101.362 Y110.933 E-.63181
G1 X101.024 Y110.938 E-.12819
; WIPE_END
G1 E-.04 F1800
G1 X104.274 Y104.032 Z3.48 F30000
G1 X112.019 Y87.576 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F10826.06
G2 X110.497 Y88.244 I17.656 J42.317 E.04505
G3 X112.112 Y89.76 I-15.273 J17.886 E.06005
G2 X117.129 Y90.22 I2.796 J-2.901 E.14749
G2 X118.802 Y88.652 I-15.786 J-18.517 E.06214
G3 X123.819 Y88.193 I2.796 J2.901 E.14749
G3 X125.491 Y89.76 I-15.788 J18.519 E.06214
G2 X130.509 Y90.22 I2.796 J-2.901 E.14749
G2 X132.181 Y88.652 I-15.786 J-18.517 E.06214
G3 X137.199 Y88.193 I2.796 J2.901 E.14749
G3 X138.871 Y89.76 I-15.788 J18.519 E.06214
G2 X143.888 Y90.22 I2.796 J-2.901 E.14749
G3 X145.878 Y88.421 I34.065 J35.666 E.07269
G2 X144.364 Y87.734 I-23.81 J50.506 E.04505
G1 X131.846 Y100.918 F30000
G1 F10826.06
G3 X133.48 Y101.223 I-2.288 J16.773 E.04506
G3 X137.199 Y101.572 I1.538 J3.603 E.10549
G3 X138.731 Y103.002 I-14.396 J16.961 E.05681
G3 X140.974 Y104.189 I-12.337 J26.015 E.0688
G2 X143.888 Y103.6 I.827 J-3.408 E.08321
G2 X145.561 Y102.032 I-15.786 J-18.517 E.06214
G3 X150.578 Y101.572 I2.796 J2.901 E.14749
G3 X152.251 Y103.14 I-15.788 J18.519 E.06214
G2 X157.268 Y103.6 I2.796 J-2.901 E.14749
G2 X158.94 Y102.032 I-15.786 J-18.517 E.06214
G3 X161.23 Y100.947 I3.007 J3.385 E.06959
G2 X157.285 Y96.433 I-33.495 J25.293 E.16258
G1 X157.268 Y96.45 E.00066
G3 X152.251 Y96.91 I-2.796 J-2.901 E.14749
G3 X150.578 Y95.342 I15.783 J-18.515 E.06214
G2 X145.561 Y94.882 I-2.796 J2.901 E.14749
G2 X143.888 Y96.45 I15.79 J18.522 E.06214
G3 X138.871 Y96.91 I-2.796 J-2.901 E.14749
G3 X137.199 Y95.342 I15.783 J-18.515 E.06214
G2 X132.181 Y94.882 I-2.796 J2.901 E.14749
G2 X130.509 Y96.45 I15.79 J18.522 E.06214
G3 X125.491 Y96.91 I-2.796 J-2.901 E.14749
G3 X123.819 Y95.342 I15.783 J-18.515 E.06214
G2 X118.802 Y94.882 I-2.796 J2.901 E.14749
G2 X117.129 Y96.45 I15.79 J18.522 E.06214
G3 X112.112 Y96.91 I-2.796 J-2.901 E.14749
G3 X110.439 Y95.342 I15.783 J-18.515 E.06214
G2 X105.422 Y94.882 I-2.796 J2.901 E.14749
G2 X103.75 Y96.45 I15.79 J18.522 E.06214
G3 X100.236 Y97.527 I-2.89 J-3.158 E.10291
G1 X105.654 Y101.863 E.18802
G3 X110.439 Y101.572 I2.581 J2.957 E.13975
G3 X112.112 Y103.14 I-15.788 J18.519 E.06214
G2 X114.906 Y104.263 I2.824 J-2.986 E.08356
G3 X118.253 Y102.571 I19.466 J34.334 E.10165
G1 X118.802 Y102.032 E.02084
G3 X122.983 Y101.114 I2.881 J3.139 E.12153
G2 X124.636 Y100.843 I-13.737 J-89.018 E.04541
; WIPE_START
G1 X122.983 Y101.114 E-.63674
G1 X122.667 Y101.039 E-.12326
; WIPE_END
G1 E-.04 F1800
G1 X130.166 Y102.461 Z3.48 F30000
G1 X166.108 Y109.279 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F10826.06
G3 X166.746 Y110.814 I-40.319 J17.649 E.04505
G1 X166.466 Y110.748 E.00778
G1 X165.63 Y110.289 E.02584
G3 X163.958 Y108.722 I15.786 J-18.517 E.06214
G2 X158.94 Y108.262 I-2.796 J2.901 E.14749
G2 X157.268 Y109.829 I15.79 J18.522 E.06214
G3 X151.414 Y109.543 I-2.792 J-2.903 E.17784
G2 X148.906 Y107.754 I-4.82 J4.106 E.08434
G2 X145.941 Y108.054 I-1.128 J3.657 E.08294
G3 X151.048 Y115.371 I-19.457 J19.019 E.24289
G3 X152.251 Y116.519 I-11.574 J13.329 E.04508
G2 X157.268 Y116.979 I2.796 J-2.901 E.14749
G2 X158.94 Y115.412 I-15.786 J-18.517 E.06214
G3 X163.958 Y114.952 I2.796 J2.901 E.14749
G3 X165.63 Y116.519 I-15.786 J18.517 E.06214
G2 X168.767 Y117.639 I2.844 J-3.014 E.09288
G3 X169.563 Y123.926 I-40.889 J8.372 E.17189
G3 X165.63 Y123.669 I-1.744 J-3.538 E.11183
G3 X163.958 Y122.101 I15.786 J-18.517 E.06214
G2 X158.94 Y121.641 I-2.796 J2.901 E.14749
G2 X157.268 Y123.209 I15.79 J18.522 E.06214
G3 X153.31 Y124.18 I-2.857 J-3.092 E.11526
G3 X152.985 Y130.435 I-28.915 J1.63 E.17005
G2 X157.268 Y130.359 I2.083 J-3.294 E.1229
G2 X158.94 Y128.791 I-15.786 J-18.517 E.06214
G3 X163.958 Y128.331 I2.796 J2.901 E.14749
G3 X165.63 Y129.899 I-15.786 J18.517 E.06214
G2 X169.322 Y130.933 I2.858 J-3.094 E.10785
G3 X167.934 Y137.713 I-44.551 J-5.586 E.1877
G3 X165.63 Y137.049 I-.139 J-3.845 E.06608
G3 X163.958 Y135.481 I15.786 J-18.517 E.06214
G2 X158.94 Y135.021 I-2.796 J2.901 E.14749
G2 X157.268 Y136.589 I15.79 J18.522 E.06214
G3 X152.251 Y137.049 I-2.796 J-2.901 E.14749
G3 X151.26 Y136.15 I9.026 J-10.948 E.03624
G3 X148.432 Y141.048 I-23.61 J-10.368 E.15356
G3 X150.578 Y141.711 I.006 J3.787 E.06179
G3 X152.251 Y143.278 I-15.788 J18.519 E.06214
G2 X157.268 Y143.738 I2.796 J-2.901 E.14749
G2 X158.94 Y142.171 I-15.786 J-18.517 E.06214
G3 X163.958 Y141.711 I2.796 J2.901 E.14749
G2 X165.803 Y143.405 I109.625 J-117.567 E.06787
G3 X163.153 Y148.272 I-42.476 J-19.967 E.15027
G2 X158.94 Y148.401 I-2.005 J3.398 E.12048
G2 X157.268 Y149.968 I15.79 J18.522 E.06214
G3 X152.251 Y150.428 I-2.796 J-2.901 E.14749
G3 X150.578 Y148.861 I15.783 J-18.515 E.06214
G2 X145.561 Y148.401 I-2.796 J2.901 E.14749
G2 X143.888 Y149.968 I15.79 J18.522 E.06214
G3 X138.871 Y150.428 I-2.796 J-2.901 E.14749
G3 X137.772 Y149.423 I10.101 J-12.152 E.04036
G3 X136.218 Y150.014 I-18.155 J-45.449 E.04505
G1 X148.165 Y162.405 F30000
G1 F10826.06
G2 X149.603 Y161.569 I-16.296 J-29.689 E.04505
G2 X144.725 Y162.527 I-1.843 J3.514 E.14556
G3 X142.216 Y164.316 I-4.82 J-4.106 E.08434
G3 X138.035 Y163.061 I-1.129 J-3.831 E.12515
G2 X135.526 Y161.272 I-4.82 J4.106 E.08434
G2 X131.345 Y162.527 I-1.129 J3.831 E.12515
G3 X128.836 Y164.316 I-4.82 J-4.106 E.08434
G3 X124.655 Y163.061 I-1.129 J-3.831 E.12515
G2 X122.147 Y161.272 I-4.82 J4.106 E.08434
G2 X117.965 Y162.527 I-1.129 J3.831 E.12515
G3 X115.457 Y164.316 I-4.82 J-4.106 E.08434
G3 X111.276 Y163.061 I-1.129 J-3.831 E.12515
G2 X108.767 Y161.272 I-4.82 J4.106 E.08434
G2 X106.117 Y161.4 I-1.147 J3.76 E.07333
G3 X101.106 Y157.759 I22.333 J-36.01 E.16798
G2 X104.586 Y156.371 I.442 J-3.948 E.10572
G3 X107.095 Y154.582 I4.82 J4.106 E.08434
G3 X111.276 Y155.837 I1.129 J3.831 E.12515
G2 X113.784 Y157.626 I4.82 J-4.106 E.08434
G2 X117.965 Y156.371 I1.129 J-3.831 E.12515
G3 X120.474 Y154.582 I4.82 J4.106 E.08434
G3 X124.655 Y155.837 I1.129 J3.831 E.12515
G2 X127.164 Y157.626 I4.82 J-4.106 E.08434
G2 X131.345 Y156.371 I1.129 J-3.831 E.12515
G3 X133.854 Y154.582 I4.82 J4.106 E.08434
G3 X138.035 Y155.837 I1.129 J3.831 E.12515
G2 X140.543 Y157.626 I4.82 J-4.106 E.08434
G2 X144.725 Y156.371 I1.129 J-3.831 E.12515
G3 X147.233 Y154.582 I4.82 J4.106 E.08434
G3 X151.414 Y155.837 I1.129 J3.831 E.12515
G2 X153.923 Y157.626 I4.82 J-4.106 E.08434
G2 X154.866 Y157.784 I.862 J-2.256 E.02607
G2 X156.113 Y156.684 I-21.777 J-25.956 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X154.866 Y157.784 E-.63176
G1 X154.533 Y157.728 E-.12824
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/58
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.48 I-.431 J-1.138 P1  F30000
G1 X127.486 Y167.967 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.514 J-41.967 E2.41721
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.89 Y84.039 I29.75 J29.608 E.92007
G3 X127.546 Y167.968 I-.89 J41.961 E3.56104
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X92.492 Y102.847 I.515 J-42.384 E2.45393
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X128.901 Y83.623 I30.376 J29.595 E.94179
G3 X127.541 Y168.385 I-.904 J42.377 E3.59616
M204 S250
G1 X127.476 Y168.786 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.525 J-42.785 E2.30927
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.91 Y83.223 I30.948 J29.498 E.89323
G3 X127.536 Y168.787 I-.91 J42.778 E3.3684
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.4221
G1 X125.537 Y168.717 E-.3379
; WIPE_END
G1 E-.04 F1800
G1 X123.208 Y161.449 Z3.64 F30000
G1 X119.512 Y149.914 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X117.962 Y149.312 I13.601 J-37.334 E.04505
G3 X115.457 Y150.974 I-4.272 J-3.72 E.08246
G3 X112.112 Y150.284 I-.949 J-3.849 E.09568
G3 X110.439 Y148.726 I41.333 J-46.038 E.06194
G2 X105.422 Y148.545 I-2.62 J2.991 E.14724
G2 X103.75 Y150.103 I41.36 J46.067 E.06194
G3 X98.732 Y150.284 I-2.62 J-2.991 E.14724
G3 X97.06 Y148.726 I41.333 J-46.038 E.06194
G2 X92.75 Y148.119 I-2.618 J2.988 E.12481
G3 X90.305 Y143.633 I40.476 J-24.967 E.1385
G1 X90.37 Y143.594 E.00205
G2 X92.043 Y142.036 I-41.319 J-46.022 E.06194
G3 X97.06 Y141.855 I2.62 J2.991 E.14724
G3 X98.732 Y143.413 I-41.36 J46.067 E.06194
G2 X103.75 Y143.594 I2.62 J-2.991 E.14724
G2 X105.422 Y142.036 I-41.319 J-46.022 E.06194
G3 X107.601 Y141.096 I2.71 J3.284 E.06518
G2 X108.635 Y142.397 I13.76 J-9.866 E.04506
G1 X87.624 Y136.077 F30000
G1 F10826.06
G2 X88.056 Y137.682 I48.796 J-12.293 E.04505
G2 X90.37 Y136.723 I-.42 J-4.285 E.06886
G3 X92.043 Y135.165 I43.033 J44.509 E.06194
G3 X97.06 Y135.346 I2.397 J3.172 E.14724
G2 X98.732 Y136.905 I43.005 J-44.479 E.06194
G2 X102.913 Y137.286 I2.407 J-3.277 E.11954
G2 X104.631 Y135.888 I-5.807 J-8.892 E.06012
G3 X103.052 Y130.634 I27.859 J-11.236 E.14887
G3 X98.732 Y130.034 I-1.703 J-3.586 E.12512
G2 X97.06 Y128.475 I-43.033 J44.509 E.06194
G2 X92.043 Y128.656 I-2.397 J3.172 E.14724
G3 X90.37 Y130.215 I-42.991 J-44.464 E.06194
G3 X86.658 Y130.769 I-2.374 J-3.188 E.10592
G3 X86.502 Y129.114 I45.68 J-5.147 E.04505
G1 X102.886 Y122.331 F30000
G1 F10826.06
G2 X102.705 Y123.983 I21.989 J3.247 E.04505
G3 X98.732 Y123.525 I-1.589 J-3.673 E.11348
G3 X97.06 Y121.967 I41.333 J-46.038 E.06194
G2 X92.043 Y121.785 I-2.62 J2.991 E.14724
G2 X90.37 Y123.344 I41.36 J46.067 E.06194
G3 X86.428 Y124.098 I-2.643 J-3.133 E.11364
G3 X87.249 Y117.556 I41.815 J1.925 E.17885
G2 X90.37 Y116.835 I.805 J-3.63 E.08972
G2 X92.043 Y115.277 I-41.319 J-46.022 E.06194
G3 X97.06 Y115.096 I2.62 J2.991 E.14724
G3 X98.732 Y116.654 I-41.36 J46.067 E.06194
G2 X101.241 Y117.639 I2.799 J-3.44 E.0742
G2 X104.586 Y116.07 I-.035 J-4.425 E.10327
G2 X105.507 Y114.251 I-21.698 J-12.127 E.05528
G1 X101.361 Y110.933 E.14388
G3 X98.732 Y110.145 I-.339 J-3.65 E.07622
G3 X97.06 Y108.587 I41.333 J-46.038 E.06194
G2 X94.551 Y107.602 I-2.799 J3.44 E.0742
G2 X91.206 Y109.171 I.035 J4.425 E.10327
G3 X89.534 Y110.527 I-4.861 J-4.285 E.05862
G1 X89.337 Y110.6 E.00569
G3 X89.985 Y109.069 I49.459 J20.037 E.04505
; WIPE_START
G1 X89.337 Y110.6 E-.63175
G1 X89.534 Y110.527 E-.07976
G1 X89.64 Y110.456 E-.04849
; WIPE_END
G1 E-.04 F1800
G1 X94.968 Y104.991 Z3.64 F30000
G1 X111.898 Y87.626 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F10826.06
G2 X110.378 Y88.3 I17.071 J40.559 E.04505
G3 X112.112 Y89.895 I-22.169 J25.834 E.06385
G2 X117.129 Y90.076 I2.62 J-2.991 E.14724
G2 X118.802 Y88.518 I-41.333 J-46.038 E.06194
G3 X123.819 Y88.337 I2.62 J2.991 E.14724
G3 X125.491 Y89.895 I-41.36 J46.067 E.06194
G2 X130.509 Y90.076 I2.62 J-2.991 E.14724
G2 X132.181 Y88.518 I-41.333 J-46.038 E.06194
G3 X137.199 Y88.337 I2.62 J2.991 E.14724
G3 X138.871 Y89.895 I-41.36 J46.067 E.06194
G2 X143.888 Y90.076 I2.62 J-2.991 E.14724
G3 X145.776 Y88.373 I22.482 J23.021 E.06892
G2 X144.26 Y87.691 I-20.161 J42.838 E.04505
G1 X131.743 Y100.901 F30000
G1 F10826.06
G3 X133.378 Y101.202 I-2.235 J16.774 E.04506
G3 X137.199 Y101.716 I1.446 J3.705 E.10907
G3 X138.445 Y102.87 I-30.621 J34.324 E.04602
G3 X141.005 Y104.209 I-31.989 J64.289 E.07829
G2 X143.888 Y103.456 I.598 J-3.609 E.08317
G2 X145.561 Y101.897 I-41.319 J-46.022 E.06194
G3 X150.578 Y101.716 I2.62 J2.991 E.14724
G3 X152.251 Y103.274 I-41.36 J46.067 E.06194
G2 X157.268 Y103.456 I2.62 J-2.991 E.14724
G2 X158.94 Y101.897 I-41.319 J-46.022 E.06194
G3 X161.227 Y100.942 I2.727 J3.315 E.06811
G2 X157.355 Y96.502 I-33.453 J25.267 E.15977
G3 X152.251 Y96.766 I-2.713 J-2.995 E.14993
G3 X150.578 Y95.208 I41.333 J-46.038 E.06194
G2 X145.561 Y95.026 I-2.62 J2.991 E.14724
G2 X143.888 Y96.585 I41.36 J46.067 E.06194
G3 X138.871 Y96.766 I-2.62 J-2.991 E.14724
G3 X137.199 Y95.208 I41.333 J-46.038 E.06194
G2 X132.181 Y95.026 I-2.62 J2.991 E.14724
G2 X130.509 Y96.585 I41.36 J46.067 E.06194
G3 X125.491 Y96.766 I-2.62 J-2.991 E.14724
G3 X123.819 Y95.208 I41.333 J-46.038 E.06194
G2 X118.802 Y95.026 I-2.62 J2.991 E.14724
G2 X117.129 Y96.585 I41.36 J46.067 E.06194
G3 X112.112 Y96.766 I-2.62 J-2.991 E.14724
G3 X110.439 Y95.208 I41.333 J-46.038 E.06194
G2 X105.422 Y95.026 I-2.62 J2.991 E.14724
G2 X103.75 Y96.585 I41.36 J46.067 E.06194
G3 X100.115 Y97.43 I-2.645 J-3.139 E.10498
G1 X105.571 Y101.797 E.18939
G3 X110.439 Y101.716 I2.485 J3.019 E.14241
G3 X112.112 Y103.274 I-41.36 J46.067 E.06194
G2 X114.947 Y104.238 I2.576 J-2.925 E.08328
G3 X117.959 Y102.697 I21.609 J38.509 E.09171
G2 X118.802 Y101.897 I-21.688 J-23.703 E.03147
G3 X122.796 Y101.158 I2.647 J3.143 E.11514
G3 X124.434 Y100.877 I3.685 J16.536 E.04506
; WIPE_START
G1 X122.796 Y101.158 E-.63166
G1 X122.472 Y101.063 E-.12834
; WIPE_END
G1 E-.04 F1800
G1 X129.975 Y102.461 Z3.64 F30000
G1 X166.067 Y109.186 Z3.64
M73 P57 R19
G1 Z3.24
G1 E.8 F1800
G1 F10826.06
G3 X166.709 Y110.72 I-41.999 J18.495 E.04505
G1 X166.466 Y110.648 E.00687
G1 X165.63 Y110.145 E.02644
G3 X163.958 Y108.587 I41.347 J-46.052 E.06194
G2 X158.94 Y108.406 I-2.62 J2.991 E.14724
G2 X157.268 Y109.964 I41.36 J46.067 E.06194
G3 X152.251 Y110.145 I-2.62 J-2.991 E.14724
G3 X150.578 Y108.587 I41.333 J-46.038 E.06194
G2 X146.02 Y108.13 I-2.599 J2.959 E.13249
G3 X151.162 Y115.63 I-18.19 J17.986 E.24772
G3 X152.251 Y116.654 I-27.192 J29.987 E.0405
G2 X157.268 Y116.835 I2.62 J-2.991 E.14724
G2 X158.94 Y115.277 I-41.319 J-46.022 E.06194
G3 X163.958 Y115.096 I2.62 J2.991 E.14724
G3 X165.63 Y116.654 I-41.347 J46.052 E.06194
G2 X168.759 Y117.599 I2.602 J-2.964 E.09132
G3 X169.567 Y123.997 I-40.92 J8.415 E.17492
G3 X165.63 Y123.525 I-1.556 J-3.679 E.11242
G3 X163.958 Y121.967 I41.347 J-46.052 E.06194
G2 X158.94 Y121.785 I-2.62 J2.991 E.14724
G2 X157.268 Y123.344 I41.36 J46.067 E.06194
G3 X153.305 Y124.092 I-2.644 J-3.137 E.11424
G2 X153.128 Y122.439 I-34.163 J2.827 E.04504
G1 X169.492 Y129.204 F30000
G1 F10826.06
G3 X169.331 Y130.859 I-43.991 J-3.436 E.04505
G3 X165.63 Y130.034 I-1.061 J-3.953 E.10683
G2 X163.958 Y128.475 I-43.019 J44.494 E.06194
G2 X158.94 Y128.656 I-2.397 J3.172 E.14724
G3 X157.268 Y130.215 I-42.991 J-44.464 E.06194
G3 X153.087 Y130.596 I-2.407 J-3.277 E.11954
G1 X152.969 Y130.517 E.00383
G3 X151.31 Y136.041 I-29.788 J-5.936 E.15652
G2 X152.251 Y136.905 I23.856 J-25.035 E.03459
G2 X157.268 Y136.723 I2.397 J-3.172 E.14724
G3 X158.94 Y135.165 I43.033 J44.509 E.06194
G3 X162.285 Y134.475 I2.396 J3.159 E.09568
G3 X164.794 Y136.14 I-1.768 J5.386 E.08258
G2 X167.94 Y137.695 I3.359 J-2.833 E.09782
G2 X168.373 Y136.09 I-47.417 J-13.665 E.04505
G1 X148.247 Y162.359 F30000
G1 F10826.06
G2 X149.683 Y161.521 I-16.329 J-29.651 E.04505
G2 X145.561 Y161.924 I-1.723 J3.66 E.11783
G2 X143.888 Y163.482 I41.36 J46.067 E.06194
G3 X138.871 Y163.664 I-2.62 J-2.991 E.14724
G3 X137.199 Y162.105 I41.333 J-46.038 E.06194
G2 X132.181 Y161.924 I-2.62 J2.991 E.14724
G2 X130.509 Y163.482 I41.36 J46.067 E.06194
G3 X125.491 Y163.664 I-2.62 J-2.991 E.14724
G3 X123.819 Y162.105 I41.333 J-46.038 E.06194
G2 X118.802 Y161.924 I-2.62 J2.991 E.14724
G2 X117.129 Y163.482 I41.36 J46.067 E.06194
G3 X112.112 Y163.664 I-2.62 J-2.991 E.14724
G3 X110.439 Y162.105 I41.333 J-46.038 E.06194
G2 X106.168 Y161.432 I-2.717 J3.352 E.12272
G3 X101.106 Y157.76 I22.345 J-36.124 E.16962
G2 X103.75 Y156.974 I.355 J-3.646 E.07661
G2 X105.422 Y155.416 I-41.319 J-46.022 E.06194
G3 X110.439 Y155.234 I2.62 J2.991 E.14724
G3 X112.112 Y156.793 I-41.36 J46.067 E.06194
G2 X117.129 Y156.974 I2.62 J-2.991 E.14724
G2 X118.802 Y155.416 I-41.319 J-46.022 E.06194
G3 X123.819 Y155.234 I2.62 J2.991 E.14724
G3 X125.491 Y156.793 I-41.36 J46.067 E.06194
G2 X130.509 Y156.974 I2.62 J-2.991 E.14724
G2 X132.181 Y155.416 I-41.319 J-46.022 E.06194
G3 X137.199 Y155.234 I2.62 J2.991 E.14724
G3 X138.871 Y156.793 I-41.36 J46.067 E.06194
G2 X143.888 Y156.974 I2.62 J-2.991 E.14724
G2 X145.561 Y155.416 I-41.319 J-46.022 E.06194
G3 X150.578 Y155.234 I2.62 J2.991 E.14724
G3 X152.251 Y156.793 I-41.36 J46.067 E.06194
G2 X154.882 Y157.77 I2.593 J-2.95 E.07777
G2 X156.128 Y156.67 I-21.785 J-25.949 E.04505
G1 X147.387 Y142.381 F30000
G1 F10826.06
G2 X148.414 Y141.073 I-29.325 J-24.085 E.04504
G3 X151.414 Y142.62 I-.358 J4.379 E.09388
G2 X153.923 Y144.285 I4.277 J-3.722 E.08258
G2 X157.268 Y143.594 I.949 J-3.849 E.09568
G2 X158.94 Y142.036 I-41.319 J-46.022 E.06194
G3 X163.958 Y141.855 I2.62 J2.991 E.14724
G2 X165.758 Y143.499 I36.747 J-38.426 E.06608
G3 X163.192 Y148.211 I-42.569 J-20.13 E.14545
G1 X163.121 Y148.163 E.00231
G2 X158.94 Y148.545 I-1.774 J3.659 E.11954
G2 X157.268 Y150.103 I41.36 J46.067 E.06194
G3 X152.251 Y150.284 I-2.62 J-2.991 E.14724
G3 X150.578 Y148.726 I41.333 J-46.038 E.06194
G2 X145.561 Y148.545 I-2.62 J2.991 E.14724
G2 X143.888 Y150.103 I41.36 J46.067 E.06194
G3 X138.871 Y150.284 I-2.62 J-2.991 E.14724
G3 X137.885 Y149.377 I24.061 J-27.151 E.03632
G3 X136.333 Y149.973 I-8.875 J-20.773 E.04506
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X137.885 Y149.377 E-.63172
G1 X138.133 Y149.605 E-.12828
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/58
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.64 I-1.053 J-.61 P1  F30000
G1 X127.486 Y167.97 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.515 J-41.969 E2.41729
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.044 J11.845 E4.01392
G1 X98.251 Y96.394 E.46374
G3 X128.857 Y84.038 I29.735 J29.573 E.9192
G3 X127.546 Y167.971 I-.856 J41.963 E3.56213
G1 X127.481 Y168.386 F30000
G1 F9000
G3 X92.492 Y102.847 I.516 J-42.385 E2.45397
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.513 J11.953 E3.96626
G1 X97.629 Y96.428 E.48568
G3 X128.867 Y83.622 I30.369 J29.578 E.9409
G3 X127.541 Y168.387 I-.87 J42.379 E3.59717
M204 S250
G1 X127.476 Y168.783 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.525 J-42.784 E2.3092
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.995 J12.051 E3.63683
G1 X97.039 Y96.469 E.47023
G3 X128.877 Y83.222 I30.963 J29.533 E.89234
G3 X127.536 Y168.784 I-.876 J42.778 E3.36912
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.42209
G1 X125.537 Y168.717 E-.33791
; WIPE_END
G1 E-.04 F1800
G1 X123.246 Y161.437 Z3.8 F30000
G1 X119.633 Y149.956 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X118.08 Y149.361 I5.276 J-16.11 E.04506
G3 X116.293 Y150.757 I-6.521 J-6.508 E.06161
G3 X112.112 Y150.145 I-1.576 J-3.821 E.12019
G2 X110.439 Y148.588 I-81.258 J85.605 E.06192
G2 X105.422 Y148.683 I-2.451 J3.111 E.14727
G3 X103.75 Y150.24 I-81.107 J-85.442 E.06192
G3 X98.732 Y150.145 I-2.451 J-3.111 E.14727
M73 P57 R18
G2 X97.06 Y148.588 I-81.258 J85.605 E.06192
G2 X92.795 Y148.19 I-2.436 J3.049 E.12287
G3 X90.256 Y143.53 I40.085 J-24.857 E.14387
G1 X90.37 Y143.456 E.00368
G3 X92.043 Y141.898 I81.206 J85.548 E.06192
G3 X97.06 Y141.994 I2.451 J3.111 E.14727
G2 X98.732 Y143.551 I81.159 J-85.498 E.06192
G2 X103.75 Y143.456 I2.451 J-3.111 E.14727
G3 X105.422 Y141.898 I81.206 J85.548 E.06192
G3 X107.586 Y141.08 I2.45 J3.209 E.06357
G2 X108.616 Y142.385 I37.444 J-28.522 E.04505
G1 X99.868 Y156.667 F30000
G1 F10826.06
G2 X101.114 Y157.767 I23.033 J-24.846 E.04505
G2 X103.75 Y156.835 I.118 J-3.859 E.0775
G3 X105.422 Y155.278 I81.206 J85.548 E.06192
G3 X110.439 Y155.373 I2.451 J3.111 E.14727
G2 X112.112 Y156.93 I81.159 J-85.498 E.06192
G2 X117.129 Y156.835 I2.451 J-3.111 E.14727
G3 X118.802 Y155.278 I81.206 J85.548 E.06192
G3 X123.819 Y155.373 I2.451 J3.111 E.14727
G2 X125.491 Y156.93 I81.159 J-85.498 E.06192
G2 X130.509 Y156.835 I2.451 J-3.111 E.14727
G3 X132.181 Y155.278 I81.206 J85.548 E.06192
G3 X137.199 Y155.373 I2.451 J3.111 E.14727
G2 X138.871 Y156.93 I81.159 J-85.498 E.06192
G2 X143.888 Y156.835 I2.451 J-3.111 E.14727
G3 X145.561 Y155.278 I81.206 J85.548 E.06192
G3 X150.578 Y155.373 I2.451 J3.111 E.14727
G2 X152.251 Y156.93 I81.159 J-85.498 E.06192
G2 X154.892 Y157.761 I2.357 J-2.88 E.07688
G3 X149.742 Y161.451 I-23.92 J-27.945 E.17189
G2 X145.561 Y162.063 I-1.576 J3.821 E.12019
G3 X143.888 Y163.62 I-81.107 J-85.442 E.06192
G3 X138.871 Y163.525 I-2.451 J-3.111 E.14727
G2 X137.199 Y161.968 I-81.258 J85.605 E.06192
G2 X132.181 Y162.063 I-2.451 J3.111 E.14727
G3 X130.509 Y163.62 I-81.107 J-85.442 E.06192
G3 X125.491 Y163.525 I-2.451 J-3.111 E.14727
G2 X123.819 Y161.968 I-81.258 J85.605 E.06192
G2 X118.802 Y162.063 I-2.451 J3.111 E.14727
G3 X117.129 Y163.62 I-81.107 J-85.442 E.06192
G3 X112.112 Y163.525 I-2.451 J-3.111 E.14727
G2 X110.439 Y161.968 I-81.258 J85.605 E.06192
G2 X106.289 Y161.504 I-2.464 J3.244 E.11883
G2 X107.724 Y162.342 I17.794 J-28.831 E.04505
G1 X136.451 Y149.929 F30000
G1 F10826.06
G2 X138.001 Y149.328 I-7.379 J-21.338 E.04506
G3 X138.871 Y150.145 I-41.353 J44.896 E.03233
G2 X143.888 Y150.24 I2.567 J-3.016 E.14727
G2 X145.561 Y148.683 I-79.435 J-86.999 E.06192
G3 X150.578 Y148.588 I2.567 J3.016 E.14727
G3 X152.251 Y150.145 I-79.586 J87.162 E.06192
G2 X157.268 Y150.24 I2.567 J-3.016 E.14727
G2 X158.94 Y148.683 I-79.435 J-86.999 E.06192
G3 X163.121 Y148.072 I2.605 J3.209 E.12019
G1 X163.236 Y148.142 E.00363
G2 X165.71 Y143.6 I-40.327 J-24.919 E.14022
G3 X163.958 Y141.994 I23.02 J-26.872 E.06444
G2 X158.94 Y141.898 I-2.567 J3.016 E.14727
G2 X157.268 Y143.456 I79.534 J87.105 E.06192
G3 X152.251 Y143.551 I-2.567 J-3.016 E.14727
G3 X150.578 Y141.994 I79.487 J-87.055 E.06192
G2 X148.401 Y141.091 I-2.627 J3.261 E.06474
G3 X147.372 Y142.397 I-29.37 J-22.068 E.04504
G1 X168.376 Y136.079 F30000
G1 F10826.06
G3 X167.943 Y137.684 I-48.632 J-12.252 E.04505
G3 X165.63 Y136.766 I.338 J-4.223 E.06844
G2 X163.958 Y135.209 I-81.209 J85.551 E.06192
G2 X158.94 Y135.304 I-2.451 J3.111 E.14727
G3 X157.268 Y136.861 I-81.107 J-85.442 E.06192
G3 X152.251 Y136.766 I-2.451 J-3.111 E.14727
G2 X151.358 Y135.928 I-43.89 J45.853 E.03317
G2 X152.953 Y130.605 I-23.805 J-10.034 E.15086
G1 X153.087 Y130.688 E.00426
G2 X157.268 Y130.076 I1.576 J-3.821 E.12019
G3 X158.94 Y128.519 I81.206 J85.548 E.06192
G3 X163.958 Y128.614 I2.451 J3.111 E.14727
G2 X165.63 Y130.171 I81.209 J-85.551 E.06192
G2 X169.339 Y130.79 I2.435 J-3.171 E.10609
G2 X169.497 Y129.135 I-45.064 J-5.116 E.04505
G1 X153.115 Y122.357 F30000
G1 F10826.06
G3 X153.3 Y124.009 I-33.47 J4.59 E.04504
G2 X157.268 Y123.481 I1.524 J-3.721 E.11353
G2 X158.94 Y121.924 I-79.435 J-86.999 E.06192
G3 X163.958 Y121.829 I2.567 J3.016 E.14727
G3 X165.63 Y123.386 I-79.536 J87.108 E.06192
G2 X169.57 Y124.073 I2.579 J-3.149 E.1133
G2 X168.752 Y117.565 I-41.791 J1.947 E.17792
G3 X165.63 Y116.792 I-.743 J-3.689 E.09006
G3 X163.958 Y115.234 I79.536 J-87.108 E.06192
G2 X158.94 Y115.139 I-2.567 J3.016 E.14727
G2 X157.268 Y116.696 I79.534 J87.105 E.06192
G3 X152.251 Y116.792 I-2.567 J-3.016 E.14727
G3 X151.272 Y115.887 I46.183 J-50.932 E.0361
G2 X146.09 Y108.198 I-23.456 J10.216 E.25266
G3 X150.578 Y108.45 I2.067 J3.268 E.12997
G3 X152.251 Y110.007 I-79.586 J87.162 E.06192
G2 X157.268 Y110.102 I2.567 J-3.016 E.14727
G2 X158.94 Y108.545 I-79.435 J-86.999 E.06192
G3 X163.958 Y108.45 I2.567 J3.016 E.14727
G3 X165.63 Y110.007 I-79.536 J87.108 E.06192
G1 X166.466 Y110.555 E.02709
G1 X166.674 Y110.628 E.00596
G2 X166.027 Y109.096 I-47.169 J19.019 E.04505
G1 X144.142 Y87.643 F30000
G1 F10826.06
G3 X145.661 Y88.318 I-17.2 J40.71 E.04505
G2 X143.888 Y89.937 I19.761 J23.416 E.06507
G3 X138.871 Y90.032 I-2.567 J-3.016 E.14727
G3 X137.199 Y88.475 I79.487 J-87.055 E.06192
G2 X132.181 Y88.38 I-2.567 J3.016 E.14727
G2 X130.509 Y89.937 I79.534 J87.105 E.06192
G3 X125.491 Y90.032 I-2.567 J-3.016 E.14727
G3 X123.819 Y88.475 I79.487 J-87.055 E.06192
G2 X118.802 Y88.38 I-2.567 J3.016 E.14727
G2 X117.129 Y89.937 I79.534 J87.105 E.06192
G3 X112.112 Y90.032 I-2.567 J-3.016 E.14727
G3 X110.439 Y88.475 I79.487 J-87.055 E.06192
G1 X110.258 Y88.357 E.00587
G2 X98.788 Y96.368 I18.039 J38.042 E.38088
G1 X99.976 Y97.318 E.04121
G2 X103.75 Y96.722 I1.339 J-3.766 E.10794
G2 X105.422 Y95.165 I-79.435 J-86.999 E.06192
G3 X110.439 Y95.07 I2.567 J3.016 E.14727
G3 X112.112 Y96.627 I-79.586 J87.162 E.06192
G2 X117.129 Y96.722 I2.567 J-3.016 E.14727
G2 X118.802 Y95.165 I-79.435 J-86.999 E.06192
G3 X123.819 Y95.07 I2.567 J3.016 E.14727
G3 X125.491 Y96.627 I-79.586 J87.162 E.06192
G2 X130.509 Y96.722 I2.567 J-3.016 E.14727
G2 X132.181 Y95.165 I-79.435 J-86.999 E.06192
G3 X137.199 Y95.07 I2.567 J3.016 E.14727
G3 X138.871 Y96.627 I-79.586 J87.162 E.06192
G2 X143.888 Y96.722 I2.567 J-3.016 E.14727
G2 X145.561 Y95.165 I-79.435 J-86.999 E.06192
G3 X150.578 Y95.07 I2.567 J3.016 E.14727
G3 X152.251 Y96.627 I-79.586 J87.162 E.06192
G2 X157.427 Y96.575 I2.558 J-3.076 E.15257
G3 X161.219 Y100.932 I-29.665 J29.646 E.15663
G2 X158.94 Y101.76 I.189 J4.071 E.06671
G2 X157.268 Y103.317 I79.534 J87.105 E.06192
G3 X152.251 Y103.412 I-2.567 J-3.016 E.14727
G3 X150.578 Y101.855 I79.487 J-87.055 E.06192
G2 X145.561 Y101.76 I-2.567 J3.016 E.14727
G2 X143.888 Y103.317 I79.534 J87.105 E.06192
G3 X141.041 Y104.231 I-2.504 J-2.907 E.08324
G2 X138.142 Y102.74 I-23.026 J41.212 E.08833
G3 X137.199 Y101.855 I45.256 J-49.194 E.03507
G2 X133.242 Y101.173 I-2.58 J3.152 E.11376
G2 X122.661 Y101.194 I-5.241 J25.277 E.28877
G2 X118.802 Y101.76 I-1.422 J3.742 E.11039
G2 X117.646 Y102.831 I54.688 J60.156 E.04269
G2 X114.984 Y104.215 I26.326 J53.87 E.08131
G3 X112.112 Y103.412 I-.521 J-3.674 E.08317
G3 X110.439 Y101.855 I79.487 J-87.055 E.06192
G2 X105.48 Y101.724 I-2.561 J3.004 E.14536
G1 X106.778 Y102.763 E.04505
; WIPE_START
G1 X105.48 Y101.724 E-.63181
G1 X105.767 Y101.547 E-.12819
; WIPE_END
G1 E-.04 F1800
G1 X98.889 Y104.855 Z3.8 F30000
G1 X89.945 Y109.158 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F10826.06
G2 X89.302 Y110.691 I42.981 J18.952 E.04505
G1 X89.534 Y110.618 E.00659
G2 X91.206 Y109.331 I-2.487 J-4.961 E.05754
G3 X93.715 Y107.703 I4.124 J3.607 E.08208
G3 X97.06 Y108.45 I.888 J3.888 E.096
G3 X98.732 Y110.007 I-79.586 J87.162 E.06192
G2 X101.368 Y110.938 I2.517 J-2.928 E.0775
G1 X105.507 Y114.251 E.14367
G2 X104.804 Y115.709 I15.511 J8.375 E.04388
G3 X102.913 Y117.245 I-8.061 J-7.994 E.06613
G3 X98.732 Y116.792 I-1.713 J-3.707 E.11971
G3 X97.06 Y115.234 I79.487 J-87.055 E.06192
G2 X92.043 Y115.139 I-2.567 J3.016 E.14727
G2 X90.37 Y116.696 I79.534 J87.105 E.06192
G3 X87.243 Y117.587 I-2.531 J-2.948 E.0909
G2 X86.432 Y124.02 I40.937 J8.429 E.17586
G2 X90.37 Y123.481 I1.496 J-3.726 E.11266
G2 X92.043 Y121.924 I-79.435 J-86.999 E.06192
G3 X97.06 Y121.829 I2.567 J3.016 E.14727
G3 X98.732 Y123.386 I-79.586 J87.162 E.06192
G2 X102.698 Y124.065 I2.581 J-3.153 E.11403
G3 X102.874 Y122.412 I23.129 J1.629 E.04505
G1 X86.507 Y129.182 F30000
G1 F10826.06
G2 X86.666 Y130.837 I44.263 J-3.433 E.04505
G2 X90.37 Y130.076 I1.129 J-3.9 E.10657
G3 X92.043 Y128.519 I81.206 J85.548 E.06192
G3 X97.06 Y128.614 I2.451 J3.111 E.14727
G2 X98.732 Y130.171 I81.159 J-85.498 E.06192
G2 X103.036 Y130.544 I2.431 J-3.04 E.12407
G2 X104.68 Y136.002 I29.064 J-5.78 E.15469
G3 X102.913 Y137.378 I-6.444 J-6.451 E.06083
G3 X98.732 Y136.766 I-1.576 J-3.821 E.12019
G2 X97.06 Y135.209 I-81.258 J85.605 E.06192
G2 X92.043 Y135.304 I-2.451 J3.111 E.14727
G3 X90.37 Y136.861 I-81.107 J-85.442 E.06192
G3 X88.059 Y137.691 I-2.475 J-3.257 E.06758
G3 X87.626 Y136.086 I47.779 J-13.756 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X88.059 Y137.691 E-.63175
G1 X88.395 Y137.664 E-.12825
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/58
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.8 I-.746 J.962 P1  F30000
G1 X127.486 Y167.967 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.514 J-41.967 E2.4172
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.823 Y84.037 I29.736 J29.573 E.91829
G3 X127.546 Y167.968 I-.823 J41.963 E3.56289
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X92.492 Y102.847 I.516 J-42.384 E2.45392
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96578
G1 X97.629 Y96.428 E.48568
G3 X128.833 Y83.622 I30.371 J29.583 E.93998
G3 X127.541 Y168.385 I-.837 J42.379 E3.59801
M204 S250
G1 X127.476 Y168.786 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.526 J-42.785 E2.30927
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.843 Y83.221 I30.963 J29.534 E.89149
G3 X127.536 Y168.787 I-.842 J42.78 E3.37013
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.4221
G1 X125.537 Y168.717 E-.3379
; WIPE_END
G1 E-.04 F1800
G1 X123.283 Y161.425 Z3.96 F30000
G1 X119.75 Y149.996 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X118.195 Y149.407 I5.215 J-16.123 E.04506
G3 X117.129 Y150.383 I-13.32 J-13.491 E.03917
G3 X112.112 Y150.01 I-2.277 J-3.3 E.14737
G2 X110.439 Y148.446 I-21.351 J21.157 E.06206
G2 X105.422 Y148.819 I-2.277 J3.3 E.14737
G3 X103.75 Y150.383 I-21.341 J-21.147 E.06206
G3 X98.732 Y150.01 I-2.277 J-3.3 E.14737
G2 X97.06 Y148.446 I-21.351 J21.157 E.06206
G2 X92.835 Y148.254 I-2.263 J3.213 E.121
G3 X90.211 Y143.434 I39.868 J-24.831 E.14881
G2 X92.043 Y141.756 I-63.904 J-71.626 E.0673
G3 X97.06 Y142.129 I2.277 J3.3 E.14737
G2 X98.732 Y143.693 I21.344 J-21.15 E.06206
G2 X103.75 Y143.32 I2.277 J-3.3 E.14737
G3 X105.422 Y141.756 I21.347 J21.154 E.06206
G3 X107.569 Y141.057 I2.211 J3.141 E.06209
G3 X104.728 Y136.113 I24.714 J-17.49 E.15473
G3 X103.75 Y137.003 I-12.149 J-12.372 E.03584
G3 X98.732 Y136.63 I-2.277 J-3.3 E.14737
G2 X97.06 Y135.067 I-21.351 J21.157 E.06206
G2 X92.043 Y135.439 I-2.277 J3.3 E.14737
G3 X90.37 Y137.003 I-21.341 J-21.147 E.06206
G3 X88.064 Y137.707 I-2.236 J-3.197 E.06643
G3 X86.675 Y130.91 I43.179 J-12.361 E.18818
G2 X90.37 Y129.941 I.906 J-4.073 E.10751
G3 X92.043 Y128.377 I21.347 J21.154 E.06206
G3 X97.06 Y128.749 I2.277 J3.3 E.14737
G2 X98.732 Y130.313 I21.344 J-21.15 E.06206
G2 X103.02 Y130.46 I2.255 J-3.167 E.12314
M73 P58 R18
G3 X102.691 Y124.152 I25.157 J-4.476 E.1716
G3 X98.732 Y123.251 I-1.169 J-4.006 E.11489
G2 X97.06 Y121.687 I-21.351 J21.157 E.06206
G2 X92.043 Y122.06 I-2.277 J3.3 E.14737
G3 X90.37 Y123.623 I-21.341 J-21.147 E.06206
G3 X86.436 Y123.947 I-2.249 J-3.256 E.11199
G3 X87.236 Y117.626 I41.698 J2.064 E.17284
G2 X90.37 Y116.561 I.368 J-4.063 E.09236
G3 X92.043 Y114.997 I21.347 J21.154 E.06206
G3 X97.06 Y115.37 I2.277 J3.3 E.14737
G2 X98.732 Y116.934 I21.344 J-21.15 E.06206
G2 X103.75 Y116.561 I2.277 J-3.3 E.14737
G3 X104.926 Y115.444 I15.246 J14.868 E.04397
G3 X105.507 Y114.251 I13.275 J5.732 E.03596
G1 X101.382 Y110.95 E.14317
G3 X98.732 Y109.871 I.113 J-4.071 E.0792
G2 X97.06 Y108.307 I-21.351 J21.157 E.06206
G2 X92.043 Y108.68 I-2.277 J3.3 E.14737
G3 X90.37 Y110.244 I-21.341 J-21.147 E.06206
G1 X89.534 Y110.716 E.02602
G1 X89.266 Y110.785 E.0075
G3 X89.905 Y109.25 I41.222 J16.268 E.04505
; WIPE_START
G1 X89.266 Y110.785 E-.63174
G1 X89.534 Y110.716 E-.10521
G1 X89.587 Y110.686 E-.02306
; WIPE_END
G1 E-.04 F1800
G1 X96.5 Y107.452 Z3.96 F30000
G1 X106.685 Y102.688 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F10826.06
G1 X105.387 Y101.649 E.04505
G1 X105.422 Y101.618 E.00128
G3 X110.439 Y101.99 I2.277 J3.3 E.14737
G2 X112.112 Y103.554 I21.344 J-21.15 E.06206
G2 X115.017 Y104.195 I2.147 J-2.828 E.08318
G3 X117.359 Y102.958 I14.744 J25.08 E.07181
G3 X118.802 Y101.618 I18.301 J18.246 E.05336
G3 X122.549 Y101.217 I2.24 J3.231 E.10649
G3 X133.061 Y101.135 I5.455 J25.273 E.28685
G3 X137.199 Y101.99 I1.331 J3.998 E.11993
G1 X137.836 Y102.609 E.02406
G3 X141.081 Y104.255 I-16.654 J36.842 E.09864
G2 X143.888 Y103.181 I.064 J-4.041 E.08346
G3 X145.561 Y101.618 I21.347 J21.154 E.06206
G3 X150.578 Y101.99 I2.277 J3.3 E.14737
G2 X152.251 Y103.554 I21.344 J-21.15 E.06206
G2 X157.268 Y103.181 I2.277 J-3.3 E.14737
G3 X158.94 Y101.618 I21.347 J21.154 E.06206
G3 X161.206 Y100.915 I2.228 J3.178 E.06533
G2 X157.504 Y96.652 I-33.506 J25.36 E.15311
G3 X153.087 Y97.087 I-2.522 J-2.961 E.128
G3 X151.414 Y95.68 I3.771 J-6.178 E.05946
G2 X145.561 Y95.301 I-3.109 J2.615 E.17759
G3 X143.888 Y96.864 I-21.341 J-21.147 E.06206
G3 X138.871 Y96.492 I-2.277 J-3.3 E.14737
G2 X137.199 Y94.928 I-21.351 J21.157 E.06206
G2 X132.181 Y95.301 I-2.277 J3.3 E.14737
G3 X130.509 Y96.864 I-21.341 J-21.147 E.06206
G3 X125.491 Y96.492 I-2.277 J-3.3 E.14737
G2 X123.819 Y94.928 I-21.351 J21.157 E.06206
G2 X118.802 Y95.301 I-2.277 J3.3 E.14737
G3 X117.129 Y96.864 I-21.341 J-21.147 E.06206
G3 X112.112 Y96.492 I-2.277 J-3.3 E.14737
G2 X110.439 Y94.928 I-21.351 J21.157 E.06206
G2 X105.422 Y95.301 I-2.277 J3.3 E.14737
G3 X103.75 Y96.864 I-21.341 J-21.147 E.06206
G3 X99.811 Y97.186 I-2.249 J-3.257 E.11212
G1 X98.788 Y96.368 E.03549
G3 X110.153 Y88.406 I29.515 J30.038 E.37771
G3 X112.112 Y90.175 I-26.681 J31.533 E.07152
G2 X117.129 Y89.802 I2.277 J-3.3 E.14737
G3 X118.802 Y88.238 I21.347 J21.154 E.06206
G3 X123.819 Y88.611 I2.277 J3.3 E.14737
G2 X125.491 Y90.175 I21.344 J-21.15 E.06206
G2 X130.509 Y89.802 I2.277 J-3.3 E.14737
G3 X132.181 Y88.238 I21.347 J21.154 E.06206
G3 X137.199 Y88.611 I2.277 J3.3 E.14737
G2 X138.871 Y90.175 I21.344 J-21.15 E.06206
G2 X143.888 Y89.802 I2.277 J-3.3 E.14737
G3 X145.537 Y88.26 I21.054 J20.851 E.06118
G2 X144.015 Y87.59 I-18.834 J40.741 E.04505
G1 X147.27 Y109.489 F30000
G1 F10826.06
G2 X146.152 Y108.259 I-30.741 J26.8 E.04505
G3 X150.578 Y108.307 I2.179 J3.171 E.1278
G3 X152.251 Y109.871 I-19.678 J22.721 E.06206
G2 X158.104 Y109.492 I2.745 J-2.995 E.17759
G3 X160.613 Y107.743 I4.642 J3.984 E.08376
G3 X164.794 Y109.059 I1.052 J3.955 E.12535
G2 X166.642 Y110.546 I4.952 J-4.264 E.06464
G3 X168.747 Y117.538 I-41.799 J16.394 E.19808
G3 X164.794 Y116.182 I-.848 J-3.968 E.11896
G2 X162.285 Y114.432 I-4.642 J3.984 E.08376
G2 X158.104 Y115.749 I-1.052 J3.955 E.12535
G3 X155.595 Y117.499 I-4.642 J-3.984 E.08376
G3 X151.414 Y116.182 I-1.052 J-3.955 E.12535
G1 X151.388 Y116.156 E.00101
G2 X150.693 Y114.645 I-15.718 J6.308 E.04506
G1 X153.102 Y122.281 F30000
G1 F10826.06
G3 X153.295 Y123.932 I-34.871 J4.91 E.04504
G2 X158.104 Y122.871 I1.714 J-3.66 E.14348
G3 X160.613 Y121.122 I4.642 J3.984 E.08376
G3 X164.794 Y122.439 I1.052 J3.955 E.12535
G2 X167.303 Y124.188 I4.642 J-3.984 E.08376
G2 X169.574 Y124.156 I1.077 J-4.176 E.0623
G3 X169.347 Y130.726 I-45.225 J1.725 E.17829
G3 X164.794 Y129.561 I-1.464 J-3.759 E.13595
G2 X162.285 Y127.812 I-4.642 J3.984 E.08376
G2 X158.104 Y129.129 I-1.052 J3.955 E.12535
G3 X155.595 Y130.878 I-4.642 J-3.984 E.08376
G3 X152.935 Y130.7 I-1.083 J-3.77 E.07371
G3 X151.414 Y135.819 I-32.217 J-6.788 E.14486
G2 X153.923 Y137.568 I4.642 J-3.984 E.08376
G2 X158.104 Y136.251 I1.052 J-3.955 E.12535
G3 X160.613 Y134.502 I4.642 J3.984 E.08376
G3 X164.794 Y135.819 I1.052 J3.955 E.12535
G2 X167.303 Y137.568 I4.642 J-3.984 E.08376
G1 X167.945 Y137.679 E.01766
G2 X168.377 Y136.074 I-48.555 J-13.945 E.04505
G1 X147.363 Y142.408 F30000
G1 F10826.06
G2 X148.393 Y141.103 I-27.811 J-22.994 E.04504
G3 X150.578 Y142.129 I-.715 J4.363 E.06627
G2 X152.251 Y143.693 I21.344 J-21.15 E.06206
G2 X157.268 Y143.32 I2.277 J-3.3 E.14737
G3 X158.94 Y141.756 I21.347 J21.154 E.06206
G3 X163.958 Y142.129 I2.277 J3.3 E.14737
G2 X165.659 Y143.709 I21.766 J-21.729 E.06293
G3 X163.284 Y148.066 I-43.269 J-20.762 E.13452
G1 X163.121 Y147.974 E.00505
G2 X158.94 Y148.819 I-1.368 J3.999 E.12116
G3 X157.268 Y150.383 I-21.341 J-21.147 E.06206
G3 X152.251 Y150.01 I-2.277 J-3.3 E.14737
G2 X150.578 Y148.446 I-21.351 J21.157 E.06206
G2 X145.561 Y148.819 I-2.277 J3.3 E.14737
G3 X143.888 Y150.383 I-21.341 J-21.147 E.06206
G3 X138.871 Y150.01 I-2.277 J-3.3 E.14737
G1 X138.115 Y149.276 E.02854
G3 X136.569 Y149.887 I-11.713 J-27.397 E.04505
G1 X107.811 Y162.391 F30000
G1 F10826.06
G3 X106.374 Y161.555 I16.338 J-29.733 E.04505
G3 X110.439 Y161.826 I1.805 J3.563 E.11586
G3 X112.112 Y163.389 I-19.678 J22.721 E.06206
G2 X117.129 Y163.762 I2.74 J-2.927 E.14737
G2 X118.802 Y162.198 I-19.668 J-22.71 E.06206
G3 X123.819 Y161.826 I2.74 J2.927 E.14737
G3 X125.491 Y163.389 I-19.678 J22.721 E.06206
G2 X130.509 Y163.762 I2.74 J-2.927 E.14737
G2 X132.181 Y162.198 I-19.668 J-22.71 E.06206
G3 X137.199 Y161.826 I2.74 J2.927 E.14737
G3 X138.871 Y163.389 I-19.678 J22.721 E.06206
G2 X143.888 Y163.762 I2.74 J-2.927 E.14737
G2 X145.561 Y162.198 I-19.668 J-22.71 E.06206
G3 X149.742 Y161.354 I2.813 J3.154 E.12116
G1 X149.855 Y161.417 E.00351
G2 X154.895 Y157.759 I-22.341 J-36.075 E.16892
G3 X152.251 Y157.072 I-.501 J-3.506 E.076
G3 X150.578 Y155.509 I19.672 J-22.714 E.06206
G2 X145.561 Y155.136 I-2.74 J2.927 E.14737
G2 X143.888 Y156.7 I19.675 J22.717 E.06206
G3 X138.871 Y157.072 I-2.74 J-2.927 E.14737
G3 X137.199 Y155.509 I19.672 J-22.714 E.06206
G2 X132.181 Y155.136 I-2.74 J2.927 E.14737
G2 X130.509 Y156.7 I19.675 J22.717 E.06206
G3 X125.491 Y157.072 I-2.74 J-2.927 E.14737
G3 X123.819 Y155.509 I19.672 J-22.714 E.06206
G2 X118.802 Y155.136 I-2.74 J2.927 E.14737
G2 X117.129 Y156.7 I19.675 J22.717 E.06206
G3 X112.112 Y157.072 I-2.74 J-2.927 E.14737
G3 X110.439 Y155.509 I19.672 J-22.714 E.06206
G2 X105.422 Y155.136 I-2.74 J2.927 E.14737
G2 X103.75 Y156.7 I19.675 J22.717 E.06206
G3 X101.129 Y157.779 I-2.768 J-3.001 E.07844
G3 X99.882 Y156.679 I21.769 J-25.941 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X101.129 Y157.779 E-.63176
G1 X101.462 Y157.729 E-.12824
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/58
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.96 I-.446 J1.132 P1  F30000
G1 X127.486 Y167.97 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.515 J-41.969 E2.41728
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.789 Y84.036 I29.751 J29.611 E.91733
G3 X127.546 Y167.971 I-.788 J41.965 E3.56398
G1 X127.481 Y168.386 F30000
G1 F9000
G3 X92.492 Y102.847 I.516 J-42.385 E2.45396
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.513 J11.953 E3.96626
G1 X97.629 Y96.428 E.48568
G3 X128.799 Y83.621 I30.377 J29.597 E.93905
G3 X127.541 Y168.387 I-.802 J42.38 E3.59902
M204 S250
G1 X127.476 Y168.783 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.525 J-42.784 E2.30919
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.809 Y83.22 I30.961 J29.528 E.89065
G3 X127.536 Y168.784 I-.809 J42.779 E3.37084
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.42208
G1 X125.537 Y168.717 E-.33792
; WIPE_END
G1 E-.04 F1800
G1 X123.319 Y161.414 Z4.12 F30000
G1 X119.863 Y150.035 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X118.306 Y149.452 I5.159 J-16.144 E.04506
G3 X117.129 Y150.531 I-8.566 J-8.158 E.04332
G3 X112.948 Y150.523 I-2.083 J-3.408 E.11923
G3 X111.276 Y149.033 I4.807 J-7.082 E.06086
G2 X108.767 Y147.704 I-3.053 J2.729 E.07856
G2 X105.422 Y148.953 I-.283 J4.345 E.09969
G3 X103.75 Y150.531 I-12.503 J-11.569 E.06237
G3 X99.569 Y150.523 I-2.083 J-3.408 E.11923
G3 X97.896 Y149.033 I4.807 J-7.082 E.06086
G2 X95.387 Y147.704 I-3.053 J2.729 E.07856
G2 X92.872 Y148.312 I-.309 J4.23 E.07127
G3 X90.168 Y143.343 I39.765 J-24.86 E.15338
G3 X92.043 Y141.607 I189.511 J202.865 E.06922
G3 X96.224 Y141.616 I2.083 J3.408 E.11923
G3 X97.896 Y143.106 I-4.807 J7.082 E.06086
G2 X100.405 Y144.435 I3.053 J-2.729 E.07856
G2 X103.75 Y143.186 I.283 J-4.345 E.09969
G3 X105.422 Y141.607 I12.506 J11.572 E.06237
G3 X107.545 Y141.026 I1.988 J3.089 E.06059
G3 X104.775 Y136.225 I25.127 J-17.696 E.15039
G3 X103.75 Y137.152 I-7.366 J-7.119 E.0375
G3 X99.569 Y137.143 I-2.083 J-3.408 E.11923
G3 X97.896 Y135.654 I4.807 J-7.082 E.06086
G2 X95.387 Y134.324 I-3.053 J2.729 E.07856
G2 X92.043 Y135.573 I-.283 J4.345 E.09969
G3 X90.37 Y137.152 I-12.503 J-11.569 E.06237
G3 X88.071 Y137.729 I-2.014 J-3.152 E.06537
G3 X86.685 Y130.988 I43.133 J-12.379 E.18667
G2 X90.37 Y129.807 I.667 J-4.257 E.10875
G3 X92.043 Y128.228 I12.506 J11.572 E.06237
G3 X96.224 Y128.237 I2.083 J3.408 E.11923
G3 X97.896 Y129.726 I-4.807 J7.082 E.06086
G2 X100.405 Y131.056 I3.053 J-2.729 E.07856
G2 X103.005 Y130.382 I.311 J-4.156 E.07412
G3 X102.683 Y124.245 I25.325 J-4.408 E.16691
G3 X98.732 Y123.117 I-.938 J-4.194 E.11607
G2 X97.06 Y121.538 I-12.507 J11.574 E.06237
G2 X92.879 Y121.547 I-2.083 J3.408 E.11923
G2 X91.206 Y123.036 I4.807 J7.082 E.06086
G3 X88.698 Y124.366 I-3.053 J-2.729 E.07856
G3 X86.439 Y123.88 I-.214 J-4.499 E.06331
M73 P59 R18
G3 X87.227 Y117.671 I41.67 J2.13 E.16977
G2 X90.37 Y116.427 I.121 J-4.289 E.09415
G3 X92.043 Y114.848 I12.506 J11.572 E.06237
G3 X96.224 Y114.857 I2.083 J3.408 E.11923
G3 X97.896 Y116.346 I-4.807 J7.082 E.06086
G2 X100.405 Y117.676 I3.053 J-2.729 E.07856
G2 X103.75 Y116.427 I.283 J-4.345 E.09969
G3 X105.047 Y115.178 I9.879 J8.966 E.04884
G3 X105.507 Y114.251 I10.321 J4.539 E.02806
G1 X101.406 Y110.969 E.14233
G3 X98.732 Y109.737 I.351 J-4.28 E.08142
G2 X97.06 Y108.159 I-12.507 J11.574 E.06237
G2 X92.879 Y108.167 I-2.083 J3.408 E.11923
G2 X91.206 Y109.657 I4.807 J7.082 E.06086
G3 X89.228 Y110.881 I-3.073 J-2.756 E.06389
G3 X89.863 Y109.344 I41.026 J16.04 E.04505
; WIPE_START
G1 X89.228 Y110.881 E-.63174
G1 X89.534 Y110.82 E-.1183
G1 X89.557 Y110.808 E-.00997
; WIPE_END
G1 E-.04 F1800
G1 X96.436 Y107.501 Z4.12 F30000
G1 X106.596 Y102.617 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F10826.06
G1 X105.298 Y101.578 E.04505
G1 X105.422 Y101.469 E.00448
G3 X109.603 Y101.478 I2.083 J3.408 E.11923
G3 X111.276 Y102.967 I-4.807 J7.082 E.06086
G2 X113.784 Y104.296 I3.053 J-2.729 E.07856
G2 X115.218 Y104.071 I.356 J-2.407 E.03995
G2 X117.129 Y103.048 I-164.301 J-309.063 E.05874
G3 X118.802 Y101.469 I12.506 J11.572 E.06237
G3 X122.464 Y101.235 I2.05 J3.313 E.10354
G3 X132.901 Y101.101 I5.546 J25.329 E.28479
G1 X133.017 Y101.041 E.00353
G3 X137.199 Y102.124 I1.145 J4.192 E.12248
G1 X137.564 Y102.492 E.01405
G3 X141.123 Y104.282 I-15.272 J34.814 E.108
G2 X143.888 Y103.048 I-.244 J-4.262 E.08387
G3 X145.561 Y101.469 I12.506 J11.572 E.06237
G3 X149.742 Y101.478 I2.083 J3.408 E.11923
G3 X151.414 Y102.967 I-4.807 J7.082 E.06086
G2 X153.923 Y104.296 I3.053 J-2.729 E.07856
G2 X157.268 Y103.048 I.283 J-4.345 E.09969
G3 X158.94 Y101.469 I12.506 J11.572 E.06237
G3 X161.188 Y100.89 I2.003 J3.127 E.06396
G2 X157.586 Y96.733 I-33.633 J25.509 E.14915
G1 X157.268 Y97.013 E.01147
G3 X153.087 Y97.004 I-2.083 J-3.408 E.11923
G3 X151.414 Y95.515 I4.807 J-7.082 E.06086
G2 X148.906 Y94.185 I-3.053 J2.729 E.07856
G2 X145.561 Y95.434 I-.283 J4.345 E.09969
G3 X143.888 Y97.013 I-12.503 J-11.569 E.06237
G3 X139.707 Y97.004 I-2.083 J-3.408 E.11923
G3 X138.035 Y95.515 I4.807 J-7.082 E.06086
G2 X135.526 Y94.185 I-3.053 J2.729 E.07856
G2 X132.181 Y95.434 I-.283 J4.345 E.09969
G3 X130.509 Y97.013 I-12.503 J-11.569 E.06237
G3 X126.328 Y97.004 I-2.083 J-3.408 E.11923
G3 X124.655 Y95.515 I4.807 J-7.082 E.06086
G2 X122.147 Y94.185 I-3.053 J2.729 E.07856
G2 X118.802 Y95.434 I-.283 J4.345 E.09969
G3 X117.129 Y97.013 I-12.503 J-11.569 E.06237
G3 X112.948 Y97.004 I-2.083 J-3.408 E.11923
G3 X111.276 Y95.515 I4.807 J-7.082 E.06086
G2 X108.767 Y94.185 I-3.053 J2.729 E.07856
G2 X105.422 Y95.434 I-.283 J4.345 E.09969
G3 X103.75 Y97.013 I-12.503 J-11.569 E.06237
G3 X98.788 Y96.368 I-2.082 J-3.392 E.1466
G3 X110.059 Y88.451 I29.528 J30.054 E.37491
G3 X112.112 Y90.323 I-63.1 J71.221 E.07529
G2 X116.293 Y90.315 I2.083 J-3.408 E.11923
G2 X117.965 Y88.825 I-4.808 J-7.083 E.06086
G3 X120.474 Y87.496 I3.053 J2.73 E.07856
G3 X123.819 Y88.745 I.283 J4.345 E.09969
G2 X125.491 Y90.323 I12.505 J-11.571 E.06237
G2 X129.673 Y90.315 I2.083 J-3.408 E.11923
G2 X131.345 Y88.825 I-4.808 J-7.083 E.06086
G3 X133.854 Y87.496 I3.053 J2.73 E.07856
G3 X137.199 Y88.745 I.283 J4.345 E.09969
G2 X138.871 Y90.323 I12.505 J-11.571 E.06237
G2 X143.052 Y90.315 I2.083 J-3.408 E.11923
G2 X144.725 Y88.825 I-4.808 J-7.083 E.06086
G1 X145.426 Y88.207 E.02534
G2 X143.902 Y87.543 I-20.59 J45.175 E.04505
G1 X147.32 Y109.549 F30000
G1 F10826.06
G2 X146.205 Y108.315 I-13.11 J10.721 E.04506
G1 X146.397 Y108.167 E.00656
G3 X150.578 Y108.159 I2.098 J3.342 E.11941
G3 X152.251 Y109.737 I-10.835 J13.152 E.06237
G2 X156.432 Y110.82 I3.036 J-3.109 E.12248
G2 X158.104 Y109.657 I-1.447 J-3.865 E.05578
G3 X160.613 Y107.777 I5.243 J4.382 E.08571
G3 X164.794 Y108.895 I1.272 J3.621 E.12459
G2 X166.601 Y110.447 I6.441 J-5.671 E.06477
G3 X168.743 Y117.517 I-39.045 J15.686 E.20044
G3 X164.794 Y116.346 I-1.078 J-3.61 E.11808
G2 X162.285 Y114.466 I-5.243 J4.382 E.08571
G2 X158.104 Y115.584 I-1.272 J3.621 E.12459
G3 X155.595 Y117.464 I-5.243 J-4.382 E.08571
G3 X151.503 Y116.424 I-1.269 J-3.578 E.12134
G2 X150.822 Y114.908 I-15.763 J6.169 E.04506
G1 X153.091 Y122.209 F30000
G1 F10826.06
G3 X153.291 Y123.859 I-38.467 J5.498 E.04505
G2 X158.104 Y123.036 I1.911 J-3.315 E.14351
G3 X160.613 Y121.156 I5.243 J4.382 E.08571
G3 X164.794 Y122.274 I1.272 J3.621 E.12459
G2 X167.303 Y124.154 I5.243 J-4.382 E.08571
G2 X169.579 Y124.246 I1.307 J-4.143 E.06246
G3 X169.355 Y130.667 I-45.637 J1.62 E.17424
G3 X165.63 Y130.462 I-1.675 J-3.517 E.1054
G3 X163.958 Y128.883 I10.834 J-13.151 E.06237
G2 X159.777 Y127.801 I-3.036 J3.109 E.12248
G2 X158.104 Y128.964 I1.447 J3.865 E.05578
G3 X155.595 Y130.844 I-5.243 J-4.382 E.08571
G3 X152.916 Y130.802 I-1.282 J-3.707 E.0741
G3 X151.452 Y135.692 I-25.119 J-4.857 E.13854
G2 X153.923 Y137.534 I5.166 J-4.352 E.08425
G2 X158.104 Y136.416 I1.272 J-3.621 E.12459
G3 X160.613 Y134.536 I5.243 J4.382 E.08571
G3 X164.794 Y135.654 I1.272 J3.621 E.12459
G2 X167.303 Y137.534 I5.243 J-4.382 E.08571
G1 X167.944 Y137.68 E.01784
G2 X168.377 Y136.074 I-48.501 J-13.932 E.04505
G1 X147.359 Y142.413 F30000
G1 F10826.06
G2 X148.389 Y141.108 I-27.594 J-22.841 E.04504
G3 X150.578 Y142.263 I-1.006 J4.56 E.06789
G2 X152.251 Y143.842 I12.505 J-11.571 E.06237
G2 X156.432 Y143.833 I2.083 J-3.408 E.11923
G2 X158.104 Y142.344 I-4.808 J-7.083 E.06086
G3 X160.613 Y141.014 I3.053 J2.729 E.07856
G3 X163.958 Y142.263 I.283 J4.345 E.09969
G2 X165.606 Y143.821 I12.338 J-11.406 E.0615
G3 X163.338 Y147.981 I-44.092 J-21.344 E.12844
G1 X163.121 Y147.87 E.00658
G2 X158.94 Y148.953 I-1.145 J4.192 E.12248
G3 X157.268 Y150.531 I-12.503 J-11.569 E.06237
G3 X153.087 Y150.523 I-2.083 J-3.408 E.11923
G3 X151.414 Y149.033 I4.807 J-7.082 E.06086
G2 X148.906 Y147.704 I-3.053 J2.729 E.07856
G2 X145.561 Y148.953 I-.283 J4.345 E.09969
G3 X143.888 Y150.531 I-12.503 J-11.569 E.06237
G3 X139.707 Y150.523 I-2.083 J-3.408 E.11923
G3 X138.226 Y149.226 I4.174 J-6.263 E.05351
G3 X136.683 Y149.843 I-8.024 J-17.815 E.04505
G1 X107.883 Y162.433 F30000
G1 F10826.06
G3 X106.445 Y161.598 I16.298 J-29.746 E.04505
G3 X108.767 Y161.083 I2.111 J4.027 E.06519
G3 X111.276 Y162.413 I-.545 J4.059 E.07856
G2 X112.948 Y163.902 I6.48 J-5.593 E.06086
G2 X117.129 Y163.911 I2.098 J-3.399 E.11923
G2 X118.802 Y162.332 I-10.831 J-13.148 E.06237
G3 X122.147 Y161.083 I3.061 J3.096 E.09969
G3 X124.655 Y162.413 I-.545 J4.059 E.07856
G2 X126.328 Y163.902 I6.48 J-5.593 E.06086
G2 X130.509 Y163.911 I2.098 J-3.399 E.11923
G2 X132.181 Y162.332 I-10.831 J-13.148 E.06237
G3 X135.526 Y161.083 I3.061 J3.096 E.09969
G3 X138.035 Y162.413 I-.545 J4.059 E.07856
G2 X139.707 Y163.902 I6.48 J-5.593 E.06086
G2 X143.888 Y163.911 I2.098 J-3.399 E.11923
G2 X145.561 Y162.332 I-10.831 J-13.148 E.06237
G3 X149.742 Y161.25 I3.036 J3.109 E.12248
G1 X149.951 Y161.356 E.00637
G2 X154.889 Y157.764 I-22.343 J-35.896 E.16561
G3 X153.923 Y157.815 I-.61 J-2.385 E.02638
G3 X151.414 Y156.485 I.545 J-4.059 E.07856
G2 X149.742 Y154.996 I-6.48 J5.593 E.06086
G2 X145.561 Y154.987 I-2.098 J3.399 E.11923
G2 X143.888 Y156.566 I10.834 J13.151 E.06237
G3 X140.543 Y157.815 I-3.061 J-3.096 E.09969
G3 X138.035 Y156.485 I.545 J-4.059 E.07856
G2 X136.362 Y154.996 I-6.48 J5.593 E.06086
G2 X132.181 Y154.987 I-2.098 J3.399 E.11923
G2 X130.509 Y156.566 I10.834 J13.151 E.06237
G3 X127.164 Y157.815 I-3.061 J-3.096 E.09969
G3 X124.655 Y156.485 I.545 J-4.059 E.07856
G2 X122.983 Y154.996 I-6.48 J5.593 E.06086
G2 X118.802 Y154.987 I-2.098 J3.399 E.11923
G2 X117.129 Y156.566 I10.834 J13.151 E.06237
G3 X113.784 Y157.815 I-3.061 J-3.096 E.09969
G3 X111.276 Y156.485 I.545 J-4.059 E.07856
G2 X109.603 Y154.996 I-6.48 J5.593 E.06086
G2 X105.422 Y154.987 I-2.098 J3.399 E.11923
G2 X103.75 Y156.566 I10.834 J13.151 E.06237
G3 X101.148 Y157.796 I-3.044 J-3.073 E.07949
G3 X99.901 Y156.696 I21.764 J-25.956 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X101.148 Y157.796 E-.63176
G1 X101.479 Y157.727 E-.12824
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/58
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.12 I-.446 J1.132 P1  F30000
G1 X127.486 Y167.97 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X92.595 Y103.461 I.515 J-41.969 E2.41727
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.755 Y84.035 I29.737 J29.575 E.91646
G3 X127.546 Y167.97 I-.754 J41.965 E3.5649
G1 X127.481 Y168.386 F30000
G1 F9000
G3 X92.492 Y102.847 I.516 J-42.385 E2.45395
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.513 J11.953 E3.96626
G1 X97.629 Y96.428 E.48568
G3 X128.766 Y83.62 I30.372 J29.584 E.93815
G3 X127.541 Y168.386 I-.768 J42.381 E3.59994
M204 S250
G1 X127.476 Y168.783 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.525 J-42.784 E2.30918
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.775 Y83.219 I30.964 J29.536 E.88979
G3 X127.536 Y168.784 I-.775 J42.78 E3.3717
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.42208
G1 X125.537 Y168.717 E-.33792
; WIPE_END
G1 E-.04 F1800
G1 X118.394 Y166.028 Z4.28 F30000
G1 X108.349 Y162.246 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X106.904 Y161.424 I20.815 J-38.264 E.04505
G3 X110.439 Y161.519 I1.681 J3.26 E.09999
G1 X111.276 Y162.241 E.02994
G2 X113.784 Y164.265 I5.934 J-4.79 E.088
G2 X117.129 Y164.069 I1.467 J-3.603 E.09386
G1 X117.965 Y163.347 E.02994
G3 X120.474 Y161.323 I5.934 J4.79 E.088
G3 X123.819 Y161.519 I1.467 J3.603 E.09386
G1 X124.655 Y162.241 E.02994
G2 X127.164 Y164.265 I5.934 J-4.79 E.088
G2 X130.509 Y164.069 I1.467 J-3.603 E.09386
G1 X131.345 Y163.347 E.02994
G3 X133.854 Y161.323 I5.934 J4.79 E.088
G3 X137.199 Y161.519 I1.467 J3.603 E.09386
G3 X138.871 Y163.122 I-7.236 J9.226 E.06287
G2 X142.216 Y164.568 I3.336 J-3.126 E.10156
G2 X143.941 Y164.023 I-.72 J-5.287 E.04927
G2 X145.561 Y162.466 I-7.03 J-8.934 E.06096
G3 X149.605 Y161.118 I3.261 J3.043 E.12042
G2 X154.171 Y157.858 I-22.002 J-35.641 E.15215
G3 X152.251 Y157.379 I-.125 J-3.589 E.05433
G1 X151.414 Y156.657 E.02994
G2 X148.906 Y154.634 I-5.934 J4.79 E.088
G2 X145.561 Y154.829 I-1.467 J3.603 E.09386
G1 X144.725 Y155.551 E.02994
M73 P59 R17
G3 X142.216 Y157.575 I-5.934 J-4.79 E.088
G3 X138.871 Y157.379 I-1.467 J-3.603 E.09386
G1 X138.035 Y156.657 E.02994
G2 X135.526 Y154.634 I-5.934 J4.79 E.088
G2 X132.181 Y154.829 I-1.467 J3.603 E.09386
G1 X131.345 Y155.551 E.02994
G3 X128.836 Y157.575 I-5.934 J-4.79 E.088
G3 X125.491 Y157.379 I-1.467 J-3.603 E.09386
G1 X124.655 Y156.657 E.02994
G2 X122.147 Y154.634 I-5.934 J4.79 E.088
G2 X118.802 Y154.829 I-1.467 J3.603 E.09386
G1 X117.965 Y155.551 E.02994
G3 X115.457 Y157.575 I-5.934 J-4.79 E.088
G3 X112.112 Y157.379 I-1.467 J-3.603 E.09386
G1 X111.276 Y156.657 E.02994
G2 X108.767 Y154.634 I-5.934 J4.79 E.088
G2 X105.422 Y154.829 I-1.467 J3.603 E.09386
G2 X103.75 Y156.432 I7.235 J9.225 E.06287
G3 X101.636 Y157.699 I-3.515 J-3.465 E.0675
G3 X93.251 Y148.189 I27.002 J-32.259 E.34488
G3 X97.06 Y148.14 I1.946 J3.146 E.10844
G1 X97.896 Y148.862 E.02994
G2 X100.405 Y150.885 I5.934 J-4.79 E.088
G2 X103.75 Y150.689 I1.467 J-3.603 E.09386
G1 X104.586 Y149.967 E.02994
G3 X107.095 Y147.944 I5.934 J4.79 E.088
G3 X110.439 Y148.14 I1.467 J3.603 E.09386
G1 X111.276 Y148.862 E.02994
G2 X113.784 Y150.885 I5.934 J-4.79 E.088
G2 X117.129 Y150.689 I1.467 J-3.603 E.09386
G2 X118.128 Y149.796 I-4 J-5.478 E.03637
G1 X117.768 Y149.648 E.01056
G3 X107.024 Y140.961 I10.32 J-23.75 E.37897
G2 X105.422 Y141.45 I.023 J2.946 E.04602
G1 X104.586 Y142.172 E.02994
G3 X102.077 Y144.195 I-5.934 J-4.79 E.088
G3 X98.732 Y143.999 I-1.467 J-3.603 E.09386
G1 X97.896 Y143.277 E.02994
G2 X95.387 Y141.254 I-5.934 J4.79 E.088
G2 X92.043 Y141.45 I-1.467 J3.603 E.09386
G2 X90.432 Y142.987 I6.938 J8.881 E.06044
G3 X88.493 Y137.792 I42.245 J-18.727 E.15035
G2 X90.37 Y137.31 I.066 J-3.637 E.05316
G1 X91.206 Y136.588 E.02994
G3 X93.715 Y134.564 I5.934 J4.79 E.088
G3 X97.06 Y134.76 I1.467 J3.603 E.09386
G1 X97.896 Y135.482 E.02994
G2 X100.405 Y137.505 I5.934 J-4.79 E.088
G2 X104.531 Y136.635 I1.45 J-3.342 E.12188
G1 X104.38 Y136.281 E.01042
G1 X104.693 Y136.031 E.01084
G1 X104.632 Y135.889 E.0042
G1 X104.59 Y136.054 E.00461
G1 X104.293 Y136.078 E.00808
G3 X102.639 Y130.519 I27.898 J-11.328 E.15738
G3 X98.732 Y130.62 I-2.036 J-3.179 E.11129
G1 X97.896 Y129.898 E.02994
G2 X95.387 Y127.874 I-5.934 J4.79 E.088
G2 X92.043 Y128.07 I-1.467 J3.603 E.09386
G2 X90.37 Y129.673 I7.235 J9.225 E.06287
G3 X87.089 Y131.114 I-3.322 J-3.109 E.0998
G3 X86.914 Y129.46 I50.569 J-6.189 E.04505
G1 X102.68 Y127.914 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.374336
G1 F3000;_EXTRUDE_SET_SPEED
G3 X102.624 Y125.164 I26.182 J-1.91 E.06098
; Slow Down End
G1 X102.738 Y123.598 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X102.713 Y123.892 E.00799
G1 X102.329 Y123.864 E.01045
G1 X102.296 Y124.241 E.01024
G1 X102.615 Y124.34 E.00905
G1 X102.685 Y124.217 E.00384
G1 X102.674 Y124.345 E.00347
G3 X98.732 Y122.983 I-.688 J-4.393 E.11763
G2 X97.06 Y121.38 I-8.908 J7.623 E.06287
G1 X96.224 Y120.999 E.0249
G2 X92.043 Y122.328 I-.904 J4.398 E.1242
G3 X90.37 Y123.93 I-8.906 J-7.621 E.06287
G3 X86.819 Y124.017 I-1.857 J-3.288 E.10022
G3 X87.616 Y117.692 I41.328 J1.996 E.17292
G2 X88.698 Y117.436 I-.107 J-2.873 E.03031
G2 X91.206 Y115.413 I-3.425 J-6.813 E.088
G3 X95.387 Y114.495 I2.728 J2.447 E.12387
G3 X97.896 Y116.518 I-3.425 J6.813 E.088
G2 X102.077 Y117.436 I2.728 J-2.447 E.12387
G2 X104.45 Y115.556 I-3.257 J-6.547 E.08263
G1 X104.586 Y115.413 E.00535
G2 X105.507 Y114.251 I-1.023 J-1.757 E.04112
G1 X104.763 Y113.655 E.02583
G1 X104.585 Y114.007 E.01068
G1 X100.568 Y110.792 E.13941
G3 X98.732 Y109.603 I1.954 J-5.028 E.05968
G2 X97.06 Y108.001 I-8.908 J7.623 E.06287
G1 X96.224 Y107.619 E.0249
G2 X92.043 Y108.948 I-.904 J4.398 E.1242
G3 X90.37 Y110.55 I-8.906 J-7.621 E.06287
G1 X89.641 Y110.883 E.02171
G3 X90.283 Y109.349 I41.542 J16.476 E.04505
G1 X103.506 Y119.305 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.374336
G1 F13235.294
G3 X104.105 Y117.41 I19.587 J5.152 E.04406
G3 X104.151 Y117.135 I.372 J-.079 E.00634
G2 X104.588 Y116.169 I-10.881 J-5.509 E.0235
; WIPE_START
G1 X104.151 Y117.135 E-.40285
G1 X104.109 Y117.234 E-.04081
G1 X104.105 Y117.41 E-.06706
G1 X103.892 Y118.031 E-.24928
; WIPE_END
G1 E-.04 F1800
G1 X107.831 Y111.494 Z4.28 F30000
G1 X111.046 Y106.159 Z4.28
G1 Z3.88
G1 E.8 F1800
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X98.955 Y96.482 E.34323
G1 X98.861 Y96.365 E.00334
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.426536
;_EXTRUDE_SET_SPEED
G1 X98.944 Y96.238 E.00386
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.374336
;_EXTRUDE_SET_SPEED
G3 X87.523 Y135.611 I29.057 J29.772 E4.84338
G3 X92.595 Y104.171 I40.425 J-9.607 E.7244
G1 X92.7 Y104.063 E.00334
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.426536
;_EXTRUDE_SET_SPEED
G1 X92.836 Y104.129 E.00386
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.374336
;_EXTRUDE_SET_SPEED
G1 X104.413 Y113.395 E.32868
; Slow Down End
; WIPE_START
G1 X102.852 Y112.145 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.707 Y105.067 Z4.28 F30000
G1 X106.822 Y102.304 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X105.524 Y101.265 E.04505
G3 X107.931 Y100.879 I1.755 J3.255 E.06731
G3 X110.439 Y102.258 I-1.097 J4.968 E.07863
G2 X112.112 Y103.861 I8.907 J-7.622 E.06287
G2 X114.049 Y104.338 I1.791 J-3.097 E.0548
G3 X117.578 Y102.441 I20.44 J33.784 E.10861
G3 X118.802 Y101.311 I6.303 J5.598 E.0452
G3 X121.757 Y101.005 I1.798 J2.944 E.08324
G3 X133.581 Y100.85 I6.239 J24.848 E.32334
G3 X136.512 Y101.682 I.353 J4.335 E.08432
G3 X141.72 Y104.196 I-8.727 J24.729 E.15705
G2 X143.888 Y102.913 I-1.342 J-4.741 E.06903
G3 X145.561 Y101.311 I8.907 J7.622 E.06287
G3 X148.906 Y101.115 I1.878 J3.407 E.09386
G3 X151.414 Y103.139 I-3.425 J6.813 E.088
G1 X152.251 Y103.861 E.02994
G2 X155.595 Y104.057 I1.878 J-3.407 E.09386
G2 X158.104 Y102.033 I-3.425 J-6.813 E.088
G1 X158.94 Y101.311 E.02994
G3 X160.643 Y100.815 I2.001 J3.696 E.04843
G2 X157.38 Y97.074 I-37.672 J29.565 E.13457
G1 X157.268 Y97.171 E.00403
G3 X153.923 Y97.367 I-1.878 J-3.407 E.09386
G3 X151.414 Y95.343 I3.425 J-6.814 E.088
G1 X150.578 Y94.621 E.02994
G2 X147.233 Y94.425 I-1.878 J3.407 E.09386
G2 X144.725 Y96.449 I3.425 J6.813 E.088
G1 X143.888 Y97.171 E.02994
G3 X140.543 Y97.367 I-1.878 J-3.407 E.09386
G3 X138.035 Y95.343 I3.425 J-6.814 E.088
G1 X137.199 Y94.621 E.02994
G2 X133.854 Y94.425 I-1.878 J3.407 E.09386
G2 X131.345 Y96.449 I3.425 J6.813 E.088
G1 X130.509 Y97.171 E.02994
G3 X127.164 Y97.367 I-1.878 J-3.407 E.09386
G3 X124.655 Y95.343 I3.425 J-6.814 E.088
G1 X123.819 Y94.621 E.02994
G2 X120.474 Y94.425 I-1.878 J3.407 E.09386
G2 X117.965 Y96.449 I3.425 J6.813 E.088
M73 P60 R17
G1 X117.129 Y97.171 E.02994
G3 X113.784 Y97.367 I-1.878 J-3.407 E.09386
G3 X111.276 Y95.343 I3.425 J-6.814 E.088
G1 X110.439 Y94.621 E.02994
G2 X107.095 Y94.425 I-1.878 J3.407 E.09386
G2 X104.586 Y96.449 I3.425 J6.813 E.088
G1 X103.75 Y97.171 E.02994
G3 X100.789 Y97.475 I-1.799 J-2.951 E.08338
G1 X99.371 Y96.34 E.04921
G3 X110.301 Y88.763 I28.919 J30.043 E.36194
G2 X112.112 Y90.481 I23.467 J-22.913 E.06765
G2 X115.457 Y90.677 I1.878 J-3.407 E.09386
G2 X117.965 Y88.653 I-3.425 J-6.813 E.088
G1 X118.802 Y87.931 E.02994
G3 X122.147 Y87.736 I1.878 J3.407 E.09386
G3 X124.655 Y89.759 I-3.425 J6.813 E.088
G1 X125.491 Y90.481 E.02994
G2 X128.836 Y90.677 I1.878 J-3.407 E.09386
G2 X131.345 Y88.653 I-3.425 J-6.813 E.088
G1 X132.181 Y87.931 E.02994
G3 X135.526 Y87.736 I1.878 J3.407 E.09386
G3 X138.035 Y89.759 I-3.425 J6.813 E.088
G1 X138.871 Y90.481 E.02994
G2 X142.216 Y90.677 I1.878 J-3.407 E.09386
G2 X144.725 Y88.653 I-3.425 J-6.813 E.088
G1 X144.983 Y88.43 E.00926
G2 X143.455 Y87.776 I-14.078 J30.763 E.04505
G1 X136.683 Y102.141 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.374336
G1 F13235.294
G3 X141.337 Y104.396 I-8.711 J23.911 E.11482
G1 X143.001 Y105.512 F30000
G1 F13235.294
G3 X146.238 Y108.332 I-15.558 J21.13 E.09526
G1 X146.973 Y108.899 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X146.934 Y109.1 E.00554
G1 X146.533 Y108.668 E.01595
G2 X146.896 Y108.492 I-4.63 J-9.981 E.01093
G1 X146.579 Y108.15 E.01263
G3 X150.578 Y108.001 I2.123 J3.232 E.11399
G1 X151.414 Y108.723 E.02994
G2 X153.923 Y110.746 I5.934 J-4.79 E.088
G2 X157.268 Y110.55 I1.467 J-3.603 E.09386
G1 X158.104 Y109.829 E.02994
G3 X160.613 Y107.805 I5.934 J4.79 E.088
G3 X163.958 Y108.001 I1.467 J3.603 E.09386
G3 X165.943 Y109.866 I-49.554 J54.739 E.07382
G3 X168.367 Y117.607 I-38.275 J16.236 E.22017
G3 X165.63 Y117.24 I-.974 J-3.127 E.07725
G1 X164.794 Y116.518 E.02994
G2 X162.285 Y114.495 I-5.934 J4.79 E.088
G2 X158.94 Y114.691 I-1.467 J3.603 E.09386
G1 X158.104 Y115.413 E.02994
G3 X155.595 Y117.436 I-5.934 J-4.79 E.088
G3 X152.251 Y117.24 I-1.467 J-3.603 E.09386
G1 X152.214 Y117.209 E.0013
G1 X152.529 Y118.056 E.02447
G1 X152.012 Y117.776 E.01593
G3 X152.445 Y119.186 I-14.14 J5.115 E.04
G1 X152.491 Y119.034 E.0043
G1 X152.805 Y119.039 E.00853
G3 X153.489 Y122.254 I-26.247 J7.261 E.0891
G3 X153.686 Y124.001 I-31.673 J4.459 E.04765
G2 X157.268 Y123.93 I1.728 J-3.234 E.10143
G1 X158.104 Y123.208 E.02994
G3 X160.613 Y121.185 I5.934 J4.79 E.088
G3 X163.958 Y121.38 I1.467 J3.603 E.09386
G3 X165.63 Y122.983 I-7.235 J9.225 E.06287
G2 X169.2 Y124.397 I3.29 J-3.091 E.10748
G3 X168.947 Y130.824 I-45.053 J1.441 E.17442
G3 X165.63 Y130.62 I-1.445 J-3.577 E.09308
G1 X164.794 Y129.898 E.02994
G2 X162.285 Y127.874 I-5.934 J4.79 E.088
G2 X158.94 Y128.07 I-1.467 J3.603 E.09386
G2 X157.268 Y129.673 I7.235 J9.225 E.06287
G3 X153.267 Y131.026 I-3.257 J-3.037 E.11924
G1 X153.223 Y131.261 E.00645
G1 X152.854 Y131.136 E.01056
G3 X151.5 Y135.572 I-25.58 J-5.382 E.12586
G2 X153.923 Y137.505 I5.741 J-4.71 E.08461
G2 X157.268 Y137.31 I1.467 J-3.603 E.09386
G1 X158.104 Y136.588 E.02994
G3 X160.613 Y134.564 I5.934 J4.79 E.088
G3 X163.958 Y134.76 I1.467 J3.603 E.09386
G3 X165.63 Y136.362 I-7.235 J9.225 E.06287
G2 X167.571 Y137.581 I3.612 J-3.597 E.06264
G2 X168.004 Y135.976 I-47.262 J-13.604 E.04505
G1 X152.937 Y130.772 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.374336
G1 F13235.294
G2 X153.363 Y127.2 I-21.313 J-4.349 E.07984
G1 X153.207 Y122.949 F30000
G1 F13235.294
G3 X153.329 Y124.241 I-13.102 J1.894 E.02877
G1 X152.631 Y119.844 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X152.711 Y120.135 E.00668
G3 X153.032 Y121.75 I-16.309 J4.088 E.03651
; Slow Down End
; WIPE_START
G1 X152.968 Y121.351 E-.15744
G1 X152.711 Y120.135 E-.48498
G1 X152.631 Y119.844 E-.11757
; WIPE_END
G1 E-.04 F1800
G1 X149.123 Y113.066 Z4.28 F30000
G1 X147.246 Y109.438 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F13235.294
G3 X151.862 Y117.324 I-18.891 J16.352 E.20369
; WIPE_START
G1 X151.581 Y116.569 E-.30595
G1 X151.111 Y115.471 E-.45405
; WIPE_END
G1 E-.04 F1800
G1 X150.319 Y123.062 Z4.28 F30000
G1 X148.443 Y141.059 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F13235.294
G3 X147.451 Y142.327 I-13.177 J-9.282 E.03571
G1 X147.764 Y142.532 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X148.784 Y141.22 I-12.837 J-11.036 E.04506
G1 X148.906 Y141.254 E.00343
G3 X151.414 Y143.277 I-3.425 J6.813 E.088
G1 X152.251 Y143.999 E.02994
G2 X155.595 Y144.195 I1.878 J-3.407 E.09386
G2 X158.104 Y142.172 I-3.425 J-6.813 E.088
G1 X158.94 Y141.45 E.02994
G3 X162.285 Y141.254 I1.878 J3.407 E.09386
G3 X164.794 Y143.277 I-3.425 J6.813 E.088
G1 X165.25 Y143.671 E.01633
G3 X163.03 Y147.745 I-44.018 J-21.343 E.12577
G2 X158.94 Y149.087 I-.825 J4.392 E.12169
G3 X157.268 Y150.689 I-8.906 J-7.621 E.06287
G3 X153.923 Y150.885 I-1.878 J-3.407 E.09386
G3 X151.414 Y148.862 I3.425 J-6.814 E.088
G1 X150.578 Y148.14 E.02994
G2 X147.233 Y147.944 I-1.878 J3.407 E.09386
G2 X144.725 Y149.967 I3.425 J6.813 E.088
G1 X143.888 Y150.689 E.02994
G3 X140.543 Y150.885 I-1.878 J-3.407 E.09386
G3 X138.617 Y149.475 I2.901 J-5.983 E.06503
G3 X137.08 Y150.107 I-11.436 J-25.626 E.04505
G1 X140.843 Y147.902 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.374336
G1 F13235.294
G2 X145.427 Y144.466 I-13.065 J-22.202 E.12723
; WIPE_START
G1 X144.824 Y145.026 E-.31279
G1 X143.923 Y145.784 E-.44721
; WIPE_END
G1 E-.04 F1800
G1 X136.373 Y146.901 Z4.28 F30000
G1 X118.502 Y149.546 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F13235.294
G2 X138.704 Y149.026 I9.501 J-23.545 E.46068
; WIPE_START
G1 X137.43 Y149.582 E-.52818
G1 X136.858 Y149.794 E-.23183
; WIPE_END
G1 E-.04 F1800
G1 X129.565 Y147.545 Z4.28 F30000
G1 X107.279 Y140.675 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F13235.294
G2 X118.094 Y149.381 I20.793 J-14.759 E.31165
; WIPE_START
G1 X117.421 Y149.089 E-.27868
G1 X116.306 Y148.545 E-.47142
G1 X116.283 Y148.532 E-.0099
; WIPE_END
G1 E-.04 F1800
G1 X110.765 Y143.259 Z4.28 F30000
G1 X106.024 Y138.727 Z4.28
G1 Z3.88
G1 E.8 F1800
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G3 X104.856 Y136.45 I26.963 J-15.276 E.05676
; Slow Down End
G1 X102.972 Y130.283 F30000
G1 F13235.294
G2 X104.366 Y135.288 I25.691 J-4.459 E.11535
; WIPE_START
G1 X103.984 Y134.262 E-.41595
G1 X103.711 Y133.399 E-.34405
; WIPE_END
G1 E-.04 F1800
G1 X106.343 Y126.235 Z4.28 F30000
G1 X114.281 Y104.631 Z4.28
G1 Z3.88
G1 E.8 F1800
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G3 X116.868 Y103.181 I14.261 J22.413 E.06575
; Slow Down End
G1 X121.942 Y101.34 F30000
G1 F13235.294
G1 X122.135 Y101.289 E.00443
G3 X133.209 Y101.15 I5.846 J24.618 E.24746
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F13235.294
G1 X132.648 Y101.032 E-.21766
G1 X131.417 Y100.834 E-.4738
G1 X131.238 Y100.814 E-.06854
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/58
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.28 I-1.215 J-.068 P1  F30000
G1 X127.486 Y167.969 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X92.595 Y103.461 I.515 J-41.969 E2.41725
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.044 J11.845 E4.01392
G1 X98.251 Y96.394 E.46374
G3 X128.722 Y84.035 I29.738 J29.577 E.91555
G3 X127.546 Y167.97 I-.72 J41.966 E3.56582
G1 X127.481 Y168.386 F30000
G1 F9000
G3 X92.492 Y102.847 I.517 J-42.385 E2.45394
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.513 J11.953 E3.96625
G1 X97.629 Y96.428 E.48568
G3 X128.732 Y83.619 I30.373 J29.585 E.93724
G3 X127.541 Y168.386 I-.734 J42.382 E3.60088
M204 S250
G1 X127.476 Y168.783 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.525 J-42.784 E2.30917
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.995 J12.051 E3.63683
G1 X97.039 Y96.469 E.47023
G3 X128.742 Y83.219 I30.965 J29.537 E.88894
G3 X127.536 Y168.784 I-.741 J42.781 E3.37257
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.42208
G1 X125.537 Y168.717 E-.33792
; WIPE_END
G1 E-.04 F1800
G1 X133.071 Y167.497 Z4.44 F30000
G1 X136.138 Y167.001 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40214
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X148.768 Y142.039 E1.4477
G1 X148.682 Y141.996 E.00499
G1 X148.983 Y141.402 E.03444
G1 X148.665 Y141.241 E.0184
G1 X135.69 Y166.883 E1.48716
G3 X135.134 Y166.982 I-2.287 J-11.301 E.02925
G1 X147.874 Y141.803 E1.46027
G1 X147.593 Y142.155 E.02333
G1 X146.143 Y145.02 E.16613
G1 X145.853 Y144.797 E.01894
G1 X134.579 Y167.077 E1.2922
G1 X134.031 Y167.158 E.02866
G1 X145.488 Y144.517 E1.31316
G1 X145.426 Y144.469 E.00405
G3 X144.647 Y145.177 I-7.59 J-7.567 E.05449
G1 X133.484 Y167.237 E1.27939
G1 X132.944 Y167.303 E.02818
G1 X143.77 Y145.909 E1.24083
G1 X143.651 Y146.001 E.0078
G3 X142.953 Y146.522 I-7.436 J-9.248 E.04507
G1 X132.406 Y167.365 E1.20886
G1 X131.873 Y167.418 E.02773
G1 X142.166 Y147.076 E1.17975
G1 X141.41 Y147.568 E.04664
G1 X131.342 Y167.464 E1.15396
G1 X130.816 Y167.503 E.02731
G1 X139.606 Y150.133 E1.00742
G3 X139.246 Y149.842 I2.004 J-2.841 E.02395
G1 X130.293 Y167.535 E1.02618
G1 X129.773 Y167.561 E.02692
G1 X138.896 Y149.532 E1.04563
G1 X138.731 Y149.383 E.01152
G1 X138.699 Y149.031 E.01828
G1 X138.626 Y149.065 E.00418
G1 X129.257 Y167.579 E1.07379
G1 X128.744 Y167.592 E.02656
G1 X137.974 Y149.352 E1.05785
G3 X137.331 Y149.62 I-3.201 J-6.768 E.03603
G1 X128.234 Y167.598 E1.04264
G1 X127.728 Y167.598 E.02622
G1 X136.692 Y149.881 E1.0275
G1 X136.089 Y150.073 E.03276
G1 X127.224 Y167.591 E1.01604
G1 X126.724 Y167.579 E.02591
G1 X135.485 Y150.264 E1.00424
G3 X134.888 Y150.443 I-2.122 J-5.983 E.0323
G1 X126.226 Y167.561 E.99278
G1 X125.732 Y167.537 E.02562
G1 X134.29 Y150.623 E.98097
G1 X133.723 Y150.743 E.03002
G1 X125.24 Y167.507 E.9723
G1 X124.751 Y167.471 E.02535
G1 X133.155 Y150.863 E.96324
G3 X132.59 Y150.98 I-1.472 J-5.703 E.02991
G1 X124.265 Y167.431 E.95415
G1 X123.782 Y167.384 E.0251
G1 X132.038 Y151.068 E.94625
G1 X131.486 Y151.157 E.02891
G1 X123.301 Y167.333 E.93818
G1 X122.824 Y167.275 E.02487
G1 X130.948 Y151.22 E.93111
G1 X130.411 Y151.28 E.02795
G1 X122.348 Y167.214 E.92417
M73 P61 R17
G1 X121.876 Y167.145 E.02466
G1 X129.88 Y151.327 E.91735
G1 X129.751 Y151.337 E.00667
G3 X129.357 Y151.359 I-.492 J-5.33 E.02043
G1 X121.405 Y167.075 E.91148
G3 X120.939 Y166.994 I1.451 J-9.788 E.02447
G1 X128.841 Y151.378 E.90571
G1 X128.325 Y151.397 E.02674
G1 X120.473 Y166.913 E.89992
G3 X120.012 Y166.824 I2.158 J-12.355 E.02433
G1 X127.821 Y151.391 E.89505
G1 X127.317 Y151.385 E.02606
G1 X119.551 Y166.732 E.8901
G3 X119.094 Y166.634 I1.778 J-9.372 E.02419
G1 X126.82 Y151.367 E.88545
G1 X126.328 Y151.337 E.02548
G1 X118.639 Y166.532 E.88127
G3 X118.187 Y166.425 I1.945 J-9.251 E.02407
G1 X125.837 Y151.306 E.87683
G3 X125.357 Y151.254 I.288 J-4.865 E.02501
G1 X117.737 Y166.312 E.87333
G3 X117.288 Y166.197 I2.117 J-9.175 E.02396
G1 X124.877 Y151.201 E.86974
G3 X124.401 Y151.139 I.392 J-4.878 E.02482
G1 X116.844 Y166.074 E.86619
G1 X116.4 Y165.951 E.02386
G1 X123.933 Y151.064 E.86341
G1 X123.464 Y150.988 E.02456
G1 X115.96 Y165.817 E.86005
G1 X115.521 Y165.684 E.02376
G1 X123.002 Y150.901 E.85741
G3 X122.545 Y150.802 I1.101 J-6.229 E.0242
G1 X115.086 Y165.543 E.85491
G1 X114.652 Y165.399 E.02366
G1 X122.092 Y150.695 E.85282
G1 X121.64 Y150.587 E.02406
G1 X114.22 Y165.25 E.8504
G1 X113.791 Y165.097 E.02358
G1 X121.196 Y150.464 E.84863
G1 X120.754 Y150.336 E.02381
G1 X113.364 Y164.94 E.84696
G1 X112.94 Y164.776 E.02352
G1 X120.312 Y150.207 E.84495
G1 X119.881 Y150.059 E.02362
G1 X112.517 Y164.612 E.84403
G1 X112.098 Y164.438 E.02347
G1 X119.449 Y149.91 E.84258
G3 X119.021 Y149.756 I1.436 J-4.649 E.02358
G1 X111.679 Y164.265 E.84148
G3 X111.264 Y164.083 I10.048 J-23.482 E.02343
G1 X118.599 Y149.587 E.84071
G1 X118.567 Y149.574 E.00177
G1 X118.033 Y149.99 E.03504
G1 X117.945 Y149.879 E.00734
G1 X110.85 Y163.899 E.81314
G3 X110.439 Y163.71 I3.635 J-8.436 E.02342
G1 X117.76 Y149.242 E.83914
G3 X117.348 Y149.055 I2.315 J-5.681 E.02343
G1 X110.03 Y163.517 E.83872
G3 X109.623 Y163.32 I3.796 J-8.384 E.0234
G1 X116.942 Y148.857 E.83882
G1 X116.535 Y148.659 E.0234
G1 X109.219 Y163.117 E.83853
G3 X108.816 Y162.913 I3.996 J-8.407 E.0234
G1 X116.132 Y148.454 E.83858
G3 X115.734 Y148.24 I2.716 J-5.539 E.02341
G1 X108.417 Y162.7 E.83862
G1 X108.018 Y162.487 E.0234
G1 X115.342 Y148.012 E.83948
G1 X114.951 Y147.784 E.02344
G1 X107.623 Y162.265 E.83988
G1 X107.229 Y162.042 E.02342
G1 X114.563 Y147.55 E.84051
G1 X114.181 Y147.302 E.02354
G1 X106.838 Y161.814 E.84164
G1 X106.449 Y161.581 E.02346
G1 X113.8 Y147.054 E.84251
G3 X113.425 Y146.795 I2.449 J-3.949 E.02362
G1 X106.062 Y161.345 E.84386
G1 X105.678 Y161.102 E.02351
G1 X113.054 Y146.527 E.84532
G1 X112.683 Y146.258 E.02369
G1 X105.295 Y160.858 E.84675
G1 X104.916 Y160.605 E.02357
G1 X112.318 Y145.977 E.84837
G3 X111.958 Y145.686 I3.77 J-5.028 E.02394
G1 X104.537 Y160.352 E.85057
G3 X104.163 Y160.091 I5.134 J-7.762 E.02363
G1 X111.603 Y145.387 E.85276
G1 X111.248 Y145.088 E.02404
G1 X103.789 Y159.828 E.85485
G3 X103.419 Y159.559 I5.296 J-7.689 E.0237
G1 X110.901 Y144.772 E.85757
G1 X110.601 Y144.494 E.02115
G1 X110.59 Y144.516 E.00124
M73 P61 R16
G1 X110.547 Y144.471 E.00325
G1 X103.05 Y159.286 E.85922
G3 X102.684 Y159.009 I5.462 J-7.614 E.02378
G1 X110.213 Y144.129 E.86299
G1 X109.879 Y143.787 E.02473
G1 X102.32 Y158.725 E.86638
G3 X101.958 Y158.44 I5.603 J-7.505 E.02386
G1 X109.546 Y143.445 E.86969
G3 X109.218 Y143.091 I3.436 J-3.507 E.02497
G1 X101.6 Y158.146 E.87319
G1 X101.242 Y157.853 E.02397
G1 X108.896 Y142.726 E.87729
G1 X108.573 Y142.362 E.02518
G1 X100.888 Y157.549 E.88082
G1 X100.536 Y157.245 E.02411
G1 X108.261 Y141.977 E.88548
G3 X107.952 Y141.588 I5.724 J-4.869 E.02575
G1 X100.187 Y156.933 E.88997
G1 X99.839 Y156.618 E.02426
G1 X107.648 Y141.187 E.89498
G1 X107.344 Y140.785 E.02604
G1 X99.495 Y156.297 E.89964
G1 X99.153 Y155.971 E.02444
G1 X106.785 Y140.89 E.87469
G1 X106.528 Y140.926 E.0134
G1 X106.182 Y141.079 E.01959
G1 X98.813 Y155.642 E.84457
G1 X98.477 Y155.305 E.02462
G1 X106.145 Y140.151 E.8789
G1 X105.715 Y139.999 E.02359
G1 X98.142 Y154.966 E.86803
G1 X97.811 Y154.618 E.02483
G1 X105.933 Y138.567 E.93095
G1 X105.669 Y138.087 E.02833
G1 X97.481 Y154.269 E.93853
G1 X97.156 Y153.911 E.02506
G1 X105.408 Y137.602 E.94587
G1 X105.159 Y137.092 E.02935
G1 X96.83 Y153.552 E.95461
G1 X96.511 Y153.181 E.0253
G1 X104.91 Y136.582 E.9627
G1 X104.85 Y136.459 E.00708
G1 X104.234 Y136.952 E.04083
G1 X104.221 Y136.944 E.00079
G1 X96.192 Y152.811 E.92028
G3 X95.878 Y152.43 I7.575 J-6.559 E.02555
G1 X104.124 Y136.134 E.94511
G1 X104.347 Y135.245 E.04746
G1 X104.229 Y134.925 E.01763
G1 X95.564 Y152.048 E.99307
G3 X95.256 Y151.656 I7.835 J-6.475 E.02582
G1 X104.014 Y134.348 E1.00381
G3 X103.816 Y133.738 I6.112 J-2.32 E.03321
G1 X94.949 Y151.262 E1.01635
G3 X94.646 Y150.858 I8.079 J-6.362 E.02611
G1 X103.621 Y133.122 E1.02864
G1 X103.476 Y132.664 E.02489
G1 X103.49 Y132.635 E.00165
M73 P62 R16
G1 X103.446 Y132.467 E.00901
G1 X94.345 Y150.452 E1.04308
G3 X94.049 Y150.036 I8.349 J-6.255 E.02643
G1 X103.274 Y131.805 E1.05733
G3 X103.122 Y131.103 I9.445 J-2.408 E.03716
G1 X93.754 Y149.617 E1.07374
G3 X93.464 Y149.188 I8.606 J-6.122 E.02679
G1 X102.986 Y130.371 E1.09132
G1 X102.982 Y130.347 E.00128
G1 X102.386 Y130.612 E.03374
G1 X102.366 Y130.596 E.00134
G1 X93.176 Y148.756 E1.05327
G3 X92.893 Y148.314 I8.896 J-5.994 E.02718
G1 X102.006 Y130.304 E1.0445
G1 X101.647 Y130.013 E.02394
G1 X92.612 Y147.869 E1.0356
G3 X92.336 Y147.412 I9.155 J-5.829 E.02762
G1 X102.627 Y127.076 E1.17944
G3 X102.608 Y126.112 I9.81 J-.673 E.04993
G1 X92.061 Y146.954 E1.20879
G1 X91.794 Y146.481 E.02809
G1 X102.584 Y125.158 E1.23672
G1 X102.136 Y125.042 E.02395
G1 X99.381 Y130.486 E.31574
G1 X99.367 Y130.514 F30000
G1 F3000
G1 X91.416 Y146.226 E.91127
G1 X91.155 Y145.741 F30000
G1 F3000
G1 X102.017 Y124.276 E1.24491
G3 X101.534 Y124.229 I.204 J-4.579 E.02512
G1 X91.008 Y145.029 E1.20638
G1 X90.756 Y144.527 E.02909
G1 X101.203 Y123.882 E1.19739
G1 X101.217 Y123.691 E.0099
G1 X103.595 Y118.991 E.27259
G1 X103.725 Y118.543 E.02414
G3 X104.082 Y117.472 I11.072 J3.095 E.05842
G1 X103.968 Y117.415 E.00658
G1 X90.506 Y144.019 E1.54294
G1 X90.261 Y143.501 E.02963
G1 X104.226 Y115.905 E1.60051
G1 X103.858 Y115.629 E.02376
G1 X90.022 Y142.973 E1.58585
G1 X89.785 Y142.439 E.03022
G1 X103.491 Y115.354 E1.57087
G1 X103.438 Y115.314 E.00342
G1 X104.41 Y113.395 E.11133
G1 X104.101 Y113.147 E.02047
G1 X99.205 Y122.823 E.56115
G1 X99.177 Y122.877 F30000
G1 F3000
G1 X89.436 Y142.128 E1.1165
G1 X89.208 Y141.577 F30000
G1 F3000
G1 X103.74 Y112.859 E1.6656
G1 X103.379 Y112.57 E.02391
G1 X89.111 Y140.767 E1.63537
G3 X88.897 Y140.19 I11.688 J-4.664 E.0319
G1 X103.019 Y112.281 E1.6186
G1 X102.658 Y111.993 E.02391
G1 X88.687 Y139.603 E1.60132
G3 X88.486 Y138.999 I12.151 J-4.388 E.03293
G1 X102.297 Y111.704 E1.58305
G1 X101.937 Y111.415 E.02391
G1 X88.288 Y138.388 E1.56433
G1 X88.098 Y137.762 E.03386
G1 X101.576 Y111.127 E1.54476
G1 X101.215 Y110.838 E.02391
G1 X87.916 Y137.12 E1.5243
G3 X87.739 Y136.469 I13.127 J-3.912 E.03496
G1 X100.855 Y110.549 E1.50324
G1 X100.494 Y110.261 E.02391
G1 X87.571 Y135.799 E1.48113
G3 X87.412 Y135.112 I27.024 J-6.621 E.03649
G1 X100.133 Y109.972 E1.45803
G1 X99.773 Y109.684 E.02391
G1 X87.26 Y134.411 E1.43412
G1 X87.117 Y133.692 E.03793
G1 X99.412 Y109.395 E1.40917
G1 X99.051 Y109.106 E.02391
G1 X86.986 Y132.949 E1.38283
G3 X86.865 Y132.188 I15.449 J-2.856 E.0399
G1 X98.691 Y108.818 E1.35542
G1 X98.33 Y108.529 E.02391
G1 X86.754 Y131.406 E1.32682
G1 X86.654 Y130.601 E.04198
G1 X97.969 Y108.24 E1.29687
G1 X97.609 Y107.952 E.02391
G1 X86.572 Y129.763 E1.26503
G3 X86.503 Y128.898 I33.886 J-3.123 E.04494
G1 X97.248 Y107.663 E1.23156
G1 X96.887 Y107.374 E.02391
G1 X86.45 Y128 E1.19625
G1 X86.448 Y127.953 E.00246
G3 X86.416 Y127.067 I18.06 J-1.098 E.04588
G1 X96.527 Y107.086 E1.15886
G1 X96.166 Y106.797 E.02391
G1 X86.402 Y126.093 E1.11909
G3 X86.412 Y125.071 I20.814 J-.301 E.05288
G1 X95.805 Y106.508 E1.07657
G1 X95.445 Y106.22 E.02391
G1 X86.451 Y123.986 E1.03048
G3 X86.521 Y122.853 I23.079 J.864 E.05875
G1 X95.084 Y105.931 E.98142
G1 X94.723 Y105.642 E.02391
G1 X86.631 Y121.635 E.92753
G3 X86.79 Y120.32 I60.655 J6.654 E.06855
G1 X94.363 Y105.354 E.868
G1 X94.002 Y105.065 E.02391
G1 X87.018 Y118.866 E.80043
G3 X87.332 Y117.244 I46.828 J8.224 E.08549
G1 X93.641 Y104.776 E.7231
G1 X93.281 Y104.488 E.02391
G1 X87.788 Y115.342 E.62955
G1 X88.031 Y114.466 E.04705
G3 X88.522 Y112.891 I164.82 J50.528 E.08536
G1 X92.92 Y104.199 E.50414
G1 X92.692 Y104.016 E.01513
G2 X91.13 Y106.735 I33.683 J21.158 E.16227
G1 X89.022 Y110.902 E.24168
G1 X105.126 Y114.842 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.468223
; LAYER_HEIGHT: 0.16
G1 F10371.38
G3 X105.419 Y114.27 I102.077 J51.928 E.01819
G1 X105.075 Y113.995 E.01245
G2 X104.366 Y115.458 I24.582 J12.822 E.04599
G1 X104.721 Y115.724 E.01257
G1 X105.101 Y114.897 E.02575
; WIPE_START
G1 X104.721 Y115.724 E-.3459
G1 X104.366 Y115.458 E-.16884
G1 X104.636 Y114.871 E-.24525
; WIPE_END
G1 E-.04 F1800
M73 P63 R16
G1 X103.055 Y122.338 Z4.44 F30000
G1 X102.681 Y124.101 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.398464
G1 F12358.309
G1 X102.68 Y124.108 E.00017
; LINE_WIDTH: 0.446719
G1 F10912.2
G1 X102.679 Y124.115 E.00019
; LINE_WIDTH: 0.494974
G1 F9769.071
G1 X102.679 Y124.122 E.00021
; LINE_WIDTH: 0.543229
G1 F8842.733
G1 X102.678 Y124.129 E.00023
; LINE_WIDTH: 0.374336
G1 F13235.294
G1 X102.555 Y124.581 E.01039
G1 X102.211 Y123.847 F30000
; LINE_WIDTH: 0.464576
G1 F10459.279
G1 X102.535 Y123.875 E.00914
; LINE_WIDTH: 0.439159
G1 F11115.983
G1 X102.608 Y123.988 E.00355
; LINE_WIDTH: 0.395944
G1 F12444.433
G1 X102.681 Y124.101 E.00317
; LINE_WIDTH: 0.397849
G1 F12379.217
G1 X102.672 Y123.883 E.00517
; LINE_WIDTH: 0.466077
G1 F10422.93
G1 X102.663 Y123.665 E.00614
G3 X103.038 Y121.068 I22.697 J1.952 E.07388
G1 X102.371 Y122.386 E.04156
G2 X102.216 Y123.787 I18.764 J2.786 E.03968
G1 X102.702 Y128.709 F30000
; LINE_WIDTH: 0.466249
G1 F10418.773
G1 X102.344 Y129.416 E.02232
G1 X102.442 Y130.085 E.01905
G1 X102.856 Y129.92 E.01253
G3 X102.709 Y128.768 I21.323 J-3.296 E.03271
G1 X104.641 Y136.015 F30000
; LINE_WIDTH: 0.497816
G1 F9709.157
G2 X104.639 Y136.116 I-.029 J.05 E.00721
G1 X106.618 Y139.853 F30000
; LINE_WIDTH: 0.522976
G1 F9209.234
G1 X106.715 Y140.075 E.00774
; LINE_WIDTH: 0.608236
G1 F7841.088
G1 X106.746 Y140.231 E.00594
G1 X106.618 Y139.853 F30000
; LINE_WIDTH: 0.499264
G1 F9678.928
G1 X106.422 Y139.49 E.0125
; LINE_WIDTH: 0.436302
G1 F11194.991
G1 X106.226 Y139.127 E.01081
G1 X105.972 Y139.627 E.01471
G1 X106.177 Y139.715 E.00583
; LINE_WIDTH: 0.451839
G1 F10778.378
G1 X106.369 Y139.775 E.00546
; LINE_WIDTH: 0.499264
G1 F9678.928
G1 X106.56 Y139.835 E.00608
; WIPE_START
G1 X106.369 Y139.775 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.743 Y141.744 Z4.44 F30000
G1 X139.595 Y148.65 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.468647
G1 F10361.251
G1 X139.129 Y148.888 E.01482
G1 X139.154 Y149.171 E.00806
G1 X139.286 Y149.29 E.00503
G1 X139.792 Y149.038 E.01599
G1 X139.889 Y148.941 E.00389
G1 X140.194 Y148.338 E.01912
G1 X139.648 Y148.622 E.01742
G1 X145.738 Y144.174 F30000
; LINE_WIDTH: 0.356456
G1 F13969.95
G1 X145.71 Y144.2 E.00082
G1 X146.009 Y144.43 E.00792
G1 X146.57 Y143.321 E.02611
G1 X145.78 Y144.131 E.02376
; WIPE_START
G1 X146.57 Y143.321 E-.43004
G1 X146.178 Y144.095 E-.32996
; WIPE_END
G1 E-.04 F1800
G1 X150.235 Y137.63 Z4.44 F30000
G1 X151.916 Y134.952 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.62265
G1 F7648.986
G1 X151.753 Y135.313 E.01519
; LINE_WIDTH: 0.586636
G1 F8147.747
G1 X151.59 Y135.674 E.01426
; LINE_WIDTH: 0.550623
G1 F8716.089
G1 X151.427 Y136.034 E.01333
; LINE_WIDTH: 0.553556
G1 F8666.847
G1 X151.403 Y136.085 E.0019
; LINE_WIDTH: 0.588396
G1 F8121.865
G1 X151.379 Y136.136 E.00202
; LINE_WIDTH: 0.623236
G1 F7641.366
G1 X151.356 Y136.187 E.00215
G1 X151.33 Y136.241 F30000
; LINE_WIDTH: 0.516276
G1 F9337.262
G1 X151.102 Y136.7 E.01609
; LINE_WIDTH: 0.469781
G1 F10334.271
G3 X148.717 Y140.772 I-24.977 J-11.894 E.13413
G1 X149.112 Y140.972 E.01255
G2 X151.621 Y136.572 I-22.24 J-15.599 E.14397
G1 X151.454 Y136.487 E.00531
; LINE_WIDTH: 0.484181
G1 F10003.446
G1 X151.406 Y136.391 E.00315
; LINE_WIDTH: 0.516471
G1 F9333.487
G1 X151.357 Y136.295 E.00338
G1 X153.317 Y131.342 F30000
; LINE_WIDTH: 0.46853
G1 F10364.035
G1 X153.257 Y131.28 E.00243
G1 X152.918 Y131.166 E.01011
G3 X152.392 Y133.243 I-25.544 J-5.364 E.06067
; LINE_WIDTH: 0.452086
G1 F10771.993
G1 X152.234 Y133.672 E.01246
; LINE_WIDTH: 0.416646
G1 F11770.553
G1 X152.075 Y134.101 E.0114
; LINE_WIDTH: 0.381206
G1 F12973.16
G1 X151.917 Y134.53 E.01034
; LINE_WIDTH: 0.386584
G1 F12775.109
G1 X151.917 Y134.601 E.00161
; LINE_WIDTH: 0.432779
G1 F11293.977
G1 X151.917 Y134.671 E.00182
; LINE_WIDTH: 0.478974
G1 F10120.605
G1 X151.916 Y134.741 E.00204
; LINE_WIDTH: 0.525169
G1 F9168.098
G1 X151.916 Y134.811 E.00225
; LINE_WIDTH: 0.571364
G1 F8379.46
G1 X151.916 Y134.882 E.00246
; LINE_WIDTH: 0.617559
G1 F7715.752
G1 X151.916 Y134.952 E.00267
G1 X151.966 Y134.903 E.00268
; LINE_WIDTH: 0.571364
G1 F8379.46
G1 X152.017 Y134.854 E.00247
; LINE_WIDTH: 0.525169
G1 F9168.098
G1 X152.068 Y134.805 E.00225
; LINE_WIDTH: 0.478974
G1 F10120.605
G1 X152.118 Y134.756 E.00204
; LINE_WIDTH: 0.432779
G1 F11293.977
G1 X152.169 Y134.707 E.00183
; LINE_WIDTH: 0.393991
G1 F12512.014
G1 X152.22 Y134.658 E.00165
G1 X152.601 Y133.836 E.02124
; LINE_WIDTH: 0.464492
G1 F10461.339
G1 X152.811 Y133.363 E.01452
G2 X153.306 Y131.401 I-28.298 J-8.19 E.05677
G1 X153.849 Y124.725 F30000
; LINE_WIDTH: 0.467451
G1 F10389.865
G1 X153.561 Y124.618 E.00868
G1 X153.41 Y124.678 E.00459
G3 X153.447 Y126.137 I-21.815 J1.286 E.04124
G1 X153.871 Y125.298 E.02655
G1 X153.852 Y124.785 E.01451
G1 X153.186 Y122.162 F30000
; LINE_WIDTH: 0.462796
G1 F10502.731
G2 X153.18 Y122.255 I-.027 J.045 E.00594
G1 X152.682 Y118.212 F30000
; LINE_WIDTH: 0.469925
G1 F10330.854
G1 X152.627 Y118.087 E.00387
G1 X152.1 Y117.825 E.01672
G3 X152.48 Y119.032 I-77.75 J25.114 E.03594
G1 X152.7 Y118.27 E.02253
G1 X147.075 Y108.5 F30000
; LINE_WIDTH: 0.403236
G1 F12198.428
G1 X147.023 Y108.403 E.00265
G1 X146.547 Y108.633 E.01272
G1 X146.96 Y109.087 E.01478
G1 X147.063 Y108.559 E.01294
G1 X142.828 Y104.79 F30000
; LINE_WIDTH: 0.468999
G1 F10352.86
G1 X142.368 Y104.475 E.01581
G1 X141.897 Y104.678 E.01452
G1 X142.693 Y105.226 E.02738
G1 X142.81 Y104.847 E.01122
G1 X134.474 Y101.423 F30000
; LINE_WIDTH: 0.407637
G1 F12054.624
G3 X135.26 Y101.647 I-4.241 J16.398 E.0199
; WIPE_START
G1 X134.474 Y101.423 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.841 Y101.406 Z4.44 F30000
G1 X120.412 Y101.391 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.460499
G1 F10559.336
G1 X119.907 Y101.439 E.01408
G1 X119.56 Y101.532 E.01
G1 X118.809 Y101.821 E.02233
G2 X117.938 Y102.54 I15.327 J19.455 E.0314
G1 X117.812 Y102.689 E.00541
G3 X121.181 Y101.491 I8.992 J19.962 E.09945
G1 X120.471 Y101.399 E.01988
G1 X113.551 Y104.928 F30000
; LINE_WIDTH: 0.468383
G1 F10367.558
G1 X113.075 Y104.856 E.01363
G2 X111.837 Y105.785 I14.777 J20.968 E.04382
G2 X111.374 Y106.353 I7.339 J6.451 E.02073
G1 X111.607 Y106.539 E.00843
G3 X113.751 Y104.919 I15.797 J18.682 E.07608
G1 X113.611 Y104.926 E.00397
G1 X98.789 Y96.606 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40214
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X99.003 Y96.184 E.0245
G3 X99.979 Y95.255 I28.008 J28.48 E.06974
G1 X99.243 Y96.71 E.08438
G1 X99.604 Y96.999 E.02391
G1 X100.897 Y94.444 E.1482
G3 X101.775 Y93.709 I15.39 J17.519 E.05924
G1 X99.965 Y97.288 E.20752
G1 X100.325 Y97.576 E.02391
G1 X102.62 Y93.041 E.26305
G3 X103.437 Y92.427 I12.882 J16.31 E.05288
G1 X100.686 Y97.865 E.31537
G1 X101.047 Y98.153 E.02391
G1 X104.23 Y91.862 E.36492
G3 X105.002 Y91.337 I11.062 J15.457 E.0483
G1 X101.407 Y98.442 E.41207
G1 X101.768 Y98.731 E.02391
G1 X105.756 Y90.849 E.45712
G3 X106.371 Y90.466 I8.125 J12.367 E.03751
G1 X106.494 Y90.393 E.00739
G1 X102.129 Y99.019 E.50033
G1 X102.489 Y99.308 E.02391
G1 X107.217 Y89.964 E.54191
G1 X107.928 Y89.562 E.04225
G1 X102.85 Y99.597 E.58199
G1 X103.211 Y99.885 E.02391
G1 X108.622 Y89.19 E.62029
G3 X109.307 Y88.839 I7.505 J13.779 E.03982
G1 X103.571 Y100.174 E.65741
G1 X103.932 Y100.463 E.02391
G1 X109.982 Y88.506 E.69346
G1 X110.648 Y88.191 E.03814
G1 X104.293 Y100.751 E.72848
G1 X104.653 Y101.04 E.02391
G1 X111.302 Y87.9 E.76207
G3 X111.949 Y87.623 I5.987 J13.094 E.03641
G1 X105.014 Y101.329 E.79487
G1 X105.375 Y101.617 E.02391
G1 X112.589 Y87.359 E.82694
G1 X113.219 Y87.116 E.03492
G1 X105.735 Y101.906 E.85776
G1 X106.096 Y102.195 E.02391
G1 X113.843 Y86.885 E.88791
G1 X114.461 Y86.664 E.03401
G1 X106.457 Y102.483 E.91749
G1 X106.817 Y102.772 E.02391
G1 X115.07 Y86.463 E.9459
G3 X115.651 Y86.277 I4.095 J11.782 E.03156
G1 X115.675 Y86.269 E.00129
G1 X107.178 Y103.061 E.97385
G1 X107.539 Y103.349 E.02391
G1 X116.273 Y86.088 E1.00113
G3 X116.865 Y85.92 I3.708 J11.974 E.03181
G1 X107.899 Y103.638 E1.02758
G1 X108.26 Y103.927 E.02391
G1 X117.453 Y85.759 E1.05368
G1 X118.033 Y85.614 E.03096
G1 X108.621 Y104.215 E1.07885
G1 X108.981 Y104.504 E.02391
G1 X118.61 Y85.475 E1.10363
G1 X119.182 Y85.346 E.03032
G1 X109.342 Y104.793 E1.12782
G1 X109.703 Y105.081 E.02391
G1 X119.748 Y85.229 E1.1514
G1 X120.312 Y85.117 E.02973
G1 X110.063 Y105.37 E1.17464
G1 X110.424 Y105.658 E.02391
G1 X120.868 Y85.018 E1.19709
G3 X121.423 Y84.923 I2.225 J11.274 E.02915
G1 X110.785 Y105.947 E1.21937
G1 X110.998 Y106.118 E.01417
G1 X111.605 Y105.328 E.05156
G1 X121.971 Y84.841 E1.18816
G3 X122.517 Y84.763 I1.858 J11.046 E.02856
G1 X112.636 Y104.292 E1.13261
G1 X112.73 Y104.335 E.00535
G1 X113.082 Y104.411 E.01866
G1 X123.058 Y84.697 E1.14338
G3 X123.596 Y84.635 I1.528 J10.92 E.02803
G1 X113.553 Y104.482 E1.15111
G1 X114.074 Y104.453 E.02703
G1 X124.129 Y84.582 E1.15245
G3 X124.561 Y84.543 I1.018 J8.797 E.02243
G1 X124.66 Y84.536 E.00512
G1 X114.588 Y104.44 E1.15438
G3 X115.319 Y103.996 I4.877 J7.218 E.04426
G1 X125.186 Y84.497 E1.13092
G3 X125.709 Y84.465 I.916 J10.613 E.02712
G1 X116.021 Y103.61 E1.11036
G3 X116.706 Y103.258 I3.923 J6.795 E.03985
G1 X126.229 Y84.439 E1.09145
G3 X126.745 Y84.42 I.636 J10.511 E.02673
G1 X117.812 Y102.073 E1.02379
G1 X118.545 Y101.456 E.04956
G1 X118.657 Y101.404 E.00641
G1 X127.258 Y84.408 E.98575
G3 X127.767 Y84.403 I.334 J8.883 E.02635
G1 X119.307 Y101.122 E.96962
G1 X119.875 Y101.002 E.03002
G1 X128.272 Y84.405 E.96254
G3 X128.777 Y84.41 I.191 J7.409 E.02612
G1 X120.405 Y100.954 E.95954
G1 X120.893 Y100.992 E.02531
G1 X129.274 Y84.429 E.96062
G1 X129.771 Y84.448 E.02574
G1 X121.359 Y101.073 E.96422
G3 X121.805 Y101.193 I-.409 J2.403 E.02393
G1 X130.268 Y84.467 E.97009
G3 X130.762 Y84.493 I-.123 J6.954 E.02558
G1 X122.279 Y101.257 E.97227
G1 X122.847 Y101.137 E.03002
G1 X131.25 Y84.529 E.96321
G3 X131.737 Y84.569 I-.572 J9.937 E.02526
G1 X123.412 Y101.02 E.95412
G1 X123.964 Y100.931 E.02891
G1 X132.22 Y84.616 E.94622
G3 X132.701 Y84.667 I-.781 J9.805 E.02504
G1 X124.517 Y100.839 E.93795
G1 X125.054 Y100.78 E.02795
G1 X133.178 Y84.726 E.93108
G3 X133.654 Y84.786 I-.983 J9.707 E.02485
G1 X125.591 Y100.72 E.92414
G3 X126.12 Y100.676 I.71 J5.359 E.02748
G1 X134.125 Y84.856 E.91755
G1 X134.597 Y84.926 E.02466
G1 X126.643 Y100.644 E.91163
G3 X127.164 Y100.616 I.643 J7.036 E.02701
G1 X135.063 Y85.006 E.90531
G1 X135.529 Y85.087 E.02447
G1 X127.677 Y100.603 E.8999
G3 X128.181 Y100.609 I.173 J6.982 E.02608
G1 X135.99 Y85.177 E.89503
G1 X136.45 Y85.268 E.02429
G1 X128.685 Y100.615 E.89008
G1 X129.182 Y100.633 E.02576
G1 X136.907 Y85.366 E.88543
G1 X137.362 Y85.469 E.02413
G1 X129.674 Y100.663 E.88126
G1 X130.165 Y100.694 E.02548
G1 X137.815 Y85.576 E.87681
G1 X138.265 Y85.688 E.02399
M73 P63 R15
G1 X130.645 Y100.746 E.87332
G1 X131.125 Y100.799 E.02498
G1 X138.713 Y85.803 E.86973
G1 X139.158 Y85.926 E.02387
G1 X131.6 Y100.861 E.86618
G1 X132.069 Y100.937 E.02456
G1 X139.602 Y86.05 E.8634
G1 X140.041 Y86.183 E.02376
G1 X132.538 Y101.012 E.86004
G3 X132.998 Y101.104 I-.703 J4.726 E.0243
G1 X140.481 Y86.316 E.85764
G1 X140.916 Y86.458 E.02368
G1 X133.574 Y100.966 E.84144
M73 P64 R15
G3 X134.076 Y100.976 I.176 J3.797 E.02599
G1 X141.35 Y86.601 E.8337
G3 X141.781 Y86.751 I-2.829 J8.872 E.02362
G1 X134.562 Y101.018 E.82746
G1 X135.005 Y101.143 E.02385
G1 X142.21 Y86.904 E.8258
G3 X142.574 Y87.036 I-2.498 J7.431 E.02003
G1 X142.637 Y87.061 E.00353
G1 X135.444 Y101.276 E.82446
G1 X135.847 Y101.482 E.0234
G1 X143.061 Y87.224 E.82692
G3 X143.485 Y87.389 I-3.159 J8.766 E.02351
G1 X136.247 Y101.694 E.82963
G1 X136.309 Y101.726 E.00365
G1 X136.609 Y101.978 E.02029
G1 X143.904 Y87.562 E.83609
G1 X144.323 Y87.736 E.02347
G1 X136.979 Y102.249 E.8417
G1 X137.406 Y102.407 E.02355
G1 X144.737 Y87.918 E.84035
G1 X145.151 Y88.101 E.02343
G1 X137.823 Y102.585 E.83999
G1 X138.239 Y102.763 E.02345
G1 X145.562 Y88.291 E.83937
G1 X145.971 Y88.484 E.02341
G1 X138.654 Y102.945 E.83872
G1 X139.06 Y103.144 E.0234
G1 X146.378 Y88.681 E.83882
G1 X146.782 Y88.884 E.0234
G1 X139.466 Y103.342 E.83853
G3 X139.868 Y103.549 I-1.902 J4.19 E.02341
G1 X147.186 Y89.088 E.8387
G1 X147.585 Y89.301 E.0234
G1 X140.265 Y103.767 E.83899
G1 X140.661 Y103.985 E.02341
G1 X147.984 Y89.514 E.83928
G3 X148.378 Y89.735 I-4.301 J8.138 E.02342
G1 X141.051 Y104.217 E.83988
G1 X141.319 Y104.382 E.0163
G1 X141.499 Y104.331 E.00972
G1 X148.772 Y89.958 E.83356
G3 X149.163 Y90.187 I-4.471 J8.095 E.02344
G1 X142.121 Y104.104 E.80714
G1 X142.801 Y103.761 E.0394
G1 X149.552 Y90.42 E.77376
G3 X149.939 Y90.656 I-4.62 J8.016 E.02347
G1 X143.255 Y103.866 E.76611
G1 X143.519 Y104.051 E.0167
G1 X143.286 Y104.806 E.04088
G1 X150.323 Y90.899 E.80657
G3 X150.707 Y91.143 I-4.791 J7.968 E.02351
G1 X143.316 Y105.748 E.84706
G1 X143.682 Y106.026 E.02379
G1 X151.085 Y91.396 E.84853
G1 X151.464 Y91.649 E.02357
G1 X144.043 Y106.315 E.85057
G1 X144.398 Y106.614 E.02404
G1 X151.838 Y91.91 E.85277
G1 X152.212 Y92.173 E.02365
G1 X144.754 Y106.913 E.85485
G3 X145.103 Y107.224 I-4.065 J4.901 E.02422
G1 X152.583 Y92.442 E.85734
G1 X152.951 Y92.715 E.02374
G1 X145.446 Y107.547 E.86018
G1 X145.785 Y107.878 E.02453
G1 X153.318 Y92.992 E.86332
G1 X153.681 Y93.276 E.02385
G1 X146.125 Y108.209 E.86608
G1 X146.244 Y108.326 E.00864
G2 X146.678 Y108.117 I-5.433 J-11.838 E.02492
G1 X154.044 Y93.561 E.8442
G1 X154.402 Y93.855 E.02397
G1 X147.318 Y107.854 E.81191
G1 X147.635 Y107.764 E.01704
G1 X147.488 Y108.519 E.03979
G1 X154.76 Y94.148 E.83345
G3 X155.113 Y94.452 I-6.064 J7.41 E.0241
G1 X147.424 Y109.647 E.88125
G1 X147.74 Y110.023 E.02543
G1 X155.466 Y94.756 E.88541
G3 X155.814 Y95.068 I-6.217 J7.298 E.02422
G1 X148.048 Y110.416 E.89011
G1 X148.353 Y110.816 E.02601
G1 X156.162 Y95.383 E.89505
G3 X156.506 Y95.704 I-6.348 J7.157 E.02436
G1 X148.654 Y111.222 E.89998
G1 X148.946 Y111.647 E.02668
G1 X156.848 Y96.03 E.90575
G3 X157.188 Y96.36 I-6.551 J7.086 E.02451
G1 X149.237 Y112.072 E.91127
G1 X149.529 Y112.497 E.02668
G1 X157.524 Y96.696 E.91641
G3 X157.859 Y97.035 I-6.764 J7.014 E.02468
G1 X149.796 Y112.97 E.92418
G3 X150.068 Y113.435 I-4.588 J2.993 E.02786
G1 X158.19 Y97.383 E.93097
G3 X158.52 Y97.732 I-6.926 J6.883 E.02486
G1 X150.332 Y113.915 E.93855
G3 X150.593 Y114.4 I-4.823 J2.908 E.02853
G1 X158.846 Y98.091 E.9459
G3 X159.171 Y98.45 I-6.912 J6.585 E.02507
G1 X150.842 Y114.91 E.95464
G1 X151.09 Y115.419 E.02935
G1 X159.49 Y98.82 E.96273
G1 X159.809 Y99.19 E.0253
G1 X151.323 Y115.961 E.97269
G1 X151.555 Y116.504 E.03052
G1 X160.123 Y99.571 E.98203
G1 X160.437 Y99.953 E.02557
G1 X151.772 Y117.077 E.99311
G1 X151.863 Y117.321 E.01347
G1 X152.023 Y117.289 E.00844
G1 X152.139 Y117.352 E.00686
G1 X160.745 Y100.346 E.98635
G1 X161.052 Y100.739 E.02586
G1 X152.539 Y117.564 E.97578
G1 X152.864 Y117.712 E.01848
G1 X152.96 Y117.733 E.00509
G1 X161.355 Y101.143 E.96217
G1 X161.656 Y101.55 E.02617
G1 X153.137 Y118.385 E.97643
G1 X152.666 Y119.956 E.08488
G3 X152.726 Y120.198 I-2.438 J.736 E.01291
G1 X161.952 Y101.966 E1.05745
G1 X162.247 Y102.384 E.0265
G1 X152.875 Y120.904 E1.07411
G3 X153.015 Y121.63 I-7.416 J1.801 E.03826
G1 X162.537 Y102.813 E1.09132
G1 X162.825 Y103.245 E.02686
G1 X153.432 Y121.807 E1.07652
G1 X153.824 Y121.868 E.0205
G1 X153.221 Y123.059 E.0691
G1 X153.236 Y123.196 E.00712
G1 X163.108 Y103.688 E1.13142
G1 X163.389 Y104.132 E.02724
G1 X153.319 Y124.034 E1.15426
G1 X153.331 Y124.234 E.01036
G1 X153.558 Y124.144 E.01263
G1 X153.735 Y124.213 E.00983
G1 X163.665 Y104.59 E1.13812
G1 X163.939 Y105.048 E.02766
G1 X154.163 Y124.368 E1.1205
G2 X154.615 Y124.476 I.647 J-1.71 E.02412
G1 X164.207 Y105.52 E1.09936
G3 X164.474 Y105.994 I-30.849 J17.675 E.02815
G1 X153.308 Y128.061 E1.2798
G3 X153.172 Y129.331 I-12.962 J-.744 E.06611
G1 X164.734 Y106.481 E1.3252
G3 X164.993 Y106.972 I-9.882 J5.513 E.02871
G1 X152.976 Y130.72 E1.37729
G1 X153.409 Y130.866 E.02364
G1 X165.245 Y107.474 E1.35666
G3 X165.495 Y107.983 I-10.226 J5.323 E.02933
G1 X153.801 Y131.092 E1.34026
G1 X154.062 Y131.224 E.01514
G1 X154.248 Y131.21 E.00968
M73 P65 R15
G1 X165.739 Y108.501 E1.31705
G3 X165.957 Y108.981 I-9.666 J4.679 E.02728
G1 X165.979 Y109.029 E.00274
G1 X136.82 Y166.653 E3.34203
G1 X137.392 Y166.525 E.03032
G1 X166.215 Y109.563 E3.30363
G3 X166.444 Y110.112 I-11.122 J4.957 E.03079
G1 X137.969 Y166.386 E3.26373
G1 X138.549 Y166.241 E.03096
G1 X166.671 Y110.666 E3.22316
G1 X166.89 Y111.235 E.03152
G1 X139.137 Y166.079 E3.18084
G2 X139.729 Y165.912 I-3.115 J-12.132 E.03181
G1 X167.104 Y111.812 E3.13761
G1 X167.314 Y112.399 E.03224
G1 X140.328 Y165.73 E3.09306
G2 X140.932 Y165.537 I-3.644 J-12.437 E.03285
G1 X167.515 Y113.003 E3.04683
G3 X167.712 Y113.614 I-12.362 J4.325 E.03326
G1 X141.541 Y165.335 E2.99969
G1 X142.159 Y165.114 E.03401
G1 X167.902 Y114.24 E2.95054
G3 X168.084 Y114.882 I-13.001 J4.037 E.03451
G1 X142.783 Y164.883 E2.89992
G1 X143.413 Y164.64 E.03492
G1 X168.261 Y115.534 E2.84803
G1 X168.429 Y116.204 E.03574
G1 X144.053 Y164.376 E2.79385
G2 X144.7 Y164.099 I-5.34 J-13.366 E.03642
G1 X168.588 Y116.891 E2.73794
G3 X168.74 Y117.592 I-24.524 J5.687 E.03712
G1 X145.354 Y163.808 E2.68043
G1 X146.02 Y163.493 E.03814
G1 X168.883 Y118.31 E2.62046
G3 X169.014 Y119.053 I-15.006 J3.025 E.03904
G1 X146.695 Y163.16 E2.55806
G2 X147.38 Y162.808 I-6.829 J-14.145 E.03983
G1 X169.135 Y119.815 E2.49352
G3 X169.247 Y120.597 I-15.8 J2.644 E.04087
G1 X148.075 Y162.437 E2.4266
G1 X148.785 Y162.034 E.04225
G1 X169.346 Y121.402 E2.35657
G3 X169.429 Y122.24 I-17.098 J2.113 E.04357
G1 X149.509 Y161.606 E2.28314
G2 X150.246 Y161.149 I-8.943 J-15.276 E.0449
G1 X169.497 Y123.105 E2.20645
G3 X169.535 Y123.707 I-12.259 J1.077 E.03122
G1 X169.55 Y124.003 E.01531
G1 X151 Y160.661 E2.12607
G2 X151.772 Y160.136 I-17.633 J-26.79 E.04831
G1 X169.584 Y124.936 E2.04151
G3 X169.598 Y125.911 I-19.894 J.765 E.05044
G1 X152.565 Y159.571 E1.95217
G2 X153.216 Y159.087 I-119.729 J-161.781 E.04195
G1 X153.383 Y158.957 E.01093
G1 X169.587 Y126.933 E1.85732
G3 X169.549 Y128.01 I-21.982 J-.24 E.05576
G1 X154.228 Y158.288 E1.75606
G2 X155 Y157.645 I-12.692 J-16.033 E.05198
G1 X155.106 Y157.554 E.00727
G1 X169.478 Y129.151 E1.64726
G3 X169.407 Y129.977 I-16.91 J-1.038 E.0429
G1 X169.369 Y130.369 E.02039
G1 X156.024 Y156.742 E1.52953
G2 X156.758 Y156.056 I-13.607 J-15.304 E.05202
G1 X156.989 Y155.836 E.01646
G1 X169.21 Y131.685 E1.4007
G3 X168.981 Y133.139 I-29.814 J-3.951 E.07618
G1 X158.024 Y154.791 E1.25577
G2 X158.87 Y153.882 I-18.077 J-17.666 E.06429
G1 X159.144 Y153.58 E.02108
G1 X168.666 Y134.762 E1.09139
G3 X168.21 Y136.665 I-52.295 J-11.532 E.10129
G1 X160.41 Y152.079 E.89396
G2 X161.95 Y150.036 I-30.929 J-24.926 E.13241
G1 X167.475 Y139.119 E.63321
G3 X165.665 Y143.657 I-42.988 J-14.518 E.25296
G1 X165.386 Y144.247 E.0338
G3 X163.26 Y148.451 I-990.71 J-498.398 E.24376
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M73 P66 R15
G1 X164.162 Y146.666 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/58
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.44 I-.611 J-1.052 P1  F30000
G1 X127.486 Y167.967 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X92.595 Y103.461 I.515 J-41.968 E2.41717
G1 X105.956 Y114.155 E.46374
G2 X151.521 Y117.455 I22.044 J11.845 E2.70094
M73 P66 R14
G2 X111.613 Y107.087 I-23.521 J8.546 E1.31298
G1 X98.251 Y96.394 E.46374
G3 X128.688 Y84.034 I29.754 J29.615 E.91459
G3 X127.546 Y167.967 I-.687 J41.965 E3.56661
G1 X127.481 Y168.384 F30000
G1 F9000
G3 X92.492 Y102.847 I.516 J-42.384 E2.45389
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X128.698 Y83.618 I30.38 J29.601 E.9363
G3 X127.541 Y168.385 I-.701 J42.382 E3.60173
M204 S250
G1 X127.476 Y168.785 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.526 J-42.785 E2.30922
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.708 Y83.218 I30.961 J29.525 E.88811
G3 X127.536 Y168.786 I-.706 J42.782 E3.37355
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.42208
G1 X125.537 Y168.717 E-.33792
; WIPE_END
G1 E-.04 F1800
G1 X121.96 Y167.365 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421566
G1 F11621
G1 X142.541 Y146.784 E.73475
G3 X141.003 Y147.774 I-18.538 J-27.102 E.04617
G1 X121.636 Y167.141 E.69142
G3 X121.163 Y167.066 I1.301 J-9.633 E.01207
G1 X139.762 Y148.467 E.66398
G3 X138.674 Y149.007 I-6.902 J-12.526 E.03069
G1 X120.697 Y166.985 E.64178
G3 X120.233 Y166.901 I1.484 J-9.497 E.01189
G1 X137.7 Y149.434 E.62356
G3 X136.804 Y149.782 I-4.156 J-9.363 E.02428
G1 X119.777 Y166.81 E.60788
G3 X119.321 Y166.718 I1.648 J-9.327 E.01173
G1 X135.958 Y150.08 E.59395
G1 X135.157 Y150.334 E.02123
G1 X118.874 Y166.617 E.58129
G1 X118.427 Y166.517 E.01157
G1 X134.406 Y150.537 E.57048
G3 X133.676 Y150.72 I-2.229 J-7.353 E.01902
G1 X117.988 Y166.408 E.56006
G1 X117.55 Y166.298 E.0114
G1 X132.981 Y150.867 E.5509
G3 X132.308 Y150.992 I-1.613 J-6.784 E.01729
G1 X117.118 Y166.183 E.5423
G1 X116.689 Y166.064 E.01123
G1 X131.656 Y151.097 E.53431
G3 X131.026 Y151.179 I-1.149 J-6.373 E.01603
G1 X116.263 Y165.943 E.52705
G1 X115.842 Y165.815 E.01108
G1 X130.41 Y151.248 E.52006
G3 X129.81 Y151.301 I-1.018 J-8.13 E.01522
G1 X115.422 Y165.688 E.51362
G1 X115.011 Y165.552 E.01094
G1 X129.231 Y151.331 E.50766
G1 X128.663 Y151.352 E.01436
G1 X114.599 Y165.416 E.50206
G3 X114.193 Y165.274 I2.675 J-8.337 E.01086
G1 X128.105 Y151.363 E.49664
G1 X127.564 Y151.356 E.01366
G1 X113.79 Y165.13 E.49173
G3 X113.388 Y164.983 I2.776 J-8.223 E.01078
G1 X127.025 Y151.347 E.4868
G1 X126.509 Y151.316 E.01305
M73 P67 R14
G1 X112.993 Y164.831 E.48249
G1 X112.598 Y164.679 E.01069
G1 X125.993 Y151.284 E.47818
G3 X125.492 Y151.237 I.229 J-5.12 E.0127
G1 X112.21 Y164.519 E.47418
G1 X111.822 Y164.359 E.01058
G1 X124.999 Y151.182 E.47041
G3 X124.51 Y151.124 I.346 J-5.005 E.01245
G1 X111.439 Y164.195 E.46664
G1 X111.059 Y164.027 E.01048
G1 X124.038 Y151.048 E.46334
G1 X123.566 Y150.972 E.01206
G1 X110.68 Y163.859 E.46005
G3 X110.308 Y163.683 I3.37 J-7.628 E.01039
G1 X123.103 Y150.888 E.45679
G3 X122.649 Y150.794 I1.046 J-6.197 E.0117
G1 X109.936 Y163.508 E.45387
G3 X109.567 Y163.328 I3.475 J-7.602 E.01034
G1 X122.207 Y150.689 E.45122
G1 X121.764 Y150.584 E.01148
G1 X109.203 Y163.145 E.44842
G1 X108.839 Y162.961 E.01029
G1 X121.33 Y150.47 E.44594
G1 X120.906 Y150.347 E.01116
G1 X108.482 Y162.771 E.44353
G1 X108.125 Y162.58 E.01021
G1 X120.481 Y150.224 E.44112
G3 X120.068 Y150.089 I1.162 J-4.272 E.01097
G1 X107.771 Y162.386 E.43899
G1 X107.422 Y162.188 E.01014
G1 X119.661 Y149.949 E.43693
G1 X119.253 Y149.809 E.01088
G1 X107.072 Y161.99 E.43486
G3 X106.729 Y161.786 I4.002 J-7.104 E.01008
G1 X118.858 Y149.656 E.43302
G1 X118.467 Y149.5 E.01064
G1 X106.387 Y161.58 E.43127
G3 X106.047 Y161.373 I4.055 J-7.023 E.01006
G1 X118.076 Y149.343 E.42945
G3 X117.695 Y149.177 I2.062 J-5.256 E.01051
G1 X105.711 Y161.161 E.4278
G1 X105.376 Y160.948 E.01002
G1 X117.319 Y149.005 E.42635
G1 X116.951 Y148.826 E.01034
G1 X105.046 Y160.73 E.42499
G1 X104.718 Y160.511 E.00997
G1 X116.583 Y148.646 E.42357
G3 X116.219 Y148.462 I1.686 J-3.791 E.01029
G1 X104.391 Y160.291 E.42226
G1 X104.069 Y160.064 E.00992
G1 X115.866 Y148.268 E.42112
G1 X115.512 Y148.074 E.01018
G1 X103.748 Y159.838 E.41998
G3 X103.431 Y159.608 I4.531 J-6.58 E.0099
G1 X115.162 Y147.877 E.4188
G1 X114.823 Y147.668 E.01005
G1 X103.116 Y159.375 E.41793
G1 X102.802 Y159.141 E.00988
G1 X114.484 Y147.459 E.41706
G3 X114.146 Y147.249 I1.967 J-3.549 E.01004
G1 X102.494 Y158.901 E.41598
G1 X102.186 Y158.661 E.00985
G1 X113.821 Y147.026 E.41537
G1 X113.497 Y146.804 E.00994
G1 X101.881 Y158.419 E.41467
G1 X101.58 Y158.172 E.00982
G1 X113.172 Y146.581 E.41381
G3 X112.856 Y146.349 I2.998 J-4.401 E.00989
G1 X101.28 Y157.925 E.41329
G3 X100.984 Y157.674 I4.969 J-6.14 E.00981
G1 X112.545 Y146.112 E.41274
G1 X112.241 Y145.869 E.00983
G1 X100.69 Y157.42 E.41238
G3 X100.396 Y157.166 I5.049 J-6.124 E.0098
G1 X111.937 Y145.625 E.41199
G3 X111.634 Y145.381 I3.164 J-4.227 E.00983
G1 X100.109 Y156.905 E.41143
G1 X99.822 Y156.645 E.00979
G1 X111.34 Y145.127 E.41119
G3 X111.051 Y144.868 I3.365 J-4.047 E.00979
G1 X99.538 Y156.382 E.41103
G1 X99.257 Y156.115 E.00978
G1 X110.767 Y144.605 E.41091
G1 X110.483 Y144.341 E.00978
G1 X98.976 Y155.848 E.41079
G3 X98.701 Y155.575 I5.411 J-5.735 E.00978
G1 X110.203 Y144.073 E.41061
G1 X109.933 Y143.796 E.00978
G1 X98.428 Y155.301 E.41073
G3 X98.155 Y155.026 I5.471 J-5.697 E.00978
G1 X109.662 Y143.519 E.41081
G3 X109.393 Y143.24 I2.683 J-2.865 E.00978
G1 X97.888 Y154.746 E.41073
G1 X97.621 Y154.465 E.00978
G1 X109.136 Y142.95 E.41109
G1 X108.879 Y142.659 E.00979
G1 X97.357 Y154.181 E.41132
G1 X97.097 Y153.894 E.00979
G1 X108.622 Y142.368 E.41145
G3 X108.377 Y142.066 I2.951 J-2.642 E.00983
G1 X96.837 Y153.606 E.41199
G3 X96.582 Y153.313 I5.881 J-5.354 E.0098
G1 X108.134 Y141.762 E.41237
G1 X107.89 Y141.458 E.00983
G1 X96.329 Y153.019 E.41274
G3 X96.077 Y152.723 I5.908 J-5.282 E.00981
G1 X107.654 Y141.146 E.41328
G3 X107.421 Y140.831 I4.18 J-3.324 E.00989
G1 X95.83 Y152.422 E.4138
G1 X95.583 Y152.122 E.00982
G1 X107.198 Y140.506 E.41466
G1 X106.976 Y140.182 E.00994
G1 X95.341 Y151.816 E.41536
G1 X95.101 Y151.509 E.00985
G1 X106.753 Y139.857 E.41597
G3 X106.543 Y139.519 I3.309 J-2.289 E.01004
G1 X94.861 Y151.201 E.41705
G1 X94.628 Y150.887 E.00988
G1 X106.334 Y139.18 E.41792
G1 X106.125 Y138.841 E.01005
G1 X94.394 Y150.572 E.41879
G3 X94.164 Y150.255 I6.339 J-4.843 E.0099
G1 X105.928 Y138.491 E.41997
G1 X105.734 Y138.138 E.01018
G1 X93.938 Y149.934 E.42111
G1 X93.712 Y149.612 E.00992
G1 X105.539 Y137.785 E.42225
G3 X105.355 Y137.421 I3.607 J-2.052 E.01029
G1 X93.491 Y149.285 E.42356
G1 X93.272 Y148.957 E.00997
G1 X105.176 Y137.053 E.42498
G1 X104.996 Y136.685 E.01034
G1 X93.054 Y148.627 E.42634
G1 X92.841 Y148.292 E.01002
G1 X104.827 Y136.306 E.42787
G1 X104.663 Y135.923 E.01053
G1 X92.629 Y147.957 E.42959
G3 X92.421 Y147.617 I6.818 J-4.399 E.01006
G1 X104.498 Y135.54 E.43114
G3 X104.345 Y135.146 I3.931 J-1.757 E.01068
G1 X92.216 Y147.274 E.43299
G3 X92.012 Y146.931 I6.939 J-4.37 E.01008
G1 X104.196 Y134.746 E.43499
G1 X104.048 Y134.347 E.01075
G1 X91.814 Y146.582 E.43676
G1 X91.616 Y146.232 E.01014
G1 X103.912 Y133.935 E.43899
G1 X103.781 Y133.519 E.01101
G1 X91.422 Y145.878 E.44121
G1 X91.231 Y145.522 E.01021
G1 X103.649 Y133.104 E.44332
G3 X103.533 Y132.672 I4.352 J-1.399 E.01129
G1 X91.04 Y145.164 E.44599
G1 X90.857 Y144.8 E.01029
G1 X103.419 Y132.238 E.44845
G3 X103.306 Y131.803 I5.851 J-1.743 E.01135
G1 X90.674 Y144.436 E.45099
G3 X90.494 Y144.068 I7.425 J-3.847 E.01034
G1 X103.206 Y131.356 E.45381
G3 X103.117 Y130.898 I6.18 J-1.442 E.01179
G1 X90.318 Y143.696 E.4569
G3 X90.143 Y143.324 I7.383 J-3.712 E.01039
G1 X103.031 Y130.436 E.4601
G3 X102.947 Y129.972 I6.247 J-1.372 E.0119
G1 X89.974 Y142.944 E.4631
G1 X89.806 Y142.565 E.01048
G1 X102.876 Y129.495 E.46658
G3 X102.818 Y129.005 I6.63 J-1.026 E.01246
G1 X89.643 Y142.181 E.47037
G1 X89.482 Y141.794 E.01058
G1 X102.764 Y128.512 E.47415
G3 X102.716 Y128.012 I5.064 J-.731 E.01269
G1 X89.323 Y141.406 E.47814
G1 X89.17 Y141.01 E.01069
G1 X102.685 Y127.496 E.48245
G1 X102.653 Y126.98 E.01305
G1 X89.018 Y140.615 E.48676
G3 X88.871 Y140.214 I8.124 J-3.196 E.01078
G1 X102.644 Y126.442 E.49168
G1 X102.637 Y125.901 E.01366
G1 X88.727 Y139.811 E.49659
G3 X88.586 Y139.405 I8.168 J-3.073 E.01086
G1 X102.648 Y125.343 E.50201
G1 X102.668 Y124.774 E.01436
G1 X88.45 Y138.993 E.50761
G1 X88.314 Y138.581 E.01094
G1 X102.702 Y124.193 E.51367
G1 X102.754 Y123.594 E.01518
G1 X88.186 Y138.161 E.52007
G1 X88.059 Y137.741 E.01108
G1 X102.815 Y122.985 E.52678
G3 X102.898 Y122.354 I12.889 J1.387 E.01608
G1 X87.937 Y137.315 E.53412
G1 X87.818 Y136.886 E.01123
G1 X103.006 Y121.699 E.54219
G1 X103.131 Y121.026 E.01728
G1 X87.703 Y136.454 E.55078
G1 X87.593 Y136.016 E.0114
G1 X103.283 Y120.327 E.56011
G1 X103.453 Y119.609 E.01863
G1 X87.484 Y135.578 E.57009
G1 X87.384 Y135.13 E.01157
G1 X103.671 Y118.843 E.58146
G3 X103.917 Y118.049 I8.177 J2.098 E.02097
G1 X87.283 Y134.683 E.59382
G3 X87.191 Y134.228 I9.211 J-2.101 E.01173
G1 X104.204 Y117.215 E.60736
G3 X104.564 Y116.307 I9.424 J3.212 E.02466
G1 X87.1 Y133.771 E.62346
G3 X87.016 Y133.308 I9.38 J-1.944 E.01189
G1 X104.995 Y115.329 E.64183
G3 X105.523 Y114.253 I11.976 J5.21 E.03025
G1 X86.935 Y132.841 E.66357
G3 X86.859 Y132.369 I9.583 J-1.779 E.01207
G1 X105.223 Y114.005 E.65559
G1 X104.919 Y113.761 E.00983
G1 X86.789 Y131.892 E.64726
G3 X86.722 Y131.411 I9.763 J-1.596 E.01226
G1 X104.615 Y113.518 E.63878
G1 X104.311 Y113.275 E.00984
G1 X86.662 Y130.924 E.63006
G3 X86.605 Y130.433 I9.993 J-1.402 E.01248
G1 X104.007 Y113.031 E.62123
G1 X103.703 Y112.788 E.00983
G1 X86.556 Y129.934 E.61212
G3 X86.51 Y129.432 I10.18 J-1.185 E.01272
G1 X103.398 Y112.544 E.6029
G1 X103.094 Y112.301 E.00984
G1 X86.473 Y128.922 E.59339
G3 X86.438 Y128.409 I10.435 J-.956 E.01299
G1 X102.79 Y112.057 E.58375
G1 X102.486 Y111.814 E.00984
G1 X86.413 Y127.887 E.57381
G3 X86.391 Y127.361 I10.731 J-.704 E.01329
G1 X102.182 Y111.57 E.56372
G1 X101.877 Y111.327 E.00984
G1 X86.378 Y126.827 E.55333
G3 X86.37 Y126.287 I10.98 J-.428 E.01363
G1 X101.573 Y111.084 E.54275
G1 X101.269 Y110.84 E.00983
G1 X86.37 Y125.739 E.53189
G3 X86.378 Y125.184 I11.297 J-.124 E.01402
G1 X100.965 Y110.597 E.52076
G1 X100.661 Y110.353 E.00983
G1 X86.391 Y124.623 E.50941
G3 X86.416 Y124.051 I11.64 J.208 E.01445
G1 X100.357 Y110.11 E.49769
G1 X100.052 Y109.866 E.00984
G1 X86.444 Y123.475 E.48582
G3 X86.487 Y122.884 I11.997 J.575 E.01495
G1 X99.748 Y109.623 E.47343
G1 X99.444 Y109.379 E.00983
G1 X86.534 Y122.289 E.46088
G1 X86.594 Y121.682 E.01541
G1 X99.14 Y109.136 E.44788
G1 X98.836 Y108.893 E.00984
G1 X86.663 Y121.065 E.43455
G1 X86.74 Y120.44 E.01589
G1 X98.531 Y108.649 E.42094
G1 X98.227 Y108.406 E.00984
G1 X86.835 Y119.798 E.40672
G3 X86.937 Y119.148 I13.32 J1.766 E.01661
G1 X97.923 Y108.162 E.3922
G1 X97.619 Y107.919 E.00983
G1 X87.052 Y118.486 E.37724
G3 X87.185 Y117.806 I13.905 J2.358 E.0175
G1 X97.315 Y107.675 E.36165
G1 X97.011 Y107.432 E.00983
G1 X87.329 Y117.113 E.34563
G1 X87.488 Y116.407 E.01827
G1 X96.706 Y107.188 E.32911
G1 X96.402 Y106.945 E.00984
G1 X87.67 Y115.678 E.31175
G3 X87.869 Y114.931 I15.29 J3.676 E.01951
G1 X96.098 Y106.701 E.29379
G1 X95.794 Y106.458 E.00983
G1 X88.087 Y114.165 E.27513
G3 X88.327 Y113.377 I16.223 J4.518 E.0208
G1 X95.49 Y106.215 E.25569
G1 X95.186 Y105.971 E.00983
G1 X88.598 Y112.559 E.23519
G3 X88.898 Y111.711 I17.434 J5.703 E.02272
G1 X94.881 Y105.728 E.21359
G1 X94.577 Y105.484 E.00984
G1 X89.232 Y110.829 E.19081
G3 X89.606 Y109.908 I18.938 J7.139 E.02508
G1 X94.273 Y105.241 E.16662
G1 X93.969 Y104.997 E.00984
G1 X90.025 Y108.941 E.14078
G3 X90.501 Y107.917 I21.102 J9.188 E.02849
G1 X93.665 Y104.754 E.11294
G1 X93.36 Y104.51 E.00984
G1 X91.045 Y106.826 E.08265
G3 X91.694 Y105.629 I24.713 J12.631 E.03438
G1 X93.056 Y104.267 E.04861
G1 X92.752 Y104.024 E.00984
G1 X91.965 Y104.811 E.02811
; WIPE_START
G1 X92.752 Y104.024 E-.4232
G1 X93.056 Y104.267 E-.14805
G1 X92.705 Y104.618 E-.18875
; WIPE_END
G1 E-.04 F1800
G1 X97.714 Y98.86 Z4.6 F30000
G1 X103.689 Y91.991 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F11621
G1 X99.069 Y96.612 E.16495
G1 X99.373 Y96.855 E.00983
G1 X104.782 Y91.446 E.19311
G3 X106.311 Y90.465 I25.597 J38.212 E.04584
G1 X99.677 Y97.099 E.23681
G1 X99.981 Y97.342 E.00984
G1 X107.629 Y89.694 E.27301
G3 X108.826 Y89.045 I13.836 J24.08 E.03437
G1 X100.285 Y97.585 E.30488
G1 X100.59 Y97.829 E.00984
G1 X109.917 Y88.501 E.333
G3 X110.941 Y88.025 I10.186 J20.571 E.02849
G1 X100.894 Y98.072 E.35868
G1 X101.198 Y98.316 E.00984
G1 X111.908 Y87.606 E.38235
G3 X112.829 Y87.232 I8.046 J18.53 E.02509
G1 X101.502 Y98.559 E.40437
G1 X101.806 Y98.803 E.00984
G1 X113.711 Y86.898 E.42498
G3 X114.559 Y86.598 I6.533 J17.082 E.02272
G1 X102.111 Y99.046 E.44441
G1 X102.415 Y99.29 E.00983
G1 X115.377 Y86.327 E.46275
G3 X116.165 Y86.087 I5.29 J15.931 E.0208
G1 X102.719 Y99.533 E.48002
G1 X103.023 Y99.776 E.00983
G1 X116.931 Y85.869 E.4965
G3 X117.678 Y85.67 I4.421 J15.08 E.01951
G1 X103.327 Y100.02 E.5123
G1 X103.631 Y100.263 E.00983
G1 X118.407 Y85.488 E.52749
G1 X119.113 Y85.329 E.01827
G1 X103.936 Y100.507 E.54184
G1 X104.24 Y100.75 E.00983
G1 X119.806 Y85.185 E.55569
G3 X120.486 Y85.052 I3.036 J13.76 E.0175
G1 X104.544 Y100.994 E.56912
G1 X104.848 Y101.237 E.00983
G1 X121.148 Y84.937 E.58191
G3 X121.798 Y84.835 I2.414 J13.212 E.01661
G1 X105.152 Y101.481 E.59426
G1 X105.457 Y101.724 E.00984
G1 X122.44 Y84.74 E.60631
G1 X123.065 Y84.663 E.01589
G1 X105.761 Y101.967 E.61775
G1 X106.065 Y102.211 E.00984
G1 X123.682 Y84.594 E.62892
G1 X124.289 Y84.534 E.01541
G1 X106.369 Y102.454 E.63975
G1 X106.673 Y102.698 E.00984
G1 X124.884 Y84.487 E.65012
G3 X125.475 Y84.444 I1.169 J12.001 E.01495
G1 X106.977 Y102.941 E.66035
G1 X107.282 Y103.185 E.00984
G1 X126.051 Y84.416 E.67005
G3 X126.623 Y84.391 I.781 J11.642 E.01445
G1 X107.586 Y103.428 E.67961
G1 X107.89 Y103.672 E.00983
G1 X127.184 Y84.378 E.68879
G3 X127.738 Y84.371 I.395 J9.867 E.01399
G1 X108.194 Y103.915 E.69772
G1 X108.498 Y104.158 E.00983
G1 X128.284 Y84.373 E.70634
G3 X128.825 Y84.38 I.17 J7.861 E.01365
G1 X108.802 Y104.402 E.71478
G1 X109.107 Y104.645 E.00984
G1 X129.352 Y84.4 E.72276
G1 X129.88 Y84.42 E.01333
G1 X109.411 Y104.889 E.73074
G1 X109.715 Y105.132 E.00983
G1 X130.407 Y84.44 E.73871
G3 X130.922 Y84.473 I-.201 J7.226 E.01303
G1 X110.019 Y105.376 E.74623
G1 X110.323 Y105.619 E.00983
G1 X131.432 Y84.51 E.75358
G3 X131.934 Y84.556 I-.689 J10.282 E.01272
G1 X110.628 Y105.863 E.76063
G1 X110.932 Y106.106 E.00984
G1 X132.433 Y84.605 E.76757
G3 X132.924 Y84.662 I-.91 J10.033 E.01248
G1 X111.236 Y106.35 E.77424
G1 X111.54 Y106.593 E.00984
G1 X133.411 Y84.722 E.78078
G3 X133.892 Y84.789 I-1.114 J9.822 E.01226
G1 X113.457 Y105.223 E.72951
G3 X115.013 Y104.215 I11.043 J15.336 E.04682
G1 X134.369 Y84.859 E.69099
G3 X134.841 Y84.935 I-1.309 J9.665 E.01207
G1 X116.263 Y103.513 E.66324
G1 X117.339 Y102.985 E.03027
G1 X135.308 Y85.016 E.64147
G3 X135.771 Y85.1 I-1.48 J9.457 E.01189
G1 X118.308 Y102.564 E.62344
G3 X119.204 Y102.215 I3.997 J8.946 E.02429
G1 X136.228 Y85.191 E.60774
M73 P68 R14
G3 X136.683 Y85.283 I-1.653 J9.34 E.01173
G1 X120.049 Y101.917 E.59383
G1 X120.851 Y101.663 E.02123
G1 X137.13 Y85.384 E.58118
G1 X137.578 Y85.484 E.01157
G1 X121.6 Y101.461 E.57038
G3 X122.331 Y101.279 I2.22 J7.331 E.019
G1 X138.016 Y85.593 E.55998
G1 X138.454 Y85.703 E.0114
G1 X123.025 Y101.132 E.55081
G3 X123.698 Y101.007 I1.611 J6.791 E.01728
G1 X138.886 Y85.818 E.54222
G1 X139.315 Y85.937 E.01123
G1 X124.351 Y100.902 E.53424
G3 X124.98 Y100.82 I1.145 J6.367 E.01602
G1 X139.741 Y86.059 E.52698
G1 X140.161 Y86.186 E.01108
G1 X125.596 Y100.752 E.51999
G3 X126.191 Y100.704 I.785 J6.04 E.01509
G1 X140.581 Y86.314 E.51373
G1 X140.993 Y86.45 E.01094
G1 X126.775 Y100.668 E.50759
G3 X127.347 Y100.643 I.622 J7.76 E.01446
G1 X141.405 Y86.586 E.50185
G3 X141.811 Y86.727 I-2.686 J8.363 E.01086
G1 X127.901 Y100.637 E.49659
G1 X128.442 Y100.644 E.01366
G1 X142.214 Y86.871 E.49168
G3 X142.615 Y87.018 I-2.787 J8.25 E.01078
G1 X128.98 Y100.653 E.48676
G1 X129.496 Y100.685 E.01305
G1 X143.01 Y87.17 E.48245
G1 X143.406 Y87.323 E.01069
G1 X130.012 Y100.716 E.47814
G3 X130.512 Y100.764 I-.231 J5.112 E.01269
G1 X143.794 Y87.482 E.47415
G1 X144.181 Y87.643 E.01058
G1 X131.005 Y100.818 E.47037
G3 X131.495 Y100.877 I-.349 J5.01 E.01244
G1 X144.565 Y87.806 E.46661
G1 X144.944 Y87.975 E.01048
G1 X131.966 Y100.953 E.46331
G1 X132.438 Y101.029 E.01206
G1 X145.324 Y88.143 E.46002
G3 X145.696 Y88.318 I-3.285 J7.444 E.01039
G1 X132.899 Y101.116 E.45686
G1 X133.351 Y101.211 E.01166
G1 X146.068 Y88.494 E.454
G3 X146.436 Y88.674 I-3.469 J7.584 E.01034
G1 X133.803 Y101.307 E.45101
G3 X134.238 Y101.419 I-.918 J4.483 E.01136
G1 X146.8 Y88.857 E.44845
G1 X147.164 Y89.04 E.01029
G1 X134.672 Y101.533 E.44598
G3 X135.104 Y101.649 I-.958 J4.434 E.01129
G1 X147.522 Y89.231 E.44332
G1 X147.878 Y89.422 E.01021
G1 X135.519 Y101.781 E.44121
G1 X135.935 Y101.912 E.01101
G1 X148.232 Y89.616 E.43899
G1 X148.582 Y89.814 E.01014
G1 X136.347 Y102.048 E.43676
G1 X136.746 Y102.196 E.01075
G1 X148.931 Y90.012 E.43499
G3 X149.274 Y90.216 I-4.012 J7.119 E.01008
G1 X137.146 Y102.345 E.43299
G3 X137.54 Y102.498 I-1.362 J4.085 E.01068
G1 X149.617 Y90.421 E.43114
G3 X149.957 Y90.629 I-4.059 J7.027 E.01006
G1 X137.923 Y102.663 E.42959
G1 X138.306 Y102.827 E.01053
G1 X150.292 Y90.841 E.42787
G1 X150.627 Y91.054 E.01002
G1 X138.685 Y102.996 E.42634
G1 X139.053 Y103.176 E.01034
G1 X150.957 Y91.272 E.42498
G1 X151.285 Y91.491 E.00997
G1 X139.421 Y103.355 E.42356
G3 X139.785 Y103.539 I-1.688 J3.791 E.01029
G1 X151.612 Y91.712 E.42225
G1 X151.934 Y91.938 E.00992
G1 X140.138 Y103.734 E.42111
G1 X140.491 Y103.928 E.01018
G1 X152.255 Y92.164 E.41997
G3 X152.572 Y92.394 I-4.541 J6.589 E.0099
G1 X140.841 Y104.125 E.41879
G1 X141.18 Y104.334 E.01005
G1 X152.887 Y92.628 E.41792
G1 X153.201 Y92.861 E.00988
G1 X141.519 Y104.543 E.41705
G3 X141.857 Y104.753 I-1.972 J3.553 E.01004
G1 X153.509 Y93.101 E.41597
G1 X153.816 Y93.341 E.00985
G1 X142.182 Y104.976 E.41536
G1 X142.506 Y105.198 E.00994
G1 X154.122 Y93.583 E.41466
G1 X154.422 Y93.83 E.00982
G1 X142.831 Y105.421 E.4138
G3 X143.146 Y105.654 I-3.006 J4.408 E.00989
G1 X154.723 Y94.077 E.41328
G3 X155.019 Y94.329 I-4.981 J6.152 E.00981
G1 X143.458 Y105.89 E.41274
G1 X143.762 Y106.134 E.00983
G1 X155.313 Y94.582 E.41237
G3 X155.606 Y94.837 I-5.031 J6.1 E.0098
G1 X144.066 Y106.377 E.41199
G3 X144.368 Y106.622 I-2.342 J3.2 E.00983
G1 X155.894 Y95.097 E.41144
G1 X156.181 Y95.357 E.00979
G1 X144.659 Y106.879 E.41132
G1 X144.95 Y107.136 E.00979
G1 X156.465 Y95.621 E.41109
G1 X156.746 Y95.888 E.00978
G1 X145.24 Y107.393 E.41073
G3 X145.519 Y107.662 I-2.583 J2.948 E.00978
G1 X157.026 Y96.155 E.41081
G3 X157.301 Y96.428 I-5.408 J5.729 E.00978
G1 X145.796 Y107.933 E.41073
G1 X146.073 Y108.203 E.00978
G1 X157.575 Y96.701 E.41061
G3 X157.848 Y96.976 I-5.455 J5.678 E.00978
G1 X146.341 Y108.483 E.41079
G1 X146.605 Y108.767 E.00978
G1 X158.115 Y97.257 E.41091
G1 X158.382 Y97.538 E.00978
G1 X146.868 Y109.051 E.41103
G3 X147.125 Y109.341 I-2.829 J2.763 E.0098
G1 X158.645 Y97.822 E.41125
G1 X158.905 Y98.109 E.00979
G1 X147.376 Y109.639 E.41161
G1 X147.626 Y109.936 E.00981
G1 X159.166 Y98.396 E.41197
G3 X159.42 Y98.69 I-5.888 J5.358 E.0098
G1 X147.872 Y110.238 E.41225
G1 X148.109 Y110.549 E.00986
G1 X159.674 Y98.984 E.41286
G3 X159.925 Y99.28 I-5.91 J5.282 E.00981
G1 X148.345 Y110.86 E.4134
G3 X148.581 Y111.172 I-3.047 J2.54 E.00988
G1 X160.172 Y99.58 E.41381
G1 X160.419 Y99.881 E.00982
G1 X148.804 Y111.497 E.41467
G1 X149.026 Y111.821 E.00994
G1 X160.661 Y100.186 E.41537
G1 X160.901 Y100.494 E.00985
G1 X149.249 Y112.146 E.41598
G3 X149.459 Y112.484 I-3.352 J2.313 E.01004
G1 X161.141 Y100.802 E.41706
G1 X161.374 Y101.116 E.00988
G1 X149.668 Y112.823 E.41793
G1 X149.876 Y113.162 E.01005
G1 X161.608 Y101.431 E.4188
G3 X161.838 Y101.748 I-6.349 J4.849 E.0099
G1 X150.074 Y113.512 E.41998
G1 X150.268 Y113.866 E.01018
G1 X162.064 Y102.069 E.42112
G1 X162.291 Y102.391 E.00992
G1 X150.462 Y114.219 E.42226
G3 X150.646 Y114.583 I-3.61 J2.051 E.01029
G1 X162.511 Y102.718 E.42357
G1 X162.73 Y103.046 E.00997
G1 X150.826 Y114.951 E.42499
M73 P68 R13
G1 X151.005 Y115.319 E.01034
G1 X162.948 Y103.376 E.42635
G1 X163.16 Y103.711 E.01002
G1 X151.175 Y115.697 E.42789
G1 X151.339 Y116.08 E.01053
G1 X163.373 Y104.047 E.4296
G3 X163.58 Y104.387 I-6.822 J4.399 E.01006
G1 X151.503 Y116.464 E.43115
G3 X151.657 Y116.858 I-3.936 J1.756 E.01069
G1 X163.786 Y104.729 E.43301
G3 X163.99 Y105.072 I-6.905 J4.348 E.01008
G1 X151.805 Y117.257 E.43501
G1 X151.953 Y117.657 E.01075
G1 X164.188 Y105.422 E.43678
G1 X164.386 Y105.771 E.01014
G1 X152.089 Y118.069 E.43901
G1 X152.221 Y118.484 E.01101
G1 X164.58 Y106.125 E.44123
G1 X164.771 Y106.482 E.01021
G1 X152.352 Y118.9 E.44334
G3 X152.468 Y119.332 I-4.332 J1.391 E.01129
G1 X164.961 Y106.839 E.44601
G1 X165.145 Y107.203 E.01029
G1 X152.582 Y119.766 E.44848
G3 X152.694 Y120.202 I-4.378 J1.353 E.01137
G1 X165.328 Y107.568 E.45104
G3 X165.508 Y107.936 I-7.416 J3.841 E.01034
G1 X152.79 Y120.654 E.45403
G1 X152.885 Y121.106 E.01166
G1 X165.683 Y108.308 E.45689
G3 X165.859 Y108.68 I-7.349 J3.693 E.01039
G1 X152.972 Y121.566 E.46005
G1 X153.048 Y122.038 E.01206
G1 X166.027 Y109.059 E.46334
G1 X166.195 Y109.439 E.01048
G1 X153.124 Y122.51 E.46664
G3 X153.182 Y122.999 I-4.961 J.837 E.01245
G1 X166.359 Y109.823 E.47041
G1 X166.519 Y110.21 E.01058
G1 X153.237 Y123.492 E.47418
G3 X153.284 Y123.993 I-5.069 J.729 E.0127
G1 X166.679 Y110.598 E.47818
G1 X166.831 Y110.993 E.01069
G1 X153.316 Y124.509 E.48249
G1 X153.347 Y125.025 E.01305
G1 X166.983 Y111.388 E.4868
G3 X167.13 Y111.79 I-8.109 J3.189 E.01078
G1 X153.356 Y125.564 E.49172
G1 X153.363 Y126.105 E.01366
G1 X167.274 Y112.193 E.49664
G3 X167.416 Y112.599 I-8.225 J3.091 E.01086
G1 X153.352 Y126.663 E.50206
G1 X153.331 Y127.231 E.01436
G1 X167.552 Y113.011 E.50766
G1 X167.688 Y113.422 E.01094
G1 X153.297 Y127.813 E.51373
G1 X153.246 Y128.412 E.01518
G1 X167.815 Y113.843 E.52013
G1 X167.943 Y114.263 E.01108
G1 X153.182 Y129.024 E.52697
G1 X153.095 Y129.657 E.01614
G1 X168.064 Y114.689 E.53438
G1 X168.183 Y115.118 E.01123
G1 X152.993 Y130.307 E.54227
G1 X152.868 Y130.98 E.01728
G1 X168.298 Y115.55 E.55086
G1 X168.408 Y115.988 E.0114
G1 X152.716 Y131.68 E.56021
G1 X152.545 Y132.398 E.01863
G1 X168.517 Y116.427 E.57018
G1 X168.617 Y116.874 E.01157
G1 X152.327 Y133.164 E.58157
G3 X152.08 Y133.958 I-8.188 J-2.105 E.02099
G1 X168.718 Y117.321 E.59395
G3 X168.81 Y117.777 I-9.22 J2.1 E.01173
G1 X151.793 Y134.793 E.60749
G3 X151.432 Y135.702 I-9.446 J-3.225 E.02468
G1 X168.901 Y118.233 E.62361
G3 X168.985 Y118.697 I-9.382 J1.942 E.01189
G1 X151.001 Y136.681 E.64202
G3 X150.467 Y137.762 I-11.276 J-4.895 E.03047
G1 X169.066 Y119.164 E.66398
G3 X169.141 Y119.636 I-9.613 J1.782 E.01207
G1 X149.774 Y139.003 E.69142
G3 X148.917 Y140.351 I-14.154 J-8.046 E.04032
G1 X148.771 Y140.553 E.0063
G1 X169.212 Y120.112 E.72973
G3 X169.279 Y120.594 I-9.753 J1.592 E.01226
G1 X122.594 Y167.279 E1.66664
G1 X123.081 Y167.339 E.0124
G1 X169.339 Y121.081 E1.65138
G3 X169.395 Y121.572 I-9.984 J1.399 E.01248
G1 X123.572 Y167.395 E1.63587
G1 X124.071 Y167.444 E.01265
G1 X169.444 Y122.071 E1.61982
G3 X169.49 Y122.572 I-10.219 J1.186 E.01272
G1 X124.572 Y167.49 E1.60355
G1 X125.082 Y167.528 E.01291
G1 X169.528 Y123.082 E1.58668
G3 X169.562 Y123.596 I-10.464 J.955 E.01299
G1 X125.596 Y167.562 E1.56958
G1 X126.118 Y167.588 E.01319
G1 X169.588 Y124.118 E1.55186
G3 X169.609 Y124.644 I-10.688 J.7 E.01329
G1 X126.644 Y167.609 E1.53384
G1 X127.178 Y167.622 E.0135
G1 X169.622 Y125.178 E1.51523
G3 X169.63 Y125.718 I-11.02 J.426 E.01363
G1 X127.718 Y167.63 E1.49623
G1 X128.266 Y167.63 E.01382
G1 X169.63 Y126.266 E1.47668
G3 X169.622 Y126.821 I-11.291 J.122 E.01402
G1 X128.821 Y167.622 E1.45658
G1 X129.383 Y167.608 E.01418
G1 X169.608 Y127.383 E1.43605
G3 X169.584 Y127.955 I-11.685 J-.212 E.01446
G1 X129.955 Y167.584 E1.41475
G1 X130.531 Y167.556 E.01456
G1 X169.556 Y128.531 E1.39318
G3 X169.513 Y129.121 I-11.958 J-.575 E.01495
G1 X131.121 Y167.513 E1.37056
G2 X131.716 Y167.465 I-.669 J-12.148 E.01507
G1 X169.465 Y129.716 E1.34762
G1 X169.405 Y130.324 E.01541
G1 X132.324 Y167.405 E1.3238
G2 X132.941 Y167.336 I-1.107 J-12.598 E.01568
G1 X169.336 Y130.941 E1.29928
G1 X169.259 Y131.566 E.01589
G1 X133.566 Y167.259 E1.27423
G2 X134.208 Y167.165 I-1.598 J-13.111 E.01638
G1 X169.165 Y132.208 E1.24795
G3 X169.062 Y132.858 I-13.314 J-1.768 E.01662
G1 X134.858 Y167.062 E1.22108
G1 X135.52 Y166.947 E.01698
G1 X168.947 Y133.52 E1.19332
G3 X168.814 Y134.201 I-13.929 J-2.365 E.0175
G1 X136.201 Y166.814 E1.16428
G2 X136.893 Y166.67 I-2.598 J-14.166 E.01785
G1 X168.67 Y134.893 E1.13441
G1 X168.511 Y135.599 E.01827
G1 X137.599 Y166.511 E1.10353
G2 X138.329 Y166.329 I-3.332 J-14.895 E.01899
G1 X168.329 Y136.329 E1.07097
G3 X168.129 Y137.076 I-15.302 J-3.683 E.01952
G1 X139.076 Y166.129 E1.03719
G2 X139.842 Y165.911 I-4.079 J-15.749 E.02012
G1 X167.911 Y137.842 E1.00203
G3 X167.67 Y138.631 I-16.133 J-4.495 E.02081
G1 X140.631 Y165.67 E.96529
G1 X141.449 Y165.4 E.02174
G1 X167.4 Y139.449 E.92645
G3 X167.099 Y140.297 I-17.464 J-5.718 E.02273
G1 X142.297 Y165.099 E.88541
G2 X143.179 Y164.764 I-6.392 J-18.19 E.02382
G1 X166.764 Y141.179 E.84198
G3 X166.391 Y142.101 I-18.929 J-7.14 E.0251
G1 X144.101 Y164.391 E.79575
G2 X145.068 Y163.971 I-8.086 J-19.949 E.02664
G1 X165.971 Y143.068 E.7462
G3 X165.494 Y144.092 I-21.087 J-9.186 E.02851
G1 X146.092 Y163.494 E.69264
G2 X147.185 Y162.949 I-37.679 J-76.878 E.03084
G1 X164.949 Y145.186 E.63414
G3 X164.299 Y146.383 I-24.682 J-12.62 E.0344
G1 X148.383 Y162.299 E.56818
G2 X149.702 Y161.527 I-15.06 J-27.262 E.03858
G1 X163.527 Y147.702 E.49354
G3 X162.544 Y149.233 I-39.717 J-24.428 E.04593
G1 X151.233 Y160.544 E.40379
G2 X153.141 Y159.184 I-24.804 J-36.808 E.05916
G1 X161.184 Y151.141 E.28711
G3 X157.821 Y155.051 I-32.94 J-24.926 E.13027
G1 X154.732 Y158.14 E.11028
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11621
G1 X156.146 Y156.726 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/58
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.6 I-.444 J-1.133 P1  F30000
G1 X127.486 Y167.968 Z4.6
M73 P69 R13
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X92.595 Y103.461 I.516 J-41.969 E2.41722
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.654 Y84.033 I29.755 J29.617 E.91367
G3 X127.546 Y167.969 I-.652 J41.967 E3.56765
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X92.492 Y102.847 I.517 J-42.385 E2.45392
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X128.664 Y83.617 I30.381 J29.603 E.93539
G3 X127.541 Y168.386 I-.667 J42.383 E3.60273
M204 S250
G1 X127.476 Y168.783 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.526 J-42.784 E2.30916
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.674 Y83.217 I30.961 J29.524 E.88727
G3 X127.536 Y168.784 I-.673 J42.782 E3.3743
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.42207
G1 X125.537 Y168.717 E-.33793
; WIPE_END
G1 E-.04 F1800
G1 X133.071 Y167.495 Z4.76 F30000
G1 X133.077 Y167.494 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421576
G1 F11620.701
G1 X86.662 Y121.079 E1.65705
G2 X86.605 Y121.57 I9.973 J1.399 E.01248
G1 X132.43 Y167.395 E1.63599
G1 X131.932 Y167.444 E.01265
G1 X86.556 Y122.068 E1.61994
G2 X86.51 Y122.57 I10.239 J1.189 E.01272
G1 X131.43 Y167.49 E1.60367
G1 X130.92 Y167.528 E.01291
G1 X86.472 Y123.08 E1.5868
G2 X86.438 Y123.593 I10.43 J.954 E.01299
G1 X130.407 Y167.562 E1.5697
G1 X129.885 Y167.588 E.01319
G1 X86.412 Y124.115 E1.55198
G2 X86.391 Y124.641 I10.702 J.702 E.01329
G1 X129.359 Y167.609 E1.53397
G1 X128.824 Y167.622 E.0135
G1 X86.378 Y125.176 E1.51535
G2 X86.37 Y125.716 I10.989 J.427 E.01363
G1 X128.284 Y167.63 E1.49635
G1 X127.736 Y167.63 E.01382
G1 X86.37 Y126.264 E1.4768
G2 X86.378 Y126.819 I11.313 J.123 E.01402
G1 X127.181 Y167.622 E1.45671
G1 X126.62 Y167.609 E.01418
G1 X86.391 Y127.38 E1.43618
G2 X86.416 Y127.952 I11.648 J-.209 E.01445
G1 X126.048 Y167.584 E1.41489
G1 X125.472 Y167.556 E.01456
G1 X86.444 Y128.528 E1.39331
G2 X86.487 Y129.119 I12.065 J-.581 E.01495
G1 X124.881 Y167.513 E1.3707
G3 X124.286 Y167.466 I.669 J-12.162 E.01507
G1 X86.534 Y129.714 E1.34776
G1 X86.594 Y130.321 E.01541
G1 X123.679 Y167.406 E1.32394
G3 X123.062 Y167.336 I1.105 J-12.595 E.01568
G1 X86.664 Y130.938 E1.29943
G1 X86.741 Y131.563 E.01589
G1 X122.437 Y167.259 E1.27438
G3 X121.795 Y167.165 I1.602 J-13.149 E.01638
G1 X86.835 Y132.205 E1.2481
G2 X86.938 Y132.855 I13.301 J-1.764 E.01662
G1 X121.145 Y167.062 E1.22123
G1 X120.482 Y166.948 E.01698
G1 X87.052 Y133.518 E1.19347
G2 X87.185 Y134.198 I13.945 J-2.367 E.0175
G1 X119.802 Y166.815 E1.16444
G3 X119.11 Y166.67 I2.599 J-14.177 E.01785
G1 X87.33 Y134.89 E1.13457
G1 X87.488 Y135.596 E.01827
G1 X118.404 Y166.512 E1.10369
G3 X117.674 Y166.329 I3.305 J-14.793 E.01899
G1 X87.671 Y136.326 E1.07113
G2 X87.87 Y137.073 I15.293 J-3.68 E.01952
G1 X116.927 Y166.13 E1.03736
G3 X116.161 Y165.912 I4.066 J-15.708 E.02011
G1 X88.088 Y137.839 E1.0022
G2 X88.329 Y138.627 I16.203 J-4.515 E.02081
G1 X115.373 Y165.671 E.96548
G1 X114.555 Y165.401 E.02174
G1 X88.599 Y139.445 E.92663
G2 X88.9 Y140.294 I17.426 J-5.702 E.02273
G1 X113.706 Y165.1 E.8856
G3 X112.824 Y164.766 I6.374 J-18.147 E.02381
G1 X89.234 Y141.176 E.84218
G2 X89.608 Y142.097 I18.939 J-7.143 E.02509
G1 X111.903 Y164.392 E.79596
G3 X110.935 Y163.972 I8.07 J-19.916 E.02663
G1 X90.028 Y143.065 E.74642
G2 X90.504 Y144.088 I21.067 J-9.175 E.0285
G1 X109.912 Y163.496 E.69288
G3 X108.819 Y162.951 I38.006 J-77.564 E.03082
G1 X91.049 Y145.181 E.63441
G2 X91.698 Y146.378 I24.724 J-12.641 E.03439
G1 X107.622 Y162.302 E.56848
G3 X106.303 Y161.53 I15.063 J-27.271 E.03857
G1 X92.47 Y147.697 E.49386
G2 X93.452 Y149.227 I39.559 J-24.317 E.04589
G1 X104.773 Y160.548 E.40418
G3 X102.867 Y159.19 I24.68 J-36.645 E.05909
G1 X94.81 Y151.133 E.28763
G2 X98.137 Y155.007 I32.747 J-24.753 E.129
G1 X101.28 Y158.15 E.11219
; WIPE_START
G1 X99.865 Y156.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.057 Y154.18 Z4.76 F30000
G1 X169.365 Y132.041 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F11620.701
G1 X148.767 Y111.443 E.73536
G3 X149.778 Y113.002 I-15.353 J11.066 E.04692
G1 X169.141 Y132.365 E.69129
G3 X169.066 Y132.837 I-9.631 J-1.301 E.01207
G1 X150.481 Y114.253 E.66348
G1 X151.011 Y115.33 E.03032
G1 X168.985 Y133.304 E.64166
G3 X168.9 Y133.767 I-9.458 J-1.478 E.01189
G1 X151.433 Y116.3 E.6236
M73 P70 R13
G3 X151.782 Y117.197 I-8.947 J4.002 E.02431
G1 X168.81 Y134.224 E.60788
G3 X168.718 Y134.68 I-9.318 J-1.647 E.01173
G1 X152.081 Y118.043 E.59394
G1 X152.335 Y118.844 E.02123
G1 X168.617 Y135.127 E.58129
G1 X168.517 Y135.574 E.01157
G1 X152.537 Y119.595 E.57048
G3 X152.72 Y120.325 I-7.337 J2.225 E.01902
G1 X168.408 Y136.013 E.56007
G1 X168.298 Y136.451 E.0114
G1 X152.867 Y121.02 E.5509
G3 X152.993 Y121.693 I-6.794 J1.614 E.01729
G1 X168.183 Y136.883 E.5423
G1 X168.064 Y137.312 E.01123
G1 X153.098 Y122.345 E.53431
G3 X153.179 Y122.975 I-6.367 J1.148 E.01603
G1 X167.942 Y137.738 E.52705
G1 X167.815 Y138.158 E.01108
G1 X153.248 Y123.591 E.52006
G3 X153.296 Y124.187 I-6.038 J.787 E.01509
G1 X167.687 Y138.578 E.51379
G1 X167.551 Y138.99 E.01094
G1 X153.332 Y124.77 E.50765
G3 X153.353 Y125.339 I-5.783 J.504 E.01438
G1 X167.415 Y139.402 E.50203
G3 X167.274 Y139.808 I-8.338 J-2.676 E.01086
G1 X153.36 Y125.894 E.49674
G3 X153.36 Y126.442 I-5.582 J.277 E.01384
G1 X167.13 Y140.211 E.49157
G3 X166.983 Y140.612 I-8.281 J-2.797 E.01078
G1 X153.341 Y126.97 E.48704
G1 X153.321 Y127.498 E.01334
G1 X166.831 Y141.007 E.48229
G1 X166.678 Y141.403 E.01069
G1 X153.281 Y128.005 E.4783
G1 X153.237 Y128.509 E.01278
G1 X166.519 Y141.791 E.47417
G1 X166.359 Y142.178 E.01058
G1 X153.184 Y129.004 E.47033
G1 X153.119 Y129.486 E.01228
G1 X166.195 Y142.562 E.46683
G1 X166.027 Y142.942 E.01048
G1 X153.053 Y129.968 E.46316
G3 X152.97 Y130.432 I-4.791 J-.62 E.01191
G1 X165.859 Y143.321 E.46013
G3 X165.683 Y143.693 I-7.808 J-3.455 E.01039
G1 X152.884 Y130.894 E.45693
G3 X152.794 Y131.352 I-4.701 J-.689 E.01177
G1 X165.507 Y144.065 E.45388
G3 X165.328 Y144.433 I-7.585 J-3.468 E.01034
G1 X152.689 Y131.794 E.45122
G1 X152.584 Y132.237 E.01148
G1 X165.144 Y144.797 E.44843
G1 X164.961 Y145.162 E.0103
G1 X152.47 Y132.67 E.44595
G1 X152.347 Y133.095 E.01116
G1 X164.771 Y145.519 E.44354
G1 X164.58 Y145.876 E.01022
G1 X152.224 Y133.52 E.44112
G3 X152.089 Y133.933 I-4.264 J-1.16 E.01097
G1 X164.386 Y146.229 E.439
G1 X164.188 Y146.579 E.01014
G1 X151.949 Y134.34 E.43693
G1 X151.809 Y134.748 E.01088
G1 X163.99 Y146.929 E.43487
G3 X163.785 Y147.272 I-7.086 J-3.991 E.01008
G1 X151.656 Y135.142 E.43302
G1 X151.499 Y135.534 E.01064
G1 X163.58 Y147.614 E.43128
G3 X163.372 Y147.954 I-7.013 J-4.049 E.01006
G1 X151.343 Y135.925 E.42945
G3 X151.174 Y136.303 I-3.941 J-1.537 E.01047
G1 X163.16 Y148.289 E.42792
G1 X162.948 Y148.625 E.01002
G1 X151.002 Y136.679 E.42648
G1 X150.83 Y137.054 E.01043
G1 X162.73 Y148.955 E.42485
G1 X162.511 Y149.283 E.00997
G1 X150.645 Y137.418 E.42359
G1 X150.458 Y137.778 E.01025
G1 X162.29 Y149.61 E.42239
G1 X162.064 Y149.931 E.00992
G1 X150.271 Y138.139 E.42099
G3 X150.073 Y138.489 I-3.655 J-1.838 E.01015
G1 X161.837 Y150.253 E.41998
G3 X161.607 Y150.57 I-6.593 J-4.542 E.0099
G1 X149.872 Y138.835 E.41896
G1 X149.67 Y139.181 E.01011
G1 X161.374 Y150.884 E.41783
G1 X161.141 Y151.199 E.00988
G1 X149.459 Y139.518 E.41703
G1 X149.244 Y139.849 E.00999
G1 X160.901 Y151.507 E.41617
G1 X160.661 Y151.814 E.00985
G1 X149.028 Y140.181 E.41531
G3 X148.805 Y140.506 I-3.416 J-2.101 E.00995
G1 X160.418 Y152.12 E.4146
G1 X160.172 Y152.42 E.00982
G1 X148.575 Y140.824 E.41399
G1 X148.346 Y141.142 E.0099
G1 X159.925 Y152.721 E.41338
G3 X159.673 Y153.017 I-6.163 J-4.988 E.00981
G1 X148.112 Y141.456 E.41275
G1 X147.868 Y141.76 E.00984
G1 X159.419 Y153.311 E.41239
G3 X159.165 Y153.604 I-6.12 J-5.046 E.0098
G1 X147.625 Y142.064 E.412
G3 X147.38 Y142.367 I-3.207 J-2.347 E.00983
G1 X158.905 Y153.892 E.41146
G1 X158.644 Y154.179 E.00979
G1 X147.123 Y142.657 E.41134
G1 X146.866 Y142.948 E.00979
G1 X158.381 Y154.463 E.41111
G1 X158.114 Y154.744 E.00978
G1 X146.609 Y143.238 E.41075
G3 X146.339 Y143.517 I-2.955 J-2.588 E.00978
G1 X157.847 Y155.024 E.41082
G3 X157.574 Y155.299 I-5.765 J-5.441 E.00978
G1 X146.069 Y143.794 E.41075
G1 X145.798 Y144.071 E.00978
G1 X157.3 Y155.573 E.41063
G3 X157.025 Y155.846 I-5.678 J-5.453 E.00978
G1 X145.519 Y144.339 E.4108
G1 X145.235 Y144.603 E.00978
G1 X156.745 Y156.113 E.41092
G1 X156.464 Y156.38 E.00978
G1 X144.951 Y144.867 E.41104
G3 X144.66 Y145.124 I-2.763 J-2.826 E.0098
G1 X156.18 Y156.643 E.41126
G1 X155.893 Y156.904 E.00979
G1 X144.363 Y145.374 E.41162
G1 X144.066 Y145.624 E.00981
G1 X155.606 Y157.164 E.41198
G3 X155.312 Y157.418 I-5.256 J-5.768 E.0098
G1 X143.764 Y145.871 E.41226
G1 X143.453 Y146.107 E.00987
G1 X155.018 Y157.672 E.41287
G3 X154.722 Y157.924 I-5.261 J-5.884 E.00981
G1 X143.142 Y146.344 E.41341
G3 X142.83 Y146.579 I-2.556 J-3.066 E.00988
G1 X154.421 Y158.171 E.41382
G1 X154.121 Y158.418 E.00982
G1 X142.505 Y146.802 E.41467
G1 X142.181 Y147.025 E.00994
G1 X153.815 Y158.66 E.41537
G1 X153.508 Y158.9 E.00985
G1 X141.856 Y147.248 E.41599
G3 X141.518 Y147.458 I-2.299 J-3.326 E.01004
G1 X153.2 Y159.14 E.41706
G1 X152.886 Y159.373 E.00988
G1 X141.179 Y147.666 E.41793
G1 X140.84 Y147.875 E.01005
G1 X152.571 Y159.606 E.41881
G3 X152.254 Y159.837 I-4.852 J-6.352 E.0099
G1 X140.49 Y148.072 E.41999
G1 X140.137 Y148.267 E.01018
G1 X151.933 Y160.063 E.42112
G1 X151.611 Y160.289 E.00992
G1 X139.783 Y148.461 E.42226
G3 X139.422 Y148.648 I-2.711 J-4.809 E.01026
G1 X151.284 Y160.51 E.42348
G1 X150.956 Y160.729 E.00997
G1 X139.056 Y148.829 E.42484
G1 X138.68 Y149.001 E.01043
G1 X150.626 Y160.947 E.42647
G1 X150.291 Y161.159 E.01002
G1 X138.305 Y149.173 E.42791
G3 X137.927 Y149.343 I-2.485 J-5.017 E.01046
G1 X149.955 Y161.372 E.42942
G3 X149.615 Y161.579 I-4.407 J-6.833 E.01006
G1 X137.54 Y149.503 E.43111
G3 X137.144 Y149.656 I-2.265 J-5.295 E.0107
G1 X149.273 Y161.784 E.433
G3 X148.93 Y161.989 I-4.336 J-6.884 E.01008
G1 X136.745 Y149.804 E.43501
G1 X136.346 Y149.952 E.01075
G1 X148.58 Y162.187 E.43678
G1 X148.231 Y162.385 E.01014
G1 X135.934 Y150.088 E.43901
G1 X135.518 Y150.22 E.01101
G1 X147.877 Y162.579 E.44123
G1 X147.52 Y162.77 E.01022
G1 X135.102 Y150.352 E.44334
G3 X134.67 Y150.467 I-1.393 J-4.333 E.01129
G1 X147.163 Y162.96 E.446
G1 X146.799 Y163.144 E.0103
G1 X134.237 Y150.582 E.44847
G3 X133.801 Y150.693 I-1.354 J-4.376 E.01136
G1 X146.435 Y163.327 E.45103
G3 X146.066 Y163.507 I-3.83 J-7.391 E.01034
G1 X133.349 Y150.789 E.45402
G1 X132.897 Y150.885 E.01166
G1 X145.695 Y163.682 E.45688
G3 X145.322 Y163.858 I-3.725 J-7.415 E.01039
G1 X132.436 Y150.972 E.46004
G1 X131.965 Y151.048 E.01206
G1 X144.943 Y164.026 E.46334
G1 X144.564 Y164.194 E.01048
G1 X131.493 Y151.124 E.46663
G3 X131.003 Y151.182 I-.837 J-4.948 E.01245
G1 X144.18 Y164.358 E.4704
G1 X143.792 Y164.518 E.01058
G1 X130.51 Y151.236 E.47417
G3 X130.012 Y151.286 I-.916 J-6.751 E.01265
G1 X143.404 Y164.678 E.47811
G1 X143.009 Y164.83 E.01069
G1 X129.5 Y151.321 E.48227
G1 X128.972 Y151.341 E.01334
G1 X142.614 Y164.983 E.48702
G3 X142.213 Y165.129 I-3.191 J-8.113 E.01078
G1 X128.444 Y151.36 E.49156
G3 X127.896 Y151.36 I-.272 J-5.583 E.01384
G1 X141.809 Y165.273 E.49672
G3 X141.403 Y165.415 I-3.078 J-8.186 E.01086
G1 X127.341 Y151.353 E.50201
G3 X126.772 Y151.332 I-.067 J-5.794 E.01438
G1 X140.991 Y165.551 E.50763
G1 X140.58 Y165.687 E.01094
G1 X126.189 Y151.296 E.51376
G3 X125.593 Y151.248 I.19 J-6.084 E.01509
G1 X140.16 Y165.814 E.52003
G1 X139.74 Y165.942 E.01108
G1 X124.977 Y151.18 E.52702
G3 X124.348 Y151.098 I.518 J-6.453 E.01603
G1 X139.314 Y166.064 E.53429
G1 X138.885 Y166.182 E.01123
G1 X123.695 Y150.993 E.54227
G3 X123.028 Y150.873 I1.294 J-9.118 E.01713
G1 X138.452 Y166.298 E.55068
G1 X138.015 Y166.408 E.0114
G1 X122.324 Y150.717 E.56017
G1 X121.606 Y150.546 E.01863
G1 X137.576 Y166.516 E.57014
G1 X137.128 Y166.617 E.01157
G1 X120.839 Y150.328 E.58153
G3 X120.046 Y150.082 I2.108 J-8.204 E.02098
G1 X136.681 Y166.717 E.5939
G3 X136.226 Y166.809 I-2.096 J-9.193 E.01173
G1 X119.211 Y149.794 E.60744
G3 X118.303 Y149.434 I3.207 J-9.407 E.02467
G1 X135.769 Y166.9 E.62355
G3 X135.305 Y166.984 I-1.942 J-9.374 E.01189
G1 X117.334 Y149.013 E.64158
G1 X116.257 Y148.484 E.0303
G1 X134.839 Y167.065 E.66338
G3 X134.367 Y167.141 I-1.775 J-9.564 E.01207
G1 X115.007 Y147.781 E.69116
G3 X113.45 Y146.771 I9.492 J-16.347 E.04687
G1 X133.89 Y167.212 E.72973
G3 X133.409 Y167.278 I-1.597 J-9.778 E.01226
G1 X86.722 Y120.591 E1.66675
G3 X86.788 Y120.11 I9.838 J1.115 E.01226
G1 X107.229 Y140.55 E.72973
G3 X106.219 Y138.993 I15.328 J-11.044 E.04687
G1 X86.859 Y119.633 E.69116
G3 X86.935 Y119.161 I9.671 J1.308 E.01207
G1 X105.516 Y137.743 E.66338
G1 X104.987 Y136.666 E.0303
G1 X87.016 Y118.695 E.64158
G3 X87.1 Y118.231 I9.439 J1.475 E.01189
G1 X104.565 Y135.697 E.62353
G3 X104.216 Y134.8 I8.954 J-4.002 E.0243
G1 X87.191 Y117.774 E.60782
G3 X87.283 Y117.319 I9.384 J1.66 E.01173
G1 X103.918 Y133.954 E.5939
G1 X103.664 Y133.153 E.02123
G1 X87.383 Y116.872 E.58124
G1 X87.484 Y116.424 E.01157
G1 X103.462 Y132.403 E.57044
G3 X103.276 Y131.669 I9.861 J-2.887 E.0191
G1 X87.592 Y115.985 E.55992
G1 X87.702 Y115.548 E.0114
G1 X103.131 Y130.977 E.55083
G1 X103.006 Y130.304 E.01728
G1 X87.818 Y115.115 E.54224
M73 P70 R12
G1 X87.936 Y114.686 E.01124
G1 X102.904 Y129.654 E.53436
G1 X102.818 Y129.02 E.01614
G1 X88.058 Y114.26 E.52694
G1 X88.185 Y113.84 E.01108
G1 X102.754 Y128.409 E.52011
G1 X102.703 Y127.81 E.01518
G1 X88.313 Y113.42 E.51371
G1 X88.449 Y113.009 E.01094
G1 X102.664 Y127.224 E.5075
G3 X102.647 Y126.659 I7.666 J-.523 E.01428
G1 X88.585 Y112.597 E.50201
G3 X88.727 Y112.191 I8.346 J2.679 E.01086
G1 X102.64 Y126.104 E.49672
G3 X102.64 Y125.556 I5.574 J-.276 E.01384
G1 X88.871 Y111.787 E.49156
G3 X89.017 Y111.386 I8.231 J2.779 E.01078
G1 X102.659 Y125.028 E.48702
G1 X102.679 Y124.5 E.01334
G1 X89.17 Y110.991 E.48227
G1 X89.322 Y110.596 E.01069
G1 X102.72 Y123.993 E.47829
G1 X102.763 Y123.489 E.01278
G1 X89.482 Y110.208 E.47415
G1 X89.642 Y109.82 E.01058
G1 X102.814 Y122.992 E.47024
G3 X102.876 Y122.506 I9.87 J1.011 E.01236
G1 X89.806 Y109.436 E.46661
G1 X89.974 Y109.057 E.01048
G1 X102.946 Y122.029 E.46313
G3 X103.03 Y121.566 I6.331 J.907 E.0119
G1 X90.142 Y108.678 E.46012
G3 X90.318 Y108.305 I7.856 J3.479 E.01039
G1 X103.116 Y121.104 E.45692
G3 X103.207 Y120.647 I4.708 J.692 E.01177
G1 X90.493 Y107.934 E.45387
G3 X90.673 Y107.565 I7.568 J3.461 E.01034
G1 X103.312 Y120.204 E.45121
G1 X103.417 Y119.762 E.01148
G1 X90.856 Y107.201 E.44842
G1 X91.04 Y106.837 E.0103
G1 X103.531 Y119.328 E.44594
G1 X103.654 Y118.903 E.01116
G1 X91.23 Y106.48 E.44353
G1 X91.421 Y106.123 E.01022
G1 X103.777 Y118.479 E.44111
G3 X103.911 Y118.066 I4.27 J1.163 E.01097
G1 X91.615 Y105.769 E.43899
G1 X91.813 Y105.42 E.01014
G1 X104.052 Y117.658 E.43693
G1 X104.192 Y117.251 E.01088
G1 X92.011 Y105.07 E.43486
G3 X92.218 Y104.729 I5.129 J2.884 E.01006
G1 X104.345 Y116.856 E.43293
G1 X104.501 Y116.465 E.01064
G1 X92.426 Y104.39 E.43109
G1 X92.634 Y104.05 E.01005
G1 X104.658 Y116.074 E.42925
G3 X104.827 Y115.695 I3.931 J1.533 E.01047
G1 X94.77 Y105.639 E.35902
G1 X97.513 Y107.834 E.08868
G1 X104.999 Y115.32 E.26724
G1 X105.171 Y114.944 E.01043
G1 X100.256 Y110.029 E.17547
G1 X102.999 Y112.224 E.08868
G1 X105.483 Y114.709 E.0887
; WIPE_START
G1 X104.069 Y113.295 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.863 Y105.988 Z4.76 F30000
G1 X98.859 Y96.037 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F11620.701
G1 X100.899 Y98.076 E.07282
G1 X103.642 Y100.272 E.08868
G1 X99.26 Y95.89 E.15643
G1 X99.538 Y95.62 E.00978
G1 X106.385 Y102.467 E.24443
G1 X109.127 Y104.662 E.08868
G1 X99.821 Y95.356 E.33224
G1 X100.108 Y95.095 E.00979
G1 X111.637 Y106.624 E.41157
G1 X111.935 Y106.374 E.00981
G1 X100.396 Y94.835 E.41196
G3 X100.689 Y94.581 I5.359 J5.889 E.0098
G1 X112.237 Y106.128 E.41226
G1 X112.548 Y105.892 E.00987
G1 X100.983 Y94.327 E.41287
G3 X101.279 Y94.075 I5.262 J5.885 E.00981
G1 X112.859 Y105.655 E.41341
G3 X113.171 Y105.42 I2.567 J3.081 E.00988
G1 X101.58 Y93.828 E.41382
G1 X101.88 Y93.582 E.00982
G1 X113.496 Y105.197 E.41468
G1 X113.821 Y104.974 E.00994
G1 X102.186 Y93.339 E.41537
G1 X102.493 Y93.099 E.00985
G1 X114.145 Y104.751 E.41599
G3 X114.483 Y104.542 I2.303 J3.333 E.01004
G1 X102.801 Y92.859 E.41706
G1 X103.115 Y92.626 E.00988
G1 X114.822 Y104.333 E.41794
G1 X115.161 Y104.124 E.01005
G1 X103.43 Y92.393 E.41881
G3 X103.747 Y92.163 I4.845 J6.343 E.0099
G1 X115.512 Y103.927 E.41999
G1 X115.865 Y103.732 E.01018
G1 X104.069 Y91.936 E.42113
G1 X104.39 Y91.71 E.00992
G1 X116.218 Y103.538 E.42227
G3 X116.582 Y103.354 I2.055 J3.616 E.01029
G1 X104.717 Y91.489 E.42358
G1 X105.045 Y91.27 E.00997
G1 X116.95 Y103.175 E.425
G1 X117.318 Y102.995 E.01034
G1 X105.375 Y91.052 E.42636
G1 X105.711 Y90.84 E.01002
G1 X117.696 Y102.826 E.4279
G1 X118.08 Y102.661 E.01053
G1 X106.046 Y90.628 E.42961
G3 X106.386 Y90.42 I4.401 J6.824 E.01006
G1 X118.463 Y102.497 E.43116
G3 X118.857 Y102.344 I1.759 J3.94 E.01068
G1 X106.728 Y90.215 E.43301
G3 X107.071 Y90.01 I4.306 J6.835 E.01008
G1 X119.256 Y102.195 E.43501
G1 X119.656 Y102.047 E.01075
G1 X107.421 Y89.812 E.43679
G1 X107.771 Y89.614 E.01014
M73 P71 R12
G1 X120.068 Y101.911 E.43902
G1 X120.484 Y101.78 E.01101
G1 X108.124 Y89.42 E.44124
G1 X108.481 Y89.229 E.01022
G1 X120.9 Y101.648 E.44334
G3 X121.331 Y101.532 I1.392 J4.334 E.01129
G1 X108.838 Y89.039 E.44601
G1 X109.203 Y88.856 E.0103
G1 X121.765 Y101.418 E.44848
G3 X122.201 Y101.306 I1.355 J4.382 E.01137
G1 X109.567 Y88.672 E.45104
G3 X109.935 Y88.493 I3.846 J7.426 E.01034
G1 X122.653 Y101.211 E.45403
G1 X123.105 Y101.115 E.01166
G1 X110.307 Y88.317 E.45689
G3 X110.679 Y88.141 I3.756 J7.48 E.01039
G1 X123.565 Y101.028 E.46006
G1 X124.037 Y100.952 E.01206
G1 X111.058 Y87.973 E.46335
G1 X111.438 Y87.805 E.01048
G1 X124.509 Y100.876 E.46665
G3 X124.998 Y100.818 I.837 J4.957 E.01245
G1 X111.822 Y87.641 E.47041
G1 X112.209 Y87.481 E.01058
G1 X125.491 Y100.763 E.47419
G3 X125.992 Y100.716 I.73 J5.066 E.0127
G1 X112.597 Y87.322 E.47819
G1 X112.993 Y87.169 E.01069
G1 X126.508 Y100.684 E.4825
G1 X127.024 Y100.653 E.01305
G1 X113.388 Y87.017 E.48681
G3 X113.789 Y86.87 I3.192 J8.118 E.01078
G1 X127.557 Y100.638 E.49152
G3 X128.106 Y100.64 I.25 J7.458 E.01387
G1 X114.192 Y86.726 E.49674
G3 X114.598 Y86.585 I3.072 J8.171 E.01086
G1 X128.661 Y100.647 E.50203
G3 X129.23 Y100.668 I.065 J5.806 E.01438
G1 X115.01 Y86.449 E.50765
G1 X115.422 Y86.313 E.01094
G1 X129.813 Y100.704 E.51379
G3 X130.409 Y100.752 I-.191 J6.086 E.01509
G1 X115.842 Y86.185 E.52006
G1 X116.262 Y86.058 E.01108
G1 X131.025 Y100.821 E.52705
G3 X131.655 Y100.902 I-.519 J6.451 E.01603
G1 X116.688 Y85.936 E.53431
G1 X117.117 Y85.817 E.01123
G1 X132.307 Y101.007 E.5423
G3 X132.98 Y101.133 I-.94 J6.912 E.01729
G1 X117.549 Y85.702 E.5509
G1 X117.987 Y85.592 E.0114
G1 X133.675 Y101.28 E.56007
G3 X134.405 Y101.463 I-1.493 J7.515 E.01902
G1 X118.426 Y85.483 E.57048
G1 X118.873 Y85.383 E.01157
G1 X135.156 Y101.665 E.58129
G1 X135.957 Y101.919 E.02123
G1 X119.32 Y85.282 E.59394
G3 X119.776 Y85.19 I2.102 J9.227 E.01173
G1 X136.803 Y102.218 E.60788
G3 X137.7 Y102.567 I-3.108 J9.304 E.02431
G1 X120.233 Y85.1 E.6236
G3 X120.696 Y85.015 I1.946 J9.399 E.01189
G1 X138.67 Y102.989 E.64166
G1 X139.747 Y103.519 E.03032
G1 X121.163 Y84.934 E.66348
G3 X121.635 Y84.859 I1.78 J9.598 E.01207
G1 X140.998 Y104.222 E.69129
G3 X142.557 Y105.233 I-9.499 J16.352 E.04691
G1 X122.112 Y84.788 E.7299
G3 X122.593 Y84.722 I1.592 J9.748 E.01226
G1 X169.278 Y131.407 E1.6667
G1 X169.339 Y130.919 E.0124
G1 X123.081 Y84.661 E1.65144
G3 X123.572 Y84.605 I1.396 J9.963 E.01248
G1 X169.395 Y130.428 E1.63593
G1 X169.444 Y129.93 E.01265
G1 X124.07 Y84.556 E1.61988
G3 X124.572 Y84.51 I1.186 J10.207 E.01272
G1 X169.49 Y129.428 E1.60361
G1 X169.528 Y128.918 E.01291
G1 X125.082 Y84.472 E1.58674
G3 X125.595 Y84.438 I.953 J10.436 E.01299
G1 X169.562 Y128.405 E1.56963
G1 X169.588 Y127.883 E.01319
G1 X126.117 Y84.412 E1.55191
G3 X126.643 Y84.391 I.701 J10.692 E.01329
G1 X169.609 Y127.357 E1.5339
G1 X169.622 Y126.822 E.0135
G1 X127.178 Y84.378 E1.51529
G3 X127.719 Y84.371 I.397 J9.805 E.01365
G1 X169.63 Y126.282 E1.49626
G1 X169.63 Y125.734 E.01383
G1 X128.268 Y84.372 E1.47665
G3 X128.823 Y84.38 I.166 J7.976 E.01403
G1 X169.622 Y125.179 E1.45655
G1 X169.608 Y124.618 E.01418
G1 X129.392 Y84.402 E1.43574
G1 X129.961 Y84.423 E.01438
G1 X169.584 Y124.046 E1.41455
G1 X169.556 Y123.47 E.01456
G1 X130.531 Y84.445 E1.39322
G3 X131.121 Y84.487 I-.296 J8.19 E.01494
G1 X169.513 Y122.879 E1.37061
G2 X169.465 Y122.284 I-12.138 J.668 E.01507
G1 X131.716 Y84.535 E1.34767
G1 X132.323 Y84.595 E.01541
G1 X169.405 Y121.677 E1.32385
G2 X169.336 Y121.059 I-12.605 J1.107 E.01568
G1 X132.941 Y84.664 E1.29933
G1 X133.565 Y84.741 E.01589
G1 X169.259 Y120.435 E1.27428
G2 X169.165 Y119.793 I-13.063 J1.591 E.01638
G1 X134.207 Y84.835 E1.248
G3 X134.857 Y84.938 I-1.767 J13.311 E.01662
G1 X169.062 Y119.142 E1.22112
G1 X168.947 Y118.48 E.01698
G1 X135.52 Y85.053 E1.19336
G3 X136.201 Y85.186 I-2.357 J13.883 E.0175
G1 X168.814 Y117.799 E1.16433
G2 X168.67 Y117.107 I-14.183 J2.602 E.01786
G1 X136.893 Y85.33 E1.13445
G1 X137.599 Y85.489 E.01827
G1 X168.511 Y116.401 E1.10358
G2 X168.329 Y115.671 I-14.827 J3.315 E.01899
G1 X138.329 Y85.671 E1.07101
G3 X139.076 Y85.871 I-3.674 J15.269 E.01952
G1 X168.129 Y114.924 E1.03723
G2 X167.911 Y114.158 I-15.729 J4.073 E.02012
G1 X139.842 Y86.089 E1.00207
G3 X140.631 Y86.33 I-4.519 J16.212 E.02081
G1 X167.67 Y113.369 E.96533
G1 X167.4 Y112.552 E.02174
G1 X141.448 Y86.6 E.92649
G3 X142.297 Y86.901 I-5.718 J17.465 E.02273
G1 X167.099 Y111.703 E.88544
G2 X166.765 Y110.821 I-18.186 J6.39 E.02382
G1 X143.179 Y87.236 E.84201
G3 X144.1 Y87.609 I-7.141 J18.933 E.0251
G1 X166.391 Y109.9 E.79579
G2 X165.971 Y108.932 I-19.955 J8.089 E.02664
G1 X145.068 Y88.029 E.74623
G3 X146.092 Y88.506 I-9.208 J21.134 E.02851
G1 X165.494 Y107.908 E.69267
G2 X164.949 Y106.815 I-77.128 J37.803 E.03084
G1 X147.185 Y89.051 E.63417
G3 X148.383 Y89.701 I-12.63 J24.699 E.0344
G1 X164.299 Y105.617 E.56821
G2 X163.527 Y104.298 I-27.279 J15.07 E.03859
G1 X149.702 Y90.473 E.49356
G3 X151.233 Y91.456 I-24.408 J39.684 E.04593
G1 X162.544 Y102.767 E.40381
G2 X161.184 Y100.859 I-36.77 J24.777 E.05916
G1 X153.141 Y92.816 E.28713
G3 X157.051 Y96.178 I-24.926 J32.941 E.13025
G1 X160.14 Y99.268 E.1103
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11620.701
G1 X158.726 Y97.854 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/58
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.76 I-1.112 J-.495 P1  F30000
G1 X127.486 Y167.968 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X92.595 Y103.461 I.516 J-41.969 E2.4172
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.62 Y84.032 I29.756 J29.618 E.91276
G3 X127.546 Y167.969 I-.618 J41.967 E3.56857
G1 X127.481 Y168.385 F30000
G1 F9000
G3 X92.492 Y102.847 I.517 J-42.385 E2.45391
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X128.631 Y83.617 I30.382 J29.605 E.93448
G3 X127.541 Y168.386 I-.633 J42.383 E3.60367
M204 S250
G1 X127.476 Y168.783 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.526 J-42.784 E2.30915
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.64 Y83.216 I30.96 J29.523 E.88642
G3 X127.536 Y168.783 I-.639 J42.783 E3.37517
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.42208
G1 X125.537 Y168.717 E-.33792
; WIPE_END
G1 E-.04 F1800
G1 X121.96 Y167.365 Z4.92 F30000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421566
G1 F11621
G1 X142.559 Y146.765 E.73539
G3 X141 Y147.777 I-11.063 J-15.347 E.04693
G1 X121.636 Y167.141 E.69131
G3 X121.163 Y167.066 I1.301 J-9.633 E.01207
G1 X139.749 Y148.48 E.66349
G3 X138.681 Y149.001 I-9.383 J-17.895 E.03001
G1 X120.697 Y166.985 E.64201
G3 X120.233 Y166.901 I1.484 J-9.497 E.01189
G1 X137.695 Y149.439 E.62336
G3 X136.804 Y149.782 I-5.094 J-11.906 E.02409
G1 X119.777 Y166.81 E.60788
G3 X119.321 Y166.718 I1.648 J-9.327 E.01173
G1 X135.958 Y150.08 E.59395
G1 X135.157 Y150.334 E.02123
G1 X118.874 Y166.617 E.58129
G1 X118.427 Y166.517 E.01157
G1 X134.406 Y150.537 E.57048
G3 X133.676 Y150.72 I-2.229 J-7.353 E.01902
G1 X117.988 Y166.408 E.56006
G1 X117.55 Y166.298 E.0114
G1 X132.981 Y150.867 E.5509
G3 X132.308 Y150.992 I-1.613 J-6.784 E.01729
G1 X117.118 Y166.183 E.5423
G1 X116.689 Y166.064 E.01123
G1 X131.656 Y151.097 E.53431
G3 X131.026 Y151.179 I-1.149 J-6.373 E.01603
G1 X116.263 Y165.943 E.52705
G1 X115.842 Y165.815 E.01108
G1 X130.41 Y151.248 E.52006
G3 X129.81 Y151.301 I-1.017 J-8.115 E.01522
G1 X115.422 Y165.688 E.51362
G1 X115.011 Y165.552 E.01094
G1 X129.231 Y151.331 E.50766
G1 X128.663 Y151.352 E.01436
G1 X114.599 Y165.416 E.50206
G3 X114.193 Y165.274 I2.679 J-8.347 E.01086
G1 X128.104 Y151.363 E.49664
G1 X127.564 Y151.356 E.01366
M73 P72 R12
G1 X113.79 Y165.13 E.49172
G3 X113.388 Y164.983 I2.794 J-8.274 E.01078
G1 X127.025 Y151.347 E.4868
G1 X126.509 Y151.316 E.01305
G1 X112.993 Y164.831 E.48249
G1 X112.598 Y164.679 E.01069
G1 X125.993 Y151.284 E.47818
G3 X125.492 Y151.237 I.229 J-5.12 E.0127
G1 X112.21 Y164.519 E.47418
G1 X111.822 Y164.359 E.01058
G1 X124.999 Y151.182 E.47041
G3 X124.51 Y151.124 I.346 J-5.005 E.01245
G1 X111.439 Y164.195 E.46664
G1 X111.059 Y164.027 E.01048
G1 X124.038 Y151.048 E.46334
G1 X123.566 Y150.972 E.01206
G1 X110.68 Y163.859 E.46005
G3 X110.308 Y163.683 I3.442 J-7.782 E.01039
G1 X123.103 Y150.888 E.45679
G3 X122.649 Y150.794 I1.044 J-6.185 E.0117
G1 X109.936 Y163.508 E.45387
G3 X109.567 Y163.328 I3.468 J-7.586 E.01034
G1 X122.207 Y150.689 E.45122
G1 X121.764 Y150.584 E.01148
G1 X109.203 Y163.145 E.44842
G1 X108.839 Y162.961 E.01029
G1 X121.33 Y150.47 E.44594
G1 X120.906 Y150.347 E.01116
G1 X108.482 Y162.771 E.44353
G1 X108.125 Y162.58 E.01021
G1 X120.481 Y150.224 E.44112
G3 X120.068 Y150.089 I1.162 J-4.272 E.01097
G1 X107.771 Y162.386 E.43899
G1 X107.422 Y162.188 E.01014
G1 X119.661 Y149.949 E.43693
G1 X119.253 Y149.809 E.01088
G1 X107.072 Y161.99 E.43486
G3 X106.729 Y161.786 I3.987 J-7.079 E.01008
G1 X118.858 Y149.656 E.43301
G1 X118.467 Y149.5 E.01064
G1 X106.387 Y161.58 E.43127
G3 X106.047 Y161.373 I4.062 J-7.035 E.01006
G1 X118.076 Y149.343 E.42945
G3 X117.695 Y149.177 I2.062 J-5.256 E.01051
G1 X105.711 Y161.16 E.4278
G1 X105.376 Y160.948 E.01002
G1 X117.319 Y149.005 E.42635
G1 X116.951 Y148.826 E.01034
G1 X105.046 Y160.73 E.42499
G1 X104.718 Y160.511 E.00997
G1 X116.583 Y148.646 E.42357
G3 X116.219 Y148.462 I1.686 J-3.791 E.01029
G1 X104.391 Y160.291 E.42226
G1 X104.069 Y160.064 E.00992
G1 X115.866 Y148.268 E.42112
G1 X115.512 Y148.074 E.01018
G1 X103.748 Y159.838 E.41998
G3 X103.431 Y159.608 I4.525 J-6.571 E.0099
G1 X115.162 Y147.877 E.4188
G1 X114.823 Y147.668 E.01005
G1 X103.116 Y159.375 E.41793
G1 X102.802 Y159.141 E.00988
G1 X114.484 Y147.459 E.41706
G3 X114.146 Y147.249 I1.967 J-3.549 E.01004
G1 X102.494 Y158.901 E.41598
G1 X102.186 Y158.661 E.00985
G1 X113.821 Y147.026 E.41537
G1 X113.497 Y146.804 E.00994
G1 X101.881 Y158.419 E.41467
G1 X101.58 Y158.172 E.00982
G1 X113.172 Y146.581 E.41381
G3 X112.856 Y146.349 I2.979 J-4.375 E.00989
G1 X101.28 Y157.925 E.41329
G3 X100.984 Y157.674 I4.961 J-6.132 E.00981
G1 X112.545 Y146.112 E.41274
G1 X112.241 Y145.869 E.00983
G1 X100.69 Y157.42 E.41238
G3 X100.396 Y157.166 I5.029 J-6.101 E.0098
G1 X111.937 Y145.625 E.41199
G3 X111.634 Y145.381 I3.175 J-4.242 E.00983
G1 X100.109 Y156.905 E.41143
G1 X99.822 Y156.645 E.00979
G1 X111.34 Y145.127 E.41119
G3 X111.051 Y144.868 I3.359 J-4.041 E.00979
G1 X99.538 Y156.382 E.41102
G1 X99.257 Y156.115 E.00978
G1 X110.767 Y144.605 E.41091
G1 X110.483 Y144.341 E.00978
G1 X98.976 Y155.848 E.41079
G3 X98.701 Y155.575 I5.404 J-5.729 E.00978
G1 X110.203 Y144.073 E.41061
G1 X109.933 Y143.796 E.00978
G1 X98.428 Y155.301 E.41073
G3 X98.155 Y155.026 I5.471 J-5.697 E.00978
G1 X109.662 Y143.519 E.41081
G3 X109.393 Y143.24 I2.699 J-2.881 E.00978
G1 X97.888 Y154.746 E.41073
G1 X97.621 Y154.465 E.00978
G1 X109.136 Y142.95 E.41109
G1 X108.879 Y142.659 E.00979
G1 X97.357 Y154.181 E.41132
G1 X97.097 Y153.894 E.00979
G1 X108.622 Y142.369 E.41144
G3 X108.377 Y142.066 I2.963 J-2.651 E.00983
G1 X96.837 Y153.606 E.41199
G3 X96.582 Y153.313 I5.862 J-5.338 E.0098
G1 X108.134 Y141.762 E.41237
G1 X107.89 Y141.458 E.00983
G1 X96.329 Y153.019 E.41274
G3 X96.077 Y152.723 I5.921 J-5.294 E.00981
G1 X107.654 Y141.146 E.41328
G3 X107.421 Y140.831 I4.176 J-3.32 E.00989
G1 X95.83 Y152.422 E.4138
G1 X95.583 Y152.122 E.00982
G1 X107.198 Y140.506 E.41466
G1 X106.976 Y140.182 E.00994
G1 X95.341 Y151.816 E.41536
G1 X95.101 Y151.509 E.00985
G1 X106.753 Y139.857 E.41597
G3 X106.543 Y139.519 I3.33 J-2.302 E.01004
G1 X94.861 Y151.201 E.41705
G1 X94.628 Y150.887 E.00988
G1 X106.334 Y139.18 E.41792
G1 X106.125 Y138.841 E.01005
G1 X94.394 Y150.572 E.41879
G3 X94.164 Y150.255 I6.356 J-4.856 E.0099
G1 X105.928 Y138.491 E.41997
G1 X105.734 Y138.138 E.01018
G1 X93.938 Y149.934 E.42111
G1 X93.712 Y149.612 E.00992
G1 X105.539 Y137.785 E.42225
G3 X105.355 Y137.421 I3.607 J-2.052 E.01029
G1 X93.491 Y149.285 E.42356
G1 X93.272 Y148.957 E.00997
G1 X105.176 Y137.053 E.42498
G1 X104.996 Y136.685 E.01034
G1 X93.054 Y148.627 E.42634
G1 X92.841 Y148.292 E.01002
G1 X104.827 Y136.306 E.42787
G1 X104.663 Y135.923 E.01053
G1 X92.629 Y147.957 E.42959
G3 X92.421 Y147.617 I6.825 J-4.403 E.01006
G1 X104.498 Y135.54 E.43114
G3 X104.345 Y135.146 I3.936 J-1.759 E.01068
G1 X92.216 Y147.274 E.43299
G3 X92.012 Y146.931 I6.91 J-4.353 E.01008
G1 X104.196 Y134.746 E.43499
G1 X104.048 Y134.347 E.01075
G1 X91.814 Y146.582 E.43676
G1 X91.616 Y146.232 E.01014
G1 X103.912 Y133.935 E.43899
G1 X103.781 Y133.519 E.01101
G1 X91.422 Y145.878 E.44121
G1 X91.231 Y145.521 E.01021
G1 X103.649 Y133.104 E.44332
G3 X103.533 Y132.672 I4.352 J-1.399 E.01129
G1 X91.04 Y145.164 E.44598
G1 X90.857 Y144.8 E.01029
G1 X103.419 Y132.238 E.44845
G3 X103.306 Y131.803 I5.844 J-1.741 E.01135
G1 X90.674 Y144.436 E.45099
G3 X90.494 Y144.068 I7.408 J-3.839 E.01034
G1 X103.206 Y131.356 E.45381
G3 X103.117 Y130.898 I6.18 J-1.442 E.01179
G1 X90.318 Y143.696 E.4569
G3 X90.143 Y143.324 I7.464 J-3.749 E.01039
G1 X103.031 Y130.436 E.4601
G3 X102.947 Y129.972 I4.68 J-1.081 E.01191
G1 X89.975 Y142.944 E.46312
G1 X89.806 Y142.565 E.01048
G1 X102.882 Y129.49 E.46679
G1 X102.816 Y129.008 E.01228
G1 X89.643 Y142.181 E.47029
G1 X89.482 Y141.794 E.01058
G1 X102.763 Y128.513 E.47412
G1 X102.72 Y128.009 E.01278
G1 X89.323 Y141.406 E.47826
G1 X89.17 Y141.01 E.01069
G1 X102.678 Y127.503 E.48222
G1 X102.652 Y126.981 E.01319
G1 X89.018 Y140.615 E.48675
G3 X88.871 Y140.214 I8.124 J-3.196 E.01078
G1 X102.644 Y126.442 E.49168
G1 X102.637 Y125.901 E.01366
G1 X88.727 Y139.811 E.49659
G3 X88.586 Y139.405 I8.168 J-3.073 E.01086
G1 X102.648 Y125.343 E.50201
G1 X102.668 Y124.774 E.01436
G1 X88.45 Y138.993 E.50761
G1 X88.314 Y138.581 E.01094
G1 X102.702 Y124.193 E.51367
G1 X102.754 Y123.594 E.01518
G1 X88.186 Y138.161 E.52007
G1 X88.059 Y137.741 E.01108
G1 X102.815 Y122.985 E.52678
G3 X102.902 Y122.351 I8.655 J.864 E.01618
G1 X87.937 Y137.315 E.53424
G1 X87.818 Y136.886 E.01123
G1 X103.007 Y121.698 E.54222
G3 X103.132 Y121.025 I6.898 J.935 E.01728
G1 X87.703 Y136.454 E.55081
G1 X87.593 Y136.016 E.0114
G1 X103.279 Y120.331 E.55998
G3 X103.461 Y119.601 I7.514 J1.489 E.019
G1 X87.484 Y135.578 E.57037
G1 X87.384 Y135.13 E.01157
G1 X103.662 Y118.852 E.58112
G3 X103.917 Y118.049 I11.018 J3.061 E.02127
G1 X87.283 Y134.683 E.59382
G3 X87.191 Y134.228 I9.25 J-2.109 E.01173
G1 X104.204 Y117.215 E.60736
G3 X104.564 Y116.307 I9.424 J3.212 E.02466
G1 X87.1 Y133.771 E.62346
G3 X87.016 Y133.308 I9.42 J-1.951 E.01189
G1 X104.995 Y115.329 E.64183
G3 X105.523 Y114.253 I11.974 J5.209 E.03025
G1 X86.935 Y132.841 E.66357
G3 X86.859 Y132.369 I9.571 J-1.778 E.01207
G1 X105.223 Y114.005 E.65559
G1 X104.919 Y113.761 E.00983
G1 X86.789 Y131.892 E.64726
G3 X86.722 Y131.411 I9.765 J-1.596 E.01226
G1 X104.615 Y113.518 E.63878
G1 X104.311 Y113.275 E.00984
G1 X86.662 Y130.924 E.63006
G3 X86.605 Y130.433 I9.947 J-1.397 E.01248
G1 X104.007 Y113.031 E.62123
G1 X103.703 Y112.788 E.00983
G1 X86.556 Y129.934 E.61212
G3 X86.51 Y129.432 I10.185 J-1.186 E.01272
G1 X103.398 Y112.544 E.6029
G1 X103.094 Y112.301 E.00984
G1 X86.473 Y128.922 E.59339
G3 X86.438 Y128.409 I10.442 J-.956 E.01299
G1 X102.79 Y112.057 E.58375
G1 X102.486 Y111.814 E.00984
G1 X86.413 Y127.887 E.57381
G3 X86.391 Y127.361 I10.731 J-.704 E.01329
G1 X102.182 Y111.57 E.56372
G1 X101.877 Y111.327 E.00984
G1 X86.378 Y126.827 E.55333
G3 X86.37 Y126.287 I10.981 J-.428 E.01363
G1 X101.573 Y111.084 E.54275
G1 X101.269 Y110.84 E.00983
G1 X86.37 Y125.739 E.53189
G3 X86.378 Y125.184 I11.312 J-.124 E.01402
G1 X100.965 Y110.597 E.52076
G1 X100.661 Y110.353 E.00983
G1 X86.391 Y124.623 E.50941
G3 X86.416 Y124.051 I11.695 J.21 E.01445
G1 X100.357 Y110.11 E.49769
G1 X100.052 Y109.866 E.00984
G1 X86.444 Y123.475 E.48582
G3 X86.487 Y122.884 I12.007 J.575 E.01495
G1 X99.748 Y109.623 E.47343
G1 X99.444 Y109.379 E.00983
G1 X86.534 Y122.289 E.46088
G1 X86.594 Y121.682 E.01541
G1 X99.14 Y109.136 E.44788
G1 X98.836 Y108.893 E.00984
G1 X86.663 Y121.065 E.43455
G1 X86.74 Y120.44 E.01589
G1 X98.531 Y108.649 E.42094
G1 X98.227 Y108.406 E.00984
G1 X86.835 Y119.798 E.40672
G3 X86.937 Y119.148 I13.313 J1.765 E.01661
G1 X97.923 Y108.162 E.3922
G1 X97.619 Y107.919 E.00984
G1 X87.052 Y118.486 E.37724
G3 X87.184 Y117.806 I13.925 J2.361 E.0175
G1 X97.315 Y107.675 E.36165
G1 X97.011 Y107.432 E.00983
G1 X87.329 Y117.113 E.34563
G1 X87.488 Y116.407 E.01827
G1 X96.706 Y107.188 E.32911
G1 X96.402 Y106.945 E.00984
G1 X87.67 Y115.678 E.31175
G3 X87.869 Y114.931 I15.285 J3.675 E.01951
G1 X96.098 Y106.701 E.29379
G1 X95.794 Y106.458 E.00983
G1 X88.087 Y114.165 E.27513
G3 X88.327 Y113.377 I16.125 J4.488 E.0208
G1 X95.49 Y106.215 E.25569
G1 X95.186 Y105.971 E.00983
G1 X88.598 Y112.559 E.23519
G3 X88.898 Y111.711 I17.413 J5.695 E.02272
G1 X94.881 Y105.728 E.21359
G1 X94.577 Y105.484 E.00984
G1 X89.232 Y110.829 E.19081
G3 X89.606 Y109.908 I18.915 J7.13 E.02508
G1 X94.273 Y105.241 E.16662
G1 X93.969 Y104.997 E.00984
G1 X90.025 Y108.941 E.14078
G3 X90.501 Y107.917 I21.118 J9.195 E.02849
G1 X93.665 Y104.754 E.11294
M73 P72 R11
G1 X93.36 Y104.51 E.00984
G1 X91.045 Y106.826 E.08265
G3 X91.695 Y105.629 I24.742 J12.646 E.03437
G1 X93.056 Y104.267 E.04861
G1 X92.752 Y104.024 E.00984
G1 X91.964 Y104.811 E.02812
; WIPE_START
G1 X92.752 Y104.024 E-.42325
G1 X93.056 Y104.267 E-.14805
G1 X92.705 Y104.618 E-.1887
; WIPE_END
G1 E-.04 F1800
G1 X97.714 Y98.86 Z4.92 F30000
G1 X103.689 Y91.991 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F11621
G1 X99.069 Y96.612 E.16495
G1 X99.373 Y96.855 E.00983
G1 X104.782 Y91.446 E.19311
G3 X106.311 Y90.465 I25.605 J38.224 E.04584
G1 X99.677 Y97.099 E.23681
G1 X99.981 Y97.342 E.00984
G1 X107.629 Y89.694 E.27301
G3 X108.826 Y89.045 I13.809 J24.03 E.03437
G1 X100.285 Y97.585 E.30488
G1 X100.59 Y97.829 E.00984
G1 X109.917 Y88.501 E.333
G3 X110.941 Y88.025 I10.173 J20.543 E.02849
G1 X100.894 Y98.072 E.35867
G1 X101.198 Y98.316 E.00984
M73 P73 R11
G1 X111.908 Y87.606 E.38235
G3 X112.829 Y87.232 I8.045 J18.527 E.02509
G1 X101.502 Y98.559 E.40437
G1 X101.806 Y98.803 E.00984
G1 X113.711 Y86.898 E.42498
G3 X114.559 Y86.598 I6.533 J17.082 E.02272
G1 X102.111 Y99.046 E.44441
G1 X102.415 Y99.29 E.00983
G1 X115.377 Y86.327 E.46275
G3 X116.165 Y86.087 I5.268 J15.858 E.0208
G1 X102.719 Y99.533 E.48002
G1 X103.023 Y99.776 E.00983
G1 X116.931 Y85.869 E.4965
G3 X117.678 Y85.67 I4.419 J15.075 E.01951
G1 X103.327 Y100.02 E.5123
G1 X103.631 Y100.263 E.00983
G1 X118.407 Y85.488 E.52749
G1 X119.113 Y85.329 E.01827
G1 X103.936 Y100.507 E.54184
G1 X104.24 Y100.75 E.00983
G1 X119.806 Y85.185 E.55569
G3 X120.486 Y85.052 I3.038 J13.773 E.0175
G1 X104.544 Y100.994 E.56912
G1 X104.848 Y101.237 E.00983
G1 X121.148 Y84.937 E.58191
G3 X121.798 Y84.835 I2.414 J13.212 E.01661
G1 X105.152 Y101.481 E.59426
G1 X105.457 Y101.724 E.00984
G1 X122.44 Y84.74 E.60631
G1 X123.065 Y84.663 E.01589
G1 X105.761 Y101.967 E.61775
G1 X106.065 Y102.211 E.00984
G1 X123.682 Y84.594 E.62892
G1 X124.289 Y84.534 E.01541
G1 X106.369 Y102.454 E.63975
G1 X106.673 Y102.698 E.00984
G1 X124.884 Y84.487 E.65012
G3 X125.475 Y84.444 I1.168 J11.989 E.01495
G1 X106.977 Y102.941 E.66035
G1 X107.282 Y103.185 E.00984
G1 X126.051 Y84.416 E.67005
G3 X126.623 Y84.391 I.78 J11.631 E.01445
G1 X107.586 Y103.428 E.67961
G1 X107.89 Y103.672 E.00983
G1 X127.184 Y84.378 E.68879
G3 X127.739 Y84.371 I.406 J10.318 E.014
G1 X108.194 Y103.915 E.69773
G1 X108.498 Y104.158 E.00983
G1 X128.285 Y84.372 E.70637
G3 X128.824 Y84.381 I.147 J7.667 E.01361
G1 X108.802 Y104.402 E.71476
G1 X109.107 Y104.645 E.00984
G1 X129.352 Y84.4 E.72274
G1 X129.88 Y84.42 E.01333
G1 X109.411 Y104.889 E.73073
G1 X109.715 Y105.132 E.00983
G1 X130.407 Y84.44 E.73871
G3 X130.922 Y84.473 I-.193 J7.118 E.01303
G1 X110.019 Y105.376 E.74623
G1 X110.323 Y105.619 E.00983
G1 X131.432 Y84.51 E.75358
G3 X131.934 Y84.556 I-.689 J10.282 E.01272
G1 X110.628 Y105.863 E.76063
G1 X110.932 Y106.106 E.00984
G1 X132.433 Y84.605 E.76757
G3 X132.924 Y84.662 I-.91 J10.033 E.01248
G1 X111.236 Y106.35 E.77424
G1 X111.54 Y106.593 E.00984
G1 X133.411 Y84.722 E.78078
G3 X133.892 Y84.789 I-1.114 J9.822 E.01226
G1 X113.457 Y105.223 E.72951
G3 X115.013 Y104.215 I11.041 J15.333 E.04682
G1 X134.369 Y84.859 E.69099
G3 X134.841 Y84.935 I-1.309 J9.665 E.01207
G1 X116.263 Y103.513 E.66324
G1 X117.339 Y102.985 E.03028
G1 X135.308 Y85.016 E.64147
G3 X135.771 Y85.1 I-1.48 J9.457 E.01189
G1 X118.308 Y102.564 E.62344
G3 X119.204 Y102.215 I3.997 J8.948 E.02429
G1 X136.228 Y85.191 E.60774
G3 X136.683 Y85.283 I-1.65 J9.324 E.01173
G1 X120.049 Y101.917 E.59383
G1 X120.851 Y101.663 E.02123
G1 X137.13 Y85.384 E.58117
G1 X137.578 Y85.484 E.01157
G1 X121.6 Y101.461 E.57038
G3 X122.331 Y101.279 I2.221 J7.335 E.019
G1 X138.016 Y85.593 E.55998
G1 X138.454 Y85.703 E.0114
G1 X123.025 Y101.132 E.55081
G3 X123.698 Y101.007 I1.611 J6.791 E.01728
G1 X138.886 Y85.818 E.54222
G1 X139.315 Y85.937 E.01123
G1 X124.351 Y100.902 E.53424
G3 X124.98 Y100.82 I1.145 J6.367 E.01602
G1 X139.741 Y86.059 E.52698
G1 X140.161 Y86.186 E.01108
G1 X125.596 Y100.752 E.51999
G3 X126.191 Y100.704 I.785 J6.04 E.01509
G1 X140.581 Y86.314 E.51373
G1 X140.993 Y86.45 E.01094
G1 X126.775 Y100.668 E.50759
G3 X127.347 Y100.643 I.622 J7.76 E.01446
G1 X141.405 Y86.586 E.50185
G3 X141.811 Y86.727 I-2.682 J8.35 E.01086
G1 X127.901 Y100.637 E.49659
G1 X128.442 Y100.644 E.01366
G1 X142.214 Y86.871 E.49168
G3 X142.615 Y87.018 I-2.791 J8.258 E.01078
G1 X128.98 Y100.653 E.48676
G1 X129.496 Y100.685 E.01305
G1 X143.01 Y87.17 E.48245
G1 X143.406 Y87.323 E.01069
G1 X130.012 Y100.716 E.47814
G3 X130.512 Y100.764 I-.231 J5.112 E.01269
G1 X143.794 Y87.482 E.47415
G1 X144.181 Y87.643 E.01058
G1 X131.005 Y100.818 E.47037
G3 X131.495 Y100.877 I-.349 J5.01 E.01244
G1 X144.565 Y87.806 E.46661
G1 X144.944 Y87.975 E.01048
G1 X131.966 Y100.953 E.46331
G1 X132.438 Y101.029 E.01206
G1 X145.324 Y88.143 E.46002
G3 X145.696 Y88.318 I-3.231 J7.329 E.01039
G1 X132.899 Y101.116 E.45686
G1 X133.351 Y101.211 E.01166
G1 X146.068 Y88.494 E.454
G3 X146.436 Y88.674 I-3.466 J7.579 E.01034
G1 X133.803 Y101.307 E.45101
G3 X134.238 Y101.419 I-.921 J4.496 E.01136
G1 X146.8 Y88.857 E.44845
G1 X147.164 Y89.04 E.01029
G1 X134.672 Y101.533 E.44599
G3 X135.104 Y101.649 I-.964 J4.454 E.01129
G1 X147.522 Y89.231 E.44332
G1 X147.878 Y89.422 E.01021
G1 X135.519 Y101.781 E.44121
G1 X135.935 Y101.912 E.01101
G1 X148.232 Y89.616 E.43899
G1 X148.582 Y89.814 E.01014
G1 X136.347 Y102.048 E.43677
G1 X136.745 Y102.198 E.01074
G1 X148.931 Y90.012 E.43504
G3 X149.274 Y90.216 I-3.987 J7.075 E.01008
G1 X137.143 Y102.347 E.43307
G3 X137.541 Y102.497 I-1.397 J4.301 E.01073
G1 X149.617 Y90.421 E.4311
G3 X149.957 Y90.629 I-4.065 J7.035 E.01006
G1 X137.924 Y102.662 E.42956
G1 X138.307 Y102.827 E.01052
G1 X150.292 Y90.841 E.42787
G1 X150.627 Y91.054 E.01002
G1 X138.685 Y102.996 E.42634
G1 X139.053 Y103.176 E.01034
G1 X150.957 Y91.272 E.42498
G1 X151.285 Y91.491 E.00997
G1 X139.421 Y103.355 E.42356
G3 X139.785 Y103.539 I-1.688 J3.791 E.01029
G1 X151.612 Y91.712 E.42225
G1 X151.934 Y91.938 E.00992
G1 X140.138 Y103.734 E.42111
G1 X140.491 Y103.928 E.01018
G1 X152.255 Y92.164 E.41997
G3 X152.572 Y92.394 I-4.543 J6.591 E.0099
G1 X140.841 Y104.125 E.41879
G1 X141.18 Y104.334 E.01005
G1 X152.887 Y92.628 E.41792
G1 X153.201 Y92.861 E.00988
G1 X141.519 Y104.543 E.41705
G3 X141.857 Y104.753 I-1.972 J3.553 E.01004
G1 X153.509 Y93.101 E.41597
G1 X153.816 Y93.341 E.00985
G1 X142.182 Y104.976 E.41536
G1 X142.506 Y105.198 E.00994
G1 X154.122 Y93.583 E.41466
G1 X154.422 Y93.83 E.00982
G1 X142.831 Y105.421 E.4138
G3 X143.146 Y105.654 I-3.002 J4.403 E.00989
G1 X154.723 Y94.077 E.41328
G3 X155.019 Y94.329 I-4.977 J6.147 E.00981
G1 X143.458 Y105.89 E.41274
G1 X143.762 Y106.134 E.00983
G1 X155.313 Y94.582 E.41237
G3 X155.606 Y94.837 I-5.003 J6.068 E.0098
G1 X144.066 Y106.377 E.41199
G3 X144.368 Y106.622 I-2.343 J3.201 E.00983
G1 X155.894 Y95.097 E.41144
G1 X156.181 Y95.357 E.00979
G1 X144.659 Y106.879 E.41132
G1 X144.95 Y107.136 E.00979
G1 X156.465 Y95.621 E.41109
G1 X156.746 Y95.888 E.00978
G1 X145.24 Y107.393 E.41073
G3 X145.519 Y107.662 I-2.583 J2.948 E.00978
G1 X157.026 Y96.155 E.41081
G3 X157.301 Y96.428 I-5.414 J5.736 E.00978
G1 X145.796 Y107.933 E.41073
G1 X146.073 Y108.203 E.00978
G1 X157.575 Y96.701 E.41061
G3 X157.848 Y96.976 I-5.445 J5.668 E.00978
G1 X146.341 Y108.483 E.41079
G1 X146.605 Y108.767 E.00978
G1 X158.115 Y97.257 E.41091
G1 X158.382 Y97.538 E.00978
G1 X146.868 Y109.051 E.41103
G3 X147.125 Y109.341 I-2.829 J2.764 E.0098
G1 X158.645 Y97.822 E.41125
G1 X158.905 Y98.109 E.00979
G1 X147.376 Y109.639 E.41161
G1 X147.626 Y109.936 E.00981
G1 X159.166 Y98.396 E.41197
G3 X159.42 Y98.69 I-5.823 J5.301 E.0098
G1 X147.872 Y110.238 E.41225
G1 X148.109 Y110.549 E.00986
G1 X159.674 Y98.984 E.41286
G3 X159.925 Y99.28 I-5.896 J5.271 E.00981
G1 X148.345 Y110.86 E.4134
G3 X148.581 Y111.172 I-3.055 J2.546 E.00988
G1 X160.172 Y99.58 E.41381
G1 X160.419 Y99.881 E.00982
G1 X148.804 Y111.497 E.41467
G1 X149.026 Y111.821 E.00994
G1 X160.661 Y100.186 E.41537
G1 X160.902 Y100.494 E.00985
G1 X149.249 Y112.146 E.41598
G3 X149.459 Y112.484 I-3.326 J2.297 E.01004
G1 X161.141 Y100.802 E.41706
G1 X161.375 Y101.116 E.00988
G1 X149.668 Y112.823 E.41793
G1 X149.877 Y113.162 E.01005
G1 X161.608 Y101.431 E.4188
G3 X161.838 Y101.748 I-6.326 J4.832 E.0099
G1 X150.074 Y113.512 E.41998
G1 X150.268 Y113.866 E.01018
G1 X162.064 Y102.069 E.42112
G1 X162.291 Y102.391 E.00992
G1 X150.462 Y114.219 E.42226
G3 X150.646 Y114.583 I-3.61 J2.051 E.01029
G1 X162.511 Y102.718 E.42357
G1 X162.73 Y103.046 E.00997
G1 X150.826 Y114.951 E.42499
G1 X151.005 Y115.319 E.01034
G1 X162.948 Y103.376 E.42635
G1 X163.16 Y103.711 E.01002
G1 X151.175 Y115.697 E.42789
G1 X151.339 Y116.08 E.01053
G1 X163.373 Y104.047 E.4296
G3 X163.58 Y104.387 I-6.849 J4.415 E.01006
G1 X151.503 Y116.464 E.43115
G3 X151.657 Y116.858 I-3.934 J1.756 E.01068
G1 X163.786 Y104.729 E.43301
G3 X163.99 Y105.072 I-6.879 J4.332 E.01008
G1 X151.805 Y117.257 E.43501
G1 X151.953 Y117.657 E.01075
G1 X164.188 Y105.422 E.43678
G1 X164.386 Y105.771 E.01014
G1 X152.089 Y118.069 E.43901
G1 X152.221 Y118.484 E.01101
G1 X164.58 Y106.125 E.44123
G1 X164.771 Y106.482 E.01021
G1 X152.352 Y118.9 E.44334
G3 X152.468 Y119.332 I-4.326 J1.39 E.01129
G1 X164.961 Y106.839 E.44601
G1 X165.145 Y107.203 E.01029
G1 X152.582 Y119.766 E.44848
G3 X152.694 Y120.202 I-4.378 J1.353 E.01137
G1 X165.328 Y107.568 E.45104
G3 X165.508 Y107.936 I-7.434 J3.849 E.01034
G1 X152.79 Y120.654 E.45403
G1 X152.885 Y121.106 E.01166
G1 X165.683 Y108.308 E.45689
G3 X165.859 Y108.68 I-7.412 J3.723 E.01039
G1 X152.972 Y121.566 E.46005
G1 X153.048 Y122.038 E.01206
G1 X166.027 Y109.059 E.46334
G1 X166.195 Y109.439 E.01048
G1 X153.124 Y122.51 E.46664
G3 X153.182 Y122.999 I-4.958 J.837 E.01245
G1 X166.359 Y109.823 E.47041
G1 X166.519 Y110.21 E.01058
G1 X153.237 Y123.492 E.47418
G3 X153.284 Y123.993 I-5.073 J.73 E.0127
G1 X166.679 Y110.598 E.47818
G1 X166.831 Y110.993 E.01069
G1 X153.316 Y124.509 E.48249
G1 X153.347 Y125.025 E.01305
G1 X166.983 Y111.388 E.4868
G3 X167.13 Y111.79 I-8.106 J3.188 E.01078
G1 X153.356 Y125.564 E.49172
G1 X153.363 Y126.105 E.01366
G1 X167.274 Y112.193 E.49664
G3 X167.416 Y112.599 I-8.191 J3.079 E.01086
G1 X153.352 Y126.663 E.50206
G1 X153.331 Y127.231 E.01436
G1 X167.552 Y113.011 E.50766
G1 X167.688 Y113.422 E.01094
G1 X153.297 Y127.813 E.51374
G1 X153.246 Y128.412 E.01518
G1 X167.815 Y113.843 E.52013
G1 X167.943 Y114.263 E.01108
G1 X153.182 Y129.024 E.52697
G1 X153.095 Y129.657 E.01614
G1 X168.064 Y114.689 E.53438
G1 X168.183 Y115.118 E.01123
G1 X152.993 Y130.307 E.54227
G1 X152.868 Y130.98 E.01728
G1 X168.298 Y115.55 E.55086
G1 X168.408 Y115.988 E.0114
G1 X152.716 Y131.68 E.56021
G1 X152.545 Y132.398 E.01863
G1 X168.517 Y116.427 E.57018
G1 X168.617 Y116.874 E.01157
G1 X152.327 Y133.165 E.58157
G3 X152.08 Y133.958 I-8.199 J-2.108 E.02099
G1 X168.718 Y117.321 E.59395
G3 X168.81 Y117.777 I-9.246 J2.106 E.01173
G1 X151.793 Y134.793 E.60749
G3 X151.432 Y135.702 I-9.456 J-3.229 E.02468
G1 X168.901 Y118.233 E.62361
G3 X168.985 Y118.697 I-9.382 J1.942 E.01189
G1 X151.001 Y136.681 E.64202
G3 X150.467 Y137.762 I-11.276 J-4.895 E.03047
G1 X169.066 Y119.164 E.66398
G3 X169.141 Y119.636 I-9.613 J1.782 E.01207
G1 X149.774 Y139.003 E.69142
G3 X148.917 Y140.351 I-14.155 J-8.046 E.04032
G1 X148.771 Y140.553 E.0063
G1 X169.212 Y120.112 E.72973
G3 X169.279 Y120.594 I-9.753 J1.592 E.01226
G1 X122.594 Y167.279 E1.66664
G1 X123.081 Y167.339 E.0124
G1 X169.339 Y121.081 E1.65138
G3 X169.395 Y121.572 I-9.984 J1.399 E.01248
G1 X123.572 Y167.395 E1.63587
G1 X124.071 Y167.444 E.01265
G1 X169.444 Y122.071 E1.61982
G3 X169.49 Y122.572 I-10.206 J1.185 E.01272
G1 X124.572 Y167.49 E1.60355
G1 X125.082 Y167.528 E.01291
G1 X169.528 Y123.082 E1.58668
G3 X169.562 Y123.596 I-10.473 J.955 E.01299
G1 X125.596 Y167.562 E1.56958
G1 X126.118 Y167.588 E.01319
G1 X169.588 Y124.118 E1.55186
G3 X169.609 Y124.644 I-10.686 J.7 E.01329
G1 X126.644 Y167.609 E1.53384
G1 X127.178 Y167.622 E.0135
G1 X169.622 Y125.178 E1.51523
G3 X169.63 Y125.718 I-11.02 J.426 E.01363
G1 X127.718 Y167.63 E1.49623
G1 X128.266 Y167.63 E.01382
G1 X169.63 Y126.266 E1.47668
G3 X169.622 Y126.821 I-11.291 J.122 E.01402
G1 X128.821 Y167.622 E1.45658
G1 X129.383 Y167.608 E.01418
G1 X169.608 Y127.383 E1.43605
G3 X169.584 Y127.955 I-11.683 J-.212 E.01446
G1 X129.955 Y167.584 E1.41475
G1 X130.531 Y167.556 E.01456
G1 X169.556 Y128.531 E1.39318
G3 X169.513 Y129.121 I-11.993 J-.577 E.01495
G1 X131.121 Y167.513 E1.37056
G2 X131.716 Y167.465 I-.669 J-12.142 E.01507
G1 X169.465 Y129.716 E1.34762
G1 X169.405 Y130.324 E.01541
G1 X132.324 Y167.405 E1.3238
G2 X132.941 Y167.336 I-1.107 J-12.602 E.01568
G1 X169.336 Y130.941 E1.29928
G1 X169.259 Y131.566 E.01589
G1 X133.566 Y167.259 E1.27423
G2 X134.208 Y167.165 I-1.598 J-13.111 E.01638
G1 X169.165 Y132.208 E1.24795
G3 X169.062 Y132.858 I-13.314 J-1.768 E.01662
G1 X134.858 Y167.062 E1.22108
G1 X135.52 Y166.947 E.01698
G1 X168.947 Y133.52 E1.19332
G3 X168.814 Y134.201 I-13.929 J-2.365 E.0175
G1 X136.201 Y166.814 E1.16428
G2 X136.893 Y166.67 I-2.6 J-14.175 E.01785
G1 X168.67 Y134.893 E1.13441
G1 X168.511 Y135.599 E.01827
G1 X137.599 Y166.511 E1.10353
G2 X138.329 Y166.329 I-3.356 J-14.99 E.01899
G1 X168.329 Y136.329 E1.07097
G3 X168.129 Y137.076 I-15.261 J-3.672 E.01952
G1 X139.076 Y166.129 E1.03719
G2 X139.842 Y165.911 I-4.078 J-15.745 E.02012
G1 X167.911 Y137.842 E1.00203
G3 X167.67 Y138.631 I-16.218 J-4.521 E.02081
G1 X140.631 Y165.67 E.96529
G1 X141.449 Y165.4 E.02174
G1 X167.4 Y139.449 E.92645
G3 X167.099 Y140.297 I-17.464 J-5.718 E.02273
G1 X142.297 Y165.099 E.88541
G2 X143.179 Y164.764 I-6.385 J-18.17 E.02381
M73 P74 R11
G1 X166.764 Y141.179 E.84198
G3 X166.391 Y142.101 I-18.929 J-7.14 E.0251
G1 X144.101 Y164.391 E.79575
G2 X145.068 Y163.971 I-8.082 J-19.939 E.02664
G1 X165.971 Y143.068 E.7462
G3 X165.494 Y144.092 I-21.093 J-9.189 E.02851
G1 X146.092 Y163.494 E.69264
G2 X147.185 Y162.949 I-37.658 J-76.833 E.03084
G1 X164.949 Y145.185 E.63414
G3 X164.299 Y146.383 I-24.666 J-12.612 E.0344
G1 X148.383 Y162.299 E.56819
G2 X149.702 Y161.527 I-15.052 J-27.248 E.03859
G1 X163.527 Y147.702 E.49354
G3 X162.544 Y149.233 I-39.722 J-24.431 E.04593
G1 X151.233 Y160.544 E.40378
G2 X153.141 Y159.184 I-24.757 J-36.742 E.05916
G1 X161.184 Y151.141 E.28711
G3 X157.821 Y155.051 I-32.942 J-24.927 E.13027
G1 X154.732 Y158.14 E.11027
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11621
G1 X156.146 Y156.726 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/58
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.92 I-.444 J-1.133 P1  F30000
G1 X127.486 Y167.966 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X92.595 Y103.461 I.516 J-41.968 E2.41714
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.598 Y84.032 I29.757 J29.619 E.91215
G3 X127.546 Y167.967 I-.596 J41.967 E3.5691
G1 X127.481 Y168.384 F30000
G1 F9000
G3 X92.492 Y102.847 I.517 J-42.385 E2.45387
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X128.603 Y83.616 I30.383 J29.607 E.93374
G3 X127.541 Y168.385 I-.605 J42.383 E3.60436
M204 S250
G1 X127.476 Y168.784 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.527 J-42.785 E2.30918
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.609 Y83.215 I30.96 J29.52 E.88564
G3 X127.536 Y168.785 I-.607 J42.784 E3.37606
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.42208
G1 X125.537 Y168.717 E-.33792
; WIPE_END
G1 E-.04 F1800
G1 X133.071 Y167.495 Z5.08 F30000
G1 X133.077 Y167.494 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421576
G1 F11620.701
G1 X86.662 Y121.079 E1.65705
G2 X86.605 Y121.57 I9.977 J1.399 E.01248
G1 X132.43 Y167.395 E1.63599
G1 X131.932 Y167.444 E.01265
G1 X86.556 Y122.068 E1.61994
G2 X86.51 Y122.57 I10.192 J1.185 E.01272
G1 X131.43 Y167.49 E1.60367
G1 X130.92 Y167.528 E.01291
G1 X86.472 Y123.08 E1.5868
G2 X86.438 Y123.593 I10.431 J.954 E.01299
G1 X130.407 Y167.562 E1.5697
G1 X129.885 Y167.588 E.01319
G1 X86.412 Y124.115 E1.55198
G2 X86.391 Y124.641 I10.702 J.702 E.01329
G1 X129.359 Y167.609 E1.53397
G1 X128.824 Y167.622 E.0135
G1 X86.378 Y125.176 E1.51536
G2 X86.37 Y125.716 I10.99 J.427 E.01363
G1 X128.284 Y167.63 E1.49636
G1 X127.736 Y167.63 E.01382
G1 X86.37 Y126.263 E1.47681
G2 X86.378 Y126.819 I11.312 J.123 E.01402
G1 X127.181 Y167.622 E1.45671
G1 X126.62 Y167.609 E.01418
G1 X86.391 Y127.38 E1.43618
G2 X86.416 Y127.952 I11.687 J-.211 E.01445
G1 X126.048 Y167.584 E1.41489
G1 X125.472 Y167.556 E.01456
G1 X86.444 Y128.528 E1.39332
G2 X86.487 Y129.119 I12.174 J-.589 E.01495
G1 X124.881 Y167.513 E1.3707
G3 X124.286 Y167.466 I.669 J-12.158 E.01507
G1 X86.534 Y129.714 E1.34776
G1 X86.594 Y130.321 E.01541
G1 X123.679 Y167.406 E1.32394
G3 X123.062 Y167.336 I1.105 J-12.59 E.01568
G1 X86.664 Y130.938 E1.29943
G1 X86.741 Y131.563 E.01589
G1 X122.437 Y167.259 E1.27438
G3 X121.795 Y167.165 I1.596 J-13.108 E.01638
G1 X86.835 Y132.205 E1.2481
G2 X86.938 Y132.855 I13.34 J-1.77 E.01662
G1 X121.145 Y167.062 E1.22123
G1 X120.482 Y166.948 E.01698
G1 X87.052 Y133.518 E1.19347
G2 X87.185 Y134.198 I13.857 J-2.35 E.0175
G1 X119.802 Y166.815 E1.16444
G3 X119.11 Y166.67 I2.598 J-14.168 E.01785
G1 X87.33 Y134.89 E1.13457
G1 X87.488 Y135.596 E.01827
G1 X118.404 Y166.512 E1.10369
G3 X117.674 Y166.329 I3.336 J-14.918 E.01899
G1 X87.671 Y136.326 E1.07113
G2 X87.87 Y137.073 I15.299 J-3.681 E.01952
G1 X116.927 Y166.13 E1.03736
G3 X116.161 Y165.912 I4.074 J-15.737 E.02011
G1 X88.088 Y137.839 E1.0022
G2 X88.329 Y138.627 I16.136 J-4.494 E.02081
G1 X115.373 Y165.671 E.96548
G1 X114.555 Y165.401 E.02174
G1 X88.599 Y139.445 E.92664
G2 X88.9 Y140.294 I17.43 J-5.704 E.02273
G1 X113.706 Y165.1 E.8856
G3 X112.824 Y164.766 I6.381 J-18.167 E.02381
G1 X89.234 Y141.176 E.84218
G2 X89.608 Y142.097 I18.91 J-7.131 E.02509
G1 X111.903 Y164.392 E.79596
G3 X110.935 Y163.972 I8.055 J-19.882 E.02663
G1 X90.028 Y143.064 E.74642
G2 X90.504 Y144.088 I21.066 J-9.174 E.0285
G1 X109.912 Y163.496 E.69288
G3 X108.819 Y162.951 I38.203 J-77.959 E.03082
G1 X91.049 Y145.181 E.63442
M73 P75 R11
G2 X91.698 Y146.378 I24.733 J-12.646 E.03439
G1 X107.622 Y162.302 E.56848
G3 X106.303 Y161.53 I15.081 J-27.302 E.03857
G1 X92.47 Y147.697 E.49386
G2 X93.452 Y149.227 I39.541 J-24.306 E.04589
G1 X104.773 Y160.548 E.40418
G3 X102.867 Y159.19 I24.734 J-36.722 E.05909
G1 X94.81 Y151.133 E.28763
G2 X98.137 Y155.007 I32.743 J-24.749 E.12899
G1 X101.28 Y158.15 E.1122
; WIPE_START
G1 X99.865 Y156.736 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.057 Y154.18 Z5.08 F30000
G1 X169.365 Y132.041 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F11620.701
G1 X148.767 Y111.443 E.73536
G3 X149.778 Y113.001 I-15.358 J11.068 E.04691
G1 X169.141 Y132.365 E.69129
G3 X169.066 Y132.837 I-9.652 J-1.304 E.01207
G1 X150.481 Y114.252 E.66348
G1 X151.011 Y115.33 E.03032
G1 X168.985 Y133.304 E.64166
G3 X168.9 Y133.767 I-9.465 J-1.479 E.01189
G1 X151.433 Y116.3 E.6236
G3 X151.782 Y117.197 I-8.952 J4.004 E.02431
G1 X168.81 Y134.224 E.60788
G3 X168.718 Y134.68 I-9.324 J-1.648 E.01173
G1 X152.081 Y118.043 E.59395
G1 X152.335 Y118.844 E.02123
G1 X168.617 Y135.127 E.58129
G1 X168.517 Y135.574 E.01157
G1 X152.537 Y119.595 E.57048
G3 X152.72 Y120.325 I-7.355 J2.229 E.01902
G1 X168.408 Y136.013 E.56007
M73 P75 R10
G1 X168.298 Y136.451 E.0114
G1 X152.867 Y121.02 E.5509
G3 X152.993 Y121.693 I-6.796 J1.615 E.01729
G1 X168.183 Y136.883 E.5423
G1 X168.064 Y137.312 E.01123
G1 X153.098 Y122.345 E.53431
G3 X153.179 Y122.975 I-6.366 J1.148 E.01603
G1 X167.942 Y137.738 E.52705
G1 X167.815 Y138.158 E.01108
G1 X153.248 Y123.591 E.52006
G3 X153.296 Y124.187 I-6.038 J.787 E.01509
G1 X167.687 Y138.578 E.51379
G1 X167.551 Y138.99 E.01094
G1 X153.332 Y124.77 E.50765
G3 X153.353 Y125.339 I-5.783 J.504 E.01438
G1 X167.415 Y139.401 E.50203
G3 X167.274 Y139.808 I-8.359 J-2.683 E.01086
G1 X153.36 Y125.894 E.49673
G3 X153.36 Y126.442 I-5.582 J.277 E.01384
G1 X167.13 Y140.211 E.49157
G3 X166.983 Y140.612 I-8.23 J-2.778 E.01078
G1 X153.341 Y126.97 E.48704
G1 X153.321 Y127.498 E.01334
G1 X166.831 Y141.007 E.48229
G1 X166.678 Y141.403 E.01069
G1 X153.281 Y128.005 E.4783
G1 X153.237 Y128.509 E.01278
G1 X166.519 Y141.791 E.47417
G1 X166.359 Y142.178 E.01058
G1 X153.184 Y129.004 E.47033
G1 X153.119 Y129.486 E.01228
G1 X166.195 Y142.562 E.46683
G1 X166.027 Y142.942 E.01048
G1 X153.053 Y129.968 E.46316
G3 X152.97 Y130.432 I-4.788 J-.62 E.01191
G1 X165.859 Y143.321 E.46013
G3 X165.683 Y143.693 I-7.742 J-3.424 E.01039
G1 X152.884 Y130.894 E.45693
G3 X152.794 Y131.352 I-4.701 J-.69 E.01177
G1 X165.507 Y144.065 E.45388
G3 X165.328 Y144.433 I-7.6 J-3.475 E.01034
G1 X152.689 Y131.794 E.45122
G1 X152.584 Y132.237 E.01148
G1 X165.144 Y144.797 E.44843
G1 X164.961 Y145.162 E.0103
G1 X152.47 Y132.67 E.44595
G1 X152.347 Y133.095 E.01116
G1 X164.771 Y145.519 E.44354
G1 X164.58 Y145.876 E.01022
G1 X152.224 Y133.52 E.44112
G3 X152.089 Y133.933 I-4.266 J-1.16 E.01097
G1 X164.386 Y146.229 E.439
G1 X164.188 Y146.579 E.01014
G1 X151.949 Y134.34 E.43693
G1 X151.809 Y134.748 E.01088
G1 X163.99 Y146.929 E.43487
G3 X163.785 Y147.272 I-7.079 J-3.987 E.01008
G1 X151.656 Y135.142 E.43302
G1 X151.499 Y135.534 E.01064
G1 X163.58 Y147.614 E.43128
G3 X163.372 Y147.954 I-7.027 J-4.058 E.01006
G1 X151.343 Y135.925 E.42945
G3 X151.174 Y136.303 I-3.932 J-1.532 E.01047
G1 X163.16 Y148.289 E.42792
G1 X162.948 Y148.625 E.01002
G1 X151.002 Y136.679 E.42648
G1 X150.83 Y137.054 E.01043
G1 X162.73 Y148.955 E.42485
G1 X162.511 Y149.283 E.00997
G1 X150.646 Y137.418 E.42359
G1 X150.458 Y137.778 E.01025
G1 X162.29 Y149.61 E.42239
G1 X162.064 Y149.931 E.00992
G1 X150.271 Y138.139 E.42099
G3 X150.073 Y138.489 I-3.653 J-1.836 E.01015
G1 X161.837 Y150.253 E.41998
G3 X161.607 Y150.57 I-6.576 J-4.53 E.0099
G1 X149.872 Y138.835 E.41896
G1 X149.67 Y139.181 E.01011
G1 X161.374 Y150.884 E.41783
G1 X161.141 Y151.199 E.00988
G1 X149.459 Y139.518 E.41703
G1 X149.244 Y139.849 E.00999
G1 X160.901 Y151.507 E.41617
G1 X160.661 Y151.814 E.00985
G1 X149.028 Y140.181 E.41531
G3 X148.805 Y140.506 I-3.411 J-2.098 E.00995
G1 X160.418 Y152.12 E.4146
G1 X160.172 Y152.42 E.00982
G1 X148.575 Y140.824 E.41399
G1 X148.346 Y141.142 E.0099
G1 X159.925 Y152.721 E.41338
G3 X159.673 Y153.017 I-6.153 J-4.98 E.00981
G1 X148.112 Y141.456 E.41275
G1 X147.868 Y141.76 E.00984
G1 X159.419 Y153.311 E.41239
G3 X159.165 Y153.604 I-6.092 J-5.022 E.0098
G1 X147.625 Y142.064 E.412
G3 X147.38 Y142.367 I-3.199 J-2.34 E.00983
G1 X158.905 Y153.892 E.41146
G1 X158.644 Y154.179 E.00979
G1 X147.123 Y142.657 E.41134
G1 X146.866 Y142.948 E.00979
G1 X158.381 Y154.463 E.41111
G1 X158.114 Y154.744 E.00978
G1 X146.609 Y143.238 E.41075
G3 X146.339 Y143.517 I-2.968 J-2.6 E.00978
G1 X157.847 Y155.024 E.41082
G3 X157.574 Y155.299 I-5.736 J-5.412 E.00978
G1 X146.069 Y143.794 E.41075
G1 X145.798 Y144.071 E.00978
G1 X157.3 Y155.573 E.41063
G3 X157.025 Y155.846 I-5.702 J-5.477 E.00978
G1 X145.519 Y144.339 E.4108
G1 X145.235 Y144.603 E.00978
G1 X156.745 Y156.113 E.41092
G1 X156.464 Y156.38 E.00978
G1 X144.951 Y144.867 E.41104
G3 X144.66 Y145.124 I-2.76 J-2.822 E.0098
G1 X156.18 Y156.643 E.41126
G1 X155.893 Y156.904 E.00979
G1 X144.363 Y145.374 E.41162
G1 X144.066 Y145.624 E.00981
G1 X155.606 Y157.164 E.41198
G3 X155.312 Y157.418 I-5.322 J-5.844 E.0098
G1 X143.764 Y145.871 E.41226
G1 X143.453 Y146.107 E.00987
G1 X155.018 Y157.672 E.41287
G3 X154.722 Y157.924 I-5.277 J-5.902 E.00981
G1 X143.142 Y146.344 E.41341
G3 X142.83 Y146.579 I-2.552 J-3.061 E.00988
G1 X154.421 Y158.171 E.41382
G1 X154.121 Y158.418 E.00982
G1 X142.505 Y146.802 E.41467
G1 X142.181 Y147.025 E.00994
G1 X153.815 Y158.66 E.41537
G1 X153.508 Y158.9 E.00985
G1 X141.856 Y147.248 E.41599
G3 X141.521 Y147.461 I-3.068 J-4.451 E.01002
G1 X153.2 Y159.14 E.41695
G1 X152.886 Y159.373 E.00988
G1 X141.182 Y147.669 E.41783
G1 X140.836 Y147.871 E.01011
G1 X152.571 Y159.606 E.41895
G3 X152.254 Y159.837 I-4.845 J-6.343 E.0099
G1 X140.49 Y148.073 E.41998
G3 X140.14 Y148.271 I-2.189 J-3.458 E.01015
G1 X151.933 Y160.063 E.42099
G1 X151.611 Y160.289 E.00992
G1 X139.78 Y148.458 E.42239
G1 X139.419 Y148.645 E.01025
G1 X151.284 Y160.51 E.42359
G1 X150.956 Y160.729 E.00997
G1 X139.056 Y148.829 E.42484
G1 X138.68 Y149.001 E.01043
G1 X150.626 Y160.947 E.42647
G1 X150.291 Y161.159 E.01002
G1 X138.305 Y149.173 E.42791
G3 X137.926 Y149.342 I-1.912 J-3.765 E.01047
G1 X149.955 Y161.372 E.42945
G3 X149.615 Y161.579 I-4.393 J-6.81 E.01006
G1 X137.535 Y149.499 E.43127
G1 X137.144 Y149.655 E.01064
G1 X149.273 Y161.784 E.43302
G3 X148.93 Y161.989 I-4.318 J-6.854 E.01008
G1 X136.749 Y149.808 E.43486
G1 X136.342 Y149.948 E.01088
G1 X148.58 Y162.187 E.43693
G1 X148.231 Y162.385 E.01014
G1 X135.934 Y150.089 E.43899
G3 X135.521 Y150.223 I-1.572 J-4.126 E.01097
G1 X147.877 Y162.579 E.44111
G1 X147.52 Y162.77 E.01022
G1 X135.097 Y150.346 E.44353
G1 X134.672 Y150.469 E.01116
G1 X147.163 Y162.96 E.44594
G1 X146.799 Y163.144 E.0103
G1 X134.241 Y150.586 E.44834
G3 X133.801 Y150.693 I-1.684 J-5.914 E.01143
G1 X146.435 Y163.327 E.45103
G3 X146.066 Y163.507 I-3.83 J-7.392 E.01034
G1 X133.349 Y150.789 E.45402
G1 X132.897 Y150.885 E.01166
G1 X145.695 Y163.682 E.45688
G3 X145.322 Y163.858 I-3.799 J-7.57 E.01039
G1 X132.436 Y150.972 E.46004
G1 X131.965 Y151.048 E.01206
G1 X144.943 Y164.026 E.46334
G1 X144.564 Y164.194 E.01048
G1 X131.493 Y151.124 E.46663
G3 X131.003 Y151.182 I-.838 J-4.953 E.01245
G1 X144.18 Y164.358 E.4704
G1 X143.792 Y164.518 E.01058
G1 X130.51 Y151.236 E.47417
G3 X130.012 Y151.286 I-.916 J-6.753 E.01265
G1 X143.404 Y164.678 E.47811
G1 X143.009 Y164.83 E.01069
G1 X129.5 Y151.321 E.48227
G1 X128.972 Y151.341 E.01334
G1 X142.614 Y164.983 E.48702
G3 X142.213 Y165.129 I-3.186 J-8.101 E.01078
G1 X128.444 Y151.36 E.49156
G3 X127.896 Y151.36 I-.272 J-5.583 E.01384
G1 X141.809 Y165.273 E.49672
G3 X141.403 Y165.415 I-3.071 J-8.163 E.01086
G1 X127.341 Y151.353 E.50201
G3 X126.772 Y151.332 I-.067 J-5.793 E.01438
G1 X140.991 Y165.551 E.50763
G1 X140.58 Y165.687 E.01094
G1 X126.189 Y151.296 E.51376
G3 X125.593 Y151.248 I.19 J-6.086 E.01509
G1 X140.16 Y165.814 E.52003
G1 X139.74 Y165.942 E.01108
G1 X124.977 Y151.18 E.52702
G3 X124.348 Y151.098 I.518 J-6.451 E.01603
G1 X139.314 Y166.064 E.53428
G1 X138.885 Y166.182 E.01124
G1 X123.695 Y150.993 E.54227
G3 X123.028 Y150.873 I1.295 J-9.12 E.01713
G1 X138.452 Y166.298 E.55068
G1 X138.015 Y166.408 E.0114
G1 X122.324 Y150.717 E.56017
G1 X121.606 Y150.546 E.01863
G1 X137.576 Y166.516 E.57014
G1 X137.128 Y166.617 E.01157
G1 X120.839 Y150.328 E.58153
G3 X120.046 Y150.082 I2.104 J-8.192 E.02098
G1 X136.681 Y166.717 E.59389
G3 X136.226 Y166.809 I-2.099 J-9.21 E.01173
G1 X119.211 Y149.794 E.60744
G3 X118.303 Y149.434 I3.227 J-9.456 E.02467
G1 X135.769 Y166.9 E.62354
G3 X135.305 Y166.984 I-1.945 J-9.393 E.01189
G1 X117.334 Y149.013 E.64158
G1 X116.257 Y148.484 E.0303
G1 X134.839 Y167.065 E.66337
G3 X134.367 Y167.141 I-1.777 J-9.575 E.01207
G1 X115.007 Y147.781 E.69116
G3 X113.45 Y146.771 I9.489 J-16.342 E.04687
G1 X133.89 Y167.212 E.72973
G3 X133.409 Y167.278 I-1.598 J-9.782 E.01226
G1 X86.722 Y120.591 E1.66675
G3 X86.788 Y120.11 I9.82 J1.113 E.01226
G1 X107.229 Y140.55 E.72973
G3 X106.219 Y138.993 I15.326 J-11.043 E.04687
G1 X86.859 Y119.633 E.69116
G3 X86.935 Y119.161 I9.674 J1.309 E.01207
G1 X105.516 Y137.743 E.66338
G1 X104.987 Y136.666 E.0303
G1 X87.016 Y118.695 E.64158
G3 X87.1 Y118.231 I9.439 J1.475 E.01189
G1 X104.565 Y135.697 E.62353
G3 X104.216 Y134.8 I8.945 J-3.999 E.0243
G1 X87.191 Y117.774 E.60782
G3 X87.283 Y117.319 I9.384 J1.66 E.01173
G1 X103.918 Y133.954 E.5939
G1 X103.664 Y133.153 E.02123
G1 X87.383 Y116.872 E.58124
G1 X87.484 Y116.424 E.01157
G1 X103.454 Y132.394 E.57014
G1 X103.283 Y131.676 E.01863
G1 X87.592 Y115.985 E.56017
G1 X87.702 Y115.547 E.0114
G1 X103.131 Y130.977 E.55083
G1 X103.006 Y130.304 E.01728
G1 X87.818 Y115.115 E.54224
G1 X87.936 Y114.686 E.01123
G1 X102.899 Y129.649 E.53416
G3 X102.82 Y129.023 I8.465 J-1.377 E.01593
G1 X88.058 Y114.26 E.52702
G1 X88.185 Y113.84 E.01108
G1 X102.752 Y128.407 E.52003
G3 X102.704 Y127.811 I6.034 J-.786 E.01509
G1 X88.313 Y113.42 E.51376
G1 X88.453 Y113.013 E.01088
G1 X102.668 Y127.228 E.50747
G3 X102.647 Y126.659 I5.78 J-.502 E.01438
G1 X88.594 Y112.605 E.50171
G1 X88.734 Y112.198 E.01088
G1 X102.64 Y126.104 E.49646
G3 X102.64 Y125.556 I5.574 J-.276 E.01384
G1 X88.874 Y111.791 E.49145
G3 X89.017 Y111.386 I5.54 J1.739 E.01083
G1 X102.659 Y125.028 E.48702
G1 X102.679 Y124.5 E.01334
G1 X89.17 Y110.991 E.48227
G1 X89.322 Y110.596 E.01069
G1 X102.72 Y123.993 E.47829
G1 X102.763 Y123.489 E.01278
G1 X89.485 Y110.211 E.47403
G1 X89.649 Y109.828 E.01053
G1 X102.814 Y122.992 E.46998
G3 X102.876 Y122.507 I6.621 J.61 E.01235
G1 X89.814 Y109.444 E.46635
G1 X89.978 Y109.061 E.01053
G1 X102.952 Y122.035 E.46319
G1 X103.028 Y121.564 E.01206
G1 X90.142 Y108.678 E.46004
G3 X90.318 Y108.305 I5.101 J2.175 E.01039
G1 X103.113 Y121.101 E.45681
G3 X103.206 Y120.646 I6.598 J1.105 E.01173
G1 X90.493 Y107.934 E.45384
G3 X90.673 Y107.565 I7.568 J3.46 E.01034
G1 X103.311 Y120.204 E.45119
G1 X103.417 Y119.761 E.01148
G1 X90.856 Y107.201 E.44841
G1 X91.04 Y106.837 E.0103
G1 X103.531 Y119.328 E.44594
G1 X103.654 Y118.903 E.01116
G1 X91.23 Y106.48 E.44353
G1 X91.421 Y106.123 E.01022
G1 X103.777 Y118.479 E.44111
G3 X103.911 Y118.066 I4.266 J1.161 E.01097
G1 X91.615 Y105.769 E.43899
G1 X91.813 Y105.42 E.01014
G1 X104.052 Y117.658 E.43693
G1 X104.192 Y117.251 E.01088
G1 X92.011 Y105.07 E.43486
G3 X92.218 Y104.729 I5.158 J2.901 E.01006
G1 X104.345 Y116.856 E.43293
G1 X104.501 Y116.465 E.01064
G1 X92.426 Y104.39 E.43109
G1 X92.634 Y104.05 E.01006
G1 X104.658 Y116.074 E.42925
M73 P76 R10
G3 X104.827 Y115.695 I3.928 J1.532 E.01047
G1 X94.77 Y105.639 E.35902
G1 X97.513 Y107.834 E.08868
G1 X104.999 Y115.32 E.26724
G1 X105.171 Y114.944 E.01043
G1 X100.256 Y110.029 E.17547
G1 X102.999 Y112.224 E.08868
G1 X105.483 Y114.709 E.0887
; WIPE_START
G1 X104.069 Y113.295 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.863 Y105.988 Z5.08 F30000
G1 X98.859 Y96.037 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F11620.701
G1 X100.899 Y98.077 E.07283
G1 X103.642 Y100.272 E.08868
G1 X99.26 Y95.89 E.15644
G1 X99.538 Y95.62 E.00978
G1 X106.385 Y102.467 E.24443
G1 X109.127 Y104.662 E.08868
G1 X99.821 Y95.356 E.33225
G1 X100.108 Y95.095 E.00979
G1 X111.637 Y106.624 E.41157
G1 X111.935 Y106.374 E.00981
G1 X100.396 Y94.835 E.41196
G3 X100.689 Y94.581 I5.28 J5.797 E.0098
G1 X112.237 Y106.128 E.41226
G1 X112.548 Y105.892 E.00987
G1 X100.983 Y94.327 E.41287
G3 X101.279 Y94.075 I5.265 J5.89 E.00981
G1 X112.859 Y105.655 E.41341
G3 X113.171 Y105.42 I2.552 J3.061 E.00988
G1 X101.58 Y93.828 E.41382
G1 X101.88 Y93.582 E.00982
G1 X113.496 Y105.197 E.41468
G1 X113.821 Y104.974 E.00994
G1 X102.186 Y93.339 E.41537
G1 X102.493 Y93.099 E.00985
G1 X114.145 Y104.751 E.41599
G3 X114.483 Y104.542 I2.318 J3.357 E.01004
G1 X102.801 Y92.859 E.41706
G1 X103.115 Y92.626 E.00988
G1 X114.822 Y104.333 E.41794
G1 X115.161 Y104.124 E.01005
G1 X103.43 Y92.393 E.41881
G3 X103.747 Y92.163 I4.85 J6.349 E.0099
G1 X115.512 Y103.927 E.41999
G1 X115.865 Y103.732 E.01018
G1 X104.069 Y91.936 E.42113
G1 X104.39 Y91.71 E.00992
G1 X116.218 Y103.538 E.42227
G3 X116.582 Y103.354 I2.057 J3.62 E.01029
G1 X104.717 Y91.489 E.42358
G1 X105.045 Y91.27 E.00997
G1 X116.95 Y103.175 E.425
G1 X117.318 Y102.995 E.01034
G1 X105.375 Y91.052 E.42636
G1 X105.711 Y90.84 E.01002
G1 X117.696 Y102.826 E.4279
G1 X118.08 Y102.661 E.01053
G1 X106.046 Y90.628 E.42961
G3 X106.386 Y90.42 I4.398 J6.82 E.01006
G1 X118.463 Y102.497 E.43116
G3 X118.857 Y102.344 I1.757 J3.937 E.01068
G1 X106.728 Y90.215 E.43301
G3 X107.071 Y90.01 I4.323 J6.864 E.01008
G1 X119.256 Y102.195 E.43501
G1 X119.656 Y102.047 E.01075
G1 X107.421 Y89.812 E.43679
G1 X107.771 Y89.614 E.01014
G1 X120.068 Y101.911 E.43902
G1 X120.484 Y101.78 E.01101
G1 X108.124 Y89.42 E.44124
G1 X108.481 Y89.229 E.01022
G1 X120.9 Y101.648 E.44334
G3 X121.331 Y101.532 I1.393 J4.333 E.01129
G1 X108.838 Y89.039 E.44601
G1 X109.203 Y88.856 E.0103
G1 X121.765 Y101.418 E.44848
G3 X122.201 Y101.306 I1.356 J4.389 E.01137
G1 X109.567 Y88.672 E.45104
G3 X109.935 Y88.493 I3.844 J7.422 E.01034
G1 X122.653 Y101.211 E.45403
G1 X123.105 Y101.115 E.01166
G1 X110.307 Y88.317 E.45689
G3 X110.679 Y88.141 I3.775 J7.519 E.01039
G1 X123.565 Y101.028 E.46006
G1 X124.037 Y100.952 E.01206
G1 X111.058 Y87.973 E.46335
G1 X111.438 Y87.805 E.01048
G1 X124.509 Y100.876 E.46665
G3 X124.998 Y100.818 I.837 J4.954 E.01245
G1 X111.822 Y87.641 E.47041
G1 X112.209 Y87.481 E.01058
G1 X125.491 Y100.763 E.47419
G3 X125.992 Y100.716 I.729 J5.064 E.0127
G1 X112.597 Y87.322 E.47819
G1 X112.993 Y87.169 E.01069
G1 X126.508 Y100.684 E.4825
G1 X127.024 Y100.653 E.01305
G1 X113.388 Y87.017 E.48681
G3 X113.789 Y86.87 I3.187 J8.104 E.01078
G1 X127.557 Y100.638 E.49152
G3 X128.106 Y100.64 I.25 J7.458 E.01387
G1 X114.192 Y86.726 E.49674
G3 X114.6 Y86.586 I2.104 J5.467 E.01088
G1 X128.661 Y100.647 E.50198
G3 X129.23 Y100.668 I.065 J5.807 E.01438
G1 X115.016 Y86.454 E.50745
G1 X115.432 Y86.323 E.01101
G1 X129.813 Y100.704 E.51343
G3 X130.409 Y100.752 I-.191 J6.082 E.01509
G1 X115.848 Y86.191 E.51985
G1 X116.264 Y86.059 E.01101
G1 X131.025 Y100.821 E.52699
G3 X131.655 Y100.902 I-.519 J6.453 E.01603
G1 X116.688 Y85.936 E.53431
G1 X117.117 Y85.817 E.01123
G1 X132.307 Y101.007 E.5423
G3 X132.98 Y101.133 I-.94 J6.911 E.01729
G1 X117.549 Y85.702 E.5509
G1 X117.987 Y85.592 E.0114
G1 X133.675 Y101.28 E.56007
G3 X134.406 Y101.463 I-1.494 J7.517 E.01902
G1 X118.426 Y85.483 E.57048
G1 X118.873 Y85.383 E.01157
G1 X135.156 Y101.665 E.58129
G1 X135.957 Y101.919 E.02123
G1 X119.32 Y85.282 E.59394
G3 X119.776 Y85.19 I2.089 J9.164 E.01173
G1 X136.805 Y102.22 E.60796
G3 X137.699 Y102.565 I-3.171 J9.521 E.02419
G1 X120.233 Y85.1 E.62354
G3 X120.696 Y85.015 I1.943 J9.382 E.01189
G1 X138.67 Y102.989 E.64167
G1 X139.747 Y103.519 E.03032
G1 X121.163 Y84.934 E.66348
G3 X121.635 Y84.859 I1.778 J9.586 E.01207
G1 X140.998 Y104.222 E.69129
G3 X142.557 Y105.233 I-9.498 J16.35 E.04691
G1 X122.112 Y84.788 E.7299
G3 X122.593 Y84.722 I1.59 J9.731 E.01226
G1 X169.278 Y131.407 E1.6667
G1 X169.339 Y130.919 E.0124
G1 X123.081 Y84.661 E1.65144
G3 X123.572 Y84.605 I1.398 J9.982 E.01248
G1 X169.395 Y130.428 E1.63593
G1 X169.444 Y129.93 E.01265
G1 X124.07 Y84.556 E1.61988
G3 X124.572 Y84.51 I1.186 J10.206 E.01272
G1 X169.49 Y129.428 E1.6036
G1 X169.528 Y128.918 E.01291
G1 X125.082 Y84.472 E1.58674
G3 X125.595 Y84.438 I.952 J10.417 E.01299
G1 X169.562 Y128.405 E1.56963
G1 X169.588 Y127.883 E.01319
G1 X126.117 Y84.412 E1.55191
G3 X126.643 Y84.391 I.702 J10.714 E.01329
G1 X169.609 Y127.357 E1.5339
G1 X169.622 Y126.822 E.0135
G1 X127.178 Y84.378 E1.51528
G3 X127.718 Y84.371 I.406 J10.212 E.01365
G1 X169.63 Y126.282 E1.49626
G1 X169.63 Y125.734 E.01383
G1 X128.267 Y84.372 E1.47668
G3 X128.821 Y84.378 I.14 J12.212 E.01398
G1 X169.622 Y125.179 E1.45663
G1 X169.608 Y124.618 E.01418
G1 X129.382 Y84.392 E1.4361
G3 X129.954 Y84.416 I-.21 J11.645 E.01446
G1 X169.584 Y124.046 E1.4148
G1 X169.556 Y123.47 E.01456
G1 X130.53 Y84.444 E1.39323
G3 X131.121 Y84.487 I-.594 J12.228 E.01495
G1 X169.513 Y122.879 E1.37061
G2 X169.465 Y122.284 I-12.136 J.668 E.01507
G1 X131.716 Y84.535 E1.34767
G1 X132.323 Y84.595 E.01541
G1 X169.405 Y121.676 E1.32385
G2 X169.336 Y121.059 I-12.61 J1.108 E.01568
G1 X132.941 Y84.664 E1.29933
G1 X133.565 Y84.741 E.01589
G1 X169.259 Y120.435 E1.27428
G2 X169.165 Y119.793 I-12.962 J1.576 E.01638
G1 X134.207 Y84.835 E1.248
G3 X134.857 Y84.938 I-1.768 J13.318 E.01662
G1 X169.062 Y119.142 E1.22112
G1 X168.947 Y118.48 E.01698
G1 X135.52 Y85.053 E1.19336
G3 X136.201 Y85.186 I-2.365 J13.929 E.0175
G1 X168.814 Y117.799 E1.16433
G2 X168.67 Y117.107 I-14.161 J2.597 E.01785
G1 X136.893 Y85.33 E1.13445
G1 X137.599 Y85.489 E.01827
G1 X168.511 Y116.401 E1.10358
G2 X168.329 Y115.671 I-15.104 J3.385 E.01899
G1 X138.329 Y85.671 E1.07101
G3 X139.076 Y85.871 I-3.673 J15.264 E.01952
G1 X168.129 Y114.924 E1.03723
G2 X167.911 Y114.158 I-15.693 J4.063 E.02012
G1 X139.842 Y86.089 E1.00206
G3 X140.631 Y86.33 I-4.49 J16.116 E.02081
G1 X167.67 Y113.369 E.96533
G1 X167.4 Y112.552 E.02174
G1 X141.448 Y86.6 E.92649
G3 X142.297 Y86.901 I-5.7 J17.415 E.02273
G1 X167.099 Y111.703 E.88544
G2 X166.764 Y110.821 I-18.149 J6.376 E.02381
G1 X143.179 Y87.236 E.84201
G3 X144.1 Y87.609 I-7.15 J18.953 E.0251
G1 X166.391 Y109.9 E.79578
G2 X165.971 Y108.932 I-19.931 J8.079 E.02664
G1 X145.068 Y88.029 E.74623
G3 X146.092 Y88.506 I-9.21 J21.139 E.02851
G1 X165.494 Y107.908 E.69267
G2 X164.949 Y106.815 I-77.035 J37.757 E.03084
G1 X147.185 Y89.051 E.63417
G3 X148.383 Y89.701 I-12.656 J24.747 E.0344
G1 X164.299 Y105.617 E.56821
G2 X163.527 Y104.298 I-27.253 J15.055 E.03859
G1 X149.702 Y90.473 E.49356
G3 X151.233 Y91.456 I-24.39 J39.658 E.04593
G1 X162.544 Y102.767 E.4038
G2 X161.184 Y100.859 I-36.777 J24.781 E.05915
G1 X153.141 Y92.816 E.28713
G3 X157.051 Y96.179 I-24.923 J32.937 E.13027
G1 X160.14 Y99.268 E.11028
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11620.701
G1 X158.726 Y97.854 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/58
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.08 I-1.112 J-.495 P1  F30000
G1 X127.486 Y167.966 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X92.595 Y103.461 I.516 J-41.968 E2.41713
G1 X105.956 Y114.155 E.46374
G2 X111.613 Y107.087 I22.042 J11.843 E4.01344
G1 X98.251 Y96.394 E.46374
G3 X128.564 Y84.031 I29.758 J29.621 E.91124
G3 X127.546 Y167.967 I-.562 J41.967 E3.57003
G1 X127.481 Y168.384 F30000
G1 F9000
G3 X92.492 Y102.847 I.517 J-42.385 E2.45385
G1 X106.486 Y114.046 E.48568
G2 X111.623 Y107.628 I21.511 J11.951 E3.96579
G1 X97.629 Y96.428 E.48568
G3 X128.57 Y83.615 I30.385 J29.609 E.93283
G3 X127.541 Y168.384 I-.572 J42.384 E3.60529
M204 S250
G1 X127.476 Y168.784 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.527 J-42.785 E2.30917
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.575 Y83.214 I30.959 J29.518 E.88479
G3 X127.536 Y168.785 I-.573 J42.784 E3.37693
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.42208
G1 X125.537 Y168.717 E-.33792
; WIPE_END
G1 E-.04 F1800
G1 X121.96 Y167.365 Z5.24 F30000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421566
G1 F11621
G1 X142.559 Y146.765 E.73539
G3 X141 Y147.777 I-11.066 J-15.351 E.04692
G1 X121.635 Y167.141 E.69131
G3 X121.163 Y167.066 I1.308 J-9.674 E.01207
G1 X139.749 Y148.48 E.66349
G3 X138.681 Y149.001 I-9.377 J-17.884 E.03
G1 X120.697 Y166.985 E.64202
G3 X120.233 Y166.901 I1.479 J-9.465 E.01189
G1 X137.695 Y149.439 E.62336
G3 X136.804 Y149.782 I-5.097 J-11.912 E.02409
G1 X119.777 Y166.81 E.60788
G3 X119.321 Y166.718 I1.655 J-9.36 E.01173
G1 X135.958 Y150.08 E.59395
G1 X135.157 Y150.334 E.02123
G1 X118.874 Y166.617 E.58129
G1 X118.427 Y166.517 E.01157
G1 X134.407 Y150.537 E.57048
G3 X133.676 Y150.72 I-2.228 J-7.347 E.01902
G1 X117.988 Y166.408 E.56006
G1 X117.55 Y166.298 E.0114
G1 X132.981 Y150.867 E.5509
G3 X132.308 Y150.992 I-1.614 J-6.792 E.01729
G1 X117.118 Y166.183 E.5423
G1 X116.689 Y166.064 E.01123
G1 X131.656 Y151.097 E.53431
G3 X131.026 Y151.179 I-1.149 J-6.369 E.01603
G1 X116.263 Y165.943 E.52705
G1 X115.842 Y165.815 E.01108
G1 X130.41 Y151.248 E.52006
G3 X129.81 Y151.301 I-1.018 J-8.13 E.01522
M73 P77 R10
G1 X115.422 Y165.688 E.51362
G1 X115.011 Y165.552 E.01094
G1 X129.231 Y151.331 E.50766
G1 X128.663 Y151.352 E.01436
G1 X114.599 Y165.416 E.50206
G3 X114.193 Y165.274 I2.675 J-8.336 E.01086
G1 X128.105 Y151.363 E.49664
G1 X127.564 Y151.356 E.01366
G1 X113.79 Y165.13 E.49173
G3 X113.388 Y164.983 I2.792 J-8.27 E.01078
G1 X127.025 Y151.347 E.4868
G1 X126.509 Y151.316 E.01305
G1 X112.993 Y164.831 E.48249
G1 X112.598 Y164.679 E.01069
G1 X125.993 Y151.284 E.47818
G3 X125.492 Y151.237 I.229 J-5.12 E.0127
G1 X112.21 Y164.519 E.47418
G1 X111.822 Y164.359 E.01058
G1 X124.999 Y151.182 E.47041
G3 X124.51 Y151.124 I.346 J-5.005 E.01245
G1 X111.439 Y164.195 E.46664
G1 X111.059 Y164.027 E.01048
G1 X124.038 Y151.048 E.46334
G1 X123.566 Y150.972 E.01206
G1 X110.68 Y163.859 E.46005
G3 X110.308 Y163.683 I3.442 J-7.782 E.01039
G1 X123.103 Y150.888 E.45679
G3 X122.649 Y150.794 I1.044 J-6.185 E.0117
G1 X109.936 Y163.508 E.45387
G3 X109.567 Y163.328 I3.475 J-7.6 E.01034
G1 X122.207 Y150.689 E.45122
G1 X121.764 Y150.584 E.01148
G1 X109.203 Y163.145 E.44842
G1 X108.839 Y162.961 E.01029
G1 X121.33 Y150.47 E.44594
G1 X120.906 Y150.347 E.01116
G1 X108.482 Y162.771 E.44353
M73 P77 R9
G1 X108.125 Y162.58 E.01021
G1 X120.481 Y150.224 E.44112
G3 X120.068 Y150.089 I1.16 J-4.265 E.01097
G1 X107.771 Y162.386 E.43899
G1 X107.422 Y162.188 E.01014
G1 X119.661 Y149.949 E.43693
G1 X119.253 Y149.809 E.01088
G1 X107.072 Y161.99 E.43486
G3 X106.729 Y161.786 I4.004 J-7.108 E.01008
G1 X118.858 Y149.656 E.43302
G1 X118.467 Y149.5 E.01064
G1 X106.387 Y161.58 E.43127
G3 X106.047 Y161.373 I4.047 J-7.009 E.01006
G1 X118.076 Y149.343 E.42945
G3 X117.695 Y149.177 I2.063 J-5.258 E.01051
G1 X105.711 Y161.16 E.4278
G1 X105.376 Y160.948 E.01002
G1 X117.319 Y149.005 E.42635
G1 X116.951 Y148.826 E.01034
G1 X105.046 Y160.73 E.42499
G1 X104.718 Y160.511 E.00997
G1 X116.583 Y148.646 E.42357
G3 X116.219 Y148.462 I1.686 J-3.791 E.01029
G1 X104.391 Y160.291 E.42226
G1 X104.069 Y160.064 E.00992
G1 X115.866 Y148.268 E.42112
G1 X115.512 Y148.074 E.01018
G1 X103.748 Y159.838 E.41998
G3 X103.431 Y159.608 I4.544 J-6.597 E.0099
G1 X115.162 Y147.877 E.4188
G1 X114.823 Y147.668 E.01005
G1 X103.116 Y159.375 E.41793
G1 X102.802 Y159.141 E.00988
G1 X114.484 Y147.459 E.41706
G3 X114.146 Y147.249 I1.963 J-3.542 E.01004
G1 X102.494 Y158.901 E.41598
G1 X102.186 Y158.661 E.00985
G1 X113.821 Y147.026 E.41537
G1 X113.497 Y146.804 E.00994
G1 X101.881 Y158.419 E.41467
G1 X101.58 Y158.172 E.00982
G1 X113.172 Y146.581 E.41381
G3 X112.856 Y146.349 I2.979 J-4.375 E.00989
G1 X101.28 Y157.925 E.41329
G3 X100.984 Y157.674 I4.969 J-6.14 E.00981
G1 X112.545 Y146.112 E.41274
G1 X112.241 Y145.869 E.00984
G1 X100.69 Y157.42 E.41238
G3 X100.396 Y157.166 I5.089 J-6.171 E.0098
G1 X111.937 Y145.625 E.41199
G3 X111.634 Y145.381 I3.184 J-4.252 E.00983
G1 X100.109 Y156.905 E.41143
G1 X99.822 Y156.645 E.00979
G1 X111.34 Y145.127 E.41119
G3 X111.051 Y144.868 I3.368 J-4.051 E.00979
G1 X99.538 Y156.382 E.41103
G1 X99.257 Y156.115 E.00978
G1 X110.767 Y144.605 E.41091
G1 X110.483 Y144.341 E.00978
G1 X98.976 Y155.848 E.41079
G3 X98.701 Y155.575 I5.435 J-5.759 E.00978
G1 X110.203 Y144.073 E.41061
G1 X109.933 Y143.796 E.00978
G1 X98.428 Y155.301 E.41073
G3 X98.155 Y155.026 I5.472 J-5.698 E.00978
G1 X109.662 Y143.519 E.41081
G3 X109.393 Y143.24 I2.703 J-2.885 E.00978
G1 X97.888 Y154.746 E.41073
G1 X97.621 Y154.465 E.00978
G1 X109.136 Y142.95 E.41109
G1 X108.879 Y142.659 E.00979
G1 X97.357 Y154.181 E.41132
G1 X97.097 Y153.894 E.00979
G1 X108.622 Y142.369 E.41144
G3 X108.377 Y142.066 I2.961 J-2.65 E.00983
G1 X96.837 Y153.606 E.41199
G3 X96.582 Y153.313 I5.878 J-5.351 E.0098
G1 X108.134 Y141.762 E.41237
G1 X107.89 Y141.458 E.00983
G1 X96.329 Y153.019 E.41274
G3 X96.077 Y152.723 I5.893 J-5.27 E.00981
G1 X107.656 Y141.144 E.41337
G1 X107.426 Y140.826 E.0099
G1 X95.83 Y152.422 E.41398
G1 X95.583 Y152.122 E.00982
G1 X107.196 Y140.508 E.41459
G3 X106.972 Y140.185 I4.278 J-3.21 E.00993
G1 X95.341 Y151.816 E.41523
G1 X95.101 Y151.509 E.00985
G1 X106.753 Y139.857 E.41597
G3 X106.543 Y139.519 I4.48 J-3.013 E.01004
G1 X94.861 Y151.201 E.41705
G1 X94.628 Y150.887 E.00988
G1 X106.334 Y139.18 E.41792
G1 X106.125 Y138.841 E.01005
G1 X94.394 Y150.572 E.41879
G3 X94.164 Y150.255 I6.317 J-4.827 E.0099
G1 X105.928 Y138.491 E.41997
G1 X105.734 Y138.138 E.01018
G1 X93.938 Y149.934 E.42111
G1 X93.712 Y149.612 E.00992
G1 X105.539 Y137.785 E.42225
G3 X105.355 Y137.421 I3.605 J-2.051 E.01029
G1 X93.491 Y149.285 E.42356
G1 X93.272 Y148.957 E.00997
G1 X105.176 Y137.053 E.42498
G1 X104.996 Y136.685 E.01034
G1 X93.054 Y148.627 E.42634
G1 X92.841 Y148.292 E.01002
G1 X104.827 Y136.306 E.42787
G1 X104.663 Y135.923 E.01053
G1 X92.629 Y147.957 E.42959
G3 X92.421 Y147.617 I6.815 J-4.396 E.01006
G1 X104.498 Y135.54 E.43114
G3 X104.345 Y135.146 I3.936 J-1.759 E.01068
G1 X92.216 Y147.274 E.43299
G3 X92.012 Y146.931 I6.957 J-4.381 E.01008
G1 X104.196 Y134.746 E.43499
G1 X104.048 Y134.347 E.01075
G1 X91.814 Y146.582 E.43676
G1 X91.616 Y146.232 E.01014
G1 X103.909 Y133.938 E.43888
G3 X103.777 Y133.523 I5.562 J-1.993 E.01101
G1 X91.422 Y145.878 E.44109
G1 X91.231 Y145.522 E.01021
G1 X103.654 Y133.098 E.44351
G1 X103.531 Y132.674 E.01116
G1 X91.04 Y145.164 E.44592
G1 X90.857 Y144.8 E.01029
G1 X103.417 Y132.24 E.4484
G1 X103.312 Y131.797 E.01148
G1 X90.674 Y144.436 E.45119
G3 X90.494 Y144.068 I7.394 J-3.832 E.01034
G1 X103.207 Y131.355 E.45384
G3 X103.117 Y130.898 I4.61 J-1.148 E.01177
G1 X90.318 Y143.696 E.4569
G3 X90.143 Y143.324 I7.652 J-3.838 E.01039
G1 X103.031 Y130.436 E.4601
G3 X102.947 Y129.972 I6.247 J-1.372 E.0119
G1 X89.975 Y142.944 E.4631
G1 X89.806 Y142.565 E.01048
G1 X102.876 Y129.495 E.46658
G3 X102.818 Y129.005 I6.64 J-1.027 E.01246
G1 X89.643 Y142.181 E.47037
G1 X89.482 Y141.794 E.01058
G1 X102.764 Y128.512 E.47415
G3 X102.716 Y128.012 I5.062 J-.732 E.01269
G1 X89.323 Y141.406 E.47814
G1 X89.17 Y141.01 E.01069
G1 X102.685 Y127.496 E.48245
G1 X102.653 Y126.98 E.01305
G1 X89.018 Y140.615 E.48676
G3 X88.871 Y140.214 I8.114 J-3.192 E.01078
G1 X102.644 Y126.442 E.49168
G1 X102.637 Y125.901 E.01366
G1 X88.727 Y139.811 E.49659
G3 X88.586 Y139.405 I8.171 J-3.074 E.01086
G1 X102.648 Y125.343 E.50201
G1 X102.668 Y124.774 E.01436
G1 X88.45 Y138.993 E.50761
G1 X88.314 Y138.581 E.01094
G1 X102.702 Y124.193 E.51367
G1 X102.754 Y123.594 E.01518
G1 X88.186 Y138.161 E.52007
G1 X88.059 Y137.741 E.01108
G1 X102.815 Y122.985 E.52678
G3 X102.902 Y122.351 I8.655 J.864 E.01618
G1 X87.937 Y137.315 E.53424
G1 X87.818 Y136.886 E.01123
G1 X103.007 Y121.698 E.54222
G3 X103.132 Y121.025 I6.904 J.935 E.01728
G1 X87.703 Y136.454 E.55081
G1 X87.593 Y136.016 E.0114
G1 X103.279 Y120.331 E.55998
G3 X103.452 Y119.61 I9.864 J1.989 E.01872
G1 X87.484 Y135.578 E.57005
G1 X87.384 Y135.13 E.01157
G1 X103.671 Y118.843 E.58146
G3 X103.917 Y118.049 I8.19 J2.102 E.02097
G1 X87.283 Y134.683 E.59382
G3 X87.191 Y134.228 I9.258 J-2.11 E.01173
G1 X104.204 Y117.215 E.60736
G3 X104.564 Y116.307 I9.452 J3.224 E.02466
G1 X87.1 Y133.771 E.62346
G3 X87.016 Y133.308 I9.364 J-1.941 E.01189
G1 X104.995 Y115.329 E.64183
G3 X105.523 Y114.253 I11.969 J5.207 E.03025
G1 X86.935 Y132.841 E.66357
G3 X86.859 Y132.369 I9.619 J-1.785 E.01207
G1 X105.223 Y114.005 E.65559
G1 X104.919 Y113.761 E.00983
G1 X86.789 Y131.892 E.64726
G3 X86.722 Y131.411 I9.751 J-1.595 E.01226
G1 X104.615 Y113.518 E.63878
G1 X104.311 Y113.275 E.00984
G1 X86.662 Y130.924 E.63006
G3 X86.605 Y130.433 I9.957 J-1.398 E.01248
G1 X104.007 Y113.031 E.62123
G1 X103.703 Y112.788 E.00984
G1 X86.556 Y129.934 E.61212
G3 X86.51 Y129.432 I10.186 J-1.186 E.01272
G1 X103.398 Y112.544 E.6029
G1 X103.094 Y112.301 E.00983
G1 X86.473 Y128.922 E.59339
G3 X86.438 Y128.409 I10.442 J-.956 E.01299
G1 X102.79 Y112.057 E.58375
G1 X102.486 Y111.814 E.00983
G1 X86.413 Y127.887 E.57381
G3 X86.391 Y127.361 I10.703 J-.703 E.01329
G1 X102.182 Y111.57 E.56372
G1 X101.877 Y111.327 E.00983
G1 X86.378 Y126.827 E.55333
G3 X86.37 Y126.287 I10.995 J-.428 E.01363
G1 X101.573 Y111.084 E.54275
G1 X101.269 Y110.84 E.00984
G1 X86.37 Y125.739 E.53189
G3 X86.378 Y125.184 I11.312 J-.124 E.01402
G1 X100.965 Y110.597 E.52076
G1 X100.661 Y110.353 E.00984
G1 X86.391 Y124.623 E.50941
G3 X86.416 Y124.051 I11.652 J.208 E.01445
G1 X100.357 Y110.11 E.49769
G1 X100.052 Y109.866 E.00983
G1 X86.444 Y123.475 E.48582
G3 X86.487 Y122.884 I11.97 J.573 E.01495
G1 X99.748 Y109.623 E.47343
G1 X99.444 Y109.379 E.00984
G1 X86.534 Y122.289 E.46088
G1 X86.594 Y121.682 E.01541
G1 X99.14 Y109.136 E.44788
G1 X98.836 Y108.892 E.00983
G1 X86.663 Y121.065 E.43455
G1 X86.74 Y120.44 E.01589
G1 X98.531 Y108.649 E.42094
G1 X98.227 Y108.406 E.00983
G1 X86.835 Y119.798 E.40672
G3 X86.937 Y119.148 I13.35 J1.77 E.01661
G1 X97.923 Y108.162 E.3922
M73 P78 R9
G1 X97.619 Y107.919 E.00984
G1 X87.052 Y118.486 E.37724
G3 X87.185 Y117.806 I13.91 J2.359 E.0175
G1 X97.315 Y107.675 E.36165
G1 X97.011 Y107.432 E.00984
G1 X87.329 Y117.113 E.34563
G1 X87.487 Y116.407 E.01827
G1 X96.706 Y107.188 E.32911
G1 X96.402 Y106.945 E.00984
G1 X87.671 Y115.676 E.31171
G3 X87.869 Y114.931 I16.003 J3.849 E.01947
G1 X96.098 Y106.701 E.29379
G1 X95.794 Y106.458 E.00983
G1 X88.087 Y114.165 E.27513
G3 X88.327 Y113.377 I16.133 J4.492 E.0208
G1 X95.49 Y106.215 E.25569
G1 X95.186 Y105.971 E.00983
G1 X88.598 Y112.559 E.23519
G3 X88.898 Y111.711 I17.452 J5.709 E.02272
G1 X94.881 Y105.728 E.21359
G1 X94.577 Y105.484 E.00984
G1 X89.232 Y110.829 E.19081
G3 X89.607 Y109.907 I18.103 J6.817 E.02513
G1 X94.273 Y105.241 E.16657
G1 X93.969 Y104.997 E.00984
G1 X90.025 Y108.941 E.14078
G3 X90.501 Y107.917 I21.084 J9.179 E.02849
G1 X93.665 Y104.754 E.11294
G1 X93.36 Y104.51 E.00984
G1 X91.045 Y106.826 E.08265
G3 X91.695 Y105.629 I24.757 J12.654 E.03437
G1 X93.056 Y104.267 E.04861
G1 X92.752 Y104.024 E.00984
G1 X91.964 Y104.811 E.02812
; WIPE_START
G1 X92.752 Y104.024 E-.42325
G1 X93.056 Y104.267 E-.14805
G1 X92.705 Y104.618 E-.1887
; WIPE_END
G1 E-.04 F1800
G1 X97.714 Y98.86 Z5.24 F30000
G1 X103.689 Y91.991 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F11621
G1 X99.069 Y96.612 E.16495
G1 X99.373 Y96.855 E.00983
G1 X104.782 Y91.446 E.19312
G3 X106.311 Y90.465 I25.62 J38.248 E.04584
G1 X99.677 Y97.099 E.23681
G1 X99.981 Y97.342 E.00983
G1 X107.629 Y89.694 E.27301
G3 X108.826 Y89.045 I13.839 J24.085 E.03437
G1 X100.285 Y97.585 E.30488
G1 X100.59 Y97.829 E.00983
G1 X109.917 Y88.501 E.333
G3 X110.941 Y88.025 I10.21 J20.622 E.02849
G1 X100.894 Y98.072 E.35867
G1 X101.198 Y98.316 E.00983
G1 X111.908 Y87.606 E.38235
G3 X112.829 Y87.232 I8.06 J18.563 E.02509
G1 X101.502 Y98.559 E.40437
G1 X101.806 Y98.803 E.00984
G1 X113.711 Y86.898 E.42498
G3 X114.559 Y86.598 I6.269 J16.346 E.02272
G1 X102.111 Y99.046 E.4444
G1 X102.415 Y99.29 E.00984
G1 X115.375 Y86.329 E.46268
G3 X116.165 Y86.087 I5.577 J16.782 E.02085
G1 X102.719 Y99.533 E.48002
G1 X103.023 Y99.776 E.00983
G1 X116.931 Y85.869 E.4965
G3 X117.678 Y85.67 I4.415 J15.058 E.01951
G1 X103.327 Y100.02 E.5123
G1 X103.631 Y100.263 E.00984
G1 X118.407 Y85.488 E.52749
G1 X119.113 Y85.329 E.01827
G1 X103.936 Y100.507 E.54185
G1 X104.24 Y100.75 E.00983
G1 X119.806 Y85.185 E.55569
G3 X120.486 Y85.052 I3.04 J13.786 E.0175
G1 X104.544 Y100.994 E.56912
G1 X104.848 Y101.237 E.00983
G1 X121.148 Y84.937 E.58191
G3 X121.798 Y84.835 I2.415 J13.213 E.01661
G1 X105.152 Y101.481 E.59426
G1 X105.457 Y101.724 E.00984
G1 X122.44 Y84.74 E.60631
G1 X123.065 Y84.663 E.01589
G1 X105.761 Y101.967 E.61775
G1 X106.065 Y102.211 E.00984
G1 X123.682 Y84.594 E.62892
G1 X124.289 Y84.534 E.01541
G1 X106.369 Y102.454 E.63975
G1 X106.673 Y102.698 E.00984
G1 X124.884 Y84.487 E.65012
G3 X125.475 Y84.444 I1.168 J11.989 E.01495
G1 X106.977 Y102.941 E.66035
G1 X107.282 Y103.185 E.00984
G1 X126.051 Y84.416 E.67005
G3 X126.623 Y84.391 I.78 J11.626 E.01445
G1 X107.586 Y103.428 E.67961
G1 X107.89 Y103.672 E.00983
G1 X127.184 Y84.378 E.68879
G3 X127.739 Y84.37 I.418 J10.804 E.01401
G1 X108.194 Y103.915 E.69774
G1 X108.498 Y104.158 E.00983
G1 X128.286 Y84.371 E.70641
G3 X128.827 Y84.378 I.124 J11.56 E.01365
G1 X108.802 Y104.402 E.71485
G1 X109.107 Y104.645 E.00984
G1 X129.361 Y84.391 E.72308
G3 X129.887 Y84.413 I-.178 J10.732 E.01329
G1 X109.411 Y104.889 E.73099
G1 X109.715 Y105.132 E.00983
G1 X130.409 Y84.438 E.73877
G3 X130.922 Y84.473 I-.442 J10.454 E.01299
G1 X110.019 Y105.376 E.74623
G1 X110.323 Y105.619 E.00983
G1 X131.432 Y84.51 E.75358
G3 X131.934 Y84.556 I-.683 J10.221 E.01272
G1 X110.628 Y105.863 E.76063
G1 X110.932 Y106.106 E.00984
G1 X132.433 Y84.605 E.76757
G3 X132.924 Y84.662 I-.91 J10.033 E.01248
G1 X111.236 Y106.35 E.77424
G1 X111.54 Y106.593 E.00984
G1 X133.411 Y84.722 E.78078
G3 X133.892 Y84.789 I-1.114 J9.822 E.01226
G1 X113.457 Y105.223 E.72951
G3 X115.013 Y104.215 I11.043 J15.337 E.04682
G1 X134.369 Y84.859 E.69099
G3 X134.841 Y84.935 I-1.309 J9.665 E.01207
G1 X116.263 Y103.513 E.66324
G1 X117.339 Y102.985 E.03028
G1 X135.308 Y85.016 E.64147
G3 X135.771 Y85.1 I-1.48 J9.457 E.01189
G1 X118.308 Y102.564 E.62344
G3 X119.204 Y102.215 I3.999 J8.953 E.02429
G1 X136.228 Y85.191 E.60774
G3 X136.683 Y85.283 I-1.658 J9.369 E.01173
G1 X120.049 Y101.917 E.59383
G1 X120.851 Y101.663 E.02123
G1 X137.13 Y85.384 E.58117
G1 X137.578 Y85.484 E.01157
G1 X121.6 Y101.461 E.57038
G3 X122.331 Y101.279 I2.221 J7.336 E.019
G1 X138.016 Y85.593 E.55998
G1 X138.454 Y85.703 E.0114
G1 X123.025 Y101.132 E.55081
G3 X123.698 Y101.007 I1.611 J6.791 E.01728
G1 X138.886 Y85.818 E.54222
G1 X139.315 Y85.937 E.01123
G1 X124.351 Y100.902 E.53424
G3 X124.98 Y100.82 I1.145 J6.367 E.01602
G1 X139.741 Y86.059 E.52698
G1 X140.161 Y86.186 E.01108
G1 X125.596 Y100.752 E.51999
G3 X126.191 Y100.704 I.785 J6.04 E.01509
G1 X140.581 Y86.314 E.51373
G1 X140.993 Y86.45 E.01094
G1 X126.775 Y100.668 E.50759
G3 X127.347 Y100.643 I.622 J7.762 E.01446
G1 X141.405 Y86.586 E.50185
G3 X141.811 Y86.727 I-2.685 J8.359 E.01086
G1 X127.901 Y100.637 E.49659
G1 X128.442 Y100.644 E.01366
G1 X142.214 Y86.871 E.49168
G3 X142.615 Y87.018 I-2.781 J8.232 E.01078
G1 X128.98 Y100.653 E.48676
G1 X129.496 Y100.685 E.01305
G1 X143.01 Y87.17 E.48245
G1 X143.406 Y87.323 E.01069
G1 X130.012 Y100.716 E.47814
G3 X130.512 Y100.764 I-.231 J5.112 E.01269
G1 X143.794 Y87.482 E.47415
G1 X144.181 Y87.643 E.01058
G1 X131.005 Y100.818 E.47037
G3 X131.495 Y100.877 I-.349 J5.01 E.01244
G1 X144.565 Y87.806 E.46661
G1 X144.944 Y87.975 E.01048
G1 X131.966 Y100.953 E.46331
G1 X132.438 Y101.029 E.01206
G1 X145.324 Y88.143 E.46002
G3 X145.696 Y88.318 I-3.358 J7.598 E.01039
G1 X132.899 Y101.116 E.45686
G1 X133.351 Y101.211 E.01166
G1 X146.068 Y88.494 E.454
G3 X146.436 Y88.674 I-3.466 J7.579 E.01034
G1 X133.803 Y101.307 E.45101
G3 X134.238 Y101.419 I-.921 J4.493 E.01136
G1 X146.8 Y88.857 E.44845
G1 X147.164 Y89.04 E.01029
G1 X134.672 Y101.533 E.44599
G3 X135.104 Y101.649 I-.957 J4.432 E.01129
G1 X147.521 Y89.231 E.44332
G1 X147.878 Y89.422 E.01021
G1 X135.519 Y101.781 E.44121
G1 X135.935 Y101.912 E.01101
G1 X148.232 Y89.616 E.43899
G1 X148.582 Y89.814 E.01014
G1 X136.347 Y102.048 E.43677
G1 X136.746 Y102.197 E.01074
G1 X148.931 Y90.012 E.43501
G3 X149.274 Y90.216 I-3.946 J7.008 E.01008
G1 X137.145 Y102.346 E.43302
G3 X137.54 Y102.498 I-1.375 J4.171 E.0107
G1 X149.617 Y90.421 E.43112
G3 X149.957 Y90.629 I-4.06 J7.027 E.01006
G1 X137.923 Y102.662 E.42958
G1 X138.307 Y102.827 E.01053
G1 X150.292 Y90.841 E.42787
G1 X150.627 Y91.054 E.01002
G1 X138.685 Y102.996 E.42634
G1 X139.053 Y103.176 E.01034
G1 X150.957 Y91.272 E.42498
G1 X151.285 Y91.491 E.00997
G1 X139.421 Y103.355 E.42356
G3 X139.785 Y103.539 I-1.69 J3.795 E.01029
G1 X151.612 Y91.712 E.42225
G1 X151.934 Y91.938 E.00992
G1 X140.138 Y103.734 E.42111
G1 X140.491 Y103.928 E.01018
G1 X152.255 Y92.164 E.41997
G3 X152.572 Y92.394 I-4.541 J6.589 E.0099
G1 X140.841 Y104.125 E.41879
G1 X141.18 Y104.334 E.01005
G1 X152.887 Y92.628 E.41792
G1 X153.201 Y92.861 E.00988
G1 X141.519 Y104.543 E.41705
G3 X141.857 Y104.753 I-1.972 J3.553 E.01004
G1 X153.509 Y93.101 E.41597
G1 X153.816 Y93.341 E.00985
G1 X142.182 Y104.976 E.41536
G1 X142.506 Y105.198 E.00994
G1 X154.122 Y93.583 E.41466
G1 X154.422 Y93.83 E.00982
G1 X142.831 Y105.421 E.4138
G3 X143.146 Y105.654 I-2.998 J4.398 E.00989
G1 X154.723 Y94.077 E.41329
G3 X155.019 Y94.329 I-4.975 J6.145 E.00981
G1 X143.458 Y105.89 E.41274
G1 X143.762 Y106.134 E.00983
G1 X155.313 Y94.582 E.41237
G3 X155.606 Y94.837 I-4.985 J6.047 E.0098
G1 X144.066 Y106.377 E.41199
G3 X144.368 Y106.622 I-2.344 J3.201 E.00983
G1 X155.894 Y95.097 E.41144
G1 X156.181 Y95.357 E.00979
G1 X144.659 Y106.879 E.41132
G1 X144.95 Y107.136 E.00979
G1 X156.465 Y95.621 E.41109
G1 X156.746 Y95.888 E.00978
G1 X145.24 Y107.393 E.41073
G3 X145.519 Y107.662 I-2.596 J2.961 E.00978
G1 X157.026 Y96.155 E.41081
G3 X157.301 Y96.428 I-5.433 J5.755 E.00978
G1 X145.796 Y107.933 E.41073
G1 X146.073 Y108.203 E.00978
G1 X157.575 Y96.701 E.41061
G3 X157.848 Y96.976 I-5.457 J5.679 E.00978
G1 X146.341 Y108.483 E.41079
G1 X146.605 Y108.767 E.00978
G1 X158.115 Y97.257 E.41091
G1 X158.382 Y97.538 E.00978
G1 X146.868 Y109.051 E.41103
G3 X147.125 Y109.341 I-2.829 J2.764 E.0098
G1 X158.645 Y97.822 E.41125
G1 X158.905 Y98.109 E.00979
G1 X147.376 Y109.639 E.41161
G1 X147.626 Y109.936 E.00981
G1 X159.166 Y98.396 E.41197
G3 X159.42 Y98.69 I-5.902 J5.369 E.0098
G1 X147.872 Y110.238 E.41225
G1 X148.109 Y110.549 E.00986
G1 X159.674 Y98.984 E.41286
G3 X159.925 Y99.28 I-5.897 J5.271 E.00981
G1 X148.345 Y110.86 E.4134
G3 X148.581 Y111.172 I-3.041 J2.536 E.00988
G1 X160.172 Y99.58 E.41381
G1 X160.419 Y99.881 E.00982
G1 X148.804 Y111.497 E.41467
G1 X149.026 Y111.821 E.00994
G1 X160.661 Y100.186 E.41537
G1 X160.902 Y100.494 E.00985
G1 X149.249 Y112.146 E.41598
G3 X149.459 Y112.484 I-3.319 J2.293 E.01004
G1 X161.141 Y100.802 E.41706
G1 X161.374 Y101.116 E.00988
G1 X149.668 Y112.823 E.41793
G1 X149.876 Y113.162 E.01005
G1 X161.608 Y101.431 E.4188
G3 X161.838 Y101.748 I-6.333 J4.837 E.0099
G1 X150.074 Y113.512 E.41998
G1 X150.268 Y113.866 E.01018
G1 X162.064 Y102.069 E.42112
G1 X162.291 Y102.391 E.00992
G1 X150.462 Y114.219 E.42226
G3 X150.646 Y114.583 I-3.61 J2.051 E.01029
G1 X162.511 Y102.718 E.42357
G1 X162.73 Y103.046 E.00997
G1 X150.826 Y114.951 E.42499
G1 X151.005 Y115.319 E.01034
G1 X162.948 Y103.376 E.42635
G1 X163.16 Y103.711 E.01002
G1 X151.175 Y115.697 E.42789
G1 X151.339 Y116.08 E.01053
G1 X163.373 Y104.047 E.4296
G3 X163.58 Y104.387 I-6.816 J4.395 E.01006
G1 X151.503 Y116.464 E.43115
G3 X151.657 Y116.858 I-3.943 J1.759 E.01069
G1 X163.786 Y104.729 E.43301
G3 X163.99 Y105.072 I-6.843 J4.31 E.01008
G1 X151.805 Y117.257 E.43501
G1 X151.953 Y117.657 E.01075
G1 X164.188 Y105.422 E.43678
G1 X164.386 Y105.771 E.01014
G1 X152.089 Y118.069 E.43901
G1 X152.221 Y118.485 E.01101
G1 X164.58 Y106.125 E.44123
G1 X164.771 Y106.482 E.01021
G1 X152.352 Y118.9 E.44334
G3 X152.468 Y119.332 I-4.351 J1.397 E.01129
G1 X164.961 Y106.839 E.44601
G1 X165.145 Y107.203 E.01029
G1 X152.582 Y119.766 E.44848
G3 X152.694 Y120.202 I-4.378 J1.353 E.01137
G1 X165.328 Y107.568 E.45104
G3 X165.508 Y107.936 I-7.413 J3.839 E.01034
G1 X152.79 Y120.654 E.45403
G1 X152.885 Y121.106 E.01166
G1 X165.683 Y108.308 E.45689
G3 X165.859 Y108.68 I-7.593 J3.808 E.01039
G1 X152.972 Y121.566 E.46005
G1 X153.048 Y122.038 E.01206
G1 X166.027 Y109.059 E.46334
G1 X166.195 Y109.439 E.01048
G1 X153.124 Y122.51 E.46664
G3 X153.182 Y122.999 I-4.958 J.837 E.01245
G1 X166.359 Y109.823 E.47041
G1 X166.519 Y110.21 E.01058
G1 X153.237 Y123.492 E.47418
G3 X153.284 Y123.993 I-5.064 J.729 E.0127
G1 X166.679 Y110.598 E.47818
G1 X166.831 Y110.993 E.01069
G1 X153.316 Y124.509 E.48249
G1 X153.347 Y125.025 E.01305
G1 X166.983 Y111.389 E.4868
G3 X167.13 Y111.79 I-8.101 J3.186 E.01078
G1 X153.356 Y125.564 E.49172
G1 X153.363 Y126.105 E.01366
G1 X167.274 Y112.193 E.49664
G3 X167.416 Y112.599 I-8.196 J3.081 E.01086
G1 X153.352 Y126.663 E.50206
G1 X153.331 Y127.231 E.01436
G1 X167.552 Y113.011 E.50766
G1 X167.688 Y113.422 E.01094
G1 X153.297 Y127.813 E.51374
G1 X153.246 Y128.412 E.01518
G1 X167.815 Y113.843 E.52013
G1 X167.943 Y114.263 E.01108
G1 X153.182 Y129.024 E.52697
G1 X153.095 Y129.657 E.01614
G1 X168.064 Y114.689 E.53438
G1 X168.183 Y115.118 E.01123
G1 X152.993 Y130.307 E.54227
G1 X152.868 Y130.98 E.01728
G1 X168.298 Y115.55 E.55086
G1 X168.408 Y115.988 E.0114
G1 X152.716 Y131.68 E.56021
G1 X152.545 Y132.398 E.01863
G1 X168.517 Y116.427 E.57018
G1 X168.617 Y116.874 E.01157
G1 X152.327 Y133.164 E.58157
G3 X152.08 Y133.958 I-8.188 J-2.105 E.02099
G1 X168.718 Y117.321 E.59395
G3 X168.81 Y117.777 I-9.238 J2.104 E.01173
G1 X151.793 Y134.793 E.60749
G3 X151.432 Y135.702 I-9.456 J-3.229 E.02468
G1 X168.901 Y118.233 E.62361
G3 X168.985 Y118.697 I-9.357 J1.938 E.01189
G1 X151.001 Y136.681 E.64202
G3 X150.467 Y137.762 I-11.276 J-4.895 E.03047
G1 X169.066 Y119.164 E.66398
G3 X169.141 Y119.636 I-9.574 J1.776 E.01207
G1 X149.774 Y139.003 E.69142
G3 X148.917 Y140.351 I-14.147 J-8.041 E.04032
G1 X148.771 Y140.553 E.0063
G1 X169.212 Y120.112 E.72973
G3 X169.279 Y120.594 I-9.762 J1.594 E.01226
G1 X122.594 Y167.279 E1.66664
G1 X123.081 Y167.339 E.0124
G1 X169.339 Y121.081 E1.65138
G3 X169.395 Y121.572 I-9.992 J1.4 E.01248
G1 X123.572 Y167.395 E1.63587
G1 X124.071 Y167.444 E.01265
G1 X169.444 Y122.071 E1.61982
G3 X169.49 Y122.572 I-10.19 J1.183 E.01272
G1 X124.572 Y167.49 E1.60355
G1 X125.082 Y167.528 E.01291
G1 X169.528 Y123.082 E1.58668
G3 X169.562 Y123.596 I-10.473 J.956 E.01299
G1 X125.596 Y167.562 E1.56958
G1 X126.118 Y167.588 E.01319
G1 X169.588 Y124.118 E1.55186
G3 X169.609 Y124.644 I-10.713 J.701 E.01329
G1 X126.644 Y167.609 E1.53384
G1 X127.178 Y167.622 E.0135
G1 X169.622 Y125.178 E1.51523
G3 X169.63 Y125.718 I-11.02 J.426 E.01363
G1 X127.718 Y167.63 E1.49623
G1 X128.266 Y167.63 E.01382
G1 X169.63 Y126.266 E1.47668
G3 X169.622 Y126.821 I-11.291 J.122 E.01402
G1 X128.821 Y167.622 E1.45658
G1 X129.383 Y167.608 E.01418
G1 X169.608 Y127.383 E1.43605
G3 X169.584 Y127.955 I-11.684 J-.212 E.01446
G1 X129.955 Y167.584 E1.41475
G1 X130.531 Y167.556 E.01456
G1 X169.556 Y128.531 E1.39318
G3 X169.513 Y129.121 I-11.958 J-.575 E.01495
G1 X131.121 Y167.513 E1.37056
G2 X131.716 Y167.465 I-.671 J-12.166 E.01507
G1 X169.465 Y129.716 E1.34762
G1 X169.405 Y130.324 E.01541
G1 X132.324 Y167.405 E1.3238
G2 X132.941 Y167.336 I-1.106 J-12.589 E.01568
M73 P79 R9
G1 X169.336 Y130.941 E1.29928
G1 X169.259 Y131.566 E.01589
G1 X133.566 Y167.259 E1.27423
G2 X134.208 Y167.165 I-1.589 J-13.047 E.01638
G1 X169.165 Y132.208 E1.24795
G3 X169.062 Y132.858 I-13.29 J-1.764 E.01662
G1 X134.858 Y167.062 E1.22108
G1 X135.52 Y166.947 E.01698
G1 X168.947 Y133.52 E1.19332
G3 X168.814 Y134.201 I-13.896 J-2.359 E.0175
G1 X136.201 Y166.814 E1.16428
G2 X136.893 Y166.67 I-2.6 J-14.175 E.01785
G1 X168.67 Y134.893 E1.13441
G1 X168.511 Y135.599 E.01827
G1 X137.599 Y166.511 E1.10353
G2 X138.329 Y166.329 I-3.356 J-14.99 E.01899
G1 X168.329 Y136.329 E1.07097
G3 X168.129 Y137.076 I-15.261 J-3.672 E.01952
G1 X139.076 Y166.129 E1.03719
G2 X139.842 Y165.911 I-4.072 J-15.726 E.02012
G1 X167.911 Y137.842 E1.00203
G3 X167.67 Y138.631 I-16.248 J-4.53 E.02081
G1 X140.631 Y165.67 E.96529
G1 X141.449 Y165.4 E.02174
G1 X167.4 Y139.449 E.92645
G3 X167.099 Y140.297 I-17.375 J-5.686 E.02274
G1 X142.297 Y165.099 E.88541
G2 X143.179 Y164.764 I-6.379 J-18.155 E.02381
G1 X166.764 Y141.179 E.84198
G3 X166.391 Y142.101 I-18.97 J-7.157 E.0251
G1 X144.101 Y164.391 E.79575
G2 X145.068 Y163.971 I-8.089 J-19.955 E.02664
G1 X165.971 Y143.068 E.7462
G3 X165.494 Y144.092 I-21.092 J-9.188 E.02851
G1 X146.092 Y163.494 E.69264
G2 X147.185 Y162.949 I-37.748 J-77.015 E.03084
G1 X164.949 Y145.185 E.63414
G3 X164.299 Y146.383 I-24.717 J-12.64 E.0344
G1 X148.383 Y162.299 E.56818
G2 X149.702 Y161.527 I-15.052 J-27.247 E.03859
G1 X163.527 Y147.702 E.49354
G3 X162.544 Y149.233 I-39.745 J-24.447 E.04593
G1 X151.233 Y160.544 E.40378
G2 X153.141 Y159.184 I-24.789 J-36.787 E.05915
G1 X161.184 Y151.141 E.28712
G3 X157.822 Y155.051 I-32.941 J-24.926 E.13025
G1 X154.732 Y158.14 E.11029
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11621
G1 X156.146 Y156.726 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/58
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.24 I.103 J-1.213 P1  F30000
G1 X127.653 Y154.303 Z5.24
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.958 Y154.293 E.01885
G3 X103.56 Y111.705 I1.041 J-28.293 E1.5829
G1 X104.332 Y112.323 E.0268
G2 X109.469 Y105.904 I23.665 J13.675 E4.42982
G1 X108.697 Y105.286 E.0268
G3 X128.36 Y97.689 I19.314 J20.745 E.58525
G3 X128.347 Y154.31 I-.361 J28.31 E2.39095
G1 X127.713 Y154.303 E.01717
; WIPE_START
G1 X126.958 Y154.293 E-.2872
G1 X126.264 Y154.26 E-.26385
G1 X125.716 Y154.213 E-.20895
; WIPE_END
G1 E-.04 F1800
G1 X126.631 Y161.79 Z5.4 F30000
G1 X127.475 Y168.784 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X92.402 Y102.262 I.528 J-42.785 E2.30914
G1 X107.005 Y113.949 E.47023
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G2 X111.641 Y108.156 I20.993 J12.05 E3.6364
G1 X97.039 Y96.469 E.47023
G3 X128.541 Y83.214 I30.96 J29.518 E.88395
G3 X127.535 Y168.784 I-.539 J42.785 E3.3778
; WIPE_START
M204 S10000
G1 X126.425 Y168.761 E-.42194
G1 X125.537 Y168.717 E-.33806
; WIPE_END
G1 E-.04 F1800
G1 X122.801 Y161.592 Z5.4 F30000
G1 X103.842 Y112.197 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.595188
G1 F8023.512
G1 X103.301 Y113.185 E.0412
G1 X102.702 Y114.413 E.04994
G1 X102.164 Y115.668 E.04993
G1 X101.688 Y116.948 E.04993
G1 X101.276 Y118.251 E.04995
G1 X100.928 Y119.571 E.04991
G1 X100.645 Y120.907 E.04994
G1 X100.428 Y122.255 E.04992
G1 X100.278 Y123.613 E.04994
G1 X100.194 Y124.976 E.04993
G1 X100.177 Y126.341 E.04991
G1 X100.227 Y127.703 E.04981
G1 X100.344 Y129.063 E.04993
G1 X100.429 Y129.748 E.02523
G1 X100.645 Y131.093 E.0498
G1 X100.928 Y132.43 E.04996
G1 X101.276 Y133.75 E.04991
G1 X101.688 Y135.049 E.04983
G1 X102.163 Y136.329 E.04993
G1 X102.427 Y136.966 E.02521
G1 X102.994 Y138.205 E.04981
G1 X103.624 Y139.417 E.04995
G1 X104.316 Y140.604 E.05024
G1 X105.056 Y141.741 E.0496
G1 X105.856 Y142.848 E.04993
G1 X106.709 Y143.915 E.04995
G1 X107.614 Y144.938 E.04993
G1 X108.566 Y145.913 E.04982
G1 X109.566 Y146.843 E.04994
G1 X110.088 Y147.293 E.02521
G1 X111.152 Y148.144 E.0498
G1 X112.259 Y148.944 E.04994
G1 X113.403 Y149.689 E.04991
G1 X114.584 Y150.377 E.04996
G1 X115.796 Y151.006 E.04993
G1 X117.035 Y151.573 E.04982
G1 X118.305 Y152.081 E.05002
G1 X119.593 Y152.525 E.04982
G1 X120.254 Y152.725 E.02525
M73 P79 R8
G1 X121.574 Y153.073 E.0499
G1 X122.907 Y153.355 E.04981
G1 X124.255 Y153.572 E.04994
G1 X125.613 Y153.722 E.04993
G1 X126.976 Y153.806 E.04992
G1 X128.341 Y153.823 E.04993
G1 X129.706 Y153.773 E.04994
G1 X131.067 Y153.655 E.04995
G1 X132.418 Y153.472 E.04983
G1 X133.763 Y153.222 E.05003
G1 X135.088 Y152.907 E.04981
G1 X136.4 Y152.527 E.04993
G1 X137.055 Y152.31 E.02523
G1 X138.332 Y151.836 E.04979
G1 X139.587 Y151.298 E.04993
G1 X140.815 Y150.698 E.04997
G1 X142.011 Y150.04 E.04992
G1 X143.174 Y149.323 E.04993
G1 X144.3 Y148.551 E.04991
G1 X145.386 Y147.724 E.04991
G1 X146.429 Y146.847 E.04983
G1 X146.941 Y146.383 E.02525
G1 X147.918 Y145.43 E.04991
G1 X148.845 Y144.431 E.04982
G1 X149.724 Y143.386 E.04994
G1 X150.551 Y142.3 E.04991
G1 X151.322 Y141.177 E.0498
G1 X152.038 Y140.014 E.04994
G1 X152.379 Y139.413 E.02523
G1 X153.006 Y138.204 E.04979
G1 X153.574 Y136.963 E.04993
G1 X154.081 Y135.695 E.04993
G1 X154.526 Y134.403 E.04994
G1 X154.906 Y133.091 E.04993
G1 X155.222 Y131.763 E.04993
G1 X155.472 Y130.42 E.04993
G1 X155.655 Y129.069 E.04984
G1 X155.773 Y127.706 E.05004
G1 X155.823 Y126.344 E.04981
G1 X155.806 Y124.979 E.04992
G1 X155.772 Y124.29 E.02521
G1 X155.655 Y122.933 E.04982
G1 X155.471 Y121.579 E.04996
G1 X155.221 Y120.236 E.04993
G1 X154.906 Y118.908 E.04991
G1 X154.526 Y117.597 E.04991
G1 X154.081 Y116.305 E.04995
G1 X153.574 Y115.037 E.04992
G1 X153.007 Y113.798 E.04983
G1 X152.377 Y112.583 E.05004
G1 X151.691 Y111.406 E.04981
G1 X150.946 Y110.261 E.04994
G1 X150.549 Y109.697 E.02522
G1 X149.725 Y108.614 E.04977
G1 X148.845 Y107.569 E.04995
G1 X147.915 Y106.568 E.04994
G1 X146.938 Y105.614 E.04995
G1 X145.914 Y104.709 E.04994
G1 X144.851 Y103.858 E.04981
G1 X143.744 Y103.058 E.04992
G1 X143.17 Y102.674 E.02523
G1 X142.01 Y101.96 E.04982
G1 X140.814 Y101.301 E.04992
G1 X139.586 Y100.702 E.04995
G1 X138.332 Y100.165 E.04988
G1 X137.052 Y99.688 E.04996
G1 X135.749 Y99.276 E.04995
G1 X134.429 Y98.928 E.04991
G1 X133.096 Y98.646 E.04982
G1 X131.745 Y98.428 E.05006
G1 X130.391 Y98.278 E.04978
G1 X129.027 Y98.194 E.04996
G1 X128.338 Y98.177 E.02523
G1 X126.976 Y98.194 E.04979
G1 X125.613 Y98.278 E.04993
G1 X124.255 Y98.428 E.04993
G1 X122.91 Y98.645 E.04983
G1 X121.574 Y98.927 E.04993
G1 X120.905 Y99.095 E.02521
G1 X119.597 Y99.474 E.04981
G1 X118.305 Y99.919 E.04993
G1 X117.038 Y100.425 E.04991
G1 X115.796 Y100.994 E.04994
G1 X114.582 Y101.624 E.04997
G1 X113.403 Y102.311 E.04991
G1 X112.258 Y103.056 E.04994
G1 X111.151 Y103.856 E.04995
G1 X110.085 Y104.71 E.04991
G1 X109.239 Y105.454 E.04119
; WIPE_START
G1 X110.085 Y104.71 E-.42815
G1 X110.767 Y104.164 E-.33185
; WIPE_END
G1 E-.04 F1800
G1 X118.399 Y104.168 Z5.4 F30000
G1 X144.089 Y104.184 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X149.816 Y109.911 E.20363
M204 S10000
G1 X150.978 Y111.618 F30000
G1 F11668.197
M204 S2000
G1 X142.382 Y103.022 E.30561
M204 S10000
G1 X141.057 Y102.242 F30000
G1 F11668.197
M204 S2000
G1 X151.757 Y112.943 E.38045
M204 S10000
G1 X152.346 Y114.077 F30000
G1 F11668.197
M204 S2000
G1 X139.923 Y101.654 E.4417
G1 X138.908 Y101.184
G1 X152.816 Y115.092 E.49451
G1 X153.208 Y116.03
G1 X137.97 Y100.792 E.5418
G1 X137.098 Y100.465
G1 X153.535 Y116.902 E.58442
G1 X153.816 Y117.728
G1 X147.821 Y111.733 E.21314
; WIPE_START
M204 S10000
G1 X149.235 Y113.147 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.883 Y113.341 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X154.054 Y118.512 E.18384
G1 X154.257 Y119.26
G1 X149.596 Y114.599 E.16571
G1 X150.134 Y115.683
G1 X154.43 Y119.979 E.15275
G1 X154.579 Y120.673
G1 X150.562 Y116.656 E.14283
G1 X150.914 Y117.553
G1 X154.705 Y121.344 E.13477
G1 X154.81 Y121.995
G1 X151.204 Y118.388 E.12821
G1 X151.45 Y119.181
G1 X154.897 Y122.627 E.12253
G1 X154.967 Y123.242
G1 X151.654 Y119.93 E.11779
G1 X151.826 Y120.647
G1 X155.022 Y123.843 E.11362
G1 X155.063 Y124.429
G1 X151.971 Y121.338 E.10992
G1 X152.092 Y122.003
G1 X155.091 Y125.003 E.10664
G1 X155.105 Y125.562
G1 X152.19 Y122.647 E.10363
G1 X152.269 Y123.271
G1 X155.107 Y126.11 E.10093
G1 X155.1 Y126.648
G1 X152.329 Y123.877 E.0985
G1 X152.374 Y124.467
G1 X155.082 Y127.176 E.09631
G1 X155.056 Y127.695
G1 X152.403 Y125.041 E.09434
G1 X152.418 Y125.602
G1 X155.019 Y128.203 E.09247
G1 X154.972 Y128.702
G1 X152.42 Y126.15 E.09074
G1 X152.411 Y126.686
G1 X154.919 Y129.194 E.08918
G1 X154.858 Y129.679
G1 X152.39 Y127.211 E.08775
G1 X152.359 Y127.725
G1 X154.788 Y130.154 E.08635
G1 X154.711 Y130.622
G1 X152.319 Y128.23 E.08504
G1 X152.269 Y128.726
G1 X154.627 Y131.084 E.08384
G1 X154.537 Y131.539
G1 X152.209 Y129.211 E.08276
G1 X152.14 Y129.688
G1 X154.438 Y131.986 E.0817
G1 X154.335 Y132.428
G1 X152.064 Y130.157 E.08074
G1 X151.98 Y130.618
G1 X154.226 Y132.864 E.07984
G1 X154.108 Y133.292
G1 X151.889 Y131.073 E.0789
G1 X151.789 Y131.518
G1 X153.987 Y133.716 E.07813
G1 X153.86 Y134.134
G1 X151.683 Y131.957 E.07741
M73 P80 R8
G1 X151.57 Y132.39
G1 X153.725 Y134.545 E.07664
G1 X153.587 Y134.952
G1 X151.451 Y132.817 E.07594
G1 X151.324 Y133.235
G1 X153.443 Y135.354 E.07534
G1 X153.293 Y135.749
G1 X151.192 Y133.648 E.07472
G1 X151.054 Y134.056
G1 X153.14 Y136.142 E.07417
G1 X152.98 Y136.527
G1 X150.91 Y134.457 E.0736
G1 X150.76 Y134.852
G1 X152.816 Y136.908 E.07311
G1 X152.648 Y137.286
G1 X150.604 Y135.242 E.07268
G1 X150.444 Y135.627
G1 X152.473 Y137.656 E.07214
G1 X152.295 Y138.024
G1 X150.277 Y136.005 E.07177
G1 X150.105 Y136.379
G1 X152.113 Y138.387 E.07139
G1 X151.925 Y138.744
G1 X149.929 Y136.748 E.07096
G1 X149.747 Y137.111
G1 X151.734 Y139.099 E.07068
G1 X151.537 Y139.447
G1 X149.559 Y137.469 E.07032
G1 X149.368 Y137.824
G1 X151.337 Y139.792 E.06999
G1 X151.133 Y140.133
G1 X149.171 Y138.172 E.06974
G1 X148.969 Y138.516
G1 X150.923 Y140.469 E.06946
G1 X150.711 Y140.803
G1 X148.764 Y138.856 E.06923
G1 X148.553 Y139.19
G1 X150.493 Y141.13 E.06898
G1 X150.272 Y141.454
G1 X148.337 Y139.519 E.06879
G1 X148.118 Y139.846
G1 X150.046 Y141.774 E.06857
G1 X149.816 Y142.09
G1 X147.892 Y140.166 E.0684
G1 X147.663 Y140.482
G1 X149.584 Y142.403 E.0683
G1 X149.345 Y142.709
G1 X147.431 Y140.795 E.06807
G1 X147.192 Y141.101
G1 X149.104 Y143.014 E.06801
G1 X148.859 Y143.313
G1 X146.949 Y141.404 E.06789
G1 X146.703 Y141.704
G1 X148.609 Y143.609 E.06776
G1 X148.357 Y143.902
G1 X146.451 Y141.997 E.06774
G1 X146.196 Y142.287
G1 X148.098 Y144.19 E.06764
G1 X147.839 Y144.475
G1 X145.937 Y142.573 E.06762
G1 X145.672 Y142.854
G1 X147.573 Y144.755 E.06758
G1 X147.304 Y145.032
G1 X145.404 Y143.131 E.06756
G1 X145.131 Y143.404
G1 X147.031 Y145.304 E.06756
G1 X146.754 Y145.573
G1 X144.854 Y143.672 E.06758
G1 X144.573 Y143.937
G1 X146.475 Y145.839 E.06762
G1 X146.19 Y146.099
G1 X144.287 Y144.196 E.06764
G1 X143.997 Y144.451
G1 X145.902 Y146.357 E.06774
G1 X145.609 Y146.609
G1 X143.704 Y144.703 E.06776
G1 X143.404 Y144.949
G1 X145.313 Y146.859 E.06789
G1 X145.014 Y147.104
G1 X143.101 Y145.192 E.06801
G1 X142.795 Y145.431
G1 X144.709 Y147.345 E.06807
G1 X144.403 Y147.584
G1 X142.482 Y145.663 E.0683
G1 X142.166 Y145.892
G1 X144.089 Y147.816 E.06841
G1 X143.774 Y148.046
G1 X141.845 Y146.118 E.06857
G1 X141.519 Y146.337
G1 X143.454 Y148.272 E.06879
G1 X143.13 Y148.493
G1 X141.189 Y146.553 E.06898
G1 X140.855 Y146.764
G1 X142.803 Y148.711 E.06924
G1 X142.469 Y148.923
G1 X140.515 Y146.969 E.06946
G1 X140.172 Y147.171
G1 X142.133 Y149.133 E.06974
G1 X141.792 Y149.337
G1 X139.824 Y147.368 E.06999
G1 X139.469 Y147.559
G1 X141.447 Y149.537 E.07032
G1 X141.099 Y149.734
G1 X139.111 Y147.747 E.07068
G1 X138.748 Y147.929
G1 X140.744 Y149.925 E.07096
G1 X140.387 Y150.113
G1 X138.379 Y148.105 E.07139
G1 X138.005 Y148.277
G1 X140.024 Y150.296 E.07177
G1 X139.656 Y150.473
G1 X137.627 Y148.444 E.07214
G1 X137.242 Y148.604
G1 X139.286 Y150.649 E.07268
G1 X138.908 Y150.816
G1 X136.852 Y148.76 E.07311
G1 X136.457 Y148.91
G1 X138.527 Y150.98 E.0736
G1 X138.141 Y151.14
G1 X136.055 Y149.054 E.07417
G1 X135.648 Y149.192
G1 X137.749 Y151.294 E.07473
G1 X137.354 Y151.444
G1 X135.235 Y149.324 E.07534
G1 X134.816 Y149.451
G1 X136.952 Y151.587 E.07594
G1 X136.545 Y151.725
G1 X134.39 Y149.57 E.07664
G1 X133.957 Y149.683
G1 X136.134 Y151.86 E.07741
G1 X135.716 Y151.987
G1 X133.518 Y149.789 E.07813
G1 X133.072 Y149.889
G1 X135.292 Y152.108 E.07891
G1 X134.864 Y152.226
G1 X132.618 Y149.98 E.07984
G1 X132.157 Y150.064
G1 X134.428 Y152.335 E.08074
G1 X133.986 Y152.438
G1 X131.688 Y150.14 E.0817
G1 X131.211 Y150.209
G1 X133.539 Y152.537 E.08276
G1 X133.084 Y152.627
G1 X130.726 Y150.269 E.08384
G1 X130.23 Y150.319
G1 X132.622 Y152.711 E.08504
G1 X132.154 Y152.788
G1 X129.725 Y150.359 E.08635
G1 X129.21 Y150.39
G1 X131.679 Y152.858 E.08775
G1 X131.194 Y152.919
G1 X128.686 Y150.411 E.08918
G1 X128.15 Y150.42
G1 X130.702 Y152.972 E.09074
G1 X130.203 Y153.019
G1 X127.602 Y150.418 E.09247
G1 X127.041 Y150.403
G1 X129.695 Y153.056 E.09434
G1 X129.176 Y153.082
G1 X126.467 Y150.374 E.09631
G1 X125.877 Y150.329
G1 X128.647 Y153.1 E.0985
G1 X128.11 Y153.107
G1 X125.271 Y150.269 E.10093
G1 X124.647 Y150.19
G1 X127.562 Y153.105 E.10363
G1 X127.003 Y153.091
G1 X124.003 Y150.092 E.10665
G1 X123.337 Y149.971
G1 X126.429 Y153.063 E.10993
G1 X125.843 Y153.022
G1 X122.647 Y149.826 E.11362
G1 X121.93 Y149.654
G1 X125.242 Y152.967 E.11779
G1 X124.627 Y152.897
G1 X121.18 Y149.45 E.12254
G1 X120.388 Y149.204
G1 X123.994 Y152.81 E.12822
G1 X123.344 Y152.705
G1 X119.553 Y148.914 E.13477
G1 X118.655 Y148.562
G1 X122.672 Y152.579 E.14283
G1 X121.979 Y152.43
G1 X117.682 Y148.134 E.15276
G1 X116.599 Y147.596
G1 X121.259 Y152.256 E.16572
G1 X120.511 Y152.054
G1 X115.341 Y146.883 E.18385
; WIPE_START
M204 S10000
G1 X116.755 Y148.297 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.733 Y145.821 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X119.728 Y151.815 E.21314
; WIPE_START
M204 S10000
G1 X118.313 Y150.401 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.948 Y143.69 Z5.4 F30000
G1 X142.267 Y106.179 Z5.4
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X136.272 Y100.184 E.21313
G1 X135.488 Y99.946
G1 X140.659 Y105.117 E.18384
; WIPE_START
M204 S10000
G1 X139.245 Y103.702 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.401 Y104.404 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X134.74 Y99.743 E.16571
G1 X134.021 Y99.57
G1 X138.317 Y103.866 E.15275
G1 X137.344 Y103.438
G1 X133.327 Y99.421 E.14283
G1 X132.656 Y99.295
G1 X136.447 Y103.086 E.13477
G1 X135.611 Y102.796
G1 X132.005 Y99.19 E.12821
G1 X131.373 Y99.103
G1 X134.819 Y102.55 E.12254
G1 X134.07 Y102.346
G1 X130.757 Y99.033 E.11779
G1 X130.157 Y98.978
G1 X133.353 Y102.174 E.11362
G1 X132.662 Y102.029
G1 X129.571 Y98.937 E.10993
G1 X128.997 Y98.909
G1 X131.997 Y101.908 E.10665
G1 X131.353 Y101.81
G1 X128.438 Y98.895 E.10363
G1 X127.89 Y98.893
G1 X130.729 Y101.731 E.10093
G1 X130.123 Y101.671
G1 X127.352 Y98.9 E.0985
G1 X126.824 Y98.918
G1 X129.533 Y101.626 E.09631
G1 X128.959 Y101.597
G1 X126.305 Y98.944 E.09434
G1 X125.797 Y98.981
G1 X128.398 Y101.582 E.09247
G1 X127.85 Y101.58
G1 X125.298 Y99.028 E.09074
G1 X124.806 Y99.081
G1 X127.314 Y101.589 E.08918
G1 X126.789 Y101.61
G1 X124.321 Y99.142 E.08775
G1 X123.846 Y99.212
G1 X126.275 Y101.641 E.08635
G1 X125.77 Y101.681
G1 X123.378 Y99.289 E.08504
G1 X122.916 Y99.373
G1 X125.274 Y101.731 E.08384
G1 X124.789 Y101.791
G1 X122.461 Y99.463 E.08275
G1 X122.014 Y99.562
G1 X124.312 Y101.86 E.0817
G1 X123.843 Y101.936
G1 X121.572 Y99.665 E.08074
G1 X121.136 Y99.774
G1 X123.382 Y102.02 E.07984
G1 X122.927 Y102.111
G1 X120.708 Y99.892 E.0789
G1 X120.284 Y100.013
G1 X122.482 Y102.211 E.07813
G1 X122.043 Y102.317
G1 X119.866 Y100.14 E.07741
G1 X119.455 Y100.275
G1 X121.61 Y102.43 E.07664
G1 X121.183 Y102.549
G1 X119.048 Y100.413 E.07594
G1 X118.646 Y100.557
G1 X120.765 Y102.676 E.07534
G1 X120.352 Y102.808
G1 X118.25 Y100.707 E.07472
G1 X117.858 Y100.86
G1 X119.944 Y102.946 E.07417
G1 X119.543 Y103.09
G1 X117.473 Y101.02 E.0736
G1 X117.092 Y101.184
G1 X119.148 Y103.24 E.07311
G1 X118.758 Y103.396
G1 X116.714 Y101.352 E.07268
G1 X116.344 Y101.527
G1 X118.373 Y103.556 E.07214
G1 X117.995 Y103.723
G1 X115.976 Y101.704 E.07177
G1 X115.613 Y101.887
G1 X117.621 Y103.895 E.07139
G1 X117.252 Y104.071
G1 X115.256 Y102.075 E.07096
G1 X114.901 Y102.266
G1 X116.889 Y104.253 E.07068
G1 X116.531 Y104.441
G1 X114.553 Y102.463 E.07032
G1 X114.208 Y102.663
G1 X116.176 Y104.632 E.06999
G1 X115.828 Y104.829
G1 X113.867 Y102.867 E.06974
G1 X113.531 Y103.077
G1 X115.484 Y105.031 E.06946
G1 X115.144 Y105.236
G1 X113.197 Y103.289 E.06923
G1 X112.87 Y103.507
G1 X114.81 Y105.447 E.06898
G1 X114.481 Y105.663
G1 X112.546 Y103.728 E.06879
G1 X112.226 Y103.954
G1 X114.154 Y105.882 E.06857
G1 X113.834 Y106.108
G1 X111.91 Y104.184 E.06841
G1 X111.597 Y104.416
G1 X113.518 Y106.337 E.0683
G1 X113.205 Y106.569
G1 X111.291 Y104.655 E.06807
G1 X110.986 Y104.896
G1 X112.899 Y106.808 E.06801
G1 X112.596 Y107.051
G1 X110.686 Y105.141 E.06789
G1 X110.391 Y105.391
G1 X112.296 Y107.297 E.06776
G1 X112.003 Y107.549
G1 X110.098 Y105.643 E.06774
G1 X109.81 Y105.902
G1 X111.713 Y107.804 E.06764
; WIPE_START
M204 S10000
G1 X110.299 Y106.39 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.684 Y112.47 Z5.4 F30000
G1 X105.357 Y112.901 Z5.4
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X106.632 Y114.176 E.04533
G1 X106.441 Y114.531
G1 X104.463 Y112.553 E.07032
G1 X104.266 Y112.901
G1 X106.253 Y114.889 E.07068
G1 X106.071 Y115.252
G1 X104.075 Y113.256 E.07096
G1 X103.887 Y113.613
G1 X105.895 Y115.621 E.07139
G1 X105.723 Y115.995
G1 X103.704 Y113.976 E.07177
G1 X103.527 Y114.344
G1 X105.556 Y116.373 E.07214
G1 X105.396 Y116.758
G1 X103.352 Y114.714 E.07268
G1 X103.184 Y115.092
G1 X105.24 Y117.148 E.07311
G1 X105.09 Y117.543
G1 X103.02 Y115.473 E.0736
G1 X102.86 Y115.859
G1 X104.946 Y117.945 E.07417
G1 X104.808 Y118.352
G1 X102.706 Y116.251 E.07472
G1 X102.556 Y116.646
G1 X104.676 Y118.765 E.07534
G1 X104.549 Y119.184
G1 X102.413 Y117.048 E.07594
G1 X102.275 Y117.455
G1 X104.43 Y119.61 E.07664
G1 X104.317 Y120.043
G1 X102.14 Y117.866 E.07741
G1 X102.013 Y118.284
G1 X104.211 Y120.482 E.07813
G1 X104.111 Y120.927
G1 X101.892 Y118.708 E.0789
G1 X101.774 Y119.136
G1 X104.02 Y121.382 E.07984
G1 X103.936 Y121.843
G1 X101.665 Y119.572 E.08074
G1 X101.562 Y120.014
G1 X103.859 Y122.312 E.0817
G1 X103.791 Y122.789
G1 X101.463 Y120.461 E.08276
G1 X101.373 Y120.916
G1 X103.731 Y123.274 E.08384
G1 X103.681 Y123.77
G1 X101.289 Y121.378 E.08504
G1 X101.212 Y121.846
G1 X103.641 Y124.275 E.08635
G1 X103.61 Y124.79
G1 X101.142 Y122.321 E.08775
G1 X101.081 Y122.806
G1 X103.589 Y125.314 E.08918
G1 X103.58 Y125.85
G1 X101.027 Y123.298 E.09074
G1 X100.981 Y123.797
G1 X103.582 Y126.398 E.09247
G1 X103.597 Y126.959
G1 X100.944 Y124.305 E.09434
G1 X100.918 Y124.824
G1 X103.626 Y127.533 E.09631
G1 X103.671 Y128.123
G1 X100.9 Y125.353 E.0985
G1 X100.893 Y125.89
G1 X103.731 Y128.729 E.10093
G1 X103.81 Y129.353
G1 X100.895 Y126.438 E.10363
G1 X100.909 Y126.997
G1 X103.908 Y129.997 E.10665
G1 X104.029 Y130.663
G1 X100.937 Y127.571 E.10993
G1 X100.978 Y128.157
G1 X104.174 Y131.353 E.11362
G1 X104.346 Y132.07
G1 X101.033 Y128.758 E.11779
G1 X101.103 Y129.373
G1 X104.55 Y132.82 E.12254
G1 X104.796 Y133.612
G1 X101.19 Y130.006 E.12821
G1 X101.295 Y130.656
G1 X105.086 Y134.447 E.13477
G1 X105.438 Y135.345
G1 X101.421 Y131.327 E.14283
G1 X101.57 Y132.021
G1 X105.866 Y136.318 E.15276
G1 X106.404 Y137.401
G1 X101.744 Y132.741 E.1657
G1 X101.946 Y133.489
G1 X107.117 Y138.659 E.18385
; WIPE_START
M204 S10000
G1 X105.703 Y137.245 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.179 Y140.267 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X102.184 Y134.272 E.21315
G1 X102.465 Y135.098
G1 X118.902 Y151.535 E.58441
G1 X118.03 Y151.208
G1 X102.792 Y135.97 E.54178
G1 X103.184 Y136.908
G1 X117.092 Y150.816 E.49449
G1 X116.077 Y150.346
G1 X103.654 Y137.923 E.44169
M204 S10000
G1 X104.243 Y139.058 F30000
G1 F11668.197
M204 S2000
G1 X114.942 Y149.757 E.38044
M204 S10000
G1 X113.617 Y148.978 F30000
G1 F11668.197
M204 S2000
G1 X105.022 Y140.383 E.30559
M204 S10000
G1 X106.184 Y142.09 F30000
G1 F11668.197
M204 S2000
G1 X111.91 Y147.816 E.2036
; WIPE_START
M204 S10000
G1 X110.496 Y146.402 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.671 Y145.882 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.210771
G1 F18000
G1 X113.43 Y145.675 E.00366
; LINE_WIDTH: 0.170648
G1 X113.188 Y145.467 E.00284
; LINE_WIDTH: 0.13305
G1 X112.966 Y145.27 E.00191
; LINE_WIDTH: 0.0980927
G1 X112.744 Y145.074 E.00123
; WIPE_START
G1 X112.966 Y145.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.278 Y146.945 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.212858
G1 F18000
G1 X115.153 Y146.847 E.00186
; LINE_WIDTH: 0.184036
G1 X115 Y146.725 E.00191
; LINE_WIDTH: 0.142668
G1 X114.848 Y146.603 E.00138
; LINE_WIDTH: 0.101299
G1 X114.695 Y146.481 E.00085
; WIPE_START
G1 X114.848 Y146.603 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.536 Y147.658 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192781
G1 F18000
G1 X116.374 Y147.538 E.00208
; LINE_WIDTH: 0.146967
G1 X116.211 Y147.418 E.00149
; LINE_WIDTH: 0.102274
G1 X116.065 Y147.306 E.00082
; WIPE_START
G1 X116.211 Y147.418 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.592 Y148.625 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.187546
G1 F18000
G1 X118.479 Y148.55 E.00135
; LINE_WIDTH: 0.151554
G1 X118.365 Y148.474 E.00104
; LINE_WIDTH: 0.12015
G1 X118.296 Y148.427 E.00047
; LINE_WIDTH: 0.0937982
G1 X118.228 Y148.38 E.00032
; WIPE_START
G1 X118.296 Y148.427 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.322 Y149.27 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0890678
G1 F18000
G1 X120.016 Y149.078 E.00129
; WIPE_START
G1 X120.322 Y149.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.863 Y149.72 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.175015
G1 F18000
G3 X121.589 Y149.562 I8.146 J-14.5 E.00291
; WIPE_START
G1 X121.863 Y149.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.478 Y150.245 Z5.4 F30000
G1 X130.251 Y150.298 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.148433
G1 F18000
G3 X130.036 Y150.398 I-4.904 J-10.232 E.00176
; WIPE_START
G1 X130.251 Y150.298 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.63 Y150.72 Z5.4 F30000
G1 X117.525 Y151.003 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.100464
G1 F18000
G1 X117.43 Y150.94 E.00049
; LINE_WIDTH: 0.140147
G1 X117.336 Y150.877 E.00078
; LINE_WIDTH: 0.183985
G1 X117.155 Y150.752 E.00214
G1 X115.467 Y150.037 F30000
; LINE_WIDTH: 0.103119
G1 F18000
G1 X115.313 Y149.923 E.00086
; LINE_WIDTH: 0.148122
G1 X115.159 Y149.809 E.00142
; LINE_WIDTH: 0.193125
G1 X115.005 Y149.695 E.00198
G1 X114.236 Y149.353 F30000
; LINE_WIDTH: 0.10157
G1 F18000
G1 X114.096 Y149.243 E.00078
; LINE_WIDTH: 0.143458
G1 X113.955 Y149.133 E.00127
; LINE_WIDTH: 0.185346
G1 X113.814 Y149.023 E.00176
; LINE_WIDTH: 0.21477
G1 X113.679 Y148.915 E.00202
G1 X112.742 Y148.405 F30000
; LINE_WIDTH: 0.0876546
G1 F18000
G1 X112.669 Y148.345 E.00033
; LINE_WIDTH: 0.11372
G1 X112.499 Y148.202 E.00115
; LINE_WIDTH: 0.151806
G1 X112.329 Y148.059 E.0017
; LINE_WIDTH: 0.189892
G1 X112.16 Y147.916 E.00225
; LINE_WIDTH: 0.219908
G1 X111.972 Y147.754 E.003
G1 X110.423 Y146.634 F30000
; LINE_WIDTH: 0.0981873
G1 F18000
G1 X110.057 Y146.293 E.00208
; LINE_WIDTH: 0.148362
G3 X107.707 Y143.943 I38.689 J-41.038 E.0247
; LINE_WIDTH: 0.0981828
G1 X107.366 Y143.577 E.00208
G1 X106.246 Y142.028 F30000
; LINE_WIDTH: 0.219974
G1 F18000
G1 X106.084 Y141.841 E.00299
; LINE_WIDTH: 0.189983
G1 X105.941 Y141.671 E.00225
; LINE_WIDTH: 0.151879
G1 X105.798 Y141.501 E.0017
; LINE_WIDTH: 0.113775
G1 X105.655 Y141.331 E.00115
; LINE_WIDTH: 0.0876656
G1 X105.595 Y141.258 E.00033
G1 X105.084 Y140.321 F30000
; LINE_WIDTH: 0.216098
G1 F18000
G1 X104.984 Y140.196 E.0019
; LINE_WIDTH: 0.187545
G1 X104.872 Y140.052 E.00183
; LINE_WIDTH: 0.14477
G1 X104.76 Y139.908 E.00132
; LINE_WIDTH: 0.101996
G1 X104.647 Y139.764 E.00081
G1 X104.305 Y138.995 F30000
; LINE_WIDTH: 0.193136
G1 F18000
G1 X104.191 Y138.841 E.00198
; LINE_WIDTH: 0.148131
G1 X104.077 Y138.687 E.00142
; LINE_WIDTH: 0.103126
G1 X103.963 Y138.533 E.00086
G1 X103.717 Y137.86 F30000
; LINE_WIDTH: 0.188939
G1 F18000
G1 X103.622 Y137.725 E.00166
; LINE_WIDTH: 0.145584
G1 X103.527 Y137.59 E.0012
; LINE_WIDTH: 0.10223
G1 X103.432 Y137.456 E.00073
; WIPE_START
G1 X103.527 Y137.59 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.073 Y129.978 Z5.4 F30000
G1 X105.295 Y112.963 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.213207
G1 F18000
G1 X104.967 Y112.669 E.00513
; LINE_WIDTH: 0.169036
G1 X104.617 Y112.36 E.0041
; LINE_WIDTH: 0.129254
G1 X104.574 Y112.391 E.00033
; LINE_WIDTH: 0.0934917
G1 X104.502 Y112.486 E.00046
; WIPE_START
G1 X104.574 Y112.391 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.521 Y120.023 Z5.4 F30000
G1 X104.437 Y132.412 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.180614
G1 F18000
G1 X104.28 Y132.136 E.00302
; WIPE_START
G1 X104.437 Y132.412 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.921 Y133.984 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.186865
G1 F18000
G1 X104.731 Y133.676 E.0036
; WIPE_START
G1 X104.921 Y133.984 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.62 Y135.772 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0937775
G1 F18000
G1 X105.573 Y135.704 E.00032
; LINE_WIDTH: 0.120282
G1 X105.525 Y135.634 E.00047
; LINE_WIDTH: 0.151642
G1 X105.45 Y135.521 E.00104
; LINE_WIDTH: 0.18751
G1 X105.375 Y135.408 E.00135
; WIPE_START
G1 X105.45 Y135.521 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.694 Y137.935 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102358
G1 F18000
G1 X106.582 Y137.788 E.00082
; LINE_WIDTH: 0.147026
G1 X106.462 Y137.626 E.00148
; LINE_WIDTH: 0.192771
G1 X106.342 Y137.464 E.00208
; WIPE_START
G1 X106.462 Y137.626 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.519 Y139.305 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.101583
G1 F18000
G1 X107.395 Y139.15 E.00087
; LINE_WIDTH: 0.143531
G1 X107.272 Y138.996 E.00141
; LINE_WIDTH: 0.185702
G1 X107.147 Y138.84 E.00197
; LINE_WIDTH: 0.213827
G1 X107.055 Y138.722 E.00176
; WIPE_START
G1 X107.147 Y138.84 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.926 Y141.256 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0980954
G1 F18000
G1 X108.73 Y141.034 E.00123
; LINE_WIDTH: 0.133154
G1 X108.532 Y140.81 E.00192
; LINE_WIDTH: 0.170594
G1 X108.325 Y140.57 E.00282
; LINE_WIDTH: 0.210272
G1 X108.117 Y140.329 E.00364
; WIPE_START
G1 X108.325 Y140.57 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.904 Y132.959 Z5.4 F30000
G1 X110.862 Y107.257 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102757
G1 F18000
G1 X110.538 Y106.967 E.00194
; LINE_WIDTH: 0.147041
G1 X110.214 Y106.677 E.0032
; LINE_WIDTH: 0.191326
G1 X109.89 Y106.387 E.00445
; LINE_WIDTH: 0.235611
G1 X109.566 Y106.097 E.00571
; WIPE_START
G1 X109.89 Y106.387 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.508 Y105.909 Z5.4 F30000
G1 X144.028 Y104.245 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.219958
G1 F18000
G1 X143.84 Y104.084 E.00299
; LINE_WIDTH: 0.189954
G1 X143.67 Y103.941 E.00225
; LINE_WIDTH: 0.15185
G1 X143.5 Y103.798 E.0017
; LINE_WIDTH: 0.113746
G1 X143.331 Y103.655 E.00115
; LINE_WIDTH: 0.0876539
G1 X143.257 Y103.595 E.00033
G1 X142.32 Y103.084 F30000
; LINE_WIDTH: 0.214843
G1 F18000
G1 X142.186 Y102.977 E.00202
; LINE_WIDTH: 0.185464
G1 X142.045 Y102.867 E.00176
; LINE_WIDTH: 0.143528
G1 X141.904 Y102.757 E.00127
; LINE_WIDTH: 0.101592
G1 X141.763 Y102.647 E.00078
G1 X140.995 Y102.305 F30000
; LINE_WIDTH: 0.193123
G1 F18000
G1 X140.841 Y102.191 E.00198
; LINE_WIDTH: 0.148121
G1 X140.687 Y102.077 E.00142
; LINE_WIDTH: 0.103119
G1 X140.533 Y101.963 E.00086
G1 X138.844 Y101.247 F30000
; LINE_WIDTH: 0.18407
G1 F18000
G1 X138.664 Y101.123 E.00214
; LINE_WIDTH: 0.140264
G1 X138.569 Y101.06 E.00078
; LINE_WIDTH: 0.100503
G1 X138.475 Y100.997 E.00049
; WIPE_START
G1 X138.569 Y101.06 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.679 Y103.046 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.130545
G1 F18000
G1 X136.432 Y103.1 E.00159
; WIPE_START
G1 X136.679 Y103.046 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.786 Y104.09 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0903633
G1 F18000
G1 X138.718 Y104.04 E.00031
; LINE_WIDTH: 0.118591
G1 X138.605 Y103.961 E.00075
; LINE_WIDTH: 0.155374
G1 X138.493 Y103.882 E.00108
; LINE_WIDTH: 0.192156
M73 P81 R8
G1 X138.381 Y103.803 E.00141
; WIPE_START
G1 X138.493 Y103.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.935 Y104.694 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102312
G1 F18000
G1 X139.788 Y104.582 E.00082
; LINE_WIDTH: 0.14696
G1 X139.626 Y104.462 E.00148
; LINE_WIDTH: 0.192736
G1 X139.464 Y104.341 E.00208
; WIPE_START
G1 X139.626 Y104.462 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.304 Y105.519 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.101289
G1 F18000
G1 X141.152 Y105.397 E.00085
; LINE_WIDTH: 0.142639
G1 X141 Y105.275 E.00138
; LINE_WIDTH: 0.184212
G1 X140.845 Y105.151 E.00193
; LINE_WIDTH: 0.212936
G1 X140.721 Y105.054 E.00183
; WIPE_START
G1 X140.845 Y105.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.255 Y106.926 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0980455
G1 F18000
G1 X143.034 Y106.73 E.00123
; LINE_WIDTH: 0.133002
G1 X142.811 Y106.533 E.00191
; LINE_WIDTH: 0.1706
G1 X142.569 Y106.325 E.00283
; LINE_WIDTH: 0.210704
G1 X142.328 Y106.117 E.00366
; WIPE_START
G1 X142.569 Y106.325 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.634 Y108.424 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0982402
G1 F18000
G1 X148.293 Y108.057 E.00209
; LINE_WIDTH: 0.148488
G2 X145.943 Y105.707 I-41.037 J38.688 E.02473
; LINE_WIDTH: 0.0982298
G1 X145.576 Y105.366 E.00209
; WIPE_START
G1 X145.943 Y105.707 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.827 Y112.774 Z5.4 F30000
G1 X151.72 Y119.864 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.174637
G1 F18000
G1 X151.564 Y119.588 E.0029
; WIPE_START
G1 X151.72 Y119.864 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.626 Y116.592 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.18904
G1 F18000
G1 X150.555 Y116.486 E.00129
; LINE_WIDTH: 0.156063
G1 X150.483 Y116.378 E.00102
; LINE_WIDTH: 0.124658
G1 X150.431 Y116.303 E.00054
; LINE_WIDTH: 0.0952924
G1 X150.379 Y116.227 E.00036
; WIPE_START
G1 X150.431 Y116.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.659 Y114.536 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.192723
G1 F18000
G1 X149.538 Y114.374 E.00209
; LINE_WIDTH: 0.146761
G1 X149.417 Y114.211 E.00149
; LINE_WIDTH: 0.102124
G1 X149.306 Y114.065 E.00081
G1 X148.946 Y113.279 F30000
; LINE_WIDTH: 0.21276
G1 F18000
G1 X148.847 Y113.152 E.00186
; LINE_WIDTH: 0.183865
G1 X148.725 Y113 E.0019
; LINE_WIDTH: 0.142562
G1 X148.603 Y112.848 E.00138
; LINE_WIDTH: 0.10126
G1 X148.481 Y112.696 E.00085
; WIPE_START
G1 X148.603 Y112.848 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.883 Y111.672 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.210723
G1 F18000
G1 X147.675 Y111.431 E.00366
; LINE_WIDTH: 0.170533
G1 X147.467 Y111.188 E.00284
; LINE_WIDTH: 0.132939
G1 X147.27 Y110.966 E.0019
; LINE_WIDTH: 0.0980525
G1 X147.074 Y110.745 E.00123
; WIPE_START
G1 X147.27 Y110.966 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.405 Y110.743 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0877072
G1 F18000
G1 X150.345 Y110.669 E.00033
; LINE_WIDTH: 0.113848
G1 X150.202 Y110.499 E.00115
; LINE_WIDTH: 0.151956
G1 X150.059 Y110.329 E.0017
; LINE_WIDTH: 0.190064
G1 X149.916 Y110.159 E.00225
; LINE_WIDTH: 0.220009
G1 X149.755 Y109.973 E.00298
G1 X151.353 Y112.237 F30000
; LINE_WIDTH: 0.101583
G1 F18000
G1 X151.243 Y112.096 E.00078
; LINE_WIDTH: 0.14353
G1 X151.133 Y111.955 E.00127
; LINE_WIDTH: 0.185478
G1 X151.023 Y111.813 E.00176
; LINE_WIDTH: 0.214843
G1 X150.916 Y111.68 E.00202
G1 X152.037 Y113.467 F30000
; LINE_WIDTH: 0.103127
G1 F18000
G1 X151.923 Y113.313 E.00086
; LINE_WIDTH: 0.148134
G1 X151.809 Y113.159 E.00142
; LINE_WIDTH: 0.193141
G1 X151.695 Y113.005 E.00198
G1 X152.569 Y114.545 F30000
; LINE_WIDTH: 0.102383
G1 F18000
G1 X152.473 Y114.41 E.00073
; LINE_WIDTH: 0.14596
G1 X152.378 Y114.275 E.0012
; LINE_WIDTH: 0.189536
G1 X152.283 Y114.14 E.00167
; WIPE_START
G1 X152.378 Y114.275 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.952 Y106.664 Z5.4 F30000
G1 X154.034 Y92.312 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X161.688 Y99.966 E.27214
; WIPE_START
M204 S10000
G1 X160.274 Y98.552 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X163.15 Y101.974 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X152.026 Y90.849 E.39554
; WIPE_START
M204 S10000
G1 X153.44 Y92.264 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.462 Y89.831 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X164.169 Y103.538 E.48736
; WIPE_START
M204 S10000
G1 X162.755 Y102.124 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X164.969 Y104.884 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X149.116 Y89.031 E.56365
; WIPE_START
M204 S10000
G1 X150.531 Y90.445 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.904 Y88.364 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X165.636 Y106.096 E.63044
G1 X166.207 Y107.212
G1 X146.788 Y87.793 E.69046
G1 X145.746 Y87.297
G1 X166.703 Y108.254 E.74512
G1 X167.138 Y109.234
G1 X144.766 Y86.862 E.79542
G1 X143.835 Y86.477
G1 X167.523 Y110.165 E.84223
G1 X167.867 Y111.054
G1 X142.946 Y86.133 E.88606
G1 X142.092 Y85.824
G1 X168.176 Y111.908 E.92741
G1 X168.455 Y112.732
G1 X141.268 Y85.545 E.96664
G1 X140.469 Y85.292
G1 X168.708 Y113.531 E1.00404
G1 X168.939 Y114.308
G1 X139.692 Y85.061 E1.03987
G1 X138.938 Y84.852
G1 X169.148 Y115.062 E1.0741
G1 X169.333 Y115.792
G1 X138.208 Y84.667 E1.10667
G1 X137.492 Y84.497
G1 X169.503 Y116.508 E1.13818
G1 X169.66 Y117.21
G1 X136.79 Y84.34 E1.16873
G1 X136.109 Y84.204
G1 X169.796 Y117.891 E1.19775
G1 X169.92 Y118.561
G1 X135.439 Y84.08 E1.22598
G1 X134.779 Y83.965
G1 X170.035 Y119.221 E1.25351
G1 X170.13 Y119.862
G1 X134.138 Y83.87 E1.27969
G1 X133.505 Y83.782
G1 X170.218 Y120.495 E1.30537
G1 X170.295 Y121.118
G1 X132.882 Y83.705 E1.33022
G1 X132.272 Y83.64
G1 X170.36 Y121.728 E1.35422
G1 X170.419 Y122.333
G1 X131.667 Y83.581 E1.37785
G1 X131.078 Y83.537
G1 X170.463 Y122.922 E1.40035
G1 X170.504 Y123.508
G1 X130.492 Y83.496 E1.42261
G1 X129.919 Y83.468
G1 X170.532 Y124.081 E1.444
G1 X170.554 Y124.649
G1 X129.351 Y83.446 E1.465
G1 X128.792 Y83.432
G1 X170.568 Y125.208 E1.48537
G1 X170.575 Y125.76
G1 X128.24 Y83.426 E1.50522
G1 X127.694 Y83.425
G1 X170.575 Y126.306 E1.52462
G1 X170.567 Y126.843
G1 X127.157 Y83.433 E1.54346
G1 X126.624 Y83.446
G1 X170.554 Y127.376 E1.56192
G1 X170.533 Y127.9
G1 X126.1 Y83.467 E1.57981
G1 X125.58 Y83.493
G1 X145.701 Y103.614 E.7154
M204 S10000
G1 X143.728 Y102.187 F30000
G1 F11668.197
M204 S2000
G1 X125.068 Y83.526 E.66348
G1 X124.56 Y83.563
G1 X142.295 Y101.299 E.63058
M204 S10000
G1 X141.09 Y100.639 F30000
G1 F11668.197
M204 S2000
G1 X124.059 Y83.608 E.60557
G1 X123.562 Y83.656
G1 X140.022 Y100.117 E.58525
G1 X139.046 Y99.686
G1 X123.071 Y83.711 E.56799
G1 X122.585 Y83.771
G1 X138.137 Y99.322 E.55295
G1 X137.28 Y99.01
G1 X122.104 Y83.834 E.53959
G1 X121.629 Y83.905
G1 X136.471 Y98.747 E.52773
G1 X135.698 Y98.519
G1 X121.155 Y83.977 E.51706
G1 X120.691 Y84.057
G1 X134.955 Y98.322 E.50718
G1 X134.24 Y98.152
G1 X120.226 Y84.138 E.49827
G1 X119.771 Y84.228
G1 X133.549 Y98.006 E.48988
G1 X132.879 Y97.882
G1 X119.316 Y84.319 E.48224
G1 X118.867 Y84.416
G1 X132.228 Y97.777 E.47504
G1 X131.595 Y97.689
G1 X118.422 Y84.516 E.46837
G1 X117.981 Y84.62
G1 X130.978 Y97.617 E.4621
G1 X130.375 Y97.559
G1 X117.544 Y84.729 E.45618
G1 X117.109 Y84.839
G1 X129.786 Y97.516 E.45072
G1 X129.211 Y97.487
G1 X116.682 Y84.957 E.44549
G1 X116.255 Y85.076
G1 X128.648 Y97.469 E.44065
G1 X128.096 Y97.462
G1 X115.834 Y85.2 E.43597
G1 X115.415 Y85.327
G1 X127.552 Y97.464 E.43153
G1 X127.02 Y97.477
G1 X115 Y85.457 E.42738
G1 X114.59 Y85.592
G1 X126.498 Y97.501 E.42341
G1 X125.985 Y97.533
G1 X114.18 Y85.728 E.41973
G1 X113.778 Y85.871
G1 X125.479 Y97.572 E.41603
G1 X124.982 Y97.621
G1 X113.376 Y86.015 E.41266
G1 X112.978 Y86.162
G1 X124.494 Y97.678 E.40944
G1 X124.011 Y97.741
G1 X112.585 Y86.314 E.40629
G1 X112.191 Y86.466
G1 X123.537 Y97.811 E.40339
G1 X123.07 Y97.891
G1 X111.805 Y86.626 E.40053
G1 X111.42 Y86.785
G1 X122.609 Y97.975 E.39785
G1 X122.154 Y98.065
G1 X111.038 Y86.949 E.39525
G1 X110.66 Y87.116
G1 X121.707 Y98.164 E.3928
G1 X121.265 Y98.267
G1 X110.282 Y87.284 E.3905
G1 X109.911 Y87.459
G1 X120.829 Y98.376 E.38817
G1 X120.4 Y98.492
G1 X109.541 Y87.634 E.38607
G1 X109.174 Y87.812
G1 X119.974 Y98.612 E.384
G1 X119.556 Y98.739
G1 X108.811 Y87.995 E.38202
G1 X108.448 Y88.177
G1 X119.142 Y98.871 E.38021
G1 X118.732 Y99.006
G1 X108.092 Y88.366 E.37831
G1 X107.736 Y88.556
G1 X118.33 Y99.15 E.37666
G1 X117.931 Y99.296
G1 X107.383 Y88.748 E.37504
G1 X107.035 Y88.945
G1 X117.537 Y99.448 E.37343
G1 X117.149 Y99.605
G1 X106.686 Y89.142 E.372
G1 X106.343 Y89.344
G1 X116.763 Y99.765 E.3705
G1 X116.385 Y99.932
G1 X106.002 Y89.549 E.36918
G1 X105.661 Y89.753
G1 X116.009 Y100.102 E.36795
G1 X115.639 Y100.277
G1 X105.327 Y89.965 E.36665
G1 X104.993 Y90.176
G1 X115.273 Y100.456 E.36552
G1 X114.91 Y100.639
G1 X104.662 Y90.39 E.3644
G1 X104.335 Y90.609
G1 X114.554 Y100.828 E.36335
G1 X114.199 Y101.019
G1 X104.008 Y90.827 E.36236
G1 X103.686 Y91.05
G1 X113.851 Y101.216 E.36143
G1 X113.506 Y101.416
G1 X103.366 Y91.276 E.36053
G1 X103.046 Y91.501
G1 X113.165 Y101.62 E.35977
G1 X112.828 Y101.829
G1 X102.733 Y91.734 E.35893
G1 X102.42 Y91.966
G1 X112.494 Y102.04 E.35819
G1 X112.166 Y102.257
G1 X102.109 Y92.201 E.35757
G1 X101.803 Y92.44
G1 X111.839 Y102.476 E.35685
G1 X111.519 Y102.702
G1 X101.496 Y92.679 E.35636
G1 X101.194 Y92.922
G1 X111.201 Y102.929 E.35578
G1 X110.888 Y103.161
G1 X100.895 Y93.168 E.35529
G1 X100.595 Y93.414
G1 X110.578 Y103.396 E.35492
G1 X110.271 Y103.635
G1 X100.302 Y93.666 E.35445
G1 X100.009 Y93.919
G1 X109.969 Y103.879 E.35413
G1 X109.67 Y104.125
G1 X99.718 Y94.173 E.35382
G1 X99.432 Y94.433
G1 X109.376 Y104.376 E.35355
G1 X109.083 Y104.629
G1 X99.146 Y94.692 E.35332
G1 X98.864 Y94.955
G1 X108.797 Y104.888 E.35318
G1 X108.513 Y105.149
G1 X98.585 Y95.221 E.353
G1 X98.305 Y95.487
G1 X106.937 Y104.119 E.30691
; WIPE_START
M204 S10000
G1 X105.523 Y102.705 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.206 Y101.933 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X98.031 Y95.759 E.21952
G1 X97.759 Y96.032
G1 X101.474 Y99.747 E.1321
; WIPE_START
M204 S10000
G1 X100.06 Y98.333 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P81 R7
G1 X98.742 Y97.561 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X97.487 Y96.305 E.04464
; WIPE_START
M204 S10000
G1 X98.742 Y97.561 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.539 Y105.151 Z5.4 F30000
G1 X99.894 Y108.529 Z5.4
G1 Z5
G1 E.8 F1800
M73 P82 R7
G1 F11668.197
M204 S2000
G1 X103.216 Y111.851 E.11812
G1 X103.018 Y112.199
G1 X97.162 Y106.343 E.20823
; WIPE_START
M204 S10000
G1 X98.576 Y107.757 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.43 Y104.157 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X102.828 Y112.554 E.29857
G1 X102.639 Y112.911
G1 X92.39 Y102.662 E.3644
G1 X92.176 Y102.993
G1 X102.456 Y113.273 E.36552
G1 X102.277 Y113.639
G1 X91.965 Y103.327 E.36666
G1 X91.753 Y103.661
G1 X102.102 Y114.01 E.36795
G1 X101.932 Y114.385
G1 X91.549 Y104.002 E.36918
G1 X91.344 Y104.343
G1 X101.765 Y114.763 E.3705
G1 X101.605 Y115.149
G1 X91.142 Y104.687 E.372
G1 X90.945 Y105.035
G1 X101.448 Y115.537 E.37343
G1 X101.296 Y115.931
G1 X90.748 Y105.383 E.37504
G1 X90.556 Y105.737
G1 X101.15 Y116.33 E.37666
G1 X101.006 Y116.732
G1 X90.366 Y106.092 E.37831
G1 X90.177 Y106.449
G1 X100.871 Y117.142 E.38021
G1 X100.739 Y117.556
G1 X89.995 Y106.811 E.38202
G1 X89.812 Y107.174
G1 X100.612 Y117.974 E.384
G1 X100.492 Y118.4
G1 X89.634 Y107.541 E.38607
G1 X89.459 Y107.912
G1 X100.376 Y118.829 E.38817
G1 X100.267 Y119.265
G1 X89.284 Y108.282 E.3905
G1 X89.116 Y108.66
G1 X100.164 Y119.708 E.3928
G1 X100.065 Y120.154
G1 X88.949 Y109.038 E.39525
G1 X88.786 Y109.42
G1 X99.975 Y120.609 E.39784
G1 X99.891 Y121.07
G1 X88.626 Y109.805 E.40053
G1 X88.466 Y110.191
G1 X99.811 Y121.537 E.4034
G1 X99.741 Y122.012
G1 X88.314 Y110.585 E.40629
G1 X88.162 Y110.978
G1 X99.678 Y122.494 E.40944
G1 X99.621 Y122.982
G1 X88.015 Y111.376 E.41267
G1 X87.871 Y111.778
G1 X99.572 Y123.479 E.41603
G1 X99.533 Y123.985
G1 X87.728 Y112.18 E.41973
G1 X87.592 Y112.59
G1 X99.501 Y124.499 E.42341
G1 X99.477 Y125.02
G1 X87.457 Y113 E.42738
G1 X87.327 Y113.416
G1 X99.464 Y125.552 E.43153
G1 X99.462 Y126.095
G1 X87.2 Y113.834 E.43596
G1 X87.075 Y114.255
G1 X99.469 Y126.648 E.44065
G1 X99.487 Y127.211
G1 X86.957 Y114.682 E.44549
G1 X86.839 Y115.109
G1 X99.516 Y127.786 E.45073
G1 X99.559 Y128.375
G1 X86.729 Y115.545 E.45618
G1 X86.62 Y115.981
G1 X99.617 Y128.978 E.46211
G1 X99.689 Y129.595
G1 X86.516 Y116.422 E.46837
G1 X86.416 Y116.868
G1 X99.777 Y130.228 E.47504
G1 X99.882 Y130.879
G1 X86.319 Y117.316 E.48224
G1 X86.228 Y117.771
G1 X100.006 Y131.549 E.48988
G1 X100.152 Y132.24
G1 X86.138 Y118.226 E.49826
G1 X86.058 Y118.691
G1 X100.322 Y132.956 E.50718
G1 X100.519 Y133.698
G1 X85.977 Y119.156 E.51706
G1 X85.905 Y119.629
G1 X100.747 Y134.471 E.52773
G1 X101.01 Y135.28
G1 X85.834 Y120.104 E.53959
G1 X85.771 Y120.585
G1 X101.322 Y136.137 E.55295
G1 X101.686 Y137.046
G1 X85.711 Y121.071 E.568
G1 X85.656 Y121.562
G1 X102.117 Y138.023 E.58526
G1 X102.639 Y139.091
G1 X85.608 Y122.059 E.60557
G1 X85.563 Y122.56
G1 X103.299 Y140.295 E.63058
M204 S10000
G1 X104.187 Y141.729 F30000
G1 F11668.197
M204 S2000
G1 X85.526 Y123.068 E.66349
G1 X85.493 Y123.58
G1 X105.614 Y143.702 E.71542
; WIPE_START
M204 S10000
G1 X104.2 Y142.287 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.671 Y140.725 Z5.4 F30000
G1 X170.507 Y128.42 Z5.4
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X150.386 Y108.299 E.71539
M204 S10000
G1 X151.813 Y110.272 F30000
G1 F11668.197
M204 S2000
G1 X170.474 Y128.932 E.66348
G1 X170.437 Y129.44
G1 X152.701 Y111.705 E.63058
M204 S10000
G1 X153.361 Y112.91 F30000
G1 F11668.197
M204 S2000
G1 X170.392 Y129.941 E.60557
G1 X170.344 Y130.438
G1 X153.883 Y113.978 E.58526
G1 X154.314 Y114.954
G1 X170.289 Y130.929 E.56799
G1 X170.229 Y131.415
G1 X154.678 Y115.863 E.55295
G1 X154.99 Y116.72
G1 X170.166 Y131.896 E.53959
G1 X170.095 Y132.371
G1 X155.253 Y117.529 E.52773
G1 X155.481 Y118.302
G1 X170.023 Y132.845 E.51706
G1 X169.943 Y133.309
G1 X155.678 Y119.045 E.50719
G1 X155.848 Y119.76
G1 X169.862 Y133.774 E.49827
G1 X169.772 Y134.229
G1 X155.994 Y120.451 E.48988
G1 X156.118 Y121.121
G1 X169.681 Y134.684 E.48224
G1 X169.584 Y135.133
G1 X156.223 Y121.772 E.47504
G1 X156.311 Y122.405
G1 X169.484 Y135.578 E.46836
G1 X169.38 Y136.019
G1 X156.383 Y123.022 E.46211
G1 X156.441 Y123.625
G1 X169.271 Y136.456 E.45618
G1 X169.161 Y136.891
G1 X156.484 Y124.214 E.45072
G1 X156.513 Y124.789
G1 X169.043 Y137.318 E.44549
G1 X168.924 Y137.745
G1 X156.531 Y125.352 E.44065
G1 X156.538 Y125.905
G1 X168.8 Y138.166 E.43596
G1 X168.673 Y138.585
G1 X156.536 Y126.448 E.43153
G1 X156.523 Y126.98
G1 X168.543 Y139 E.42738
G1 X168.408 Y139.41
G1 X156.499 Y127.502 E.42341
G1 X156.467 Y128.015
G1 X168.272 Y139.82 E.41973
G1 X168.129 Y140.222
G1 X156.428 Y128.521 E.41603
G1 X156.379 Y129.018
G1 X167.985 Y140.624 E.41266
G1 X167.838 Y141.022
G1 X156.322 Y129.506 E.40944
G1 X156.259 Y129.989
G1 X167.686 Y141.415 E.40629
G1 X167.534 Y141.809
G1 X156.189 Y130.463 E.4034
G1 X156.109 Y130.93
G1 X167.374 Y142.195 E.40053
G1 X167.215 Y142.58
G1 X156.025 Y131.391 E.39785
G1 X155.935 Y131.846
G1 X167.051 Y142.962 E.39525
G1 X166.884 Y143.34
G1 X155.836 Y132.293 E.3928
G1 X155.733 Y132.735
G1 X166.716 Y143.718 E.3905
G1 X166.541 Y144.089
G1 X155.624 Y133.171 E.38817
G1 X155.508 Y133.6
G1 X166.366 Y144.459 E.38607
G1 X166.188 Y144.826
G1 X155.388 Y134.026 E.38399
G1 X155.261 Y134.444
G1 X166.005 Y145.189 E.38202
G1 X165.823 Y145.552
G1 X155.129 Y134.858 E.38021
G1 X154.994 Y135.268
G1 X165.634 Y145.908 E.37831
G1 X165.444 Y146.264
G1 X154.85 Y135.67 E.37666
G1 X154.704 Y136.069
G1 X165.252 Y146.617 E.37504
G1 X165.055 Y146.965
G1 X154.552 Y136.463 E.37343
G1 X154.395 Y136.851
G1 X164.858 Y147.314 E.372
G1 X164.656 Y147.657
G1 X154.235 Y137.237 E.3705
G1 X154.068 Y137.615
G1 X164.451 Y147.998 E.36918
G1 X164.247 Y148.339
G1 X153.898 Y137.99 E.36795
G1 X153.723 Y138.361
G1 X164.035 Y148.673 E.36665
G1 X163.824 Y149.007
G1 X153.544 Y138.727 E.36552
G1 X153.361 Y139.09
G1 X163.61 Y149.338 E.3644
G1 X163.391 Y149.665
G1 X153.172 Y139.446 E.36335
G1 X152.981 Y139.801
G1 X163.173 Y149.992 E.36236
G1 X162.95 Y150.314
G1 X152.784 Y140.149 E.36143
G1 X152.584 Y140.494
G1 X162.724 Y150.634 E.36053
G1 X162.499 Y150.954
G1 X152.38 Y140.835 E.35977
G1 X152.171 Y141.172
G1 X162.266 Y151.267 E.35893
G1 X162.034 Y151.58
G1 X151.96 Y141.506 E.35819
G1 X151.743 Y141.834
G1 X161.799 Y151.891 E.35757
G1 X161.56 Y152.197
G1 X151.524 Y142.161 E.35685
G1 X151.298 Y142.481
G1 X161.321 Y152.504 E.35636
G1 X161.078 Y152.806
G1 X151.071 Y142.799 E.35578
G1 X150.839 Y143.112
G1 X160.832 Y153.105 E.35529
G1 X160.586 Y153.405
G1 X150.604 Y143.422 E.35492
G1 X150.365 Y143.729
G1 X160.334 Y153.698 E.35445
G1 X160.081 Y153.991
G1 X150.121 Y144.031 E.35413
G1 X149.875 Y144.33
G1 X159.827 Y154.282 E.35382
G1 X159.567 Y154.568
G1 X149.624 Y144.624 E.35355
G1 X149.371 Y144.917
G1 X159.308 Y154.854 E.35332
G1 X159.045 Y155.136
G1 X149.112 Y145.203 E.35318
G1 X148.851 Y145.487
G1 X158.779 Y155.415 E.353
G1 X158.513 Y155.695
G1 X148.585 Y145.767 E.353
G1 X148.316 Y146.043
G1 X158.241 Y155.969 E.35289
G1 X157.968 Y156.241
G1 X148.043 Y146.316 E.35289
G1 X147.767 Y146.585
G1 X157.695 Y156.513 E.353
G1 X157.415 Y156.779
G1 X147.487 Y146.851 E.353
G1 X147.203 Y147.112
G1 X157.136 Y157.045 E.35318
G1 X156.854 Y157.308
G1 X146.916 Y147.371 E.35332
G1 X146.624 Y147.624
G1 X156.568 Y157.567 E.35355
G1 X156.281 Y157.827
G1 X146.33 Y147.875 E.35382
G1 X146.031 Y148.121
G1 X155.99 Y158.081 E.35413
G1 X155.698 Y158.334
G1 X145.729 Y148.365 E.35445
G1 X145.422 Y148.604
G1 X155.405 Y158.586 E.35492
G1 X155.105 Y158.832
G1 X145.112 Y148.839 E.35529
G1 X144.799 Y149.071
G1 X154.805 Y159.078 E.35578
M73 P83 R7
G1 X154.504 Y159.321
G1 X144.481 Y149.299 E.35636
G1 X144.161 Y149.524
G1 X154.197 Y159.56 E.35685
G1 X153.891 Y159.799
G1 X143.834 Y149.743 E.35757
G1 X143.506 Y149.96
G1 X153.58 Y160.034 E.35819
G1 X153.267 Y160.266
G1 X143.172 Y150.171 E.35893
G1 X142.835 Y150.38
G1 X152.954 Y160.499 E.35977
G1 X152.634 Y160.724
G1 X142.494 Y150.584 E.36053
G1 X142.149 Y150.784
G1 X152.314 Y160.95 E.36143
G1 X151.992 Y161.173
G1 X141.801 Y150.981 E.36236
G1 X141.446 Y151.172
G1 X151.665 Y161.392 E.36335
G1 X151.338 Y161.61
G1 X141.089 Y151.361 E.3644
G1 X140.727 Y151.544
G1 X151.007 Y161.824 E.36552
G1 X150.673 Y162.035
G1 X140.361 Y151.723 E.36666
G1 X139.99 Y151.898
G1 X150.339 Y162.247 E.36795
G1 X149.998 Y162.451
G1 X139.615 Y152.068 E.36918
G1 X139.237 Y152.235
G1 X149.657 Y162.656 E.3705
G1 X149.313 Y162.858
G1 X138.851 Y152.395 E.372
G1 X138.463 Y152.552
G1 X148.965 Y163.055 E.37343
G1 X148.617 Y163.252
G1 X138.069 Y152.704 E.37504
G1 X137.67 Y152.85
G1 X148.263 Y163.444 E.37666
G1 X147.908 Y163.634
G1 X137.268 Y152.994 E.37832
G1 X136.858 Y153.129
G1 X147.551 Y163.823 E.38021
G1 X147.189 Y164.005
G1 X136.444 Y153.261 E.38202
G1 X136.026 Y153.388
G1 X146.826 Y164.188 E.384
G1 X146.459 Y164.366
G1 X135.6 Y153.508 E.38607
G1 X135.171 Y153.624
G1 X146.088 Y164.541 E.38817
G1 X145.718 Y164.716
G1 X134.735 Y153.733 E.3905
G1 X134.292 Y153.836
G1 X145.34 Y164.884 E.3928
G1 X144.962 Y165.051
G1 X133.846 Y153.935 E.39525
G1 X133.391 Y154.025
G1 X144.58 Y165.215 E.39785
G1 X144.195 Y165.374
G1 X132.93 Y154.109 E.40053
G1 X132.463 Y154.189
G1 X143.809 Y165.534 E.4034
G1 X143.415 Y165.686
G1 X131.988 Y154.259 E.40629
G1 X131.506 Y154.322
G1 X143.022 Y165.838 E.40944
G1 X142.624 Y165.985
G1 X131.018 Y154.379 E.41266
G1 X130.521 Y154.428
G1 X142.222 Y166.129 E.41603
G1 X141.82 Y166.272
G1 X130.015 Y154.467 E.41973
G1 X129.501 Y154.499
G1 X141.41 Y166.408 E.42341
G1 X141 Y166.543
G1 X128.98 Y154.523 E.42738
G1 X128.448 Y154.536
G1 X140.584 Y166.673 E.43153
G1 X140.166 Y166.8
G1 X127.904 Y154.538 E.43596
G1 X127.352 Y154.531
G1 X139.745 Y166.924 E.44065
G1 X139.318 Y167.043
G1 X126.789 Y154.513 E.44549
G1 X126.214 Y154.484
G1 X138.891 Y167.161 E.45073
G1 X138.456 Y167.271
G1 X125.625 Y154.441 E.45619
G1 X125.022 Y154.383
G1 X138.019 Y167.38 E.46211
G1 X137.578 Y167.484
G1 X124.405 Y154.311 E.46837
G1 X123.772 Y154.223
G1 X137.132 Y167.584 E.47504
G1 X136.684 Y167.681
G1 X123.121 Y154.118 E.48224
G1 X122.451 Y153.994
G1 X136.229 Y167.772 E.48988
G1 X135.774 Y167.862
G1 X121.76 Y153.848 E.49828
G1 X121.044 Y153.678
G1 X135.309 Y167.943 E.50719
G1 X134.844 Y168.023
G1 X120.302 Y153.481 E.51706
G1 X119.529 Y153.253
G1 X134.371 Y168.095 E.52773
G1 X133.896 Y168.166
G1 X118.72 Y152.99 E.53959
G1 X117.863 Y152.678
G1 X133.414 Y168.229 E.55295
G1 X132.929 Y168.289
G1 X116.954 Y152.314 E.568
G1 X115.977 Y151.883
G1 X132.438 Y168.344 E.58526
G1 X131.941 Y168.392
G1 X114.909 Y151.361 E.60557
M204 S10000
G1 X113.705 Y150.701 F30000
G1 F11668.197
M204 S2000
G1 X131.44 Y168.437 E.63058
G1 X130.932 Y168.474
G1 X112.271 Y149.813 E.6635
M204 S10000
G1 X110.299 Y148.386 F30000
G1 F11668.197
M204 S2000
G1 X130.42 Y168.507 E.71541
G1 X129.9 Y168.533
G1 X85.467 Y124.1 E1.57981
G1 X85.447 Y124.625
G1 X129.376 Y168.554 E1.5619
G1 X128.843 Y168.567
G1 X85.433 Y125.157 E1.54345
G1 X85.425 Y125.694
G1 X128.306 Y168.575 E1.52462
G1 X127.76 Y168.575
G1 X85.425 Y126.24 E1.50523
G1 X85.432 Y126.792
G1 X127.208 Y168.568 E1.48537
G1 X126.649 Y168.554
G1 X85.446 Y127.351 E1.465
G1 X85.468 Y127.919
G1 X126.081 Y168.532 E1.444
G1 X125.507 Y168.504
G1 X85.496 Y128.492 E1.4226
G1 X85.537 Y129.078
G1 X124.922 Y168.463 E1.40035
G1 X124.333 Y168.419
G1 X85.581 Y129.667 E1.37784
G1 X85.64 Y130.272
G1 X123.728 Y168.36 E1.35421
G1 X123.117 Y168.295
G1 X85.705 Y130.883 E1.33021
G1 X85.782 Y131.505
G1 X122.495 Y168.218 E1.30536
G1 X121.861 Y168.13
G1 X85.87 Y132.139 E1.27968
G1 X85.965 Y132.779
G1 X121.221 Y168.034 E1.25351
G1 X120.561 Y167.92
G1 X86.08 Y133.439 E1.22597
G1 X86.204 Y134.109
G1 X119.891 Y167.796 E1.19775
G1 X119.21 Y167.66
G1 X86.34 Y134.79 E1.16872
G1 X86.497 Y135.492
G1 X118.508 Y167.503 E1.13817
G1 X117.792 Y167.333
G1 X86.667 Y136.208 E1.10667
G1 X86.852 Y136.939
G1 X117.061 Y167.148 E1.0741
G1 X116.307 Y166.939
G1 X87.061 Y137.693 E1.03986
G1 X87.292 Y138.469
G1 X115.531 Y166.708 E1.00404
G1 X114.732 Y166.455
G1 X87.545 Y139.268 E.96663
G1 X87.824 Y140.092
G1 X113.908 Y166.176 E.9274
G1 X113.054 Y165.867
G1 X88.133 Y140.946 E.88605
G1 X88.477 Y141.836
G1 X112.164 Y165.523 E.84222
G1 X111.233 Y165.138
G1 X88.862 Y142.767 E.7954
G1 X89.297 Y143.747
G1 X110.253 Y164.703 E.7451
G1 X109.212 Y164.207
G1 X89.793 Y144.788 E.69044
G1 X90.364 Y145.905
G1 X108.095 Y163.636 E.63042
; WIPE_START
M204 S10000
G1 X106.681 Y162.221 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.883 Y162.969 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X91.031 Y147.117 E.56363
; WIPE_START
M204 S10000
G1 X92.445 Y148.531 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.831 Y148.462 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X105.538 Y162.169 E.48733
; WIPE_START
M204 S10000
G1 X104.123 Y160.755 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.974 Y161.15 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X92.85 Y150.026 E.39551
; WIPE_START
M204 S10000
G1 X94.264 Y151.441 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.313 Y152.035 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X101.965 Y159.687 E.2721
; WIPE_START
M204 S10000
G1 X100.551 Y158.273 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.721 Y153.78 Z5.4 F30000
G1 X167.313 Y109.655 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101416
G1 F18000
G1 X167.233 Y109.536 E.00063
; LINE_WIDTH: 0.143028
G1 X167.154 Y109.417 E.00102
; LINE_WIDTH: 0.18464
G1 X167.074 Y109.297 E.00141
; WIPE_START
G1 X167.154 Y109.417 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P84 R7
G1 X166.434 Y107.685 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102277
G1 F18000
G1 X166.357 Y107.575 E.0006
; LINE_WIDTH: 0.14564
G1 X166.279 Y107.465 E.00098
; LINE_WIDTH: 0.198659
G2 X166.144 Y107.275 I-7.383 J5.117 E.00249
; WIPE_START
G1 X166.279 Y107.465 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X165.286 Y105.445 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.103539
G1 F18000
G1 X165.16 Y105.279 E.00094
; LINE_WIDTH: 0.149397
G1 X165.033 Y105.112 E.00157
; LINE_WIDTH: 0.195256
G1 X164.907 Y104.946 E.00219
G1 X164.542 Y104.154 F30000
; LINE_WIDTH: 0.103138
G1 F18000
G1 X164.424 Y104.003 E.00086
; LINE_WIDTH: 0.148195
G1 X164.306 Y103.852 E.00142
; LINE_WIDTH: 0.193252
G1 X164.188 Y103.701 E.00199
; LINE_WIDTH: 0.21952
G1 X164.107 Y103.6 E.00156
; WIPE_START
G1 X164.188 Y103.701 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X163.634 Y102.701 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.102886
G1 F18000
G1 X163.475 Y102.507 E.00112
; LINE_WIDTH: 0.141933
G1 X163.346 Y102.35 E.00143
; LINE_WIDTH: 0.175483
G1 X163.217 Y102.193 E.00187
; LINE_WIDTH: 0.209034
G1 X163.089 Y102.036 E.00231
; WIPE_START
G1 X163.217 Y102.193 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.411 Y100.931 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.101808
G1 F18000
G1 X162.218 Y100.707 E.0013
; LINE_WIDTH: 0.144204
G1 X162.024 Y100.483 E.00212
; LINE_WIDTH: 0.186601
G1 X161.831 Y100.259 E.00294
; LINE_WIDTH: 0.220631
G1 X161.626 Y100.028 E.00376
; WIPE_START
G1 X161.831 Y100.259 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.336 Y98.31 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.104687
G1 F18000
G1 X159.876 Y97.814 E.00311
; LINE_WIDTH: 0.141567
G1 X159.515 Y97.436 E.00365
; LINE_WIDTH: 0.167201
G1 X159.155 Y97.058 E.00452
; LINE_WIDTH: 0.197083
G2 X156.942 Y94.844 I-68.764 J66.55 E.03321
; LINE_WIDTH: 0.167189
G1 X156.564 Y94.484 E.00452
; LINE_WIDTH: 0.141544
G1 X156.185 Y94.124 E.00365
; LINE_WIDTH: 0.104671
G1 X155.69 Y93.663 E.0031
; WIPE_START
G1 X156.185 Y94.124 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.972 Y92.374 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.2206
G1 F18000
G1 X153.741 Y92.169 E.00376
; LINE_WIDTH: 0.186559
G1 X153.517 Y91.975 E.00293
; LINE_WIDTH: 0.144181
G1 X153.293 Y91.782 E.00212
; LINE_WIDTH: 0.101804
G1 X153.069 Y91.589 E.0013
; WIPE_START
G1 X153.293 Y91.782 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.964 Y90.911 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.20161
G1 F18000
G1 X151.742 Y90.73 E.00313
; LINE_WIDTH: 0.153213
G1 X151.521 Y90.548 E.00222
; LINE_WIDTH: 0.104816
G1 X151.299 Y90.366 E.00132
; WIPE_START
G1 X151.521 Y90.548 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.4 Y89.893 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.219356
G1 F18000
G1 X150.298 Y89.812 E.00157
; LINE_WIDTH: 0.192983
G1 X150.147 Y89.694 E.00198
; LINE_WIDTH: 0.14804
G1 X149.996 Y89.576 E.00142
; LINE_WIDTH: 0.103097
G1 X149.846 Y89.459 E.00086
G1 X149.054 Y89.093 F30000
; LINE_WIDTH: 0.195255
G1 F18000
G1 X148.888 Y88.967 E.00219
; LINE_WIDTH: 0.149395
G1 X148.721 Y88.84 E.00157
; LINE_WIDTH: 0.103536
G1 X148.555 Y88.714 E.00094
G1 X147.842 Y88.427 F30000
; LINE_WIDTH: 0.199376
G1 F18000
G1 X147.716 Y88.334 E.00169
; LINE_WIDTH: 0.166852
G1 X147.59 Y88.24 E.00135
; LINE_WIDTH: 0.13309
G1 X147.491 Y88.169 E.00078
; LINE_WIDTH: 0.0981021
G1 X147.393 Y88.098 E.00051
; WIPE_START
G1 X147.491 Y88.169 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X145.683 Y87.36 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.187081
G1 F18000
G1 X145.556 Y87.273 E.00153
; LINE_WIDTH: 0.144498
G1 X145.43 Y87.187 E.0011
; LINE_WIDTH: 0.101915
G1 X145.303 Y87.1 E.00068
; WIPE_START
G1 X145.43 Y87.187 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.023 Y89.03 Z5.4 F30000
G1 X99.936 Y98.513 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0998767
G1 F18000
G1 X99.653 Y98.259 E.00162
; LINE_WIDTH: 0.138402
G1 X99.37 Y98.006 E.00258
; LINE_WIDTH: 0.176928
G1 X99.087 Y97.752 E.00353
; LINE_WIDTH: 0.215453
G1 X98.804 Y97.499 E.00449
; WIPE_START
G1 X99.087 Y97.752 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.668 Y100.699 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0998807
G1 F18000
G1 X102.385 Y100.445 E.00162
; LINE_WIDTH: 0.138413
G1 X102.102 Y100.192 E.00258
; LINE_WIDTH: 0.176946
G1 X101.819 Y99.939 E.00353
; LINE_WIDTH: 0.215478
G1 X101.536 Y99.685 E.00449
; WIPE_START
G1 X101.819 Y99.939 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.399 Y102.885 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0998786
G1 F18000
G1 X105.116 Y102.632 E.00162
; LINE_WIDTH: 0.138408
G1 X104.833 Y102.378 E.00258
; LINE_WIDTH: 0.176937
G1 X104.55 Y102.125 E.00353
; LINE_WIDTH: 0.215466
G1 X104.267 Y101.871 E.00449
; WIPE_START
G1 X104.55 Y102.125 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.131 Y105.071 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0998807
G1 F18000
G1 X107.848 Y104.818 E.00162
; LINE_WIDTH: 0.138413
G1 X107.565 Y104.564 E.00258
; LINE_WIDTH: 0.176946
G1 X107.282 Y104.311 E.00353
; LINE_WIDTH: 0.215478
G1 X106.999 Y104.058 E.00449
; WIPE_START
G1 X107.282 Y104.311 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.438 Y101.658 Z5.4 F30000
G1 X125.672 Y97.493 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.1034
G1 F18000
G1 X125.459 Y97.592 E.00106
; WIPE_START
G1 X125.672 Y97.493 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.248 Y98.424 Z5.4 F30000
G1 X136.837 Y98.865 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.182193
G1 F18000
G2 X136.536 Y98.682 I-10.071 J16.24 E.0034
G1 X140.488 Y100.337 F30000
; LINE_WIDTH: 0.102263
G1 F18000
G1 X140.354 Y100.243 E.00073
; LINE_WIDTH: 0.145571
G1 X140.22 Y100.148 E.00119
; LINE_WIDTH: 0.188879
G1 X140.086 Y100.054 E.00165
G1 X141.611 Y100.915 F30000
; LINE_WIDTH: 0.102905
G1 F18000
G1 X141.459 Y100.802 E.00085
; LINE_WIDTH: 0.147479
G1 X141.306 Y100.689 E.0014
; LINE_WIDTH: 0.192053
G1 X141.153 Y100.576 E.00195
G1 X142.894 Y101.654 F30000
; LINE_WIDTH: 0.103656
G1 F18000
G1 X142.74 Y101.534 E.00089
; LINE_WIDTH: 0.149716
G1 X142.586 Y101.413 E.00147
; LINE_WIDTH: 0.189184
G1 X142.431 Y101.293 E.00198
G1 X142.282 Y101.312 E.00152
G1 X144.49 Y102.706 F30000
; LINE_WIDTH: 0.0976993
G1 F18000
G1 X144.329 Y102.57 E.00087
; LINE_WIDTH: 0.131982
G1 X144.167 Y102.434 E.00135
; LINE_WIDTH: 0.168363
G1 X143.978 Y102.279 E.00213
; LINE_WIDTH: 0.20666
G1 X143.79 Y102.125 E.00273
G1 X147.301 Y104.973 F30000
; LINE_WIDTH: 0.0931038
G1 F18000
G1 X146.916 Y104.606 E.00204
; LINE_WIDTH: 0.118489
G1 X146.659 Y104.368 E.00192
; LINE_WIDTH: 0.144333
G1 X146.402 Y104.129 E.00252
; LINE_WIDTH: 0.17448
G1 X146.142 Y103.893 E.0032
; LINE_WIDTH: 0.215451
G1 X145.762 Y103.552 E.00603
G1 X150.448 Y108.238 F30000
; LINE_WIDTH: 0.22984
G1 F18000
G1 X150.342 Y108.118 E.00204
; LINE_WIDTH: 0.208862
G1 X150.106 Y107.858 E.00399
; LINE_WIDTH: 0.174352
G1 X149.87 Y107.597 E.00322
; LINE_WIDTH: 0.144214
G1 X149.632 Y107.34 E.0025
; LINE_WIDTH: 0.118445
G1 X149.393 Y107.084 E.00192
; LINE_WIDTH: 0.0930831
G1 X149.027 Y106.699 E.00203
G1 X151.875 Y110.21 F30000
; LINE_WIDTH: 0.206645
G1 F18000
G1 X151.721 Y110.021 E.00274
; LINE_WIDTH: 0.168175
G1 X151.565 Y109.832 E.00214
; LINE_WIDTH: 0.131788
G1 X151.43 Y109.671 E.00134
; LINE_WIDTH: 0.0976686
G1 X151.294 Y109.51 E.00087
G1 X152.688 Y111.718 F30000
; LINE_WIDTH: 0.181585
G1 F18000
G1 X152.707 Y111.569 E.00145
; LINE_WIDTH: 0.195751
G1 X152.587 Y111.414 E.00206
; LINE_WIDTH: 0.149694
G1 X152.466 Y111.26 E.00147
; LINE_WIDTH: 0.103638
G1 X152.346 Y111.106 E.00088
G1 X153.424 Y112.847 F30000
; LINE_WIDTH: 0.192035
G1 F18000
G1 X153.311 Y112.694 E.00195
; LINE_WIDTH: 0.14747
G1 X153.198 Y112.541 E.0014
; LINE_WIDTH: 0.102905
G1 X153.085 Y112.389 E.00085
G1 X153.946 Y113.914 F30000
; LINE_WIDTH: 0.188902
G1 F18000
G1 X153.852 Y113.78 E.00165
; LINE_WIDTH: 0.145585
G1 X153.757 Y113.646 E.00119
; LINE_WIDTH: 0.102268
G1 X153.663 Y113.512 E.00073
G1 X155.318 Y117.464 F30000
; LINE_WIDTH: 0.181869
G1 F18000
G2 X155.136 Y117.162 I-36.877 J22.043 E.00339
; WIPE_START
G1 X155.318 Y117.464 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.149 Y125.051 Z5.4 F30000
G1 X156.508 Y128.328 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.103569
G1 F18000
G1 X156.407 Y128.542 E.00107
; WIPE_START
G1 X156.508 Y128.328 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.122 Y133.737 Z5.4 F30000
M73 P84 R6
G1 X130.541 Y154.408 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.103317
G1 F18000
G1 X130.328 Y154.507 E.00106
; WIPE_START
G1 X130.541 Y154.408 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.945 Y153.661 Z5.4 F30000
G1 X119.463 Y153.318 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.182245
G1 F18000
G3 X119.162 Y153.136 I14.124 J-23.692 E.0034
G1 X115.914 Y151.946 F30000
; LINE_WIDTH: 0.188889
G1 F18000
G1 X115.78 Y151.852 E.00165
; LINE_WIDTH: 0.145577
G1 X115.646 Y151.757 E.00119
; LINE_WIDTH: 0.102265
G1 X115.511 Y151.663 E.00073
G1 X114.847 Y151.423 F30000
; LINE_WIDTH: 0.20294
G1 F18000
G1 X114.709 Y151.322 E.00188
; LINE_WIDTH: 0.172514
G1 X114.602 Y151.243 E.0012
; LINE_WIDTH: 0.135756
G1 X114.495 Y151.164 E.00088
; LINE_WIDTH: 0.0989965
G1 X114.389 Y151.084 E.00056
G1 X113.718 Y150.688 F30000
; LINE_WIDTH: 0.180163
G1 F18000
G1 X113.568 Y150.707 E.00143
; LINE_WIDTH: 0.195765
G1 X113.414 Y150.587 E.00206
; LINE_WIDTH: 0.149709
G1 X113.26 Y150.466 E.00147
; LINE_WIDTH: 0.103654
G1 X113.105 Y150.346 E.00088
G1 X112.209 Y149.875 F30000
; LINE_WIDTH: 0.206667
G1 F18000
G1 X112.021 Y149.721 E.00273
; LINE_WIDTH: 0.168273
G1 X111.832 Y149.565 E.00214
; LINE_WIDTH: 0.136312
G1 X111.719 Y149.47 E.00098
; LINE_WIDTH: 0.101058
G1 X111.509 Y149.294 E.00119
G1 X110.237 Y148.448 F30000
; LINE_WIDTH: 0.229897
G1 F18000
G1 X110.118 Y148.342 E.00203
; LINE_WIDTH: 0.208975
G1 X109.858 Y148.107 E.00399
; LINE_WIDTH: 0.17447
G1 X109.597 Y147.87 E.00322
; LINE_WIDTH: 0.144326
G1 X109.341 Y147.632 E.00251
; LINE_WIDTH: 0.118529
G1 X109.083 Y147.393 E.00193
; LINE_WIDTH: 0.0931199
G1 X108.697 Y147.025 E.00204
G1 X106.975 Y145.303 F30000
; LINE_WIDTH: 0.0931533
G1 F18000
G1 X106.606 Y144.916 E.00205
; LINE_WIDTH: 0.118559
G1 X106.368 Y144.66 E.00192
; LINE_WIDTH: 0.144345
G1 X106.13 Y144.403 E.00252
; LINE_WIDTH: 0.17449
G1 X105.894 Y144.143 E.0032
; LINE_WIDTH: 0.215454
G1 X105.553 Y143.763 E.00603
G1 X104.706 Y142.491 F30000
; LINE_WIDTH: 0.0976979
G1 F18000
G1 X104.57 Y142.33 E.00087
; LINE_WIDTH: 0.131989
G1 X104.434 Y142.167 E.00135
; LINE_WIDTH: 0.168366
G1 X104.279 Y141.979 E.00213
; LINE_WIDTH: 0.206672
G1 X104.125 Y141.791 E.00274
G1 X103.654 Y140.895 F30000
; LINE_WIDTH: 0.103639
G1 F18000
G1 X103.534 Y140.74 E.00088
; LINE_WIDTH: 0.149697
G1 X103.413 Y140.586 E.00147
; LINE_WIDTH: 0.189557
G1 X103.293 Y140.432 E.00198
G1 X103.312 Y140.282 E.00153
G1 X102.916 Y139.611 F30000
; LINE_WIDTH: 0.10292
G1 F18000
G1 X102.802 Y139.459 E.00085
; LINE_WIDTH: 0.147514
G1 X102.689 Y139.306 E.0014
; LINE_WIDTH: 0.192109
G1 X102.576 Y139.154 E.00195
G1 X101.872 Y137.478 F30000
; LINE_WIDTH: 0.102272
G1 F18000
G1 X101.798 Y137.371 E.00058
; LINE_WIDTH: 0.145849
G1 X101.724 Y137.263 E.00096
; LINE_WIDTH: 0.186645
G1 X101.622 Y137.11 E.00182
G1 X100.62 Y134.047 F30000
; LINE_WIDTH: 0.12105
G1 F18000
G1 X100.452 Y133.766 E.00185
G1 X99.729 Y129.886 F30000
; LINE_WIDTH: 0.094701
G1 F18000
G1 X99.619 Y129.665 E.00097
G1 X99.494 Y128.582 F30000
; LINE_WIDTH: 0.117944
G1 F18000
G1 X99.577 Y128.357 E.00131
; WIPE_START
G1 X99.494 Y128.582 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.207 Y121.144 Z5.4 F30000
G1 X103.418 Y111.541 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.331533
G1 F15141.503
G1 X103.087 Y111.245 E.00861
; LINE_WIDTH: 0.285911
G1 F17887.321
G1 X102.756 Y110.949 E.00729
; LINE_WIDTH: 0.24029
G1 F18000
G1 X102.424 Y110.652 E.00597
; LINE_WIDTH: 0.194668
G1 X102.093 Y110.356 E.00464
; LINE_WIDTH: 0.149047
G1 X101.762 Y110.06 E.00332
; LINE_WIDTH: 0.103425
G1 X101.431 Y109.763 E.002
; WIPE_START
G1 X101.762 Y110.06 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.832 Y108.591 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.215466
G1 F18000
G1 X99.549 Y108.337 E.00449
; LINE_WIDTH: 0.176937
G1 X99.266 Y108.084 E.00353
; LINE_WIDTH: 0.138408
G1 X98.983 Y107.83 E.00258
; LINE_WIDTH: 0.0998787
G1 X98.7 Y107.577 E.00162
; WIPE_START
G1 X98.983 Y107.83 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.1 Y106.404 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.215466
G1 F18000
G1 X96.817 Y106.151 E.00449
; LINE_WIDTH: 0.176937
G1 X96.534 Y105.898 E.00353
; LINE_WIDTH: 0.138408
G1 X96.251 Y105.644 E.00258
; LINE_WIDTH: 0.0998786
G1 X95.968 Y105.391 E.00162
; WIPE_START
G1 X96.251 Y105.644 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.369 Y104.218 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.215466
G1 F18000
G1 X94.086 Y103.965 E.00449
; LINE_WIDTH: 0.176937
G1 X93.803 Y103.711 E.00353
; LINE_WIDTH: 0.138408
G1 X93.52 Y103.458 E.00258
; LINE_WIDTH: 0.0998786
G1 X93.237 Y103.205 E.00162
; WIPE_START
G1 X93.52 Y103.458 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.632 Y111.039 Z5.4 F30000
G1 X88.926 Y142.703 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.184642
G1 F18000
G1 X88.847 Y142.584 E.00141
; LINE_WIDTH: 0.143029
G1 X88.767 Y142.464 E.00102
; LINE_WIDTH: 0.101416
G1 X88.687 Y142.345 E.00063
; WIPE_START
G1 X88.767 Y142.464 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.856 Y144.725 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.211835
G1 F18000
G1 X89.798 Y144.645 E.00114
; LINE_WIDTH: 0.188902
G1 X89.721 Y144.535 E.00135
; LINE_WIDTH: 0.145585
G1 X89.644 Y144.426 E.00097
; LINE_WIDTH: 0.102268
G1 X89.566 Y144.316 E.0006
; WIPE_START
G1 X89.644 Y144.426 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.093 Y147.054 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.195254
G1 F18000
G1 X90.967 Y146.888 E.00219
; LINE_WIDTH: 0.149396
G1 X90.84 Y146.722 E.00157
; LINE_WIDTH: 0.103538
G1 X90.714 Y146.555 E.00094
; WIPE_START
G1 X90.84 Y146.722 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.893 Y148.4 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.219394
G1 F18000
G1 X91.812 Y148.299 E.00157
; LINE_WIDTH: 0.193049
G1 X91.694 Y148.148 E.00198
; LINE_WIDTH: 0.148073
G1 X91.576 Y147.997 E.00142
; LINE_WIDTH: 0.103097
G1 X91.459 Y147.846 E.00086
; WIPE_START
G1 X91.576 Y147.997 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.912 Y149.964 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.201602
G1 F18000
G1 X92.73 Y149.743 E.00313
; LINE_WIDTH: 0.153205
G1 X92.548 Y149.521 E.00222
; LINE_WIDTH: 0.104808
G1 X92.366 Y149.3 E.00132
; WIPE_START
G1 X92.548 Y149.521 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.374 Y151.973 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.220561
G1 F18000
G1 X94.169 Y151.741 E.00377
; LINE_WIDTH: 0.186481
G1 X93.976 Y151.517 E.00293
; LINE_WIDTH: 0.144132
G1 X93.783 Y151.293 E.00212
; LINE_WIDTH: 0.101784
G1 X93.589 Y151.069 E.0013
; WIPE_START
G1 X93.783 Y151.293 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.971 Y156.891 Z5.4 F30000
G1 X100.309 Y158.336 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.104615
G1 F18000
G1 X99.815 Y157.876 E.00309
; LINE_WIDTH: 0.141418
G1 X99.436 Y157.516 E.00365
; LINE_WIDTH: 0.167064
G1 X99.058 Y157.156 E.00452
; LINE_WIDTH: 0.196981
G3 X96.844 Y154.942 I66.531 J-68.746 E.03319
; LINE_WIDTH: 0.167098
G1 X96.484 Y154.564 E.00452
; LINE_WIDTH: 0.141485
G1 X96.124 Y154.186 E.00365
; LINE_WIDTH: 0.10463
G1 X95.664 Y153.691 E.0031
; WIPE_START
G1 X96.124 Y154.186 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.757 Y159.337 Z5.4 F30000
G1 X102.931 Y160.41 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.101777
G1 F18000
G1 X102.707 Y160.218 E.0013
; LINE_WIDTH: 0.144099
G1 X102.483 Y160.025 E.00211
; LINE_WIDTH: 0.18642
G1 X102.26 Y159.832 E.00293
; LINE_WIDTH: 0.220508
G1 X102.027 Y159.626 E.00377
; WIPE_START
G1 X102.26 Y159.832 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.7 Y161.634 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.104815
G1 F18000
G1 X104.479 Y161.452 E.00132
; LINE_WIDTH: 0.153212
G1 X104.257 Y161.27 E.00222
; LINE_WIDTH: 0.201608
G1 X104.036 Y161.088 E.00313
; WIPE_START
G1 X104.257 Y161.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.154 Y162.541 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.103078
G1 F18000
G1 X106.003 Y162.424 E.00086
; LINE_WIDTH: 0.147983
G1 X105.853 Y162.306 E.00142
; LINE_WIDTH: 0.192889
G1 X105.702 Y162.189 E.00198
; LINE_WIDTH: 0.219296
G1 X105.6 Y162.107 E.00158
; WIPE_START
G1 X105.702 Y162.189 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.445 Y163.286 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.103536
G1 F18000
G1 X107.278 Y163.16 E.00094
; LINE_WIDTH: 0.149395
G1 X107.112 Y163.033 E.00157
; LINE_WIDTH: 0.195254
G1 X106.946 Y162.907 E.00219
; WIPE_START
G1 X107.112 Y163.033 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.607 Y163.902 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0980838
G1 F18000
G1 X108.508 Y163.831 E.00051
; LINE_WIDTH: 0.133037
G1 X108.41 Y163.76 E.00078
; LINE_WIDTH: 0.166801
G1 X108.284 Y163.666 E.00135
; LINE_WIDTH: 0.19935
G1 X108.158 Y163.573 E.00169
; WIPE_START
G1 X108.284 Y163.666 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.696 Y164.9 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.101915
G1 F18000
G1 X110.57 Y164.813 E.00068
; LINE_WIDTH: 0.144498
G1 X110.443 Y164.726 E.0011
; LINE_WIDTH: 0.187081
G1 X110.317 Y164.64 E.00153
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X110.443 Y164.726 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/58
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.4 I.598 J1.06 P1  F30000
G1 X128.351 Y154.618 Z5.4
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X103.107 Y111.875 I-.349 J-28.62 E1.62797
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35437
G1 X108.764 Y104.807 E.04377
G3 X128.363 Y97.379 I19.244 J21.205 E.58147
G3 X128.411 Y154.618 I-.362 J28.62 E2.41563
G1 X128.356 Y155.028 F30000
G1 F9000
G3 X102.989 Y111.248 I-.357 J-29.033 E1.66468
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06655
G3 X128.369 Y96.963 I19.916 J21.273 E.60303
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.027 I-.37 J29.032 E2.45036
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.881 Y110.648 I-.362 J-29.433 E1.57748
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95244
G1 X107.517 Y104.855 E.08195
G3 X128.374 Y96.563 I20.524 J21.246 E.57883
G3 X128.421 Y155.428 I-.375 J29.433 E2.30488
; WIPE_START
M204 S10000
G1 X127.639 Y155.438 E-.29711
G1 X126.422 Y155.393 E-.46289
; WIPE_END
G1 E-.04 F1800
G1 X125.15 Y147.867 Z5.56 F30000
G1 X117.198 Y100.799 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
G3 X119.719 Y99.861 I10.778 J25.129 E.06766
G3 X122.321 Y99.176 I8.285 J26.152 E.06767
G3 X101.478 Y119.011 I5.674 J26.83 E3.57043
G3 X103.861 Y112.991 I26.91 J7.169 E.16314
G1 X103.23 Y112.486 E.02032
G2 X122.154 Y98.389 I24.775 J13.509 E3.84554
G2 X109.387 Y104.793 I5.93 J27.753 E.363
G1 X110.018 Y105.298 E.02032
G3 X117.143 Y100.823 I18.025 J20.787 E.21236
G1 X110.011 Y104.779 F30000
; LINE_WIDTH: 0.443791
G1 F10990.229
G3 X100.642 Y120.923 I17.984 J21.227 E4.15785
G3 X103.325 Y113.151 I27.153 J5.022 E.22026
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10990.229
G1 X102.992 Y113.801 E-.27735
G1 X102.467 Y114.957 E-.48265
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/58
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.56 I-1.019 J.665 P1  F30000
G1 X128.351 Y154.619 Z5.56
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X103.107 Y111.875 I-.349 J-28.62 E1.62798
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35437
G1 X108.763 Y104.807 E.04377
G3 X128.39 Y97.379 I19.243 J21.204 E.58218
G3 X128.411 Y154.618 I-.388 J28.619 E2.41491
G1 X128.356 Y155.028 F30000
G1 F9000
G3 X102.989 Y111.248 I-.357 J-29.033 E1.66469
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06654
G3 X128.395 Y96.964 I19.914 J21.269 E.60373
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.028 I-.396 J29.032 E2.44963
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.881 Y110.648 I-.363 J-29.433 E1.57749
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95244
G1 X107.517 Y104.855 E.08195
G3 X128.4 Y96.563 I20.523 J21.244 E.5795
G3 X128.421 Y155.428 I-.402 J29.433 E2.3042
; WIPE_START
M204 S10000
G1 X127.639 Y155.438 E-.29711
G1 X126.422 Y155.393 E-.46289
; WIPE_END
G1 E-.04 F1800
G1 X120.184 Y150.995 Z5.72 F30000
G1 X104.311 Y139.806 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
G3 X102.794 Y136.811 I25.197 J-14.651 E.08446
G3 X101.855 Y134.288 I31.535 J-13.165 E.0677
G3 X103.861 Y112.991 I26.147 J-8.281 E.55246
G1 X103.23 Y112.486 E.02032
G2 X122.155 Y98.389 I24.775 J13.509 E3.84553
G2 X109.387 Y104.793 I5.93 J27.753 E.363
G1 X110.018 Y105.298 E.02032
G3 X104.342 Y139.858 I17.986 J20.7 E3.37677
; WIPE_START
G1 X104.671 Y140.422 E-.24834
G1 X105.384 Y141.517 E-.49639
G1 X105.408 Y141.549 E-.01527
; WIPE_END
G1 E-.04 F1800
G1 X106.356 Y133.976 Z5.72 F30000
G1 X110.011 Y104.779 Z5.72
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.443815
G1 F10989.578
G3 X100.65 Y120.904 I17.986 J21.222 E4.1582
G3 X103.325 Y113.151 I26.969 J4.968 E.21973
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10989.578
G1 X102.696 Y114.427 E-.54048
G1 X102.469 Y114.958 E-.21952
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/58
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.72 I-1.019 J.665 P1  F30000
G1 X128.351 Y154.619 Z5.72
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X103.107 Y111.875 I-.35 J-28.62 E1.62799
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35437
M73 P85 R6
G1 X108.763 Y104.807 E.04377
G3 X128.416 Y97.38 I19.242 J21.202 E.58288
G3 X128.411 Y154.618 I-.415 J28.619 E2.41419
G1 X128.356 Y155.029 F30000
G1 F9000
G3 X102.989 Y111.248 I-.357 J-29.032 E1.6647
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06655
G3 X128.421 Y96.964 I19.913 J21.269 E.60445
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.028 I-.423 J29.032 E2.44891
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.881 Y110.648 I-.363 J-29.433 E1.5775
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95244
G1 X107.517 Y104.855 E.08195
G3 X128.427 Y96.564 I20.522 J21.242 E.58016
G3 X128.421 Y155.428 I-.429 J29.432 E2.30352
; WIPE_START
M204 S10000
G1 X127.639 Y155.438 E-.2971
G1 X126.422 Y155.393 E-.4629
; WIPE_END
G1 E-.04 F1800
G1 X122.786 Y148.682 Z5.88 F30000
G1 X103.661 Y113.376 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
G1 X103.861 Y112.991 E.01091
G1 X103.23 Y112.486 E.02032
G2 X122.155 Y98.389 I24.775 J13.509 E3.84553
G2 X109.387 Y104.793 I5.93 J27.753 E.363
G1 X110.018 Y105.298 E.02032
G3 X100.575 Y125.659 I17.978 J20.708 E3.75053
G3 X103.633 Y113.429 I27.57 J.396 E.31977
; WIPE_START
G1 X103.351 Y113.971 E-.23198
G1 X103.062 Y114.584 E-.25757
G1 X102.781 Y115.238 E-.27045
; WIPE_END
G1 E-.04 F1800
G1 X107.121 Y108.96 Z5.88 F30000
G1 X110.011 Y104.779 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.443792
G1 F10990.199
G3 X100.65 Y120.903 I17.986 J21.222 E4.15799
G3 X103.325 Y113.151 I27.521 J5.158 E.21968
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10990.199
G1 X102.696 Y114.427 E-.54042
G1 X102.469 Y114.958 E-.21958
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/58
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.88 I-1.019 J.665 P1  F30000
G1 X128.351 Y154.619 Z5.88
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X103.107 Y111.875 I-.35 J-28.62 E1.628
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35437
G1 X108.764 Y104.807 E.04377
G3 X128.442 Y97.381 I19.241 J21.2 E.58359
G3 X128.411 Y154.618 I-.441 J28.618 E2.41346
G1 X128.356 Y155.029 F30000
G1 F9000
G3 X102.989 Y111.248 I-.357 J-29.032 E1.66471
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06654
G3 X128.447 Y96.965 I19.912 J21.266 E.60516
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.028 I-.449 J29.031 E2.44818
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.881 Y110.648 I-.363 J-29.433 E1.5775
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95244
G1 X107.517 Y104.855 E.08195
G3 X128.453 Y96.564 I20.521 J21.241 E.58082
G3 X128.421 Y155.429 I-.455 J29.432 E2.30284
; WIPE_START
M204 S10000
G1 X127.639 Y155.438 E-.29709
G1 X126.422 Y155.393 E-.46291
; WIPE_END
G1 E-.04 F1800
G1 X128.975 Y148.2 Z6.04 F30000
G1 X144.602 Y104.18 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
G3 X146.661 Y105.911 I-16.225 J21.394 E.06766
G3 X148.54 Y107.837 I-18.672 J20.1 E.06767
G3 X103.861 Y112.991 I-20.541 J18.166 E3.00594
G1 X103.23 Y112.486 E.02032
G2 X122.154 Y98.389 I24.775 J13.509 E3.84554
G2 X109.387 Y104.793 I5.93 J27.753 E.363
G1 X110.018 Y105.298 E.02032
G3 X144.554 Y104.144 I17.978 J20.68 E.94
; WIPE_START
G1 X143.995 Y103.721 E-.26648
G1 X142.957 Y103.01 E-.47804
G1 X142.922 Y102.989 E-.01549
; WIPE_END
G1 E-.04 F1800
G1 X135.301 Y103.403 Z6.04 F30000
G1 X110.011 Y104.779 Z6.04
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.443785
G1 F10990.375
G3 X100.933 Y119.567 I17.986 J21.222 E4.19439
G3 X103.325 Y113.151 I27.055 J6.432 E.18322
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10990.375
G1 X102.696 Y114.427 E-.54042
G1 X102.469 Y114.958 E-.21958
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/58
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.04 I-1.019 J.665 P1  F30000
G1 X128.351 Y154.619 Z6.04
G1 Z5.8
M73 P86 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X103.107 Y111.875 I-.35 J-28.62 E1.628
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35437
G1 X108.764 Y104.807 E.04377
G3 X128.457 Y97.381 I19.273 J21.286 E.58393
G3 X128.411 Y154.618 I-.457 J28.618 E2.41303
G1 X128.356 Y155.029 F30000
G1 F9000
G3 X102.989 Y111.248 I-.357 J-29.032 E1.66471
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06654
G3 X128.468 Y96.966 I19.879 J21.181 E.60579
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.028 I-.469 J29.031 E2.44762
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.881 Y110.648 I-.363 J-29.433 E1.57751
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95243
G1 X107.517 Y104.855 E.08195
G3 X128.478 Y96.565 I20.488 J21.158 E.58152
G3 X128.421 Y155.429 I-.48 J29.431 E2.30222
; WIPE_START
M204 S10000
G1 X126.916 Y155.42 E-.57179
G1 X126.422 Y155.396 E-.18821
; WIPE_END
G1 E-.04 F1800
G1 X121.373 Y152.561 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X119.771 Y152.115 I3.735 J-16.51 E.04506
G2 X121.105 Y153.408 I4.605 J-3.416 E.05054
G2 X129.862 Y154.198 I6.899 J-27.522 E.23924
G2 X129.496 Y153.339 I-1.611 J.18 E.02567
G2 X133.722 Y152.769 I-1.433 J-26.563 E.11569
G1 X134.582 Y153.49 E.0304
G2 X140.683 Y151.255 I-6.84 J-28.124 E.17644
G3 X140.145 Y150.54 I1.474 J-1.669 E.02443
G2 X149.783 Y142.591 I-12.584 J-25.077 E.3414
G3 X150.008 Y143.727 I-5.35 J1.648 E.03145
G2 X153.79 Y137.556 I-25.052 J-19.596 E.19655
G3 X153.232 Y136.627 I1.947 J-1.803 E.02956
G2 X154.737 Y131.887 I-34.174 J-13.463 E.13487
G2 X155.627 Y131.017 I-4.998 J-6.003 E.03376
G1 X155.881 Y130.638 E.01238
G2 X156.257 Y126.584 I-49.805 J-6.658 E.11036
G2 X155.372 Y125.693 I-3.757 J2.846 E.03413
G2 X154.407 Y118.785 I-30.842 J.788 E.18941
G2 X155.145 Y118.112 I-3.832 J-4.948 E.02707
G2 X148.419 Y106.459 I-28.115 J8.46 E.36786
G2 X147.76 Y107.054 I3.389 J4.417 E.02409
G2 X142.954 Y103.063 I-20.195 J19.425 E.16962
G2 X143.228 Y102.193 I-2.202 J-1.171 E.02484
G2 X132.946 Y98.176 I-15.245 J23.849 E.30104
M73 P86 R5
G2 X133.685 Y99.215 I2.338 J-.88 E.03493
G2 X128.239 Y98.62 I-6.596 J35.156 E.1486
G3 X127.313 Y97.747 I4.996 J-6.222 E.03452
G2 X125.654 Y97.838 I.099 J16.926 E.04506
G1 X122.37 Y99.203 F30000
G1 F10826.06
G2 X120.755 Y99.597 I13.171 J57.601 E.04505
G3 X119.997 Y98.897 I2.979 J-3.986 E.028
G2 X116.348 Y100.254 I14.171 J43.686 E.10555
G1 X116.557 Y100.913 E.01874
G1 X116.558 Y101.132 E.00593
G2 X110.019 Y105.356 I11.506 J24.986 E.21165
G1 X109.62 Y105.037 E.01385
G1 X109.842 Y104.337 E.01991
G3 X111.15 Y103.311 I11.092 J12.792 E.04506
; WIPE_START
G1 X109.842 Y104.337 E-.63169
G1 X109.74 Y104.658 E-.12831
; WIPE_END
G1 E-.04 F1800
G1 X105.125 Y110.738 Z6.2 F30000
G1 X102.072 Y114.76 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F10826.06
G3 X102.772 Y113.252 I21.228 J8.94 E.04505
G1 X102.912 Y113.457 E.00671
G1 X103.178 Y114.444 E.0277
G2 X101.849 Y117.893 I24.629 J11.466 E.10025
G3 X100.61 Y119.018 I-7.651 J-7.184 E.04541
G2 X99.841 Y123.534 I43.354 J9.704 E.12418
G2 X100.659 Y124.609 I3.026 J-1.455 E.03685
G2 X101.259 Y131.854 I30.672 J1.108 E.19746
G1 X100.49 Y132.498 E.02718
G2 X108.476 Y146.433 I27.606 J-6.566 E.44124
G2 X109.135 Y145.838 I-2.526 J-3.455 E.02409
G2 X112.708 Y148.708 I19.401 J-20.493 E.12434
G2 X113.097 Y150.018 I3.718 J-.392 E.03723
G2 X114.536 Y150.851 I26.852 J-44.725 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X113.097 Y150.018 E-.63168
G1 X112.97 Y149.705 E-.12832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/58
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.2 I-.37 J1.159 P1  F30000
G1 X128.351 Y154.613 Z6.2
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X103.107 Y111.875 I-.352 J-28.617 E1.62784
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35437
G1 X108.764 Y104.807 E.04377
G3 X128.484 Y97.382 I19.272 J21.285 E.58465
G3 X128.411 Y154.612 I-.485 J28.615 E2.41195
G1 X128.356 Y155.035 F30000
G1 F9000
G3 X102.989 Y111.248 I-.356 J-29.035 E1.6649
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06654
G3 X128.494 Y96.966 I19.878 J21.179 E.60651
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.034 I-.494 J29.033 E2.44724
M204 S250
G1 X128.361 Y155.436 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.881 Y110.648 I-.362 J-29.436 E1.57768
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95244
G1 X107.517 Y104.855 E.08195
G3 X128.504 Y96.566 I20.487 J21.157 E.58218
G3 X128.421 Y155.435 I-.504 J29.434 E2.30187
; WIPE_START
M204 S10000
G1 X126.916 Y155.42 E-.57183
G1 X126.422 Y155.396 E-.18817
; WIPE_END
G1 E-.04 F1800
G1 X121.624 Y152.621 Z6.36 F30000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X120.019 Y152.187 I3.609 J-16.54 E.04506
G2 X121.318 Y153.458 I6.168 J-5.002 E.04935
G2 X129.718 Y154.207 I6.683 J-27.479 E.22938
G2 X129.304 Y153.349 I-1.818 J.347 E.02611
G2 X133.889 Y152.734 I-1.251 J-26.72 E.1255
G2 X134.698 Y153.459 I5.172 J-4.958 E.02948
G2 X140.624 Y151.284 I-6.877 J-27.899 E.17141
G3 X140.118 Y150.553 I1.499 J-1.579 E.02426
G2 X149.766 Y142.612 I-12.555 J-25.085 E.34146
G3 X149.91 Y143.85 I-4.725 J1.176 E.03386
G2 X153.764 Y137.613 I-24.894 J-19.691 E.1991
G3 X153.231 Y136.629 I2.07 J-1.757 E.03053
G2 X154.698 Y132.052 I-34.505 J-13.583 E.13035
G2 X155.698 Y131.017 I-5.02 J-5.854 E.03904
G1 X155.861 Y130.747 E.00855
G2 X156.247 Y126.85 I-48.144 J-6.738 E.10615
G2 X155.374 Y125.856 I-10.593 J8.419 E.03588
G2 X154.438 Y118.904 I-30.787 J.605 E.19049
G2 X155.17 Y118.205 I-3.361 J-4.254 E.02745
G2 X148.344 Y106.379 I-27.342 J7.898 E.37366
G2 X147.699 Y106.992 I2.952 J3.749 E.02416
G2 X142.95 Y103.06 I-20.114 J19.458 E.16741
G2 X143.179 Y102.161 I-2.231 J-1.045 E.02528
G2 X133.133 Y98.211 I-15.19 J23.876 E.29431
G2 X133.956 Y99.279 I3.126 J-1.557 E.03679
G2 X128.081 Y98.62 I-6.654 J32.792 E.16041
G3 X127.23 Y97.75 I4.218 J-4.974 E.03302
M73 P87 R5
G2 X125.571 Y97.845 I.141 J16.925 E.04506
G1 X122.513 Y99.181 F30000
G1 F10826.06
G2 X120.896 Y99.564 I3.088 J16.658 E.04506
G3 X120.157 Y98.851 I4.323 J-5.213 E.02784
G2 X116.198 Y100.323 I12.548 J39.8 E.11452
G3 X116.443 Y101.185 I-1.271 J.827 E.02465
G2 X110.019 Y105.356 I11.308 J24.447 E.20825
G1 X109.479 Y104.924 E.01874
G3 X109.8 Y104.371 I.687 J.029 E.01802
G3 X110.93 Y103.47 I9.72 J11.034 E.03918
; WIPE_START
G1 X109.8 Y104.371 E-.54925
G1 X109.636 Y104.514 E-.08253
G1 X109.515 Y104.829 E-.12822
; WIPE_END
G1 E-.04 F1800
G1 X104.958 Y110.952 Z6.36 F30000
G1 X102.001 Y114.924 Z6.36
G1 Z5.96
G1 E.8 F1800
G1 F10826.06
G3 X102.691 Y113.412 I22.194 J9.213 E.04505
G1 X103.045 Y114.293 E.02572
G1 X103.071 Y114.678 E.01045
G2 X101.807 Y118.038 I33.8 J14.625 E.09732
G3 X100.557 Y119.227 I-6.968 J-6.075 E.04681
G2 X99.838 Y123.559 I46.836 J10.003 E.11904
G2 X100.655 Y124.707 I3.16 J-1.385 E.03845
G2 X101.281 Y131.962 I27.594 J1.275 E.19788
G1 X100.525 Y132.636 E.02745
G2 X108.392 Y146.351 I28.113 J-7.013 E.43394
G2 X109.029 Y145.735 I-3.73 J-4.501 E.02403
G2 X112.788 Y148.76 I19.216 J-20.028 E.13089
G2 X113.095 Y150.016 I3.432 J-.173 E.03525
G2 X114.533 Y150.85 I26.723 J-44.485 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X113.095 Y150.016 E-.63169
G1 X112.983 Y149.698 E-.12831
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/58
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.36 I-.371 J1.159 P1  F30000
G1 X128.351 Y154.613 Z6.36
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X103.107 Y111.875 I-.352 J-28.616 E1.62784
G1 X104.368 Y112.884 E.04377
G2 X145.779 Y105.647 I23.629 J13.111 E3.2957
G2 X110.025 Y105.816 I-17.781 J20.361 E1.05859
G1 X108.763 Y104.807 E.04377
G3 X128.51 Y97.382 I19.271 J21.284 E.58536
G3 X128.411 Y154.612 I-.512 J28.614 E2.41122
G1 X128.356 Y155.035 F30000
G1 F9000
G3 X102.989 Y111.248 I-.356 J-29.035 E1.6649
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.094 J13.218 E4.30664
G1 X108.126 Y104.829 E.06655
G3 X128.521 Y96.967 I19.878 J21.18 E.60723
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.034 I-.521 J29.033 E2.44651
M204 S250
G1 X128.361 Y155.436 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.881 Y110.648 I-.362 J-29.436 E1.57769
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.574 J13.315 E3.9529
G1 X107.517 Y104.855 E.08195
G3 X128.53 Y96.566 I20.486 J21.156 E.58285
G3 X128.421 Y155.435 I-.531 J29.433 E2.30119
; WIPE_START
M204 S10000
G1 X126.916 Y155.42 E-.57184
G1 X126.422 Y155.396 E-.18816
; WIPE_END
G1 E-.04 F1800
G1 X121.904 Y152.688 Z6.52 F30000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X120.296 Y152.268 I3.468 J-16.57 E.04506
G2 X121.512 Y153.505 I6.415 J-5.089 E.04709
G2 X129.586 Y154.215 I6.491 J-27.526 E.22038
G2 X129.107 Y153.359 I-1.661 J.366 E.02698
G2 X134.048 Y152.7 I-1.101 J-27.129 E.13526
G2 X134.811 Y153.429 I3.803 J-3.219 E.02866
G2 X140.562 Y151.315 I-6.923 J-27.702 E.16633
G3 X140.083 Y150.563 I1.514 J-1.491 E.02433
G2 X149.752 Y142.629 I-12.405 J-24.978 E.34182
G3 X149.804 Y143.982 I-4.539 J.85 E.03682
G2 X153.732 Y137.681 I-24.797 J-19.835 E.20166
G3 X153.226 Y136.641 I2.188 J-1.707 E.03159
G2 X154.655 Y132.232 I-35.231 J-13.854 E.12566
G2 X155.772 Y131.017 I-4.979 J-5.7 E.0448
G2 X156.215 Y127.733 I-20.74 J-4.467 E.08991
G2 X156.07 Y126.836 I-.99 J-.3 E.02547
G1 X155.376 Y126.03 E.02882
G2 X154.471 Y119.026 I-30.854 J.429 E.19179
G2 X155.198 Y118.31 I-2.899 J-3.673 E.0277
G2 X148.27 Y106.298 I-27.366 J7.78 E.37956
G2 X147.635 Y106.926 I2.546 J3.208 E.02424
G2 X142.951 Y103.061 I-20.036 J19.505 E.16489
G2 X143.133 Y102.131 I-2.277 J-.927 E.02582
G2 X141.705 Y101.279 I-9.392 J14.105 E.04506
G1 X135.809 Y99.759 F30000
G1 F10826.06
G2 X134.201 Y99.338 I-6.201 J20.364 E.04505
G3 X133.308 Y98.243 I5.469 J-5.378 E.03834
G2 X127.145 Y97.753 I-5.669 J32.282 E.16777
G2 X127.931 Y98.62 I4.347 J-3.151 E.03178
G2 X121.019 Y99.523 I.374 J29.774 E.18932
G3 X120.338 Y98.798 I3.062 J-3.558 E.02699
G2 X116.067 Y100.383 I11.589 J37.779 E.12352
G3 X116.342 Y101.226 I-1.272 J.881 E.02437
G2 X114.86 Y101.979 I9.473 J20.488 E.04506
; WIPE_START
G1 X116.342 Y101.226 E-.63173
G1 X116.302 Y100.913 E-.11975
G1 X116.293 Y100.893 E-.00851
; WIPE_END
G1 E-.04 F1800
G1 X110.866 Y106.259 Z6.52 F30000
G1 X101.927 Y115.098 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F10826.06
G3 X102.606 Y113.581 I27.007 J11.186 E.04505
G3 X102.994 Y114.856 I-1.937 J1.286 E.03662
G2 X101.754 Y118.223 I31.646 J13.572 E.09729
G3 X100.503 Y119.481 I-65.313 J-63.701 E.04807
G2 X99.836 Y123.577 I34.058 J7.646 E.11251
G2 X100.651 Y124.823 I4.311 J-1.93 E.04051
G2 X101.305 Y132.074 I30.688 J.886 E.19774
G2 X100.565 Y132.789 I2.985 J3.833 E.02795
G2 X108.309 Y146.27 I28.058 J-7.153 E.42652
G2 X108.91 Y145.619 I-2.755 J-3.145 E.02405
G2 X112.853 Y148.803 I19.196 J-19.739 E.13753
G2 X113.084 Y150.01 I3.191 J.014 E.03351
G2 X114.522 Y150.844 I26.608 J-44.213 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 6.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X113.084 Y150.01 E-.63169
G1 X112.989 Y149.686 E-.12831
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/58
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.52 I-.372 J1.159 P1  F30000
G1 X128.351 Y154.613 Z6.52
G1 Z6.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X103.107 Y111.875 I-.352 J-28.616 E1.62785
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35437
G1 X108.763 Y104.807 E.04377
G3 X128.537 Y97.383 I19.271 J21.282 E.58608
G3 X128.411 Y154.612 I-.538 J28.614 E2.41049
G1 X128.356 Y155.035 F30000
G1 F9000
G3 X102.989 Y111.248 I-.356 J-29.035 E1.66492
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06655
G3 X128.547 Y96.968 I19.877 J21.179 E.60794
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.034 I-.548 J29.032 E2.44578
M204 S250
G1 X128.361 Y155.436 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.881 Y110.648 I-.362 J-29.436 E1.5777
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95244
G1 X107.517 Y104.855 E.08195
G3 X128.557 Y96.567 I20.486 J21.155 E.58351
G3 X128.421 Y155.435 I-.558 J29.433 E2.30052
; WIPE_START
M204 S10000
G1 X126.916 Y155.42 E-.57184
G1 X126.422 Y155.396 E-.18816
; WIPE_END
G1 E-.04 F1800
G1 X122.129 Y152.741 Z6.68 F30000
G1 Z6.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X120.518 Y152.332 I3.354 J-16.589 E.04506
G2 X121.695 Y153.548 I8.774 J-7.312 E.04589
G2 X129.464 Y154.223 I6.317 J-27.666 E.21198
G2 X128.948 Y153.364 I-1.894 J.554 E.02744
G2 X134.193 Y152.669 I-1.578 J-32.057 E.14354
G2 X134.924 Y153.4 I5.285 J-4.552 E.02801
G2 X140.494 Y151.348 I-6.981 J-27.539 E.16116
G3 X140.046 Y150.581 I1.498 J-1.39 E.02426
G2 X149.742 Y142.642 I-12.36 J-24.987 E.34249
G3 X149.688 Y144.127 I-4.582 J.576 E.04045
G2 X153.701 Y137.749 I-24.765 J-20.036 E.20469
G1 X153.217 Y136.663 E.03221
G2 X154.609 Y132.427 I-36.634 J-14.381 E.12089
G2 X155.799 Y131.083 I-4.667 J-5.329 E.04878
G2 X156.225 Y127.467 I-52.781 J-8.049 E.09867
G2 X155.379 Y126.23 I-2.779 J.994 E.04104
G2 X154.504 Y119.151 I-31.056 J.246 E.19372
G2 X155.229 Y118.428 I-2.469 J-3.2 E.02783
G2 X148.193 Y106.22 I-28.1 J8.064 E.38559
G2 X147.566 Y106.856 I2.178 J2.771 E.02426
G2 X142.957 Y103.065 I-19.962 J19.57 E.16202
G2 X143.09 Y102.104 I-2.34 J-.813 E.02646
G2 X141.662 Y101.254 I-9.373 J14.122 E.04506
G1 X136.028 Y99.827 F30000
G1 F10826.06
G2 X134.424 Y99.391 I-5.239 J16.103 E.04506
G3 X133.474 Y98.274 I7.091 J-6.998 E.03976
G2 X127.057 Y97.756 I-5.797 J31.811 E.17474
G2 X127.786 Y98.62 I3.746 J-2.423 E.03072
G2 X121.152 Y99.496 I.202 J27.083 E.18179
G3 X120.471 Y98.76 I4.618 J-4.955 E.02721
G2 X115.95 Y100.436 I11.111 J36.886 E.13073
M73 P88 R5
G3 X116.255 Y101.272 I-1.307 J.95 E.02442
G2 X114.773 Y102.025 I11.896 J25.244 E.04505
; WIPE_START
G1 X116.255 Y101.272 E-.63169
G1 X116.193 Y100.94 E-.12831
; WIPE_END
G1 E-.04 F1800
G1 X110.793 Y106.334 Z6.68 F30000
G1 X101.858 Y115.258 Z6.68
G1 Z6.28
G1 E.8 F1800
G1 F10826.06
G3 X102.532 Y113.738 I20.96 J8.375 E.04506
G3 X102.938 Y114.987 I-1.978 J1.334 E.03606
G2 X101.685 Y118.46 I30.592 J13 E.1001
G2 X100.439 Y119.749 I18.979 J19.591 E.04858
G2 X99.836 Y123.577 I36.157 J7.658 E.10506
G2 X100.646 Y124.958 I3.172 J-.932 E.04382
G2 X101.33 Y132.191 I30.816 J.734 E.19734
G2 X100.605 Y132.94 I4.671 J5.257 E.02827
G2 X108.226 Y146.189 I28.019 J-7.301 E.41916
G2 X108.82 Y145.531 I-4.134 J-4.326 E.02404
G2 X112.907 Y148.838 I19.246 J-19.607 E.14266
G2 X113.068 Y149.999 I2.988 J.177 E.03198
G2 X114.505 Y150.835 I26.467 J-43.848 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X113.068 Y149.999 E-.63168
G1 X112.99 Y149.671 E-.12832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/58
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.68 I-.373 J1.158 P1  F30000
G1 X128.351 Y154.613 Z6.68
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X103.107 Y111.875 I-.352 J-28.616 E1.62785
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.631 J13.115 E4.35488
G1 X108.763 Y104.807 E.04377
G3 X128.563 Y97.384 I19.27 J21.281 E.5868
G3 X128.411 Y154.612 I-.565 J28.613 E2.40977
G1 X128.356 Y155.035 F30000
G1 F9000
G3 X102.989 Y111.248 I-.356 J-29.035 E1.66492
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.094 J13.218 E4.30664
G1 X108.126 Y104.829 E.06655
G3 X128.574 Y96.968 I19.876 J21.178 E.60866
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.034 I-.574 J29.032 E2.44506
M204 S250
G1 X128.361 Y155.436 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.881 Y110.648 I-.362 J-29.436 E1.5777
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95244
G1 X107.517 Y104.855 E.08195
G3 X128.583 Y96.568 I20.485 J21.154 E.58418
G3 X128.421 Y155.435 I-.584 J29.432 E2.29984
; WIPE_START
M204 S10000
G1 X127.639 Y155.438 E-.2971
G1 X126.422 Y155.393 E-.4629
; WIPE_END
G1 E-.04 F1800
G1 X119.537 Y152.098 Z6.84 F30000
G1 X119.142 Y151.909 Z6.84
G1 Z6.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X120.732 Y152.394 I7.371 J-21.319 E.04506
G2 X121.871 Y153.59 I14.045 J-12.24 E.04478
G2 X129.351 Y154.23 I6.154 J-27.911 E.20399
G2 X128.795 Y153.366 I-2.165 J.783 E.02807
G2 X134.332 Y152.64 I-.767 J-27.312 E.15158
G2 X135.036 Y153.37 I8.574 J-7.566 E.0275
G2 X140.422 Y151.383 I-7.056 J-27.418 E.15582
G3 X140.003 Y150.602 I1.468 J-1.291 E.02423
G2 X149.735 Y142.65 I-12.312 J-25.002 E.34352
G3 X149.561 Y144.278 I-4.761 J.312 E.04458
G3 X148.446 Y145.511 I-13.103 J-10.73 E.04506
G1 X152.931 Y139.31 F30000
G1 F10826.06
G2 X153.668 Y137.821 I-14.791 J-8.252 E.04506
G1 X153.202 Y136.7 E.03288
G2 X154.559 Y132.638 I-39.392 J-15.409 E.11611
G2 X155.769 Y131.242 I-4.107 J-4.785 E.05023
G2 X156.215 Y127.733 I-29.754 J-5.562 E.09593
G2 X155.377 Y126.41 I-3.883 J1.532 E.04268
G2 X154.537 Y119.28 I-27.848 J-.334 E.19507
G1 X155.259 Y118.542 E.02796
G2 X148.114 Y106.143 I-28.048 J7.904 E.3918
G2 X147.493 Y106.781 I1.842 J2.413 E.02421
G2 X142.969 Y103.073 I-19.902 J19.668 E.15878
G2 X143.051 Y102.078 I-2.421 J-.699 E.02723
G2 X141.621 Y101.231 I-30.361 J49.577 E.04505
G1 X136.234 Y99.886 F30000
G1 F10826.06
G2 X134.633 Y99.44 I-5.341 J16.069 E.04506
G3 X133.69 Y98.405 I11.191 J-11.142 E.03796
G1 X133.634 Y98.304 E.00312
G2 X126.966 Y97.76 I-5.928 J31.5 E.18163
G2 X127.645 Y98.621 I3.248 J-1.863 E.02983
G2 X121.276 Y99.463 I.687 J29.672 E.17441
G3 X120.596 Y98.723 I7.994 J-8.037 E.02725
G2 X115.846 Y100.484 I10.806 J36.437 E.13738
G3 X116.179 Y101.307 I-1.343 J1.022 E.02434
G2 X114.7 Y102.066 I11.481 J24.181 E.04505
; WIPE_START
G1 X116.179 Y101.307 E-.63168
G1 X116.099 Y100.979 E-.12832
; WIPE_END
G1 E-.04 F1800
G1 X110.723 Y106.398 Z6.84 F30000
M73 P88 R4
G1 X101.801 Y115.392 Z6.84
G1 Z6.44
G1 E.8 F1800
G1 F10826.06
G3 X102.469 Y113.87 I21.004 J8.314 E.04506
G3 X102.896 Y115.085 I-2.016 J1.391 E.03531
G2 X101.628 Y118.658 I30.469 J12.829 E.1028
G2 X100.381 Y119.99 I14.381 J14.706 E.04946
G2 X99.823 Y123.747 I57.986 J10.52 E.10293
G2 X100.64 Y125.117 I3.35 J-1.07 E.04358
G2 X101.356 Y132.315 I31.07 J.543 E.19646
G2 X100.641 Y133.079 I8.246 J8.434 E.02837
G2 X108.144 Y146.109 I27.999 J-7.447 E.41213
G2 X108.737 Y145.45 I-7.115 J-6.999 E.02402
G2 X112.95 Y148.866 I19.336 J-19.542 E.14721
G2 X113.046 Y149.985 I2.817 J.321 E.03064
G2 X114.482 Y150.823 I26.52 J-43.783 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X113.046 Y149.985 E-.63169
G1 X112.985 Y149.653 E-.12832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/58
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.84 I-.374 J1.158 P1  F30000
G1 X128.351 Y154.619 Z6.84
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X103.107 Y111.875 I-.35 J-28.619 E1.62803
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35437
G1 X108.764 Y104.807 E.04377
G3 X128.59 Y97.384 I19.269 J21.28 E.58751
G3 X128.411 Y154.618 I-.59 J28.615 E2.40939
G1 X128.356 Y155.029 F30000
G1 F9000
G3 X102.989 Y111.248 I-.358 J-29.032 E1.66474
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06655
G3 X128.6 Y96.969 I19.876 J21.177 E.60938
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.028 I-.602 J29.028 E2.44398
M204 S250
G1 X128.361 Y155.43 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X102.881 Y110.648 I-.364 J-29.433 E1.57754
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95243
G1 X107.517 Y104.855 E.08195
G3 X128.61 Y96.568 I20.485 J21.153 E.58484
G3 X128.421 Y155.429 I-.612 J29.429 E2.29884
; WIPE_START
M204 S10000
G1 X127.639 Y155.438 E-.2971
G1 X126.422 Y155.393 E-.4629
; WIPE_END
G1 E-.04 F1800
G1 X119.549 Y152.074 Z7 F30000
G1 X119.349 Y151.977 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X120.941 Y152.455 I7.269 J-21.359 E.04506
G3 X122.034 Y153.628 I-136.239 J127.896 E.04346
G2 X129.245 Y154.236 I6.013 J-28.261 E.19661
G2 X128.648 Y153.368 I-2.474 J1.061 E.02874
G2 X134.461 Y152.607 I-.58 J-27.03 E.15917
G2 X135.15 Y153.34 I23.526 J-21.427 E.02725
G2 X140.343 Y151.421 I-7.154 J-27.352 E.15027
G3 X139.953 Y150.627 I1.431 J-1.197 E.02423
G2 X149.733 Y142.653 I-12.26 J-25.024 E.34494
G3 X149.433 Y144.397 I-4.97 J.041 E.04822
G1 X149.384 Y144.478 E.00256
G3 X148.259 Y145.702 I-13.021 J-10.836 E.04506
G1 X152.889 Y139.391 F30000
G1 F10826.06
G2 X153.631 Y137.903 I-14.771 J-8.294 E.04506
G1 X153.5 Y137.707 E.00639
G1 X153.18 Y136.756 E.02719
G2 X154.503 Y132.871 I-45.689 J-17.729 E.11124
G2 X155.73 Y131.449 I-9.148 J-9.138 E.05093
G2 X156.198 Y127.925 I-29.228 J-5.672 E.09641
G2 X155.371 Y126.57 I-4.31 J1.701 E.04322
G2 X154.573 Y119.415 I-27.749 J-.526 E.19562
G3 X155.289 Y118.656 I24.394 J22.266 E.02828
G2 X148.033 Y106.064 I-28.015 J7.757 E.39801
G1 X147.423 Y106.709 E.02406
G2 X142.988 Y103.086 I-19.866 J19.791 E.15546
G2 X143.016 Y102.055 I-2.52 J-.584 E.02812
G2 X141.584 Y101.211 I-28.154 J46.118 E.04505
G1 X136.43 Y99.95 F30000
G1 F10826.06
G2 X134.833 Y99.488 I-14.899 J48.501 E.04505
G3 X133.833 Y98.405 I33.727 J-32.148 E.03994
G1 X133.79 Y98.333 E.00227
G2 X126.87 Y97.763 I-6.062 J31.312 E.18851
G2 X127.508 Y98.626 I2.845 J-1.436 E.02921
M73 P89 R4
G2 X121.4 Y99.431 I.823 J29.816 E.16723
G3 X120.714 Y98.689 I23.15 J-22.085 E.02737
G2 X115.75 Y100.528 I10.599 J36.229 E.14357
G3 X116.112 Y101.34 I-1.387 J1.104 E.02434
G2 X114.635 Y102.103 I10.882 J22.862 E.04505
; WIPE_START
G1 X116.112 Y101.34 E-.63167
G1 X116.015 Y101.016 E-.12833
; WIPE_END
G1 E-.04 F1800
G1 X110.661 Y106.456 Z7 F30000
G1 X101.752 Y115.506 Z7
G1 Z6.6
G1 E.8 F1800
G1 F10826.06
G3 X102.416 Y113.982 I72.669 J30.752 E.04505
G3 X102.855 Y115.129 I-1.995 J1.422 E.03364
G2 X101.565 Y118.872 I32.541 J13.308 E.10734
G2 X100.384 Y120.147 I39.75 J38.027 E.04707
G2 X99.814 Y123.869 I21.364 J5.176 E.10218
G2 X100.635 Y125.264 I4.891 J-1.937 E.04403
G2 X101.387 Y132.44 I27.865 J.705 E.19606
G2 X100.675 Y133.209 I23.965 J22.913 E.02839
G2 X108.06 Y146.027 I27.997 J-7.593 E.40532
G1 X108.658 Y145.374 E.02399
G2 X112.984 Y148.895 I19.849 J-19.969 E.15138
G2 X113.02 Y149.968 I2.657 J.448 E.02928
G2 X114.454 Y150.808 I26.937 J-44.307 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 6.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X113.02 Y149.968 E-.63168
G1 X112.976 Y149.633 E-.12832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/58
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7 I-.375 J1.158 P1  F30000
G1 X128.351 Y154.613 Z7
G1 Z6.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X103.107 Y111.875 I-.352 J-28.616 E1.62786
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35437
G1 X108.763 Y104.807 E.04377
G3 X128.616 Y97.385 I19.269 J21.28 E.58823
G3 X128.411 Y154.612 I-.618 J28.612 E2.40832
G1 X128.356 Y155.035 F30000
G1 F9000
G3 X102.989 Y111.248 I-.356 J-29.035 E1.66491
G1 X104.906 Y112.782 E.06654
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06655
G3 X128.626 Y96.97 I19.876 J21.177 E.61009
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.034 I-.627 J29.031 E2.44361
M204 S250
G1 X128.361 Y155.438 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.361 Y155.436 E.00004
G3 X102.881 Y110.648 I-.362 J-29.436 E1.5777
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95243
G1 X107.517 Y104.855 E.08195
G3 X128.636 Y96.569 I20.484 J21.153 E.58551
G3 X129.805 Y155.383 I-.637 J29.431 E2.26368
G1 X128.421 Y155.435 E.03481
; WIPE_START
M204 S10000
G1 X128.361 Y155.436 E-.02285
G1 X126.916 Y155.42 E-.54905
G1 X126.422 Y155.396 E-.1881
; WIPE_END
G1 E-.04 F1800
G1 X119.562 Y152.05 Z7.16 F30000
G1 X119.546 Y152.043 Z7.16
G1 Z6.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X121.142 Y152.507 I15.316 J-49.702 E.04505
G3 X122.191 Y153.664 I-19.768 J18.976 E.04232
G2 X129.146 Y154.242 I6.23 J-32.783 E.18944
G2 X128.505 Y153.37 I-2.832 J1.407 E.02947
G2 X134.587 Y152.576 I-.42 J-26.914 E.16656
G3 X135.266 Y153.309 I-29.297 J27.793 E.02708
G2 X140.258 Y151.463 I-7.284 J-27.363 E.14445
G3 X139.895 Y150.655 I1.389 J-1.11 E.02426
G2 X149.737 Y142.649 I-12.203 J-25.053 E.3468
G3 X148.711 Y145.239 I-3.857 J-.029 E.07723
G1 X147.854 Y146.117 E.03326
G1 X152.84 Y139.485 F30000
G1 F10826.06
G2 X153.587 Y137.999 I-14.744 J-8.339 E.04506
G3 X153.151 Y136.871 I1.975 J-1.412 E.03313
G2 X154.443 Y133.1 I-50.136 J-19.284 E.10803
G2 X155.598 Y131.854 I-49.919 J-47.446 E.04607
G1 X155.68 Y131.721 E.00422
G2 X156.183 Y128.102 I-29.489 J-5.944 E.09907
G2 X155.366 Y126.718 I-4.784 J1.892 E.04372
G2 X154.608 Y119.546 I-27.774 J-.69 E.19599
G2 X155.321 Y118.776 I-30.798 J-29.255 E.02843
G2 X147.951 Y105.984 I-27.998 J7.611 E.4045
G1 X147.351 Y106.636 E.024
G2 X143.013 Y103.103 I-19.849 J19.947 E.15185
G2 X142.984 Y102.035 I-2.64 J-.464 E.02915
G2 X141.55 Y101.194 I-26.96 J44.317 E.04505
G1 X136.626 Y100.014 F30000
G1 F10826.06
G2 X135.033 Y99.538 I-7.254 J21.353 E.04506
G2 X133.972 Y98.405 I-46.349 J42.349 E.04208
G2 X126.77 Y97.767 I-6.197 J28.99 E.19641
G2 X127.369 Y98.631 I2.501 J-1.094 E.02867
G2 X121.528 Y99.402 I1.347 J32.717 E.15984
G2 X120.83 Y98.657 I-30.484 J27.886 E.02766
G2 X115.663 Y100.568 I7.779 J28.979 E.1495
G3 X116.053 Y101.368 I-1.432 J1.194 E.02436
G2 X114.58 Y102.138 I9.154 J19.32 E.04505
; WIPE_START
G1 X116.053 Y101.368 E-.63161
G1 X115.94 Y101.05 E-.12839
; WIPE_END
G1 E-.04 F1800
G1 X110.605 Y106.509 Z7.16 F30000
G1 X101.715 Y115.607 Z7.16
G1 Z6.76
G1 E.8 F1800
G1 F10826.06
G3 X102.37 Y114.079 I55.96 J23.107 E.04505
G1 X102.512 Y114.293 E.00695
G1 X102.825 Y115.25 E.0273
G2 X101.503 Y119.102 I26.272 J11.171 E.11043
G2 X100.274 Y120.524 I9.295 J9.279 E.05098
G2 X99.802 Y124.043 I60.722 J9.934 E.09622
G2 X100.629 Y125.411 I4.312 J-1.672 E.04356
G2 X101.42 Y132.571 I27.922 J.539 E.19574
G3 X100.707 Y133.33 I-31.023 J-28.42 E.02821
G2 X107.977 Y145.946 I28.013 J-7.74 E.39878
G1 X108.585 Y145.301 E.024
G2 X113.011 Y148.905 I19.583 J-19.531 E.15494
G2 X112.989 Y149.947 I2.551 J.576 E.02843
G2 X114.421 Y150.791 I27.958 J-45.818 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X112.989 Y149.947 E-.63169
G1 X112.963 Y149.611 E-.12831
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/58
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.16 I-.376 J1.157 P1  F30000
G1 X128.351 Y154.613 Z7.16
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X103.107 Y111.875 I-.352 J-28.616 E1.62786
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35436
G1 X108.764 Y104.807 E.04377
G3 X128.643 Y97.386 I19.269 J21.279 E.58895
G3 X128.411 Y154.612 I-.644 J28.611 E2.4076
G1 X128.356 Y155.035 F30000
G1 F9000
G3 X102.989 Y111.248 I-.357 J-29.035 E1.66493
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06655
G3 X128.653 Y96.97 I19.875 J21.176 E.61081
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.034 I-.654 J29.03 E2.44288
M204 S250
G1 X128.361 Y155.438 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.361 Y155.436 E.00004
G3 X102.881 Y110.648 I-.362 J-29.436 E1.57771
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.572 J13.313 E3.95244
G1 X107.517 Y104.855 E.08195
G3 X128.663 Y96.57 I20.484 J21.152 E.58617
G3 X129.805 Y155.383 I-.664 J29.431 E2.26301
G1 X128.421 Y155.435 E.03481
; WIPE_START
M204 S10000
G1 X128.361 Y155.436 E-.02286
G1 X126.916 Y155.42 E-.54905
G1 X126.422 Y155.396 E-.18809
; WIPE_END
G1 E-.04 F1800
G1 X119.741 Y152.107 Z7.32 F30000
G1 Z6.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X121.342 Y152.554 I5.352 J-16.06 E.04506
G3 X122.347 Y153.692 I-10.823 J10.563 E.04116
G2 X129.052 Y154.248 I6.131 J-33.256 E.18261
G2 X128.365 Y153.371 I-3.252 J1.84 E.03029
G2 X134.712 Y152.544 I-.279 J-26.916 E.17386
G3 X135.387 Y153.278 I-8.639 J8.623 E.027
G2 X140.166 Y151.508 I-7.462 J-27.489 E.13827
G3 X139.83 Y150.687 I1.348 J-1.031 E.02433
G2 X149.746 Y142.637 I-12.143 J-25.092 E.34919
G3 X148.652 Y145.233 I-4.111 J-.203 E.07791
G3 X146.201 Y147.617 I-25.911 J-24.187 E.09268
G1 X152.784 Y139.594 F30000
G1 F10826.06
G2 X153.535 Y138.111 I-14.717 J-8.394 E.04506
G3 X153.11 Y136.912 I2 J-1.384 E.03487
G2 X154.38 Y133.317 I-46.527 J-18.448 E.10333
G2 X155.624 Y131.984 I-15.698 J-15.901 E.04944
G2 X156.172 Y128.227 I-52.968 J-9.644 E.1029
G2 X155.361 Y126.862 I-3.322 J1.051 E.04341
G2 X154.641 Y119.672 I-31.112 J-.517 E.19624
G2 X155.354 Y118.905 I-18.994 J-18.377 E.0284
G2 X147.866 Y105.901 I-27.998 J7.465 E.41129
G2 X147.275 Y106.558 I7.73 J7.558 E.02394
G2 X143.046 Y103.126 I-19.875 J20.169 E.14782
G2 X142.957 Y102.017 I-2.784 J-.335 E.03033
G2 X141.522 Y101.179 I-26.511 J43.747 E.04505
G1 X136.833 Y100.083 F30000
G1 F10826.06
G2 X135.242 Y99.599 I-7.356 J21.316 E.04506
G2 X134.107 Y98.405 I-15.175 J13.295 E.04465
G2 X126.663 Y97.771 I-6.125 J27.877 E.20302
G2 X127.226 Y98.636 I2.204 J-.817 E.0282
G2 X121.674 Y99.359 I.696 J27.036 E.15198
G3 X120.947 Y98.63 I1.774 J-2.497 E.02804
G2 X115.583 Y100.606 I9.829 J34.944 E.15505
G3 X116 Y101.388 I-1.461 J1.282 E.02423
G2 X114.53 Y102.163 I30.442 J59.532 E.04505
; WIPE_START
G1 X116 Y101.388 E-.63174
M73 P90 R4
G1 X115.871 Y101.076 E-.12826
; WIPE_END
G1 E-.04 F1800
G1 X110.555 Y106.553 Z7.32 F30000
G1 X101.682 Y115.694 Z7.32
G1 Z6.92
G1 E.8 F1800
G1 F10826.06
G3 X102.331 Y114.163 I53.213 J21.63 E.04505
G1 X102.802 Y115.305 E.03347
G2 X101.447 Y119.336 I25.547 J10.827 E.11535
G2 X100.225 Y120.749 I4.077 J4.761 E.05081
G2 X99.785 Y124.267 I44.783 J7.39 E.0961
G2 X100.623 Y125.57 I4.677 J-2.088 E.04214
G2 X101.455 Y132.708 I28.1 J.346 E.19527
G1 X100.738 Y133.444 E.02784
G2 X107.896 Y145.867 I28.044 J-7.887 E.39254
G2 X108.514 Y145.233 I-1.822 J-2.392 E.02408
G2 X113.03 Y148.918 I19.722 J-19.557 E.15824
G2 X112.954 Y149.925 I2.45 J.693 E.02754
G2 X114.384 Y150.772 I30.073 J-49.128 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X112.954 Y149.925 E-.6317
G1 X112.946 Y149.587 E-.1283
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/58
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.32 I-.378 J1.157 P1  F30000
G1 X128.351 Y154.619 Z7.32
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G3 X103.107 Y111.875 I-.351 J-28.619 E1.62804
G1 X104.368 Y112.884 E.04377
G2 X110.025 Y105.816 I23.628 J13.113 E4.35437
G1 X108.764 Y104.807 E.04377
G3 X128.669 Y97.386 I19.268 J21.278 E.58966
G3 X128.411 Y154.619 I-.669 J28.614 E2.40723
G1 X128.356 Y155.029 F30000
G1 F9000
G3 X102.989 Y111.248 I-.358 J-29.032 E1.66474
G1 X104.906 Y112.782 E.06655
G2 X110.043 Y106.364 I23.091 J13.216 E4.30613
G1 X108.126 Y104.829 E.06654
G3 X128.679 Y96.971 I19.875 J21.174 E.61153
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X128.416 Y155.028 I-.682 J29.026 E2.44182
M204 S250
G1 X128.361 Y155.438 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.361 Y155.43 E.0002
G3 X102.881 Y110.648 I-.364 J-29.433 E1.57754
G1 X105.426 Y112.685 E.08195
G2 X110.062 Y106.892 I22.574 J13.315 E3.9529
G1 X107.517 Y104.855 E.08195
G3 X128.689 Y96.57 I20.484 J21.152 E.58684
G3 X129.805 Y155.377 I-.692 J29.427 E2.26202
G1 X128.421 Y155.435 E.03481
; WIPE_START
M204 S10000
G1 X128.361 Y155.43 E-.02299
G1 X126.916 Y155.42 E-.549
G1 X126.422 Y155.396 E-.18801
; WIPE_END
G1 E-.04 F1800
G1 X119.946 Y152.166 Z7.48 F30000
G1 Z7.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X121.549 Y152.603 I5.251 J-16.096 E.04506
G3 X122.506 Y153.722 I-7.37 J7.269 E.03992
G2 X128.959 Y154.25 I5.567 J-28.366 E.17581
G2 X128.224 Y153.373 I-3.737 J2.385 E.03108
G2 X134.838 Y152.513 I-.15 J-27.006 E.18118
G3 X135.513 Y153.244 I-4.845 J5.151 E.02699
G2 X140.063 Y151.558 I-7.714 J-27.795 E.13165
G3 X139.755 Y150.723 I1.312 J-.96 E.02443
G2 X141.233 Y149.963 I-7.004 J-15.434 E.04506
G1 X145.6 Y148.118 F30000
G1 F10826.06
G2 X146.868 Y147.044 I-33.24 J-40.522 E.04505
G1 X146.938 Y146.906 E.0042
G3 X148.519 Y145.233 I12.645 J10.368 E.06241
G2 X149.792 Y142.58 I-4.06 J-3.58 E.08076
G2 X150.728 Y141.262 I-12.928 J-10.174 E.04383
G1 X152.713 Y139.719 F30000
G1 F10826.06
G2 X153.475 Y138.242 I-45.447 J-24.398 E.04505
G3 X153.069 Y137.004 I1.973 J-1.334 E.03579
G2 X154.323 Y133.514 I-44.947 J-18.122 E.10051
G2 X155.568 Y132.221 I-8.54 J-9.474 E.04867
G2 X156.164 Y128.317 I-45.393 J-8.933 E.10706
G2 X155.355 Y127.024 I-3.293 J1.163 E.04167
G2 X154.667 Y119.794 I-30.838 J-.713 E.19726
G2 X155.391 Y119.043 I-4.962 J-5.51 E.02829
G2 X147.784 Y105.821 I-28.016 J7.319 E.41829
G2 X147.194 Y106.475 I4.341 J4.503 E.02388
G2 X143.088 Y103.154 I-19.962 J20.488 E.14331
G2 X142.934 Y102.003 I-2.955 J-.193 E.03169
G2 X141.498 Y101.167 I-26.442 J43.79 E.04505
G1 X133.844 Y99.253 F30000
G1 F10826.06
G3 X135.455 Y99.66 I-3.342 J16.596 E.04506
G2 X134.283 Y98.447 I-9.186 J7.698 E.04575
G2 X126.55 Y97.775 I-6.309 J27.771 E.211
G2 X127.077 Y98.642 I1.943 J-.587 E.02778
G2 X121.793 Y99.339 I1.25 J29.84 E.1446
G2 X121.061 Y98.602 I-5.586 J4.82 E.02816
G2 X115.511 Y100.643 I9.289 J33.832 E.16044
G3 X115.959 Y101.417 I-1.503 J1.388 E.02442
G2 X114.489 Y102.191 I8.298 J17.539 E.04505
; WIPE_START
G1 X115.959 Y101.417 E-.63157
G1 X115.815 Y101.111 E-.12843
; WIPE_END
G1 E-.04 F1800
G1 X110.512 Y106.6 Z7.48 F30000
G1 X101.655 Y115.769 Z7.48
G1 Z7.08
G1 E.8 F1800
G1 F10826.06
G3 X102.297 Y114.235 I15.917 J5.765 E.04506
G1 X102.737 Y115.129 E.027
G1 X102.786 Y115.341 E.0059
G2 X101.397 Y119.548 I23.644 J10.14 E.12021
G2 X100.196 Y120.911 I4.638 J5.298 E.04937
G2 X99.776 Y124.506 I39.187 J6.394 E.09809
G2 X100.621 Y125.746 I2.826 J-1.016 E.0411
G2 X101.489 Y132.837 I31.477 J-.253 E.194
G1 X100.792 Y133.526 E.02655
G2 X107.817 Y145.79 I26.899 J-7.265 E.3872
G2 X108.438 Y145.158 I-2.115 J-2.703 E.02406
G2 X113.043 Y148.927 I19.886 J-19.605 E.16155
G2 X112.915 Y149.9 I2.367 J.807 E.02677
G2 X114.344 Y150.75 I9.361 J-14.109 E.04506
; CHANGE_LAYER
; Z_HEIGHT: 7.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X112.915 Y149.9 E-.6317
G1 X112.926 Y149.562 E-.1283
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/58
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.48 I-.278 J1.185 P1  F30000
G1 X127.689 Y153.024 Z7.48
G1 Z7.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X127.669 Y153.021 E.00053
G3 X104.325 Y112.97 I.332 J-27.023 E1.50967
G1 X104.597 Y112.493 E.01488
G1 F4196.468
G1 X104.797 Y112.146 E.01084
G1 F720
G1 X104.991 Y111.822 E.01025
G1 F600
G1 X104.995 Y111.815 E.00021
; FEATURE: Overhang wall

M204 S5000
G3 X109.119 Y106.662 I23.877 J14.883 E.17925
; FEATURE: Inner wall
M204 S10000
G1 X109.126 Y106.656 E.00025
G1 F720
G1 X109.399 Y106.396 E.01021
G1 F4196.468
G1 X109.693 Y106.125 E.01084
G1 F9000
G1 X110.099 Y105.755 E.01488
G3 X127.669 Y98.976 I17.91 J20.258 E.52124
G3 X128.996 Y153.005 I.333 J27.023 E2.28264
G1 X127.749 Y153.023 E.03379
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.558 E.03512
G3 X104.689 Y113.17 I1.632 J-26.559 E1.45107
G1 X104.925 Y112.755 E.01293
G1 F3899.032
G1 X105.124 Y112.408 E.01084
G1 F600
G1 X105.323 Y112.077 E.01046
; FEATURE: Overhang wall

M204 S5000
G3 X109.447 Y106.924 I23.466 J14.554 E.17927
; FEATURE: Inner wall
M204 S10000
G1 X109.726 Y106.658 E.01046
G1 F3899.032
G1 X110.021 Y106.388 E.01084
G1 F9000
G1 X110.374 Y106.066 E.01294
G3 X127.674 Y99.391 I17.634 J19.947 E.51321
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.606 I.328 J26.607 E2.28159
M204 S250
G1 X127.679 Y152.205 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X105.04 Y113.363 I.322 J-26.207 E1.35842
G1 X105.248 Y112.996 E.0106
G1 X105.447 Y112.649 E.01006
G1 F600
G1 X105.638 Y112.33 E.00936
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G3 X109.762 Y107.177 I23.063 J14.232 E.17929
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X110.032 Y106.92 E.00936
G1 F3600
G1 X110.327 Y106.65 E.01006
G1 X110.639 Y106.366 E.01061
G3 X127.678 Y99.792 I17.369 J19.648 E.469
G3 X127.739 Y152.206 I.323 J26.207 E2.08477
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.751 Y152.113 E-.2446
G1 X125.741 Y152.112 E-.00376
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.62 Z7.64 F30000
G1 Z7.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X102.925 Y112.199 I-.351 J-28.619 E1.61798
G1 X103.137 Y111.831 E.01151
G1 X103.338 Y111.485 E.01084
G1 F6330.958
G1 X103.538 Y111.139 E.01084
G1 F1732.223
G1 X103.631 Y110.984 E.00489
G1 F600
G1 X103.741 Y110.811 E.00555
; FEATURE: Overhang wall

M204 S5000
G3 X107.865 Y105.658 I25.09 J15.854 E.17921
; FEATURE: Inner wall
M204 S10000
G1 X108.01 Y105.513 E.00556
G1 F1729.16
G1 X108.14 Y105.389 E.00488
G1 F6116.211
G1 X108.42 Y105.123 E.01046
G1 F9000
G1 X108.719 Y104.857 E.01084
G1 X109.572 Y104.1 E.03091
G3 X128.696 Y97.387 I18.429 J21.906 E.56137
G3 X128.411 Y154.619 I-.696 J28.613 E2.40649
G1 X128.356 Y155.035 F30000
G1 F9000
G3 X102.56 Y111.999 I-.357 J-29.035 E1.6415
G1 X102.809 Y111.569 E.01346
G1 X103.01 Y111.223 E.01084
G1 F5581.872
G1 X103.211 Y110.877 E.01084
G1 F1351.635
G1 X103.277 Y110.766 E.0035
G1 F600
G1 X103.414 Y110.55 E.00693
; FEATURE: Overhang wall

M204 S5000
G3 X107.538 Y105.397 I25.427 J16.123 E.1792
; FEATURE: Inner wall
M204 S10000
G1 X107.719 Y105.216 E.00694
G1 F1349.759
G1 X107.813 Y105.127 E.0035
G1 F6196.344
G1 X108.133 Y104.822 E.01199
G1 F9000
G1 X108.432 Y104.556 E.01084
G1 X109.304 Y103.782 E.03159
G3 X128.706 Y96.971 I18.697 J22.224 E.56953
G3 X128.416 Y155.035 I-.707 J29.029 E2.44145
M204 S250
G1 X128.361 Y155.438 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.361 Y155.43 E.00019
G3 X102.209 Y111.805 I-.364 J-29.433 E1.54392
G1 X102.701 Y110.958 E.02463
G1 X102.902 Y110.613 E.01006
G1 F946.302
G1 X102.936 Y110.556 E.00166
G1 F600
M73 P91 R3
G1 X103.099 Y110.298 E.00768
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G3 X107.224 Y105.145 I25.76 J16.39 E.17919
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X107.44 Y104.929 E.00768
G1 F944.997
G1 X107.487 Y104.884 E.00166
G1 F3600
G1 X107.781 Y104.612 E.01006
G1 X108.499 Y103.946 E.02462
G3 X128.716 Y96.571 I19.502 J22.063 E.55386
G3 X129.805 Y155.377 I-.719 J29.426 E2.26135
G1 X128.421 Y155.435 E.03481
; WIPE_START
M204 S10000
G1 X128.361 Y155.43 E-.02299
G1 X126.916 Y155.42 E-.54901
G1 X126.422 Y155.396 E-.18801
; WIPE_END
G1 E-.04 F1800
G1 X120.172 Y152.235 Z7.64 F30000
G1 Z7.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G2 X121.778 Y152.663 I12.381 J-43.179 E.04505
G3 X122.672 Y153.753 I-5.668 J5.556 E.03823
G2 X128.869 Y154.251 I5.382 J-28.171 E.16881
G2 X128.084 Y153.377 I-4.303 J3.078 E.03191
G2 X134.965 Y152.481 I-.636 J-31.762 E.18841
G3 X135.647 Y153.209 I-3.213 J3.693 E.02707
G2 X139.95 Y151.613 I-8.09 J-28.415 E.12448
G3 X139.669 Y150.764 I1.287 J-.897 E.02458
G2 X141.153 Y150.015 I-6.877 J-15.466 E.04506
G1 X145.33 Y148.323 F30000
G1 F10826.06
G2 X146.616 Y147.269 I-10.091 J-13.608 E.04506
G1 X146.779 Y146.906 E.01079
G3 X148.384 Y145.233 I8.968 J7.001 E.06292
G2 X149.791 Y142.567 I-3.102 J-3.341 E.08326
G2 X150.758 Y141.215 I-13.272 J-10.514 E.04506
G1 X152.626 Y139.868 F30000
G1 F10826.06
G2 X153.404 Y138.399 I-14.561 J-8.646 E.04506
G3 X153.014 Y137.126 I1.943 J-1.292 E.03658
G2 X154.262 Y133.742 I-26.844 J-11.825 E.0978
G3 X155.505 Y132.485 I163.084 J160.119 E.04789
G2 X156.159 Y128.38 I-41.509 J-8.715 E.11267
G2 X155.354 Y127.167 I-3.22 J1.263 E.03976
G2 X154.69 Y119.914 I-27.696 J-1.122 E.19792
G2 X155.43 Y119.193 I-3.153 J-3.974 E.02807
G2 X147.701 Y105.74 I-28.053 J7.171 E.4256
G2 X147.107 Y106.387 I2.859 J3.226 E.02384
G2 X143.14 Y103.19 I-24.934 J26.883 E.13816
G2 X142.917 Y101.991 I-3.158 J-.034 E.03324
G2 X141.48 Y101.157 I-26.558 J44.112 E.04505
G1 X134.057 Y99.302 F30000
G1 F10826.06
G3 X135.668 Y99.714 I-11.17 J46.945 E.04505
G2 X134.465 Y98.49 I-6.579 J5.258 E.04658
G2 X126.43 Y97.784 I-6.645 J29.537 E.21922
G2 X126.919 Y98.647 I1.702 J-.394 E.02727
G2 X121.935 Y99.305 I1.098 J27.533 E.13641
G2 X121.175 Y98.574 I-3.946 J3.345 E.02862
G2 X115.446 Y100.681 I6.929 J27.679 E.16571
G3 X115.918 Y101.43 I-1.501 J1.469 E.02415
G2 X114.452 Y102.213 I7.233 J15.312 E.04506
; WIPE_START
G1 X115.918 Y101.43 E-.63167
G1 X115.759 Y101.132 E-.12833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.64 I-.622 J-1.046 P1  F30000
G1 X108.047 Y105.714 Z7.64
G1 Z7.24
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.461386
G1 F3000
G1 X105.244 Y109.217 E.1249
G2 X103.361 Y112.124 I23.755 J17.447 E.09648
G1 X103.424 Y112.174 E.00224
G1 X109.125 Y105.051 E.25402
G1 X109.459 Y105.317 E.01189
G1 X103.649 Y112.577 E.25885
G1 X101.627 Y115.841 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X102.272 Y114.309 I15.907 J5.794 E.04506
G3 X102.777 Y115.364 I-2.217 J1.709 E.03191
G2 X101.359 Y119.673 I37 J14.56 E.12299
G3 X100.219 Y120.983 I-15.743 J-12.554 E.04707
G2 X99.785 Y124.267 I23.566 J4.781 E.08985
G2 X99.951 Y125.164 I.987 J.281 E.0256
G1 X100.625 Y125.946 E.02798
G2 X101.519 Y132.965 I31.389 J-.432 E.19215
G2 X100.799 Y133.677 I2.822 J3.578 E.02748
G2 X107.74 Y145.711 I27.369 J-7.766 E.38031
G2 X108.373 Y145.082 I-2.5 J-3.15 E.02425
G2 X113.049 Y148.939 I20.027 J-19.514 E.16455
G2 X112.873 Y149.872 I2.284 J.913 E.02589
G2 X114.3 Y150.724 I9.393 J-14.113 E.04506
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X112.873 Y149.872 E-.63168
G1 X112.902 Y149.536 E-.12832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/58
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.64 I-.28 J1.184 P1  F30000
G1 X127.649 Y153.024 Z7.64
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X126.344 Y152.974 E.03539
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51165
G1 X125.742 Y152.105 E-.24835
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.613 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X127.65 Y154.621 E.01901
G3 X122.761 Y97.86 I.34 J-28.62 E2.28487
G3 X128.722 Y97.388 I5.244 J28.332 E.16233
G3 X129.054 Y154.603 I-.732 J28.613 E2.38787
G1 X128.411 Y154.612 E.01743
G1 X128.356 Y155.028 F30000
G1 F9000
G1 X127.644 Y155.037 E.01929
G3 X122.685 Y97.451 I.345 J-29.036 E2.31805
G3 X128.732 Y96.972 I5.32 J28.743 E.16468
G3 X129.07 Y155.019 I-.743 J29.029 E2.42256
G1 X128.416 Y155.028 E.0177
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.639 Y155.438 E.01815
G3 X122.611 Y97.057 I.35 J-29.437 E2.18041
G3 X128.742 Y96.572 I5.394 J29.141 E.1549
G3 X129.084 Y155.419 I-.753 J29.429 E2.27874
G1 X128.421 Y155.428 E.01667
; WIPE_START
M204 S10000
G1 X127.639 Y155.438 E-.29717
G1 X126.422 Y155.393 E-.46283
; WIPE_END
G1 E-.04 F1800
G1 X120.4 Y152.306 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X122.064 Y152.759 I-1.34 J8.189 E.0468
G3 X122.849 Y153.794 I-2.031 J2.356 E.03546
G2 X128.78 Y154.25 I5.178 J-28.567 E.16148
G2 X127.933 Y153.375 I-5.003 J4.001 E.03306
G2 X135.093 Y152.445 I.03 J-27.787 E.19621
G3 X135.824 Y153.155 I-4.509 J5.375 E.02764
G2 X139.819 Y151.669 I-12.41 J-39.487 E.11555
G3 X139.571 Y150.809 I1.27 J-.834 E.02463
G2 X141.057 Y150.065 I-6.83 J-15.493 E.04506
G1 X145.101 Y148.508 F30000
G1 F10826.06
G2 X146.391 Y147.46 I-35.403 J-44.928 E.04505
G3 X147.316 Y146.069 I2.94 J.952 E.04583
G2 X149.017 Y144.397 I-7.902 J-9.738 E.06474
G2 X149.832 Y142.514 I-4.129 J-2.904 E.056
G2 X150.796 Y141.16 I-13.29 J-10.486 E.04506
G1 X152.534 Y140.032 F30000
G1 F10826.06
G2 X153.313 Y138.564 I-14.549 J-8.668 E.04506
G1 X152.971 Y137.707 E.02501
G1 X152.94 Y137.297 E.01115
G2 X154.199 Y133.942 I-26.73 J-11.939 E.09716
G3 X155.445 Y132.75 I6.859 J5.929 E.0468
G2 X156.162 Y128.436 I-45.485 J-9.778 E.11854
G2 X155.347 Y127.281 I-3.169 J1.372 E.03859
G2 X154.716 Y120.025 I-27.645 J-1.253 E.19793
G1 X155.467 Y119.352 E.02732
G2 X147.622 Y105.656 I-27.529 J6.675 E.43341
G2 X146.985 Y106.274 I3.923 J4.677 E.02405
G2 X143.204 Y103.234 I-24.982 J27.205 E.13157
G2 X142.91 Y101.994 I-3.374 J.145 E.03476
G2 X141.473 Y101.158 I-9.222 J14.211 E.04506
G1 X134.349 Y99.365 F30000
G1 F10826.06
G3 X135.952 Y99.805 I-3.674 J16.532 E.04506
G2 X134.649 Y98.528 I-6.462 J5.292 E.04952
G2 X126.296 Y97.784 I-6.804 J29.128 E.22799
G2 X126.721 Y98.655 I1.871 J-.375 E.02654
G2 X122.09 Y99.268 I1.356 J28.017 E.12674
G2 X121.292 Y98.548 I-5.342 J5.117 E.02917
G2 X115.381 Y100.71 I8.513 J32.421 E.17079
G3 X115.886 Y101.446 I-1.507 J1.574 E.02435
G2 X114.42 Y102.231 I7.251 J15.307 E.04506
G1 X109.391 Y105.852 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F11668.309
G1 X109.736 Y105.539 E.01171
G1 X109.112 Y105.039 E.02011
G2 X103.411 Y112.162 I18.425 J20.59 E.23042
G1 X104.044 Y112.66 E.02027
G3 X109.347 Y105.893 I23.792 J13.181 E.21707
G1 X103.922 Y112.058 F30000
; LINE_WIDTH: 0.444162
G1 F10980.265
G1 X103.967 Y111.977 E.00248
G3 X109.08 Y105.599 I24.622 J14.497 E.21915
G1 X101.602 Y115.91 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X102.237 Y114.374 I15.94 J5.693 E.04506
G3 X102.772 Y115.375 I-2.107 J1.768 E.03097
G2 X101.305 Y119.93 I25.695 J10.79 E.12981
G2 X100.293 Y120.983 I5.006 J5.819 E.03963
G1 X100.144 Y121.233 E.00789
G2 X99.75 Y125.086 I52.463 J7.317 E.10498
G2 X100.623 Y126.121 I7.145 J-5.14 E.03673
G2 X101.553 Y133.086 I27.969 J-.193 E.1909
G2 X100.832 Y133.777 I3.258 J4.122 E.02712
G2 X107.669 Y145.628 I27.178 J-7.782 E.37445
G2 X108.309 Y145.016 I-2.885 J-3.655 E.02403
G2 X113.05 Y148.94 I20.105 J-19.464 E.16711
G2 X112.827 Y149.844 I2.239 J1.032 E.02538
G2 X114.256 Y150.693 I9.349 J-14.121 E.04506
; CHANGE_LAYER
; Z_HEIGHT: 7.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X112.827 Y149.844 E-.63164
G1 X112.874 Y149.51 E-.12836
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/58
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.8 I-.282 J1.184 P1  F30000
G1 X127.649 Y153.024 Z7.8
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X126.344 Y152.974 E.03539
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.742 Y152.105 E-.24836
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.613 Z7.96 F30000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X127.65 Y154.621 E.01901
G3 X122.761 Y97.86 I.34 J-28.62 E2.28486
G3 X128.748 Y97.388 I5.244 J28.334 E.16305
G3 X129.054 Y154.603 I-.759 J28.612 E2.38717
G1 X128.411 Y154.612 E.01743
G1 X128.356 Y155.028 F30000
G1 F9000
G1 X127.644 Y155.037 E.01929
G3 X122.685 Y97.451 I.345 J-29.036 E2.31804
G3 X128.759 Y96.973 I5.321 J28.745 E.1654
G3 X129.07 Y155.019 I-.769 J29.028 E2.42186
G1 X128.416 Y155.028 E.0177
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.639 Y155.438 E.01815
G3 X122.611 Y97.057 I.35 J-29.437 E2.1804
G3 X128.769 Y96.572 I5.394 J29.143 E.15556
G3 X129.084 Y155.419 I-.779 J29.429 E2.27809
G1 X128.421 Y155.428 E.01666
; WIPE_START
M204 S10000
G1 X127.639 Y155.438 E-.29718
G1 X126.422 Y155.393 E-.46282
; WIPE_END
G1 E-.04 F1800
G1 X130.356 Y154.161 Z7.96 F30000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X128.697 Y154.253 I-1.764 J-16.842 E.04506
G2 X127.773 Y153.373 I-5.857 J5.226 E.03461
G3 X122.272 Y152.768 I.23 J-27.394 E.1502
G3 X123.031 Y153.823 I-1.65 J1.987 E.03561
G3 X112.778 Y149.814 I5.048 J-28.023 E.30022
G3 X113.047 Y148.938 I2.481 J.282 E.02497
G3 X108.248 Y144.953 I15.389 J-23.416 E.16936
G3 X107.592 Y145.55 I-3.984 J-3.722 E.02404
G3 X100.859 Y133.871 I20.428 J-19.558 E.36885
G3 X101.587 Y133.203 I4.457 J4.133 E.0268
G3 X100.621 Y126.282 I27.071 J-7.309 E.18986
G3 X99.746 Y125.384 I2.87 J-3.67 E.03407
G3 X100.127 Y121.342 I44.55 J2.155 E.11005
G1 X100.365 Y120.983 E.01168
G3 X101.27 Y120.091 I5.921 J5.11 E.03448
M73 P92 R3
G3 X102.77 Y115.378 I26.92 J5.972 E.13421
G2 X102.211 Y114.435 I-2.539 J.868 E.02992
G2 X101.579 Y115.972 I15.318 J7.199 E.04506
G1 X109.391 Y105.852 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F11668.309
G1 X109.736 Y105.539 E.01171
G1 X109.112 Y105.039 E.02011
G2 X103.411 Y112.162 I18.424 J20.589 E.23042
G1 X104.044 Y112.66 E.02027
G3 X109.347 Y105.893 I24.223 J13.519 E.21703
G1 X103.922 Y112.058 F30000
; LINE_WIDTH: 0.444161
G1 F10980.31
G1 X103.967 Y111.977 E.00249
G3 X109.08 Y105.599 I24.622 J14.498 E.21914
G1 X114.394 Y102.246 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X115.859 Y101.46 I8.725 J14.507 E.04506
G2 X115.323 Y100.741 I-2.019 J.944 E.02448
G3 X121.41 Y98.52 I14.307 J29.758 E.17586
G1 X122.251 Y99.23 E.02983
G3 X126.531 Y98.662 I5.969 J28.546 E.11709
G3 X126.154 Y97.795 I1.274 J-1.068 E.02596
G3 X134.868 Y98.586 I1.85 J28.02 E.23806
G3 X136.203 Y99.884 I-3.408 J4.84 E.05068
G2 X134.604 Y99.432 I-5.403 J16.053 E.04506
G1 X141.469 Y101.157 F30000
G1 F10826.06
G3 X142.907 Y101.992 I-7.783 J15.046 E.04506
G3 X143.282 Y103.288 I-3.284 J1.654 E.03677
G3 X146.879 Y106.175 I-21.646 J30.649 E.12507
G3 X147.535 Y105.576 I3.308 J2.965 E.02412
G3 X155.5 Y119.491 I-19.571 J20.438 E.44046
G1 X154.741 Y120.131 E.02689
G3 X155.341 Y127.379 I-27.068 J5.887 E.19764
G3 X156.159 Y128.463 I-2.228 J2.534 E.03707
G3 X155.389 Y132.963 I-41.83 J-4.844 E.12378
G2 X154.149 Y134.097 I6.33 J8.167 E.04557
G3 X152.837 Y137.52 I-49.505 J-17.01 E.09936
G1 X152.839 Y137.707 E.00506
G1 X153.113 Y138.543 E.02384
G1 X153.236 Y138.723 E.0059
G3 X146.182 Y147.644 I-26.492 J-13.698 E.31009
G3 X147.116 Y146.069 I2.746 J.564 E.05054
G2 X148.946 Y144.397 I-9.34 J-12.057 E.06725
G2 X149.89 Y142.437 I-4.019 J-3.144 E.0594
G2 X150.85 Y141.081 I-13.325 J-10.452 E.04506
; WIPE_START
G1 X149.89 Y142.437 E-.63165
G1 X149.833 Y142.725 E-.11126
G1 X149.817 Y142.766 E-.01709
; WIPE_END
G1 E-.04 F1800
G1 X143.941 Y147.638 Z7.96 F30000
G1 X140.946 Y150.122 Z7.96
G1 Z7.56
G1 E.8 F1800
G1 F10826.06
G3 X139.457 Y150.861 I-8.261 J-14.776 E.04506
G2 X139.672 Y151.737 I1.5 J.097 E.02481
G3 X135.982 Y153.109 I-17.581 J-41.623 E.10671
G2 X135.226 Y152.406 I-3.874 J3.41 E.02802
G3 X133.611 Y152.8 I-11.926 J-45.448 E.04505
; CHANGE_LAYER
; Z_HEIGHT: 7.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X135.226 Y152.406 E-.63168
G1 X135.473 Y152.636 E-.12832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/58
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.96 I-.06 J-1.215 P1  F30000
G1 X127.649 Y153.024 Z7.96
G1 Z7.72
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X126.344 Y152.974 E.03538
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51163
G1 X125.751 Y152.113 E-.24463
G1 X125.741 Y152.112 E-.00374
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.613 Z8.12 F30000
G1 Z7.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X127.65 Y154.621 E.01901
G3 X122.761 Y97.86 I.34 J-28.621 E2.28484
G3 X128.775 Y97.389 I5.245 J28.338 E.16377
G3 X129.054 Y154.603 I-.785 J28.612 E2.38647
G1 X128.411 Y154.612 E.01743
G1 X128.356 Y155.028 F30000
G1 F9000
G1 X127.644 Y155.037 E.01929
G3 X122.685 Y97.451 I.346 J-29.036 E2.31803
G3 X128.785 Y96.973 I5.321 J28.749 E.16612
G3 X129.07 Y155.019 I-.795 J29.027 E2.42116
G1 X128.416 Y155.028 E.0177
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.639 Y155.438 E.01815
G3 X122.611 Y97.057 I.351 J-29.437 E2.18039
G3 X128.795 Y96.573 I5.395 J29.147 E.15623
G3 X129.084 Y155.419 I-.805 J29.428 E2.27744
G1 X128.421 Y155.428 E.01666
; WIPE_START
M204 S10000
G1 X127.639 Y155.438 E-.29719
G1 X126.422 Y155.393 E-.46281
; WIPE_END
G1 E-.04 F1800
G1 X130.274 Y154.168 Z8.12 F30000
G1 Z7.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X128.614 Y154.256 I-1.724 J-16.85 E.04506
G2 X127.6 Y153.371 I-6.816 J6.788 E.0365
G3 X122.555 Y152.828 I.408 J-27.489 E.13769
G3 X123.228 Y153.855 I-1.312 J1.593 E.03378
G3 X112.725 Y149.781 I4.821 J-28.004 E.30729
G3 X113.038 Y148.932 I2.516 J.446 E.02466
G3 X108.19 Y144.894 I15.42 J-23.444 E.17133
G3 X107.515 Y145.47 I-4.444 J-4.527 E.02407
G3 X100.883 Y133.954 I20.528 J-19.49 E.36348
G3 X101.62 Y133.318 I4.907 J4.939 E.02642
G3 X100.624 Y126.441 I30.434 J-7.921 E.18867
G3 X99.742 Y125.671 I2.444 J-3.685 E.03181
G3 X100.114 Y121.417 I41.33 J1.471 E.11575
G3 X101.236 Y120.255 I3.397 J2.155 E.04406
G3 X102.773 Y115.373 I26.833 J5.764 E.1389
G2 X102.19 Y114.485 I-2.43 J.961 E.02898
G2 X101.56 Y116.023 I15.335 J7.176 E.04506
G1 X109.391 Y105.852 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F11668.309
G1 X109.736 Y105.539 E.01171
G1 X109.112 Y105.039 E.02011
G2 X103.411 Y112.162 I18.425 J20.59 E.23042
G1 X104.044 Y112.66 E.02027
G3 X109.347 Y105.893 I24.225 J13.52 E.21703
G1 X103.922 Y112.058 F30000
; LINE_WIDTH: 0.444164
G1 F10980.233
G1 X103.967 Y111.977 E.00248
G3 X109.08 Y105.598 I24.642 J14.512 E.21915
G1 X114.373 Y102.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X115.837 Y101.471 I8.737 J14.504 E.04506
G2 X115.269 Y100.769 I-1.999 J1.036 E.02466
G3 X121.534 Y98.49 I14.23 J29.373 E.18095
G1 X122.428 Y99.193 E.03082
G3 X126.317 Y98.67 I5.993 J29.819 E.10642
G3 X125.998 Y97.808 I1.128 J-.908 E.02533
G3 X135.119 Y98.652 I2.025 J27.841 E.24933
G3 X136.474 Y99.97 I-2.342 J3.763 E.05162
G2 X134.878 Y99.504 I-5.537 J16.009 E.04506
G1 X141.475 Y101.16 F30000
G1 F10826.06
G3 X142.912 Y101.995 I-7.784 J15.041 E.04506
G3 X143.377 Y103.353 I-3.54 J1.97 E.03909
G3 X146.761 Y106.065 I-22.476 J31.505 E.11756
G3 X147.447 Y105.494 I2.482 J2.285 E.02427
G3 X155.532 Y119.629 I-19.468 J20.516 E.44758
G2 X154.768 Y120.243 I3.992 J5.754 E.02659
G3 X155.336 Y127.463 I-27.195 J5.771 E.1968
G3 X156.158 Y128.478 I-2.068 J2.514 E.03566
G3 X155.337 Y133.162 I-39.626 J-4.532 E.12892
G2 X154.111 Y134.217 I6.909 J9.263 E.04385
G3 X152.714 Y137.774 I-41.976 J-14.442 E.10359
G1 X152.907 Y138.543 E.02149
G1 X153.143 Y138.913 E.01189
G3 X146.009 Y147.782 I-26.355 J-13.895 E.31033
G1 X146.217 Y146.906 E.02441
G3 X146.891 Y146.069 I2.371 J1.222 E.02931
G2 X148.877 Y144.397 I-10.931 J-14.996 E.07041
G2 X149.972 Y142.329 I-3.957 J-3.418 E.06394
G2 X150.927 Y140.969 I-13.369 J-10.4 E.04506
; WIPE_START
G1 X149.972 Y142.329 E-.63168
G1 X149.889 Y142.657 E-.12832
; WIPE_END
G1 E-.04 F1800
G1 X144.017 Y147.532 Z8.12 F30000
G1 X140.819 Y150.188 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F10826.06
G3 X139.327 Y150.921 I-8.199 J-14.812 E.04506
G1 X139.317 Y151.087 E.00451
G1 X139.5 Y151.815 E.02035
G3 X136.158 Y153.058 I-20.632 J-50.374 E.09663
G2 X135.367 Y152.365 I-2.989 J2.618 E.02858
G3 X133.754 Y152.769 I-4.911 J-16.208 E.04506
; CHANGE_LAYER
; Z_HEIGHT: 7.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X135.367 Y152.365 E-.63167
G1 X135.621 Y152.588 E-.12833
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/58
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.12 I-.066 J-1.215 P1  F30000
G1 X127.649 Y153.024 Z8.12
G1 Z7.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X126.344 Y152.974 E.03539
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.742 Y152.105 E-.24836
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.621 Z8.28 F30000
G1 Z7.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X123.452 Y97.74 I-.361 J-28.62 E2.3229
G3 X128.801 Y97.39 I4.658 J30.1 E.14544
G3 X128.411 Y154.62 I-.812 J28.611 E2.40315
G1 X128.356 Y155.037 F30000
G1 F9000
G3 X123.387 Y97.33 I-.367 J-29.036 E2.35665
G3 X128.812 Y96.974 I4.725 J30.538 E.14751
G3 X128.416 Y155.036 I-.822 J29.027 E2.43812
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.639 Y155.438 E.01815
G3 X122.611 Y97.057 I.351 J-29.437 E2.18037
G3 X128.821 Y96.574 I5.395 J29.153 E.1569
G3 X129.084 Y155.419 I-.831 J29.427 E2.2768
G1 X128.421 Y155.428 E.01666
; WIPE_START
M204 S10000
G1 X127.639 Y155.438 E-.29719
G1 X126.422 Y155.393 E-.46281
; WIPE_END
G1 E-.04 F1800
G1 X130.192 Y154.175 Z8.28 F30000
G1 Z7.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X128.532 Y154.259 I-1.682 J-16.852 E.04506
G2 X127.407 Y153.369 I-7.732 J8.611 E.0389
G3 X122.884 Y152.897 I.68 J-28.47 E.12336
G3 X123.442 Y153.889 I-1.054 J1.245 E.0315
G3 X112.669 Y149.747 I4.596 J-28.029 E.31494
G3 X113.025 Y148.923 I2.569 J.624 E.02443
G3 X108.135 Y144.838 I15.458 J-23.473 E.17304
G3 X107.436 Y145.389 I-4.789 J-5.352 E.02415
G3 X100.905 Y134.03 I20.644 J-19.426 E.3583
G3 X101.653 Y133.43 I5.201 J5.721 E.026
G3 X100.63 Y126.596 I30.118 J-8.004 E.18762
G1 X99.739 Y125.936 E.03004
G3 X100.106 Y121.469 I40.061 J1.042 E.12151
G3 X101.204 Y120.405 I3.107 J2.107 E.04172
G3 X102.778 Y115.361 I26.853 J5.611 E.14339
G2 X102.172 Y114.527 I-2.313 J1.042 E.02814
G3 X102.887 Y113.026 I15.636 J6.526 E.04506
G1 X104.63 Y111.66 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
M73 P93 R3
G3 X108.888 Y106.34 I23.376 J14.344 E.17178
G1 X108.262 Y105.839 E.02015
G2 X104.004 Y111.16 I18.708 J19.337 E.1718
G1 X104.583 Y111.623 E.01864
G1 X104.527 Y111.069 F30000
; LINE_WIDTH: 0.444158
G1 F10980.399
G1 X104.685 Y110.814 E.008
G3 X108.245 Y106.411 I24.239 J15.961 E.15152
G1 X114.357 Y102.268 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X115.821 Y101.48 I8.747 J14.503 E.04506
G2 X115.218 Y100.795 I-1.949 J1.105 E.02489
G3 X121.664 Y98.459 I14.188 J29.092 E.18613
G1 X122.631 Y99.155 E.03227
G3 X126.079 Y98.69 I5.579 J28.342 E.09433
G3 X125.823 Y97.823 I1.029 J-.775 E.02502
G3 X135.422 Y98.732 I2.212 J27.806 E.26259
G3 X136.765 Y100.062 I-1.581 J2.94 E.05194
G2 X135.174 Y99.582 I-5.681 J15.957 E.04506
G1 X141.492 Y101.169 F30000
G1 F10826.06
G3 X142.929 Y102.005 I-7.789 J15.031 E.04506
G3 X143.491 Y103.431 I-6.446 J3.365 E.0416
M73 P93 R2
G3 X146.63 Y105.931 I-17.377 J25.047 E.10883
G1 X147.355 Y105.409 E.0242
G3 X155.565 Y119.766 I-19.375 J20.605 E.45481
G2 X154.792 Y120.348 I4.294 J6.515 E.02623
G3 X155.331 Y127.533 I-30.545 J5.906 E.19568
G1 X156.157 Y128.484 E.03414
G3 X155.289 Y133.345 I-38.463 J-4.365 E.1339
G2 X154.082 Y134.309 I7.151 J10.19 E.04185
G3 X152.592 Y138.024 I-39.082 J-13.525 E.10851
G2 X153.047 Y139.099 I1.658 J-.068 E.03234
G3 X145.871 Y147.893 I-25.18 J-13.224 E.30964
G1 X145.985 Y146.906 E.02693
G3 X146.63 Y146.069 I1.928 J.82 E.02893
G2 X148.812 Y144.397 I-12.37 J-18.392 E.07453
G2 X150.089 Y142.175 I-3.973 J-3.763 E.0701
G2 X151.031 Y140.805 I-35.818 J-25.616 E.04505
; WIPE_START
G1 X150.089 Y142.175 E-.63166
G1 X149.988 Y142.498 E-.12834
; WIPE_END
G1 E-.04 F1800
G1 X144.125 Y147.385 Z8.28 F30000
G1 X140.67 Y150.265 Z8.28
G1 Z7.88
G1 E.8 F1800
G1 F10826.06
G3 X139.174 Y150.991 I-8.124 J-14.85 E.04506
G1 X139.293 Y151.91 E.02512
G3 X136.362 Y152.999 I-34.118 J-87.364 E.08474
G2 X135.52 Y152.321 I-2.346 J2.052 E.02944
G3 X133.91 Y152.732 I-4.987 J-16.186 E.04506
; CHANGE_LAYER
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X135.52 Y152.321 E-.63164
G1 X135.794 Y152.518 E-.12836
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/58
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.28 I-.075 J-1.215 P1  F30000
G1 X127.649 Y153.024 Z8.28
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X126.344 Y152.974 E.03539
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.751 Y152.113 E-.24463
G1 X125.741 Y152.112 E-.00374
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.62 Z8.44 F30000
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X123.452 Y97.74 I-.361 J-28.62 E2.32284
G3 X128.828 Y97.39 I4.657 J30.095 E.14615
G3 X128.411 Y154.619 I-.838 J28.61 E2.40244
G1 X128.356 Y155.036 F30000
G1 F9000
G3 X123.387 Y97.33 I-.366 J-29.035 E2.35658
G3 X128.838 Y96.975 I4.724 J30.533 E.14823
G3 X128.416 Y155.035 I-.848 J29.025 E2.43739
M204 S250
G1 X128.362 Y155.438 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.361 Y155.436 E.00004
G3 X123.323 Y96.934 I-.371 J-29.436 E2.21668
G3 X128.848 Y96.574 I4.79 J30.956 E.13938
G3 X129.805 Y155.382 I-.858 J29.426 E2.25791
G1 X128.421 Y155.435 E.03481
; WIPE_START
M204 S10000
G1 X128.361 Y155.436 E-.02293
G1 X126.916 Y155.42 E-.54905
G1 X126.422 Y155.39 E-.18801
; WIPE_END
G1 E-.04 F1800
G1 X130.129 Y154.181 Z8.44 F30000
G1 Z8.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X128.469 Y154.261 I-1.651 J-16.852 E.04506
G2 X127.181 Y153.366 I-8.72 J11.161 E.04251
G3 X123.266 Y152.964 I2.863 J-47.194 E.10668
G3 X123.676 Y153.927 I-.885 J.946 E.0292
G3 X112.609 Y149.71 I4.372 J-28.104 E.3233
G3 X113.008 Y148.911 I2.643 J.821 E.02429
G3 X108.093 Y144.815 I19.764 J-28.711 E.17361
G3 X107.355 Y145.306 I-14.96 J-21.684 E.02403
G3 X100.918 Y134.074 I20.772 J-19.365 E.3539
G3 X101.685 Y133.539 I3.324 J3.943 E.02538
G3 X100.635 Y126.744 I29.922 J-8.1 E.18669
G1 X99.736 Y126.164 E.02897
G3 X100.101 Y121.502 I39.656 J.754 E.1268
G3 X101.185 Y120.493 I4.218 J3.447 E.04026
G3 X102.785 Y115.343 I26.897 J5.533 E.14636
G2 X102.157 Y114.56 I-2.188 J1.111 E.02739
G3 X105.761 Y108.558 I29.465 J13.61 E.19007
G2 X106.158 Y109.499 I3.078 J-.744 E.02779
G3 X115.808 Y101.486 I22.515 J17.299 E.34272
G2 X115.179 Y100.816 I-2.34 J1.565 E.02505
G3 X121.805 Y98.426 I14.171 J28.912 E.19127
G1 X122.868 Y99.111 E.03427
G3 X125.791 Y98.715 I5.163 J27.117 E.07995
G3 X125.623 Y97.841 I.998 J-.644 E.02473
G3 X135.824 Y98.838 I2.416 J27.962 E.27928
G3 X137.045 Y100.158 I-.859 J2.019 E.05022
G2 X135.46 Y99.657 I-14.071 J41.776 E.04505
G1 X141.523 Y101.186 F30000
G1 F10826.06
G3 X142.958 Y102.024 I-7.809 J15.03 E.04506
G3 X143.613 Y103.515 I-5.729 J3.405 E.04424
G3 X146.491 Y105.814 I-27.391 J37.226 E.09984
G1 X147.259 Y105.319 E.02476
G3 X152.408 Y111.784 I-20.696 J21.767 E.22468
G3 X153.981 Y114.862 I-61.477 J33.365 E.09368
G3 X155.598 Y119.904 I-35.129 J14.042 E.14358
G2 X154.806 Y120.425 I15.04 J23.736 E.02567
G3 X155.328 Y127.583 I-30.449 J5.819 E.19494
G3 X156.157 Y128.482 I-2.299 J2.953 E.03328
G3 X155.222 Y133.526 I-26.046 J-2.222 E.13923
G2 X154.057 Y134.388 I4.905 J7.843 E.0393
G2 X154.519 Y132.791 I-16.026 J-5.496 E.04506
G1 X152.104 Y140.75 F30000
G1 F10826.06
G2 X152.932 Y139.309 I-14.252 J-9.138 E.04506
G3 X152.402 Y138.412 I.904 J-1.139 E.02885
G3 X150.268 Y141.93 I-39.926 J-21.819 E.11152
G3 X147.607 Y145.233 I-5.616 J-1.8 E.11757
G2 X145.743 Y146.852 I11.698 J15.356 E.06693
G1 X145.68 Y147.742 E.02419
G1 X145.735 Y148.002 E.00719
G2 X146.999 Y146.923 I-10.357 J-13.416 E.04506
G1 X140.493 Y150.357 F30000
G1 F10826.06
G3 X138.991 Y151.087 I-80.54 J-163.901 E.04527
G1 X139.068 Y152.009 E.02508
G3 X136.607 Y152.924 I-10.541 J-24.593 E.07117
G1 X136.449 Y152.759 E.00618
G1 X135.692 Y152.271 E.02441
G3 X134.084 Y152.69 I-5.072 J-16.155 E.04506
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X135.692 Y152.271 E-.63163
G1 X135.976 Y152.454 E-.12837
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/58
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.44 I-.083 J-1.214 P1  F30000
G1 X127.649 Y153.024 Z8.44
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X126.344 Y152.974 E.03538
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.751 Y152.113 E-.24463
G1 X125.741 Y152.112 E-.00374
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.621 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X124.148 Y97.637 I-.361 J-28.62 E2.34196
G3 X128.854 Y97.391 I3.861 J28.735 E.12785
G3 X128.411 Y154.62 I-.865 J28.61 E2.40174
G1 X128.356 Y155.036 F30000
G1 F9000
G3 X124.092 Y97.225 I-.367 J-29.036 E2.37597
G3 X128.864 Y96.975 I3.917 J29.149 E.12965
G3 X128.416 Y155.035 I-.875 J29.025 E2.43668
M204 S250
G1 X128.362 Y155.438 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.361 Y155.436 E.00004
G3 X123.323 Y96.934 I-.371 J-29.436 E2.21665
G3 X128.874 Y96.575 I4.789 J30.954 E.14004
G3 X129.805 Y155.382 I-.884 J29.425 E2.25729
G1 X128.421 Y155.435 E.03481
; WIPE_START
M204 S10000
G1 X128.361 Y155.436 E-.02295
G1 X126.916 Y155.42 E-.54905
G1 X126.423 Y155.39 E-.188
; WIPE_END
G1 E-.04 F1800
G1 X130.047 Y154.188 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G3 X128.386 Y154.264 I-1.61 J-16.863 E.04506
G2 X126.852 Y153.355 I-6.496 J9.211 E.04838
G3 X123.757 Y153.043 I1.339 J-28.809 E.08432
G3 X123.938 Y153.969 I-.888 J.654 E.02642
G3 X112.547 Y149.669 I4.547 J-29.283 E.33231
G3 X112.986 Y148.896 I2.734 J1.042 E.02418
G3 X108.054 Y144.755 I15.528 J-23.499 E.1749
G3 X107.273 Y145.22 I-2.725 J-3.682 E.02468
G3 X100.936 Y134.136 I21.788 J-19.81 E.34873
G3 X101.716 Y133.646 I2.848 J3.659 E.02501
G3 X100.64 Y126.882 I29.826 J-8.21 E.18594
G2 X99.737 Y126.412 I-34.045 J64.246 E.02761
G3 X100.098 Y121.521 I29.362 J-.29 E.13303
G3 X101.164 Y120.592 I3.211 J2.607 E.03854
G3 X102.795 Y115.32 I26.97 J5.455 E.14977
G2 X102.146 Y114.587 I-2.054 J1.166 E.02673
G3 X105.694 Y108.647 I29.443 J13.556 E.18784
G2 X106.132 Y109.534 I3.106 J-.982 E.02691
G3 X115.801 Y101.49 I22.539 J17.261 E.34367
M73 P94 R2
G2 X115.135 Y100.838 I-2.21 J1.593 E.02539
G3 X121.991 Y98.405 I12.438 J24.164 E.19773
G3 X123.189 Y99.052 I-4.657 J10.059 E.03692
G3 X125.416 Y98.747 I4.966 J28.057 E.06093
G3 X125.391 Y97.861 I1.184 J-.477 E.02455
G3 X136.637 Y99.093 I2.606 J28.159 E.30866
G3 X137.338 Y100.267 I-.472 J1.078 E.03955
G2 X135.761 Y99.744 I-6.117 J15.798 E.04506
G1 X141.57 Y101.212 F30000
G1 F10826.06
G3 X143.004 Y102.052 I-7.833 J15.017 E.04506
G3 X143.766 Y103.62 I-5.78 J3.778 E.04736
G3 X146.326 Y105.661 I-37.412 J49.533 E.08872
G3 X147.149 Y105.218 I4.016 J6.472 E.02537
G3 X152.143 Y111.303 I-19.371 J20.987 E.21399
G2 X152.562 Y112.621 I1.189 J.347 E.03975
G1 X153.043 Y112.906 E.01516
G3 X155.632 Y120.048 I-28.378 J14.327 E.20632
G2 X154.821 Y120.506 I4.039 J8.093 E.02524
G3 X155.325 Y127.635 I-30.372 J5.728 E.1941
G1 X156.158 Y128.474 E.03203
G3 X155.205 Y133.662 I-37.555 J-4.218 E.14307
G2 X154.029 Y134.478 I2.964 J5.531 E.03886
G2 X154.495 Y132.882 I-16.014 J-5.541 E.04506
G1 X151.973 Y140.963 F30000
G1 F10826.06
G2 X152.811 Y139.528 I-14.191 J-9.247 E.04506
G3 X152.194 Y138.962 I.568 J-1.239 E.02307
G1 X152.168 Y138.859 E.00286
G3 X150.475 Y141.629 I-24.966 J-13.369 E.08801
G3 X147.621 Y145.099 I-5.465 J-1.586 E.12514
G3 X145.423 Y147.117 I-73.869 J-78.226 E.08085
G2 X145.602 Y148.108 I2.826 J.003 E.02745
G2 X146.871 Y147.036 I-10.284 J-13.462 E.04506
G1 X140.299 Y150.458 F30000
G1 F10826.06
G3 X138.794 Y151.165 I-7.938 J-14.946 E.04506
G1 X138.71 Y151.923 E.02068
G1 X138.762 Y152.131 E.00582
G3 X136.933 Y152.812 I-7.834 J-18.264 E.0529
G1 X136.887 Y152.759 E.0019
G2 X135.919 Y152.205 I-4.986 J7.586 E.03024
G3 X134.314 Y152.636 I-5.186 J-16.125 E.04506
; CHANGE_LAYER
; Z_HEIGHT: 8.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X135.919 Y152.205 E-.63163
G1 X136.212 Y152.373 E-.12837
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/58
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.6 I-.092 J-1.213 P1  F30000
G1 X127.649 Y153.024 Z8.6
G1 Z8.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X126.344 Y152.974 E.03539
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51165
G1 X125.742 Y152.105 E-.24835
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.62 Z8.76 F30000
G1 Z8.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X124.148 Y97.637 I-.36 J-28.62 E2.3419
G3 X128.881 Y97.392 I3.863 J28.753 E.12856
G3 X128.411 Y154.62 I-.89 J28.609 E2.40106
G1 X128.356 Y155.036 F30000
G1 F9000
G3 X124.092 Y97.225 I-.366 J-29.036 E2.37591
G3 X128.891 Y96.976 I3.919 J29.169 E.13037
G3 X128.416 Y155.035 I-.901 J29.024 E2.43601
M204 S250
G1 X128.362 Y155.438 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.361 Y155.437 E.00002
G3 X124.037 Y96.828 I-.371 J-29.437 E2.23488
G3 X128.901 Y96.575 I3.973 J29.57 E.12257
G3 X129.805 Y155.384 I-.911 J29.425 E2.25665
G1 X128.422 Y155.436 E.03481
; WIPE_START
M204 S10000
G1 X128.361 Y155.437 E-.02295
G1 X126.916 Y155.42 E-.54907
G1 X126.423 Y155.39 E-.18798
; WIPE_END
G1 E-.04 F1800
G1 X120.532 Y150.537 Z8.76 F30000
G1 X101.095 Y134.524 Z8.76
G1 Z8.36
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F11668.309
G2 X100.709 Y133.193 I26.902 J-8.524 E4.42298
G1 X101.078 Y134.466 E.03332
G1 X101.48 Y132.995 F30000
G1 F11668.309
G3 X101.854 Y134.283 I26.516 J-6.993 E4.29817
G1 X101.497 Y133.053 E.03222
; WIPE_START
G1 X101.854 Y134.283 E-.48703
G1 X102.087 Y134.963 E-.27297
; WIPE_END
G1 E-.04 F1800
G1 X101.306 Y127.37 Z8.76 F30000
G1 X100.643 Y120.922 Z8.76
G1 Z8.36
G1 E.8 F1800
; Slow Down Start
; LINE_WIDTH: 0.44408
G1 F3000;_EXTRUDE_SET_SPEED
G3 X100.428 Y122.255 I27.354 J5.083 E4.63341
G1 X100.633 Y120.981 E.03449
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 8.52
; LAYER_HEIGHT: 0.160001
; WIPE_START
G1 F3000
G1 X100.428 Y122.255 E-.49062
G1 X100.35 Y122.96 E-.26938
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/58
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.76 I-.901 J.818 P1  F30000
G1 X127.649 Y153.024 Z8.76
G1 Z8.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.344 Y152.974 E.03538
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.751 Y152.113 E-.24463
G1 X125.741 Y152.112 E-.00374
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.613 Z8.92 F30000
G1 Z8.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X127.65 Y154.62 E.01901
G3 X124.845 Y97.551 I.34 J-28.62 E2.34194
G3 X128.907 Y97.392 I3.282 J31.961 E.11023
G3 X129.054 Y154.602 I-.917 J28.608 E2.38285
G1 X128.411 Y154.612 E.01742
G1 X128.356 Y155.028 F30000
G1 F9000
G1 X127.645 Y155.036 E.01929
G3 X124.799 Y97.138 I.345 J-29.036 E2.37596
G3 X128.917 Y96.977 I3.33 J32.424 E.11175
G3 X129.069 Y155.018 I-.928 J29.023 E2.41753
G1 X128.416 Y155.027 E.0177
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.639 Y155.437 E.01816
G3 X124.755 Y96.739 I.35 J-29.437 E2.23494
G3 X128.927 Y96.576 I3.375 J32.874 E.10504
G3 X129.084 Y155.419 I-.938 J29.424 E2.2741
G1 X128.421 Y155.428 E.01666
; WIPE_START
M204 S10000
G1 X127.639 Y155.437 E-.29722
G1 X126.422 Y155.393 E-.46278
; WIPE_END
G1 E-.04 F1800
G1 X128.331 Y153.425 Z8.92 F30000
G1 Z8.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
G3 X129.681 Y153.376 I-.329 J-27.421 E4.29794
G1 X128.391 Y153.423 E.03245
; WIPE_START
G1 X129.681 Y153.376 E-.49044
M73 P95 R2
G1 X130.388 Y153.315 E-.26956
; WIPE_END
G1 E-.04 F1800
G1 X130.201 Y145.684 Z8.92 F30000
G1 X129.037 Y98.197 Z8.92
G1 Z8.52
G1 E.8 F1800
; LINE_WIDTH: 0.444142
G1 F10980.818
G2 X138.318 Y100.159 I-1.03 J27.802 E4.41533
G2 X129.097 Y98.201 I-10.405 J26.298 E.25302
G1 X128.893 Y97.793 F30000
; LINE_WIDTH: 0.419996
G1 F11668.309
G2 X135.861 Y98.894 I-.888 J28.206 E4.27998
G2 X128.953 Y97.796 I-7.997 J28.037 E.17626
; CHANGE_LAYER
; Z_HEIGHT: 8.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.309
G1 X130.423 Y97.881 E-.55922
G1 X130.948 Y97.94 E-.20078
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/58
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z8.92 I-1.215 J-.073 P1  F30000
G1 X127.649 Y153.024 Z8.92
G1 Z8.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.344 Y152.974 E.03538
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.742 Y152.105 E-.24836
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.613 Z9.08 F30000
G1 Z8.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X127.65 Y154.621 E.01901
G3 X125.543 Y97.482 I.34 J-28.621 E2.361
G3 X128.934 Y97.393 I2.47 J29.424 E.09195
G3 X129.054 Y154.603 I-.944 J28.607 E2.38216
G1 X128.411 Y154.612 E.01742
G1 X128.356 Y155.028 F30000
G1 F9000
G1 X127.644 Y155.036 E.01929
G3 X125.508 Y97.068 I.345 J-29.036 E2.39531
G3 X128.944 Y96.977 I2.505 J29.839 E.09319
G3 X129.069 Y155.018 I-.954 J29.023 E2.41684
G1 X128.416 Y155.028 E.0177
M204 S250
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.639 Y155.436 E.01816
G3 X124.755 Y96.739 I.351 J-29.437 E2.23483
G3 X128.954 Y96.577 I3.375 J32.874 E.1057
G3 X129.084 Y155.418 I-.963 J29.423 E2.27347
M73 P95 R1
G1 X128.421 Y155.428 E.01666
; WIPE_START
M204 S10000
G1 X127.639 Y155.436 E-.29722
G1 X126.422 Y155.393 E-.46278
; WIPE_END
G1 E-.04 F1800
G1 X128.331 Y153.425 Z9.08 F30000
G1 Z8.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
G3 X129.681 Y153.376 I-.329 J-27.421 E4.29796
G1 X128.391 Y153.423 E.03245
; WIPE_START
G1 X129.681 Y153.376 E-.49045
G1 X130.388 Y153.315 E-.26955
; WIPE_END
G1 E-.04 F1800
G1 X130.201 Y145.684 Z9.08 F30000
G1 X129.038 Y98.197 Z9.08
G1 Z8.68
G1 E.8 F1800
; LINE_WIDTH: 0.444146
G1 F10980.719
G2 X138.318 Y100.159 I-1.032 J27.803 E4.41557
G1 X137.052 Y99.689 E.0361
G2 X129.097 Y98.2 I-9.022 J26.219 E.21696
G1 X128.92 Y97.793 F30000
; LINE_WIDTH: 0.419996
G1 F11668.309
G2 X134.521 Y98.541 I-.913 J28.203 E4.31522
G2 X128.98 Y97.797 I-6.482 J27.272 E.1408
; CHANGE_LAYER
; Z_HEIGHT: 8.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.309
G1 X130.422 Y97.881 E-.54918
G1 X130.974 Y97.943 E-.21082
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/58
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.08 I-1.215 J-.073 P1  F30000
G1 X127.649 Y153.024 Z9.08
G1 Z8.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.344 Y152.974 E.03538
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.751 Y152.113 E-.24463
G1 X125.741 Y152.112 E-.00374
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.613 Z9.24 F30000
G1 Z8.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X127.65 Y154.62 E.01901
G3 X125.543 Y97.482 I.341 J-28.62 E2.36091
G3 X128.949 Y97.393 I2.472 J29.451 E.09238
G3 X129.054 Y154.602 I-.959 J28.606 E2.38175
G1 X128.411 Y154.612 E.01742
G1 X128.356 Y155.028 F30000
G1 F9000
G1 X127.645 Y155.035 E.01929
G3 X125.508 Y97.068 I.346 J-29.036 E2.39519
G3 X128.964 Y96.978 I2.508 J29.877 E.09374
G3 X129.069 Y155.017 I-.973 J29.022 E2.41632
G1 X128.416 Y155.027 E.0177
M204 S250
M73 P96 R1
G1 X128.361 Y155.429 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X127.639 Y155.436 E.01816
G3 X125.473 Y96.669 I.351 J-29.436 E2.25297
G3 X128.978 Y96.577 I2.543 J30.293 E.08819
G3 X129.084 Y155.418 I-.987 J29.422 E2.27286
G1 X128.421 Y155.428 E.01666
; WIPE_START
M204 S10000
G1 X127.639 Y155.436 E-.29722
G1 X126.422 Y155.393 E-.46278
; WIPE_END
G1 E-.04 F1800
G1 X129.56 Y148.435 Z9.24 F30000
G1 X148.098 Y107.337 Z9.24
G1 Z8.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
G3 X147.154 Y106.369 I-20.099 J18.662 E4.29857
G1 X148.056 Y107.294 E.03247
; WIPE_START
G1 X147.154 Y106.369 E-.49077
G1 X146.635 Y105.887 E-.26923
; WIPE_END
G1 E-.04 F1800
G1 X139.641 Y102.831 Z9.24 F30000
G1 X129.038 Y98.196 Z9.24
G1 Z8.84
G1 E.8 F1800
; LINE_WIDTH: 0.444147
G1 F10980.678
G2 X137.037 Y99.684 I-1.031 J27.801 E4.45172
G2 X129.098 Y98.2 I-9.142 J26.933 E.21651
G1 X128.935 Y97.794 F30000
; LINE_WIDTH: 0.419996
G1 F11668.309
G2 X134.521 Y98.541 I-.93 J28.203 E4.31561
G2 X128.995 Y97.797 I-6.484 J27.279 E.14041
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.309
G1 X130.422 Y97.881 E-.54326
G1 X130.989 Y97.944 E-.21674
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/58
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.24 I-1.215 J-.074 P1  F30000
G1 X127.649 Y153.024 Z9.24
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.344 Y152.974 E.03538
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.742 Y152.105 E-.24836
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.62 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G3 X126.245 Y97.43 I-.36 J-28.62 E2.39901
G3 X128.975 Y97.394 I1.874 J38.175 E.07399
G3 X128.411 Y154.619 I-.984 J28.606 E2.39855
G1 X128.356 Y155.036 F30000
G1 F9000
G3 X126.22 Y97.015 I-.365 J-29.036 E2.43384
G3 X128.99 Y96.978 I1.901 J38.733 E.07509
G3 X128.416 Y155.035 I-.999 J29.021 E2.43339
M204 S250
G1 X128.362 Y155.438 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.361 Y155.436 E.00004
G3 X126.195 Y96.615 I-.37 J-29.437 E2.28934
G3 X129.004 Y96.578 I1.928 J39.271 E.07065
G3 X129.805 Y155.383 I-1.013 J29.422 E2.2541
G1 X128.422 Y155.435 E.0348
; WIPE_START
M204 S10000
G1 X128.361 Y155.436 E-.02299
G1 X126.916 Y155.42 E-.54905
G1 X126.423 Y155.39 E-.18796
; WIPE_END
G1 E-.04 F1800
G1 X125.329 Y147.836 Z9.4 F30000
G1 X118.447 Y100.29 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
G3 X117.194 Y100.791 I9.55 J25.708 E4.29827
G1 X118.392 Y100.312 E.03242
G1 X129.038 Y98.196 F30000
; LINE_WIDTH: 0.444146
G1 F10980.718
G2 X135.736 Y99.272 I-1.032 J27.801 E4.48815
G2 X129.098 Y98.2 I-7.876 J27.666 E.18004
G1 X128.961 Y97.794 F30000
; LINE_WIDTH: 0.419996
G1 F11668.309
G2 X133.165 Y98.254 I-.955 J28.204 E4.35134
G2 X129.021 Y97.798 I-5.474 J30.701 E.10491
; CHANGE_LAYER
; Z_HEIGHT: 9.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.309
G1 X130.422 Y97.881 E-.53359
G1 X131.015 Y97.947 E-.22641
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/58
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.4 I-1.215 J-.074 P1  F30000
G1 X127.649 Y153.024 Z9.4
G1 Z9.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X126.344 Y152.974 E.03538
G3 X127.669 Y98.976 I1.656 J-26.975 E2.24675
G1 X128.331 Y98.976 E.01793
G3 X127.709 Y153.023 I-.331 J27.023 E2.29954
G1 X127.664 Y152.608 F30000
G1 F9000
G1 X126.369 Y152.559 E.03512
G3 X127.674 Y99.391 I1.631 J-26.56 E2.21218
G1 X128.326 Y99.391 E.01767
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.724 Y152.607 I-.326 J26.608 E2.26387
M204 S250
G1 X127.679 Y152.206 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.742 Y152.105 E-.24836
; WIPE_END
G1 E-.04 F1800
G1 X128.351 Y154.619 Z9.56 F30000
G1 Z9.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P97 R1
G1 F9000
G3 X126.946 Y97.396 I-.359 J-28.62 E2.41793
G3 X129.001 Y97.394 I1.048 J31.783 E.05571
G3 X128.411 Y154.618 I-1.009 J28.605 E2.39786
G1 X128.356 Y155.035 F30000
G1 F9000
G3 X126.93 Y96.98 I-.364 J-29.036 E2.45305
G3 X129.016 Y96.979 I1.063 J32.244 E.05653
G3 X128.416 Y155.034 I-1.025 J29.02 E2.43269
M204 S250
G1 X128.362 Y155.438 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.361 Y155.435 E.00006
G3 X126.916 Y96.58 I-.369 J-29.436 E2.30742
G3 X129.031 Y96.579 I1.078 J32.718 E.05317
G3 X129.805 Y155.382 I-1.039 J29.42 E2.25345
G1 X128.422 Y155.435 E.0348
; WIPE_START
M204 S10000
G1 X128.361 Y155.435 E-.023
G1 X126.916 Y155.42 E-.54905
G1 X126.423 Y155.39 E-.18796
; WIPE_END
G1 E-.04 F1800
G1 X128.331 Y153.425 Z9.56 F30000
G1 Z9.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419996
G1 F11668.309
G3 X129.681 Y153.376 I-.329 J-27.421 E4.29795
G1 X128.391 Y153.423 E.03245
; WIPE_START
G1 X129.681 Y153.376 E-.49045
G1 X130.388 Y153.315 E-.26955
; WIPE_END
G1 E-.04 F1800
G1 X130.201 Y145.685 Z9.56 F30000
G1 X129.038 Y98.196 Z9.56
G1 Z9.16
G1 E.8 F1800
; LINE_WIDTH: 0.444152
G1 F10980.553
G2 X134.415 Y98.925 I-1.033 J27.801 E4.52471
G2 X129.098 Y98.199 I-6.636 J28.776 E.14356
G1 X128.987 Y97.795 F30000
; LINE_WIDTH: 0.419996
G1 F11668.309
G2 X131.798 Y98.034 I-.98 J28.201 E4.38659
G2 X129.047 Y97.799 I-3.707 J27.153 E.06945
; CHANGE_LAYER
; Z_HEIGHT: 9.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.309
G1 X130.422 Y97.881 E-.52362
G1 X131.041 Y97.95 E-.23638
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/58
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z9.56 I-1.215 J-.075 P1  F30000
G1 X127.679 Y152.206 Z9.56
G1 Z9.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G3 X127.678 Y99.792 I.321 J-26.207 E2.05394
G1 X128.321 Y99.792 E.01616
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
G3 X127.739 Y152.207 I-.321 J26.207 E2.06857
; WIPE_START
M204 S10000
G1 X126.393 Y152.161 E-.51164
G1 X125.742 Y152.105 E-.24836
; WIPE_END
G1 E-.04 F1800
G1 X128.361 Y155.429 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X127.639 Y155.436 E.01816
G3 X127.639 Y96.562 I.354 J-29.437 E2.30739
G3 X129.057 Y96.579 I.361 J28.897 E.03566
G3 X129.084 Y155.418 I-1.063 J29.42 E2.27107
G1 X128.421 Y155.428 E.01666
; WIPE_START
M204 S10000
G1 X127.639 Y155.436 E-.29725
G1 X126.422 Y155.393 E-.46275
; WIPE_END
G1 E-.04 F1800
G1 X133.248 Y151.978 Z9.72 F30000
G1 X152.074 Y142.558 Z9.72
G1 Z9.32
G1 E.8 F1800
; FEATURE: Top surface
G1 F11668.197
M204 S2000
G1 X144.525 Y150.107 E.26841
; WIPE_START
M204 S10000
G1 X145.94 Y148.693 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.024 Y151.063 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X153.063 Y141.024 E.35692
; WIPE_START
M204 S10000
G1 X151.649 Y142.439 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.775 Y139.766 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X141.767 Y151.775 E.42696
G1 X140.654 Y152.342
G1 X154.333 Y138.664 E.48633
G1 X154.793 Y137.658
G1 X139.648 Y152.803 E.53849
G1 X138.726 Y153.179
G1 X155.189 Y136.717 E.58533
G1 X155.511 Y135.849
G1 X146.958 Y144.402 E.30411
; WIPE_START
M204 S10000
G1 X148.372 Y142.988 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.583 Y141.232 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X155.792 Y135.023 E.22075
M73 P97 R0
G1 X156.045 Y134.225
G1 X150.608 Y139.661 E.19328
; WIPE_START
M204 S10000
G1 X152.023 Y138.247 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.328 Y138.396 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X156.246 Y133.478 E.17484
G1 X156.44 Y132.739
G1 X151.876 Y137.303 E.16228
G1 X152.316 Y136.317
G1 X156.586 Y132.047 E.15183
G1 X156.733 Y131.355
G1 X152.685 Y135.403 E.14393
G1 X153.003 Y134.54
G1 X156.838 Y130.705 E.13636
G1 X156.942 Y130.055
G1 X153.256 Y133.741 E.13109
G1 X153.478 Y132.973
G1 X157.017 Y129.434 E.12582
G1 X157.085 Y128.821
G1 X153.674 Y132.233 E.1213
G1 X153.828 Y131.532
G1 X157.137 Y128.223 E.11765
G1 X157.173 Y127.642
G1 X153.975 Y130.84 E.11372
G1 X154.08 Y130.19
G1 X157.208 Y127.062 E.11123
G1 X157.215 Y126.51
G1 X154.183 Y129.541 E.10779
G1 X154.251 Y128.928
G1 X157.222 Y125.957 E.10561
G1 X157.217 Y125.416
G1 X154.32 Y128.314 E.10303
G1 X154.358 Y127.731
G1 X157.198 Y124.89 E.10098
G1 X157.179 Y124.364
G1 X154.393 Y127.149 E.09903
G1 X154.409 Y126.589
G1 X157.142 Y123.855 E.09719
G1 X157.099 Y123.353
G1 X154.416 Y126.036 E.09541
G1 X154.413 Y125.493
G1 X157.056 Y122.851 E.09395
G1 X156.994 Y122.367
G1 X154.394 Y124.967 E.09244
G1 X154.375 Y124.441
G1 X156.929 Y121.887 E.09081
G1 X156.863 Y121.407
G1 X154.334 Y123.936 E.08993
G1 X154.291 Y123.434
G1 X156.78 Y120.945 E.0885
G1 X156.694 Y120.485
G1 X154.241 Y122.939 E.08723
G1 X154.176 Y122.459
G1 X156.609 Y120.026 E.08651
G1 X156.507 Y119.581
G1 X154.111 Y121.978 E.08522
G1 X154.032 Y121.511
G1 X156.403 Y119.141 E.08428
G1 X156.298 Y118.7
M73 P98 R0
G1 X153.947 Y121.051 E.0836
G1 X153.861 Y120.591
G1 X156.182 Y118.271 E.0825
G1 X156.059 Y117.848
G1 X153.759 Y120.148 E.08177
G1 X153.654 Y119.707
G1 X155.936 Y117.426 E.08113
G1 X155.807 Y117.01
G1 X153.55 Y119.267 E.08025
G1 X153.427 Y118.844
G1 X155.667 Y116.604 E.07964
G1 X155.528 Y116.198
G1 X153.305 Y118.421 E.07904
G1 X153.181 Y117.999
G1 X155.387 Y115.793 E.07843
G1 X155.231 Y115.404
G1 X153.042 Y117.593 E.07786
G1 X152.902 Y117.187
G1 X155.075 Y115.014 E.07728
G1 X154.92 Y114.624
G1 X152.762 Y116.782 E.07672
G1 X152.606 Y116.393
G1 X154.754 Y114.245 E.07637
G1 X154.583 Y113.871
G1 X152.45 Y116.003 E.07582
G1 X152.294 Y115.613
G1 X154.411 Y113.497 E.07526
G1 X154.238 Y113.125
G1 X152.124 Y115.238 E.07515
G1 X151.953 Y114.864
G1 X154.051 Y112.766 E.07462
G1 X153.865 Y112.407
G1 X151.781 Y114.49 E.07408
G1 X151.598 Y114.128
G1 X153.679 Y112.048 E.07397
G1 X153.483 Y111.697
G1 X151.412 Y113.769 E.07366
G1 X151.226 Y113.41
G1 X153.283 Y111.353 E.07314
G1 X153.082 Y111.008
G1 X151.031 Y113.059 E.07292
G1 X150.83 Y112.715
G1 X152.881 Y110.664 E.07292
G1 X152.666 Y110.333
G1 X150.629 Y112.37 E.07242
G1 X150.424 Y112.03
G1 X152.451 Y110.003 E.07208
G1 X152.236 Y109.672
G1 X150.209 Y111.7 E.07208
G1 X149.994 Y111.369
G1 X152.016 Y109.347 E.0719
G1 X151.787 Y109.031
G1 X149.778 Y111.039 E.07142
G1 X149.549 Y110.723
G1 X151.558 Y108.714 E.07142
G1 X151.329 Y108.397
G1 X149.321 Y110.406 E.07142
G1 X149.092 Y110.09
G1 X151.091 Y108.09 E.07108
G1 X150.848 Y107.787
G1 X148.853 Y109.783 E.07095
G1 X148.611 Y109.48
G1 X150.606 Y107.484 E.07095
G1 X150.364 Y107.182
G1 X148.368 Y109.177 E.07095
G1 X148.121 Y108.879
G1 X150.108 Y106.892 E.07065
G1 X149.852 Y106.603
G1 X147.865 Y108.59 E.07065
G1 X147.609 Y108.3
G1 X149.596 Y106.313 E.07065
G1 X149.336 Y106.028
G1 X147.352 Y108.011 E.07052
G1 X147.083 Y107.735
G1 X149.067 Y105.752 E.07052
G1 X148.797 Y105.475
G1 X146.814 Y107.459 E.07052
G1 X146.544 Y107.183
G1 X148.528 Y105.199 E.07052
G1 X148.251 Y104.931
G1 X146.266 Y106.916 E.07056
G1 X145.983 Y106.653
G1 X147.968 Y104.668 E.07056
G1 X147.685 Y104.406
G1 X145.701 Y106.39 E.07056
G1 X145.414 Y106.132
G1 X147.403 Y104.143 E.07071
G1 X147.108 Y103.892
G1 X145.118 Y105.882 E.07078
G1 X144.822 Y105.633
G1 X146.812 Y103.643 E.07078
G1 X146.516 Y103.393
G1 X144.525 Y105.384 E.07078
G1 X144.216 Y105.148
G1 X146.218 Y103.146 E.07116
G1 X145.908 Y102.911
G1 X143.907 Y104.912 E.07116
G1 X143.597 Y104.676
G1 X145.598 Y102.675 E.07116
G1 X145.289 Y102.439
G1 X143.279 Y104.449 E.07146
G1 X142.955 Y104.227
G1 X144.973 Y102.21 E.07173
G1 X144.649 Y101.988
G1 X142.632 Y104.005 E.07173
G1 X142.304 Y103.788
G1 X144.326 Y101.766 E.07188
G1 X144.002 Y101.544
G1 X141.966 Y103.58 E.07238
G1 X141.629 Y103.372
G1 X143.667 Y101.333 E.07248
G1 X143.33 Y101.125
G1 X141.291 Y103.164 E.0725
G1 X140.939 Y102.971
G1 X142.992 Y100.917 E.07301
G1 X142.652 Y100.712
G1 X140.587 Y102.777 E.07342
G1 X140.236 Y102.584
G1 X142.301 Y100.519 E.07342
G1 X141.949 Y100.325
G1 X139.872 Y102.402 E.07384
G1 X139.505 Y102.223
G1 X141.597 Y100.131 E.07437
G1 X141.236 Y99.947
G1 X139.139 Y102.044 E.07457
G1 X138.763 Y101.875
G1 X140.87 Y99.768 E.07491
G1 X140.503 Y99.589
G1 X138.381 Y101.711 E.07546
G1 X137.999 Y101.547
G1 X140.135 Y99.412 E.07595
G1 X139.753 Y99.248
G1 X137.609 Y101.392 E.07623
G1 X137.212 Y101.244
G1 X139.372 Y99.084 E.07679
G1 X138.99 Y98.921
G1 X136.814 Y101.096 E.07736
G1 X136.409 Y100.956
G1 X138.598 Y98.767 E.07783
G1 X138.2 Y98.619
G1 X135.995 Y100.825 E.07842
G1 X135.581 Y100.694
G1 X137.803 Y98.471 E.079
G1 X137.401 Y98.328
G1 X135.158 Y100.57 E.07973
G1 X134.727 Y100.457
G1 X136.987 Y98.197 E.08035
G1 X136.572 Y98.066
G1 X134.295 Y100.343 E.08097
G1 X133.853 Y100.239
G1 X136.158 Y97.934 E.08196
G1 X135.727 Y97.82
G1 X133.403 Y100.144 E.08264
G1 X132.953 Y100.049
G1 X135.296 Y97.706 E.0833
G1 X134.864 Y97.592
G1 X132.488 Y99.968 E.08448
G1 X132.018 Y99.893
G1 X134.419 Y97.492 E.08535
G1 X133.969 Y97.397
G1 X131.548 Y99.817 E.08606
G1 X131.057 Y99.763
G1 X133.518 Y97.302 E.08751
G1 X133.056 Y97.219
G1 X130.566 Y99.708 E.08852
G1 X130.066 Y99.663
G1 X132.586 Y97.143 E.08959
G1 X132.116 Y97.068
G1 X129.553 Y99.631 E.09116
G1 X129.039 Y99.6
G1 X131.634 Y97.005 E.09226
G1 X131.143 Y96.95
G1 X128.503 Y99.59 E.09385
G1 X127.964 Y99.583
G1 X130.652 Y96.896 E.09555
G1 X130.144 Y96.858
G1 X127.413 Y99.589 E.09712
G1 X126.847 Y99.61
G1 X129.63 Y96.827 E.09898
G1 X129.116 Y96.795
G1 X126.275 Y99.637 E.10102
G1 X125.678 Y99.688
G1 X128.58 Y96.786 E.10319
G1 X128.042 Y96.779
G1 X125.081 Y99.74 E.10526
G1 X124.45 Y99.825
G1 X127.496 Y96.78 E.10829
G1 X126.929 Y96.801
G1 X123.819 Y99.911 E.1106
G1 X123.15 Y100.035
G1 X126.363 Y96.821 E.11425
G1 X125.775 Y96.864
G1 X122.476 Y100.163 E.11728
G1 X121.761 Y100.333
G1 X125.178 Y96.916 E.12149
G1 X124.57 Y96.979
G1 X121.029 Y100.519 E.12588
G1 X120.261 Y100.742
G1 X123.939 Y97.064 E.13075
G1 X123.304 Y97.153
G1 X119.45 Y101.008 E.13706
G1 X118.602 Y101.31
G1 X122.634 Y97.278 E.14337
G1 X121.964 Y97.403
G1 X117.693 Y101.674 E.15186
G1 X116.698 Y102.124
G1 X121.25 Y97.571 E.16186
G1 X120.533 Y97.742
G1 X115.6 Y102.676 E.1754
; WIPE_START
M204 S10000
G1 X117.014 Y101.261 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.345 Y103.385 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X119.765 Y97.965 E.19271
G1 X118.983 Y98.202
G1 X112.765 Y104.42 E.22107
; WIPE_START
M204 S10000
G1 X114.179 Y103.006 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.231 Y107.409 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X118.151 Y98.489 E.31717
; WIPE_START
M204 S10000
G1 X116.737 Y99.903 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.993 Y106.238 Z9.72 F30000
G1 X146.764 Y144.597 Z9.72
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X137.849 Y153.512 E.31697
G1 X137.017 Y153.798
G1 X143.235 Y147.58 E.22106
; WIPE_START
M204 S10000
G1 X141.82 Y148.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.654 Y148.615 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X136.235 Y154.035 E.19271
G1 X135.466 Y154.258
G1 X140.399 Y149.325 E.1754
G1 X139.302 Y149.876
G1 X134.75 Y154.429 E.16186
G1 X134.036 Y154.597
G1 X138.307 Y150.326 E.15186
G1 X137.398 Y150.69
G1 X133.366 Y154.722 E.14337
G1 X132.695 Y154.847
G1 X136.55 Y150.992 E.13706
G1 X135.739 Y151.258
G1 X132.061 Y154.936 E.13075
G1 X131.43 Y155.021
G1 X134.97 Y151.481 E.12588
G1 X134.239 Y151.667
G1 X130.822 Y155.084 E.12149
G1 X130.225 Y155.136
G1 X133.524 Y151.837 E.11728
G1 X132.85 Y151.965
G1 X129.637 Y155.179 E.11425
G1 X129.071 Y155.199
G1 X132.181 Y152.089 E.11059
G1 X131.55 Y152.175
G1 X128.504 Y155.22 E.10829
G1 X127.958 Y155.221
G1 X130.919 Y152.26 E.10526
G1 X130.322 Y152.312
G1 X127.42 Y155.214 E.10318
G1 X126.883 Y155.205
G1 X129.725 Y152.363 E.10105
G1 X129.153 Y152.39
G1 X126.369 Y155.174 E.09899
G1 X125.855 Y155.142
G1 X128.587 Y152.411 E.09713
G1 X128.035 Y152.417
G1 X125.348 Y155.104 E.09555
G1 X124.857 Y155.05
G1 X127.497 Y152.41 E.09385
G1 X126.961 Y152.4
G1 X124.366 Y154.995 E.09226
G1 X123.883 Y154.932
G1 X126.447 Y152.369 E.09116
G1 X125.933 Y152.337
G1 X123.414 Y154.857 E.08959
G1 X122.944 Y154.781
G1 X125.433 Y152.292 E.08852
G1 X124.943 Y152.237
G1 X122.481 Y154.698 E.08751
G1 X122.031 Y154.603
G1 X124.452 Y152.183 E.08606
G1 X123.981 Y152.107
G1 X121.581 Y154.508 E.08534
G1 X121.136 Y154.408
G1 X123.512 Y152.032 E.08448
G1 X123.047 Y151.951
G1 X120.704 Y154.294 E.0833
G1 X120.272 Y154.18
G1 X122.597 Y151.856 E.08264
G1 X122.147 Y151.761
G1 X119.842 Y154.066 E.08196
G1 X119.427 Y153.934
G1 X121.705 Y151.657 E.08097
G1 X121.273 Y151.543
G1 X119.013 Y153.803 E.08035
G1 X118.599 Y153.672
G1 X120.841 Y151.43 E.07973
G1 X120.419 Y151.306
G1 X118.197 Y153.528 E.079
G1 X117.8 Y153.381
G1 X120.005 Y151.175 E.07842
G1 X119.591 Y151.044
G1 X117.402 Y153.233 E.07783
G1 X117.01 Y153.079
G1 X119.186 Y150.904 E.07736
G1 X118.788 Y150.756
G1 X116.628 Y152.916 E.07679
G1 X116.246 Y152.752
G1 X118.39 Y150.608 E.07623
G1 X118.001 Y150.452
G1 X115.865 Y152.588 E.07595
G1 X115.497 Y152.411
G1 X117.619 Y150.289 E.07545
G1 X117.237 Y150.125
G1 X115.13 Y152.232 E.07491
G1 X114.764 Y152.053
G1 X116.861 Y149.956 E.07457
G1 X116.495 Y149.777
G1 X114.403 Y151.869 E.07437
G1 X114.051 Y151.675
G1 X116.128 Y149.598 E.07385
G1 X115.764 Y149.416
G1 X113.699 Y151.481 E.07342
G1 X113.348 Y151.288
G1 X115.413 Y149.223 E.07342
G1 X115.061 Y149.029
G1 X113.007 Y151.082 E.07301
G1 X112.67 Y150.875
G1 X114.709 Y148.836 E.0725
G1 X114.371 Y148.628
G1 X112.333 Y150.667 E.07248
G1 X111.998 Y150.456
G1 X114.033 Y148.42 E.07238
G1 X113.696 Y148.212
G1 X111.674 Y150.234 E.07188
G1 X111.351 Y150.012
G1 X113.368 Y147.995 E.07173
G1 X113.045 Y147.773
G1 X111.027 Y149.79 E.07173
G1 X110.711 Y149.561
G1 X112.721 Y147.551 E.07146
G1 X112.403 Y147.324
G1 X110.402 Y149.325 E.07116
G1 X110.092 Y149.089
G1 X112.093 Y147.088 E.07116
G1 X111.784 Y146.852
G1 X109.782 Y148.854 E.07116
G1 X109.484 Y148.607
G1 X111.475 Y146.616 E.07078
G1 X111.178 Y146.367
G1 X109.188 Y148.357 E.07078
G1 X108.892 Y148.108
G1 X110.882 Y146.117 E.07078
G1 X110.586 Y145.868
G1 X108.597 Y147.857 E.07071
G1 X108.315 Y147.594
G1 X110.299 Y145.61 E.07056
G1 X110.016 Y145.347
G1 X108.032 Y147.332 E.07056
G1 X107.749 Y147.069
G1 X109.734 Y145.084 E.07056
G1 X109.456 Y144.817
G1 X107.472 Y146.8 E.07052
G1 X107.203 Y146.524
G1 X109.186 Y144.541 E.07052
G1 X108.917 Y144.265
G1 X106.933 Y146.248 E.07052
G1 X106.664 Y145.972
G1 X108.647 Y143.989 E.07052
G1 X108.391 Y143.7
G1 X106.404 Y145.687 E.07065
G1 X106.148 Y145.397
G1 X108.135 Y143.41 E.07065
G1 X107.879 Y143.121
G1 X105.892 Y145.108 E.07065
G1 X105.636 Y144.818
G1 X107.632 Y142.823 E.07095
G1 X107.389 Y142.52
G1 X105.394 Y144.515 E.07095
G1 X105.151 Y144.213
G1 X107.147 Y142.217 E.07095
G1 X106.908 Y141.91
G1 X104.909 Y143.91 E.07108
G1 X104.671 Y143.603
G1 X106.679 Y141.594 E.07142
G1 X106.451 Y141.277
G1 X104.442 Y143.286 E.07142
G1 X104.213 Y142.969
G1 X106.222 Y140.961 E.07142
G1 X106.006 Y140.631
G1 X103.984 Y142.653 E.0719
G1 X103.764 Y142.328
G1 X105.791 Y140.3 E.07208
G1 X105.576 Y139.97
G1 X103.549 Y141.997 E.07208
G1 X103.334 Y141.667
G1 X105.371 Y139.63 E.07242
G1 X105.17 Y139.285
G1 X103.119 Y141.336 E.07292
G1 X102.918 Y140.992
G1 X104.969 Y138.941 E.07292
G1 X104.774 Y138.59
G1 X102.717 Y140.647 E.07314
G1 X102.516 Y140.303
G1 X104.588 Y138.231 E.07366
G1 X104.402 Y137.872
G1 X102.321 Y139.952 E.07397
G1 X102.135 Y139.593
G1 X104.219 Y137.51 E.07408
G1 X104.047 Y137.136
G1 X101.949 Y139.234 E.07462
G1 X101.762 Y138.875
G1 X103.876 Y136.762 E.07515
G1 X103.706 Y136.387
G1 X101.589 Y138.503 E.07526
G1 X101.417 Y138.129
G1 X103.55 Y135.997 E.07582
G1 X103.394 Y135.607
G1 X101.246 Y137.755 E.07637
G1 X101.08 Y137.376
G1 X103.238 Y135.218 E.07672
G1 X103.098 Y134.812
G1 X100.925 Y136.986 E.07728
G1 X100.769 Y136.596
G1 X102.958 Y134.407 E.07786
G1 X102.819 Y134.001
G1 X100.613 Y136.207 E.07843
G1 X100.472 Y135.802
G1 X102.695 Y133.579 E.07904
G1 X102.573 Y133.156
G1 X100.333 Y135.396 E.07964
G1 X100.193 Y134.99
G1 X102.45 Y132.733 E.08025
G1 X102.345 Y132.293
G1 X100.064 Y134.574 E.08113
G1 X99.941 Y134.152
G1 X102.241 Y131.852 E.08177
G1 X102.139 Y131.408
G1 X99.818 Y133.729 E.0825
G1 X99.702 Y133.3
G1 X102.053 Y130.949 E.0836
G1 X101.968 Y130.489
G1 X99.597 Y132.859 E.08428
G1 X99.493 Y132.418
G1 X101.889 Y130.022 E.08522
G1 X101.824 Y129.541
G1 X99.391 Y131.974 E.08651
G1 X99.306 Y131.515
G1 X101.759 Y129.061 E.08723
G1 X101.709 Y128.566
G1 X99.22 Y131.055 E.0885
G1 X99.137 Y130.593
G1 X101.666 Y128.064 E.08993
G1 X101.625 Y127.559
G1 X99.071 Y130.113 E.09081
G1 X99.006 Y129.632
G1 X101.606 Y127.033 E.09244
G1 X101.586 Y126.507
G1 X98.944 Y129.149 E.09395
G1 X98.901 Y128.647
G1 X101.584 Y125.964 E.09541
G1 X101.591 Y125.411
G1 X98.858 Y128.145 E.09719
G1 X98.821 Y127.636
G1 X101.607 Y124.85 E.09903
G1 X101.642 Y124.269
G1 X98.802 Y127.109 E.10099
G1 X98.783 Y126.583
G1 X101.68 Y123.686 E.10303
G1 X101.749 Y123.072
G1 X98.778 Y126.042 E.10561
G1 X98.785 Y125.49
G1 X101.817 Y122.459 E.10779
G1 X101.92 Y121.81
G1 X98.792 Y124.938 E.11123
G1 X98.827 Y124.358
G1 X102.025 Y121.159 E.11372
G1 X102.172 Y120.468
G1 X98.863 Y123.777 E.11765
G1 X98.915 Y123.179
G1 X102.326 Y119.767 E.1213
G1 X102.522 Y119.027
G1 X98.983 Y122.566 E.12583
G1 X99.058 Y121.945
G1 X102.744 Y118.258 E.13109
G1 X102.997 Y117.46
G1 X99.162 Y121.295 E.13636
G1 X99.267 Y120.645
G1 X103.315 Y116.597 E.14393
G1 X103.684 Y115.683
G1 X99.414 Y119.953 E.15183
G1 X99.56 Y119.261
G1 X104.124 Y114.697 E.16228
G1 X104.672 Y113.604
G1 X99.754 Y118.522 E.17485
G1 X99.955 Y117.775
G1 X105.392 Y112.339 E.19329
; WIPE_START
M204 S10000
G1 X103.978 Y113.753 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.417 Y110.768 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X100.208 Y116.977 E.22076
G1 X100.489 Y116.151
G1 X109.044 Y107.596 E.30418
; WIPE_START
M204 S10000
G1 X107.63 Y109.01 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.013 Y114.178 Z9.72 F30000
G1 X100.811 Y115.283 Z9.72
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X117.273 Y98.821 E.58531
G1 X116.352 Y99.197
G1 X101.207 Y114.342 E.53847
G1 X101.667 Y113.336
G1 X115.345 Y99.658 E.48632
G1 X114.233 Y100.225
G1 X102.225 Y112.233 E.42694
; WIPE_START
M204 S10000
G1 X103.639 Y110.819 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.937 Y110.975 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X112.975 Y100.937 E.3569
; WIPE_START
M204 S10000
G1 X111.561 Y102.351 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.474 Y101.893 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X103.926 Y109.441 E.26838
M204 S10000
G1 X103.988 Y109.503 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.207408
G1 F18000
G1 X103.83 Y109.692 E.00278
; LINE_WIDTH: 0.168093
G1 X103.673 Y109.882 E.00215
; LINE_WIDTH: 0.128777
G1 X103.516 Y110.071 E.00152
; LINE_WIDTH: 0.094867
G1 X103.425 Y110.185 E.00057
G1 X103 Y111.037 F30000
; LINE_WIDTH: 0.207566
G1 F18000
G1 X102.893 Y111.172 E.00193
; LINE_WIDTH: 0.178692
M73 P99 R0
G1 X102.787 Y111.306 E.00161
; LINE_WIDTH: 0.143339
G1 X102.691 Y111.434 E.00114
; LINE_WIDTH: 0.101527
G1 X102.595 Y111.562 E.0007
G1 X102.287 Y112.296 F30000
; LINE_WIDTH: 0.200366
G1 F18000
G1 X102.189 Y112.427 E.00177
; LINE_WIDTH: 0.167272
G1 X102.091 Y112.558 E.00142
; LINE_WIDTH: 0.133205
G1 X102.022 Y112.654 E.00076
; LINE_WIDTH: 0.0981454
G1 X101.954 Y112.749 E.00049
; WIPE_START
G1 X102.022 Y112.654 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.271 Y114.405 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.185699
G1 F18000
G1 X101.188 Y114.528 E.00146
; LINE_WIDTH: 0.143666
G1 X101.105 Y114.651 E.00106
; LINE_WIDTH: 0.101634
G1 X101.021 Y114.773 E.00065
; WIPE_START
G1 X101.105 Y114.651 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.398 Y122.25 Z9.72 F30000
G1 X99.478 Y132.16 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.0912297
G1 F18000
G1 X99.393 Y131.999 E.00068
; WIPE_START
G1 X99.478 Y132.16 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.566 Y133.124 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.0818042
G1 F18000
G3 X102.552 Y133.017 I.084 J-.065 E.00035
; WIPE_START
G1 X102.566 Y133.124 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.598 Y126.222 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.119905
G1 F18000
G1 X101.512 Y126.432 E.00127
; WIPE_START
G1 X101.598 Y126.222 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.737 Y118.675 Z9.72 F30000
G1 X102.955 Y117.23 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.117892
G1 F18000
G1 X103.012 Y117.474 E.00137
; WIPE_START
G1 X102.955 Y117.23 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.869 Y115.251 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.101637
G1 F18000
G1 X103.786 Y115.374 E.00065
; LINE_WIDTH: 0.143674
G1 X103.703 Y115.497 E.00106
; LINE_WIDTH: 0.185711
G1 X103.62 Y115.619 E.00146
; WIPE_START
G1 X103.703 Y115.497 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.97 Y113.062 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.103332
G1 F18000
G1 X104.849 Y113.222 E.0009
; LINE_WIDTH: 0.148758
G1 X104.729 Y113.382 E.00149
; LINE_WIDTH: 0.194184
G1 X104.609 Y113.541 E.00208
; WIPE_START
G1 X104.729 Y113.382 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.779 Y111.707 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.104178
G1 F18000
G1 X105.629 Y111.897 E.0011
; LINE_WIDTH: 0.151308
G1 X105.479 Y112.087 E.00184
; LINE_WIDTH: 0.198438
G1 X105.33 Y112.277 E.00259
; WIPE_START
G1 X105.479 Y112.087 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.098 Y109.845 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.0992372
G1 F18000
G1 X106.912 Y110.058 E.0012
; LINE_WIDTH: 0.136481
G1 X106.725 Y110.272 E.00189
; LINE_WIDTH: 0.173981
G1 X106.536 Y110.489 E.00262
; LINE_WIDTH: 0.210029
G1 X106.355 Y110.706 E.00323
; WIPE_START
G1 X106.536 Y110.489 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.949 Y105.108 Z9.72 F30000
G1 X112.703 Y104.358 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.207511
G1 F18000
G1 X112.467 Y104.56 E.0035
; LINE_WIDTH: 0.16325
G1 X112.231 Y104.761 E.00261
; LINE_WIDTH: 0.118879
G1 X111.993 Y104.963 E.00172
; LINE_WIDTH: 0.0886342
G1 X111.868 Y105.076 E.0006
; WIPE_START
G1 X111.993 Y104.963 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.283 Y103.323 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.203276
G1 F18000
G1 X114.108 Y103.458 E.00243
; LINE_WIDTH: 0.169064
G1 X113.97 Y103.57 E.00156
; LINE_WIDTH: 0.133683
G1 X113.832 Y103.681 E.00115
; LINE_WIDTH: 0.0983007
G1 X113.694 Y103.793 E.00074
; WIPE_START
G1 X113.832 Y103.681 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.537 Y102.613 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.193765
G1 F18000
G1 X115.392 Y102.719 E.00188
; LINE_WIDTH: 0.152267
G1 X115.244 Y102.827 E.00141
; LINE_WIDTH: 0.118596
G1 X115.157 Y102.895 E.0006
; LINE_WIDTH: 0.0932715
G1 X115.07 Y102.962 E.00042
; WIPE_START
G1 X115.157 Y102.895 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.634 Y102.06 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.191635
G1 F18000
G1 X116.516 Y102.143 E.00148
; LINE_WIDTH: 0.156007
G1 X116.395 Y102.226 E.00116
; LINE_WIDTH: 0.123511
G1 X116.311 Y102.289 E.00061
; LINE_WIDTH: 0.0949188
G1 X116.226 Y102.351 E.00042
; WIPE_START
G1 X116.311 Y102.289 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.194 Y100.675 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.128544
G1 F18000
G1 X119.901 Y100.852 E.0021
; WIPE_START
G1 X120.194 Y100.675 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.773 Y99.771 Z9.72 F30000
G1 X129.057 Y99.618 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.101347
G1 F18000
G1 X128.841 Y99.525 E.00102
; WIPE_START
G1 X129.057 Y99.618 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.425 Y99.521 Z9.72 F30000
G1 X115.799 Y99.45 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.102056
G1 F18000
G1 X115.669 Y99.54 E.0007
; LINE_WIDTH: 0.144949
G1 X115.539 Y99.631 E.00114
; LINE_WIDTH: 0.187843
G1 X115.409 Y99.721 E.00159
; WIPE_START
G1 X115.539 Y99.631 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.558 Y100.599 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.103748
G1 F18000
G1 X113.385 Y100.732 E.00099
; LINE_WIDTH: 0.150027
G1 X113.211 Y100.866 E.00165
; LINE_WIDTH: 0.196305
G1 X113.038 Y101 E.00231
G1 X112.165 Y101.445 F30000
; LINE_WIDTH: 0.104598
G1 F18000
G1 X111.956 Y101.615 E.00124
; LINE_WIDTH: 0.152576
G1 X111.746 Y101.785 E.00208
; LINE_WIDTH: 0.200554
G1 X111.536 Y101.955 E.00293
; WIPE_START
G1 X111.746 Y101.785 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.375 Y102.689 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.085794
G1 F18000
G1 X110.308 Y102.747 E.0003
; LINE_WIDTH: 0.110761
G1 X110.04 Y102.986 E.00179
; LINE_WIDTH: 0.150361
G1 X109.773 Y103.225 E.00271
; LINE_WIDTH: 0.189961
G1 X109.506 Y103.464 E.00364
; LINE_WIDTH: 0.229561
G1 X109.239 Y103.704 E.00457
; LINE_WIDTH: 0.271272
G1 X108.718 Y104.193 E.01104
; LINE_WIDTH: 0.315114
G1 F16026.898
G1 X108.197 Y104.683 E.01308
; LINE_WIDTH: 0.337022
G1 F14866.902
G2 X106.19 Y106.715 I40.393 J41.907 E.05636
; LINE_WIDTH: 0.281462
G1 F18000
G1 X105.867 Y107.067 E.00769
; LINE_WIDTH: 0.240455
G1 X105.545 Y107.418 E.00641
; LINE_WIDTH: 0.199448
G1 X105.222 Y107.77 E.00514
; LINE_WIDTH: 0.15437
G1 X104.975 Y108.053 E.00294
; LINE_WIDTH: 0.1052
G1 X104.727 Y108.337 E.00174
; WIPE_START
G1 X104.975 Y108.053 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X112.471 Y109.486 Z9.72 F30000
G1 X156.052 Y117.817 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.0942529
G1 F18000
G3 X156.023 Y117.656 I.122 J-.104 E.00067
; WIPE_START
G1 X156.023 Y117.768 E-.50738
G1 X156.052 Y117.817 E-.25262
; WIPE_END
G1 E-.04 F1800
G1 X156.864 Y121.385 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.0830733
G1 F18000
G1 X156.781 Y121.217 E.0006
; WIPE_START
G1 X156.864 Y121.385 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.187 Y125.386 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.1204
G1 F18000
G1 X157.187 Y125.174 E.00119
; WIPE_START
G1 X157.187 Y125.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.04 Y132.932 Z9.72 F30000
G1 X155.656 Y135.457 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.0883651
G1 F18000
G1 X155.453 Y135.791 E.00138
; WIPE_START
G1 X155.656 Y135.457 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.979 Y137.226 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.101637
G1 F18000
G1 X154.896 Y137.349 E.00065
; LINE_WIDTH: 0.143674
G1 X154.812 Y137.472 E.00106
; LINE_WIDTH: 0.185711
G1 X154.729 Y137.594 E.00146
; WIPE_START
G1 X154.812 Y137.472 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.046 Y139.25 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.0981709
G1 F18000
G1 X153.978 Y139.346 E.00049
; LINE_WIDTH: 0.133279
G1 X153.909 Y139.442 E.00076
; LINE_WIDTH: 0.167348
G1 X153.811 Y139.573 E.00142
; LINE_WIDTH: 0.200382
G1 X153.713 Y139.704 E.00177
G1 X153.405 Y140.437 F30000
; LINE_WIDTH: 0.101573
G1 F18000
G1 X153.309 Y140.566 E.0007
; LINE_WIDTH: 0.143477
G1 X153.213 Y140.694 E.00114
; LINE_WIDTH: 0.17881
G1 X153.107 Y140.828 E.00161
; LINE_WIDTH: 0.207595
G1 X153.001 Y140.962 E.00193
G1 X152.575 Y141.814 F30000
; LINE_WIDTH: 0.094867
G1 F18000
G1 X152.484 Y141.928 E.00057
; LINE_WIDTH: 0.12878
G1 X152.327 Y142.118 E.00152
; LINE_WIDTH: 0.1681
G1 X152.17 Y142.307 E.00215
; LINE_WIDTH: 0.20742
G1 X152.013 Y142.496 E.00278
; WIPE_START
G1 X152.17 Y142.307 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.273 Y143.663 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.105225
G1 F18000
G1 X151.026 Y143.946 E.00174
; LINE_WIDTH: 0.154443
G1 X150.778 Y144.23 E.00295
; LINE_WIDTH: 0.199539
G1 X150.455 Y144.581 E.00514
; LINE_WIDTH: 0.240531
G1 X150.133 Y144.933 E.00641
; LINE_WIDTH: 0.281523
G1 X149.81 Y145.285 E.00769
; LINE_WIDTH: 0.315178
G1 F16023.284
G1 X149.314 Y145.799 E.01308
; LINE_WIDTH: 0.344427
G1 F14511.868
G3 X147.803 Y147.317 I-31.65 J-30.008 E.04331
; LINE_WIDTH: 0.315217
G1 F16021.025
G1 X147.282 Y147.807 E.01309
; LINE_WIDTH: 0.271355
G1 F18000
G1 X146.761 Y148.296 E.01105
; LINE_WIDTH: 0.229636
G1 X146.494 Y148.536 E.00457
; LINE_WIDTH: 0.190043
G1 X146.227 Y148.775 E.00364
; LINE_WIDTH: 0.15045
G1 X145.959 Y149.014 E.00272
; LINE_WIDTH: 0.110857
G1 X145.692 Y149.253 E.00179
; LINE_WIDTH: 0.08583
G1 X145.625 Y149.311 E.0003
; WIPE_START
G1 X145.692 Y149.253 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.087 Y142.417 Z9.72 F30000
G1 X149.645 Y141.294 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.209743
G1 F18000
G1 X149.462 Y141.514 E.00328
; LINE_WIDTH: 0.173648
G1 X149.275 Y141.728 E.00258
; LINE_WIDTH: 0.136435
G1 X149.089 Y141.941 E.00189
; LINE_WIDTH: 0.0992225
G1 X148.902 Y142.155 E.0012
; WIPE_START
G1 X149.089 Y141.941 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.671 Y139.723 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.198436
G1 F18000
G1 X150.521 Y139.913 E.00259
; LINE_WIDTH: 0.151307
G1 X150.371 Y140.102 E.00184
; LINE_WIDTH: 0.104178
G1 X150.221 Y140.292 E.0011
; WIPE_START
G1 X150.371 Y140.102 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.391 Y138.458 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.194196
G1 F18000
G1 X151.271 Y138.618 E.00208
; LINE_WIDTH: 0.148766
G1 X151.151 Y138.778 E.00149
; LINE_WIDTH: 0.103336
G1 X151.031 Y138.938 E.0009
; WIPE_START
G1 X151.151 Y138.778 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.939 Y137.366 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.189953
G1 F18000
G1 X151.84 Y137.504 E.00173
; LINE_WIDTH: 0.146218
G1 X151.741 Y137.643 E.00124
; LINE_WIDTH: 0.102484
G1 X151.642 Y137.782 E.00076
; WIPE_START
G1 X151.741 Y137.643 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.902 Y143.545 Z9.72 F30000
G1 X144.131 Y146.925 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.0886292
G1 F18000
G1 X144.006 Y147.038 E.0006
; LINE_WIDTH: 0.11886
G1 X143.769 Y147.239 E.00171
; LINE_WIDTH: 0.163172
G1 X143.533 Y147.44 E.00261
; LINE_WIDTH: 0.207485
G1 X143.296 Y147.642 E.00351
; WIPE_START
G1 X143.533 Y147.44 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.306 Y148.207 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.0982837
G1 F18000
G1 X142.168 Y148.319 E.00074
; LINE_WIDTH: 0.133632
G1 X142.03 Y148.43 E.00115
; LINE_WIDTH: 0.169358
G1 X141.889 Y148.545 E.0016
; LINE_WIDTH: 0.203502
G1 X141.717 Y148.677 E.0024
G1 X140.93 Y149.038 F30000
; LINE_WIDTH: 0.0932201
G1 F18000
G1 X140.843 Y149.105 E.00042
; LINE_WIDTH: 0.11872
G1 X140.754 Y149.174 E.00062
; LINE_WIDTH: 0.152393
G1 X140.608 Y149.281 E.00139
; LINE_WIDTH: 0.193713
G1 X140.462 Y149.387 E.00188
; WIPE_START
G1 X140.608 Y149.281 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.75 Y150.129 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.101261
G1 F18000
G1 X138.647 Y150.2 E.00054
; LINE_WIDTH: 0.142563
G1 X138.545 Y150.271 E.00088
; LINE_WIDTH: 0.189403
G1 X138.443 Y150.342 E.00126
G1 X138.294 Y150.314 E.00153
; WIPE_START
G1 X138.443 Y150.342 E-.41749
G1 X138.545 Y150.271 E-.34251
; WIPE_END
G1 E-.04 F1800
G1 X130.955 Y151.077 Z9.72 F30000
G1 X122.781 Y151.944 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.0842742
G1 F18000
G1 X122.623 Y151.859 E.00059
G1 X121.885 Y151.749 F30000
; LINE_WIDTH: 0.086189
G1 F18000
G1 X121.735 Y151.663 E.00059
G1 X121.022 Y151.522 F30000
G1 F18000
G1 X120.871 Y151.435 E.00059
; WIPE_START
G1 X121.022 Y151.522 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.649 Y151.817 Z9.72 F30000
G1 X140.591 Y152.279 Z9.72
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.187822
G1 F18000
G1 X140.461 Y152.369 E.00159
; LINE_WIDTH: 0.144937
G1 X140.331 Y152.46 E.00114
; LINE_WIDTH: 0.102052
G1 X140.201 Y152.55 E.0007
; WIPE_START
G1 X140.331 Y152.46 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.962 Y151.001 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.196309
G1 F18000
G1 X142.789 Y151.134 E.00231
; LINE_WIDTH: 0.150029
G1 X142.615 Y151.268 E.00165
; LINE_WIDTH: 0.103749
G1 X142.442 Y151.401 E.00099
; WIPE_START
G1 X142.615 Y151.268 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.463 Y150.045 Z9.72 F30000
G1 Z9.32
G1 E.8 F1800
; LINE_WIDTH: 0.200555
G1 F18000
G1 X144.254 Y150.215 E.00293
; LINE_WIDTH: 0.152577
G1 X144.044 Y150.385 E.00208
; LINE_WIDTH: 0.104598
G1 X143.834 Y150.555 E.00124
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X144.044 Y150.385 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.72 I1.217 J0 P1  F30000
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
G1 Z9.82 F900 ; lower z a little
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

    G1 Z109.32 F600
    G1 Z107.32

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

