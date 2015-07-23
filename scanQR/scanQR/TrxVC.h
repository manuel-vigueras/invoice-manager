//
//  TrxVC.h
//  scanQR
//
//  Created by Alexis Padilla on 4/6/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrxVC : UIViewController <UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblMain;
@property (strong, nonatomic) NSMutableArray *trxs;
@property (weak, nonatomic) IBOutlet UIView *loadingV;

- (void) preloadTrxs;

@end
