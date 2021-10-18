//
//  ViewController.swift
//  pickerViewTest
//
//  Created by HappyDuck on 2021/10/17.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var textfieldBizCat: UITextField!

    @IBOutlet var pickerBizCat: UIPickerView! = UIPickerView()

    @IBOutlet var pickerToolbar: UIToolbar!
    
    
    var bizCat = ["Cat One", "Cat Two", "Cat Three","Cat One", "Cat Two", "Cat Three","Cat One", "Cat Two", "Cat Three"]


    override func viewDidLoad() {
        super.viewDidLoad()
        pickerBizCat.dataSource = self
        pickerBizCat.delegate = self
        
        textfieldBizCat.delegate = self
        textfieldBizCat.inputView = pickerBizCat
    }
    
    @IBAction func keyboardUpPressed(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func keyboardDownPressed(_ sender: UIBarButtonItem) {
        pickerToolbar.isHidden = true
        pickerBizCat.isHidden = true
    }
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        pickerToolbar.isHidden = true
        pickerBizCat.isHidden = true
    }
    
}

// MARK: - UIPickerViewDelegate

extension ViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        pickerToolbar.isHidden = false
        pickerBizCat.isHidden = false
        return false
    }
}

// MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bizCat.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bizCat[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textfieldBizCat.text = bizCat[row]
    }
}



