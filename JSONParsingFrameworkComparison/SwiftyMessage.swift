//
//  SwiftyMessage.swift
//  JSONParsingFrameworkComparison
//
//  Created by Nicholas Zolnoor on 3/8/16.
//  Copyright © 2016 com.weather.TWC. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol SwiftyJSONDecodable {
    init(json: JSON)
}

struct SwiftyMessage {
    let content: String
    let isRead: Bool
    let number: Int
}

extension SwiftyMessage: SwiftyJSONDecodable {
    internal init(json: JSON) {
        content = json["content"].stringValue
        isRead = json["read"].boolValue
        number = json["number"].intValue
    }
}
