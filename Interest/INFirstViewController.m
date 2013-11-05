//
//  INFirstViewController.m
//  Interest
//
//  Created by Alexander Forselius on 2013-11-05.
//  Copyright (c) 2013 Alexander Forselius. All rights reserved.
//

#import "INFirstViewController.h"

@interface INFirstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *iAmount;
@property (weak, nonatomic) IBOutlet UITextField *iInterest;
@property (weak, nonatomic) IBOutlet UITextField *iDuration;
@property (weak, nonatomic) IBOutlet UITextField *iCharge;

@end

@implementation INFirstViewController
@synthesize account;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)doCalculation:(id)sender {
    float capital = [[[self iAmount] text] floatValue];
    float duration = [[[self iDuration] text] floatValue];
    float charge = [[[self iCharge] text] floatValue];
    float interest = [[[self iInterest] text] floatValue];
    INAccount *acc = [[INAccount alloc] initWithDate:[NSDate date] capital: capital duration:duration interest:interest insertion:charge];
    [self setAccount: acc];
    [self performSegueWithIdentifier:@"plan" sender:self];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"plan"]) {
        INPlanTableViewController *vc = (INPlanTableViewController *)[segue destinationViewController];
        [vc setAccount:[self account]];
    }
}

@end
