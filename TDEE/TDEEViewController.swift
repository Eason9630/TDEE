//
//  TEDDViewController.swift
//  TEDD
//
//  Created by 林祔利 on 2023/3/24.
//

import UIKit

class TDEEViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    
    @IBOutlet weak var showLabel: UILabel!


    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var Segment: UISegmentedControl!
    @IBOutlet weak var frequencyPick: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
    }
    
    
    let option = ["久坐","輕度運動","中度運動","高度運動","超高度運動"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return option.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return option[row]
    }


    @IBAction func heightAction(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func weightAction(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func ageAction(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: Any) {
    let select = option[frequencyPick.selectedRow(inComponent: 0)]
        let selectedGenderIndex = Segment.selectedSegmentIndex
        let selectedGender = Segment.titleForSegment(at: selectedGenderIndex)

            var height = Double(heightTextField.text!)
            var weight = Double(weightTextField.text!)
            var age = Double(ageTextField.text!)
        if let height ,
           let weight,let age{
            var BMR = 0.0
            
            switch selectedGenderIndex {
            case 0 :
                BMR = (10 * weight) + (6.25 * height) - (5 * age) + 5;
                break
            case 1 :
                BMR = (10 * weight) + (6.25 * height) - (5 * age) - 161;
                break
            default:
                print("計算錯誤")
            }
             
            
            var TEDD = 0.0
            if select == "久坐" {
                TEDD = BMR * 1.2
            }else if select == "輕度運動" {
                TEDD = BMR * 1.357
            }else if select == "中度運動" {
                TEDD = BMR * 1.55
            }else if select == "高度運動" {
                TEDD = BMR * 1.725
            }else {
                TEDD = BMR * 1.9
            }
            
            showLabel.text = String(format: "%.2f", TEDD)
        }
    
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
