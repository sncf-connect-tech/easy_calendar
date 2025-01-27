//
//  MockPermissionHandler.swift
//  EasyCalendarTests
//
//  Created by CHOUPAULT Alexis on 16/01/2025.
//

@testable import easy_calendar

final class PermissionGranted: PermissionHandlerProtocol {
    func checkCalendarAccessThenExecute(
        _ permissionsGrantedCallback: @escaping () -> Void,
        noAccess permissionsRefusedCallback: @escaping () -> Void,
        error errorCallback: @escaping (any Error) -> Void
    ) {
        permissionsGrantedCallback()
    }
}

final class PermissionRefused: PermissionHandlerProtocol {
    func checkCalendarAccessThenExecute(
        _ permissionsGrantedCallback: @escaping () -> Void,
        noAccess permissionsRefusedCallback: @escaping () -> Void,
        error errorCallback: @escaping (any Error) -> Void
    ) {
        permissionsRefusedCallback()
    }
}

final class PermissionError: PermissionHandlerProtocol {
    class PermErr: Error {}
    
    func checkCalendarAccessThenExecute(
        _ permissionsGrantedCallback: @escaping () -> Void,
        noAccess permissionsRefusedCallback: @escaping () -> Void,
        error errorCallback: @escaping (any Error) -> Void
    ) {
        errorCallback(PermErr())
    }
}
