import Foundation

struct CurrencyLogic {
    let rates = ["EUR": 0.95, "GBP": 0.79, "JPY": 150.0, "CAD": 1.35]
    var currentUSD: Int = 0
    
    mutating func validateInput(_ input: String?) -> Bool {
        if let text = input, let value = Int(text), value >= 0 {
            self.currentUSD = value
            return true
        }
        return false
    }
    
    func calculateConversion(for currency: String) -> Double {
        guard let rate = rates[currency] else { return 0.0 }
        return Double(currentUSD) * rate
    }
}

