//
//  DetailViewController.swift
//  Countries
//
//  Created by Artun Erol on 29.11.2021.
//

import Foundation
import UIKit
import SafariServices
import WebKit

class DetailViewController: UIViewController {
    
    deinit {
        print("detailviewController deinit")
    }
    
    //MARK: -
    private var viewModel: DetailViewModel
    private var baseWikiURLString = "https://www.wikidata.org/wiki/"
    private var saveButtonDelegate: SaveButtonProtocol?
    
    private lazy var isCountrySelected = UserDefaults.standard.bool(forKey: viewModel.countryData.name)
    private lazy var selectedCountry = viewModel.countryData.name
    
    //MARK: - Image Computed Property
    //Using web kit in order to show the countryFlag Image, because JSON is bringing .svg format of images instead of .jpg
    private lazy var countryFlagImageWebView : WKWebView = {
        let temp = WKWebView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.layer.borderWidth = 2
        temp.layer.borderColor = UIColor.black.cgColor
        temp.scrollView.isScrollEnabled = false
        temp.pageZoom = 1.5
        
        return temp
    }()
    
    //MARK: - Country Code Computed Properties
    
    private lazy var countryCodeTitle: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Country Code:"
        temp.textAlignment = .left
        temp.font = .boldSystemFont(ofSize: 18)
        
        return temp
    }()
    
    private lazy var countryCode: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .systemFont(ofSize: 16)
        temp.text = " "
        
        return temp
    }()
    
    //MARK: - Buttons
    
    private lazy var wikiButton: UIButton = {
        let temp = UIButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .blue
        temp.layer.cornerRadius = 10
        
        return temp
    }()
    
    private lazy var wikiButtonTitle: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "For more information"
        temp.textColor = .white
        temp.font = .systemFont(ofSize: 18, weight: .semibold)
        temp.textAlignment = .center
        temp.clipsToBounds = true
        
        return temp
    }()
    
    private lazy var wikiButtonArrow: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.image = UIImage(systemName: "arrowshape.turn.up.right.fill")
        temp.tintColor = .white
        
        return temp
    }()
    
    private lazy var saveButton: SaveButton = {
        let temp = SaveButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.imageView?.tintColor = .black
        
        return temp
    }()
    
    //MARK: - LifeCycle
    
    init(with viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureView()
        
        wikiButtonAddTarget()
        saveButtonAddTarget()
        setupNavigationBar()
        checkIfCurrentCountryWasSelectedBefore()
        
        saveButtonDelegate = SavedViewController()
        
    }
    
    //MARK: - View Configurations
    
    private func configureView() {
        countryCode.text = viewModel.countryData.code
        setCountryFlagImage()
    }
    
    private func setCountryFlagImage() {
        self.viewModel.getImageURL { [weak self] imageURL in
            //Getting Image url but Cant set the Image. Data From API can not be converted to UIImage.
            let url = URL(string: imageURL)
            let request = URLRequest(url: url!)
            DispatchQueue.main.async {
                self?.countryFlagImageWebView.load(request)
            }
        }
    }
    
    //MARK: - Navigation Bar Configurations
    
    private func setupNavigationBar() {
        navigationItem.title = viewModel.countryData.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: saveButton)
    }
    
    //MARK: - Wiki Button Configurations
    
    private func wikiButtonAddTarget() {
        wikiButton.addTarget(self, action: #selector(wikiButtonPressed), for: .touchUpInside)
    }
    
    @objc func wikiButtonPressed() {
        //Openning up a SafariViewController to get more details to the user.
        let urlString = baseWikiURLString + viewModel.countryData.wikiDataId
        guard let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        
        present(safariVC, animated: true, completion: nil)
    }
    
    //MARK: - Save Button Configurations
    
    private func saveButtonAddTarget() {
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    @objc private func saveButtonPressed() {
        if !isCountrySelected {
            print("save button selected in detailVC")
            saveButton.saveButtonSelected(for: selectedCountry)
            saveButtonDelegate?.saveButtonClicked(with: viewModel.countryData)
        }
        
        if isCountrySelected {
            print("save button UNSELECTED in detailVC")
            saveButton.saveButtonUnselected(for: selectedCountry)
            saveButtonDelegate?.unsaveButtonClicked(with: viewModel.countryData)
        }
    }
    
    private func checkIfCurrentCountryWasSelectedBefore() {
        if !isCountrySelected {
            saveButton.saveButtonUnselected(for: selectedCountry)
        }
        if isCountrySelected {
            saveButton.saveButtonSelected(for: selectedCountry)
        }
    }
    
    //MARK: - View Setup
    
    private func setupViews() {
        view.addSubview(countryCodeTitle)
        view.addSubview(wikiButton)
        view.addSubview(countryFlagImageWebView)
        
        countryCodeTitle.addSubview(countryCode)
        
        wikiButton.addSubview(wikiButtonTitle)
        wikiButton.addSubview(wikiButtonArrow)
        
        setupConstraintsForViews()
    }
    
    private func setupConstraintsForViews() {
        NSLayoutConstraint.activate([
            countryFlagImageWebView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), //Setting layoutGuide to set the constraints below NavigationBar
            countryFlagImageWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            countryFlagImageWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countryFlagImageWebView.heightAnchor.constraint(equalToConstant: 200),
            
            countryCodeTitle.topAnchor.constraint(equalTo: countryFlagImageWebView.bottomAnchor,constant: 10),
            countryCodeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 5),
            
            countryCode.topAnchor.constraint(equalTo: countryCodeTitle.topAnchor,constant: 2),
            countryCode.leadingAnchor.constraint(equalTo: countryCodeTitle.trailingAnchor,constant: 5),
            
            wikiButton.topAnchor.constraint(equalTo: countryCodeTitle.bottomAnchor,constant: 5),
            wikiButton.leadingAnchor.constraint(equalTo: countryCodeTitle.leadingAnchor),
            
            wikiButtonTitle.topAnchor.constraint(equalTo: wikiButton.topAnchor,constant: 5),
            wikiButtonTitle.leadingAnchor.constraint(equalTo: wikiButton.leadingAnchor,constant: 5),
            wikiButtonTitle.trailingAnchor.constraint(equalTo: wikiButton.trailingAnchor,constant: -30),
            
            wikiButtonArrow.leadingAnchor.constraint(equalTo: wikiButtonTitle.trailingAnchor,constant: 5),
            wikiButtonArrow.topAnchor.constraint(equalTo: wikiButtonTitle.topAnchor),
            wikiButtonArrow.centerYAnchor.constraint(equalTo: wikiButtonTitle.centerYAnchor),            
        ])
    }
}
