//
//  ViewController.swift
//  PRMODE
//
//  Created by Javier Bachero Gosalbo on 7/2/23.
//

import UIKit
import WebKit
import FirebaseAuth
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var loginSegment: UISegmentedControl!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var webView: WKWebView!
    //REGISTER VIEW
    @IBOutlet weak var registerEmailTF: UITextField!
    @IBOutlet weak var registerPasswordTF: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    //LOGIN VIEW
    @IBOutlet weak var loginUserNameTF: UITextField!
    @IBOutlet weak var loginPasswordTF: UITextField!
    @IBOutlet weak var loginForgotAPasswordTF: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    let authService = AuthService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
    }


    @IBAction func onChangeSegmentValue(_ sender: Any) {
        
        if loginSegment.selectedSegmentIndex == 0 {
            registerView.isHidden = true
            loginView.isHidden = false
        } else {
            loginView.isHidden = true
            registerView.isHidden = false
        }
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        if let email = registerEmailTF.text, let password = registerPasswordTF.text {
            authService.register(email: email, password: password,
                success: { user in
                if let email = user.email {
                        self.navigationController?.pushViewController(HomeViewController(email: email, provider: .basic), animated: true)
                    }
                },
                fail: { error in
                    print(error)
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando el usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                 })
        }
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if let email = registerEmailTF.text, let password = registerPasswordTF.text {
            
            authService.login(email: email, password: password,
                success: { user in
                if let email = user?.email {
                        self.navigationController?.pushViewController(HomeViewController(email: email, provider: .basic), animated: true)
                    }
                },
                fail: { error in
                    print(error)
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error logando el usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                 })
        }
    }
    
    func configViews() {
        title = "Login"
        let youtubeURL = URL(string: "https://powerexplosive.com/entrenar-fuerza-es-lo-mejor-para-el-cerebro/")
        let youtubeRequest = URLRequest(url: youtubeURL!)
        webView?.load(youtubeRequest)
        registerView.isHidden = true
        loginView.isHidden = false
        registerPasswordTF.isSecureTextEntry = true
        loginPasswordTF.isSecureTextEntry = true
    }
}
