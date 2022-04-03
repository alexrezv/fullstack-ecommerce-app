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

  products: Product[] = []

  pageNumber: number = 1
  pageSize: number = 12
  totalElements: number = 0

  private categoryId: number = 0
  private keyword: string = ''

  constructor(
    private productService: ProductService,
    private route: ActivatedRoute
  ) {
  }

  ngOnInit(): void {
    this.route.paramMap.subscribe(() =>
      this.listProducts()
    )
  }

  listProducts() {
    this.getProducts().subscribe(
      data => {
        this.products = data._embedded.products
        this.pageNumber = data.page.number + 1
        this.pageSize = data.page.size
        this.totalElements = data.page.totalElements
      }
    )
  }

  getProducts() {
    if (this.route.snapshot.paramMap.has('id')) {
      let newCategoryId = +this.route.snapshot.paramMap.get('id')!
      if (this.categoryId != newCategoryId) {
        this.categoryId = newCategoryId
        this.pageNumber = 1
      }
      return this.productService.getProductsByCategoryId(this.categoryId, this.pageNumber - 1, this.pageSize)
    }
    if (this.route.snapshot.paramMap.has('keyword')) {
      let newKeyword = this.route.snapshot.paramMap.get('keyword')!
      if (this.keyword != newKeyword) {
        this.keyword = newKeyword
        this.pageNumber = 1
      }
      return this.productService.getProductsByKeyword(this.keyword, this.pageNumber - 1, this.pageSize)
    }
    return this.productService.getProducts(this.pageNumber - 1, this.pageSize)
  }

  updatePageSize(pageSize: number) {
    this.pageSize = pageSize;
    this.pageNumber = 1;
    this.listProducts();
  }

}
