//
//  ViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-09.
//
import UserNotifications
import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet var table: UITableView!
    
    var models = [lists]()
    
    override func viewDidLoad() {
        table.delegate = self
        table.dataSource = self
    }
   
    func scheduleTest(){
        let notification = UNMutableNotificationContent()
        notification.title = "Hello"
        notification.sound = .default
        notification.body = "You have a list for..."
        let currentDate = Date().addingTimeInterval(10)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate), repeats: false)
        
        let req = UNNotificationRequest(identifier: "some_long_id", content: notification, trigger: trigger)
        UNUserNotificationCenter.current().add(req, withCompletionHandler: {error in
            if error != nil{
                print("Something is wrong")
            }
        })
        
    }
    

   
    @IBAction func addNewListByButton(_ sender: Any) {
        guard let viewControl = storyboard?.instantiateViewController(identifier: "add") as? NewListViewController else{

            return
        }
        viewControl.title = "New list"
        viewControl.navigationItem.largeTitleDisplayMode = .never
        viewControl.completion = {title, body, date in
            DispatchQueue.main.async{
                self.navigationController?.popToRootViewController(animated: true)
                let new = lists(name: title, date: date, identifier: "id_\(title)")
                self.models.append(new)
                self.table.reloadData()
                let notification = UNMutableNotificationContent()
                notification.title = title
                notification.sound = .default
                notification.body = body
                let currentDate = date
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate), repeats: false)
                
                let req = UNNotificationRequest(identifier: "some_long_id", content: notification, trigger: trigger)
                UNUserNotificationCenter.current().add(req, withCompletionHandler: {error in
                    if error != nil{
                        print("Something is wrong")
                    }
                })
            }
        }
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound], completionHandler: {success, error in
            if success{
                self.scheduleTest()
            }else if error != nil{
                print("error occurred")
            }
        })
        navigationController?.pushViewController(viewControl, animated: true)
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "tasks") as! taskViewController
        vc.title = models[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
    }
}




extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].name
        let date = models[indexPath.row].date
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd, YYYY"
        cell.detailTextLabel?.text = formatter.string(from: date)
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
    }
    

}

struct lists{
    let name: String
    let date: Date
    let identifier: String
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


