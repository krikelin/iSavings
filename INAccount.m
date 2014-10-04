//
//  INCalc.m
//  Interest
//
//  Created by Alexander Forselius on 2013-11-05.
//  Copyright (c) 2013 Alexander Forselius. All rights reserved.
//

#import "INAccount.h"
#import "INBalance.h"
#import "INYearAccount.h"
@implementation INAccount
@synthesize startDate;
@synthesize capital;
@synthesize calculationType;
@synthesize insertion;
@synthesize interest;
@synthesize months;

- (float) cost {
    float amount = [self capital];
    return amount * pow([self rate], months);
}
- (float) rate {
    return 1.0f + ([self interest] / 100.0f);
}

- (NSMutableArray *)plan {
    NSMutableArray *plan = [[NSMutableArray alloc] init];
    float amount = [self capital];
    float rate = [self rate];
    
    float charge = [self insertion];
    
    NSDate *date = [NSDate date];
    for (NSInteger i = -1; i < months; i++) {
        float _interest = ([self interest] / 12) / 100.f * amount;
        amount += _interest;
        // add interest
        INBalance *account = [[INBalance alloc] initWithDate:date rate:rate balance:amount account:self charge:_interest text:@"Interest"];
        [plan addObject:account];
        amount += charge;
        account = [[INBalance alloc] initWithDate:date rate:rate balance:amount account:self charge:charge text:@"Deposit"];
        [plan addObject:account];
        NSDateComponents *dc = [[NSDateComponents alloc] init];
        dc.month = 1;
        date = [[NSCalendar currentCalendar] dateByAddingComponents:dc toDate:date options:0];
    }
    return plan;
}


- (NSMutableArray *)years {
    float amount = [self capital];
    float rate = [self rate];
    
    float charge = [self insertion];
    
    NSMutableArray *_years = [[NSMutableArray alloc] init];
    
    NSDate *date = [NSDate date];
    NSDateComponents *dc = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    INYearAccount *yacc = [[INYearAccount alloc] initWithYear:[dc year]];
    
    NSInteger year = 2013;
    for (NSInteger i = 0; i < months; i++) {
        NSDateComponents *dc = [[NSDateComponents alloc] init];
        dc.month = 1;
        date = [[NSCalendar currentCalendar] dateByAddingComponents:dc toDate:date options:0];
        dc = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
        NSInteger cyear = [dc year];
        if (year != cyear) {
            [_years addObject:yacc];
            yacc = [[INYearAccount alloc] initWithYear:cyear];
        }
        year = cyear;
        float _interest = ([self interest] / 12) / 100.f * amount;
        amount += _interest;
        // add interest
        INBalance *account = [[INBalance alloc] initWithDate:date rate:rate balance:amount account:self charge:_interest text:@"Interest"];
        [[yacc transactions] addObject:account];
        
        
        amount += charge;
        account = [[INBalance alloc] initWithDate:date rate:rate balance:amount account:self charge:charge text:@"Deposit"];
        [[yacc transactions] addObject:account];
        
        
        
    }
    [_years addObject:yacc];
    return _years;
}

- (id)initWithDate:(NSDate *)iStartDate capital:(float)icapital duration:(float)imonths interest:(float)iinterest insertion:(float)iinsertion {
    if(self = [super init]) {
        self.startDate = iStartDate;
        self.capital = icapital;
        self.months = imonths;
        self.interest = iinterest;
        self.insertion = iinsertion;
    }
    return self;
}
@end
