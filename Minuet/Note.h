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
}
@end
