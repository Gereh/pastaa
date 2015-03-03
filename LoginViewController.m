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
    
    NSArray * regObjects = [[NSBundle mainBundle] loadNibNamed:@"registerView" owner:self options:nil];
    
    
    
    for(id currentObject in regObjects)
    {
        if([currentObject isKindOfClass:[UIView class]])
        {
            regView=(registerView*)currentObject;
        }
        
    }
    NSArray * logObjects = [[NSBundle mainBundle] loadNibNamed:@"loginView" owner:self options:nil];
    
    
    
    for(id currentObject in logObjects)
    {
        if([currentObject isKindOfClass:[UIView class]])
        {
            logView=(loginView*)currentObject;
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
    }];
}
- (IBAction)loginButtonPressed:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        logView.alpha=1;
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

@end
