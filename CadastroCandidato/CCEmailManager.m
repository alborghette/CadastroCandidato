//
//  CCEmailManager.m
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 23/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import "CCEmailManager.h"

//Constantes configuracao
NSString* const FROM_EMAIL   = @"fromEmail";
NSString* const RELAY_HOST   = @"relayHost";
NSString* const RELAY_PORT   = @"relayPort";
NSString* const LOGIN        = @"login";
NSString* const PASS         = @"pass";
NSString* const REQUIRE_AUTH = @"requiresAuth";
NSString* const WANTS_SECURE = @"wantsSecure";

NSString* const TO_EMAIL = @"toEmail";
NSString* const MESSAGE  = @"message";
NSString* const SUBJECT  = @"subject";

@implementation CCEmailManager

static CCEmailManager *SINGLETON = nil;

+ (CCEmailManager *)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SINGLETON = [[self alloc] init];
    });
    
    return SINGLETON;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        spinner = [CCSpinnerLoader sharedInstance];
        emails = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setEmailConfiguration:(NSDictionary *)emailConfig {
    emailConfiguration = emailConfig;
}

- (void)addEmailWithMessage:(NSString *)message toEmail:(NSString *)toEmail withSubject:(NSString *)subject {
    
    [emails addObject:[NSDictionary dictionaryWithObjectsAndKeys:message, MESSAGE,
                       toEmail, TO_EMAIL,
                       subject, SUBJECT, nil]];
}

- (void)sendEmail {
    
    // Verifica se ainda contem emails a serem enviados
    if (emails.count > 0) {
    
        NSDictionary *emailData = [emails lastObject];
        [emails removeLastObject];
        
        email = [[SKPSMTPMessage alloc] init];
        [email setDelegate:self];
        
        email.fromEmail    = emailConfiguration[FROM_EMAIL];
        email.relayHost    = emailConfiguration[RELAY_HOST];
        email.relayPorts   = emailConfiguration[RELAY_PORT];
        email.login        = emailConfiguration[LOGIN];
        email.pass         = emailConfiguration[PASS];
        email.requiresAuth = emailConfiguration[REQUIRE_AUTH];
        email.wantsSecure  = emailConfiguration[WANTS_SECURE];
        
        email.toEmail = emailData[TO_EMAIL];
        email.subject = emailData[SUBJECT];
        
        NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain; charset=UTF-8",kSKPSMTPPartContentTypeKey,
                               emailData[MESSAGE],kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
    
        email.parts = [NSArray arrayWithObjects:plainPart, nil];
        
        [spinner createSpinner];
        [email send];
    } else {
        [spinner removeSpinner];
        [self.delegate finishSendEmail];
    }
    
}

- (void)messageSent:(SKPSMTPMessage *)message {
    NSLog(@"Message was sent");
    [self sendEmail];
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error {
    NSLog(@"error code: %li \nlocalized description: %@", (long)error.code, error.localizedDescription);
    [self sendEmail];
}

@end
