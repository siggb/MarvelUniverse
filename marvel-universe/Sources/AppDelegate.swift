//
//  AppDelegate.swift
//  marvel-universe
//
//  Created by Sibagatov Ildar on 10/1/16.
//  Copyright © 2016 Sibagatov Ildar. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(
        _ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let interactor = CharactersListInteractor()
        let presenter = CharactersListPresenter()
        let view = CharactersListViewController()
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        navigationController = UINavigationController(rootViewController: view)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

