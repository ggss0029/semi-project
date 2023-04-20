package com.udong.member.controller.naver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.udong.member.model.service.MemberService;
import com.udong.member.model.vo.Member;

/**
 * Servlet implementation class NaverLoginControllerServlet
 */
@WebServlet("/naverLogin.me")
public class NaverLoginControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverLoginControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String clientId = "CJ7qrC5nVBwBp47rzM35";
		String clientSecret = "ra3ZGv91eT"; 
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("/udong","UTF-8");
				
		StringBuffer apiURL = new StringBuffer();
		apiURL.append("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&");
		apiURL.append("client_id=" + clientId);
		apiURL.append("&client_secret=" + clientSecret);
		apiURL.append("&redirect_uri=" + redirectURI);
		apiURL.append("&code=" + code);
		apiURL.append("&state=" + state);
		String access_token = "";
		String refresh_token = ""; //나중에 이용합시다
		
		try { 
			  URL url = new URL(apiURL.toString());
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      
		      BufferedReader br;
//		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
//		        System.out.println(res.toString());
		        JSONParser parsing = new JSONParser();
		    	Object obj = parsing.parse(res.toString());
		    	JSONObject jsonObj = (JSONObject)obj;
		    		        
		    	access_token = (String)jsonObj.get("access_token");
		    	refresh_token = (String)jsonObj.get("refresh_token");
		    	
		    	if(access_token != null) { // access_token을 잘 받아왔다면

		    		try {
		    			
		    	        String header = "Bearer " + access_token; // Bearer 다음에 공백 추가

		    	        String apiURL1 = "https://openapi.naver.com/v1/nid/me";

		    	        Map<String, String> requestHeaders = new HashMap<>();
		    	        requestHeaders.put("Authorization", header);
		    	        String responseBody = get(apiURL1,requestHeaders);

		    	        String gender = ""; //성별 M
		    	        if(responseBody.split("\"")[17].equals("M")) {
		    	        	gender = "남";
		    	        }else {
		    	        	gender = "여";
		    	        }
		    	        String email = responseBody.split("\"")[21]; //이메일
		    	        String name = uniToKor(responseBody.split("\"")[25]); //이름
		    	        String birthDay = responseBody.split("\"")[33]+responseBody.split("\"")[29].substring(0,2)+responseBody.split("\"")[29].substring(3, 5);
		    	        
		    			Member m = new Member();
		    			m.setEmail(email);
		    			m.setUserName(name);
		    			m.setGender(gender);
		    			m.setBirthday(birthDay);
		    			m.setLoginType(3);
		    			
		    			Member naverLoginUser = new MemberService().checkNaver(m);
		    	        
		    			if(naverLoginUser!=null) { //db에 등록된 정보가 있는 경우 result==1
		    				request.getSession().setAttribute("loginUser", naverLoginUser);
		    				response.sendRedirect("mainPage.jsp");
		    			}else { // 첫 네이버 로그인
		    				request.setAttribute("alertNaverMsg","등록된 회원 정보가 없습니다.회원 가입 페이지로 이동합니다.");
		    				request.setAttribute("naverLoginUser", m);
		    				request.getRequestDispatcher("views/member/enrollForm.jsp").forward(request, response);
		    			}
		    	        
		    	    } catch (Exception e) {
		    	    	e.printStackTrace();
		    	    }
		    	}
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


private static String get(String apiUrl1, Map<String, String> requestHeaders){
    HttpURLConnection con = connect(apiUrl1);
    try {
        con.setRequestMethod("GET");
        for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
            con.setRequestProperty(header.getKey(), header.getValue());
        }


        int responseCode = con.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
            return readBody(con.getInputStream());
        } else { // 에러 발생
            return readBody(con.getErrorStream());
        }
    } catch (IOException e) {
        throw new RuntimeException("API 요청과 응답 실패", e);
    } finally {
        con.disconnect();
    }
}


private static HttpURLConnection connect(String apiUrl){
    try {
        URL url = new URL(apiUrl);
        return (HttpURLConnection)url.openConnection();
    } catch (MalformedURLException e) {
        throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
    } catch (IOException e) {
        throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
    }
}


private static String readBody(InputStream body){
    InputStreamReader streamReader = new InputStreamReader(body);


    try (BufferedReader lineReader = new BufferedReader(streamReader)) {
        StringBuilder responseBody = new StringBuilder();


        String line;
        while ((line = lineReader.readLine()) != null) {
            responseBody.append(line);
        }


        return responseBody.toString();
    } catch (IOException e) {
        throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
    }
}

public String uniToKor(String uni){
    StringBuffer result = new StringBuffer();
    
    for(int i=0; i<uni.length(); i++){
        if(uni.charAt(i) == '\\' &&  uni.charAt(i+1) == 'u'){    
            Character c = (char)Integer.parseInt(uni.substring(i+2, i+6), 16);
            result.append(c);
            i+=5;
        }else{
            result.append(uni.charAt(i));
        }
    }
    return result.toString();
}
}
