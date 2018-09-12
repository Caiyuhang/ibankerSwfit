//
//  IbankerHotTableViewCell.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/12.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit
import Kingfisher

class IbankerHotModel: BaseModel {
    var resumeUserId: Int?
    var resumeLogo: String?
    var resumeMyword: String?
    var resumeViewNum: Int?
    var successRate: Double?
    var resumePosition: String?
    var resumeFullName: String?
    var ibankerHelpNum: Int?
    var resumePartnerNum: Int?
    var resumeCollectedNum: Int?
    var ibankerLeve: String?
}

let IbankerHotCell_Height   = 100 * SCALE + 1

class IbankerHotTableViewCell: UITableViewCell {

    lazy var protraitImgView: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 20*SCALE
        img.layer.masksToBounds = true
        return img
    }()
    
    lazy var levelImg: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    lazy var nameLab: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 16*SCALE)
        lab.textColor = UIColor.colorWithHexString(hex: "#313131")
        return lab
    }()
    
    lazy var positionLab: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 12*SCALE)
        lab.textColor = UIColor.colorWithHexString(hex: "#828b97")
        return lab
    }()
    
    lazy var img1: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ibankerList_partnernum")
        return img
    }()
    
    lazy var lab1: UILabel = {
        let lab1 = UILabel()
        lab1.font = UIFont.systemFont(ofSize: 10*SCALE)
        lab1.textColor = UIColor.colorWithHexString(hex: "#828b97")
        return lab1
    }()
    
    lazy var img2: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ibankerList_helpnum")
        return img
    }()
    
    lazy var lab2: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 10*SCALE)
        lab.textColor = UIColor.colorWithHexString(hex: "#828b97")
        return lab
    }()
    
    lazy var img3: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ibankerList_collectnum")
        return img
    }()
    
    lazy var lab3: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 10*SCALE)
        lab.textColor = UIColor.colorWithHexString(hex: "#828b97")
        return lab
    }()
    
    lazy var line: UIView = {
        let l = UIView()
        l.backgroundColor = UIColor.colorWithHexString(hex: "#c6d1e0")
        return l
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: UI布局
extension IbankerHotTableViewCell {
    func setUpUI() {
        
        contentView.addSubview(protraitImgView)
        protraitImgView.snp.remakeConstraints { (make) in
            make.left.equalTo(15*SCALE)
            make.top.equalTo(30*SCALE)
            make.width.height.equalTo(40*SCALE)
        }
        
        contentView.addSubview(levelImg)
        levelImg.snp.remakeConstraints { (make) in
            make.bottom.equalTo(protraitImgView.snp.bottom)
            make.right.equalTo(protraitImgView.snp.right)
            make.width.equalTo(18*SCALE)
            make.height.equalTo(11*SCALE)
        }
        
        contentView.addSubview(nameLab)
        nameLab.snp.remakeConstraints { (make) in
            make.left.equalTo(protraitImgView.snp.right).offset(15*SCALE)
            make.top.equalTo(protraitImgView.snp.top)
            make.height.equalTo(16*SCALE)
        }
        
        contentView.addSubview(positionLab)
        positionLab.snp.remakeConstraints { (make) in
            make.left.equalTo(nameLab.snp.right).offset(15*SCALE)
            make.centerY.equalTo(nameLab.snp.centerY)
            make.height.equalTo(12*SCALE)
        }
        
        contentView.addSubview(img1)
        img1.snp.remakeConstraints { (make) in
            make.left.equalTo(nameLab.snp.left)
            make.top.equalTo(nameLab.snp.bottom).offset(7*SCALE)
            make.width.height.equalTo(15*SCALE)
        }
        
        contentView.addSubview(lab1)
        lab1.snp.remakeConstraints { (make) in
            make.left.equalTo(img1.snp.right).offset(5*SCALE)
            make.centerY.equalTo(img1.snp.centerY)
            make.height.equalTo(10*SCALE)
        }
        
        contentView.addSubview(img2)
        img2.snp.remakeConstraints { (make) in
            make.left.equalTo(lab1.snp.right).offset(19*SCALE)
            make.top.equalTo(img1.snp.top)
            make.width.height.equalTo(15*SCALE)
        }
        
        contentView.addSubview(lab2)
        lab2.snp.remakeConstraints { (make) in
            make.left.equalTo(img2.snp.right).offset(5*SCALE)
            make.centerY.equalTo(img2.snp.centerY)
            make.height.equalTo(10*SCALE)
        }
        
        contentView.addSubview(img3)
        img3.snp.remakeConstraints { (make) in
            make.left.equalTo(lab2.snp.right).offset(19*SCALE)
            make.top.equalTo(img2.snp.top)
            make.width.height.equalTo(15*SCALE)
        }
        
        contentView.addSubview(lab3)
        lab3.snp.remakeConstraints { (make) in
            make.left.equalTo(img3.snp.right).offset(5*SCALE)
            make.centerY.equalTo(img3.snp.centerY)
            make.height.equalTo(10*SCALE)
        }
        
        contentView.addSubview(line)
        line.snp.remakeConstraints { (make) in
            make.top.equalTo(protraitImgView.snp.bottom).offset(30*SCALE)
            make.height.equalTo(1.0)
            make.left.equalTo(15*SCALE)
            make.right.equalTo(-15*SCALE)
        }
        
    }
}

// MARK: 刷新cell
extension IbankerHotTableViewCell {
    func reloadCell(model: IbankerHotModel) {
        
        protraitImgView.kf.setImage(with: ImageResource(downloadURL: URL(string: model.resumeLogo!)!), placeholder: UIImage(named: "protrait_default_placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        
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
        
        positionLab.text = model.resumePosition
        
        lab1.text = String(format: "%d", model.resumePartnerNum!) + "位客户"
        lab2.text = String(format: "%d", model.ibankerHelpNum!) + "次咨询"
        lab3.text = String(format: "%d", model.resumeCollectedNum!) + "次收藏"
        
        nameLab.snp.updateConstraints { (make) in
            
        }
        positionLab.snp.updateConstraints { (make) in
            
        }
        img1.snp.updateConstraints { (make) in
            
        }
        lab1.snp.updateConstraints { (make) in
            
        }
        img2.snp.updateConstraints { (make) in
            
        }
        lab2.snp.updateConstraints { (make) in
            
        }
        img3.snp.updateConstraints { (make) in
            
        }
        lab3.snp.updateConstraints { (make) in
            
        }
        
    }
}



