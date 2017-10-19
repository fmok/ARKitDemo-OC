//
//  FMARSCNViewController.h
//  ARKitDemo-OC
//
//  Created by fm on 2017/10/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ARKit/ARKit.h>
#import <SceneKit/SceneKit.h>

@interface FMARSCNViewController : UIViewController

@property(nonatomic, strong) SCNNode *sunNode;
@property(nonatomic, strong) SCNNode *earthNode;
@property(nonatomic, strong) SCNNode *moonNode;
@property(nonatomic, strong) SCNNode *earthGroupNode;

@end
