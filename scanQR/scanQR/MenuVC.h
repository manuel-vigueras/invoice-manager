//
//  MenuVCViewController.h
//  scanQR
//
//  Created by Alexis Padilla on 4/6/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuVC : UIViewController <UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnMenu;


- (IBAction)showAlert:(id)sender;

@end
