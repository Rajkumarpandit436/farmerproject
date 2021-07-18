<%-- 
    Document   : mail
    Created on : Jun 8, 2021, 10:56:49 AM
    Author     : PANDIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Email Client</title>
    </head>
    <body>
        <h1>Contact Us!!S</h1>
        <div>
            <form action="sendingMailto" method="post">
                <table>
                    <tr>
                        <td>
                            To: <input type="email" name="to" id="clientemail" size="75">
                        </td>
                    </tr>
                    <tr>
                         <td>
                            Subject: <input type="text" name="subject" id="subject" size="75">
                        </td>
                    </tr>
                    <tr>  
                         <td>
                             <textarea name="msg_body" cols="75" rows="6" id="message"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" name="send" id="btnsend">
                                Send
                            </button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
