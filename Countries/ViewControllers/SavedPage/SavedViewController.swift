//
//  SavedViewController.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import UIKit

class SavedViewController: UIViewController {
    
    public static let shared = SavedViewController()

    public lazy var countriesTableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier) //Registering Cell
        
        temp.separatorStyle = .none // Removing lines out of tableView
        
        
        return temp
    }()
    
    public var countryName: String = "" {
        didSet {
            countriesTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraintsForViews()

        // Do any additional setup after loading the view.
    }
    
    private func setupViews() {
        view.addSubview(countriesTableView)
        countriesTableView.backgroundColor = .white
    }
    
    private func setupConstraintsForViews() {
        NSLayoutConstraint.activate([
            countriesTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            countriesTableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            countriesTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countriesTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

//MARK: - TableView Extension

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier, for: indexPath) as? CountriesTableViewCell else { return UITableViewCell() }
        cell.countryLabel.text = countryName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @objc func asd() {
        print("saveButtonSelected on vc")
    }
    
}
