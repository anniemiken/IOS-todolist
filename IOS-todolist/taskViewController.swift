//
//  taskViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-18.
//

import UIKit

class taskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    @IBOutlet weak var tdoTableView: UITableView!
    @IBAction func addNewTask(_ sender: Any){
        let todoTask = UIAlertController(title: "Add Todo", message: "Add a new task", preferredStyle: .alert)
        todoTask.addTextField()
        let addTodoAction = UIAlertAction(title: "Add", style: .default){ (action) in
            let newTask = todoTask.textFields![0]
            self.model.append(newTask.text!)
            self.tdoTableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        todoTask.addAction(cancel)
        todoTask.addAction(addTodoAction)
        present(todoTask, animated: true, completion: nil)
    }
    var model: [String] = ["Get groceries"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tdoTableView.delegate = self
        tdoTableView.dataSource = self
        tdoTableView.rowHeight = 50
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! todoCell
        cell.todoLabel.text = model[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! todoCell
        
        if cell.isChecked == false{
            cell.todoImage.image = UIImage(named: "check.png")
            cell.isChecked = true
        }else{
            cell.todoImage.image = nil
            cell.isChecked = false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            model.remove(at: indexPath.row)
            tdoTableView.reloadData()
        }
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

struct task{
    let name: String
}
