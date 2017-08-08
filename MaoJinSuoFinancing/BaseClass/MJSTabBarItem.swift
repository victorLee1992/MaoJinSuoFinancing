//
//  MJSTabBarItem.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/5.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import UIKit

class MJSTabBarItem: UITabBarItem {

    
    override init() {
        
        super.init()
        
        self.setTitleTextAttributes( [NSForegroundColorAttributeName :UIColor.hexInt(0x00C6A8) ], for: UIControlState.selected)
        self.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.hexInt(0xB5BBBA)], for: UIControlState.normal)
        
//        self.imageInsets = UIEdgeInsetsMake(15, 0,-5, 0)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
