//
//  FMARSCNViewCotrol.h
//  ARKitDemo-OC
//
//  Created by fm on 2017/10/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMARSCNViewController.h"

@interface FMARSCNViewCotrol : NSObject<
    ARSCNViewDelegate,
    ARSessionDelegate>

@property (nonatomic, weak) FMARSCNViewController *vc;

@end
