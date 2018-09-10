//
//  ProductLibraryModel.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/7.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

class ProductLibraryModel: BaseModel {
    
    var productPassageShortInfo: String?
    var productPassageImg: String?
    var productPassageId: Int32?
    var productPassageContent: String?
    var isCanSale: Bool?    //控制有没有标签
    var isSale: Bool?       //控制标签是 “已上架” 还是 “可上架” 状态
    var resumePosition: String?
    var userName: String?
    var userLogo: String?
    var productPassageTitle: String?
    
}
