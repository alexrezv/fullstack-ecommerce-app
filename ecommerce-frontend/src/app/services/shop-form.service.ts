import { Injectable } from '@angular/core';
import { map, Observable, of } from "rxjs";
import { HttpClient } from "@angular/common/http";
import { Country } from "../common/country";
import { State } from "../common/state";

@Injectable({
  providedIn: 'root'
})
export class ShopFormService {

  private countriesUrl: string = "http://0.0.0.0:8080/api/countries"
  private statesUrl: string = "http://0.0.0.0:8080/api/states"

  constructor(private httpClient: HttpClient) { }

  getCreditCardMonths(startMonth: number): Observable<number[]> {
    let months: number[] = []
    for (let month = startMonth; month <= 12; month++) {
      months.push(month)
    }
    return of(months)
  }

  getCreditCardYears(): Observable<number[]> {
    let years: number[] = []
    const startYear: number = new Date().getFullYear()
    const endYear: number = startYear + 10
    for (let year = startYear; year <= endYear; year++) {
      years.push(year)
    }
    return of(years)
  }

  getCountries(): Observable<Country[]> {
    return this.httpClient.get<GetResponseCountries>(this.countriesUrl).pipe(
      map(r => r._embedded.countries)
    )
  }

  getStates(countryCode: string): Observable<State[]> {
    const url = `${this.statesUrl}/search/findByCountryCode?code=${countryCode}`
    return this.httpClient.get<GetResponseStates>(url).pipe(
      map(r => r._embedded.states)
    )
  }

}

interface GetResponseCountries {
  _embedded: {
    countries: Country[]
  }
}

interface GetResponseStates {
  _embedded: {
    states: State[]
  }
}
