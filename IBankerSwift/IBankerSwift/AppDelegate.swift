//
//  AppDelegate.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/6.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit
import AVKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBar: RootTabBarController?
    let netReachability = NetworkReachabilityManager()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setUpKeywindow()
        
        setUpWelcome()
        
        // 设置后台响应
        UIApplication.shared.beginReceivingRemoteControlEvents()
        self.becomeFirstResponder()
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(AVAudioSessionCategoryPlayback)
        try? session.setActive(true)
        
        listenNetReachability()
        
        return true
    }
    
    //主窗口
    func setUpKeywindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        setUpControllers()
        
        window?.makeKeyAndVisible()
    }
    
    //创建tabbar为根控制器
    func setUpControllers() {
        let rootTabBar: RootTabBarController = RootTabBarController()
        window?.rootViewController = rootTabBar
        rootTabBar.delegate = self
        tabBar = rootTabBar
    }
    
    //创建视频欢迎页
    func setUpWelcome() {
        let vc: WelcomeViewController = WelcomeViewController()
        
        window?.rootViewController?.addChildViewController(vc)
        vc.didMove(toParentViewController: window?.rootViewController)
        window?.rootViewController?.view.addSubview(vc.view)
    }
    
    //网络状态监听
    func listenNetReachability() {
        netReachability?.startListening()
        netReachability?.listener = { status in
            if self.netReachability?.isReachable ?? false {
                /*
                 swift中有个双问号操作符(??)，可以用来快速对nil进行条件判断,今天来补充下双问号的用法，对于不期望某个optional值为nil时func返回nil 或者 因为其值为nil而停止了后续业务的情况下，我们可以用"??"在optionalValue为nil时做赋值保险操作（“??”操作后返回值为非optional）
                 
                 用法：newValue = optionalValue ?? value
                 若optionalValue非nil时，newValue的值为optionalValue的值，若optionalValue为nil时，newValue的值为value的值
                 
                 简单明了直接上例子：self.objectForKey(key)为nil时，object的值为0
                 
                 func validIntValueForKey(key: String) -> Int {
                 
                 let object = self.objectForKey(key) ?? Int(0)
                 
                 //do something
                 
                 }
                 
                 */
                switch status {
                case .notReachable:
                    print("The network is not reachable")
                case .unknown:
                    print("It is unknown whether the network is reachable")
                case .reachable(.ethernetOrWiFi):
                    print("通过WiFi链接")
                case .reachable(.wwan):
                    print("通过移动网络链接")
                }
                
            } else {
                print("网络不可用")
            }
        }
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}



