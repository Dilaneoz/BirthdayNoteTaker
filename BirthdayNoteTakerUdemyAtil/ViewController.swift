//
//  ViewController.swift
//  BirthdayNoteTakerUdemyAtil
//
//  Created by Dilan Öztürk on 7.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // user defaults küçük verileri kaydetmeye yarar
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String { // text field a string bir ifade kaydedilmişse
            nameLabel.text = "Name : \(newName)" // nameLabel da göster
        }
        
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday : \(newBirthday)"
        }
    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    
    @IBAction func deletePressed(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil { // text field daki alan boş değilse
            
            UserDefaults.standard.removeObject(forKey: "name") // yazılanı kaldır
            nameLabel.text = "Name : "
        }
        
        if (storedBirthday as? String) != nil {
            
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday : "
        }
    }
    
}
