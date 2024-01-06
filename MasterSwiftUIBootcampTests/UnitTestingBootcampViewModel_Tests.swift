//
//  UnitTestingBootcampViewModel_Tests.swift
//  MasterSwiftUIBootcampTests
//
//  Created by Medhat Mebed on 1/6/24.
//

import XCTest
import Combine
@testable import MasterSwiftUIBootcamp

// naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// testing structure: Given, when, then

final class UnitTestingBootcampViewModel_Tests: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()
    
    var viewModel: UnitTestingBootcamoViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestingBootcamoViewModel(isPremium: Bool.random())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func test_UnitTestingBootcampViewModel_isPremium_SHouldBeTrue() {
        // given
        let userIsPremium = true
        // when
        let vm = UnitTestingBootcamoViewModel(isPremium: userIsPremium)
        // then
        XCTAssertTrue(vm.isPremium)
    }

    func test_UnitTestingBootcampViewModel_isPremium_SHouldBeFalse() {
        // given
        let userIsPremium = false
        // when
        let vm = UnitTestingBootcamoViewModel(isPremium: userIsPremium)
        // then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_SHouldBeInjectedValue() {
        // given
        let userIsPremium = Bool.random()
        // when
        let vm = UnitTestingBootcamoViewModel(isPremium: userIsPremium)
        // then
        XCTAssertEqual(vm.isPremium, userIsPremium)
       // XCTAssertFalse(vm.isPremium)
    }
    func test_UnitTestingBootcampViewModel_isPremium_SHouldBeInjectedValue_stress() {
        for x in 0..<100 {
            // given
            let userIsPremium = Bool.random()
            // when
            let vm = UnitTestingBootcamoViewModel(isPremium: userIsPremium)
            // then
            XCTAssertEqual(vm.isPremium, userIsPremium)
           // XCTAssertFalse(vm.isPremium)
        }
    }
    func test_UnitTestingBootcampViewModel_dataArray_ShouldBeEmpty() {
        // given
        
        // when
        let vm = UnitTestingBootcamoViewModel(isPremium: Bool.random())
        // then
       // XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    func test_UnitTestingBootcampViewModel_dataArray_ShouldAddItems() {
        // given
        let vm = UnitTestingBootcamoViewModel(isPremium: Bool.random())
        // when
        vm.addItem(item: UUID().uuidString)
        // then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 1)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        //XCTAssertGreaterThanOrEqual(<#T##expression1: Comparable##Comparable#>, <#T##expression2: Comparable##Comparable#>)
        //XCTAssertLessThanOrEqual(<#T##expression1: Comparable##Comparable#>, <#T##expression2: Comparable##Comparable#>)
        
    }
    func test_UnitTestingBootcampViewModel_dataArray_ShouldNotAddBlankString() {
        // given
        let vm = UnitTestingBootcamoViewModel(isPremium: Bool.random())
        // when
        vm.addItem(item: "")
        // then
        XCTAssertTrue(vm.dataArray.isEmpty)
        
    }
    func test_UnitTestingBootcampViewModel_selectedItem_ShouldStartAsNil() {
        // given
        let vm = UnitTestingBootcamoViewModel(isPremium: Bool.random())
        // when
        vm.selectedItem(item: UUID().uuidString)
        // then
        XCTAssertNil(vm.selectedItem)
    }
    func test_UnitTestingBootcampViewModel_selectedItem_ShouldBeNilWhenSelectedInvalidItem() {
        // given
        let vm = UnitTestingBootcamoViewModel(isPremium: Bool.random())
        // when
        vm.selectedItem(item: UUID().uuidString)
        // then
        XCTAssertNil(vm.selectedItem)
    }
    func test_UnitTestingBootcampViewModel_selectedItem_ShouldBeBeSelected() {
        // given
        let vm = UnitTestingBootcamoViewModel(isPremium: Bool.random())
        // when
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectedItem(item: newItem)
        // then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, newItem)
    }
    func test_UnitTestingBootcampViewModel_saveItem_ShouldThrowErrorItemNotFound() {
        // given
        let vm = UnitTestingBootcamoViewModel(isPremium: Bool.random())
        // when
        
        // then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString)) { error in
            let returnedError = error as? UnitTestingBootcamoViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcamoViewModel.DataError.itemNotFound)
        }
    }
    func test_UnitTestingBootcampViewModel_downloadWIthEscaping_ShouldReturnItem() {
        // given
        let vm = UnitTestingBootcamoViewModel(isPremium: Bool.random())
        // when
        let expectation = XCTestExpectation(description: "should return items after 3 seconds")
        
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        vm.downloadWithEscaping()
        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    func test_UnitTestingBootcampViewModel_downloadWIthCombine_ShouldReturnItem() {
        // given
        let vm = UnitTestingBootcamoViewModel(isPremium: Bool.random())
        // when
        let expectation = XCTestExpectation(description: "should return items after 3 seconds")
        
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        vm.downloadWithCombine()
        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
}
