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
    @Published var image: UIImage = UIImage(named: "Icon-1")!
    @Published var loggedIn: Bool = false
    @Published var metric: Bool = false
    
    
    // method initializes the userEmail, password, and metric properties with the provided values
    init(userEmail: String = "", password: String = "", metric: Bool = false) {
        self.userEmail = userEmail
        self.password = password
        self.metric = metric
        // adds a listener for changes to the user's authentication state
        Auth.auth().addStateDidChangeListener { _, user in
            guard let user = user else {return}
           // if the user is authenticated, the loggedIn property is set to true and the userEmail property is set to the user's email address
            self.loggedIn.toggle()
            self.userEmail = user.email ?? ""
            
        }
    }
}


