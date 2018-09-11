//
//  IBRefreshHeader.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/11.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

class IBRefreshHeader: MJRefreshGifHeader {

    override func prepare() {
        super.prepare()
        
        labelLeftInset = 0.0
        lastUpdatedTimeLabel.isHidden = true
        stateLabel.isHidden = true
        
        var idleImages = [UIImage]()
        for i in 0...44 {
            let img = UIImage(named: "loading_prepare_\(i)")! as UIImage
            idleImages.append(img)
        }
        
        var refreshingImages = [UIImage]()
        for i in 1...51 {
            let img = UIImage(named: "loading_animate_\(i)")! as UIImage
            refreshingImages.append(img)
        }
        
        //设置普通状态的动画图片
        setImages(idleImages, duration: 1, for: MJRefreshState.idle)
        //设置下拉操作时动画图片
        setImages(idleImages, duration: 1, for: MJRefreshState.pulling)
        //设置正在刷新时动画图片
        setImages(refreshingImages, duration: 1, for: MJRefreshState.refreshing)
        
        
    }
    
    override func setImages(_ images: [Any]!, for state: MJRefreshState) {
        setImages(images, duration: 1, for: state)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
