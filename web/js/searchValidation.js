function validateSearch(){
    var search = myform.search.value;
    
    if(search == null || search == ""){
        alert("please fill the input field to be search");
    return false;
    }else{
        return true;
    }
        
    
}

