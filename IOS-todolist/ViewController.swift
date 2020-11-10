//
//  ViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-09.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource, UITableViewDelegate {

    
    
    var models: [(title: String, note: String)] = []
    
    @IBOutlet weak var listLabel: UILabel! //says no lists
    @IBOutlet weak var table: UITableView! //tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Lists"
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didCreateNewList(){
        guard let vc  = storyboard?.instantiateViewController(identifier: "new") as? NewListViewController else{
            return
        }
        vc.title = "New List"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = {listLabel, note in self.models.append((title: listLabel, note: note))
            self.navigationController?.popToRootViewController(animated: true)
            self.table.isHidden = false
            self.listLabel.isHidden=true
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? ListViewController else{
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "List"
        navigationController?.pushViewController(vc, animated: true)
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


