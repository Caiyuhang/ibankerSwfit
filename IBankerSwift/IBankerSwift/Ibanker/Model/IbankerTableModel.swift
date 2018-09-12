//
//  IbankerTableModel.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/12.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

enum IbankerTableCellType {
    case recommend  //推荐
    case hot        //热门
    case normal     //正常
}

class IbankerTableModel: NSObject {
    var cellType: IbankerTableCellType?
    var datas: [AnyObject] = []
}
