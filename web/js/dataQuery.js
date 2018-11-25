function showBook(categoryID) {
    xmlHttp.onreadystatechange=function () {
        if (xmlHttp.readyState==4){
            if (xmlHttp.status==200){
                var data=xmlHttp.responseText;
                document.getElementById("book").innerHTML=data;
            }
        }
    }
    xmlHttp.open("GET","getBook.jsp?id="+categoryID,true);
    xmlHttp.send();
}