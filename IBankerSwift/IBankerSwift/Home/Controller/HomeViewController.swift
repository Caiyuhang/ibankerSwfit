//
//  HomeTestViewController.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/14.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

class HomeViewController: WMPageController {

    // 标题数组
    fileprivate var titlesArray = ["留学", "医疗", "基金", "保险", "IFO"]
    // 标题类型
    fileprivate var headersArray: [HomeHeaderType] = [.studyAbroad, .medicalTreatment, .privateFund, .insurance, .IFO]
    // menuView上自定义图标
    fileprivate var menuImgArray = ["home_menu_studyAbroad", "home_menu_medical", "home_menu_privateFund", "home_menu_insurance", "home_menu_IFO"]
    
    //topLogo图
    fileprivate lazy var topLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "homepage_top_logo")
        return logo
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        fd_prefersNavigationBarHidden = true
        
        bounces = true
        titleSizeNormal = 0.01
        titleSizeSelected = 0.01
        
        titleColorSelected = UIColor.colorWithHexString(hex: "#0f9296")
        titleColorNormal = UIColor.colorWithHexString(hex: "#313131")
        
        menuViewStyle = WMMenuViewStyle.line
        menuView?.backgroundColor = UIColor.clear
        menuItemWidth = 50*SCALE
        itemMargin = 17.5*SCALE
        menuViewContentMargin = -3.75*SCALE
        
        progressWidth = 30*SCALE
        progressHeight = 2*SCALE
        progressViewCornerRadius = 2*SCALE
        progressViewBottomSpace = 1.0
        
        showOnNavigationBar = false
        
        if #available(iOS 11.0, *) {
            scrollView?.contentInsetAdjustmentBehavior = .never
        }
    }
    
    override init(viewControllerClasses classes: [AnyClass], andTheirTitles titles: [String]) {
        super.init(viewControllerClasses: classes, andTheirTitles: titles)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.colorWithHexString(hex: "#eef0f4")
        automaticallyAdjustsScrollViewInsets = false
        
        setUpUI()
    }
    
    deinit {
        removeObserver()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: UI布局
let Menu_Height     = 100 * SCALE

extension HomeViewController {
    
    fileprivate func setUpUI() {
        //
        let line = UIView(frame: CGRect(x: -20, y: Menu_Height-0.5, width: KScreenWidth+20*2, height: 0.5))
        line.backgroundColor = UIColor.colorWithHexString(hex: "#c6d1e0")
        menuView?.addSubview(line)
        //
        view.addSubview(topLogo)
        topLogo.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(20*SCALE)
            make.width.equalTo(59*SCALE)
            make.height.equalTo(19.5*SCALE)
        }
        //
        view.layoutIfNeeded()
        
    }
}

// MARK: WMPageController 代理和数据源
extension HomeViewController {
    
    override func numbersOfChildControllers(in pageController: WMPageController) -> Int {
        return titlesArray.count
    }
    override func pageController(_ pageController: WMPageController, viewControllerAt index: Int) -> UIViewController {
        let vc = HomeTableViewController()
        vc.headerType = self.headersArray[index]
        return vc
        /*
         HomeTableViewController * vc = [[HomeTableViewController alloc] init];
         vc.selectedIndex = index;
         vc.headerType = [self.headersArray[index] integerValue];
         return vc;
         */
    }
    override func pageController(_ pageController: WMPageController, titleAt index: Int) -> String {
        return titlesArray[index]
    }
    
    override func pageController(_ pageController: WMPageController, preferredFrameFor menuView: WMMenuView) -> CGRect {
        let menuViewOriginY: CGFloat = topLogo.frame.maxY
        return CGRect(x: 0, y: menuViewOriginY, width: KScreenWidth, height: Menu_Height)
    }
    
//    override func pageController(_ pageController: WMPageController, preferredFrameForContentView contentView: WMScrollView) -> CGRect {
//        let contentViewOriginY: CGFloat = self.pageController(pageController, preferredFrameFor: self.menuView!).maxY
//        return CGRect(x: 0, y: contentViewOriginY, width: KScreenWidth, height: KScreenHeight - contentViewOriginY - CGFloat(IB_TabBarHeight))
//    }
    
}

// MAKR: WMMenuViewDataSource

let MenuView_Img_Tag    = 999999
let MenuView_Label_Tag  = 888888

extension HomeViewController {
    override func menuView(_ menu: WMMenuView!, initialMenuItem: WMMenuItem!, at index: Int) -> WMMenuItem! {
        
        let img = UIImageView()
        img.frame = CGRect(x: (initialMenuItem.frame.size.width-50*SCALE)/2, y: 20*SCALE, width: 50*SCALE, height: 40*SCALE)
        img.image = UIImage(named: menuImgArray[index])
        img.tag = MenuView_Img_Tag + index
        initialMenuItem.addSubview(img)
        
        let lab = UILabel()
        lab.frame = CGRect(x: 0, y: img.frame.maxY+10*SCALE, width: initialMenuItem.frame.size.width, height: 16*SCALE)
        lab.textAlignment = .center
        lab.text = self.titlesArray[index]
        lab.font = UIFont.systemFont(ofSize: 14*SCALE)
        lab.tag = MenuView_Label_Tag + index
        initialMenuItem.addSubview(lab)
        
        //添加监听
        addObserver(initialMenuItem)
        
        return initialMenuItem
    }
    
}

// MAKR: WMMenuItem 观察者方法，添加、移除观察者
extension HomeViewController {
    
    //观察者方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let currentMenuItem = object as? WMMenuItem
        {
            if (keyPath == "textColor")
            {
                if let currentIndex: Int = titlesArray.index(of: currentMenuItem.text!)
                {
                    //改 图背景色
                    if let findMenuImg = currentMenuItem.viewWithTag(MenuView_Img_Tag + currentIndex) as? UIImageView
                    {
                        findMenuImg.backgroundColor = currentMenuItem.textColor
                    }
                    
                    //改 文字颜色
                    if let findMenuLab = currentMenuItem.viewWithTag(MenuView_Label_Tag + currentIndex) as? UILabel
                    {
                        findMenuLab.textColor = currentMenuItem.textColor
                    }
                }
            }
        }
    }
    
    
    //添加观察者
    fileprivate func addObserver(_ menu: WMMenuItem) {
        menu.addObserver(self, forKeyPath: "textColor", options: .new, context: nil)
    }
    
    //移除观察者
    fileprivate func removeObserver() {
        
        for view in (menuView?.scrollView.subviews)! {
            if let tempView = view as? WMMenuItem
            {
                tempView.removeObserver(self, forKeyPath: "textColor")
            }
        }
        /*
         for (UIView * view in self.menuView.scrollView.subviews)
         {
         if ([view isKindOfClass:[WMMenuItem class]])
         {
         WMMenuItem * getView = (WMMenuItem *)view;
         [getView removeObserver:self forKeyPath:@"textColor"];
         }
         }
         */
    }
}


