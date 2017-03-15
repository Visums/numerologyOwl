//
//  PersonCell.swift
//  numerologyOwl2
//
//  Created by Reinis Kalnins on 10.03.17.
//  Copyright © 2017. g. Reinis Kalnins. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sname: UILabel!
    @IBOutlet weak var bday: UILabel!

    func configureCell(persona: Persona) {
        
        name.text = persona.name
        sname.text = persona.sname
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        
        bday.text = dateFormatter.string(from: persona.bday as! Date)
        
    }

}
