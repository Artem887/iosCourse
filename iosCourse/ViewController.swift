//
//  ViewController.swift
//  iosCourse
//
//  Created by Artem Melkevych on 30.10.2020.
//  Copyright © 2020 Artem Melkevych. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let coffeeMachine = CoffeeMachine()

    @IBOutlet weak var outputValue: UILabel!
    @IBAction func handleButtonActions(_ sender: UIButton) {
        guard let coffee = coffeeMachine.selectCoffeeType(coffeeType: CoffeeMachine.CoffeeRecipe.init(rawValue: sender.tag)!) else {
            outputValue.text = coffeeMachine.getWarnings()
            return
        }
        
     

        let messageWithReceip = "Coffee is ready!!!\n\tName: \(coffee.type)\n\tMilliliters: \(coffee.milliliters)\n\tCoffee Beans: \(coffee.coffeeBeans)"
        
        outputValue.text = messageWithReceip
    }
    
    @IBAction func handleMainActions(_ sender: UIButton) {
        if (sender.tag == 0) {
            coffeeMachine.cleanCoffeeMachine()
            outputValue.text = "Waste box is empty!!!"
        } else {
            coffeeMachine.fillCoffeeMachine()
            outputValue.text = "Waiter box is full!!!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

