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
    var expected = [Article(title: "Mac Catalyst with Andy Pereira – Podcast S10 E7", domain: "iOS & Swift", description: "Dru flips the switch on his 50th show with Andy Pereira telling us how easy Catalyst can be. After Dru talks about transitioning from developer to architect. \n", createdDate: "2020-05-20T18:01:43.000Z", duration: 60, image: "https://koenig-media.raywenderlich.com/uploads/2016/02/Logo.png")]
    
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
    
    func testMapDTOToArticleImage() {
        // given
        let articleResponseDTO = data!
        // when
        let result = sut!.mapDTOToArticle (articlesResponseDTO: articleResponseDTO)
        // then
        XCTAssertEqual(expected[0].image, result[0].image)
    }
    
}
