//
//  Constants.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import Foundation
import SwiftUI

struct Constants {
    // API base url
    // Types/EntdpointType.swift provides API endpoints;
    static let baseURL = "https://frontend-test-assignment-api.abz.agency/api/v1"
    // edit valitation regex patterns
    static let nameMask = "^[A-Z][a-z'-]+?( [A-Z][a-z'-]+?)*$"
    static let emaiMask = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static let phoneSpacedMask = "^\\+38 \\(\\d{3}\\) \\d{3} - \\d{2} - \\d{2}$"
    static let phoneMask = "^\\+?38\\s?\\(?\\d{3}\\)?\\s?\\d{3}\\s?\\-?\\s?\\d{2}\\s?\\-?\\s?\\d{2}$"
}
