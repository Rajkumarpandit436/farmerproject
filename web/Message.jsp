<%
    String message=(String)session.getAttribute("msg");
    if(message!=null){
        
        
        
        session.removeAttribute("msg");
    }

%>