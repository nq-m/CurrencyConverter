import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    
    var currencyLogic: CurrencyLogic?
    var showEUR = false
    var showGBP = false
    var showJPY = false
    var showCAD = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let logic = currencyLogic else { return }
        
        eurLabel.text = showEUR ? "EUR: \(String(format: "%.2f", logic.calculateConversion(for: "EUR")))" : ""
        gbpLabel.text = showGBP ? "GBP: \(String(format: "%.2f", logic.calculateConversion(for: "GBP")))" : ""
        jpyLabel.text = showJPY ? "JPY: \(String(format: "%.2f", logic.calculateConversion(for: "JPY")))" : ""
        cadLabel.text = showCAD ? "CAD: \(String(format: "%.2f", logic.calculateConversion(for: "CAD")))" : ""
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
