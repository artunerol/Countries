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
    
    private lazy var countriesListTableView: UITableView = {
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
    private var countryDataFromAPI : CountryDataFromAPI?
    
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
        //Getting API Result in viewDidLoad. And after getting the result, reloading the tableView.
        self.viewModel.getAPIResult { [weak self] in
            DispatchQueue.main.async {
                self?.countryDataFromAPI = self?.viewModel.apiResult
                self?.countriesListTableView.reloadData()
            }
        }
    }
    
    //MARK: - Setting up the Views
    
    private func setupViews() {
        view.addSubview(countriesListTableView)
    }
    
    private func setupConstraintsForViews() {
        NSLayoutConstraint.activate([
            countriesListTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            countriesListTableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            countriesListTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countriesListTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
        
        let countryData = countryDataFromAPI!.data[indexPath.row]
        UserDefaults.standard.set(false, forKey: countryData.name) // setting every country's default selected value to "False"
        cell.configureCell(with: countryData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailViewModel = DetailViewModel()
        detailViewModel.countryData = countryDataFromAPI?.data[indexPath.row]
        navigationController?.pushViewController(DetailViewController(with: detailViewModel), animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
