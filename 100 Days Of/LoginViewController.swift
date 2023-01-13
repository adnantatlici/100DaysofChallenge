//
//  LoginViewController.swift
//  100 Days Of
//
//  Created by Mustafa Adnan Tatlıcı on 1.01.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let textField = UITextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.1275785565, green: 0.1375774741, blue: 0.2218845487, alpha: 1)
        
        UserDefaults.standard.object(forKey: "goals")
        
        let getGoals = newGoals
       
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 200, y: 100)
        label.textAlignment = .center
        label.text = "#100DaysOf"
        self.view.addSubview(label)
        label.textColor = UIColor(red: 0.3819528222, green: 0.8536232114, blue: 0.4215450883, alpha: 1)
        _ = UIBezierPath(arcCenter: view.center,
                                      radius: 150,
                                      startAngle: -(.pi / 2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        

        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textField.center = CGPoint(x: 130, y: 300)

        textField.placeholder = "What would you like to challenge about?"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .done
        textField.sizeToFit()
        textField.backgroundColor = #colorLiteral(red: 0.1275785565, green: 0.1375774741, blue: 0.2218845487, alpha: 1)
        view.addSubview(textField)
        
        
        let button = UIButton()

        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.center = view.center

        button.setTitle("Kaydet", for: .normal)
        button.setTitleColor(UIColor(red: 0.3819528222, green: 0.8536232114, blue: 0.4215450883, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1275785565, green: 0.1375774741, blue: 0.2218845487, alpha: 1)

        button.addTarget(self, action: #selector(kaydetButtonTapped), for: .touchUpInside)

        view.addSubview(button)
        
    }
    
    @objc func kaydetButtonTapped() {
        UserDefaults.standard.set(textField.text, forKey: "goals")
        performSegue(withIdentifier: "toVC", sender: self)
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toVC" {
            let destinationViewController = segue.destination as! ViewController
            destinationViewController.text = textField.text!
        }
    }
    
}
