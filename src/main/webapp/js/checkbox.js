/**
 * 
 */

let all = document.querySelector("#all");
let chk = document.getElementsByClassName("chk");

function check(){
        for(let i = 0; i < chk.length; i++){
            chk[i].checked = all.checked;
        }
}

all.addEventListener("change", check);

