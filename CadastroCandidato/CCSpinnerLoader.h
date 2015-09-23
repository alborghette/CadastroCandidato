//
//  SpinnerLoader.h
//
//  Created by Murilo Alborghette on 19/05/15.
//  Copyright (c) 2015 Mstech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CCSpinnerLoader : NSObject {
    UIActivityIndicatorView *spinner;
    UIWindow *window;
}

/*!
 *  @brief  Recupera a instancia SINGLETON da classe
 *
 *  @return Instancia compartilhada
 */
+(CCSpinnerLoader *)sharedInstance;

/*!
 *  @brief  Adiciona o spinner na tela
 */
-(void) createSpinner;

/*!
 *  @brief  Remove o spinner da tela
 */
-(void) removeSpinner;

/*!
 *  @brief  Atualiza as medidas do spinner na tela
 */
-(void) updateSpinner;

@end
