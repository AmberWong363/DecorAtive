//
//  UserInfo.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/19/23.
//

import Foundation
import FirebaseAuth

class UserInfo: ObservableObject {
@Published var username: String
@Published var userEmail: String
@Published var password: String
@Published var image: UIImage = UIImage(named: "default")!
@Published var loggedIn: Bool = false
@Published var metric: Bool = false
    
    var dictionary: [String: Any] {
        ["Username": username]
    }

    init(username: String = "", userEmail: String = "", password: String = "", metric: Bool = false) {
self.username = randomString(length: 8)
self.userEmail = userEmail
self.password = password
self.metric = metric
    
    Auth.auth().addStateDidChangeListener { _, user in
        guard let user = user else {return}
        
        self.loggedIn.toggle()
        self.userEmail = user.email ?? ""
        
    }
}
}


func randomString(length: Int) -> String {

    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)

    var randomString = ""

    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
    }

    return randomString
}
