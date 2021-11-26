//
//  HomePageTableViewCell.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    
    public static let identifier = "HomePageTableViewCell"
    private var isSaveButtonSelected = false
    
    //MARK: - Computed Properties
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 10
        temp.layer.borderWidth = 2
        temp.layer.borderColor = UIColor.black.cgColor
        temp.layer.masksToBounds = true
        
        return temp
    }()
    
    private lazy var saveButton: UIButton = {
        let temp = UIButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.setImage(UIImage(systemName: "star"), for: .normal)
        
        return temp
    }()
    
    //MARK: - Life Cycle
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setupViews()
        viewConfigurations()
        setupConstraintsForViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting Up Views with configurations and constraints
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(saveButton)
    }
    
    private func viewConfigurations() {
        addButtonAction()
    }
    
    private func setupConstraintsForViews() {
        NSLayoutConstraint.activate([
            
            //MARK: - ContainerView Constraints
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: contentView.frame.width/6), // Setting leadingAnchor for containverView
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -(contentView.frame.width/6)), //Setting trailing Anchor for containerView
            
            //MARK: - SaveButton Constraints
            
            saveButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            saveButton.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 5),
            saveButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
            
        ])
    }
    
    //MARK: - Save Button Action
    private func addButtonAction() {
        saveButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        //If Button is selected fill the image. Else unfill it.
        
        if !isSaveButtonSelected {
            saveButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            isSaveButtonSelected = true
        }
        else {
            saveButton.setImage(UIImage(systemName: "star"), for: .normal)
            isSaveButtonSelected = false
        }
    }
    
}
