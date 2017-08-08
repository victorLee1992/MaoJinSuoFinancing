//
//  MJSHttpCenter.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/7.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import UIKit
//import Alamofire

/*
enum MJSRequestType : String{
    case POST = "POST"
    case GET = "GET"
}*/

typealias resultBlock = (AnyObject) -> Void

class MJSHttpCenter: NSObject {

    
    static let shared : MJSHttpCenter = {
        
        let  center : MJSHttpCenter = MJSHttpCenter()
        
        return center
    }()
    
    
    /*
    func requestData(_ type: bizType , param : Parameters? , success : @escaping resultBlock ) -> Void {
        
        let url : NSString = NSString(format: "%@://%@/%@", getUrlScheme(),getUrlServerIp(),getUrlServerPath())
        
        let terminalParam = addRequestCommonCharacters(param, biztype: type)
        
        Alamofire.request(url as String, method: .post, parameters: terminalParam , encoding: URLEncoding.default , headers: nil).validate(contentType: ["application/json" , "text/html","plain/json"]).responseJSON { (response) in
            
            if let json = response.result.value {
                
                print("请求结果是 : %@",json)
                
                success(json as AnyObject)
            }
            
        }
       
    }
    */
    
}

