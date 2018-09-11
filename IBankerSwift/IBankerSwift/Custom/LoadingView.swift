//
//  LoadingView.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/11.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    //停止加载
    var loadingFlag: Bool = false
    
    lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.white
        lab.font = UIFont.systemFont(ofSize: 18*SCALE)
        lab.text = "请稍后..."
        lab.numberOfLines = 0
        return lab
    }()
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.layer.cornerRadius = 5*SCALE
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var actView: UIActivityIndicatorView = {
        let act = UIActivityIndicatorView()
        act.backgroundColor = UIColor.clear
        act.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)  //放大三倍
        act.startAnimating()
        //设置中点坐标
        act.center = CGPoint(x: KScreenWidth/2-20, y: KScreenHeight-20)
        //设置一个风格
        act.activityIndicatorViewStyle = .white
        return act
    }()
    
    
    
    //单利对象
    static let shareLoadingView: LoadingView = {
        var view = LoadingView(frame: UIScreen.main.bounds)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isUserInteractionEnabled = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

// MARK: setUpUI
extension LoadingView {
    func setUpUI() {
        
        addSubview(bgView)
        
        addSubview(titleLab)
//        titleLab.backgroundColor = UIColor.orange
        titleLab.snp.makeConstraints { (make) in
//            make.right.equalTo(-30*SCALE)
            make.right.lessThanOrEqualTo(-30*SCALE)
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX).offset(30*SCALE)
        }
        
        addSubview(actView)
//        actView.backgroundColor = UIColor.red
        actView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.titleLab.snp.left).offset(-15*SCALE)
            make.width.equalTo(45*SCALE)
            make.height.equalTo(45*SCALE)
        }
        
        bgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(titleLab.snp.width).offset(95*SCALE)
            make.top.equalTo(titleLab.snp.top).offset(-15*SCALE)
            make.bottom.equalTo(titleLab.snp.bottom).offset(15*SCALE)
        }
        
        
        
    }
}

// MARK: 开始加载 停止加载 动画
extension LoadingView {
    //开始加载
    func startLoading(title: String?) -> Void {
        
        self.loadingFlag = true;
        //主线程操作
        DispatchQueue.main.async {
            
            UIApplication.shared.keyWindow?.addSubview(self)
            UIApplication.shared.keyWindow?.bringSubview(toFront: self)
            self.setUpUI()
            
            if (title != nil && (title?.count)! > 0)
            {
                self.titleLab.text = title
            }
            else
            {
                self.titleLab.text = ""
            }
            
            self.actView.snp.updateConstraints({ (make) in
                
            })
            self.titleLab.snp.updateConstraints({ (make) in
                
            })
            self.bgView.snp.updateConstraints({ (make) in
                
            })
        }
    }
    
    //停止加载
    func stopLoading() -> Void {
        
        DispatchQueue.main.async {
            if self.loadingFlag
            {
                self.removeFromSuperview()
            }
            
            self.loadingFlag = false
        }
    }
    
}

