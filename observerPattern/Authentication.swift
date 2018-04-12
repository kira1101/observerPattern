//
//  Authentication.swift
//  observerPattern
//
//  Created by p14822 on 2018/4/12.
//  Copyright © 2018年 p14822. All rights reserved.
//

import Foundation

class AuthenticationManger : SubjectBase {
    func authtnticate(user:String, pass:String) -> Bool{
        var result = false
        if user == "bob" && pass == "secret"{
            result = true
            print("User \(user) is authenticated")
        }else{
            print("Failed authentication attempt")
        }
        sendNotification(user: user, success: result)
        return result
    }
}
