//
//  Note.h
//  Minuet
//
//  Created by Max Woolf on 21/11/2012.
//  Copyright (c) 2012 MaxWoolf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject
{
    // Note letter without accidental
    NSString *letter;
    
    // Representation of accidental
    // 0 = Natural
    // 1 = Flat
    // 2 = Sharp
    int accidental;
    
    // Octave number (MIDI style)
    // Middle C = 4
    int octave;
    
    // MIDI note representation
    // 21 - 108
    int midiNote;
    
    // Frequency to three decimal places (maximum)
    float frequency;
}

// Initializes object with a letter and an accidental.
// Implementation will assume octive 4 unless specified otherwise.
+ (NSArray *)notes;
- (id)initWithLetter:(NSString *)aLetter accidental:(int)anAccidental octave:(int)anOctave;
- (NSString *)absoluteNoteName;
- (NSString *)accidentalName;
- (Note *)semitoneAbove;

@property (nonatomic, retain) NSString *letter;
@property (nonatomic) int accidental;
@property (nonatomic) int octave;
@property (nonatomic) int midiNote;
@property (nonatomic) float frequency;

@end
