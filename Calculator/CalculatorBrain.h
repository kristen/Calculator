//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Kristen Sundquist on 7/11/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (void)clearOperandStack;
- (double)performOperation:(NSString *)operation;

@property (readonly) id program;

+ (double)runProgram:(id)program;
+ (NSString *)descriptionOfProgram:(id)program;

@end
