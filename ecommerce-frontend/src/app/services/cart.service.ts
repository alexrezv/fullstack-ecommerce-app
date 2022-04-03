import { Injectable } from '@angular/core';
import {CartItem} from "../common/cart-item";
import {BehaviorSubject, Subject} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class CartService {

  cartItems: CartItem[] = []

  totalPrice: Subject<number> = new BehaviorSubject<number>(0)
  totalQuantity: Subject<number> = new BehaviorSubject<number>(0)

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
        .reduce((a,b) => a + b, 0)
    )

    this.totalQuantity.next(
      this.cartItems
        .map(item => item.quantity)
        .reduce((a,b) => a + b, 0)
    )
  }

  decrementQuantity(cartItem: CartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--
      this.computeCartTotals()
    }
  }

  removeItem(cartItem: CartItem) {
    const itemIdx = this.cartItems.findIndex(it => it.id === cartItem.id)
    if (itemIdx > -1) {
      this.cartItems.splice(itemIdx, 1)
      this.computeCartTotals()
    }
  }

}
