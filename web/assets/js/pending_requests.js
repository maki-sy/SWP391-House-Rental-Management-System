const confirmReject = (orderId) => {
    const service = "reject-request";
    console.log(orderId);
    const isOk = confirm("Do you want to reject this tenant request?");
    if (isOk) {
        let url = "landlordServicesPage?order-id=" + orderId + "&service=" + service;
        window.location.href = url;
    }
};

const confirmApprove = (orderId) => {
    const service = "approve-request";
    console.log(orderId);
    const isOk = confirm("Do you want to approve this tenant request?");
    if (isOk) {
        let url = "landlordServicesPage?order-id=" + orderId + "&service=" + service;
        window.location.href = url;
    }
};