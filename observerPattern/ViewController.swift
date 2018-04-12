//
//  ViewController.swift
//  observerPattern
//
//  Created by p14822 on 2018/4/12.
//  Copyright © 2018年 p14822. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let log = ActivityLog()
        let cache = FileCache()
        let monitor = AttackMonitor()
        let authM = AuthenticationManger()
        authM.addObservers(observers: log,cache,monitor)
        _ = authM.authtnticate(user: "bob", pass: "secret")
        print("--------")
        _ = authM.authtnticate(user: "joe", pass: "shhh")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

