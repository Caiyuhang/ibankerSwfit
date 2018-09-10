//
//  ProductTableViewCell.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/7.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    lazy var imgView: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.colorWithHexString(hex: "#0f9296")
        lab.font = UIFont.systemFont(ofSize: 10*SCALE)
        return lab
    }()
    
    lazy var contentLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.colorWithHexString(hex: "#535860")
        lab.font = UIFont.boldSystemFont(ofSize: 16*SCALE)
        return lab
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.colorWithHexString(hex: "#c6d1e0")
        return line
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
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

// MAKR: 创建UI
extension ProductTableViewCell {
    
    fileprivate func setUpUI() {
        
        self.contentView.addSubview(imgView)
        imgView.snp.remakeConstraints { (make) in
            make.top.equalTo(30*SCALE)
            make.left.equalTo(15*SCALE)
            make.right.equalTo(-15*SCALE)
            make.height.equalTo(208*SCALE)
        }
        
        self.contentView.addSubview(titleLab)
        titleLab.snp.remakeConstraints { (make) in
            make.left.equalTo(imgView.snp.left)
            make.top.equalTo(imgView.snp.bottom).offset(20*SCALE)
            make.height.equalTo(10*SCALE)
            make.right.lessThanOrEqualTo(imgView.snp.right)
        }
        
        self.contentView.addSubview(contentLab)
        contentLab.snp.remakeConstraints { (make) in
            make.top.equalTo(titleLab.snp.bottom).offset(8*SCALE)
            make.left.equalTo(titleLab.snp.left)
            make.height.equalTo(16*SCALE)
            make.right.lessThanOrEqualTo(imgView.snp.right)
        }
        
        self.contentView.addSubview(line)
        line.snp.remakeConstraints { (make) in
            make.left.equalTo(15*SCALE)
            make.right.equalTo(-15*SCALE)
            make.height.equalTo(1.0)
            make.top.equalTo(contentLab.snp.bottom).offset(20*SCALE)
        }
    }
}

// MARK: 刷新UI
extension ProductTableViewCell {
    func reloadCell(model: ProductLibraryModel) {
        titleLab.text = model.productPassageShortInfo
        contentLab.text = model.productPassageTitle
    }
}
