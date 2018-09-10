//
//  ProductViewController.swift
//  IBankerSwift
//
//  Created by 蔡宇航 on 2018/9/6.
//  Copyright © 2018年 蔡宇航. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

private let CellIdent = "productCell"

class ProductViewController: BaseViewController {

    lazy var dataArray = [ProductLibraryModel]()
    
    lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.text = "为你精选的产品"
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
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        getProductsData()
    }
    
    @objc fileprivate func searchBtnClicked(btn: UIButton) {
        print("searchBtnClicked")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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

extension ProductViewController {
    fileprivate func setUpUI() {
        
        //
        self.view.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15*SCALE)
            make.height.equalTo(24*SCALE)
            if #available(iOS 11.0, *) {
                //make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
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
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLab.snp.bottom)
//            make.bottom.equalTo(view.snp.bottom)
            if #available(iOS 11.0, *) {
                 make.bottom.equalTo(view.safeAreaInsets.bottom)
            } else {
                 make.bottom.equalTo(view.snp.bottom)
            }
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        
    }
}

//控制器遵循tableView的代理和数据源
extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 294*SCALE
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CellIdent) as? ProductTableViewCell
        if cell == nil {
            cell = ProductTableViewCell(style: .default, reuseIdentifier: CellIdent)
        }
        let cellModel = dataArray[indexPath.row]
        cell?.reloadCell(model: cellModel)
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了第\(indexPath.row)行")
    }
}

extension ProductViewController {
    fileprivate func getProductsData() {
        RequestManager.selectProduct(pageNum: 1, search: nil, success: { (result, error) in
            
            if error != nil {
                print("请求失败")
                return
            }
            let json = JSON(result)
            //print("JSON:\(json)")
            if json["code"] == 1
            {
                let jsonString = json.rawString(.utf8, options: .prettyPrinted)
                
//                let products = [ProductLibraryModel].deserialize(from: jsonString, designatedPath: "data.ProductList")
//                if let array = products?.first as? ProductLibraryModel {
//                    self.dataArray.append(array)
//                    self.tableView.reloadData()
//                }
                
                
                if let products = [ProductLibraryModel].deserialize(from: jsonString, designatedPath: "data.ProductList") {
                    //print("ARRAY:\(array)")
                    
                    for item in products
                    {
                        if let product = item as? ProductLibraryModel
                        {
                            self.dataArray.append(item!)
                        }
                    }
                    self.tableView.reloadData()
//                    dataArray.append(products)
                }
            }
            else
            {
                
            }
            
            
        }) { (error) in
            
        }
    }
}

