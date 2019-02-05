/*
libimago - a multi-format image file input/output library.
Copyright (C) 2010 John Tsiombikas <nuclear@member.fsf.org>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import core.stdc.stdint;
import core.stdc.stdio;
import core.stdc.stdlib;
import core.stdc.string;

struct png_struct;


struct ftype_module {
  char* suffix;  /* used for format autodetection during saving only */

  int function(img_io     *io)              check;
  int function(img_pixmap *img, img_io *io) read;
  int function(img_pixmap *img, img_io *io) write;
};

enum img_fmt {
  IMG_FMT_GREY8,
  IMG_FMT_RGB24,
  IMG_FMT_RGBA32,
  IMG_FMT_GREYF,
  IMG_FMT_RGBF,
  IMG_FMT_RGBAF,

  NUM_IMG_FMT
};

struct img_pixmap {
  void *pixels;
  int width, height;
  img_fmt fmt;
  int pixelsz;
  char *name;
};

struct img_io {
  void *uptr;  /* user-data */

  size_t function(void *buf, size_t bytes, void *uptr) read;
  size_t function(void *buf, size_t bytes, void *uptr) write;
  long function(long offs, int whence, void *uptr) seek;
};

/* initialize the img_pixmap structure */
extern(C) void img_init(img_pixmap *img);
/* destroys the img_pixmap structure, freeing the pixel buffer (if available)
 * and any other memory held by the pixmap.
 */
extern(C) void img_destroy(img_pixmap *img);

/* convenience function that allocates an img_pixmap struct and then initializes
 * it.  returns null if the malloc fails.
 */
img_pixmap *img_create();
/* frees a pixmap previously allocated with img_create (free followed by
 * img_destroy) */
extern(C) void img_free(img_pixmap *img);

extern(C) int img_set_name(img_pixmap *img, const char *name);

/* set the image pixel format */
extern(C) int img_set_format(img_pixmap *img, img_fmt fmt);

/* copies one pixmap to another.  equivalent to: img_set_pixels(dest,
 * src->width, src->height, src->fmt, src->pixels)
 */
extern(C) int img_copy(img_pixmap *dest, img_pixmap *src);

/* allocates a pixel buffer of the specified dimensions and format, and copies
 * the pixels given through the pix pointer into it.  the pix pointer can be
 * null, in which case there's no copy, just allocation.
 *
 * C++: fmt and pix have default parameters IMG_FMT_RGBA32 and null
 * respectively.
 */
extern(C) int img_set_pixels(
  img_pixmap *img
, int w
, int h
, img_fmt fmt = img_fmt.IMG_FMT_RGBA32
, void *pix = null);

/* Simplified image loading
 * Loads the specified file, and returns a pointer to an array of pixels of the
 * requested pixel format. The width and height of the image are returned
 * through the xsz and ysz pointers.  If the image cannot be loaded, the
 * function returns null.
 *
 * C++: the format argument is optional and defaults to IMG_FMT_RGBA32
 */
extern(C) void *img_load_pixels(
  const char *fname
, int *xsz
, int *ysz
, img_fmt fmt = img_fmt.IMG_FMT_RGBA32
);

/* Simplified image saving
 * Reads an array of pixels supplied through the pix pointer, of dimensions xsz
 * and ysz, and pixel-format fmt, and saves it to a file.
 * The output filetype is guessed by the filename suffix.
 *
 * C++: the format argument is optional and defaults to IMG_FMT_RGBA32
 */
extern(C) int img_save_pixels(
  const char *fname, void *pix, int xsz, int ysz, img_fmt fmt = img_fmt.IMG_FMT_RGBA32
);

/* Frees the memory allocated by img_load_pixels */
extern(C) void img_free_pixels(void *pix);

/* Loads an image file into the supplied pixmap */
extern(C) int img_load(img_pixmap *img, const char *fname);
/* Saves the supplied pixmap to a file. The output filetype is guessed by the
 * filename suffix */
extern(C) int img_save(img_pixmap *img, const char *fname);

/* Reads an image from an open FILE* into the supplied pixmap */
extern(C) int img_read_file(img_pixmap *img, FILE *fp);
/* Writes the supplied pixmap to an open FILE* */
extern(C) int img_write_file(img_pixmap *img, FILE *fp);

/* Reads an image using user-defined file-i/o functions (see img_io_set_*) */
extern(C) int img_read(img_pixmap *img, img_io *io);
/* Writes an image using user-defined file-i/o functions (see img_io_set_*) */
extern(C) int img_write(img_pixmap *img, img_io *io);

/* Converts an image to the specified pixel format */
extern(C) int img_convert(img_pixmap *img, img_fmt tofmt);

/* Converts an image from an integer pixel format to the corresponding floating
 * point one */
extern(C) int img_to_float(img_pixmap *img);
/* Converts an image from a floating point pixel format to the corresponding
 * integer one */
extern(C) int img_to_integer(img_pixmap *img);

/* Returns non-zero (true) if the supplied image is in a floating point pixel
 * format */
extern(C) int img_is_float(img_pixmap *img);
/* Returns non-zero (true) if the supplied image has an alpha channel */
extern(C) int img_has_alpha(img_pixmap *img);
/* Returns non-zero (true) if the supplied image is greyscale */
extern(C) int img_is_greyscale(img_pixmap *img);


/* don't use these for anything performance-critical */
extern(C) void img_setpixel(img_pixmap *img, int x, int y, void *pixel);
extern(C) void img_getpixel(img_pixmap *img, int x, int y, void *pixel);

extern(C) void img_setpixel1i(img_pixmap *img, int x, int y, int pix);
extern(C) void img_setpixel1f(img_pixmap *img, int x, int y, float pix);
extern(C) void img_setpixel4i(
  img_pixmap *img, int x, int y, int r, int g, int b, int a
);
extern(C) void img_setpixel4f(
  img_pixmap *img, int x, int y, float r, float g, float b, float a
);

extern(C) void img_getpixel1i(img_pixmap *img, int x, int y, int *pix);
extern(C) void img_getpixel1f(img_pixmap *img, int x, int y, float *pix);
extern(C) void img_getpixel4i(
  img_pixmap *img, int x, int y, int *r, int *g, int *b, int *a
);
extern(C) void img_getpixel4f(
  img_pixmap *img, int x, int y, float *r, float *g, float *b, float *a
);


/* OpenGL helper functions */

/* Returns the equivalent OpenGL "format" as expected by the 7th argument of
 * glTexImage2D */
extern(C) uint32_t img_fmt_glfmt(img_fmt fmt);
/* Returns the equivalent OpenGL "type" as expected by the 8th argument of
 * glTexImage2D */
extern(C) uint32_t img_fmt_gltype(img_fmt fmt);
/* Returns the equivalent OpenGL "internal format" as expected by the 3rd
 * argument of glTexImage2D */
extern(C) uint32_t img_fmt_glintfmt(img_fmt fmt);

/* Same as above, based on the pixel format of the supplied image */
extern(C) uint32_t img_glfmt(img_pixmap *img);
extern(C) uint32_t img_gltype(img_pixmap *img);
extern(C) uint32_t img_glintfmt(img_pixmap *img);

/* Creates an OpenGL texture from the image, and returns the texture id, or 0
 * for failure */
extern(C) uint32_t img_gltexture(img_pixmap *img);

/* Load an image and create an OpenGL texture out of it */
extern(C) uint32_t img_gltexture_load(const char *fname);
extern(C) uint32_t img_gltexture_read_file(FILE *fp);
extern(C) uint32_t img_gltexture_read(img_io *io);

/* These functions can be used to fill an img_io struct before it's passed to
 * one of the user-defined i/o image reading/writing functions
 * (img_read/img_write).
 *
 * User-defined i/o functions:
 *
 * - size_t read_func(void *buffer, size_t bytes, void *user_ptr)
 * Must try to fill the buffer with the specified number of bytes, and return
 * the number of bytes actually read.
 *
 * - size_t write_func(void *buffer, size_t bytes, void *user_ptr)
 * Must write the specified number of bytes from the supplied buffer and return
 * the number of bytes actually written.
 *
 * - long seek_func(long offset, int whence, void *user_ptr)
 * Must seek offset bytes from: the beginning of the file if whence is SEEK_SET,
 * the current position if whence is SEEK_CUR, or the end of the file if whence
 * is SEEK_END, and return the resulting file offset from the beginning of the
 * file.  (i.e. seek_func(0, SEEK_CUR, user_ptr); must be equivalent to an
 * ftell).
 *
 * All three functions get the user-data pointer set through
 * img_io_set_user_data as their last argument.
 *
 * Note: obviously you don't need to set a write function if you're only going
 * to call img_read, or the read and seek function if you're only going to call
 * img_write.
 *
 * Note: if the user-supplied write function is buffered, make sure to flush
 * (or close the file) after img_write returns.
 */
extern(C) void img_io_set_user_data(img_io *io, void *uptr);
extern(C) void img_io_set_read_func(
  img_io *io, size_t function (void*, size_t, void*) read
);
extern(C) void img_io_set_write_func(
  img_io *io, size_t function(void*, size_t, void*) write
);
extern(C) void img_io_set_seek_func(
  img_io *io, long function(long, int, void*) seek
);
extern(C) int img_register_module(ftype_module *mod);
extern(C) ftype_module *img_find_format_module(img_io *io);
extern(C) ftype_module *img_guess_format(const char *fname);
extern(C) ftype_module *img_get_module(int idx);
extern(C) int check_file(img_io *io);
extern(C) int read_file(img_pixmap *img, img_io *io);
extern(C) int write_file(img_pixmap *img, img_io *io);
extern(C) void read_func(png_struct *png, ubyte *data, size_t len);
extern(C) void write_func(png_struct *png, ubyte *data, size_t len);
extern(C) void flush_func(png_struct *png);
extern(C) int png_type_to_fmt(int color_type, int channel_bits);
extern(C) int fmt_to_png_type(img_fmt fmt);
extern(C) int img_register_png();
extern(C) int check_file(img_io *io);
extern(C) int read_file(img_pixmap *img, img_io *io);
extern(C) int write_file(img_pixmap *img, img_io *io);
extern(C) void read_func(png_struct *png, ubyte *data, size_t len);
extern(C) void write_func(png_struct *png, ubyte *data, size_t len);
extern(C) void flush_func(png_struct *png);
extern(C) int png_type_to_fmt(int color_type, int channel_bits);
extern(C) int fmt_to_png_type(img_fmt fmt);
