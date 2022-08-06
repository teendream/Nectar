import UIKit

class WelcomeVC: UIViewController {
    let logoIcon = UIImageView(image: UIImage(named: "nectar-icon.pdf")!)
    let stackView = UIStackView()
    let welcomeLabel = UILabel()
    let storeLabel = UILabel()
    let getGroceries = UILabel()
    let getStartedBtn = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackground()
        style()
        layout()
    }

}

extension WelcomeVC{
    private func style(){
        //reset defaults
        stackView.translatesAutoresizingMaskIntoConstraints = false
        logoIcon.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        storeLabel.translatesAutoresizingMaskIntoConstraints = false
        getGroceries.translatesAutoresizingMaskIntoConstraints = false
        getStartedBtn.translatesAutoresizingMaskIntoConstraints = false
        
        //styling
        stackView.axis = .vertical
        welcomeLabel.text = "Welcome"
        storeLabel.text = "to our store"
        getGroceries.text = "Get your groceries in as fast as one hour"
        welcomeLabel.textAlignment = .center
        storeLabel.textAlignment = .center
        getGroceries.textAlignment = .center
        welcomeLabel.font = welcomeLabel.font.withSize(48)
        storeLabel.font = storeLabel.font.withSize(48)
        getGroceries.font = getGroceries.font.withSize(16)
        welcomeLabel.textColor = .white
        storeLabel.textColor = .white
        getGroceries.textColor = UIColor(named: "onBoardingLabelColor")
        logoIcon.contentMode = .scaleAspectFit
        getStartedBtn.setTitle("Get Started", for: [])
        getStartedBtn.tintColor = UIColor(named: "onBoardingColor")
        getStartedBtn.layer.cornerRadius = 19
        getStartedBtn.backgroundColor = UIColor(named: "onBoardingColor")
        getStartedBtn.setTitleColor(.white, for: .normal)
        getStartedBtn.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
    }
    
    
    private func layout(){
        view.addSubview(stackView)
        stackView.addArrangedSubview(logoIcon)
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(storeLabel)
        stackView.addArrangedSubview(getGroceries)
        stackView.addArrangedSubview(getStartedBtn)
        stackView.spacing = 35
        stackView.alignment = .center
        stackView.setCustomSpacing(19, after: storeLabel)
        stackView.setCustomSpacing(0, after: welcomeLabel)
        
        NSLayoutConstraint.activate([
            
            //StackViewlayout
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            
            //LogoLayout

            
            //LabelsLayout
            
            
            //ButtonLayout
            getStartedBtn.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            getStartedBtn.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            getStartedBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func assignBackground(){
        let background = UIImage(named:"loginViewImage")
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    @objc func getStarted() {
        navigationController?.pushViewController(LoginMethodVC(), animated: true)
    }
}

 

