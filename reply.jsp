<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>

        <html lang="ja">

        <head>
            <meta charset="SJIS">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
            <title>返信 / Threader</title>
        </head>

        <body style="background-color: #52B785;">
            <main>
                <div class="container-fluid" >
                    <div class="row">
                        <!-- 右寄せ用 -->
                        <div class="col-1"></div>
                        <!-- sidebar -->
                        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-1 col-1 d-none d-md-block" id="top">
                            <div class="row d-flex flex-column align-items-center sticky-top">
                                <a href="thread" style="color: #e0193f;"><i class="fas fa-apple-alt fa-fw fa-4x mt-3 my-3"></i></a>
                                <a href="thread" data-toggle="tooltip" data-placement="left" title="ホームに戻る" style="color: white;"><i class="fas fa-home fa-fw fa-3x my-4"></i></a>
                                <a href="logout" data-toggle="tooltip" data-placement="left" title="ログアウト" style="color: white;"><i class="fas fa-sign-out-alt fa-fw fa-3x my-4"></i></a>
                                <a href="#top" class="my-2"><i class="far fa-arrow-alt-circle-up   fa-fw fa-4x my-3" style="color: white;"></i></a>
                                <a href="#bottom" class="my-2"><i class="far fa-arrow-alt-circle-down fa-fw fa-4x" style="color: white;"></i></a>
                            </div>
                        </div>

                        <!-- center -->
                        <div class="col-xl-6 col-lg-9 col-md-9 col-sm-9 col-12">
                            <!-- スマホのみ表示 -->
                            <div class="d-block d-sm-none">
                                <div class="row border-bottom justify-content-end mt-1">
                                    <div class="col-xl-1 col-lg-2 col-md-2 col-sm-2 col-3">
                                        <i class="far fa-user-circle fa-4x my-4"></i>
                                    </div>
                                    <div class="col-11"> 
                                        <a href="thread"><i class="fas fa-long-arrow-alt-left fa-fw fa-lg mx-2 my-3"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- スマホ以上で表示 -->
                            <div class="sticky-top d-none d-sm-block" id="top" >
                                <div class="row bg-white border border-top">
                                    <!-- arrow icon -->
                                    <div class="col-1">
                                        <a href="thread"><i class="fas fa-long-arrow-alt-left fa-fw fa-2x my-3 ml-2" style="color: cornflowerblue"></i></a>
                                    </div>
                                    <div class="col-11">
                                        <p class="h3 my-3 font-weight-bold">返信</p>
                                    </div>
                                </div>
                            </div>

                            <!-- 返信元tweet -->
                            <div class="row bg-white border" id="tweet" style="border:3px solid;">
                                <div class="col-xl-1 col-lg-2 col-md-2 col-sm-2 col-3">
                                    <i class="far fa-user-circle fa-4x my-4"></i>
                                </div>
                                <div class="col-xl-10 col-lg-10 col-md-10 col-sm-10 col-10 mt-4 mb-2">
                                    <span class="h4"><c:out value="${targetThreads.user_name}" /></span>
                                    <p class="h4 my-3" style="white-space: pre-wrap; word-break: break-all;"><c:out value="${targetThreads.content}" /></p>
                                    <p class="h5 text-muted mb-3"><c:out value="${targetThreads.date}" /></p>
                                </div>
                                <div class="col-xl-1"></div>
                            </div>
                            <!-- 返信元tweetここまで -->

                            <!-- 返信ツイート一覧 -->
                            <c:forEach var="resThread" items="${resThreads}">
                                <div class="row border border-top-0 bg-white">
                                    <!-- face icon -->
                                    <div class="col-xl-1 col-lg-1 col-md-2 col-sm-2 col-3 my-4">
                                        <i class="fab fa-font-awesome-flag fa-2x"></i>
                                    </div>

                                    <div class="col-xl-10 col-lg-10 col-md-10 col-sm-10 col-9 mt-4">
                                        <span class="h4"><c:out value="${resThread.res_name}" /></span>
                                        <span class="h6 ml-3" style="color: gray;"><c:out value="${resThread.res_date}" /></span>
                                        <p class="h4 my-3" style="white-space: pre-wrap; word-break: break-all;"><c:out value="${resThread.res_content}" /></p>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- 返信ツイート一覧ここまで -->

                            <!-- 投稿フォーム -->
                            <div class="row border bg-white" style="border: 3px solid #DBE9FF; border-top: none;">
                                <!-- form -->
                                <div class="col-xl-12 col-lg-10 col-md-10 col-sm-10 col-9" style="border-bottom: 3px solid #DBE9FF; border-right: 3px solid #DBE9FF;">
                                    <form method="POST" action="thread" class="userInfo">
                                        <div class="form-group">
                                            <div class="input-group input-group-lg mt-4">
                                                <textarea name="content" id="textarea" class="form-control form-control-lg " placeholder="いまどうしてる？" data-max-length="560" required></textarea>
                                            </div>
                                        </div>
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary btn-lg my-3 mb-2 rounded-pill font-weight-bold"><span>返信</span></button>
                                        </div>
                                    </form>
                                </div>
                                <!-- formここまで -->
                            </div>
                            <!-- 投稿フォームここまで -->
                        </div>

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
                                <div class="col-12 mt-3 ml-4 p-5 login-user" style="background-image: url(images/cork_board.png); background-size: 450px 275px;">
                                    <div class="row mx-auto">
                                        <p class="h3 font-weight-bold mx-auto pt-3 py-2 pb-3">現在のユーザー</p>
                                    </div>
                                    <div class="row mx-auto border-top border-dark">
                                        <p class="h2 ml-4 pt-4 pb-4 mx-auto">${targetName.name}</p>
                                    </div>
                                </div>
                                <!-- 現在のユーザー -->
                            </div>
                        </div>
                        
                    </div>
                </div>
            </main>

            <!-- スマホのみ表示 -->
            <footer class="border-top fixed-bottom bg-white"> 
                <div class="container d-block d-sm-none">
                    <div class="row">
                        <div class="col-12 d-flex flex-row ">
                            <div class="col-3 my-3 ml-2">
                                <a href="thread" style="color: cornflowerblue;"><i class="fas fa-home fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 ml-2">
                                <a href="thread" style="color: gray"><i class="fas fa-search fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 ml-2">
                                <a href="regist.jsp" style="color: gray"><i class="far far fa-user fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 ml-2">
                                <a href="thread" style="color: gray"><i class="far fa-envelope fa-fw fa-lg"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- スマホのみ表示ここまで -->
            <script>
                $('.userInfo').on('submit', function (evt) {
                    if (!$('#textarea').val().match(/[^\s]+/)) {
                        evt.preventDefault();
                        evt.stopPropagation();
                    }
                });
                // テキストエリアの高さ自動調整
                $("textarea").attr("rows", 2).on("input", e => {
                    $(e.target).height(0).innerHeight(e.target.scrollHeight);
                });

                $('[data-toggle="tooltip"]').tooltip();
            </script>

        </body>

        </html>
        <!--
        xl 1200px以上
        lg 992px以上
        md 768px以上
        sm 576px以上
        (xs)　576px未満
    -->