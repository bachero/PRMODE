//
//  HomeViewController.swift
//  PRMODE
//
//  Created by Javier Bachero Gosalbo on 8/2/23.
//

import UIKit

enum ProviderType: String {
    case basic
    case google
    case facebook
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UILabel!
    @IBOutlet weak var entrenamientoButton: UIButton!
    @IBOutlet weak var nutricionButton: UIButton!
    @IBOutlet weak var revisionButton: UIButton!
    @IBOutlet weak var progresoButton: UIButton!
    @IBOutlet weak var cerrarSesionButton: UIButton!
    
    private var email: String = ""
    private let provider: ProviderType
    
    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = email
        print(email)
        // Do any additional setup after loading the view.
        
        
    }
    

    @IBAction func nutritionButtonAction(_ sender: Any) {
        self.navigationController?.pushViewController(NutritionViewController.init(), animated: true)
    }
    
    
    @IBAction func NewsButtonAction(_ sender: Any) {
        self.navigationController?.pushViewController(NewsViewController.init(), animated: true)
    }

}
