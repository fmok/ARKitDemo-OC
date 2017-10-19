//
//  FMARSCNViewController.m
//  ARKitDemo-OC
//
//  Created by fm on 2017/10/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "FMARSCNViewController.h"
#import "FMARSCNViewCotrol.h"

@interface FMARSCNViewController ()

@property (nonatomic, strong) FMARSCNViewCotrol *control;

@property (nonatomic, strong) ARSCNView *arSCNView;
@property (nonatomic, strong) ARSession *arSession;
@property (nonatomic, strong) ARWorldTrackingConfiguration *arWorldTrackingConfiguration;

@end

@implementation FMARSCNViewController

- (void)dealloc
{
    NSLog(@"\n*** %s ***\n", __func__);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.arSession runWithConfiguration:self.arWorldTrackingConfiguration options:ARSessionRunOptionResetTracking];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.arSCNView];
    [self initNodeWithRootView:self.arSCNView];
    [self addRotationToNode];
}

#pragma mark - Private methods
- (void)initNodeWithRootView:(ARSCNView *)scnView
{
    [scnView.scene.rootNode addChildNode:self.sunNode];
    
}

#pragma mark - Animation
- (void)addRotationToNode
{
    
    
    [self addRotationToSunNode];
}

- (void)addRotationToSunNode
{
    // Achieve a lava effect by animating textures
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"contentsTransform"];
    animation.duration = 10.0;
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeTranslation(0, 0, 0), CATransform3DMakeScale(3, 3, 3))];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeTranslation(1, 0, 0), CATransform3DMakeScale(3, 3, 3))];
    animation.repeatCount = FLT_MAX;
    [self.sunNode.geometry.firstMaterial.diffuse addAnimation:animation forKey:@"sun-texture"];
    
    animation = [CABasicAnimation animationWithKeyPath:@"contentsTransform"];
    animation.duration = 30.0;
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeTranslation(0, 0, 0), CATransform3DMakeScale(5, 5, 5))];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeTranslation(1, 0, 0), CATransform3DMakeScale(5, 5, 5))];
    animation.repeatCount = FLT_MAX;
    [self.sunNode.geometry.firstMaterial.multiply addAnimation:animation forKey:@"sun-texture2"];
}

#pragma mark - getters
- (FMARSCNViewCotrol *)control
{
    if (!_control) {
        _control = [[FMARSCNViewCotrol alloc] init];
        _control.vc = self;
    }
    return _control;
}

- (ARSCNView *)arSCNView
{
    if (!_arSCNView) {
        _arSCNView = [[ARSCNView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
        _arSCNView.session = self.arSession;
        _arSCNView.automaticallyUpdatesLighting = YES;
        _arSCNView.delegate = self.control;
    }
    return _arSCNView;
}

- (ARSession *)arSession
{
    if (!_arSession) {
        _arSession = [[ARSession alloc] init];
        _arSession.delegate = self.control;
    }
    return _arSession;
}

- (ARWorldTrackingConfiguration *)arWorldTrackingConfiguration
{
    if (!_arWorldTrackingConfiguration) {
        _arWorldTrackingConfiguration = [[ARWorldTrackingConfiguration alloc] init];
        _arWorldTrackingConfiguration.planeDetection = ARPlaneDetectionHorizontal;
        _arWorldTrackingConfiguration.lightEstimationEnabled = YES;
    }
    return _arWorldTrackingConfiguration;
}

- (SCNNode *)sunNode
{
    if (!_sunNode) {
        _sunNode = [[SCNNode alloc] init];
        _sunNode.geometry = [SCNSphere sphereWithRadius:0.25];
        _sunNode.position = SCNVector3Make(0, -0.1, 3);
        
        _sunNode.geometry.firstMaterial.multiply.contents = @"art.scnassets/earth/sun.jpg";
        _sunNode.geometry.firstMaterial.diffuse.contents = @"art.scnassets/earth/sun.jpg";
        _sunNode.geometry.firstMaterial.multiply.intensity = 0.5;
        _sunNode.geometry.firstMaterial.lightingModelName = SCNLightingModelConstant;
        
        _sunNode.geometry.firstMaterial.multiply.wrapS =
        _sunNode.geometry.firstMaterial.diffuse.wrapS  =
        _sunNode.geometry.firstMaterial.multiply.wrapT =
        _sunNode.geometry.firstMaterial.diffuse.wrapT  = SCNWrapModeRepeat;
        
        _sunNode.geometry.firstMaterial.locksAmbientWithDiffuse = YES;
    }
    return _sunNode;
}

- (SCNNode *)earthGroupNode
{
    if (!_earthGroupNode) {
        _earthGroupNode = [[SCNNode alloc] init];
        _earthGroupNode.position = SCNVector3Make(0.8, 0, 0);
    }
    return _earthGroupNode;
}

- (SCNNode *)earthNode
{
    if (!_earthNode) {
        _earthNode = [[SCNNode alloc] init];
        _earthNode.geometry = [SCNSphere sphereWithRadius:0.05];
    }
    return _earthNode;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
