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
    lazy var assembler: Assembler? = {
        return try? Assembler(assemblies: [CharactersListContainer(), CharacterDetailContainer()])
    }()

    func application(
        _ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupAppearance()
        let rootVC = assembler?.resolver.resolve(CharactersListViewInput.self) as? CharactersListViewController
        navigationController = UINavigationController(rootViewController: rootVC!)
        navigationController?.navigationBar.barStyle = .black
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
    func setupAppearance() {
        UINavigationBar.appearance().setBackgroundImage(R.image.headerBackground(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        let attributes: [String : AnyObject]? = [
            NSForegroundColorAttributeName : UIColor.white,
            NSFontAttributeName : R.font.tradeGothicLTStdBd2(size: 20)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backIndicatorImage = R.image.arrowBack()
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = R.image.arrowBackSel()
    }
}

