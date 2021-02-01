<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>

        <html lang="ja">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
            <title>Document</title>
        </head>

        <body>
            <main>
                <div class="container-fluid">
                    <div class="row">
                        <!-- 右寄せ用 -->
                        <div class="col-1"></div>
                        <!-- sidebar -->
                        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-1 col-1 d-none d-md-block">
                            <div class="row d-flex flex-column align-items-center">
                                <a href="index.jsp" style="color: cornflowerblue;"><i class="fab fa-twitter fa-fw fa-3x my-4"></i></a>
                                <a href="index.jsp" style="color: cornflowerblue;"><i class="fas fa-home fa-fw fa-2x my-3"></i></a>
                                <a href="         " style="color: black;"><i class="fas fa-hashtag fa-fw fa-2x my-3"></i></a>
                                <a href="         " style="color: black;"><i class="far fa-bell fa-fw fa-2x my-3"></i></a>
                                <a href="         " style="color: black;"><i class="far fa-envelope fa-fw fa-2x my-3"></i></a>
                                <a href="regist.jsp" style="color: black"><i class="far fa-user fa-fw fa-2x my-3"></i></a>
                            </div>
                        </div>

                        <!-- center -->
                        <div class="col-xl-7 col-lg-9 col-md-9 col-sm-9 col-12">
                            <div class="row">
                                <div class="col-12 bg-white border border-top-0">
                                    <p class="h2 my-3 ml-1">ホーム</p>
                                </div>
                            </div>

                            <!-- 投稿 -->
                            <div class="row border border-top-0">
                                <!-- icon -->
                                <div class="col-xl-1 col-lg-2 col-md-2 col-sm-2 col-3">
                                    <i class="far fa-user-circle fa-4x my-4"></i>
                                </div>
                                <!--  -->
                                <div class="col-xl-11 col-lg-10 col-md-10 col-sm-10 col-9">
                                    <!-- form -->
                                    <form method="POST" action="後で">
                                        <div class="form-group">
                                            <div class="input-group input-group-lg mt-4">
                                                <textarea name="content" id="textarea" class="form-control rounded" placeholder="いまどうしてる？" maxlength="280" style="border: none;" required></textarea>
                                            </div>
                                        </div>
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary btn-lg my-3 rounded-pill"><span>ツイートする</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!-- tweet -->
                            <c:forEach var="変数名" items="${list名}">
                                <div class="row border border-top-0">
                                    <div class="col-xl-1 col-lg-2 col-md-2 col-sm-2 col-3 my-4">
                                        <i class="far fa-user-circle fa-4x"></i>
                                    </div>
                                    <div class="col-xl-11 col-lg-10 col-md-10 col-sm-10 col-9 mt-4">
                                        <span class="h4"><c:out value="${変数名.name}"/></span>
                                        <span class="h5 ml-2 text-muted">@<c:out value="${変数名.id}"/></span>
                                        <span class="h5 ml-2 text-muted"><c:out value="${変数名.date}"/></span>
                                        <p class="h4 my-2"><c:out value="${変数名.content}"></p>
                                        <div class="row">
                                            <div class="col-3">
                                                <a href="reply.jsp" style="color:gray;"><i class="far fa-comment fa-fw fa-lg mt-2 mb-4"></i></a>
                                            </div>
                                            <div class="col-3">
                                                <a href="" style="color:red;" ><i class="far fa-heart fa-fw fa-lg mt-2 mb-4"><span class="ml-2" style="color: black;">10</span></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </main>

            <!-- スマホ用icon -->
            <footer class="border-top fixed-bottom bg-white">
                <div class="container d-block d-sm-none ">
                    <div class="row">
                        <div class="col-12 d-flex flex-row ">
                            <div class="col-3 my-3 ml-2">
                                <a href="index.jsp" style="color: cornflowerblue;"><i class="fas fa-home fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 ml-2">
                                <a href="index.jsp" style="color: gray"><i class="fas fa-search fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 ml-2">
                                <a href="regist.jsp" style="color: gray"><i class="far far fa-user fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 ml-2">
                                <a href="index.jsp" style="color: gray"><i class="far fa-envelope fa-fw fa-lg"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

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