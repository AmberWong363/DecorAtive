//
//  UserInfo.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/19/23.
//

import Foundation
import FirebaseAuth

class UserInfo: ObservableObject {
    @Published var userEmail: String
    @Published var password: String
    @Published var image: UIImage = UIImage(named: "default")!
    @Published var loggedIn: Bool = false
    @Published var metric: Bool = false
    
    
    
    init(userEmail: String = "", password: String = "", metric: Bool = false) {
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


