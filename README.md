# PopPullDown

![Version](https://img.shields.io/badge/Version-0.1.0-important)
[![Xcode](https://img.shields.io/badge/Xcode-14.1-blue.svg)](https://developer.apple.com/xcode) 
[![Swift 5.7.1](https://img.shields.io/badge/Swift-5.7.1-blue.svg?style=flat)](https://swift.org/)
[![License](https://img.shields.io/github/license/chanjima/PopPullDOwn)](https://github.com/chanjima/PopPullDown/blob/main/LICENSE)


PopPullDown in Swift

Please note that any additions are at your own risk.

[日本語](URL "https://github.com/chanjima/PopPullDown/blob/main/README_JP.md")

## Example
![usage](https://user-images.githubusercontent.com/120774845/208463212-780de7c1-3057-4ad5-827e-134df7a15ec0.gif)

## How to use

import PopPullDown to use it.

``` viewController.swift
import PopPullDown

@IBAction func didTapButton(_ sender: UIButton) {
    let popPuullDown = PopPullDown(sender: sender, direction: .up)
    popPuullDown.popPullDownDelegate = self
    popPuullDown.items = ["Apple", "Banana", "Coconut"]
    popPuullDown.present()
}
```

If you want to know the result, a delegate is required.

``` viewController.swift
extension ViewController: PopPullDownDelegate {

    func selectedIndex(_ item: String) {
        self.dismiss(animated: true)
        print(item)
    }
}
``` 

### Button Position

⚠️ If the button position is less than 300, the arrow direction changes automatically.

<img width="300" src= https://user-images.githubusercontent.com/120774845/208464691-0b43f471-a10f-4232-aaa4-93378fcd5259.png> <img width="300" src= https://user-images.githubusercontent.com/120774845/208464745-3bb5ae4c-6080-4c51-9993-10098feaaefa.png>

## Installation

### Swift Package Manager 

TARGET > General > Frameworks, Libraries, and Embedded Content > Press the bottom + button.

<img width="1085" alt="addPackege" src="https://user-images.githubusercontent.com/120774845/208467930-2ee53038-3ff7-464b-a1a0-1fee1d46ee36.png">


## Features to add

- Support for cocoaPods
- Selected checkMark
