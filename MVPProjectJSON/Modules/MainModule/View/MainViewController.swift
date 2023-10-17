//
//  MainViewController.swift
//  MVPProjectJSON
//
//  Created by iOS - Developer on 15.10.2023.
//

import UIKit

//MARK: - MainViewProtocol
protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
    func hideActivityIndicator()
}

final class MainViewController: UIViewController {
    
    //MARK: - UI
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .lightGray
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            indicator.style = .large
        } else {
            indicator.style = .gray
        }
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    var presenter: MainViewPresenterProtocol? //Свойство *с типом* протокола
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.didLoad()
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
    }
}

//MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.imagesModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        let imagesModel = presenter?.imagesModel?[indexPath.row]
        cell.textLabel?.text = imagesModel?.id
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let images = presenter?.imagesModel?[indexPath.row]
        let detailViewController = ModuleBuilder.createDetailModule(images: images)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

//MARK: - Extension MainViewController
extension MainViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
