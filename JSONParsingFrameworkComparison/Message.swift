//
//  Message.swift
//  JSONParsingFrameworkComparison
//
//  Created by Nicholas Zolnoor on 3/8/16.
//  Copyright © 2016 com.weather.TWC. All rights reserved.
//

import Foundation
import Freddy


public protocol JSONDecodable {
    init(json: JSON) throws
}

struct Message {
    let content: String
    let isRead: Bool
    let number: Int
}

extension Message: JSONDecodable {
    internal init(json: JSON) throws {
        content = try json.string("content")
        isRead = try json.bool("read")
        number = try json.int("number")
    }
}


