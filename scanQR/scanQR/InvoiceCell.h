//
//  InvoiceCell.h
//  scanQR
//
//  Created by Alexis Padilla on 4/23/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvoiceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblID;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblRFCissuer;
@property (weak, nonatomic) IBOutlet UILabel *lblAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblCompany;

@end
