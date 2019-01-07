//
//  ViewController.swift
//  PassKeep
//
//  Created by Jrnels02 on 1/6/19.
//  Copyright © 2019 Jrnels02. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["1","2","3"]

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }//end viewDidLoadFunc

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }//end numRowsInSection func
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell")
        cell?.textLabel?.text = itemArray[indexPath.row]
        return cell!
    }//end cellForRowAt func
    
    //MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }//end didSelectRowFunc
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user presses add item button on alert
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
            print("sucess")
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "add New item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }//end addButtonPressed func
    
    

}//end class


