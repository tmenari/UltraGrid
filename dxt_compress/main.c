/* 
 * Copyright (c) 2011, Martin Srom
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#include "dxt_encoder.h"
#include "dxt_decoder.h"
#include "dxt_display.h"

#include <getopt.h>
#include <string.h>
#include <strings.h>

int
perform_encode(const char* filename_in, const char* filename_out, enum dxt_type type, int width, int height, int display)
{    
    DXT_IMAGE_TYPE* image = NULL;
    if ( dxt_image_load_from_file(filename_in, width, height, &image) != 0 ) {
        fprintf(stderr, "Failed to load image [%s]!\n", filename_in);
        return -1;
    }
    
    if ( display == 1 )
        dxt_display_image("Encode Before", image, width, height);
    
    struct dxt_encoder* encoder = dxt_encoder_create(type, width, height);
    if ( encoder == NULL ) {
        fprintf(stderr, "Create DXT encoder failed!\n");
        return -1;
    }
    
    TIMER_INIT();
    TIMER_START();
    
    unsigned char* image_compressed = NULL;
    int image_compressed_size = 0;    
    if ( dxt_encoder_compress(encoder, image, &image_compressed, &image_compressed_size) != 0 ) {
        fprintf(stderr, "DXT encoder compressing failed!\n");
        return -1;
    }
    
    TIMER_STOP_PRINT("Encoding Duration: ");
    
    if ( display == 1 )
        dxt_display_image_compressed("Encode After", image_compressed, image_compressed_size, type, width, height);
    
    if ( dxt_image_compressed_save_to_file(filename_out, image_compressed, image_compressed_size) != 0 ) {
        fprintf(stderr, "Failed to save compressed image [%s]!\n", filename_out);
        return -1;
    }
    
    dxt_encoder_destroy(encoder);
    dxt_image_compressed_destroy(image_compressed);
    dxt_image_destroy(image);
    
    return 0;
}

int
perform_decode(const char* filename_in, const char* filename_out, enum dxt_type type, int width, int height, int display)
{    
    unsigned char* image_compressed = NULL;
    int image_compressed_size = 0;
    if ( dxt_image_compressed_load_from_file(filename_in, &image_compressed, &image_compressed_size) != 0 ) {
        fprintf(stderr, "Failed to load compressed image [%s]!\n", filename_in);
        return -1;
    }
    
    if ( display == 1 )
        dxt_display_image_compressed("Decode Before", image_compressed, image_compressed_size, type, width, height);
    
    struct dxt_decoder* decoder = dxt_decoder_create(type, width, height);
    if ( decoder == NULL ) {
        fprintf(stderr, "Create DXT decoder failed!\n");
        return -1;
    }
    
    TIMER_INIT();
    TIMER_START();
        
    DXT_IMAGE_TYPE* image = NULL;
    if ( dxt_decoder_decompress(decoder, image_compressed, image_compressed_size, &image) != 0 ) {
        fprintf(stderr, "DXT decoder decompressing failed!\n");
        return -1;
    }
    
    TIMER_STOP_PRINT("Decoding Duration: ");
    
    if ( display == 1 )
        dxt_display_image("Decode After", image, width, height);
    
    if ( dxt_image_save_to_file(filename_out, image, width, height) != 0 ) {
        fprintf(stderr, "Failed to save image [%s]!\n", filename_out);
        return -1;
    }
    
    dxt_image_compressed_destroy(image_compressed);
    dxt_image_destroy(image);
    dxt_decoder_destroy(decoder);
    
    return 0;
}

const char*
get_filename_extension(const char* filename)
{
    char * ext = strrchr(filename, '.');
    if ( ext == NULL )
        return NULL;
    ext++;
    return ext;
}

int
perform_display(const char* filename, enum dxt_type type, int width, int height)
{
    // Get file extension
    const char * ext = get_filename_extension(filename);
    
    // Display image in RGB format
    if ( strncasecmp(ext, "rgb", 3) == 0 ) {
        DXT_IMAGE_TYPE* image = NULL;
        if ( dxt_image_load_from_file(filename, width, height, &image) != 0 ) {
            fprintf(stderr, "Failed to load image [%s]!\n", filename);
            return -1;
        }
        dxt_display_image("Display RGB Image", image, width, height);
        dxt_image_destroy(image);
    }
    // Display image in DXT buffer format
    else {
        unsigned char* image_compressed = NULL;
        int image_compressed_size = 0;
        if ( dxt_image_compressed_load_from_file(filename, &image_compressed, &image_compressed_size) != 0 ) {
            fprintf(stderr, "Failed to load compressed image [%s]!\n", filename);
            return -1;
        }
        dxt_display_image_compressed("Display DXT Compressed Image", image_compressed, image_compressed_size, type, width, height);
        dxt_image_compressed_destroy(image_compressed);
    }
}

int
perform_comparison(const char* input, const char* output, enum dxt_type type, int width, int height)
{
    // Get file extensions
    const char * input_ext = get_filename_extension(input);
    const char * output_ext = get_filename_extension(output);
    
    // Set proper filenames
    const char * filename_image = NULL;
    const char * filename_image_compressed = NULL;
    if ( strncasecmp(input_ext, "rgb", 3) == 0 )
        filename_image = input;
    else
        filename_image_compressed = input;
    if ( strncasecmp(output_ext, "rgb", 3) == 0 )
        filename_image = output;
    else
        filename_image_compressed = output;
        
    if ( filename_image == NULL || filename_image_compressed == NULL ) {
        fprintf(stderr, "Display comparison can't be performed, one file must be RGB image and one compressed image!\n");
        return -1;
    }
    
    // Load images
    DXT_IMAGE_TYPE* image = NULL;
    unsigned char* image_compressed = NULL;
    int image_compressed_size = 0;
    if ( dxt_image_load_from_file(filename_image, width, height, &image) != 0 ) {
        fprintf(stderr, "Failed to load image [%s]!\n", filename_image);
        return -1;
    }
    if ( dxt_image_compressed_load_from_file(filename_image_compressed, &image_compressed, &image_compressed_size) != 0 ) {
        fprintf(stderr, "Failed to load compressed image [%s]!\n", filename_image_compressed);
        return -1;
    }
    
    dxt_display_image_comparison(image, image_compressed, image_compressed_size, type, width, height);
    dxt_image_destroy(image);
    dxt_image_compressed_destroy(image_compressed);
    
    return 0;
}

void
print_help() 
{
    printf(
        "dxt_compress [options]\n"
        "   -h, --help\t\tprint help\n"
        "   -e, --encode\t\tencode image from RGB format to DXT data buffer\n"
        "   -d, --decode\t\tdecode image from DXT data buffer to RGB format\n"
        "   -s, --size\t\timage size in pixels, e.g. 1920x1080\n"
        "   -i, --input\t\tinput image in RGB format\n"
        "   -o, --output\t\toutput image in RGB format\n"
        "       --display\tdisplay image or compare images\n"
        "   -t, --type\t\tdxt type 'dxt1' or 'dxt5ycocg' (default 'dxt5ycocg')\n"
    );
}

int
main(int argc, char *argv[])
{       
    struct option longopts[] = {
        {"help",    no_argument,       0, 'h'},
        {"encode",  no_argument,       0, 'e'},
        {"decode",  no_argument,       0, 'd'},
        {"size",    required_argument, 0, 's'},
        {"input",   required_argument, 0, 'i'},
        {"output",  required_argument, 0, 'o'},
        {"display", no_argument,       0,  1 },
        {"type",    required_argument, 0, 't'},
    };

    // Parameters
    enum dxt_type type = DXT5_YCOCG;
    int width = 512;
    int height = 512;
    int encode = 0;
    int decode = 0;
    char input[255] = { '\0' };
    char output[255] = { '\0' };
    int display = 0;
    
    // Parse command line
    char ch = '\0';
    int optindex = 0;
    char* pos = 0;
    while ( (ch = getopt_long(argc, argv, "heds:i:o:t:", longopts, &optindex)) != -1 ) {
        switch (ch) {
        case 'h':
            print_help();
            return 0;
        case 'e':
            encode = 1;
            break;
        case 'd':
            decode = 1;
            break;
        case 's':
            width = atoi(optarg);
            pos = strstr(optarg, "x");
            if ( pos == NULL || width == 0 || (strlen(pos) >= strlen(optarg)) ) {
                print_help();
                return -1;
            }
            height = atoi(pos + 1);
            break;
        case 'i':
            strncpy(input, optarg, 255);
            break;
        case 'o':
            strncpy(output, optarg, 255);
            break;
        case 't':
            if ( strcasecmp(optarg, "dxt1") == 0 )
                type = DXT1;
            else if ( strcasecmp(optarg, "dxt5ycocg") == 0 )
                type = DXT5_YCOCG;
            break;
        case 1:
            display = 1;
            break;
        case '?':
            return -1;
        default:
            print_help();
            return -1;
        }
    }
	argc -= optind;
	argv += optind;
    
    // Input image must be presented
    if ( input[0] == '\0' ) {
        printf("Please supply input image filename!\n");
        print_help();
        return -1;
    }
    
    // Output image must be presented for encoding or decoding
    if ( output[0] == '\0' && (encode == 1 || decode == 1) ) {
        printf("Please supply output image filename!\n");
        print_help();
        return -1;
    }
    
    // Init DXT compressor
    if ( dxt_init() != 0 )
        return -1;
    
    // Perform encode
    if ( encode == 1 ) {
        if ( perform_encode(input, output, type, width, height, display) != 0 ) {
            fprintf(stderr, "Failed to encode image [%s]!\n", input);
            return -1;        
        }
    }
    
    // Setup input and output for decoding (when encoding was performed)
    if ( encode == 1 && decode == 1 ) {
        char new_output[255];
        snprintf(new_output, 255, "decoded_%s", input);
        strncpy(input, output, 255);
        strncpy(output, new_output, 255);
    }
    
    // Perform decode
    if ( decode == 1 ) {
        if ( perform_decode(input, output, type, width, height, display) != 0 ) {
            fprintf(stderr, "Failed to decode image [%s]!\n", input);
            return -1;
        }
    }
    
    // Only display image
    if ( display == 1 && encode == 0 && decode == 0 ) {
        if ( output[0] != '\0' ) {
            if ( perform_comparison(input, output, type, width, height) != 0 ) {
                fprintf(stderr, "Failed to perform comparison for images [%s, %s]!\n", input, output);
                return -1;
            }
        } else {
            if ( perform_display(input, type, width, height) != 0 ) {
                fprintf(stderr, "Failed to display image [%s]!\n", input);
                return -1;
            }
        }
    }
    
	return 0;
}
