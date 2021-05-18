//
//  Double+Extension.swift
//  CalculatorUI
//
//  Created by James Chun on 5/18/21.
//

import Foundation

extension Double {
    
    func limitDecimal() -> Double {
        let divisor = pow(10.0, Double(5))
        return (self * divisor).rounded() / divisor
    }
    
}//End of extension
