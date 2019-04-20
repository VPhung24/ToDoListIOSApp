//
//  ViewController.swift
//  ToDoListIOSApp
//
//  Created by Vivian Phung on 4/20/19.
//  Copyright © 2019 Vivian Phung. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var insertTaskBox: UITextField!
    @IBOutlet weak var insertButtonBox: NSLayoutConstraint!
    
    
    @IBAction func handleNewTask(_ sender: Any) {
        addNewTask()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func addNewTask() {
        if (insertTaskBox.text != "") {
            let context = (UIApplication.shared.delegate as!   AppDelegate).persistentContainer.viewContext
            let newTask = Task(context: context)
            newTask.taskName = insertTaskBox?.text
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            print(newTask.taskName!) // prints task when button is pressed if task is not empty
            resetTextBox() // after new task is added clears the text box
        }
    }
    func resetTextBox() { // clears text box
        insertTaskBox.text = ""
        insertTaskBox.resignFirstResponder()
    }

}

