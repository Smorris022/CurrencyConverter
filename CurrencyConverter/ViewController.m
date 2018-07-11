//
//  ViewController.m
//  CurrencyConverter
//
//  Created by stephan morris on 5/7/16.
//  Copyright © 2016 morrs. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@property (weak, nonatomic) IBOutlet UIButton *convertButton;

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    //button method to convert currency
    self.convertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled = YES;
    
    double inputValue = [self.inputField.text floatValue];
    
    double euroValue = inputValue * currencies.EUR;
    NSString *temp = [NSString stringWithFormat:@"%.2f", euroValue];
    
    double yenValue = inputValue * currencies.JPY;
    NSString *tempJPY = [NSString stringWithFormat:@"%.2f", yenValue];
    
    double gbdValue = inputValue * currencies.GBP;
    NSString *tempGBD = [NSString stringWithFormat:@"%.2f", gbdValue];
    
    
    self.currencyA.text = temp;
    self.currencyB.text = tempJPY;
    self.currencyC.text = tempGBD;
}

@end
