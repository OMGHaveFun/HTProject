//
//  MainFlowCoordinator.swift
//  HTProject
//
//  Created by Aliaksandr Yalchyk on 17/01/2023.
//

import UIKit

protocol MainFlowCoordinatorDelegate: AnyObject {
    func userPerformedDetail()
}

final class MainFlowCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    let navigationController: UINavigationController
    weak var delegate: MainFlowCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showFeedScene()
    }

    func startDetail() {
        setDetailScene()
    }
}

private extension MainFlowCoordinator {
    func showFeedScene() {
//        let link = LoginLinkModel(text: AuthText.Login.offer.string(), linkText: AuthText.Login.link.string())
//
//        let model = LoginModel(title: AuthText.Login.title.string(),
//                               text: AuthText.Login.text.string(),
//                               link: link)
//
//        let controller = LoginAssembly.build(delegate: self, model: model)
//
//        navigationController.setViewControllers([controller], animated: true)
    }

    func setDetailScene() {
//        navigationController.pushViewController(controller, animated: true)
    }
}

extension AuthFlowCoordinator: LoginPresenterDelegate {
    func userNeedsToPin(model: LoginModel) {
        showPinScene(model: model)
    }
}

extension AuthFlowCoordinator: PinPresenterDelegate {
    func userNeedsToMain() {
        showMainScene()
    }

    func userNeedsToForm(model: PinModel) {
        showFormScene(model: model)
//        showStartScene()
    }

    func userNeedsToTopicsFromPin() {
        showTopicsScene()
    }
}

extension AuthFlowCoordinator: FormPresenterDelegate {
    func userNeedsToTopics() {
        showTopicsScene()
    }
}

extension AuthFlowCoordinator: TopicsPresenterDelegate {
    func userNeedsToExpertise(model: TopicsModel) {
        showExpertiseScene(model: model)
    }
}

extension AuthFlowCoordinator: ExpertisePresenterDelegate {
    func userNeedsToStart() {
        showStartScene()
    }
}

extension AuthFlowCoordinator: StartPresenterDelegate {
    func userNeedsToMainAfterRegister() {
        showMainSceneAfterRegister()
    }
}

extension AuthFlowCoordinator: OnboardingPresenterDelegate {
    func handleSkipButtonTap() {
        showMainSceneAfterRegister()
    }
}
