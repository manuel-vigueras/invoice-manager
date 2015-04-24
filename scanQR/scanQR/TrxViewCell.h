//
//  TrxViewCell.h
//  scanQR
//
//  Created by Alexis Padilla on 4/7/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrxViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblCompany;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblAut;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@end
