//
//  MenuVCViewController.m
//  scanQR
//
//  Created by Alexis Padilla on 4/6/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import "MenuVC.h"
#import "ViewController.h"
#import "TrxVC.h"


@interface MenuVC ()

@end

@implementation MenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Menú Transacciones"
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *scanAction = [UIAlertAction actionWithTitle:@"Capturar código QR"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action) {
                                                           ViewController *scanVC = [[ViewController alloc] init];
                                                           [self performSegueWithIdentifier:@"scanVC" sender:scanVC];
                                                           
                                                       }];
    UIAlertAction *trxAction = [UIAlertAction actionWithTitle:@"Transacciones"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action) {
                                                           TrxVC *trxVC = [[TrxVC alloc] init];
                                                           
                                                           [self performSegueWithIdentifier:@"trxVC" sender:trxVC];
                                                           
                                                       }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alertController addAction:scanAction];
    [alertController addAction:trxAction];
//    [alertController addAction:messagesAction];
    [alertController addAction:cancelAction];
    alertController.view.tintColor = [UIColor colorWithRed:240.0/255.0 green:125.0/255.0 blue:6.0/255.0 alpha:1.0];
    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(BOOL)shouldAutorotate
{
    if (self.navigationController.viewControllers.count > 1) {
        return [[self.navigationController.viewControllers lastObject] shouldAutorotate];
    }
    else{
        return YES;
    }
    
}

-(NSUInteger)supportedInterfaceOrientations
{
    if (self.navigationController.viewControllers.count > 1) {
    return [[self.navigationController.viewControllers lastObject] supportedInterfaceOrientations];
    }
    else{
        return UIInterfaceOrientationMaskPortrait;
    }
        
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    if (self.navigationController.viewControllers.count > 1) {
    return [[self.navigationController.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
    }
    else{
        return UIInterfaceOrientationPortrait;
    }
}


@end
