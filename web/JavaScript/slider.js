var i = 0;
var image=document.querySelectorAll(".Slider");
var counter = image.length;
function slide(){
    // function next(){i++; console.log("run");}
    // function previous(){i--; console.log("i in prev = " +i);}
    // console.log("i in slide = "+i);
    if(i==counter){i=0;}
    if(i<0){i=counter;}
    for(var j=0;j<counter;j++){
        image[j].style.display = "none";
    }
    image[i].style.display = "block";
    i++;
    // slide.next = next;
    // slide.previous = previous;
}
// console.log(i);
// slide();
setInterval(slide,2000);
setTimeout(function(){document.getElementsByClassName("welcome")[0].style.display="block"}, 5000);