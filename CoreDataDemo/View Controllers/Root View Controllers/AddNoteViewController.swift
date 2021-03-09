//
//  AddNoteViewController.swift
//  CoreDataDemo
//
//  Created by Muflis on 09/03/21.
//

import UIKit
import CoreData

class AddNoteViewController: UIViewController {

    @IBOutlet var textData: UITextField!
    @IBOutlet var textViewData: UITextView!
    
    var managedObjectContext: NSManagedObjectContext?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.title = "Add Note"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func save(){
        guard let managedObjectContext = managedObjectContext else {
            return
        }
        
        guard let title = textData.text , !title.isEmpty else {
            showAlert(with: "No title", for: "Enter data for note")
            return
        }
        
        let note = Note(context: managedObjectContext)
        note.title = textData.text
        note.contents = textViewData.text
        note.createdAt = Date()
        note.updatedAt = Date()
        
        _ = navigationController?.popViewController(animated: true)
    }

}
