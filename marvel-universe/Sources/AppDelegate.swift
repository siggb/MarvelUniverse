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
        var assembler: Assembler?
        do {
            assembler = try Assembler(assemblies: [CharactersListContainer()])
        } catch { }
        let rootVC = assembler?.resolver.resolve(CharactersListViewInput.self) as? CharactersListViewController
        navigationController = UINavigationController(rootViewController: rootVC!)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

