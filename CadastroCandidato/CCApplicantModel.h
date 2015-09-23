//
//  ApplicantModel.h
//  CadastroCandidato
//
//  Created by Murilo Alborghette on 22/09/15.
//  Copyright © 2015 Murilo Alves Alborghette. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCApplicantModel : NSObject

/*!
 *  @brief  Nome do candidato
 */
@property (nonatomic, strong) NSString *name;

/*!
 *  @brief  Email do candidato
 */
@property (nonatomic, strong) NSString *email;

/*!
 *  @brief  Habilidade Html
 */
@property (nonatomic, assign) NSInteger html;

/*!
 *  @brief  Habilidade Css
 */
@property (nonatomic, assign) NSInteger css;

/*!
 *  @brief  Habilidade Javascript
 */
@property (nonatomic, assign) NSInteger javascript;

/*!
 *  @brief  Habilidade python
 */
@property (nonatomic, assign) NSInteger python;

/*!
 *  @brief  Habilidade Python
 */
@property (nonatomic, assign) NSInteger django;

/*!
 *  @brief  Habilidade iOS
 */
@property (nonatomic, assign) NSInteger ios;

/*!
 *  @brief  Habilidade Android
 */
@property (nonatomic, assign) NSInteger android;

@end
