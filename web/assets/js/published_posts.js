const confirmRemoveToDraft = (postId) => {
    const service = "move-post-to-draft";
    console.log(postId);
    const isOk = confirm("Do you want to move this post to draft ?");
    if (isOk) {
        let url = "landlordServicesPage?post-id=" + postId + "&service=" + service;
        window.location.href = url;
    }
};

