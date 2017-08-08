//
//  MJSHomeController.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/5.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import UIKit

fileprivate let bannerIdentifier = "bannerIdentifier"


class MJSHomeController: MJSBaseController {
    
    var bannerData : [MJSBannerData]?
    let cellH = kScreenW/2
    
    lazy var uiTableView : UITableView = { [unowned self] in
        
        let tableView : UITableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        tableView.tableFooterView = UIView()
        tableView.register(MJSBannerCell.self, forCellReuseIdentifier: bannerIdentifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("开始去请求banner数据")
        
        view.addSubview(uiTableView)
        getBannerData()
        // Do any additional setup after loading the view.
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


extension MJSHomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell : MJSBannerCell = tableView.dequeueReusableCell(withIdentifier: bannerIdentifier, for: indexPath) as! MJSBannerCell
        cell.setData(data: bannerData)
        cell.cell_height = cellH
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kScreenW/2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}

// MARK:  获取网络数据
extension MJSHomeController{
    
    func getBannerData() -> Void {
        
        MJSNetworkCenter.shared.requestData(parameters: nil, biztype: .bizTypeBanner) { (response, errot) in
            
            print(" shuju : %@ ",response as Any)
            
            guard response != nil else{
                return
            }
            self.bannerData = [MJSBannerData]()
            let list : [[String : AnyObject]] = (response as! Dictionary)["banners"]!
            for temp  in list {
                self.bannerData?.append(MJSBannerData(linkUrl: temp["linkUrl"] as? String, name: temp["picName"] as? String, picUrl: temp["picUrl"] as? String))
            }
            
            
            self.uiTableView.reloadData()
        }
        
    }
    
}
