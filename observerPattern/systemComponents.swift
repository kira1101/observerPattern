//
//  systemComponents.swift
//  observerPattern
//
//  Created by p14822 on 2018/4/12.
//  Copyright © 2018年 p14822. All rights reserved.
//

import Foundation

class ActivityLog:Observer {
    func notify(user: String, success: Bool) {
        print("Auth request for \(user). Success: \(success)")
    }
    
    func logActivity(activity:String){
        print("log : \(activity)")
    }
}

class FileCache:Observer {
    func notify(user: String, success: Bool) {
        if success{
            loadFiles(user: user)
        }
    }
    
    func loadFiles(user:String){
        print("load files for: \(user)")
    }
}


class AttackMonitor:Observer {
    func notify(user: String, success: Bool) {
        monitorSuspiciousActivity = !success
    }
    
    var monitorSuspiciousActivity: Bool = false{
        didSet{
            print("Monitoring for attack: \(monitorSuspiciousActivity)")
        }
    }
}

