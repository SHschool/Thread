<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>

        <html lang="ja">

        <head>
            <meta charset="Shift-jis">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
            <title>返信</title>
        </head>

        <body>
            <main>
                <div class="container-fluid">
                    <div class="row">
                        <!-- 右寄せ用 -->
                        <div class="col-1"></div>
                        <!-- sidebar -->
                        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-1 col-1 d-none d-md-block" id="top">
                            <div class="row d-flex flex-column align-items-center sticky-top">
                                <a href="thread" style="color: cornflowerblue;"><i class="fab fa-twitter fa-fw fa-3x mt-3 my-3"></i></a>
                                <a href="thread" style="color: cornflowerblue;"><i class="fas fa-home fa-fw fa-2x my-3"></i></a>
                                <a href="         " style="color: black;"><i class="fas fa-hashtag fa-fw fa-2x my-3"></i></a>
                                <a href="         " style="color: black;"><i class="far fa-bell fa-fw fa-2x my-3"></i></a>
                                <a href="regist.jsp" style="color: black"><i class="far fa-user fa-fw fa-2x my-3"></i></a>
                                <!-- <a href="" class="btn btn-primary rounded-circle shadow my-3" role="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="color: white;"><i class="far fa-edit fa-fw py-2"></i></a> -->
                                <a href="#top"    class="my-2"><i class="far fa-arrow-alt-circle-up   fa-fw fa-3x" style="color: black;"></i></a>
                                <a href="#bottom" class="my-2"><i class="far fa-arrow-alt-circle-down fa-fw fa-3x" style="color: black;"></i></a>
                            </div>
                        </div>

                        <!-- center -->
                        <div class="col-xl-7 col-lg-9 col-md-9 col-sm-9 col-12">
                            <!-- スマホのみ表示 -->
                            <div class="d-block d-sm-none">
                                <div class="row border-bottom justify-content-end mt-1">
                                    <div class="col-12"> 
                                        <a href="thread"><i class="fas fa-long-arrow-alt-left fa-fw fa-lg mx-2 my-3"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- スマホ以上で表示 -->
                            <div class="row sticky-top d-none d-sm-block" id="top">
                                <div class="col-12 bg-white border border-top">
                                    <p class="h3 my-3 ml-1 font-weight-bold">返信</p>
                                </div>
                            </div>

                            <!-- 返信元tweet -->
                            <div class="row border border-top-0" style="border-width: 10px;">
                                <div class="col-xl-1 col-lg-2 col-md-2 col-sm-2 col-2 my-4">
                                    <i class="far fa-user-circle fa-4x"></i>
                                </div>
                                <div class="col-xl-11 col-lg-10 col-md-10 col-sm-10 col-10 mt-4 mb-2">
                                    <span class="h4"><c:out value="${targetThreads.user_name}" /></span>
                                    <p class="h4 my-3"><c:out value="${targetThreads.content}" /></p>
                                    <p class="h5 text-muted mb-3"><c:out value="${targetThreads.date}" /></p>
                                    <div class="row">
                                        <div class="col-3">
                                            <a href="like?threadid=${thread.thread_id}" class="mt-2"><i class="far fa-heart fa-fw fa-lg mt-3 mb-4" style="color: red;"><span class="ml-2" style="color: black; font-size: 21px;">${thread.likes}</span></i></a>
                                        </div>
                                        <div class="col-3">
                                            <a href="delete?threadid=${thread.thread_id}" class="mt-2"><i class="far fa-trash-alt fa-fw fa-lg mt-3 mb-4" style="color: gray;"></i></a>
                                        </div>
                                        <div class="col-3"></div>
                                        <div class="col-3"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- 返信元tweetここまで -->

                            <!-- 返信ツイート一覧 -->
                            <c:forEach var="resThread" items="${resThreads}">
                                <div class="row border border-top-0">
                                    <!-- face icon -->
                                    <div class="col-xl-1 col-lg-1 col-md-2 col-sm-2 col-3 my-4">
                                        <i class="far fa-user-circle fa-4x"></i>
                                    </div>

                                    <div class="col-xl-11 col-lg-11 col-md-10 col-sm-10 col-9 mt-4">
                                        <span class="h4"><c:out value="${resThread.res_name}" /></span>
                                        <span class="h6 ml-3" style="color: gray;"><c:out value="${resThread.res_date}" /></span>
                                        <p class="h4 my-3" style="white-space: pre-wrap;"><c:out value="${resThread.res_content}" /></p>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- 返信ツイート一覧ここまで -->

                            <!-- 投稿フォーム -->
                            <div class="row border border-top-0" >
                                <!-- icon -->
                                <div class="col-xl-1 col-lg-2 col-md-2 col-sm-2 col-2">
                                    <i class="far fa-user-circle fa-4x my-4"></i>
                                </div>
                                <div class="col-xl-11 col-lg-10 col-md-10 col-sm-10 col-10">
                                    <!-- form -->
                                    <form method="POST" action="res" class="userInfo">
                                        <div class="form-group">
                                            <div class="input-group input-group-lg mt-4">
                                                <input type="text" name="name" class="form-control form-control-lg rounded mt-3" placeholder="名前" pattern="\S+" maxlength="40" required>
                                                <div class="input-group input-group-lg mt-4">
                                                    <textarea name="content" id="textarea" class="form-control rounded" placeholder="いまどうしてる？" maxlength="280" style="border: none;" required></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-outline-primary btn-lg my-3 rounded-pill px-5"><span>返信</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- 投稿フォームここまで -->
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

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script>
                $('form').on('submit', function (evt) {
                    if (!$('#textarea').val().match(/[^\s]+/)) {
                        evt.preventDefault();
                        evt.stopPropagation();
                    }
                    form.classList.add('was-validated');
                });
                // テキストエリアの高さ自動調整
                $("textarea").attr("rows", 2).on("input", e => {
                    $(e.target).height(0).innerHeight(e.target.scrollHeight);
                });
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