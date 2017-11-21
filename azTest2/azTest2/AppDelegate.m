//
//  AppDelegate.m
//  azTest2
//
//  Created by DYG_Az on 2017/11/16.
//  Copyright © 2017年 DYG_Az. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "HomeViewController.h"
#import "ChattingViewController.h"
#import "PersonalViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 初始化窗口
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    
    HomeViewController * homevc = [[HomeViewController alloc] init];
    UINavigationController * homenav = [[UINavigationController alloc] initWithRootViewController:homevc];
    [[homenav tabBarItem] setTitle:@"Home"];
    
    ChattingViewController * chatvc = [[ChattingViewController alloc] init];;
    UINavigationController * chatnav = [[UINavigationController alloc] initWithRootViewController:chatvc];
    [[chatnav tabBarItem] setTitle:@"Chatting"];
    
    PersonalViewController * personalvc = [[PersonalViewController alloc] init];
    UINavigationController * personalnav = [[UINavigationController alloc] initWithRootViewController:personalvc];
    [[personalnav tabBarItem] setTitle:@"Personal"];
    
    
    UITabBarController * tabVC = [[UITabBarController alloc] init];
    [tabVC setViewControllers:@[homenav, chatnav, personalnav] animated:YES];
    
    [[self window] setRootViewController:tabVC];
    
    // 显示窗口
    [[self window] makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
