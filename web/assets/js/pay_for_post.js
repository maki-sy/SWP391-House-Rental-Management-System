const confirmBasic = (accountBalance, postId) => {
    const isOk = confirm("Do you really want to pay for this basic package?");
    const intPostId = parseInt(postId);
    const intAccountBalance = parseInt(accountBalance);
    const targetBalance = 13;
    const service = "done-add-new-post";
    const status = "basic";

    if (isOk) {
        if (intAccountBalance >= targetBalance) {
            let url = "landlordServicesPage?&service=" + service + "&status=" + status + "&postId=" + intPostId;
            window.location.href = url;
        }
        else {
            const ele = document.querySelector(".balanceProblem");
            ele.style.display = "block";
        }
    }
};

const confirmStandard = (accountBalance, postId) => {
    const isOk = confirm("Do you really want to pay for this standard package?");
    const intPostId = parseInt(postId);
    const intAccountBalance = parseInt(accountBalance);
    const targetBalance = 32;
    const service = "done-add-new-post";
    const status = "standard";

    if (isOk) {
        if (intAccountBalance >= targetBalance) {
            let url = "landlordServicesPage?&service=" + service + "&status=" + status + "&postId=" + intPostId;
            window.location.href = url;
        }
        else {
            const ele = document.querySelector(".balanceProblem");
            ele.style.display = "block";
        }
    }
};

const confirmPremium = (accountBalance, postId) => {
    const isOk = confirm("Do you really want to pay for this premium package?");
    const intPostId = parseInt(postId);
    const intAccountBalance = parseInt(accountBalance);
    const targetBalance = 48;
    const service = "done-add-new-post";
    const status = "premium";
    if (isOk) {
        if (intAccountBalance >= targetBalance) {
            let url = "landlordServicesPage?&service=" + service + "&status=" + status + "&postId=" + intPostId;
            window.location.href = url;
        }
        else {
            const ele = document.querySelector(".balanceProblem");
            ele.style.display = "block";
        }
    }
};
