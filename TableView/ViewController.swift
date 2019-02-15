//
//  ViewController.swift
//  TableView
//
//  Created by IMCS2 on 2/12/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var numberLable: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private var data: [String] = []
    var parameters = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")! //1.
        
        let text = data[indexPath.row] //2.
        
        cell.textLabel?.text = text //3.
        
        return cell //4
    }
    
    
    // slider change event
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        let selectedNumber = Int(sender.value)
        
        numberLable.text = String (selectedNumber)
        
        parameters = selectedNumber
        
        data.removeAll()
        
        loadData()
    
        
        self.tableView.reloadData()
        
        
        print(parameters)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         tableView.dataSource = self
       
        loadData()
        
    }
    
    // updating the new data

    func loadData() {
        for i in 1...50 {
            data.append("\(i) * \(parameters) = \(i*parameters)")
        }
    }
    
    
}

