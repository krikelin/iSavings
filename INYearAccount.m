//
//  INYearAccount.m
//  Interest
//
//  Created by Alexander Forselius on 2013-11-05.
//  Copyright (c) 2013 Alexander Forselius. All rights reserved.
//

#import "INYearAccount.h"

@implementation INYearAccount
@synthesize year;
@synthesize transactions;
- (id) initWithYear:(NSInteger)iyear {
    if(self = [super init]) {
        self.year = iyear;
        self.transactions = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
