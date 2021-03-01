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
            <title>�ԐM / Twitter</title>
        </head>

        <body>
            <main>
                <div class="container-fluid">
                    <div class="row">
                        <!-- �E�񂹗p -->
                        <div class="col-1"></div>
                        <!-- sidebar -->
                        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-1 col-1 d-none d-md-block" id="top">
                            <div class="row d-flex flex-column align-items-center sticky-top">
                                <a href="thread#top" style="color: cornflowerblue;"><i class="fab fa-twitter fa-fw fa-3x mt-3 my-3"></i></a>
                                <a href="thread#top" data-toggle="tooltip" data-placement="left" title="�z�[���ɖ߂�" style="color: black;"><i class="fas fa-home fa-fw fa-2x my-3"></i></a>
                                <a href="logout" data-toggle="tooltip" data-placement="left" title="���O�A�E�g" style="color: black;"><i class="fas fa-sign-out-alt fa-fw fa-2x my-3"></i></a>
                                <a href="#top" class="my-2"><i class="far fa-arrow-alt-circle-up   fa-fw fa-3x" style="color: black;"></i></a>
                                <a href="#bottom" class="my-2"><i class="far fa-arrow-alt-circle-down fa-fw fa-3x" style="color: black;"></i></a>
                            </div>
                        </div>

                        <!-- center -->
                        <div class="col-xl-7 col-lg-9 col-md-9 col-sm-9 col-12">
                            <!-- �X�}�z�̂ݕ\�� -->
                            <div class="d-block d-sm-none">
                                <div class="row border-bottom justify-content-end mt-1">
                                    <div class="col-12"> 
                                        <a href="thread"><i class="fas fa-long-arrow-alt-left fa-fw fa-lg mx-2 my-3"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- �X�}�z�ȏ�ŕ\�� -->
                            <div class="sticky-top d-none d-sm-block" id="top">
                                <div class="row bg-white border border-top">
                                    <!-- arrow icon -->
                                    <div class="col-1">
                                        <a href="thread"><i class="fas fa-long-arrow-alt-left fa-fw fa-2x my-3 ml-2" style="color: cornflowerblue"></i></a>
                                    </div>
                                    <div class="col-11">
                                        <p class="h3 my-3 font-weight-bold">�ԐM</p>
                                    </div>
                                </div>
                            </div>

                            <!-- �ԐM��tweet -->
                            <div class="row" id="tweet" style="border:3px solid; border-color: red;">
                                <div class="col-xl-1 col-lg-2 col-md-2 col-sm-2 col-2 my-4">
                                    <i class="fab fa-font-awesome-flag fa-2x "></i>   
                                </div>
                                <div class="col-xl-10 col-lg-10 col-md-10 col-sm-10 col-10 mt-4 mb-2">
                                    <span class="h4"><c:out value="${targetThreads.user_name}" /></span>
                                    <p class="h4 my-3"><c:out value="${targetThreads.content}" /></p>
                                    <p class="h5 text-muted mb-3"><c:out value="${targetThreads.date}" /></p>
                                </div>
                                <div class="col-xl-1"></div>
                            </div>
                            <!-- �ԐM��tweet�����܂� -->

                            <!-- �ԐM�c�C�[�g�ꗗ -->
                            <c:forEach var="resThread" items="${resThreads}">
                                <div class="row border border-top-0">
                                    <!-- face icon -->
                                    <div class="col-xl-1 col-lg-1 col-md-2 col-sm-2 col-3 my-4">
                                        <i class="fab fa-font-awesome-flag fa-2x"></i>
                                    </div>

                                    <div class="col-xl-10 col-lg-10 col-md-10 col-sm-10 col-9 mt-4">
                                        <span class="h4"><c:out value="${resThread.res_name}" /></span>
                                        <span class="h6 ml-3" style="color: gray;"><c:out value="${resThread.res_date}" /></span>
                                        <p class="h4 my-3" style="white-space: pre-wrap;"><c:out value="${resThread.res_content}" /></p>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- �ԐM�c�C�[�g�ꗗ�����܂� -->

                            <!-- ���e�t�H�[�� -->
                            <div class="row border border-top-0">
                                <!-- icon -->
                                <div class="col-xl-1 col-lg-2 col-md-2 col-sm-2 col-2">
                                </div>
                                <div class="col-xl-11 col-lg-10 col-md-10 col-sm-10 col-10">
                                    <!-- form -->
                                    <form method="POST" action="res" class="userInfo">
                                        <div class="form-group">
                                            <div class="input-group input-group-lg mt-4">
                                                <input type="text" name="name" value="${targetName}" class="form-control form-control-lg rounded mt-3" placeholder="���O" pattern="\S+" maxlength="40" required hidden>
                                                <div class="input-group input-group-lg mt-4">
                                                    <textarea name="content" id="textarea" class="form-control rounded" placeholder="���܂ǂ����Ă�H" maxlength="280" style="border: none;" required></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-outline-primary btn-lg my-3 rounded-pill px-5"><span>�ԐM</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="my-3"></div>
                            <!-- ���e�t�H�[�������܂� -->
                        </div>
                    </div>
                </div>
            </main>

            <!-- �X�}�z�̂ݕ\�� -->
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
            <!-- �X�}�z�̂ݕ\�������܂� -->
            <script>
                $('.userInfo').on('submit', function (evt) {
                    if (!$('#textarea').val().match(/[^\s]+/)) {
                        evt.preventDefault();
                        evt.stopPropagation();
                    }
                });
                // �e�L�X�g�G���A�̍�����������
                $("textarea").attr("rows", 2).on("input", e => {
                    $(e.target).height(0).innerHeight(e.target.scrollHeight);
                });

                $('[data-toggle="tooltip"]').tooltip();
            </script>

        </body>

        </html>
        <!--
        xl 1200px�ȏ�
        lg 992px�ȏ�
        md 768px�ȏ�
        sm 576px�ȏ�
        (xs)�@576px����
    -->