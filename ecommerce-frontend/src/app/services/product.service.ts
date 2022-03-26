import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Product} from "../common/product";
import {map, Observable} from "rxjs";
import {ProductCategory} from "../common/product-category";

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private productsUrl = 'http://0.0.0.0:8080/api/products'
  private categoryUrl = 'http://0.0.0.0:8080/api/product-category'

  constructor(private httpClient: HttpClient) {
  }

  getProductCategories(): Observable<ProductCategory[]> {
    return this.httpClient
      .get<ProductCategoryResponse>(this.categoryUrl)
      .pipe(
        map(response => response._embedded.productCategory)
      );
  }

  getProducts(): Observable<Product[]> {
    return this.httpClient
      .get<ProductsResponse>(this.productsUrl)
      .pipe(
        map(response => response._embedded.products)
      );
  }

  getProductsByCategoryId(categoryId: number): Observable<Product[]> {
    return this.httpClient
      .get<ProductsResponse>(`${this.productsUrl}/search/findByCategoryId?id=${categoryId}`)
      .pipe(
        map(response => response._embedded.products)
      );
  }

  getProductsByKeyword(keyword: string): Observable<Product[]> {
    return this.httpClient
      .get<ProductsResponse>(`${this.productsUrl}/search/findByNameContaining?name=${keyword}`)
      .pipe(
        map(response => response._embedded.products)
      );
  }

}

interface ProductsResponse {
  _embedded: {
    products: Product[]
  }
}

interface ProductCategoryResponse {
  _embedded: {
    productCategory: ProductCategory[]
  }
}
