//
//  LoginViewController.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/17.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // 背景图
    lazy var bgImgView: UIImageView = {
        let imgView = UIImageView(frame: UIScreen.main.bounds)
        var bgImage = UIImage()
        if (IS_IPHONE_4)
        {
            bgImage = UIImage(named: "launch_after_ip4")!
        }
        else if (IS_IPHONE_5)
        {
            bgImage = UIImage(named: "launch_after_ip5")!
        }
        else if (IS_IPHONE_6)
        {
            bgImage = UIImage(named: "launch_after_ip6")!
        }
        else if (IS_IPHONE_6P)
        {
            bgImage = UIImage(named: "launch_after_ip6p")!
        }
        else if (IS_IPHONE_X)
        {
            bgImage = UIImage(named: "launch_after_ipx")!
        }
        imgView.image = bgImage
        return imgView
    }()
    
    // 关闭按钮
    lazy var closeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "btn_close"), for: .normal)
        btn.addTarget(self, action: #selector(closeBtnClicked(btn:)), for: .touchUpInside)
        return btn
    }()
    
    @objc func closeBtnClicked(btn: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: {
            
        })
    }
    
    // 头像
    lazy var protraitImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 25*SCALE
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    // 注册按钮
    lazy var registerBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("注册新用户", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16*SCALE)
        btn.setTitleColor(UIColor.colorWithHexString(hex: "#ffffff"), for: .normal)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        btn.addTarget(self, action: #selector(registerBtnClicked(btn:)), for: .touchUpInside)
        return btn
    }()
    
    @objc func registerBtnClicked(btn: UIButton) {
        // TODO: 去注册
        
    }
    
    //
    lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.colorWithHexString(hex: "#ffffff")
        lab.font = UIFont.boldSystemFont(ofSize: 21*SCALE)
        return lab
    }()
    
    // 手机号输入框
    lazy var phoneTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextBorderStyle.none
        tf.attributedPlaceholder = NSAttributedString(string: "输入手机号", attributes: [NSAttributedStringKey.foregroundColor: UIColor.colorWithHexString(hex: "#acb8c7")])
        tf.textColor = UIColor.colorWithHexString(hex: "#ffffff")
        tf.font = UIFont.systemFont(ofSize: 19*SCALE)
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.returnKeyType = UIReturnKeyType.next
        tf.delegate = self
        tf.adjustsFontSizeToFitWidth = true
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.keyboardType = UIKeyboardType.numberPad
        tf.addTarget(self, action: #selector(textFieldDidChange(textfield:)), for: .editingChanged)
        tf.rightView = rightPhoneClearBtn
        tf.rightViewMode = UITextFieldViewMode.always
        let leftImg = UIImageView(image: UIImage(named: "login_tel"))
        leftImg.frame = CGRect(x: 0, y: 0, width: 30*SCALE, height: 20*SCALE)
        tf.leftView = leftImg
        tf.leftViewMode = UITextFieldViewMode.always
        return tf
    }()
    
    @objc func textFieldDidChange(textfield: UITextField) {
        // 判断-电话号码输入框
        if textfield == phoneTF
        {
            if (textfield.text?.length)! > 0
            {
                rightPhoneClearBtn.isHidden = false
            }
            else
            {
                rightPhoneClearBtn.isHidden = true
            }
        }
        
        // 改变登录按钮状态
        if (phoneTF.text?.length)! > 0 && (passwordTF.text?.length)! > 0
        {
            loginBtn.layer.backgroundColor = UIColor.colorWithHexString(hex: "#0f9296").cgColor
            loginBtn.isEnabled = true
        }
        else
        {
            loginBtn.layer.backgroundColor = UIColor.colorWithHexString(hex: "#818587").cgColor
            loginBtn.isEnabled = false
        }
        
    }
    // 清空输入电话号码
    lazy var rightPhoneClearBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 15*SCALE, height: 15*SCALE)
        btn.setImage(UIImage(named: "btn_close"), for: .normal)
        btn.addTarget(self, action: #selector(rightClearBtnClicked(btn:)), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    @objc func rightClearBtnClicked(btn: UIButton) {
        if btn == rightPhoneClearBtn
        {
            btn.isHidden = true
            phoneTF.text = nil
        }
    }
    
    // 密码输入框
    lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = UITextBorderStyle.none
        tf.attributedPlaceholder = NSAttributedString(string: "请输入登录密码", attributes: [NSAttributedStringKey.foregroundColor: UIColor.colorWithHexString(hex: "#acb8c7")])
        tf.textColor = UIColor.colorWithHexString(hex: "#ffffff")
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 19*SCALE)
        tf.returnKeyType = .done
        tf.autocorrectionType = .no
        tf.adjustsFontSizeToFitWidth = true
        tf.delegate = self
        tf.autocapitalizationType = .none
        tf.addTarget(self, action: #selector(textFieldDidChange(textfield:)), for: .editingChanged)
        tf.rightView = rightLookBtn
        tf.rightViewMode = .always
        
        let leftImg = UIImageView(image: UIImage(named: "login_lock"))
        leftImg.frame = CGRect(x: 0, y: 0, width: 30*SCALE, height: 20*SCALE)
        tf.leftView = leftImg
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var rightLookBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 15*SCALE, height: 15*SCALE)
        btn.setImage(UIImage(named: "login_password_unLook"), for: .normal)
        btn.setImage(UIImage(named: "login_password_look"), for: .selected)
        btn.addTarget(self, action: #selector(rightLookBtnClicked(btn:)), for: .touchUpInside)
        return btn
    }()
    @objc func rightLookBtnClicked(btn: UIButton) {
        btn.isSelected = !btn.isSelected
        passwordTF.isSecureTextEntry = !btn.isSelected
    }
    
    lazy var loginBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("登录", for: .normal)
        btn.setTitleColor(UIColor.colorWithHexString(hex: "#ffffff"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 19*SCALE)
        btn.alpha = 0.7
        btn.layer.backgroundColor = UIColor.colorWithHexString(hex: "#818587").cgColor
        btn.layer.cornerRadius = 5*SCALE
        btn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        btn.isEnabled = false
        return btn
    }()
    
    @objc func loginBtnClicked(btn: UIButton) {
        if phoneTF.text == ""
        {
            Toast.share.makeText(text: "手机号不能为空")
            Toast.share.show()
            return
        }
        
        if passwordTF.text == ""
        {
            Toast.share.makeText(text: "密码不能为空")
            Toast.share.show()
            return
        }
        
        //验证手机号准确性
        
        //可以登录
    }
    
    // 忘记密码按钮
    lazy var forgetBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("忘记密码", for: .normal)
        btn.contentHorizontalAlignment = .right
        btn.setTitleColor(UIColor.colorWithHexString(hex: "#acb8c7"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14*SCALE)
        btn.addTarget(self, action: #selector(forgetBtnClicked(btn:)), for: .touchUpInside)
        return btn
    }()
    @objc func forgetBtnClicked(btn: UIButton) {
        // TODO: 忘记密码
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.colorWithHexString(hex: "#eef0f4")
        fd_prefersNavigationBarHidden = true
        
        setUpUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        phoneTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        next?.touchesEnded(touches, with: event)
        phoneTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
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

extension LoginViewController {
    func setUpUI() {
        
        view.addSubview(bgImgView)
        let shadeView = UIView(frame: bgImgView.frame)
        shadeView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        bgImgView.addSubview(shadeView)
        
        view.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.width.height.equalTo(44.0)
            make.right.equalTo(view.snp.right)
        }
        
        view.addSubview(registerBtn)
        registerBtn.snp.makeConstraints { (make) in
            make.right.equalTo(view.snp.right).offset(-15*SCALE)
            make.top.equalTo(closeBtn.snp.bottom).offset(25*SCALE)
        }
        
        view.addSubview(protraitImgView)
        protraitImgView.snp.makeConstraints { (make) in
            make.centerY.equalTo(registerBtn.snp.centerY)
            make.left.equalTo(view.snp.left).offset(15*SCALE)
            make.width.height.equalTo(50*SCALE)
        }
        
        view.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(protraitImgView.snp.left)
            make.top.equalTo(protraitImgView.snp.bottom).offset(50*SCALE)
            make.height.equalTo(22*SCALE)
        }
        view.addSubview(phoneTF)
        phoneTF.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(15*SCALE)
            make.top.equalTo(titleLab.snp.bottom).offset(30*SCALE)
            make.right.equalTo(view.snp.right).offset(-15*SCALE)
            make.height.equalTo(19*SCALE)
        }
        
        let line1 = UIView()
        line1.backgroundColor = UIColor.colorWithHexString(hex: "#b6b6ba")
        view.addSubview(line1)
        line1.snp.makeConstraints { (make) in
            make.left.equalTo(phoneTF.snp.left)
            make.right.equalTo(phoneTF.snp.right)
            make.top.equalTo(phoneTF.snp.bottom).offset(15*SCALE)
            make.height.equalTo(0.5)
        }
        
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { (make) in
            make.left.equalTo(phoneTF.snp.left)
            make.top.equalTo(line1.snp.bottom).offset(30*SCALE)
            make.right.equalTo(phoneTF.snp.right)
            make.height.equalTo(19*SCALE)
        }
        
        let line2 = UIView()
        line2.backgroundColor = UIColor.colorWithHexString(hex: "#b6b6ba")
        view.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            make.left.equalTo(passwordTF.snp.left)
            make.right.equalTo(passwordTF.snp.right)
            make.top.equalTo(passwordTF.snp.bottom).offset(15*SCALE)
            make.height.equalTo(0.5)
        }
        
        view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(line2.snp.bottom).offset(20*SCALE)
            make.height.equalTo(50*SCALE)
            make.left.equalTo(line2.snp.left)
            make.right.equalTo(line2.snp.right)
        }
        
        view.addSubview(forgetBtn)
        forgetBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp.bottom).offset(15*SCALE)
            make.right.equalTo(view.snp.right).offset(-15*SCALE)
            make.width.equalTo(80*SCALE)
            make.height.equalTo(14*SCALE)
        }
        
        /*
        LoginManager * loginManager = [[LoginManager shareLoginManager] getLoginInfo];
        if (loginManager.account.length > 0)
        {
            _phoneTF.text = loginManager.account;
            _titleLab.text = @"欢迎回来";
            NSString * userLogo = [UserManager user].userLogo;
            [_protraitImgView sd_setImageWithURL:[NSURL URLWithString:userLogo] placeholderImage:[UIImage imageNamed:@"login_ibanker_logo"]];
        }
        else
        {
            _phoneTF.text = nil;
            _titleLab.text = @"欢迎来到伴客未来";
            _protraitImgView.image = [UIImage imageNamed:@"login_ibanker_logo"];
        }
         */
        phoneTF.text = nil
        titleLab.text = "欢迎来到伴客未来"
        protraitImgView.image = UIImage(named: "login_ibanker_logo")
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "" //删除
        {
            return true
        }
        
        //不让输入表情
        if textField.isFirstResponder
        {
            if  textField.textInputMode?.primaryLanguage == "emoji"
            {
                return false
            }
        }
        
        if textField == phoneTF
        {
            let filterCS: CharacterSet = CharacterSet(charactersIn: NUMBERS).inverted
            let filterString = string.components(separatedBy: filterCS).joined(separator: "")
            if string != filterString
            {
                return false
            }
            
        }
        else if textField == passwordTF
        {
            
            for getChar in string.unicodeScalars
            {
                if getChar.value < 48
                {
                    return false
                }
                if getChar.value > 57 && getChar.value < 65
                {
                    return false
                }
                if getChar.value > 90 && getChar.value < 97
                {
                    return false
                }
                if getChar.value > 122
                {
                    return false
                }
            }
            
        }
        
        return true
    }
}
