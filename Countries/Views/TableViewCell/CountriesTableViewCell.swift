//
//  HomePageTableViewCell.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    
    public static let identifier = "HomePageTableViewCell"
    
    private var saveButtonDelegate: SaveButtonProtocol?
    private var countryData: CountryData!
    
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
    
    private lazy var saveButton: SaveButton = {
        let temp = SaveButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        return temp
    }()
    
    private lazy var countryLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        return temp
    }()
    
    //MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        viewConfigurations()
        
        saveButtonDelegate = SavedViewController() //Delegation to SavedViewController
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting Up Views with configurations and constraints
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(saveButton)
        containerView.addSubview(countryLabel)
        
        setupConstraintsForViews()
    }
    
    private func viewConfigurations() {
        addButtonAction()
    }

    private func setupConstraintsForViews() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: contentView.frame.width/6), // Setting leadingAnchor for containverView
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -(contentView.frame.width/6)), //Setting trailing Anchor for containerView
            
            saveButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            saveButton.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 5),
            saveButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            
            countryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            countryLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            
        ])
    }
    
    //MARK: - Public Funcs
    
    public func configureCell(with data: CountryData) {
//        
//        if UserDefaults.standard.bool(forKey: data.name) {
//            saveButton.saveButtonSelected(for: countryData.name)
//        }
        
        self.countryData = data //Getting the api data of the cell
        countryLabel.text = data.name
    }
    
    //MARK: - Save Button Action
    public func addButtonAction() {
        saveButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        //If Button is selected fill the image. Else unfill it.
        let isSaveButtonSelected = UserDefaults.standard.bool(forKey: countryData.name)
        
        if !isSaveButtonSelected {
            saveButton.saveButtonSelected(for: countryData.name)
            saveButtonDelegate?.saveButtonClicked(with: countryData) //Delegation for button clicked
            
        }
        
        if isSaveButtonSelected {
            saveButton.saveButtonUnselected(for: countryData.name)
            saveButtonDelegate?.unsaveButtonClicked(with: countryData)
            
        }
    }
    
}

