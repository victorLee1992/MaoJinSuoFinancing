//
//  MJSRootController.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/5.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import UIKit

class MJSRootController: MJSTabController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createChildrenVCs()
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


// MARK: -  设置子视图
extension MJSRootController{
    
    func createChildrenVCs() -> Void {
        
        let size = CGSize(width: 22, height: 22)
        
        let homeNaviController  = MJSNaviController(rootViewController: MJSHomeController())
        homeNaviController.tabBarItem = MJSTabBarItem(title: "首页", image: UIImage.thumbnailImageSize(size, fromImage: #imageLiteral(resourceName: "i_tab_home")).withRenderingMode(.alwaysOriginal) , selectedImage: UIImage.thumbnailImageSize(size, fromImage: #imageLiteral(resourceName: "i_tab_home_sel")).withRenderingMode(.alwaysOriginal))
        
        let productNviController = MJSNaviController (rootViewController: MJSProductListController())
        productNviController.tabBarItem = MJSTabBarItem(title: "产品", image: UIImage.thumbnailImageSize(size, fromImage: #imageLiteral(resourceName: "i_tab_product_sel")).withRenderingMode(.alwaysOriginal), selectedImage: UIImage.thumbnailImageSize(size, fromImage: #imageLiteral(resourceName: "i_tab_product_sel")).withRenderingMode(.alwaysOriginal))
        
        let centerNaviController = MJSNaviController (rootViewController: MJSCenterController())
        centerNaviController.tabBarItem = MJSTabBarItem(title: "我的", image: UIImage.thumbnailImageSize(size, fromImage: #imageLiteral(resourceName: "i_tab_center")).withRenderingMode(.alwaysOriginal), selectedImage: UIImage.thumbnailImageSize(size, fromImage: #imageLiteral(resourceName: "i_tab_center_sel")).withRenderingMode(.alwaysOriginal))
        
        self.setViewControllers([homeNaviController,productNviController,centerNaviController], animated: true)
    }
    
}
