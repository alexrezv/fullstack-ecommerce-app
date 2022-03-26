import {Component, OnInit} from '@angular/core';
import {Product} from "../../common/product";
import {ProductService} from "../../services/product.service";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {

  products: Product[]

  constructor(
    private productService: ProductService,
    private route: ActivatedRoute
  ) {
  }

  ngOnInit(): void {
    this.route.paramMap.subscribe(() =>
      this.listProducts().subscribe(
        data => {
          this.products = data
        }
      )
    )
  }

  listProducts() {
    if (this.route.snapshot.paramMap.has('id')) {
      return this.productService.getProductListByCategoryId(+this.route.snapshot.paramMap.get('id')!)
    }
    return this.productService.getProductList()
  }

}
