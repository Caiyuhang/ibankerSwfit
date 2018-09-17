//
//  BaseViewController.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/6.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

enum backBarItemColor {
    case black
    case white
}


class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.colorWithHexString(hex: "#eef0f4")
        
    }
    
    func createBackBarItem(color: backBarItemColor) {
        var img = UIImage()
        switch color {
        case .black:
            img = UIImage(named: "back")!.withRenderingMode(.alwaysOriginal)
        case .white:
            img = UIImage(named: "back_white")!.withRenderingMode(.alwaysOriginal)
        }
        
        let item = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(backBarItemClicked))
        navigationItem.leftBarButtonItem = item
    }
    
    @objc func backBarItemClicked() {
        navigationController?.popViewController(animated: true)
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
