//
//  PostDetailModelTest.swift
//  MemeLogTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

@testable import MemeLog
import XCTest

class PostDetailModelTest: XCTestCase {
    var postDetailModel: PostDetailModel!
    let response = Post.stub1

    func testCreateViewModel() {
        // Given
        let dep = PostDetailModel.Dependency(storage: MockPostListStorage(initialValue: []))
        let context = PostDetailModel.Context(post: response)
        postDetailModel = PostDetailModel(context: context, dep: dep)

        // When
        let vm = postDetailModel.createViewModel()

        // Then
        switch response.type {
        case .image(let url):
            let expectedResult = PostDetailView.ViewModel(imageURL: url, title: response.title ?? "")
            XCTAssertEqual(vm, expectedResult)
        default:
            XCTFail()
        }
    }

    func testToggleWhenInitiallyTrue() {
        // Given
        let storage = MockPostListStorage(initialValue: [response])
        let dep = PostDetailModel.Dependency(storage: storage)
        let context = PostDetailModel.Context(post: response)
        postDetailModel = PostDetailModel(context: context, dep: dep)

        // When
        postDetailModel.toggleFavorite()

        // Then
        XCTAssertEqual(storage.removeCallCounter, 1)
        XCTAssertEqual(storage.addCallCounter, 0)
    }

    func testToggleWhenInitiallyFalse() {
        // Given
        let storage = MockPostListStorage(initialValue: [])
        let dep = PostDetailModel.Dependency(storage: storage)
        let context = PostDetailModel.Context(post: response)
        postDetailModel = PostDetailModel(context: context, dep: dep)

        // When
        postDetailModel.toggleFavorite()

        // Then
        XCTAssertEqual(storage.removeCallCounter, 0)
        XCTAssertEqual(storage.addCallCounter, 1)
    }
}
