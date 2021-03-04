//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Uji Saori on 2021-03-01.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (instancetype) initWithSizeChar:(enum PizzaSizeChar) size AndToppings: (NSArray *) toppings;
{
    self = [super init];
    if (self) {
        _sizeChar = &size;
        _toppings = toppings;
    }
    return self;
}

- (NSString *) getPizzaSizeWith:(enum PizzaSizeChar) size
{
    switch (size) {
        case Small:
            return @"Small";
        case Medium:
            return @"Medium";
        case Large:
            return @"Large";
        default:
            return nil;
    }
}

@end
