//
//  DetailViewController.swift
//  MVPProjectJSON
//
//  Created by iOS - Developer on 15.10.2023.
//

import UIKit

//MARK: - DetailViewProtocol
protocol DetailViewProtocol: AnyObject {
    func setComment(images: ImagesModel?)
}

final class DetailViewController: UIViewController {
    
    //MARK: - UI
    private lazy var viewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        presenter.setComment()
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        view.addSubview(viewLabel)
    }
}

//MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
    func setComment(images: ImagesModel?) {
        viewLabel.text = images?.id
    }
}

//MARK: - Setup Constraints
extension DetailViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            viewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
        ])
    }
}
