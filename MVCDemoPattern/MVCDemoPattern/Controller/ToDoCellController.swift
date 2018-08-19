//
//  ToDoCellController.swift
//  MVCDesignPattern
//
//  Created by Administrator on 19/08/18.
//  Copyright © 2018 MyTeam. All rights reserved.
//

import Foundation

class ToDoCellController{
    var activity:String?
    var time:String?
    
    init(todo:ToDo) {
        self.activity = todo.activity
        self.time = todo.time
    }

    
}
