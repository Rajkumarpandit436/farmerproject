function Validateform() {
    var user_type = document.myform.user_type.value;
    var name = document.myform.user_name.value;
    var contact = document.myform.user_contact.value;
    var email = document.myform.user_email.value;
    var password = document.myform.user_password.value;
    var gender = document.myform.gender.value;
    var state = document.myform.state.value;
    var dist = document.myform.district.value;
    var pincode = document.myform.pincode.value;

    if (user_type === "") {
        document.getElementById("user_type_error").innerHTML = "please choose user_type";
        return false;
    }else if(user_type==='...Choose...'){
        document.getElementById("user_type_error").innerHTML = "please choose user_type";
        return false;     
    } else if (name === "") {
        document.getElementById("name_error").innerHTML = "please name can't be blank";
        return false;
    } else if (name === "null") {
        document.getElementById("name_error").innerHTML = "name can't null";
        return false;
    } else if (contact === "") {
        document.getElementById("contact_error").innerHTML = "contact field can't blank";
        return false;
    } else if (isNaN(contact)) {
        document.getElementById("contact_error").innerHTML = "contact field accept only number";
        return false;
    } else if (contact.length < 10) {
        document.getElementById("contact_error").innerHTML = "contact no. should not be less than 10 digit";
        return false;
    } else if (contact.length > 10) {
        document.getElementById("contact_error").innerHTML = "contact no. should not be greater than 10 digit";
        return false;
    } else if ((contact.charAt(0) !== '9') && (contact.charAt(0) !== '8') && (contact.charAt(0) !== '7') && (contact.charAt(0) !== '6')) {
        document.getElementById("contact_error").innerHTML = "contact no. start with 9,8,7 and 6";
        return false;
    } else if (email === "") {
        document.getElementById("email_error").innerHTML = "email field can't be blank";
        return false;
    } else if (email.indexOf('@') < 0) {
        document.getElementById("email_error").innerHTML = "Invalid @ position";
        return false;
    } else if (email.charAt(email.length() - 4) !== '.') {
        document.getElementById("email_error").innerHTML = "** invalid dot(.) position";
        return false;
    } else if (email.charAt(email.lenth() - 3) !== '.') {
        document.getElementById("email_error").innerHTML = "** invalid dot(.) position";
        return false;
    } else if (password === "") {
        document.getElementById("pass_error").innerHTML = "** password field can't be blank";
        return false;
    } else if (password < 8) {
        document.getElementById("pass_error").innerHTML = "** password should be less than 8 character";
        return false;
    } else if (gender === "") {
        document.getElementById("gender_error").innerHTML = "** please select gender";
        return false;
    } else if (state === "") {
        document.getElementById("state_error").innerHTML = "** state can't be blank";
        return false;
    } else if (NaN(state)) {
        document.getElementById("state_error").innerHTML = "** only character allow";
        return false;
    } else if (dist === "") {
        document.getElementById("dist_error").innerHTML = "** district can't be blank";
        return false;
    } else if (NaN(dist)) {
        document.getElementById("dist_error").innerHTML = "** only character allow";
        return false;
    } else if (isNan(pincode)) {
        document.getElementById("pin_error").innerHTML = "** only number allow here";
        return false;
    } else if (pincode > 6) {
        document.getElementById("pin_error").innerHTML = "** pincode should not be greater than 6 digit";
        return false;
    } else if (pincode < 6) {
        document.getElementById("pin_error").innerHTML = "** pincode should not be greater than 6 digit";
        return false;
    }
}