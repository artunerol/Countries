//
//  DetailViewController.swift
//  Countries
//
//  Created by Artun Erol on 29.11.2021.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Computed Properties && Variables
    
    private lazy var countryImage: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .red
        
        return temp
    }()
    
    private lazy var countryCode: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Country Code: "
        temp.textAlignment = .left
        
        return temp
    }()
    
    private lazy var wikiDataButton: UIButton = {
        let temp = UIButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private var viewModel: DetailViewModel
    
    //MARK: - LifeCycle
    
    init(with viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Private Funcs
    
    private func setupViews() {
        view.addSubview(countryImage)
        view.addSubview(countryCode)
        view.addSubview(wikiDataButton)
        
        setupConstraintsForViews()
    }
    
    private func setupConstraintsForViews() {
        NSLayoutConstraint.activate([
            countryImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 10),
            countryImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 5),
            countryImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            countryCode.topAnchor.constraint(equalTo: countryImage.bottomAnchor,constant: 10),
            countryCode.leadingAnchor.constraint(equalTo: countryImage.leadingAnchor),
            
            wikiDataButton.topAnchor.constraint(equalTo: countryCode.bottomAnchor,constant: 5),
            wikiDataButton.leadingAnchor.constraint(equalTo: countryCode.leadingAnchor)
        ])
    }
    
}
