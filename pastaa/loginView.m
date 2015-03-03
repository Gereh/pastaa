//
//  loginView.m
//  pastaa
//
//  Created by Amin on 3/3/15.
//  Copyright (c) 2015 Reza Sazegarnezhad. All rights reserved.
//

#import "loginView.h"

@implementation loginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)backToLoginPage:(id)sender {
    self.alpha=0;
}
- (UIViewController *)viewController {
    if ([self.nextResponder isKindOfClass:UIViewController.class])
        return (UIViewController *)self.nextResponder;
    else
        return nil;
}
//- (IBAction)loginBtn:(id)sender {
//    [self.viewController performSegueWithIdentifier:@"loginConfirmed" sender:self];
//}

@end
