import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from "@angular/forms";
import { ShopFormService } from "../../services/shop-form.service";
import { Country } from "../../common/country";
import { State } from "../../common/state";
import {ShopValidators} from "../../validators/shop-validators";
import {CartService} from "../../services/cart.service";

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {

  checkoutFormGroup: FormGroup

  countries: Country[] = []
  shippingAddressStates: State[] = []
  billingAddressStates: State[] = []

  // TODO: remove when Stripe is integrated
  creditCardYears: number[] = []
  creditCardMonths: number[] = []

  totalPrice: number = 0
  totalQuantity: number = 0

  constructor(private formBuilder: FormBuilder,
              private shopFormService: ShopFormService,
              private cartService: CartService) { }

  ngOnInit(): void {
    const requiredTwoNotOnlyWhitespace = [Validators.required, Validators.minLength(2), ShopValidators.notOnlyWhiteSpace]
    this.checkoutFormGroup = this.formBuilder.group({
      customer: this.formBuilder.group({
        firstName: new FormControl('', requiredTwoNotOnlyWhitespace),
        lastName: new FormControl('', requiredTwoNotOnlyWhitespace),
        email: new FormControl('',
          [Validators.required, Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]),
      }),
      shippingAddress: this.formBuilder.group({
        country: new FormControl('', [Validators.required]),
        state: new FormControl('', [Validators.required]),
        city: new FormControl('', requiredTwoNotOnlyWhitespace),
        street: new FormControl('', requiredTwoNotOnlyWhitespace),
        zipCode: new FormControl('', requiredTwoNotOnlyWhitespace),
      }),
      billingAddress: this.formBuilder.group({
        country: new FormControl('', [Validators.required]),
        state: new FormControl('', [Validators.required]),
        city: new FormControl('', requiredTwoNotOnlyWhitespace),
        street: new FormControl('', requiredTwoNotOnlyWhitespace),
        zipCode: new FormControl('', requiredTwoNotOnlyWhitespace),
      }),
      creditCard: this.formBuilder.group({
        cardType: new FormControl('', [Validators.required]),
        nameOnCard: new FormControl('', requiredTwoNotOnlyWhitespace),
        cardNumber: new FormControl('', [Validators.required, Validators.pattern('[0-9]{16}')]),
        securityCode: new FormControl('', [Validators.required, Validators.pattern('[0-9]{3}')]),
        expirationMonth: [''],
        expirationYear: ['']
      })
    })

    this.shopFormService.getCountries().subscribe(
      data => this.countries = data
    )

    // sub on months and years
    // TODO: remove when Stripe is integrated
    const currentMonth: number = new Date().getMonth() + 1
    this.shopFormService.getCreditCardMonths(currentMonth).subscribe(
      data => this.creditCardMonths = data
    )
    this.shopFormService.getCreditCardYears().subscribe(
      data => this.creditCardYears = data
    )

    this.reviewCartTotals()
  }

  reviewCartTotals() {
    this.cartService.totalPrice.subscribe(
      totalPrice => this.totalPrice = totalPrice
    )

    this.cartService.totalQuantity.subscribe(
      totalQuantity => this.totalQuantity = totalQuantity
    )
  }

  getStates(formGroupName: string) {
    const formGroup = this.checkoutFormGroup.get(formGroupName)
    const countryCode = formGroup?.value.country.code

    this.shopFormService.getStates(countryCode).subscribe(
      data => {
        if (formGroupName === 'shippingAddress') {
          this.shippingAddressStates = data
        } else {
          this.billingAddressStates = data
        }
        formGroup?.get('state')?.setValue(data[0])
      }
    )
  }

  copyShippingAddressToBillingAddress(event: any) {
    if (event.target.checked) {
      this.checkoutFormGroup.controls['billingAddress']
        .setValue(this.checkoutFormGroup.controls['shippingAddress'].value)
      this.billingAddressStates = this.shippingAddressStates
    }
    else {
      this.checkoutFormGroup.controls['billingAddress'].reset()
      this.billingAddressStates = []
    }
  }

  // TODO: remove when Stripe is integrated
  handleMonthsAndYears() {
    const creditCardFormGroup = this.checkoutFormGroup.get('creditCard')
    const currentYear: number = new Date().getFullYear()
    const selectedYear: number = Number(creditCardFormGroup?.value.expirationYear)
    let startMonth: number
    if (currentYear === selectedYear) {
      startMonth = new Date().getMonth() + 1
    } else {
      startMonth = 1
    }
    this.shopFormService.getCreditCardMonths(startMonth).subscribe(
      data => this.creditCardMonths = data
    )
  }

  onSubmit() {
    if (this.checkoutFormGroup.invalid) {
      this.checkoutFormGroup.markAllAsTouched()
    }
    console.log("Handling the submit button");
    console.log(this.checkoutFormGroup.get('customer')?.value);
    console.log("The email address is " + this.checkoutFormGroup.get('customer')?.value.email);
  }

  get firstName() { return this.checkoutFormGroup.get('customer.firstName') }
  get lastName() { return this.checkoutFormGroup.get('customer.lastName') }
  get email() { return this.checkoutFormGroup.get('customer.email') }

  get shippingAddressCountry() { return this.checkoutFormGroup.get('shippingAddress.country'); }
  get shippingAddressState() { return this.checkoutFormGroup.get('shippingAddress.state'); }
  get shippingAddressCity() { return this.checkoutFormGroup.get('shippingAddress.city'); }
  get shippingAddressStreet() { return this.checkoutFormGroup.get('shippingAddress.street'); }
  get shippingAddressZipCode() { return this.checkoutFormGroup.get('shippingAddress.zipCode'); }

  get billingAddressCountry() { return this.checkoutFormGroup.get('billingAddress.country'); }
  get billingAddressState() { return this.checkoutFormGroup.get('billingAddress.state'); }
  get billingAddressCity() { return this.checkoutFormGroup.get('billingAddress.city'); }
  get billingAddressStreet() { return this.checkoutFormGroup.get('billingAddress.street'); }
  get billingAddressZipCode() { return this.checkoutFormGroup.get('billingAddress.zipCode'); }

  // TODO: remove when Stripe is integrated
  get creditCardType() { return this.checkoutFormGroup.get('creditCard.cardType'); }
  get creditCardNameOnCard() { return this.checkoutFormGroup.get('creditCard.nameOnCard'); }
  get creditCardNumber() { return this.checkoutFormGroup.get('creditCard.cardNumber'); }
  get creditCardSecurityCode() { return this.checkoutFormGroup.get('creditCard.securityCode'); }

}
