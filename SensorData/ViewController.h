//
//  ViewController.h
//  SensorData
//
//  Created by ZHOUYING on 5/10/15.
//  Copyright (c) 2015 ZHOUYING. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) CMMotionManager *motionManager;

@end

