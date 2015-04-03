//
//  Chord.m
//  MIDIFileSequence
//
//  Created by Randy Weinstein on 11/16/14.
//  Copyright (c) 2014 Rockhopper Technologies. All rights reserved.
//

#import "Chord.h"



@implementation Chord


+ (NSNumber *) extension:(ChordExtensions)extension {
    
    return [NSNumber numberWithInt:extension];
}

+ (NSArray *) getExtensions {
    
    NSArray *extensions = @[[self extension:n6]];
    
    return extensions;
}

-(id) initWithRoot:(int16_t)root
           quality:(int16_t)quality
         extension:(NSMutableArray *)extensions
{
    self = [super init];
    if (self) {
        self.root = root;
        self.quality = quality;
        self.extensions = extensions;
    }
    return self;
}


- (NSMutableArray *) getChordMembers {
    
    NSMutableArray *chordMembers = [NSMutableArray new];
    long nextMember;
    
    NSMutableArray *chordIntervals = [NSMutableArray new];
    
    chordIntervals[M] = @[@4,@7];
    chordIntervals[m] = @[@3,@7];
    chordIntervals[dim] = @[@3,@6];
    chordIntervals[aug] = @[@4,@8];
    chordIntervals[dom] = @[@4,@7,@10];
    chordIntervals[sus] = @[@5,@11];
    
    chordMembers[0] = [NSNumber numberWithInt:self.root];

    
    for (int16_t x = 0; x <  [chordIntervals[self.quality] count];x++) {
        nextMember = [chordIntervals[self.quality][x] integerValue];
        chordMembers[x+1] = [NSNumber numberWithLong:self.root + nextMember];
    }
    
    return chordMembers;
    
}

- (int16_t) getBassNote {
    return self.root - 24;
}

- (NSString *) chordSymbol {
    NSArray *noteNames = @[@"C",@"Db",@"D",@"Eb",@"E",@"F",@"Gb",@"G",@"Ab",@"A",@"Bb",@"B"];
    NSArray *chordQualities = @[@"M7",@"m",@"dim",@"aug",@"13",@"sus"];
    NSArray *extension = @[@"",@"6",@"7",@"M7",@"b9",@"9",@"#9",@"11",@"#11",@"b13",@"13"];
    
    NSInteger extensionIndex;
    NSMutableString *extensionString = [[NSMutableString alloc] init];
    
    if (self.extensions != nil) {
        for ( int16_t x = 0; x < self.extensions.count;x++) {
            extensionIndex = [self.extensions[x] integerValue];
            NSString *nextExtension = [NSString stringWithFormat:@"%@",extension[extensionIndex]];
            [extensionString appendString:nextExtension];
        }
    } else {
        [extensionString appendString:@""];
    }
    
    return [NSString stringWithFormat:@"%@%@",noteNames[self.root%12],chordQualities[self.quality]];
}
@end
