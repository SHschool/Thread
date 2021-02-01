<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>

        <html lang="ja">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
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
                        <!-- アイコン群 -->
                        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-1 col-1 d-none d-md-block">
                            <div class="row d-flex flex-column align-items-center">
                                <a href="index.jsp" style="color: cornflowerblue;"><i class="fab fa-twitter fa-fw fa-3x my-4"></i></a>
                                <a href="index.jsp" style="color: black;"><i class="fas fa-home fa-fw fa-2x my-3"></i></a>
                                <a href="         " style="color: black;"><i class="fas fa-hashtag fa-fw fa-2x my-3"></i></a>
                                <a href="         " style="color: black;"><i class="far fa-bell fa-fw fa-2x my-3"></i></a>
                                <a href="         " style="color: black;"><i class="far fa-envelope fa-fw fa-2x my-3"></i></a>
                                <a href="regist.jsp" style="color: cornflowerblue;"><i class="far fa-user fa-fw fa-2x my-3"></i></a>
                            </div>
                        </div>

                        <!-- center -->
                        <div class="col-xl-7 col-lg-9 col-md-9 col-sm-9 col-12">
                            <div class="row">
                                <div class="col-12 bg-white border border-top-0">
                                    <p class="h2 my-3 ml-1">登録画面</p>
                                </div>
                            </div>
                            <!-- 投稿部分 -->
                            <div class="row border border-top-0">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <!-- form -->
                                    <form method="POST" action="regist" class="needs-validation" novalidate>
                                        <!-- ID row -->
                                        <div class="row form-group my-4">
                                            <div class="input-group input-group-lg my-4">
                                                <p class="col-xl-2 col-lg-2 col-md-2 col-sm-3 col-12 h4 my-3 text-center ">ID</p>
                                                <div class="col-xl-10 col-lg-10 col-md-10 col-sm-9 col-12">
                                                    <input type="text" name="name" class="form-control form-control-lg mt-2" placeholder="IDを入力してください" pattern="\S+" required>
                                                    <!-- formが空だった時に表示される文章 -->
                                                    <div class="invalid-feedback"> IDが入力されていません</div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- NAME row -->
                                        <div class="row form-group my-4">
                                            <p class="col-xl-2 col-lg-2 col-md-2 col-sm-3 col-12 h4 my-3 text-center">NAME</p>
                                            <div class="col-xl-10 col-lg-10 col-md-10 col-sm-9 col-12">
                                                <input type="text" name="id" class="form-control form-control-lg mt-2" placeholder="名前を入力して下さい" pattern="\S+" required>
                                                <!-- formが空だった時に表示される文章 -->
                                                <div class="invalid-feedback">名前が入力されていません</div>
                                            </div>
                                        </div>
                                        <!-- button -->
                                        <div class="text-right mt-4">
                                            <button class="btn btn-outline-primary btn-lg  my-4 rounded-pill" type="submit"><span>登録する</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <footer class="border-top fixed-bottom bg-white">
                <!-- スマホ用icon -->
                <div class="container d-block d-sm-none ">
                    <div class="row">
                        <div class="col-12 d-flex flex-row ">
                            <div class="col-3 my-3 ml-2">
                                <a href="index.jsp" style="color: gray;"><i class="fas fa-home fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 ml-2">
                                <a href="index.jsp" style="color: gray"><i class="fas fa-search fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 ml-2">
                                <a href="regist.jsp" style="color: cornflowerblue"><i class="far fa-user fa-fw fa-lg"></i></a>
                            </div>
                            <div class="col-3 my-3 ml-2">
                                <a href="index.jsp" style="color: gray"><i class="far fa-envelope fa-fw fa-lg"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

            <!-- 文字が打ち込まれていないときに使われるやつ -->
            <script>
                (function () {
                    window.addEventListener('load', function () {
                        var forms = document.getElementsByClassName('needs-validation');
                        var validation = Array.prototype.filter.call(forms, function (form) {
                            form.addEventListener('submit', function (event) {
                                if (form.checkValidity() === false) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                                form.classList.add('was-validated');
                            }, false);
                        });
                    }, false);
                })();
            </script>

        </body>

        </html>