//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by عبدالوهاب العنزي on 14/06/2020.
//  Copyright © 2020 Abdulwahab. All rights reserved.
//


/*
هذا الكلاس table View
 عشان نضيف فيه لسته

*/
import UIKit

class ToDoTableViewController: UITableViewController {
    
    // الان عرفنا متغير من نوع مصفوفه وقيمة هذا المتغير تاتي من الكلاس ToDo
    var toDos :[ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
          if let contex =  (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let dataCoreToDoItem =  try? contex.fetch(ToDoItem.fetchRequest()) as? [ToDoItem] {
                toDos = dataCoreToDoItem
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    // عدد الاسطر
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return toDos.count
    }
    
    // الخلايا
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell()
        
        // اضطريت اني اسوي كذا عشان يكون هذا المتغير يحمل المتغيرات الموجوده في كلاس   ToDo
        let toDo = toDos[indexPath.row]
        
        if toDo.impotent {
            if let name = toDo.name {
                cell.textLabel?.text =  name + " 🤙🏻"
            }
        }else {
            cell.textLabel?.text = toDo.name
        }

        
        return cell
    }
    // هذا الكود معناه يحدد لك النوع بحيث اذا ضغطت عليه ياخذه وينقله الى الصفحه الثانيه 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedToDo)
    }
    // هذا الكود نقل الملفات يعني اذا جتك الملفات من الصفحه هذي عطها موافقه 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
      
        if let completeVC = segue.destination as? Complete
        {
            if let toDo = sender as? ToDoItem
            {
                completeVC.toDo = toDo
               
            }
        }
    }
    
}
