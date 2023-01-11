//
//  LogInViewController.swift
//  Navigation
//
//  Created by Olga Kislova on 08.01.2023.
//

import UIKit

class LogInViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        
        return imageView
    }()

    private let loginTextField = TextFieldView(isSecureTextEntry: false, placeholder: "Email or phone")
    private let passwordTextField = TextFieldView(isSecureTextEntry: true, placeholder: "Password")

    private let loginButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel.png"), for: .normal)
        button.clipsToBounds = true
        
        button.layer.cornerRadius = 10
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    private let fieldStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.backgroundColor = .systemGray6
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    private let dividerView: UIView = {
        let divider = UIView()
        
        divider.backgroundColor = .lightGray
        
        return divider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        addSubviews()
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addObservers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        removeObservers()
    }
    
    @objc
    func clickLoginButton() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: false)
    }
    
    private func addSubviews() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(fieldStackView)
        
        fieldStackView.addArrangedSubview(loginTextField)
        fieldStackView.addArrangedSubview(dividerView)
        fieldStackView.addArrangedSubview(passwordTextField)
        
        contentView.addSubview(loginButton)
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        loginButton.addTarget(self, action: #selector(clickLoginButton), for: .touchUpInside)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fieldStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            fieldStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            fieldStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            fieldStackView.heightAnchor.constraint(equalToConstant: 100),
            
            dividerView.heightAnchor.constraint(equalToConstant: 0.5),
            
            loginButton.topAnchor.constraint(equalTo: fieldStackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension LogInViewController: UITextFieldDelegate {
    private func addObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func removeObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        
        return true
    }
    
    @objc
    func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @objc
    private func keyboardWillShow(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardViewEndFrame.height - self.view.safeAreaInsets.bottom + 20, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc
    private func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}
