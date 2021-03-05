<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>

        <html lang="ja">

        <head>
            <meta charset="Windows-31J">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
            <title>ホーム / Threader</title>
        </head>

        <body style="background-color: #52B785;">
            <main>
                <div class="container-fluid">
                    <div class="row">
                        <!-- 右寄せ用 -->
                        <div class="col-1"></div>
                        <!-- sidebar -->
                        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-1 col-1 d-none d-md-block" id="top">
                            <div class="row d-flex flex-column align-items-center sticky-top">
                                <a href="thread" style="color: #e0193f;"><i class="fas fa-apple-alt fa-fw fa-4x mt-3 my-3"></i></a>
                                <a href="thread" data-toggle="tooltip" data-placement="left" title="ホームに戻る" style="color: white;"><i class="fas fa-home fa-fw fa-3x my-4"></i></a>
                                <a href="logout" data-toggle="tooltip" data-placement="left" title="ログアウト" style="color: white;"><i class="fas fa-sign-out-alt fa-fw fa-3x my-4"></i></a>
                                <a class="btn rounded-circle shadow my-3" role="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="background-color: #EBD870;  color: black;"><i class="far fa-edit fa-fw fa-2x py-2" data-toggle="tooltip" data-placement="left" title="つぶやく"></i></a>
                                <a href="#top" class="my-2"><i class="far fa-arrow-alt-circle-up   fa-fw fa-4x my-3" style="color: white;"></i></a>
                                <a href="#bottom" class="my-2"><i class="far fa-arrow-alt-circle-down fa-fw fa-4x" style="color: white;"></i></a>
                            </div>
                        </div>

                        <!-- center -->
                        <div class="col-xl-6 col-lg-9 col-md-9 col-sm-10 col-12" style="background-color: #52B785;">
                            <div class="row sticky-top" id="top">
                                <div class="col-12" style="border-left: 3px solid #DBE9FF; border-right: 3px solid #DBE9FF; border-bottom: 3px solid #DBE9FF; border-top-style: none; background-color: #fff;">
                                    <p class="h3 my-3 ml-1 font-weight-bold"><a href="thread#top" style="text-decoration: none; color: black;">ホーム</a> </p>
                                </div>
                            </div>

                            <!-- 投稿 -->
                            <div class="collapse" id="collapseExample" >
                                <div class="row border bg-white" style="border: 3px solid #DBE9FF; border-top: none;">
                                    <!-- icon -->
                                    <div class="col-xl-1 col-lg-3 col-md-2 col-sm-2 col-3" style="border-left: 3px solid #DBE9FF; border-bottom: 3px solid #DBE9FF; ">
                                        <i class="far fa-user-circle fa-4x my-4"></i>
                                    </div>
                                    <!-- form -->
                                    <div class="col-xl-11 col-lg-10 col-md-10 col-sm-10 col-9" style="border-bottom: 3px solid #DBE9FF; border-right: 3px solid #DBE9FF;">
                                        <form method="POST" action="thread" class="userInfo">
                                            <div class="form-group">
                                                <div class="input-group input-group-lg mt-4">
                                                    <textarea name="content" id="textarea" class="form-control form-control-lg " placeholder="いまどうしてる？" data-max-length="560" required></textarea>
                                                </div>
                                                <textarea name="tag" id="inputUserTag" class="form-control form-control-lg" placeholder="タグを入力して下さい" data-max-length="60"></textarea>
                                            </div>
                                            <div class="text-right">
                                                <button type="submit" class="btn btn-success btn-lg my-3 mb-2 rounded-pill font-weight-bold" onclick="AddStringSharp();"><span>つぶやく</span></button>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- formここまで -->
                                </div>
                            </div>
                            <!-- 投稿 -->

                            <!-- tweet -->
                            <c:forEach var="thread" items="${threads}">
                                <div class="row" style="border: 3px solid #DBE9FF; border-top-style: none; background-color: #fff;">
                                    <!-- face icon -->
                                    <div class="col-xl-1 col-lg-1 col-md-2 col-sm-2 col-3 my-4">
                                        <i class="far fa-user-circle fa-4x"></i>
                                    </div>

                                    <div class="col-xl-11 col-lg-11 col-md-10 col-sm-10 col-9 mt-4">
                                        <span class="h4"><c:out value="${thread.user_name}" /></span>
                                        <span class="h6 ml-3" style="color: gray;"><c:out value="${thread.date}" /></span>
                                        <p class="h4 my-3" style="white-space: pre-wrap; word-break: break-all;"><c:out value="${thread.content}" /></p>
                                        <p class="h4 my-3" style="color: cornflowerblue;white-space: pre-wrap; word-break: break-all;"><c:out value="${thread.tag}" /></p>
                                        <!-- icons -->
                                        <div class="row">
                                            <!-- reply button -->
                                            <div class="col-xl-3 col-2">
                                                <a href="res?threadid=${thread.thread_id}" data-toggle="tooltip" data-placement="left" title="返信" style="color:black;" ><i class="far fa-comment fa-fw fa-lg mt-3 mb-4"></i></a>
                                            </div>
                                            <!-- likes button -->
                                            <div class="col-xl-3 col-2">
                                                <a href="like?threadid=${thread.thread_id}" class="mt-2" data-toggle="tooltip" data-placement="top" title="いいね"><i class="far fa-heart fa-fw fa-lg mt-3 mb-4" style="color: red;"><span class="ml-2" style="color: black; font-size: 21px;">${thread.likes}</span></i></a>
                                            </div>
                                            <!-- delete button -->
                                            <div class="col-xl-3 col-2">
                                                <a href="delete?threadid=${thread.thread_id}" class="mt-2" data-toggle="tooltip" data-placement="right" title="ツイートを削除"><i class="far fa-trash-alt fa-fw fa-lg mt-3 mb-4" style="color: black;"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- tweet -->
                        </div>
                        <!-- centerここまで -->

                        <!-- right -->
                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3">
                            <div class="sticky-top">
                                <div class="col-12">
                                    <!-- 検索フォーム -->
                                    <div class="row">
                                        <form method="POST" action="search" class="ml-5 mt-2 w-100" id="search-form" name="search-form" >
                                            <div class="form-group row">
                                                <div class="input-group-prepend">
                                                    <button class="btn btn-secondary px-3 rounded-circle" type="submit" id="button-addon1" style="border: none; background-color: white; border-radius: 75%"><i class="fas fa-search  fa-1x" style="color: cornflowerblue;"></i></button>
                                                </div>
                                                <input type="text" name="tag" class="form-control form-control-lg col-10 w-100 ml-3 py-4" data-max-length="30" placeholder="タグ検索" aria-label="text with button addon" aria-describedby="button-addon1" pattern="\S+"  style="border-radius: 100px; background-color: white;"  required>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                    <!-- 検索フォーム -->

                                <!-- 現在のユーザー -->
                                <div class="col-12 mt-3 ml-4 p-5 login-user" style="background-image: url(images/cork_board.png); background-size: 450px 260px;">
                                    <div class="row mx-auto">
                                        <p class="h3 font-weight-bold mx-auto pt-3 py-2 pb-3">現在のユーザー</p>
                                    </div>
                                    <div class="row mx-auto border-top border-dark">
                                        <p class="h2 ml-4 pt-4 pb-4 mx-auto">${targetName.name}</p>
                                    </div>
                                    <!-- <p class="font-weight-bold p-4 pt-5" style="color: #e0193f; font-size: 30px; margin-top: 10%;">${errorMess}</p> -->
                                </div>
                                <!-- 現在のユーザー -->

                                <div class="col-12 mt-1 ml-4">
                                    <div class="row mx-auto">
                                        <p class="font-weight-bold p-2 pt-2" style="color: yellow; font-size: 32px; ">${errorMess}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <!-- 下に移動用 -->
            <footer id="bottom"></footer>

            <!-- スマホ用 -->
            <footer class="fixed-bottom d-block d-sm-none">
                <div class="col-12">
                    <div class="row flex-row-reverse" style="margin-right: 18px;">
                        <a href="" class="btn btn-primary btn-lg rounded-circle shadow mb-3" role="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="color: white;">+</a>
                    </div>
                </div>
                <div class="container border-top bg-white">
                    <div class="row">
                        <div class="col-12 d-flex flex-row">
                            <div class="col-3 my-3">
                                <a href="thread" id="#top" style="color: cornflowerblue;"><i class="fas fa-home fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 mr-2">
                                <a href="thread" style="color: gray"><i class="fas fa-search fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 mr-2">
                                <a href="regist.jsp" style="color: gray"><i class="far far fa-user fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 mr-2">
                                <a href="regist.jsp" style="color: gray"><i class="far far fa-envelope fa-fw fa-lg"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

            <script>
                // テキストエリアで空白と改行だけ送信をブロック
                $('.userInfo').on('submit', function (evt) {
                    if (!$('#textarea').val().match(/[^\s]+/)) {
                        evt.preventDefault();
                        evt.stopPropagation();
                    }
                });



                // 検索用
                function check() {
                    var a = document.search_form.q.value;
                    if (a == "") {
                        return false;
                    } else if (!a.match(/\S/g)) {
                        return false;
                    }
                }
                // テキストエリアの高さ自動調整
                $("textarea").attr("rows", 2).on("input", e => {
                    $(e.target).height(0).innerHeight(e.target.scrollHeight);
                });
                // スクロール用
                const smoothScrollTrigger = document.querySelectorAll('a[href^="#"]');
                for (let i = 0; i < smoothScrollTrigger.length; i++) {
                    smoothScrollTrigger[i].addEventListener('click', (e) => {
                        e.preventDefault();
                        let href = smoothScrollTrigger[i].getAttribute('href');
                        let targetElement = document.getElementById(href.replace('#', ''));
                        const rect = targetElement.getBoundingClientRect().top;
                        const offset = window.pageYOffset;
                        const gap = 60;
                        const target = rect + offset - gap;
                        window.scrollTo({
                            top: target,
                            behavior: 'smooth',
                        });
                    });
                }
                // いいねしたときに位置を保持するやつ
                $(window).scroll(function () {
                    sessionStorage.scrollTop = $(this).scrollTop();
                });
                $(document).ready(function () {
                    if (sessionStorage.scrollTop != "undefined") {
                        $(window).scrollTop(sessionStorage.scrollTop);
                    }
                });
                // ツールチップ用
                $('[data-toggle="tooltip"]').tooltip();

                //  半角と全角判定用
                $(document).ready(function () {
                    $(document).on('change keyup focus', '[data-max-length]', function () {
                        var arr = $(this).val().split('');
                        var len = 0;
                        var maxlen = parseInt($(this).attr('data-max-length'));
                        var str = '';
                        for (i in arr) {
                            len += (escape(arr[i]).match(/%u..../) && !(arr[i]).match(/^[ｦ-ﾟ]$/)) ? 2 : 1;
                            if (len <= maxlen) {
                                str += arr[i];
                            }
                        }
                        $(this).val(str);
                        return;
                    });
                });

                // タグの追加
                function AddStringSharp(){
                    var splitWord = (/,|、|\n/); //分割したいワード
                    var splitStringArray = document.getElementById('inputUserTag').value.split(splitWord);
                    var combinedResult = ""; //結合結果

                    var Length = splitStringArray.length;
                    for(var i = 0; i < Length ; i++){
                        if(Length === 0){ //そもそもタグが入力されていないなら何もしない
                            break;
                        }
                        
                        // もし最初の文字が「＃」または何も入力されていない時には「＃」は追加しない
                        if((splitStringArray[i].slice(0,1) === "#") || (splitStringArray[i].slice(0,1).length === 0)){
                            combinedResult += (splitStringArray[i] + "\n");
                            continue;
                        }

                        // 最後が空行じゃないなら頭文字に「＃」を追加
                        if(!(i === Length-1 && splitStringArray[i].length === 0)){
                            combinedResult += ("#" + splitStringArray[i] + "\n");
                        }
                    }
                    document.getElementById('inputUserTag').value = combinedResult;
                }
            </script>
        </body>

        </html>
