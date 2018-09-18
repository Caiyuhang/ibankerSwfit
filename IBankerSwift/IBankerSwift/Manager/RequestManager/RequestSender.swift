//
//  RequestSender.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/18.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RequestSender: NSObject {
    
    struct responseData {
        var request: URLRequest?
        var response: DataResponse<Any>?
        var data: Data?
    }
    
    class func send(Method method: Alamofire.HTTPMethod, URL url: String, Parameter param: [String: Any]?, IsJsonResponse isJsonResponse: Bool, TimeoutInterval timeoutInterval: TimeInterval, handler: @escaping(responseData) -> Void) {
        let reachable = IBNetworkReachability.reachability.reachAble
        if reachable
        {
            let manager = Alamofire.SessionManager.default
            manager.session.configuration.timeoutIntervalForRequest = timeoutInterval
            if isJsonResponse
            {
                
            }
            let headers: HTTPHeaders = [
                "Content-Type": "application/json",
                ]
            manager.request(URL(string: url)!, method: method, parameters: param, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
                
                let res = responseData(request: response.request, response: response, data: response.data)
                handler(res)
            }
        }
    }
}
