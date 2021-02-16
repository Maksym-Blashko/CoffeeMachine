//
//  ViewController.swift
//  CoffeeMachine
//
//  Created by Blashko Maksim on 13.02.2021.
//

import UIKit

class ViewController: UIViewController {

    let coffeeMachine = CoffeeMachine()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoPanel.text = coffeeMachine.textInfoPanel
    }
    
    @IBOutlet weak var progressWater: UIProgressView!
    @IBOutlet weak var progressMilk: UIProgressView!
    @IBOutlet weak var progressCoffee: UIProgressView!
    @IBOutlet weak var progressBin: UIProgressView!
    @IBOutlet weak var infoPanel: UITextField!
    
    func upDateProgress(currentProgress: UIProgressView) {
        if currentProgress == progressWater {
            currentProgress.progress = (Float(coffeeMachine.waterTank) / Float(coffeeMachine.maxValueWater))
        }
        if currentProgress == progressCoffee {
            currentProgress.progress = (Float(coffeeMachine.coffeeTank) / Float(coffeeMachine.maxValueCoffee))
        }
        if currentProgress == progressMilk {
            currentProgress.progress = (Float(coffeeMachine.milkTank) / Float(coffeeMachine.maxValueMilk))
        }
        if currentProgress == progressBin {
            currentProgress.progress = (Float(coffeeMachine.trashTank) / Float(coffeeMachine.maxValueTrash))
        }
        
        infoPanel.text = coffeeMachine.textInfoPanel
    }
    
    @IBAction func makeEspressoButtonAction(_ sender: UIButton) {
        coffeeMachine.makingDrink(drink: .espresso)
        
        upDateProgress(currentProgress: progressWater)
        upDateProgress(currentProgress: progressMilk)
        upDateProgress(currentProgress: progressCoffee)
        upDateProgress(currentProgress: progressBin)
    }
    @IBAction func makeCappuccinoButtonAction(_ sender: UIButton) {
        coffeeMachine.makingDrink(drink: .cappuccino)
        
        upDateProgress(currentProgress: progressWater)
        upDateProgress(currentProgress: progressMilk)
        upDateProgress(currentProgress: progressCoffee)
        upDateProgress(currentProgress: progressBin)
    }
    @IBAction func makeAmericanoButtonAction(_ sender: UIButton) {
        coffeeMachine.makingDrink(drink: .americano)
        
        upDateProgress(currentProgress: progressWater)
        upDateProgress(currentProgress: progressMilk)
        upDateProgress(currentProgress: progressCoffee)
        upDateProgress(currentProgress: progressBin)
    }
    @IBAction func makeTeaButtonAction(_ sender: UIButton) {
        coffeeMachine.makingDrink(drink: .tea)
        
        upDateProgress(currentProgress: progressWater)
        upDateProgress(currentProgress: progressMilk)
        upDateProgress(currentProgress: progressCoffee)
        upDateProgress(currentProgress: progressBin)
    }
    @IBAction func addWaterButtonAction(_ sender: UIButton) {
        coffeeMachine.addIngredient(ingredient: .water)
        
        upDateProgress(currentProgress: progressWater)
        upDateProgress(currentProgress: progressMilk)
        upDateProgress(currentProgress: progressCoffee)
        upDateProgress(currentProgress: progressBin)
    }
    @IBAction func addMilkButtonAction(_ sender: UIButton) {
        coffeeMachine.addIngredient(ingredient: .milk)
        
        upDateProgress(currentProgress: progressWater)
        upDateProgress(currentProgress: progressMilk)
        upDateProgress(currentProgress: progressCoffee)
        upDateProgress(currentProgress: progressBin)
    }
    @IBAction func addCoffeeButtonAction(_ sender: UIButton) {
        coffeeMachine.addIngredient(ingredient: .coffee)
        
        upDateProgress(currentProgress: progressWater)
        upDateProgress(currentProgress: progressMilk)
        upDateProgress(currentProgress: progressCoffee)
        upDateProgress(currentProgress: progressBin)
    }
    @IBAction func emptyBinButtonAction(_ sender: UIButton) {
        coffeeMachine.addIngredient(ingredient: .trash)
        
        upDateProgress(currentProgress: progressWater)
        upDateProgress(currentProgress: progressMilk)
        upDateProgress(currentProgress: progressCoffee)
        upDateProgress(currentProgress: progressBin)
    }
    
}

