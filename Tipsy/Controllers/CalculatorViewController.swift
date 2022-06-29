

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPcsBtn: UIButton!
    @IBOutlet weak var splitBillLabel: UILabel!
    @IBOutlet weak var billTextLabel: UITextField!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
   
  
        
    @IBAction func tipChangePressed(_ sender: UIButton) {
        billTextLabel.endEditing(true)
        
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        twentyPcsBtn.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
           
        
    }
    
    @IBAction func stepperValueChangedBtn(_ sender: UIStepper) {
        splitBillLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
        }
        
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextLabel.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
    }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }

}

