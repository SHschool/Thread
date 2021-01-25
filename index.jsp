<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
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
                            <a href="index.jsp"><i class="fab fa-twitter fa-fw fa-3x my-4" style="color:cornflowerblue"></i></a>
                            <a href="index.jsp"><i class="fas fa-home fa-fw fa-2x my-3" style="color: cornflowerblue;"></i></a>
                            <i class="fas fa-hashtag fa-fw fa-2x my-3" style="color: cornflowerblue;"></i>
                            <i class="far fa-bell fa-fw fa-2x my-3" style="color: cornflowerblue;"></i>
                            <i class="far fa-envelope fa-fw fa-2x my-3" style="color: cornflowerblue;"></i>
                            <a href="regist.jsp"><i class="far fa-user fa-fw fa-2x my-3 text-decoration-none"></i></a>
                        </div>
                    </div>

                    <!-- center -->
                    <div class="col-xl-7 col-lg-9 col-md-9 col-sm-9 col-12">
                        <div class="row">
                            <div class="col-12 bg-white border border-top-0">
                                <p class="h2 my-3 ml-1">ホーム</p>
                            </div>
                        </div>

                        <!-- timeline -->
                        <div class="row border-left border-right border-bottom">
                            <div class="col-xl-1 col-lg-2 col-md-2 col-sm-2 col-3">
                                <i class="far fa-user-circle fa-4x my-3"></i>
                            </div>
                            <div class="col-xl-11 col-lg-10 col-md-10 col-sm-10 col-9 mt-3">
                                <span class="h4 ">${name}</span>
                                <span class="h4 ml-3 text-muted">${id}</span>
                                <span class="h5 ml-3 text-muted">${date}</span>
                                <p class="h3 mt-2">
                                    ${content}
                                    ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ
                                <p>
                                <div class="col-12 ">
                                    <div class="row">
                                        <div class="col-3">
                                            <a href="test.html"> <i class="far fa-comment fa-fw fa-lg mb-3"></i>
                                            </a>
                                        </div>
                                        <div class="col-3">
                                            <i class="far fa-heart fa-fw fa-lg mb-3" style="color:red"><span class="ml-3" style="color: black;">${likes}</span></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 投稿部分 -->
                        <div class="row border border-top-0">
                            <!-- icon -->
                            <div class="col-xl-1 col-lg-2 col-md-2 col-sm-2 col-3">
                                <i class="far fa-user-circle fa-4x my-3"></i>
                            </div>
                            <!-- tweet -->
                            <div class="col-xl-11 col-lg-10 col-md-10 col-sm-10 col-9">
                                <!-- form部分 -->
                                <form method="POST" action="後で" class="needs-validation" novalidate>
                                    <div class="form-group">
                                        <div class="input-group input-group-lg mt-4">
                                            <input type="text" class="form-control form-control-lg rounded" id="" placeholder="いまどうしてる？" required>
                                            <div class="invalid-feedback">
                                                <!-- formが空だったときに表示される文章 -->
                                                <h5 class="mt-2">ツイートを入力してください。</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-right mt-4">
                                        <button class="btn btn-primary btn-lg my-3 rounded-pill" type="submit"><span>ツイートする</span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- 検索部分 -->
                    <div class="col-lg-3 col-md-4 col-sm-2 d-none d-md-block">
                        <form class="needs-validation" novalidate>
                            <div class="form-group">
                                <div class="input-group input-group-lg mt-4">
                                    <input type="text" class="form-control rounded-pill bg-light" placeholder="キーワード検索">
                                    <div class="invalid-feedback">
                                        <h5 class="mt-2">ツイートを入力してください。</h5>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <footer>

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
    <!--
        xl 1200px以上
        lg 992px以上
        md 768px以上
        sm 576px以上
        (xs)　576px未満
    -->

    <!-- ユーザー登録ページ -->