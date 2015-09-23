//
//  SkillsControllerViewController.h
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 21/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCSkillView.h"
#import "CCSession.h"
#import "CCEmailManager.h"

@interface CCSkillsViewController : UIViewController<EmailManagerDelegate> {
    
    CCSession *session;
    CCEmailManager *email;
}

/*!
 *  @brief  Referencia do scroll view
 */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

/*!
 *  @brief  Containar com o conteudo do scroll view
 */
@property (weak, nonatomic) IBOutlet UIView *containerScrollView;

/*!
 *  @brief  Campo habilidade html
 */
@property (weak, nonatomic) IBOutlet CCSkillView *html;

/*!
 *  @brief  Campo habilidade Css
 */
@property (weak, nonatomic) IBOutlet CCSkillView *css;

/*!
 *  @brief  Campo habilidade Javascript
 */
@property (weak, nonatomic) IBOutlet CCSkillView *javascript;

/*!
 *  @brief  Campo habilidade Python
 */
@property (weak, nonatomic) IBOutlet CCSkillView *python;

/*!
 *  @brief  Campo habilidade Django
 */
@property (weak, nonatomic) IBOutlet CCSkillView *django;

/*!
 *  @brief  Campo habilidade iOS
 */
@property (weak, nonatomic) IBOutlet CCSkillView *ios;

/*!
 *  @brief  Campo habilidade Android
 */
@property (weak, nonatomic) IBOutlet CCSkillView *android;

/*!
 *  @brief  Evento de touch no botão para validar o formulario
 *
 *  @param sender objecto que disparou o evento
 */
- (IBAction)sendForm:(id)sender;
@end
