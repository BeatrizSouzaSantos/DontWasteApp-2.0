//
//  homeViewController.swift
//  DontWasteApp-2.0
//
//  Created by user on 18/08/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- Imagens
            
        let background = UIImageView (frame: UIScreen.main.bounds)
        background.image = UIImage (named: "fundo")
        background.contentMode = .scaleToFill
        background.alpha = 0.65
        background.clipsToBounds = true
            
        let logo = UIImageView (frame: UIScreen.main.bounds)
        logo.image = UIImage (named: "Logo1")
        logo.contentMode = .center
        logo.clipsToBounds = true
        logo.center = CGPoint(x: 180, y: 170)
        self.view.insertSubview(background, at: 0)
        self.view.insertSubview(logo, at: 1)
        
        //MARK:- labels

        let titulolabel = UILabel (frame: UIScreen.main.bounds)
        titulolabel.font = UIFont(name: "OpenSans-Bold", size: 40)
        titulolabel.textColor = .black
        titulolabel.center = CGPoint(x: 180, y: 284)
        titulolabel.textAlignment = .center
        titulolabel.text = "Don't"
        
        let titulolabel2 = UILabel (frame: UIScreen.main.bounds)
        titulolabel2.font = UIFont(name: "OpenSans-Bold", size: 40)
        titulolabel2.textColor = .black
        titulolabel2.center = CGPoint(x: 180, y: 330)
        titulolabel2.textAlignment = .center
        titulolabel2.text = "Waste"
        
        let titulolabel3 = UILabel (frame: UIScreen.main.bounds)
        titulolabel3.font = UIFont(name: "OpenSans-Bold", size: 25)
        titulolabel3.textColor = .black
        titulolabel3.center = CGPoint(x: 180, y: 370)
        titulolabel3.textAlignment = .center
        titulolabel3.text = "organize"
        
        let subtitulolabel1 = UILabel (frame: UIScreen.main.bounds)
        subtitulolabel1.font = UIFont(name: "OpenSans-Bold", size: 40)
        subtitulolabel1.textColor = UIColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        subtitulolabel1.center = CGPoint(x: 180, y: 450)
        subtitulolabel1.textAlignment = .center
        subtitulolabel1.text = "Sua despensa"
        
        let subtitulolabel2 = UILabel (frame: UIScreen.main.bounds)
        subtitulolabel2.font = UIFont(name: "OpenSans-Bold", size: 40)
        subtitulolabel2.textColor = UIColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        subtitulolabel2.center = CGPoint(x: 180, y: 500)
        subtitulolabel2.textAlignment = .center
        subtitulolabel2.text = "inteligente"
        
        //MARK:- Buttons

        let primeiroAcessobutton = UIButton(frame: CGRect(x: 20, y: 20, width: 160, height: 30))
        primeiroAcessobutton.setTitle("Primeiro Acesso", for: .normal)
        primeiroAcessobutton.titleLabel?.font = UIFont(name: "Arial Bold", size: 12)
        primeiroAcessobutton.backgroundColor = .gray
        primeiroAcessobutton.alpha = 0.65
        primeiroAcessobutton.layer.borderColor = UIColor.black.cgColor
        primeiroAcessobutton.setTitleColor(UIColor.black, for: .normal)
        primeiroAcessobutton.addTarget(self, action: #selector(didTapAcesso),for: .touchUpInside)
        primeiroAcessobutton.center = CGPoint(x: 100, y: 570)
        
        let loginbutton = UIButton(frame: CGRect(x: 20, y: 20, width: 160, height: 30))
        loginbutton.setTitle("Login", for: .normal)
        loginbutton.titleLabel?.font = UIFont(name: "Arial Bold", size: 12)
        loginbutton.backgroundColor = UIColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        loginbutton.layer.borderColor = UIColor.black.cgColor
        loginbutton.setTitleColor(UIColor.black, for: .normal)
        loginbutton.addTarget(self, action: Selector(("btnclicked:")),for: .touchUpInside)
        loginbutton.center = CGPoint(x: 270, y: 570)
        
        //exibindo os elementos na tela
        self.view.insertSubview(background, at: 0)
        self.view.insertSubview(logo, at: 1)
        self.view.addSubview(titulolabel)
        self.view.addSubview(titulolabel2)
        self.view.addSubview(titulolabel3)
        self.view.addSubview(subtitulolabel1)
        self.view.addSubview(subtitulolabel2)
        self.view.addSubview(primeiroAcessobutton)
        self.view.addSubview(loginbutton)


    }
    
   @objc private func didTapAcesso() {
       
        let loginVC = ViewController()
        
        self.present(loginVC, animated: true, completion: nil)
        
        //ViewController.presentViewController //mudar o nome para a ViewControllerself.presentViewController(vc, animated: true, completion: nil)
    }
    
}
