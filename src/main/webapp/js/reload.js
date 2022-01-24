/**
 * 
 */

/**
 * 
 */

var price = document.querySelectorAll(".price");

function reloadExchange() {
    $('#exchange_rate').load(location.href+' #exchange_rate');
}

window.setInterval("reloadExchange()", 10000);

function reloadOil() {
    $('#Oil').load(location.href+' #Oil');
}

window.setInterval("reloadOil()", 10000);

function reloadStock() {
    $('#price').load(location.href+' #price');
}

window.setInterval("reloadStock()", 10000);
