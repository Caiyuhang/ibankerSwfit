//
//  IbankerNormalTableViewCell.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/12.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

fileprivate let CollectCellId = "NormalIBankerCollectionCell"

class IbankerNormalTableViewCell: UITableViewCell {

    var models: [IbankerNormalModel]?
    
    lazy var collectView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: IbankerNormalCell_Width, height: IbankerNormalCell_Height)
        flowLayout.minimumLineSpacing = 0.01
        flowLayout.minimumInteritemSpacing = 0.01
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.clear
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.bounces = false
        if #available(iOS 11.0, *) {
            view.contentInsetAdjustmentBehavior = .never
        }
        //注册
        view.register(IbankerNormalCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: CollectCellId)
        return view
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
extension IbankerNormalTableViewCell {
    fileprivate func setUpUI() {
        
        contentView.addSubview(collectView)
        collectView.snp.makeConstraints { (make) in
            make.left.equalTo(0.0)
            make.top.equalTo(0.0)
            make.right.equalTo(0.0)
            make.height.equalTo(IbankerNormalCell_Height-15*SCALE)
        }
        
    }
}

extension IbankerNormalTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (models?.count)!
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectCellId, for: indexPath) as? IbankerNormalCollectionViewCell
        let model = models![indexPath.item]
        cell?.reloadCell(model: model)
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: 刷新cell
extension IbankerNormalTableViewCell {
    func reloadCell(normals: [IbankerNormalModel]) {
        models = normals
        collectView.reloadData()
    }
}
