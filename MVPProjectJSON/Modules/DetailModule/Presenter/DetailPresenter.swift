//
//  DetailPresenter.swift
//  MVPProjectJSON
//
//  Created by iOS - Developer on 15.10.2023.
//

import Foundation

//MARK: - DetailViewPresenterProtocol
protocol DetailViewPresenterProtocol: AnyObject {
    func setComment()
}

//MARK: - DetailViewPresenterProtocol
final class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: (DetailViewProtocol)? //Объстракция вью может быть любой class (не обязательно UIViewController)
    let networkService: NetworkServiceTable
    let images: ImagesModel?
    
    init(view: DetailViewProtocol, networkService: NetworkServiceTable, images: ImagesModel?) {
        self.view = view
        self.networkService = networkService
        self.images = images
    }
    
    func setComment() {
        view?.setComment(images: images)
    }
}
