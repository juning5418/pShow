package com.pshow.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pshow.pojo.Tracking;
import com.pshow.service.TrackingService;
import com.pshow.utils.DwzAjaxDone;
import com.pshow.utils.StringUtil;

@Controller
@RequestMapping("/")
public class TrackingController extends DwzAjaxDone {

	@Autowired
	private TrackingService trackingService;

	// 项目追踪记录列表
	@RequestMapping("tracking_list")
	public String trackingList(Model model, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String title = request.getParameter("title");// 项目追踪记录名称
		String pgNum = request.getParameter("pageNum");// 跳转页
		String orderField = request.getParameter("orderField");// 排序字段
		String orderDirection = request.getParameter("orderDirection");// 排序方式
		String projectId = request.getParameter("projectId");
		int pageNum = 1;
		if (!StringUtil.isNullOrEmpty(projectId)) {
			map.put("projectId", projectId);
		}
		if (!StringUtil.isNullOrEmpty(pgNum)) {
			pageNum = Integer.parseInt(pgNum);
		}
		if (!StringUtil.isNullOrEmpty(title)) {
			map.put("trackingName", title);
			request.setAttribute("trackingName", title);
		}
		int totalCount = trackingService.queryTrackingCount(map);

		if (totalCount > 0) {
			if (!StringUtil.isNullOrEmpty(orderField)) {
				map.put("orderField", orderField);
				System.out.println(map.get("orderField")+"===");
				request.setAttribute("orderField", orderField);
			}
			if (!StringUtil.isNullOrEmpty(orderDirection)) {
				map.put("orderDirection", orderDirection);
				System.out.println(map.get("orderDirection")+"===");
				request.setAttribute("orderDirection", orderDirection);
			}
			
			map.put("start", (pageNum - 1) * 20);
			map.put("limit", 20);
			model.addAttribute("trackingList",
					trackingService.queryTracking(map));
		}
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("projectId", projectId);
		return "/jsp/tracking_list";
	}

	// 跳转至修改页面
	@RequestMapping(value = "edit_tracking", method = RequestMethod.GET)
	public String toEditTracking(@ModelAttribute("tracking") Tracking tracking,
			Model model) {
		model.addAttribute("tracking", trackingService.loadTracking(tracking));
		return "/jsp/edit_tracking";
	}

	// 修改项目追踪记录
	@RequestMapping(value = "edit_tracking", method = RequestMethod.POST)
	public String editTracking(@ModelAttribute("tracking") Tracking tracking,
			Model model) {
		if (!trackingService.editTracking(tracking)) {
			return ajaxForwardError("修改失败");
		}
		return ajaxForwardSuccess("修改成功!");
	}

	// 删除项目追踪记录
	@RequestMapping("del_tracking")
	public String delTracking(@ModelAttribute("tracking") Tracking tracking) {
		if (!trackingService.delTracking(tracking)) {
			return ajaxForwardError("修改失败");
		}
		return ajaxForwardSuccess("修改成功!");
	}

	@RequestMapping(value = "add_tracking", method = RequestMethod.GET)
	public String toAddTracking(@ModelAttribute("tracking") Tracking tracking,
			Model model) {
		model.addAttribute(tracking);
		return "/jsp/add_tracking";
	}

	// 新增项目追踪记录
	@RequestMapping(value = "add_tracking", method = RequestMethod.POST)
	public String addTracking(@ModelAttribute("tracking") Tracking tracking,
			Model model) {
		if (!trackingService.addTracking(tracking)) {
			return ajaxForwardError("增加失败");
		}
		return ajaxForwardSuccess("增加成功!");
	}

}
