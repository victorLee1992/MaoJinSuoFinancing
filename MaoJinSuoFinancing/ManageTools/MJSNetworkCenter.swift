//
//  MJSNetworkCenter.swift
//  MaoJinSuoFinancing
//
//  Created by lixiong on 2017/8/7.
//  Copyright © 2017年 ChiFu. All rights reserved.
//

import UIKit


enum MJSRequestType {
    case POST
    case GET
}

class MJSNetworkCenter: AFHTTPSessionManager {

    static let shared : MJSNetworkCenter = {
       
        let center : MJSNetworkCenter = MJSNetworkCenter()
        
        center.requestSerializer = AFJSONRequestSerializer()
        center.requestSerializer.timeoutInterval = 15.0
        
        center.responseSerializer = AFJSONResponseSerializer()
        center.responseSerializer.acceptableContentTypes = [
            "application/json",
            "text/html",
            "text/plain",
            "image/jpeg",
            "image/png",
            "application/octet-stream",
            "text/json",
        ] as Set
        return center
    }()
    
}




extension MJSNetworkCenter{
    
    
    func requestData(parameters : [String :Any]?, biztype : bizType , resultBlock : @escaping ( AnyObject? , Error?) -> ()) {
        
        let param  = addRequestCommonCharacters(parameters, biztype: biztype)
        let url = NSString(format: "%@://%@/%@", getUrlScheme(),getUrlServerIp(),getUrlServerPath()) as String
        
        let successBlock = { (task : URLSessionTask , responseObj : Any?) in
            guard (responseObj as! NSDictionary).count != 0 else {
                
                resultBlock(nil ,nil)
                return
            }
            let object : AnyObject = (responseObj as! Dictionary<String, Any>)["data"] as AnyObject
        
            resultBlock( object , nil)
        }
        
        let failureBlock = { (task : URLSessionTask? , error : Error?) in
            resultBlock(nil , error)
        }
        
        post(url, parameters: param, progress: nil, success: successBlock, failure: failureBlock)
        
    }
    
}



extension MJSNetworkCenter{
    
    func addRequestCommonCharacters(_ param : [String : Any]? , biztype : bizType) -> [String: Any] {
        
        var terminalDict : [String : Any] = [String : Any]()
        if param != nil && !param!.isEmpty {
            terminalDict["data"] = param
        }
        
        terminalDict["version"] = "1.0"
        terminalDict["appVersion"] = "iOS1.0"
        terminalDict["bizType"] = biztype.rawValue
        terminalDict["appName"] = "mjs"
        
        // MARK: 添加用户标识符
        
        return terminalDict
    }
    
}
