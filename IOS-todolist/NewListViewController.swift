//
//  NewListViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-09.
//

import UIKit

class NewListViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var date: UIDatePicker!

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
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
