package com.udong.member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.udong.member.model.service.MemberService;

/**
 * Servlet implementation class CheckEmailController
 */
@WebServlet("/checkEmail.me")
public class CheckEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailController() {
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
		int random = Integer.parseInt(request.getParameter("random"));
		String email = request.getParameter("email");
		
		int count = new MemberService().checkEmail(email);
		if(count > 0) {
			response.getWriter().print("N");
		}
		else {
			Properties props = System.getProperties();
			props.put("mail.smtp.host", "smtp.naver.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", "smtp.naver.com");

			Authenticator auth = new MyAuthentication();
			Session session = Session.getDefaultInstance(props, auth);
			MimeMessage msg = new MimeMessage(session);
			
			try {
				msg.setSentDate(new Date());
				// 발신자
				msg.setFrom(new InternetAddress("dlstmxk12@naver.com", "Udong"));
				// 수신자
				InternetAddress to = new InternetAddress(email);
				msg.setRecipient(Message.RecipientType.TO, to);
				
				msg.setSubject("[우리동네 Udong] 회원가입 인증 메일입니다.");
				msg.setText("인증 번호: " + random);
				
				msg.setHeader("content-Type", "text/html");
				
				Transport.send(msg, msg.getAllRecipients());
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.getWriter().print("Y");
		}
		
	}
	
	class MyAuthentication extends Authenticator {
		PasswordAuthentication pa;
		
		public MyAuthentication() {
			String id = "dlstmxk12@naver.com";
			String pw = "Kh981216.";
			
			pa = new PasswordAuthentication(id, pw);
		}
		
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}

}
