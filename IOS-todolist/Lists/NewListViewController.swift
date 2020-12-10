//
//  NewListViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-09.
//
import CoreData
import UIKit 

class NewListViewController: UIViewController, UITextFieldDelegate {
    
    var fetchedData: NSFetchedResultsController<Lists>!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var date: UIDatePicker!
    private let listsDatabaseManager = ListsDatabaseManager()
    public var completion:((String, String, Date)->Void)?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        bodyField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(save))
    }

    
    @objc func save(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let list = NSEntityDescription.entity(forEntityName: "Lists", in: context)
        let newList = NSManagedObject(entity: list!, insertInto: context)
        newList.setValue(nameField.text, forKey: "name")
        newList.setValue(bodyField.text, forKey: "identifier")
        newList.setValue(date.date, forKey: "date")
        do{
            try context.save()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }catch{
            print("Failed to save data")
        }
 
 
 
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

