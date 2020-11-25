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
        if let nameText = nameField.text, !nameText.isEmpty,
           let bodyText = bodyField.text, !bodyText.isEmpty{
            let datePick = date.date
            completion?(nameText, bodyText, datePick)
        }
        /*
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        if let newItem = NSEntityDescription.insertNewObject(forEntityName: "Lists", into: context) as? Lists{
            newItem.name = nameField.text!
            newItem.date = date.date
            newItem.identifier = bodyField.text!
            appDelegate.saveContext()
 
 }
 */
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

