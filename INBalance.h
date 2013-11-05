//
//  INBalance.h
//  Interest
//
//  Created by Alexander Forselius on 2013-11-05.
//  Copyright (c) 2013 Alexander Forselius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "INAccount.h"
@interface INBalance : NSObject
@property (nonatomic, retain) INAccount *account;
@property (strong) NSDate *date;
@property float balance;
@property float rate;
@property float charge;
@property NSString *text;

- (id)initWithDate:(NSDate *)sdate rate:(float)irate balance:(float)ibalance account:(INAccount *)iaccount charge:(float)icharge text:(NSString *)itext;
@end
