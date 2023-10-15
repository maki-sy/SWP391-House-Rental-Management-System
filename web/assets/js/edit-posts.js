const confirmDelete = (postId) => {
    const service = "delete-post";
    console.log(postId);
    const isOk = confirm("Do you want to delete this post permanently?");
    if (isOk) {
        let url = "landlordServicesPage?post-id=" + postId + "&service=" + service;
        window.location.href = url;
    }
};

