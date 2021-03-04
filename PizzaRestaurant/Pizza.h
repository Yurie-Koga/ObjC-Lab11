//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Uji Saori on 2021-03-01.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pizza : NSObject

enum PizzaSizeChar { Small = 's', Medium = 'm', Large = 'l' };

@property (nonatomic) enum PizzaSizeChar *sizeChar;
@property (nonatomic) NSArray *toppings;

- (instancetype) initWithSizeChar:(enum PizzaSizeChar) size AndToppings: (NSArray *) toppings;

- (NSString *) getPizzaSizeWith:(enum PizzaSizeChar) size;

@end

NS_ASSUME_NONNULL_END
