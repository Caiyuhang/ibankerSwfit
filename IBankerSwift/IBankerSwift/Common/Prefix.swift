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

// MARK: 布局
let KScreenWidth = UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height ? UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.height
let KScreenHeight = UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height ? UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.height
let SCALE = UIScreen.main.bounds.size.width/375.0

let IB_StatusBarHeight = UIApplication.shared.statusBarFrame.size.height    //状态栏高度
let IB_TabBarHeight = IB_StatusBarHeight > 20 ? 83 : 49 //tabbar高度


// MARK: 设备
let IS_IPHONE_4 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 320, height: 480), (UIScreen.main.currentMode?.size)!) : false)
let IS_IPHONE_5 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 640, height: 1136), (UIScreen.main.currentMode?.size)!) : false)
let IS_IPHONE_6 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 750, height: 1334), (UIScreen.main.currentMode?.size)!) : false)
let IS_IPHONE_6P = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1242, height: 2208), (UIScreen.main.currentMode?.size)!) : false)
let IS_IPHONE_X = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1125, height: 2436), (UIScreen.main.currentMode?.size)!) : false)

let IS_RETINA = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 640, height: 960), (UIScreen.main.currentMode?.size)!) : false)

let IS_IPAD = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)
let IS_IPHONE = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

// MARK:
let NUMBERS =   "0123456789\n"


// MARK: 接口
let InternetHttpBaseUrl = "http://www.ourlinked.com:8030/JavaTeam"


