//
//  ViewController.swift
//  MoveYourAss
//
//  Created by huang on 4/28/17.
//  Copyright © 2017 huang. All rights reserved.
//

import UIKit

class MainScreen: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var taskAll = [TaskCellModel]()
    var tasks: [String] = []
    var comments: [String]
        = []
    var dates: [String] = []
    var days: [String] = []
    var colors: [UIColor] = []
    var nsdates: [Date] = []
    var timeleft: [String] = []
    
    
    var threeDayTasks = 0
    var todayTasks = 0
    var weekTasks = 0
    
    var cellGreen = UIColor.init(red: 69/255, green: 181/255, blue: 84/255, alpha: 1.0)
    var cellRed = UIColor.init(red: 218/255, green: 97/255, blue: 70/255, alpha: 1.0)
    var cellOrange = UIColor.init(red: 250/255, green: 185/255, blue: 80/255, alpha: 1)
    var cellBlue = UIColor.init(red: 79/255, green: 191/255, blue: 247/255, alpha: 1)
    var cellDarkBlue = UIColor.init(red: 35/255, green: 42/255, blue: 72/255, alpha: 1.0)
    //var cellDarkBlue = UIColor.init(red: 93/255, green: 183/255, blue: 245/255, alpha: 1)
    var cellColors = [UIColor]()
    

    
    
    
    
    override func viewDidLoad() {

        navigationController?.navigationBar.barTintColor = UIColor.init(red: 216/255, green: 38/255, blue: 125/255, alpha: 1)
    
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        /*self.cellColors.append(cellGreen)
        self.cellColors.append(cellGreenY)
        self.cellColors.append(cellOrange)
        self.cellColors.append(cellYellow)
        self.cellColors.append(cellPurple)
        self.cellColors.append(cellBlue)*/
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //self.tabBarController?.tabBar.isHidden = true
        
         //clearData()
        
        acquireData()
        print("\nDone acquire data")
        //print("\(comments.count) comments in the list")sxx

        countDays()
        print("\nDone count days")
        
        print("\n local array count")
      
        print("tasks")
        print(tasks.count)
        print("comments")
        print(comments.count)
        print("dates")
        print(dates.count)
        print("days")
        print(days.count)
        print("colors")
        print(colors.count)
        print("nsdates")
        print(nsdates.count)
        print("timeleft")
        print(timeleft.count)

        sortTasks()
        print("\nDone sort task")
        
        prepareTableView()
        print("\nDone prepareTableView")
        
        setupLabels()
        print("\nDone setupLabels")
        
        table.tableFooterView = UIView(frame: .zero)
        
        table.reloadData()
        
    }
    
    
    
    
    func acquireData(){
        let tasksObj = UserDefaults.standard.object(forKey: "tasks")
        let commentsObj = UserDefaults.standard.object(forKey: "comments")
        let datesObj = UserDefaults.standard.object(forKey: "dates")
        let daysObj = UserDefaults.standard.object(forKey: "days")
        //let colorsObj = UserDefaults.standard.object(forKey: "colors")
        let nsdatesObj = UserDefaults.standard.object(forKey: "nsdates")
        
        if let tempTasks = tasksObj as? [String]{
            tasks = tempTasks
        }
        if let tempComments = commentsObj as? [String]{
            comments = tempComments
        }
        if let tempDates = datesObj as? [String]{
            dates = tempDates
        }
        if let tempDays = daysObj as? [String]{
            days = tempDays
        }
        if let tempNsdates = nsdatesObj as? [Date]{
            nsdates = tempNsdates
        }
        /*if let tempColors = colorsObj as? [Int]{
            colors = tempColors
        }*/
    }

    
    
    
    func sortTasks(){

        var tempDates : String?
        var tempTasks : String?
        var tempComments : String?
        var tempDays : String?
        var tempColors : UIColor?
        var tempNsdates : Date?
        var tempTimeLeft : String?
        
        if nsdates.count == 0||nsdates.count == 1 {
            return
        }
   
        for j in (1...nsdates.count-1).reversed(){
            print("j=\(j)")
            
            for i in 1...j{
                print("i=\(i)")
                if(nsdates[i-1]>nsdates[i]){
                    tempDates = dates[i-1]
                    dates[i-1] = dates[i]
                    dates[i] = tempDates!
                    //print("dates")
                    tempTasks = tasks[i-1]
                    tasks[i-1] = tasks[i]
                    tasks[i] = tempTasks!
                    //print("tasks")
                    tempComments = comments[i-1]
                    comments[i-1] = comments[i]
                    comments[i] = tempComments!
                    //print("cments")
                    tempDays = days[i-1]
                    days[i-1] = days[i]
                    days[i] = tempDays!
                    //print("days")
                    tempColors = colors[i-1]
                    colors[i-1] = colors[i]
                    colors[i] = tempColors!
                    //print("color")
                    tempNsdates = nsdates[i-1]
                    nsdates[i-1] = nsdates[i]
                    nsdates[i] = tempNsdates!
                    //print("nsdate")
                    tempTimeLeft = timeleft[i-1]
                    timeleft[i-1] = timeleft[i]
                    timeleft[i] = tempTimeLeft!
                    //print("tl")
                }
            }
        }
    }
    
    func countDays(){
   
        let today = Date()
        for i in nsdates{
            
            let calendar = NSCalendar.current
            let date2 = calendar.startOfDay(for: i)
            let date1 = calendar.startOfDay(for: today)
            let components = calendar.dateComponents([.day], from: date1, to: date2)
            print("  \n")
            print(index)
            
           
            if components.day!<0{
                timeleft.append("PAST DUE")
                colors.append(cellDarkBlue)
            }else{
            if components.day! == 0{
                todayTasks = todayTasks + 1
                timeleft.append("Due today")
                colors.append(cellRed)
            }else{
            if components.day! == 1 {
                threeDayTasks = threeDayTasks + 1
                timeleft.append("Due tomorow")
                colors.append(cellOrange)
            }else{
            if components.day!<3&&components.day!>0{
                threeDayTasks = threeDayTasks + 1
                timeleft.append("Due in 3 days")
                colors.append(cellOrange)
            }else{
            if components.day!<7&&components.day!>0{
                weekTasks = weekTasks + 1
                timeleft.append("Due in 7 days")
                colors.append(cellGreen)
            }else{
               timeleft.append(" ")
               colors.append(cellBlue)
            }
            }
         }
         }
         }
        }
    }
    
    
    @IBOutlet var todayLabel: UILabel!
    @IBOutlet var threeDayLabel: UILabel!
    @IBOutlet var weekLabel: UILabel!
    
    
    func setupLabels(){
        todayLabel.text = "Due today: \(todayTasks) "
        threeDayLabel.text = "Due in 3 days: \(threeDayTasks)"
        weekLabel.text = "Due in 7 days: \(weekTasks)"
        
    }
    
    func prepareTableView(){
        
        var i = 0
        
        taskAll.removeAll()
        while i<tasks.count{
            let tableTask = TaskCellModel(taskTitle: tasks[i], TaskComment: comments[i], TaskDate: dates[i], TaskTime: days[i], TimeLeft: timeleft[i])
            taskAll.append(tableTask)
            i+=1
        }
    }

    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     let cellSpacingHeight: CGFloat = 4
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    
    /* func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskCell{

           cell.cellColor.backgroundColor = colors[indexPath.section]
            
            let temptask = taskAll[indexPath.section]
            
            cell.updateUI(TaskCellModel: temptask)
            
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            print("\(indexPath.section) is deleted")
            tasks.remove(at: indexPath.section)
            UserDefaults.standard.set(tasks, forKey: "tasks")
            comments.remove(at: indexPath.section)
            UserDefaults.standard.set(comments, forKey: "comments")
            dates.remove(at: indexPath.section)
            UserDefaults.standard.set(dates, forKey: "dates")
            days.remove(at: indexPath.section)
            UserDefaults.standard.set(days, forKey: "days")
            nsdates.remove(at: indexPath.section)
            UserDefaults.standard.set(nsdates, forKey: "nsdates")
            
            colors.remove(at: indexPath.section)
            timeleft.remove(at: indexPath.section)
            
            threeDayTasks = 0
            weekTasks = 0
            todayTasks = 0
         
            acquireData()
            sortTasks()
            countDays()
            setupLabels()
            prepareTableView()
            table.reloadData()
            
        }
    }


    @IBAction func addBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "add", sender: self)
    }
    
    @IBOutlet var table: UITableView!
    
    
    func clearData(){
        tasks = []
        comments = []
        dates = []
        days = []
        colors = []
        nsdates = []
        timeleft = []
        
        UserDefaults.standard.set(tasks, forKey: "tasks")
        
        UserDefaults.standard.set(comments, forKey: "comments")
        
        UserDefaults.standard.set(dates, forKey: "dates")
        
        UserDefaults.standard.set(days, forKey: "days")
        
        UserDefaults.standard.set(nsdates, forKey: "nsdates")
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

