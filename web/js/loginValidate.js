function loginValidate(){
   var email=document.myform.email.value;
   var password=document.myform.password.value;
   
   if(email==null || email==""){
       alert("email field can't be blank");
       return false;
   }
   else if(password.length<8){
       alert("password must be at least 8 character long");
       return false;
   }
}


