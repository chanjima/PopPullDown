import UIKit

//  MARK: - PopPullDown

class PopPullDown: NSObject {
    
    private let sender: UIButton?
    private let viewController: UIViewController?
    private let direction: UIPopoverArrowDirection?

    init(_ sender: UIButton, direction: UIPopoverArrowDirection) {
        self.sender = sender
        self.direction = direction
        self.viewController = UIViewController()
        super.init()

        self.setup()
    }
    
}

// MARK: - Private

extension PopPullDown {

    private func setup() {
        guard let sender = self.sender, let viewController = self.viewController, let direction = self.direction else { return }

        viewController.modalPresentationStyle = .popover
        viewController.popoverPresentationController?.sourceView = sender.superview
        viewController.popoverPresentationController?.sourceRect = sender.frame
        viewController.popoverPresentationController?.permittedArrowDirections = direction
        viewController.popoverPresentationController?.delegate = self
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension PopPullDown: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

