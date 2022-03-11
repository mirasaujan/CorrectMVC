//
//  AppDelegate.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 03.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let coordinator = LaunchCoordinator()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupNavBar()
        resetUserDefaultsIfUITest()

        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator.start(window: window)

        return true
    }

    private func resetUserDefaultsIfUITest() {
        if ProcessInfo.processInfo.arguments.contains("UI-Test") {
            UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier ?? "")
        }
    }

    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
