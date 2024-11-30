//
//  MailView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-30.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    @ObservedObject var viewModel: MailViewModel

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var viewModel: MailViewModel

        init(viewModel: MailViewModel) {
            self.viewModel = viewModel
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                viewModel.isShowingMailView = false
            }
            if let error = error {
                viewModel.mailResult = .failure(error)
            } else {
                viewModel.mailResult = .success(result)
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(viewModel: viewModel)
    }

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setMessageBody(viewModel.message, isHTML: true)
        vc.setToRecipients(["nastaytalmazan@gmail.com"])
        vc.mailComposeDelegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
}
