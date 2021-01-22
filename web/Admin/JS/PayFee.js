$(document).ready(function(){
    
    var objLength = Object.keys(StudentList).length - 2;
    var date = new Date();
    var H = date.getHours();
    var M = date.getMinutes();
    var S = date.getSeconds();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getYear();
    Receiptid = y+""+d+""+H+""+m+""+M+""+S;
    // console.log(Receiptid);
    $("#SearchStd").on("input", function(){
        var SearchSTD = $(this).val();
        console.log(SearchSTD);
        StdStartTable = "<table><tr><Th style='width:120px;height:40px;'>Student Id</th><th style='width:200px;height:40px;'>Student Name</th><th style='width:200px;height:40px;'>Father Name</th><th style='width:150px;height:40px;'>Course ID</th><th style='width:100px;height:40px;'>Fee</th><th style='width:400px;height:40px;'>Enter Fee</th></tr>";
        StdEndTable = "</table>";
        for(i=0;i<=objLength;i++){
            if(StudentList[i][1].toLowerCase().includes(SearchSTD.toLowerCase())){
                StdStartTable = StdStartTable + "<tr><td>"+StudentList[i][0]+"</td><td>"+StudentList[i][1]+"</td><td>"+StudentList[i][2]+"</td><td>"+StudentList[i][3]+"</td><td>"+StudentList[i][4]+"</td><td><form method='post' action='AcceptFee.jsp'><input type='text' name='fee' placeholder='Enter Fee' style='height:40px;width:150px;'><input type='hidden' name='StdId' value="+StudentList[i][0]+"><input type='hidden' name='CourseFee' value="+StudentList[i][4]+"><input type='hidden' name='ReceiptId' value="+Receiptid+"><input type='submit' value='Submit'></form></td></tr>";
            }
        }
        $("#show_Detail").html(StdStartTable+StdEndTable);
    });
});