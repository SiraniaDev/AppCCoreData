//
//  MenuTableViewController.swift
//  AppCCoreData
//
//  Created by Nadia Mettioui on 18/07/2020.
//  Copyright © 2020 Sirania'Dev. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    let menus : [MenuModel] = [MenuModel.form1,.form2,.form3,.form4]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menus.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let menu = menus[indexPath.row]
       cell.textLabel?.text = menu.title
        cell.imageView?.image = UIImage(named: menu.icon)

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController: UIViewController = UIViewController()
         print("okkkkkk")
         switch (indexPath.row) {
             case 0:
               viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "viewController1") as! ViewController1
                
//                 viewController = UIViewController(nibName: "viewController1", bundle: nil)
//                 viewController = self.storyboard?.instantiateViewController(identifier: "viewController1" ) as! ViewController1
             case 1:
                viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "viewController2") as ViewController2
             case 2:
                 viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "viewController3") as ViewController3
             case 3:
                viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "viewController4") as ViewController4
        
        
         default:
              print("default")
         }
         print (indexPath.row)
        // var vc = newVC(nibName: viewController, bundle: nil)
         self.navigationController?.pushViewController(viewController, animated: true)
         //self.navigationController?.show(viewController, sender: nil)
    }
   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
