//
//  CoffeeMachine.swift
//  CoffeeMachine
//
//  Created by Blashko Maksim on 13.02.2021.
//

import Foundation

enum CoffeeOptions {
    case espresso, cappuccino, americano, tea
    }

enum IngredientsForCoffeeMachine {
    case water, milk, coffee, trash
}

class CoffeeMachine {
   
    // tanks
    var coffeeTank: Int = 0
    var milkTank: Int = 0
    var waterTank: Int = 0
    var trashTank: Int = 0
    // max value
    let maxValueCoffee = 500
    let maxValueMilk = 500
    let maxValueWater = 500
    let maxValueTrash = 500
    // info
    var textInfoPanel: String = "What would you like a drink?"

    func makingDrink(drink: CoffeeOptions) {
        if checkEnoughQtyForDrink(drink: drink) {
            updateQty(drink: drink)
            textInfoPanel = "Enjoy"
        }
    }
    
    private func checkEnoughQtyForDrink(drink: CoffeeOptions) -> Bool {
        
        textInfoPanel = ""
        
        if waterTank < ingredientsForCooking(drink: drink, ingredients: .water) {
            if textInfoPanel.isEmpty {
                textInfoPanel = "Fill water tank"
            } else {
                textInfoPanel = textInfoPanel + "\n" + "Fill water tank"
            }
        }
        if milkTank < ingredientsForCooking(drink: drink, ingredients: .milk) {
            if textInfoPanel.isEmpty {
                textInfoPanel = "Fill milk tank"
            } else {
                textInfoPanel = textInfoPanel + "\n" + "Fill milk tank"
            }
        }
        if coffeeTank < ingredientsForCooking(drink: drink, ingredients: .coffee) {
            if textInfoPanel.isEmpty {
                textInfoPanel = "Fill coffee tank"
            } else {
                textInfoPanel = textInfoPanel + "\n" + "Fill coffee tank"
            }
        }
        if (trashTank + ingredientsForCooking(drink: drink, ingredients: .trash)) > 500 {
            if textInfoPanel.isEmpty {
                textInfoPanel = "Dregdrawer full"
            } else {
                textInfoPanel = textInfoPanel + "\n" + "Dregdrawer full"
            }
        }
        
        if textInfoPanel.isEmpty { return true } else { return false }
    }
   
    private func ingredientsForCooking(drink: CoffeeOptions, ingredients: IngredientsForCoffeeMachine) -> Int {
        
        if drink == CoffeeOptions.espresso && ingredients == IngredientsForCoffeeMachine.water { return 30 }
        if drink == CoffeeOptions.espresso && ingredients == IngredientsForCoffeeMachine.milk { return 0 }
        if drink == CoffeeOptions.espresso && ingredients == IngredientsForCoffeeMachine.coffee { return 100 }
        if drink == CoffeeOptions.espresso && ingredients == IngredientsForCoffeeMachine.trash { return 100 }

        if drink == CoffeeOptions.cappuccino && ingredients == IngredientsForCoffeeMachine.water { return 100 }
        if drink == CoffeeOptions.cappuccino && ingredients == IngredientsForCoffeeMachine.milk { return 100 }
        if drink == CoffeeOptions.cappuccino && ingredients == IngredientsForCoffeeMachine.coffee { return 50 }
        if drink == CoffeeOptions.cappuccino && ingredients == IngredientsForCoffeeMachine.trash { return 50 }

        if drink == CoffeeOptions.americano && ingredients == IngredientsForCoffeeMachine.water { return 200 }
        if drink == CoffeeOptions.americano && ingredients == IngredientsForCoffeeMachine.milk { return 0 }
        if drink == CoffeeOptions.americano && ingredients == IngredientsForCoffeeMachine.coffee { return 100 }
        if drink == CoffeeOptions.americano && ingredients == IngredientsForCoffeeMachine.trash { return 100 }

        if drink == CoffeeOptions.tea && ingredients == IngredientsForCoffeeMachine.water { return 250 }
        if drink == CoffeeOptions.tea && ingredients == IngredientsForCoffeeMachine.milk { return 0 }
        if drink == CoffeeOptions.tea && ingredients == IngredientsForCoffeeMachine.coffee { return 0 }
        if drink == CoffeeOptions.tea && ingredients == IngredientsForCoffeeMachine.trash { return 0 }
        
        return 0
    }

    private func updateQty(drink: CoffeeOptions) {
        waterTank -= ingredientsForCooking(drink: drink, ingredients: .water)
        milkTank -= ingredientsForCooking(drink: drink, ingredients: .milk)
        coffeeTank -= ingredientsForCooking(drink: drink, ingredients: .coffee)
        trashTank += ingredientsForCooking(drink: drink, ingredients: .trash)
    }
    
    func addIngredient(ingredient: IngredientsForCoffeeMachine) {
        switch ingredient {
        case .coffee:
            coffeeTank = maxValueCoffee
            textInfoPanel = "Coffee tank is full"
        case .milk:
            milkTank = maxValueMilk
            textInfoPanel = "Milk tank is full"
        case .water:
            waterTank = maxValueWater
            textInfoPanel = "Water tank is full"
        case .trash:
            trashTank = 0
            textInfoPanel = "Empty bin"
        }
    }
}
