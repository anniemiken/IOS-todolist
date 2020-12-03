//
//  ViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-09.
//
import UserNotifications
import UIKit
import CoreData

class ViewController: UIViewController{

    
    @IBOutlet var table: UITableView!
   //private let listData
    var lists = [Lists]()
    
    override func viewDidLoad() {
        table.delegate = self
        table.dataSource = self
        requestUserData()
    }
    
    func requestUserData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Lists")
        req.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(req)
            for data in results as! [NSManagedObject]{
                lists.append(data as! Lists)
                table.reloadData()
            }
        }catch{
            print("fail")
        }
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
    

    @IBAction func viewMap(_ sender: Any) {
        guard let control = storyboard?.instantiateViewController(identifier: "map") as? MapScreen else{
            return
        }
        control.title = "Map"
        control.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(control, animated: true)
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
        vc.title = lists[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
    }
}




extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = lists[indexPath.row].name
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd, YYYY"
        cell.detailTextLabel?.text = formatter.string(for: lists[indexPath.row].date)
        return cell
    }

     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
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


