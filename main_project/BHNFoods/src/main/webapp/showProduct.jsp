<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.UserService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.*" %>
<%@ page import="vn.edu.hcmuaf.fit.service.StatisticsService" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>BHNFoods Admin </title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="admin_template/vendors/feather/feather.css">
    <link rel="stylesheet" href="admin_template/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="admin_template/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="admin_template/vendors/typicons/typicons.css">
    <link rel="stylesheet" href="admin_template/vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="admin_template/vendors/css/vendor.bundle.base.css">

    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="admin_template/js/select.dataTables.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="admin_template/css/vertical-layout-light/style.css">

    <!-- endinject -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <style>
        .image-container {
            display: flex;
            flex-wrap: wrap;
        }

        .image-item {
            margin: 10px;
            width: 100px;
            height: 100px;
        }

        .image-item img {
            width: 100px;
            height: 100px;
        }


    </style>
</head>

<body>
<nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
        <%--      <div class="me-3">--%>
        <%--        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">--%>
        <%--          <span class="icon-menu"></span>--%>
        <%--        </button>--%>
        <%--      </div>--%>
        <div>
            <a class="navbar-brand brand-logo" href="index.html">
                BHNFoods
            </a>
        </div>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-top colorheader ">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item dropdown d-none d-lg-block">
                <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown"
                   href="#"
                   data-bs-toggle="dropdown" aria-expanded="false"> Lọc theo </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
                     aria-labelledby="messageDropdown">
                    <!-- <a class="dropdown-item py-3">
                      <p class="mb-0 font-weight-medium float-left">Lọc</p>
                    </a> -->
                    <div class="dropdown-divider"></div>
                    <a href="/AdminManagePr?kind=0&page=1 "
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Tất cả </p>
                        </div>
                    </a>
                    <a href="/AdminManagePr?kind=1&page=1"
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Gạo</p>
                        </div>
                    </a>
                    <a href="/AdminManagePr?kind=2&page=1 "
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Nếp </p>
                        </div>
                    </a>
                    <a href="/AdminManagePr?kind=3&page=1"
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Các loại hạt </p>
                        </div>
                    </a>
                    <a href="/AdminManagePr?kind=4&page=1"
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Các loại bột </p>

                        </div>
                    </a>
                    <a href="/AdminManagePr?kind=5&page=1 "
                       class="dropdown-item preview-item">
                        <div class="preview-item-content flex-grow py-2">
                            <p class="preview-subject ellipsis font-weight-medium text-dark">Các loại củ, trái </p>
                        </div>
                    </a>

                </div>
            </li>
            <li class="nav-item d-none d-lg-block">
                <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
            <span class="input-group-addon input-group-prepend border-right">
              <span class="icon-calendar input-group-text calendar-icon"></span>
            </span>
                    <input type="text" class="form-control">
                </div>
            </li>
            <li class="nav-item">
                <form class="search-form" action="/SearchAdmin" method="post">
                    <i class="icon-search"></i>
                    <input type="search" class="form-control" placeholder="Search Here" name="searchAD"
                           title="Search here">
                </form>
            </li>
            <%--            <li class="nav-item dropdown">--%>
            <%--                <a class="nav-link count-indicator" id="countDropdown" href="#" data-bs-toggle="dropdown"--%>
            <%--                   aria-expanded="false">--%>
            <%--                    <i class="icon-mail icon-lg"></i>--%>
            <%--                </a>--%>
            <%--                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"--%>
            <%--                     aria-labelledby="countDropdown">--%>
            <%--                    <a class="dropdown-item py-3">--%>
            <%--                        <p class="mb-0 font-weight-medium float-left">Bạn có 7 thông báo </p>--%>
            <%--                        <span class="badge badge-pill badge-primary float-right">Xem tất cả</span>--%>
            <%--                    </a>--%>
            <%--                    <div class="dropdown-divider"></div>--%>
            <%--                    <a class="dropdown-item preview-item">--%>
            <%--                        <div class="preview-thumbnail">--%>
            <%--                            <img src="https://assets.materialup.com/uploads/378d2c84-810d-477a-802b-d495646b9c4e/preview.jpg"--%>
            <%--                                 alt="image" class="img-sm profile-pic"--%>
            <%--                                 style=" width: 70px;height: 50px;border-radius: 100%;">--%>
            <%--                        </div>--%>
            <%--                        <div class="preview-item-content flex-grow py-2">--%>
            <%--                            <p class="preview-subject ellipsis font-weight-medium text-dark">Võ Khôi Nhơn </p>--%>
            <%--                            <p class="fw-light small-text mb-0"> 15-12-2022 15:01 </p>--%>
            <%--                        </div>--%>
            <%--                    </a>--%>
            <%--                    <a class="dropdown-item preview-item">--%>
            <%--                        <div class="preview-thumbnail">--%>
            <%--                            <img src="https://assets.materialup.com/uploads/378d2c84-810d-477a-802b-d495646b9c4e/preview.jpg"--%>
            <%--                                 style=" width: 70px;height: 50px;border-radius: 100%;"--%>
            <%--                                 alt="image" class="img-sm profile-pic">--%>
            <%--                        </div>--%>
            <%--                        <div class="preview-item-content flex-grow py-2">--%>
            <%--                            <p class="preview-subject ellipsis font-weight-medium text-dark">Phạm Gia Bảo </p>--%>
            <%--                            <p class="fw-light small-text mb-0"> 15-12-2022 15:01 </p>--%>
            <%--                        </div>--%>
            <%--                    </a>--%>
            <%--                    <a class="dropdown-item preview-item">--%>
            <%--                        <div class="preview-thumbnail">--%>
            <%--                            <img src="https://assets.materialup.com/uploads/378d2c84-810d-477a-802b-d495646b9c4e/preview.jpg"--%>
            <%--                                 style=" width: 70px;height: 50px;border-radius: 100%;"--%>
            <%--                                 alt="image" class="img-sm profile-pic">--%>
            <%--                        </div>--%>
            <%--                        <div class="preview-item-content flex-grow py-2">--%>
            <%--                            <p class="preview-subject ellipsis font-weight-medium text-dark">Nguyễn Thị Xuân Hoa </p>--%>
            <%--                            <p class="fw-light small-text mb-0"> 15-12-2022 15:01 </p>--%>
            <%--                        </div>--%>
            <%--                    </a>--%>
            <%--                </div>--%>
            <%--            </li>--%>

            <%
                User user = (User) session.getAttribute("auth");
                if (user != null) {%>
            <%--            <li class="nav-item dropdown d-none d-lg-block user-dropdown">--%>
            <%--                <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">--%>
            <%--                    <img class="img-xs rounded-circle" src="ImageproductNew/background/images.png"--%>
            <%--                         alt="Profile image"> </a>--%>
            <%--                <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">--%>
            <%--                    <div class="dropdown-header text-center">--%>
            <%--                        &lt;%&ndash;              <img class="img-md rounded-circle" src="images/faces/face8.jpg" alt="Profile image">&ndash;%&gt;--%>
            <%--                        <p class="mb-1 mt-3 font-weight-semibold"><%=user.getNameUser()%>--%>
            <%--                        </p>--%>
            <%--                        <p class="fw-light text-muted mb-0"><%=user.getEmail()%>--%>
            <%--                        </p>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </li>--%>
            <%}%>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                data-bs-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
        </button>
    </div>
</nav>
<!-- partial -->
<div class="container-fluid page-body-wrapper">
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <%--        nếu là admin thì hiển thị trang chủ, log, qly người dùng , logout--%>
        <%if (user.getDecentralization() == Powers.ADMIN) {%>
        <div class="nav-item">
            <a href="/AdminMain" class="nav-item-link">
                <i style="margin-right: 5px;" class="menu-icon mdi mdi-home"></i>
                <span>Trang chủ</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/AdminManageUser" class="nav-item-link">
                <i style="margin-right: 5px;" class="menu-icon mdi mdi-account-circle"></i>
                <span>Quản lý người dùng</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/AdminManagePr?kind=0&page=1" class="nav-item-link">
                <i style="margin-right: 5px;" class="menu-icon mdi mdi-view-module"></i>
                <span>Quản lý sản phẩm</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/ListLog" class="nav-item-link">
                <i style="margin-right: 5px;" class="menu-icon mdi mdi-view-module"></i>
                <span>Log</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/Login" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-arrow-right-from-bracket"></i>
                <span>Đăng xuất</span>
            </a>
        </div>
        <%} else {%>
        <div class="nav-item">
            <a href="/ListOrdersAdmin" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-arrow-down-wide-short"></i>
                <span>Quản lý đơn hàng</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/HistoryOrdersAdmin" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-arrow-down-wide-short"></i>
                <span>Lịch sử đơn hàng</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/AdminManagePr?kind=0&page=1" class="nav-item-link">
                <i style="margin-right: 5px;" class="menu-icon mdi mdi-view-module"></i>
                <span>Quản lý sản phẩm</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-arrow-down-wide-short"></i>
                <span>Nhập kho</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="/Login" class="nav-item-link">
                <i style="margin-right: 5px;" class="fa-solid fa-arrow-right-from-bracket"></i>
                <span>Đăng xuất</span>
            </a>
        </div>
        <%}%>

    </nav>
    <!-- partial -->
    <div class="main-panel" style="padding: 3%">
        <% String id = (String) request.getAttribute("id");
            SingleProduct p = (SingleProduct) ProductService.getInstance().getSingleProduct(id).get(0);
            List<ImgForSingleProd> li = ProductService.getInstance().getListImgForSingleProduct(id);
            Map<String, Integer> view= StatisticsService.getInstance().getQuantityProduct();
        %>

        <div>
            <h3 class="rate-percentage">Sản phẩm <%=p.getNamePr()%> đã có: <%=view.get(id)%> lượt xem</h3>
        </div>
        <div class="edit_formUser edit_formAdd">
            <div class="col-xl-7 ftco-animate cen-div  row ftco-section justify-content-center">
                <div class="col-md-12 ">
                    <div class="form-group">
<%--                        <label>Hình ảnh</label>--%>
                        <div class="d-flex flex-grow-1  row_input ">
                            <%for (ImgForSingleProd l : li) {%>
                            <div  class=" edit_img">
                                <img class="image-item img " src="<%=l.getUrl()%>">
                      
                                <button  onclick="deleteIMG('<%=l.getUrl()%>')">x</button>
                            </div>

                            <%}%>

                        </div>


                        <form  action="/AddNewImg?id=<%=p.getIdPr()%>" id="imageForm" method="post" enctype="multipart/form-data">
                            <div class="card">
                                <div class="drag-area">
                                                <span class="visible">
                                                    <span class="select" role="button">Browse</span>
                                                                                </span>
                                    <input name="imageFiles" id="imageFiles" type="file" class="imageFiles" multiple/>
                                    <input name="text" id="textname" type="text" class="form-control input_addpr"
                                           placeholder=""
                                           value="" style="display: none">
                                </div>
                            </div>
                            <div class="contai"></div>
                                <!-- IMAGE PREVIEW CONTAINER -->
                            <input type="submit" value="xác nhận thêm ảnh"/>
                        </form>

                    </div>
                </div>
                <form action="/UpdateProduct"
                      method="post" class="billing-form"
                      enctype="multipart/form-data"
                      style="margin-top: 5%;">


                    <div class="row align-items-end"
                         style="font-size: 16px;">

                        <div class="col-md-12 ">
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input type="text"
                                       class="form-control input_addpr"
                                       placeholder=""
                                       name="name"
                                       value="<%=p.getNamePr()%>  ">
                                <div style="display: none"
                                     class="form-group">
                                    <label for=>ID</label>
                                    <input type="text"
                                           value="<%=p.getIdPr()%>"
                                           class="form-control input_addpr"
                                           name="id"
                                           placeholder="">
                                </div>

                            </div>
                        </div>
                        <div class="d-flex flex-grow-1  row_input  ">
                            <div class="col-md-6 col_addprod">
                            </div>


                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Danh mục</label>
                                    <select type="text"
                                            class="form-control input_addpr"
                                            name="menu">
                                        <option value="m1">Gạo
                                        </option>
                                        <option value="m2">Nếp
                                        </option>
                                        <option value="m3">Các
                                            loại hạt
                                        </option>
                                        <option value="m4">Các
                                            loại bột
                                        </option>
                                        <option value="m5">Các
                                            loại củ, trái
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-grow-1 row_input ">
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Giá</label>
                                    <input name="price"
                                           type="text"
                                           class="form-control input_addpr"
                                           placeholder=""
                                           value="<%=p.getPrice()%>">
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Khuyến mãi(%)</label>
                                    <input name="discount"
                                           type="text"
                                           class="form-control input_addpr"
                                           placeholder=""
                                           value="<%=p.getDiscount()%>">
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-grow-1 row_input ">
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Xuất xứ</label>
                                    <input name="origin"
                                           type="text"
                                           class="form-control input_addpr"
                                           placeholder=""
                                           value="<%=p.getOrigin()%>">
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Thương hiệu</label>
                                    <input name="brand"
                                           type="text"
                                           class="form-control  input_addpr"
                                           value="<%=p.getBrand()%>"
                                           placeholder="">
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Trọng lượng</label>
                                    <input name="weight"
                                           type="text"
                                           class="form-control input_addpr"
                                           value="<%=p.getWeight()%>"
                                           placeholder="">
                                </div>
                            </div>
                        </div>


                        <div class="d-flex flex-grow-1  row_input">
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Ngày sản xuất</label>
                                    <div class="select-wrap">
                                        <input type="date"
                                               name="nsx"
                                               class="form-control input_addpr"
                                               value="<%=p.getNsx()%>"
                                               placeholder="Ngày/Tháng/Năm">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Ngày hết hạn</label>
                                    <div class="select-wrap">
                                        <input type="date"
                                               name="hsd"
                                               class="form-control input_addpr"
                                               value="<%=p.getHsd()%>"
                                               placeholder="Ngày/Tháng/Năm">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col_addprod">
                                <div class="form-group">
                                    <label>Số lượng nhập</label>
                                    <input name="inventory"
                                           type="number"
                                           class="form-control input_addpr"
                                           value="<%=p.getInventory()%>"
                                           placeholder="">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea type="text"
                                          class="form-control input_addpr"
                                          value="<%=p.getDescribe()%>"
                                          name="mota"
                                          placeholder="Mô tả sản phẩm"></textarea>
                            </div>
                        </div>
                        <div class="col-md d-flex col_addprod">
                            <div class="form-group  padd_right"
                                 style="">
                                <label class="">Trạng
                                    thái:</label>
                            </div>
                            <div class="form-group  padd_right"
                                 style="">
                                <input type="radio"
                                       class="form-"
                                       placeholder="">
                                <label class="">Nổi bật</label>
                            </div>
                            <div class="form-group padd_right "
                                 style="">
                                <input type="radio"
                                       class="form-"
                                       placeholder="">
                                <label class="">Mới</label>
                            </div>
                            <div class="form-group padd_right "
                                 style="">
                                <input type="radio"
                                       class="form-"
                                       name="condition"
                                       value="1" placeholder="">
                                <label class="">Ẩn</label>
                            </div>
                            <div class="form-group padd_right "
                                 style="">
                                <input type="radio" checked
                                       class="form-"
                                       name="condition"
                                       value="0" placeholder="">
                                <label class="">Không</label>
                            </div>
                        </div>

                        <div class="col-md-12 d-flex  btn_huy_update"
                             style="justify-content: end;">
                            <input onclick="huy()" type="button"
                                   value="Hủy">
                            <input type="submit"
                                   value=" Cập nhật">
                        </div>
                    </div>
                </form><!-- END -->
            </div>
        </div>
    </div>
</div>


<script>
    function deleteIMG(url, id) {
        $.ajax({
            url: "/deleteIMGProd",
            type: 'get',
            data: {
                URL:url
            },
            success: function (data) {
                alert("đã xóa ảnh sản phẩm")
                location.reload()
            },
            error: function () {
            }
        });
    }
    let files = [],
        dragArea = document.querySelector('.drag-area'),
        input = document.querySelector('.drag-area input'),
        button = document.querySelector('.card button'),
        select = document.querySelector('.drag-area .select'),
        container = document.querySelector('.contai');


    let text;
    /** CLICK LISTENER */
    select.addEventListener('click', () => input.click());
    /* INPUT CHANGE EVENT */
    input.addEventListener('change', () => {
        let file = input.files;

        // if user select no image
        if (file.length == 0) return;

        for (let i = 0; i < file.length; i++) {
            if (file[i].type.split("/")[0] != 'image') continue;
            if (!files.some(e => e.name == file[i].name)) files.push(file[i])
            alert(files[i].name);
            text += files[i].name;

        }
        document.getElementById('textname').value = text
        showImages();
    });

    /** SHOW IMAGES */
    function showImages() {
        container.innerHTML = files.reduce((prev, curr, index) => {
            return `${prev}
		    <div class="image">
			    <span onclick="delImage(${index})">&times;</span>
			    <img src="${URL.createObjectURL(curr)}" style="max-width: 100px; max-height: 100%;" />
			</div>`
        }, '');


    }
    /* DELETE IMAGE */
    function delImage(index) {
        files.splice(index, 1);
        showImages();
    }

    /* DRAG & DROP */
    dragArea.addEventListener('dragover', e => {
        e.preventDefault()
        dragArea.classList.add('dragover')
    })

    /* DRAG LEAVE */
    dragArea.addEventListener('dragleave', e => {
        e.preventDefault()
        dragArea.classList.remove('dragover')
    });

    /* DROP EVENT */
    dragArea.addEventListener('drop', e => {
        e.preventDefault()
        dragArea.classList.remove('dragover');

        let file = e.dataTransfer.files;
        for (let i = 0; i < file.length; i++) {
            /** Check selected file is image */
            if (file[i].type.split("/")[0] != 'image') continue;

            if (!files.some(e => e.name == file[i].name)) files.push(file[i])

        }
        showImages();
    });


</script>

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="admin_template/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="admin_template/vendors/chart.js/Chart.min.js"></script>
<script src="admin_template/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="admin_template/vendors/progressbar.js/progressbar.min.js"></script>

<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="admin_template/js/off-canvas.js"></script>
<script src="admin_template/js/hoverable-collapse.js"></script>
<script src="admin_template/js/template.js"></script>
<script src="admin_template/js/settings.js"></script>
<script src="admin_template/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="admin_template/js/jquery.cookie.js" type="text/javascript"></script>
<script src="admin_template/js/dashboard.js"></script>
<script src="admin_template/js/Chart.roundedBarCharts.js"></script>

<!-- End custom js for this page-->
</body>

</html>