//
//  CalendarViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-11-26.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var imageArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainScrollView.frame = view.frame
        
        
        
        imageArray = [ #imageLiteral(resourceName: "june") , #imageLiteral(resourceName: "july"), #imageLiteral(resourceName: "aug-1"), #imageLiteral(resourceName: "sep"),#imageLiteral(resourceName: "oct"), #imageLiteral(resourceName: "nov") ,  #imageLiteral(resourceName: "dec")]
        for i in 0..<imageArray.count{
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: CGFloat(xPosition), y: 0, width: self.mainScrollView.frame.width, height: self.view.frame.height)
            
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
            mainScrollView.addSubview(imageView)
        }
        
    }
    
}

