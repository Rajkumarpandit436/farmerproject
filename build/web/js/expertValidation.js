function expertValid(){
    var name=document.expertform.expertName.value;
    var email=document.expertform.expertEmail.value;
    var contact=document.expertform.expertPhone.value;
    var pass=document.expertform.password.value;
    var gender=document.expertform.expertGender.value;
    var prof=document.expertform.profession.value;
    var docId=document.expertform.docId.value;
    var docnum=document.expertform.epertDocNum.value;
    var docfile=document.expertform.expertDocumentfile.value;
    var state=document.expertform.expertState.value;
    var dist=document.expertform.expertDist.value;
    var region=document.expertform.expertRegion.value;
    var pin=document.expertform.expertPin.value;
    
    if((name==="") || (name==='null')){
        document.getElementById("name_error").innerHTML="** invalid name";
        return false;
    }else if(email===""){
        document.getElementById("name_error").innerHTML="** email can't be null";
        return false;
    }else if((contact==="")||(isNaN(contact))||(contact>10)||(contact<10)||(contact.chaAt(0)!=='9')||(contact.chaAt(0)!=='8')||(contact.chaAt(0)!=='7')||(contact.chaAt(0)!=='6')){
        document.getElementById("contact_error").innerHTML="** invalid number or start with 9,8,7 and 6";
        return false;
    }else if((pass==="")||(pass<8)){
        document.getElementById("pass_error").innerHTML="** password can't be null or should not be less than 8 digit";
        return false;
    }else if(gender===""){
        document.getElementById("gender_error").innerHTML="** gender can't be null";
        return false;
    }else if(prof===""){
        document.getElementById("profession_error").innerHTML="** profession can't be null";
        return false;
    }else if(docId===""){
        document.getElementById("docId_error").innerHTML="** docId can't be null";
        return false;
    }else if(docnum===""){
        document.getElementById("docnum_error").innerHTML="** docnum can't be null";
        return false;
    }else if(docfile===""){
        document.getElementById("file_error").innerHTML = "** file can't be blank";
        return false;
    }else if(state===""){
        document.getElementById("state_error").innerHTML = "** state can't be blank";
        return false;
    }else if(dist===""){
        document.getElementById("dist_error").innerHTML = "** district can't be blank";
        return false;
    }else if(region===""){
        document.getElementById("region_error").innerHTML = "** region can't be blank";
        return false;
    }else if((pin==="")||(isNaN(pin))){
        document.getElementById("pin_error").innerHTML = "** ivalid can't be blank";
        return false;
    }
    
}


