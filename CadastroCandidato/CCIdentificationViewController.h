//
//  ViewController.h
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 21/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCIdentificationViewController : UIViewController<UITextFieldDelegate> {
    /*!
     * @brief TextFiel com foco no momento (pode ser nil)
     */
    UITextField *currentFocused;
}


/*!
 *  @brief  Referencia do campo nome
 */
@property (weak, nonatomic) IBOutlet UITextField *txtName;

/*!
 *  @brief  Referencia do campo email
 */
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

/*!
 *  @brief  Referencia do evento de touch no botao para validar o formulario
 *
 *  @param sender objeto que disparou o evento
 */
- (IBAction)validateForm:(id)sender;

@end

