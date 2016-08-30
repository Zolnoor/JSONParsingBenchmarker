//
//  ViewController.swift
//  JSONParsingFrameworkComparison
//
//  Created by Nicholas Zolnoor on 3/8/16.
//  Copyright © 2016 com.weather.TWC. All rights reserved.
//

import UIKit
import Freddy

class FreddyViewController: UIViewController {
    
    var jsonData: NSData?
    var startTime: NSDate?
    var endTime: NSDate?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSON()
        parseFreddy()
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

    func parseFreddy() {
        setStartTime()
        if let data = jsonData {
            do {
                let json = try JSON(data: data)
                let messages = try json.array("messages").map(Message.init)
                setEndTime()
                print("parsed \(messages.count) JSON objects in \(calculateTime()) seconds using Freddy")
            }
            catch {
                print("error printing \(error)")
            }
        }
    }
}

