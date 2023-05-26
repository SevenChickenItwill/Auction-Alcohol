<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Administrator Page</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
    crossorigin="anonymous">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="sidebars.css" rel="stylesheet">

</head>
<body>
    <div>
        <div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4">관리자 페이지</span>
      </a>

      <ul class="nav nav-pills">
        <li class="nav-link px-2 link-dark">
        <a href="#" class="nav-link active" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Features</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
      </ul>
    </header>
  </div>

        <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
            <a href="/"
                class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
                <svg class="bi pe-none me-2" width="30" height="24">
                    <use xlink:href="#bootstrap"></use></svg> <span
                class="fs-5 fw-semibold">Collapsible</span>
            </a>
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <button
                        class="btn btn-toggle d-inline-flex align-items-center rounded border-0"
                        data-bs-toggle="collapse"
                        data-bs-target="#home-collapse"
                        aria-expanded="true">경매</button>
                    <div class="collapse show" id="home-collapse"
                        style="">
                        <ul
                            class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li>
                                <c:url var="auctionProduct" value="/auction/product"></c:url>
                                <a href="${ auctionProduct }"
                                class="link-dark d-inline-flex text-decoration-none rounded">경매상품관리</a></li>
                            <li>
                                <c:url var="auctionManagement" value="/auction/auction"></c:url>
                                <a href="${ auctionManagement }"
                                class="link-dark d-inline-flex text-decoration-none rounded">경매관리</a></li>
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Reports</a></li>
                        </ul>
                    </div>
                </li>
                <li class="mb-1">
                    <button
                        class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse"
                        data-bs-target="#dashboard-collapse"
                        aria-expanded="false">경매관리</button>
                    <div class="collapse" id="dashboard-collapse">
                        <ul
                            class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Overview</a></li>
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Weekly</a></li>
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Monthly</a></li>
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Annually</a></li>
                        </ul>
                    </div>
                </li>
                <li class="mb-1">
                    <button
                        class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse"
                        data-bs-target="#orders-collapse"
                        aria-expanded="false">Orders</button>
                    <div class="collapse" id="orders-collapse">
                        <ul
                            class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">New</a></li>
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Processed</a></li>
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Shipped</a></li>
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Returned</a></li>
                        </ul>
                    </div>
                </li>
                <li class="border-top my-3"></li>
                <li class="mb-1">
                    <button
                        class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse"
                        data-bs-target="#account-collapse"
                        aria-expanded="false">Account</button>
                    <div class="collapse" id="account-collapse">
                        <ul
                            class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">New...</a></li>
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Profile</a></li>
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Settings</a></li>
                            <li><a href="#"
                                class="link-dark d-inline-flex text-decoration-none rounded">Sign
                                    out</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous">
									
								</script>
        <script src="sidebars.js"></script>
    </div>
</body>
</html>