package com.udong.member.controller.email.id;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.udong.member.model.service.MemberService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class FindIdControllerServlet
 */
@WebServlet("/findId.me")
public class FindIdControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String inputName = request.getParameter("inputName");
		String inputEmail = request.getParameter("inputEmail");
		
		Member findUser = new MemberService().findId(inputName,inputEmail);
		
		if(findUser !=null) {
			if(findUser.getLoginType()==1) { //등록된 정보와 일치하는 일반 회원일 경우
				Properties p = System.getProperties();
		        p.put("mail.smtp.starttls.enable", "true");
		        p.put("mail.smtp.host", "smtp.naver.com");
		        p.put("mail.smtp.auth", "true");
		        p.put("mail.smtp.port", "587");
		 
		        Authenticator auth = new MyAuthentication();
		        Session session = Session.getDefaultInstance(p, auth);
		        MimeMessage msg = new MimeMessage(session);
		 
		        try {
		            msg.setSentDate(new Date());
		            InternetAddress from = new InternetAddress();
		            
		            from = new InternetAddress("sender<dlstmxk12@naver.com>");
		            msg.setFrom(from);
		 
		            InternetAddress to = new InternetAddress(request.getParameter("inputEmail"));
		            msg.setRecipient(Message.RecipientType.TO, to);
		 
		            msg.setSubject("[우동: 우리 동네 ]로그인 아이디입니다.", "UTF-8");
//		            String code = request.getParameter("code_check");
//		            request.getSession().setAttribute("code", code);
		            msg.setText("회원님은 일반 로그인 방식입니다.\n 아이디 : " + findUser.getUserId(), "UTF-8");
		            msg.setHeader("content-Type", "text/html");
		 
		            javax.mail.Transport.send(msg);
		            System.out.println("보냄...");
		            
	//	            request.getSession().setAttribute("findIdResult",result);
		            
	//	    		JSONArray jArr = new JSONArray();
	
		    		response.setContentType("json/application; charset =UTF-8");
		    		
		    		JSONObject jobj = new JSONObject();
//		    		jobj.put("code",code);
		    		jobj.put("loginType",findUser.getLoginType());
		    		response.getWriter().print(jobj);
		    		
		        } catch (AddressException addr_e){
		            addr_e.printStackTrace();
		        } catch (MessagingException msg_e){
		            msg_e.printStackTrace();
		        }
			}else if(findUser.getLoginType()==2){ //등록된 정보와 일치하는 카카오 로그인 회원일 경우
	    		JSONObject jobj = new JSONObject();
	    		jobj.put("loginType",findUser.getLoginType());
	    		response.getWriter().print(jobj);
			}else if(findUser.getLoginType()==3) { //등록된 정보와 일치하는 네이버 로그인 회원일 경우
	    		JSONObject jobj = new JSONObject();
	    		jobj.put("loginType",findUser.getLoginType());
	    		response.getWriter().print(jobj);
			}
	}else {// result==0 > 등록된 정보와 다를 경우(없는 경우) 
		JSONObject jobj = new JSONObject();
		jobj.put("loginType",0);
		response.getWriter().print(jobj);
		}
		
	}
}

class MyAuthentication extends Authenticator {
	 
    PasswordAuthentication account;
 
    public MyAuthentication(){
        String id = "dlstmxk12@naver.com";
        String pw = "Kh981216.";
        account = new PasswordAuthentication(id, pw);
    }
 
    public PasswordAuthentication getPasswordAuthentication(){
        return account;
    }
	}
