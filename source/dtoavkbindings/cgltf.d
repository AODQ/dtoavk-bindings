import core.stdc.config;

extern (C):

alias cgltf_size = c_ulong;
alias cgltf_float = float;
alias cgltf_int = int;
alias cgltf_bool = int;

enum cgltf_file_type {
  invalid = 0,
  gltf = 1,
  glb = 2
}

struct cgltf_options {
  cgltf_file_type type;
  cgltf_size json_token_count;
  void* function (void* user, cgltf_size size) memory_alloc;
  void function (void* user, void* ptr) memory_free;
  void* memory_user_data;
}

enum cgltf_result {
  success = 0,
  dataTooShort = 1,
  unknownFormat = 2,
  invalidJson = 3,
  invalidGltf = 4,
  invalidOptions = 5,
  fileNotFound = 6,
  ioError = 7,
  outOfMemory = 8
}

enum cgltf_buffer_view_type {
  invalid = 0,
  indices = 1,
  vertices = 2
}

enum cgltf_attribute_type {
  invalid = 0,
  position = 1,
  normal = 2,
  tangent = 3,
  texcoord = 4,
  color = 5,
  joints = 6,
  weights = 7
}

enum cgltf_component_type {
  invalid = 0,
  r8 = 1,
  r8u = 2,
  r16 = 3,
  r16u = 4,
  r32u = 5,
  r32f = 6
}

import core.stdc.stdint;

uint32_t ByteCount(cgltf_type type, cgltf_component_type componentType) {

  uint32_t TypeToSize() {
    switch (type) with(cgltf_type) {
      default:     return 0;
      case scalar: return 1;
      case vec2:   return 2;
      case vec3:   return 3;
      case vec4:   return 4;
      case mat2:   return 4;
      case mat3:   return 9;
      case mat4:   return 16;
    }
  }

  uint32_t ComponentTypeToSize() {
    switch (componentType) with (cgltf_component_type) {
      default:   return 0;
      case r8:   return 1;
      case r8u:  return 1;
      case r16:  return 2;
      case r16u: return 2;
      case r32u: return 4;
      case r32f: return 4;
    }
  }

  return TypeToSize() * ComponentTypeToSize();
}

enum cgltf_type {
  invalid = 0,
  scalar = 1,
  vec2 = 2,
  vec3 = 3,
  vec4 = 4,
  mat2 = 5,
  mat3 = 6,
  mat4 = 7
}

enum cgltf_primitive_type {
  points = 0,
  lines = 1,
  lineLoop = 2,
  lineStrip = 3,
  triangles = 4,
  triangleStrip = 5,
  triangleFan = 6
}

enum cgltf_alpha_mode {
  opaque = 0,
  mask = 1,
  blend = 2
}

enum cgltf_animation_path_type {
  invalid = 0,
  translation = 1,
  rotation = 2,
  scale = 3,
  weights = 4
}

enum cgltf_interpolation_type {
  linear = 0,
  step = 1,
  cubicSpline = 2
}

enum cgltf_camera_type {
  invalid = 0,
  perspective = 1,
  orthographic = 2
}

enum cgltf_light_type {
  invalid = 0,
  directional = 1,
  point = 2,
  spot = 3
}

struct cgltf_buffer {
  cgltf_size size;
  char* uri;
  void* data;
}

struct cgltf_buffer_view {
  cgltf_buffer* buffer;
  cgltf_size offset;
  cgltf_size size;
  cgltf_size stride;
  cgltf_buffer_view_type type;
}

struct cgltf_accessor_sparse {
  cgltf_size count;
  cgltf_buffer_view* indices_buffer_view;
  cgltf_size indices_byte_offset;
  cgltf_component_type indices_component_type;
  cgltf_buffer_view* values_buffer_view;
  cgltf_size values_byte_offset;
}

struct cgltf_accessor {
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
}

struct cgltf_attribute {
  char* name;
  cgltf_attribute_type type;
  cgltf_int index;
  cgltf_accessor* data;
}

struct cgltf_image {
  char* name;
  char* uri;
  cgltf_buffer_view* buffer_view;
  char* mime_type;
}

struct cgltf_sampler {
  cgltf_int mag_filter;
  cgltf_int min_filter;
  cgltf_int wrap_s;
  cgltf_int wrap_t;
}

struct cgltf_texture {
  char* name;
  cgltf_image* image;
  cgltf_sampler* sampler;
}

struct cgltf_texture_transform {
  cgltf_float[2] offset;
  cgltf_float rotation;
  cgltf_float[2] scale;
  cgltf_int texcoord;
}

struct cgltf_texture_view {
  cgltf_texture* texture;
  cgltf_int texcoord;
  cgltf_float scale;
  cgltf_bool has_transform;
  cgltf_texture_transform transform;
}

struct cgltf_pbr_metallic_roughness {
  cgltf_texture_view base_color_texture;
  cgltf_texture_view metallic_roughness_texture;

  cgltf_float[4] base_color_factor;
  cgltf_float metallic_factor;
  cgltf_float roughness_factor;
}

struct cgltf_pbr_specular_glossiness {
  cgltf_texture_view diffuse_texture;
  cgltf_texture_view specular_glossiness_texture;

  cgltf_float[4] diffuse_factor;
  cgltf_float[3] specular_factor;
  cgltf_float glossiness_factor;
}

struct cgltf_material {
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
}

struct cgltf_morph_target {
  cgltf_attribute* attributes;
  cgltf_size attributes_count;
}

struct cgltf_primitive {
  cgltf_primitive_type type;
  cgltf_accessor* indices;
  cgltf_material* material;
  cgltf_attribute* attributes;
  cgltf_size attributes_count;
  cgltf_morph_target* targets;
  cgltf_size targets_count;
}

struct cgltf_mesh {
  char* name;
  cgltf_primitive* primitives;
  cgltf_size primitives_count;
  cgltf_float* weights;
  cgltf_size weights_count;
}

struct cgltf_skin {
  char* name;
  cgltf_node** joints;
  cgltf_size joints_count;
  cgltf_node* skeleton;
  cgltf_accessor* inverse_bind_matrices;
}

struct cgltf_camera_perspective {
  cgltf_float aspect_ratio;
  cgltf_float yfov;
  cgltf_float zfar;
  cgltf_float znear;
}

struct cgltf_camera_orthographic {
  cgltf_float xmag;
  cgltf_float ymag;
  cgltf_float zfar;
  cgltf_float znear;
}

struct cgltf_camera {
  char* name;
  cgltf_camera_type type;

  union
  {
    cgltf_camera_perspective perspective;
    cgltf_camera_orthographic orthographic;
  }
}

struct cgltf_light {
  char* name;
  cgltf_float[3] color;
  cgltf_float intensity;
  cgltf_light_type type;
  cgltf_float range;
  cgltf_float spot_inner_cone_angle;
  cgltf_float spot_outer_cone_angle;
}

struct cgltf_node {
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
}

struct cgltf_scene {
  char* name;
  cgltf_node** nodes;
  cgltf_size nodes_count;
}

struct cgltf_animation_sampler {
  cgltf_accessor* input;
  cgltf_accessor* output;
  cgltf_interpolation_type interpolation;
}

struct cgltf_animation_channel {
  cgltf_animation_sampler* sampler;
  cgltf_node* target_node;
  cgltf_animation_path_type target_path;
}

struct cgltf_animation {
  char* name;
  cgltf_animation_sampler* samplers;
  cgltf_size samplers_count;
  cgltf_animation_channel* channels;
  cgltf_size channels_count;
}

struct cgltf_asset {
  char* copyright;
  char* generator;
  char* version_;
  char* min_version;
}

struct cgltf_data {
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

  const(void)* bin;
  cgltf_size bin_size;

  void function (void* user, void* ptr) memory_free;
  void* memory_user_data;
}

cgltf_result cgltf_parse(
  const(cgltf_options)* options
, const(void)* data
, cgltf_size size
, cgltf_data** out_data
);

cgltf_result cgltf_parse_file(
  const(cgltf_options)* options
, const(char)* path
, cgltf_data** out_data
); 

cgltf_result cgltf_load_buffers(
  const(cgltf_options)* options
, cgltf_data* data
, const(char)* base_path
);

cgltf_result cgltf_validate(cgltf_data* data);

void cgltf_free(cgltf_data* data);

void cgltf_node_transform_local(
  const(cgltf_node)* node
, cgltf_float* out_matrix
);

void cgltf_node_transform_world(
  const(cgltf_node)* node
, cgltf_float* out_matrix
);

cgltf_bool cgltf_accessor_read_float (
  const(cgltf_accessor)* accessor
, cgltf_size index
, cgltf_float* out_
, cgltf_size element_size
);

cgltf_size cgltf_accessor_read_index(
  const(cgltf_accessor)* accessor,
  cgltf_size index
);
