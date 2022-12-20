//
//  ViewModel.swift
//  MLP-1
//
//  Created by Akshay.Crasta on 19/12/22.
//

import Foundation

class PeopleViewModel: ObservableObject {
    @Published var people: [Person] = []
    
    let urlString = "https://gist.githubusercontent.com/russellbstephens/9e528b12fd1a45a7ff4e4691adcddf10/raw/5ec8ce76460e8f29c9b0f99f3bf3450b06696482/people.json"
   
    func getPeopleData() {
        NetworkManager.shared.getPeopleData(urlString: urlString) { result, error in
            guard let result = result, error == .noError else { return }
            self.people = result
        }
    }
}
