//
//  ViewController.swift
//  DontWasteApp-2.0
//
//  Created by user on 17/08/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    //MARK: Sign In Fields
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "E-mail"
        emailField.layer.borderWidth = 1
        emailField.autocapitalizationType = .none
        emailField.layer.borderColor = (CGColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1))
        emailField.backgroundColor = .white
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect (x: 0, y: 0, width: 5, height: 0))
        return emailField
    }()
    
    private let passwordField: UITextField = {
        let passField = UITextField()
        passField.placeholder = "Senha"
        passField.layer.borderWidth = 1
        passField.isSecureTextEntry = true
        passField.layer.borderColor = (CGColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1))
        passField.backgroundColor = .white
        passField.leftViewMode = .always
        passField.leftView = UIView(frame: CGRect (x: 0, y: 0, width: 5, height: 0))
        return passField
    }()
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 40))
        button.backgroundColor = (UIColor.init(displayP3Red: 94/255, green: 186/255, blue: 168/255, alpha: 1))
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Próximo", for: .normal)
        button.center = CGPoint(x: 350, y: 820)
        
        
        return button
    }()
    
    private var infoButton: UIButton = {
        
        var infoButton = UIButton(frame: CGRect(x: 20, y: 20, width: 30, height: 25))
        infoButton.backgroundColor = (UIColor.init(displayP3Red: 94/255, green: 186/255, blue: 168/255, alpha: 1))
        infoButton.setTitleColor(.black, for: .normal)
        infoButton.center = CGPoint(x: 370, y: 580)
        infoButton.setImage(#imageLiteral(resourceName: "cadastrohint"), for: UIControl.State.init())
        infoButton.layer.cornerRadius = 15
        infoButton.addTarget(self, action: #selector(buttonHintTapped), for: .touchUpInside)
        
        return infoButton
    }()
    
    private let labelHint: UILabel = {
        let labelHint = UILabel(frame: CGRect(x: 20, y: 20, width: 500, height: 20))
        labelHint.textAlignment = .center
        labelHint.text = "A senha deve conter de 6 à 8 caracteres"
        labelHint.font = .systemFont(ofSize: 15, weight: .semibold)
        labelHint.center = CGPoint(x: 200, y: 600)
        labelHint.isHidden = true
        return labelHint
    }()
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log Out", for: .normal)
        return button
    }()
    
    //MARK: ViewDidLoad - User/Home and Hint?/
    
    override func viewDidLoad() {
        
        let imageView = UIImageView (frame: CGRect(x: 170, y: 300, width: 65, height: 70))
        
        imageView.image = UIImage (named: "cadastrousuario")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        self.view.addSubview(imageView)
        
        let homeView = UIImageView (frame: CGRect(x: 20, y: 50, width: 40, height: 38))
        
        homeView.image = UIImage (named: "cadastrohome")
        homeView.contentMode = .scaleAspectFit
        homeView.clipsToBounds = true
        
        self.view.addSubview(homeView)
        
        //-------------------------------------------------------//
        
        super.viewDidLoad()
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        view.addSubview(infoButton)
        view.addSubview(labelHint)
        view.backgroundColor = .systemBackground
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            button.isHidden = true
            emailField.isHidden = true
            passwordField.isHidden = true
            
            view.addSubview(signOutButton)
            signOutButton.frame = CGRect(x: 20, y: 150, width: view.frame.size.width-40, height: 52)
            
            signOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        }
    }
    
    @objc private func buttonHintTapped(){
        
        if infoButton.isTouchInside {
            labelHint.isHidden = false
        } else {
            labelHint.isHidden = true
        }
    }
    
    @objc private func logOutTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            button.isHidden = false
            emailField.isHidden = false
            passwordField.isHidden = false
            
            signOutButton.removeFromSuperview()
            
        }
        catch {
            print("Ocorreu um erro")
        }
    }
    
    //MARK: Layout Constraints
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        
        emailField.frame = CGRect(x: 20,
                                  y: 450,
                                  width: view.frame.size.width-40,
                                  height: 50)
        
        passwordField.frame = CGRect(x: 20,
                                     y: emailField.frame.origin.y+emailField.frame.size.height+10,
                                     width: view.frame.size.width-40,
                                     height: 50)
        
    }
    
    //MARK: Verification Fields
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FirebaseAuth.Auth.auth().currentUser == nil {
            emailField.becomeFirstResponder()
        }
    }
    
    @objc private func didTapButton(){
        print("Botão Próximo pressionado")
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("Faltando informações")
            return
        }
        
        
        // Get Auth Instances
        // attempt sign in
        // if failure, present alert to create account
        // if user continues, create account
        
        // check sign in on app launch
        // allow user to sign out with button
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
                
            }
            
            guard error == nil else {
                //show account creation
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            
            print("Você se cadastrou")
            
            strongSelf.emailField.isHidden = true
            strongSelf.passwordField.isHidden = true
            strongSelf.button.isHidden = true
            
            strongSelf.emailField.resignFirstResponder()
            strongSelf.passwordField.resignFirstResponder()
        })
        
    }
    
    //MARK: Create Account Function Authentication
    
    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController (title: "Criar uma conta",
                                       message: "Você gostaria de criar uma conta",
                                       preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continuar",
                                      style: .default,
                                      handler: {_ in
                                        
                                        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
                                            
                                            guard let strongSelf = self else {
                                                return
                                                
                                            }
                                            
                                            guard error == nil else {
                                                //show account creation
                                                print("Criação da conta falhou")
                                                return
                                            }
                                            
                                            print("Você se cadastrou")
                                            
                                            strongSelf.emailField.isHidden = true
                                            strongSelf.passwordField.isHidden = true
                                            strongSelf.button.isHidden = true
                                            
                                            strongSelf.emailField.resignFirstResponder()
                                            strongSelf.passwordField.resignFirstResponder()
                                            
                                        })
                                        
                                      }))
        alert.addAction(UIAlertAction(title: "Cancelar",
                                      style: .cancel,
                                      handler: {_ in
                                      }))
        
        present(alert, animated: true)
    }
    
    
    
}

