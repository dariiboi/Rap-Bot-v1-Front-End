//
//  Settings.swift
//  Rap Bot
//
//  Created by Darius Shaoul on 5/8/18.
//  Copyright © 2018 Darius Shaoul. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var randomnessValue: UITextField!
    @IBOutlet weak var lineNumberValue: UITextField!
    @IBOutlet weak var rhymeSchemeValue: UITextField!
    @IBOutlet weak var lineLengthValue: UITextField!

    @IBAction func randomnessSlider(_ sender: UISlider) {
        let currentValue = Float(round(10*sender.value)/10)
        randomnessValue.text = "\(currentValue)"
    }
    @IBAction func lineNumberSlider(_ sender: UISlider) {
        lineNumberValue.text = String(Int(sender.value))
    }

    @IBAction func segmentedControlchange(_ sender: AnyObject) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            rhymeSchemeValue.text = "A";
        case 1:
            rhymeSchemeValue.text = "AB";
        default:
            break
        }
    }
    @IBAction func lineLengthSlider(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        lineLengthValue.text = "\(currentValue)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func exitSettings(_ sender: UIBarButtonItem) {
        if let mainView = self.presentingViewController as? ViewController {
            mainView.lineLength = Int(self.lineLengthValue.text!)!
            mainView.lineNumber = Int(self.lineNumberValue.text!)!
            mainView.rhymeScheme = self.rhymeSchemeValue.text!
            mainView.wackness = Float(self.randomnessValue.text!)!
        }
        self.dismiss(animated: true) {}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
