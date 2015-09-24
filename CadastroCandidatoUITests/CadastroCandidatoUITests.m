//
//  CadastroCandidatoUITests.m
//  CadastroCandidatoUITests
//
//  Created by Murilo Alborghette on 21/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CadastroCandidatoUITests : XCTestCase

@end

@implementation CadastroCandidatoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLogin {
    
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *nomeCompletoTextField = app.textFields[@"Nome Completo"];
    [nomeCompletoTextField tap];
    [nomeCompletoTextField typeText:@"murilo"];
    
    XCUIElement *eMailTextField = app.textFields[@"E-mail"];
    [eMailTextField tap];
    [eMailTextField typeText:@"murilo.alves@outlook.com"];
    [eMailTextField typeText:@""];
    [app typeText:@"\n"];
    
}

@end
