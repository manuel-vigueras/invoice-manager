//
//  InvoiceVC.h
//  scanQR
//
//  Created by Alexis Padilla on 4/22/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvoiceVC : UIViewController <UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblMain;
@property (strong, nonatomic) NSMutableArray *invoices;
@property (strong, nonatomic) NSString *invoiceCpy;

- (IBAction)removeVC:(id)sender;

@end
