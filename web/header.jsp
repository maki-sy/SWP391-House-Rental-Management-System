<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
<nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top ">
    <div class="container">
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarDefault" aria-controls="navbarDefault" aria-expanded="false"
                aria-label="Toggle navigation">
            <span></span>
            <span></span>
            <span></span>
        </button>
        <a class="navbar-brand text-brand" href="trang-chu">Rental<span class="color-b">House</span></a>

        <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
            <ul class="navbar-nav">

                <li class="nav-item" id="home-link">
                    <a class="nav-link" href="trang-chu">Home</a>
                </li>
                <li class="nav-item" id="post-link">
                    <a class="nav-link" href="Post">Houses</a>
                </li>
                <li class="nav-item" id="contact-link">
                    <a class="nav-link" href="Contact">Contact</a>
                </li>
            </ul>
        </div>
        <% if(user == null) { %>
        <div class="nav-item btn" style="padding: 0.35rem 1rem;">
            <a href="login?type=login">Login/Register</a>
        </div>
        <% } else { %>

        <ul class="navbar-nav" style="padding: 0.35rem 2rem;">
            <li class="nav-item">
                <img src="<%=session.getAttribute("userAvatar")%>" class="rounded-circle"
                     style="width: 3rem; margin-left: 6rem" alt="Avatar" />
            </li>
            <li class="nav-item dropdown">

                <a class="nav-link dropdown-toggle" href="#!" id="navbarDropdown" role="button"
                   data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My profile</a>

                <div class="dropdown-menu">
                    <a class="dropdown-item " href="ManageServicesPage">Manage services</a>
                    <a class="dropdown-item " href="Profile?service=displayProfile">Manage account</a>
                    <a class="dropdown-item " href="login?type=logout">Logout</a>
                </div>
            </li>
        </ul>
        <% } %>

        <button style="margin-right: 50px" type="button" class="btn btn-b-n navbar-toggle-box navbar-toggle-box-collapse"
                data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01">
            <i class="bi bi-search"></i>
        </button>
        <% if(user != null) { %>
        <a href="${pageContext.request.contextPath}/ReportCenter?type=general"><i class='fas fa-exclamation-triangle' style='font-size:28px;color:yellow'></i></a>
        <% } %>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var currentUrl = window.location.href;
            if (currentUrl.indexOf("trang-chu") !== -1) {
                document.getElementById("home-link").classList.add("active");
            } else if (currentUrl.indexOf("Post") !== -1) {
                document.getElementById("post-link").classList.add("active");
            } else if (currentUrl.indexOf("Contact") !== -1) {
                document.getElementById("contact-link").classList.add("active");
            }
        });
    </script>
</nav>