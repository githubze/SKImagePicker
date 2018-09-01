//
//  AppDelegate.h
//  SKImagePickerDemo
//
//  Created by 阿汤哥 on 2018/8/31.
//  Copyright © 2018年 徐泽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

