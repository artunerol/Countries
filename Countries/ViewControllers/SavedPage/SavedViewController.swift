//
//  SavedViewController.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import UIKit

class SavedViewController: UIViewController {

    public lazy var countriesTableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier) //Registering Cell
        
        temp.separatorStyle = .none // Removing lines out of tableView
        
        
        return temp
    }()
    
    private static var countryDataArray : [CountryData] = []
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraintsForViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        countriesTableView.reloadData()
    }
    
    //MARK: - View Configurations
    
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
        return SavedViewController.countryDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier, for: indexPath) as! CountriesTableViewCell
        cell.configureCell(with: SavedViewController.countryDataArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

//MARK: -

extension SavedViewController: SaveButtonProtocol {
    
    func saveButtonClicked(with data: CountryData) {
            SavedViewController.countryDataArray.append(data)
            print("countryData in savevc is \(SavedViewController.countryDataArray)")
            DispatchQueue.main.async {
                self.countriesTableView.reloadData()
            }
    }
    
    func unsaveButtonClicked(with data: CountryData) {
        //Removing related data if unsaved
        SavedViewController.countryDataArray.removeAll { dataToRemove in
            dataToRemove == data
        }
    }
    
}
