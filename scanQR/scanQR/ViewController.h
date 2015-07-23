//
//  ViewController.h
//  scanQR
//
//  Created by Alexis Padilla on 3/5/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreImage/CoreImage.h>

@interface ViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *loadingV;
@property (weak, nonatomic) IBOutlet UIView *viewPreview;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
//@property (weak, nonatomic) IBOutlet UILabel *lblPromp;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbitemCamera;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbitemPhotoStream;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbitemFile;

- (IBAction)startStopReading:(id)sender;
- (void)requestService:(NSString*)metadataString;
- (IBAction)sendFile:(id)sender;

@end
