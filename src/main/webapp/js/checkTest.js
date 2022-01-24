/**
 * 
 */

function check_search(){
	
	if(document.frm.code.value == ""){
		alert("코드를 입력하세요");
		document.frm.code.focus();
		return false;
	}
	
}