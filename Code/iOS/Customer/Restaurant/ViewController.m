//
//  ViewController.m
//  Restaurant
//
//  Created by Asif Memon on 24/04/16.
//  Copyright © 2016 Asif Memon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    -(bool)validateInput;
    -(BOOL) isValidEmail:(NSString *)checkString;
@end

@implementation ViewController
//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)handle:(id)sender {
    ViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"registrationComplete"];
    if (view)
    {
        //TODO why is this not working and alternative to second one
        //[self.navigationController pushViewController:view animated:YES];
        m_sName = _nameText.text;
        m_sPassword = _passwordText.text;
        m_sConfirmPasword = _confirmText.text;
        m_sEmail = _emailText.text;
        
        if ([self validateInput])
        {
            [self presentModalViewController:view animated:YES];
        }
    }
    
   }

-(bool)validateInput { //TODO localise and make code
    
    NSString *sMessage = @"Missing ";
    bool bValidated = true;
    
    if ( [m_sName isEqualToString:@""])
    {
        sMessage = [sMessage stringByAppendingString:@"name"];
        bValidated = false;
    }
    else if ( [m_sEmail isEqualToString:@""])
    {
        sMessage = [sMessage stringByAppendingString:@"email"];
        bValidated = false;
    }
    else if (! [self isValidEmail:m_sEmail] )
    {
        sMessage  = @"Please specify correct e-mail address";
        bValidated = false;
    }
        
    else if ( [m_sPassword isEqualToString:@""])
    {
        sMessage = [sMessage stringByAppendingString:@"password"];
        bValidated = false;
    }
    else if (! [m_sPassword isEqualToString:m_sConfirmPasword])
    {
        sMessage  = @"Please confirm correct password";
        bValidated = false;
    }
    
    if (!bValidated)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message:sMessage
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
        [alert show];
    }
    return bValidated;
    
}

-(BOOL) isValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

@end


