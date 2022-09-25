package com.spring.myweb.Service.UserService;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.myqwb.VO.WithdrawalVO.WithdrawalVO;
import com.spring.myweb.DAO.UserDAO.UserDAO;
import com.spring.myweb.MailUtil.MailHandler;
import com.spring.myweb.MailUtil.TempKey;
import com.spring.myweb.VO.MyMannerVO.MyMannerVO;
import com.spring.myweb.VO.ReportVO.ReportVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO userDAO;
	
	@Autowired
    JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public List<UserVO> selectAll() {
		return userDAO.selectAll();
	}

	@Override
	public UserVO select(String id) {
		return userDAO.select(id);
	}

	@Override
	public int insertUser(UserVO vo) throws Exception{
		String mail_key = new TempKey().getKey(30,false); //랜덤키 길이 설정
        vo.setMail_key(mail_key);

        //회원가입
        userDAO.insertUser(vo);
        userDAO.updateMailKey(vo);

        //회원가입 완료하면 인증을 위한 이메일 발송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[PaprikaMarket 인증메일 입니다.]"); //메일제목
        sendMail.setText(
                "<h1>PaprikaMarket 메일인증</h1>" +
                "<br>PaprikaMarket에 오신것을 환영합니다!" +
                "<br>아래 [이메일 인증 확인]을 눌러주세요." +
                "<br><a href='http://localhost:8080/myweb/rEmail.do?email=" + vo.getEmail() +
                "&mail_key=" + mail_key +
                "' target='_blank'>이메일 인증 확인</a>");
        		
        sendMail.setFrom("junkyu970307@gmail.com", "파프리카마켓");
        sendMail.setTo(vo.getEmail());
        sendMail.send();
		return userDAO.insertUser(vo);
	}

	@Override
	public String getAccessToken(String authroize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
	        
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	        
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	        
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
	        
			sb.append("&client_id=808d349080855e826b4c4cb8c77a836d"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/myweb/kakaoLogin.do"); // 본인이 설정한 주소
	        
			sb.append("&code=" + authroize_code);
			bw.write(sb.toString());
			bw.flush();
	        
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
	        
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
	        
			while ((line = br.readLine()) != null) {
				result += line;
			}
	        
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
	        
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	        
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	@Override
	public void kakaoLogout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	@Override
	public void unlink(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		userDAO.kakaoinsert(userInfo);
	}

	@Override
	public UserVO getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			String img_url="";
			int start = result.indexOf("profile_image")+16;
			int end = result.indexOf("thumbnail_image")-3;
			img_url = result.substring(start,end);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("profile_image", img_url);
			String password = "PASSWORD";
	        password = passwordEncoder.encode(password);
	        userInfo.put("password",password);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// catch 아래 코드 추가.
		UserVO result = userDAO.findkakao(userInfo);
		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
		System.out.println("S:" + result);

		//Authentication auth = new UsernamePasswordAuthenticationToken(reqURL, result);
		//System.out.println("AUTH = "+auth);
        //SecurityContextHolder.getContext().setAuthentication(auth);
		
		
		if(result==null) {
		// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
			userDAO.kakaoinsert(userInfo);
			// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
			return userDAO.findkakao(userInfo);
			// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
			//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
		} else {
			if(result.getProfile_image() != userInfo.get("profile_image")) {
				result.setProfile_image((String)userInfo.get("profile_image"));
			}
			return result;
			// 정보가 이미 있기 때문에 result를 리턴함.
		}
        
	}

	@Override
	public UserVO findkakao(HashMap<String, Object> userInfo) {
		return userDAO.findkakao(userInfo);
	}

	@Override
	public int locationInsert(UserVO vo) {
		return userDAO.locationInsert(vo);
	}

	@Override
	public int idCheck(String id){
		int result = 0;
		UserVO vo = userDAO.select(id);
		if(vo==null) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}

	@Override
	public int emailCheck(String email) {
		int result = 0;
		result = userDAO.emailCheck(email);
		return result;
	}

	@Override
	public int nicknameCheck(String nickname) {
		int result = 0;
		result = userDAO.nicknameCheck(nickname);
		return result;
	}
	
	@Override
	public int phoneCheck(String phone) {
		int result = 0;
		result = userDAO.phoneCheck(phone);
		return result;
	}

	@Override
	public int reloadUser(UserVO vo) {
		return userDAO.reloadUser(vo);
	}
	
	@Override
	public int updateProfile(UserVO vo) {
		return userDAO.updateProfile(vo);
	}

	@Override
	public int updateMailKey(UserVO vo) throws Exception {
		return userDAO.updateMailKey(vo);
	}

	@Override
	public int updateMailAuth(UserVO vo) throws Exception {
		return userDAO.updateMailAuth(vo);
	}

	@Override
	public int emailAuthFail(String id) throws Exception {
		 return userDAO.emailAuthFail(id);
	}

	@Override
	public int updatePw(UserVO vo) throws Exception {
		String mail_key = new TempKey().getKey(30,false); //랜덤키 길이 설정
		vo.setPassword(mail_key);
        //회원가입 완료하면 인증을 위한 이메일 발송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[PaprikaMarket 임시비밀번호 입니다.]"); //메일제목
        sendMail.setText(
                "<h1>PaprikaMarket 임시비밀번호</h1>" +
                "<br>아래 [임시비밀번호]로 로그인 후 마이페이지에서 수정바랍니다." +
                "<br>" + vo.getPassword());
        sendMail.setFrom("junkyu970307@gmail.com", "PaprikaMarket");
		String securePwd = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(securePwd);
        sendMail.setTo(vo.getEmail());
        sendMail.send();
		return userDAO.updatePw(vo);
	}

	@Override
	public int updatePay(UserVO vo) throws Exception {
		return userDAO.updatePay(vo);
	}

	@Override
	public void withdrawal(UserVO vo) throws Exception {
		userDAO.withdrawal(vo);
		}
		
	public UserVO selectByUserSeq(int user_seq) {
		return userDAO.selectByUserSeq(user_seq);
	}

	@Override
	public int WithdrawalReason(WithdrawalVO vo) throws Exception {
		return userDAO.WithdrawalReason(vo);
	}

	@Override
	public int evaluation(MyMannerVO vo) throws Exception {
		return userDAO.evaluation(vo);
	}

	@Override
	public int repNo(int user_seq) throws Exception {
		return userDAO.repNo(user_seq);
	}

	

}
