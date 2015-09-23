//
//  SkillsControllerViewController.m
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 21/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import "CCSkillsViewController.h"

NSInteger const RATING = 7;

@implementation CCSkillsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    session = [CCSession sharedInstance];
    // Recupera a instancia de email
    email = [CCEmailManager sharedInstance];
    [email setDelegate:self];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // Define o tamanho do scrollview de acordo com o conteudo
    self.scrollview.contentSize = self.containerScrollView.frame.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sendForm:(id)sender {
    // Armazena as habilidades
    [self completeForm];
    
    // Envia o email
    [self sendEmail];
}

/*!
 *  @brief  Armazena os dados das habilidades do candidato
 */
- (void)completeForm {
    [session.applicant setHtml:[_html getRating]];
    [session.applicant setCss:[_css getRating]];
    [session.applicant setJavascript:[_javascript getRating]];
    [session.applicant setPython:[_python getRating]];
    [session.applicant setDjango:[_django getRating]];
    [session.applicant setIos:[_ios getRating]];
    [session.applicant setAndroid:[_android getRating]];
}

/*!
 *  @brief  Realiza o envio de email
 */
- (void)sendEmail {
    
    BOOL profile = NO;
    
    
    
    // Configuracao do client de email    
    NSDictionary *emailConfiguration = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Email" ofType:@"plist"]];
    
    [email setEmailConfiguration:emailConfiguration];
    
    // Define o email do candidato
    NSString *toEmail = session.applicant.email;
    
    // Define o assunto do email
    NSString *subject = @"Obrigado por se candidatar";
    
    
    // Recupera a nota em FRONT-END e verifica se deve enviar email
    if (session.applicant.html > RATING && session.applicant.css > RATING && session.applicant.javascript > RATING) {
        profile = YES;
        
        
        [email addEmailWithMessage:@"Obrigado por se candidatar, assim que tivermos uma vaga disponível para programador Front-End entraremos em contato."
                   toEmail:toEmail
               withSubject:subject];
    }
    
    // Recupera a nota em BACK-END e verifica se deve enviar email
    if (session.applicant.python > RATING && session.applicant.django > RATING) {
        profile = YES;
        
        [email addEmailWithMessage:@"Obrigado por se candidatar, assim que tivermos uma vaga disponível para programador Back-End entraremos em contato."
                   toEmail:toEmail
               withSubject:subject];
    }
    
    // Recupara a nota em MOBILE e verifica se deve enviar email
    if (session.applicant.ios > RATING && session.applicant.android > RATING) {
        profile = YES;
        
        [email addEmailWithMessage:@"Obrigado por se candidatar, assim que tivermos uma vaga disponível para programador Mobile entraremos em contato."
                   toEmail:toEmail
               withSubject:subject];
    }
    
    // Caso nao tanha nenhuma especialidade
    if (!profile) {
        [email addEmailWithMessage:@"Obrigado por se candidatar, assim que tivermos uma vaga disponível para programador entraremos em contato."
                    toEmail:toEmail
               withSubject:subject];
    }
    
    [email sendEmail];
}

/*!
 *  @brief  Chama a tela final
 */
- (void)finishSendEmail {
    [self performSegueWithIdentifier:@"EndScreenSegue" sender:nil];
}

@end
