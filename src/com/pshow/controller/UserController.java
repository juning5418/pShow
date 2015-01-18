package com.pshow.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pshow.pojo.User;
import com.pshow.service.UserService;
import com.pshow.utils.DwzAjaxDone;
import com.pshow.utils.PSHOW;
import com.pshow.utils.StringUtil;

@Controller
@RequestMapping("/")
public class UserController extends DwzAjaxDone {

	@Autowired
	private UserService userService;

	// 用户列表
	@RequestMapping("user_list")
	public String userList(Model model, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String userName = request.getParameter("userName");// 用户名称
		String pgNum = request.getParameter("pageNum");// 跳转页
		String orderField = request.getParameter("orderField");// 排序字段
		String orderDirection = request.getParameter("orderDirection");// 排序方式
		int pageNum = 1;
		if (!StringUtil.isNullOrEmpty(pgNum)) {
			pageNum = Integer.parseInt(pgNum);
		}
		if (!StringUtil.isNullOrEmpty(userName)) {
			map.put("userName", userName);
			request.setAttribute("userName", userName);
		}
		if (!StringUtil.isNullOrEmpty(orderField)) {
			map.put("orderField", orderField);
			request.setAttribute("orderField", orderField);
		}
		if (!StringUtil.isNullOrEmpty(orderDirection)) {
			map.put("orderDirection", orderDirection);
			request.setAttribute("orderDirection", orderDirection);
		}
		int totalCount = userService.queryUserCount(map);

		if (totalCount > 0) {
			map.put("start", (pageNum - 1) * 20);
			map.put("limit", 20);
			model.addAttribute("userList", userService.queryUser(map));
		}
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("totalCount",totalCount);
		return "/jsp/user_list";
	}

	// 跳转至修改密码页面
	@RequestMapping(value = "edit_password", method = RequestMethod.GET)
	public String toEditPassword(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("user", userService.loadUser(user));
		return "/jsp/edit_password";
	}

	// 修改密码
	@RequestMapping(value = "edit_password", method = RequestMethod.POST)
	public String editPassword(@ModelAttribute("user") User user, Model model) {
		if (!userService.editUser(user)) {
			return ajaxForwardError("修改失败");
		}
		return ajaxForwardSuccess("修改成功!");
	}

	// 跳转至修改页面
	@RequestMapping(value = "edit_user", method = RequestMethod.GET)
	public String toEditUser(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("user", userService.loadUser(user));
		return "/jsp/edit_user";
	}

	// 修改用户
	@RequestMapping(value = "edit_user", method = RequestMethod.POST)
	public String editUser(@ModelAttribute("user") User user, Model model) {
		if (!userService.editUser(user)) {
			return ajaxForwardError("修改失败");
		}
		return ajaxForwardSuccess("修改成功!");
	}

	// 删除用户
	@RequestMapping("del_user")
	public String delUser(@ModelAttribute("user") User user) {
		if (!userService.delUser(user)) {
			return ajaxForwardError("修改失败");
		}
		return ajaxForwardSuccess("修改成功!");
	}

	@RequestMapping(value = "add_user", method = RequestMethod.GET)
	public String toAddUser() {
		return "/jsp/add_user";
	}

	// 新增用户
	@RequestMapping(value = "add_user", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user, Model model) {
		if (!userService.addUser(user)) {
			return ajaxForwardError("增加失败");
		}
		return ajaxForwardSuccess("增加成功!");
	}

	// 验证用户名
	@RequestMapping(value = "verify_user_name", method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String verifyUserName(@ModelAttribute("user") User user, Model model) {
		if(userService.loadUser(user) != null)return "false";
		return "true";
	}

	// 跳到登录页面
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}

	// 登录
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, Model model,
			HttpServletRequest request) {
		if (user != null) {
			User u = new User();
			u.setUserName(user.getUserName());
			u = userService.loadUser(u);// 根据用户名查询用户
			if (u != null && u.getPassword().equals(user.getPassword())) {
				request.getSession().setAttribute(PSHOW.LOGIN_USER, u);// 将登录用户信息保存至session中
				return "redirect:/index";
			}
		}
		model.addAttribute("loginMsg", "用户名或密码错误");
		return "/login";
	}

	// 首页
	@RequestMapping("index")
	public String index() {
		return "/index";
	}

	// 注销登录
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute(PSHOW.LOGIN_USER);// 清除登录用户session
		return "/login";
	}
}
