import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var eurSwitch: UISwitch!
    @IBOutlet weak var gbpSwitch: UISwitch!
    @IBOutlet weak var jpySwitch: UISwitch!
    @IBOutlet weak var cadSwitch: UISwitch!
    
    var currencyLogic = CurrencyLogic()

    override func viewDidLoad() {
            super.viewDidLoad()
        }
    @IBAction func convertPressed(_ sender: UIButton) {
        if currencyLogic.validateInput(usdTextField.text) {
            errorLabel.isHidden = true
            performSegue(withIdentifier: "goToResults", sender: self)
        } else {
            errorLabel.text = "Error: Please enter a valid whole dollar amount."
            errorLabel.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.currencyLogic = self.currencyLogic
            destinationVC.showEUR = eurSwitch.isOn
            destinationVC.showGBP = gbpSwitch.isOn
            destinationVC.showJPY = jpySwitch.isOn
            destinationVC.showCAD = cadSwitch.isOn
        }
    }
}

