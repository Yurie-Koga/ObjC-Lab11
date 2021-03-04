//
//  PizzaManager2.m
//  PizzaRestaurant
//
//  Created by Uji Saori on 2021-03-03.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import "PizzaManager2.h"

@implementation PizzaManager2

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(enum PizzaSizeChar)size andToppings:(NSArray *)toppings {
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)ketchen {
    return YES;
}

- (void) kitchenDidMakePizza:(Pizza *)pizza
{
    NSLog(@"Pizza Manager #2 - Pizza has been made");
}

@end
