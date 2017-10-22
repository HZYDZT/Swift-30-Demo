//
//  ViewController.swift
//  Day03


import UIKit

class ViewController: UIViewController {

    var Timers:Timer?
    
    @IBOutlet weak var timeLabel: UILabel!

    @IBAction func resetBtn(_ sender: Any) {
        
        self.timeLabel.text = "0.0"
        
        self.Timers?.invalidate()
        
        self.Timers = nil
 
    }
    
    @IBAction func pauseBtn(_ sender: Any) {
       
        self.Timers?.invalidate()
        
        self.Timers = nil
    }

    @IBAction func playAction(_ sender: Any) {
        if self.Timers == nil
        {
            self.Timers = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { (timer:Timer) in
                let texts = self.timeLabel.text;
                let textFloatValue = Float(texts!)
                self.timeLabel.text = String(format:"%.1f",  textFloatValue! + 0.1)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

