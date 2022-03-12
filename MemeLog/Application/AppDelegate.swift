//
//  AppDelegate.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 03.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: LaunchCoordinator!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupNavBar()
        resetUserDefaultsIfUITest()

        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = LaunchCoordinator(window: window)
        coordinator.start()
        
        DeeplinkRegistry.shared.register(deeplink: FavoriteDeeplink(coordinator: coordinator))

        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        if isDeeplink(url) {
            handleDeeplink(url)
        }

        return true
    }

    private func isDeeplink(_ url: URL) -> Bool {
        if let scheme = url.scheme {
            return scheme.localizedCaseInsensitiveCompare("MemeLog") == .orderedSame
        }

        return false
    }

    private func handleDeeplink(_ url: URL) {
        DeeplinkRegistry.shared.handle(url: url)
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
