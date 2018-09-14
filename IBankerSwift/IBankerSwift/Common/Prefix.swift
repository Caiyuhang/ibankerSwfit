//
//  Prefix.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/7.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

// MARK: 引入头文件
import SnapKit
import SwiftyJSON

// MARK: 宏定义
let KScreenWidth = UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height ? UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.height
let KScreenHeight = UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height ? UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.height
let SCALE = UIScreen.main.bounds.size.width/375.0

let IB_StatusBarHeight = UIApplication.shared.statusBarFrame.size.height    //状态栏高度
let IB_TabBarHeight = IB_StatusBarHeight > 20 ? 83 : 49 //tabbar高度


// MARK: 接口
let InternetHttpBaseUrl = "http://www.ourlinked.com:8030/JavaTeam"


