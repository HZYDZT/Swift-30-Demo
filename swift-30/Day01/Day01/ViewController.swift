//
//  ViewController.swift
//  Day1


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipCalculateLabel: UILabel!
    @IBOutlet weak var totalResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tapGesTure =  UITapGestureRecognizer.init(target: self, action:#selector(hideKeyBorad))
        self.view.isUserInteractionEnabled = true;
        self.view.addGestureRecognizer(tapGesTure);
    }
    
    @objc private func hideKeyBorad() {
        self.view.endEditing(true)
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        self .change(sliderValue: sender.value)
    }
    
    func change(sliderValue: Float) {
        var cost:String = self.costTextField.text!
        if cost.count == 0 {
            cost = "0"
        }
        let costFload =  Float(cost)!
        let value:Float = Float(Int(sliderValue * 100))/100;
        let tip:Float = costFload * value
        self.tipLabel.text = "Tip(%" + String(Int(value * 100)) + ")"
        self.tipCalculateLabel.text = String(format: "%.2f", tip)
        self.totalResultLabel.text = String(format:"%.2f", costFload + tip);
    }
    
}

