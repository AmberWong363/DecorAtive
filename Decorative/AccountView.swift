//
//  AccountView.swift
//  Decorative
//
//  Created by Maya Taylor (student LM) on 4/10/23.
//

import SwiftUI
import UIKit

struct AccountView: View {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var notificationsSwitch: UISwitch!
    @IBOutlet weak var saveButton: UIButton!
    var body: some View {
       
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Retrieve user data from data store
            let userDefaults = UserDefaults.standard
            let name = userDefaults.string(forKey: "name")
            let email = userDefaults.string(forKey: "email")
            let notificationsEnabled = userDefaults.bool(forKey: "notificationsEnabled")
            
            // Display user data in UI elements
            nameLabel.text = name
            emailLabel.text = email
            notificationsSwitch.isOn = notificationsEnabled
        }

        @IBAction func saveButtonPressed(_ sender: UIButton) {
            // Save user data to data store
            let userDefaults = UserDefaults.standard
            userDefaults.set(passwordTextField.text, forKey: "password")
            userDefaults.set(notificationsSwitch.isOn, forKey: "notificationsEnabled")
            
            // Show alert to confirm settings saved
            let alert = UIAlertController(title: "Settings Saved", message: "Your account settings have been saved.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }

    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

class AccountSettingsViewController: UIViewController {

   
