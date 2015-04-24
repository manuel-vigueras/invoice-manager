//
//  InvoiceVC.m
//  scanQR
//
//  Created by Alexis Padilla on 4/22/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import "InvoiceVC.h"
#import "InvoiceCell.h"

@interface InvoiceVC ()

@end

@implementation InvoiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)removeVC:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _invoices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"invoiceCell";
    
    InvoiceCell *invoiceCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (invoiceCell == nil) {
        invoiceCell = [[InvoiceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [invoiceCell.lblCompany setText:_invoiceCpy];
    
    double dateD = [[(NSDictionary *)[_invoices objectAtIndex:indexPath.row] objectForKey:@"date"] doubleValue];
    dateD = dateD/1000;
    NSDate *dateO = [NSDate dateWithTimeIntervalSince1970:dateD];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [invoiceCell.lblDate setText:[dateFormatter stringFromDate:dateO]];
    
//    [trxviewCell.lblDate setText:[[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"date"] stringValue]];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [invoiceCell.lblAmount setText:[numberFormatter stringFromNumber:[(NSDictionary *)[_invoices objectAtIndex:indexPath.row] objectForKey:@"amount"]]];
    
//    [trxviewCell.lblAmount setText:[[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"amount"] stringValue]];
    
    
    [invoiceCell.lblID setText:[(NSDictionary *)[_invoices objectAtIndex:indexPath.row] objectForKey:@"taxRecord"]];
    [invoiceCell.lblRFCissuer setText:[(NSDictionary *)[_invoices objectAtIndex:indexPath.row] objectForKey:@"rfcIssuer"]];
    [invoiceCell.lblCompany setText:_invoiceCpy];
    
    return invoiceCell;
}


//-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    return (interfaceOrientation == UIInterfaceOrientationIsLandscape(interfaceOrientation));
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

/*Return the Number of Oreintation going to supported in device*/

- (NSUInteger)supportedInterfaceOrientations
{
    //    return UIInterfaceOrientationMaskLandscape;
    
    return UIInterfaceOrientationMaskPortrait;
}

// Returns interface orientation masks.

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    //    return UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
    return UIInterfaceOrientationPortrait;
    
}
@end
