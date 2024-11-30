//
//  BreathReportGenerator.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-30.
//

import Foundation

class BreathReportGenerator {
    static func generateHTMLReport(for breaths: [Breath]) -> String {
        var res: String = """
        <html>
        <head>
            <style>
                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin: 20px 0;
                    font-size: 18px;
                    text-align: left;
                }
                th, td {
                    padding: 12px;
                    border: 1px solid #ddd;
                }
                th {
                    background-color: #f4f4f4;
                }
                tr:nth-child(even) {
                    background-color: #f9f9f9;
                }
            </style>
        </head>
        <body>
            <h2>Breathing Session Report</h2>
            <table>
                <thead>
                    <tr>
                        <th>Breath Type</th>
                        <th>Duration</th>
                        <th>Detected Time</th>
                    </tr>
                </thead>
                <tbody>
        """
        
        for breath in breaths {
            res += """
            <tr>
                <td>\(breath.description)</td>
                <td>\(breath.formattedInterval())</td>
                <td>\(breath.formattedTime())</td>
            </tr>
            """
        }
        
        res += """
                </tbody>
            </table>
        </body>
        </html>
        """
        
        return res
    }
}
