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
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
}
