//
//  AddEventScreen.swift
//  MoveYourAss
//
//  Created by huang on 4/30/17.
//  Copyright © 2017 huang. All rights reserved.
//

import UIKit

class AddEventScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 248/255, alpha: 1.0)
        UITextField.appearance().tintColor = .black
   /*
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        toolbar.setItems([doneBtn], animated: false)
        pickerView.inputView = toolbar*/

    }

    @IBOutlet var tf1Ol: UITextField!
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "back", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, h:mm a"
        dateOl.setTitle(formatter.string(from: pickerView.date), for: UIControlState.normal)
        tf1Ol.becomeFirstResponder()
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    @IBOutlet var eventTf: UITextField!
    @IBOutlet var commentTf: UITextField!
    @IBAction func datePicker(_ sender: Any) {
        pickerView.isHidden = false
        self.view.endEditing(true)
        
    }
    @IBAction func dayPicker(_ sender: Any) {
    }
    
    @IBOutlet var dateOl: UIButton!
    
    @IBAction func pickerValueChanged(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, h:mm a"
        dateOl.setTitle(formatter.string(from: pickerView.date), for: UIControlState.normal)
        
        
    }
   
    @IBAction func DoneButton(_ sender: Any) {
        
        let tasksObj = UserDefaults.standard.object(forKey: "tasks")
        let commentsObj = UserDefaults.standard.object(forKey: "comments")
        let dateObj = UserDefaults.standard.object(forKey: "dates")
        let dayObj = UserDefaults.standard.object(forKey: "days")
        //let colorObj = UserDefaults.standard.object(forKey: "colors")
        let nsdatesObj = UserDefaults.standard.object(forKey: "nsdates")
        
        var tasks : [String]
        var comments : [String]
        var dates : [String]
        var days : [String]
        //var colors : [Int]
        var nsdates : [Date]
        
        let formatter1 = DateFormatter()
        let formatter2 = DateFormatter()
        formatter1.dateFormat = "MMM dd"
        formatter2.dateFormat = "E h:mm a"
        let dateFormat = formatter1.string(from: pickerView.date)
        let dayFormat = formatter2.string(from: pickerView.date)
        
        if let tempTasks = tasksObj as? [String]{
            tasks = tempTasks
            tasks.append(eventTf.text!)
        }   else{
            tasks = [eventTf.text!]
        }
        
        if let tempComments = commentsObj as? [String]{
            comments = tempComments
            
            comments.append(commentTf.text!)
            
        }   else{
            comments = [commentTf.text!]
        }
        
        if let tempDates = dateObj as? [String]{
            dates = tempDates
            dates.append(dateFormat)
        }   else{
            dates = [dateFormat]
        }
        
        if let tempDays = dayObj as? [String]{
            days = tempDays
            days.append(dayFormat)
        }   else{
            days = [dayFormat]
        }
        /*if let tempColors = colorObj as? [Int]{
            colors = tempColors
            colors.append(Int(arc4random_uniform(6)))
        }   else{
            colors = [Int(arc4random_uniform(6))]
        }*/
        
        let tempNsdates = nsdatesObj as? [Date]
            nsdates = tempNsdates!
            nsdates.append(pickerView.date)
        
        
        
        
        
        UserDefaults.standard.set(tasks, forKey: "tasks")
        UserDefaults.standard.set(comments, forKey: "comments")
        UserDefaults.standard.set(dates, forKey: "dates")
        UserDefaults.standard.set(days, forKey: "days")
        //UserDefaults.standard.set(colors, forKey: "colors")
        UserDefaults.standard.set(nsdates, forKey: "nsdates")
        
        
        self.performSegue(withIdentifier: "back", sender: self)
        

    }
    @IBAction func Done(_ sender: Any) {
        
        
    }

    @IBOutlet var pickerView: UIDatePicker!
    
    
    
    @IBAction func tf1(_ sender: Any){
        
    }
    @IBAction func tf2(_ sender: Any) {
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
