//
//  HomeTableCommonHeader.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/18.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

let CommonTableCellHeader_Height = 79 * SCALE

class HomeTableCommonHeader: UIView {

    // 1、定义一个闭包
    typealias moreCallBack = () -> Void
    // 2、声明一个变量
    var callBack: moreCallBack?
    
    // 3、定义一个方法，方法的参数为和moreCallBack类型一致的闭包，并赋值给callBack
    func moreAction(block: @escaping(moreCallBack)) {
        callBack = block
    }
    
    lazy var headTitleLab: UILabel = {
        let lab = UILabel(frame: CGRect(x: 15*SCALE, y: (CommonTableCellHeader_Height-19*SCALE)/2, width: 150*SCALE, height: 19*SCALE))
        lab.font = UIFont.boldSystemFont(ofSize: 19*SCALE)
        lab.textColor = UIColor.colorWithHexString(hex: "#313131")
        return lab
    }()
    
    lazy var moreBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: KScreenWidth-65*SCALE, y: (CommonTableCellHeader_Height-15*SCALE)/2, width: 50*SCALE, height: 15*SCALE)
        btn.setTitle("查看更多", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12*SCALE)
        btn.setTitleColor(UIColor.colorWithHexString(hex: "#535860"), for: .normal)
        btn.addTarget(self, action: #selector(moreBtnClicked(btn:)), for: .touchUpInside)
        return btn
    }()
    @objc func moreBtnClicked(btn: UIButton) {
        print("查看更多。。。")
        // 4、调用闭包.设置你想传递的参数，调用前先判定一下，是否已实现
        if callBack != nil
        {
            callBack!()
            //参考https://www.jianshu.com/p/c1059b2f3351
        }
    }
    
    convenience init(frame: CGRect, headTitle: String, isHiddenMore: Bool) {
        self.init(frame: frame)
        self.backgroundColor = UIColor.colorWithHexString(hex: "#eef0f4")
        
        self.headTitleLab.text = headTitle
        addSubview(headTitleLab)
        
        addSubview(moreBtn)
        moreBtn.isHidden = isHiddenMore
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
