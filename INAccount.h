//
//  INCalc.h
//  Interest
//
//  Created by Alexander Forselius on 2013-11-05.
//  Copyright (c) 2013 Alexander Forselius. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum INCalculationType : NSUInteger {
    Loan,
    Saving
} CalculationType;

@interface INAccount : NSObject
@property NSDate *startDate;
@property float capital;
@property float month;
@property float interest;
@property float insertion;
@property float months;
@property enum INCalculationType calculationType;
- (NSMutableArray *)plan;
- (NSMutableArray *)years;
- (float) cost;
- (float) rate;
- (id)initWithDate:(NSDate *)iStartDate capital:(float)icapital duration:(float)months interest:(float)iinterest insertion:(float)iinsertion;
@end
