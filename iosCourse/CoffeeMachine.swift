//
//  CoffeeMachine.swift
//  iosCourse
//
//  Created by Artem Melkevych on 30.10.2020.
//  Copyright © 2020 Artem Melkevych. All rights reserved.
//

import Foundation


class CoffeeMachine {
    struct Recipe {
        var type: String
        var milliliters: Int
        var coffeeBeans: Int
    }
    private var waterBox: Int = 1000
    private var wasteBox: Int = 0
    private var warning: String = ""
   
    
    enum CoffeeRecipe: Int {
        case americano, latte, espresso, cappuccino
        
        var type: String {
            switch self {
                case .americano: return "Americano"
                case .latte: return "Latte"
                case .espresso: return "Espresso"
                case .cappuccino: return "Cappuccino"
            }
        }
        
        var milliliters: Int {
            switch self {
                case .americano: return 300
                case .latte: return 400
                case .espresso: return 150
                case .cappuccino: return 500
            }
        }
        
        var coffeeBeans: Int {
            switch self {
                case .americano: return 4
                case .latte: return 3
                case .espresso: return 6
                case .cappuccino: return 5
            }
        }
    }
    
    public func cleanCoffeeMachine() {
        print(wasteBox)
        wasteBox = 0
    }
    
    public func fillCoffeeMachine() {
        waterBox = 1000
    }
    
    public func selectCoffeeType(coffeeType: CoffeeRecipe) -> Recipe? {
        guard let recipe = CoffeeRecipe(rawValue: coffeeType.rawValue) else { return nil }
        guard (waterBox - recipe.milliliters) < waterBox, waterBox > 0 else {
            warning = "Water box is empty!!!"
            return nil
        }
        guard (wasteBox + recipe.coffeeBeans) < 20 else {
            warning = "Waste box is full!!!"
            return nil
        }
        
        let coffeeRecipe = Recipe(type: recipe.type, milliliters: recipe.milliliters, coffeeBeans: recipe.coffeeBeans)
        waterBox -= recipe.milliliters
        wasteBox += recipe.coffeeBeans
        
        return coffeeRecipe
    }
    
    public func getWarnings () -> String {
        return warning
    }
}
