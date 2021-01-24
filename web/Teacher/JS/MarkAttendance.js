${document}.ready(function(){
    var date = new Date();
    var H = date.getDay();
    var M = date.getMinutes();
    var m = date.getMonth();
    var y = date.getYear();
    staffID = H+" "+M;
    console.log(staffID);
    
});