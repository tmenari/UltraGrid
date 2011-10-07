#version 130
#extension GL_EXT_gpu_shader4 : enable
vec3 _TMP7;
vec4 _TMP5;
uniform sampler2D _image3;
uniform vec2 imageSize;
vec2 _texelSize0012;
vec2 _texcoord0012;
vec3 _col0012[16];
vec2 _c0014;
vec3 _mincol0015;
vec3 _maxcol0015;
vec3 _center0020;
vec3 _mincol0020;
vec3 _maxcol0020;
vec2 _cov0020;
vec3 _t10020;
vec3 _inset0021;
vec3 _x0023;
vec3 _TMP24;
vec3 _x0031;
vec3 _TMP32;
int _TMP38;
vec3 _maxcol0039;
vec3 _mincol0039;
vec3 _tmp10039;
bool _TMP40;
ivec3 _c0042;
int _w0042;
vec3 _TMP43;
vec3 _a0044;
vec3 _x0046;
ivec3 _c0048;
int _w0048;
vec3 _TMP49;
vec3 _a0050;
vec3 _x0052;
vec3 _c0054[4];
int _indices0054;
ivec4 _b10054;
int _b410054;
int _index10054;
float _TMP59;
vec3 _a0062;
vec3 _b0062;
float _TMP63;
vec3 _a0066;
vec3 _b0066;
float _TMP67;
vec3 _a0070;
vec3 _b0070;
float _TMP71;
vec3 _a0074;
vec3 _b0074;
in vec4 TEX0;
out ivec4 _colorInt;
void main()
{
    ivec4 _output1;
    _texelSize0012 = 1.00000000E+00/imageSize;
    _texcoord0012 = TEX0.xy - _texelSize0012*2.00000000E+00;
    _TMP5 = texture(_image3, _texcoord0012);
    _col0012[0] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 1.00000000E+00, 0.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[1] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 2.00000000E+00, 0.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[2] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 3.00000000E+00, 0.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[3] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 0.00000000E+00, 1.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[4] = _TMP5.xyz;
    _c0014 = _texcoord0012 + _texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[5] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 2.00000000E+00, 1.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[6] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 3.00000000E+00, 1.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[7] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 0.00000000E+00, 2.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[8] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 1.00000000E+00, 2.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[9] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 2.00000000E+00, 2.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[10] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 3.00000000E+00, 2.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[11] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 0.00000000E+00, 3.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[12] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 1.00000000E+00, 3.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[13] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 2.00000000E+00, 3.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _col0012[14] = _TMP5.xyz;
    _c0014 = _texcoord0012 + vec2( 3.00000000E+00, 3.00000000E+00)*_texelSize0012;
    _TMP5 = texture(_image3, _c0014);
    _mincol0015 = min(_col0012[0], _col0012[1]);
    _maxcol0015 = max(_col0012[0], _col0012[1]);
    _mincol0015 = min(_mincol0015, _col0012[2]);
    _maxcol0015 = max(_maxcol0015, _col0012[2]);
    _mincol0015 = min(_mincol0015, _col0012[3]);
    _maxcol0015 = max(_maxcol0015, _col0012[3]);
    _mincol0015 = min(_mincol0015, _col0012[4]);
    _maxcol0015 = max(_maxcol0015, _col0012[4]);
    _mincol0015 = min(_mincol0015, _col0012[5]);
    _maxcol0015 = max(_maxcol0015, _col0012[5]);
    _mincol0015 = min(_mincol0015, _col0012[6]);
    _maxcol0015 = max(_maxcol0015, _col0012[6]);
    _mincol0015 = min(_mincol0015, _col0012[7]);
    _maxcol0015 = max(_maxcol0015, _col0012[7]);
    _mincol0015 = min(_mincol0015, _col0012[8]);
    _maxcol0015 = max(_maxcol0015, _col0012[8]);
    _mincol0015 = min(_mincol0015, _col0012[9]);
    _maxcol0015 = max(_maxcol0015, _col0012[9]);
    _mincol0015 = min(_mincol0015, _col0012[10]);
    _maxcol0015 = max(_maxcol0015, _col0012[10]);
    _mincol0015 = min(_mincol0015, _col0012[11]);
    _maxcol0015 = max(_maxcol0015, _col0012[11]);
    _mincol0015 = min(_mincol0015, _col0012[12]);
    _maxcol0015 = max(_maxcol0015, _col0012[12]);
    _mincol0015 = min(_mincol0015, _col0012[13]);
    _maxcol0015 = max(_maxcol0015, _col0012[13]);
    _mincol0015 = min(_mincol0015, _col0012[14]);
    _maxcol0015 = max(_maxcol0015, _col0012[14]);
    _mincol0015 = min(_mincol0015, _TMP5.xyz);
    _maxcol0015 = max(_maxcol0015, _TMP5.xyz);
    _mincol0020 = _mincol0015;
    _maxcol0020 = _maxcol0015;
    _center0020 = (_mincol0015 + _maxcol0015)*5.00000000E-01;
    _t10020 = _col0012[0] - _center0020;
    _cov0020.x = _t10020.x*_t10020.z;
    _cov0020.y = _t10020.y*_t10020.z;
    _t10020 = _col0012[1] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[2] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[3] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[4] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[5] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[6] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[7] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[8] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[9] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[10] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[11] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[12] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[13] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _col0012[14] - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    _t10020 = _TMP5.xyz - _center0020;
    _cov0020.x = _cov0020.x + _t10020.x*_t10020.z;
    _cov0020.y = _cov0020.y + _t10020.y*_t10020.z;
    if (_cov0020.x < 0.00000000E+00) { // if begin
        _maxcol0020.x = _mincol0015.x;
        _mincol0020.x = _maxcol0015.x;
    } // end if
    if (_cov0020.y < 0.00000000E+00) { // if begin
        _maxcol0020.y = _mincol0015.y;
        _mincol0020.y = _maxcol0015.y;
    } // end if
    _inset0021 = (_maxcol0020 - _mincol0020)/1.60000000E+01 - 1.96078443E-03;
    _x0023 = _mincol0020 + _inset0021;
    _TMP7 = min(vec3( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00), _x0023);
    _TMP24 = max(vec3( 0.00000000E+00, 0.00000000E+00, 0.00000000E+00), _TMP7);
    _x0031 = _maxcol0020 - _inset0021;
    _TMP7 = min(vec3( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00), _x0031);
    _TMP32 = max(vec3( 0.00000000E+00, 0.00000000E+00, 0.00000000E+00), _TMP7);
    _TMP40 = true;
    _a0044 = _TMP32*vec3( 3.10000000E+01, 6.30000000E+01, 3.10000000E+01);
    _x0046 = _a0044 + 5.00000000E-01;
    _TMP43 = floor(_x0046);
    _c0042 = ivec3(int(_TMP43.x), int(_TMP43.y), int(_TMP43.z));
    _w0042 = int(((_c0042.x << 11) | (_c0042.y << 5) | _c0042.z));
    _c0042.xz = (_c0042.xz << 3) | (_c0042.xz >> 2);
    _c0042.y = (_c0042.y << 2) | (_c0042.y >> 4);
    _maxcol0039 = vec3(float(_c0042.x), float(_c0042.y), float(_c0042.z))*3.92156886E-03;
    _a0050 = _TMP24*vec3( 3.10000000E+01, 6.30000000E+01, 3.10000000E+01);
    _x0052 = _a0050 + 5.00000000E-01;
    _TMP49 = floor(_x0052);
    _c0048 = ivec3(int(_TMP49.x), int(_TMP49.y), int(_TMP49.z));
    _w0048 = int(((_c0048.x << 11) | (_c0048.y << 5) | _c0048.z));
    _c0048.xz = (_c0048.xz << 3) | (_c0048.xz >> 2);
    _c0048.y = (_c0048.y << 2) | (_c0048.y >> 4);
    _mincol0039 = vec3(float(_c0048.x), float(_c0048.y), float(_c0048.z))*3.92156886E-03;
    if (_w0042 < _w0048) { // if begin
        _tmp10039 = _mincol0039;
        _mincol0039 = _maxcol0039;
        _maxcol0039 = _tmp10039;
        _TMP38 = _w0048 | (_w0042 << 16);
        _TMP40 = false;
    } // end if
    if (_TMP40) { // if begin
        _TMP38 = _w0042 | (_w0048 << 16);
    } // end if
    _output1.x = _TMP38;
    _c0054[2] = _maxcol0039 + 3.33333343E-01*(_mincol0039 - _maxcol0039);
    _c0054[3] = _maxcol0039 + 6.66666687E-01*(_mincol0039 - _maxcol0039);
    _a0062 = _col0012[0] - _maxcol0039;
    _b0062 = _col0012[0] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[0] - _mincol0039;
    _b0066 = _col0012[0] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[0] - _c0054[2];
    _b0070 = _col0012[0] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[0] - _c0054[3];
    _b0074 = _col0012[0] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _index10054;
    _a0062 = _col0012[1] - _maxcol0039;
    _b0062 = _col0012[1] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[1] - _mincol0039;
    _b0066 = _col0012[1] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[1] - _c0054[2];
    _b0070 = _col0012[1] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[1] - _c0054[3];
    _b0074 = _col0012[1] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 2);
    _a0062 = _col0012[2] - _maxcol0039;
    _b0062 = _col0012[2] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[2] - _mincol0039;
    _b0066 = _col0012[2] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[2] - _c0054[2];
    _b0070 = _col0012[2] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[2] - _c0054[3];
    _b0074 = _col0012[2] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 4);
    _a0062 = _col0012[3] - _maxcol0039;
    _b0062 = _col0012[3] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[3] - _mincol0039;
    _b0066 = _col0012[3] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[3] - _c0054[2];
    _b0070 = _col0012[3] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[3] - _c0054[3];
    _b0074 = _col0012[3] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 6);
    _a0062 = _col0012[4] - _maxcol0039;
    _b0062 = _col0012[4] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[4] - _mincol0039;
    _b0066 = _col0012[4] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[4] - _c0054[2];
    _b0070 = _col0012[4] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[4] - _c0054[3];
    _b0074 = _col0012[4] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 8);
    _a0062 = _col0012[5] - _maxcol0039;
    _b0062 = _col0012[5] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[5] - _mincol0039;
    _b0066 = _col0012[5] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[5] - _c0054[2];
    _b0070 = _col0012[5] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[5] - _c0054[3];
    _b0074 = _col0012[5] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 10);
    _a0062 = _col0012[6] - _maxcol0039;
    _b0062 = _col0012[6] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[6] - _mincol0039;
    _b0066 = _col0012[6] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[6] - _c0054[2];
    _b0070 = _col0012[6] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[6] - _c0054[3];
    _b0074 = _col0012[6] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 12);
    _a0062 = _col0012[7] - _maxcol0039;
    _b0062 = _col0012[7] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[7] - _mincol0039;
    _b0066 = _col0012[7] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[7] - _c0054[2];
    _b0070 = _col0012[7] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[7] - _c0054[3];
    _b0074 = _col0012[7] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 14);
    _a0062 = _col0012[8] - _maxcol0039;
    _b0062 = _col0012[8] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[8] - _mincol0039;
    _b0066 = _col0012[8] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[8] - _c0054[2];
    _b0070 = _col0012[8] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[8] - _c0054[3];
    _b0074 = _col0012[8] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 16);
    _a0062 = _col0012[9] - _maxcol0039;
    _b0062 = _col0012[9] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[9] - _mincol0039;
    _b0066 = _col0012[9] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[9] - _c0054[2];
    _b0070 = _col0012[9] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[9] - _c0054[3];
    _b0074 = _col0012[9] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 18);
    _a0062 = _col0012[10] - _maxcol0039;
    _b0062 = _col0012[10] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[10] - _mincol0039;
    _b0066 = _col0012[10] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[10] - _c0054[2];
    _b0070 = _col0012[10] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[10] - _c0054[3];
    _b0074 = _col0012[10] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 20);
    _a0062 = _col0012[11] - _maxcol0039;
    _b0062 = _col0012[11] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[11] - _mincol0039;
    _b0066 = _col0012[11] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[11] - _c0054[2];
    _b0070 = _col0012[11] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[11] - _c0054[3];
    _b0074 = _col0012[11] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 22);
    _a0062 = _col0012[12] - _maxcol0039;
    _b0062 = _col0012[12] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[12] - _mincol0039;
    _b0066 = _col0012[12] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[12] - _c0054[2];
    _b0070 = _col0012[12] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[12] - _c0054[3];
    _b0074 = _col0012[12] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 24);
    _a0062 = _col0012[13] - _maxcol0039;
    _b0062 = _col0012[13] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[13] - _mincol0039;
    _b0066 = _col0012[13] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[13] - _c0054[2];
    _b0070 = _col0012[13] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[13] - _c0054[3];
    _b0074 = _col0012[13] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 26);
    _a0062 = _col0012[14] - _maxcol0039;
    _b0062 = _col0012[14] - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _col0012[14] - _mincol0039;
    _b0066 = _col0012[14] - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _col0012[14] - _c0054[2];
    _b0070 = _col0012[14] - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _col0012[14] - _c0054[3];
    _b0074 = _col0012[14] - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 28);
    _a0062 = _TMP5.xyz - _maxcol0039;
    _b0062 = _TMP5.xyz - _maxcol0039;
    _TMP59 = dot(_a0062, _b0062);
    _a0066 = _TMP5.xyz - _mincol0039;
    _b0066 = _TMP5.xyz - _mincol0039;
    _TMP63 = dot(_a0066, _b0066);
    _a0070 = _TMP5.xyz - _c0054[2];
    _b0070 = _TMP5.xyz - _c0054[2];
    _TMP67 = dot(_a0070, _b0070);
    _a0074 = _TMP5.xyz - _c0054[3];
    _b0074 = _TMP5.xyz - _c0054[3];
    _TMP71 = dot(_a0074, _b0074);
    _b10054 = ivec4(int((_TMP59 > _TMP71)), int((_TMP63 > _TMP67)), int((_TMP59 > _TMP67)), int((_TMP63 > _TMP71)));
    _b410054 = int((_TMP67 > _TMP71));
    _index10054 = (_b10054.x & _b410054) | (((_b10054.y & _b10054.z) | (_b10054.x & _b10054.w)) << 1);
    _indices0054 = _indices0054 | (_index10054 << 30);
    _output1.w = _indices0054;
    _colorInt = _output1;
} // main end
