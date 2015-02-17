//
//  Progression.m
//  MIDIFileSequence
//
//  Created by Randy Weinstein on 11/26/14.
//  Copyright (c) 2014 Rockhopper Technologies. All rights reserved.
//

#import "Progression.h"

@implementation Progression

- (NSMutableArray *) basicChordProgression {
    
    NSMutableArray *renderedProgression = [NSMutableArray new];
    int16_t placement = 0;
    int16_t duration = 4;
    for ( int16_t index = 0; index < [self.chordProgression count]; index++) {
        
        Chord *currentChord = self.chordProgression[index];
        
        NSArray *progressionElement = @[
                                        [NSNumber numberWithInt:placement],
                                         [currentChord getChordMembers],
                                         [NSNumber numberWithInt:duration]
                                        ];
        
        [renderedProgression addObject: progressionElement];
         placement += duration;
    }
    
    return renderedProgression;
}

- (NSMutableArray *) voicedChordProgression {
    
    NSMutableArray *renderedProgression = [NSMutableArray new];
    NSMutableArray *lastVoicing = [NSMutableArray new];
    
    for ( int16_t index = 0; index < [self.chordProgression count]; index++) {
       Chord *currentChord = self.chordProgression[index];
        if ( index > 0 ) {
            
            NSMutableArray *chordMembers = [currentChord getChordMembers];
            
            for ( int16_t chordMember = 0; chordMember < chordMembers.count; chordMember++ ) {
                
                int16_t currentChordMember = [chordMembers[chordMember] integerValue ];
                
                for ( int16_t voiceIndex = 0; voiceIndex < lastVoicing.count; voiceIndex++) {
                    NSLog(@"%ld",currentChordMember - [lastVoicing[voiceIndex] integerValue]);
                }
            }
            lastVoicing = [currentChord getChordMembers];
        } else {
            lastVoicing = [currentChord getChordMembers];
        }
    
    }
    
    return renderedProgression;
    
}
- (NSMutableArray *) bassLine {
    NSMutableArray *renderedBassLine = [NSMutableArray new];
    int16_t placement = 0;
    int16_t duration = 4;
    
    for ( int16_t index = 0; index < [self.chordProgression count]; index++) {
        Chord *currentChord = self.chordProgression[index];
        
        NSArray *progressionElement = @[
                                        [NSNumber numberWithInt:placement],
                                       @[[NSNumber numberWithInt:[currentChord getBassNote]]],
                                        [NSNumber numberWithInt:duration]
                                        ];
        
        
        [renderedBassLine addObject:progressionElement];
        
        placement += 4;
    }
    
    return renderedBassLine;
    
}


@end
