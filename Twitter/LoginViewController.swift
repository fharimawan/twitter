//
//  LoginViewController.swift
//  Twitter
//
//  Created by Farel Harimawan on 4/28/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: Segue.loginToHome.rawValue){
            self.performSegue(withIdentifier: Segue.loginToHome.rawValue, sender: self)
        }
    }
    
    
    // segue not in button but from view controller to other controller with identifier
    // this way we can control how/when to segue
    //
    @IBAction func onLoginButton(_ sender: Any) {
        let baseURL = "https://api.twitter.com/oauth/request_token"
        // url to call
        // if succesful do what
        // if fail do what
        TwitterAPICaller.client?.login(url: baseURL, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: Segue.loginToHome.rawValue, sender: self)
            
        }, failure: { (Error) in
            
            print("Could not login!")
            
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
