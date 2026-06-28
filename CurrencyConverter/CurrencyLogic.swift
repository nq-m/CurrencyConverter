import Foundation

struct CurrencyLogic {
    let rates = ["EUR": 0.88, "GBP": 0.76, "JPY": 161.8, "CAD": 1.42]
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

