//
//  PresentViewController.swift
//  jc2755_p3
//
//  Created by Jesse Cheng on 10/9/22.
//

import UIKit

class PresentViewController: UIViewController {

    
    // Set Variables
    var grayBackground = UIView()
    var profileBorder = UIView()
    var profilePic = UIImageView()
    var titleLabel = UILabel()
    var exitButton = UIButton()
    var saveButton = UIButton()
    var avatar1 = UIButton()
    var avatar2 = UIButton()
    var avatar3 = UIButton()
    var avatar4 = UIButton()
    var avatar5 = UIButton()
    var avatar6 = UIButton()
    
    weak var delegate: (changePicDelegate)?
    
    init(inputDelegate: changePicDelegate) {
        delegate = inputDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Set Properties and Add View
        grayBackground.layer.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1).cgColor
        grayBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(grayBackground)
        
        titleLabel.text = "Change My Picture"
        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        exitButton.imageView?.contentMode = .scaleAspectFit
        exitButton.setImage(UIImage(named: "cancel"), for: .normal)
        exitButton.addTarget(self, action: #selector(exitScreen), for: .touchUpInside)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        
        profileBorder.layer.cornerRadius = 100
        profileBorder.layer.borderWidth = 5
        profileBorder.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
        profileBorder.clipsToBounds = true
        profileBorder.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileBorder)
        
        profilePic.image = UIImage(named: "avatar6")
        profilePic.contentMode = .scaleAspectFit
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profilePic)
        
        avatar1.imageView?.contentMode = .scaleAspectFit
        avatar1.setImage(UIImage(named: "avatar1"), for: .normal)
        avatar1.addTarget(self, action: #selector(changeToAvatar1), for: .touchUpInside)
        avatar1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatar1)
        
        avatar2.imageView?.contentMode = .scaleAspectFit
        avatar2.setImage(UIImage(named: "avatar2"), for: .normal)
        avatar2.addTarget(self, action: #selector(changeToAvatar2), for: .touchUpInside)
        avatar2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatar2)
        
        avatar3.imageView?.contentMode = .scaleAspectFit
        avatar3.setImage(UIImage(named: "avatar3"), for: .normal)
        avatar3.addTarget(self, action: #selector(changeToAvatar3), for: .touchUpInside)
        avatar3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatar3)
        
        avatar4.imageView?.contentMode = .scaleAspectFit
        avatar4.setImage(UIImage(named: "avatar4"), for: .normal)
        avatar4.addTarget(self, action: #selector(changeToAvatar4), for: .touchUpInside)
        avatar4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatar4)
        
        avatar5.imageView?.contentMode = .scaleAspectFit
        avatar5.setImage(UIImage(named: "avatar5"), for: .normal)
        avatar5.addTarget(self, action: #selector(changeToAvatar5), for: .touchUpInside)
        avatar5.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatar5)
        
        avatar6.imageView?.contentMode = .scaleAspectFit
        avatar6.setImage(UIImage(named: "avatar6.1"), for: .normal)
        avatar6.addTarget(self, action: #selector(changeToAvatar6), for: .touchUpInside)
        avatar6.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatar6)
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor(red: 0.471, green: 0.22, blue: 1, alpha: 1), for: .normal)
        saveButton.titleLabel?.font = .systemFont(ofSize: 15)
        saveButton.addTarget(self, action: #selector(saveInfoAndDismiss), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)

        // Set Up Constraints
        setUpConstraints()
        

    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            grayBackground.widthAnchor.constraint(equalTo: view.widthAnchor),
            grayBackground.heightAnchor.constraint(equalToConstant: 330),
            grayBackground.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8),
            exitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            profilePic.topAnchor.constraint(equalTo: view.topAnchor, constant: 67),
            profilePic.widthAnchor.constraint(equalToConstant: 180),
            profilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileBorder.topAnchor.constraint(equalTo: view.topAnchor, constant: 94),
            profileBorder.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileBorder.widthAnchor.constraint(equalToConstant: 200),
            profileBorder.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        NSLayoutConstraint.activate([
            avatar1.topAnchor.constraint(equalTo: grayBackground.bottomAnchor, constant: 27),
            avatar1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80)
        ])
        
        NSLayoutConstraint.activate([
            avatar2.topAnchor.constraint(equalTo: grayBackground.bottomAnchor, constant: 27),
            avatar2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80)
        ])
        
        NSLayoutConstraint.activate([
            avatar3.topAnchor.constraint(equalTo: avatar1.bottomAnchor, constant: 20),
            avatar3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80)
        ])
        
        NSLayoutConstraint.activate([
            avatar4.topAnchor.constraint(equalTo: avatar2.bottomAnchor, constant: 20),
            avatar4.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80)
        ])
        
        NSLayoutConstraint.activate([
            avatar5.topAnchor.constraint(equalTo: avatar3.bottomAnchor, constant: 20),
            avatar5.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80)
        ])
        
        NSLayoutConstraint.activate([
            avatar6.topAnchor.constraint(equalTo: avatar4.bottomAnchor, constant: 20),
            avatar6.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: avatar5.bottomAnchor, constant: 17),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func exitScreen() {
        dismiss(animated: true)
    }
    
    @objc func changeToAvatar1() {
        profilePic.image = UIImage(named: "avatar1-enlarged")
    }
    
    @objc func changeToAvatar2() {
        profilePic.image = UIImage(named: "avatar2-enlarged")
    }
    
    @objc func changeToAvatar3() {
        profilePic.image = UIImage(named: "avatar3-enlarged")
    }
    
    @objc func changeToAvatar4() {
        profilePic.image = UIImage(named: "avatar4-enlarged")
    }
    
    @objc func changeToAvatar5() {
        profilePic.image = UIImage(named: "avatar5-enlarged")
    }
    
    @objc func changeToAvatar6() {
        profilePic.image = UIImage(named: "avatar6")
    }
    
    @objc func saveInfoAndDismiss() {
        if let unwrappedImage = profilePic.image {
            delegate?.changeProfilePic(img: unwrappedImage)
        }
        
        dismiss(animated: true)
        
    }
    
}

protocol changePicDelegate : UIViewController {
    func changeProfilePic(img: UIImage)
}
