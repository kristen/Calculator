//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Kristen Sundquist on 7/11/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userInTheMiddleOfEnteringANumber;


@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userInTheMiddleOfEnteringANumber = _userInTheMiddleOfEnteringANumber;


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

- (IBAction)enterPressed {
}


- (IBAction)operationPressed:(UIButton *)sender {
}
@end
