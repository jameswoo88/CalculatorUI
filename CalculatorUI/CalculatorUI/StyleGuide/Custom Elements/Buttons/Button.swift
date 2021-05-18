//
//  Button.swift
//  CalculatorUI
//
//  Created by James Chun on 5/17/21.
//

import UIKit

class Button: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
        updateFontTo()
    }
    
    func setupButton() {
        self.setBackgroundColor(Colors.customYellow)
        self.makeIntoCircle()
        
        self.setTitleColor(Colors.customBlack, for: .normal)
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    func updateFontTo() {
        guard let size = self.titleLabel?.font.pointSize else { return }
        self.titleLabel?.font = UIFont(name: FontNames.digitalMono, size: size)
    }
    
}//End of class
