//
//  HomeTableViewController.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/14.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseViewController {

    var headerType: HomeHeaderType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: CGFloat(Double(arc4random()%255)/255), green: CGFloat(Double(arc4random()%255)/255), blue: CGFloat(Double(arc4random()%255)/255), alpha: 1)
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
