//
//  OrderView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-04-22.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ShoppingCartView: View {
    
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView {
            
            if shoppingCart.items.isEmpty {

                VStack(alignment: .center) {
                    Text("Your Shopping Cart is Empty. Please Add items to your cart.")
                }
                
                .navigationBarTitle("Your Shopping Cart")
                
            } else {
                VStack {
                    List {
                        /// Creating a list of products added to the shopping cart
                        ForEach(shoppingCart.items, id: \.self) { product in
                            ProductCardView(productCard: product, isShoppingCartView: true)
                        }
                            /// Swipe to remove items from the shopping cart
                            .onDelete(perform: deleteItems)
                    }
                        
                        /// Edit button to remove items from list
                        .navigationBarItems(trailing: EditButton())
                        .navigationBarTitle("Your Shopping Cart")
                    
                    
                    ZStack {
                        /// Move to the checkout view
                        NavigationLink(destination: CheckoutView(), tag: 1, selection: $action ) { EmptyView() }
                        
                        /// Checkout total button - returns the total price
                        Button(action: {
                            self.action = 1
                        }, label: {
                            /// Call function to recieve total price
                            Text("Checkout Total: $\(shoppingCart.getTotalPrice(), specifier: "%.2f")")
                                .foregroundColor(.white)
                                .font(.headline)
                                .fontWeight(.bold)
                                .frame(width: 300, height: 50)
                                .background(Color(.sRGB, red: 1/255, green: 128/255, blue: 96/255, opacity: 0.5))
                                .cornerRadius(18)
                                .padding(.vertical, 15)
                        })
                    }
                }
            }
            
        }.onAppear {
            self.action = 0
        }
    }
    /// Removes an item from the shopping cart
    func deleteItems(at offsets: IndexSet) {
        shoppingCart.items.remove(atOffsets: offsets)
    }
}

struct ShoppingCartView_Previews: PreviewProvider {
    static let order = ShoppingCart()
    static var previews: some View {
        ShoppingCartView().environmentObject(order)
    }
}