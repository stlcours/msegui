{ MSEgui Copyright (c) 2011 by Martin Schreiber

    See the file COPYING.MSE, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}
unit mseglextglob;

{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface

type
 glextensionty = (
  gle_GL_version_1_2,
  gle_GL_ARB_imaging,
  gle_GL_version_1_3,
  gle_GL_ARB_multitexture,
  gle_GL_ARB_transpose_matrix,
  gle_GL_ARB_multisample,
  gle_GL_ARB_texture_env_add,
{$IFDEF Windows}
  gle_WGL_ARB_extensions_string,
  gle_WGL_ARB_buffer_region,
{$ENDIF}
  gle_GL_ARB_texture_cube_map,
  gle_GL_ARB_depth_texture,
  gle_GL_ARB_point_parameters,
  gle_GL_ARB_shadow,
  gle_GL_ARB_shadow_ambient,
  gle_GL_ARB_texture_border_clamp,
  gle_GL_ARB_texture_compression,
  gle_GL_ARB_texture_env_combine,
  gle_GL_ARB_texture_env_crossbar,
  gle_GL_ARB_texture_env_dot3,
  gle_GL_ARB_texture_mirrored_repeat,
  gle_GL_ARB_vertex_blend,
  gle_GL_ARB_vertex_program,
  gle_GL_ARB_window_pos,
  gle_GL_EXT_422_pixels,
  gle_GL_EXT_abgr,
  gle_GL_EXT_bgra,
  gle_GL_EXT_blend_color,
  gle_GL_EXT_blend_func_separate,
  gle_GL_EXT_blend_logic_op,
  gle_GL_EXT_blend_minmax,
  gle_GL_EXT_blend_subtract,
  gle_GL_EXT_clip_volume_hint,
  gle_GL_EXT_color_subtable,
  gle_GL_EXT_compiled_vertex_array,
  gle_GL_EXT_convolution,
  gle_GL_EXT_fog_coord,
  gle_GL_EXT_histogram,
  gle_GL_EXT_multi_draw_arrays,
  gle_GL_EXT_packed_pixels,
  gle_GL_EXT_paletted_texture,
  gle_GL_EXT_point_parameters,
  gle_GL_EXT_polygon_offset,
  gle_GL_EXT_secondary_color,
  gle_GL_EXT_separate_specular_color,
  gle_GL_EXT_shadow_funcs,
  gle_GL_EXT_shared_texture_palette,
  gle_GL_EXT_stencil_two_side,
  gle_GL_EXT_stencil_wrap,
  gle_GL_EXT_subtexture,
  gle_GL_EXT_texture3D,
  gle_GL_EXT_texture_compression_s3tc,
  gle_GL_EXT_texture_env_add,
  gle_GL_EXT_texture_env_combine,
  gle_GL_EXT_texture_env_dot3,
  gle_GL_EXT_texture_filter_anisotropic,
  gle_GL_EXT_texture_lod_bias,
  gle_GL_EXT_texture_object,
  gle_GL_EXT_vertex_array,
  gle_GL_EXT_vertex_shader,
  gle_GL_EXT_vertex_weighting,
  gle_GL_HP_occlusion_test,
  gle_GL_NV_blend_square,
  gle_GL_NV_copy_depth_to_color,
  gle_GL_NV_depth_clamp,
  gle_GL_NV_evaluators,
  gle_GL_NV_fence,
  gle_GL_NV_fog_distance,
  gle_GL_NV_light_max_exponent,
  gle_GL_NV_multisample_filter_hint,
  gle_GL_NV_occlusion_query,
  gle_GL_NV_packed_depth_stencil,
  gle_GL_NV_point_sprite,
  gle_GL_NV_register_combiners,
  gle_GL_NV_register_combiners2,
  gle_GL_NV_texgen_emboss,
  gle_GL_NV_texgen_reflection,
  gle_GL_NV_texture_compression_vtc,
  gle_GL_NV_texture_env_combine4,
  gle_GL_NV_texture_rectangle,
  gle_GL_NV_texture_shader,
  gle_GL_NV_texture_shader2,
  gle_GL_NV_texture_shader3,
  gle_GL_NV_vertex_array_range,
  gle_GL_NV_vertex_array_range2,
  gle_GL_NV_vertex_program,
  gle_GL_NV_vertex_program1_1,
  gle_GL_ATI_element_array,
  gle_GL_ATI_envmap_bumpmap,
  gle_GL_ATI_fragment_shader,
  gle_GL_ATI_pn_triangles,
  gle_GL_ATI_texture_mirror_once,
  gle_GL_ATI_vertex_array_object,
  gle_GL_ATI_vertex_streams,
{$IFDEF Windows}
  gle_WGL_I3D_image_buffer,
  gle_WGL_I3D_swap_frame_lock,
  gle_WGL_I3D_swap_frame_usage,
{$ENDIF}
  gle_GL_3DFX_texture_compression_FXT1,
  gle_GL_IBM_cull_vertex,
  gle_GL_IBM_multimode_draw_arrays,
  gle_GL_IBM_raster_pos_clip,
  gle_GL_IBM_texture_mirrored_repeat,
  gle_GL_IBM_vertex_array_lists,
  gle_GL_MESA_resize_buffers,
  gle_GL_MESA_window_pos,
  gle_GL_OML_interlace,
  gle_GL_OML_resample,
  gle_GL_OML_subsample,
  gle_GL_SGIS_generate_mipmap,
  gle_GL_SGIS_multisample,
  gle_GL_SGIS_pixel_texture,
  gle_GL_SGIS_texture_border_clamp,
  gle_GL_SGIS_texture_color_mask,
  gle_GL_SGIS_texture_edge_clamp,
  gle_GL_SGIS_texture_lod,
  gle_GL_SGIS_depth_texture,
  gle_GL_SGIX_fog_offset,
  gle_GL_SGIX_interlace,
  gle_GL_SGIX_shadow_ambient,
  gle_GL_SGI_color_matrix,
  gle_GL_SGI_color_table,
  gle_GL_SGI_texture_color_table,
  gle_GL_SUN_vertex,
  gle_GL_ARB_fragment_program,
  gle_GL_ATI_text_fragment_shader,
  gle_GL_APPLE_client_storage,
  gle_GL_APPLE_element_array,
  gle_GL_APPLE_fence,
  gle_GL_APPLE_vertex_array_object,
  gle_GL_APPLE_vertex_array_range,
{$IFDEF Windows}
  gle_WGL_ARB_pixel_format,
  gle_WGL_ARB_make_current_read,
  gle_WGL_ARB_pbuffer,
  gle_WGL_EXT_swap_control,
  gle_WGL_ARB_render_texture,
  gle_WGL_EXT_extensions_string,
  gle_WGL_EXT_make_current_read,
  gle_WGL_EXT_pbuffer,
  gle_WGL_EXT_pixel_format,
  gle_WGL_I3D_digital_video_control,
  gle_WGL_I3D_gamma,
  gle_WGL_I3D_genlock,
{$ENDIF}
  gle_GL_ARB_matrix_palette,
  gle_GL_NV_element_array,
  gle_GL_NV_float_buffer,
  gle_GL_NV_fragment_program,
  gle_GL_NV_primitive_restart,
  gle_GL_NV_vertex_program2,
  {$IFDEF Windows}
  gle_WGL_NV_render_texture_rectangle,
  {$ENDIF}
  gle_GL_NV_pixel_data_range,
  gle_GL_EXT_texture_rectangle,
  gle_GL_S3_s3tc,
  gle_GL_ATI_draw_buffers,
  {$IFDEF Windows}
  gle_WGL_ATI_pixel_format_float,
  {$ENDIF}
  gle_GL_ATI_texture_env_combine3,
  gle_GL_ATI_texture_float,
  gle_GL_NV_texture_expand_normal,
  gle_GL_NV_half_float,
  gle_GL_ATI_map_object_buffer,
  gle_GL_ATI_separate_stencil,
  gle_GL_ATI_vertex_attrib_array_object,
  gle_GL_ARB_vertex_buffer_object,
  gle_GL_ARB_occlusion_query,
  gle_GL_ARB_shader_objects,
  gle_GL_ARB_vertex_shader,
  gle_GL_ARB_fragment_shader,
  gle_GL_ARB_shading_language_100,
  gle_GL_ARB_texture_non_power_of_two,
  gle_GL_ARB_point_sprite,
  gle_GL_EXT_depth_bounds_test,
  gle_GL_EXT_texture_mirror_clamp,
  gle_GL_EXT_blend_equation_separate,
  gle_GL_MESA_pack_invert,
  gle_GL_MESA_ycbcr_texture,
  gle_GL_ARB_fragment_program_shadow,
  gle_GL_NV_fragment_program_option,
  gle_GL_EXT_pixel_buffer_object,
  gle_GL_NV_fragment_program2,
  gle_GL_NV_vertex_program2_option,
  gle_GL_NV_vertex_program3,
  gle_GL_ARB_draw_buffers,
  gle_GL_ARB_texture_rectangle,
  gle_GL_ARB_color_buffer_float,
  gle_GL_ARB_half_float_pixel,
  gle_GL_ARB_texture_float,
  gle_GL_EXT_texture_compression_dxt1,
  gle_GL_ARB_pixel_buffer_object,
  gle_GL_EXT_framebuffer_object,
  gle_GL_version_1_4,
  gle_GL_version_1_5,
  gle_GL_version_2_0
 );
 glextensionsty = set of glextensionty;

implementation
end.
