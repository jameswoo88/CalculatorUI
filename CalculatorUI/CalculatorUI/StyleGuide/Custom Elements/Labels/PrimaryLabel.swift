//
//  CalculatorLabel.swift
//  CalculatorUI
//
//  Created by James Chun on 5/17/21.
//

import UIKit

class PrimaryLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
    }
    
    func setupLabel() {
        self.textColor = Colors.customBlack
        updateFontTo()
    }
    
    func updateFontTo() {
        let size = self.font.pointSize
        self.font = UIFont(name: FontNames.digital, size: size)
    }
    
}//End of class

