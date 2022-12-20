//
//  ContentView.swift
//  MLP-1
//
//  Created by Akshay.Crasta on 19/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: PeopleViewModel = PeopleViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.people) { person in
                HStack {
                    Text("Name: ")
                        .fontWeight(.bold)
                    Text(person.name ?? "")
                }
                HStack {
                    Text("Favourite Language ")
                        .fontWeight(.bold)
                    Text(person.language ?? "")
                }
            }
        }
        .onAppear {
            viewModel.getPeopleData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
