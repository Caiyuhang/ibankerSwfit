//
//  CommonEnum.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/12.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import Foundation

// MARK: ibanker级别
enum IBankerLevel: Int {
    case general = 0    //普通合伙人
    case middle  = 1    //高级合伙人
    case senior  = 2    //资深合伙人
    case league  = 3    //联盟委员合伙人
}

// MARK: 首页header类型
enum HomeHeaderType {
    case publicFund         //公募基金
    case insurance          //保险
    case medicalTreatment   //医疗
    case studyAbroad        //留学
    case privateFund        //私募基金
    case IFO                //IFO
}
