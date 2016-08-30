//
//  NSJSONViewController.swift
//  JSONParsingFrameworkComparison
//
//  Created by Nicholas Zolnoor on 3/8/16.
//  Copyright © 2016 com.weather.TWC. All rights reserved.
//

import UIKit

class NSJSONViewController: UIViewController {

    var jsonData: NSData?
    var startTime: NSDate?
    var endTime: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSON()
        parseJSON()
    }
    
    func loadJSON() {
        let path = NSBundle.mainBundle().pathForResource("parseme", ofType: "json")
        if let path = path {
            jsonData = NSData(contentsOfFile: path)
        }
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
    
    func parseJSON() {
        setStartTime()
        if let data = jsonData {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                if let dictionary = json["messages"] as? [Dictionary<String, AnyObject>] {
                    let messages = dictionary.map ({NSMessage(dict: $0)})
                    setEndTime()
                    print("parsed \(messages.count) JSON objects in \(calculateTime()) seconds using NSJSONSerialization")
                }
            }
            catch {
                print("error printing \(error)")
            }
        }
    }
}
