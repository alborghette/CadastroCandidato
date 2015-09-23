//
//  SkillView.h
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 21/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCSkillView : UIView

/*!
 *  @brief  Referencia do slider de nota
 */
@property (weak, nonatomic) IBOutlet UISlider    *slider;

/*!
 *  @brief  Textfield com a nota
 */
@property (weak, nonatomic) IBOutlet UITextField *rating;

/*!
 *  @brief  Evento para detectar alteracao no slider
 *
 *  @param sender objeto que disparou o evento
 */
- (IBAction)sliderValueChanged:(id)sender;

/*!
 *  @brief  Recupera a nota atribuida
 *
 *  @return Int com a nota atribuída
 */
- (NSInteger)getRating;

@end
