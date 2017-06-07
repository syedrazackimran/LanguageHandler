//
//  RootBaseViewController.swift
//  ImuLanguageHandler
//
//  Created by Imu on 6/6/17.
//  Copyright © 2017 2ntkh. All rights reserved.
//

import UIKit

class RootBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        applicationLanguageChangeNotification()
        NotificationCenter.default.addObserver(self, selector: #selector(applicationLanguageChangeNotification), name: NSNotification.Name( ApplicationLanguageDidChangeNotification), object: nil)

        // Do any additional setup after loading the view.
    }
    func applicationLanguageChangeNotification()  {
        print("Either %@ class did not implemented language change notification or it's calling super method",NSStringFromClass(self.superclass!))
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name( ApplicationLanguageDidChangeNotification), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
