//
//  SpinnerLoader.m
//  bluepad-ios
//
//  Created by Murilo Alborghette on 19/05/15.
//  Copyright (c) 2015 Mstech. All rights reserved.
//

#import "CCSpinnerLoader.h"

@implementation CCSpinnerLoader

+(CCSpinnerLoader *)sharedInstance
{
    static CCSpinnerLoader *_spinnerLoader = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _spinnerLoader = [[self alloc] init];
    });
    
    return _spinnerLoader;
}

-(id) init{
    window = [[UIApplication sharedApplication] keyWindow];
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    return self;
}

-(void) createSpinner {
    if (!spinner.isAnimating) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner setFrame:CGRectMake(0.0, 0.0, window.frame.size.width, window.frame.size.height)];
            [spinner setBackgroundColor:[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.5]];
            [spinner setCenter:CGPointMake(window.frame.size.width/2.0, window.frame.size.height/2.0)];
            [window addSubview:spinner];
            [spinner startAnimating];
        });
    }
}

-(void) updateSpinner {
    if (spinner.isAnimating) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner setFrame:CGRectMake(0.0, 0.0, window.frame.size.width, window.frame.size.height)];
            [spinner setBackgroundColor:[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.5]];
            [spinner setCenter:CGPointMake(window.frame.size.width/2.0, window.frame.size.height/2.0)];
        });
    }
}

-(void) removeSpinner {
    dispatch_async(dispatch_get_main_queue(), ^{
        [spinner stopAnimating];
        [spinner removeFromSuperview];
    });
    
}

@end
