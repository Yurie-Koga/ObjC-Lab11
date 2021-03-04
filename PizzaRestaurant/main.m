//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"
#import "PizzaManager1.h"
#import "PizzaManager2.h"
#import "InputHandler.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        NSString *promptManager = @"\nSelect Pizza Manager: {1: Manager1, 2: Manager2, 3:None }";
        
        // sample input: s ham pepperoni olieves
        NSString *promptOrder = @"\nPlease pick your pizza size and toppings: \n";
        promptOrder = [promptOrder stringByAppendingString:@"Input example: one of the size { S: Small, M: Medium, L: Large } \n"];
        promptOrder = [promptOrder stringByAppendingString:@"And any toppings you want! (e.g. Ham Pepperoni Olieves) \n> "];
        
        NSString *inputStr = @"";
        
        Kitchen *restaurantKitchen = [Kitchen new];
        PizzaManager1 *pManager1 = [[PizzaManager1 alloc] init];
        PizzaManager2 *pManager2 = [[PizzaManager2 alloc] init];
        
        BOOL continueManger = YES;
        while (continueManger) {
            printf("* * * * * * * * * * *\n");
            inputStr = [InputHandler getUserInputWithMax:255 AndPrompt:promptManager];
            if([[inputStr lowercaseString] isEqualToString:@"q"]) { break; }
            
            switch ([inputStr intValue]) {
                case 1:
                    restaurantKitchen.delegate = pManager1;
                    NSLog(@"selected Manager1");
                    break;
                case 2:
                    restaurantKitchen.delegate = pManager2;
                    NSLog(@"selected Manager2");
                    break;
                case 3:
                    restaurantKitchen.delegate = nil;
                    NSLog(@"no manager is selected");
                    break;
                default:
                    NSLog(@"input is inalid");
                    continue;
            }
            
            while (YES) {
                inputStr = [InputHandler getUserInputWithMax:255 AndPrompt:promptOrder];
                if([[inputStr lowercaseString] isEqualToString:@"q"]) { continueManger = NO; break; }
                
                // Take the first word of the command as the size, and the rest as the toppings
                NSArray *commandWords = [inputStr componentsSeparatedByString:@" "];
                
                // And then send some message to the kitchen...
                NSString *pizzaSize = [NSString stringWithString:[commandWords objectAtIndex:0]];
                char sizeChar = [[pizzaSize lowercaseString] characterAtIndex:0];
                NSArray *toppings = [commandWords subarrayWithRange: NSMakeRange(1, [commandWords count]-1)];
                if([restaurantKitchen makePizzaWithSizeChar:sizeChar toppings:toppings] == nil) {
                    continue;
                }
                break;
            }   // order input end
        }   // manager input end
    }
    return 0;
}

