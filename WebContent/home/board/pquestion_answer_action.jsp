<%@page import="site.home.dao.PQuestionDAO"%>
<%@page import="site.home.dto.PQuestionDTO"%>
<%@page import="util.Utility"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
		
	int num=Integer.parseInt(request.getParameter("num"));
	
	String subject=Utility.stripTag(request.getParameter("subject"));
	String content=Utility.stripTag(request.getParameter("content"));
	String category=request.getParameter("category");
	String answer=Utility.stripTag(request.getParameter("answer"));
		
	if(subject==null|| subject.equals("") || content==null || content.equals("")) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
		
	PQuestionDTO board=new PQuestionDTO();
	board.setPqBbsno(num);
	board.setPqTitle(subject);
	board.setPqContent(content);
	board.setPqCategory(category);
	board.setPqAnswer(answer);
	
	PQuestionDAO.getDAO().addPQAnswer(board);
		
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=board&work=pquestion_detail&num="+num);
%>


