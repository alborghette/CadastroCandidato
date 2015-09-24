//
//  CCIdentificationViewControllerTests.m
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 24/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CCIdentificationViewController.h"
#import "CCSession.h"

@interface CCIdentificationViewControllerTests : XCTestCase

@property (nonatomic) CCIdentificationViewController *identificationVC;
@property (nonatomic) CCSession *session;

@end

@interface CCIdentificationViewController (Test)

- (void)saveApplicantIdentificationName:(NSString *)name andEmail:(NSString *)email;
- (BOOL)validadeField:(UITextField*)field;

@end

@implementation CCIdentificationViewControllerTests

- (void)setUp {
    [super setUp];
    _identificationVC = [[CCIdentificationViewController alloc] init];
    _session = [CCSession sharedInstance];
}

- (void)testSaveApplicantIdentification {
    NSString *name = @"Name";
    NSString *email = @"Email";
    
    [_identificationVC saveApplicantIdentificationName:name andEmail:email];
    
    XCTAssertEqualObjects(name, _session.applicant.name);
    XCTAssertEqualObjects(email, _session.applicant.email);
}

- (void)testValidadeField {
    UITextField *textfield = [[UITextField alloc] init];
    
    [textfield setText:@"Teste 123"];
    
    XCTAssertTrue([_identificationVC validadeField:textfield]);
}

@end
