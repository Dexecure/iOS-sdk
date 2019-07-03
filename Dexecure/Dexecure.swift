//  Dexecure.swift
//  Dexecure
//
//  Copyright © 2019 net.Dexecure. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation


public class Dexecure: NSObject {
    
    //MARK: Class Variables
    
    public var host: String?
    public var useHttps: Bool = true
    public var urlStr : String?
    //MARK: DexecureUrlBuilder Class property initialiser
    
    public init(host: String) {
        self.host = host
    }
    
    public init(host: String, useHttps: Bool) {
        self.host = host
        self.useHttps = useHttps
    }
    
    //MARK: Build URl method
    public func buildUrl(_ path: String, params: OrderedDictionary<String, Any>) -> URL {
        let path = sanitizePath(path)
        var urlComponents = URLComponents.init()
        urlComponents.scheme = useHttps ? "https" : "http"
        urlComponents.host = self.host
        urlComponents.percentEncodedPath = path
        urlComponents.queryItems = buildParams(params)
        
        if urlComponents.queryItems!.isEmpty {
            urlComponents.queryItems = nil
        } else {
            urlComponents.percentEncodedQuery = encodeQueryItems(urlComponents.queryItems!)
        }
        print("DEXECURE URL++++" , urlComponents.url!)
        return urlComponents.url!
    }
    
    @objc public func buildUrl(_ path: String) -> URL {
        return buildUrl(path, params: OrderedDictionary<String, Any>())
    }
    
    fileprivate func sanitizePath(_ path: String) -> String {
        var path = path
        
        if path.hasPrefix("http://") || path.hasPrefix("https://") {
            path = path.dexeCureEncodeUrlComponent()
        }
        
        if !path.hasPrefix("/") {
            path = "/" + path
        }
        
        return path
    }
    
    
    fileprivate func encodeQueryItems(_ queryItems: [URLQueryItem]) -> String {
        var queryPairs = [String]()
        for queryItem in queryItems {
            let encodedKey = queryItem.name.dexeCureEncodeUrlComponent()
            let encodedVal = queryItem.value!.dexeCureEncodeUrlComponent()
            switch encodedKey{
            case Constants.Key.resize:
                queryPairs.append(encodedKey + "=" + encodedVal)
                break;
            case Constants.Key.optimizationMode:
                switch encodedVal{
                case Constants.Value.optimizationDefault:
                    queryPairs.append( encodedKey + "=" + encodedVal)
                    break;
                case Constants.Value.optimizationMild:
                    queryPairs.append(encodedKey + "=" + encodedVal)
                    break;
                case Constants.Value.optimizationAggressive:
                    queryPairs.append(encodedKey + "=" + encodedVal)
                    break;
                case Constants.Value.optimizationNone:
                    queryPairs.append(encodedKey + "=" + encodedVal)
                    break;
                default:
                    print("NG")
                }
                break;
            case Constants.Key.cropMode:
                queryPairs.append(encodedVal + "=")
                break;
            case Constants.Key.width:
                if queryPairs.contains("resize_c="){
                    queryPairs = queryPairs.filter{$0 != "resize_c="}
                    if (queryPairs.contains(urlStr ?? "")) {
                        queryPairs.append( encodedKey + encodedVal)
                    } else {
                        queryPairs.append("resize_c=" + encodedKey + encodedVal)
                        urlStr = "resize_c=" + encodedKey + encodedVal
                    }
                }else{
                    if (queryPairs.contains(urlStr ?? "")) {
                        queryPairs.append(encodedKey + encodedVal)
                    } else {
                        queryPairs.append("resize=" + encodedKey + encodedVal);
                        urlStr = "resize=" + encodedKey + encodedVal
                    }
                }
                break;
            case Constants.Key.height:
                if queryPairs.contains("resize_c=") {
                    queryPairs = queryPairs.filter{$0 != "resize_c="}
                    if (queryPairs.contains(urlStr ?? "")) {
                        queryPairs.append( encodedKey + encodedVal)
                    } else {
                        queryPairs.append("resize_c=" + encodedKey + encodedVal)
                        urlStr = "resize_c=" + encodedKey + encodedVal
                    }
                }else{
                    if (queryPairs.contains(urlStr ?? "")) {
                        queryPairs.append(encodedKey + encodedVal)
                    } else {
                        queryPairs.append("resize=" + encodedKey + encodedVal);
                        urlStr = "resize=" + encodedKey + encodedVal
                    }
                }
                break;
            default:
                queryPairs.append(encodedKey + "=" + encodedVal)
            }
        }
        return joinKeys(queryList: queryPairs)
    }
    
    
    fileprivate func buildParams(_ params: OrderedDictionary<String, Any>) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        let queryParams: OrderedDictionary = params
        
        _ = queryParams.map { (key , val)  in
            var stringVal = String(describing: val)
            if (key as AnyObject).hasSuffix("64") {
                stringVal = stringVal.dexeCureEncode64()
            }
            let queryItem = URLQueryItem.init(name: key , value: stringVal)
            queryItems.append(queryItem)
        }
        return queryItems
    }
    
    
    
    //MARK: Add Comma after Keys
    
    fileprivate func joinKeys(queryList : [String]) -> String{
        var finalStr : String = ""
        //  var sep : String = ""
        print("COUNT", queryList.count)
        if queryList.count > 1{
            for i in 0..<(queryList.count){
                let subStr : String = queryList[i]
                print("SUBSTRING==", subStr)
                if queryList[i].first == "w"{
                    if (i == queryList.count - 1){
                        finalStr.append(queryList[i])
                    }else{
                        finalStr.append(queryList[i] + ",")
                    }
                }
                else if  queryList[i].first == "h"{
                    if (i == queryList.count - 1){
                        finalStr.append(queryList[i])
                    }else{
                        finalStr.append(queryList[i] + ",")
                    }
                }else if urlStr != nil{
                    if queryList[i].range(of: urlStr!) != nil{
                        if (i == queryList.count - 1){
                            finalStr.append(queryList[i])
                        }else{
                            finalStr.append(queryList[i] + ",")
                        }
                    }else{
                        if (i == queryList.count - 1){
                            finalStr.append(queryList[i])
                        }else{
                            finalStr.append(queryList[i] + "&")
                        }
                    }
                }else{
                    if (i == queryList.count - 1){
                        finalStr.append(queryList[i])
                    }else{
                        finalStr.append(queryList[i] + "&")
                    }
                    
                }
            }
        }else{
            for i in 0..<(queryList.count){
                if (i == queryList.count - 1){
                    finalStr.append(queryList[i])
                }else{
                    finalStr.append(queryList[i] + "&")
                }
            }
        }
        return finalStr
    }
    
}

