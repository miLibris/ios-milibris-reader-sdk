//
//  MySharingProvider.swift
//  MiLibrisReaderSDKSample
//
//  Created by Maxime Le Moine on 15/07/2022.
//

import MiLibrisReaderSDK
import UIKit

final class MySharingProvider: MiLibrisWebKioskSharingProvider {

    let kioskBaseURL: URL
    let issueId: String

    init(kioskBaseURL: URL, issueId: String) {
        self.kioskBaseURL = kioskBaseURL
        self.issueId = issueId
    }

}
