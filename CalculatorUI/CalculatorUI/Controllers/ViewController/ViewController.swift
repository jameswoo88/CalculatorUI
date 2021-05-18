//
//  ViewController.swift
//  CalculatorUI
//
//  Created by James Chun on 5/17/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var detailLabel: SecondaryLabel!
    @IBOutlet weak var numberLabel: PrimaryLabel!
    
    //MARK: - Properties
    var detailString: String = ""
    var numberString: String = ""
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.customYellow
        displayView.backgroundColor = Colors.customWhite
        displayView.addCornerRadius()
        
        resetViews()
    }
    
    //MARK: - Functions
    func resetViews() {
        detailLabel.text = "0.0"
        numberLabel.text = "0.0"
    
        detailString = ""
        numberString = ""
    }

    //MARK: - Actions
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        guard let mathOperator = sender.titleLabel?.text else { return }
        
        if detailString == "RESULT" {
            detailString = ""
            numberString = ""
        }

        switch sender.tag {
        case 0...9:
            // Numbers

            detailString.append(String(sender.tag))
            numberString.append(String(sender.tag))
            numberLabel.text = numberString
        case 10:
            // Add
            if detailLabel.text != "0.0" && !detailString.isEmpty {
                detailString.append(mathOperator)
                numberString = ""
                numberLabel.text = "0.0"
            }
        case 11:
            // Subtract
            if detailLabel.text != "0.0" && !detailString.isEmpty {
                detailString.append(mathOperator)
                numberString = ""
                numberLabel.text = "0.0"
            }
        case 12:
            // Multiply
            if detailLabel.text != "0.0" && !detailString.isEmpty {
                detailString.append("*") //need to use asterisk for muliplication
                numberString = ""
                numberLabel.text = "0.0"
            }
        case 13:
            // Divide
            if detailLabel.text != "0.0" && !detailString.isEmpty {
                detailString.append("/") //need to use backslash for division
                numberString = ""
                numberLabel.text = "0.0"
            }
        case 14:
            // Decimal
            if detailLabel.text != "0.0" && !detailString.isEmpty {
                detailString.append(mathOperator)
                numberString.append(mathOperator)
            } else {
                detailString = "0."
                numberString = "0."
                numberLabel.text = numberString
            }
        case 15:
            // Perform calculation
            let expression = NSExpression(format: detailString)
            let result = expression.expressionValue(with: nil, context: nil) ?? "ERROR"
            detailString = "RESULT"
            numberLabel.text = "\(result)"
        default:
            fatalError("Unknown button tag")
        }
        detailLabel.text = detailString.isEmpty ? "0.0" : detailString
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        resetViews()
    }
    
}//End of class

