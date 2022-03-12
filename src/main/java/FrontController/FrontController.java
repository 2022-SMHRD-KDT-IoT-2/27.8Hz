package FrontController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.POJO.AdminDeleteCon;
import com.POJO.CenterComment;
import com.POJO.CenterWriteCon;
import com.POJO.CenterWriteUpCon;
import com.POJO.CommentCon;
import com.POJO.CommentDeleteCon;
import com.POJO.CommunityDelete;
import com.POJO.CommunityModifyCon;
import com.POJO.CommunityWriteCon;
import com.POJO.DeleteCCCon;
import com.POJO.HealthDataCon;
import com.POJO.LoginCon;
import com.POJO.LogoutCon;
import com.POJO.Naver_LoginCon;
import com.POJO.Naver_SignUpCon;
import com.POJO.NewsCommentCon;
import com.POJO.NewsCommentDeleteCon;
import com.POJO.NewsDeleteCon;
import com.POJO.NewsModifyCon;
import com.POJO.NewsWriteCon;
import com.POJO.SignUpCheckCon;
import com.POJO.SignUpCon;
import com.POJO.UnumCheckCon;
import com.POJO.editProfileCon;
import com.command.Command;

//확장자패턴 사용 : 어떤 요청 이던 간에 뒤에 .do 가 붙어있으면 이 서블릿에서
//받아서 처리
@WebServlet("*.do")
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		
		String reqURI = request.getRequestURI();
		System.out.println("요청 URI :" + reqURI);

	
		String path = request.getContextPath();
		System.out.println("프로젝트 명 : " + path);


		String result = reqURI.substring(path.length() + 1);
		System.out.println("URI : " + result);

		Command command = null;

		if (result.equals("AdminDeleteCon.do")) { 

			command = new AdminDeleteCon();

		} else if (result.equals("CenterComment.do")) {

			command = new CenterComment();

		} else if (result.equals("CenterWriteCon.do")) {

			command = new CenterWriteCon();

		} else if (result.equals("CenterWriteUpCon.do")) {

			command = new CenterWriteUpCon();

		} else if (result.equals("CommentCon.do")) { 

			command = new CommentCon();

		} else if (result.equals("CommentDeleteCon.do")) { 

			command = new CommentDeleteCon();

		} else if (result.equals("CommunityDelete.do")) { 

			command = new CommunityDelete();

		} else if (result.equals("CommunityModifyCon.do")) {

			command = new CommunityModifyCon();

		} else if (result.equals("CommunityWriteCon.do")) {

			command = new CommunityWriteCon();

		} else if (result.equals("DeleteCCCon.do")) { 

			command = new DeleteCCCon();

		} else if (result.equals("editProfileCon.do")) {

			command = new editProfileCon();

		} else if (result.equals("HealthDataCon.do")) { 

			command = new HealthDataCon();

		} else if (result.equals("LoginCon.do")) {

			command = new LoginCon();

		} else if (result.equals("LogoutCon.do")) {

			command = new LogoutCon();

		} else if (result.equals("Naver_LoginCon.do")) { 

			command = new Naver_LoginCon();

		} else if (result.equals("Naver_SignUpCon.do")) {

			command = new Naver_SignUpCon();

		} else if (result.equals("NewsCommentCon.do")) { 

			command = new NewsCommentCon();

		} else if (result.equals("NewsCommentDeleteCon.do")) {
			command = new NewsCommentDeleteCon();
			
		} else if (result.equals("NewsDeleteCon.do")) { 

			command = new NewsDeleteCon();
			
		} else if (result.equals("NewsModifyCon.do")) {

			command = new NewsModifyCon();
			
		} else if (result.equals("NewsWriteCon.do")) {
			command = new NewsWriteCon();
			
		} else if (result.equals("SignUpCheckCon.do")) { 

			command = new SignUpCheckCon();
			
		}  else if (result.equals("SignUpCon.do")) { 

			command = new SignUpCon();
			
		}  else if (result.equals("UnumCheckCon.do")) {

			command = new UnumCheckCon();
		}

		
		String url = command.execute(request, response);
		System.out.println("URL:" + url);
		

		

		if (url == "" ) {// 

		}else if(url.equals("0") || url.equals("1")) {
			out.write(url);
		}

		else {
			response.sendRedirect(url);
		}

	}
}
