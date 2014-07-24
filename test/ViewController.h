//
//  ViewController.h
//  test
//
//  Created by akatsuki on 7/21/14.
//  Copyright (c) 2014 tj. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;
@import CoreBluetooth;

@interface ViewController : UIViewController<CLLocationManagerDelegate,CBPeripheralDelegate,UIActionSheetDelegate>
- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *text;
- (IBAction)getdistance:(id)sender;
- (IBAction)background:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *ssBtn;
@property (weak, nonatomic) IBOutlet UIButton *lrBtn;

@end
