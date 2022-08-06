import Foundation
import UIKit

class LoginMethodVC:UIViewController{
    let topImage = UIImageView(image: UIImage(named: "loginPageTop"))
    let title1 = UILabel()
    let bodyStackview = UIStackView()
    let numberField = UITextField()
    let loginViaLabel = UILabel()
    let googleFacebook = UIStackView()
    let googleButton = UIButton()
    let facebookButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        view.backgroundColor = .systemBackground
    }
}

extension LoginMethodVC{
    private func style(){
        //reset defaults
        topImage.translatesAutoresizingMaskIntoConstraints = false
        title1.translatesAutoresizingMaskIntoConstraints = false
        bodyStackview.translatesAutoresizingMaskIntoConstraints = false
        numberField.translatesAutoresizingMaskIntoConstraints = false
        loginViaLabel.translatesAutoresizingMaskIntoConstraints = false
        googleFacebook.translatesAutoresizingMaskIntoConstraints = false
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        
        //styling
        topImage.contentMode = .scaleToFill
        topImage.clipsToBounds = false
        title1.textColor = UIColor(named: "loginMethodLabelText")
        title1.numberOfLines = 2
        title1.text = "Get your groceries \nwith nectar"
        title1.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        numberField.text = "+998"
        numberField.keyboardType = UIKeyboardType.numberPad
        numberField.textColor = .black
        bodyStackview.axis = .vertical
        bodyStackview.distribution = .fill
        bodyStackview.spacing = 30
        loginViaLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        loginViaLabel.text = "Or connect with social media"
        loginViaLabel.textColor = UIColor(named: "loginMethodLabel")
        loginViaLabel.textAlignment = .center
        googleFacebook.axis = .vertical
        googleFacebook.spacing = 20
        googleButton.setTitle("Continue with Google", for: [])
        googleButton.setTitleColor(.white, for: .normal)
        googleButton.backgroundColor = UIColor(named: "GoogleButton")
        googleButton.layer.cornerRadius = 19
        googleButton.addTarget(self, action: #selector(authorization), for: .touchUpInside)
        facebookButton.setTitle("Continue with Facebook", for: [])
        facebookButton.setTitleColor(.white, for: .normal)
        facebookButton.backgroundColor = UIColor(named: "FacebookButton")
        facebookButton.layer.cornerRadius = 19
        
        
    }
    
    private func layout(){
        //subviews
        view.addSubview(topImage)
        view.addSubview(bodyStackview)
        bodyStackview.addArrangedSubview(title1)
        bodyStackview.addArrangedSubview(numberField)
        view.addSubview(loginViaLabel)
        view.addSubview(googleFacebook)
        googleFacebook.addArrangedSubview(googleButton)
        googleFacebook.addArrangedSubview(facebookButton)
        
        
        //constraints
        NSLayoutConstraint.activate([
            //Top image contraints
            topImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            //Main StackView contraints
            bodyStackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bodyStackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            view.trailingAnchor.constraint(equalTo: bodyStackview.trailingAnchor, constant: 25),
            
            //StackView textField contraints
            loginViaLabel.topAnchor.constraint(equalTo: bodyStackview.bottomAnchor, constant: 40),
            loginViaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Stackview with buttons contraints
            googleFacebook.topAnchor.constraint(equalTo: loginViaLabel.bottomAnchor, constant: 37),
            googleFacebook.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            view.trailingAnchor.constraint(equalTo: googleFacebook.trailingAnchor, constant: 25),
            view.bottomAnchor.constraint(equalTo: googleFacebook.bottomAnchor, constant: 90),
            
            //Google button constraints
            googleButton.topAnchor.constraint(equalTo: googleFacebook.topAnchor, constant: 0),
            googleButton.leadingAnchor.constraint(equalTo: googleFacebook.leadingAnchor, constant: 0),
            googleButton.trailingAnchor.constraint(equalTo: googleFacebook.trailingAnchor, constant: 0),
            googleButton.heightAnchor.constraint(equalToConstant: 67),
            
            //Facebook button constraints
            facebookButton.leadingAnchor.constraint(equalTo: googleFacebook.leadingAnchor, constant: 0),
            facebookButton.trailingAnchor.constraint(equalTo: googleFacebook.trailingAnchor, constant: 0),
            facebookButton.bottomAnchor.constraint(equalTo: googleFacebook.bottomAnchor, constant: 0),
            facebookButton.heightAnchor.constraint(equalToConstant: 67),
        ])
    }
    
    @objc func authorization(){
        navigationController?.pushViewController(AuthorizationVC(), animated: true)
    }
}
