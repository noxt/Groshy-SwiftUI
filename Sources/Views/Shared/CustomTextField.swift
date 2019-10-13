//
//  Created by Dmitry Ivanenko on 13.10.2019.
//  Copyright © 2019 Dmitry Ivanenko. All rights reserved.
//

import SwiftUI
import UIKit


class WrappableTextField: UITextField, UITextFieldDelegate {

    var textFieldChangedHandler: ((String) -> Void)?
    var onCommitHandler: (() -> Void)?

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentValue = textField.text as NSString? {
            let proposedValue = currentValue.replacingCharacters(in: range, with: string)
            textFieldChangedHandler?(proposedValue as String)
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        onCommitHandler?()
    }
    
}



struct CustomTextField: UIViewRepresentable {

    private let tmpView = WrappableTextField()

    var placeholder: String?
    var changeHandler: ((String) -> Void)?
    var onCommitHandler: (() -> Void)?

    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> WrappableTextField {
        tmpView.delegate = tmpView
        tmpView.placeholder = placeholder
        tmpView.onCommitHandler = onCommitHandler
        tmpView.textFieldChangedHandler = changeHandler
        return tmpView
    }

    func updateUIView(_ uiView: WrappableTextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }

}
