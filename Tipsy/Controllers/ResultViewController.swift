

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingLabel.text = "Split between \(split) people, with \(tip)% tip."

    }
    @IBAction func recalcuatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
