//
//  NSMessage.swift
//  JSONParsingFrameworkComparison
//
//  Created by Nicholas Zolnoor on 3/8/16.
//  Copyright © 2016 com.weather.TWC. All rights reserved.
//

import Foundation

public protocol NSJSONDecodable {
    init(dict: Dictionary<String, AnyObject>)
}

struct NSMessage {
    let content: String
    let isRead: Bool
    let number: Int
}

extension NSMessage: NSJSONDecodable {
    internal init(dict: Dictionary<String, AnyObject>) {
        if let dictContent = dict["content"] as? String, let dictRead = dict["read"], let dictNumber = dict["number"] {
            content = dictContent
            isRead = dictRead.boolValue
            if let theInt = dictNumber.integerValue {
                number = theInt
            } else {
                number = 0
            }
        } else {
            content = "error"
            isRead = false
            number = 0
        }
    }
}
