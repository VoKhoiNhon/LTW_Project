<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>BHNFoods | Chi tiết thanh toán</title>
</head>

<body id="body">

<%@ include file="header.jsp" %>
<%
    int sum = (int) request.getAttribute("sumCheckout");
    int discount = (int) request.getAttribute("discountCheckout");
    int total = (int) request.getAttribute("totalCheckout");
    Map<String, Integer> mapProvince = (Map<String, Integer>) request.getAttribute("mapProvince");
    String all = request.getAttribute("allIdProdChecked").toString();
    request.setAttribute("allId", all);
    String maGiamGia = (String) request.getAttribute("maGiamGia");
    request.setAttribute("maGiamGia",maGiamGia);
    DecimalFormat dec = new DecimalFormat("#,###");
%>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-7 ftco-animate">
                <form action="#" class="billing-form">
                    <h3 class="mb-4 billing-heading">Chi tiết thanh toán</h3>
                    <div class="row align-items-end">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Họ và Tên</label>
                                <input id="fullName" type="text" class="form-control" placeholder="Nhập họ tên đầy đủ" value="<%=user != null? user.getNameUser() : ""%>" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input id="phoneNumber" type="text" class="form-control" placeholder="Nhập số điện thoại" value="<%=user != null? user.getPhone() : "" %>" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Email</label>
                                <input id="email" type="text" class="form-control" placeholder="Nhập địa chỉ Email" value="<%=user != null? user.getEmail(): ""%>">
                            </div>
                        </div>
                        <div class="w-100"></div>

                        <div class="col-md-12" id="shipAddress">
                            <div class="form-group">
                                <label>Tỉnh, Thành phố</label>
                                <select id="city" type="text" class="form-control" onchange="addDistrict()">
                                    <%
                                        for (String key : mapProvince.keySet()) {%>
                                    <option value="<%=mapProvince.get(key)%>"><%=key%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Quận, Huyện</label>
                                <select id="district" type="text" class="form-control" onchange="addWard()">

                                </select>
                            </div>
                            <div class="form-group">
                                <label>Phường, Xã</label>
                                <select id="ward" type="text" class="form-control" onchange="changeWard()">

                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Địa chỉ giao hàng (Đường, số nhà)</label>
                                <div class="select-wrap">
                                    <input name="" id="address" class="form-control" placeholder="Nhập địa chỉ giao hàng" value="">

                                </div>
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Ghi chú</label>
                                <textarea id="note"  type="text" class="form-control"
                                          placeholder="Khách hàng có những yêu cầu khác vui lòng nhập vào đây để cửa hàng có thể phục vụ tốt nhất"></textarea>
                            </div>
                        </div>

                        <div class="w-100"></div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Thời gian nhận hàng</label>

                                <select id="day" type="text" class="form-control">
                                    <option value="0">Ngày hôm nay</option>
                                    <option value="1">Ngày mai</option>
                                    <option value="2">Ngày mốt</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <select id="time" type="text" class="form-control">
                                    <option value="8:00:00">8h00-10h00</option>
                                    <option value="10:00:00">10h00-12h00</option>
                                    <option value="14:00:00">14h00-16h00</option>
                                    <option value="17:00:00">17h00-19h00</option>
                                    <option value="19:00:00">19h00-21h00</option>
                                </select>
                            </div>
                        </div>

                    </div>
                </form><!-- END -->
            </div>
            <div class="col-xl-5">
                <div class="row mt-5 pt-3">
                    <div class="col-md-12 d-flex mb-5">
                        <div class="cart-detail cart-total p-3 p-md-4">
                            <h3 class="billing-heading mb-4" style="font-size: 24px">Tổng giỏ hàng</h3>
                            <ul id="totalCard" style="padding: 0">
                                <li id="sumCheckout" value="<%=sum%>" style="overflow: hidden; margin-bottom: 1rem" >Tổng tiền hàng<span style="float: right"><%=dec.format(sum).replace(',','.')%>đ</span> </li>
                                <li id="discountCheckout" value="<%=discount%>" style="overflow: hidden; margin-bottom: 1rem">Giảm<span style="float: right"><%=dec.format(discount).replace(',','.')%>đ</span> </li>
                                <li id="shipCheckout" value="0" style="overflow: hidden; margin-bottom: 1rem">Phí vận chuyển<span style="float: right">0đ</span> </li>
                                <li id="totalCheckout" value="<%=total%>" style="overflow: hidden">Tổng thanh toán<span style="float: right"><%=dec.format(total).replace(',','.')%>đ</span> </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="cart-detail p-3 p-md-4">
                            <h3 class="billing-heading mb-4">Phương thức thanh toán</h3>
                            <div class="form-group">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="radio">
                                            <label><input type="radio" checked value="1" name="optradio" class="mr-2"> Thanh toán tiền mặt</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="radio">
                                        <label><input type="radio" value="0" name="optradio" class="mr-2"> Thanh toán online</label>
                                    </div>
                                </div>
                            </div>
                            <input type="text" id="allId" value="<%=all%>" style="display: none">
                            <input type="text" id="maGiamGia" value="<%=maGiamGia%>" style="display: none">
                            <p><button onclick="pay()" class="btn btn-primary py-3 px-4 " style="border-radius:0px">Đặt hàng</button></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<%--</footer>--%>
<%@ include file="footer.jsp" %>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script>
    function pay() {
        if($('#fullName').val() == "" || $('#phoneNumber').val() == "" || $('#address').val() == "" || $('#city').val() == "" || $('#district').val() == "" || $('#ward').val() == "") {
            alert('Hãy nhập đầy đủ các thông tin');
        }
        else {
            // Lấy phần tử select bằng id
            var selectStringCity = document.getElementById("city");
            var selectStringDistrict = document.getElementById("district");
            var selectStringWard = document.getElementById("ward");

            // Lấy chỉ mục của phần tử được chọn
            var selectedIndexCity = selectStringCity.selectedIndex;
            var selectedIndexDistrict = selectStringDistrict.selectedIndex;
            var selectedIndexWard = selectStringWard.selectedIndex;

            // Lấy đối tượng HTMLOptionElement tương ứng với chỉ mục
            var selectedOptionCity = selectStringCity.options[selectedIndexCity];
            var selectedOptionDistrict = selectStringDistrict.options[selectedIndexDistrict];
            var selectedOptionWard = selectStringWard.options[selectedIndexWard];

            // Lấy nội dung văn bản của phần tử HTMLOptionElement
            var selectedTextCity = selectedOptionCity.textContent;
            var selectedTextDistrict = selectedOptionDistrict.textContent;
            var selectedTextWard = selectedOptionWard.textContent;


        $.ajax({
            url: "/pay",
            type: 'get',
            data: {
                fullName: $('#fullName').val(),
                phoneNumber: $('#phoneNumber').val(),
                email : $('#email').val(),
                address : $('#address').val(),
                idCity : $('#city').val(),
                idDistrict : $('#district').val(),
                idWard : $('#ward').val(),
                city : selectedTextCity,
                district : selectedTextDistrict,
                ward : selectedTextWard,
                note: $('#note').val(),
                day : $('#day').val(),
                time : $('#time').val(),
                payment : $('input[type="radio"][name="optradio"]:checked').val(),
                sumCheckout : $('#sumCheckout').val(),
                discountCheckout : $('#discountCheckout').val(),
                shipCheckout : $('#shipCheckout').val(),
                totalCheckout : $('#totalCheckout').val(),
                listId : $('#allId').val(),
                maGiamGia : $('#maGiamGia').val(),
            },
            success: function (data) {
                let timerId= setInterval(setBody(), 1000);
                setTimeout(() => { clearInterval(timerId); Redirect(); }, 5000);
            },
            error: function () {
            }
        });


        }
    }
    function setBody() {
        var body = document.getElementById('body')
        var payment = $('input[type="radio"][name="optradio"]:checked').val() == 0 ? 'online' : 'trực tiếp';
        body.innerHTML = "<h3>Thanh toán thành công bằng phương thức "+payment+", bạn sẽ về trang sản phẩm trong "+5+" giây nữa</h3>"
    }


    function Redirect() {
        window.location.assign('/ListProduct?kind=0&page=1');
    }

    // $('#city').change(function changeDistrict() {
    //     $.ajax({
    //         url: "/changeDistrict",
    //         type: 'get',
    //         data: {
    //             sumCheckout: $('#sumCheckout').val(),
    //             discountCheckout: $('#discountCheckout').val(),
    //             idDistrict : idDistrict,
    //             idWard : $("#ward").val(),
    //             listId : $('#allId').val(),
    //             totalCheckout: parseInt($('#totalCheckout').val())+ parseInt($('#shipCheckout').val())
    //         },
    //         success: function (data) {
    //             const content = document.getElementById('totalCard')
    //             content.innerHTML = data;
    //         },
    //         error: function () {
    //         }
    //     });
    //
    // })

    function    addDistrict() {
        const idProvince = $("#city").val();
        $.ajax({
            url: "/addDistrict",
            type: 'get',
            data: {
                idProvince : idProvince
            },
            success: function (data) {
                const ward = document.getElementById('ward')
                ward.innerHTML = "";
                const content = document.getElementById('district')
                content.innerHTML = data;
                $.ajax({
                    url: "/changeDistrict",
                    type: 'get',
                    data: {
                        sumCheckout: $('#sumCheckout').val(),
                        discountCheckout: $('#discountCheckout').val(),
                        idDistrict : -1,
                        idWard : -1,
                        listId : $('#allId').val(),
                        totalCheckout: parseInt($('#totalCheckout').val())+ parseInt($('#shipCheckout').val())
                    },
                    success: function (data) {
                        const content = document.getElementById('totalCard')
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

    function format1(n, currency) {
        return n.toFixed(0).replace(/./g, function (c, i, a) {
            return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "." + c : c;
        }) + currency;
    }

    function addWard() {
        const idDistrict = $("#district").val();
        $.ajax({
            url: "/addWard",
            type: 'get',
            data: {
                idDistrict : idDistrict
            },
            success: function (data) {
                const content = document.getElementById('ward')
                content.innerHTML = data;
                $.ajax({
                    url: "/changeDistrict",
                    type: 'get',
                    data: {
                        sumCheckout: $('#sumCheckout').val(),
                        discountCheckout: $('#discountCheckout').val(),
                        idDistrict : idDistrict,
                        idWard : $("#ward").val(),
                        listId : $('#allId').val(),
                        totalCheckout: parseInt($('#totalCheckout').val())+ parseInt($('#shipCheckout').val())
                    },
                    success: function (data) {
                        const content = document.getElementById('totalCard')
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

    function changeWard() {
        const idDistrict = $("#district").val();
        $.ajax({
            url: "/changeDistrict",
            type: 'get',
            data: {
                sumCheckout: $('#sumCheckout').val(),
                discountCheckout: $('#discountCheckout').val(),
                idDistrict : idDistrict,
                idWard : $("#ward").val(),
                listId : $('#allId').val(),
                totalCheckout: parseInt($('#totalCheckout').val())+ parseInt($('#shipCheckout').val())
            },
            success: function (data) {
                const content = document.getElementById('totalCard')
                content.innerHTML = data;
            },
            error: function () {
            }
        });
    }



</script>

</body>

</html>