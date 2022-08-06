import Foundation
import UIKit

class AuthorizationVC:UIViewController{
    let titleLabel = UILabel()
    let mainStackView = UIStackView()
    let mobilePhoneLabel = UILabel()
    let mobilePhoneTextField = UITextField()
    let nextButton = UIButton()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        style()
        layout()
    }
}

extension AuthorizationVC{
    private func style(){
        
        //Reset defaults
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mobilePhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        mobilePhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Styling
        titleLabel.text = "Enter your mobile phone"
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        mainStackView.axis = .vertical
        mainStackView.spacing = 10
        mobilePhoneLabel.text = "Mobile number"
        mobilePhoneLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        mobilePhoneLabel.textColor = UIColor(named: "mobileNumberColor")
        mobilePhoneTextField.placeholder = "+998"
        mobilePhoneTextField.font = UIFont.systemFont(ofSize: 20)
        mobilePhoneTextField.keyboardType = UIKeyboardType.numberPad
        nextButton.backgroundColor = UIColor(named: "onBoardingColor")
        nextButton.layer.cornerRadius = 35
        nextButton.setImage(UIImage(named: "arrow-icon"), for: .normal)
        nextButton.contentMode = .scaleAspectFill
        nextButton.addTarget(self, action: #selector(confirmation) , for: .touchUpInside)
    }
    
    private func layout(){
        
        //Subviews
        view.addSubview(titleLabel)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(mobilePhoneLabel)
        mainStackView.addArrangedSubview(mobilePhoneTextField)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            
            //Title label constraints
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 91),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            //Main StackView constraints
            mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25),
            
            //Next button constraints
            nextButton.heightAnchor.constraint(equalToConstant: 67),
            nextButton.widthAnchor.constraint(equalToConstant: 67),
            view.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor, constant: 25),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
            
        ])
    }
    
    @objc func confirmation(){
        navigationController?.pushViewController(ConfirmationVC(), animated: true)
    }
}
