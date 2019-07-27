//
//  ViewController.swift
//  Todoey
//
//  Created by 박정현 on 23/07/2019.
//  Copyright © 2019 박정현. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        itemArray.append(Item(title: "Buy books"))
        itemArray.append(Item(title: "Study"))
        itemArray.append(Item(title: "Do nothing"))
        
        if let items = defaults.array(forKey:"TodoListArray") as? [Item] {
            itemArray = items
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        var textField = UITextField()
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if let content = textField.text {
                
                if content != "" {
                    self.itemArray.append(Item(title: content))
                
                    self.defaults.set(self.itemArray, forKey: "TodoListArray")
                
                    self.tableView.reloadData()
                }
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "To do"
            textField = alertTextField
        
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

