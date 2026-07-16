//
//  TagGetBorderUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting

final class TagGetBorderUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var theme = ThemeGeneratedMock.mocked()

    override func tearDown() {
        super.tearDown()

    }

    // MARK: - Tests

    func test_execute_with_medium_size() {
        // GIVEN
        let useCase = TagGetBorderUseCase()

        // WHEN
        let border = useCase.execute(
            theme: self.theme,
            size: .medium
        )

        // THEN
        XCTAssertEqual(border.width, self.theme.border.width.small)
        XCTAssertEqual(border.radius, self.theme.border.radius.small)
    }

    func test_execute_with_large_size() {
        // GIVEN
        let useCase = TagGetBorderUseCase()

        // WHEN
        let border = useCase.execute(
            theme: self.theme,
            size: .large
        )

        // THEN
        XCTAssertEqual(border.width, self.theme.border.width.small)
        XCTAssertEqual(border.radius, self.theme.border.radius.small)
    }
}
