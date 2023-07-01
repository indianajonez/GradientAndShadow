//
//  ViewController.swift
//  GradientAndShadow
//
//  Created by Ekaterina Saveleva on 01.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Public properties
    
        private lazy var squareView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.shadowOpacity = 0.5
            view.layer.shadowOffset = CGSize(width: 3, height: 3)
            return view
        }()
    
    func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = squareView.bounds
        gradient.cornerRadius = 12
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemRed.cgColor]
        squareView.layer.addSublayer(gradient)
    }
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradient()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        view.addSubview(squareView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            squareView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            squareView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            squareView.heightAnchor.constraint(equalToConstant: 100),
            squareView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}

