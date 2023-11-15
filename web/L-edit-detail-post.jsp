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

        <title>Post editing | RentalHouse</title>
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
        <link href="assets/css/customer-card.css" rel="stylesheet">

    </head>

    <body>
        <!-- ======= JSP ======= -->
        <% String role=session.getAttribute("role")==null ? null : (String) session.getAttribute("role");
            Object loggedUser=session.getAttribute("user")==null ? null : session.getAttribute("user");
            PostRental post = (PostRental)request.getAttribute("post");
            ArrayList<String> urlList = (ArrayList<String>)request.getAttribute("urlList");
        %>
        <!-- End JSP Code -->

        <!-- ======= Header/Navbar ======= -->
        <%@include file="header.jsp" %>

        <!-- End Header/Navbar -->

        <main id="main" style="margin-top: 3rem">
            <section class="section-news section-t3">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">Manage Service</a></li>
                                    <li class="breadcrumb-item"><a href="#">Edit Post And Draft</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Post Detail</li>
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
                                            aria-current="true">Edit post</li>
                                        <li class="list-group-item text-bg-warning">
                                        <ion-icon name="card-outline"></ion-icon>
                                        <span>Account balance: </span>
                                        <span>
                                            $ <%=session.getAttribute("accountBalance")%>
                                        </span>
                                        </li>
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
                                                class="text-bg-warning">--Keep old photos--</span><span>
                                                Keep all original photos intact</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Add new photos--</span><span>
                                                Keep all original photos intact and add new uploaded photos</span></li>
                                        <li class="list-group-item"><span
                                                class="text-bg-warning">--Replace photos--</span><span>
                                                Delete all old photos, add new posted photos</span></li>
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
                            <%@include file="L-service-sidebar.jsp" %>
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
                                               name="add-or-replace" id="keep" value="keep" checked>
                                        <label class="form-check-label" for="inlineRadio1">Keep old photos</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="add-or-replace" id="add-new-photo" value="add-new-photo">
                                        <label class="form-check-label" for="inlineRadio1">Add new photos</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="add-or-replace" id="replace-photo" value="replace-photo">
                                        <label class="form-check-label"
                                               for="inlineRadio2">Replace photos</label>
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
                        <%@include file="footer.jsp" %>
                        <!-- End  Footer -->

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
                                            Validator.checkTextFields('#address', 10, 60),
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