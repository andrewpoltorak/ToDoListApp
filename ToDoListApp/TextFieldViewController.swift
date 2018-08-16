//
//  FirstViewController.swift
//  ToDoListApp
//
//  Created by Preferiti_mac on 16.08.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import CoreData

var list: [String] = []

class TextFieldViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = UIApplication.shared().delegate as! AppDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let item = list[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

