 
$(document).ready(function () {
    $("#Notify").hover(function () {
        StopFadeOut();
    });
    $("#Notify").mouseout(function () {
        EnableFadeOut();
    });

});
var timer;


    function ShowNotification(status, msg) {
    switch (status) {
        case 'Success':
            document.getElementById("Notify").className = 'Notify_Success';
            document.getElementById("Notify").innerHTML = msg;
            break;
        case 'Error':
            document.getElementById("Notify").className = 'Notify_Error';
            document.getElementById("Notify").innerHTML = msg;
            //document.getElementById("icon").className = 'imgCss';
            //document.getElementById("icon").src = 'Error.png';

            break;
        case 'Warning':
            document.getElementById("Notify").className = 'Notify_Warning';
            document.getElementById("Notify").innerHTML = msg;
            break;
    }
    $('#Notify').fadeIn("slow");
    timer = setTimeout(function () {
        $('#Notify').fadeOut();
    }, 4000);
}

function StopFadeOut() {
    $('#Notify').stop();
    clearTimeout(timer);
}
function EnableFadeOut() {
    timer = setTimeout(function () {
        $('#Notify').fadeOut();
    }, 2000);
}