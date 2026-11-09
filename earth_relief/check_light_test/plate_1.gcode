; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 9m 56s; total estimated time: 16m 27s
; total layer number: 45
; total filament length [mm] : 1487.44
; total filament volume [cm^3] : 3577.70
; total filament weight [g] : 4.44
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 7.24
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
M73 P0 R16
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
M73 P3 R15
G1 E50 F200
M400
M104 S220
G92 E0
M73 P29 R11
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P31 R11
G1 E-0.5 F300

M73 P33 R11
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
M73 P33 R10
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
M73 P34 R10
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
    G29 A X104 Y118 I48 J20
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
; layer num/total_layer_count: 1/45
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
; OBJECT_ID: 15
G1 X150.686 Y134.686 F30000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
M204 S500
G1 X105.314 Y134.686 E1.68992
M73 P35 R10
G1 X105.314 Y117.314 E.64703
G1 X150.686 Y117.314 E1.68992
G1 X150.686 Y134.626 E.6448
M204 S6000
G1 X151.143 Y135.143 F30000
G1 F1800
M204 S500
G1 X104.857 Y135.143 E1.72397
G1 X104.857 Y116.857 E.68108
G1 X151.143 Y116.857 E1.72397
G1 X151.143 Y135.083 E.67884
M204 S6000
G1 X151.6 Y135.6 F30000
; FEATURE: Outer wall
G1 F1800
M204 S500
M73 P36 R10
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
; WIPE_START
G1 X149.6 Y135.543 E-.76
; WIPE_END
G1 E-.04
M204 S6000
G1 X149.591 Y127.91 Z.6 F30000
G1 X149.578 Y117.497 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50035
G1 F3600
M204 S500
G1 X150.297 Y118.216 E.0379
G1 X150.297 Y118.863 E.02411
G1 X149.137 Y117.703 E.06116
G1 X148.49 Y117.703 E.02411
G1 X150.297 Y119.51 E.09526
G1 X150.297 Y120.157 E.02411
G1 X147.843 Y117.703 E.12936
M73 P37 R10
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
M73 P38 R10
G1 X150.297 Y124.038 E.02411
G1 X143.962 Y117.703 E.33397
G1 X143.315 Y117.703 E.02411
G1 X150.297 Y124.685 E.36807
G1 X150.297 Y125.332 E.02411
M73 P39 R9
G1 X142.668 Y117.703 E.40217
G1 X142.021 Y117.703 E.02411
G1 X150.297 Y125.979 E.43627
G1 X150.297 Y126.626 E.02411
G1 X141.374 Y117.703 E.47038
G1 X140.727 Y117.703 E.02411
G1 X150.297 Y127.273 E.50448
G1 X150.297 Y127.92 E.02411
G1 X140.08 Y117.703 E.53858
M73 P40 R9
G1 X139.434 Y117.703 E.02411
G1 X150.297 Y128.566 E.57268
G1 X150.297 Y129.213 E.02411
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
M73 P41 R9
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
G1 X139.209 Y134.297 E.87478
G1 X138.562 Y134.297 E.02411
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
M73 P42 R9
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
M73 P43 R9
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
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
M73 P44 R9
G1 F3600
G1 X106.217 Y134.297 E-.38676
G1 X106.864 Y134.297 E-.24583
G1 X106.626 Y134.06 E-.12741
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
G3 Z.6 I-.025 J1.217 P1  F30000
G1 X150.974 Y134.974 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X105.026 Y134.974 E1.24504
G1 X105.026 Y117.026 E.48632
G1 X150.974 Y117.026 E1.24504
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X104.611 Y135.389 E1.26757
G1 X104.611 Y116.611 E.50885
G1 X151.389 Y116.611 E1.26757
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X104.21 Y135.79 E1.19623
G1 X104.21 Y116.21 E.49227
G1 X151.79 Y116.21 E1.19623
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.027 Y134.807 Z.76 F30000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420216
G1 F11661.657
G1 X150.633 Y134.2 E.02158
G1 X150.633 Y133.654 E.01373
G1 X149.654 Y134.633 E.03482
G1 X149.109 Y134.633 E.01373
G1 X150.633 Y133.109 E.05423
G1 X150.633 Y132.563 E.01373
G1 X148.563 Y134.633 E.07365
G1 X148.017 Y134.633 E.01373
G1 X150.633 Y132.017 E.09306
G1 X150.633 Y131.472 E.01373
G1 X147.472 Y134.633 E.11247
G1 X146.926 Y134.633 E.01373
G1 X150.633 Y130.926 E.13189
G1 X150.633 Y130.38 E.01373
G1 X146.38 Y134.633 E.1513
G1 X145.834 Y134.633 E.01373
G1 X150.633 Y129.834 E.17072
G1 X150.633 Y129.289 E.01373
G1 X145.289 Y134.633 E.19013
G1 X144.743 Y134.633 E.01373
G1 X150.633 Y128.743 E.20954
G1 X150.633 Y128.197 E.01373
G1 X144.197 Y134.633 E.22896
G1 X143.652 Y134.633 E.01373
G1 X150.633 Y127.652 E.24837
G1 X150.633 Y127.106 E.01373
G1 X143.106 Y134.633 E.26779
G1 X142.56 Y134.633 E.01373
G1 X150.633 Y126.56 E.2872
G1 X150.633 Y126.014 E.01373
G1 X142.014 Y134.633 E.30661
G1 X141.469 Y134.633 E.01373
G1 X150.633 Y125.469 E.32603
G1 X150.633 Y124.923 E.01373
G1 X140.923 Y134.633 E.34544
G1 X140.377 Y134.633 E.01373
G1 X150.633 Y124.377 E.36486
M73 P45 R9
G1 X150.633 Y123.832 E.01373
G1 X139.832 Y134.633 E.38427
G1 X139.286 Y134.633 E.01373
G1 X150.633 Y123.286 E.40368
G1 X150.633 Y122.74 E.01373
G1 X138.74 Y134.633 E.4231
G1 X138.194 Y134.633 E.01373
G1 X150.633 Y122.194 E.44251
G1 X150.633 Y121.649 E.01373
G1 X137.649 Y134.633 E.46193
G1 X137.103 Y134.633 E.01373
G1 X150.633 Y121.103 E.48134
G1 X150.633 Y120.557 E.01373
G1 X136.557 Y134.633 E.50075
G1 X136.012 Y134.633 E.01373
G1 X150.633 Y120.012 E.52017
G1 X150.633 Y119.466 E.01373
G1 X135.466 Y134.633 E.53958
G1 X134.92 Y134.633 E.01373
G1 X150.633 Y118.92 E.559
G1 X150.633 Y118.374 E.01373
G1 X134.374 Y134.633 E.57841
G1 X133.829 Y134.633 E.01373
G1 X150.633 Y117.829 E.59782
G1 X150.633 Y117.367 E.01162
G1 X150.549 Y117.367 E.00211
G1 X133.283 Y134.633 E.61425
G1 X132.737 Y134.633 E.01373
G1 X150.004 Y117.367 E.61425
G1 X149.458 Y117.367 E.01373
G1 X132.191 Y134.633 E.61425
G1 X131.646 Y134.633 E.01373
G1 X148.912 Y117.367 E.61425
G1 X148.366 Y117.367 E.01373
G1 X131.1 Y134.633 E.61425
M73 P45 R8
G1 X130.554 Y134.633 E.01373
G1 X147.821 Y117.367 E.61425
G1 X147.275 Y117.367 E.01373
G1 X130.009 Y134.633 E.61425
G1 X129.463 Y134.633 E.01373
G1 X146.729 Y117.367 E.61425
G1 X146.184 Y117.367 E.01373
G1 X128.917 Y134.633 E.61425
G1 X128.371 Y134.633 E.01373
G1 X145.638 Y117.367 E.61425
G1 X145.092 Y117.367 E.01373
G1 X127.826 Y134.633 E.61425
G1 X127.28 Y134.633 E.01373
G1 X144.546 Y117.367 E.61425
G1 X144.001 Y117.367 E.01373
G1 X126.734 Y134.633 E.61425
G1 X126.189 Y134.633 E.01373
G1 X143.455 Y117.367 E.61425
G1 X142.909 Y117.367 E.01373
G1 X125.643 Y134.633 E.61425
G1 X125.097 Y134.633 E.01373
G1 X142.363 Y117.367 E.61425
G1 X141.818 Y117.367 E.01373
G1 X124.551 Y134.633 E.61425
G1 X124.006 Y134.633 E.01373
G1 X141.272 Y117.367 E.61425
G1 X140.726 Y117.367 E.01373
G1 X123.46 Y134.633 E.61425
G1 X122.914 Y134.633 E.01373
G1 X140.181 Y117.367 E.61425
G1 X139.635 Y117.367 E.01373
G1 X122.369 Y134.633 E.61425
G1 X121.823 Y134.633 E.01373
G1 X139.089 Y117.367 E.61425
G1 X138.543 Y117.367 E.01373
G1 X121.277 Y134.633 E.61425
G1 X120.731 Y134.633 E.01373
G1 X137.998 Y117.367 E.61425
G1 X137.452 Y117.367 E.01373
G1 X120.186 Y134.633 E.61425
G1 X119.64 Y134.633 E.01373
G1 X136.906 Y117.367 E.61425
G1 X136.361 Y117.367 E.01373
G1 X119.094 Y134.633 E.61425
G1 X118.549 Y134.633 E.01373
G1 X135.815 Y117.367 E.61425
G1 X135.269 Y117.367 E.01373
G1 X118.003 Y134.633 E.61425
G1 X117.457 Y134.633 E.01373
G1 X134.723 Y117.367 E.61425
G1 X134.178 Y117.367 E.01373
G1 X116.911 Y134.633 E.61425
G1 X116.366 Y134.633 E.01373
G1 X133.632 Y117.367 E.61425
G1 X133.086 Y117.367 E.01373
G1 X115.82 Y134.633 E.61425
G1 X115.274 Y134.633 E.01373
G1 X132.541 Y117.367 E.61425
G1 X131.995 Y117.367 E.01373
G1 X114.729 Y134.633 E.61425
G1 X114.183 Y134.633 E.01373
G1 X131.449 Y117.367 E.61425
G1 X130.903 Y117.367 E.01373
G1 X113.637 Y134.633 E.61425
G1 X113.091 Y134.633 E.01373
G1 X130.358 Y117.367 E.61425
G1 X129.812 Y117.367 E.01373
G1 X112.546 Y134.633 E.61425
G1 X112 Y134.633 E.01373
G1 X129.266 Y117.367 E.61425
G1 X128.721 Y117.367 E.01373
G1 X111.454 Y134.633 E.61425
G1 X110.909 Y134.633 E.01373
G1 X128.175 Y117.367 E.61425
G1 X127.629 Y117.367 E.01373
G1 X110.363 Y134.633 E.61425
G1 X109.817 Y134.633 E.01373
G1 X127.083 Y117.367 E.61425
G1 X126.538 Y117.367 E.01373
G1 X109.271 Y134.633 E.61425
G1 X108.726 Y134.633 E.01373
G1 X125.992 Y117.367 E.61425
G1 X125.446 Y117.367 E.01373
G1 X108.18 Y134.633 E.61425
G1 X107.634 Y134.633 E.01373
G1 X124.901 Y117.367 E.61425
G1 X124.355 Y117.367 E.01373
G1 X107.089 Y134.633 E.61425
G1 X106.543 Y134.633 E.01373
G1 X123.809 Y117.367 E.61425
G1 X123.263 Y117.367 E.01373
G1 X105.997 Y134.633 E.61425
G1 X105.451 Y134.633 E.01373
G1 X122.718 Y117.367 E.61425
M73 P46 R8
G1 X122.172 Y117.367 E.01373
G1 X105.367 Y134.172 E.59785
G1 X105.367 Y133.626 E.01373
G1 X121.626 Y117.367 E.57843
G1 X121.081 Y117.367 E.01373
G1 X105.367 Y133.081 E.55902
G1 X105.367 Y132.535 E.01373
G1 X120.535 Y117.367 E.5396
G1 X119.989 Y117.367 E.01373
G1 X105.367 Y131.989 E.52019
G1 X105.367 Y131.443 E.01373
G1 X119.443 Y117.367 E.50078
G1 X118.898 Y117.367 E.01373
G1 X105.367 Y130.898 E.48136
G1 X105.367 Y130.352 E.01373
G1 X118.352 Y117.367 E.46195
G1 X117.806 Y117.367 E.01373
G1 X105.367 Y129.806 E.44253
G1 X105.367 Y129.261 E.01373
G1 X117.261 Y117.367 E.42312
G1 X116.715 Y117.367 E.01373
G1 X105.367 Y128.715 E.40371
G1 X105.367 Y128.169 E.01373
G1 X116.169 Y117.367 E.38429
G1 X115.623 Y117.367 E.01373
G1 X105.367 Y127.623 E.36488
G1 X105.367 Y127.078 E.01373
G1 X115.078 Y117.367 E.34546
G1 X114.532 Y117.367 E.01373
G1 X105.367 Y126.532 E.32605
G1 X105.367 Y125.986 E.01373
G1 X113.986 Y117.367 E.30664
G1 X113.44 Y117.367 E.01373
G1 X105.367 Y125.44 E.28722
G1 X105.367 Y124.895 E.01373
G1 X112.895 Y117.367 E.26781
G1 X112.349 Y117.367 E.01373
G1 X105.367 Y124.349 E.24839
G1 X105.367 Y123.803 E.01373
G1 X111.803 Y117.367 E.22898
G1 X111.258 Y117.367 E.01373
G1 X105.367 Y123.258 E.20957
G1 X105.367 Y122.712 E.01373
G1 X110.712 Y117.367 E.19015
G1 X110.166 Y117.367 E.01373
G1 X105.367 Y122.166 E.17074
G1 X105.367 Y121.62 E.01373
G1 X109.62 Y117.367 E.15132
G1 X109.075 Y117.367 E.01373
G1 X105.367 Y121.075 E.13191
G1 X105.367 Y120.529 E.01373
G1 X108.529 Y117.367 E.1125
G1 X107.983 Y117.367 E.01373
G1 X105.367 Y119.983 E.09308
G1 X105.367 Y119.438 E.01373
G1 X107.438 Y117.367 E.07367
G1 X106.892 Y117.367 E.01373
G1 X105.367 Y118.892 E.05425
G1 X105.367 Y118.346 E.01373
G1 X106.346 Y117.367 E.03484
G1 X105.8 Y117.367 E.01373
G1 X105.193 Y117.974 E.0216
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11661.657
G1 X105.8 Y117.367 E-.32629
G1 X106.346 Y117.367 E-.20737
G1 X105.925 Y117.788 E-.22633
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/45
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.76 I-.434 J1.137 P1  F30000
G1 X150.974 Y134.974 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X105.026 Y134.974 E1.24504
G1 X105.026 Y117.026 E.48632
G1 X150.974 Y117.026 E1.24504
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X104.611 Y135.389 E1.26757
G1 X104.611 Y116.611 E.50885
G1 X151.389 Y116.611 E1.26757
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X104.21 Y135.79 E1.19623
G1 X104.21 Y116.21 E.49227
G1 X151.79 Y116.21 E1.19623
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.226 Y128.113 Z.92 F30000
G1 X150.807 Y117.973 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420216
G1 F11661.657
G1 X150.2 Y117.367 E.02158
G1 X149.654 Y117.367 E.01373
G1 X150.633 Y118.346 E.03482
G1 X150.633 Y118.891 E.01373
G1 X149.109 Y117.367 E.05423
G1 X148.563 Y117.367 E.01373
G1 X150.633 Y119.437 E.07365
G1 X150.633 Y119.983 E.01373
G1 X148.017 Y117.367 E.09306
G1 X147.472 Y117.367 E.01373
G1 X150.633 Y120.528 E.11247
G1 X150.633 Y121.074 E.01373
G1 X146.926 Y117.367 E.13189
G1 X146.38 Y117.367 E.01373
G1 X150.633 Y121.62 E.1513
G1 X150.633 Y122.166 E.01373
G1 X145.834 Y117.367 E.17072
G1 X145.289 Y117.367 E.01373
G1 X150.633 Y122.711 E.19013
G1 X150.633 Y123.257 E.01373
G1 X144.743 Y117.367 E.20954
G1 X144.197 Y117.367 E.01373
G1 X150.633 Y123.803 E.22896
G1 X150.633 Y124.348 E.01373
G1 X143.652 Y117.367 E.24837
G1 X143.106 Y117.367 E.01373
G1 X150.633 Y124.894 E.26779
G1 X150.633 Y125.44 E.01373
G1 X142.56 Y117.367 E.2872
G1 X142.014 Y117.367 E.01373
G1 X150.633 Y125.986 E.30661
G1 X150.633 Y126.531 E.01373
G1 X141.469 Y117.367 E.32603
G1 X140.923 Y117.367 E.01373
G1 X150.633 Y127.077 E.34544
G1 X150.633 Y127.623 E.01373
G1 X140.377 Y117.367 E.36486
G1 X139.832 Y117.367 E.01373
G1 X150.633 Y128.168 E.38427
G1 X150.633 Y128.714 E.01373
G1 X139.286 Y117.367 E.40368
M73 P47 R8
G1 X138.74 Y117.367 E.01373
G1 X150.633 Y129.26 E.4231
G1 X150.633 Y129.806 E.01373
G1 X138.194 Y117.367 E.44251
G1 X137.649 Y117.367 E.01373
G1 X150.633 Y130.351 E.46193
G1 X150.633 Y130.897 E.01373
G1 X137.103 Y117.367 E.48134
G1 X136.557 Y117.367 E.01373
G1 X150.633 Y131.443 E.50075
G1 X150.633 Y131.988 E.01373
G1 X136.012 Y117.367 E.52017
G1 X135.466 Y117.367 E.01373
G1 X150.633 Y132.534 E.53958
G1 X150.633 Y133.08 E.01373
G1 X134.92 Y117.367 E.559
G1 X134.374 Y117.367 E.01373
G1 X150.633 Y133.626 E.57841
G1 X150.633 Y134.171 E.01373
G1 X133.829 Y117.367 E.59782
G1 X133.283 Y117.367 E.01373
G1 X150.549 Y134.633 E.61425
G1 X150.004 Y134.633 E.01373
G1 X132.737 Y117.367 E.61425
G1 X132.192 Y117.367 E.01373
G1 X149.458 Y134.633 E.61425
G1 X148.912 Y134.633 E.01373
G1 X131.646 Y117.367 E.61425
G1 X131.1 Y117.367 E.01373
G1 X148.366 Y134.633 E.61425
G1 X147.821 Y134.633 E.01373
G1 X130.554 Y117.367 E.61425
G1 X130.009 Y117.367 E.01373
G1 X147.275 Y134.633 E.61425
G1 X146.729 Y134.633 E.01373
G1 X129.463 Y117.367 E.61425
G1 X128.917 Y117.367 E.01373
G1 X146.184 Y134.633 E.61425
G1 X145.638 Y134.633 E.01373
G1 X128.371 Y117.367 E.61425
G1 X127.826 Y117.367 E.01373
G1 X145.092 Y134.633 E.61425
G1 X144.546 Y134.633 E.01373
G1 X127.28 Y117.367 E.61425
G1 X126.734 Y117.367 E.01373
G1 X144.001 Y134.633 E.61425
G1 X143.455 Y134.633 E.01373
G1 X126.189 Y117.367 E.61425
G1 X125.643 Y117.367 E.01373
G1 X142.909 Y134.633 E.61425
G1 X142.363 Y134.633 E.01373
G1 X125.097 Y117.367 E.61425
G1 X124.551 Y117.367 E.01373
G1 X141.818 Y134.633 E.61425
G1 X141.272 Y134.633 E.01373
G1 X124.006 Y117.367 E.61425
G1 X123.46 Y117.367 E.01373
G1 X140.726 Y134.633 E.61425
G1 X140.181 Y134.633 E.01373
G1 X122.914 Y117.367 E.61425
G1 X122.369 Y117.367 E.01373
G1 X139.635 Y134.633 E.61425
G1 X139.089 Y134.633 E.01373
G1 X121.823 Y117.367 E.61425
G1 X121.277 Y117.367 E.01373
G1 X138.543 Y134.633 E.61425
G1 X137.998 Y134.633 E.01373
G1 X120.731 Y117.367 E.61425
G1 X120.186 Y117.367 E.01373
G1 X137.452 Y134.633 E.61425
G1 X136.906 Y134.633 E.01373
G1 X119.64 Y117.367 E.61425
G1 X119.094 Y117.367 E.01373
G1 X136.361 Y134.633 E.61425
G1 X135.815 Y134.633 E.01373
G1 X118.549 Y117.367 E.61425
G1 X118.003 Y117.367 E.01373
G1 X135.269 Y134.633 E.61425
G1 X134.723 Y134.633 E.01373
G1 X117.457 Y117.367 E.61425
G1 X116.911 Y117.367 E.01373
G1 X134.178 Y134.633 E.61425
G1 X133.632 Y134.633 E.01373
G1 X116.366 Y117.367 E.61425
G1 X115.82 Y117.367 E.01373
G1 X133.086 Y134.633 E.61425
G1 X132.541 Y134.633 E.01373
G1 X115.274 Y117.367 E.61425
G1 X114.729 Y117.367 E.01373
G1 X131.995 Y134.633 E.61425
G1 X131.449 Y134.633 E.01373
G1 X114.183 Y117.367 E.61425
G1 X113.637 Y117.367 E.01373
G1 X130.903 Y134.633 E.61425
G1 X130.358 Y134.633 E.01373
G1 X113.091 Y117.367 E.61425
G1 X112.546 Y117.367 E.01373
G1 X129.812 Y134.633 E.61425
G1 X129.266 Y134.633 E.01373
G1 X112 Y117.367 E.61425
G1 X111.454 Y117.367 E.01373
G1 X128.721 Y134.633 E.61425
G1 X128.175 Y134.633 E.01373
G1 X110.909 Y117.367 E.61425
G1 X110.363 Y117.367 E.01373
G1 X127.629 Y134.633 E.61425
G1 X127.083 Y134.633 E.01373
G1 X109.817 Y117.367 E.61425
G1 X109.271 Y117.367 E.01373
G1 X126.538 Y134.633 E.61425
G1 X125.992 Y134.633 E.01373
G1 X108.726 Y117.367 E.61425
G1 X108.18 Y117.367 E.01373
G1 X125.446 Y134.633 E.61425
G1 X124.901 Y134.633 E.01373
G1 X107.634 Y117.367 E.61425
G1 X107.089 Y117.367 E.01373
G1 X124.355 Y134.633 E.61425
G1 X123.809 Y134.633 E.01373
G1 X106.543 Y117.367 E.61425
G1 X105.997 Y117.367 E.01373
G1 X123.263 Y134.633 E.61425
G1 X122.718 Y134.633 E.01373
G1 X105.451 Y117.367 E.61425
G1 X105.367 Y117.367 E.00213
G1 X105.367 Y117.828 E.0116
G1 X122.172 Y134.633 E.59785
G1 X121.626 Y134.633 E.01373
G1 X105.367 Y118.374 E.57843
G1 X105.367 Y118.919 E.01373
G1 X121.081 Y134.633 E.55902
G1 X120.535 Y134.633 E.01373
G1 X105.367 Y119.465 E.5396
G1 X105.367 Y120.011 E.01373
G1 X119.989 Y134.633 E.52019
G1 X119.443 Y134.633 E.01373
G1 X105.367 Y120.557 E.50078
G1 X105.367 Y121.102 E.01373
G1 X118.898 Y134.633 E.48136
G1 X118.352 Y134.633 E.01373
M73 P48 R8
G1 X105.367 Y121.648 E.46195
G1 X105.367 Y122.194 E.01373
G1 X117.806 Y134.633 E.44253
G1 X117.261 Y134.633 E.01373
G1 X105.367 Y122.739 E.42312
G1 X105.367 Y123.285 E.01373
G1 X116.715 Y134.633 E.40371
G1 X116.169 Y134.633 E.01373
G1 X105.367 Y123.831 E.38429
G1 X105.367 Y124.377 E.01373
G1 X115.623 Y134.633 E.36488
G1 X115.078 Y134.633 E.01373
G1 X105.367 Y124.922 E.34546
G1 X105.367 Y125.468 E.01373
G1 X114.532 Y134.633 E.32605
G1 X113.986 Y134.633 E.01373
G1 X105.367 Y126.014 E.30664
G1 X105.367 Y126.559 E.01373
G1 X113.441 Y134.633 E.28722
G1 X112.895 Y134.633 E.01373
G1 X105.367 Y127.105 E.26781
G1 X105.367 Y127.651 E.01373
G1 X112.349 Y134.633 E.24839
G1 X111.803 Y134.633 E.01373
G1 X105.367 Y128.197 E.22898
G1 X105.367 Y128.742 E.01373
G1 X111.258 Y134.633 E.20957
G1 X110.712 Y134.633 E.01373
G1 X105.367 Y129.288 E.19015
G1 X105.367 Y129.834 E.01373
G1 X110.166 Y134.633 E.17074
G1 X109.621 Y134.633 E.01373
G1 X105.367 Y130.379 E.15132
G1 X105.367 Y130.925 E.01373
G1 X109.075 Y134.633 E.13191
G1 X108.529 Y134.633 E.01373
G1 X105.367 Y131.471 E.1125
G1 X105.367 Y132.017 E.01373
G1 X107.983 Y134.633 E.09308
G1 X107.438 Y134.633 E.01373
G1 X105.367 Y132.562 E.07367
G1 X105.367 Y133.108 E.01373
G1 X106.892 Y134.633 E.05425
G1 X106.346 Y134.633 E.01373
G1 X105.367 Y133.654 E.03484
G1 X105.367 Y134.2 E.01373
G1 X105.974 Y134.807 E.0216
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11661.657
G1 X105.367 Y134.2 E-.3263
G1 X105.367 Y133.654 E-.20737
G1 X105.788 Y134.075 E-.22632
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/45
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z.92 I-.024 J1.217 P1  F30000
G1 X150.974 Y134.974 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X105.026 Y134.974 E1.24504
G1 X105.026 Y117.026 E.48632
G1 X150.974 Y117.026 E1.24504
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X104.611 Y135.389 E1.26757
G1 X104.611 Y116.611 E.50885
G1 X151.389 Y116.611 E1.26757
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X104.21 Y135.79 E1.19623
G1 X104.21 Y116.21 E.49227
G1 X151.79 Y116.21 E1.19623
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.027 Y134.807 Z1.08 F30000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420216
G1 F11661.657
G1 X150.633 Y134.2 E.02158
G1 X150.633 Y133.654 E.01373
G1 X149.654 Y134.633 E.03482
G1 X149.109 Y134.633 E.01373
G1 X150.633 Y133.109 E.05423
G1 X150.633 Y132.563 E.01373
G1 X148.563 Y134.633 E.07365
G1 X148.017 Y134.633 E.01373
G1 X150.633 Y132.017 E.09306
G1 X150.633 Y131.472 E.01373
G1 X147.472 Y134.633 E.11247
G1 X146.926 Y134.633 E.01373
G1 X150.633 Y130.926 E.13189
G1 X150.633 Y130.38 E.01373
G1 X146.38 Y134.633 E.1513
G1 X145.834 Y134.633 E.01373
G1 X150.633 Y129.834 E.17072
G1 X150.633 Y129.289 E.01373
G1 X145.289 Y134.633 E.19013
G1 X144.743 Y134.633 E.01373
G1 X150.633 Y128.743 E.20954
G1 X150.633 Y128.197 E.01373
G1 X144.197 Y134.633 E.22896
G1 X143.652 Y134.633 E.01373
G1 X150.633 Y127.652 E.24837
G1 X150.633 Y127.106 E.01373
G1 X143.106 Y134.633 E.26779
G1 X142.56 Y134.633 E.01373
G1 X150.633 Y126.56 E.2872
G1 X150.633 Y126.014 E.01373
G1 X142.014 Y134.633 E.30661
G1 X141.469 Y134.633 E.01373
G1 X150.633 Y125.469 E.32603
G1 X150.633 Y124.923 E.01373
G1 X140.923 Y134.633 E.34544
G1 X140.377 Y134.633 E.01373
G1 X150.633 Y124.377 E.36486
G1 X150.633 Y123.832 E.01373
G1 X139.832 Y134.633 E.38427
G1 X139.286 Y134.633 E.01373
G1 X150.633 Y123.286 E.40368
G1 X150.633 Y122.74 E.01373
G1 X138.74 Y134.633 E.4231
G1 X138.194 Y134.633 E.01373
M73 P49 R8
G1 X150.633 Y122.194 E.44251
G1 X150.633 Y121.649 E.01373
G1 X137.649 Y134.633 E.46193
G1 X137.103 Y134.633 E.01373
G1 X150.633 Y121.103 E.48134
G1 X150.633 Y120.557 E.01373
G1 X136.557 Y134.633 E.50075
G1 X136.012 Y134.633 E.01373
G1 X150.633 Y120.012 E.52017
G1 X150.633 Y119.466 E.01373
G1 X135.466 Y134.633 E.53958
G1 X134.92 Y134.633 E.01373
G1 X150.633 Y118.92 E.559
G1 X150.633 Y118.374 E.01373
G1 X134.374 Y134.633 E.57841
G1 X133.829 Y134.633 E.01373
G1 X150.633 Y117.829 E.59782
G1 X150.633 Y117.367 E.01162
G1 X150.549 Y117.367 E.00211
G1 X133.283 Y134.633 E.61425
G1 X132.737 Y134.633 E.01373
G1 X150.004 Y117.367 E.61425
G1 X149.458 Y117.367 E.01373
G1 X132.191 Y134.633 E.61425
G1 X131.646 Y134.633 E.01373
G1 X148.912 Y117.367 E.61425
G1 X148.366 Y117.367 E.01373
G1 X131.1 Y134.633 E.61425
G1 X130.554 Y134.633 E.01373
G1 X147.821 Y117.367 E.61425
G1 X147.275 Y117.367 E.01373
G1 X130.009 Y134.633 E.61425
G1 X129.463 Y134.633 E.01373
G1 X146.729 Y117.367 E.61425
G1 X146.184 Y117.367 E.01373
G1 X128.917 Y134.633 E.61425
G1 X128.371 Y134.633 E.01373
G1 X145.638 Y117.367 E.61425
G1 X145.092 Y117.367 E.01373
G1 X127.826 Y134.633 E.61425
G1 X127.28 Y134.633 E.01373
G1 X144.546 Y117.367 E.61425
G1 X144.001 Y117.367 E.01373
G1 X126.734 Y134.633 E.61425
G1 X126.189 Y134.633 E.01373
G1 X143.455 Y117.367 E.61425
G1 X142.909 Y117.367 E.01373
G1 X125.643 Y134.633 E.61425
G1 X125.097 Y134.633 E.01373
G1 X142.363 Y117.367 E.61425
G1 X141.818 Y117.367 E.01373
G1 X124.551 Y134.633 E.61425
G1 X124.006 Y134.633 E.01373
G1 X141.272 Y117.367 E.61425
G1 X140.726 Y117.367 E.01373
G1 X123.46 Y134.633 E.61425
G1 X122.914 Y134.633 E.01373
G1 X140.181 Y117.367 E.61425
G1 X139.635 Y117.367 E.01373
G1 X122.369 Y134.633 E.61425
G1 X121.823 Y134.633 E.01373
G1 X139.089 Y117.367 E.61425
G1 X138.543 Y117.367 E.01373
G1 X121.277 Y134.633 E.61425
G1 X120.731 Y134.633 E.01373
G1 X137.998 Y117.367 E.61425
G1 X137.452 Y117.367 E.01373
G1 X120.186 Y134.633 E.61425
G1 X119.64 Y134.633 E.01373
G1 X136.906 Y117.367 E.61425
G1 X136.361 Y117.367 E.01373
G1 X119.094 Y134.633 E.61425
G1 X118.549 Y134.633 E.01373
G1 X135.815 Y117.367 E.61425
G1 X135.269 Y117.367 E.01373
G1 X118.003 Y134.633 E.61425
G1 X117.457 Y134.633 E.01373
G1 X134.723 Y117.367 E.61425
G1 X134.178 Y117.367 E.01373
G1 X116.911 Y134.633 E.61425
G1 X116.366 Y134.633 E.01373
G1 X133.632 Y117.367 E.61425
G1 X133.086 Y117.367 E.01373
G1 X115.82 Y134.633 E.61425
G1 X115.274 Y134.633 E.01373
G1 X132.541 Y117.367 E.61425
G1 X131.995 Y117.367 E.01373
G1 X114.729 Y134.633 E.61425
G1 X114.183 Y134.633 E.01373
G1 X131.449 Y117.367 E.61425
G1 X130.903 Y117.367 E.01373
G1 X113.637 Y134.633 E.61425
G1 X113.091 Y134.633 E.01373
G1 X130.358 Y117.367 E.61425
G1 X129.812 Y117.367 E.01373
G1 X112.546 Y134.633 E.61425
G1 X112 Y134.633 E.01373
G1 X129.266 Y117.367 E.61425
G1 X128.721 Y117.367 E.01373
G1 X111.454 Y134.633 E.61425
G1 X110.909 Y134.633 E.01373
G1 X128.175 Y117.367 E.61425
G1 X127.629 Y117.367 E.01373
G1 X110.363 Y134.633 E.61425
G1 X109.817 Y134.633 E.01373
G1 X127.083 Y117.367 E.61425
G1 X126.538 Y117.367 E.01373
G1 X109.271 Y134.633 E.61425
G1 X108.726 Y134.633 E.01373
G1 X125.992 Y117.367 E.61425
G1 X125.446 Y117.367 E.01373
G1 X108.18 Y134.633 E.61425
G1 X107.634 Y134.633 E.01373
G1 X124.901 Y117.367 E.61425
G1 X124.355 Y117.367 E.01373
G1 X107.089 Y134.633 E.61425
G1 X106.543 Y134.633 E.01373
G1 X123.809 Y117.367 E.61425
G1 X123.263 Y117.367 E.01373
G1 X105.997 Y134.633 E.61425
G1 X105.451 Y134.633 E.01373
G1 X122.718 Y117.367 E.61425
G1 X122.172 Y117.367 E.01373
G1 X105.367 Y134.172 E.59785
G1 X105.367 Y133.626 E.01373
G1 X121.626 Y117.367 E.57843
G1 X121.081 Y117.367 E.01373
G1 X105.367 Y133.081 E.55902
G1 X105.367 Y132.535 E.01373
G1 X120.535 Y117.367 E.5396
G1 X119.989 Y117.367 E.01373
G1 X105.367 Y131.989 E.52019
G1 X105.367 Y131.443 E.01373
G1 X119.443 Y117.367 E.50078
G1 X118.898 Y117.367 E.01373
G1 X105.367 Y130.898 E.48136
G1 X105.367 Y130.352 E.01373
G1 X118.352 Y117.367 E.46195
G1 X117.806 Y117.367 E.01373
G1 X105.367 Y129.806 E.44253
G1 X105.367 Y129.261 E.01373
G1 X117.261 Y117.367 E.42312
G1 X116.715 Y117.367 E.01373
G1 X105.367 Y128.715 E.40371
G1 X105.367 Y128.169 E.01373
G1 X116.169 Y117.367 E.38429
G1 X115.623 Y117.367 E.01373
G1 X105.367 Y127.623 E.36488
G1 X105.367 Y127.078 E.01373
G1 X115.078 Y117.367 E.34546
G1 X114.532 Y117.367 E.01373
G1 X105.367 Y126.532 E.32605
G1 X105.367 Y125.986 E.01373
G1 X113.986 Y117.367 E.30664
M73 P50 R8
G1 X113.44 Y117.367 E.01373
G1 X105.367 Y125.44 E.28722
G1 X105.367 Y124.895 E.01373
G1 X112.895 Y117.367 E.26781
G1 X112.349 Y117.367 E.01373
G1 X105.367 Y124.349 E.24839
G1 X105.367 Y123.803 E.01373
G1 X111.803 Y117.367 E.22898
G1 X111.258 Y117.367 E.01373
G1 X105.367 Y123.258 E.20957
G1 X105.367 Y122.712 E.01373
G1 X110.712 Y117.367 E.19015
G1 X110.166 Y117.367 E.01373
G1 X105.367 Y122.166 E.17074
G1 X105.367 Y121.62 E.01373
G1 X109.62 Y117.367 E.15132
G1 X109.075 Y117.367 E.01373
G1 X105.367 Y121.075 E.13191
G1 X105.367 Y120.529 E.01373
G1 X108.529 Y117.367 E.1125
G1 X107.983 Y117.367 E.01373
G1 X105.367 Y119.983 E.09308
G1 X105.367 Y119.438 E.01373
G1 X107.438 Y117.367 E.07367
G1 X106.892 Y117.367 E.01373
G1 X105.367 Y118.892 E.05425
G1 X105.367 Y118.346 E.01373
G1 X106.346 Y117.367 E.03484
G1 X105.8 Y117.367 E.01373
G1 X105.193 Y117.974 E.0216
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11661.657
G1 X105.8 Y117.367 E-.32629
G1 X106.346 Y117.367 E-.20737
G1 X105.925 Y117.788 E-.22633
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/45
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.08 I-.434 J1.137 P1  F30000
G1 X150.974 Y134.974 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X105.026 Y134.974 E1.24504
G1 X105.026 Y117.026 E.48632
G1 X150.974 Y117.026 E1.24504
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X104.611 Y135.389 E1.26757
G1 X104.611 Y116.611 E.50885
G1 X151.389 Y116.611 E1.26757
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X104.21 Y135.79 E1.19623
G1 X104.21 Y116.21 E.49227
G1 X151.79 Y116.21 E1.19623
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.226 Y128.113 Z1.24 F30000
G1 X150.807 Y117.973 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420216
G1 F11661.657
G1 X150.2 Y117.367 E.02158
G1 X149.654 Y117.367 E.01373
G1 X150.633 Y118.346 E.03482
G1 X150.633 Y118.891 E.01373
G1 X149.109 Y117.367 E.05423
G1 X148.563 Y117.367 E.01373
G1 X150.633 Y119.437 E.07365
G1 X150.633 Y119.983 E.01373
G1 X148.017 Y117.367 E.09306
G1 X147.472 Y117.367 E.01373
G1 X150.633 Y120.528 E.11247
G1 X150.633 Y121.074 E.01373
G1 X146.926 Y117.367 E.13189
G1 X146.38 Y117.367 E.01373
G1 X150.633 Y121.62 E.1513
G1 X150.633 Y122.166 E.01373
G1 X145.834 Y117.367 E.17072
G1 X145.289 Y117.367 E.01373
G1 X150.633 Y122.711 E.19013
G1 X150.633 Y123.257 E.01373
G1 X144.743 Y117.367 E.20954
G1 X144.197 Y117.367 E.01373
G1 X150.633 Y123.803 E.22896
G1 X150.633 Y124.348 E.01373
G1 X143.652 Y117.367 E.24837
G1 X143.106 Y117.367 E.01373
G1 X150.633 Y124.894 E.26779
G1 X150.633 Y125.44 E.01373
G1 X142.56 Y117.367 E.2872
G1 X142.014 Y117.367 E.01373
G1 X150.633 Y125.986 E.30661
G1 X150.633 Y126.531 E.01373
G1 X141.469 Y117.367 E.32603
G1 X140.923 Y117.367 E.01373
G1 X150.633 Y127.077 E.34544
G1 X150.633 Y127.623 E.01373
G1 X140.377 Y117.367 E.36486
G1 X139.832 Y117.367 E.01373
G1 X150.633 Y128.168 E.38427
G1 X150.633 Y128.714 E.01373
G1 X139.286 Y117.367 E.40368
G1 X138.74 Y117.367 E.01373
G1 X150.633 Y129.26 E.4231
G1 X150.633 Y129.806 E.01373
G1 X138.194 Y117.367 E.44251
G1 X137.649 Y117.367 E.01373
G1 X150.633 Y130.351 E.46193
G1 X150.633 Y130.897 E.01373
G1 X137.103 Y117.367 E.48134
G1 X136.557 Y117.367 E.01373
G1 X150.633 Y131.443 E.50075
G1 X150.633 Y131.988 E.01373
G1 X136.012 Y117.367 E.52017
G1 X135.466 Y117.367 E.01373
G1 X150.633 Y132.534 E.53958
G1 X150.633 Y133.08 E.01373
G1 X134.92 Y117.367 E.559
G1 X134.374 Y117.367 E.01373
G1 X150.633 Y133.626 E.57841
G1 X150.633 Y134.171 E.01373
G1 X133.829 Y117.367 E.59782
G1 X133.283 Y117.367 E.01373
G1 X150.549 Y134.633 E.61425
G1 X150.004 Y134.633 E.01373
G1 X132.737 Y117.367 E.61425
G1 X132.192 Y117.367 E.01373
G1 X149.458 Y134.633 E.61425
G1 X148.912 Y134.633 E.01373
G1 X131.646 Y117.367 E.61425
G1 X131.1 Y117.367 E.01373
G1 X148.366 Y134.633 E.61425
G1 X147.821 Y134.633 E.01373
G1 X130.554 Y117.367 E.61425
G1 X130.009 Y117.367 E.01373
G1 X147.275 Y134.633 E.61425
G1 X146.729 Y134.633 E.01373
G1 X129.463 Y117.367 E.61425
G1 X128.917 Y117.367 E.01373
G1 X146.184 Y134.633 E.61425
G1 X145.638 Y134.633 E.01373
G1 X128.371 Y117.367 E.61425
M73 P51 R8
G1 X127.826 Y117.367 E.01373
G1 X145.092 Y134.633 E.61425
G1 X144.546 Y134.633 E.01373
G1 X127.28 Y117.367 E.61425
G1 X126.734 Y117.367 E.01373
G1 X144.001 Y134.633 E.61425
G1 X143.455 Y134.633 E.01373
G1 X126.189 Y117.367 E.61425
G1 X125.643 Y117.367 E.01373
G1 X142.909 Y134.633 E.61425
G1 X142.363 Y134.633 E.01373
G1 X125.097 Y117.367 E.61425
G1 X124.551 Y117.367 E.01373
G1 X141.818 Y134.633 E.61425
G1 X141.272 Y134.633 E.01373
G1 X124.006 Y117.367 E.61425
G1 X123.46 Y117.367 E.01373
G1 X140.726 Y134.633 E.61425
G1 X140.181 Y134.633 E.01373
G1 X122.914 Y117.367 E.61425
G1 X122.369 Y117.367 E.01373
G1 X139.635 Y134.633 E.61425
G1 X139.089 Y134.633 E.01373
G1 X121.823 Y117.367 E.61425
G1 X121.277 Y117.367 E.01373
G1 X138.543 Y134.633 E.61425
G1 X137.998 Y134.633 E.01373
G1 X120.731 Y117.367 E.61425
G1 X120.186 Y117.367 E.01373
G1 X137.452 Y134.633 E.61425
G1 X136.906 Y134.633 E.01373
G1 X119.64 Y117.367 E.61425
G1 X119.094 Y117.367 E.01373
G1 X136.361 Y134.633 E.61425
G1 X135.815 Y134.633 E.01373
G1 X118.549 Y117.367 E.61425
G1 X118.003 Y117.367 E.01373
G1 X135.269 Y134.633 E.61425
G1 X134.723 Y134.633 E.01373
G1 X117.457 Y117.367 E.61425
G1 X116.911 Y117.367 E.01373
G1 X134.178 Y134.633 E.61425
G1 X133.632 Y134.633 E.01373
G1 X116.366 Y117.367 E.61425
G1 X115.82 Y117.367 E.01373
G1 X133.086 Y134.633 E.61425
G1 X132.541 Y134.633 E.01373
G1 X115.274 Y117.367 E.61425
G1 X114.729 Y117.367 E.01373
G1 X131.995 Y134.633 E.61425
G1 X131.449 Y134.633 E.01373
G1 X114.183 Y117.367 E.61425
G1 X113.637 Y117.367 E.01373
G1 X130.903 Y134.633 E.61425
G1 X130.358 Y134.633 E.01373
G1 X113.091 Y117.367 E.61425
G1 X112.546 Y117.367 E.01373
G1 X129.812 Y134.633 E.61425
G1 X129.266 Y134.633 E.01373
G1 X112 Y117.367 E.61425
M73 P51 R7
G1 X111.454 Y117.367 E.01373
G1 X128.721 Y134.633 E.61425
G1 X128.175 Y134.633 E.01373
G1 X110.909 Y117.367 E.61425
G1 X110.363 Y117.367 E.01373
G1 X127.629 Y134.633 E.61425
G1 X127.083 Y134.633 E.01373
G1 X109.817 Y117.367 E.61425
G1 X109.271 Y117.367 E.01373
G1 X126.538 Y134.633 E.61425
G1 X125.992 Y134.633 E.01373
G1 X108.726 Y117.367 E.61425
G1 X108.18 Y117.367 E.01373
G1 X125.446 Y134.633 E.61425
G1 X124.901 Y134.633 E.01373
G1 X107.634 Y117.367 E.61425
G1 X107.089 Y117.367 E.01373
G1 X124.355 Y134.633 E.61425
G1 X123.809 Y134.633 E.01373
G1 X106.543 Y117.367 E.61425
G1 X105.997 Y117.367 E.01373
G1 X123.263 Y134.633 E.61425
G1 X122.718 Y134.633 E.01373
G1 X105.451 Y117.367 E.61425
G1 X105.367 Y117.367 E.00213
G1 X105.367 Y117.828 E.0116
G1 X122.172 Y134.633 E.59785
G1 X121.626 Y134.633 E.01373
G1 X105.367 Y118.374 E.57843
G1 X105.367 Y118.919 E.01373
G1 X121.081 Y134.633 E.55902
G1 X120.535 Y134.633 E.01373
G1 X105.367 Y119.465 E.5396
G1 X105.367 Y120.011 E.01373
G1 X119.989 Y134.633 E.52019
G1 X119.443 Y134.633 E.01373
G1 X105.367 Y120.557 E.50078
G1 X105.367 Y121.102 E.01373
G1 X118.898 Y134.633 E.48136
G1 X118.352 Y134.633 E.01373
G1 X105.367 Y121.648 E.46195
G1 X105.367 Y122.194 E.01373
G1 X117.806 Y134.633 E.44253
G1 X117.261 Y134.633 E.01373
G1 X105.367 Y122.739 E.42312
G1 X105.367 Y123.285 E.01373
G1 X116.715 Y134.633 E.40371
G1 X116.169 Y134.633 E.01373
G1 X105.367 Y123.831 E.38429
G1 X105.367 Y124.377 E.01373
G1 X115.623 Y134.633 E.36488
G1 X115.078 Y134.633 E.01373
G1 X105.367 Y124.922 E.34546
G1 X105.367 Y125.468 E.01373
G1 X114.532 Y134.633 E.32605
G1 X113.986 Y134.633 E.01373
G1 X105.367 Y126.014 E.30664
G1 X105.367 Y126.559 E.01373
G1 X113.441 Y134.633 E.28722
G1 X112.895 Y134.633 E.01373
G1 X105.367 Y127.105 E.26781
G1 X105.367 Y127.651 E.01373
G1 X112.349 Y134.633 E.24839
G1 X111.803 Y134.633 E.01373
G1 X105.367 Y128.197 E.22898
G1 X105.367 Y128.742 E.01373
G1 X111.258 Y134.633 E.20957
G1 X110.712 Y134.633 E.01373
G1 X105.367 Y129.288 E.19015
G1 X105.367 Y129.834 E.01373
G1 X110.166 Y134.633 E.17074
G1 X109.621 Y134.633 E.01373
M73 P52 R7
G1 X105.367 Y130.379 E.15132
G1 X105.367 Y130.925 E.01373
G1 X109.075 Y134.633 E.13191
G1 X108.529 Y134.633 E.01373
G1 X105.367 Y131.471 E.1125
G1 X105.367 Y132.017 E.01373
G1 X107.983 Y134.633 E.09308
G1 X107.438 Y134.633 E.01373
G1 X105.367 Y132.562 E.07367
G1 X105.367 Y133.108 E.01373
G1 X106.892 Y134.633 E.05425
G1 X106.346 Y134.633 E.01373
G1 X105.367 Y133.654 E.03484
G1 X105.367 Y134.2 E.01373
G1 X105.974 Y134.807 E.0216
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11661.657
G1 X105.367 Y134.2 E-.3263
G1 X105.367 Y133.654 E-.20737
G1 X105.788 Y134.075 E-.22632
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/45
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.24 I-.024 J1.217 P1  F30000
G1 X150.974 Y134.974 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X105.026 Y134.974 E1.24504
G1 X105.026 Y117.026 E.48632
G1 X150.974 Y117.026 E1.24504
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X104.611 Y135.389 E1.26757
G1 X104.611 Y116.611 E.50885
G1 X151.389 Y116.611 E1.26757
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X104.21 Y135.79 E1.19623
G1 X104.21 Y116.21 E.49227
G1 X151.79 Y116.21 E1.19623
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.955 Y134.805 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.618 Y134.142 E.02542
G1 X150.618 Y133.547 E.01611
G1 X149.547 Y134.618 E.04104
G1 X148.953 Y134.618 E.01611
G1 X150.618 Y132.953 E.06382
G1 X150.618 Y132.358 E.01611
G1 X148.358 Y134.618 E.08661
G1 X147.763 Y134.618 E.01611
G1 X150.618 Y131.763 E.10939
G1 X150.618 Y131.169 E.01611
G1 X147.169 Y134.618 E.13218
G1 X146.574 Y134.618 E.01611
G1 X150.618 Y130.574 E.15497
G1 X150.618 Y129.98 E.01611
G1 X145.98 Y134.618 E.17775
G1 X145.385 Y134.618 E.01611
G1 X150.618 Y129.385 E.20054
G1 X150.618 Y128.791 E.01611
G1 X144.791 Y134.618 E.22332
G1 X144.196 Y134.618 E.01611
G1 X150.618 Y128.196 E.24611
G1 X150.618 Y127.601 E.01611
G1 X143.601 Y134.618 E.26889
G1 X143.007 Y134.618 E.01611
G1 X150.618 Y127.007 E.29168
G1 X150.618 Y126.412 E.01611
G1 X142.412 Y134.618 E.31446
G1 X141.818 Y134.618 E.01611
G1 X150.618 Y125.818 E.33725
G1 X150.618 Y125.223 E.01611
G1 X141.223 Y134.618 E.36003
G1 X140.628 Y134.618 E.01611
G1 X150.618 Y124.628 E.38282
G1 X150.618 Y124.034 E.01611
G1 X140.034 Y134.618 E.4056
G1 X139.439 Y134.618 E.01611
G1 X150.618 Y123.439 E.42839
G1 X150.618 Y122.845 E.01611
G1 X138.845 Y134.618 E.45118
G1 X138.25 Y134.618 E.01611
G1 X150.618 Y122.25 E.47396
G1 X150.618 Y121.655 E.01611
G1 X137.655 Y134.618 E.49675
G1 X137.061 Y134.618 E.01611
G1 X150.618 Y121.061 E.51953
G1 X150.618 Y120.466 E.01611
G1 X136.466 Y134.618 E.54232
G1 X135.872 Y134.618 E.01611
G1 X150.618 Y119.872 E.5651
G1 X150.618 Y119.277 E.01611
G1 X135.277 Y134.618 E.58789
G1 X134.682 Y134.618 E.01611
G1 X150.618 Y118.682 E.61067
G1 X150.618 Y118.088 E.01611
G1 X134.088 Y134.618 E.63346
G1 X133.493 Y134.618 E.01611
G1 X150.618 Y117.493 E.65624
G1 X150.618 Y117.382 E.00302
G1 X150.135 Y117.382 E.01309
G1 X132.899 Y134.618 E.66051
G1 X132.304 Y134.618 E.01611
G1 X149.54 Y117.382 E.66051
G1 X148.946 Y117.382 E.01611
G1 X131.709 Y134.618 E.66051
G1 X131.115 Y134.618 E.01611
G1 X148.351 Y117.382 E.66051
G1 X147.757 Y117.382 E.01611
G1 X130.52 Y134.618 E.66051
G1 X129.926 Y134.618 E.01611
G1 X147.162 Y117.382 E.66051
G1 X146.567 Y117.382 E.01611
G1 X129.331 Y134.618 E.66051
G1 X128.737 Y134.618 E.01611
G1 X145.973 Y117.382 E.66051
G1 X145.378 Y117.382 E.01611
G1 X128.142 Y134.618 E.66051
G1 X127.547 Y134.618 E.01611
G1 X144.784 Y117.382 E.66051
G1 X144.189 Y117.382 E.01611
G1 X126.953 Y134.618 E.66051
G1 X126.358 Y134.618 E.01611
G1 X143.594 Y117.382 E.66051
G1 X143 Y117.382 E.01611
G1 X125.764 Y134.618 E.66051
G1 X125.169 Y134.618 E.01611
G1 X142.405 Y117.382 E.66051
G1 X141.811 Y117.382 E.01611
G1 X124.574 Y134.618 E.66051
G1 X123.98 Y134.618 E.01611
G1 X141.216 Y117.382 E.66051
G1 X140.622 Y117.382 E.01611
G1 X123.385 Y134.618 E.66051
G1 X122.791 Y134.618 E.01611
G1 X140.027 Y117.382 E.66051
G1 X139.432 Y117.382 E.01611
G1 X122.196 Y134.618 E.66051
G1 X121.601 Y134.618 E.01611
G1 X138.838 Y117.382 E.66051
G1 X138.243 Y117.382 E.01611
G1 X121.007 Y134.618 E.66051
G1 X120.412 Y134.618 E.01611
M73 P53 R7
G1 X137.649 Y117.382 E.66051
G1 X137.054 Y117.382 E.01611
G1 X119.818 Y134.618 E.66051
G1 X119.223 Y134.618 E.01611
G1 X136.459 Y117.382 E.66051
G1 X135.865 Y117.382 E.01611
G1 X118.628 Y134.618 E.66051
G1 X118.189 Y134.618 E.01191
G1 X118.189 Y134.463 E.0042
G1 X135.27 Y117.382 E.65457
G1 X134.676 Y117.382 E.01611
G1 X118.189 Y133.869 E.63179
G1 X118.189 Y133.274 E.01611
G1 X134.081 Y117.382 E.609
G1 X133.486 Y117.382 E.01611
G1 X118.189 Y132.679 E.58622
G1 X118.189 Y132.085 E.01611
G1 X132.892 Y117.382 E.56343
G1 X132.297 Y117.382 E.01611
G1 X118.189 Y131.49 E.54065
G1 X118.189 Y130.896 E.01611
G1 X131.703 Y117.382 E.51786
G1 X131.108 Y117.382 E.01611
G1 X118.189 Y130.301 E.49508
G1 X118.189 Y129.706 E.01611
G1 X130.513 Y117.382 E.47229
G1 X129.919 Y117.382 E.01611
G1 X118.189 Y129.112 E.4495
G1 X118.189 Y128.517 E.01611
G1 X129.324 Y117.382 E.42672
G1 X128.73 Y117.382 E.01611
G1 X118.189 Y127.923 E.40393
G1 X118.189 Y127.328 E.01611
G1 X128.135 Y117.382 E.38115
G1 X127.54 Y117.382 E.01611
G1 X118.189 Y126.733 E.35836
G1 X118.189 Y126.139 E.01611
G1 X126.946 Y117.382 E.33558
G1 X126.351 Y117.382 E.01611
G1 X118.189 Y125.544 E.31279
G1 X118.189 Y124.95 E.01611
G1 X125.757 Y117.382 E.29001
G1 X125.162 Y117.382 E.01611
G1 X118.189 Y124.355 E.26722
G1 X118.189 Y123.76 E.01611
G1 X124.568 Y117.382 E.24444
G1 X123.973 Y117.382 E.01611
G1 X118.189 Y123.166 E.22165
G1 X118.189 Y122.571 E.01611
G1 X123.378 Y117.382 E.19887
G1 X122.784 Y117.382 E.01611
G1 X118.189 Y121.977 E.17608
G1 X118.189 Y121.382 E.01611
G1 X122.189 Y117.382 E.15329
G1 X121.595 Y117.382 E.01611
G1 X118.189 Y120.788 E.13051
G1 X118.189 Y120.193 E.01611
G1 X121 Y117.382 E.10772
G1 X120.405 Y117.382 E.01611
G1 X118.189 Y119.598 E.08494
G1 X118.189 Y119.004 E.01611
G1 X119.811 Y117.382 E.06215
G1 X119.216 Y117.382 E.01611
G1 X118.189 Y118.409 E.03937
G1 X118.189 Y117.815 E.01611
G1 X118.809 Y117.195 E.02375
G1 X105.985 Y117.193 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F11508.067
G1 X105.367 Y117.811 E.02227
G1 X105.367 Y118.364 E.0141
G1 X106.364 Y117.367 E.03595
G1 X106.917 Y117.367 E.0141
G1 X105.367 Y118.917 E.05588
G1 X105.367 Y119.47 E.0141
G1 X107.47 Y117.367 E.07582
G1 X108.023 Y117.367 E.0141
G1 X105.367 Y120.023 E.09575
G1 X105.367 Y120.576 E.0141
G1 X108.576 Y117.367 E.11569
G1 X109.129 Y117.367 E.0141
G1 X105.367 Y121.129 E.13562
G1 X105.367 Y121.682 E.0141
G1 X109.682 Y117.367 E.15556
G1 X110.235 Y117.367 E.0141
G1 X105.367 Y122.235 E.1755
G1 X105.367 Y122.788 E.0141
G1 X110.788 Y117.367 E.19543
G1 X111.341 Y117.367 E.0141
G1 X105.367 Y123.341 E.21537
G1 X105.367 Y123.894 E.0141
G1 X111.894 Y117.367 E.2353
G1 X112.447 Y117.367 E.0141
G1 X105.367 Y124.447 E.25524
G1 X105.367 Y125 E.0141
G1 X113 Y117.367 E.27517
G1 X113.553 Y117.367 E.0141
G1 X105.367 Y125.553 E.29511
G1 X105.367 Y126.106 E.0141
G1 X114.106 Y117.367 E.31505
G1 X114.659 Y117.367 E.0141
G1 X105.367 Y126.659 E.33498
G1 X105.367 Y127.212 E.0141
G1 X115.212 Y117.367 E.35492
G1 X115.765 Y117.367 E.0141
G1 X105.367 Y127.765 E.37485
G1 X105.367 Y128.318 E.0141
G1 X116.318 Y117.367 E.39479
G1 X116.871 Y117.367 E.0141
G1 X105.367 Y128.871 E.41472
G1 X105.367 Y129.424 E.0141
G1 X117.424 Y117.367 E.43466
G1 X117.788 Y117.367 E.00928
G1 X117.788 Y117.556 E.00481
G1 X105.367 Y129.977 E.44779
G1 X105.367 Y130.53 E.0141
G1 X117.788 Y118.109 E.44779
G1 X117.788 Y118.662 E.0141
G1 X105.367 Y131.083 E.44779
G1 X105.367 Y131.636 E.0141
G1 X117.788 Y119.215 E.44779
G1 X117.788 Y119.768 E.0141
G1 X105.367 Y132.189 E.44779
G1 X105.367 Y132.742 E.0141
G1 X117.788 Y120.321 E.44779
G1 X117.788 Y120.874 E.0141
G1 X105.367 Y133.295 E.44779
G1 X105.367 Y133.848 E.0141
G1 X117.788 Y121.427 E.44779
G1 X117.788 Y121.98 E.0141
G1 X105.367 Y134.401 E.44779
G1 X105.367 Y134.633 E.00592
G1 X105.688 Y134.633 E.00818
G1 X117.788 Y122.533 E.43622
G1 X117.788 Y123.086 E.0141
G1 X106.241 Y134.633 E.41629
G1 X106.794 Y134.633 E.0141
G1 X117.788 Y123.639 E.39635
G1 X117.788 Y124.192 E.0141
G1 X107.347 Y134.633 E.37641
G1 X107.9 Y134.633 E.0141
G1 X117.788 Y124.745 E.35648
G1 X117.788 Y125.298 E.0141
G1 X108.453 Y134.633 E.33654
G1 X109.006 Y134.633 E.0141
G1 X117.788 Y125.851 E.31661
G1 X117.788 Y126.404 E.0141
G1 X109.559 Y134.633 E.29667
G1 X110.112 Y134.633 E.0141
G1 X117.788 Y126.957 E.27674
G1 X117.788 Y127.51 E.0141
G1 X110.665 Y134.633 E.2568
G1 X111.218 Y134.633 E.0141
G1 X117.788 Y128.063 E.23687
G1 X117.788 Y128.616 E.0141
G1 X111.771 Y134.633 E.21693
G1 X112.324 Y134.633 E.0141
G1 X117.788 Y129.169 E.19699
G1 X117.788 Y129.722 E.0141
G1 X112.877 Y134.633 E.17706
G1 X113.43 Y134.633 E.0141
G1 X117.788 Y130.275 E.15712
G1 X117.788 Y130.828 E.0141
G1 X113.983 Y134.633 E.13719
G1 X114.536 Y134.633 E.0141
G1 X117.788 Y131.381 E.11725
G1 X117.788 Y131.934 E.0141
G1 X115.089 Y134.633 E.09732
G1 X115.642 Y134.633 E.0141
G1 X117.788 Y132.487 E.07738
G1 X117.788 Y133.04 E.0141
G1 X116.195 Y134.633 E.05744
G1 X116.748 Y134.633 E.0141
M73 P54 R7
G1 X117.788 Y133.593 E.03751
G1 X117.788 Y134.146 E.0141
G1 X117.127 Y134.807 E.02383
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X117.788 Y134.146 E-.35523
G1 X117.788 Y133.593 E-.21014
G1 X117.426 Y133.955 E-.19463
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/45
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.4 I-.037 J1.216 P1  F30000
G1 X150.974 Y134.974 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X117.752 Y134.974 E.9002
G1 X117.752 Y117.026 E.48632
G1 X150.974 Y117.026 E.9002
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X117.337 Y135.389 E.92273
G1 X117.337 Y116.611 E.50885
G1 X151.389 Y116.611 E.92273
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X104.21 Y135.79 E1.19623
G1 X104.21 Y116.21 E.49227
G1 X151.79 Y116.21 E1.19623
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.227 Y128.113 Z1.56 F30000
G1 X150.805 Y118.035 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.152 Y117.382 E.02505
G1 X149.563 Y117.382 E.01594
G1 X150.618 Y118.437 E.04042
G1 X150.618 Y119.025 E.01594
G1 X148.975 Y117.382 E.06296
G1 X148.387 Y117.382 E.01594
G1 X150.618 Y119.613 E.08549
G1 X150.618 Y120.201 E.01594
G1 X147.799 Y117.382 E.10803
G1 X147.211 Y117.382 E.01594
G1 X150.618 Y120.789 E.13057
G1 X150.618 Y121.377 E.01594
G1 X146.623 Y117.382 E.1531
G1 X146.035 Y117.382 E.01594
G1 X150.618 Y121.965 E.17564
G1 X150.618 Y122.553 E.01594
G1 X145.447 Y117.382 E.19818
G1 X144.859 Y117.382 E.01594
G1 X150.618 Y123.141 E.22072
G1 X150.618 Y123.73 E.01594
G1 X144.27 Y117.382 E.24325
G1 X143.682 Y117.382 E.01594
G1 X150.618 Y124.318 E.26579
G1 X150.618 Y124.906 E.01594
G1 X143.094 Y117.382 E.28833
G1 X142.506 Y117.382 E.01594
G1 X150.618 Y125.494 E.31086
G1 X150.618 Y126.082 E.01594
G1 X141.918 Y117.382 E.3334
G1 X141.33 Y117.382 E.01594
G1 X150.618 Y126.67 E.35594
G1 X150.618 Y127.258 E.01594
G1 X140.742 Y117.382 E.37848
G1 X140.154 Y117.382 E.01594
G1 X150.618 Y127.846 E.40101
G1 X150.618 Y128.435 E.01594
G1 X139.565 Y117.382 E.42355
G1 X138.977 Y117.382 E.01594
G1 X150.618 Y129.023 E.44609
G1 X150.618 Y129.611 E.01594
G1 X138.389 Y117.382 E.46862
G1 X137.801 Y117.382 E.01594
G1 X150.618 Y130.199 E.49116
G1 X150.618 Y130.787 E.01594
G1 X137.213 Y117.382 E.5137
G1 X136.625 Y117.382 E.01594
G1 X150.618 Y131.375 E.53624
G1 X150.618 Y131.963 E.01594
G1 X136.037 Y117.382 E.55877
G1 X135.449 Y117.382 E.01594
G1 X150.618 Y132.551 E.58131
G1 X150.618 Y133.139 E.01594
G1 X134.861 Y117.382 E.60385
G1 X134.272 Y117.382 E.01594
G1 X150.618 Y133.728 E.62638
G1 X150.618 Y134.316 E.01594
G1 X133.684 Y117.382 E.64892
G1 X133.096 Y117.382 E.01594
G1 X150.333 Y134.618 E.66051
G1 X149.744 Y134.618 E.01594
G1 X132.508 Y117.382 E.66051
G1 X131.92 Y117.382 E.01594
G1 X149.156 Y134.618 E.66051
G1 X148.568 Y134.618 E.01594
G1 X131.332 Y117.382 E.66051
G1 X130.744 Y117.382 E.01594
G1 X147.98 Y134.618 E.66051
G1 X147.392 Y134.618 E.01594
G1 X130.156 Y117.382 E.66051
G1 X129.568 Y117.382 E.01594
G1 X146.804 Y134.618 E.66051
G1 X146.216 Y134.618 E.01594
G1 X128.979 Y117.382 E.66051
G1 X128.391 Y117.382 E.01594
G1 X145.628 Y134.618 E.66051
G1 X145.04 Y134.618 E.01594
G1 X127.803 Y117.382 E.66051
G1 X127.215 Y117.382 E.01594
G1 X144.451 Y134.618 E.66051
G1 X143.863 Y134.618 E.01594
G1 X126.627 Y117.382 E.66051
G1 X126.039 Y117.382 E.01594
G1 X143.275 Y134.618 E.66051
G1 X142.687 Y134.618 E.01594
G1 X125.451 Y117.382 E.66051
G1 X124.863 Y117.382 E.01594
G1 X142.099 Y134.618 E.66051
G1 X141.511 Y134.618 E.01594
G1 X124.275 Y117.382 E.66051
G1 X123.686 Y117.382 E.01594
G1 X140.923 Y134.618 E.66051
G1 X140.335 Y134.618 E.01594
G1 X123.098 Y117.382 E.66051
G1 X122.51 Y117.382 E.01594
G1 X139.746 Y134.618 E.66051
G1 X139.158 Y134.618 E.01594
G1 X121.922 Y117.382 E.66051
G1 X121.334 Y117.382 E.01594
G1 X138.57 Y134.618 E.66051
G1 X137.982 Y134.618 E.01594
G1 X120.746 Y117.382 E.66051
G1 X120.158 Y117.382 E.01594
G1 X137.394 Y134.618 E.66051
G1 X136.806 Y134.618 E.01594
G1 X119.57 Y117.382 E.66051
G1 X118.981 Y117.382 E.01594
G1 X136.218 Y134.618 E.66051
G1 X135.63 Y134.618 E.01594
G1 X118.393 Y117.382 E.66051
G1 X118.108 Y117.382 E.00774
G1 X118.108 Y117.684 E.0082
G1 X135.042 Y134.618 E.64892
G1 X134.453 Y134.618 E.01594
G1 X118.108 Y118.273 E.62638
G1 X118.108 Y118.861 E.01594
M73 P55 R7
G1 X133.865 Y134.618 E.60384
G1 X133.277 Y134.618 E.01594
G1 X118.108 Y119.449 E.58131
G1 X118.108 Y120.037 E.01594
G1 X132.689 Y134.618 E.55877
G1 X132.101 Y134.618 E.01594
G1 X118.108 Y120.625 E.53623
G1 X118.108 Y121.213 E.01594
G1 X131.513 Y134.618 E.5137
G1 X130.925 Y134.618 E.01594
G1 X118.108 Y121.801 E.49116
G1 X118.108 Y122.389 E.01594
G1 X130.337 Y134.618 E.46862
G1 X129.749 Y134.618 E.01594
G1 X118.108 Y122.977 E.44608
G1 X118.108 Y123.566 E.01594
G1 X129.16 Y134.618 E.42355
G1 X128.572 Y134.618 E.01594
G1 X118.108 Y124.154 E.40101
G1 X118.108 Y124.742 E.01594
G1 X127.984 Y134.618 E.37847
G1 X127.396 Y134.618 E.01594
G1 X118.108 Y125.33 E.35594
G1 X118.108 Y125.918 E.01594
G1 X126.808 Y134.618 E.3334
G1 X126.22 Y134.618 E.01594
G1 X118.108 Y126.506 E.31086
G1 X118.108 Y127.094 E.01594
G1 X125.632 Y134.618 E.28832
G1 X125.044 Y134.618 E.01594
G1 X118.108 Y127.682 E.26579
G1 X118.108 Y128.27 E.01594
G1 X124.455 Y134.618 E.24325
G1 X123.867 Y134.618 E.01594
G1 X118.108 Y128.859 E.22071
G1 X118.108 Y129.447 E.01594
G1 X123.279 Y134.618 E.19818
G1 X122.691 Y134.618 E.01594
G1 X118.108 Y130.035 E.17564
G1 X118.108 Y130.623 E.01594
G1 X122.103 Y134.618 E.1531
G1 X121.515 Y134.618 E.01594
G1 X118.108 Y131.211 E.13056
G1 X118.108 Y131.799 E.01594
G1 X120.927 Y134.618 E.10803
G1 X120.339 Y134.618 E.01594
G1 X118.108 Y132.387 E.08549
G1 X118.108 Y132.975 E.01594
G1 X119.751 Y134.618 E.06295
G1 X119.162 Y134.618 E.01594
G1 X118.108 Y133.563 E.04042
G1 X118.108 Y134.152 E.01594
G1 X118.761 Y134.805 E.02505
; WIPE_START
G1 X118.108 Y134.152 E-.35124
G1 X118.108 Y133.563 E-.22348
G1 X118.453 Y133.908 E-.18528
; WIPE_END
G1 E-.04 F1800
G1 X117.847 Y126.3 Z1.56 F30000
G1 X117.109 Y117.018 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X116.513 Y116.422 E.0212
G1 X115.968 Y116.422
G1 X117.109 Y117.564 E.04059
G1 X117.109 Y118.109
G1 X115.422 Y116.422 E.05999
G1 X114.877 Y116.422
G1 X117.109 Y118.655 E.07938
G1 X117.109 Y119.2
G1 X114.331 Y116.422 E.09877
G1 X113.786 Y116.422
G1 X117.109 Y119.745 E.11816
G1 X117.109 Y120.291
G1 X113.241 Y116.422 E.13755
G1 X112.695 Y116.422
G1 X117.109 Y120.836 E.15695
G1 X117.109 Y121.382
G1 X112.15 Y116.422 E.17634
G1 X111.604 Y116.422
G1 X117.109 Y121.927 E.19573
G1 X117.109 Y122.472
G1 X111.059 Y116.422 E.21512
G1 X110.514 Y116.422
G1 X117.109 Y123.018 E.23451
G1 X117.109 Y123.563
G1 X109.968 Y116.422 E.25391
G1 X109.423 Y116.422
G1 X117.109 Y124.109 E.2733
G1 X117.109 Y124.654
G1 X108.877 Y116.422 E.29269
G1 X108.332 Y116.422
G1 X117.109 Y125.199 E.31208
G1 X117.109 Y125.745
G1 X107.787 Y116.422 E.33147
G1 X107.241 Y116.422
G1 X117.109 Y126.29 E.35087
G1 X117.109 Y126.836
G1 X106.696 Y116.422 E.37026
G1 X106.15 Y116.422
G1 X117.109 Y127.381 E.38965
G1 X117.109 Y127.927
G1 X105.605 Y116.422 E.40904
G1 X105.06 Y116.422
G1 X117.109 Y128.472 E.42843
G1 X117.109 Y129.017
G1 X104.514 Y116.422 E.44783
G1 X104.422 Y116.875
G1 X117.109 Y129.563 E.4511
G1 X117.109 Y130.108
G1 X104.422 Y117.421 E.4511
G1 X104.422 Y117.966
G1 X117.109 Y130.654 E.4511
G1 X117.109 Y131.199
G1 X104.422 Y118.512 E.4511
G1 X104.422 Y119.057
G1 X117.109 Y131.744 E.4511
G1 X117.109 Y132.29
G1 X104.422 Y119.602 E.4511
G1 X104.422 Y120.148
G1 X117.109 Y132.835 E.4511
G1 X117.109 Y133.381
G1 X104.422 Y120.693 E.4511
G1 X104.422 Y121.239
G1 X117.109 Y133.926 E.4511
G1 X117.109 Y134.471
G1 X104.422 Y121.784 E.4511
G1 X104.422 Y122.329
G1 X117.109 Y135.017 E.4511
G1 X117.109 Y135.562
G1 X104.422 Y122.875 E.4511
G1 X104.422 Y123.42
G1 X116.58 Y135.578 E.43227
G1 X116.034 Y135.578
G1 X104.422 Y123.966 E.41288
G1 X104.422 Y124.511
G1 X115.489 Y135.578 E.39348
G1 X114.944 Y135.578
G1 X104.422 Y125.056 E.37409
G1 X104.422 Y125.602
G1 X114.398 Y135.578 E.3547
G1 X113.853 Y135.578
G1 X104.422 Y126.147 E.33531
G1 X104.422 Y126.693
G1 X113.307 Y135.578 E.31592
G1 X112.762 Y135.578
G1 X104.422 Y127.238 E.29652
G1 X104.422 Y127.784
G1 X112.216 Y135.578 E.27713
G1 X111.671 Y135.578
G1 X104.422 Y128.329 E.25774
G1 X104.422 Y128.874
G1 X111.126 Y135.578 E.23835
G1 X110.58 Y135.578
G1 X104.422 Y129.42 E.21895
G1 X104.422 Y129.965
G1 X110.035 Y135.578 E.19956
M73 P56 R7
G1 X109.489 Y135.578
G1 X104.422 Y130.511 E.18017
G1 X104.422 Y131.056
G1 X108.944 Y135.578 E.16078
G1 X108.399 Y135.578
G1 X104.422 Y131.601 E.14139
G1 X104.422 Y132.147
G1 X107.853 Y135.578 E.12199
G1 X107.308 Y135.578
G1 X104.422 Y132.692 E.1026
G1 X104.422 Y133.238
G1 X106.762 Y135.578 E.08321
G1 X106.217 Y135.578
G1 X104.422 Y133.783 E.06382
G1 X104.422 Y134.328
G1 X105.672 Y135.578 E.04443
G1 X105.126 Y135.578
G1 X104.422 Y134.874 E.02503
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S10000
G1 X105.126 Y135.578 E-.37839
G1 X105.672 Y135.578 E-.20725
G1 X105.347 Y135.253 E-.17436
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/45
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.56 I.007 J1.217 P1  F30000
G1 X150.974 Y134.974 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X117.026 Y134.974 E.91988
G1 X117.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.91988
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X116.611 Y135.389 E.9424
G1 X116.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.9424
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X116.21 Y135.79 E.89453
G1 X116.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.89453
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.957 Y134.805 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.618 Y134.144 E.02532
G1 X150.618 Y133.551 E.01607
G1 X149.551 Y134.618 E.04088
G1 X148.958 Y134.618 E.01607
G1 X150.618 Y132.958 E.0636
G1 X150.618 Y132.366 E.01607
G1 X148.366 Y134.618 E.08632
G1 X147.773 Y134.618 E.01607
G1 X150.618 Y131.773 E.10904
G1 X150.618 Y131.18 E.01607
G1 X147.18 Y134.618 E.13176
G1 X146.587 Y134.618 E.01607
G1 X150.618 Y130.587 E.15449
G1 X150.618 Y129.994 E.01607
G1 X145.994 Y134.618 E.17721
G1 X145.401 Y134.618 E.01607
G1 X150.618 Y129.401 E.19993
G1 X150.618 Y128.808 E.01607
G1 X144.808 Y134.618 E.22265
G1 X144.215 Y134.618 E.01607
G1 X150.618 Y128.215 E.24537
G1 X150.618 Y127.622 E.01607
G1 X143.622 Y134.618 E.26809
G1 X143.029 Y134.618 E.01607
G1 X150.618 Y127.029 E.29081
G1 X150.618 Y126.436 E.01607
G1 X142.436 Y134.618 E.31354
G1 X141.843 Y134.618 E.01607
G1 X150.618 Y125.843 E.33626
G1 X150.618 Y125.25 E.01607
G1 X141.25 Y134.618 E.35898
G1 X140.658 Y134.618 E.01607
G1 X150.618 Y124.658 E.3817
G1 X150.618 Y124.065 E.01607
G1 X140.065 Y134.618 E.40442
G1 X139.472 Y134.618 E.01607
G1 X150.618 Y123.472 E.42714
G1 X150.618 Y122.879 E.01607
G1 X138.879 Y134.618 E.44986
G1 X138.286 Y134.618 E.01607
G1 X150.618 Y122.286 E.47259
G1 X150.618 Y121.693 E.01607
G1 X137.693 Y134.618 E.49531
G1 X137.1 Y134.618 E.01607
G1 X150.618 Y121.1 E.51803
G1 X150.618 Y120.507 E.01607
G1 X136.507 Y134.618 E.54075
G1 X135.914 Y134.618 E.01607
G1 X150.618 Y119.914 E.56347
G1 X150.618 Y119.321 E.01607
G1 X135.321 Y134.618 E.58619
G1 X134.728 Y134.618 E.01607
G1 X150.618 Y118.728 E.60891
G1 X150.618 Y118.135 E.01607
G1 X134.135 Y134.618 E.63164
G1 X133.542 Y134.618 E.01607
G1 X150.618 Y117.542 E.65436
G1 X150.618 Y117.382 E.00435
G1 X150.186 Y117.382 E.01171
G1 X132.95 Y134.618 E.66051
G1 X132.357 Y134.618 E.01607
G1 X149.593 Y117.382 E.66051
G1 X149 Y117.382 E.01607
G1 X131.764 Y134.618 E.66051
M73 P57 R7
G1 X131.171 Y134.618 E.01607
G1 X148.407 Y117.382 E.66051
G1 X147.814 Y117.382 E.01607
G1 X130.578 Y134.618 E.66051
G1 X130.189 Y134.618 E.01054
G1 X130.189 Y134.414 E.00553
G1 X147.221 Y117.382 E.6527
G1 X146.628 Y117.382 E.01607
G1 X130.189 Y133.821 E.62997
G1 X130.189 Y133.228 E.01607
G1 X146.035 Y117.382 E.60725
G1 X145.443 Y117.382 E.01607
G1 X130.189 Y132.635 E.58453
G1 X130.189 Y132.042 E.01607
G1 X144.85 Y117.382 E.56181
G1 X144.257 Y117.382 E.01607
G1 X130.189 Y131.45 E.53909
G1 X130.189 Y130.857 E.01607
G1 X143.664 Y117.382 E.51637
G1 X143.071 Y117.382 E.01607
G1 X130.189 Y130.264 E.49365
G1 X130.189 Y129.671 E.01607
G1 X142.478 Y117.382 E.47092
G1 X141.885 Y117.382 E.01607
G1 X130.189 Y129.078 E.4482
G1 X130.189 Y128.485 E.01607
G1 X141.292 Y117.382 E.42548
G1 X140.699 Y117.382 E.01607
G1 X130.189 Y127.892 E.40276
G1 X130.189 Y127.299 E.01607
G1 X140.106 Y117.382 E.38004
G1 X139.513 Y117.382 E.01607
G1 X130.189 Y126.706 E.35732
G1 X130.189 Y126.113 E.01607
G1 X138.92 Y117.382 E.3346
G1 X138.327 Y117.382 E.01607
G1 X130.189 Y125.52 E.31187
G1 X130.189 Y124.927 E.01607
G1 X137.735 Y117.382 E.28915
G1 X137.142 Y117.382 E.01607
G1 X130.189 Y124.334 E.26643
G1 X130.189 Y123.742 E.01607
G1 X136.549 Y117.382 E.24371
G1 X135.956 Y117.382 E.01607
G1 X130.189 Y123.149 E.22099
G1 X130.189 Y122.556 E.01607
G1 X135.363 Y117.382 E.19827
G1 X134.77 Y117.382 E.01607
G1 X130.189 Y121.963 E.17555
G1 X130.189 Y121.37 E.01607
G1 X134.177 Y117.382 E.15282
G1 X133.584 Y117.382 E.01607
G1 X130.189 Y120.777 E.1301
G1 X130.189 Y120.184 E.01607
G1 X132.991 Y117.382 E.10738
G1 X132.398 Y117.382 E.01607
G1 X130.189 Y119.591 E.08466
G1 X130.189 Y118.998 E.01607
G1 X131.805 Y117.382 E.06194
G1 X131.212 Y117.382 E.01607
G1 X130.189 Y118.405 E.03922
G1 X130.189 Y117.812 E.01607
G1 X130.806 Y117.195 E.02366
G1 X129.763 Y117.671 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.471146
G1 F10301.962
G1 X129.763 Y117.453 E.00622
G1 X129.326 Y117.453 E.01244
G1 X129.326 Y134.547 E.48679
G1 X129.763 Y134.547 E.01244
G1 X129.763 Y117.731 E.47886
G1 X128.943 Y117.195 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X128.308 Y117.83 E.02434
G1 X128.308 Y118.435 E.01639
G1 X128.9 Y117.843 E.02268
G1 X128.9 Y118.448 E.01639
G1 X128.308 Y119.039 E.02268
G1 X128.308 Y119.644 E.01639
G1 X128.9 Y119.052 E.02268
G1 X128.9 Y119.657 E.01639
G1 X128.308 Y120.249 E.02268
M73 P57 R6
G1 X128.308 Y120.853 E.01639
G1 X128.9 Y120.262 E.02268
G1 X128.9 Y120.866 E.01639
G1 X128.308 Y121.458 E.02268
G1 X128.308 Y122.063 E.01639
G1 X128.9 Y121.471 E.02268
G1 X128.9 Y122.076 E.01639
G1 X128.308 Y122.668 E.02268
G1 X128.308 Y123.272 E.01639
G1 X128.9 Y122.681 E.02268
G1 X128.9 Y123.285 E.01639
G1 X128.308 Y123.877 E.02268
G1 X128.308 Y124.482 E.01639
G1 X128.9 Y123.89 E.02268
G1 X128.9 Y124.495 E.01639
G1 X128.308 Y125.086 E.02268
G1 X128.308 Y125.691 E.01639
G1 X128.9 Y125.099 E.02268
G1 X128.9 Y125.704 E.01639
G1 X128.308 Y126.296 E.02268
G1 X128.308 Y126.901 E.01639
G1 X128.9 Y126.309 E.02268
G1 X128.9 Y126.914 E.01639
G1 X128.308 Y127.505 E.02268
G1 X128.308 Y128.11 E.01639
G1 X128.9 Y127.518 E.02268
G1 X128.9 Y128.123 E.01639
G1 X128.308 Y128.715 E.02268
G1 X128.308 Y129.319 E.01639
G1 X128.9 Y128.728 E.02268
G1 X128.9 Y129.332 E.01639
G1 X128.308 Y129.924 E.02268
G1 X128.308 Y130.529 E.01639
G1 X128.9 Y129.937 E.02268
G1 X128.9 Y130.542 E.01639
G1 X128.308 Y131.134 E.02268
G1 X128.308 Y131.738 E.01639
G1 X128.9 Y131.147 E.02268
G1 X128.9 Y131.751 E.01639
G1 X128.308 Y132.343 E.02268
G1 X128.308 Y132.948 E.01639
G1 X128.9 Y132.356 E.02268
G1 X128.9 Y132.961 E.01639
G1 X128.308 Y133.553 E.02268
G1 X128.308 Y134.157 E.01639
G1 X128.9 Y133.565 E.02268
G1 X128.9 Y134.17 E.01639
G1 X128.265 Y134.805 E.02433
G1 X127.253 Y134.807 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422356
G1 F11597.34
G1 X127.907 Y134.152 E.02342
G1 X127.907 Y133.603 E.01388
G1 X126.878 Y134.633 E.03684
G1 X126.329 Y134.633 E.01388
G1 X127.907 Y133.055 E.05647
G1 X127.907 Y132.506 E.01388
G1 X125.78 Y134.633 E.0761
G1 X125.231 Y134.633 E.01388
G1 X127.907 Y131.957 E.09573
G1 X127.907 Y131.408 E.01388
G1 X124.683 Y134.633 E.11536
G1 X124.134 Y134.633 E.01388
G1 X127.907 Y130.86 E.13499
G1 X127.907 Y130.311 E.01388
G1 X123.585 Y134.633 E.15462
G1 X123.036 Y134.633 E.01388
G1 X127.907 Y129.762 E.17425
G1 X127.907 Y129.214 E.01388
G1 X122.488 Y134.633 E.19388
G1 X121.939 Y134.633 E.01388
G1 X127.907 Y128.665 E.21351
G1 X127.907 Y128.116 E.01388
G1 X121.39 Y134.633 E.23314
G1 X120.841 Y134.633 E.01388
G1 X127.907 Y127.567 E.25277
G1 X127.907 Y127.019 E.01388
G1 X120.293 Y134.633 E.2724
G1 X119.744 Y134.633 E.01388
G1 X127.907 Y126.47 E.29203
G1 X127.907 Y125.921 E.01388
G1 X119.195 Y134.633 E.31166
G1 X118.646 Y134.633 E.01388
G1 X127.907 Y125.372 E.33129
G1 X127.907 Y124.824 E.01388
G1 X118.098 Y134.633 E.35092
G1 X117.549 Y134.633 E.01388
G1 X127.907 Y124.275 E.37055
G1 X127.907 Y123.726 E.01388
G1 X117.367 Y134.267 E.37707
G1 X117.367 Y133.718 E.01388
G1 X127.907 Y123.177 E.37707
G1 X127.907 Y122.629 E.01388
G1 X117.367 Y133.169 E.37707
G1 X117.367 Y132.621 E.01388
G1 X127.907 Y122.08 E.37707
G1 X127.907 Y121.531 E.01388
G1 X117.367 Y132.072 E.37707
G1 X117.367 Y131.523 E.01388
G1 X127.907 Y120.982 E.37707
G1 X127.907 Y120.434 E.01388
G1 X117.367 Y130.974 E.37707
G1 X117.367 Y130.426 E.01388
G1 X127.907 Y119.885 E.37707
G1 X127.907 Y119.336 E.01388
G1 X117.367 Y129.877 E.37707
G1 X117.367 Y129.328 E.01388
G1 X127.907 Y118.787 E.37707
G1 X127.907 Y118.239 E.01388
G1 X117.367 Y128.779 E.37707
G1 X117.367 Y128.231 E.01388
G1 X127.907 Y117.69 E.37707
G1 X127.907 Y117.367 E.00817
G1 X127.682 Y117.367 E.00571
G1 X117.367 Y127.682 E.369
G1 X117.367 Y127.133 E.01388
G1 X127.133 Y117.367 E.34937
G1 X126.584 Y117.367 E.01388
G1 X117.367 Y126.584 E.32974
G1 X117.367 Y126.036 E.01388
G1 X126.036 Y117.367 E.31011
G1 X125.487 Y117.367 E.01388
G1 X117.367 Y125.487 E.29048
G1 X117.367 Y124.938 E.01388
G1 X124.938 Y117.367 E.27085
G1 X124.389 Y117.367 E.01388
G1 X117.367 Y124.389 E.25122
G1 X117.367 Y123.841 E.01388
G1 X123.841 Y117.367 E.23159
G1 X123.292 Y117.367 E.01388
G1 X117.367 Y123.292 E.21196
G1 X117.367 Y122.743 E.01388
G1 X122.743 Y117.367 E.19233
G1 X122.194 Y117.367 E.01388
G1 X117.367 Y122.194 E.1727
G1 X117.367 Y121.646 E.01388
G1 X121.646 Y117.367 E.15307
G1 X121.097 Y117.367 E.01388
G1 X117.367 Y121.097 E.13344
G1 X117.367 Y120.548 E.01388
G1 X120.548 Y117.367 E.11381
G1 X119.999 Y117.367 E.01388
G1 X117.367 Y119.999 E.09418
G1 X117.367 Y119.451 E.01388
G1 X119.451 Y117.367 E.07455
G1 X118.902 Y117.367 E.01388
G1 X117.367 Y118.902 E.05492
G1 X117.367 Y118.353 E.01388
G1 X118.353 Y117.367 E.03529
G1 X117.804 Y117.367 E.01388
G1 X117.193 Y117.978 E.02187
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11597.34
G1 X117.804 Y117.367 E-.3285
G1 X118.353 Y117.367 E-.20852
G1 X117.938 Y117.782 E-.22298
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/45
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.72 I-.562 J1.08 P1  F30000
G1 X150.974 Y134.974 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X117.026 Y134.974 E.91988
M73 P58 R6
G1 X117.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.91988
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X116.611 Y135.389 E.9424
G1 X116.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.9424
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X116.21 Y135.79 E.89453
G1 X116.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.89453
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.227 Y128.113 Z1.88 F30000
G1 X150.805 Y118.043 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.144 Y117.382 E.02532
G1 X149.551 Y117.382 E.01607
G1 X150.618 Y118.449 E.04088
G1 X150.618 Y119.041 E.01607
G1 X148.958 Y117.382 E.0636
G1 X148.366 Y117.382 E.01607
G1 X150.618 Y119.634 E.08632
G1 X150.618 Y120.227 E.01607
G1 X147.773 Y117.382 E.10904
G1 X147.18 Y117.382 E.01607
G1 X150.618 Y120.82 E.13176
G1 X150.618 Y121.413 E.01607
G1 X146.587 Y117.382 E.15449
G1 X145.994 Y117.382 E.01607
G1 X150.618 Y122.006 E.17721
G1 X150.618 Y122.599 E.01607
G1 X145.401 Y117.382 E.19993
G1 X144.808 Y117.382 E.01607
G1 X150.618 Y123.192 E.22265
G1 X150.618 Y123.785 E.01607
G1 X144.215 Y117.382 E.24537
G1 X143.622 Y117.382 E.01607
G1 X150.618 Y124.378 E.26809
G1 X150.618 Y124.971 E.01607
G1 X143.029 Y117.382 E.29081
G1 X142.436 Y117.382 E.01607
G1 X150.618 Y125.564 E.31354
G1 X150.618 Y126.157 E.01607
G1 X141.843 Y117.382 E.33626
G1 X141.25 Y117.382 E.01607
G1 X150.618 Y126.75 E.35898
G1 X150.618 Y127.342 E.01607
G1 X140.658 Y117.382 E.3817
G1 X140.065 Y117.382 E.01607
G1 X150.618 Y127.935 E.40442
G1 X150.618 Y128.528 E.01607
G1 X139.472 Y117.382 E.42714
G1 X138.879 Y117.382 E.01607
G1 X150.618 Y129.121 E.44986
G1 X150.618 Y129.714 E.01607
G1 X138.286 Y117.382 E.47259
G1 X137.693 Y117.382 E.01607
G1 X150.618 Y130.307 E.49531
G1 X150.618 Y130.9 E.01607
G1 X137.1 Y117.382 E.51803
G1 X136.507 Y117.382 E.01607
G1 X150.618 Y131.493 E.54075
G1 X150.618 Y132.086 E.01607
G1 X135.914 Y117.382 E.56347
G1 X135.321 Y117.382 E.01607
G1 X150.618 Y132.679 E.58619
G1 X150.618 Y133.272 E.01607
G1 X134.728 Y117.382 E.60891
G1 X134.135 Y117.382 E.01607
G1 X150.618 Y133.865 E.63164
G1 X150.618 Y134.458 E.01607
G1 X133.542 Y117.382 E.65436
G1 X132.95 Y117.382 E.01607
G1 X150.186 Y134.618 E.66051
G1 X149.593 Y134.618 E.01607
G1 X132.357 Y117.382 E.66051
G1 X131.764 Y117.382 E.01607
G1 X149 Y134.618 E.66051
G1 X148.407 Y134.618 E.01607
G1 X131.171 Y117.382 E.66051
G1 X130.578 Y117.382 E.01607
G1 X147.814 Y134.618 E.66051
G1 X147.221 Y134.618 E.01607
G1 X130.189 Y117.586 E.6527
G1 X130.189 Y118.179 E.01607
G1 X146.628 Y134.618 E.62997
G1 X146.035 Y134.618 E.01607
G1 X130.189 Y118.772 E.60725
G1 X130.189 Y119.365 E.01607
G1 X145.443 Y134.618 E.58453
G1 X144.85 Y134.618 E.01607
G1 X130.189 Y119.958 E.56181
G1 X130.189 Y120.55 E.01607
G1 X144.257 Y134.618 E.53909
G1 X143.664 Y134.618 E.01607
G1 X130.189 Y121.143 E.51637
G1 X130.189 Y121.736 E.01607
G1 X143.071 Y134.618 E.49365
G1 X142.478 Y134.618 E.01607
G1 X130.189 Y122.329 E.47092
G1 X130.189 Y122.922 E.01607
G1 X141.885 Y134.618 E.4482
G1 X141.292 Y134.618 E.01607
G1 X130.189 Y123.515 E.42548
G1 X130.189 Y124.108 E.01607
G1 X140.699 Y134.618 E.40276
G1 X140.106 Y134.618 E.01607
G1 X130.189 Y124.701 E.38004
G1 X130.189 Y125.294 E.01607
G1 X139.513 Y134.618 E.35732
G1 X138.92 Y134.618 E.01607
G1 X130.189 Y125.887 E.3346
G1 X130.189 Y126.48 E.01607
G1 X138.327 Y134.618 E.31188
G1 X137.735 Y134.618 E.01607
G1 X130.189 Y127.073 E.28915
G1 X130.189 Y127.666 E.01607
G1 X137.142 Y134.618 E.26643
G1 X136.549 Y134.618 E.01607
G1 X130.189 Y128.258 E.24371
G1 X130.189 Y128.851 E.01607
G1 X135.956 Y134.618 E.22099
G1 X135.363 Y134.618 E.01607
G1 X130.189 Y129.444 E.19827
G1 X130.189 Y130.037 E.01607
G1 X134.77 Y134.618 E.17555
G1 X134.177 Y134.618 E.01607
G1 X130.189 Y130.63 E.15283
G1 X130.189 Y131.223 E.01607
G1 X133.584 Y134.618 E.1301
G1 X132.991 Y134.618 E.01607
G1 X130.189 Y131.816 E.10738
G1 X130.189 Y132.409 E.01607
G1 X132.398 Y134.618 E.08466
G1 X131.805 Y134.618 E.01607
G1 X130.189 Y133.002 E.06194
G1 X130.189 Y133.595 E.01607
G1 X131.212 Y134.618 E.03922
G1 X130.619 Y134.618 E.01607
G1 X130.002 Y134.001 E.02366
G1 X117.193 Y134.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F11508.067
G1 X117.811 Y134.633 E.02227
G1 X118.364 Y134.633 E.0141
G1 X117.367 Y133.636 E.03595
G1 X117.367 Y133.083 E.0141
M73 P59 R6
G1 X118.917 Y134.633 E.05588
G1 X119.47 Y134.633 E.0141
G1 X117.367 Y132.53 E.07582
G1 X117.367 Y131.977 E.0141
G1 X120.023 Y134.633 E.09576
G1 X120.576 Y134.633 E.0141
G1 X117.367 Y131.424 E.11569
G1 X117.367 Y130.871 E.0141
G1 X121.129 Y134.633 E.13563
G1 X121.682 Y134.633 E.0141
G1 X117.367 Y130.318 E.15556
G1 X117.367 Y129.765 E.0141
G1 X122.235 Y134.633 E.1755
G1 X122.788 Y134.633 E.0141
G1 X117.367 Y129.212 E.19543
G1 X117.367 Y128.659 E.0141
G1 X123.341 Y134.633 E.21537
G1 X123.894 Y134.633 E.0141
G1 X117.367 Y128.106 E.2353
G1 X117.367 Y127.553 E.0141
G1 X124.447 Y134.633 E.25524
G1 X125 Y134.633 E.0141
G1 X117.367 Y127 E.27518
G1 X117.367 Y126.447 E.0141
G1 X125.553 Y134.633 E.29511
G1 X126.106 Y134.633 E.0141
G1 X117.367 Y125.894 E.31505
G1 X117.367 Y125.341 E.0141
G1 X126.659 Y134.633 E.33498
G1 X127.212 Y134.633 E.0141
G1 X117.367 Y124.788 E.35492
G1 X117.367 Y124.235 E.0141
G1 X127.765 Y134.633 E.37485
G1 X128.318 Y134.633 E.0141
G1 X117.367 Y123.682 E.39479
G1 X117.367 Y123.129 E.0141
G1 X128.871 Y134.633 E.41473
G1 X129.424 Y134.633 E.0141
G1 X117.367 Y122.576 E.43466
G1 X117.367 Y122.023 E.0141
G1 X129.788 Y134.444 E.44779
G1 X129.788 Y133.891 E.0141
G1 X117.367 Y121.47 E.44779
G1 X117.367 Y120.917 E.0141
G1 X129.788 Y133.338 E.44779
G1 X129.788 Y132.785 E.0141
G1 X117.367 Y120.364 E.44779
G1 X117.367 Y119.811 E.0141
G1 X129.788 Y132.232 E.44779
G1 X129.788 Y131.679 E.0141
G1 X117.367 Y119.258 E.44779
G1 X117.367 Y118.705 E.0141
G1 X129.788 Y131.126 E.44779
G1 X129.788 Y130.573 E.0141
G1 X117.367 Y118.152 E.44779
G1 X117.367 Y117.599 E.0141
G1 X129.788 Y130.02 E.44779
G1 X129.788 Y129.467 E.0141
G1 X117.688 Y117.367 E.43622
G1 X118.241 Y117.367 E.0141
G1 X129.788 Y128.914 E.41629
G1 X129.788 Y128.361 E.0141
G1 X118.794 Y117.367 E.39635
G1 X119.347 Y117.367 E.0141
G1 X129.788 Y127.808 E.37641
G1 X129.788 Y127.255 E.0141
G1 X119.9 Y117.367 E.35648
G1 X120.453 Y117.367 E.0141
G1 X129.788 Y126.702 E.33654
G1 X129.788 Y126.149 E.0141
G1 X121.006 Y117.367 E.31661
G1 X121.559 Y117.367 E.0141
G1 X129.788 Y125.596 E.29667
G1 X129.788 Y125.043 E.0141
G1 X122.112 Y117.367 E.27674
G1 X122.665 Y117.367 E.0141
G1 X129.788 Y124.49 E.2568
G1 X129.788 Y123.937 E.0141
G1 X123.218 Y117.367 E.23687
G1 X123.771 Y117.367 E.0141
G1 X129.788 Y123.384 E.21693
G1 X129.788 Y122.831 E.0141
G1 X124.324 Y117.367 E.19699
G1 X124.877 Y117.367 E.0141
G1 X129.788 Y122.278 E.17706
G1 X129.788 Y121.725 E.0141
G1 X125.43 Y117.367 E.15712
G1 X125.983 Y117.367 E.0141
G1 X129.788 Y121.172 E.13719
G1 X129.788 Y120.619 E.0141
G1 X126.536 Y117.367 E.11725
G1 X127.089 Y117.367 E.0141
G1 X129.788 Y120.066 E.09732
G1 X129.788 Y119.513 E.0141
G1 X127.642 Y117.367 E.07738
G1 X128.195 Y117.367 E.0141
G1 X129.788 Y118.96 E.05744
G1 X129.788 Y118.407 E.0141
G1 X128.748 Y117.367 E.03751
G1 X129.301 Y117.367 E.0141
G1 X129.962 Y118.028 E.02383
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X129.301 Y117.367 E-.35523
G1 X128.748 Y117.367 E-.21014
G1 X129.11 Y117.729 E-.19463
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/45
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z1.88 I-.754 J.956 P1  F30000
G1 X150.974 Y134.974 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X117.026 Y134.974 E.91988
G1 X117.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.91988
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X116.611 Y135.389 E.9424
G1 X116.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.9424
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X116.21 Y135.79 E.89453
G1 X116.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.89453
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.957 Y134.805 Z2.04 F30000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.618 Y134.144 E.02532
G1 X150.618 Y133.551 E.01607
G1 X149.551 Y134.618 E.04088
G1 X148.958 Y134.618 E.01607
G1 X150.618 Y132.958 E.0636
G1 X150.618 Y132.366 E.01607
G1 X148.366 Y134.618 E.08632
G1 X147.773 Y134.618 E.01607
G1 X150.618 Y131.773 E.10904
G1 X150.618 Y131.18 E.01607
G1 X147.18 Y134.618 E.13176
G1 X146.587 Y134.618 E.01607
G1 X150.618 Y130.587 E.15449
G1 X150.618 Y129.994 E.01607
G1 X145.994 Y134.618 E.17721
G1 X145.401 Y134.618 E.01607
G1 X150.618 Y129.401 E.19993
G1 X150.618 Y128.808 E.01607
G1 X144.808 Y134.618 E.22265
G1 X144.215 Y134.618 E.01607
G1 X150.618 Y128.215 E.24537
G1 X150.618 Y127.622 E.01607
G1 X143.622 Y134.618 E.26809
G1 X143.029 Y134.618 E.01607
G1 X150.618 Y127.029 E.29081
G1 X150.618 Y126.436 E.01607
G1 X142.436 Y134.618 E.31354
G1 X141.843 Y134.618 E.01607
G1 X150.618 Y125.843 E.33626
G1 X150.618 Y125.25 E.01607
G1 X141.25 Y134.618 E.35898
G1 X140.658 Y134.618 E.01607
G1 X150.618 Y124.658 E.3817
G1 X150.618 Y124.065 E.01607
G1 X140.065 Y134.618 E.40442
G1 X139.472 Y134.618 E.01607
G1 X150.618 Y123.472 E.42714
G1 X150.618 Y122.879 E.01607
G1 X138.879 Y134.618 E.44986
G1 X138.286 Y134.618 E.01607
G1 X150.618 Y122.286 E.47259
G1 X150.618 Y121.693 E.01607
G1 X137.693 Y134.618 E.49531
G1 X137.1 Y134.618 E.01607
M73 P60 R6
G1 X150.618 Y121.1 E.51803
G1 X150.618 Y120.507 E.01607
G1 X136.507 Y134.618 E.54075
G1 X135.914 Y134.618 E.01607
G1 X150.618 Y119.914 E.56347
G1 X150.618 Y119.321 E.01607
G1 X135.321 Y134.618 E.58619
G1 X134.728 Y134.618 E.01607
G1 X150.618 Y118.728 E.60891
G1 X150.618 Y118.135 E.01607
G1 X134.135 Y134.618 E.63164
G1 X133.542 Y134.618 E.01607
G1 X150.618 Y117.542 E.65436
G1 X150.618 Y117.382 E.00435
G1 X150.186 Y117.382 E.01171
G1 X132.95 Y134.618 E.66051
G1 X132.357 Y134.618 E.01607
G1 X149.593 Y117.382 E.66051
G1 X149 Y117.382 E.01607
G1 X131.764 Y134.618 E.66051
G1 X131.171 Y134.618 E.01607
G1 X148.407 Y117.382 E.66051
G1 X147.814 Y117.382 E.01607
G1 X130.578 Y134.618 E.66051
G1 X130.189 Y134.618 E.01054
G1 X130.189 Y134.414 E.00553
G1 X147.221 Y117.382 E.6527
G1 X146.628 Y117.382 E.01607
G1 X130.189 Y133.821 E.62997
G1 X130.189 Y133.228 E.01607
G1 X146.035 Y117.382 E.60725
G1 X145.443 Y117.382 E.01607
G1 X130.189 Y132.635 E.58453
G1 X130.189 Y132.042 E.01607
G1 X144.85 Y117.382 E.56181
G1 X144.257 Y117.382 E.01607
G1 X130.189 Y131.45 E.53909
G1 X130.189 Y130.857 E.01607
G1 X143.664 Y117.382 E.51637
G1 X143.071 Y117.382 E.01607
G1 X130.189 Y130.264 E.49365
G1 X130.189 Y129.671 E.01607
G1 X142.478 Y117.382 E.47092
G1 X141.885 Y117.382 E.01607
G1 X130.189 Y129.078 E.4482
G1 X130.189 Y128.485 E.01607
G1 X141.292 Y117.382 E.42548
G1 X140.699 Y117.382 E.01607
G1 X130.189 Y127.892 E.40276
G1 X130.189 Y127.299 E.01607
G1 X140.106 Y117.382 E.38004
G1 X139.513 Y117.382 E.01607
G1 X130.189 Y126.706 E.35732
G1 X130.189 Y126.113 E.01607
G1 X138.92 Y117.382 E.3346
G1 X138.327 Y117.382 E.01607
G1 X130.189 Y125.52 E.31187
G1 X130.189 Y124.927 E.01607
G1 X137.735 Y117.382 E.28915
G1 X137.142 Y117.382 E.01607
G1 X130.189 Y124.334 E.26643
G1 X130.189 Y123.742 E.01607
G1 X136.549 Y117.382 E.24371
G1 X135.956 Y117.382 E.01607
G1 X130.189 Y123.149 E.22099
G1 X130.189 Y122.556 E.01607
G1 X135.363 Y117.382 E.19827
G1 X134.77 Y117.382 E.01607
G1 X130.189 Y121.963 E.17555
G1 X130.189 Y121.37 E.01607
G1 X134.177 Y117.382 E.15282
G1 X133.584 Y117.382 E.01607
G1 X130.189 Y120.777 E.1301
G1 X130.189 Y120.184 E.01607
G1 X132.991 Y117.382 E.10738
G1 X132.398 Y117.382 E.01607
G1 X130.189 Y119.591 E.08466
G1 X130.189 Y118.998 E.01607
G1 X131.805 Y117.382 E.06194
G1 X131.212 Y117.382 E.01607
G1 X130.189 Y118.405 E.03922
G1 X130.189 Y117.812 E.01607
G1 X130.806 Y117.195 E.02366
G1 X117.985 Y117.193 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F11508.067
G1 X117.367 Y117.811 E.02227
G1 X117.367 Y118.364 E.0141
G1 X118.364 Y117.367 E.03595
G1 X118.917 Y117.367 E.0141
G1 X117.367 Y118.917 E.05588
G1 X117.367 Y119.47 E.0141
G1 X119.47 Y117.367 E.07582
G1 X120.023 Y117.367 E.0141
G1 X117.367 Y120.023 E.09576
G1 X117.367 Y120.576 E.0141
G1 X120.576 Y117.367 E.11569
G1 X121.129 Y117.367 E.0141
G1 X117.367 Y121.129 E.13563
G1 X117.367 Y121.682 E.0141
G1 X121.682 Y117.367 E.15556
G1 X122.235 Y117.367 E.0141
G1 X117.367 Y122.235 E.1755
G1 X117.367 Y122.788 E.0141
G1 X122.788 Y117.367 E.19543
G1 X123.341 Y117.367 E.0141
G1 X117.367 Y123.341 E.21537
G1 X117.367 Y123.894 E.0141
G1 X123.894 Y117.367 E.2353
G1 X124.447 Y117.367 E.0141
G1 X117.367 Y124.447 E.25524
G1 X117.367 Y125 E.0141
G1 X125 Y117.367 E.27518
G1 X125.553 Y117.367 E.0141
G1 X117.367 Y125.553 E.29511
G1 X117.367 Y126.106 E.0141
G1 X126.106 Y117.367 E.31505
G1 X126.659 Y117.367 E.0141
G1 X117.367 Y126.659 E.33498
G1 X117.367 Y127.212 E.0141
G1 X127.212 Y117.367 E.35492
G1 X127.765 Y117.367 E.0141
G1 X117.367 Y127.765 E.37485
G1 X117.367 Y128.318 E.0141
G1 X128.318 Y117.367 E.39479
G1 X128.871 Y117.367 E.0141
G1 X117.367 Y128.871 E.41473
G1 X117.367 Y129.424 E.0141
G1 X129.424 Y117.367 E.43466
G1 X129.788 Y117.367 E.00928
G1 X129.788 Y117.556 E.00481
G1 X117.367 Y129.977 E.44779
G1 X117.367 Y130.53 E.0141
G1 X129.788 Y118.109 E.44779
G1 X129.788 Y118.662 E.0141
G1 X117.367 Y131.083 E.44779
G1 X117.367 Y131.636 E.0141
G1 X129.788 Y119.215 E.44779
G1 X129.788 Y119.768 E.0141
G1 X117.367 Y132.189 E.44779
G1 X117.367 Y132.742 E.0141
G1 X129.788 Y120.321 E.44779
G1 X129.788 Y120.874 E.0141
G1 X117.367 Y133.295 E.44779
G1 X117.367 Y133.848 E.0141
G1 X129.788 Y121.427 E.44779
G1 X129.788 Y121.98 E.0141
G1 X117.367 Y134.401 E.44779
G1 X117.367 Y134.633 E.00592
G1 X117.688 Y134.633 E.00818
G1 X129.788 Y122.533 E.43622
G1 X129.788 Y123.086 E.0141
G1 X118.241 Y134.633 E.41629
G1 X118.794 Y134.633 E.0141
G1 X129.788 Y123.639 E.39635
G1 X129.788 Y124.192 E.0141
G1 X119.347 Y134.633 E.37641
G1 X119.9 Y134.633 E.0141
G1 X129.788 Y124.745 E.35648
G1 X129.788 Y125.298 E.0141
G1 X120.453 Y134.633 E.33654
G1 X121.006 Y134.633 E.0141
G1 X129.788 Y125.851 E.31661
G1 X129.788 Y126.404 E.0141
G1 X121.559 Y134.633 E.29667
G1 X122.112 Y134.633 E.0141
G1 X129.788 Y126.957 E.27674
G1 X129.788 Y127.51 E.0141
G1 X122.665 Y134.633 E.2568
G1 X123.218 Y134.633 E.0141
G1 X129.788 Y128.063 E.23687
G1 X129.788 Y128.616 E.0141
G1 X123.771 Y134.633 E.21693
G1 X124.324 Y134.633 E.0141
G1 X129.788 Y129.169 E.19699
G1 X129.788 Y129.722 E.0141
G1 X124.877 Y134.633 E.17706
G1 X125.43 Y134.633 E.0141
G1 X129.788 Y130.275 E.15712
G1 X129.788 Y130.828 E.0141
G1 X125.983 Y134.633 E.13719
G1 X126.536 Y134.633 E.0141
G1 X129.788 Y131.381 E.11725
G1 X129.788 Y131.934 E.0141
G1 X127.089 Y134.633 E.09732
G1 X127.642 Y134.633 E.0141
G1 X129.788 Y132.487 E.07738
G1 X129.788 Y133.04 E.0141
G1 X128.195 Y134.633 E.05744
G1 X128.748 Y134.633 E.0141
G1 X129.788 Y133.593 E.03751
G1 X129.788 Y134.146 E.0141
G1 X129.127 Y134.807 E.02383
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X129.788 Y134.146 E-.35523
G1 X129.788 Y133.593 E-.21014
G1 X129.426 Y133.955 E-.19463
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/45
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.04 I-.057 J1.216 P1  F30000
G1 X150.974 Y134.974 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P61 R6
G1 X117.026 Y134.974 E.91988
G1 X117.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.91988
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X116.611 Y135.389 E.9424
G1 X116.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.9424
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X116.21 Y135.79 E.89453
G1 X116.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.89453
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.227 Y128.113 Z2.2 F30000
G1 X150.805 Y118.043 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.144 Y117.382 E.02532
G1 X149.551 Y117.382 E.01607
G1 X150.618 Y118.449 E.04088
G1 X150.618 Y119.041 E.01607
G1 X148.958 Y117.382 E.0636
G1 X148.366 Y117.382 E.01607
G1 X150.618 Y119.634 E.08632
G1 X150.618 Y120.227 E.01607
G1 X147.773 Y117.382 E.10904
G1 X147.18 Y117.382 E.01607
G1 X150.618 Y120.82 E.13176
G1 X150.618 Y121.413 E.01607
G1 X146.587 Y117.382 E.15449
G1 X145.994 Y117.382 E.01607
G1 X150.618 Y122.006 E.17721
G1 X150.618 Y122.599 E.01607
G1 X145.401 Y117.382 E.19993
G1 X144.808 Y117.382 E.01607
G1 X150.618 Y123.192 E.22265
G1 X150.618 Y123.785 E.01607
G1 X144.215 Y117.382 E.24537
G1 X143.622 Y117.382 E.01607
G1 X150.618 Y124.378 E.26809
G1 X150.618 Y124.971 E.01607
G1 X143.029 Y117.382 E.29081
G1 X142.436 Y117.382 E.01607
G1 X150.618 Y125.564 E.31354
G1 X150.618 Y126.157 E.01607
G1 X141.843 Y117.382 E.33626
G1 X141.25 Y117.382 E.01607
G1 X150.618 Y126.75 E.35898
G1 X150.618 Y127.342 E.01607
G1 X140.658 Y117.382 E.3817
G1 X140.065 Y117.382 E.01607
G1 X150.618 Y127.935 E.40442
G1 X150.618 Y128.528 E.01607
G1 X139.472 Y117.382 E.42714
G1 X138.879 Y117.382 E.01607
G1 X150.618 Y129.121 E.44986
G1 X150.618 Y129.714 E.01607
G1 X138.286 Y117.382 E.47259
G1 X137.693 Y117.382 E.01607
G1 X150.618 Y130.307 E.49531
G1 X150.618 Y130.9 E.01607
G1 X137.1 Y117.382 E.51803
G1 X136.507 Y117.382 E.01607
G1 X150.618 Y131.493 E.54075
G1 X150.618 Y132.086 E.01607
G1 X135.914 Y117.382 E.56347
G1 X135.321 Y117.382 E.01607
G1 X150.618 Y132.679 E.58619
G1 X150.618 Y133.272 E.01607
G1 X134.728 Y117.382 E.60891
G1 X134.135 Y117.382 E.01607
G1 X150.618 Y133.865 E.63164
G1 X150.618 Y134.458 E.01607
G1 X133.542 Y117.382 E.65436
G1 X132.95 Y117.382 E.01607
G1 X150.186 Y134.618 E.66051
G1 X149.593 Y134.618 E.01607
G1 X132.357 Y117.382 E.66051
G1 X131.764 Y117.382 E.01607
G1 X149 Y134.618 E.66051
G1 X148.407 Y134.618 E.01607
G1 X131.171 Y117.382 E.66051
G1 X130.578 Y117.382 E.01607
G1 X147.814 Y134.618 E.66051
G1 X147.221 Y134.618 E.01607
G1 X130.189 Y117.586 E.6527
G1 X130.189 Y118.179 E.01607
G1 X146.628 Y134.618 E.62997
G1 X146.035 Y134.618 E.01607
G1 X130.189 Y118.772 E.60725
G1 X130.189 Y119.365 E.01607
G1 X145.443 Y134.618 E.58453
G1 X144.85 Y134.618 E.01607
G1 X130.189 Y119.958 E.56181
G1 X130.189 Y120.55 E.01607
G1 X144.257 Y134.618 E.53909
G1 X143.664 Y134.618 E.01607
G1 X130.189 Y121.143 E.51637
G1 X130.189 Y121.736 E.01607
G1 X143.071 Y134.618 E.49365
G1 X142.478 Y134.618 E.01607
G1 X130.189 Y122.329 E.47092
G1 X130.189 Y122.922 E.01607
G1 X141.885 Y134.618 E.4482
G1 X141.292 Y134.618 E.01607
G1 X130.189 Y123.515 E.42548
G1 X130.189 Y124.108 E.01607
G1 X140.699 Y134.618 E.40276
G1 X140.106 Y134.618 E.01607
G1 X130.189 Y124.701 E.38004
G1 X130.189 Y125.294 E.01607
G1 X139.513 Y134.618 E.35732
G1 X138.92 Y134.618 E.01607
G1 X130.189 Y125.887 E.3346
G1 X130.189 Y126.48 E.01607
G1 X138.327 Y134.618 E.31188
G1 X137.735 Y134.618 E.01607
G1 X130.189 Y127.073 E.28915
G1 X130.189 Y127.666 E.01607
G1 X137.142 Y134.618 E.26643
G1 X136.549 Y134.618 E.01607
G1 X130.189 Y128.258 E.24371
G1 X130.189 Y128.851 E.01607
G1 X135.956 Y134.618 E.22099
G1 X135.363 Y134.618 E.01607
G1 X130.189 Y129.444 E.19827
G1 X130.189 Y130.037 E.01607
G1 X134.77 Y134.618 E.17555
G1 X134.177 Y134.618 E.01607
G1 X130.189 Y130.63 E.15283
G1 X130.189 Y131.223 E.01607
G1 X133.584 Y134.618 E.1301
G1 X132.991 Y134.618 E.01607
G1 X130.189 Y131.816 E.10738
G1 X130.189 Y132.409 E.01607
G1 X132.398 Y134.618 E.08466
G1 X131.805 Y134.618 E.01607
G1 X130.189 Y133.002 E.06194
G1 X130.189 Y133.595 E.01607
G1 X131.212 Y134.618 E.03922
G1 X130.619 Y134.618 E.01607
G1 X130.002 Y134.001 E.02366
G1 X117.193 Y134.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F11508.067
G1 X117.811 Y134.633 E.02227
G1 X118.364 Y134.633 E.0141
M73 P62 R6
G1 X117.367 Y133.636 E.03595
G1 X117.367 Y133.083 E.0141
G1 X118.917 Y134.633 E.05588
G1 X119.47 Y134.633 E.0141
G1 X117.367 Y132.53 E.07582
G1 X117.367 Y131.977 E.0141
G1 X120.023 Y134.633 E.09576
G1 X120.576 Y134.633 E.0141
G1 X117.367 Y131.424 E.11569
G1 X117.367 Y130.871 E.0141
G1 X121.129 Y134.633 E.13563
G1 X121.682 Y134.633 E.0141
G1 X117.367 Y130.318 E.15556
G1 X117.367 Y129.765 E.0141
G1 X122.235 Y134.633 E.1755
G1 X122.788 Y134.633 E.0141
G1 X117.367 Y129.212 E.19543
G1 X117.367 Y128.659 E.0141
G1 X123.341 Y134.633 E.21537
G1 X123.894 Y134.633 E.0141
G1 X117.367 Y128.106 E.2353
G1 X117.367 Y127.553 E.0141
G1 X124.447 Y134.633 E.25524
G1 X125 Y134.633 E.0141
G1 X117.367 Y127 E.27518
G1 X117.367 Y126.447 E.0141
G1 X125.553 Y134.633 E.29511
G1 X126.106 Y134.633 E.0141
G1 X117.367 Y125.894 E.31505
G1 X117.367 Y125.341 E.0141
G1 X126.659 Y134.633 E.33498
G1 X127.212 Y134.633 E.0141
G1 X117.367 Y124.788 E.35492
G1 X117.367 Y124.235 E.0141
G1 X127.765 Y134.633 E.37485
G1 X128.318 Y134.633 E.0141
G1 X117.367 Y123.682 E.39479
G1 X117.367 Y123.129 E.0141
G1 X128.871 Y134.633 E.41473
G1 X129.424 Y134.633 E.0141
G1 X117.367 Y122.576 E.43466
G1 X117.367 Y122.023 E.0141
G1 X129.788 Y134.444 E.44779
G1 X129.788 Y133.891 E.0141
G1 X117.367 Y121.47 E.44779
G1 X117.367 Y120.917 E.0141
G1 X129.788 Y133.338 E.44779
G1 X129.788 Y132.785 E.0141
G1 X117.367 Y120.364 E.44779
G1 X117.367 Y119.811 E.0141
G1 X129.788 Y132.232 E.44779
G1 X129.788 Y131.679 E.0141
G1 X117.367 Y119.258 E.44779
G1 X117.367 Y118.705 E.0141
G1 X129.788 Y131.126 E.44779
G1 X129.788 Y130.573 E.0141
G1 X117.367 Y118.152 E.44779
G1 X117.367 Y117.599 E.0141
G1 X129.788 Y130.02 E.44779
G1 X129.788 Y129.467 E.0141
G1 X117.688 Y117.367 E.43622
G1 X118.241 Y117.367 E.0141
G1 X129.788 Y128.914 E.41629
G1 X129.788 Y128.361 E.0141
G1 X118.794 Y117.367 E.39635
G1 X119.347 Y117.367 E.0141
G1 X129.788 Y127.808 E.37641
G1 X129.788 Y127.255 E.0141
G1 X119.9 Y117.367 E.35648
G1 X120.453 Y117.367 E.0141
G1 X129.788 Y126.702 E.33654
G1 X129.788 Y126.149 E.0141
G1 X121.006 Y117.367 E.31661
G1 X121.559 Y117.367 E.0141
G1 X129.788 Y125.596 E.29667
G1 X129.788 Y125.043 E.0141
G1 X122.112 Y117.367 E.27674
G1 X122.665 Y117.367 E.0141
G1 X129.788 Y124.49 E.2568
G1 X129.788 Y123.937 E.0141
G1 X123.218 Y117.367 E.23687
G1 X123.771 Y117.367 E.0141
G1 X129.788 Y123.384 E.21693
G1 X129.788 Y122.831 E.0141
G1 X124.324 Y117.367 E.19699
G1 X124.877 Y117.367 E.0141
G1 X129.788 Y122.278 E.17706
G1 X129.788 Y121.725 E.0141
G1 X125.43 Y117.367 E.15712
G1 X125.983 Y117.367 E.0141
G1 X129.788 Y121.172 E.13719
G1 X129.788 Y120.619 E.0141
G1 X126.536 Y117.367 E.11725
G1 X127.089 Y117.367 E.0141
G1 X129.788 Y120.066 E.09732
G1 X129.788 Y119.513 E.0141
G1 X127.642 Y117.367 E.07738
G1 X128.195 Y117.367 E.0141
G1 X129.788 Y118.96 E.05744
G1 X129.788 Y118.407 E.0141
G1 X128.748 Y117.367 E.03751
G1 X129.301 Y117.367 E.0141
G1 X129.962 Y118.028 E.02383
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X129.301 Y117.367 E-.35523
G1 X128.748 Y117.367 E-.21014
G1 X129.11 Y117.729 E-.19463
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/45
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.2 I-.754 J.956 P1  F30000
G1 X150.974 Y134.974 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X117.026 Y134.974 E.91988
G1 X117.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.91988
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X116.611 Y135.389 E.9424
G1 X116.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.9424
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X116.21 Y135.79 E.89453
G1 X116.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.89453
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.957 Y134.805 Z2.36 F30000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.618 Y134.144 E.02532
G1 X150.618 Y133.551 E.01607
G1 X149.551 Y134.618 E.04088
G1 X148.958 Y134.618 E.01607
G1 X150.618 Y132.958 E.0636
G1 X150.618 Y132.366 E.01607
G1 X148.366 Y134.618 E.08632
G1 X147.773 Y134.618 E.01607
G1 X150.618 Y131.773 E.10904
G1 X150.618 Y131.18 E.01607
G1 X147.18 Y134.618 E.13176
G1 X146.587 Y134.618 E.01607
G1 X150.618 Y130.587 E.15449
G1 X150.618 Y129.994 E.01607
G1 X145.994 Y134.618 E.17721
G1 X145.401 Y134.618 E.01607
G1 X150.618 Y129.401 E.19993
G1 X150.618 Y128.808 E.01607
G1 X144.808 Y134.618 E.22265
G1 X144.215 Y134.618 E.01607
G1 X150.618 Y128.215 E.24537
G1 X150.618 Y127.622 E.01607
G1 X143.622 Y134.618 E.26809
G1 X143.029 Y134.618 E.01607
G1 X150.618 Y127.029 E.29081
G1 X150.618 Y126.436 E.01607
G1 X142.436 Y134.618 E.31354
G1 X141.843 Y134.618 E.01607
G1 X150.618 Y125.843 E.33626
G1 X150.618 Y125.25 E.01607
G1 X141.25 Y134.618 E.35898
G1 X140.658 Y134.618 E.01607
G1 X150.618 Y124.658 E.3817
G1 X150.618 Y124.065 E.01607
G1 X140.065 Y134.618 E.40442
G1 X139.472 Y134.618 E.01607
G1 X150.618 Y123.472 E.42714
G1 X150.618 Y122.879 E.01607
G1 X138.879 Y134.618 E.44986
G1 X138.286 Y134.618 E.01607
G1 X150.618 Y122.286 E.47259
G1 X150.618 Y121.693 E.01607
G1 X137.693 Y134.618 E.49531
G1 X137.1 Y134.618 E.01607
M73 P63 R6
G1 X150.618 Y121.1 E.51803
G1 X150.618 Y120.507 E.01607
G1 X136.507 Y134.618 E.54075
G1 X135.914 Y134.618 E.01607
G1 X150.618 Y119.914 E.56347
G1 X150.618 Y119.321 E.01607
G1 X135.321 Y134.618 E.58619
G1 X134.728 Y134.618 E.01607
G1 X150.618 Y118.728 E.60891
G1 X150.618 Y118.135 E.01607
G1 X134.135 Y134.618 E.63164
G1 X133.542 Y134.618 E.01607
G1 X150.618 Y117.542 E.65436
G1 X150.618 Y117.382 E.00435
G1 X150.186 Y117.382 E.01171
G1 X132.95 Y134.618 E.66051
G1 X132.357 Y134.618 E.01607
G1 X149.593 Y117.382 E.66051
G1 X149 Y117.382 E.01607
G1 X131.764 Y134.618 E.66051
G1 X131.171 Y134.618 E.01607
G1 X148.407 Y117.382 E.66051
G1 X147.814 Y117.382 E.01607
G1 X130.578 Y134.618 E.66051
G1 X130.189 Y134.618 E.01054
G1 X130.189 Y134.414 E.00553
G1 X147.221 Y117.382 E.6527
G1 X146.628 Y117.382 E.01607
G1 X130.189 Y133.821 E.62997
G1 X130.189 Y133.228 E.01607
G1 X146.035 Y117.382 E.60725
G1 X145.443 Y117.382 E.01607
G1 X130.189 Y132.635 E.58453
G1 X130.189 Y132.042 E.01607
G1 X144.85 Y117.382 E.56181
G1 X144.257 Y117.382 E.01607
G1 X130.189 Y131.45 E.53909
G1 X130.189 Y130.857 E.01607
G1 X143.664 Y117.382 E.51637
G1 X143.071 Y117.382 E.01607
G1 X130.189 Y130.264 E.49365
G1 X130.189 Y129.671 E.01607
G1 X142.478 Y117.382 E.47092
G1 X141.885 Y117.382 E.01607
G1 X130.189 Y129.078 E.4482
G1 X130.189 Y128.485 E.01607
G1 X141.292 Y117.382 E.42548
G1 X140.699 Y117.382 E.01607
G1 X130.189 Y127.892 E.40276
G1 X130.189 Y127.299 E.01607
G1 X140.106 Y117.382 E.38004
G1 X139.513 Y117.382 E.01607
G1 X130.189 Y126.706 E.35732
G1 X130.189 Y126.113 E.01607
G1 X138.92 Y117.382 E.3346
G1 X138.327 Y117.382 E.01607
G1 X130.189 Y125.52 E.31187
G1 X130.189 Y124.927 E.01607
G1 X137.735 Y117.382 E.28915
G1 X137.142 Y117.382 E.01607
G1 X130.189 Y124.334 E.26643
G1 X130.189 Y123.742 E.01607
G1 X136.549 Y117.382 E.24371
G1 X135.956 Y117.382 E.01607
G1 X130.189 Y123.149 E.22099
G1 X130.189 Y122.556 E.01607
G1 X135.363 Y117.382 E.19827
G1 X134.77 Y117.382 E.01607
G1 X130.189 Y121.963 E.17555
G1 X130.189 Y121.37 E.01607
G1 X134.177 Y117.382 E.15282
G1 X133.584 Y117.382 E.01607
G1 X130.189 Y120.777 E.1301
G1 X130.189 Y120.184 E.01607
G1 X132.991 Y117.382 E.10738
G1 X132.398 Y117.382 E.01607
G1 X130.189 Y119.591 E.08466
G1 X130.189 Y118.998 E.01607
G1 X131.805 Y117.382 E.06194
G1 X131.212 Y117.382 E.01607
G1 X130.189 Y118.405 E.03922
G1 X130.189 Y117.812 E.01607
G1 X130.806 Y117.195 E.02366
G1 X117.985 Y117.193 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F11508.067
G1 X117.367 Y117.811 E.02227
G1 X117.367 Y118.364 E.0141
G1 X118.364 Y117.367 E.03595
G1 X118.917 Y117.367 E.0141
G1 X117.367 Y118.917 E.05588
G1 X117.367 Y119.47 E.0141
G1 X119.47 Y117.367 E.07582
G1 X120.023 Y117.367 E.0141
G1 X117.367 Y120.023 E.09576
G1 X117.367 Y120.576 E.0141
G1 X120.576 Y117.367 E.11569
G1 X121.129 Y117.367 E.0141
G1 X117.367 Y121.129 E.13563
G1 X117.367 Y121.682 E.0141
G1 X121.682 Y117.367 E.15556
G1 X122.235 Y117.367 E.0141
M73 P63 R5
G1 X117.367 Y122.235 E.1755
G1 X117.367 Y122.788 E.0141
G1 X122.788 Y117.367 E.19543
G1 X123.341 Y117.367 E.0141
G1 X117.367 Y123.341 E.21537
G1 X117.367 Y123.894 E.0141
G1 X123.894 Y117.367 E.2353
G1 X124.447 Y117.367 E.0141
G1 X117.367 Y124.447 E.25524
G1 X117.367 Y125 E.0141
G1 X125 Y117.367 E.27518
G1 X125.553 Y117.367 E.0141
G1 X117.367 Y125.553 E.29511
G1 X117.367 Y126.106 E.0141
G1 X126.106 Y117.367 E.31505
G1 X126.659 Y117.367 E.0141
G1 X117.367 Y126.659 E.33498
G1 X117.367 Y127.212 E.0141
G1 X127.212 Y117.367 E.35492
G1 X127.765 Y117.367 E.0141
G1 X117.367 Y127.765 E.37485
G1 X117.367 Y128.318 E.0141
G1 X128.318 Y117.367 E.39479
G1 X128.871 Y117.367 E.0141
G1 X117.367 Y128.871 E.41473
G1 X117.367 Y129.424 E.0141
G1 X129.424 Y117.367 E.43466
G1 X129.788 Y117.367 E.00928
G1 X129.788 Y117.556 E.00481
G1 X117.367 Y129.977 E.44779
G1 X117.367 Y130.53 E.0141
G1 X129.788 Y118.109 E.44779
G1 X129.788 Y118.662 E.0141
G1 X117.367 Y131.083 E.44779
G1 X117.367 Y131.636 E.0141
G1 X129.788 Y119.215 E.44779
G1 X129.788 Y119.768 E.0141
G1 X117.367 Y132.189 E.44779
G1 X117.367 Y132.742 E.0141
G1 X129.788 Y120.321 E.44779
G1 X129.788 Y120.874 E.0141
G1 X117.367 Y133.295 E.44779
G1 X117.367 Y133.848 E.0141
G1 X129.788 Y121.427 E.44779
G1 X129.788 Y121.98 E.0141
G1 X117.367 Y134.401 E.44779
G1 X117.367 Y134.633 E.00592
G1 X117.688 Y134.633 E.00818
G1 X129.788 Y122.533 E.43622
G1 X129.788 Y123.086 E.0141
G1 X118.241 Y134.633 E.41629
G1 X118.794 Y134.633 E.0141
G1 X129.788 Y123.639 E.39635
G1 X129.788 Y124.192 E.0141
G1 X119.347 Y134.633 E.37641
G1 X119.9 Y134.633 E.0141
G1 X129.788 Y124.745 E.35648
G1 X129.788 Y125.298 E.0141
G1 X120.453 Y134.633 E.33654
G1 X121.006 Y134.633 E.0141
G1 X129.788 Y125.851 E.31661
G1 X129.788 Y126.404 E.0141
G1 X121.559 Y134.633 E.29667
G1 X122.112 Y134.633 E.0141
G1 X129.788 Y126.957 E.27674
G1 X129.788 Y127.51 E.0141
G1 X122.665 Y134.633 E.2568
G1 X123.218 Y134.633 E.0141
G1 X129.788 Y128.063 E.23687
G1 X129.788 Y128.616 E.0141
G1 X123.771 Y134.633 E.21693
G1 X124.324 Y134.633 E.0141
G1 X129.788 Y129.169 E.19699
G1 X129.788 Y129.722 E.0141
G1 X124.877 Y134.633 E.17706
G1 X125.43 Y134.633 E.0141
G1 X129.788 Y130.275 E.15712
G1 X129.788 Y130.828 E.0141
G1 X125.983 Y134.633 E.13719
G1 X126.536 Y134.633 E.0141
G1 X129.788 Y131.381 E.11725
G1 X129.788 Y131.934 E.0141
G1 X127.089 Y134.633 E.09732
G1 X127.642 Y134.633 E.0141
G1 X129.788 Y132.487 E.07738
G1 X129.788 Y133.04 E.0141
G1 X128.195 Y134.633 E.05744
G1 X128.748 Y134.633 E.0141
G1 X129.788 Y133.593 E.03751
G1 X129.788 Y134.146 E.0141
G1 X129.127 Y134.807 E.02383
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X129.788 Y134.146 E-.35523
G1 X129.788 Y133.593 E-.21014
G1 X129.426 Y133.955 E-.19463
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/45
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.36 I-.057 J1.216 P1  F30000
G1 X150.974 Y134.974 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P64 R5
G1 X117.026 Y134.974 E.91988
G1 X117.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.91988
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X116.611 Y135.389 E.9424
G1 X116.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.9424
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X116.21 Y135.79 E.89453
G1 X116.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.89453
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.227 Y128.113 Z2.52 F30000
G1 X150.805 Y118.043 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.144 Y117.382 E.02532
G1 X149.551 Y117.382 E.01607
G1 X150.618 Y118.449 E.04088
G1 X150.618 Y119.041 E.01607
G1 X148.958 Y117.382 E.0636
G1 X148.366 Y117.382 E.01607
G1 X150.618 Y119.634 E.08632
G1 X150.618 Y120.227 E.01607
G1 X147.773 Y117.382 E.10904
G1 X147.18 Y117.382 E.01607
G1 X150.618 Y120.82 E.13176
G1 X150.618 Y121.413 E.01607
G1 X146.587 Y117.382 E.15449
G1 X145.994 Y117.382 E.01607
G1 X150.618 Y122.006 E.17721
G1 X150.618 Y122.599 E.01607
G1 X145.401 Y117.382 E.19993
G1 X144.808 Y117.382 E.01607
G1 X150.618 Y123.192 E.22265
G1 X150.618 Y123.785 E.01607
G1 X144.215 Y117.382 E.24537
G1 X143.622 Y117.382 E.01607
G1 X150.618 Y124.378 E.26809
G1 X150.618 Y124.971 E.01607
G1 X143.029 Y117.382 E.29081
G1 X142.436 Y117.382 E.01607
G1 X150.618 Y125.564 E.31354
G1 X150.618 Y126.157 E.01607
G1 X141.843 Y117.382 E.33626
G1 X141.25 Y117.382 E.01607
G1 X150.618 Y126.75 E.35898
G1 X150.618 Y127.342 E.01607
G1 X140.658 Y117.382 E.3817
G1 X140.065 Y117.382 E.01607
G1 X150.618 Y127.935 E.40442
G1 X150.618 Y128.528 E.01607
G1 X139.472 Y117.382 E.42714
G1 X138.879 Y117.382 E.01607
G1 X150.618 Y129.121 E.44986
G1 X150.618 Y129.714 E.01607
G1 X138.286 Y117.382 E.47259
G1 X137.693 Y117.382 E.01607
G1 X150.618 Y130.307 E.49531
G1 X150.618 Y130.9 E.01607
G1 X137.1 Y117.382 E.51803
G1 X136.507 Y117.382 E.01607
G1 X150.618 Y131.493 E.54075
G1 X150.618 Y132.086 E.01607
G1 X135.914 Y117.382 E.56347
G1 X135.321 Y117.382 E.01607
G1 X150.618 Y132.679 E.58619
G1 X150.618 Y133.272 E.01607
G1 X134.728 Y117.382 E.60891
G1 X134.135 Y117.382 E.01607
G1 X150.618 Y133.865 E.63164
G1 X150.618 Y134.458 E.01607
G1 X133.542 Y117.382 E.65436
G1 X132.95 Y117.382 E.01607
G1 X150.186 Y134.618 E.66051
G1 X149.593 Y134.618 E.01607
G1 X132.357 Y117.382 E.66051
G1 X131.764 Y117.382 E.01607
G1 X149 Y134.618 E.66051
G1 X148.407 Y134.618 E.01607
G1 X131.171 Y117.382 E.66051
G1 X130.578 Y117.382 E.01607
G1 X147.814 Y134.618 E.66051
G1 X147.221 Y134.618 E.01607
G1 X130.189 Y117.586 E.6527
G1 X130.189 Y118.179 E.01607
G1 X146.628 Y134.618 E.62997
G1 X146.035 Y134.618 E.01607
G1 X130.189 Y118.772 E.60725
G1 X130.189 Y119.365 E.01607
G1 X145.443 Y134.618 E.58453
G1 X144.85 Y134.618 E.01607
G1 X130.189 Y119.958 E.56181
G1 X130.189 Y120.55 E.01607
G1 X144.257 Y134.618 E.53909
G1 X143.664 Y134.618 E.01607
G1 X130.189 Y121.143 E.51637
G1 X130.189 Y121.736 E.01607
G1 X143.071 Y134.618 E.49365
G1 X142.478 Y134.618 E.01607
G1 X130.189 Y122.329 E.47092
G1 X130.189 Y122.922 E.01607
G1 X141.885 Y134.618 E.4482
G1 X141.292 Y134.618 E.01607
G1 X130.189 Y123.515 E.42548
G1 X130.189 Y124.108 E.01607
G1 X140.699 Y134.618 E.40276
G1 X140.106 Y134.618 E.01607
G1 X130.189 Y124.701 E.38004
G1 X130.189 Y125.294 E.01607
G1 X139.513 Y134.618 E.35732
G1 X138.92 Y134.618 E.01607
G1 X130.189 Y125.887 E.3346
G1 X130.189 Y126.48 E.01607
G1 X138.327 Y134.618 E.31188
G1 X137.735 Y134.618 E.01607
G1 X130.189 Y127.073 E.28915
G1 X130.189 Y127.666 E.01607
G1 X137.142 Y134.618 E.26643
G1 X136.549 Y134.618 E.01607
G1 X130.189 Y128.258 E.24371
G1 X130.189 Y128.851 E.01607
G1 X135.956 Y134.618 E.22099
G1 X135.363 Y134.618 E.01607
G1 X130.189 Y129.444 E.19827
G1 X130.189 Y130.037 E.01607
G1 X134.77 Y134.618 E.17555
G1 X134.177 Y134.618 E.01607
G1 X130.189 Y130.63 E.15283
G1 X130.189 Y131.223 E.01607
G1 X133.584 Y134.618 E.1301
G1 X132.991 Y134.618 E.01607
G1 X130.189 Y131.816 E.10738
G1 X130.189 Y132.409 E.01607
G1 X132.398 Y134.618 E.08466
G1 X131.805 Y134.618 E.01607
G1 X130.189 Y133.002 E.06194
G1 X130.189 Y133.595 E.01607
G1 X131.212 Y134.618 E.03922
G1 X130.619 Y134.618 E.01607
G1 X130.002 Y134.001 E.02366
G1 X117.193 Y134.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F11508.067
G1 X117.811 Y134.633 E.02227
G1 X118.364 Y134.633 E.0141
M73 P65 R5
G1 X117.367 Y133.636 E.03595
G1 X117.367 Y133.083 E.0141
G1 X118.917 Y134.633 E.05588
G1 X119.47 Y134.633 E.0141
G1 X117.367 Y132.53 E.07582
G1 X117.367 Y131.977 E.0141
G1 X120.023 Y134.633 E.09576
G1 X120.576 Y134.633 E.0141
G1 X117.367 Y131.424 E.11569
G1 X117.367 Y130.871 E.0141
G1 X121.129 Y134.633 E.13563
G1 X121.682 Y134.633 E.0141
G1 X117.367 Y130.318 E.15556
G1 X117.367 Y129.765 E.0141
G1 X122.235 Y134.633 E.1755
G1 X122.788 Y134.633 E.0141
G1 X117.367 Y129.212 E.19543
G1 X117.367 Y128.659 E.0141
G1 X123.341 Y134.633 E.21537
G1 X123.894 Y134.633 E.0141
G1 X117.367 Y128.106 E.2353
G1 X117.367 Y127.553 E.0141
G1 X124.447 Y134.633 E.25524
G1 X125 Y134.633 E.0141
G1 X117.367 Y127 E.27518
G1 X117.367 Y126.447 E.0141
G1 X125.553 Y134.633 E.29511
G1 X126.106 Y134.633 E.0141
G1 X117.367 Y125.894 E.31505
G1 X117.367 Y125.341 E.0141
G1 X126.659 Y134.633 E.33498
G1 X127.212 Y134.633 E.0141
G1 X117.367 Y124.788 E.35492
G1 X117.367 Y124.235 E.0141
G1 X127.765 Y134.633 E.37485
G1 X128.318 Y134.633 E.0141
G1 X117.367 Y123.682 E.39479
G1 X117.367 Y123.129 E.0141
G1 X128.871 Y134.633 E.41473
G1 X129.424 Y134.633 E.0141
G1 X117.367 Y122.576 E.43466
G1 X117.367 Y122.023 E.0141
G1 X129.788 Y134.444 E.44779
G1 X129.788 Y133.891 E.0141
G1 X117.367 Y121.47 E.44779
G1 X117.367 Y120.917 E.0141
G1 X129.788 Y133.338 E.44779
G1 X129.788 Y132.785 E.0141
G1 X117.367 Y120.364 E.44779
G1 X117.367 Y119.811 E.0141
G1 X129.788 Y132.232 E.44779
G1 X129.788 Y131.679 E.0141
G1 X117.367 Y119.258 E.44779
G1 X117.367 Y118.705 E.0141
G1 X129.788 Y131.126 E.44779
G1 X129.788 Y130.573 E.0141
G1 X117.367 Y118.152 E.44779
G1 X117.367 Y117.599 E.0141
G1 X129.788 Y130.02 E.44779
G1 X129.788 Y129.467 E.0141
G1 X117.688 Y117.367 E.43622
G1 X118.241 Y117.367 E.0141
G1 X129.788 Y128.914 E.41629
G1 X129.788 Y128.361 E.0141
G1 X118.794 Y117.367 E.39635
G1 X119.347 Y117.367 E.0141
G1 X129.788 Y127.808 E.37641
G1 X129.788 Y127.255 E.0141
G1 X119.9 Y117.367 E.35648
G1 X120.453 Y117.367 E.0141
G1 X129.788 Y126.702 E.33654
G1 X129.788 Y126.149 E.0141
G1 X121.006 Y117.367 E.31661
G1 X121.559 Y117.367 E.0141
G1 X129.788 Y125.596 E.29667
G1 X129.788 Y125.043 E.0141
G1 X122.112 Y117.367 E.27674
G1 X122.665 Y117.367 E.0141
G1 X129.788 Y124.49 E.2568
G1 X129.788 Y123.937 E.0141
G1 X123.218 Y117.367 E.23687
G1 X123.771 Y117.367 E.0141
G1 X129.788 Y123.384 E.21693
G1 X129.788 Y122.831 E.0141
G1 X124.324 Y117.367 E.19699
G1 X124.877 Y117.367 E.0141
G1 X129.788 Y122.278 E.17706
G1 X129.788 Y121.725 E.0141
G1 X125.43 Y117.367 E.15712
G1 X125.983 Y117.367 E.0141
G1 X129.788 Y121.172 E.13719
G1 X129.788 Y120.619 E.0141
G1 X126.536 Y117.367 E.11725
G1 X127.089 Y117.367 E.0141
G1 X129.788 Y120.066 E.09732
G1 X129.788 Y119.513 E.0141
G1 X127.642 Y117.367 E.07738
G1 X128.195 Y117.367 E.0141
G1 X129.788 Y118.96 E.05744
G1 X129.788 Y118.407 E.0141
G1 X128.748 Y117.367 E.03751
G1 X129.301 Y117.367 E.0141
G1 X129.962 Y118.028 E.02383
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X129.301 Y117.367 E-.35523
G1 X128.748 Y117.367 E-.21014
G1 X129.11 Y117.729 E-.19463
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/45
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.52 I-.754 J.956 P1  F30000
G1 X150.974 Y134.974 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X129.752 Y134.974 E.57504
G1 X129.752 Y117.026 E.48632
G1 X150.974 Y117.026 E.57504
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X129.337 Y135.389 E.59756
G1 X129.337 Y116.611 E.50885
G1 X151.389 Y116.611 E.59756
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X116.21 Y135.79 E.89453
G1 X116.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.89453
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.733 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.956 Y134.805 Z2.68 F30000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.618 Y134.143 E.02536
G1 X150.618 Y133.55 E.01608
G1 X149.55 Y134.618 E.04093
G1 X148.956 Y134.618 E.01608
G1 X150.618 Y132.956 E.06368
G1 X150.618 Y132.363 E.01608
G1 X148.363 Y134.618 E.08642
G1 X147.769 Y134.618 E.01608
G1 X150.618 Y131.769 E.10916
G1 X150.618 Y131.176 E.01608
G1 X147.176 Y134.618 E.13191
G1 X146.582 Y134.618 E.01608
G1 X150.618 Y130.582 E.15465
G1 X150.618 Y129.989 E.01608
G1 X145.989 Y134.618 E.1774
G1 X145.395 Y134.618 E.01608
G1 X150.618 Y129.395 E.20014
G1 X150.618 Y128.802 E.01608
G1 X144.802 Y134.618 E.22288
G1 X144.208 Y134.618 E.01608
G1 X150.618 Y128.208 E.24563
G1 X150.618 Y127.615 E.01608
G1 X143.615 Y134.618 E.26837
G1 X143.021 Y134.618 E.01608
G1 X150.618 Y127.021 E.29111
G1 X150.618 Y126.428 E.01608
G1 X142.428 Y134.618 E.31386
G1 X141.834 Y134.618 E.01608
G1 X150.618 Y125.834 E.3366
G1 X150.618 Y125.241 E.01608
G1 X141.241 Y134.618 E.35935
G1 X140.647 Y134.618 E.01608
G1 X150.618 Y124.647 E.38209
G1 X150.618 Y124.054 E.01608
G1 X140.054 Y134.618 E.40483
G1 X139.46 Y134.618 E.01608
G1 X150.618 Y123.46 E.42758
G1 X150.618 Y122.867 E.01608
G1 X138.867 Y134.618 E.45032
G1 X138.273 Y134.618 E.01608
G1 X150.618 Y122.273 E.47306
G1 X150.618 Y121.68 E.01608
G1 X137.68 Y134.618 E.49581
G1 X137.086 Y134.618 E.01608
G1 X150.618 Y121.086 E.51855
M73 P66 R5
G1 X150.618 Y120.493 E.01608
G1 X136.493 Y134.618 E.54129
G1 X135.899 Y134.618 E.01608
G1 X150.618 Y119.899 E.56404
G1 X150.618 Y119.306 E.01608
G1 X135.306 Y134.618 E.58678
G1 X134.712 Y134.618 E.01608
G1 X150.618 Y118.712 E.60953
G1 X150.618 Y118.119 E.01608
G1 X134.119 Y134.618 E.63227
G1 X133.525 Y134.618 E.01608
G1 X150.618 Y117.525 E.65501
G1 X150.618 Y117.382 E.00389
G1 X150.168 Y117.382 E.01219
G1 X132.932 Y134.618 E.66051
G1 X132.338 Y134.618 E.01608
G1 X149.575 Y117.382 E.66051
G1 X148.981 Y117.382 E.01608
G1 X131.745 Y134.618 E.66051
G1 X131.151 Y134.618 E.01608
G1 X148.388 Y117.382 E.66051
G1 X147.794 Y117.382 E.01608
G1 X130.558 Y134.618 E.66051
G1 X130.108 Y134.618 E.01219
G1 X130.108 Y134.475 E.00389
G1 X147.201 Y117.382 E.65502
G1 X146.607 Y117.382 E.01608
G1 X130.108 Y133.881 E.63227
G1 X130.108 Y133.288 E.01608
G1 X146.014 Y117.382 E.60953
G1 X145.42 Y117.382 E.01608
G1 X130.108 Y132.694 E.58678
G1 X130.108 Y132.101 E.01608
G1 X144.827 Y117.382 E.56404
G1 X144.233 Y117.382 E.01608
G1 X130.108 Y131.507 E.5413
G1 X130.108 Y130.914 E.01608
G1 X143.64 Y117.382 E.51855
G1 X143.046 Y117.382 E.01608
G1 X130.108 Y130.32 E.49581
G1 X130.108 Y129.727 E.01608
G1 X142.453 Y117.382 E.47307
G1 X141.859 Y117.382 E.01608
G1 X130.108 Y129.133 E.45032
G1 X130.108 Y128.54 E.01608
G1 X141.266 Y117.382 E.42758
G1 X140.672 Y117.382 E.01608
G1 X130.108 Y127.946 E.40484
G1 X130.108 Y127.353 E.01608
G1 X140.079 Y117.382 E.38209
G1 X139.485 Y117.382 E.01608
G1 X130.108 Y126.759 E.35935
G1 X130.108 Y126.166 E.01608
G1 X138.892 Y117.382 E.3366
G1 X138.298 Y117.382 E.01608
G1 X130.108 Y125.572 E.31386
G1 X130.108 Y124.979 E.01608
G1 X137.705 Y117.382 E.29112
G1 X137.111 Y117.382 E.01608
G1 X130.108 Y124.385 E.26837
G1 X130.108 Y123.792 E.01608
G1 X136.518 Y117.382 E.24563
G1 X135.924 Y117.382 E.01608
G1 X130.108 Y123.198 E.22289
G1 X130.108 Y122.605 E.01608
G1 X135.331 Y117.382 E.20014
G1 X134.737 Y117.382 E.01608
G1 X130.108 Y122.011 E.1774
G1 X130.108 Y121.418 E.01608
G1 X134.144 Y117.382 E.15465
G1 X133.55 Y117.382 E.01608
G1 X130.108 Y120.824 E.13191
G1 X130.108 Y120.231 E.01608
G1 X132.957 Y117.382 E.10917
G1 X132.363 Y117.382 E.01608
G1 X130.108 Y119.637 E.08642
G1 X130.108 Y119.044 E.01608
G1 X131.77 Y117.382 E.06368
G1 X131.176 Y117.382 E.01608
G1 X130.108 Y118.45 E.04094
G1 X130.108 Y117.857 E.01608
G1 X130.77 Y117.195 E.02536
; WIPE_START
G1 X130.108 Y117.857 E-.35565
G1 X130.108 Y118.45 E-.22553
G1 X130.441 Y118.117 E-.17882
; WIPE_END
G1 E-.04 F1800
G1 X129.84 Y125.726 Z2.68 F30000
G1 X129.109 Y134.981 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X128.512 Y135.578 E.02124
G1 X127.967 Y135.578
G1 X129.109 Y134.435 E.04063
G1 X129.109 Y133.89
G1 X127.421 Y135.578 E.06002
G1 X126.876 Y135.578
G1 X129.109 Y133.344 E.07942
G1 X129.109 Y132.799
G1 X126.33 Y135.578 E.09881
G1 X125.785 Y135.578
G1 X129.109 Y132.253 E.1182
G1 X129.109 Y131.708
G1 X125.24 Y135.578 E.13759
G1 X124.694 Y135.578
G1 X129.109 Y131.163 E.15698
G1 X129.109 Y130.617
G1 X124.149 Y135.578 E.17638
G1 X123.603 Y135.578
G1 X129.109 Y130.072 E.19577
G1 X129.109 Y129.526
G1 X123.058 Y135.578 E.21516
G1 X122.513 Y135.578
G1 X129.109 Y128.981 E.23455
G1 X129.109 Y128.436
G1 X121.967 Y135.578 E.25394
G1 X121.422 Y135.578
G1 X129.109 Y127.89 E.27334
G1 X129.109 Y127.345
G1 X120.876 Y135.578 E.29273
G1 X120.331 Y135.578
G1 X129.109 Y126.799 E.31212
G1 X129.109 Y126.254
G1 X119.786 Y135.578 E.33151
G1 X119.24 Y135.578
G1 X129.109 Y125.709 E.3509
G1 X129.109 Y125.163
G1 X118.695 Y135.578 E.3703
G1 X118.149 Y135.578
G1 X129.109 Y124.618 E.38969
G1 X129.109 Y124.072
G1 X117.604 Y135.578 E.40908
G1 X117.058 Y135.578
G1 X129.109 Y123.527 E.42847
G1 X129.109 Y122.982
G1 X116.513 Y135.578 E.44786
G1 X116.422 Y135.124
G1 X129.109 Y122.436 E.4511
G1 X129.109 Y121.891
G1 X116.422 Y134.578 E.4511
G1 X116.422 Y134.033
G1 X129.109 Y121.345 E.4511
G1 X129.109 Y120.8
G1 X116.422 Y133.487 E.4511
G1 X116.422 Y132.942
G1 X129.109 Y120.255 E.4511
G1 X129.109 Y119.709
G1 X116.422 Y132.396 E.4511
G1 X116.422 Y131.851
G1 X129.109 Y119.164 E.4511
G1 X129.109 Y118.618
G1 X116.422 Y131.306 E.4511
G1 X116.422 Y130.76
G1 X129.109 Y118.073 E.4511
G1 X129.109 Y117.528
G1 X116.422 Y130.215 E.4511
G1 X116.422 Y129.669
G1 X129.109 Y116.982 E.4511
G1 X129.109 Y116.437
G1 X116.422 Y129.124 E.4511
G1 X116.422 Y128.579
G1 X128.579 Y116.422 E.43223
G1 X128.033 Y116.422
G1 X116.422 Y128.033 E.41284
G1 X116.422 Y127.488
G1 X127.488 Y116.422 E.39345
G1 X126.942 Y116.422
G1 X116.422 Y126.942 E.37405
G1 X116.422 Y126.397
G1 X126.397 Y116.422 E.35466
G1 X125.852 Y116.422
G1 X116.422 Y125.852 E.33527
G1 X116.422 Y125.306
G1 X125.306 Y116.422 E.31588
G1 X124.761 Y116.422
G1 X116.422 Y124.761 E.29649
G1 X116.422 Y124.215
G1 X124.215 Y116.422 E.27709
G1 X123.67 Y116.422
G1 X116.422 Y123.67 E.2577
G1 X116.422 Y123.125
G1 X123.125 Y116.422 E.23831
G1 X122.579 Y116.422
G1 X116.422 Y122.579 E.21892
M73 P67 R5
G1 X116.422 Y122.034
G1 X122.034 Y116.422 E.19952
G1 X121.488 Y116.422
G1 X116.422 Y121.488 E.18013
G1 X116.422 Y120.943
G1 X120.943 Y116.422 E.16074
G1 X120.398 Y116.422
G1 X116.422 Y120.398 E.14135
G1 X116.422 Y119.852
G1 X119.852 Y116.422 E.12196
G1 X119.307 Y116.422
G1 X116.422 Y119.307 E.10256
G1 X116.422 Y118.761
G1 X118.761 Y116.422 E.08317
G1 X118.216 Y116.422
G1 X116.422 Y118.216 E.06378
G1 X116.422 Y117.671
G1 X117.671 Y116.422 E.04439
G1 X117.125 Y116.422
G1 X116.422 Y117.125 E.025
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S10000
G1 X117.125 Y116.422 E-.37781
G1 X117.671 Y116.422 E-.20726
G1 X117.345 Y116.748 E-.17493
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/45
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.68 I-.58 J1.07 P1  F30000
G1 X150.974 Y134.974 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.227 Y128.115 Z2.84 F30000
G1 X150.805 Y118.043 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10541
G1 X150.144 Y117.382 E.02532
G1 X149.551 Y117.382 E.01607
G1 X150.618 Y118.449 E.04088
G1 X150.618 Y119.041 E.01607
G1 X148.958 Y117.382 E.0636
G1 X148.366 Y117.382 E.01607
G1 X150.618 Y119.634 E.08632
G1 X150.618 Y120.227 E.01607
G1 X147.773 Y117.382 E.10904
G1 X147.18 Y117.382 E.01607
G1 X150.618 Y120.82 E.13176
G1 X150.618 Y121.413 E.01607
G1 X146.587 Y117.382 E.15449
G1 X145.994 Y117.382 E.01607
G1 X150.618 Y122.006 E.17721
G1 X150.618 Y122.599 E.01607
G1 X145.401 Y117.382 E.19993
G1 X144.808 Y117.382 E.01607
G1 X150.618 Y123.192 E.22265
G1 X150.618 Y123.785 E.01607
G1 X144.215 Y117.382 E.24537
G1 X143.622 Y117.382 E.01607
G1 X150.618 Y124.378 E.26809
G1 X150.618 Y124.971 E.01607
G1 X143.029 Y117.382 E.29081
G1 X142.436 Y117.382 E.01607
G1 X150.618 Y125.564 E.31354
G1 X150.618 Y126.157 E.01607
G1 X141.843 Y117.382 E.33626
G1 X141.25 Y117.382 E.01607
G1 X150.618 Y126.75 E.35898
G1 X150.618 Y127.342 E.01607
G1 X140.658 Y117.382 E.3817
G1 X140.065 Y117.382 E.01607
G1 X150.618 Y127.935 E.40442
G1 X150.618 Y128.528 E.01607
G1 X139.472 Y117.382 E.42714
G1 X138.879 Y117.382 E.01607
G1 X150.618 Y129.121 E.44986
G1 X150.618 Y129.714 E.01607
G1 X138.286 Y117.382 E.47259
G1 X137.693 Y117.382 E.01607
G1 X150.618 Y130.307 E.49531
G1 X150.618 Y130.9 E.01607
G1 X137.1 Y117.382 E.51803
G1 X136.507 Y117.382 E.01607
G1 X150.618 Y131.493 E.54075
G1 X150.618 Y132.086 E.01607
G1 X135.914 Y117.382 E.56347
G1 X135.321 Y117.382 E.01607
G1 X150.618 Y132.679 E.58619
G1 X150.618 Y133.272 E.01607
G1 X134.728 Y117.382 E.60891
G1 X134.135 Y117.382 E.01607
G1 X150.618 Y133.865 E.63164
G1 X150.618 Y134.458 E.01607
G1 X133.542 Y117.382 E.65436
G1 X132.95 Y117.382 E.01607
G1 X150.186 Y134.618 E.66051
G1 X149.593 Y134.618 E.01607
G1 X132.357 Y117.382 E.66051
G1 X131.764 Y117.382 E.01607
G1 X149 Y134.618 E.66051
G1 X148.407 Y134.618 E.01607
G1 X131.171 Y117.382 E.66051
G1 X130.578 Y117.382 E.01607
G1 X147.814 Y134.618 E.66051
G1 X147.221 Y134.618 E.01607
G1 X130.189 Y117.586 E.6527
G1 X130.189 Y118.179 E.01607
G1 X146.628 Y134.618 E.62997
G1 X146.035 Y134.618 E.01607
G1 X130.189 Y118.772 E.60725
G1 X130.189 Y119.365 E.01607
G1 X145.443 Y134.618 E.58453
G1 X144.85 Y134.618 E.01607
G1 X130.189 Y119.958 E.56181
M73 P68 R5
G1 X130.189 Y120.55 E.01607
G1 X144.257 Y134.618 E.53909
G1 X143.664 Y134.618 E.01607
G1 X130.189 Y121.143 E.51637
G1 X130.189 Y121.736 E.01607
G1 X143.071 Y134.618 E.49365
G1 X142.478 Y134.618 E.01607
G1 X130.189 Y122.329 E.47092
G1 X130.189 Y122.922 E.01607
G1 X141.885 Y134.618 E.4482
G1 X141.292 Y134.618 E.01607
G1 X130.189 Y123.515 E.42548
G1 X130.189 Y124.108 E.01607
G1 X140.699 Y134.618 E.40276
G1 X140.106 Y134.618 E.01607
G1 X130.189 Y124.701 E.38004
G1 X130.189 Y125.294 E.01607
G1 X139.513 Y134.618 E.35732
G1 X138.92 Y134.618 E.01607
G1 X130.189 Y125.887 E.3346
G1 X130.189 Y126.48 E.01607
G1 X138.327 Y134.618 E.31188
G1 X137.735 Y134.618 E.01607
G1 X130.189 Y127.073 E.28915
G1 X130.189 Y127.666 E.01607
G1 X137.142 Y134.618 E.26643
G1 X136.549 Y134.618 E.01607
G1 X130.189 Y128.258 E.24371
G1 X130.189 Y128.851 E.01607
G1 X135.956 Y134.618 E.22099
G1 X135.363 Y134.618 E.01607
G1 X130.189 Y129.444 E.19827
G1 X130.189 Y130.037 E.01607
G1 X134.77 Y134.618 E.17555
G1 X134.177 Y134.618 E.01607
G1 X130.189 Y130.63 E.15283
G1 X130.189 Y131.223 E.01607
G1 X133.584 Y134.618 E.1301
G1 X132.991 Y134.618 E.01607
G1 X130.189 Y131.816 E.10738
G1 X130.189 Y132.409 E.01607
G1 X132.398 Y134.618 E.08466
G1 X131.805 Y134.618 E.01607
G1 X130.189 Y133.002 E.06194
G1 X130.189 Y133.595 E.01607
G1 X131.212 Y134.618 E.03922
G1 X130.619 Y134.618 E.01607
G1 X130.002 Y134.001 E.02366
G1 X129.794 Y117.608 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407806
G1 F10541
G1 X129.794 Y117.421 E.00455
G1 X129.421 Y117.421 E.00909
G1 X129.421 Y134.579 E.41774
G1 X129.794 Y134.579 E.00909
G1 X129.794 Y117.668 E.41174
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12049.162
G1 X129.794 Y119.668 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/45
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z2.84 I-.713 J.986 P1  F30000
G1 X150.974 Y134.974 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.957 Y134.805 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10369
G1 X150.618 Y134.144 E.02532
G1 X150.618 Y133.551 E.01607
G1 X149.551 Y134.618 E.04088
G1 X148.958 Y134.618 E.01607
G1 X150.618 Y132.958 E.0636
G1 X150.618 Y132.366 E.01607
G1 X148.366 Y134.618 E.08632
G1 X147.773 Y134.618 E.01607
G1 X150.618 Y131.773 E.10904
G1 X150.618 Y131.18 E.01607
G1 X147.18 Y134.618 E.13176
G1 X146.587 Y134.618 E.01607
G1 X150.618 Y130.587 E.15449
G1 X150.618 Y129.994 E.01607
G1 X145.994 Y134.618 E.17721
G1 X145.401 Y134.618 E.01607
G1 X150.618 Y129.401 E.19993
G1 X150.618 Y128.808 E.01607
G1 X144.808 Y134.618 E.22265
G1 X144.215 Y134.618 E.01607
G1 X150.618 Y128.215 E.24537
G1 X150.618 Y127.622 E.01607
G1 X143.622 Y134.618 E.26809
G1 X143.029 Y134.618 E.01607
G1 X150.618 Y127.029 E.29081
G1 X150.618 Y126.436 E.01607
G1 X142.436 Y134.618 E.31354
G1 X141.843 Y134.618 E.01607
G1 X150.618 Y125.843 E.33626
G1 X150.618 Y125.25 E.01607
G1 X141.25 Y134.618 E.35898
G1 X140.658 Y134.618 E.01607
G1 X150.618 Y124.658 E.3817
G1 X150.618 Y124.065 E.01607
G1 X140.065 Y134.618 E.40442
G1 X139.472 Y134.618 E.01607
G1 X150.618 Y123.472 E.42714
G1 X150.618 Y122.879 E.01607
G1 X138.879 Y134.618 E.44986
G1 X138.286 Y134.618 E.01607
G1 X150.618 Y122.286 E.47259
G1 X150.618 Y121.693 E.01607
G1 X137.693 Y134.618 E.49531
G1 X137.1 Y134.618 E.01607
G1 X150.618 Y121.1 E.51803
G1 X150.618 Y120.507 E.01607
G1 X136.507 Y134.618 E.54075
G1 X135.914 Y134.618 E.01607
G1 X150.618 Y119.914 E.56347
G1 X150.618 Y119.321 E.01607
G1 X135.321 Y134.618 E.58619
G1 X134.728 Y134.618 E.01607
G1 X150.618 Y118.728 E.60891
G1 X150.618 Y118.135 E.01607
G1 X134.135 Y134.618 E.63164
G1 X133.542 Y134.618 E.01607
G1 X150.618 Y117.542 E.65436
G1 X150.618 Y117.382 E.00435
G1 X150.186 Y117.382 E.01171
G1 X132.95 Y134.618 E.66051
G1 X132.357 Y134.618 E.01607
G1 X149.593 Y117.382 E.66051
G1 X149 Y117.382 E.01607
G1 X131.764 Y134.618 E.66051
G1 X131.171 Y134.618 E.01607
G1 X148.407 Y117.382 E.66051
G1 X147.814 Y117.382 E.01607
G1 X130.578 Y134.618 E.66051
G1 X130.189 Y134.618 E.01054
G1 X130.189 Y134.414 E.00553
G1 X147.221 Y117.382 E.6527
G1 X146.628 Y117.382 E.01607
G1 X130.189 Y133.821 E.62997
G1 X130.189 Y133.228 E.01607
G1 X146.035 Y117.382 E.60725
M73 P69 R5
G1 X145.443 Y117.382 E.01607
G1 X130.189 Y132.635 E.58453
G1 X130.189 Y132.042 E.01607
G1 X144.85 Y117.382 E.56181
G1 X144.257 Y117.382 E.01607
G1 X130.189 Y131.45 E.53909
G1 X130.189 Y130.857 E.01607
G1 X143.664 Y117.382 E.51637
G1 X143.071 Y117.382 E.01607
G1 X130.189 Y130.264 E.49365
G1 X130.189 Y129.671 E.01607
G1 X142.478 Y117.382 E.47092
G1 X141.885 Y117.382 E.01607
G1 X130.189 Y129.078 E.4482
G1 X130.189 Y128.485 E.01607
G1 X141.292 Y117.382 E.42548
G1 X140.699 Y117.382 E.01607
G1 X130.189 Y127.892 E.40276
G1 X130.189 Y127.299 E.01607
G1 X140.106 Y117.382 E.38004
G1 X139.513 Y117.382 E.01607
G1 X130.189 Y126.706 E.35732
G1 X130.189 Y126.113 E.01607
G1 X138.92 Y117.382 E.3346
G1 X138.327 Y117.382 E.01607
G1 X130.189 Y125.52 E.31187
G1 X130.189 Y124.927 E.01607
G1 X137.735 Y117.382 E.28915
G1 X137.142 Y117.382 E.01607
G1 X130.189 Y124.334 E.26643
G1 X130.189 Y123.742 E.01607
G1 X136.549 Y117.382 E.24371
G1 X135.956 Y117.382 E.01607
G1 X130.189 Y123.149 E.22099
G1 X130.189 Y122.556 E.01607
G1 X135.363 Y117.382 E.19827
G1 X134.77 Y117.382 E.01607
G1 X130.189 Y121.963 E.17555
G1 X130.189 Y121.37 E.01607
G1 X134.177 Y117.382 E.15282
G1 X133.584 Y117.382 E.01607
G1 X130.189 Y120.777 E.1301
G1 X130.189 Y120.184 E.01607
G1 X132.991 Y117.382 E.10738
G1 X132.398 Y117.382 E.01607
G1 X130.189 Y119.591 E.08466
G1 X130.189 Y118.998 E.01607
G1 X131.805 Y117.382 E.06194
G1 X131.212 Y117.382 E.01607
G1 X130.189 Y118.405 E.03922
G1 X130.189 Y117.812 E.01607
G1 X130.806 Y117.195 E.02366
G1 X129.794 Y117.608 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407806
G1 F10369
G1 X129.794 Y117.421 E.00455
G1 X129.421 Y117.421 E.00909
G1 X129.421 Y134.579 E.41774
G1 X129.794 Y134.579 E.00909
G1 X129.794 Y117.668 E.41174
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12049.162
G1 X129.794 Y119.668 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/45
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3 I-.713 J.986 P1  F30000
G1 X150.974 Y134.974 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.227 Y128.115 Z3.16 F30000
G1 X150.805 Y118.043 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10496
G1 X150.144 Y117.382 E.02532
G1 X149.551 Y117.382 E.01607
G1 X150.618 Y118.449 E.04088
G1 X150.618 Y119.041 E.01607
G1 X148.958 Y117.382 E.0636
G1 X148.366 Y117.382 E.01607
G1 X150.618 Y119.634 E.08632
G1 X150.618 Y120.227 E.01607
G1 X147.773 Y117.382 E.10904
G1 X147.18 Y117.382 E.01607
G1 X150.618 Y120.82 E.13176
G1 X150.618 Y121.413 E.01607
G1 X146.587 Y117.382 E.15449
G1 X145.994 Y117.382 E.01607
G1 X150.618 Y122.006 E.17721
G1 X150.618 Y122.599 E.01607
G1 X145.401 Y117.382 E.19993
G1 X144.808 Y117.382 E.01607
G1 X150.618 Y123.192 E.22265
G1 X150.618 Y123.785 E.01607
G1 X144.215 Y117.382 E.24537
G1 X143.622 Y117.382 E.01607
G1 X150.618 Y124.378 E.26809
G1 X150.618 Y124.971 E.01607
G1 X143.029 Y117.382 E.29081
G1 X142.436 Y117.382 E.01607
G1 X150.618 Y125.564 E.31354
G1 X150.618 Y126.157 E.01607
M73 P69 R4
G1 X141.843 Y117.382 E.33626
G1 X141.25 Y117.382 E.01607
G1 X150.618 Y126.75 E.35898
G1 X150.618 Y127.342 E.01607
G1 X140.658 Y117.382 E.3817
G1 X140.065 Y117.382 E.01607
G1 X150.618 Y127.935 E.40442
G1 X150.618 Y128.528 E.01607
G1 X139.472 Y117.382 E.42714
G1 X138.879 Y117.382 E.01607
G1 X150.618 Y129.121 E.44986
G1 X150.618 Y129.714 E.01607
G1 X138.286 Y117.382 E.47259
G1 X137.693 Y117.382 E.01607
G1 X150.618 Y130.307 E.49531
G1 X150.618 Y130.9 E.01607
G1 X137.1 Y117.382 E.51803
G1 X136.507 Y117.382 E.01607
G1 X150.618 Y131.493 E.54075
G1 X150.618 Y132.086 E.01607
G1 X135.914 Y117.382 E.56347
G1 X135.321 Y117.382 E.01607
G1 X150.618 Y132.679 E.58619
G1 X150.618 Y133.272 E.01607
G1 X134.728 Y117.382 E.60891
G1 X134.135 Y117.382 E.01607
G1 X150.618 Y133.865 E.63164
G1 X150.618 Y134.458 E.01607
G1 X133.542 Y117.382 E.65436
G1 X132.95 Y117.382 E.01607
G1 X150.186 Y134.618 E.66051
G1 X149.593 Y134.618 E.01607
G1 X132.357 Y117.382 E.66051
G1 X131.764 Y117.382 E.01607
G1 X149 Y134.618 E.66051
G1 X148.407 Y134.618 E.01607
G1 X131.171 Y117.382 E.66051
G1 X130.578 Y117.382 E.01607
G1 X147.814 Y134.618 E.66051
G1 X147.221 Y134.618 E.01607
G1 X130.189 Y117.586 E.6527
M73 P70 R4
G1 X130.189 Y118.179 E.01607
G1 X146.628 Y134.618 E.62997
G1 X146.035 Y134.618 E.01607
G1 X130.189 Y118.772 E.60725
G1 X130.189 Y119.365 E.01607
G1 X145.443 Y134.618 E.58453
G1 X144.85 Y134.618 E.01607
G1 X130.189 Y119.958 E.56181
G1 X130.189 Y120.55 E.01607
G1 X144.257 Y134.618 E.53909
G1 X143.664 Y134.618 E.01607
G1 X130.189 Y121.143 E.51637
G1 X130.189 Y121.736 E.01607
G1 X143.071 Y134.618 E.49365
G1 X142.478 Y134.618 E.01607
G1 X130.189 Y122.329 E.47092
G1 X130.189 Y122.922 E.01607
G1 X141.885 Y134.618 E.4482
G1 X141.292 Y134.618 E.01607
G1 X130.189 Y123.515 E.42548
G1 X130.189 Y124.108 E.01607
G1 X140.699 Y134.618 E.40276
G1 X140.106 Y134.618 E.01607
G1 X130.189 Y124.701 E.38004
G1 X130.189 Y125.294 E.01607
G1 X139.513 Y134.618 E.35732
G1 X138.92 Y134.618 E.01607
G1 X130.189 Y125.887 E.3346
G1 X130.189 Y126.48 E.01607
G1 X138.327 Y134.618 E.31188
G1 X137.735 Y134.618 E.01607
G1 X130.189 Y127.073 E.28915
G1 X130.189 Y127.666 E.01607
G1 X137.142 Y134.618 E.26643
G1 X136.549 Y134.618 E.01607
G1 X130.189 Y128.258 E.24371
G1 X130.189 Y128.851 E.01607
G1 X135.956 Y134.618 E.22099
G1 X135.363 Y134.618 E.01607
G1 X130.189 Y129.444 E.19827
G1 X130.189 Y130.037 E.01607
G1 X134.77 Y134.618 E.17555
G1 X134.177 Y134.618 E.01607
G1 X130.189 Y130.63 E.15283
G1 X130.189 Y131.223 E.01607
G1 X133.584 Y134.618 E.1301
G1 X132.991 Y134.618 E.01607
G1 X130.189 Y131.816 E.10738
G1 X130.189 Y132.409 E.01607
G1 X132.398 Y134.618 E.08466
G1 X131.805 Y134.618 E.01607
G1 X130.189 Y133.002 E.06194
G1 X130.189 Y133.595 E.01607
G1 X131.212 Y134.618 E.03922
G1 X130.619 Y134.618 E.01607
G1 X130.002 Y134.001 E.02366
G1 X129.794 Y117.608 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407806
G1 F10496
G1 X129.794 Y117.421 E.00455
G1 X129.421 Y117.421 E.00909
G1 X129.421 Y134.579 E.41774
G1 X129.794 Y134.579 E.00909
G1 X129.794 Y117.668 E.41174
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12049.162
G1 X129.794 Y119.668 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/45
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.16 I-.713 J.986 P1  F30000
G1 X150.974 Y134.974 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.957 Y134.805 Z3.32 F30000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10369
G1 X150.618 Y134.144 E.02532
G1 X150.618 Y133.551 E.01607
G1 X149.551 Y134.618 E.04088
G1 X148.958 Y134.618 E.01607
G1 X150.618 Y132.958 E.0636
G1 X150.618 Y132.366 E.01607
G1 X148.366 Y134.618 E.08632
G1 X147.773 Y134.618 E.01607
G1 X150.618 Y131.773 E.10904
G1 X150.618 Y131.18 E.01607
G1 X147.18 Y134.618 E.13176
G1 X146.587 Y134.618 E.01607
G1 X150.618 Y130.587 E.15449
G1 X150.618 Y129.994 E.01607
G1 X145.994 Y134.618 E.17721
G1 X145.401 Y134.618 E.01607
G1 X150.618 Y129.401 E.19993
G1 X150.618 Y128.808 E.01607
G1 X144.808 Y134.618 E.22265
G1 X144.215 Y134.618 E.01607
G1 X150.618 Y128.215 E.24537
G1 X150.618 Y127.622 E.01607
G1 X143.622 Y134.618 E.26809
G1 X143.029 Y134.618 E.01607
G1 X150.618 Y127.029 E.29081
G1 X150.618 Y126.436 E.01607
G1 X142.436 Y134.618 E.31354
G1 X141.843 Y134.618 E.01607
G1 X150.618 Y125.843 E.33626
G1 X150.618 Y125.25 E.01607
G1 X141.25 Y134.618 E.35898
G1 X140.658 Y134.618 E.01607
G1 X150.618 Y124.658 E.3817
G1 X150.618 Y124.065 E.01607
G1 X140.065 Y134.618 E.40442
G1 X139.472 Y134.618 E.01607
G1 X150.618 Y123.472 E.42714
G1 X150.618 Y122.879 E.01607
G1 X138.879 Y134.618 E.44986
G1 X138.286 Y134.618 E.01607
G1 X150.618 Y122.286 E.47259
G1 X150.618 Y121.693 E.01607
G1 X137.693 Y134.618 E.49531
G1 X137.1 Y134.618 E.01607
G1 X150.618 Y121.1 E.51803
G1 X150.618 Y120.507 E.01607
G1 X136.507 Y134.618 E.54075
G1 X135.914 Y134.618 E.01607
G1 X150.618 Y119.914 E.56347
G1 X150.618 Y119.321 E.01607
G1 X135.321 Y134.618 E.58619
G1 X134.728 Y134.618 E.01607
G1 X150.618 Y118.728 E.60891
G1 X150.618 Y118.135 E.01607
G1 X134.135 Y134.618 E.63164
G1 X133.542 Y134.618 E.01607
G1 X150.618 Y117.542 E.65436
G1 X150.618 Y117.382 E.00435
G1 X150.186 Y117.382 E.01171
G1 X132.95 Y134.618 E.66051
G1 X132.357 Y134.618 E.01607
G1 X149.593 Y117.382 E.66051
G1 X149 Y117.382 E.01607
G1 X131.764 Y134.618 E.66051
G1 X131.171 Y134.618 E.01607
M73 P71 R4
G1 X148.407 Y117.382 E.66051
G1 X147.814 Y117.382 E.01607
G1 X130.578 Y134.618 E.66051
G1 X130.189 Y134.618 E.01054
G1 X130.189 Y134.414 E.00553
G1 X147.221 Y117.382 E.6527
G1 X146.628 Y117.382 E.01607
G1 X130.189 Y133.821 E.62997
G1 X130.189 Y133.228 E.01607
G1 X146.035 Y117.382 E.60725
G1 X145.443 Y117.382 E.01607
G1 X130.189 Y132.635 E.58453
G1 X130.189 Y132.042 E.01607
G1 X144.85 Y117.382 E.56181
G1 X144.257 Y117.382 E.01607
G1 X130.189 Y131.45 E.53909
G1 X130.189 Y130.857 E.01607
G1 X143.664 Y117.382 E.51637
G1 X143.071 Y117.382 E.01607
G1 X130.189 Y130.264 E.49365
G1 X130.189 Y129.671 E.01607
G1 X142.478 Y117.382 E.47092
G1 X141.885 Y117.382 E.01607
G1 X130.189 Y129.078 E.4482
G1 X130.189 Y128.485 E.01607
G1 X141.292 Y117.382 E.42548
G1 X140.699 Y117.382 E.01607
G1 X130.189 Y127.892 E.40276
G1 X130.189 Y127.299 E.01607
G1 X140.106 Y117.382 E.38004
G1 X139.513 Y117.382 E.01607
G1 X130.189 Y126.706 E.35732
G1 X130.189 Y126.113 E.01607
G1 X138.92 Y117.382 E.3346
G1 X138.327 Y117.382 E.01607
G1 X130.189 Y125.52 E.31187
G1 X130.189 Y124.927 E.01607
G1 X137.735 Y117.382 E.28915
G1 X137.142 Y117.382 E.01607
G1 X130.189 Y124.334 E.26643
G1 X130.189 Y123.742 E.01607
G1 X136.549 Y117.382 E.24371
G1 X135.956 Y117.382 E.01607
G1 X130.189 Y123.149 E.22099
G1 X130.189 Y122.556 E.01607
G1 X135.363 Y117.382 E.19827
G1 X134.77 Y117.382 E.01607
G1 X130.189 Y121.963 E.17555
G1 X130.189 Y121.37 E.01607
G1 X134.177 Y117.382 E.15282
G1 X133.584 Y117.382 E.01607
G1 X130.189 Y120.777 E.1301
G1 X130.189 Y120.184 E.01607
G1 X132.991 Y117.382 E.10738
G1 X132.398 Y117.382 E.01607
G1 X130.189 Y119.591 E.08466
G1 X130.189 Y118.998 E.01607
G1 X131.805 Y117.382 E.06194
G1 X131.212 Y117.382 E.01607
G1 X130.189 Y118.405 E.03922
G1 X130.189 Y117.812 E.01607
G1 X130.806 Y117.195 E.02366
G1 X129.794 Y117.608 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407806
G1 F10369
G1 X129.794 Y117.421 E.00455
G1 X129.421 Y117.421 E.00909
G1 X129.421 Y134.579 E.41774
G1 X129.794 Y134.579 E.00909
G1 X129.794 Y117.668 E.41174
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12049.162
G1 X129.794 Y119.668 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/45
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.32 I-.713 J.986 P1  F30000
G1 X150.974 Y134.974 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.227 Y128.115 Z3.48 F30000
G1 X150.805 Y118.047 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10375
G1 X150.14 Y117.382 E.02547
G1 X149.545 Y117.382 E.01614
G1 X150.618 Y118.455 E.04113
G1 X150.618 Y119.051 E.01614
G1 X148.949 Y117.382 E.06395
G1 X148.354 Y117.382 E.01614
G1 X150.618 Y119.646 E.08677
G1 X150.618 Y120.242 E.01614
G1 X147.758 Y117.382 E.10959
G1 X147.163 Y117.382 E.01614
G1 X150.618 Y120.837 E.13241
G1 X150.618 Y121.433 E.01614
G1 X146.567 Y117.382 E.15523
G1 X145.972 Y117.382 E.01614
G1 X150.618 Y122.028 E.17805
G1 X150.618 Y122.624 E.01614
G1 X145.376 Y117.382 E.20087
G1 X144.781 Y117.382 E.01614
G1 X150.618 Y123.219 E.22369
G1 X150.618 Y123.815 E.01614
G1 X144.185 Y117.382 E.24651
G1 X143.59 Y117.382 E.01614
G1 X150.618 Y124.41 E.26933
G1 X150.618 Y125.006 E.01614
G1 X142.994 Y117.382 E.29215
G1 X142.399 Y117.382 E.01614
G1 X150.618 Y125.601 E.31497
G1 X150.618 Y126.197 E.01614
G1 X141.803 Y117.382 E.33779
G1 X141.208 Y117.382 E.01614
G1 X150.618 Y126.792 E.36062
G1 X150.618 Y127.388 E.01614
G1 X140.612 Y117.382 E.38344
G1 X140.017 Y117.382 E.01614
G1 X150.618 Y127.983 E.40626
G1 X150.618 Y128.579 E.01614
G1 X139.421 Y117.382 E.42908
G1 X138.826 Y117.382 E.01614
G1 X150.618 Y129.174 E.4519
G1 X150.618 Y129.77 E.01614
G1 X138.23 Y117.382 E.47472
G1 X137.635 Y117.382 E.01614
G1 X150.618 Y130.365 E.49754
G1 X150.618 Y130.961 E.01614
G1 X137.039 Y117.382 E.52036
G1 X136.444 Y117.382 E.01614
G1 X150.618 Y131.556 E.54318
G1 X150.618 Y132.152 E.01614
G1 X135.848 Y117.382 E.566
G1 X135.253 Y117.382 E.01614
G1 X150.618 Y132.747 E.58882
G1 X150.618 Y133.343 E.01614
G1 X134.657 Y117.382 E.61164
G1 X134.062 Y117.382 E.01614
G1 X150.618 Y133.938 E.63446
G1 X150.618 Y134.534 E.01614
G1 X133.466 Y117.382 E.65728
G1 X132.871 Y117.382 E.01614
M73 P72 R4
G1 X150.107 Y134.618 E.66051
G1 X149.511 Y134.618 E.01614
G1 X132.275 Y117.382 E.66051
G1 X131.68 Y117.382 E.01614
G1 X148.916 Y134.618 E.66051
G1 X148.32 Y134.618 E.01614
G1 X131.084 Y117.382 E.66051
G1 X130.489 Y117.382 E.01614
G1 X147.725 Y134.618 E.66051
G1 X147.129 Y134.618 E.01614
G1 X129.893 Y117.382 E.66051
G1 X129.382 Y117.382 E.01385
G1 X129.382 Y117.466 E.00229
G1 X146.534 Y134.618 E.65728
G1 X145.938 Y134.618 E.01614
G1 X129.382 Y118.062 E.63446
G1 X129.382 Y118.657 E.01614
G1 X145.343 Y134.618 E.61164
G1 X144.747 Y134.618 E.01614
G1 X129.382 Y119.253 E.58882
G1 X129.382 Y119.848 E.01614
G1 X144.152 Y134.618 E.566
G1 X143.556 Y134.618 E.01614
G1 X129.382 Y120.444 E.54318
G1 X129.382 Y121.039 E.01614
G1 X142.961 Y134.618 E.52036
G1 X142.365 Y134.618 E.01614
G1 X129.382 Y121.635 E.49754
G1 X129.382 Y122.23 E.01614
G1 X141.77 Y134.618 E.47472
G1 X141.174 Y134.618 E.01614
G1 X129.382 Y122.826 E.4519
G1 X129.382 Y123.421 E.01614
G1 X140.579 Y134.618 E.42908
G1 X139.983 Y134.618 E.01614
G1 X129.382 Y124.017 E.40626
G1 X129.382 Y124.612 E.01614
G1 X139.388 Y134.618 E.38343
G1 X138.792 Y134.618 E.01614
G1 X129.382 Y125.208 E.36061
G1 X129.382 Y125.803 E.01614
G1 X138.197 Y134.618 E.33779
G1 X137.601 Y134.618 E.01614
G1 X129.382 Y126.399 E.31497
G1 X129.382 Y126.994 E.01614
G1 X137.006 Y134.618 E.29215
G1 X136.41 Y134.618 E.01614
G1 X129.382 Y127.59 E.26933
G1 X129.382 Y128.185 E.01614
G1 X135.815 Y134.618 E.24651
G1 X135.219 Y134.618 E.01614
G1 X129.382 Y128.781 E.22369
G1 X129.382 Y129.376 E.01614
G1 X134.624 Y134.618 E.20087
G1 X134.028 Y134.618 E.01614
G1 X129.382 Y129.972 E.17805
G1 X129.382 Y130.567 E.01614
G1 X133.433 Y134.618 E.15523
G1 X132.837 Y134.618 E.01614
G1 X129.382 Y131.163 E.13241
G1 X129.382 Y131.758 E.01614
G1 X132.242 Y134.618 E.10959
G1 X131.646 Y134.618 E.01614
G1 X129.382 Y132.354 E.08677
G1 X129.382 Y132.949 E.01614
G1 X131.051 Y134.618 E.06395
G1 X130.455 Y134.618 E.01614
G1 X129.382 Y133.545 E.04113
G1 X129.382 Y134.14 E.01614
G1 X130.047 Y134.805 E.02547
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X129.382 Y134.14 E-.35723
G1 X129.382 Y133.545 E-.2263
G1 X129.71 Y133.873 E-.17648
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/45
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.48 I-.063 J1.215 P1  F30000
G1 X150.974 Y134.974 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.962 Y134.805 Z3.64 F30000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10767
G1 X150.618 Y134.149 E.02514
G1 X150.618 Y133.559 E.01598
G1 X149.559 Y134.618 E.04058
G1 X148.969 Y134.618 E.01598
G1 X150.618 Y132.969 E.06318
G1 X150.618 Y132.38 E.01598
G1 X148.38 Y134.618 E.08578
G1 X147.79 Y134.618 E.01598
G1 X150.618 Y131.79 E.10838
G1 X150.618 Y131.2 E.01598
G1 X147.2 Y134.618 E.13098
G1 X146.61 Y134.618 E.01598
G1 X150.618 Y130.61 E.15358
G1 X150.618 Y130.021 E.01598
G1 X146.021 Y134.618 E.17618
G1 X145.431 Y134.618 E.01598
G1 X150.618 Y129.431 E.19879
G1 X150.618 Y128.841 E.01598
G1 X144.841 Y134.618 E.22139
G1 X144.251 Y134.618 E.01598
G1 X150.618 Y128.251 E.24399
G1 X150.618 Y127.661 E.01598
G1 X143.661 Y134.618 E.26659
G1 X143.072 Y134.618 E.01598
G1 X150.618 Y127.072 E.28919
G1 X150.618 Y126.482 E.01598
G1 X142.482 Y134.618 E.31179
G1 X142.189 Y134.618 E.00794
G1 X142.189 Y134.321 E.00804
G1 X150.618 Y125.892 E.32302
G1 X150.618 Y125.302 E.01598
G1 X142.189 Y133.731 E.32302
G1 X142.189 Y133.142 E.01598
G1 X150.618 Y124.713 E.32302
G1 X150.618 Y124.123 E.01598
G1 X142.189 Y132.552 E.32302
G1 X142.189 Y131.962 E.01598
G1 X150.618 Y123.533 E.32302
G1 X150.618 Y122.943 E.01598
G1 X142.189 Y131.372 E.32302
G1 X142.189 Y130.783 E.01598
G1 X150.618 Y122.353 E.32302
G1 X150.618 Y121.764 E.01598
G1 X142.189 Y130.193 E.32302
G1 X142.189 Y129.603 E.01598
G1 X150.618 Y121.174 E.32302
G1 X150.618 Y120.584 E.01598
G1 X142.189 Y129.013 E.32302
G1 X142.189 Y128.423 E.01598
G1 X150.618 Y119.994 E.32302
G1 X150.618 Y119.404 E.01598
G1 X142.189 Y127.834 E.32302
G1 X142.189 Y127.244 E.01598
G1 X150.618 Y118.815 E.32302
M73 P73 R4
G1 X150.618 Y118.225 E.01598
G1 X142.189 Y126.654 E.32302
G1 X142.189 Y126.064 E.01598
G1 X150.618 Y117.635 E.32302
G1 X150.618 Y117.382 E.00686
G1 X150.282 Y117.382 E.00912
G1 X142.189 Y125.475 E.31012
G1 X142.189 Y124.885 E.01598
G1 X149.692 Y117.382 E.28752
G1 X149.102 Y117.382 E.01598
G1 X142.189 Y124.295 E.26492
G1 X142.189 Y123.705 E.01598
G1 X148.512 Y117.382 E.24232
G1 X147.923 Y117.382 E.01598
G1 X142.189 Y123.115 E.21972
G1 X142.189 Y122.526 E.01598
G1 X147.333 Y117.382 E.19711
G1 X146.743 Y117.382 E.01598
G1 X142.189 Y121.936 E.17451
G1 X142.189 Y121.346 E.01598
G1 X146.153 Y117.382 E.15191
G1 X145.563 Y117.382 E.01598
G1 X142.189 Y120.756 E.12931
G1 X142.189 Y120.166 E.01598
G1 X144.974 Y117.382 E.10671
G1 X144.384 Y117.382 E.01598
G1 X142.189 Y119.577 E.08411
G1 X142.189 Y118.987 E.01598
G1 X143.794 Y117.382 E.06151
G1 X143.204 Y117.382 E.01598
G1 X142.189 Y118.397 E.03891
G1 X142.189 Y117.807 E.01598
G1 X142.801 Y117.195 E.02347
G1 X141.763 Y117.671 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.471156
G1 F10301.726
G1 X141.763 Y117.453 E.00622
G1 X141.326 Y117.453 E.01244
G1 X141.326 Y134.547 E.4868
G1 X141.763 Y134.547 E.01244
G1 X141.763 Y117.731 E.47887
G1 X140.943 Y117.195 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10767
G1 X140.308 Y117.83 E.02434
G1 X140.308 Y118.435 E.01639
G1 X140.9 Y117.843 E.02268
G1 X140.9 Y118.448 E.01639
G1 X140.308 Y119.039 E.02268
G1 X140.308 Y119.644 E.01639
G1 X140.9 Y119.052 E.02268
G1 X140.9 Y119.657 E.01639
G1 X140.308 Y120.249 E.02268
G1 X140.308 Y120.853 E.01639
G1 X140.9 Y120.262 E.02268
G1 X140.9 Y120.866 E.01639
G1 X140.308 Y121.458 E.02268
G1 X140.308 Y122.063 E.01639
G1 X140.9 Y121.471 E.02268
G1 X140.9 Y122.076 E.01639
G1 X140.308 Y122.668 E.02268
G1 X140.308 Y123.272 E.01639
G1 X140.9 Y122.681 E.02268
G1 X140.9 Y123.285 E.01639
G1 X140.308 Y123.877 E.02268
G1 X140.308 Y124.482 E.01639
G1 X140.9 Y123.89 E.02268
G1 X140.9 Y124.495 E.01639
G1 X140.308 Y125.086 E.02268
G1 X140.308 Y125.691 E.01639
G1 X140.9 Y125.099 E.02268
G1 X140.9 Y125.704 E.01639
G1 X140.308 Y126.296 E.02268
G1 X140.308 Y126.901 E.01639
G1 X140.9 Y126.309 E.02268
G1 X140.9 Y126.914 E.01639
G1 X140.308 Y127.505 E.02268
G1 X140.308 Y128.11 E.01639
G1 X140.9 Y127.518 E.02268
G1 X140.9 Y128.123 E.01639
G1 X140.308 Y128.715 E.02268
G1 X140.308 Y129.319 E.01639
G1 X140.9 Y128.728 E.02268
G1 X140.9 Y129.332 E.01639
G1 X140.308 Y129.924 E.02268
G1 X140.308 Y130.529 E.01639
G1 X140.9 Y129.937 E.02268
G1 X140.9 Y130.542 E.01639
G1 X140.308 Y131.134 E.02268
G1 X140.308 Y131.738 E.01639
G1 X140.9 Y131.147 E.02268
G1 X140.9 Y131.751 E.01639
G1 X140.308 Y132.343 E.02268
G1 X140.308 Y132.948 E.01639
G1 X140.9 Y132.356 E.02268
G1 X140.9 Y132.961 E.01639
G1 X140.308 Y133.553 E.02268
G1 X140.308 Y134.157 E.01639
G1 X140.9 Y133.565 E.02268
G1 X140.9 Y134.17 E.01639
G1 X140.265 Y134.805 E.02433
G1 X139.253 Y134.807 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422356
G1 F10767
G1 X139.907 Y134.152 E.02342
G1 X139.907 Y133.603 E.01388
G1 X138.878 Y134.633 E.03684
G1 X138.329 Y134.633 E.01388
G1 X139.907 Y133.055 E.05647
G1 X139.907 Y132.506 E.01388
G1 X137.78 Y134.633 E.0761
G1 X137.231 Y134.633 E.01388
G1 X139.907 Y131.957 E.09573
G1 X139.907 Y131.408 E.01388
G1 X136.683 Y134.633 E.11536
G1 X136.134 Y134.633 E.01388
G1 X139.907 Y130.86 E.13499
G1 X139.907 Y130.311 E.01388
G1 X135.585 Y134.633 E.15462
G1 X135.036 Y134.633 E.01388
G1 X139.907 Y129.762 E.17425
G1 X139.907 Y129.214 E.01388
G1 X134.488 Y134.633 E.19388
G1 X133.939 Y134.633 E.01388
G1 X139.907 Y128.665 E.21351
G1 X139.907 Y128.116 E.01388
G1 X133.39 Y134.633 E.23314
G1 X132.841 Y134.633 E.01388
G1 X139.907 Y127.567 E.25277
G1 X139.907 Y127.019 E.01388
G1 X132.293 Y134.633 E.2724
G1 X131.744 Y134.633 E.01388
G1 X139.907 Y126.47 E.29203
G1 X139.907 Y125.921 E.01388
G1 X131.195 Y134.633 E.31166
G1 X130.646 Y134.633 E.01388
G1 X139.907 Y125.372 E.33129
G1 X139.907 Y124.824 E.01388
G1 X130.098 Y134.633 E.35092
G1 X129.549 Y134.633 E.01388
G1 X139.907 Y124.275 E.37055
G1 X139.907 Y123.726 E.01388
G1 X129.367 Y134.267 E.37706
G1 X129.367 Y133.718 E.01388
G1 X139.907 Y123.177 E.37706
G1 X139.907 Y122.629 E.01388
G1 X129.367 Y133.169 E.37706
G1 X129.367 Y132.62 E.01388
G1 X139.907 Y122.08 E.37706
G1 X139.907 Y121.531 E.01388
G1 X129.367 Y132.072 E.37706
G1 X129.367 Y131.523 E.01388
G1 X139.907 Y120.982 E.37706
G1 X139.907 Y120.434 E.01388
G1 X129.367 Y130.974 E.37706
G1 X129.367 Y130.425 E.01388
G1 X139.907 Y119.885 E.37706
G1 X139.907 Y119.336 E.01388
G1 X129.367 Y129.877 E.37706
G1 X129.367 Y129.328 E.01388
G1 X139.907 Y118.787 E.37706
G1 X139.907 Y118.239 E.01388
G1 X129.367 Y128.779 E.37706
G1 X129.367 Y128.231 E.01388
G1 X139.907 Y117.69 E.37706
G1 X139.907 Y117.367 E.00817
G1 X139.682 Y117.367 E.00571
G1 X129.367 Y127.682 E.36899
G1 X129.367 Y127.133 E.01388
G1 X139.133 Y117.367 E.34936
G1 X138.584 Y117.367 E.01388
G1 X129.367 Y126.584 E.32973
G1 X129.367 Y126.036 E.01388
G1 X138.036 Y117.367 E.3101
G1 X137.487 Y117.367 E.01388
G1 X129.367 Y125.487 E.29047
G1 X129.367 Y124.938 E.01388
G1 X136.938 Y117.367 E.27084
G1 X136.389 Y117.367 E.01388
G1 X129.367 Y124.389 E.25122
G1 X129.367 Y123.841 E.01388
G1 X135.841 Y117.367 E.23159
G1 X135.292 Y117.367 E.01388
G1 X129.367 Y123.292 E.21196
G1 X129.367 Y122.743 E.01388
G1 X134.743 Y117.367 E.19233
G1 X134.194 Y117.367 E.01388
G1 X129.367 Y122.194 E.1727
G1 X129.367 Y121.646 E.01388
G1 X133.646 Y117.367 E.15307
G1 X133.097 Y117.367 E.01388
G1 X129.367 Y121.097 E.13344
G1 X129.367 Y120.548 E.01388
G1 X132.548 Y117.367 E.11381
G1 X131.999 Y117.367 E.01388
G1 X129.367 Y119.999 E.09418
G1 X129.367 Y119.451 E.01388
G1 X131.451 Y117.367 E.07455
G1 X130.902 Y117.367 E.01388
G1 X129.367 Y118.902 E.05492
G1 X129.367 Y118.353 E.01388
G1 X130.353 Y117.367 E.03529
G1 X129.804 Y117.367 E.01388
G1 X129.193 Y117.978 E.02186
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11597.34
G1 X129.804 Y117.367 E-.32846
G1 X130.353 Y117.367 E-.20853
G1 X129.938 Y117.782 E-.22302
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/45
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.64 I-.77 J.942 P1  F30000
G1 X150.974 Y134.974 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.339 Y134.08 Z3.8 F30000
G1 X142.002 Y134.006 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X142.614 Y134.618 E.02347
G1 X143.204 Y134.618 E.01598
G1 X142.189 Y133.603 E.03891
G1 X142.189 Y133.013 E.01598
G1 X143.794 Y134.618 E.06151
G1 X144.384 Y134.618 E.01598
G1 X142.189 Y132.423 E.08411
G1 X142.189 Y131.834 E.01598
G1 X144.974 Y134.618 E.10671
G1 X145.563 Y134.618 E.01598
G1 X142.189 Y131.244 E.12931
G1 X142.189 Y130.654 E.01598
G1 X146.153 Y134.618 E.15191
G1 X146.743 Y134.618 E.01598
G1 X142.189 Y130.064 E.17451
G1 X142.189 Y129.474 E.01598
G1 X147.333 Y134.618 E.19711
G1 X147.923 Y134.618 E.01598
G1 X142.189 Y128.885 E.21972
G1 X142.189 Y128.295 E.01598
G1 X148.512 Y134.618 E.24232
G1 X149.102 Y134.618 E.01598
G1 X142.189 Y127.705 E.26492
G1 X142.189 Y127.115 E.01598
G1 X149.692 Y134.618 E.28752
G1 X150.282 Y134.618 E.01598
G1 X142.189 Y126.525 E.31012
G1 X142.189 Y125.936 E.01598
G1 X150.618 Y134.365 E.32302
G1 X150.618 Y133.775 E.01598
G1 X142.189 Y125.346 E.32302
G1 X142.189 Y124.756 E.01598
G1 X150.618 Y133.185 E.32302
G1 X150.618 Y132.596 E.01598
G1 X142.189 Y124.166 E.32302
G1 X142.189 Y123.577 E.01598
G1 X150.618 Y132.006 E.32302
G1 X150.618 Y131.416 E.01598
G1 X142.189 Y122.987 E.32302
G1 X142.189 Y122.397 E.01598
M73 P74 R4
G1 X150.618 Y130.826 E.32302
G1 X150.618 Y130.236 E.01598
G1 X142.189 Y121.807 E.32302
G1 X142.189 Y121.217 E.01598
G1 X150.618 Y129.647 E.32302
G1 X150.618 Y129.057 E.01598
G1 X142.189 Y120.628 E.32302
G1 X142.189 Y120.038 E.01598
G1 X150.618 Y128.467 E.32302
G1 X150.618 Y127.877 E.01598
G1 X142.189 Y119.448 E.32302
G1 X142.189 Y118.858 E.01598
G1 X150.618 Y127.287 E.32302
G1 X150.618 Y126.698 E.01598
G1 X142.189 Y118.268 E.32302
G1 X142.189 Y117.679 E.01598
G1 X150.618 Y126.108 E.32302
G1 X150.618 Y125.518 E.01598
G1 X142.482 Y117.382 E.31179
G1 X143.072 Y117.382 E.01598
G1 X150.618 Y124.928 E.28919
G1 X150.618 Y124.339 E.01598
G1 X143.661 Y117.382 E.26659
G1 X144.251 Y117.382 E.01598
G1 X150.618 Y123.749 E.24399
G1 X150.618 Y123.159 E.01598
G1 X144.841 Y117.382 E.22139
G1 X145.431 Y117.382 E.01598
G1 X150.618 Y122.569 E.19879
G1 X150.618 Y121.979 E.01598
G1 X146.021 Y117.382 E.17618
G1 X146.61 Y117.382 E.01598
G1 X150.618 Y121.39 E.15358
G1 X150.618 Y120.8 E.01598
G1 X147.2 Y117.382 E.13098
G1 X147.79 Y117.382 E.01598
G1 X150.618 Y120.21 E.10838
G1 X150.618 Y119.62 E.01598
G1 X148.38 Y117.382 E.08578
G1 X148.969 Y117.382 E.01598
G1 X150.618 Y119.031 E.06318
G1 X150.618 Y118.441 E.01598
G1 X149.559 Y117.382 E.04058
G1 X150.149 Y117.382 E.01598
G1 X150.805 Y118.038 E.02514
G1 X141.962 Y118.028 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F10906
G1 X141.301 Y117.367 E.02383
G1 X140.748 Y117.367 E.0141
G1 X141.788 Y118.407 E.03751
G1 X141.788 Y118.96 E.0141
G1 X140.195 Y117.367 E.05744
G1 X139.642 Y117.367 E.0141
G1 X141.788 Y119.513 E.07738
G1 X141.788 Y120.066 E.0141
G1 X139.089 Y117.367 E.09732
G1 X138.536 Y117.367 E.0141
G1 X141.788 Y120.619 E.11725
G1 X141.788 Y121.172 E.0141
G1 X137.983 Y117.367 E.13719
G1 X137.43 Y117.367 E.0141
G1 X141.788 Y121.725 E.15712
G1 X141.788 Y122.278 E.0141
G1 X136.877 Y117.367 E.17706
G1 X136.324 Y117.367 E.0141
G1 X141.788 Y122.831 E.19699
G1 X141.788 Y123.384 E.0141
G1 X135.771 Y117.367 E.21693
G1 X135.218 Y117.367 E.0141
G1 X141.788 Y123.937 E.23687
G1 X141.788 Y124.49 E.0141
G1 X134.665 Y117.367 E.2568
G1 X134.112 Y117.367 E.0141
G1 X141.788 Y125.043 E.27674
G1 X141.788 Y125.596 E.0141
G1 X133.559 Y117.367 E.29667
G1 X133.006 Y117.367 E.0141
G1 X141.788 Y126.149 E.31661
G1 X141.788 Y126.702 E.0141
G1 X132.453 Y117.367 E.33654
G1 X131.9 Y117.367 E.0141
G1 X141.788 Y127.255 E.35648
G1 X141.788 Y127.808 E.0141
G1 X131.347 Y117.367 E.37642
G1 X130.794 Y117.367 E.0141
G1 X141.788 Y128.361 E.39635
G1 X141.788 Y128.914 E.0141
G1 X130.241 Y117.367 E.41629
G1 X129.688 Y117.367 E.0141
G1 X141.788 Y129.467 E.43622
G1 X141.788 Y130.02 E.0141
G1 X129.367 Y117.599 E.44779
G1 X129.367 Y118.152 E.0141
G1 X141.788 Y130.573 E.44779
G1 X141.788 Y131.126 E.0141
G1 X129.367 Y118.705 E.44779
G1 X129.367 Y119.258 E.0141
G1 X141.788 Y131.679 E.44779
G1 X141.788 Y132.232 E.0141
G1 X129.367 Y119.811 E.44779
G1 X129.367 Y120.364 E.0141
G1 X141.788 Y132.785 E.44779
G1 X141.788 Y133.338 E.0141
G1 X129.367 Y120.917 E.44779
G1 X129.367 Y121.47 E.0141
G1 X141.788 Y133.891 E.44779
G1 X141.788 Y134.444 E.0141
G1 X129.367 Y122.023 E.44779
G1 X129.367 Y122.576 E.0141
G1 X141.424 Y134.633 E.43466
G1 X140.871 Y134.633 E.0141
G1 X129.367 Y123.129 E.41472
G1 X129.367 Y123.682 E.0141
G1 X140.318 Y134.633 E.39479
G1 X139.765 Y134.633 E.0141
G1 X129.367 Y124.235 E.37485
G1 X129.367 Y124.788 E.0141
G1 X139.212 Y134.633 E.35492
G1 X138.659 Y134.633 E.0141
G1 X129.367 Y125.341 E.33498
G1 X129.367 Y125.894 E.0141
G1 X138.106 Y134.633 E.31504
G1 X137.553 Y134.633 E.0141
G1 X129.367 Y126.447 E.29511
G1 X129.367 Y127 E.0141
G1 X137 Y134.633 E.27517
G1 X136.447 Y134.633 E.0141
G1 X129.367 Y127.553 E.25524
G1 X129.367 Y128.106 E.0141
G1 X135.894 Y134.633 E.2353
G1 X135.341 Y134.633 E.0141
G1 X129.367 Y128.659 E.21537
G1 X129.367 Y129.212 E.0141
G1 X134.788 Y134.633 E.19543
G1 X134.235 Y134.633 E.0141
G1 X129.367 Y129.765 E.1755
G1 X129.367 Y130.318 E.0141
G1 X133.682 Y134.633 E.15556
G1 X133.129 Y134.633 E.0141
G1 X129.367 Y130.871 E.13562
G1 X129.367 Y131.424 E.0141
G1 X132.576 Y134.633 E.11569
G1 X132.023 Y134.633 E.0141
G1 X129.367 Y131.977 E.09575
G1 X129.367 Y132.53 E.0141
G1 X131.47 Y134.633 E.07582
G1 X130.917 Y134.633 E.0141
G1 X129.367 Y133.083 E.05588
G1 X129.367 Y133.636 E.0141
G1 X130.364 Y134.633 E.03595
G1 X129.811 Y134.633 E.0141
G1 X129.193 Y134.015 E.02227
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X129.811 Y134.633 E-.33193
G1 X130.364 Y134.633 E-.21014
G1 X129.958 Y134.228 E-.21793
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/45
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.8 I-.043 J1.216 P1  F30000
G1 X150.974 Y134.974 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.962 Y134.805 Z3.96 F30000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.618 Y134.149 E.02514
G1 X150.618 Y133.559 E.01598
G1 X149.559 Y134.618 E.04058
G1 X148.969 Y134.618 E.01598
G1 X150.618 Y132.969 E.06318
G1 X150.618 Y132.38 E.01598
G1 X148.38 Y134.618 E.08578
G1 X147.79 Y134.618 E.01598
G1 X150.618 Y131.79 E.10838
G1 X150.618 Y131.2 E.01598
G1 X147.2 Y134.618 E.13098
G1 X146.61 Y134.618 E.01598
G1 X150.618 Y130.61 E.15358
G1 X150.618 Y130.021 E.01598
G1 X146.021 Y134.618 E.17618
G1 X145.431 Y134.618 E.01598
G1 X150.618 Y129.431 E.19879
G1 X150.618 Y128.841 E.01598
G1 X144.841 Y134.618 E.22139
G1 X144.251 Y134.618 E.01598
G1 X150.618 Y128.251 E.24399
G1 X150.618 Y127.661 E.01598
G1 X143.661 Y134.618 E.26659
G1 X143.072 Y134.618 E.01598
G1 X150.618 Y127.072 E.28919
G1 X150.618 Y126.482 E.01598
G1 X142.482 Y134.618 E.31179
G1 X142.189 Y134.618 E.00794
G1 X142.189 Y134.321 E.00804
G1 X150.618 Y125.892 E.32302
G1 X150.618 Y125.302 E.01598
M73 P75 R4
G1 X142.189 Y133.731 E.32302
G1 X142.189 Y133.142 E.01598
G1 X150.618 Y124.713 E.32302
G1 X150.618 Y124.123 E.01598
G1 X142.189 Y132.552 E.32302
G1 X142.189 Y131.962 E.01598
G1 X150.618 Y123.533 E.32302
G1 X150.618 Y122.943 E.01598
G1 X142.189 Y131.372 E.32302
G1 X142.189 Y130.783 E.01598
G1 X150.618 Y122.353 E.32302
G1 X150.618 Y121.764 E.01598
G1 X142.189 Y130.193 E.32302
G1 X142.189 Y129.603 E.01598
G1 X150.618 Y121.174 E.32302
G1 X150.618 Y120.584 E.01598
G1 X142.189 Y129.013 E.32302
G1 X142.189 Y128.423 E.01598
G1 X150.618 Y119.994 E.32302
G1 X150.618 Y119.404 E.01598
G1 X142.189 Y127.834 E.32302
G1 X142.189 Y127.244 E.01598
G1 X150.618 Y118.815 E.32302
G1 X150.618 Y118.225 E.01598
G1 X142.189 Y126.654 E.32302
G1 X142.189 Y126.064 E.01598
G1 X150.618 Y117.635 E.32302
G1 X150.618 Y117.382 E.00686
G1 X150.282 Y117.382 E.00912
G1 X142.189 Y125.475 E.31012
G1 X142.189 Y124.885 E.01598
G1 X149.692 Y117.382 E.28752
G1 X149.102 Y117.382 E.01598
G1 X142.189 Y124.295 E.26492
G1 X142.189 Y123.705 E.01598
G1 X148.512 Y117.382 E.24232
G1 X147.923 Y117.382 E.01598
G1 X142.189 Y123.115 E.21972
G1 X142.189 Y122.526 E.01598
G1 X147.333 Y117.382 E.19711
G1 X146.743 Y117.382 E.01598
G1 X142.189 Y121.936 E.17451
G1 X142.189 Y121.346 E.01598
G1 X146.153 Y117.382 E.15191
G1 X145.563 Y117.382 E.01598
G1 X142.189 Y120.756 E.12931
G1 X142.189 Y120.166 E.01598
G1 X144.974 Y117.382 E.10671
G1 X144.384 Y117.382 E.01598
G1 X142.189 Y119.577 E.08411
G1 X142.189 Y118.987 E.01598
G1 X143.794 Y117.382 E.06151
G1 X143.204 Y117.382 E.01598
G1 X142.189 Y118.397 E.03891
G1 X142.189 Y117.807 E.01598
G1 X142.801 Y117.195 E.02347
G1 X129.985 Y117.193 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F10844
G1 X129.367 Y117.811 E.02227
G1 X129.367 Y118.364 E.0141
G1 X130.364 Y117.367 E.03595
G1 X130.917 Y117.367 E.0141
G1 X129.367 Y118.917 E.05588
G1 X129.367 Y119.47 E.0141
G1 X131.47 Y117.367 E.07582
G1 X132.023 Y117.367 E.0141
G1 X129.367 Y120.023 E.09575
G1 X129.367 Y120.576 E.0141
G1 X132.576 Y117.367 E.11569
G1 X133.129 Y117.367 E.0141
G1 X129.367 Y121.129 E.13562
G1 X129.367 Y121.682 E.0141
G1 X133.682 Y117.367 E.15556
G1 X134.235 Y117.367 E.0141
G1 X129.367 Y122.235 E.1755
G1 X129.367 Y122.788 E.0141
G1 X134.788 Y117.367 E.19543
G1 X135.341 Y117.367 E.0141
G1 X129.367 Y123.341 E.21537
G1 X129.367 Y123.894 E.0141
G1 X135.894 Y117.367 E.2353
G1 X136.447 Y117.367 E.0141
G1 X129.367 Y124.447 E.25524
G1 X129.367 Y125 E.0141
G1 X137 Y117.367 E.27517
G1 X137.553 Y117.367 E.0141
G1 X129.367 Y125.553 E.29511
G1 X129.367 Y126.106 E.0141
G1 X138.106 Y117.367 E.31504
G1 X138.659 Y117.367 E.0141
G1 X129.367 Y126.659 E.33498
G1 X129.367 Y127.212 E.0141
G1 X139.212 Y117.367 E.35492
G1 X139.765 Y117.367 E.0141
G1 X129.367 Y127.765 E.37485
G1 X129.367 Y128.318 E.0141
G1 X140.318 Y117.367 E.39479
G1 X140.871 Y117.367 E.0141
G1 X129.367 Y128.871 E.41472
G1 X129.367 Y129.424 E.0141
G1 X141.424 Y117.367 E.43466
G1 X141.788 Y117.367 E.00928
G1 X141.788 Y117.556 E.00481
G1 X129.367 Y129.977 E.44779
G1 X129.367 Y130.53 E.0141
G1 X141.788 Y118.109 E.44779
G1 X141.788 Y118.662 E.0141
G1 X129.367 Y131.083 E.44779
G1 X129.367 Y131.636 E.0141
G1 X141.788 Y119.215 E.44779
G1 X141.788 Y119.768 E.0141
G1 X129.367 Y132.189 E.44779
G1 X129.367 Y132.742 E.0141
G1 X141.788 Y120.321 E.44779
G1 X141.788 Y120.874 E.0141
G1 X129.367 Y133.295 E.44779
G1 X129.367 Y133.848 E.0141
G1 X141.788 Y121.427 E.44779
G1 X141.788 Y121.98 E.0141
G1 X129.367 Y134.401 E.44779
G1 X129.367 Y134.633 E.00592
G1 X129.688 Y134.633 E.00818
G1 X141.788 Y122.533 E.43622
G1 X141.788 Y123.086 E.0141
G1 X130.241 Y134.633 E.41629
G1 X130.794 Y134.633 E.0141
G1 X141.788 Y123.639 E.39635
G1 X141.788 Y124.192 E.0141
G1 X131.347 Y134.633 E.37641
G1 X131.9 Y134.633 E.0141
G1 X141.788 Y124.745 E.35648
G1 X141.788 Y125.298 E.0141
G1 X132.453 Y134.633 E.33654
G1 X133.006 Y134.633 E.0141
G1 X141.788 Y125.851 E.31661
G1 X141.788 Y126.404 E.0141
G1 X133.559 Y134.633 E.29667
G1 X134.112 Y134.633 E.0141
G1 X141.788 Y126.957 E.27674
G1 X141.788 Y127.51 E.0141
G1 X134.665 Y134.633 E.2568
G1 X135.218 Y134.633 E.0141
G1 X141.788 Y128.063 E.23687
G1 X141.788 Y128.616 E.0141
G1 X135.771 Y134.633 E.21693
G1 X136.324 Y134.633 E.0141
G1 X141.788 Y129.169 E.19699
G1 X141.788 Y129.722 E.0141
G1 X136.877 Y134.633 E.17706
M73 P75 R3
G1 X137.43 Y134.633 E.0141
G1 X141.788 Y130.275 E.15712
G1 X141.788 Y130.828 E.0141
G1 X137.983 Y134.633 E.13719
G1 X138.536 Y134.633 E.0141
G1 X141.788 Y131.381 E.11725
G1 X141.788 Y131.934 E.0141
G1 X139.089 Y134.633 E.09732
G1 X139.642 Y134.633 E.0141
G1 X141.788 Y132.487 E.07738
G1 X141.788 Y133.04 E.0141
G1 X140.195 Y134.633 E.05744
G1 X140.748 Y134.633 E.0141
G1 X141.788 Y133.593 E.03751
G1 X141.788 Y134.146 E.0141
G1 X141.127 Y134.807 E.02383
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X141.788 Y134.146 E-.35523
G1 X141.788 Y133.593 E-.21014
G1 X141.426 Y133.955 E-.19463
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/45
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z3.96 I-.129 J1.21 P1  F30000
G1 X150.974 Y134.974 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.339 Y134.08 Z4.12 F30000
G1 X142.002 Y134.006 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P76 R3
G1 F10802
G1 X142.614 Y134.618 E.02347
G1 X143.204 Y134.618 E.01598
G1 X142.189 Y133.603 E.03891
G1 X142.189 Y133.013 E.01598
G1 X143.794 Y134.618 E.06151
G1 X144.384 Y134.618 E.01598
G1 X142.189 Y132.423 E.08411
G1 X142.189 Y131.834 E.01598
G1 X144.974 Y134.618 E.10671
G1 X145.563 Y134.618 E.01598
G1 X142.189 Y131.244 E.12931
G1 X142.189 Y130.654 E.01598
G1 X146.153 Y134.618 E.15191
G1 X146.743 Y134.618 E.01598
G1 X142.189 Y130.064 E.17451
G1 X142.189 Y129.474 E.01598
G1 X147.333 Y134.618 E.19711
G1 X147.923 Y134.618 E.01598
G1 X142.189 Y128.885 E.21972
G1 X142.189 Y128.295 E.01598
G1 X148.512 Y134.618 E.24232
G1 X149.102 Y134.618 E.01598
G1 X142.189 Y127.705 E.26492
G1 X142.189 Y127.115 E.01598
G1 X149.692 Y134.618 E.28752
G1 X150.282 Y134.618 E.01598
G1 X142.189 Y126.525 E.31012
G1 X142.189 Y125.936 E.01598
G1 X150.618 Y134.365 E.32302
G1 X150.618 Y133.775 E.01598
G1 X142.189 Y125.346 E.32302
G1 X142.189 Y124.756 E.01598
G1 X150.618 Y133.185 E.32302
G1 X150.618 Y132.596 E.01598
G1 X142.189 Y124.166 E.32302
G1 X142.189 Y123.577 E.01598
G1 X150.618 Y132.006 E.32302
G1 X150.618 Y131.416 E.01598
G1 X142.189 Y122.987 E.32302
G1 X142.189 Y122.397 E.01598
G1 X150.618 Y130.826 E.32302
G1 X150.618 Y130.236 E.01598
G1 X142.189 Y121.807 E.32302
G1 X142.189 Y121.217 E.01598
G1 X150.618 Y129.647 E.32302
G1 X150.618 Y129.057 E.01598
G1 X142.189 Y120.628 E.32302
G1 X142.189 Y120.038 E.01598
G1 X150.618 Y128.467 E.32302
G1 X150.618 Y127.877 E.01598
G1 X142.189 Y119.448 E.32302
G1 X142.189 Y118.858 E.01598
G1 X150.618 Y127.287 E.32302
G1 X150.618 Y126.698 E.01598
G1 X142.189 Y118.268 E.32302
G1 X142.189 Y117.679 E.01598
G1 X150.618 Y126.108 E.32302
G1 X150.618 Y125.518 E.01598
G1 X142.482 Y117.382 E.31179
G1 X143.072 Y117.382 E.01598
G1 X150.618 Y124.928 E.28919
G1 X150.618 Y124.339 E.01598
G1 X143.661 Y117.382 E.26659
G1 X144.251 Y117.382 E.01598
G1 X150.618 Y123.749 E.24399
G1 X150.618 Y123.159 E.01598
G1 X144.841 Y117.382 E.22139
G1 X145.431 Y117.382 E.01598
G1 X150.618 Y122.569 E.19879
G1 X150.618 Y121.979 E.01598
G1 X146.021 Y117.382 E.17618
G1 X146.61 Y117.382 E.01598
G1 X150.618 Y121.39 E.15358
G1 X150.618 Y120.8 E.01598
G1 X147.2 Y117.382 E.13098
G1 X147.79 Y117.382 E.01598
G1 X150.618 Y120.21 E.10838
G1 X150.618 Y119.62 E.01598
G1 X148.38 Y117.382 E.08578
G1 X148.969 Y117.382 E.01598
G1 X150.618 Y119.031 E.06318
G1 X150.618 Y118.441 E.01598
G1 X149.559 Y117.382 E.04058
G1 X150.149 Y117.382 E.01598
G1 X150.805 Y118.038 E.02514
G1 X141.962 Y118.028 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F10802
G1 X141.301 Y117.367 E.02383
G1 X140.748 Y117.367 E.0141
G1 X141.788 Y118.407 E.03751
G1 X141.788 Y118.96 E.0141
G1 X140.195 Y117.367 E.05744
G1 X139.642 Y117.367 E.0141
G1 X141.788 Y119.513 E.07738
G1 X141.788 Y120.066 E.0141
G1 X139.089 Y117.367 E.09732
G1 X138.536 Y117.367 E.0141
G1 X141.788 Y120.619 E.11725
G1 X141.788 Y121.172 E.0141
G1 X137.983 Y117.367 E.13719
G1 X137.43 Y117.367 E.0141
G1 X141.788 Y121.725 E.15712
G1 X141.788 Y122.278 E.0141
G1 X136.877 Y117.367 E.17706
G1 X136.324 Y117.367 E.0141
G1 X141.788 Y122.831 E.19699
G1 X141.788 Y123.384 E.0141
G1 X135.771 Y117.367 E.21693
G1 X135.218 Y117.367 E.0141
G1 X141.788 Y123.937 E.23687
G1 X141.788 Y124.49 E.0141
G1 X134.665 Y117.367 E.2568
G1 X134.112 Y117.367 E.0141
G1 X141.788 Y125.043 E.27674
G1 X141.788 Y125.596 E.0141
G1 X133.559 Y117.367 E.29667
G1 X133.006 Y117.367 E.0141
G1 X141.788 Y126.149 E.31661
G1 X141.788 Y126.702 E.0141
G1 X132.453 Y117.367 E.33654
G1 X131.9 Y117.367 E.0141
G1 X141.788 Y127.255 E.35648
G1 X141.788 Y127.808 E.0141
G1 X131.347 Y117.367 E.37642
G1 X130.794 Y117.367 E.0141
G1 X141.788 Y128.361 E.39635
G1 X141.788 Y128.914 E.0141
G1 X130.241 Y117.367 E.41629
G1 X129.688 Y117.367 E.0141
G1 X141.788 Y129.467 E.43622
G1 X141.788 Y130.02 E.0141
G1 X129.367 Y117.599 E.44779
G1 X129.367 Y118.152 E.0141
G1 X141.788 Y130.573 E.44779
G1 X141.788 Y131.126 E.0141
G1 X129.367 Y118.705 E.44779
G1 X129.367 Y119.258 E.0141
G1 X141.788 Y131.679 E.44779
G1 X141.788 Y132.232 E.0141
G1 X129.367 Y119.811 E.44779
G1 X129.367 Y120.364 E.0141
G1 X141.788 Y132.785 E.44779
G1 X141.788 Y133.338 E.0141
G1 X129.367 Y120.917 E.44779
G1 X129.367 Y121.47 E.0141
G1 X141.788 Y133.891 E.44779
G1 X141.788 Y134.444 E.0141
G1 X129.367 Y122.023 E.44779
G1 X129.367 Y122.576 E.0141
G1 X141.424 Y134.633 E.43466
G1 X140.871 Y134.633 E.0141
G1 X129.367 Y123.129 E.41472
G1 X129.367 Y123.682 E.0141
G1 X140.318 Y134.633 E.39479
G1 X139.765 Y134.633 E.0141
G1 X129.367 Y124.235 E.37485
G1 X129.367 Y124.788 E.0141
G1 X139.212 Y134.633 E.35492
G1 X138.659 Y134.633 E.0141
G1 X129.367 Y125.341 E.33498
G1 X129.367 Y125.894 E.0141
G1 X138.106 Y134.633 E.31504
G1 X137.553 Y134.633 E.0141
G1 X129.367 Y126.447 E.29511
G1 X129.367 Y127 E.0141
G1 X137 Y134.633 E.27517
G1 X136.447 Y134.633 E.0141
G1 X129.367 Y127.553 E.25524
G1 X129.367 Y128.106 E.0141
G1 X135.894 Y134.633 E.2353
G1 X135.341 Y134.633 E.0141
G1 X129.367 Y128.659 E.21537
G1 X129.367 Y129.212 E.0141
G1 X134.788 Y134.633 E.19543
G1 X134.235 Y134.633 E.0141
G1 X129.367 Y129.765 E.1755
G1 X129.367 Y130.318 E.0141
G1 X133.682 Y134.633 E.15556
G1 X133.129 Y134.633 E.0141
G1 X129.367 Y130.871 E.13562
G1 X129.367 Y131.424 E.0141
G1 X132.576 Y134.633 E.11569
G1 X132.023 Y134.633 E.0141
G1 X129.367 Y131.977 E.09575
G1 X129.367 Y132.53 E.0141
G1 X131.47 Y134.633 E.07582
G1 X130.917 Y134.633 E.0141
G1 X129.367 Y133.083 E.05588
G1 X129.367 Y133.636 E.0141
G1 X130.364 Y134.633 E.03595
G1 X129.811 Y134.633 E.0141
G1 X129.193 Y134.015 E.02227
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X129.811 Y134.633 E-.33193
G1 X130.364 Y134.633 E-.21014
G1 X129.958 Y134.228 E-.21793
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/45
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.12 I-.043 J1.216 P1  F30000
G1 X150.974 Y134.974 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P77 R3
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.962 Y134.805 Z4.28 F30000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.618 Y134.149 E.02514
G1 X150.618 Y133.559 E.01598
G1 X149.559 Y134.618 E.04058
G1 X148.969 Y134.618 E.01598
G1 X150.618 Y132.969 E.06318
G1 X150.618 Y132.38 E.01598
G1 X148.38 Y134.618 E.08578
G1 X147.79 Y134.618 E.01598
G1 X150.618 Y131.79 E.10838
G1 X150.618 Y131.2 E.01598
G1 X147.2 Y134.618 E.13098
G1 X146.61 Y134.618 E.01598
G1 X150.618 Y130.61 E.15358
G1 X150.618 Y130.021 E.01598
G1 X146.021 Y134.618 E.17618
G1 X145.431 Y134.618 E.01598
G1 X150.618 Y129.431 E.19879
G1 X150.618 Y128.841 E.01598
G1 X144.841 Y134.618 E.22139
G1 X144.251 Y134.618 E.01598
G1 X150.618 Y128.251 E.24399
G1 X150.618 Y127.661 E.01598
G1 X143.661 Y134.618 E.26659
G1 X143.072 Y134.618 E.01598
G1 X150.618 Y127.072 E.28919
G1 X150.618 Y126.482 E.01598
G1 X142.482 Y134.618 E.31179
G1 X142.189 Y134.618 E.00794
G1 X142.189 Y134.321 E.00804
G1 X150.618 Y125.892 E.32302
G1 X150.618 Y125.302 E.01598
G1 X142.189 Y133.731 E.32302
G1 X142.189 Y133.142 E.01598
G1 X150.618 Y124.713 E.32302
G1 X150.618 Y124.123 E.01598
G1 X142.189 Y132.552 E.32302
G1 X142.189 Y131.962 E.01598
G1 X150.618 Y123.533 E.32302
G1 X150.618 Y122.943 E.01598
G1 X142.189 Y131.372 E.32302
G1 X142.189 Y130.783 E.01598
G1 X150.618 Y122.353 E.32302
G1 X150.618 Y121.764 E.01598
G1 X142.189 Y130.193 E.32302
G1 X142.189 Y129.603 E.01598
G1 X150.618 Y121.174 E.32302
G1 X150.618 Y120.584 E.01598
G1 X142.189 Y129.013 E.32302
G1 X142.189 Y128.423 E.01598
G1 X150.618 Y119.994 E.32302
G1 X150.618 Y119.404 E.01598
G1 X142.189 Y127.834 E.32302
G1 X142.189 Y127.244 E.01598
G1 X150.618 Y118.815 E.32302
G1 X150.618 Y118.225 E.01598
G1 X142.189 Y126.654 E.32302
G1 X142.189 Y126.064 E.01598
G1 X150.618 Y117.635 E.32302
G1 X150.618 Y117.382 E.00686
G1 X150.282 Y117.382 E.00912
G1 X142.189 Y125.475 E.31012
G1 X142.189 Y124.885 E.01598
G1 X149.692 Y117.382 E.28752
G1 X149.102 Y117.382 E.01598
G1 X142.189 Y124.295 E.26492
G1 X142.189 Y123.705 E.01598
G1 X148.512 Y117.382 E.24232
G1 X147.923 Y117.382 E.01598
G1 X142.189 Y123.115 E.21972
G1 X142.189 Y122.526 E.01598
G1 X147.333 Y117.382 E.19711
G1 X146.743 Y117.382 E.01598
G1 X142.189 Y121.936 E.17451
G1 X142.189 Y121.346 E.01598
G1 X146.153 Y117.382 E.15191
G1 X145.563 Y117.382 E.01598
G1 X142.189 Y120.756 E.12931
G1 X142.189 Y120.166 E.01598
G1 X144.974 Y117.382 E.10671
G1 X144.384 Y117.382 E.01598
G1 X142.189 Y119.577 E.08411
G1 X142.189 Y118.987 E.01598
G1 X143.794 Y117.382 E.06151
G1 X143.204 Y117.382 E.01598
G1 X142.189 Y118.397 E.03891
G1 X142.189 Y117.807 E.01598
G1 X142.801 Y117.195 E.02347
G1 X129.985 Y117.193 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F10844
G1 X129.367 Y117.811 E.02227
G1 X129.367 Y118.364 E.0141
G1 X130.364 Y117.367 E.03595
G1 X130.917 Y117.367 E.0141
G1 X129.367 Y118.917 E.05588
G1 X129.367 Y119.47 E.0141
G1 X131.47 Y117.367 E.07582
G1 X132.023 Y117.367 E.0141
G1 X129.367 Y120.023 E.09575
G1 X129.367 Y120.576 E.0141
G1 X132.576 Y117.367 E.11569
G1 X133.129 Y117.367 E.0141
G1 X129.367 Y121.129 E.13562
G1 X129.367 Y121.682 E.0141
G1 X133.682 Y117.367 E.15556
G1 X134.235 Y117.367 E.0141
G1 X129.367 Y122.235 E.1755
G1 X129.367 Y122.788 E.0141
G1 X134.788 Y117.367 E.19543
G1 X135.341 Y117.367 E.0141
G1 X129.367 Y123.341 E.21537
G1 X129.367 Y123.894 E.0141
G1 X135.894 Y117.367 E.2353
G1 X136.447 Y117.367 E.0141
G1 X129.367 Y124.447 E.25524
G1 X129.367 Y125 E.0141
G1 X137 Y117.367 E.27517
G1 X137.553 Y117.367 E.0141
G1 X129.367 Y125.553 E.29511
G1 X129.367 Y126.106 E.0141
G1 X138.106 Y117.367 E.31504
G1 X138.659 Y117.367 E.0141
G1 X129.367 Y126.659 E.33498
G1 X129.367 Y127.212 E.0141
G1 X139.212 Y117.367 E.35492
G1 X139.765 Y117.367 E.0141
G1 X129.367 Y127.765 E.37485
G1 X129.367 Y128.318 E.0141
G1 X140.318 Y117.367 E.39479
G1 X140.871 Y117.367 E.0141
G1 X129.367 Y128.871 E.41472
G1 X129.367 Y129.424 E.0141
G1 X141.424 Y117.367 E.43466
G1 X141.788 Y117.367 E.00928
G1 X141.788 Y117.556 E.00481
G1 X129.367 Y129.977 E.44779
G1 X129.367 Y130.53 E.0141
G1 X141.788 Y118.109 E.44779
G1 X141.788 Y118.662 E.0141
G1 X129.367 Y131.083 E.44779
G1 X129.367 Y131.636 E.0141
G1 X141.788 Y119.215 E.44779
G1 X141.788 Y119.768 E.0141
G1 X129.367 Y132.189 E.44779
G1 X129.367 Y132.742 E.0141
G1 X141.788 Y120.321 E.44779
G1 X141.788 Y120.874 E.0141
G1 X129.367 Y133.295 E.44779
G1 X129.367 Y133.848 E.0141
G1 X141.788 Y121.427 E.44779
G1 X141.788 Y121.98 E.0141
G1 X129.367 Y134.401 E.44779
G1 X129.367 Y134.633 E.00592
G1 X129.688 Y134.633 E.00818
G1 X141.788 Y122.533 E.43622
G1 X141.788 Y123.086 E.0141
G1 X130.241 Y134.633 E.41629
G1 X130.794 Y134.633 E.0141
G1 X141.788 Y123.639 E.39635
G1 X141.788 Y124.192 E.0141
G1 X131.347 Y134.633 E.37641
G1 X131.9 Y134.633 E.0141
G1 X141.788 Y124.745 E.35648
G1 X141.788 Y125.298 E.0141
G1 X132.453 Y134.633 E.33654
G1 X133.006 Y134.633 E.0141
G1 X141.788 Y125.851 E.31661
G1 X141.788 Y126.404 E.0141
G1 X133.559 Y134.633 E.29667
G1 X134.112 Y134.633 E.0141
G1 X141.788 Y126.957 E.27674
G1 X141.788 Y127.51 E.0141
G1 X134.665 Y134.633 E.2568
G1 X135.218 Y134.633 E.0141
G1 X141.788 Y128.063 E.23687
G1 X141.788 Y128.616 E.0141
G1 X135.771 Y134.633 E.21693
G1 X136.324 Y134.633 E.0141
G1 X141.788 Y129.169 E.19699
G1 X141.788 Y129.722 E.0141
G1 X136.877 Y134.633 E.17706
G1 X137.43 Y134.633 E.0141
G1 X141.788 Y130.275 E.15712
G1 X141.788 Y130.828 E.0141
G1 X137.983 Y134.633 E.13719
G1 X138.536 Y134.633 E.0141
G1 X141.788 Y131.381 E.11725
G1 X141.788 Y131.934 E.0141
G1 X139.089 Y134.633 E.09732
G1 X139.642 Y134.633 E.0141
M73 P78 R3
G1 X141.788 Y132.487 E.07738
G1 X141.788 Y133.04 E.0141
G1 X140.195 Y134.633 E.05744
G1 X140.748 Y134.633 E.0141
G1 X141.788 Y133.593 E.03751
G1 X141.788 Y134.146 E.0141
G1 X141.127 Y134.807 E.02383
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X141.788 Y134.146 E-.35523
G1 X141.788 Y133.593 E-.21014
G1 X141.426 Y133.955 E-.19463
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/45
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.28 I-.129 J1.21 P1  F30000
G1 X150.974 Y134.974 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X129.026 Y134.974 E.59471
G1 X129.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.59471
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X128.611 Y135.389 E.61724
G1 X128.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.61724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.339 Y134.08 Z4.44 F30000
G1 X142.002 Y134.006 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10802
G1 X142.614 Y134.618 E.02347
G1 X143.204 Y134.618 E.01598
G1 X142.189 Y133.603 E.03891
G1 X142.189 Y133.013 E.01598
G1 X143.794 Y134.618 E.06151
G1 X144.384 Y134.618 E.01598
G1 X142.189 Y132.423 E.08411
G1 X142.189 Y131.834 E.01598
G1 X144.974 Y134.618 E.10671
G1 X145.563 Y134.618 E.01598
G1 X142.189 Y131.244 E.12931
G1 X142.189 Y130.654 E.01598
G1 X146.153 Y134.618 E.15191
G1 X146.743 Y134.618 E.01598
G1 X142.189 Y130.064 E.17451
G1 X142.189 Y129.474 E.01598
G1 X147.333 Y134.618 E.19711
G1 X147.923 Y134.618 E.01598
G1 X142.189 Y128.885 E.21972
G1 X142.189 Y128.295 E.01598
G1 X148.512 Y134.618 E.24232
G1 X149.102 Y134.618 E.01598
G1 X142.189 Y127.705 E.26492
G1 X142.189 Y127.115 E.01598
G1 X149.692 Y134.618 E.28752
G1 X150.282 Y134.618 E.01598
G1 X142.189 Y126.525 E.31012
G1 X142.189 Y125.936 E.01598
G1 X150.618 Y134.365 E.32302
G1 X150.618 Y133.775 E.01598
G1 X142.189 Y125.346 E.32302
G1 X142.189 Y124.756 E.01598
G1 X150.618 Y133.185 E.32302
G1 X150.618 Y132.596 E.01598
G1 X142.189 Y124.166 E.32302
G1 X142.189 Y123.577 E.01598
G1 X150.618 Y132.006 E.32302
G1 X150.618 Y131.416 E.01598
G1 X142.189 Y122.987 E.32302
G1 X142.189 Y122.397 E.01598
G1 X150.618 Y130.826 E.32302
G1 X150.618 Y130.236 E.01598
G1 X142.189 Y121.807 E.32302
G1 X142.189 Y121.217 E.01598
G1 X150.618 Y129.647 E.32302
G1 X150.618 Y129.057 E.01598
G1 X142.189 Y120.628 E.32302
G1 X142.189 Y120.038 E.01598
G1 X150.618 Y128.467 E.32302
G1 X150.618 Y127.877 E.01598
G1 X142.189 Y119.448 E.32302
G1 X142.189 Y118.858 E.01598
G1 X150.618 Y127.287 E.32302
G1 X150.618 Y126.698 E.01598
G1 X142.189 Y118.268 E.32302
G1 X142.189 Y117.679 E.01598
G1 X150.618 Y126.108 E.32302
G1 X150.618 Y125.518 E.01598
G1 X142.482 Y117.382 E.31179
G1 X143.072 Y117.382 E.01598
G1 X150.618 Y124.928 E.28919
G1 X150.618 Y124.339 E.01598
G1 X143.661 Y117.382 E.26659
G1 X144.251 Y117.382 E.01598
G1 X150.618 Y123.749 E.24399
G1 X150.618 Y123.159 E.01598
G1 X144.841 Y117.382 E.22139
G1 X145.431 Y117.382 E.01598
G1 X150.618 Y122.569 E.19879
G1 X150.618 Y121.979 E.01598
G1 X146.021 Y117.382 E.17618
G1 X146.61 Y117.382 E.01598
G1 X150.618 Y121.39 E.15358
G1 X150.618 Y120.8 E.01598
G1 X147.2 Y117.382 E.13098
G1 X147.79 Y117.382 E.01598
G1 X150.618 Y120.21 E.10838
G1 X150.618 Y119.62 E.01598
G1 X148.38 Y117.382 E.08578
G1 X148.969 Y117.382 E.01598
G1 X150.618 Y119.031 E.06318
G1 X150.618 Y118.441 E.01598
G1 X149.559 Y117.382 E.04058
G1 X150.149 Y117.382 E.01598
G1 X150.805 Y118.038 E.02514
G1 X141.962 Y118.028 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.425366
G1 F10802
G1 X141.301 Y117.367 E.02383
G1 X140.748 Y117.367 E.0141
G1 X141.788 Y118.407 E.03751
G1 X141.788 Y118.96 E.0141
G1 X140.195 Y117.367 E.05744
G1 X139.642 Y117.367 E.0141
G1 X141.788 Y119.513 E.07738
G1 X141.788 Y120.066 E.0141
G1 X139.089 Y117.367 E.09732
G1 X138.536 Y117.367 E.0141
G1 X141.788 Y120.619 E.11725
G1 X141.788 Y121.172 E.0141
G1 X137.983 Y117.367 E.13719
G1 X137.43 Y117.367 E.0141
G1 X141.788 Y121.725 E.15712
G1 X141.788 Y122.278 E.0141
G1 X136.877 Y117.367 E.17706
G1 X136.324 Y117.367 E.0141
G1 X141.788 Y122.831 E.19699
G1 X141.788 Y123.384 E.0141
G1 X135.771 Y117.367 E.21693
G1 X135.218 Y117.367 E.0141
G1 X141.788 Y123.937 E.23687
G1 X141.788 Y124.49 E.0141
G1 X134.665 Y117.367 E.2568
G1 X134.112 Y117.367 E.0141
G1 X141.788 Y125.043 E.27674
G1 X141.788 Y125.596 E.0141
G1 X133.559 Y117.367 E.29667
G1 X133.006 Y117.367 E.0141
G1 X141.788 Y126.149 E.31661
G1 X141.788 Y126.702 E.0141
G1 X132.453 Y117.367 E.33654
G1 X131.9 Y117.367 E.0141
G1 X141.788 Y127.255 E.35648
G1 X141.788 Y127.808 E.0141
G1 X131.347 Y117.367 E.37642
G1 X130.794 Y117.367 E.0141
G1 X141.788 Y128.361 E.39635
G1 X141.788 Y128.914 E.0141
G1 X130.241 Y117.367 E.41629
G1 X129.688 Y117.367 E.0141
G1 X141.788 Y129.467 E.43622
G1 X141.788 Y130.02 E.0141
G1 X129.367 Y117.599 E.44779
G1 X129.367 Y118.152 E.0141
G1 X141.788 Y130.573 E.44779
G1 X141.788 Y131.126 E.0141
G1 X129.367 Y118.705 E.44779
G1 X129.367 Y119.258 E.0141
G1 X141.788 Y131.679 E.44779
G1 X141.788 Y132.232 E.0141
G1 X129.367 Y119.811 E.44779
G1 X129.367 Y120.364 E.0141
G1 X141.788 Y132.785 E.44779
G1 X141.788 Y133.338 E.0141
G1 X129.367 Y120.917 E.44779
G1 X129.367 Y121.47 E.0141
G1 X141.788 Y133.891 E.44779
G1 X141.788 Y134.444 E.0141
G1 X129.367 Y122.023 E.44779
G1 X129.367 Y122.576 E.0141
G1 X141.424 Y134.633 E.43466
G1 X140.871 Y134.633 E.0141
G1 X129.367 Y123.129 E.41472
G1 X129.367 Y123.682 E.0141
G1 X140.318 Y134.633 E.39479
G1 X139.765 Y134.633 E.0141
G1 X129.367 Y124.235 E.37485
G1 X129.367 Y124.788 E.0141
G1 X139.212 Y134.633 E.35492
G1 X138.659 Y134.633 E.0141
G1 X129.367 Y125.341 E.33498
G1 X129.367 Y125.894 E.0141
G1 X138.106 Y134.633 E.31504
G1 X137.553 Y134.633 E.0141
G1 X129.367 Y126.447 E.29511
G1 X129.367 Y127 E.0141
G1 X137 Y134.633 E.27517
G1 X136.447 Y134.633 E.0141
G1 X129.367 Y127.553 E.25524
G1 X129.367 Y128.106 E.0141
G1 X135.894 Y134.633 E.2353
M73 P79 R3
G1 X135.341 Y134.633 E.0141
G1 X129.367 Y128.659 E.21537
G1 X129.367 Y129.212 E.0141
G1 X134.788 Y134.633 E.19543
G1 X134.235 Y134.633 E.0141
G1 X129.367 Y129.765 E.1755
G1 X129.367 Y130.318 E.0141
G1 X133.682 Y134.633 E.15556
G1 X133.129 Y134.633 E.0141
G1 X129.367 Y130.871 E.13562
G1 X129.367 Y131.424 E.0141
G1 X132.576 Y134.633 E.11569
G1 X132.023 Y134.633 E.0141
G1 X129.367 Y131.977 E.09575
G1 X129.367 Y132.53 E.0141
G1 X131.47 Y134.633 E.07582
G1 X130.917 Y134.633 E.0141
G1 X129.367 Y133.083 E.05588
G1 X129.367 Y133.636 E.0141
G1 X130.364 Y134.633 E.03595
G1 X129.811 Y134.633 E.0141
G1 X129.193 Y134.015 E.02227
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11508.067
G1 X129.811 Y134.633 E-.33193
G1 X130.364 Y134.633 E-.21014
G1 X129.958 Y134.228 E-.21793
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/45
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.44 I-.043 J1.216 P1  F30000
G1 X150.974 Y134.974 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X141.752 Y134.974 E.24987
G1 X141.752 Y117.026 E.48632
G1 X150.974 Y117.026 E.24987
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F9000
G1 X141.337 Y135.389 E.2724
G1 X141.337 Y116.611 E.50885
G1 X151.389 Y116.611 E.2724
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X128.21 Y135.79 E.59283
G1 X128.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.59283
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.735 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.961 Y134.805 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826.06
G1 X150.618 Y134.148 E.02519
G1 X150.618 Y133.557 E.016
G1 X149.557 Y134.618 E.04066
G1 X148.967 Y134.618 E.016
G1 X150.618 Y132.967 E.06329
G1 X150.618 Y132.376 E.016
G1 X148.376 Y134.618 E.08592
G1 X147.785 Y134.618 E.016
G1 X150.618 Y131.785 E.10856
G1 X150.618 Y131.195 E.016
G1 X147.195 Y134.618 E.13119
G1 X146.604 Y134.618 E.016
G1 X150.618 Y130.604 E.15382
G1 X150.618 Y130.013 E.016
G1 X146.013 Y134.618 E.17646
G1 X145.423 Y134.618 E.016
G1 X150.618 Y129.423 E.19909
G1 X150.618 Y128.832 E.016
G1 X144.832 Y134.618 E.22172
G1 X144.242 Y134.618 E.016
G1 X150.618 Y128.242 E.24436
G1 X150.618 Y127.651 E.016
G1 X143.651 Y134.618 E.26699
G1 X143.06 Y134.618 E.016
G1 X150.618 Y127.06 E.28962
G1 X150.618 Y126.47 E.016
G1 X142.47 Y134.618 E.31225
G1 X142.108 Y134.618 E.00981
G1 X142.108 Y134.389 E.0062
G1 X150.618 Y125.879 E.32612
G1 X150.618 Y125.289 E.016
G1 X142.108 Y133.799 E.32612
G1 X142.108 Y133.208 E.016
G1 X150.618 Y124.698 E.32612
G1 X150.618 Y124.107 E.016
G1 X142.108 Y132.618 E.32612
G1 X142.108 Y132.027 E.016
G1 X150.618 Y123.517 E.32612
G1 X150.618 Y122.926 E.016
G1 X142.108 Y131.436 E.32612
G1 X142.108 Y130.846 E.016
G1 X150.618 Y122.335 E.32612
G1 X150.618 Y121.745 E.016
G1 X142.108 Y130.255 E.32612
G1 X142.108 Y129.665 E.016
G1 X150.618 Y121.154 E.32612
G1 X150.618 Y120.564 E.016
G1 X142.108 Y129.074 E.32612
G1 X142.108 Y128.483 E.016
G1 X150.618 Y119.973 E.32612
G1 X150.618 Y119.382 E.016
G1 X142.108 Y127.893 E.32612
G1 X142.108 Y127.302 E.016
G1 X150.618 Y118.792 E.32612
G1 X150.618 Y118.201 E.016
G1 X142.108 Y126.711 E.32612
G1 X142.108 Y126.121 E.016
G1 X150.618 Y117.61 E.32612
G1 X150.618 Y117.382 E.0062
G1 X150.256 Y117.382 E.00981
G1 X142.108 Y125.53 E.31225
G1 X142.108 Y124.94 E.016
G1 X149.666 Y117.382 E.28962
G1 X149.075 Y117.382 E.016
G1 X142.108 Y124.349 E.26699
G1 X142.108 Y123.758 E.016
G1 X148.484 Y117.382 E.24435
G1 X147.894 Y117.382 E.016
G1 X142.108 Y123.168 E.22172
G1 X142.108 Y122.577 E.016
G1 X147.303 Y117.382 E.19909
G1 X146.712 Y117.382 E.016
G1 X142.108 Y121.986 E.17645
G1 X142.108 Y121.396 E.016
G1 X146.122 Y117.382 E.15382
G1 X145.531 Y117.382 E.016
G1 X142.108 Y120.805 E.13119
G1 X142.108 Y120.215 E.016
G1 X144.941 Y117.382 E.10856
G1 X144.35 Y117.382 E.016
G1 X142.108 Y119.624 E.08592
G1 X142.108 Y119.033 E.016
G1 X143.759 Y117.382 E.06329
G1 X143.169 Y117.382 E.016
G1 X142.108 Y118.443 E.04066
G1 X142.108 Y117.852 E.016
G1 X142.765 Y117.195 E.02519
; WIPE_START
G1 X142.108 Y117.852 E-.35326
G1 X142.108 Y118.443 E-.22444
G1 X142.447 Y118.104 E-.1823
; WIPE_END
G1 E-.04 F1800
G1 X141.844 Y125.712 Z4.6 F30000
G1 X141.109 Y134.979 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X140.511 Y135.578 E.02128
G1 X139.966 Y135.578
G1 X141.109 Y134.434 E.04067
G1 X141.109 Y133.889
G1 X139.42 Y135.578 E.06006
G1 X138.875 Y135.578
G1 X141.109 Y133.343 E.07945
G1 X141.109 Y132.798
G1 X138.329 Y135.578 E.09885
G1 X137.784 Y135.578
G1 X141.109 Y132.252 E.11824
G1 X141.109 Y131.707
G1 X137.239 Y135.578 E.13763
G1 X136.693 Y135.578
G1 X141.109 Y131.162 E.15702
G1 X141.109 Y130.616
G1 X136.148 Y135.578 E.17641
G1 X135.602 Y135.578
G1 X141.109 Y130.071 E.19581
G1 X141.109 Y129.525
G1 X135.057 Y135.578 E.2152
G1 X134.511 Y135.578
G1 X141.109 Y128.98 E.23459
G1 X141.109 Y128.435
G1 X133.966 Y135.578 E.25398
G1 X133.421 Y135.578
G1 X141.109 Y127.889 E.27337
G1 X141.109 Y127.344
G1 X132.875 Y135.578 E.29277
G1 X132.33 Y135.578
G1 X141.109 Y126.798 E.31216
G1 X141.109 Y126.253
G1 X131.784 Y135.578 E.33155
G1 X131.239 Y135.578
G1 X141.109 Y125.708 E.35094
G1 X141.109 Y125.162
G1 X130.694 Y135.578 E.37033
G1 X130.148 Y135.578
G1 X141.109 Y124.617 E.38973
G1 X141.109 Y124.071
G1 X129.603 Y135.578 E.40912
G1 X129.057 Y135.578
G1 X141.109 Y123.526 E.42851
G1 X141.109 Y122.981
G1 X128.512 Y135.578 E.4479
G1 X128.422 Y135.122
G1 X141.109 Y122.435 E.4511
G1 X141.109 Y121.89
G1 X128.422 Y134.577 E.4511
G1 X128.422 Y134.032
G1 X141.109 Y121.344 E.4511
G1 X141.109 Y120.799
G1 X128.422 Y133.486 E.4511
G1 X128.422 Y132.941
G1 X141.109 Y120.254 E.4511
G1 X141.109 Y119.708
M73 P80 R3
G1 X128.422 Y132.395 E.4511
G1 X128.422 Y131.85
G1 X141.109 Y119.163 E.4511
G1 X141.109 Y118.617
G1 X128.422 Y131.305 E.4511
G1 X128.422 Y130.759
G1 X141.109 Y118.072 E.4511
G1 X141.109 Y117.526
G1 X128.422 Y130.214 E.4511
G1 X128.422 Y129.668
G1 X141.109 Y116.981 E.4511
G1 X141.109 Y116.436
G1 X128.422 Y129.123 E.4511
G1 X128.422 Y128.578
G1 X140.578 Y116.422 E.43219
G1 X140.032 Y116.422
G1 X128.422 Y128.032 E.4128
G1 X128.422 Y127.487
G1 X139.487 Y116.422 E.39341
G1 X138.941 Y116.422
G1 X128.422 Y126.941 E.37401
G1 X128.422 Y126.396
G1 X138.396 Y116.422 E.35462
G1 X137.851 Y116.422
G1 X128.422 Y125.851 E.33523
G1 X128.422 Y125.305
G1 X137.305 Y116.422 E.31584
G1 X136.76 Y116.422
G1 X128.422 Y124.76 E.29645
G1 X128.422 Y124.214
G1 X136.214 Y116.422 E.27705
G1 X135.669 Y116.422
G1 X128.422 Y123.669 E.25766
G1 X128.422 Y123.123
G1 X135.124 Y116.422 E.23827
G1 X134.578 Y116.422
G1 X128.422 Y122.578 E.21888
G1 X128.422 Y122.033
G1 X134.033 Y116.422 E.19949
G1 X133.487 Y116.422
G1 X128.422 Y121.487 E.18009
G1 X128.422 Y120.942
G1 X132.942 Y116.422 E.1607
G1 X132.396 Y116.422
G1 X128.422 Y120.396 E.14131
G1 X128.422 Y119.851
G1 X131.851 Y116.422 E.12192
G1 X131.306 Y116.422
G1 X128.422 Y119.306 E.10253
G1 X128.422 Y118.76
G1 X130.76 Y116.422 E.08313
G1 X130.215 Y116.422
G1 X128.422 Y118.215 E.06374
G1 X128.422 Y117.669
G1 X129.669 Y116.422 E.04435
G1 X129.124 Y116.422
G1 X128.422 Y117.124 E.02496
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S10000
G1 X129.124 Y116.422 E-.37723
G1 X129.669 Y116.422 E-.20725
G1 X129.343 Y116.749 E-.17553
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/45
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.6 I-.784 J.931 P1  F30000
G1 X150.974 Y134.974 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4675
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4675
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.34 Y134.081 Z4.76 F30000
G1 X142.002 Y134.006 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4675
G1 X142.614 Y134.618 E.02347
G1 X143.204 Y134.618 E.01598
G1 X142.189 Y133.603 E.03891
G1 X142.189 Y133.013 E.01598
G1 X143.794 Y134.618 E.06151
G1 X144.384 Y134.618 E.01598
G1 X142.189 Y132.423 E.08411
G1 X142.189 Y131.834 E.01598
G1 X144.974 Y134.618 E.10671
G1 X145.563 Y134.618 E.01598
G1 X142.189 Y131.244 E.12931
G1 X142.189 Y130.654 E.01598
G1 X146.153 Y134.618 E.15191
G1 X146.743 Y134.618 E.01598
G1 X142.189 Y130.064 E.17451
G1 X142.189 Y129.474 E.01598
G1 X147.333 Y134.618 E.19711
G1 X147.923 Y134.618 E.01598
G1 X142.189 Y128.885 E.21972
G1 X142.189 Y128.295 E.01598
G1 X148.512 Y134.618 E.24232
G1 X149.102 Y134.618 E.01598
G1 X142.189 Y127.705 E.26492
G1 X142.189 Y127.115 E.01598
G1 X149.692 Y134.618 E.28752
G1 X150.282 Y134.618 E.01598
G1 X142.189 Y126.525 E.31012
G1 X142.189 Y125.936 E.01598
G1 X150.618 Y134.365 E.32302
G1 X150.618 Y133.775 E.01598
G1 X142.189 Y125.346 E.32302
G1 X142.189 Y124.756 E.01598
G1 X150.618 Y133.185 E.32302
G1 X150.618 Y132.596 E.01598
G1 X142.189 Y124.166 E.32302
M73 P81 R3
G1 X142.189 Y123.577 E.01598
G1 X150.618 Y132.006 E.32302
G1 X150.618 Y131.416 E.01598
G1 X142.189 Y122.987 E.32302
G1 X142.189 Y122.397 E.01598
G1 X150.618 Y130.826 E.32302
G1 X150.618 Y130.236 E.01598
G1 X142.189 Y121.807 E.32302
G1 X142.189 Y121.217 E.01598
G1 X150.618 Y129.647 E.32302
G1 X150.618 Y129.057 E.01598
G1 X142.189 Y120.628 E.32302
G1 X142.189 Y120.038 E.01598
G1 X150.618 Y128.467 E.32302
G1 X150.618 Y127.877 E.01598
G1 X142.189 Y119.448 E.32302
G1 X142.189 Y118.858 E.01598
G1 X150.618 Y127.287 E.32302
G1 X150.618 Y126.698 E.01598
G1 X142.189 Y118.268 E.32302
G1 X142.189 Y117.679 E.01598
G1 X150.618 Y126.108 E.32302
G1 X150.618 Y125.518 E.01598
G1 X142.482 Y117.382 E.31179
G1 X143.072 Y117.382 E.01598
G1 X150.618 Y124.928 E.28919
G1 X150.618 Y124.339 E.01598
G1 X143.661 Y117.382 E.26659
G1 X144.251 Y117.382 E.01598
G1 X150.618 Y123.749 E.24399
G1 X150.618 Y123.159 E.01598
G1 X144.841 Y117.382 E.22139
G1 X145.431 Y117.382 E.01598
G1 X150.618 Y122.569 E.19879
G1 X150.618 Y121.979 E.01598
G1 X146.021 Y117.382 E.17618
G1 X146.61 Y117.382 E.01598
G1 X150.618 Y121.39 E.15358
G1 X150.618 Y120.8 E.01598
G1 X147.2 Y117.382 E.13098
G1 X147.79 Y117.382 E.01598
G1 X150.618 Y120.21 E.10838
G1 X150.618 Y119.62 E.01598
G1 X148.38 Y117.382 E.08578
G1 X148.969 Y117.382 E.01598
G1 X150.618 Y119.031 E.06318
G1 X150.618 Y118.441 E.01598
G1 X149.559 Y117.382 E.04058
G1 X150.149 Y117.382 E.01598
G1 X150.805 Y118.038 E.02514
G1 X141.794 Y117.608 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407806
G1 F4675
G1 X141.794 Y117.421 E.00455
G1 X141.421 Y117.421 E.00909
G1 X141.421 Y134.579 E.41774
G1 X141.794 Y134.579 E.00909
G1 X141.794 Y117.668 E.41174
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12049.162
G1 X141.794 Y119.668 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/45
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.76 I-1.044 J.626 P1  F30000
G1 X150.974 Y134.974 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4641
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4641
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.962 Y134.805 Z4.92 F30000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4641
G1 X150.618 Y134.149 E.02514
G1 X150.618 Y133.559 E.01598
G1 X149.559 Y134.618 E.04058
G1 X148.969 Y134.618 E.01598
G1 X150.618 Y132.969 E.06318
G1 X150.618 Y132.38 E.01598
G1 X148.38 Y134.618 E.08578
G1 X147.79 Y134.618 E.01598
G1 X150.618 Y131.79 E.10838
G1 X150.618 Y131.2 E.01598
G1 X147.2 Y134.618 E.13098
G1 X146.61 Y134.618 E.01598
G1 X150.618 Y130.61 E.15358
G1 X150.618 Y130.021 E.01598
G1 X146.021 Y134.618 E.17618
G1 X145.431 Y134.618 E.01598
G1 X150.618 Y129.431 E.19879
G1 X150.618 Y128.841 E.01598
G1 X144.841 Y134.618 E.22139
G1 X144.251 Y134.618 E.01598
G1 X150.618 Y128.251 E.24399
G1 X150.618 Y127.661 E.01598
G1 X143.661 Y134.618 E.26659
G1 X143.072 Y134.618 E.01598
G1 X150.618 Y127.072 E.28919
G1 X150.618 Y126.482 E.01598
G1 X142.482 Y134.618 E.31179
G1 X142.189 Y134.618 E.00794
G1 X142.189 Y134.321 E.00804
G1 X150.618 Y125.892 E.32302
M73 P81 R2
G1 X150.618 Y125.302 E.01598
G1 X142.189 Y133.731 E.32302
G1 X142.189 Y133.142 E.01598
G1 X150.618 Y124.713 E.32302
G1 X150.618 Y124.123 E.01598
G1 X142.189 Y132.552 E.32302
G1 X142.189 Y131.962 E.01598
G1 X150.618 Y123.533 E.32302
G1 X150.618 Y122.943 E.01598
G1 X142.189 Y131.372 E.32302
G1 X142.189 Y130.783 E.01598
G1 X150.618 Y122.353 E.32302
M73 P82 R2
G1 X150.618 Y121.764 E.01598
G1 X142.189 Y130.193 E.32302
G1 X142.189 Y129.603 E.01598
G1 X150.618 Y121.174 E.32302
G1 X150.618 Y120.584 E.01598
G1 X142.189 Y129.013 E.32302
G1 X142.189 Y128.423 E.01598
G1 X150.618 Y119.994 E.32302
G1 X150.618 Y119.404 E.01598
G1 X142.189 Y127.834 E.32302
G1 X142.189 Y127.244 E.01598
G1 X150.618 Y118.815 E.32302
G1 X150.618 Y118.225 E.01598
G1 X142.189 Y126.654 E.32302
G1 X142.189 Y126.064 E.01598
G1 X150.618 Y117.635 E.32302
G1 X150.618 Y117.382 E.00686
G1 X150.282 Y117.382 E.00912
G1 X142.189 Y125.475 E.31012
G1 X142.189 Y124.885 E.01598
G1 X149.692 Y117.382 E.28752
G1 X149.102 Y117.382 E.01598
G1 X142.189 Y124.295 E.26492
G1 X142.189 Y123.705 E.01598
G1 X148.512 Y117.382 E.24232
G1 X147.923 Y117.382 E.01598
G1 X142.189 Y123.115 E.21972
G1 X142.189 Y122.526 E.01598
G1 X147.333 Y117.382 E.19711
G1 X146.743 Y117.382 E.01598
G1 X142.189 Y121.936 E.17451
G1 X142.189 Y121.346 E.01598
G1 X146.153 Y117.382 E.15191
G1 X145.563 Y117.382 E.01598
G1 X142.189 Y120.756 E.12931
G1 X142.189 Y120.166 E.01598
G1 X144.974 Y117.382 E.10671
G1 X144.384 Y117.382 E.01598
G1 X142.189 Y119.577 E.08411
G1 X142.189 Y118.987 E.01598
G1 X143.794 Y117.382 E.06151
G1 X143.204 Y117.382 E.01598
G1 X142.189 Y118.397 E.03891
G1 X142.189 Y117.807 E.01598
G1 X142.801 Y117.195 E.02347
G1 X141.794 Y117.608 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407806
G1 F4641
G1 X141.794 Y117.421 E.00455
G1 X141.421 Y117.421 E.00909
G1 X141.421 Y134.579 E.41774
G1 X141.794 Y134.579 E.00909
G1 X141.794 Y117.668 E.41174
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12049.162
G1 X141.794 Y119.668 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/45
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z4.92 I-1.044 J.626 P1  F30000
G1 X150.974 Y134.974 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4662
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4662
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.34 Y134.081 Z5.08 F30000
G1 X142.002 Y134.006 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4662
G1 X142.614 Y134.618 E.02347
G1 X143.204 Y134.618 E.01598
G1 X142.189 Y133.603 E.03891
G1 X142.189 Y133.013 E.01598
G1 X143.794 Y134.618 E.06151
G1 X144.384 Y134.618 E.01598
G1 X142.189 Y132.423 E.08411
G1 X142.189 Y131.834 E.01598
G1 X144.974 Y134.618 E.10671
G1 X145.563 Y134.618 E.01598
G1 X142.189 Y131.244 E.12931
G1 X142.189 Y130.654 E.01598
G1 X146.153 Y134.618 E.15191
G1 X146.743 Y134.618 E.01598
G1 X142.189 Y130.064 E.17451
G1 X142.189 Y129.474 E.01598
G1 X147.333 Y134.618 E.19711
G1 X147.923 Y134.618 E.01598
G1 X142.189 Y128.885 E.21972
G1 X142.189 Y128.295 E.01598
G1 X148.512 Y134.618 E.24232
G1 X149.102 Y134.618 E.01598
G1 X142.189 Y127.705 E.26492
G1 X142.189 Y127.115 E.01598
G1 X149.692 Y134.618 E.28752
G1 X150.282 Y134.618 E.01598
G1 X142.189 Y126.525 E.31012
G1 X142.189 Y125.936 E.01598
G1 X150.618 Y134.365 E.32302
G1 X150.618 Y133.775 E.01598
G1 X142.189 Y125.346 E.32302
G1 X142.189 Y124.756 E.01598
G1 X150.618 Y133.185 E.32302
G1 X150.618 Y132.596 E.01598
G1 X142.189 Y124.166 E.32302
G1 X142.189 Y123.577 E.01598
G1 X150.618 Y132.006 E.32302
G1 X150.618 Y131.416 E.01598
G1 X142.189 Y122.987 E.32302
G1 X142.189 Y122.397 E.01598
G1 X150.618 Y130.826 E.32302
G1 X150.618 Y130.236 E.01598
G1 X142.189 Y121.807 E.32302
G1 X142.189 Y121.217 E.01598
G1 X150.618 Y129.647 E.32302
G1 X150.618 Y129.057 E.01598
G1 X142.189 Y120.628 E.32302
G1 X142.189 Y120.038 E.01598
G1 X150.618 Y128.467 E.32302
G1 X150.618 Y127.877 E.01598
G1 X142.189 Y119.448 E.32302
G1 X142.189 Y118.858 E.01598
G1 X150.618 Y127.287 E.32302
G1 X150.618 Y126.698 E.01598
G1 X142.189 Y118.268 E.32302
G1 X142.189 Y117.679 E.01598
G1 X150.618 Y126.108 E.32302
G1 X150.618 Y125.518 E.01598
G1 X142.482 Y117.382 E.31179
M73 P83 R2
G1 X143.072 Y117.382 E.01598
G1 X150.618 Y124.928 E.28919
G1 X150.618 Y124.339 E.01598
G1 X143.661 Y117.382 E.26659
G1 X144.251 Y117.382 E.01598
G1 X150.618 Y123.749 E.24399
G1 X150.618 Y123.159 E.01598
G1 X144.841 Y117.382 E.22139
G1 X145.431 Y117.382 E.01598
G1 X150.618 Y122.569 E.19879
G1 X150.618 Y121.979 E.01598
G1 X146.021 Y117.382 E.17618
G1 X146.61 Y117.382 E.01598
G1 X150.618 Y121.39 E.15358
G1 X150.618 Y120.8 E.01598
G1 X147.2 Y117.382 E.13098
G1 X147.79 Y117.382 E.01598
G1 X150.618 Y120.21 E.10838
G1 X150.618 Y119.62 E.01598
G1 X148.38 Y117.382 E.08578
G1 X148.969 Y117.382 E.01598
G1 X150.618 Y119.031 E.06318
G1 X150.618 Y118.441 E.01598
G1 X149.559 Y117.382 E.04058
G1 X150.149 Y117.382 E.01598
G1 X150.805 Y118.038 E.02514
G1 X141.794 Y117.608 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407806
G1 F4662
G1 X141.794 Y117.421 E.00455
G1 X141.421 Y117.421 E.00909
G1 X141.421 Y134.579 E.41774
G1 X141.794 Y134.579 E.00909
G1 X141.794 Y117.668 E.41174
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12049.162
G1 X141.794 Y119.668 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/45
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.08 I-1.044 J.626 P1  F30000
G1 X150.974 Y134.974 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4641
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4641
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.962 Y134.805 Z5.24 F30000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4641
G1 X150.618 Y134.149 E.02514
G1 X150.618 Y133.559 E.01598
G1 X149.559 Y134.618 E.04058
G1 X148.969 Y134.618 E.01598
G1 X150.618 Y132.969 E.06318
G1 X150.618 Y132.38 E.01598
G1 X148.38 Y134.618 E.08578
G1 X147.79 Y134.618 E.01598
G1 X150.618 Y131.79 E.10838
G1 X150.618 Y131.2 E.01598
G1 X147.2 Y134.618 E.13098
G1 X146.61 Y134.618 E.01598
G1 X150.618 Y130.61 E.15358
G1 X150.618 Y130.021 E.01598
G1 X146.021 Y134.618 E.17618
G1 X145.431 Y134.618 E.01598
G1 X150.618 Y129.431 E.19879
G1 X150.618 Y128.841 E.01598
G1 X144.841 Y134.618 E.22139
G1 X144.251 Y134.618 E.01598
G1 X150.618 Y128.251 E.24399
G1 X150.618 Y127.661 E.01598
G1 X143.661 Y134.618 E.26659
G1 X143.072 Y134.618 E.01598
G1 X150.618 Y127.072 E.28919
G1 X150.618 Y126.482 E.01598
G1 X142.482 Y134.618 E.31179
G1 X142.189 Y134.618 E.00794
G1 X142.189 Y134.321 E.00804
G1 X150.618 Y125.892 E.32302
G1 X150.618 Y125.302 E.01598
G1 X142.189 Y133.731 E.32302
G1 X142.189 Y133.142 E.01598
G1 X150.618 Y124.713 E.32302
G1 X150.618 Y124.123 E.01598
G1 X142.189 Y132.552 E.32302
G1 X142.189 Y131.962 E.01598
G1 X150.618 Y123.533 E.32302
G1 X150.618 Y122.943 E.01598
G1 X142.189 Y131.372 E.32302
G1 X142.189 Y130.783 E.01598
G1 X150.618 Y122.353 E.32302
G1 X150.618 Y121.764 E.01598
G1 X142.189 Y130.193 E.32302
G1 X142.189 Y129.603 E.01598
G1 X150.618 Y121.174 E.32302
G1 X150.618 Y120.584 E.01598
G1 X142.189 Y129.013 E.32302
G1 X142.189 Y128.423 E.01598
G1 X150.618 Y119.994 E.32302
G1 X150.618 Y119.404 E.01598
G1 X142.189 Y127.834 E.32302
G1 X142.189 Y127.244 E.01598
G1 X150.618 Y118.815 E.32302
G1 X150.618 Y118.225 E.01598
G1 X142.189 Y126.654 E.32302
G1 X142.189 Y126.064 E.01598
G1 X150.618 Y117.635 E.32302
G1 X150.618 Y117.382 E.00686
G1 X150.282 Y117.382 E.00912
G1 X142.189 Y125.475 E.31012
G1 X142.189 Y124.885 E.01598
G1 X149.692 Y117.382 E.28752
G1 X149.102 Y117.382 E.01598
G1 X142.189 Y124.295 E.26492
G1 X142.189 Y123.705 E.01598
G1 X148.512 Y117.382 E.24232
G1 X147.923 Y117.382 E.01598
G1 X142.189 Y123.115 E.21972
G1 X142.189 Y122.526 E.01598
G1 X147.333 Y117.382 E.19711
G1 X146.743 Y117.382 E.01598
G1 X142.189 Y121.936 E.17451
G1 X142.189 Y121.346 E.01598
G1 X146.153 Y117.382 E.15191
G1 X145.563 Y117.382 E.01598
G1 X142.189 Y120.756 E.12931
M73 P84 R2
G1 X142.189 Y120.166 E.01598
G1 X144.974 Y117.382 E.10671
G1 X144.384 Y117.382 E.01598
G1 X142.189 Y119.577 E.08411
G1 X142.189 Y118.987 E.01598
G1 X143.794 Y117.382 E.06151
G1 X143.204 Y117.382 E.01598
G1 X142.189 Y118.397 E.03891
G1 X142.189 Y117.807 E.01598
G1 X142.801 Y117.195 E.02347
G1 X141.794 Y117.608 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.407806
G1 F4641
G1 X141.794 Y117.421 E.00455
G1 X141.421 Y117.421 E.00909
G1 X141.421 Y134.579 E.41774
G1 X141.794 Y134.579 E.00909
G1 X141.794 Y117.668 E.41174
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12049.162
G1 X141.794 Y119.668 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/45
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.24 I-1.044 J.626 P1  F30000
G1 X150.974 Y134.974 Z5.24
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4620
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4620
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.213 Y134.826 Z5.4 F30000
G1 X142.044 Y134.805 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4620
G1 X141.382 Y134.143 E.02536
G1 X141.382 Y133.55 E.01608
G1 X142.45 Y134.618 E.04094
G1 X143.044 Y134.618 E.01608
G1 X141.382 Y132.956 E.06368
G1 X141.382 Y132.363 E.01608
G1 X143.637 Y134.618 E.08643
G1 X144.231 Y134.618 E.01608
G1 X141.382 Y131.769 E.10918
G1 X141.382 Y131.176 E.01608
G1 X144.824 Y134.618 E.13192
G1 X145.418 Y134.618 E.01608
G1 X141.382 Y130.582 E.15467
G1 X141.382 Y129.988 E.01608
G1 X146.012 Y134.618 E.17741
G1 X146.605 Y134.618 E.01608
G1 X141.382 Y129.395 E.20016
G1 X141.382 Y128.801 E.01608
G1 X147.199 Y134.618 E.22291
G1 X147.792 Y134.618 E.01608
G1 X141.382 Y128.208 E.24565
G1 X141.382 Y127.614 E.01608
G1 X148.386 Y134.618 E.2684
G1 X148.979 Y134.618 E.01608
G1 X141.382 Y127.021 E.29114
G1 X141.382 Y126.427 E.01608
G1 X149.573 Y134.618 E.31389
G1 X150.166 Y134.618 E.01608
G1 X141.382 Y125.834 E.33663
G1 X141.382 Y125.24 E.01608
G1 X150.618 Y134.476 E.35394
G1 X150.618 Y133.883 E.01608
G1 X141.382 Y124.646 E.35394
G1 X141.382 Y124.053 E.01608
G1 X150.618 Y133.289 E.35394
G1 X150.618 Y132.696 E.01608
G1 X141.382 Y123.459 E.35394
G1 X141.382 Y122.866 E.01608
G1 X150.618 Y132.102 E.35394
G1 X150.618 Y131.508 E.01608
G1 X141.382 Y122.272 E.35394
G1 X141.382 Y121.679 E.01608
G1 X150.618 Y130.915 E.35394
G1 X150.618 Y130.321 E.01608
G1 X141.382 Y121.085 E.35394
G1 X141.382 Y120.492 E.01608
G1 X150.618 Y129.728 E.35394
G1 X150.618 Y129.134 E.01608
G1 X141.382 Y119.898 E.35394
G1 X141.382 Y119.304 E.01608
G1 X150.618 Y128.541 E.35394
G1 X150.618 Y127.947 E.01608
G1 X141.382 Y118.711 E.35394
G1 X141.382 Y118.117 E.01608
G1 X150.618 Y127.354 E.35394
G1 X150.618 Y126.76 E.01608
G1 X141.382 Y117.524 E.35394
G1 X141.382 Y117.382 E.00385
G1 X141.834 Y117.382 E.01224
G1 X150.618 Y126.166 E.33663
G1 X150.618 Y125.573 E.01608
G1 X142.427 Y117.382 E.31389
G1 X143.021 Y117.382 E.01608
G1 X150.618 Y124.979 E.29114
G1 X150.618 Y124.386 E.01608
G1 X143.614 Y117.382 E.2684
G1 X144.208 Y117.382 E.01608
G1 X150.618 Y123.792 E.24565
G1 X150.618 Y123.199 E.01608
G1 X144.801 Y117.382 E.22291
G1 X145.395 Y117.382 E.01608
G1 X150.618 Y122.605 E.20016
G1 X150.618 Y122.012 E.01608
G1 X145.988 Y117.382 E.17741
G1 X146.582 Y117.382 E.01608
G1 X150.618 Y121.418 E.15467
G1 X150.618 Y120.824 E.01608
G1 X147.176 Y117.382 E.13192
G1 X147.769 Y117.382 E.01608
G1 X150.618 Y120.231 E.10918
G1 X150.618 Y119.637 E.01608
G1 X148.363 Y117.382 E.08643
G1 X148.956 Y117.382 E.01608
G1 X150.618 Y119.044 E.06369
G1 X150.618 Y118.45 E.01608
G1 X149.55 Y117.382 E.04094
G1 X150.143 Y117.382 E.01608
M73 P85 R2
G1 X150.805 Y118.044 E.02536
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X150.143 Y117.382 E-.35566
G1 X149.55 Y117.382 E-.22555
G1 X149.883 Y117.715 E-.17879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/45
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.4 I-1.215 J.077 P1  F30000
G1 X150.974 Y134.974 Z5.4
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4609
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4609
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.956 Y134.805 Z5.56 F30000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4609
G1 X150.618 Y134.143 E.02536
G1 X150.618 Y133.55 E.01608
G1 X149.55 Y134.618 E.04094
G1 X148.956 Y134.618 E.01608
G1 X150.618 Y132.956 E.06369
G1 X150.618 Y132.363 E.01608
G1 X148.363 Y134.618 E.08643
G1 X147.769 Y134.618 E.01608
G1 X150.618 Y131.769 E.10918
G1 X150.618 Y131.176 E.01608
G1 X147.176 Y134.618 E.13192
G1 X146.582 Y134.618 E.01608
G1 X150.618 Y130.582 E.15467
G1 X150.618 Y129.988 E.01608
G1 X145.988 Y134.618 E.17741
G1 X145.395 Y134.618 E.01608
G1 X150.618 Y129.395 E.20016
G1 X150.618 Y128.801 E.01608
G1 X144.801 Y134.618 E.22291
G1 X144.208 Y134.618 E.01608
G1 X150.618 Y128.208 E.24565
G1 X150.618 Y127.614 E.01608
G1 X143.614 Y134.618 E.2684
G1 X143.021 Y134.618 E.01608
G1 X150.618 Y127.021 E.29114
G1 X150.618 Y126.427 E.01608
G1 X142.427 Y134.618 E.31389
G1 X141.834 Y134.618 E.01608
G1 X150.618 Y125.834 E.33664
G1 X150.618 Y125.24 E.01608
G1 X141.382 Y134.476 E.35394
G1 X141.382 Y133.883 E.01608
G1 X150.618 Y124.646 E.35394
G1 X150.618 Y124.053 E.01608
G1 X141.382 Y133.289 E.35394
G1 X141.382 Y132.696 E.01608
G1 X150.618 Y123.459 E.35394
G1 X150.618 Y122.866 E.01608
G1 X141.382 Y132.102 E.35394
G1 X141.382 Y131.508 E.01608
G1 X150.618 Y122.272 E.35394
G1 X150.618 Y121.679 E.01608
G1 X141.382 Y130.915 E.35394
G1 X141.382 Y130.321 E.01608
G1 X150.618 Y121.085 E.35394
G1 X150.618 Y120.492 E.01608
G1 X141.382 Y129.728 E.35394
G1 X141.382 Y129.134 E.01608
G1 X150.618 Y119.898 E.35394
G1 X150.618 Y119.304 E.01608
G1 X141.382 Y128.541 E.35394
G1 X141.382 Y127.947 E.01608
G1 X150.618 Y118.711 E.35394
G1 X150.618 Y118.117 E.01608
G1 X141.382 Y127.354 E.35394
G1 X141.382 Y126.76 E.01608
G1 X150.618 Y117.524 E.35394
G1 X150.618 Y117.382 E.00384
G1 X150.166 Y117.382 E.01224
G1 X141.382 Y126.166 E.33663
G1 X141.382 Y125.573 E.01608
G1 X149.573 Y117.382 E.31389
G1 X148.979 Y117.382 E.01608
G1 X141.382 Y124.979 E.29114
G1 X141.382 Y124.386 E.01608
G1 X148.386 Y117.382 E.2684
G1 X147.792 Y117.382 E.01608
G1 X141.382 Y123.792 E.24565
G1 X141.382 Y123.199 E.01608
G1 X147.199 Y117.382 E.2229
G1 X146.605 Y117.382 E.01608
G1 X141.382 Y122.605 E.20016
G1 X141.382 Y122.011 E.01608
G1 X146.012 Y117.382 E.17741
G1 X145.418 Y117.382 E.01608
G1 X141.382 Y121.418 E.15467
G1 X141.382 Y120.824 E.01608
G1 X144.824 Y117.382 E.13192
G1 X144.231 Y117.382 E.01608
G1 X141.382 Y120.231 E.10918
G1 X141.382 Y119.637 E.01608
G1 X143.637 Y117.382 E.08643
G1 X143.044 Y117.382 E.01608
G1 X141.382 Y119.044 E.06368
G1 X141.382 Y118.45 E.01608
G1 X142.45 Y117.382 E.04094
G1 X141.857 Y117.382 E.01608
G1 X141.195 Y118.044 E.02536
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X141.857 Y117.382 E-.35564
G1 X142.45 Y117.382 E-.22555
G1 X142.117 Y117.715 E-.17881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/45
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.56 I-1.083 J.556 P1  F30000
G1 X150.974 Y134.974 Z5.56
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4621
G1 X141.026 Y134.974 E.26954
M73 P86 R2
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4621
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.213 Y134.826 Z5.72 F30000
G1 X142.044 Y134.805 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4621
G1 X141.382 Y134.143 E.02536
G1 X141.382 Y133.55 E.01608
G1 X142.45 Y134.618 E.04094
G1 X143.044 Y134.618 E.01608
G1 X141.382 Y132.956 E.06368
G1 X141.382 Y132.363 E.01608
G1 X143.637 Y134.618 E.08643
G1 X144.231 Y134.618 E.01608
G1 X141.382 Y131.769 E.10918
G1 X141.382 Y131.176 E.01608
G1 X144.824 Y134.618 E.13192
G1 X145.418 Y134.618 E.01608
G1 X141.382 Y130.582 E.15467
G1 X141.382 Y129.988 E.01608
G1 X146.012 Y134.618 E.17741
G1 X146.605 Y134.618 E.01608
G1 X141.382 Y129.395 E.20016
G1 X141.382 Y128.801 E.01608
G1 X147.199 Y134.618 E.22291
G1 X147.792 Y134.618 E.01608
G1 X141.382 Y128.208 E.24565
G1 X141.382 Y127.614 E.01608
G1 X148.386 Y134.618 E.2684
G1 X148.979 Y134.618 E.01608
G1 X141.382 Y127.021 E.29114
G1 X141.382 Y126.427 E.01608
G1 X149.573 Y134.618 E.31389
G1 X150.166 Y134.618 E.01608
G1 X141.382 Y125.834 E.33663
G1 X141.382 Y125.24 E.01608
G1 X150.618 Y134.476 E.35394
G1 X150.618 Y133.883 E.01608
G1 X141.382 Y124.646 E.35394
G1 X141.382 Y124.053 E.01608
G1 X150.618 Y133.289 E.35394
G1 X150.618 Y132.696 E.01608
G1 X141.382 Y123.459 E.35394
G1 X141.382 Y122.866 E.01608
G1 X150.618 Y132.102 E.35394
G1 X150.618 Y131.508 E.01608
G1 X141.382 Y122.272 E.35394
G1 X141.382 Y121.679 E.01608
G1 X150.618 Y130.915 E.35394
G1 X150.618 Y130.321 E.01608
G1 X141.382 Y121.085 E.35394
G1 X141.382 Y120.492 E.01608
G1 X150.618 Y129.728 E.35394
G1 X150.618 Y129.134 E.01608
G1 X141.382 Y119.898 E.35394
G1 X141.382 Y119.304 E.01608
G1 X150.618 Y128.541 E.35394
G1 X150.618 Y127.947 E.01608
G1 X141.382 Y118.711 E.35394
G1 X141.382 Y118.117 E.01608
G1 X150.618 Y127.354 E.35394
G1 X150.618 Y126.76 E.01608
G1 X141.382 Y117.524 E.35394
G1 X141.382 Y117.382 E.00385
G1 X141.834 Y117.382 E.01224
G1 X150.618 Y126.166 E.33663
G1 X150.618 Y125.573 E.01608
G1 X142.427 Y117.382 E.31389
G1 X143.021 Y117.382 E.01608
G1 X150.618 Y124.979 E.29114
G1 X150.618 Y124.386 E.01608
G1 X143.614 Y117.382 E.2684
G1 X144.208 Y117.382 E.01608
G1 X150.618 Y123.792 E.24565
G1 X150.618 Y123.199 E.01608
G1 X144.801 Y117.382 E.22291
G1 X145.395 Y117.382 E.01608
G1 X150.618 Y122.605 E.20016
G1 X150.618 Y122.012 E.01608
G1 X145.988 Y117.382 E.17741
G1 X146.582 Y117.382 E.01608
G1 X150.618 Y121.418 E.15467
G1 X150.618 Y120.824 E.01608
G1 X147.176 Y117.382 E.13192
G1 X147.769 Y117.382 E.01608
G1 X150.618 Y120.231 E.10918
G1 X150.618 Y119.637 E.01608
G1 X148.363 Y117.382 E.08643
G1 X148.956 Y117.382 E.01608
G1 X150.618 Y119.044 E.06369
G1 X150.618 Y118.45 E.01608
G1 X149.55 Y117.382 E.04094
G1 X150.143 Y117.382 E.01608
G1 X150.805 Y118.044 E.02536
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X150.143 Y117.382 E-.35566
G1 X149.55 Y117.382 E-.22555
G1 X149.883 Y117.715 E-.17879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/45
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.72 I-1.215 J.077 P1  F30000
G1 X150.974 Y134.974 Z5.72
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4609
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4609
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
M73 P87 R2
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.956 Y134.805 Z5.88 F30000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4609
G1 X150.618 Y134.143 E.02536
G1 X150.618 Y133.55 E.01608
G1 X149.55 Y134.618 E.04094
G1 X148.956 Y134.618 E.01608
G1 X150.618 Y132.956 E.06369
G1 X150.618 Y132.363 E.01608
G1 X148.363 Y134.618 E.08643
G1 X147.769 Y134.618 E.01608
G1 X150.618 Y131.769 E.10918
G1 X150.618 Y131.176 E.01608
G1 X147.176 Y134.618 E.13192
G1 X146.582 Y134.618 E.01608
G1 X150.618 Y130.582 E.15467
G1 X150.618 Y129.988 E.01608
G1 X145.988 Y134.618 E.17741
G1 X145.395 Y134.618 E.01608
G1 X150.618 Y129.395 E.20016
G1 X150.618 Y128.801 E.01608
G1 X144.801 Y134.618 E.22291
G1 X144.208 Y134.618 E.01608
G1 X150.618 Y128.208 E.24565
G1 X150.618 Y127.614 E.01608
G1 X143.614 Y134.618 E.2684
G1 X143.021 Y134.618 E.01608
G1 X150.618 Y127.021 E.29114
G1 X150.618 Y126.427 E.01608
G1 X142.427 Y134.618 E.31389
G1 X141.834 Y134.618 E.01608
G1 X150.618 Y125.834 E.33664
G1 X150.618 Y125.24 E.01608
G1 X141.382 Y134.476 E.35394
G1 X141.382 Y133.883 E.01608
G1 X150.618 Y124.646 E.35394
G1 X150.618 Y124.053 E.01608
G1 X141.382 Y133.289 E.35394
G1 X141.382 Y132.696 E.01608
G1 X150.618 Y123.459 E.35394
G1 X150.618 Y122.866 E.01608
G1 X141.382 Y132.102 E.35394
G1 X141.382 Y131.508 E.01608
G1 X150.618 Y122.272 E.35394
G1 X150.618 Y121.679 E.01608
G1 X141.382 Y130.915 E.35394
G1 X141.382 Y130.321 E.01608
G1 X150.618 Y121.085 E.35394
G1 X150.618 Y120.492 E.01608
G1 X141.382 Y129.728 E.35394
G1 X141.382 Y129.134 E.01608
G1 X150.618 Y119.898 E.35394
G1 X150.618 Y119.304 E.01608
G1 X141.382 Y128.541 E.35394
G1 X141.382 Y127.947 E.01608
G1 X150.618 Y118.711 E.35394
G1 X150.618 Y118.117 E.01608
G1 X141.382 Y127.354 E.35394
G1 X141.382 Y126.76 E.01608
G1 X150.618 Y117.524 E.35394
G1 X150.618 Y117.382 E.00384
G1 X150.166 Y117.382 E.01224
G1 X141.382 Y126.166 E.33663
G1 X141.382 Y125.573 E.01608
G1 X149.573 Y117.382 E.31389
G1 X148.979 Y117.382 E.01608
G1 X141.382 Y124.979 E.29114
G1 X141.382 Y124.386 E.01608
G1 X148.386 Y117.382 E.2684
G1 X147.792 Y117.382 E.01608
G1 X141.382 Y123.792 E.24565
G1 X141.382 Y123.199 E.01608
G1 X147.199 Y117.382 E.2229
G1 X146.605 Y117.382 E.01608
G1 X141.382 Y122.605 E.20016
G1 X141.382 Y122.011 E.01608
G1 X146.012 Y117.382 E.17741
G1 X145.418 Y117.382 E.01608
G1 X141.382 Y121.418 E.15467
G1 X141.382 Y120.824 E.01608
G1 X144.824 Y117.382 E.13192
G1 X144.231 Y117.382 E.01608
G1 X141.382 Y120.231 E.10918
G1 X141.382 Y119.637 E.01608
G1 X143.637 Y117.382 E.08643
G1 X143.044 Y117.382 E.01608
G1 X141.382 Y119.044 E.06368
G1 X141.382 Y118.45 E.01608
G1 X142.45 Y117.382 E.04094
G1 X141.857 Y117.382 E.01608
G1 X141.195 Y118.044 E.02536
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X141.857 Y117.382 E-.35564
G1 X142.45 Y117.382 E-.22555
G1 X142.117 Y117.715 E-.17881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/45
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z5.88 I-1.083 J.556 P1  F30000
G1 X150.974 Y134.974 Z5.88
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4621
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4621
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
M73 P87 R1
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.213 Y134.826 Z6.04 F30000
G1 X142.044 Y134.805 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4621
G1 X141.382 Y134.143 E.02536
G1 X141.382 Y133.55 E.01608
G1 X142.45 Y134.618 E.04094
G1 X143.044 Y134.618 E.01608
G1 X141.382 Y132.956 E.06368
M73 P88 R1
G1 X141.382 Y132.363 E.01608
G1 X143.637 Y134.618 E.08643
G1 X144.231 Y134.618 E.01608
G1 X141.382 Y131.769 E.10918
G1 X141.382 Y131.176 E.01608
G1 X144.824 Y134.618 E.13192
G1 X145.418 Y134.618 E.01608
G1 X141.382 Y130.582 E.15467
G1 X141.382 Y129.988 E.01608
G1 X146.012 Y134.618 E.17741
G1 X146.605 Y134.618 E.01608
G1 X141.382 Y129.395 E.20016
G1 X141.382 Y128.801 E.01608
G1 X147.199 Y134.618 E.22291
G1 X147.792 Y134.618 E.01608
G1 X141.382 Y128.208 E.24565
G1 X141.382 Y127.614 E.01608
G1 X148.386 Y134.618 E.2684
G1 X148.979 Y134.618 E.01608
G1 X141.382 Y127.021 E.29114
G1 X141.382 Y126.427 E.01608
G1 X149.573 Y134.618 E.31389
G1 X150.166 Y134.618 E.01608
G1 X141.382 Y125.834 E.33663
G1 X141.382 Y125.24 E.01608
G1 X150.618 Y134.476 E.35394
G1 X150.618 Y133.883 E.01608
G1 X141.382 Y124.646 E.35394
G1 X141.382 Y124.053 E.01608
G1 X150.618 Y133.289 E.35394
G1 X150.618 Y132.696 E.01608
G1 X141.382 Y123.459 E.35394
G1 X141.382 Y122.866 E.01608
G1 X150.618 Y132.102 E.35394
G1 X150.618 Y131.508 E.01608
G1 X141.382 Y122.272 E.35394
G1 X141.382 Y121.679 E.01608
G1 X150.618 Y130.915 E.35394
G1 X150.618 Y130.321 E.01608
G1 X141.382 Y121.085 E.35394
G1 X141.382 Y120.492 E.01608
G1 X150.618 Y129.728 E.35394
G1 X150.618 Y129.134 E.01608
G1 X141.382 Y119.898 E.35394
G1 X141.382 Y119.304 E.01608
G1 X150.618 Y128.541 E.35394
G1 X150.618 Y127.947 E.01608
G1 X141.382 Y118.711 E.35394
G1 X141.382 Y118.117 E.01608
G1 X150.618 Y127.354 E.35394
G1 X150.618 Y126.76 E.01608
G1 X141.382 Y117.524 E.35394
G1 X141.382 Y117.382 E.00385
G1 X141.834 Y117.382 E.01224
G1 X150.618 Y126.166 E.33663
G1 X150.618 Y125.573 E.01608
G1 X142.427 Y117.382 E.31389
G1 X143.021 Y117.382 E.01608
G1 X150.618 Y124.979 E.29114
G1 X150.618 Y124.386 E.01608
G1 X143.614 Y117.382 E.2684
G1 X144.208 Y117.382 E.01608
G1 X150.618 Y123.792 E.24565
G1 X150.618 Y123.199 E.01608
G1 X144.801 Y117.382 E.22291
G1 X145.395 Y117.382 E.01608
G1 X150.618 Y122.605 E.20016
G1 X150.618 Y122.012 E.01608
G1 X145.988 Y117.382 E.17741
G1 X146.582 Y117.382 E.01608
G1 X150.618 Y121.418 E.15467
G1 X150.618 Y120.824 E.01608
G1 X147.176 Y117.382 E.13192
G1 X147.769 Y117.382 E.01608
G1 X150.618 Y120.231 E.10918
G1 X150.618 Y119.637 E.01608
G1 X148.363 Y117.382 E.08643
G1 X148.956 Y117.382 E.01608
G1 X150.618 Y119.044 E.06369
G1 X150.618 Y118.45 E.01608
G1 X149.55 Y117.382 E.04094
G1 X150.143 Y117.382 E.01608
G1 X150.805 Y118.044 E.02536
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X150.143 Y117.382 E-.35566
G1 X149.55 Y117.382 E-.22555
G1 X149.883 Y117.715 E-.17879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/45
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.04 I-1.215 J.077 P1  F30000
G1 X150.974 Y134.974 Z6.04
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4609
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4609
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.956 Y134.805 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4609
G1 X150.618 Y134.143 E.02536
G1 X150.618 Y133.55 E.01608
G1 X149.55 Y134.618 E.04094
G1 X148.956 Y134.618 E.01608
G1 X150.618 Y132.956 E.06369
G1 X150.618 Y132.363 E.01608
G1 X148.363 Y134.618 E.08643
G1 X147.769 Y134.618 E.01608
G1 X150.618 Y131.769 E.10918
G1 X150.618 Y131.176 E.01608
G1 X147.176 Y134.618 E.13192
G1 X146.582 Y134.618 E.01608
G1 X150.618 Y130.582 E.15467
G1 X150.618 Y129.988 E.01608
G1 X145.988 Y134.618 E.17741
G1 X145.395 Y134.618 E.01608
G1 X150.618 Y129.395 E.20016
G1 X150.618 Y128.801 E.01608
G1 X144.801 Y134.618 E.22291
G1 X144.208 Y134.618 E.01608
G1 X150.618 Y128.208 E.24565
G1 X150.618 Y127.614 E.01608
G1 X143.614 Y134.618 E.2684
G1 X143.021 Y134.618 E.01608
G1 X150.618 Y127.021 E.29114
G1 X150.618 Y126.427 E.01608
G1 X142.427 Y134.618 E.31389
G1 X141.834 Y134.618 E.01608
G1 X150.618 Y125.834 E.33664
G1 X150.618 Y125.24 E.01608
G1 X141.382 Y134.476 E.35394
M73 P89 R1
G1 X141.382 Y133.883 E.01608
G1 X150.618 Y124.646 E.35394
G1 X150.618 Y124.053 E.01608
G1 X141.382 Y133.289 E.35394
G1 X141.382 Y132.696 E.01608
G1 X150.618 Y123.459 E.35394
G1 X150.618 Y122.866 E.01608
G1 X141.382 Y132.102 E.35394
G1 X141.382 Y131.508 E.01608
G1 X150.618 Y122.272 E.35394
G1 X150.618 Y121.679 E.01608
G1 X141.382 Y130.915 E.35394
G1 X141.382 Y130.321 E.01608
G1 X150.618 Y121.085 E.35394
G1 X150.618 Y120.492 E.01608
G1 X141.382 Y129.728 E.35394
G1 X141.382 Y129.134 E.01608
G1 X150.618 Y119.898 E.35394
G1 X150.618 Y119.304 E.01608
G1 X141.382 Y128.541 E.35394
G1 X141.382 Y127.947 E.01608
G1 X150.618 Y118.711 E.35394
G1 X150.618 Y118.117 E.01608
G1 X141.382 Y127.354 E.35394
G1 X141.382 Y126.76 E.01608
G1 X150.618 Y117.524 E.35394
G1 X150.618 Y117.382 E.00384
G1 X150.166 Y117.382 E.01224
G1 X141.382 Y126.166 E.33663
G1 X141.382 Y125.573 E.01608
G1 X149.573 Y117.382 E.31389
G1 X148.979 Y117.382 E.01608
G1 X141.382 Y124.979 E.29114
G1 X141.382 Y124.386 E.01608
G1 X148.386 Y117.382 E.2684
G1 X147.792 Y117.382 E.01608
G1 X141.382 Y123.792 E.24565
G1 X141.382 Y123.199 E.01608
G1 X147.199 Y117.382 E.2229
G1 X146.605 Y117.382 E.01608
G1 X141.382 Y122.605 E.20016
G1 X141.382 Y122.011 E.01608
G1 X146.012 Y117.382 E.17741
G1 X145.418 Y117.382 E.01608
G1 X141.382 Y121.418 E.15467
G1 X141.382 Y120.824 E.01608
G1 X144.824 Y117.382 E.13192
G1 X144.231 Y117.382 E.01608
G1 X141.382 Y120.231 E.10918
G1 X141.382 Y119.637 E.01608
G1 X143.637 Y117.382 E.08643
G1 X143.044 Y117.382 E.01608
G1 X141.382 Y119.044 E.06368
G1 X141.382 Y118.45 E.01608
G1 X142.45 Y117.382 E.04094
G1 X141.857 Y117.382 E.01608
G1 X141.195 Y118.044 E.02536
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X141.857 Y117.382 E-.35564
G1 X142.45 Y117.382 E-.22555
G1 X142.117 Y117.715 E-.17881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/45
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.2 I-1.083 J.556 P1  F30000
G1 X150.974 Y134.974 Z6.2
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4621
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4621
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.213 Y134.826 Z6.36 F30000
G1 X142.044 Y134.805 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4621
G1 X141.382 Y134.143 E.02536
G1 X141.382 Y133.55 E.01608
G1 X142.45 Y134.618 E.04094
G1 X143.044 Y134.618 E.01608
G1 X141.382 Y132.956 E.06368
G1 X141.382 Y132.363 E.01608
G1 X143.637 Y134.618 E.08643
G1 X144.231 Y134.618 E.01608
G1 X141.382 Y131.769 E.10918
G1 X141.382 Y131.176 E.01608
G1 X144.824 Y134.618 E.13192
G1 X145.418 Y134.618 E.01608
G1 X141.382 Y130.582 E.15467
G1 X141.382 Y129.988 E.01608
G1 X146.012 Y134.618 E.17741
G1 X146.605 Y134.618 E.01608
G1 X141.382 Y129.395 E.20016
G1 X141.382 Y128.801 E.01608
G1 X147.199 Y134.618 E.22291
G1 X147.792 Y134.618 E.01608
G1 X141.382 Y128.208 E.24565
G1 X141.382 Y127.614 E.01608
G1 X148.386 Y134.618 E.2684
G1 X148.979 Y134.618 E.01608
G1 X141.382 Y127.021 E.29114
G1 X141.382 Y126.427 E.01608
G1 X149.573 Y134.618 E.31389
G1 X150.166 Y134.618 E.01608
G1 X141.382 Y125.834 E.33663
G1 X141.382 Y125.24 E.01608
G1 X150.618 Y134.476 E.35394
G1 X150.618 Y133.883 E.01608
G1 X141.382 Y124.646 E.35394
G1 X141.382 Y124.053 E.01608
G1 X150.618 Y133.289 E.35394
G1 X150.618 Y132.696 E.01608
G1 X141.382 Y123.459 E.35394
M73 P90 R1
G1 X141.382 Y122.866 E.01608
G1 X150.618 Y132.102 E.35394
G1 X150.618 Y131.508 E.01608
G1 X141.382 Y122.272 E.35394
G1 X141.382 Y121.679 E.01608
G1 X150.618 Y130.915 E.35394
G1 X150.618 Y130.321 E.01608
G1 X141.382 Y121.085 E.35394
G1 X141.382 Y120.492 E.01608
G1 X150.618 Y129.728 E.35394
G1 X150.618 Y129.134 E.01608
G1 X141.382 Y119.898 E.35394
G1 X141.382 Y119.304 E.01608
G1 X150.618 Y128.541 E.35394
G1 X150.618 Y127.947 E.01608
G1 X141.382 Y118.711 E.35394
G1 X141.382 Y118.117 E.01608
G1 X150.618 Y127.354 E.35394
G1 X150.618 Y126.76 E.01608
G1 X141.382 Y117.524 E.35394
G1 X141.382 Y117.382 E.00385
G1 X141.834 Y117.382 E.01224
G1 X150.618 Y126.166 E.33663
G1 X150.618 Y125.573 E.01608
G1 X142.427 Y117.382 E.31389
G1 X143.021 Y117.382 E.01608
G1 X150.618 Y124.979 E.29114
G1 X150.618 Y124.386 E.01608
G1 X143.614 Y117.382 E.2684
G1 X144.208 Y117.382 E.01608
G1 X150.618 Y123.792 E.24565
G1 X150.618 Y123.199 E.01608
G1 X144.801 Y117.382 E.22291
G1 X145.395 Y117.382 E.01608
G1 X150.618 Y122.605 E.20016
G1 X150.618 Y122.012 E.01608
G1 X145.988 Y117.382 E.17741
G1 X146.582 Y117.382 E.01608
G1 X150.618 Y121.418 E.15467
G1 X150.618 Y120.824 E.01608
G1 X147.176 Y117.382 E.13192
G1 X147.769 Y117.382 E.01608
G1 X150.618 Y120.231 E.10918
G1 X150.618 Y119.637 E.01608
G1 X148.363 Y117.382 E.08643
G1 X148.956 Y117.382 E.01608
G1 X150.618 Y119.044 E.06369
G1 X150.618 Y118.45 E.01608
G1 X149.55 Y117.382 E.04094
G1 X150.143 Y117.382 E.01608
G1 X150.805 Y118.044 E.02536
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X150.143 Y117.382 E-.35566
G1 X149.55 Y117.382 E-.22555
G1 X149.883 Y117.715 E-.17879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/45
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.36 I-1.215 J.077 P1  F30000
G1 X150.974 Y134.974 Z6.36
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4609
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4609
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.956 Y134.805 Z6.52 F30000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4609
G1 X150.618 Y134.143 E.02536
G1 X150.618 Y133.55 E.01608
G1 X149.55 Y134.618 E.04094
G1 X148.956 Y134.618 E.01608
G1 X150.618 Y132.956 E.06369
G1 X150.618 Y132.363 E.01608
G1 X148.363 Y134.618 E.08643
G1 X147.769 Y134.618 E.01608
G1 X150.618 Y131.769 E.10918
G1 X150.618 Y131.176 E.01608
G1 X147.176 Y134.618 E.13192
G1 X146.582 Y134.618 E.01608
G1 X150.618 Y130.582 E.15467
G1 X150.618 Y129.988 E.01608
G1 X145.988 Y134.618 E.17741
G1 X145.395 Y134.618 E.01608
G1 X150.618 Y129.395 E.20016
G1 X150.618 Y128.801 E.01608
G1 X144.801 Y134.618 E.22291
G1 X144.208 Y134.618 E.01608
G1 X150.618 Y128.208 E.24565
G1 X150.618 Y127.614 E.01608
G1 X143.614 Y134.618 E.2684
G1 X143.021 Y134.618 E.01608
G1 X150.618 Y127.021 E.29114
G1 X150.618 Y126.427 E.01608
G1 X142.427 Y134.618 E.31389
G1 X141.834 Y134.618 E.01608
G1 X150.618 Y125.834 E.33664
G1 X150.618 Y125.24 E.01608
G1 X141.382 Y134.476 E.35394
G1 X141.382 Y133.883 E.01608
G1 X150.618 Y124.646 E.35394
G1 X150.618 Y124.053 E.01608
G1 X141.382 Y133.289 E.35394
G1 X141.382 Y132.696 E.01608
G1 X150.618 Y123.459 E.35394
G1 X150.618 Y122.866 E.01608
G1 X141.382 Y132.102 E.35394
G1 X141.382 Y131.508 E.01608
G1 X150.618 Y122.272 E.35394
G1 X150.618 Y121.679 E.01608
G1 X141.382 Y130.915 E.35394
G1 X141.382 Y130.321 E.01608
M73 P91 R1
G1 X150.618 Y121.085 E.35394
G1 X150.618 Y120.492 E.01608
G1 X141.382 Y129.728 E.35394
G1 X141.382 Y129.134 E.01608
G1 X150.618 Y119.898 E.35394
G1 X150.618 Y119.304 E.01608
G1 X141.382 Y128.541 E.35394
G1 X141.382 Y127.947 E.01608
G1 X150.618 Y118.711 E.35394
G1 X150.618 Y118.117 E.01608
G1 X141.382 Y127.354 E.35394
G1 X141.382 Y126.76 E.01608
G1 X150.618 Y117.524 E.35394
G1 X150.618 Y117.382 E.00384
G1 X150.166 Y117.382 E.01224
G1 X141.382 Y126.166 E.33663
G1 X141.382 Y125.573 E.01608
G1 X149.573 Y117.382 E.31389
G1 X148.979 Y117.382 E.01608
G1 X141.382 Y124.979 E.29114
G1 X141.382 Y124.386 E.01608
G1 X148.386 Y117.382 E.2684
G1 X147.792 Y117.382 E.01608
G1 X141.382 Y123.792 E.24565
G1 X141.382 Y123.199 E.01608
G1 X147.199 Y117.382 E.2229
G1 X146.605 Y117.382 E.01608
G1 X141.382 Y122.605 E.20016
G1 X141.382 Y122.011 E.01608
G1 X146.012 Y117.382 E.17741
G1 X145.418 Y117.382 E.01608
G1 X141.382 Y121.418 E.15467
G1 X141.382 Y120.824 E.01608
G1 X144.824 Y117.382 E.13192
G1 X144.231 Y117.382 E.01608
G1 X141.382 Y120.231 E.10918
G1 X141.382 Y119.637 E.01608
G1 X143.637 Y117.382 E.08643
G1 X143.044 Y117.382 E.01608
G1 X141.382 Y119.044 E.06368
G1 X141.382 Y118.45 E.01608
G1 X142.45 Y117.382 E.04094
G1 X141.857 Y117.382 E.01608
G1 X141.195 Y118.044 E.02536
; CHANGE_LAYER
; Z_HEIGHT: 6.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10826.06
G1 X141.857 Y117.382 E-.35564
G1 X142.45 Y117.382 E-.22555
G1 X142.117 Y117.715 E-.17881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/45
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.52 I-1.083 J.556 P1  F30000
G1 X150.974 Y134.974 Z6.52
G1 Z6.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4933
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4933
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.211 Y134.835 Z6.68 F30000
G1 X141.974 Y134.807 Z6.68
G1 Z6.28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420466
G1 F4933
G1 X141.367 Y134.199 E.02162
G1 X141.367 Y133.653 E.01375
G1 X142.347 Y134.633 E.03488
G1 X142.893 Y134.633 E.01375
G1 X141.367 Y133.107 E.05432
G1 X141.367 Y132.561 E.01375
G1 X143.439 Y134.633 E.07376
G1 X143.985 Y134.633 E.01375
G1 X141.367 Y132.015 E.0932
G1 X141.367 Y131.469 E.01375
G1 X144.531 Y134.633 E.11264
G1 X145.077 Y134.633 E.01375
G1 X141.367 Y130.923 E.13207
G1 X141.367 Y130.377 E.01375
G1 X145.623 Y134.633 E.15151
G1 X146.169 Y134.633 E.01375
G1 X141.367 Y129.831 E.17095
G1 X141.367 Y129.285 E.01375
G1 X146.715 Y134.633 E.19039
G1 X147.261 Y134.633 E.01375
G1 X141.367 Y128.739 E.20983
G1 X141.367 Y128.193 E.01375
G1 X147.807 Y134.633 E.22927
G1 X148.353 Y134.633 E.01375
G1 X141.367 Y127.647 E.24871
G1 X141.367 Y127.101 E.01375
G1 X148.9 Y134.633 E.26815
G1 X149.446 Y134.633 E.01375
G1 X141.367 Y126.554 E.28759
G1 X141.367 Y126.008 E.01375
G1 X149.992 Y134.633 E.30703
G1 X150.538 Y134.633 E.01375
G1 X141.367 Y125.462 E.32647
G1 X141.367 Y124.916 E.01375
G1 X150.633 Y134.182 E.32986
G1 X150.633 Y133.636 E.01375
G1 X141.367 Y124.37 E.32986
G1 X141.367 Y123.824 E.01375
G1 X150.633 Y133.09 E.32986
G1 X150.633 Y132.544 E.01375
G1 X141.367 Y123.278 E.32986
G1 X141.367 Y122.732 E.01375
G1 X150.633 Y131.998 E.32986
G1 X150.633 Y131.452 E.01375
G1 X141.367 Y122.186 E.32986
G1 X141.367 Y121.64 E.01375
G1 X150.633 Y130.906 E.32986
G1 X150.633 Y130.36 E.01375
G1 X141.367 Y121.094 E.32986
G1 X141.367 Y120.548 E.01375
G1 X150.633 Y129.814 E.32986
G1 X150.633 Y129.268 E.01375
G1 X141.367 Y120.002 E.32986
G1 X141.367 Y119.456 E.01375
G1 X150.633 Y128.722 E.32986
G1 X150.633 Y128.176 E.01375
G1 X141.367 Y118.909 E.32986
G1 X141.367 Y118.363 E.01375
G1 X150.633 Y127.63 E.32986
G1 X150.633 Y127.084 E.01375
G1 X141.367 Y117.817 E.32986
G1 X141.367 Y117.367 E.01134
G1 X141.463 Y117.367 E.00241
G1 X150.633 Y126.537 E.32646
G1 X150.633 Y125.991 E.01375
G1 X142.009 Y117.367 E.30702
G1 X142.555 Y117.367 E.01375
G1 X150.633 Y125.445 E.28758
G1 X150.633 Y124.899 E.01375
G1 X143.101 Y117.367 E.26814
G1 X143.647 Y117.367 E.01375
G1 X150.633 Y124.353 E.2487
G1 X150.633 Y123.807 E.01375
M73 P92 R1
G1 X144.193 Y117.367 E.22926
G1 X144.739 Y117.367 E.01375
G1 X150.633 Y123.261 E.20982
G1 X150.633 Y122.715 E.01375
G1 X145.285 Y117.367 E.19038
G1 X145.831 Y117.367 E.01375
G1 X150.633 Y122.169 E.17095
G1 X150.633 Y121.623 E.01375
G1 X146.377 Y117.367 E.15151
G1 X146.923 Y117.367 E.01375
G1 X150.633 Y121.077 E.13207
G1 X150.633 Y120.531 E.01375
G1 X147.469 Y117.367 E.11263
G1 X148.015 Y117.367 E.01375
G1 X150.633 Y119.985 E.09319
G1 X150.633 Y119.439 E.01375
G1 X148.561 Y117.367 E.07375
G1 X149.107 Y117.367 E.01375
G1 X150.633 Y118.892 E.05431
G1 X150.633 Y118.346 E.01375
G1 X149.654 Y117.367 E.03487
G1 X150.2 Y117.367 E.01375
G1 X150.807 Y117.974 E.02161
; CHANGE_LAYER
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11654.106
G1 X150.2 Y117.367 E-.32624
G1 X149.654 Y117.367 E-.20751
G1 X150.075 Y117.788 E-.22625
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/45
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.68 I-1.215 J.064 P1  F30000
G1 X150.974 Y134.974 Z6.68
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4919
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4919
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.026 Y134.807 Z6.84 F30000
G1 Z6.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420466
G1 F4919
G1 X150.633 Y134.2 E.02161
G1 X150.633 Y133.654 E.01375
G1 X149.654 Y134.633 E.03487
G1 X149.107 Y134.633 E.01375
G1 X150.633 Y133.107 E.05431
G1 X150.633 Y132.561 E.01375
G1 X148.561 Y134.633 E.07375
G1 X148.015 Y134.633 E.01375
G1 X150.633 Y132.015 E.09319
G1 X150.633 Y131.469 E.01375
G1 X147.469 Y134.633 E.11263
G1 X146.923 Y134.633 E.01375
G1 X150.633 Y130.923 E.13207
G1 X150.633 Y130.377 E.01375
G1 X146.377 Y134.633 E.15151
G1 X145.831 Y134.633 E.01375
G1 X150.633 Y129.831 E.17095
G1 X150.633 Y129.285 E.01375
G1 X145.285 Y134.633 E.19038
G1 X144.739 Y134.633 E.01375
G1 X150.633 Y128.739 E.20982
G1 X150.633 Y128.193 E.01375
G1 X144.193 Y134.633 E.22926
G1 X143.647 Y134.633 E.01375
G1 X150.633 Y127.647 E.2487
G1 X150.633 Y127.101 E.01375
G1 X143.101 Y134.633 E.26814
G1 X142.555 Y134.633 E.01375
G1 X150.633 Y126.555 E.28758
G1 X150.633 Y126.009 E.01375
G1 X142.009 Y134.633 E.30702
G1 X141.463 Y134.633 E.01375
G1 X150.633 Y125.463 E.32646
G1 X150.633 Y124.916 E.01375
G1 X141.367 Y134.183 E.32986
G1 X141.367 Y133.637 E.01375
G1 X150.633 Y124.37 E.32986
G1 X150.633 Y123.824 E.01375
G1 X141.367 Y133.091 E.32986
G1 X141.367 Y132.544 E.01375
G1 X150.633 Y123.278 E.32986
G1 X150.633 Y122.732 E.01375
G1 X141.367 Y131.998 E.32986
G1 X141.367 Y131.452 E.01375
G1 X150.633 Y122.186 E.32986
G1 X150.633 Y121.64 E.01375
G1 X141.367 Y130.906 E.32986
G1 X141.367 Y130.36 E.01375
G1 X150.633 Y121.094 E.32986
G1 X150.633 Y120.548 E.01375
G1 X141.367 Y129.814 E.32986
G1 X141.367 Y129.268 E.01375
G1 X150.633 Y120.002 E.32986
G1 X150.633 Y119.456 E.01375
G1 X141.367 Y128.722 E.32986
G1 X141.367 Y128.176 E.01375
G1 X150.633 Y118.91 E.32986
G1 X150.633 Y118.364 E.01375
G1 X141.367 Y127.63 E.32986
G1 X141.367 Y127.084 E.01375
G1 X150.633 Y117.818 E.32986
G1 X150.633 Y117.367 E.01134
G1 X150.538 Y117.367 E.0024
G1 X141.367 Y126.538 E.32647
G1 X141.367 Y125.992 E.01375
G1 X149.992 Y117.367 E.30703
G1 X149.446 Y117.367 E.01375
G1 X141.367 Y125.446 E.28759
G1 X141.367 Y124.899 E.01375
G1 X148.9 Y117.367 E.26815
G1 X148.353 Y117.367 E.01375
G1 X141.367 Y124.353 E.24871
G1 X141.367 Y123.807 E.01375
G1 X147.807 Y117.367 E.22927
G1 X147.261 Y117.367 E.01375
G1 X141.367 Y123.261 E.20983
G1 X141.367 Y122.715 E.01375
G1 X146.715 Y117.367 E.19039
G1 X146.169 Y117.367 E.01375
G1 X141.367 Y122.169 E.17095
G1 X141.367 Y121.623 E.01375
G1 X145.623 Y117.367 E.15151
G1 X145.077 Y117.367 E.01375
G1 X141.367 Y121.077 E.13207
G1 X141.367 Y120.531 E.01375
M73 P93 R1
G1 X144.531 Y117.367 E.11263
G1 X143.985 Y117.367 E.01375
G1 X141.367 Y119.985 E.0932
G1 X141.367 Y119.439 E.01375
G1 X143.439 Y117.367 E.07376
G1 X142.893 Y117.367 E.01375
G1 X141.367 Y118.893 E.05432
G1 X141.367 Y118.347 E.01375
G1 X142.347 Y117.367 E.03488
G1 X141.801 Y117.367 E.01375
G1 X141.193 Y117.974 E.02162
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11654.106
G1 X141.801 Y117.367 E-.32634
G1 X142.347 Y117.367 E-.20751
G1 X141.926 Y117.788 E-.22615
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/45
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z6.84 I-1.077 J.567 P1  F30000
G1 X150.974 Y134.974 Z6.84
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4932
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4932
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.211 Y134.835 Z7 F30000
G1 X141.974 Y134.807 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420466
G1 F4932
G1 X141.367 Y134.199 E.02162
G1 X141.367 Y133.653 E.01375
G1 X142.347 Y134.633 E.03488
G1 X142.893 Y134.633 E.01375
G1 X141.367 Y133.107 E.05432
G1 X141.367 Y132.561 E.01375
G1 X143.439 Y134.633 E.07376
G1 X143.985 Y134.633 E.01375
G1 X141.367 Y132.015 E.0932
G1 X141.367 Y131.469 E.01375
G1 X144.531 Y134.633 E.11264
G1 X145.077 Y134.633 E.01375
G1 X141.367 Y130.923 E.13207
G1 X141.367 Y130.377 E.01375
G1 X145.623 Y134.633 E.15151
G1 X146.169 Y134.633 E.01375
G1 X141.367 Y129.831 E.17095
G1 X141.367 Y129.285 E.01375
G1 X146.715 Y134.633 E.19039
G1 X147.261 Y134.633 E.01375
G1 X141.367 Y128.739 E.20983
G1 X141.367 Y128.193 E.01375
G1 X147.807 Y134.633 E.22927
G1 X148.353 Y134.633 E.01375
G1 X141.367 Y127.647 E.24871
G1 X141.367 Y127.101 E.01375
G1 X148.9 Y134.633 E.26815
G1 X149.446 Y134.633 E.01375
G1 X141.367 Y126.554 E.28759
G1 X141.367 Y126.008 E.01375
G1 X149.992 Y134.633 E.30703
G1 X150.538 Y134.633 E.01375
G1 X141.367 Y125.462 E.32647
G1 X141.367 Y124.916 E.01375
G1 X150.633 Y134.182 E.32986
G1 X150.633 Y133.636 E.01375
G1 X141.367 Y124.37 E.32986
G1 X141.367 Y123.824 E.01375
G1 X150.633 Y133.09 E.32986
G1 X150.633 Y132.544 E.01375
G1 X141.367 Y123.278 E.32986
G1 X141.367 Y122.732 E.01375
G1 X150.633 Y131.998 E.32986
G1 X150.633 Y131.452 E.01375
G1 X141.367 Y122.186 E.32986
G1 X141.367 Y121.64 E.01375
G1 X150.633 Y130.906 E.32986
G1 X150.633 Y130.36 E.01375
G1 X141.367 Y121.094 E.32986
G1 X141.367 Y120.548 E.01375
G1 X150.633 Y129.814 E.32986
G1 X150.633 Y129.268 E.01375
G1 X141.367 Y120.002 E.32986
G1 X141.367 Y119.456 E.01375
G1 X150.633 Y128.722 E.32986
G1 X150.633 Y128.176 E.01375
G1 X141.367 Y118.909 E.32986
G1 X141.367 Y118.363 E.01375
G1 X150.633 Y127.63 E.32986
G1 X150.633 Y127.084 E.01375
G1 X141.367 Y117.817 E.32986
G1 X141.367 Y117.367 E.01134
G1 X141.463 Y117.367 E.00241
G1 X150.633 Y126.537 E.32646
G1 X150.633 Y125.991 E.01375
G1 X142.009 Y117.367 E.30702
G1 X142.555 Y117.367 E.01375
G1 X150.633 Y125.445 E.28758
G1 X150.633 Y124.899 E.01375
G1 X143.101 Y117.367 E.26814
G1 X143.647 Y117.367 E.01375
G1 X150.633 Y124.353 E.2487
G1 X150.633 Y123.807 E.01375
G1 X144.193 Y117.367 E.22926
G1 X144.739 Y117.367 E.01375
G1 X150.633 Y123.261 E.20982
G1 X150.633 Y122.715 E.01375
G1 X145.285 Y117.367 E.19038
G1 X145.831 Y117.367 E.01375
G1 X150.633 Y122.169 E.17095
G1 X150.633 Y121.623 E.01375
G1 X146.377 Y117.367 E.15151
G1 X146.923 Y117.367 E.01375
G1 X150.633 Y121.077 E.13207
G1 X150.633 Y120.531 E.01375
G1 X147.469 Y117.367 E.11263
G1 X148.015 Y117.367 E.01375
G1 X150.633 Y119.985 E.09319
G1 X150.633 Y119.439 E.01375
G1 X148.561 Y117.367 E.07375
G1 X149.107 Y117.367 E.01375
G1 X150.633 Y118.892 E.05431
G1 X150.633 Y118.346 E.01375
M73 P93 R0
G1 X149.654 Y117.367 E.03487
G1 X150.2 Y117.367 E.01375
M73 P94 R0
G1 X150.807 Y117.974 E.02161
; CHANGE_LAYER
; Z_HEIGHT: 6.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11654.106
G1 X150.2 Y117.367 E-.32624
G1 X149.654 Y117.367 E-.20751
G1 X150.075 Y117.788 E-.22625
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/45
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7 I-1.215 J.064 P1  F30000
G1 X150.974 Y134.974 Z7
G1 Z6.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4919
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4919
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.026 Y134.807 Z7.16 F30000
G1 Z6.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420466
G1 F4919
G1 X150.633 Y134.2 E.02161
G1 X150.633 Y133.654 E.01375
G1 X149.654 Y134.633 E.03487
G1 X149.107 Y134.633 E.01375
G1 X150.633 Y133.107 E.05431
G1 X150.633 Y132.561 E.01375
G1 X148.561 Y134.633 E.07375
G1 X148.015 Y134.633 E.01375
G1 X150.633 Y132.015 E.09319
G1 X150.633 Y131.469 E.01375
G1 X147.469 Y134.633 E.11263
G1 X146.923 Y134.633 E.01375
G1 X150.633 Y130.923 E.13207
G1 X150.633 Y130.377 E.01375
G1 X146.377 Y134.633 E.15151
G1 X145.831 Y134.633 E.01375
G1 X150.633 Y129.831 E.17095
G1 X150.633 Y129.285 E.01375
G1 X145.285 Y134.633 E.19038
G1 X144.739 Y134.633 E.01375
G1 X150.633 Y128.739 E.20982
G1 X150.633 Y128.193 E.01375
G1 X144.193 Y134.633 E.22926
G1 X143.647 Y134.633 E.01375
G1 X150.633 Y127.647 E.2487
G1 X150.633 Y127.101 E.01375
G1 X143.101 Y134.633 E.26814
G1 X142.555 Y134.633 E.01375
G1 X150.633 Y126.555 E.28758
G1 X150.633 Y126.009 E.01375
G1 X142.009 Y134.633 E.30702
G1 X141.463 Y134.633 E.01375
G1 X150.633 Y125.463 E.32646
G1 X150.633 Y124.916 E.01375
G1 X141.367 Y134.183 E.32986
G1 X141.367 Y133.637 E.01375
G1 X150.633 Y124.37 E.32986
G1 X150.633 Y123.824 E.01375
G1 X141.367 Y133.091 E.32986
G1 X141.367 Y132.544 E.01375
G1 X150.633 Y123.278 E.32986
G1 X150.633 Y122.732 E.01375
G1 X141.367 Y131.998 E.32986
G1 X141.367 Y131.452 E.01375
G1 X150.633 Y122.186 E.32986
G1 X150.633 Y121.64 E.01375
G1 X141.367 Y130.906 E.32986
G1 X141.367 Y130.36 E.01375
G1 X150.633 Y121.094 E.32986
G1 X150.633 Y120.548 E.01375
G1 X141.367 Y129.814 E.32986
G1 X141.367 Y129.268 E.01375
G1 X150.633 Y120.002 E.32986
G1 X150.633 Y119.456 E.01375
G1 X141.367 Y128.722 E.32986
G1 X141.367 Y128.176 E.01375
G1 X150.633 Y118.91 E.32986
G1 X150.633 Y118.364 E.01375
G1 X141.367 Y127.63 E.32986
G1 X141.367 Y127.084 E.01375
G1 X150.633 Y117.818 E.32986
G1 X150.633 Y117.367 E.01134
G1 X150.538 Y117.367 E.0024
G1 X141.367 Y126.538 E.32647
G1 X141.367 Y125.992 E.01375
G1 X149.992 Y117.367 E.30703
G1 X149.446 Y117.367 E.01375
G1 X141.367 Y125.446 E.28759
G1 X141.367 Y124.899 E.01375
G1 X148.9 Y117.367 E.26815
G1 X148.353 Y117.367 E.01375
G1 X141.367 Y124.353 E.24871
G1 X141.367 Y123.807 E.01375
G1 X147.807 Y117.367 E.22927
G1 X147.261 Y117.367 E.01375
G1 X141.367 Y123.261 E.20983
G1 X141.367 Y122.715 E.01375
G1 X146.715 Y117.367 E.19039
G1 X146.169 Y117.367 E.01375
G1 X141.367 Y122.169 E.17095
G1 X141.367 Y121.623 E.01375
G1 X145.623 Y117.367 E.15151
G1 X145.077 Y117.367 E.01375
G1 X141.367 Y121.077 E.13207
G1 X141.367 Y120.531 E.01375
G1 X144.531 Y117.367 E.11263
G1 X143.985 Y117.367 E.01375
G1 X141.367 Y119.985 E.0932
G1 X141.367 Y119.439 E.01375
G1 X143.439 Y117.367 E.07376
G1 X142.893 Y117.367 E.01375
G1 X141.367 Y118.893 E.05432
G1 X141.367 Y118.347 E.01375
G1 X142.347 Y117.367 E.03488
G1 X141.801 Y117.367 E.01375
G1 X141.193 Y117.974 E.02162
; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11654.106
G1 X141.801 Y117.367 E-.32634
G1 X142.347 Y117.367 E-.20751
G1 X141.926 Y117.788 E-.22615
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/45
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.16 I-1.077 J.567 P1  F30000
G1 X150.974 Y134.974 Z7.16
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4932
M73 P95 R0
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4932
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.211 Y134.835 Z7.32 F30000
G1 X141.974 Y134.807 Z7.32
G1 Z6.92
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420466
G1 F4932
G1 X141.367 Y134.199 E.02162
G1 X141.367 Y133.653 E.01375
G1 X142.347 Y134.633 E.03488
G1 X142.893 Y134.633 E.01375
G1 X141.367 Y133.107 E.05432
G1 X141.367 Y132.561 E.01375
G1 X143.439 Y134.633 E.07376
G1 X143.985 Y134.633 E.01375
G1 X141.367 Y132.015 E.0932
G1 X141.367 Y131.469 E.01375
G1 X144.531 Y134.633 E.11264
G1 X145.077 Y134.633 E.01375
G1 X141.367 Y130.923 E.13207
G1 X141.367 Y130.377 E.01375
G1 X145.623 Y134.633 E.15151
G1 X146.169 Y134.633 E.01375
G1 X141.367 Y129.831 E.17095
G1 X141.367 Y129.285 E.01375
G1 X146.715 Y134.633 E.19039
G1 X147.261 Y134.633 E.01375
G1 X141.367 Y128.739 E.20983
G1 X141.367 Y128.193 E.01375
G1 X147.807 Y134.633 E.22927
G1 X148.353 Y134.633 E.01375
G1 X141.367 Y127.647 E.24871
G1 X141.367 Y127.101 E.01375
G1 X148.9 Y134.633 E.26815
G1 X149.446 Y134.633 E.01375
G1 X141.367 Y126.554 E.28759
G1 X141.367 Y126.008 E.01375
G1 X149.992 Y134.633 E.30703
G1 X150.538 Y134.633 E.01375
G1 X141.367 Y125.462 E.32647
G1 X141.367 Y124.916 E.01375
G1 X150.633 Y134.182 E.32986
G1 X150.633 Y133.636 E.01375
G1 X141.367 Y124.37 E.32986
G1 X141.367 Y123.824 E.01375
G1 X150.633 Y133.09 E.32986
G1 X150.633 Y132.544 E.01375
G1 X141.367 Y123.278 E.32986
G1 X141.367 Y122.732 E.01375
G1 X150.633 Y131.998 E.32986
G1 X150.633 Y131.452 E.01375
G1 X141.367 Y122.186 E.32986
G1 X141.367 Y121.64 E.01375
G1 X150.633 Y130.906 E.32986
G1 X150.633 Y130.36 E.01375
G1 X141.367 Y121.094 E.32986
G1 X141.367 Y120.548 E.01375
G1 X150.633 Y129.814 E.32986
G1 X150.633 Y129.268 E.01375
G1 X141.367 Y120.002 E.32986
G1 X141.367 Y119.456 E.01375
G1 X150.633 Y128.722 E.32986
G1 X150.633 Y128.176 E.01375
G1 X141.367 Y118.909 E.32986
G1 X141.367 Y118.363 E.01375
G1 X150.633 Y127.63 E.32986
G1 X150.633 Y127.084 E.01375
G1 X141.367 Y117.817 E.32986
G1 X141.367 Y117.367 E.01134
G1 X141.463 Y117.367 E.00241
G1 X150.633 Y126.537 E.32646
G1 X150.633 Y125.991 E.01375
G1 X142.009 Y117.367 E.30702
G1 X142.555 Y117.367 E.01375
G1 X150.633 Y125.445 E.28758
G1 X150.633 Y124.899 E.01375
G1 X143.101 Y117.367 E.26814
G1 X143.647 Y117.367 E.01375
G1 X150.633 Y124.353 E.2487
G1 X150.633 Y123.807 E.01375
G1 X144.193 Y117.367 E.22926
G1 X144.739 Y117.367 E.01375
G1 X150.633 Y123.261 E.20982
G1 X150.633 Y122.715 E.01375
G1 X145.285 Y117.367 E.19038
G1 X145.831 Y117.367 E.01375
G1 X150.633 Y122.169 E.17095
G1 X150.633 Y121.623 E.01375
G1 X146.377 Y117.367 E.15151
G1 X146.923 Y117.367 E.01375
G1 X150.633 Y121.077 E.13207
G1 X150.633 Y120.531 E.01375
G1 X147.469 Y117.367 E.11263
G1 X148.015 Y117.367 E.01375
G1 X150.633 Y119.985 E.09319
G1 X150.633 Y119.439 E.01375
G1 X148.561 Y117.367 E.07375
G1 X149.107 Y117.367 E.01375
G1 X150.633 Y118.892 E.05431
G1 X150.633 Y118.346 E.01375
G1 X149.654 Y117.367 E.03487
G1 X150.2 Y117.367 E.01375
G1 X150.807 Y117.974 E.02161
; CHANGE_LAYER
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11654.106
G1 X150.2 Y117.367 E-.32624
G1 X149.654 Y117.367 E-.20751
G1 X150.075 Y117.788 E-.22625
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/45
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.32 I-1.215 J.064 P1  F30000
G1 X150.974 Y134.974 Z7.32
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4919
G1 X141.026 Y134.974 E.26954
G1 X141.026 Y117.026 E.48632
G1 X150.974 Y117.026 E.26954
G1 X150.974 Y134.914 E.4847
G1 X151.389 Y135.389 F30000
G1 F4919
G1 X140.611 Y135.389 E.29207
G1 X140.611 Y116.611 E.50885
G1 X151.389 Y116.611 E.29207
G1 X151.389 Y135.329 E.50722
M204 S250
G1 X151.79 Y135.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
M73 P96 R0
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.026 Y134.807 Z7.48 F30000
G1 Z7.08
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420466
G1 F4919
G1 X150.633 Y134.2 E.02161
G1 X150.633 Y133.654 E.01375
G1 X149.654 Y134.633 E.03487
G1 X149.107 Y134.633 E.01375
G1 X150.633 Y133.107 E.05431
G1 X150.633 Y132.561 E.01375
G1 X148.561 Y134.633 E.07375
G1 X148.015 Y134.633 E.01375
G1 X150.633 Y132.015 E.09319
G1 X150.633 Y131.469 E.01375
G1 X147.469 Y134.633 E.11263
G1 X146.923 Y134.633 E.01375
G1 X150.633 Y130.923 E.13207
G1 X150.633 Y130.377 E.01375
G1 X146.377 Y134.633 E.15151
G1 X145.831 Y134.633 E.01375
G1 X150.633 Y129.831 E.17095
G1 X150.633 Y129.285 E.01375
G1 X145.285 Y134.633 E.19038
G1 X144.739 Y134.633 E.01375
G1 X150.633 Y128.739 E.20982
G1 X150.633 Y128.193 E.01375
G1 X144.193 Y134.633 E.22926
G1 X143.647 Y134.633 E.01375
G1 X150.633 Y127.647 E.2487
G1 X150.633 Y127.101 E.01375
G1 X143.101 Y134.633 E.26814
G1 X142.555 Y134.633 E.01375
G1 X150.633 Y126.555 E.28758
G1 X150.633 Y126.009 E.01375
G1 X142.009 Y134.633 E.30702
G1 X141.463 Y134.633 E.01375
G1 X150.633 Y125.463 E.32646
G1 X150.633 Y124.916 E.01375
G1 X141.367 Y134.183 E.32986
G1 X141.367 Y133.637 E.01375
G1 X150.633 Y124.37 E.32986
G1 X150.633 Y123.824 E.01375
G1 X141.367 Y133.091 E.32986
G1 X141.367 Y132.544 E.01375
G1 X150.633 Y123.278 E.32986
G1 X150.633 Y122.732 E.01375
G1 X141.367 Y131.998 E.32986
G1 X141.367 Y131.452 E.01375
G1 X150.633 Y122.186 E.32986
G1 X150.633 Y121.64 E.01375
G1 X141.367 Y130.906 E.32986
G1 X141.367 Y130.36 E.01375
G1 X150.633 Y121.094 E.32986
G1 X150.633 Y120.548 E.01375
G1 X141.367 Y129.814 E.32986
G1 X141.367 Y129.268 E.01375
G1 X150.633 Y120.002 E.32986
G1 X150.633 Y119.456 E.01375
G1 X141.367 Y128.722 E.32986
G1 X141.367 Y128.176 E.01375
G1 X150.633 Y118.91 E.32986
G1 X150.633 Y118.364 E.01375
G1 X141.367 Y127.63 E.32986
G1 X141.367 Y127.084 E.01375
G1 X150.633 Y117.818 E.32986
G1 X150.633 Y117.367 E.01134
G1 X150.538 Y117.367 E.0024
G1 X141.367 Y126.538 E.32647
G1 X141.367 Y125.992 E.01375
G1 X149.992 Y117.367 E.30703
G1 X149.446 Y117.367 E.01375
G1 X141.367 Y125.446 E.28759
G1 X141.367 Y124.899 E.01375
G1 X148.9 Y117.367 E.26815
G1 X148.353 Y117.367 E.01375
G1 X141.367 Y124.353 E.24871
G1 X141.367 Y123.807 E.01375
G1 X147.807 Y117.367 E.22927
G1 X147.261 Y117.367 E.01375
G1 X141.367 Y123.261 E.20983
G1 X141.367 Y122.715 E.01375
G1 X146.715 Y117.367 E.19039
G1 X146.169 Y117.367 E.01375
G1 X141.367 Y122.169 E.17095
G1 X141.367 Y121.623 E.01375
G1 X145.623 Y117.367 E.15151
G1 X145.077 Y117.367 E.01375
G1 X141.367 Y121.077 E.13207
G1 X141.367 Y120.531 E.01375
G1 X144.531 Y117.367 E.11263
G1 X143.985 Y117.367 E.01375
G1 X141.367 Y119.985 E.0932
G1 X141.367 Y119.439 E.01375
G1 X143.439 Y117.367 E.07376
G1 X142.893 Y117.367 E.01375
G1 X141.367 Y118.893 E.05432
G1 X141.367 Y118.347 E.01375
G1 X142.347 Y117.367 E.03488
G1 X141.801 Y117.367 E.01375
G1 X141.193 Y117.974 E.02162
; CHANGE_LAYER
; Z_HEIGHT: 7.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11654.106
G1 X141.801 Y117.367 E-.32634
G1 X142.347 Y117.367 E-.20751
G1 X141.926 Y117.788 E-.22615
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/45
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
G17
G3 Z7.48 I-1.067 J.585 P1  F30000
G1 X151.79 Y135.79 Z7.48
G1 Z7.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X140.21 Y135.79 E.29114
G1 X140.21 Y116.21 E.49227
G1 X151.79 Y116.21 E.29114
G1 X151.79 Y135.73 E.49076
;========Date 20250206========
; SKIPPABLE_START
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
G1 X149.79 Y135.74 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.52 Y128.143 Z7.64 F30000
G1 X151.578 Y117.126 Z7.64
G1 Z7.24
G1 E.8 F1800
; FEATURE: Top surface
G1 F5429
M204 S2000
G1 X150.874 Y116.422 E.02504
G1 X150.328 Y116.422
G1 X151.578 Y117.672 E.04443
G1 X151.578 Y118.217
G1 X149.783 Y116.422 E.06382
G1 X149.237 Y116.422
G1 X151.578 Y118.763 E.08322
G1 X151.578 Y119.308
G1 X148.692 Y116.422 E.10261
G1 X148.147 Y116.422
G1 X151.578 Y119.853 E.122
G1 X151.578 Y120.399
G1 X147.601 Y116.422 E.14139
G1 X147.056 Y116.422
G1 X151.578 Y120.944 E.16078
G1 X151.578 Y121.49
G1 X146.51 Y116.422 E.18018
M73 P97 R0
G1 X145.965 Y116.422
G1 X151.578 Y122.035 E.19957
G1 X151.578 Y122.58
G1 X145.42 Y116.422 E.21896
G1 X144.874 Y116.422
G1 X151.578 Y123.126 E.23835
G1 X151.578 Y123.671
G1 X144.329 Y116.422 E.25774
G1 X143.783 Y116.422
G1 X151.578 Y124.217 E.27714
G1 X151.578 Y124.762
G1 X143.238 Y116.422 E.29653
G1 X142.693 Y116.422
G1 X151.578 Y125.307 E.31592
G1 X151.578 Y125.853
G1 X142.147 Y116.422 E.33531
G1 X141.602 Y116.422
G1 X151.578 Y126.398 E.3547
G1 X151.578 Y126.944
G1 X141.056 Y116.422 E.3741
G1 X140.511 Y116.422
G1 X151.578 Y127.489 E.39349
G1 X151.578 Y128.034
G1 X140.422 Y116.879 E.39665
G1 X140.422 Y117.424
G1 X151.578 Y128.58 E.39665
G1 X151.578 Y129.125
G1 X140.422 Y117.969 E.39665
G1 X140.422 Y118.515
G1 X151.578 Y129.671 E.39665
G1 X151.578 Y130.216
G1 X140.422 Y119.06 E.39665
G1 X140.422 Y119.606
G1 X151.578 Y130.761 E.39665
G1 X151.578 Y131.307
G1 X140.422 Y120.151 E.39665
G1 X140.422 Y120.696
G1 X151.578 Y131.852 E.39665
G1 X151.578 Y132.398
G1 X140.422 Y121.242 E.39665
G1 X140.422 Y121.787
G1 X151.578 Y132.943 E.39665
G1 X151.578 Y133.489
G1 X140.422 Y122.333 E.39665
G1 X140.422 Y122.878
G1 X151.578 Y134.034 E.39665
G1 X151.578 Y134.579
G1 X140.422 Y123.424 E.39665
G1 X140.422 Y123.969
G1 X151.578 Y135.125 E.39665
G1 X151.486 Y135.578
G1 X140.422 Y124.514 E.39337
G1 X140.422 Y125.06
G1 X150.94 Y135.578 E.37398
G1 X150.395 Y135.578
G1 X140.422 Y125.605 E.35458
G1 X140.422 Y126.151
G1 X149.849 Y135.578 E.33519
G1 X149.304 Y135.578
G1 X140.422 Y126.696 E.3158
G1 X140.422 Y127.241
G1 X148.759 Y135.578 E.29641
G1 X148.213 Y135.578
G1 X140.422 Y127.787 E.27702
G1 X140.422 Y128.332
G1 X147.668 Y135.578 E.25762
G1 X147.122 Y135.578
G1 X140.422 Y128.878 E.23823
G1 X140.422 Y129.423
G1 X146.577 Y135.578 E.21884
G1 X146.032 Y135.578
G1 X140.422 Y129.968 E.19945
G1 X140.422 Y130.514
G1 X145.486 Y135.578 E.18006
G1 X144.941 Y135.578
G1 X140.422 Y131.059 E.16066
G1 X140.422 Y131.605
G1 X144.395 Y135.578 E.14127
G1 X143.85 Y135.578
G1 X140.422 Y132.15 E.12188
G1 X140.422 Y132.695
G1 X143.305 Y135.578 E.10249
G1 X142.759 Y135.578
G1 X140.422 Y133.241 E.0831
G1 X140.422 Y133.786
G1 X142.214 Y135.578 E.0637
G1 X141.668 Y135.578
G1 X140.422 Y134.332 E.04431
G1 X140.422 Y134.877
G1 X141.123 Y135.578 E.02492
; close powerlost recovery
M1003 S0
; WIPE_START
M73 P98 R0
G1 F11668.197
M204 S10000
G1 X140.422 Y134.877 E-.37664
G1 X140.422 Y134.332 E-.20726
G1 X140.75 Y134.659 E-.1761
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.64 I1.217 J0 P1  F30000
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
G1 Z7.74 F900 ; lower z a little
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

    G1 Z107.24 F600
    G1 Z105.24

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

