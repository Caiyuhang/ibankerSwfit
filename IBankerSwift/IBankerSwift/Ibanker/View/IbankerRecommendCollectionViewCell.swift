//
//  IbankerRecommendCollectionViewCell.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/12.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit
import Kingfisher

class IbankerRecommendModel: BaseModel {
    var resumeUserId: NSInteger?
    var resumeMyword: String?
    var resumePosition: String?
    var resumeFullName: String?
    var showImg: String?
}

class IbankerRecommendCollectionViewCell: UICollectionViewCell {
    
    lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.colorWithHexString(hex: "#ffffff")
        return view
    }()
    
    lazy var imgView: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    lazy var nameLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.colorWithHexString(hex: "#313131")
        lab.font = UIFont.boldSystemFont(ofSize: 19*SCALE)
        return lab
    }()
    
    lazy var positionLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.colorWithHexString(hex: "#535860")
        lab.font = UIFont.systemFont(ofSize: 14*SCALE)
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: UI布局
extension IbankerRecommendCollectionViewCell {
    func setUpUI() {
        contentView.addSubview(whiteView)
        whiteView.snp.remakeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(15*SCALE)
            make.right.equalTo(-15*SCALE)
            make.bottom.equalTo(0)
        }
        
        whiteView.addSubview(imgView)
        imgView.snp.remakeConstraints { (make) in
            make.left.equalTo(whiteView.snp.left)
            make.top.equalTo(whiteView.snp.top)
            make.width.equalTo(whiteView.snp.width)
            make.height.equalTo(whiteView.snp.width)
        }
        
        whiteView.addSubview(nameLab)
        nameLab.snp.remakeConstraints { (make) in
            make.left.equalTo(15*SCALE)
            make.right.equalTo(-15*SCALE)
            make.top.equalTo(imgView.snp.bottom).offset(20*SCALE)
            make.height.equalTo(20*SCALE)
        }
        
        whiteView.addSubview(positionLab)
        positionLab.snp.remakeConstraints { (make) in
            make.left.equalTo(nameLab.snp.left)
            make.right.equalTo(nameLab.snp.right)
            make.top.equalTo(nameLab.snp.bottom).offset(8*SCALE)
            make.height.equalTo(14*SCALE)
        }
        
    }
}

// MARK: 刷新cell
extension IbankerRecommendCollectionViewCell {
    func reloadCell(model: IbankerRecommendModel) {
        
        imgView.kf.setImage(with: ImageResource(downloadURL: URL(string: model.showImg!)!), placeholder: UIImage(named: "placeholder_default"), options: nil, progressBlock: nil, completionHandler: nil)
        nameLab.text = model.resumeFullName
        positionLab.text = model.resumePosition
    }
}

