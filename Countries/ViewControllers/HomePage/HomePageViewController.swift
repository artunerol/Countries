//
//  HomePageViewController.swift
//  Countries
//
//  Created by Artun Erol on 26.11.2021.
//

import UIKit

class HomePageViewController: UIViewController {
    
    deinit {
        print("HomePageViewController Deinit")
    }
    
    //MARK: - Computed Properties
    
    private lazy var countriesTableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier) //Registering Cell
        temp.backgroundColor = .white
        
        temp.separatorStyle = .none // Removing lines out of tableView
        
        
        return temp
    }()
    
    private var viewModel : HomePageViewModel
    private var countryDataFromAPI : APIResult?
    
    //MARK: - LifeCycle
    
    init(with viewModel: HomePageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        setupViews()
        setupConstraintsForViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.viewModel.getAPIResult {
                DispatchQueue.main.async {
                    self.countryDataFromAPI = self.viewModel.apiResult
                    self.countriesTableView.reloadData()
                }
        }
    }
    
    //MARK: - Private Funcs
    
    private func setupViews() {
        view.addSubview(countriesTableView)
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

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryDataFromAPI?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier, for: indexPath) as! CountriesTableViewCell
        cell.countryLabel.text = countryDataFromAPI?.data[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @objc func asd() {
        print("saveButtonSelected on vc")
    }
    
}
