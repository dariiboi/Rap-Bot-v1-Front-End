//
//  Settings.swift
//  Rap Bot
//
//  Created by Darius Shaoul on 5/8/18.
//  Copyright © 2018 Darius Shaoul. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var lineLength: UISlider!
    
    @IBOutlet weak var randomnessValue: UISlider!
    @IBOutlet weak var numberLines: UISlider!
    @IBOutlet weak var rhymeScheme: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
