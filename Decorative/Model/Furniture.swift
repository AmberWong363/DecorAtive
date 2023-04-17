//
//  Furniture.swift
//  Decorative
//
//  Created by Amber Wong (student LM) on 3/29/23.
//

import Foundation

class Furniture : ObservableObject, Identifiable {
    @Published var name : String
    @Published var position : (Int, Int)
    @Published var tileWidth : Int
    @Published var tileHeight : Int
    @Published var facing : direction
    @Published var image : String
    @Published var imageIcon : String
    @Published var inRoom : Bool
    @Published var quantity : Int
    @Published var angle : Int
    @Published var ogImageIcon : String
    
    let id = UUID()
    
    init(name : String = "Bed", position : (Int, Int) = (0, 0), tileWidth : Int = 1, tileHeight : Int = 1, facing : direction = .up, image : String = "bed", imageIcon : String = "icon", inRoom : Bool = false, quantity : Int = 1, angle : Int = 0) {
        self.name = name
        self.position = position
        self.tileWidth = tileWidth
        self.tileHeight = tileHeight
        self.facing = facing
        self.image = image
        self.imageIcon = imageIcon
        self.inRoom = inRoom
        self.quantity = quantity
        self.angle = angle
        self.ogImageIcon = imageIcon
    }
    
    static func ==(rhs : Furniture, lhs : Furniture) -> Bool {
        return rhs.name == lhs.name && rhs.tileWidth == lhs.tileWidth && rhs.tileHeight == lhs.tileHeight && rhs.image == lhs.image && rhs.imageIcon == lhs.imageIcon
    }
}
