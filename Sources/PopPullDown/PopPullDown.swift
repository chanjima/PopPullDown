import UIKit

//  MARK: - PopPullDown

open class PopPullDown: NSObject {
    
    // popoverで表示するview
    private let view: UIView?
    // popoverを表示させるボタン
    private let sender: UIButton?
    // popoverの矢印の方向
    private let direction: UIPopoverArrowDirection?
    // popoverで利用するviewController
    private let viewController: UIViewController?
    // popoverの高さ
    private var popoberHeight: Int?

    // MARK: - Initalize
    
    public init(sender: UIButton, direction: UIPopoverArrowDirection) {
        self.sender = sender
        self.direction = direction
        self.view = PopView()
        self.viewController = UIViewController()
        super.init()
        self.setup()
    }
    
}

// MARK: - Private

extension PopPullDown {

    private func setup() {
        guard let sender = self.sender, let direction = self.direction else { return }
        guard let view = self.view, let viewController = self.viewController else { return }

        view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(view)
        viewController.modalPresentationStyle = .popover
        
        let topConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: viewController.view, attribute: .top, multiplier: 1.0, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: viewController.view, attribute: .left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: viewController.view, attribute: .right, multiplier: 1.0, constant: 0)

        topConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true

        guard let presentationController = viewController.popoverPresentationController else { return }
        
        presentationController.sourceView = sender.superview
        presentationController.sourceRect = sender.frame
        presentationController.permittedArrowDirections = direction
        presentationController.delegate = self

        self.getTopViewzController()?.present(viewController, animated: true)
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

