//
//  INFirstViewController.h
//  Interest
//
//  Created by Alexander Forselius on 2013-11-05.
//  Copyright (c) 2013 Alexander Forselius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INPlanTableViewController.h"
@interface INFirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnShowDev;
@property INAccount *account;
@end
