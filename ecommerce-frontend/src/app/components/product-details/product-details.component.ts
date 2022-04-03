import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from "@angular/router";
import {Product} from "../../common/product";
import {ProductService} from "../../services/product.service";
import {CartService} from "../../services/cart.service";
import {CartItem} from "../../common/cart-item";

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrls: ['./product-details.component.css']
})
export class ProductDetailsComponent implements OnInit {

  product: Product = new Product()

  constructor(private route: ActivatedRoute,
              private productService: ProductService,
              private cartService: CartService) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(() => {
      this.getProduct();
    })
  }

  getProduct() {
    const productId: number = +this.route.snapshot.paramMap.get('id')!

    this.productService.getProduct(productId).subscribe(
      data => this.product = data
    )
  }

  addToCart() {
    this.cartService.addToCart(new CartItem(this.product))
  }

}
