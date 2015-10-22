//
//  Tag.swift
//  Task
//
//  Created by James Pacheco on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

struct Tag: Equatable {
    
    let tag: String
    
}

func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.tag == rhs.tag
}