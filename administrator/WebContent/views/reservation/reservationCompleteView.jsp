<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>예약 완료</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Bootstrap core CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/metisMenu.min.css" rel="stylesheet">
        <!-- Icons CSS -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/icons.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="<%= request.getContextPath() %>/resources/assets/css/style.css" rel="stylesheet">

    </head>


    <body>

        <!-- HOME -->
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">

                        <div class="wrapper-page">

                            <div class="m-t-40 card-box">
                                <div class="text-center">
                                    <h2 class="text-uppercase m-t-0 m-b-30">
                                        <a href="index.html" class="text-success">
                                            <span><img src="<%= request.getContextPath() %>/resources/main/images/ohddologo.png" alt="" height="50"></span>
                                        </a>
                                    </h2>
                                    <!--<h4 class="text-uppercase font-bold m-b-0">Sign In</h4>-->
                                </div>
                                <div class="account-content">
                                    <div class="text-center m-b-20">
                                        <img src="<%= request.getContextPath() %>/resources/assets/images/success.svg" title="invite.svg" height="80" class="m-t-10">
                                        <h3 class="expired-title">예약이 완료되었습니다.</h3>
                                        <p class="text-muted m-t-30 line-h-24"> 아래의 메뉴중 하나를 선택해 원하는 메뉴로 이동할 수 있습니다. </p>
                                    </div>
                                    <div class="row m-t-30">
                                        <div class="col-xs-6" style="text-align: center">
                                            <a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-dark btn-rounded" type="submit">메인 페이지로</a>
                                        </div>
                                        <div class="col-xs-6" style="text-align: center">
                                            <button onclick="newWin()" class="btn btn-dark btn-rounded" type="submit">예약 확인 페이지로</button>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>

                                </div>
                            </div>
                            <!-- end card-box-->

                        </div>
                        <!-- end wrapper -->

                    </div>
                </div>
            </div>
        </section>
        <!-- END HOME -->


		<!-- script -->
		<script>
            function newWin() {

                var popupX = (window.screen.width / 2) - (800 / 2);
                var popupY= (window.screen.height / 2) - (800 / 2);

                 window.open("<%= request.getContextPath() %>/views/reservation/reservationSimpleSearchView.jsp", '', 'height=500, width=800, left='+ popupX + ', top='+ popupY);

            }
		</script>
		


        <!-- js placed at the end of the document so the pages load faster -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery-2.1.4.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/metisMenu.min.js"></script>
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.slimscroll.min.js"></script>

        <!-- App Js -->
        <script src="<%= request.getContextPath() %>/resources/assets/js/jquery.app.js"></script>

    </body>
</html>