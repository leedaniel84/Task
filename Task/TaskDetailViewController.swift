//
//  TaskDetailViewController.swift
//  Task
//
//  Created by James Pacheco on 10/23/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dateButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet var datePickerHeightConstraint: NSLayoutConstraint!

    var task: Task?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePickerHeightConstraint.active = false
        dateButtonHeightConstraint.active = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dueDateButtonPressed(sender: AnyObject) {
        dateButton.hidden = true
        datePicker.hidden = false
        dateButtonHeightConstraint.active = false
        datePickerHeightConstraint.active = true
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        guard let title = taskTitleTextField.text else {
            noTitleAlert()
            return
        }
        let newTask = Task(title: title, dueDate: nil, notes: nil)
        TaskController.sharedTaskController.addTask(newTask)
        self.navigationController?.popViewControllerAnimated(true)
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.task = newTask
    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func noTitleAlert() {
        
    }
    
    func updateWithTask(index: Int) {
        task = TaskController.sharedTaskController.taskArray[index]
        if let task = task {
            taskTitleTextField.text = task.title
            
            if let notes = task.notes {
                
                notesTextView.text = notes
            }
            if let dueDate = task.dueDate {
                let formatter = NSDateFormatter()
                formatter.dateStyle = NSDateFormatterStyle.LongStyle
                formatter.timeStyle = .ShortStyle
                dateButton.setTitle(formatter.stringFromDate(dueDate), forState: .Normal)
            }
        }
        
        
    }

}







