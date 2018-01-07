//  Copyright (c) 2017 Luc Dion
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Quick
import Nimble
import StackLayout
import PinLayout

class SubviewsSpec: QuickSpec {
    override func spec() {
        var viewController: UIViewController!
        
        var stackLayoutView: StackView!
        var label1: UILabel!
        var label2: UILabel!
        var view1: BasicView!
        
        beforeSuite {
            _setUnitTestDisplayScale(3)
        }

        beforeEach {
            viewController = UIViewController()

            stackLayoutView = StackView()
            stackLayoutView.frame = CGRect(x: 0, y: 64, width: 400, height: 600)
            viewController.view.addSubview(stackLayoutView)

            label1 = UILabel()
            label1.backgroundColor = .red
            label1.font = UIFont.systemFont(ofSize: 17)
            label1.numberOfLines = 0
            
            label2 = UILabel()
            label2.font = UIFont.systemFont(ofSize: 17)
            label2.backgroundColor = .green
            label2.numberOfLines = 0
            
            label1.text = "Label 1 Label 1 Label 1 Label 1 "
            label2.text = "Label 2 Label 2 Label 2 Label 2 Label 2 Label 2 Label 2 Label 2 Label 2 Label 2 Label 2 Label 2 Label 2 Label 2 "
            
            view1 = BasicView(text: "View 1", color: .red)
            view1.sizeThatFitsExpectedArea = 400 * 50
        }
        
        //
        // Using addSubview()
        //
        describe("StackLayout using addSubview") {
            it("addSubview") {
                stackLayoutView.justifyContent(.start).alignItems(.stretch).define({ (stack) in
                    stackLayoutView.addSubview(label1)
                    stackLayoutView.addSubview(label2)
                    stackLayoutView.addSubview(view1)
                })
                stackLayoutView.frame = CGRect(x: 0, y: 64, width: 400, height: 600)
                stackLayoutView.layout()

                // Match UIStackView
                expect(stackLayoutView.frame).to(beCloseTo(CGRect(x: 0, y: 64, width: 400, height: 600), within: withinRange))
                expect(label1.frame).to(beCloseTo(CGRect(x: 0, y: 0, width: 400, height: 20.333), within: withinRange))
                expect(label2.frame).to(beCloseTo(CGRect(x: 0, y: 20.333, width: 400, height: 61), within: withinRange))
                expect(view1.frame).to(beCloseTo(CGRect(x: 0, y: 81.333, width: 400, height: 50), within: withinRange))
            }
        }
    }
}
