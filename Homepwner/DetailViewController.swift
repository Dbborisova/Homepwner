//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Desislava Borisova on 11/24/21.
//

import UIKit

class DetailViewController : UIViewController{
    @IBOutlet var myLable: UILabel!
    
    var labelText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLable.text = labelText
    }
}
