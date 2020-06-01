//
//  ContentView.swift
//  SwiftUI_ViewModifier
//
//  Created by Paymint on 2020/05/29.
//  Copyright © 2020 Paymint. All rights reserved.
//


/**
 ViewModifier는 유사한 뷰를 만들 때마다 같은 수식어를 반복 장성이 귀찮지않도록 입맛에 맞는 커스텀 수식어를 만들도록 해주는 것이다.
 
 */
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 10) {
            Text("Hello, World!")
                .modifier(CustomViewModifier(borderColor: .red))
            
            ModifiedContent(content: Text("Custom ViewModifier"),
                            modifier: CustomViewModifier(borderColor: .blue))
            
            Text("MyViewModifier")
                .modifier(MyViewModifier1().concat(MyViewModifier2()))
            
            Text("ExtensionView")
                .customModifier(borderColor: .green)
        }
        
    }
}

extension View {
    func customModifier(borderColor: Color = .red) -> some View {
        self
            .modifier(CustomViewModifier(borderColor: borderColor))
    }
}

struct CustomViewModifier: ViewModifier {
    var borderColor: Color = .red
    
    func body(content: Content) -> some View{
        content
            .font(.title)
            .foregroundColor(Color.white)
            .padding()
            .background(Rectangle().fill(Color.gray))
            .border(borderColor, width: 2)
    }
}

struct MyViewModifier1: ViewModifier {
    func body(content: Content) -> some View{
        content.font(.title)
    }
}

struct MyViewModifier2: ViewModifier {
    func body(content: Content) -> some View{
        content.foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
