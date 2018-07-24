//
//  ViewController.swift
//  RGB Hex Code Color Convertor
//
//  Created by Sohardh Chobera on 18/06/18.
//  Copyright © 2018 Sohardh Chobera. All rights reserved.
//

//  select which conversion we want to perform : DONE
//  enter in four text value, one for each of the colors and one for alpha value
//  when button is pressed, we want to perform appropriate conversion, display result and appropriate color

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var alphaTextField: UITextField!
    @IBOutlet weak var conversionButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    enum Conversion {
        case hexToRGB
        case RGBToHex
    }
    var conversion : Conversion = .hexToRGB
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            conversion = .hexToRGB
            conversionButton.setTitle("Convert Hex to RGB", for: .normal)
        case 1:
            conversion = .RGBToHex
            conversionButton.setTitle("Convert RGB to Hex", for: .normal)
        default:
            conversion = .hexToRGB
            conversionButton.setTitle("Convert Hex to RGB", for: .normal)
        }
        print(conversion)
        redTextField.text?.removeAll()
        blueTextField.text?.removeAll()
        greenTextField.text?.removeAll()
        alphaTextField.text?.removeAll()
        
    }
    
    @IBAction func convertAction(_ sender: UIButton) {
        switch conversion {
        case .hexToRGB:
            self.view.backgroundColor = convertHexToRGB()
        case .RGBToHex :
            self.view.backgroundColor =  convertRGBToHex()
        }
        
    }
    
    func convertHexToRGB () -> UIColor? {
        guard let redText = UInt8(redTextField.text!, radix: 16) else { return nil}
        guard let blueText = UInt8(blueTextField.text!, radix: 16) else { return nil}
        guard let greenText = UInt8(greenTextField.text!, radix: 16) else { return nil }
        guard let alphaText = Float(alphaTextField.text!) else { return nil }
        if alphaText > 1 || alphaText < 0 {
            return nil
        }
        
        print("Text Entered \(redText),\(blueText),\(greenText),\(alphaText)")
        resultLabel.text = "Red: \(redText)\n Green: \(greenText)\n Blue: \(blueText)\n Alpha: \(alphaText) "
        let backgroundColor = UIColor(displayP3Red: CGFloat(redText ), green: CGFloat(greenText ), blue: CGFloat(blueText ), alpha: CGFloat(alphaText ))
        return backgroundColor
    }
    func convertRGBToHex() -> UIColor? {
        guard let redText = UInt8(redTextField.text!) else { return nil}
        guard let blueText = UInt8(blueTextField.text!) else { return nil}
        guard let greenText = UInt8(greenTextField.text!) else { return nil }
        guard let alphaText = Float(alphaTextField.text!) else { return nil }
        if alphaText > 1 || alphaText < 0 {
            return nil
        }
        
        let redstring = String(format: "%2X", redText)
        let greenString = String(format: "%2X", greenText)
        let blueString = String(format: "%2X", blueText)
        
        print("Text Entered \(redText),\(blueText),\(greenText),\(alphaText)")
        
        resultLabel.text = "Hex code: # \(redstring)\(greenString)\(blueString) \n Alpha: \(alphaText) "
        let backgroundColor = UIColor(displayP3Red: CGFloat(redText ), green: CGFloat(greenText ), blue: CGFloat(blueText ), alpha: CGFloat(alphaText ))
        return backgroundColor
    }
    

}

