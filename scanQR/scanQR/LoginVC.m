//
//  LoginVC.m
//  scanQR
//
//  Created by Alexis Padilla on 7/20/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import "LoginVC.h"
#import "MenuVC.h"
#import "WebServices.h"

#define kOFFSET_FOR_KEYBOARD 150.0;

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) requestService{
    @autoreleasepool {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        WebServices *notesService = [[WebServices alloc] init];
        
        NSString *resultD;
        NSString *card = [prefs stringForKey:@"card_preference"];
        NSString *pass = [prefs stringForKey:@"pass_preference"];
        if (!([card isEqual:nil]||[pass isEqual:nil])) {
            resultD = [[NSString alloc] initWithString:[notesService logingWithCard:card andPass:pass]];
        } else {
            resultD = [[NSString alloc] initWithString:[notesService logingWithCard:_cardTF.text andPass:_passTF.text]];
        }
        
        if([resultD isEqualToString:@"CORRECTO"]){
            
            [self.view sendSubviewToBack:_loadingV];
            _loadingV.hidden = true;
            MenuVC *menuVC = [[MenuVC alloc] init];
            [self performSegueWithIdentifier:@"menuVC" sender:menuVC];
        }
        else{
            
            [self.view sendSubviewToBack:_loadingV];
            _loadingV.hidden = true;
            UIAlertView *alertError = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Tarjeta y/o contraseña invalidos. Revise sus datos y vuelva a intentar" delegate:[self.navigationController.viewControllers lastObject] cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
            [alertError show];
        }
    }
    
}

-(IBAction)doLogin:(id)sender{
    _loadingV.hidden = false;
    [self.view bringSubviewToFront:_loadingV];
    [self performSelector:@selector(requestService) withObject:nil afterDelay:0.01];
    [_cardTF setText:@""];
    [_passTF setText:@""];
}

#pragma mark - Behavior's TextFields

-(void)textFieldWillBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:_cardTF]||[sender isEqual:_passTF])
    {
        //move the main view, so that the keyboard does not hide it.
//        if (actualOrientation==UIInterfaceOrientationPortrait||actualOrientation==UIInterfaceOrientationPortraitUpsideDown){
            if  (self.view.frame.origin.y >= 0)
                [self setViewMovedUp:YES];
//        }else{
//            if  (self.view.frame.origin.x >= 0)
//                [self setViewMovedUp:YES];
//        }
    }
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
//    if (actualOrientation==UIInterfaceOrientationPortrait||actualOrientation==UIInterfaceOrientationPortraitUpsideDown){
        if (movedUp)
        {
            // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
            // 2. increase the size of the view so that the area behind the keyboard is covered up.
            rect.origin.y -= kOFFSET_FOR_KEYBOARD;
            rect.size.height += kOFFSET_FOR_KEYBOARD;
        }
        else
        {
            // revert back to the normal state.
            rect.origin.y += kOFFSET_FOR_KEYBOARD;
            rect.size.height -= kOFFSET_FOR_KEYBOARD;
        }
//    }else{
//        if (movedUp)
//        {
//            // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
//            // 2. increase the size of the view so that the area behind the keyboard is covered up.
//            rect.origin.x -= kOFFSET_FOR_KEYBOARD;
//            rect.size.width += kOFFSET_FOR_KEYBOARD;
//        }
//        else
//        {
//            // revert back to the normal state.
//            rect.origin.x += kOFFSET_FOR_KEYBOARD;
//            rect.size.width -= kOFFSET_FOR_KEYBOARD;
//        }
//    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

//- (void)keyboardWasShown:(NSNotification*)aNotification {
//    UIView *activeField = _passTF.viewForBaselineLayout;
//    NSDictionary* info = [aNotification userInfo];
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    CGRect bkgndRect = activeField.superview.frame;
//    bkgndRect.size.height += kbSize.height;
//    [activeField.superview setFrame:bkgndRect];
//    [_scrollView setContentOffset:CGPointMake(0.0, activeField.frame.origin.y-kbSize.height) animated:YES];
//}

- (void)keyboardWillShow:(NSNotification *)notif
{
    //keyboard will be shown now. depending for which textfield is active, move up or move down the view appropriately
//    if (actualOrientation==UIInterfaceOrientationPortrait||actualOrientation==UIInterfaceOrientationPortraitUpsideDown){
        if(([_cardTF isFirstResponder]||[_passTF isFirstResponder]) && self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
        else if(!([_cardTF isFirstResponder]||[_passTF isFirstResponder]) && self.view.frame.origin.y < 0)
        {
            [self setViewMovedUp:NO];
        }
//    }else{
//        if(([tCount isFirstResponder]||[tDigit isFirstResponder]||[tPass isFirstResponder]) && self.view.frame.origin.x >= 0)
//        {
//            [self setViewMovedUp:YES];
//        }
//        else if(([tCount isFirstResponder]||[tDigit isFirstResponder]||[tPass isFirstResponder]) && self.view.frame.origin.x < 0)
//        {
//            [self setViewMovedUp:NO];
//        }
//    }
}

- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:self.view.window];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [_cardTF resignFirstResponder];
        [_passTF resignFirstResponder];
//        if (actualOrientation==UIInterfaceOrientationPortrait||actualOrientation==UIInterfaceOrientationPortraitUpsideDown){
            if (self.view.frame.origin.y < 0)
                [self setViewMovedUp:NO];
//        }else{
//            if (self.view.frame.origin.x < 0)
//                [self setViewMovedUp:NO];
//        }
    }
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
        if (textField.text.length>=8) {
            [self setViewMovedUp:NO];
            [self doLogin:nil];
        }
        else{
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"La contraseña debe contener 8 o más caracteres" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
            [alertV show];
        }
        
    }
    return NO; // We do not want UITextField to insert line-breaks.
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
