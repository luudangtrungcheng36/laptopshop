<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Dashboard - Hỏi Dân IT</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#productFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#productPreview").attr("src", imgURL);
                            $("#productPreview").css({ "display": "block" });
                        });
                    }); 
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Update product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="/admin">update</a> / product</li>
                                </ol>
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <!-- <h3>Create a user</h3> -->
                                        <hr>
                                        <form:form method="post" enctype="multipart/form-data"
                                            modelAttribute="newProduct" action="/admin/product/update" class="row">
                                            <div class="mb-3" style="display: none;">
                                                <label class="form-label">ID:</label>
                                                <form:input type="text" class="form-control" path="id" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorName">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="" class="form-label">Tên sản phẩm:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                    path="name" />
                                                ${errorName}
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorPrice">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="" class="form-label">giá tiền:</label>
                                                <form:input type="number"
                                                    class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                    path="price" />
                                                ${errorPrice}
                                            </div>
                                            <div class="mb-3 col-12">
                                                <label for="" class="form-label">Mô tả chi tiết:</label>
                                                <form:textarea path="detailDesc" class="form-control" rows="5" />
                                            </div>
                                            <div class="mb-3 col-12">
                                                <label for="" class="form-label">Mô tả ngắn gọn:</label>
                                                <form:textarea path="shortDesc" class="form-control" rows="3" />

                                            </div>
                                            <div class="mb-3 col-12">
                                                <c:set var="errorQuantity">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="" class="form-label">Số lượng:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                    path="quantity" />
                                                ${errorQuantity}
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="" class="form-label">Nhà sản xuất:</label>
                                                <form:select path="factory" class="form-select">
                                                    <form:option value="APPLE">Apple</form:option>
                                                    <form:option value="ASUS">Asus
                                                    </form:option>
                                                    <form:option value="LENOVO">Lenovo</form:option>
                                                    <form:option value="DELL">Dell</form:option>
                                                    <form:option value="LG">LG</form:option>
                                                    <form:option value="ACER">Acer</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="" class="form-label">Tiêu chí:</label>
                                                <form:select path="target" class="form-select">
                                                    <form:option value="GAMING">Gaming</form:option>
                                                    <form:option value="SINHVIEN-VANPHONG">Sinh viên - văn phòng
                                                    </form:option>
                                                    <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa</form:option>
                                                    <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                    <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="productFile" class="form-label">Image: <img
                                                        src="${pageContext.request.contextPath}/images/product/${newProduct.image}"
                                                        alt=""
                                                        style="width:120px;height:120px;object-fit:cover;"></label>
                                                <input type="file" class="form-control" id="productFile"
                                                    name="productFile" accept=".png, .jpg, .jpeg" />
                                            </div>
                                            <div class="mb-3 col-12">
                                                <img style="max-height: 250px; display: none;" alt="product preview"
                                                    id="productPreview">
                                            </div>
                                            <div class="col-12 mb-5">
                                                <button type="submit" class="btn btn-primary">Update</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>