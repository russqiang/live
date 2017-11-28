package com.j1703.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.j1703.service.AnchorService;
import com.j1703.service.ClassifyService;
import com.j1703.service.UserService;
import com.j1703.vo.Anchor;
import com.j1703.vo.Classify;
import com.j1703.vo.User;


@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private AnchorService anchorService;
	
	@Autowired
	private ClassifyService classifyService;
	
	
	//上传图片
	@RequestMapping(value="uploadPic.do")
	public void uploadPic(@RequestParam(required = true) MultipartFile pic,HttpServletResponse response) throws IOException{
		String url = userService.uploadPic(pic.getBytes(), pic.getOriginalFilename(), pic.getSize());
		JSONObject json = new JSONObject();
		json.put("url", url);
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().write(json.toString());
	}
	
	//	个人中心
	@RequestMapping(value = "personCenter.do")
	public String personCenter(Model model) {
		
		return "personcenter";
	}
	//	申请主播
	@RequestMapping(value = "becomeAnchor.do")
	public String becomeAnchor(Model model) {
		List<Classify> allClassify = classifyService.getAllClassify();
		model.addAttribute("allClassify", allClassify);
		return "becomeAnchor";
	}
	//	我的订阅
	@RequestMapping(value = "subscription.do")
	public String subscription(Model model,String focusList) {
		
		List<Anchor> anchorByLiveCode = anchorService.getAnchorByLiveCode(focusList);
		model.addAttribute("anchorByLiveCode", anchorByLiveCode);
		return "subscription";
	}
	//	更改信息
	@RequestMapping(value = "changeinfo.do")
	public String changeinfo(Model model) {
		return "changeinfo";
	}
	
	// AJAX提交用户登录
	@RequestMapping(value = "login.do", method = { RequestMethod.POST })
	public void login(User u , HttpSession session ,HttpServletResponse response) {
		
		User exitsUser = userService.userLogin(u);
		if (exitsUser != null) {
			session.setAttribute("exitsUser", exitsUser);
			try {
				response.getWriter().write("1");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				response.getWriter().write("0");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	
	// AJAX提交用户注册
	@RequestMapping(value = "register.do", method = { RequestMethod.POST })
	public void register(User user, HttpSession session,HttpServletResponse response) {
		
		boolean b = userService.userRegist(user);
		
		try {
			if (b) {
				session.setAttribute("user", user);
				response.getWriter().write(1);
			}else {
				response.getWriter().write(0);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	
	//  AJAX验证用户手机号是否可用
	@RequestMapping(value = "checkPhone.do", method = { RequestMethod.POST } )
	public void checkPhone(User u, HttpServletResponse response) {
		// 插入数据库
		User user = userService.userLogin(u);
		try {
			if (user == null) {
				response.getWriter().write(1);
			}else {
				response.getWriter().write(0);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//用户退出登录
	@RequestMapping(value = "logout.do")
	public void logout(HttpSession session ,HttpServletResponse response ) {
		System.out.println("退出登录");
		session.removeAttribute("exitsUser");
		try {
			response.getWriter().write("");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "focus.do")
	public void focus(Anchor anchor, User user, HttpServletResponse response, HttpSession session) {
		// 主播被关注功能实现
		anchorService.focus(anchor);
		// 用户关注主播功能实现
		User u = userService.focus(anchor, user);
		// 更新session中用户的focusList
		System.err.println("exitsUser---"+u);
		session.setAttribute("exitsUser", u);
		try {
			response.getWriter().write("1");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
	@RequestMapping(value = "updateUser.do")
	public String updateUser(User user,Model model) {
		// 用户关注主播功能实现
		userService.updateUser(user);
		User exitsUser = userService.getUserById(user);
		// 更新session中用户的focusList
		model.addAttribute("exitsUser", exitsUser);
		return "index";
		
	}
	
	@RequestMapping(value = "cancelFocus.do")
	public void cancelFocus(Anchor anchor, User user, HttpServletResponse response,HttpSession session) {
		// 主播被关注功能实现
		anchorService.focus(anchor);
		// 用户关注主播功能实现
		User u = userService.cancelFocus(anchor, user);
		// 更新session中用户的focusList
		System.err.println("exitsUser---"+u);
		session.setAttribute("exitsUser", u);
		try {
			response.getWriter().write("1");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
