/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.43
 * Generated at: 2021-07-03 05:48:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.semi4.dao.GameDao;
import com.semi4.vo.Game;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import com.semi4.utils.StringUtils;
import com.semi4.vo.Admin;
import com.semi4.vo.User;

public final class userleaveform_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/user/../common/navbar.jsp", Long.valueOf(1576223718000L));
    _jspx_dependants.put("/user/../common/footer.jsp", Long.valueOf(1625290619673L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.semi4.vo.User");
    _jspx_imports_classes.add("com.semi4.dao.GameDao");
    _jspx_imports_classes.add("java.util.Map");
    _jspx_imports_classes.add("com.semi4.vo.Game");
    _jspx_imports_classes.add("java.util.HashMap");
    _jspx_imports_classes.add("com.semi4.utils.StringUtils");
    _jspx_imports_classes.add("com.semi4.vo.Admin");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"ko\">\r\n");
      out.write("<head>\r\n");
      out.write(" \t <title>JHTA Games</title>\r\n");
      out.write(" \t <meta charset=\"utf-8\">\r\n");
      out.write(" \t <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write(" \t <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\r\n");
      out.write("  \t<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n");
      out.write("  \t<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

   // 세션 객체에서 LOGINED_USER로 저장된 사용자객체를 조회
   request.setCharacterEncoding("utf-8");
   User loginedUser = (User) session.getAttribute("LOGINED_USER");
   Admin loginedAdmin = (Admin) session.getAttribute("LOGINED_ADMIN");

      out.write("     \r\n");
      out.write("<nav style=\"background-color: #000000;\">\r\n");
      out.write("     <div class=\"container\" style=\"padding-bottom: 10px;\">\r\n");
      out.write("       <div class=\"navbar-header\" style=\"padding-top: 20px;\">\r\n");
      out.write("          <a class=\"navbar-brand\" href=\"/semi-4/home.jsp\" style=\"font-size:30px; color: #ffffff;\">JHTA Games</a>\r\n");
      out.write("          \r\n");
      out.write("          ");
 	
          	String bigKeyword = StringUtils.nullToBlank(request.getParameter("bigkeyword"));
          	       	
          
      out.write(" \r\n");
      out.write("          <form class=\"navbar-form navbar-left\" id=\"bigkeyword-form\" method=\"get\" action=\"/semi-4/purchase/searchform.jsp\">\r\n");
      out.write("             <div class=\"form-group\">\r\n");
      out.write("                <input type=\"text\" name=\"bigkeyword\" id=\"keyword-search\" class=\"form-control\" placeholder=\"Search\" style=\"width: 475px;\" value=\"");
      out.print(bigKeyword );
      out.write("\">\r\n");
      out.write("                <button class=\"btn btn-default\" type=\"button\" onclick=\"bigSearch()\">\r\n");
      out.write("                    <i class=\"glyphicon glyphicon-search\"></i>\r\n");
      out.write("                </button>\r\n");
      out.write("             </div>\r\n");
      out.write("          </form>\r\n");
      out.write("      \r\n");
      out.write("       </div>\r\n");
      out.write("\r\n");
      out.write("       \r\n");
      out.write("       ");

         if(loginedUser != null) {
            if(loginedAdmin != null) {
       
      out.write("\r\n");
      out.write("           <ul class=\"nav navbar-nav navbar-right\" style=\"padding-top:20px;\">\r\n");
      out.write("                <li style=\"font-size: 18px;\"><a href=\"/semi-4/logout.jsp\" style=\"color: #ffffff; background-color: #000000;\"><span class=\"glyphicon glyphicon-log-out\"></span> 로그아웃</a></li>\r\n");
      out.write("                <li style=\"font-size: 18px;\"><a href=\"/semi-4/admin/adminMain.jsp\" style=\"color: #ffffff; background-color: #000000;\"><span class=\"glyphicon glyphicon-eye-open\"></span> 관리자페이지</a></li>\r\n");
      out.write("             </ul> \r\n");
      out.write("       ");

            } else {
       
      out.write("\r\n");
      out.write("\t       <ul class=\"nav navbar-nav navbar-right\" style=\"padding-top:20px;\">\r\n");
      out.write("\t          <li style=\"font-size: 18px;\"><a href=\"/semi-4/logout.jsp\" style=\"color: #ffffff; background-color: #000000;\"><span class=\"glyphicon glyphicon-log-out\" style=\"color: #ffffff;\"></span> 로그아웃</a></li>\r\n");
      out.write("\t          <li style=\"font-size: 18px;\"><a href=\"/semi-4/user/userinfoform.jsp\" style=\"color: #ffffff; background-color: #000000;\"><span class=\"glyphicon glyphicon-user\"></span> 마이페이지</a></li>\r\n");
      out.write("\t          <li>\r\n");
      out.write("\t\t          <a href=\"/semi-4/purchase/cart.jsp\" style=\"padding:0px; margin-top:10px; background-color: #000000;\">\r\n");
      out.write("\t\t          <button type=\"button\" class=\"btn btn-default btn-sm glyphicon glyphicon-shopping-cart default\" style=\"font-size: 14px;\">\r\n");
      out.write("\t\t          </button>\r\n");
      out.write("\t\t          </a>\r\n");
      out.write("\t          </li>\r\n");
      out.write("\t       </ul>\r\n");
      out.write("\r\n");
      out.write("      ");

      
            }
        }
      
      out.write("\r\n");
      out.write("       \r\n");
      out.write("       ");

         if(loginedUser == null) {
      
      out.write("\r\n");
      out.write("       <div class=\"nav navbar-nav navbar-right\" style=\"padding-top:30px;\">\r\n");
      out.write("          <a href=\"/semi-4/loginform.jsp\" style=\"padding:0px;\"><button type=\"button\" class=\"btn btn-default btn\" style=\"font-size: 16px;\" >로그인</button></a>\r\n");
      out.write("          <a href=\"/semi-4/user/registerform.jsp\" style=\"padding:0px;\"><button type=\"button\" class=\"btn btn-default btn\" style=\"font-size: 16px;\">회원가입</button></a>\r\n");
      out.write("          <a href=\"/semi-4/loginform.jsp\" style=\"padding:0px; margin-top:10px\">\r\n");
      out.write("\t          <button type=\"button\" class=\"btn btn-default btn-sm glyphicon glyphicon-shopping-cart default\" \r\n");
      out.write("\t          \t\t\tonclick=\"clickcart()\" style=\"font-size: 16px; margin-bottom: 2px;\">\r\n");
      out.write("\t          </button>\r\n");
      out.write("          </a>\r\n");
      out.write("       </div>\r\n");
      out.write("       \r\n");
      out.write("      ");

         }
      
      out.write("    \r\n");
      out.write("     </div>\r\n");
      out.write("     <div class=\"row\" style=\"background-color: #ffffff;\">\r\n");
      out.write("     \r\n");
      out.write("        <div class=\"container\" style=\"padding: 10px;\">\r\n");
      out.write("             <ul class=\"nav navbar-nav\">\r\n");
      out.write("                <li class=\"active\" style=\"font-size: 20px;\"><a href=\"/semi-4/home.jsp\" style=\"background-color: #ffffff\" >홈</a></li>\r\n");
      out.write("                <li style=\"font-size: 20px;\"><a href=\"/semi-4/purchase/gamemenu.jsp\" style=\"background-color: #ffffff\">게임</a></li>\r\n");
      out.write("                <li class=\"dropdown\">\r\n");
      out.write("                   <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"\" style=\"background-color: #ffffff; font-size: 20px;\">고객지원\r\n");
      out.write("                       <span class=\"caret\"></span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\">\r\n");
      out.write("                       <li style=\"font-size: 16px;\"><a href=\"/semi-4/board/noticeboard/noticeboard.jsp\">공지사항</a></li>\r\n");
      out.write("                       <li style=\"font-size: 16px;\"><a href=\"/semi-4/board/qnaboard/qnaboard.jsp\">QnA 게시판</a></li>\r\n");
      out.write("                       <li style=\"font-size: 16px;\"><a href=\"/semi-4/board/reviewboard/reviewboard.jsp\">리뷰 게시판</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li style=\"font-size: 20px;\"><a href=\"/semi-4/event/eventmain.jsp\" style=\"background-color: #ffffff\">이벤트</a></li>\r\n");
      out.write("             </ul>\r\n");
      out.write("             \r\n");
      out.write("             <ul class=\"nav navbar-nav navbar-right\" >\r\n");
      out.write("                <li style=\"border:none;box-shadow:none\"><button type=\"button\" class=\"btn btn-default glyphicon glyphicon-thumbs-up\" onclick=\"clickFacebook()\" style=\"background:#4e69a2;color:#ffffff;border:none;margin-top:10px;margin-right:10px; font-size: 15px;\"><i class=\"fab fa-facebook\" style=\"background:#4e69a2;color:#ffffff;\"></i> 페이스북</button></li>\r\n");
      out.write("                <li style=\"border:none;box-shadow:none\"><button type=\"button\" class=\"btn btn-default glyphicon glyphicon-expand\" onclick=\"clickYoutube()\" style=\"background:#ff0000;color:#ffffff;border:none;margin-top:10px; font-size: 15px;\"><i class=\"fab fa-youtube-play\" style=\"background:#ff0000;color:#ffffff\"></i> 유튜브</button></li>\r\n");
      out.write("             </ul>\r\n");
      out.write("         </div>\r\n");
      out.write("      </div>\r\n");
      out.write("</nav>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("   function clickFacebook() {\r\n");
      out.write("      window.open(\"http://www.facebook.com/\");\r\n");
      out.write("   }\r\n");
      out.write("   function clickYoutube() {\r\n");
      out.write("      window.open(\"http://www.youtube.com/\");\r\n");
      out.write("   }\r\n");
      out.write("   function clickcart() {\r\n");
      out.write("      alert(\"로그인 후 이용하세요.\")\r\n");
      out.write("      return;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   function bigSearch() {\r\n");
      out.write("\t \r\n");
      out.write("\t   var bigkeyword = document.getElementById(\"keyword-search\").value;\r\n");
      out.write("\t  \r\n");
      out.write("\t   if (bigkeyword == \"\") {\r\n");
      out.write("\t\t   alert(\"검색어를 입력하세요.\")\r\n");
      out.write("\t\t   return;\r\n");
      out.write("\t   }\r\n");
      out.write("\t\r\n");
      out.write("\t   document.getElementById(\"bigkeyword-form\").submit();\r\n");
      out.write("   }\r\n");
      out.write("</script>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container\" style=\"height: 640px;\">\r\n");
      out.write("\t<div class=\"row\">\r\n");
      out.write("\t\t<!-- MAIN CONTENT -->\r\n");
      out.write("\t\t<div id=\"t3-content\" class=\"t3-content col-xs-12\">\r\n");
      out.write("\t\t\t<div id=\"system-message-container\"></div>\r\n");
      out.write("\t\t\t");
 User user = (User) session.getAttribute("LOGINED_USER"); 
      out.write("\r\n");
      out.write("\t\t\t<div id=\"cart-view\" class=\"cart-view\" style=\"padding-top:20px\">\r\n");
      out.write("\t\t\t\t<div class=\"docs-section\">\r\n");
      out.write("\t\t\t\t\t<p class=\"text-danger\"><strong>※ 회원탈퇴 시 해당 아이디로는 재가입을 하실 수 없습니다.</strong></p>\r\n");
      out.write("\t\t\t\t\t<p class=\"text-danger\"><strong>※ 또한 구매한 게임상품은 환불이 불가능하며, 탈퇴 후 재가입을 하셔도 상품을 다시 구매해야 합니다.</strong></p>\r\n");
      out.write("\t\t\t\t\t<p class=\"text-danger\"><strong>※ 탈퇴 시 모든 정보는 지워집니다. 신중한 선택 부탁드립니다.</strong></p>\r\n");
      out.write("\t\t\t\t</div><br/>\r\n");
      out.write("\t\t\t\t<form id=\"userleave-form\" class=\"well\" action=\"userleave.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"form-group\" >\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-inline form-group\" style=\"padding-bottom:30px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<label class=\"col-sm-2\">아이디</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-sm-10\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<p style=\"font-size: 18px;\">");
      out.print( user.getId() );
      out.write("</p>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-inline form-group\"  style=\"padding-bottom:30px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<label class=\"col-sm-2\">비밀번호</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-sm-10\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"password\" class=\"form-control\" name=\"userpwd\" id=\"user-pwd\" style=\"width: 233px;\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-inline form-group\"  style=\"padding-bottom:30px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<label class=\"col-sm-2\">탈퇴사유</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-sm-10\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select name=\"reason\" class=\"form-control\" required>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\">:::탈퇴사유를 선택해 주세요:::</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\">고객서비스 불만</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\">교환/환불 불만</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\">방문 빈도가 낮음</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\">상품가격 불만</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\">개인 정보유출 우려</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\">쇼핑몰의 신뢰도 불만</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\">쇼핑 기능 불만</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"text-center\" style=\"padding-top:20px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<button onclick=\"userleavefrm()\" type=\"button\" class=\"btn btn-danger\">회원탈퇴</button>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"../home.jsp\"><button type=\"button\" class=\"btn btn-primary\">취소하기</button></a>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");

	User pwdUser = (User) session.getAttribute("LOGINED_USER");

      out.write("\r\n");
      out.write("<input class=\"hidden\" type=\"text\" id=\"pwduser\" value=\"");
      out.print(pwdUser.getPassword() );
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tfunction userleavefrm() {\r\n");
      out.write("\t\tvar pwd = document.querySelector(\"#user-pwd\").value;\r\n");
      out.write("\t\tif (pwd == \"\") {\r\n");
      out.write("\t\t\talert(\"비밀번호를 입력하세요.\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t} \r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\tvar pwd = document.querySelector(\"#user-pwd\").value;\r\n");
      out.write("\t\tvar checkpwd = document.querySelector(\"#pwduser\").value;\r\n");
      out.write("\t\tif (pwd != checkpwd) {\r\n");
      out.write("\t\t\talert(\"비밀번호가 일치하지 않습니다.\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tdocument.querySelector(\"#userleave-form\").submit();\r\n");
      out.write("\t\talert(\"회원탈퇴 처리되었습니다.\");\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<footer id=\"t3-footer\" class=\"wrap t3-footer\" style=\"height:120px;padding-top:0;padding-bottom:0; background-color: #000000; color: #ffffff; width:100%; bottom: 0;\">\r\n");
      out.write("<div class=\"container\" style=\"padding-top:0;padding-bottom:0\">\r\n");
      out.write("<div class=\"navbar-footer\">\r\n");
      out.write("   <ul class=\"nav nav-pills\" style=\"margin-top:10px; margin-left: auto; margin-right: auto; width: 50%;\">\r\n");
      out.write("      <li><a href=\"http://jhta.kr/page/academy.php?id=5\" target=\"_blank\">회사소개</a></li>\r\n");
      out.write("      <li><a href=\"http://jhta.kr/page/edu/intro.php?type=1\" target=\"_blank\">이용약관</a></li>\r\n");
      out.write("      <li><a href=\"http://jhta.kr/page.php?p=policy2\" target=\"_blank\">개인정보처리방침</a></li>\r\n");
      out.write("      <li><a href=\"http://jhta.kr/page/academy.php?id=9\" target=\"_blank\">찾아오시는길</a></li>\r\n");
      out.write("      <li><a href=\"http://jhta.kr/page/academy/history.php\" target=\"_blank\">HTA 연혁</a></li>\r\n");
      out.write("   </ul>\r\n");
      out.write("</div>\r\n");
      out.write("<address style=\"padding-top:8px;padding-bottom:0\">\r\n");
      out.write("   <p styl=\"margin-bottom:0; text-align: center\">JHTA GAMES <span class=\"bars\">|</span> 소재지 : 서울특별시 종로구 봉익동 율곡로10길 105 디아망 빌딩 4층  (주)중앙HTA <span class=\"bars\">|</span> 대표이사 : 이준스쨔응 <span class=\"bars\">|</span> 개인정보관리책임자 : 인호쓰</p>\r\n");
      out.write("   <p style=\"margin-bottom:0; text-align: center\">사업자등록번호 : 010-1234-5678 <span class=\"bars\">|</span> 통신판매업신고 : 2019-중앙HTA-1905th <span class=\"bars\">|</span> 고객센터 : 010-1234-5678(대일쨩번호) <span class=\"bars\">|</span> 전자우편 : aslkd@gmail.com</p>\r\n");
      out.write("</address>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<section class=\"t3-copyright\" style=\"padding-top:0px;padding-bottom:0;margin-top:-8px; background-color: #000000; color: #ffffff;\">\r\n");
      out.write("<div class=\"container\" style=\"padding-top:0;padding-bottom:0\">\r\n");
      out.write("   <div class=\"row\">\r\n");
      out.write("      <div class=\"col-md-12 copyright\" style=\"text-align: center;\">\r\n");
      out.write("         <small>Copyright © JHTA GAMES. All Rights Reserved. </small>\r\n");
      out.write("      </div>\r\n");
      out.write("   </div>\r\n");
      out.write("</div>\r\n");
      out.write("</section>\r\n");
      out.write("</footer>");
      out.write("\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
