//
//  SwiftyViewController.swift
//  JSONParsingFrameworkComparison
//
//  Created by Nicholas Zolnoor on 3/8/16.
//  Copyright © 2016 com.weather.TWC. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class SwiftyViewController: UIViewController {
    
    var jsonData: NSData?
    var startTime: NSDate?
    var endTime: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSON()
        parseJSON()
    }
    
    func setStartTime() {
        startTime = NSDate()
    }
    
    func setEndTime() {
        endTime = NSDate()
    }
    
    func calculateTime() -> Double {
        if let start = startTime, end = endTime {
            return end.timeIntervalSinceDate(start);
        }
        return 0
    }

    
    func loadJSON() {
        let path = NSBundle.mainBundle().pathForResource("parseme", ofType: "json")
        if let path = path {
            jsonData = NSData(contentsOfFile: path)
        }
    }
    
    func parseJSON() {
        setStartTime()
        if let data = jsonData {
            let json = JSON(data: data)
            let messages = json["messages"].arrayValue.map {
                SwiftyMessage.init(json: $0)
            }
            setEndTime()
            print("parsed \(messages.count) JSON objects in \(calculateTime()) seconds using SwiftyJSON")
        }
    }
    
}
