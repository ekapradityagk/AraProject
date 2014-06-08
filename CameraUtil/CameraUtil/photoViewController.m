//
//  photoViewController.m
//  CameraUtil
//
//  Created by Eka Praditya GK on 6/8/14.
//  Copyright (c) 2014 Eka Praditya GK. All rights reserved.
//

#import "photoViewController.h"

@interface photoViewController (Private)
- (void)sendEmailMessage:(UIImage *)image;

@end

@implementation photoViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendEmailMessage:(UIImage *)image
{
    NSLog(@"Sending Email");
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc]init];
    picker.mailComposeDelegate = self;
    
    [picker setSubject:@"IOS Augmented Reality"];
    [picker setToRecipients:[NSArray arrayWithObjects:@"ekapradityagk@icloud.com", nil]];
    
    NSString *emailBody = @"oi oi, coba kirim ke email nih";
    
    [picker setMessageBody:emailBody isHTML:NO];
    NSData *data = UIImagePNGRepresentation(image);
    
    [picker addAttachmentData:data mimeType:@"image/png" fileName:@"screenshot"];
    
    [self presentModalViewController:picker animated:YES];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loadPhotoPicker:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    imagePicker.cameraDevice = UIImagePickerControllerCameraCaptureModeVideo;
    imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    imagePicker.showsCameraControls = NO;
    imagePicker.toolbarHidden = YES;
    imagePicker.navigationBarHidden = YES;
    imagePicker.wantsFullScreenLayout = YES;
    
    imagePicker.delegate = self;
    imagePicker.allowsEditing = NO;
    [self presentModalViewController:imagePicker animated:YES];
}

- (void) imagePickerController:(UIImagePickerController *)picker
 didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    NSString *pngPath = [NSHomeDirectory()stringByAppendingPathComponent:@"Documents/ConvertedPNG.png"];
    NSString *jpgPath = [NSHomeDirectory()stringByAppendingPathComponent:@"Documents/ConvertedJPG.jpg"];
    
    [UIImageJPEGRepresentation(image, 1.0)writeToFile:jpgPath atomically:YES];
    [UIImageJPEGRepresentation(image, 1.0)writeToFile:pngPath atomically:YES];
    
    //optional (check files)
    NSError *error;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *documentsDirectiory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSLog(@"Documents:  %@", [fileMgr contentsOfDirectoryAtPath:documentsDirectiory error:&error]);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    /*
    UIAlertView *alert;
    if (error) {
        alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                           message:@"Unable to save image to photo album"
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil, nil];
    }
    else
    {
        alert = [[UIAlertView alloc]initWithTitle:@"Success"
                                          message:@"Image saved to photo album"
                                         delegate:self
                                cancelButtonTitle:@"OK"
                                otherButtonTitles:nil, nil];
    }
    [alert show];
     */
    [self dismissModalViewControllerAnimated:NO];
    [self sendEmailMessage:image];
    
}

@end
