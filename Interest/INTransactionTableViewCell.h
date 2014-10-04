//
//  INTransactionTableViewCell.h
//  Interest
//
//  Created by Alexander Forselius on 2014-10-04.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface INTransactionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;

@end
