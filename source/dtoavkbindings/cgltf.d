/**
 * cgltf - a single-file glTF 2.0 parser written in C99.
 *
 * Version: 1.2
 *
 * Website: https://github.com/jkuhlmann/cgltf
 *
 * Distributed under the MIT License, see notice at the end of this file.
 *
 * Building:
 * Include this file where you need the struct and function
 * declarations. Have exactly one source file where you define
 * `CGLTF_IMPLEMENTATION` before including this file to get the
 * function definitions.
 *
 * Reference:
 * `cgltf_result cgltf_parse(const cgltf_options*, const void*,
 * cgltf_size, cgltf_data**)` parses both glTF and GLB data. If
 * this function returns `cgltf_result_success`, you have to call
 * `cgltf_free()` on the created `cgltf_data*` variable.
 * Note that contents of external files for buffers and images are not
 * automatically loaded. You'll need to read these files yourself using
 * URIs in the `cgltf_data` structure.
 *
 * `cgltf_options` is the struct passed to `cgltf_parse()` to control
 * parts of the parsing process. You can use it to force the file type
 * and provide memory allocation callbacks. Should be zero-initialized
 * to trigger default behavior.
 *
 * `cgltf_data` is the struct allocated and filled by `cgltf_parse()`.
 * It generally mirrors the glTF format as described by the spec (see
 * https://github.com/KhronosGroup/glTF/tree/master/specification/2.0).
 *
 * `void cgltf_free(cgltf_data*)` frees the allocated `cgltf_data`
 * variable.
 *
 * `cgltf_result cgltf_load_buffers(const cgltf_options*, cgltf_data*,
 * const char* gltf_path)` can be optionally called to open and read buffer
 * files using the `FILE*` APIs. The `gltf_path` argument is the path to
 * the original glTF file, which allows the parser to resolve the path to
 * buffer files.
 *
 * `cgltf_result cgltf_load_buffer_base64(const cgltf_options* options,
 * cgltf_size size, const char* base64, void** out_data)` decodes
 * base64-encoded data content. Used internally by `cgltf_load_buffers()`
 * and may be useful if you're not dealing with normal files.
 *
 * `cgltf_result cgltf_parse_file(const cgltf_options* options, const
 * char* path, cgltf_data** out_data)` can be used to open the given
 * file using `FILE*` APIs and parse the data using `cgltf_parse()`.
 *
 * `cgltf_result cgltf_validate(cgltf_data*)` can be used to do additional
 * checks to make sure the parsed glTF data is valid.
 *
 * `cgltf_node_transform_local` converts the translation / rotation / scale properties of a node
 * into a mat4.
 *
 * `cgltf_node_transform_world` calls `cgltf_node_transform_local` on every ancestor in order
 * to compute the root-to-node transformation.
 *
 * `cgltf_accessor_read_float` reads a certain element from an accessor and converts it to
 * floating point, assuming that `cgltf_load_buffers` has already been called. The passed-in element
 * size is the number of floats in the output buffer, which should be in the range [1, 16]. Returns
 * false if the passed-in element_size is too small, or if the accessor is sparse.
 *
 * `cgltf_accessor_read_index` is similar to its floating-point counterpart, but it returns size_t
 * and only works with single-component data types.
 *
 * `cgltf_result cgltf_copy_extras_json(const cgltf_data*, const cgltf_extras*,
 * char* dest, cgltf_size* dest_size)` allows to retrieve the "extras" data that
 * can be attached to many glTF objects (which can be arbitrary JSON data). The
 * `cgltf_extras` struct stores the offsets of the start and end of the extras JSON data
 * as it appears in the complete glTF JSON data. This function copies the extras data
 * into the provided buffer. If `dest` is NULL, the length of the data is written into
 * `dest_size`. You can then parse this data using your own JSON parser
 * or, if you've included the cgltf implementation using the integrated JSMN JSON parser.
 */

import core.stdc.config;

extern (C):

alias cgltf_size = c_ulong;
alias cgltf_float = float;
alias cgltf_int = int;
alias cgltf_bool = int;

enum cgltf_file_type
{
  cgltf_file_type_invalid = 0,
  cgltf_file_type_gltf = 1,
  cgltf_file_type_glb = 2
}

struct cgltf_options
{
  cgltf_file_type type; /* invalid == auto detect */
  cgltf_size json_token_count; /* 0 == auto */
  void* function (void* user, cgltf_size size) memory_alloc;
  void function (void* user, void* ptr) memory_free;
  void* memory_user_data;
}

enum cgltf_result
{
  success = 0,
  data_too_short = 1,
  unknown_format = 2,
  invalid_json = 3,
  invalid_gltf = 4,
  invalid_options = 5,
  file_not_found = 6,
  io_error = 7,
  out_of_memory = 8
}

enum cgltf_buffer_view_type
{
  invalid = 0,
  indices = 1,
  vertices = 2
}

enum cgltf_attribute_type
{
  invalid = 0,
  position = 1,
  normal = 2,
  tangent = 3,
  texcoord = 4,
  color = 5,
  joints = 6,
  weights = 7
}

enum cgltf_component_type
{
  invalid = 0,
  r_8 = 1, /* BYTE */
  r_8u = 2, /* UNSIGNED_BYTE */
  r_16 = 3, /* SHORT */
  r_16u = 4, /* UNSIGNED_SHORT */
  r_32u = 5, /* UNSIGNED_INT */
  r_32f = 6 /* FLOAT */
}

enum cgltf_type
{
  invalid = 0,
  scalar = 1,
  vec2 = 2,
  vec3 = 3,
  vec4 = 4,
  mat2 = 5,
  mat3 = 6,
  mat4 = 7
}

enum cgltf_primitive_type
{
  points = 0,
  lines = 1,
  line_loop = 2,
  line_strip = 3,
  triangles = 4,
  triangle_strip = 5,
  triangle_fan = 6
}

enum cgltf_alpha_mode
{
  opaque = 0,
  mask = 1,
  blend = 2
}

enum cgltf_animation_path_type
{
  invalid = 0,
  translation = 1,
  rotation = 2,
  scale = 3,
  weights = 4
}

enum cgltf_interpolation_type
{
  linear = 0,
  step = 1,
  cubic_spline = 2
}

enum cgltf_camera_type
{
  invalid = 0,
  perspective = 1,
  orthographic = 2
}

enum cgltf_light_type
{
  invalid = 0,
  directional = 1,
  point = 2,
  spot = 3
}

struct cgltf_extras
{
  cgltf_size start_offset;
  cgltf_size end_offset;
}

struct cgltf_buffer
{
  cgltf_size size;
  char* uri;
  void* data; /* loaded by cgltf_load_buffers */
  cgltf_extras extras;
}

struct cgltf_buffer_view
{
  cgltf_buffer* buffer;
  cgltf_size offset;
  cgltf_size size;
  cgltf_size stride; /* 0 == automatically determined by accessor */
  cgltf_buffer_view_type type;
  cgltf_extras extras;
}

struct cgltf_accessor_sparse
{
  cgltf_size count;
  cgltf_buffer_view* indices_buffer_view;
  cgltf_size indices_byte_offset;
  cgltf_component_type indices_component_type;
  cgltf_buffer_view* values_buffer_view;
  cgltf_size values_byte_offset;
  cgltf_extras extras;
  cgltf_extras indices_extras;
  cgltf_extras values_extras;
}

struct cgltf_accessor
{
  cgltf_component_type component_type;
  cgltf_bool normalized;
  cgltf_type type;
  cgltf_size offset;
  cgltf_size count;
  cgltf_size stride;
  cgltf_buffer_view* buffer_view;
  cgltf_bool has_min;
  cgltf_float[16] min;
  cgltf_bool has_max;
  cgltf_float[16] max;
  cgltf_bool is_sparse;
  cgltf_accessor_sparse sparse;
  cgltf_extras extras;
}

struct cgltf_attribute
{
  char* name;
  cgltf_attribute_type type;
  cgltf_int index;
  cgltf_accessor* data;
}

struct cgltf_image
{
  char* name;
  char* uri;
  cgltf_buffer_view* buffer_view;
  char* mime_type;
  cgltf_extras extras;
}

struct cgltf_sampler
{
  cgltf_int mag_filter;
  cgltf_int min_filter;
  cgltf_int wrap_s;
  cgltf_int wrap_t;
  cgltf_extras extras;
}

struct cgltf_texture
{
  char* name;
  cgltf_image* image;
  cgltf_sampler* sampler;
  cgltf_extras extras;
}

struct cgltf_texture_transform
{
  cgltf_float[2] offset;
  cgltf_float rotation;
  cgltf_float[2] scale;
  cgltf_int texcoord;
}

struct cgltf_texture_view
{
  cgltf_texture* texture;
  cgltf_int texcoord;
  cgltf_float scale; /* equivalent to strength for occlusion_texture */
  cgltf_bool has_transform;
  cgltf_texture_transform transform;
  cgltf_extras extras;
}

struct cgltf_pbr_metallic_roughness
{
  cgltf_texture_view base_color_texture;
  cgltf_texture_view metallic_roughness_texture;

  cgltf_float[4] base_color_factor;
  cgltf_float metallic_factor;
  cgltf_float roughness_factor;

  cgltf_extras extras;
}

struct cgltf_pbr_specular_glossiness
{
  cgltf_texture_view diffuse_texture;
  cgltf_texture_view specular_glossiness_texture;

  cgltf_float[4] diffuse_factor;
  cgltf_float[3] specular_factor;
  cgltf_float glossiness_factor;
}

struct cgltf_material
{
  char* name;
  cgltf_bool has_pbr_metallic_roughness;
  cgltf_bool has_pbr_specular_glossiness;
  cgltf_pbr_metallic_roughness pbr_metallic_roughness;
  cgltf_pbr_specular_glossiness pbr_specular_glossiness;
  cgltf_texture_view normal_texture;
  cgltf_texture_view occlusion_texture;
  cgltf_texture_view emissive_texture;
  cgltf_float[3] emissive_factor;
  cgltf_alpha_mode alpha_mode;
  cgltf_float alpha_cutoff;
  cgltf_bool double_sided;
  cgltf_bool unlit;
  cgltf_extras extras;
}

struct cgltf_morph_target
{
  cgltf_attribute* attributes;
  cgltf_size attributes_count;
}

struct cgltf_primitive
{
  cgltf_primitive_type type;
  cgltf_accessor* indices;
  cgltf_material* material;
  cgltf_attribute* attributes;
  cgltf_size attributes_count;
  cgltf_morph_target* targets;
  cgltf_size targets_count;
  cgltf_extras extras;
}

struct cgltf_mesh
{
  char* name;
  cgltf_primitive* primitives;
  cgltf_size primitives_count;
  cgltf_float* weights;
  cgltf_size weights_count;
  cgltf_extras extras;
}

struct cgltf_skin
{
  char* name;
  cgltf_node** joints;
  cgltf_size joints_count;
  cgltf_node* skeleton;
  cgltf_accessor* inverse_bind_matrices;
  cgltf_extras extras;
}

struct cgltf_camera_perspective
{
  cgltf_float aspect_ratio;
  cgltf_float yfov;
  cgltf_float zfar;
  cgltf_float znear;
  cgltf_extras extras;
}

struct cgltf_camera_orthographic
{
  cgltf_float xmag;
  cgltf_float ymag;
  cgltf_float zfar;
  cgltf_float znear;
  cgltf_extras extras;
}

struct cgltf_camera
{
  char* name;
  cgltf_camera_type type;

  union
  {
    cgltf_camera_perspective perspective;
    cgltf_camera_orthographic orthographic;
  }

  cgltf_extras extras;
}

struct cgltf_light
{
  char* name;
  cgltf_float[3] color;
  cgltf_float intensity;
  cgltf_light_type type;
  cgltf_float range;
  cgltf_float spot_inner_cone_angle;
  cgltf_float spot_outer_cone_angle;
}

struct cgltf_node_
{
  char* name;
  cgltf_node* parent;
  cgltf_node** children;
  cgltf_size children_count;
  cgltf_skin* skin;
  cgltf_mesh* mesh;
  cgltf_camera* camera;
  cgltf_light* light;
  cgltf_float* weights;
  cgltf_size weights_count;
  cgltf_bool has_translation;
  cgltf_bool has_rotation;
  cgltf_bool has_scale;
  cgltf_bool has_matrix;
  cgltf_float[3] translation;
  cgltf_float[4] rotation;
  cgltf_float[3] scale;
  cgltf_float[16] matrix;
  cgltf_extras extras;
}

struct cgltf_scene
{
  char* name;
  cgltf_node** nodes;
  cgltf_size nodes_count;
  cgltf_extras extras;
}

struct cgltf_animation_sampler
{
  cgltf_accessor* input;
  cgltf_accessor* output;
  cgltf_interpolation_type interpolation;
  cgltf_extras extras;
}

struct cgltf_animation_channel
{
  cgltf_animation_sampler* sampler;
  cgltf_node* target_node;
  cgltf_animation_path_type target_path;
  cgltf_extras extras;
}

struct cgltf_animation
{
  char* name;
  cgltf_animation_sampler* samplers;
  cgltf_size samplers_count;
  cgltf_animation_channel* channels;
  cgltf_size channels_count;
  cgltf_extras extras;
}

struct cgltf_asset
{
  char* copyright;
  char* generator;
  char* version_;
  char* min_version;
  cgltf_extras extras;
}

struct cgltf_data
{
  cgltf_file_type file_type;
  void* file_data;

  cgltf_asset asset;

  cgltf_mesh* meshes;
  cgltf_size meshes_count;

  cgltf_material* materials;
  cgltf_size materials_count;

  cgltf_accessor* accessors;
  cgltf_size accessors_count;

  cgltf_buffer_view* buffer_views;
  cgltf_size buffer_views_count;

  cgltf_buffer* buffers;
  cgltf_size buffers_count;

  cgltf_image* images;
  cgltf_size images_count;

  cgltf_texture* textures;
  cgltf_size textures_count;

  cgltf_sampler* samplers;
  cgltf_size samplers_count;

  cgltf_skin* skins;
  cgltf_size skins_count;

  cgltf_camera* cameras;
  cgltf_size cameras_count;

  cgltf_light* lights;
  cgltf_size lights_count;

  cgltf_node* nodes;
  cgltf_size nodes_count;

  cgltf_scene* scenes;
  cgltf_size scenes_count;

  cgltf_scene* scene;

  cgltf_animation* animations;
  cgltf_size animations_count;

  cgltf_extras extras;

  char** extensions_used;
  cgltf_size extensions_used_count;

  char** extensions_required;
  cgltf_size extensions_required_count;

  const(char)* json;
  cgltf_size json_size;

  const(void)* bin;
  cgltf_size bin_size;

  void function (void* user, void* ptr) memory_free;
  void* memory_user_data;
}

cgltf_result cgltf_parse (
  const(cgltf_options)* options,
  const(void)* data,
  cgltf_size size,
  cgltf_data** out_data);

cgltf_result cgltf_parse_file (
  const(cgltf_options)* options,
  const(char)* path,
  cgltf_data** out_data);

cgltf_result cgltf_load_buffers (
  const(cgltf_options)* options,
  cgltf_data* data,
  const(char)* gltf_path);

cgltf_result cgltf_load_buffer_base64 (const(cgltf_options)* options, cgltf_size size, const(char)* base64, void** out_data);

cgltf_result cgltf_validate (cgltf_data* data);

void cgltf_free (cgltf_data* data);

void cgltf_node_transform_local (const(cgltf_node)* node, cgltf_float* out_matrix);
void cgltf_node_transform_world (const(cgltf_node)* node, cgltf_float* out_matrix);

cgltf_bool cgltf_accessor_read_float (const(cgltf_accessor)* accessor, cgltf_size index, cgltf_float* out_, cgltf_size element_size);
cgltf_size cgltf_accessor_read_index (const(cgltf_accessor)* accessor, cgltf_size index);

cgltf_result cgltf_copy_extras_json (const(cgltf_data)* data, const(cgltf_extras)* extras, char* dest, cgltf_size* dest_size);

/* #ifndef CGLTF_H_INCLUDED__ */

/*
 *
 * Stop now, if you are only interested in the API.
 * Below, you find the implementation.
 *
 */

/* This makes MSVC intellisense work. */

/* For uint8_t, uint32_t */
/* For strncpy */
/* For malloc, free */
/* For fopen */
/* For UINT_MAX etc */

/* JSMN_PARENT_LINKS is necessary to make parsing large structures linear in input size */

/* JSMN_STRICT is necessary to reject invalid JSON documents */

/*
 * -- jsmn.h start --
 * Source: https://github.com/zserge/jsmn
 * License: MIT
 */

/* Not enough tokens were provided */

/* Invalid character inside JSON string */

/* The string is not a full JSON packet, more bytes expected */

/* offset in the JSON string */
/* next token to allocate */
/* superior token node, e.g parent object or array */

/*
 * -- jsmn.h end --
 */

// Magic

// Version

// Total length

// JSON chunk: length

// JSON chunk: magic

// We can read another chunk

// Bin chunk: length

// Bin chunk: magic

// There are three special cases for component extraction, see #data-alignment in the 2.0 spec.

/* checking size for 0 verifies that a value follows the key */

// note: we can't parse the precise number of elements since type may not have been computed yet

// note: we can't parse the precise number of elements since type may not have been computed yet

// this makes sure that we always have an UNDEFINED token at the end of the stream
// for invalid JSON inputs this makes sure we don't perform out of bound reads of token data

/*
 * -- jsmn.c start --
 * Source: https://github.com/zserge/jsmn
 * License: MIT
 *
 * Copyright (c) 2010 Serge A. Zaitsev

 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:

 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/**
 * Allocates a fresh unused token from the token pull.
 */

/**
 * Fills token type and boundaries.
 */

/**
 * Fills next available token with JSON primitive.
 */

/* In strict mode primitive must be followed by "," or "}" or "]" */

/* In strict mode primitive must be followed by a comma/object/array */

/**
 * Fills next token with JSON string.
 */

/* Skip starting quote */

/* Quote: end of string */

/* Backslash: Quoted symbol expected */

/* Allowed escaped symbols */

/* Allows escaped symbol \uXXXX */

/* If it isn't a hex character we have an error */
/* 0-9 */
/* A-F */
/* a-f */

/* Unexpected symbol */

/**
 * Parse JSON string and fill tokens.
 */

/* Error if unmatched closing bracket */

/* In strict mode primitives are: numbers and booleans */

/* And they must not be keys of the object */

/* In non-strict mode every unquoted value is a primitive */

/* Unexpected char in strict mode */

/* Unmatched opened object or array */

/**
 * Creates a new parser based over a given  buffer with an array of tokens
 * available.
 */

/*
 * -- jsmn.c end --
 */

/* #ifdef CGLTF_IMPLEMENTATION */

/* cgltf is distributed under MIT license:
 *
 * Copyright (c) 2018 Johannes Kuhlmann

 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:

 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
