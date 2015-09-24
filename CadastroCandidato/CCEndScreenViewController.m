//
//  EndScreenViewController.m
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 22/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import "CCEndScreenViewController.h"

@implementation CCEndScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startAgain:(id)sender {
    [self performSegueWithIdentifier:@"StartScreenSegue" sender:sender];
}
@end
