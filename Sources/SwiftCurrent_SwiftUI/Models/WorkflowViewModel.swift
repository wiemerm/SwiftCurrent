//
//  WorkflowViewModel.swift
//  SwiftCurrent_SwiftUI
//
//  Created by Megan Wiemer on 7/13/21.
//  Copyright © 2021 WWT and Tyler Thompson. All rights reserved.
//

import SwiftCurrent
import SwiftUI

final class WorkflowViewModel: ObservableObject {
    @Published var body = AnyView(EmptyView())
    var isPresented: Binding<Bool>?
    var onAbandon = [() -> Void]()
}

extension WorkflowViewModel: OrchestrationResponder {
    func launch(to: AnyWorkflow.Element) {
        #warning("come back to this")
        // swiftlint:disable:next force_cast
        let afrv = to.value.instance as! AnyFlowRepresentableView

        afrv.model = self
    }

    func proceed(to: AnyWorkflow.Element, from: AnyWorkflow.Element) {
        #warning("come back to this")
        // swiftlint:disable:next force_cast
        let afrv = to.value.instance as! AnyFlowRepresentableView

        afrv.model = self
    }

    func backUp(from: AnyWorkflow.Element, to: AnyWorkflow.Element) {
        #warning("come back to this")
        // swiftlint:disable:next force_cast
        let afrv = to.value.instance as! AnyFlowRepresentableView

        afrv.model = self
    }

    func abandon(_ workflow: AnyWorkflow, onFinish: (() -> Void)?) {
        isPresented?.wrappedValue = false
        onAbandon.forEach { $0() }
    }

    func complete(_ workflow: AnyWorkflow, passedArgs: AnyWorkflow.PassedArgs, onFinish: ((AnyWorkflow.PassedArgs) -> Void)?) {
        if workflow.lastLoadedItem?.value.metadata.persistence == .removedAfterProceeding {
            if let lastPresentableItem = workflow.lastPresentableItem {
                #warning("come back to this")
                // swiftlint:disable:next force_cast
                let afrv = lastPresentableItem.value.instance as! AnyFlowRepresentableView
                afrv.model = self
            } else {
                #warning("We are a little worried about animation here")
                body = AnyView(EmptyView())
            }
        }
        onFinish?(passedArgs)
    }
}

extension AnyWorkflow {
    fileprivate var lastLoadedItem: AnyWorkflow.Element? {
        last { $0.value.instance != nil }
    }

    fileprivate var lastPresentableItem: AnyWorkflow.Element? {
        last {
            $0.value.instance != nil && $0.value.metadata.persistence != .removedAfterProceeding
        }
    }
}
