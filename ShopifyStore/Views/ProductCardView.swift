//
//  ProductView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

/// Display a single product card
struct ProductCardView: View {
    @State var productCard: ProductCard
    
    var body: some View {
        HStack() {
            /// Display the downloaded image
            Image(uiImage: productCard.image)
                .resizable()
                .frame(width: 100, height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1))
                .foregroundColor(.black)
                .padding()
                .padding(.horizontal, -5)
            
            /// Product title
            VStack(alignment: .leading, spacing: 2) {
                Text(productCard.title)
                    .foregroundColor(.primary)
                    .font(.system(size: 14, weight: .heavy, design: .default))
                
                /// Product vendor name
                Text("By: \(productCard.vendorName)")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.secondary)
                
                /// Product price
                Text("CDN " + String(format: "%.2f", productCard.price))
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .foregroundColor((Color(.sRGB, red: 174/255, green: 22/255, blue: 0/255, opacity: 0.75)))
                
                /// Product inventory stock
                Text("In stock: \(productCard.quantity)")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            Spacer()
            
            //            if productCard.isFavourite {
            //                Image(systemName: productCard.isFavourite ? "heart.fill" : "heart")
            //                    .font(.title)
            //                    .padding()
            //                    .foregroundColor(.blue)
            //            } else {
            //                Image(systemName: "heart")
            //                    .font(.title)
            //                    .padding()
            //                    .foregroundColor(.blue)
            //            }
            
            /// Get button
            Text("GET")
                .fontWeight(.bold)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .foregroundColor(.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 2))
                .padding(.horizontal)
        }.padding(10)
    }
}

//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCardView(productCard: ProductCard(withId: 10, withtitle: "Concrete Clock", andVendorName: "Curry Banca", andPrice: 34.5, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true))
//    }
//}
