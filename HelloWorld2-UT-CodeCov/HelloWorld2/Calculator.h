//
//  Calculator.h
//  HelloWorld2
//
//  Created by Vesa Vuorio on 12/01/2018.
//  Copyright © 2018 Vesa Vuorio. All rights reserved.
//

#ifndef Calculator_h
#define Calculator_h

#import <Cocoa/Cocoa.h>

@interface Calculator : NSObject
{
    
}

- (int) addTwoNumbers: (int) first secondNumber:(int) second;
- (float) addTwoDecimals: (float) first plus:(float) second;
- (int) addTwoNumbers: (int) coverageStep firstNumber:(int) first secondNumber:(int) second;

@end

#endif /* Calculator_h */

