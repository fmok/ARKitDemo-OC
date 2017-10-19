//
//  FMARSCNViewCotrol.m
//  ARKitDemo-OC
//
//  Created by fm on 2017/10/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "FMARSCNViewCotrol.h"

@interface FMARSCNViewCotrol ()

@end


@implementation FMARSCNViewCotrol

#pragma mark - ARSCNViewDelegate
//- (nullable SCNNode *)renderer:(id <SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor
//{
//
//}

- (void)renderer:(id <SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
    NSLog(@"\n*** ddidAddNode : %s ***\n", __func__);
}

- (void)renderer:(id <SCNSceneRenderer>)renderer willUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
//    NSLog(@"\n*** willUpdateNode : %s ***\n", __func__);
}

- (void)renderer:(id <SCNSceneRenderer>)renderer didUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
//    NSLog(@"\n*** didUpdateNode : %s ***\n", __func__);
}

- (void)renderer:(id <SCNSceneRenderer>)renderer didRemoveNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
//    NSLog(@"\n*** didRemoveNode : %s ***\n", __func__);
}

#pragma mark - ARSessionDelegate
- (void)session:(ARSession *)session didUpdateFrame:(ARFrame *)frame
{
//    NSLog(@"\n*** didUpdateFrame : %s ***\n", __func__);
    //监听手机的移动，实现近距离查看太阳系细节，为了凸显效果变化值*3
    [self.vc.sunNode setPosition:SCNVector3Make(-3 * frame.camera.transform.columns[3].x, -0.1 - 3 * frame.camera.transform.columns[3].y, -2 - 3 * frame.camera.transform.columns[3].z)];
}

- (void)session:(ARSession *)session didAddAnchors:(NSArray<ARAnchor*>*)anchors
{
//    NSLog(@"\n*** didAddAnchors : %s ***\n", __func__);
}

- (void)session:(ARSession *)session didUpdateAnchors:(NSArray<ARAnchor*>*)anchors
{
//    NSLog(@"\n*** didUpdateAnchors : %s ***\n", __func__);
}

- (void)session:(ARSession *)session didRemoveAnchors:(NSArray<ARAnchor*>*)anchors
{
//    NSLog(@"\n*** didRemoveAnchors : %s ***\n", __func__);
}

@end
