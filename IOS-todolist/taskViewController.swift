//
//  taskViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-18.
//

import UIKit

class taskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    @IBOutlet weak var tdoTableView: UITableView!
    @IBAction func addNewTask(_ sender: Any) {
      
    }
    var model = [task]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tdoTableView.delegate = self
        tdoTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! todoCell
        
        
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

struct task{
    let name: String
}
