//
//  IbankerDetailViewController.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/14.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

class IbankerDetailViewController: BaseViewController {

    var ibankerUserId: String?
    
    lazy var naviBgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.colorWithHexString(hex: "#1d242b")
        return view
    }()
    
    lazy var backBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage.init(named: "back_white"), for: .normal)
        btn.addTarget(self, action: #selector(backBtnClicked), for: .touchUpInside)
        return btn
    }()
    
    @objc func backBtnClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    lazy var funcBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage.init(named: "moreAndMore_white"), for: .normal)
        btn.addTarget(self, action: #selector(funcBtnClicked), for: .touchUpInside)
        return btn
    }()
    
    @objc func funcBtnClicked() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fd_prefersNavigationBarHidden = true
        
        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension IbankerDetailViewController {
    func setUpUI() {
        
        view.addSubview(naviBgView)
        naviBgView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(self.topLayoutGuide.snp.bottom).offset(44)
        }
        
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.width.height.equalTo(44.0)
        }
        
        view.addSubview(funcBtn)
        funcBtn.snp.makeConstraints { (make) in
            make.right.equalTo(view.snp.right)
            make.centerY.equalTo(backBtn.snp.centerY)
            make.width.height.equalTo(44.0)
        }
        
    }
}
