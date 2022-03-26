import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Product} from "../common/product";
import {map, Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private baseUrl = 'http://0.0.0.0:8080/api'

  constructor(private httpClient: HttpClient) {
  }

  getProductList(): Observable<Product[]> {
    return this.httpClient
      .get<ProductsResponse>(this.baseUrl + '/products')
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
