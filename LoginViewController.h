//
//  LoginViewController.h
//  pastaa
//
//  Created by Amin on 3/2/15.
//  Copyright (c) 2015 Reza Sazegarnezhad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MBProgressHUD.h"

@interface LoginViewController : UIViewController
{
    UIView* regView;
    UIView* logView;
    UIVisualEffectView *visualEffectView;
    UITextField * userNameTextField;
    UITextField * passwordTextField;
    UITextField * userEmailTextField;
    MBProgressHUD *hud;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *pageTitle;
@property (weak, nonatomic) IBOutlet UIButton *loginOutlet;
@property (weak, nonatomic) IBOutlet UIButton *registerOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *loginBackgroundImage;



@end
