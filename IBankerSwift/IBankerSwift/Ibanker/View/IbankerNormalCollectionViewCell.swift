//
//  IbankerNormalCollectionViewCell.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/12.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit
import Kingfisher

class IbankerNormalModel: BaseModel {
    
    var resumeLogo: String?
    var ibankerLeve: String?
    var resumeUserId: Int?
    var resumePosition: String?
    var resumeFullName: String?
    var ibankerHelpNum: Int?
}

let IbankerNormalCell_Height = 150 * SCALE
let IbankerNormalCell_Width = 110 * SCALE

class IbankerNormalCollectionViewCell: UICollectionViewCell {
    
    lazy var protraitImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "protrait_default_placeholder")
        img.layer.cornerRadius = 30*SCALE
        img.layer.masksToBounds = true
        return img
    }()
    
    lazy var levelImg: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    lazy var nameLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.colorWithHexString(hex: "#313131")
        lab.textAlignment = NSTextAlignment.center
        lab.font = UIFont.systemFont(ofSize: 14*SCALE)
        return lab
    }()
    
    lazy var helpNumLab: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 12*SCALE)
        return lab
    }()
    
    lazy var positionLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.colorWithHexString(hex: "#828b97")
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 11*SCALE)
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
extension IbankerNormalCollectionViewCell {
    func setUpUI() {
        //
        contentView.addSubview(protraitImg)
        protraitImg.snp.remakeConstraints { (make) in
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.top.equalTo(15*SCALE)
            make.width.height.equalTo(60*SCALE)
        }
        
        //
        contentView.addSubview(levelImg)
        levelImg.snp.remakeConstraints { (make) in
            make.bottom.equalTo(protraitImg.snp.bottom)
            make.right.equalTo(protraitImg.snp.right)
            make.width.equalTo(18*SCALE)
            make.height.equalTo(11*SCALE)
        }
        
        //
        contentView.addSubview(nameLab)
        nameLab.snp.remakeConstraints { (make) in
            make.left.equalTo(5*SCALE)
            make.right.equalTo(-5*SCALE)
            make.top.equalTo(protraitImg.snp.bottom).offset(10*SCALE)
            make.height.equalTo(14*SCALE)
        }
        
        //
        contentView.addSubview(helpNumLab)
        helpNumLab.snp.remakeConstraints { (make) in
            make.left.equalTo(5*SCALE)
            make.right.equalTo(-5*SCALE)
            make.top.equalTo(nameLab.snp.bottom).offset(8*SCALE)
            make.height.equalTo(12*SCALE)
        }
        
        //
        contentView.addSubview(positionLab)
        positionLab.snp.remakeConstraints { (make) in
            make.left.equalTo(5*SCALE)
            make.right.equalTo(-5*SCALE)
            make.top.equalTo(helpNumLab.snp.bottom).offset(7*SCALE)
            make.height.equalTo(11*SCALE)
        }
        
    }
}

// MARK: 刷新UI
extension IbankerNormalCollectionViewCell {
    func reloadCell(model: IbankerNormalModel) {
        
        protraitImg.kf.setImage(with: ImageResource(downloadURL: URL(string: model.resumeLogo!)!), placeholder: UIImage(named: "protrait_default_placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        
        if (model.ibankerLeve != nil)
        {
            if (model.ibankerLeve?.toInt() == IBankerLevel.general.rawValue)
            {
                levelImg.image = UIImage(named: "ibanker_level_general")
            }
            else if (model.ibankerLeve?.toInt() == IBankerLevel.middle.rawValue)
            {
                levelImg.image = UIImage(named: "ibanker_level_middle")
            }
            else if (model.ibankerLeve?.toInt() == IBankerLevel.senior.rawValue)
            {
                levelImg.image = UIImage(named: "ibanker_level_senior")
            }
            else if (model.ibankerLeve?.toInt() == IBankerLevel.league.rawValue)
            {
                levelImg.image = nil
            }
        }
        else
        {
            levelImg.image = nil
        }
        
        nameLab.text = model.resumeFullName
        
        let helpNum_str = "\(String(format: "%d", model.ibankerHelpNum!))次解答"
        let helpNum_attrStr = NSMutableAttributedString(string: helpNum_str)
        let dict1 = [
            NSAttributedStringKey.foregroundColor : UIColor.colorWithHexString(hex: "#0f9296")
        ]
        let dict2 = [
            NSAttributedStringKey.foregroundColor: UIColor.colorWithHexString(hex: "#828b97")
        ]
        helpNum_attrStr.setAttributes(dict1, range: NSMakeRange(0, helpNum_str.count-3))
        helpNum_attrStr.setAttributes(dict2, range: NSMakeRange(helpNum_str.count-3, 3))
        
        helpNumLab.attributedText = helpNum_attrStr
        
        positionLab.text = model.resumePosition
        
    }
}

