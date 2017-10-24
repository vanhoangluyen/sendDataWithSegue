//
//  ViewController.swift
//  sendDataWithSegue
//
//  Created by Luyen on 10/13/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldVc1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "push") {
            var sendText = textFieldVc1.text
            (segue.destination as! ViewControllerSecond).data = sendText
        }
    }
    @IBAction func unwind(sender: UIStoryboardSegue) {
        let receiveData = sender.source as? ViewControllerSecond
        textFieldVc1.text = receiveData?.textFieldVc2.text
    }
}
class ViewControllerSecond: UIViewController {
    @IBOutlet weak var textFieldVc2: UITextField!
    var data: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if data != nil {
            textFieldVc2.text = data
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

