//
//  ViewController.m
//  scanQR
//
//  Created by Alexis Padilla on 3/5/15.
//  Copyright (c) 2015 Alexis Padilla. All rights reserved.
//

#import "ViewController.h"
#import "WebServices.h"

@interface ViewController ()

@property (nonatomic) BOOL isReading;

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) NSDictionary *response;
@property (nonatomic, strong) UIImage *photo;

-(BOOL)startReading;
-(void)stopReading;
-(void)loadBeepSound;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _isReading = NO;
    _captureSession = nil;
    
    [self loadBeepSound];
    
}

- (void) viewDidAppear:(BOOL)animated{
    [self startStopReading:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startStopReading:(id)sender {
    if (!_isReading) {
        if ([self startReading]) {
//            [_bbitemCamera setTitle:@"Stop"];
            [_lblStatus setText:@"Buscando"];
        }
    }
    else{
        [self stopReading];
//        [_bbitemCamera setTitle:@"Start!"];
    }
    
    _isReading = !_isReading;
}

- (IBAction)sendFile:(id)sender{
        //NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        WebServices *notesService = [[WebServices alloc] init];
        
        /*Consulta de servicio Historia Académica*/
        NSString *resultD = [[NSString alloc] initWithString:[notesService sendFileURl:[NSURL URLWithString:@"file:///private/var/mobile/Containers/Data/Application/076891F5-C583-4C0C-9C70-3D128B8A1F9A/Documents/Inbox/568030400921-12.pdf"] name:@"568030400921-12.pdf"]];
        NSLog(@"%@",resultD);
        
        //    [loadingView removeFromSuperview];
}

-(IBAction) getPhoto:(id) sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    
    // Don't forget to add UIImagePickerControllerDelegate in your .h
    picker.delegate = self;
    
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    
}

-(IBAction)setIP:(id)sender {
    
}



- (void)imagePickerController:(UIImagePickerController *)imagePicker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    //UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _photo =(UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageView *imgPhoto = [[UIImageView alloc] initWithImage:_photo];
    [imgPhoto setFrame:_viewPreview.layer.bounds];
    [_viewPreview addSubview:imgPhoto];
    
    CIContext *ciContext = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @(YES)}];
    NSDictionary *opts = [[NSDictionary alloc] initWithObjectsAndKeys:CIDetectorAccuracyHigh,CIDetectorAccuracy, nil];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:ciContext options:opts];
    
    NSArray *codeQRarray = [detector featuresInImage:_photo.CIImage options:opts];
    if ([codeQRarray count]> 0) {
        if ([[codeQRarray objectAtIndex:0] isEqualToString:AVMetadataObjectTypeQRCode]) {
            
            [_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:[[codeQRarray objectAtIndex:0] stringValue] waitUntilDone:NO];
            
            [self performSelectorOnMainThread:@selector(requestService:) withObject:[[codeQRarray objectAtIndex:0] stringValue] waitUntilDone:NO];
            
            if (_audioPlayer) {
                [_audioPlayer play];
            }
        }
    }
    
}


- (BOOL)startReading {
    NSError *error;
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    if (!input) {
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    _captureSession = [[AVCaptureSession alloc] init];
    [_captureSession addInput:input];
    
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:captureMetadataOutput];
    
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:_viewPreview.layer.bounds];
    [_viewPreview.layer addSublayer:_videoPreviewLayer];
    
    [_captureSession startRunning];
    
    return YES;
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            //[_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:[metadataObj stringValue] waitUntilDone:NO];
            [_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:@"Código capturado" waitUntilDone:NO];
            
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
            
//            [_bbitemCamera performSelectorOnMainThread:@selector(setTitle:) withObject:@"Start!" waitUntilDone:NO];
            _isReading = NO;
            
            [self performSelector:@selector(requestService:) withObject:[metadataObj stringValue]];
            
            if (_audioPlayer) {
                [_audioPlayer play];
            }
            
            
        }
    }
}


- (void) requestService:(NSString*)metadataString{
//    @autoreleasepool {
        //NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    UIAlertView *alert = [UIAlertView alloc];
    WebServices *notesService = [[WebServices alloc] init];
        
    /*Consulta de servicio Historia Académica*/
    NSString *resultD = [[NSString alloc] initWithString:[notesService sendQRCode:metadataString]];
    
    [self.view sendSubviewToBack:_loadingV];
    _loadingV.hidden = true;
    
    if ([resultD isEqualToString:@"success"]) {
        [_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:@"Código enviado" waitUntilDone:NO];
        [alert initWithTitle:@"Código enviado" message:@"El código ha sido enviado exitosamente" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        [alert initWithTitle:@"Error" message:[NSString stringWithFormat:@"Error al enviar información:\n%@", resultD] delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [alert show];
        [self startStopReading:nil];
    }
    
    //    [loadingView removeFromSuperview];
//    }
    
}



-(void)stopReading{
    [_captureSession stopRunning];
    _captureSession = nil;
    
    [_videoPreviewLayer removeFromSuperlayer];
    _loadingV.hidden = false;
    [self.view bringSubviewToFront:_loadingV];
}

-(void)loadBeepSound{
    NSString *beepFilePath = [[NSBundle mainBundle] pathForResource:@"beep" ofType:@"mp3"];
    NSURL *beepURL = [NSURL URLWithString:beepFilePath];
    NSError *error;
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:beepURL error:&error];
    if (error) {
        NSLog(@"Could not play beep file.");
        NSLog(@"%@", [error localizedDescription]);
    }
    else{
        [_audioPlayer prepareToPlay];
    }
}

- (IBAction)removeVC:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    
    return UIInterfaceOrientationPortrait;
    
}


@end
