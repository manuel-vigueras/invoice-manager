//
//  LoginVC.h
//  scanQR
//
//  Created by Alexis Padilla on 7/20/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController <UINavigationControllerDelegate, UITextFieldDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *loadingV;
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *cardTF;
@property (weak, nonatomic) IBOutlet UITextField *passTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

-(IBAction)doLogin:(id)sender;

-(void)textFieldWillBeginEditing:(UITextField *)sender;

-(void)setViewMovedUp:(BOOL)movedUp;

- (void)keyboardWillShow:(NSNotification *)notif;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
