//
//  LoginViewController.m
//  pastaa
//
//  Created by Amin on 3/2/15.
//  Copyright (c) 2015 Reza Sazegarnezhad. All rights reserved.
//

#import "LoginViewController.h"
#import "registerView.h"
#import "loginView.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    [visualEffectView setFrame:self.view.bounds];
//    [self.view addSubview:visualEffectView];
//    visualEffectView.alpha=0;

    
    
    
    NSArray * regObjects = [[NSBundle mainBundle] loadNibNamed:@"registerView" owner:self options:nil];
    
    
    
    for(id currentObject in regObjects)
    {
        if([currentObject isKindOfClass:[UIView class]])
        {
            regView=(registerView*)currentObject;
            [((registerView*)regView).registerBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
            [((registerView*)regView).backBtn addTarget:self action:@selector(registerBackAction:) forControlEvents:UIControlEventTouchUpInside];
            
            userNameTextField= ((registerView*)regView).userNameTextField;
            passwordTextField= ((registerView*)regView).passwordTextField;
            userEmailTextField= ((registerView*)regView).userEmailTextField;
            
        
        }
        
    }
    NSArray * logObjects = [[NSBundle mainBundle] loadNibNamed:@"loginView" owner:self options:nil];
    
    
    
    for(id currentObject in logObjects)
    {
        if([currentObject isKindOfClass:[UIView class]])
        {
            logView=(loginView*)currentObject;
            [((loginView*)logView).loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
            [((loginView*)logView).backBtn addTarget:self action:@selector(loginBackAction:) forControlEvents:UIControlEventTouchUpInside];
       
        }
        
        
    }
    regView.frame=self.view.frame;
    regView.alpha=0;
    [self.view addSubview:regView];
    [self.view bringSubviewToFront:regView];
    logView.frame=self.view.frame;
    logView.alpha=0;
    [self.view addSubview:logView];
    [self.view bringSubviewToFront:logView];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerButtonClicked:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        regView.alpha=1;
        self.pageTitle.alpha=0;
        self.registerOutlet.alpha=0;
        self.loginOutlet.alpha=0;
        

        
        CGFloat currentScale = self.view.frame.size.width / self.view.frame.size.height;
        CGFloat newScale = currentScale * 2;
        
        
        CGAffineTransform iTransform = CGAffineTransformMakeScale(newScale, newScale);
        _loginBackgroundImage.transform = iTransform;
        

    }];
    

}
- (IBAction)loginButtonPressed:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        logView.alpha=1;
        self.pageTitle.alpha=0;
        self.registerOutlet.alpha=0;
        self.loginOutlet.alpha=0;
      
        CGFloat currentScale = self.view.frame.size.width / self.view.frame.size.height;
        CGFloat newScale = currentScale * 2;
        
        
        CGAffineTransform iTransform = CGAffineTransformMakeScale(newScale, newScale);
        _loginBackgroundImage.transform = iTransform;
        
        
   //     visualEffectView.alpha=1;
        
        
    }];
}
-(void)loginBackAction:(UIButton*)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        logView.alpha=0;
        self.pageTitle.alpha=1;
        self.registerOutlet.alpha=1;
        self.loginOutlet.alpha=1;
        
        CGFloat newScale = 1;
        
        
        CGAffineTransform iTransform = CGAffineTransformMakeScale(newScale, newScale);
        _loginBackgroundImage.transform = iTransform;
     //   visualEffectView.alpha=0;

    }];

    
}
-(void)registerAction:(UIButton*)sender{
 
    
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"دریافت اطلاعات ...";
    [hud show:YES];
    // Show the HUD while the provided method executes in a new thread
    

    
    
    //1
    PFUser *user = [PFUser user];
    
    //2
    user.username =userNameTextField.text;
    user.password =passwordTextField.text;
    user.email =userEmailTextField.text;
    
    //3
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //The registration was successful, go to the wall
            
            [hud hide:YES];

            [self performSegueWithIdentifier:@"loginConfirmed" sender:self];
            
            
        } else {
            //Something bad has occurred
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"خطا" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
            
            [hud hide:YES];

        }
    }];

    
    
    
}
-(void)registerBackAction:(UIButton*)sender{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        regView.alpha=0;
        self.pageTitle.alpha=1;
        self.registerOutlet.alpha=1;
        self.loginOutlet.alpha=1;
        
        CGFloat newScale = 1;
        
        
        CGAffineTransform iTransform = CGAffineTransformMakeScale(newScale, newScale);
        _loginBackgroundImage.transform = iTransform;
        //   visualEffectView.alpha=0;
        
    }];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
-(void)loginAction:(UIButton*)sender{
    [self performSegueWithIdentifier:@"loginConfirmed" sender:self];
}
@end
