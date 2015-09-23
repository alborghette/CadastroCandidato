//
//  CCSession.m
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 23/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import "CCSession.h"

@implementation CCSession

static CCSession *SINGLETON = nil;

+ (CCSession *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SINGLETON = [[self alloc] init];
    });
    
    return SINGLETON;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _applicant = [[CCApplicantModel alloc] init];
    }
    return self;
}

@end
