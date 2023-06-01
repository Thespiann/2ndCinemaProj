<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thespian - Log In</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
<div class="full-page" id="full-page">
    <div id="login-form" class="login-page">
        <div class="form-box">
            <div id="button" class="button-box">
                <div id="btn"></div>
                <button type="button" id="loginbtn" onclick="logi()" class="btn1">Log In</button>
                <button type="button" id="registerbtn" onclick="reg()" class="btn1" style="color: #C8D3E6;">Register</button>
            </div>
            <h1>Thespian Cinemas</h1>
            <form id="login" class="user_input_login" action="LoginServlet" method="POST">
                <input type="text" class="input" placeholder="Username" required name="loginUsername">
                <input type="password" class="input" placeholder="Password" required id="psl" name="loginPassword"><br><br>
                <button type="button" onclick="showpslogin()" class="btn2" id="psbl">Show Password</button><br><br>
                <button type="submit" class="sb">Log In</button>
            </form>
            <form id="register" class="user_input_reg" action="RegistrationServlet" method="POST"><br><br><br>
                <input type="text" id="regusername" class="input" placeholder="Enter username" required name="regUsername">
                <input type="text" id="firstname" class="input" placeholder="Enter first name" required name="firstName">
                <input type="text" id="email" class="input" placeholder="Enter email" required name="email">
                <input type="password" id="ps"  class="input" placeholder="Enter password" required name="regPassword">
                <h2>Should include at least 5 characters, letters, and numbers.</h2>
                <button type="button" onclick="showps()" class="btn2" id="psb">Show Password</button>
                <input type="checkbox" class="chk" required><span>I agree to the terms and conditions</span>
                <button type="submit" class="sb">Register</button>
            </form>
        </div>
    </div>

</div>
<script>
    var status= document.getElementById("status").value;
    if(status== "Login failed. There is no such username that matches this password."){
        alert(status);
        document.getElementById("status").value = "";
    }
    if(status== "Register failed. Username is already taken, please try again."){
        alert(status);
        document.getElementById("status").value = "";
    }
    if(status== "Insert failed. There is no such username for a content admin."){
        alert(status);
        document.getElementById("status").value = "";
    }
</script>
<script>
    //styling and movement of form
    var x=document.getElementById('login');
    var y=document.getElementById('register');
    var z=document.getElementById('btn');
    var l=document.getElementById('loginbtn');
    var r=document.getElementById('registerbtn');
    var ps=document.getElementById ('ps');
    var btn=document.getElementById('psb');
    var btnl=document.getElementById('psbl');
    function reg()
    {
        x.style.left='-400px';
        l.style.color='#C8D3E6';
        r.style.color='#12264BC1';
        y.style.left='50px';
        z.style.left='110px';
    }
    function logi()
    {
        x.style.left='50px';
        y.style.left='450px';
        r.style.color='#C8D3E6';
        l.style.color='#12264BC1';
        z.style.left='0px';
    }
    function showps()
    {
       if(ps.type=='password'){
           ps.type='text';
           btn.textContent="Hide Password";
       }else{
           ps.type='password';
           btn.textContent="Show Password";
       }

    }
    function showpslogin()
    {
        if(psl.type=='password'){
            psl.type='text';
            btnl.textContent="Hide Password";
        }else{
            psl.type='password';
            btnl.textContent="Show Password";
        }

    }

</script>
<script src="bgchange.js"></script>

</body>
</html>
