//
//  SkillView.m
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 21/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import "CCSkillView.h"

@implementation CCSkillView

- (IBAction)sliderValueChanged:(id)sender {
    float sliderValue = _slider.value;
    [_rating setText:[NSNumber numberWithFloat:(roundf(sliderValue))].stringValue];
}

- (NSInteger)getRating {
    return _rating.text.integerValue;
}

@end
