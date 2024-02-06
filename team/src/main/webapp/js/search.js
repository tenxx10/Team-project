/**
 * 
 */

$(function () {
        $('#searchBtn').click(function () {
            $.ajax({
                url: "../NaverSearchAPI.do",
                type: "get",
                data: {
                    keyword: $('#keyword').val(),
                    startNum: $('#startNum option:selected').val()
                },
                dataType: "json",
                success: sucFuncJson,
                error: errFunc
            });
        });
    });

    function sucFuncJson(d) {
        var str = "";
        $.each(d.items, function (index, item) {
            if (index % 2 === 0) {
                // index가 짝수일 때(한 줄의 시작)
                str += '<div class="row">';
            }

            str += "<div class='col-md-6 mb-3'>";
            str += "   <div class='card'>";
            str += "       <div class='card-body'>";
            str += "           <h5 class='card-title'>" + item.title + "</h5>";
            str += "           <p class='card-text'>" + item.description + "</p>";
            str += "           <p class='card-text'>작성자: " + item.bloggername + "</p>";
            str += "           <p class='card-text'>작성일: " + item.postdate + "</p>";
            str += "           <a href='" + item.link + "' target='_blank' class='btn btn-primary'>바로가기</a>";
            str += "       </div>";
            str += "   </div>";
            str += "</div>";

            if (index % 2 !== 0 || index === d.items.length - 1) {
                // index가 홀수이거나 마지막 아이템일 때(한 줄의 끝)
                str += '</div>';
            }
        });
        $('#searchResult').html(str);
    }

    function errFunc(e) {
        alert("실패 : " + e.status);
    }