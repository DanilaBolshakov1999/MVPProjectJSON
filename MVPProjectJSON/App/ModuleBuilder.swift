//
//  ModuleBuilder.swift
//  MVPProjectJSON
//
//  Created by iOS - Developer on 15.10.2023.
//

import UIKit

//MARK: - protocol Bilder
protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(images: ImagesModel?) -> UIViewController
}

final class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkServiceTable = NetworkServiceTable()
        let presenter = MainPresenter(view: view, networkService: networkServiceTable)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(images: ImagesModel?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkServiceTable()
        let present = DetailPresenter(view: view, networkService: networkService, images: images)
        view.presenter = present
        return view
    }
    
}
