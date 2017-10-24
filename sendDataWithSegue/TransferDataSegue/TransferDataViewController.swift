//
//  TransferDataViewController.swift
//  sendDataWithSegue
//
//  Created by Luyen on 10/13/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var arrayNumber = [Int](1...10)
    let getDelegate = SplitDelegate()
    let getDataSource = SplitDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = getDelegate
        tableView.dataSource = getDataSource
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc1 = segue.destination as? SecondVC {
            vc1.dataReceive = arrayNumber[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    @IBAction func unwindToFirst(sender: UIStoryboardSegue) {
        if let sourceData = sender.source as? SecondVC,
            let  data = sourceData.dataReceive
        {
        if tableView.indexPathForSelectedRow != nil {
              arrayNumber[tableView.indexPathForSelectedRow!.row] = data
         tableView.reloadData()
        }
        }
    }
    
}
class SplitDataSource: NSObject , UITableViewDataSource {
    var arrayNumber = [Int](1...10)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumber.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
        cell.textLabel?.text = "\(arrayNumber[indexPath.row])"
        return cell
    }
}

class SplitDelegate: NSObject, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
class SecondVC: UIViewController {
    @IBOutlet weak var secondTextData: UITextField!
    
    
    var dataReceive: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataReceive != 0 {
            secondTextData.text = "\(dataReceive!)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        dataReceive = Int(secondTextData.text!)
    }
}

