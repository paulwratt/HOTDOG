/*

 HOT DOG Linux

 Copyright (c) 2020 Arthur Choung. All rights reserved.

 Email: arthur -at- hotdoglinux.com

 This file is part of HOT DOG Linux.

 HOT DOG Linux is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.

 */

#import "HOTDOG.h"

#include <sys/time.h>

static id computerPalette =
@"b #000000\n"
@". #333366\n"
@"X #444444\n"
@"o #6666CC\n"
@"O #BBBBBB\n"
@"+ #9999FF\n"
@"@ #cccccc\n"
@"# #CCCCFF\n"
@"$ #EEEEEE\n"
@"% #ffffff\n"
;
static id selectedComputerPalette =
@"b #000000\n"
@". #191933\n"
@"X #222222\n"
@"o #333366\n"
@"O #5d5d5d\n"
@"+ #4c4c7f\n"
@"@ #666666\n"
@"# #66667F\n"
@"$ #777777\n"
@"% #7f7f7f\n"
;
static id computerPixels =
@"        .     X    \n"
@"       b.      X   \n"
@"      bo.   X   X  \n"
@"     bo+o    X   X \n"
@"    bo+#o     X  X \n"
@"   bo+#%o  X  X  X \n"
@"bbbo+#%#o  X  X   X\n"
@".++O%%##o   X  X  X\n"
@"+%%%%##+.   X  X  X\n"
@".++o++++.   X  X  X\n"
@"booo++++.   X  X  X\n"
@"bbboo+++.  X  X   X\n"
@"   boo++.  X  X  X \n"
@"    boo+.     X  X \n"
@"     boo.    X   X \n"
@"      bob   X   X  \n"
@"       bb      X   \n"
@"        b     X    \n"
;

@implementation Definitions(hkjfkdjskfukgfdfthfnvbchjgfjysdjfkgikghjghfjgfjdksfjksfjdsklfjksddjsfkldj)
+ (id)MacColorAudioDevices
{
    id observercmd = nsarr();
    [observercmd addObject:@"hotdog-monitorAudioDevices.pl"];
    id observer = [observercmd runCommandAndReturnProcess];
    if (!observer) {
NSLog(@"unable to run observer command %@", observercmd);
exit(1);
    }

    id obj = [@"MacColorAudioDevices" asInstance];
    [obj setValue:observer forKey:@"observer"];
    return obj;
}
@end

@interface MacColorAudioDevices : IvarObject
{
    time_t _timestamp;
    id _array;
    id _buttonDown;
    int _buttonDownOffsetX;
    int _buttonDownOffsetY;
    id _buttonDownTimestamp;
    id _selected;
    id _observer;
}
@end
@implementation MacColorAudioDevices
- (int)fileDescriptor
{
    if (_observer) {
        return [_observer fileDescriptor];
    }
    return -1;
}
- (void)handleFileDescriptor
{
    if (_observer) {
        [_observer handleFileDescriptor];
        id data = [_observer valueForKey:@"data"];
        id lastLine = nil;
        for(;;) {
            id line = [data readLine];
//NSLog(@"line '%@'", line);
            if (!line) {
                break;
            }
            lastLine = line;
        }
        if (lastLine) {
            _timestamp = 0;
        }
        return;
    }
}
- (int)preferredWidth
{
    return 600;
}
- (int)preferredHeight
{
    return 360;
}
- (void)updateArray:(Int4)r
{
    id cmd = nsarr();
    [cmd addObject:@"hotdog-listAudioDevices.pl"];
    id lines = [[[cmd runCommandAndReturnOutput] asString] split:@"\n"];
    int x = 100;
    int y = 5;
    int w = [Definitions widthForCString:[computerPixels UTF8String]];
    int h = [Definitions heightForCString:[computerPixels UTF8String]];
    id results = nsarr();
    for (int i=0; i<[lines count]; i++) {
        id line = [lines nth:i];
        id name = [line valueForKey:@"name"];
        id displayName = [line valueForKey:@"displayName"];
        if (![name length] && ![displayName length]) {
            continue;
        }
        id dict = nsdict();
        [dict setValue:name forKey:@"name"];
        [dict setValue:displayName forKey:@"displayName"];
        [dict setValue:nsfmt(@"%d", x) forKey:@"x"];
        [dict setValue:nsfmt(@"%d", y) forKey:@"y"];
        [dict setValue:nsfmt(@"%d", w) forKey:@"w"];
        [dict setValue:nsfmt(@"%d", h) forKey:@"h"];
        [dict setValue:computerPalette forKey:@"palette"];
        [dict setValue:selectedComputerPalette forKey:@"selectedPalette"];
        [dict setValue:computerPixels forKey:@"pixels"];
        [results addObject:dict];
        y += h + 30;
        if (y > r.h-5-30) {
            y = 5;
            x += 120;
        }
    }
    [self setValue:results forKey:@"array"];
}

- (void)beginIteration:(id)event rect:(Int4)r
{
    if (!_timestamp) {
        _timestamp = 1;
        [self updateArray:r];
    }
}

- (void)drawInBitmap:(id)bitmap rect:(Int4)r
{
    [bitmap useMonacoFont];
    [bitmap setColor:@"white"];
    [bitmap fillRect:r];
    [bitmap setColor:@"black"];
    for (int i=0; i<[_array count]; i++) {
        id elt = [_array nth:i];
        int x = [elt intValueForKey:@"x"];
        int y = [elt intValueForKey:@"y"];
        int w = [elt intValueForKey:@"w"];
        int h = [elt intValueForKey:@"h"];
        if (_selected == elt) {
            id palette = [elt valueForKey:@"selectedPalette"];
            id pixels = [elt valueForKey:@"pixels"];
            if (palette && pixels) {
                [bitmap drawCString:[pixels UTF8String] palette:[palette UTF8String] x:r.x+x y:r.y+y];
            }
        } else {
            id palette = [elt valueForKey:@"palette"];
            id pixels = [elt valueForKey:@"pixels"];
            if (palette && pixels) {
                [bitmap drawCString:[pixels UTF8String] palette:[palette UTF8String] x:r.x+x y:r.y+y];
            }
        }
        id text = [elt valueForKey:@"displayName"];
        if (![text length]) {
            text = [elt valueForKey:@"name"];
        }
        if ([text length]) {
            [bitmap drawBitmapText:text centeredAtX:x+w/2 y:y+h-2];
        }
    }
}

- (void)handleMouseDown:(id)event
{
    [self setValue:nil forKey:@"selected"];
    int mouseX = [event intValueForKey:@"mouseX"];
    int mouseY = [event intValueForKey:@"mouseY"];
    for (int i=0; i<[_array count]; i++) {
        id elt = [_array nth:i];
        int x = [elt intValueForKey:@"x"];
        int y = [elt intValueForKey:@"y"];
        int w = [elt intValueForKey:@"w"];
        int h = [elt intValueForKey:@"h"];
        if ((mouseX >= x) && (mouseX < x+w) && (mouseY >= y) && (mouseY < y+h)) {
            [self setValue:elt forKey:@"buttonDown"];
            [self setValue:elt forKey:@"selected"];
            _buttonDownOffsetX = mouseX - x;
            _buttonDownOffsetY = mouseY - y;
            struct timeval tv;
            gettimeofday(&tv, NULL);
            id timestamp = nsfmt(@"%ld.%06ld", tv.tv_sec, tv.tv_usec);
            if (_buttonDownTimestamp && ([timestamp doubleValue] - [_buttonDownTimestamp doubleValue] <= 0.3)) {
                id name = [_selected valueForKey:@"name"];
                id displayName = [_selected valueForKey:@"displayName"];
                if ([name length] && [displayName length]) {
                    id cmd = nsarr();
                    [cmd addObject:@"hotdog-openALSAPanel.sh"];
                    [cmd addObject:name];
                    [cmd addObject:displayName];
                    [cmd runCommandInBackground];
                }
                [self setValue:nil forKey:@"buttonDownTimestamp"];
            } else {
                [self setValue:timestamp forKey:@"buttonDownTimestamp"];
            }
            break;
        }
    }
}

- (void)handleMouseMoved:(id)event
{
    if (_buttonDown) {
        int mouseX = [event intValueForKey:@"mouseX"];
        int mouseY = [event intValueForKey:@"mouseY"];
        [_buttonDown setValue:nsfmt(@"%d", mouseX - _buttonDownOffsetX) forKey:@"x"];
        [_buttonDown setValue:nsfmt(@"%d", mouseY - _buttonDownOffsetY) forKey:@"y"];
        [self setValue:nil forKey:@"buttonDownTimestamp"];
    }
}

- (void)handleMouseUp:(id)event
{
    [self setValue:nil forKey:@"buttonDown"];
}

- (void)handleRightMouseDown:(id)event
{
    int mouseX = [event intValueForKey:@"mouseX"];
    int mouseY = [event intValueForKey:@"mouseY"];
    for (int i=0; i<[_array count]; i++) {
        id elt = [_array nth:i];
        int x = [elt intValueForKey:@"x"];
        int y = [elt intValueForKey:@"y"];
        int w = [elt intValueForKey:@"w"];
        int h = [elt intValueForKey:@"h"];
        if ((mouseX >= x) && (mouseX < x+w) && (mouseY >= y) && (mouseY < y+h)) {
            [self setValue:elt forKey:@"selected"];
            id arr = nsarr();
            id name = [_selected valueForKey:@"name"];
            id displayName = [_selected valueForKey:@"displayName"];
            id dict = nil;
            dict = nsdict();
            [dict setValue:nsfmt(@"Name: %@", name) forKey:@"displayName"];
            [arr addObject:dict];
            dict = nsdict();
            [dict setValue:nsfmt(@"Display Name: %@", displayName) forKey:@"displayName"];
            [arr addObject:dict];
            [arr addObject:nsdict()];
            if ([name length] && [displayName length]) {
                dict = nsdict();
                [dict setValue:@"Open Mixer..." forKey:@"displayName"];
                [dict setValue:nsfmt(@"NSArray|addObject:'hotdog-openALSAPanel.sh'|addObject:%@|addObject:%@|runCommandInBackground", [name asQuotedString], [displayName asQuotedString]) forKey:@"messageForClick"];
                [arr addObject:dict];
            }
            if ([arr count]) {
                id menu = [arr asMenu];
                [menu setValue:self forKey:@"contextualObject"];
                int mouseRootX = [event intValueForKey:@"mouseRootX"];
                int mouseRootY = [event intValueForKey:@"mouseRootY"];
                id windowManager = [event valueForKey:@"windowManager"];
                [windowManager openButtonDownMenuForObject:menu x:mouseRootX y:mouseRootY w:0 h:0];
            }
            break;
        }
    }
}
@end

