//
//  ViewControllerWrapper.swift
//  
//
//  Created by Tyler Thompson on 8/7/21.
//

import SwiftUI
import SwiftCurrent

@available(iOS 14.0, macOS 11, tvOS 14.0, watchOS 7.0, *)
public struct ViewControllerWrapper<F: FlowRepresentable & UIViewController>: View, UIViewControllerRepresentable, FlowRepresentable {
    public typealias UIViewControllerType = F
    public typealias WorkflowInput = F.WorkflowInput
    public typealias WorkflowOutput = F.WorkflowOutput

    public weak var _workflowPointer: AnyFlowRepresentable?

    let args: WorkflowInput
    public init(with args: F.WorkflowInput) {
        self.args = args
    }

    public func makeUIViewController(context: Context) -> F {
        var vc = F._factory(F.self, with: args)
        vc._workflowPointer = _workflowPointer
        return vc
    }

    public func updateUIViewController(_ uiViewController: F, context: Context) { }
}
