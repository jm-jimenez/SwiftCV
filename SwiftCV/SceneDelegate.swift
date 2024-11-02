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
        do {
            let entryPoint: EntryPointProtocol = try DefaultDependencyResolver.shared.resolve()
            navigationController.viewControllers = [entryPoint.getEntryPointViewController()]
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        } catch {
            fatalError("Entry point not registered")
        }
    }
}
