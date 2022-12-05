//
//  PushViewController.swift
//  jc2755_p3
//
//  Created by Jesse Cheng on 10/9/22.
//

import UIKit

class PushViewController: UIViewController, UITextViewDelegate {
    
    class TextFieldWithPadding: UITextField {
        var textPadding = UIEdgeInsets(
            top: 10,
            left: 20,
            bottom: 10,
            right: 20
        )
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
                let rect = super.textRect(forBounds: bounds)
                return rect.inset(by: textPadding)
            }

            override func editingRect(forBounds bounds: CGRect) -> CGRect {
                let rect = super.editingRect(forBounds: bounds)
                return rect.inset(by: textPadding)
            }
    }
    
    // Bool Variables
    var didNameChange : Bool = false
    var didPortfolioChange : Bool = false
    
    // Set Up Variables
    var nameLabel = UILabel()
    var nameTextField = TextFieldWithPadding()
    var portfolioLabel = UILabel()
    var portfolioTextField = TextFieldWithPadding()
    var yearLabel = UILabel()
    var yearUIView = UITextView()
    var yearSlider = UISlider()
    var yearLevelLabel = UILabel()
    var aboutLabel = UILabel()
    var aboutTextView = UITextView()
    
    weak var delegate: (changeInfoDelegate)?
    
    init(inputDelegate: changeInfoDelegate) {
        delegate = inputDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation Buttons
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(changeInfoAndPop))

        view.backgroundColor = .white
        title = "Edit My Profile"
        
        // Set Up Properties and Add View
        nameLabel.text = "Name"
        nameLabel.font = .systemFont(ofSize: 12, weight: .bold)
        nameLabel.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
//        nameTextField.placeholder = "Enter Name"
//        nameTextField.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        nameTextField.font = .systemFont(ofSize: 12)
        nameTextField.layer.cornerRadius = 20
        nameTextField.layer.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1).cgColor
        nameTextField.layer.shadowOpacity = 1
        nameTextField.layer.shadowOffset = CGSize(width: 0, height: 3)
        nameTextField.layer.shadowColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.addTarget(self, action: #selector(didNameFieldChange), for: .editingChanged)
        view.addSubview(nameTextField)
        
        portfolioLabel.text = "PORTFOLIO"
        portfolioLabel.font = .systemFont(ofSize: 12, weight: .bold)
        portfolioLabel.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        portfolioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(portfolioLabel)
        
//        portfolioTextField.placeholder = "Enter link"
//        portfolioTextField.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        portfolioTextField.font = .systemFont(ofSize: 12)
        portfolioTextField.layer.cornerRadius = 20
        portfolioTextField.layer.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1).cgColor
        portfolioTextField.layer.shadowOpacity = 1
        portfolioTextField.layer.shadowOffset = CGSize(width: 0, height: 3)
        portfolioTextField.layer.shadowColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        portfolioTextField.translatesAutoresizingMaskIntoConstraints = false
        portfolioTextField.addTarget(self, action: #selector(didPortfolioFieldChange), for: .editingChanged)
        view.addSubview(portfolioTextField)
        
        yearLabel.text = "YEAR"
        yearLabel.font = .systemFont(ofSize: 12, weight: .bold)
        yearLabel.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearLabel)
        
        yearUIView.layer.cornerRadius = 20
        yearUIView.isEditable = false
        yearUIView.layer.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1).cgColor
        yearUIView.layer.masksToBounds = false
        yearUIView.layer.shadowOpacity = 1
        yearUIView.layer.shadowOffset = CGSize(width: 0, height: 3)
        yearUIView.layer.shadowColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        yearUIView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearUIView)
        
        yearSlider.value = 1
        yearSlider.minimumValue = 0
        yearSlider.maximumValue = 4
        yearSlider.maximumTrackTintColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        yearSlider.isContinuous = false
        yearSlider.addTarget(self, action: #selector(changeYearLevel), for: .valueChanged)
        yearSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearSlider)
        
        // How do i save the slider's original position
        yearLevelLabel.text = "Sophomore"
        yearLevelLabel.font = .systemFont(ofSize: 12)
        yearLevelLabel.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        yearLevelLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearLevelLabel)
        
        aboutLabel.text = "ABOUT"
        aboutLabel.font = .systemFont(ofSize: 12, weight: .bold)
        aboutLabel.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutLabel)
        
//        aboutTextView.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        aboutTextView.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        aboutTextView.layer.masksToBounds = false
        aboutTextView.font = .systemFont(ofSize: 12)
        aboutTextView.layer.cornerRadius = 20
        aboutTextView.layer.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1).cgColor
        aboutTextView.layer.shadowOpacity = 1
        aboutTextView.layer.shadowOffset = CGSize(width: 0, height: 3)
        aboutTextView.layer.shadowColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        aboutTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutTextView)
        
        // Set Up Constraints
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 301),
            nameTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            portfolioLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 35),
            portfolioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64)
        ])
        
        NSLayoutConstraint.activate([
            portfolioTextField.topAnchor.constraint(equalTo: portfolioLabel.bottomAnchor, constant: 10),
            portfolioTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            portfolioTextField.widthAnchor.constraint(equalToConstant: 301),
            portfolioTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: portfolioTextField.bottomAnchor, constant: 35),
            yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64)
        ])
        
        NSLayoutConstraint.activate([
            yearUIView.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 10),
            yearUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yearUIView.widthAnchor.constraint(equalToConstant: 301),
            yearUIView.heightAnchor.constraint(equalToConstant: 96)
        ])
        
        NSLayoutConstraint.activate([
            yearSlider.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 22),
            yearSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yearSlider.widthAnchor.constraint(equalToConstant: 240)
        ])
        
        NSLayoutConstraint.activate([
            yearLevelLabel.topAnchor.constraint(equalTo: yearSlider.bottomAnchor, constant: 15),
            yearLevelLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: yearUIView.bottomAnchor, constant: 35),
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64)
        ])
        
        NSLayoutConstraint.activate([
            aboutTextView.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 10),
            aboutTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutTextView.widthAnchor.constraint(equalToConstant: 301),
            aboutTextView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    @objc
    func didNameFieldChange() {
        didNameChange = !didNameChange
    }
    
    @objc
    func didPortfolioFieldChange() {
        didPortfolioChange = !didPortfolioChange
    }
    
    @objc
    func changeInfoAndPop() {
        
        // Change name, portfolio link, and year level
            if let unwrappedName = nameTextField.text {
                if let unwrappedPortfolio = portfolioTextField.text {
                    if (unwrappedName != "" && unwrappedPortfolio != "") {
                        delegate?.changeName(str: unwrappedName)
                        delegate?.changePortfolio(str: unwrappedPortfolio)
                        delegate?.changeAboutInfo(str: aboutTextView.text)
                    }
                    else {
                        let dueDateAlert = UIAlertController()
                        dueDateAlert.title = "Alert"
                        dueDateAlert.message = "Please fill out name and link."
                        dueDateAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                        }))
                        self.present(dueDateAlert, animated: true, completion: nil)
                    }
                   
                }
        }
            
        // Pop Stack
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func changeYearLevel() {
        if yearSlider.value >= 0 && yearSlider.value < 1{
            print(yearSlider.value)
            yearLevelLabel.text = "Freshman"
        }
        else if yearSlider.value >= 1 && yearSlider.value < 2 {
            print(yearSlider.value)
            yearLevelLabel.text = "Sophomore"
        }
        else if yearSlider.value >= 2 && yearSlider.value < 3 {
            print(yearSlider.value)
            yearLevelLabel.text = "Junior"
        }
        else if yearSlider.value >= 3 && yearSlider.value < 4 {
            print(yearSlider.value)
            yearLevelLabel.text = "Senior"
        }
        else {
            print(yearSlider.value)
            yearLevelLabel.text = "Graduate"
        }
    }
    
}


protocol changeInfoDelegate: UIViewController {
    func changeName(str: String)
    
    func changePortfolio(str: String)
    
    func changeYearLevel(str: String)
    
    func changeAboutInfo(str: String)
}
