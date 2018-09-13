//
//  Toast.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/13.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

class Toast: UIView {

    lazy var bgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15*SCALE
        view.layer.backgroundColor = UIColor.black.withAlphaComponent(0.7).cgColor
        return view
    }()
    
    lazy var label: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.white
        lab.font = UIFont.systemFont(ofSize: 14*SCALE)
        lab.numberOfLines = 0
        return lab
    }()
    
    static let share: Toast = {
        var view = Toast(frame: .zero)
        return view
    }()
    
    fileprivate var content: String?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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

extension Toast {
    
    func makeText(text: String) {
        //label.text = text
        content = text
    }
    
    func show() {
        
        //先清除
        label.removeFromSuperview()
        bgView.removeFromSuperview()
        
        //添加
        addSubview(bgView)
        bgView.alpha = 1.0
        
        addSubview(label)
        label.text = content
        label.alpha = 1.0
        
        let keyWindow = UIApplication.shared.keyWindow
        keyWindow?.addSubview(self)
        
        //约束
        label.snp.remakeConstraints { (make) in
            make.centerX.equalTo((keyWindow?.snp.centerX)!)
            make.width.lessThanOrEqualTo(260*SCALE)
            make.centerY.equalTo((keyWindow?.snp.centerY)!).offset(KScreenHeight/4)
        }
        
        bgView.snp.remakeConstraints { (make) in
            make.center.equalTo(label.snp.center)
            make.width.equalTo(label.snp.width).offset(20*SCALE)
            make.height.equalTo(label.snp.height).offset(20*SCALE)
        }
        
        Toast.share.snp.remakeConstraints { (make) in
            make.edges.equalTo(bgView)
        }
        
        //动画
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseInOut, animations: { [unowned self] in
            self.label.alpha = 0.0
            self.bgView.alpha = 0.0
        }) { [unowned self] (finished) in
            if finished
            {
                self.label.text = nil
                self.label.removeFromSuperview()
                
                self.bgView.removeFromSuperview()
            }
        }
        
        
    }
}
