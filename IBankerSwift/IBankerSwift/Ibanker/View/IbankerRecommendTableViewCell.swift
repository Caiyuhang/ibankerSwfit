//
//  IbankerRecommendTableViewCell.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/12.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit

let IbankerRecommendCell_Height = 327 * SCALE
let IbankerRecommendCell_Width = 240 * SCALE
fileprivate let CollectCellId: String = "RecommendIBankerCollectionCell"

class IbankerRecommendTableViewCell: UITableViewCell {

    var models: [IbankerRecommendModel]?
    
    lazy var collectView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: IbankerRecommendCell_Width, height: IbankerRecommendCell_Height)
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
        //注册cell
        view.register(IbankerRecommendCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: CollectCellId)
        
        return view
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
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
extension IbankerRecommendTableViewCell {
    func setUpUI() {
        
        contentView.addSubview(collectView)
        collectView.snp.remakeConstraints { (make) in
            make.left.equalTo(15*SCALE)
            make.top.equalTo(15*SCALE)
            make.right.equalTo(0)
            make.height.equalTo(IbankerRecommendCell_Height-15*SCALE*2)
        }
        
    }
}

// MARK: collectionView的代理和数据源
extension IbankerRecommendTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (models?.count)!
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectView.dequeueReusableCell(withReuseIdentifier: CollectCellId, for: indexPath) as! IbankerRecommendCollectionViewCell
        let model = models![indexPath.item]
        cell.reloadCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: 刷新UI
extension IbankerRecommendTableViewCell {
    func reloadCell(recommeds: [IbankerRecommendModel]) {
        self.models = recommeds
        collectView.reloadData()
    }
}

