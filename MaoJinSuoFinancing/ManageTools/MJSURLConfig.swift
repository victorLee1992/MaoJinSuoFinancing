//
//  MJSURLConfig.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/7.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import UIKit

fileprivate let isDis : Bool = true

fileprivate let URL_SCHEME : String = isDis == true ? "https" : "http"
fileprivate let URL_SERVERIP : String = isDis == true ? "www.51mjs.com" : "222.66.76.2:8081"
fileprivate let URL_SERVERPATH : String = isDis == true ? "api/service" : "api/service"

public func getUrlScheme() -> String{
    return URL_SCHEME
}

public func getUrlServerIp() -> String{
    
    return URL_SERVERIP
}

public func getUrlServerPath() -> String{
    
    return URL_SERVERPATH
}

enum bizType : String {
    case bizTypeBanner = "M040"
    case bizTypeCheckVersion  = "M047"
}

class MJSURLConfig: NSObject {

    
    
    
}
