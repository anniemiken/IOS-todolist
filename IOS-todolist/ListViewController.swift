//
//  ListViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-05.
//

import UIKit

class ListViewController: UIViewController{
 
    var tasks: [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks.append(Task(name: "task object"))// Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView,  section: Int) -> Int{
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let  cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as!TaskCell
        cell.taskNameLabel.text = tasks [indexPath.row].name
        if tasks[indexPath.row].checked{
             cell.checkBoxOutlet.setBackgroundImage(UIImage(named: "CHECKBOXFILLED.png") , for: .normal)
        }else{
            cell.checkBoxOutlet.setBackgroundImage(UIImage(named: "CHECKBOXFILLED.png") , for: .normal)
            
        }
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class Task{
    var name = ""
    var checked = false
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
}
