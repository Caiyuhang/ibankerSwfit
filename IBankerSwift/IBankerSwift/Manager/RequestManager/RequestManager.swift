//
//  RequestManager1.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/18.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

let Timeout_Request_Default: TimeInterval =   10

class RequestManager: NSObject {
    
    static let share: RequestManager = {
        let manager = RequestManager()
        return manager
    }()
    
}

// MARK: 登录相关接口
extension RequestManager {
    
    // 注册获取验证码
    static func sendIdentifyCode(userTel: String, nationalCode: String, success: @escaping((_ result: Any?, _ error: Error?) -> Void), failure: @escaping((_ error: Error?) -> Void)) {
        
        let url: String = InternetHttpBaseUrl + URL_Register_IdentifyCode
        
        var params = [String: Any]()
        params["userTel"] = userTel
        params["nationalCode"] = nationalCode
        
        RequestSender.send(Method: .post, URL: url, Parameter: params, IsJsonResponse: true, TimeoutInterval: Timeout_Request_Default) { (res) in
            //请求失败
            if (res.response?.result.isFailure)!
            {
                // print(res.response?.result.error)
                failure(res.response?.result.error)
                return
            }
            
            //请求成功
            if (res.response?.result.isSuccess)! {
                //获取结果
                guard let result = res.response?.result.value else {
                    failure(res.response?.result.error)
                    return
                }
                
                //将结果回调回去
                success(result, nil)
            }
        }
        
    }
    
    // 用户登录
    static func userLogin(userTel: String, userPassword: String, success: @escaping((_ result: Any?, _ error: Error?) -> Void), failure: @escaping((_ error: Error?) -> Void)) {
        
        let url: String = InternetHttpBaseUrl + URL_Login_Normal
        
        var params = [String: Any]()
        params["userTel"] = userTel
        params["userPwd"] = userPassword
        
        RequestSender.send(Method: .post, URL: url, Parameter: params, IsJsonResponse: true, TimeoutInterval: Timeout_Request_Default) { (res) in
            //请求失败
            if (res.response?.result.isFailure)!
            {
                // print(res.response?.result.error)
                failure(res.response?.result.error)
                return
            }
            
            //请求成功
            if (res.response?.result.isSuccess)! {
                //获取结果
                guard let result = res.response?.result.value else {
                    failure(res.response?.result.error)
                    return
                }
                
                //将结果回调回去
                success(result, nil)
            }
        }
        
    }
    
}

// MARK: 首页相关

// MARK: ibanker相关
extension RequestManager {
    
    // 首页ibanker推荐列表
    static func selectIbanker(success: @escaping((_ result: Any?, _ error: Error?) -> Void), failure: @escaping((_ error: Error?)-> Void)) {
        let url: String = InternetHttpBaseUrl + URL_Home_SelectIbanker
        
        RequestSender.send(Method: .post, URL: url, Parameter: nil, IsJsonResponse: true, TimeoutInterval: Timeout_Request_Default) { (res) in
            //请求失败
            if (res.response?.result.isFailure)!
            {
                failure(res.response?.result.error)
                return
            }
            
            //请求成功
            if (res.response?.result.isSuccess)!
            {
                //获取结果
                guard let result = res.response?.result.value else {
                    failure(res.response?.result.error)
                    return
                }
                //将结果回调回去
                success(result, nil)
            }
        }
        
    }
}

// MARK: IM相关

// MARK: 产品相关
extension RequestManager {
    
    // 首页产品推荐列表
    static func selectProduct(pageNum: Int, search: String?, success: @escaping((_ result: Any?, _ error: Error?) -> Void), failure: @escaping((_ error: Error?) -> Void)) {
        
        let url: String = InternetHttpBaseUrl + URL_Home_SelectProduct
        
        var params = [String: Any]()
        params["pageNum"] = pageNum
        params["search"] = search
        
        RequestSender.send(Method: .post, URL: url, Parameter: params, IsJsonResponse: true, TimeoutInterval: Timeout_Request_Default) { (res) in
            //请求失败
            if (res.response?.result.isFailure)!
            {
                // print(res.response?.result.error)
                failure(res.response?.result.error)
                return
            }
            
            //请求成功
            if (res.response?.result.isSuccess)! {
                //获取结果
                guard let result = res.response?.result.value else {
                    failure(res.response?.result.error)
                    return
                }
                
                //将结果回调回去
                success(result, nil)
            }
        }
        
    }
}

// MARK: 我的相关

