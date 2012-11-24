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
    // Deal with special cases.
    // Firstly, B Natural at the top of the octave.
    // Secondly, E Natural - The only note to pass to another
    //   natural note up a semitone.
    // Thirdly B sharp. Actually a C. Always leads to the C# of the
    //   octave number above.
    // The rest all follow a pattern. Hopefully...
    if([letter isEqualToString:@"B"] && accidental == 0) {
        NSString *newLetter = @"C";
        int newOctave = octave + 1;
        Note *newNote = [[Note alloc] initWithLetter:newLetter accidental:0 octave:newOctave];
        return newNote;
    }else if(accidental == 0 && [letter isEqualToString:@"E"]) {
        Note *newNote = [[Note alloc] initWithLetter:@"F" accidental:0 octave:octave];
        return newNote;
    }else if(accidental == 2 && [letter isEqualToString:@"B"]) {
        Note *newNote = [[Note alloc] initWithLetter:@"C" accidental:2 octave:octave +1];
        return newNote;
    }else{
        if (accidental == 1) {
            Note *newNote = [[Note alloc] initWithLetter:letter accidental:0 octave:octave];
            return newNote;
        }else if(accidental == 2) {
            NSString *newNoteLetter = [[Note notes]objectAtIndex:[[Note notes] indexOfObject:letter]+1];
            Note *newNote = [[Note alloc] initWithLetter:newNoteLetter accidental:0 octave:octave];
            return newNote;
        }else{
            // Always flat. Needs to know when to return sharps.
            // Depends on context?
            NSString *newNoteLetter = [[Note notes]objectAtIndex:[[Note notes] indexOfObject:letter]+1];
            Note *newNote = [[Note alloc] initWithLetter:newNoteLetter accidental:1 octave:octave];
            return newNote;
        }
    }
}

- (NSArray *)chromaticScale {
    NSMutableArray *chromaticScale = [[NSMutableArray alloc] init];
    Note *currentNote = self;
    [chromaticScale addObject:self];
    for(int x = 0; x < 11; x++)
    {
        currentNote = [currentNote semitoneAbove];
        [chromaticScale addObject:currentNote];
    }
    for (Note *object in chromaticScale) {
        NSLog(@"%@", [object absoluteNoteName]);
    }
    return chromaticScale;
}

#pragma mark - Class Methods
+ (NSArray *)notes {
    NSArray *noteNames = [[NSArray alloc] initWithObjects:@"C", @"D", @"E", @"F", @"G", @"A", @"B", nil];
    return noteNames;
}

@end
