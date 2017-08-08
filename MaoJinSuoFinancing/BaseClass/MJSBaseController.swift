//
//  MJSBaseController.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/5.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import UIKit

class MJSBaseController: LXBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bg_Color = RGBA(r : 244 ,g : 244 , b :244 ,a:1)
        self.view.backgroundColor = bg_Color
        
        navigationItem.title = "贸金所"
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
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
