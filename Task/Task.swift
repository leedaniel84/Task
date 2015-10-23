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
    static let kDueDate = "DueDate"
    static let kNotes = "Notes"
    static let kIsComplete = "IsComplete"
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("task")
    
    var title: String
    var dueDate: NSDate?
    var notes: String?
    var isComplete: Bool
    
    init(title: String, dueDate: NSDate? = nil, notes: String? = nil) {
        self.title = title
        self.dueDate = dueDate
        self.notes = notes
        self.isComplete = false
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: Task.ktitleKey)
        aCoder.encodeObject(dueDate, forKey: Task.kDueDate)
        aCoder.encodeObject(notes, forKey: Task.kNotes)
        aCoder.encodeBool(isComplete, forKey: Task.kIsComplete)
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObjectForKey(Task.ktitleKey) as? String else {
            self.title = ""
            self.isComplete = false
            super.init()
            return nil
        }
        self.title = title
        self.dueDate = aDecoder.decodeObjectForKey(Task.kDueDate) as? NSDate
        self.notes = aDecoder.decodeObjectForKey(Task.kNotes) as? String
        self.isComplete = aDecoder.decodeBoolForKey(Task.kIsComplete)
        
        super.init()
    }

}

func ==(lhs: Task, rhs: Task) -> Bool {
    return (lhs.title == rhs.title) && (lhs.notes == rhs.notes) && (rhs.isComplete == rhs.isComplete)
}