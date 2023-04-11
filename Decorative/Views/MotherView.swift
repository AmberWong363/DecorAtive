//
//  MotherView.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/29/23.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewState : ViewState
    var body: some View {
        if viewState.state == .map {
            MapExpansionView()
        } else if viewState.state == .furniture {
            FurnitureSelectionView()
        } else if viewState.state == .room {
            RoomExpansionView()
        }
    }
}
