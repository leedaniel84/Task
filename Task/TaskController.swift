//
//  TaskController.swift
//  Task
//
//  Created by James Pacheco on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class TaskController {
    
    static let sharedTaskController = TaskController()
    var taskArray: [Task]
    
    init() {
        self.taskArray = []
    }
    
    func addTask(task: Task) {
        taskArray.append(task)
    }
    
    func removeTask(indexPath: NSIndexPath) {
        taskArray.removeAtIndex(indexPath.row)
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(taskArray, toFile: Task.ArchiveURL.path!)
    }
    
    func load() -> [Task] {
        if let unarchivedTasks = NSKeyedUnarchiver.unarchiveObjectWithFile(Task.ArchiveURL.path!) as? [Task] {
            return unarchivedTasks
        }else {
            return []
        }
    }
}