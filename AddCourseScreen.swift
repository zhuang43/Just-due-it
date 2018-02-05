//
//  AddCourseScreen.swift
//  MoveYourAss
//
//  Created by huang on 1/10/18.
//  Copyright © 2018 huang. All rights reserved.
//

import UIKit

class AddCourseScreen: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    var courses : [String] = []

    @IBOutlet weak var courseTf: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print("line 24\n")
        let coursesObj = UserDefaults.standard.object(forKey: "courses")
        if let tempCourses = coursesObj as? [String]{
            courses = tempCourses
        }
         print("finish acquireing data\n")
        
    }
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? CourseCell{
            cell.courseTitle.text = courses[indexPath.row]
            cell.courseTitle.font = UIFont.init(name: "Montserrat-Regular", size: 15)
            return cell
        }else{
            return UITableViewCell()
        }
        
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            courses.remove(at: indexPath
            .row)
            UserDefaults.standard.set(courses, forKey: "courses")
            tableView.reloadData()
        }
    }
    
    
    @IBAction func addCourseBtn(_ sender: Any) {
        
        let coursesObj = UserDefaults.standard.object(forKey: "courses")
        if let tempCourses = coursesObj as? [String]{
            courses = tempCourses
            courses.append(courseTf.text!)
        }   else{
            courses = [courseTf.text!]
        }
        UserDefaults.standard.set(courses, forKey: "courses")
        courseTf.text = ""
        tableView.reloadData()
        print(courses)
        print("\n")
        
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "backAES", sender: self)
        
    }
    
  
    
    
    @IBAction func clearBtn(_ sender: Any) {
        var courses : [String] = []
        UserDefaults.standard.set(courses, forKey: "courses")
        
        self.tableView.reloadData()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
