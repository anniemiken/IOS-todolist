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
            //let newTask = todoTask.textFields![0]
            //self.tasks.append(newTask.text)
            self.tdoTableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        todoTask.addAction(cancel)
        todoTask.addAction(addTodoAction)
        present(todoTask, animated: true, completion: nil)
    }
    
    private var task = [Tasks]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tdoTableView.delegate = self
        tdoTableView.dataSource = self
        tdoTableView.rowHeight = 50
        fetchTodoData()

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as? todoCell else{ return UITableViewCell()
            
        }
        print(self.task)
        cell.todoLabel.text = task[indexPath.row].title
        
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
            task.remove(at: indexPath.row)
            tdoTableView.reloadData()
        }
    }
  
    
  
    private func fetchTodoData(){
        guard let downloadURL = URL(string: "https://jsonplaceholder.typicode.com/todos") else{
            return
        }
    
        URLSession.shared.dataTask(with: downloadURL) {data, URLResponse, error in
            print("Downloaded")
            guard let data = data, error == nil, URLResponse != nil else{
                print("something is wrong")
                return
            }
            
        
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let tasksdown = try decoder.decode(Task.self, from: data)
               
                self.task = tasksdown.tasks
                DispatchQueue.main.async {
                    self.tdoTableView.reloadData()
                }
                
            }catch{

                print("Something wrong after downloading")
            }
        }.resume()
            
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




