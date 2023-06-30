//
//  Coffee.swift
//  CoffeAppAnimation
//
//  Created by Norman Mukhallish on 30/06/23.
//

import SwiftUI

struct Coffee : Identifiable{
    var id: UUID = .init()
    var imageName : String
    var title : String
    var price : String
}

var coffees: [Coffee] = [
    
    .init(imageName: "Item 1", title: "Cafe Latte", price: "IDR 54.000"),
    .init(imageName: "Item 2", title: "Cold Americano", price: "IDR 30.000"),
    .init(imageName: "Item 3", title: "Cappuccino", price: "IDR 42.000"),
    .init(imageName: "Item 4", title: "Caramel Macchiato", price: "IDR 62.000"),
    .init(imageName: "Item 5", title: "Long Black", price: "IDR 32.000"),
    .init(imageName: "Item 6", title: "Iris Coffee", price: "IDR 47.000"),
    


]
