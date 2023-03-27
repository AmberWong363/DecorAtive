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
    
    var dictionary: [String: Any] {
        ["Username": username]
    }

    init(username: String = "", userEmail: String = "", password: String = "") {
self.username = username
self.userEmail = userEmail
self.password = password
    
    Auth.auth().addStateDidChangeListener { _, user in
        guard let user = user else {return}
        
        self.loggedIn.toggle()
        self.userEmail = user.email ?? ""
        
    }
}
}
