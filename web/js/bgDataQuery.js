/*后台页面的js代码*/
function showAdmin(categoryID) {
    xmlHttp.onreadystatechange=function () {
        if (xmlHttp.readyState==4){
            if (xmlHttp.status==200){
                var data=xmlHttp.responseText;
                document.getElementById("book").innerHTML=data;
            }
        }
    }
    xmlHttp.open("GET","showAdmin.jsp",true);
    xmlHttp.send();
}

function getUser() {
    xmlHttp.onreadystatechange=function () {
        if (xmlHttp.readyState==4){
            if (xmlHttp.status==200){
                var data=xmlHttp.responseText;
                document.getElementById("book").innerHTML=data;
            }
        }
    }
    xmlHttp.open("GET","getUser.jsp",true);
    xmlHttp.send();


}

function showUser(username) {
    xmlHttp.onreadystatechange=function () {
        if (xmlHttp.readyState==4){
            if (xmlHttp.status==200){
                var data=xmlHttp.responseText;
                document.getElementById("book").innerHTML=data;
            }
        }
    }
    xmlHttp.open("GET","showAdmin.jsp",true);
    xmlHttp.send();
}










function showMessage() {
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4) {
            if(xmlHttp.status == 200) {
                var data = xmlHttp.responseText;
                document.getElementById("book").innerHTML = data;
            }
        }
    };
    xmlHttp.open("GET", "client/getBook.jsp?id="+categoryID, true);
    xmlHttp.send();
}

function showMessage2() {

    var data = new FormData(document.getElementById("form2"));
    var s=data+data.values()+data.name;
    document.getElementById("p1").innerHTML=s;
    var req = new XMLHttpRequest();
    req.onreadystatechange =function(){
        if(req.readyState==4){
            if(req.status==200){
                console.log(typeof req.responseText);
                /*var json=JSON.parse(req.responseText);
                var result = '';
                result +="个人信息：<br/>name:"+json['bookId']+"<br/>gender:"+json['gender']+"<br/>number:"+json['number'];
                result += '<br/>头像：<img src="' + json['photo'] + '" height="50" style="border-radius: 50%;" />';

                $('#result').html(result);*/
            }
        }
    };
    //req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req.open("post", "/updateBookServlet", false);
    req.send(data);
}

function outputForm() {
    var data = new FormData(document.getElementById("form2"));

//             var req = new XMLHttpRequest();
//             req.open("post", "${pageContext.request.contextPath}/public/testupload", false);
//             req.send(form);
    $.ajax({
        url:"/updateBookServlet",
        type:"post",
        data:data,
        processData:false,
        contentType: /*false*/  'multipart/form-data',
        success:function(data){
            window.clearInterval(timer);
            console.log("over..");
        },
        error:function(e){
            alert("错误！！");
            window.clearInterval(timer);
        }
    });
    get();//此处为上传文件的进度条
}

function getResult(bookId,bookName) {
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4) {
            if(xmlHttp.status == 200) {
                var data = xmlHttp.responseText;
                document.getElementById("result").innerHTML = data;
            }
        }
    };
    xmlHttp.open("GET", "getResult.jsp?bookId="+bookId&+"bookName="+bookName, true);
    xmlHttp.send();
}
