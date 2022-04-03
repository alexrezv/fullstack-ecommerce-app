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

  getProducts(page: number, pageSize: number): Observable<ProductsResponse> {
    return this.httpClient
      .get<ProductsResponse>(`${this.productsUrl}?page=${page}&size=${pageSize}`);
  }

  getProductsByCategoryId(categoryId: number, page: number, pageSize: number): Observable<ProductsResponse> {
    return this.httpClient
      .get<ProductsResponse>(
        `${this.productsUrl}/search/findByCategoryId?id=${categoryId}&page=${page}&size=${pageSize}`
      );
  }

  getProductsByKeyword(keyword: string, page: number, pageSize: number): Observable<ProductsResponse> {
    return this.httpClient
      .get<ProductsResponse>(
        `${this.productsUrl}/search/findByNameContainingIgnoreCase?name=${keyword}&page=${page}&size=${pageSize}`
      );
  }

  getProduct(productId: number) {
    return this.httpClient.get<Product>(`${this.productsUrl}/${productId}`)
  }

}

interface ProductsResponse {
  _embedded: {
    products: Product[]
  },
  page: {
    number: number,
    size: number,
    totalElements: number,
    totalPages: number
  }
}

interface ProductCategoryResponse {
  _embedded: {
    productCategory: ProductCategory[]
  }
}
