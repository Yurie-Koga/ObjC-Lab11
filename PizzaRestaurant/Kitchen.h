//
//  Kitchen.h
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"

@class Kitchen;

@protocol KitchenDelegate <NSObject>

- (BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(enum PizzaSizeChar)size andToppings:(NSArray *)toppings;
- (BOOL) kitchenShouldUpgradeOrder:(Kitchen *)ketchen;

@optional   // needs to check by 'respondsToSelector:@selector(kitchenDidMakePizza:)'
- (void) kitchenDidMakePizza:(Pizza *)pizza;

@end

@interface Kitchen : NSObject

@property (nonatomic, weak) id<KitchenDelegate>delegate;

- (Pizza *)makePizzaWithSizeChar:(enum PizzaSizeChar)size toppings:(NSArray *)toppings;

@end
