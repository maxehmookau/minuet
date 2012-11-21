//
//  Note.m
//  Minuet
//
//  Created by Max Woolf on 21/11/2012.
//  Copyright (c) 2012 MaxWoolf. All rights reserved.
//

#import "Note.h"

@implementation Note
@synthesize  letter, accidental, octave, midiNote, frequency;

- (id)initWithLetter:(NSString *)aLetter accidental:(int)anAccidental octave:(int)anOctave {
    
    letter = aLetter;
    accidental = anAccidental;
    
    // Set octave as 4 if not set directly
    if(anOctave) {
        octave = anOctave;
    }else{
        octave = 4;
    }
    
    return [super init];
}

// Returns the absolute reference to the note.
// Middle C = C4
// Returns as an NSString
- (NSString *)absoluteNoteName
{
    return [NSString stringWithFormat:@"%@%@%i", letter, [self accidentalName],  octave];
}

// Returns the symbol of the accidental as an NSString
- (NSString *)accidentalName {
    switch (accidental) {
        case 0:
            return @"";
            break;
        case 1:
            return @"b";
            break;
        case 2:
            return @"#";
            break;
        default:
            break;
    }
    return nil;
}

- (Note *)semitoneAbove
{
    // Treat it differently if it's at the top of the octave
    if([letter isEqualToString:@"B"] && accidental == 0) {
        NSString *newLetter = @"C";
        int newOctave = octave + 1;
        Note *newNote = [[Note alloc] initWithLetter:newLetter accidental:0 octave:newOctave];
        return newNote;
    }else{
        if(accidental == 0 && [letter isEqualToString:@"E"]) {
            Note *newNote = [[Note alloc] initWithLetter:@"F" accidental:0 octave:octave];
            return newNote;
        }
    }
    return nil;
}

#pragma mark - Class Methods
+ (NSArray *)notes {
    NSArray *noteNames = [[NSArray alloc] initWithObjects:@"C", @"D", @"E", @"F", @"G", @"A", @"B", nil];
    return noteNames;
}

@end
