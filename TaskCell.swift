//
//  TaskCell.swift
//  MoveYourAss
//
//  Created by huang on 4/28/17.
//  Copyright © 2017 huang. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(TaskCellModel: TaskCellModel){
        
        TaskTitle.text = TaskCellModel.taskTitle
        TaskComment.text = TaskCellModel.TaskComment
        TaskDate.text = TaskCellModel.TaskDate
        TaskTime.text = TaskCellModel.TaskTime
        TimeLeft.text = TaskCellModel.TimeLeft
        
        
    }
    
    @IBOutlet var TimeLeft: UILabel!
    @IBOutlet var TaskTitle: UILabel!
    @IBOutlet var TaskComment: UILabel!
    @IBOutlet var TaskDate: UILabel!
    @IBOutlet var TaskTime: UILabel!
    @IBOutlet var StarButton: UIButton!
    @IBOutlet var cellColor: UIImageView!
}
