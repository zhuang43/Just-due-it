//
//  TaskCellModel.swift
//  MoveYourAss
//
//  Created by huang on 4/28/17.
//  Copyright © 2017 huang. All rights reserved.
//

import Foundation

class TaskCellModel{
    private var _taskTitle: String!
    private var _TaskComment: String!
    private var _TaskDate: String!
    private var _TaskTime: String!
    private var _TimeLeft: String!
    

    
    var taskTitle: String{
        return _taskTitle
    }
    var TaskComment: String{
        return _TaskComment
    }
    var TaskDate: String{
        return _TaskDate
    }
    var TaskTime: String{
        return _TaskTime
    }
    var TimeLeft: String{
        return _TimeLeft
    }
    
    
    init(taskTitle: String,TaskComment: String,TaskDate: String,TaskTime: String, TimeLeft: String){
        _taskTitle = taskTitle
        _TaskComment = TaskComment
        _TaskDate = TaskDate
        _TaskTime = TaskTime
        _TimeLeft = TimeLeft
        
    }
    
}
