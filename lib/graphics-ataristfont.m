#import "HOTDOG.h"

@implementation Definitions(fjdklsjfkldsjfsdifjikdiikjf)
+ (int *)arrayOfXSpacingsForAtariSTFont
{
    static int xspacings[256];
    BOOL first = YES;
    if (first) {
        for (int i=0; i<256; i++) {
            xspacings[i] = 0;
        }
        first = NO;
    }
    return xspacings;
}
+ (int *)arrayOfWidthsForAtariSTFont
{
    static int widths[256];
    BOOL first = YES;
    if (first) {
        char **bitmaps = [Definitions arrayOfCStringsForAtariSTFont];
        [Definitions calculateWidths:widths forCStrings:bitmaps];
        first = NO;
    }
    return widths;
}
+ (int *)arrayOfHeightsForAtariSTFont
{
    static int heights[256];
    BOOL first = YES;
    if (first) {
        char **bitmaps = [Definitions arrayOfCStringsForAtariSTFont];
        [Definitions calculateHeights:heights forCStrings:bitmaps];
        first = NO;
    }
    return heights;
}
+ (char **)arrayOfCStringsForAtariSTFont
{
    static char *default_bitmap = 
"bbbbbb\n"
"b    b\n"
"b    b\n"
"b    b\n"
"b    b\n"
"b    b\n"
"b    b\n"
"b    b\n"
"b    b\n"
"b    b\n"
"b    b\n"
"b    b\n"
"bbbbbb\n"
;

    static char *bitmaps[256];
    static BOOL first = YES;
    if (first) {
    memset(bitmaps, 0, sizeof(bitmaps));
    bitmaps[32] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
;
    bitmaps[33] = 
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
;
    bitmaps[34] = 
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
;
    bitmaps[35] = 
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
"bbbbbbbb\n"
"bbbbbbbb\n"
" bb  bb \n"
" bb  bb \n"
"bbbbbbbb\n"
"bbbbbbbb\n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
"        \n"
"        \n"
;
    bitmaps[36] = 
"   bb   \n"
"   bb   \n"
"  bbbbb \n"
" bbbbbb \n"
" bb     \n"
" bb     \n"
" bbbbb  \n"
"  bbbbb \n"
"     bb \n"
"     bb \n"
" bbbbbb \n"
" bbbbb  \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
;                
    bitmaps[37] = 
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb bb  \n"
"    bb  \n"
"   bb   \n"
"   bb   \n"
"  bb    \n"
"  bb bb \n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
"        \n"
"        \n"
;                
    bitmaps[38] = 
"  bbb   \n"
" bbbbb  \n"
" bb bb  \n"
" bb bb  \n"
"  bbb   \n"
"  bbb   \n"
" bbb    \n"
" bbb    \n"
"bb bbbb \n"
"bb bbbb \n"
"bb  bb  \n"
"bb  bb  \n"
"bbbbbbb \n"
" bbb bb \n"
"        \n"
"        \n"
;
    bitmaps[39] = 
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
;
    bitmaps[40] = 
"        \n"
"        \n"
"     bb \n"
"    bb  \n"
"   bbb  \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bbb  \n"
"    bb  \n"
"     bb \n"
"        \n"
"        \n"
;
    bitmaps[41] = 
"        \n"
"        \n"
" bb     \n"
"  bb    \n"
"  bbb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"  bbb   \n"
"  bb    \n"
" bb     \n"
"        \n"
"        \n"
;
    bitmaps[42] = 
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
"  bbbb  \n"
"  bbbb  \n"
"bbbbbbbb\n"
"bbbbbbbb\n"
"  bbbb  \n"
"  bbbb  \n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
"        \n"
"        \n"
;
    bitmaps[43] = 
"        \n"
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
" bbbbbb \n"
" bbbbbb \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
;
    bitmaps[44] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"  bb    \n"
"  b     \n"
;
    bitmaps[45] = 
//FIXME
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
;
    bitmaps[46] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
;                
    bitmaps[47] = 
"        \n"
"        \n"
"     bb \n"
"     bb \n"
"     bb \n"
"    bb  \n"
"    bb  \n"
"   bb   \n"
"   bb   \n"
"  bb    \n"
"  bb    \n"
" bb     \n"
" bb     \n"
" bb     \n"
"        \n"
"        \n"
;                
                    bitmaps[48] = 
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb bbb \n"
" bbb bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[49] = 
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"  bbb   \n"
"  bbb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
" bbbbbb \n"
" bbbbbb \n"
"        \n"
"        \n"
;
    bitmaps[50] = 
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
"    bb  \n"
"    bb  \n"
"   bb   \n"
"   bb   \n"
"  bb    \n"
"  bb    \n"
" bbbbbb \n"
" bbbbbb \n"
"        \n"
"        \n"
;
    bitmaps[51] = 
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
"    bb  \n"
"    bb  \n"
"   bb   \n"
"   bb   \n"
"    bb  \n"
"    bb  \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[52] = 
"        \n"
"        \n"
"    bb  \n"
"    bb  \n"
"   bbb  \n"
"   bbb  \n"
"  bbbb  \n"
"  bbbb  \n"
" bb bb  \n"
" bb bb  \n"
" bbbbbb \n"
" bbbbbb \n"
"    bb  \n"
"    bb  \n"
"        \n"
"        \n"
;
    bitmaps[53] = 
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
" bb     \n"
" bb     \n"
" bbbbb  \n"
" bbbbbb \n"
"     bb \n"
"     bb \n"
"     bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[54] = 
"        \n"
"        \n"
"   bbb  \n"
"  bbbb  \n"
" bbb    \n"
" bb     \n"
" bb     \n"
" bbbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[55] = 
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
"     bb \n"
"     bb \n"
"    bb  \n"
"    bb  \n"
"   bb   \n"
"   bb   \n"
"  bb    \n"
"  bb    \n"
"  bb    \n"
"  bb    \n"
"        \n"
"        \n"
;
    bitmaps[56] = 
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
"  bbbb  \n"
"  bbbb  \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[57] = 
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbbb \n"
"     bb \n"
"     bb \n"
"     bb \n"
"    bbb \n"
"  bbbb  \n"
"  bbb   \n"
"        \n"
"        \n"
;
    bitmaps[58] = 
"        \n"
"        \n"
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
;                
    bitmaps[59] = 
"        \n"
"        \n"
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"  bb    \n"
"  b     \n"
;                
    bitmaps[60] = 
"        \n"
"        \n"
"        \n"
"    bbb \n"
"   bbb  \n"
"  bbb   \n"
" bbb    \n"
"bbb     \n"
" bbb    \n"
"  bbb   \n"
"   bbb  \n"
"    bbb \n"
"        \n"
"        \n"
"        \n"
"        \n"
;                
    bitmaps[61] = 
"        \n"
"        \n"
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
;                
    bitmaps[62] = 
"        \n"
"        \n"
"        \n"
"bbb     \n"
" bbb    \n"
"  bbb   \n"
"   bbb  \n"
"    bbb \n"
"   bbb  \n"
"  bbb   \n"
" bbb    \n"
"bbb     \n"
"        \n"
"        \n"
"        \n"
"        \n"
;
    bitmaps[63] = 
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
"    bb  \n"
"    bb  \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
;                
    bitmaps[64] = 
"        \n"
"        \n"
"  bbb   \n"
" bbbbb  \n"
"bbb  bb \n"
"bb    b \n"
"bb bb b \n"
"bb b bb \n"
"bb b bb \n"
"bb bbb  \n"
"bb      \n"
"bbb   b \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[65] = 
"        \n"
"        \n"
"   bb   \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
;
    bitmaps[66] = 
"        \n"
"        \n"
" bbbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
" bbbbb  \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
" bbbbb  \n"
"        \n"
"        \n"
;
    bitmaps[67] = 
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[68] = 
"        \n"
"        \n"
" bbbb   \n"
" bbbbb  \n"
" bb bbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb bbb \n"
" bbbbb  \n"
" bbbb   \n"
"        \n"
"        \n"
;
    bitmaps[69] = 
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
" bb     \n"
" bb     \n"
" bbbbb  \n"
" bbbbb  \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bbbbbb \n"
" bbbbbb \n"
"        \n"
"        \n"
;
    bitmaps[70] = 
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
" bb     \n"
" bb     \n"
" bbbbb  \n"
" bbbbb  \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
"        \n"
"        \n"
;
    bitmaps[71] = 
"        \n"
"        \n"
"  bbbbb \n"
" bbbbbb \n"
" bb     \n"
" bb     \n"
" bb bbb \n"
" bb bbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[72] = 
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
;
    bitmaps[73] = 
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
" bbbbbb \n"
" bbbbbb \n"
"        \n"
"        \n"
;
    bitmaps[74] = 
"        \n"
"        \n"
"     bb \n"
"     bb \n"
"     bb \n"
"     bb \n"
"     bb \n"
"     bb \n"
"     bb \n"
"     bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[75] = 
"        \n"
"        \n"
"bb  bb  \n"
"bb  bb  \n"
"bb bb   \n"
"bb bb   \n"
"bbbb    \n"
"bbbb    \n"
"bb bb   \n"
"bb bb   \n"
"bb  bb  \n"
"bb  bb  \n"
"bb   bb \n"
"bb   bb \n"
"        \n"
"        \n"
;
    bitmaps[76] = 
"        \n"
"        \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bbbbbb \n"
" bbbbbb \n"
"        \n"
"        \n"
;
    bitmaps[77] = 
"        \n"
"        \n"
"bb   bb \n"
"bb   bb \n"
"bbb bbb \n"
"bbb bbb \n"
"bbbbbbb \n"
"bb b bb \n"
"bb b bb \n"
"bb   bb \n"
"bb   bb \n"
"bb   bb \n"
"bb   bb \n"
"bb   bb \n"
"        \n"
"        \n"
;
    bitmaps[78] = 
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbb bb \n"
" bbb bb \n"
" bbbbbb \n"
" bbbbbb \n"
" bb bbb \n"
" bb bbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
;
    bitmaps[79] = 
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[80] = 
"        \n"
"        \n"
" bbbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
" bbbbb  \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
"        \n"
"        \n"
;
    bitmaps[81] = 
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb b b \n"
" bbbbb  \n"
"  bb bb \n"
"        \n"
"        \n"
;
    bitmaps[82] = 
"        \n"
"        \n"
"bbbbb   \n"
"bbbbbb  \n"
"bb  bb  \n"
"bb  bb  \n"
"bb  bb  \n"
"bbbbbb  \n"
"bbbbb   \n"
"bb bb   \n"
"bb  bb  \n"
"bb  bb  \n"
"bb   bb \n"
"bb   bb \n"
"        \n"
"        \n"
;
    bitmaps[83] = 
"        \n"
"        \n"
"  bbbbb \n"
" bbbbbb \n"
" bb     \n"
" bb     \n"
" bbb    \n"
"  bbb   \n"
"   bbb  \n"
"    bbb \n"
"     bb \n"
"     bb \n"
" bbbbbb \n"
" bbbbb  \n"
"        \n"
"        \n"
;
    bitmaps[84] = 
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
;
    bitmaps[85] = 
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[86] = 
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"  bbbb  \n"
"  bbbb  \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
;
    bitmaps[87] = 
"        \n"
"        \n"
"bb   bb \n"
"bb   bb \n"
"bb   bb \n"
"bb   bb \n"
"bb   bb \n"
"bb b bb \n"
"bb b bb \n"
"bbbbbbb \n"
"bbbbbbb \n"
"bbb bbb \n"
"bb   bb \n"
"b     b \n"
"        \n"
"        \n"
;
    bitmaps[88] = 
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"  bbbb  \n"
"  bbbb  \n"
"   bb   \n"
"   bb   \n"
"  bbbb  \n"
"  bbbb  \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
;
    bitmaps[89] = 
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"  bbbb  \n"
"  bbbb  \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
;
    bitmaps[90] = 
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
"    bb  \n"
"    bb  \n"
"   bb   \n"
"   bb   \n"
"  bb    \n"
"  bb    \n"
" bb     \n"
" bb     \n"
" bbbbbb \n"
" bbbbbb \n"
"        \n"
"        \n"
;
//[    bitmaps[91] = 
    bitmaps[92] = 
"        \n"
"        \n"
" bb     \n"
" bb     \n"
" bb     \n"
"  bb    \n"
"  bb    \n"
"   bb   \n"
"   bb   \n"
"    bb  \n"
"    bb  \n"
"     bb \n"
"     bb \n"
"     bb \n"
"        \n"
"        \n"
;
//]    bitmaps[93] = 
    bitmaps[94] = 
"        \n"
"   b    \n"
"   b    \n"
"  bbb   \n"
"  bbb   \n"
" bb bb  \n"
" bb bb  \n"
"bb   bb \n"
"bb   bb \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
;
//_    bitmaps[95] = 
;
//`    bitmaps[96] = 
    bitmaps[97] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"  bbbb  \n"
"  bbbbb \n"
"     bb \n"
"  bbbbb \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbbb \n"
"        \n"
"        \n"
;
    bitmaps[98] = 
"        \n"
"        \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bbbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
" bbbbb  \n"
"        \n"
"        \n"
;
    bitmaps[99] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"  bbbb  \n"
" bbbbb  \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bbbbbb \n"
"  bbbbb \n"
"        \n"
"        \n"
;
    bitmaps[100] = 
"        \n"
"        \n"
"     bb \n"
"     bb \n"
"     bb \n"
"  bbbbb \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbbb \n"
"        \n"
"        \n"
;
    bitmaps[101] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
" bb     \n"
" bb     \n"
" bbbbbb \n"
"  bbbbb \n"
"        \n"
"        \n"
;
    bitmaps[102] = 
"        \n"
"        \n"
"    bbb \n"
"   bbbb \n"
"   bb   \n"
"   bb   \n"
" bbbbbb \n"
" bbbbbb \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
;
    bitmaps[103] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"  bbbbb \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbbb \n"
"     bb \n"
" bbbbbb \n"
" bbbbb  \n"
;                
    bitmaps[104] = 
"        \n"
"        \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bbbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
;
    bitmaps[105] = 
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
"        \n"
"  bbb   \n"
"  bbb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"  bbbb  \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[106] = 
"        \n"
"        \n"
"    bb  \n"
"    bb  \n"
"        \n"
"    bb  \n"
"    bb  \n"
"    bb  \n"
"    bb  \n"
"    bb  \n"
"    bb  \n"
"    bb  \n"
"    bb  \n"
"    bb  \n"
" bbbbb  \n"
" bbbb   \n"
;
    bitmaps[107] = 
"        \n"
"        \n"
"bb      \n"
"bb      \n"
"bb      \n"
"bb  bb  \n"
"bb bbb  \n"
"bbbbb   \n"
"bbbb    \n"
"bbbbb   \n"
"bb bb   \n"
"bb  bb  \n"
"bb  bbb \n"
"bb   bb \n"
"        \n"
"        \n"
;
    bitmaps[108] = 
"        \n"
"        \n"
"  bbb   \n"
"  bbb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"  bbbb  \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[109] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
" bb bb  \n"
"bbbbbbb \n"
"bbbbbbb \n"
"bb b bb \n"
"bb b bb \n"
"bb b bb \n"
"bb   bb \n"
"bb   bb \n"
"bb   bb \n"
"        \n"
"        \n"
;
    bitmaps[110] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
;
    bitmaps[111] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"  bbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbb  \n"
"        \n"
"        \n"
;
    bitmaps[112] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
" bbbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
" bbbbb  \n"
" bb     \n"
" bb     \n"
;
    bitmaps[113] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"  bbbbb \n"
" bbbbbb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbbb \n"
"     bb \n"
"     bb \n"
;
    bitmaps[114] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
" bbbbb  \n"
" bbbbbb \n"
" bb  bb \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
" bb     \n"
"        \n"
"        \n"
;
    bitmaps[115] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"  bbbbb \n"
" bbbbbb \n"
" bb     \n"
" bbb    \n"
"  bbbb  \n"
"    bbb \n"
"     bb \n"
" bbbbbb \n"
" bbbbb  \n"
"        \n"
"        \n"
;
    bitmaps[116] = 
"        \n"
"        \n"
"        \n"
"   bb   \n"
"   bb   \n"
" bbbbbb \n"
" bbbbbb \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bbbb \n"
"    bbb \n"
"        \n"
"        \n"
;
    bitmaps[117] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbbb \n"
"        \n"
"        \n"
;
    bitmaps[118] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
"  bbbb  \n"
"  bbbb  \n"
"   bb   \n"
"   bb   \n"
"        \n"
"        \n"
;
    bitmaps[119] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
"bb   bb \n"
"bb   bb \n"
"bb b bb \n"
"bb b bb \n"
"bbbbbbb \n"
"bbbbbbb \n"
"bbb bbb \n"
"bb   bb \n"
"b     b \n"
"        \n"
"        \n"
;
    bitmaps[120] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
"  bbbb  \n"
"  bbbb  \n"
"   bb   \n"
"  bbbb  \n"
"  bbbb  \n"
" bb  bb \n"
" bb  bb \n"
"        \n"
"        \n"
;
    bitmaps[121] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bb  bb \n"
" bbbbbb \n"
"  bbbbb \n"
"     bb \n"
" bbbbbb \n"
" bbbbb  \n"
;
    bitmaps[122] = 
"        \n"
"        \n"
"        \n"
"        \n"
"        \n"
" bbbbbb \n"
" bbbbbb \n"
"    bb  \n"
"   bb   \n"
"   bb   \n"
"  bb    \n"
"  bb    \n"
" bbbbbb \n"
" bbbbbb \n"
"        \n"
"        \n"
;
//{    bitmaps[123] = 
    bitmaps[124] = 
"        \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"   bb   \n"
"        \n"
;                
//}    bitmaps[125] = 
//~    bitmaps[126] = 
        for (int i=0; i<256; i++) {
            if (!bitmaps[i]) {
                bitmaps[i] = default_bitmap;
            }
        }
        first = NO;
    }
    return bitmaps;
}
@end

