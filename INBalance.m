//
//  INBalance.m
//  Interest
//
//  Created by Alexander Forselius on 2013-11-05.
//  Copyright (c) 2013 Alexander Forselius. All rights reserved.
//

#import "INBalance.h"

@implementation INBalance
@synthesize rate;
@synthesize account;
@synthesize balance;
@synthesize charge;
@synthesize date;
@synthesize text;
- (id)initWithDate:(NSDate *)sdate rate:(float)irate balance:(float)ibalance account:(INAccount *)iaccount charge:(float)icharge text:(NSString *)itext {
    if(self = [self init]) {
        self.date = sdate;
        self.account = iaccount;
        self.rate = irate;
        self.balance = ibalance;
        self.charge = icharge;
        self.text = itext;
    }
    return self;
}
@end
