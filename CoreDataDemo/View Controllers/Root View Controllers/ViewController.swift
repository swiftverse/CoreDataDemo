//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Muflis on 07/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var  coreDataManager = CoreDataManager(modelName: "Notes")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }


}

