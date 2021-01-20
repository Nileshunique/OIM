$(document).ready(function(){
    $('#cid').on("blur",function(){
        myVal = $(this).val();
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'CourseResponse.jsp?cid='+myVal, true);
        xhr.onload = function(){
            // console.log(this.responseText);
            $('.responds').html(this.responseText);
        }
        xhr.send();
    });
});