//
//  AddToDoViewController.swift
//  PracticeToDoList
//
//  Created by Kiarra  on 5/29/20.
//  Copyright © 2020 Kiarra . All rights reserved.
//

import UIKit
import CoreData


class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()

    @IBOutlet weak var titleTextField: UITextField!
   
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
       
        /*
        let toDo = ToDo()

        if let titleText = titleTextField.text {
          toDo.name = titleText
          toDo.important = importantSwitch.isOn
        }
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    */
        //this line creates a reference to AppDelegate so we can save out ToDos in Core Data
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
          }
          //context is an extension of the reference to the Core Data
          let context = appDelegate.persistentContainer.viewContext

          //this creates a new object in Core Data
          let toDo = ToDoCD(context: context)

          //these lines give the new CD object information based on what the user provided
          toDo.name = titleTextField.text
          toDo.important = importantSwitch.isOn

          //This is like clicking "save"! Our new object is now safe in Core Data!
          appDelegate.saveContext()

          //this send the user back to the Table View Controller
          navigationController?.popViewController(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


