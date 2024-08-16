//
//  FlowModuleProtocol.swift
//  Messager
//
//  Created by Vlad on 16.08.24.
//

import Foundation

protocol FlowModuleProtocol: AnyObject {
    associatedtype T
    var completionHendler: ((T) -> Void)? { get set }
}
