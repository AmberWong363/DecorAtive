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
    // takes a password parameter and attempts to update the password for the currently authenticated user
    func updatePassword(password: String) {
        // calls reauthenticate on the current user using the stored credential
        // calls updatePassword on the current user to update the password with the new value provided in the password parameter
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
