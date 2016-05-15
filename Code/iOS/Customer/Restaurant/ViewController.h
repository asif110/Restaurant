//
//  ViewController.h
//  Restaurant
//
//  Created by Asif Memon on 24/04/16.
//  Copyright © 2016 Asif Memon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSString * m_sName;
    NSString * m_sEmail;
    NSString * m_sPassword;
    NSString * m_sConfirmPasword;
}
@property (nonatomic, retain) IBOutlet UITextField* nameText;
@property (nonatomic, retain) IBOutlet UITextField* emailText;
@property (nonatomic, retain) IBOutlet UITextField* passwordText;
@property (nonatomic, retain) IBOutlet UITextField* confirmText;


@end

