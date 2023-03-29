//
//  ViewState.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/29/23.
//

import Foundation

class ViewState : ObservableObject {
    @Published var state : viewState
    
    init(_ state : viewState = .login) {
        self.state = state
    }
}
