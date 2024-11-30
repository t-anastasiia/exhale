//
//  MailViewModel.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-30.
//

import Foundation
import MessageUI

class MailViewModel: ObservableObject {
    @Published var isShowingMailView: Bool = false
    @Published var mailResult: Result<MFMailComposeResult, Error>? = nil
    @Published var message: String = ""

    func prepareMailContent(with intervals: [Breath]) {
        self.message = BreathReportGenerator.generateHTMLReport(for: intervals)
    }

    func canSendMail() -> Bool {
        return MFMailComposeViewController.canSendMail()
    }
}
