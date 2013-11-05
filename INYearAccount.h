//
//  INYearAccount.h
//  Interest
//
//  Created by Alexander Forselius on 2013-11-05.
//  Copyright (c) 2013 Alexander Forselius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface INYearAccount : NSObject
@property NSInteger year;
@property NSMutableArray *transactions;
-(id) initWithYear:(NSInteger)iyear;
@end
