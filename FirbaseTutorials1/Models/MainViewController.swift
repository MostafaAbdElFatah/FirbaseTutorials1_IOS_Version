//
//  MainViewController.swift
//  FirbaseTutorials1
//
//  Created by Mostafa AbdEl Fatah on 10/31/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    @IBOutlet weak var textViewData:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseAuth.authChanged { (auth, user) in
            if user == nil {
                let mainStoryboard = UIStoryboard(name: "Main", bundle:Bundle.main)
                let vc  = mainStoryboard.instantiateViewController(withIdentifier: "maintabbar")
                self.present(vc, animated: true, completion: nil)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        //ref.child("name").setValue("Mostafa AbdElFatah")
        //ref.child(FirebaseAuth.getUserId()!).setValue("\(FirebaseAuth.getUser()?.displayName ?? "no has name")")
        //ref.child(FirebaseAuth.getUserId()!).child("name").setValue("\(FirebaseAuth.getUser()?.displayName ?? "no has name")")
        
    }

    @IBAction func backDidTaped(_ sender: UIBarButtonItem) {
        FirebaseAuth.signOut()
    }
    
    @IBAction func saveDidTapedd(_ sender:UIButton){
        let ref = Database.database().reference()
        let child = ref.child("notes").childByAutoId()
        child.setValue(textViewData.text)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
