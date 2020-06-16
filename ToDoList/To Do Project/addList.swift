//
//  addList.swift
//  ToDoList
//
//  Created by عبدالوهاب العنزي on 14/06/2020.
//  Copyright © 2020 Abdulwahab. All rights reserved.
//

import UIKit

class addList: UIViewController {

    @IBOutlet weak var textList: UITextField!
    @IBOutlet weak var impotantSwitch: UISwitch!
    // هذا المتغير عشان ينقل لك البيانات من الصفحه هذي الحاليه الى الصفحاه المراده
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    
    @IBAction func addButton(_ sender: UIButton)
    {
        
     
        // الان لازم تعمل اكسس بين الكلاس والاب دلقيت
        // هذا معناه اكسس بين كلاس الاب دلقت والكلاس هذا
        if let contex =  (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
               // اضفنا متغير وياخذ قيمه من الكلاس ToDo
            
                    let newToDo = ToDoItem(context: contex)
            //اضفت متغير هذا المتغير ياخذ قيمة ال TextField
                    if let name = textList.text
                    {
                        // الان قلت لname  ياخذ قيمة ال name الي هو الان يساوي textList وهو القيمه داخل التكست
                        newToDo.name = name
                        // وهذا ياخذ قيمة سويتش
                        newToDo.impotent = impotantSwitch.isOn
                        
            //            // هذا معناه تاكسس البينات اي تضيفهم
            //            ToDoTableVC?.toDos.append(newToDo)
            //            // تنقل لك البيانات
            //            ToDoTableVC?.tableView.reloadData()
                        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                        // هذي الي تنقلك للصفحه
                        
                        navigationController?.popViewController(animated: true)
                    }
        }
          
    }
    
}
