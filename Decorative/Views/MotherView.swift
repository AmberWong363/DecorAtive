//
//  MotherView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/29/23.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewState : ViewState
    @EnvironmentObject var userInfo : UserInfo
    var body: some View {
        if viewState.state == .map && userInfo.loggedIn {
            MapExpansionView()
        } else if viewState.state == .furniture && userInfo.loggedIn {
            FurnitureSelectionView()
        } else if viewState.state == .room && userInfo.loggedIn {
            RoomExpansionView()
        } else if viewState.state == .custom && userInfo.loggedIn {
            CustomFurnitureView()
        } else if viewState.state == .authenticate {
            AuthenticationView()
        } else if viewState.state == .login && !userInfo.loggedIn  {
           LoginView()
        } else if viewState.state == .signup && !userInfo.loggedIn  {
            SignupView()
        } else if viewState.state == .forgotPassword && !userInfo.loggedIn  {
            ForgotPassword()
        } else if viewState.state == .settings && userInfo.loggedIn {
            SettingsView()
        } else {
            MenuView()
        }
    }
}
