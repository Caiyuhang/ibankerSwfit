//
//  IbankerViewController.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/6.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit
import SwiftyJSON

fileprivate let recommendCellId = "recommendCellId"
fileprivate let normalCellId    = "normalCellId"
fileprivate let hotCellId       = "hotCellId"

class IbankerViewController: BaseViewController {

    lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.text = "为你推荐的ibanker"
        lab.font = UIFont.boldSystemFont(ofSize: 24*SCALE)
        lab.textColor = UIColor.black
        return lab
    }()
    
    lazy var searchBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "navigation_search_black"), for: .normal)
        btn.addTarget(self, action: #selector(searchBtnClicked(btn:)), for: .touchUpInside)
        return btn
    }()
    
    @objc fileprivate func searchBtnClicked(btn: UIButton) {
        print("searchBtnClicked")
    }
    
    lazy var dataArray: [AnyObject] = []
    
    lazy var table: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.colorWithHexString(hex: "#eef0f4")
        view.separatorStyle = .none
        view.estimatedRowHeight = 0.0
        view.estimatedSectionHeaderHeight = 0.0
        view.estimatedSectionFooterHeight = 0.0
        if #available(iOS 11.0, *) {
            view.contentInsetAdjustmentBehavior = .never
        }
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fd_prefersNavigationBarHidden = true
        
        setUpUI()
        
        table.mj_header.beginRefreshing()
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

// MARK: UI布局
extension IbankerViewController {
    func setUpUI() {
        //
        self.view.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15*SCALE)
            make.height.equalTo(24*SCALE)
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(30*SCALE)
            } else {
                make.top.equalTo(view).offset(30*SCALE)
            }
        }
        //
        self.view.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { (make) in
            make.right.equalTo(view.snp.right)
            make.centerY.equalTo(titleLab)
            make.width.height.equalTo(40*SCALE)
        }
        //
        self.view.addSubview(table)
        table.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(titleLab.snp.bottom).offset(15*SCALE)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
        }
        
        //刷新
        table.mj_header = IBRefreshHeader(refreshingBlock: { [unowned self] in
            self.getIbankersData()
        })
    }
}


// MARK: 控制器遵循tableView的代理和数据源
extension IbankerViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableModel: IbankerTableModel = dataArray[indexPath.section] as! IbankerTableModel
        switch tableModel.cellType {
        case .recommend?:
            return IbankerRecommendCell_Height
        case .normal?:
            return IbankerNormalCell_Height
        case .hot?:
            return IbankerHotCell_Height
        default:
            return 0.01
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableModel: IbankerTableModel = dataArray[section] as! IbankerTableModel
        if tableModel.cellType == .recommend
        {
            return 1
        }
        else if tableModel.cellType == .normal
        {
            return 1
        }
        else if tableModel.cellType == .hot
        {
            return tableModel.datas.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableModel: IbankerTableModel = dataArray[indexPath.section] as! IbankerTableModel
        //推荐
        if tableModel.cellType == .recommend
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: recommendCellId) as? IbankerRecommendTableViewCell
            if cell == nil {
                cell = IbankerRecommendTableViewCell(style: .default, reuseIdentifier: recommendCellId)
            }
            cell?.backgroundColor = UIColor.clear
            let models = tableModel.datas as? [IbankerRecommendModel]
            cell?.reloadCell(recommeds: models!)
            return cell!
        }
        //正常
        if tableModel.cellType == .normal
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: normalCellId) as? IbankerNormalTableViewCell
            if cell == nil {
                cell = IbankerNormalTableViewCell(style: .default, reuseIdentifier: normalCellId)
            }
            cell?.backgroundColor = UIColor.clear
            let models = tableModel.datas as? [IbankerNormalModel]
            cell?.reloadCell(normals: models!)
            return cell!
        }
        //热门
        if tableModel.cellType == .hot
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: hotCellId) as? IbankerHotTableViewCell
            if cell == nil {
                cell = IbankerHotTableViewCell(style: .default, reuseIdentifier: hotCellId)
            }
            cell?.backgroundColor = UIColor.clear
            let models = tableModel.datas as? [IbankerHotModel]
            let model = models![indexPath.row]
            cell?.reloadCell(model: model)
            //cell?.backgroundColor = UIColor(red: CGFloat((Double)(arc4random()%255)/255.0), green: CGFloat((Double)(arc4random()%255)/255.0), blue: CGFloat((Double)(arc4random()%255)/255.0), alpha: 1)
            return cell!
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了第\(indexPath.section)section,点击了第\(indexPath.row)row")
    }
}

// MARK: 网络请求
extension IbankerViewController {
    
    fileprivate func getIbankersData() {
        RequestManager.selectIbanker(success: { [unowned self] (result, error) in
            
            self.table.mj_header.endRefreshing()
            
            let json = JSON(result as Any)
            if json["code"] == 1
            {
                self.dataArray.removeAll()
                //json转string
                //let jsonString = json.rawString(.utf8, options: .prettyPrinted)
                //print(jsonString as Any)
                
                //推荐
                if let recommendList = json["data"]["ibankerRecommendList"].arrayObject
                {
                    if let list = [IbankerRecommendModel].deserialize(from: recommendList)
                    {
                        let tableModel = IbankerTableModel()
                        tableModel.cellType = .recommend
                        tableModel.datas = list as [AnyObject]
                        self.dataArray.append(tableModel)
                    }
                }
                
                //正常
                if let normalList = json["data"]["ibankerList"].arrayObject
                {
                    if let list = [IbankerNormalModel].deserialize(from: normalList)
                    {
                        let tableModel = IbankerTableModel()
                        tableModel.cellType = .normal
                        tableModel.datas = list as [AnyObject]
                        self.dataArray.append(tableModel)
                    }
                }
                
                //热门
                if let hotList = json["data"]["ibankerHotList"].arrayObject
                {
                    if let list = [IbankerHotModel].deserialize(from: hotList)
                    {
                        let tableModel = IbankerTableModel()
                        tableModel.cellType = .hot
                        tableModel.datas = list as [AnyObject]
                        self.dataArray.append(tableModel)
                    }
                }
                
                //刷新
                self.table.reloadData()
                
            }
            else
            {
                //toast
            }
            
        }) { (error) in
            //toast
            self.table.mj_header.endRefreshing()
        }
    }
}



