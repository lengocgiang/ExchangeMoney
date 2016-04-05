//
//  ViewController.swift
//  DoiTien
//
//  Created by Le Ngoc Giang on 4/5/16.
//  Copyright © 2016 giang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var inputTxtField: UITextField!
  
  @IBOutlet weak var outputLabel: UILabel!
  
  var currentcy: Float = 0.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    inputTxtField.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  @IBAction func vndExchange(sender: AnyObject) {
    // 1 JPY = 201.97 VND
    let inputVND = Float(currentcy)
    
    inputTxtField.text = inputVND.asLocaleCurrencyJPY

    let outputJPY = inputVND * 201.97
    
    self.outputLabel.text = String(format: "%@", outputJPY.asLocaleCurrencyVND)
    
  }
  
  @IBAction func jpyExchange(sender: AnyObject) {
    // 1 VND = 1 / 201.97 JPY
    let inputJPY = Float(currentcy)
    
    inputTxtField.text = inputJPY.asLocaleCurrencyVND

    let outputVND = inputJPY * (1 / 201.97)
    
    self.outputLabel.text = String(format: "%@", outputVND.asLocaleCurrencyJPY)
    
  }
  
  @IBAction func tapGesture(sender: AnyObject) {
    view.endEditing(true)
  }
  
  // delegate
  func textFieldDidEndEditing(textField: UITextField) {
    currentcy = Float(textField.text!)!
  }
  
  func textFieldDidBeginEditing(textField: UITextField) {
    textField.text = ""
    outputLabel.text = ""
  }
}

extension Float {
  var asLocaleCurrencyVND: String {
    return formatterWithCountry("vn_VN")
  }
  
  var asLocaleCurrencyJPY: String {
    return formatterWithCountry("ja_JP")
  }
  
  func formatterWithCountry(country: String) -> String {
    let formatter = NSNumberFormatter()
    formatter.numberStyle = .CurrencyStyle
    formatter.locale = NSLocale(localeIdentifier: country)
    return formatter.stringFromNumber(self)!
  }
}