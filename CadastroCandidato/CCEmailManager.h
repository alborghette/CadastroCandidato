//
//  CCEmailManager.h
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 23/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKPSMTPMessage.h"
#import "CCSpinnerLoader.h"

@protocol EmailManagerDelegate <NSObject>

- (void)finishSendEmail;

@end

@interface CCEmailManager : NSObject<SKPSMTPMessageDelegate> {
    
    /*!
     *  @brief  Dicionario com as configuracoes do cliente de email
     */
    NSDictionary *emailConfiguration;
    
    /*!
     *  @brief  Array que armazenara os emails que serao enviados
     */
    NSMutableArray *emails;
    
    /*!
     *  @brief  Referencia do email que sera enviado
     */
    SKPSMTPMessage *email;
    
    /*!
     *  @brief  Spinner para indicacao de processamento interno
     */
    CCSpinnerLoader *spinner;
}

/*!
 *  @brief  Delegate para informar o termino do processamento
 */
@property (nonatomic, strong) id<EmailManagerDelegate> delegate;

/*!
 *  @brief  Contante utilizada para o parametro FROM_EMAIL das configuracoes do cliente de email
 */
extern NSString* const FROM_EMAIL;

/*!
 *  @brief  Contante utilizada para o parametro RELAY_HOST das configuracoes do cliente de email
 */
extern NSString* const RELAY_HOST;

/*!
 *  @brief  Contante utilizada para o parametro RELAY_PORT das configuracoes do cliente de email
 */
extern NSString* const RELAY_PORT;

/*!
 *  @brief  Contante utilizada para o parametro LOGIN das configuracoes do cliente de email
 */
extern NSString* const LOGIN;

/*!
 *  @brief  Contante utilizada para o parametro PASS das configuracoes do cliente de email
 */
extern NSString* const PASS;

/*!
 *  @brief  Contante utilizada para o parametro REQUIRE_AUTH das configuracoes do cliente de email
 */
extern NSString* const REQUIRE_AUTH;

/*!
 *  @brief  Contante utilizada para o parametro WANTS_SECURE das configuracoes do cliente de email
 */
extern NSString* const WANTS_SECURE;

/*!
 *  @brief  Recupera a instancia SINGLETON da classe
 *
 *  @return Instancia compartilhada
 */
+ (CCEmailManager *)sharedInstance;

/*!
 *  @brief  Aplica as configuracoes do cliente de email necessarias
 *
 *  @param emailConfig dicionario com as configuracoes sendo necessarios os parametros: 
 *          <br>emailConfiguration[FROM_EMAIL];
 *          <br>emailConfiguration[RELAY_HOST];
 *          <br>emailConfiguration[RELAY_PORT];
 *          <br>emailConfiguration[LOGIN];
 *          <br>emailConfiguration[PASS];
 *          <br>emailConfiguration[REQUIRE_AUTH];
 *          <br>emailConfiguration[WANTS_SECURE];
 */
- (void)setEmailConfiguration:(NSDictionary *)emailConfig;

/*!
 *  @brief  Adiciona um novo email para a fila de email para serem enviados
 *
 *  @param message Mensagem que sera enviada
 *  @param toEmail Email para o qual será enviado
 *  @param subject Assunto do email
 */
- (void)addEmailWithMessage:(NSString *)message toEmail:(NSString *)toEmail withSubject:(NSString *)subject;

/*!
 *  @brief  Inicia o envio de email da fila
 */
- (void)sendEmail;
@end
