$(document).ready(function(){
    var i = 0;
    var image=$(".Slider");
    var counter = image.length;
    function slide(){
        if(i==counter){i=0;}
        if(i<0){i=counter;}
        for(var j=0;j<counter;j++){
            image[j].style.display = "none";
        }
        image[i].style.display = "block";
        i++;
    }
    setInterval(slide,2000);
    setTimeout(function(){$(".welcome")[0].style.display="block"}, 5000);
});