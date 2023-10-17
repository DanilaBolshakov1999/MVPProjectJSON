//
//  MainPresenter.swift
//  MVPProjectJSON
//
//  Created by iOS - Developer on 15.10.2023.
//

import Foundation

//MARK: - MainViewPresenterProtocol
protocol MainViewPresenterProtocol: AnyObject {
    var imagesModel: [ImagesModel]? { get set }
    func getNetwork()
    func didLoad()
}

//MARK: - MainPresenter
final class MainPresenter: MainViewPresenterProtocol {
    
    weak var view: (MainViewProtocol)?
    let networkService: NetworkServiceTable
    var imagesModel: [ImagesModel]?
    
    //MARK: - init
    init(view: MainViewProtocol, networkService: NetworkServiceTable) {
        self.view = view
        self.networkService = networkService
    }
    
    func getNetwork() {
        didLoad()
    }
    
    func didLoad() {
        networkService.getSetup(numberLimit: 10) { [ weak self ] result in
            guard let self = self else { return }
            
            defer { // после отработки func
                view?.hideActivityIndicator()
            }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let imagesModel):
                    self.imagesModel = imagesModel
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
