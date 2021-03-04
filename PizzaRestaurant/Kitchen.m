//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSizeChar:(enum PizzaSizeChar)size toppings:(NSArray *)toppings;
{
    // be safer to check delegate is connected
    if(self.delegate) {
        if(![self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings]){
            return nil;
        }
        if([self.delegate kitchenShouldUpgradeOrder:self]) {
            size = Large;
            NSLog(@"Pizza size has been upgraded to <Large>");
        }
    }
        
    Pizza *pizza = [[Pizza alloc] initWithSizeChar:size AndToppings:toppings];
    NSString *pizzaSize = [pizza getPizzaSizeWith:size];
    if (pizzaSize == nil) {
        NSLog(@"Size is invalid, please select again.");
        return nil;
    } else {
        NSLog(@"Your order has been submitted....");
        NSLog(@"selected size: <%@>", pizzaSize);
        NSLog(@"selected toppings: %@", toppings);
    }
    
    // for @optional protocol methods, check if they are implemented
    if(self.delegate && [self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
        [self.delegate kitchenDidMakePizza:pizza];
    }
    return pizza;
}

@end
