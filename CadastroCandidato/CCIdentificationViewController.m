//
//  ViewController.m
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 21/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import "CCIdentificationViewController.h"
#import "CCSession.h"
#import "NSString+Email.h"

#define kOFFSET_FOR_KEYBOARD 80.0

@implementation CCIdentificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Configura os delegates dos campos de texto
    [_txtName setDelegate:self];
    [_txtEmail setDelegate:self];
    
    // Configura os layouts de teclado
    [_txtName setReturnKeyType:UIReturnKeyNext];
    [_txtEmail setReturnKeyType:UIReturnKeyDone];
    [_txtEmail setKeyboardType:UIKeyboardTypeEmailAddress];
    
    
    // Define a cor dos placeholders dos campos de texto
    UIColor *placeholderTextColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    [_txtName setValue:placeholderTextColor forKeyPath:@"_placeholderLabel.textColor"];
    [_txtEmail setValue:placeholderTextColor forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // Adiciona evento para detectar quando o teclado esta ativo
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    // Adiciona evento para detectar quando o teclado foi desativado
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // Remove os eventos adicionados
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}


- (IBAction)validateForm:(id)sender {
    
    // Remove o teclado
    currentFocused = nil;
    [self.view endEditing:YES];
    
    // Verifica se os campos foram preenchidos
    if ([self validadeField:_txtName] && [self validadeField:_txtEmail] && [_txtEmail.text isValidEmail]) {
        
        // Armazena os campos de nome e email
        CCSession *session = [CCSession sharedInstance];
        [session.applicant setName:_txtName.text];
        [session.applicant setEmail:_txtEmail.text];
        
        // Chama a próxima tela
        [self performSegueWithIdentifier:@"SkillsScreenSegue" sender:sender];
    } else {
        
        // Verifica qual campo nao esta preenchido
        if (![self validadeField:_txtName]) {
            [self showErrorMessage:@"Nome"];
        } else if (![self validadeField:_txtEmail] || ![_txtEmail.text isValidEmail]) {
            [self showErrorMessage:@"Email"];
        }
    }
}

/*!
 *  @brief  Retorna se o campo de texto esta preenchido
 *
 *  @param field campo de texto
 *
 *  @return BOOL retorna YES caso esteja preenchido
 */
- (BOOL)validadeField:(UITextField*)field {
    return field.text.length;
}

/*!
 *  @brief  Exibe mensagem de texto informando o problema
 *
 *  @param errorField Nome do campo nao preenchido
 */
- (void)showErrorMessage:(NSString *)errorField {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Atenção"
                                                                   message:[NSString stringWithFormat:@"Por favor, preencha corretamente o campo %@", errorField]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   [alert dismissViewControllerAnimated:YES completion:nil];
                               }];
    
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}



/*!
 *  @brief  Recebe o evento de touch no botao Return
 *
 *  @param textField campo de texto que esta em edicao
 *
 *  @return retorno para continuacao do evento
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (currentFocused != nil) {
        [currentFocused resignFirstResponder];
    }
    
    // Verifica em qual campo esta a edicao
    if (textField == _txtName) {
        // Vai para o proximo campo
        currentFocused = _txtEmail;
    } else if (textField == _txtEmail) {
        // Inicia a validacao
        [self validateForm:nil];
    }
    
    if (currentFocused != nil) {
        [currentFocused becomeFirstResponder];
    }
    
    return YES;
}


/*!
 *  @brief  Metodo disparado quando o teclado sera exibido, realiza o scroll para que os campo nao sejam escondidos pelo teclado
 */
- (void)keyboardWillShow {
    if (self.view.frame.origin.y >= 0) {
        [self moveTextfieldToUp:YES];
    }
}

/*!
 *  @brief  Metodo disparado quando o teclado sera removido, realiza o scroll dos campos de texto para a posicao original
 */
- (void)keyboardWillHide {
    if (self.view.frame.origin.y < 0) {
        [self moveTextfieldToUp:NO];
    }
}



/*!
 *  @brief  Realiza a animacao para o textfield nao ficar encoberto pelo teclado
 *
 *  @param move teclado showed
 */
- (void)moveTextfieldToUp:(BOOL)move {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    
    if (move) {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
//        rect.size.height += kOFFSET_FOR_KEYBOARD;
        
    } else {
        
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
//        rect.size.height -= kOFFSET_FOR_KEYBOARD;
        
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

@end
