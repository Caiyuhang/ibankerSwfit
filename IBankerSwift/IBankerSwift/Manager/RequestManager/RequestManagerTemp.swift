//
//  RequestManager.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/10.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit
import Alamofire


class RequestManagerTemp: NSObject {
    
    // MARK: 通用请求的Manager
    static let share: SessionManager = {
        var headers = Alamofire.SessionManager.default.session.configuration.httpAdditionalHeaders ?? [:]
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        config.httpAdditionalHeaders = headers
        return Alamofire.SessionManager(configuration: config)
    }()
    
}

// MARK: 接口请求
extension RequestManagerTemp {
    
    /*!
     @brief 注册获取验证码
     @param userTel 手机号
     @param nationalCode 国家区号
     @param success 成功回调
     @param failure 失败回调
     */
    static func sendIdentifyCode(userTel: String, nationalCode: String, success: @escaping((_ result: Any?, _ error: Error?) -> Void), failure: @escaping((_ error: Error?) -> Void)) {
        
        let url: String = InternetHttpBaseUrl.appending("/IdentifyingCode/sendidentifycode.json")
        
        var params = [String: Any]()
        params["userTel"] = userTel
        params["nationalCode"] = nationalCode
        
        let headers: HTTPHeaders = [
//            "Accept": "text/html",
//            "application/x-www-form-urlencoded": "charset=utf-8",
            "Content-Type": "application/json",
            ]
        
        RequestManagerTemp.share.request(url, method: .post, parameters: params, headers: headers).responseJSON { (response) in
            
            //请求失败
            if response.result.isFailure {
                print(response.result.error)
                failure(response.result.error)
                return
            }
            //请求成功
            if response.result.isSuccess {
                //获取结果
                guard let result = response.result.value else {
                    failure(response.result.error)
                    return
                }
                
                //将结果回调回去
                success(result, nil)
            }
            
        }
    }
    
    
    /*!
     @brief 用户登录
     @param userTel 手机号
     @param userPassword 登录密码
     @param isAutoLogin 是否是自动登录
     @param success 成功回调
     @param failure 失败回调
     */
    static func userLogin(userTel: String, userPassword: String, success: @escaping((_ result: Any?, _ error: Error?) -> Void), failure: @escaping((_ error: Error?) -> Void)) {
        
        let url: String = InternetHttpBaseUrl.appending("/SysUser/login.json")
        
        var params = [String: Any]()
        params["userTel"] = userTel
        params["userPwd"] = userPassword
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            ]
        
        RequestManagerTemp.share.request(url, method: .post, parameters: params, headers: headers).responseJSON { (response) in
            
            //请求失败
            if response.result.isFailure {
                print(response.result.error)
                failure(response.result.error)
                return
            }
            //请求成功
            if response.result.isSuccess {
                //获取结果
                guard let result = response.result.value else {
                    print(response.result.error)
                    failure(response.result.error)
                    return
                }
                //将结果回调回去
                success(result, nil)
            }
        }
    }
    
    
    /*!
     @brief 首页产品推荐列表
     @param pageNum 页码
     @param search 搜索内容（非必填）
     */
    static func selectProduct(pageNum: Int, search: String?, success: @escaping((_ result: Any?, _ error: Error?) -> Void), failure: @escaping((_ error: Error?) -> Void)) {
        
        let url: String = InternetHttpBaseUrl + "/Home/SelectProduct.json"
        
        var params = [String: Any]()
        params["pageNum"] = pageNum
        params["search"] = search
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
            ]
        RequestManagerTemp.share.request(url, method: .post, parameters: params, headers: headers).responseJSON { (response) in
            
            //请求失败
            if response.result.isFailure {
                print(response.result.error)
                failure(response.result.error)
                return
            }
            
            //请求成功
            if response.result.isSuccess {
                //获取结果
                guard let result = response.result.value else {
                    print(response.result.error)
                    failure(response.result.error)
                    return
                }
                
                //将结果回调回去
                success(result, nil)
            }
            
        }
        
    }
    
    /*!
     @brief 首页ibanker推荐列表
     */
    static func selectIbanker(success: @escaping((_ result: Any?, _ error: Error?) -> Void), failure: @escaping((_ error: Error?)-> Void)) {
        let url: String = InternetHttpBaseUrl + "/Home/SelectIbanker.json"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        RequestManagerTemp.share.request(url, method: .post, parameters: nil, headers: headers).responseJSON { (response) in
            
            //请求失败
            if response.result.isFailure
            {
                failure(response.result.error)
                return
            }
            
            //请求成功
            if response.result.isSuccess
            {
                //获取结果
                guard let result = response.result.value else {
                    failure(response.result.error)
                    return
                }
                //将结果回调回去
                success(result, nil)
            }
        }
    }
    
}
