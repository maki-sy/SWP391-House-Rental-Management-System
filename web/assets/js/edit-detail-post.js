

function Validator(options) {
    var formElement = document.querySelector(options.form)
    var submitElement = formElement.querySelector('#btn-submit')


    function validate(inputElement, rule) {
        var errorMessage = rule.test(inputElement);
        var errorElement = inputElement.parentElement.querySelector(options.errorSelector);

        if (errorMessage) {
            inputElement.classList.remove("is-valid");
            inputElement.classList.add("is-invalid");
            errorElement.innerText = errorMessage;
        }
        else {
            inputElement.classList.remove("is-invalid");
            inputElement.classList.add("is-valid");
            errorElement.innerText = '';


        }
        var isFormValid = true
        options.rules.forEach((rule) => {
            var inputElement = formElement.querySelector(rule.selector);
            var isValid = rule.test(inputElement)

            if (isValid) {
                isFormValid = false;
            }
        })


        if (isFormValid) {
            submitElement.classList.add('btn-primary')
            submitElement.removeAttribute('disabled')
        }
        else {
            submitElement.classList.remove('btn-primary')
            submitElement.setAttribute("disabled", "");
        }


        return !errorMessage
    }

    options.rules.forEach((rule) => {
        // xu ly submit
        var inputElement = formElement.querySelector(rule.selector);



        // xu ly Blur
        inputElement.onblur = () => {
            validate(inputElement, rule);
        }

        // xu ly nguoi dung trong khi nhap input
        inputElement.oninput = () => {
            var errorElement = inputElement.parentElement.querySelector(options.errorSelector);
            inputElement.classList.remove("is-invalid");
            inputElement.classList.remove("is-valid");
            errorElement.innerText = '';
        }
    })
}

// Nguyen tac cua cac rule
// Khi co loi => Tra ra message loi
// Khi hop le => khong tra ra cai gi
isRequired = (inputElement) => {
    var value = inputElement.value.trim();
    return value ? undefined : 'Please enter this field';

}

isNumber = (inputElement) => {
    var value = inputElement.value;
    var numberRegex = /^\d+$/;
    return value.match(numberRegex) ? undefined : 'Please enter digits only'
}

isFloatNumber = (inputElement) => {
    var value = inputElement.value;
    var numberRegex = /^[+-]?\d+(\.\d+)?$/;
    return value.match(numberRegex) ? undefined : 'Please enter digits only'
}

isNumberOutOfRange = (inputElement, min, max) => {
    var value = inputElement.value
    if (value < min) {
        return 'Please enter a number greater than  ' + min
    } else if (value > max) {
        return 'Please enter a smaller number'
    } else {
        return undefined
    }
}

isTextOutOfRange = (inputElement, min, max) => {
    var value = inputElement.value.trim().length
    if (value < min) {
        return 'Please enter at least ' + min + ' characters'
    } else if (value > max) {
        return 'Please enter less than ' + max + ' characters'
    } else {
        return undefined
    }
}

isNumberImageOutOfRange = (inputElement, min, max) => {
    var selectedFiles = inputElement.files;

    var value = selectedFiles.length
    if (value < min) {
        return 'Please insert at least ' + min + ' photo'
    } else if (value > max) {
        return 'Please insert less than ' + max + ' characters'
    } else {
        return undefined
    }
}

Validator.checkTextFields = function (selector, min, max) {
    return {
        selector: selector,
        test: function (inputElement) {
            var isRequiredB = isRequired(inputElement)
            var isTextOutOfRangeB = isTextOutOfRange(inputElement, min,)
            if (isRequiredB) {
                return isRequiredB
            }
            if (isTextOutOfRangeB) {
                return isTextOutOfRangeB
            }

            return undefined

        }
    }
}


Validator.checkImageFields = function (selector, min, max) {
    return {
        selector: selector,
        test: function (inputElement) {
            var isRequiredB = isRequired(inputElement)
            var isNumberImageOutOfRangeB = isNumberImageOutOfRange(inputElement, min, max)
            if (isRequiredB) {
                return isRequiredB
            }
            if (isNumberImageOutOfRangeB) {
                return isNumberImageOutOfRangeB
            }
            return undefined
        }
    }
}

Validator.checkDigitFields = function (selector, min, max) {
    return {
        selector: selector,
        test: function (inputElement) {
            var isRequiredB = isRequired(inputElement)
            var isNumberB = isNumber(inputElement)
            var isNumberOutOfRangeB = isNumberOutOfRange(inputElement, min, max)
            if (isRequiredB) {
                return isRequiredB
            }
            if (isNumberB) {
                return isNumberB
            }
            if (isNumberOutOfRangeB) {
                return isNumberOutOfRangeB
            }
            return undefined
        }

    }
}

Validator.checkFloatFields = function (selector, min, max) {
    return {
        selector: selector,
        test: function (inputElement) {
            var isRequiredB = isRequired(inputElement)
            var isNumberB = isFloatNumber(inputElement)
            var isNumberOutOfRangeB = isNumberOutOfRange(inputElement, min, max)
            if (isRequiredB) {
                return isRequiredB
            }
            if (isNumberB) {
                return isNumberB
            }
            if (isNumberOutOfRangeB) {
                return isNumberOutOfRangeB
            }
            return undefined
        }

    }
}