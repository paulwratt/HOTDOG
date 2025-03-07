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

static id diskPalette =
@"b #000000\n"
@". #ffffff\n"
;
static id selectedDiskPalette =
@". #000000\n"
@"b #ffffff\n"
;
static id diskPixels =
@" bbbbbbbbbbbbbbbbbbbbbbbbbbb    \n"
@"b......b...............b....b   \n"
@"b......b.........bbb...b.....b  \n"
@"b......b........b...b..b......b \n"
@"b......b........b...b..b.......b\n"
@"b......b........b...b..b.......b\n"
@"b......b........b...b..b.......b\n"
@"b......b........b...b..b.......b\n"
@"b......b........b...b..b.......b\n"
@"b......b.........bbb...b.......b\n"
@"b......b...............b.......b\n"
@"b.......bbbbbbbbbbbbbbb........b\n"
@"b..............................b\n"
@"b..............................b\n"
@"b..............................b\n"
@"b..............................b\n"
@"b.....bbbbbbbbbbbbbbbbbbbb.....b\n"
@"b....b....................b....b\n"
@"b....b....................b....b\n"
@"b....b....................b....b\n"
@"b....b....................b....b\n"
@"b....b....................b....b\n"
@"b....b.......bb...bb......b....b\n"
@"b....b.......bb..bb.......b....b\n"
@"b....b.......bb.bb........b....b\n"
@"b....b.......bbbb.........b....b\n"
@"b....b.......bbb..........b....b\n"
@"b....b.......bb...........b....b\n"
@"b....b....................b....b\n"
@"b....b....................b....b\n"
@"b....b....................b....b\n"
@" bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb \n"
;

@implementation Definitions(hkukgfdfthfnvbchjgfjygikghjghfjgfjdksfjksfjdsklfjksdldj)
+ (id)MacClassicDrives
{
    id observercmd = nsarr();
    [observercmd addObject:@"hotdog-monitorBlockDevices"];
    id observer = [observercmd runCommandAndReturnProcess];
    if (!observer) {
NSLog(@"unable to run observer command %@", observercmd);
exit(1);
    }

    id obj = [@"MacClassicDrives" asInstance];
    [obj setValue:observer forKey:@"observer"];
    return obj;
}
@end

@interface MacClassicDrives : IvarObject
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
@implementation MacClassicDrives
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
    [cmd addObject:@"hotdog-listBlockDevices.pl"];
    id lines = [[[cmd runCommandAndReturnOutput] asString] split:@"\n"];
    int x = 50;
    int y = 5;
    int w = [Definitions widthForCString:[diskPixels UTF8String]];
    int h = [Definitions heightForCString:[diskPixels UTF8String]];
    id results = nsarr();
    for (int i=0; i<[lines count]; i++) {
        id line = [lines nth:i];
        id device = [line valueForKey:@"device"];
        id mountpoint = [line valueForKey:@"mountpoint"];
        if (![device length] && ![mountpoint length]) {
            continue;
        }
        id fstype = [line valueForKey:@"fstype"];
        id size = [line valueForKey:@"size"];
        id label = [line valueForKey:@"label"];
        id vendor = [line valueForKey:@"vendor"];
        id model = [line valueForKey:@"model"];
        id dict = nsdict();
        [dict setValue:device forKey:@"device"];
        [dict setValue:mountpoint forKey:@"mountpoint"];
        [dict setValue:fstype forKey:@"fstype"];
        [dict setValue:size forKey:@"size"];
        [dict setValue:label forKey:@"label"];
        [dict setValue:vendor forKey:@"vendor"];
        [dict setValue:model forKey:@"model"];
        [dict setValue:nsfmt(@"%d", x) forKey:@"x"];
        [dict setValue:nsfmt(@"%d", y) forKey:@"y"];
        [dict setValue:nsfmt(@"%d", w) forKey:@"w"];
        [dict setValue:nsfmt(@"%d", h) forKey:@"h"];
        [dict setValue:diskPalette forKey:@"palette"];
        [dict setValue:selectedDiskPalette forKey:@"selectedPalette"];
        [dict setValue:diskPixels forKey:@"pixels"];
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
        id text = [elt valueForKey:@"mountpoint"];
        if (![text length]) {
            text = [elt valueForKey:@"device"];
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
                id mountpoint = [_selected valueForKey:@"mountpoint"];
                if ([mountpoint length]) {
                    id cmd = nsarr();
                    [cmd addObject:@"hotdog"];
                    [cmd addObject:@"dir"];
                    [cmd addObject:mountpoint];
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
            id device = [_selected valueForKey:@"device"];
            id mountpoint = [_selected valueForKey:@"mountpoint"];
            id fstype = [_selected valueForKey:@"fstype"];
            id size = [_selected valueForKey:@"size"];
            id label = [_selected valueForKey:@"label"];
            id vendor = [_selected valueForKey:@"vendor"];
            id model = [_selected valueForKey:@"model"];
            id dict = nil;
            dict = nsdict();
            [dict setValue:nsfmt(@"Device: %@", device) forKey:@"displayName"];
            [arr addObject:dict];
            dict = nsdict();
            [dict setValue:nsfmt(@"Mountpoint: %@", mountpoint) forKey:@"displayName"];
            [arr addObject:dict];
            dict = nsdict();
            [dict setValue:nsfmt(@"File System: %@", fstype) forKey:@"displayName"];
            [arr addObject:dict];
            dict = nsdict();
            [dict setValue:nsfmt(@"Size: %@", size) forKey:@"displayName"];
            [arr addObject:dict];
            dict = nsdict();
            [dict setValue:nsfmt(@"Label: %@", label) forKey:@"displayName"];
            [arr addObject:dict];
            dict = nsdict();
            [dict setValue:nsfmt(@"Vendor: %@", vendor) forKey:@"displayName"];
            [arr addObject:dict];
            dict = nsdict();
            [dict setValue:nsfmt(@"Model: %@", model) forKey:@"displayName"];
            [arr addObject:dict];
            [arr addObject:nsdict()];
            if ([mountpoint length]) {
                dict = nsdict();
                [dict setValue:@"Unmount" forKey:@"displayName"];
                [dict setValue:nsfmt(@"NSArray|addObject:'hotdog-unmountDrive.pl'|addObject:'%@'|runCommandAndReturnOutput;setValue:'0' forKey:'timestamp'", mountpoint) forKey:@"messageForClick"];
                [arr addObject:dict];
            } else if ([device length]) {
                dict = nsdict();
                [dict setValue:@"Mount" forKey:@"displayName"];
                [dict setValue:nsfmt(@"NSArray|addObject:'hotdog-mountDrive.pl'|addObject:'%@'|runCommandAndReturnOutput;setValue:'0' forKey:'timestamp'", device) forKey:@"messageForClick"];
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

