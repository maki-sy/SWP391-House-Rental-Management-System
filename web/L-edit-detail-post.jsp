<!-- JSP Import -->
<%@page import="model.Users" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.PostRental" %>
<% Users user=session.getAttribute("user")==null ? null : (Users)session.getAttribute("user"); %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>EstateAgency Bootstrap Template - Index</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">


    </head>

    <body>
        <!-- ======= JSP ======= -->
        <% String role=session.getAttribute("role")==null ? null : (String) session.getAttribute("role");
            Object loggedUser=session.getAttribute("user")==null ? null : session.getAttribute("user");
            PostRental post = (PostRental)request.getAttribute("post");
            ArrayList<String> urlList = (ArrayList<String>)request.getAttribute("urlList");
        %>
        <!-- End JSP Code -->

        <!-- ======= Property Search Section ======= -->
        <div class="click-closed"></div>
        <!--/ Form Search Star /-->
        <div class="box-collapse">
            <div class="title-box-d">
                <h3 class="title-d">Search Property</h3>
            </div>
            <span class="close-box-collapse right-boxed bi bi-x"></span>
            <div class="box-collapse-wrap form">
                <form class="form-a">
                    <div class="row">
                        <div class="col-md-12 mb-2">
                            <div class="form-group">
                                <label class="pb-2" for="Type">Keyword</label>
                                <input type="text"
                                       class="form-control form-control-lg form-control-a"
                                       placeholder="Keyword">
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="Type">Type</label>
                                <select class="form-control form-select form-control-a" id="Type">
                                    <option>All Type</option>
                                    <option>For Rent</option>
                                    <option>For Sale</option>
                                    <option>Open House</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="city">City</label>
                                <select class="form-control form-select form-control-a" id="city">
                                    <option>All City</option>
                                    <option>Alabama</option>
                                    <option>Arizona</option>
                                    <option>California</option>
                                    <option>Colorado</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="bedrooms">Bedrooms</label>
                                <select class="form-control form-select form-control-a"
                                        id="bedrooms">
                                    <option>Any</option>
                                    <option>01</option>
                                    <option>02</option>
                                    <option>03</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="bathrooms">Bathrooms</label>
                                <select class="form-control form-select form-control-a"
                                        id="bathrooms">
                                    <option>Any</option>
                                    <option>01</option>
                                    <option>02</option>
                                    <option>03</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="price">Min Price</label>
                                <select class="form-control form-select form-control-a" id="price">
                                    <option>Unlimite</option>
                                    <option>$50,000</option>
                                    <option>$100,000</option>
                                    <option>$150,000</option>
                                    <option>$200,000</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <div class="form-group mt-3">
                                <label class="pb-2" for="price">Max price</label>
                                <select class="form-control form-select form-control-a" id="price">
                                    <option>Unlimite</option>
                                    <option>$50,000</option>
                                    <option>$100,000</option>
                                    <option>$150,000</option>
                                    <option>$200,000</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-b">Search Property</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Property Search Section -->

        <!-- ======= Header/Navbar ======= -->
        <%@include file="header.jsp" %>

        <!-- End Header/Navbar -->

        <main id="main">
            <section class="section-news section-t3">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">Manage services</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Add
                                        new post</li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img src="./assets/img/setting.png" alt="avatar"
                                         class="img-fluid" style="width: 150px;">
                                    <div class="mb-3"></div>
                                    <ul class="list-group text-start">
                                        <li class="text-start list-group-item active list-group-item-action"
                                            aria-current="true">Add new post</li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Post
                                                title--</span><span>
                                                The title is placed at the top of the
                                                article</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Rental
                                                price--</span><span>
                                                The original rental price of the house has not
                                                yet been discounted</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--House
                                                area--</span><span>
                                                Area of the house</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Number of
                                                bedrooms--</span><span>
                                                Total number of bedrooms in the house</span>
                                        </li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Address of
                                                the house--</span><span>
                                                Detailed address of the house such as house
                                                number, lane number, lane name, ward name</span>
                                        </li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Upload
                                                photo--</span><span>
                                                You can absolutely upload multiple photos at the
                                                same time</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Detailed
                                                description--</span><span>
                                                Describe all the details of the house
                                                attractively to attract tenants</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-danger">--Save as
                                                draft--</span><span>
                                                Save it as a draft and you can publish it
                                                later</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-danger">--Proceed
                                                with payment--</span><span>
                                                Select payments and post to the community</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <!-- SIDE BAR HERE -->
                            <div class="card mb-4 mb-lg-0">
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush rounded-3">
                                        <li class="list-group-item text-center">
                                            <a class="pe-none" href="#!"><button type="button"
                                                                                 class=" w-100 btn btn-dark "> Manage rental
                                                    requests</button></a>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">
                                                <a
                                                    href="landlordServicesPage?service=pending-requests">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Pending
                                                        requests
                                                    </button>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">

                                                <a
                                                    href="landlordServicesPage?service=requests-processed">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Requests
                                                        processed
                                                    </button>
                                                </a>
                                            </div>

                                        </li>
                                        <li class="list-group-item text-center">
                                            <a class="pe-none" href="#!"><button type="button"
                                                                                 class=" w-100 btn btn-dark "> Manage My
                                                    Post</button></a>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">
                                                <a
                                                    href="landlordServicesPage?service=published-posts">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Published
                                                        posts
                                                    </button>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">

                                                <a
                                                    href="landlordServicesPage?service=add-new-post">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Add new post
                                                    </button>
                                                </a>
                                            </div>

                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">
                                                <a
                                                    href="landlordServicesPage?service=edit-posts">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Edit
                                                        posts and drafts
                                                    </button>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="list-group-item text-center">
                                            <a class="pe-none" href="#!"><button type="button"
                                                                                 class=" w-100 btn btn-dark ">Manage my
                                                    wallet points</button></a>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">
                                                <a href="#!">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Request
                                                        deposit
                                                    </button>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="contain">

                                                <a href="#!">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Transaction
                                                        history
                                                    </button>
                                                </a>
                                            </div>
                                        </li>

                                        <li class="list-group-item text-center">
                                            <a class="pe-none" href="#!"><button type="button"
                                                                                 class=" w-100 btn btn-dark ">Promotions</button></a>
                                        </li>

                                        <li class="list-group-item">
                                            <div class="contain">
                                                <a href="PromotionManage">
                                                    <div class="btn btn-primary"> + </div>
                                                    <button type="button"
                                                            class="btn btn-secondary">Manage
                                                        Promotions
                                                    </button>
                                                </a>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <!-- END SIDE BAR -->

                        </div>

                        <div class="card col-lg-8">
                            <form id='form-1' action="landlordServicesPage" method="POST"
                                  enctype="multipart/form-data">
                                <input type="hidden" name="service" value="submit-edit-detail-post">
                                <input type="hidden" name="post-id" value="<%=post.getId()%>">
                                <div class="mb-3"></div>
                                <div class="mb-3">
                                    <label for="Post-title" class="form-label" >Post
                                        title</label>
                                    <textarea required name="name" class="form-control"
                                              id="Post-title" rows="1" placeholder="<%=post.getName()%>"><%=post.getName()%></textarea>
                                    <div class="invalid-feedback"></div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="Rental-price" class="form-label">Rental
                                            price</label>
                                        <textarea required name="price" class="form-control"
                                                  id="Rental-price" rows="1" placeholder="<%=post.getPrice()%>"><%=post.getPrice()%></textarea>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                    <div class="col">
                                        <label for="House-area" class="form-label">House
                                            area</label>
                                        <textarea required name="area" class="form-control"
                                                  id="House-area" rows="1" placeholder="<%=post.getArea()%>"><%=post.getArea()%></textarea>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                    <div class="col">
                                        <label for="Number-bedrooms" class="form-label">Number
                                            of
                                            bedrooms</label>
                                        <textarea required name="NumOfBedrooms"
                                                  class="form-control" id="Number-bedrooms"
                                                  rows="1" placeholder="<%=post.getNumOfBeds()%>"><%=post.getNumOfBeds()%></textarea>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="address" class="form-label">Address
                                        of the
                                        house</label>
                                    <textarea required name="address" class="form-control"
                                              id="address" rows="1" placeholder="<%=post.getAddress()%>"><%=post.getAddress()%></textarea>
                                    <div class="invalid-feedback"></div>
                                </div>
                                <div class="mb-3">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-8">
                                            <div id="property-single-carousel" class="swiper">
                                                <div class="swiper-wrapper">
                                                    <%for(String url : urlList){%>
                                                    <div class="carousel-item-b swiper-slide ">
                                                        <img class="rounded mx-auto d-block img-fluid" src="<%=url%>" alt="">
                                                    </div>
                                                    <%}%>
                                                </div>
                                            </div>
                                            <div class="property-single-carousel-pagination carousel-pagination"></div>
                                        </div>
                                    </div>

                                </div>
                                <div class="mb-3">

                                    <label for="formFileMultiple" class="form-label">Upload
                                        multiple photos</label>
                                    <input name="media" class="form-control" type="file"
                                           id="formFileMultiple" multiple>
                                    <div class="invalid-feedback"></div>
                                </div>
                                <div class="form-check mb-3">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="add-or-replace" id="add-new-photo" value="add-new-photo" checked>
                                        <label class="form-check-label" for="inlineRadio1">Add new photo</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="add-or-replace" id="replace-photo" value="replace-photo">
                                        <label class="form-check-label"
                                               for="inlineRadio2">Replace photo</label>
                                    </div>
                                </div>   
                                <div class="mb-3">
                                    <label for="Detailed-description"
                                           class="form-label">Detailed
                                        description</label>
                                    <textarea required name="description" class="form-control"
                                              id="Detailed-description" rows="12" placeholder="<%=post.getDesscription()%>"><%=post.getDesscription()%></textarea>
                                    <div class="invalid-feedback"></div>
                                </div>

                                <select required name="type" class="mb-3 form-select"
                                        aria-label="Default select example" id="type">
                                    <option disabled>Choose the type of
                                        rental house
                                    </option>
                                    <option selected value="1">Motel</option>
                                    <option value="2">Apartment</option>
                                </select>
                                <select required name="location_id" class="mb-3 form-select"
                                        aria-label="Default select example" id="location_id">
                                    <option disabled>Select province/city
                                    </option>
                                    <option selected value="1">Hanoi</option>
                                    <option value="2">Haiphong</option>
                                    <option value="3">Da Nang</option>
                                    <option value="4">Ho Chi Minh City</option>
                                    <option value="5">Can Tho</option>
                                    <option value="6">An Giang</option>
                                    <option value="7">Bac Giang</option>
                                    <option value="8">Bac Kan</option>
                                    <option value="9">Bac Ninh</option>
                                    <option value="10">Ba Ria - Vung Tau</option>
                                    <option value="11">Ben Tre</option>
                                    <option value="12">Binh Dinh</option>
                                    <option value="13">Binh Duong</option>
                                    <option value="14">Binh Phuoc</option>
                                    <option value="15">Binh Thuan</option>
                                    <option value="16">Ca Mau</option>
                                    <option value="17">Cao Bang</option>
                                    <option value="18">Dak Lak</option>
                                    <option value="19">Dak Nong</option>
                                    <option value="20">Dien Bien</option>
                                    <option value="21">Dong Nai</option>
                                    <option value="22">Dong Thap</option>
                                    <option value="23">Gia Lai</option>
                                    <option value="24">Ha Giang</option>
                                    <option value="25">Ha Nam</option>
                                    <option value="26">Ha Tinh</option>
                                    <option value="27">Hai Duong</option>
                                    <option value="28">Hoa Binh</option>
                                    <option value="29">Hung Yen</option>
                                    <option value="30">Khanh Hoa</option>
                                    <option value="31">Kien Giang</option>
                                    <option value="32">Kon Tum</option>
                                    <option value="33">Lai Chau</option>
                                    <option value="34">Lam Dong</option>
                                    <option value="35">Lang Son</option>
                                    <option value="36">Lao Cai</option>
                                    <option value="37">Long An</option>
                                    <option value="38">Nam Dinh</option>
                                    <option value="39">Nghe An</option>
                                    <option value="40">Ninh Binh</option>
                                    <option value="41">Ninh Thuan</option>
                                    <option value="42">Phu Tho</option>
                                    <option value="43">Phu Yen</option>
                                    <option value="44">Quang Binh</option>
                                    <option value="45">Quang Nam</option>
                                    <option value="46">Quang Ngai</option>
                                    <option value="47">Quang Ninh</option>
                                    <option value="48">Quang Tri</option>
                                    <option value="49">Soc Trang</option>
                                    <option value="50">Son La</option>
                                    <option value="51">Tay Ninh</option>
                                    <option value="52">Thai Binh</option>
                                    <option value="53">Thai Nguyen</option>
                                    <option value="54">Thanh Hoa</option>
                                    <option value="55">Thua Thien Hue</option>
                                    <option value="56">Tien Giang</option>
                                    <option value="57">Tra Vinh</option>
                                    <option value="58">Tuyen Quang</option>
                                    <option value="59">Vinh Long</option>
                                    <option value="60">Vinh Phuc</option>
                                    <option value="61">Yen Bai</option>
                                    <option value="62">Bac Long Vi Island</option>
                                    <option value="63">Phu Quy Islands</option>
                                </select>
                                <%if(post.getStatus().equals("draft")) {%>
                                <div class="form-check mb-3">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="typeOfAction" id="draft" value="draft" checked>
                                        <label class="form-check-label" for="inlineRadio1">Save
                                            as draft</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="typeOfAction" id="pay" value="upload">
                                        <label class="form-check-label"
                                               for="inlineRadio2">Proceed with
                                            payment</label>
                                    </div>
                                </div>
                                <%}%>
                                <div>
                                    <button id="btn-submit" type="submit"
                                            class="btn btn-warning w-100" disabled>Submit
                                        now</button>
                                </div>

                            </form>
                        </div>
                        </section>
                        </main>

                        <!-- ======= Footer ======= -->
                        <section class="section-footer">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-12 col-md-4">
                                        <div class="widget-a">
                                            <div class="w-header-a">
                                                <h3 class="w-title-a text-brand">EstateAgency</h3>
                                            </div>
                                            <div class="w-body-a">
                                                <p class="w-text-a color-text-a">
                                                    Enim minim veniam quis nostrud exercitation
                                                    ullamco laboris
                                                    nisi ut
                                                    aliquip exea
                                                    commodo consequat duis
                                                    sed aute irure.
                                                </p>
                                            </div>
                                            <div class="w-footer-a">
                                                <ul class="list-unstyled">
                                                    <li class="color-a">
                                                        <span class="color-text-a">Phone .</span>
                                                        contact@example.com
                                                    </li>
                                                    <li class="color-a">
                                                        <span class="color-text-a">Email .</span>
                                                        +54 356 945234
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4 section-md-t3">
                                        <div class="widget-a">
                                            <div class="w-header-a">
                                                <h3 class="w-title-a text-brand">The Company</h3>
                                            </div>
                                            <div class="w-body-a">
                                                <div class="w-body-a">
                                                    <ul class="list-unstyled">
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a href="#">Site
                                                                Map</a>
                                                        </li>
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a
                                                                href="#">Legal</a>
                                                        </li>
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a
                                                                href="#">Agent Admin</a>
                                                        </li>
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a
                                                                href="#">Careers</a>
                                                        </li>
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a
                                                                href="#">Affiliate</a>
                                                        </li>
                                                        <li class="item-list-a">
                                                            <i class="bi bi-chevron-right"></i> <a
                                                                href="#">Privacy
                                                                Policy</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4 section-md-t3">
                                        <div class="widget-a">
                                            <div class="w-header-a">
                                                <h3 class="w-title-a text-brand">International sites
                                                </h3>
                                            </div>
                                            <div class="w-body-a">
                                                <ul class="list-unstyled">
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a
                                                            href="#">Venezuela</a>
                                                    </li>
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a
                                                            href="#">China</a>
                                                    </li>
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a href="#">Hong
                                                            Kong</a>
                                                    </li>
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a
                                                            href="#">Argentina</a>
                                                    </li>
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a
                                                            href="#">Singapore</a>
                                                    </li>
                                                    <li class="item-list-a">
                                                        <i class="bi bi-chevron-right"></i> <a
                                                            href="#">Philippines</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <footer>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <nav class="nav-footer">
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a href="#">Home</a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#">About</a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#">Property</a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#">Blog</a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#">Contact</a>
                                                </li>
                                            </ul>
                                        </nav>
                                        <div class="socials-a">
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a href="#">
                                                        <i class="bi bi-facebook" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#">
                                                        <i class="bi bi-twitter" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#">
                                                        <i class="bi bi-instagram" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#">
                                                        <i class="bi bi-linkedin" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="copyright-footer">
                                            <p class="copyright color-text-a">
                                                &copy; Copyright
                                                <span class="color-a">EstateAgency</span> All Rights
                                                Reserved.
                                            </p>
                                        </div>
                                        <div class="credits">

                                            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </footer><!-- End  Footer -->

                        <div id="preloader"></div>
                        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                                class="bi bi-arrow-up-short"></i></a>

                        <!-- Handle Javascript -->
                        <script src="assets/js/edit-detail-post.js"></script>
                        <script>
                            Validator({
                                form: '#form-1',
                                errorSelector: '.invalid-feedback',
                                rules:
                                        [
                                            Validator.checkTextFields('#Post-title', 10, 60),
                                            Validator.checkTextFields('#Detailed-description', 50, 600),
                                            Validator.checkTextFields('#address', 10, 20),
                                            Validator.checkImageFields('#formFileMultiple', 2, 20),
                                            Validator.checkFloatFields('#Rental-price', 20, 10000),
                                            Validator.checkDigitFields('#House-area', 5, 300),
                                            Validator.checkDigitFields('#Number-bedrooms', 1, 300),
                                        ]
                            })
                        </script>

                        <!-- Vendor JS Files -->
                        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
                        <script src="assets/vendor/php-email-form/validate.js"></script>

                        <!-- Template Main JS File -->
                        <script src="assets/js/main.js"></script>

                        <!-- Icon -->
                        <script type="module"
                        src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
                        <script nomodule
                        src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

                        </body>

                        </html>