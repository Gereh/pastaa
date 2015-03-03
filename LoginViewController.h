//
//  LoginViewController.h
//  pastaa
//
//  Created by Amin on 3/2/15.
//  Copyright (c) 2015 Reza Sazegarnezhad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    UIView* regView;
    UIView* logView;
    UIButton* registerButton;
    UIButton* loginButton;
}
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *pageTitle;
@property (weak, nonatomic) IBOutlet UIButton *loginOutlet;
@property (weak, nonatomic) IBOutlet UIButton *registerOutlet;
@end
