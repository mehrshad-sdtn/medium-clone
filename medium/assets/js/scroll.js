let header = document.querySelector('header');
let startBtn = document.querySelector("#start-btn")
window.addEventListener('scroll', () => { 
    if(this.pageYOffset > 410){  
       header.className = header.className.replace("bg-blue-200", "bg-white"); 
       startBtn.className = startBtn.className.replace("bg-black", "bg-green-600");
       
    }
    else{     
        header.className = header.className.replace("bg-white", "bg-blue-200"); 
        startBtn.className = startBtn.className.replace("bg-green-600", "bg-black"); 
    }
});


