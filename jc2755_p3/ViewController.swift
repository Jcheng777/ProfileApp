//
//  ViewController.swift
//  jc2755_p3
//
//  Created by Jesse Cheng on 10/9/22.
//

import UIKit

class ViewController: UIViewController, changeInfoDelegate, changePicDelegate {
    func changeProfilePic(img: UIImage) {
        profilePictureBtn.setImage(img, for: .normal)
    }

    func changeAboutInfo(str: String) {
        descriptionTextView.text = str
    }
    
    func changeYearLevel(str: String) {
        if str == "Freshman" {
            circle1.backgroundColor = UIColor(red: 0.471, green: 0.22, blue: 1, alpha: 1)
            circle2.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle3.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle4.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle5.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        }
        
        if str == "Sophomore" {
            circle1.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle2.backgroundColor = UIColor(red: 0.471, green: 0.22, blue: 1, alpha: 1)
            circle3.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle4.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle5.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        }
        
        if str == "Junior" {
            circle1.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle2.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle3.backgroundColor = UIColor(red: 0.471, green: 0.22, blue: 1, alpha: 1)
            circle4.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle5.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        }
        
        if str == "Senior" {
            circle1.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle2.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle3.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle4.backgroundColor = UIColor(red: 0.471, green: 0.22, blue: 1, alpha: 1)
            circle5.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        }
        
        if str == "Graduate" {
            circle1.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle2.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle3.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle4.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            circle5.backgroundColor = UIColor(red: 0.471, green: 0.22, blue: 1, alpha: 1)
        }
        
        
    }
    
    func changePortfolio(str: String) {
        portfolioLink.text = str
    }
    
    func changeName(str: String) {
        name.text = str
    }
    
    // Set Variables
    var avatar = UIImageView()
    var profilePicBorder = UIView()
    var profilePictureBtn = UIButton()
    var editProfileBtn = UIButton()
    var name = UILabel()
    var portfolioLink = UILabel()
    var yearLabel = UILabel()
    var circle1 = UIView()
    var circle2 = UIView()
    var circle3 = UIView()
    var circle4 = UIView()
    var circle5 = UIView()
    var aboutLabel = UILabel()
    var descriptionTextView = UITextView()
    
    
    
    override func viewDidLoad() {
        
        // Navigation Bar Button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back")
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "My Profile"

        // Set Properties and View
        
        profilePicBorder.layer.cornerRadius = 100
        profilePicBorder.layer.borderWidth = 5
        profilePicBorder.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        profilePicBorder.clipsToBounds = true
        profilePicBorder.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profilePicBorder)
        
        profilePictureBtn.imageView?.contentMode = .scaleAspectFit
        profilePictureBtn.setImage(UIImage(named: "avatar6"), for: .normal)
        profilePictureBtn.addTarget(self, action: #selector(presentView), for: .touchUpInside)
        profilePictureBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profilePictureBtn)
        
        editProfileBtn.setTitle("EDIT MY PROFILE >", for: .normal)
        editProfileBtn.setTitleColor(UIColor(red: 0.471, green: 0.22, blue: 1, alpha: 1), for: .normal)
        editProfileBtn.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        editProfileBtn.addTarget(self, action: #selector(pushView), for: .touchUpInside)
        editProfileBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileBtn)
        
        name.text = "Jamie Gonzalez"
        name.font = .systemFont(ofSize: 24)
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        
        portfolioLink.text = "https://jamiegonzalez.me"
        portfolioLink.font = .systemFont(ofSize: 12)
        portfolioLink.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        portfolioLink.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(portfolioLink)
        
        yearLabel.text = "YEAR"
        yearLabel.font = .systemFont(ofSize: 12, weight: .bold)
        yearLabel.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearLabel)
        
//      circle1.frame = CGRect(x: 25, y: 300, width: 50, height: 50)
//      circle1.layer.cornerRadius = circle1.layer.bounds.width/2
        circle1.layer.cornerRadius = 12
        circle1.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        circle1.clipsToBounds = true
        circle1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circle1)
        
        circle2.layer.cornerRadius = 12
        circle2.backgroundColor = UIColor(red: 0.471, green: 0.22, blue: 1, alpha: 1)
        circle2.clipsToBounds = true
        circle2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circle2)
        
        circle3.layer.cornerRadius = 12
        circle3.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        circle3.clipsToBounds = true
        circle3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circle3)
        
        circle4.layer.cornerRadius = 12
        circle4.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        circle4.clipsToBounds = true
        circle4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circle4)
        
        circle5.layer.cornerRadius = 12
        circle5.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        circle5.clipsToBounds = true
        circle5.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circle5)
        
        aboutLabel.text = "ABOUT"
        aboutLabel.font = .systemFont(ofSize: 12, weight: .bold)
        aboutLabel.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutLabel)
        
        descriptionTextView.text = "Hi I’m Jamie and I enjoy skiing, sledding, and squirrel watching."
        descriptionTextView.font = .systemFont(ofSize: 12)
        descriptionTextView.textColor = UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        descriptionTextView.isEditable = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionTextView)
        
        setUpConstraints()
        
        //Set Constraints
        
        func setUpConstraints() {
            NSLayoutConstraint.activate([
                profilePictureBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
                profilePictureBtn.widthAnchor.constraint(equalToConstant: 180),
                profilePictureBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                profilePicBorder.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
                profilePicBorder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                profilePicBorder.widthAnchor.constraint(equalToConstant: 200),
                profilePicBorder.heightAnchor.constraint(equalToConstant: 200),
            ])
            
            NSLayoutConstraint.activate([
//                editProfileBtn.widthAnchor.constraint(equalToConstant: 146),
//                editProfileBtn.heightAnchor.constraint(equalToConstant: 100),
                editProfileBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                editProfileBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
            
            NSLayoutConstraint.activate([
                name.topAnchor.constraint(equalTo: profilePictureBtn.bottomAnchor, constant: -10),
                name.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                portfolioLink.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
                portfolioLink.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                yearLabel.topAnchor.constraint(equalTo: portfolioLink.bottomAnchor, constant: 35),
                yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70)
            ])
            
            NSLayoutConstraint.activate([
                circle1.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 20),
                circle1.leadingAnchor.constraint(equalTo: yearLabel.leadingAnchor, constant: 17),
                circle1.widthAnchor.constraint(equalToConstant: 24),
                circle1.heightAnchor.constraint(equalToConstant: 24),
            ])
            
            NSLayoutConstraint.activate([
                circle2.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 20),
                circle2.leadingAnchor.constraint(equalTo: circle1.trailingAnchor, constant: 25),
                circle2.widthAnchor.constraint(equalToConstant: 24),
                circle2.heightAnchor.constraint(equalToConstant: 24),
            ])
            
            NSLayoutConstraint.activate([
                circle3.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 20),
                circle3.leadingAnchor.constraint(equalTo: circle2.trailingAnchor, constant: 25),
                circle3.widthAnchor.constraint(equalToConstant: 24),
                circle3.heightAnchor.constraint(equalToConstant: 24),
            ])
            
            NSLayoutConstraint.activate([
                circle4.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 20),
                circle4.leadingAnchor.constraint(equalTo: circle3.trailingAnchor, constant: 25),
                circle4.widthAnchor.constraint(equalToConstant: 24),
                circle4.heightAnchor.constraint(equalToConstant: 24),
            ])
            
            NSLayoutConstraint.activate([
                circle5.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 20),
                circle5.leadingAnchor.constraint(equalTo: circle4.trailingAnchor, constant: 25),
                circle5.widthAnchor.constraint(equalToConstant: 24),
                circle5.heightAnchor.constraint(equalToConstant: 24),
               
            ])
            
            NSLayoutConstraint.activate([
                aboutLabel.topAnchor.constraint(equalTo: circle1.bottomAnchor, constant: 40),
                aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70)
            ])
            
            NSLayoutConstraint.activate([
                descriptionTextView.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 5),
                descriptionTextView.bottomAnchor.constraint(equalTo: editProfileBtn.topAnchor, constant: -20),
                descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
                descriptionTextView.trailingAnchor.constraint(equalTo: circle5.trailingAnchor, constant: 20)
            ])
            
        }
    }
    
    @objc func pushView() {
        let pushViewController = PushViewController(inputDelegate: self)
        pushViewController.nameTextField.text = name.text
        pushViewController.portfolioTextField.text = portfolioLink.text
        pushViewController.aboutTextView.text = descriptionTextView.text
        navigationController?.pushViewController(pushViewController, animated: true)
    }
    
    @objc func presentView() {
        present(PresentViewController(inputDelegate: self), animated: true)
    }
    

}

