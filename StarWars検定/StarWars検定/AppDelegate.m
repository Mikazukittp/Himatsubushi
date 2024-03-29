//
//  AppDelegate.m
//  StarWars検定
//
//  Created by 石部達也 on 2015/06/14.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "AppDelegate.h"
#import "MMTopViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    MMTopViewController *viewController = [[MMTopViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:viewController];
    viewController.title = @"NARUTO検定";
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"戻る";
    viewController.navigationItem.backBarButtonItem = barButton;
    
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.255 green:0.275 blue:0.302 alpha:1.000];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [UINavigationBar appearance].tintColor =[UIColor whiteColor];
    
    [nc setNavigationBarHidden:NO animated:NO];
    
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    
    
    return YES;

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
