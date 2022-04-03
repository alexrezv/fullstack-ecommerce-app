import { Injectable } from '@angular/core';
import {CartItem} from "../common/cart-item";
import {Subject} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class CartService {

  cartItems: CartItem[] = []

  totalPrice: Subject<number> = new Subject<number>()
  totalQuantity: Subject<number> = new Subject<number>()

  addToCart(cartItem: CartItem) {
    let existingItem = this.cartItems.find(it => it.id === cartItem.id)

    if (existingItem) {
      existingItem.quantity++
    } else {
      this.cartItems.push(cartItem)
    }

    this.computeCartTotals()
  }

  computeCartTotals() {
    this.totalPrice.next(
      this.cartItems
        .map(item => item.unitPrice * item.quantity)
        .reduce((a,b) => a + b)
    )

    this.totalQuantity.next(
      this.cartItems
        .map(item => item.quantity)
        .reduce((a,b) => a + b)
    )
  }
}
