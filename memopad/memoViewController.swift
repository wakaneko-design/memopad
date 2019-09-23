//
//  memoViewController.swift
//  memopad
//
//  Created by Yuto Wakabayashi on 2019/09/22.
//  Copyright © 2019 com.litech. All rights reserved.
//

import UIKit

class memoViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contextTextView: UITextView!

    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = saveData.object(forKey: "title") as? String
        contextTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo(){
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contextTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    self.navigationController?.popViewController(animated: true)
                }
        )
        )
        present(alert, animated: true, completion: nil)
        
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
    }
    
    
    
    
    
    
    
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


