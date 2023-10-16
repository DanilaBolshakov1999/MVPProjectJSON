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
    static func createDetailModule(comment: ImagesModel?) -> UIViewController
}
