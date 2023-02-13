//
//  AuthService.swift
//  PRMODE
//
//  Created by Javier Bachero Gosalbo on 9/2/23.
//

import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    public init() {}
    
    func login(email: String, password: String, success: @escaping (User?) -> Void, fail: @escaping (Error) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let result = result, error == nil {
                success(result.user)
            } else {
                fail(error!)
            }
        }
    }
    
    func register(email: String, password: String, success: @escaping (User) -> Void, fail: @escaping (Error) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
          if let user = result?.user {
            success(user)
          } else {
            fail(error ?? NSError(domain: "AuthService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Ha ocurrido un error desconocido"]))
          }
        }
    }
    
    func checkMail(email: String) -> String{
        // Comprueba si el correo electrónico es válido
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailPredicate.evaluate(with: email) {
            //errorView.messageLabel.text = "El correo electrónico no es válido"
            //errorView.isHidden = false
            return ""
        }
        return ""
    }
    
    func checkPassword(password: String) -> String {
         if password.count < 6 {
             return ""
         }

         // Comprueba si la contraseña contiene mayúsculas
         if !password.uppercased().contains(where: { (char) -> Bool in
             return char >= "A" && char <= "Z"
         }) {
             //errorView.messageLabel.text = "La contraseña debe contener al menos una mayúscula"
             //errorView.isHidden = false
             return ""
         }
        return ""
    }
}

