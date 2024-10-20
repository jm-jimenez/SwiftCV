//
//  SceneDelegate.swift
//  SwiftCV
//
//  Created by José María Jiménez on 18/10/24.
//

import UIKit
import DependencyResolver
import Navigation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // swiftlint:disable:next line_length
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController()
        Navigator.shared.navigationController = navigationController
        registerDependency(ResumeNavigation.self) {
            ResumeNavigation()
        }
        registerDependency(ResumePresenterProtocol.self) {
            ResumePresenter()
        }
        let viewController = ResumeViewController(nibName: "ResumeViewController", bundle: nil)
        navigationController.viewControllers = [viewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
