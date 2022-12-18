//
//  PopPullDown.swift
//
//
//  Created by chanjima on 2022/12/18.
//

import UIKit

public protocol PopPullDownDelegate {

    func selectedIndex(_ item: String)
}

//  MARK: - PopPullDown

open class PopPullDown: NSObject {
    
    open var popPullDownDelegate: PopPullDownDelegate?
    // popoverを表示させるボタン
    private let sender: UIButton?
    // popoverの矢印の方向
    private let direction: UIPopoverArrowDirection?
    // popoverで利用するviewController
    private let viewController: PopView?
    // popoverの表示項目
    open var items: [String] = []

    // MARK: - Initalize
    
    public init(sender: UIButton, direction: UIPopoverArrowDirection) {
        self.sender = sender
        self.direction = direction
        self.viewController = PopView()
    }

    open func present() {
        self.setup()
        guard let viewController = self.viewController, let topViewController = self.getTopViewzController() else { return }

        viewController.popPullDownDelegate = self.popPullDownDelegate
        viewController.popviewDelegate?.popView(items: self.items)
        topViewController.present(viewController, animated: true)
    }
}

// MARK: - Private

extension PopPullDown {

    private func setup() {
        guard let sender = self.sender, let direction = self.direction else { return }
        guard let viewController = self.viewController else { return }
        
        viewController.modalPresentationStyle = .popover
        viewController.preferredContentSize = CGSize(width: viewController.view.bounds.width, height: 300)

        guard let presentationController = viewController.popoverPresentationController else { return }

        presentationController.sourceView = sender.superview
        presentationController.sourceRect = sender.frame
        presentationController.permittedArrowDirections = direction
        presentationController.delegate = self
    }
    
    private func getTopViewzController() -> UIViewController? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene

        if let rootViewController = windowScenes?.keyWindow?.rootViewController {
            var topViewController: UIViewController = rootViewController

            while let presentedViewController = topViewController.presentedViewController {
                topViewController = presentedViewController
            }

            return topViewController
        } else {
            return nil
        }
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension PopPullDown: UIPopoverPresentationControllerDelegate {
    
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
