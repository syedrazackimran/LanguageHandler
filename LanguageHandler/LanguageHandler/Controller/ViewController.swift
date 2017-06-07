//
//  ViewController.swift
//  ImuLanguageHandler
//
//  Created by Imu on 6/6/17.
//  Copyright © 2017 2ntkh. All rights reserved.
//

import UIKit

class ViewController: RootBaseViewController {

    @IBOutlet var Btn_Change: UIButton!
    @IBOutlet var Lbl_Example: UILabel!
    var ArrayLanguage = ["Tamil","English","Khmer","French","Japanese","Korean","Spanish"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Btn_Change.layer.cornerRadius = 4
        Btn_Change.layer.masksToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func applicationLanguageChangeNotification() {
         Lbl_Example.text = ImranLocalizedString(key: "hello_world", comment: "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ChangeAction(_ sender: UIButton) {
        let locationAlert = UIAlertController(title: "Change Language", message: "Run time change App language !!!", preferredStyle: .actionSheet)
        
        for i in ArrayLanguage
        {
            let LanguageName = UIAlertAction(title: i as String , style: .`default`) {  action -> Void in
                if let alertIndex = locationAlert.actions.index(of: action) {
                    switch (alertIndex)
                    {
                    case 0 :
                        Theme.saveLanguage(str: "ta")
                    case 1 :
                        Theme.saveLanguage(str: "en")
                    case 2 :
                        Theme.saveLanguage(str: "km")
                    case 3 :
                        Theme.saveLanguage(str: "fr")
                    case 4 :
                        Theme.saveLanguage(str: "ja")
                    case 5 :
                        Theme.saveLanguage(str: "ko")
                    case 6 :
                        Theme.saveLanguage(str: "es")
                    default :
                        break;
                    }
                    Theme.SetLanguageToApp()
                }
                locationAlert.dismiss(animated: true, completion: nil)
                print(Theme.getCurrentLanguage())
            }
            locationAlert.addAction(LanguageName)
            
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            locationAlert.dismiss(animated: true, completion: nil)
        }
        locationAlert.addAction(dismissAction)
        locationAlert.preferredAction = dismissAction
        locationAlert.view.tintColor = UIColor.black
        self.present(locationAlert, animated: true, completion: nil)

    }

}

