$(document).ready(function(){
    $('#cid').on("blur",function(){
        myVal = $(this).val();
        sessionStorage.setItem('cid', myVal);
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'CourseResponse.jsp?cid='+myVal, true);
        xhr.onprogress = function(){
        }
        xhr.onload = function(){
            // console.log(this.responseText);
            $('.responds').html(this.responseText);
        }
        xhr.send();
    });
});