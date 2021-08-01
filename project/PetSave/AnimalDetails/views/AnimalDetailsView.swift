/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

//Chapter 10: Animation here while data is loading
//Chapter 10: Animate image of pet to full screen
//Chapter 10: Custom control for ranking

struct AnimalDetailsView: View {
  let animal: Animal
  
  var body: some View {
    ScrollView {
      LazyVStack {
        AnimalHeaderView(animal: animal)
        AnimalDetailRow(animal: animal)
        VStack(alignment: .leading, spacing: 24) {
          if let description = animal.description {
            VStack(alignment: .leading) {
              Text("Details")
                .font(.title2)
              Text(description)
            }
          }
          AnimalContactsView(animal: animal)
          AnimalLocationView(animal: animal)
        }
        .padding(.horizontal)
        .padding(.bottom)
      }
    }
    .navigationTitle(animal.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct AnimalsView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        AnimalDetailsView(animal: Animal.mock[0])
      }
      
      NavigationView {
        AnimalDetailsView(animal: Animal.mock[0])
      }
      .previewDevice("iPhone SE (2nd generation)")
    }
  }
}