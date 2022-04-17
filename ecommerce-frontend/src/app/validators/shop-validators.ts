import {FormControl, ValidationErrors} from "@angular/forms";

export class ShopValidators {

  // TODO: this isn't good coz " a" is still a valid input when minLength = 2
  static notOnlyWhiteSpace(control: FormControl): ValidationErrors | null {
    if (((control.value != null) && (control.value.trim().length === 0))) {
      return {'notOnlyWhiteSpace': true}
    }
    return null
  }

}
