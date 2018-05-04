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

    @IBOutlet weak var seed: UITextField!
    @IBOutlet weak var rapTextField: UITextView!
    var joinedStrings = ""
    
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
        //Do your call
        url = URL(string: "http://localhost:8080/generate?seedWord=\(self.seed.text ?? "gun")")
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
            let jsonText = try! JSONSerialization.jsonObject(with: data, options: [])
            //convert array to lines seperated by line breaks
            self.joinedStrings = (jsonText as! Array).joined(separator: "\n")
            
        }
        //print the text in the word box
        self.rapTextField.text = self.joinedStrings
        task.resume()
    }
    
}

