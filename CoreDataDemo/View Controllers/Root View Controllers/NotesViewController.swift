//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Muflis on 07/03/21.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {
    
    private var  coreDataManager = CoreDataManager(modelName: "Notes")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notes"
        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        // Do any additional setup after loading the view.
        //navigationbarfonts
        if let appearance = navigationController?.navigationBar.standardAppearance {
            appearance.configureWithTransparentBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 218/255, green: 96/255, blue: 51/255, alpha: 1.0)]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
        
//        if let entityDescription = NSEntityDescription.entity(forEntityName: "Note", in: coreDataManager.managedObjectContext) {
//
//            //Initialize MO
//            let note = NSManagedObject(entity: entityDescription, insertInto: coreDataManager.managedObjectContext)
//            note.setValue("My first entry", forKey: "title")
//            note.setValue(NSDate(), forKey: "createdAt")
//            note.setValue(NSDate(), forKey: "updatedAt")
            
//        let note = Note(context: coreDataManager.managedObjectContext)
//        note.title = "My second title"
//        note.createdAt = Date()
//        note.updatedAt = Date()
//            print(note)
            
//            do {
//                try coreDataManager.managedObjectContext.save()
////                if let title = note.value(forKey: "title") as? String {
////                    print(title)
//                }
//
//            catch {
//                print("unable to sabe MOC")
//                print("(\(error), \(error.localizedDescription)")
//            }
        }
 //   }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNote" {
            if let destinationVC = segue.destination as? AddNoteViewController {
                destinationVC.managedObjectContext = coreDataManager.managedObjectContext
            }
        }
    }
    
    @objc func addTapped() {
        performSegue(withIdentifier: "AddNote", sender: self)
    }


}

