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
        
        Note *middleB = [[Note alloc] initWithLetter:@"B" accidental:2 octave:3];
        NSLog(@"%@", [middleB absoluteNoteName]);
        NSLog(@"%@", [[middleB semitoneAbove]absoluteNoteName]);
        
    }
    return 0;
}

