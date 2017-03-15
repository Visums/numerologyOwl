//
//  mainVC.swift
//  numerologyOwl2
//
//  Created by Reinis Kalnins on 10.03.17.
//  Copyright © 2017. g. Reinis Kalnins. All rights reserved.
//

import UIKit
import CoreData

class mainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var controller: NSFetchedResultsController<Persona>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //generateTestData()
        attemtFetch()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! PersonCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
        
    }
    
    func configureCell(cell: PersonCell, indexPath: NSIndexPath) {
        
        let person = controller.object(at: indexPath as IndexPath)
        cell.configureCell(persona: person)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let objs = controller.fetchedObjects, objs.count > 0 {
            
            //let person = objs[indexPath.row]
            
                self.performSegue(withIdentifier: "showpageVC", sender: self)
//                self.performSegue(withIdentifier: "pageVC", sender: self)
        
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if let destination = segue.destination as? pageVC {
//            
//            if let person = sender as? Persona {
//                destination.person = person
//            }
//            
//            
//        }
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sections = controller.sections {
            
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    func attemtFetch () {
        
        let fetchRequest: NSFetchRequest<Persona> = Persona.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            try controller.performFetch()
            
        } catch {
            
            let error = error as NSError
            print("\(error)")
            
        }
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
        
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! PersonCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    
    func generateTestData() {
        
        // lai ieliktu kādu random datumu
        let userCalendar = Calendar.current
        var bdaycomponents = DateComponents()
        bdaycomponents.month = 11
        bdaycomponents.year = 1989
        bdaycomponents.day = 8
        let bday = userCalendar.date(from: bdaycomponents)
        
        let person = Persona(context: context)
        person.name = "Reinis"
        person.sname = "Kalniņš"
        person.bday = bday! as NSDate?
        
        bdaycomponents.month = 11
        bdaycomponents.year = 1990
        bdaycomponents.day = 23
        let bday2 = userCalendar.date(from: bdaycomponents)
        
        let person2 = Persona(context: context)
        person2.name = "Kaspars"
        person2.sname = "Plečkens"
        person2.bday = bday2! as NSDate?
        
        ad.saveContext()
        
    }
    
    
    
    
    
}






















