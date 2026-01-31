function admintoggle() {
    const admincheck = document.getElementById("admin");
    const customercheck = document.getElementById("customer");
    const role = document.getElementById("role");

    admincheck.style.backgroundColor = "#38ADA9";
    customercheck.style.backgroundColor = "white";
    customercheck.style.color = "black";
    admincheck.style.color = "white";
    role.value = "admin";
}

function custtoggle() {
    const admincheck = document.getElementById("admin");
    const customercheck = document.getElementById("customer");
    const role = document.getElementById("role");

    admincheck.style.backgroundColor = "white";
    customercheck.style.backgroundColor = "#38ADA9";
    customercheck.style.color = "white";
    admincheck.style.color = "black";
    role.value = "customer";
}

function togglepass() {
    const pass = document.getElementById("pass");
    //const checkbox = document.getElementById("mycheck");
    if (pass.type === "password") {
        //checkbox.checked = "true";
        pass.type = "text";
    } else {
        //checkbox.checked = "false";
        pass.type = "password";
    }
}
function togglepass2() {
    const pass = document.getElementById("pass2");
    //const checkbox = document.getElementById("mycheck2");
    if (pass.type === "password") {
        //checkbox.checked = "true";
        pass.type = "text";
    } else {
        //checkbox.checked = "false";
        pass.type = "password";
    }
}