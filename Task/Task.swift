//
//  Task.swift
//  Task
//
//  Created by James Pacheco on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation


class Task: NSObject, NSCoding {
    
    static let ktitleKey = "titleKey"
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("task")
    
    var title: String
    var dueDate: NSDate?
    var notes: String?
    var tag = [Tag]()
    
    init(title: String, dueDate: NSDate?, notes: String?, tag: [Tag]) {
        self.title = title
        self.dueDate = dueDate
        self.notes = notes
        self.tag = tag
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self, forKey: Task.ktitleKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let task = aDecoder.decodeObjectForKey(Task.ktitleKey) as! Task
        self.init(title: task.title, dueDate: task.dueDate, notes: task.notes, tag: task.tag)
        
    }

}

func ==(lhs: Task, rhs: Task) -> Bool {
    return lhs.title == rhs.title
}