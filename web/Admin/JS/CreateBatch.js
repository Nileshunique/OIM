$(document).ready(function(){
    $("#TchId").on("change", function(){
        TchId = $(this).val();
        CourId = $("#CourId").val();
        BTime = $("#BTime").val();
        BName = $("#BName").val();
        console.log(TchId +" "+ CourId +" "+ BTime +" "+ BName);
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'CreateBatchResponse.jsp?Cid='+CourId+'&Tid='+TchId+'&Btime='+BTime+'&Bname='+BName, true);
        xhr.onload = function(){
            // console.log(this.responseText);
            $('.responds').html(this.responseText);
        }
        xhr.send();
    });
    $("#CourId").on("change", function(){
        CourId = $(this).val();
        TchId = $("#TchId").val();
        BTime = $("#BTime").val();
        BName = $("#BName").val();
        url = 'CreateBatchResponse.jsp?Cid='+CourId+'&Tid='+TchId+'&Btime='+BTime+'&Bname='+BName;
        console.log(url);
        console.log(TchId +" "+ CourId +" "+ BTime +" "+ BName);
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'CreateBatchResponse.jsp?Cid='+CourId+'Tid='+TchId+'Btime='+BTime+'Bname='+BName, true);
        xhr.onload = function(){
            // console.log(this.responseText);
            $('.responds').html(this.responseText);
        }
        xhr.send();
    });$("#BName").on("change", function(){
        BName = $(this).val();
        console.log(BName)
        if(BName=="Bch001"){
            $(".b1").show();
            $(".b2").hide();
        }
        if(BName=="Bch002"){
            $(".b1").hide();
            $(".b2").show();
        }
    });
});