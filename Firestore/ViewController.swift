//
//  ViewController.swift
//  Firestore
//
//  Created by Andrew on 2/12/19.
//  Copyright © 2019 Andrii Halabuda. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        readFirestore()
    }
    
    func readFirestore() {
        let db = Firestore.firestore()
        db.collection("users").getDocuments { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                for doc in (snapshot?.documents)! {
                    let data = doc.data()
                    print(data)
//                    print(doc)
//                    if let name = doc.data()["name"] as? String {
//                        if let age = doc.data()["age"] as? Int {
//                            print(name, age)
//                        }
//                    }
                    
                }
            }
        }
    }
    
    func writeToFirestore() {
        
        let dict: [String:Any] = ["name": "Drew", "age": 25]
        
        let db = Firestore.firestore()
        db.collection("users").document("Drew").setData(dict)
        
    }


}

