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
    
    func sendMail(intervals: [Breath]) -> String {
        var res: String = "<table>"
        for info in intervals {
            res += """
            <tr>
                <td>\(info.description)</td>
                <td>interval: \(info.interval.stringFromTimeInterval())</td>
                <td>detected: \(info.time.stringFromTimeInterval())</td>
            </tr>
            """
        }
        res += "</table>"
        return res
    }
    
    func canSendMail() -> Bool {
        return MFMailComposeViewController.canSendMail()
    }
}
