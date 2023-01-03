<%@ page import="vn.edu.hcmuaf.fit.beans.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.User" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<style>
    .row .form-group .form-control {
        font-size: 16px;
    }
    .align-items-end .row_input .col_addprod {
        flex: auto;
        margin-top: 8px;
        position: relative;
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
    }
    .edit_formUser {
        height: 500%;
        width: 100%;
        background: rgba(0, 0, 0, 0.73);
        position: absolute;
        z-index: 1500;
        top: 0;
        display: none;
    }
    .edit_formUser .ftco-section {
        padding: 3rem;
    }

    .edit_formUser .cen-div {
        margin: auto;
        background: #f1f1f1;
        width: 50%;
        margin-top:5%;
        border-radius: 5px;
    }

    .btn_huy_update input {
        border-radius: 5px;
        background: #7fad39;
        border: none;
        padding: 4px 20px;
        color: white;
    }

    .btn_huy_update input:last-child {
        margin-left: 20px;
    }
    .edit_formUser textarea {
        min-height: 8rem;
    }
    input {
        border: 1px solid transparent;
        background-color: #f1f1f1;
        padding: 10px;
        font-size: 16px;
    }

    input[type=text] {
        background-color: #f1f1f1;
        width: 100%;
    }

    input[type=submit] {
        background-color: DodgerBlue;
        color: #fff;
        cursor: pointer;
    }

    .autocomplete-items {
        position: absolute;
        border: 1px solid #d4d4d4;
        border-bottom: none;
        border-top: none;
        z-index: 99;
        /*position the autocomplete items to be the same width as the container:*/
        top: 100%;
        left: 0;
        right: 0;
    }

    .autocomplete-items div {
        padding: 10px;
        cursor: pointer;
        background-color: #fff;
        border-bottom: 1px solid #d4d4d4;
    }

    /*when hovering an item:*/
    .autocomplete-items div:hover {
        background-color: #e9e9e9;
    }

    /*when navigating through the items using the arrow keys:*/
    .autocomplete-active {
        background-color: DodgerBlue !important;
        color: #ffffff;
    }
</style>
<head>
    <title>BHNFoods</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="cssHeaderFooter/styleHAndF.css">
</head>
<%User user= (User) session.getAttribute("auth");
    request.setAttribute("user", user);
    String idU = user != null? user.getIdUser() : "null";
    int sumCart = user == null ? 0 : (int) ProductService.getInstance().sumAmount(ProductService.getInstance().getListCart(idU));
%>

<div class="py-1 bg-primary">
    <div class="container">
        <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
            <div class="col-lg-12 d-block">
                <div class="row d-flex">
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                                class="fa-solid fa-phone"></span></div>
                        <span class="text">+0779807028</span>
                    </div>
                    <div class="col-md pr-4 d-flex topper align-items-center" style="text-transform: none">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span
                                class="fa-sharp fa-solid fa-paper-plane"></span></div>
                        <span class="text">BHNFoods@gmail.com</span>
                    </div>
                    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                        <span class="text">Giao trả hàng trong 3-5 ngày làm việc<br>và trả hàng miễn phí</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="http://localhost:8080/BHNFoods/index?idUser=<%=idU%>">BHNFoods</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Sản Phẩm
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="http://localhost:8080/BHNFoods/index?idUser=<%=idU%>" class="nav-link">Trang chủ</a></li>
                <li class="nav-item active"><a href="http://localhost:8080/BHNFoods/ListProduct?kind=0&page=1&idUser=<%=idU%>" class="nav-link">Sản
                    phẩm</a></li>
                <li class="nav-item active"><a href="http://localhost:8080/BHNFoods/discount.jsp" class="nav-link">Mã giảm giá</a></li>
                <li class="nav-item cta cta-colored find">
                    <form action="/BHNFoods/Search"method="post" style="display: flex"><input value="<%=request.getParameter("searchPR")!=null?request.getParameter("searchPR"):""%>" type="text" class="search-input" name="searchPR" id="findicon"
                                           placeholder="Tìm kiếm"> <button type="submit" class="fa-solid fa-magnifying-glass" style="background: none;border: none;"></button></form></li>
                <li id="totalCart" class="nav-item cta cta-colored amountInCart">
                    <a href="http://localhost:8080/BHNFoods/Cart?idUser=<%=idU%>" class="nav-link">
                        <span class="fa-solid fa-cart-shopping"></span>[<%=sumCart%>]</a>
                </li>

                <%
                    if(user == null){
                %>
                <li class="nav-item cta cta-colored">
                    <a href="login.jsp" class="nav-link"><span
                        style="line-height: 1.8" class="fa-solid fa-user"></span>
                    </a>
                </li>
                <%}
                 else {
                %>
                <li class="nav-item cta cta-colored hover_user">
                    <span href="#" class="nav-link" style="cursor: pointer;"><%=user.getNameUser()%></span>
                    <div class="list_menu">
                        <div class="dr"><a href="http://localhost:8080/BHNFoods/account?idUser=<%=user.getIdUser()%>">Tài khoản</a></div>
                        <div class="dr"> <a href="http://localhost:8080/BHNFoods/loveProduct?idUser=<%=user.getIdUser()%>">Sản phẩm yêu thích</a></div>
                        <div class="dr"> <a href="http://localhost:8080/BHNFoods/manageOrder?idUser=<%=user.getIdUser()%>">Quản lý đơn hàng</a> </div>
                        <div class="dr"> <a href="http://localhost:8080/BHNFoods/history?idUser=<%=user.getIdUser()%>">Lịch sử đơn hàng</a></div>
                        <div class="dr"> <a onclick="contact()" href="#">Liên hệ</a></div>
                        <div class="dr"> <a href="http://localhost:8080/BHNFoods/logOut">Đăng xuất</a></div>
                    </div>
                </li>
                <%}%>
            </ul>

        </div>
    </div>
</nav>
<script>
    function logOut() {
        $.ajax({
            url: "/BHNFoods/logOut",
            type: 'post',

            success: function (data) {
                const content = document.getElementById('totalCart');
                content.innerHTML = data;
            },
            error: function () {
            }
        });
    }
</script>
<!-- END nav -->

<div class="edit_formUser">
    <div class="container" style="background:none;">
        <div class="col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center">
            <form action="/BHNFoods/ContactServlet" method="post" class="billing-form" style="margin-top: 2%;">
                <h3 class="mb-4 billing-heading">LIÊN HỆ</h3>
                <div class="row align-items-end" style="font-size: 16px;">
                    <div class="col-md-12 col_addprod">
                        <div class="form-group">
                            <h5>Thông tin cửa hàng</h5>
                            <p>Địa chỉ: 203 Hòa Bình, Quận Bình Thạnh, thành phố Hồ Chí Minh.</p>
                            <p>Số điện thoại: 0779807028</p>
                            <p>Email: BHNFoods@gmail.com</p>
                        </div>
                    </div>
                    <div class=" col-md-12">
                        <div class="form-group" style="display: none">
                            <label>ID</label>
                            <input type="text"  value="<%=user.getIdUser()%>" name="iduser" class="form-control input_addpr" placeholder="">
                        </div>
                        <div class="form-group">
                            <label>Liên hệ</label>
                            <textarea name="content" type="text"
                                      class="form-control"
                                      placeholder="Nội dung (xin quý khách mô tả chi tiết)"
                                      value=""> </textarea>
                        </div>
                    </div>
                    <div class="col-md-12 d-flex  btn_huy_update" style="justify-content: end;">
                        <input onclick="huy()" type="button" value="Hủy">
                        <input type="submit" value="Gửi">
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    function contact() {
        $(".edit_formUser").css("display", "block");
    }

    function huy() {
        $(".edit_formUser").css("display", "none");
    }
    function autocomplete(inp, arr) {
        /*the autocomplete function takes two arguments,
        the text field element and an array of possible autocompleted values:*/
        var currentFocus;
        /*execute a function when someone writes in the text field:*/
        inp.addEventListener("input", function(e) {
            var a, b, i, val = this.value;
            /*close any already open lists of autocompleted values*/
            closeAllLists();
            if (!val) { return false;}
            currentFocus = -1;
            /*create a DIV element that will contain the items (values):*/
            a = document.createElement("DIV");
            a.setAttribute("id", this.id + "autocomplete-list");
            a.setAttribute("class", "autocomplete-items");
            /*append the DIV element as a child of the autocomplete container:*/
            this.parentNode.appendChild(a);
            /*for each item in the array...*/
            for (i = 0; i < arr.length; i++) {
                /*check if the item starts with the same letters as the text field value:*/
                if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                    /*create a DIV element for each matching element:*/
                    b = document.createElement("DIV");
                    /*make the matching letters bold:*/
                    b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                    b.innerHTML += arr[i].substr(val.length);
                    /*insert a input field that will hold the current array item's value:*/
                    b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                    /*execute a function when someone clicks on the item value (DIV element):*/
                    b.addEventListener("click", function(e) {
                        /*insert the value for the autocomplete text field:*/
                        inp.value = this.getElementsByTagName("input")[0].value;
                        /*close the list of autocompleted values,
                        (or any other open lists of autocompleted values:*/
                        closeAllLists();
                    });
                    a.appendChild(b);
                }
            }
        });
        /*execute a function presses a key on the keyboard:*/
        inp.addEventListener("keydown", function(e) {
            var x = document.getElementById(this.id + "autocomplete-list");
            if (x) x = x.getElementsByTagName("div");
            if (e.keyCode == 40) {
                /*If the arrow DOWN key is pressed,
                increase the currentFocus variable:*/
                currentFocus++;
                /*and and make the current item more visible:*/
                addActive(x);
            } else if (e.keyCode == 38) { //up
                /*If the arrow UP key is pressed,
                decrease the currentFocus variable:*/
                currentFocus--;
                /*and and make the current item more visible:*/
                addActive(x);
            } else if (e.keyCode == 13) {
                /*If the ENTER key is pressed, prevent the form from being submitted,*/
                e.preventDefault();
                if (currentFocus > -1) {
                    /*and simulate a click on the "active" item:*/
                    if (x) x[currentFocus].click();
                }
            }
        });
        function addActive(x) {
            /*a function to classify an item as "active":*/
            if (!x) return false;
            /*start by removing the "active" class on all items:*/
            removeActive(x);
            if (currentFocus >= x.length) currentFocus = 0;
            if (currentFocus < 0) currentFocus = (x.length - 1);
            /*add class "autocomplete-active":*/
            x[currentFocus].classList.add("autocomplete-active");
        }
        function removeActive(x) {
            /*a function to remove the "active" class from all autocomplete items:*/
            for (var i = 0; i < x.length; i++) {
                x[i].classList.remove("autocomplete-active");
            }
        }
        function closeAllLists(elmnt) {
            /*close all autocomplete lists in the document,
            except the one passed as an argument:*/
            var x = document.getElementsByClassName("autocomplete-items");
            for (var i = 0; i < x.length; i++) {
                if (elmnt != x[i] && elmnt != inp) {
                    x[i].parentNode.removeChild(x[i]);
                }
            }
        }
        /*execute a function when someone clicks in the document:*/
        document.addEventListener("click", function (e) {
            closeAllLists(e.target);
        });
    }

    /*An array containing all the country names in the world:*/
    var countries = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua & Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central Arfrican Republic","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauro","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","North Korea","Norway","Oman","Pakistan","Palau","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre & Miquelon","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Korea","South Sudan","Spain","Sri Lanka","St Kitts & Nevis","St Lucia","St Vincent","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Turks & Caicos","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States of America","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];

    /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
    autocomplete(document.getElementById("findicon"), countries);
    // $(function () {
    //     var availableTags = [
    //         "ActionScript",
    //         "AppleScript",
    //         "Asp",
    //         "BASIC",
    //         "C",
    //         "C++",
    //         "Clojure",
    //         "COBOL",
    //         "ColdFusion",
    //         "Erlang",
    //         "Fortran",
    //         "Groovy",
    //         "Haskell",
    //         "Java",
    //         "JavaScript",
    //         "Lisp",
    //         "Perl",
    //         "PHP",
    //         "Python",
    //         "Ruby",
    //         "Scala",
    //         "Scheme"
    //     ];
    //     $("#findicon").autocomplete({
    //         source: dataName ,
    //         minLength: 2
    //     });
    // })

</script>

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>
