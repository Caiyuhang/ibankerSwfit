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
    
    // 1、定义一个闭包类型
    typealias detailCallBack = (_ recommendModel: IbankerRecommendModel) -> Void
    // 2、声明一个变量
    var callBack: detailCallBack?
    
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
        // 4、调用闭包.设置你想传递的参数，调用前先判定一下，是否已实现
        if callBack != nil
        {
            let model = models![indexPath.item]
            callBack!(model)
            //参考https://www.jianshu.com/p/c1059b2f3351
        }
    }
    
    // 3、定义一个方法，方法的参数为和recommendDetail类型一致的闭包，并赋值给callBack
    //failure: @escaping((_ error: Error?) -> Void)
    func gotoRecommendDetail(block: @escaping detailCallBack) {
        callBack = block
    }
}

// MARK: 刷新UI
extension IbankerRecommendTableViewCell {
    func reloadCell(recommeds: [IbankerRecommendModel]) {
        self.models = recommeds
        collectView.reloadData()
    }
}

