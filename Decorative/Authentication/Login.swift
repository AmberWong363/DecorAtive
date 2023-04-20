//
//  Login.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 3/27/23.
//

import Foundation
import FirebaseAuth


class Login: ObservableObject {
    let userPassword = Auth.auth().currentUser
    var credential: AuthCredential?
    
    func updatePassword(password: String) {
        if let credential = credential {
            userPassword?.reauthenticate(with: credential ) { error,_  in
                if error != nil {
                    
                } else {
                    Auth.auth().currentUser?.updatePassword(to: password) { (error) in
                        
                    }
                }
            }
        }
    }
}
