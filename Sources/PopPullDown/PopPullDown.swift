import UIKit

//  MARK: - PopPullDown

open class PopPullDown: NSObject {
    
    // popoverを表示させるボタン
    private let sender: UIButton?
    // popoverの矢印の方向
    private let direction: UIPopoverArrowDirection?
    // popoverで利用するviewController
    private let viewController: PopView?
    // popoverの高さ
    private var popoberHeight: Int?
    
    open var items: [String] = []

    // MARK: - Initalize
    
    public init(sender: UIButton, direction: UIPopoverArrowDirection) {
        self.sender = sender
        self.direction = direction
        self.viewController = PopView()
        super.init()
        self.setup()
    }

    open func present() {
        guard let viewController = self.viewController else { return }
        viewController.popviewDelegate?.popView(self.items)

        self.getTopViewzController()?.present(viewController, animated: true)
    }
}

// MARK: - Private

extension PopPullDown {

    private func setup() {
        guard let sender = self.sender, let direction = self.direction else { return }
        guard let viewController = self.viewController else { return }
        
        viewController.modalPresentationStyle = .popover

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

