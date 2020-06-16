//
//  Complete.swift
//  ToDoList
//
//  Created by عبدالوهاب العنزي on 14/06/2020.
//  Copyright © 2020 Abdulwahab. All rights reserved.
//

import UIKit

class Complete: UIViewController {
    
    @IBOutlet weak var toDoLabel: UILabel!
    
    var toDo :ToDoItem? = nil
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if toDo != nil {
            if toDo!.impotent {
                if let name = toDo?.name {
                toDoLabel.text = name + "😅✌🏻"
                }
            }else {
                toDoLabel.text = toDo!.name
                
            }
            
        }
    }
    
    
    @IBAction func completButton(_ sender: Any)
    {
        
          if let contex =  (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
          {
            if toDo != nil {
                  contex.delete(toDo!)
                
  (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                // يرجعك الى الصفحه الي قبل
                 navigationController?.popViewController(animated: true)
            }
            
            
           
            
          
        }
        
//           if let toDos = ToDoTableVC?.toDos {
//         var index = 0
//         for x in toDos {
//
//         if x.name == toDo.name {
//         ToDoTableVC?.toDos.remove(at: index)
//         ToDoTableVC?.tableView.reloadData()
//         navigationController?.popViewController(animated: true)
//         return
//         }
//         index += 1
//         }
//
//         }
         
    }
    
    
}
