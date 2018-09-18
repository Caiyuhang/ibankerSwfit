//
//  IBNetworkReachability.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/18.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit
import Alamofire

class IBNetworkReachability: NSObject {
    
    static let reachability = IBNetworkReachability()
    
    var reachAble: Bool = {
        var reach = true
        
        let manager = NetworkReachabilityManager(host: "www.baidu.com")
        manager?.listener = { status in
            switch status {
            case .notReachable:
                reach = false
            case .unknown:
                reach = false
            case .reachable(.ethernetOrWiFi):
                reach = true
            case .reachable(.wwan):
                reach = true
            }
        }
        manager?.startListening()
        
        return reach
    }()
}
