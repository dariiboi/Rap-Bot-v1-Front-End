//
//  ViewController.swift
//  Rap Bot
//
//  Created by Darius Shaoul on 5/3/18.
//  Copyright © 2018 Darius Shaoul. All rights reserved.
//

import UIKit
var url = URL(string: "http://localhost:8080/generate?seedWord=gun")
class ViewController: UIViewController {

    @IBOutlet weak var syllablePicker: UIPickerView!
    @IBOutlet weak var seed: UITextField!
    @IBOutlet weak var rapTextField: UITextView!
    var joinedStrings = ""
    var charCounter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.seed.text = "gun"
        self.rapTextField.text = "Hit generate to produce a rap!!"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generatePressed(_ sender: Any) {
        //send a URL request
        if self.charCounter == 0 {
            url = URL(string: "http://localhost:8080/generate?rhymeScheme=4&seedWord=\(self.seed.text ?? "gun")")
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard error == nil else {
                    print(error!)
                    return
                }
                guard let data = data else {
                    print("Data is empty")
                    return
                }
                //once json data has been received, convert it to a swift array
                let jsonDict = try! JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                if jsonDict!["output"] is NSNull{
                    DispatchQueue.main.async{
                        self.apiPrint(joinedText: "Try another seed word!!")
                    }
                }else{
                    let jsonText = jsonDict!["output"]
                    self.joinedStrings = (jsonText as! Array).joined(separator: "\n\n")
                    DispatchQueue.main.async{
                        self.apiPrint(joinedText: self.joinedStrings)
                    }
                }
                }
            task.resume()
        }
    }
    func apiPrint(joinedText: String){     //print the text in the word box
        self.charCounter = 0
        self.rapTextField.text = ""
        let timer = Timer.scheduledTimer(withTimeInterval: 0.015, repeats: true) { (timer) in
            self.rapTextField.text = self.rapTextField.text + String(joinedText[joinedText.index(joinedText.startIndex, offsetBy: self.charCounter)])
            self.charCounter += 1
            if self.charCounter == joinedText.count {
                timer.invalidate()
                self.charCounter = 0
            }
        }
    }
}

