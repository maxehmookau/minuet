//
//  main.m
//  Minuet
//
//  Created by Max Woolf on 21/11/2012.
//  Copyright (c) 2012 MaxWoolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Note *middleB = [[Note alloc] initWithLetter:@"B" accidental:0 octave:7];
        NSLog(@"%@", [middleB absoluteNoteName]);
        [middleB semitoneAbove];
        
    }
    return 0;
}

