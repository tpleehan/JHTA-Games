<%@page import="com.semi4.dao.QnaAnswerDao"%>
<%@page import="com.semi4.utils.StringUtils"%>
<%@page import="com.semi4.vo.Like"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.semi4.vo.Pagination1"%>
<%@page import="com.semi4.utils.NumberUtils"%>
<%@page import="com.semi4.dao.UserDao"%>
<%@page import="com.semi4.utils.DateUtil"%>
<%@page import="com.semi4.vo.QnaBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.dao.QnaBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Q&amp;a 게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
  #tt {
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap;   
  }
</style>

</head>
<body>
   <%@ include file="../../common/navbar.jsp"%>
   <div class="container">
      <%
         QnaBoardDao qnaboardDao = QnaBoardDao.getInstance();

         //요청한 페이지 번호
         int pageNo = NumberUtils.stringToNumber(request.getParameter("pageno"), 1);
         
         //한페이지에 보여질 테이블개수 요청
         int record= NumberUtils.stringToNumber(request.getParameter("record"), 5);
         
         //검색할 때 무엇으로 검색할지를 요청
         String searchType = request.getParameter("searchtype");
         
         //검색할 단어 요청
         String searchKeyword = StringUtils.nullToBlank(request.getParameter("searchkeyword"));

         //검색창이 null이 아닐 때 밑에 searchtype과 searchkeyword를 criteria에 담아준다.
         Map<String, Object> criteria = new HashMap<String, Object>();
         if (!searchKeyword.isEmpty()) {
            criteria.put("type", searchType);
            criteria.put("keyword", searchKeyword);
         }
         
         //총 데이터 개수
         int totalRows = qnaboardDao.getQnaBoardBySearchCount(criteria);

         //페이징 처리에 필요한 값들을 제공하는 Pagination객체 생성
         Pagination1 pagination = new Pagination1(pageNo, totalRows, record);

         //데이터 조회
         criteria.put("begin", pagination.getBeginIndex());
         criteria.put("end", pagination.getEndIndex());         
         
         List<QnaBoard> qna = qnaboardDao.getQnaBoardBySearch(criteria);

         UserDao userDao = UserDao.getInstance();
      %>
      <div style="border-bottom: 1px solid grey;">
         <h2>Q&amp;A 게시판</h2>
      </div>
      <br>
      <div class="col-sm-12">
	      <div class="row">
	         <div class="col-sm-3">
						<div class="row" style="border-bottom: 1px solid grey">
							<h4>고객지원</h4>
						</div>
						<br>
						<div class="row">
							<a href="../noticeboard/noticeboard.jsp" style="text-decoration: none;">공지사항</a>
						</div>
						<br>
						<div class="row">
							<a href="../qnaboard/qnaboard.jsp" style="text-decoration: none;">QnA게시판</a>
						</div>
						<br>
						<div class="row">
							<a href="../reviewboard/reviewboard.jsp" style="text-decoration: none;">리뷰게시판</a>
						</div>
						<br>
	            </div>
	         <form class="form-inline" id="search-form" action="qnaboard.jsp" method="get">
	            <input type="hidden" name="pageno" id="page-no" value="<%=pageNo %>" />
	            <div class="col-sm-9" style="height: 1000px;">
	               <div class="row">
	                  <div class="col-sm-12 text-right">
	                     <select class="form-control" name="record" onchange="searchBoards(1)">
	                        <option value="5" <%=record == 5 ? "selected" : "" %>>5개씩</option>
	                        <option value="10" <%=record == 10 ? "selected" : "" %>>10개씩</option>
	                        <option value="15" <%=record == 15 ? "selected" : "" %>>15개씩</option>
	                        <option value="20" <%=record == 20 ? "selected" : "" %>>20개씩</option>
	                     </select>
	                  </div>
	               </div>
	               <div class="row">
	                  <div class="col-sm-12">
	                     <table class="table" style="TABLE-layout:fixed">
	                        <colgroup>
	                          		 <col width="15%">
	                          		 <col width="35%">
	                          		 <col width="20%">
	                         		 <col width="15%">
	                         		 <col width="10%">
	                         		 <col width="10%">
	                      		</colgroup>
	                        <thead>
	                           <tr>
	                              <th>글번호</th>
	                              <th>제목</th>
	                              <th>글쓴이</th>
	                              <th>작성일</th>
	                              <th>조회수</th>
	                              <th>답변상태</th>
	                           </tr>
	                        </thead>
	                        <%
	                        	QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
	                           for (QnaBoard qnaBoard : qna) {
	                              User user = new User();
	                              user = userDao.getUserByNo(qnaBoard.getUser().getNo());
	                              qnaBoard.setUser(user);
	                              int answerCount = qnaAnswerDao.getQnaAnswerCountByNo(qnaBoard.getNo());
	                        %>
	                        <tbody>
	                           <tr>
	                              <td><%=qnaBoard.getNo()%></td>
	                              <td id="tt"><a href="qnaboarddetail.jsp?qnaboardno=<%=qnaBoard.getNo()%>&pageno=<%=pageNo %>&from=qnaboard.jsp"><%=qnaBoard.getTitle()%></a></td>
	                              <td><%=qnaBoard.getUser().getName()%></td>
	                              <td><%=DateUtil.dateToString(qnaBoard.getCreateDate())%></td>
	                              <td><%=qnaBoard.getCount()%></td>
	                        <% 
										if(answerCount == 1) {
							
							%>
										<td><span class="label label-success">답변완료</span></td>
							<%
										}else {
							%>
										<td><span class="label label-default">답변대기</span></td>
							<%				
											
										}
							%>
	                           </tr>
	                        </tbody>
	                        <%
	                           }
	                        %>
	                     </table>
	
	                  </div>
	               </div>
	               <div class="row">
	                  <div class="col-sm-6 text-left">
	                        <select class="form-control" name="searchtype" >
	                           <option value="title" <%="title".equals(searchType) ? "selected" : "" %>>제목</option>
	                           <option value="writer" <%="writer".equals(searchType) ? "selected" : "" %>>작성자</option>
	                        </select>
	                        <input type="text" class="form-control" name="searchkeyword" id="search-keyword" value="<%=StringUtils.nullToBlank(searchKeyword) %>" />
	                        <button type="button" class="btn btn-info" onclick="searchBoards(1)">검색</button>
	                     </div>
	               <%
	                  if (loginedUser != null && loginedAdmin == null) {
	                	  
	               %>
	                  <div class="col-sm-6">
	                     <a class="btn btn-primary pull-right" href="qnaboardadd.jsp">글쓰기</a>
	                  </div>
	               <%
	                  }
	               %>
	                  </div>
	               <div class="row">
	                  <div class="col-sm-12 text-center">
	                     <ul class="pagination">
	                        <%
	                           if (pageNo > 1) {
	                        %>
	                        <li><a href="" onclick="searchBoards(<%=pageNo - 1%>, event)">&laquo;</a></li>
	                        <%
	                           } else {
	                        %>
	                        <li class="<%=pageNo == 1 ? "disabled" : "" %>"><a href=""
	                           onclick="searchBoards(1, event)">&laquo;</a></li>
	                        <%
	                           }
	                        %>
	                        <%
	                           for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
	                        %>
	                        <li class="<%=pageNo == num ? "active" : "" %>"><a
	                           href="" onclick="searchBoards(<%=num %>, event)"><%=num %></a></li>
	                        <%
	                           }
	                        %>
	                        <%
	                           if (pageNo < pagination.getTotalPageCount()) {
	                        %>
	                        <li><a href="" onclick="searchBoards(<%=pageNo + 1%>, event)">&raquo;</a></li>
	                        <%
	                           } else {
	                        %>
	                        <li
	                                    class="<%=pageNo == pagination.getTotalPageCount() ? "disabled" : "" %>"><a
	                                    href="" onclick="searchBoards(<%=pagination.getTotalPageCount() %>, event)">&raquo;</a></li>
	                        <%
	                           }
	                        %>
	                     </ul>
	                  </div>
	               </div>
	               </div>
	            
	         </form>
	      </div>
      </div>
   </div>
   <script type="text/javascript">
   function searchBoards(pageno, e) {
         if (e) {
            e.preventDefault();
         }   
         // 전달받은 페이지번호를 form의 히든필드에 값으로 담는다.
         document.getElementById("page-no").value = pageno;
         // 폼을 서버로 보낸다.
         // 폼의 pageno, sort, record, searchopt, searchkeyword값이 서버로 제출된다.
         document.getElementById("search-form").submit();
   }
</script>
   <%@ include file="../../common/footer.jsp"%>
</body>
</html>