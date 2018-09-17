//
//  AppDelegate+TabBarController.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/12.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import Foundation

// MARK: 设置tabBar的代理
extension AppDelegate: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("cilck tabbar")
        
        if let navi = viewController as? BaseNavigationController
        {
            let vc = navi.visibleViewController
            if vc is IMViewController
            {
                //如果未登录
                
                if let currentNavi = self.tabBar?.selectedViewController as? BaseNavigationController
                {
                    let loginVC = LoginViewController()
                    let loginNavi = BaseNavigationController(rootViewController: loginVC)
                    currentNavi.present(loginNavi, animated: true) {
                        
                    }
                    return false
                }
            }
        }
        
        
        /*
         if ([viewController isKindOfClass:[MMNavigationViewController class]])
         {
         MMNavigationViewController * navi = (MMNavigationViewController *)viewController;
         UIViewController * vc = navi.visibleViewController;
         if ([vc isKindOfClass:[IMViewController class]])
         {
         if (![[UserManager user].userIsLogin boolValue])
         {
         NewLoginViewController * vc = [[NewLoginViewController alloc] init];
         MMNavigationViewController * loginNavi = [[MMNavigationViewController alloc] initWithRootViewController:vc];
         MMNavigationViewController * currentNavi = (MMNavigationViewController *)self.selectedViewController;
         [currentNavi presentViewController:loginNavi animated:YES completion:nil];
         
         return NO;
         }
         }
         }
         */
        
        return true
    }
}
