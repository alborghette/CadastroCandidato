//
//  CCSession.h
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 23/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCApplicantModel.h"

/*!
 *  @brief  Classe responsável por guardar a referencia do model do candidato.
 */
@interface CCSession : NSObject

/*!
 *  @brief  Model do candidato
 */
@property (nonatomic, strong) CCApplicantModel *applicant;

/*!
 *  @brief  Recupera a instancia SINGLETON da classe
 *
 *  @return Instancia compartilhada
 */
+ (CCSession *)sharedInstance;

@end
