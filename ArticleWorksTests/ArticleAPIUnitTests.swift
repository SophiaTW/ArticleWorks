//
//  ArticleAPIUnitTests.swift
//  ArticleWorksTests
//
//  Created by Paula Daniela Nieto Ponce on 07-02-23.
//

import XCTest
import Foundation
@testable import ArticleWorks

class ArticleAPIUnitTests: XCTestCase {
    var sut: ArticleAPI?
    var data: ArticlesResponseDTO?
    var expected = [Article(title: "Mac Catalyst with Andy Pereira – Podcast S10 E7", domain: "iOS & Swift", description: "Dru flips the switch on his 50th show with Andy Pereira telling us how easy Catalyst can be. After Dru talks about transitioning from developer to architect. \n", createdDate: "May 20 2020", duration: "1 hr", image: "https://koenig-media.raywenderlich.com/uploads/2016/02/Logo.png"), Article(title: "Scoped Storage in Android 10: Getting Started", domain: "Android & Kotlin", description: "In this tutorial, you’ll learn how to use scoped storage in your Android 10 app by building a simple image gallery.\n", createdDate: "May 20 2020", duration: "18 hrs", image: "https://koenig-media.raywenderlich.com/uploads/2020/04/ScopedStorage-feature.png")]
    
    override func setUp() {
        sut = ArticleAPI()
        data = loadData("articlesResponse.json")
    }
    
    override func tearDown() {
        sut = nil
    }
    
    // TODO: Probar datos especificos, no especificos, probar todo
    func testMapDTOToArticleTitle() {
        // given
        let articleResponseDTO = data!
        // when
        let result = sut!.mapDTOToArticle (articlesResponseDTO: articleResponseDTO)
        // then
        XCTAssertEqual(expected[0].title, result[0].title)
    }
    
    func testMapDTOToArticleDomain() {
        // given
        let articleResponseDTO = data!
        // when
        let result = sut!.mapDTOToArticle (articlesResponseDTO: articleResponseDTO)
        // then
        XCTAssertEqual(expected[0].domain, result[0].domain)
    }
    
    func testMapDTOToArticleDescription() {
        // given
        let articleResponseDTO = data!
        // when
        let result = sut!.mapDTOToArticle (articlesResponseDTO: articleResponseDTO)
        // then
        XCTAssertEqual(expected[0].description, result[0].description)
    }
    
    func testMapDTOToArticleCreatedDate() {
        let articleResponseDTO = data!
        let result = sut!.mapDTOToArticle (articlesResponseDTO: articleResponseDTO)
        XCTAssertEqual(expected[0].createdDate, result[0].createdDate)
    }
    
    func testMapDTOToArticleDuration() {
        let articleResponseDTO = data!
        let result = sut!.mapDTOToArticle (articlesResponseDTO: articleResponseDTO)
        XCTAssertEqual(expected[0].duration, result[0].duration)
    }
    
    func testMapDTOToArticleImage() {
        let articleResponseDTO = data!
        let result = sut!.mapDTOToArticle (articlesResponseDTO: articleResponseDTO)
        XCTAssertEqual(expected[0].image, result[0].image)
    }
    
    func testMapDTOToArticleArray() {
        let articleResponseDTO = data!
        let result = sut!.mapDTOToArticle (articlesResponseDTO: articleResponseDTO)
        XCTAssertEqual(expected.count, result.count)
    }
    
    func testStringToDate() {
        let expected = "Mar 15 2020"
        let dateString = "2020-03-15T18:01:43.000Z"
        let result = sut!.parseStringToDate(dateString: dateString)
        XCTAssertEqual(expected, result)
    }
        
    func testParseMinutesToHoursAndMinutesString() {
        let expected = "4 hrs, 4 mins"
        let duration = 244
        let result = sut!.parseMinutesToString(duration: duration)
        XCTAssertEqual(expected, result)
    }
    
    func testParseMinutesToMinutesString() {
        let expected = "38 mins"
        let duration = 38
        let result = sut!.parseMinutesToString(duration: duration)
        XCTAssertEqual(expected, result)
    }
    
    func testParseMinutesToHourString() {
        let expected = "1 hr"
        let duration = 60
        let result = sut!.parseMinutesToString(duration: duration)
        XCTAssertEqual(expected, result)
    }
    
    func testParseMinutesToHoursString() {
        let expected = "2 hrs"
        let duration = 120
        let result = sut!.parseMinutesToString(duration: duration)
        XCTAssertEqual(expected, result)
    }
    
    func testParseMinutesToEmptyString() {
        let expected = ""
        let duration = 0
        let result = sut!.parseMinutesToString(duration: duration)
        XCTAssertEqual(expected, result)
    }
}
