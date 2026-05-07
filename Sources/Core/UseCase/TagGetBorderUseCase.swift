//
//  TagGetBorderUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkCommon
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol TagGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        size: TagSize
    ) -> TagBorder
}

final class TagGetBorderUseCase: TagGetBorderUseCaseable {

    // MARK: - Properties

    private let featureTogglesService: any SparkFeatureToggleServicing

    // MARK: - Initialization

    init(featureTogglesService: any SparkFeatureToggleServicing = SparkFeatureToggleService.shared) {
        self.featureTogglesService = featureTogglesService
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        size: TagSize
    ) -> TagBorder {
        let border = theme.border

        let width = border.width.small
        let radius: CGFloat = self.featureTogglesService.rebranding ? border.radius.small : {
            return switch size {
            case .medium: border.radius.full
            case .large: border.radius.medium
            }
        }()

        return .init(width: width, radius: radius)
    }
}
