//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Kristen Sundquist on 7/11/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userInTheMiddleOfEnteringANumber = _userInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit = sender.currentTitle;
    if (self.userInTheMiddleOfEnteringANumber) {
        if ([digit isEqualToString:@"."]) {
            if ([self.display.text rangeOfString:@"."].location == NSNotFound) {
                self.display.text = [self.display.text stringByAppendingString:digit];
            }
        } else {
            self.display.text = [self.display.text stringByAppendingString:digit];
        }        
    } else {
        self.display.text = digit;
        self.userInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userInTheMiddleOfEnteringANumber = NO;
//    self.textEntered.text = [self.textEntered.text stringByAppendingString:[self.display.text stringByAppendingString:@" "]];
}


- (IBAction)operationPressed:(UIButton *)sender
{
    if (self.userInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }
    NSString *operation = sender.currentTitle;
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
//    self.textEntered.text = [self.textEntered.text stringByAppendingString:[sender.currentTitle stringByAppendingString:@" "]];
}
@end
