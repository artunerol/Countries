//
//  HomePageTableViewCell.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    
    public static let identifier = "HomePageTableViewCell"
    
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
    
    //MARK: - Life Cycle
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setupViews()
        setupConstraintsForViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Funcs
    
    private func setupViews() {
        contentView.addSubview(containerView)
    }
    
    private func setupConstraintsForViews() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: contentView.frame.width/6),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -(contentView.frame.width/6))
            
        ])
    }
    
}
