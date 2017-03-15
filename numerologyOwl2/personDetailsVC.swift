//
//  personDetailsVC.swift
//  numerologyOwl2
//
//  Created by Reinis Kalnins on 13.03.17.
//  Copyright © 2017. g. Reinis Kalnins. All rights reserved.
//

import UIKit

class personDetailsVC: UIViewController {
    
    //@IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var snameField: UITextField!

    @IBOutlet weak var bdayField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }

       
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let person = Persona(context: context)
        
        if let name = nameField.text {
            person.name = name
        }
        
        if let sname = snameField.text {
            person.sname = sname
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        
        if let bday = bdayField.text {
            person.bday = dateFormatter.date(from: bday) as NSDate?
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    
}
