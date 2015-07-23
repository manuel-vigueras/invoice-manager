//
//  TrxVC.m
//  scanQR
//
//  Created by Alexis Padilla on 4/6/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import "TrxVC.h"
#import "TrxViewCell.h"
#import "WebServices.h"
#import "InvoiceVC.h"

@interface TrxVC (){
    Boolean *haveTrxs;
}

@end

@implementation TrxVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:NO];
    // Do any additional setup after loading the view.
    _loadingV.hidden = false;
    [self.view bringSubviewToFront:_loadingV];
    [self performSelector:@selector(requestService) withObject:nil afterDelay:0.01];
//    [self preloadTrxs];
    
}

- (void) viewDidAppear:(BOOL)animated{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) requestService{
    @autoreleasepool {
        //NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        WebServices *notesService = [[WebServices alloc] init];
        
        /*Consulta de servicio Historia Académica*/
        NSString *resultD = [[NSString alloc] initWithString:[notesService reqTransactionsWithNo:@"9876"]];
        if(![resultD isEqualToString:@"ERROR"]){
            NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:[resultD dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
        
            _trxs = [[NSMutableArray alloc] initWithArray:(NSArray*)json];
            [_tblMain reloadInputViews];
            [self.view sendSubviewToBack:_loadingV];
            _loadingV.hidden = true;
        }
        else{
            haveTrxs = false;
            [self.view sendSubviewToBack:_loadingV];
            _loadingV.hidden = true;
            UIAlertView *alertError = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Ha ocurrido un error al cargar transacciones" delegate:[self.navigationController.viewControllers lastObject] cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
            [alertError show];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
    
}

-(void)preloadTrxs{
    _trxs = [[NSMutableArray alloc] initWithObjects:
             [[NSDictionary alloc] initWithObjectsAndKeys:@"4468104",@"id",@"CAPITAL JEANS SA CV",@"concept",[[NSNumber alloc] initWithDouble:756],@"amount",[[NSNumber alloc] initWithDouble:1446357600000],@"date",@"Conciliada",@"status", nil],
             [[NSDictionary alloc] initWithObjectsAndKeys:@"4367124",@"id",@"POLMAL SA CV",@"concept",[[NSNumber alloc] initWithDouble:1345],@"amount",[[NSNumber alloc] initWithDouble:1446357600000],@"date",@"Conciliada",@"status", nil],
             [[NSDictionary alloc] initWithObjectsAndKeys:@"7647903",@"id",@"7 ELEVEN MÉXICO SA CD",@"concept",[[NSNumber alloc] initWithDouble:158],@"amount",[[NSNumber alloc] initWithDouble:1446357600000],@"date",@"Conciliada",@"status", nil],
             [[NSDictionary alloc] initWithObjectsAndKeys:@"5846902",@"id",@"CORPORATIVO NUHAIR SC",@"concept",[[NSNumber alloc] initWithDouble:533],@"amount",[[NSNumber alloc] initWithDouble:1446357600000],@"date",@"No conciliada",@"status", nil],
             [[NSDictionary alloc] initWithObjectsAndKeys:@"8649501",@"id",@"GENDRY FRANK MICHEL",@"concept",[[NSNumber alloc] initWithDouble:189],@"amount",[[NSNumber alloc] initWithDouble:1446357600000],@"date",@"Conciliada",@"status", nil],
             [[NSDictionary alloc] initWithObjectsAndKeys:@"7549445",@"id",@"ARANZAZU SA CV",@"concept",[[NSNumber alloc] initWithDouble:2560],@"amount",[[NSNumber alloc] initWithDouble:1446357600000],@"date",@"No conciliada",@"status", nil],
             nil];
    [_tblMain reloadInputViews];
    [self.view sendSubviewToBack:_loadingV];
    _loadingV.hidden = true;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    InvoiceVC *invoiceVC = [segue destinationViewController];
    
    NSIndexPath *selectedPath = [self.tblMain indexPathForSelectedRow];
    invoiceVC.invoiceCpy = [(NSDictionary *)[_trxs objectAtIndex:selectedPath.row] objectForKey:@"concept"];
    invoiceVC.invoices = [(NSDictionary *)[_trxs objectAtIndex:selectedPath.row] objectForKey:@"invoiceList"];
    
}

- (IBAction)removeVC:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    static NSString *CellIdentifier = @"SectionHeader";
//    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (headerView == nil){
//        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
//    }
//    return headerView;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _trxs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"trxCell";
    
    TrxViewCell *trxviewCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (trxviewCell == nil) {
        trxviewCell = [[TrxViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [trxviewCell.lblCompany setText:[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"concept"]];
    
    double dateD = [[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"date"] doubleValue];
    dateD = dateD/1000;
    NSDate *dateO = [NSDate dateWithTimeIntervalSince1970:dateD];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [trxviewCell.lblDate setText:[dateFormatter stringFromDate:dateO]];
    
//    [trxviewCell.lblDate setText:[[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"date"] stringValue]];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [trxviewCell.lblAmount setText:[numberFormatter stringFromNumber:[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"amount"]]];
    
//    [trxviewCell.lblAmount setText:[[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"amount"] stringValue]];
    
    
    [trxviewCell.lblAut setText:[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"id"]];
    [trxviewCell.lblStatus setText:[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"status"]];
    
    if ([[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"status"] isEqualToString:@"Conciliada"]) {
        [trxviewCell.lblStatus setTextColor:[UIColor greenColor]];
    } else {
        [trxviewCell.lblStatus setTextColor:[UIColor redColor]];
    }
    
    return trxviewCell;
}

- (IBAction)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[(NSDictionary *)[_trxs objectAtIndex:indexPath.row] objectForKey:@"status"] isEqualToString:@"Conciliada"]) {
        InvoiceVC *invoiceVC = [[InvoiceVC alloc] init];
        [self performSegueWithIdentifier:@"invoiceVC" sender:invoiceVC];
    }
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
