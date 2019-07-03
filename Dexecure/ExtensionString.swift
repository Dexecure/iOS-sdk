//
//  ExtensionString.swift
//  Dexecure
//
//  Copyright © 2019 net.Dexecure. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation


extension String{
    
    public static var dexeCureEncodeUrlComponentCharSet: CharacterSet = {
        var cs = CharacterSet.alphanumerics
        cs.insert(charactersIn: "-_.!~*'()")
        return cs
    }()
    
    public func dexeCureEncode64() -> String {
        let strData = self.data(using: String.Encoding.utf8)
        
        guard var str64 = strData?.base64EncodedString(options: Data.Base64EncodingOptions()) else {
            return ""
        }
        
        str64 = str64.replacingOccurrences(of: "=", with: "")
        str64 = str64.replacingOccurrences(of: "/", with: "_")
        str64 = str64.replacingOccurrences(of: "+", with: "-")
        
        return str64
    }
    
    public func dexeCureEncodeUrlComponent() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: String.dexeCureEncodeUrlComponentCharSet)!
    }
    
    public func getIndex(element : Element) -> Int?{
        guard let index = index(of: element) else { return nil }
        return distance(from: startIndex, to: index)
    }
    
}
