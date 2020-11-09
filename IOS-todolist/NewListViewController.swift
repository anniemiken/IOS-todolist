//
//  NewListViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-09.
//

import UIKit

class NewListViewController: UIViewController {
    @IBOutlet var titleField: UITextField!
    @IBOutlet var listField: UITextView!
    
    public var completion: ((String, String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        // Do any additional setup after loading the view.
    }
    
    @objc func didTapDone(){
        if let text = titleField.text, !text.isEmpty, !listField.text.isEmpty{
            completion?(text, listField.text)
        }
    }

}
