<%@ page import="vn.edu.hcmuaf.fit.beans.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>BHNFoods | Giỏ hàng</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="body_design/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="body_design/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="body_design/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="body_design/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="body_design/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="body_design/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="body_design/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="body_design/css/style.css" type="text/css">
</head>

<body>


<%@ include file="header.jsp" %>
<%String error = (String) request.getAttribute("error");
    System.out.println(error);%>

<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Sản Phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            DecimalFormat decF = new DecimalFormat("#,###");
                            List<Cart> cList = (List<Cart>) request.getAttribute("listCart");
                            int sum = (int) request.getAttribute("sum");
                            for (Cart p : cList) {

                        %>
                        <tr id="<%=p.getIdPr()%>">
                            <td class="shoping__cart__item">
                                <img src="<%=p.getUrl()%>" alt="" style="width: 100px;height: auto">
                                <h5><%=p.getNamePr()%>
                                </h5>
                            </td>
                            <td class="shoping__cart__price">
                                <%=decF.format(p.getPrice() - (p.getPrice()*p.getDiscount())/100).replace(',', '.')%>đ
                            </td>
                            <td class="shoping__cart__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <span onclick="changeAmount(this,'<%=p.getPrice() - (p.getPrice()*p.getDiscount())/100%>', '<%=p.getIdPr()%>', document.getElementById('totalCart'))"
                                              class="dec qtybtn">-</span>
                                        <input id="amount<%=p.getIdPr()%>" type="text" value="<%=p.getAmount()%>">
                                        <span onclick="changeAmount(this,'<%=p.getPrice() - (p.getPrice()*p.getDiscount())/100%>', '<%=p.getIdPr()%>', document.getElementById('totalCart'))"
                                              class="inc qtybtn">+</span>
                                    </div>
                                </div>
                            </td>
                            <td id="total<%=p.getIdPr()%>" class="shoping__cart__total">
                                <%= decF.format(p.getAmount() * (p.getPrice() - (p.getPrice()*p.getDiscount())/100)).replace(',', '.')%> đ
                            </td>
                            <td style="padding: 30px">
                                <input name="checkboxInput" id="box<%=p.getIdPr()%>"
                                       onclick="checkBox(this,'<%=p.getIdPr()%>', '<%=p.getPrice()%>', document.getElementById('amount<%=p.getIdPr()%>'))"
                                       class="checkBoxCart" type="checkbox" checked style="transform: scale(1.5)">
                            </td>
                            <td class="shoping__cart__item__close">
                                <span onclick="removeProduct(document.getElementById('totalCart'),document.getElementById('box<%=p.getIdPr()%>'),'<%=p.getIdPr()%>', '<%=p.getPrice()%>', document.getElementById('amount<%=p.getIdPr()%>'))"
                                      class="icon_close"></span>
                            </td>
                        </tr>
                        <%}%>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="/ListProduct?kind=0&page=1" class="primary-btn cart-btn">Tiếp tục mua hàng</a>

                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__continue">
                    <div id="boxMaGiamGia" class="shoping__discount">
                            <h5>Mã giảm giá</h5>
                            <input id="maGiamGia" type="text" placeholder="Nhập mã giảm giá">
                            <button onclick="applyDiscount()">Áp dụng</button>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <form id="formPay" action="/BHNFoods/checkingOut" method="post">
                    <div id="checkOut" class="shoping__checkout" style="margin-top: 0">
                        <h5>Tổng giỏ hàng</h5>
                        <ul>
                            <li id="sum" value="<%=sum%>">Tổng tiền hàng
                                <input name="sumCheckout" value="<%=sum%>" style="display: none">
                                <span><%= decF.format(sum).replace(',', '.')%>đ</span>
                            </li>
                            <li id="discount" value="0">Giảm
                                <input name="discountCheckout" value="0" style="display: none">
                                <span><%=decF.format(0).replace(',', '.')%>đ</span>
                            </li>
                            <li id="total" value="<%=sum - 0%>">Tổng thanh toán (chưa gồm phí vận chuyển)
                                <input name="totalCheckout" value="<%=sum - 0%>" style="display: none">
                                <span><%=decF.format(sum - 0).replace(',', '.')%>đ</span>
                            </li>
                            <input id="idProdChecked" type="text" name="allIdProdChecked" value="" style="display: none">
                            <input id="maGiamGiaHide" name="maGiamGia" value="" style="display: none">
                        </ul>
                        <button type="submit" class="primary-btn">Thanh toán</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
<!-- Footer Section End -->

<script>

    $("#formPay").submit(function(event) {
        var elementValue = $('#idProdChecked').val();
        if(elementValue == '') {
            alert("Vui lòng mua hàng trước khi thanh toán")
            event.preventDefault();
        } else this.submit();
    })

    <%if(error != null) {%>
      alert('<%=error%>');
    <%}%>
    let allCheckbox = $('.checkBoxCart')
    var toStringIdChecked = "";
    for (let i = 0; i < allCheckbox.length; i++) {
        if (allCheckbox[i].checked === true) {
            toStringIdChecked += " " + allCheckbox[i].id;
        }
    }
    $('#idProdChecked').val(toStringIdChecked);

    let sumCart = <%=sumCart%>;

    function format1(n, currency) {
        return n.toFixed(0).replace(/./g, function (c, i, a) {
            return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "." + c : c;
        }) + currency;
    }

    
    function cancelAppyDiscount() {
        $.ajax({
            url: "/canelApplyDiscount",
            type: 'get',
            data: {
                sum: $('#sum').val(),
                discount: $('#discount').val(),
            },
            success: function (data) {
                    const content = document.getElementById('checkOut')
                    content.innerHTML = data;
                    const boxMaGiamGia = document.getElementById('boxMaGiamGia');
                    boxMaGiamGia.innerHTML = "<h5>Mã giảm giá</h5>" +
                        "<input id=\"maGiamGia\" type=\"text\" value='"+$('#maGiamGia').val()+"' placeholder=\"Nhập mã giảm giá\"> " +
                        "<button onclick=\"applyDiscount()\">Áp dụng</button>"
                    $('#maGiamGiaHide').val('');

            },
            error: function () {
            }
        });
    }


    function applyDiscount() {
        $.ajax({
            url: "/applyDiscount",
            type: 'get',
            data: {
                code: $('#maGiamGia').val(),
                sum: $('#sum').val(),
                discount: $('#discount').val(),
            },
            success: function (data) {
                if(data == 0) alert("Mã "+$('#maGiamGia').val()+" tạm thời đã hết")
                else if(data == 1) alert("Đơn hàng chưa đạt giá trị tối thiểu")
                else if(data == 2) alert("Bạn đã áp dụng mã rồi")
                else if(data == 3) alert("Mã giảm giá không tồn tại")
                else {
                    const content = document.getElementById('checkOut')
                    content.innerHTML = data;
                    const boxMaGiamGia = document.getElementById('boxMaGiamGia');
                    boxMaGiamGia.innerHTML = "<h5>Mã giảm giá</h5>" +
                        "<input id=\"maGiamGia\" type=\"text\" value=\""+$('#maGiamGia').val()+"\" placeholder=\"Nhập mã giảm giá\"> " +
                        "<button onclick=\"cancelAppyDiscount()\">Huỷ áp dụng</button>"
                    $('#maGiamGiaHide').val($('#maGiamGia').val());
                }

            },
            error: function () {
            }
        });

    }

    function changeAmount(button, orginPrice, idProd, elementHeader) {
        let newVal;
        let sum = $('#sum').val();
        let discount = $('#discount').val();
        let total = $('#total').val();
        var proQty = $('.pro-qty');
        var elementI = $('#amount' + idProd);
        var oldValue = elementI.val();
        let allCheckbox = $('.checkBoxCart')
        var toStringIdChecked = "";
        for (let i = 0; i < allCheckbox.length; i++) {
            if (allCheckbox[i].checked === true) {
                toStringIdChecked += " " + allCheckbox[i].id;
            }
        }
        $('#idProdChecked').val(toStringIdChecked);
        $.ajax({
            url: "/checkInventory",
            type: 'get',
            data: {
                id: idProd,
            },
            success: function (data) {
                if (button.classList.contains('inc')) {

                    if(parseInt(data) > parseInt(oldValue)) {
                        newVal = parseFloat(oldValue) + 1;
                        sumCart += 1;
                    } else {
                        newVal = oldValue;
                    }
                    if(document.getElementById('box'+ idProd).checked) sum = parseInt(sum) + parseInt(orginPrice);
                } else {
                    // Don't allow decrementing below one
                    if (oldValue > 1) {
                        newVal = parseFloat(oldValue) - 1;
                        sumCart -= 1;
                        if(document.getElementById('box'+ idProd).checked) sum = parseInt(sum) - parseInt(orginPrice);
                    } else {
                        newVal = 1;
                    }
                }
                elementI.val(newVal);
                elementHeader.innerHTML = "<a href=\"/Cart\" class=\"nav-link\">\n" +
                    "                        <span class=\"fa-solid fa-cart-shopping\"></span>[" + sumCart + "]</a>";
                const totalF = format1(parseInt(orginPrice) * parseInt(newVal), ' đ')
                $('#total' + idProd).text(totalF);
                $.ajax({
                    url: "/changeAmountFormCart",
                    type: 'get',
                    data: {
                        id: idProd,
                        sum: sum,
                        discount: discount,
                        total: total,
                        amount: newVal,
                        listId :toStringIdChecked
                    },
                    success: function (data) {
                        const content = document.getElementById('checkOut')
                        content.innerHTML = data;
                    },
                    error: function () {
                    }
                });
            },
            error: function () {
            }
        });


    }


    function removeProduct(elementHeader, elementInput, idProduct, price, elementInputAmount) {
        document.getElementById(idProduct).remove();

        let allCheckbox = $('.checkBoxCart')
        var toStringIdChecked = "";
        for (let i = 0; i < allCheckbox.length; i++) {
            if (allCheckbox[i].checked === true) {
                toStringIdChecked += " " + allCheckbox[i].id;
            }
        }
        $('#idProdChecked').val(toStringIdChecked);

        let sum = $('#sum').val();
        let discount = $('#discount').val();
        let total = $('#total').val();
        let amount = elementInputAmount.value;
        if (elementInput.checked === true) {
            sum = sum - price * amount;
            total = total - price * amount;
        }
        $.ajax({
            url: "/removeFromCart",
            type: 'get',
            data: {
                id: idProduct,
                sum: sum,
                discount: discount,
                total: total,
                listId : toStringIdChecked
            },
            success: function (data) {
                const content = document.getElementById('checkOut')
                content.innerHTML = data;
                sumCart = sumCart - amount;
                elementHeader.innerHTML = "<a href=\"/Cart?\" class=\"nav-link\">\n" +
                    "                        <span class=\"fa-solid fa-cart-shopping\"></span>[" + sumCart + "]</a>";
            },
            error: function () {
            }
        });
    }

    function checkBox(box, idProduct, price, elementInputAmount) {
        let sum;
        let total;
        let amount = elementInputAmount.value;

        let allCheckbox = $('.checkBoxCart')
        var toStringIdChecked = "";
        for (let i = 0; i < allCheckbox.length; i++) {
            if (allCheckbox[i].checked === true) {
                toStringIdChecked += " " + allCheckbox[i].id;
            }
        }
        $('#idProdChecked').val(toStringIdChecked);

        if (box.checked === true) {
            sum = parseInt($('#sum').val()) + parseInt(price) * amount;
            total = parseInt($('#total').val()) + parseInt(price) * amount;
        } else {
            sum = $('#sum').val() - price * amount;
            total = $('#total').val() - price * amount;
        }
        let discount = $('#discount').val();

        $.ajax({
            url: "/unCheckFromCart",
            type: 'get',
            data: {
                id: idProduct,
                sum: sum,
                discount: discount,
                total: total,
                listId : toStringIdChecked
            },
            success: function (data) {
                const content = document.getElementById('checkOut')
                content.innerHTML = data;
            },
            error: function () {
            }
        });
    }


</script>

<!-- Js Plugins -->
<script src="body_design/js/jquery-3.3.1.min.js"></script>
<script src="body_design/js/jquery.nice-select.min.js"></script>
<script src="body_design/js/jquery-ui.min.js"></script>
<script src="body_design/js/jquery.slicknav.js"></script>
<script src="body_design/js/mixitup.min.js"></script>
<script src="body_design/js/owl.carousel.min.js"></script>
<script src="body_design/js/main.js"></script>


</body>

</html>