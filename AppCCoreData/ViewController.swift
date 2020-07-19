//
//  ViewController.swift
//  AppCCoreData
//
//  Created by Nadia Mettioui on 18/07/2020.
//  Copyright © 2020 Sirania'Dev. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Ref to managedbobject context
    
    let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Data for the table
    var items: [Person]?
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchPerson()
    }
    func fetchPerson(){
        // Fetch Data from CD to TView and Mettre dan le array pour la TV
        do {
            self.items =  try  context.fetch(Person.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch  {
            
        }
        
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        //Alert Box
        let alert = UIAlertController(title: "Add Person", message: "Name?", preferredStyle: .alert)
        alert.addTextField()
        // Configure the textfield for alert
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            // get the textFileds for the alert
            let textFiled = alert.textFields![0]
            // Create PersonObject
            let newPerson = Person(context: self.context)
            newPerson.name = textFiled.text
            newPerson.age = 20
            newPerson.gender = true
            // Save Data
            do {
                try  self.context.save()
            }
                
            catch {
                
            }
            // Re Fetch Data
            self.fetchPerson()
        }
        // Add Button
        alert.addAction(submitButton)
        
        //show Alert
        self.present(alert,animated: true,completion: nil)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        let person = self.items?[indexPath.row]
        cell.textLabel?.text = person?.name
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete"){
            (action,view,completionHandler) in
            // quel personne
            let personToRemove = self.items![indexPath.row]
            //Remove the personne
            self.context.delete(personToRemove)
            //save  the data
            do {
                try self.context.save()
            }
            catch{}
            
            // ReFetch the Data
            self.fetchPerson()
        }
        
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Selected Person
        let person = items![indexPath.row]
        // create Alert
        let alert = UIAlertController(title: "Edit Person", message: "Edit Name", preferredStyle: .alert)
        alert.addTextField()
        // configure Button handler
        let saveButton = UIAlertAction(title: "Seve", style: .default) { (action) in
            // Get text for the alert
            let textFiled = alert.textFields![0]
            // edit name property object
            person.name = textFiled.text
            //Save the data
            do {
                try self.context.save()
            }
            catch{}
            self.fetchPerson()
        }
          
        // Add Button
               alert.addAction(saveButton)
               
               //show Alert
               self.present(alert,animated: true,completion: nil)
    }
}

