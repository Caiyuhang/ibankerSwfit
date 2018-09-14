//
//  RootTabBarController.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/6.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    var vcsArray: [BaseNavigationController] = [BaseNavigationController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAllViewControllers()
    }
    
    //设置tabBar的VCS
    func setUpAllViewControllers() {
        
        let homeVC: HomeViewController = HomeViewController()
        configChildController(withController: homeVC, normalImg: "tabbar_home_normal", selectImg: "tabbar_home_select", itemTitle: "首页")
        
        let ibankerVC: IbankerViewController = IbankerViewController()
        configChildController(withController: ibankerVC, normalImg: "tabbar_ibanker_normal", selectImg: "tabbar_ibanker_select", itemTitle: "ibanker")
        
        let imVC: IMViewController = IMViewController()
        configChildController(withController: imVC, normalImg: "tabbar_im_normal", selectImg: "tabbar_im_select", itemTitle: "IM")
        
        let productVC: ProductViewController = ProductViewController()
        configChildController(withController: productVC, normalImg: "tabbar_product_normal", selectImg: "tabbar_product_select", itemTitle: "产品")
        
        let myVC: MyViewController = MyViewController()
        configChildController(withController: myVC, normalImg: "tabbar_my_normal", selectImg: "tabbar_my_select", itemTitle: "我的")
        
        viewControllers = vcsArray
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RootTabBarController {
    
    //配置控制器的
    fileprivate func configChildController(withController controller: UIViewController, normalImg image1: String, selectImg image2: String, itemTitle title: String) {
        
        let navController: BaseNavigationController = BaseNavigationController(rootViewController: controller)
        
        controller.tabBarItem.image = UIImage(named: image1)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        controller.tabBarItem.selectedImage = UIImage(named: image2)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        var normalDict = [NSAttributedStringKey: Any]()
        normalDict.updateValue(UIFont.systemFont(ofSize: 10), forKey: NSAttributedStringKey.font)
        normalDict.updateValue(UIColor.colorWithHexString(hex: "#828b97"), forKey: NSAttributedStringKey.foregroundColor)
        
        var selectDict = [NSAttributedStringKey: Any]()
        selectDict.updateValue(UIFont.systemFont(ofSize: 10), forKey: NSAttributedStringKey.font)
        selectDict.updateValue(UIColor.colorWithHexString(hex: "#0f9296"), forKey: NSAttributedStringKey.foregroundColor)
        
        controller.tabBarItem.setTitleTextAttributes(normalDict, for: UIControlState.normal)
        controller.tabBarItem.title = title
        
        
        vcsArray.append(navController)
    }
    
}



