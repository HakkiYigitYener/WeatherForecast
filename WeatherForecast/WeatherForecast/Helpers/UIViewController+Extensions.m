//
//  UIViewController+Extensions.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 24.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "UIViewController+Extensions.h"

@implementation UIViewController (Extensions)

UIAlertController* alertController;
UIActivityIndicatorView *indicator;

-(void)showAlertWithTitle:(NSString*)title message:(NSString*)message {
    alertController = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* closeAction = [UIAlertAction actionWithTitle:@"Tamam"
                                                          style:UIAlertActionStyleDefault
                                                        handler:nil];
    [alertController addAction:closeAction];
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];
}

-(void)showLoading {
    if (!indicator) {
        indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
        indicator.center = self.view.center;
        [self.view addSubview:indicator];
        [indicator bringSubviewToFront:self.view];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    }
    [indicator startAnimating];
}
-(void)hideLoading {
    [indicator stopAnimating];
}

@end
