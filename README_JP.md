# PopPullDown

![Version](https://img.shields.io/badge/Version-0.1.0-important)
[![Xcode](https://img.shields.io/badge/Xcode-14.1-blue.svg)](https://developer.apple.com/xcode) 
[![Swift 5.7.1](https://img.shields.io/badge/Swift-5.7.1-blue.svg?style=flat)](https://swift.org/)
[![License](https://img.shields.io/github/license/chanjima/PopPullDOwn)](https://github.com/chanjima/PopPullDown/blob/main/LICENSE)


PopPullDown in Swift

利用する場合は自己責任でお願いします。

[English](URL "https://github.com/chanjima/PopPullDown/blob/main/README.md")

## サンプル
![usage](https://user-images.githubusercontent.com/120774845/208463212-780de7c1-3057-4ad5-827e-134df7a15ec0.gif)

## 使い方

import PopPullDownを追加

``` viewController.swift
import PopPullDown

@IBAction func didTapButton(_ sender: UIButton) {
    let popPuullDown = PopPullDown(sender: sender, direction: .up)
    popPuullDown.popPullDownDelegate = self
    popPuullDown.items = ["Apple", "Banana", "Coconut"]
    popPuullDown.present()
}
```

選択した項目を取得する場合はdelegateが必要です。

``` viewController.swift
extension ViewController: PopPullDownDelegate {

    func selectedIndex(_ item: String) {
        self.dismiss(animated: true)
        print(item)
    }
}
``` 

### Buttonポジション

⚠️ ボタンの位置が300を下回っている場合、自動で矢印の方向が変わります。

<img width="300" src= https://user-images.githubusercontent.com/120774845/208464691-0b43f471-a10f-4232-aaa4-93378fcd5259.png> <img width="300" src= https://user-images.githubusercontent.com/120774845/208464745-3bb5ae4c-6080-4c51-9993-10098feaaefa.png>

## インストール

### Swift Package Manager 

TARGET > General > Frameworks, Libraries, and Embedded Content > +ボタン

<img width="1085" alt="addPackege" src="https://user-images.githubusercontent.com/120774845/208467930-2ee53038-3ff7-464b-a1a0-1fee1d46ee36.png">


## 今後追加する機能

- cocoaPodsのサポート
- 選択時のcheckMarkの追加
