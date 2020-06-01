//
//  ViewModifier.swift
//  SwiftUI_ViewModifier
//
//  Created by Paymint on 2020/05/29.
//  Copyright © 2020 Paymint. All rights reserved.
//

import Foundation

protocol ViewModifier{
    associatedtype Body: View
    func body(content: Self.Content) -> Self.Body
    typealias  Content
}
