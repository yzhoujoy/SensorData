//
//  ViewController.m
//  SensorData
//
//  Created by ZHOUYING on 5/10/15.
//  Copyright (c) 2015 ZHOUYING. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
  @property (weak, nonatomic) IBOutlet UITextField *xField;
  @property (weak, nonatomic) IBOutlet UITextField *yField;
  @property (weak, nonatomic) IBOutlet UITextField *zField;
  @property (weak, nonatomic) IBOutlet UITextField *gy_xField;
  @property (weak, nonatomic) IBOutlet UITextField *gy_yField;
  @property (weak, nonatomic) IBOutlet UITextField *gy_zField;
@property (weak, nonatomic) IBOutlet UITextField *mg_xField;
@property (weak, nonatomic) IBOutlet UITextField *mg_yField;
@property (weak, nonatomic) IBOutlet UITextField *mg_zField;
@property (weak, nonatomic) IBOutlet UILabel *ac_Label;
@property (weak, nonatomic) IBOutlet UILabel *gy_Label;
@property (weak, nonatomic) IBOutlet UILabel *mg_Label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.ac_Label.text = @"AccelerData";
    self.gy_Label.text = @"gyroData";
    self.mg_Label.text = @"mgData";
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.5;        //time interval
    self.motionManager.gyroUpdateInterval = 0.5;
    self.motionManager.magnetometerUpdateInterval = 0.5;
    
    
    if ([self.motionManager isAccelerometerAvailable] && [self.motionManager isGyroAvailable] && [self.motionManager isMagnetometerAvailable]) {
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [self.motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error){dispatch_async(dispatch_get_main_queue(), ^{
            self.xField.text = [NSString stringWithFormat:@"%.2f", accelerometerData.acceleration.x];
            self.yField.text = [NSString stringWithFormat:@"%.2f", accelerometerData.acceleration.y];
            self.zField.text = [NSString stringWithFormat:@"%.2f", accelerometerData.acceleration.z];
            NSLog(@"AC_x=%@\n", self.xField.text);
            NSLog(@"AC_y=%@\n", self.yField.text);
            NSLog(@"AC_z=%@\n", self.zField.text);
        });
        }];
        NSLog(@"gy begin\n");
        [self.motionManager startGyroUpdatesToQueue:queue withHandler:^(CMGyroData *gyroData, NSError *error){dispatch_async(dispatch_get_main_queue(), ^{
            
            self.gy_xField.text = [NSString stringWithFormat:@"%.2f", gyroData.rotationRate.x];
            self.gy_yField.text = [NSString stringWithFormat:@"%.2f", gyroData.rotationRate.y];
            self.gy_zField.text = [NSString stringWithFormat:@"%.2f", gyroData.rotationRate.z];
            NSLog(@"GY_x=%@\n", [NSString stringWithFormat:@"%.2f", gyroData.rotationRate.x]);
            NSLog(@"GY_y=%@\n", [NSString stringWithFormat:@"%.2f", gyroData.rotationRate.y]);
            NSLog(@"GY_z=%@\n", [NSString stringWithFormat:@"%.2f", gyroData.rotationRate.z]);
        });
        }];
        NSLog(@"mg begin\n");
        [self.motionManager startMagnetometerUpdatesToQueue:queue withHandler:^(CMMagnetometerData *mgData, NSError *error){dispatch_async(dispatch_get_main_queue(), ^{
            self.mg_xField.text = [NSString stringWithFormat:@"%.2f", mgData.magneticField.x];
            self.mg_yField.text = [NSString stringWithFormat:@"%.2f", mgData.magneticField.y];
            self.mg_zField.text = [NSString stringWithFormat:@"%.2f", mgData.magneticField.z];
            NSLog(@"MG_x=%@\n", [NSString stringWithFormat:@"%.2f", mgData.magneticField.x]);
            NSLog(@"MG_y=%@\n", [NSString stringWithFormat:@"%.2f", mgData.magneticField.y]);
            NSLog(@"MG_z=%@\n", [NSString stringWithFormat:@"%.2f", mgData.magneticField.z]);
        });
        }];
        
    }else
        NSLog(@"not activ");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
