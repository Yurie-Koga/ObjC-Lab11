//
//  PizzaManager1.m
//  PizzaRestaurant
//
//  Created by Uji Saori on 2021-03-03.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import "PizzaManager1.h"

@implementation PizzaManager1

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(enum PizzaSizeChar)size andToppings:(NSArray *)toppings {
    // check by lowercase strings
    if([[toppings valueForKey:@"lowercaseString"] containsObject:@"anchovies"]) {
        NSLog(@"This Manager does not like <anchovies>");
        return NO;
    }
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)ketchen {
    return NO;
}

@end
