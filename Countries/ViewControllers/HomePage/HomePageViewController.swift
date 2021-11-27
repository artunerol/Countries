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
        
        temp.separatorStyle = .none // Removing lines out of tableView
        
        
        return temp
    }()
    
    private var viewModel: HomePageViewModel?
    
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
    
    }
    
    //MARK: - Private Funcs
    
    private func setupViews() {
        view.addSubview(countriesTableView)
        countriesTableView.backgroundColor = viewModel?.color
    }
    
    private func setupConstraintsForViews() {
        NSLayoutConstraint.activate([
            countriesTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            countriesTableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            countriesTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countriesTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func addCellObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(asd), name: .saveButtonSelected, object: nil) //SaveButtonSelected Observer
    }
}

//MARK: - TableView Extension

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier, for: indexPath) as? CountriesTableViewCell else { return UITableViewCell() }
        cell.countryLabel.text = viewModel?.countryTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @objc func asd() {
        print("saveButtonSelected on vc")
    }
    
}
