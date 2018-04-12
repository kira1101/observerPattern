//
//  Observer.swift
//  observerPattern
//
//  Created by p14822 on 2018/4/12.
//  Copyright © 2018年 p14822. All rights reserved.
//

import Foundation
import Dispatch

protocol Observer : class {
    func notify(user:String , success:Bool)
}

protocol Subject {
    func addObservers(observers:Observer...)
    func removeObserver(observer:Observer)
}

class SubjectBase: Subject {
    private var observers = [Observer]()
    private var collectionQueue = DispatchQueue(label: "colQ", attributes: .concurrent)
    
    func addObservers(observers: Observer...) {
        collectionQueue.sync {
            for newOb in observers{
                self.observers.append(newOb)
            }
        }
    }
    
    func removeObserver(observer: Observer) {
        collectionQueue.sync {
            self.observers = self.observers.filter({$0 !== observer})
        }
    }
    
    func sendNotification(user:String,success:Bool){
        collectionQueue.sync {
            for ob in self.observers{
                ob.notify(user: user, success: success)
            }
        }
    }
}
