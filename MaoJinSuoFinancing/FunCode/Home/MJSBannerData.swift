//
//  MJSBannerData.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/7.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import UIKit

class MJSBannerData: MJSDataModel {

    var linkUrl : String?
    var picName : String?
    var picUrl : String?
    
    init( linkUrl : String? , name : String? , picUrl :String? ) {
        super.init()
        
        self.linkUrl = linkUrl
        self.picName = name
        self.picUrl = picUrl
    }
    
}
