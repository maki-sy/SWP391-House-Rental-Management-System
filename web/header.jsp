<nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
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

                <li class="nav-item">
                    <a class="nav-link active" href="trang-chu">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="Post">Houses</a>

                </li>
<!--
                <li class="nav-item">
                    <a class="nav-link " href="agents-grid.jsp">Landlords</a>
                </li>-->
<!--                <li class="nav-item">
                    <a class="nav-link " href="PromotionManage">Promotion</a>
                </li>-->

<!--                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">Pages</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item " href="property-single.jsp">House Detail</a>
                        <a class="dropdown-item " href="agent-single.jsp">Landlord Detail</a>
                    </div>
                </li>-->

                <li class="nav-item">
                    <a class="nav-link " href="contact.jsp">Contact</a>
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
                <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle"
                     style="width: 3rem; margin-left: 6rem" alt="Avatar" />
            </li>
            <li class="nav-item dropdown">

                <a class="nav-link dropdown-toggle" href="#!" id="navbarDropdown" role="button"
                   data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My profile</a>

                <div class="dropdown-menu">
                    <a class="dropdown-item " href="ManageServicesPage">Manage services</a>
                    <a class="dropdown-item " href="Profile?service=displayProfile&id=<%= user.getId() %>&roleid=<%= user.getRoleID() %>">Manage account</a>
                    <a class="dropdown-item " href="login?type=logout">Logout</a>
                </div>
            </li>
        </ul>
        
        <% } %>

        <button type="button" class="btn btn-b-n navbar-toggle-box navbar-toggle-box-collapse"
                data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01">
            <i class="bi bi-search"></i>
        </button>

    </div>
</nav>