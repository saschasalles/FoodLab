//
//  FavoritesView.swift
//  FoodLab
//
//  Created by Maxime Lestage on 18/01/2023.
//

import SwiftUI

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

struct FavoritesView: View {
    @State var listItems = data2

    var body: some View {
        NavigationView {
            List {
                ForEach(listItems, id: \.self) { item  in
                    HStack {
                        Image(item.imagePath)
                            .resizable()
                            .frame(maxWidth: 50, maxHeight: 40)
                            .cornerRadius(3)
                        Text(item.name)
                    }
                }.onDelete(perform: self.deleteItem)
            }.navigationBarTitle(Text("Favorites"))
        }
    }

    private func deleteItem(at indexSet: IndexSet) {
        self.listItems.remove(atOffsets: indexSet)
    }
}



